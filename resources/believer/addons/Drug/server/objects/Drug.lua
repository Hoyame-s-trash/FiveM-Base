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
        radius = 10.0,
        helpText = newDrug.label,
        onUsable = function(playerSrc)
            newDrug:use(playerSrc)
        end
    })

    return newDrug
end

function GM.Drug:getFromId(drugId)
    return GM.Drug["list"][drugId]
end

function GM.Drug:getLabelFromType(drugType)
    if (drugType == "harvest") then
        return "Récolte"
    elseif (drugType == "treatment") then
        return "Traitement"
    end
end

function GM.Drug:getZone(zoneName)
    return self.zones[zoneName]
end

function GM.Drug:addZone(zoneName, zoneData)
    if (self.zones[zoneName] ~= nil) then return end
    self.zones[zoneName] = GM.Zone.Management:create(zoneData.position, zoneData.radius, zoneData.helpText, zoneData.onUsable, {
        private = true,
        marker = false
    })
    
    return self.zones[zoneName]
end

GM.Drug.onFarming = {}

function GM.Drug:use(playerSrc)
    if (not playerSrc) then return end

    if (GM.Drug.onFarming[playerSrc] ~= nil) then return end

    local checkPosition, checkVehicle, checkPlayer = false, false, false
    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    GM.Drug.onFarming[playerSrc] = true

    playerSelected.showNotification(self:getLabelFromType(self.type).." de "..self.name.." en cours.")

    GM:newThread(function()
        while true do
            local interval = 1000*5

            if checkPosition == true or checkPlayer == true then
                GM.Drug.onFarming[playerSrc] = nil
                break
            end

            if GetVehiclePedIsIn(GetPlayerPed(playerSrc), false) ~= 0 then
                playerSelected.showNotification("~r~Vous devez sortir de votre véhicule pour farm.")
                GM.Drug.onFarming[playerSrc] = nil
                checkVehicle = true
                break
            else
                interval = interval + 500
            end

            Wait(interval)
        end
    end)

    GM:newThread(function()
        while true do
            local playerCoords = playerSelected.getCoords(true)
            if #(playerCoords-self.position) > 10.0 then
                checkPosition = true
                playerSelected.showNotification("~r~Sortir de zone est interdit.")
                GM.Drug.onFarming[playerSrc] = nil
                break
            end
            
            if checkVehicle == true or checkPlayer == true then
                break
            end

            Wait(1250)
        end
    end)

    GM:newThread(function()
        while true do
            Wait(1000*5)
            
            if checkPosition == true or checkVehicle == true then
                GM.Drug.onFarming[playerSrc] = nil
                break
            end

            if (self.type == "harvest") then
                if playerSelected.canCarryItem(self.data["itemGive"], self.data["quantityGive"]) then
                    playerSelected.addInventoryItem(self.data["itemGive"], self.data["quantityGive"])
                    playerSelected.showNotification("~g~+1 "..ESX.GetItemLabel(self.data["itemGive"]))
                elseif (not playerSelected.canCarryItem(self.data["itemGive"], self.data["quantityGive"])) then
                    playerSelected.showNotification("~r~Vous n'avez pas assez de place sur vous.")
                    GM.Drug.onFarming[playerSrc] = nil
                    break
                end
            elseif (self.type == "treatment") then
                local playerItem = playerSelected.getInventoryItem(self.data["itemTake"])
                if (playerItem == nil) then
                    playerSelected.showNotification("~r~Vous n'avez pas assez de "..ESX.GetItemLabel(self.data["itemTake"]).." sur vous.")
                    GM.Drug.onFarming[playerSrc] = nil
                    break
                end
                if (playerItem.count >= tonumber(self.data["quantityTake"])) then
                    if (playerSelected.canCarryItem(self.data["itemGive"], self.data["quantityGive"])) then
                        playerSelected.removeInventoryItem(self.data["itemTake"], self.data["quantityTake"])
                        playerSelected.addInventoryItem(self.data["itemGive"], self.data["quantityGive"])
                        playerSelected.showNotification("~g~+1 "..ESX.GetItemLabel(self.data["itemGive"]))
                    else
                        playerSelected.showNotification("~r~Vous n'avez pas assez de place sur vous.")
                    end
                elseif (playerSelected.getInventoryItem(self.data["itemTake"])["count"] < tonumber(self.data["quantityTake"])) then
                    playerSelected.showNotification("~r~Vous n'avez pas assez de "..ESX.GetItemLabel(self.data["itemTake"]).." sur vous.")
                    GM.Drug.onFarming[playerSrc] = nil
                    break
                end
            end
        end
    end)
end

AddEventHandler("playerDropped", function()
    local playerSrc = source

    if (not playerSrc) then return end

    if (GM.Drug.onFarming[playerSrc] ~= nil) then
        GM.Drug.onFarming[playerSrc] = nil
    end
end)