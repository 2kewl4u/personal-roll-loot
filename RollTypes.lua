-- namespace
local _, ns = ...;

local ROLL_NEED = "need"
local ROLL_GREED = "greed"
local ROLL_PASS = "pass"
local ROLL_REMOVE = "remove"

---
-- The list of available roll types.
-- 
local RollTypes = {
    ROLL_NEED,
    ROLL_GREED,
    ROLL_PASS,
    ROLL_REMOVE
}
ns.RollTypes = RollTypes
