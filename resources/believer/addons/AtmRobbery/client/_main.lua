GM.AtmRobbery = GM.AtmRobbery or {}

local RopeThreadStarted = false
local Ropes = {}
local SpawnedRopes = {}
local DestroyedAtms = {}

function IsAtmDestroyed(coords)
    for _, atm in pairs(DestroyedAtms) do
        if #(atm.Coords - coords) < 0.5 then
            return true
        end
    end
end

RegisterCommand("atm", function()
    TriggerEvent("atmRobbery:startRobbing")
end)

RegisterNetEvent('atmRobbery:startRobbing')
AddEventHandler('atmRobbery:startRobbing', function()
    local closestAtm = ESX.Game.GetClosestObject(GetEntityCoords(PlayerPedId()), GM.AtmRobbery.Models)

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    if not DoesEntityExist(closestAtm) or #(GetEntityCoords(closestAtm) - GetEntityCoords(playerPed)) > 2.0 then
        ESX.ShowNotification('🏧 Il n\'y a pas d\'ATM proche')
        return
    end

    local atmCoords = GetEntityCoords(closestAtm)
    local atmRot = GetEntityRotation(closestAtm, 2)
    local atmModel = GetEntityModel(closestAtm)

    ESX.TriggerServerCallback('atmRobbery:canRobAtm', function(canRob)
        if not canRob then
            return
        end

        -- Todo contact police

        AtmRobberyCleanConsoles(atmCoords)
        local animCoords = GetOffsetFromEntityInWorldCoords(closestAtm, 0.0, -1.0, 0.0)
        local atmConsole = CreateObjectNoOffset(GM.AtmRobbery.Models[atmModel].Console, atmCoords.x, atmCoords.y, atmCoords.z, true, true, false)
        SetObjectPhysicsParams(atmConsole, 30.0, -1.0, 0.0, 0.0, 0.01, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0)
        SetEntityDynamic(atmConsole, true)
        SetEntityCollision(atmConsole, true, true)
        FreezeEntityPosition(atmConsole, true)
        SetEntityRotation(atmConsole, atmRot, 2)
        TaskGoStraightToCoord(playerPed, animCoords.x, animCoords.y, animCoords.z, 1.0, 1000, GetEntityHeading(closestAtm), 0.01)
        Citizen.Wait(2000)

        AtmRobberyAttachRopeAnim()

        local atmNetId = NetworkGetNetworkIdFromEntity(atmConsole)

        ESX.TriggerServerCallback('atmRobbery:start', function(success)
            if success then
                local animDict = 'anim@heists@narcotics@trash'
                ESX.Streaming.RequestAnimDict(animDict)
                TaskPlayAnim(playerPed, animDict, 'idle', 8.0, 8.0, -1, 51, 0, false, false, false)
                RemoveAnimDict(animDict)

                local instructions = ESX.SetupInstructionalButtons({ {key = 47,  label = 'Détacher la corde'}, {key = 38,  label = 'Attacher la corde'} })
                GM:newThread(function()
                    while Ropes[atmNetId] and Ropes[atmNetId].PlayerServerId == GetPlayerServerId(PlayerId()) do
                        DrawScaleformMovieFullscreen(instructions, 255, 255, 255, 255, 0)
                        if IsControlJustPressed(0, 38) then
                            local vehicle = ESX.GetClosestVehicleToPlayer(GetEntityCoords(PlayerPedId()), 5.0)
                            if (not DoesEntityExist(vehicle)) then
                                ESX.ShowNotification("~r~Aucun véhicule proche de vous.")
                            elseif #(GetEntityCoords(vehicle) - atmCoords) > GM.AtmRobbery.MaxRopeLength then
                                ESX.ShowNotification("~r~Le véhicule est trop éloigné de l'ATM.")
                            elseif (not GM.AtmRobbery.AllowedClass[GetVehicleClass(vehicle)]) then
                                ESX.ShowNotification("~r~La corde ne peut pas être attachée à ce véhicule.")
                            else
                                StopAnimTask(playerPed, animDict, 'idle', 1.0)
                                TaskTurnPedToFaceEntity(playerPed, vehicle, 1000)
                                Citizen.Wait(1000)
                                AtmRobberyAttachRopeAnim()
                                if #(GetEntityCoords(vehicle) - atmCoords) > GM.AtmRobbery.MaxRopeLength then
                                    ESX.ShowNotification("~r~Le véhicule est trop éloigné de l'ATM.")
                                else
                                    TriggerServerEvent('atmRobbery:attachBetweenAtmAndVehicle', atmNetId, NetworkGetNetworkIdFromEntity(vehicle))
                                end
                            end
                        end

                        if IsControlJustPressed(0, 47) or IsPedDeadOrDying(playerPed, false) or #(GetEntityCoords(playerPed) - atmCoords) > GM.AtmRobbery.MaxRopeLength * 1.5 then
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('atmRobbery:detachRope', atmNetId)
                        end
                        Citizen.Wait(0)
                    end
                end)
            end
        end, atmNetId, atmModel, atmCoords, atmRot)
    end, atmCoords)
end)

