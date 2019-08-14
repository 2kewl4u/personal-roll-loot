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

utilsUI.toggleUI = function(frame)
    if (not UnitAffectingCombat("player")) then
        if (frame:IsShown()) then
            HideUIPanel(frame)
        else
            ShowUIPanel(frame)
        end
    end
end

utilsUI.createBorder = function(frame)
    CreateFrame("Frame", nil, frame, "InsetFrameTemplate"):SetAllPoints()
end

utilsUI.hideTooltip = function()
	GameTooltip:ClearLines()
    GameTooltip:Hide()
end

utilsUI.showPlayerTooltip = function(owner, playerName)
	local unitName = playerName
	local name, realm = UnitName(playerName)
	if (name and realm) then
		unitName = name.."-"..realm
	end
	GameTooltip:SetOwner(owner, "ANCHOR_BOTTOMRIGHT")
	GameTooltip:SetUnit(unitName)
end


ns.utilsUI = utilsUI
