-- namespace
local _, ns = ...;
-- imports
local utilsUI = ns.utilsUI

-- TODO move to constant script
local ROLL_NEED = "need"
local ROLL_GREED = "greed"
local ROLL_PASS = "pass"
local ROLL_REMOVE = "remove"

local displayHeight = UIParent:GetHeight();
local LootButton = {
    frame
}

local function response(rollType)
    ns.RollResponseEvent.send(LootButton.item, rollType)
    LootButton.frame:Hide()
end

LootButton.frame = CreateFrame("Frame", "PersonalRollLootFrame", UIParent, "PersonalLootFrameTemplate")
LootButton.frame:SetPoint("CENTER", UIParent, "BOTTOM", 0, displayHeight / 3)
LootButton.frame:SetToplevel(true)
LootButton.frame.NeedButton:SetScript("OnClick", function() response(ROLL_NEED) end)
LootButton.frame.PassButton:SetScript("OnClick", function() response(ROLL_PASS) end)
LootButton.frame.GreedButton:SetScript("OnClick", function() response(ROLL_GREED) end)
LootButton.frame.DisenchantButton:SetScript("OnClick", function() response(ROLL_REMOVE) end)
-- add button tooltips
utilsUI.addTooltipText(LootButton.frame.NeedButton, "need - i would be happy about that")
utilsUI.addTooltipText(LootButton.frame.PassButton, "pass - i renounce this time")
utilsUI.addTooltipText(LootButton.frame.GreedButton, "greed - i'd take it if nobody wants it")
utilsUI.addTooltipText(LootButton.frame.DisenchantButton, "remove - i do not want the item")

LootButton.setItem = function(item)
    LootButton.item = item
    LootButton.frame.Name:SetText(item:getName())
    LootButton.frame.IconFrame.Icon:SetTexture(item:getTexture())
    local color = item:getColor()
    LootButton.frame.Name:SetTextColor(color.r, color.g, color.b)

    local itemButton = LootButton.frame.IconFrame
    itemButton:SetScript("OnEnter", function()
        utilsUI.showItemTooltip(itemButton, item.itemId)
    end)
    itemButton:SetScript("OnLeave", utilsUI.hideTooltip)
    LootButton.frame:Show()
end

ns.LootButton = LootButton
