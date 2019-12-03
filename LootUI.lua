-- namespace
local _, ns = ...;

local displayHeight = UIParent:GetHeight();
local LootButton = CreateFrame("Frame", "PersonalRollLootFrame", UIParent, "PersonalLootFrameTemplate")
LootButton:SetPoint("CENTER", UIParent, "BOTTOM", 0, displayHeight / 3)
