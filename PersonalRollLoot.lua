-- namespace
local _, ns = ...;
-- imports
local Instances = ns.Instances
local ITEM_LIST = ns.ITEM_LIST
local Items = ns.Items
local Players = ns.Players
local Raids = ns.Raids
local Roles = ns.Roles
local utils = ns.utils

local MasterUI = ns.MasterUI
local MemberUI = ns.MemberUI

-- ------------------------------------------------------- --
-- slash commands                                          --
-- ------------------------------------------------------- --
local COMMANDS = {
    ["add-player"] = Players.add,
    ["remove-player"] = Players.remove,

    ["player-info"] = function(arg)
        local player = Players.get(arg)
        if (player) then
            player:print()
        end
    end,

    ["add-role"] = function(arg)
        arg = arg or ""
        local arg1, arg2 = strsplit(" ", arg, 2)
        local player = Players.get(arg1)
        if (player) then
            local name = player.name
            local role = arg2
            if (Roles.checkRoleId(role)) then
                -- add role to player
                player.roles[role] = true
                print("> Added role '"..role.."' to player '"..name.."'.")
            end
        end
    end,

    ["remove-role"] = function(arg)
        arg = arg or ""
        local arg1, arg2 = strsplit(" ", arg, 2)
        local player = Players.get(arg1)
        if (player) then
            local name = player["name"]
            local role = arg2
            if (Roles.checkRoleId(role)) then
                -- remove role from player
                player["roles"][role] = nil
                print("> Removed role '"..role.."' from player '"..name.."'.")
            end
        end
    end,

    ["add-item"] = function(arg)
        arg = arg or ""
        local arg1, arg2 = strsplit(" ", arg, 2)
        local player = Players.get(arg1)
        if (player) then
            local item = Items.get(arg2)
            if (item) then
                -- add item to player
                if (not player:addItem(item)) then
                    error("> Item '"..item.name.."' ("..item.itemId..") is not assigned to the class '"..player.class.."'.", 0)
                end
                print("> Added item '"..item.name.."' ("..item.itemId..") to player '"..player.name.."'.")
            end
        end
    end,

    ["remove-item"] = function(arg)
        arg = arg or ""
        local arg1, arg2 = strsplit(" ", arg, 2)
        local player = Players.get(arg1)
        if (player) then
            local item = Items.get(arg2)
            if (item) then
                local name = player.name

                -- remove item from player
                if (player:removeItem(item)) then
                    print("> Removed item '"..item.name.."' ("..item.itemId..") from player '"..name.."'.")
                else
                    print("> The item '"..item.name.."' ("..item.itemId..") was not on the need-list for player '"..name.."'.")
                end
            end
        end
    end,

    ["create-instance"] = function(arg)
        arg = arg or ""
        local name, raidName = strsplit(" ", arg, 2)
        Instances.create(name, raidName)
    end,
    ["delete-instance"] = Instances.delete,

    ["instance-info"] = function(arg)
        -- no arguments, print all instances
        if (not arg) then
            local empty = true
            for name,instance in pairs(ns.DB.INSTANCE_LIST) do
                instance:print()
                empty = false
            end
            if (empty) then print("> No instances found.") end
        else
            local instance = Instances.get(arg)
            if (instance) then
                instance:print()
            end
        end
    end,

    ["active-instance"] = Instances.activate,
    ["invite"] = Instances.invite,
    ["roll"] = function(arg)
        local rollOrder = Instances.roll(arg)
        if (rollOrder) then
            rollOrder:print()
        end
    end
}

-- ------------------------------------------------------- --
-- register the slash commands and call the command table  --
-- ------------------------------------------------------- --
SLASH_PersonalRollLootMember1 = "/prl"
SLASH_PersonalRollLootMember2 = "/personal"
SlashCmdList["PersonalRollLootMember"] = function(s)
    MemberUI.toggleUI()
end
SLASH_PersonalRollLootMaster1 = "/prlm"
SLASH_PersonalRollLootMaster2 = "/personalmaster"
SlashCmdList["PersonalRollLootMaster"] = function(s)
    local cmd, args = strsplit(" ", s, 2)
    local c = COMMANDS[cmd]
    if c then
        local status, err = pcall(c, args)
        if (not status) then print(err) end
    else
        -- no command specified, open the UI
        MasterUI.toggleUI()
    end
end

