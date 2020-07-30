-- namespace
local _, ns = ...;

-- imports
local ITEM_LIST = ns.ITEM_LIST
local Items = ns.Items
local Raids = ns.Raids
local utils = ns.utils

-- the idle time when the remembered player list will be reseted
local RESET_TIME = 21600 -- 6 hours

local BIND_ON_PICKUP = 1
local BIND_ON_EQUIP = 2
local ITEM_RARITY_COMMON = 2
local ITEM_RARITY_RARE = 3

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("LOOT_OPENED")
eventFrame:RegisterEvent("LOOT_SLOT_CLEARED")
eventFrame:RegisterEvent("CHAT_MSG_LOOT")

-- the items that have recently been assigned via master loot
local lootItems = {}


---
-- Indicates whether the junk roll feature is enabled and the current player
-- is 'master looter'.
-- 
-- @return #boolean
--          true if the feature is enabled, false otherwise
-- 
local function rollJunkEnabled()
    return ns.DB.options.rollJunkItems
           --and Raids.isInRaidInstance()
           and utils.isMasterLooter(UnitName("player"))
end

---
-- Returns whether the item with the given itemId is considered a 'junk' or
-- 'trash' item.
--
-- @param #number itemId
--          the itemId of the item to be checked
--
-- @return #boolean
--          true if the item is a junk item, false otherwise
--
local function isJunk(itemId)
    if (not itemId or ITEM_LIST[itemId]) then
        return false
    end

    local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType,
        itemSubType, itemStackCount, itemEquipLoc, itemIcon, itemSellPrice,
        itemClassID, itemSubClassID, bindType, expacID, itemSetID,
        isCraftingReagent = GetItemInfo(itemId)

    if (bindType == BIND_ON_PICKUP) then
        return false
    end

    -- should be common or rare quality
    if (itemRarity == ITEM_RARITY_COMMON or itemRarity == ITEM_RARITY_RARE) then
        -- see also https://wow.gamepedia.com/ItemType
        if (-- junk class
            (itemClassID == 15 and itemSubClassID == 0) or
            -- trade goods
            (itemClassID == 7 and itemSubClassID == 0) or
            -- bags
            (itemClassID == 1 and itemSubClassID == 0) or
            -- green reagent
            (itemClassID == 5 and itemSubClassID == 0 and itemRarity == 2) or
            -- books
            (itemClassID == 9 and itemSubClassID == 0) or
            -- not bound quest items
            (itemClassID == 12 and bindType == 0)
            ) then
            return true
        end
        -- exclude recipes
        if (itemClassID == 9) then
            return false
        end
        
        if (bindType == BIND_ON_EQUIP) then
            return true
        end
    end
    return false
end

---
-- Indicates whether the item with the given itemId is a Hakkari Bijou.
-- 
-- @param #number itemId
--          the itemId of the item to be checked
-- 
-- @return #boolean
--          true if the item is a bijou, false otherwise
-- 
local function isHakkariBijou(itemId)
    return itemId and itemId >= 19707 and itemId <= 19715
end

---
-- Indicates whether the item with the given itemId is a Hakkari Coin.
-- 
-- @param #number itemId
--          the itemId of the item to be checked
-- 
-- @return #boolean
--          true if the item is a coin, false otherwise
-- 
local function isHakkariCoin(itemId)
    return itemId and itemId >= 19698 and itemId <= 19706
end

---
-- Indicates whether the item with the given itemId is a Scarab from Ahn'Qiraj.
-- 
-- @param #number itemId
--          the itemId of the item to be checked
-- 
-- @return #boolean
--          true if the item is a scarab, false otherwise
-- 
local function isAhnQirajScarab(itemId)
    return itemId and itemId >= 20858 and itemId <= 20865
end

