ESX = nil
QBCore = nil

if Config.FrameWork == 1 then
    TriggerEvent(Config.ESX_Object, function(obj)
        ESX = obj
    end)
end

if Config.FrameWork == 2 then
    QBCore = Config.GetQBCoreObject()
    ESX = {}

    ESX.RegisterUsableItem = function(itemName, callBack)
        QBCore.Functions.CreateUseableItem(itemName, callBack)
    end

    ESX.GetPlayerFromId = function(source)
        local xPlayer = {}
        local qbPlayer = QBCore.Functions.GetPlayer(source)

        ---------
        xPlayer.removeInventoryItem = function(itemName, count)
            qbPlayer.Functions.RemoveItem(itemName, count)
        end
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

            local totalWeight = QBCore.Player.GetTotalWeight(qbPlayer.PlayerData.items)
            local MaxWeight = 120000 -- default config is 120KG I have not found yet if the config can be fetched....

            if QBCore.Config.Player.MaxWeight then
                MaxWeight = QBCore.Config.Player.MaxWeight
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
                canRemove = false,
            }
            return ItemInfo
        end
        ---------

        return xPlayer
    end
end

if Config.ox_inv then
    exports(Config.itemName, function(event, item, inventory, slot, data)
        local source = inventory.id
        UseRadio(source)
    end)
end

-- custom notification setup
function ShowNotification(source, text)
    TriggerClientEvent('esx:showNotification', source, text)
end

-- this will affect who can spawn radio/place radio
-- will not work if your Config.CustomFramework is on false value
function YourOwnPermission()
    return true
end

if Config.FrameWork ~= 0 or Config.ox_inv then
    ESX.RegisterUsableItem(Config.itemName, function(source)
        UseRadio(source)
    end)
end

function IsInventoryFull(source)
    if Config.FrameWork ~= 0 then
        local xPlayer = ESX.GetPlayerFromId(source)
        local sourceItem = xPlayer.getInventoryItem(Config.itemName or itemName_)
        if not Config.oldEsxInventory then
            return not xPlayer.canCarryItem(Config.itemName, 1)
        else
            return not sourceItem.limit ~= -1 and (sourceItem.count + 1) > sourceItem.limit
        end
    end
    return false
end

function AddRadioToInventory(source)
    if Config.FrameWork ~= 0 then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.addInventoryItem(Config.itemName, 1)
    end
end

function RemoveRadioFromInventory(source)
    if Config.FrameWork ~= 0 then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.removeInventoryItem(Config.itemName, 1)
    end
end