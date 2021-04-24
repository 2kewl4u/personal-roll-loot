-- namespace
local _, ns = ...;

-- imports
local ITEM_LIST = ns.ITEM_LIST
local Players = ns.Players
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


local PlayersTab = {
    -- the list viewer showing the players registered for personal roll loot
    playerScrollList,
    -- the button to add new players to the list
    addPlayerButton,
    -- the label to display the currently selected player name
    playerNameField,
    -- the role buttons to change the players desired roles
    roleButtons = {},
    -- the check box to change the players trial status
    trialButton,
    -- the list viewer showing the item configuration of the currently selected player
    playerItemScrollList,
    -- the currently selected player
    player
}
PlayersTab.__index = PlayersTab
ns.PlayersTab = PlayersTab


function PlayersTab.new(parentFrame)
    local tab = setmetatable({}, PlayersTab)
    -- --------------------------------------------------------- --
    -- the player list to add and remove players to the tracking --
    -- --------------------------------------------------------- --
    tab.playerScrollList = tab:createPlayerScrollList(parentFrame)
    
    local addPlayerButton = CreateFrame("Button", nil, parentFrame, "GameMenuButtonTemplate")
    addPlayerButton:SetPoint("BOTTOMLEFT", parentFrame, "BOTTOMLEFT", MARGIN, MARGIN)
    addPlayerButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
    addPlayerButton:SetText("Add Player(s)")
    addPlayerButton:SetScript("OnClick", function()
        Players.add(nil)
        tab.playerScrollList:Update()
    end)
    
    local syncButton = CreateFrame("Button", nil, parentFrame, "GameMenuButtonTemplate")
    syncButton:SetPoint("BOTTOMLEFT", addPlayerButton, "TOPLEFT", 0, SPACING)
    syncButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
    syncButton:SetText("Synchronize")
    syncButton:SetScript("OnClick", ns.SyncInfoEvent.broadcast)
    
    local playerNameField = parentFrame:CreateFontString(nil, "OVERLAY")
    playerNameField:SetPoint("TOPLEFT", parentFrame, "TOPLEFT", WINDOW_WIDTH / 2 + SPACING, -MARGIN)
    playerNameField:SetFontObject("GameFontHighlightLEFT")
    playerNameField:SetText("Player Name")
    playerNameField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
    tab.playerNameField = playerNameField
    
    -- role buttons
    for roleIndex = 1, 4, 1 do
        local roleButton = CreateFrame("CheckButton", nil, parentFrame, "PersonalLootRoleButton")
        roleButton:SetPoint("TOPLEFT", playerNameField, "BOTTOMLEFT", 0, (-TEXT_FIELD_HEIGHT * (roleIndex - 1)))
        roleButton.text:SetFontObject("GameFontNormal")
        roleButton:SetScript("OnClick", function()
            local player = tab.player
            local role = roleButton.role
            if (player and role) then
                local checked = roleButton:GetChecked()
                local roleId = role.roleId
                if (checked) then
                    player.roles[roleId] = true
                else
                    player.roles[roleId] = nil
                end
                tab.playerItemScrollList:Update()
                tab.playerScrollList:Update()
            end
        end)
        tab.roleButtons[roleIndex] = roleButton
    end
    
    tab:updateRoleButtons()
    
    local trialButton = CreateFrame("CheckButton", nil, parentFrame, "UICheckButtonTemplate")
    trialButton:SetPoint("TOPLEFT", playerNameField, "BOTTOMLEFT", 0, (-TEXT_FIELD_HEIGHT * 4))
    trialButton.text:SetFontObject("GameFontNormal")
    trialButton.text:SetText("Trial")
    trialButton:SetScript("OnClick", function()
        local player = tab.player
        if (player) then
            player.trial = trialButton:GetChecked()
        end
        tab.playerItemScrollList:Update()
        tab.playerScrollList:Update()
    end)
    trialButton:Hide()
    tab.trialButton = trialButton
    
    
    -- item list
    local playerItemScrollList = ScrollList.new("PersonalRollLootPlayerItemListScrollFrame", parentFrame, 6, "PersonalLootItemButtonTemplate", true)
    playerItemScrollList:SetPoint("BOTTOMLEFT", parentFrame, "BOTTOMLEFT", WINDOW_WIDTH / 2 + SPACING, TEXT_FIELD_HEIGHT + MARGIN + SPACING)
    playerItemScrollList:SetSize(COLUMN_WIDTH, 6 * ITEM_BUTTON_HEIGHT + SPACING)
    playerItemScrollList:SetButtonHeight(ITEM_BUTTON_HEIGHT)
    playerItemScrollList:SetContentProvider(function()
        local player = tab.player
        if (player) then
            return ITEM_LIST
        else
            return {}
        end
    end)
    playerItemScrollList:SetLabelProvider(function(itemId, item, button)
        ns.ItemLabelProvider.display(itemId, item, button, tab.player)
    end)
    playerItemScrollList:SetButtonScript("OnClick", function(index, button, itemId, item)
        local player = tab.player
        if (player) then
            local state = player.needlist[itemId]
            -- toggle the item state
            if (state) then state = nil else state = true end
            player.needlist[itemId] = state
            playerItemScrollList:Update()
        end
    end)
    playerItemScrollList:SetFilter(function(itemId, item, searchText)
        local player = tab.player
        if (player) then
            return item:isForClass(player.class) and utils.strContainsIgnoreCase(item:getName(), searchText)
        end
        return true
    end)
    playerItemScrollList:SetButtonScript("OnEnter", function(index, button, itemId, item)
        utilsUI.showItemTooltip(button, itemId)
    end)
    playerItemScrollList:SetButtonScript("OnLeave", utilsUI.hideTooltip)
    -- border frame for the list
    utilsUI.createBorder(playerItemScrollList:GetFrame())
    tab.playerItemScrollList = playerItemScrollList
    
    local removePlayerButton = CreateFrame("Button", nil, parentFrame, "GameMenuButtonTemplate")
    removePlayerButton:SetPoint("BOTTOMLEFT", parentFrame, "BOTTOMLEFT", WINDOW_WIDTH / 2 + SPACING, MARGIN)
    removePlayerButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
    removePlayerButton:SetText("Remove Player")
    removePlayerButton:SetScript("OnClick", function()
        local player = tab.player
        if (player) then
            ns.DB.PLAYER_LIST[player.name] = nil
            -- update UI elements
            playerNameField:SetText("Player Name")
            tab.player = nil
            tab.playerScrollList:Update()
            playerItemScrollList:Update()
            tab:updateRoleButtons()
        end
    end)
    
    return tab
