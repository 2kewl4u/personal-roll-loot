-- namespace
local _, ns = ...;
-- imports
local CLASS_ROLES = ns.CLASS_ROLES
local Instance = ns.Instance
local ITEM_LIST = ns.ITEM_LIST
local Player = ns.Player
local RAIDS = ns.RAIDS
local ROLES = ns.ROLES
local ScrollList = ns.ScrollList
local utils = ns.utils
local utilsUI = ns.utilsUI

-- saved variables
PersonalRollLootDB = {}
local PLAYER_LIST = {}
local INSTANCE_LIST = {}
local activateInstance


local function encodeRollOrderInfo(itemId, rollOrder)
    local ordercsv = utils.toCSV(rollOrder, function(index, roundAndplayerName)
        return roundAndplayerName[1].."-"..roundAndplayerName[2]
    end)
    return itemId..":"..ordercsv
end

local function decodeRollOrderInfo(info)
    local itemId, rollOrderCSV = strsplit(":", info)
    itemId = tonumber(itemId)
    if (itemId) then
        local rollOrder = utils.fromCSV(rollOrderCSV, function(list, element)
            local round, playerName = strsplit("-", element)
            round = tonumber(round)
            if (playerName and round) then
                table.insert(list, { round, playerName })
            end
        end)
        -- TODO sort the roll order
        return itemId, (rollOrder or {})
    end
end

local function getPlayerNameAndRealm(arg)
    if (not arg) then error("> No player name specified.", 0) end
    local name, realm = UnitName(arg)
    if not name then error("> No player found with the name '"..arg.."'.", 0) end
    if not realm then realm = GetRealmName() end
    return name, realm
end

-- move to cmd file
local function getPlayer(arg)
    local name, realm = getPlayerNameAndRealm(arg)
    local player = PLAYER_LIST[name]
    if (not player) then error("> No player registered with the name '"..name.."'.", 0) end
    return player
end

-- move to cmd file
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
        if (item.itemId == itemId or item.name == arg) then
            return item
        end
    end
    error("> Item with itemId or name '"..arg.."' not found.", 0)
end

local function getInstance(name)
    if (not name) then error("> No instance name specified.", 0) end
    local instance = INSTANCE_LIST[name]
    if (not instance) then error("> No instance with the name '"..name.."' found.", 0) end
    return instance
end

local function checkRaidName(raidName)
    if (not raidName) then error("> No raid name specified.", 0) end
    if (not RAIDS[raidName]) then error("> No raid with the name '"..raidName.."' found.", 0) end
end

local function printInstanceInfo(instance)
    print("> Instance '"..instance["name"].."':")
    print("  Raid: '"..instance["raid"].."'")
    print("  created: "..instance["created"])
end

local function printMessage(text, type, receiver)
    if (not receiver) then
        print(text)
    else
        if (UnitExists(receiver)) then
            SendChatMessage(text, type, nil, receiver)
        end
    end
end

local function printPlayerInfo(player, receiver)
    local type = "WHISPER"
    printMessage("> Player '"..player["name"].."', Class: "..player["class"]..",", type, receiver)

    printMessage("Roles:", type, receiver)
    local roles = player["roles"]
    for l,_ in pairs(roles) do
        printMessage("  "..l, type, receiver)
    end

    printMessage("Need-list:", type, receiver)
    local needlist = player.needlist
    for itemId,_ in pairs(needlist) do
        local item = ITEM_LIST[itemId]
        if (item) then printMessage("  "..item.name, type, receiver) end
    end
end

local memberInfo
local updateMemberInfo
local createMemberInfo
local setMemberInfo
local setRollOrderInfo

local function forEachRaidMember(action)
    local memberCount = GetNumGroupMembers()
    for index = 1, memberCount do
        local member = GetRaidRosterInfo(index)
        if (UnitExists(member)) then
            local name, realm = UnitName(member)
            action(name, realm)
        end
    end
end

local function announceMemberInfo()
    -- TODO only announce if you are the raid/group leader
    forEachRaidMember(function(name)
        local player = PLAYER_LIST[name]
        if (player) then
            local message = player:encode()
            AddonMessage_Send("PRLMemberInfo", message, "WHISPER", player.name)
        else
            print("> Player '"..name.."' is not registered for Personal Roll Loot.")
        end
    end)
    -- we always can announce to ourselves without sending a message
    local player = PLAYER_LIST[UnitName("player")]
    if (player) then
        -- TODO make a deep copy instead of simply encoding the player
        player = Player.decode(player:encode())
        setMemberInfo(player)
    end
end

local function announceRollOrderInfo(itemId, rollOrder)
    local instance = INSTANCE_LIST[activateInstance]
    if (instance) then
        local message = encodeRollOrderInfo(itemId, rollOrder)
        forEachRaidMember(function(name)
            local player = PLAYER_LIST[name]
            if (player) then
                if (instance.players[name]) then
                    AddonMessage_Send("PRLRollOrderInfo", message, "WHISPER", name)
                else
                    print("> Player '"..name.."' is not invited to the currently active instance.")
                end
            else
                print("> Player '"..name.."' is not registered for Personal Roll Loot.")
            end
        end)
        -- we always can announce to ourselves without sending a message
        itemId, rollOrder = decodeRollOrderInfo(message)
        setRollOrderInfo(itemId, rollOrder)
    else
        print("> No active instance.")
    end
end

-- the roll algorithm
local rollItem
local rollOrder = {}

local function roll(itemIdOrName)
    local instance = getInstance(activateInstance)
    local item = getItem(itemIdOrName)
    local itemId = item.itemId
    rollItem = item
    --  print("> Rolling item '"..item.name.."' ("..item.itemId..")")
    local round = 1
    local roll
    local rollOrderList = {}
    repeat
        roll = false
        local playerList
        for name, lootlist in pairs(instance.players) do
            local lootId = lootlist[round]
            if (lootId) then
                -- keep on rolling
                roll = true
                if (itemId == lootId) then
                    table.insert(rollOrderList, { round, name })
                    playerList = playerList or "Round "..round..":"
                    playerList = playerList.." "..name
                end
            end
        end
        --    if (playerList) then print(playerList) end
        round = round + 1
    until(not roll)
    rollOrder = rollOrderList
end

