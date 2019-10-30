-- namespace
local _, ns = ...;
-- imports
local AddonMessage = ns.AddonMessage
local CLASS_ROLES = ns.CLASS_ROLES
local Instance = ns.Instance
local ITEM_LIST = ns.ITEM_LIST
local Items = ns.Items
local Player = ns.Player
local RAIDS = ns.RAIDS
local ROLES = ns.ROLES
local RollOrder = ns.RollOrder
local ScrollList = ns.ScrollList
local utils = ns.utils
local utilsUI = ns.utilsUI

local MasterUI = ns.MasterUI
local MemberUI = ns.MemberUI

-- events
local EVENT_MEMBER_INFO = "PRLMemberInfo"
local EVENT_ROLL_ORDER_INFO = "PRLRollOrderInfo"
local EVENT_SYNC_REQUEST = "PRLSyncRequest"
local EVENT_SYNC_INFO = "PRLSyncInfo"
local EVENTS = { [EVENT_MEMBER_INFO] = true, [EVENT_ROLL_ORDER_INFO] = true, [EVENT_SYNC_REQUEST] = true, [EVENT_SYNC_INFO] = true }

-- set a delay in seconds until sending again a sync request or info
local SYNC_DELAY = 30
local syncRequestTimes = {}

-- helper functions
local function isGroupLeader(name)
    -- remove the realm from the player name
    name = strsplit("-", name, 2)
    if (IsInGroup()) then
        local memberCount = GetNumGroupMembers()
        for index = 1, memberCount do
            local member, rank = GetRaidRosterInfo(index)
            -- if the raid member is the leader of the raid
            if (member == name) then
                if (rank == 2) then
                    return true
                end
                break
            end
        end
    end
end

local function getPlayerNameAndRealm(arg)
    if (not arg) then error("> No player name specified.", 0) end
    local name, realm = UnitName(arg)
    if not name then error("> No player found with the name '"..arg.."'.", 0) end
    if not realm then realm = GetRealmName() end
    return name, realm
end

local function getPlayer(arg)
    local name, realm = getPlayerNameAndRealm(arg)
    local player = ns.DB.PLAYER_LIST[name]
    if (not player) then error("> No player registered with the name '"..name.."'.", 0) end
    return player
end

local function getRole(arg)
    if (not arg) then error("> No role specified.", 0) end
    local role = arg
    if (not ROLES[role]) then
        local errMsg = "> Undefined role '"..role.."'."
        errMsg = errMsg.."\nPossible roles:"
        for l,_ in pairs(ROLES) do
            errMsg = errMsg.."\n  "..l
        end
        error(errMsg, 0)
    end
    return role
end

local function getItem(arg)
    if (not arg) then error("> No item id or name specified.", 0) end
    local itemId = tonumber(arg) -- will be nil if not a number
    for _, item in pairs(ITEM_LIST) do
        if (item.itemId == itemId or item:getName() == arg) then
            return item
        end
    end
    error("> Item with itemId or name '"..arg.."' not found.", 0)
end

local function getInstance(name)
    if (not name) then error("> No instance name specified.", 0) end
    local instance = ns.DB.INSTANCE_LIST[name]
    if (not instance) then error("> No instance with the name '"..name.."' found.", 0) end
    return instance
end

-- core functions
ns.addPlayer = function(arg)
    if (not arg) then
        -- no argument given, so add all players in the group
        local added = 0
        utils.forEachRaidMember(function(name)
            local name, realm = getPlayerNameAndRealm(name)
            if (name and (not ns.DB.PLAYER_LIST[name])) then
                local _,class,_ = UnitClass(name)
                ns.DB.PLAYER_LIST[name] = Player.new(name,realm,class)
                added = added + 1
            end
        end)
        print("> Added "..added.." players.")
    else
        local name, realm = getPlayerNameAndRealm(arg)

        -- check if we already have the player
        if (ns.DB.PLAYER_LIST[name]) then error("> Player '"..name.."' already registered.", 0) end

        -- add the player to our database
        if (not UnitIsPlayer(arg)) then error("> Unit '"..name.."' is not a player.", 0) end
        local _,class,_ = UnitClass(arg)

        ns.DB.PLAYER_LIST[name] = Player.new(name,realm,class)
        print("> Added player '"..name.."-"..realm.."', "..class..".")
    end
