-- namespace
local _, ns = ...;
-- imports
local Instance = ns.Instance
local Player = ns.Player

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
    else
        -- initialize the DB if it was not present
        PersonalRollLootDB = ns.DB
    end
end
