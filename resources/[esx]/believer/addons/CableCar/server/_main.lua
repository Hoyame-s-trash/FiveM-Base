GM.CableCar = GM.CableCar or {}

GM.CableCar.registeredZones = {}

GM:newThread(function()
    for trackId, track in pairs(GM.CableCar.Tracks) do
        if (GM.CableCar.registeredZones[trackId] == nil) then
            GM.CableCar.registeredZones[trackId] = {}
        end

        local interactCoords = track.Coords[1] - vector3(0.0, 0.0, 3.0)

        GM.CableCar.registeredZones[trackId][1] = GM.Zone.Management:create(interactCoords, 5.0, "démarrer le téléphérique (~g~"..GM.CableCar.Price.."$~b~)", function(playerSrc)
            print("TrackId", trackId, "Zone Id :", 1)
            --TriggerClientEvent("CableCar:start", playerSrc, true)
        end, {
            private = false,
            marker = false
        })

        local interactCoords = track.Coords[#track.Coords] - vector3(0.0, 0.0, 3.0)
        GM.CableCar.registeredZones[trackId][2] = GM.Zone.Management:create(interactCoords, 5.0, "démarrer le téléphérique (~g~"..GM.CableCar.Price.."$~b~)", function(playerSrc)
            print("TrackId", trackId, "Zone Id :", 2)
            --TriggerClientEvent("CableCar:start", playerSrc, false)
        end, {
            private = false,
            marker = false
        })
    end
end)

-- Todo check and figure out the current zone