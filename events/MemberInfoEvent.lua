-- namespace
local _, ns = ...;
-- imports
local Events = ns.Events
local Player = ns.Player

local EVENT_ID = "MemberInfoEvent"

---
-- The MemberInfoEvent contains the player data of a particular player and is sent from the group
-- or raid leader to inform about the current player setting.
-- 
-- This event is typically sent as a response to a MemberInfoRequestEvent.
-- 
local MemberInfoEvent = {
    -- the eventId to identify the event type
    eventId = EVENT_ID,
    -- the receiver of the event message
    receiver,
    -- the player with the info to be sent
    player
}
MemberInfoEvent.__index = MemberInfoEvent
ns.MemberInfoEvent = MemberInfoEvent


---
-- Creates a new MemberInfoEvent containing the player data of the given player.
-- 
-- @param #Player player
--          the player data to be sent
-- 
-- @return #MemberInfoEvent
--          the new event
-- 
function MemberInfoEvent.new(player)
    local self = setmetatable({}, MemberInfoEvent)
    self.receiver = player.name
    self.player = player
    return self
end

---
-- Encodes this MemberInfoEvent into a string representation to be
-- serialized. The string can be decoded back into the event using the
-- decode() function.
-- 
-- @return #string
--          the encoded event
-- 
function MemberInfoEvent:encode()
    local event = self
    return event.player:encode()
end

---
-- Decodes the given string containing the previously encoded event data
-- or returns nil in case the event could not be decoded.
-- 
-- @param #string encoded
--          the encoded event string
-- 
-- @return #MemberInfoEvent
--          the event read from the encoded data or nil
-- 
function MemberInfoEvent.decode(encoded)
    if (encoded) then
        local player = Player.decode(encoded)
        if (player) then
            return MemberInfoEvent.new(player)
        end
    end
end

---
-- Sends the member info of the player with the given name.
-- 
-- @param #string name
--          the player name to sent its member info
-- 
function MemberInfoEvent.send(name)
    -- only announce if you are the raid/group leader
    if (IsInGroup() and UnitIsGroupLeader("player")) then
        local player = ns.DB.PLAYER_LIST[name]
        if (player) then
            Events.sent(MemberInfoEvent.new(player))
        else
            print("> Player '"..name.."' is not registered for Personal Roll Loot.")
        end
    end
end

---
-- The event handler is called when a MemberInfoEvent is received.
-- 
-- Updates the MemberUI with the new player info.
-- 
ns.eventHandler[EVENT_ID] = function(message, sender)
    -- only accept announcements from raid/group leader
    if (message and IsInGroup() and utils.isGroupLeader(sender)) then
        local event = MemberInfoEvent.decode(message)
        if (event) then
            ns.MemberUI.setMemberInfo(event.player)
        end
    end
end
