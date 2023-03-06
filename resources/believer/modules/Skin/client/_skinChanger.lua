local LastSex = -1
local LoadSkin = nil
local LoadClothes = nil
local Character = {}

local Components = {{
    label = "Sexe",
    name = "sex",
    value = 0,
    min = 0,
    zoomOffset = 0.6,
    camOffset = 0.65
}, {
    label = "Mère",
    name = "mom",
    value = 21,
    min = 21,
    zoomOffset = 0.6,
    camOffset = 0.65
}, {
    label = "Père",
    name = "dad",
    value = 0,
    min = 0,
    zoomOffset = 0.6,
    camOffset = 0.65
}, {
    label = "Ressemblance",
    name = "face_md_weight",
    value = 50,
    min = 0,
    zoomOffset = 0.6,
    camOffset = 0.65
}, {
    label = "Couleur de peau",
    name = "skin_md_weight",
    value = 50,
    min = 0,
    zoomOffset = 0.6,
    camOffset = 0.65
}, {
    label = "Nez 1",
    name = "nose_1",
    value = 0,
    min = -10,
    zoomOffset = 0.6,
    camOffset = 0.65
}, {
    label = "Nez 2",
    name = "nose_2",
    value = 0,
    min = -10,
    zoomOffset = 0.6,
    camOffset = 0.65
}, {
    label = "Nez 3",
    name = "nose_3",
    value = 0,
    min = -10,
    zoomOffset = 0.6,
    camOffset = 0.65
}, {
    label = "Nez 4",
    name = "nose_4",
    value = 0,
    min = -10,
    zoomOffset = 0.6,
    camOffset = 0.65
}, {
    label = "Nez 5",
    name = "nose_5",
    value = 0,
    min = -10,
    zoomOffset = 0.6,
    camOffset = 0.65
}, {
    label = "Nez 6",
    name = "nose_6",
    value = 0,
    min = -10,
    zoomOffset = 0.6,
    camOffset = 0.65
}, {
    label = "Joues 1",
    name = "cheeks_1",
    value = 0,
    min = -10,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Joues 2",
    name = "cheeks_2",
    value = 0,
    min = -10,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Joues 3",
    name = "cheeks_3",
    value = 0,
    min = -10,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Plénitude des lèvres",
    name = "lip_thickness",
    value = 0,
    min = -10,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Largeur de la mâchoire",
    name = "jaw_1",
    value = 0,
    min = -10,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Longueur de la mâchoire",
    name = "jaw_2",
    value = 0,
    min = -10,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Hauteur du menton",
    name = "chin_1",
    value = 0,
    min = -10,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Longueur du menton",
    name = "chin_2",
    value = 0,
    min = -10,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Largeur du menton",
    name = "chin_3",
    value = 0,
    min = -10,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Trou du menton",
    name = "chin_4",
    value = 0,
    min = -10,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Épaisseur du cou",
    name = "neck_thickness",
    value = 0,
    min = -10,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Cheveux 1",
    name = "hair_1",
    value = 0,
    min = 0,
    zoomOffset = 0.6,
    camOffset = 0.65
}, {
    label = "Cheveux 2",
    name = "hair_2",
    value = 0,
    min = 0,
    zoomOffset = 0.6,
    camOffset = 0.65
}, {
    label = "Couleur de cheveux 1",
    name = "hair_color_1",
    value = 0,
    min = 0,
    zoomOffset = 0.6,
    camOffset = 0.65
}, {
    label = "Couleur de cheveux 2",
    name = "hair_color_2",
    value = 0,
    min = 0,
    zoomOffset = 0.6,
    camOffset = 0.65
}, {
    label = "Tshirt 1",
    name = "tshirt_1",
    value = 0,
    min = 0,
    zoomOffset = 0.75,
    camOffset = 0.15,
    componentId = 8
}, {
    label = "Tshirt 2",
    name = "tshirt_2",
    value = 0,
    min = 0,
    zoomOffset = 0.75,
    camOffset = 0.15,
    textureof = "tshirt_1"
}, {
    label = "Torses 1",
    name = "torso_1",
    value = 0,
    min = 0,
    zoomOffset = 0.75,
    camOffset = 0.15,
    componentId = 11
}, {
    label = "Torses 2",
    name = "torso_2",
    value = 0,
    min = 0,
    zoomOffset = 0.75,
    camOffset = 0.15,
    textureof = "torso_1"
}, {
    label = "Calques 1",
    name = "decals_1",
    value = 0,
    min = 0,
    zoomOffset = 0.75,
    camOffset = 0.15,
    componentId = 10
}, {
    label = "Calques 2",
    name = "decals_2",
    value = 0,
    min = 0,
    zoomOffset = 0.75,
    camOffset = 0.15,
    textureof = "decals_1"
}, {
    label = "Bras",
    name = "arms_1",
    value = 0,
    min = 0,
    zoomOffset = 0.75,
    camOffset = 0.15
}, {
    label = "Bras 2",
    name = "arms_2",
    value = 0,
    min = 0,
    zoomOffset = 0.75,
    camOffset = 0.15
}, {
    label = "Pantalons 1",
    name = "pants_1",
    value = 0,
    min = 0,
    zoomOffset = 0.8,
    camOffset = -0.5,
    componentId = 4
}, {
    label = "Pantalons 2",
    name = "pants_2",
    value = 0,
    min = 0,
    zoomOffset = 0.8,
    camOffset = -0.5,
    textureof = "pants_1"
}, {
    label = "Chaussures 1",
    name = "shoes_1",
    value = 0,
    min = 0,
    zoomOffset = 0.8,
    camOffset = -0.8,
    componentId = 6
}, {
    label = "Chaussures 2",
    name = "shoes_2",
    value = 0,
    min = 0,
    zoomOffset = 0.8,
    camOffset = -0.8,
    textureof = "shoes_1"
}, {
    label = "Masques 1",
    name = "mask_1",
    value = 0,
    min = 0,
    zoomOffset = 0.6,
    camOffset = 0.65,
    componentId = 1
}, {
    label = "Masques 2",
    name = "mask_2",
    value = 0,
    min = 0,
    zoomOffset = 0.6,
    camOffset = 0.65,
    textureof = "mask_1"
}, {
    label = "Gilet par balle 1",
    name = "bproof_1",
    value = 0,
    min = 0,
    zoomOffset = 0.75,
    camOffset = 0.15,
    componentId = 9
}, {
    label = "Gilet par balle 2",
    name = "bproof_2",
    value = 0,
    min = 0,
    zoomOffset = 0.75,
    camOffset = 0.15,
    textureof = "bproof_1"
}, {
    label = "Chaines 1",
    name = "chain_1",
    value = 0,
    min = 0,
    zoomOffset = 0.6,
    camOffset = 0.65,
    componentId = 7
}, {
    label = "Chaines 2",
    name = "chain_2",
    value = 0,
    min = 0,
    zoomOffset = 0.6,
    camOffset = 0.65,
    textureof = "chain_1"
}, {
    label = "Chapeau 1",
    name = "helmet_1",
    value = -1,
    min = -1,
    zoomOffset = 0.6,
    camOffset = 0.65,
    componentId = 0
}, {
    label = "Chapeau 2",
    name = "helmet_2",
    value = 0,
    min = 0,
    zoomOffset = 0.6,
    camOffset = 0.65,
    textureof = "helmet_1"
}, {
    label = "Lunettes 1",
    name = "glasses_1",
    value = 0,
    min = 0,
    zoomOffset = 0.6,
    camOffset = 0.65,
    componentId = 1
}, {
    label = "Lunettes 2",
    name = "glasses_2",
    value = 0,
    min = 0,
    zoomOffset = 0.6,
    camOffset = 0.65,
    textureof = "glasses_1"
}, {
    label = "Montres 1",
    name = "watches_1",
    value = -1,
    min = -1,
    zoomOffset = 0.75,
    camOffset = 0.15,
    componentId = 6
}, {
    label = "Montres 2",
    name = "watches_2",
    value = 0,
    min = 0,
    zoomOffset = 0.75,
    camOffset = 0.15,
    textureof = "watches_1"
}, {
    label = "Bracelets 1",
    name = "bracelets_1",
    value = -1,
    min = -1,
    zoomOffset = 0.75,
    camOffset = 0.15,
    componentId = 7
}, {
    label = "Bracelets 2",
    name = "bracelets_2",
    value = 0,
    min = 0,
    zoomOffset = 0.75,
    camOffset = 0.15,
    textureof = "bracelets_1"
}, {
    label = "Sacs 1",
    name = "bags_1",
    value = 0,
    min = 0,
    zoomOffset = 0.75,
    camOffset = 0.15,
    componentId = 5
}, {
    label = "Sacs 2",
    name = "bags_2",
    value = 0,
    min = 0,
    zoomOffset = 0.75,
    camOffset = 0.15,
    textureof = "bags_1"
}, {
    label = "Couleur des yeux",
    name = "eye_color",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Strabisme",
    name = "eye_squint",
    value = 0,
    min = -10,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Taille du sourcil",
    name = "eyebrows_2",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Type de sourcils",
    name = "eyebrows_1",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Couleur des sourcils 1",
    name = "eyebrows_3",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Couleur des sourcils 2",
    name = "eyebrows_4",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Hauteur des sourcils",
    name = "eyebrows_5",
    value = 0,
    min = -10,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Profondeur du sourcil",
    name = "eyebrows_6",
    value = 0,
    min = -10,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Type de maquillage",
    name = "makeup_1",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Épaisseur du maquillage",
    name = "makeup_2",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Couleur maquillage 1",
    name = "makeup_3",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Couleur maquillage 2",
    name = "makeup_4",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Type de rouge à lèvres",
    name = "lipstick_1",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Épaisseur du rouge à lèvres",
    name = "lipstick_2",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Couleur rouge à lèvres 1",
    name = "lipstick_3",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Couleur rouge à lèvres 2",
    name = "lipstick_4",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Accessoires d'oreilles",
    name = "ears_1",
    value = -1,
    min = -1,
    zoomOffset = 0.4,
    camOffset = 0.65,
    componentId = 2
}, {
    label = "Accessoires d'oreilles 2",
    name = "ears_2",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65,
    textureof = "ears_1"
}, {
    label = "Poils de poitrine",
    name = "chest_1",
    value = 0,
    min = 0,
    zoomOffset = 0.75,
    camOffset = 0.15
}, {
    label = "Poils de poitrine 2",
    name = "chest_2",
    value = 0,
    min = 0,
    zoomOffset = 0.75,
    camOffset = 0.15
}, {
    label = "Couleur de la poitrine",
    name = "chest_3",
    value = 0,
    min = 0,
    zoomOffset = 0.75,
    camOffset = 0.15
}, {
    label = "Bodyb",
    name = "bodyb_1",
    value = -1,
    min = -1,
    zoomOffset = 0.75,
    camOffset = 0.15
}, {
    label = "Bodyb Taille",
    name = "bodyb_2",
    value = 0,
    min = 0,
    zoomOffset = 0.75,
    camOffset = 0.15
}, {
    label = "Bodyb Extra",
    name = "bodyb_3",
    value = -1,
    min = -1,
    zoomOffset = 0.4,
    camOffset = 0.15
}, {
    label = "Bodyb Extra Épaisseur",
    name = "bodyb_4",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.15
}, {
    label = "Rides",
    name = "age_1",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Épaisseur des rides",
    name = "age_2",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Imperfections",
    name = "blemishes_1",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Taille des imperfections",
    name = "blemishes_2",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Rougeurs",
    name = "blush_1",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Rougeurs 2",
    name = "blush_2",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Couleur des rougeurs",
    name = "blush_3",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "complexion",
    name = "complexion_1",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "complexion_1",
    name = "complexion_2",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "sun",
    name = "sun_1",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "sun_1",
    name = "sun_2",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Taches de rousseur",
    name = "moles_1",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Taches de rousseur 2",
    name = "moles_2",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Type de barbe",
    name = "beard_1",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Taille de la barbe",
    name = "beard_2",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Couleur de la barbe 1",
    name = "beard_3",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}, {
    label = "Couleur de la barbe 2",
    name = "beard_4",
    value = 0,
    min = 0,
    zoomOffset = 0.4,
    camOffset = 0.65
}}

