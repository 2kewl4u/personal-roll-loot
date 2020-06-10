-- namespace
local _, ns = ...;

-- imports
local InstancesTab = ns.InstancesTab
local Items = ns.Items
local OptionsTab = ns.OptionsTab
local PlayersTab = ns.PlayersTab
local RollTab = ns.RollTab
local utils = ns.utils
local utilsUI = ns.utilsUI

local COLUMN_WIDTH = utilsUI.COLUMN_WIDTH
local TEXT_FIELD_HEIGHT = utilsUI.TEXT_FIELD_HEIGHT
local ITEM_BUTTON_HEIGHT = utilsUI.ITEM_BUTTON_HEIGHT
local WINDOW_WIDTH = utilsUI.WINDOW_WIDTH
local WINDOW_HEIGHT = utilsUI.WINDOW_HEIGHT
local MARGIN = utilsUI.MARGIN
local SPACING = utilsUI.SPACING


local MasterUIFrame = CreateFrame("Frame", "PersonalRollLootMaster", UIParent, "UIPanelDialogTemplate")
MasterUIFrame:SetAttribute("UIPanelLayout-defined", true)
MasterUIFrame:SetAttribute("UIPanelLayout-enabled", true)
MasterUIFrame:SetAttribute("UIPanelLayout-area", "left")
MasterUIFrame:SetAttribute("UIPanelLayout-pushable", 5)
MasterUIFrame:SetAttribute("UIPanelLayout-width", WINDOW_WIDTH)
MasterUIFrame:SetAttribute("UIPanelLayout-whileDead", true)
MasterUIFrame:SetSize(WINDOW_WIDTH, WINDOW_HEIGHT)
MasterUIFrame:SetToplevel(true)
MasterUIFrame:SetPoint("CENTER")
MasterUIFrame.Title:SetText("Personal Roll Loot - Master")
HideUIPanel(MasterUIFrame)

-- create tabs
local tabs = utilsUI.createTabs(MasterUIFrame, { "Players", "Instances", "Roll", "Options" })
local playerTab = PlayersTab.new(tabs[1].contentFrame)
local instancesTab = InstancesTab.new(tabs[2].contentFrame)
local rollTab = RollTab.new(tabs[3].contentFrame)
local optionsTab = OptionsTab.new(tabs[4].contentFrame)

local MasterUI = {}
MasterUI.__index = MasterUI

function MasterUI.setLootItems(items)
    rollTab:setLootItems(items)

    -- open the master UI during loot
    if ((not UnitAffectingCombat("player"))
        and (not utils.tblempty(items))
        and utils.isGroupLeader(UnitName("player"))) then
        utilsUI.showTab(MasterUIFrame, 3)
        ShowUIPanel(MasterUIFrame)
    end
end

-- scan the master inventory when the frame is opened
MasterUIFrame:SetScript("OnShow", Items.removeInventoryItems)

MasterUI.toggleUI = function() utilsUI.toggleUI(MasterUIFrame) end

ns.MasterUI = MasterUI
