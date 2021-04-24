-- namespace
local _, ns = ...;

---
-- The DelayTimer is used to block requests that otherwise would cause a lot of
-- traffic. A delay is specified so that subsequent requests can be delayed.
-- 
local DelayTimer = {
    delay,
    lastRequest
}
DelayTimer.__index = DelayTimer
ns.DelayTimer = DelayTimer


---
-- Creates a new DelayTimer with the given delay in seconds.
-- 
-- @param #number delay
--          the delay in seconds
-- 
function DelayTimer.new(delay)
    local self = setmetatable({}, DelayTimer)
    self.delay = delay
    return self
end

---
-- Checks whether the timer delay has been expired. If the method returns false
-- the delay is also reseted, thus subsequent calls are likely to return true.
-- 
-- @return #boolean
--          true if the delay is active, false otherwise
--
function DelayTimer:isDelay()
    local timer = self
    local lastRequest = timer.lastRequest
    local now = time()
    local delay = lastRequest and ((now - lastRequest) < timer.delay)
    if (not delay) then
        timer.lastRequest = now
    end
    return delay
end