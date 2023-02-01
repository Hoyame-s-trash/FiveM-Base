GM.Ambulance = GM.Ambulance or {}

GM.Ambulance.IsDead = false
GM.Ambulance.VipUse = false

local FirstSpawn = true
local second = 1000
local minute = 60 * second

function RespawnPed()
    local coords = GetEntityCoords(PlayerPedId())
    SetEntityCoordsNoOffset(PlayerPedId(), coords.x, coords.y, coords.z, false, false, false, true)
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, coords.heading, true, false)
    SetPlayerInvincible(PlayerPedId(), false)
    TriggerEvent("playerSpawned", coords.x, coords.y, coords.z, coords.heading)
    ClearPedBloodDamage(PlayerPedId())
end

function StartDistressSignal()
    GM:newThread(function()
        local vip = true -- Todo get VIP STATUS

        if (vip) then
            local timer = 0.2 * minute
        else
            local timer = 5 * minute
        end

        while timer > 0 and GM.Ambulance.IsDead do
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
            BeginTextCommandDisplayText("STRING")
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
    local vip = true -- Todo get VIP STATUS

    if (vip) then
        timer = 0.2 * minute
    else
        timer = 5 * minute
    end
    
    GM:newThread(function()
        while timer > 0 and GM.Ambulance.IsDead do
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

            if (vip) then
                if (not GM.Ambulance.VipUse) the 
                    local text = "Réanimation par NPC"
                    if IsControlPressed(0, 51) then
                        GM.Ambulance.VipUse = true
                        TriggerServerEvent("Ambulance:revivePlayerVip")
                        SetTimeout(10*60000, function()
                            GM.Ambulance.VipUse = false
                        end)
                        break
                    end
                else
                    local text = "Vous serez automatiquement transporté à l\"hôpital dans ~b~"..minutes.." minutes "..seconds.." secondes~s~ réanimation NPC déjà utilisée"
                end
            else
                local text = "Vous serez automatiquement transporté à l\"hôpital dans ~b~"..minutes.." minutes "..seconds.." secondes~s~"
            end


            SetTextCentre(true)
            BeginTextCommandDisplayText("STRING")
            AddTextComponentSubstringPlayerName(text)
            EndTextCommandDisplayText(0.5, 0.8)

            timer = timer - 15
        end

        while timer <= 0 and GM.Ambulance.IsDead do
            Citizen.Wait(0)

            SetTextFont(4)
            SetTextProportional(0)
            SetTextScale(0.0, 0.5)
            SetTextColour(255, 255, 255, 255)
            SetTextDropshadow(0, 0, 0, 0, 255)
            SetTextEdge(1, 0, 0, 0, 255)
            SetTextDropShadow()
            SetTextOutline()

            local text = "Appuyez sur [E] pour être transporté à l'hôpital"

            SetTextCentre(true)
            BeginTextCommandDisplayText("STRING")
            AddTextComponentSubstringPlayerName(text)
            EndTextCommandDisplayText(0.5, 0.8)

            if IsControlPressed(0, 51) then
                TriggerServerEvent("Ambulance:revivePlayerToHospital")
                break
            end
        end
    end)
end

function OnPlayerDeath()
    GM.Ambulance.IsDead = true
    TriggerServerEvent("Ambulance:setDead", true)

    ShowTimer()

    StartDistressSignal()

    ClearPedTasksImmediately(GetPlayerPed(-1))
    SetTimecycleModifier("damage")
end

AddEventHandler("playerSpawned", function()
    GM.Ambulance.IsDead = false

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
    GM:newThread(function()

        DoScreenFadeOut(800)

        while not IsScreenFadedOut() do
            Citizen.Wait(0)
        end

        RespawnPed()

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

RegisterNetEvent("Ambulance:suicide", function()
    SetEntityHealth(PlayerPedId(), 0)
end)