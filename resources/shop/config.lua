-- ak4y dev.

-- IF YOU HAVE ANY PROBLEM OR DO YOU NEED HELP PLS COME TO MY DISCORD SERVER AND CREATE A TICKET
-- IF YOU DONT HAVE ANY PROBLEM YET AGAIN COME TO MY DISCORD :)
-- https://discord.gg/kWwM3Bx


AK4Y = {}

AK4Y.Framework = "esx" -- esx or newEsx
AK4Y.Mysql = "oxmysql" -- Check fxmanifest.lua when you change it! |  oxmysql / mysql-async
AK4Y.OpenMenuCommand = "shop" -- code to open the donate menu
AK4Y.WeaponType = "weapon" -- weapon or item
AK4Y.CustomPlatePriceOnBuyVehicle = 200 -- Customization price at the time of vehicle purchase
AK4Y.Phone = "gcphone" -- gcphone or qb-phone
AK4Y.MinCharForPhoneNumber = 1 -- Minimum number of characters required for a special number
AK4Y.MinCharForPlate = 1 -- Minimum number of characters required for a custom plate
AK4Y.MaxCharForPhoneNumber = 7 -- Minimum number of characters required for a special number
AK4Y.MaxCharForPlate = 8 -- Minimum number of characters required for a custom plate
AK4Y.DefaultGarage = 'pillboxgarage' -- Garage name where the vehicle will be sent after purchase
AK4Y.WeaponType = "weapon" -- item or weapon
AK4Y.UseTebex = false -- Do you use tebex to sell code?

AK4Y.GiveAddKeys = true -- Automatic key issuance after changing the license plate of the vehicle
AK4Y.GiveAddKeysFunction = function(newPlate)
    TriggerEvent("vehiclekeys:client:SetOwner", newPlate)
end

AK4Y.ClientNotify = function(text, NotifType)
end

AK4Y.Translate = {
    title1 = "BLUESTARK",
    title2 = "BOUTIQUE",

    speed = "km/h",
    credit = "COINS",

    customizeTitle = "Customize",
    customizeInfo = "You have to in your car which is want to customize.",

    thanksForPurchasing = "Merci d'avoir acheté !",

    buyCreditButton = "ACHETER COINS",
    approveButton = "VALIDER",
    buyButtonText = "ACHETER",
    testButtonText = "TESTER",

    redeemCodeTitle1 = "ACTIVER",
    redeemCodeTitle2 = "CODE",
    redeemCodeDesc = "Après avoir effectué un achat sur notre site tebex, vous recevrez un code que vous pouvez activer ici.",
    redeemCodeBelow = "VOUS POUVEZ ENTRER LE CODE CI-DESSOUS",

    carDoYouNeedTitle1 = "UNE",
    carDoYouNeedTitle2 = "VOITURE ?",
    carButtonBelow = "VOUS POUVEZ LE CONSULTER EN CLIQUANT SUR LE BOUTON CI-DESSOUS",
    carAreaDesc = "ALORS VOUS POUVEZ PARCOURIR LES VOITURES EN CLIQUANT SUR LE BOUTON CI-DESSOUS.",
    carButtonText = "VOITURE",
    carButtonInfo = "CLIQUEZ SUR LE BOUTON POUR VOIR LES VOITURES",
    
    otherInfo = "Cliquez pour plus de détails",
    otherButton = "PACKS",
    otherDesc = "Vous pouvez accéder au menu des packs en cliquant sur le bouton ci-dessus.",

    moneyInfo = "Cliquez pour plus de détails (non disponible)",
    moneyButtonText = "CAISSES",
    moneyDesc = "Vous pouvez accéder au menu d'achat de caisses en cliquant sur le bouton ci-dessus.",

    gunTitle1 = "UNE",
    gunTitle2 = "ARME ?",
    gunInfo = "VOUS POUVEZ LE CONSULTER EN CLIQUANT SUR LE BOUTON CI-DESSOUS",
    gunDesc = "ALORS VOUS POUVEZ PARCOURIR LES ARMES EN CLIQUANT SUR LE BOUTON CI-DESSOUS.",
    gunButtonText = "ARME",
    gunTinyInfo = "CLIQUEZ SUR LE BOUTON POUR VOIR LES ARMES.",

    vehBuyCustomPlateText = "Voulez-vous une plaque personnalisée ? <span id='cstmPltPrice'></span>",
    customPlateText = "Entrez votre plaque personnalisée (Max 6 caractères)",
    privNumberText = "Entrez votre numéro privé (Max 7 char.)",
    dontHaveEnoughtCredit = "Vous n'avez pas assez de coins !",
    minimumChar = "Minimum Char: ",
    MaximumChar = " Maximum Char: ",
    typeNumber = "You have to type number!",
    errorDuringPurchase = "Une erreur s'est produite pendant l'achat",
    insideVehicle = "Pour acheter cette personnalisation, vous devez être à l'intérieur du véhicule !",

    openSpam = "Attendez un moment pour ouvrir à nouveau le menu",
    spamNotify = "Protection anti-spam, essayez à nouveau",
}

