-- namespace
local _, ns = ...;
-- imports
local Instance = ns.Instance
local Player = ns.Player

-- saved variables
ns.DB = {
    PLAYER_LIST = {},
    INSTANCE_LIST = {},
    activeInstance = nil
}

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