GM.Request = GM.Request or {}

RegisterNetEvent("Request:sendMessage", function(message)
    if (message == nil) then return end

    ESX.ShowNotification(message.."\n"..GM.Request.Controls["accept"].icon..": ~g~Accepter~s~ "..GM.Request.Controls["decline"].icon..": ~r~Refuser~s~")

    local delay = 0
    while true do
        if IsControlJustReleased(0, GM.Request.Controls["accept"].key) then
            TriggerServerEvent("Request:sendResponse", "accept")
            break
        elseif IsControlJustReleased(0, GM.Request.Controls["decline"].key) then
            TriggerServerEvent("Request:sendResponse", "decline")
            break
        end

        if delay == 700 then
            TriggerServerEvent("Request:sendResponse", "delay")
            break
        end

        delay = delay + 1

        Wait(1)
    end
end)