-- ------------------------------------------------------- --
-- slash commands                                          --
-- ------------------------------------------------------- --
local COMMANDS = {
    ["add-player"] = function(arg)
        if (not arg) then
            local added = 0
            local memberCount = GetNumGroupMembers()
            for index = 1, memberCount do
                local member = GetRaidRosterInfo(index)
                local name, realm = getPlayerNameAndRealm(member)

                if (not PLAYER_LIST[name]) and UnitIsPlayer(member) then
                    local _,class,_ = UnitClass(member)
                    PLAYER_LIST[name] = Player.new(name,realm,class)
                    added = added + 1
                end
            end
            print("> Added "..added.." players.")
        else
            local name, realm = getPlayerNameAndRealm(arg)

            -- check if we already have the player
            if (PLAYER_LIST[name]) then error("> Player '"..name.."' already registered.", 0) end

            -- add the player to our database
            if (not UnitIsPlayer(arg)) then error("> Unit '"..name.."' is not a player.", 0) end
            local _,class,_ = UnitClass(arg)

            PLAYER_LIST[name] = Player.new(name,realm,class)
            print("> Added player '"..name.."-"..realm.."', "..class..".")
        end
    end,

    ["remove-player"] = function(arg)
        if (not arg) then error("> No player name specified.", 0) end
        local player = PLAYER_LIST[arg]
        if (not player) then player = getPlayer(arg) end

        local name = player["name"]
        -- remove the player
        PLAYER_LIST[name] = nil
        print("> Removed player '"..name.."'.")
    end,

    ["player-info"] = function(arg)
        local player = getPlayer(arg)
        printPlayerInfo(player, nil)
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
        player:addItem(item)
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

    ["create-instance"] = function(arg)
        arg = arg or ""
        local name, raidName = strsplit(" ", arg, 2)
        if (strlen(name) < 1) then error("> Invalid instance name '"..name.."'.", 0) end
        checkRaidName(raidName)

        if (INSTANCE_LIST[name]) then error("> An instance with the name '"..name.."' is already registered.", 0) end
        INSTANCE_LIST[name] = Instance.new(name, raidName)
        print("> Created new instance '"..name.."'.")
    end,

    ["delete-instance"] = function(arg)
        local instance = getInstance(arg)
        local name = instance.name
        INSTANCE_LIST[name] = nil
        print("> Removed instance '"..name.."'.")
        if (activateInstance == name) then activateInstance = nil end
    end,

    ["instance-info"] = function(arg)
        -- no arguments, print all instances
        if (not arg) then
            local empty = true
            for name,instance in pairs(INSTANCE_LIST) do
                printInstanceInfo(instance)
                empty = false
            end
            if (empty) then print("> No instances found.") end
        else
            local instance = getInstance(arg)
            printInstanceInfo(instance)
        end
    end,

    ["active-instance"] = function(arg)
        local instance = getInstance(arg)
        activateInstance = instance["name"]
        print("> Instance '"..activateInstance.."' is now the active instance.")
    end,

    ["invite"] = function(arg)
        if (not activateInstance) then error("> No active instance.", 0) end
        local instance = getInstance(activateInstance)

        if (not arg) then
            local invited = 0
            local memberCount = GetNumGroupMembers()
            for index = 1, memberCount do
                local member = GetRaidRosterInfo(index)
                local name, realm = getPlayerNameAndRealm(member)
                local player = getPlayer(name)

                if (instance:addPlayer(player)) then
                    invited = invited + 1
                end
            end
            print("> Invited "..invited.." players.")
        else
            local player = getPlayer(arg)
            instance:addPlayer(player, true)
            print("> Created loot table for player '"..player.name.."'.")
        end
    end,

    ["roll"] = roll,
    ["announce"] = announceMemberInfo
}

-- ------------------------------------------------------- --
-- register the slash commands and call the command table  --
-- ------------------------------------------------------- --
local toggleMasterUI
local toggleMemberUI
SLASH_PersonalRollLootMember1 = "/prl"
SLASH_PersonalRollLootMember2 = "/personal"
SlashCmdList["PersonalRollLootMember"] = function(s)
    -- no command specified, open the UI
    toggleMemberUI()
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
        toggleMasterUI()
    end

    PersonalRollLootDB["PLAYER_LIST"] = PLAYER_LIST
    PersonalRollLootDB["INSTANCE_LIST"] = INSTANCE_LIST
    PersonalRollLootDB["activateInstance"] = activateInstance
end

local test
SLASH_PersonalRollLootTest1 = "/test"
SlashCmdList["PersonalRollLootTest"] = function(s) test(s) end



-- ------------------------------------------------------- --
-- create the UI                                           --
-- ------------------------------------------------------- --
local MasterUIFrame
local playerNameField
local roleButtons = {}
local playerItemScrollList
local tabs = {}
local numTabs = 3
local playerTabFrame
local instancesTabFrame
local rollTabFrame

local instanceNameField
local instanceRaidField
local instanceCreatedField
local instancePlayersScrollList
local lootItems = {}
local rollItemField
local rollOrderScrollList

-- layout constants
local COLUMN_WIDTH = 155
local TEXT_FIELD_HEIGHT = 20
local ITEM_BUTTON_HEIGHT = 41
local WINDOW_WIDTH = 410
local WINDOW_HEIGHT = 485
local MARGIN = 12
local SPACING = 6

-- menu functions
local function hideTooltip()
    GameTooltip:Hide()
end

local function showPlayerTooltip(button, playerName)
    local unitName = playerName
    local name, realm = UnitName(playerName)
    if (name and realm) then
        unitName = name.."-"..realm
    end
    GameTooltip:SetOwner(button, "ANCHOR_BOTTOMRIGHT")
    GameTooltip:SetUnit(unitName)
end

local function createBorder(frame)
    CreateFrame("Frame", nil, frame, "InsetFrameTemplate"):SetAllPoints()
end

