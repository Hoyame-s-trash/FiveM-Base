CreateThread(function()
    if Config.EnableCustomEvents then
        ShowNotification = function(source, text)
            if Config.UseChatNotifications then
                TriggerClientEvent('chat:addMessage', source, {
                    color = Config.ChatNotificationsColors or { 240, 200, 80 },
                    multiline = true,
                    args = { Config.ChatNotificationsAuthor or 'Races', text }
                })
            else
                TriggerClientEvent('rcore_races:showNotification', source, text)
            end
        end

        GetPlayerId = function(source)
            local promise = promise:new()

            TriggerEvent('rcore_races:getPlayerId', source, function(id)
                promise:resolve(id)
            end)

            return Citizen.Await(promise)
        end

        GiveMoney = function(source, amount)
            local promise = promise:new()

            TriggerEvent('rcore_races:giveMoney', source, amount, function(given)
                promise:resolve(given)
            end)

            return Citizen.Await(promise)
        end

        TakeMoney = function(source, amount)
            local promise = promise:new()

            TriggerEvent('rcore_races:takeMoney', source, amount, function(taken)
                promise:resolve(taken)
            end)

            return Citizen.Await(promise)
        end
    end
end)