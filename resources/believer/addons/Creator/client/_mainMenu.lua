GM.Creator = GM.Creator or {}

GM.Creator = {
    menu = {
        submenus = {}
    },
    data = {
        index_sexe = 1,
        sexe = "Homme",
        Indexsexe = 1,
        Motherindex = 1,
        DadIndex = 1,
        PeauCoulour = 5,
        PeauCoulour2 = 0.5;
        Ressemblance = 5,
        Ressemblance2 = 0.5,

        Hairindex = 1,
        Beardindex = 1,
        Indexeyebow = 1,
        EyexIndex = 1,
        NoseoneIndex = 1,

        Hairlist = {},
        BeardList = {},
        EyebowList = {},
        EyesColorList = {},
        NosoneList = {},

        ColorHair = {
            primary = {1, 1},
            secondary = {1, 1},
        },

        ColorBeard = {
            primary = {1, 1},
            secondary = {1, 1},
        },

        ColorEyebow = {
            primary = {1, 1},
            secondary = {1, 1},
        },

        OpaPercent = 0,
        OpePercentEyebow = 0,
        PercentLargenose = 0,
        PercentHauteurnose = 0,
        PercentCrochuNose = 0,
        PercentJoueHauteur = 0,
        PercentJoueCreux = 0,
        PercentJoueCreuxx = 0,
        PercentMacoire1 = 0,
        PercentMacoire2 = 0,
        PercentMentonHauteur = 0,
        PercentMentonLargeur = 0,
        DadList = {"Benjamin", "Daniel", "Joshua", "Noah", "Andrew", "Juan", "Alex", "Isaac", "Evan", "Ethan", "Vincent", "Angel", "Diego", "Adrian", "Gabriel", "Michael", "Santiago", "Kevin", "Louis", "Samuel", "Anthony", "Pierre", "Niko"},
        MotherList = {"Adelyn", "Emily", "Abigail", "Beverly", "Kristen", "Hailey", "June", "Daisy", "Elizabeth", "Addison", "Ava", "Cameron", "Samantha", "Madison", "Amber", "Heather", "Hillary", "Courtney", "Ashley", "Alyssa", "Mia", "Brittany"},
    },
}

GM:newThread(function()
    for i = 1, 190 do
        table.insert(GM.Creator.data.Hairlist, i)
    end
    for i = 1, 28 do 
        table.insert(GM.Creator.data.BeardList, i)
    end
    for i = 1, 73 do 
        table.insert(GM.Creator.data.EyebowList, i)
    end
    for i = 1, 31 do
        table.insert(GM.Creator.data.EyesColorList, i)
    end
end)

GM.Creator.menu.main = RageUI.CreateMenu("", "CREATOR", 0, 0, "banner", "bluestark")
GM.Creator.menu.main["Closable"] = false
GM.Creator.menu.main["Closed"] = function()
    -- Todo event this for safety
end

GM.Creator.menu.submenus["appareance"] = RageUI.CreateSubMenu(GM.Creator.menu.main, "", "Apparence")
GM.Creator.menu.submenus["appareance"]["EnableMouse"] = true
GM.Creator.menu.submenus["appareance"]["Closable"] = false

GM.Creator.menu.submenus["character"] = RageUI.CreateSubMenu(GM.Creator.menu.main, "", "Personnage")
GM.Creator.menu.submenus["character"]["EnableMouse"] = true
GM.Creator.menu.submenus["character"]["Closable"] = false

