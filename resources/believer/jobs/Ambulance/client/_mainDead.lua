GM.Ambulance = GM.Ambulance or {}

local PlayerData              = {}
local FirstSpawn              = true
local IsDead                  = false
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local second = 1000
local minute = 60 * second
RespawnDelayAfterRPDeath   = 1 * minute

function RespawnPed(ped, coords)
    SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, coords.heading, true, false)
    SetPlayerInvincible(ped, false)
    TriggerEvent('playerSpawned', coords.x, coords.y, coords.z, coords.heading)
    ClearPedBloodDamage(ped)
end

RegisterNetEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(_type)
    local playerPed = GetPlayerPed(-1)
    local maxHealth = GetEntityMaxHealth(playerPed)
    if _type == 'small' then
        local health = GetEntityHealth(playerPed)
        local newHealth = math.min(maxHealth , math.floor(health + maxHealth/8))
        SetEntityHealth(playerPed, newHealth)
    elseif _type == 'big' then
        SetEntityHealth(playerPed, maxHealth)
    end
    ESX.ShowNotification('vous avez été soigné.')
end)

function StartDistressSignal()
    GM:newThread(function()
        local timer = RespawnDelayAfterRPDeath

        while timer > 0 and IsDead do
            Citizen.Wait(2)
            timer = timer - 30

            SetTextFont(4)
            SetTextProportional(1)
            SetTextScale(0.45, 0.45)
            SetTextColour(185, 185, 185, 255)
            SetTextDropShadow(0, 0, 0, 0, 255)
            SetTextEdge(1, 0, 0, 0, 255)
            SetTextDropShadow()
            SetTextOutline()
            BeginTextCommandDisplayText('STRING')
            AddTextComponentSubstringPlayerName("Appuyez sur [G] pour contacter les secours")
            EndTextCommandDisplayText(0.42, 0.85)

            if IsControlPressed(0, 47) then
                TriggerServerEvent("Ambulance:sendDistressSignal")
                break
            end
        end
    end)
end

function ShowTimer()
    local timer = RespawnDelayAfterRPDeath
    
    GM:newThread(function()
        while timer > 0 and IsDead do
            Citizen.Wait(0)

            raw_seconds = timer/1000
            raw_minutes = raw_seconds/60
            minutes = stringsplit(raw_minutes, ".")[1]
            seconds = stringsplit(raw_seconds-(minutes*60), ".")[1]

            SetTextFont(4)
            SetTextProportional(0)
            SetTextScale(0.0, 0.5)
            SetTextColour(255, 255, 255, 255)
            SetTextDropshadow(0, 0, 0, 0, 255)
            SetTextEdge(1, 0, 0, 0, 255)
            SetTextDropShadow()
            SetTextOutline()

            local text = 'Vous serez automatiquement transporté à l\'hôpital dans ~b~'..minutes..' minutes '..seconds..' secondes~s~'

            SetTextCentre(true)
            BeginTextCommandDisplayText("STRING")
            AddTextComponentSubstringPlayerName(text)
            EndTextCommandDisplayText(0.5, 0.8)

            timer = timer - 15
        end

        while timer <= 0 and IsDead do
            Citizen.Wait(0)

            SetTextFont(4)
            SetTextProportional(0)
            SetTextScale(0.0, 0.5)
            SetTextColour(255, 255, 255, 255)
            SetTextDropshadow(0, 0, 0, 0, 255)
            SetTextEdge(1, 0, 0, 0, 255)
            SetTextDropShadow()
            SetTextOutline()
            SetTextCentre(true)

            BeginTextCommandDisplayText("STRING")
            AddTextComponentSubstringPlayerName("Appuyez sur [~b~E~s~] pour être ~b~transporté~s~ à l'hôpital")
            EndTextCommandDisplayText(0.5, 0.8)

            if IsControlPressed(0, 51) then
                break
            end
        end
    end)
end

function OnPlayerDeath()
    IsDead = true
    TriggerServerEvent('esx_ambulancejob:setDeathStatus', 1)

    ShowTimer()

    StartDistressSignal()

    ClearPedTasksImmediately(GetPlayerPed(-1))
    SetTimecycleModifier("damage")
end

AddEventHandler('playerSpawned', function()
    IsDead = false

    if FirstSpawn then
        TriggerServerEvent('esx_ambulancejob:firstSpawn')
        exports.spawnmanager:setAutoSpawn(false) -- disable respawn
        FirstSpawn = false
    end
end)

AddEventHandler('esx:onPlayerDeath', function()
    OnPlayerDeath()
end)

RegisterNetEvent('esx_ambulancejob:revive')
AddEventHandler('esx_ambulancejob:revive', function()
    local playerPed = GetPlayerPed(-1)
    local coords    = GetEntityCoords(playerPed)
    TriggerServerEvent('esx_ambulancejob:setDeathStatus', 0)

    GM:newThread(function()

        DoScreenFadeOut(800)

        while not IsScreenFadedOut() do
            Citizen.Wait(0)
        end

        ESX.SetPlayerData('lastPosition', {
            x = coords.x,
            y = coords.y,
            z = coords.z
        })

        TriggerServerEvent('esx:updateLastPosition', {
            x = coords.x,
            y = coords.y,
            z = coords.z
        })

        RespawnPed(playerPed, {
            x = coords.x,
            y = coords.y,
            z = coords.z
        })

        ClearTimecycleModifier()

        DoScreenFadeIn(800)

    end)
end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

RegisterCommand("die", function()
    SetEntityHealth(GetPlayerPed(-1), 0)
end)

RegisterCommand("reset", function()
    ClearTimecycleModifier()
end)