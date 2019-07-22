-- namespace
local _, ns = ...;

ns.ScrollList = {
  -- class fields
  buttons,
  frame,
  numToDisplay,
  buttonHeight = 25,
  items = {},
  labelProvider = function(k, v) return tostring(v) end,
  buttonScript = function() end,
  offset = 0
}
local ScrollList = ns.ScrollList
ScrollList.__index = ScrollList

function ScrollList.size(self)
  local size = 0
  for _, _ in pairs(self.items) do
    size = size + 1
  end
  return size
end

local function updateScrollFrame(self)
  local scrollFrame = self.frame
  local offset = FauxScrollFrame_GetOffset(scrollFrame)
  local items = self.items
  local size = ScrollList.size(self)
  local numToDisplay = self.numToDisplay
  FauxScrollFrame_Update(scrollFrame, size, numToDisplay, self.buttonHeight)
  
  local line = 0
  for key, value in pairs(self.items) do
    local lineminusoffset = line - offset
    if (lineminusoffset > numToDisplay) then break end;
    if (line >= offset and lineminusoffset < numToDisplay) then
      local button = self.buttons[lineminusoffset + 1]
      if (button) then
        local text = self.labelProvider(key, value)
        button:SetText(text)
        button:Show()
        button.item = { key = key, value = value }
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
  
  -- hide unused items
  while (line <= numToDisplay) do
    local button = self.buttons[line]
    if (button) then
      button:Hide()
      button.item = nil
    end
    line = line + 1;
  end
end

function ScrollList.new(globalName, parentFrame, numToDisplay)
  local self = setmetatable({}, ScrollList)
  local list = self
  self.numToDisplay = numToDisplay
  
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
    local button = CreateFrame("Button", nil, frame)
    button:SetNormalFontObject("GameFontHighlightLeft")
    button:SetHighlightFontObject("GameFontNormal")
    button:SetScript("OnClick", function(self, mouseButton)
      local item = button.item
      if (item) then
        self.buttonScript(buttonIndex, item.key, item.value)
      end
    end)
    buttons[buttonIndex] = button 
  end
  self.buttons = buttons
  
  return self
end

function ScrollList.SetPoint(self, point, relativeFrame, relativePoint, ofsx, ofsy)
  self.frame:SetPoint(point, relativeFrame, relativePoint, ofsx, ofsy)
end

function ScrollList.SetSize(self, width, height)
  self.frame:SetSize(width, height)
end

function ScrollList.SetWidth(self, width)
  self.frame:SetWidth(width)
  for i, button in pairs(self.buttons) do
    button:SetWidth(width)
  end
end

function ScrollList.SetHeight(self, height)
  self.frame:SetHeight(height)
end

function ScrollList.SetButtonHeight(self, buttonHeight)
  self.buttonHeight = buttonHeight
  for i, button in pairs(self.buttons) do
    button:SetHeight(buttonHeight)
    button:SetPoint("TOPLEFT", self.frame, "TOPLEFT", 0, -buttonHeight * (i - 1))
  end
end

function ScrollList.SetLabelProvider(self, f)
  if f then self.labelProvider = f end
end

function ScrollList.SetButtonScript(self, f)
  if f then self.buttonScript = f end
end
