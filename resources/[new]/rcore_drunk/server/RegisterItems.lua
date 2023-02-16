IsPlayerBusyDrinking = {}

if Config.ox_inv then
    exports("supervodka", function(event, item, inventory, slot, data)
        local source = inventory.id
        TriggerClientEvent(TriggerName("ShowSelector"), source)
    end)

    exports("breath_alcohol_tester", function(event, item, inventory, slot, data)
        local source = inventory.id

        TriggerClientEvent(TriggerName("TakeSelfTest"), source)
        FrameworkObject.GetPlayerFromId(source).removeInventoryItem("breath_alcohol_tester", 1)
    end)

    for k, v in pairs(Config.DrunkList) do
        exports(v.name, function(event, item, inventory, slot, data)
            local source = inventory.id
            if not IsPlayerBusyDrinking[source] then
                IsPlayerBusyDrinking[source] = true
                FrameworkObject.GetPlayerFromId(source).removeInventoryItem(v.name, 1)
                TriggerClientEvent(TriggerName("EquipPlayerDrink"), source, v)
            end
        end)
    end
end

OnObjectLoaded(function()
    FrameworkObject.RegisterUsableItem("supervodka", function(source)
        TriggerClientEvent(TriggerName("ShowSelector"), source)
    end)

    FrameworkObject.RegisterUsableItem("breath_alcohol_tester", function(source)
        TriggerClientEvent(TriggerName("TakeSelfTest"), source)
        FrameworkObject.GetPlayerFromId(source).removeInventoryItem("breath_alcohol_tester", 1)
    end)

    if Config.Framework == 0 then

        RegisterCommand("alcoholtester", function(source)
            TriggerClientEvent(TriggerName("TakeSelfTest"), source)
        end, false)

        for k, v in pairs(Config.DrunkList) do
            RegisterCommand(v.name, function(source)
                if not IsPlayerBusyDrinking[source] then
                    IsPlayerBusyDrinking[source] = true
                    FrameworkObject.GetPlayerFromId(source).removeInventoryItem(v.name, 1)
                    TriggerClientEvent(TriggerName("EquipPlayerDrink"), source, v)
                end
            end, false)
        end
    else
        for k, v in pairs(Config.DrunkList) do
            FrameworkObject.RegisterUsableItem(v.name, function(source)
                if not IsPlayerBusyDrinking[source] then
                    IsPlayerBusyDrinking[source] = true
                    FrameworkObject.GetPlayerFromId(source).removeInventoryItem(v.name, 1)
                    TriggerClientEvent(TriggerName("EquipPlayerDrink"), source, v)
                end
            end)
        end
    end
end)

RegisterNetEvent(TriggerName("SetPlayerBusyDrinkStatus"), function(status)
    IsPlayerBusyDrinking[source] = status
end)