-- namespace
local _, ns = ...;
-- imports
local Items = ns.Items
local Raids = ns.Raids
local utils = ns.utils

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