GM.Admin = GM.Admin or {}

GM.Admin.inAdmin = {}

AddEventHandler("esx:playerLoaded", function(playerSrc)
    local playerSrc = playerSrc
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local playerIdentifier = playerSelected.getIdentifier()
    if (not playerIdentifier) then return end

    if (GM.Admin.Ranks["players"][playerIdentifier]) then
        if (GM.Admin.Ranks["players"][playerIdentifier].staffName ~= playerSelected.getName()) then

            local playerRank = GM.Admin.Ranks:getFromId(GM.Admin.Ranks["players"][playerIdentifier].rankId)
            if (not playerRank) then return end

            playerRank.players[playerIdentifier].name = playerSelected.getName()

            GM.Admin.Ranks["players"][playerIdentifier].staffName = playerSelected.getName()

            MySQL.update('UPDATE user_admin SET players = ? WHERE id = ?', {
                json.encode(playerRank.players), 
                GM.Admin.Ranks["players"][playerIdentifier].rankId
            }, function()
                for adminSrc,_ in pairs(GM.Admin.inAdmin) do
                    TriggerClientEvent("Admin:updateValue", adminSrc, "ranks", GM.Admin.Ranks["players"][playerIdentifier].rankId, playerRank)
                end
            end)
        end
        playerSelected.set("rank_id", GM.Admin.Ranks["players"][playerIdentifier].rankId)
        playerSelected.setGroup(GM.Admin.Ranks["players"][playerIdentifier].name)
    else
        playerSelected.set("rank_id", GM.Admin.Ranks["rank_user"])
        playerSelected.setGroup("user")
    end

    --GM.Admin.Players:new(playerSelected.source, playerSelected:getNickname(), playerIdentifier)
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
            if (playerSelected.getGroup() ~= "founder") then
                TriggerEvent('::{IlIIIlIIllllIIlIlI}::esx_skin:getPlayerSkinSv', playerIdentifier, function(skin)
                    TriggerClientEvent("Beliver:admin:setPed", playerSrc, "u_m_y_chip")
                end)
            end
        end
    elseif (boolean == false) then
        -- Todo check if number report increase and if it's the case updat in DB number report of player
        if (GM.Admin.inAdmin[playerSelected.source]) then
            GM.Admin.inAdmin[playerSelected.source] = nil
            TriggerClientEvent("Interface:admin", playerSelected.source, {
                type = "updateAdmin",
                admin = false,
                reports = false,
                currentReports = "0",
                totalReports = "0"
            })
            if (playerSelected.getGroup() ~= "founder") then
                TriggerEvent('::{IlIIIlIIllllIIlIlI}::esx_skin:getPlayerSkinSv', playerIdentifier, function(skin)
                    local ped = skin.sex == 0 and 'mp_m_freemode_01' or 'mp_f_freemode_01'
                    TriggerClientEvent("Beliver:admin:setPed", playerSrc, ped)
                    TriggerClientEvent('::{IlIIIlIIllllIIlIlI}::skinchanger:loadSkin', playerSrc, skin)
                end)
            end
        end
    end
end)