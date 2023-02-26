-- Locals

ESX = exports['believer']:getSharedObject()

local talkingStage = 1

local seatbeltOn = false
local hideHud = false
local drink,food = 0,0
local enableField = false
local FuelLevel = 65
local blacklistedStrings = {"<", ">", "http", "https", ".png", ".mp4", ".mp3", ".mov", ".webm"}
local antiSpam = false
local isFunk = false

function toggleField(enable)
    enableField = enable
    if enable then
        SendNUIMessage({
            action = 'open',
        })
    else
        SendNUIMessage({
            type= "ui",
            action = 'close',
        })
    end
end

RegisterNetEvent("pma-voice:setTalkingMode")
AddEventHandler("pma-voice:setTalkingMode", function(mode)
    talkingStage = mode

    SendNUIMessage({
        action = 'updateVoiceLevel', 
        TalkingStage = talkingStage,
    })
end)


function HideHudComponent()
    HideHudComponentThisFrame(1)  -- Wanted Stars
    HideHudComponentThisFrame(2)  -- Weapon Icon
    HideHudComponentThisFrame(3)  -- Cash
    HideHudComponentThisFrame(4)  -- MP Cash
    HideHudComponentThisFrame(6)  -- Vehicle Name
    HideHudComponentThisFrame(7)  -- Area Name
    HideHudComponentThisFrame(8)  -- Vehicle Class
    HideHudComponentThisFrame(9)  -- Street Name
    HideHudComponentThisFrame(13) -- Cash Change
    HideHudComponentThisFrame(17) -- Save Game
    HideHudComponentThisFrame(20) -- Weapon Stats
end

Citizen.CreateThread(function()
    while not NetworkIsSessionStarted() do 
        Citizen.Wait(0)
    end

    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    Citizen.Wait(1000)
    
    local playerData = ESX.GetPlayerData()
    
    SendNUIMessage({
        action = "setMoney",
        data = playerData.money
    })

    for _, account in pairs(playerData.accounts) do 
        if Config.Money.bank then
            if account.name == "bank"then
                SendNUIMessage({
                    action = "setBank",
                    data = account.money,
                })
            end
        else
            if account.name == "black_money"then
                SendNUIMessage({
                    action = "setBank",
                    data = account.money,
                })
            end
        end
    end    
end)

CreateThread(function()
    while true do
        if NetworkIsPlayerTalking(PlayerId()) then
            SendNUIMessage({
                action = "updateMicrophone",
                microphone = 1
            })
        else
            SendNUIMessage({
                action = "updateMicrophone",
                microphone = 0
            })
        end
        Wait(125)
    end
end)

Citizen.CreateThread(function()
    local sleep = 0

	while true do
		Citizen.Wait(sleep)
		if IsPauseMenuActive() then -- ESC Key
            toggleField(false)
            sleep = 1500
		else
            toggleField(true)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        HideHudComponent()
	end
end)

Citizen.CreateThread(function()
    while true do
        TriggerEvent('esx_status:getStatus', 'hunger', function(hunger)
            TriggerEvent('esx_status:getStatus', 'thirst', function(thirst)
                drink = thirst.getPercent()
                food = hunger.getPercent()
            end)
        end)

        SendNUIMessage({
            action = 'customBars',
            type = Config.FoodBars.bars,
            DataPosition = Config.FoodBars.DataPosition,
            foodInt = food, 
            drinkInt = drink,
        })
        Citizen.Wait(5000)
    end
end)

Citizen.CreateThread(function()
    local sleep = 500
	while true do
		Citizen.Wait(sleep)
        local player = PlayerPedId()
        if IsPedArmed(player, 6) then
            sleep = 250
            local weapon = GetSelectedPedWeapon(player)
            local ammoTotal = GetAmmoInPedWeapon(player,weapon)
            local bool,ammoClip = GetAmmoInClip(player,weapon)
            local ammoRemaining = math.floor(ammoTotal - ammoClip)

            SendNUIMessage({
                action = 'WeaponEquiped',
                type = 'waffe',
                isActive = IsPedArmed(player, 6),
                ammoClip = ammoClip,
                ammoRemaining = ammoRemaining
            })
        else
            SendNUIMessage({action = 'WeaponEquiped'})
            sleep = 1000
        end
    end
end)