end

---
-- Creates the player list viewer to display the currently registered players.
-- 
-- @param #Frame parentFrame
--          the parent frame to attach the list to
-- 
-- @return #ScrollList
--          the created player list viewer
-- 
function PlayersTab:createPlayerScrollList(parentFrame)
    local tab = self
    local playerScrollList = ScrollList.new("PersonalRollLootPlayerListScrollFrame", parentFrame, 10, "PersonalLootPlayerButtonTemplate")
    playerScrollList:SetPoint("TOPLEFT", parentFrame, "TOPLEFT", MARGIN, -MARGIN)
    playerScrollList:SetPoint("BOTTOMLEFT", parentFrame, "BOTTOMLEFT", MARGIN, 2 * (TEXT_FIELD_HEIGHT + SPACING) + MARGIN)
    playerScrollList:SetWidth(COLUMN_WIDTH)
    playerScrollList:SetButtonHeight(36)
    playerScrollList:SetLabelProvider(ns.PlayerLabelProvider.display)
    playerScrollList:SetContentProvider(function() return ns.DB.PLAYER_LIST end)
    playerScrollList:SetButtonScript("OnClick", function(index, button, name, player)
        tab.player = player
        tab.playerNameField:SetText(name..", "..player.class)
        tab.playerItemScrollList:Update()
        tab:updateRoleButtons()
        tab.trialButton:SetChecked(player.trial == true)
        tab.trialButton:Show()
    end)
    playerScrollList:SetButtonScript("OnEnter", function(index, button, name, player)
        utilsUI.showPlayerTooltip(button, name)
    end)
    playerScrollList:SetButtonScript("OnLeave", utilsUI.hideTooltip)
    utilsUI.createBorder(playerScrollList:GetFrame())
    return playerScrollList
end

function PlayersTab:updateRoleButtons()
    local tab = self
    local player = tab.player
    if (player) then
        local roles = Roles.forClass(player.class)
        local index = 1
        -- hide the roles if there is only one spec
        if (utils.tblsize(roles) > 1) then
            for roleId, role in pairs(roles) do
                local button = tab.roleButtons[index]
                tab.updateRoleButton(button, role, player.roles[roleId])
                index = index + 1
            end
        end
        -- clear unused role buttons
        for i = index, 4, 1 do
            local button = tab.roleButtons[i]
            tab.updateRoleButton(button)
        end
    else
        for index, button in ipairs(tab.roleButtons) do
            tab.updateRoleButton(button)
        end
    end
end

function PlayersTab.updateRoleButton(button, role, checked)
    checked = checked or false
    if (role) then
        button.text:SetText(role.name)
        button.icon:SetTexture(role.texture)
        button:Show()
        button.role = role
    else
        button:Hide()
    end
    button:SetChecked(checked)
end