---
-- Indicates whether the item with the given itemId is an Idol from Ahn'Qiraj.
-- 
-- @param #number itemId
--          the itemId of the item to be checked
-- 
-- @return #boolean
--          true if the item is an idol, false otherwise
-- 
local function isAhnQirajIdol(itemId)
    return itemId and itemId >= 20866 and itemId <= 20879
end

---
-- Returns an item classification string for the item with the given itemId.
-- Items that are within the same category will have a separate checklist.
-- 
-- @param #number itemId
--          the itemId of the item
-- 
-- @return #string
--          the item category
-- 
local function getItemCategory(itemId)
    if (isHakkariBijou(itemId)) then
        return "bijou"
    end
    if (isHakkariCoin(itemId)) then
        return "coin"
    end
    if (isAhnQirajScarab(itemId)) then
        return "scarab"
    end
    if (isAhnQirajIdol(itemId)) then
        return "idol"
    end
    
    local itemName, itemLink, itemRarity = GetItemInfo(itemId)
    if (itemName) then
        return "junk"..tostring(itemRarity)
    else
        return "junk"
    end
end

---
-- Returns or creates a checklist to remember players that have already
-- received an item.
-- 
-- @param #number itemId
--          the itemId to categorize different checklists
-- 
-- @return #set
--          a set of player names that recently received loot
-- 
local function getCheckList(itemId)
    -- create a different checklist for each raid instance
    local raid = Raids.getCurrentInstance() or "none"
    local raidList = ns.DB.junkCheckList[raid]
    if (not raidList) then
        raidList = { updated = time() }
        ns.DB.junkCheckList[raid] = raidList
    else
        -- reset outdated checklists
        local time = time()
        if (time - raidList.updated > RESET_TIME) then
            wipe(raidList)
        end
        raidList.updated = time
    end
    
    -- create a different checklist for each item category
    local category = getItemCategory(itemId)
    local categoryList = raidList[category]
    if (not categoryList) then
        categoryList = {}
        raidList[category] = categoryList
    end
    
    return categoryList    
end

---
-- Returns all candidates to receive the item from the given loot slot index.
-- 
-- The returned list contains maps with each two attributes:
-- name - the name of the candidate
-- raidIndex - the candidate index in the master loot assignment window
-- 
-- @param #number slotIndex
--          the index of the item in the loot window
-- 
-- @return #list
--          a list of candidates that are eligible to receive the loot
-- 
local function getLootCandidates(slotIndex)
    local candidates = {}
    for raidIndex = 1, 50 do
        local playerName = GetMasterLootCandidate(slotIndex, raidIndex)
        if (playerName) then
            table.insert(candidates, {
                name = playerName,
                raidIndex = raidIndex
            })
        end
    end
    return candidates
end