for i = 1, #Components, 1 do
    Character[Components[i].name] = Components[i].value
end

function LoadDefaultModel(malePed, cb)
    local playerPed = PlayerPedId()
    local characterModel

    if malePed then
        characterModel = `mp_m_freemode_01`
    else
        characterModel = `mp_f_freemode_01`
    end

    RequestModel(characterModel)

    CreateThread(function()
        while not HasModelLoaded(characterModel) do
            RequestModel(characterModel)
            Wait(0)
        end

        if IsModelInCdimage(characterModel) and IsModelValid(characterModel) then
            SetPlayerModel(PlayerId(), characterModel)
            SetPedDefaultComponentVariation(playerPed)
        end

        SetModelAsNoLongerNeeded(characterModel)

        if cb ~= nil then
            cb()
        end

        TriggerEvent("skinchanger:modelLoaded")
    end)
end

function GetMaxVals()
    local playerPed = PlayerPedId()

    local data = {
        sex = 1,
        mom = 45, -- numbers 21-41 and 45 are female (22 total)
        dad = 44, -- numbers 0-20 and 42-44 are male (24 total)
        face_md_weight = 100,
        skin_md_weight = 100,
        nose_1 = 10,
        nose_2 = 10,
        nose_3 = 10,
        nose_4 = 10,
        nose_5 = 10,
        nose_6 = 10,
        cheeks_1 = 10,
        cheeks_2 = 10,
        cheeks_3 = 10,
        lip_thickness = 10,
        jaw_1 = 10,
        jaw_2 = 10,
        chin_1 = 10,
        chin_2 = 10,
        chin_3 = 10,
        chin_4 = 10,
        neck_thickness = 10,
        age_1 = GetPedHeadOverlayNum(3) - 1,
        age_2 = 10,
        beard_1 = GetPedHeadOverlayNum(1) - 1,
        beard_2 = 10,
        beard_3 = GetNumHairColors() - 1,
        beard_4 = GetNumHairColors() - 1,
        hair_1 = GetNumberOfPedDrawableVariations(playerPed, 2) - 1,
        hair_2 = GetNumberOfPedTextureVariations(playerPed, 2, Character["hair_1"]) - 1,
        hair_color_1 = GetNumHairColors() - 1,
        hair_color_2 = GetNumHairColors() - 1,
        eye_color = 31,
        eye_squint = 10,
        eyebrows_1 = GetPedHeadOverlayNum(2) - 1,
        eyebrows_2 = 10,
        eyebrows_3 = GetNumHairColors() - 1,
        eyebrows_4 = GetNumHairColors() - 1,
        eyebrows_5 = 10,
        eyebrows_6 = 10,
        makeup_1 = GetPedHeadOverlayNum(4) - 1,
        makeup_2 = 10,
        makeup_3 = GetNumHairColors() - 1,
        makeup_4 = GetNumHairColors() - 1,
        lipstick_1 = GetPedHeadOverlayNum(8) - 1,
        lipstick_2 = 10,
        lipstick_3 = GetNumHairColors() - 1,
        lipstick_4 = GetNumHairColors() - 1,
        blemishes_1 = GetPedHeadOverlayNum(0) - 1,
        blemishes_2 = 10,
        blush_1 = GetPedHeadOverlayNum(5) - 1,
        blush_2 = 10,
        blush_3 = GetNumHairColors() - 1,
        complexion_1 = GetPedHeadOverlayNum(6) - 1,
        complexion_2 = 10,
        sun_1 = GetPedHeadOverlayNum(7) - 1,
        sun_2 = 10,
        moles_1 = GetPedHeadOverlayNum(9) - 1,
        moles_2 = 10,
        chest_1 = GetPedHeadOverlayNum(10) - 1,
        chest_2 = 10,
        chest_3 = GetNumHairColors() - 1,
        bodyb_1 = GetPedHeadOverlayNum(11) - 1,
        bodyb_2 = 10,
        bodyb_3 = GetPedHeadOverlayNum(12) - 1,
        bodyb_4 = 10,
        ears_1 = GetNumberOfPedPropDrawableVariations(playerPed, 2) - 1,
        ears_2 = GetNumberOfPedPropTextureVariations(playerPed, 2, Character["ears_1"] - 1),
        tshirt_1 = GetNumberOfPedDrawableVariations(playerPed, 8) - 1,
        tshirt_2 = GetNumberOfPedTextureVariations(playerPed, 8, Character["tshirt_1"]) - 1,
        torso_1 = GetNumberOfPedDrawableVariations(playerPed, 11) - 1,
        torso_2 = GetNumberOfPedTextureVariations(playerPed, 11, Character["torso_1"]) - 1,
        decals_1 = GetNumberOfPedDrawableVariations(playerPed, 10) - 1,
        decals_2 = GetNumberOfPedTextureVariations(playerPed, 10, Character["decals_1"]) - 1,
        arms_1 = GetNumberOfPedDrawableVariations(playerPed, 3) - 1,
        arms_2 = 10,
        pants_1 = GetNumberOfPedDrawableVariations(playerPed, 4) - 1,
        pants_2 = GetNumberOfPedTextureVariations(playerPed, 4, Character["pants_1"]) - 1,
        shoes_1 = GetNumberOfPedDrawableVariations(playerPed, 6) - 1,
        shoes_2 = GetNumberOfPedTextureVariations(playerPed, 6, Character["shoes_1"]) - 1,
        mask_1 = GetNumberOfPedDrawableVariations(playerPed, 1) - 1,
        mask_2 = GetNumberOfPedTextureVariations(playerPed, 1, Character["mask_1"]) - 1,
        bproof_1 = GetNumberOfPedDrawableVariations(playerPed, 9) - 1,
        bproof_2 = GetNumberOfPedTextureVariations(playerPed, 9, Character["bproof_1"]) - 1,
        chain_1 = GetNumberOfPedDrawableVariations(playerPed, 7) - 1,
        chain_2 = GetNumberOfPedTextureVariations(playerPed, 7, Character["chain_1"]) - 1,
        bags_1 = GetNumberOfPedDrawableVariations(playerPed, 5) - 1,
        bags_2 = GetNumberOfPedTextureVariations(playerPed, 5, Character["bags_1"]) - 1,
        helmet_1 = GetNumberOfPedPropDrawableVariations(playerPed, 0) - 1,
        helmet_2 = GetNumberOfPedPropTextureVariations(playerPed, 0, Character["helmet_1"]) - 1,
        glasses_1 = GetNumberOfPedPropDrawableVariations(playerPed, 1) - 1,
        glasses_2 = GetNumberOfPedPropTextureVariations(playerPed, 1, Character["glasses_1"] - 1),
        watches_1 = GetNumberOfPedPropDrawableVariations(playerPed, 6) - 1,
        watches_2 = GetNumberOfPedPropTextureVariations(playerPed, 6, Character["watches_1"]) - 1,
        bracelets_1 = GetNumberOfPedPropDrawableVariations(playerPed, 7) - 1,
        bracelets_2 = GetNumberOfPedPropTextureVariations(playerPed, 7, Character["bracelets_1"] - 1)
    }

    return data
