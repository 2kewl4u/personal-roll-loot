-- namespace
local _, ns = ...;

local Item = {
    itemId,
    name,
    texture,
    roles,
    classes,
    raids
}
Item.__index = Item

function Item.fromInfo(itemInfo)
    local self = setmetatable(itemInfo, Item)
    return self
end

ns.Item = Item