Cases = {}

Cases.OpenCommand = "cases"

Cases.WeaponsAreItem = false -- If your weapons are item then you should set this TRUE.

Cases.WebsiteLink = "https://bluestark.tebex.io/category/1864842"
Cases.DiscordLink = "https://discord.gg/bluestark"

-- ITEM TYPES : "common", "uncommon", "rare", "mythical", "legendary"
Cases.LastItemCategories = {"uncommon", "rare", "mythical", "legendary"} -- When items of the type written on the left are won, they appear in the recently won items tab
Cases.ServerNotifyCategories = {"mythical", "legendary"} -- When items of the type written on the left are won, a notification is sent to the entire server

Cases.Translate = {
    title1 = "CAISSE",
    title2 = "BLUESTARK",
    premium = "PREMIUM",
    standard = "NO-PERM",
    cases = "CAISSES",
    website = "COINS",
    discord = "DISCORD",
    premiumCases = "PREMIUM CASE",
    standardCases = "NO-PERM CASE",
    openCase = "OUVRIR CAISSE",
    openFast = "OUVERTURE RAPIDE",
    coinShopTitle = "COINS",
    new = "NOUVEAU",
    goBack = "RETOUR",
    caseItems = "CONTIENT",
    items = "ITEMS",
    congratulations = "FÉLICITATIONS",
    congDescription = "Merci d'avoir acheté sur la boutique de BlueStark",
    collect = "RÉCUPERER",
    sell = "VENDRE",
    accept = "ACCEPTER",
    creditLoaded = "CREDIT RECUPERER",
    failed = "ERREUR",
    youDntHaveEnoughCredit = "VOUS N'AVEZ PAS ASSEZ DE COINS",
}


