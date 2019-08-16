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
    players
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
    return self
end

function Instance.copy(instance)
    local copy = setmetatable({}, Instance)
    copy.name = instance.name
    copy.raid = instance.raid
    copy.created = instance.created
    copy.players = {}
    for name, list in pairs(instance.players) do
        copy.players[name] = utils.copy(list)
    end
    return copy
end

local function createLootList(instance, player)
    local items = {}
    -- create a loot list
    for itemId, item in pairs(ITEM_LIST) do
        if (item.raids[instance.raid] and player:needsItem(item)) then
            table.insert(items, itemId)
        end
    end
    -- shuffle the items
    items = utils.shuffle(items)
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
    if ((not instance.players[player.name]) or force) then
        instance.players[player.name] = createLootList(instance, player)
        return true
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

