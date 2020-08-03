-- namespace
local _, ns = ...;

-- imports
local utilsUI = ns.utilsUI

local COLUMN_WIDTH = utilsUI.COLUMN_WIDTH
local TEXT_FIELD_HEIGHT = utilsUI.TEXT_FIELD_HEIGHT
local ITEM_BUTTON_HEIGHT = utilsUI.ITEM_BUTTON_HEIGHT
local WINDOW_WIDTH = utilsUI.WINDOW_WIDTH
local WINDOW_HEIGHT = utilsUI.WINDOW_HEIGHT
local MARGIN = utilsUI.MARGIN
local SPACING = utilsUI.SPACING

local OptionsTab = {
}
OptionsTab.__index = OptionsTab
ns.OptionsTab = OptionsTab

function OptionsTab.new(parentFrame)
    local tab = setmetatable({}, OptionsTab)
    
    local trialOptionButton = CreateFrame("CheckButton", nil, parentFrame, "UICheckButtonTemplate")
    trialOptionButton:SetPoint("TOPLEFT", parentFrame, "TOPLEFT", MARGIN, -MARGIN)
    trialOptionButton.text:SetFontObject("GameFontNormal")
    trialOptionButton.text:SetText("mark newly added players as 'Trial'")
    trialOptionButton:SetScript("OnShow", function()
        trialOptionButton:SetChecked(ns.DB.options.markNewPlayersAsTrial or false)
    end)
    trialOptionButton:SetScript("OnClick", function()
        ns.DB.options.markNewPlayersAsTrial =  trialOptionButton:GetChecked()
    end)
    
    local junkRollOptionButton = CreateFrame("CheckButton", nil, parentFrame, "UICheckButtonTemplate")
    junkRollOptionButton:SetPoint("TOPLEFT", trialOptionButton, "BOTTOMLEFT", 0, 0)
    junkRollOptionButton.text:SetFontObject("GameFontNormal")
    junkRollOptionButton.text:SetText("roll and assign junk items")
    junkRollOptionButton:SetScript("OnShow", function()
        junkRollOptionButton:SetChecked(ns.DB.options.rollJunkItems or false)
    end)
    junkRollOptionButton:SetScript("OnClick", function()
        ns.DB.options.rollJunkItems =  junkRollOptionButton:GetChecked()
    end)
    
    local chatInteractionOptionButton = CreateFrame("CheckButton", nil, parentFrame, "UICheckButtonTemplate")
    chatInteractionOptionButton:SetPoint("TOPLEFT", junkRollOptionButton, "BOTTOMLEFT", 0, 0)
    chatInteractionOptionButton.text:SetFontObject("GameFontNormal")
    chatInteractionOptionButton.text:SetText("enable chat interaction for users without the addon")
    chatInteractionOptionButton:SetScript("OnShow", function()
        chatInteractionOptionButton:SetChecked(ns.DB.options.chatInteraction or false)
    end)
    chatInteractionOptionButton:SetScript("OnClick", function()
        ns.DB.options.chatInteraction =  chatInteractionOptionButton:GetChecked()
    end)
    
    return tab
end
