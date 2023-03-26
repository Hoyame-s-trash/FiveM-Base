ESX = exports['believer']:getSharedObject()

ESX.RegisterUsableItem('radio', function(source)
    TriggerClientEvent('setActiveRadio', source)
end)