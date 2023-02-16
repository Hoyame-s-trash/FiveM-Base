CreateThread(function()
    if Config.EnableQBCore then
        local QBCore = exports['qb-core']:GetCoreObject()

        ShowNotification = function(text)
            if Config.UseChatNotifications then
                TriggerEvent('chat:addMessage', {
                    color = Config.ChatNotificationsColors or { 240, 200, 80 },
                    multiline = true,
                    args = { Config.ChatNotificationsAuthor or 'Races', text }
                })
            else
                QBCore.Functions.Notify(text, nil, 5000)
            end
        end

        ShowHelpNotification = function(text)
            BeginTextCommandPrint('STRING')
            AddTextComponentSubstringPlayerName(text)
            EndTextCommandPrint(5000, true)
        end
    end
end)