end

ns.removePlayer = function(arg)
    if (not arg) then error("> No player name specified.", 0) end
    local player = ns.DB.PLAYER_LIST[arg]
    if (not player) then player = getPlayer(arg) end

    local name = player["name"]
    -- remove the player
    ns.DB.PLAYER_LIST[name] = nil
    print("> Removed player '"..name.."'.")
end

local function printPlayerInfo(player)
    print("> Player '"..player.name.."', Class: "..player.class..",")

    print("Roles:")
    for l,_ in pairs(player.roles) do
        print("  "..l)
    end

    print("Need-list:")
    local needlist = player.needlist
    for itemId,_ in pairs(needlist) do
        local item = ITEM_LIST[itemId]
        if (item) then print("  "..item.name) end
    end
end

ns.createInstance = function(arg)
    arg = arg or ""
    local name, raidName = strsplit(" ", arg, 2)
    if (strlen(name) < 1) then error("> Invalid instance name '"..name.."'.", 0) end
    if (not raidName) then error("> No raid name specified.", 0) end
    if (not RAIDS[raidName]) then error("> No raid with the name '"..raidName.."' found.", 0) end

    if (ns.DB.INSTANCE_LIST[name]) then error("> An instance with the name '"..name.."' is already registered.", 0) end
    ns.DB.INSTANCE_LIST[name] = Instance.new(name, raidName)
    print("> Created new instance '"..name.."'.")
end

ns.deleteInstance = function(arg)
    local instance = getInstance(arg)
    local name = instance.name
    ns.DB.INSTANCE_LIST[name] = nil
    print("> Removed instance '"..name.."'.")
    if (ns.DB.activeInstance == name) then ns.DB.activeInstance = nil end
end

ns.activeInstance = function(arg)
    local instance = getInstance(arg)
    ns.DB.activeInstance = instance.name
    print("> Instance '"..ns.DB.activeInstance.."' is now the active instance.")
end

ns.invite = function(arg)
    if (not ns.DB.activeInstance) then error("> No active instance.", 0) end
    local instance = getInstance(ns.DB.activeInstance)

    if (not arg) then
        local invited = 0
        utils.forEachRaidMember(function(name)
            local player = getPlayer(name)
            if (instance:addPlayer(player)) then
                invited = invited + 1
            end
        end)
        print("> Invited "..invited.." players.")
    else
        local player = getPlayer(arg)
        instance:addPlayer(player, true)
        print("> Created loot table for player '"..player.name.."'.")
    end
end

-- expect itemId or name
ns.roll = function(arg)
    local item = getItem(arg)
    local instance = getInstance(ns.DB.activeInstance)
    return RollOrder.of(instance, item)
end

ns.announceMemberInfo = function()
    -- only announce if you are the raid/group leader
    if (IsInGroup() and UnitIsGroupLeader("player")) then
        utils.forEachRaidMember(function(name)
            local player = ns.DB.PLAYER_LIST[name]
            if (player) then
                local message = player:encode()
                AddonMessage.Send(EVENT_MEMBER_INFO, message, "WHISPER", player.name)
            else
                print("> Player '"..name.."' is not registered for Personal Roll Loot.")
            end
        end)
    end
end

ns.announceRollOrder = function(rollOrder)
    local instance = ns.DB.INSTANCE_LIST[ns.DB.activeInstance]
    if (instance) then
        local message = rollOrder:encode()
        utils.forEachRaidMember(function(name)
            local player = ns.DB.PLAYER_LIST[name]
            if (player) then
                if (instance.players[name]) then
                    AddonMessage.Send(EVENT_ROLL_ORDER_INFO, message, "WHISPER", name)
                else
                    print("> Player '"..name.."' is not invited to the currently active instance.")
                end
            else
                print("> Player '"..name.."' is not registered for Personal Roll Loot.")
            end
        end)
    else
        print("> No active instance.")
    end
