GM.Police = GM.Police or {}

GM.Police.registeredZones = {}
GM.Police.registeredZones["lockers"] = {}
GM.Police.registeredZones["garages"] = {}

GM.Police.registeredBlips = {}
GM.Police.registeredBlips["lockers"] = {}
GM.Police.registeredBlips["garages"] = {}

GM:newThread(function()
    while (GM.Police.Lockers == nil) do
        Wait(100)
    end

    for i = 1, #GM.Police.Lockers.positions do
        local lockerId = "lockers_" .. i
        local locker = GM.Police.Lockers.positions[i]

        GM.Police.registeredZones["lockers"][lockerId] = GM.Zone.Management:create(GM.Police.Lockers.positions[i], 2.0, "pour accéder à votre casier", function(playerSrc)
            local playerSelected = ESX.GetPlayerFromId(playerSrc)
            if (not playerSelected) then return end

            local selectedStash = exports["believer"]:GetInventory("police_locker_"..playerSelected.identifier.."_"..i)
            if (selectedStash == nil) then
                exports["believer"]:RegisterStash({
                    isPublic = false,
                    isPermanent = true,
                    ownerLicense = playerSelected.identifier,
                    inventoryName = "Casier police "..playerSelected.getName(),
                    maxWeight = 200,
                    slotsAmount = 30,
                    uniqueID = "police_locker_"..playerSelected.identifier.."_"..i,
                })

                exports["believer"]:OpenStash(playerSelected.source, "police_locker_"..playerSelected.identifier.."_"..i)
            else
                exports["believer"]:OpenStash(playerSelected.source, "police_locker_"..playerSelected.identifier.."_"..i)
            end
            TriggerClientEvent("Inventory:openInventory", playerSelected.source)
        end, {
            private = false,
            marker = true
        })
        GM.Police.registeredBlips["lockers"][lockerId] = GM.Blip:add(locker, {
            sprite = 1,
            colour = 3,
            name = "Police - Casier - "..i,
            display = 5,
        })
        -- GM.Police["Pacific"].ped = GM.Ped:create(9, GM.Config.Bank["Pacific"].ped["model"], {
        --     x = GM.Config.Bank["Pacific"].ped["position"].x,
        --     y = GM.Config.Bank["Pacific"].ped["position"].y,
        --     z = GM.Config.Bank["Pacific"].ped["position"].z
        -- }, GM.Config.Bank["Pacific"].ped["heading"])
    end
end)

GM:newThread(function()
    while (GM.Police.Lockers == nil) do
        Wait(100)
    end

    for i = 1, #GM.Police.Lockers.positions do
        local lockerId = "lockers_" .. i
        local locker = GM.Police.Lockers.positions[i]

        GM.Police.registeredZones["lockers"][lockerId] = GM.Zone.Management:create(GM.Police.Lockers.positions[i], 2.0, "pour accéder à votre casier", function(playerSrc)
            local playerSelected = ESX.GetPlayerFromId(playerSrc)
            if (not playerSelected) then return end

            local selectedStash = exports["believer"]:GetInventory("police_locker_"..playerSelected.identifier.."_"..i)
            if (selectedStash == nil) then
                exports["believer"]:RegisterStash({
                    isPublic = false,
                    isPermanent = true,
                    ownerLicense = playerSelected.identifier,
                    inventoryName = "Casier police "..playerSelected.getName(),
                    maxWeight = 200,
                    slotsAmount = 30,
                    uniqueID = "police_locker_"..playerSelected.identifier.."_"..i,
                })

                exports["believer"]:OpenStash(playerSelected.source, "police_locker_"..playerSelected.identifier.."_"..i)
            else
                exports["believer"]:OpenStash(playerSelected.source, "police_locker_"..playerSelected.identifier.."_"..i)
            end
            TriggerClientEvent("Inventory:openInventory", playerSelected.source)
        end, {
            private = false,
            marker = true
        })
        GM.Police.registeredBlips["lockers"][lockerId] = GM.Blip:add(locker, {
            sprite = 1,
            colour = 3,
            name = "Police - Casier - "..i,
            display = 5,
        })
        -- GM.Police["Pacific"].ped = GM.Ped:create(9, GM.Config.Bank["Pacific"].ped["model"], {
        --     x = GM.Config.Bank["Pacific"].ped["position"].x,
        --     y = GM.Config.Bank["Pacific"].ped["position"].y,
        --     z = GM.Config.Bank["Pacific"].ped["position"].z
        -- }, GM.Config.Bank["Pacific"].ped["heading"])
    end
end)