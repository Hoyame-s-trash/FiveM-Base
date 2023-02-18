CreateThread(function()
    if Config.EnableCustomEvents then
        ShowNotification = function(text)
            if Config.UseChatNotifications then
                TriggerEvent('chat:addMessage', {
                    color = Config.ChatNotificationsColors or { 240, 200, 80 },
                    multiline = true,
                    args = { Config.ChatNotificationsAuthor or 'Races', text }
                })
            else
                TriggerEvent('rcore_races:showNotification', text)
            end
        end

        ShowHelpNotification = function(text)
            TriggerEvent('rcore_races:showHelpNotification', text)
        end
    end
end)