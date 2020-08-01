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
    -- the receiver of the event message
    receiver,
    -- the player to which this event will be sent
    player,
    -- the raid name of the currently active raid, e.g. Molten Core
    raid,
    -- the custom priority level
    prio
}
RoleCheckEvent.__index = RoleCheckEvent
ns.RoleCheckEvent = RoleCheckEvent


---
-- Creates a new RoleCheckEvent with the given player and raid name.
-- 
-- @param #Player player
--          the player to which the role check will be sent
-- @param #string raid
--          the name of the raid, e.g. Molten Core
-- @param #number prio
--          the custom priority level
--          
-- @return #RoleCheckEvent
--          the new event
-- 
function RoleCheckEvent.new(player, raid, prio)
    local self = setmetatable({}, RoleCheckEvent)
    self.player = player
    self.receiver = player.name
    self.raid = raid
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
    return event.raid..";"..tostring(event.prio)..";"..event.player:encode()
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
        local raid, prio, encodedPlayer = strsplit(";", encoded, 3)
        prio = tonumber(prio) or 0
        if (encodedPlayer and ns.RAIDS[raid]) then
            local player = Player.decode(encodedPlayer)
            if (player) then
                return RoleCheckEvent.new(player, raid, prio)
            end
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
                utils.sendGroupMessage("PRL Role Check - Whisper chat commands:")
                utils.sendGroupMessage("change role: !prl role 1,2,...")
                utils.sendGroupMessage("specify prio: !prl prio [ItemLink1]...")
                utils.sendGroupMessage("see need-list: !prl list <slotnumber>")
                
                utils.forEachRaidMember(function(playerName)
                    if (not instance.players[playerName]) then
                        local player = ns.DB.PLAYER_LIST[playerName]
                        if (player) then
                            Events.sent(RoleCheckEvent.new(player, instance.raid, instance.prio))
                        else
                            print("> Player '"..playerName.."' is not registered for Personal Roll Loot.")
                        end
                    end
                end)
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
-- Sends a single RoleCheckEvent to the given player.
-- 
-- @param #Player player
--          the player to send the event to
-- 
function RoleCheckEvent.send(player)
    if (player and ns.DB.activeInstance) then
        local instance = ns.DB.INSTANCE_LIST[ns.DB.activeInstance]
        if (instance) then
            Events.sent(RoleCheckEvent.new(player, instance.raid, instance.prio))
        end
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
            -- check the inventory for items already present in the need-list
            local items = Items.checkInventoryItems(event.player)
            if (utils.tblempty(items)) then
                ns.RoleCheckUI.open(event)
            else
                -- delay the role check and report the already present items
                ns.InventoryReportEvent.send(sender, items)
            end
        end
    end
end
