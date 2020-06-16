-- namespace
local _, ns = ...;

-- imports
local ConfirmDialog = ns.ConfirmDialog
local Instances = ns.Instances
local Players = ns.Players
local RAIDS = ns.RAIDS
local ScrollList = ns.ScrollList
local utilsUI = ns.utilsUI

local COLUMN_WIDTH = utilsUI.COLUMN_WIDTH
local TEXT_FIELD_HEIGHT = utilsUI.TEXT_FIELD_HEIGHT
local ITEM_BUTTON_HEIGHT = utilsUI.ITEM_BUTTON_HEIGHT
local WINDOW_WIDTH = utilsUI.WINDOW_WIDTH
local WINDOW_HEIGHT = utilsUI.WINDOW_HEIGHT
local MARGIN = utilsUI.MARGIN
local SPACING = utilsUI.SPACING


-- UI components
local instanceNameField
local instanceRaidField
local instanceCreatedField
local instancePlayersScrollList
local rollItemField

local InstancesTab = {
    -- the list viewer showing the created instances
    instanceScrollList,
    -- the list viewer showing the players for the currently active instance
    playerScrollList
}
InstancesTab.__index = InstancesTab
ns.InstancesTab = InstancesTab

function InstancesTab.new(parentFrame)
    local tab = setmetatable({}, InstancesTab)
    
    local instanceScrollList = ScrollList.new("PersonalRollLootInstanceListScrollFrame", parentFrame, 15)
    instanceScrollList:SetPoint("TOPLEFT", parentFrame, "TOPLEFT", MARGIN, -MARGIN)
    instanceScrollList:SetPoint("BOTTOMLEFT", parentFrame, "BOTTOMLEFT", MARGIN, MARGIN + 4 * (TEXT_FIELD_HEIGHT + SPACING) + 10)
    instanceScrollList:SetWidth(COLUMN_WIDTH)
    instanceScrollList:SetButtonHeight(TEXT_FIELD_HEIGHT)
    instanceScrollList:SetLabelProvider(function(k, v) return k end)
    instanceScrollList:SetContentProvider(function() return ns.DB.INSTANCE_LIST end)
    instanceScrollList:SetButtonScript("OnClick", function(index, button, name, instance)
        if (Instances.activate(name)) then
            instanceNameField:SetText("Instance: "..name)
            instanceRaidField:SetText("Raid: "..instance.raid)
            instanceCreatedField:SetText(instance.created)
            instancePlayersScrollList:Update()
        end
    end)
    utilsUI.createBorder(instanceScrollList:GetFrame())
    tab.instanceScrollList = instanceScrollList
    
    local newInstanceLabel = parentFrame:CreateFontString(nil, "OVERLAY")
    newInstanceLabel:SetPoint("TOPLEFT", instanceScrollList:GetFrame(), "BOTTOMLEFT", SPACING, -SPACING)
    newInstanceLabel:SetFontObject("GameFontNormalLEFT")
    newInstanceLabel:SetText("New Instance")
    newInstanceLabel:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
    
    local newInstanceEditBox = CreateFrame("Editbox", nil, parentFrame, "InputBoxTemplate")
    newInstanceEditBox:SetPoint("TOPLEFT", newInstanceLabel, "BOTTOMLEFT", 0, 0)
    newInstanceEditBox:SetSize(COLUMN_WIDTH, 25)
    newInstanceEditBox:SetAutoFocus(false)
    newInstanceEditBox:ClearFocus()
    
    local newInstanceRaidDropDown = CreateFrame("Frame", nil, parentFrame, "UIDropDownMenuTemplate")
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
    
    local addInstanceButton = CreateFrame("Button", nil, parentFrame, "GameMenuButtonTemplate")
    addInstanceButton:SetPoint("BOTTOMLEFT", parentFrame, "BOTTOMLEFT", MARGIN, MARGIN)
    addInstanceButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
    addInstanceButton:SetText("Add Instance")
    addInstanceButton:SetScript("OnClick", function()
        local name = newInstanceEditBox:GetText()
        local raid = newInstanceRaidDropDown.value
        if (name and raid) then
            Instances.create(name, raid)
            instanceScrollList:Update()
            -- clear name
            newInstanceEditBox:SetText("")
            newInstanceEditBox:ClearFocus()
        end
    end)
    
    instanceNameField = parentFrame:CreateFontString(nil, "OVERLAY")
    instanceNameField:SetPoint("TOPLEFT", parentFrame, "TOPLEFT", WINDOW_WIDTH / 2 + SPACING, -MARGIN)
    instanceNameField:SetFontObject("GameFontHighlightLEFT")
    instanceNameField:SetText("Instance:")
    instanceNameField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
    
    instanceRaidField = parentFrame:CreateFontString(nil, "OVERLAY")
    instanceRaidField:SetPoint("TOPLEFT", instanceNameField, "BOTTOMLEFT", 0, 0)
    instanceRaidField:SetFontObject("GameFontHighlightLEFT")
    instanceRaidField:SetText("Raid:")
    instanceRaidField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
    
    instanceCreatedField = parentFrame:CreateFontString(nil, "OVERLAY")
    instanceCreatedField:SetPoint("TOPLEFT", instanceRaidField, "BOTTOMLEFT", 0, 0)
    instanceCreatedField:SetFontObject("GameFontHighlightLEFT")
    --instanceCreatedField:SetText("Created:")
    instanceCreatedField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
    
    parentFrame:SetScript("OnShow", function()
        if (ns.DB.activeInstance) then
            local instance = ns.DB.INSTANCE_LIST[ns.DB.activeInstance]
            if (instance) then
                instanceNameField:SetText("Instance: "..instance.name)
                instanceRaidField:SetText("Raid: "..instance.raid)
                instanceCreatedField:SetText(instance.created)
            end
        end
    end)
    
    local instancePlayersField = parentFrame:CreateFontString(nil, "OVERLAY")
    instancePlayersField:SetPoint("TOPLEFT", instanceCreatedField, "BOTTOMLEFT", 0, 0)
    instancePlayersField:SetFontObject("GameFontNormalLEFT")
    instancePlayersField:SetText("Players")
    instancePlayersField:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
    
    instancePlayersScrollList = ScrollList.new("PersonalRollLootInstancePlayerListScrollFrame", parentFrame, 7, "PersonalLootPlayerButtonTemplate")
    instancePlayersScrollList:SetPoint("TOPLEFT", instancePlayersField, "BOTTOMLEFT", 0, -SPACING)
    instancePlayersScrollList:SetPoint("BOTTOMLEFT", instancePlayersField, "BOTTOMLEFT", -6, -268)
    instancePlayersScrollList:SetWidth(COLUMN_WIDTH)
    instancePlayersScrollList:SetButtonHeight(36)
    instancePlayersScrollList:SetLabelProvider(ns.InstancePlayerLabelProvider.display)
    instancePlayersScrollList:SetContentProvider(ns.InstancePlayerContentProvider.getElements)
    instancePlayersScrollList:SetButtonScript("OnEnter", function(index, button, name, lootlist)
        utilsUI.showPlayerTooltip(button, name)
    end)
    instancePlayersScrollList:SetButtonScript("OnLeave", utilsUI.hideTooltip)
    utilsUI.createBorder(instancePlayersScrollList:GetFrame())
    tab.playerScrollList = instancePlayersScrollList
    
    local deleteInstanceButton = CreateFrame("Button", nil, parentFrame, "GameMenuButtonTemplate")
    deleteInstanceButton:SetPoint("BOTTOMLEFT", parentFrame, "BOTTOMLEFT", WINDOW_WIDTH / 2 + SPACING, MARGIN)
    deleteInstanceButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
    deleteInstanceButton:SetText("Delete Instance")
    deleteInstanceButton:SetScript("OnClick", function()
        if (Instances.delete(ns.DB.activeInstance)) then
            instanceNameField:SetText("Instance:")
            instanceRaidField:SetText("Raid:")
            --    instanceCreatedField:SetText("Created:")
            instanceScrollList:Update()
            instancePlayersScrollList:Update()
        end
    end)
    
    local inviteButton = CreateFrame("Button", nil, parentFrame, "GameMenuButtonTemplate")
    inviteButton:SetPoint("BOTTOMLEFT", deleteInstanceButton, "TOPLEFT", 0, SPACING)
    inviteButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
    inviteButton:SetText("Invite")
    inviteButton:SetScript("OnClick", function()
        local ready, members = Instances.ready()
        if (ready) then
            -- the function to invite the players
            local invite = function()
                Instances.invite(nil) -- invite all
                instancePlayersScrollList:Update()
            end
    
            if (ready < members) then
                ConfirmDialog.open("Only "..ready.." of "..members.." raid or party members responded to the role check. Continue?", function(result)
                    if (result) then
                        invite()
                    end
                end)
            else
                invite()
            end
        end
    end)
    
    local roleCheckButton = CreateFrame("Button", nil, parentFrame, "GameMenuButtonTemplate")
    roleCheckButton:SetPoint("BOTTOMLEFT", inviteButton, "TOPLEFT", 0, SPACING)
    roleCheckButton:SetSize(COLUMN_WIDTH, TEXT_FIELD_HEIGHT)
    roleCheckButton:SetText("Role Check")
    roleCheckButton:SetScript("OnClick", function()
        local playerCount, missing, raidMembers = Players.checkGroupStatus()
        if (playerCount < raidMembers) then
            ConfirmDialog.open("Only "..playerCount.." of "..raidMembers.." raid or party members are registered for Personal Roll Loot. Do you want to add the missing players?", function(result)
                if (result) then
                    -- add all missing players
                    Players.add(nil)
                end
                ns.RoleCheckEvent.broadcast()
            end)
        else
            ns.RoleCheckEvent.broadcast()
        end
    end)
    
    return tab
end

function InstancesTab:Update()
    local tab = self
    tab.instanceScrollList:Update()
    tab.playerScrollList:Update()
end
