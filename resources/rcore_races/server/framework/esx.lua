CreateThread(function()
    if Config.EnableESX then
        local ESX = exports['believer']:getSharedObject()
        
        ShowNotification = function(source, text)
            if Config.UseChatNotifications then
                TriggerClientEvent('chat:addMessage', source, {
                    color = Config.ChatNotificationsColors or { 240, 200, 80 },
                    multiline = true,
                    args = { Config.ChatNotificationsAuthor or 'Races', text }
                })
            else
                TriggerClientEvent('esx:showNotification', source, text)
            end
        end

        GetPlayerId = function(source)
            return ESX.GetPlayerFromId(source).getIdentifier()
        end

        GiveMoney = function(source, amount)
            local xPlayer = ESX.GetPlayerFromId(source)

            xPlayer.addMoney(amount)

            return true
        end

        TakeMoney = function(source, amount)
            local xPlayer = ESX.GetPlayerFromId(source)

            if xPlayer.getMoney() >= amount then
                xPlayer.removeMoney(amount)

                return true
            else
                return false
            end
        end
    end
end)