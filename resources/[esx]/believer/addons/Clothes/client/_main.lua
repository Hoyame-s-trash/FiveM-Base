GM.Clothes = GM.Clothes or {}

GM.Clothes = {
    menu = {
        submenus = {}
    },
    data = {
        outfits = {},
        categories = {
            [0] = {
                name = "tshirt",
                label = "T-shirt",
                type = "main",
                drawable = 8,
                restricted = {}
            },
        }
    },
}

GM.Clothes.menu.main = RageUI.CreateMenu("", "Vêtements", 0, 0, "banner", "bluestark")
GM.Clothes.menu.main["Closed"] = function()
    -- Todo event when menu closed
end

GM.Clothes.menu.submenus["clothes_shop"] = RageUI.CreateSubMenu(GM.Clothes.menu.main, "", "Categories de vetements")

GM.Clothes.menu.submenus["clothes_shop_management"] = RageUI.CreateSubMenu(GM.Clothes.menu.submenus["clothes_shop"], "", "Catégories de vêtements - Management")

GM.Clothes.menu.main:isVisible(function(Items)
    Items:Button("Boutique de vêtements", nil, {}, true, {}, GM.Clothes.menu.submenus["clothes_shop"])
    Items:Button("Vos tenues sauvegardées", nil, {}, true, {})
end)

GM.Clothes.menu.submenus["clothes_shop"]:isVisible(function(Items)
    for clotheId, clothes in pairs(GM.Clothes.data.categories) do
        Items:Button(clothes.label, nil, {}, true, {
            onSelected = function()
                GM.Clothes.data["selectedClothe"] = clotheId
            end
        }, GM.Clothes.menu.submenus["clothes_shop_management"])
    end
end)

GM.Clothes.menu.submenus["clothes_shop_management"]:isVisible(function(Items)
    if (GM.Clothes.data["selectedClothe"] ~= nil and GM.Clothes.data.categories[GM.Clothes.data["selectedClothe"]] ~= nil) then
        local selectedClothe = GM.Clothes.data.categories[GM.Clothes.data["selectedClothe"]]

        if (selectedClothe.type == "main") then
            local drawable = GetNumberOfPedDrawableVariations(PlayerPedId(), selectedClothe.drawable)
            local texture = GetNumberOfPedTextureVariations(PlayerPedId(), selectedClothe.drawable, selectedClothe.texture)

            for i = 0, drawable - 1 do
                Items:Button("Vêtement n°" .. i, nil, {}, true, {
                    onSelected = function()
                        TriggerServerEvent("Clothes:updateValue", "clothes", selectedClothe.name, i)
                    end
                })
            end
        elseif (selectedClothe.type == "accessory") then
            local drawable = GetNumberOfPedPropDrawableVariations(PlayerPedId(), selectedClothe.drawable)
            local texture = GetNumberOfPedPropTextureVariations(PlayerPedId(), selectedClothe.drawable, selectedClothe.texture)

            for i = 0, drawable - 1 do
                Items:Button("Vêtement n°" .. i, nil, {}, true, {
                    onSelected = function()
                        TriggerServerEvent("Clothes:updateValue", "clothes", selectedClothe.name, i)
                    end
                })
            end
        end
    end
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