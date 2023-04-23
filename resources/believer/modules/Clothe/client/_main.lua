GM.Clothes = {
    menu = {
        submenus = {}
    },
    data = {
    },
}

GM.Clothes.menu.main = RageUI.CreateMenu("", "Vêtements", 0, 0, "banner", "bluestark")
GM.Clothes.menu.main["Closed"] = function()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)
    end)
end

GM.Clothes.menu.submenus["categories_management"] = RageUI.CreateSubMenu(GM.Clothes.menu.main, "", "Boutique de vêtements")

GM.Clothes.menu.main:isVisible(function(Items)
    if (GM.Clothes.data["categories"] ~= nil) then
        for i = 1, #GM.Clothes.data["categories"] do
            local category = GM.Clothes.data["categories"][i]

            if (GM.Clothes.data.index == nil) then
                GM.Clothes.data.index = {}
            end

            if (GM.Clothes.data.index[category.name.."_1"] == nil) then
                GM.Clothes.data.index[category.name.."_1"] = 1
            end

            if (GM.Clothes.data.index[category.name.."_2"] == nil) then
                GM.Clothes.data.index[category.name.."_2"] = 1
            end
    
            if (GM.Clothes.data.drawable == nil) then 
                GM.Clothes.data.drawable = {}
            end
    
            if (GM.Clothes.data.drawable[category.name.."_1"] == nil) then
                GM.Clothes.data.drawable[category.name.."_1"] = {}
    
                if (category.type == "main") then
                    for i = 1, GetNumberOfPedDrawableVariations(PlayerPedId(), category.drawable) - 1, 1 do 
                        table.insert(GM.Clothes.data.drawable[category.name.."_1"], i)
                    end
                elseif (category.type == "accessory") then
                    for i = 1, GetNumberOfPedPropDrawableVariations(PlayerPedId(), category.drawable) - 1, 1 do 
                        table.insert(GM.Clothes.data.drawable[category.name.."_1"], i)
                    end
                end
            end

            if (GM.Clothes.data.textures == nil) then 
                GM.Clothes.data.textures = {}
            end

            if (GM.Clothes.data.textures[category.name.."_2"] == nil) then
                GM.Clothes.data.textures[category.name.."_2"] = {}
                if (category.type == "main") then
                    for i = 1, GetNumberOfPedTextureVariations(PlayerPedId(), category.drawable, index), 1 do
                        table.insert(GM.Clothes.data.textures[category.name.."_2"], i)
                    end
                elseif (category.type == "accessory") then
                    for i = 1, GetNumberOfPedPropTextureVariations(PlayerPedId(), category.drawable, index), 1 do
                        table.insert(GM.Clothes.data.textures[category.name.."_2"], i)
                    end
                end
            end

            Items:ListAdvanced(category.label, GM.Clothes.data.drawable[category.name.."_1"], GM.Clothes.data.index[category.name.."_1"], nil, {}, true, {
                onListChange = function(index)
                    GM.Clothes.data.index[category.name.."_1"] = index
                    actualIndex = nil

                    GM.Clothes.data.index[category.name.."_2"] = 1

                    GM.Clothes.data.textures[category.name.."_2"] = {}
                    if (category.type == "main") then
                        for i = 1, GetNumberOfPedTextureVariations(PlayerPedId(), category.drawable, index), 1 do
                            table.insert(GM.Clothes.data.textures[category.name.."_2"], i)
                        end
                    elseif (category.type == "accessory") then
                        for i = 1, GetNumberOfPedPropTextureVariations(PlayerPedId(), category.drawable, index), 1 do
                            table.insert(GM.Clothes.data.textures[category.name.."_2"], i)
                        end
                    end
                end,
                onActive = function()
                    if actualIndex == nil or actualIndex ~= i then
                        TriggerEvent("skinchanger:change", category.name.."_1", GM.Clothes.data.index[category.name.."_1"])
                        actualIndex = i
                    end
                end,
                onSelected = function()
                    TriggerServerEvent("Clothes:buyClothes", {
                        label = category.label,
                        firstName = category.name.."_1",
                        secondName = category.name.."_2",
                        drawable = GM.Clothes.data.index[category.name.."_1"],
                        textures = GM.Clothes.data.index[category.name.."_2"],
                    })
                end
            })

            Items:ListAdvanced(category.label.." variations", GM.Clothes.data.textures[category.name.."_2"], GM.Clothes.data.index[category.name.."_2"], nil, {}, true, {
                onListChange = function(index)
                    GM.Clothes.data.index[category.name.."_2"] = index
                    actualIndex = nil
                end,
                onActive = function()
                    if actualIndex == nil or actualIndex ~= i then
                        TriggerEvent("skinchanger:change", category.name.."_2", GM.Clothes.data.index[category.name.."_2"])
                        actualIndex = i
                    end
                end,
                onSelected = function()
                    TriggerServerEvent("Clothes:buyClothes", {
                        label = category.label,
                        firstName = category.name.."_1",
                        secondName = category.name.."_2",
                        drawable = GM.Clothes.data.index[category.name.."_1"],
                        textures = GM.Clothes.data.index[category.name.."_2"],
                    })
                end
            })
        end
    end
end)

RegisterNetEvent("Clothes:openShop", function(shopData)
    if (GM.Clothes.data["categories"] == nil) then
        GM.Clothes.data["categories"] = shopData["categories"]
    end

    GM.Clothes.data["categories"] = shopData["categories"]

    if (GM.Clothes.data["shopId"] == nil) then
        GM.Clothes.data["shopId"] = shopData["shopId"]
    end

    GM.Clothes.data["shopId"] = shopData["shopId"]

    GM.Clothes.menu.main:toggle()
end)