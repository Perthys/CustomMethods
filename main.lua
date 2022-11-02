if shared.CustomNameCalls then
    return shared.CustomNameCalls 
end

shared.CustomNameCalls = {}

local CustomNameCalls = shared.CustomNameCalls

local BlacklistedKeys = {
    ":",
    "%(",
    "%)"
}

CustomNameCalls.Methods = {
    GlobalMethods = {};
    InstanceMethods = {};
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

    return {Destroy = function()
        Methods.GlobalMethods[Method] = nil
    end}
end

function CustomNameCalls.CreateInstanceMethod(self, Instance, Method, Handler)
    if not Methods.InstanceMethods[Instance] then
        Methods.InstanceMethods[Instance] = {}
    end
    
    Method = CleanString(Method)
    Methods.InstanceMethods[Instance][Method] = Handler

    return {
        Destroy = function()
            Methods.InstanceMethods[Instance][Method] = nil
        end
    }
end

local OldNameCall; OldNameCall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local Method = getnamecallmethod()
    local InstanceMethods = Methods.InstanceMethods[self]

    if InstanceMethods then
        if InstanceMethods[Method] then
            return InstanceMethods[Method](self, ...)
        end
    end

    if GlobalMethods[Method] then
        return GlobalMethods[Method](self, ...)
    end
    
    return OldNameCall(self, ...)
end))

return shared.CustomNameCalls
