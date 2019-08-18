-- namespace
local _, ns = ...;
-- imports
local utils = ns.utils

local ITEM_LIST = ns.ITEM_LIST

---
-- The roll order for a specific item contains a round based list of players
-- that have a specific item on their instance priority list.
-- 
local RollOrder = {
    item,
    -- list of {round, playerName} pairs
    rounds
}
RollOrder.__index = RollOrder
ns.RollOrder = RollOrder

---
-- Creates a new RollOrder for the given item with the given list of rounds.
-- Note that this method is intended to be used internally to create a
-- RollOrder instance. Use RollOrder.of(instance, item) instead.
-- 
-- @param #Item item
--          the item for which this is the roll order
-- @param #table rounds
--          a list of {round, playerName} pairs specifying the order
-- 
-- @return #RollOrder
--          the roll order
-- 
function RollOrder.new(item, rounds)
    local self = setmetatable({}, RollOrder)
    self.item = item
    self.rounds = rounds or {}
    return self
end

---
-- Creates a new RollOrder for the given item dropped within the given instance.
-- 
-- @param #Instance instance
--          the instance where the item dropped
-- @param #Item item
--          the item that dropped
--          
-- @return #RollOrder
--          the roll order for the item
-- 
function RollOrder.of(instance, item)
    if (instance and item) then
        local itemId = item.itemId
        local round = 1
        local roll
        local rounds = {}
        repeat
            roll = false
            for name, lootlist in pairs(instance.players) do
                local lootId = lootlist[round]
                if (lootId) then
                    -- keep on rolling
                    roll = true
                    if (itemId == lootId) then
                        table.insert(rounds, { round, name })
                    end
                end
            end
            round = round + 1
        until(not roll)
        return RollOrder.new(item, rounds)
    end
end

---
-- Encodes this RollOrder into a string representation to be serialized. The
-- string can be decoded back into the RollOrder using the decode() function.
-- 
-- @return #string
--          the encoded roll order
--          
function RollOrder:encode()
    local rollOrder = self
    local ordercsv = utils.toCSV(rollOrder.rounds, function(index, round)
        return round[1].."-"..round[2]
    end)
    return rollOrder.item.itemId..":"..ordercsv
end

---
-- Decodes the given string containing the previously encoded roll order data
-- or nil in case the roll order could not be decoded.
-- 
-- @param #string encoded
--          the encoded roll order string
-- 
-- @return #RollOrder
--          the roll order read from the encoded data or nil
--          
function RollOrder.decode(encoded)
    local itemId, rollOrderCSV = strsplit(":", encoded)
    itemId = tonumber(itemId)
    if (itemId) then
        local item = ITEM_LIST[itemId]
        if (item) then
            local rounds = utils.fromCSV(rollOrderCSV, function(list, element)
                local round, playerName = strsplit("-", element)
                round = tonumber(round)
                if (playerName and round) then
                    table.insert(list, { round, playerName })
                end
            end)
            return RollOrder.new(item, rounds or {})
        end
    end
end

---
-- Prints the roll order to the console output.
-- 
function RollOrder:print()
    local rollOrder = self
    print("> Roll order for '"..rollOrder.item:getName().."'")
    for index, round in pairs(rollOrder.rounds) do
        print("   "..round[1].." - "..round[2])
    end
end