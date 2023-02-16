CreateThread(function()
    if Config.EnableESX then
        local ESX = exports['es_extended']:getSharedObject()
        
        ShowNotification = function(text)
            if Config.UseChatNotifications then
                TriggerEvent('chat:addMessage', {
                    color = Config.ChatNotificationsColors or { 240, 200, 80 },
                    multiline = true,
                    args = { Config.ChatNotificationsAuthor or 'Races', text }
                })
            else
                ESX.ShowNotification(text, true, false, 140)
            end
        end

        ShowHelpNotification = function(text)
            BeginTextCommandPrint('STRING')
            AddTextComponentSubstringPlayerName(text)
            EndTextCommandPrint(5000, true)
        end
    end
end)