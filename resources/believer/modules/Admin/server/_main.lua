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

    if (GM.Ranks["players"][playerIdentifier]) then
        if (GM.Ranks["players"][playerIdentifier].staffName ~= playerSelected.getName()) then

            local playerRank = GM.Ranks:getFromId(GM.Ranks["players"][playerIdentifier].rankId)
            if (not playerRank) then return end

            playerRank.players[playerIdentifier].name = playerSelected.getName()

            GM.Ranks["players"][playerIdentifier].staffName = playerSelected.getName()

            MySQL.update("UPDATE user_admin SET players = ? WHERE id = ?", {
                json.encode(playerRank.players), 
                GM.Ranks["players"][playerIdentifier].rankId
            }, function()
                for adminSrc,_ in pairs(GM.Admin.inAdmin) do
                    TriggerClientEvent("Admin:updateValue", adminSrc, "ranks", GM.Ranks["players"][playerIdentifier].rankId, playerRank)
                end
            end)
        end
        playerSelected.set("rank_id", GM.Ranks["players"][playerIdentifier].rankId)
        playerSelected.set("rank_label", GM.Ranks["players"][playerIdentifier].label)
        playerSelected.setGroup(GM.Ranks["players"][playerIdentifier].name)
        GM.Chat:addPlayerToMode("STAFF", playerSrc)
    else
        playerSelected.set("rank_id", GM.Ranks["rank_user"])
        playerSelected.set("rank_label", "Joueur")
        playerSelected.setGroup("user")
    end

    -- Todo get actual vip for player

    GM.Admin.Players:new(playerSelected.getUniqueId(), playerSelected.source, playerSelected.getName(), playerSelected.get("rank_label"), 0)
end)

RegisterServerEvent("Admin:updatePlayerStaff", function(boolean)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local playerIdentifier = playerSelected:getIdentifier("main")
    if (not playerIdentifier) then return end

    local staffSelected = GM.Admin.Players:getFromId(playerSelected.source)
    if (not staffSelected) then return end

    staffSelected.admin = boolean

    if (boolean == true) then
        if (not GM.Admin.inAdmin[playerSelected.source]) then
            GM.Admin.inAdmin[playerSelected.source] = true
            TriggerClientEvent("Interface:admin", playerSelected.source, {
                type = "updateAdmin",
                admin = true,
                reports = true,
                currentReports = tostring(GM.Admin.Reports:count()),
                totalReports = tostring(GM.Ranks["players"][playerIdentifier].reports)
            })
            for adminSrc,_ in pairs(GM.Admin.inAdmin) do
                TriggerClientEvent("Admin:updateValue", adminSrc, "players", staffSelected.id, staffSelected)
            end
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
            for adminSrc,_ in pairs(GM.Admin.inAdmin) do
                TriggerClientEvent("Admin:updateValue", adminSrc, "players", staffSelected.id, staffSelected)
            end
        end
    end
end)

AddEventHandler("playerDropped", function(reason)
    for adminSrc,_ in pairs(GM.Admin.inAdmin) do
        TriggerClientEvent("chatMessage", -1, "", { 255, 255, 255 }, "^2* " .. GetPlayerName(source) .." s'est déconnecté  (" .. reason .. ")")
    end
end)