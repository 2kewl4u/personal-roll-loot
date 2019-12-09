-- namespace
local _, ns = ...;
-- imports
local utilsUI = ns.utilsUI

-- TODO move to constant script
local ROLL_NEED = "need"
local ROLL_GREED = "greed"
local ROLL_PASS = "pass"
local ROLL_DISENCHANT = "dis"

local displayHeight = UIParent:GetHeight();
local LootButton = {
    frame
}

local function response(rollType)
    ns.respondRollOrder(LootButton.item, rollType)
    LootButton.frame:Hide()
end

LootButton.frame = CreateFrame("Frame", "PersonalRollLootFrame", UIParent, "PersonalLootFrameTemplate")
LootButton.frame:SetPoint("CENTER", UIParent, "BOTTOM", 0, displayHeight / 3)
LootButton.frame.NeedButton:SetScript("OnClick", function() response(ROLL_NEED) end)
LootButton.frame.PassButton:SetScript("OnClick", function() response(ROLL_PASS) end)
LootButton.frame.GreedButton:SetScript("OnClick", function() response(ROLL_GREED) end)
LootButton.frame.DisenchantButton:SetScript("OnClick", function() response(ROLL_DISENCHANT) end)

function LootButton.setItem(item)
    LootButton.item = item
    LootButton.frame.Name:SetText(item:getName())
    LootButton.frame.IconFrame.Icon:SetTexture(item:getTexture())

    local itemButton = LootButton.frame.IconFrame
    itemButton:SetScript("OnEnter", function()
        utilsUI.showItemTooltip(itemButton, item.itemId)
    end)
    itemButton:SetScript("OnLeave", utilsUI.hideTooltip)
    LootButton.frame:Show()
end

ns.LootButton = LootButton
