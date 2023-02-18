Config.MiniGameList = {
    {
        GameType = GameType.BANG_BEAVER,
        Position = vector3(-1635.33, -1064.03, 12.15),
        Heading = 140.0,

        PriceTicket = 1000, -- 0 is free

        Society = "carnival",
        BlipID = 536,

        EnableBlip = true,

        -- do not change
        IsBusy = false,
        Score = nil,

        floatOffsetPaid = vector3(0, 0, 2.7),
        floatOffsetFree = vector3(0, 0, 2.7),
    },
    {
        GameType = GameType.BANG_BEAVER,
        Position = vector3(-1634.61, -1063.3, 12.15),
        Heading = 140.0,

        PriceTicket = 1000, -- 0 is free

        Society = "carnival",
        BlipID = 536,

        EnableBlip = true,

        -- do not change
        IsBusy = false,
        Score = nil,

        floatOffsetPaid = vector3(0.0, 0.36, 2.2),
        floatOffsetFree = vector3(0.0, 0.36, 2.2),
    },
    {
        GameType = GameType.FORTUNE_TELLER,
        Position = vector3(-1635.46, -1081.1, 12.07),
        Heading = 50.0,

        -- we wont be displaying any highscore here cuz... there isnt any.
        CantScore = true,

        PriceTicket = 1000, -- is $1,000

        Society = "carnival",
        BlipID = 197,

        EnableBlip = true,

        -- do not change
        IsBusy = false,
        Score = nil,

        floatOffsetPaid = vector3(-0.4, 0, 2.4),
        floatOffsetFree = vector3(-0.25, 0, 2.4),
    },
    {
        GameType = GameType.BALLOON_SHOOTER,
        Position = vector3(-1723.48, -1112.63, 13.15),
        Heading = 320.23,

        PriceTicket = 1000, -- is $1,000

        Society = "carnival",
        BlipID = 156,

        EnableBlip = true,

        BalloonData = {
            [1] = {
                [1] = vec3(-1721.036621, -1107.923706, 14.396350),
                [2] = BalloonTypes.BALLON_PURPLE_SMALL
            },
            [2] = {
                [1] = vec3(-1720.688110, -1108.213989, 13.889705),
                [2] = BalloonTypes.BALLON_ORANGE
            },
            [3] = {
                [1] = vec3(-1720.988037, -1107.964233, 13.365018),
                [2] = BalloonTypes.BALLON_ORANGE
            },
            [4] = {
                [1] = vec3(-1720.381104, -1108.469604, 13.300982),
                [2] = BalloonTypes.BALLON_RED_SMALL
            },
            [5] = {
                [1] = vec3(-1720.324097, -1108.517090, 14.277718),
                [2] = BalloonTypes.BALLON_GREEN_SMALL
            },
            [6] = {
                [1] = vec3(-1720.106689, -1108.698120, 13.728706),
                [2] = BalloonTypes.BALLON_YELLOW_SMALL
            },
            [7] = {
                [1] = vec3(-1719.681152, -1109.052490, 14.118144),
                [2] = BalloonTypes.BALLON_GREEN
            },
            [8] = {
                [1] = vec3(-1719.729248, -1109.012329, 13.326758),
                [2] = BalloonTypes.BALLON_ORANGE_SMALL
            },
            [9] = {
                [1] = vec3(-1719.245972, -1109.414795, 14.281792),
                [2] = BalloonTypes.BALLON_PURPLE
            },
            [10] = {
                [1] = vec3(-1719.050171, -1109.578003, 13.549752),
                [2] = BalloonTypes.BALLON_ORANGE_SMALL
            },
            [11] = {
                [1] = vec3(-1718.452026, -1110.076050, 13.523190),
                [2] = BalloonTypes.BALLON_PURPLE_SMALL
            },
            [12] = {
                [1] = vec3(-1718.627686, -1109.929688, 14.255624),
                [2] = BalloonTypes.BALLON_ORANGE
            },
            [13] = {
                [1] = vec3(-1717.982544, -1110.466919, 14.363113),
                [2] = BalloonTypes.BALLON_YELLOW
            },
            [14] = {
                [1] = vec3(-1717.750122, -1110.660522, 13.379180),
                [2] = BalloonTypes.BALLON_YELLOW
            },
            [15] = {
                [1] = vec3(-1717.306885, -1111.029663, 13.850131),
                [2] = BalloonTypes.BALLON_RED_SMALL
            },
            [16] = {
                [1] = vec3(-1716.484741, -1111.714355, 13.369056),
                [2] = BalloonTypes.BALLON_RED_SMALL
            },
            [17] = {
                [1] = vec3(-1717.047241, -1111.245972, 13.248049),
                [2] = BalloonTypes.BALLON_GREEN
            },
            [18] = {
                [1] = vec3(-1716.463501, -1111.732056, 14.181133),
                [2] = BalloonTypes.BALLON_ORANGE_SMALL
            },
            [19] = {
                [1] = vec3(-1716.871704, -1111.392090, 14.235259),
                [2] = BalloonTypes.BALLON_BLUE
            },
            [20] = {
                [1] = vec3(-1718.016724, -1110.438599, 13.796652),
                [2] = BalloonTypes.BALLON_RED
            }
        },

        DrawMarker = true,

        DrawMarkerHeight = -0.9,

        CemarePosition = vector3(-1722.16, -1113.52, 14.02),
        CameraRotation = vector3(0, 0, -40),

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

        -- do not change
        IsBusy = false,
        Score = nil,

        floatOffsetPaid = vector3(0, 0, 0),
        floatOffsetFree = vector3(0, 0, 0),
    },
    {
        GameType = GameType.TARGET_SHOOTER,
        Position = vector3(-1720.47, -1119.24, 13.15),
        Heading = 231.83,

        PriceTicket = 1000, -- is $1,000

        Society = "carnival",
        BlipID = 156,

        EnableBlip = true,

        TargetData = {
            [1] = {
                pos = vec3(-1714.526855, -1121.023560, 14.393879) - vector3(0, 0, 0.3),
                heading = 40.0,
            },
            [2] = {
                pos = vec3(-1714.883789, -1121.437134, 13.765103) - vector3(0, 0, 0.3),
                heading = 40.0,
            },
            [3] = {
                pos = vec3(-1714.478149, -1120.967041, 13.339684) - vector3(0, 0, 0.3),
                heading = 40.0,
            },
            [4] = {
                pos = vec3(-1715.178955, -1121.638062, 14.433811) - vector3(0, 0, 0.3),
                heading = 40.0,
            },
            [5] = {
                pos = vec3(-1715.517456, -1122.171753, 13.893398) - vector3(0, 0, 0.3),
                heading = 40.0,
            },
            [6] = {
                pos = vec3(-1715.225708, -1121.833496, 13.279316) - vector3(0, 0, 0.3),
                heading = 40.0,
            },
            [7] = {
                pos = vec3(-1715.930908, -1122.650879, 13.318353) - vector3(0, 0, 0.3),
                heading = 40.0,
            },
            [8] = {
                pos = vec3(-1715.951172, -1122.674438, 14.372198) - vector3(0, 0, 0.3),
                heading = 40.0,
            },
            [9] = {
                pos = vec3(-1716.330322, -1123.113770, 13.857698) - vector3(0, 0, 0.3),
                heading = 40.0,
            },
            [10] = {
                pos = vec3(-1716.684448, -1123.524292, 13.311064) - vector3(0, 0, 0.3),
                heading = 40.0,
            },
            [11] = {
                pos = vec3(-1716.732422, -1123.579956, 14.358837) - vector3(0, 0, 0.3),
                heading = 40.0,
            },
            [12] = {
                pos = vec3(-1717.142578, -1124.055420, 13.783116) - vector3(0, 0, 0.3),
                heading = 40.0,
            },
            [13] = {
                pos = vec3(-1717.541504, -1124.517700, 13.272597) - vector3(0, 0, 0.3),
                heading = 40.0,
            },
            [14] = {
                pos = vec3(-1717.882690, -1124.913208, 13.997849) - vector3(0, 0, 0.3),
                heading = 40.0,
            },
            [15] = {
                pos = vec3(-1717.422974, -1124.380249, 14.468245) - vector3(0, 0, 0.3),
                heading = 40.0,
            },
            [16] = {
                pos = vec3(-1718.245850, -1125.334229, 14.466558) - vector3(0, 0, 0.3),
                heading = 40.0,
            },
            [17] = {
                pos = vec3(-1718.238892, -1125.170166, 13.353612) - vector3(0, 0, 0.3),
                heading = 40.0,
            }
        },

        DrawMarker = true,

        DrawMarkerHeight = -0.9,

        CemarePosition = vector3(-1722.16, -1113.52, 14.02),
        CameraRotation = vector3(0, 0, -40),

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

        -- do not change
        IsBusy = false,
        Score = nil,

        floatOffsetPaid = vector3(0, 0, 0),
        floatOffsetFree = vector3(0, 0, 0),
    },
    {
        GameType = GameType.BASKET_THROW,
        Position = vector3(-1733.98, -1122.55, 12.02),
        Heading = 140.0,

        PriceTicket = 0, -- is free

        Society = "carnival",
        BlipID = 590,

        EnableBlip = true,

        -- do not change
        IsBusy = false,
        Score = nil,

        floatOffsetPaid = vector3(-0.65, 0, 1.5),
        floatOffsetFree = vector3(-0.65, 0, 1.5),
    },
    {
        GameType = GameType.ARCADE_CLAW,
        Position = vector3(-1727.59, -1128.35, 12.00),
        Heading = 140.0,


        PriceTicket = 1000, -- is $1,000

        Society = "carnival",
        BlipID = 546,

        EnableBlip = true,

        Prices = {
            [1] = {
                itemName = "plush_01",

                model = "ch_prop_arcade_claw_plush_01a",
                offset = vector3(0.24, -0.04, 0.85),
                heading = 0.0,
                IsRare = false,

                ChanceToDrop = 0.50, -- 50% chance of drop
            },

            [2] = {
                itemName = "plush_02",

                model = "ch_prop_arcade_claw_plush_02a",
                offset = vector3(0.29, 0.19, 0.85),
                heading = 0.0,
                IsRare = false,

                ChanceToDrop = 0.50, -- 50% chance of drop
            },

            [3] = {
                itemName = "plush_03",

                model = "ch_prop_arcade_claw_plush_03a",
                offset = vector3(0.06, 0.2, 0.85),
                heading = 0.0,
                IsRare = false,

                ChanceToDrop = 0.50, -- 50% chance of drop
            },

            [4] = {
                itemName = "plush_04",

                model = "ch_prop_arcade_claw_plush_04a",
                offset = vector3(-0.24, 0.25, 0.85),
                heading = 0.0,
                IsRare = false,

                ChanceToDrop = 0.50, -- 50% chance of drop
            },

            [5] = {
                itemName = "plush_05",

                model = "ch_prop_arcade_claw_plush_05a",
                offset = vector3(-0.25, 0.55, 0.85),
                heading = 0.0,
                IsRare = false,

                ChanceToDrop = 0.50, -- 50% chance of drop
            },

            [6] = {
                itemName = "plush_06",

                model = "ch_prop_arcade_claw_plush_06a",
                offset = vector3(0.01, 0.55, 0.85),
                heading = 0.0,
                IsRare = false,

                ChanceToDrop = 0.50, -- 50% chance of drop
            },

            [7] = {
                itemName = "plush_07",

                model = "ch_prop_princess_robo_plush_07a",
                offset = vector3(0.3, 0.55, 0.85),
                heading = 0.0,
                IsRare = true,

                ChanceToDrop = 0.10, -- 10% chance of drop
            },

            [8] = {
                itemName = "plush_08",

                model = "ch_prop_shiny_wasabi_plush_08a",
                offset = vector3(0.2, 0.37, 0.85),
                heading = 0.0,
                IsRare = true,

                ChanceToDrop = 0.10, -- 10% chance of drop
            },

            [9] = {
                itemName = "plush_09",

                model = "ch_prop_master_09a",
                offset = vector3(-0.06, 0.37, 0.85),
                heading = 0.0,
                IsRare = true,

                ChanceToDrop = 0.10, -- 10% chance of drop
            },
        },

        -- we wont be counting the highscore here because it is based on luck not skill.
        CantScore = true,

        -- do not change
        IsBusy = false,
        Score = nil,

        floatOffsetPaid = vector3(-0.5, 0, 2.7),
        floatOffsetFree = vector3(-0.25, 0, 2.7),
    },

}