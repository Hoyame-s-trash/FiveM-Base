ESX.Whitelist = ESX.Whitelist or {}


ESX.Whitelist.Enable = Config.Whitelist or false
ESX.Whitelist.List = {}

CreateThread(function()
    MySQL.query("SELECT * FROM user_whitelist", {
    }, function(results)
        for i = 1, #results do
            local selectedResult = results[i]
            
            if (not ESX.Whitelist.List[selectedResult.identifier]) then
                ESX.Whitelist.List[selectedResult.identifier] = {
                    identifier = selectedResult.identifier,
                    id = selectedResult.id,
                }
            end
        end
    end)
end)

RegisterCommand("whitelist", function(source, args)
    ESX.Whitelist.Enable = not ESX.Whitelist.Enable
    print("Whitelist is now " .. (ESX.Whitelist.Enable and "enabled" or "disabled"))
end)

-- Todo securize this command and add it on the admin menu