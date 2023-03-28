GM.ArenaWars = GM.ArenaWars or {}

local IplLoaded = false

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

RegisterNetEvent("ArenaWars:loadIPL", function()
    LoadIPL()
end)

RegisterNetEvent("ArenaWars:unLoadIpl", function()
    UnloadIPL()
end)