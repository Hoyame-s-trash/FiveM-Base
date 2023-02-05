GM.Enterprise = GM.Enterprise or {}
GM.Enterprise["list"] = {}
GM.Enterprise["list_players"] = {}

function GM.Enterprise:new(id, type, name, label, players, ranks, money)
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

    print("New enterprise created: " .. newEnterprise.name .. " (" .. newEnterprise.id .. ")")

    return newEnterprise
end

function GM.Enterprise:getFromId(enterpriseId)
    return GM.Enterprise["list"][enterpriseId]
end

function GM.Enterprise:getFromName(enterpriseName)
    for _, enterprise in pairs(GM.Enterprise["list"]) do
        if (enterprise.name == enterpriseName) then 
            return enterprise 
        end
    end
    return false
end

function GM.Enterprise:getRankFromName(rankName)
    for _, rank in pairs(self.ranks) do
        if (rank.name == rankName) then 
            return true 
        end
    end
    return false
end

function GM.Enterprise:generateRankId()
    return (#self.ranks + 1)
end

function GM.Enterprise:getIdFromRankName(rankName)
    for rankId, rank in pairs(self.ranks) do
        if (rank.name == rankName) then 
            return rankId 
        end
    end
    return false
end