-- namespace
local _, ns = ...;
-- imports
local Instance = ns.Instance
local Items = ns.Items
local Players = ns.Players
local RAIDS = ns.RAIDS
local RollOrder = ns.RollOrder
local utils = ns.utils

---
-- Contains utility methods for the instances.
--
local Instances = {}
ns.Instances = Instances

---
-- Creates a new instance for the given raid with the given name.
--
-- @param #string name
--          the name of the instance
-- @param #string raid
--          the name of the raid instance, e.g. Molten Core
--
-- @return #Instance
--          the new instance or nil
--
Instances.create = function(name, raid)
    name = name or ""
    if (strlen(name) < 1) then
        print("> Invalid instance name '"..name.."'.")
    else
        if (not raid) then
            print("> No raid name specified.")
        else
            if (not RAIDS[raid]) then
                print("> No raid with the name '"..raid.."' found.")
            else
                if (ns.DB.INSTANCE_LIST[name]) then
                    print("> An instance with the name '"..name.."' is already registered.")
                else
                    local instance = Instance.new(name, raid)
                    ns.DB.INSTANCE_LIST[name] = instance
                    print("> Created new instance '"..name.."'.")
                    return instance
                end
            end
        end
    end
end

---
-- Deletes the instance with the given name.
-- 
-- @param #string arg
--          the name of the instance to be deleted
--          
-- @return #boolean
--          true if the instance got deleted, false otherwise
-- 
Instances.delete = function(arg)
    local instance = Instances.get(arg)
    if (instance) then
        local name = instance.name
        ns.DB.INSTANCE_LIST[name] = nil
        print("> Removed instance '"..name.."'.")
        if (ns.DB.activeInstance == name) then ns.DB.activeInstance = nil end
        return true
    end
    return false
end

---
-- Sets the instance with the given name as active instance. The active instance is used for
-- various other functions like rolling, inviting and role checks.
-- 
-- @param #string arg
--          the name of the instance to be activated
--          
-- @return #boolean
--          true if the instance could be activated, false otherwise
-- 
Instances.activate = function(arg)
    local instance = Instances.get(arg)
    if (instance) then
        ns.DB.activeInstance = instance.name
        print("> Instance '"..ns.DB.activeInstance.."' is now the active instance.")
        return true
    end
    return false
end

---
-- Returns the instance with the given name or nil if no instance could be found.
--
-- @param #string name
--          the name of the instance
--
-- @return #Instance
--          the instance
--
Instances.get = function(name)
    if (not name) then
        print("> No instance name specified.")
    else
        local instance = ns.DB.INSTANCE_LIST[name]
        if (not instance) then
            print("> No instance with the name '"..name.."' found.")
        else
            return instance
        end
    end
end

---
-- Invites the player with the given name or UnitId into the currently active instance. This
-- will automatically create the priority list for the player.
--
-- If the given argument is nil, then all raid or party members will be invited.
--
-- @param #string arg
--          the player name or UnitId
--
Instances.invite = function(arg)
    if (not ns.DB.activeInstance) then
        print("> No active instance.")
    else
        local instance = Instances.get(ns.DB.activeInstance)
        if (instance) then
            if (not arg) then
                -- invite all party or raid members
                local invited = 0
                utils.forEachRaidMember(function(name)
                    local player = Players.get(name)
                    if (instance:addPlayer(player)) then
                        invited = invited + 1
                    end
                end)
                print("> Invited "..invited.." players.")
            else
                local player = Players.get(arg)
                if (instance:addPlayer(player, true)) then
                    print("> Created loot table for player '"..player.name.."'.")
                end
            end
        end
    end
end

---
-- Returns how many members of the raid or party did respond to the role check.
-- 
-- Returns two values: the number of players that responded to the role check and the number of
-- players in the raid. Returns nil if there is no instance active.
-- 
-- @return #number
--          number of players ready and total number of players
-- 
Instances.ready = function()
    if (not ns.DB.activeInstance) then
        print("> No active instance.")
    else
        local instance = Instances.get(ns.DB.activeInstance)
        if (instance) then
            local ready = 0
            local members = 0
            utils.forEachRaidMember(function(name)
                if (instance.rolecheck[name]) then
                    ready = ready + 1
                end
                -- count total raid members
                members = members + 1
            end)
            return ready, members
        end
    end
end

---
-- Returns how many members of the raid or party are invited into the currently
-- active instance.
-- 
-- Returns two values: the number of invited players and the number of players
-- in the raid. Returns nil if there is no instance active.
-- 
-- @return #number
--          number of players invited and total number of players
-- 
Instances.invited = function()
    if (not ns.DB.activeInstance) then
        print("> No active instance.")
    else
        local instance = Instances.get(ns.DB.activeInstance)
        if (instance) then
            local invited = 0
            local members = 0
            utils.forEachRaidMember(function(name)
                if (instance.players[name]) then
                    invited = invited + 1
                end
                -- count total raid members
                members = members + 1
            end)
            return invited, members
        end
    end
end

---
-- Creates and returns the RollOrder for the item with the given itemId or name within the
-- currently active instance.
-- 
-- @param #string arg
--          the itemId or name of the item to be rolled
-- 
-- @return #RollOrder
--          the roll order or nil
-- 
Instances.roll = function(arg)
    local item = Items.get(arg)
    if (item) then
        local instance = Instances.get(ns.DB.activeInstance)
        if (instance) then
            return RollOrder.of(instance, item)
        end
    end
end
