GM.Enterprise = GM.Enterprise or {}
GM.Enterprise["list"] = {}
GM.Enterprise["list_players"] = {}

function GM.Enterprise:new(id, type, name, label, players, ranks, zones_saved, money)
    local newEnterprise = {}

    setmetatable(newEnterprise, self)
    self.__index = self

    if (GM.Enterprise["list"][id] ~= nil) then return end

    newEnterprise.id = (id or (#GM.Enterprise["list"] + 1))
    newEnterprise.type = type
    newEnterprise.name = name
    newEnterprise.label = label
    newEnterprise.players = players
    newEnterprise.ranks = ranks
    newEnterprise.zones = zones or {}
    newEnterprise.zones_saved = zones_saved or {}
    newEnterprise.money = money

    for playerIdentifier, playerValues in pairs(newEnterprise.players) do
        if (not GM.Enterprise["list_players"][playerIdentifier]) then
            GM.Enterprise["list_players"][playerIdentifier] = {}
        end
        GM.Enterprise["list_players"][playerIdentifier] = {
            enterprise_id = newEnterprise.id,
            name = newEnterprise.name,
            label = newEnterprise.label,
        }
    end

    GM.Enterprise["list"][newEnterprise.id] = newEnterprise

    return newEnterprise
end

function GM.Enterprise:getFromId(enterpriseId)
    return GM.Enterprise["list"][enterpriseId]
end

function GM.Enterprise:getFromName(enterpriseName)
    for _, enterprise in pairs(GM.Enterprise["list"]) do
        if (enterprise.name == enterpriseName) then return enterprise end
    end
    return false
end

function GM.Enterprise:getRankFromName(rankName)
    for _, rank in pairs(self.ranks) do
        if (rank.name == rankName) then return true end
    end
    return false
end

function GM.Enterprise:generateRankId()
    return (#self.ranks + 1)
end

function GM.Enterprise:getIdFromRankName(rankName)
    for rankId, rank in pairs(self.ranks) do
        if (rank.name == rankName) then return rankId end
    end
    return false
end

function GM.Enterprise:getZone(zoneName)
    return self.zones[zoneName]
end

function GM.Enterprise:addZone(zoneName, zoneData)
    if (self.zones_saved[zoneName] == nil) then

        self.zones_saved[zoneName] = {
            position = zoneData.position,
            radius = zoneData.radius,
        }

        self.zones[zoneName] = GM.Zone.Management:create(zoneData.position, zoneData.radius, zoneData.helpText, zoneData.onUsable, {
            private = false,
            marker = true
        })

        MySQL.update('UPDATE user_enterprise SET zones = ? WHERE id = ?', {
            json.encode(self.zones_saved), 
            self.id
        }, function()
            for adminSrc,_ in pairs(GM.Admin.inAdmin) do
                TriggerClientEvent("Admin:updateValue", adminSrc, "enterprises", self.id, self)
            end
        end)
    else
        local zonePosition = vector3(self.zones_saved[zoneName].position.x, self.zones_saved[zoneName].position.y, self.zones_saved[zoneName].position.z)

        self.zones[zoneName] = GM.Zone.Management:create(zonePosition, self.zones_saved[zoneName].radius, zoneData.helpText, zoneData.onUsable, {
            private = false,
            marker = true
        })
    end
    
    return self.zones[zoneName]
end

RegisterServerEvent("Admin:requestEnterprises", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    TriggerClientEvent("Admin:updateValue", playerSrc, "enterprises", GM.Enterprise["list"])
end)