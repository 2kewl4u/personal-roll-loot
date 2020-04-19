-- namespace
local _, ns = ...;

local Options = {
    -- indicates whether newly added players should be automatically marked as trial
    markNewPlayersAsTrial,
    -- if junk items should be automatically rolled between raid or party members 
    rollJunkItems
}
ns.Options = Options

function Options.new()
    local self = setmetatable({}, Options)
    self.markNewPlayersAsTrial = true
    self.rollJunkItems = false
    return self
end