-- namespace
local _, ns = ...;
-- imports
local ITEM_LIST = ns.ITEM_LIST
local RAIDS = ns.RAIDS
local utils = ns.utils

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

-- TODO return true or nil depending on if the player was created or not
function Instance:addPlayer(player, force)
    local instance = self
    if ((not instance.players[player.name]) or force) then
        instance.players[player.name] = createLootList(instance, player)
        return true
    end
end


ns.Instance = Instance
