GM.Admin = GM.Admin or {}
GM.Admin.Players = {}
GM.Admin.Players["list"] = {}

function GM.Admin.Players:new(uniqueId, source, name, rank)
    local newAdminPlayer = {}

    setmetatable(newAdminPlayer, self)
    self.__index = self

    if (GM.Admin.Players["list"][id] ~= nil) then return end

    newAdminPlayer.id = (source or (#GM.Admin.Players["list"] + 1))

    newAdminPlayer.source = source
    newAdminPlayer.name = name
    newAdminPlayer.rank = rank
    newAdminPlayer.connected_date = os.date("%H:%M")

    GM.Admin.Players["list"][newAdminPlayer.id] = newAdminPlayer

    for adminSrc,_ in pairs(GM.Admin.inAdmin) do
        TriggerClientEvent("Admin:updateValue", adminSrc, "players", newAdminPlayer.id, newAdminPlayer)
    end

    return newAdminPlayer
end

function GM.Admin.Players:getFromId(reportId)
    return GM.Admin.Players["list"][reportId]
end

RegisterServerEvent("Admin:requestPlayers", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    TriggerClientEvent("Admin:updateValue", playerSrc, "players", GM.Admin.Players["list"])
end)

AddEventHandler("Player:destroy", function(playerSrc)
    if (not playerSrc) then return end

    if (GM.Admin.Players["list"][playerSrc]) then
        GM.Admin.Players["list"][playerSrc] = nil
        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Admin:removeValue", adminSrc, "players", playerSrc)
        end
    end
end)