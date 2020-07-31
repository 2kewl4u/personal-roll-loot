-- namespace
local _, ns = ...;

-- imports
local Items = ns.Items
local ITEM_LIST = ns.ITEM_LIST
local utils = ns.utils

---
-- The InstancePlayerLabelProvider is a function that can be added to the
-- ScrollList to provide a visual representation for a set of player names
-- applied to buttons using the PersonalLootPlayerButtonTemplate.
-- 
local InstancePlayerLabelProvider ={}
ns.InstancePlayerLabelProvider = InstancePlayerLabelProvider

---
-- This function can be set to a ScrollList.
-- 
-- Note that this function does not return the text. The button to display the
-- player is modified by this function directly.
-- 
-- @param #string name
--          the name of the player
-- @param #boolean arg2
--          unused
-- @param #Button button
--          the button to display the player
-- 
function InstancePlayerLabelProvider.display(name, arg2, button)
    local invited = false
    local roles = {}
    local prioItems = {}
    local trial = false
    if (ns.DB.activeInstance) then
        local instance = ns.DB.INSTANCE_LIST[ns.DB.activeInstance]
        if (instance) then
            -- check the invite status
            if (instance.players) then
                invited = instance.players[name] ~= nil
            end
            -- check the role check status
            if (instance.rolecheck) then
                local rolecheck = instance.rolecheck[name]
                if (rolecheck and type(rolecheck) == "table") then
                    roles = rolecheck.roles or {}
                    trial = rolecheck.trial or false
                    prioItems = rolecheck.prioItems or {}
                end
            end
        end
    end
    
    -- mark players that are already invited with the background green
    if (invited) then
        button.ApplicationBG:Show()
    else
        button.ApplicationBG:Hide()
    end
    
    local memberInfo = {}
    memberInfo.name = name
    memberInfo.roles = roles
    memberInfo.trial = trial
    
    ns.PlayerLabelProvider.display(name, memberInfo, button)
    
    -- append the prio items to the info field
    local prioText = utils.toCSV(prioItems, function(k, itemId)
        local item = ITEM_LIST[itemId]
        if (item) then
            return Items.getSymbol(item:getName())
        else
            return "-"
        end
    end)
    
    button.Info:SetText(prioText)
    button.Info:Show()
    
end