MasterUIFrame = CreateFrame("Frame", "PersonalRollLootMaster", UIParent, "UIPanelDialogTemplate")
MasterUIFrame:SetAttribute("UIPanelLayout-defined", true)
MasterUIFrame:SetAttribute("UIPanelLayout-enabled", true)
MasterUIFrame:SetAttribute("UIPanelLayout-area", "left")
MasterUIFrame:SetAttribute("UIPanelLayout-pushable", 5)
MasterUIFrame:SetAttribute("UIPanelLayout-width", WINDOW_WIDTH)
MasterUIFrame:SetAttribute("UIPanelLayout-whileDead", true)
MasterUIFrame:SetSize(WINDOW_WIDTH, WINDOW_HEIGHT)
MasterUIFrame:SetPoint("CENTER")
MasterUIFrame.Title:SetText("Personal Roll Loot - Master")
MasterUIFrame.numTabs = numTabs
HideUIPanel(MasterUIFrame)
-- create tabs
for tabIndex = 1, numTabs do
    local tabButton = CreateFrame("Button", MasterUIFrame:GetName().."Tab"..tabIndex, MasterUIFrame, "CharacterFrameTabButtonTemplate")
    local tabFrame = CreateFrame("Frame", nil, MasterUIFrame)
    tabButton.contentFrame = tabFrame
    tabs[tabIndex] = tabButton

    tabButton:SetID(tabIndex)
    tabButton:SetText("Tab"..tabIndex)
    tabButton:SetScript("OnClick", function()
        PanelTemplates_SetTab(MasterUIFrame, tabIndex)
        for index, tab in pairs(tabs) do
            if (index == tabIndex) then
                tab.contentFrame:Show()
            else
                tab.contentFrame:Hide()
            end
        end
    end)
    if (tabIndex == 1) then
        tabButton:SetPoint("TOPLEFT", MasterUIFrame, "BOTTOMLEFT", 5, 7)
    else
        tabButton:SetPoint("TOPLEFT", tabs[tabIndex - 1], "TOPRIGHT", -14, 0)
    end

    tabFrame:SetPoint("TOPLEFT", PersonalRollLootMasterDialogBG, "TOPLEFT", 0, 0)
    tabFrame:SetPoint("BOTTOMRIGHT", PersonalRollLootMasterDialogBG, "BOTTOMRIGHT", 0, 0)
    if (tabIndex ~= 1) then tabFrame:Hide() end
end
PanelTemplates_SetTab(MasterUIFrame, 1)
-- set the tab names
tabs[1]:SetText("Players")
tabs[2]:SetText("Instances")
tabs[3]:SetText("Roll")
playerTabFrame = tabs[1].contentFrame
instancesTabFrame = tabs[2].contentFrame
rollTabFrame = tabs[3].contentFrame

-- --------------------------------------------------------- --
-- the player list to add and remove players to the tracking --
-- --------------------------------------------------------- --
local playerScrollList = ScrollList.new("PersonalRollLootPlayerListScrollFrame", playerTabFrame, 19)
playerScrollList:SetPoint("TOPLEFT", playerTabFrame, "TOPLEFT", MARGIN, -MARGIN)
playerScrollList:SetPoint("BOTTOMLEFT", playerTabFrame, "BOTTOMLEFT", MARGIN, TEXT_FIELD_HEIGHT + MARGIN + SPACING)
playerScrollList:SetWidth(COLUMN_WIDTH)
playerScrollList:SetButtonHeight(TEXT_FIELD_HEIGHT)
playerScrollList:SetLabelProvider(function(k, v) return k end)
playerScrollList:SetContentProvider(function() return PLAYER_LIST end)
playerScrollList:SetButtonScript("OnClick", function(index, button, name, player)
    playerNameField:SetText(name..", "..player.class)
    for role in pairs(ROLES) do
        local roleButton = roleButtons[role]
        local checked = player.roles[role] == true
        roleButton:SetChecked(checked)
        if (CLASS_ROLES[player.class][role]) then
            roleButton:SetEnabled(true)
            roleButton.text:SetFontObject("GameFontNormal")
        else
            roleButton:SetEnabled(false)
            roleButton.text:SetFontObject("GameFontDisable")
        end
    end
    playerNameField.player = player
    playerItemScrollList:Update()
end)
playerScrollList:SetButtonScript("OnEnter", function(index, button, name, player)
    showPlayerTooltip(button, name)
end)
playerScrollList:SetButtonScript("OnLeave", hideTooltip)
createBorder(playerScrollList:GetFrame())

local addPlayerButton = CreateFrame("Button", nil, playerTabFrame, "GameMenuButtonTemplate")
addPlayerButton:SetPoint("BOTTOMLEFT", playerTabFrame, "BOTTOMLEFT", MARGIN, MARGIN)
addPlayerButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
addPlayerButton:SetText("Add Player(s)")
addPlayerButton:SetScript("OnClick", function()
    local cmd = COMMANDS["add-player"]
    local name = UnitName("target")
    local status, err = pcall(cmd, name)
    if (not status) then
        print(err)
    else
        playerScrollList:Update()
    end
end)

playerNameField = playerTabFrame:CreateFontString(nil, "OVERLAY")
playerNameField:SetPoint("TOPLEFT", playerTabFrame, "TOPLEFT", WINDOW_WIDTH / 2 + SPACING, -MARGIN)
playerNameField:SetFontObject("GameFontHighlightLEFT")
playerNameField:SetText("Player Name")
playerNameField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)

-- role buttons
local roleIndex = 0
for role in pairs(ROLES) do
    local roleButton = CreateFrame("CheckButton", nil, playerTabFrame, "UICheckButtonTemplate")
    roleButton:SetPoint("TOPLEFT", playerNameField, "BOTTOMLEFT", 0, (-SPACING - TEXT_FIELD_HEIGHT * roleIndex))
    roleButton.text:SetText(role)
    roleButton.text:SetFontObject("GameFontDisable")
    roleButton:SetEnabled(false)
    roleButton.role = role
    roleButton:SetScript("OnClick", function()
        local player = playerNameField.player
        local name = player.name
        if (player) then
            local checked = roleButton:GetChecked()
            if (checked) then
                player.roles[role] = true
            else
                player.roles[role] = nil
            end
        end
    end)
    roleButtons[role] = roleButton
    roleIndex = roleIndex + 1
end

