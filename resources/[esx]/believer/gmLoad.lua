GM = GM or {}

GM.LOG = true
GM.UTC = true

function GM:newThread(newThread)
    CreateThread(newThread)
end

function GM:newThreadNow(newThread)
    Citizen.CreateThreadNow(newThread)
end

function GM:consoleLog(logType, logMsg, ...)
    if (GM.sharedEnums.consoleLog == nil or GM.sharedEnums.consoleLog[logType] == nil) then return end
    
    local logMessage = string.format(logMsg, ...)
    if (GM.LOG == true) then
        print("[^4GAMEMODE^0] ("..GM.sharedEnums.consoleLog[logType].color..logType.."^0) => "..logMessage)
    end
end

GM:newThread(function()    
    while (GM.Translate == nil) do
        Wait(150)
    end

    while (GM.sharedEnums == nil or GM.Config == nil) do
        Wait(150)
    end

    GM:consoleLog("SUCCESS", "Global game mode is ^2started^0.")
    
    while (GM.Config == nil) do
        Wait(50)
    end

    if (IsDuplicityVersion()) then
        local isDev = GetConvar("sv_lan")
        if (isDev == "true") then
            GM.Config.Connection.identifier = "steam"
        else
            GM.Config.Connection.identifier = "license"
        end
    end
end)