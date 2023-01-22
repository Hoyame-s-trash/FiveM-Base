GM.Interface = GM.Interface or {}

GM.Interface.CurrentDisplay = true -- Todo faire un module de préférences stocké dans le cache du joueur afin de gérer cette variable

function GM.Interface:Display(bool)
    SendNUIMessage({
        type = "toggleHud",
        showHud = bool,
    })
end

GM:newThread(function()
    while true do
        if NetworkIsPlayerTalking(PlayerId()) then
            SendNUIMessage({
                type = "updateMicrophone",
                microphone = true
            })
        else
            SendNUIMessage({
                type = "updateMicrophone",
                microphone = false
            })
        end
        if not IsPauseMenuActive() then
            if (GM.Interface.CurrentDisplay) then
                GM.Interface:Display(true)
            else
                GM.Interface:Display(false)
            end
        else
            GM.Interface:Display(false)
        end
        Wait(20)
    end
end)

RegisterNetEvent("Interface:updatePlayerCount", function(playerCount)
    GM.Interface.PlayerCount = playerCount
    SendNUIMessage({
        type = "updatePlayers",
        online = tostring(GM.Interface.PlayerCount),
    })
end)

RegisterNetEvent("Interface:updateTime", function(date, time)
    GM.Interface.Hours = time
    GM.Interface.Date = date
    SendNUIMessage({
        type = "updateDate",
        value = GM.Interface.Date,
    })
    SendNUIMessage({
        type = "updateTime",
        value = GM.Interface.Hours,
    })
end)

GM:newThread(function()
    while true do
        Wait(850)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        GM.Interface.ZoneName = GM.Interface.Zones[GetNameOfZone(pos.x, pos.y, pos.z)]
        GM.Interface.StreetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(pos.x, pos.y, pos.z))
        GM.Interface.DirectionHeading = GM.Interface.Direction[math.floor((GetEntityHeading(ped) + 22.5) / 45.0)]
        SendNUIMessage({
            type = "updateGps",
            direction = GM.Interface.DirectionHeading,
            texts = {GM.Interface.ZoneName,GM.Interface.StreetName},
        })
    end
end)

AddEventHandler("esx:playerLoaded", function(xPlayer)
    ESX.PlayerData = xPlayer

    for i = 1, #ESX.PlayerData.accounts, 1 do
        if ESX.PlayerData.accounts[i].name == 'cash' then
            SendNUIMessage({
                type = "updateMoney",
                cash = ESX.PlayerData.accounts[i].money
            })
        end
        if ESX.PlayerData.accounts[i].name == 'bank' then
            SendNUIMessage({
                type = "updateBank",
                bank = ESX.PlayerData.accounts[i].money
            })
        end
    end
end)

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
    for i = 1, #ESX.PlayerData.accounts, 1 do
        if ESX.PlayerData.accounts[i].name == 'cash' then
            SendNUIMessage({
                type = "updateMoney",
                cash = ESX.PlayerData.accounts[i].money
            })
            ESX.PlayerData.accounts[i] = account
			break
        end
        if ESX.PlayerData.accounts[i].name == 'bank' then
            SendNUIMessage({
                type = "updateBank",
                bank = ESX.PlayerData.accounts[i].money
            })
            ESX.PlayerData.accounts[i] = account
			break
        end
    end
end)

RegisterNetEvent("Interface:updateId", function(playerId)
    if (not playerId) then return end

    SendNUIMessage({
        type = "updateId",
        id = tostring(playerId),
    })
end)

GM:newThread(function()
    local interval = 1250
    while true do
        local ped = PlayerPedId()
        local weapon = GetSelectedPedWeapon(ped)
        if weapon ~= GetHashKey('WEAPON_UNARMED') then
            interval = 0
            if (GM.Admin.data["infinite_ammo_bool"] == true) then
                SetPedInfiniteAmmoClip(ped, true, weapon)
            else
                SetPedInfiniteAmmoClip(ped, false, weapon)
            end
            if (GM.Interface.Weapons[weapon] ~= nil) then
                local boolean, maxAmmo = GetMaxAmmo(ped, weapon)
                SendNUIMessage({
                    type = "updateWeapon",
                    show = true,
                    icon = GM.Interface.Weapons[weapon],
                    ammo = {
                        GetAmmoInPedWeapon(ped, weapon), maxAmmo
                    },
                })
            end
        else
            interval = 1250
            SendNUIMessage({
                type = "updateWeapon",
                show = false,
            })
        end
        Wait(interval)
    end
end)