-- item list
playerItemScrollList = ScrollList.new("PersonalRollLootPlayerItemListScrollFrame", playerTabFrame, 6, "LargeItemButtonTemplate")
playerItemScrollList:SetPoint("BOTTOMLEFT", playerTabFrame, "BOTTOMLEFT", WINDOW_WIDTH / 2 + SPACING, TEXT_FIELD_HEIGHT + MARGIN + SPACING)
playerItemScrollList:SetSize(COLUMN_WIDTH, 6 * ITEM_BUTTON_HEIGHT + SPACING)
playerItemScrollList:SetButtonHeight(ITEM_BUTTON_HEIGHT)
playerItemScrollList:SetContentProvider(function() return ITEM_LIST end)
playerItemScrollList:SetLabelProvider(function(itemId, item, button)
    local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType,
        itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(item.itemId)

    local disabled = true
    local player = playerNameField.player
    if (player) then
        if (player.needlist[item.itemId]) then disabled = false end
    end

    if (itemName) then
        button.Icon:SetTexture(itemTexture)
        button.Name:SetText(itemName)
        if (disabled) then
            button.Name:SetFontObject("GameFontDisable")
        else
            button.Name:SetFontObject("GameFontHighlight")
        end
    end
end)
playerItemScrollList:SetButtonScript("OnClick", function(index, button, itemId, item)
    local player = playerNameField.player
    if (player) then
        local state = player.needlist[itemId]
        -- toggle the item state
        if (state) then state = nil else state = true end
        player.needlist[itemId] = state
        playerItemScrollList:Update()
    end
end)
playerItemScrollList:SetFilter(function(itemId, item)
    local classes = item.classes
    local player = playerNameField.player
    if (player) then
        return item.classes[player.class]
    end
    return true
end)
playerItemScrollList:SetButtonScript("OnEnter", function(index, button, itemId, item)
    GameTooltip:SetOwner(button, "ANCHOR_BOTTOMRIGHT")
    GameTooltip:SetItemByID(itemId)
end)
playerItemScrollList:SetButtonScript("OnLeave", hideTooltip)
-- border frame for the list
createBorder(playerItemScrollList:GetFrame())

local removePlayerButton = CreateFrame("Button", nil, playerTabFrame, "GameMenuButtonTemplate")
removePlayerButton:SetPoint("BOTTOMLEFT", playerTabFrame, "BOTTOMLEFT", WINDOW_WIDTH / 2 + SPACING, MARGIN)
removePlayerButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
removePlayerButton:SetText("Remove Player")
removePlayerButton:SetScript("OnClick", function()
    local player = playerNameField.player
    if (player) then
        PLAYER_LIST[player.name] = nil
        -- update UI elements
        playerNameField:SetText("Player Name")
        playerNameField.player = nil
        playerScrollList:Update()
        playerItemScrollList:Update()
        for role, roleButton in pairs(roleButtons) do
            roleButton:SetChecked(false)
        end
    end
end)

-- instances tab
local instanceScrollList = ScrollList.new("PersonalRollLootInstanceListScrollFrame", instancesTabFrame, 15)
instanceScrollList:SetPoint("TOPLEFT", instancesTabFrame, "TOPLEFT", MARGIN, -MARGIN)
instanceScrollList:SetPoint("BOTTOMLEFT", instancesTabFrame, "BOTTOMLEFT", MARGIN, MARGIN + 4 * (TEXT_FIELD_HEIGHT + SPACING) + 10)
instanceScrollList:SetWidth(COLUMN_WIDTH)
instanceScrollList:SetButtonHeight(TEXT_FIELD_HEIGHT)
instanceScrollList:SetLabelProvider(function(k, v) return k end)
instanceScrollList:SetContentProvider(function() return INSTANCE_LIST end)
instanceScrollList:SetButtonScript("OnClick", function(index, button, name, instance)
    activateInstance = name
    instanceNameField:SetText("Instance: "..name)
    instanceRaidField:SetText("Raid: "..instance.raid)
    instanceCreatedField:SetText(instance.created)
    instancePlayersScrollList:Update()
end)
createBorder(instanceScrollList:GetFrame())

local newInstanceLabel = instancesTabFrame:CreateFontString(nil, "OVERLAY")
newInstanceLabel:SetPoint("TOPLEFT", instanceScrollList:GetFrame(), "BOTTOMLEFT", SPACING, -SPACING)
newInstanceLabel:SetFontObject("GameFontNormalLEFT")
newInstanceLabel:SetText("New Instance")
newInstanceLabel:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)

local newInstanceEditBox = CreateFrame("Editbox", nil, instancesTabFrame, "InputBoxTemplate")
newInstanceEditBox:SetPoint("TOPLEFT", newInstanceLabel, "BOTTOMLEFT", 0, 0)
newInstanceEditBox:SetSize(COLUMN_WIDTH, 25)
newInstanceEditBox:SetAutoFocus(false)
newInstanceEditBox:ClearFocus()

local newInstanceRaidDropDown = CreateFrame("Frame", nil, instancesTabFrame, "UIDropDownMenuTemplate")
newInstanceRaidDropDown:SetPoint("TOPLEFT", newInstanceEditBox, "BOTTOMLEFT", -23, -SPACING)
newInstanceRaidDropDown:SetHeight(25)
UIDropDownMenu_SetWidth(newInstanceRaidDropDown, 145) -- Use in place :SetWidth
UIDropDownMenu_Initialize(newInstanceRaidDropDown, function(self, level, menuList)
    local menuItem = UIDropDownMenu_CreateInfo()
    for raid in pairs(RAIDS) do
        menuItem.text = raid
        menuItem.func = function()
            newInstanceRaidDropDown.value = raid
            UIDropDownMenu_SetText(newInstanceRaidDropDown, raid)
        end
        UIDropDownMenu_AddButton(menuItem)
    end
end)

local addInstanceButton = CreateFrame("Button", nil, instancesTabFrame, "GameMenuButtonTemplate")
addInstanceButton:SetPoint("BOTTOMLEFT", instancesTabFrame, "BOTTOMLEFT", MARGIN, MARGIN)
addInstanceButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
addInstanceButton:SetText("Add Instance")
addInstanceButton:SetScript("OnClick", function()
    local name = newInstanceEditBox:GetText()
    local raid = newInstanceRaidDropDown.value
    if (name and raid) then
        local cmd = COMMANDS["create-instance"]
        local status, err = pcall(cmd, name.." "..raid)
        if (not status) then
            print(err)
        else
            instanceScrollList:Update()
        end
        -- clear name
        newInstanceEditBox:SetText("")
        newInstanceEditBox:ClearFocus()
    end
end)

