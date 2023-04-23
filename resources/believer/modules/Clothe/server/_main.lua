GM.Clothes.registeredZones = {}

GM:newThread(function()
    while (GM.Clothes["shop"] == nil) do
        Wait(50)
    end

    for i = 1, #GM.Clothes["shop"] do
        local shop = GM.Clothes["shop"][i]
        shop.onUsable = function(playerSrc)
            TriggerClientEvent("Clothes:openShop", playerSrc, {
                shopId = i,
                categories = shop.categories
            })
        end
        GM.Clothes.registeredZones[i] = GM.Zone.Management:create(shop.position, shop.radius or 3.0, shop.helpText, shop.onUsable, {
            private = false,
            marker = true
        })
    end
end)