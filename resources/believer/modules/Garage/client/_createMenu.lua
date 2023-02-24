GM.Garage = GM.Garage or {}

GM.Garage = {
    menu = {
        submenus = {}
    },
    data = {
        garage = {},
    },
}

GM.Garage.menu.main = RageUI.CreateMenu("", "Gestion des garages", 0, 0, "banner", "bluestark")
GM.Garage.menu.main["Closed"] = function()
    -- Todo event when menu closed
end

GM.Garage.menu.submenus["garage_create"] = RageUI.CreateSubMenu(GM.Garage.menu.main, "", "Garage - Create")
GM.Garage.menu.submenus["garage_list"] = RageUI.CreateSubMenu(GM.Garage.menu.main, "", "Garage - List")

GM.Garage.menu.submenus["garage_list_management"] = RageUI.CreateSubMenu(GM.Garage.menu.submenus["garage_list"], "", "Garage - Management")

GM.Garage.menu.main:isVisible(function(Items)
    Items:Button("Créer un garage", nil, {}, true,{}, GM.Garage.menu.submenus["garage_create"])
    Items:Button("Gérer les garages", nil, {}, true,{
        onSelected = function()
            TriggerServerEvent("Garage:requestGarage")
        end
    }, GM.Garage.menu.submenus["garage_list"])
end)

GM.Garage.menu.submenus["garage_create"]:isVisible(function(Items)
    Items:Button("Nom", nil, {RightLabel = GM.Garage.data["createdName"]}, true,{
        onSelected = function()
            local input = exports["input"]:openInput({
                label = "Attribuer un nom",
                submitLabel = "ENREGISTRER",
                placeHolders = {
                    {label = "NOM"},
                }
            })

            GM.Garage.data["createdName"] = input["0"]
        end
    })
    Items:Button("Label", nil, {RightLabel = GM.Garage.data["createdLabel"]}, true,{
        onSelected = function()
            local input = exports["input"]:openInput({
                label = "Attribuer un label",
                submitLabel = "ENREGISTRER",
                placeHolders = {
                    {label = "LABEL"},
                }
            })

            GM.Garage.data["createdLabel"] = input["0"]
        end
    })
    Items:Button("Position du menu", nil, {RightLabel = GM.Garage.data["createdmenuPosition"]}, true,{
        onSelected = function()
            GM.Garage.data["createdmenuPosition"] = GetEntityCoords(PlayerPedId())
        end
    })
    Items:Button("Position du spawn", nil, {RightLabel = GM.Garage.data["createdspawnPosition"]}, true,{
        onSelected = function()
            GM.Garage.data["createdspawnPosition"] = GetEntityCoords(PlayerPedId())
        end
    })
    Items:Button("Heading du spawn", nil, {RightLabel = GM.Garage.data["createdspawnHeading"]}, true,{
        onSelected = function()
            GM.Garage.data["createdspawnHeading"] = GetEntityHeading(PlayerPedId())
        end
    })
    Items:Button("Position du rangement", nil, {RightLabel = GM.Garage.data["createddeletePosition"]}, true,{
        onSelected = function()
            GM.Garage.data["createddeletePosition"] = GetEntityCoords(PlayerPedId())
        end
    })
    Items:Button("Créer le garage", nil, {}, GM.Garage.data["createdName"] ~= nil and GM.Garage.data["createdLabel"] ~= nil and GM.Garage.data["createdmenuPosition"] ~= nil and GM.Garage.data["createdspawnPosition"] ~= nil and GM.Garage.data["createdspawnHeading"] ~= nil and GM.Garage.data["createddeletePosition"] ~= nil,{
        onSelected = function()
            local garageData = {
                name = GM.Garage.data["createdName"],
                label = GM.Garage.data["createdLabel"],
                menuPosition = GM.Garage.data["createdmenuPosition"],
                spawnPosition = GM.Garage.data["createdspawnPosition"],
                spawnHeading = GM.Garage.data["createdspawnHeading"],
                deletePosition = GM.Garage.data["createddeletePosition"],
            }

            TriggerServerEvent("Garage:createGarage", garageData)
        end
    })
end)

GM.Garage.menu.submenus["garage_list"]:isVisible(function(Items)
    for garageId, garage in pairs(GM.Garage.data["garage"]) do
        Items:Button(garage.name.." - "..garage.label, nil, {}, true,{
            onSelected = function()
                GM.Garage.data["selectedGarage"] = garageId
            end
        }, GM.Garage.menu.submenus["garage_list_management"])
    end
end)

GM.Garage.menu.submenus["garage_list_management"]:isVisible(function(Items)
    if (GM.Garage.data["selectedGarage"] ~= nil and GM.Garage.data["garage"][GM.Garage.data["selectedGarage"]] ~= nil) then
        Items:Button("~r~Supprimer le garage", nil, {}, true,{
            onSelected = function()
                local input = exports["input"]:openInput({
                    label = "Confirmer la suppression",
                    submitLabel = "SUPPRIMER",
                    placeHolders = {
                        {label = "OUI/NON"},
                    }
                })

                if (input["0"] == nil) then
                    ESX.ShowNotification("~r~Vous devez répondre par OUI ou NON.")
                    return
                end
    
                if (input["0"] == "OUI") then
                    TriggerServerEvent("Garage:deleteGarage", GM.Garage.data["selectedGarage"], input["0"])
                end
            end
        })
    end
end)


RegisterNetEvent("Garage:updateValue", function(GARAGE_DATA, GARAGE_KEY, GARAGE_VALUE)
    if (not GARAGE_VALUE) then
        GM.Garage.data[GARAGE_DATA] = GARAGE_KEY
    else
        GM.Garage.data[GARAGE_DATA][GARAGE_KEY] = GARAGE_VALUE
    end
end)

RegisterNetEvent("Garage:removeValue", function(GARAGE_DATA, GARAGE_KEY)
    if (not GARAGE_KEY) then
        GM.Garage.data[GARAGE_DATA] = nil
    else
        GM.Garage.data[GARAGE_DATA][GARAGE_KEY] = nil
    end
end)

RegisterNetEvent("Garage:openMenu", function()
    GM.Garage.menu.main:toggle()
end)