local QBCore = BlueStarkInventory.ServerFramework

-- Functions

local function IsWeaponBlocked(WeaponName)
    local retval = false
    for _, name in pairs(BlueStarkInventory.DurabilityBlockedWeapons) do
        if name == WeaponName then
            retval = true
            break
        end
    end
    return retval
end

-- Callback

RegisterNetEvent('QBCore:Server:RemoveItem', function(itemName, amount, slot)
    local src = source
	print(slot)
    RemoveItem(src, slot, amount)
end)

QBCore.RegisterServerCallback("weapons:server:GetConfig", function(_, cb)
    cb(BlueStarkInventory.WeaponRepairPoints)
end)

QBCore.RegisterServerCallback("weapon:server:GetWeaponAmmo", function(source, cb, WeaponData)
    local Player = QBCore.GetPlayerFromId(source)
    local retval = 0
    if WeaponData then
        if Player then
            retval = WeaponData.info.ammo and WeaponData.info.ammo or 0
        end
    end
    cb(retval, WeaponData._name)
end)

QBCore.RegisterServerCallback("weapons:server:RepairWeapon", function(source, cb, RepairPoint, data)
    local src = source
    local Player = QBCore.GetPlayerFromId(src)
    local minute = 60 * 1000
    local Timeout = math.random(5 * minute, 10 * minute)
    local WeaponData = BlueStarkInventory.WeaponList[GetHashKey(data._name)]
    local WeaponClass = (QBCore.Shared.SplitStr(WeaponData.ammotype, "_")[2]):lower()

    local wpn = GetItem(src, data._id)
    if wpn then
        if wpn.info.quality then
            if wpn.info.quality ~= 100 then
                Player.removeMoney(BlueStarkInventory.WeaponRepairCosts[WeaponClass])
                if true then
                    BlueStarkInventory.WeaponRepairPoints[RepairPoint].IsRepairing = true
                    BlueStarkInventory.WeaponRepairPoints[RepairPoint].RepairingData = {
                        CitizenId = Player.identifier,
                        WeaponData = wpn,
                        Ready = false,
                    }
                    Player.removeInventoryItem(data._id, 1)
                    TriggerClientEvent("inventory:client:CheckWeapon", src, data.name)
                    TriggerClientEvent('weapons:client:SyncRepairShops', -1, BlueStarkInventory.WeaponRepairPoints[RepairPoint], RepairPoint)

                    SetTimeout(Timeout, function()
                        BlueStarkInventory.WeaponRepairPoints[RepairPoint].IsRepairing = false
                        BlueStarkInventory.WeaponRepairPoints[RepairPoint].RepairingData.Ready = true
                        TriggerClientEvent('weapons:client:SyncRepairShops', -1, BlueStarkInventory.WeaponRepairPoints[RepairPoint], RepairPoint)
                        SetTimeout(7 * 60000, function()
                            if BlueStarkInventory.WeaponRepairPoints[RepairPoint].RepairingData.Ready then
                                BlueStarkInventory.WeaponRepairPoints[RepairPoint].IsRepairing = false
                                BlueStarkInventory.WeaponRepairPoints[RepairPoint].RepairingData = {}
                                TriggerClientEvent('weapons:client:SyncRepairShops', -1, BlueStarkInventory.WeaponRepairPoints[RepairPoint], RepairPoint)
                            end
                        end)
                    end)
                    cb(true)
                else
                    cb(false)
                end
            else
                TriggerEvent('Notification',"No damage wepaon")
                cb(false)
            end
        else
            TriggerEvent('Notification',"No damage wepaon")
            cb(false)
        end
    else
        TriggerEvent('Notification',"No weapon on hand")
        TriggerClientEvent('weapons:client:SetCurrentWeapon', src, {}, false)
        cb(false)
    end
end)

-- Events

RegisterNetEvent("weapons:server:AddWeaponAmmo", function(CurrentWeaponData, amount)
    local src = source
    amount = tonumber(amount)
    local itemNew = GetItem(src, CurrentWeaponData._id)
    if itemNew then
        itemNew.info.ammo = amount
        UpdateItem(src, itemNew._id, itemNew.info)
    end
end)

RegisterNetEvent("weapons:server:UpdateWeaponAmmo", function(CurrentWeaponData, amount)
    local src = source
    amount = tonumber(amount)
	if CurrentWeaponData then
		local itemNew = GetItem(src, CurrentWeaponData._id)
		if itemNew then
			itemNew.info.ammo = amount
			UpdateItem(src, itemNew._id, itemNew.info)
		end
	end
end)

RegisterNetEvent("weapons:server:TakeBackWeapon", function(k)
    local src = source
    local Player = QBCore.GetPlayerFromId(src)
    local itemdata = BlueStarkInventory.WeaponRepairPoints[k].RepairingData.WeaponData
    itemdata.info.quality = 100
    Player.Functions.AddItem(itemdata._name, 1, false, itemdata.info)
    TriggerClientEvent('inventory:client:ItemBox', src, BlueStarkInventory.Items[itemdata._name], "add")
    BlueStarkInventory.WeaponRepairPoints[k].IsRepairing = false
    BlueStarkInventory.WeaponRepairPoints[k].RepairingData = {}
    TriggerClientEvent('weapons:client:SyncRepairShops', -1, BlueStarkInventory.WeaponRepairPoints[k], k)
end)

RegisterNetEvent("weapons:server:SetWeaponQuality", function(CurrentWeaponData, hp)
    local src = source

    CurrentWeaponData.info.quality = hp
    UpdateItem(src, CurrentWeaponData._id, CurrentWeaponData.info)
end)

RegisterNetEvent('weapons:server:UpdateWeaponQuality', function(data, RepeatAmount)
    local src = source
    Citizen.Wait(10)
    local WeaponData = BlueStarkInventory.WeaponList[GetHashKey(data._name)]
    local WeaponSlot = GetItem(src, data._id)
    local DecreaseAmount = BlueStarkInventory.DurabilityMultiplier[data._name]
    if WeaponSlot then
        if not IsWeaponBlocked(WeaponData._name) then
            if WeaponSlot.info.quality then
                for _ = 1, RepeatAmount, 1 do
                    if WeaponSlot.info.quality - DecreaseAmount > 0 then
                        WeaponSlot.info.quality = WeaponSlot.info.quality - DecreaseAmount
                    else
                        WeaponSlot.info.quality = 0
                        UseItem(src, data)
                        TriggerEvent('Notification',"Weapon broken need to be repaired!")
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
                        UseItem(src, data)
                        TriggerEvent('Notification',"Weapon broken need to be repaired!")
                        break
                    end
                end
            end
        end
    end
    UpdateItem(src, data._id, WeaponSlot.info)
end)

-- Items

-- AMMO
QBCore.RegisterUsableItem('pistol_ammo', function(source, item, item2)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_PISTOL', 12, item2)
end)

QBCore.RegisterUsableItem('rifle_ammo', function(source, item, item2)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_RIFLE', 30, item2)
end)

QBCore.RegisterUsableItem('smg_ammo', function(source, item, item2)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_SMG', 20, item2)
end)

QBCore.RegisterUsableItem('shotgun_ammo', function(source, item, item2)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_SHOTGUN', 10, item2)
end)

QBCore.RegisterUsableItem('mg_ammo', function(source, item, item2)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_MG', 30, item2)
end)

QBCore.RegisterUsableItem('snp_ammo', function(source, item, item2)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_SNIPER', 10, item2)
end)

QBCore.RegisterUsableItem('emp_ammo', function(source, item, item2)
    TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_EMPLAUNCHER', 10, item2)
end)
