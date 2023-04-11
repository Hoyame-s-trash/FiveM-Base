-- This file is just for dev purposes.
-- Disable it in the fxmanifest.lua file! Do not load this if you are not testing around things.

RegisterCommand("model", function()
    local freemode_model = GetHashKey("mp_m_freemode_01")

    if IsModelInCdimage(freemode_model) and IsModelValid(freemode_model) then
        RequestModel(freemode_model)
        while not HasModelLoaded(freemode_model) do
            Wait(50)
        end

        SetPlayerModel(PlayerId(), freemode_model)
        local player_ped = PlayerPedId()
        SetPedComponentVariation(player_ped, 0, 0, 0, 2)
        SetPedComponentVariation(player_ped, 2, 9, 4, 2)
        SetPedComponentVariation(player_ped, 4, 1, 5, 2)
        SetPedComponentVariation(player_ped, 5, 44, 0, 2)
        SetPedComponentVariation(player_ped, 6, 1, 0, 2)
        SetPedComponentVariation(player_ped, 3, 29, 0, 2)
        SetPedComponentVariation(player_ped, 11, 301, 2, 2)
        SetPedComponentVariation(player_ped, 8, 15, 2, 2)
        -- SetPedPropIndex(player_ped, 0, 18, 2, 1)
        SetPedPropIndex(player_ped, 0, 65, 0, 1)
    end
end)
