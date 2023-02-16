RequestedGift = false

function DisplayClosestPlayers()
    local myPed = PlayerPedId()
    local myPos = GetEntityCoords(myPed)

    local closestPlayers = {}
    for k, v in pairs(GetActivePlayers()) do
        local ped = GetPlayerPed(v)
        local otherPos = GetEntityCoords(ped)
        if #(myPos - otherPos) < 10 and GetPlayerServerIDFromPed(ped) ~= GetPlayerServerIDFromPed(myPed) then
            table.insert(closestPlayers, {
                name = GetPlayerName(v),
                id = GetPlayerServerIDFromPed(ped),
            })
        end
    end

    SendNUIMessage({
        type = "display_closest_players_keys",
        closestPlayers = closestPlayers,
    })
    SetNuiFocus(true, true)
end

--- player do not wish to pay so we will set nui focus on false
RegisterNUICallback("userSelectedPlayer", function(data, cb)
    SetNuiFocus(false, false)
    TriggerServerEvent("rcore_carnival:requestedGift", data.SelectedID, AnimSetPlayer)

    if cb then cb('ok') end
end)

RegisterNetEvent("rcore_carnival:denyRequest", function(farAway)
    if farAway then
        ShowNotification(_U("far_away"))
    else
        ShowNotification(_U("player_denied"))
    end
end)

RegisterNetEvent("rcore_carnival:opositAccepted", function()
    HoldingAnim = false
    Animation.ResetAll()
end)

RegisterNetEvent("rcore_carnival:acceptRequest", function(animSet)
    HoldingAnim = true
    Animation.ResetAll()
    Animation.Play(animSet)
end)

RegisterNetEvent("rcore_carnival:someoneReuqested", function()
    RequestedGift = true
    SendNUIMessage({
        type = "showNotifTest",
    })

    CreateThread(function()
        local initPos = GetEntityCoords(PlayerPedId())
        local myPos
        while true do
            Wait(300)
            myPos = GetEntityCoords(PlayerPedId())
            if #(initPos - myPos) >= 3 then
                RequestedGift = false
                SendNUIMessage({
                    type = "hideNotifTest",
                })
                break
            end
        end
    end)
end)

RegisterKey(function()
    if FreezeOpenCommandGame or not RequestedGift then
        return
    end
    RequestedGift = false
    SendNUIMessage({
        type = "hideNotifTest",
    })
    TriggerServerEvent("rcore_carnival:denyRequest")
end, "deny_gift_carnival", "will deny gift", "N")

function AcceptGift()
    if FreezeOpenCommandGame or not RequestedGift then
        return
    end
    RequestedGift = false
    SendNUIMessage({
        type = "hideNotifTest",
    })
    TriggerServerEvent("rcore_carnival:acceptRequest")
end

RegisterKey(AcceptGift, "accept_gift_carnival", "will accept gift", "Z")
RegisterKey(AcceptGift, "accept_gift_carnival", "will accept gift", "Y")