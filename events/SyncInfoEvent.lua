-- namespace
local _, ns = ...;
-- imports
local Events = ns.Events
local Player = ns.Player
local utils = ns.utils

local EVENT_ID = "SyncInfoEvent"

---
-- The SyncInfoEvent is sent as a response to the SyncRequestEvent and contains the player
-- configuration of the raid or party leader.
-- 
local SyncInfoEvent = {
    -- the eventId to identify the event type
    eventId = EVENT_ID,
    -- the receiver of the event message
    receiver,
    -- a map [name, player] of players to be submitted
    players
}
SyncInfoEvent.__index = SyncInfoEvent
ns.SyncInfoEvent = SyncInfoEvent

---
-- Creates a new SyncInfoEvent for the given receiver with the given player configuration.
-- 
-- @param #string receiver
--          the receiver of the event
-- @param #map players
--          a map[playerName -> player] containing the player configuration
-- 
-- @return #SyncInfoEvent
--          the new event
-- 
function SyncInfoEvent.new(receiver, players)
    local self = setmetatable({}, SyncInfoEvent)
    self.receiver = receiver
    self.players = utils.copy(players)
    return self
end

---
-- Encodes this SyncInfoEvent into a string representation to be
-- serialized. The string can be decoded back into the event using the
-- decode() function.
-- 
-- @return #string
--          the encoded event
-- 
function SyncInfoEvent:encode()
    local event = self
    return utils.toCSV(event.players, function(name, player)
            return player:encode()
    end, "/")
end

---
-- Decodes the given string containing the previously encoded event data
-- or returns nil in case the event could not be decoded.
-- 
-- @param #string encoded
--          the encoded event string
-- 
-- @return #SyncInfoEvent
--          the event read from the encoded data or nil
-- 
function SyncInfoEvent.decode(encoded)
    if (encoded) then
        local players = utils.fromCSV(message, function(list, element)
            local player = Player.decode(element)
            list[player.name] = player
        end, "/")
        return SyncInfoEvent.new(nil, players)
    end
end

---
-- Sends a SyncInfoEvent containing the current player configuration to the given receiver.
-- 
function SyncInfoEvent.send(receiver)
    if (IsInGroup() and UnitIsGroupLeader("player")) then
        Events.sent(SyncInfoEvent.new(receiver, ns.DB.PLAYER_LIST))
    end
end

---
-- The event handler is called when a SyncInfoEvent is received.
-- 
-- If received from the party leader, the player configuration in the event will be synchronized
-- with the current configuration. More specifically, new players will be added and existing
-- players will have their items removed from the need-list if they are not present in the event.
-- 
ns.eventHandler[EVENT_ID] = function(message, sender)
        -- only accept sync info from raid/group leader
    if (IsInGroup() and utils.isGroupLeader(sender)) then
        print("> Got synchronize info from party leader '"..sender.."'.")
        local event = SyncInfoEvent.decode(message)
        if (event) then
            local syncCount = 0
            local addCount = 0
            for playerName, playerInfo in pairs(event.players) do
                -- synchronize the player info
                local player = ns.DB.PLAYER_LIST[playerInfo.name]
                if (player) then
                    player:synchronize(playerInfo)
                    syncCount = syncCount + 1
                else
                    ns.DB.PLAYER_LIST[playerInfo.name] = Player.copy(playerInfo)
                    addCount = addCount + 1
                end
            end
            print("> Synchronized "..syncCount.." and added "..addCount.." players.")
        end
    end
end
