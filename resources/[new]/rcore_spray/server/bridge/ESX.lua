if Framework.ESX then
    -- ESX = exports[GetCurrentResourceName()]:GetMainObject('esx', 'es_extended')
    ESX = nil
    TriggerEvent('rcore:GetMainObject', 'esx', 'es_extended', function(e)
        ESX = e
    end)

    GetPlayerIdentifier = function(serverId)
        local xPlayer = ESX.GetPlayerFromId(serverId)
        return xPlayer.identifier
    end

    ShowNotification = function(source, text)
        TriggerClientEvent('esx:showNotification', source, text)
    end

    if not UseOxInventory then
        GetItemCount = function(serverId, name)
            local xPlayer = ESX.GetPlayerFromId(serverId)
            local item = xPlayer.getInventoryItem(name)

            if item and item[1] and item[1].count then
                return item[1].count
            end

            if item and item.count then
                return item.count
            end

            return 0
        end

        RemoveInventoryItem = function(serverId, name, count)
            local xPlayer = ESX.GetPlayerFromId(serverId)
            xPlayer.removeInventoryItem(name, count)
        end

        Citizen.CreateThread(function()
            while not ESX do Wait(100) end
            RegisterUsableItem = function(itemName, callBack)
                ESX.RegisterUsableItem(itemName, callBack)
            end
        end)
    end
end