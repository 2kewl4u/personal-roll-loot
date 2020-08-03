local _, ns = ...;
-- imports
local Events = ns.Events
local Items = ns.Items
local RollSystem = ns.RollSystem
local RollTypes = ns.RollTypes
local utils = ns.utils

local EVENT_ID = "RollResponseEvent"

---
-- The RollResponseEvent is sent as a response to the RollRequestEvent containing the decision of
-- the player if he or she needs the item or not.
--
local RollResponseEvent = {
    -- the eventId to identify the event type
    eventId = EVENT_ID,
    -- the receiver of the event message
    receiver,
    -- the itemId of the item that will be rolled on
    itemId,
    -- the selected roll type of the member
    rollType
}
RollResponseEvent.__index = RollResponseEvent
ns.RollResponseEvent = RollResponseEvent

---
-- Creates a new RollResponseEvent with the itemId of the roll item and the roll type decision of
-- the player.
--
-- @param #string receiver
--          the receiver of the event
-- @param #number itemId
--          the itemId of the item to be rolled on
-- @param #string rollType
--          the type of roll (e.g. need, greed, pass, remove)
--
-- @return #RollResponseEvent
--          the new event
--
function RollResponseEvent.new(receiver, itemId, rollType)
    local self = setmetatable({}, RollResponseEvent)
    self.receiver = receiver
    self.itemId = itemId
    self.rollType = rollType
    return self
end

---
-- Encodes this RollResponseEvent into a string representation to be
-- serialized. The string can be decoded back into the event using the
-- decode() function.
--
-- @return #string
--          the encoded event
--
function RollResponseEvent:encode()
    local event = self
    return event.itemId..":"..event.rollType
end

---
-- Decodes the given string containing the previously encoded event data
-- or returns nil in case the event could not be decoded.
--
-- @param #string encoded
--          the encoded event string
--
-- @return #RollResponseEvent
--          the event read from the encoded data or nil
--
function RollResponseEvent.decode(encoded)
    if (encoded) then
        local itemId, rollType = strsplit(":", encoded, 2)
        itemId = tonumber(itemId)
        if (itemId and rollType) then
            return RollResponseEvent.new(nil, itemId, rollType)
        end
    end
end

---
-- Sends a RollResponseEvent to the raid or party leader with the given player's choice for the item
-- with the given itemId.
--
-- @param #Item item
--          the item to be rolled on
-- @param #string rollType
--          the type of roll (e.g. need, greed, pass, remove)
--
function RollResponseEvent.send(item, rollType)
    local raidLeader = utils.getRaidLeader()
    if (raidLeader and item and rollType) then
        utils.sendGroupMessage(rollType.." - "..item:getLink())
        Events.sent(RollResponseEvent.new(raidLeader, item.itemId, rollType))
    end
end

---
-- The event handler is called when a RollResponseEvent is received.
--
-- If a player chooses need and all responses for that round were received, the roll process stops.
-- Otherwise a new RollRequestEvent wave is sent to all players of the next round.
--
-- Additionally, when a player chooses remove, the item will be removed from his or her need-list.
--
ns.eventHandler[EVENT_ID] = function(message, sender)
    local event = RollResponseEvent.decode(message)
    if (event) then
        event.sender = sender -- append the sender
        RollSystem.evaluateResponse(event)
    end
end

---
-- Parses the given chat message and extracts the roll type.
-- 
-- @param #string msg
--          the chat message
-- 
-- @return #string
--          the roll type or nil if the message did not start with a roll type
-- 
local function parseRollType(msg)
    if (msg) then
        -- trim leading and trailing spaces
        msg = strtrim(msg)
        
        for i, rollType in ipairs(RollTypes) do
            if (utils.strstarts(msg, rollType)) then
                return rollType
            end
        end        
    end
end

-- parse the group and raid chat to create roll response events
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("CHAT_MSG_PARTY")
eventFrame:RegisterEvent("CHAT_MSG_RAID")
eventFrame:RegisterEvent("CHAT_MSG_RAID_LEADER")
eventFrame:RegisterEvent("CHAT_MSG_PARTY_LEADER")
eventFrame:SetScript("OnEvent", function(frame, event, arg1, arg2)
    if (ns.DB.options.chatInteraction) then
        local msg = arg1
        -- remove the realm part from the author
        local author = strsplit("-", arg2, 2)
        local rollType = parseRollType(msg)
        if (rollType) then
            local itemId = Items.getItemIdsFromChat(msg)
            if (itemId) then
                local event = RollResponseEvent.new(nil, itemId, rollType)
                event.sender = author
                RollSystem.evaluateResponse(event)
            end
        end
    end
end)
