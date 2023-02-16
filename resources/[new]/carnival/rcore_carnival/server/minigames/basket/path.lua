RegisterNetEvent("rcore_carnival:sendRecordedPath", function(path, currentIndex)
    local source = source
    local throwPosition = GetEntityCoords(GetPlayerPed(source))

    for k, v in pairs(GetPlayers()) do
        k = type(v) == "string" and tonumber(v) or v
        if #(throwPosition - GetEntityCoords(GetPlayerPed(k))) < 40 then
            TriggerClientEvent("rcore_carnival:sendRecordedPath", k, path, currentIndex, source)
        end
    end
end)
