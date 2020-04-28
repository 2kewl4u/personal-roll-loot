-- namespace
local _, ns = ...;
-- imports
local ConfirmDialog = ns.ConfirmDialog
local Items = ns.Items
local Raids = ns.Raids
local utils = ns.utils

local ROLL_NEED = "need"
local ROLL_GREED = "greed"
local ROLL_PASS = "pass"
local ROLL_REMOVE = "remove"

local RollSystem = {
    -- the roll order for the current item distribution
    currentRollOrder,
    -- the current round of the role request
    currentRound,
    -- the index in the roll order that was already sent to the members
    sentIndex,
    -- a map[playerName -> rollType] of the received answers to roll requests
    responses
}
ns.RollSystem = RollSystem

function RollSystem.setRollOrder(rollOrder)
    RollSystem.currentRollOrder = rollOrder
    -- prepare protocol
    RollSystem.sentIndex = 1
    RollSystem.responses = {}
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
    local rollTypes = { ROLL_NEED, ROLL_GREED, ROLL_PASS, ROLL_REMOVE }
    for i, rollType in ipairs(rollTypes) do
        local winner = findWinnerByRollType(rollType)
        if (winner) then
            local currentRollOrder = RollSystem.currentRollOrder
            utils.sendGroupMessage(winner.." wins "..currentRollOrder.item:getLink())
            assign(currentRollOrder.item, winner)
            break
        end
    end
end

function RollSystem.evaluateResponse(event)
    local currentRollOrder = RollSystem.currentRollOrder
    if (currentRollOrder and event and
        not utils.tblempty(currentRollOrder.rounds) and
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
        local currentRound = RollSystem.currentRound
        for index, entry in ipairs(currentRollOrder.rounds) do
            local round = entry[1]
            if (round == currentRound) then
                local playerName = entry[2]
                local response = RollSystem.responses[playerName]
                if (not response and utils.isInRaid(playerName)) then
                    missingResponse = true
                    break
                elseif (response == ROLL_NEED) then
                    need = true
                end
            elseif (round > currentRound) then
                break
            end
        end

        -- trigger the next rolling
        if (not missingResponse) then
            local sentEvent
            if (not need) then
                sentEvent = ns.RollRequestEvent.send()
            end
            if (need or not sentEvent) then
                announceWinner()
            end
        end
    end
end

function RollSystem.rollJunkItems()
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
