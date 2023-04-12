GM.Shops = GM.Shops or {}

GM.Shops.Config = {}

GM.Shops.Config["shops_list"] = {
    [0] = {
        name = "ltd_1",
        label = "LTD Sud",
        position = vector3(-707.84100341797,-914.44958496094,19.215589523315),
        radius = 3.0,
        helpText = "accéder à l'épicerie.",
        blips = {
            sprite = 52,
            color = 2,
            scale = 0.8,
        },
        items = {
            [0] = {
                name = "weapon_pistol",
                label = "Pistolet",
                description = "Ceci est un pistolet.",
                price = 1000,
                vip = false,
            },
            [1] = {
                name = "pistol_ammo",
                label = "Munition de pistolet",
                description = "Munition de pistolet",
                price = 200,
                vip = false,
            },
            [2] = {
                name = "bandage",
                label = "Bandage",
                description = "Peut servir à soigner des blessures.",
                price = 100,
                vip = true,
            },
        }
    },
}