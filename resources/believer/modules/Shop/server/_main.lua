GM.Shops = GM.Shops or {}

GM.Shops.registeredZones = {}

GM.Shops["List"] = {}

GM:newThread(function()
    while (GM.Shops.Config["shops_list"] == nil) do
        Wait(100)
    end

    for shopId, shop in pairs(GM.Shops.Config["shops_list"]) do
        shop.onUsable = function(playerSrc)
            TriggerClientEvent("Shops:openShop", playerSrc, shopId, shop.items)
        end
        GM.Shops.registeredZones[shopId] = GM.Zone.Management:create(shop.position, shop.radius, shop.helpText, shop.onUsable, {
            private = false,
            marker = true
        })
    end
end)

RegisterServerEvent("Shop:buyItem", function(shopId, itemId, itemPrice)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local itemSelected = GM.Shops.Config["shops_list"][shopId].items[itemId]
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
        playerSelected.addInventoryItem(itemSelected.name, 1)
    elseif playerBank >= itemPrice then
        playerSelected.removeAccountMoney("bank", itemPrice)
        playerSelected.addInventoryItem(itemSelected.name, 1)
    else
        playerSelected.showNotification("~r~Vous n'avez pas assez d'argent.")
    end

    playerSelected.showNotification("~g~Vous avez acheté ~w~"..itemSelected.label.." ~g~pour ~w~"..itemPrice.."$~g~.")
end)