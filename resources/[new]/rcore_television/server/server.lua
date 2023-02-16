ESX = nil
QBCore = nil

if Config.FrameWork == 1 then
    ESX = GetEsxObject()
end

if Config.FrameWork == 2 then
    CreateThread(function()
        QBCore = Config.GetQBCoreObject()
    end)
end

--- Will send a print when debug is enabled
--- @param ... object
function Debug(...)
    if Config.Debug then
        print(...)
    end
end

TelevisionCache = {}
PlayerBucketCache = {}

RegisterNetEvent("rcore_television:stopTelevisionAtCoords", function(coords)
    for k, v in pairs(TelevisionCache) do
        if #(v.tvPos - coords) < 1.5 then
            table.remove(TelevisionCache, k)
            TriggerClientEvent("rcore_television:stopTelevisionAtCoords", -1, coords)
            break
        end
    end
end)

RegisterNetEvent("rcore_television:fetchCache", function()
    TriggerClientEvent("rcore_television:fetchCache", source, TelevisionCache)
end)

-- adding time thread
CreateThread(function()
    while true do
        Wait(1000)
        for _, v in pairs(TelevisionCache) do
            if v.time then
                v.time = v.time + 1
            end
        end
    end
end)

-- adding time thread
CreateThread(function()
    while true do
        Wait(500)
        for k, v in pairs(GetPlayers()) do
            local bucketID = GetPlayerRoutingBucket(k)
            if PlayerBucketCache[k] ~= bucketID then
                PlayerBucketCache[k] = bucketID
                TriggerClientEvent(TriggerName("UpdatePlayerBucketID"), k, bucketID)
                Debug("Updating player bucket ID cache", bucketID, "player ID", k)
            end
        end
    end
end)

RegisterNetEvent("rcore_television:AddTelevisionToCache", function(data)
    local found = false
    local key

    for k, v in pairs(TelevisionCache) do
        if #(v.tvPos - data.tvPos) < 1.5 then
            found = true
            key = k
            break
        end
    end

    if not found then
        table.insert(TelevisionCache, data)
        TriggerClientEvent("rcore_television:AddTelevisionToCache", -1, data)
    else
        TelevisionCache[key].URL = data.URL
        TelevisionCache[key].time = 0

        TriggerClientEvent("rcore_television:UpdateTelevisionCache", -1, key, TelevisionCache[key])
    end
end)

registerCallback(TriggerName("DoesPlayerHaveCertain"), function(source, cb, items)
    if Config.FrameWork == 1 then
        local xPlayer = ESX.GetPlayerFromId(source)
        for k, v in pairs(items) do
            local item = xPlayer.getInventoryItem(v)
            if item then
                if item.count ~= 0 then
                    cb(true)
                    return
                end
            end
        end
        cb(false)
    end
    if Config.FrameWork == 2 then
        local qbPlayer = QBCore.Functions.GetPlayer(source)
        for k, v in pairs(items) do
            if qbPlayer.Functions.GetItemByName(v) then
                cb(true)
                return
            end
        end
        cb(false)
    end
end)

RegisterNetEvent(TriggerName("loadPerms"), function()
    local source = source
    TriggerClientEvent(TriggerName("loadPerms"), source, "command.tveditor", IsPlayerAceAllowed(source, "command.tveditor"))
    TriggerClientEvent(TriggerName("loadPerms"), source, true)
end)