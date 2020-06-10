-- namespace
local _, ns = ...;

-- imports
local ConfirmDialog = ns.ConfirmDialog
local Instances = ns.Instances
local ITEM_LIST = ns.ITEM_LIST
local Players = ns.Players
local RollSystem = ns.RollSystem
local ScrollList = ns.ScrollList
local utilsUI = ns.utilsUI

local COLUMN_WIDTH = utilsUI.COLUMN_WIDTH
local TEXT_FIELD_HEIGHT = utilsUI.TEXT_FIELD_HEIGHT
local ITEM_BUTTON_HEIGHT = utilsUI.ITEM_BUTTON_HEIGHT
local WINDOW_WIDTH = utilsUI.WINDOW_WIDTH
local WINDOW_HEIGHT = utilsUI.WINDOW_HEIGHT
local MARGIN = utilsUI.MARGIN
local SPACING = utilsUI.SPACING


local RollTab = {
    -- the list viewer showing the items from the instance history
    historyItemScrollList,
    -- the list viewer showing the items that are currently in the loot window
    lootItemsScrollList,
    -- a map (itemId -> item) of Item's that are currently in the loot window
    lootItems = {}
}
RollTab.__index = RollTab
ns.RollTab = RollTab


-- data
local rollOrder

-- UI components
local rollItemField
local rollOrderScrollList


local ignoreUnregistered = false
local ignoreUninvited = false
local function performItemRoll(index, button, itemId, item)
    local instance = ns.DB.INSTANCE_LIST[ns.DB.activeInstance]
    if (instance) then
        -- check the player status
        if (not ignoreUnregistered) then
            local playerCount, missing, raidMembers = Players.checkGroupStatus()
            if (playerCount < raidMembers) then
                ConfirmDialog.open("Only "..playerCount.." of "..raidMembers.." raid or party members are registered for Personal Roll Loot. Do you want to ignore missing players?", function(result)
                    if (result) then
                        ignoreUnregistered = true
                        return performItemRoll(index, button, itemId, item)
                    end
                end)
                -- leaves the previous dialog open
                return true
            end
        end

        if (not ignoreUninvited) then
            local invited, raidMembers = Instances.invited();
            if (invited and invited < raidMembers) then
                ConfirmDialog.open("Only "..invited.." of "..raidMembers.." raid or party members are invited into the current instance. Do you want to ignore missing players?", function(result)
                    if (result) then
                        ignoreUninvited = true
                        return performItemRoll(index, button, itemId, item)
                    end
                end)
                -- leaves the previous dialog open
                return true
            end
        end

        -- perform the roll before
        rollOrder = Instances.roll(itemId)
        if (rollOrder) then
            local itemName = rollOrder.item:getName()
            rollItemField:SetText("Item: "..itemName)
            rollOrderScrollList:Update()
            -- announce roll order
            ns.RollOrderEvent.broadcast(rollOrder)
            -- send the request to roll for the item
            local sentEvent = ns.RollRequestEvent.send()
            if (not sentEvent) then
                ns.ConfirmDialog.open("No candidates on the priority list are active. Assign '"..rollOrder.item:getLink().."' randomly?", function(result)
                    if (result) then
                        RollSystem.rollCurrentItem()
                    end
                end)
                -- leaves the previous dialog open
                return true
            end
        end
    else
        print("> No active instance.")
    end
end


