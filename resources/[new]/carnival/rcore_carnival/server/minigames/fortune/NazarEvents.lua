RegisterNetEvent("rcore_carnival:SyncSound", function(status, arrayIndex, soundIndex)
    local playerPos = GetEntityCoords(GetPlayerPed(source))
    local playerId = source
    for k, v in pairs(GetPlayers()) do
        k = type(v) == "string" and tonumber(v) or v
        if #(playerPos - GetEntityCoords(GetPlayerPed(k))) < 14 and playerId ~= k then
            TriggerClientEvent("rcore_carnival:SyncSound", k, status, arrayIndex, soundIndex)
        end
    end
end)