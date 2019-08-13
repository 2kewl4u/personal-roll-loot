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

function Item.of(itemInfo)
    local self = setmetatable(itemInfo, Item)
    
    local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType,
        itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice
        = GetItemInfo(itemInfo.itemId)
        
    self.name = itemName
    self.texture = itemTexture
    return self
end


ns.Item = Item