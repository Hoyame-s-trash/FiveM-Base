GM.Rent = GM.Rent or {}

GM.Rent.registeredZones = {}

GM.Rent["List"] = {}

GM.Rent["currentRent"] = {}

GM:newThread(function()
    while (GM.Rent.Config["rent_list"] == nil) do
        Wait(100)
    end

    for rentId, rent in pairs(GM.Rent.Config["rent_list"]) do
        rent.onUsable = function(playerSrc)
            TriggerClientEvent("Rent:openShop", playerSrc, rentId, rent.items)
        end
        GM.Rent.registeredZones[rentId] = GM.Zone.Management:create(rent.position, rent.radius, rent.helpText, rent.onUsable, {
            private = false,
            marker = true
        })
    end
end)

RegisterServerEvent("Rent:rentCar", function(rentId, itemId, itemPrice)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local playerIdentifier = playerSelected.identifier
    if (not playerIdentifier) then return end

    if (GM.Rent["currentRent"][playerIdentifier]) then
        playerSelected.showNotification("~r~Vous avez déjà une location en cours.")
        return
    end

    local itemSelected = GM.Rent.Config["rent_list"][rentId].items[itemId]
    if (not itemSelected) then return end

    if (itemSelected.price ~= itemPrice) then
        playerSelected.showNotification("~r~Tentative de triche détecté.")
        -- Todo ban player
        return
    end

    if (itemSelected.vip and itemSelected.vip == true) then
        -- Todo check if player is vip
        if (not playerSelected.getGroup() == "vip") then
            playerSelected.showNotification("~r~Vous devez être VIP pour acheter cet article.")
            return
        end
    end

    local playerMoney = playerSelected.getMoney()
    if (not playerMoney) then return end

    local playerBank = playerSelected.getAccount("bank").money
    if (not playerBank) then return end

    if (playerMoney >= itemPrice) then
        playerSelected.removeMoney(itemPrice)
    elseif playerBank >= itemPrice then
        playerSelected.removeAccountMoney("bank", itemPrice)
    else
        playerSelected.showNotification("~r~Vous n'avez pas assez d'argent.")
    end

    playerSelected.showNotification("~g~Vous avez acheté ~w~"..itemSelected.label.." ~g~pour ~w~"..itemPrice.."$~g~.")

    local upgrades = {
        plate = "LOCATION",
    }

    local playerPed = playerSelected.getPed()
    if (not playerPed) then return end

    local playerPosition = playerSelected.getCoords(true)
    if (not playerPosition) then return end

    ESX.OneSync.SpawnVehicle(itemSelected.name, playerPosition - vector3(0,0, 0.9), GetEntityHeading(playerPed), false, false, function(networkId)
        if networkId then
            local vehicle = NetworkGetEntityFromNetworkId(networkId)
            for i = 1, 20 do
                Wait(0)
                SetPedIntoVehicle(playerPed, vehicle, -1)
        
                if GetVehiclePedIsIn(playerPed, false) == vehicle then
                    break
                end
            end
            TriggerClientEvent("Rent:confirmRent", playerSrc)
            if GetVehiclePedIsIn(playerPed, false) ~= vehicle then
                playerSelected.showNotification("~r~Impossible de rentrer dans le véhicule !")
            end
        end
    end)
end)