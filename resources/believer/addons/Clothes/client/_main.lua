GM.Clothes = GM.Clothes or {}

GM.Clothes = {
    menu = {
        submenus = {}
    },
    data = {
        outfits = {},
        index = {},
        drawable = {},
        textures = {},
    },
}

GM.Clothes.Config = GM.Clothes.Config or {}

GM.Clothes.Config["clothes_categories"] = {
    [1] = {
        name = "torso",
        label = "Haut",
        type = "main",
        drawable = 11,
        restricted = {}
    },
    [2] = {
        name = "tshirt",
        label = "Sous-Haut",
        type = "main",
        drawable = 8,
        restricted = {}
    },
    [3] = {
        name = "arms",
        label = "Bras",
        type = "main",
        drawable = 3,
        restricted = {}
    },
    [4] = {
        name = "decals",
        label = "Decals",
        type = "main",
        drawable = 10,
        restricted = {}
    },
    [5] = {
        name = "pants",
        label = "Pantalons",
        type = "main",
        drawable = 4,
        restricted = {}
    },
    [6] = {
        name = "shoes",
        label = "Chaussures",
        type = "main",
        drawable = 6,
        restricted = {}
    },
    [7] = {
        name = "chains",
        label = "Chaines",
        type = "main",
        drawable = 7,
        restricted = {}
    },
    [8] = {
        name = "bags",
        label = "Sacs",
        type = "main",
        drawable = 5,
        restricted = {}
    },
    [9] = {
        name = "bproof",
        label = "Giletproof",
        type = "main",
        drawable = 9,
        restricted = {}
    },
    [10] = {
        name = "watches",
        label = "Montres",
        type = "accessory",
        drawable = 6,
        restricted = {}
    },
    [11] = {
        name = "helmet",
        label = "Chapeaux",
        type = "accessory",
        drawable = 0,
        restricted = {}
    },
    [12] = {
        name = "glasses",
        label = "Lunettes",
        type = "accessory",
        drawable = 1,
        restricted = {}
    },
    [13] = {
        name = "bracelets",
        label = "Bracelets",
        type = "accessory",
        drawable = 7,
        restricted = {}
    },
    [14] = {
        name = "ears",
        label = "Boucles d'orreilles",
        type = "accessory",
        drawable = 2,
        restricted = {}
    },
}

GM.Clothes.menu.main = RageUI.CreateMenu("", "Vêtements", 0, 0, "banner", "bluestark")
GM.Clothes.menu.main["Closed"] = function()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)
    end)
end

GM.Clothes.menu.submenus["clothes_shop"] = RageUI.CreateSubMenu(GM.Clothes.menu.main, "", "Boutique de vêtements")
GM.Clothes.menu.submenus["clothes_shop"]["Closed"] = function()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)
    end)
end

GM.Clothes.menu.submenus["clothes_outfit"] = RageUI.CreateSubMenu(GM.Clothes.menu.main, "", "Vos tenues sauvegardées")
GM.Clothes.menu.submenus["clothes_outfit_creation"] = RageUI.CreateSubMenu(GM.Clothes.menu.submenus["clothes_outfit"], "", "Créer une tenue")

GM.Clothes.menu.main:isVisible(function(Items)
    Items:Button("Boutique de vêtements", nil, {}, true, {}, GM.Clothes.menu.submenus["clothes_shop"])
    Items:Button("Vos tenues sauvegardées", nil, {}, true, {
        onSelected = function()
            TriggerServerEvent("Clothes:requestOutfits")
        end
    }, GM.Clothes.menu.submenus["clothes_outfit"])
end)

