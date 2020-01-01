-- namespace
local _, ns = ...;
-- imports
local Events = ns.Events
local utils = ns.utils

local ITEM_LIST = ns.ITEM_LIST

local EVENT_ID = "InventoryReportEvent"

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
-- The event handler is called when an InventoryReportEvent is received.
-- 
-- The reported items will be printed to the console.
-- 
ns.eventHandler[EVENT_ID] = function(message, sender)
    if (message) then
        local event = InventoryReportEvent.decode(message)
        if (event) then
            local items = event.items
            local size = utils.tblsize(items)
            local msg = "> The player '"..sender.."' reports "..size.." items in the inventory still present in the need-list. "
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
    end
end
