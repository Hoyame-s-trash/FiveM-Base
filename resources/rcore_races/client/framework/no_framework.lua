CreateThread(function()
    if not Config.EnableESX and not Config.EnableQBCore and not Config.EnableCustomEvents then
        ShowNotification = function(text)
            if Config.UseChatNotifications then
                TriggerEvent('chat:addMessage', {
                    color = Config.ChatNotificationsColors or { 240, 200, 80 },
                    multiline = true,
                    args = { Config.ChatNotificationsAuthor or 'Races', text }
                })
            else
                BeginTextCommandThefeedPost('STRING')
                AddTextComponentSubstringPlayerName(text)
                EndTextCommandThefeedPostTicker(true, true)
            end
        end

        ShowHelpNotification = function(text)
            BeginTextCommandPrint('STRING')
            AddTextComponentSubstringPlayerName(text)
            EndTextCommandPrint(5000, true)
        end

        RegisterNetEvent('lsrp_races:showNotification')
        AddEventHandler('lsrp_races:showNotification', ShowNotification)
    end
end)