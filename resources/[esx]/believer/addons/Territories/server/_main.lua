GM.Territories = GM.Territories or {}

RegisterServerEvent("Territories:sellDrugs", function(itemName, territoriesId, territoriesName)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    -- Todo check if player is in job2

    -- Todo check if player got enough item

    -- Todo check if player can sell drugs (cops)

    local territoriesSelected = GM.Territories:getFromId(territoriesId)
    if (not territoriesSelected) then return end

    
end)