function AtmRobberyAttachRopeAnim()
    local playerPed = PlayerPedId()
    local animDict = 'mini@repair'
    ESX.Streaming.RequestAnimDict(animDict)
    FreezeEntityPosition(playerPed, true, true)
    TaskPlayAnim(playerPed, animDict, 'fixing_a_ped', 8.0, 8.0, -1, 1, 0, false, false, false)
    RemoveAnimDict(animDict)
    Citizen.Wait(GM.AtmRobbery.RopeAnimDuration)
    FreezeEntityPosition(playerPed, false, false)
    ClearPedTasks(playerPed)
end

RegisterNetEvent('atmRobbery:syncDestroyedAtms')
AddEventHandler('atmRobbery:syncDestroyedAtms', function(destroyedAtms)
    DestroyedAtms = destroyedAtms
    for _, atm in pairs(destroyedAtms) do
        AtmRobberySetAtmAsDestroyed(atm.Model, atm.Coords, atm.Rot)
    end
end)

RegisterNetEvent('atmRobbery:syncDestroyedAtm')
AddEventHandler('atmRobbery:syncDestroyedAtm', function(atmDestroyed)
    table.insert(DestroyedAtms, atmDestroyed)
    AtmRobberySetAtmAsDestroyed(atmDestroyed.Model, atmDestroyed.Coords, atmDestroyed.Rot)
    if #(GetEntityCoords(PlayerPedId()) - atmDestroyed.Coords) < 100.0 then
        PlaySoundFromCoord(-1, 'magnetic_explosion', atmDestroyed.Coords, 'dlc_h4_heist_finale_sounds_soundset', false, 100, false)
        UseParticleFxAsset('core')
        local particle = StartParticleFxLoopedAtCoord('ent_dst_elec_crackle', atmDestroyed.Coords.x, atmDestroyed.Coords.y, atmDestroyed.Coords.z+1.5, 0.0, 0.0, 0.0, 2.0, false, false, false, false)
        Citizen.SetTimeout(10000, function()
            RemoveParticleFx(particle)
        end)
    end
end)

function AtmRobberySetAtmAsDestroyed(model, coords, rot)
    if not GM.AtmRobbery.Models[model] then
        return
    end

    ESX.Game.SpawnObject(GM.AtmRobbery.Models[model].Destroyed, coords, function(entity)
        SetEntityRotation(entity, rot.x, rot.y, rot.z, rotationOrder, p5)
        SetEntityCollision(entity, true, true)
        FreezeEntityPosition(entity, true)
    end, false)

    CreateModelHide(coords.x, coords.y, coords.z, 0.5, model, true)
end

function AtmRobberyCleanConsoles(coords)
    for _, model in pairs(GM.AtmRobbery.Models) do
        local entity = GetClosestObjectOfType(coords, 0.1, model.Console)
        if DoesEntityExist(entity) then
            DeleteEntity(entity)
        end
    end
