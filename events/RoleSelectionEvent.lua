-- namespace
local _, ns = ...;
-- imports
local Events = ns.Events
local ITEM_LIST = ns.ITEM_LIST
local Items = ns.Items
local Players = ns.Players
local Roles = ns.Roles
local utils = ns.utils

local EVENT_ID = "RoleSelectionEvent"

---
-- The role selection event is sent to the raid or party leader to change
-- the player's currently selected roles.
-- 
local RoleSelectionEvent = {
    -- the eventId to identify the event type
    eventId = EVENT_ID,
    -- the receiver of the event message
    receiver,
    -- a set of roles that have been selected
    roles
}
RoleSelectionEvent.__index = RoleSelectionEvent
ns.RoleSelectionEvent = RoleSelectionEvent


---
-- Creates a new RoleSelectionEvent with the given receiver and the new
-- roles.
-- 
-- @param #string receiver
--          the receiver of the event, should be the raid leader
-- @param #set roles
--          the selected roles
-- 
-- @return #RoleSelectionEvent
--          the new event
-- 
function RoleSelectionEvent.new(receiver, roles)
    local self = setmetatable({}, RoleSelectionEvent)
    self.receiver = receiver
    self.roles = roles
    return self
end

---
-- Encodes this RoleSelectionEvent into a string representation to be
-- serialized. The string can be decoded back into the event using the
-- decode() function.
-- 
-- @return #string
--          the encoded event
--
function RoleSelectionEvent:encode()
    local event = self
    local encodedRoles = utils.toCSV(event.roles, tostring)
    return encodedRoles
end

---
-- Decodes the given string containing the previously encoded event data
-- or returns nil in case the event could not be decoded.
-- 
-- @param #string encoded
--          the encoded event string
-- 
-- @return #RoleSelectionEvent
--          the event read from the encoded data or nil
-- 
function RoleSelectionEvent.decode(encoded)
    if (encoded) then
        -- TODO kept for backward compatibility; may be removed later
        local encodedRoles, encodedPrioItems = strsplit(";", encoded, 2)
        
        local roles = {}
        utils.fromCSV(encodedRoles, function(l, element)
            if (Roles.checkRoleId(element)) then
                roles[element] = true
            end
        end)
        
        return RoleSelectionEvent.new(nil, roles)
    end
end

---
-- Sends a RoleSelectionEvent to the raid or party leader to change the
-- roles to the given argument.
-- 
-- @param #set roles
--          a set of roles that are selected
-- 
function RoleSelectionEvent.send(roles)
        -- only send request to raid/group leader
    if (roles and IsInGroup()) then
        local name = utils.getRaidLeader()
        if (name) then
            Events.sent(RoleSelectionEvent.new(name, roles))
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
    local event = RoleSelectionEvent.decode(message)
    if (event) then
        Players.selectRole(sender, event)
    end
end
