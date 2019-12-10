-- namespace
local _, ns = ...;
-- imports
local CLASS_ROLES = ns.CLASS_ROLES
local ConfirmDialog = ns.ConfirmDialog
local Items = ns.Items
local Player = ns.Player
local ROLES = ns.ROLES
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
local memberInfo
local lootItems = {}
local memberRollOrder

-- menu functions
local updateMemberInfo
local createMemberInfo = function()
    if (not memberInfo) then
        local name, realm = UnitName("player")
        local _, class = UnitClass("player")
        memberInfo = Player.new(name,realm,class)
        memberInfo.roles = {}
        memberInfo.needlist = {}
    end
end

-- UI components
local  MemberUIFrame = CreateFrame("Frame", "PersonalRollLootMember", UIParent, "UIPanelDialogTemplate")
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

local memberTabFrame = CreateFrame("Frame", nil, MemberUIFrame)
memberTabFrame:SetPoint("TOPLEFT", PersonalRollLootMemberDialogBG, "TOPLEFT", 0, 0)
memberTabFrame:SetPoint("BOTTOMRIGHT", PersonalRollLootMemberDialogBG, "BOTTOMRIGHT", 0, 0)
memberTabFrame:SetScript("OnShow", function()
    updateMemberInfo()
    ns.sendMemberInfoRequest()
end)

local memberNameField = memberTabFrame:CreateFontString(nil, "OVERLAY")
memberNameField:SetPoint("TOPLEFT", memberTabFrame, "TOPLEFT", MARGIN, -MARGIN)
memberNameField:SetFontObject("GameFontHighlightLEFT")
memberNameField:SetText("Player Name")
memberNameField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)

-- role buttons
local roleIndex = 0
local memberRoleButtons = {}
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
local memberItemScrollList = ScrollList.new("PersonalRollLootMemberItemListScrollFrame", memberTabFrame, 6, "LargeItemButtonTemplate")
memberItemScrollList:SetPoint("BOTTOMLEFT", memberTabFrame, "BOTTOMLEFT", MARGIN, TEXT_FIELD_HEIGHT + MARGIN + SPACING)
memberItemScrollList:SetSize(COLUMN_WIDTH, 6 * ITEM_BUTTON_HEIGHT + SPACING)
memberItemScrollList:SetButtonHeight(ITEM_BUTTON_HEIGHT)
memberItemScrollList:SetContentProvider(function()
    if (memberInfo) then
        return ITEM_LIST
    else
        return {}
    end
end)
memberItemScrollList:SetLabelProvider(function(itemId, item, button)
    local disabled = true
    local player = memberInfo
    if (player) then
        if (player.needlist[itemId]) then disabled = false end
    end

    button.Icon:SetTexture(item:getTexture())
    button.Name:SetText(item:getName())
    if (disabled) then
        button.Name:SetFontObject("GameFontDisable")
    else
        if (item:hasRole(memberInfo.roles)) then
            button.Name:SetFontObject("GameFontNormal")
        else
            button.Name:SetFontObject("GameFontHighlight")
        end
    end
end)
memberItemScrollList:SetFilter(function(itemId, item)
    local player = memberInfo
    if (player) then
        return item:isForClass(player.class)
    end
    return true
end)
memberItemScrollList:SetButtonScript("OnEnter", function(index, button, itemId, item)
    utilsUI.showItemTooltip(button, itemId)
end)
memberItemScrollList:SetButtonScript("OnLeave", utilsUI.hideTooltip)
memberItemScrollList:SetButtonScript("OnClick", function(index, button, itemId, item)
    if (Items.canRemove(item, memberInfo)) then
        ConfirmDialog:open("Do you really want to permanently remove "..item:getLink().." from your need list?", function(result)
            if (result) then
                ns.requestItemRemoval(item)
            end
        end)
    end
end)
utilsUI.createBorder(memberItemScrollList:GetFrame())

local memberLootItemsField = memberTabFrame:CreateFontString(nil, "OVERLAY")
memberLootItemsField:SetPoint("TOPLEFT", memberTabFrame, "TOPLEFT", WINDOW_WIDTH / 2 + SPACING, -MARGIN)
memberLootItemsField:SetFontObject("GameFontNormalLEFT")
memberLootItemsField:SetText("Loot")
memberLootItemsField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)

