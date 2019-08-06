-- namespace
local _, ns = ...;

local ScrollList = ns.ScrollList

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
local RAIDS = {
  [RAID_MOLTEN_CORE] = true,
  [RAID_BLACKWING_LAIR] = true
}

local RAID_MOLTEN_CORE = "Molten Core"
local RAID_BLACKWING_LAIR = "Blackwing Lair"

local ITEM_LIST = {
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
  [16807] = {
    itemId = 16807,
    name = "Felheart Shoulder Pads",
    roles = { [ROLE_CASTER_DPS] = true },
    classes = { [CLASS_WARLOCK] = true },
    raids = { [RAID_MOLTEN_CORE] = true }
  },
  [16837] = {
    itemId = 16837,
    name = "Earthfury Boots",
    roles = { [ROLE_HEALER] = true },
    classes = { [CLASS_SHAMAN] = true },
    raids = { [RAID_MOLTEN_CORE] = true }
  },
  [17063] = {
    itemId = 17063,
    name = "Band of Accuria",
    roles = { [ROLE_MELEE_DPS] = true, [ROLE_RANGED_DPS] = true, [ROLE_TANK] = true },
    classes = { [CLASS_WARRIOR] = true, [CLASS_PALADIN] = true, [CLASS_HUNTER] = true, [CLASS_ROGUE] = true, [CLASS_SHAMAN] = true, [CLASS_DRUID] = true },
    raids = { [RAID_MOLTEN_CORE] = true }
  }
}

-- saved variables
PersonalRollLootDB = {}
local PLAYER_LIST
local INSTANCE_LIST
local activateInstance

-- create an event frame
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
function eventFrame:OnEvent(event, arg1)
  if (event == "ADDON_LOADED") then
    PLAYER_LIST = PersonalRollLootDB["PLAYER_LIST"] or {}
    INSTANCE_LIST = PersonalRollLootDB["INSTANCE_LIST"] or {}
    activateInstance = PersonalRollLootDB["activateInstance"]
  end
end
eventFrame:SetScript("OnEvent", eventFrame.OnEvent);

local function shuffle( tInput )
    local tReturn = {}
    for i = #tInput, 1, -1 do
        local j = random(i)
        tInput[i], tInput[j] = tInput[j], tInput[i]
        tinsert(tReturn, tInput[i])
    end
    return tReturn
end

local function createNeedList(class)
  local needlist = {}
  for itemId,item in pairs(ITEM_LIST) do
    if (item.classes[class]) then
      needlist[itemId] = true
    end
  end
  return needlist
end

local function getPlayerNameAndRealm(arg)
  if (not arg) then error("> No player name specified.", 0) end
  local name, realm = UnitName(arg)
  if not name then error("> No player found with the name '"..arg.."'.", 0) end
  if not realm then realm = GetRealmName() end
  return name, realm
end

local function getPlayer(arg)
  local name, realm = getPlayerNameAndRealm(arg)
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

local function getInstance(name)
  if (not name) then error("> No instance name specified.", 0) end
  local instance = INSTANCE_LIST[name]
  if (not instance) then error("> No instance with the name '"..name.."' found.", 0) end
  return instance
end

local function checkPlayerItem(player, item)
  local class = player["class"]
  if (not item.classes[class]) then
    error("> Item '"..item.name.."' ("..item.itemId..") is not assigned to the class '"..class.."'.", 0)
  end
end

local function checkRaidName(raidName)
  if (not raidName) then error("> No raid name specified.", 0) end
  if (not RAIDS[raidName]) then error("> No raid with the name '"..raidName.."' found.", 0) end
end

local function isItemForInstance(item, instance)
  local raid = instance["raid"]
  return item["raids"][raid]
end

local function isItemForPlayer(item, player)
  local class = player["class"]
  local itemId = item["itemId"]
  -- check if the item can be used by the players class
  if (item["classes"][class]) then
    -- check if the item is on the players need-list
    if (player["need-list"][itemId]) then
      -- check if the item is assigned the players role
      for role,_ in pairs(item["roles"]) do
        if (player["roles"][role]) then
          return true
        end
      end
    end
  end
