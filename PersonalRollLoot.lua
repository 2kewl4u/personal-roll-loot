PersonalRollLoot = LibStub("AceAddon-3.0"):NewAddon("PersonalRollLoot")


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
  [CLASS_DRUID] = {
    [ROLE_CASTER_DPS] = true,
    [ROLE_HEALER] = true,
    [ROLE_MELEE_DPS] = true,
    [ROLE_TANK] = true
  }
}

local RAID_MOLTEN_CORE = "Molten Core"
local RAID_BLACKWING_LAIR = "Blackwing Lair"

local ITEM_LIST = {
  [16795] = { 
    itemId = 16795,
    name = "Arcanist Crown",
    roles = { [ROLE_CASTER_DPS] = true },
    classes = { [CLASS_MAGE] = true },
    raids = { RAID_MOLTEN_CORE }
  },
  [16807] = {
    itemId = 16807,
    name = "Felheart Shoulder Pads",
    roles = { [ROLE_CASTER_DPS] = true },
    classes = { [CLASS_WARLOCK] = true },
    raids = { RAID_MOLTEN_CORE }
  },
  [17063] = {
    itemId = 17063,
    name = "Band of Accuria",
    roles = { [ROLE_MELEE_DPS] = true, [ROLE_RANGED_DPS] = true, [ROLE_TANK] = true },
    classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
    raids = { RAID_MOLTEN_CORE }
  }
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

local function getRolesForClass(class)
  local classRoles = {}
  if (CLASS_ROLES[class]) then
    -- copy the roles
    for role,_ in pairs(CLASS_ROLES[class]) do
      classRoles[role] = true
    end
  end
  return classRoles
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

    local player = {
      ["name"] = name,
      ["realm"] = realm,
      ["class"] = class,
      ["roles"] = getRolesForClass(classIndex),
      ["need-list"] = createNeedList(classIndex)
    }
    PLAYER_LIST[name] = player
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

-- ------------------------------------------------------- --
-- register the slash commands and call the command table  --
-- ------------------------------------------------------- --
local toggleUI
SLASH_PersonalRollLoot1 = "/prl"
SLASH_PersonalRollLoot2 = "/personal"
SlashCmdList["PersonalRollLoot"] = function(s)
  PLAYER_LIST = PersonalRollLootDB.PLAYER_LIST
  local cmd, args = strsplit(" ", s, 2)
  local c = COMMANDS[cmd]
  if c then
    local status, err = pcall(c, args)
    if (not status) then print(err) end
  else
    -- no command specified, open the UI
    toggleUI()
  end
  PersonalRollLootDB.PLAYER_LIST = PLAYER_LIST
end


-- ------------------------------------------------------- --
-- create the UI                                           --
-- ------------------------------------------------------- --
local AceGUI = LibStub("AceGUI-3.0")
local UIFrame

local function closeUI(widget)
  AceGUI:Release(widget)
  UIFrame = nil
end

local function showUI()
  UIFrame = AceGUI:Create("Frame")
  UIFrame:SetCallback("OnClose", closeUI)
  UIFrame:SetTitle("Personal Roll Loot")
  UIFrame:SetLayout("Fill")
  
  -- create the tab group
  local tab =  AceGUI:Create("TabGroup")
  tab:SetLayout("Flow")
  -- Setup which tabs to show
  tab:SetTabs({{text="Players", value="PlayersTab"}, {text="Tab 2", value="tab2"}})
  -- Register callback
  
  -- function that draws the widgets for the first tab
  local function showPlayersTab(container)
    local scrollContainer = AceGUI:Create("InlineGroup")
--    scrollContainer:SetTitle("Player")
    scrollContainer:SetFullHeight(true)
    scrollContainer:SetRelativeWidth(0.3)
    scrollContainer:SetLayout("Fill")
    container:AddChild(scrollContainer)
    
    local scrollFrame = AceGUI:Create("ScrollFrame")
    scrollFrame:SetLayout("Flow")
    scrollContainer:AddChild(scrollFrame)

    for playerName,_ in pairs(PLAYER_LIST) do
      local label = AceGUI:Create("InteractiveLabel")
      label:SetText(playerName)
      label:SetFontObject(GameFontNormalLarge)
      label:SetHeight(18)
      scrollFrame:AddChild(label)
    end
    -- add a label at the end
    local label = AceGUI:Create("Label")
    scrollFrame:AddChild(label)
    
    local playerDetailsContainer = AceGUI:Create("InlineGroup")
    playerDetailsContainer:SetLayout("List")
    playerDetailsContainer:SetFullHeight(true)
    playerDetailsContainer:SetRelativeWidth(0.7)
--    playerDetailsContainer:SetTitle("Details")
    container:AddChild(playerDetailsContainer)
    
    local playerNameLabel = AceGUI:Create("Label")
    playerNameLabel:SetText("Player Name")
    playerDetailsContainer:AddChild(playerNameLabel)
    
    local playerRolesGroup = AceGUI:Create("InlineGroup")
    playerRolesGroup:SetLayout("Flow")
    playerRolesGroup:SetTitle("Roles")
    playerDetailsContainer:AddChild(playerRolesGroup)
    
    for role,_ in pairs(ROLES) do
      local roleBox = AceGUI:Create("CheckBox")
      roleBox:SetLabel(role)
      playerRolesGroup:AddChild(roleBox)
    end
    
    
    
  end
  
  -- function that draws the widgets for the second tab
  local function DrawGroup2(container)
    local desc = AceGUI:Create("Label")
    desc:SetText("This is Tab 2")
    desc:SetFullWidth(true)
    container:AddChild(desc)
    
    local button = AceGUI:Create("Button")
    button:SetText("Tab 2 Button")
    button:SetWidth(200)
    container:AddChild(button)
  end
  
  -- Callback function for OnGroupSelected
  local function SelectGroup(container, event, group)
     container:ReleaseChildren()
     if group == "PlayersTab" then
        showPlayersTab(container)
     elseif group == "tab2" then
        DrawGroup2(container)
     end
  end
  
  tab:SetCallback("OnGroupSelected", SelectGroup)
  -- Set initial Tab (this will fire the OnGroupSelected callback)
  tab:SelectTab("PlayersTab")
  
  -- add to the frame container
  UIFrame:AddChild(tab)
end

toggleUI = function()
  if (UIFrame) then
    closeUI(UIFrame)
  else
    showUI()
  end
end

print("Addon loaded... PersonalRollLoot "..GetAddOnMetadata("PersonalRollLoot", "Version"))
