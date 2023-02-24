GM.Garage = GM.Garage or {}
GM.Garage["list"] = {}

function GM.Garage:new(id, name, label, menuPosition, spawnPosition, spawnHeading, deletePosition)
    local newGarage = {}

    setmetatable(newGarage, self)
    self.__index = self

    if (GM.Garage["list"][id] ~= nil) then return end

    newGarage.id = (id or (#GM.Garage["list"] + 1))

    newGarage.name = name
    newGarage.label = label
    newGarage.menuPosition = vector3(menuPosition["x"], menuPosition["y"], menuPosition["z"])
    newGarage.spawnPosition = vector3(spawnPosition["x"], spawnPosition["y"], spawnPosition["z"])
    newGarage.spawnHeading = spawnHeading
    newGarage.deletePosition = vector3(deletePosition["x"], deletePosition["y"], deletePosition["z"])

    newGarage.zones = {}
    
    GM.Garage["list"][newGarage.id] = newGarage

    newGarage:addZone("garage_enter", {
        position = newGarage.menuPosition,
        radius = 4.0,
        helpText = "pour ouvrir le ~b~garage~s~.",
        onUsable = function(playerSrc)
            print("OPEN GARAGE MENU")
        end
    })

    newGarage:addZone("garage_exit", {
        position = newGarage.menuPosition,
        radius = 4.0,
        helpText = "ranger votre ~b~véhicule~s~.",
        onUsable = function(playerSrc)
            print("DESPAWN VEHICLE AND SAVE IT")
        end
    })

    return newGarage
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
        private = false,
        marker = true
    })
    
    return self.zones[zoneName]
end