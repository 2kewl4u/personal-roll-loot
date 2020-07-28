-- namespace
local _, ns = ...;
-- imports
local utils = ns.utils

local commandHandlers = {}

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
                handler(rest)
            else
                SendChatMessage("Unknown command.", "WHISPER", nil, author)
            end
        else
            print("> Player '"..author.."' is not registered for Personal Roll Loot.")
            SendChatMessage("You are not registered for Personal Roll Loot.", "WHISPER", nil, author)
        end
    end
end)
