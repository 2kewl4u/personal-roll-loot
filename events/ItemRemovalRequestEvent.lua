-- namespace
local _, ns = ...;
-- imports
local Events = ns.Events
local ItemRemovalResponseEvent = ns.ItemRemovalResponseEvent
local Items = ns.Items
local utils = ns.utils

local ITEM_LIST = ns.ITEM_LIST

local EVENT_ID = "ItemRemovalRequestEvent"

---
-- The ItemRemovalRequestEvent is sent to request the removal of a specific item from the need-list
-- of the current player if possible.
-- 
local ItemRemovalRequestEvent = {
    -- the eventId to identify the event type
    eventId = EVENT_ID,
    -- the receiver of the event message
    receiver,
    -- the itemId of the item that should be removed
    itemId
}
ItemRemovalRequestEvent.__index = ItemRemovalRequestEvent
ns.ItemRemovalRequestEvent = ItemRemovalRequestEvent

---
-- Creates a new ItemRemovalRequestEvent for the given receiver to request the removal of the item
-- with the given itemId.
-- 
-- @param #string receiver
--          the receiver of the event
-- @param #number itemId
--          the itemId of the item to be removed from the current player
-- 
-- @return #ItemRemovalRequestEvent
--          the new event
-- 
function ItemRemovalRequestEvent.new(receiver, itemId)
    local self = setmetatable({}, ItemRemovalRequestEvent)
    self.receiver = receiver
    self.itemId = itemId
    return self
end

---
-- Encodes this ItemRemovalRequestEvent into a string representation to be
-- serialized. The string can be decoded back into the event using the
-- decode() function.
-- 
-- @return #string
--          the encoded event
-- 
function ItemRemovalRequestEvent:encode()
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
-- @return #ItemRemovalRequestEvent
--          the event read from the encoded data or nil
-- 
function ItemRemovalRequestEvent.decode(encoded)
    if (encoded) then
        local itemId = tonumber(encoded)
        if (itemId) then
            return ItemRemovalRequestEvent.new(nil, itemId)
        end
    end
end

---
-- Sends an ItemRemovalRequestEvent to the party or raid leader to request the removal of the given
-- item from the need-list.
-- 
-- @param #Item item
--          the item to be removed
-- 
function ItemRemovalRequestEvent.send(item)
    -- only send request to raid/group leader
    if (IsInGroup()) then
        local name = utils.getRaidLeader()
        if (name) then
            print("> Request item removal for '"..item:getName().."' ("..item.itemId..").")
            Events.sent(ItemRemovalRequestEvent.new(name, item.itemId))
        end
    end    
end

---
-- The event handler is called when a ItemRemovalRequestEvent is received.
-- 
-- If the player is present in the configuration, removes the item if possible from the players
-- need-list and sends a MemberInfoEvent back to update the changes.
-- 
ns.eventHandler[EVENT_ID] = function(message, sender)
    if (message and sender) then
        local event = ItemRemovalRequestEvent.decode(message)
        if (event) then
            local item = ITEM_LIST[event.itemId]
            if (item) then
                local player = ns.DB.PLAYER_LIST[sender]
                if (player and Items.canRemove(item, player)) then
                    Items.removeFromPlayer(player, item)
                    -- respond back with the confirmation of the removal
                    Events.sent(ns.ItemRemovalResponseEvent.new(sender, item.itemId))
                end
            end
        end
    end    
end
