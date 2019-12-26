-- namespace
local _, ns = ...;
-- imports
local Role = ns.Role
local utils = ns.utils

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

-- role list
local ROLES_LIST = {
    [ROLE_WARLOCK] = {
        roleId = ROLE_WARLOCK,
        name = "Warlock",
        class = CLASS_WARLOCK,
        texture = "Interface\\Addons\\PersonalRollLoot\\textures\\roles\\ClassIcon_Warlock"
    },
    [ROLE_MAGE] = {
        roleId = ROLE_MAGE,
        name = "Mage",
        class = CLASS_MAGE,
        texture = "Interface\\Addons\\PersonalRollLoot\\textures\\roles\\ClassIcon_Mage"
    },
    [ROLE_HUNTER] = {
        roleId = ROLE_HUNTER,
        name = "Hunter",
        class = CLASS_HUNTER,
        texture = "Interface\\Addons\\PersonalRollLoot\\textures\\roles\\ClassIcon_Hunter"
    },
    [ROLE_ROGUE] = {
        roleId = ROLE_ROGUE,
        name = "Rogue",
        class = CLASS_ROGUE,
        texture = "Interface\\Addons\\PersonalRollLoot\\textures\\roles\\ClassIcon_Rogue"
    },
    -- druid specializations
    [ROLE_FERAL_DRUID] = {
        roleId = ROLE_FERAL_DRUID,
        name = "Feral",
        class = CLASS_DRUID,
        texture = "Interface\\Addons\\PersonalRollLoot\\textures\\roles\\TalentSpec_Druid_Feral_Cat"
    },
    [ROLE_GUARDIAN_DRUID] = {
        roleId = ROLE_GUARDIAN_DRUID,
        name = "Guardian",
        class = CLASS_DRUID,
        texture = "Interface\\Addons\\PersonalRollLoot\\textures\\roles\\TalentSpec_Druid_Feral_Bear"
    },
    [ROLE_BALANCE_DRUID] = {
        roleId = ROLE_BALANCE_DRUID,
        name = "Balance",
        class = CLASS_DRUID,
        texture = "Interface\\Addons\\PersonalRollLoot\\textures\\roles\\TalentSpec_Druid_Balance"
    },
    [ROLE_RESTO_DRUID] = {
        roleId = ROLE_RESTO_DRUID,
        name = "Restoration",
        class = CLASS_DRUID,
        texture = "Interface\\Addons\\PersonalRollLoot\\textures\\roles\\TalentSpec_Druid_Restoration"
    },
    -- priest specializations
    [ROLE_HOLY_PRIEST] = {
        roleId = ROLE_HOLY_PRIEST,
        name = "Holy",
        class = CLASS_PRIEST,
        texture = "Interface\\Addons\\PersonalRollLoot\\textures\\roles\\Spell_Holy_GuardianSpirit"
    },
    [ROLE_SHADOW_PRIEST] = {
        roleId = ROLE_SHADOW_PRIEST,
        name = "Shadow",
        class = CLASS_PRIEST,
        texture = "Interface\\Addons\\PersonalRollLoot\\textures\\roles\\Spell_Shadow_ShadowWordPain"
    },
    -- shaman specializations
    [ROLE_RESTO_SHAMAN] = {
        roleId = ROLE_RESTO_SHAMAN,
        name = "Restoration",
        class = CLASS_SHAMAN,
        texture = "Interface\\Addons\\PersonalRollLoot\\textures\\roles\\Spell_Nature_HealingWaveLesser"
    },
    [ROLE_ELEMENTAL_SHAMAN] = {
        roleId = ROLE_ELEMENTAL_SHAMAN,
        name = "Elemental",
        class = CLASS_SHAMAN,
        texture = "Interface\\Addons\\PersonalRollLoot\\textures\\roles\\Spell_Nature_Lightning"
    },
    [ROLE_ENHANCEMENT_SHAMAN] = {
        roleId = ROLE_ENHANCEMENT_SHAMAN,
        name = "Enhancement",
        class = CLASS_SHAMAN,
        texture = "Interface\\Addons\\PersonalRollLoot\\textures\\roles\\Spell_Nature_LightningShield"
    },
    -- paladin specializations
    [ROLE_HOLY_PALADIN] = {
        roleId = ROLE_HOLY_PALADIN,
        name = "Holy",
        class = CLASS_PALADIN,
        texture = "Interface\\Addons\\PersonalRollLoot\\textures\\roles\\Spell_Holy_HolyBolt"
    },
    [ROLE_RETRI_PALADIN] = {
        roleId = ROLE_RETRI_PALADIN,
        name = "Retribution",
        class = CLASS_PALADIN,
        texture = "Interface\\Addons\\PersonalRollLoot\\textures\\roles\\Spell_Holy_AuraOfLight"
    },
    [ROLE_PROT_PALADIN] = {
        roleId = ROLE_PROT_PALADIN,
        name = "Protection",
        class = CLASS_PALADIN,
        texture = "Interface\\Addons\\PersonalRollLoot\\textures\\roles\\SPELL_HOLY_DEVOTIONAURA"
    },
    -- warrior specializations
    [ROLE_PROT_WARRIOR] = {
        roleId = ROLE_PROT_WARRIOR,
        name = "Protection",
        class = CLASS_WARRIOR,
        texture = "Interface\\Addons\\PersonalRollLoot\\textures\\roles\\INV_Shield_06"
    },
    [ROLE_ARMS_WARRIOR] = {
        roleId = ROLE_ARMS_WARRIOR,
        name = "Arms",
        class = CLASS_WARRIOR,
        texture = "Interface\\Addons\\PersonalRollLoot\\textures\\roles\\Ability_Rogue_Eviscerate"
    }
    
}

-- map of class -> (roleId -> role)
local CLASS_ROLES = {}

-- create Role's from the roleInfo above
for roleId, roleInfo in pairs (ROLES_LIST) do
    local role = Role.fromInfo(roleInfo)
    ROLES_LIST[roleId] = role
    
    -- add the class to role mapping
    local classMapping = CLASS_ROLES[role.class] or {}
    classMapping[roleId] = role
    CLASS_ROLES[role.class] = classMapping
end

---
-- Contains utility methods for roles.
-- 
local Roles = {}

---
-- Creates a set with all the roles the given class can take.
--
-- @param #string class
--          the class constant, e.g. WARRIOR
--
-- @return #table
--          a set of roles for the class, not nil
--

Roles.forClass = function(class)
    if (class) then
        return utils.copy(CLASS_ROLES[class] or {})
    else
        return {}
    end
end

---
-- Checks whether the given string represents a valid roleId.
-- 
-- @param #string arg
--          the roleId string
-- 
-- @return #boolean
--          true if the role is valid, false otherwise
--          
Roles.checkRoleId = function(arg)
    if (not arg) then
        print("> No role specified.")
        return false
    end
    local role = arg
    if (not ROLES_LIST[role]) then
        print("> Undefined role '"..role.."'.")
        return false
    end
    return true
end

ns.Roles = Roles
ns.CLASS_ROLES = CLASS_ROLES
ns.ROLES_LIST = ROLES_LIST
