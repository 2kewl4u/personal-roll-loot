-- namespace
local _, ns = ...;
-- imports
local Events = ns.Events
local ITEM_LIST = ns.ITEM_LIST
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
    roles,
    -- a list of itemIds of selected priority items
    prioItems
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
-- @param #list prioItems
--          a list of itemIds of selected priority items
-- 
-- @return #RoleSelectionEvent
--          the new event
-- 
function RoleSelectionEvent.new(receiver, roles, prioItems)
    local self = setmetatable({}, RoleSelectionEvent)
    self.receiver = receiver
    self.roles = roles
    self.prioItems = prioItems or {}
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
    local encodedPrioItems = utils.toCSV(event.prioItems, function(index, itemId)
        return tostring(itemId)
    end)
    return encodedRoles..";"..encodedPrioItems
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
        local encodedRoles, encodedPrioItems = strsplit(";", encoded, 2)
        
        local roles = {}
        utils.fromCSV(encodedRoles, function(l, element)
            if (Roles.checkRoleId(element)) then
                roles[element] = true
            end
        end)
        local prioItems = {}
        utils.fromCSV(encodedPrioItems, function(l, element)
            local itemId = tonumber(element)
            if (itemId and ITEM_LIST[itemId]) then
                table.insert(prioItems, itemId)
            end
        end)
        
        return RoleSelectionEvent.new(nil, roles, prioItems)
    end
end

---
-- Sends a RoleSelectionEvent to the raid or party leader to change the
-- roles to the given argument.
-- 
-- @param #set roles
--          a set of roles that are selected
-- @param #list prioItems
--          a list of itemIds of selected priority items
-- 
function RoleSelectionEvent.send(roles, prioItems)
        -- only send request to raid/group leader
    if (roles and IsInGroup()) then
        local name = utils.getRaidLeader()
        if (name) then
            Events.sent(RoleSelectionEvent.new(name, roles, prioItems))
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
    local player = ns.DB.PLAYER_LIST[sender]
    if (player) then
        local event = RoleSelectionEvent.decode(message)
        if (event) then
            -- assign the new roles if changed
            local roles = {}
            if (not utils.tblequals(player.roles, event.roles)) then
                for roleId in pairs(event.roles) do
                    -- check that the roles are correct
                    if (Roles.checkRoleId(roleId)) then
                        roles[roleId] = true
                    end
                end
                if (utils.tblsize(roles) > 0) then
                    -- override the players roles
                    player.roles = roles
                    print("> Player '"..player.name.."' changed roles to '"..utils.toCSV(roles, tostring).."'.")
                end
            else
                roles = player.roles
            end
            
            -- mark the player in the active instance as ready
            if (ns.DB.activeInstance) then
                local instance = ns.DB.INSTANCE_LIST[ns.DB.activeInstance]
                -- do not override the role check status if the player is already invited
                if (instance and not (instance.players and instance.players[sender])) then
                    -- TODO validate that the priority items
                    instance.rolecheck[sender] = {
                        -- TODO extract this custom table into a separate class
                        roles = utils.copy(roles),
                        trial = player.trial or false,
                        prioItems = event.prioItems or {}
                    }
                end
            end
            -- update the UI
            ns.MasterUI.Update()
        end
    else
        print("> No player registered with the name '"..sender.."'.")
    end
end