local _, ns = ...;
-- imports
local Events = ns.Events
local Items = ns.Items
local utils = ns.utils

local ROLL_NEED = "need"
local ROLL_GREED = "greed"
local ROLL_PASS = "pass"
local ROLL_REMOVE = "remove"

local EVENT_ID = "RollResponseEvent"

---
-- The RollResponseEvent is sent as a response to the RollRequestEvent containing the decision of
-- the player if he or she needs the item or not.
-- 
local RollResponseEvent = {
    -- the eventId to identify the event type
    eventId = EVENT_ID,
    -- the receiver of the event message
    receiver,
    -- the itemId of the item that will be rolled on
    itemId,
    -- the selected roll type of the member
    rollType
}
RollResponseEvent.__index = RollResponseEvent
ns.RollResponseEvent = RollResponseEvent

---
-- Creates a new RollResponseEvent with the itemId of the roll item and the roll type decision of
-- the player.
-- 
-- @param #string receiver
--          the receiver of the event
-- @param #number itemId
--          the itemId of the item to be rolled on
-- @param #string rollType
--          the type of roll (e.g. need, greed, pass, remove)
-- 
-- @return #RollResponseEvent
--          the new event
-- 
function RollResponseEvent.new(receiver, itemId, rollType)
    local self = setmetatable({}, RollResponseEvent)
    self.receiver = receiver
    self.itemId = itemId
    self.rollType = rollType
    return self
end

---
-- Encodes this RollResponseEvent into a string representation to be
-- serialized. The string can be decoded back into the event using the
-- decode() function.
-- 
-- @return #string
--          the encoded event
--  
function RollResponseEvent:encode()
    local event = self
    return event.itemId..":"..event.rollType
end

---
-- Decodes the given string containing the previously encoded event data
-- or returns nil in case the event could not be decoded.
-- 
-- @param #string encoded
--          the encoded event string
-- 
-- @return #RollResponseEvent
--          the event read from the encoded data or nil
-- 
function RollResponseEvent.decode(encoded)
    if (encoded) then
        local itemId, rollType = strsplit(":", encoded, 2)
        itemId = tonumber(itemId)
        if (itemId and rollType) then
            return RollResponseEvent.new(nil, itemId, rollType)
        end
    end
end

---
-- Sends a RollResponseEvent to the raid or party leader with the given player's choice for the item
-- with the given itemId.
-- 
-- @param #Item item
--          the item to be rolled on
-- @param #string rollType
--          the type of roll (e.g. need, greed, pass, remove)
-- 
function RollResponseEvent.send(item, rollType)
    local raidLeader = utils.getRaidLeader()
    if (raidLeader and item and rollType) then
        utils.sendGroupMessage(rollType.." - "..item:getLink())
        Events.sent(RollResponseEvent.new(raidLeader, item.itemId, rollType))
    end    
end

---
-- The event handler is called when a RollResponseEvent is received.
-- 
-- If a player chooses need and all responses for that round were received, the roll process stops.
-- Otherwise a new RollRequestEvent wave is sent to all players of the next round.
-- 
-- Additionally, when a player chooses remove, the item will be removed from his or her need-list.
-- 
ns.eventHandler[EVENT_ID] = function(message, sender)
    local currentRollOrder = ns.RollSystem.currentRollOrder
    if (currentRollOrder) then
        local event = RollResponseEvent.decode(message)
        if (event and currentRollOrder.item.itemId == event.itemId) then
            ns.RollSystem.responses[sender] = event.rollType

            -- remove the unwanted item from the list
            if (event.rollType == ROLL_REMOVE) then
                local player = ns.DB.PLAYER_LIST[sender]
                if (player) then
                    Items.removeFromPlayer(player, currentRollOrder.item)
                end
            end

            -- evaluate the response
            local missingResponse = false
            local need = false
            for index, entry in ipairs(currentRollOrder.rounds) do
                local round = entry[1]
                if (round == ns.RollSystem.currentRound) then
                    local playerName = entry[2]
                    local response = ns.RollSystem.responses[playerName]
                    if (not response and utils.isInRaid(playerName)) then
                        missingResponse = true
                        break
                    elseif (response == ROLL_NEED) then
                        need = true
                    end
                elseif (round > ns.RollSystem.currentRound) then
                    break
                end
            end

            -- trigger the next rolling
            if (not missingResponse and not need) then
                ns.RollRequestEvent.send()
            end
        end
    end
end
