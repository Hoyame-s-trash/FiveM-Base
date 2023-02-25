GM.Garage = GM.Garage or {}
GM.Garage["list"] = {}
GM.Garage["vehicle_list"] = {}

function GM.Garage:new(id, type, name, label, menuPosition, spawnPosition, spawnHeading, deletePosition)
    local newGarage = {}

    setmetatable(newGarage, self)
    self.__index = self

    if (GM.Garage["list"][id] ~= nil) then return end

    newGarage.id = (id or (#GM.Garage["list"] + 1))

    newGarage.type = type
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
            newGarage:requestVehicle(playerSrc)
        end
    })

    newGarage:addZone("garage_exit", {
        position = newGarage.deletePosition,
        radius = 4.0,
        helpText = "ranger votre ~b~véhicule~s~.",
        onUsable = function(playerSrc)
            local playerVehicle = GetVehiclePedIsIn(playerPed, false)
            if (playerVehicle) then
                TriggerClientEvent("Garage:requestStore", playerSrc)
            else
                TriggerClientEvent("esx:showNotification", playerSrc, "~r~Vous n'êtes pas dans un véhicule.")
            end
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

function GM.Garage:requestVehicle(playerSrc)
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    local playerIdentifier = playerSelected.getIdentifier()
    if (not playerIdentifier) then return end

    if (GM.Garage["vehicle_list"][playerSrc] == nil) then
        GM.Garage["vehicle_list"][playerSrc] = {}
    end

    if (GM.Garage["vehicle_list"][playerSrc][self.type] ~= nil) then
        TriggerClientEvent("Garage:UpdateValue", playerSrc, "vehicles", GM.Garage["vehicle_list"][playerSrc][self.type])

        TriggerClientEvent("Garage:openMenuGarage", playerSrc, self.type, self.spawnPosition, self.spawnHeading)
        return
    end

    local vehicleList = {}

    local ownedVehicles = MySQL.query.await('SELECT * FROM owned_vehicles WHERE owner = @owner AND type = @type', {
        ['@owner'] = playerIdentifier,
        ["@type"] = self.type,
    })
    if ownedVehicles then
        for i = 1, #ownedVehicles do
            local vehicleOwner = ownedVehicles[i]["owner"]
            local vehicleData = json.decode(ownedVehicles[i]["vehicle"])
            local vehicleModel = vehicleData["model"]
            local vehiclePlate = vehicleData["plate"]
            local vehicleLabel = ownedVehicles[i]["label"]
            local vehicleStored = ownedVehicles[i]["stored"]
            local vehicleJob = ownedVehicles[i]["job"]

            local vehicleType = "Owned"

            if (ownedVehicles[i]["boutique"] == 1) then
                vehicleType = "Boutique"
            else
                vehicleType = "Owned"
            end

            table.insert(vehicleList, {
                type = vehicleType,
                owner = vehicleOwner,
                label = vehicleLabel or vehicleModel,
                model = vehicleModel,
                properties = vehicleData,
                plate = vehiclePlate,
                stored = vehicleStored,
                job = vehicleJob,
            })
        end
    end

    local jobVehicles = MySQL.query.await('SELECT * FROM owned_vehicles WHERE job = @job AND type = @type', {
        ['@job'] = playerSelected.job.name,
        ["@type"] = self.type,
    })
    if jobVehicles then
        for i = 1, #jobVehicles do
            local vehicleOwner = jobVehicles[i]["owner"]
            local vehicleData = json.decode(jobVehicles[i]["vehicle"])
            local vehicleModel = vehicleData["model"]
            local vehiclePlate = vehicleData["plate"]
            local vehicleLabel = jobVehicles[i]["label"]
            local vehicleStored = jobVehicles[i]["stored"]
            local vehicleJob = ownedVehicles[i]["job"]

            if (jobVehicles[i]["owned"] ~= playerIdentifier) then

                table.insert(vehicleList, {
                    type = "Job",
                    owner = vehicleOwner,
                    label = vehicleLabel or vehicleModel,
                    model = vehicleModel,
                    properties = vehicleData,
                    plate = vehiclePlate,
                    stored = vehicleStored,
                    job = vehicleJob,
                })
            end
        end
    end

    local orgaVehicles = MySQL.query.await('SELECT * FROM owned_vehicles WHERE orga = @orga AND type = @type', {
        ['@orga'] = playerSelected.orga.name,
        ["@type"] = self.type,
    })
    if orgaVehicles then
        for i = 1, #orgaVehicles do
            local vehicleOwner = orgaVehicles[i]["owner"]
            local vehicleData = json.decode(orgaVehicles[i]["vehicle"])
            local vehicleModel = vehicleData["model"]
            local vehiclePlate = vehicleData["plate"]
            local vehicleLabel = orgaVehicles[i]["label"]
            local vehicleStored = orgaVehicles[i]["stored"]
            local vehicleJob = ownedVehicles[i]["job"]

            if (orgaVehicles[i]["owned"] ~= playerIdentifier) then

                table.insert(vehicleList, {
                    type = "Orga",
                    owner = vehicleOwner,
                    label = vehicleLabel or vehicleModel,
                    model = vehicleModel,
                    properties = vehicleData,
                    plate = vehiclePlate,
                    stored = vehicleStored,
                    job = vehicleJob
                })
            end
        end
    end

	GM.Garage["vehicle_list"][playerSrc][self.type] = vehicleList

    TriggerClientEvent("Garage:UpdateValue", playerSrc, "vehicles", vehicleList)

    TriggerClientEvent("Garage:openMenuGarage", playerSrc, self.type, self.spawnPosition, self.spawnHeading)
end