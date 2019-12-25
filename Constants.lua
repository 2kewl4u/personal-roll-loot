-- namespace
local _, ns = ...;

-- raids
local RAID_MOLTEN_CORE = "Molten Core"
local RAID_BLACKWING_LAIR = "Blackwing Lair"
local RAID_ONYXIA = "Onyxia's Lair"
local RAID_AHN_QIRAJ = "Ahn'Qiraj"
local RAIDS = {
    [RAID_MOLTEN_CORE] = true,
    [RAID_BLACKWING_LAIR] = true,
    [RAID_ONYXIA] = true,
    [RAID_AHN_QIRAJ] = true
}

-- add specific constants to the namespace
ns.RAIDS = RAIDS
