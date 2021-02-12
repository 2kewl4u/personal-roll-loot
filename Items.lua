-- namespace
local _, ns = ...;
-- imports
local Item = ns.Item

-- constants
local ROLE_WARLOCK = "warlock"
local ROLE_MAGE = "mage"
local ROLE_HUNTER = "hunter"
local ROLE_ROGUE = "rogue"
local ROLE_FERAL_DRUID = "feral"
local ROLE_GUARDIAN_DRUID = "guardian"
local ROLE_BALANCE_DRUID = "balance"
local ROLE_RESTO_DRUID = "resto-druid"
local ROLE_HOLY_PRIEST = "holy-priest"
local ROLE_SHADOW_PRIEST = "shadow"
local ROLE_RESTO_SHAMAN = "resto-shaman"
local ROLE_ENHANCEMENT_SHAMAN = "enhancement"
local ROLE_ELEMENTAL_SHAMAN = "elemental"
local ROLE_HOLY_PALADIN = "holy-paladin"
local ROLE_RETRI_PALADIN = "retribution"
local ROLE_PROT_PALADIN = "prot-paladin"
local ROLE_PROT_WARRIOR = "prot-warrior"
local ROLE_ARMS_WARRIOR = "arms"

local CLASS_WARRIOR = "WARRIOR"
local CLASS_PALADIN = "PALADIN"
local CLASS_HUNTER = "HUNTER"
local CLASS_ROGUE = "ROGUE"
local CLASS_PRIEST = "PRIEST"
local CLASS_SHAMAN = "SHAMAN"
local CLASS_MAGE = "MAGE"
local CLASS_WARLOCK = "WARLOCK"
local CLASS_DRUID = "DRUID"

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

-- raids
local RAID_MOLTEN_CORE = "Molten Core"
local RAID_BLACKWING_LAIR = "Blackwing Lair"
local RAID_ONYXIA = "Onyxia's Lair"
local RAID_ZUL_GURUB = "Zul'Gurub"
local RAID_RUINS_AHN_QIRAJ = "Ruins of Ahn'Qiraj"
local RAID_AHN_QIRAJ_TEMPLE = "Ahn'Qiraj Temple"
local RAID_NAXXRAMAS = "Naxxramas"

