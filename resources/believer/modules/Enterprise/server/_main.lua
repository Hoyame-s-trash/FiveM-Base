GM.Enterprise = GM.Enterprise or {}

GM:newThread(function()
    GM.Enterprise.loadedAll = false
    MySQL.query("SELECT * FROM user_enterprise", {}, function(results)
        if (results[1]) then
            for _, enterprise in pairs(results) do
                GM.Enterprise:new(enterprise.id, enterprise.type, enterprise.name, enterprise.label, json.decode(enterprise.players), json.decode(enterprise.grades), enterprise.money)
            end
            GM.Enterprise.loadedAll = true
        end
    end)
end)

RegisterServerEvent("EnterpriseManagement:createEnterprise", function(enterprise)
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

    defaultGrade = {
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

    MySQL.insert('INSERT INTO user_enterprise (type, name, label, grades) VALUES (?, ?, ?, ?)', {
        enterprise.type,
        enterprise.name,
        enterprise.label,
        json.encode(defaultGrade),
    }, function(enterpriseId)
        local newEnterprise = GM.Enterprise:new(enterpriseId, enterprise.type, enterprise.name, enterprise.label, {}, defaultGrade, {}, 0)
        playerSelected.showNotification("~g~L'entreprise a bien été crée.")
        for adminSrc, _ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("EnterpriseManagement:updateValue", adminSrc, "enterprises", enterpriseId, newEnterprise)
        end
    end)
end)

RegisterServerEvent("EnterpriseManagement:requestEnterprises", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then
        return
    end

    TriggerClientEvent("EnterpriseManagement:updateValue", playerSrc, "enterprises", GM.Enterprise["list"])
end)

RegisterServerEvent("EnterpriseManagement:deleteEnterprise", function(enterpriseId, input)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    -- Todo add admin permissions

    local enterprise = GM.Enterprise:getFromId(enterpriseId)
    if (not enterprise) then return end

    if (input == "OUI" or input == "oui") then
        MySQL.Async.execute("DELETE FROM user_enterprise WHERE id = ?", {
            enterpriseId
        }, function()
            GM.Enterprise["list"][enterpriseId] = nil
            -- Todo remove players from enterprise list and set the players connected to unemployed !
            for adminSrc, _ in pairs(GM.Admin.inAdmin) do
                TriggerClientEvent("EnterpriseManagement:removeValue", adminSrc, "enterprises", enterpriseId)
            end
        end)
    else
        playerSelected.showNotification("~r~Vous n'avez pas confirmé la suppression de l'entreprise.")
        return
    end
end)

RegisterServerEvent("EnterpriseManagement:createGrade", function(enterpriseId, gradeName, gradeLabel)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    -- Todo add admin permissions

    local enterprise = GM.Enterprise:getFromId(enterpriseId)
    if (not enterprise) then return end

    if (enterprise:getGradeFromName(gradeName)) then
        playerSelected.showNotification("~r~Un grade existe déjà avec ce nom.")
        return
    end

    enterprise.grades[#enterprise.grades + 1] = {
        id = #enterprise.grades + 1,
        name = gradeName,
        label = gradeLabel,
        permissions = GM.Enterprise.permissions
    }

    MySQL.update("UPDATE user_enterprise SET grades = ? WHERE id = ?", {
        json.encode(enterprise.grades),
        enterpriseId
    }, function()
        for adminSrc, _ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("EnterpriseManagement:updateValue", adminSrc, "enterprises", enterpriseId, enterprise)
        end
    end)
end)