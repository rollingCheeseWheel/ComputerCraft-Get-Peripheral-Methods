local connectedPeripherals = peripheral.getNames()
if #connectedPeripherals == 0 then
    print("There are no peripherals connected")
    return
end
local peripheralsTypes = {}
for i = 1, #connectedPeripherals do
    peripheralsTypes[connectedPeripherals[i]] = peripheral.getType(connectedPeripherals[i])
end
print("Choose peripheral, press enter if peripheral is not in list")

local inc = 1   -- format and print all available peripherals as a list to the terminal
for k,v in pairs(peripheralsTypes) do
    print(inc .. ":", k, "-", v)
    inc = inc + 1
end

while true do   -- Terminal prompt
    UserInput = read()
    if UserInput == "" then
        print("Connect the peripheral")
        return
    end
    local nUserInput = tonumber(UserInput, 10)
    if nUserInput ~= nil and 0 < nUserInput and nUserInput <= #connectedPeripherals then
        UserInput = nUserInput
        break
    end
end

local peripheralType = peripheralsTypes[connectedPeripherals[UserInput]]
local outputFileName = "/methods_" .. peripheralType .. ".txt"
local wrappedPeripheral = peripheral.find(peripheralType)

local prettyPeripheral = ""	-- Formatting the wrapped peripheral
for k,v in pairs(wrappedPeripheral) do
    prettyPeripheral = k .. "\n" .. prettyPeripheral
end

local fileHandle, errorMessage = fs.open(outputFileName, "a")	-- "a" flag to append the content to the file, modify at your own risk
if fileHandle ~= nil then
    fileHandle.write(prettyPeripheral)
    print("Saved methods of peripheral \"" .. peripheralType .. "\" to file \"" .. outputFileName .. "\"")    
else
    print("Could not save file to \"" .. outputFileName .. "\": " .. errorMessage)
end
fileHandle.close()