instanceNameField = instancesTabFrame:CreateFontString(nil, "OVERLAY")
instanceNameField:SetPoint("TOPLEFT", instancesTabFrame, "TOPLEFT", WINDOW_WIDTH / 2 + SPACING, -MARGIN)
instanceNameField:SetFontObject("GameFontHighlightLEFT")
instanceNameField:SetText("Instance:")
instanceNameField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)

instanceRaidField = instancesTabFrame:CreateFontString(nil, "OVERLAY")
instanceRaidField:SetPoint("TOPLEFT", instanceNameField, "BOTTOMLEFT", 0, 0)
instanceRaidField:SetFontObject("GameFontHighlightLEFT")
instanceRaidField:SetText("Raid:")
instanceRaidField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)

instanceCreatedField = instancesTabFrame:CreateFontString(nil, "OVERLAY")
instanceCreatedField:SetPoint("TOPLEFT", instanceRaidField, "BOTTOMLEFT", 0, 0)
instanceCreatedField:SetFontObject("GameFontHighlightLEFT")
--instanceCreatedField:SetText("Created:")
instanceCreatedField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)

instancesTabFrame:SetScript("OnShow", function()
    if (activateInstance) then
        local instance = INSTANCE_LIST[activateInstance]
        if (instance) then
            instanceNameField:SetText("Instance: "..instance.name)
            instanceRaidField:SetText("Raid: "..instance.raid)
            instanceCreatedField:SetText(instance.created)
        end
    end
end)

local instancePlayersField = instancesTabFrame:CreateFontString(nil, "OVERLAY")
instancePlayersField:SetPoint("TOPLEFT", instanceCreatedField, "BOTTOMLEFT", 0, -SPACING)
instancePlayersField:SetFontObject("GameFontNormalLEFT")
instancePlayersField:SetText("Players")
instancePlayersField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)

instancePlayersScrollList = ScrollList.new("PersonalRollLootInstancePlayerListScrollFrame", instancesTabFrame, 12)
instancePlayersScrollList:SetPoint("TOPLEFT", instancePlayersField, "BOTTOMLEFT", 0, -SPACING)
instancePlayersScrollList:SetPoint("BOTTOMLEFT", instancePlayersField, "BOTTOMLEFT", -6, -262)
instancePlayersScrollList:SetWidth(COLUMN_WIDTH)
instancePlayersScrollList:SetButtonHeight(TEXT_FIELD_HEIGHT)
instancePlayersScrollList:SetLabelProvider(function(name, lootlist) return name end)
instancePlayersScrollList:SetContentProvider(function()
    if (activateInstance) then
        local instance = INSTANCE_LIST[activateInstance]
        if (instance) then
            return instance.players or {}
        end
    end
    return {}
end)
instancePlayersScrollList:SetButtonScript("OnEnter", function(index, button, name, lootlist)
    showPlayerTooltip(button, name)
end)
instancePlayersScrollList:SetButtonScript("OnLeave", hideTooltip)
createBorder(instancePlayersScrollList:GetFrame())

local deleteInstanceButton = CreateFrame("Button", nil, instancesTabFrame, "GameMenuButtonTemplate")
deleteInstanceButton:SetPoint("BOTTOMLEFT", instancesTabFrame, "BOTTOMLEFT", WINDOW_WIDTH / 2 + SPACING, MARGIN)
deleteInstanceButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
deleteInstanceButton:SetText("Delete Instance")
deleteInstanceButton:SetScript("OnClick", function()
    local cmd = COMMANDS["delete-instance"]
    local status, err = pcall(cmd, activateInstance)
    if (not status) then
        print(err)
    else
        instanceNameField:SetText("Instance:")
        instanceRaidField:SetText("Raid:")
        --    instanceCreatedField:SetText("Created:")
        instanceScrollList:Update()
        instancePlayersScrollList:Update()
    end
end)

local inviteButton = CreateFrame("Button", nil, instancesTabFrame, "GameMenuButtonTemplate")
inviteButton:SetPoint("BOTTOMLEFT", deleteInstanceButton, "TOPLEFT", 0, SPACING)
inviteButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
inviteButton:SetText("Invite")
inviteButton:SetScript("OnClick", function()
    local cmd = COMMANDS["invite"]
    local status, err = pcall(cmd)
    if (not status) then
        print(err)
    else
        instancePlayersScrollList:Update()
    end
end)

local announceButton = CreateFrame("Button", nil, instancesTabFrame, "GameMenuButtonTemplate")
announceButton:SetPoint("BOTTOMLEFT", inviteButton, "TOPLEFT", 0, SPACING)
announceButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
announceButton:SetText("Announce")
announceButton:SetScript("OnClick", announceMemberInfo)

local function updateRollOrderFields(index, button, itemId, item)
    -- perform the roll before
    local status, err = pcall(roll, itemId)
    if (not status) then
        print(err)
    else
        if (rollItem) then
            local itemName = GetItemInfo(rollItem.itemId) or rollItem.name
            rollItemField:SetText("Item: "..itemName)
            rollOrderScrollList:Update()
            -- announce roll order info
            announceRollOrderInfo(rollItem.itemId, rollOrder)
        end
    end
end

local rollItemsScrollList = ScrollList.new("PersonalRollLootRollItemScrollFrame", rollTabFrame, 10, "LargeItemButtonTemplate")
rollItemsScrollList:SetPoint("TOPLEFT", rollTabFrame, "TOPLEFT", MARGIN, -MARGIN)
rollItemsScrollList:SetSize(COLUMN_WIDTH, 10 * ITEM_BUTTON_HEIGHT + SPACING)
rollItemsScrollList:SetButtonHeight(ITEM_BUTTON_HEIGHT)
rollItemsScrollList:SetContentProvider(function() return ITEM_LIST end)
rollItemsScrollList:SetLabelProvider(function(itemId, item, button)
    local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType,
        itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(item.itemId)
    -- in case we got no info
    if (itemName) then
        button.Icon:SetTexture(itemTexture)
        button.Name:SetText(itemName)
    end
end)
createBorder(rollItemsScrollList:GetFrame())
rollItemsScrollList:SetButtonScript("OnEnter", function(index, button, itemId, item)
    GameTooltip:SetOwner(button, "ANCHOR_BOTTOMRIGHT")
    GameTooltip:SetItemByID(itemId)
end)
rollItemsScrollList:SetButtonScript("OnLeave", hideTooltip)
rollItemsScrollList:SetButtonScript("OnClick", updateRollOrderFields)
rollItemsScrollList:SetFilter(function(itemId, item)
    if (activateInstance) then
        local instance = INSTANCE_LIST[activateInstance]
        return item.raids[instance.raid]
    end
end)

