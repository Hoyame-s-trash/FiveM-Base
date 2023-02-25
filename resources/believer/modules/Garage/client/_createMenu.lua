GM.Garage = GM.Garage or {}

GM.Garage.Management = {
    menu = {
        submenus = {}
    },
    data = {
        garage = {},
    },
}

GM.Garage.Management.menu.main = RageUI.CreateMenu("", "Gestion des garages", 0, 0, "banner", "bluestark")
GM.Garage.Management.menu.main["Closed"] = function()
    -- Todo event when menu closed
end

GM.Garage.Management.menu.submenus["garage_create"] = RageUI.CreateSubMenu(GM.Garage.Management.menu.main, "", "Garage - Create")
GM.Garage.Management.menu.submenus["garage_list"] = RageUI.CreateSubMenu(GM.Garage.Management.menu.main, "", "Garage - List")

GM.Garage.Management.menu.submenus["garage_list_management"] = RageUI.CreateSubMenu(GM.Garage.Management.menu.submenus["garage_list"], "", "Garage - Management")

GM.Garage.Management.menu.main:isVisible(function(Items)
    Items:Button("Créer un garage", nil, {}, true,{}, GM.Garage.Management.menu.submenus["garage_create"])
    Items:Button("Gérer les garages", nil, {}, true,{
        onSelected = function()
            TriggerServerEvent("Garage:requestGarage")
        end
    }, GM.Garage.Management.menu.submenus["garage_list"])
end)

GM.Garage.Management.menu.submenus["garage_create"]:isVisible(function(Items)
    Items:Button("Type", nil, {RightLabel = GM.Garage.Management.data["createdType"]}, true,{
        onSelected = function()
            local input = exports["input"]:openInput({
                label = "Attribuer un type",
                submitLabel = "ENREGISTRER",
                placeHolders = {
                    {label = "TYPE (CAR,BOAT,PLANE)"},
                }
            })

            GM.Garage.Management.data["createdType"] = input["0"]
        end
    })
    Items:Button("Nom", nil, {RightLabel = GM.Garage.Management.data["createdName"]}, true,{
        onSelected = function()
            local input = exports["input"]:openInput({
                label = "Attribuer un nom",
                submitLabel = "ENREGISTRER",
                placeHolders = {
                    {label = "NOM"},
                }
            })

            GM.Garage.Management.data["createdName"] = input["0"]
        end
    })
    Items:Button("Label", nil, {RightLabel = GM.Garage.Management.data["createdLabel"]}, true,{
        onSelected = function()
            local input = exports["input"]:openInput({
                label = "Attribuer un label",
                submitLabel = "ENREGISTRER",
                placeHolders = {
                    {label = "LABEL"},
                }
            })

            GM.Garage.Management.data["createdLabel"] = input["0"]
        end
    })
    Items:Button("Position du menu", nil, {RightLabel = GM.Garage.Management.data["createdmenuPosition"]}, true,{
        onSelected = function()
            GM.Garage.Management.data["createdmenuPosition"] = GetEntityCoords(PlayerPedId())
        end
    })
    Items:Button("Position du spawn", nil, {RightLabel = GM.Garage.Management.data["createdspawnPosition"]}, true,{
        onSelected = function()
            GM.Garage.Management.data["createdspawnPosition"] = GetEntityCoords(PlayerPedId())
        end
    })
    Items:Button("Heading du spawn", nil, {RightLabel = GM.Garage.Management.data["createdspawnHeading"]}, true,{
        onSelected = function()
            GM.Garage.Management.data["createdspawnHeading"] = GetEntityHeading(PlayerPedId())
        end
    })
    Items:Button("Position du rangement", nil, {RightLabel = GM.Garage.Management.data["createddeletePosition"]}, true,{
        onSelected = function()
            GM.Garage.Management.data["createddeletePosition"] = GetEntityCoords(PlayerPedId())
        end
    })
    Items:Button("Créer le garage", nil, {}, GM.Garage.Management.data["createdType"] ~= nil and GM.Garage.Management.data["createdName"] ~= nil and GM.Garage.Management.data["createdLabel"] ~= nil and GM.Garage.Management.data["createdmenuPosition"] ~= nil and GM.Garage.Management.data["createdspawnPosition"] ~= nil and GM.Garage.Management.data["createdspawnHeading"] ~= nil and GM.Garage.Management.data["createddeletePosition"] ~= nil,{
        onSelected = function()
            local garageData = {
                type = GM.Garage.Management.data["createdType"],
                name = GM.Garage.Management.data["createdName"],
                label = GM.Garage.Management.data["createdLabel"],
                menuPosition = GM.Garage.Management.data["createdmenuPosition"],
                spawnPosition = GM.Garage.Management.data["createdspawnPosition"],
                spawnHeading = GM.Garage.Management.data["createdspawnHeading"],
                deletePosition = GM.Garage.Management.data["createddeletePosition"],
            }

            TriggerServerEvent("Garage:createGarage", garageData)
        end
    })
end)

GM.Garage.Management.menu.submenus["garage_list"]:isVisible(function(Items)
    for garageId, garage in pairs(GM.Garage.Management.data["garage"]) do
        Items:Button(garage.name.." - "..garage.label, nil, {}, true,{
            onSelected = function()
                GM.Garage.Management.data["selectedGarage"] = garageId
            end
        }, GM.Garage.Management.menu.submenus["garage_list_management"])
    end
end)

GM.Garage.Management.menu.submenus["garage_list_management"]:isVisible(function(Items)
    if (GM.Garage.Management.data["selectedGarage"] ~= nil and GM.Garage.Management.data["garage"][GM.Garage.Management.data["selectedGarage"]] ~= nil) then
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
                    TriggerServerEvent("Garage:deleteGarage", GM.Garage.Management.data["selectedGarage"], input["0"])
                end
            end
        })
    end
end)


RegisterNetEvent("Garage:managementUpdateValue", function(GARAGE_DATA, GARAGE_KEY, GARAGE_VALUE)
    if (not GARAGE_VALUE) then
        GM.Garage.Management.data[GARAGE_DATA] = GARAGE_KEY
    else
        GM.Garage.Management.data[GARAGE_DATA][GARAGE_KEY] = GARAGE_VALUE
    end
end)

RegisterNetEvent("Garage:managementRemoveValue", function(GARAGE_DATA, GARAGE_KEY)
    if (not GARAGE_KEY) then
        GM.Garage.Management.data[GARAGE_DATA] = nil
    else
        GM.Garage.Management.data[GARAGE_DATA][GARAGE_KEY] = nil
    end
end)

RegisterNetEvent("Garage:openManagementMenu", function()
    GM.Garage.Management.menu.main:toggle()
end)