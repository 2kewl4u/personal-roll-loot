-- namespace
local _, ns = ...;
-- imports
local Events = ns.Events
local utils = ns.utils

local EVENT_ID = "SyncRequestEvent"

---
-- The SyncRequestEvent is sent to request the raid or party leaders player configuration and
-- synchronize it with the current configuration.
-- 
-- There might be a lot of data transfered, so there is a delay before a new request can be sent.
-- 
local SyncRequestEvent = {
    -- the eventId to identify the event type
    eventId = EVENT_ID,
    -- the receiver of the event message
    receiver
}
SyncRequestEvent.__index = SyncRequestEvent
ns.SyncRequestEvent = SyncRequestEvent

---
-- Creates a new SyncRequestEvent with the given receiver name.
-- 
-- @param #string receiver
--          the name of the receiver of the event
-- 
-- @return #SyncRequestEvent
--          the new event
-- 
function SyncRequestEvent.new(receiver)
    local self = setmetatable({}, SyncRequestEvent)
    self.receiver = receiver    
    return self
end

---
-- Encodes this SyncRequestEvent into a string representation to be
-- serialized. The string can be decoded back into the event using the
-- decode() function.
-- 
-- @return #string
--          the encoded event
--   
function SyncRequestEvent:encode()
    return "all"
end

---
-- Decodes the given string containing the previously encoded event data
-- or returns nil in case the event could not be decoded.
-- 
-- @param #string encoded
--          the encoded event string
-- 
-- @return #SyncRequestEvent
--          the event read from the encoded data or nil
-- 
function SyncRequestEvent.decode(encoded)
    if (encoded) then
        return SyncRequestEvent.new(nil)
    end
end

-- set a delay in seconds until sending again a sync request or info
local SYNC_DELAY = 30
local syncRequestTimes = {}

---
-- Checks whether the given sender or receiver of the event is allowed to receive another event.
-- The delay is necessary since a lot of data will be transfered.
-- 
-- @param #string sender
--          the sender or receiver of the event
-- 
-- @return #boolean
--          true if the sender is blocked, false if the sender is allowed to receive an event
--
local function isSyncDelay(sender)
    sender = strsplit("-", sender, 2)
    local lastSent = syncRequestTimes[sender]
    local now = time()
    local delay = lastSent and ((now - lastSent) < SYNC_DELAY)
    if (not delay) then
        syncRequestTimes[sender] = now
    end
    return delay
end

---
-- Sends a SyncRequestEvent to the raid or party leader.
-- 
function SyncRequestEvent.send()
        -- only send request to raid/group leader
    if (IsInGroup() and not UnitIsGroupLeader("player")) then
        if (isSyncDelay(UnitName("player"))) then
            print("> Cannot send to many synchronize requests. Please wait "..SYNC_DELAY.." seconds.")
        else
            local name = utils.getRaidLeader()
            if (name) then
                print("> Requesting synchronize from party leader '"..name.."'.")
                Events.sent(SyncRequestEvent.new(name))
            end
        end
    end
end

---
-- The event handler is called when a SyncRequestEvent is received.
-- 
-- Responds with a SyncInfoEvent if the sender is allowed to receive another response.
-- 
ns.eventHandler[EVENT_ID] = function(message, sender)
    if (not isSyncDelay(sender)) then
        print("> Got synchronize request from member '"..sender.."'.")
        ns.SyncInfoEvent.send(sender)
    end
end
