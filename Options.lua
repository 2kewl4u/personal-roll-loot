-- namespace
local _, ns = ...;

local Options = {
    -- indicates whether newly added players should be automatically marked as trial
    markNewPlayersAsTrial,
    -- if junk items should be automatically rolled between raid or party members 
    rollJunkItems,
    -- if chat interaction via whisper and party chat should be enabled
    chatInteraction
}
ns.Options = Options

function Options.new()
    local self = setmetatable({}, Options)
    self.markNewPlayersAsTrial = true
    self.rollJunkItems = false
    self.chatInteraction = false
    return self
end