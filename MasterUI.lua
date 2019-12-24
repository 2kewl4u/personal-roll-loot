-- namespace
local _, ns = ...;
-- imports
local RAIDS = ns.RAIDS
local Roles = ns.Roles
local ScrollList = ns.ScrollList
local utils = ns.utils
local utilsUI = ns.utilsUI

local COLUMN_WIDTH = utilsUI.COLUMN_WIDTH
local TEXT_FIELD_HEIGHT = utilsUI.TEXT_FIELD_HEIGHT
local ITEM_BUTTON_HEIGHT = utilsUI.ITEM_BUTTON_HEIGHT
local WINDOW_WIDTH = utilsUI.WINDOW_WIDTH
local WINDOW_HEIGHT = utilsUI.WINDOW_HEIGHT
local MARGIN = utilsUI.MARGIN
local SPACING = utilsUI.SPACING

local ITEM_LIST = ns.ITEM_LIST

-- data
local lootItems = {}
local rollOrder

-- UI components
local playerNameField
local roleButtons = {}
local playerItemScrollList

-- TODO we need them here because we add the Scripts right after each widgets
-- so create all widgets first and then add the scripts!
local instanceNameField
local instanceRaidField
local instanceCreatedField
local instancePlayersScrollList
local rollItemField
local rollOrderScrollList

-- menu functions
local updateRoleButtons
local function updateRollOrderFields(index, button, itemId, item)
    -- perform the roll before
    local status, result = pcall(ns.roll, itemId)
    if (not status) then
        print(result)
    else
        rollOrder = result
        if (rollOrder) then
            local itemName = rollOrder.item:getName()
            rollItemField:SetText("Item: "..itemName)
            rollOrderScrollList:Update()
            -- announce roll order
            ns.announceRollOrder(rollOrder)
        end
    end
end

local MasterUIFrame = CreateFrame("Frame", "PersonalRollLootMaster", UIParent, "UIPanelDialogTemplate")
MasterUIFrame:SetAttribute("UIPanelLayout-defined", true)
MasterUIFrame:SetAttribute("UIPanelLayout-enabled", true)
MasterUIFrame:SetAttribute("UIPanelLayout-area", "left")
MasterUIFrame:SetAttribute("UIPanelLayout-pushable", 5)
MasterUIFrame:SetAttribute("UIPanelLayout-width", WINDOW_WIDTH)
MasterUIFrame:SetAttribute("UIPanelLayout-whileDead", true)
MasterUIFrame:SetSize(WINDOW_WIDTH, WINDOW_HEIGHT)
MasterUIFrame:SetPoint("CENTER")
MasterUIFrame.Title:SetText("Personal Roll Loot - Master")
HideUIPanel(MasterUIFrame)

-- create tabs
local tabs = utilsUI.createTabs(MasterUIFrame, { "Players", "Instances", "Roll" })
local playerTabFrame = tabs[1].contentFrame
local instancesTabFrame = tabs[2].contentFrame
local rollTabFrame = tabs[3].contentFrame

-- --------------------------------------------------------- --
-- the player list to add and remove players to the tracking --
-- --------------------------------------------------------- --
local playerScrollList = ScrollList.new("PersonalRollLootPlayerListScrollFrame", playerTabFrame, 18)
playerScrollList:SetPoint("TOPLEFT", playerTabFrame, "TOPLEFT", MARGIN, -MARGIN)
playerScrollList:SetPoint("BOTTOMLEFT", playerTabFrame, "BOTTOMLEFT", MARGIN, 2 * (TEXT_FIELD_HEIGHT + SPACING) + MARGIN)
playerScrollList:SetWidth(COLUMN_WIDTH)
playerScrollList:SetButtonHeight(TEXT_FIELD_HEIGHT)
playerScrollList:SetLabelProvider(function(k, v) return k end)
playerScrollList:SetContentProvider(function() return ns.DB.PLAYER_LIST end)
playerScrollList:SetButtonScript("OnClick", function(index, button, name, player)
    playerNameField:SetText(name..", "..player.class)
    playerNameField.player = player
    playerItemScrollList:Update()
    updateRoleButtons()
end)
playerScrollList:SetButtonScript("OnEnter", function(index, button, name, player)
    utilsUI.showPlayerTooltip(button, name)
end)
playerScrollList:SetButtonScript("OnLeave", utilsUI.hideTooltip)
utilsUI.createBorder(playerScrollList:GetFrame())

