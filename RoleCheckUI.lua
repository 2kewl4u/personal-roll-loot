-- namespace
local _, ns = ...;
-- imports
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

local memberInfo

local roleCheckFrame = CreateFrame("Frame", "RoleCheckUIFrame", UIParent, "UIPanelDialogTemplate")
roleCheckFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
roleCheckFrame:SetSize(WINDOW_WIDTH / 2, 380)
roleCheckFrame.Title:SetText("Role Check")

-- role buttons
local roleIndex = 0
local memberRoleButtons = {}
local _, class = UnitClass("player")
local roles = Roles.forClass(class)
-- hide the roles if there is only one spec
if (utils.tblsize(roles) > 1) then
    for roleId, role in pairs(roles) do
        local roleButton = CreateFrame("CheckButton", nil, roleCheckFrame, "PersonalLootRoleButton")
        roleButton:SetPoint("TOPLEFT", roleCheckFrame, "TOPLEFT", 20, -(SPACING + TEXT_FIELD_HEIGHT * roleIndex) - 25)
        roleButton.text:SetText(role.name)
        roleButton.text:SetFontObject("GameFontNormal")
        roleButton.icon:SetTexture(role.texture)
        roleButton:SetEnabled(true)
        roleButton.role = role
        memberRoleButtons[roleId] = roleButton
        roleIndex = roleIndex + 1
    end
end

-- item list
local itemScrollList = ScrollList.new("PersonalLootRoleCheckItemListScrollFrame", roleCheckFrame, 5, "PersonalLootItemButtonTemplate")
itemScrollList:SetPoint("BOTTOMLEFT", roleCheckFrame, "BOTTOMLEFT", MARGIN, TEXT_FIELD_HEIGHT + MARGIN + SPACING)
itemScrollList:SetSize(COLUMN_WIDTH, 5 * ITEM_BUTTON_HEIGHT + SPACING)
itemScrollList:SetButtonHeight(ITEM_BUTTON_HEIGHT)
itemScrollList:SetContentProvider(function()
    if (memberInfo) then
        return memberInfo
    else
        return {}
    end
end)
itemScrollList:SetLabelProvider(function(itemId, item, button)
    if (memberInfo) then
        button.Priority:SetText(item:getPriority(memberInfo))
        button.Icon:SetTexture(item:getTexture())
        button.Name:SetText(item:getName())
        button.Name:SetFontObject("GameFontNormal")
    end
end)
itemScrollList:SetFilter(function(itemId, item)
    if (memberInfo) then
        return item:isForClass(memberInfo.class)
    end
    return true
end)
utilsUI.createBorder(itemScrollList:GetFrame())
itemScrollList:Update()

local okButton = CreateFrame("Button", nil, roleCheckFrame, "GameMenuButtonTemplate")
okButton:SetPoint("BOTTOMLEFT", roleCheckFrame, "BOTTOMLEFT", MARGIN, MARGIN)
okButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
okButton:SetText("Ok")

local RoleCheckUI = {}

RoleCheckUI.open = function(player)
    memberInfo = player
    roleCheckFrame:Show()
end
ns.RoleCheckUI = RoleCheckUI