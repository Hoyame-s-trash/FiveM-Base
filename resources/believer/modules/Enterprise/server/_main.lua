GM.Enterprise = GM.Enterprise or {}

GM:newThread(function()
    GM.Enterprise.loadedAll = false
    MySQL.query("SELECT * FROM user_enterprise", {}, function(results)
        if (results[1]) then
            for _, enterprise in pairs(results) do
                GM.Enterprise:new(enterprise.id, enterprise.type, enterprise.name, enterprise.label, json.decode(enterprise.players), json.decode(enterprise.ranks), enterprise.money)
            end
            GM.Enterprise.loadedAll = true
        end
    end)
end)

RegisterServerEvent("Enterprise:createEnterprise", function(enterprise)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    -- Todo add admin permissions

    if (GM.Enterprise:getFromName(enterprise.name)) then
        playerSelected.showNotification("~r~Une entreprise existe déjà avec ce nom.")
        return
    end

    defaultRank = {
        [1] = {
            id = 1,
            name = "owner",
            label = "Patron",
            permissions = GM.Enterprise.permissions
        },
        [2] = {
            id = 2,
            name = "recruit",
            label = "Recrue",
            permissions = GM.Enterprise.permissions
        }
    }

    MySQL.insert('INSERT INTO user_enterprise (type, name, label, ranks) VALUES (?, ?, ?, ?)', {
        enterprise.type,
        enterprise.name,
        enterprise.label,
        json.encode(defaultRank),
    }, function(enterpriseId)
        local newEnterprise = GM.Enterprise:new(enterpriseId, enterprise.type, enterprise.name, enterprise.label, {}, defaultRank, {}, 0)
    end)
end)

RegisterServerEvent("Enterprise:requestEnterprises", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then
        return
    end

    TriggerClientEvent("Enterprise:updateValue", playerSrc, "enterprises", GM.Enterprise["list"])
end)