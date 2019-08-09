-- namespace
local _, ns = ...;
-- imports
local ScrollList = ns.ScrollList
local ITEM_LIST = ns.ITEM_LIST

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

local RAID_MOLTEN_CORE = "Molten Core"
local RAID_BLACKWING_LAIR = "Blackwing Lair"
local RAID_ONYXIA = "Onyxia's Lair"
local RAID_AHN_QIRAJ = "Ahn'Qiraj"
local RAIDS = {
  [RAID_MOLTEN_CORE] = true,
  [RAID_BLACKWING_LAIR] = true,
  [RAID_ONYXIA] = true,
  [RAID_AHN_QIRAJ] = true
}

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

-- saved variables
PersonalRollLootDB = {}
local PLAYER_LIST = {}
local INSTANCE_LIST = {}
local activateInstance

local function tblsize(tbl)
  local size = 0
  if (tbl) then
    for _ in pairs(tbl) do
      size = size + 1
    end
  end
  return size
end

local function keyToString(key, value) return tostring(key) end

local function toCSVList(list, enc)
  local csv = ""
  if (not list) then return csv end
  local first = true
  for key, value in pairs(list) do
    if (not first) then csv = csv.."," end
    csv = csv..enc(key, value)
    first = nil
  end
  return csv
end

local function fromCSVList(csv, dec)
  if (csv) then
    local list = {}
    local split = { strsplit(",", csv) }
    for _, element in pairs(split) do
      dec(list, element)
    end
    return list 
  end
end

local function encodePlayerInfo(player)
  if (not player) then return nil end

  local encoded = "player-info"
  encoded = encoded.." name:"..player.name
  encoded = encoded.." realm:"..player.realm
  encoded = encoded.." class:"..player.class
  encoded = encoded.." roles:"..toCSVList(player.roles, keyToString)
  encoded = encoded.." need-list:"..toCSVList(player["need-list"], keyToString)
  return encoded
end

local function decodePlayerInfo(info)
  local player = {}
  local split = { strsplit(" ", info) }
  for _, entry in pairs(split) do
    local k, v = strsplit(":", entry)
    player[k] = v
  end
  -- check that the player info is complete
  if (player.name and player.realm and player.class) then
    -- decode the csv lists
    local needcsv = player["need-list"]
    local needList = {}
    if (needcsv) then
      fromCSVList(needcsv, function(l, element)
        local index = tonumber(element)
        if (index) then needList[index] = true end
      end)
    end
    player["need-list"] = needList
    
    local rolescsv = player.roles
    local roles = {}
    if (rolescsv) then
      fromCSVList(rolescsv, function(l, element) roles[element] = true end)
    end
    player.roles = roles
    return player
  end
end

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

local function announceMemberInfo(player)
  local target = player.name
  local message = encodePlayerInfo(player)
--  C_ChatInfo.SendAddonMessage("PRLMemberInfo", msg, "WHISPER", receiver)
  AddonMessage_Send("PRLMemberInfo", message, "WHISPER", target)
end

-- ------------------------------------------------------- --
-- slash commands                                          --
-- ------------------------------------------------------- --
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
        announceMemberInfo(player)
      else
        SendChatMessage("> You are not registered for Personal Roll Loot.", "WHISPER", nil, name)
      end
    end
  end
}

-- ------------------------------------------------------- --
-- register the slash commands and call the command table  --
-- ------------------------------------------------------- --
local toggleMasterUI
local toggleMemberUI
SLASH_PersonalRollLootMember1 = "/prl"
SLASH_PersonalRollLootMember2 = "/personal"
SlashCmdList["PersonalRollLootMember"] = function(s)
  -- no command specified, open the UI
  toggleMemberUI()
end
SLASH_PersonalRollLootMaster1 = "/prlm"
SLASH_PersonalRollLootMaster2 = "/personalmaster"
SlashCmdList["PersonalRollLootMaster"] = function(s)
  local cmd, args = strsplit(" ", s, 2)
  local c = COMMANDS[cmd]
  if c then
    local status, err = pcall(c, args)
    if (not status) then print(err) end
  else
    -- no command specified, open the UI
    toggleMasterUI()
  end
  
  PersonalRollLootDB["PLAYER_LIST"] = PLAYER_LIST
  PersonalRollLootDB["INSTANCE_LIST"] = INSTANCE_LIST
  PersonalRollLootDB["activateInstance"] = activateInstance
end

local test
SLASH_PersonalRollLootTest1 = "/test"
SlashCmdList["PersonalRollLootTest"] = function(s) test(s) end



