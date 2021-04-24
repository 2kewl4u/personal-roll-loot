-- namespace
local _, ns = ...;
local utils = {}

---
-- Returns the size of the given table. Returns 0 if the table is nil.
--
-- @param #table tbl
--          the table to compute the size for
--
-- @return #number
--          the size of the table
--
utils.tblsize = function(tbl)
    local size = 0
    if (tbl) then
        for _ in pairs(tbl) do
            size = size + 1
        end
    end
    return size
end

---
-- Indicates whether the given table is empty. Returns also true if the table is nil.
-- 
-- @param #table tbl
--          the table to check
-- 
-- @return #boolean
--          true if the table is empty or nil, false otherwise
-- 
utils.tblempty = function(tbl)
    if (tbl) then
        return next(tbl) == nil
    end
    return true
end

---
-- Checks whether the given tables are equal, thus having the same size,
-- both have the same keys and each value is reference equal (==) to the
-- value referenced under the same key in the other table.
-- 
-- Note that if both tables are nil, this method also returns true.
-- 
-- @param #table tbl1
--          the first table
-- @param #table tbl2
--          the second table
-- 
-- @return #boolean
--          true if the tables are equal, false otherwise
-- 
utils.tblequals = function(tbl1, tbl2)
    -- nil check
    if (tbl1 == nil or tbl2 == nil) then
        return tbl1 == tbl2
    end
    
    for key, value in pairs(tbl1) do
        if (value ~= tbl2[key]) then
            return false
        end
    end
    for key, value in pairs(tbl2) do
        if (value ~= tbl1[key]) then
            return false
        end
    end
    return true
end

---
-- Copies the key-value pairs from the given table into a new table. Note that
-- the returned table is not a deep copy of the given table! Returns nil if the
-- given table is nil.
--
-- @param #table tbl
--          the table to be copied
--
-- @return #table
--          the copy of the table or nil
--
utils.copy = function(tbl)
    if (tbl) then
        local copy = {}
        for k,v in pairs(tbl) do
            copy[k] = v
        end
        return copy
    end
end

