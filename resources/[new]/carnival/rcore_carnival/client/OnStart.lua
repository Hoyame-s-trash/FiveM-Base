SharedObject = GetSharedObject()
local blips = {}

CreateThread(function()
    TriggerServerEvent("rcore_carnival:fetchCache")
end)

-- Blip creator
CreateThread(function()
    for k, v in pairs(Config.MiniGameList) do
        if v.EnableBlip then
            if v.BlipID then
                table.insert(blips, CreateBlip(_U("game_" .. v.GameType), v.BlipID, v.Position, {
                    type = 4,
                    scale = 0.8,
                    color = 0,
                    shortRange = true,
                }))
            end
        end
    end

    for k, v in pairs(Config.GiftShopLocation) do
        if v.EnableBlip then
            if v.BlipID then
                table.insert(blips, CreateBlip(v.labelShop, v.BlipID, v.position, {
                    type = 4,
                    scale = 0.8,
                    color = 0,
                    shortRange = true,
                }))
            end
        end
    end
end)

RegisterNetEvent("rcore_carnival:fetchCache", function(data)
    for k, v in pairs(data) do
        Config.MiniGameList[k].Score = v.Score
        Config.MiniGameList[k].IsBusy = v.IsBusy
    end
end)

RegisterNetEvent("rcore_carnival:newRecord", function(isWorldRecord)
    if isWorldRecord then
        SendNUIMessage({
            type = "highscore",
            text = _U("new_world_record"),
        })
    else
        SendNUIMessage({
            type = "highscore",
            text = _U("new_highscore_personal"),
        })
    end

    PlayUrlPos("record", "./carnival_sound/clapping.mp3", Config.HighestScoreSoundVolume, GetEntityCoords(PlayerPedId()), false, nil, 9999999)
end)

AddEventHandler("onResourceStop", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    for k, v in pairs(blips) do
        RemoveBlip(v)
    end

    ShakeGameplayCam(Config.ShakeName, 0.0)
    FreezeEntityPosition(PlayerPedId(), false)
    --Animation.ResetAll()
end)

RegisterNUICallback("hideMouse", function(data, cb)
    SetNuiFocus(false, false)

    if cb then cb('ok') end
end)

RegisterNUICallback("init", function(data, cb)
    SendNUIMessage({
        type = "updateMaxDarts",
        BalloonMaxDarts = Config.MaxDarts,
    })
    SendNUIMessage({
        type = "updateDartsLeft",
        BalloonDartsLeft = Config.MaxDarts,
    })

    if cb then cb('ok') end
end)