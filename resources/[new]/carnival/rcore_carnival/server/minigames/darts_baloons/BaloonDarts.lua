RegisterNetEvent("rcore_carnival:baloons:dart", function(pPos, endCoords, heading, indexArray, balonIndex)
    local source = source

    AddPlayerScore(source, Config.BalloonScore)

    for k, v in pairs(GetPlayers()) do
        k = type(v) == "string" and tonumber(v) or v
        if #(pPos - GetEntityCoords(GetPlayerPed(k))) < 25 then
            TriggerClientEvent("rcore_carnival:baloons:dart", k, pPos, endCoords, heading, indexArray, balonIndex, source)
        end
    end
end)

RegisterNetEvent("rcore_carnival:baloons:resetBalloonsEntity", function(indexArray)
    TriggerClientEvent("rcore_carnival:baloons:resetBalloonsEntity", -1, indexArray)
end)