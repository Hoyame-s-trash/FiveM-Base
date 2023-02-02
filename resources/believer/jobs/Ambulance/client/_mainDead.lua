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
            timer = 5 * minute
        else
            timer = 10 * minute
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
        timer = 5 * minute
    else
        timer = 10 * minute
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
                if (not GM.Ambulance.VipUse) then
                    text = "Réanimation par un médecin (VIP)"
                    if IsControlPressed(0, 51) then
                        GM.Ambulance.VipUse = true
                        TriggerServerEvent("Ambulance:revivePlayerVip")
                        SetTimeout(30*60000, function()
                            GM.Ambulance.VipUse = false
                        end)
                        break
                    end
                else
                    text = "Vous serez automatiquement transporté à l\"hôpital dans ~b~"..minutes.." minutes "..seconds.." secondes~s~"
                end
            else
                text = "Vous serez automatiquement transporté à l\"hôpital dans ~b~"..minutes.." minutes "..seconds.." secondes~s~"
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

RegisterNetEvent("Ambulance:reviveVip", function()
    NeedNPCEMS()
end)

function NeedNPCEMS()
	local vehhash = GetHashKey("ambulance")                                                     
	local loc = GetEntityCoords(PlayerPedId())
	RequestModel(vehhash)
	while not HasModelLoaded(vehhash) do
		Wait(1)
	end
	RequestModel('s_m_m_doctor_01')
	while not HasModelLoaded('s_m_m_doctor_01') do
		Wait(1)
	end
	local spawnRadius = 40                                                    
    local found, spawnPos, spawnHeading = GetClosestVehicleNodeWithHeading(loc.x + math.random(-spawnRadius, spawnRadius), loc.y + math.random(-spawnRadius, spawnRadius), loc.z, 0, 3, 0)

	if not DoesEntityExist(vehhash) then
        mechVeh = CreateVehicle(vehhash, spawnPos, spawnHeading, false, false)                        
        ClearAreaOfVehicles(GetEntityCoords(mechVeh), 5000, false, false, false, false, false);  
        SetVehicleOnGroundProperly(mechVeh)
		SetVehicleNumberPlateText(mechVeh, "VIP")
		SetEntityAsMissionEntity(mechVeh, true, true)
		SetVehicleEngineOn(mechVeh, true, true, false)
		SetVehicleSiren(mechVeh, true)
        
        mechPed = CreatePedInsideVehicle(mechVeh, 26, GetHashKey('s_m_m_doctor_01'), -1, false, false)              	
        
        mechBlip = AddBlipForEntity(mechVeh)
		SetBlipSprite(mechBlip, 489)
        SetBlipColour(mechBlip, 2)
		ShowFriendIndicatorOnBlip(mechBlip, true)
		BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("EMS pour VIP")
        EndTextCommandSetBlipName(mechBlip)                                                      	


		PlaySoundFrontend(-1, "Text_Arrive_Tone", "Phone_SoundSet_Default", 1)
		Wait(2000)
		TaskVehicleDriveToCoord(mechPed, mechVeh, loc.x, loc.y, loc.z, 20.0, 0, GetEntityModel(mechVeh), 524863, 2.0)
		veh = mechVeh
		doctor = mechPed
		Active = true
    end
end

local timer = 300
GM:newThread(function()
    while true do
      Citizen.Wait(200)
        if Active then
			timer = timer - 1
            local loc = GetEntityCoords(GetPlayerPed(-1))
			local lc = GetEntityCoords(veh)
			local ld = GetEntityCoords(doctor)
            local dist = Vdist(loc.x, loc.y, loc.z, lc.x, lc.y, lc.z)
			local dist1 = Vdist(loc.x, loc.y, loc.z, ld.x, ld.y, ld.z)
            if dist <= 10 then
				if Active then
					TaskGoToCoordAnyMeans(doctor, loc.x, loc.y, loc.z, 1.0, 0, 0, 786603, 0xbf800000)
				end
				if dist1 <= 1 then 
					Active = false
					ClearPedTasksImmediately(doctor)
					NeedNPCFast()
				end
            end
			if timer <= 0 then
				TriggerServerEvent("Ambulance:revivePlayerToHospital")
                Active = false
                break
			end
        end
    end
end)

function NeedNPCFast()
	RequestAnimDict("mini@cpr@char_a@cpr_str")
	while not HasAnimDictLoaded("mini@cpr@char_a@cpr_str") do
		Citizen.Wait(1000)
	end

	TaskPlayAnim(doctor, "mini@cpr@char_a@cpr_str","cpr_pumpchest",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
	ESX.ShowNotification("~b~Le médecin vous soigne ...")
    Wait(10000)
	ClearPedTasks(doctor)
	Citizen.Wait(500) 
	TriggerServerEvent("Ambulance:revivePlayerToHospital")
	DeleteEntity(doctor)
	DeleteEntity(veh)
end