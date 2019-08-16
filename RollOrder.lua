-- namespace
local _, ns = ...;
-- imports
local utils = ns.utils

local ITEM_LIST = ns.ITEM_LIST

local RollOrder = {
    item,
    -- list of {round, playerName} pairs
    rounds
}
RollOrder.__index = RollOrder
ns.RollOrder = RollOrder

function RollOrder.new(item, rounds)
    local self = setmetatable({}, RollOrder)
    self.item = item
    self.rounds = rounds or {}
    return self
end

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

function RollOrder:encode()
    local rollOrder = self
    local ordercsv = utils.toCSV(rollOrder.rounds, function(index, round)
        return round[1].."-"..round[2]
    end)
    return rollOrder.item.itemId..":"..ordercsv
end

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
            -- TODO sort the roll order
            return RollOrder.new(item, rounds or {})
        end
    end
end

function RollOrder:print()
    local rollOrder = self
    print("> Roll order for '"..rollOrder.item:getName().."'")
    for index, round in pairs(rollOrder.rounds) do
        print("   "..round[1].." - "..round[2])
    end
end