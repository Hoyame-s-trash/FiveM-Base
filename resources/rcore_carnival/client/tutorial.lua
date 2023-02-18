AddEventHandler("rcore_carnival:onEnterGame", function(gameType)
    if gameType == GameType.ARCADE_CLAW then
        ShowHelpNotification(_U("claw_help"), false, false, 15000)
    end

    if gameType == GameType.BANG_BEAVER then
        ShowHelpNotification(_U("beaver_help"), false, false, 25000)
    end
end)
