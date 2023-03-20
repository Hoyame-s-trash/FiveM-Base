Config.Notify = function(textx, type)
    ESX.ShowNotification(textx)
end

Config.ServerNotify = function(src, textx)
    TriggerClientEvent('esx:showNotification', src, textx)
end

Config.Show = function(button, text)
    ESX.ShowHelpNotification(text)
end

Config.Hide = function()
end

Config.VehicleKeysEvent = "vehiclekeys:client:SetOwner"

Config.VehicleAddKeyEvent = "qb-vehiclekeys:client:AddKeys"