---
-- Returns a random candidate to receive an item, taking into account players
-- that recently received loot and are on the checklist.
-- 
-- The returned map contains two attributes:
-- name - the name of the candidate
-- raidIndex - the candidate index in the master loot assignment window
-- 
-- @param #number slotIndex
--          the index of the item in the loot window
-- @param #number itemId
--          the itemId of the item to be assigned
-- 
-- @return #map
--          the candidate that shall receive the loot
-- 
local function getLootCandidate(slotIndex, itemId)
    local candidates = getLootCandidates(slotIndex)
    
    -- check who already got loot and filter them out
    local checkList = getCheckList(itemId)
    local filteredCandidates = {}
    for index, candidate in pairs(candidates) do
        if (not checkList[candidate.name]) then
            table.insert(filteredCandidates, candidate)
        end        
    end
    
    if (#filteredCandidates > 0) then
        return utils.randomElement(filteredCandidates)
    else
        -- no more candidates left without loot, so take again all candidates
        wipe(checkList)
        return utils.randomElement(candidates)
    end
end

---
-- Assigns an item to a random player that was eligible for loot, taking into
-- account players that recently received loot and are on the checklist.
-- 
-- @param #number slotIndex
--          the index of the item in the loot window
-- @param #number itemId
--          the itemId of the item to be assigned
--  
local function rollItem(slotIndex, itemId)
    local candidate = getLootCandidate(slotIndex, itemId)
    if (candidate) then
        -- remember the item
        lootItems[slotIndex] = {
            playerName = candidate.name,
            itemId = itemId
        }
        GiveMasterLoot(slotIndex, candidate.raidIndex)
    end
end

---
-- Checks the current loot window for junk items to be rolled to raid or party
-- members.
-- 
-- This method is called when a "LOOT_OPENED" event occurs. Note that only the
-- first item found will be assigned. When the item was confirmed by either the
-- "LOOT_SLOT_CLEARED" or the "CHAT_MSG_LOOT" events, this method is called
-- again to check for more junk items.
-- 
local function rollJunkItems()
    local lootCount = GetNumLootItems()
    for slotIndex = 1, lootCount do
        if (LootSlotHasItem(slotIndex)) then
            local itemLink = GetLootSlotLink(slotIndex)
            if (itemLink) then
                local itemId = GetItemInfoInstant(itemLink)
                -- filter junk items
                if (isJunk(itemId)) then
                    rollItem(slotIndex, itemId)
                    -- roll only the first item
                    break
                end
            end
        end
    end
end

---
-- Adds the given loot assignment to the checklist.
-- 
-- @param #string playerName
--          the name of the player that received loot
-- @param #number itemId
--          the itemId of the item that the player got
-- 
local function addToCheckList(playerName, itemId)
    local checkList = getCheckList(itemId)
    checkList[playerName] = true
end

---
-- This method is called when the loot window opens, indicated by the
-- "LOOT_OPENED" event.
-- 
local function lootOpened()
    if (rollJunkEnabled()) then
        -- reset looted item list
        lootItems = {}
        rollJunkItems()
    end
end

---
-- This method is called when an item was cleared from the loot window,
-- indicated by the "LOOT_SLOT_CLEARED" event.
-- 
-- Note that in case the master looter closes the loot window too quickly, this
-- event might not occur. As a backup, the chat messages will be observed as
-- well.
-- 
-- @param #number slotIndex
--          the index in the loot window where the item was cleared
-- 
local function lootSlotCleared(slotIndex)
    local loot = lootItems[slotIndex]
    if (loot) then
        -- clear the loot slot
        lootItems[slotIndex] = nil
        addToCheckList(loot.playerName, loot.itemId)
        -- trigger the roll of the next items
        rollJunkItems()
    end
end

---
-- This method is called when a chat message contains a loot assignment,
-- indicated by the "CHAT_MSG_LOOT" event.
-- 
-- Note that this event is not triggered when the player that received the loot
-- is out of range, thus is not reliable to know for sure that a player got an
-- item. It serves as a backup method in case that the "LOOT_SLOT_CLEARED" did
-- not occur.
-- 
-- @param #string msg
--          the loot message
-- @param #string receiver
--          the name of the player the received the loot
-- 
local function chatMsgLoot(msg, receiver)
    if (rollJunkEnabled() and not utils.tblempty(lootItems)) then
        receiver = strsplit("-", receiver, 2)
        local itemName = Items.getItemNameFromChat(msg)
        if (itemName) then
            -- check if we find an item
            for slotIndex, loot in pairs(lootItems) do
                local name = GetItemInfo(loot.itemId)
                if (itemName == name) then
                    lootSlotCleared(slotIndex)
                    break
                end
            end
        end
    end
end

eventFrame:SetScript("OnEvent", function(frame, event, arg1, arg2, arg3, arg4, arg5, ...)
    if (event == "LOOT_OPENED") then
        lootOpened()
    elseif (event == "LOOT_SLOT_CLEARED") then
        lootSlotCleared(arg1)
    elseif (event == "CHAT_MSG_LOOT") then
        chatMsgLoot(arg1, arg2)
    end
end)