local memberLootItemsScrollList = ScrollList.new("PersonalRollLootMemberLootItemScrollFrame", memberTabFrame, 3, "LargeItemButtonTemplate")
memberLootItemsScrollList:SetPoint("TOPLEFT", memberLootItemsField, "BOTTOMLEFT", 0, -SPACING)
memberLootItemsScrollList:SetSize(COLUMN_WIDTH, 3 * ITEM_BUTTON_HEIGHT + SPACING)
memberLootItemsScrollList:SetButtonHeight(ITEM_BUTTON_HEIGHT)
utilsUI.createBorder(memberLootItemsScrollList:GetFrame())
memberLootItemsScrollList:SetContentProvider(function() return lootItems end)
memberLootItemsScrollList:SetLabelProvider(function(itemId, item, button)
    button.Icon:SetTexture(item:getTexture())
    button.Name:SetText(item:getName())
    button.Name:SetFontObject("GameFontHighlight")
end)
memberLootItemsScrollList:SetButtonScript("OnEnter", function(index, button, itemId, item)
    utilsUI.showItemTooltip(button, itemId)
end)
memberLootItemsScrollList:SetButtonScript("OnLeave", utilsUI.hideTooltip)

local memberLootPrioField = memberTabFrame:CreateFontString(nil, "OVERLAY")
memberLootPrioField:SetPoint("TOPLEFT", memberLootItemsScrollList:GetFrame(), "BOTTOMLEFT", 0, -SPACING)
memberLootPrioField:SetFontObject("GameFontNormalLEFT")
memberLootPrioField:SetText("Loot Priority Order")
memberLootPrioField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)

local memberRollItemField = memberTabFrame:CreateFontString(nil, "OVERLAY")
memberRollItemField:SetPoint("TOPLEFT", memberLootPrioField, "BOTTOMLEFT", 0, 0)
memberRollItemField:SetFontObject("GameFontHighlightLEFT")
memberRollItemField:SetText("Item: -")
memberRollItemField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
local memberRollItemFieldButton = CreateFrame("Button", nil, memberTabFrame)
memberRollItemFieldButton:SetPoint("TOPLEFT", memberRollItemField, "TOPLEFT", 0, 0)
memberRollItemFieldButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
memberRollItemFieldButton:SetScript("OnEnter", function()
    if (memberRollOrder) then
        utilsUI.showItemTooltip(memberRollItemField, memberRollOrder.item.itemId)
    end
end)
memberRollItemFieldButton:SetScript("OnLeave", utilsUI.hideTooltip)

local memberRollOrderScrollList = ScrollList.new("PersonalRollLootMemberLootOrderScrollFrame", memberTabFrame, 9)
memberRollOrderScrollList:SetPoint("TOPLEFT", memberRollItemField, "BOTTOMLEFT", 0, -SPACING)
memberRollOrderScrollList:SetPoint("BOTTOMLEFT", memberTabFrame, "BOTTOMLEFT", WINDOW_WIDTH / 2 + SPACING, TEXT_FIELD_HEIGHT + MARGIN + SPACING)
memberRollOrderScrollList:SetWidth(COLUMN_WIDTH)
memberRollOrderScrollList:SetButtonHeight(TEXT_FIELD_HEIGHT)
memberRollOrderScrollList:SetContentProvider(function()
    if (memberRollOrder) then
        return memberRollOrder.rounds or {}
    else
        return {}
    end
end)
memberRollOrderScrollList:SetLabelProvider(function(index, roundAndPlayerName)
    local round = roundAndPlayerName[1]
    local playerName = roundAndPlayerName[2]
    return round.." - "..playerName
end)
memberRollOrderScrollList:SetButtonScript("OnEnter", function(index, button, roundIndex, roundAndPlayerName)
    utilsUI.showPlayerTooltip(button, roundAndPlayerName[2])
end)
memberRollOrderScrollList:SetButtonScript("OnLeave", utilsUI.hideTooltip)
utilsUI.createBorder(memberRollOrderScrollList:GetFrame())

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

local MemberUI = {}
MemberUI.__index = MemberUI

MemberUI.setLootItems = function(items)
    lootItems = items
    memberLootItemsScrollList:Update()
end

MemberUI.setMemberInfo = function(player)
    -- create the member info if not present
    createMemberInfo()
    memberInfo.roles = utils.copy(player.roles) or {}
    memberInfo.needlist = utils.copy(player.needlist) or {}
    -- update the member info
    updateMemberInfo()
end

MemberUI.setRollOrder = function(rollOrder)
    local itemName = rollOrder.item:getName()
    memberRollItemField:SetText("Item: "..itemName)
    memberRollOrder = rollOrder
    memberRollOrderScrollList:Update()
end

MemberUI.toggleUI = function() utilsUI.toggleUI(MemberUIFrame) end
MemberUI.isShown = function() return MemberUIFrame:IsShown() end

ns.MemberUI = MemberUI
