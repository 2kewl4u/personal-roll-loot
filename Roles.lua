-- namespace
local _, ns = ...;
-- imports
local Role = ns.Role

-- classes
local CLASS_WARRIOR = "WARRIOR"
local CLASS_PALADIN = "PALADIN"
local CLASS_HUNTER = "HUNTER"
local CLASS_ROGUE = "ROGUE"
local CLASS_PRIEST = "PRIEST"
local CLASS_SHAMAN = "SHAMAN"
local CLASS_MAGE = "MAGE"
local CLASS_WARLOCK = "WARLOCK"
local CLASS_DRUID = "DRUID"

-- role list
local ROLES_LIST = {
    ["warlock"] = {
        roleId = "warlock",
        name = "Warlock",
        class = CLASS_WARLOCK,
        texture = "Interface\\ICONS\\ClassIcon_Warlock"
    },
    ["mage"] = {
        roleId = "mage",
        name = "Mage",
        class = CLASS_MAGE,
        texture = "Interface\\ICONS\\ClassIcon_Mage"
    },
    ["hunter"] = {
        roleId = "hunter",
        name = "Hunter",
        class = CLASS_HUNTER,
        texture = "Interface\\ICONS\\ClassIcon_Hunter"
    },
    ["rogue"] = {
        roleId = "rogue",
        name = "Rogue",
        class = CLASS_ROGUE,
        texture = "Interface\\ICONS\\ClassIcon_Rogue"
    },
    -- druid specializations
    ["feral"] = {
        roleId = "feral",
        name = "Feral",
        class = CLASS_DRUID,
        texture = "Interface\\ICONS\\TalentSpec_Druid_Feral_Cat"
    },
    ["guardian"] = {
        roleId = "guardian",
        name = "Guardian",
        class = CLASS_DRUID,
        texture = "Interface\\ICONS\\TalentSpec_Druid_Feral_Bear"
    },
    ["balance"] = {
        roleId = "balance",
        name = "Balance",
        class = CLASS_DRUID,
        texture = "Interface\\ICONS\\TalentSpec_Druid_Balance"
    },
    ["resto-druid"] = {
        roleId = "resto-druid",
        name = "Restoration",
        class = CLASS_DRUID,
        texture = "Interface\\ICONS\\TalentSpec_Druid_Restoration"
    },
    -- priest specializations
    ["holy-priest"] = {
        roleId = "holy-priest",
        name = "Holy",
        class = CLASS_PRIEST,
        texture = "Interface\\ICONS\\Spell_Holy_GuardianSpirit"
    },
    ["shadow"] = {
        roleId = "shadow",
        name = "Shadow",
        class = CLASS_PRIEST,
        texture = "Interface\\ICONS\\Spell_Shadow_ShadowWordPain"
    },
    -- shaman specializations
    ["resto-shaman"] = {
        roleId = "resto-shaman",
        name = "Restoration",
        class = CLASS_SHAMAN,
        texture = "Interface\\ICONS\\Spell_Nature_HealingWaveLesser"
    },
    ["elemental"] = {
        roleId = "elemental",
        name = "Elemental",
        class = CLASS_SHAMAN,
        texture = "Interface\\ICONS\\Spell_Nature_Lightning"
    },
    ["enhancement"] = {
        roleId = "enhancement",
        name = "Enhancement",
        class = CLASS_SHAMAN,
        texture = "Interface\\ICONS\\Spell_Nature_LightningShield"
    },
    -- paladin specializations
    ["holy-paladin"] = {
        roleId = "holy-paladin",
        name = "Holy",
        class = CLASS_PALADIN,
        texture = "Interface\\ICONS\\Spell_Holy_HolyBolt"
    },
    ["retribution"] = {
        roleId = "retribution",
        name = "Retribution",
        class = CLASS_PALADIN,
        texture = "Interface\\ICONS\\Spell_Holy_AuraOfLight"
    },
    ["prot-paladin"] = {
        roleId = "prot-paladin",
        name = "Protection",
        class = CLASS_PALADIN,
        texture = "Interface\\ICONS\\SPELL_HOLY_DEVOTIONAURA"
    },
    -- warrior specializations
    ["prot-warrior"] = {
        roleId = "prot-warrior",
        name = "Protection",
        class = CLASS_WARRIOR,
        texture = "Interface\\ICONS\\INV_Shield_06"
    },
    ["arms"] = {
        roleId = "arms",
        name = "Arms",
        class = CLASS_WARRIOR,
        texture = "Interface\\ICONS\\Ability_Rogue_Eviscerate"
    }
    
}

-- create Role's from the roleInfo above
for roleId, roleInfo in pairs (ROLES_LIST) do
    ROLES_LIST[roleId] = Role.fromInfo(roleInfo)
end
