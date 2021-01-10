-- namespace
local _, ns = ...;

-- raids
local RAID_MOLTEN_CORE = "Molten Core"
local RAID_ONYXIA = "Onyxia's Lair"
local RAID_BLACKWING_LAIR = "Blackwing Lair"
local RAID_ZUL_GURUB = "Zul'Gurub"
local RAID_RUINS_AHN_QIRAJ = "Ruins of Ahn'Qiraj"
local RAID_AHN_QIRAJ_TEMPLE = "Ahn'Qiraj Temple"
local RAID_NAXXRAMAS = "Naxxramas"
local RAIDS = {
    [RAID_MOLTEN_CORE] = 409,
    [RAID_ONYXIA] = 249,
    [RAID_BLACKWING_LAIR] = 469,
    [RAID_ZUL_GURUB] = 309,
    [RAID_RUINS_AHN_QIRAJ] = 509,
    [RAID_AHN_QIRAJ_TEMPLE] = 531,
    [RAID_NAXXRAMAS] = 533
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

-- add to the namespace
ns.Raids = Raids
ns.RAIDS = RAIDS
