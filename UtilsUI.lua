-- namespace
local _, ns = ...;
local utilsUI = {}

-- layout constants
utilsUI.COLUMN_WIDTH = 155
utilsUI.TEXT_FIELD_HEIGHT = 20
utilsUI.ITEM_BUTTON_HEIGHT = 41
utilsUI.WINDOW_WIDTH = 410
utilsUI.WINDOW_HEIGHT = 485
utilsUI.MARGIN = 12
utilsUI.SPACING = 6

---
-- Appends tabs to the given frame. That are little labels at the bottom of a
-- frame that can be clicked on to change the contents of the frame.
-- 
-- This functions expects a list of labels for the tab buttons and the return
-- value is a list of tab buttons. Each button contains a content frame where
-- new UI widgets can be appended to.
-- 
-- e.g.
-- local tabs = utilsUI.createTabs(mainFrame, { "Hello", "Stuff" })
-- local helloFrame = tabs[1].contentFrame
-- local stuffFrame = tabs[2].contentFrame
--
-- @param #Frame parentFrame
--          the frame to append the tabs to
-- @param #list tabLabels
--          a list of labels for the tabs
-- 
-- @return #list
--          a list containing the tab buttons
--   
utilsUI.createTabs = function(parentFrame, tabLabels)
    local tabs = {}
    local numTabs = #tabLabels
    parentFrame.numTabs = numTabs
    parentFrame.tabs = tabs
    for tabIndex = 1, numTabs do
        local tabButton = CreateFrame("Button", parentFrame:GetName().."Tab"..tabIndex, parentFrame, "CharacterFrameTabButtonTemplate")
        local tabFrame = CreateFrame("Frame", nil, parentFrame)
        tabButton.contentFrame = tabFrame
        tabButton:SetText(tabLabels[tabIndex])
        tabs[tabIndex] = tabButton

        tabButton:SetID(tabIndex)
        tabButton:SetScript("OnClick", function()
            utilsUI.showTab(parentFrame, tabIndex)
        end)
        if (tabIndex == 1) then
            tabButton:SetPoint("TOPLEFT", parentFrame, "BOTTOMLEFT", 5, 7)
        else
            tabButton:SetPoint("TOPLEFT", tabs[tabIndex - 1], "TOPRIGHT", -14, 0)
        end

        tabFrame:SetPoint("TOPLEFT", parentFrame:GetName().."DialogBG", "TOPLEFT", 0, 0)
        tabFrame:SetPoint("BOTTOMRIGHT", parentFrame:GetName().."DialogBG", "BOTTOMRIGHT", 0, 0)
        if (tabIndex ~= 1) then tabFrame:Hide() end
    end
    PanelTemplates_SetTab(parentFrame, 1)
    return tabs
end

---
-- Makes the tab of the given frame with the given index visible, hiding all
-- other tabs.
-- 
-- @param #Frame parentFrame
--          the frame that contains the tabs
-- @param #number tabIndex
--          the index of the tab that shall be visible
-- 
utilsUI.showTab = function(parentFrame, tabIndex)
    PanelTemplates_SetTab(parentFrame, tabIndex)
    for index, tab in pairs(parentFrame.tabs) do
        if (index == tabIndex) then
            tab.contentFrame:Show()
        else
            tab.contentFrame:Hide()
        end
    end
end

---
-- Toggles the given frame, thus shows or hides it depending on if it is
-- currently shown. Note that this just works outside of combat.
--
-- @param #Frame frame
--          the frame to show/hide
--
utilsUI.toggleUI = function(frame)
    if (frame:IsShown()) then
        HideUIPanel(frame)
    else
        ShowUIPanel(frame)
    end
end

---
-- Creates a border around the given frame.
--
-- @param #Frame frame
--          the frame to create the border for
--
utilsUI.createBorder = function(frame)
    CreateFrame("Frame", nil, frame, "InsetFrameTemplate"):SetAllPoints()
end

---
-- Hides the GameTooltip.
--
utilsUI.hideTooltip = function()
    GameTooltip:ClearLines()
    GameTooltip:Hide()
end

---
-- Shows a tooltip for the given player name.
--
-- @param #Frame owner
--          defines the element where the tooltip is centered on
-- @param #string playerName
--          the name of the player
--
utilsUI.showPlayerTooltip = function(owner, playerName)
    local unitName = playerName
    local name, realm = UnitName(playerName)
    if (name and realm) then
        unitName = name.."-"..realm
    end
    GameTooltip:SetOwner(owner, "ANCHOR_BOTTOMRIGHT")
    GameTooltip:SetUnit(unitName)
end

---
-- Displays the tooltip of the item with the given itemId at the given widget.
-- 
-- @param #widget owner
--          the button or widget to append the tooltip to
-- @param #number itemId
--          the itemId of the item to be shown in the tooltip
--  
utilsUI.showItemTooltip = function(owner, itemId)
    GameTooltip:SetOwner(owner, "ANCHOR_BOTTOMRIGHT")
    GameTooltip:SetItemByID(itemId)
end

---
-- Displays the given text as tooltip at the given widget.
-- 
-- @param #widget owner
--          the button or widget to append the tooltip to
-- @param #(string or function) text
--          the text to be displayed in the tooltip
-- @param #string anchor
--          the anchor point at the widget (optional)
--  
utilsUI.addTooltipText = function(owner, text, anchor)
    anchor = anchor or "ANCHOR_BOTTOMRIGHT"
    owner:SetScript("OnEnter", function()
        local tooltiptext
        if (type(text) == "string") then
            tooltiptext = text
        else
            tooltiptext = text() or ""
        end
        GameTooltip:SetOwner(owner, anchor)
        GameTooltip:SetText(tooltiptext, 0.8, 0.6, 0)
    end)
    owner:SetScript("OnLeave", utilsUI.hideTooltip)
end

ns.utilsUI = utilsUI
