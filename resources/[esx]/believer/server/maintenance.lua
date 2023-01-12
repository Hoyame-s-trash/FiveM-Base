ESX.Maintenance = ESX.Maintenance or {}

ESX.Maintenance.Enable = Config.Maintenance or false

RegisterCommand("maintenance", function(source, args)
    ESX.Maintenance.Enable = not ESX.Maintenance.Enable
    print("Maintenance is now " .. (ESX.Maintenance.Enable and "enabled" or "disabled"))
end)

-- Todo securize this command and add it on the admin menu