GM.Clothes = GM.Clothes or {}

GM.Clothes.Config = {
    ["clothes_shop"] = {
        [1] = {
            position = vector3(72.244445800781,-1398.9188232422,29.376150131226),
            radius = 4.0,
            helpText = "accéder au magasin de vêtements",
            onUsable = function(playerSrc)
                TriggerClientEvent("Clothes:openShop", playerSrc)
            end,
        },
    },
    ["clothes_categories"] = {
        [0] = {
            name = "tshirt",
            label = "T-shirt",
            type = "main",
            drawable = 8,
            restricted = {}
        },
    }
}