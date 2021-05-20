-- namespace
local _, ns = ...;

-- imports
local utils = ns.utils

-- raids
local RAID_KARAZHAN = "Karazhan"
local RAID_GRUUL = "Gruul's Lair"
local RAID_MAGTHERIDON = "Magtheridon's Lair"
local RAIDS = {
    [RAID_KARAZHAN] = 532,
    [RAID_GRUUL] = 565,
    [RAID_MAGTHERIDON] = 544
}

local shortNames = {
    [RAID_KARAZHAN] = "kara",
    [RAID_GRUUL] = "gruul",
    [RAID_MAGTHERIDON] = "mag"
}

---
-- Contains utility methods for the raids.
-- 
local Raids = {}

---
-- Returns the English name of the current raid instance or nil if the player
-- is currently not in a raid instance.
-- 
-- Note that this only returns the currently known and configured instances used
-- by the addon.
-- 
-- @return #string
--          the name of the raid instance or nil
-- 
Raids.getCurrentInstance = function()
    local name, type, difficultyIndex, difficultyName, maxPlayers,
        dynamicDifficulty, isDynamic, instanceMapId, lfgID = GetInstanceInfo()
    if (instanceMapId and (maxPlayers == 20 or maxPlayers == 40)) then
        for raid, raidId in pairs(RAIDS) do
            if (instanceMapId == raidId) then
                return raid
            end
        end
    end
end

---
-- Indicates whether the player is currently in a raid instance for personal
-- loot.
-- 
-- @return #boolean
--          true if the player is in a raid instance, false otherwise
-- 
Raids.isInRaidInstance = function()
    if (Raids.getCurrentInstance()) then
        return true
    else
        return false
    end
end

---
-- Returns a short name for the given raid name.
-- 
-- @param #string raid
--          the name of the raid instance, e.g. Molten Core
-- 
-- @return #string
--          a short name for the raid, e.g. mc
-- 
Raids.getShortName = function(raid)
    return shortNames[raid] or raid
end

---
-- Returns a text representation of the given raids.
-- 
-- @param #set raids
--          a set of raid names
-- 
-- @return #string
--          a text representation of the raids
-- 
Raids.toString = function(raids)
    if (utils.tblsize(raids) < 2) then
        return select(1, next(raids))
    else
        return utils.toCSV(raids, Raids.getShortName, ", ")
    end
end

-- add to the namespace
ns.Raids = Raids
ns.RAIDS = RAIDS
