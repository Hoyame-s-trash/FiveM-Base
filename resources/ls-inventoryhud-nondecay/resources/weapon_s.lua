local QBCore = exports['qb-core']:GetCoreObject()

-- Functions

local function IsWeaponBlocked(WeaponName)
    local retval = false
    for _, name in pairs(Config.DurabilityBlockedWeapons) do
        if name == WeaponName then
            retval = true
            break
        end
    end
    return retval
end

-- Callback

QBCore.Functions.CreateCallback("weapons:server:GetConfig", function(_, cb)
    cb(Config.WeaponRepairPoints)
end)

QBCore.Functions.CreateCallback("weapon:server:GetWeaponAmmo", function(source, cb, WeaponData)
    local Player = QBCore.Functions.GetPlayer(source)
    local retval = 0
    if WeaponData then
        if Player then
            retval = WeaponData.info.ammo and WeaponData.info.ammo or 0
        end
    end
    cb(retval, WeaponData._name)
end)

QBCore.Functions.CreateCallback("weapons:server:RepairWeapon", function(source, cb, RepairPoint, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local minute = 60 * 1000
    local Timeout = math.random(5 * minute, 10 * minute)
    local WeaponData = Config.WeaponList[GetHashKey(data._name)]
    local WeaponClass = (QBCore.Shared.SplitStr(WeaponData.ammotype, "_")[2]):lower()

    local wpn = exports["ls-inventoryhud"]:GetItem(src, data._id)
    if wpn then
        if wpn.info.quality then
            if wpn.info.quality ~= 100 then
                if Player.Functions.RemoveMoney('cash', Config.WeaponRepairCosts[WeaponClass]) then
                    Config.WeaponRepairPoints[RepairPoint].IsRepairing = true
                    Config.WeaponRepairPoints[RepairPoint].RepairingData = {
                        CitizenId = Player.PlayerData.citizenid,
                        WeaponData = wpn,
                        Ready = false,
                    }
                    Player.Functions.RemoveItem(data._name, 1, data._id)
                    TriggerClientEvent("inventory:client:CheckWeapon", src, data._name)
                    TriggerClientEvent('weapons:client:SyncRepairShops', -1, Config.WeaponRepairPoints[RepairPoint], RepairPoint)

                    SetTimeout(Timeout, function()
                        Config.WeaponRepairPoints[RepairPoint].IsRepairing = false
                        Config.WeaponRepairPoints[RepairPoint].RepairingData.Ready = true
                        TriggerClientEvent('weapons:client:SyncRepairShops', -1, Config.WeaponRepairPoints[RepairPoint], RepairPoint)
                        TriggerEvent('qb-phone:server:sendNewMailToOffline', Player.PlayerData.citizenid, {
                            sender = Lang:t('mail.sender'),
                            subject = Lang:t('mail.subject'),
                            message = Lang:t('mail.message', { value = WeaponData._data.Label })
                        })
                        SetTimeout(7 * 60000, function()
                            if Config.WeaponRepairPoints[RepairPoint].RepairingData.Ready then
                                Config.WeaponRepairPoints[RepairPoint].IsRepairing = false
                                Config.WeaponRepairPoints[RepairPoint].RepairingData = {}
                                TriggerClientEvent('weapons:client:SyncRepairShops', -1, Config.WeaponRepairPoints[RepairPoint], RepairPoint)
                            end
                        end)
                    end)
                    cb(true)
                else
                    cb(false)
                end
            else
                TriggerClientEvent("QBCore:Notify", src, Lang:t('error.no_damage_on_weapon'), "error")
                cb(false)
            end
        else
            TriggerClientEvent("QBCore:Notify", src, Lang:t('error.no_damage_on_weapon'), "error")
            cb(false)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.no_weapon_in_hand'), "error")
        TriggerClientEvent('weapons:client:SetCurrentWeapon', src, {}, false)
        cb(false)
    end
end)

-- Events

RegisterNetEvent("weapons:server:AddWeaponAmmo", function(CurrentWeaponData, amount)
    local src = source
    amount = tonumber(amount)
    local itemNew = exports["ls-inventoryhud"]:GetItem(src, CurrentWeaponData._id)
    if itemNew then
        itemNew.info.ammo = amount
        exports["ls-inventoryhud"]:UpdateItem(src, itemNew._id, itemNew.info)
    end
end)

RegisterNetEvent("weapons:server:UpdateWeaponAmmo", function(CurrentWeaponData, amount)
    local src = source
    amount = tonumber(amount)
    local itemNew = exports["ls-inventoryhud"]:GetItem(src, CurrentWeaponData._id)
    if itemNew then
        itemNew.info.ammo = amount
        exports["ls-inventoryhud"]:UpdateItem(src, itemNew._id, itemNew.info)
    end
end)

RegisterNetEvent("weapons:server:TakeBackWeapon", function(k)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local itemdata = Config.WeaponRepairPoints[k].RepairingData.WeaponData
    itemdata.info.quality = 100
    Player.Functions.AddItem(itemdata._name, 1, false, itemdata.info)
    TriggerClientEvent('inventory:client:ItemBox', src, Config.Items[itemdata._name], "add")
    Config.WeaponRepairPoints[k].IsRepairing = false
    Config.WeaponRepairPoints[k].RepairingData = {}
    TriggerClientEvent('weapons:client:SyncRepairShops', -1, Config.WeaponRepairPoints[k], k)
end)

RegisterNetEvent("weapons:server:SetWeaponQuality", function(CurrentWeaponData, hp)
    local src = source

    CurrentWeaponData.info.quality = hp
    exports["ls-inventoryhud"]:UpdateItem(src, CurrentWeaponData._id, CurrentWeaponData.info)
end)

RegisterNetEvent('weapons:server:UpdateWeaponQuality', function(data, RepeatAmount)
    local src = source
    Citizen.Wait(10)
    local WeaponData = Config.WeaponList[GetHashKey(data._name)]
    local WeaponSlot = exports["ls-inventoryhud"]:GetItem(src, data._id)
    local DecreaseAmount = Config.DurabilityMultiplier[data._name]
    if WeaponSlot then
        if not IsWeaponBlocked(WeaponData._name) then
            if WeaponSlot.info.quality then
                for _ = 1, RepeatAmount, 1 do
                    if WeaponSlot.info.quality - DecreaseAmount > 0 then
                        WeaponSlot.info.quality = WeaponSlot.info.quality - DecreaseAmount
                    else
                        WeaponSlot.info.quality = 0
                        exports["ls-inventoryhud"]:UseItem(src, data)
                        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.weapon_broken_need_repair'), "error")
                        break
                    end
                end
            else
                WeaponSlot.info.quality = 100
                for _ = 1, RepeatAmount, 1 do
                    if WeaponSlot.info.quality - DecreaseAmount > 0 then
                        WeaponSlot.info.quality = WeaponSlot.info.quality - DecreaseAmount
                    else
                        WeaponSlot.info.quality = 0
                        exports["ls-inventoryhud"]:UseItem(src, data)
                        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.weapon_broken_need_repair'), "error")
                        break
                    end
                end
            end
        end
        exports["ls-inventoryhud"]:UpdateItem(src, data._id, WeaponSlot.info)
    end
end)

-- Commands

QBCore.Commands.Add("repairweapon", "Repair Weapon (God Only)", {{name="hp", help=Lang:t('info.hp_of_weapon')}}, true, function(source, args)
    TriggerClientEvent('weapons:client:SetWeaponQuality', source, tonumber(args[1]))
end, "god")

-- Items

-- AMMO
QBCore.Functions.CreateUseableItem('pistol_ammo', function(source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_PISTOL', 12, item)
end)

QBCore.Functions.CreateUseableItem('rifle_ammo', function(source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_RIFLE', 30, item)
end)

QBCore.Functions.CreateUseableItem('smg_ammo', function(source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_SMG', 20, item)
end)

QBCore.Functions.CreateUseableItem('shotgun_ammo', function(source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_SHOTGUN', 10, item)
end)

QBCore.Functions.CreateUseableItem('mg_ammo', function(source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_MG', 30, item)
end)

QBCore.Functions.CreateUseableItem('snp_ammo', function(source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_SNIPER', 10, item)
end)

QBCore.Functions.CreateUseableItem('emp_ammo', function(source, item)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_EMPLAUNCHER', 10, item)
end)