local addPlayerButton = CreateFrame("Button", nil, playerTabFrame, "GameMenuButtonTemplate")
addPlayerButton:SetPoint("BOTTOMLEFT", playerTabFrame, "BOTTOMLEFT", MARGIN, MARGIN)
addPlayerButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
addPlayerButton:SetText("Add Player(s)")
addPlayerButton:SetScript("OnClick", function()
    local name = UnitName("target")
    if (name) then name = "target" end
    local status, err = pcall(ns.addPlayer, name)
    if (not status) then
        print(err)
    else
        playerScrollList:Update()
    end
end)

local syncButton = CreateFrame("Button", nil, playerTabFrame, "GameMenuButtonTemplate")
syncButton:SetPoint("BOTTOMLEFT", addPlayerButton, "TOPLEFT", 0, SPACING)
syncButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
syncButton:SetText("Synchronize")
syncButton:SetScript("OnClick", function()
    local status, err = pcall(ns.requestSync)
    if (not status) then
        print(err)
    end
end)

playerNameField = playerTabFrame:CreateFontString(nil, "OVERLAY")
playerNameField:SetPoint("TOPLEFT", playerTabFrame, "TOPLEFT", WINDOW_WIDTH / 2 + SPACING, -MARGIN)
playerNameField:SetFontObject("GameFontHighlightLEFT")
playerNameField:SetText("Player Name")
playerNameField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)

-- role buttons
for roleIndex = 1, 4, 1 do
    local roleButton = CreateFrame("CheckButton", nil, playerTabFrame, "UICheckButtonTemplate")
    roleButton:SetPoint("TOPLEFT", playerNameField, "BOTTOMLEFT", 0, (-SPACING - TEXT_FIELD_HEIGHT * (roleIndex - 1)))
    roleButton.text:SetFontObject("GameFontNormal")
    roleButton:SetScript("OnClick", function()
        local player = playerNameField.player
        local role = roleButton.role
        if (player and role) then
            local checked = roleButton:GetChecked()
            local roleId = role.roleId
            if (checked) then
                player.roles[roleId] = true
            else
                player.roles[roleId] = nil
            end
            playerItemScrollList:Update()
        end
    end)
    roleButtons[roleIndex] = roleButton
end

local function updateRoleButton(button, role, checked)
    checked = checked or false
    if (role) then
        button.text:SetText(role.name)
        button:Show()
        button.role = role
    else
        button:Hide()
    end
    button:SetChecked(checked)
end

updateRoleButtons = function()
    local player = playerNameField.player
    if (player) then
        local roles = Roles.forClass(player.class)
        local index = 1
        -- hide the roles if there is only one spec
        if (utils.tblsize(roles) > 1) then
            for roleId, role in pairs(roles) do
                local button = roleButtons[index]
                updateRoleButton(button, role, player.roles[roleId])
                index = index + 1
            end
        end
        -- clear unused role buttons
        for i = index, 4, 1 do
            local button = roleButtons[i]
            updateRoleButton(button)
        end
    else
        for index, button in ipairs(roleButtons) do
            updateRoleButton(button)
        end
    end
end
updateRoleButtons()

-- item list
playerItemScrollList = ScrollList.new("PersonalRollLootPlayerItemListScrollFrame", playerTabFrame, 6, "PersonalLootItemButtonTemplate")
playerItemScrollList:SetPoint("BOTTOMLEFT", playerTabFrame, "BOTTOMLEFT", WINDOW_WIDTH / 2 + SPACING, TEXT_FIELD_HEIGHT + MARGIN + SPACING)
playerItemScrollList:SetSize(COLUMN_WIDTH, 6 * ITEM_BUTTON_HEIGHT + SPACING)
playerItemScrollList:SetButtonHeight(ITEM_BUTTON_HEIGHT)
playerItemScrollList:SetContentProvider(function()
    local player = playerNameField.player
    if (player) then
        return ITEM_LIST
    else
        return {}
    end
end)
playerItemScrollList:SetLabelProvider(function(itemId, item, button)
    local disabled = true
    local player = playerNameField.player
    if (player) then
        if (player.needlist[itemId]) then disabled = false end
    end

    button.Priority:SetText(item:getPriority(player))
    button.Icon:SetTexture(item:getTexture())
    button.Name:SetText(item:getName())
    if (disabled) then
        button.Name:SetFontObject("GameFontDisable")
    else
        if (item:hasRole(player.roles)) then
            button.Name:SetFontObject("GameFontNormal")
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
    local player = playerNameField.player
    if (player) then
        return item:isForClass(player.class)
    end
    return true
end)
playerItemScrollList:SetButtonScript("OnEnter", function(index, button, itemId, item)
    utilsUI.showItemTooltip(button, itemId)
end)
playerItemScrollList:SetButtonScript("OnLeave", utilsUI.hideTooltip)
-- border frame for the list
utilsUI.createBorder(playerItemScrollList:GetFrame())

