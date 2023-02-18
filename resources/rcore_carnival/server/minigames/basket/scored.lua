RegisterNetEvent("rcore_carnival:basket", function(indexArray)
    AddPlayerScore(source, Config.ScorePerHit)

    if not Config.MiniGameList[indexArray].Score then
        Config.MiniGameList[indexArray].Score = 0
    end
    Config.MiniGameList[indexArray].Score = Config.MiniGameList[indexArray].Score + Config.ScorePerHit
end)