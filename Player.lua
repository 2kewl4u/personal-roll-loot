-- namespace
local _, ns = ...;
-- imports
local CLASS_ROLES = ns.CLASS_ROLES
local ITEM_LIST = ns.ITEM_LIST
local utils = ns.utils

---
-- The player contains the selected role and the equipment progress of a member
-- It is possible to select more than one role to receive loot for. The needlist
-- contains all the items the player hasn't looted yet.
-- 
local Player = {
    -- the name of the player without realm
    name,
    -- the realm of the player
    realm,
    -- the English class name in capital letters, e.g. WARRIOR
    class,
    -- a set of roles that the player has selected to receive loot for
    roles,
    -- a set of itemIds that define the players equipment progress
    needlist
}
Player.__index = Player
ns.Player = Player

---
-- Creates a set with all the roles the given class can take.
-- 
-- @param #string class
--          the class constant, e.g. WARRIOR
--          
-- @return #table
--          a set of roles for the class, not nil
--          
local function getClassRoles(class)
    local classRoles = {}
    -- copy the roles
    for role,_ in pairs(CLASS_ROLES[class] or {}) do
        classRoles[role] = true
    end
    return classRoles
end

---
-- Creates an initial set with all itemIds that the given class can use.
-- 
-- @param #string class
--          the class constant, e.g. WARRIOR
--          
-- @return #table
--          a set of itemIds the class can use, not nil
-- 
local function createNeedList(class)
    local needlist = {}
    for itemId,item in pairs(ITEM_LIST) do
        if (item:isForClass(class)) then
            needlist[itemId] = true
        end
    end
    return needlist
end

---
-- Creates a new player with the given name, realm and class.
-- 
-- @param #string name
--          the name of the player without realm
-- @param #string realm
--          the realm of the player
-- @param #string class
--          the class constant, e.g. WARRIOR
-- 
-- @return #Player
--          the new player
-- 
function Player.new(name, realm, class)
    local self = setmetatable({}, Player)
    self.name = name
    self.realm = realm
    self.class = class
    self.roles = getClassRoles(class)
    self.needlist = createNeedList(class)
    return self
end

---
-- Creates a new player based on the contents of the given player.
-- 
-- @param #Player player
--          the player to be copied
--          
-- @return #Player
--          a copy of the player, not nil
--          
function Player.copy(player)
    local copy = setmetatable({}, Player)
    copy.name = player.name
    copy.realm = player.realm
    copy.class = player.class
    copy.roles = utils.copy(player.roles)
    copy.needlist = utils.copy(player.needlist)
    return copy
end

---
-- Adds the given item to this player's need-list if possible without violating
-- class or role restrictions.
-- 
-- @param #Item item
--          the item to be added
-- 
-- @return #boolean
--          true if the item was added, nil otherwise
-- 
function Player:addItem(item)
    local player = self
    -- check that the item is for the players class
    if (item.classes[player.class]) then
        -- add item to player
        player.needlist[item.itemId] = true
        return true
    end
end

---
-- Removes the given item from this player's need-list if present.
-- 
-- @param #Item item
--          the item to be removed from the player
-- 
-- @return #boolean
--          true if the item was present and removed, nil otherwise
--          
function Player:removeItem(item)
    local player = self
    if (player.needlist[item.itemId]) then
        player.needlist[item.itemId] = nil
        return true
    end
end

---
-- Indicates whether this player needs the given item, thus has the item on its
-- need-list, has the right class and also has the corresponding role selected
-- for the item.
-- 
-- @param #Item item
--          the item to check if it is needed by this player
--          
-- @return #boolean
--          true if the player needs the item, nil otherwise
--          
function Player:needsItem(item)
    local player = self
    -- check if the item can be used by the players class
    if (item.classes[player.class]) then
        -- check if the item is on the players need-list
        if (player.needlist[item.itemId]) then
            -- check if the item is assigned the players role
            for role in pairs(item.roles) do
                if (player.roles[role]) then
                    return true
                end
            end
        end
    end
end

---
-- Encodes this player into a string representation to be serialized. The
-- string can be decoded back into a player using the decode() function.
-- 
-- @return #string
--          the encoded player
-- 
function Player:encode()
    local player = self
    local encoded = "name:"..player.name
    encoded = encoded.." realm:"..player.realm
    encoded = encoded.." class:"..player.class
    encoded = encoded.." roles:"..utils.toCSV(player.roles, tostring)
    encoded = encoded.." needlist:"..utils.toCSV(player.needlist, tostring)
    return encoded
end

---
-- Decodes the given string containing the previously encoded player data or
-- returns nil in case the player could not be decoded.
-- 
-- @param #string encoded
--          the encoded player string
--          
-- @return #Player
--          the player read from the encoded data or nil
--          
function Player.decode(encoded)
    local player = setmetatable({}, Player)
    -- split the attributes and set them to the player
    local split = { strsplit(" ", encoded) }
    for _, entry in pairs(split) do
        local k, v = strsplit(":", entry)
        player[k] = v
    end
    -- check that the player info is complete
    if (player.name and player.realm and player.class) then
        -- decode the csv lists
        local needcsv = player.needlist
        local needList = {}
        if (needcsv) then
            utils.fromCSV(needcsv, function(l, element)
                local index = tonumber(element)
                if (index) then needList[index] = true end
            end)
        end
        player.needlist = needList

        local rolescsv = player.roles
        local roles = {}
        if (rolescsv) then
            utils.fromCSV(rolescsv, function(l, element)
                roles[element] = true
            end)
        end
        player.roles = roles
        return player
    end
end
