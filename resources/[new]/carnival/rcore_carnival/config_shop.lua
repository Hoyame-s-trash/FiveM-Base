Config.GiftShopList = {
    {
        type = "animation", animName = "teddy", price = 1500,
    },
    {
        type = "animation", animName = "bunch_of_flowers", price = 1500,
    },
    {
        type = "animation", animName = "rose", price = 1500,
    },

    -- if you want to sell items in this shop. This is the place you want to setup + example.
    --{
    --    type = "item", label = "Bottle of water", itemName = "water", count = 2, price = 1500,
    --},

    -- if you want to sell weapons in this shop. This is the place you want to setup + example.
    --{
    --    type = "weapon", label = "AK-47", weaponName = "weapon_assaultrifle", ammo = 300, price = 1500,
    --},
}

Config.icecream = {
    {
        type = "animation", animName = "icecream_cnp", price = 1500,
    },
    {
        type = "animation", animName = "icecream_csj", price = 1500,
    },
    {
        type = "animation", animName = "icecream_vbo", price = 1500,
    },

    -- if you want to sell items in this shop. This is the place you want to setup + example.
    --{
    --    type = "item", label = "Bottle of water", itemName = "water", count = 2, price = 1500,
    --},

    -- if you want to sell weapons in this shop. This is the place you want to setup + example.
    --{
    --    type = "weapon", label = "AK-47", weaponName = "weapon_assaultrifle", ammo = 300, price = 1500,
    --},
}

Config.EnableShopMarkers = true

Config.GiftShopLocation = {
    {
        -- Gift shop
        -- npc position + heading
        position = vector3(-1636.75, -1092.16, 12.3),
        heading = 320.77,

        MarkerPosition = vector3(-1636.06, -1091.32, 12.1),

        MarkerOptions = {
            -- color of the marker
            color = {
                r = 255,
                g = 255,
                b = 255,
                a = 200,
            },

            dir = vector3(0, 0, 0),
            rot = vector3(0, 0, 0),
            scale = vector3(1.0, 1.0, 1.0),

            bobUpAndDown = false,
            faceCamera = false,
            rotate = true,

            -- marker icon
            type = 27,
        },

        EnableBlip = true,

        labelShop = "Gift shop",
        BlipID = 52,

        Society = "carnival",

        pedName = GetHashKey("ig_djblamryans"),

        item = "GiftShopList",
        itemList = Config.GiftShopList,
    },
    {
        -- Gift shop
        -- npc position + heading
        position = vector3(-1679.17, -1110.63, 12.3),
        heading = 140.24,

        MarkerPosition = vector3(-1679.93, -1111.68, 12.2),

        MarkerOptions = {
            -- color of the marker
            color = {
                r = 255,
                g = 255,
                b = 255,
                a = 200,
            },

            dir = vector3(0, 0, 0),
            rot = vector3(0, 0, 0),
            scale = vector3(1.0, 1.0, 1.0),

            bobUpAndDown = false,
            faceCamera = false,
            rotate = true,

            -- marker icon
            type = 27,
        },

        EnableBlip = true,

        labelShop = "Gift shop",
        BlipID = 52,

        Society = "carnival",

        pedName = GetHashKey("ig_djblamryans"),

        item = "GiftShopList",
        itemList = Config.GiftShopList,
    },

    {
        -- icecream shop
        -- npc position + heading
        position = vector3(-1645.37, -1102.51, 12.5),
        heading = 321.94,

        MarkerPosition = vector3(-1644.32, -1101.08, 12.1),

        MarkerOptions = {
            -- color of the marker
            color = {
                r = 255,
                g = 255,
                b = 255,
                a = 200,
            },

            dir = vector3(0, 0, 0),
            rot = vector3(0, 0, 0),
            scale = vector3(1.0, 1.0, 1.0),

            bobUpAndDown = false,
            faceCamera = false,
            rotate = true,

            -- marker icon
            type = 27,
        },

        EnableBlip = true,

        labelShop = "Ice Cream shop",
        BlipID = 52,

        Society = "carnival",

        pedName = GetHashKey("s_m_y_xmech_01"),

        item = "icecream",
        itemList = Config.icecream,
    },
    {
        -- icecream shop
        -- npc position + heading
        position = vector3(-1686.73, -1103.73, 12.5),
        heading = 140.24,

        MarkerPosition = vector3(-1687.82, -1105.25, 12.2),

        MarkerOptions = {
            -- color of the marker
            color = {
                r = 255,
                g = 255,
                b = 255,
                a = 200,
            },

            dir = vector3(0, 0, 0),
            rot = vector3(0, 0, 0),
            scale = vector3(1.0, 1.0, 1.0),

            bobUpAndDown = false,
            faceCamera = false,
            rotate = true,

            -- marker icon
            type = 27,
        },

        EnableBlip = true,

        labelShop = "Ice Cream shop",
        BlipID = 52,

        Society = "carnival",

        pedName = GetHashKey("s_m_y_xmech_01"),

        item = "icecream",
        itemList = Config.icecream,
    },
}