Citizen.CreateThread(function()    
    while true do 
        Citizen.Wait(2500)

        local player = PlayerPedId()
        local playerPos = GetEntityCoords(player, true)
        local bool, streetName = GetStreetNameAtCoord(playerPos, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
        local street = GetStreetNameFromHashKey(streetName);
		local zone = GetNameOfZone(playerPos.x, playerPos.y, playerPos.z)

        SendNUIMessage({
            action = 'setPosition',
            street = street,
            zone = GetLabelText(zone),
        })

        -- Money
        local playerData = ESX.GetPlayerData()
        for _, account in pairs(playerData.accounts) do 
            if account.name == "money" then
                SendNUIMessage({
                    action = "setMoney",
                    data = account.money,
                })
            end
            if account.name == "bank"then
                SendNUIMessage({
                    action = "setBank",
                    data = account.money,
                })
            end
            if account.name == "black_money"then
                SendNUIMessage({
                    action = "setBlackMoney",
                    data = account.money,
                })
            end
        end
    end
end)

Citizen.CreateThread(function()
    local sleep = 1500

    while true do
        Citizen.Wait(sleep)
        
        local player = PlayerPedId()
        local vehicle = GetVehiclePedIsUsing(player)
        local inVeh = IsPedInAnyVehicle(player, false)

        if inVeh then
            local FuelLevel = GetVehicleFuelLevel(vehicle)
            local MaxFuelLevel = Citizen.InvokeNative(0x642FC12F, vehicle, 'CHandlingData', 'fPetrolTankVolume', Citizen.ReturnResultAnyway(), Citizen.ResultAsFloat())
            local retval, lightsOn, highbeamsOn = GetVehicleLightsState(vehicle)
            local lockStatus = GetVehicleDoorLockStatus(vehicle)
    
            sleep = 100

            SendNUIMessage({
                action = "setSpeed",
                speed = math.floor(GetEntitySpeed(vehicle)*3.6),
                maxkmh = GetVehicleEstimatedMaxSpeed(vehicle) * 5.2
            })


            SendNUIMessage({
                action = "setVehFuel",
                fuel = math.ceil(FuelLevel),
                max = MaxFuelLevel
            })
            
            local locked = false

            if lockStatus == 1 or lockStatus == 0 then
                locked = false
            elseif lockStatus == 2 then
                locked = true
            end

            SendNUIMessage({
                action = "setVehStates",
                locked = locked,
                light = highbeamsOn,
                seatbelt = seatbeltOn,
                engine = GetIsVehicleEngineRunning(vehicle), 
            })
        else
            sleep = 1000
        end

        SendNUIMessage({
            action = "setInVeh",
            state = inVeh, 
        })
    end
end)

-- Events

AddEventHandler('esx:onPlayerSpawn', function()
    SendNUIMessage({
        action = "setidentifier",
        data = GetPlayerServerId(PlayerId())
    })
    SendNUIMessage({
        action = "servername",
        ServerName = Config.ServerName
    })
    toggleField(true)
end)



if not IsDuplicityVersion() then -- Only register this event for the client
    AddEventHandler('esx:setPlayerData', function(key, val, last)
        if GetInvokingResource() == 'believer' then
            ESX.PlayerData[key] = val
            if OnPlayerData then
                OnPlayerData(key, val, last)
            end
        end
    end)

    RegisterNetEvent('esx:playerLoaded', function(xPlayer)
        ESX.PlayerData = xPlayer
        ESX.PlayerLoaded = true
    end)

    RegisterNetEvent('esx:onPlayerLogout', function()
        ESX.PlayerLoaded = false
        ESX.PlayerData = {}
    end)
end

RegisterNetEvent('pma-voice:setTalkingOnRadio', function(plySource, enabled)
    if(enabled)then
        isFunk = 2;
    else
        isFunk = 1;
    end
end)

RegisterNetEvent('hud:hide')
AddEventHandler('hud:hide', function(parameter) -- true or false
    toggleField(false)
end)

RegisterNetEvent('hud:updateplayers')
AddEventHandler('hud:updateplayers', function(players, maxPlayers)    
    SendNUIMessage({
        action = "setplayers",
        players = players,
        maxPlayers = maxPlayers
    })
end)

RegisterNetEvent('txAdmin:receiveAnnounce', function(message, author)
    TriggerEvent('hud:notification', 'announce', 'Announce ', message, 12500)
end)

RegisterKeyMapping('seatbelt', 'Seat Belt', 'keyboard', 'B')

RegisterCommand('seatbelt', function()
    local player = PlayerPedId()
    local veh = GetVehiclePedIsIn(player, false)
    local vehicleCategories = GetVehicleClass(veh)
    local class = GetVehicleClass(GetVehiclePedIsIn(player))
    if IsPedInAnyVehicle(player) then
        if antiSpam == false then
            if vehicleCategories ~= 8 and vehicleCategories ~= 13 and vehicleCategories ~= 8 then
                seatbeltOn = not seatbeltOn
                if seatbeltOn then
                    TriggerEvent('hud:notification','info', 'info', Config.Locales["SeatBelt On"], 4500)
                    SetFlyThroughWindscreenParams(10000.0, 10000.0, 17.0, 500.0);
                    while seatbeltOn do
                        DisableControlAction(0, 75, true) -- Disable exit vehicle when stop
                        DisableControlAction(27, 75, true) -- Disable exit vehicle when Driving
                        Citizen.Wait(10)
                    end
                    antiSpam = true
                    Wait(2000)
                    antiSpam = false
                else
                    TriggerEvent('hud:notification','error', 'ERROR', Config.Locales["SeatBelt Off"], 4500)

                    SetFlyThroughWindscreenParams(16.0, 19.0, 17.0, 2000.0)
                    SetPedConfigFlag(player, 32, true)
                    seatbeltOn = false
                    antiSpam = true
                    Wait(2000)
                    antiSpam = false
                end
            end
        end
    end
end)