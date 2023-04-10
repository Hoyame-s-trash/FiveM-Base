local Vehicles = {}

function Vehicles:openTrunk()
    local localPlayer = PlayerPedId()
    local x, y, z = table.unpack(GetEntityCoords(localPlayer))
    local closestVehicle = GetClosestVehicle(x, y, z, 3.0, 0, 71)

    if DoesEntityExist(closestVehicle) and IsEntityAVehicle(closestVehicle) then
        local lockStatus = GetVehicleDoorLockStatus(closestVehicle)
        if lockStatus == 1 then
            TriggerServerEvent("avp_inv:OPEN_VEHICLE_TRUNK_INVENTORY",
                GetVehicleNumberPlateText(closestVehicle),
                GetEntityModel(closestVehicle)
            )
        end
    end
end

function Vehicles:openGlovebox()
    local localPlayer = PlayerPedId()
    if IsPedInAnyVehicle(localPlayer, false) then
        local vehicle = GetVehiclePedIsIn(localPlayer, false)
        if DoesEntityExist(vehicle) then
            TriggerServerEvent("avp_inv:OPEN_VEHICLE_GLOVEBOX_INVENTORY",
                GetVehicleNumberPlateText(vehicle),
                GetEntityModel(vehicle)
            )
        end
    end
end

AddEventHandler("avp_inv:onInventoryOpen", function()
    Vehicles:openGlovebox()
    Vehicles:openTrunk()
end)
