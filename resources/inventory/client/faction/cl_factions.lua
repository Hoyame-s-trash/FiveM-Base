local Factions = {}

function Factions:openNearSafe()
    local localPlayer = PlayerPedId()
    local playerCoords = GetEntityCoords(localPlayer)

    for k, v in pairs(CONFIG.FACTION_INVENTORIES) do
        local safeCoords = vector3(v.x, v.y, v.z)

        local dist = #(playerCoords - safeCoords)
        if dist < CONFIG.FACTION_SAFE_OPEN_RANGE then
            TriggerServerEvent("avp_inv:OPEN_NEAR_FACTION_SAFE",
                k
            )
            break
        end
    end
end

AddEventHandler("avp_inv:onInventoryOpen", function()
    Factions:openNearSafe()
end)

AddEventHandler("avp_inv:onInventoryClose", function()

end)
