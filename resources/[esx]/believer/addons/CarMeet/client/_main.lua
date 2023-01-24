GM.Carmeet = GM.Carmeet or {}

local FlatBed = nil
local CarOnFlatBed = nil
local IsInCarMeet = false
local CarMeetCoords = {}
local vehicleNotLoaded = false
CarMeetCoords.TeleportZones = {
    CarMeetEnter = {
        CheckJob  = false,
        Pos       = vector3(783.59, -1868.38, 28.26),
        Size      = vector3(5.0, 5.0, 0.2),
        Color     = {r = 239, g = 219, b = 91},
        Marker    = 1,
        Hint      = 'Appuyez sur ~INPUT_CONTEXT~ entrer dans le LS Car Meet',
        SpawnPoints = {
            { coords = vector3(-2184.9, 1077.94, -24.89), heading = 268.22, radius = 3.0 },
            { coords = vector3(-2184.85, 1073.51, -24.89), heading = 266.91, radius = 3.0 },
            { coords = vector3(-2195.03, 1073.52, -24.38), heading = 265.72, radius = 3.0 },
            { coords = vector3(-2194.75, 1078.3, -24.39), heading = 267.74, radius = 3.0 },
            { coords = vector3(-2206.1, 1073.56, -24.26), heading = 266.42, radius = 3.0 },
            { coords = vector3(-2205.27, 1078.07, -24.26), heading = 272.34, radius = 3.0 },
            { coords = vector3(-2213.66, 1082.67, -24.26), heading = 356.08, radius = 3.0 },
            { coords = vector3(-2206.02, 1083.98, -24.26), heading = 268.74, radius = 3.0 },
        },
        Callback = function()
            --LoadIPL()
        end
    },
    CarMeetExit  = {
        CheckJob  = false,
        Pos       = vector3(-2220.28, 1157.01, -24.24),
        Size      = vector3(5.0, 5.0, 0.2),
        Color     = {r = 239, g = 219, b = 91},
        Marker    = 1,
        Hint      = 'Appuyez sur ~INPUT_CONTEXT~ sortir du LS Car Meet',
        SpawnPoints = {
            { coords = vector3(788.63, -1845.12, 28.52), heading = 224.27, radius = 3.0 },
            { coords = vector3(789.75, -1838.88, 28.54), heading = 224.94, radius = 3.0 },
            { coords = vector3(790.89, -1833.14, 28.53), heading = 223.96, radius = 3.0 },
            { coords = vector3(792.02, -1827.25, 28.53), heading = 226.31, radius = 3.0 },
            { coords = vector3(793.46, -1822.16, 28.53), heading = 225.86, radius = 3.0 },
            { coords = vector3(794.69, -1816.69, 28.52), heading = 223.23, radius = 3.0 },
            { coords = vector3(795.46, -1810.51, 28.5),  heading = 224.74, radius = 3.0 },
        },
        Callback = function()
            --UnloadIPL()
        end
    },
}

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