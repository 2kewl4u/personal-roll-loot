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
        replaceable = true
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
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 1,
        replaceable = true
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
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
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
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_ARMS_WARRIOR] = 2 },
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
        classes = { [CLASS_WARRIOR] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true,
            [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
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
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true,
            [CLASS_DRUID] = true },
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
            [ROLE_ARMS_WARRIOR] = 4 },
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
        if (not player.needlist[itemId]) then
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