end

function ApplySkin(skin, clothes)
    local playerPed = PlayerPedId()

    for k, v in pairs(skin) do
        Character[k] = v
    end

    if clothes ~= nil then
        for k, v in pairs(clothes) do
            if k ~= "sex" and k ~= "mom" and k ~= "dad" and k ~= "face_md_weight" and k ~= "skin_md_weight" and k ~=
                "nose_1" and k ~= "nose_2" and k ~= "nose_3" and k ~= "nose_4" and k ~= "nose_5" and k ~= "nose_6" and k ~=
                "cheeks_1" and k ~= "cheeks_2" and k ~= "cheeks_3" and k ~= "lip_thickness" and k ~= "jaw_1" and k ~=
                "jaw_2" and k ~= "chin_1" and k ~= "chin_2" and k ~= "chin_3" and k ~= "chin_4" and k ~=
                "neck_thickness" and k ~= "age_1" and k ~= "age_2" and k ~= "eye_color" and k ~= "eye_squint" and k ~=
                "beard_1" and k ~= "beard_2" and k ~= "beard_3" and k ~= "beard_4" and k ~= "hair_1" and k ~= "hair_2" and
                k ~= "hair_color_1" and k ~= "hair_color_2" and k ~= "eyebrows_1" and k ~= "eyebrows_2" and k ~=
                "eyebrows_3" and k ~= "eyebrows_4" and k ~= "eyebrows_5" and k ~= "eyebrows_6" and k ~= "makeup_1" and k ~=
                "makeup_2" and k ~= "makeup_3" and k ~= "makeup_4" and k ~= "lipstick_1" and k ~= "lipstick_2" and k ~=
                "lipstick_3" and k ~= "lipstick_4" and k ~= "blemishes_1" and k ~= "blemishes_2" and k ~= "blemishes_3" and
                k ~= "blush_1" and k ~= "blush_2" and k ~= "blush_3" and k ~= "complexion_1" and k ~= "complexion_2" and
                k ~= "sun_1" and k ~= "sun_2" and k ~= "moles_1" and k ~= "moles_2" and k ~= "chest_1" and k ~=
                "chest_2" and k ~= "chest_3" and k ~= "bodyb_1" and k ~= "bodyb_2" and k ~= "bodyb_3" and k ~= "bodyb_4" then
                Character[k] = v
            end
        end
    end

    local face_weight = (Character["face_md_weight"] / 100) + 0.0
    local skin_weight = (Character["skin_md_weight"] / 100) + 0.0
    SetPedHeadBlendData(playerPed, Character["mom"], Character["dad"], 0, Character["mom"], Character["dad"], 0,
        face_weight, skin_weight, 0.0, false)

    SetPedFaceFeature(playerPed, 0, (Character["nose_1"] / 10) + 0.0) -- Nose Width
    SetPedFaceFeature(playerPed, 1, (Character["nose_2"] / 10) + 0.0) -- Nose Peak Height
    SetPedFaceFeature(playerPed, 2, (Character["nose_3"] / 10) + 0.0) -- Nose Peak Length
    SetPedFaceFeature(playerPed, 3, (Character["nose_4"] / 10) + 0.0) -- Nose Bone Height
    SetPedFaceFeature(playerPed, 4, (Character["nose_5"] / 10) + 0.0) -- Nose Peak Lowering
    SetPedFaceFeature(playerPed, 5, (Character["nose_6"] / 10) + 0.0) -- Nose Bone Twist
    SetPedFaceFeature(playerPed, 6, (Character["eyebrows_5"] / 10) + 0.0) -- Eyebrow height
    SetPedFaceFeature(playerPed, 7, (Character["eyebrows_6"] / 10) + 0.0) -- Eyebrow depth
    SetPedFaceFeature(playerPed, 8, (Character["cheeks_1"] / 10) + 0.0) -- Cheekbones Height
    SetPedFaceFeature(playerPed, 9, (Character["cheeks_2"] / 10) + 0.0) -- Cheekbones Width
    SetPedFaceFeature(playerPed, 10, (Character["cheeks_3"] / 10) + 0.0) -- Cheeks Width
    SetPedFaceFeature(playerPed, 11, (Character["eye_squint"] / 10) + 0.0) -- Eyes squint
    SetPedFaceFeature(playerPed, 12, (Character["lip_thickness"] / 10) + 0.0) -- Lip Fullness
    SetPedFaceFeature(playerPed, 13, (Character["jaw_1"] / 10) + 0.0) -- Jaw Bone Width
    SetPedFaceFeature(playerPed, 14, (Character["jaw_2"] / 10) + 0.0) -- Jaw Bone Length
    SetPedFaceFeature(playerPed, 15, (Character["chin_1"] / 10) + 0.0) -- Chin Height
    SetPedFaceFeature(playerPed, 16, (Character["chin_2"] / 10) + 0.0) -- Chin Length
    SetPedFaceFeature(playerPed, 17, (Character["chin_3"] / 10) + 0.0) -- Chin Width
    SetPedFaceFeature(playerPed, 18, (Character["chin_4"] / 10) + 0.0) -- Chin Hole Size
    SetPedFaceFeature(playerPed, 19, (Character["neck_thickness"] / 10) + 0.0) -- Neck Thickness

    SetPedHairColor(playerPed, Character["hair_color_1"], Character["hair_color_2"]) -- Hair Color
    SetPedHeadOverlay(playerPed, 3, Character["age_1"], (Character["age_2"] / 10) + 0.0) -- Age + opacity
    SetPedHeadOverlay(playerPed, 0, Character["blemishes_1"], (Character["blemishes_2"] / 10) + 0.0) -- Blemishes + opacity
    SetPedHeadOverlay(playerPed, 1, Character["beard_1"], (Character["beard_2"] / 10) + 0.0) -- Beard + opacity
    SetPedEyeColor(playerPed, Character["eye_color"]) -- Eyes color
    SetPedHeadOverlay(playerPed, 2, Character["eyebrows_1"], (Character["eyebrows_2"] / 10) + 0.0) -- Eyebrows + opacity
    SetPedHeadOverlay(playerPed, 4, Character["makeup_1"], (Character["makeup_2"] / 10) + 0.0) -- Makeup + opacity
    SetPedHeadOverlay(playerPed, 8, Character["lipstick_1"], (Character["lipstick_2"] / 10) + 0.0) -- Lipstick + opacity
    SetPedComponentVariation(playerPed, 2, Character["hair_1"], Character["hair_2"], 2) -- Hair
    SetPedHeadOverlayColor(playerPed, 1, 1, Character["beard_3"], Character["beard_4"]) -- Beard Color
    SetPedHeadOverlayColor(playerPed, 2, 1, Character["eyebrows_3"], Character["eyebrows_4"]) -- Eyebrows Color
    SetPedHeadOverlayColor(playerPed, 4, 2, Character["makeup_3"], Character["makeup_4"]) -- Makeup Color
    SetPedHeadOverlayColor(playerPed, 8, 1, Character["lipstick_3"], Character["lipstick_4"]) -- Lipstick Color
    SetPedHeadOverlay(playerPed, 5, Character["blush_1"], (Character["blush_2"] / 10) + 0.0) -- Blush + opacity
    SetPedHeadOverlayColor(playerPed, 5, 2, Character["blush_3"]) -- Blush Color
    SetPedHeadOverlay(playerPed, 6, Character["complexion_1"], (Character["complexion_2"] / 10) + 0.0) -- Complexion + opacity
    SetPedHeadOverlay(playerPed, 7, Character["sun_1"], (Character["sun_2"] / 10) + 0.0) -- Sun Damage + opacity
    SetPedHeadOverlay(playerPed, 9, Character["moles_1"], (Character["moles_2"] / 10) + 0.0) -- Moles/Freckles + opacity
    SetPedHeadOverlay(playerPed, 10, Character["chest_1"], (Character["chest_2"] / 10) + 0.0) -- Chest Hair + opacity
    SetPedHeadOverlayColor(playerPed, 10, 1, Character["chest_3"]) -- Torso Color

    if Character["bodyb_1"] == -1 then
        SetPedHeadOverlay(playerPed, 11, 255, (Character["bodyb_2"] / 10) + 0.0) -- Body Blemishes + opacity
    else
        SetPedHeadOverlay(playerPed, 11, Character["bodyb_1"], (Character["bodyb_2"] / 10) + 0.0)
    end

    if Character["bodyb_3"] == -1 then
        SetPedHeadOverlay(playerPed, 12, 255, (Character["bodyb_4"] / 10) + 0.0)
    else
        SetPedHeadOverlay(playerPed, 12, Character["bodyb_3"], (Character["bodyb_4"] / 10) + 0.0) -- Blemishes "added body effect" + opacity
    end

    if Character["ears_1"] == -1 then
        ClearPedProp(playerPed, 2)
    else
        SetPedPropIndex(playerPed, 2, Character["ears_1"], Character["ears_2"], 2) -- Ears Accessories
    end

    SetPedComponentVariation(playerPed, 8, Character["tshirt_1"], Character["tshirt_2"], 2) -- Tshirt
    SetPedComponentVariation(playerPed, 11, Character["torso_1"], Character["torso_2"], 2) -- torso parts
    SetPedComponentVariation(playerPed, 3, Character["arms_1"], Character["arms_2"], 2) -- Arms
    SetPedComponentVariation(playerPed, 10, Character["decals_1"], Character["decals_2"], 2) -- decals
    SetPedComponentVariation(playerPed, 4, Character["pants_1"], Character["pants_2"], 2) -- pants
    SetPedComponentVariation(playerPed, 6, Character["shoes_1"], Character["shoes_2"], 2) -- shoes
    SetPedComponentVariation(playerPed, 1, Character["mask_1"], Character["mask_2"], 2) -- mask
    SetPedComponentVariation(playerPed, 9, Character["bproof_1"], Character["bproof_2"], 2) -- bulletproof
    SetPedComponentVariation(playerPed, 7, Character["chain_1"], Character["chain_2"], 2) -- chain
    SetPedComponentVariation(playerPed, 5, Character["bags_1"], Character["bags_2"], 2) -- Bag

    if Character["helmet_1"] == -1 then
        ClearPedProp(playerPed, 0)
    else
        SetPedPropIndex(playerPed, 0, Character["helmet_1"], Character["helmet_2"], 2) -- Helmet
    end

    if Character["glasses_1"] == -1 then
        ClearPedProp(playerPed, 1)
    else
        SetPedPropIndex(playerPed, 1, Character["glasses_1"], Character["glasses_2"], 2) -- Glasses
    end

    if Character["watches_1"] == -1 then
        ClearPedProp(playerPed, 6)
    else
        SetPedPropIndex(playerPed, 6, Character["watches_1"], Character["watches_2"], 2) -- Watches
    end

    if Character["bracelets_1"] == -1 then
        ClearPedProp(playerPed, 7)
    else
        SetPedPropIndex(playerPed, 7, Character["bracelets_1"], Character["bracelets_2"], 2) -- Bracelets
    end
