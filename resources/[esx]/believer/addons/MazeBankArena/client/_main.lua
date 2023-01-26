GM.MazeBankArena = GM.MazeBankArena or {}

GM:newThread(function()
    while (GM.MazeBankArena["list"] == nil) do
        Wait(150)
    end

    GM.MazeBankArena.currentArena = "basketball"

    TriggerEvent("MazeBankArena:modifyArena", "basketball")
end)

RegisterNetEvent("MazeBankArena:modifyArena")
AddEventHandler("MazeBankArena:modifyArena", function(arenaName)

    if (GM.MazeBankArena["list"][arenaName] == nil) then
        return
    end

    if (GM.MazeBankArena.currentArena == arenaName) then
        return
    end

    local currentInterior = GM.MazeBankArena["list"][GM.MazeBankArena.currentArena]

    local oldInterior = GM.MazeBankArena["list"][arenaName]

    RequestIpl(oldInterior.ipl)
    local oldInteriorID = GetInteriorAtCoords(oldInterior.coords.x, oldInterior.coords.y, oldInterior.coords.z)
    if IsValidInterior(oldInteriorID) then
        for __, entitySet in ipairs(oldInterior.entitySets) do
            if entitySet.enable then
                EnableInteriorProp(oldInteriorID, entitySet.name)
                if entitySet.color then
                    SetInteriorPropColor(oldInteriorID, entitySet.name, entitySet.color)
                end
            else
                DisableInteriorProp(oldInteriorID, entitySet.name)
            end
        end
        RefreshInterior(oldInteriorID)
    end

    GM.MazeBankArena.currentArena = arenaName

    local interior = GM.MazeBankArena["list"][arenaName]

    RequestIpl(interior.ipl)
    local interiorID = GetInteriorAtCoords(interior.coords.x, interior.coords.y, interior.coords.z)
    if IsValidInterior(interiorID) then
        for __, entitySet in ipairs(interior.entitySets) do
            if entitySet.enable then
                EnableInteriorProp(interiorID, entitySet.name)
                if entitySet.color then
                    SetInteriorPropColor(interiorID, entitySet.name, entitySet.color)
                end
            else
                DisableInteriorProp(interiorID, entitySet.name)
            end
        end
        RefreshInterior(interiorID)
    end
end)