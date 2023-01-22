GM.Territories = GM.Territories or {}
GM.Territories["list"] = {}

function GM.Territories:new(id, namecontrol, influence)
    local newTerritories = {}

    setmetatable(newTerritories, self)
    self.__index = self

    if (GM.Territories["list"][id] ~= nil) then return end

    newTerritories.id = (id or (#GM.Territories["list"] + 1))

    newTerritories.namecontrol = namecontrol
    newTerritories.influence = influence
    
    GM.Territories["list"][newTerritories.id] = newTerritories

    return newTerritories
end

function GM.Territories:getFromId(territoriesId)
    return GM.Territories["list"][territoriesId]
end