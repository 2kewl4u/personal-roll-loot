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
local itemList = {}
local prio = 0

local function updateItemList()
    -- get a set of items that have to be in the item list
    local itemsToBeAdded = {}
    if (player) then
        for itemId, item in pairs(ITEM_LIST) do
            if (item:dropsIn(raid) and player:needsItem(item)) then
                itemsToBeAdded[itemId] = item
            end
        end
    end
    
    -- preserve the order by filtering items into a copy
    local copy = {}
    for index, item in ipairs(itemList) do
        local itemId = item.itemId
        if (itemsToBeAdded[itemId]) then
            table.insert(copy, item)
            itemsToBeAdded[itemId] = nil
        end
    end
    
    -- append the items that were missing to the end of the copy
    for itemId, item in pairs(itemsToBeAdded) do
        table.insert(copy, item)
    end
    
    -- override the current list
    itemList = copy
end

local function getPrioItems()
    local prioItems = {}
    for index = 1, prio do
        local item = itemList[index]
        if (item) then
            table.insert(prioItems, item.itemId)
        else
            break
        end
    end
    return prioItems
end

local function moveItem(fromIndex, toIndex)
    if (fromIndex ~= toIndex) then
        local size = #itemList
        if (fromIndex > 0 and toIndex > 0 and fromIndex <= size and toIndex <= size) then
            local item = table.remove(itemList, fromIndex)
            table.insert(itemList, toIndex, item)
        end
    end
end

local roleCheckFrame = CreateFrame("Frame", "RoleCheckUIFrame", UIParent, "UIPanelDialogTemplate")
roleCheckFrame:SetMovable(true)
roleCheckFrame:EnableMouse(true)
roleCheckFrame:RegisterForDrag("LeftButton")
roleCheckFrame:SetScript("OnDragStart", roleCheckFrame.StartMoving)
roleCheckFrame:SetScript("OnDragStop", roleCheckFrame.StopMovingOrSizing)
roleCheckFrame:SetToplevel(true)

roleCheckFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
roleCheckFrame:SetSize(WINDOW_WIDTH / 2, 430)
roleCheckFrame.Title:SetText("Role Check")
roleCheckFrame:Hide()

local selectedItem
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
            updateItemList()
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
itemScrollList:SetPoint("TOP", trialField, "BOTTOM", 0, -MARGIN)
itemScrollList:SetSize(COLUMN_WIDTH, 5 * ITEM_BUTTON_HEIGHT + SPACING)
itemScrollList:SetButtonHeight(ITEM_BUTTON_HEIGHT)
itemScrollList:SetContentProvider(function() return itemList end)
itemScrollList:SetLabelProvider(function(index, item, button)
    local itemId = item.itemId
    ns.ItemLabelProvider.display(itemId, item, button, player)
    if (selectedItem and selectedItem.itemId == itemId) then
        button.SelectBG:Show()
    else
        button.SelectBG:Hide()
    end
    
    if (index <= prio) then
        button.Name:SetFontObject("GameFontRed")
        button.Priority:Hide()
        button.PriorityBorder:Hide()
    end
end)
itemScrollList:SetButtonScript("OnEnter", function(index, button, itemListIndex, item)
    utilsUI.showItemTooltip(button, item.itemId)
end)
itemScrollList:SetButtonScript("OnLeave", utilsUI.hideTooltip)
itemScrollList:SetButtonScript("OnClick", function(index, button, itemListIndex, item)
    selectedItem = item
    itemScrollList:Update()
end)
utilsUI.createBorder(itemScrollList:GetFrame())
itemScrollList:Update()

local function getSelectedItemIndex()
    if (selectedItem) then
        for index, item in ipairs(itemList) do
            if (selectedItem.itemId == item.itemId) then
                return index
            end
        end
    end
end