end

local function isSyncDelay(sender)
    sender = strsplit("-", sender, 2)
    local lastSent = syncRequestTimes[sender]
    local now = time()
    local delay = lastSent and ((now - lastSent) < SYNC_DELAY)
    if (not delay) then
        syncRequestTimes[sender] = now
    end
    return delay
end

ns.requestSync = function()
    -- only send request to raid/group leader
    if (IsInGroup() and not UnitIsGroupLeader("player")) then
        if (isSyncDelay(UnitName("player"))) then
            print("> Cannot send to many synchronize requests. Please wait "..SYNC_DELAY.." seconds.")
        else
            local name = utils.getRaidLeader()
            if (name) then
                print("> Requesting synchronize from party leader '"..name.."'.")
                AddonMessage.Send(EVENT_SYNC_REQUEST, "all", "WHISPER", name)
            end
        end
    end
end

-- ------------------------------------------------------- --
-- slash commands                                          --
-- ------------------------------------------------------- --
local COMMANDS = {
    ["add-player"] = ns.addPlayer,
    ["remove-player"] = ns.removePlayer,

    ["player-info"] = function(arg)
        local player = getPlayer(arg)
        printPlayerInfo(player)
    end,

    ["add-role"] = function(arg)
        arg = arg or ""
        local arg1, arg2 = strsplit(" ", arg, 2)
        local player = getPlayer(arg1)
        local name = player["name"]
        local role = getRole(arg2)

        -- add role to player
        player["roles"][role] = true
        print("> Added role '"..role.."' to player '"..name.."'.")
    end,

    ["remove-role"] = function(arg)
        arg = arg or ""
        local arg1, arg2 = strsplit(" ", arg, 2)
        local player = getPlayer(arg1)
        local name = player["name"]
        local role = getRole(arg2)

        -- remove role from player
        player["roles"][role] = nil
        print("> Removed role '"..role.."' from player '"..name.."'.")
    end,

    ["add-item"] = function(arg)
        arg = arg or ""
        local arg1, arg2 = strsplit(" ", arg, 2)
        local player = getPlayer(arg1)
        local item = getItem(arg2)

        -- add item to player
        if (not player:addItem(item)) then
            error("> Item '"..item.name.."' ("..item.itemId..") is not assigned to the class '"..player.class.."'.", 0)
        end
        print("> Added item '"..item.name.."' ("..item.itemId..") to player '"..player.name.."'.")
    end,

    ["remove-item"] = function(arg)
        arg = arg or ""
        local arg1, arg2 = strsplit(" ", arg, 2)
        local player = getPlayer(arg1)
        local item = getItem(arg2)
        local name = player["name"]

        -- remove role from player
        if (player.needlist[item.itemId]) then
            player.needlist[item.itemId] = nil
            print("> Removed item '"..item.name.."' ("..item.itemId..") from player '"..name.."'.")
        else
            print("> The item '"..item.name.."' ("..item.itemId..") was not on the need-list for player '"..name.."'.")
        end
    end,

    ["create-instance"] = ns.createInstance,
    ["delete-instance"] = ns.deleteInstance,

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
            local instance = getInstance(arg)
            instance:print()
        end
    end,

    ["active-instance"] = ns.activeInstance,
    ["invite"] = ns.invite,
    ["roll"] = function(arg)
        local rollOrder = ns.roll(arg)
        rollOrder:print()
    end,
    ["announce"] = ns.announceMemberInfo
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
local function updateLootItems()
    if (IsInGroup()) then
        local lootItems = Items.getLootItems()
        MasterUI.setLootItems(lootItems)
        MemberUI.setLootItems(lootItems)
    end
end

local function receiveMemberInfo(msg)
    if (msg) then
        local player = Player.decode(msg)
        if (player) then
            MemberUI.setMemberInfo(player)
        end
    end
end

local function receiveRollOrderInfo(msg)
    if (msg) then
        local rollOrder = RollOrder.decode(msg)
        if (rollOrder) then
            MemberUI.setRollOrder(rollOrder)
        end
    end
end

local function receiveSyncRequest(sender)
    if (IsInGroup() and not isSyncDelay(sender) and isGroupLeader(UnitName("player"))) then
        print("> Got synchronize request from member '"..sender.."'.")
        -- send the encoded player infos
        local message = utils.toCSV(ns.DB.PLAYER_LIST, function(name, player)
            return player:encode()
        end, "/")
        AddonMessage.Send(EVENT_SYNC_INFO, message, "WHISPER", sender)
    end
end

local function receiveSyncInfo(message, sender)
    -- only accept sync info from raid/group leader
    if (IsInGroup() and isGroupLeader(sender)) then
        print("> Got synchronize info from party leader '"..sender.."'.")
        local syncCount = 0
        local addCount = 0
        utils.fromCSV(message, function(list, element)
            local playerInfo = Player.decode(element)
            -- synchronize the player info
            local player = ns.DB.PLAYER_LIST[playerInfo.name]
            if (player) then
                player:synchronize(playerInfo)
                syncCount = syncCount + 1
            else
                ns.DB.PLAYER_LIST[playerInfo.name] = Player.copy(playerInfo)
                addCount = addCount + 1
            end
        end, "/")
        print("> Synchronized "..syncCount.." and added "..addCount.." players.")
    end
end

local function receive(prefix, message, type, sender)
    -- print("prefix: "..tostring(prefix))
    -- print("message: "..tostring(message))
    if (EVENTS[prefix]) then
        AddonMessage.Receive(prefix, message, type, sender, function(prefix, message, type, sender)
            if (prefix == EVENT_MEMBER_INFO) then
                -- only accept announcements from raid/group leader
                if (IsInGroup() and isGroupLeader(sender)) then
                    receiveMemberInfo(message)
                end
            elseif (prefix == EVENT_ROLL_ORDER_INFO) then
                if (IsInGroup() and isGroupLeader(sender)) then
                    receiveRollOrderInfo(message)
                    if (not isGroupLeader(UnitName("player")) and not MemberUI.isShown()) then
                        print("> Received a personal roll announcement. Type /prl to see the order.")
                        -- TODO maybe open the UI automatically:
                        -- MemberUI.toggleUI()
                    end
                end
            elseif (prefix == EVENT_SYNC_REQUEST) then
                receiveSyncRequest(sender)
            elseif (prefix == EVENT_SYNC_INFO) then
                receiveSyncInfo(message, sender)
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
                if (item) then
                    if (player:removeItem(item)) then
                        print("> Removed item '"..item:getName().."' ("..item.itemId..") from player '"..playerName.."'.")
                    end
                end
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
                    if (item and player:removeItem(item)) then
                        print("> Removed item '"..item:getName().."' ("..item.itemId..") from player '"..playerName.."'.")
                    end
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
C_ChatInfo.RegisterAddonMessagePrefix(EVENT_MEMBER_INFO)
C_ChatInfo.RegisterAddonMessagePrefix(EVENT_ROLL_ORDER_INFO)
C_ChatInfo.RegisterAddonMessagePrefix(EVENT_SYNC_REQUEST)
C_ChatInfo.RegisterAddonMessagePrefix(EVENT_SYNC_INFO)
function eventFrame:OnEvent(event, arg1, arg2, arg3, arg4, ...)
    if (event == "VARIABLES_LOADED") then
        ns.loadSavedVariables()
    elseif (event == "CHAT_MSG_ADDON") then
        receive(arg1, arg2, arg3, arg4)
    elseif (event == "LOOT_OPENED" or event == "LOOT_SLOT_CLEARED") then
        updateLootItems()
    elseif (event == "CHAT_MSG_LOOT") then
        parseLootMessage(arg1, arg2)
    elseif (event == "INSPECT_READY") then
        inspectTarget()
    end
end
eventFrame:SetScript("OnEvent", eventFrame.OnEvent)

print("Addon loaded... PersonalRollLoot "..GetAddOnMetadata("PersonalRollLoot", "Version"))
