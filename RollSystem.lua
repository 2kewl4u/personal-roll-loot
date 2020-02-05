-- namespace
local _, ns = ...;
-- imports

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