GM.Clothes.menu.submenus["clothes_shop"]:isVisible(function(Items)
    for clotheId, clothes in pairs(GM.Clothes.Config["clothes_categories"]) do

        if (GM.Clothes.data.index[clothes.name.."_1"] == nil) then
            GM.Clothes.data.index[clothes.name.."_1"] = 1
        end

        if (GM.Clothes.data.index[clothes.name.."_2"] == nil) then
            GM.Clothes.data.index[clothes.name.."_2"] = 1
        end

        if (GM.Clothes.data.drawable[clothes.name.."_1"] == nil) then
            GM.Clothes.data.drawable[clothes.name.."_1"] = {}

            if (clothes.type == "main") then
                for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), clothes.drawable), 1 do
                    table.insert(GM.Clothes.data.drawable[clothes.name.."_1"], i)
                end
            elseif (clothes.type == "accessory") then
                for i = 0, GetNumberOfPedPropDrawableVariations(PlayerPedId(), clothes.drawable), 1 do
                    table.insert(GM.Clothes.data.drawable[clothes.name.."_1"], i)
                end
            end
        end

        if (GM.Clothes.data.textures[clothes.name.."_2"] == nil) then
            GM.Clothes.data.textures[clothes.name.."_2"] = {0}
        end

        Items:ListAdvanced(clothes.label, GM.Clothes.data.drawable[clothes.name.."_1"], GM.Clothes.data.index[clothes.name.."_1"], nil, {}, restricted, {
            onListChange = function(index)
                GM.Clothes.data.index[clothes.name.."_1"] = index
                actualIndex = nil

                -- Todo check if clothes data got restricted

                GM.Clothes.data.textures[clothes.name.."_2"] = {}
                if (clothes.type == "main") then
                    for i = 0, GetNumberOfPedTextureVariations(PlayerPedId(), clothes.drawable, index), 1 do
                        table.insert(GM.Clothes.data.textures[clothes.name.."_2"], i)
                    end
                elseif (clothes.type == "accessory") then
                    for i = 0, GetNumberOfPedPropTextureVariations(PlayerPedId(), clothes.drawable, index), 1 do
                        table.insert(GM.Clothes.data.textures[clothes.name.."_2"], i)
                    end
                end
            end,
            onActive = function()
                if actualIndex == nil or actualIndex ~= i then
                    TriggerEvent("skinchanger:change", clothes.name.."_1", GM.Clothes.data.index[clothes.name.."_1"])
                    actualIndex = i
                end
            end,
            onSelected = function()
                TriggerServerEvent("Clothes:buyClothes", {
                    label = clothes.label,
                    firstName = clothes.name.."_1",
                    secondName = clothes.name.."_2",
                    drawable = GM.Clothes.data.index[clothes.name.."_1"],
                    textures = GM.Clothes.data.index[clothes.name.."_2"],
                })
            end
        })

        Items:ListAdvanced(clothes.label.." variations", GM.Clothes.data.textures[clothes.name.."_2"], GM.Clothes.data.index[clothes.name.."_2"], nil, {}, true, {
            onListChange = function(index)
                GM.Clothes.data.index[clothes.name.."_2"] = index
                actualIndex = nil
            end,
            onActive = function()
                if actualIndex == nil or actualIndex ~= i then
                    TriggerEvent("skinchanger:change", clothes.name.."_2", GM.Clothes.data.index[clothes.name.."_2"])
                    actualIndex = i
                end
            end,
            onSelected = function()
                TriggerServerEvent("Clothes:buyClothes", {
                    label = clothes.label,
                    firstName = clothes.name.."_1",
                    secondName = clothes.name.."_2",
                    drawable = GM.Clothes.data.index[clothes.name.."_1"],
                    textures = GM.Clothes.data.index[clothes.name.."_2"],
                })
            end
        })
    end
end)    

