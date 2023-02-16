RegisterNetEvent("rcore_carnival:claw:removePlush", function(indexPrice, indexArray)
    local source = source
    local gameCoords = Config.MiniGameList[indexArray].Position

    if Config.MiniGameList[indexArray].IsBusy and IsPlayerBusy(source) then
        if Config.Framework.Active ~= Framework.STANDALONE then
            local itemName = Config.MiniGameList[indexArray].Prices[indexPrice].itemName
            local xPlayer = SharedObject.GetPlayerFromId(source)
            xPlayer.addInventoryItem(itemName, 1)
        end

        Config.MiniGameList[indexArray].Removed = true
        TriggerClientEvent("rcore_carnival:claw:removePlush", -1, indexPrice, indexArray, #(gameCoords - GetEntityCoords(GetPlayerPed(source))) < 60)
    else
        -- cheater do whatever you want here.
    end
end)