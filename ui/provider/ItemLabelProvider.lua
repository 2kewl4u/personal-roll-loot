-- namespace
local _, ns = ...;

---
-- The ItemLabelProvider is a function that can be added to the ScrollList
-- to provide the visual representation for an Item.
-- 
local ItemLabelProvider = {}
ns.ItemLabelProvider = ItemLabelProvider

---
-- This function can be set to a ScrollList.
-- 
-- Note that this function does not return the text. The button to display the
-- item is modified by this function directly.
-- 
-- @param #number itemId
--          the itemId of the item
-- @param #Item item
--          the item to be displayed
-- @param #Button button
--          the button to display the item
-- @param #Player player
--          the player that may loot the item, may be nil
-- 
ItemLabelProvider.display = function(itemId, item, button, player)
    button.Name:SetText(item:getName())
    button.Icon:SetTexture(item:getTexture())
    
    local disabled = false
    if (player) then
        disabled = not player.needlist[itemId]
        
        button.Priority:SetText(item:getPriority(player))
        button.Priority:Show()
        button.PriorityBorder:Show()
    else
        button.Priority:Hide()
        button.PriorityBorder:Hide()
    end
    
    -- set name label font
    if (disabled) then
        button.Name:SetFontObject("GameFontDisable")
    else
        if (player and not (item.restricted and player.trial) and item:hasRole(player.roles)) then
            button.Name:SetFontObject("GameFontNormal")
        else
            button.Name:SetFontObject("GameFontHighlight")
        end
    end
    
    -- the restricted item indicator
    if (item.restricted) then
        button.Restricted:Show()
    else
        button.Restricted:Hide()
    end
end
