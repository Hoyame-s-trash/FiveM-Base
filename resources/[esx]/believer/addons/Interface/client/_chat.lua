GM.Chat = GM.Chat or {}

RegisterNetEvent('__cfx_internal:serverPrint')
AddEventHandler('__cfx_internal:serverPrint', function(msg)
    if (msg == "" or msg == nil) then return end

    print(msg)

    SendNUIMessage({
        type = "newMessage",
        mode = "ALL",
        name = "FiveM",
        text = msg,
        time = 10000
    })
end)

RegisterNetEvent("Chat:sendMsg", function(data)
    SendNUIMessage({
        type = "newMessage",
        mode = data.mode,
        name = data.name,
        text = data.text,
        time = data.time or 10000
    })
end)

RegisterNUICallback("sendMsg", function(data)

    if (data.content == "" or data.content == nil) then return end

    if data.content:sub(1, 1) == '/' then
        ExecuteCommand(data.content:sub(2))
    else
        TriggerServerEvent("Chat:sendMessage", data.mode, data.content)
    end
end)

RegisterNUICallback("closeChat", function()
    chatInputActive = false
    SetNuiFocus(false, false)
end)

GM:newThread(function()
    SetTextChatEnabled(false)
    SetNuiFocus(false)
end)

RegisterNetEvent("Chat:toogleChat", function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "toogleChat",
        showInput = true
    })
end)

RegisterNetEvent("Chat:clearChat", function()
    SendNUIMessage({
        type = "clearChat"
    })
end)

RegisterNetEvent("Chat:addMode", function(modeName)
    SendNUIMessage({
        type = "addMode",
        mode = modeName
    })
end)

RegisterNetEvent("Chat:removeMode", function(modeName)
    SendNUIMessage({
        type = "removeMode",
        mode = modeName
    })
end)