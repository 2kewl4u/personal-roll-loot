-- namespace
local _, ns = ...;

local Options = {
    -- indicates whether newly added players should be automatically marked as trial
    markNewPlayersAsTrial
}
ns.Options = Options

function Options.new()
    local self = setmetatable({}, Options)
    self.markNewPlayersAsTrial = true
    return self
end