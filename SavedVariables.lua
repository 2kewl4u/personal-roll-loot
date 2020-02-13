-- namespace
local _, ns = ...;
-- imports
local Instance = ns.Instance
local Player = ns.Player
local RAIDS = ns.RAIDS
local utils = ns.utils

local ITEM_LIST = ns.ITEM_LIST

-- saved variables
ns.DB = {
    -- a map {playerName -> player} containing the player configuration
    PLAYER_LIST = {},
    -- a map {instanceName -> instance} containing the priority lists
    INSTANCE_LIST = {},
    -- the currently active instance name
    activeInstance = nil
}

---
-- This method is used to upgrade the player items in case that the ITEM_LIST got updated for new
-- raid tiers and now the stored player need-lists do not contain the new items.
-- 
-- To upgrade, we check if a player has no items in a raid and activate all of them. This strategy
-- should do more good than bad.
-- 
local function upgradePlayerItems()
    for name, player in pairs(ns.DB.PLAYER_LIST or {}) do
        local raids = utils.copy(RAIDS)
        -- check if the player has at least one item in the need-list for the raid instance
        for itemId in pairs(player.needlist) do
            local item = ITEM_LIST[itemId]
            if (item) then
                for raid in pairs(item.raids) do
                    raids[raid] = nil
                end
                -- check if we have an item for each raid
                if (utils.tblempty(raids)) then break end
            end
        end
        
        -- if the need-list for the raid is empty, we fill all class items
        if (not utils.tblempty(raids)) then
            for itemId, item in pairs(ITEM_LIST) do
                for raid in pairs(raids) do
                    if (item:dropsIn(raid) and item:isForClass(player.class)) then
                        player.needlist[itemId] = true
                        break
                    end
                end
            end
        end
    end
end

---
-- Initializes the saved variables. The variables saved by those directives are
-- not immediately available when the addon loads. Instead, they're loaded at a
-- later point. The client fires an "VARIABLES_LOADED" event to let addons know
-- that their saved variables were loaded.
--  
ns.loadSavedVariables = function()
    if (PersonalRollLootDB) then
        -- assign the DB so that the variables are modified directly
        ns.DB = PersonalRollLootDB
        for name, player in pairs(ns.DB.PLAYER_LIST or {}) do
            ns.DB.PLAYER_LIST[name] = Player.copy(player)
        end

        for name, instance in pairs(ns.DB.INSTANCE_LIST or {}) do
            ns.DB.INSTANCE_LIST[name] = Instance.copy(instance)
        end
        upgradePlayerItems()
    else
        -- initialize the DB if it was not present
        PersonalRollLootDB = ns.DB
    end
end
