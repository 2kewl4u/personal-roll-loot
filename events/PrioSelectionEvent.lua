-- namespace
local _, ns = ...;
-- imports
local Events = ns.Events
local ITEM_LIST = ns.ITEM_LIST
local Players = ns.Players
local utils = ns.utils

local EVENT_ID = "PrioSelectionEvent"

---
-- The PrioSelectionEvent is sent to the raid or party leader to specify the
-- players selected priority items.
-- 
local PrioSelectionEvent = {
    -- the eventId to identify the event type
    eventId = EVENT_ID,
    -- the receiver of the event message
    receiver,
    -- a list of itemIds of selected priority items
    prioItems
}
PrioSelectionEvent.__index = PrioSelectionEvent
ns.PrioSelectionEvent = PrioSelectionEvent

---
-- Creates a new PrioSelectionEvent with the given receiver and the new
-- priority items.
-- 
-- @param #string receiver
--          the receiver of the event, should be the raid leader
-- @param #list prioItems
--          a list of itemIds of selected priority items
-- 
-- @return #PrioSelectionEvent
--          the new event
-- 
function PrioSelectionEvent.new(receiver, prioItems)
    local self = setmetatable({}, PrioSelectionEvent)
    self.receiver = receiver
    self.prioItems = prioItems or {}
    return self
end

---
-- Encodes this PrioSelectionEvent into a string representation to be
-- serialized. The string can be decoded back into the event using the
-- decode() function.
-- 
-- @return #string
--          the encoded event
--
function PrioSelectionEvent:encode()
    local event = self
    local encodedPrioItems = utils.toCSV(event.prioItems, function(index, itemId)
        return tostring(itemId)
    end)
    return encodedPrioItems
end

---
-- Decodes the given string containing the previously encoded event data
-- or returns nil in case the event could not be decoded.
-- 
-- @param #string encoded
--          the encoded event string
-- 
-- @return #PrioSelectionEvent
--          the event read from the encoded data or nil
-- 
function PrioSelectionEvent.decode(encoded)
    if (encoded) then
        local prioItems = {}
        utils.fromCSV(encoded, function(l, element)
            local itemId = tonumber(element)
            if (itemId and ITEM_LIST[itemId]) then
                table.insert(prioItems, itemId)
            end
        end)
        
        return PrioSelectionEvent.new(nil, prioItems)
    end
end

---
-- Sends a PrioSelectionEvent to the raid or party leader to specify the
-- desired priority items.
-- 
-- @param #list prioItems
--          a list of itemIds of selected priority items
-- 
function PrioSelectionEvent.send(prioItems)
    -- only send request to raid/group leader
    if (prioItems and IsInGroup()) then
        local name = utils.getRaidLeader()
        if (name) then
            Events.sent(PrioSelectionEvent.new(name, prioItems))
        end
    end
end

---
-- The event handler is called when a RoleSelectionEvent is received.
-- 
-- If the message is valid and the sender is registered as a player, the
-- roles within the event will be applied to the player.
-- 
ns.eventHandler[EVENT_ID] = function(message, sender)
    local event = PrioSelectionEvent.decode(message)
    Players.selectPrioItems(sender, event)
end