-- Do not add new categories
-- If you want to remove a category, you can put it in the comment line
-- If you put a category in the comment line, put the products sold in that category in the comment line
-- you should not change categoryId
AK4Y.Categories = {
    { label = "VOITURES", categoryId = "vehicle" },
    { label = "MOTOS", categoryId = "motos" },
    { label = "ARMES", categoryId = "weapon" },
    { label = "PACKS", categoryId = "packs" },
    { label = "CAISSES", categoryId = "money" },
    -- { label = "AUTRES", categoryId = "other" },
}

AK4Y.Vehicles = {
    {
        id = 1,
        spawnName = "panto", -- Spawn code of the vehicle that will be given when the product is received
        brand = "BMW",
        model = "M4 Compétition 2022",
        year = "SPORTIVE",
        costCredit = 3500, -- The price to be paid for the product
        topSpeed = 420, -- Top speed of the product
        topSpeedGraph = 98, -- Percentage of product top speed
        brakingPower = 80, -- Percentage of braking power of the product
        robustness = 60, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1028705378516611194/1046850532351938651/speedm4rb.png",
    },
    {
        id = 2,
        spawnName = "rs322", -- Spawn code of the vehicle that will be given when the product is received
        brand = "AUDI",
        model = "RS3 2022",
        year = "SPORTIVE",
        costCredit = 2500, -- The price to be paid for the product
        topSpeed = 320, -- Top speed of the product
        topSpeedGraph = 90, -- Percentage of product top speed
        brakingPower = 80, -- Percentage of braking power of the product
        robustness = 60, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://media.discordapp.net/attachments/1028705378516611194/1040672411261083679/RS3-AV-removebg-preview.png",
    },
    {
        id = 3,
        spawnName = "gle53", -- Spawn code of the vehicle that will be given when the product is received
        brand = "MERCEDES",
        model = "AMG GLE 53 2022",
        year = "SUV SPORTIVE",
        costCredit = 3000, -- The price to be paid for the product
        topSpeed = 300, -- Top speed of the product
        topSpeedGraph = 90, -- Percentage of product top speed
        brakingPower = 80, -- Percentage of braking power of the product
        robustness = 60, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1028705378516611194/1046851240702779482/gle53.png",
    },
    {
        id = 4,
        spawnName = "mk8r", -- Spawn code of the vehicle that will be given when the product is received
        brand = "VOLKSWAGEN",
        model = "GOLF 8 R ABT",
        year = "SPORTIVE",
        costCredit = 2500, -- The price to be paid for the product
        topSpeed = 320, -- Top speed of the product
        topSpeedGraph = 90, -- Percentage of product top speed
        brakingPower = 80, -- Percentage of braking power of the product
        robustness = 60, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1028705378516611194/1046852664312467456/gcmgolf8r.png",
    },
    {
        id = 5,
        spawnName = "21rsq8", -- Spawn code of the vehicle that will be given when the product is received
        brand = "AUDI",
        model = "RSQ8",
        year = "SUV SPORTIVE",
        costCredit = 2500, -- The price to be paid for the product
        topSpeed = 300, -- Top speed of the product
        topSpeedGraph = 90, -- Percentage of product top speed
        brakingPower = 80, -- Percentage of braking power of the product
        robustness = 60, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1028705378516611194/1046853455471460533/21rsq8.png",
    },
    {
        id = 6,
        spawnName = "rs6mansory", -- Spawn code of the vehicle that will be given when the product is received
        brand = "AUDI",
        model = "RS6-MANSORY",
        year = "SPORTIVE",
        costCredit = 3000, -- The price to be paid for the product
        topSpeed = 350, -- Top speed of the product
        topSpeedGraph = 95, -- Percentage of product top speed
        brakingPower = 80, -- Percentage of braking power of the product
        robustness = 60, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1028705378516611194/1046854215064113162/RS6MANSORY.png",
    },
    {
        id = 7,
        spawnName = "rmodrs6r", -- Spawn code of the vehicle that will be given when the product is received
        brand = "AUDI",
        model = "RS6-R",
        year = "SPORTIVE",
        costCredit = 3000, -- The price to be paid for the product
        topSpeed = 260, -- Top speed of the product
        topSpeedGraph = 90, -- Percentage of product top speed
        brakingPower = 80, -- Percentage of braking power of the product
        robustness = 60, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://media.discordapp.net/attachments/1028705378516611194/1028712917031456798/7.rs6r-removebg-preview.png?width=500&height=281",
    },
    {
        id = 8,
        spawnName = "nm_corvette", -- Spawn code of the vehicle that will be given when the product is received
        brand = "CHEVROLET",
        model = "CORVETTE NITRO",
        year = "SPORTIVE",
        costCredit = 6000, -- The price to be paid for the product
        topSpeed = 440, -- Top speed of the product
        topSpeedGraph = 97, -- Percentage of product top speed
        brakingPower = 80, -- Percentage of braking power of the product
        robustness = 80, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1028705378516611194/1046863865448759316/nm_corvette.png",
    },
    {
        id = 9,
        spawnName = "plaid", -- Spawn code of the vehicle that will be given when the product is received
        brand = "TESLA",
        model = "MODEL S PLAID",
        year = "SPORTIVE",
        costCredit = 2000, -- The price to be paid for the product
        topSpeed = 300, -- Top speed of the product
        topSpeedGraph = 90, -- Percentage of product top speed
        brakingPower = 80, -- Percentage of braking power of the product
        robustness = 60, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1028705378516611194/1046855286205464656/plaid.png",
    },
    {
        id = 10,
        spawnName = "g900przemo6x6", -- Spawn code of the vehicle that will be given when the product is received
        brand = "MERCEDES",
        model = "G900 6x6 BRABUS",
        year = "SUV",
        costCredit = 2500, -- The price to be paid for the product
        topSpeed = 300, -- Top speed of the product
        topSpeedGraph = 85, -- Percentage of product top speed
        brakingPower = 58, -- Percentage of braking power of the product
        robustness = 80, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1028705378516611194/1046856263876747375/g900przemo6x6.png",
    },
    {
        id = 11,
        spawnName = "911venom", -- Spawn code of the vehicle that will be given when the product is received
        brand = "PORCHE",
        model = "911 VENOM",
        year = "SPORTIVE",
        costCredit = 3000, -- The price to be paid for the product
        topSpeed = 410, -- Top speed of the product
        topSpeedGraph = 95, -- Percentage of product top speed
        brakingPower = 70, -- Percentage of braking power of the product
        robustness = 50, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1028705378516611194/1046857161763979394/911venom.png",
    },
    {
        id = 12,
        spawnName = "2012GTR", -- Spawn code of the vehicle that will be given when the product is received
        brand = "NISSAN",
        model = "GT-R 2012",
        year = "SPORTIVE",
        costCredit = 2500, -- The price to be paid for the product
        topSpeed = 400, -- Top speed of the product
        topSpeedGraph = 93, -- Percentage of product top speed
        brakingPower = 80, -- Percentage of braking power of the product
        robustness = 60, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1028705378516611194/1046857713923129364/2012GTR.png",
    },
    {
        id = 13,
        spawnName = "2020g900", -- Spawn code of the vehicle that will be given when the product is received
        brand = "MERCEDES",
        model = "G900 BRABUS",
        year = "SUV SPORTIVE",
        costCredit = 2000, -- The price to be paid for the product
        topSpeed = 250, -- Top speed of the product
        topSpeedGraph = 70, -- Percentage of product top speed
        brakingPower = 60, -- Percentage of braking power of the product
        robustness = 60, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1028705378516611194/1046858438719840336/2020g900.png",
    },
    {
        id = 14,
        spawnName = "agerars", -- Spawn code of the vehicle that will be given when the product is received
        brand = "KOENIGSEGG",
        model = "Agera RS",
        year = "SUPER-SPORTIVE",
        costCredit = 2200, -- The price to be paid for the product
        topSpeed = 320, -- Top speed of the product
        topSpeedGraph = 80, -- Percentage of product top speed
        brakingPower = 75, -- Percentage of braking power of the product
        robustness = 70, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1028705378516611194/1046858994200879124/agerars.png", 
    },
    {
        id = 15,
        spawnName = "bmwm8", -- Spawn code of the vehicle that will be given when the product is received
        brand = "BMW",
        model = "M8 COMPETITION",
        year = "SPORTIVE",
        costCredit = 2500, -- The price to be paid for the product
        topSpeed = 330, -- Top speed of the product
        topSpeedGraph = 85, -- Percentage of product top speed
        brakingPower = 75, -- Percentage of braking power of the product
        robustness = 75, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1028705378516611194/1046859655772647524/bmwm8.png",
    },
    {
        id = 16,
        spawnName = "corvetteZR1", -- Spawn code of the vehicle that will be given when the product is received
        brand = "CHEVROLET",
        model = "CORVETTE ZR1",
        year = "SPORTIVE",
        costCredit = 2500, -- The price to be paid for the product
        topSpeed = 250, -- Top speed of the product
        topSpeedGraph = 70, -- Percentage of product top speed
        brakingPower = 60, -- Percentage of braking power of the product
        robustness = 60, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1028705378516611194/1046860284721102848/corvetteZR1.png",
    },
    {
        id = 17,
        spawnName = "divo", -- Spawn code of the vehicle that will be given when the product is received
        brand = "BUGATTI",
        model = "DIVO",
        year = "SUPER-SPORTIVE",
        costCredit = 2500, -- The price to be paid for the product
        topSpeed = 290, -- Top speed of the product
        topSpeedGraph = 80, -- Percentage of product top speed
        brakingPower = 80, -- Percentage of braking power of the product
        robustness = 70, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1028705378516611194/1046861135716040797/divo.png",
    },
    {
        id = 18,
        spawnName = "j50", -- Spawn code of the vehicle that will be given when the product is received
        brand = "FERRARI",
        model = "J50",
        year = "SUPER-SPORTIVE",
        costCredit = 2500, -- The price to be paid for the product
        topSpeed = 300, -- Top speed of the product
        topSpeedGraph = 80, -- Percentage of product top speed
        brakingPower = 60, -- Percentage of braking power of the product
        robustness = 70, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1028705378516611194/1046861883203924059/j50.png",
    },
    {
        id = 19,
        spawnName = "keyrus2", -- Spawn code of the vehicle that will be given when the product is received
        brand = "LAMBORGHINI",
        model = "URUS MANSORY",
        year = "SUV SPORTIVE",
        costCredit = 3000, -- The price to be paid for the product
        topSpeed = 250, -- Top speed of the product
        topSpeedGraph = 70, -- Percentage of product top speed
        brakingPower = 85, -- Percentage of braking power of the product
        robustness = 70, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1028705378516611194/1046862398650331156/keyrus2.png",
    },
    {
        id = 20,
        spawnName = "rmodaudirs7", -- Spawn code of the vehicle that will be given when the product is received
        brand = "AUDI",
        model = "RS7-R",
        year = "SPORTIVE",
        costCredit = 2500, -- The price to be paid for the product
        topSpeed = 270, -- Top speed of the product
        topSpeedGraph = 80, -- Percentage of product top speed
        brakingPower = 70, -- Percentage of braking power of the product
        robustness = 75, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://media.discordapp.net/attachments/1028705378516611194/1028713091627765771/19.rs7r-removebg-preview.png?width=500&height=281",
    },
    {
        id = 21,
        spawnName = "mvisiongt", -- Spawn code of the vehicle that will be given when the product is received
        brand = "MERCEDES",
        model = "AMG VISION GT",
        year = "SPORTIVE FUTUR",
        costCredit = 5000, -- The price to be paid for the product
        topSpeed = 350, -- Top speed of the product
        topSpeedGraph = 80, -- Percentage of product top speed
        brakingPower = 70, -- Percentage of braking power of the product
        robustness = 70, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1028705378516611194/1046862980039577701/mvisiongt.png",
    },
    {
        id = 22,
        spawnName = "golf8gti", -- Spawn code of the vehicle that will be given when the product is received
        brand = "VOLKSWAGEN",
        model = "GOLF 8 GTI",
        year = "SPORTIVE",
        costCredit = 1500, -- The price to be paid for the product
        topSpeed = 260, -- Top speed of the product
        topSpeedGraph = 75, -- Percentage of product top speed
        brakingPower = 70, -- Percentage of braking power of the product
        robustness = 70, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1028705378516611194/1046866283473420360/golf8gti.png",
    },
    {
        id = 23,
        spawnName = "m3e30", -- Spawn code of the vehicle that will be given when the product is received
        brand = "BMW",
        model = "M3 E30",
        year = "DRIFT",
        costCredit = 1500, -- The price to be paid for the product
        topSpeed = 250, -- Top speed of the product
        topSpeedGraph = 75, -- Percentage of product top speed
        brakingPower = 60, -- Percentage of braking power of the product
        robustness = 40, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1028705378516611194/1046867042411761724/m3e30.png",
    },
    {
        id = 24,
        spawnName = "centuria", -- Spawn code of the vehicle that will be given when the product is received
        brand = "BUGATTI",
        model = "CENTURIA MANSORY",
        year = "SUPERSPORTIVE",
        costCredit = 3500, -- The price to be paid for the product
        topSpeed = 360, -- Top speed of the product
        topSpeedGraph = 89, -- Percentage of product top speed
        brakingPower = 80, -- Percentage of braking power of the product
        robustness = 70, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1028705378516611194/1046867566817189948/centuria.png",
    },
    {
        id = 25,
        spawnName = "765lt", -- Spawn code of the vehicle that will be given when the product is received
        brand = "MCLAREN",
        model = "765LT",
        year = "SUPERSPORTIVE",
        costCredit = 2000, -- The price to be paid for the product
        topSpeed = 320, -- Top speed of the product
        topSpeedGraph = 75, -- Percentage of product top speed
        brakingPower = 70, -- Percentage of braking power of the product
        robustness = 70, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1028705378516611194/1046868153633865940/765lt.png",
    },
}