local removePlayerButton = CreateFrame("Button", nil, playerTabFrame, "GameMenuButtonTemplate")
removePlayerButton:SetPoint("BOTTOMLEFT", playerTabFrame, "BOTTOMLEFT", WINDOW_WIDTH / 2 + SPACING, MARGIN)
removePlayerButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
removePlayerButton:SetText("Remove Player")
removePlayerButton:SetScript("OnClick", function()
    local player = playerNameField.player
    if (player) then
        ns.DB.PLAYER_LIST[player.name] = nil
        -- update UI elements
        playerNameField:SetText("Player Name")
        playerNameField.player = nil
        playerScrollList:Update()
        playerItemScrollList:Update()
        updateRoleButtons()
    end
end)

-- instances tab
local instanceScrollList = ScrollList.new("PersonalRollLootInstanceListScrollFrame", instancesTabFrame, 15)
instanceScrollList:SetPoint("TOPLEFT", instancesTabFrame, "TOPLEFT", MARGIN, -MARGIN)
instanceScrollList:SetPoint("BOTTOMLEFT", instancesTabFrame, "BOTTOMLEFT", MARGIN, MARGIN + 4 * (TEXT_FIELD_HEIGHT + SPACING) + 10)
instanceScrollList:SetWidth(COLUMN_WIDTH)
instanceScrollList:SetButtonHeight(TEXT_FIELD_HEIGHT)
instanceScrollList:SetLabelProvider(function(k, v) return k end)
instanceScrollList:SetContentProvider(function() return ns.DB.INSTANCE_LIST end)
instanceScrollList:SetButtonScript("OnClick", function(index, button, name, instance)
    local status, err = pcall(ns.activeInstance, name)
    if (not status) then
        print(err)
    else
        instanceNameField:SetText("Instance: "..name)
        instanceRaidField:SetText("Raid: "..instance.raid)
        instanceCreatedField:SetText(instance.created)
        instancePlayersScrollList:Update()
    end
end)
utilsUI.createBorder(instanceScrollList:GetFrame())

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
        local status, err = pcall(ns.createInstance, name, raid)
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
    if (ns.DB.activeInstance) then
        local instance = ns.DB.INSTANCE_LIST[ns.DB.activeInstance]
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
    if (ns.DB.activeInstance) then
        local instance = ns.DB.INSTANCE_LIST[ns.DB.activeInstance]
        if (instance) then
            return instance.players or {}
        end
    end
    return {}
end)
instancePlayersScrollList:SetButtonScript("OnEnter", function(index, button, name, lootlist)
    utilsUI.showPlayerTooltip(button, name)
end)
instancePlayersScrollList:SetButtonScript("OnLeave", utilsUI.hideTooltip)
utilsUI.createBorder(instancePlayersScrollList:GetFrame())

