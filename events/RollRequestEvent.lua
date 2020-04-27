-- namespace
local _, ns = ...;
-- imports
local Events = ns.Events
local utils = ns.utils

local ITEM_LIST = ns.ITEM_LIST

local EVENT_ID = "RollRequestEvent"

---
-- The RollRequestEvent is sent by the raid or party leader during an item roll to specific members
-- in order to request a RollResponseEvent containing their decision whether they need the item or
-- not.
-- 
local RollRequestEvent = {
    -- the eventId to identify the event type
    eventId = EVENT_ID,
    -- the receiver of the event message
    receiver,
    -- the itemId of the item that will be rolled on
    itemId
}
RollRequestEvent.__index = RollRequestEvent
ns.RollRequestEvent = RollRequestEvent

---
-- Creates a new RollRequestEvent for the item with the given itemId.
-- 
-- @param #string receiver
--          the receiver of the event
-- @param #number itemId
--          the itemId of the item to be rolled
-- 
-- @return #RollRequestEvent
--          the new event
-- 
function RollRequestEvent.new(receiver, itemId)
    local self = setmetatable({}, RollRequestEvent)
    self.receiver = receiver
    self.itemId = itemId
    return self    
end

---
-- Encodes this RollRequestEvent into a string representation to be
-- serialized. The string can be decoded back into the event using the
-- decode() function.
-- 
-- @return #string
--          the encoded event
--  
function RollRequestEvent:encode()
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
-- @return #RollRequestEvent
--          the event read from the encoded data or nil
-- 
function RollRequestEvent.decode(encoded)
    if (encoded) then
        local itemId = tonumber(encoded)
        if (itemId) then
            return RollRequestEvent.new(nil, itemId)
        end
    end
end

---
-- Sends a new wave of RollRequestEvents to all players with the same loot round. Subsequent calls
-- will send events to the next players in the list and so on.
-- 
-- Does nothing if there is currently no roll order selected in the RollSystem.
-- 
-- @return #boolean
--          true if new events were sent, false the no players are left
-- 
function RollRequestEvent.send()
    local currentRollOrder = ns.RollSystem.currentRollOrder
    local sentEvent = false
    if (currentRollOrder) then
        local currentRound
        for index = ns.RollSystem.sentIndex, #currentRollOrder.rounds, 1 do
            local entry = currentRollOrder.rounds[index]
            local round = entry[1]
            if (currentRound and currentRound < round) then break end

            -- send a roll request for the current round
            local playerName = entry[2]
            local item = currentRollOrder.item
            if (utils.isInRaid(playerName)) then
                local player = ns.DB.PLAYER_LIST[playerName]
                if (player and player.needlist[item.itemId]) then
                    Events.sent(RollRequestEvent.new(playerName, item.itemId))
                    sentEvent = true
                    utils.sendGroupMessage(round.." - "..playerName)
                    currentRound = round
                    ns.RollSystem.currentRound = round
                end
            end
            ns.RollSystem.sentIndex = index + 1
        end
    end
    return sentEvent
end

---
-- The event handler is called when a RollRequestEvent is received.
-- 
-- This should open a loot window where the player can specify if he or she needs the item.
-- 
ns.eventHandler[EVENT_ID] = function(message, sender)
    -- only accept sync info from raid/group leader
    if (IsInGroup() and utils.isGroupLeader(sender)) then
        -- message contains the itemId to roll
        local event = RollRequestEvent.decode(message)
        if (event) then
            local item = ITEM_LIST[event.itemId]
            if (item) then
                ns.LootButton.setItem(item)
            end
        end
    end
end
