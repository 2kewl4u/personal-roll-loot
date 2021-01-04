-- namespace
local _, ns = ...;
-- imports
local ConfirmDialog = ns.ConfirmDialog
local Items = ns.Items
local Raids = ns.Raids
local RollTypes = ns.RollTypes
local utils = ns.utils

local ROLL_NEED = "need"
local ROLL_GREED = "greed"
local ROLL_PASS = "pass"
local ROLL_REMOVE = "remove"

local RollSystem = {
    -- the roll order for the current item distribution
    currentRollOrder,
    -- a map[playerName -> rollType] of the received answers to roll requests
    responses,
    -- if the item has been assigned
    assigned = false
}
ns.RollSystem = RollSystem

function RollSystem.setRollOrder(rollOrder)
    RollSystem.currentRollOrder = rollOrder
    RollSystem.responses = {}
    RollSystem.assigned = false
end

local function getLootSlotIndex(item)
    local lootCount = GetNumLootItems()
    for slotIndex = 1, lootCount do
        if (LootSlotHasItem(slotIndex)) then
            local itemLink = GetLootSlotLink(slotIndex)
            if (itemLink) then
                local itemId = GetItemInfoInstant(itemLink)
                if (item.itemId == itemId) then
                    return slotIndex
                end
            end
        end
    end
end

local function getLootCandidateIndex(slotIndex, playerName)
    for raidIndex = 1, 50 do
        local candidate = GetMasterLootCandidate(slotIndex, raidIndex)
        if (candidate) then
            if (candidate == playerName) then
                return raidIndex
            end
        else
            break -- no more candidates
        end
    end
end

local function assign(item, playerName)
    if (utils.isMasterLooter(UnitName("player"))) then
        local slotIndex = getLootSlotIndex(item)
        if (slotIndex) then
            local raidIndex = getLootCandidateIndex(slotIndex, playerName)
            if (raidIndex) then
                -- prompt for item assignment
                ns.ConfirmDialog.open("Assign "..item:getLink().." to '"..playerName.."'?", function(result)
                    if (result) then
                        GiveMasterLoot(slotIndex, raidIndex)
                    end
                end)
            end
        end
    end
end

local function findWinnerByRollType(rollType)
    local currentRollOrder = RollSystem.currentRollOrder
    local candidates = {}
    local winRound
    for index, entry in ipairs(currentRollOrder.rounds) do
        local round = entry[1]
        -- take only the highest win round
        if (winRound and round > winRound) then
            break
        end
        local playerName = entry[2]
        local response = RollSystem.responses[playerName]
        if (response and response == rollType) then
            table.insert(candidates, playerName)
            winRound = round
        end
    end

    -- roll between all candidates
    if (#candidates > 0) then
        local pos = math.random(1, #candidates)
        return candidates[pos]
    end
end

local function announceWinner()
    local currentRollOrder = RollSystem.currentRollOrder
    local item = currentRollOrder.item
    for i, rollType in ipairs(RollTypes) do
        local winner = findWinnerByRollType(rollType)
        if (winner) then
            utils.sendGroupMessage(winner.." wins "..item:getLink())
            assign(item, winner)
            return
        end
    end
    
    ns.ConfirmDialog.open("No candidates on the priority list are active. Assign '"..item:getLink().."' randomly?", function(result)
        if (result) then
            RollSystem.rollCurrentItem()
        end
    end)
end

function RollSystem.evaluateResponse(event)
    local currentRollOrder = RollSystem.currentRollOrder
    if (currentRollOrder and event and
        not RollSystem.responses[event.sender] and
        currentRollOrder.item.itemId == event.itemId) then
        
        RollSystem.responses[event.sender] = event.rollType

        -- remove the unwanted item from the list
        if (event.rollType == ROLL_REMOVE) then
            local player = ns.DB.PLAYER_LIST[event.sender]
            if (player) then
                Items.removeFromPlayer(player, currentRollOrder.item)
            end
        end

        -- evaluate the response
        local missingResponse = false
        local need = false
        local currentRound
        for index, entry in ipairs(currentRollOrder.rounds) do
            local round = entry[1]
            -- break with the first need
            if (need and currentRound and round > currentRound) then
                break
            end
            currentRound = round
            
            local playerName = entry[2]
            local response = RollSystem.responses[playerName]
            local player = ns.DB.PLAYER_LIST[playerName]
            if (not response and player and
                player.needlist[currentRollOrder.item.itemId] and
                utils.isInRaid(playerName)) then
                missingResponse = true
                break
            elseif (response == ROLL_NEED) then
                need = true
            end
        end
        
        if (not missingResponse and not RollSystem.assigned) then
            RollSystem.assigned = true
            announceWinner()
        end
    end
end

function RollSystem.initEvaluation()
    local itemId = RollSystem.currentRollOrder.item.itemId
    local event = ns.RollResponseEvent.new("", itemId, "pass")
    event.sender = ""
    RollSystem.evaluateResponse(event)
end

local function assignToRandomPlayer(slotIndex)
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

function RollSystem.rollCurrentItem()
    if (Raids.isInRaidInstance() and utils.isMasterLooter(UnitName("player"))) then
        local item = RollSystem.currentRollOrder.item
        local slotIndex = getLootSlotIndex(item)
        if (slotIndex) then
            assignToRandomPlayer(slotIndex)
        end
    end
end
