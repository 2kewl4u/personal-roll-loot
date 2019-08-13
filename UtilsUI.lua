-- namespace
local _, ns = ...;
local utilsUI = {}

utilsUI.toggleUI = function(frame)
    if (not UnitAffectingCombat("player")) then
        if (frame:IsShown()) then
            HideUIPanel(frame)
        else
            ShowUIPanel(frame)
        end
    end
end

ns.utilsUI = utilsUI
