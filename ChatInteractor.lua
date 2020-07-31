-- namespace
local _, ns = ...;
-- imports
local Items = ns.Items
local ITEM_LIST = ns.ITEM_LIST
local Players = ns.Players
local RoleSelectionEvent = ns.RoleSelectionEvent
local PrioSelectionEvent = ns.PrioSelectionEvent
local utils = ns.utils

local commandHandlers = {}

commandHandlers["role"] = function(msg, player)
    local possibleRoles = ns.CLASS_ROLES[player.class]
    local roles = {}
    -- roles may be comma separated
    for _, split in ipairs({ strsplit(",", msg) }) do
        split = strtrim(split)
        for roleId, role in pairs(possibleRoles) do
            if (split == roleId or split == role.key) then
                roles[roleId] = true
                break
            end
        end
    end
    
    if (not utils.tblempty(roles)) then
        local rolesText = utils.toCSV(roles, tostring)
        if (not utils.tblequals(player.roles, roles)) then
            -- override the players roles
            player.roles = roles
            print("> Player '"..player.name.."' changed roles to '"..rolesText.."'.")
        end
        -- inform the player about its current roles
        SendChatMessage("Your current roles are: "..rolesText..".", "WHISPER", nil, player.name)
        
        -- create a RoleSelectionEvent
        local event = RoleSelectionEvent.new(nil, roles)
        Players.selectRole(player.name, event)
        
        -- if the instance is prio, respond with a description
        if (ns.DB.activeInstance) then
            local instance = ns.DB.INSTANCE_LIST[ns.DB.activeInstance]
            if (instance and instance.prio > 0) then
                local response = "To specify the prio items, use !prl prio "
                for i=1,instance.prio do
                    response = response.."[ItemLink"..tostring(i).."]"
                end
                SendChatMessage(response, "WHISPER", nil, player.name)
            end
        end
    else
        local response = "Invalid roles. Possible roles: "..utils.toCSV(possibleRoles, function(roleId, role)
            return role.key.." "..roleId
        end, ", ")
        SendChatMessage(response, "WHISPER", nil, player.name)
    end
end

commandHandlers["prio"] = function(msg, player)
    local prioItems = { Items.getItemIdsFromChat(msg) }

    -- quick item validation
    for index, itemId in ipairs(prioItems) do
        local item = ITEM_LIST[itemId]
        if (item and not player:needsItem(item)) then
            local response = "The item '"..item:getName().."' is not in your need-list."
            SendChatMessage(response, "WHISPER", nil, player.name)
            -- abort selection
            return
        end
    end
    
    local event = PrioSelectionEvent.new(nil, prioItems)
    Players.selectPrioItems(player.name, event)
    SendChatMessage("Prio items successfully specified.", "WHISPER", nil, player.name)
end

-- parse the whisper chat
local whisperEventFrame = CreateFrame("Frame")
whisperEventFrame:RegisterEvent("CHAT_MSG_WHISPER")
whisperEventFrame:SetScript("OnEvent", function(frame, event, arg1, arg2)
    local msg = arg1
    -- remove the realm part from the author
    local author = strsplit("-", arg2, 2)
    -- detect a prl command
    if (utils.strstarts(msg, "!prl ")) then
        local player = ns.DB.PLAYER_LIST[author]
        if (player) then
            msg = strsub(msg, 6)
            local cmd, rest = strsplit(" ", msg, 2)
            local handler = commandHandlers[cmd]
            if (handler) then
                handler(rest, player)
            else
                SendChatMessage("Unknown command.", "WHISPER", nil, author)
            end
        else
            print("> Player '"..author.."' is not registered for Personal Roll Loot.")
            SendChatMessage("You are not registered for Personal Roll Loot.", "WHISPER", nil, author)
        end
    end
end)
