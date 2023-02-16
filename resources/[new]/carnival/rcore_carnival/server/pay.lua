registerCallback("pay", function(source, cb, arrayIndex)
    if Config.Framework.Active == Framework.STANDALONE then
        cb(true)
        return
    end

    local player = SharedObject.GetPlayerFromId(source)
    local data = Config.MiniGameList[arrayIndex]
    local money = data.PriceTicket

    if player.getMoney() >= money then
        player.removeMoney(money)
        GiveMoneyToSociety(money, data.Society)
        cb(true)
    else
        cb(false)
    end
end)

registerCallback("payItemShop", function(source, cb, arrayIndex, type, shopData)
    if Config.Framework.Active == Framework.STANDALONE then
        cb(true)
        return
    end
    local player = SharedObject.GetPlayerFromId(source)
    local data = Config[type][arrayIndex]
    local money = data.price

    if player.getMoney() >= money or Config.GivePlayerTickets then
        if not Config.GivePlayerTickets then
            GiveMoneyToSociety(money, shopData.Society)
            player.removeMoney(money)
        else
            if not (player.getInventoryItem("carnival_ticket").count >= money) then
                cb(false)
                return
            end
            player.removeInventoryItem("carnival_ticket", money)
        end

        if data.type == "animation" then
            if UsableItems[data.animName] then
                player.addInventoryItem(data.animName, 1)
            end
        end


        if data.type == "item" then
            if player.canCarryItem(data.itemName, data.count) then
                player.addInventoryItem(data.itemName, data.count)
            else
                cb(3)
            end
        end

        cb(true)
    else
        cb(false)
    end
end)