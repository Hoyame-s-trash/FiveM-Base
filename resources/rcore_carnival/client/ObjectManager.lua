---------------------------------------------------------------
-- Variable list
---------------------------------------------------------------
-- Karen: Call the manager!
CachedLocalObjects = {}

---------------------------------------------------------------
-- Threads
---------------------------------------------------------------
CreateThread(function()
    local timeDelay = 0
    while true do
        Wait(timeDelay)
        local pPos = GetEntityCoords(PlayerPedId())
        timeDelay = 1000
        if GetActiveMinigame() == GameType.NONE then
            for k, v in pairs(Config.MiniGameList) do
                if (#(pPos - v.Position) < 3 and not v.IsBusy) and Config.TargetZoneType == 0 then
                    timeDelay = 0
                    if DoesEntityExist(v.Entity or 0) then
                        local text = ""
                        local offsetCoords
                        if Config.Framework.Active == Framework.STANDALONE then
                            offsetCoords = GetOffsetFromEntityInWorldCoords(v.Entity, v.floatOffsetFree.x, v.floatOffsetFree.y, v.floatOffsetFree.z)
                            if v.CantScore then
                                text = _U("play_carnival_nohighscore_free")
                            else
                                text = _U("play_carnival_free")
                            end
                        else
                            if v.PriceTicket <= 0  then
                                offsetCoords = GetOffsetFromEntityInWorldCoords(v.Entity, v.floatOffsetFree.x, v.floatOffsetFree.y, v.floatOffsetFree.z)
                                if v.CantScore then
                                    text = _U("play_carnival_nohighscore_free")
                                else
                                    text = _U("play_carnival_free")
                                end
                            else
                                offsetCoords = GetOffsetFromEntityInWorldCoords(v.Entity, v.floatOffsetPaid.x, v.floatOffsetPaid.y, v.floatOffsetPaid.z)
                                if v.CantScore then
                                    text = _U("play_carnival_nohighscore", CommaValue(v.PriceTicket))
                                else
                                    text = _U("play_carnival", CommaValue(v.PriceTicket))
                                end
                            end
                        end

                        DisplayFloatTextThisFrame(text, offsetCoords)
                    end
                end
            end
        end
    end
end)

CreateThread(function()
    local timeDelay = 0
    while true do
        Wait(timeDelay)
        local pPos = GetEntityCoords(PlayerPedId())
        timeDelay = 1000
        for k, v in pairs(Config.MiniGameList) do
            if #(pPos - v.Position) < 5 and v.IsBusy and v.GameType == GameType.BANG_BEAVER then
                timeDelay = 0
                DrawLightWithRangeAndShadow(v.Position.x, v.Position.y, v.Position.z + 1.5, 255, 255, 255, 1.0, 0.9, 0.0)
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(1000)
        local pPos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.MiniGameList) do
            if #(pPos - v.Position) < 50 then
                if v.BalloonData then
                    for key, val in pairs(v.BalloonData) do
                        if val.Entity == nil and not v.Scored then
                            val.Entity = CreateLocalObject(val[2], val[1])
                            FreezeEntityPosition(val.Entity, true)
                            SetEntityInvincible(val.Entity, true)
                        end
                    end
                end

                if v.GameType == GameType.ARCADE_CLAW then
                    if GetActiveMinigame() == GameType.ARCADE_CLAW then
                        if v.EntityClaw then
                            DeleteEntity(v.EntityClaw)
                            v.EntityClaw = nil
                        end
                    else
                        if not v.EntityClaw then
                            if DoesEntityExist(v.Entity or 0) then
                                local hookPos = GetOffsetFromEntityInWorldCoords(v.Entity, 0.1, 0.1, 1.065)
                                v.EntityClaw = CreateLocalObject("ch_prop_arcade_claw_01a_c_d", hookPos)
                                v.ClawPosition = hookPos
                            end
                        end
                    end
                end

                if not DoesEntityExist(v.Entity or 0) and GameTypeObject[v.GameType] then
                    v.Entity = CreateLocalObject(GameTypeObject[v.GameType], v.Position)

                    local translation = "play_carnival_target_free"

                    if v.PriceTicket >= 1 then
                        translation = "play_carnival_target"
                    end

                    if v.CantScore then
                        CreateTargetZone(v.Entity, {
                            {
                                type = "client",
                                name = "carnival_entity_game_" .. v.Entity,
                                event = "rcore_carnival:targetZone:openGame",
                                icon = "fas fa-folder-open",
                                label = _U(translation, CommaValue(v.PriceTicket)),
                            },
                        })
                    else
                        CreateTargetZone(v.Entity, {
                            {
                                type = "client",
                                name = "carnival_entity_game_" .. v.Entity,
                                event = "rcore_carnival:targetZone:openGame",
                                icon = "fas fa-folder-open",
                                label = _U(translation, CommaValue(v.PriceTicket)),
                            },

                            {
                                type = "client",
                                name = "carnival_entity_game_" .. v.Entity,
                                event = "rcore_carnival:targetZone:highestScore",
                                icon = "fas fa-folder-open",
                                label = _U("play_carnival_target_score"),
                            },
                        })
                    end

                    if v.Heading then
                        SetEntityHeading(v.Entity, v.Heading)
                    end

                    if v.GameType == GameType.BANG_BEAVER then
                        v.Beavers = {}
                        v.Beavers[1] = SpawnBeaverAtSlot(1, BeaverType.BEAVER_BROWN, v.Entity)
                        v.Beavers[2] = SpawnBeaverAtSlot(2, BeaverType.BEAVER_BROWN, v.Entity)
                        v.Beavers[3] = SpawnBeaverAtSlot(3, BeaverType.BEAVER_YELLOW, v.Entity)
                        v.Beavers[4] = SpawnBeaverAtSlot(4, BeaverType.BEAVER_BROWN, v.Entity)
                        v.Beavers[5] = SpawnBeaverAtSlot(5, BeaverType.BEAVER_BROWN, v.Entity)
                    end

                    if v.Prices then
                        for key, val in pairs(v.Prices) do
                            if not val.Removed then
                                val.Entity = CreateLocalObject(val.model, GetOffsetFromEntityInWorldCoords(v.Entity, val.offset.x, val.offset.y, val.offset.z))
                                SetEntityHeading(val.Entity, GetEntityHeading(v.Entity) - val.heading)
                                FreezeEntityPosition(val.Entity, true)
                            end
                        end
                    end

                    --ForceRoomForEntity(v.Entity, GetInteriorAtCoords(v.Position), GetRoomKeyFromEntity(v.Entity))
                    Debug("Creating carnival object: " .. GameTypeLabel[v.GameType])
                end
            else
                if v.BalloonData then
                    for key, val in pairs(v.BalloonData) do
                        DeleteEntity(val.Entity)
                        val.Entity = nil
                        val.Scored = false
                    end
                end

                if v.EntityClaw then
                    if DoesEntityExist(v.EntityClaw or 0) then
                        DeleteEntity(v.EntityClaw)
                    end
                end

                if v.Prices then
                    for key, val in pairs(v.Prices) do
                        DeleteEntity(val.Entity)
                        val.Entity = nil
                    end
                end

                if DoesEntityExist(v.Entity or 0) then
                    DeleteEntity(v.Entity)
                    if v.Beavers then
                        for _, entityBeaver in pairs(v.Beavers) do
                            DeleteEntity(entityBeaver)
                        end
                    end
                    v.Beavers = nil
                    Debug("Removing carnival object: " .. GameTypeLabel[v.GameType])
                end
            end
        end
    end
end)

---------------------------------------------------------------
-- Events
---------------------------------------------------------------
AddEventHandler("onResourceStop", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    for k, v in pairs(Config.MiniGameList) do
        if DoesEntityExist(v.Entity or 0) then
            DeleteEntity(v.Entity)
        end

        if DoesEntityExist(v.EntityClaw or 0) then
            DeleteEntity(v.EntityClaw)
        end

        if v.Prices then
            for key, val in pairs(v.Prices) do
                DeleteEntity(val.Entity)
                val.Entity = nil
            end
        end

        if v.BalloonData then
            for key, val in pairs(v.BalloonData) do
                DeleteEntity(val.Entity)
                val.Entity = nil
            end
        end

        if v.TargetData then
            for key, val in pairs(v.TargetData) do
                DeleteEntity(val.Entity)
                val.Entity = nil
            end
        end

        if v.Beavers then
            for _, entityBeaver in pairs(v.Beavers) do
                DeleteEntity(entityBeaver)
            end
        end
    end
end)