GM.Clothes.menu.submenus["clothes_outfit"]:isVisible(function(Items)
    Items:Button("Créer une tenue", nil, {}, true, {
        onSelected = function()
        end
    }, GM.Clothes.menu.submenus["clothes_outfit_creation"])

    for outfitId, outfit in pairs(GM.Clothes.data.outfits) do

        if (GM.Clothes.data.index[outfit.name] == nil) then
            GM.Clothes.data.index[outfit.name] = 1
        end 

        Items:List(outfit.name, {"Équiper", "Renommer", "Supprimer"}, GM.Clothes.data.index[outfit.name], nil, {}, true, {
            onListChange = function(index)
                GM.Clothes.data.index[outfit.name] = index
                actualIndex = nil
            end,
            onSelected = function()
                if (GM.Clothes.data.index[outfit.name] == 1) then
                    TriggerEvent('skinchanger:getSkin', function(skin)
                        TriggerEvent('skinchanger:loadClothes', skin, outfit.outfit)
                        Wait(1000)
                        TriggerServerEvent('esx_skin:save', skin)
                    end)
                elseif (GM.Clothes.data.index[outfit.name] == 2) then
                    local input = exports["input"]:openInput({
                        label = "Renommer la tenue",
                        submitLabel = "RENOMMER",
                        placeHolders = {
                            {label = "Nom"},
                        }
                    })
    
                    if (input["0"] == nil or input["0"] == "nil") then
                        ESX.ShowNotification("~r~Le nom n'est pas valide.")
                        return 
                    end

                    GM.Clothes.data.index[outfit.name] = nil

                    TriggerServerEvent("Clothes:renameOutfit",outfitId, input["0"])
                elseif (GM.Clothes.data.index[outfit.name] == 3) then
                    TriggerServerEvent("Clothes:deleteOutfit", outfitId)
                end
            end
        })
    end
end)

