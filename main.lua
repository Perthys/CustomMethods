if shared.CustomNameCalls then
    return shared.CustomNameCalls 
end

shared.CustomNameCalls = {}
shared.CustomNameCalls.__index = shared.CustomNameCalls

local CustomNameCalls = shared.CustomNameCalls

local BlacklistedKeys = {
    ":",
    "%(",
    "%)"
}

CustomNameCalls.Methods = {
    GlobalMethods = {}
}

local Methods = CustomNameCalls.Methods
local GlobalMethods = Methods.GlobalMethods

local function CleanString(String)
    for Index, Value in pairs(BlacklistedKeys) do
        String = String:gsub(Value, "")
    end

    return String
end

function CustomNameCalls.CreateGlobalMethod(self, Method, Handler)
    Method = CleanString(Method)
    Methods.GlobalMethods[Method] = Handler

    return function()
        Methods.GlobalMethods[Method] = nil
    end
end

local OldNameCall; OldNameCall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local Method = getnamecallmethod()

    if GlobalMethods[Method] then
        return GlobalMethods[Method](self, ...)
    end
    
    return OldNameCall(self, ...)
end))

return shared.CustomNameCalls
