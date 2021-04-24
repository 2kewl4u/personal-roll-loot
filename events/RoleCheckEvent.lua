-- namespace
local _, ns = ...;
-- imports
local Events = ns.Events
local Items = ns.Items
local Player = ns.Player
local utils = ns.utils

local EVENT_ID = "RoleCheckEvent"

---
-- The role check event is broadcasted to all raid or party members so
-- that they can specify their role in the raid and verify the player
-- setup of the raid leader.
-- 
local RoleCheckEvent = {
    -- the eventId to identify the event type
    eventId = EVENT_ID,
    -- a set of currently active raids, e.g. Molten Core
    raids,
    -- the custom priority level
    prio
}
RoleCheckEvent.__index = RoleCheckEvent
ns.RoleCheckEvent = RoleCheckEvent

---
-- Creates a new RoleCheckEvent with the given player and raid names.
-- 
-- @param #Player player
--          the player to which the role check will be sent
-- @param #set raids
--          a set of raid names, e.g. Molten Core
-- @param #number prio
--          the custom priority level
--          
-- @return #RoleCheckEvent
--          the new event
-- 
function RoleCheckEvent.new(raids, prio)
    local self = setmetatable({}, RoleCheckEvent)
    self.raids = raids
    self.prio = prio or 0
    return self
end

---
-- Encodes this RoleCheckEvent into a string representation to be
-- serialized. The string can be decoded back into the event using the
-- decode() function.
-- 
-- @return #string
--          the encoded event
--          
function RoleCheckEvent:encode()
    local event = self
    local raids = utils.toCSV(event.raids, tostring, ",")
    return raids..";"..tostring(event.prio)
end

---
-- Decodes the given string containing the previously encoded event data
-- or returns nil in case the event could not be decoded.
-- 
-- @param #string encoded
--          the encoded event string
-- 
-- @return #RoleCheckEvent
--          the event read from the encoded data or nil
-- 
function RoleCheckEvent.decode(encoded)
    if (encoded) then
        local raidsEncoded, prio = strsplit(";", encoded, 2)
        local raids = utils.fromCSV(raidsEncoded, function(list, element)
            list[element] = true
        end, ",")
        prio = tonumber(prio) or 0
        
        -- check raid validity
        for raid in pairs(raids) do
            if (not ns.RAIDS[raid]) then
                raids[raid] = nil -- invalid input
            end
        end
        
        if (not utils.tblempty(raids)) then
            return RoleCheckEvent.new(raids, prio)
        end
    end
end

---
-- Sends a RoleCheckEvent to all players in the party or raid group.
-- 
function RoleCheckEvent.broadcast()
    -- only announce if you are the raid/group leader
    if (IsInGroup() and UnitIsGroupLeader("player")) then
        if (ns.DB.activeInstance) then
            local instance = ns.DB.INSTANCE_LIST[ns.DB.activeInstance]
            if (instance) then
                if (ns.DB.options.chatInteraction) then
                    utils.sendGroupMessage("PRL Role Check - Whisper chat commands:")
                    utils.sendGroupMessage("change role: !prl role 1,2,...")
                    utils.sendGroupMessage("specify prio: !prl prio [ItemLink1]...")
                end
                
                Events.broadcast(RoleCheckEvent.new(instance.raids, instance.prio))
            else
                print("> Unknown instance '"..ns.DB.activeInstance.."'.")
            end
        else
            print("> No active instance.")
        end
    else
        print("> You must be the group or raid leader to send a role check.")
    end
end

---
-- The event handler is called when a RoleCheckEvent is received.
-- 
-- If the message is valid, the RoleCheckUI will be opened.
-- 
ns.eventHandler[EVENT_ID] = function(message, sender)
    -- only accept announcements from raid/group leader
    if (message and IsInGroup() and utils.isGroupLeader(sender)) then
        local event = RoleCheckEvent.decode(message)
        if (event) then
            ns.RoleCheckUI.open(event)
        end
    end
end
