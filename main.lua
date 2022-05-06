return function(Settings)
    Settings = Settings or {
        CheckSynaspeThread = false
        CustomSubKeys = {}
    }
    
    if not shared.CustomNameCalls then
        shared.CustomNameCalls = {} shared.CustomNameCalls.__index = shared.CustomNameCalls

        local CustomNameCalls = shared.CustomNameCalls;
        
        local BlacklistedKeys = Settings["CustomSubKeys"] or {
            ":";
            "%(";
            "%)";
        }
        
        CustomNameCalls.Methods = {
            GlobalMethods = {
                
            }
        }
        
        local Methods = CustomNameCalls.Methods
        local GlobalMethods = Methods.GlobalMethods;
        
        local function CleanString(String)
            for Index, Value in pairs(BlacklistedKeys) do
                String = String:gsub(Value, "")
            end
            
            return String
        end
        
        function CustomNameCalls.CreateGlobalMethod(self, Method, Handler)
            Method = CleanString(Method);
            Methods.GlobalMethods[Method] = Handler;
        end
        
        local OldNameCall; OldNameCall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
            local Method = getnamecallmethod();
        
            if GlobalMethods[Method] then
                if Settings.CheckSynaspeThread and checkcaller()then
                    return OldNameCall(self, ...)
                end
                
                return GlobalMethods[Method](self, ...)
            end
            
            return OldNameCall(self, ...)
        end))
    else
        return shared.CustomNameCalls
    end
end



