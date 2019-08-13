-- namespace
local _, ns = ...;
-- imports
local CLASS_ROLES = ns.CLASS_ROLES
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

local MemberUI = {}
MemberUI.__index = MemberUI

-- data
local memberInfo
local lootItems = {}
local memberRollItem
local memberRollOrder = {}

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
memberTabFrame:SetScript("OnShow", updateMemberInfo)

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
memberItemScrollList:SetButtonScript("OnLeave", utilsUI.hideTooltip)
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
local memberRollItemFieldButton = CreateFrame("Button", memberRollItemField)
memberRollItemFieldButton:SetPoint("TOPLEFT", memberRollItemField, "TOPLEFT", 0, 0)
memberRollItemFieldButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
memberRollItemFieldButton:SetScript("OnEnter", function()
    if (memberRollItem) then
        GameTooltip:SetOwner(memberRollItemField, "ANCHOR_BOTTOMRIGHT")
        GameTooltip:SetItemByID(memberRollItem.itemId)
    end
end)
memberRollItemFieldButton:SetScript("OnLeave", utilsUI.hideTooltip)

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

MemberUI.setLootItems = function(items)
    lootItems = Items.getLootItems()
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

MemberUI.setRollOrderInfo = function(itemId, rollOrder)
        memberRollItem = ITEM_LIST[itemId]
    if (memberRollItem) then
        local itemName = GetItemInfo(itemId) or memberRollItem.name
        memberRollItemField:SetText("Item: "..itemName)
    end
    memberRollOrder = rollOrder or {}
    memberRollOrderScrollList:Update()
end

MemberUI.toggleUI = function() utilsUI.toggleUI(MemberUIFrame) end

ns.MemberUI = MemberUI