AK4Y.Motos = {
    {
        id = 1,
        spawnName = "20r1", -- Spawn code of the vehicle that will be given when the product is received
        brand = "YAMAHA",
        model = "R1",
        year = "SPORTIVE",
        costCredit = 2000, -- The price to be paid for the product
        topSpeed = 305, -- Top speed of the product
        topSpeedGraph = 90, -- Percentage of product top speed
        brakingPower = 80, -- Percentage of braking power of the product
        robustness = 60, -- Percentage of product robustness
        vehType = "motorcycle", -- do not change
        carImage = "https://media.discordapp.net/attachments/1028705378516611194/1028713188725899314/32.r1m-removebg-preview.png?width=500&height=281",
    },
    {
        id = 2,
        spawnName = "ksd", -- Spawn code of the vehicle that will be given when the product is received
        brand = "KTM",
        model = "SuperDuke R 1290",
        year = "ROADSTER",
        costCredit = 1750, -- The price to be paid for the product
        topSpeed = 300, -- Top speed of the product
        topSpeedGraph = 90, -- Percentage of product top speed
        brakingPower = 80, -- Percentage of braking power of the product
        robustness = 60, -- Percentage of product robustness
        vehType = "motorcycle", -- do not change
        carImage = "https://media.discordapp.net/attachments/1028705378516611194/1028713170778456064/28.1290r-removebg-preview.png?width=500&height=281",
    },
    {
        id = 3,
        spawnName = "xt700", -- Spawn code of the vehicle that will be given when the product is received
        brand = "YAMAHA",
        model = "Ténéré 700",
        year = "TRAIL",
        costCredit = 1750, -- The price to be paid for the product
        topSpeed = 270, -- Top speed of the product
        topSpeedGraph = 70, -- Percentage of product top speed
        brakingPower = 75, -- Percentage of braking power of the product
        robustness = 60, -- Percentage of product robustness
        vehType = "motorcycle", -- do not change
        carImage = "https://media.discordapp.net/attachments/1028705378516611194/1028713171227258950/29.tracer-removebg-preview.png?width=499&height=281",
    },
    {
        id = 4,
        spawnName = "tmaxdx", -- Spawn code of the vehicle that will be given when the product is received
        brand = "YAMAHA",
        model = "TMax",
        year = "SCOOTER",
        costCredit = 1000, -- The price to be paid for the product
        topSpeed = 200, -- Top speed of the product
        topSpeedGraph = 70, -- Percentage of product top speed
        brakingPower = 75, -- Percentage of braking power of the product
        robustness = 60, -- Percentage of product robustness
        vehType = "motorcycle", -- do not change
        carImage = "https://media.discordapp.net/attachments/1028705378516611194/1028713188109336657/31.tmaxdx-removebg-preview.png?width=500&height=281",
    },
    {
        id = 5,
        spawnName = "20xmax", -- Spawn code of the vehicle that will be given when the product is received
        brand = "YAMAHA",
        model = "XMAX",
        year = "SCOOTER",
        costCredit = 1000, -- The price to be paid for the product
        topSpeed = 200, -- Top speed of the product
        topSpeedGraph = 70, -- Percentage of product top speed
        brakingPower = 75, -- Percentage of braking power of the product
        robustness = 60, -- Percentage of product robustness
        vehType = "motorcycle", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1046581482698854570/1046870157332590683/20xmax.png",
    },
    {
        id = 6,
        spawnName = "flhxs_streetglide_special18", -- Spawn code of the vehicle that will be given when the product is received
        brand = "HARLEY-DAVIDSON",
        model = "FLHXS",
        year = "BIKER",
        costCredit = 1500, -- The price to be paid for the product
        topSpeed = 250, -- Top speed of the product
        topSpeedGraph = 70, -- Percentage of product top speed
        brakingPower = 75, -- Percentage of braking power of the product
        robustness = 60, -- Percentage of product robustness
        vehType = "motorcycle", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1046581482698854570/1046871154327040171/flhxs_streetglide_special18.png",
    },
    {
        id = 7,
        spawnName = "HDIron883", -- Spawn code of the vehicle that will be given when the product is received
        brand = "HARLEY-DAVIDSON",
        model = "2022 IRON 883",
        year = "BIKER",
        costCredit = 1500, -- The price to be paid for the product
        topSpeed = 250, -- Top speed of the product
        topSpeedGraph = 70, -- Percentage of product top speed
        brakingPower = 75, -- Percentage of braking power of the product
        robustness = 60, -- Percentage of product robustness
        vehType = "motorcycle", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1046581482698854570/1046871694230421614/HDIron883.png",
    },
    {
        id = 8,
        spawnName = "hvrod", -- Spawn code of the vehicle that will be given when the product is received
        brand = "HARLEY-DAVIDSON",
        model = "hvrod",
        year = "BIKER",
        costCredit = 1500, -- The price to be paid for the product
        topSpeed = 250, -- Top speed of the product
        topSpeedGraph = 70, -- Percentage of product top speed
        brakingPower = 75, -- Percentage of braking power of the product
        robustness = 60, -- Percentage of product robustness
        vehType = "motorcycle", -- do not change
        carImage = "https://cdn.discordapp.com/attachments/1046581482698854570/1046872218866552974/hvrod.png",
    },
}