-- ------------------------------------------------------- --
-- create the UI                                           --
-- ------------------------------------------------------- --
local MasterUIFrame
local playerNameField
local roleButtons = {}
local playerItemScrollList
local tabs = {}
local numTabs = 3
local playerTabFrame
local instancesTabFrame
local rollTabFrame

local instanceNameField
local instanceRaidField
local instanceCreatedField
local instancePlayersScrollList

MasterUIFrame = CreateFrame("Frame", "PersonalRollLootMaster", UIParent, "UIPanelDialogTemplate")
MasterUIFrame:SetAttribute("UIPanelLayout-defined", true)
MasterUIFrame:SetAttribute("UIPanelLayout-enabled", true)
MasterUIFrame:SetAttribute("UIPanelLayout-area", "left")
MasterUIFrame:SetAttribute("UIPanelLayout-pushable", 5)
MasterUIFrame:SetAttribute("UIPanelLayout-width", 390)
MasterUIFrame:SetAttribute("UIPanelLayout-whileDead", true)
MasterUIFrame:SetSize(390, 485)
MasterUIFrame:SetPoint("CENTER")
MasterUIFrame.Title:SetText("Personal Roll Loot - Master")
MasterUIFrame.numTabs = numTabs
HideUIPanel(MasterUIFrame)
-- create tabs
for tabIndex = 1, numTabs do
  local tabButton = CreateFrame("Button", MasterUIFrame:GetName().."Tab"..tabIndex, MasterUIFrame, "CharacterFrameTabButtonTemplate")
  local tabFrame = CreateFrame("Frame", nil, MasterUIFrame)
  tabButton.contentFrame = tabFrame
  tabs[tabIndex] = tabButton
  
  tabButton:SetID(tabIndex)
  tabButton:SetText("Tab"..tabIndex)
  tabButton:SetScript("OnClick", function()
    PanelTemplates_SetTab(MasterUIFrame, tabIndex)
    for index, tab in pairs(tabs) do
      if (index == tabIndex) then
        tab.contentFrame:Show()
      else
        tab.contentFrame:Hide()
      end
    end
  end)  
  if (tabIndex == 1) then
    tabButton:SetPoint("TOPLEFT", MasterUIFrame, "BOTTOMLEFT", 5, 7)
  else
    tabButton:SetPoint("TOPLEFT", tabs[tabIndex - 1], "TOPRIGHT", -14, 0)
  end
  
  tabFrame:SetPoint("TOPLEFT", PersonalRollLootMasterDialogBG, "TOPLEFT", 0, 0)
  tabFrame:SetPoint("BOTTOMRIGHT", PersonalRollLootMasterDialogBG, "BOTTOMRIGHT", 0, 0)
  if (tabIndex ~= 1) then tabFrame:Hide() end
end
PanelTemplates_SetTab(MasterUIFrame, 1)
-- set the tab names
tabs[1]:SetText("Players")
tabs[2]:SetText("Instances")
tabs[3]:SetText("Roll")
playerTabFrame = tabs[1].contentFrame
instancesTabFrame = tabs[2].contentFrame
rollTabFrame = tabs[3].contentFrame

local playerScrollList = ScrollList.new("PersonalRollLootPlayerListScrollFrame", playerTabFrame, 20)
playerScrollList:SetPoint("TOPLEFT", playerTabFrame, "TOPLEFT", 6, -6)
playerScrollList:SetPoint("BOTTOMLEFT", playerTabFrame, "BOTTOMLEFT", 6, 36)
playerScrollList:SetWidth(155)
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
  
  -- announce player TODO for testing, remove this later
  announceMemberInfo(player)  
end)
CreateFrame("Frame", nil, playerScrollList:GetFrame(), "InsetFrameTemplate"):SetAllPoints()

