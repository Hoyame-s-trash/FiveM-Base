GM.ArenaWars = GM.ArenaWars or {}

GM.ArenaWars.currentArena = "dystopian"

RegisterServerEvent("ArenaWars:modifyArena", function(arenaName)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local playerRank = GM.Admin.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not playerRank) then return end

    if (not playerRank:getPermissionsValue("MODIFY_ARENAWARS", playerSelected.source)) then return end

    GM.ArenaWars.currentArena = arenaName

    TriggerClientEvent("ArenaWars:modifyArena", -1, arenaName)
end)

RegisterServerEvent("ArenaWars:getCurrentArena", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    TriggerClientEvent("ArenaWars:modifyArena", playerSrc, GM.ArenaWars.currentArena)
end)

GM.ArenaWars.registeredZones = {}

GM.ArenaWars["zones"] = {
    ["enter"] = {
        position = vector3(-364.29,-1856.2,19.22),
        helpText = "Entrer dans l'Arena War",
        spawnPoints = {
            { coords = vector3(2835.3,-3913.83,138.53),  heading = 358.12},
            -- { coords = vector3(2825.1,-3912.44,138.53),  heading = 1.07},
            -- { coords = vector3(2814.8,-3912.25,138.53),  heading = 359.78},
            -- { coords = vector3(2805.15,-3911.68,138.53), heading = 359.34},
            -- { coords = vector3(2794.86,-3912.99,138.53), heading = 358.99},
            -- { coords = vector3(2784.84,-3912.15,138.53), heading = 359.61},
            -- { coords = vector3(2775.1,-3911.89,138.53),  heading = 1.02},
            -- { coords = vector3(2764.97,-3911.93,138.53), heading = 2.67},
            -- { coords = vector3(2755.07,-3912.21,138.53), heading = 359.84},
        },
        onUsable = function(playerSrc)
            local playerSelected = ESX.GetPlayerFromId(playerSrc)
            if (not playerSelected) then return end

            local spawnPoints = GM.ArenaWars["zones"]["enter"]["spawnPoints"]
            local randomSpawnPoint = spawnPoints[math.random(1, #spawnPoints)]

            playerSelected.setCoords(randomSpawnPoint.coords)
            TriggerClientEvent("ArenaWars:loadIPL", playerSrc)
        end
    },
    ["exit"] = {
        position = vector3(2835.3,-3913.83,138.53),
        helpText = "Sortir de l'Arena War",
        spawnPoints = {
            { coords = vector3(-364.29,-1856.2,19.22),   heading = 12.0},
            -- { coords = vector3(-363.51,-1869.31,19.1),   heading = 12.0},
            -- { coords = vector3(-372.49,-1858.29,19.2),   heading = 12.0},
            -- { coords = vector3(-370.63,-1869.45,19.1),   heading = 12.0},
            -- { coords = vector3(-381.69,-1857.31,19.61),  heading = 12.0},
            -- { coords = vector3(-378.83,-1870.96,19.1),   heading = 12.0},
            -- { coords = vector3(-385.32,-1872.19,19.1),   heading = 12.0},
        },
        onUsable = function(playerSrc)
            local playerSelected = ESX.GetPlayerFromId(playerSrc)
            if (not playerSelected) then return end

            local spawnPoints = GM.ArenaWars["zones"]["exit"]["spawnPoints"]
            local randomSpawnPoint = spawnPoints[math.random(1, #spawnPoints)]

            playerSelected.setCoords(randomSpawnPoint.coords)
            TriggerClientEvent("ArenaWars:unLoadIpl", playerSrc)
        end
    }
}

GM:newThread(function()
    while (GM.ArenaWars["zones"] == nil) do
        Wait(150)
    end

    for zoneName, zoneValues in pairs(GM.ArenaWars["zones"]) do
        GM.ArenaWars.registeredZones[zoneName] = GM.Zone.Management:create(zoneValues.position, 5.0, zoneValues.helpText, zoneValues.onUsable, {
            private = false,
        })
    end
end)