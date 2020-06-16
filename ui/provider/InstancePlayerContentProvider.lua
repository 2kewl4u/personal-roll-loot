-- namespace
local _, ns = ...;

-- imports
local utils = ns.utils

---
-- The InstancePlayerContentProvider is a function that can be added to the
-- ScrollList to retrieve the players for the current raid instance.
-- 
local InstancePlayerContentProvider = {}
ns.InstancePlayerContentProvider = InstancePlayerContentProvider

---
-- This function can be set to a ScrollList.
-- 
-- Returns a set of player names that are either in the current group or raid,
-- or are invited already to the currently active instance.
-- 
-- @return #table
--          the players of the current raid instance
-- 
function InstancePlayerContentProvider.getElements()
    local elements = {}
    -- add the players from the current raid group
    utils.forEachRaidMember(function(name)
        elements[name] = true
    end)
    -- add the players from the instance invite
    if (ns.DB.activeInstance) then
        local instance = ns.DB.INSTANCE_LIST[ns.DB.activeInstance]
        if (instance and instance.players) then
            for name in pairs(instance.players) do
                elements[name] = true
            end
        end
    end
    return elements
end
