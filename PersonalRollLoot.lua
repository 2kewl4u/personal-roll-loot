print("Addon loaded... PersonalRollLoot "..GetAddOnMetadata("PersonalRollLoot", "Version"))

-- namespace
local _, ns = ...;

-- constants
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

local CLASS_WARRIOR = 1
local CLASS_PALADIN = 2
local CLASS_HUNTER = 3
local CLASS_ROGUE = 4
local CLASS_PRIEST = 5
local CLASS_DEATH_KNIGHT = 6
local CLASS_SHAMAN = 7
local CLASS_MAGE = 8
local CLASS_WARLOCK = 9
local CLASS_MONK = 10
local CLASS_DRUID = 11
local CLASS_DEMON_HUNTER = 12

local ITEM_LIST = {
  [16795] = { 
    itemId = 16795,
    name = "Arcanist Crown",
    roles = { [ROLE_CASTER_DPS] = true },
    classes = { [CLASS_MAGE] = true }
  },
  [16807] = {
    itemId = 16807,
    name = "Felheart Shoulder Pads",
    roles = { [ROLE_CASTER_DPS] = true },
    classes = { [CLASS_WARLOCK] = true }
  },
  [17063] = {
    itemId = 17063,
    name = "Band of Accuria",
    roles = { [ROLE_MELEE_DPS] = true, [ROLE_RANGED_DPS] = true, [ROLE_TANK] = true },
    classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true }
  }
}

local RAID_LIST = {
  ["Molten Core"] = { "Molten Core",
    { [16795] = true,
      [16807] = true,
      [17063] = true
    }
  },
  ["Blackwing Lair"] = { "Blackwing Lair", {} }
}

-- saved variables
PersonalRollLootDB = {
  PLAYER_LIST = {}
}
local PLAYER_LIST = PersonalRollLootDB.PLAYER_LIST

local function createNeedList(classIndex)
  local needlist = {}
  for itemId,item in pairs(ITEM_LIST) do
    if (item.classes[classIndex]) then
      needlist[itemId] = true
    end
  end
  return needlist
end

local function getPlayerByName(arg)
  if (not arg) then error("> No player name specified.", 0) end
  local name, realm = UnitName(arg)
  if not name then error("> No player found with the name '"..arg.."'.", 0) end
  if not realm then realm = GetRealmName() end
  return name, realm
end

local function getPlayer(arg)
  local name, realm = getPlayerByName(arg)
  local player = PLAYER_LIST[name]
  if (not player) then error("> No player registered with the name '"..name.."'.", 0) end
  return player
end

local function getRole(arg)
  if (not arg) then error("> No role specified.", 0) end

  local role = arg
  if (not ROLES[role]) then
    local errMsg = "> Undefined role '"..role.."'."
    errMsg = errMsg.."\nPossible roles:"
    for l,_ in pairs(ROLES) do
      errMsg = errMsg.."\n  "..l
    end
    error(errMsg, 0)
  end

  return role
end

local function getItem(arg)
  if (not arg) then error("> No item id or name specified.", 0) end
  local itemId = tonumber(arg) -- will be nil if not a number
  for _, item in pairs(ITEM_LIST) do
    if (item.itemId == itemId or item.name == arg) then
      return item
    end
  end
  error("> Item with itemId or name '"..arg.."' not found.", 0)
end

local function checkPlayerItem(player, item)
  local class = player["class"]
  if (not item.classes[class]) then
    local _,className,_ = UnitClass(player["name"])
    error("> Item '"..item.name.."' ("..item.itemId..") is not assigned to the class '"..className.."'.", 0)
  end
end

-- slash commands
local COMMANDS = {
  ["add-player"] = function(arg)
    local name, realm = getPlayerByName(arg)

    -- check if we already have the player
    if (PLAYER_LIST[name]) then error("> Player '"..name.."' already registered.", 0) end

    -- add the player to our database
    local _,class,classIndex = UnitClass(name)

    PLAYER_LIST[name] = {
      ["name"] = name,
      ["realm"] = realm,
      ["class"] = class,
      ["roles"] = {},
      ["need-list"] = createNeedList(classIndex)
    }
    print("> Added player '"..name.."-"..realm.."', "..class..".")
  end,

  ["remove-player"] = function(arg)
    local player = getPlayer(arg)
    local name = player["name"]

    -- remove the player
    PLAYER_LIST[name] = nil
    print("> Removed player '"..name.."'.")
  end,

  ["player-info"] = function(arg)
    local player = getPlayer(arg)

    print("> Player '"..player["name"].."', Class: "..player["class"]..",")

    print("Roles:")
    local roles = player["roles"]
    for l,_ in pairs(roles) do
      print("  "..l)
    end

    print("Need-list:")
    local needlist = player["need-list"]
    for itemId,_ in pairs(needlist) do
      local item = ITEM_LIST[itemId]
      if (item) then print("  "..item.name) end
    end
  end,

  ["add-role"] = function(arg)
    arg = arg or ""
    local arg1, arg2 = strsplit(" ", arg, 2)
    local player = getPlayer(arg1)
    local name = player["name"]
    local role = getRole(arg2)

    -- add role to player
    player["roles"][role] = true
    print("> Added role '"..role.."' to player '"..name.."'.")
  end,

  ["remove-role"] = function(arg)
    arg = arg or ""
    local arg1, arg2 = strsplit(" ", arg, 2)
    local player = getPlayer(arg1)
    local name = player["name"]
    local role = getRole(arg2)

    -- remove role from player
    player["roles"][role] = nil
    print("> Removed role '"..role.."' from player '"..name.."'.")
  end,

  ["add-item"] = function(arg)
    arg = arg or ""
    local arg1, arg2 = strsplit(" ", arg, 2)
    local player = getPlayer(arg1)
    local item = getItem(arg2)
    checkPlayerItem(player,item)
    local name = player["name"]

    -- add item to player
    player["need-list"][item.itemId] = true
    print("> Added item '"..item.name.."' ("..item.itemId..") to player '"..name.."'.")
  end,
  
  ["remove-item"] = function(arg)
    arg = arg or ""
    local arg1, arg2 = strsplit(" ", arg, 2)
    local player = getPlayer(arg1)
    local item = getItem(arg2)
    local name = player["name"]

    -- remove role from player
    if (player["need-list"][item.itemId]) then
      player["need-list"][item.itemId] = nil
      print("> Removed item '"..item.name.."' ("..item.itemId..") from player '"..name.."'.")
    else
      print("> The item '"..item.name.."' ("..item.itemId..") was not on the need-list for player '"..name.."'.")
    end
  end
}

SLASH_PersonalRollLoot1 = "/prl"
SLASH_PersonalRollLoot2 = "/personal"
SlashCmdList["PersonalRollLoot"] = function(s)
  PLAYER_LIST = PersonalRollLootDB.PLAYER_LIST
  local cmd, args = strsplit(" ", s, 2)
  local c = COMMANDS[cmd]
  if c then
    local status, err = pcall(c, args)
    if (not status) then print(err) end
  end
  PersonalRollLootDB.PLAYER_LIST = PLAYER_LIST
end
