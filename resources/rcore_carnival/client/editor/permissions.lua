local AceList = {}
local blockEvent = false

function IsAceAllowed(ace)
    return AceList[ace] or false
end

CreateThread(function()
    TriggerServerEvent(TriggerName("loadPerms"))
end)

RegisterNetEvent(TriggerName("loadPerms"), function(key, value)
    if not blockEvent then
        AceList[key] = value
    end
end)

RegisterNetEvent(TriggerName("blockEvent"), function()
    blockEvent = true
end)