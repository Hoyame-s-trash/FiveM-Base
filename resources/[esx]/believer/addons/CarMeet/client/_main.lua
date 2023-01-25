GM.Carmeet = GM.Carmeet or {}

local FlatBed = nil
local CarOnFlatBed = nil
local IsInCarMeet = false
local CarMeetCoords = {}
local vehicleNotLoaded = false


GM:newThread(function()
    ESX.Game.SpawnObject(`enseigne_bennys`, vector3(-2171.395, 1161.033, -23.0), function(entityBennys)
        SetEntityRotation(entityBennys, 90.0, 0.0, 0.0)
        SetEntityCollision(entityBennys, true, true)
        FreezeEntityPosition(entityBennys, true)
    end, false)

    ESX.Game.SpawnObject(`enseigne_autoexotic`, vector3(-2161.785, 1161.177, -23.5), function(entityExotic)
        SetEntityRotation(entityExotic, 90.0, 0.0, 0.0)
        SetEntityCollision(entityExotic, true, true)
        FreezeEntityPosition(entityExotic, true)
    end, false)

    ESX.Game.SpawnObject(`enseigne_lscustom`, vector3(-2150.3757, 1161.041, -23.5), function(entityLsCustom)
        SetEntityRotation(entityLsCustom, 90.0, 0.0, 0.0)
        SetEntityCollision(entityLsCustom, true, true)
        FreezeEntityPosition(entityLsCustom, true)
    end, false)
end)

GM:newThread(function()
    while true do
		Citizen.Wait(2000)
        local playerPed = PlayerPedId()
        local interiorId = GetInteriorFromEntity(playerPed)
		IsInCarMeet = interiorId == 286209 or interiorId == 285697

		if IsInCarMeet then
			if vehicleNotLoaded == false then
                vehicleNotLoaded = true
                ESX.Game.SpawnLocalVehicle(GM.Carmeet.FlatBedCarModel, GM.Carmeet.FlatBedCoords, 127.97, function(flatbedEntity)
                    FreezeEntityPosition(flatbedEntity, true)
                    SetVehicleUndriveable(flatbedEntity, true)
                    SetVehicleDoorsLocked(flatbedEntity, 2)
                    ESX.Game.SetVehicleProperties(flatbedEntity, json.decode(GM.Carmeet.FlatBedProperties))
                end)

                --Exposition cars
                for _, car in pairs(GM.Carmeet.ExpositionCars) do
                    ESX.Game.SpawnLocalVehicle(car.Car, car.Coords, car.Heading, function(expositionEntity)
                        FreezeEntityPosition(expositionEntity, true)
                        SetVehicleUndriveable(expositionEntity, true)
                        ESX.Game.SetVehicleProperties(expositionEntity, json.decode(car.Properties))
                        SetVehicleLights(expositionEntity, 2)
                        SetVehicleDoorsLocked(expositionEntity, 2)
                    end)
                end
			end
		end
	end
end)