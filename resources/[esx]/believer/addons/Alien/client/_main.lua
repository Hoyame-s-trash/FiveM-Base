GM.Alien = GM.Alien or {}

local AlienThreadStarted = false

GM:newThread(function()
    while (GM.Alien == nil) do
        Wait(150)
    end
    while true do
        if GM.Alien["Peds"][GetEntityModel(PlayerPedId())] then
            GM:StartAlienThread()
        end
        Citizen.Wait(5000)
    end
end)

function GM:StartAlienThread()
    if AlienThreadStarted then
        return
    end
    AlienThreadStarted = true
    GM:newThread(function()
        while GM.Alien["Peds"][GetEntityModel(PlayerPedId())] do
           
            if IsControlJustPressed(0, 47) then
                local playerPed = PlayerPedId()
                local netId = NetworkGetNetworkIdFromEntity(playerPed)
                TriggerServerEvent('Alien:sendParticles', 'scr_rcbarry1', 'scr_alien_teleport', netId, 5000, {0.0, 0.0, 0.0, 0.0, 0.0, 0.0})
            end

            Citizen.Wait(0)
        end
        AlienThreadStarted = false
    end)
end

RegisterNetEvent("Alien:syncParticle", function(ptfxAsset, ptfxName, ptfxNetId, ptfxWait, position, ptfxLoop, scale, nbLoop, loopWait)
    ESX.Streaming.RequestNamedPtfxAsset(ptfxAsset)

    if not nbLoop then nbLoop = 1 end
    if not loopWait then loopWait = 0 end
    if not scale then scale = 1.0 end

    local x, y, z, xRot, yRot, zRot = table.unpack(position)

    if not NetworkDoesEntityExistWithNetworkId(ptfxNetId) then
        return
    end

    local entity = NetworkGetEntityFromNetworkId(ptfxNetId)
    if not DoesEntityExist(entity) then
        return
    end

    if ptfxLoop then
        UseParticleFxAssetNextCall(ptfxAsset)
        local particle = StartParticleFxLoopedOnEntityBone(ptfxName, entity, x, y, z, xRot, yRot, zRot, -1, scale, 0, 0, 0, 1065353216, 1065353216, 1065353216, 0)
        SetParticleFxLoopedColour(particle, 1.0, 1.0, 1.0)
    else
        for i = 1, nbLoop do
            UseParticleFxAssetNextCall(ptfxAsset)
            local particle = StartParticleFxLoopedOnEntityBone(ptfxName, entity, x, y, z, xRot, yRot, zRot, -1, scale, 0, 0, 0, 1065353216, 1065353216, 1065353216, 0)
            SetParticleFxLoopedColour(particle, 1.0, 1.0, 1.0)
            Citizen.Wait(ptfxWait)
            StopParticleFxLooped(particle, false)
            Citizen.Wait(loopWait)
        end
        RemoveNamedPtfxAsset(ptfxAsset)
    end
end)