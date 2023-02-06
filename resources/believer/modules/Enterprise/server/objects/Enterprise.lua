GM.Enterprise = GM.Enterprise or {}
GM.Enterprise["list"] = {}
GM.Enterprise["list_players"] = {}

function GM.Enterprise:new(id, type, name, label, players, grades, money)
    local newEnterprise = {}

    setmetatable(newEnterprise, self)
    self.__index = self

    if (GM.Enterprise["list"][id] ~= nil) then return end

    newEnterprise.id = (id or (#GM.Enterprise["list"] + 1))
    newEnterprise.type = type
    newEnterprise.name = name
    newEnterprise.label = label
    newEnterprise.players = players
    newEnterprise.grades = grades
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
        if (enterprise.name == enterpriseName) then 
            return enterprise 
        end
    end
    return false
end

function GM.Enterprise:getGradeFromName(gradeName)
    for _, grade in pairs(self.grades) do
        if (grade.name == gradeName) then 
            return true 
        end
    end
    return false
end

function GM.Enterprise:getIdFromGradeName(gradeName)
    for gradeId, grade in pairs(self.grades) do
        if (grade.name == gradeName) then 
            return gradeId 
        end
    end
    return false
end