GM.Rent = GM.Rent or {}

GM.Rent.Config = {}

GM.Rent.Config["rent_list"] = {
    [0] = {
        name = "rent_1",
        label = "Location",
        position = vector3(-707.84100341797,-914.44958496094,19.215589523315),
        radius = 3.0,
        helpText = "accéder à la location.",
        blips = {
            sprite = 52,
            color = 2,
            scale = 0.8,
        },
        items = {
            [0] = {
                name = "sultanrs",
                label = "Sultan RS",
                description = "Véhicule de sport.",
                price = 10000,
                vip = false,
            },
        }
    },
}