-- namespace
local _, ns = ...;
-- imports
local utilsUI = ns.utilsUI

local displayHeight = UIParent:GetHeight();
local LootButton = {
    frame
}

LootButton.frame = CreateFrame("Frame", "PersonalRollLootFrame", UIParent, "PersonalLootFrameTemplate")
LootButton.frame:SetPoint("CENTER", UIParent, "BOTTOM", 0, displayHeight / 3)

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
