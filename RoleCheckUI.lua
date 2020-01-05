-- namespace
local _, ns = ...;
-- imports
local ConfirmDialog = ns.ConfirmDialog
local Items = ns.Items
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

-- the player info
local player
local raid

local roleCheckFrame = CreateFrame("Frame", "RoleCheckUIFrame", UIParent, "UIPanelDialogTemplate")
roleCheckFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
roleCheckFrame:SetSize(WINDOW_WIDTH / 2, 395)
roleCheckFrame.Title:SetText("Role Check")
roleCheckFrame:Hide()

local itemScrollList

-- role buttons
local roleIndex = 0
local memberRoleButtons = {}
local _, class = UnitClass("player")
local roles = Roles.forClass(class)
for roleId, role in pairs(roles) do
    local roleButton = CreateFrame("CheckButton", nil, roleCheckFrame, "PersonalLootRoleButton")
    roleButton:SetPoint("TOPLEFT", roleCheckFrame, "TOPLEFT", 20, -(SPACING + TEXT_FIELD_HEIGHT * roleIndex) - 25)
    roleButton.text:SetText(role.name)
    roleButton.text:SetFontObject("GameFontNormal")
    roleButton.icon:SetTexture(role.texture)
    roleButton:SetEnabled(true)
    roleButton:SetScript("OnClick", function()
        if (player) then
            if (roleButton:GetChecked()) then
                player.roles[roleId] = true
            else
                player.roles[roleId] = nil
            end
            itemScrollList:Update()
        end
    end)
    roleButton.role = role
    memberRoleButtons[roleId] = roleButton
    roleIndex = roleIndex + 1
end

local function updateRoleButtons()
    if (player) then
        for roleId, button in pairs(memberRoleButtons) do
            button:SetChecked(player.roles[roleId] or false)
        end
    end
end

local trialField = roleCheckFrame:CreateFontString(nil, "OVERLAY")
trialField:SetPoint("TOPLEFT", roleCheckFrame, "TOPLEFT", 20, -(MARGIN + SPACING + TEXT_FIELD_HEIGHT * 4) - 25)
trialField:SetFontObject("GameFontNormalLEFT")
trialField:SetText("You are marked as trial.")
trialField:Hide()

-- item list
itemScrollList = ScrollList.new("PersonalLootRoleCheckItemListScrollFrame", roleCheckFrame, 5, "PersonalLootItemButtonTemplate")
itemScrollList:SetPoint("BOTTOMLEFT", roleCheckFrame, "BOTTOMLEFT", MARGIN, TEXT_FIELD_HEIGHT + MARGIN + SPACING)
itemScrollList:SetSize(COLUMN_WIDTH, 5 * ITEM_BUTTON_HEIGHT + SPACING)
itemScrollList:SetButtonHeight(ITEM_BUTTON_HEIGHT)
itemScrollList:SetContentProvider(function()
    if (player) then
        return ITEM_LIST
    else
        return {}
    end
end)
itemScrollList:SetLabelProvider(function(itemId, item, button)
    if (player) then
        button.Priority:SetText(item:getPriority(player))
        button.Icon:SetTexture(item:getTexture())
        button.Name:SetText(item:getName())
        button.Name:SetFontObject("GameFontNormal")
        
        if (item.restricted) then
            button.Restricted:Show()
        else
            button.Restricted:Hide()
        end
    end
end)
itemScrollList:SetFilter(function(itemId, item)
    if (player) then
        return item:dropsIn(raid) and player:needsItem(item)
    end
    return true
end)
itemScrollList:SetButtonScript("OnEnter", function(index, button, itemId, item)
    utilsUI.showItemTooltip(button, itemId)
end)
itemScrollList:SetButtonScript("OnLeave", utilsUI.hideTooltip)
itemScrollList:SetButtonScript("OnClick", function(index, button, itemId, item)
    if (Items.canRemove(item, player)) then
        ConfirmDialog.open("Do you really want to permanently remove "..item:getLink().." from your need list?", function(result)
            if (result) then
                ns.requestItemRemoval(item)
            end
        end)
    end
end)
utilsUI.createBorder(itemScrollList:GetFrame())
itemScrollList:Update()

local okButton = CreateFrame("Button", nil, roleCheckFrame, "GameMenuButtonTemplate")
okButton:SetPoint("BOTTOMLEFT", roleCheckFrame, "BOTTOMLEFT", MARGIN, MARGIN)
okButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
okButton:SetText("Ok")
okButton:SetScript("OnClick", function()
    if (player) then
        ns.RoleSelectionEvent.send(player.roles)
    end
    roleCheckFrame:Hide()
end)

local RoleCheckUI = {}
ns.RoleCheckUI = RoleCheckUI

RoleCheckUI.open = function(event)
    if (event) then
        player = event.player
        raid = event.raid
        updateRoleButtons()
        itemScrollList:Update()
        roleCheckFrame:Show()
        
        if (player.trial == true) then
            trialField:Show()
        else
            trialField:Hide()
        end
    end
end