end

RegisterNetEvent('atmRobbery:syncRopes')
AddEventHandler('atmRobbery:syncRopes', function(ropes)
    Ropes = ropes
    StartAtmRobberyThread()
end)

RegisterNetEvent('atmRobbery:syncRope')
AddEventHandler('atmRobbery:syncRope', function(atmNetId, ropeConfig)
    if SpawnedRopes[atmNetId] then
        DeleteRope(SpawnedRopes[atmNetId])
    end

    Ropes[atmNetId] = ropeConfig
    StartAtmRobberyThread()
end)

function StartAtmRobberyThread()
    if RopeThreadStarted then
        return
    end
    RopeThreadStarted = true
    GM:newThread(function()
        while next(Ropes) do
            for atmNetId,_ in pairs(Ropes) do
                if not SpawnedRopes[atmNetId] then
                    AttachAtmRobberyRope(atmNetId)
                end
            end
            Citizen.Wait(1000)
        end
        RopeThreadStarted = false
    end)
end

function AttachAtmRobberyRope(atmNetId)
    local ropeConfig = Ropes[atmNetId]
    if not NetworkDoesNetworkIdExist(atmNetId) then
        return
    end
    local atmEntity = NetworkGetEntityFromNetworkId(atmNetId)
    local atmOffset = vector3(0.0, 0.0, 0.75)
    local offset = nil
    local entity = nil
    local bone = nil
    if ropeConfig.PlayerServerId then
        offset = vector3(0.0, 0.0, 0.0)

        local playerId = GetPlayerFromServerId(ropeConfig.PlayerServerId)
        if playerId == -1 then
            return
        end

        entity = GetPlayerPed(playerId)
        offset = vector3(0.0, 0.0, 0.0)
        bone = 28422
    elseif ropeConfig.VehicleNetId then
        if not NetworkDoesNetworkIdExist(ropeConfig.VehicleNetId) then
            return
        end

        entity = NetworkGetEntityFromNetworkId(ropeConfig.VehicleNetId)
        local min, max = GetModelDimensions(GetEntityModel(entity))
        offset = vector3(0.0, min.y*0.9, 0.0)
        SetObjectPhysicsParams(atmEntity, 30.0, -1.0, 0.0, 0.0, 0.01, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0)
    end

    SpawnAtmRobberyRope(atmNetId, atmEntity, atmOffset, false, entity, offset, bone)
end