playerNameField = playerTabFrame:CreateFontString(nil, "OVERLAY")
playerNameField:SetPoint("TOPLEFT", playerScrollList:GetFrame(), "TOPRIGHT", 40, -6)
playerNameField:SetFontObject("GameFontHighlightLEFT")
playerNameField:SetText("Player Name")
playerNameField:SetSize(155, 20)

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
    local name = player.name
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
playerItemScrollList = ScrollList.new("PersonalRollLootPlayerItemListScrollFrame", playerTabFrame, 6, "LargeItemButtonTemplate")
playerItemScrollList:SetPoint("BOTTOMLEFT", playerScrollList:GetFrame(), "BOTTOMRIGHT", 34, 0)
playerItemScrollList:SetSize(155, 250)
playerItemScrollList:SetButtonHeight(41)
playerItemScrollList:SetContentProvider(function() return ITEM_LIST end)
playerItemScrollList:SetLabelProvider(function(itemId, item, button)
  local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType,
        itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(item.itemId)

  local disabled = true
  local player = playerNameField.player
  if (player) then
    if (player["need-list"][item.itemId]) then disabled = false end
  end

  if (itemName) then
    button.Icon:SetTexture(itemTexture)
    button.Name:SetText(itemName)
    if (disabled) then
      button.Name:SetFontObject("GameFontDisable")
    else
      button.Name:SetFontObject("GameFontHighlight")
    end
  end
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
playerItemScrollList:SetButtonScript("OnEnter", function(index, button, itemId, item)
  GameTooltip:SetOwner(button, "ANCHOR_BOTTOMRIGHT")
  GameTooltip:SetItemByID(itemId)
end)
playerItemScrollList:SetButtonScript("OnLeave", function()
  GameTooltip:Hide()
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
instanceScrollList:SetWidth(155)
instanceScrollList:SetButtonHeight(20)
instanceScrollList:SetLabelProvider(function(k, v) return k end)
instanceScrollList:SetContentProvider(function() return INSTANCE_LIST end)
instanceScrollList:SetButtonScript("OnClick", function(index, button, name, instance)
  activateInstance = name
  instanceNameField:SetText("Instance: "..name)
  instanceRaidField:SetText("Raid: "..instance.raid)
  instanceCreatedField:SetText(instance.created)
  instancePlayersScrollList:Update()
end)
CreateFrame("Frame", nil, instanceScrollList:GetFrame(), "InsetFrameTemplate"):SetAllPoints()

local newInstanceLabel = instancesTabFrame:CreateFontString(nil, "OVERLAY")
newInstanceLabel:SetPoint("TOPLEFT", instanceScrollList:GetFrame(), "BOTTOMLEFT", 6, -6)
newInstanceLabel:SetFontObject("GameFontNormalLEFT")
newInstanceLabel:SetText("New Instance")
newInstanceLabel:SetSize(155, 20)

local newInstanceEditBox = CreateFrame("Editbox", nil, instancesTabFrame, "InputBoxTemplate")
newInstanceEditBox:SetPoint("TOPLEFT", newInstanceLabel, "BOTTOMLEFT", 0, 0)
newInstanceEditBox:SetSize(155, 25)
newInstanceEditBox:SetAutoFocus(false)
newInstanceEditBox:ClearFocus()

local newInstanceRaidDropDown = CreateFrame("Frame", nil, instancesTabFrame, "UIDropDownMenuTemplate")
newInstanceRaidDropDown:SetPoint("TOPLEFT", newInstanceEditBox, "BOTTOMLEFT", -23, -6)
newInstanceRaidDropDown:SetHeight(25)
UIDropDownMenu_SetWidth(newInstanceRaidDropDown, 145) -- Use in place :SetWidth
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
instanceNameField:SetSize(155, 20)

instanceRaidField = instancesTabFrame:CreateFontString(nil, "OVERLAY")
instanceRaidField:SetPoint("TOPLEFT", instanceNameField, "BOTTOMLEFT", 0, 0)
instanceRaidField:SetFontObject("GameFontHighlightLEFT")
instanceRaidField:SetText("Raid:")
instanceRaidField:SetSize(155, 20)

instanceCreatedField = instancesTabFrame:CreateFontString(nil, "OVERLAY")
instanceCreatedField:SetPoint("TOPLEFT", instanceRaidField, "BOTTOMLEFT", 0, 0)
instanceCreatedField:SetFontObject("GameFontHighlightLEFT")
--instanceCreatedField:SetText("Created:")
instanceCreatedField:SetSize(155, 20)

instancesTabFrame:SetScript("OnShow", function()
  if (activateInstance) then
    local instance = INSTANCE_LIST[activateInstance]
    if (instance) then
      instanceNameField:SetText("Instance: "..instance.name)
      instanceRaidField:SetText("Raid: "..instance.raid)
      instanceCreatedField:SetText(instance.created)
    end
  end
end)

local instancePlayersField = instancesTabFrame:CreateFontString(nil, "OVERLAY")
instancePlayersField:SetPoint("TOPLEFT", instanceCreatedField, "BOTTOMLEFT", 0, -6)
instancePlayersField:SetFontObject("GameFontNormalLEFT")
instancePlayersField:SetText("Players")
instancePlayersField:SetSize(155, 20)

instancePlayersScrollList = ScrollList.new("PersonalRollLootInstancePlayerListScrollFrame", instancesTabFrame, 20)
instancePlayersScrollList:SetPoint("TOPLEFT", instancePlayersField, "BOTTOMLEFT", -6, -6)
instancePlayersScrollList:SetPoint("BOTTOMLEFT", instancePlayersField, "BOTTOMLEFT", -6, -292)
instancePlayersScrollList:SetWidth(155)
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
--    instanceCreatedField:SetText("Created:")
    instanceScrollList:Update()
    instancePlayersScrollList:Update()
  end
end)

local rollItemsScrollList = ScrollList.new("PersonalRollLootRollItemScrollFrame", rollTabFrame, 10, "LargeItemButtonTemplate")
rollItemsScrollList:SetPoint("TOPLEFT", rollTabFrame, "TOPLEFT", 6, -6)
rollItemsScrollList:SetPoint("BOTTOMLEFT", rollTabFrame, "BOTTOMLEFT", 6, 30)
rollItemsScrollList:SetWidth(155)
rollItemsScrollList:SetButtonHeight(41)
rollItemsScrollList:SetContentProvider(function() return ITEM_LIST end)
rollItemsScrollList:SetLabelProvider(function(itemId, item, button)
  local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType,
        itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(item.itemId)
  -- in case we got no info
  if (itemName) then 
    button.Icon:SetTexture(itemTexture)
    button.Name:SetText(itemName)
  end
end)
CreateFrame("Frame", nil, rollItemsScrollList:GetFrame(), "InsetFrameTemplate"):SetAllPoints()
rollItemsScrollList:SetButtonScript("OnEnter", function(index, button, itemId, item)
  GameTooltip:SetOwner(button, "ANCHOR_BOTTOMRIGHT")
  GameTooltip:SetItemByID(itemId)
end)
rollItemsScrollList:SetButtonScript("OnLeave", function()
  GameTooltip:Hide()
end)
rollItemsScrollList:SetButtonScript("OnClick", function(index, button, itemId, item)
  local cmd = COMMANDS["roll"]
  local status, err = pcall(cmd, itemId)
  if (not status) then print(err) end
end)
rollItemsScrollList:SetFilter(function(itemId, item)
  if (activateInstance) then
    local instance = INSTANCE_LIST[activateInstance]
    return item.raids[instance.raid]    
  end
end)

-- ------------------------------------------------------- --
-- create the member UI                                    --
-- ------------------------------------------------------- --
local MemberUIFrame
local memberTabFrame
local memberNameField
local memberRoleButtons = {}
local memberItemScrollList
local memberInfo
local updateMemberInfo
local createMemberInfo

MemberUIFrame = CreateFrame("Frame", "PersonalRollLootMember", UIParent, "UIPanelDialogTemplate")
MemberUIFrame:SetAttribute("UIPanelLayout-defined", true)
MemberUIFrame:SetAttribute("UIPanelLayout-enabled", true)
MemberUIFrame:SetAttribute("UIPanelLayout-area", "left")
MemberUIFrame:SetAttribute("UIPanelLayout-pushable", 6)
MemberUIFrame:SetAttribute("UIPanelLayout-width", 390)
MemberUIFrame:SetAttribute("UIPanelLayout-whileDead", true)
MemberUIFrame:SetSize(390, 485)
MemberUIFrame:SetPoint("CENTER")
MemberUIFrame.Title:SetText("Personal Roll Loot")
HideUIPanel(MemberUIFrame)

memberTabFrame = CreateFrame("Frame", nil, MemberUIFrame)
memberTabFrame:SetPoint("TOPLEFT", PersonalRollLootMemberDialogBG, "TOPLEFT", 0, 0)
memberTabFrame:SetPoint("BOTTOMRIGHT", PersonalRollLootMemberDialogBG, "BOTTOMRIGHT", 0, 0)
memberTabFrame:SetScript("OnShow", function() updateMemberInfo() end)

memberNameField = memberTabFrame:CreateFontString(nil, "OVERLAY")
memberNameField:SetPoint("TOPLEFT", memberTabFrame, "TOPLEFT", 12, -12)
memberNameField:SetFontObject("GameFontHighlightLEFT")
memberNameField:SetText("Player Name")
memberNameField:SetSize(155, 20)

-- role buttons
local roleIndex = 0
for role in pairs(ROLES) do
  local roleButton = CreateFrame("CheckButton", nil, memberTabFrame, "UICheckButtonTemplate")
  roleButton:SetPoint("TOPLEFT", memberNameField, "BOTTOMLEFT", 0, (-6 - 20 * roleIndex))
  roleButton.text:SetText(role)
  roleButton.text:SetFontObject("GameFontDisable")
  roleButton:SetEnabled(false)
  roleButton.role = role
  memberRoleButtons[role] = roleButton
  roleIndex = roleIndex + 1
end

-- item list
memberItemScrollList = ScrollList.new("PersonalRollLootMemberItemListScrollFrame", memberTabFrame, 6, "LargeItemButtonTemplate")
memberItemScrollList:SetPoint("BOTTOMLEFT", memberTabFrame, "BOTTOMLEFT", 6, 36)
memberItemScrollList:SetSize(155, 250)
memberItemScrollList:SetButtonHeight(41)
memberItemScrollList:SetContentProvider(function() return ITEM_LIST end)
memberItemScrollList:SetLabelProvider(function(itemId, item, button)
  local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType,
        itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(item.itemId)

  local disabled = true
  local player = memberInfo
  if (player) then
    if (player["need-list"][item.itemId]) then disabled = false end
  end

  if (itemName) then
    button.Icon:SetTexture(itemTexture)
    button.Name:SetText(itemName)
    if (disabled) then
      button.Name:SetFontObject("GameFontDisable")
    else
      button.Name:SetFontObject("GameFontHighlight")
    end
  end
end)
memberItemScrollList:SetFilter(function(itemId, item)
  local classes = item.classes
  local player = memberInfo
  if (player) then
    return item.classes[player.class]
  end
  return true
end)
memberItemScrollList:SetButtonScript("OnEnter", function(index, button, itemId, item)
  GameTooltip:SetOwner(button, "ANCHOR_BOTTOMRIGHT")
  GameTooltip:SetItemByID(itemId)
end)
memberItemScrollList:SetButtonScript("OnLeave", function()
  GameTooltip:Hide()
end)
CreateFrame("Frame", nil, memberItemScrollList:GetFrame(), "InsetFrameTemplate"):SetAllPoints()


createMemberInfo = function()
  if (not memberInfo) then
    local name, realm = UnitName("player")
    local _, class = UnitClass("player")
    memberInfo = createPlayer(name,realm,class)
    memberInfo.roles = {}
    memberInfo["need-list"] = {}
  end
end

updateMemberInfo = function()
  -- create the member info if not present
  createMemberInfo()
  local class = memberInfo.class
  memberNameField:SetText(memberInfo.name..", "..class)
  for role in pairs(ROLES) do
    local roleButton = memberRoleButtons[role]
    if (memberInfo.roles[role]) then
      roleButton:SetChecked(true)
    else
      roleButton:SetChecked(false)
    end
    if (CLASS_ROLES[class][role]) then
      roleButton.text:SetFontObject("GameFontNormal")
    end
  end
  memberItemScrollList:Update()
end

local toggleUI = function(frame)
  if (frame:IsShown()) then
    HideUIPanel(frame)
  else
    ShowUIPanel(frame)
  end
end
toggleMasterUI = function() toggleUI(MasterUIFrame) end
toggleMemberUI = function() toggleUI(MemberUIFrame) end


test = function()
  local a, b = strsplit("#", "a#", 2)
  print(a)
  print(b)
  print(strlen(b))
end

local function receiveMemberInfo(msg)
  -- create the member info if not present
  createMemberInfo()
  if (msg) then
    local player = decodePlayerInfo(msg)
    if (player) then
      memberInfo.roles = player.roles or {}
      memberInfo["need-list"] = player["need-list"] or {}
      -- update the member info
      updateMemberInfo()
    end
  end
end

-- create an event frame
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("CHAT_MSG_ADDON")
C_ChatInfo.RegisterAddonMessagePrefix("PRLMemberInfo")
function eventFrame:OnEvent(event, arg1, arg2, arg3, arg4)
  if (event == "ADDON_LOADED") then
    PLAYER_LIST = PersonalRollLootDB["PLAYER_LIST"] or {}
    INSTANCE_LIST = PersonalRollLootDB["INSTANCE_LIST"] or {}
    activateInstance = PersonalRollLootDB["activateInstance"]
  elseif (event == "CHAT_MSG_ADDON") then
--    print("received addon message: "..arg2)
--    print("from: "..arg4)
    AddonMessage_Receive(arg1, arg2, arg3, arg4, function(prefix, message, type, sender)
      if (prefix == "PRLMemberInfo") then
        receiveMemberInfo(message)
      end
    end)
  end
end
eventFrame:SetScript("OnEvent", eventFrame.OnEvent)

print("Addon loaded... PersonalRollLoot "..GetAddOnMetadata("PersonalRollLoot", "Version"))
