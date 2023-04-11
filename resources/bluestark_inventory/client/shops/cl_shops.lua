local Shops = {}

function Shops:openNearShop()
    local localPlayer = PlayerPedId()
    local playerCoords = GetEntityCoords(localPlayer)

    for k, v in pairs(ScriptShared.Shops) do
        for i = 1, #v.locations, 1 do
            local shopCoords = v.locations[i]

            local dist       = #(playerCoords - shopCoords)
            if dist < CONFIG.SHOP_OPEN_RANGE then
                TriggerServerEvent("bluestark_inventory:OPEN_NEAR_SHOP",
                    k
                )
                break
            end
        end
    end
end

AddEventHandler("bluestark_inventory:onInventoryOpen", function()
    Shops:openNearShop()
end)

AddEventHandler("bluestark_inventory:onInventoryClose", function()

end)
