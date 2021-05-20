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
local RAID_KARAZHAN = "Karazhan"
local RAID_GRUUL = "Gruul's Lair"
local RAID_MAGTHERIDON = "Magtheridon's Lair"

-- the item list
local ITEM_LIST = {
    -- KARAZHAN
    [30643] = {
        itemId = 30643,
        name = "Belt of the Tracker",
        roles = { [ROLE_HUNTER] = 3, [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_RETRI_PALADIN] = 3 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [30641] = {
        itemId = 30641,
        name = "Boots of Elusion",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [30642] = {
        itemId = 30642,
        name = "Drape of the Righteous",
        roles = { [ROLE_PROT_PALADIN] = 3, [ROLE_HOLY_PRIEST] = 4, [ROLE_HOLY_PALADIN] = 4 },
        classes = { [CLASS_PALADIN] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [30668] = {
        itemId = 30668,
        name = "Grasp of the Dead",
        roles = { [ROLE_MAGE] = 2 },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [30644] = {
        itemId = 30644,
        name = "Grips of Deftness",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_RETRI_PALADIN] = 2,
            [ROLE_ARMS_WARRIOR] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [30673] = {
        itemId = 30673,
        name = "Inferno Waist Cord",
        roles = { [ROLE_MAGE] = 2, [ROLE_WARLOCK] = 2 },
        classes = { [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [30667] = {
        itemId = 30667,
        name = "Ring of Unrelenting Storms",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 2 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [30666] = {
        itemId = 30666,
        name = "Ritssyn's Lost Pendant",
        roles = { [ROLE_SHADOW_PRIEST] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [30674] = {
        itemId = 30674,
        name = "Zierhut's Lost Treads",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_ROGUE] = 2, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 3,
            [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true,
            [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28453] = {
        itemId = 28453,
        name = "Bracers of the White Stag",
        roles = { [ROLE_RESTO_DRUID] = 3, [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28505] = {
        itemId = 28505,
        name = "Gauntlets of Renewed Hope",
        roles = { [ROLE_HOLY_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28506] = {
        itemId = 28506,
        name = "Gloves of Dexterous Manipulation",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_HUNTER] = 2,
            [ROLE_ENHANCEMENT_SHAMAN] = 2 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_ROGUE] = true, [CLASS_DRUID] = true, [CLASS_HUNTER] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28508] = {
        itemId = 28508,
        name = "Gloves of Saintly Blessings",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 2, [ROLE_RESTO_SHAMAN] = 3 },
        classes = { [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28507] = {
        itemId = 28507,
        name = "Handwraps of Flowing Thought",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28477] = {
        itemId = 28477,
        name = "Harbinger Bands",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28510] = {
        itemId = 28510,
        name = "Spectral Band of Innervation",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 3,
            [ROLE_MAGE] = 2, [ROLE_WARLOCK] = 2 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28454] = {
        itemId = 28454,
        name = "Stalker's War Bands",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1 },
        classes = { [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28504] = {
        itemId = 28504,
        name = "Steelhawk Crossbow",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28502] = {
        itemId = 28502,
        name = "Vambraces of Courage",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28503] = {
        itemId = 28503,
        name = "Whirlwind Bracers",
        roles = { [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28509] = {
        itemId = 28509,
        name = "Worgen Claw Necklace",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28567] = {
        itemId = 28567,
        name = "Belt of Gale Force",
        roles = { [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28569] = {
        itemId = 28569,
        name = "Boots of Valiance",
        roles = { [ROLE_HOLY_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28530] = {
        itemId = 28530,
        name = "Brooch of Unquenchable Fury",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28566] = {
        itemId = 28566,
        name = "Crimson Girdle of the Indomitable",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28545] = {
        itemId = 28545,
        name = "Edgewalker Longboots",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28524] = {
        itemId = 28524,
        name = "Emerald Ripper",
        roles = { [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28568] = {
        itemId = 28568,
        name = "Idol of the Avian Heart",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_RESTO_DRUID] = 1, [ROLE_FERAL_DRUID] = 2, [ROLE_BALANCE_DRUID] = 2 },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28528] = {
        itemId = 28528,
        name = "Moroes' Lucky Pocket Watch",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28565] = {
        itemId = 28565,
        name = "Nethershard Girdle",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28529] = {
        itemId = 28529,
        name = "Royal Cloak of Arathi Kings",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 2,
            [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28570] = {
        itemId = 28570,
        name = "Shadow-Cloak of Dalaran",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28525] = {
        itemId = 28525,
        name = "Signet of Unshakable Faith",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28511] = {
        itemId = 28511,
        name = "Bands of Indwelling",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28515] = {
        itemId = 28515,
        name = "Bands of Nefarious Deeds",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28516] = {
        itemId = 28516,
        name = "Barbed Choker of Discipline",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28517] = {
        itemId = 28517,
        name = "Boots of Foretelling",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 3, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28512] = {
        itemId = 28512,
        name = "Bracers of Justice",
        roles = { [ROLE_HOLY_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28514] = {
        itemId = 28514,
        name = "Bracers of Maliciousness",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28520] = {
        itemId = 28520,
        name = "Gloves of Centering",
        roles = { [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28519] = {
        itemId = 28519,
        name = "Gloves of Quickening",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1 },
        classes = { [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28518] = {
        itemId = 28518,
        name = "Iron Gauntlets of the Maiden",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28521] = {
        itemId = 28521,
        name = "Mitts of the Treemender",
        roles = { [ROLE_RESTO_DRUID] = 1, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28522] = {
        itemId = 28522,
        name = "Shard of the Virtuous",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28523] = {
        itemId = 28523,
        name = "Totem of Healing Rains",
        roles = { [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28589] = {
        itemId = 28589,
        name = "Beastmaw Pauldrons",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28583] = {
        itemId = 28583,
        name = "Big Bad Wolf's Head",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28584] = {
        itemId = 28584,
        name = "Big Bad Wolf's Paw",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28572] = {
        itemId = 28572,
        name = "Blade of the Unrequited",
        roles = { [ROLE_PROT_WARRIOR] = 3, [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_ARMS_WARRIOR] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28588] = {
        itemId = 28588,
        name = "Blue Diamond Witchwand",
        roles = { [ROLE_HOLY_PRIEST] = 1 },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28573] = {
        itemId = 28573,
        name = "Despair",
        roles = { [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28591] = {
        itemId = 28591,
        name = "Earthsoul Leggings",
        roles = { [ROLE_RESTO_DRUID] = 1, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28593] = {
        itemId = 28593,
        name = "Eternium Greathelm",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28587] = {
        itemId = 28587,
        name = "Legacy",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28592] = {
        itemId = 28592,
        name = "Libram of Souls Redeemed",
        roles = { [ROLE_HOLY_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28578] = {
        itemId = 28578,
        name = "Masquerade Gown",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 2 },
        classes = { [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28582] = {
        itemId = 28582,
        name = "Red Riding Hood's Cloak",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28590] = {
        itemId = 28590,
        name = "Ribbon of Sacrifice",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28579] = {
        itemId = 28579,
        name = "Romulo's Poison Vial",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 1,
            [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1,
            [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28585] = {
        itemId = 28585,
        name = "Ruby Slippers",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 3, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28594] = {
        itemId = 28594,
        name = "Trial-Fire Trousers",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28586] = {
        itemId = 28586,
        name = "Wicked Witch's Hat",
        roles = { [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28581] = {
        itemId = 28581,
        name = "Wolfslayer Sniper Rifle",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28631] = {
        itemId = 28631,
        name = "Dragon-Quake Shoulderguards",
        roles = { [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28647] = {
        itemId = 28647,
        name = "Forest Wind Shoulderpads",
        roles = { [ROLE_RESTO_DRUID] = 1 },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28649] = {
        itemId = 28649,
        name = "Garona's Signet Ring",
        roles = { [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1,
            [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [29757] = {
        itemId = 29757,
        name = "Gloves of the Fallen Champion",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1, [ROLE_ROGUE] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false,
        repeatable = true
    },
    [29758] = {
        itemId = 29758,
        name = "Gloves of the Fallen Defender",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1,
            [ROLE_FERAL_DRUID] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false,
        repeatable = true
    },
    [29756] = {
        itemId = 29756,
        name = "Gloves of the Fallen Hero",
        roles = { [ROLE_HUNTER] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_HUNTER] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false,
        repeatable = true
    },
    [28612] = {
        itemId = 28612,
        name = "Pauldrons of the Solace-Giver",
        roles = { [ROLE_HOLY_PALADIN] = 2, [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_SHAMAN] = 3, [ROLE_RESTO_DRUID] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_PRIEST] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28633] = {
        itemId = 28633,
        name = "Staff of Infinite Mysteries",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28621] = {
        itemId = 28621,
        name = "Wrynn Dynasty Greaves",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28747] = {
        itemId = 28747,
        name = "Battlescar Boots",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28755] = {
        itemId = 28755,
        name = "Bladed Shoulderpads of the Merciless",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_RETRI_PALADIN] = 3, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28746] = {
        itemId = 28746,
        name = "Fiend Slayer Boots",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28752] = {
        itemId = 28752,
        name = "Forestlord Striders",
        roles = { [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28750] = {
        itemId = 28750,
        name = "Girdle of Treachery",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1 },
        classes = { [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28756] = {
        itemId = 28756,
        name = "Headdress of the High Potentate",
        roles = { [ROLE_HOLY_PRIEST] = 1 },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28751] = {
        itemId = 28751,
        name = "Heart-Flame Leggings",
        roles = { [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28749] = {
        itemId = 28749,
        name = "King's Defender",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_ROGUE] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28748] = {
        itemId = 28748,
        name = "Legplates of the Innocent",
        roles = { [ROLE_HOLY_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28745] = {
        itemId = 28745,
        name = "Mithril Chain of Heroism",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 2,
            [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28753] = {
        itemId = 28753,
        name = "Ring of Recurrence",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28754] = {
        itemId = 28754,
        name = "Triptych Shield of the Ancients",
        roles = { [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28662] = {
        itemId = 28662,
        name = "Breastplate of the Lightbinder",
        roles = { [ROLE_HOLY_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28652] = {
        itemId = 28652,
        name = "Cincture of Will",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 2 },
        classes = { [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28655] = {
        itemId = 28655,
        name = "Cord of Nature's Sustenance",
        roles = { [ROLE_RESTO_DRUID] = 1, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28657] = {
        itemId = 28657,
        name = "Fool's Bane",
        roles = { [ROLE_ROGUE] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28660] = {
        itemId = 28660,
        name = "Gilded Thorium Cloak",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28656] = {
        itemId = 28656,
        name = "Girdle of the Prowler",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28654] = {
        itemId = 28654,
        name = "Malefic Girdle",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28661] = {
        itemId = 28661,
        name = "Mender's Heart-Ring",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28653] = {
        itemId = 28653,
        name = "Shadowvine Cloak of Infusion",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2,
            [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 2, [ROLE_MAGE] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28658] = {
        itemId = 28658,
        name = "Terestian's Stranglestaff",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_FERAL_DRUID] = 1 },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28785] = {
        itemId = 28785,
        name = "The Lightning Capacitor",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 2,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_TRINKET,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28659] = {
        itemId = 28659,
        name = "Xavian Stiletto",
        roles = { [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28728] = {
        itemId = 28728,
        name = "Aran's Soothing Sapphire",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28663] = {
        itemId = 28663,
        name = "Boots of the Incorrupt",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 2, [ROLE_HOLY_PALADIN] = 3, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28670] = {
        itemId = 28670,
        name = "Boots of the Infernal Coven",
        roles = { [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28672] = {
        itemId = 28672,
        name = "Drape of the Dark Reavers",
        roles = { [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28726] = {
        itemId = 28726,
        name = "Mantle of the Mind Flayer",
        roles = { [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28666] = {
        itemId = 28666,
        name = "Pauldrons of the Justice-Seeker",
        roles = { [ROLE_HOLY_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28727] = {
        itemId = 28727,
        name = "Pendant of the Violet Eye",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1,
            [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 2,
            [ROLE_MAGE] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28669] = {
        itemId = 28669,
        name = "Rapscallion Boots",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28674] = {
        itemId = 28674,
        name = "Saberclaw Talisman",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 2,
            [ROLE_FERAL_DRUID] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28675] = {
        itemId = 28675,
        name = "Shermanar Great-Ring",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28671] = {
        itemId = 28671,
        name = "Steelspine Faceguard",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28673] = {
        itemId = 28673,
        name = "Tirisfal Wand of Ascendancy",
        roles = { [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28732] = {
        itemId = 28732,
        name = "Cowl of Defiance",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true,
            [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28735] = {
        itemId = 28735,
        name = "Earthblood Chestguard",
        roles = { [ROLE_HOLY_PALADIN] = 2,[ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28733] = {
        itemId = 28733,
        name = "Girdle of Truth",
        roles = { [ROLE_HOLY_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28734] = {
        itemId = 28734,
        name = "Jewel of Infinite Possibilities",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28743] = {
        itemId = 28743,
        name = "Mantle of Abrahmis",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28730] = {
        itemId = 28730,
        name = "Mithril Band of the Unscarred",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1,
            [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28742] = {
        itemId = 28742,
        name = "Pantaloons of Repentance",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 2 },
        classes = { [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28740] = {
        itemId = 28740,
        name = "Rip-Flayer Leggings",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1 },
        classes = { [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28731] = {
        itemId = 28731,
        name = "Shining Chain of the Afterworld",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28741] = {
        itemId = 28741,
        name = "Skulker's Greaves",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28729] = {
        itemId = 28729,
        name = "Spiteblade",
        roles = { [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28744] = {
        itemId = 28744,
        name = "Uni-Mind Headdress",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28601] = {
        itemId = 28601,
        name = "Chestguard of the Conniver",
        roles = { [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28611] = {
        itemId = 28611,
        name = "Dragonheart Flameshield",
        roles = { [ROLE_PROT_PALADIN] = 2, [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28609] = {
        itemId = 28609,
        name = "Emberspur Talisman",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28610] = {
        itemId = 28610,
        name = "Ferocious Swift-Kickers",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28608] = {
        itemId = 28608,
        name = "Ironstriders of Urgency",
        roles = { [ROLE_PROT_WARRIOR] = 2, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28604] = {
        itemId = 28604,
        name = "Nightstaff of the Everliving",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28597] = {
        itemId = 28597,
        name = "Panzar'Thar Breastplate",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28602] = {
        itemId = 28602,
        name = "Robe of the Elder Scribes",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28599] = {
        itemId = 28599,
        name = "Scaled Breastplate of Carnage",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28606] = {
        itemId = 28606,
        name = "Shield of Impenetrable Darkness",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28600] = {
        itemId = 28600,
        name = "Stonebough Jerkin",
        roles = { [ROLE_RESTO_DRUID] = 1 },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28603] = {
        itemId = 28603,
        name = "Talisman of Nightbane",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28762] = {
        itemId = 28762,
        name = "Adornment of Stolen Souls",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28764] = {
        itemId = 28764,
        name = "Farstrider Wildercloak",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28773] = {
        itemId = 28773,
        name = "Gorehowl",
        roles = { [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [29760] = {
        itemId = 29760,
        name = "Helm of the Fallen Champion",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1, [ROLE_ROGUE] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false,
        repeatable = true
    },
    [29761] = {
        itemId = 29761,
        name = "Helm of the Fallen Defender",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1,
            [ROLE_FERAL_DRUID] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false,
        repeatable = true
    },
    [29759] = {
        itemId = 29759,
        name = "Helm of the Fallen Hero",
        roles = { [ROLE_HUNTER] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_HUNTER] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false,
        repeatable = true
    },
    [28763] = {
        itemId = 28763,
        name = "Jade Ring of the Everliving",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28771] = {
        itemId = 28771,
        name = "Light's Justice",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28768] = {
        itemId = 28768,
        name = "Malchazeen",
        roles = { [ROLE_PROT_WARRIOR] = 2, [ROLE_ROGUE] = 1, [ROLE_HUNTER] = 3, [ROLE_ARMS_WARRIOR] = 3 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28770] = {
        itemId = 28770,
        name = "Nathrezim Mindblade",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28757] = {
        itemId = 28757,
        name = "Ring of a Thousand Marks",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28766] = {
        itemId = 28766,
        name = "Ruby Drape of the Mysticant",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28765] = {
        itemId = 28765,
        name = "Stainless Cloak of the Pure Hearted",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28772] = {
        itemId = 28772,
        name = "Sunfury Bow of the Phoenix",
        roles = { [ROLE_PROT_WARRIOR] = 3, [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28767] = {
        itemId = 28767,
        name = "The Decapitator",
        roles = { [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_KARAZHAN] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 2,
        tier = 4,
        replaceable = true,
        removable = true
    },
    
    -- GRUUL'S LAIR
    [28799] = {
        itemId = 28799,
        name = "Belt of Divine Inspiration",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28795] = {
        itemId = 28795,
        name = "Bladespire Warbands",
        roles = { [ROLE_PROT_WARRIOR] = 2, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_WRIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28797] = {
        itemId = 28797,
        name = "Brute Cloak of the Ogre-Magi",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28800] = {
        itemId = 28800,
        name = "Hammer of the Naaru",
        roles = { [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28796] = {
        itemId = 28796,
        name = "Malefic Mask of the Shadows",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28801] = {
        itemId = 28801,
        name = "Maulgar's Warhelm",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [29763] = {
        itemId = 29763,
        name = "Pauldrons of the Fallen Champion",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1, [ROLE_ROGUE] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false,
        repeatable = true
    },
    [29764] = {
        itemId = 29764,
        name = "Pauldrons of the Fallen Defender",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1,
            [ROLE_FERAL_DRUID] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false,
        repeatable = true
    },
    [29762] = {
        itemId = 29762,
        name = "Pauldrons of the Fallen Hero",
        roles = { [ROLE_HUNTER] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_HUNTER] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_SHOULDER,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false,
        repeatable = true
    },
    [28825] = {
        itemId = 28825,
        name = "Aldori Legacy Defender",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28794] = {
        itemId = 28794,
        name = "Axe of the Gronn Lords",
        roles = { [ROLE_HUNTER] = 2, [ROLE_ENHANCEMENT_SHAMAN] = 3, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28802] = {
        itemId = 28802,
        name = "Head of Onyxia",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28804] = {
        itemId = 28804,
        name = "Collar of Cho'gall",
        roles = { [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28803] = {
        itemId = 28803,
        name = "Cowl of Nature's Breath",
        roles = { [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 2, [ROLE_RESTO_SHAMAN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28830] = {
        itemId = 28830,
        name = "Dragonspine Trophy",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28823] = {
        itemId = 28823,
        name = "Eye of Gruul",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28824] = {
        itemId = 28824,
        name = "Gauntlets of Martial Perfection",
        roles = { [ROLE_PROT_WARRIOR] = 2, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28827] = {
        itemId = 28827,
        name = "Gauntlets of the Dragonslayer",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28828] = {
        itemId = 28828,
        name = "Gronn-Stitched Girdle",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_RETRI_PALADIN] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [29766] = {
        itemId = 29766,
        name = "Leggings of the Fallen Champion",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1, [ROLE_ROGUE] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false,
        repeatable = true
    },
    [29767] = {
        itemId = 29767,
        name = "Leggings of the Fallen Defender",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1,
            [ROLE_FERAL_DRUID] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false,
        repeatable = true
    },
    [29765] = {
        itemId = 29765,
        name = "Leggings of the Fallen Hero",
        roles = { [ROLE_HUNTER] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_HUNTER] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_LEGS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false,
        repeatable = true
    },
    [28822] = {
        itemId = 28822,
        name = "Teeth of Gruul",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_NECK,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28810] = {
        itemId = 28810,
        name = "Windshear Boots",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_FEET,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28826] = {
        itemId = 28826,
        name = "Shuriken of Negation",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_ROGUE] = 1, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_ROGUE] = true },
        raids = { [RAID_GRUUL] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = true
    },
    
    -- MAGTHERIDON'S LAIR
    [29458] = {
        itemId = 29458,
        name = "Aegis of the Vindicator",
        roles = { [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_MAGTHERIDON] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [29754] = {
        itemId = 29754,
        name = "Chestguard of the Fallen Champion",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1, [ROLE_ROGUE] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ELEMENTAL_SHAMAN] = 1 },
        classes = { [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_MAGTHERIDON] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false,
        repeatable = true
    },
    [29753] = {
        itemId = 29753,
        name = "Chestguard of the Fallen Defender",
        roles = { [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1,
            [ROLE_FERAL_DRUID] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_MAGTHERIDON] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false,
        repeatable = true
    },
    [29755] = {
        itemId = 29755,
        name = "Chestguard of the Fallen Hero",
        roles = { [ROLE_HUNTER] = 1, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_HUNTER] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MAGTHERIDON] = true },
        slot = SLOT_CHEST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false,
        repeatable = true
    },
    [28777] = {
        itemId = 28777,
        name = "Cloak of the Pit Stalker",
        roles = { [ROLE_PROT_WARRIOR] = 2, [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 1, [ROLE_ROGUE] = 1,
            [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true,
            [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_MAGTHERIDON] = true },
        slot = SLOT_BACK,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28782] = {
        itemId = 28782,
        name = "Crystalheart Pulse-Staff",
        roles = { [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_RESTO_SHAMAN] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_MAGTHERIDON] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28783] = {
        itemId = 28783,
        name = "Eredar Wand of Obliteration",
        roles = { [ROLE_HOLY_PRIEST] = 2, [ROLE_SHADOW_PRIEST] = 2, [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MAGTHERIDON] = true },
        slot = SLOT_RANGED,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28789] = {
        itemId = 28789,
        name = "Eye of Magtheridon",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MAGTHERIDON] = true },
        slot = SLOT_TRINKET,
        slotSize = 2,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28779] = {
        itemId = 28779,
        name = "Girdle of the Endless Pit",
        roles = { [ROLE_PROT_WARRIOR] = 2, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_MAGTHERIDON] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28774] = {
        itemId = 28774,
        name = "Glaive of the Pit",
        roles = { [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_MAGTHERIDON] = true },
        slot = SLOT_MAIN_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = true
    },
    [28781] = {
        itemId = 28781,
        name = "Karaborian Talisman",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MAGTHERIDON] = true },
        slot = SLOT_OFF_HAND,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28776] = {
        itemId = 28776,
        name = "Liar's Tongue Gloves",
        roles = { [ROLE_GUARDIAN_DRUID] = 2, [ROLE_HUNTER] = 2, [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1,
            [ROLE_ENHANCEMENT_SHAMAN] = 2, [ROLE_ARMS_WARRIOR] = 2 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true,
            [CLASS_DRUID] = true },
        raids = { [RAID_MAGTHERIDON] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [32385] = {
        itemId = 32385,
        name = "Magtheridon's Head",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_GUARDIAN_DRUID] = 1, [ROLE_HUNTER] = 1,
            [ROLE_HOLY_PRIEST] = 1, [ROLE_RESTO_DRUID] = 1, [ROLE_HOLY_PALADIN] = 1, [ROLE_RESTO_SHAMAN] = 1,
            [ROLE_ROGUE] = 1, [ROLE_FERAL_DRUID] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 1,
            [ROLE_ELEMENTAL_SHAMAN] = 1, [ROLE_BALANCE_DRUID] = 1, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MAGTHERIDON] = true },
        slot = SLOT_FINGERS,
        slotSize = 2,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28780] = {
        itemId = 28780,
        name = "Soul-Eater's Handwraps",
        roles = { [ROLE_ELEMENTAL_SHAMAN] = 2, [ROLE_BALANCE_DRUID] = 2, [ROLE_SHADOW_PRIEST] = 1,
            [ROLE_MAGE] = 1, [ROLE_WARLOCK] = 1 },
        classes = { [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MAGTHERIDON] = true },
        slot = SLOT_HANDS,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28778] = {
        itemId = 28778,
        name = "Terror Pit Girdle",
        roles = { [ROLE_HUNTER] = 1, [ROLE_ENHANCEMENT_SHAMAN] = 1, [ROLE_RETRI_PALADIN] = 2 },
        classes = { [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_MAGTHERIDON] = true },
        slot = SLOT_WAIST,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28775] = {
        itemId = 28775,
        name = "Thundering Greathelm",
        roles = { [ROLE_PROT_PALADIN] = 1, [ROLE_PROT_WARRIOR] = 1, [ROLE_RETRI_PALADIN] = 1, [ROLE_ARMS_WARRIOR] = 1 },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_MAGTHERIDON] = true },
        slot = SLOT_HEAD,
        slotSize = 1,
        tier = 4,
        replaceable = true,
        removable = false
    },
    [28792] = {
        itemId = 28792,
        name = "A'dal's Signet of Defense",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 32385 } -- Magtheridon's Head
    },
    [28793] = {
        itemId = 28793,
        name = "Band of Crimson Fury",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 32385 } -- Magtheridon's Head
    },
    [28790] = {
        itemId = 28790,
        name = "Naaru Lightwarden's Band",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 32385 } -- Magtheridon's Head
    },
    [28791] = {
        itemId = 28791,
        name = "Ring of the Recalcitrant",
        roles = {},
        classes = {},
        raids = {},
        swallows = { 32385 } -- Magtheridon's Head
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
