-- namespace
local _, ns = ...;

---
-- The ScrollList is a UI widget that contains several buttons that can be
-- scrolled. The contained buttons can also be sorted and filtered.
--  
ns.ScrollList = {
    -- class fields
    buttons,
    frame,
    numToDisplay,
    buttonHeight = 25,
    labelProvider = function(k, v) return tostring(v) end,
    contentProvider = function() return {} end,
    filter = function() return true end,
    sorter = function(key1, value1, key2, value2) return key1 < key2 end,
    buttonScript,
    offset = 0
}
local ScrollList = ns.ScrollList
ScrollList.__index = ScrollList

---
-- Returns the items to be displayed in the ScrollList obtained from the content
-- provider, filtered and then sorted accordingly.
-- 
-- @param #ScrollList self
--          the scroll list
-- 
-- @return #list
--          a list of items [{ key1, value1 }, { key2, value2 }, ... ]
-- 
local function getItems(self)
    local items = self.contentProvider()
    -- filter the items
    local filteredItems = {}
    for key, value in pairs(items) do
        if (self.filter(key, value) == true) then
            filteredItems[key] = value
        end
    end
    -- sort the items
    local sortedItems = {}
    for key, value in pairs(filteredItems) do
        table.insert(sortedItems, { key, value })
    end

    if (self.sorter) then
        table.sort(sortedItems, function(entry1, entry2)
            return self.sorter(entry1[1], entry1[2], entry2[1], entry2[2])
        end)
    end
    return sortedItems
end

---
-- Updates the ScrollList, obtaining a fresh list of items from the content
-- provider and updates the buttons.
-- 
-- @param #ScrollList self
--          the scoll list to be updated
-- 
local function updateScrollFrame(self)
    local scrollFrame = self.frame
    local items = getItems(self)
    local itemCount = #(items)
    local numToDisplay = self.numToDisplay
    FauxScrollFrame_Update(scrollFrame, itemCount, numToDisplay, self.buttonHeight, nil, nil, nil, nil, nil, nil, true)
    local offset = FauxScrollFrame_GetOffset(scrollFrame)

    local line = 0
    for index, entry in ipairs(items) do
        local key = entry[1]
        local value = entry[2]
        if (self.filter(key, value) == true) then
            local lineminusoffset = line - offset
            if (lineminusoffset >= numToDisplay) then break end
            if (line >= offset and lineminusoffset <= numToDisplay) then
                local button = self.buttons[lineminusoffset + 1]
                if (button) then
                    local text, disabled = self.labelProvider(key, value, button)
                    button:SetText(tostring(text or ""))
                    if (disabled) then
                        button:SetNormalFontObject("GameFontDisableLeft")
                    else
                        button:SetNormalFontObject("GameFontHighlightLeft")
                    end
                    button:Show()
                    button.item = { key = key, value = value }
                    -- notify that the button got visible
                    local script = self.buttonScript["OnUpdate"]
                    if (script) then script(button.index, button, key, value) end
                end
            else
                if (lineminusoffset >= 0 and lineminusoffset < numToDisplay) then
                    local button = self.buttons[lineminusoffset + 1]
                    if (button) then
                        button:Hide()
                        button.item = nil
                    end
                end
            end
            line = line + 1
        end
    end

    -- hide unused items
    while (line < numToDisplay) do
        local button = self.buttons[line + 1]
        if (button) then
            button:Hide()
            button.item = nil
        end
        line = line + 1;
    end
end

---
-- Creates a new ScrollList. The list requires a unique global name.
-- 
-- After the creation of the ScrollList, a button height must be set to
-- correctly position the buttons relative to the ScrollList.
-- 
-- @param #string globalName
--          the global name of the ScrollList
-- @param #Frame parentFrame
--          the parent frame to attach the ScrollList to
-- @param #number numToDisplay
--          the number of buttons to be displayed
-- @param #string buttonTemplate
--          a template used for the buttons
-- 
function ScrollList.new(globalName, parentFrame, numToDisplay, buttonTemplate)
    local self = setmetatable({}, ScrollList)
    local list = self
    self.numToDisplay = numToDisplay
    self.buttonScript = {}

    -- create the scroll frame
    local frame = CreateFrame("ScrollFrame", globalName, parentFrame, "FauxScrollFrameTemplate")
    frame:SetScript("OnVerticalScroll", function(self, offset)
        FauxScrollFrame_OnVerticalScroll(self, offset, list.buttonHeight, function() updateScrollFrame(list) end)
    end)
    frame:SetScript("OnShow", function() updateScrollFrame(list) end)

    frame.list = self
    self.frame = frame

    -- create the buttons within the frame
    local buttons = {}
    for buttonIndex = 1, numToDisplay do
        local button = CreateFrame("Button", nil, frame, buttonTemplate)
        button:SetNormalFontObject("GameFontHighlightLeft")
        button:SetHighlightFontObject("GameFontNormal")

        -- register events
        local events = { "OnClick", "OnEnter", "OnLeave" }
        for _, event in pairs(events) do
            button:SetScript(event, function(self, mouseButton)
                local item = button.item
                if (item) then
                    local script = list.buttonScript[event]
                    if (script) then script(buttonIndex, button, item.key, item.value) end
                end
            end)
        end
        button.index = buttonIndex
        buttons[buttonIndex] = button
    end
    self.buttons = buttons

    return self
