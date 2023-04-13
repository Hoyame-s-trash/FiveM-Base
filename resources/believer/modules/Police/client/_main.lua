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
                    local vehicleName = GM.Police.garage.data["garageVehicle"]["all"][i]
                    if (vehicleName ~= nil) then
                        if (GM.Police.garage.data["garagePosition"] ~= nil) then
                            local foundPosition = false
                            for i = 1, #GM.Police.garage.data["garagePosition"] do
                                if (not foundPosition) then
                                    if (ESX.Game.IsSpawnPointClear(GM.Police.garage.data["garagePosition"][i], 3.0)) then
                                        foundPosition = true
                                        TriggerServerEvent("Police:spawnVehicle", vehicleName, GM.Police.garage.data["garagePosition"][i])
                                        GM.Police.garage.menu.main:close()
                                    end
                                end
                            end
                            if (not foundPosition) then
                                ESX.ShowNotification("~r~Aucun emplacement disponible pour sortir le véhicule !")
                            end
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
                    local vehicleName = GM.Police.garage.data["garageVehicle"]["unmarked"][i]
                    if (vehicleName ~= nil) then
                        if (GM.Police.garage.data["garagePosition"] ~= nil) then
                            local foundPosition = false
                            for i = 1, #GM.Police.garage.data["garagePosition"] do
                                if (not foundPosition) then
                                    if (ESX.Game.IsSpawnPointClear(GM.Police.garage.data["garagePosition"][i], 3.0)) then
                                        foundPosition = true
                                        TriggerServerEvent("Police:spawnVehicle", vehicleName, GM.Police.garage.data["garagePosition"][i])
                                        GM.Police.garage.menu.main:close()
                                    end
                                end
                            end
                            if (not foundPosition) then
                                ESX.ShowNotification("~r~Aucun emplacement disponible pour sortir le véhicule !")
                            end
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

GM.Police.wardrobe = {
    menu = {
        submenus = {}
    },
    data = {}
}

GM.Police.wardrobe.menu.main = RageUI.CreateMenu("", "Vestiaire police", 0, 0, "banner", "bluestark")
GM.Police.wardrobe.menu.main["Closed"] = function()
end

GM.Police.wardrobe.menu.main:isVisible(function(Items)
    Items:Button("Retirer ma tenue de service", nil, {}, true,{
        onSelected = function()
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                TriggerEvent('skinchanger:loadSkin', skin)
                TriggerServerEvent("Service:interact")
            end)
        end
    })
    if (GM.Police.wardrobe.data["outfits"] ~= nil) then
        for i = 1, #GM.Police.wardrobe.data["outfits"] do
            if (ESX.PlayerData.job.grade >= GM.Police.wardrobe.data["outfits"][i].grade) then
                Items:Button(GM.Police.wardrobe.data["outfits"][i].name, nil, {}, true, {
                    onSelected = function()
                        local forEquip
    
                        if (GetEntityModel(PlayerPedId()) == GetHashKey("mp_m_freemode_01")) then
                            forEquip = GM.Police.wardrobe.data["outfits"][i].male
                        elseif (GetEntityModel(PlayerPedId()) == GetHashKey("mp_f_freemode_01")) then
                            forEquip = GM.Police.wardrobe.data["outfits"][i].female
                        else
                            return
                        end
    
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerEvent('skinchanger:loadClothes', skin, forEquip)
                        end)
                    end
                })
            end
        end
    end
end)

RegisterNetEvent("Police:openWardrobe", function(wardrobeData)
    GM.Police.wardrobe.data["outfits"] = wardrobeData.outfits

    GM.Police.wardrobe.menu.main:toggle()
end)

GM.Police.armory = {
    menu = {
        submenus = {}
    },
    data = {}
}

GM.Police.armory.menu.main = RageUI.CreateMenu("", "Armurerie police", 0, 0, "banner", "bluestark")
GM.Police.armory.menu.main["Closed"] = function()
end

GM.Police.armory.menu.main:isVisible(function(Items)
    Items:Button("~r~Rendre mon équipement", nil, {}, true,{
        onSelected = function()
            TriggerServerEvent("Police:armory:giveBackItems")
        end
    })
    Items:Button("~r~Rendre mes munitions", nil, {}, true,{
        onSelected = function()
            TriggerServerEvent("Police:armory:giveBackMunitions")
        end
    })
    if (GM.Police.armory.data["items"] ~= nil) then
        for i = 1, #GM.Police.armory.data["items"] do
            if (ESX.PlayerData.job.grade >= GM.Police.armory.data["items"][i].grade) then
                Items:Button(GM.Police.armory.data["items"][i].label, nil, {RightLabel = GM.Police.armory.data["items"][i].price or ""}, true, {
                    onSelected = function()
                        TriggerServerEvent("Police:armory:takeItem", GM.Police.armory.data["armoryId"], GM.Police.armory.data["items"][i].name)
                    end
                })
            end
        end
    end
end)

RegisterNetEvent("Police:openArmory", function(armoryData)
    GM.Police.armory.data["armoryId"] = armoryData.armoryId
    GM.Police.armory.data["items"] = armoryData.items
    

    GM.Police.armory.menu.main:toggle()
end)

GM.Police.job = {
    menu = {
        submenus = {}
    },
    data = {}
}

GM.Police.job.menu.main = RageUI.CreateMenu("", "Menu métier", 0, 0, "banner", "bluestark")
GM.Police.job.menu.main["Closed"] = function()
end

GM.Police.job.menu.submenus["backup"] = RageUI.CreateSubMenu(GM.Police.job.menu.main, "", "Renforts")

GM.Police.job.menu.main:isVisible(function(Items)
    Items:Button("Historique des appels", nil, {}, true,{
        onSelected = function()
            TriggerServerEvent("Police:menu:requestCalls")
        end
    })
    Items:Button("Status agent", nil, {}, true,{
        onSelected = function()
            TriggerServerEvent("Police:menu:requestCalls")
        end
    })
    Items:Button("Objets", nil, {}, true,{
        onSelected = function()
            TriggerServerEvent("Police:menu:requestCalls")
        end
    })
    Items:Button("Recherche plaque", nil, {}, true,{
        onSelected = function()
            TriggerServerEvent("Police:menu:requestCalls")
        end
    })
    Items:Button("Interaction citoyen", nil, {}, true,{
        onSelected = function()
            TriggerServerEvent("Police:menu:requestCalls")
        end
    })
    Items:Button("~r~Démissionner", nil, {}, true,{
        onSelected = function()
            TriggerServerEvent("Police:menu:requestCalls")
        end
    })
    Items:Button("Renforts", nil, {}, true,{}, GM.Police.job.menu.submenus["backup"])
end)

GM.Police.job.menu.submenus["backup"]:isVisible(function(Items)
    if (GM.Police.Menu.backup ~= nil) then
        for i = 1, #GM.Police.Menu.backup do
            if (ESX.PlayerData.job.grade >= GM.Police.Menu.backup[i].grade) then
                Items:Button(GM.Police.Menu.backup[i].label, nil, {}, true, {
                    onSelected = function()
                        TriggerServerEvent("Police:menu:backup", GM.Police.Menu.backup[i].name)
                    end
                })
            end
        end
    end
end)

RegisterNetEvent("Police:openMenu", function()
    GM.Police.job.menu.main:toggle()
end)