AK4Y.Packs = {
    { 
        id = 1,
        itemName = "pack_1",
        label = "Pack Level 1",
        costCredit = 1000, 
        image = "https://media.discordapp.net/attachments/1028943719598133329/1028943903749046282/Pack_1.png?width=800&height=420",
        rewardsItems = {
            ["bread"] = 20,
            ["water"] = 20,
            ["fixkit"] = 10,
            ["radio"] = 1,
            ["phone"] = 1,
        },
        rewardsMoney = {
            ["cash"] = 150000,
        },
        rewardsWeapons = {
            ["weapon_flaregun"] = true,
        },
        rewardsVehicles = {},
    },
    { 
        id = 2,
        itemName = "pack_2",
        label = "Pack Level 2",
        costCredit = 2500, 
        image = "https://media.discordapp.net/attachments/1028943719598133329/1028943904084602890/Pack_2.png?width=800&height=420",
        rewardsItems = {
            ["bread"] = 50,
            ["water"] = 50,
            ["fixkit"] = 25,
            ["radio"] = 1,
            ["phone"] = 1,
        },
        rewardsMoney = {
            ["cash"] = 300000,
        },
        rewardsWeapons = {
            ["weapon_flaregun"] = true,
            ["weapon_snspistol"] = true,
        },
        rewardsVehicles = {
            ["mule"] = true,
            ["tmaxdx"] = true,
        },
    },
    { 
        id = 3,
        itemName = "pack_3",
        label = "Pack Level 3",
        costCredit = 4500, 
        image = "https://media.discordapp.net/attachments/1028943719598133329/1028943904457883688/Pack_3.png?width=800&height=420",
        rewardsItems = {
            ["bread"] = 80,
            ["water"] = 80,
            ["fixkit"] = 40,
            ["radio"] = 1,
            ["phone"] = 1,
        },
        rewardsMoney = {
            ["cash"] = 400000,
        },
        rewardsWeapons = {
            ["weapon_flaregun"] = true,
            ["weapon_pistol50"] = true,
        },
        rewardsVehicles = {
            ["pounder"] = true,
            ["ksd"] = true,
            ["deveste"] = true
        },
    },
    { 
        id = 4,
        itemName = "pack_4",
        label = "Pack Level 4",
        costCredit = 6000, 
        image = "https://media.discordapp.net/attachments/1028943719598133329/1028943904927658084/Pack_4.png?width=800&height=420",
        rewardsItems = {
            ["bread"] = 125,
            ["water"] = 125,
            ["fixkit"] = 75,
            ["radio"] = 1,
            ["phone"] = 1,
        },
        rewardsMoney = {
            ["cash"] = 600000,
        },
        rewardsWeapons = {
            ["weapon_flaregun"] = true,
            ["weapon_compactrifle"] = true,
        },
        rewardsVehicles = {
            ["rmodmk7"] = true,
            ["xt700"] = true,
            ["trailers2"] = true,
            ["phantom"] = true,
        },
    },
    { 
        id = 5,
        itemName = "pack_5",
        label = "Pack Orga",
        costCredit = 8000, 
        image = "https://media.discordapp.net/attachments/1028720245503967232/1030952514281017514/pack_organisation.png?width=1277&height=671",
        rewardsItems = {},
        rewardsMoney = {},
        rewardsWeapons = {},
        rewardsVehicles = {},
    },
    { 
        id = 6,
        itemName = "pack_6",
        label = "Pack Orga (ventes armes)",
        costCredit = 18000, 
        image = "https://media.discordapp.net/attachments/1028720245503967232/1030952513815461928/pack_orga_armes.png?width=1277&height=671",
        rewardsItems = {},
        rewardsMoney = {},
        rewardsWeapons = {},
        rewardsVehicles = {},
    },
    { 
        id = 7,
        itemName = "pack_7",
        label = "Pack Entreprise de Farm",
        costCredit = 8000, 
        image = "https://media.discordapp.net/attachments/1028720245503967232/1030952513261817926/pack_entreprise.png?width=1277&height=671",
        rewardsItems = {},
        rewardsMoney = {},
        rewardsWeapons = {},
        rewardsVehicles = {},
    },
}


