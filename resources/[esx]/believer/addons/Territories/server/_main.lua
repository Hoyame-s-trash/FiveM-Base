GM.Territories = GM.Territories or {}

RegisterServerEvent("Territories:sellDrugs", function(itemName, territoriesId, territoriesName)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    -- Todo check if player is in job2

    -- Todo check if player got enough item

    if (GM.Territories.Items[itemName] == nil) then return end

    if (playerSelected.getInventoryItem(itemName).count < 1) then return end
    
    local territoriesSelected = GM.Territories:getFromId(territoriesId)
    if (not territoriesSelected) then return end

    -- Todo check if player own the territory or not

    if (playerSelected.getInventoryItem(itemName).count >= 1) then 
        random = math.random(GM.Territories.Items[itemName].price.min, GM.Territories.Items[itemName].price.max)
        playerSelected.removeInventoryItem(itemName, 1)
        playerSelected.addAccountMoney("money", random)
        playerSelected.showNotification("Vous avez vendu votre ~b~"..ESX.GetItemLabel(itemName).."~s~ pour "..random.."~g~$~s~.")
    end

    MySQL.update("UPDATE user_territories SET influence, namecontrol = @influence, @namecontrol WHERE id = @id", {
        ["@id"] = territoriesId,
        ["@influence"] = territoriesSelected.influence,
        ["@namecontrol"] = territoriesSelected.namecontrol
    }, function()

    end)
end)