AddEventHandler("gameEventTriggered", function(eventName, eventArguments)
    if eventName == 'CEventNetworkPlayerEnteredVehicle' then 
        local entityId = eventArguments[2]
        if DoesEntityExist(entityId) then 
			while GetVehiclePedIsIn(PlayerPedId(), false) == entityId do 
				Wait(0)
				local playerPed = PlayerPedId()
				local playerVehicle = GetVehiclePedIsIn(playerPed, false)
				local vehicleSeat = GetPedInVehicleSeat(playerVehicle, -1)

				if(playerVehicle ~= 0 ) and (not IsPauseMenuActive()) and vehicleSeat == playerPed then
                    HideHudComponentThisFrame(7)
                    HideHudComponentThisFrame(9)
                    local doors = GetVehicleDoorLockStatus(playerVehicle)
                    if (doors == 1) then
                        doors = true
                    else
                        doors = false
                    end
                    local _, feuPosition, feuRoute = GetVehicleLightsState(playerVehicle)
                    if (feuPosition == 0 and feuRoute == 0) then
                        currentLights = false
                    elseif (feuPosition == 1) then
                        currentLights = true
                    elseif (feuRoute == 1) then
                        currentLights = true
                    end
                    SendNUIMessage({
                        type = "updateVehicle",
                        show = true,
                        speed = math.floor(GetEntitySpeed(playerVehicle) * 3.6 + 0.5),
                        gear = GetVehicleCurrentGear(playerVehicle),
                        rpm = GetVehicleCurrentRpm(playerVehicle),
                        fuel = GetVehicleFuelLevel(playerVehicle),
                        doors = doors,
                        engine = GetIsVehicleEngineRunning(playerVehicle),
                        light = currentLights,
                    })
				else
                    SendNUIMessage({
                        type = "hideVehicle",
                    })
				end
			end
            SendNUIMessage({
                type = "hideVehicle",
            })
		end
	end
end)

RegisterNetEvent("Interface:safeZone")
AddEventHandler("Interface:safeZone", function(boolean)
    SendNUIMessage({
        type = "updateSafeZone",
        show = boolean,
    })
end)

RegisterNetEvent("Interface:admin")
AddEventHandler("Interface:admin", function(admin)
    if (not admin) then return end

    SendNUIMessage(admin)
end)

RegisterNetEvent("Interface:currentReportCount")
AddEventHandler("Interface:currentReportCount", function(report)
    if (not report) then return end

    SendNUIMessage({
        type = "updateCurrentReports",
        currentReports = report,
    })
end)

RegisterNetEvent("Interface:totalReportCount")
AddEventHandler("Interface:totalReportCount", function(report)
    if (not report) then return end

    SendNUIMessage({
        type = "updateTotalReports",
        totalReports = report,
    })
end)

RegisterNetEvent("Interface:noclip")
AddEventHandler("Interface:noclip", function(noclip)
    if (not noclip) then return end

    SendNUIMessage(noclip)
end)

RegisterNetEvent("Interface:announce")
AddEventHandler("Interface:announce", function(announce)
    if (not announce) then return end

    SendNUIMessage(announce)
    

    Wait(7000)

    SendNUIMessage({
        type = "updateAnnounce",
        show = false,
        text = ""
    })
end)

RegisterNetEvent("Interface:slots")
AddEventHandler("Interface:slots", function(slots)
    SendNUIMessage({
        type = "updateSlots",
        slots = slots
    })
end)

RegisterNetEvent("Interface:chat")
AddEventHandler("Interface:chat", function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "toogleChat",
        showInput = true,
    })
end)

RegisterCommand("new_chat", function()
    TriggerEvent("Interface:chat")
end)