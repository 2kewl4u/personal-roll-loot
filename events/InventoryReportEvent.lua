-- namespace
local _, ns = ...;
-- imports
local Events = ns.Events
local Items = ns.Items
local utils = ns.utils

local ITEM_LIST = ns.ITEM_LIST

local EVENT_ID = "InventoryReportEvent"

-- indicates whether items should be automatically be removed from the player settings
local autoRemove
-- events received while the confirmation dialog is open will be save here
local pendingEvents = {}

---
-- The event is sent to report potential miss-configuration back to the raid leader. It contains
-- the itemIds of items present in the inventory of the raid member, but still in the need-list.
-- 
local InventoryReportEvent = {
    -- the eventId to identify the event type
    eventId = EVENT_ID,
    -- the receiver of the event message
    receiver,
    -- a set of itemIds present in the inventory, but still in the need-list
    items
}
InventoryReportEvent.__index = InventoryReportEvent
ns.InventoryReportEvent = InventoryReportEvent


---
-- Creates a new InventoryReportEvent with the given receiver and items.
-- 
-- The items argument must contain the itemIds as keys. 
-- 
-- @param #string receiver
--          the receiver of the event
-- @param #map items
--          the itemIds of the inventory items
--          
-- @return #InventoryReportEvent
--          the new event
-- 
function InventoryReportEvent.new(receiver, items)
    local self = setmetatable({}, InventoryReportEvent)
    self.receiver = receiver
    self.items = items
    return self
end

---
-- Encodes this InventoryReportEvent into a string representation to be
-- serialized. The string can be decoded back into the event using the
-- decode() function.
-- 
-- @return #string
--          the encoded event
-- 
function InventoryReportEvent:encode()
    local event = self
    return utils.toCSV(event.items, tostring)
end

---
-- Decodes the given string containing the previously encoded event data
-- or returns nil in case the event could not be decoded.
-- 
-- @param #string encoded
--          the encoded event string
-- 
-- @return #InventoryReportEvent
--          the event read from the encoded data or nil
-- 
function InventoryReportEvent.decode(encoded)
    if (encoded) then
        local items = utils.fromCSV(encoded, function(list, element)
            local itemId = tonumber(element)
            if (itemId) then
                list[itemId] = true
            end
        end)
        return InventoryReportEvent.new(nil, items)
    end
end

---
-- Sends an InventoryReportEvent to report the given items to the given receiver.
-- 
-- @param #string receiver
--          the receiver of the event
-- @param #map items
--          the items to be reported (itemIds as keys)
-- 
function InventoryReportEvent.send(receiver, items)
    Events.sent(InventoryReportEvent.new(receiver, items))
end

---
-- Prints the contents of this event to the console output.
-- 
function InventoryReportEvent:print()
    local event = self
    local items = event.items
    local size = utils.tblsize(items)
    local msg = "> The player '"..event.sender.."' reports "..size.." items in the inventory still present in the need-list. "
    local i = 0
    for itemId in pairs(items) do
        local item = ITEM_LIST[itemId]
        if (item) then
            msg = msg..item:getName().." ("..itemId.."), "
        end
        i = i + 1
        if (i >= 5) then break end
    end
    local rest = size - i
    if (rest > 0) then
        msg = msg.."and "..rest.." more; "
    end
    msg = msg.."you should inspect the player."
    print(msg)
end

---
-- Removes the items in the given event from the given player and sends back another RoleCheckEvent.
-- 
-- @param #InventoryReportEvent event
--          the event containing the reported items
-- @param #Player player
--          the player to remove the items from
-- 
local function removeItems(event, player)
    -- remove the reported items
    for itemId in pairs(event.items) do
        local item = ITEM_LIST[itemId]
        Items.removeFromPlayer(player, item)
    end
    -- resent the role check
    ns.RoleCheckEvent.send(player)
end

---
-- Removes the items from the players within the pending events that were received while the
-- confirmation dialog was open .
-- 
local function removePending()
    for playerName, event in pairs(pendingEvents) do
        local player = ns.DB.PLAYER_LIST[playerName]
        if (player) then
            removeItems(event, player)
        end
    end
    pendingEvents = {}   
end

---
-- The event handler is called when an InventoryReportEvent is received.
-- 
-- The reported items will be printed to the console.
-- 
ns.eventHandler[EVENT_ID] = function(message, sender)
    if (message) then
        local event = InventoryReportEvent.decode(message)
        event.sender = sender
        local player = ns.DB.PLAYER_LIST[sender]
        if (event and player) then
            event:print()
            if (ns.ConfirmDialog.isShown()) then
                -- save the events during user prompt for automatic removal
                pendingEvents[player.name] = event
            elseif (autoRemove == nil) then
                ns.ConfirmDialog.open("Players report items in the inventory still present in the need-list. Would you like to automatically remove reported items?", function(result)
                    autoRemove = result
                    if (result) then
                        removeItems(event, player)
                        removePending()
                    end
                end)
            elseif (autoRemove) then
                removeItems(event, player)
            end
        end
    end
end