-- the item list
local ITEM_LIST = {
    -- MOLTEN CORE
    [16795] = {
        itemId = 16795,
        name = "Arcanist Crown",
        roles = { [ROLE_MAGE] = 1 },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16796] = {
        itemId = 16796,
        name = "Arcanist Leggings",
        roles = { [ROLE_MAGE] = 1 },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16797] = {
        itemId = 16797,
        name = "Arcanist Mantle",
        roles = { [ROLE_MAGE] = 1 },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16798] = {
        itemId = 16798,
        name = "Arcanist Robes",
        roles = { [ROLE_MAGE] = 1 },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16799] = {
        itemId = 16799,
        name = "Arcanist Bindings",
        roles = { [ROLE_MAGE] = 1 },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16800] = {
        itemId = 16800,
        name = "Arcanist Boots",
        roles = { [ROLE_MAGE] = 1 },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16801] = {
        itemId = 16801,
        name = "Arcanist Gloves",
        roles = { [ROLE_MAGE] = 1 },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16802] = {
        itemId = 16802,
        name = "Arcanist Belt",
        roles = { [ROLE_MAGE] = 1 },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16803] = {
        itemId = 16803,
        name = "Felheart Slippers",
        roles = { [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16804] = {
        itemId = 16804,
        name = "Felheart Bracers",
        roles = { [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16805] = {
        itemId = 16805,
        name = "Felheart Gloves",
        roles = { [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16806] = {
        itemId = 16806,
        name = "Felheart Belt",
        roles = { [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16807] = {
        itemId = 16807,
        name = "Felheart Shoulder Pads",
        roles = { [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16808] = {
        itemId = 16808,
        name = "Felheart Horns",
        roles = { [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16809] = {
        itemId = 16809,
        name = "Felheart Robes",
        roles = { [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16810] = {
        itemId = 16810,
        name = "Felheart Pants",
        roles = { [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16811] = {
        itemId = 16811,
        name = "Boots of Prophecy",
        roles = { [ROLE_HOLY_PRIEST] = 1 },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16812] = {
        itemId = 16812,
        name = "Gloves of Prophecy",
        roles = { [ROLE_HOLY_PRIEST] = 1 },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16813] = {
        itemId = 16813,
        name = "Circlet of Prophecy",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_SHADOW_PRIEST] = 1 },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16814] = {
        itemId = 16814,
        name = "Pants of Prophecy",
        roles = { [ROLE_HOLY_PRIEST] = 1 },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16815] = {
        itemId = 16815,
        name = "Robes of Prophecy",
        roles = { [ROLE_HOLY_PRIEST] = 1 },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16816] = {
        itemId = 16816,
        name = "Mantle of Prophecy",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_SHADOW_PRIEST] = 1 },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16817] = {
        itemId = 16817,
        name = "Girdle of Prophecy",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_SHADOW_PRIEST] = 1 },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16819] = {
        itemId = 16819,
        name = "Vambraces of Prophecy",
        roles = { [ROLE_HOLY_PRIEST] = 1 },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16820] = {
        itemId = 16820,
        name = "Nightslayer Chestpiece",
        roles = { [ROLE_ROGUE] = 1 },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16821] = {
        itemId = 16821,
        name = "Nightslayer Cover",
        roles = { [ROLE_ROGUE] = 1 },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16822] = {
        itemId = 16822,
        name = "Nightslayer Pants",
        roles = { [ROLE_ROGUE] = 1 },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16823] = {
        itemId = 16823,
        name = "Nightslayer Shoulder Pads",
        roles = { [ROLE_ROGUE] = 1 },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16824] = {
        itemId = 16824,
        name = "Nightslayer Boots",
        roles = { [ROLE_ROGUE] = 1 },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16825] = {
        itemId = 16825,
        name = "Nightslayer Bracelets",
        roles = { [ROLE_ROGUE] = 1 },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16826] = {
        itemId = 16826,
        name = "Nightslayer Gloves",
        roles = { [ROLE_ROGUE] = 1 },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16827] = {
        itemId = 16827,
        name = "Nightslayer Belt",
        roles = { [ROLE_ROGUE] = 1 },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16828] = {
        itemId = 16828,
        name = "Cenarion Belt",
        roles = { [ROLE_BALANCE_DRUID] = 1, [ROLE_RESTO_DRUID] = 1 },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16829] = {
        itemId = 16829,
        name = "Cenarion Boots",
        roles = { [ROLE_RESTO_DRUID] = 1 },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16830] = {
        itemId = 16830,
        name = "Cenarion Bracers",
        roles = { [ROLE_BALANCE_DRUID] = 1, [ROLE_RESTO_DRUID] = 1 },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16831] = {
        itemId = 16831,
        name = "Cenarion Gloves",
        roles = { [ROLE_RESTO_DRUID] = 1 },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16833] = {
        itemId = 16833,
        name = "Cenarion Vestments",
        roles = { [ROLE_RESTO_DRUID] = 1 },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16834] = {
        itemId = 16834,
        name = "Cenarion Helm",
        roles = { [ROLE_RESTO_DRUID] = 1, [ROLE_BALANCE_DRUID] = 1 },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16835] = {
        itemId = 16835,
        name = "Cenarion Leggings",
        roles = { [ROLE_RESTO_DRUID] = 1 },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16836] = {
        itemId = 16836,
        name = "Cenarion Spaulders",
        roles = { [ROLE_RESTO_DRUID] = 1 },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16837] = {
        itemId = 16837,
        name = "Earthfury Boots",
        roles = { [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16838] = {
        itemId = 16838,
        name = "Earthfury Belt",
        roles = { [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16839] = {
        itemId = 16839,
        name = "Earthfury Gauntlets",
        roles = { [ROLE_RESTO_SHAMAN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16840] = {
        itemId = 16840,
        name = "Earthfury Bracers",
        roles = { [ROLE_RESTO_SHAMAN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16841] = {
        itemId = 16841,
        name = "Earthfury Vestments",
        roles = { [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16842] = {
        itemId = 16842,
        name = "Earthfury Helmet",
        roles = { [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16843] = {
        itemId = 16843,
        name = "Earthfury Legguards",
        roles = { [ROLE_RESTO_SHAMAN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16844] = {
        itemId = 16844,
        name = "Earthfury Epaulets",
        roles = { [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16845] = {
        itemId = 16845,
        name = "Giantstalker's Breastplate",
        roles = { [ROLE_HUNTER] = 1 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16846] = {
        itemId = 16846,
        name = "Giantstalker's Helmet",
        roles = { [ROLE_HUNTER] = 1 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16847] = {
        itemId = 16847,
        name = "Giantstalker's Leggings",
        roles = { [ROLE_HUNTER] = 1 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16848] = {
        itemId = 16848,
        name = "Giantstalker's Epaulets",
        roles = { [ROLE_HUNTER] = 1 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16849] = {
        itemId = 16849,
        name = "Giantstalker's Boots",
        roles = { [ROLE_HUNTER] = 1 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16850] = {
        itemId = 16850,
        name = "Giantstalker's Bracers",
        roles = { [ROLE_HUNTER] = 1 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16851] = {
        itemId = 16851,
        name = "Giantstalker's Belt",
        roles = { [ROLE_HUNTER] = 1 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16852] = {
        itemId = 16852,
        name = "Giantstalker's Gloves",
        roles = { [ROLE_HUNTER] = 1 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16853] = {
        itemId = 16853,
        name = "Lawbringer Chestguard",
        roles = { [ROLE_HOLY_PALADIN] = 1, [ROLE_RETRI_PALADIN] = 2, [ROLE_PROT_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16854] = {
        itemId = 16854,
        name = "Lawbringer Helm",
        roles = { [ROLE_HOLY_PALADIN] = 1, [ROLE_RETRI_PALADIN] = 2, [ROLE_PROT_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16855] = {
        itemId = 16855,
        name = "Lawbringer Legplates",
        roles = { [ROLE_HOLY_PALADIN] = 1, [ROLE_RETRI_PALADIN] = 2, [ROLE_PROT_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16856] = {
        itemId = 16856,
        name = "Lawbringer Spaulders",
        roles = { [ROLE_HOLY_PALADIN] = 1, [ROLE_RETRI_PALADIN] = 2, [ROLE_PROT_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16857] = {
        itemId = 16857,
        name = "Lawbringer Bracers",
        roles = { [ROLE_HOLY_PALADIN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_PROT_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16858] = {
        itemId = 16858,
        name = "Lawbringer Belt",
        roles = { [ROLE_HOLY_PALADIN] = 1, [ROLE_RETRI_PALADIN] = 2, [ROLE_PROT_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16859] = {
        itemId = 16859,
        name = "Lawbringer Boots",
        roles = { [ROLE_HOLY_PALADIN] = 1, [ROLE_RETRI_PALADIN] = 2, [ROLE_PROT_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16860] = {
        itemId = 16860,
        name = "Lawbringer Gauntlets",
        roles = { [ROLE_HOLY_PALADIN] = 1, [ROLE_RETRI_PALADIN] = 2, [ROLE_PROT_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16861] = {
        itemId = 16861,
        name = "Bracers of Might",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16862] = {
        itemId = 16862,
        name = "Sabatons of Might",
        roles = { [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16863] = {
        itemId = 16863,
        name = "Gauntlets of Might",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16864] = {
        itemId = 16864,
        name = "Belt of Might",
        roles = { [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16865] = {
        itemId = 16865,
        name = "Breastplate of Might",
        roles = { [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16866] = {
        itemId = 16866,
        name = "Helm of Might",
        roles = { [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16867] = {
        itemId = 16867,
        name = "Legplates of Might",
        roles = { [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16868] = {
        itemId = 16868,
        name = "Pauldrons of Might",
        roles = { [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [16901] = {
        itemId = 16901,
        name = "Stormrage Legguards",
        roles = { [ROLE_RESTO_DRUID] = 1 },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16909] = {
        itemId = 16909,
        name = "Bloodfang Pants",
        roles = { [ROLE_ROGUE] = 1 },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16915] = {
        itemId = 16915,
        name = "Netherwind Pants",
        roles = { [ROLE_MAGE] = 1 },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16922] = {
        itemId = 16922,
        name = "Leggings of Transcendence",
        roles = { [ROLE_HOLY_PRIEST] = 1 },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16930] = {
        itemId = 16930,
        name = "Nemesis Leggings",
        roles = { [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16938] = {
        itemId = 16938,
        name = "Dragonstalker's Legguards",
        roles = { [ROLE_HUNTER] = 1 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16946] = {
        itemId = 16946,
        name = "Legplates of Ten Storms",
        roles = { [ROLE_RESTO_SHAMAN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16954] = {
        itemId = 16954,
        name = "Judgement Legplates",
        roles = { [ROLE_HOLY_PALADIN] = 2, [ROLE_RETRI_PALADIN] = 1, [ROLE_PROT_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16962] = {
        itemId = 16962,
        name = "Legplates of Wrath",
        roles = { [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [17063] = {
        itemId = 17063,
        name = "Band of Accuria",
        roles = { [ROLE_ROGUE] = 1, [ROLE_HUNTER] = 1, [ROLE_ARMS_WARRIOR] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1,
            [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 1.5,
        replaceable = true,
        restricted = true
    },
    [17065] = {
        itemId = 17065,
        name = "Medallion of Steadfast Might",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_PROT_PALADIN] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [17066] = {
        itemId = 17066,
        name = "Drillborer Disk",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [17069] = {
        itemId = 17069,
        name = "Striker's Mark",
        roles = { [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 1, [ROLE_PROT_WARRIOR] = 3 },
        classes = { [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [17071] = {
        itemId = 17071,
        name = "Gutgore Ripper",
        roles = { [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 3 },
        classes = { [CLASS_ROGUE] = true, [CLASS_WARRIOR] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [17072] = {
        itemId = 17072,
        name = "Blastershot Launcher",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [17073] = {
        itemId = 17073,
        name = "Earthshaker",
        roles = { [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_FERAL_DRUID] = 2 },
        classes = { [CLASS_DRUID] = true, [CLASS_PALADIN] = true, [CLASS_WARRIOR] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [17074] = {
        itemId = 17074,
        name = "Shadowstrike",
        roles = { [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 3 },
        classes = { [CLASS_PALADIN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [17076] = {
        itemId = 17076,
        name = "Bonereaver's Edge",
        roles = { [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [17077] = {
        itemId = 17077,
        name = "Crimson Shocker",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [17082] = {
        itemId = 17082,
        name = "Shard of the Flame",
        roles = { [ROLE_PROT_WARRIOR] = 4, [ROLE_ARMS_WARRIOR] = 5, [ROLE_HOLY_PALADIN] = 3, [ROLE_PROT_PALADIN] = 4, [ROLE_RESTO_SHAMAN] = 3,
            [ROLE_ENHANCEMENT_SHAMAN] = 4, [ROLE_ELEMENTAL_SHAMAN] = 4, [ROLE_RESTO_DRUID] = 3, [ROLE_BALANCE_DRUID] = 4, [ROLE_GUARDIAN_DRUID] = 3,
            [ROLE_FERAL_DRUID] = 4, [ROLE_HOLY_PRIEST] = 3, [ROLE_SHADOW_PRIEST] = 3, [ROLE_WARLOCK] = 4, [ROLE_MAGE] = 4 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true,
            [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [17102] = {
        itemId = 17102,
        name = "Cloak of the Shrouded Mists",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 3,
            [ROLE_RETRI_PALADIN] = 2, [ROLE_FERAL_DRUID] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [17103] = {
        itemId = 17103,
        name = "Azuresong Mageblade",
        roles = { [ROLE_HOLY_PALADIN] = 2, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1, [ROLE_PROT_PALADIN] = 3 },
        classes = { [CLASS_MAGE] = true, [CLASS_WARLOCK] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [17104] = {
        itemId = 17104,
        name = "Spinal Reaper",
        roles = { [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_PALADIN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [17105] = {
        itemId = 17105,
        name = "Aurastone Hammer",
        roles = { [ROLE_RESTO_DRUID] = 1, [ROLE_RESTO_SHAMAN] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1,
            [ROLE_HOLY_PRIEST] = 3, [ROLE_SHADOW_PRIEST] = 2 },
        classes = { [CLASS_DRUID] = true, [CLASS_SHAMAN] = true, [CLASS_PALADIN] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [17106] = {
        itemId = 17106,
        name = "Malistar's Defender",
        roles = { [ROLE_RESTO_SHAMAN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_HOLY_PALADIN] = 1, [ROLE_PROT_PALADIN] = 3 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [17107] = {
        itemId = 17107,
        name = "Dragon's Blood Cape",
        roles = { [ROLE_ARMS_WARRIOR] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_PROT_PALADIN] = 2,
            [ROLE_FERAL_DRUID] = 1, [ROLE_GUARDIAN_DRUID] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 1.5,
        replaceable = true
    },
    [17109] = {
        itemId = 17109,
        name = "Choker of Enlightenment",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_WARLOCK] = 2, [ROLE_MAGE] = 2, [ROLE_RESTO_DRUID] = 1,
            [ROLE_BALANCE_DRUID] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_RESTO_SHAMAN] = 2, [ROLE_HOLY_PALADIN] = 3 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [17110] = {
        itemId = 17110,
        name = "Seal of the Archmagus",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 2, [ROLE_WARLOCK] = 2, [ROLE_BALANCE_DRUID] = 2,
            [ROLE_RESTO_DRUID] = 1, [ROLE_RESTO_SHAMAN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_HOLY_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 1,
        replaceable = true
    },
    [17204] = {
        itemId = 17204,
        name = "Eye of Sulfuras",
        roles = { [ROLE_RETRI_PALADIN] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [18203] = {
        itemId = 18203,
        name = "Eskhandar's Right Claw",
        roles = { [ROLE_HUNTER] = 4, [ROLE_ROGUE] = 3, [ROLE_PROT_WARRIOR] = 4, [ROLE_ARMS_WARRIOR] = 3, [ROLE_ENHANCEMENT_SHAMAN] = 3 },
        classes = { [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [18564] = {
        itemId = 18564,
        name = "Bindings of the Windseeker",
        roles = { [ROLE_ROGUE] = 2, [ROLE_ARMS_WARRIOR] = 2, [ROLE_PROT_WARRIOR] = 1, [ROLE_PROT_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [18646] = {
        itemId = 18646,
        name = "The Eye of Divinity",
        roles = { [ROLE_SHADOW_PRIEST] = 1, [ROLE_HOLY_PRIEST] = 1 },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [18703] = {
        itemId = 18703,
        name = "Ancient Petrified Leaf",
        roles = { [ROLE_HUNTER] = 1 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [18803] = {
        itemId = 18803,
        name = "Finkle's Lava Dredger",
        roles = { [ROLE_RESTO_DRUID] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2,
            [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3 },
        classes = { [CLASS_DRUID] = true, [CLASS_SHAMAN] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [18805] = {
        itemId = 18805,
        name = "Core Hound Tooth",
        roles = { [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 2, [ROLE_HUNTER] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true, [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [18806] = {
        itemId = 18806,
        name = "Core Forged Greaves",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        replaceable = false
    },
    [18808] = {
        itemId = 18808,
        name = "Gloves of the Hypnotic Flame",
        roles = { [ROLE_WARLOCK] = 2, [ROLE_MAGE] = 2 },
        classes = { [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [18809] = {
        itemId = 18809,
        name = "Sash of Whispered Secrets",
        roles = { [ROLE_SHADOW_PRIEST] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_WARLOCK] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [18810] = {
        itemId = 18810,
        name = "Wild Growth Spaulders",
        roles = { [ROLE_RESTO_DRUID] = 1, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_DRUID] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [18811] = {
        itemId = 18811,
        name = "Fireproof Cloak",
        roles = { [ROLE_HOLY_PALADIN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_RESTO_SHAMAN] = 2, [ROLE_RESTO_DRUID] = 2, [ROLE_BALANCE_DRUID] = 2,
            [ROLE_HOLY_PRIEST] = 2, [ROLE_SHADOW_PRIEST] = 2, [ROLE_WARLOCK] = 2, [ROLE_MAGE] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 1,
        replaceable = false
    },
    [18812] = {
        itemId = 18812,
        name = "Wristguards of True Flight",
        roles = { [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_HUNTER] = 1, [ROLE_RETRI_PALADIN] = 2 },
        classes = { [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [18814] = {
        itemId = 18814,
        name = "Choker of the Fire Lord",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1,
            [ROLE_HOLY_PALADIN] = 2, [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        restricted = true
    },
    [18815] = {
        itemId = 18815,
        name = "Essence of the Pure Flame",
        roles = { [ROLE_PROT_WARRIOR] = 3, [ROLE_RETRI_PALADIN] = 3, [ROLE_PROT_PALADIN] = 3, [ROLE_HOLY_PALADIN] = 4, [ROLE_RESTO_SHAMAN] = 4,
            [ROLE_ELEMENTAL_SHAMAN] = 4, [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_RESTO_DRUID] = 4, [ROLE_BALANCE_DRUID] = 4, [ROLE_FERAL_DRUID] = 3,
            [ROLE_GUARDIAN_DRUID] = 3, [ROLE_SHADOW_PRIEST] = 4, [ROLE_ARMS_WARRIOR] = 4 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [18816] = {
        itemId = 18816,
        name = "Perdition's Blade",
        roles = { [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_ROGUE] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 1.5,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [18817] = {
        itemId = 18817,
        name = "Crown of Destruction",
        roles = { [ROLE_HUNTER] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1 },
        classes = { [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1.5,
        replaceable = true
    },
    [18820] = {
        itemId = 18820,
        name = "Talisman of Ephemeral Power",
        roles = { [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_HOLY_PRIEST] = 2, [ROLE_BALANCE_DRUID] = 1,
            [ROLE_RESTO_DRUID] = 2, [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_RESTO_SHAMAN] = 2, [ROLE_HOLY_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [18821] = {
        itemId = 18821,
        name = "Quick Strike Ring",
        roles = { [ROLE_HUNTER] = 2, [ROLE_ARMS_WARRIOR] = 1, [ROLE_ROGUE] = 2, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1,
            [ROLE_RETRI_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_ROGUE] = true, [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 1,
        replaceable = true
    },
    [18822] = {
        itemId = 18822,
        name = "Obsidian Edged Blade",
        roles = { [ROLE_ARMS_WARRIOR] = 1, [ROLE_RETRI_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [18823] = {
        itemId = 18823,
        name = "Aged Core Leather Gloves",
        roles = { [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 3, [ROLE_ARMS_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 3, [ROLE_ENHANCEMENT_SHAMAN] = 3 },
        classes = { [CLASS_ROGUE] = true, [CLASS_DRUID] = true, [CLASS_SHAMAN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [18824] = {
        itemId = 18824,
        name = "Magma Tempered Boots",
        roles = { [ROLE_HOLY_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [18829] = {
        itemId = 18829,
        name = "Deep Earth Spaulders",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 2 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [18832] = {
        itemId = 18832,
        name = "Brutality Blade",
        roles = { [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 1, [ROLE_PROT_PALADIN] = 2, [ROLE_RETRI_PALADIN] = 3 },
        classes = { [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_PALADIN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [18842] = {
        itemId = 18842,
        name = "Staff of Dominance",
        roles = { [ROLE_RESTO_DRUID] = 2, [ROLE_BALANCE_DRUID] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1, [ROLE_ELEMENTAL_SHAMAN] = 2,
            [ROLE_RESTO_SHAMAN] = 3 },
        classes = { [CLASS_DRUID] = true, [CLASS_MAGE] = true, [CLASS_SHAMAN] = true, [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [18861] = {
        itemId = 18861,
        name = "Flamewaker Legplates",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [18870] = {
        itemId = 18870,
        name = "Helm of the Lifegiver",
        roles = { [ROLE_RESTO_SHAMAN] = 1, [ROLE_HOLY_PALADIN] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [18872] = {
        itemId = 18872,
        name = "Manastorm Leggings",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_SHADOW_PRIEST] = 2, [ROLE_MAGE] = 3, [ROLE_WARLOCK] = 3, [ROLE_RESTO_DRUID] = 2,
            [ROLE_BALANCE_DRUID] = 2, [ROLE_RESTO_SHAMAN] = 3, [ROLE_HOLY_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_MAGE] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [18875] = {
        itemId = 18875,
        name = "Salamander Scale Pants",
        roles = { [ROLE_RESTO_DRUID] = 1, [ROLE_RESTO_SHAMAN] = 2, [ROLE_HOLY_PALADIN] = 2 },
        classes = { [CLASS_DRUID] = true, [CLASS_SHAMAN] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [18878] = {
        itemId = 18878,
        name = "Sorcerous Dagger",
        roles = { [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1, [ROLE_SHADOW_PRIEST] = 2, [ROLE_RESTO_SHAMAN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 1,
            [ROLE_BALANCE_DRUID] = 1, [ROLE_RESTO_DRUID] = 2 },
        classes = { [CLASS_DRUID] = true, [CLASS_MAGE] = true, [CLASS_PRIEST] = true, [CLASS_SHAMAN] = true, [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [18879] = {
        itemId = 18879,
        name = "Heavy Dark Iron Ring",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_DRUID] = true, [CLASS_PALADIN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 1,
        replaceable = true
    },
    [19136] = {
        itemId = 19136,
        name = "Mana Igniting Cord",
        roles = { [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_HOLY_PRIEST] = 2, [ROLE_BALANCE_DRUID] = 2,
            [ROLE_RESTO_DRUID] = 3, [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_PALADIN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_MAGE] = true, [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [19137] = {
        itemId = 19137,
        name = "Onslaught Girdle",
        roles = { [ROLE_ARMS_WARRIOR] = 1, [ROLE_RETRI_PALADIN] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1.5,
        replaceable = true
    },
    [19138] = {
        itemId = 19138,
        name = "Band of Sulfuras",
        roles = { [ROLE_MAGE] = 2, [ROLE_WARLOCK] = 2, [ROLE_HOLY_PRIEST] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1,
            [ROLE_BALANCE_DRUID] = 2, [ROLE_RESTO_SHAMAN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_HOLY_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 1,
        replaceable = true
    },
    [19139] = {
        itemId = 19139,
        name = "Fireguard Shoulders",
        roles = { [ROLE_ROGUE] = 3, [ROLE_FERAL_DRUID] = 3, [ROLE_GUARDIAN_DRUID] = 2, [ROLE_RESTO_DRUID] = 4, [ROLE_BALANCE_DRUID] = 4,
            [ROLE_ENHANCEMENT_SHAMAN] = 4, [ROLE_PROT_WARRIOR] = 4 },
        classes = { [CLASS_DRUID] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1,
        replaceable = false
    },
    [19140] = {
        itemId = 19140,
        name = "Cauterizing Band",
        roles = { [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PRIEST] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        restricted = true
    },
    [19142] = {
        itemId = 19142,
        name = "Fire Runed Grimoire",
        roles = { [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1, [ROLE_SHADOW_PRIEST] = 2, [ROLE_HOLY_PRIEST] = 3, [ROLE_BALANCE_DRUID] = 1,
            [ROLE_RESTO_DRUID] = 2, [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_RESTO_SHAMAN] = 3, [ROLE_HOLY_PALADIN] = 3 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19143] = {
        itemId = 19143,
        name = "Flameguard Gauntlets",
        roles = { [ROLE_ARMS_WARRIOR] = 1, [ROLE_RETRI_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [19144] = {
        itemId = 19144,
        name = "Sabatons of the Flamewalker",
        roles = { [ROLE_HUNTER] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [19145] = {
        itemId = 19145,
        name = "Robe of Volatile Power",
        roles = { [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1, [ROLE_SHADOW_PRIEST] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_ELEMENTAL_SHAMAN] = 2 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [19146] = {
        itemId = 19146,
        name = "Wristguards of Stability",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_DRUID] = true, [CLASS_SHAMAN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [19147] = {
        itemId = 19147,
        name = "Ring of Spell Power",
        roles = { [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 1,
        replaceable = true
    },


    -- ONYXIA
    [16900] = {
        itemId = 16900,
        name = "Stormrage Cover",
        roles = { [ROLE_RESTO_DRUID] = 1 },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_ONYXIA] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16908] = {
        itemId = 16908,
        name = "Bloodfang Hood",
        roles = { [ROLE_ROGUE] = 1 },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_ONYXIA] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16914] = {
        itemId = 16914,
        name = "Netherwind Crown",
        roles = { [ROLE_MAGE] = 1 },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_ONYXIA] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16921] = {
        itemId = 16921,
        name = "Halo of Transcendence",
        roles = { [ROLE_HOLY_PRIEST] = 1 },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_ONYXIA] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16929] = {
        itemId = 16929,
        name = "Nemesis Skullcap",
        roles = { [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_ONYXIA] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16939] = {
        itemId = 16939,
        name = "Dragonstalker's Helm",
        roles = { [ROLE_HUNTER] = 1 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_ONYXIA] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16947] = {
        itemId = 16947,
        name = "Helmet of Ten Storms",
        roles = { [ROLE_RESTO_SHAMAN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 2 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_ONYXIA] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16955] = {
        itemId = 16955,
        name = "Judgement Crown",
        roles = { [ROLE_RETRI_PALADIN] = 1, [ROLE_HOLY_PALADIN] = 2, [ROLE_PROT_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_ONYXIA] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16963] = {
        itemId = 16963,
        name = "Helm of Wrath",
        roles = { [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_ONYXIA] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [17064] = {
        itemId = 17064,
        name = "Shard of the Scale",
        roles = { [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_RESTO_DRUID] = 1, [ROLE_BALANCE_DRUID] = 2,
            [ROLE_HOLY_PRIEST] = 1, [ROLE_SHADOW_PRIEST] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_ONYXIA] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 1,
        replaceable = true
    },
    [17067] = {
        itemId = 17067,
        name = "Ancient Cornerstone Grimoire",
        roles = { [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1, [ROLE_HOLY_PRIEST] = 2, [ROLE_SHADOW_PRIEST] = 2, [ROLE_BALANCE_DRUID] = 1,
            [ROLE_RESTO_DRUID] = 1, [ROLE_RESTO_SHAMAN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_HOLY_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ONYXIA] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [17068] = {
        itemId = 17068,
        name = "Deathbringer",
        roles = { [ROLE_ARMS_WARRIOR] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_PROT_PALADIN] = 2, [ROLE_RETRI_PALADIN] = 3 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_ONYXIA] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [17075] = {
        itemId = 17075,
        name = "Vis'kag the Bloodletter",
        roles = { [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 1, [ROLE_PROT_PALADIN] = 2 },
        classes = { [CLASS_ROGUE] = true, [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_ONYXIA] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [17078] = {
        itemId = 17078,
        name = "Sapphiron Drape",
        roles = { [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ONYXIA] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [18205] = {
        itemId = 18205,
        name = "Eskhandar's Collar",
        roles = { [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_PROT_WARRIOR] = 2 },
        classes = { [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_ONYXIA] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 1,
        replaceable = true
    },
    [18422] = {
        itemId = 18422,
        name = "Head of Onyxia",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 1, [ROLE_HOLY_PRIEST] = 3,
            [ROLE_RESTO_DRUID] = 3, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 3, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 3,
            [ROLE_MAGE] = 2, [ROLE_WARLOCK] = 2, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ONYXIA] = true },
        removable = true
    },
    [18705] = {
        itemId = 18705,
        name = "Mature Black Dragon Sinew",
        roles = { [ROLE_HUNTER] = 1 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_ONYXIA] = true }
    },
    [18813] = {
        itemId = 18813,
        name = "Ring of Binding",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_ONYXIA] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 1,
        replaceable = true
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
    [16897] = {
        itemId = 16897,
        name = "Stormrage Chestguard",
        roles = { [ROLE_RESTO_DRUID] = 1 },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16898] = {
        itemId = 16898,
        name = "Stormrage Boots",
        roles = { [ROLE_RESTO_DRUID] = 1 },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16899] = {
        itemId = 16899,
        name = "Stormrage Handguards",
        roles = { [ROLE_RESTO_DRUID] = 1 },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16902] = {
        itemId = 16902,
        name = "Stormrage Pauldrons",
        roles = { [ROLE_RESTO_DRUID] = 1 },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16903] = {
        itemId = 16903,
        name = "Stormrage Belt",
        roles = { [ROLE_RESTO_DRUID] = 1 },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16904] = {
        itemId = 16904,
        name = "Stormrage Bracers",
        roles = { [ROLE_RESTO_DRUID] = 1 },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16832] = {
        itemId = 16832,
        name = "Bloodfang Spaulders",
        roles = { [ROLE_ROGUE] = 1 },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16905] = {
        itemId = 16905,
        name = "Bloodfang Chestpiece",
        roles = { [ROLE_ROGUE] = 1 },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16906] = {
        itemId = 16906,
        name = "Bloodfang Boots",
        roles = { [ROLE_ROGUE] = 1 },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16907] = {
        itemId = 16907,
        name = "Bloodfang Gloves",
        roles = { [ROLE_ROGUE] = 1 },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16910] = {
        itemId = 16910,
        name = "Bloodfang Belt",
        roles = { [ROLE_ROGUE] = 1 },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16911] = {
        itemId = 16911,
        name = "Bloodfang Bracers",
        roles = { [ROLE_ROGUE] = 1 },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16818] = {
        itemId = 16818,
        name = "Netherwind Belt",
        roles = { [ROLE_MAGE] = 1 },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16912] = {
        itemId = 16912,
        name = "Netherwind Boots",
        roles = { [ROLE_MAGE] = 1 },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16913] = {
        itemId = 16913,
        name = "Netherwind Gloves",
        roles = { [ROLE_MAGE] = 1 },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16916] = {
        itemId = 16916,
        name = "Netherwind Robes",
        roles = { [ROLE_MAGE] = 1 },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16917] = {
        itemId = 16917,
        name = "Netherwind Mantle",
        roles = { [ROLE_MAGE] = 1 },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16918] = {
        itemId = 16918,
        name = "Netherwind Bindings",
        roles = { [ROLE_MAGE] = 1 },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16919] = {
        itemId = 16919,
        name = "Boots of Transcendence",
        roles = { [ROLE_HOLY_PRIEST] = 1 },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16920] = {
        itemId = 16920,
        name = "Handguards of Transcendence",
        roles = { [ROLE_HOLY_PRIEST] = 1 },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16923] = {
        itemId = 16923,
        name = "Robes of Transcendence",
        roles = { [ROLE_HOLY_PRIEST] = 1 },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16924] = {
        itemId = 16924,
        name = "Pauldrons of Transcendence",
        roles = { [ROLE_HOLY_PRIEST] = 1 },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16925] = {
        itemId = 16925,
        name = "Belt of Transcendence",
        roles = { [ROLE_HOLY_PRIEST] = 1 },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16926] = {
        itemId = 16926,
        name = "Bindings of Transcendence",
        roles = { [ROLE_HOLY_PRIEST] = 1 },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16927] = {
        itemId = 16927,
        name = "Nemesis Boots",
        roles = { [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16928] = {
        itemId = 16928,
        name = "Nemesis Gloves",
        roles = { [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16931] = {
        itemId = 16931,
        name = "Nemesis Robes",
        roles = { [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16932] = {
        itemId = 16932,
        name = "Nemesis Spaulders",
        roles = { [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16933] = {
        itemId = 16933,
        name = "Nemesis Belt",
        roles = { [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16934] = {
        itemId = 16934,
        name = "Nemesis Bracers",
        roles = { [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16935] = {
        itemId = 16935,
        name = "Dragonstalker's Bracers",
        roles = { [ROLE_HUNTER] = 1 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16936] = {
        itemId = 16936,
        name = "Dragonstalker's Belt",
        roles = { [ROLE_HUNTER] = 1 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16937] = {
        itemId = 16937,
        name = "Dragonstalker's Spaulders",
        roles = { [ROLE_HUNTER] = 1 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16940] = {
        itemId = 16940,
        name = "Dragonstalker's Gauntlets",
        roles = { [ROLE_HUNTER] = 1 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16941] = {
        itemId = 16941,
        name = "Dragonstalker's Greaves",
        roles = { [ROLE_HUNTER] = 1 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16942] = {
        itemId = 16942,
        name = "Dragonstalker's Breastplate",
        roles = { [ROLE_HUNTER] = 1 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16943] = {
        itemId = 16943,
        name = "Bracers of Ten Storms",
        roles = { [ROLE_RESTO_SHAMAN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 2 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16944] = {
        itemId = 16944,
        name = "Belt of Ten Storms",
        roles = { [ROLE_RESTO_SHAMAN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 2 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16945] = {
        itemId = 16945,
        name = "Epaulets of Ten Storms",
        roles = { [ROLE_RESTO_SHAMAN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16948] = {
        itemId = 16948,
        name = "Gauntlets of Ten Storms",
        roles = { [ROLE_RESTO_SHAMAN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 2 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16949] = {
        itemId = 16949,
        name = "Greaves of Ten Storms",
        roles = { [ROLE_RESTO_SHAMAN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16950] = {
        itemId = 16950,
        name = "Breastplate of Ten Storms",
        roles = { [ROLE_RESTO_SHAMAN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16951] = {
        itemId = 16951,
        name = "Judgement Bindings",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_HOLY_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16952] = {
        itemId = 16952,
        name = "Judgement Belt",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_HOLY_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16953] = {
        itemId = 16953,
        name = "Judgement Spaulders",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_HOLY_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16956] = {
        itemId = 16956,
        name = "Judgement Gauntlets",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_HOLY_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16957] = {
        itemId = 16957,
        name = "Judgement Sabatons",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_HOLY_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16958] = {
        itemId = 16958,
        name = "Judgement Breastplate",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_HOLY_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16959] = {
        itemId = 16959,
        name = "Bracelets of Wrath",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16960] = {
        itemId = 16960,
        name = "Waistband of Wrath",
        roles = { [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16961] = {
        itemId = 16961,
        name = "Pauldrons of Wrath",
        roles = { [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16964] = {
        itemId = 16964,
        name = "Gauntlets of Wrath",
        roles = { [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16965] = {
        itemId = 16965,
        name = "Sabatons of Wrath",
        roles = { [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [16966] = {
        itemId = 16966,
        name = "Breastplate of Wrath",
        roles = { [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [19334] = {
        itemId = 19334,
        name = "The Untamed Blade",
        roles = { [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 2,
        replaceable = true,
        removable = true
    },
    [19335] = {
        itemId = 19335,
        name = "Spineshatter",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_ROGUE] = 2, [ROLE_FERAL_DRUID] = 2,
            [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 2,
        replaceable = true,
        removable = true
    },
    [19336] = {
        itemId = 19336,
        name = "Arcane Infused Gem",
        roles = { [ROLE_HUNTER] = 1 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 2,
        replaceable = true
    },
    [19337] = {
        itemId = 19337,
        name = "The Black Book",
        roles = { [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 2,
        replaceable = true
    },
    [19339] = {
        itemId = 19339,
        name = "Mind Quickening Gem",
        roles = { [ROLE_MAGE] = 1 },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 2,
        replaceable = true
    },
    [19340] = {
        itemId = 19340,
        name = "Rune of Metamorphosis",
        roles = { [ROLE_BALANCE_DRUID] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_RESTO_DRUID] = 1 },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 2,
        replaceable = true
    },
    [19341] = {
        itemId = 19341,
        name = "Lifegiving Gem",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 2,
        replaceable = true,
        restricted = true
    },
    [19342] = {
        itemId = 19342,
        name = "Venomous Totem",
        roles = { [ROLE_ROGUE] = 1 },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 2,
        replaceable = true
    },
    [19343] = {
        itemId = 19343,
        name = "Scrolls of Blinding Light",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_RETRI_PALADIN] = 1, [ROLE_HOLY_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 2,
        replaceable = true
    },
    [19344] = {
        itemId = 19344,
        name = "Natural Alignment Crystal",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 2,
        replaceable = true
    },
    [19345] = {
        itemId = 19345,
        name = "Aegis of Preservation",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_SHADOW_PRIEST] = 2 },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 2,
        replaceable = true
    },
    [19346] = {
        itemId = 19346,
        name = "Dragonfang Blade",
        roles = { [ROLE_HUNTER] = 3, [ROLE_ROGUE] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 2,
        replaceable = true,
        removable = true
    },
    [19347] = {
        itemId = 19347,
        name = "Claw of Chromaggus",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 1, [ROLE_RESTO_SHAMAN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 2,
        replaceable = true,
        removable = true
    },
    [19348] = {
        itemId = 19348,
        name = "Red Dragonscale Protector",
        roles = { [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 2,
        replaceable = true,
        removable = true
    },
    [19349] = {
        itemId = 19349,
        name = "Elementium Reinforced Bulwark",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 2,
        replaceable = true,
        removable = true
    },
    [19350] = {
        itemId = 19350,
        name = "Heartstriker",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 2,
        replaceable = true,
        removable = true
    },
    [19351] = {
        itemId = 19351,
        name = "Maladath, Runed Blade of the Black Flight",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 2,
        replaceable = true,
        removable = true
    },
    [19352] = {
        itemId = 19352,
        name = "Chromatically Tempered Sword",
        roles = { [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 2,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [19353] = {
        itemId = 19353,
        name = "Drake Talon Cleaver",
        roles = { [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 2,
        replaceable = true,
        removable = true
    },
    [19354] = {
        itemId = 19354,
        name = "Draconic Avenger",
        roles = { [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 2,
        replaceable = true,
        removable = true
    },
    [19355] = {
        itemId = 19355,
        name = "Shadow Wing Focus Staff",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_RESTO_SHAMAN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 2,
        replaceable = true,
        removable = true
    },
    [19356] = {
        itemId = 19356,
        name = "Staff of the Shadow Flame",
        roles = { [ROLE_HOLY_PRIEST] = 3, [ROLE_RESTO_DRUID] = 2, [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 2, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [19357] = {
        itemId = 19357,
        name = "Herald of Woe",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 2,
        replaceable = true,
        removable = true
    },
    [19358] = {
        itemId = 19358,
        name = "Draconic Maul",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 2,
        replaceable = true,
        removable = true
    },
    [19360] = {
        itemId = 19360,
        name = "Lok'amir il Romathis",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1,
            [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [19361] = {
        itemId = 19361,
        name = "Ashjre'thul, Crossbow of Smiting",
        roles = { [ROLE_HUNTER] = 1 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 2,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [19362] = {
        itemId = 19362,
        name = "Doom's Edge",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_PROT_WARRIOR] = 3, [ROLE_HUNTER] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 4, [ROLE_RETRI_PALADIN] = 4, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 2,
        replaceable = true,
        removable = true
    },
    [19363] = {
        itemId = 19363,
        name = "Crul'shorukh, Edge of Chaos",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_PROT_WARRIOR] = 3, [ROLE_HUNTER] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 2.5,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [19364] = {
        itemId = 19364,
        name = "Ashkandi, Greatsword of the Brotherhood",
        roles = { [ROLE_HUNTER] = 2, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [19365] = {
        itemId = 19365,
        name = "Claw of the Black Drake",
        roles = { [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 2,
        replaceable = true,
        removable = true
    },
    [19367] = {
        itemId = 19367,
        name = "Dragon's Touch",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 2,
        replaceable = true,
        removable = true
    },
    [19368] = {
        itemId = 19368,
        name = "Dragonbreath Hand Cannon",
        roles = { [ROLE_PROT_WARRIOR] = 2, [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 3, [ROLE_ARMS_WARRIOR] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 2,
        replaceable = true,
        removable = true
    },
    [19369] = {
        itemId = 19369,
        name = "Gloves of Rapid Evolution",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1 },
        classes = { [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2,
        replaceable = true,
        removable = false
    },
    [19370] = {
        itemId = 19370,
        name = "Mantle of the Blackwing Cabal",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 2, [ROLE_ELEMENTAL_SHAMAN] = 3, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 2,
        replaceable = true,
        removable = false
    },
    [19371] = {
        itemId = 19371,
        name = "Pendant of the Fallen Dragon",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 2,
        replaceable = true,
        removable = false
    },
    [19372] = {
        itemId = 19372,
        name = "Helm of Endless Rage",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_RETRI_PALADIN] = 2, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 2,
        replaceable = true,
        removable = false
    },
    [19373] = {
        itemId = 19373,
        name = "Black Brood Pauldrons",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_HUNTER] = 2, [ROLE_RESTO_SHAMAN] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 3, [ROLE_HOLY_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [19374] = {
        itemId = 19374,
        name = "Bracers of Arcane Accuracy",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 3, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3, [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [19375] = {
        itemId = 19375,
        name = "Mish'undare, Circlet of the Mind Flayer",
        roles = { [ROLE_HOLY_PRIEST] = 3, [ROLE_HOLY_PALADIN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 2,
        replaceable = true,
        restricted = true
    },
    [19376] = {
        itemId = 19376,
        name = "Archimtiros' Ring of Reckoning",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 2,
        replaceable = true
    },
    [19377] = {
        itemId = 19377,
        name = "Prestor's Talisman of Connivery",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [19378] = {
        itemId = 19378,
        name = "Cloak of the Brood Lord",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 3, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3, [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2,
            [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [19379] = {
        itemId = 19379,
        name = "Neltharion's Tear",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 2.5,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [19380] = {
        itemId = 19380,
        name = "Therazane's Link",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [19381] = {
        itemId = 19381,
        name = "Boots of the Shadow Flame",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [19382] = {
        itemId = 19382,
        name = "Pure Elementium Band",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 2,
        replaceable = true,
        restricted = true
    },
    [19385] = {
        itemId = 19385,
        name = "Empowered Leggings",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [19386] = {
        itemId = 19386,
        name = "Elementium Threaded Cloak",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 2, [ROLE_FERAL_DRUID] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_DRUID] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [19387] = {
        itemId = 19387,
        name = "Chromatic Boots",
        roles = { [ROLE_PROT_WARRIOR] = 2, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [19388] = {
        itemId = 19388,
        name = "Angelista's Grasp",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 2,
        replaceable = true,
        restricted = true
    },
    [19389] = {
        itemId = 19389,
        name = "Taut Dragonhide Shoulderpads",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 2 },
        classes = { [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [19390] = {
        itemId = 19390,
        name = "Taut Dragonhide Gloves",
        roles = { [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 3, [ROLE_BALANCE_DRUID] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [19391] = {
        itemId = 19391,
        name = "Shimmering Geta",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [19392] = {
        itemId = 19392,
        name = "Girdle of the Fallen Crusader",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [19393] = {
        itemId = 19393,
        name = "Primalist's Linked Waistguard",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [19394] = {
        itemId = 19394,
        name = "Drake Talon Pauldrons",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [19395] = {
        itemId = 19395,
        name = "Rejuvenating Gem",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 2,
        replaceable = true,
        restricted = true
    },
    [19396] = {
        itemId = 19396,
        name = "Taut Dragonhide Belt",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [19397] = {
        itemId = 19397,
        name = "Ring of Blackrock",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 2, [ROLE_WARLOCK] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 2,
        replaceable = true
    },
    [19398] = {
        itemId = 19398,
        name = "Cloak of Firemaw",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [19399] = {
        itemId = 19399,
        name = "Black Ash Robe",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 3, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3, [ROLE_ELEMENTAL_SHAMAN] = 3, [ROLE_BALANCE_DRUID] = 3, [ROLE_SHADOW_PRIEST] = 2,
            [ROLE_MAGE] = 2, [ROLE_WARLOCK] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 2,
        replaceable = false
    },
    [19400] = {
        itemId = 19400,
        name = "Firemaw's Clutch",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 2, [ROLE_WARLOCK] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [19401] = {
        itemId = 19401,
        name = "Primalist's Linked Legguards",
        roles = { [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 3, [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [19402] = {
        itemId = 19402,
        name = "Legguards of the Fallen Crusader",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 2, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [19403] = {
        itemId = 19403,
        name = "Band of Forced Concentration",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1,
            [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 2,
        replaceable = true
    },
    [19405] = {
        itemId = 19405,
        name = "Malfurion's Blessed Bulwark",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_ROGUE] = 2, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [19406] = {
        itemId = 19406,
        name = "Drake Fang Talisman",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 2,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [19407] = {
        itemId = 19407,
        name = "Ebony Flame Gloves",
        roles = { [ROLE_SHADOW_PRIEST] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2,
        replaceable = true
    },
    [19430] = {
        itemId = 19430,
        name = "Shroud of Pure Thought",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 2,
        replaceable = true,
        restricted = true
    },
    [19431] = {
        itemId = 19431,
        name = "Styleen's Impeding Scarab",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 2,
        replaceable = true,
        removable = true
    },
    [19432] = {
        itemId = 19432,
        name = "Circle of Applied Force",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 2,
        replaceable = true
    },
    [19433] = {
        itemId = 19433,
        name = "Emberweave Leggings",
        roles = { [ROLE_HUNTER] = 2, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 3 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2,
        replaceable = false
    },
    [19434] = {
        itemId = 19434,
        name = "Band of Dark Dominion",
        roles = { [ROLE_SHADOW_PRIEST] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 2,
        replaceable = true,
        removable = false
    },
    [19435] = {
        itemId = 19435,
        name = "Essence Gatherer",
        roles = { [ROLE_HOLY_PRIEST] = 1,[ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 2, [ROLE_WARLOCK] = 2 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 2,
        replaceable = true,
        removable = true
    },
    [19436] = {
        itemId = 19436,
        name = "Cloak of Draconic Might",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_ROGUE] = 2, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 2,
        replaceable = true,
        removable = false
    },
    [19437] = {
        itemId = 19437,
        name = "Boots of Pure Thought",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 2,
        replaceable = true,
        removable = false
    },
    [19438] = {
        itemId = 19438,
        name = "Ringo's Blizzard Boots",
        roles = { [ROLE_MAGE] = 1 },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 2,
        replaceable = true,
        removable = false
    },
    [19439] = {
        itemId = 19439,
        name = "Interlaced Shadow Jerkin",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 4, [ROLE_ROGUE] = 3, [ROLE_FERAL_DRUID] = 3, [ROLE_ENHANCEMENT_SHAMAN] = 4, [ROLE_RETRI_PALADIN] = 4, [ROLE_ARMS_WARRIOR] = 4 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 2,
        replaceable = false,
        removable = false
    },
    [19002] = {
        itemId = 19002,
        name = "Head of Nefarian",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 1, [ROLE_HOLY_PRIEST] = 3,
            [ROLE_RESTO_DRUID] = 3, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_BLACKWING_LAIR] = true },
        removable = true
    },

    -- QUEST ITEMS
    [19383] = {
        itemId = 19383,
        name = "Master Dragonslayer's Medallion",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19002 } -- Head of Nefarian
    },
    [19366] = {
        itemId = 19366,
        name = "Master Dragonslayer's Orb",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19002 } -- Head of Nefarian
    },
    [19384] = {
        itemId = 19384,
        name = "Master Dragonslayer's Ring",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19002 } -- Head of Nefarian
    },

    -- ZUL'GURUB
    [19716] = {
        itemId = 19716,
        name = "Primal Hakkari Bindings",
        roles = { [ROLE_HUNTER] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RETRI_PALADIN] = 2, [ROLE_MAGE] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        removable = true
    },
    [19717] = {
        itemId = 19717,
        name = "Primal Hakkari Armsplint",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_RESTO_SHAMAN] = 2, [ROLE_ROGUE] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        removable = true
    },
    [19718] = {
        itemId = 19718,
        name = "Primal Hakkari Stanchion",
        roles = { [ROLE_HOLY_PRIEST] = 3, [ROLE_RESTO_DRUID] = 1, [ROLE_BALANCE_DRUID] = 2, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        removable = true
    },
    [19719] = {
        itemId = 19719,
        name = "Primal Hakkari Girdle",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_RESTO_SHAMAN] = 2, [ROLE_ROGUE] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        removable = true
    },
    [19720] = {
        itemId = 19720,
        name = "Primal Hakkari Sash",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_BALANCE_DRUID] = 2, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        removable = true
    },
    [19721] = {
        itemId = 19721,
        name = "Primal Hakkari Shawl",
        roles = { [ROLE_HUNTER] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RETRI_PALADIN] = 2, [ROLE_MAGE] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        removable = true
    },
    [19722] = {
        itemId = 19722,
        name = "Primal Hakkari Tabard",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1,
            [ROLE_BALANCE_DRUID] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        removable = true
    },
    [19723] = {
        itemId = 19723,
        name = "Primal Hakkari Kossack",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        removable = true
    },
    [19724] = {
        itemId = 19724,
        name = "Primal Hakkari Aegis",
        roles = { [ROLE_HUNTER] = 1, [ROLE_HOLY_PRIEST] = 1, [ROLE_ROGUE] = 1 },
        classes = { [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        removable = true
    },
    [19802] = {
        itemId = 19802,
        name = "Heart of Hakkar",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 1, [ROLE_HOLY_PRIEST] = 1,
            [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19852] = {
        itemId = 19852,
        name = "Ancient Hakkari Manslayer",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19853] = {
        itemId = 19853,
        name = "Gurubashi Dwarf Destroyer",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19854] = {
        itemId = 19854,
        name = "Zin'rokh, Destroyer of Worlds",
        roles = { [ROLE_HUNTER] = 2, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19855] = {
        itemId = 19855,
        name = "Bloodsoaked Legplates",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [19856] = {
        itemId = 19856,
        name = "The Eye of Hakkar",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1,
            [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [19857] = {
        itemId = 19857,
        name = "Cloak of Consumption",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [19859] = {
        itemId = 19859,
        name = "Fang of the Faceless",
        roles = { [ROLE_GUARDIAN_DRUID] = 3, [ROLE_HUNTER] = 3, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 3,
            [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19861] = {
        itemId = 19861,
        name = "Touch of Chaos",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_SHADOW_PRIEST] = 1, [ROLE_WARLOCK] = 1, [ROLE_MAGE] = 1 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19862] = {
        itemId = 19862,
        name = "Aegis of the Blood God",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_ARMS_WARRIOR] = 2,
            [ROLE_RETRI_PALADIN] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19863] = {
        itemId = 19863,
        name = "Primalist's Seal",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19864] = {
        itemId = 19864,
        name = "Bloodcaller",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_HOLY_PALADIN] = 2, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19865] = {
        itemId = 19865,
        name = "Warblade of the Hakkari",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19866] = {
        itemId = 19866,
        name = "Warblade of the Hakkari",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19867] = {
        itemId = 19867,
        name = "Bloodlord's Defender",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19869] = {
        itemId = 19869,
        name = "Blooddrenched Grips",
        roles = { [ROLE_GUARDIAN_DRUID] = 3, [ROLE_HUNTER] = 4, [ROLE_ROGUE] = 2, [ROLE_FERAL_DRUID] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 4,
            [ROLE_RETRI_PALADIN] = 4, [ROLE_ARMS_WARRIOR] = 4 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19870] = {
        itemId = 19870,
        name = "Hakkari Loa Cloak",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19871] = {
        itemId = 19871,
        name = "Talisman of Protection",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19873] = {
        itemId = 19873,
        name = "Overlord's Crimson Band",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19874] = {
        itemId = 19874,
        name = "Halberd of Smiting",
        roles = { [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19875] = {
        itemId = 19875,
        name = "Bloodstained Coif",
        roles = { [ROLE_HUNTER] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 3 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19876] = {
        itemId = 19876,
        name = "Soul Corrupter's Necklace",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [19877] = {
        itemId = 19877,
        name = "Animist's Leggings",
        roles = { [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19878] = {
        itemId = 19878,
        name = "Bloodsoaked Pauldrons",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_RETRI_PALADIN] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19884] = {
        itemId = 19884,
        name = "Jin'do's Judgement",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19885] = {
        itemId = 19885,
        name = "Jin'do's Evil Eye",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [19886] = {
        itemId = 19886,
        name = "The Hexxer's Cover",
        roles = { [ROLE_HOLY_PRIEST] = 3, [ROLE_RESTO_DRUID] = 4, [ROLE_HOLY_PALADIN] = 4, [ROLE_RESTO_SHAMAN] = 4,
            [ROLE_ELEMENTAL_SHAMAN] = 3, [ROLE_BALANCE_DRUID] = 3, [ROLE_SHADOW_PRIEST] = 2, [ROLE_MAGE] = 2, [ROLE_WARLOCK] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19887] = {
        itemId = 19887,
        name = "Bloodstained Legplates",
        roles = { [ROLE_HUNTER] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 3 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19888] = {
        itemId = 19888,
        name = "Overlord's Embrace",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19889] = {
        itemId = 19889,
        name = "Blooddrenched Leggings",
        roles = { [ROLE_GUARDIAN_DRUID] = 3, [ROLE_HUNTER] = 4, [ROLE_ROGUE] = 2, [ROLE_FERAL_DRUID] = 2 },
        classes = { [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_DRUID] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19890] = {
        itemId = 19890,
        name = "Jin'do's Hexxer",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19891] = {
        itemId = 19891,
        name = "Jin'do's Bag of Whammies",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [19892] = {
        itemId = 19892,
        name = "Animist's Boots",
        roles = { [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19893] = {
        itemId = 19893,
        name = "Zanzil's Seal",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 2, [ROLE_MAGE] = 2, [ROLE_WARLOCK] = 2 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19894] = {
        itemId = 19894,
        name = "Bloodsoaked Gauntlets",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19895] = {
        itemId = 19895,
        name = "Bloodtinged Kilt",
        roles = { [ROLE_HOLY_PRIEST] = 3, [ROLE_RESTO_DRUID] = 4, [ROLE_HOLY_PALADIN] = 4, [ROLE_RESTO_SHAMAN] = 4,
            [ROLE_ELEMENTAL_SHAMAN] = 3, [ROLE_BALANCE_DRUID] = 3, [ROLE_SHADOW_PRIEST] = 2, [ROLE_MAGE] = 2, [ROLE_WARLOCK] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true,
            [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19896] = {
        itemId = 19896,
        name = "Thekal's Grasp",
        roles = { [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19897] = {
        itemId = 19897,
        name = "Betrayer's Boots",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 3, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3,
            [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true,
            [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [19898] = {
        itemId = 19898,
        name = "Seal of Jin",
        roles = { [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 2, [ROLE_FERAL_DRUID] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 2,
            [ROLE_RETRI_PALADIN] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19899] = {
        itemId = 19899,
        name = "Ritualistic Legguards",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 3, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19900] = {
        itemId = 19900,
        name = "Zulian Stone Axe",
        roles = { [ROLE_HUNTER] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2, [ROLE_ARMS_WARRIOR] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = true
    },
    [19901] = {
        itemId = 19901,
        name = "Zulian Slicer",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_HUNTER] = 2, [ROLE_HOLY_PALADIN] = 2,
            [ROLE_ROGUE] = 2, [ROLE_RETRI_PALADIN] = 2, [ROLE_MAGE] = 2, [ROLE_WARLOCK] = 2,
            [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 0.5,
        replaceable = true,
        removable = true
    },
    [19903] = {
        itemId = 19903,
        name = "Fang of Venoxis",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 2, [ROLE_RESTO_SHAMAN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 1,
            [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19904] = {
        itemId = 19904,
        name = "Runed Bloodstained Hauberk",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [19905] = {
        itemId = 19905,
        name = "Zanzil's Band",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 2, [ROLE_MAGE] = 2, [ROLE_WARLOCK] = 2 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19906] = {
        itemId = 19906,
        name = "Blooddrenched Footpads",
        roles = { [ROLE_GUARDIAN_DRUID] = 3, [ROLE_HUNTER] = 4, [ROLE_ROGUE] = 2, [ROLE_FERAL_DRUID] = 2,
            [ROLE_ENHANCEMENT_SHAMAN] = 5, [ROLE_RETRI_PALADIN] = 5, [ROLE_ARMS_WARRIOR] = 5 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19907] = {
        itemId = 19907,
        name = "Zulian Tigerhide Cloak",
        roles = { [ROLE_GUARDIAN_DRUID] = 4, [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 2, [ROLE_FERAL_DRUID] = 2,
            [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19909] = {
        itemId = 19909,
        name = "Will of Arlokk",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19910] = {
        itemId = 19910,
        name = "Arlokk's Grasp",
        roles = { [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19912] = {
        itemId = 19912,
        name = "Overlord's Onyx Band",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19913] = {
        itemId = 19913,
        name = "Bloodsoaked Greaves",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19915] = {
        itemId = 19915,
        name = "Zulian Defender",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = true
    },
    [19918] = {
        itemId = 19918,
        name = "Jeklik's Crusher",
        roles = { [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19919] = {
        itemId = 19919,
        name = "Bloodstained Greaves",
        roles = { [ROLE_HUNTER] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 3 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19920] = {
        itemId = 19920,
        name = "Primalist's Band",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19922] = {
        itemId = 19922,
        name = "Arlokk's Hoodoo Stick",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19923] = {
        itemId = 19923,
        name = "Jeklik's Opaline Talisman",
        roles = { [ROLE_HOLY_PRIEST] = 3, [ROLE_RESTO_DRUID] = 3, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3,
            [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 2, [ROLE_MAGE] = 2,
            [ROLE_WARLOCK] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true,
            [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19925] = {
        itemId = 19925,
        name = "Band of Jin",
        roles = { [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 2, [ROLE_FERAL_DRUID] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 2,
            [ROLE_RETRI_PALADIN] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19927] = {
        itemId = 19927,
        name = "Mar'li's Touch",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19928] = {
        itemId = 19928,
        name = "Animist's Spaulders",
        roles = { [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19929] = {
        itemId = 19929,
        name = "Bloodtinged Gloves",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 3, [ROLE_BALANCE_DRUID] = 3, [ROLE_SHADOW_PRIEST] = 2, [ROLE_MAGE] = 2,
            [ROLE_WARLOCK] = 2 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19930] = {
        itemId = 19930,
        name = "Mar'li's Eye",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2,
            [ROLE_ELEMENTAL_SHAMAN] = 3, [ROLE_BALANCE_DRUID] = 3, [ROLE_SHADOW_PRIEST] = 3 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19939] = {
        itemId = 19939,
        name = "Gri'lek's Blood",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 1,
            [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1,
            [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1,
            [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19940] = {
        itemId = 19940,
        name = "Renataki's Tooth",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 1,
            [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1,
            [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1,
            [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19941] = {
        itemId = 19941,
        name = "Wushoolay's Mane",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 1,
            [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1,
            [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1,
            [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19942] = {
        itemId = 19942,
        name = "Hazza'rah's Dream Thread",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 1,
            [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1,
            [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1,
            [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19944] = {
        itemId = 19944,
        name = "Nat Pagle's Fish Terminator",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [19945] = {
        itemId = 19945,
        name = "Foror's Eyepatch",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 3, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [19946] = {
        itemId = 19946,
        name = "Tigule's Harpoon",
        roles = { [ROLE_HUNTER] = 3, [ROLE_RETRI_PALADIN] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = true
    },
    [19947] = {
        itemId = 19947,
        name = "Nat Pagle's Broken Reel",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 2, [ROLE_MAGE] = 2,
            [ROLE_WARLOCK] = 2 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [19961] = {
        itemId = 19961,
        name = "Gri'lek's Grinder",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_PROT_WARRIOR] = 3, [ROLE_ROGUE] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 4,
            [ROLE_RETRI_PALADIN] = 4, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 0.5,
        replaceable = true,
        removable = true
    },
    [19962] = {
        itemId = 19962,
        name = "Gri'lek's Carver",
        roles = { [ROLE_HUNTER] = 3, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = true
    },
    [19963] = {
        itemId = 19963,
        name = "Pitchfork of Madness",
        roles = { [ROLE_HUNTER] = 3, [ROLE_RETRI_PALADIN] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = true
    },
    [19964] = {
        itemId = 19964,
        name = "Renataki's Soul Conduit",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_HOLY_PALADIN] = 3, [ROLE_MAGE] = 2, [ROLE_WARLOCK] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = true
    },
    [19965] = {
        itemId = 19965,
        name = "Wushoolay's Poker",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = true
    },
    [19967] = {
        itemId = 19967,
        name = "Thoughtblighter",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_SHADOW_PRIEST] = 2, [ROLE_MAGE] = 3, [ROLE_WARLOCK] = 3 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = true
    },
    [19968] = {
        itemId = 19968,
        name = "Fiery Retributer",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = true
    },
    [19993] = {
        itemId = 19993,
        name = "Hoodoo Hunting Bow",
        roles = { [ROLE_PROT_WARRIOR] = 4, [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 3, [ROLE_ARMS_WARRIOR] = 4 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = true
    },
    [20032] = {
        itemId = 20032,
        name = "Flowing Ritual Robes",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [20038] = {
        itemId = 20038,
        name = "Mandokir's Sting",
        roles = { [ROLE_PROT_WARRIOR] = 3, [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [20257] = {
        itemId = 20257,
        name = "Seafury Gauntlets",
        roles = { [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [20260] = {
        itemId = 20260,
        name = "Seafury Leggings",
        roles = { [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2,
            [ROLE_ELEMENTAL_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [20262] = {
        itemId = 20262,
        name = "Seafury Boots",
        roles = { [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3, [ROLE_ELEMENTAL_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [20264] = {
        itemId = 20264,
        name = "Peacekeeper Gauntlets",
        roles = { [ROLE_HOLY_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [20265] = {
        itemId = 20265,
        name = "Peacekeeper Boots",
        roles = { [ROLE_HOLY_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [20266] = {
        itemId = 20266,
        name = "Peacekeeper Leggings",
        roles = { [ROLE_HOLY_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [22637] = {
        itemId = 22637,
        name = "Primal Hakkari Idol",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 1,
            [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1,
            [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2,
            [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slotSize = 1,
        tier = 1,
        replaceable = false,
        removable = true,
        repeatable = true
    },
    [22711] = {
        itemId = 22711,
        name = "Cloak of the Hakkari Worshipers",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 2, [ROLE_MAGE] = 2,
            [ROLE_WARLOCK] = 2 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [22712] = {
        itemId = 22712,
        name = "Might of the Tribe",
        roles = { [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 2, [ROLE_FERAL_DRUID] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 2,
            [ROLE_RETRI_PALADIN] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [22713] = {
        itemId = 22713,
        name = "Zulian Scepter of Rites",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = true
    },
    [22714] = {
        itemId = 22714,
        name = "Sacrificial Gauntlets",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_PROT_WARRIOR] = 3, [ROLE_RETRI_PALADIN] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [22715] = {
        itemId = 22715,
        name = "Gloves of the Tormented",
        roles = { [ROLE_HUNTER] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [22716] = {
        itemId = 22716,
        name = "Belt of Untapped Power",
        roles = { [ROLE_HOLY_PRIEST] = 3, [ROLE_RESTO_DRUID] = 4, [ROLE_HOLY_PALADIN] = 4, [ROLE_RESTO_SHAMAN] = 4,
            [ROLE_ELEMENTAL_SHAMAN] = 3, [ROLE_BALANCE_DRUID] = 3, [ROLE_SHADOW_PRIEST] = 2, [ROLE_MAGE] = 2,
            [ROLE_WARLOCK] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true,
            [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [22718] = {
        itemId = 22718,
        name = "Blooddrenched Mask",
        roles = { [ROLE_GUARDIAN_DRUID] = 3, [ROLE_HUNTER] = 4, [ROLE_ROGUE] = 2, [ROLE_FERAL_DRUID] = 2,
            [ROLE_ARMS_WARRIOR] = 4, [ROLE_RETRI_PALADIN] = 4, [ROLE_ENHANCEMENT_SHAMAN] = 4 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [22720] = {
        itemId = 22720,
        name = "Zulian Headdress",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 3, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = false
    },
    [22721] = {
        itemId = 22721,
        name = "Band of Servitude",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2,
            [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true,
            [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [22722] = {
        itemId = 22722,
        name = "Seal of the Gurubashi Berserker",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1,
            [ROLE_RETRI_PALADIN] = 1,[ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [22739] = {
        itemId = 22739,
        name = "Tome of Polymorph: Turtle",
        roles = { [ROLE_MAGE] = 2 },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_ZUL_GURUB] = true },
        tier = 0.5,
        replaceable = false,
        removable = true
    },

    -- QUEST ITEMS
    [19822] = {
        itemId = 19822,
        name = "Zandalar Vindicator's Breastplate",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19723 } -- Primal Hakkari Kossack
    },
    [19823] = {
        itemId = 19823,
        name = "Zandalar Vindicator's Belt",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19719 } -- Primal Hakkari Girdle
    },
    [19824] = {
        itemId = 19824,
        name = "Zandalar Vindicator's Armguards",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19717 } -- Primal Hakkari Armsplint
    },
    [19825] = {
        itemId = 19825,
        name = "Zandalar Freethinker's Breastplate",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19722 } -- Primal Hakkari Tabard
    },
    [19826] = {
        itemId = 19826,
        name = "Zandalar Freethinker's Belt",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19721 } -- Primal Hakkari Shawl
    },
    [19827] = {
        itemId = 19827,
        name = "Zandalar Freethinker's Armguards",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19716 } -- Primal Hakkari Bindings
    },
    [19828] = {
        itemId = 19828,
        name = "Zandalar Augur's Hauberk",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19722 } -- Primal Hakkari Tabard
    },
    [19829] = {
        itemId = 19829,
        name = "Zandalar Augur's Belt",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19719 } -- Primal Hakkari Girdle
    },
    [19830] = {
        itemId = 19830,
        name = "Zandalar Augur's Bracers",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19717 } -- Primal Hakkari Armsplint
    },
    [19831] = {
        itemId = 19831,
        name = "Zandalar Predator's Mantle",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19724 } -- Primal Hakkari Aegis
    },
    [19832] = {
        itemId = 19832,
        name = "Zandalar Predator's Belt",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19721 } -- Primal Hakkari Shawl
    },
    [19833] = {
        itemId = 19833,
        name = "Zandalar Predator's Bracers",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19716 } -- Primal Hakkari Bindings
    },
    [19834] = {
        itemId = 19834,
        name = "Zandalar Madcap's Tunic",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19724 } -- Primal Hakkari Aegis
    },
    [19835] = {
        itemId = 19835,
        name = "Zandalar Madcap's Mantle",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19719 } -- Primal Hakkari Girdle
    },
    [19836] = {
        itemId = 19836,
        name = "Zandalar Madcap's Bracers",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19717 } -- Primal Hakkari Armsplint
    },
    [19838] = {
        itemId = 19838,
        name = "Zandalar Haruspex's Tunic",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19722 } -- Primal Hakkari Tabard
    },
    [19839] = {
        itemId = 19839,
        name = "Zandalar Haruspex's Belt",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19720 } -- Primal Hakkari Sash
    },
    [19840] = {
        itemId = 19840,
        name = "Zandalar Haruspex's Bracers",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19718 } -- Primal Hakkari Stanchion
    },
    [19841] = {
        itemId = 19841,
        name = "Zandalar Confessor's Mantle",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19724 } -- Primal Hakkari Aegis
    },
    [19842] = {
        itemId = 19842,
        name = "Zandalar Confessor's Bindings",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19720 } -- Primal Hakkari Sash
    },
    [19843] = {
        itemId = 19843,
        name = "Zandalar Confessor's Wraps",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19718 } -- Primal Hakkari Stanchion
    },
    [19845] = {
        itemId = 19845,
        name = "Zandalar Illusionist's Mantle",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19721 } -- Primal Hakkari Shawl
    },
    [19846] = {
        itemId = 19846,
        name = "Zandalar Illusionist's Wraps",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19716 } -- Primal Hakkari Bindings
    },
    [19848] = {
        itemId = 19848,
        name = "Zandalar Demoniac's Wraps",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19718 } -- Primal Hakkari Stanchion
    },
    [19849] = {
        itemId = 19849,
        name = "Zandalar Demoniac's Mantle",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19720 } -- Primal Hakkari Sash
    },
    [19948] = {
        itemId = 19948,
        name = "Zandalarian Hero Badge",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19802 } -- Heart of Hakkar
    },
    [19949] = {
        itemId = 19949,
        name = "Zandalarian Hero Medallion",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19802 } -- Heart of Hakkar
    },
    [19950] = {
        itemId = 19950,
        name = "Zandalarian Hero Charm",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19802 } -- Heart of Hakkar
    },
    [20033] = {
        itemId = 20033,
        name = "Zandalar Demoniac's Robe",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19723 } -- Primal Hakkari Kossack
    },
    [20034] = {
        itemId = 20034,
        name = "Zandalar Illusionist's Robe",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 19723 } -- Primal Hakkari Kossack
    },

    -- RUINS AHN QIRAJ
    [21455] = {
        itemId = 21455,
        name = "Southwind Helm",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_ROGUE] = 2, [ROLE_FERAL_DRUID] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 3,
            [ROLE_RETRI_PALADIN] = 4, [ROLE_ARMS_WARRIOR] = 4 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true,
            [CLASS_DRUID] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21484] = {
        itemId = 21484,
        name = "Helm of Regrowth",
        roles = { [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21460] = {
        itemId = 21460,
        name = "Helm of Domination",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = false
    },
    [21472] = {
        itemId = 21472,
        name = "Dustwind Turban",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = false
    },
    [21470] = {
        itemId = 21470,
        name = "Cloak of the Savior",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21456] = {
        itemId = 21456,
        name = "Sandstorm Cloak",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = false
    },
    [21467] = {
        itemId = 21467,
        name = "Thick Silithid Chestguard",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_ROGUE] = 2, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 3,
            [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true,
            [CLASS_DRUID] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = false
    },
    [21499] = {
        itemId = 21499,
        name = "Vestments of the Shifting Sands",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 4, [ROLE_HOLY_PALADIN] = 4, [ROLE_RESTO_SHAMAN] = 4,
            [ROLE_ELEMENTAL_SHAMAN] = 3, [ROLE_BALANCE_DRUID] = 3, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true,
            [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = false
    },
    [21481] = {
        itemId = 21481,
        name = "Boots of the Desert Protector",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_HOLY_PALADIN] = 2, [ROLE_RETRI_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21482] = {
        itemId = 21482,
        name = "Boots of the Fiery Sands",
        roles = { [ROLE_RESTO_SHAMAN] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2, [ROLE_HOLY_PALADIN] = 2,
            [ROLE_ELEMENTAL_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21489] = {
        itemId = 21489,
        name = "Quicksand Waders",
        roles = { [ROLE_HOLY_PRIEST] = 3, [ROLE_RESTO_DRUID] = 4, [ROLE_HOLY_PALADIN] = 4, [ROLE_RESTO_SHAMAN] = 4,
            [ROLE_ELEMENTAL_SHAMAN] = 3, [ROLE_BALANCE_DRUID] = 3, [ROLE_SHADOW_PRIEST] = 2, [ROLE_MAGE] = 2,
            [ROLE_WARLOCK] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true,
            [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21490] = {
        itemId = 21490,
        name = "Slime Kickers",
        roles = { [ROLE_PROT_PALADIN] = 5, [ROLE_PROT_WARRIOR] = 3, [ROLE_RETRI_PALADIN] = 4, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21497] = {
        itemId = 21497,
        name = "Boots of the Qiraji General",
        roles = { [ROLE_HUNTER] = 2 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21493] = {
        itemId = 21493,
        name = "Boots of the Vanguard",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_ROGUE] = 2, [ROLE_FERAL_DRUID] = 1 },
        classes = { [CLASS_ROGUE] = true, [CLASS_DRUID] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = false
    },
    [21477] = {
        itemId = 21477,
        name = "Ring of Fury",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_PROT_WARRIOR] = 3, [ROLE_GUARDIAN_DRUID] = 3, [ROLE_HUNTER] = 2,
            [ROLE_ROGUE] = 2, [ROLE_FERAL_DRUID] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2,
            [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true,
            [CLASS_DRUID] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21483] = {
        itemId = 21483,
        name = "Ring of the Desert Winds",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2,
            [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 2, [ROLE_MAGE] = 2,
            [ROLE_WARLOCK] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true,
            [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21469] = {
        itemId = 21469,
        name = "Gauntlets of Southwind",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 3, [ROLE_BALANCE_DRUID] = 2 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true},
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21480] = {
        itemId = 21480,
        name = "Scaled Silithid Gauntlets",
        roles = { [ROLE_HUNTER] = 2 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21458] = {
        itemId = 21458,
        name = "Gauntlets of New Life",
        roles = { [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = false
    },
    [21462] = {
        itemId = 21462,
        name = "Gloves of Dark Wisdom",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = false
    },
    [21501] = {
        itemId = 21501,
        name = "Toughened Silithid Hide Gloves",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_ROGUE] = 3, [ROLE_FERAL_DRUID] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 4,
            [ROLE_RETRI_PALADIN] = 5, [ROLE_ARMS_WARRIOR] = 5 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true,
            [CLASS_DRUID] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21479] = {
        itemId = 21479,
        name = "Gauntlets of the Immovable",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = false
    },
    [21486] = {
        itemId = 21486,
        name = "Gloves of the Swarm",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_RETRI_PALADIN] = 1, [ROLE_HOLY_PALADIN] = 3 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = false
    },
    [21487] = {
        itemId = 21487,
        name = "Slimy Scaled Gauntlets",
        roles = { [ROLE_HOLY_PALADIN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = false
    },
    [21471] = {
        itemId = 21471,
        name = "Talon of Furious Concentration",
        roles = { [ROLE_HOLY_PRIEST] = 3, [ROLE_RESTO_DRUID] = 3, [ROLE_HOLY_PALADIN] = 4, [ROLE_RESTO_SHAMAN] = 4,
            [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true,
            [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = true
    },
    [21475] = {
        itemId = 21475,
        name = "Legplates of the Destroyer",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_HOLY_PALADIN] = 4, [ROLE_RETRI_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21476] = {
        itemId = 21476,
        name = "Obsidian Scaled Leggings",
        roles = { [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2,
            [ROLE_ELEMENTAL_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21461] = {
        itemId = 21461,
        name = "Leggings of the Black Blizzard",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 4, [ROLE_HOLY_PALADIN] = 4, [ROLE_RESTO_SHAMAN] = 4,
            [ROLE_ELEMENTAL_SHAMAN] = 3, [ROLE_BALANCE_DRUID] = 3, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true,
            [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = false
    },
    [21495] = {
        itemId = 21495,
        name = "Legplates of the Qiraji Command",
        roles = { [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21466] = {
        itemId = 21466,
        name = "Stinger of Ayamiss",
        roles = { [ROLE_HOLY_PRIEST] = 3, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2,
            [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = true
    },
    [21715] = {
        itemId = 21715,
        name = "Sand Polished Hammer",
        roles = { [ROLE_ROGUE] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = true
    },
    [21498] = {
        itemId = 21498,
        name = "Qiraji Sacrificial Dagger",
        roles = { [ROLE_ROGUE] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 1.5,
        replaceable = true,
        removable = true
    },
    [21459] = {
        itemId = 21459,
        name = "Crossbow of Imminent Doom",
        roles = { [ROLE_PROT_WARRIOR] = 3, [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = true
    },
    [21478] = {
        itemId = 21478,
        name = "Bow of Taut Sinew",
        roles = { [ROLE_PROT_WARRIOR] = 2, [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = true
    },
    [21485] = {
        itemId = 21485,
        name = "Buru's Skull Fragment",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2,
            [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = true
    },
    [21468] = {
        itemId = 21468,
        name = "Mantle of Maz'Nadir",
        roles = { [ROLE_HOLY_PRIEST] = 3, [ROLE_RESTO_DRUID] = 5, [ROLE_HOLY_PALADIN] = 5, [ROLE_RESTO_SHAMAN] = 5,
            [ROLE_ELEMENTAL_SHAMAN] = 4, [ROLE_BALANCE_DRUID] = 4, [ROLE_SHADOW_PRIEST] = 2, [ROLE_MAGE] = 2,
            [ROLE_WARLOCK] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true,
            [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21474] = {
        itemId = 21474,
        name = "Chitinous Shoulderguards",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 4, [ROLE_ROGUE] = 3, [ROLE_FERAL_DRUID] = 2 },
        classes = { [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_DRUID] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21453] = {
        itemId = 21453,
        name = "Mantle of the Horusath",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_HOLY_PALADIN] = 2, [ROLE_RETRI_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = false
    },
    [21454] = {
        itemId = 21454,
        name = "Runic Stone Shoulders",
        roles = { [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1,
            [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = false
    },
    [21473] = {
        itemId = 21473,
        name = "Eye of Moam",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 2,
            [ROLE_MAGE] = 2, [ROLE_WARLOCK] = 2 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [21488] = {
        itemId = 21488,
        name = "Fetish of Chitinous Spikes",
        roles = { [ROLE_PROT_WARRIOR] = 3, [ROLE_RETRI_PALADIN] = 3, [ROLE_PROT_PALADIN] = 3, [ROLE_HOLY_PALADIN] = 4, [ROLE_RESTO_SHAMAN] = 4,
            [ROLE_ELEMENTAL_SHAMAN] = 4, [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_SHADOW_PRIEST] = 4, [ROLE_ARMS_WARRIOR] = 4 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [21452] = {
        itemId = 21452,
        name = "Staff of the Ruins",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = true
    },
    [21492] = {
        itemId = 21492,
        name = "Manslayer of the Qiraji",
        roles = { [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = true
    },
    [21463] = {
        itemId = 21463,
        name = "Ossirian's Binding",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = false
    },
    [21494] = {
        itemId = 21494,
        name = "Southwind's Grasp",
        roles = { [ROLE_RESTO_DRUID] = 3, [ROLE_HOLY_PALADIN] = 5, [ROLE_RESTO_SHAMAN] = 5, [ROLE_ELEMENTAL_SHAMAN] = 4,
            [ROLE_BALANCE_DRUID] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21500] = {
        itemId = 21500,
        name = "Belt of the Inquisition",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 3, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21503] = {
        itemId = 21503,
        name = "Belt of the Sand Reaver",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21491] = {
        itemId = 21491,
        name = "Scaled Bracers of the Gorger",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_ROGUE] = 3, [ROLE_FERAL_DRUID] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 4 },
        classes = { [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21457] = {
        itemId = 21457,
        name = "Bracers of Brutality",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = false
    },
    [21464] = {
        itemId = 21464,
        name = "Shackles of the Unscarred",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = false
    },
    [21496] = {
        itemId = 21496,
        name = "Bracers of Qiraji Command",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 3, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3,
            [ROLE_SHADOW_PRIEST] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21502] = {
        itemId = 21502,
        name = "Sand Reaver Wristguards",
        roles = { [ROLE_HUNTER] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 3 },
        classes = { [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21220] = {
        itemId = 21220,
        name = "Head of Ossirian the Unscarred",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 1, [ROLE_HOLY_PRIEST] = 1,
            [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 1.5,
        replaceable = true,
        removable = true
    },
    [20884] = {
        itemId = 20884,
        name = "Qiraji Magisterial Ring",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_RESTO_DRUID] = 1,
            [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 2, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1,
            [ROLE_RETRI_PALADIN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_MAGE] = 1,
            [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [20885] = {
        itemId = 20885,
        name = "Qiraji Martial Drape",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_HOLY_PRIEST] = 1, [ROLE_ROGUE] = 1, [ROLE_MAGE] = 1,
            [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true, [CLASS_PRIEST] = true, [CLASS_MAGE] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [20886] = {
        itemId = 20886,
        name = "Qiraji Spiked Hilt",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_HUNTER] = 1, [ROLE_HOLY_PALADIN] = 1,
            [ROLE_RESTO_SHAMAN] = 1, [ROLE_ROGUE] = 1, [ROLE_RETRI_PALADIN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 1,
            [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [20888] = {
        itemId = 20888,
        name = "Qiraji Ceremonial Ring",
        roles = { [ROLE_HUNTER] = 1, [ROLE_HOLY_PRIEST] = 1, [ROLE_ROGUE] = 1, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [20889] = {
        itemId = 20889,
        name = "Qiraji Regal Drape",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 1, [ROLE_RESTO_DRUID] = 3,
            [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 2, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 2,
            [ROLE_RETRI_PALADIN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_WARLOCK] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [20890] = {
        itemId = 20890,
        name = "Qiraji Ornate Hilt",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 3, [ROLE_FERAL_DRUID] = 1,
            [ROLE_BALANCE_DRUID] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [21809] = {
        itemId = 21809,
        name = "Fury of the Forgotten Swarm",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_PROT_WARRIOR] = 3, [ROLE_GUARDIAN_DRUID] = 3, [ROLE_HUNTER] = 3,
            [ROLE_ROGUE] = 2, [ROLE_FERAL_DRUID] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2,
            [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21810] = {
        itemId = 21810,
        name = "Treads of the Wandering Nomad",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 3, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21806] = {
        itemId = 21806,
        name = "Gavel of Qiraji Authority",
        roles = { [ROLE_RESTO_DRUID] = 3, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3, [ROLE_ENHANCEMENT_SHAMAN] = 2,
            [ROLE_RETRI_PALADIN] = 2, [ROLE_BALANCE_DRUID] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [21801] = {
        itemId = 21801,
        name = "Antenna of Invigoration",
        roles = { [ROLE_HOLY_PRIEST] = 2 },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = true
    },
    [21803] = {
        itemId = 21803,
        name = "Helm of the Holy Avenger",
        roles = { [ROLE_HOLY_PALADIN] = 2, [ROLE_RETRI_PALADIN] = 3 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    [21800] = {
        itemId = 21800,
        name = "Silithid Husked Launcher",
        roles = { [ROLE_PROT_WARRIOR] = 3, [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 4, [ROLE_ARMS_WARRIOR] = 4 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = true
    },
    [21802] = {
        itemId = 21802,
        name = "The Lost Kris of Zedd",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 2, [ROLE_MAGE] = 2,
            [ROLE_WARLOCK] = 2 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 0.5,
        replaceable = true,
        removable = true
    },
    [21804] = {
        itemId = 21804,
        name = "Coif of Elemental Fury",
        roles = { [ROLE_HOLY_PALADIN] = 4, [ROLE_RESTO_SHAMAN] = 3, [ROLE_ELEMENTAL_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_RUINS_AHN_QIRAJ] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 1,
        replaceable = true,
        removable = false
    },
    
    -- QUEST ITEMS
    [21392] = {
        itemId = 21392,
        name = "Sickle of Unyielding Strength",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20886 } -- Qiraji Spiked Hilt
    },
    [21393] = {
        itemId = 21393,
        name = "Signet of Unyielding Strength",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20884 } -- Qiraji Magisterial Ring
    },
    [21394] = {
        itemId = 21394,
        name = "Drape of Unyielding Strength",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20885 } -- Qiraji Martial Drape
    },
    [21395] = {
        itemId = 21395,
        name = "Blade of Eternal Justice",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20886 } -- Qiraji Spiked Hilt
    },
    [21396] = {
        itemId = 21396,
        name = "Ring of Eternal Justice",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20884 } -- Qiraji Magisterial Ring
    },
    [21397] = {
        itemId = 21397,
        name = "Cape of Eternal Justice",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20889 } -- Qiraji Regal Drape
    },
    [21398] = {
        itemId = 21398,
        name = "Hammer of the Gathering Storm",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20886 } -- Qiraji Spiked Hilt
    },
    [21399] = {
        itemId = 21399,
        name = "Ring of the Gathering Storm",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20884 } -- Qiraji Magisterial Ring
    },
    [21400] = {
        itemId = 21400,
        name = "Cloak of the Gathering Storm",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20889 } -- Qiraji Regal Drape
    },
    [21401] = {
        itemId = 21401,
        name = "Scythe of the Unseen Path",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20886 } -- Qiraji Spiked Hilt
    },
    [21402] = {
        itemId = 21402,
        name = "Signet of the Unseen Path",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20888 } -- Qiraji Ceremonial Ring
    },
    [21403] = {
        itemId = 21403,
        name = "Cloak of the Unseen Path",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20889 } -- Qiraji Regal Drape
    },
    [21404] = {
        itemId = 21404,
        name = "Dagger of Veiled Shadows",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20886 } -- Qiraji Spiked Hilt
    },
    [21405] = {
        itemId = 21405,
        name = "Band of Veiled Shadows",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20888 } -- Qiraji Ceremonial Ring
    },
    [21406] = {
        itemId = 21406,
        name = "Cloak of Veiled Shadows",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20885 } -- Qiraji Martial Drape
    },
    [21407] = {
        itemId = 21407,
        name = "Mace of Unending Life",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20890 } -- Qiraji Ornate Hilt
    },
    [21408] = {
        itemId = 21408,
        name = "Band of Unending Life",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20884 } -- Qiraji Magisterial Ring
    },
    [21409] = {
        itemId = 21409,
        name = "Cloak of Unending Life",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20889 } -- Qiraji Regal Drape
    },
    [21410] = {
        itemId = 21410,
        name = "Gavel of Infinite Wisdom",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20890 } -- Qiraji Ornate Hilt
    },
    [21411] = {
        itemId = 21411,
        name = "Ring of Infinite Wisdom",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20888 } -- Qiraji Ceremonial Ring
    },
    [21412] = {
        itemId = 21412,
        name = "Shroud of Infinite Wisdom",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20885 } -- Qiraji Martial Drape
    },
    [21413] = {
        itemId = 21413,
        name = "Blade of Vaulted Secrets",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20890 } -- Qiraji Ornate Hilt
    },
    [21414] = {
        itemId = 21414,
        name = "Band of Vaulted Secrets",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20884 } -- Qiraji Magisterial Ring
    },
    [21415] = {
        itemId = 21415,
        name = "Drape of Vaulted Secrets",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20885 } -- Qiraji Martial Drape
    },
    [21416] = {
        itemId = 21416,
        name = "Kris of Unspoken Names",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20890 } -- Qiraji Ornate Hilt
    },
    [21417] = {
        itemId = 21417,
        name = "Ring of Unspoken Names",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20888 } -- Qiraji Ceremonial Ring
    },
    [21418] = {
        itemId = 21418,
        name = "Shroud of Unspoken Names",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20889 } -- Qiraji Regal Drape
    },
    [21504] = {
        itemId = 21504,
        name = "Charm of the Shifting Sands",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 21220 } -- Head of Ossirian the Unscarred
    },
    [21505] = {
        itemId = 21505,
        name = "Choker of the Shifting Sands",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 21220 } -- Head of Ossirian the Unscarred
    },
    [21506] = {
        itemId = 21506,
        name = "Pendant of the Shifting Sands",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 21220 } -- Head of Ossirian the Unscarred
    },
    [21507] = {
        itemId = 21507,
        name = "Amulet of the Shifting Sands",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 21220 } -- Head of Ossirian the Unscarred
    },

    -- AHN QIRAJ TEMPLE
    [21221] = {
        itemId = 21221,
        name = "Eye of C'Thun",
        roles = { [ROLE_HUNTER] = 1, [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1,
            [ROLE_RESTO_SHAMAN] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1,
            [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true,
            [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = true
    },
    [21232] = {
        itemId = 21232,
        name = "Imperial Qiraji Armaments",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        tier = 2.5,
        replaceable = true,
        removable = true,
        repeatable = true
    },
    [21237] = {
        itemId = 21237,
        name = "Imperial Qiraji Regalia",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HOLY_PRIEST] = 1,
            [ROLE_RESTO_DRUID] = 1, [ROLE_RESTO_SHAMAN] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1,
            [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = true,
        repeatable = true
    },
    [20926] = {
        itemId = 20926,
        name = "Vek'nilash's Circlet",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_HOLY_PRIEST] = 2, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [20927] = {
        itemId = 20927,
        name = "Ouro's Intact Hide",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_HOLY_PRIEST] = 2, [ROLE_ROGUE] = 1, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true, [CLASS_PRIEST] = true, [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [20928] = {
        itemId = 20928,
        name = "Qiraji Bindings of Command",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_HUNTER] = 1, [ROLE_HOLY_PRIEST] = 1, [ROLE_ROGUE] = 1, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = true,
        repeatable = true
    },
    [20929] = {
        itemId = 20929,
        name = "Carapace of the Old God",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_HUNTER] = 1, [ROLE_HOLY_PALADIN] = 1,
            [ROLE_RESTO_SHAMAN] = 1, [ROLE_ROGUE] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1,
            [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [20930] = {
        itemId = 20930,
        name = "Vek'lor's Diadem",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 1, [ROLE_RESTO_DRUID] = 2,
            [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true,
            [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [20931] = {
        itemId = 20931,
        name = "Skin of the Great Sandworm",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 1, [ROLE_RESTO_DRUID] = 2,
            [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 2,
            [ROLE_RETRI_PALADIN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_WARLOCK] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [20932] = {
        itemId = 20932,
        name = "Qiraji Bindings of Dominance",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 1,
            [ROLE_FERAL_DRUID] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1, [ROLE_RESTO_SHAMAN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_DRUID] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true,
            [CLASS_SHAMAN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = true,
        repeatable = true
    },
    [20933] = {
        itemId = 20933,
        name = "Husk of the Old God",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 2, [ROLE_FERAL_DRUID] = 1,
            [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21583] = {
        itemId = 21583,
        name = "Cloak of Clarity",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [22731] = {
        itemId = 22731,
        name = "Cloak of the Devoured",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false,
        restricted = true
    },
    [21621] = {
        itemId = 21621,
        name = "Cloak of the Golden Hive",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false,
        restricted = true
    },
    [21627] = {
        itemId = 21627,
        name = "Cloak of Untold Secrets",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_PROT_WARRIOR] = 3, [ROLE_GUARDIAN_DRUID] = 3, [ROLE_HUNTER] = 5, [ROLE_HOLY_PRIEST] = 5,
            [ROLE_RESTO_DRUID] = 5, [ROLE_HOLY_PALADIN] = 5, [ROLE_RESTO_SHAMAN] = 4, [ROLE_ROGUE] = 5, [ROLE_FERAL_DRUID] = 5,
            [ROLE_ENHANCEMENT_SHAMAN] = 4, [ROLE_RETRI_PALADIN] = 5, [ROLE_ELEMENTAL_SHAMAN] = 4, [ROLE_BALANCE_DRUID] = 5, [ROLE_SHADOW_PRIEST] = 4,
            [ROLE_MAGE] = 5, [ROLE_WARLOCK] = 3, [ROLE_ARMS_WARRIOR] = 5 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 2.5,
        replaceable = false,
        removable = false
    },
    [21697] = {
        itemId = 21697,
        name = "Cape of the Trinity",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21701] = {
        itemId = 21701,
        name = "Cloak of Concentrated Hatred",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 2,
            [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1,
            [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21680] = {
        itemId = 21680,
        name = "Vest of Swift Execution",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 3, [ROLE_ROGUE] = 2, [ROLE_FERAL_DRUID] = 1 },
        classes = { [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21652] = {
        itemId = 21652,
        name = "Silithid Carapace Chestguard",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_PROT_WARRIOR] = 3, [ROLE_RETRI_PALADIN] = 4, [ROLE_ARMS_WARRIOR] = 4 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 2.5,
        replaceable = false,
        removable = false
    },
    [21663] = {
        itemId = 21663,
        name = "Robes of the Guardian Saint",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21671] = {
        itemId = 21671,
        name = "Robes of the Battleguard",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21696] = {
        itemId = 21696,
        name = "Robes of the Triumvirate",
        roles = { [ROLE_HOLY_PRIEST] = 3, [ROLE_RESTO_DRUID] = 5, [ROLE_HOLY_PALADIN] = 5, [ROLE_RESTO_SHAMAN] = 5,
            [ROLE_SHADOW_PRIEST] = 3, [ROLE_MAGE] = 4, [ROLE_WARLOCK] = 4 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 2.5,
        replaceable = false,
        removable = false
    },
    [21814] = {
        itemId = 21814,
        name = "Breastplate of Annihilation",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_PROT_WARRIOR] = 3, [ROLE_RETRI_PALADIN] = 2, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21600] = {
        itemId = 21600,
        name = "Boots of Epiphany",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 4, [ROLE_BALANCE_DRUID] = 3, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21645] = {
        itemId = 21645,
        name = "Hive Tunneler's Boots",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_ROGUE] = 3, [ROLE_FERAL_DRUID] = 2 },
        classes = { [CLASS_ROGUE] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21648] = {
        itemId = 21648,
        name = "Recomposed Boots",
        roles = { [ROLE_HOLY_PRIEST] = 4, [ROLE_RESTO_DRUID] = 6, [ROLE_HOLY_PALADIN] = 6, [ROLE_RESTO_SHAMAN] = 6,
            [ROLE_ELEMENTAL_SHAMAN] = 5, [ROLE_BALANCE_DRUID] = 5, [ROLE_SHADOW_PRIEST] = 3, [ROLE_MAGE] = 3,
            [ROLE_WARLOCK] = 3 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true,
            [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 2.5,
        replaceable = false,
        removable = false
    },
    [21688] = {
        itemId = 21688,
        name = "Boots of the Fallen Hero",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21704] = {
        itemId = 21704,
        name = "Boots of the Redeemed Prophecy",
        roles = { [ROLE_HOLY_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21705] = {
        itemId = 21705,
        name = "Boots of the Fallen Prophet",
        roles = { [ROLE_RESTO_SHAMAN] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21706] = {
        itemId = 21706,
        name = "Boots of the Unwavering Will",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21596] = {
        itemId = 21596,
        name = "Ring of the Godslayer",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1 },
        classes = { [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21601] = {
        itemId = 21601,
        name = "Ring of Emperor Vek'lor",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21620] = {
        itemId = 21620,
        name = "Ring of the Martyr",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21677] = {
        itemId = 21677,
        name = "Ring of the Qiraji Fury",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1,
            [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21681] = {
        itemId = 21681,
        name = "Ring of the Devoured",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1,
            [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21687] = {
        itemId = 21687,
        name = "Ukko's Ring of Darkness",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_PROT_WARRIOR] = 3, [ROLE_GUARDIAN_DRUID] = 3, [ROLE_HUNTER] = 5, [ROLE_HOLY_PRIEST] = 5,
            [ROLE_RESTO_DRUID] = 5, [ROLE_HOLY_PALADIN] = 5, [ROLE_RESTO_SHAMAN] = 4, [ROLE_ROGUE] = 5, [ROLE_FERAL_DRUID] = 5,
            [ROLE_ENHANCEMENT_SHAMAN] = 4, [ROLE_RETRI_PALADIN] = 5, [ROLE_ELEMENTAL_SHAMAN] = 4, [ROLE_BALANCE_DRUID] = 5, [ROLE_SHADOW_PRIEST] = 4,
            [ROLE_MAGE] = 5, [ROLE_WARLOCK] = 3, [ROLE_ARMS_WARRIOR] = 5 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 2.5,
        replaceable = false,
        removable = false
    },
    [21695] = {
        itemId = 21695,
        name = "Angelista's Touch",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21707] = {
        itemId = 21707,
        name = "Ring of Swarming Thought",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21581] = {
        itemId = 21581,
        name = "Gauntlets of Annihilation",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_PROT_WARRIOR] = 3, [ROLE_RETRI_PALADIN] = 2, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21585] = {
        itemId = 21585,
        name = "Dark Storm Gauntlets",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21599] = {
        itemId = 21599,
        name = "Vek'lor's Gloves of Devastation",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21605] = {
        itemId = 21605,
        name = "Gloves of the Hidden Temple",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_ROGUE] = 2, [ROLE_FERAL_DRUID] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 3 },
        classes = { [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21617] = {
        itemId = 21617,
        name = "Wasphide Gauntlets",
        roles = { [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21619] = {
        itemId = 21619,
        name = "Gloves of the Messiah",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21624] = {
        itemId = 21624,
        name = "Gauntlets of Kalimdor",
        roles = { [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_RETRI_PALADIN] = 2,
            [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21682] = {
        itemId = 21682,
        name = "Bile-Covered Gauntlets",
        roles = { [ROLE_GUARDIAN_DRUID] = 3, [ROLE_HUNTER] = 5, [ROLE_ROGUE] = 4, [ROLE_FERAL_DRUID] = 4,
            [ROLE_ENHANCEMENT_SHAMAN] = 5, [ROLE_RETRI_PALADIN] = 5, [ROLE_ARMS_WARRIOR] = 5 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2.5,
        replaceable = false,
        removable = false
    },
    [21672] = {
        itemId = 21672,
        name = "Gloves of Enforcement",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 3,
            [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true,
            [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21674] = {
        itemId = 21674,
        name = "Gauntlets of Steadfast Determination",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21689] = {
        itemId = 21689,
        name = "Gloves of Ebru",
        roles = { [ROLE_RESTO_DRUID] = 3, [ROLE_HOLY_PALADIN] = 4, [ROLE_RESTO_SHAMAN] = 4, [ROLE_ELEMENTAL_SHAMAN] = 2,
            [ROLE_BALANCE_DRUID] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21691] = {
        itemId = 21691,
        name = "Ooze-ridden Gauntlets",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_PROT_WARRIOR] = 3, [ROLE_HOLY_PALADIN] = 5, [ROLE_RETRI_PALADIN] = 4,
            [ROLE_ARMS_WARRIOR] = 4 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2.5,
        replaceable = false,
        removable = false
    },
    [21615] = {
        itemId = 21615,
        name = "Don Rigoberto's Lost Hat",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false,
        restricted = true
    },
    [21669] = {
        itemId = 21669,
        name = "Creeping Vine Helm",
        roles = { [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21693] = {
        itemId = 21693,
        name = "Guise of the Devourer",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_ROGUE] = 3, [ROLE_FERAL_DRUID] = 2 },
        classes = { [CLASS_ROGUE] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21597] = {
        itemId = 21597,
        name = "Royal Scepter of Vek'lor",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = true
    },
    [21666] = {
        itemId = 21666,
        name = "Sartura's Might",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = true
    },
    [21626] = {
        itemId = 21626,
        name = "Slime-coated Leggings",
        roles = { [ROLE_HUNTER] = 4, [ROLE_HOLY_PALADIN] = 6, [ROLE_RESTO_SHAMAN] = 4, [ROLE_ENHANCEMENT_SHAMAN] = 3,
            [ROLE_RETRI_PALADIN] = 5, [ROLE_ELEMENTAL_SHAMAN] = 4, [ROLE_ARMS_WARRIOR] = 5 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2.5,
        replaceable = false,
        removable = false
    },
    [21651] = {
        itemId = 21651,
        name = "Scaled Sand Reaver Leggings",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21667] = {
        itemId = 21667,
        name = "Legplates of Blazing Light",
        roles = { [ROLE_HOLY_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21668] = {
        itemId = 21668,
        name = "Scaled Leggings of Qiraji Fury",
        roles = { [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21676] = {
        itemId = 21676,
        name = "Leggings of the Festering Swarm",
        roles = { [ROLE_MAGE] = 2, [ROLE_WARLOCK] = 2 },
        classes = { [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21698] = {
        itemId = 21698,
        name = "Leggings of Immersion",
        roles = { [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 4, [ROLE_RESTO_SHAMAN] = 4, [ROLE_ELEMENTAL_SHAMAN] = 3,
            [ROLE_BALANCE_DRUID] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21839] = {
        itemId = 21839,
        name = "Scepter of the False Prophet",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [21622] = {
        itemId = 21622,
        name = "Sharpened Silithid Femur",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_HOLY_PALADIN] = 3, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [21673] = {
        itemId = 21673,
        name = "Silithid Claw",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 3, [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 3, [ROLE_FERAL_DRUID] = 3,
            [ROLE_ENHANCEMENT_SHAMAN] = 4, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true,
            [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = true
    },
    [22732] = {
        itemId = 22732,
        name = "Mark of C'Thun",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21608] = {
        itemId = 21608,
        name = "Amulet of Vek'nilash",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 2,
            [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true,
            [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21664] = {
        itemId = 21664,
        name = "Barbed Choker",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1,
            [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21678] = {
        itemId = 21678,
        name = "Necklace of Purity",
        roles = { [ROLE_HOLY_PRIEST] = 3, [ROLE_RESTO_DRUID] = 3, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3,
            [ROLE_ELEMENTAL_SHAMAN] = 3, [ROLE_BALANCE_DRUID] = 3, [ROLE_SHADOW_PRIEST] = 3, [ROLE_MAGE] = 3,
            [ROLE_WARLOCK] = 3 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true,
            [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 2.5,
        replaceable = false,
        removable = false
    },
    [21690] = {
        itemId = 21690,
        name = "Angelista's Charm",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21700] = {
        itemId = 21700,
        name = "Pendant of the Qiraji Guardian",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21702] = {
        itemId = 21702,
        name = "Amulet of Foul Warding",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_PROT_WARRIOR] = 3, [ROLE_GUARDIAN_DRUID] = 3, [ROLE_HUNTER] = 5,
            [ROLE_ROGUE] = 4, [ROLE_FERAL_DRUID] = 4, [ROLE_ENHANCEMENT_SHAMAN] = 4, [ROLE_RETRI_PALADIN] = 4,
            [ROLE_ARMS_WARRIOR] = 4 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 2.5,
        replaceable = false,
        removable = false
    },
    [21126] = {
        itemId = 21126,
        name = "Death's Sting",
        roles = { [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 2.5,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [21650] = {
        itemId = 21650,
        name = "Ancient Qiraji Ripper",
        roles = { [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 1, [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 2.5,
        replaceable = true,
        removable = true
    },
    [23557] = {
        itemId = 23557,
        name = "Larvae of the Great Worm",
        roles = { [ROLE_PROT_WARRIOR] = 3, [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = true
    },
    [21603] = {
        itemId = 21603,
        name = "Wand of Qiraji Nobility",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = true
    },
    [21616] = {
        itemId = 21616,
        name = "Huhuran's Stinger",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 2 },
        classes = { [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = true
    },
    [22396] = {
        itemId = 22396,
        name = "Totem of Life",
        roles = { [ROLE_RESTO_SHAMAN] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 2 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = true
    },
    [22399] = {
        itemId = 22399,
        name = "Idol of Health",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_RESTO_DRUID] = 1, [ROLE_FERAL_DRUID] = 2, [ROLE_BALANCE_DRUID] = 2 },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = true
    },
    [22402] = {
        itemId = 22402,
        name = "Libram of Grace",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_HOLY_PALADIN] = 1, [ROLE_RETRI_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = true
    },
    [21610] = {
        itemId = 21610,
        name = "Wormscale Blocker",
        roles = { [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [21639] = {
        itemId = 21639,
        name = "Pauldrons of the Unrelenting",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21665] = {
        itemId = 21665,
        name = "Mantle of Wicked Revenge",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 3, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21683] = {
        itemId = 21683,
        name = "Mantle of the Desert Crusade",
        roles = { [ROLE_HOLY_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21684] = {
        itemId = 21684,
        name = "Mantle of the Desert's Fury",
        roles = { [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21686] = {
        itemId = 21686,
        name = "Mantle of Phrenic Power",
        roles = { [ROLE_MAGE] = 2, [ROLE_WARLOCK] = 2 },
        classes = { [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21694] = {
        itemId = 21694,
        name = "Ternary Mantle",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21699] = {
        itemId = 21699,
        name = "Barrage Shoulders",
        roles = { [ROLE_HUNTER] = 1 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21579] = {
        itemId = 21579,
        name = "Vanquished Tentacle of C'Thun",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_PROT_WARRIOR] = 3, [ROLE_GUARDIAN_DRUID] = 3, [ROLE_HUNTER] = 3,
            [ROLE_HOLY_PRIEST] = 3, [ROLE_RESTO_DRUID] = 3, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3,
            [ROLE_ROGUE] = 3, [ROLE_FERAL_DRUID] = 3, [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_RETRI_PALADIN] = 3,
            [ROLE_ELEMENTAL_SHAMAN] = 3, [ROLE_BALANCE_DRUID] = 3, [ROLE_SHADOW_PRIEST] = 3, [ROLE_MAGE] = 3,
            [ROLE_WARLOCK] = 3, [ROLE_ARMS_WARRIOR] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 2.5,
        replaceable = true,
        removable = true
    },
    [23558] = {
        itemId = 23558,
        name = "The Burrower's Shell",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_PROT_WARRIOR] = 3, [ROLE_GUARDIAN_DRUID] = 3, [ROLE_HUNTER] = 3,
            [ROLE_HOLY_PRIEST] = 3, [ROLE_RESTO_DRUID] = 3, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3,
            [ROLE_ROGUE] = 3, [ROLE_FERAL_DRUID] = 3, [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_RETRI_PALADIN] = 3,
            [ROLE_ELEMENTAL_SHAMAN] = 3, [ROLE_BALANCE_DRUID] = 3, [ROLE_SHADOW_PRIEST] = 3, [ROLE_MAGE] = 3,
            [ROLE_WARLOCK] = 3, [ROLE_ARMS_WARRIOR] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 2.5,
        replaceable = true,
        removable = true
    },
    [23570] = {
        itemId = 23570,
        name = "Jom Gabbar",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1,
            [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 2.5,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [21625] = {
        itemId = 21625,
        name = "Scarab Brooch",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 2.5,
        replaceable = true,
        removable = true
    },
    [21647] = {
        itemId = 21647,
        name = "Fetish of the Sand Reaver",
        roles = { [ROLE_HUNTER] = 3, [ROLE_HOLY_PRIEST] = 5, [ROLE_RESTO_DRUID] = 4, [ROLE_HOLY_PALADIN] = 4,
            [ROLE_RESTO_SHAMAN] = 4, [ROLE_ROGUE] = 3, [ROLE_FERAL_DRUID] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 2,
            [ROLE_RETRI_PALADIN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 3,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 2.5,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [21670] = {
        itemId = 21670,
        name = "Badge of the Swarmguard",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 1,
            [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1,
            [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 2.5,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [21685] = {
        itemId = 21685,
        name = "Petrified Scarab",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_PROT_WARRIOR] = 3, [ROLE_GUARDIAN_DRUID] = 3, [ROLE_HUNTER] = 5, [ROLE_HOLY_PRIEST] = 5,
            [ROLE_RESTO_DRUID] = 5, [ROLE_HOLY_PALADIN] = 5, [ROLE_RESTO_SHAMAN] = 4, [ROLE_ROGUE] = 5, [ROLE_FERAL_DRUID] = 5,
            [ROLE_ENHANCEMENT_SHAMAN] = 4, [ROLE_RETRI_PALADIN] = 5, [ROLE_ELEMENTAL_SHAMAN] = 4, [ROLE_BALANCE_DRUID] = 5, [ROLE_SHADOW_PRIEST] = 4,
            [ROLE_MAGE] = 5, [ROLE_WARLOCK] = 3, [ROLE_ARMS_WARRIOR] = 5 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 2.5,
        replaceable = true,
        removable = true
    },
    [21134] = {
        itemId = 21134,
        name = "Dark Edge of Insanity",
        roles = { [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [21679] = {
        itemId = 21679,
        name = "Kalimdor's Revenge",
        roles = { [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = true
    },
    [21635] = {
        itemId = 21635,
        name = "Barb of the Sand Reaver",
        roles = { [ROLE_HUNTER] = 1 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = true,
        restricted = true
    },
    [21128] = {
        itemId = 21128,
        name = "Staff of the Qiraji Prophets",
        roles = { [ROLE_HOLY_PRIEST] = 5, [ROLE_RESTO_DRUID] = 5, [ROLE_RESTO_SHAMAN] = 6, [ROLE_ELEMENTAL_SHAMAN] = 4,
            [ROLE_BALANCE_DRUID] = 3, [ROLE_SHADOW_PRIEST] = 3, [ROLE_MAGE] = 3, [ROLE_WARLOCK] = 3 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 2.5,
        replaceable = false,
        removable = true
    },
    [21703] = {
        itemId = 21703,
        name = "Hammer of Ji'zhi",
        roles = { [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_BALANCE_DRUID] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = true
    },
    [21582] = {
        itemId = 21582,
        name = "Grasp of the Old God",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21586] = {
        itemId = 21586,
        name = "Belt of Never-ending Agony",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 3, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [22730] = {
        itemId = 22730,
        name = "Eyestalk Waist Cord",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_ELEMENTAL_SHAMAN] = 3, [ROLE_BALANCE_DRUID] = 3, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21598] = {
        itemId = 21598,
        name = "Royal Qiraji Belt",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21606] = {
        itemId = 21606,
        name = "Belt of the Fallen Emperor",
        roles = { [ROLE_HOLY_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21607] = {
        itemId = 21607,
        name = "Grasp of the Fallen Emperor",
        roles = { [ROLE_HOLY_PALADIN] = 4, [ROLE_RESTO_SHAMAN] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 3,
            [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21609] = {
        itemId = 21609,
        name = "Regenerating Belt of Vek'nilash",
        roles = { [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21675] = {
        itemId = 21675,
        name = "Thick Qirajihide Belt",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 2 },
        classes = { [CLASS_ROGUE] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21692] = {
        itemId = 21692,
        name = "Triad Girdle",
        roles = { [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21602] = {
        itemId = 21602,
        name = "Qiraji Execution Bracers",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 3, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21604] = {
        itemId = 21604,
        name = "Bracelets of Royal Redemption",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21611] = {
        itemId = 21611,
        name = "Burrower Bracers",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21618] = {
        itemId = 21618,
        name = "Hive Defiler Wristguards",
        roles = { [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21708] = {
        itemId = 21708,
        name = "Beetle Scaled Wristguards",
        roles = { [ROLE_PROT_PALADIN] = 4, [ROLE_PROT_WARRIOR] = 4, [ROLE_GUARDIAN_DRUID] = 3, [ROLE_HUNTER] = 6,
            [ROLE_RESTO_DRUID] = 6, [ROLE_HOLY_PALADIN] = 6, [ROLE_RESTO_SHAMAN] = 6, [ROLE_ROGUE] = 5,
            [ROLE_FERAL_DRUID] = 5, [ROLE_ENHANCEMENT_SHAMAN] = 5, [ROLE_RETRI_PALADIN] = 5, [ROLE_ELEMENTAL_SHAMAN] = 6,
            [ROLE_BALANCE_DRUID] = 6, [ROLE_ARMS_WARRIOR] = 5 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 2.5,
        replaceable = false,
        removable = false
    },
    [21837] = {
        itemId = 21837,
        name = "Anubisath Warhammer",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_ROGUE] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 3,
            [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 2.5,
        replaceable = true,
        removable = true
    },
    [21838] = {
        itemId = 21838,
        name = "Garb of Royal Ascension",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 5, [ROLE_BALANCE_DRUID] = 5, [ROLE_SHADOW_PRIEST] = 4, [ROLE_MAGE] = 4,
            [ROLE_WARLOCK] = 3 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 2.5,
        replaceable = false,
        removable = false
    },
    [21888] = {
        itemId = 21888,
        name = "Gloves of the Immortal",
        roles = { [ROLE_GUARDIAN_DRUID] = 3, [ROLE_HOLY_PRIEST] = 2, [ROLE_SHADOW_PRIEST] = 2,
            [ROLE_MAGE] = 2, [ROLE_WARLOCK] = 2 },
        classes = { [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2.5,
        replaceable = false,
        removable = true
    },
    [21889] = {
        itemId = 21889,
        name = "Gloves of the Redeemed Prophecy",
        roles = { [ROLE_HOLY_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = false
    },
    [21856] = {
        itemId = 21856,
        name = "Neretzek, The Blood Drinker",
        roles = { [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 2.5,
        replaceable = true,
        removable = true
    },
    [21836] = {
        itemId = 21836,
        name = "Ritssyn's Ring of Chaos",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2,
            [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true,
            [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 2.5,
        replaceable = true,
        removable = true
    },
    [21891] = {
        itemId = 21891,
        name = "Shard of the Fallen Star",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 2,
            [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1,
            [ROLE_ROGUE] = 2, [ROLE_FERAL_DRUID] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 1,
            [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_AHN_QIRAJ_TEMPLE] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 2.5,
        replaceable = true,
        removable = true
    },

    -- QUEST ITEMS
    [21242] = {
        itemId = 21242,
        name = "Blessed Qiraji War Axe",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 21232 } -- Imperial Qiraji Armaments
    },
    [21244] = {
        itemId = 21244,
        name = "Blessed Qiraji Pugio",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 21232 } -- Imperial Qiraji Armaments
    },
    [21268] = {
        itemId = 21268,
        name = "Blessed Qiraji War Hammer",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 21237 } -- Imperial Qiraji Regalia
    },
    [21269] = {
        itemId = 21269,
        name = "Blessed Qiraji Bulwark",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 21232 } -- Imperial Qiraji Armaments
    },
    [21272] = {
        itemId = 21272,
        name = "Blessed Qiraji Musket",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 21232 } -- Imperial Qiraji Armaments
    },
    [21273] = {
        itemId = 21273,
        name = "Blessed Qiraji Acolyte Staff",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 21237 } -- Imperial Qiraji Regalia
    },
    [21275] = {
        itemId = 21275,
        name = "Blessed Qiraji Augur Staff",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 21237 } -- Imperial Qiraji Regalia
    },
    [21329] = {
        itemId = 21329,
        name = "Conqueror's Crown",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20926 } -- Vek'nilash's Circlet
    },
    [21330] = {
        itemId = 21330,
        name = "Conqueror's Spaulders",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20928 } -- Qiraji Bindings of Command
    },
    [21331] = {
        itemId = 21331,
        name = "Conqueror's Breastplate",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20929 } -- Carapace of the Old God
    },
    [21332] = {
        itemId = 21332,
        name = "Conqueror's Legguards",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20927 } -- Ouro's Intact Hide
    },
    [21333] = {
        itemId = 21333,
        name = "Conqueror's Greaves",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20928 } -- Qiraji Bindings of Command
    },
    [21334] = {
        itemId = 21334,
        name = "Doomcaller's Robes",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20933 } -- Husk of the Old God
    },
    [21335] = {
        itemId = 21335,
        name = "Doomcaller's Mantle",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20932 } -- Qiraji Bindings of Dominance
    },
    [21336] = {
        itemId = 21336,
        name = "Doomcaller's Trousers",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20931 } -- Skin of the Great Sandworm
    },
    [21337] = {
        itemId = 21337,
        name = "Doomcaller's Circlet",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20926 } -- Vek'nilash's Circlet
    },
    [21338] = {
        itemId = 21338,
        name = "Doomcaller's Footwraps",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20932 } -- Qiraji Bindings of Dominance
    },
    [21343] = {
        itemId = 21343,
        name = "Enigma Robes",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20933 } -- Husk of the Old God
    },
    [21344] = {
        itemId = 21344,
        name = "Enigma Boots",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20932 } -- Qiraji Bindings of Dominance
    },
    [21345] = {
        itemId = 21345,
        name = "Enigma Shoulderpads",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20932 } -- Qiraji Bindings of Dominance
    },
    [21346] = {
        itemId = 21346,
        name = "Enigma Leggings",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20927 } -- Ouro's Intact Hide
    },
    [21347] = {
        itemId = 21347,
        name = "Enigma Circlet",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20926 } -- Vek'nilash's Circlet
    },
    [21348] = {
        itemId = 21348,
        name = "Tiara of the Oracle",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20926 } -- Vek'nilash's Circlet
    },
    [21349] = {
        itemId = 21349,
        name = "Footwraps of the Oracle",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20928 } -- Qiraji Bindings of Command
    },
    [21350] = {
        itemId = 21350,
        name = "Mantle of the Oracle",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20928 } -- Qiraji Bindings of Command
    },
    [21351] = {
        itemId = 21351,
        name = "Vestments of the Oracle",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20933 } -- Husk of the Old God
    },
    [21352] = {
        itemId = 21352,
        name = "Trousers of the Oracle",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20927 } -- Ouro's Intact Hide
    },
    [21353] = {
        itemId = 21353,
        name = "Genesis Helm",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20930 } -- Vek'lor's Diadem
    },
    [21354] = {
        itemId = 21354,
        name = "Genesis Shoulderpads",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20932 } -- Qiraji Bindings of Dominance
    },
    [21355] = {
        itemId = 21355,
        name = "Genesis Boots",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20932 } -- Qiraji Bindings of Dominance
    },
    [21356] = {
        itemId = 21356,
        name = "Genesis Trousers",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20931 } -- Skin of the Great Sandworm
    },
    [21357] = {
        itemId = 21357,
        name = "Genesis Vest",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20933 } -- Husk of the Old God
    },
    [21359] = {
        itemId = 21359,
        name = "Deathdealer's Boots",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20928 } -- Qiraji Bindings of Command
    },
    [21360] = {
        itemId = 21360,
        name = "Deathdealer's Helm",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20930 } -- Vek'lor's Diadem
    },
    [21361] = {
        itemId = 21361,
        name = "Deathdealer's Spaulders",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20928 } -- Qiraji Bindings of Command
    },
    [21362] = {
        itemId = 21362,
        name = "Deathdealer's Leggings",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20927 } -- Ouro's Intact Hide
    },
    [21364] = {
        itemId = 21364,
        name = "Deathdealer's Vest",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20929 } -- Carapace of the Old God
    },
    [21365] = {
        itemId = 21365,
        name = "Striker's Footguards",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20928 } -- Qiraji Bindings of Command
    },
    [21366] = {
        itemId = 21366,
        name = "Striker's Diadem",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20930 } -- Vek'lor's Diadem
    },
    [21367] = {
        itemId = 21367,
        name = "Striker's Pauldrons",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20928 } -- Qiraji Bindings of Command
    },
    [21368] = {
        itemId = 21368,
        name = "Striker's Leggings",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20931 } -- Skin of the Great Sandworm
    },
    [21370] = {
        itemId = 21370,
        name = "Striker's Hauberk",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20929 } -- Carapace of the Old God
    },
    [21372] = {
        itemId = 21372,
        name = "Stormcaller's Diadem",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20930 } -- Vek'lor's Diadem
    },
    [21373] = {
        itemId = 21373,
        name = "Stormcaller's Footguards",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20932 } -- Qiraji Bindings of Dominance
    },
    [21374] = {
        itemId = 21374,
        name = "Stormcaller's Hauberk",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20929 } -- Carapace of the Old God
    },
    [21375] = {
        itemId = 21375,
        name = "Stormcaller's Leggings",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20931 } -- Skin of the Great Sandworm
    },
    [21376] = {
        itemId = 21376,
        name = "Stormcaller's Pauldrons",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20932 } -- Qiraji Bindings of Dominance
    },
    [21387] = {
        itemId = 21387,
        name = "Avenger's Crown",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20930 } -- Vek'lor's Diadem
    },
    [21388] = {
        itemId = 21388,
        name = "Avenger's Greaves",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20932 } -- Qiraji Bindings of Dominance
    },
    [21389] = {
        itemId = 21389,
        name = "Avenger's Breastplate",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20929 } -- Carapace of the Old God
    },
    [21390] = {
        itemId = 21390,
        name = "Avenger's Legguards",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20931 } -- Skin of the Great Sandworm
    },
    [21391] = {
        itemId = 21391,
        name = "Avenger's Pauldrons",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 20932 } -- Qiraji Bindings of Dominance
    },
    [21709] = {
        itemId = 21709,
        name = "Ring of the Fallen God",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 21221 } -- Eye of C'Thun
    },
    [21710] = {
        itemId = 21710,
        name = "Cloak of the Fallen God",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 21221 } -- Eye of C'Thun
    },
    [21712] = {
        itemId = 21712,
        name = "Amulet of the Fallen God",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 21221 } -- Eye of C'Thun
    },
    
    -- NAXXRAMAS
    [22349] = {
        itemId = 22349,
        name = "Desecrated Breastplate",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_ROGUE] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22350] = {
        itemId = 22350,
        name = "Desecrated Tunic",
        roles = { [ROLE_HUNTER] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22351] = {
        itemId = 22351,
        name = "Desecrated Robe",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22352] = {
        itemId = 22352,
        name = "Desecrated Legplates",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_ROGUE] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22353] = {
        itemId = 22353,
        name = "Desecrated Helmet",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_ROGUE] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22354] = {
        itemId = 22354,
        name = "Desecrated Pauldrons",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_ROGUE] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22355] = {
        itemId = 22355,
        name = "Desecrated Bracers",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_ROGUE] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22356] = {
        itemId = 22356,
        name = "Desecrated Waistguard",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_ROGUE] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22357] = {
        itemId = 22357,
        name = "Desecrated Gauntlets",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_ROGUE] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22358] = {
        itemId = 22358,
        name = "Desecrated Sabatons",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_ROGUE] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22359] = {
        itemId = 22359,
        name = "Desecrated Legguards",
        roles = { [ROLE_HUNTER] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22360] = {
        itemId = 22360,
        name = "Desecrated Headpiece",
        roles = { [ROLE_HUNTER] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22361] = {
        itemId = 22361,
        name = "Desecrated Spaulders",
        roles = { [ROLE_HUNTER] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22362] = {
        itemId = 22362,
        name = "Desecrated Wristguards",
        roles = { [ROLE_HUNTER] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22363] = {
        itemId = 22363,
        name = "Desecrated Girdle",
        roles = { [ROLE_HUNTER] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22364] = {
        itemId = 22364,
        name = "Desecrated Handguards",
        roles = { [ROLE_HUNTER] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22365] = {
        itemId = 22365,
        name = "Desecrated Boots",
        roles = { [ROLE_HUNTER] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22366] = {
        itemId = 22366,
        name = "Desecrated Leggings",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22367] = {
        itemId = 22367,
        name = "Desecrated Circlet",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22368] = {
        itemId = 22368,
        name = "Desecrated Shoulderpads",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22369] = {
        itemId = 22369,
        name = "Desecrated Bindings",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22370] = {
        itemId = 22370,
        name = "Desecrated Belt",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22371] = {
        itemId = 22371,
        name = "Desecrated Gloves",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22372] = {
        itemId = 22372,
        name = "Desecrated Sandals",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22520] = {
        itemId = 22520,
        name = "The Phylactery of Kel'Thuzad",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_PROT_WARRIOR] = 3, [ROLE_GUARDIAN_DRUID] = 3, [ROLE_HUNTER] = 2,
            [ROLE_HOLY_PRIEST] = 4, [ROLE_RESTO_DRUID] = 4, [ROLE_HOLY_PALADIN] = 4, [ROLE_RESTO_SHAMAN] = 4,
            [ROLE_ROGUE] = 2, [ROLE_FERAL_DRUID] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2,
            [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 2, [ROLE_MAGE] = 2,
            [ROLE_WARLOCK] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [22691] = {
        itemId = 22691,
        name = "Corrupted Ashbringer",
        roles = { [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [22726] = {
        itemId = 22726,
        name = "Splinter of Atiesh",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_FERAL_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 2,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 3.5,
        replaceable = true,
        removable = true,
        repeatable = true
    },
    [22798] = {
        itemId = 22798,
        name = "Might of Menethil",
        roles = { [ROLE_FERAL_DRUID] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 3.5,
        replaceable = true,
        removable = true
    },
    [22799] = {
        itemId = 22799,
        name = "Soulseeker",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 3.5,
        replaceable = true,
        removable = true
    },
    [22800] = {
        itemId = 22800,
        name = "Brimstone Staff",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [22801] = {
        itemId = 22801,
        name = "Spire of Twilight",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [22802] = {
        itemId = 22802,
        name = "Kingsfall",
        roles = { [ROLE_HUNTER] = 3, [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 3.5,
        replaceable = true,
        removable = true
    },
    [22803] = {
        itemId = 22803,
        name = "Midnight Haze",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [22804] = {
        itemId = 22804,
        name = "Maexxna's Fang",
        roles = { [ROLE_HUNTER] = 3, [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [22806] = {
        itemId = 22806,
        name = "Widow's Remorse",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_RETRI_PALADIN] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [22807] = {
        itemId = 22807,
        name = "Wraith Blade",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_HOLY_PALADIN] = 3, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [22808] = {
        itemId = 22808,
        name = "The Castigator",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_ROGUE] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 3,
            [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [22809] = {
        itemId = 22809,
        name = "Maul of the Redeemed Crusader",
        roles = { [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [22810] = {
        itemId = 22810,
        name = "Toxin Injector",
        roles = { [ROLE_PROT_WARRIOR] = 2, [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 3, [ROLE_ARMS_WARRIOR] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [22811] = {
        itemId = 22811,
        name = "Soulstring",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [22812] = {
        itemId = 22812,
        name = "Nerubian Slavemaker",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 3.5,
        replaceable = true,
        removable = true
    },
    [22813] = {
        itemId = 22813,
        name = "Claymore of Unholy Might",
        roles = { [ROLE_HUNTER] = 2, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [22815] = {
        itemId = 22815,
        name = "Severance",
        roles = { [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [22816] = {
        itemId = 22816,
        name = "Hatchet of Sundered Bone",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_PROT_WARRIOR] = 3, [ROLE_HUNTER] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 4, 
            [ROLE_RETRI_PALADIN] = 4, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [22818] = {
        itemId = 22818,
        name = "The Plague Bearer",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2,
            [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [22819] = {
        itemId = 22819,
        name = "Shield of Condemnation",
        roles = { [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 3.5,
        replaceable = true,
        removable = true
    },
    [22820] = {
        itemId = 22820,
        name = "Wand of Fates",
        roles = { [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [22821] = {
        itemId = 22821,
        name = "Doomfinger",
        roles = { [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 3.5,
        replaceable = true,
        removable = true
    },
    [22935] = {
        itemId = 22935,
        name = "Touch of Frost",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 4, [ROLE_HOLY_PRIEST] = 5,
            [ROLE_RESTO_DRUID] = 5, [ROLE_HOLY_PALADIN] = 5, [ROLE_RESTO_SHAMAN] = 5, [ROLE_ROGUE] = 3, [ROLE_FERAL_DRUID] = 3,
            [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_RETRI_PALADIN] = 3, [ROLE_ELEMENTAL_SHAMAN] = 4, [ROLE_BALANCE_DRUID] = 4, [ROLE_SHADOW_PRIEST] = 4,
            [ROLE_MAGE] = 4, [ROLE_WARLOCK] = 4, [ROLE_ARMS_WARRIOR] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 3,
        replaceable = false,
        removable = false
    },
    [22936] = {
        itemId = 22936,
        name = "Wristguards of Vengeance",
        roles = { [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22937] = {
        itemId = 22937,
        name = "Gem of Nerubis",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [22938] = {
        itemId = 22938,
        name = "Cryptfiend Silk Cloak",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22939] = {
        itemId = 22939,
        name = "Band of Unanswered Prayers",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22940] = {
        itemId = 22940,
        name = "Icebane Pauldrons",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 3,
        replaceable = false,
        removable = false
    },
    [22941] = {
        itemId = 22941,
        name = "Polar Shoulder Pads",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_ROGUE] = 3, [ROLE_FERAL_DRUID] = 3 },
        classes = { [CLASS_ROGUE] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 3,
        replaceable = false,
        removable = false
    },
    [22942] = {
        itemId = 22942,
        name = "The Widow's Embrace",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [22943] = {
        itemId = 22943,
        name = "Malice Stone Pendant",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22947] = {
        itemId = 22947,
        name = "Pendant of Forgotten Names",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22954] = {
        itemId = 22954,
        name = "Kiss of the Spider",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 1,
            [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1,
            [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [22960] = {
        itemId = 22960,
        name = "Cloak of Suturing",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22961] = {
        itemId = 22961,
        name = "Band of Reanimation",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1 },
        classes = { [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22967] = {
        itemId = 22967,
        name = "Icy Scale Spaulders",
        roles = { [ROLE_HUNTER] = 4, [ROLE_ENHANCEMENT_SHAMAN] = 3 },
        classes = { [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 3,
        replaceable = false,
        removable = false
    },
    [22968] = {
        itemId = 22968,
        name = "Glacial Mantle",
        roles = { [ROLE_HOLY_PRIEST] = 5, [ROLE_SHADOW_PRIEST] = 4, [ROLE_MAGE] = 4, [ROLE_WARLOCK] = 4,
            [ROLE_HOLY_PALADIN] = 5, [ROLE_RESTO_DRUID] = 5, [ROLE_BALANCE_DRUID] = 4, [ROLE_RESTO_SHAMAN] = 5,
            [ROLE_ELEMENTAL_SHAMAN] = 4 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true, [CLASS_PALADIN] = true,
            [CLASS_DRUID] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 3,
        replaceable = false,
        removable = false
    },
    [22981] = {
        itemId = 22981,
        name = "Gluth's Missing Collar",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22983] = {
        itemId = 22983,
        name = "Rime Covered Mantle",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [22988] = {
        itemId = 22988,
        name = "The End of Dreams",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1,
            [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [22994] = {
        itemId = 22994,
        name = "Digested Hand of Power",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2,
            [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [23000] = {
        itemId = 23000,
        name = "Plated Abomination Ribcage",
        roles = { [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23001] = {
        itemId = 23001,
        name = "Eye of Diminution",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 2, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [23004] = {
        itemId = 23004,
        name = "Idol of Longevity",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_RESTO_DRUID] = 1, [ROLE_FERAL_DRUID] = 2, [ROLE_BALANCE_DRUID] = 2 },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [23005] = {
        itemId = 23005,
        name = "Totem of Flowing Water",
        roles = { [ROLE_RESTO_SHAMAN] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 2 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [23006] = {
        itemId = 23006,
        name = "Libram of Light",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_HOLY_PALADIN] = 1, [ROLE_RETRI_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [23009] = {
        itemId = 23009,
        name = "Wand of the Whispering Dead",
        roles = { [ROLE_HOLY_PRIEST] = 1 },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [23014] = {
        itemId = 23014,
        name = "Iblis, Blade of the Fallen Seraph",
        roles = { [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 1, [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [23017] = {
        itemId = 23017,
        name = "Veil of Eclipse",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23018] = {
        itemId = 23018,
        name = "Signet of the Fallen Defender",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23019] = {
        itemId = 23019,
        name = "Icebane Helmet",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 3,
        replaceable = false,
        removable = false
    },
    [23020] = {
        itemId = 23020,
        name = "Polar Helmet",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_ROGUE] = 3, [ROLE_FERAL_DRUID] = 3 },
        classes = { [CLASS_ROGUE] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 3,
        replaceable = false,
        removable = false
    },
    [23021] = {
        itemId = 23021,
        name = "The Soul Harvester's Bindings",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23023] = {
        itemId = 23023,
        name = "Sadist's Collar",
        roles = { [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1,
            [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23025] = {
        itemId = 23025,
        name = "Seal of the Damned",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23027] = {
        itemId = 23027,
        name = "Warmth of Forgiveness",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [23028] = {
        itemId = 23028,
        name = "Hailstone Band",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 4,
            [ROLE_HOLY_PRIEST] = 5, [ROLE_RESTO_DRUID] = 5, [ROLE_HOLY_PALADIN] = 5, [ROLE_RESTO_SHAMAN] = 5,
            [ROLE_ROGUE] = 3, [ROLE_FERAL_DRUID] = 3, [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_RETRI_PALADIN] = 3,
            [ROLE_ELEMENTAL_SHAMAN] = 4, [ROLE_BALANCE_DRUID] = 4, [ROLE_SHADOW_PRIEST] = 4, [ROLE_MAGE] = 4,
            [ROLE_WARLOCK] = 4, [ROLE_ARMS_WARRIOR] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 3,
        replaceable = false,
        removable = false
    },
    [23029] = {
        itemId = 23029,
        name = "Noth's Frigid Heart",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [23030] = {
        itemId = 23030,
        name = "Cloak of the Scourge",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1,
            [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23031] = {
        itemId = 23031,
        name = "Band of the Inevitable",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23032] = {
        itemId = 23032,
        name = "Glacial Headdress",
        roles = { [ROLE_HOLY_PRIEST] = 5, [ROLE_RESTO_DRUID] = 5, [ROLE_HOLY_PALADIN] = 5, [ROLE_RESTO_SHAMAN] = 5,
            [ROLE_ELEMENTAL_SHAMAN] = 4, [ROLE_BALANCE_DRUID] = 4, [ROLE_SHADOW_PRIEST] = 4, [ROLE_MAGE] = 4,
            [ROLE_WARLOCK] = 4 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true,
            [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 3,
        replaceable = false,
        removable = false
    },
    [23033] = {
        itemId = 23033,
        name = "Icy Scale Coif",
        roles = { [ROLE_HUNTER] = 4, [ROLE_ENHANCEMENT_SHAMAN] = 3 },
        classes = { [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 3,
        replaceable = false,
        removable = false
    },
    [23035] = {
        itemId = 23035,
        name = "Preceptor's Hat",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23036] = {
        itemId = 23036,
        name = "Necklace of Necropsy",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23037] = {
        itemId = 23037,
        name = "Ring of Spiritual Fervor",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1,
            [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true,
            [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23038] = {
        itemId = 23038,
        name = "Band of Unnatural Forces",
        roles = { [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1,
            [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23039] = {
        itemId = 23039,
        name = "The Eye of Nerub",
        roles = { [ROLE_HUNTER] = 1 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [23040] = {
        itemId = 23040,
        name = "Glyph of Deflection",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [23041] = {
        itemId = 23041,
        name = "Slayer's Crest",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1,
            [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [23042] = {
        itemId = 23042,
        name = "Loatheb's Reflection",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 4, [ROLE_HOLY_PRIEST] = 5,
            [ROLE_RESTO_DRUID] = 5, [ROLE_HOLY_PALADIN] = 5, [ROLE_RESTO_SHAMAN] = 5, [ROLE_ROGUE] = 3, [ROLE_FERAL_DRUID] = 3,
            [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_RETRI_PALADIN] = 3, [ROLE_ELEMENTAL_SHAMAN] = 4, [ROLE_BALANCE_DRUID] = 4, [ROLE_SHADOW_PRIEST] = 4,
            [ROLE_MAGE] = 4, [ROLE_WARLOCK] = 4, [ROLE_ARMS_WARRIOR] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 3,
        replaceable = false,
        removable = false
    },
    [23043] = {
        itemId = 23043,
        name = "The Face of Death",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [23044] = {
        itemId = 23044,
        name = "Harbinger of Doom",
        roles = { [ROLE_HUNTER] = 3, [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [23045] = {
        itemId = 23045,
        name = "Shroud of Dominion",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1,
            [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23046] = {
        itemId = 23046,
        name = "The Restrained Essence of Sapphiron",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [23047] = {
        itemId = 23047,
        name = "Eye of the Dead",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [23048] = {
        itemId = 23048,
        name = "Sapphiron's Right Eye",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [23049] = {
        itemId = 23049,
        name = "Sapphiron's Left Eye",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [23050] = {
        itemId = 23050,
        name = "Cloak of the Necropolis",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23053] = {
        itemId = 23053,
        name = "Stormrage's Talisman of Seething",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1,
            [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 3.5,
        replaceable = true,
        removable = false
    },
    [23054] = {
        itemId = 23054,
        name = "Gressil, Dawn of Ruin",
        roles = { [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 3.5,
        replaceable = true,
        removable = true
    },
    [23056] = {
        itemId = 23056,
        name = "Hammer of the Twisting Nether",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 3.5,
        replaceable = true,
        removable = true
    },
    [23057] = {
        itemId = 23057,
        name = "Gem of Trapped Innocents",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 3.5,
        replaceable = true,
        removable = false
    },
    [23059] = {
        itemId = 23059,
        name = "Ring of the Dreadnaught",
        roles = { [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23060] = {
        itemId = 23060,
        name = "Bonescythe Ring",
        roles = { [ROLE_ROGUE] = 1 },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23061] = {
        itemId = 23061,
        name = "Ring of Faith",
        roles = { [ROLE_HOLY_PRIEST] = 1 },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23062] = {
        itemId = 23062,
        name = "Frostfire Ring",
        roles = { [ROLE_MAGE] = 1 },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23063] = {
        itemId = 23063,
        name = "Plagueheart Ring",
        roles = { [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23064] = {
        itemId = 23064,
        name = "Ring of the Dreamwalker",
        roles = { [ROLE_RESTO_DRUID] = 1 },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23065] = {
        itemId = 23065,
        name = "Ring of the Earthshatterer",
        roles = { [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23066] = {
        itemId = 23066,
        name = "Ring of Redemption",
        roles = { [ROLE_HOLY_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23067] = {
        itemId = 23067,
        name = "Ring of the Cryptstalker",
        roles = { [ROLE_HUNTER] = 1 },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23068] = {
        itemId = 23068,
        name = "Legplates of Carnage",
        roles = { [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23069] = {
        itemId = 23069,
        name = "Necro-Knight's Garb",
        roles = { [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23070] = {
        itemId = 23070,
        name = "Leggings of Polarity",
        roles = { [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23071] = {
        itemId = 23071,
        name = "Leggings of Apocalypse",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 2 },
        classes = { [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23073] = {
        itemId = 23073,
        name = "Boots of Displacement",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1 },
        classes = { [CLASS_ROGUE] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23075] = {
        itemId = 23075,
        name = "Death's Bargain",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 3 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23219] = {
        itemId = 23219,
        name = "Girdle of the Mentor",
        roles = { [ROLE_PROT_WARRIOR] = 2, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23220] = {
        itemId = 23220,
        name = "Crystal Webbed Robe",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23221] = {
        itemId = 23221,
        name = "Misplaced Servo Arm",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_ROGUE] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 3,
            [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [23226] = {
        itemId = 23226,
        name = "Ghoul Skin Tunic",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_ARMS_WARRIOR] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23237] = {
        itemId = 23237,
        name = "Ring of the Eternal Flame",
        roles = { [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23238] = {
        itemId = 23238,
        name = "Stygian Buckler",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_PROT_WARRIOR] = 3, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 3,
            [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_RETRI_PALADIN] = 3, [ROLE_ELEMENTAL_SHAMAN] = 3, [ROLE_ARMS_WARRIOR] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [23242] = {
        itemId = 23242,
        name = "Claw of the Frost Wyrm",
        roles = { [ROLE_PROT_WARRIOR] = 3, [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 2,
        tier = 3,
        replaceable = true,
        removable = true
    },
    [23545] = {
        itemId = 23545,
        name = "Power of the Scourge",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1,
            [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true,
            [CLASS_MAGE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slotSize = 1,
        tier = 3,
        replaceable = false,
        removable = true,
        repeatable = true
    },
    [23547] = {
        itemId = 23547,
        name = "Resilience of the Scourge",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slotSize = 1,
        tier = 3,
        replaceable = false,
        removable = true,
        repeatable = true
    },
    [23548] = {
        itemId = 23548,
        name = "Might of the Scourge",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1,
            [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slotSize = 1,
        tier = 3,
        replaceable = false,
        removable = true,
        repeatable = true
    },
    [23549] = {
        itemId = 23549,
        name = "Fortitude of the Scourge",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slotSize = 1,
        tier = 3,
        replaceable = false,
        removable = true,
        repeatable = true
    },
    [23577] = {
        itemId = 23577,
        name = "The Hungering Cold",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 3.5,
        replaceable = true,
        removable = true
    },
    [23663] = {
        itemId = 23663,
        name = "Girdle of Elemental Fury",
        roles = { [ROLE_RESTO_SHAMAN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23664] = {
        itemId = 23664,
        name = "Pauldrons of Elemental Fury",
        roles = { [ROLE_RESTO_SHAMAN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23665] = {
        itemId = 23665,
        name = "Leggings of Elemental Fury",
        roles = { [ROLE_RESTO_SHAMAN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23666] = {
        itemId = 23666,
        name = "Belt of the Grand Crusader",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_HOLY_PALADIN] = 2, [ROLE_RETRI_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23667] = {
        itemId = 23667,
        name = "Spaulders of the Grand Crusader",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_RETRI_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    [23668] = {
        itemId = 23668,
        name = "Leggings of the Grand Crusader",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_RETRI_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_NAXXRAMAS] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 3,
        replaceable = true,
        removable = false
    },
    
    -- QUEST ITEMS
    [22476] = {
        itemId = 22476,
        name = "Bonescythe Breastplate",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22349 } -- Desecrated Breastplate
    },
    [22416] = {
        itemId = 22416,
        name = "Dreadnaught Breastplate",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22349 } -- Desecrated Breastplate
    },
    [22436] = {
        itemId = 22436,
        name = "Cryptstalker Tunic",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22350 } -- Desecrated Tunic
    },
    [22488] = {
        itemId = 22488,
        name = "Dreamwalker Tunic",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22350 } -- Desecrated Tunic
    },
    [22464] = {
        itemId = 22464,
        name = "Earthshatter Tunic",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22350 } -- Desecrated Tunic
    },
    [22425] = {
        itemId = 22425,
        name = "Redemption Tunic",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22350 } -- Desecrated Tunic
    },
    [22496] = {
        itemId = 22496,
        name = "Frostfire Robe",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22351 } -- Desecrated Robe
    },
    [22504] = {
        itemId = 22504,
        name = "Plagueheart Robe",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22351 } -- Desecrated Robe
    },
    [22512] = {
        itemId = 22512,
        name = "Robe of Faith",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22351 } -- Desecrated Robe
    },
    [22477] = {
        itemId = 22477,
        name = "Bonescythe Legplates",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22352 } -- Desecrated Legplates
    },
    [22417] = {
        itemId = 22417,
        name = "Dreadnaught Legplates",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22352 } -- Desecrated Legplates
    },
    [22478] = {
        itemId = 22478,
        name = "Bonescythe Helmet",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22353 } -- Desecrated Helmet
    },
    [22418] = {
        itemId = 22418,
        name = "Dreadnaught Helmet",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22353 } -- Desecrated Helmet
    },
    [22479] = {
        itemId = 22479,
        name = "Bonescythe Pauldrons",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22354 } -- Desecrated Pauldrons
    },
    [22419] = {
        itemId = 22419,
        name = "Dreadnaught Pauldrons",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22354 } -- Desecrated Pauldrons
    },
    [22483] = {
        itemId = 22483,
        name = "Bonescythe Bracers",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22355 } -- Desecrated Bracers
    },
    [22423] = {
        itemId = 22423,
        name = "Dreadnaught Bracers",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22355 } -- Desecrated Bracers
    },
    [22482] = {
        itemId = 22482,
        name = "Bonescythe Waistguard",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22356 } -- Desecrated Waistguard
    },
    [22422] = {
        itemId = 22422,
        name = "Dreadnaught Waistguard",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22356 } -- Desecrated Waistguard
    },
    [22481] = {
        itemId = 22481,
        name = "Bonescythe Gauntlets",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22357 } -- Desecrated Gauntlets
    },
    [22421] = {
        itemId = 22421,
        name = "Dreadnaught Gauntlets",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22357 } -- Desecrated Gauntlets
    },
    [22480] = {
        itemId = 22480,
        name = "Bonescythe Sabatons",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22358 } -- Desecrated Sabatons
    },
    [22420] = {
        itemId = 22420,
        name = "Dreadnaught Sabatons",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22358 } -- Desecrated Sabatons
    },
    [22437] = {
        itemId = 22437,
        name = "Cryptstalker Legguards",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22359 } -- Desecrated Legguards
    },
    [22489] = {
        itemId = 22489,
        name = "Dreamwalker Legguards",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22359 } -- Desecrated Legguards
    },
    [22465] = {
        itemId = 22465,
        name = "Earthshatter Legguards",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22359 } -- Desecrated Legguards
    },
    [22427] = {
        itemId = 22427,
        name = "Redemption Legguards",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22359 } -- Desecrated Legguards
    },
    [22438] = {
        itemId = 22438,
        name = "Cryptstalker Headpiece",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22360 } -- Desecrated Headpiece
    },
    [22490] = {
        itemId = 22490,
        name = "Dreamwalker Headpiece",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22360 } -- Desecrated Headpiece
    },
    [22466] = {
        itemId = 22466,
        name = "Earthshatter Headpiece",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22360 } -- Desecrated Headpiece
    },
    [22428] = {
        itemId = 22428,
        name = "Redemption Headpiece",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22360 } -- Desecrated Headpiece
    },
    [22439] = {
        itemId = 22439,
        name = "Cryptstalker Spaulders",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22361 } -- Desecrated Spaulders
    },
    [22491] = {
        itemId = 22491,
        name = "Dreamwalker Spaulders",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22361 } -- Desecrated Spaulders
    },
    [22467] = {
        itemId = 22467,
        name = "Earthshatter Spaulders",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22361 } -- Desecrated Spaulders
    },
    [22429] = {
        itemId = 22429,
        name = "Redemption Spaulders",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22361 } -- Desecrated Spaulders
    },
    [22443] = {
        itemId = 22443,
        name = "Cryptstalker Wristguards",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22362 } -- Desecrated Wristguards
    },
    [22495] = {
        itemId = 22495,
        name = "Dreamwalker Wristguards",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22362 } -- Desecrated Wristguards
    },
    [22471] = {
        itemId = 22471,
        name = "Earthshatter Wristguards",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22362 } -- Desecrated Wristguards
    },
    [22424] = {
        itemId = 22424,
        name = "Redemption Wristguards",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22362 } -- Desecrated Wristguards
    },
    [22442] = {
        itemId = 22442,
        name = "Cryptstalker Girdle",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22363 } -- Desecrated Girdle
    },
    [22494] = {
        itemId = 22494,
        name = "Dreamwalker Girdle",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22363 } -- Desecrated Girdle
    },
    [22470] = {
        itemId = 22470,
        name = "Earthshatter Girdle",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22363 } -- Desecrated Girdle
    },
    [22431] = {
        itemId = 22431,
        name = "Redemption Girdle",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22363 } -- Desecrated Girdle
    },
    [22441] = {
        itemId = 22441,
        name = "Cryptstalker Handguards",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22364 } -- Desecrated Handguards
    },
    [22493] = {
        itemId = 22493,
        name = "Dreamwalker Handguards",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22364 } -- Desecrated Handguards
    },
    [22469] = {
        itemId = 22469,
        name = "Earthshatter Handguards",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22364 } -- Desecrated Handguards
    },
    [22426] = {
        itemId = 22426,
        name = "Redemption Handguards",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22364 } -- Desecrated Handguards
    },
    [22440] = {
        itemId = 22440,
        name = "Cryptstalker Boots",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22365 } -- Desecrated Boots
    },
    [22492] = {
        itemId = 22492,
        name = "Dreamwalker Boots",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22365 } -- Desecrated Boots
    },
    [22468] = {
        itemId = 22468,
        name = "Earthshatter Boots",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22365 } -- Desecrated Boots
    },
    [22430] = {
        itemId = 22430,
        name = "Redemption Boots",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22365 } -- Desecrated Boots
    },
    [22497] = {
        itemId = 22497,
        name = "Frostfire Leggings",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22366 } -- Desecrated Leggings
    },
    [22513] = {
        itemId = 22513,
        name = "Leggings of Faith",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22366 } -- Desecrated Leggings
    },
    [22505] = {
        itemId = 22505,
        name = "Plagueheart Leggings",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22366 } -- Desecrated Leggings
    },
    [22514] = {
        itemId = 22514,
        name = "Circlet of Faith",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22367 } -- Desecrated Circlet
    },
    [22498] = {
        itemId = 22498,
        name = "Frostfire Circlet",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22367 } -- Desecrated Circlet
    },
    [22506] = {
        itemId = 22506,
        name = "Plagueheart Circlet",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22367 } -- Desecrated Circlet
    },
    [22499] = {
        itemId = 22499,
        name = "Frostfire Shoulderpads",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22368 } -- Desecrated Shoulderpads
    },
    [22507] = {
        itemId = 22507,
        name = "Plagueheart Shoulderpads",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22368 } -- Desecrated Shoulderpads
    },
    [22515] = {
        itemId = 22515,
        name = "Shoulderpads of Faith",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22368 } -- Desecrated Shoulderpads
    },
    [22519] = {
        itemId = 22519,
        name = "Bindings of Faith",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22369 } -- Desecrated Bindings
    },
    [22503] = {
        itemId = 22503,
        name = "Frostfire Bindings",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22369 } -- Desecrated Bindings
    },
    [22511] = {
        itemId = 22511,
        name = "Plagueheart Bindings",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22369 } -- Desecrated Bindings
    },
    [22518] = {
        itemId = 22518,
        name = "Belt of Faith",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22370 } -- Desecrated Belt
    },
    [22502] = {
        itemId = 22502,
        name = "Frostfire Belt",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22370 } -- Desecrated Belt
    },
    [22510] = {
        itemId = 22510,
        name = "Plagueheart Belt",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22370 } -- Desecrated Belt
    },
    [22501] = {
        itemId = 22501,
        name = "Frostfire Gloves",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22371 } -- Desecrated Gloves
    },
    [22517] = {
        itemId = 22517,
        name = "Gloves of Faith",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22371 } -- Desecrated Gloves
    },
    [22509] = {
        itemId = 22509,
        name = "Plagueheart Gloves",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22371 } -- Desecrated Gloves
    },
    [22500] = {
        itemId = 22500,
        name = "Frostfire Sandals",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22372 } -- Desecrated Sandals
    },
    [22508] = {
        itemId = 22508,
        name = "Plagueheart Sandals",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22372 } -- Desecrated Sandals
    },
    [22516] = {
        itemId = 22516,
        name = "Sandals of Faith",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22372 } -- Desecrated Sandals
    },
    [23206] = {
        itemId = 23206,
        name = "Mark of the Champion",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22520 } -- The Phylactery of Kel'Thuzad
    },
    [23207] = {
        itemId = 23207,
        name = "Mark of the Champion",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22520 } -- The Phylactery of Kel'Thuzad
    },
    [22630] = {
        itemId = 22630,
        name = "Atiesh, Greatstaff of the Guardian",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22726 } -- Splinter of Atiesh
    },
    [22631] = {
        itemId = 22631,
        name = "Atiesh, Greatstaff of the Guardian",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22726 } -- Splinter of Atiesh
    },
    [22632] = {
        itemId = 22632,
        name = "Atiesh, Greatstaff of the Guardian",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22726 } -- Splinter of Atiesh
    },
    [22589] = {
        itemId = 22589,
        name = "Atiesh, Greatstaff of the Guardian",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 22726 } -- Splinter of Atiesh
    },
--    [18422] = {
--        itemId = 18422,
--        name = "Head of Onyxia",
--        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 1, [ROLE_HOLY_PRIEST] = 3,
--            [ROLE_RESTO_DRUID] = 3, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 3, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
--            [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 3,
--            [ROLE_MAGE] = 2, [ROLE_WARLOCK] = 2, [ROLE_ARMS_WARRIOR] = 1 },
--        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
--            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
--        raids = { [RAID_ONYXIA] = true },
--        slot = SLOT_FINGERS,
--        slotSize = 1,
--        tier = 1,
--        replaceable = true,
--        removable = true
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
-- Returns the item with the given itemId or name, or nil if no such item could be found.
--
-- @param #string arg
--          the itemId or name
--
-- @return #Item
--          the item
--
Items.get = function(arg)
    if (not arg) then
        print("> No item id or name specified.")
    else
        local itemId = tonumber(arg) -- will be nil if not a number
        local item
        if (itemId) then
            item = ITEM_LIST[itemId]
        else
            item = Items.forName(arg)
        end

        if (not item) then
            print("> Item with itemId or name '"..arg.."' not found.")
        end
        return item
    end
end

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
-- Returns a short version of the given item name as symbol.
-- 
-- @param #string itemName
--          the name of the item
-- 
-- @return #string
--          a symbol representing the item name
-- 
Items.getSymbol = function(itemName)
    if (itemName) then
        local parts = { strsplit(" ", itemName) }
        local symbol = ""
        for _, part in ipairs(parts) do
            symbol = symbol..strsub(part, 1, 1)
        end
        return symbol
    end
    return ""
end

---
-- Returns whether the item with the given itemId is considered a 'junk' or 'trash' item.
--
-- @param #number itemId
--          the itemId of the item to be checked
--
-- @return #boolean
--          true if the item is a junk item, false otherwise
--
Items.isJunk = function(itemId)
    if (not itemId or ITEM_LIST[itemId]) then
        return false
    end

    local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount,
        itemEquipLoc, itemIcon, itemSellPrice, itemClassID, itemSubClassID, bindType, expacID, itemSetID,
        isCraftingReagent = GetItemInfo(itemId)

    -- bind on pickup
    if (bindType == 1) then
        return false
    end

    -- should be common or rare quality
    if (itemRarity == 2 or itemRarity == 3) then
        if (-- junk class
            (itemClassID == 15 and itemSubClassID == 0) or
            -- trade goods
            (itemClassID == 7 and itemSubClassID == 0) or
            -- bags
            (itemClassID == 1 and itemSubClassID == 0) or
            -- green reagent
            (itemClassID == 5 and itemSubClassID == 0 and itemRarity == 2) or
            -- books
            (itemClassID == 9 and itemSubClassID == 0) or
            -- not bound quest items
            (itemClassID == 12 and bindType == 0)
            ) then
            return true
        end
        -- exclude recipes
        if (itemClassID == 9) then
            return false
        end
        -- bind on equip
        if (bindType == 2) then
            return true
        end
    end
    return false
end

---
-- Parses the given chat messages and extracts all item links found, returning
-- the itemIds of all items.
-- 
-- @param #string msg
--          the chat message text
-- @param #number count
--          the number of items to return (optional)
-- 
-- @return #number
--          an unpacked list of itemIds
-- 
Items.getItemIdsFromChat = function(msg, count)
    count = count or 50
    local found = 0
    local itemIds = {}
    if (msg) then
        local itemLinkParts = { strsplit("|", msg) }
        for _, part in ipairs(itemLinkParts) do
            local itemString = strmatch(part, "Hitem:%d+:")
            if (itemString) then
                local _, itemIdPart = strsplit(":", itemString, 3)
                if (itemIdPart) then
                    local itemId = tonumber(itemIdPart)
                    if (itemId) then
                        table.insert(itemIds, itemId)
                        found = found + 1
                        if (found >= count) then
                            break
                        end
                    end
                end
            end
        end
    end
    return unpack(itemIds)
end

---
-- Returns a map (itemId -> item) of Item's that are currently in the loot window.
--
-- @return #table
--          a map of Item's in the loot window
--
Items.getLootItems = function()
    local items = {}
    local lootCount = GetNumLootItems()
    for index = 1, lootCount do
        local itemLink = GetLootSlotLink(index)
        if (itemLink) then
            local itemId = GetItemInfoInstant(itemLink)
            if (itemId) then
                items[itemId] = ITEM_LIST[itemId]
            end
        end
    end
    return items
end

---
-- Returns a map [itemId -> item] of the raid items from the current player's
-- inventory and bags.
--
-- @return #map
--          the items in the inventory
--
Items.getInventoryItems = function()
    local items = {}
    -- check the inventory of the player
    for invSlot = 1, 19, 1 do
        local itemId = GetInventoryItemID("player", invSlot)
        if (itemId) then
            local item = ITEM_LIST[itemId]
            if (item) then
                items[itemId] = item
            end
        end
    end
    -- check all bags
    for bagId = 0, 4, 1 do
        for slot = 1, 25, 1 do
            local itemId = GetContainerItemID(bagId, slot)
            if (itemId) then
                local item = ITEM_LIST[itemId]
                if (item) then
                    items[itemId] = item
                end
            end
        end
    end
    return items
end

---
--  Returns a map [itemId -> item] of the raid items from the current player's
--  inventory and bags that are also in the given player's need-list.
--  
--  This is particularly useful when checking if a player's need-list still
--  contains items that the player already has.
--  
--  @param #playerInfo player
--          the player info containing the need-list to be checked
--  
--  @return #map
--          the inventory items still on the need-list
--  
Items.checkInventoryItems = function(player)
    local items = Items.getInventoryItems()
    for itemId, item in pairs(items) do
        if (not player.needlist[itemId] or item.repeatable) then
            -- the item was already removed from the list
            items[itemId] = nil
        end
    end
    return items
end

---
-- Removes the items in the inventory of the player from its need-list.
--
-- Note that this method is only intended to remove the items from the raid or group leader.
-- It does not send an event to the leader to get some items removed.
--
Items.removeInventoryItems = function()
    local playerName = UnitName("player")
    local player = ns.DB.PLAYER_LIST[playerName]
    if (player) then
        local items  = Items.getInventoryItems()
        for itemId, item in pairs(items) do
            Items.removeFromPlayer(player, item)
        end
    end
end

---
-- Indicates whether the player with the given memberInfo can remove the item from its
-- need-list.
--
-- @param #Item playerItem
--          the item that shall be removed
-- @param #table memberInfo
--          the player from whom the item shall be removed
--
-- @return #boolean
--          true if the item can be removed, false otherwise
--
Items.canRemove = function(playerItem, memberInfo)
    if (playerItem and memberInfo and
        memberInfo.needlist[playerItem.itemId]) then

        if (playerItem.removable) then
            return true
        end

        if (playerItem.replaceable) then
            local found = 0
            for itemId, item in pairs(ITEM_LIST) do
                if (
                    playerItem.itemId ~= itemId and
                    item.replaceable and
                    -- item slot should match
                    playerItem.slot == item.slot and
                    -- should be assigned to the class of the player
                    item.classes[memberInfo.class] and
                    -- the item is already a higher tier
                    item.tier >= playerItem.tier and
                    -- the player doesn't have the item
                    (not memberInfo.needlist[itemId]) and
                    -- additionally, the matching items should have a role intersection
                    item:hasRole(playerItem.roles)
                    ) then

                    if (item.slotSize == 1 or found >= 1) then
                        return true
                    else
                        found = found + 1
                    end
                end
            end
        end
    end
end

---
-- Removes the given item from the given player and also all addition items (like quest
-- items).
--
-- @param #Player player
--          the player from who to remove the item
-- @param #Item item
--          the item to be removed from the player
--
Items.removeFromPlayer = function(player, item)
    if (player and item) then
        if (player:removeItem(item)) then
            print("> Removed item '"..item:getName().."' ("..item.itemId..") from player '"..player.name.."'.")
        end

        -- swallow additional items
        for index, itemId in ipairs(item.swallows or {}) do
            local addItem = ITEM_LIST[itemId]
            Items.removeFromPlayer(player, addItem)
        end
    end
end

ns.Items = Items
ns.ITEM_LIST = ITEM_LIST
