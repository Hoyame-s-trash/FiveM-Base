function DisplayEditorHelpText()
    ShowHelpNotification("Press ~INPUT_FRONTEND_RDOWN~ to confirm\nPress ~INPUT_FRONTEND_RRIGHT~ to exit editor\nWheelmouse up/down = rotation of the object", false, false, 15000)
end

function FinalSteps()
    ShowHelpNotification("You can still rotate the object with wheelmouse when you feel like its ready just press  ~INPUT_FRONTEND_RDOWN~ or to cancel and move it again ~INPUT_FRONTEND_RRIGHT~", false, false, 15000)
end

function GetCompleteArrayMiniGame(miniGame)

    local fO, sO = GetDefaultOffset(miniGame)
    if miniGame == GameType.ARCADE_CLAW then
        return {
            GameType = "GameType." .. GameTypeName[miniGame],

            Position = GetEntityCoords(ObjectGameEditor),
            Heading = GetEntityHeading(ObjectGameEditor),

            PriceTicket = 1000, -- is $1,000

            Society = "carnival",
            BlipID = GetDefaultBlip(miniGame),

            Prices = GetRandomPlushArray(),

            -- we wont be counting the highscore here because it is based on luck not skill.
            CantScore = true,

            -- do not change
            IsBusy = false,
            Score = nil,

            floatOffsetPaid = fO,
            floatOffsetFree = sO,
        }
    end

    local data = {
        GameType = "GameType." .. GameTypeName[miniGame],

        Position = GetEntityCoords(ObjectGameEditor),
        HeadingObjectEditor = GetEntityHeading(ObjectGameEditor),

        PriceTicket = 1000, -- 0 is free

        Society = "carnival",
        BlipID = GetDefaultBlip(miniGame),

        -- do not change
        IsBusy = false,
        Score = nil,

        floatOffsetPaid = fO,
        floatOffsetFree = sO,
    }

    if ActiveGameEditor == GameType.FORTUNE_TELLER then
        data.CantScore = true
    end

    return data
end

function GetRandomPlushArray()
    local plushesh = {
        ["ch_prop_arcade_claw_plush_01a"] = { "plush_01", 0.5 },
        ["ch_prop_arcade_claw_plush_02a"] = { "plush_02", 0.5 },
        ["ch_prop_arcade_claw_plush_03a"] = { "plush_03", 0.5 },
        ["ch_prop_arcade_claw_plush_04a"] = { "plush_04", 0.5 },
        ["ch_prop_arcade_claw_plush_05a"] = { "plush_05", 0.5 },
        ["ch_prop_arcade_claw_plush_06a"] = { "plush_06", 0.5 },
        ["ch_prop_princess_robo_plush_07a"] = { "plush_07", 0.1 },
        ["ch_prop_shiny_wasabi_plush_08a"] = { "plush_08", 0.1 },
        ["ch_prop_master_09a"] = { "plush_09", 0.1 },
    }

    local array = {
        [1] = {
            itemName = "",

            model = "",
            offset = vector3(0.24, -0.04, 0.85),
            heading = 0.0,
            IsRare = false,

            ChanceToDrop = 0.50, -- 50% chance of drop
        },

        [2] = {
            itemName = "",

            model = "",
            offset = vector3(0.29, 0.19, 0.85),
            heading = 0.0,
            IsRare = false,

            ChanceToDrop = 0.50, -- 50% chance of drop
        },

        [3] = {
            itemName = "",

            model = "",
            offset = vector3(0.06, 0.2, 0.85),
            heading = 0.0,
            IsRare = false,

            ChanceToDrop = 0.50, -- 50% chance of drop
        },

        [4] = {
            itemName = "",

            model = "",
            offset = vector3(-0.24, 0.25, 0.85),
            heading = 0.0,
            IsRare = false,

            ChanceToDrop = 0.50, -- 50% chance of drop
        },

        [5] = {
            itemName = "",

            model = "",
            offset = vector3(-0.25, 0.55, 0.85),
            heading = 0.0,
            IsRare = false,

            ChanceToDrop = 0.50, -- 50% chance of drop
        },

        [6] = {
            itemName = "",

            model = "",
            offset = vector3(0.01, 0.55, 0.85),
            heading = 0.0,
            IsRare = false,

            ChanceToDrop = 0.50, -- 50% chance of drop
        },

        [7] = {
            itemName = "",

            model = "",
            offset = vector3(0.3, 0.55, 0.85),
            heading = 0.0,
            IsRare = true,

            ChanceToDrop = 0.10, -- 10% chance of drop
        },

        [8] = {
            itemName = "",

            model = "",
            offset = vector3(0.2, 0.37, 0.85),
            heading = 0.0,
            IsRare = true,

            ChanceToDrop = 0.10, -- 10% chance of drop
        },

        [8] = {
            itemName = "",

            model = "",
            offset = vector3(-0.06, 0.37, 0.85),
            heading = 0.0,
            IsRare = true,

            ChanceToDrop = 0.10, -- 10% chance of drop
        },
    }

    for k, v in pairs(array) do
        local key = GetRandomKeyFromArray(plushesh)
        v.itemName = plushesh[key][1]
        v.ChanceToDrop = plushesh[key][2]
        v.model = key

        plushesh[key] = nil
    end

    return array
end

-- floatOffsetPaid , floatOffsetFree
function GetDefaultBlip(miniGame)
    local blipList = {
        [GameType.BANG_BEAVER] = 536,
        [GameType.FORTUNE_TELLER] = 197,
        [GameType.BASKET_THROW] = 590,

        [GameType.ARCADE_CLAW] = 546,
        [GameType.BALLOON_SHOOTER] = 156,
        [GameType.TARGET_SHOOTER] = 156,
    }

    return blipList[miniGame] or 1
end

-- floatOffsetPaid , floatOffsetFree
function GetDefaultOffset(miniGame)
    local blipList = {
        [GameType.BANG_BEAVER] = { vector3(0, 0, 2.7), vector3(0, 0, 2.7) },
        [GameType.FORTUNE_TELLER] = { vector3(-0.4, 0, 2.4), vector3(-0.25, 0, 2.4) },
        [GameType.BASKET_THROW] = { vector3(-0.65, 0, 1.5), vector3(-0.65, 0, 1.5) },
        [GameType.ARCADE_CLAW] = { vector3(-0.5, 0, 2.7), vector3(-0.25, 0, 2.7) },

        [GameType.BALLOON_SHOOTER] = { vector3(0, 0, 0), vector3(0, 0, 0) },
        [GameType.TARGET_SHOOTER] = { vector3(0, 0, 0), vector3(0, 0, 0) },
    }

    return blipList[miniGame][1], blipList[miniGame][2]
end