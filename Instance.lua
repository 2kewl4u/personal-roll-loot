-- namespace
local _, ns = ...;
-- imports
local ITEM_LIST = ns.ITEM_LIST
local RAIDS = ns.RAIDS
local utils = ns.utils

---
-- The instance represents a raid ID to preserve the priority lists for each
-- player invited to the raid.
-- 
local Instance = {
    -- the name of the instance
    name,
    -- the name of the raid, e.g. Molten Core
    raid,
    -- the date and time this instance was created
    created,
    -- a map of player names pointing to their priority lists
    players,
    -- a set of items that dropped in the instance so far
    history
}
Instance.__index = Instance
ns.Instance = Instance

---
-- Creates a new Instance with the given name and raid.
-- 
-- @param #string name
--          the name of the instance
-- @param #string raid
--          the name of the raid, e.g. Molten Core
-- 
-- @return #Instance
--          the new Instance
--          
function Instance.new(name, raid)
    local self = setmetatable({}, Instance)
    self.name = name
    self.raid = raid
    self.created = date("%y-%m-%d %H:%M:%S")
    self.players = {}
    self.history = {}
    return self
end

---
-- Creates a new Instance based on the contents of the given instance.
-- 
-- @param #Instance instance
--          the instance to be copied
-- 
-- @return #Instance
--          the copy of the instance, not nil
-- 
function Instance.copy(instance)
    local copy = setmetatable({}, Instance)
    copy.name = instance.name
    copy.raid = instance.raid
    copy.created = instance.created
    copy.history = utils.copy(instance.history) or {}
    copy.players = {}
    for name, list in pairs(instance.players) do
        copy.players[name] = utils.copy(list)
    end
    return copy
end

---
-- Creates the random priority loot list for the given player and instance.
-- Every item that can drop in the given raid instance, is on the players
-- need-list and corresponds to the players class and role will be added to the
-- list. Finally the order of the items in the list will be shuffled.
-- 
-- @param #Instance instance
--          the instance the player is attending
-- @param #Player player
--          the player to create the list for
-- 
-- @return #table
--          the list of items for the player
-- 
local function createLootList(instance, player)
    -- the items per priority
    local itemsPerPriority = {}
    -- create a loot list
    for itemId, item in pairs(ITEM_LIST) do
        if (item.raids[instance.raid] and player:needsItem(item)) then
            local priority = item:getPriority(player)
            local items = itemsPerPriority[priority] or {}
            table.insert(items, itemId)
            itemsPerPriority[priority] = items
        end
    end
    
    -- shuffle the items
    for prio, items in pairs(itemsPerPriority) do
        itemsPerPriority[prio] = utils.shuffle(items)
    end
    
    -- concatenate the item lists
    local items = {}
    for i = 1, 10, 1 do
        local prioItems = itemsPerPriority[i]
        if (prioItems) then
            for index, itemId in ipairs(prioItems) do
                table.insert(items, itemId)
            end
        end
    end
    return items
end

---
-- Adds the given player to this instance. This will automatically create the
-- priority list for the player.
-- Does nothing if the player is already present in this instance. However, if
-- the given force flag is set to true, the player will be re-added and the
-- priority list is shuffled again.
-- 
-- @param #Player player
--          the player to be added to the instance
-- @param #boolean force
--          if the player should be re-added
-- 
-- @return #boolean
--          true if the player was added to the instance, nil otherwise
-- 
function Instance:addPlayer(player, force)
    local instance = self
    if (player) then
        if ((not instance.players[player.name]) or force) then
            instance.players[player.name] = createLootList(instance, player)
            return true
        end
    end
end

---
-- Adds the given item to the loot history of this instance. Does nothing
-- if the item is already present.
-- 
-- @param #Item item
--          the item to be added
-- 
function Instance:addItem(item)
    local instance = self
    if (item) then
        instance.history[item.itemId] = true
    end
end

---
-- Prints the instance information to the console output.
-- 
function Instance:print()
    local instance = self
    print("> Instance '"..instance.name.."':")
    print("  Raid: '"..instance.raid.."'")
    print("  created: "..instance.created)
end

