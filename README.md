# Custom Methods

Create custom functionalities on Roblox Objects! Using methods.


### QuickStart



```lua
local CustomNameCalls = loadstring(game:HttpGet('https://raw.githubusercontent.com/Perthys/Customnamecall/main/main.lua'))()

local Namecall = CustomNameCalls:CreateGlobalMethod("Racist", function()
    return "Balls"
end)


local Namecall = CustomNameCalls:CreateGlobalMethod(":Racist()"  , function()
    return "Balls"
end)
-- (You can use : and () if you want so it looks less ass)

print(game:Racist()) -- Balls

local CustomNameCalls = loadstring(game:HttpGet('https://raw.githubusercontent.com/Perthys/Customnamecall/main/main.lua'))()

-- Will Return last time u called it (in the current runtime) so it saves all ur custom things

-- You can remove the custom method by calling it

Namecall() print(game:Racist()) -- nil

```
