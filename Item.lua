-- namespace
local _, ns = ...;

---
-- The item contains the roles, classes and raids information for a particular
-- item.
--
local Item = {
    -- the unique identifier for the item
    itemId,
    -- the name of the item
    name,
    -- a texture used to display the item
    texture,
    -- a set of roles assigned to this item
    roles,
    -- a set of classes that can use this item
    classes,
    -- a set of raids where this item drops
    raids
}
Item.__index = Item
ns.Item = Item

---
-- Loads the item information into the given item, e.g. the localized name and
-- the texture.
--
-- @param #Item item
--          the item to load the item information into
--
local function load(item)
    if (not item.loaded) then
        local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType,
            itemSubType, itemStackCount, itemEquipLoc, itemTexture,
            itemSellPrice = GetItemInfo(item.itemId)
        if (itemName) then
            item.name = itemName
            item.texture = itemTexture
            item.loaded = true
        else
            item.texture = 134400
        end
    end
end

---
-- Creates a new Item with the given item information from the 'ITEM_LIST'.
--
-- @param #table itemInfo
--          the item information
--
-- @return #Item
--          the item
--
function Item.fromInfo(itemInfo)
    local self = setmetatable(itemInfo, Item)
    return self
end

---
-- Returns the localized name of the item.
--
-- @return #string
--          the name of the item
--
function Item:getName()
    local item = self
    load(item)
    return item.name
end

---
-- Returns the texture path for the item.
--
-- @return #number
--          the texture path
--
function Item:getTexture()
    local item = self
    load(item)
    return item.texture
end

---
-- Indicates whether the given class can use this item.
--
-- @param #string class
--          the class constant, e.g. WARRIOR
--
-- @return #boolean
--          true if the class can use this item, nil otherwise
--
function Item:isForClass(class)
    local item = self
    if (class and item.classes[class]) then
        return true
    end
end

---
-- Indicates whether the this item drops in the given instance.
--
-- @param #Instance instance
--          the instance to check for
--
-- @return #boolean
--          true if this item drops in the instance, nil otherwise
--
function Item:dropsIn(instance)
    local item = self
    if (instance) then
        return item.raids[instance.raid]
    end
end

---
-- Returns the priority for this item for the given player or returns
-- nil if the player has no priority.
-- 
-- @param #Player player
--          the player to retrieve the priority on this item
--          
-- @return #number
--          the priority or nil
--          
function Item:getPriority(player)
    local item = self
    -- first class priority
    local classPriority = item.classes[player.class]
    if (classPriority) then
        -- get the best role priority
        local rolePriority
        for role, prio in pairs(item.roles) do
            if (player.roles[role]) then
                if (rolePriority) then
                    rolePriority = min(rolePriority, prio)
                else
                    rolePriority = prio
                end
            end
        end
        -- take the lowest prio from class or role
        if (rolePriority) then
            return max(classPriority, rolePriority)
        end
    end
end


