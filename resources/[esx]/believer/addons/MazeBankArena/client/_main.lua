GM.MazeBankArena = GM.MazeBankArena or {}

RegisterNetEvent("MazeBankArena:modifyArena")
AddEventHandler("MazeBankArena:modifyArena", function(arenaName)

    if (GM.MazeBankArena["list"][arenaName] == nil) then
        return
    end

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