end

---
-- Sets the attachment point of this ScrollList component.
-- 
-- @param #string point
--          point of the object to adjust based on the anchor, e.g. "TOP",
--          "RIGHT", etc.
-- @param #string/widget relativeFrame
--          name or reference to a frame to attach obj to
-- @param #string relativePoint
--          point of the relativeFrame to attach point of obj to
-- @param #number ofsx
--          x-offset
-- @param #number ofsy
--          y-offset
-- 
function ScrollList:SetPoint(point, relativeFrame, relativePoint, ofsx, ofsy)
    self.frame:SetPoint(point, relativeFrame, relativePoint, ofsx, ofsy)
end

---
-- Sets the ScrollList's width and height.
-- 
-- @param #number width
--          the width in px
-- @param #number height
--          the height in px
--  
function ScrollList:SetSize(width, height)
    self:SetWidth(width)
    self:SetHeight(height)
end

---
-- Sets the ScrollList's width.
-- 
-- @param #number width
--          the width in px
--  
function ScrollList:SetWidth(width)
    self.frame:SetWidth(width)
    for i, button in pairs(self.buttons) do
        button:SetWidth(width)
    end
end

---
-- Sets the ScrollList's height.
-- 
-- @param #number height
--          the height in px
--  
function ScrollList:SetHeight(height)
    self.frame:SetHeight(height)
end

---
-- Sets the height of the ScrollList buttons.
-- 
-- @param #number buttonHeight
--          the height of the buttons in px
-- 
function ScrollList:SetButtonHeight(buttonHeight)
    self.buttonHeight = buttonHeight
    local relativeFrame = self.frame
    local relativePoint = "TOPLEFT"
    local ofsx = 6
    local ofsy = -6
    for i, button in pairs(self.buttons) do
        button:SetHeight(buttonHeight)
        button:SetPoint("TOPLEFT", relativeFrame, relativePoint, ofsx, ofsy)
        relativeFrame = button
        relativePoint = "BOTTOMLEFT"
        ofsx = 0
        ofsy = 0
    end
end

---
-- Sets the label provider for this ScrollList. This is a function that
-- provides a visual representation of an item to be displayed at a button.
-- 
-- The function is called with the key and value of the element retrieved from
-- the content provider, and additionally the button where the element should be
-- displayed. The function should return a string as the label and optionally a
-- disabled flag which usually indicates that the button should be grayed out.
-- e.g. 
-- local text, disabled = list.labelProvider(key, value, button)
-- 
-- @param #func f
--          the label provider
-- 
function ScrollList:SetLabelProvider(f)
    if f then self.labelProvider = f end
end

---
-- Sets the content provider for this ScrollList. This is a function that
-- provides the elements to be shown, as list or map. The elements will be
-- passed as key-value pairs to the filter, sorter and label provider before
-- being displayed at a button.
-- 
-- @param #func f
--          the content provider
-- 
function ScrollList:SetContentProvider(f)
    if f then self.contentProvider = f end
end

---
-- Sets a filter that will be applied to the element list retrieved from the
-- content provider.
-- 
-- The function is called with the key and value of an element and should
-- return true, if the element should be shown, false if the element should be
-- hidden.
-- 
-- @param #func f
--          the filter function
-- 
function ScrollList:SetFilter(f)
    if f then self.filter = f end
end

---
-- Sets a sorter function that will be applied to the element list retrieved
-- from the content provider.
-- 
-- The function represents a comparator function that is called with the keys
-- and values of two elements and returns a boolean value specifying whether
-- the first element should be before the second element in the sequence.
-- e.g. if the elements should be sorted by their keys:
-- list:SetSorter(function(key1, value1, key2, value2)
--     return key1 < key2
-- end)
-- 
-- @param #func f
--          the sorter function
-- 
function ScrollList:SetSorter(f)
    if f then self.sorter = f end
end

---
-- Sets a script for the buttons of this ScrollList.
-- 
-- @param #string eventType
--          the event type that triggers the script, e.g. "OnUpdate", "OnClick"
-- @param #func f
--          the script to be executed during the event
-- 
function ScrollList:SetButtonScript(eventType, f)
    if f and eventType then
        self.buttonScript[eventType] = f
    end
end

---
-- Returns the ScrollFrame of this ScrollList.
-- 
-- @return #Frame
--          the scroll frame
-- 
function ScrollList:GetFrame()
    return self.frame
end

---
-- Updates this ScrollList, obtaining a fresh list of items from the content
-- provider and updates the buttons.
-- 
function ScrollList:Update()
    updateScrollFrame(self)
end
