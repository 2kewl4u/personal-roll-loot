-- namespace
local _, ns = ...;
-- imports
local AddonMessage = ns.AddonMessage
local Instances = ns.Instances
local ITEM_LIST = ns.ITEM_LIST
local Items = ns.Items
local Player = ns.Player
local Players = ns.Players
local Roles = ns.Roles
local RollOrder = ns.RollOrder
local utils = ns.utils

local MasterUI = ns.MasterUI
local MemberUI = ns.MemberUI
local LootButton = ns.LootButton

-- events
local EVENT_MESSAGE = "PRL_EVENT"
local EVENTS = {
    [EVENT_MESSAGE] = true
}

local MSG_MEMBER_INFO =         1
local MSG_ROLL_ORDER_INFO =     2
local MSG_SYNC_REQUEST =        3
local MSG_SYNC_INFO =           4
local MSG_ROLL_REQUEST =        5
local MSG_ROLL_RESPONSE =       6
local MSG_MEMBER_INFO_REQUEST = 7
local MSG_REMOVAL_REQUEST =		8

local ROLL_NEED = "need"
local ROLL_GREED = "greed"
local ROLL_PASS = "pass"
local ROLL_REMOVE = "remove"

local currentRollOrder

-- core functions
local function postChatMessage(message)
    if (IsInGroup()) then
        local chatType = "PARTY"
        if (IsInRaid()) then chatType = "RAID" end

        SendChatMessage(message, chatType)
    end
end

local function sendRollRequest()
    if (currentRollOrder) then
        local currentRound
        for index = currentRollOrder.sentIndex, #currentRollOrder.rounds, 1 do
            local entry = currentRollOrder.rounds[index]
            local round = entry[1]
            if (currentRound and currentRound < round) then break end

            -- send a role request for the current round
            local playerName = entry[2]
            local item = currentRollOrder.item
            if (utils.isInRaid(playerName)) then
                local player = ns.DB.PLAYER_LIST[playerName]
                if (player and player.needlist[item.itemId]) then
                    AddonMessage.Send(EVENT_MESSAGE, MSG_ROLL_REQUEST.."#"..item.itemId, "WHISPER", playerName)
                    postChatMessage(round.." - "..playerName)
                    currentRound = round
                    currentRollOrder.currentRound = round
                end
            end
            currentRollOrder.sentIndex = index + 1
        end
    end
end

ns.announceRollOrder = function(rollOrder)
    local instance = ns.DB.INSTANCE_LIST[ns.DB.activeInstance]
    if (instance) then
        currentRollOrder = rollOrder
        postChatMessage(rollOrder.item:getLink())

        local message = rollOrder:encode()
        utils.forEachRaidMember(function(name)
            local player = ns.DB.PLAYER_LIST[name]
            if (player) then
                if (instance.players[name]) then
                    AddonMessage.Send(EVENT_MESSAGE, MSG_ROLL_ORDER_INFO.."#"..message, "WHISPER", name)
                else
                    print("> Player '"..name.."' is not invited to the currently active instance.")
                end
            else
                print("> Player '"..name.."' is not registered for Personal Roll Loot.")
            end
        end)

        -- prepare protocol
        currentRollOrder.sentIndex = 1
        currentRollOrder.responses = {}
        sendRollRequest()
    else
        print("> No active instance.")
    end
end

ns.respondRollOrder = function(item, rollType)
    local raidLeader = utils.getRaidLeader()
    if (raidLeader and item) then
        postChatMessage(rollType.." - "..item:getLink())

        local message = MSG_ROLL_RESPONSE.."#"..item.itemId..":"..rollType
        AddonMessage.Send(EVENT_MESSAGE, message, "WHISPER", raidLeader)
    end
end

ns.requestItemRemoval = function(item)
    -- only send request to raid/group leader
    if (IsInGroup()) then
        local name = utils.getRaidLeader()
        if (name) then
            print("> Request item removal for '"..item:getName().."' ("..item.itemId..").")
            AddonMessage.Send(EVENT_MESSAGE, MSG_REMOVAL_REQUEST.."#"..item.itemId, "WHISPER", name)
        end
    end
end

