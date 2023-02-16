RegisterNetEvent("rcore_carnival:beaver:showBeaver", function(gameCoords, index, randomBeaver)
    for k, v in pairs(GetPlayers()) do
        k = type(v) == "string" and tonumber(v) or v
        if #(gameCoords - GetEntityCoords(GetPlayerPed(k))) < 14 then
            TriggerClientEvent("rcore_carnival:beaver:showBeaver", k, gameCoords, index, randomBeaver)
        end
    end
end)

RegisterNetEvent("rcore_carnival:beaver:removeHearth", function(gameCoords, indexArray, playerID)
    local source = playerID or source

    if not Config.MiniGameList[indexArray].Hearths then
        Config.MiniGameList[indexArray].Hearths = Config.MaxBeaverHearts
    end

    Config.MiniGameList[indexArray].Hearths = Config.MiniGameList[indexArray].Hearths - 1

    for k, v in pairs(GetPlayers()) do
        k = type(v) == "string" and tonumber(v) or v
        if #(gameCoords - GetEntityCoords(GetPlayerPed(k))) < 14 then
            TriggerClientEvent("rcore_carnival:beaver:removeHearth", k, gameCoords, indexArray, Config.MiniGameList[indexArray].Hearths, source)
        end
    end
end)

RegisterNetEvent("rcore_carnival:beaver:hittedBeaver", function(gameCoords, indexBeaver, indexArray, model)
    local source = source
    local scoreToAdd = 0

    if Config.BeaverScoreList[model] then
        scoreToAdd = Config.BeaverScoreList[model]

        if indexBeaver == 3 then
            scoreToAdd = Config.BeaverScoreList[model] * 2
        end
    end

    if not Config.MiniGameList[indexArray].Score then
        Config.MiniGameList[indexArray].Score = 0
    end

    if model == BeaverTypeHashObject[BeaverType.BEAVER_RED] then
        for k, v in pairs(GetPlayers()) do
            k = type(v) == "string" and tonumber(v) or v
            if #(gameCoords - GetEntityCoords(GetPlayerPed(k))) < 5 then
                TriggerClientEvent("rcore_carnival:beaver:explosion", k, gameCoords, indexArray, source)
            end
        end
        Config.MiniGameList[indexArray].IsBusy = false
        TriggerClientEvent("rcore_carnival:setBusyStatus", -1, indexArray, false)

        --TriggerEvent("rcore_carnival:setBusyStatus", indexArray, false, nil, source)
        return
    end

    if model == BeaverTypeHashObject[BeaverType.BEAVER_GREEN] then
        TriggerEvent("rcore_carnival:beaver:removeHearth", gameCoords, indexArray, source)
    end

    AddPlayerScore(source, scoreToAdd)
    Config.MiniGameList[indexArray].Score = Config.MiniGameList[indexArray].Score + scoreToAdd

    for k, v in pairs(GetPlayers()) do
        k = type(v) == "string" and tonumber(v) or v
        if #(gameCoords - GetEntityCoords(GetPlayerPed(k))) < 14 then
            TriggerClientEvent("rcore_carnival:beaver:hittedBeaver", k, gameCoords, indexBeaver, indexArray, Config.MiniGameList[indexArray].Score)
        end
    end
end)