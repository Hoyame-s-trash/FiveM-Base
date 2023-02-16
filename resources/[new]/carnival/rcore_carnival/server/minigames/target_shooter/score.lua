RegisterNetEvent("rcore_carnival:targets:shotTarget", function(indexArray, targetIndex, model)
    if model ~= ShooterTargetsObjects.FORBIDDEN_TARGET then
        AddPlayerScore(source, Config.TargetShooterScore)
    end

    for k, v in pairs(GetPlayers()) do
        k = type(v) == "string" and tonumber(v) or v
        if #(Config.MiniGameList[indexArray].Position - GetEntityCoords(GetPlayerPed(k))) < 10 then
            TriggerClientEvent("rcore_carnival:targets:shotTarget", k, indexArray, targetIndex)
        end
    end
end)