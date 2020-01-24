-- namespace
local _, ns = ...;
-- imports
local Events = ns.Events
local utils = ns.utils

local EVENT_ID = "MemberInfoRequestEvent"

---
-- The MemberInfoRequestEvent is sent to request the member info of the current player from the
-- raid or party leader.
-- 
local MemberInfoRequestEvent = {
    -- the eventId to identify the event type
    eventId = EVENT_ID,
    -- the receiver of the event message
    receiver,
    -- the name of the player to request the member info for
    playerName
}
MemberInfoRequestEvent.__index = MemberInfoRequestEvent
ns.MemberInfoRequestEvent = MemberInfoRequestEvent

---
-- Creates a new MemberInfoRequestEvent with the given receiver and the player name for which to
-- request the member info for.
-- 
-- @param #string receiver
--          the name of the receiver of the event
-- @param #string playerName
--          the name of the player for which to receive the member info for
-- 
-- @return #MemberInfoRequestEvent
--          the new event
-- 
function MemberInfoRequestEvent.new(receiver, playerName)
    local self = setmetatable({}, MemberInfoRequestEvent)
    self.receiver = receiver
    self.playerName = playerName
    return self
end

---
-- Encodes this MemberInfoRequestEvent into a string representation to be
-- serialized. The string can be decoded back into the event using the
-- decode() function.
-- 
-- @return #string
--          the encoded event
-- 
function MemberInfoRequestEvent:encode()
    local event = self
    return event.playerName
end

---
-- Decodes the given string containing the previously encoded event data
-- or returns nil in case the event could not be decoded.
-- 
-- @param #string encoded
--          the encoded event string
-- 
-- @return #MemberInfoRequestEvent
--          the event read from the encoded data or nil
-- 
function MemberInfoRequestEvent.decode(encoded)
    if (encoded) then
        return MemberInfoRequestEvent.new(nil, encoded)
    end
end

---
-- Sends a MemberInfoRequestEvent to the raid or party leader requesting the current players
-- member information.
-- 
function MemberInfoRequestEvent.send()
    if (IsInGroup()) then
        local raidLeader = utils.getRaidLeader()
        local playerName = UnitName("player")
        Events.sent(MemberInfoRequestEvent.new(raidLeader, playerName))
    end
end

---
-- The event handler is called when a MemberInfoRequestEvent is received.
-- 
-- The request event will simply be answered with a MemberInfoEvent.
-- 
ns.eventHandler[EVENT_ID] = function(message, sender)
    ns.MemberInfoEvent.send(sender)
end
