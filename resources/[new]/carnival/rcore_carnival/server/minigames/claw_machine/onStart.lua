CreateThread(function()
    while true do
        Wait(Config.RestockPricesAfterMinutes)
        TriggerClientEvent("rcore_carnival:claw:restockPrices", -1)

        for k, v in pairs(Config.MiniGameList) do
            if v.GameType == GameType.ARCADE_CLAW then
                for key, val in pairs(v.Prices) do
                    val.Removed = nil
                end
            end
        end
    end
end)