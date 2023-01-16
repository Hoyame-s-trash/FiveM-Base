GM.Admin = GM.Admin or {}

GM.Admin.inAdmin = {}

AddEventHandler("esx:playerLoaded", function(playerSrc)
    local playerSrc = playerSrc
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local playerIdentifier = playerSelected.getIdentifier()
    if (not playerIdentifier) then return end

    for adminSrc,_ in pairs(GM.Admin.inAdmin) do
        TriggerClientEvent("chatMessage", adminSrc, "", { 255, 255, 255 }, "^2" .. playerSelected.getName() .. " à rejoint le serveur.")
    end

    if (GM.Admin.Ranks["players"][playerIdentifier]) then
        if (GM.Admin.Ranks["players"][playerIdentifier].staffName ~= playerSelected.getName()) then

            local playerRank = GM.Admin.Ranks:getFromId(GM.Admin.Ranks["players"][playerIdentifier].rankId)
            if (not playerRank) then return end

            playerRank.players[playerIdentifier].name = playerSelected.getName()

            GM.Admin.Ranks["players"][playerIdentifier].staffName = playerSelected.getName()

            MySQL.update("UPDATE user_admin SET players = ? WHERE id = ?", {
                json.encode(playerRank.players), 
                GM.Admin.Ranks["players"][playerIdentifier].rankId
            }, function()
                for adminSrc,_ in pairs(GM.Admin.inAdmin) do
                    TriggerClientEvent("Admin:updateValue", adminSrc, "ranks", GM.Admin.Ranks["players"][playerIdentifier].rankId, playerRank)
                end
            end)
        end
        playerSelected.set("rank_id", GM.Admin.Ranks["players"][playerIdentifier].rankId)
        playerSelected.set("rank_label", GM.Admin.Ranks["players"][playerIdentifier].label)
        playerSelected.setGroup(GM.Admin.Ranks["players"][playerIdentifier].name)
    else
        playerSelected.set("rank_id", GM.Admin.Ranks["rank_user"])
        playerSelected.set("rank_label", "Joueur")
        playerSelected.setGroup("user")
    end

    GM.Admin.Players:new(playerSelected.getUniqueId(), playerSelected.source, playerSelected.getName(), playerSelected.get("rank_label"))
end)

RegisterServerEvent("Admin:updatePlayerStaff", function(boolean)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local playerIdentifier = playerSelected:getIdentifier("main")
    if (not playerIdentifier) then return end

    if (boolean == true) then
        if (not GM.Admin.inAdmin[playerSelected.source]) then
            GM.Admin.inAdmin[playerSelected.source] = true
            TriggerClientEvent("Interface:admin", playerSelected.source, {
                type = "updateAdmin",
                admin = true,
                reports = true,
                currentReports = tostring(GM.Admin.Reports:count()),
                totalReports = tostring(GM.Admin.Ranks["players"][playerIdentifier].reports)
            })
            -- Todo change clothes for staff with configurate clothes
        end
    elseif (boolean == false) then
        -- Todo check if number report increase and if it"s the case updat in DB number report of player
        if (GM.Admin.inAdmin[playerSelected.source]) then
            GM.Admin.inAdmin[playerSelected.source] = nil
            TriggerClientEvent("Interface:admin", playerSelected.source, {
                type = "updateAdmin",
                admin = false,
                reports = false,
                currentReports = "0",
                totalReports = "0"
            })
            -- Todo reset clothes for staff
        end
    end
end)

AddEventHandler("playerDropped", function(reason)
    for adminSrc,_ in pairs(GM.Admin.inAdmin) do
        TriggerClientEvent("chatMessage", -1, "", { 255, 255, 255 }, "^2* " .. GetPlayerName(source) .." s'est déconnecté  (" .. reason .. ")")
    end
end)