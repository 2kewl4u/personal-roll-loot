-- namespace
local _, ns = ...;

---
-- The PlayerLabelProvider is a function that can be added to the ScrollList
-- to provide the visual representation for a Player.
-- 
local PlayerLabelProvider = {}
ns.PlayerLabelProvider = PlayerLabelProvider

---
-- This function can be set to a ScrollList.
-- 
-- Note that this function does not return the text. The button to display the
-- player is modified by this function directly.
-- 
-- @param #string name
--          the name of the player
-- @param #Player player
--          the player to be displayed
-- @param #Button button
--          the button to display the player
-- 
PlayerLabelProvider.display = function(name, player, button)
    button.Name:SetText(name)
    -- set the role icons
    local roleIndex = 1
    for playerRole in pairs(player.roles) do
        if (roleIndex > 4) then break end -- limit the roles

        local role = ns.ROLES_LIST[playerRole]
        if (role) then
            local texture = button.RoleIcons[roleIndex]
            texture:SetTexture(role.texture)
            texture:Show()
            roleIndex = roleIndex + 1
        end
    end
    -- hide the rest of the textures
    for index = roleIndex, 4 do
        local texture = button.RoleIcons[index]
        texture:Hide()
    end
    -- set the text field for the trial status
    if (player.trial) then
        button.Trial:Show()
    else
        button.Trial:Hide()
    end
end