local lootItemsField = rollTabFrame:CreateFontString(nil, "OVERLAY")
lootItemsField:SetPoint("TOPLEFT", rollTabFrame, "TOPLEFT", WINDOW_WIDTH / 2 + SPACING, -MARGIN)
lootItemsField:SetFontObject("GameFontNormalLEFT")
lootItemsField:SetText("Loot")
lootItemsField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)

local lootItemsScrollList = ScrollList.new("PersonalRollLootLootItemScrollFrame", rollTabFrame, 3, "LargeItemButtonTemplate")
lootItemsScrollList:SetPoint("TOPLEFT", lootItemsField, "BOTTOMLEFT", 0, -SPACING)
lootItemsScrollList:SetSize(COLUMN_WIDTH, 3 * ITEM_BUTTON_HEIGHT + SPACING)
lootItemsScrollList:SetButtonHeight(ITEM_BUTTON_HEIGHT)
createBorder(lootItemsScrollList:GetFrame())
lootItemsScrollList:SetContentProvider(function() return lootItems end)
lootItemsScrollList:SetLabelProvider(function(itemId, item, button)
    local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType,
        itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemId)

    if (itemName) then
        button.Icon:SetTexture(itemTexture)
        button.Name:SetText(itemName)
        button.Name:SetFontObject("GameFontHighlight")
    end
end)
lootItemsScrollList:SetButtonScript("OnEnter", function(index, button, itemId, item)
    GameTooltip:SetOwner(button, "ANCHOR_BOTTOMRIGHT")
    GameTooltip:SetItemByID(itemId)
end)
lootItemsScrollList:SetButtonScript("OnLeave", hideTooltip)
lootItemsScrollList:SetButtonScript("OnClick", updateRollOrderFields)

local lootPrioField = rollTabFrame:CreateFontString(nil, "OVERLAY")
lootPrioField:SetPoint("TOPLEFT", lootItemsScrollList:GetFrame(), "BOTTOMLEFT", 0, -SPACING)
lootPrioField:SetFontObject("GameFontNormalLEFT")
lootPrioField:SetText("Loot Priority Order")
lootPrioField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)

rollItemField = rollTabFrame:CreateFontString(nil, "OVERLAY")
rollItemField:SetPoint("TOPLEFT", lootPrioField, "BOTTOMLEFT", 0, 0)
rollItemField:SetFontObject("GameFontHighlightLEFT")
rollItemField:SetText("Item: -")
rollItemField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
local rollItemFieldButton = CreateFrame("Button", rollItemField)
rollItemFieldButton:SetPoint("TOPLEFT", rollItemField, "TOPLEFT", 0, 0)
rollItemFieldButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
rollItemFieldButton:SetScript("OnEnter", function()
    if (rollItem) then
        GameTooltip:SetOwner(rollItemField, "ANCHOR_BOTTOMRIGHT")
        GameTooltip:SetItemByID(rollItem.itemId)
    end
end)
rollItemFieldButton:SetScript("OnLeave", hideTooltip)

rollOrderScrollList = ScrollList.new("PersonalRollLootLootOrderScrollFrame", rollTabFrame, 10)
rollOrderScrollList:SetPoint("TOPLEFT", rollItemField, "BOTTOMLEFT", 0, -SPACING)
rollOrderScrollList:SetPoint("BOTTOM", rollItemsScrollList:GetFrame(), "BOTTOM", 0, 0)
rollOrderScrollList:SetWidth(COLUMN_WIDTH)
rollOrderScrollList:SetButtonHeight(TEXT_FIELD_HEIGHT)
rollOrderScrollList:SetContentProvider(function() return rollOrder end)
rollOrderScrollList:SetLabelProvider(function(index, roundAndPlayerName)
    local round = roundAndPlayerName[1]
    local playerName = roundAndPlayerName[2]
    return round.." - "..playerName
end)
rollOrderScrollList:SetButtonScript("OnEnter", function(index, button, roundIndex, roundAndPlayerName)
    showPlayerTooltip(button, roundAndPlayerName[2])
end)
rollOrderScrollList:SetButtonScript("OnLeave", hideTooltip)
createBorder(rollOrderScrollList:GetFrame())


-- ------------------------------------------------------- --
-- create the member UI                                    --
-- ------------------------------------------------------- --
local MemberUIFrame
local memberTabFrame
local memberNameField
local memberRoleButtons = {}
local memberItemScrollList

MemberUIFrame = CreateFrame("Frame", "PersonalRollLootMember", UIParent, "UIPanelDialogTemplate")
MemberUIFrame:SetAttribute("UIPanelLayout-defined", true)
MemberUIFrame:SetAttribute("UIPanelLayout-enabled", true)
MemberUIFrame:SetAttribute("UIPanelLayout-area", "left")
MemberUIFrame:SetAttribute("UIPanelLayout-pushable", 6)
MemberUIFrame:SetAttribute("UIPanelLayout-width", WINDOW_WIDTH)
MemberUIFrame:SetAttribute("UIPanelLayout-whileDead", true)
MemberUIFrame:SetSize(WINDOW_WIDTH, WINDOW_HEIGHT)
MemberUIFrame:SetPoint("CENTER")
MemberUIFrame.Title:SetText("Personal Roll Loot")
HideUIPanel(MemberUIFrame)

memberTabFrame = CreateFrame("Frame", nil, MemberUIFrame)
memberTabFrame:SetPoint("TOPLEFT", PersonalRollLootMemberDialogBG, "TOPLEFT", 0, 0)
memberTabFrame:SetPoint("BOTTOMRIGHT", PersonalRollLootMemberDialogBG, "BOTTOMRIGHT", 0, 0)
memberTabFrame:SetScript("OnShow", updateMemberInfo)

