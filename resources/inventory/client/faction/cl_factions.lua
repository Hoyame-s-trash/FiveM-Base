local Factions = {}

function Factions:openNearSafes()
    local localPlayer = PlayerPedId()
    local playerCoords = GetEntityCoords(localPlayer)

    local closeToAny = false

    for k, v in pairs(CONFIG.FACTION_INVENTORIES) do
        local safeCoords = vector3(v.x, v.y, v.z)

        local dist = #(playerCoords - safeCoords)
        if dist < CONFIG.FACTION_SAFE_OPEN_RANGE then
            closeToAny = true
            break
        end
    end

    if closeToAny then
        TriggerServerEvent("avp_inv:OPEN_NEAR_FACTION_SAFES")
    end
end

AddEventHandler("avp_inv:onInventoryOpen", function()
    Factions:openNearSafes()
end)

AddEventHandler("avp_inv:onInventoryClose", function()

end)
