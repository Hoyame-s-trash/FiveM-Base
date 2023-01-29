GM.Clothes = GM.Clothes or {}

GM.Clothes.registeredZones = {}

GM:newThread(function()
    while (GM.Clothes.Config["clothes_shop"] == nil) do
        Wait(100)
    end

    for shopId, shop in pairs(GM.Clothes.Config["clothes_shop"]) do
        GM.Clothes.registeredZones[shopId] = GM.Zone.Management:create(shop.position, shop.radius, shop.helpText, shop.onUsable, {
            private = false,
            marker = true
        })
    end
end)