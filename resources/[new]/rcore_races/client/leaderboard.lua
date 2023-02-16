local isLeaderboardOpen = false

RegisterCommand('leaderboard', function()
    if isLeaderboardOpen then
        CloseLeaderboard()
    else
        OpenLeaderboard()
    end
end, false)

function CloseLeaderboard()
    isLeaderboardOpen = false
    SendNUIMessage({
        type = 'close'
    })
end

function OpenLeaderboard()
    TriggerServerEvent('lsrp_races:requestOpenLeaderboard')
end

RegisterNetEvent('lsrp_races:openLeaderboard', function(ladder)
    isLeaderboardOpen = true
    SendNUIMessage({
        type = 'open',
        ladder = ladder,
    })
end)

RegisterCommand('+r_ladder_npage', function()
    SendNUIMessage({
        type = 'nextPage',
    })
end, false)
RegisterCommand('-r_ladder_npage', function()
end, false)

RegisterCommand('+r_ladder_ppage', function()
    SendNUIMessage({
        type = 'prevPage',
    })
end, false)
RegisterCommand('-r_ladder_ppage', function()
end, false)

RegisterCommand('+r_ladder_close', function()
    CloseLeaderboard()
end, false)
RegisterCommand('-r_ladder_close', function()
end, false)

RegisterKeyMapping('+r_ladder_npage', 'Next Page', 'keyboard', 'pagedown')
RegisterKeyMapping('+r_ladder_ppage', 'Prev Page', 'keyboard', 'prior')
RegisterKeyMapping('+r_ladder_close', 'Close', 'keyboard', 'back')
