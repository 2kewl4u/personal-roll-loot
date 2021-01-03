-- namespace
local _, ns = ...;
-- imports
local Instance = ns.Instance
local Options = ns.Options
local Player = ns.Player
local RAIDS = ns.RAIDS
local utils = ns.utils

local ITEM_LIST = ns.ITEM_LIST

-- saved variables
ns.DB = {
    -- the version of the database
    version,
    -- a map {playerName -> player} containing the player configuration
    PLAYER_LIST = {},
    -- a map {instanceName -> instance} containing the priority lists
    INSTANCE_LIST = {},
    -- the currently active instance name
    activeInstance = nil,
    -- additional options for the master looter
    options = Options.new(),
    -- the check lists to remember players that recently received loot
    junkCheckList = {}
}
-- saved variables for the character
ns.CDB = {
    -- the current player information
    currentPlayer = nil    
}

---
-- Converts the given version string into a numerical representation that can
-- be compared.
-- 
-- Examples:
-- addon version - version number
-- 0.8.0           800
-- 0.9.1           910
-- 1.2.3           10230
-- 
-- Returns 0 if the given version string is nil.
-- 
-- @param #string versionString
--          the version string to be parsed
-- 
-- @return #number
--          the version number
-- 
local function parseVersionNumber(versionString)
    if (versionString) then
        local major, minor, patch = strsplit(".", versionString, 3)
        return  (tonumber(patch) or 0)
            + (tonumber(minor) or 0) * 100
            + (tonumber(major) or 0) * 10000
    end
    return 0
end

---
-- Returns the current version number of the addon.
-- 
-- @return #number
--          the version number
--  
local function getCurrentVersion()
    return parseVersionNumber(GetAddOnMetadata("PersonalRollLoot", "Version"))
end

---
-- Returns the version number of the current state of the database.
-- 
-- @return #number
--          the version number
--  
local function getDatabaseVersion()
    return parseVersionNumber(ns.DB.version)
end

---
-- Adds the given items to all players with a class that the item is designed
-- for.
-- 
-- @param #list items
--          a list of itemIds of items to be added to each player
-- 
local function addMissingItems(items)
    for name, player in pairs(ns.DB.PLAYER_LIST or {}) do
        for i, itemId in ipairs(items) do
            local item = ITEM_LIST[itemId]
            if (item and item:isForClass(player.class)) then
                player.needlist[itemId] = true
            end
        end
    end
end

---
-- This method is used to upgrade the player items in case that the ITEM_LIST
-- got updated for new raid tiers and now the stored player need-lists do not
-- contain the new items.
--
-- To upgrade, we check if a player has no items in a raid and activate all of
-- them. This strategy should do more good than bad.
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
-- Upgrades the current database to be compatible with the current version.
-- 
-- In most cases, this will just add some missing items in the need-list of some
-- classes or when a new raid tier is released.
-- 
local function upgradeDatabase()
    local dbVersion = getDatabaseVersion()
    -- pre-0.8.0 upgrades
    if (dbVersion < 800) then
        addMissingItems({
            19865, -- add Warblade of the Hakkari
            19861 -- Touch of Chaos
        })
    end
    if (dbVersion < 900) then
        addMissingItems({
            22637 -- Primal Hakkari Idol
        })
    end
    if (dbVersion < 901) then
        upgradePlayerItems()
        addMissingItems({
            22739 -- Tome of Polymorph: Turtle
        })
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
        -- initialize the options if missing
        if (not ns.DB.options) then
            ns.DB.options = Options.new()
        end
        if (not ns.DB.junkCheckList) then
            ns.DB.junkCheckList = {}
        end

        -- create the Player instances, since functions are not stored in the DB
        for name, player in pairs(ns.DB.PLAYER_LIST or {}) do
            ns.DB.PLAYER_LIST[name] = Player.copy(player)
        end
        -- create the Instance instances
        for name, instance in pairs(ns.DB.INSTANCE_LIST or {}) do
            ns.DB.INSTANCE_LIST[name] = Instance.copy(instance)
        end
        upgradeDatabase()

        -- store database version
        ns.DB.version = GetAddOnMetadata("PersonalRollLoot", "Version")
    else
        -- initialize the DB if it was not present
        PersonalRollLootDB = ns.DB
    end
    
    if (PersonalRollLootCharacterDB) then
        -- assign the DB so that the variables are modified directly
        ns.CDB = PersonalRollLootCharacterDB
        
        local currentPlayer = ns.CDB.currentPlayer
        if (currentPlayer) then
            ns.CDB.currentPlayer = Player.copy(currentPlayer)
        end
    else
        -- initialize the DB if it was not present
        PersonalRollLootCharacterDB = ns.CDB
    end
end
