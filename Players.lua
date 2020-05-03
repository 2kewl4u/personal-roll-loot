-- namespace
local _, ns = ...;
--imports
local Player = ns.Player
local utils = ns.utils

---
-- Contains utility methods for the players.
-- 
local Players = {}
ns.Players = Players

---
-- Returns the name, realm of the player specified by the given string or
-- nil if the player cannot be found.
-- 
-- @param #string arg
--          the player name
--          
-- @return #list
--          the name and the realm or nil
-- 
local function getPlayerNameAndRealm(arg)
    if (not arg) then
        print("> No player name specified.")
    else
        local name, realm = UnitName(arg)
        if (not name) then
            print("> No player found with the name '"..arg.."'.")
        else
            if (not realm) then
                realm = GetRealmName()
            end
            return name, realm
        end
    end
end

---
-- Adds the player with the given name or UnitId to the database.
-- 
-- @param #string arg
--          the name or UnitId of the player to be added
-- 
Players.add = function(arg)
    -- if no argument is given, try the target
    if (not arg) then
        if (UnitName("target")) then arg = "target" end
    end
    
    local trial = ns.DB.options.markNewPlayersAsTrial
    if (not arg) then
        -- no argument given, so add all players in the group
        local added = 0
        utils.forEachRaidMember(function(name)
            local name, realm = getPlayerNameAndRealm(name)
            if (name and (not ns.DB.PLAYER_LIST[name])) then
                local _,class,_ = UnitClass(name)
                ns.DB.PLAYER_LIST[name] = Player.new(name, realm, class, trial)
                added = added + 1
            end
        end)
        print("> Added "..added.." players.")
    else
        local name, realm = getPlayerNameAndRealm(arg)
        if (name) then
            -- check if we already have the player
            if (ns.DB.PLAYER_LIST[name]) then
                print("> Player '"..name.."' already registered.")
            else
                if (not UnitIsPlayer(arg)) then
                    print("> Unit '"..name.."' is not a player.")
                else
                    -- add the player to our database
                    local _,class,_ = UnitClass(arg)
                    ns.DB.PLAYER_LIST[name] = Player.new(name, realm, class, trial)
                    print("> Added player '"..name.."-"..realm.."', "..class..".")
                end
            end
        end
    end
end

---
-- Removes the player with the given name or UnitId from the database.
-- 
-- @param #string arg
--          the name or UnitId of the player to be removed
-- 
Players.remove = function(arg)
    if (not arg) then
        print("> No player name specified.")
    else
        -- try quick access to DB
        local player = ns.DB.PLAYER_LIST[arg]
        if (not player) then player = Players.get(arg) end
        if (player) then
            local name = player.name
            -- remove the player
            ns.DB.PLAYER_LIST[name] = nil
            print("> Removed player '"..name.."'.")
        end
    end
end

---
-- Returns the player with the given name or UnitId or nil if no such player
-- was found or registered.
-- 
-- @param #string arg
--          the player name or UnitId
-- 
-- @return #Player
--          the player
-- 
Players.get = function(arg)
    local name = getPlayerNameAndRealm(arg)
    if (name) then
        local player = ns.DB.PLAYER_LIST[name]
        if (not player) then
            print("> No player registered with the name '"..name.."'.")
        else
            return player
        end
    end
end

---
-- Checks how many players in the current party or raid group are registered for
-- personal loot.
-- 
-- @return #number
--          the number of
--              1. registered players
--              2. missing players and
--              3. total raid members
--          within the current party or raid group
--          
Players.checkGroupStatus = function()
    local playerCount = 0
    local raidMembers = 0
    local missing = 0
    utils.forEachRaidMember(function(playerName)
        local player = ns.DB.PLAYER_LIST[playerName]
        if (player) then
            playerCount = playerCount + 1
        else
            missing = missing + 1
        end
        raidMembers = raidMembers + 1
    end)
    return playerCount, missing, raidMembers
end
