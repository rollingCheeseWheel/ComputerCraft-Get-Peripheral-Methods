local peripheralType = "turbineValve"	-- Change this to the name of the peripheral you want to get the methods from. You can get the peripheral type by running "peripheral.getType(<side>)"
local outputFileName = outputFolder .. "methods_" .. peripheralType	-- The name of the file the methods will be outputted to. Modifying this could lead to errors
local outputFolder = "/"	-- Modifying this could lead to errors#
local fileType = "txt"	-- the file type the file will have
local wrappedPeripheral = peripheral.find(peripheralType)

local prettyPeripheral = ""	-- Formatting the k,v table
for k,v in pairs(wrappedPeripheral) do
    prettyPeripheral = prettyPeripheral .. "\n" .. k
end

local fileHandle, errorMessage = fs.open(outputFileName .. "." .. fileType, "a")	-- "a" flag to append the content to the file, modify at your own risk
if fileHandle ~= nil then
    fileHandle.write(prettyPeripheral)
    print("Saved methods of peripheral \"" .. peripheralType .. "\" to file \"" .. outputFileName .. "\"")    
else
    print("Could not save file to \"" .. outputFileName .. "\": " .. errorMessage)
end
fileHandle.close()
