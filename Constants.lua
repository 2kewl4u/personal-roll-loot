-- namespace
local _, ns = ...;

-- roles
local ROLE_CASTER_DPS = "caster-dps"
local ROLE_MELEE_DPS = "melee-dps"
local ROLE_RANGED_DPS = "ranged-dps"
local ROLE_HEALER = "healer"
local ROLE_TANK = "tank"
local ROLES = {
    [ROLE_CASTER_DPS] = true,
    [ROLE_MELEE_DPS] = true,
    [ROLE_RANGED_DPS] = true,
    [ROLE_HEALER] = true,
    [ROLE_TANK] = true
}

local CLASS_WARRIOR = "WARRIOR"
local CLASS_PALADIN = "PALADIN"
local CLASS_HUNTER = "HUNTER"
local CLASS_ROGUE = "ROGUE"
local CLASS_PRIEST = "PRIEST"
local CLASS_DEATH_KNIGHT = "DEATHKNIGHT"
local CLASS_SHAMAN = "SHAMAN"
local CLASS_MAGE = "MAGE"
local CLASS_WARLOCK = "WARLOCK"
local CLASS_MONK = "MONK"
local CLASS_DRUID = "DRUID"
local CLASS_DEMON_HUNTER = "DEMONHUNTER"

local CLASS_ROLES = {
    [CLASS_WARRIOR] = {
        [ROLE_MELEE_DPS] = true,
        [ROLE_TANK] = true
    },
    [CLASS_PALADIN] = {
        [ROLE_HEALER] = true,
        [ROLE_MELEE_DPS] = true,
        [ROLE_TANK] = true
    },
    [CLASS_HUNTER] = {
        [ROLE_RANGED_DPS] = true
    },
    [CLASS_ROGUE] = {
        [ROLE_MELEE_DPS] = true
    },
    [CLASS_PRIEST] = {
        [ROLE_CASTER_DPS] = true,
        [ROLE_HEALER] = true
    },
    [CLASS_DEATH_KNIGHT] = {
        [ROLE_MELEE_DPS] = true,
        [ROLE_TANK] = true
    },
    [CLASS_SHAMAN] = {
        [ROLE_CASTER_DPS] = true,
        [ROLE_HEALER] = true,
        [ROLE_MELEE_DPS] = true
    },
    [CLASS_MAGE] = {
        [ROLE_CASTER_DPS] = true
    },
    [CLASS_WARLOCK] = {
        [ROLE_CASTER_DPS] = true
    },
    [CLASS_MONK] = {
        [ROLE_MELEE_DPS] = true,
        [ROLE_HEALER] = true,
        [ROLE_TANK] = true
    },
    [CLASS_DRUID] = {
        [ROLE_CASTER_DPS] = true,
        [ROLE_HEALER] = true,
        [ROLE_MELEE_DPS] = true,
        [ROLE_TANK] = true
    },
    [CLASS_DEMON_HUNTER] = {
        [ROLE_MELEE_DPS] = true,
        [ROLE_TANK] = true
    }
}

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
ns.ROLES = ROLES
ns.CLASS_ROLES = CLASS_ROLES
ns.RAIDS = RAIDS