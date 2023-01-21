GM.Knockout = GM.Knockout or {}

GM.Knockout.PlayerInKO = false

GM:newThread(function()
    local wait = 15
    local count = 60

    while true do

        SetPedConfigFlag(PlayerPedId(), 35, false)
        SetPedConfigFlag(PlayerPedId(), 149, true)
        SetPedConfigFlag(PlayerPedId(), 438, true)

        if IsPedInMeleeCombat(PlayerPedId()) then
            if GetEntityHealth(PlayerPedId()) < 115 then
                ESX.ShowNotification("~r~Vous êtes KO, patienter un petit peu avant de vous relever.")
                wait = 15
                GM.Knockout.PlayerInKO = true
                SetEntityHealth(PlayerPedId(), 116)
            end
        end

        if GM.Knockout.PlayerInKO then
            SetPlayerInvincible(PlayerId(), true)
            DisablePlayerFiring(PlayerId(), true)
            SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
            ResetPedRagdollTimer(PlayerPedId())
                
            if wait >= 0 then
                count = count - 1

                if count == 0 then
                    count = 60
                    wait = wait - 1
                    SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + 4)
                end
            else
                SetPlayerInvincible(PlayerId(), false)
                GM.Knockout.PlayerInKO = false
            end
        end

        if IsPedInMeleeCombat(PlayerPedId()) or GM.Knockout.PlayerInKO then 
            Wait(0)
        else
            Wait(1250)
        end
        
    end
end)