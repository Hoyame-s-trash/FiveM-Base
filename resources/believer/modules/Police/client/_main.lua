GM.Police.garage = {
    menu = {
        submenus = {}
    },
    data = {},
}

GM.Police.garage.menu.main = RageUI.CreateMenu("", "Garage Police", 0, 0, "banner", "bluestark")
GM.Police.garage.menu.main["Closed"] = function()
end

GM.Police.garage.menu.submenus["players_vehicles"] = RageUI.CreateSubMenu(GM.Police.garage.menu.main, "", "Véhicules personnels")

GM.Police.garage.menu.submenus["unmark_vehicles"] = RageUI.CreateSubMenu(GM.Police.garage.menu.main, "", "Véhicules banalisées")

GM.Police.garage.menu.main:isVisible(function(Items)
    Items:Button("Véhicules personnels", nil, {}, true,{
        onSelected = function()
            -- Todo event for request player vehicle like garage
        end
    }, GM.Police.garage.menu.submenus["players_vehicles"])
    Items:Button("Banalisées", nil, {}, true, {}, GM.Police.garage.menu.submenus["unmark_vehicles"])
    if (GM.Police.garage.data["garageVehicle"] ~= nil and GM.Police.garage.data["garageVehicle"]["all"]) then
        for i = 1, #GM.Police.garage.data["garageVehicle"]["all"] do
            Items:Button(GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(GM.Police.garage.data["garageVehicle"]["all"][i]))), nil, {}, true, {
                onSelected = function()
                    if (GM.Police.garage.data["garagePosition"] ~= nil) then
                        local foundPosition = false
                        for i = 1, #GM.Police.garage.data["garagePosition"] do
                            if (not foundPosition) then
                                if (ESX.Game.IsSpawnPointClear(GM.Police.garage.data["garagePosition"][i], 3.0)) then
                                    foundPosition = true
                                    TriggerServerEvent("Police:spawnVehicle", GM.Police.garage.data["garageVehicle"]["all"][i], GM.Police.garage.data["garagePosition"][i])
                                    GM.Police.garage.menu.main:close()
                                end
                            end
                        end
                        if (not foundPosition) then
                            ESX.ShowNotification("~r~Aucun emplacement disponible pour sortir le véhicule !")
                        end
                    end
                end
            })
        end
    end
end)

GM.Police.garage.menu.submenus["players_vehicles"]:isVisible(function(Items)
    if (GM.Police.garage.data["playerVehicles"] ~= nil) then
    end
end)

GM.Police.garage.menu.submenus["unmark_vehicles"]:isVisible(function(Items)
    if (GM.Police.garage.data["garageVehicle"] ~= nil and GM.Police.garage.data["garageVehicle"]["unmarked"]) then
        for i = 1, #GM.Police.garage.data["garageVehicle"]["unmarked"] do
            Items:Button(GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(GM.Police.garage.data["garageVehicle"]["unmarked"][i]))), nil, {}, true, {
                onSelected = function()
                    if (GM.Police.garage.data["garagePosition"] ~= nil) then
                        local foundPosition = false
                        for i = 1, #GM.Police.garage.data["garagePosition"] do
                            if (not foundPosition) then
                                if (ESX.Game.IsSpawnPointClear(GM.Police.garage.data["garagePosition"][i], 3.0)) then
                                    foundPosition = true
                                    TriggerServerEvent("Police:spawnVehicle", GM.Police.garage.data["garageVehicle"]["unmarked"][i], GM.Police.garage.data["garagePosition"][i])
                                    GM.Police.garage.menu.main:close()
                                end
                            end
                        end
                        if (not foundPosition) then
                            ESX.ShowNotification("~r~Aucun emplacement disponible pour sortir le véhicule !")
                        end
                    end
                end
            })
        end
    end
end)

RegisterNetEvent("Police:openGarage", function(garageData)
    GM.Police.garage.data["garageId"] = garageData.garageId

    GM.Police.garage.data["garageVehicle"] = garageData.garageVehicle

    GM.Police.garage.data["garagePosition"] = garageData.garagePosition

    GM.Police.garage.menu.main:toggle()
end)