-- ------------------------------------------------------- --
-- event handling                                          --
-- ------------------------------------------------------- --
local function updateLootItems()
    if (IsInGroup()) then
        local lootItems = Items.getLootItems()

        if (UnitIsGroupLeader("player")) then
            -- add the items to the loot history of the current instance
            if (ns.DB.activeInstance) then
                local instance = ns.DB.INSTANCE_LIST[ns.DB.activeInstance]
                if (instance) then
                    for itemId, item in pairs(lootItems) do
                        instance:addItem(item)
                    end
                end
            end
        end
        -- update the UI
        MasterUI.setLootItems(lootItems)
        MemberUI.setLootItems(lootItems)
    end
end

local function getItemNameFromChat(msg)
    if (msg) then
        local firstPart, itemName, lastPart
        firstPart, itemName = strsplit("[", msg, 2)
        if (firstPart and itemName) then
            itemName, lastPart = strsplit("]", itemName, 2)
            if (itemName and lastPart) then
                return itemName
            end
        end
    end
end

local function parseLootMessage(msg, member)
    if (msg and member) then
        -- remove the realm part from the member
        local playerName = strsplit("-", member, 2)
        local player = ns.DB.PLAYER_LIST[playerName]
        if (player) then
            local itemName = getItemNameFromChat(msg)
            if (itemName) then
                local item = Items.forName(itemName)
                Items.removeFromPlayer(player, item)
            end
        end
    end
end

local function inspectTarget()
    local unit = "target"
    local playerName = UnitName(unit)
    if (playerName) then
        local player = ns.DB.PLAYER_LIST[playerName]
        if (player and CheckInteractDistance(unit,1) and CanInspect(unit)) then
            for i = 1, 24 do
                local itemId = GetInventoryItemID(unit, i)
                if (itemId) then
                    local item = ITEM_LIST[itemId]
                    Items.removeFromPlayer(player, item)
                end
            end
        end
    end
end

local function rollJunkItems()
    -- check that master loot is enabled and the player is the master looter
    if (ns.DB.options.rollJunkItems and
        Raids.isInRaidInstance() and
        utils.isMasterLooter(UnitName("player"))
        ) then
        
        local lootCount = GetNumLootItems()
        for slotIndex = 1, lootCount do
            if (LootSlotHasItem(slotIndex)) then
                local itemLink = GetLootSlotLink(slotIndex)
                if (itemLink) then
                    local itemId = GetItemInfoInstant(itemLink)
                    -- filter junk items
                    if (Items.isJunk(itemId)) then
                        local lootIcon, lootName, lootQuantity, _, rarity, locked,
                            isQuestItem, questId, isActive = GetLootSlotInfo(slotIndex)
                        -- we roll out greens and blues only
                        if (rarity == 2 or rarity == 3) then
                            local candidates = {}
                            for raidIndex = 1, 50 do
                                local candidate = GetMasterLootCandidate(slotIndex, raidIndex)
                                if (candidate) then
                                    table.insert(candidates, raidIndex)
                                else
                                    break -- no more candidates
                                end
                            end
                            if (#candidates > 0) then
                                local pos = math.random(1, #candidates)
                                local rndIndex = candidates[pos]
                                GiveMasterLoot(slotIndex, rndIndex)
                            end
                        end
                    end
                end
            end
        end
    end
end

-- for testing
local test
SLASH_PersonalRollLootTest1 = "/test"
SlashCmdList["PersonalRollLootTest"] = function(s) test(s) end
test = function()
    print("test function")
end


-- create an event frame
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("VARIABLES_LOADED")
eventFrame:RegisterEvent("INSPECT_READY")
eventFrame:RegisterEvent("CHAT_MSG_LOOT")
eventFrame:RegisterEvent("LOOT_OPENED")
eventFrame:RegisterEvent("LOOT_SLOT_CLEARED")
function eventFrame:OnEvent(event, arg1, arg2, arg3, arg4, arg5, ...)
    if (event == "VARIABLES_LOADED") then
        ns.loadSavedVariables()
    elseif (event == "LOOT_OPENED" or event == "LOOT_SLOT_CLEARED") then
        updateLootItems()
        rollJunkItems()
    elseif (event == "CHAT_MSG_LOOT") then
        -- arg5 "playerName2" - Name of player who received the loot
        parseLootMessage(arg1, arg5)
    elseif (event == "INSPECT_READY") then
        inspectTarget()
    end
end
eventFrame:SetScript("OnEvent", eventFrame.OnEvent)

print("Addon loaded... PersonalRollLoot "..GetAddOnMetadata("PersonalRollLoot", "Version"))