GM.Clothes.menu.submenus["clothes_outfit_creation"]:isVisible(function(Items)
    for clotheId, clothes in pairs(GM.Clothes.Config["clothes_categories"]) do

        if (GM.Clothes.data.index[clothes.name.."_1"] == nil) then
            GM.Clothes.data.index[clothes.name.."_1"] = 1
        end

        if (GM.Clothes.data.index[clothes.name.."_2"] == nil) then
            GM.Clothes.data.index[clothes.name.."_2"] = 1
        end

        if (GM.Clothes.data.drawable[clothes.name.."_1"] == nil) then
            GM.Clothes.data.drawable[clothes.name.."_1"] = {}

            if (clothes.type == "main") then
                for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), clothes.drawable), 1 do
                    table.insert(GM.Clothes.data.drawable[clothes.name.."_1"], i)
                end
            elseif (clothes.type == "accessory") then
                for i = 0, GetNumberOfPedPropDrawableVariations(PlayerPedId(), clothes.drawable), 1 do
                    table.insert(GM.Clothes.data.drawable[clothes.name.."_1"], i)
                end
            end
        end

        if (GM.Clothes.data.textures[clothes.name.."_2"] == nil) then
            GM.Clothes.data.textures[clothes.name.."_2"] = {0}
        end

        Items:ListAdvanced(clothes.label, GM.Clothes.data.drawable[clothes.name.."_1"], GM.Clothes.data.index[clothes.name.."_1"], nil, {}, restricted, {
            onListChange = function(index)
                GM.Clothes.data.index[clothes.name.."_1"] = index
                actualIndex = nil

                -- Todo check if clothes data got restricted

                GM.Clothes.data.textures[clothes.name.."_2"] = {}
                if (clothes.type == "main") then
                    for i = 0, GetNumberOfPedTextureVariations(PlayerPedId(), clothes.drawable, index), 1 do
                        table.insert(GM.Clothes.data.textures[clothes.name.."_2"], i)
                    end
                elseif (clothes.type == "accessory") then
                    for i = 0, GetNumberOfPedPropTextureVariations(PlayerPedId(), clothes.drawable, index), 1 do
                        table.insert(GM.Clothes.data.textures[clothes.name.."_2"], i)
                    end
                end
            end,
            onActive = function()
                if actualIndex == nil or actualIndex ~= i then
                    TriggerEvent("skinchanger:change", clothes.name.."_1", GM.Clothes.data.index[clothes.name.."_1"])
                    actualIndex = i
                end
            end,
            onSelected = function()
                local input = exports["input"]:openInput({
                    label = "Choisir le numéro",
                    submitLabel = "CONFIRMER",
                    placeHolders = {
                        {label = "Numéro"},
                    }
                })

                if (input["0"] == nil or input["0"] == "nil") then
                    ESX.ShowNotification("~r~Le filtre appliqué n'est pas valide.")
                    return 
                end

                local index = tonumber(input["0"]) + 1

                if (GM.Clothes.data.drawable[clothes.name.."_1"][index]) == nil then
                    ESX.ShowNotification("~r~Le numéro voulu n'existe pas.")
                    return
                end

                GM.Clothes.data.index[clothes.name.."_1"] = index
            end
        })

        Items:ListAdvanced(clothes.label.." variations", GM.Clothes.data.textures[clothes.name.."_2"], GM.Clothes.data.index[clothes.name.."_2"], nil, {}, true, {
            onListChange = function(index)
                GM.Clothes.data.index[clothes.name.."_2"] = index
                actualIndex = nil
            end,
            onActive = function()
                if actualIndex == nil or actualIndex ~= i then
                    TriggerEvent("skinchanger:change", clothes.name.."_2", GM.Clothes.data.index[clothes.name.."_2"])
                    actualIndex = i
                end
            end,
            onSelected = function()
                local input = exports["input"]:openInput({
                    label = "Choisir le numéro",
                    submitLabel = "CONFIRMER",
                    placeHolders = {
                        {label = "Numéro"},
                    }
                })

                if (input["0"] == nil or input["0"] == "nil") then
                    ESX.ShowNotification("~r~Le filtre appliqué n'est pas valide.")
                    return 
                end

                local index = tonumber(input["0"]) + 1

                if (GM.Clothes.data.textures[clothes.name.."_2"][index]) == nil then
                    ESX.ShowNotification("~r~Le numéro voulu n'existe pas.")
                    return
                end

                GM.Clothes.data.index[clothes.name.."_2"] = index
            end
        })
    end
    Items:Button("Nom de votre tenue", nil, {RightLabel = GM.Clothes.data["currentOutfitName"]}, true, {
        onSelected = function()
            local input = exports["input"]:openInput({
                label = "Nom de votre tenue",
                submitLabel = "VALIDER",
                placeHolders = {
                    {label = "Nom"},
                }
            })

            if (input["0"] == nil or input["0"] == "nil") then
                ESX.ShowNotification("~r~Le nom de la tenue n'est pas valide.")
                return 
            end

            GM.Clothes.data["currentOutfitName"] = input["0"]
        end
    })
    Items:Button("Enregistrer", nil, {RightLabel = "1500$"}, GM.Clothes.data["currentOutfitName"] ~= nil, {
        onSelected = function()
            TriggerEvent('skinchanger:getSkin', function(skin)
                TriggerServerEvent("Clothes:buyOufit", GM.Clothes.data["currentOutfitName"], skin)
            end)
        end
    })
end)

RegisterNetEvent("Clothes:updateValue", function(CLOTHES_DATA, CLOTHES_KEY, CLOTHES_VALUE)
    if (not CLOTHES_VALUE) then
        GM.Clothes.data[CLOTHES_DATA] = CLOTHES_KEY
    else
        GM.Clothes.data[CLOTHES_DATA][CLOTHES_KEY] = CLOTHES_VALUE
    end
end)

RegisterNetEvent("Clothes:removeValue", function(CLOTHES_DATA, CLOTHES_KEY)
    if (not CLOTHES_KEY) then
        GM.Clothes.data[CLOTHES_DATA] = nil
    else
        GM.Clothes.data[CLOTHES_DATA][CLOTHES_KEY] = nil
    end
end)

RegisterNetEvent("Clothes:openShop", function()
    GM.Clothes.menu.main:toggle()
end)