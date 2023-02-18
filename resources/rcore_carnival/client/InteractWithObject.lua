---------------------------------------------------------------
-- Variable list
---------------------------------------------------------------
MinigameCamera = nil
ActiveMiniGameData = nil

FreezeOpenCommandGame = false

local freezeKeyBindsTime = false

DifficultyTypesHighScores = {
    [GameType.BALLOON_SHOOTER] = true,
    [GameType.TARGET_SHOOTER] = true,
}

CanLeaveMiniGameFromHotKey = {
    [GameType.TARGET_SHOOTER] = true,
    [GameType.BASKET_THROW] = true,
    [GameType.ARCADE_CLAW] = true,
}

CarnivalGameWithHelpNotification = {
    [GameType.TARGET_SHOOTER] = true,
    [GameType.BALLOON_SHOOTER] = true,
}

---------------------------------------------------------------
-- functions
---------------------------------------------------------------
function GetClosestCarnivalMiniGame(AtCoords)
    local pPos = AtCoords or GetEntityCoords(PlayerPedId())
    local arrayClose = {}
    for k, v in pairs(Config.MiniGameList) do
        if #(pPos - v.Position) < 3.0 then
            arrayClose[k] = {
                distance = #(pPos - v.Position),
                key = k,
                value = v,
            }
        end
    end

    local lowestValue = 2147483648
    local key = nil
    local value = nil

    for k, v in pairs(arrayClose) do
        if lowestValue >= v.distance then
            lowestValue = v.distance
            key = v.key
            value = v.value
        end
    end

    return value, key
end

function GetCameraDataForMinigame(entity, gameType)
    if gameType == GameType.BANG_BEAVER then
        return GetOffsetFromEntityInWorldCoords(entity, -1.4, 0.0, 1.9), (GetEntityHeading(entity) - 90), -23
    end
    return vector3(0, 0, 0), 0.0, 0.0
end

function GetPlayerDataForMinigame(entity, gameType)
    if gameType == GameType.BANG_BEAVER then
        return GetOffsetFromEntityInWorldCoords(entity, -0.8, 0.0, 0.2), (GetEntityHeading(entity) - 90)
    end
    return vector3(0, 0, 0), 0.0
end

function SendOnEnterEvent(data, index)
    if data.GameType == GameType.BALLOON_SHOOTER then
        FreezeOpenCommandGame = true
    end

    ActiveMiniGameData = data
    ActiveMiniGameData.index = index

    if GetActiveMinigame() ~= data.GameType then
        TriggerEvent("rcore_carnival:onEnterGame", data.GameType, data.Entity, ActiveMiniGameData, index)
    end

    SetActiveMinigame(data.GameType)
end

function LeaveCarnivalGame(byPass, gameType)
    local data, index = GetClosestCarnivalMiniGame()

    if not byPass then
        if freezeKeyBindsTime then
            return
        end
        freezeKeyBindsTime = true
        CreateThread(function()
            Wait(5000)
            freezeKeyBindsTime = false
        end)
    end

    if MinigameCamera == 3 then
        if data then
            TriggerEvent("rcore_carnival:onExitGame", gameType or GetActiveMinigame(), data.Entity, ActiveMiniGameData, index)
            callCallback("rcore_carnival:setBusyStatus", function(isBusy)
            end, index, false)
        else
            TriggerEvent("rcore_carnival:onExitGame", gameType or GetActiveMinigame(), nil, ActiveMiniGameData, ActiveMiniGameData.index)
            callCallback("rcore_carnival:setBusyStatus", function(isBusy)
            end, ActiveMiniGameData.index, false)
        end
        return
    end
    if MinigameCamera then
        if not MinigameCamera.IsChangingCamera() then
            TriggerEvent("rcore_carnival:onExitGame", gameType or GetActiveMinigame(), data.Entity, ActiveMiniGameData, index)
            callCallback("rcore_carnival:setBusyStatus", function(isBusy)
            end, index, false)
        end
        return
    end

    TriggerEvent("rcore_carnival:onExitGame", gameType or GetActiveMinigame(), data.Entity, ActiveMiniGameData, index)
    callCallback("rcore_carnival:setBusyStatus", function(isBusy) end, index, false)
end

---------------------------------------------------------------
-- Threads
---------------------------------------------------------------
CreateThread(function()
    while true do
        Wait(1000)
        local pPos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.MiniGameList) do
            if CarnivalGameWithHelpNotification[v.GameType] then
                if #(pPos - v.Position) < 1.5 then
                    if not v.Entered then
                        v.Entered = true

                        if v.PriceTicket <= 0 then
                            if v.CantScore then
                                ShowHelpNotification(_U("play_carnival_nohighscore_free"))
                            else
                                ShowHelpNotification(_U("play_carnival_free"))
                            end
                        else
                            if v.CantScore then
                                ShowHelpNotification(_U("play_carnival_nohighscore", CommaValue(v.PriceTicket)))
                            else
                                ShowHelpNotification(_U("play_carnival", CommaValue(v.PriceTicket)))
                            end
                        end
                    end
                else
                    if v.Entered then
                        CloseAllOpenedMenu()
                        v.Entered = false
                    end
                end
            end
        end
    end
end)

---------------------------------------------------------------
-- Events + RegisterKey
---------------------------------------------------------------

