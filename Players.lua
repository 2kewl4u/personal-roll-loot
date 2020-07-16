-- namespace
local _, ns = ...;
--imports
local Player = ns.Player
local Roles = ns.Roles
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
-- Applies the roles from the given RoleSelectionEvent to the player with the
-- given name.
-- 
-- @param #string playerName
--          the name of the player to apply the roles
-- @param #RoleSelectionEvent event
--          the event containing the selected roles
-- 
Players.selectRole = function(playerName, event)
    local player = ns.DB.PLAYER_LIST[playerName]
    if (player and event) then
        -- assign the new roles if changed
        local roles = {}
        if (not utils.tblequals(player.roles, event.roles)) then
            for roleId in pairs(event.roles) do
                -- check that the roles are correct
                if (Roles.checkRoleId(roleId)) then
                    roles[roleId] = true
                end
            end
            if (not utils.tblempty(roles)) then
                -- override the players roles
                player.roles = roles
                print("> Player '"..player.name.."' changed roles to '"..utils.toCSV(roles, tostring).."'.")
            else
                -- no roles selected, keep current player roles
                roles = player.roles
            end
        else
            -- roles did not change
            roles = player.roles
        end
        
        -- mark the player in the active instance as ready
        if (ns.DB.activeInstance) then
            local instance = ns.DB.INSTANCE_LIST[ns.DB.activeInstance]
            -- do not override the role check status if the player is already invited
            if (instance and not (instance.players and instance.players[playerName])) then
                
                -- validate the allowed number of priority items
                for index, itemId in pairs(event.prioItems) do
                    if (index > instance.prio) then
                        event.prioItems[index] = nil
                    end
                end
                
                instance.rolecheck[playerName] = {
                    -- TODO extract this custom table into a separate class
                    roles = utils.copy(roles),
                    trial = player.trial or false,
                    prioItems = event.prioItems or {}
                }
            end
        end
        -- update the UI
        ns.MasterUI.Update()
    else
        print("> No player registered with the name '"..playerName.."'.")
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
