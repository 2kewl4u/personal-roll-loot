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

-- the item list
local ITEM_LIST = {
    -- MOLTEN CORE
    [16795] = {
        itemId = 16795,
        name = "Arcanist Crown",
        roles = { [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16796] = {
        itemId = 16796,
        name = "Arcanist Leggings",
        roles = { [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16797] = {
        itemId = 16797,
        name = "Arcanist Mantle",
        roles = { [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16798] = {
        itemId = 16798,
        name = "Arcanist Robes",
        roles = { [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16799] = {
        itemId = 16799,
        name = "Arcanist Bindings",
        roles = { [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16800] = {
        itemId = 16800,
        name = "Arcanist Boots",
        roles = { [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16801] = {
        itemId = 16801,
        name = "Arcanist Gloves",
        roles = { [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16802] = {
        itemId = 16802,
        name = "Arcanist Belt",
        roles = { [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16803] = {
        itemId = 16803,
        name = "Felheart Slippers",
        roles = { [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16804] = {
        itemId = 16804,
        name = "Felheart Bracers",
        roles = { [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16805] = {
        itemId = 16805,
        name = "Felheart Gloves",
        roles = { [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16806] = {
        itemId = 16806,
        name = "Felheart Belt",
        roles = { [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16807] = {
        itemId = 16807,
        name = "Felheart Shoulder Pads",
        roles = { [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16808] = {
        itemId = 16808,
        name = "Felheart Horns",
        roles = { [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16809] = {
        itemId = 16809,
        name = "Felheart Robes",
        roles = { [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16810] = {
        itemId = 16810,
        name = "Felheart Pants",
        roles = { [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16811] = {
        itemId = 16811,
        name = "Boots of Prophecy",
        roles = { [ROLE_HEALER] = true },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16812] = {
        itemId = 16812,
        name = "Gloves of Prophecy",
        roles = { [ROLE_HEALER] = true },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16813] = {
        itemId = 16813,
        name = "Circlet of Prophecy",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16814] = {
        itemId = 16814,
        name = "Pants of Prophecy",
        roles = { [ROLE_HEALER] = true },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16815] = {
        itemId = 16815,
        name = "Robes of Prophecy",
        roles = { [ROLE_HEALER] = true },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16816] = {
        itemId = 16816,
        name = "Mantle of Prophecy",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16817] = {
        itemId = 16817,
        name = "Girdle of Prophecy",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16819] = {
        itemId = 16819,
        name = "Vambraces of Prophecy",
        roles = { [ROLE_HEALER] = true },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16820] = {
        itemId = 16820,
        name = "Nightslayer Chestpiece",
        roles = { [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16821] = {
        itemId = 16821,
        name = "Nightslayer Cover",
        roles = { [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16822] = {
        itemId = 16822,
        name = "Nightslayer Pants",
        roles = { [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16823] = {
        itemId = 16823,
        name = "Nightslayer Shoulder Pads",
        roles = { [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16824] = {
        itemId = 16824,
        name = "Nightslayer Boots",
        roles = { [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16825] = {
        itemId = 16825,
        name = "Nightslayer Bracelets",
        roles = { [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16826] = {
        itemId = 16826,
        name = "Nightslayer Gloves",
        roles = { [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16827] = {
        itemId = 16827,
        name = "Nightslayer Belt",
        roles = { [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16828] = {
        itemId = 16828,
        name = "Cenarion Belt",
        roles = { [ROLE_CASTER_DPS] = true, [ROLE_HEALER] = true },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16829] = {
        itemId = 16829,
        name = "Cenarion Boots",
        roles = { [ROLE_HEALER] = true },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16830] = {
        itemId = 16830,
        name = "Cenarion Bracers",
        roles = { [ROLE_CASTER_DPS] = true, [ROLE_HEALER] = true },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16831] = {
        itemId = 16831,
        name = "Cenarion Gloves",
        roles = { [ROLE_HEALER] = true },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16833] = {
        itemId = 16833,
        name = "Cenarion Vestments",
        roles = { [ROLE_HEALER] = true },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16834] = {
        itemId = 16834,
        name = "Cenarion Helm",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16835] = {
        itemId = 16835,
        name = "Cenarion Leggings",
        roles = { [ROLE_HEALER] = true },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16836] = {
        itemId = 16836,
        name = "Cenarion Spaulders",
        roles = { [ROLE_HEALER] = true },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16837] = {
        itemId = 16837,
        name = "Earthfury Boots",
        roles = { [ROLE_HEALER] = true },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16838] = {
        itemId = 16838,
        name = "Earthfury Belt",
        roles = { [ROLE_HEALER] = true },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16839] = {
        itemId = 16839,
        name = "Earthfury Gauntlets",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16840] = {
        itemId = 16840,
        name = "Earthfury Bracers",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16841] = {
        itemId = 16841,
        name = "Earthfury Vestments",
        roles = { [ROLE_HEALER] = true },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16842] = {
        itemId = 16842,
        name = "Earthfury Helmet",
        roles = { [ROLE_HEALER] = true },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16843] = {
        itemId = 16843,
        name = "Earthfury Legguards",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16844] = {
        itemId = 16844,
        name = "Earthfury Epaulets",
        roles = { [ROLE_HEALER] = true },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16845] = {
        itemId = 16845,
        name = "Giantstalker's Breastplate",
        roles = { [ROLE_RANGED_DPS] = true },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16846] = {
        itemId = 16846,
        name = "Giantstalker's Helmet",
        roles = { [ROLE_RANGED_DPS] = true },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16847] = {
        itemId = 16847,
        name = "Giantstalker's Leggings",
        roles = { [ROLE_RANGED_DPS] = true },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16848] = {
        itemId = 16848,
        name = "Giantstalker's Epaulets",
        roles = { [ROLE_RANGED_DPS] = true },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16849] = {
        itemId = 16849,
        name = "Giantstalker's Boots",
        roles = { [ROLE_RANGED_DPS] = true },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16850] = {
        itemId = 16850,
        name = "Giantstalker's Bracers",
        roles = { [ROLE_RANGED_DPS] = true },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16851] = {
        itemId = 16851,
        name = "Giantstalker's Belt",
        roles = { [ROLE_RANGED_DPS] = true },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16852] = {
        itemId = 16852,
        name = "Giantstalker's Gloves",
        roles = { [ROLE_RANGED_DPS] = true },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16853] = {
        itemId = 16853,
        name = "Lawbringer Chestguard",
        roles = { [ROLE_HEALER] = true, [ROLE_MELEE_DPS] = true, [ROLE_TANK] = true },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16854] = {
        itemId = 16854,
        name = "Lawbringer Helm",
        roles = { [ROLE_HEALER] = true, [ROLE_MELEE_DPS] = true, [ROLE_TANK] = true },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16855] = {
        itemId = 16855,
        name = "Lawbringer Legplates",
        roles = { [ROLE_HEALER] = true, [ROLE_MELEE_DPS] = true, [ROLE_TANK] = true },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16856] = {
        itemId = 16856,
        name = "Lawbringer Spaulders",
        roles = { [ROLE_HEALER] = true, [ROLE_MELEE_DPS] = true, [ROLE_TANK] = true },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16857] = {
        itemId = 16857,
        name = "Lawbringer Bracers",
        roles = { [ROLE_HEALER] = true, [ROLE_MELEE_DPS] = true, [ROLE_TANK] = true },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16858] = {
        itemId = 16858,
        name = "Lawbringer Belt",
        roles = { [ROLE_HEALER] = true, [ROLE_MELEE_DPS] = true, [ROLE_TANK] = true },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16859] = {
        itemId = 16859,
        name = "Lawbringer Boots",
        roles = { [ROLE_HEALER] = true, [ROLE_MELEE_DPS] = true, [ROLE_TANK] = true },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16860] = {
        itemId = 16860,
        name = "Lawbringer Gauntlets",
        roles = { [ROLE_HEALER] = true, [ROLE_MELEE_DPS] = true, [ROLE_TANK] = true },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16861] = {
        itemId = 16861,
        name = "Bracers of Might",
        roles = { [ROLE_TANK] = true },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16862] = {
        itemId = 16862,
        name = "Sabatons of Might",
        roles = { [ROLE_TANK] = true },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16863] = {
        itemId = 16863,
        name = "Gauntlets of Might",
        roles = { [ROLE_TANK] = true },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16864] = {
        itemId = 16864,
        name = "Belt of Might",
        roles = { [ROLE_TANK] = true },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16865] = {
        itemId = 16865,
        name = "Breastplate of Might",
        roles = { [ROLE_TANK] = true },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16866] = {
        itemId = 16866,
        name = "Helm of Might",
        roles = { [ROLE_TANK] = true },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16867] = {
        itemId = 16867,
        name = "Legplates of Might",
        roles = { [ROLE_TANK] = true },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16868] = {
        itemId = 16868,
        name = "Pauldrons of Might",
        roles = { [ROLE_TANK] = true },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16901] = {
        itemId = 16901,
        name = "Stormrage Legguards",
        roles = { [ROLE_HEALER] = true },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16909] = {
        itemId = 16909,
        name = "Bloodfang Pants",
        roles = { [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_ROGUE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16915] = {
        itemId = 16915,
        name = "Netherwind Pants",
        roles = { [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16922] = {
        itemId = 16922,
        name = "Leggings of Transcendence",
        roles = { [ROLE_HEALER] = true },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16930] = {
        itemId = 16930,
        name = "Nemesis Leggings",
        roles = { [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16938] = {
        itemId = 16938,
        name = "Dragonstalker's Legguards",
        roles = { [ROLE_RANGED_DPS] = true },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16946] = {
        itemId = 16946,
        name = "Legplates of Ten Storms",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16954] = {
        itemId = 16954,
        name = "Judgement Legplates",
        roles = { [ROLE_HEALER] = true, [ROLE_MELEE_DPS] = true, [ROLE_TANK] = true },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [16962] = {
        itemId = 16962,
        name = "Legplates of Wrath",
        roles = { [ROLE_TANK] = true },
        classes = { [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17063] = {
        itemId = 17063,
        name = "Band of Accuria",
        roles = { [ROLE_MELEE_DPS] = true, [ROLE_RANGED_DPS] = true, [ROLE_TANK] = true },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17065] = {
        itemId = 17065,
        name = "Medallion of Steadfast Might",
        roles = { [ROLE_TANK] = true },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17066] = {
        itemId = 17066,
        name = "Drillborer Disk",
        roles = { [ROLE_TANK] = true },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17069] = {
        itemId = 17069,
        name = "Striker's Mark",
        roles = { [ROLE_RANGED_DPS] = true, [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17071] = {
        itemId = 17071,
        name = "Gutgore Ripper",
        roles = { [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17072] = {
        itemId = 17072,
        name = "Blastershot Launcher",
        roles = { [ROLE_RANGED_DPS] = true, [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17073] = {
        itemId = 17073,
        name = "Earthshaker",
        roles = { [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_DRUID] = true, [CLASS_PALADIN] = true, [CLASS_WARRIOR] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17074] = {
        itemId = 17074,
        name = "Shadowstrike",
        roles = { [ROLE_RANGED_DPS] = true, [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_HUNTER] = true, [CLASS_PALADIN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17076] = {
        itemId = 17076,
        name = "Bonereaver's Edge",
        roles = { [ROLE_RANGED_DPS] = true, [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_HUNTER] = true, [CLASS_PALADIN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17077] = {
        itemId = 17077,
        name = "Crimson Shocker",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17082] = {
        itemId = 17082,
        name = "Shard of the Flame",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true, [ROLE_MELEE_DPS] = true, [ROLE_TANK] = true },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17102] = {
        itemId = 17102,
        name = "Cloak of the Shrouded Mists",
        roles = { [ROLE_RANGED_DPS] = true, [ROLE_MELEE_DPS] = true, [ROLE_TANK] = true },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17103] = {
        itemId = 17103,
        name = "Azuresong Mageblade",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true, [ROLE_TANK] = true },
        classes = { [CLASS_MAGE] = true, [CLASS_WARLOCK] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17104] = {
        itemId = 17104,
        name = "Spinal Reaper",
        roles = { [ROLE_RANGED_DPS] = true, [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true, [CLASS_PALADIN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17105] = {
        itemId = 17105,
        name = "Aurastone Hammer",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true, [ROLE_TANK] = true },
        classes = { [CLASS_DRUID] = true, [CLASS_SHAMAN] = true, [CLASS_PALADIN] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17106] = {
        itemId = 17106,
        name = "Malistar's Defender",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true, [ROLE_TANK] = true },
        classes = { [CLASS_SHAMAN] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17107] = {
        itemId = 17107,
        name = "Dragon's Blood Cape",
        roles = { [ROLE_MELEE_DPS] = true, [ROLE_TANK] = true },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17109] = {
        itemId = 17109,
        name = "Choker of Enlightenment",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true, [ROLE_TANK] = true },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17110] = {
        itemId = 17110,
        name = "Seal of the Archmagus",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [17204] = {
        itemId = 17204,
        name = "Eye of Sulfuras",
        roles = { [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18203] = {
        itemId = 18203,
        name = "Eskhandar's Right Claw",
        roles = { [ROLE_RANGED_DPS] = true, [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18564] = {
        itemId = 18564,
        name = "Bindings of the Windseeker",
        roles = { [ROLE_RANGED_DPS] = true, [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_PALADIN] = true, [CLASS_ROGUE] = true, [CLASS_HUNTER] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18646] = {
        itemId = 18646,
        name = "The Eye of Divinity",
        roles = { [ROLE_CASTER_DPS] = true, [ROLE_HEALER] = true },
        classes = { [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18703] = {
        itemId = 18703,
        name = "Ancient Petrified Leaf",
        roles = { [ROLE_RANGED_DPS] = true },
        classes = { [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18806] = {
        itemId = 18806,
        name = "Core Forged Greaves",
        roles = { [ROLE_TANK] = true },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18809] = {
        itemId = 18809,
        name = "Sash of Whispered Secrets",
        roles = { [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_WARLOCK] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18810] = {
        itemId = 18810,
        name = "Wild Growth Spaulders",
        roles = { [ROLE_HEALER] = true },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18812] = {
        itemId = 18812,
        name = "Wristguards of True Flight",
        roles = { [ROLE_MELEE_DPS] = true, [ROLE_RANGED_DPS] = true },
        classes = { [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18814] = {
        itemId = 18814,
        name = "Choker of the Fire Lord",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18815] = {
        itemId = 18815,
        name = "Essence of the Pure Flame",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true, [ROLE_MELEE_DPS] = true, [ROLE_TANK] = true },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true,
            [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18816] = {
        itemId = 18816,
        name = "Perdition's Blade",
        roles = { [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18817] = {
        itemId = 18817,
        name = "Crown of Destruction",
        roles = { [ROLE_RANGED_DPS] = true, [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_HUNTER] = true, [CLASS_SHAMAN] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18820] = {
        itemId = 18820,
        name = "Talisman of Ephemeral Power",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18821] = {
        itemId = 18821,
        name = "Quick Strike Ring",
        roles = { [ROLE_RANGED_DPS] = true, [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_ROGUE] = true, [CLASS_WARRIOR] = true, [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18822] = {
        itemId = 18822,
        name = "Obsidian Edged Blade",
        roles = { [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_PALADIN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18823] = {
        itemId = 18823,
        name = "Aged Core Leather Gloves",
        roles = { [ROLE_MELEE_DPS] = true, [ROLE_TANK] = true },
        classes = { [CLASS_ROGUE] = true, [CLASS_DRUID] = true, [CLASS_SHAMAN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18824] = {
        itemId = 18824,
        name = "Magma Tempered Boots",
        roles = { [ROLE_HEALER] = true },
        classes = { [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18829] = {
        itemId = 18829,
        name = "Deep Earth Spaulders",
        roles = { [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_SHAMAN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18832] = {
        itemId = 18832,
        name = "Brutality Blade",
        roles = { [ROLE_RANGED_DPS] = true, [ROLE_MELEE_DPS] = true, [ROLE_TANK] = true },
        classes = { [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_PALADIN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18842] = {
        itemId = 18842,
        name = "Staff of Dominance",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_DRUID] = true, [CLASS_MAGE] = true, [CLASS_PRIEST] = true, [CLASS_SHAMAN] = true, [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18861] = {
        itemId = 18861,
        name = "Flamewaker Legplates",
        roles = { [ROLE_TANK] = true },
        classes = { [CLASS_PALADIN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18870] = {
        itemId = 18870,
        name = "Helm of the Lifegiver",
        roles = { [ROLE_HEALER] = true },
        classes = { [CLASS_SHAMAN] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18872] = {
        itemId = 18872,
        name = "Manastorm Leggings",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_MAGE] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18875] = {
        itemId = 18875,
        name = "Salamander Scale Pants",
        roles = { [ROLE_HEALER] = true },
        classes = { [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18878] = {
        itemId = 18878,
        name = "Sorcerous Dagger",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_DRUID] = true, [CLASS_MAGE] = true, [CLASS_PRIEST] = true, [CLASS_SHAMAN] = true, [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [18879] = {
        itemId = 18879,
        name = "Heavy Dark Iron Ring",
        roles = { [ROLE_TANK] = true },
        classes = { [CLASS_DRUID] = true, [CLASS_PALADIN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [19136] = {
        itemId = 19136,
        name = "Mana Igniting Cord",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_MAGE] = true, [CLASS_WARLOCK] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [19137] = {
        itemId = 19137,
        name = "Onslaught Girdle",
        roles = { [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [19138] = {
        itemId = 19138,
        name = "Band of Sulfuras",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [19140] = {
        itemId = 19140,
        name = "Cauterizing Band",
        roles = { [ROLE_HEALER] = true },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [19142] = {
        itemId = 19142,
        name = "Fire Runed Grimoire",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [19143] = {
        itemId = 19143,
        name = "Flameguard Gauntlets",
        roles = { [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_PALADIN] = true, [CLASS_WARRIOR] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [19144] = {
        itemId = 19144,
        name = "Sabatons of the Flamewalker",
        roles = { [ROLE_RANGED_DPS] = true, [ROLE_MELEE_DPS] = true },
        classes = { [CLASS_SHAMAN] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [19145] = {
        itemId = 19145,
        name = "Robe of Volatile Power",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [19146] = {
        itemId = 19146,
        name = "Wristguards of Stability",
        roles = { [ROLE_MELEE_DPS] = true, [ROLE_TANK] = true },
        classes = { [CLASS_ROGUE] = true, [CLASS_DRUID] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [19147] = {
        itemId = 19147,
        name = "Ring of Spell Power",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },

    -- ONYXIA
    [18422] = {
        itemId = 18422,
        name = "Head of Onyxia",
        roles = {  },
        classes = {  },
        raids = { [RAID_ONYXIA] = true }
    },

    [17067] = {
        itemId = 17067,
        name = "Ancient Cornerstone Grimoire",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_ONYXIA] = true }
    },

-- for testing purposes

    [2589] = {
        itemId = 2589,
        name = "Linen Cloth",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    },
    [2592] = {
        itemId = 2592,
        name = "Wool Cloth",
        roles = { [ROLE_HEALER] = true, [ROLE_CASTER_DPS] = true },
        classes = { [CLASS_PALADIN] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true, [CLASS_PRIEST] = true, [CLASS_WARLOCK] = true, [CLASS_MAGE] = true },
        raids = { [RAID_MOLTEN_CORE] = true }
    }

}

-- cache the items in the client
for itemId, itemInfo in pairs(ITEM_LIST) do
    ITEM_LIST[itemId] = Item.of(itemInfo)
end

-- item utilities
local Items = {}

Items.forName = function(name)
    if (name) then
        for itemId, item in pairs(ITEM_LIST) do
            local itemName = GetItemInfo(itemId)
            if (name == itemName) then
                return item
            end
        end
    end
end

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

ns.Items = Items
ns.ITEM_LIST = ITEM_LIST