-- ------------------------------------------------------- --
-- slash commands                                          --
-- ------------------------------------------------------- --
local COMMANDS = {
    ["add-player"] = Players.add,
    ["remove-player"] = Players.remove,

    ["player-info"] = function(arg)
        local player = Players.get(arg)
        if (player) then
            player:print()
        end
    end,

    ["add-role"] = function(arg)
        arg = arg or ""
        local arg1, arg2 = strsplit(" ", arg, 2)
        local player = Players.get(arg1)
        if (player) then
            local name = player.name
            local role = arg2
            if (Roles.checkRoleId(role)) then
                -- add role to player
                player.roles[role] = true
                print("> Added role '"..role.."' to player '"..name.."'.")
            end
        end
    end,

    ["remove-role"] = function(arg)
        arg = arg or ""
        local arg1, arg2 = strsplit(" ", arg, 2)
        local player = Players.get(arg1)
        if (player) then
            local name = player["name"]
            local role = arg2
            if (Roles.checkRoleId(role)) then
                -- remove role from player
                player["roles"][role] = nil
                print("> Removed role '"..role.."' from player '"..name.."'.")
            end
        end
    end,

    ["add-item"] = function(arg)
        arg = arg or ""
        local arg1, arg2 = strsplit(" ", arg, 2)
        local player = Players.get(arg1)
        if (player) then
            local item = Items.get(arg2)
            if (item) then
                -- add item to player
                if (not player:addItem(item)) then
                    error("> Item '"..item.name.."' ("..item.itemId..") is not assigned to the class '"..player.class.."'.", 0)
                end
                print("> Added item '"..item.name.."' ("..item.itemId..") to player '"..player.name.."'.")
            end
        end
    end,

    ["remove-item"] = function(arg)
        arg = arg or ""
        local arg1, arg2 = strsplit(" ", arg, 2)
        local player = Players.get(arg1)
        if (player) then
            local item = Items.get(arg2)
            if (item) then
                local name = player.name
        
                -- remove item from player
                if (player:removeItem(item)) then
                    print("> Removed item '"..item.name.."' ("..item.itemId..") from player '"..name.."'.")
                else
                    print("> The item '"..item.name.."' ("..item.itemId..") was not on the need-list for player '"..name.."'.")
                end
            end
        end
    end,

    ["create-instance"] = function(arg)
        arg = arg or ""
        local name, raidName = strsplit(" ", arg, 2)
        Instances.create(name, raidName)
    end,
    ["delete-instance"] = Instances.delete,

    ["instance-info"] = function(arg)
        -- no arguments, print all instances
        if (not arg) then
            local empty = true
            for name,instance in pairs(ns.DB.INSTANCE_LIST) do
                instance:print()
                empty = false
            end
            if (empty) then print("> No instances found.") end
        else
            local instance = Instances.get(arg)
            if (instance) then
                instance:print()
            end
        end
    end,

    ["active-instance"] = Instances.activate,
    ["invite"] = Instances.invite,
    ["roll"] = function(arg)
        local rollOrder = Instances.roll(arg)
        if (rollOrder) then
            rollOrder:print()
        end
    end
}

-- ------------------------------------------------------- --
-- register the slash commands and call the command table  --
-- ------------------------------------------------------- --
SLASH_PersonalRollLootMember1 = "/prl"
SLASH_PersonalRollLootMember2 = "/personal"
SlashCmdList["PersonalRollLootMember"] = function(s)
    MemberUI.toggleUI()
end
SLASH_PersonalRollLootMaster1 = "/prlm"
SLASH_PersonalRollLootMaster2 = "/personalmaster"
SlashCmdList["PersonalRollLootMaster"] = function(s)
    local cmd, args = strsplit(" ", s, 2)
    local c = COMMANDS[cmd]
    if c then
        local status, err = pcall(c, args)
        if (not status) then print(err) end
    else
        -- no command specified, open the UI
        MasterUI.toggleUI()
    end
end

-- ------------------------------------------------------- --
-- event handling                                          --
-- ------------------------------------------------------- --
local eventHandler = {}

local function updateLootItems()
    if (IsInGroup()) then
        local lootItems = Items.getLootItems()

        if (UnitIsGroupLeader("player")) then
            -- add the items to the loot history of the current instance
            if (ns.DB.activeInstance) then
                local instance = ns.DB.INSTANCE_LIST[ns.DB.activeInstance]
                if (instance) then
                    for itemId, item in pairs(lootItems) do
                        instance:addItem(item)
                    end
                end
            end
        end
        -- update the UI
        MasterUI.setLootItems(lootItems)
        MemberUI.setLootItems(lootItems)
    end
end

local function receiveRollOrderInfo(message, sender)
    if (message and IsInGroup() and utils.isGroupLeader(sender)) then
        -- local playerName = UnitName("player")
        local rollOrder = RollOrder.decode(message)
        if (rollOrder) then
            MemberUI.setRollOrder(rollOrder)
        end
    end
end
eventHandler[MSG_ROLL_ORDER_INFO] = receiveRollOrderInfo

eventHandler[MSG_ROLL_REQUEST] = function(message, sender)
    -- only accept sync info from raid/group leader
    if (IsInGroup() and utils.isGroupLeader(sender)) then
        -- message contains the itemId to roll
        local itemId = tonumber(message)
        if (itemId) then
            local item = ITEM_LIST[itemId]
            if (item) then
                LootButton.setItem(item)
            end
        end
    end
end