memberNameField = memberTabFrame:CreateFontString(nil, "OVERLAY")
memberNameField:SetPoint("TOPLEFT", memberTabFrame, "TOPLEFT", MARGIN, -MARGIN)
memberNameField:SetFontObject("GameFontHighlightLEFT")
memberNameField:SetText("Player Name")
memberNameField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)

-- role buttons
local roleIndex = 0
for role in pairs(ROLES) do
    local roleButton = CreateFrame("CheckButton", nil, memberTabFrame, "UICheckButtonTemplate")
    roleButton:SetPoint("TOPLEFT", memberNameField, "BOTTOMLEFT", 0, -(SPACING + TEXT_FIELD_HEIGHT * roleIndex))
    roleButton.text:SetText(role)
    roleButton.text:SetFontObject("GameFontDisable")
    roleButton:SetEnabled(false)
    roleButton.role = role
    memberRoleButtons[role] = roleButton
    roleIndex = roleIndex + 1
end

-- item list
memberItemScrollList = ScrollList.new("PersonalRollLootMemberItemListScrollFrame", memberTabFrame, 6, "LargeItemButtonTemplate")
memberItemScrollList:SetPoint("BOTTOMLEFT", memberTabFrame, "BOTTOMLEFT", MARGIN, TEXT_FIELD_HEIGHT + MARGIN + SPACING)
memberItemScrollList:SetSize(COLUMN_WIDTH, 6 * ITEM_BUTTON_HEIGHT + SPACING)
memberItemScrollList:SetButtonHeight(ITEM_BUTTON_HEIGHT)
memberItemScrollList:SetContentProvider(function() return ITEM_LIST end)
memberItemScrollList:SetLabelProvider(function(itemId, item, button)
    local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType,
        itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(item.itemId)

    local disabled = true
    local player = memberInfo
    if (player) then
        if (player.needlist[item.itemId]) then disabled = false end
    end

    if (itemName) then
        button.Icon:SetTexture(itemTexture)
        button.Name:SetText(itemName)
        if (disabled) then
            button.Name:SetFontObject("GameFontDisable")
        else
            button.Name:SetFontObject("GameFontHighlight")
        end
    end
end)
memberItemScrollList:SetFilter(function(itemId, item)
    local classes = item.classes
    local player = memberInfo
    if (player) then
        return item.classes[player.class]
    end
    return true
end)
memberItemScrollList:SetButtonScript("OnEnter", function(index, button, itemId, item)
    GameTooltip:SetOwner(button, "ANCHOR_BOTTOMRIGHT")
    GameTooltip:SetItemByID(itemId)
end)
memberItemScrollList:SetButtonScript("OnLeave", hideTooltip)
createBorder(memberItemScrollList:GetFrame())

local memberLootItemsField = memberTabFrame:CreateFontString(nil, "OVERLAY")
memberLootItemsField:SetPoint("TOPLEFT", memberTabFrame, "TOPLEFT", WINDOW_WIDTH / 2 + SPACING, -MARGIN)
memberLootItemsField:SetFontObject("GameFontNormalLEFT")
memberLootItemsField:SetText("Loot")
memberLootItemsField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)

local memberLootItemsScrollList = ScrollList.new("PersonalRollLootMemberLootItemScrollFrame", memberTabFrame, 3, "LargeItemButtonTemplate")
memberLootItemsScrollList:SetPoint("TOPLEFT", memberLootItemsField, "BOTTOMLEFT", 0, -SPACING)
memberLootItemsScrollList:SetSize(COLUMN_WIDTH, 3 * ITEM_BUTTON_HEIGHT + SPACING)
memberLootItemsScrollList:SetButtonHeight(ITEM_BUTTON_HEIGHT)
createBorder(memberLootItemsScrollList:GetFrame())
memberLootItemsScrollList:SetContentProvider(function() return lootItems end)
memberLootItemsScrollList:SetLabelProvider(function(itemId, item, button)
    local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType,
        itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemId)

    if (itemName) then
        button.Icon:SetTexture(itemTexture)
        button.Name:SetText(itemName)
        button.Name:SetFontObject("GameFontHighlight")
    end
end)
memberLootItemsScrollList:SetButtonScript("OnEnter", function(index, button, itemId, item)
    GameTooltip:SetOwner(button, "ANCHOR_BOTTOMRIGHT")
    GameTooltip:SetItemByID(itemId)
end)
memberLootItemsScrollList:SetButtonScript("OnLeave", hideTooltip)

local memberLootPrioField = memberTabFrame:CreateFontString(nil, "OVERLAY")
memberLootPrioField:SetPoint("TOPLEFT", memberLootItemsScrollList:GetFrame(), "BOTTOMLEFT", 0, -SPACING)
memberLootPrioField:SetFontObject("GameFontNormalLEFT")
memberLootPrioField:SetText("Loot Priority Order")
memberLootPrioField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)

-- these values will be submitted by the raid lead or master looter
local memberRollItem
local memberRollOrder = {}

local memberRollItemField = memberTabFrame:CreateFontString(nil, "OVERLAY")
memberRollItemField:SetPoint("TOPLEFT", memberLootPrioField, "BOTTOMLEFT", 0, 0)
memberRollItemField:SetFontObject("GameFontHighlightLEFT")
memberRollItemField:SetText("Item: -")
memberRollItemField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
local memberRollItemFieldButton = CreateFrame("Button", memberRollItemField)
memberRollItemFieldButton:SetPoint("TOPLEFT", memberRollItemField, "TOPLEFT", 0, 0)
memberRollItemFieldButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
memberRollItemFieldButton:SetScript("OnEnter", function()
    if (memberRollItem) then
        GameTooltip:SetOwner(memberRollItemField, "ANCHOR_BOTTOMRIGHT")
        GameTooltip:SetItemByID(memberRollItem.itemId)
    end
end)
memberRollItemFieldButton:SetScript("OnLeave", hideTooltip)

