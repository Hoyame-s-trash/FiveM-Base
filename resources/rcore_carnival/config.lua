Config = {}

Config.Debug = false

Config.Locale = "en"

Config.Framework = {
    -- 0 = standalone
    -- 1 = esx
    -- 2 = qbcore
    Active = 1,

    -- esx
    ESX_SHARED_OBJECT = "esx:getSharedObject",

    -- es_extended resource name
    ES_EXTENDED_NAME = "believer",

    -------

    -- qbcore
    QBCORE_SHARED_OBJECT = "QBCore:GetObject",

    -- qb-core resource name
    QB_CORE_NAME = "qb-core",

    -- will disable automatic framework detection
    --DisableAutoCheck = true,
}

-- Player will recieve tickets from minigames which can be used to pay in shop of rcore_carnival.
Config.GivePlayerTickets = false

---------------------------
--        Other          --
---------------------------

Config.KeyToOpenGame = "E"

Config.KeyToOpenHighScore = "F"

Config.KeyToOpenShop = "E"

Config.HighestScoreSoundVolume = 0.3

---------------------------
--        Claw           --
---------------------------

-- after 10 minutes all prices will be restock for all machines
Config.RestockPricesAfterMinutes = 10 * 1000 * 60

-- this will add "one HP"
Config.AddAnotherTryOnSuccess = 0

Config.MaxClawTries = 3

Config.KickPlayerFromClawMachineAfterLosse = false

Config.ThemeClawMusic = 0.3

Config.ClawSpeakingVolume = 0.5

Config.ClawEffects = 0.3

---------------------------
--        Basket         --
---------------------------

Config.ScorePerHit = 2

Config.ShakeName = "FAMILY5_DRUG_TRIP_SHAKE"

Config.ShakeIntensity = 0.5

Config.BasketMaxTime = 20

Config.BasketAddTimePerHit = 3

Config.ScoreSoundEffectVolume = 0.3

---------------------------
--        Target         --
---------------------------

-- is tommy gun
Config.TargetShooterWeapon = 1627465347

-- ammo for the tommy gun
Config.TargetShooterWeaponAmmo = 1000

-- score per hit
Config.TargetShooterScore = 2

-- time settings
Config.TimeLimitTargetShooter = {
    [DifficultyType.EASY] = {
        MaxTime = 10,
        AddedTimePerHit = 1.0,
        RemoveTimeIfPlayerHitRedTarget = 2,
    },
    [DifficultyType.MEDIUM] = {
        MaxTime = 10,
        AddedTimePerHit = 1.0,
        RemoveTimeIfPlayerHitRedTarget = 2,
    },
    [DifficultyType.HARD] = {
        MaxTime = 10,
        AddedTimePerHit = 1.0,
        RemoveTimeIfPlayerHitRedTarget = 2,
    },
}

Config.TargetDifficultySettings = {
    [DifficultyType.EASY] = {
        RandomAmountForSpawnTarget = true,
        AmountSpawn = 2,
        
        SpawnInterval = 700,

        ChanceToSpawnForbiddenTarget = 30, -- 30%
    },
    [DifficultyType.MEDIUM] = {
        RandomAmountForSpawnTarget = false,
        AmountSpawn = 2,

        SpawnInterval = 1500,

        ChanceToSpawnForbiddenTarget = 30, -- 30%
    },
    [DifficultyType.HARD] = {
        RandomAmountForSpawnTarget = false,
        AmountSpawn = 2,

        SpawnInterval = 1500,

        ChanceToSpawnForbiddenTarget = 30, -- 30%
    },
}

---------------------------
--        Darts          --
---------------------------

-- sound effect volume
Config.BalloonSoundEffects = 0.3

-- score per baloon
Config.BalloonScore = 2

-- score per baloon
Config.MaxDarts = 5

-- streak darts (it will add him + 2 dart when he hit 2 baloons so folks got chance to win high scores)
Config.StreakScore = 2

-- explained above.
Config.DartsToAddWhenStreak = 2

Config.TimeLimitBalloonDarts = {
    [DifficultyType.EASY] = {
        MaxTime = 10,
        AddedTimePerHit = 0.6,
    },
    [DifficultyType.MEDIUM] = {
        MaxTime = 20,
        AddedTimePerHit = 3,
    },
    [DifficultyType.HARD] = {
        MaxTime = 60,
        AddedTimePerHit = 10,
    },
}

-- other sound effect (explosion, etc)
Config.ShooterTargetSoundEffects = 0.3

---------------------------
--        Beaver         --
---------------------------

-- other sound effect (explosion, etc)
Config.BeaverSoundEffects = 0.3

-- Theme volume
Config.BeaverThemeVolume = 0.3

-- Hit volume sound
Config.HitVolume = 0.45

Config.BeaverScoreList = {
    [BeaverTypeHashObject[BeaverType.BEAVER_BROWN]] = 1,
    [BeaverTypeHashObject[BeaverType.BEAVER_YELLOW]] = 2,
}

Config.MaxBeaverHearts = 5

Config.MaxBeaverTime = 30 -- 1 = 1 second

Config.AddedTimePerHitBeaver = 2

---------------------------
--        Nazar          --
---------------------------

-- Theme volume
Config.NazarThemeVolume = 0.3

-- Bell volume
Config.NazarBellVolume = 0.25

-- Nazar speaking volume
Config.NazarSpeakingVolume = 0.5

-- Nazar sound effects
Config.NazarSoundEffectVolume = 0.125

-- Nazar timeout for the machine
Config.NazarTimeout = 1000 * 60 * 2

---------------------------

-- list of scaleform to use to televison
-- the more there is = the more carnival can be active on single place
-- the hard limit should be 15? i think?
-- keep the value on false.
Config.ScaleFormLists = {
    ["carnival_scaleform_1"] = false,
    ["carnival_scaleform_2"] = false,
    ["carnival_scaleform_3"] = false,
    ["carnival_scaleform_4"] = false,
    ["carnival_scaleform_5"] = false,
    ["carnival_scaleform_6"] = false,
    ["carnival_scaleform_7"] = false,
}


-- do not change.
Config.resolution = {
    [-519220112] = { --rcore_bang_beaver
        ScreenOffSet = vector3(0.3805, 0.175, 1.88),
        ScreenSize = vector3(0.0223, 0.014, 0.0),
        rotationOffset = vector3(0, 0, 90), -- rotation of scaleform
    },
    [GetHashKey("prop_arcade_02")] = {
        ScreenOffSet = vector3(-0.255000, 0.034500, 0.456000),
        ScreenSize = vector3(0.038300, 0.017000, 0.0),
        rotationOffset = vector3(0.0, 0.0, 0), -- rotation of scaleform
    },
}

-- How much ofter the player position is updated ?
Config.RefreshTime = 100

-- how much close player has to be to the sound before starting updating position ?
Config.distanceBeforeUpdatingPos = 40


-- Do not change
Config.RollingResistance = 1.0

Config.Gravity = vector3(0.0, 0.0, -9.0)

Config.Drag = 0.55

Config.BallElasticity = 0.87

Config.GroundBounceEnergyLoss = 0.86

Config.StopHorizontalBounceTreshold = 1.9

Config.TargetZoneType = 0