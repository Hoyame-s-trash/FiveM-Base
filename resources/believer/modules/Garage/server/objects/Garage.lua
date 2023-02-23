GM.Garage = GM.Garage or {}
GM.Garage["list"] = {}

function GM.Garage:new(id, type, name, label, position, data)
    local newDrug = {}

    setmetatable(newDrug, self)
    self.__index = self

    if (GM.Garage["list"][id] ~= nil) then return end

    newDrug.id = (id or (#GM.Garage["list"] + 1))

    newDrug.type = type
    newDrug.name = name
    newDrug.label = label
    newDrug.position = vector3(position["x"], position["y"], position["z"])
    newDrug.data = data
    newDrug.zones = {}
    
    GM.Garage["list"][newDrug.id] = newDrug

    newDrug:addZone(newDrug.name, {
        position = newDrug.position,
        radius = 10.0,
        helpText = newDrug.label,
        onUsable = function(playerSrc)
            newDrug:use(playerSrc)
        end
    })

    return newDrug
end

function GM.Garage:getFromId(garageId)
    return GM.Garage["list"][garageId]
end

function GM.Garage:getZone(zoneName)
    return self.zones[zoneName]
end

function GM.Garage:addZone(zoneName, zoneData)
    if (self.zones[zoneName] ~= nil) then return end
    self.zones[zoneName] = GM.Zone.Management:create(zoneData.position, zoneData.radius, zoneData.helpText, zoneData.onUsable, {
        private = true,
        marker = false
    })
    
    return self.zones[zoneName]
end

AddEventHandler("playerDropped", function()
    local playerSrc = source

    if (not playerSrc) then return end

end)