function SpawnAtmRobberyRope(atmNetId, atmEntity, atmOffset, atmBone, entity, offset, bone)

    if not DoesEntityExist(atmEntity) or not DoesEntityExist(entity) then
        return
    end

    local atmEntityAttachCoords = nil
    local entityAttachCoords = nil
    local atmEntityCoords = GetEntityCoords(atmEntity)
    local ropeMinLength = 0.5
    local ropeLength = 2.2
    local ropeBendFactor = 1.0
    local rope = AddRope(atmEntityCoords.x, atmEntityCoords.y, atmEntityCoords.z, 0.0, 0.0, 0.0, ropeLength, 1, GM.AtmRobbery.MaxRopeLength, ropeMinLength, 1.0, false, false, false, ropeBendFactor, false, 0)
    SpawnedRopes[atmNetId] = rope

    GM:newThread(function()
        while Ropes[atmNetId] and DoesRopeExist(rope) and DoesEntityExist(atmEntity) and DoesEntityExist(entity) do
            if not RopeAreTexturesLoaded() then
                RopeLoadTextures()
            end
            atmEntityAttachCoords = atmBone and (IsEntityAPed(atmEntity) and GetPedBoneCoords(atmEntity, atmBone, atmOffset.x, atmOffset.y, atmOffset.z) or GetEntityBonePosition_2(atmEntity, atmBone)) or GetOffsetFromEntityInWorldCoords(atmEntity, atmOffset.x, atmOffset.y, atmOffset.z)
            entityAttachCoords = bone and (IsEntityAPed(entity) and GetPedBoneCoords(entity, bone, offset.x, offset.y, offset.z) or GetEntityBonePosition_2(entity, bone)) or GetOffsetFromEntityInWorldCoords(entity, offset.x, offset.y, offset.z)
            ropeLength = math.min(GM.AtmRobbery.MaxRopeLength, #(entityAttachCoords - atmEntityAttachCoords) * 1.2)
            AttachEntitiesToRope(rope, atmEntity, entity, atmEntityAttachCoords.x, atmEntityAttachCoords.y, atmEntityAttachCoords.z, entityAttachCoords.x, entityAttachCoords.y, entityAttachCoords.z, ropeLength, false, false, 0, 0)
            Citizen.Wait(0)
        end

        DeleteRope(rope)
        SpawnedRopes[atmNetId] = nil
        if not next(SpawnedRopes) then
            RopeUnloadTextures()
        end
    end)

    local ropeNearMaxLength = false
    local hitCount = 0
    local moneyParticle = nil
    local moneyParticle2 = nil

    GM:newThread(function()
        while Ropes[atmNetId] and DoesRopeExist(rope) and DoesEntityExist(atmEntity) and DoesEntityExist(entity) do
            if Ropes[atmNetId].VehicleNetId then
                if not IsAtmDestroyed(Ropes[atmNetId].AtmCoords) then
                    -- if Todo check job of player (police, sheriff) and #(GetEntityCoords(PlayerPedId()) - entityAttachCoords) < 1.5 then
                    --     ESX.ShowHelpNotification('Appuyez sur ~INPUT_PICKUP~ pour détacher la corde')
                    --     if IsControlJustPressed(0, 38) then
                    --         TaskTurnPedToFaceEntity(PlayerPedId(), entity, 1000)
                    --         Citizen.Wait(1000)
                    --         AtmRobberyAttachRopeAnim()
                    --         if #(GetEntityCoords(PlayerPedId()) - entityAttachCoords) < 1.5 then
                    --             ESX.ShowNotification('La corde a bien été détachée')
                    --             TriggerServerEvent('atmRobbery:detachRope', atmNetId)
                    --         else
                    --             ESX.ShowNotification('Le véhicule est trop éloigné')
                    --         end
                    --     end
                    -- end

                    if not ropeNearMaxLength and (ropeLength > GM.AtmRobbery.MaxRopeLength * 0.98) then
                        ropeNearMaxLength = true
                        PlaySoundFromCoord(-1, 'magnetic_explosion', atmEntityAttachCoords, 'dlc_h4_heist_finale_sounds_soundset', false, 100, false)
                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                        if DoesEntityExist(vehicle) and NetworkGetEntityIsNetworked(vehicle) and Ropes[atmNetId].VehicleNetId == NetworkGetNetworkIdFromEntity(vehicle) and GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
                            hitCount = hitCount + 1
                            if hitCount >= GM.AtmRobbery.HitTarget then
                                print("destroy atm")
                                TriggerServerEvent('atmRobbery:destroyAtm', atmNetId)
                            end
                        end
                    elseif ropeNearMaxLength and ropeLength < GM.AtmRobbery.MaxRopeLength * 0.6 then
                        ropeNearMaxLength = false
                    end
                else
                    if #(atmEntityAttachCoords - GetEntityCoords(PlayerPedId())) < 1.5 then
                        ESX.ShowHelpNotification('Appuyez sur ~INPUT_PICKUP~ pour intéragir')
                        if IsControlJustPressed(0, 38) then
                            local success = GM.AtmRobbery:LootAtmAnimation(atmEntity)
                            if (success and DoesEntityExist(atmEntity)) then
                                -- Todo check the current job if is police then remove the destroyed atm
                                TriggerServerEvent('atmRobbery:reward', atmNetId)
                            end
                        end
                    end

                    local vehicle = NetworkGetEntityFromNetworkId(Ropes[atmNetId].VehicleNetId)
                    if DoesEntityExist(vehicle) and GetEntitySpeed(vehicle) > 20.0 then
                        if not DoesParticleFxLoopedExist(moneyParticle) or not DoesParticleFxLoopedExist(moneyParticle2) then
                            RemoveParticleFx(moneyParticle, false)
                            RemoveParticleFx(moneyParticle2, false)
                            ESX.Streaming.RequestNamedPtfxAsset('scr_xs_celebration')
                            UseParticleFxAssetNextCall('scr_xs_celebration')
                            moneyParticle = StartParticleFxLoopedOnEntityBone('scr_xs_money_rain', atmEntity, 0.0, 0.0, 1.0, 90.0, 0.0, 0.0, 0, 1.0, false, false, false)
                            UseParticleFxAssetNextCall('scr_xs_celebration')
                            moneyParticle2 = StartParticleFxLoopedOnEntityBone('scr_xs_money_rain', atmEntity, 0.0, 0.0, 1.0, -90.0, 0.0, 0.0, 0, 1.0, false, false, false)
                        end
                    elseif DoesParticleFxLoopedExist(moneyParticle) or DoesParticleFxLoopedExist(moneyParticle2) then
                        RemoveParticleFx(moneyParticle, false)
                        RemoveParticleFx(moneyParticle2, false)
                        RemoveNamedPtfxAsset('scr_xs_celebration')
                    end

                end
            end

            Citizen.Wait(0)
        end

        RemoveParticleFx(moneyParticle, false)
        RemoveParticleFx(moneyParticle2, false)
    end)
end

function GM.AtmRobbery:LootAtmAnimation(entity)
    local playerPed = PlayerPedId()
    local coords = GetOffsetFromEntityInWorldCoords(entity, 0.0, 0.0, 1.5)
    TaskTurnPedToFaceCoord(playerPed, coords, 1000)
    Citizen.Wait(1000)
    local animDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@'
    local anim = 'machinic_loop_mechandplayer'
    ESX.Streaming.RequestAnimDict(animDict)
    TaskPlayAnim(playerPed, animDict, anim, 8.0, 8.0, -1, 1, 0, false, false, false)
    RemoveAnimDict(animDict)
    Citizen.Wait(1000)
    local timeout = GetGameTimer() + GM.AtmRobbery.LootDuration
    local looting = true

    GM:newThread(function()
        while (looting) do
            local progress = (1 - (timeout-GetGameTimer())/GM.AtmRobbery.LootDuration) * 100
            GM.AtmRobbery:ProgressBar(0, progress)
            Citizen.Wait(0)
        end
    end)

    while (GetGameTimer() < timeout) do
        if #(GetEntityCoords(entity) - GetEntityCoords(playerPed)) > 2.0 then
            ESX.ShowNotification("~r~Vous êtes trop éloigné de l'ATM.")
            ClearPedTasks(playerPed)
            looting = false
            return false
        end
        if (not IsEntityPlayingAnim(playerPed, animDict, anim, 3) or IsPedDeadOrDying(playerPed, false) or IsPedRagdoll(playerPed)) then
            looting = false
            return false
        end
        Citizen.Wait(500)
    end

    ClearPedTasks(playerPed)
    looting = false
    return true
end

function GM.AtmRobbery:ProgressBar(index, progress)
    DrawRect(0.943, 0.965 - (index * 0.042), 0.074, 0.032, 0, 0, 0, 150)
    SetTextFont(0)
    SetTextJustification(1)
    SetTextScale(0.29, 0.29)
    SetTextColour(255, 255, 255, 200)
    local progressBarWidth = 0.104 * 0.6 * progress / 100
    DrawRect(0.933 - 0.02 + 0.104 * 0.6 / 2, 0.965 - (index * 0.042), 0.104 * 0.6, 0.014, 0, 0, 0, 240)
    DrawRect(0.933 - 0.02 + progressBarWidth / 2, 0.965 - (index * 0.042), progressBarWidth, 0.014, 220, 220, 220, 240)
end
