function PlayerIdentifier(source)
    local identifier = "none"

    for k, v in ipairs(GetPlayerIdentifiers(source)) do
        if string.match(v, 'license:') then
            identifier = string.sub(v, 9)
            break
        end
    end

    return identifier
end

if not SharedObject.GetPlayerFromId and SharedObject.Functions then

    SharedObject.RegisterUsableItem = function(itemName, callBack)
        SharedObject.Functions.CreateUseableItem(itemName, callBack)
    end

    SharedObject.GetPlayerFromId = function(source)
        local xPlayer = {}
        local qbPlayer = SharedObject.Functions.GetPlayer(source)

        ---------
        xPlayer.canCarryItem = function(itemName, count)
            local item = qbPlayer.Functions.GetItemByName(itemName) or {}
            local ItemInfo = {
                name = itemName,
                count = item.amount or 0,
                label = item.label or "none",
                weight = item.weight or 0,
                usable = item.useable or false,
                rare = false,
                canRemove = false,
            }

            local totalWeight = SharedObject.Player.GetTotalWeight(qbPlayer.PlayerData.items)
            local MaxWeight = 120000 -- default config is 120KG I have not found yet if the config can be fetched....

            if SharedObject.Config.Player.MaxWeight then
                MaxWeight = SharedObject.Config.Player.MaxWeight
            end

            return (totalWeight + (ItemInfo.weight * count)) <= MaxWeight
        end
        ---------
        xPlayer.addInventoryItem = function(itemName, count)
            qbPlayer.Functions.AddItem(itemName, count, false)
        end
        ---------
        xPlayer.removeInventoryItem = function(itemName, count)
            qbPlayer.Functions.RemoveItem(itemName, count, false)
        end
        ---------
        xPlayer.getInventoryItem = function(itemName)
            local item = qbPlayer.Functions.GetItemByName(itemName) or {}

            local ItemInfo = {
                name = itemName,
                count = item.amount or 0,
                label = item.label or "none",
                weight = item.weight or 0,
                usable = item.useable or false,
                rare = false,
                canRemove = false
            }
            return ItemInfo
        end
        ---------
        xPlayer.identifier = qbPlayer.PlayerData.citizenid
        ---------
        xPlayer.getName = function()
            if qbPlayer.PlayerData.charinfo and qbPlayer.PlayerData.charinfo.firstname then
                return qbPlayer.PlayerData.charinfo.firstname
            else
                return qbPlayer.PlayerData.name
            end
        end
        ---------
        xPlayer.getMoney = function()
            return qbPlayer.Functions.GetMoney("cash")
        end
        ---------
        xPlayer.addMoney = function(money)
            qbPlayer.Functions.AddMoney("cash", money)
        end
        ---------
        xPlayer.removeMoney = function(money)
            qbPlayer.Functions.RemoveMoney("cash", money)
        end

        return xPlayer
    end
end

if Config.Framework.Active == Framework.STANDALONE then

    SharedObject.RegisterUsableItem = function(itemName, callBack)

    end

    function PlayerIdentifier(source)
        local identifier = "none"
        for k, v in ipairs(GetPlayerIdentifiers(source)) do
            if string.match(v, 'license:') then
                identifier = string.sub(v, 9)
                break
            end
        end

        return identifier
    end

    SharedObject.GetPlayerFromId = function(source)
        local xPlayer = {}
        ---------
        xPlayer.canCarryItem = function(itemName, count)
            return true
        end
        ---------
        xPlayer.addInventoryItem = function(itemName, count)

        end
        ---------
        xPlayer.removeInventoryItem = function(itemName, count)

        end
        ---------
        xPlayer.getInventoryItem = function(itemName)
            local ItemInfo = {
                name = "itemName",
                count = 0,
                label = "none",
                weight = 0,
                usable = false,
                rare = false,
                canRemove = false
            }
            return ItemInfo
        end
        ---------
        xPlayer.identifier = PlayerIdentifier(source)
        ---------
        xPlayer.getName = function()
            return GetPlayerName(source)
        end
        ---------
        xPlayer.getMoney = function()
            return 9999999999
        end
        ---------
        xPlayer.addMoney = function(money)
        end
        ---------
        xPlayer.removeMoney = function(money)
        end

        return xPlayer
    end
end