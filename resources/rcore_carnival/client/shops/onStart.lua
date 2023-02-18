CreateThread(function()
    while true do
        Wait(1000)
        local pPos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.GiftShopLocation) do
            if #(pPos - v.position) < 20 then
                if not DoesEntityExist(v.Entity or 0) then
                    v.Entity = CreateLocalPed(v.pedName, v.position)
                    SetEntityHeading(v.Entity, v.heading)
                    FreezeEntityPosition(v.Entity, true)

                    SetEntityAsMissionEntity(v.Entity)
                    SetBlockingOfNonTemporaryEvents(v.Entity, true)
                    SetEntityInvincible(v.Entity, true)
                end
            else
                if DoesEntityExist(v.Entity or 0) then
                    DeleteEntity(v.Entity)
                end
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(100)
        local pPos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.GiftShopLocation) do
            if #(pPos - v.MarkerPosition) < 2.5 then
                if not v.Entered then
                    v.Entered = true
                    CloseAllOpenedMenu()
                    ShowHelpNotification(_U("open_shop"))
                end
            else
                if v.Entered then
                    CloseAllOpenedMenu()
                    v.Entered = false
                end
            end
        end
    end
end)

if Config.EnableShopMarkers then
    CreateThread(function()
        local w = 1000
        while true do
            Wait(w)
            w = 1000
            local pPos = GetEntityCoords(PlayerPedId())
            for k, v in pairs(Config.GiftShopLocation) do
                if #(pPos - v.MarkerPosition) < 15 then
                    w = 1
                    local o = v.MarkerOptions
                    DrawMarker(o.type, v.MarkerPosition.x, v.MarkerPosition.y, v.MarkerPosition.z, o.dir.x or 0, o.dir.y or 0, o.dir.z or 0, o.rot.x or 0, o.rot.y or 0, o.rot.z or 0, o.scale.x or 1.0, o.scale.y or 1.0, o.scale.z or 1.0, o.color.r or 255, o.color.g or 255, o.color.b or 255, o.color.a or 125, o.bobUpAndDown or false, o.faceCamera or false, 0, o.rotate or false)
                end
            end
        end
    end)
end

AddEventHandler("onResourceStop", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    for k, v in pairs(Config.GiftShopLocation) do
        if v.Entity then
            DeleteEntity(v.Entity or 0)
        end
    end
end)

RegisterNetEvent("rcore_carnival:givePlayerGiftToHand", function(animSet)
    Animation.ResetAll()
    Animation.Play(animSet)
    AnimSetPlayer = animSet

    HoldingAnim = true
    ShowHelpNotification(_U("gift_info"))
end)

RegisterKey(function()
    if FreezeOpenCommandGame then
        return
    end
    local pPos = GetEntityCoords(PlayerPedId())
    for k, v in pairs(Config.GiftShopLocation) do
        if #(v.position - pPos) <= 4 then
            ShopMenu(v, v.item)
            break
        end
    end
end, "open_carnival_shop", "Will open carnival shop", Config.KeyToOpenShop)