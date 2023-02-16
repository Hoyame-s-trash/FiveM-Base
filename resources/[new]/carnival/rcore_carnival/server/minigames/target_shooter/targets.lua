RegisterNetEvent("rcore_carnival:targets:showTarget", function(gameCoords, indexArray, randomObject, targetIndex, difficulty)
    for k, v in pairs(GetPlayers()) do
        k = type(v) == "string" and tonumber(v) or v
        if #(gameCoords - GetEntityCoords(GetPlayerPed(k))) < 10 then
            TriggerClientEvent("rcore_carnival:targets:showTarget", k, gameCoords, indexArray, randomObject, targetIndex, difficulty)
        end
    end
end)