end

local function createLootList(instance, player)
  local name = player["name"]
  local items = {}
  local itemIndex = 1
  -- create a loot list
  local class = player["class"]
  for itemId, item in pairs(ITEM_LIST) do
    if (isItemForInstance(item,instance) and isItemForPlayer(item,player)) then
      items[itemIndex] = itemId
      itemIndex = itemIndex + 1
    end
  end
  -- shuffle the items
  items = shuffle(items)
  print("> Created loot table for player '"..name.."'.")
  return items
end

local function printInstanceInfo(instance)
    print("> Instance '"..instance["name"].."':")
    print("  Raid: '"..instance["raid"].."'")
    print("  created: "..instance["created"])
end

local function printMessage(text, type, receiver)
  if (not receiver) then
    print(text)
  else
    if (UnitExists(receiver)) then
      SendChatMessage(text, type, nil, receiver)
    end
  end
end

local function printPlayerInfo(player, receiver)
  local type = "WHISPER"
  printMessage("> Player '"..player["name"].."', Class: "..player["class"]..",", type, receiver)

  printMessage("Roles:", type, receiver)
  local roles = player["roles"]
  for l,_ in pairs(roles) do
    printMessage("  "..l, type, receiver)
  end

  printMessage("Need-list:", type, receiver)
  local needlist = player["need-list"]
  for itemId,_ in pairs(needlist) do
    local item = ITEM_LIST[itemId]
    if (item) then printMessage("  "..item.name, type, receiver) end
  end
end

local function createPlayer(name, realm, class)
  return {
      ["name"] = name,
      ["realm"] = realm,
      ["class"] = class,
      ["roles"] = getRolesForClass(class),
      ["need-list"] = createNeedList(class)
  }
end

