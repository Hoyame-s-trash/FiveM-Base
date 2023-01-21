GM.Drug = GM.Drug or {}
GM.Drug["list"] = {}

function GM.Drug:new(id, type, name, label, position, data)
    local newDrug = {}

    setmetatable(newDrug, self)
    self.__index = self

    if (GM.Drug["list"][id] ~= nil) then return end

    newDrug.id = (id or (#GM.Drug["list"] + 1))

    newDrug.type = type
    newDrug.name = name
    newDrug.label = label
    newDrug.position = vector3(position["x"], position["y"], position["z"])
    newDrug.data = data
    newDrug.zones = {}
    
    GM.Drug["list"][newDrug.id] = newDrug

    newDrug:addZone(newDrug.name, {
        position = newDrug.position,
        helpText = newDrug.label,
        onUsable = function(playerSrc)
            print(newDrug.label, playerSrc)
        end
    })

    return newDrug
end

function GM.Drug:getFromId(drugId)
    return GM.Drug["list"][drugId]
end

function GM.Drug:getZone(zoneName)
    return self.zones[zoneName]
end

function GM.Drug:addZone(zoneName, zoneData)
    if (self.zones[zoneName] ~= nil) then return end
    self.zones[zoneName] = GM.Zone.Management:create(zoneData.position, zoneData.radius, zoneData.helpText, zoneData.onUsable, {
        private = true
    })
    return self.zones[zoneName]
end

AddEventHandler("Player:destroy", function(playerSrc)
    if (not playerSrc) then return end


    -- Todo if player is in a zone, remove him from it if is farming
end)