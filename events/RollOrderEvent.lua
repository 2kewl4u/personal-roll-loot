-- namespace
local _, ns = ...;
-- imports
local Events = ns.Events
local RollOrder = ns.RollOrder
local utils = ns.utils

local EVENT_ID = "RollOrderEvent"

---
-- The RollOrderEvent contains the roll order of the current roll item and is broadcasted from the
-- raid or party leader to each member.
-- 
local RollOrderEvent = {
    -- the eventId to identify the event type
    eventId = EVENT_ID,
    -- the receiver of the event message
    receiver,
    -- the roll order to be sent
    rollOrder
}
RollOrderEvent.__index = RollOrderEvent
ns.RollOrderEvent = RollOrderEvent

---
-- Creates a new RollOrderEvent with the given roll order.
-- 
-- @param #string receiver
--          the name of the receiver of the event
-- @param #RollOrder rollOrder
--          the roll order of the current roll item
-- 
-- @return #RollOrderEvent
--          the new event
-- 
function RollOrderEvent.new(receiver, rollOrder)
    local self = setmetatable({}, RollOrderEvent)
    self.receiver = receiver
    self.rollOrder = rollOrder
    return self
end

---
-- Encodes this RollOrderEvent into a string representation to be
-- serialized. The string can be decoded back into the event using the
-- decode() function.
-- 
-- @return #string
--          the encoded event
--  
function RollOrderEvent:encode()
    local event = self
    return event.rollOrder:encode()
end

---
-- Decodes the given string containing the previously encoded event data
-- or returns nil in case the event could not be decoded.
-- 
-- @param #string encoded
--          the encoded event string
-- 
-- @return #RollOrderEvent
--          the event read from the encoded data or nil
-- 
function RollOrderEvent.decode(encoded)
    if (encoded) then
        local rollOrder = RollOrder.decode(encoded)
        if (rollOrder) then
            return RollOrderEvent.new(nil, rollOrder)
        end
    end
end

---
-- Sends a RollOrderEvent with the given roll order to all players in the party or raid group.
-- 
-- @param #RollOrder rollOrder
--          the roll order of the current item
-- 
function RollOrderEvent.broadcast(rollOrder)
    local instance = ns.DB.INSTANCE_LIST[ns.DB.activeInstance]
    if (instance) then
        ns.RollSystem.setRollOrder(rollOrder)
        utils.sendGroupMessage(rollOrder.item:getLink())

        utils.forEachRaidMember(function(name)
            local player = ns.DB.PLAYER_LIST[name]
            if (player) then
                if (instance.players[name]) then
                    Events.sent(RollOrderEvent.new(name, rollOrder))
                else
                    print("> Player '"..name.."' is not invited to the currently active instance.")
                end
            else
                print("> Player '"..name.."' is not registered for Personal Roll Loot.")
            end
        end)
    else
        print("> No active instance.")
    end
end

---
-- The event handler is called when a RollOrderEvent is received.
-- 
-- The received roll order will be displayed in the MemberUI.
-- 
ns.eventHandler[EVENT_ID] = function(message, sender)
    if (message and IsInGroup() and utils.isGroupLeader(sender)) then
        -- local playerName = UnitName("player")
        local event = RollOrderEvent.decode(message)
        if (event) then
            ns.MemberUI.setRollOrder(event.rollOrder)
        end
    end
end
