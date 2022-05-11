# Custom Methods

Create custom functionalities on Roblox Objects! Using methods.


### QuickStart

**Motivations**

> I made this because I wanted to create a recreation of the MT_Api made by rain back in 2017 linked [here](https://www.youtube.com/watch?v=dQw4w9WgXcQ).

**How to use**

>To intialize [CustomMethods] Put this on top of your main script.
>Please note that Reinitializing CustomMethods will return the same library you called last time

```lua
local CustomMethods = loadstring(game:HttpGet('https://raw.githubusercontent.com/Perthys/CustomMethods/main/main.lua'))()
```

>We are going to make a simple method globally called `:PrintFullName()` using the CreateGlobalMethod.

```lua
local Namecall = CustomNameCalls:CreateGlobalMethod(":PrintOutFullName()", function(self, ...) -- Please Note : and () are optional and you can use the direct name.
    return print(self:GetFullName())
end)

-- This method will now work for every single object in the game.

game.Players.LocalPlayer:PrintOutFullName() -- Output: Players.AltAccountReal
```

>It's that simple!

**How To Remove**

> You can easily remove the method by calling the returned function.



```lua
local Namecall = CustomNameCalls:CreateGlobalMethod(":PrintOutFullName()", function(self, ...)
    return print(self:GetFullName())
end)

Namecall()

game.Players.LocalPlayer:PrintOutFullName() -- Output: nil
```




**Creating Methods for specific Instances**

> You can also create methods for Specific Instances with the `CreateInstanceMethod()` function




```lua
local Namecall_2 = CustomNameCalls:CreateInstanceMethod(game.Players, "Hello", function()
    return "Goodbye"
end)

print(game.Players:Hello()) -- Output: Goodbye
```
