GM.Death = GM.Death or {}

GM.Death.IsDead = false

local FirstSpawn = true

function RespawnPed()
    local coords = GetEntityCoords(PlayerPedId())
    SetEntityCoordsNoOffset(PlayerPedId(), coords.x, coords.y, coords.z, false, false, false, true)
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, coords.heading, true, false)
    SetPlayerInvincible(PlayerPedId(), false)
    TriggerEvent("playerSpawned", coords.x, coords.y, coords.z, coords.heading)
    ClearPedBloodDamage(PlayerPedId())
end

function OnPlayerDeath()
    GM.Death.IsDead = true
    TriggerEvent("Dead:openUI", true)
    TriggerServerEvent("Ambulance:setDead", true)

    ClearPedTasksImmediately(GetPlayerPed(-1))
    SetTimecycleModifier("damage")
end

AddEventHandler("playerSpawned", function()
    GM.Death.IsDead = false

    if FirstSpawn then
        TriggerServerEvent("Ambulance:requestDeathStatus")
        exports.spawnmanager:setAutoSpawn(false) -- disable respawn
        FirstSpawn = false
    end
end)

AddEventHandler("esx:onPlayerDeath", function()
    OnPlayerDeath()
end)

RegisterNetEvent("Ambulance:revivePlayer")
AddEventHandler("Ambulance:revivePlayer", function()
    TriggerEvent("Dead:openUI", false)
    GM:newThread(function()

        DoScreenFadeOut(800)

        while (not IsScreenFadedOut()) do
            Citizen.Wait(0)
        end

        RespawnPed()

        ClearTimecycleModifier()

        DoScreenFadeIn(800)

    end)
end)

RegisterNetEvent("Ambulance:suicide", function()
    SetEntityHealth(PlayerPedId(), 0)
end)

function getDeathTime()
    return GM.Death.Time
end

exports("getDeathTime", getDeathTime)