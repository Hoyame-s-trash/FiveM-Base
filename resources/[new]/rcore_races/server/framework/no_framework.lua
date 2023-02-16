CreateThread(function()
    if not Config.EnableESX and not Config.EnableQBCore and not Config.EnableCustomEvents then
        ShowNotification = function(source, text)
            if Config.UseChatNotifications then
                TriggerClientEvent('chat:addMessage', source, {
                    color = Config.ChatNotificationsColors or { 240, 200, 80 },
                    multiline = true,
                    args = { Config.ChatNotificationsAuthor or 'Races', text }
                })
            else
                TriggerClientEvent('lsrp_races:showNotification', source, text)
            end
        end

        GetPlayerId = function(source)
            for _, id in pairs(GetPlayerIdentifiers(source)) do
                if id:find('^license:') then
                    return id
                end
            end
        end

        GiveMoney = function(source, amount)
            return true
        end

        TakeMoney = function(source, amount)
            return true
        end
    end
end)