local memberRollOrderScrollList = ScrollList.new("PersonalRollLootMemberLootOrderScrollFrame", memberTabFrame, 9)
memberRollOrderScrollList:SetPoint("TOPLEFT", memberRollItemField, "BOTTOMLEFT", 0, -SPACING)
memberRollOrderScrollList:SetPoint("BOTTOMLEFT", memberTabFrame, "BOTTOMLEFT", WINDOW_WIDTH / 2 + SPACING, TEXT_FIELD_HEIGHT + MARGIN + SPACING)
memberRollOrderScrollList:SetWidth(COLUMN_WIDTH)
memberRollOrderScrollList:SetButtonHeight(TEXT_FIELD_HEIGHT)
memberRollOrderScrollList:SetContentProvider(function() return memberRollOrder end)
memberRollOrderScrollList:SetLabelProvider(function(index, roundAndPlayerName)
    local round = roundAndPlayerName[1]
    local playerName = roundAndPlayerName[2]
    return round.." - "..playerName
end)
memberRollOrderScrollList:SetButtonScript("OnEnter", function(index, button, roundIndex, roundAndPlayerName)
    showPlayerTooltip(button, roundAndPlayerName[2])
end)
memberRollOrderScrollList:SetButtonScript("OnLeave", hideTooltip)
createBorder(memberRollOrderScrollList:GetFrame())

createMemberInfo = function()
    if (not memberInfo) then
        local name, realm = UnitName("player")
        local _, class = UnitClass("player")
        memberInfo = Player.new(name,realm,class)
        memberInfo.roles = {}
        memberInfo.needlist = {}
    end
end

updateMemberInfo = function()
    -- create the member info if not present
    createMemberInfo()
    local class = memberInfo.class
    memberNameField:SetText(memberInfo.name..", "..class)
    for role in pairs(ROLES) do
        local roleButton = memberRoleButtons[role]
        if (memberInfo.roles[role]) then
            roleButton:SetChecked(true)
        else
            roleButton:SetChecked(false)
        end
        if (CLASS_ROLES[class][role]) then
            roleButton.text:SetFontObject("GameFontNormal")
        end
    end
    memberItemScrollList:Update()
    memberRollOrderScrollList:Update()
end

toggleMasterUI = function() utilsUI.toggleUI(MasterUIFrame) end
toggleMemberUI = function() utilsUI.toggleUI(MemberUIFrame) end


local function getItemIDForName(name)
    if (name) then
        for itemId in pairs(ITEM_LIST) do
            local itemName = GetItemInfo(itemId)
            if (name == itemName) then return itemId end
        end
    end
end

test = function()
    local lootCount = GetNumLootItems()
    for index = 1, lootCount do
        local lootIcon, lootName, lootQuantity, rarity, locked,
            isQuestItem, questId, isActive = GetLootSlotInfo(index)
        local itemId = getItemIDForName(lootName)
        if (itemId) then
            print("I know this item:")
            print(GetItemInfo(itemId))
        end
    end
end

local function updateLootItems()
    local items = {}
    -- TODO update only when in raid environment
    local lootCount = GetNumLootItems()
    for index = 1, lootCount do
        local lootIcon, lootName, lootQuantity, rarity, locked,
            isQuestItem, questId, isActive = GetLootSlotInfo(index)
        local itemId = getItemIDForName(lootName)
        if (itemId) then
            items[itemId] = ITEM_LIST[itemId]
        end
    end
    lootItems = items
    lootItemsScrollList:Update()
    memberLootItemsScrollList:Update()
end

setMemberInfo = function(player)
    -- create the member info if not present
    createMemberInfo()
    memberInfo.roles = player.roles or {}
    memberInfo.needlist = player.needlist or {}
    -- update the member info
    updateMemberInfo()
end

setRollOrderInfo = function(itemId, rollOrder)
    memberRollItem = ITEM_LIST[itemId]
    if (memberRollItem) then
        local itemName = GetItemInfo(itemId) or memberRollItem.name
        memberRollItemField:SetText("Item: "..itemName)
    end
    memberRollOrder = rollOrder or {}
    memberRollOrderScrollList:Update()
end

local function receiveMemberInfo(msg)
    if (msg) then
        local player = Player.decode(msg)
        if (player) then
            setMemberInfo(player)
        end
    end
end

local function receiveRollOrderInfo(msg)
    if (msg) then
        local itemId, rollOrder = decodeRollOrderInfo(msg)
        if (itemId and rollOrder) then
            setRollOrderInfo(itemId, rollOrder)
        end
    end
end

local function loadSavedVariables()
    PLAYER_LIST = {}
    for name, player in pairs(PersonalRollLootDB["PLAYER_LIST"]) do
        PLAYER_LIST[name] = Player.copy(player)
    end

    INSTANCE_LIST = {}
    for name, instance in pairs(PersonalRollLootDB["INSTANCE_LIST"]) do
        INSTANCE_LIST[name] = Instance.copy(instance)
    end

    activateInstance = PersonalRollLootDB["activateInstance"]
end

-- create an event frame
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("CHAT_MSG_ADDON")
eventFrame:RegisterEvent("LOOT_OPENED")
eventFrame:RegisterEvent("LOOT_SLOT_CLEARED")
C_ChatInfo.RegisterAddonMessagePrefix("PRLMemberInfo")
C_ChatInfo.RegisterAddonMessagePrefix("PRLRollOrderInfo")
function eventFrame:OnEvent(event, arg1, arg2, arg3, arg4)
    if (event == "ADDON_LOADED") then
        -- load the saved variables
        loadSavedVariables()
    elseif (event == "CHAT_MSG_ADDON") then
        --    print("received addon message: "..arg2)
        --    print("from: "..arg4)
        -- TODO only accept announcements from raid/group leader
        AddonMessage_Receive(arg1, arg2, arg3, arg4, function(prefix, message, type, sender)
            if (prefix == "PRLMemberInfo") then
                receiveMemberInfo(message)
            elseif (prefix == "PRLRollOrderInfo") then
                receiveRollOrderInfo(message)
                if (not MemberUIFrame:IsShown()) then
                    print("> Received a personal roll announcement. Type /prl to see the order.")
                    -- TODO maybe open the UI automatically:
                    ShowUIPanel(MemberUIFrame)
                end
            end
        end)
    elseif (event == "LOOT_OPENED" or event == "LOOT_SLOT_CLEARED") then
        updateLootItems()
    end
end
eventFrame:SetScript("OnEvent", eventFrame.OnEvent)

print("Addon loaded... PersonalRollLoot "..GetAddOnMetadata("PersonalRollLoot", "Version"))
