
local messageId = 0
local messages = {}
AddonMessage_Send = function(prefix, text, type, target)
    -- increment the messageId
    messageId = messageId + 1
    if (messageId > 9999) then messageId = 0 end

    local message = text
    local packets = {}

    while message do
        local part
        if (strlen(message) > 245) then
            part = strsub(message, 1, 240)
            message = strsub(message, 241)
        else
            part = message
            message = nil
        end
        local packet = messageId.."#"..part
        table.insert(packets, packet)
    end
    -- terminal packet
    table.insert(packets, messageId.."#")

    -- send each packet
    for i, packet in ipairs(packets) do
        ChatThrottleLib:SendAddonMessage("NORMAL", prefix, packet, type, target)
    end
end

AddonMessage_Receive = function(prefix, text, type, sender, action)
    local messageId, part = strsplit("#", text, 2)
    if (messageId) then
        if ((not part) or strlen(part) == 0) then
            -- the terminal packet
            local message = messages[messageId]
            if (message) then
                messages[messageId] = nil -- clear the message
                action(prefix, message, type, sender)
            end
        else
            -- append the message
            local message = messages[messageId] or ""
            message = message..part
            messages[messageId] = message
        end
    end
end
