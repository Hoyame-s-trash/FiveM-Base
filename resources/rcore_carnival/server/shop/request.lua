local playerRequestId = {}

RegisterNetEvent("rcore_carnival:requestedGift", function(playerID, animSet)
    local source = source

    playerRequestId[playerID] = {
        initID = source,
        animSet = animSet,
    }

    TriggerClientEvent("rcore_carnival:someoneReuqested", playerID)
end)

RegisterNetEvent("rcore_carnival:acceptRequest", function()
    local source = source
    if playerRequestId[source] then
        if #(GetEntityCoords(GetPlayerPed(source)) - GetEntityCoords(GetPlayerPed(playerRequestId[source].initID))) <= 3 then
            TriggerClientEvent("rcore_carnival:opositAccepted", playerRequestId[source].initID)
            --TriggerClientEvent("rcore_carnival:acceptRequest", source, playerRequestId[source].animSet)

            if Config.Framework.Active ~= Framework.STANDALONE then
                local xPlayer = SharedObject.GetPlayerFromId(source)
                local xTarget = SharedObject.GetPlayerFromId(playerRequestId[source].initID)

                xPlayer.addInventoryItem(playerRequestId[source].animSet, 1)
                xTarget.removeInventoryItem(playerRequestId[source].animSet, 1)
            end

        else
            TriggerClientEvent("rcore_carnival:denyRequest", playerRequestId[source].initID, true)
            TriggerClientEvent("rcore_carnival:denyRequest", source, true)
        end
        playerRequestId[source] = nil
    end
end)

RegisterNetEvent("rcore_carnival:denyRequest", function()
    local source = source
    if playerRequestId[source] then
        TriggerClientEvent("rcore_carnival:denyRequest", playerRequestId[source].initID)

        playerRequestId[source] = nil
    end
end)

