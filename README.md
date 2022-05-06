# Customnamecall
Test

```lua
local CustomNameCalls = loadstring(game:HttpGet('https://raw.githubusercontent.com/Perthys/Customnamecall/main/main.lua'))()
-- too lazy to form loadstring call copied from loader
local Namecall = CustomNameCalls:CreateGlobalMethod("Racist", function()
    return "Balls"
end)

local Namecall = CustomNameCalls:CreateGlobalMethod(":Racist()", function()
    return "Balls"
end)

print(game:Racist())
```