GM.Creator.menu.main:isVisible(function(Items)
    Items:Button("Prénom", nil, { RightLabel = GM.Creator.data.first_name}, true, {
        onSelected = function()
            local input = exports["input"]:openInput({
                label = "Choisissez votre prénom",
                submitLabel = "VALIDER",
                placeHolders = {
                    {label = "Prénom"},
                }
            })
            GM.Creator.data.first_name = input["0"]
        end
    })
    Items:Button("Nom", nil, { RightLabel = GM.Creator.data.last_name}, true, {
        onSelected = function()
            local input = exports["input"]:openInput({
                label = "Choisissez votre nom",
                submitLabel = "VALIDER",
                placeHolders = {
                    {label = "Nom"},
                }
            })
            GM.Creator.data.last_name = input["0"]
        end
    })
    Items:Button("Date de naissance", nil, { RightLabel = GM.Creator.data.dateofbirth}, true, {
        onSelected = function()
            local input = exports["input"]:openInput({
                label = "Choisissez votre date de naissance",
                submitLabel = "VALIDER",
                placeHolders = {
                    {label = "Date de naissance (DD/MM/YY)"},
                }
            })
            GM.Creator.data.dateofbirth = input["0"]
        end
    })
    Items:Button("Taille", nil, { RightLabel = GM.Creator.data.height}, true, {
        onSelected = function()
            local input = exports["input"]:openInput({
                label = "Choisissez votre taille",
                submitLabel = "VALIDER",
                placeHolders = {
                    {label = "Taille"},
                }
            })
            GM.Creator.data.height = input["0"]
        end
    })
    Items:List("Sexe", {"Homme", "Femme"}, GM.Creator.data.index_sexe, nil, {}, true, {
        onListChange = function(Index, Item)
            GM.Creator.data.index_sexe = Index
            if (GM.Creator.data.index_sexe == 1) then
                GM.Creator.data.sex = "Homme"
            elseif (GM.Creator.data.index_sexe == 2) then
                GM.Creator.data.sex = "Femme"
            end
        end,
        onSelected = function(index)
            if index == 1 then
                TriggerEvent("skinchanger:change", "sex", 0)

            elseif index == 2 then
                TriggerEvent("skinchanger:change", "sex", 1)
            end
        end
    })
    Items:Button("Confirmer votre identité", nil, {}, GM.Creator.data.first_name ~= nil and GM.Creator.data.last_name ~= nil and GM.Creator.data.dateofbirth ~= nil and GM.Creator.data.height ~= nil and GM.Creator.data.sex ~= nil, {
        onSelected = function()
            TriggerServerEvent("Creator:createIdentity", {
                first_name = GM.Creator.data.first_name,
                last_name = GM.Creator.data.last_name,
                dateofbirth = GM.Creator.data.dateofbirth,
                height = GM.Creator.data.height,
                sex = GM.Creator.data.sex,
            })
        end
    }, GM.Creator.menu.submenus["appareance"])
end)

