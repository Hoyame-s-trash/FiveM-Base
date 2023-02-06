GM.Admin = GM.Admin or {}

RegisterServerEvent("Admin:requestShop", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    --local boutiqueData = exports.shop:getShopData()
end)

RegisterServerEvent("Admin:addVehicleBoutique", function(input)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local selectedRank = GM.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not selectedRank) then return end

    if (not selectedRank:getPermissionsValue("BOUTIQUE_ADDVEHICLE", playerSelected.source)) then return end

    local boutiqueData = exports.shop:getBoutiqueContent()

    print(boutiqueData)

    if (boutiqueData == nil) then return end

    print(boutiqueData)
end)