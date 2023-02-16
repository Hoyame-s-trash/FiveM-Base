RegisterNetEvent("rcore_carnival:claw:syncPositionClaw", function(arrayIndex, x, y, z)
    local source = source
    local gameCoords = Config.MiniGameList[arrayIndex].Position

    if Config.MiniGameList[arrayIndex].IsBusy and IsPlayerBusy(source) then
        for k, v in pairs(GetPlayers()) do
            k = type(v) == "string" and tonumber(v) or v
            if #(gameCoords - GetEntityCoords(GetPlayerPed(k))) < 10 and k ~= source then
                TriggerClientEvent("rcore_carnival:claw:syncPositionClaw", k, arrayIndex, x, y, z)
            end
        end
    end
end)

RegisterNetEvent("rcore_carnival:claw:startAnimation", function(arrayIndex, hitIndex)
    local source = source
    local gameCoords = Config.MiniGameList[arrayIndex].Position

    if Config.MiniGameList[arrayIndex].IsBusy and IsPlayerBusy(source) then
        for k, v in pairs(GetPlayers()) do
            k = type(v) == "string" and tonumber(v) or v
            if #(gameCoords - GetEntityCoords(GetPlayerPed(k))) < 40 and k ~= source then
                TriggerClientEvent("rcore_carnival:claw:startAnimation", k, arrayIndex, hitIndex)
            end
        end
    end
end)