AK4Y.Weapons = {
    { 
        id = 1,
        weaponName = "WEAPON_AKFROST",
        label = "AK-47 FROST",
        costCredit = 3000, 
        image = "https://media.discordapp.net/attachments/1028718654348595201/1054860985950818344/akfrost.png",
    },
    { 
        id = 2,
        weaponName = "WEAPON_M4GINGER",
        label = "M4 GINGER",
        costCredit = 2500, 
        image = "https://media.discordapp.net/attachments/1028718654348595201/1054860985569128489/m4gringer.png",
    },
    { 
        id = 3,
        weaponName = "weapon_navyrevolver",
        label = "NAVY REVOLVER",
        costCredit = 1500, 
        image = "https://media.discordapp.net/attachments/1028718654348595201/1054862023403507782/navyrevolver.png",
    },
    { 
        id = 4,
        weaponName = "weapon_combatpdw",
        label = "ADP DE COMBAT",
        costCredit = 2500, 
        image = "https://media.discordapp.net/attachments/1028718654348595201/1054862023772622889/adp.png",
    },
    { 
        id = 5,
        weaponName = "weapon_sawnoffshotgun",
        label = "Canon scié",
        costCredit = 2500, 
        image = "https://media.discordapp.net/attachments/1028718654348595201/1048286224235888701/canonscie.png",
    },
    { 
        id = 6,
        weaponName = "weapon_compactrifle",
        label = "Ak-U",
        costCredit = 2500, 
        image = "https://media.discordapp.net/attachments/1028718654348595201/1048284937389887498/aku.png",
    },
    { 
        id = 7,
        weaponName = "WEAPON_assaultrifle",
        label = "AK-47",
        costCredit = 2500, 
        image = "https://media.discordapp.net/attachments/1028718654348595201/1054862356808749056/ak47.png",
    },
}

AK4Y.Customize = {
    {id = 1, label = "PRIVATE PHONE NUMBER", costCredit = 50, IType = "privNumber", image = "./images/phone.png"},
    {id = 2, label = "PLATE CUSTOMIZATION", costCredit = 50, IType = "customPlate", image = "./images/platee.png"}
}