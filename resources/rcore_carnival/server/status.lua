local cachedPlayersStatus = {}
local cachedPlayerDifficulty = {}

function IsPlayerBusy(source)
    return cachedPlayersStatus[source] ~= nil
end

registerCallback("rcore_carnival:setBusyStatus", function(source, cb, index, status, difficulty, playerId)
    if Config.MiniGameList[index].IsBusy and status == true then
        cb(true)
        return
    end
    
    Config.MiniGameList[index].IsBusy = status
    cb(false)

    TriggerClientEvent("rcore_carnival:setBusyStatus", -1, index, status)

    local source = playerId or source
    local player = SharedObject.GetPlayerFromId(source)

    if status == true then
        cachedPlayersStatus[source] = index
    else
        cachedPlayersStatus[source] = nil
        Config.MiniGameList[index].Score = 0
        Config.MiniGameList[index].Hearths = Config.MaxBeaverHearts

        local totalScore = GetPlayerScore(source)
        local gameType = GetTypeMinigameFromNumber(index)
        local difficultyType = cachedPlayerDifficulty[source]

        local ignoredScores = {
            [GameType.FORTUNE_TELLER] = true,
            [GameType.ARCADE_CLAW] = true,
        }

        if not ignoredScores[gameType] then

            if Config.GivePlayerTickets and Config.Framework.Active ~= Framework.STANDALONE then
                player.addInventoryItem("carnival_ticket", totalScore)
            end

            MySQL.Async.fetchAll("SELECT * FROM carnival_highscores WHERE player_identifier = @player_identifier AND game_identifier = @game_identifier AND difficulty = @difficulty", {
                ['@player_identifier'] = player.identifier,
                ["@game_identifier"] = GameTypeName[gameType],
                ["@difficulty"] = difficultyType or 0,
            }, function(result)
                if #result == 0 then
                    MySQL.Sync.execute("INSERT INTO `carnival_highscores` (`player_identifier`, `player_name`, `game_identifier`, `score`, `difficulty`) VALUES (@player_identifier, @player_name, @game_identifier, @score, @difficulty)", {
                        ["@player_identifier"] = player.identifier,
                        ["@player_name"] = GetPlayerRealName(source),
                        ["@game_identifier"] = GameTypeName[gameType],
                        ["@score"] = totalScore,
                        ["@difficulty"] = difficultyType or 0,
                    })

                    MySQL.Async.fetchAll("SELECT * FROM carnival_highscores WHERE game_identifier = @game_identifier AND difficulty = @difficulty ORDER BY score DESC LIMIT 10", {
                        ["@game_identifier"] = GameTypeName[gameType],
                        ["@difficulty"] = difficulty or 0,
                    }, function(result)
                        local data = result[1]
                        if data.player_identifier == player.identifier then
                            TriggerClientEvent("rcore_carnival:newRecord", source, true)
                        else
                            TriggerClientEvent("rcore_carnival:newRecord", source)
                        end
                    end)
                else
                    local data = result[1] or result
                    if data.score + 1 <= totalScore then
                        MySQL.Sync.execute("UPDATE `carnival_highscores` SET score = @score WHERE player_identifier = @player_identifier AND difficulty = @difficulty AND game_identifier = @game_identifier", {
                            ["@player_identifier"] = player.identifier,
                            ["@score"] = totalScore,
                            ["@game_identifier"] = GameTypeName[gameType],
                            ["@difficulty"] = difficultyType or 0,
                        })

                        MySQL.Async.fetchAll("SELECT * FROM carnival_highscores WHERE game_identifier = @game_identifier AND difficulty = @difficulty ORDER BY score DESC LIMIT 10", {
                            ["@game_identifier"] = GameTypeName[gameType],
                            ["@difficulty"] = difficulty or 0,
                        }, function(result)
                            local data = result[1]
                            if data.player_identifier == player.identifier then
                                TriggerClientEvent("rcore_carnival:newRecord", source, true)
                            else
                                TriggerClientEvent("rcore_carnival:newRecord", source)
                            end
                        end)
                    end
                end
            end)
        end

        ResetPlayerScore(source)
    end

    cachedPlayerDifficulty[source] = difficulty
end)

RegisterNetEvent("rcore_carnival:fetchCache", function()
    TriggerClientEvent("rcore_carnival:fetchCache", -1, Config.MiniGameList)
end)

AddEventHandler('playerDropped', function(reason)
    local indexStatusCache = cachedPlayersStatus[source]
    RemovePlayerScore(source)

    if indexStatusCache ~= nil then
        Config.MiniGameList[indexStatusCache].IsBusy = false
        Config.MiniGameList[indexStatusCache].Score = 0
        TriggerClientEvent("rcore_carnival:setBusyStatus", -1, indexStatusCache, false)
        TriggerClientEvent("rcore_carnival:baloons:resetBalloonsEntity", -1, indexStatusCache)
    end
end)