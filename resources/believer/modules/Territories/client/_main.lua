GM.Territories = GM.Territories or {}

GM.Territories.onDrugsSell, GM.Territories.onSelling = false, false

function GetTerritoriesZone(territories)
    return territories and GM.Territories.Zones[territories] or GM.Territories.Zones
end

function GetNameOfTerritories()
    return GetStreetNameFromHashKey(GetStreetNameAtCoord(GetEntityCoords(PlayerPedId()).x,GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z))
end

function GetIdOfTerritories()
    local territoriesZone, zoneName = GetTerritoriesZone(), GetNameOfZone(table.unpack(GetEntityCoords(PlayerPedId())))
    for k, v in pairs(territoriesZone) do
        if ESX.GetTableValue(v.zonesname, zoneName) then
            return k
        end
    end
    return #territoriesZone
end

function GM.Territories:GetRandomCoords()
    if GM.Territories.onDrugsSell == nil or GM.Territories.onDrugsSell == false then return end
    
    local playerCoords = GetEntityCoords(PlayerPedId())
    local CoordsDrugs, SafeCoords = GetSafeCoordForPed(playerCoords.x + GetRandomIntInRange(-40, 40), playerCoords.y + GetRandomIntInRange(-40, 40), playerCoords.z, true, 0, 16)

    if not CoordsDrugs or GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, SafeCoords.x, SafeCoords.y, SafeCoords.z) < 20 then
        return
    end

    return vector3(SafeCoords.x, SafeCoords.y, SafeCoords.z - 1.0)
end 

function GM.Territories:PlayerHasItem()
    local hasItem = false

    for _,item in pairs(ESX.PlayerData.inventory) do
        if item.count > 0 then
            if GM.Territories.Items[item.name] then
                hasItem = item.name
            end
        end
    end

    return hasItem
end

function GM.Territories:StartBoucleForSelling()
    local playerHasItem = GM.Territories:PlayerHasItem()
    if playerHasItem == nil or playerHasItem == false then return ESX.ShowNotification("~r~Vous n'avez pas ce qu'il faut sur vous.") end

    GM.Territories.onDrugsSell = not GM.Territories.onDrugsSell

    GM.Territories.onSelling  = true
    local delivery, deliveryPos = nil, nil
    while true do
        if GM.Territories.onDrugsSell == nil or GM.Territories.onDrugsSell == false then
            if delivery then
                if DoesBlipExist(delivery.blip) then
                    RemoveBlip(delivery.blip)
                    delivery.blip = nil
                end
                delivery = nil
            end
            break
        end

        playerHasItem = GM.Territories:PlayerHasItem()
        if playerHasItem == nil or playerHasItem == false then 
            if delivery then
                if DoesBlipExist(delivery.blip) then
                    RemoveBlip(delivery.blip)
                    delivery.blip = nil
                end
                playerHasItem = nil
                delivery = nil
            end
            ESX.ShowNotification("~r~Vous n'avez plus assez de marchandise.")
            break
        end

        local Interval = 250

        while deliveryPos == nil do
            Wait(0)
            ESX.ShowDrawNotification("Vous êtes a la recherche de ~b~clients~s~.", 1)
            deliveryPos = GM.Territories:GetRandomCoords()
        end
        
        if deliveryPos ~= nil and delivery == nil then
            delivery = {
                point = deliveryPos, 
                blip = GM.Blip.Create({
                    type = 501,
                    scale = 0.8,
                    pos = deliveryPos,
                    display = 4,
                    name = "Livraison",
                    color = 3
                }),
                entity = nil
            }
            
            while delivery.point == nil do
                Wait(50)
            end

            deliveryPos = nil
        else
            Interval = 0
            ESX.ShowDrawNotification("Un point de livraison a été marqué dans la ~b~zone~s~.", 1)
            if #(GetEntityCoords(PlayerPedId())-delivery["point"]) < 3.0 then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~déposer~s~ votre ~b~livraison~s~.")
                if IsControlJustReleased(0, 54) then
                    if DoesBlipExist(delivery.blip) then
                        RemoveBlip(delivery.blip)
                        delivery.blip = nil
                    end
                    TriggerServerEvent("Territories:sellDrugs", playerHasItem, GetIdOfTerritories(), GetNameOfTerritories())
                    delivery = nil
                end
            elseif #(GetEntityCoords(PlayerPedId())-delivery["point"]) < 30.0 then
                DrawMarker(1,delivery["point"],0.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,1.0,162,215,255,80,0,0,0,0,0,0,0)
            end
        end

        Wait(Interval)
    end
end

RegisterCommand("drugs", function()
    GM.Territories:StartBoucleForSelling()
end)