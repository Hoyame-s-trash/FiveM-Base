RegisterNUICallback("ITEM_MOVE_TO_SLOT", function(d, cb)
    TriggerServerEvent("avp_inv:ITEM_MOVE_TO_SLOT", d)
    cb({})
end)
RegisterNUICallback("ADD_NOTE_ITEM", function(d, cb)
    TriggerServerEvent("avp_inv:ADD_NOTE_ITEM", d)
    cb({})
end)
RegisterNUICallback("RENAME_ITEM", function(d, cb)
    TriggerServerEvent("avp_inv:RENAME_ITEM", d)
    cb({})
end)
RegisterNUICallback("USE_ITEM", function(d, cb)
    TriggerServerEvent("avp_inv:USE_ITEM", d)
    cb({})
end)
RegisterNUICallback("BUY_FROM_SHOP", function(d, cb)
    TriggerServerEvent("avp_inv:BUY_FROM_SHOP", d)
    cb({})
end)
RegisterNUICallback("ITEM_ADD_ATTACHMENT_WEAPON", function(d, cb)
    TriggerServerEvent("avp_inv:ITEM_ADD_ATTACHMENT_WEAPON", d)
    cb({})
end)
RegisterNUICallback("ITEM_REMOVE_ATTACHMENT_WEAPON", function(d, cb)
    TriggerServerEvent("avp_inv:ITEM_REMOVE_ATTACHMENT_WEAPON", d)
    cb({})
end)
RegisterNUICallback("CLOSE_SECOND_INVENTORY", function(d, cb)
    local uniqueID = d.uniqueID
    TriggerServerEvent("avp_inv:CLOSE_SECOND_INVENTORY", uniqueID)
    cb({})
end)
RegisterNUICallback("NEARBY_GET_PLAYERS", function(_, cb)
    local localPlayer = PlayerPedId()
    local playerPos = GetEntityCoords(localPlayer)
    local players = GetActivePlayers()

    local nearPlayers = {}

    for k, v in pairs(players) do
        local ped = GetPlayerPed(v)
        if ped ~= localPlayer then
            local dist = #(playerPos - GetEntityCoords(ped))
            if dist < CONFIG.NEARBY_PLAYER_RANGE then
                local name = nil
                if CONFIG.NEARBY_PLAYERS_SHOW_NAMES then
                    name = GetPlayerName(v)
                end

                nearPlayers[#nearPlayers + 1] = {
                    serverId = GetPlayerServerId(v),
                    name = name
                }
            end
        end
    end

    if #nearPlayers < 1 then
        _G.APIClient.LocalPlayer:notification("info", "No players are nearby!")
    end

    cb(nearPlayers)
end)
RegisterNUICallback("GIVE_ITEM_TO_TARGET", function(d, cb)
    TriggerServerEvent("avp_inv:GIVE_ITEM_TO_TARGET", d)
    cb({})
end)
RegisterNUICallback("DROP_ITEM_ON_GROUND", function(d, cb)
    TriggerServerEvent("avp_inv:DROP_ITEM_ON_GROUND", d)
    cb({})
end)
