---------------------------------------------------------------
-- Variable list
---------------------------------------------------------------
local IsPlayerControlFrozen_ = false
---------------------------------------------------------------
-- functions
---------------------------------------------------------------
function SetPlayerControlStatus(status)
    IsPlayerControlFrozen_ = status
end

function IsPlayerControlFrozen()
    return IsPlayerControlFrozen_
end
---------------------------------------------------------------
-- Threads
---------------------------------------------------------------
CreateThread(function()
    while true do
        Wait(0)
        if not IsPlayerControlFrozen_ then
            Wait(1000)
        else
            DisableAllControlActions(0)
            DisableAllControlActions(1)
            DisableAllControlActions(2)
            DisableAllControlActions(3)
            DisableAllControlActions(4)
            DisableAllControlActions(5)
            DisableAllControlActions(6)
            DisableAllControlActions(7)
            DisableAllControlActions(8)
            DisableAllControlActions(9)
            DisableAllControlActions(10)
            DisableAllControlActions(11)
            DisableAllControlActions(12)
            DisableAllControlActions(13)
            DisableAllControlActions(14)
            DisableAllControlActions(15)
            DisableAllControlActions(16)
            DisableAllControlActions(17)
            DisableAllControlActions(18)
            DisableAllControlActions(19)
            DisableAllControlActions(20)
            DisableAllControlActions(21)
            DisableAllControlActions(22)
            DisableAllControlActions(23)
            DisableAllControlActions(24)
            DisableAllControlActions(25)
            DisableAllControlActions(26)
            DisableAllControlActions(27)
            DisableAllControlActions(28)
            DisableAllControlActions(29)
            DisableAllControlActions(30)
            DisableAllControlActions(31)
        end
    end
end)