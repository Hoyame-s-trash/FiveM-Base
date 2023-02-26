GM.Garage = GM.Garage or {}

GM.Garage = {
    menu = {
        submenus = {}
    },
    data = {
        vehicles = {},
        filter_list = {
            "Owned", "Job", "Orga", "Boutique"
        }
    },
}

GM.Garage.menu.main = RageUI.CreateMenu("", "Garage", 0, 0, "banner", "bluestark")
GM.Garage.menu.main["Closed"] = function()
    -- Todo event when menu closed
end

GM.Garage.menu.submenus["garage_vehicle_management"] = RageUI.CreateSubMenu(GM.Garage.menu.main, "", "Garage - Vehicle Management")

GM.Garage.menu.main:isVisible(function(Items)
    if (GM.Garage.data.filter_index == nil) then
        GM.Garage.data.filter_index = 1
    end
    if (GM.Garage.data["currentFilter"] == nil) then
        GM.Garage.data["currentFilter"] = GM.Garage.data.filter_list[GM.Garage.data.filter_index]
    end
    Items:List("Filtrer", GM.Garage.data.filter_list, GM.Garage.data.filter_index, nil, {}, true, {
        onListChange = function(Index, Item)
            GM.Garage.data.filter_index = Index
            GM.Garage.data["currentFilter"] = GM.Garage.data.filter_list[Index]
        end,
    })
    Items:Separator("")
    for vehicleId, vehicle in pairs(GM.Garage.data["vehicles"]) do
        if (GM.Garage.data["currentFilter"] == vehicle.type) then
            Items:Button(vehicle.label.." - ("..vehicle.plate..")", nil, {RightLabel = GetDisplayNameFromVehicleModel((vehicle.model))}, true, {
                onSelected = function()
                    GM.Garage.data["selectedVehicle"] = vehicleId
                end
            }, GM.Garage.menu.submenus["garage_vehicle_management"])
        end
    end
end)

GM.Garage.menu.submenus["garage_vehicle_management"]:isVisible(function(Items)
    if (GM.Garage.data["selectedVehicle"] ~= nil and GM.Garage.data["vehicles"][GM.Garage.data["selectedVehicle"]] ~= nil) then
        Items:Button("Renommer le véhicule", nil, {RightLabel = GM.Garage.data["vehicles"][GM.Garage.data["selectedVehicle"]].label}, true,{
            onSelected = function()
                local input = exports["input"]:openInput({
                    label = "Renommer le véhicule",
                    submitLabel = "RENOMMER",
                    placeHolders = {
                        {label = "NOM"},
                    }
                })

                if (input["0"] == nil) then
                    ESX.ShowNotification("~r~Vous devez entrer un nom.")
                    return
                end
    
                TriggerServerEvent("Garage:renameVehicle", GM.Garage.data["currentGarage"], GM.Garage.data["selectedVehicle"], input["0"])
            end
        })

        if (GM.Garage.data["vehicles"][GM.Garage.data["selectedVehicle"]].job == nil) then
            Items:Button("Attribuer le véhicule à son entreprise", nil, {}, true, {
                onSelected = function()
                    TriggerServerEvent("Garage:attribuateJob", GM.Garage.data["currentGarage"], GM.Garage.data["selectedVehicle"])
                end
            })
        else
            Items:Button("Retirer le véhicule de son entreprise", nil, {}, true, {
                onSelected = function()
                    TriggerServerEvent("Garage:removeJob", GM.Garage.data["currentGarage"], GM.Garage.data["selectedVehicle"])
                end
            })
        end
            
        Items:Button("Sortir le véhicule", nil, {}, GM.Garage.data["vehicles"][GM.Garage.data["selectedVehicle"]].stored ~= 0,{
            onSelected = function()
                if (ESX.Game.IsSpawnPointClear(GM.Garage.data["currentCoords"], 3.0)) then
                    ESX.Game.SpawnVehicle(GM.Garage.data["vehicles"][GM.Garage.data["selectedVehicle"]].model, GM.Garage.data["currentCoords"], GM.Garage.data["currentHeading"], function(vehicle)
                        ESX.Game.SetVehicleProperties(vehicle, GM.Garage.data["vehicles"][GM.Garage.data["selectedVehicle"]].properties)
                        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)

                        RageUI.CloseAll()

                        GM:newThread(function()
                            while (not DoesEntityExist(vehicle)) do
                                Wait(100)
                            end
                            TriggerServerEvent("Garage:exitVehicle", GM.Garage.data["currentGarage"], GM.Garage.data["selectedVehicle"], NetworkGetNetworkIdFromEntity(vehicle))
                        end)
                    end, true)
                else
                    ESX.ShowNotification("~r~Le point de spawn n'est pas libre.")
                end
            end
        })
    end
end)

RegisterNetEvent("Garage:UpdateValue", function(GARAGE_DATA, GARAGE_KEY, GARAGE_VALUE)
    if (not GARAGE_VALUE) then
        GM.Garage.data[GARAGE_DATA] = GARAGE_KEY
    else
        GM.Garage.data[GARAGE_DATA][GARAGE_KEY] = GARAGE_VALUE
    end
end)

RegisterNetEvent("Garage:RemoveValue", function(GARAGE_DATA, GARAGE_KEY)
    if (not GARAGE_KEY) then
        GM.Garage.data[GARAGE_DATA] = nil
    else
        GM.Garage.data[GARAGE_DATA][GARAGE_KEY] = nil
    end
end)

RegisterNetEvent("Garage:openMenuGarage", function(GARAGE_TYPE, GARAGE_COORDS, GARAGE_HEADING)
    GM.Garage.data["currentGarage"] = GARAGE_TYPE
    GM.Garage.data["currentCoords"] = GARAGE_COORDS
    GM.Garage.data["currentHeading"] = GARAGE_HEADING
    GM.Garage.menu.main:toggle()
end)

RegisterNetEvent("Garage:requestStore", function()
    local playerVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if (playerVehicle ~= nil and playerVehicle ~= 0) then
        local vehicleProps = ESX.Game.GetVehicleProperties(playerVehicle)
        TriggerServerEvent("Garage:storeVehicle", GM.Garage.data["currentGarage"], vehicleProps, NetworkGetNetworkIdFromEntity(playerVehicle))
    else
        ESX.ShowNotification("~r~Vous n'êtes pas dans un véhicule.")
    end
end)