-- giveItemType's = "item", "vehicle", "money"
-- items in the case should have a chance total of 100 !! IMPORTANT !! IMPORTANT !! IMPORTANT !!
Cases.PremiumCases = {
    {
        uniqueId = 1, -- IDs must be different and sequential
        label = "Crazy Case",
        price = 4000,
        priceType = "COINS", -- COINS OR SC
        caseTheme = "red", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = false, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "weapon_scar17", label = "SCAR-17", chance = 3, sellCredit = 3700, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/automne/scar17.png" },
            { itemName = "WEAPON_SMG_MK2", label = "SMG MK2", chance = 3, sellCredit = 3700, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/automne/smgmk2.png" },
            { itemName = "WEAPON_RPK16", label = "RPK16", chance = 3, sellCredit = 3700, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/automne/rpk16.png" },
            { itemName = "weapon_hell", label = "Hell", chance = 3, sellCredit = 3700, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/automne/hell.png" },            
            { itemName = "weapon_doublebarrelfm", label = "Double Barrel Shotgun", chance = 3, sellCredit = 3700, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/automne/doublebarrelfm.png" },
            { itemName = "WEAPON_coachgun", label = "Coach Shotgun", chance = 3, sellCredit = 3700, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/automne/coachgun.png" },
            { itemName = "weapon_blacksniper", label = "Blacksniper", chance = 1.5, sellCredit = 3700, itemType = "legendary", itemCount = 1, giveItemType = "weapon", image = "./images/automne/blacksniper.png" },
            { itemName = "weapon_combatmg", label = "Batteuse de Combat", chance = 2, sellCredit = 3700, itemType = "legendary", itemCount = 1, giveItemType = "weapon", image = "./images/automne/combat-mg.png" },
            { itemName = "money", label = "800.000$", chance = 10, sellCredit = 2500, itemType = "rare", itemCount = 800000, giveItemType = "money", image = "./images/items/money-1.png" },
            { itemName = "money", label = "1.000.000$", chance = 8, sellCredit = 2500, itemType = "rare", itemCount = 1000000, giveItemType = "money", image = "./images/items/money-2.png" },
            { itemName = "money", label = "2.500.000$", chance = 6, sellCredit = 2500, itemType = "rare", itemCount = 2500000, giveItemType = "money", image = "./images/items/money-3.png" },
            { itemName = "money", label = "4.000.000$", chance = 4, sellCredit = 2500, itemType = "rare", itemCount = 4000000, giveItemType = "money", image = "./images/items/money-4.png" },
            { itemName = "coins", label = "4000 Coins", chance = 10, sellCredit = 4000, itemType = "mythical", itemCount = 4000, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "8000 Coins", chance = 0.5, sellCredit = 8000, itemType = "legendary", itemCount = 8000, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "911techart", label = "Porsche 911 Techart", chance = 8, sellCredit = 3500, itemType = "mythical", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/911techart.png" },
            { itemName = "718boxster", label = "Porsche 718 Boxster", chance = 7, sellCredit = 3500, itemType = "mythical", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/718boxster.png" },
            { itemName = "x7m60iprzemo", label = "BMW X7M60i", chance = 15, sellCredit = 3500, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/x7m60iprzemo.png" },
            { itemName = "demon", label = "Dodge SRT Demon", chance = 13, sellCredit = 3500, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/demon.png" },
            { itemName = "bugatticentodieci", label = "Bugatto Centodieci", chance = 6, sellCredit = 3500, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/bugatticentodieci.png" },
            { itemName = "bc", label = "Pagani Huayra BC", chance = 5, sellCredit = 3500, itemType = "legendary", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/rh_huayrabc-60.png" },
        },
    },
    {
        uniqueId = 2, -- IDs must be different and sequential
        label = "Bingo Case",
        price = 3000,
        priceType = "COINS", -- COINS OR SC
        caseTheme = "orange", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = false, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "weapon_vsco", label = "Sniper VSCO", chance = 1.5, sellCredit = 2700, itemType = "legendary", itemCount = 1, giveItemType = "weapon", image = "./images/automne/vsco.png" },
            { itemName = "weapon_militarm4", label = "M4-MILITAIRE", chance = 3, sellCredit = 2700, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/automne/militarm4.png" },
            { itemName = "weapon_tec9mb", label = "Tec9 green", chance = 5, sellCredit = 2700, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/automne/tec9mb.png" },
            { itemName = "weapon_tec9mf", label = "Tec9 RED", chance = 5, sellCredit = 2700, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/automne/tec9mf.png" },
            { itemName = "weapon_sig550", label = "Sig550", chance = 5, sellCredit = 2700, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/automne/sig550.png" },
            { itemName = "weapon_kinetic", label = "Kinetic", chance = 5, sellCredit = 2700, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/automne/kinetic.png" },
            { itemName = "weapon_scarsc", label = "Micro-scar", chance = 5, sellCredit = 2700, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/automne/scarsc.png" },
            { itemName = "weapon_grau", label = "Grau", chance = 5, sellCredit = 2700, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/automne/grau.png" },
            { itemName = "money", label = "800.000$", chance = 10, sellCredit = 1500, itemType = "rare", itemCount = 800000, giveItemType = "money", image = "./images/items/money-1.png" },
            { itemName = "money", label = "1.000.000$", chance = 8, sellCredit = 1500, itemType = "rare", itemCount = 1000000, giveItemType = "money", image = "./images/items/money-2.png" },
            { itemName = "money", label = "2.500.000$", chance = 6, sellCredit = 1500, itemType = "rare", itemCount = 2500000, giveItemType = "money", image = "./images/items/money-3.png" },
            { itemName = "money", label = "4.000.000$", chance = 4, sellCredit = 1500, itemType = "rare", itemCount = 4000000, giveItemType = "money", image = "./images/items/money-4.png" },
            { itemName = "coins", label = "2500 Coins", chance = 12, sellCredit = 2500, itemType = "common", itemCount = 2500, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "4000 Coins", chance = 5, sellCredit = 4000, itemType = "mythical", itemCount = 4000, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "7000 Coins", chance = 0.5, sellCredit = 7000, itemType = "legendary", itemCount = 7000, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "panamera18", label = "Porche Panamera", chance = 8, sellCredit = 2700, itemType = "mythical", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/panamera18.png" },
            { itemName = "keyrus2", label = "Urus Mansory", chance = 10, sellCredit = 2700, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/keyrus2.png" },
            { itemName = "cullinann", label = "Rolls royce cullinann", chance = 15, sellCredit = 2700, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/cullinann.png" },
            { itemName = "clssb", label = "CLS 63 AMG", chance = 15, sellCredit = 2700, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/clssb.png" },
            { itemName = "cabrera", label = "Lamborghini cabrera", chance = 15, sellCredit = 2700, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/cabrera.png" },
            { itemName = "brabus500", label = "Brabus 500", chance = 15, sellCredit = 2700, itemType = "common", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/brabus500.png" },
            { itemName = "avj", label = "Lamborghini avj", chance = 15, sellCredit = 2700, itemType = "common", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/avj.png" },
            { itemName = "amggt63", label = "Brabus Rocket 900", chance = 15, sellCredit = 2700, itemType = "common", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/amggt63.png" },
        },
    },
     {
         uniqueId = 3, -- IDs must be different and sequential
         label = "Coins Case",
         price = 500,
         priceType = "COINS", -- COINS OR SC
         caseTheme = "purple", -- red, blue, orange, purple, green
         caseType = "premium",
         isNew = false, -- If you set it true, the case will be labeled "new"
         items = {
            { itemName = "coins", label = "200 Coins", chance = 20, sellCredit = 200, itemType = "common", itemCount = 200, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "300 Coins", chance = 15, sellCredit = 300, itemType = "common", itemCount = 300, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "400 Coins", chance = 10, sellCredit = 400, itemType = "common", itemCount = 400, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "500 Coins", chance = 8, sellCredit = 500, itemType = "common", itemCount = 500, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "550 Coins", chance = 5, sellCredit = 550, itemType = "common", itemCount = 550, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "800 Coins", chance = 0.4, sellCredit = 800, itemType = "common", itemCount = 800, giveItemType = "coins", image = "./images/src//coinListCoinImg.png" },
            { itemName = "coins", label = "1000 Coins", chance = 0.4, sellCredit = 1000, itemType = "common", itemCount = 1000, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "1500 Coins", chance = 0.3, sellCredit = 1500, itemType = "common", itemCount = 1500, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "5000 Coins", chance = 0.2, sellCredit = 5000, itemType = "common", itemCount = 5000, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "8000 Coins", chance = 0.2, sellCredit = 8000, itemType = "common", itemCount = 8000, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "10000 Coins", chance = 0.1, sellCredit = 10000, itemType = "common", itemCount = 10000, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "200 Coins", chance = 20, sellCredit = 200, itemType = "common", itemCount = 200, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "300 Coins", chance = 15, sellCredit = 300, itemType = "common", itemCount = 300, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "400 Coins", chance = 10, sellCredit = 400, itemType = "common", itemCount = 400, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "500 Coins", chance = 8, sellCredit = 500, itemType = "common", itemCount = 500, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "550 Coins", chance = 5, sellCredit = 550, itemType = "common", itemCount = 550, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "800 Coins", chance = 0.4, sellCredit = 800, itemType = "common", itemCount = 800, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "1000 Coins", chance = 0.4, sellCredit = 1000, itemType = "common", itemCount = 1000, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "1500 Coins", chance = 0.3, sellCredit = 1500, itemType = "common", itemCount = 1500, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "5000 Coins", chance = 0.2, sellCredit = 5000, itemType = "common", itemCount = 5000, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "8000 Coins", chance = 0.2, sellCredit = 8000, itemType = "common", itemCount = 8000, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "10000 Coins", chance = 0.1, sellCredit = 10000, itemType = "common", itemCount = 10000, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
         },
     },
     {
         uniqueId = 4, -- IDs must be different and sequential
         label = "Case Toy Hot Speed",
         price = 2500,
         priceType = "COINS", -- COINS OR SC
         caseTheme = "blue", -- red, blue, orange, purple, green
         caseType = "premium",
         isNew = false, -- If you set it true, the case will be labeled "new"
         items = {
            { itemName = "coins", label = "1500 Coins", chance = 9, sellCredit = 1500, itemType = "common", itemCount = 1500, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "2000 Coins", chance = 1.5, sellCredit = 2000, itemType = "common", itemCount = 2000, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "4000 Coins", chance = 2.5, sellCredit = 4000, itemType = "common", itemCount = 4000, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "money", label = "800.000$", chance = 8, sellCredit = 1000, itemType = "common", itemCount = 800000, giveItemType = "money", image = "./images/items/money-1.png" },
            { itemName = "money", label = "1.000.000$", chance = 6, sellCredit = 1000, itemType = "rare", itemCount = 1000000, giveItemType = "money", image = "./images/items/money-2.png" },
            { itemName = "money", label = "1.500.000$", chance = 4, sellCredit = 1000, itemType = "mythical", itemCount = 1500000, giveItemType = "money", image = "./images/items/money-3.png" },
            { itemName = "money", label = "2.000.000$", chance = 4, sellCredit = 1000, itemType = "legendary", itemCount = 2000000, giveItemType = "money", image = "./images/items/money-4.png" },
            { itemName = "PV_bmwe36", label = "Bmw e36 Toy", chance = 4, sellCredit = 2000, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/PV_bmwe36.png" },
            { itemName = "PV_bugatti", label = "Bugatti Chiron Toy", chance = 4, sellCredit = 2000, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/PV_bugatti.png" },
            { itemName = "PV_bugvr", label = "Bugatti Veron Toy", chance = 4, sellCredit = 2000, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/PV_bugvr.png" },
            { itemName = "PV_dawn", label = "Roll Royce Toy", chance = 4, sellCredit = 2000, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/PV_dawn.png" },
            { itemName = "PV_gtr", label = "Gtr Toy", chance = 4, sellCredit = 2000, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/PV_gtr.png" },
            { itemName = "PV_jeep", label = "Jeep Toy", chance = 4, sellCredit = 2000, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/PV_jeep.png" },
            { itemName = "PV_lgss", label = "Lamborghini Toy", chance = 4, sellCredit = 2000, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/PV_lgss.png" },
            { itemName = "PV_rover", label = "Rover Toy", chance = 4, sellCredit = 2000, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/PV_rover.png" },
            { itemName = "PV_sianr", label = "Sian R Toy", chance = 4, sellCredit = 2000, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/PV_sianr.png" },
            { itemName = "PV_urus", label = "Urus Toy", chance = 4, sellCredit = 2000, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/PV_urus.png" },
         },
     },
     {
         uniqueId = 5, -- IDs must be different and sequential
         label = "Guérilla Case",
         price = 3500,
         priceType = "COINS", -- COINS OR SC
         caseTheme = "green", -- red, blue, orange, purple, green
         caseType = "premium",
         isNew = false, -- If you set it true, the case will be labeled "new"
         items = {
            { itemName = "gls63_de_dmz", label = "GLS 63 Blindé", chance = 5, sellCredit = 2500, itemType = "mythical", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/gls63_de_dmz.png" },
            { itemName = "m3f801", label = "M3 F801 Blindé", chance = 5, sellCredit = 2500, itemType = "mythical", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/m3f801.png" },
            { itemName = "brabus500", label = "Brabus 500 Blindé", chance = 5, sellCredit = 2500, itemType = "mythical", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/brabus500.png" },            { itemName = "brabus500", label = "Brabus 500 Blindé", chance = 5, sellCredit = 2500, itemType = "mythical", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/brabus500.png" },
            { itemName = "jeepg", label = "Jeep Gladiator Blindé", chance = 5, sellCredit = 2500, itemType = "mythical", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/jeepg.png" },
            { itemName = "coins", label = "4500 Coins", chance = 5, sellCredit = 4500, itemType = "common", itemCount = 4500, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "6000 Coins", chance = 2.5, sellCredit = 6000, itemType = "common", itemCount = 6000, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "7000 Coins", chance = 1.5, sellCredit = 7000, itemType = "common", itemCount = 7000, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "money", label = "800.000$", chance = 8, sellCredit = 2000, itemType = "common", itemCount = 800000, giveItemType = "money", image = "./images/items/money-1.png" },
            { itemName = "money", label = "1.000.000$", chance = 6, sellCredit = 2000, itemType = "rare", itemCount = 1000000, giveItemType = "money", image = "./images/items/money-2.png" },
            { itemName = "money", label = "2.000.000$", chance = 4, sellCredit = 2000, itemType = "mythical", itemCount = 2000000, giveItemType = "money", image = "./images/items/money-3.png" },
            { itemName = "money", label = "3.000.000$", chance = 4, sellCredit = 2000, itemType = "legendary", itemCount = 3000000, giveItemType = "money", image = "./images/items/money-4.png" },
            { itemName = "weapon_militaryrifle", label = "Military Rifle", chance = 2, sellCredit = 3000, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/automne/military-rifle.png" },
            { itemName = "weapon_shotgunk", label = "Pompe de Guerre", chance = 2, sellCredit = 3000, itemType = "legendary", itemCount = 1, giveItemType = "weapon", image = "./images/automne/shotgunk.png" },
            { itemName = "weapon_bayonet", label = "Bayonet de combat", chance = 10, sellCredit = 2000, itemType = "common", itemCount = 1, giveItemType = "weapon", image = "./images/automne/bayonet.png" },
            { itemName = "avenger", label = "avenger", chance = 5, sellCredit = 2500, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/avenger.png" },
            { itemName = "bc21tahoes", label = "Chevrolet tahoe", chance = 8, sellCredit = 3000, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/bc21tahoes.png" },
            { itemName = "jeep392", label = "JEEP 392", chance = 8, sellCredit = 3000, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/jeep392.png" },
            { itemName = "defenderoffp", label = "4x4 Defender", chance = 8, sellCredit = 3000, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/defenderoffp.png" },
            },
        },
     {
         uniqueId = 6, -- IDs must be different and sequential
         label = "Fantaisiste Case",
         price = 1000,
         priceType = "COINS", -- COINS OR SC
         caseTheme = "purple", -- red, blue, orange, purple, green
         caseType = "premium",
         isNew = false, -- If you set it true, the case will be labeled "new"
         items = {
            { itemName = "mbc63", label = "C63 AMG", chance = 10, sellCredit = 600, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/mbc63.png" },
            { itemName = "foxgt2", label = "Mclaren GT", chance = 10, sellCredit = 600, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/foxgt2.png" },
            { itemName = "fm488", label = "Ferrari 488", chance = 10, sellCredit = 600, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/fm488.png" },
            { itemName = "coins", label = "500 Coins", chance = 10, sellCredit = 500, itemType = "common", itemCount = 500, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "1500 Coins", chance = 5, sellCredit = 1500, itemType = "common", itemCount = 1500, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "3500 Coins", chance = 0.2, sellCredit = 3500, itemType = "common", itemCount = 3500, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "money", label = "500.000$", chance = 8, sellCredit = 500, itemType = "common", itemCount = 500000, giveItemType = "money", image = "./images/items/money-1.png" },
            { itemName = "money", label = "1.000.000$", chance = 6, sellCredit = 500, itemType = "rare", itemCount = 1000000, giveItemType = "money", image = "./images/items/money-2.png" },
            { itemName = "money", label = "1.500.000$", chance = 4, sellCredit = 500, itemType = "rare", itemCount = 1500000, giveItemType = "money", image = "./images/items/money-3.png" },
            { itemName = "money", label = "2.000.000$", chance = 4, sellCredit = 500, itemType = "legendary", itemCount = 2000000, giveItemType = "money", image = "./images/items/money-4.png" },
            { itemName = "weapon_m19", label = "M19", chance = 3, sellCredit = 600, itemType = "common", itemCount = 1, giveItemType = "weapon", image = "./images/automne/m19.png" },
            { itemName = "weapon_maze", label = "Batte rouiller", chance = 10, sellCredit = 600, itemType = "common", itemCount = 1, giveItemType = "weapon", image = "./images/automne/maze.png" },
            { itemName = "weapon_glock", label = "Glock-17", chance = 3, sellCredit = 600, itemType = "common", itemCount = 1, giveItemType = "weapon", image = "./images/automne/glock.png" },
            { itemName = "weapon_scarsc", label = "Mini-scar", chance = 0.5, sellCredit = 600, itemType = "legendary", itemCount = 1, giveItemType = "weapon", image = "./images/automne/scarsc.png" },
            { itemName = "buzzard2", label = "Buzzard", chance = 5, sellCredit = 600, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/buzzard2.png" },
            { itemName = "jlumma", label = "Jlumma CLR F", chance = 10, sellCredit = 600, itemType = "common", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/jlumma.png" },
            { itemName = "f812", label = "Ferrari 812", chance = 10, sellCredit = 600, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/f812.png" },
            { itemName = "bg700w", label = "4x4 Brabus", chance = 6, sellCredit = 600, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/bg700w.png" },
           -- { itemName = "weapon_hammer", label = "Marteau d'or", chance = 1, sellCredit = 600, itemType = "common", itemCount = 1, giveItemType = "weapon", image = "./images/automne/hammer.png" },
           -- { itemName = "weapon_penis", label = "Penis", chance = 1, sellCredit = 600, itemType = "common", itemCount = 1, giveItemType = "weapon", image = "./images/automne/penis.png" },
         },
     },
    {
        uniqueId = 7, -- IDs must be different and sequential
        label = "Noel Case",
        price = 1000,
        priceType = "COINS", -- COINS OR SC
        caseTheme = "red", -- red, blue, orange, purple, green
        caseType = "premium",
        isNew = true, -- If you set it true, the case will be labeled "new"
        items = {
            { itemName = "WEAPON_josm4a4ch", label = "M4 Noel", chance = 2, sellCredit = 750, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/xmasweap/m4noel.png" },
            { itemName = "WEAPON_GINGERBREAD", label = "AK47 Pain Epice", chance = 2, sellCredit = 750, itemType = "mythical", itemCount = 1, giveItemType = "weapon", image = "./images/xmasweap/akgringer.png" },
            { itemName = "WEAPON_CANDYCROW", label = "Batte Canne à sucre", chance = 5, sellCredit = 750, itemType = "rare", itemCount = 1, giveItemType = "weapon", image = "./images/xmasweap/candycrow.png" },
            { itemName = "WEAPON_SNOWHAMMER", label = "Marteau des Neiges", chance = 5, sellCredit = 750, itemType = "rare", itemCount = 1, giveItemType = "weapon", image = "./images/xmasweap/snowhammer.png" },
            { itemName = "WEAPON_SSGNOEL", label = "Sniper Noel SSG", chance = 0.5, sellCredit = 750, itemType = "legendary", itemCount = 1, giveItemType = "weapon", image = "./images/xmasweap/ssg.png" },
            { itemName = "money", label = "2.500.000$", chance = 2, sellCredit = 750, itemType = "rare", itemCount = 2500000, giveItemType = "money", image = "./images/items/money-1.png" },
            { itemName = "money", label = "4.000.000$", chance = 2, sellCredit = 750, itemType = "rare", itemCount = 4000000, giveItemType = "money", image = "./images/items/money-4.png" },
            { itemName = "coins", label = "1000 Coins", chance = 1, sellCredit = 1000, itemType = "mythical", itemCount = 1000, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "coins", label = "1750 Coins", chance = 0.5, sellCredit = 1750, itemType = "legendary", itemCount = 1750, giveItemType = "coins", image = "./images/src/coinListCoinImg.png" },
            { itemName = "renegadetrax", label = "Quad Neige", chance = 15, sellCredit = 750, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/voirdc.png" },
            { itemName = "newsnowmobile", label = "Moto Neige TRAX", chance = 15, sellCredit = 750, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/voirdc.png" },     
            { itemName = "mattrackesv", label = "Cadillac ESV Neige", chance = 15, sellCredit = 750, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/voirdc.png" },      
            { itemName = "mattrackh1", label = "Hummer Neige", chance = 15, sellCredit = 750, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/voirdc.png" },      
            { itemName = "mattrackx3", label = "Can-Am Neige", chance = 15, sellCredit = 750, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/voirdc.png" },    
            { itemName = "GODzDEERETRAX", label = "Camionette Neige", chance = 15, sellCredit = 750, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/voirdc.png" },    
            { itemName = "trax150", label = "Raptor 150 Neige", chance = 15, sellCredit = 750, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/voirdc.png" },    
            { itemName = "p1", label = "McLaren P1", chance = 5, sellCredit = 750, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/p1.png" },     
            { itemName = "microlight", label = "Micro Light", chance = 5, sellCredit = 750, itemType = "mythical", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/microlight.png" },     
            { itemName = "baller5", label = "Baller Blindé", chance = 7.5, sellCredit = 750, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/baller5.png" },    
            { itemName = "topcar720", label = "McLaren 720s Flocon", chance = 5, sellCredit = 750, itemType = "rare", itemCount = 1, giveItemType = "vehicle", image = "./images/vehicles/720c.png" },    
        },
    },
}


Cases.StandardCases = {
     {
         uniqueId = 1,
         label = "Case NO PERM",
         price = 400,
         priceType = "COINS", -- COINS OR SC
         caseTheme = "nude",
         isNew = true, -- If you set it true, the case will be labeled "new"
         items = {
             { itemName = "weapon_microsmg", label = "Uzi", chance = 10, sellCredit = 200, itemType = "common", itemCount = 1, giveItemType = "weapon", image = "./images/automne/weapon_microsmg.png" },
             { itemName = "weapon_smg", label = "SMG", chance = 10, sellCredit = 200, itemType = "common", itemCount = 1, giveItemType = "weapon", image = "./images/automne/weapon_smg.png" },
             { itemName = "weapon_machinepistol", label = "Tec 9", chance = 18, sellCredit = 200, itemType = "common", itemCount = 1, giveItemType = "weapon", image = "./images/automne/weapon_machinepistol.png" },
             { itemName = "weapon_pistol50", label = "Pistol 50", chance = 25, sellCredit = 200, itemType = "common", itemCount = 1, giveItemType = "weapon", image = "./images/automne/weapon_pistol50.png" },
             { itemName = "weapon_snspistol", label = "SNS Pistol", chance = 30, sellCredit = 200, itemType = "common", itemCount = 1, giveItemType = "weapon", image = "./images/automne/weapon_snspistol.png" },
         },
     },
}