local deleteInstanceButton = CreateFrame("Button", nil, instancesTabFrame, "GameMenuButtonTemplate")
deleteInstanceButton:SetPoint("BOTTOMLEFT", instancesTabFrame, "BOTTOMLEFT", WINDOW_WIDTH / 2 + SPACING, MARGIN)
deleteInstanceButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
deleteInstanceButton:SetText("Delete Instance")
deleteInstanceButton:SetScript("OnClick", function()
    local status, err = pcall(ns.deleteInstance, ns.DB.activeInstance)
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
    local status, err = pcall(ns.invite)
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
announceButton:SetScript("OnClick", function() ns.announceMemberInfo() end)



local rollItemsScrollList = ScrollList.new("PersonalRollLootRollItemScrollFrame", rollTabFrame, 10, "LargeItemButtonTemplate")
rollItemsScrollList:SetPoint("TOPLEFT", rollTabFrame, "TOPLEFT", MARGIN, -MARGIN)
rollItemsScrollList:SetSize(COLUMN_WIDTH, 10 * ITEM_BUTTON_HEIGHT + SPACING)
rollItemsScrollList:SetButtonHeight(ITEM_BUTTON_HEIGHT)
rollItemsScrollList:SetContentProvider(function()
    if (ns.DB.activeInstance) then
        return ITEM_LIST
    else
        return {}
    end
end)
rollItemsScrollList:SetLabelProvider(function(itemId, item, button)
    button.Name:SetText(item:getName())
    button.Icon:SetTexture(item:getTexture())
end)
utilsUI.createBorder(rollItemsScrollList:GetFrame())
rollItemsScrollList:SetButtonScript("OnEnter", function(index, button, itemId, item)
    utilsUI.showItemTooltip(button, itemId)
end)
rollItemsScrollList:SetButtonScript("OnLeave", utilsUI.hideTooltip)
rollItemsScrollList:SetButtonScript("OnClick", updateRollOrderFields)
rollItemsScrollList:SetFilter(function(itemId, item)
    if (ns.DB.activeInstance) then
        local instance = ns.DB.INSTANCE_LIST[ns.DB.activeInstance]
        return item:dropsIn(instance)
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
utilsUI.createBorder(lootItemsScrollList:GetFrame())
lootItemsScrollList:SetContentProvider(function() return lootItems end)
lootItemsScrollList:SetLabelProvider(function(itemId, item, button)
    button.Icon:SetTexture(item:getTexture())
    button.Name:SetText(item:getName())
    button.Name:SetFontObject("GameFontHighlight")
end)
lootItemsScrollList:SetButtonScript("OnEnter", function(index, button, itemId, item)
    utilsUI.showItemTooltip(button, itemId)
end)
lootItemsScrollList:SetButtonScript("OnLeave", utilsUI.hideTooltip)
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
local rollItemFieldButton = CreateFrame("Button", nil, rollTabFrame)
rollItemFieldButton:SetPoint("TOPLEFT", rollItemField, "TOPLEFT", 0, 0)
rollItemFieldButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
rollItemFieldButton:SetScript("OnEnter", function()
    if (rollOrder) then
        utilsUI.showItemTooltip(rollItemFieldButton, rollOrder.item.itemId)
    end
end)
rollItemFieldButton:SetScript("OnLeave", utilsUI.hideTooltip)

rollOrderScrollList = ScrollList.new("PersonalRollLootLootOrderScrollFrame", rollTabFrame, 10)
rollOrderScrollList:SetPoint("TOPLEFT", rollItemField, "BOTTOMLEFT", 0, -SPACING)
rollOrderScrollList:SetPoint("BOTTOM", rollItemsScrollList:GetFrame(), "BOTTOM", 0, 0)
rollOrderScrollList:SetWidth(COLUMN_WIDTH)
rollOrderScrollList:SetButtonHeight(TEXT_FIELD_HEIGHT)
rollOrderScrollList:SetContentProvider(function()
    if (rollOrder) then
        return rollOrder.rounds or {}
    else
        return {}
    end
end)
rollOrderScrollList:SetLabelProvider(function(index, round)
    return round[1].." - "..round[2]
end)
rollOrderScrollList:SetButtonScript("OnEnter", function(index, button, roundIndex, roundAndPlayerName)
    utilsUI.showPlayerTooltip(button, roundAndPlayerName[2])
end)
rollOrderScrollList:SetButtonScript("OnLeave", utilsUI.hideTooltip)
utilsUI.createBorder(rollOrderScrollList:GetFrame())


local MasterUI = {}
MasterUI.__index = MasterUI

MasterUI.setLootItems = function(items)
    lootItems = items
    lootItemsScrollList:Update()

    -- open the master UI during loot
    if ((not UnitAffectingCombat("player"))
        and (not (next(items) == nil))
        and utils.isGroupLeader(UnitName("player"))) then
        utilsUI.showTab(MasterUIFrame, 3)
        ShowUIPanel(MasterUIFrame)
    end
end

MasterUI.toggleUI = function() utilsUI.toggleUI(MasterUIFrame) end

ns.MasterUI = MasterUI
