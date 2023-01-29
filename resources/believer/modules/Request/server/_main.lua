GM.Request = GM.Request or {}

GM.Request.List = {}

function GM.Request:sendMessage(playerSrc, message)
    
    if (GM.Request.List[playerSrc] ~= nil) then
        print("PLAYER ALREADY GOT REQUEST")
        return
    end

    GM.Request.List[playerSrc] = true 

    TriggerClientEvent("Request:sendMessage", playerSrc, message)

    while (GM.Request.List[playerSrc] == true) do
        Wait(50)
    end

    local response = GM.Request.List[playerSrc]

    GM.Request.List[playerSrc] = nil

    return response
end

exports("sendRequest", function(playerSrc, message)
    return GM.Request:sendMessage(playerSrc, message)
end)

RegisterServerEvent("Request:sendResponse", function(response)
    local playerSrc = source
    if (not playerSrc) then return end

    if (GM.Request.List[playerSrc] == nil) then 
        print("Return request player not in request list")
        return 
    end

    GM.Request.List[playerSrc] = response
end)