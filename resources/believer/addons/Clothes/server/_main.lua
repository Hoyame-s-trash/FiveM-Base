GM.Clothes = GM.Clothes or {}

GM.Clothes.registeredZones = {}

GM.Clothes["List"] = {}

GM:newThread(function()
    while (GM.Clothes.Config["clothes_shop"] == nil) do
        Wait(100)
    end

    for shopId, shop in pairs(GM.Clothes.Config["clothes_shop"]) do
        shop.onUsable = function(playerSrc)
            TriggerClientEvent("Clothes:openShop", playerSrc)
        end
        GM.Clothes.registeredZones[shopId] = GM.Zone.Management:create(shop.position, shop.radius, shop.helpText, shop.onUsable, {
            private = false,
            marker = true
        })
    end

    loadAllClothes = false

    MySQL.query("SELECT * FROM user_clothes", {}, function(results)
        if (results[1]) then
            for _, clothes in pairs(results) do
                if (GM.Clothes["List"][clothes.identifier]) == nil then
                    GM.Clothes["List"][clothes.identifier] = {}
                end
                GM.Clothes["List"][clothes.identifier][clothes.id] = {
                    name = clothes.name,
                    outfit = json.decode(clothes.outfit)
                }
            end
            loadAllClothes = true
        end
    end)
end)

RegisterServerEvent("Clothes:buyOufit", function(outfitName, outfit)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local playerIdentifier = playerSelected.getIdentifier()
    if (not playerIdentifier) then return end

    local playerMoney = playerSelected.getMoney()
    if (not playerMoney) then return end

    if (outfitName == nil) then
        playerSelected.showNotification("~r~Vous devez mettre un nom pour la sauvegarde de la tenue.")
        return
    end

    -- Calculate if the user already has more than 10 outfits

    local outfitsCount = 0
    if (GM.Clothes["List"][playerIdentifier]) then
        for _, outfit in pairs(GM.Clothes["List"][playerIdentifier]) do
            outfitsCount = outfitsCount + 1
        end
    end

    if (outfitsCount >= 2) then
        playerSelected.showNotification("~r~Vous avez déjà 10 tenues sauvegardées.\nVous pouvez prendre un VIP afin d'avoir plus de tenues sauvegardées.")
        return
    end

    if (playerMoney >= 1500) then
        playerSelected.removeMoney(1500)
        playerSelected.showNotification("~g~Vous avez payé 1500$ pour la création de votre tenue.")
        MySQL.insert('INSERT INTO user_clothes (identifier, name, outfit) VALUES (@identifier, @name, @outfit)', {
            ["@identifier"] = playerIdentifier,
            ["@name"] = outfitName,
            ["@outfit"] = json.encode(outfit)
        },function(outfitId)
            if (GM.Clothes["List"][playerIdentifier]) == nil then
                GM.Clothes["List"][playerIdentifier] = {}
            end
            GM.Clothes["List"][playerIdentifier][outfitId] = {
                id = outfitId,
                name = outfitName,
                outfit = outfit
            }
            TriggerClientEvent("Clothes:updateValue", playerSrc, "outfits", outfitId, GM.Clothes["List"][playerIdentifier][outfitId])
        end)
    else
        playerSelected.showNotification("~r~Vous n'avez pas assez d'argent.")
    end
end)

RegisterServerEvent("Clothes:requestOutfits", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local playerIdentifier = playerSelected.getIdentifier()
    if (not playerIdentifier) then return end

    if (GM.Clothes["List"][playerIdentifier]) then
        TriggerClientEvent("Clothes:updateValue", playerSrc, "outfits", GM.Clothes["List"][playerIdentifier])
    end
end)

RegisterServerEvent("Clothes:renameOutfit", function(outfitId, outfitName)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local playerIdentifier = playerSelected.getIdentifier()
    if (not playerIdentifier) then return end

    if (GM.Clothes["List"][playerIdentifier]) then
        if (GM.Clothes["List"][playerIdentifier][outfitId]) then
            MySQL.query("UPDATE user_clothes SET name = @name WHERE id = @id", {
                ["@name"] = outfitName,
                ["@id"] = outfitId
            }, function(results)
                GM.Clothes["List"][playerIdentifier][outfitId].name = outfitName
                TriggerClientEvent("Clothes:updateValue", playerSrc, "outfits", outfitId, GM.Clothes["List"][playerIdentifier][outfitId])
            end)
        end
    end
end)

RegisterServerEvent("Clothes:deleteOutfit", function(outfitId)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local playerIdentifier = playerSelected.getIdentifier()
    if (not playerIdentifier) then return end

    if (GM.Clothes["List"][playerIdentifier]) then
        if (GM.Clothes["List"][playerIdentifier][outfitId]) then
            MySQL.query("DELETE FROM user_clothes WHERE id = @id", {
                ["@id"] = outfitId
            }, function(results)
                GM.Clothes["List"][playerIdentifier][outfitId] = nil
                TriggerClientEvent("Clothes:removeValue", playerSrc, "outfits", outfitId)
            end)
        end
    end
end)

RegisterServerEvent("Clothes:buyClothes", function(clothes)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local playerIdentifier = playerSelected.getIdentifier()
    if (not playerIdentifier) then return end

    local playerMoney = playerSelected.getMoney()
    if (not playerMoney) then return end

    if (playerMoney >= 100) then
        playerSelected.removeMoney(100)
        playerSelected.showNotification("~g~Vous avez payé 100$ pour l'achat du vêtement.")
    else
        playerSelected.showNotification("~r~Vous n'avez pas assez d'argent.")
        return
    end

    data = {
        [clothes.firstName] = clothes.drawable,
        [clothes.secondName] = clothes.textures
    }

    MySQL.insert('INSERT INTO user_clothes (identifier, name, outfit) VALUES (@identifier, @name, @outfit)', {
        ["@identifier"] = playerIdentifier,
        ["@name"] = clothes.label.." - "..clothes.drawable.." ("..clothes.textures..")",
        ["@outfit"] = json.encode(data)
    },function(outfitId)
        if (GM.Clothes["List"][playerIdentifier]) == nil then
            GM.Clothes["List"][playerIdentifier] = {}
        end
        GM.Clothes["List"][playerIdentifier][outfitId] = {
            id = outfitId,
            name = clothes.name,
            outfit = clothes.outfit
        }
        TriggerClientEvent("Clothes:updateValue", playerSrc, "outfits", outfitId, GM.Clothes["List"][playerIdentifier][outfitId])
    end)
end)