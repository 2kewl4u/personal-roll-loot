-- namespace
local _, ns = ...;
-- imports
local Item = ns.Item

-- constants
local ROLE_CASTER_DPS = "caster-dps"
local ROLE_MELEE_DPS = "melee-dps"
local ROLE_RANGED_DPS = "ranged-dps"
local ROLE_HEALER = "healer"
local ROLE_TANK = "tank"

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

local RAID_MOLTEN_CORE = "Molten Core"
local RAID_BLACKWING_LAIR = "Blackwing Lair"
local RAID_ONYXIA = "Onyxia's Lair"
local RAID_AHN_QIRAJ = "Ahn'Qiraj"

local SLOT_HEAD = 1
local SLOT_NECK = 2
local SLOT_SHOULDER = 3
local SLOT_CHEST = 5
local SLOT_WAIST = 6 -- belt
local SLOT_LEGS = 7
local SLOT_FEET = 8
local SLOT_WRIST = 9 -- bracers
local SLOT_HANDS = 10
local SLOT_FINGERS = 11
local SLOT_TRINKET = 13
local SLOT_BACK = 15
local SLOT_MAIN_HAND = 16
local SLOT_OFF_HAND = 17
local SLOT_RANGED = 18

-- the item list
local ITEM_LIST = {
    -- MOLTEN CORE
    [16795] = {
        itemId = 16795,
        name = "Arcanist Crown",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_MAGE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16796] = {
        itemId = 16796,
        name = "Arcanist Leggings",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_MAGE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16797] = {
        itemId = 16797,
        name = "Arcanist Mantle",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_MAGE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16798] = {
        itemId = 16798,
        name = "Arcanist Robes",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_MAGE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16799] = {
        itemId = 16799,
        name = "Arcanist Bindings",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_MAGE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16800] = {
        itemId = 16800,
        name = "Arcanist Boots",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_MAGE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16801] = {
        itemId = 16801,
        name = "Arcanist Gloves",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_MAGE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16802] = {
        itemId = 16802,
        name = "Arcanist Belt",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_MAGE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16803] = {
        itemId = 16803,
        name = "Felheart Slippers",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_WARLOCK] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16804] = {
        itemId = 16804,
        name = "Felheart Bracers",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_WARLOCK] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16805] = {
        itemId = 16805,
        name = "Felheart Gloves",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_WARLOCK] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16806] = {
        itemId = 16806,
        name = "Felheart Belt",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_WARLOCK] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16807] = {
        itemId = 16807,
        name = "Felheart Shoulder Pads",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_WARLOCK] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16808] = {
        itemId = 16808,
        name = "Felheart Horns",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_WARLOCK] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16809] = {
        itemId = 16809,
        name = "Felheart Robes",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_WARLOCK] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16810] = {
        itemId = 16810,
        name = "Felheart Pants",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_WARLOCK] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16811] = {
        itemId = 16811,
        name = "Boots of Prophecy",
        roles = { [ROLE_HEALER] = 1 },
        classes = { [CLASS_PRIEST] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16812] = {
        itemId = 16812,
        name = "Gloves of Prophecy",
        roles = { [ROLE_HEALER] = 1 },
        classes = { [CLASS_PRIEST] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16813] = {
        itemId = 16813,
        name = "Circlet of Prophecy",
        roles = { [ROLE_HEALER] = 1, [ROLE_CASTER_DPS] = 2 },
        classes = { [CLASS_PRIEST] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16814] = {
        itemId = 16814,
        name = "Pants of Prophecy",
        roles = { [ROLE_HEALER] = 1 },
        classes = { [CLASS_PRIEST] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16815] = {
        itemId = 16815,
        name = "Robes of Prophecy",
        roles = { [ROLE_HEALER] = 1 },
        classes = { [CLASS_PRIEST] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16816] = {
        itemId = 16816,
        name = "Mantle of Prophecy",
        roles = { [ROLE_HEALER] = 1, [ROLE_CASTER_DPS] = 2 },
        classes = { [CLASS_PRIEST] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16817] = {
        itemId = 16817,
        name = "Girdle of Prophecy",
        roles = { [ROLE_HEALER] = 1, [ROLE_CASTER_DPS] = 2 },
        classes = { [CLASS_PRIEST] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16819] = {
        itemId = 16819,
        name = "Vambraces of Prophecy",
        roles = { [ROLE_HEALER] = 1 },
        classes = { [CLASS_PRIEST] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16820] = {
        itemId = 16820,
        name = "Nightslayer Chestpiece",
        roles = { [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_ROGUE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16821] = {
        itemId = 16821,
        name = "Nightslayer Cover",
        roles = { [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_ROGUE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16822] = {
        itemId = 16822,
        name = "Nightslayer Pants",
        roles = { [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_ROGUE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16823] = {
        itemId = 16823,
        name = "Nightslayer Shoulder Pads",
        roles = { [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_ROGUE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16824] = {
        itemId = 16824,
        name = "Nightslayer Boots",
        roles = { [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_ROGUE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16825] = {
        itemId = 16825,
        name = "Nightslayer Bracelets",
        roles = { [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_ROGUE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16826] = {
        itemId = 16826,
        name = "Nightslayer Gloves",
        roles = { [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_ROGUE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16827] = {
        itemId = 16827,
        name = "Nightslayer Belt",
        roles = { [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_ROGUE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16828] = {
        itemId = 16828,
        name = "Cenarion Belt",
        roles = { [ROLE_CASTER_DPS] = 1, [ROLE_HEALER] = 1 },
        classes = { [CLASS_DRUID] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16829] = {
        itemId = 16829,
        name = "Cenarion Boots",
        roles = { [ROLE_HEALER] = 1 },
        classes = { [CLASS_DRUID] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16830] = {
        itemId = 16830,
        name = "Cenarion Bracers",
        roles = { [ROLE_CASTER_DPS] = 1, [ROLE_HEALER] = 1 },
        classes = { [CLASS_DRUID] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16831] = {
        itemId = 16831,
        name = "Cenarion Gloves",
        roles = { [ROLE_HEALER] = 1 },
        classes = { [CLASS_DRUID] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16833] = {
        itemId = 16833,
        name = "Cenarion Vestments",
        roles = { [ROLE_HEALER] = 1 },
        classes = { [CLASS_DRUID] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16834] = {
        itemId = 16834,
        name = "Cenarion Helm",
        roles = { [ROLE_HEALER] = 1, [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_DRUID] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16835] = {
        itemId = 16835,
        name = "Cenarion Leggings",
        roles = { [ROLE_HEALER] = 1 },
        classes = { [CLASS_DRUID] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16836] = {
        itemId = 16836,
        name = "Cenarion Spaulders",
        roles = { [ROLE_HEALER] = 1 },
        classes = { [CLASS_DRUID] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16837] = {
        itemId = 16837,
        name = "Earthfury Boots",
        roles = { [ROLE_HEALER] = 1 },
        classes = { [CLASS_SHAMAN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16838] = {
        itemId = 16838,
        name = "Earthfury Belt",
        roles = { [ROLE_HEALER] = 1 },
        classes = { [CLASS_SHAMAN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16839] = {
        itemId = 16839,
        name = "Earthfury Gauntlets",
        roles = { [ROLE_HEALER] = 1, [ROLE_CASTER_DPS] = 2 },
        classes = { [CLASS_SHAMAN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16840] = {
        itemId = 16840,
        name = "Earthfury Bracers",
        roles = { [ROLE_HEALER] = 1, [ROLE_CASTER_DPS] = 2 },
        classes = { [CLASS_SHAMAN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16841] = {
        itemId = 16841,
        name = "Earthfury Vestments",
        roles = { [ROLE_HEALER] = 1 },
        classes = { [CLASS_SHAMAN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16842] = {
        itemId = 16842,
        name = "Earthfury Helmet",
        roles = { [ROLE_HEALER] = 1 },
        classes = { [CLASS_SHAMAN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16843] = {
        itemId = 16843,
        name = "Earthfury Legguards",
        roles = { [ROLE_HEALER] = 1, [ROLE_CASTER_DPS] = 2 },
        classes = { [CLASS_SHAMAN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16844] = {
        itemId = 16844,
        name = "Earthfury Epaulets",
        roles = { [ROLE_HEALER] = 1 },
        classes = { [CLASS_SHAMAN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16845] = {
        itemId = 16845,
        name = "Giantstalker's Breastplate",
        roles = { [ROLE_RANGED_DPS] = 1 },
        classes = { [CLASS_HUNTER] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16846] = {
        itemId = 16846,
        name = "Giantstalker's Helmet",
        roles = { [ROLE_RANGED_DPS] = 1 },
        classes = { [CLASS_HUNTER] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16847] = {
        itemId = 16847,
        name = "Giantstalker's Leggings",
        roles = { [ROLE_RANGED_DPS] = 1 },
        classes = { [CLASS_HUNTER] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16848] = {
        itemId = 16848,
        name = "Giantstalker's Epaulets",
        roles = { [ROLE_RANGED_DPS] = 1 },
        classes = { [CLASS_HUNTER] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16849] = {
        itemId = 16849,
        name = "Giantstalker's Boots",
        roles = { [ROLE_RANGED_DPS] = 1 },
        classes = { [CLASS_HUNTER] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16850] = {
        itemId = 16850,
        name = "Giantstalker's Bracers",
        roles = { [ROLE_RANGED_DPS] = 1 },
        classes = { [CLASS_HUNTER] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16851] = {
        itemId = 16851,
        name = "Giantstalker's Belt",
        roles = { [ROLE_RANGED_DPS] = 1 },
        classes = { [CLASS_HUNTER] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16852] = {
        itemId = 16852,
        name = "Giantstalker's Gloves",
        roles = { [ROLE_RANGED_DPS] = 1 },
        classes = { [CLASS_HUNTER] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16853] = {
        itemId = 16853,
        name = "Lawbringer Chestguard",
        roles = { [ROLE_HEALER] = 1, [ROLE_MELEE_DPS] = 2, [ROLE_TANK] = 2 },
        classes = { [CLASS_PALADIN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16854] = {
        itemId = 16854,
        name = "Lawbringer Helm",
        roles = { [ROLE_HEALER] = 1, [ROLE_MELEE_DPS] = 2, [ROLE_TANK] = 2 },
        classes = { [CLASS_PALADIN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16855] = {
        itemId = 16855,
        name = "Lawbringer Legplates",
        roles = { [ROLE_HEALER] = 1, [ROLE_MELEE_DPS] = 2, [ROLE_TANK] = 2 },
        classes = { [CLASS_PALADIN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16856] = {
        itemId = 16856,
        name = "Lawbringer Spaulders",
        roles = { [ROLE_HEALER] = 1, [ROLE_MELEE_DPS] = 2, [ROLE_TANK] = 2 },
        classes = { [CLASS_PALADIN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16857] = {
        itemId = 16857,
        name = "Lawbringer Bracers",
        roles = { [ROLE_HEALER] = 1, [ROLE_MELEE_DPS] = 1, [ROLE_TANK] = 2 },
        classes = { [CLASS_PALADIN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16858] = {
        itemId = 16858,
        name = "Lawbringer Belt",
        roles = { [ROLE_HEALER] = 1, [ROLE_MELEE_DPS] = 2, [ROLE_TANK] = 2 },
        classes = { [CLASS_PALADIN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16859] = {
        itemId = 16859,
        name = "Lawbringer Boots",
        roles = { [ROLE_HEALER] = 1, [ROLE_MELEE_DPS] = 2, [ROLE_TANK] = 2 },
        classes = { [CLASS_PALADIN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16860] = {
        itemId = 16860,
        name = "Lawbringer Gauntlets",
        roles = { [ROLE_HEALER] = 1, [ROLE_MELEE_DPS] = 2, [ROLE_TANK] = 2 },
        classes = { [CLASS_PALADIN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16861] = {
        itemId = 16861,
        name = "Bracers of Might",
        roles = { [ROLE_TANK] = 1 },
        classes = { [CLASS_WARRIOR] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16862] = {
        itemId = 16862,
        name = "Sabatons of Might",
        roles = { [ROLE_TANK] = 1 },
        classes = { [CLASS_WARRIOR] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16863] = {
        itemId = 16863,
        name = "Gauntlets of Might",
        roles = { [ROLE_TANK] = 1 },
        classes = { [CLASS_WARRIOR] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16864] = {
        itemId = 16864,
        name = "Belt of Might",
        roles = { [ROLE_TANK] = 1 },
        classes = { [CLASS_WARRIOR] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16865] = {
        itemId = 16865,
        name = "Breastplate of Might",
        roles = { [ROLE_TANK] = 1 },
        classes = { [CLASS_WARRIOR] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16866] = {
        itemId = 16866,
        name = "Helm of Might",
        roles = { [ROLE_TANK] = 1 },
        classes = { [CLASS_WARRIOR] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16867] = {
        itemId = 16867,
        name = "Legplates of Might",
        roles = { [ROLE_TANK] = 1 },
        classes = { [CLASS_WARRIOR] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16868] = {
        itemId = 16868,
        name = "Pauldrons of Might",
        roles = { [ROLE_TANK] = 1 },
        classes = { [CLASS_WARRIOR] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1,
        removable = true
    },
    [16901] = {
        itemId = 16901,
        name = "Stormrage Legguards",
        roles = { [ROLE_HEALER] = 1 },
        classes = { [CLASS_DRUID] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2,
        removable = true
    },
    [16909] = {
        itemId = 16909,
        name = "Bloodfang Pants",
        roles = { [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_ROGUE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2,
        removable = true
    },
    [16915] = {
        itemId = 16915,
        name = "Netherwind Pants",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_MAGE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2,
        removable = true
    },
    [16922] = {
        itemId = 16922,
        name = "Leggings of Transcendence",
        roles = { [ROLE_HEALER] = 1 },
        classes = { [CLASS_PRIEST] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2,
        removable = true
    },
    [16930] = {
        itemId = 16930,
        name = "Nemesis Leggings",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_WARLOCK] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2,
        removable = true
    },
    [16938] = {
        itemId = 16938,
        name = "Dragonstalker's Legguards",
        roles = { [ROLE_RANGED_DPS] = 1 },
        classes = { [CLASS_HUNTER] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2,
        removable = true
    },
    [16946] = {
        itemId = 16946,
        name = "Legplates of Ten Storms",
        roles = { [ROLE_HEALER] = 1, [ROLE_CASTER_DPS] = 2 },
        classes = { [CLASS_SHAMAN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2,
        removable = true
    },
    [16954] = {
        itemId = 16954,
        name = "Judgement Legplates",
        roles = { [ROLE_HEALER] = 2, [ROLE_MELEE_DPS] = 1, [ROLE_TANK] = 1 },
        classes = { [CLASS_PALADIN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2,
        removable = true
    },
    [16962] = {
        itemId = 16962,
        name = "Legplates of Wrath",
        roles = { [ROLE_TANK] = 1 },
        classes = { [CLASS_WARRIOR] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2,
        removable = true
    },
    [17063] = {
        itemId = 17063,
        name = "Band of Accuria",
        roles = { [ROLE_MELEE_DPS] = 1, [ROLE_RANGED_DPS] = 1, [ROLE_TANK] = 2 },
        classes = { [CLASS_WARRIOR] = 1, [CLASS_PALADIN] = 1, [CLASS_HUNTER] = 1, [CLASS_ROGUE] = 1, [CLASS_SHAMAN] = 1, [CLASS_DRUID] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17065] = {
        itemId = 17065,
        name = "Medallion of Steadfast Might",
        roles = { [ROLE_TANK] = 1 },
        classes = { [CLASS_WARRIOR] = 1, [CLASS_PALADIN] = 1, [CLASS_DRUID] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17066] = {
        itemId = 17066,
        name = "Drillborer Disk",
        roles = { [ROLE_TANK] = 1 },
        classes = { [CLASS_WARRIOR] = 1, [CLASS_PALADIN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17069] = {
        itemId = 17069,
        name = "Striker's Mark",
        roles = { [ROLE_RANGED_DPS] = 2, [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_HUNTER] = 2, [CLASS_ROGUE] = 1, [CLASS_WARRIOR] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17071] = {
        itemId = 17071,
        name = "Gutgore Ripper",
        roles = { [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_ROGUE] = 1, [CLASS_WARRIOR] = 2, [CLASS_SHAMAN] = 3 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17072] = {
        itemId = 17072,
        name = "Blastershot Launcher",
        roles = { [ROLE_RANGED_DPS] = 1, [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_HUNTER] = 1, [CLASS_ROGUE] = 1, [CLASS_WARRIOR] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17073] = {
        itemId = 17073,
        name = "Earthshaker",
        roles = { [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_DRUID] = 2, [CLASS_PALADIN] = 1, [CLASS_WARRIOR] = 1, [CLASS_SHAMAN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17074] = {
        itemId = 17074,
        name = "Shadowstrike",
        roles = { [ROLE_RANGED_DPS] = 4, [ROLE_MELEE_DPS] = 3 },
        classes = { [CLASS_HUNTER] = 4, [CLASS_PALADIN] = 3, [CLASS_WARRIOR] = 3 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17076] = {
        itemId = 17076,
        name = "Bonereaver's Edge",
        roles = { [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_PALADIN] = 1, [CLASS_WARRIOR] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17077] = {
        itemId = 17077,
        name = "Crimson Shocker",
        roles = { [ROLE_HEALER] = 1, [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_PRIEST] = 1, [CLASS_WARLOCK] = 1, [CLASS_MAGE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17082] = {
        itemId = 17082,
        name = "Shard of the Flame",
        roles = { [ROLE_HEALER] = 3, [ROLE_CASTER_DPS] = 3, [ROLE_MELEE_DPS] = 4, [ROLE_TANK] = 4, [ROLE_RANGED_DPS] = 4 },
        classes = { [CLASS_WARRIOR] = 3, [CLASS_PALADIN] = 3, [CLASS_HUNTER] = 4, [CLASS_ROGUE] = 4, [CLASS_SHAMAN] = 3, [CLASS_DRUID] = 3,
            [CLASS_PRIEST] = 3, [CLASS_WARLOCK] = 3, [CLASS_MAGE] = 4 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17102] = {
        itemId = 17102,
        name = "Cloak of the Shrouded Mists",
        roles = { [ROLE_RANGED_DPS] = 1, [ROLE_MELEE_DPS] = 1, [ROLE_TANK] = 2 },
        classes = { [CLASS_WARRIOR] = 2, [CLASS_PALADIN] = 2, [CLASS_HUNTER] = 1, [CLASS_ROGUE] = 1, [CLASS_SHAMAN] = 2, [CLASS_DRUID] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17103] = {
        itemId = 17103,
        name = "Azuresong Mageblade",
        roles = { [ROLE_HEALER] = 2, [ROLE_CASTER_DPS] = 1, [ROLE_TANK] = 2 },
        classes = { [CLASS_MAGE] = 1, [CLASS_WARLOCK] = 1, [CLASS_PALADIN] = 2 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17104] = {
        itemId = 17104,
        name = "Spinal Reaper",
        roles = { [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_SHAMAN] = 1, [CLASS_PALADIN] = 1, [CLASS_WARRIOR] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17105] = {
        itemId = 17105,
        name = "Aurastone Hammer",
        roles = { [ROLE_HEALER] = 1, [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_DRUID] = 1, [CLASS_SHAMAN] = 1, [CLASS_PALADIN] = 1, [CLASS_PRIEST] = 3 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17106] = {
        itemId = 17106,
        name = "Malistar's Defender",
        roles = { [ROLE_HEALER] = 1, [ROLE_CASTER_DPS] = 2, [ROLE_TANK] = 3 },
        classes = { [CLASS_SHAMAN] = 1, [CLASS_PALADIN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17107] = {
        itemId = 17107,
        name = "Dragon's Blood Cape",
        roles = { [ROLE_MELEE_DPS] = 2, [ROLE_TANK] = 1 },
        classes = { [CLASS_WARRIOR] = 1, [CLASS_PALADIN] = 1, [CLASS_SHAMAN] = 2, [CLASS_DRUID] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17109] = {
        itemId = 17109,
        name = "Choker of Enlightenment",
        roles = { [ROLE_HEALER] = 1, [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_PALADIN] = 3, [CLASS_SHAMAN] = 1, [CLASS_DRUID] = 1, [CLASS_PRIEST] = 1, [CLASS_WARLOCK] = 1, [CLASS_MAGE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17110] = {
        itemId = 17110,
        name = "Seal of the Archmagus",
        roles = { [ROLE_HEALER] = 1, [ROLE_CASTER_DPS] = 2 },
        classes = { [CLASS_PALADIN] = 1, [CLASS_SHAMAN] = 1, [CLASS_DRUID] = 1, [CLASS_PRIEST] = 1, [CLASS_WARLOCK] = 2, [CLASS_MAGE] = 2 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17204] = {
        itemId = 17204,
        name = "Eye of Sulfuras",
        roles = { [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_PALADIN] = 1, [CLASS_SHAMAN] = 1, [CLASS_WARRIOR] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18203] = {
        itemId = 18203,
        name = "Eskhandar's Right Claw",
        roles = { [ROLE_RANGED_DPS] = 4, [ROLE_MELEE_DPS] = 3, [ROLE_TANK] = 4 },
        classes = { [CLASS_HUNTER] = 4, [CLASS_ROGUE] = 3, [CLASS_SHAMAN] = 3, [CLASS_WARRIOR] = 3 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18564] = {
        itemId = 18564,
        name = "Bindings of the Windseeker",
        roles = { [ROLE_MELEE_DPS] = 2, [ROLE_TANK] = 1 },
        classes = { [CLASS_PALADIN] = 1, [CLASS_ROGUE] = 2, [CLASS_WARRIOR] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18646] = {
        itemId = 18646,
        name = "The Eye of Divinity",
        roles = { [ROLE_CASTER_DPS] = 1, [ROLE_HEALER] = 1 },
        classes = { [CLASS_PRIEST] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18703] = {
        itemId = 18703,
        name = "Ancient Petrified Leaf",
        roles = { [ROLE_RANGED_DPS] = 1 },
        classes = { [CLASS_HUNTER] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18803] = {
        itemId = 18803,
        name = "Finkle's Lava Dredger",
        roles = { [ROLE_HEALER] = 2, [ROLE_MELEE_DPS] = 2 },
        classes = { [CLASS_DRUID] = 2, [CLASS_SHAMAN] = 3, [CLASS_PALADIN] = 2 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18805] = {
        itemId = 18805,
        name = "Core Hound Tooth",
        roles = { [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_WARRIOR] = 2, [CLASS_ROGUE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18806] = {
        itemId = 18806,
        name = "Core Forged Greaves",
        roles = { [ROLE_TANK] = 1 },
        classes = { [CLASS_WARRIOR] = 2, [CLASS_PALADIN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18808] = {
        itemId = 18808,
        name = "Gloves of the Hypnotic Flame",
        roles = { [ROLE_CASTER_DPS] = 2 },
        classes = { [CLASS_WARLOCK] = 2, [CLASS_MAGE] = 2 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18809] = {
        itemId = 18809,
        name = "Sash of Whispered Secrets",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_WARLOCK] = 1, [CLASS_PRIEST] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18810] = {
        itemId = 18810,
        name = "Wild Growth Spaulders",
        roles = { [ROLE_HEALER] = 1 },
        classes = { [CLASS_DRUID] = 1, [CLASS_SHAMAN] = 2 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18811] = {
        itemId = 18811,
        name = "Fireproof Cloak",
        roles = { [ROLE_HEALER] = 2, [ROLE_CASTER_DPS] = 2 },
        classes = { [CLASS_PALADIN] = 2, [CLASS_SHAMAN] = 2, [CLASS_DRUID] = 2, [CLASS_PRIEST] = 2, [CLASS_WARLOCK] = 2, [CLASS_MAGE] = 2 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18812] = {
        itemId = 18812,
        name = "Wristguards of True Flight",
        roles = { [ROLE_MELEE_DPS] = 1, [ROLE_RANGED_DPS] = 1 },
        classes = { [CLASS_HUNTER] = 1, [CLASS_SHAMAN] = 1, [CLASS_PALADIN] = 2 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18814] = {
        itemId = 18814,
        name = "Choker of the Fire Lord",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_PALADIN] = 1, [CLASS_SHAMAN] = 1, [CLASS_DRUID] = 1, [CLASS_PRIEST] = 1, [CLASS_WARLOCK] = 1, [CLASS_MAGE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18815] = {
        itemId = 18815,
        name = "Essence of the Pure Flame",
        roles = { [ROLE_HEALER] = 4, [ROLE_CASTER_DPS] = 4, [ROLE_MELEE_DPS] = 4, [ROLE_TANK] = 3 },
        classes = { [CLASS_WARRIOR] = 3, [CLASS_PALADIN] = 3, [CLASS_SHAMAN] = 3, [CLASS_DRUID] = 3 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18816] = {
        itemId = 18816,
        name = "Perdition's Blade",
        roles = { [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_ROGUE] = 1, [CLASS_WARRIOR] = 2 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18817] = {
        itemId = 18817,
        name = "Crown of Destruction",
        roles = { [ROLE_RANGED_DPS] = 2, [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_HUNTER] = 2, [CLASS_SHAMAN] = 1, [CLASS_PALADIN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18820] = {
        itemId = 18820,
        name = "Talisman of Ephemeral Power",
        roles = { [ROLE_CASTER_DPS] = 1, [ROLE_HEALER] = 2 },
        classes = { [CLASS_PALADIN] = 2, [CLASS_SHAMAN] = 1, [CLASS_DRUID] = 1, [CLASS_PRIEST] = 1, [CLASS_WARLOCK] = 1, [CLASS_MAGE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18821] = {
        itemId = 18821,
        name = "Quick Strike Ring",
        roles = { [ROLE_RANGED_DPS] = 2, [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_PALADIN] = 1, [CLASS_SHAMAN] = 1, [CLASS_DRUID] = 1, [CLASS_ROGUE] = 2, [CLASS_WARRIOR] = 1, [CLASS_HUNTER] = 2 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18822] = {
        itemId = 18822,
        name = "Obsidian Edged Blade",
        roles = { [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_PALADIN] = 1, [CLASS_WARRIOR] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18823] = {
        itemId = 18823,
        name = "Aged Core Leather Gloves",
        roles = { [ROLE_MELEE_DPS] = 1, [ROLE_TANK] = 3 },
        classes = { [CLASS_ROGUE] = 1, [CLASS_DRUID] = 3, [CLASS_SHAMAN] = 3, [CLASS_WARRIOR] = 2 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18824] = {
        itemId = 18824,
        name = "Magma Tempered Boots",
        roles = { [ROLE_HEALER] = 1 },
        classes = { [CLASS_PALADIN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18829] = {
        itemId = 18829,
        name = "Deep Earth Spaulders",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_SHAMAN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18832] = {
        itemId = 18832,
        name = "Brutality Blade",
        roles = { [ROLE_RANGED_DPS] = 3, [ROLE_MELEE_DPS] = 1, [ROLE_TANK] = 2 },
        classes = { [CLASS_HUNTER] = 3, [CLASS_ROGUE] = 1, [CLASS_PALADIN] = 2, [CLASS_WARRIOR] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18842] = {
        itemId = 18842,
        name = "Staff of Dominance",
        roles = { [ROLE_CASTER_DPS] = 1, [ROLE_HEALER] = 2 },
        classes = { [CLASS_DRUID] = 1, [CLASS_MAGE] = 1, [CLASS_SHAMAN] = 2, [CLASS_WARLOCK] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18861] = {
        itemId = 18861,
        name = "Flamewaker Legplates",
        roles = { [ROLE_TANK] = 1 },
        classes = { [CLASS_PALADIN] = 1, [CLASS_WARRIOR] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18870] = {
        itemId = 18870,
        name = "Helm of the Lifegiver",
        roles = { [ROLE_HEALER] = 1 },
        classes = { [CLASS_SHAMAN] = 1, [CLASS_PALADIN] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18872] = {
        itemId = 18872,
        name = "Manastorm Leggings",
        roles = { [ROLE_HEALER] = 1, [ROLE_CASTER_DPS] = 3 },
        classes = { [CLASS_PALADIN] = 2, [CLASS_SHAMAN] = 2, [CLASS_DRUID] = 2, [CLASS_MAGE] = 3, [CLASS_PRIEST] = 1, [CLASS_WARLOCK] = 3 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18875] = {
        itemId = 18875,
        name = "Salamander Scale Pants",
        roles = { [ROLE_HEALER] = 1 },
        classes = { [CLASS_DRUID] = 1, [CLASS_SHAMAN] = 2, [CLASS_PALADIN] = 2 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18878] = {
        itemId = 18878,
        name = "Sorcerous Dagger",
        roles = { [ROLE_HEALER] = 2, [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_DRUID] = 1, [CLASS_MAGE] = 1, [CLASS_PRIEST] = 2, [CLASS_SHAMAN] = 1, [CLASS_WARLOCK] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18879] = {
        itemId = 18879,
        name = "Heavy Dark Iron Ring",
        roles = { [ROLE_TANK] = 1 },
        classes = { [CLASS_DRUID] = 1, [CLASS_PALADIN] = 1, [CLASS_WARRIOR] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [19136] = {
        itemId = 19136,
        name = "Mana Igniting Cord",
        roles = { [ROLE_HEALER] = 2, [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_DRUID] = 1, [CLASS_PRIEST] = 2, [CLASS_MAGE] = 1, [CLASS_WARLOCK] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [19137] = {
        itemId = 19137,
        name = "Onslaught Girdle",
        roles = { [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_WARRIOR] = 1, [CLASS_PALADIN] = 2 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [19138] = {
        itemId = 19138,
        name = "Band of Sulfuras",
        roles = { [ROLE_HEALER] = 1, [ROLE_CASTER_DPS] = 2 },
        classes = { [CLASS_PALADIN] = 1, [CLASS_SHAMAN] = 1, [CLASS_DRUID] = 1, [CLASS_PRIEST] = 1, [CLASS_WARLOCK] = 2, [CLASS_MAGE] = 2 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [19139] = {
        itemId = 19139,
        name = "Fireguard Shoulders",
        roles = { [ROLE_HEALER] = 4, [ROLE_TANK] = 2, [ROLE_CASTER_DPS] = 4, [ROLE_MELEE_DPS] = 3 },
        classes = { [CLASS_DRUID] = 2, [CLASS_ROGUE] = 3 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [19140] = {
        itemId = 19140,
        name = "Cauterizing Band",
        roles = { [ROLE_HEALER] = 1 },
        classes = { [CLASS_PALADIN] = 1, [CLASS_SHAMAN] = 1, [CLASS_DRUID] = 1, [CLASS_PRIEST] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [19142] = {
        itemId = 19142,
        name = "Fire Runed Grimoire",
        roles = { [ROLE_HEALER] = 2, [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_PALADIN] = 2, [CLASS_SHAMAN] = 2, [CLASS_DRUID] = 1, [CLASS_PRIEST] = 2, [CLASS_WARLOCK] = 1, [CLASS_MAGE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [19143] = {
        itemId = 19143,
        name = "Flameguard Gauntlets",
        roles = { [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_PALADIN] = 1, [CLASS_WARRIOR] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [19144] = {
        itemId = 19144,
        name = "Sabatons of the Flamewalker",
        roles = { [ROLE_RANGED_DPS] = 1, [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_SHAMAN] = 1, [CLASS_PALADIN] = 1, [CLASS_HUNTER] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [19145] = {
        itemId = 19145,
        name = "Robe of Volatile Power",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_SHAMAN] = 1, [CLASS_DRUID] = 1, [CLASS_PRIEST] = 2, [CLASS_WARLOCK] = 1, [CLASS_MAGE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [19146] = {
        itemId = 19146,
        name = "Wristguards of Stability",
        roles = { [ROLE_MELEE_DPS] = 1, [ROLE_TANK] = 1 },
        classes = { [CLASS_DRUID] = 1, [CLASS_SHAMAN] = 2, [CLASS_WARRIOR] = 2 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [19147] = {
        itemId = 19147,
        name = "Ring of Spell Power",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_SHAMAN] = 1, [CLASS_DRUID] = 1, [CLASS_PRIEST] = 1, [CLASS_WARLOCK] = 1, [CLASS_MAGE] = 1 },
        raids = { [RAID_MOLTEN_CORE] = true }
    },


    -- ONYXIA
    [16900] = {
        itemId = 16900,
        name = "Stormrage Cover",
        roles = { [ROLE_HEALER] = 1 },
        classes = { [CLASS_DRUID] = 1 },
        raids = { [RAID_ONYXIA] = true }
    },
    [16908] = {
        itemId = 16908,
        name = "Bloodfang Hood",
        roles = { [ROLE_MELEE_DPS] = 1 },
        classes = { [CLASS_ROGUE] = 1 },
        raids = { [RAID_ONYXIA] = true }
    },
    [16914] = {
        itemId = 16914,
        name = "Netherwind Crown",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_MAGE] = 1 },
        raids = { [RAID_ONYXIA] = true }
    },
    [16921] = {
        itemId = 16921,
        name = "Halo of Transcendence",
        roles = { [ROLE_HEALER] = 1 },
        classes = { [CLASS_PRIEST] = 1 },
        raids = { [RAID_ONYXIA] = true }
    },
    [16929] = {
        itemId = 16929,
        name = "Nemesis Skullcap",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_WARLOCK] = 1 },
        raids = { [RAID_ONYXIA] = true }
    },
    [16939] = {
        itemId = 16939,
        name = "Dragonstalker's Helm",
        roles = { [ROLE_RANGED_DPS] = 1 },
        classes = { [CLASS_HUNTER] = 1 },
        raids = { [RAID_ONYXIA] = true }
    },
    [16947] = {
        itemId = 16947,
        name = "Helmet of Ten Storms",
        roles = { [ROLE_HEALER] = 1, [ROLE_CASTER_DPS] = 2 },
        classes = { [CLASS_SHAMAN] = 1 },
        raids = { [RAID_ONYXIA] = true }
    },
    [16955] = {
        itemId = 16955,
        name = "Judgement Crown",
        roles = { [ROLE_MELEE_DPS] = 1, [ROLE_HEALER] = 2, [ROLE_TANK] = 1 },
        classes = { [CLASS_PALADIN] = 1 },
        raids = { [RAID_ONYXIA] = true }
    },
    [16963] = {
        itemId = 16963,
        name = "Helm of Wrath",
        roles = { [ROLE_TANK] = 1 },
        classes = { [CLASS_WARRIOR] = 1 },
        raids = { [RAID_ONYXIA] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 2,
        removable = true
    },
    [17064] = {
        itemId = 17064,
        name = "Shard of the Scale",
        roles = { [ROLE_HEALER] = 1, [ROLE_CASTER_DPS] = 2 },
        classes = { [CLASS_PALADIN] = 1, [CLASS_SHAMAN] = 1, [CLASS_DRUID] = 1, [CLASS_PRIEST] = 1, [CLASS_WARLOCK] = 2, [CLASS_MAGE] = 2 },
        raids = { [RAID_ONYXIA] = true }
    },
    [17067] = {
        itemId = 17067,
        name = "Ancient Cornerstone Grimoire",
        roles = { [ROLE_HEALER] = 1, [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_PALADIN] = 2, [CLASS_SHAMAN] = 2, [CLASS_DRUID] = 1, [CLASS_PRIEST] = 2, [CLASS_WARLOCK] = 1, [CLASS_MAGE] = 1 },
        raids = { [RAID_ONYXIA] = true }
    },
    [17068] = {
        itemId = 17068,
        name = "Deathbringer",
        roles = { [ROLE_MELEE_DPS] = 1, [ROLE_TANK] = 2 },
        classes = { [CLASS_PALADIN] = 2, [CLASS_SHAMAN] = 2, [CLASS_WARRIOR] = 1 },
        raids = { [RAID_ONYXIA] = true }
    },
    [17075] = {
        itemId = 17075,
        name = "Vis'kag the Bloodletter",
        roles = { [ROLE_MELEE_DPS] = 1, [ROLE_TANK] = 2 },
        classes = { [CLASS_ROGUE] = 1, [CLASS_WARRIOR] = 1 },
        raids = { [RAID_ONYXIA] = true }
    },
    [17078] = {
        itemId = 17078,
        name = "Sapphiron Drape",
        roles = { [ROLE_CASTER_DPS] = 1 },
        classes = { [CLASS_SHAMAN] = 1, [CLASS_DRUID] = 1, [CLASS_PRIEST] = 1, [CLASS_WARLOCK] = 1, [CLASS_MAGE] = 1 },
        raids = { [RAID_ONYXIA] = true }
    },
    [18205] = {
        itemId = 18205,
        name = "Eskhandar's Collar",
        roles = { [ROLE_RANGED_DPS] = 2, [ROLE_MELEE_DPS] = 1, [ROLE_TANK] = 2 },
        classes = { [CLASS_HUNTER] = 2, [CLASS_ROGUE] = 1, [CLASS_SHAMAN] = 2, [CLASS_WARRIOR] = 1 },
        raids = { [RAID_ONYXIA] = true }
    },
    [18422] = {
        itemId = 18422,
        name = "Head of Onyxia",
        roles = { [ROLE_HEALER] = 3, [ROLE_CASTER_DPS] = 2, [ROLE_MELEE_DPS] = 1, [ROLE_RANGED_DPS] = 1, [ROLE_TANK] = 1 },
        classes = { [CLASS_WARRIOR] = 1, [CLASS_PALADIN] = 1, [CLASS_HUNTER] = 1, [CLASS_ROGUE] = 1, [CLASS_SHAMAN] = 1, [CLASS_DRUID] = 1,
            [CLASS_PRIEST] = 2, [CLASS_WARLOCK] = 2, [CLASS_MAGE] = 2 },
        raids = { [RAID_ONYXIA] = true }
    },
    [18705] = {
        itemId = 18705,
        name = "Mature Black Dragon Sinew",
        roles = { [ROLE_RANGED_DPS] = 1 },
        classes = { [CLASS_HUNTER] = 1 },
        raids = { [RAID_ONYXIA] = true }
    },
    [18813] = {
        itemId = 18813,
        name = "Ring of Binding",
        roles = { [ROLE_TANK] = 1 },
        classes = { [CLASS_WARRIOR] = 1, [CLASS_PALADIN] = 1, [CLASS_DRUID] = 1 },
        raids = { [RAID_ONYXIA] = true }
    },


    -- QUEST ITEMS
    [18608] = {
        itemId = 18608,
        name = "Benediction",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 18646 } -- The Eye of Divinity
    },
    [18609] = {
        itemId = 18609,
        name = "Anathema",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 18646 } -- The Eye of Divinity
    },
    [18713] = {
        itemId = 18713,
        name = "Rhok'delar, Longbow of the Ancient Keepers",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 18703, 18705 } -- Ancient Petrified Leaf, Mature Black Dragon Sinew
    },
    [18715] = {
        itemId = 18715,
        name = "Lok'delar, Stave of the Ancient Keepers",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 18703, 18705 } -- Ancient Petrified Leaf, Mature Black Dragon Sinew
    },
    [18403] = {
        itemId = 18403,
        name = "Dragonslayer's Signet",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 18422 } -- Head of Onyxia
    },
    [18404] = {
        itemId = 18404,
        name = "Onyxia Tooth Pendant",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 18422 } -- Head of Onyxia
    },
    [18406] = {
        itemId = 18406,
        name = "Onyxia Blood Talisman",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 18422 } -- Head of Onyxia
    },


-- BLACKWING LAIR
--    [19375] = {
--        itemId = 19375,
--        name = "Mish'undare, Circlet of the Mind Flayer",
--        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
--        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
--        raids = { [RAID_BLACKWING_LAIR] = true }
--    },
--    [19376] = {
--        itemId = 19376,
--        name = "Archimtiros' Ring of Reckoning",
--        roles = { [ROLE_MELEE_DPS] = true, [ROLE_RANGED_DPS] = true, [ROLE_TANK] = true },
--        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
--        raids = { [RAID_BLACKWING_LAIR] = true }
--    },
--    [19377] = {
--        itemId = 19377,
--        name = "Archimtiros' Ring of Reckoning",
--        roles = { [ROLE_MELEE_DPS] = true, [ROLE_RANGED_DPS] = true },
--        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
--        raids = { [RAID_BLACKWING_LAIR] = true }
--    },
--    [19378] = {
--        itemId = 19378,
--        name = "Cloak of the Brood Lord",
--        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
--        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
--        raids = { [RAID_BLACKWING_LAIR] = true }
--    },

-- for testing purposes

--    [2589] = {
--        itemId = 2589,
--        name = "Linen Cloth",
--        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
--        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
--        raids = { [RAID_MOLTEN_CORE] = true },
--        swallows = { 2592 }
--    },
--    [2592] = {
--        itemId = 2592,
--        name = "Wool Cloth",
--        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
--        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
--        raids = { [RAID_MOLTEN_CORE] = true }
--    }

}

-- creates Item's from the itemInfo above
for itemId, itemInfo in pairs(ITEM_LIST) do
    ITEM_LIST[itemId] = Item.fromInfo(itemInfo)
end

---
-- Contains utility methods for the items.
--
local Items = {}

---
-- Returns the item from the ITEM_LIST with the given localized name if present
-- or nil if no such item was found.
--
-- @param #string name
--          the name of the item to look for
--
-- @return #Item
--          the item with the given name
--
Items.forName = function(name)
    if (name) then
        for itemId, item in pairs(ITEM_LIST) do
            if (name == item:getName()) then
                return item
            end
        end
    end
end

---
-- Returns a list of Item's that are currently in the loot window.
--
-- @return #table
--          a list of Item's in the loot window
--
Items.getLootItems = function()
    local items = {}
    local lootCount = GetNumLootItems()
    for index = 1, lootCount do
        local lootIcon, lootName, lootQuantity, rarity, locked,
            isQuestItem, questId, isActive = GetLootSlotInfo(index)
        local item = Items.forName(lootName)
        if (item) then
            items[item.itemId] = item
        end
    end
    return items
end

Items.canRemove = function(playerItem, memberInfo)
    if (playerItem and memberInfo and
        playerItem.removable and
        memberInfo.needlist[playerItem.itemId]) then

        local found = 0
        for itemId, item in pairs(ITEM_LIST) do
            if (
                playerItem.itemId ~= itemId and
                item.removable and
                -- item slot should match
                playerItem.slot == item.slot and
                -- should be assigned to the class of the player
                item.classes[memberInfo.class] and
                -- additionally, the matching items should have a role intersection
                item:hasRole(playerItem.roles) and
                -- the item is already a higher tier
                item.tier >= playerItem.tier and
                -- the player doesn't have the item
                (not memberInfo.needlist[itemId])
                ) then

                found = found + 1
            end

            if (found >= playerItem.slotSize) then
                return true
            end
        end
    end
end

ns.Items = Items
ns.ITEM_LIST = ITEM_LIST