function DisplayHighestScoreHotKey(skipCheck)
    local data, index = GetClosestCarnivalMiniGame()
    if FreezeOpenCommandGame or not data then
        return
    end

    if skipCheck ~= true then
        if (Config.TargetZoneType ~= 0 and GameTypeObject[data.GameType]) then
            return
        end
    end

    if data then
        if data.CantScore then
            return
        end

        if DifficultyTypesHighScores[data.GameType] then
            FreezeOpenCommandGame = true

            ChooseDifficulty(function(menuData)
                callCallback("getHighScores", function(cb)
                    SendNUIMessage({
                        type = "highScores",
                        difficultyTitle = _U("high_score_difficulty", _U("diff_" .. menuData.difficulty)),
                        modalHighestScoreTitle = _U("high_score_name", _U("game_" .. data.GameType)),
                        highScores = cb,
                    })
                    SetNuiFocus(true, true)
                    FreezeOpenCommandGame = false
                end, data.GameType, menuData.difficulty)

            end, _U("choose_difficulty_highscore"), data.GameType, data)
        else
            callCallback("getHighScores", function(cb)
                SendNUIMessage({
                    type = "highScores",
                    modalHighestScoreTitle = "Highest score for: " .. GameTypeLabel[data.GameType],
                    highScores = cb,
                })
                SetNuiFocus(true, true)
                FreezeOpenCommandGame = false
            end, data.GameType, DifficultyType.EASY)
        end
    end
end
RegisterKey(DisplayHighestScoreHotKey, "display_highest_score", "will display highest score in game", Config.KeyToOpenHighScore)

function OpenCarnivalGameHotKey(skipCheck)
    local data, index = GetClosestCarnivalMiniGame()
    if FreezeOpenCommandGame or not data then
        return
    end

    if freezeKeyBindsTime then
        return
    end
    freezeKeyBindsTime = true
    CreateThread(function()
        Wait(5000)
        freezeKeyBindsTime = false
    end)

    if skipCheck ~= true then
        if (Config.TargetZoneType ~= 0 and GameTypeObject[data.GameType]) then
            return
        end
    end

    if data and not MinigameCamera and not data.IsBusy then
        if data.UsedBefore and data.GameType == GameType.FORTUNE_TELLER then
            local musicIndex, ms = TooSoonNazarSoundEffect(data.Entity)
            TriggerServerEvent("rcore_carnival:SyncSound", "TooSoonSoundEffect", index, musicIndex)
            FreezeOpenCommandGame = true
            Wait((ms * 1000) + 1500)
            FreezeOpenCommandGame = false
            return
        end
        if DoesEntityExist(data.Entity) or not GameTypeObject[data.GameType] then
            if data.PriceTicket == 0 or Config.Framework.Active == Framework.STANDALONE then
                SendOnEnterEvent(data, index)
            else
                Wait(100)

                if DifficultyTypesHighScores[data.GameType] then
                    SendOnEnterEvent(data, index)
                    return
                end

                callCallback("pay", function(canPlay)
                    if canPlay then
                        SendOnEnterEvent(data, index)
                    else
                        ShowNotification(_U("no_money", CommaValue(data.PriceTicket)))
                    end
                end, index)
            end
        end
    end
end
RegisterKey(OpenCarnivalGameHotKey, "open_carnival_minigame", "Will open carnival minigame", Config.KeyToOpenGame)

RegisterKey(function()
    if CanLeaveMiniGameFromHotKey[GetActiveMinigame()] then
        LeaveCarnivalGame()
    end
end, "leave_carnival_minigame", "Will leave carnival minigame", "back")

AddEventHandler("rcore_carnival:targetZone:openGame", function()
    OpenCarnivalGameHotKey(true)
end)

AddEventHandler("rcore_carnival:targetZone:highestScore", function()
    DisplayHighestScoreHotKey(true)
end)

RegisterNUICallback("backspace", function(data, cb)
    LeaveCarnivalGame()
    if cb then cb('ok') end
end)

RegisterNetEvent("rcore_carnival:setBusyStatus", function(index, status)
    Config.MiniGameList[index].IsBusy = status

    if Config.MiniGameList[index].GameType == GameType.TARGET_SHOOTER and status == false then

    end

    if Config.MiniGameList[index].GameType == GameType.BANG_BEAVER and status == false then
        if Config.MiniGameList[index].duiLoaded then
            DuiMessage(CarnivalRenderScaleFormCache[index].duiObj, {
                type = "score",
                score = 0,
            })

            DuiMessage(CarnivalRenderScaleFormCache[index].duiObj, {
                type = "health",
                health = Config.MaxBeaverHearts,
            })

            DuiMessage(CarnivalRenderScaleFormCache[index].duiObj, {
                type = "text",
                text = _U("gameover"),
            })
        end
    end
end)

RegisterNUICallback("mouseclick", function(postData, cb)
    local data, index = GetClosestCarnivalMiniGame()
    if MinigameCamera and MinigameCamera ~= 3 then
        if not MinigameCamera.IsChangingCamera() then
            TriggerEvent("rcore_carnival:onMouseClick", GetActiveMinigame(), data.Entity, ActiveMiniGameData, index, postData)
        end
    end

    if cb then cb('ok') end
end)