---
-- Returns a list containing the elements of the given list in random order.
--
-- @param #table list
--          a list with the elements to be shuffled
--
-- @return #table
--          a new list containing the shuffled elements
--
utils.shuffle = function(list)
    local shuffled = {}
    for i, v in ipairs(list) do
        local pos = math.random(1, #shuffled+1)
        table.insert(shuffled, pos, v)
    end
    return shuffled
end

---
-- Returns a random element from the given list or nil if the list is empty or
-- not an indexed based list.
-- 
-- @param #list
--          list the list with the elements
-- 
-- @return #?
--          an element from the given list
-- 
utils.randomElement = function(list)
    local size = #list
    if (size > 0) then
        local pos = math.random(1, size)
        return list[pos]
    end
end

---
-- Indicates whether the given string starts with the given start string.
-- 
-- @param #string string
--          the string to check the starting characters
-- @param #string start
--          the start string to check the given string for
-- 
-- @return #boolean
--          true if the given string starts with start, false otherwise
-- 
utils.strstarts = function(string, start)
    if (string and start) then
        local startlen = strlen(start)
        if (strlen(string) >= startlen) then
            return strsub(string, 1, startlen) == start
        end
        return false
    else
        -- one or both are nil
        return string == start
    end
end

---
-- Indicates whether the given text contains the given search text
-- (case insensitive).
-- 
-- Note that the empty search text is always inside the text.
-- 
-- @param #string text
--          the text to inside search for the text
-- @param #string searchText
--          the text that should be contained in the text
-- 
-- @return #boolean
--          true if the searchText is inside the text, false otherwise
-- 
utils.strContainsIgnoreCase = function(text, searchText)
    if (not searchText or strlen(searchText) < 1) then
        -- the text always contains the empty text
        return true
    else
        return string.find(strlower(text), strlower(searchText)) ~= nil
    end
end

---
-- Returns a comma-separated list string containing the elements of the given
-- list. The elements are passed as key-value pairs to the encoding function to
-- provide a string representation.
--
-- If the given delimiter is nil, the default comma ',' will be used.
--
-- @param #table list
--          the list to iterate over
-- @param #function enc
--          a function(key, value) return a string
-- @param #string delimiter
--          the delimiter, may be nil
--
-- @return #string
--          the comma-separated string list, not nil
--
utils.toCSV = function(list, enc, delimiter)
    local csv = ""
    delimiter = delimiter or ","
    if (list) then
        local key, value = next(list)
        if (key) then csv = enc(key, value) end
        for key, value in next, list, key do
            csv = csv..delimiter..enc(key, value)
        end
    end
    return csv
end

---
-- Returns a list containing the elements read from the given comma-separated
-- list string. The elements are passed to the decoding function that will
-- insert the element into the list.
--
-- If the given delimiter is nil, the default comma ','  will be used.
--
-- @param #string csv
--          the comma-separated string list
-- @param #function dec
--          a function(list, element) that inserts the element into the list
-- @param #string delimiter
--          the delimiter, may be nil
--
-- @return #table
--          the table containing the elements, not nil
--
utils.fromCSV = function(csv, dec, delimiter)
    local list = {}
    if (csv) then
        local split = { strsplit(delimiter or ",", csv) }
        for _, element in pairs(split) do
            dec(list, element)
        end
    end
    return list
end

---
-- Iterates over each raid member that is currently online and calls the given
-- action with the raid member name.
--
-- Note that even in case the player is not in a group, the action is always
-- called with the player name.
--
-- @param #function action
--          a function(name) that is called for each raid member
--
utils.forEachRaidMember = function(action)
    if (action) then
        local playerName = UnitName("player")
        local memberCount = GetNumGroupMembers()
        for index = 1, memberCount do
            local name, rank, subgroup, level, class, fileName,
                zone, online, isDead, role, isML = GetRaidRosterInfo(index)
            if (playerName ~= name and online) then
                action(name)
            end
        end
        -- if we are not in a group, we still execute the action on ourselves
        action(playerName)
    end
end

---
-- Returns the name of the current raid or party leader or nil if the player is
-- currently in no party or raid group.
-- 
-- @return #string
--          the name of the raid or party leader
-- 
utils.getRaidLeader = function()
    local memberCount = GetNumGroupMembers()
    for index = 1, memberCount do
        local name, rank, subgroup, level, class, fileName,
            zone, online, isDead, role, isML = GetRaidRosterInfo(index)
        -- rank is 2 if the raid member is the leader of the raid, 1 if promoted to assistant, and 0 otherwise
        if (rank == 2) then
            -- remove the realm from the player name
            name = strsplit("-", name, 2)
            return name
        end
    end
end

---
-- Indicates whether the player with the given name is currently the raid or
-- party leader.
-- 
-- @return #boolean
--          true if the player is party or raid leader, false otherwise
--  
utils.isGroupLeader = function(name)
    if (utils.getRaidLeader() == name) then
        return true
    else
        return false
    end
end

---
-- Indicates whether the player with the given name is in the current party or
-- raid group.
-- 
-- @param #string playerName
--          the name of the player to be checked
-- 
-- @return #boolean
--          true if the player is in the current party or raid group, false
--          otherwise
--          
utils.isInRaid = function(playerName)
    if (playerName) then
        local memberCount = GetNumGroupMembers()
        for index = 1, memberCount do
            local name, rank, subgroup, level, class, fileName,
                zone, online, isDead, role, isML = GetRaidRosterInfo(index)
            if (playerName == name) then
                return true
            end
        end
    end
    return false
end

---
-- Sends the given message to the party or raid chat. Does nothing it the player
-- is not in any kind of group.
-- 
-- @param #string message
--          the message to be appended to the group chat
-- 
utils.sendGroupMessage = function(message)
    if (IsInGroup()) then
        local chatType = "PARTY"
        if (IsInRaid()) then chatType = "RAID" end

        SendChatMessage(message, chatType)
    end    
end

---
-- Indicates whether the player if the given name is the current master looter,
-- thus has the privilege to assign loot to players.
-- 
-- @param #string playerName
--          the name of the player
-- @return #boolean true
--          if the player is master looter, false otherwise
--  
utils.isMasterLooter = function(playerName)
    local lootmethod, masterlooterPartyID, masterlooterRaidID = GetLootMethod()
    if (lootmethod == "master" and
        (masterlooterPartyID == 0 or
        (masterlooterRaidID and GetRaidRosterInfo(masterlooterRaidID) == playerName))) then
        return true
    else
        return false
    end
end

ns.utils = utils


-- UNIT TESTS
local function assertEquals(arg1, arg2)
    if (arg1 ~= arg2) then error("'"..tostring(arg1).."' ~= '"..tostring(arg2).."'", 2) end
end
local function tests()
    assertEquals(utils.tblsize({ 1, 2, 3 }), 3)
    assertEquals(utils.tblsize({ 1 }), 1)
    assertEquals(utils.tblsize({}), 0)
    assertEquals(utils.tblsize(nil), 0)

    assertEquals(utils.toCSV({ "a", "b", "c" }, function(k,v) return v end), "a,b,c")
end

local status, result = pcall(tests)
if not status then print("Test failures: "..result) end