end

AddEventHandler("skinchanger:loadDefaultModel", function(loadMale, cb)
    LoadDefaultModel(loadMale, cb)
end)

AddEventHandler("skinchanger:getData", function(cb)
    local components = json.decode(json.encode(Components))

    for k, v in pairs(Character) do
        for i = 1, #components, 1 do
            if k == components[i].name then
                components[i].value = v
            end
        end
    end

    cb(components, GetMaxVals())
end)

AddEventHandler("skinchanger:change", function(key, val)
    Character[key] = val

    if key == "sex" then
        TriggerEvent("skinchanger:loadSkin", Character)
    else
        ApplySkin(Character)
    end
end)

AddEventHandler("skinchanger:getSkin", function(cb)
    cb(Character)
end)

AddEventHandler("skinchanger:modelLoaded", function()
    ClearPedProp(PlayerPedId(), 0)

    if LoadSkin ~= nil then
        ApplySkin(LoadSkin)
        LoadSkin = nil
    end

    if LoadClothes ~= nil then
        ApplySkin(LoadClothes.playerSkin, LoadClothes.clothesSkin)
        LoadClothes = nil
    end
end)

RegisterNetEvent("skinchanger:loadSkin")
AddEventHandler("skinchanger:loadSkin", function(skin, cb)
    if skin["sex"] ~= LastSex then
        LoadSkin = skin

        if skin["sex"] == 0 then
            TriggerEvent("skinchanger:loadDefaultModel", true, cb)
        else
            TriggerEvent("skinchanger:loadDefaultModel", false, cb)
        end
    else
        ApplySkin(skin)

        if cb ~= nil then
            cb()
        end
    end

    LastSex = skin["sex"]
end)

RegisterNetEvent("skinchanger:loadClothes")
AddEventHandler("skinchanger:loadClothes", function(playerSkin, clothesSkin)
    if playerSkin["sex"] ~= LastSex then
        LoadClothes = {
            playerSkin = playerSkin,
            clothesSkin = clothesSkin
        }

        if playerSkin["sex"] == 0 then
            TriggerEvent("skinchanger:loadDefaultModel", true)
        else
            TriggerEvent("skinchanger:loadDefaultModel", false)
        end
    else
        ApplySkin(playerSkin, clothesSkin)
    end

    LastSex = playerSkin["sex"]
end)
