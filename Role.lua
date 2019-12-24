-- namespace
local _, ns = ...;

---
-- The Role represents the spec and role information for a class.
local Role = {
    -- the unique identifier for the role
    roleId,
    -- the display name for the role
    name,
    -- the class which can have this role
    class,
    -- a texture used to display the role
    texture
    -- TODO color
}
Role.__index = Role
ns.Role = Role

---
-- Creates a new Role with the given role information from the 'ROLES_LIST'.
--
-- @param #table roleInfo
--          the role information
--
-- @return #Role
--          the role
--
function Role.fromInfo(roleInfo)
    local self = setmetatable(roleInfo, Item)
    return self
end
