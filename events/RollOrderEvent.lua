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
function RollOrderEvent.new(rollOrder)
    local self = setmetatable({}, RollOrderEvent)
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
            return RollOrderEvent.new(rollOrder)
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
        local itemLink = rollOrder.item:getLink()
        utils.sendGroupMessage("Loot: "..itemLink)
        if (ns.DB.options.chatInteraction) then
            utils.sendGroupMessage("Respond with: (need/greed/pass/remove) + [ItemLink]")
        end
        Events.broadcast(RollOrderEvent.new(rollOrder))
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
            local rollOrder = event.rollOrder
            ns.MemberUI.setRollOrder(rollOrder)
            -- message contains the item to roll
            local item = rollOrder.item
            local playerName = UnitName("player")
            if (item and rollOrder:contains(playerName)) then
                ns.LootButton.setItem(item)
            end
        end
    end
end
