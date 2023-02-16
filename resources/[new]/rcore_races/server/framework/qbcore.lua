CreateThread(function()
    if Config.EnableQBCore then
        local QBCore = exports['qb-core']:GetCoreObject()

        ShowNotification = function(source, text)
            if Config.UseChatNotifications then
                TriggerClientEvent('chat:addMessage', source, {
                    color = Config.ChatNotificationsColors or { 240, 200, 80 },
                    multiline = true,
                    args = { Config.ChatNotificationsAuthor or 'Races', text }
                })
            else
                TriggerClientEvent('QBCore:Notify', source, text)
            end
        end

        GetPlayerId = function(source)
            return QBCore.Functions.GetIdentifier(source, 'license')
        end

        GiveMoney = function(source, amount)
            local player = QBCore.Functions.GetPlayer(source)

            player.Functions.AddMoney('cash', amount)

            return true
        end

        TakeMoney = function(source, amount)
            local player = QBCore.Functions.GetPlayer(source)

            if player.PlayerData.money['cash'] >= amount then
                player.Functions.RemoveMoney('cash', amount)

                return true
            else
                return false
            end
        end
    end
end)