eventHandler[MSG_ROLL_RESPONSE] = function(message, sender)
    if (currentRollOrder) then
        local itemId, rollType = strsplit(":", message, 2)
        itemId = tonumber(itemId)
        if (itemId and rollType and currentRollOrder.item.itemId == itemId) then
            currentRollOrder.responses[sender] = rollType

            -- remove the unwanted item from the list
            if (rollType == ROLL_REMOVE) then
                local player = ns.DB.PLAYER_LIST[sender]
                if (player) then
                    Items.removeFromPlayer(player, currentRollOrder.item)
                end
            end

            -- evaluate the response
            local missingResponse = false
            local need = false
            for index, entry in ipairs(currentRollOrder.rounds) do
                local round = entry[1]
                if (round == currentRollOrder.currentRound) then
                    local playerName = entry[2]
                    local response = currentRollOrder.responses[playerName]
                    if (not response and utils.isInRaid(playerName)) then
                        missingResponse = true
                        break
                    elseif (response == ROLL_NEED) then
                        need = true
                    end
                elseif (round > currentRollOrder.currentRound) then
                    break
                end
            end

            -- trigger the next rolling
            if (not missingResponse and not need) then
                sendRollRequest()
            end
        end
    end
end

eventHandler[MSG_REMOVAL_REQUEST] = function(message, sender)
    if (message and sender) then
        local itemId = tonumber(message)
        if (itemId) then
            local item = ITEM_LIST[itemId]
            if (item) then
                local player = ns.DB.PLAYER_LIST[sender]
                if (player and Items.canRemove(item, player)) then
                    Items.removeFromPlayer(player, item)
                    -- respond back with an update of the player info
                    ns.MemberInfoEvent.send(sender)
                end
            end
        end
    end
end

local function receive(prefix, message, type, sender)
    --     print("prefix: "..tostring(prefix))
    --     print("message: "..tostring(message))
    if (EVENTS[prefix]) then
        AddonMessage.Receive(prefix, message, type, sender, function(prefix, message, type, sender)
            if (prefix == EVENT_MESSAGE) then
                sender = strsplit("-", sender, 2) -- remove realm suffix
                prefix, message = strsplit("#", message, 2)
                -- prefix must be a number
                prefix = tonumber(prefix)
                if (prefix) then
                    local handler = eventHandler[prefix]
                    if (handler) then
                        handler(message, sender)
                    end
                end
            end
        end)
    end
end

local function getItemNameFromChat(msg)
    if (msg) then
        local firstPart, itemName, lastPart
        firstPart, itemName = strsplit("[", msg, 2)
        if (firstPart and itemName) then
            itemName, lastPart = strsplit("]", itemName, 2)
            if (itemName and lastPart) then
                return itemName
            end
        end
    end
end

local function parseLootMessage(msg, member)
    if (msg and member) then
        -- remove the realm part from the member
        local playerName = strsplit("-", member, 2)
        local player = ns.DB.PLAYER_LIST[playerName]
        if (player) then
            local itemName = getItemNameFromChat(msg)
            if (itemName) then
                local item = Items.forName(itemName)
                Items.removeFromPlayer(player, item)
            end
        end
    end
end

local function inspectTarget()
    local unit = "target"
    local playerName = UnitName(unit)
    if (playerName) then
        local player = ns.DB.PLAYER_LIST[playerName]
        if (player and CheckInteractDistance(unit,1) and CanInspect(unit)) then
            for i = 1, 24 do
                local itemId = GetInventoryItemID(unit, i)
                if (itemId) then
                    local item = ITEM_LIST[itemId]
                    Items.removeFromPlayer(player, item)
                end
            end
        end
    end
end

-- for testing
local test
SLASH_PersonalRollLootTest1 = "/test"
SlashCmdList["PersonalRollLootTest"] = function(s) test(s) end
test = function()
    print("test function")
end


-- create an event frame
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("VARIABLES_LOADED")
eventFrame:RegisterEvent("INSPECT_READY")
eventFrame:RegisterEvent("CHAT_MSG_LOOT")
eventFrame:RegisterEvent("CHAT_MSG_ADDON")
eventFrame:RegisterEvent("LOOT_OPENED")
eventFrame:RegisterEvent("LOOT_SLOT_CLEARED")
C_ChatInfo.RegisterAddonMessagePrefix(EVENT_MESSAGE)
function eventFrame:OnEvent(event, arg1, arg2, arg3, arg4, arg5, ...)
    if (event == "VARIABLES_LOADED") then
        ns.loadSavedVariables()
    elseif (event == "CHAT_MSG_ADDON") then
        receive(arg1, arg2, arg3, arg4)
    elseif (event == "LOOT_OPENED" or event == "LOOT_SLOT_CLEARED") then
        updateLootItems()
    elseif (event == "CHAT_MSG_LOOT") then
        -- arg5 "playerName2" - Name of player who received the loot
        parseLootMessage(arg1, arg5)
    elseif (event == "INSPECT_READY") then
        inspectTarget()
    end
end
eventFrame:SetScript("OnEvent", eventFrame.OnEvent)

print("Addon loaded... PersonalRollLoot "..GetAddOnMetadata("PersonalRollLoot", "Version"))