-- slash commands
local COMMANDS = {
  ["add-player"] = function(arg)
    if (not arg) then
      local added = 0    
      local memberCount = GetNumGroupMembers()
      for index = 1, memberCount do
        local member = GetRaidRosterInfo(index)
        local name, realm = getPlayerNameAndRealm(member)

        if (not PLAYER_LIST[name]) and UnitIsPlayer(member) then
          local _,class,_ = UnitClass(member)
          PLAYER_LIST[name] = createPlayer(name,realm,class)
          added = added + 1
        end
      end
      print("> Added "..added.." players.")
    else
      local name, realm = getPlayerNameAndRealm(arg)
  
      -- check if we already have the player
      if (PLAYER_LIST[name]) then error("> Player '"..name.."' already registered.", 0) end
  
      -- add the player to our database
      if (not UnitIsPlayer(arg)) then error("> Unit '"..name.."' is not a player.", 0) end
      local _,class,_ = UnitClass(arg)
  
      PLAYER_LIST[name] = createPlayer(name,realm,class)
      print("> Added player '"..name.."-"..realm.."', "..class..".")
    end
  end,

  ["remove-player"] = function(arg)
    if (not arg) then error("> No player name specified.", 0) end
    local player = PLAYER_LIST[arg]
    if (not player) then player = getPlayer(arg) end
    
    local name = player["name"]
    -- remove the player
    PLAYER_LIST[name] = nil
    print("> Removed player '"..name.."'.")
  end,

  ["player-info"] = function(arg)
    local player = getPlayer(arg)
    printPlayerInfo(player, nil)
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
  end,
  
  ["create-instance"] = function(arg)
    arg = arg or ""
    local name, raidName = strsplit(" ", arg, 2)
    if (strlen(name) < 1) then error("> Invalid instance name '"..name.."'.", 0) end
    checkRaidName(raidName)

    if (INSTANCE_LIST[name]) then error("> An instance with the name '"..name.."' is already registered.", 0) end
    local creationTime = date("%y-%m-%d %H:%M:%S") 
    INSTANCE_LIST[name] = {
      ["name"] = name,
      ["raid"] = raidName,
      ["created"] = creationTime,
      ["players"] = {}
    }
    print("> Created new instance '"..name.."'.")
  end,
  
  ["delete-instance"] = function(arg)
    local instance = getInstance(arg)
    local name = instance["name"]
    INSTANCE_LIST[name] = nil
    print("> Removed instance '"..name.."'.")
    if (activateInstance == name) then activateInstance = nil end
  end,
  
  ["instance-info"] = function(arg)
    -- no arguments, print all instances
    if (not arg) then
      local empty = true
      for name,instance in pairs(INSTANCE_LIST) do
        printInstanceInfo(instance)
        empty = false
      end
      if (empty) then print("> No instances found.") end
    else
      local instance = getInstance(arg)
      printInstanceInfo(instance)
    end
  end,
  
  ["active-instance"] = function(arg)
    local instance = getInstance(arg)
    activateInstance = instance["name"]
    print("> Instance '"..activateInstance.."' is now the active instance.")
  end,
  
  ["invite"] = function(arg)
    if (not activateInstance) then error("> No active instance.", 0) end
    local instance = getInstance(activateInstance)

    if (not arg) then
      local invited = 0    
      local memberCount = GetNumGroupMembers()
      for index = 1, memberCount do
        local member = GetRaidRosterInfo(index)
        local name, realm = getPlayerNameAndRealm(member)
        local player = getPlayer(name)
        
        if (not instance["players"][name]) then
          instance["players"][name] = createLootList(instance,player)
          invited = invited + 1
        end
      end
      print("> Invited "..invited.." players.")
    else
      local player = getPlayer(arg)
      local name = player["name"]
      instance["players"][name] = createLootList(instance,player)
    end
  end,
  
  ["roll"] = function(arg)
    local instance = getInstance(activateInstance)
    local item = getItem(arg)
    local itemId = item["itemId"]
    
    print("> Rolling item '"..item.name.."' ("..item.itemId..")")
    local lootIndex = 1
    local roll
    repeat
      roll = false
      local playerList
      for name, lootlist in pairs(instance["players"]) do
        local lootId = lootlist[lootIndex]
        if (lootId) then
         -- keep on rolling
         roll = true
         if (itemId == lootId) then
          playerList = playerList or "Round "..lootIndex..":"
          playerList = playerList.." "..name
         end
        end
      end
      if (playerList) then print(playerList) end
      lootIndex = lootIndex + 1
    until(not roll)
  end,
  
  ["announce"] = function(arg)
    local memberCount = GetNumGroupMembers()
    for index = 1, memberCount do
      local member = GetRaidRosterInfo(index)
      local name, realm = getPlayerNameAndRealm(member)
      local player = PLAYER_LIST[name]
      if (player) then
        printPlayerInfo(player, name)
      else
        SendChatMessage("> You are not registered for Personal Roll Loot.", "WHISPER", nil, name)
      end
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
  
  PersonalRollLootDB["PLAYER_LIST"] = PLAYER_LIST
  PersonalRollLootDB["INSTANCE_LIST"] = INSTANCE_LIST
  PersonalRollLootDB["activateInstance"] = activateInstance
end


-- ------------------------------------------------------- --
-- create the UI                                           --
-- ------------------------------------------------------- --
local UIFrame
local playerNameField
local roleButtons = {}
local playerItemScrollList
local tabs = {}
local numTabs = 3
local playerTabFrame
local instancesTabFrame
local raidTabFrame

local instanceNameField
local instanceRaidField
local instanceCreatedField
local instancePlayersScrollList

UIFrame = CreateFrame("Frame", "PersonalRollLootConfig", UIParent, "UIPanelDialogTemplate")
UIFrame:SetAttribute("UIPanelLayout-defined", true)
UIFrame:SetAttribute("UIPanelLayout-enabled", true)
UIFrame:SetAttribute("UIPanelLayout-area", "left")
UIFrame:SetAttribute("UIPanelLayout-pushable", 5)
UIFrame:SetAttribute("UIPanelLayout-width", 660)
UIFrame:SetAttribute("UIPanelLayout-whileDead", true)
UIFrame:SetSize(440, 485)
UIFrame:SetPoint("CENTER")
UIFrame.Title:SetText("Personal Roll Loot")
UIFrame.numTabs = numTabs
HideUIPanel(UIFrame)
-- create tabs
for tabIndex = 1, numTabs do
  local tabButton = CreateFrame("Button", UIFrame:GetName().."Tab"..tabIndex, UIFrame, "CharacterFrameTabButtonTemplate")
  local tabFrame = CreateFrame("Frame", nil, UIFrame)
  tabButton.contentFrame = tabFrame
  tabs[tabIndex] = tabButton
  
  tabButton:SetID(tabIndex)
  tabButton:SetText("Tab"..tabIndex)
  tabButton:SetScript("OnClick", function()
    PanelTemplates_SetTab(UIFrame, tabIndex)
    for index, tab in pairs(tabs) do
      if (index == tabIndex) then
        tab.contentFrame:Show()
      else
        tab.contentFrame:Hide()
      end
    end
  end)  
  if (tabIndex == 1) then
    tabButton:SetPoint("TOPLEFT", UIFrame, "BOTTOMLEFT", 5, 7)
  else
    tabButton:SetPoint("TOPLEFT", tabs[tabIndex - 1], "TOPRIGHT", -14, 0)
  end
  
  tabFrame:SetPoint("TOPLEFT", PersonalRollLootConfigDialogBG, "TOPLEFT", 0, 0)
  tabFrame:SetPoint("BOTTOMRIGHT", PersonalRollLootConfigDialogBG, "BOTTOMRIGHT", 0, 0)
  if (tabIndex ~= 1) then tabFrame:Hide() end
end
PanelTemplates_SetTab(UIFrame, 1)
-- set the tab names
tabs[1]:SetText("Players")
tabs[2]:SetText("Instances")
tabs[3]:SetText("Active Raid")
playerTabFrame = tabs[1].contentFrame
instancesTabFrame = tabs[2].contentFrame
raidTabFrame = tabs[3].contentFrame

local playerScrollList = ScrollList.new("PersonalRollLootPlayerListScrollFrame", playerTabFrame, 20)
playerScrollList:SetPoint("TOPLEFT", playerTabFrame, "TOPLEFT", 6, -6)
playerScrollList:SetPoint("BOTTOMLEFT", playerTabFrame, "BOTTOMLEFT", 6, 36)
playerScrollList:SetWidth(180)
playerScrollList:SetButtonHeight(20)
playerScrollList:SetLabelProvider(function(k, v) return k end)
playerScrollList:SetContentProvider(function() return PLAYER_LIST end)
playerScrollList:SetButtonScript("OnClick", function(index, button, name, player)
  playerNameField:SetText(name..", "..player.class)
  for role in pairs(ROLES) do
    local roleButton = roleButtons[role]
    local checked = player.roles[role] == true
    roleButton:SetChecked(checked)
    if (CLASS_ROLES[player.class][role]) then
      roleButton:SetEnabled(true)
      roleButton.text:SetFontObject("GameFontNormal")
    else
      roleButton:SetEnabled(false)
      roleButton.text:SetFontObject("GameFontDisable")
    end
  end
  playerNameField.player = player
  playerItemScrollList:Update()
end)
CreateFrame("Frame", nil, playerScrollList:GetFrame(), "InsetFrameTemplate"):SetAllPoints()

playerNameField = playerTabFrame:CreateFontString(nil, "OVERLAY")
playerNameField:SetPoint("TOPLEFT", playerScrollList:GetFrame(), "TOPRIGHT", 40, -6)
playerNameField:SetFontObject("GameFontHighlightLEFT")
playerNameField:SetText("Player Name")
playerNameField:SetSize(180, 20)

-- role buttons
local roleIndex = 0
for role in pairs(ROLES) do
  local roleButton = CreateFrame("CheckButton", nil, playerTabFrame, "UICheckButtonTemplate")
  roleButton:SetPoint("TOPLEFT", playerNameField, "BOTTOMLEFT", 0, (-6 - 20 * roleIndex))
  roleButton.text:SetText(role)
  roleButton.text:SetFontObject("GameFontDisable")
  roleButton:SetEnabled(false)
  roleButton.role = role
  roleButton:SetScript("OnClick", function()
    local player = playerNameField.player
    if (player) then
      local checked = roleButton:GetChecked()
      if (checked) then
        player.roles[role] = true
      else
        player.roles[role] = nil
      end
    end
  end)
  roleButtons[role] = roleButton
  roleIndex = roleIndex + 1
end

-- item list
playerItemScrollList = ScrollList.new("PersonalRollLootPlayerItemListScrollFrame", playerTabFrame, 12)
playerItemScrollList:SetPoint("BOTTOMLEFT", playerScrollList:GetFrame(), "BOTTOMRIGHT", 34, 0)
playerItemScrollList:SetSize(180, 250)
playerItemScrollList:SetButtonHeight(20)
playerItemScrollList:SetContentProvider(function() return ITEM_LIST end)
playerItemScrollList:SetLabelProvider(function(k, v)
  local itemName = GetItemInfo(v.itemId)
  if (not itemName) then itemName = v.name end

  local disabled = true
  local player = playerNameField.player
  if (player) then
    if (player["need-list"][v.itemId]) then disabled = false end
  end
  
  return itemName, disabled
end)
playerItemScrollList:SetButtonScript("OnClick", function(index, button, itemId, item)
  local player = playerNameField.player
  if (player) then
    local state = player["need-list"][itemId]
    -- toggle the item state
    if (state) then state = nil else state = true end
    player["need-list"][itemId] = state
    playerItemScrollList:Update()
  end
end)
playerItemScrollList:SetFilter(function(itemId, item)
  local classes = item.classes
  local player = playerNameField.player
  if (player) then
    return item.classes[player.class]
  end
  return true
end)
-- border frame for the list
CreateFrame("Frame", nil, playerItemScrollList:GetFrame(), "InsetFrameTemplate"):SetAllPoints()

-- add and remove player buttons
local addPlayerButton = CreateFrame("Button", nil, playerTabFrame, "GameMenuButtonTemplate")
addPlayerButton:SetPoint("TOPLEFT", playerScrollList:GetFrame(), "BOTTOMLEFT", 10, -6)
addPlayerButton:SetPoint("TOPRIGHT", playerScrollList:GetFrame(), "BOTTOMRIGHT", -10, -6)
addPlayerButton:SetText("Add Player(s)")
addPlayerButton:SetScript("OnClick", function()
  local cmd = COMMANDS["add-player"]
  local name = UnitName("target")
  local status, err = pcall(cmd, name)
  if (not status) then
    print(err)
  else
    playerScrollList:Update()
  end
end)

local removePlayerButton = CreateFrame("Button", nil, playerTabFrame, "GameMenuButtonTemplate")
removePlayerButton:SetPoint("TOPLEFT", playerItemScrollList:GetFrame(), "BOTTOMLEFT", 10, -6)
removePlayerButton:SetPoint("TOPRIGHT", playerItemScrollList:GetFrame(), "BOTTOMRIGHT", -10, -6)
removePlayerButton:SetText("Remove Player")
removePlayerButton:SetScript("OnClick", function()
  local player = playerNameField.player
  if (player) then
    PLAYER_LIST[player.name] = nil
    -- update UI elements
    playerNameField:SetText("Player Name")
    playerNameField.player = nil
    playerScrollList:Update()
    playerItemScrollList:Update()
    for role, roleButton in pairs(roleButtons) do
      roleButton:SetChecked(false)
    end
  end
end)

-- instances tab
local instanceScrollList = ScrollList.new("PersonalRollLootInstanceListScrollFrame", instancesTabFrame, 16)
instanceScrollList:SetPoint("TOPLEFT", instancesTabFrame, "TOPLEFT", 6, -6)
instanceScrollList:SetPoint("BOTTOMLEFT", instancesTabFrame, "TOPLEFT", 6, -335)
instanceScrollList:SetWidth(180)
instanceScrollList:SetButtonHeight(20)
instanceScrollList:SetLabelProvider(function(k, v) return k end)
instanceScrollList:SetContentProvider(function() return INSTANCE_LIST end)
instanceScrollList:SetButtonScript("OnClick", function(index, button, name, instance)
  activateInstance = name
  instanceNameField:SetText("Instance: "..name)
  instanceRaidField:SetText("Raid: "..instance.raid)
  instanceCreatedField:SetText("Created: "..instance.created)
  instancePlayersScrollList:Update()
end)
CreateFrame("Frame", nil, instanceScrollList:GetFrame(), "InsetFrameTemplate"):SetAllPoints()

local newInstanceLabel = instancesTabFrame:CreateFontString(nil, "OVERLAY")
newInstanceLabel:SetPoint("TOPLEFT", instanceScrollList:GetFrame(), "BOTTOMLEFT", 6, -6)
newInstanceLabel:SetFontObject("GameFontNormalLEFT")
newInstanceLabel:SetText("New Instance")
newInstanceLabel:SetSize(180, 20)

local newInstanceEditBox = CreateFrame("Editbox", nil, instancesTabFrame, "InputBoxTemplate")
newInstanceEditBox:SetPoint("TOPLEFT", newInstanceLabel, "BOTTOMLEFT", 0, 0)
newInstanceEditBox:SetSize(180, 25)
newInstanceEditBox:SetAutoFocus(false)
newInstanceEditBox:ClearFocus()

local newInstanceRaidDropDown = CreateFrame("Frame", nil, instancesTabFrame, "UIDropDownMenuTemplate")
newInstanceRaidDropDown:SetPoint("TOPLEFT", newInstanceEditBox, "BOTTOMLEFT", -23, -6)
newInstanceRaidDropDown:SetHeight(25)
UIDropDownMenu_SetWidth(newInstanceRaidDropDown, 170) -- Use in place :SetWidth
UIDropDownMenu_Initialize(newInstanceRaidDropDown, function(self, level, menuList)
  local menuItem = UIDropDownMenu_CreateInfo()
  for raid in pairs(RAIDS) do
    menuItem.text = raid
    menuItem.func = function()
      newInstanceRaidDropDown.value = raid
      UIDropDownMenu_SetText(newInstanceRaidDropDown, raid)
    end
    UIDropDownMenu_AddButton(menuItem)
  end
end)

local addInstanceButton = CreateFrame("Button", nil, instancesTabFrame, "GameMenuButtonTemplate")
addInstanceButton:SetPoint("TOPLEFT", newInstanceEditBox, "BOTTOMLEFT", 10, -37)
addInstanceButton:SetPoint("TOPRIGHT", newInstanceEditBox, "BOTTOMRIGHT", -10, -37)
addInstanceButton:SetText("Add Instance")
addInstanceButton:SetScript("OnClick", function()
  local name = newInstanceEditBox:GetText()
  local raid = newInstanceRaidDropDown.value
  if (name and raid) then
    local cmd = COMMANDS["create-instance"]
    local status, err = pcall(cmd, name.." "..raid)
    if (not status) then
      print(err)
    else
      instanceScrollList:Update()
    end
    -- clear name
    newInstanceEditBox:SetText("")
  end
end)

instanceNameField = instancesTabFrame:CreateFontString(nil, "OVERLAY")
instanceNameField:SetPoint("TOPLEFT", instanceScrollList:GetFrame(), "TOPRIGHT", 40, -6)
instanceNameField:SetFontObject("GameFontHighlightLEFT")
instanceNameField:SetText("Instance:")
instanceNameField:SetSize(180, 20)

instanceRaidField = instancesTabFrame:CreateFontString(nil, "OVERLAY")
instanceRaidField:SetPoint("TOPLEFT", instanceNameField, "BOTTOMLEFT", 0, 0)
instanceRaidField:SetFontObject("GameFontHighlightLEFT")
instanceRaidField:SetText("Raid:")
instanceRaidField:SetSize(180, 20)

instanceCreatedField = instancesTabFrame:CreateFontString(nil, "OVERLAY")
instanceCreatedField:SetPoint("TOPLEFT", instanceRaidField, "BOTTOMLEFT", 0, 0)
instanceCreatedField:SetFontObject("GameFontHighlightLEFT")
instanceCreatedField:SetText("Created:")
instanceCreatedField:SetSize(180, 20)

instancesTabFrame:SetScript("OnShow", function()
  if (activateInstance) then
    local instance = INSTANCE_LIST[activateInstance]
    if (instance) then
      instanceNameField:SetText("Instance: "..instance.name)
      instanceRaidField:SetText("Raid: "..instance.raid)
      instanceCreatedField:SetText("Created: "..instance.created)
    end
  end
end)

local instancePlayersField = instancesTabFrame:CreateFontString(nil, "OVERLAY")
instancePlayersField:SetPoint("TOPLEFT", instanceCreatedField, "BOTTOMLEFT", 0, -6)
instancePlayersField:SetFontObject("GameFontNormalLEFT")
instancePlayersField:SetText("Players")
instancePlayersField:SetSize(180, 20)

instancePlayersScrollList = ScrollList.new("PersonalRollLootInstancePlayerListScrollFrame", instancesTabFrame, 20)
instancePlayersScrollList:SetPoint("TOPLEFT", instancePlayersField, "BOTTOMLEFT", -6, -6)
instancePlayersScrollList:SetPoint("BOTTOMLEFT", instancePlayersField, "BOTTOMLEFT", -6, -292)
instancePlayersScrollList:SetWidth(180)
instancePlayersScrollList:SetButtonHeight(20)
instancePlayersScrollList:SetLabelProvider(function(name, lootlist) return name end)
instancePlayersScrollList:SetContentProvider(function()
  if (activateInstance) then
    local instance = INSTANCE_LIST[activateInstance]
    if (instance) then
      return instance.players or {}
    end
  end
  return {}
end)
CreateFrame("Frame", nil, instancePlayersScrollList:GetFrame(), "InsetFrameTemplate"):SetAllPoints()

local inviteButton = CreateFrame("Button", nil, instancesTabFrame, "GameMenuButtonTemplate")
inviteButton:SetPoint("TOPLEFT", instancePlayersScrollList:GetFrame(), "BOTTOMLEFT", 10, -6)
inviteButton:SetPoint("TOPRIGHT", instancePlayersScrollList:GetFrame(), "BOTTOMRIGHT", -10, -6)
inviteButton:SetText("Invite")
inviteButton:SetScript("OnClick", function()
  local cmd = COMMANDS["invite"]
  local status, err = pcall(cmd)
  if (not status) then
    print(err)
  else
    instancePlayersScrollList:Update()
  end
end)

local deleteInstanceButton = CreateFrame("Button", nil, instancesTabFrame, "GameMenuButtonTemplate")
deleteInstanceButton:SetPoint("TOPLEFT", inviteButton, "BOTTOMLEFT", 0, -6)
deleteInstanceButton:SetPoint("TOPRIGHT", inviteButton, "BOTTOMRIGHT", 0, -6)
deleteInstanceButton:SetText("Delete Instance")
deleteInstanceButton:SetScript("OnClick", function()
  local cmd = COMMANDS["delete-instance"]
  local status, err = pcall(cmd, activateInstance)
  if (not status) then
    print(err)
  else
    instanceNameField:SetText("Instance:")
    instanceRaidField:SetText("Raid:")
    instanceCreatedField:SetText("Created:")
    instanceScrollList:Update()
    instancePlayersScrollList:Update()
  end
end)

toggleUI = function()
  if (UIFrame:IsShown()) then
    HideUIPanel(UIFrame)
  else
    ShowUIPanel(UIFrame)
  end
end

print("Addon loaded... PersonalRollLoot "..GetAddOnMetadata("PersonalRollLoot", "Version"))