GM.Creator.menu.submenus["appareance"]:isVisible(function(Items)
    RageUI.Window.Heritage(GM.Creator.data.Motherindex, GM.Creator.data.DadIndex)
    Items:List("Père", GM.Creator.data.DadList, GM.Creator.data.DadIndex, nil, {}, true, {
        onListChange = function(Index, Item)
            GM.Creator.data.DadIndex = Index
            TriggerEvent("skinchanger:change", "dad", GM.Creator.data.DadIndex)
        end,
    })
    Items:List("Mère", GM.Creator.data.MotherList, GM.Creator.data.Motherindex, nil, {}, true, {
        onListChange = function(Index, Item)
            GM.Creator.data.Motherindex = Index
            TriggerEvent("skinchanger:change", "mom", GM.Creator.data.Motherindex)
        end,
    })
    Items:UISliderHeritage("Couleur de peau", GM.Creator.data.PeauCoulour, nil, {
        onSliderChange = function(Float, Index)
            GM.Creator.data.PeauCoulour = Index 
            GM.Creator.data.PeauCoulour2 = Index*10 
            TriggerEvent("skinchanger:change", "skin_md_weight", GM.Creator.data.PeauCoulour2)
        end,
    })
    Items:UISliderHeritage("Ressemblance", GM.Creator.data.Ressemblance, nil, {
        onSliderChange = function(Float, Index)
            GM.Creator.data.Ressemblance = Index 
            GM.Creator.data.Ressemblance2 = Index*10 
            TriggerEvent("skinchanger:change", "face_md_weight", GM.Creator.data.Ressemblance2)
        end,
    })
    Items:Button("Nez", nil, {}, true, {})
    Items:Button("Joue", nil, {}, true, {})
    Items:Button("Mâchoires", nil, {}, true, {})
    Items:Button("Menton", nil, {}, true, {})
    Items:Button("Confirmer votre apparence", nil, {}, true, {}, GM.Creator.menu.submenus["character"])
end, function()
    Panels:PercentagePanel(GM.Creator.data.PercentLargenose, 'Largeur', '0%', '100%', {
        onProgressChange = function(Percentage)
            GM.Creator.data.PercentLargenose = Percentage
            TriggerEvent('skinchanger:change', 'nose_1', Percentage*10)
        end
    }, 5) 

    Panels:PercentagePanel(GM.Creator.data.PercentHauteurnose, 'Hauteur', '0%', '100%', {
        onProgressChange = function(Percentage)
            GM.Creator.data.PercentHauteurnose = Percentage
            TriggerEvent('skinchanger:change', 'nose_2', Percentage*10)
        end
    }, 5) 
    
    Panels:PercentagePanel(GM.Creator.data.PercentCrochuNose, 'Crochu', '0%', '100%', {
        onProgressChange = function(Percentage)
            GM.Creator.data.PercentCrochuNose = Percentage
            TriggerEvent('skinchanger:change', 'nose_5', Percentage*10)
        end
    }, 5) 

    Panels:PercentagePanel(GM.Creator.data.PercentJoueHauteur, 'Hauteur  des paumettes', '0%', '100%', {
        onProgressChange = function(Percentage)
            GM.Creator.data.PercentJoueHauteur = Percentage
            TriggerEvent('skinchanger:change', 'cheeks_1', Percentage*10)
        end
    }, 6) 

    Panels:PercentagePanel(GM.Creator.data.PercentJoueCreux, 'Creux des paumettes', '0%', '100%', {
        onProgressChange = function(Percentage)
            GM.Creator.data.PercentJoueCreux = Percentage
            TriggerEvent('skinchanger:change', 'cheeks_2', Percentage*10)
        end
    }, 6) 

    
    Panels:PercentagePanel(GM.Creator.data.PercentJoueCreuxx, 'Creux des joues', '0%', '100%', {
        onProgressChange = function(Percentage)
            GM.Creator.data.PercentJoueCreuxx = Percentage
            TriggerEvent('skinchanger:change', 'cheeks_3', Percentage*10)
        end
    }, 6)

    Panels:PercentagePanel(GM.Creator.data.PercentMacoire1, 'Largeur de la Mâchoire', '0%', '100%', {
        onProgressChange = function(Percentage)
            GM.Creator.data.PercentMacoire1 = Percentage
            TriggerEvent('skinchanger:change', 'jaw_1', Percentage*10)
        end
    }, 7) 
    
    Panels:PercentagePanel(GM.Creator.data.PercentMacoire2, 'Epaisseur de la Mâchoire', '0%', '100%', {
        onProgressChange = function(Percentage)
            GM.Creator.data.PercentMacoire2 = Percentage
            TriggerEvent('skinchanger:change', 'jaw_2', Percentage*10)
        end
    }, 7) 

    Panels:PercentagePanel(GM.Creator.data.PercentMentonHauteur, 'Hauteur du menton', '0%', '100%', {
        onProgressChange = function(Percentage)
            GM.Creator.data.PercentMentonHauteur = Percentage
            TriggerEvent('skinchanger:change', 'chin_1', Percentage*10)
        end
    }, 8) 

    Panels:PercentagePanel(GM.Creator.data.PercentMentonLargeur, 'Largeur du menton', '0%', '100%', {
        onProgressChange = function(Percentage)
            GM.Creator.data.PercentMentonLargeur = Percentage
            TriggerEvent('skinchanger:change', 'chin_3', Percentage*10)
        end
    }, 8) 
end)

