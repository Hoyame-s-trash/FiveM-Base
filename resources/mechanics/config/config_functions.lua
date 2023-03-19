Config.Notify = function(textx, type)
    KIBRA.Natives.Notify(type, textx)
end

Config.ServerNotify = function(src, textx)
    TriggerClientEvent('esx:showNotification', src, textx)
end

Config.Show = function(button, text)
    KIBRA.Natives.UI.Show(button, text)
end

Config.Hide = function()
    KIBRA.Natives.UI.Hide()
end

Config.VehicleKeysEvent = "vehiclekeys:client:SetOwner"

Config.VehicleAddKeyEvent = "qb-vehiclekeys:client:AddKeys"

