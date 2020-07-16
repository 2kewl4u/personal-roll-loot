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
    local event = RoleSelectionEvent.decode(message)
    Players.selectRole(sender, event)
end

local function selectRoles(msg, player)
    local possibleRoles = ns.CLASS_ROLES[player.class]
    local roles = {}
    -- roles may be comma separated
    for _, split in ipairs({ strsplit(",", msg) }) do
        split = strtrim(split)
        for roleId, role in pairs(possibleRoles) do
            if (split == roleId or split == role.key) then
                roles[roleId] = true
                break
            end
        end
    end
    
    if (not utils.tblempty(roles)) then
        if (not utils.tblequals(player.roles, roles)) then
            -- override the players roles
            player.roles = roles
            local rolesText = utils.toCSV(roles, tostring)
            print("> Player '"..player.name.."' changed roles to '"..rolesText.."'.")
            SendChatMessage("Changed roles to '"..rolesText.."'.", "WHISPER", nil, player.name)
        end
    else
        local response = "Invalid roles. Possible roles: "..utils.toCSV(possibleRoles, function(roleId, role)
            return role.key.." "..roleId
        end, ", ")
        SendChatMessage(response, "WHISPER", nil, player.name)
    end
end

local function selectPrioItems(msg, player)
    local prioItems = { Items.getItemIdsFromChat(msg) }

    -- quick item validation
    for index, itemId in ipairs(prioItems) do
        local item = ITEM_LIST[itemId]
        if (item and not player:needsItem(item)) then
            local response = "The item '"..item:getName().."' is not in your need-list."
            SendChatMessage(response, "WHISPER", nil, player.name)
            -- abort selection
            return
        end
    end
    
    local event = RoleSelectionEvent.new(nil, {}, prioItems)
    Players.selectRole(player.name, event)
end

-- parse the whisper chat to create role selection events
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("CHAT_MSG_WHISPER")
eventFrame:SetScript("OnEvent", function(frame, event, arg1, arg2)
    local msg = arg1
    -- remove the realm part from the author
    local author = strsplit("-", arg2, 2)
    -- detect a prl command
    if (utils.strstarts(msg, "!prl ")) then
        local player = ns.DB.PLAYER_LIST[author]
        if (player) then
            msg = strsub(msg, 6)
            if (utils.strstarts(msg, "role ")) then
                selectRoles(strsub(msg, 6), player)
            elseif (utils.strstarts(msg, "prio ")) then
                selectPrioItems(strsub(msg, 6), player)
            end
        else
            print("> Player '"..author.."' is not registered for Personal Roll Loot.")
            SendChatMessage("You are not registered for Personal Roll Loot.", "WHISPER", nil, author)
        end
    end
end)
