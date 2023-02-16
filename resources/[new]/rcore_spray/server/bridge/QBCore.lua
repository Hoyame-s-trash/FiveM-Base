if Framework.QBCORE then
    TriggerEvent('rcore:GetMainObject', 'qbcore', 'qb-core', function(QBCore)
        ESX = {}

        if not UseOxInventory then
            RegisterUsableItem = function(itemName, callBack)
                QBCore.Functions.CreateUseableItem(itemName, callBack)
            end

            GetItemCount = function(serverId, name)
                local qbPlayer = QBCore.Functions.GetPlayer(serverId)
                local item = qbPlayer.Functions.GetItemByName(name)

                if not item then
                    return 0
                end

                return item.amount
            end

            RemoveInventoryItem = function(serverId, name, count)
                local qbPlayer = QBCore.Functions.GetPlayer(serverId)
                qbPlayer.Functions.RemoveItem(name, count)
            end
        end

        GetPlayerIdentifier = function(serverId)
            local qbPlayer = QBCore.Functions.GetPlayer(serverId)
            return qbPlayer.PlayerData.citizenid
        end
    
        ShowNotification = function(source, text)
            TriggerClientEvent('QBCore:Notify', source, text)
        end
    end)
end