function RollTab.new(parentFrame)
    local tab = setmetatable({}, RollTab)

    local historyItemScrollList = ScrollList.new("PersonalRollLootRollItemScrollFrame", parentFrame, 10, "PersonalLootItemButtonTemplate")
    historyItemScrollList:SetPoint("TOPLEFT", parentFrame, "TOPLEFT", MARGIN, -MARGIN)
    historyItemScrollList:SetSize(COLUMN_WIDTH, 10 * ITEM_BUTTON_HEIGHT + SPACING)
    historyItemScrollList:SetButtonHeight(ITEM_BUTTON_HEIGHT)
    historyItemScrollList:SetContentProvider(function()
        if (ns.DB.activeInstance) then
            return ITEM_LIST
        else
            return {}
        end
    end)
    historyItemScrollList:SetLabelProvider(ns.ItemLabelProvider.display)
    utilsUI.createBorder(historyItemScrollList:GetFrame())
    historyItemScrollList:SetButtonScript("OnEnter", function(index, button, itemId, item)
        utilsUI.showItemTooltip(button, itemId)
    end)
    historyItemScrollList:SetButtonScript("OnLeave", utilsUI.hideTooltip)
    historyItemScrollList:SetButtonScript("OnClick", performItemRoll)
    historyItemScrollList:SetFilter(function(itemId, item)
        if (ns.DB.activeInstance) then
            local instance = ns.DB.INSTANCE_LIST[ns.DB.activeInstance]
            if (instance) then
                return item:dropsIn(instance.raid) and instance.history[item.itemId]
            end
        end
    end)
    tab.historyItemScrollList = historyItemScrollList
    
    local lootItemsField = parentFrame:CreateFontString(nil, "OVERLAY")
    lootItemsField:SetPoint("TOPLEFT", parentFrame, "TOPLEFT", WINDOW_WIDTH / 2 + SPACING, -MARGIN)
    lootItemsField:SetFontObject("GameFontNormalLEFT")
    lootItemsField:SetText("Loot")
    lootItemsField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
    
    local lootItemsScrollList = ScrollList.new("PersonalRollLootLootItemScrollFrame", parentFrame, 3, "PersonalLootItemButtonTemplate")
    lootItemsScrollList:SetPoint("TOPLEFT", lootItemsField, "BOTTOMLEFT", 0, -SPACING)
    lootItemsScrollList:SetSize(COLUMN_WIDTH, 3 * ITEM_BUTTON_HEIGHT + SPACING)
    lootItemsScrollList:SetButtonHeight(ITEM_BUTTON_HEIGHT)
    utilsUI.createBorder(lootItemsScrollList:GetFrame())
    lootItemsScrollList:SetContentProvider(function() return tab.lootItems end)
    lootItemsScrollList:SetLabelProvider(ns.ItemLabelProvider.display)
    lootItemsScrollList:SetButtonScript("OnEnter", function(index, button, itemId, item)
        utilsUI.showItemTooltip(button, itemId)
    end)
    lootItemsScrollList:SetButtonScript("OnLeave", utilsUI.hideTooltip)
    lootItemsScrollList:SetButtonScript("OnClick", performItemRoll)
    tab.lootItemsScrollList = lootItemsScrollList
    
    local lootPrioField = parentFrame:CreateFontString(nil, "OVERLAY")
    lootPrioField:SetPoint("TOPLEFT", lootItemsScrollList:GetFrame(), "BOTTOMLEFT", 0, -SPACING)
    lootPrioField:SetFontObject("GameFontNormalLEFT")
    lootPrioField:SetText("Loot Priority Order")
    lootPrioField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
    
    rollItemField = parentFrame:CreateFontString(nil, "OVERLAY")
    rollItemField:SetPoint("TOPLEFT", lootPrioField, "BOTTOMLEFT", 0, 0)
    rollItemField:SetFontObject("GameFontHighlightLEFT")
    rollItemField:SetText("Item: -")
    rollItemField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
    local rollItemFieldButton = CreateFrame("Button", nil, parentFrame)
    rollItemFieldButton:SetPoint("TOPLEFT", rollItemField, "TOPLEFT", 0, 0)
    rollItemFieldButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
    rollItemFieldButton:SetScript("OnEnter", function()
        if (rollOrder) then
            utilsUI.showItemTooltip(rollItemFieldButton, rollOrder.item.itemId)
        end
    end)
    rollItemFieldButton:SetScript("OnLeave", utilsUI.hideTooltip)
    
    rollOrderScrollList = ScrollList.new("PersonalRollLootLootOrderScrollFrame", parentFrame, 10)
    rollOrderScrollList:SetPoint("TOPLEFT", rollItemField, "BOTTOMLEFT", 0, -SPACING)
    rollOrderScrollList:SetPoint("BOTTOM", historyItemScrollList:GetFrame(), "BOTTOM", 0, 0)
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

    return tab
end

function RollTab:setLootItems(items)
    local tab = self
    tab.lootItems = items
    tab.historyItemScrollList:Update()
    tab.lootItemsScrollList:Update()
end
