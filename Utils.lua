-- namespace
local _, ns = ...;
local utils = {}

---
-- Returns the size of the given table. Returns 0 if the table is nil.
-- @param #table tbl the table to compute the size for
-- @return #number the size of the table
utils.tblsize = function(tbl)
  local size = 0
  if (tbl) then
    for _ in pairs(tbl) do
      size = size + 1
    end
  end
  return size
end

---
-- Returns a comma-separated list string containing the elements of the given list.
-- The elements are passed as key-value pairs to the encoding function to provide a
-- string representation.
-- If the given delimiter is nil, the default comma ',' will be used.
-- @param #table list the list to iterate over
-- @param #function enc a function(key, value) return a string
-- @param #string delimiter the delimiter, may be nil
-- @return #string the comma-separated string list, not nil
utils.toCSV = function(list, enc, delimiter)
  local csv = ""
  delimiter = delimiter or ","
  if (list) then
    local key, value = next(list)
    if (key) then csv = enc(key, value) end
    for key, value in next, list, key do
      csv = csv..delimiter..enc(key, value)
    end
  end
  return csv
end

---
-- Returns a list containing the elements read from the given comma-separated list string.
-- The elements are passed to the decoding function that will insert the element into the list.
-- If the given delimiter is nil, the default comma ','  will be used.
-- @param #string csv the comma-separated string list
-- @param #function dec a function(list, element) that inserts the element into the list
-- @param #string delimiter the delimiter, may be nil
-- @return #table the table containing the elements, not nil
utils.fromCSV = function(csv, dec, delimiter)
  local list = {}
  if (csv) then
    local split = { strsplit(delimiter or ",", csv) }
    for _, element in pairs(split) do
      dec(list, element)
    end
  end
  return list 
end

ns.utils = utils


-- UNIT TESTS
local function assertEquals(arg1, arg2)
  if (arg1 ~= arg2) then error("'"..tostring(arg1).."' ~= '"..tostring(arg2).."'", 2) end
end
local function tests()
  assertEquals(utils.tblsize({ 1, 2, 3 }), 3)
  assertEquals(utils.tblsize({ 1 }), 1)
  assertEquals(utils.tblsize({}), 0)
  assertEquals(utils.tblsize(nil), 0)
  
  assertEquals(utils.toCSVList({ "a", "b", "c" }, function(k,v) return v end), "a,b,c")
end

local status, result = pcall(tests)
if not status then print("Test failures: "..result) end
