function GetTypeMinigameFromNumber(number)
    return Config.MiniGameList[number].GameType
end

function GetPlayerRealName(playerId)
    local p = SharedObject.GetPlayerFromId(playerId)
    local name = nil

    if p then
        name = p.getName()
    end

    if not name then
        name = GetPlayerName(playerId)
    end

    return name
end