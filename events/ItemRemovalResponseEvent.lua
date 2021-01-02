-- namespace
local _, ns = ...;
-- imports
local Events = ns.Events
local Players = ns.Players

local EVENT_ID = "ItemRemovalResponseEvent"

---
-- The ItemRemovalResponseEvent is sent as a response to the
-- ItemRemovalRequestEvent in case the item was successfully removed from the
-- players need-list.
-- 
local ItemRemovalResponseEvent = {
    -- the eventId to identify the event type
    eventId = EVENT_ID,
    -- the receiver of the event message
    receiver,
    -- the itemId of the item that was removed
    itemId
}
ItemRemovalResponseEvent.__index = ItemRemovalResponseEvent
ns.ItemRemovalResponseEvent = ItemRemovalResponseEvent

---
-- Creates a new ItemRemovalResponseEvent for the given receiver to confirm the
-- removal of the item with the given itemId.
-- 
-- @param #string receiver
--          the receiver of the event
-- @param #number itemId
--          the itemId of the item that was removed
-- 
-- @return #ItemRemovalResponseEvent
--          the new event
-- 
function ItemRemovalResponseEvent.new(receiver, itemId)
    local self = setmetatable({}, ItemRemovalResponseEvent)
    self.receiver = receiver
    self.itemId = itemId
    return self
end

---
-- Encodes this ItemRemovalResponseEvent into a string representation to be
-- serialized. The string can be decoded back into the event using the
-- decode() function.
-- 
-- @return #string
--          the encoded event
-- 
function ItemRemovalResponseEvent:encode()
    local event = self
    return event.itemId
end

---
-- Decodes the given string containing the previously encoded event data
-- or returns nil in case the event could not be decoded.
-- 
-- @param #string encoded
--          the encoded event string
-- 
-- @return #ItemRemovalResponseEvent
--          the event read from the encoded data or nil
-- 
function ItemRemovalResponseEvent.decode(encoded)
    if (encoded) then
        local itemId = tonumber(encoded)
        if (itemId) then
            return ItemRemovalResponseEvent.new(nil, itemId)
        end
    end
end

---
-- The event handler is called when a ItemRemovalResponseEvent is received.
-- 
-- Updates the MemberUI with the new player info.
-- 
ns.eventHandler[EVENT_ID] = function(message, sender)
    if (message and sender) then
        local event = ItemRemovalResponseEvent.decode(message)
        if (event) then
            local player = Players.getCurrentPlayer()
            -- remove the item from the need-list
            player.needlist[event.itemId] = nil
            -- and update the UI
            ns.MemberUI.setMemberInfo(player)
            ns.RoleCheckUI.setMemberInfo(player)
        end
    end
end
