GM.ArenaWars = GM.ArenaWars or {}

local IplLoaded = false

-- ArenaCoords.TeleportZones = {
--     ArenaEnter = {
--         CheckJob  = false,
--         Instance  = "arenawars",
--         Pos       = vector3(-389.43,-1879.49,19.54),
--         Size      = vector3(4.0, 4.0, 0.2),
--         Color     = {r = 239, g = 219, b = 91},
--         Marker    = 1,
--         Hint      = "Appuyez sur ~INPUT_CONTEXT~ entrer dans l\"Arena War",
--         SpawnPoints = {
--             { coords = vector3(2835.3,-3913.83,138.53),  heading = 358.12,  radius = 4.0 },
--             { coords = vector3(2825.1,-3912.44,138.53),  heading = 1.07,    radius = 4.0 },
--             { coords = vector3(2814.8,-3912.25,138.53),  heading = 359.78,  radius = 4.0 },
--             { coords = vector3(2805.15,-3911.68,138.53), heading = 359.34,  radius = 4.0 },
--             { coords = vector3(2794.86,-3912.99,138.53), heading = 358.99,  radius = 4.0 },
--             { coords = vector3(2784.84,-3912.15,138.53), heading = 359.61,  radius = 4.0 },
--             { coords = vector3(2775.1,-3911.89,138.53),  heading = 1.02,    radius = 4.0 },
--             { coords = vector3(2764.97,-3911.93,138.53), heading = 2.67,    radius = 4.0 },
--             { coords = vector3(2755.07,-3912.21,138.53), heading = 359.84,  radius = 4.0 },
--         },
--         Callback = function()
--             LoadIPL()
--         end
--     },
--     ArenaExit  = {
--         CheckJob  = false,
--         DisplayInInstance = "arenawars",
--         Pos       = vector3(2844.93, -3917.14, 139.05),
--         Size      = vector3(4.0, 4.0, 0.2),
--         Color     = {r = 239, g = 219, b = 91},
--         Marker    = 1,
--         Hint      = "Appuyez sur ~INPUT_CONTEXT~ sortir de l\"Arena War",
--         SpawnPoints = {
--             { coords = vector3(-364.29,-1856.2,19.22),   heading = 12.0, radius = 4.0 },
--             { coords = vector3(-363.51,-1869.31,19.1),   heading = 12.0, radius = 4.0 },
--             { coords = vector3(-372.49,-1858.29,19.2),   heading = 12.0, radius = 4.0 },
--             { coords = vector3(-370.63,-1869.45,19.1),   heading = 12.0, radius = 4.0 },
--             { coords = vector3(-381.69,-1857.31,19.61),  heading = 12.0, radius = 4.0 },
--             { coords = vector3(-378.83,-1870.96,19.1),   heading = 12.0, radius = 4.0 },
--             { coords = vector3(-385.32,-1872.19,19.1),   heading = 12.0, radius = 4.0 },
--         },
--         Callback = function()
--             UnloadIPL()
--         end
--     },
-- }

function UnloadInterior()
    local interiorId = GetInteriorAtCoords(2800.000, -3800.000, 100.000)
    for _, mappingList in pairs(GM.ArenaWars["list"]) do
        for _, mappingName in pairs(mappingList) do
            DeactivateInteriorEntitySet(interiorId, mappingName)
        end
    end
    RefreshInterior(interiorId)
end

function LoadIPL()
    if not IplLoaded then 
        IplLoaded = true
        RequestIpl("xs_arena_interior")

        local interiorID = GetInteriorAtCoords(2800.000, -3800.000, 100.000)
        ActivateInteriorEntitySet(interiorID, "Set_Crowd_A")
        ActivateInteriorEntitySet(interiorID, "Set_Crowd_B")
        ActivateInteriorEntitySet(interiorID, "Set_Crowd_C")
        ActivateInteriorEntitySet(interiorID, "Set_Crowd_D")
    
        TriggerServerEvent("ArenaWars:getCurrentArena")
    end
end

function UnloadIPL()
    if IplLoaded then 
        IplLoaded = false
        UnloadInterior()
        RemoveIpl("xs_arena_interior")
        local interiorID = GetInteriorAtCoords(2800.000, -3800.000, 100.000)
        DeactivateInteriorEntitySet(interiorID, "Set_Crowd_A")
        DeactivateInteriorEntitySet(interiorID, "Set_Crowd_B")
        DeactivateInteriorEntitySet(interiorID, "Set_Crowd_C")
        DeactivateInteriorEntitySet(interiorID, "Set_Crowd_D")
    end
end

RegisterNetEvent("ArenaWars:modifyArena")
AddEventHandler("ArenaWars:modifyArena", function(mappingName)
    local interiorID = GetInteriorAtCoords(2800.000, -3800.000, 100.000)
    UnloadInterior()
    ActivateInteriorEntitySet(interiorID, mappingName)
    RefreshInterior(interiorId)
end)