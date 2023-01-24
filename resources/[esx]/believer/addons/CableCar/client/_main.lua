GM.CableCar = GM.CableCar or {}

local CableCars = nil
local CableCarsDirection = nil
local TotalTrackDistance = {}
local CameraMode = 0

RegisterNetEvent('CableCar:sync')
AddEventHandler('CableCar:sync', function(cableCarsDirection, movingCableCarStartTime)
    CableCarsDirection = cableCarsDirection
    while (not HasNetworkTimeStarted()) do 
        Citizen.Wait(100) 
    end
    if movingCableCarStartTime then
        TriggerEvent('CableCar:start', cableCarsDirection, movingCableCarStartTime)
    end
end)

Citizen.CreateThread(function()
    TriggerServerEvent('CableCar:sync')

    while CableCarsDirection == nil do 
        Citizen.Wait(0) 
    end

    -- Compute total track distance
    for trackId, track in pairs(GM.CableCar.Tracks) do
        TotalTrackDistance[trackId] = 0.0
        for i=1, #track.Coords-1 do
            TotalTrackDistance[trackId] = TotalTrackDistance[trackId] + #(track.Coords[i] - track.Coords[i+1])
        end
    end

    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local distance = #(playerCoords - vector3(-98.38, 5583.1, 355.95))
        if distance < 1000.0 and not CableCars then
            CableCars = {}
            RequestScriptAudioBank('CABLE_CAR', false, -1)
            RequestScriptAudioBank('CABLE_CAR_SOUNDS', false, -1)
            ESX.Streaming.RequestAnimDict('p_cablecar_s')
            ESX.Streaming.RequestModel(`p_cablecar_s`)
            ESX.Streaming.RequestModel(`p_cablecar_s_door_l`)
            ESX.Streaming.RequestModel(`p_cablecar_s_door_r`)
            ESX.Streaming.RequestModel(`p_cablecar_s`)

            for trackId, track in pairs(GM.CableCar.Tracks) do
                local cableCar = {}
                local coords = CableCarsDirection and track.Coords[#track.Coords] or track.Coords[1]

                cableCar.entity = CreateObjectNoOffset(`p_cablecar_s`, coords.x, coords.y, coords.z, false, false, false)
                cableCar.doorLL = CreateObjectNoOffset(`p_cablecar_s_door_l`, coords.x, coords.y, coords.z, false, false, false)
                cableCar.doorLR = CreateObjectNoOffset(`p_cablecar_s_door_r`, coords.x, coords.y, coords.z, false, false, false)
                AttachEntityToEntity(cableCar.doorLL, cableCar.entity, 0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 1, 0, 2, 1)
                AttachEntityToEntity(cableCar.doorLR, cableCar.entity, 0, 0.0, -1.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 1, 0, 2, 1)
                cableCar.doorRL = CreateObjectNoOffset(`p_cablecar_s_door_l`, coords.x, coords.y, coords.z, false, false, false)
                cableCar.doorRR = CreateObjectNoOffset(`p_cablecar_s_door_r`, coords.x, coords.y, coords.z, false, false, false)
                AttachEntityToEntity(cableCar.doorRL, cableCar.entity, 0, 0.0, -1.0, 0.0, 0.0, 0.0, 180.0, 0, 0, 1, 0, 2, 1)
                AttachEntityToEntity(cableCar.doorRR, cableCar.entity, 0, 0.0, 1.0, 0.0, 0.0, 0.0, 180.0, 0, 0, 1, 0, 2, 1)
                SetEntityRotation(cableCar.entity, track.Rotation.x, track.Rotation.y, track.Rotation.z, 0, 1)
                FreezeEntityPosition(cableCar.entity, true)
                CableCars[trackId] = cableCar
            end
        elseif distance >= 1000.0 and CableCars then
            for trackId,_ in pairs(GM.CableCar.Tracks) do
                ESX.Game.DeleteEntity(CableCars[trackId].entity)
                ESX.Game.DeleteEntity(CableCars[trackId].doorLL)
                ESX.Game.DeleteEntity(CableCars[trackId].doorLR)
                ESX.Game.DeleteEntity(CableCars[trackId].doorRL)
                ESX.Game.DeleteEntity(CableCars[trackId].doorRR)
            end
            ReleaseNamedScriptAudioBank('CABLE_CAR')
            ReleaseNamedScriptAudioBank('CABLE_CAR_SOUNDS')
            RemoveAnimDict('p_cablecar_s')
            SetModelAsNoLongerNeeded(`p_cablecar_s`)
            SetModelAsNoLongerNeeded(`p_cablecar_s_door_l`)
            SetModelAsNoLongerNeeded(`p_cablecar_s_door_r`)
            SetModelAsNoLongerNeeded(`p_cablecar_s`)
            CableCars = nil
        end

        Citizen.Wait(5000)
    end
end)

function IsCableCarGoingUp(trackId)
    if not CableCarsDirection then
        if trackId == 2 then
            return true
        end
    else
        if trackId == 1 then
            return true
        end
    end
end

function ScaleBetween(unscaledNum, minAllowed, maxAllowed, min, max)
    return (maxAllowed - minAllowed) * (unscaledNum - min) / (max - min) + minAllowed
end

function CoordsIsInsidePolygon(polygon, coords)
    local oddNodes = false
    local j = #polygon
    for i = 1, #polygon do
        if (polygon[i].y < coords.y and polygon[j].y >= coords.y or polygon[j].y < coords.y and polygon[i].y >= coords.y) then
            if (polygon[i].x + ( coords.y - polygon[i].y ) / (polygon[j].y - polygon[i].y) * (polygon[j].x - polygon[i].x) < coords.x) then
                oddNodes = not oddNodes
            end
        end
        j = i
    end
    return oddNodes
end

RegisterNetEvent('CableCar:start')
AddEventHandler('CableCar:start', function(direction, startServerTime)
    local now = GetNetworkTime()
    local start = startServerTime or now
    local timeout = start + GM.CableCar.Duration

    CableCarsDirection = direction

    for trackId,_ in pairs(GM.CableCar.Tracks) do
        local trackCoords = ESX.Table.Clone(GM.CableCar.Tracks[trackId].Coords)
        if not direction then
            trackCoords = ESX.Table.Reverse(trackCoords)
        end

        local anims = IsCableCarGoingUp(trackId) and GM.CableCar.UpAnim[trackId] or GM.CableCar.DownAnim[trackId]
        local travelSoundId = nil
        local entitiesToDetach = {}
        local lastSteps = {}
        local isInsideCableCar = false
        local cam = nil

        Citizen.CreateThreadNow(function()
            while now < timeout do
                now = GetNetworkTime()
                local sleepTime = 1000

                if CableCars and CableCars[trackId] and DoesEntityExist(CableCars[trackId].entity) then
                    sleepTime = 0

                    local currentTime = now - start

                    if currentTime < GM.CableCar.DoorMoveDuration then
                        if not lastSteps[trackId] or lastSteps[trackId] ~= 'CLOSE' then
                            lastSteps[trackId] = 'CLOSE'
                            -- Close sound
                            local playerPed = PlayerPedId()
                            local playerCoords = GetEntityCoords(playerPed)
                            local cableCarCoords = GetEntityCoords(CableCars[trackId].entity) - vector3(0.0, 0.0, 5.0)
                            if #(playerCoords - cableCarCoords) < 50.0 then
                                PlaySoundFromEntity(-1, 'DOOR_CLOSE', CableCars[trackId].entity, 'CABLE_CAR_SOUNDS', false, 0)
                            end
                        end

                        -- Door close
                        local openRatio = ScaleBetween(currentTime, 1.0, 0.0, 0.0, GM.CableCar.DoorMoveDuration)
                        AttachEntityToEntity(CableCars[trackId].doorLL, CableCars[trackId].entity, 0, 0.0, openRatio, 0.0, 0.0, 0.0, 0.0, 0, 0, 1, 0, 2, 1)
                        AttachEntityToEntity(CableCars[trackId].doorLR, CableCars[trackId].entity, 0, 0.0, -openRatio, 0.0, 0.0, 0.0, 0.0, 0, 0, 1, 0, 2, 1)
                        AttachEntityToEntity(CableCars[trackId].doorRL, CableCars[trackId].entity, 0, 0.0, -openRatio, 0.0, 0.0, 0.0, 180.0, 0, 0, 1, 0, 2, 1)
                        AttachEntityToEntity(CableCars[trackId].doorRR, CableCars[trackId].entity, 0, 0.0, openRatio, 0.0, 0.0, 0.0, 180.0, 0, 0, 1, 0, 2, 1)
                    elseif currentTime < GM.CableCar.DoorMoveDuration + GM.CableCar.CableCarTravelTime then
                        -- Cable car travel
                        local totalStepsDuration = 0.0
                        for i=1, #trackCoords-1 do
                            local stepDistance = #(trackCoords[i] - trackCoords[i+1])
                            local stepDuration = stepDistance / TotalTrackDistance[trackId] * GM.CableCar.CableCarTravelTime
                            totalStepsDuration = totalStepsDuration + stepDuration
                            if currentTime - GM.CableCar.DoorMoveDuration < totalStepsDuration then

                                if not lastSteps[trackId] or lastSteps[trackId] ~= i then
                                    lastSteps[trackId] = i

                                    -- Running Sound
                                    if i == 1 then
                                        travelSoundId = GetSoundId()
                                        PlaySoundFromEntity(-1, 'Leave_Station', CableCars[trackId].entity, 'CABLE_CAR_SOUNDS', false, 0)
                                        PlaySoundFromEntity(travelSoundId, 'Running', CableCars[trackId].entity, 'CABLE_CAR_SOUNDS', false, 0)

                                        local playerPed = PlayerPedId()
                                        local playerCoords = GetEntityCoords(playerPed)
                                        local cableCarCoords = GetEntityCoords(CableCars[trackId].entity) - vector3(0.0, 0.0, 5.0)
                                        local polygon = {}
                                        for _, cornerCoords in pairs(GM.CableCar.Corners) do
                                            local coords = GetOffsetFromEntityInWorldCoords(CableCars[trackId].entity, cornerCoords.x, cornerCoords.y, cornerCoords.z)
                                            table.insert(polygon, coords)
                                        end
                                        -- Attach player
                                        if #(playerCoords - cableCarCoords) < 5.0 then
                                            if CoordsIsInsidePolygon(polygon, playerCoords) then
                                                local offset = GetOffsetFromEntityGivenWorldCoords(CableCars[trackId].entity, playerCoords.x, playerCoords.y, playerCoords.z)
                                                local rotOffset = GetEntityRotation(playerPed, 2) - GetEntityRotation(CableCars[trackId].entity, 2)
                                                AttachEntityToEntity(playerPed, CableCars[trackId].entity, -1, offset.x, offset.y, offset.z, rotOffset.x, rotOffset.y, rotOffset.z, false, false, false, false, 2, true)
                                                TriggerEvent('dpemotes:setCanDoAnimations', false)
                                                table.insert(entitiesToDetach, playerPed)
                                                isInsideCableCar = true
                                                ESX.ShowHelpNotification('Appuyez sur ~INPUT_JUMP~ pour changer de caméra')
                                            end
                                        end

                                        -- Attach other peds
                                        for _, ped in pairs(ESX.Game.GetPlayersInArea(cableCarCoords, 10.0)) do
                                            local pedCoords = GetEntityCoords(ped)
                                            if ped ~= playerPed and CoordsIsInsidePolygon(polygon, pedCoords) then
                                                NetworkAllowLocalEntityAttachment(ped, true)
                                                local offset = GetOffsetFromEntityGivenWorldCoords(CableCars[trackId].entity, pedCoords.x, pedCoords.y, pedCoords.z)
                                                local rotOffset = GetEntityRotation(ped, 2) - GetEntityRotation(CableCars[trackId].entity, 2)
                                                AttachEntityToEntity(ped, CableCars[trackId].entity, -1, offset.x, offset.y, offset.z, rotOffset.x, rotOffset.y, rotOffset.z, false, false, false, false, 2, true)
                                                table.insert(entitiesToDetach, ped)
                                            end
                                        end

                                        -- Attach vehicles
                                        for _, vehicle in pairs(ESX.Game.GetVehiclesInArea(cableCarCoords, 10.0)) do
                                            local vehicleCoords = GetEntityCoords(vehicle)
                                            if CoordsIsInsidePolygon(polygon, vehicleCoords) then
                                                NetworkAllowLocalEntityAttachment(vehicle, true)
                                                local offset = GetOffsetFromEntityGivenWorldCoords(CableCars[trackId].entity, vehicleCoords.x, vehicleCoords.y, vehicleCoords.z)
                                                local rotOffset = GetEntityRotation(vehicle, 2) - GetEntityRotation(CableCars[trackId].entity, 2)
                                                AttachEntityToEntity(vehicle, CableCars[trackId].entity, -1, offset.x, offset.y, offset.z, rotOffset.x, rotOffset.y, rotOffset.z, false, false, false, false, 2, true)
                                                table.insert(entitiesToDetach, vehicle)
                                            end
                                        end
                                    end

                                    -- Anim
                                    local anim = anims[i]
                                    if anim then
                                        PlayEntityAnim(CableCars[trackId].entity, anim, 'p_cablecar_s', 8.0, false, true, false, 0.0, 0)
                                    end

                                    -- Destroy camera
                                    if i == #trackCoords-1 then
                                        if isInsideCableCar and DoesCamExist(cam) then
                                            SetCamActive(cam, false)
                                            RenderScriptCams(false, true, 3000, true, true)
                                            DestroyCam(cam, false)
                                        end
                                    end
                                end

                                -- Camera
                                if isInsideCableCar then
                                    DisableControlAction(0, 22, true)
                                    if IsDisabledControlJustPressed(0, 22) then
                                        if not DoesCamExist(cam) then
                                            CameraMode = 1
                                            cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
                                            SetCamActive(cam, true)
                                            RenderScriptCams(true, true, 1000, true, true)
                                        else
                                            CameraMode = (CameraMode + 1) % 3
                                            if CameraMode == 0 then
                                                SetCamActive(cam, false)
                                                RenderScriptCams(false, true, 0, true, true)
                                                DestroyCam(cam, false)
                                            end
                                        end
                                    end

                                    if DoesCamExist(cam) then
                                        local offset = nil
                                        if CameraMode == 1 then
                                            offset = vector3(-10.0, CableCarsDirection and -30.0 or 30.0, IsCableCarGoingUp(trackId) and -15.0 or 15.0)
                                        else
                                            offset = vector3(-10.0, CableCarsDirection and 30.0 or -30.0, IsCableCarGoingUp(trackId) and 15.0 or -15.0)
                                        end

                                        local camCoords = GetOffsetFromEntityInWorldCoords(CableCars[trackId].entity, offset.x, offset.y, offset.z)
                                        SetCamCoord(cam, camCoords.x, camCoords.y, camCoords.z)
                                        PointCamAtEntity(cam, CableCars[trackId].entity, 0.0, 0.0, 0.0, true)
                                    end
                                end

                                local stepMultiplier = ScaleBetween(currentTime - GM.CableCar.DoorMoveDuration, 0.0, 1.0, totalStepsDuration - stepDuration, totalStepsDuration)
                                local dir = trackCoords[i+1] - trackCoords[i]
                                local newCoords = trackCoords[i] + stepMultiplier * dir
                                SetEntityCoordsNoOffset(CableCars[trackId].entity, newCoords.x, newCoords.y, newCoords.z, false, false, false)
                                -- Make sure doors are attached in closed position
                                AttachEntityToEntity(CableCars[trackId].doorLL, CableCars[trackId].entity, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 1, 0, 2, 1)
                                AttachEntityToEntity(CableCars[trackId].doorLR, CableCars[trackId].entity, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 1, 0, 2, 1)
                                AttachEntityToEntity(CableCars[trackId].doorRL, CableCars[trackId].entity, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 180.0, 0, 0, 1, 0, 2, 1)
                                AttachEntityToEntity(CableCars[trackId].doorRR, CableCars[trackId].entity, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 180.0, 0, 0, 1, 0, 2, 1)
                                break
                            end
                        end
                    elseif currentTime < GM.CableCar.DoorMoveDuration + GM.CableCar.CableCarTravelTime + GM.CableCar.DoorMoveDuration then

                        if not lastSteps[trackId] or lastSteps[trackId] ~= 'OPEN' then
                            lastSteps[trackId] = 'OPEN'

                            if travelSoundId then
                                StopSound(travelSoundId)
                                ReleaseSoundId(travelSoundId)
                                travelSoundId = nil
                            end

                            local playerPed = PlayerPedId()
                            local playerCoords = GetEntityCoords(playerPed)
                            -- Open sound
                            local cableCarCoords = GetEntityCoords(CableCars[trackId].entity) - vector3(0.0, 0.0, 5.0)
                            local distance = #(playerCoords - cableCarCoords)
                            if distance < 50.0 then
                                PlaySoundFromEntity(-1, 'Arrive_Station', CableCars[trackId].entity, 'CABLE_CAR_SOUNDS', false, 0)
                                PlaySoundFromEntity(-1, 'DOOR_OPEN', CableCars[trackId].entity, 'CABLE_CAR_SOUNDS', false, 0)
                            end
                        end

                        -- Door open
                        local openRatio = ScaleBetween(currentTime, 0.0, 1.0, GM.CableCar.DoorMoveDuration + GM.CableCar.CableCarTravelTime, GM.CableCar.DoorMoveDuration + GM.CableCar.CableCarTravelTime + GM.CableCar.DoorMoveDuration)
                        AttachEntityToEntity(CableCars[trackId].doorLL, CableCars[trackId].entity, 0, 0.0, openRatio, 0.0, 0.0, 0.0, 0.0, 0, 0, 1, 0, 2, 1)
                        AttachEntityToEntity(CableCars[trackId].doorLR, CableCars[trackId].entity, 0, 0.0, -openRatio, 0.0, 0.0, 0.0, 0.0, 0, 0, 1, 0, 2, 1)
                        AttachEntityToEntity(CableCars[trackId].doorRL, CableCars[trackId].entity, 0, 0.0, -openRatio, 0.0, 0.0, 0.0, 180.0, 0, 0, 1, 0, 2, 1)
                        AttachEntityToEntity(CableCars[trackId].doorRR, CableCars[trackId].entity, 0, 0.0, openRatio, 0.0, 0.0, 0.0, 180.0, 0, 0, 1, 0, 2, 1)
                    end
                end

                Citizen.Wait(sleepTime)
            end

            if travelSoundId then
                StopSound(travelSoundId)
                ReleaseSoundId(travelSoundId)
            end

            for _, ped in pairs(entitiesToDetach) do
                if DoesEntityExist(ped) then
                    DetachEntity(ped, true, false)
                    NetworkAllowLocalEntityAttachment(ped, false)
                end
            end

            if isInsideCableCar then
                TriggerEvent('dpemotes:setCanDoAnimations', true)
                if DoesCamExist(cam) then
                    SetCamActive(cam, false)
                    RenderScriptCams(false, true, 0, true, true)
                    DestroyCam(cam, false)
                end
            end
        end)
    end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for _, cableCar in pairs(CableCars or {}) do
            ESX.Game.DeleteEntity(cableCar.entity)
            ESX.Game.DeleteEntity(cableCar.doorLL)
            ESX.Game.DeleteEntity(cableCar.doorLR)
            ESX.Game.DeleteEntity(cableCar.doorRL)
            ESX.Game.DeleteEntity(cableCar.doorRR)
		end
	end
end)