GM.Creator.menu.submenus["character"]:isVisible(function(Items)
    Items:List("Cheveux", GM.Creator.data.Hairlist, GM.Creator.data.Hairindex, nil, {}, true, {
        onListChange = function(index)
            GM.Creator.data.Hairindex = index
            TriggerEvent("skinchanger:change", "hair_1", index)
        end
    })

    Items:List("Barbe", GM.Creator.data.BeardList, GM.Creator.data.Beardindex, nil, {}, true, {
        onListChange = function(index)
            GM.Creator.data.Beardindex = index 
            TriggerEvent("skinchanger:change", "beard_1", GM.Creator.data.Beardindex)
        end
    })

    Items:List("Sourcil", GM.Creator.data.EyebowList, GM.Creator.data.Indexeyebow, nil, {}, true, {
        onListChange = function (index)
            GM.Creator.data.Indexeyebow = index 
            TriggerEvent("skinchanger:change", "eyebrows_1", GM.Creator.data.Indexeyebow)

        end
    })

    Items:List("Couleur des yeux", GM.Creator.data.EyesColorList, GM.Creator.data.EyexIndex, nil, {}, true, {
        onListChange = function (index)
            GM.Creator.data.EyexIndex = index
            TriggerEvent("skinchanger:change", "eye_color", GM.Creator.data.EyexIndex)
        end
    })

    Items:Button("Valider son personnage", nil, {}, true, {
        onSelected = function ()
            SetPlayerControl(PlayerId(), true, 12)
            TriggerEvent('skinchanger:getSkin', function(skin)
                TriggerServerEvent('esx_skin:save', skin)
            end)
            GM.Creator.menu.main:close()
            DisplayRadar(true)
        end
    })
end, function()
    Panels:ColourPanel("Couleur Principale", RageUI.PanelColour.HairCut, GM.Creator.data.ColorHair.primary[1], GM.Creator.data.ColorHair.primary[2], {
        onColorChange = function(MinimumIndex, CurrentIndex)
            GM.Creator.data.ColorHair.primary[1] = MinimumIndex
            GM.Creator.data.ColorHair.primary[2] = CurrentIndex
            TriggerEvent("skinchanger:change", "hair_color_1" , GM.Creator.data.ColorHair.primary[2])
        end
    }, 1)

    Panels:ColourPanel("Couleur secondaire", RageUI.PanelColour.HairCut, GM.Creator.data.ColorHair.secondary[1], GM.Creator.data.ColorHair.secondary[2], {
        onColorChange = function(MinimumIndex, CurrentIndex)
            GM.Creator.data.ColorHair.secondary[1] = MinimumIndex
            GM.Creator.data.ColorHair.secondary[2] = CurrentIndex
            TriggerEvent("skinchanger:change", "hair_color_2", GM.Creator.data.ColorHair.secondary[2])
        end
    }, 1)

    Panels:PercentagePanel(GM.Creator.data.OpaPercent, 'Opacité', '0%', '100%', {
        onProgressChange = function(Percentage)
            GM.Creator.data.OpaPercent = Percentage
            TriggerEvent('skinchanger:change', 'beard_2', Percentage*10)
        end
    }, 2) 

    Panels:ColourPanel("Couleur de la barbe", RageUI.PanelColour.HairCut, GM.Creator.data.ColorBeard.secondary[1], GM.Creator.data.ColorBeard.secondary[2], {
        onColorChange = function(MinimumIndex, CurrentIndex)
            GM.Creator.data.ColorBeard.secondary[1] = MinimumIndex
            GM.Creator.data.ColorBeard.secondary[2] = CurrentIndex
            TriggerEvent("skinchanger:change", "beard_3", GM.Creator.data.ColorBeard.secondary[2])
        end
    }, 2)

    Panels:PercentagePanel(GM.Creator.data.OpePercentEyebow, 'Opacité', '0%', '100%', {
        onProgressChange = function(Percentage)
            GM.Creator.data.OpePercentEyebow = Percentage
            TriggerEvent('skinchanger:change', 'eyebrows_2', Percentage*10)
        end
    }, 3) 

    Panels:ColourPanel("Couleur des sourcils", RageUI.PanelColour.HairCut, GM.Creator.data.ColorEyebow.secondary[1], GM.Creator.data.ColorEyebow.secondary[2], {
        onColorChange = function(MinimumIndex, CurrentIndex)
            GM.Creator.data.ColorEyebow.secondary[1] = MinimumIndex
            GM.Creator.data.ColorEyebow.secondary[2] = CurrentIndex
            TriggerEvent("skinchanger:change", "eyebrows_3", GM.Creator.data.ColorEyebow.secondary[2])
        end
    }, 3)
end)

RegisterNetEvent("Creator:openMenu", function()
    DisplayRadar(false)
    SetPlayerControl(PlayerId(), false, 12)
    GM.Creator.menu.main:toggle()
end)