local moveItemTopButton = CreateFrame("Button", nil, roleCheckFrame, "PersonalLootButtonTopTemplate")
moveItemTopButton:SetPoint("TOPLEFT", itemScrollList:GetFrame(), "BOTTOMLEFT", 0, -SPACING)
utilsUI.addTooltipText(moveItemTopButton, "move item to the top")
moveItemTopButton:SetScript("OnClick", function()
    local fromIndex = getSelectedItemIndex()
    if (fromIndex) then
        -- move the item one index up
        moveItem(fromIndex, 1)
        itemScrollList:Update()
    end
end)

local moveItemUpButton = CreateFrame("Button", nil, roleCheckFrame, "PersonalLootButtonUpTemplate")
moveItemUpButton:SetPoint("TOPLEFT", moveItemTopButton, "TOPRIGHT", 0, 0)
utilsUI.addTooltipText(moveItemUpButton, "move item up in priority")
moveItemUpButton:SetScript("OnClick", function()
    local fromIndex = getSelectedItemIndex()
    if (fromIndex) then
        -- move the item one index up
        moveItem(fromIndex, fromIndex - 1)
        itemScrollList:Update()
    end
end)

local moveItemDownButton = CreateFrame("Button", nil, roleCheckFrame, "PersonalLootButtonDownTemplate")
moveItemDownButton:SetPoint("TOPLEFT", moveItemUpButton, "TOPRIGHT", -SPACING, 0)
utilsUI.addTooltipText(moveItemDownButton, "move item down in priority")
moveItemDownButton:SetScript("OnClick", function()
    local fromIndex = getSelectedItemIndex()
    if (fromIndex) then
        -- move the item one index down
        moveItem(fromIndex, fromIndex + 1)
        itemScrollList:Update()
    end
end)

local removeItemButton = CreateFrame("Button", nil, roleCheckFrame, "PersonalLootButtonCancelTemplate")
removeItemButton:SetPoint("TOPLEFT", moveItemDownButton, "TOPRIGHT", -SPACING, 0)
utilsUI.addTooltipText(removeItemButton, "remove the item from the need-list")
removeItemButton:SetScript("OnClick", function()
    if (selectedItem and Items.canRemove(selectedItem, player)) then
        ConfirmDialog.open("Do you really want to permanently remove "..selectedItem:getLink().." from your need list?", function(result)
            if (result) then
                ns.ItemRemovalRequestEvent.send(selectedItem)
            end
        end)
    end
end)

local okButton = CreateFrame("Button", nil, roleCheckFrame, "GameMenuButtonTemplate")
okButton:SetPoint("BOTTOMLEFT", roleCheckFrame, "BOTTOMLEFT", MARGIN, MARGIN)
okButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
okButton:SetText("Ok")
okButton:SetScript("OnClick", function()
    if (player) then
        ns.RoleSelectionEvent.send(player.roles, getPrioItems())
    end
    roleCheckFrame:Hide()
end)

local RoleCheckUI = {}
ns.RoleCheckUI = RoleCheckUI

local setMemberInfo = function(memberInfo)
    player = memberInfo
    -- clear the selection
    selectedItem = nil
    updateItemList()
    updateRoleButtons()
    itemScrollList:Update()
    
    if (player.trial == true) then
        trialField:Show()
    else
        trialField:Hide()
    end
end

local function getSelectedRoles()
    local roles = {}
    for roleId, button in pairs(memberRoleButtons) do
        if (button:GetChecked()) then
            roles[roleId] = true
        end
    end
    return roles
end

RoleCheckUI.setMemberInfo = function(memberInfo)
    if (roleCheckFrame:IsShown()) then
        -- preserve the current role selection
        memberInfo.roles = getSelectedRoles()
        setMemberInfo(memberInfo)
    end
end

local function enablePriorityButtons()
    local enabled = prio and prio > 0
    moveItemUpButton:SetEnabled(enabled)
    moveItemDownButton:SetEnabled(enabled)
    moveItemTopButton:SetEnabled(enabled)
end

RoleCheckUI.open = function(event)
    if (event) then
        raid = event.raid
        prio = event.prio
        enablePriorityButtons()
        roleCheckFrame:Show()
        setMemberInfo(event.player)
    end
end
