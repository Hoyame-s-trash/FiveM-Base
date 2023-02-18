PlayerCachedScore = {}

function InitPlayerScore(source)
    if not PlayerCachedScore[source] then
        PlayerCachedScore[source] = 0
    end
end

function AddPlayerScore(source, score)
    InitPlayerScore(source)

    PlayerCachedScore[source] = PlayerCachedScore[source] + score
end

function GetPlayerScore(source)
    InitPlayerScore(source)
    return PlayerCachedScore[source]
end

function ResetPlayerScore(source)
    InitPlayerScore(source)
    PlayerCachedScore[source] = 0
end

function RemovePlayerScore(source)
    PlayerCachedScore[source] = nil
end

registerCallback("getHighScores", function(source, cb, gameType, difficulty)
    if gameType ~= GameType.FORTUNE_TELLER then
        MySQL.Async.fetchAll("SELECT * FROM carnival_highscores WHERE game_identifier = @game_identifier AND difficulty = @difficulty ORDER BY score DESC LIMIT 10", {
            ["@game_identifier"] = GameTypeName[gameType],
            ["@difficulty"] = difficulty,
        }, function(result)
            cb(result or {})
        end)
    end
end )