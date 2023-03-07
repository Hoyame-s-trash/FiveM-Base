local QBCore = BlueStarkInventory.ServerFramework
local PlayerData, CurrentWeaponData, CanShoot, MultiplierAmount = {}, {}, true, 0

-- Handlers

AddEventHandler(BlueStarkInventory.Events.PlayerLoaded, function()
    PlayerData = QBCore.GetPlayerData()
    QBCore.TriggerServerCallback("weapons:server:GetConfig", function(RepairPoints)
        for k, data in pairs(RepairPoints) do
            BlueStarkInventory.WeaponRepairPoints[k].IsRepairing = data.IsRepairing
            BlueStarkInventory.WeaponRepairPoints[k].RepairingData = data.RepairingData
        end
    end)
end)

RegisterNetEvent(BlueStarkInventory.Events.PlayerUnloaded, function()
    for k in pairs(BlueStarkInventory.WeaponRepairPoints) do
        BlueStarkInventory.WeaponRepairPoints[k].IsRepairing = false
        BlueStarkInventory.WeaponRepairPoints[k].RepairingData = {}
    end
end)

-- Functions

local function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

-- Events

RegisterNetEvent("weapons:client:SyncRepairShops", function(NewData, key)
    BlueStarkInventory.WeaponRepairPoints[key].IsRepairing = NewData.IsRepairing
    BlueStarkInventory.WeaponRepairPoints[key].RepairingData = NewData.RepairingData
end)


RegisterNetEvent('weapons:client:SetCurrentWeapon', function(data, bool)
    if data ~= false then
        CurrentWeaponData = data
    else
        CurrentWeaponData = {}
    end
    CanShoot = bool
end)

RegisterNetEvent('weapons:client:SetWeaponQuality', function(amount)
    if CurrentWeaponData and next(CurrentWeaponData) then
        TriggerServerEvent("weapons:server:SetWeaponQuality", CurrentWeaponData, amount)
    end
end)

RegisterNetEvent('weapon:client:AddAmmo', function(type, amount, itemData)
    local ped = PlayerPedId()
    local weapon = GetSelectedPedWeapon(ped)
    if CurrentWeaponData then
        if BlueStarkInventory.WeaponAttachment.Ammo[weapon]["name"] ~= "weapon_unarmed" and BlueStarkInventory.WeaponAttachment.Ammo[weapon]["ammotype"] == type:upper() then
            local total = GetAmmoInPedWeapon(ped, weapon)
            local _, maxAmmo = GetMaxAmmo(ped, weapon)
            if total < maxAmmo then
                QBCore.Progressbar("Loading Bullets", BlueStarkInventory.AmmoTime,{
                    FreezePlayer = false, 
                    onFinish = function()
                        if BlueStarkInventory.WeaponAttachment.Ammo[weapon] then
                            Reloading = false 

                            AddAmmoToPed(ped,weapon,amount)
                            MakePedReload(ped)
                            TriggerServerEvent("weapons:server:UpdateWeaponAmmo", WEAPON_DATA, total + amount)
                            TriggerServerEvent('weapons:server:removeWeaponAmmoItem', CurrentWeaponData._name)
                            TriggerServerEvent('QBCore:Server:RemoveItem', itemData.name, 1, itemData._id)

                            BlueStarkInventory.Notify("Reloaded", "success")
                        end
                end, onCancel = function()
                    BlueStarkInventory.Notify("Canceled", "error")
                end
                })
            else
                BlueStarkInventory.Notify("Max ammo", "error")
            end
        else
            BlueStarkInventory.Notify("No weapon", "error")
        end
    else
        BlueStarkInventory.Notify("No weapon", "error")
    end
end)

-- Threads

CreateThread(function()
    SetWeaponsNoAutoswap(true)
end)

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        if IsPedArmed(ped, 7) == 1 and (IsControlJustReleased(0, 24) or IsDisabledControlJustReleased(0, 24)) then
            local weapon = GetSelectedPedWeapon(ped)
            local ammo = GetAmmoInPedWeapon(ped, weapon)
            TriggerServerEvent("weapons:server:UpdateWeaponAmmo", CurrentWeaponData, tonumber(ammo))
            if MultiplierAmount > 0 then
                TriggerServerEvent("weapons:server:UpdateWeaponQuality", CurrentWeaponData, MultiplierAmount)
                MultiplierAmount = 0
            end
        end
        Wait(1)
    end
end)

CreateThread(function()
    while true do
        local inRange = false
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        for k, data in pairs(BlueStarkInventory.WeaponRepairPoints) do
            local distance = #(pos - data.coords)
            if distance < 10 then
                inRange = true
                if distance < 1 then
                    if data.IsRepairing then
                        if data.RepairingData.CitizenId ~= PlayerData.identifier then
                            DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, 'The repairshop in this moment is ~r~NOT~w~ usable.')
                        else
                            if not data.RepairingData.Ready then
                                DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, 'Your weapon will be repaired.')
                            else
                                DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, '[E] - Take Weapon Back')
                            end
                        end
                    else
                        if WEAPON_DATA and next(WEAPON_DATA) then
                            if not data.RepairingData.Ready then
                                local WeaponData = BlueStarkInventory.WeaponAttachment.Ammo[GetHashKey(WEAPON_DATA.name)]
                                local WeaponClass = (SplitStr(WeaponData.ammotype, "_")[2]):lower()
                                DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, '[E] Repair Weapon, ~g~'..BlueStarkInventory.WeaponRepairCosts[WeaponClass]..'~w~')
                                if IsControlJustPressed(0, 38) then
                                    QBCore.TriggerServerCallback('weapons:server:RepairWeapon', function(HasMoney)
                                        if HasMoney then
                                            WEAPON_DATA = {}
                                        end
                                    end, k, WEAPON_DATA)
                                end
                            else
                                if data.RepairingData.CitizenId ~= PlayerData.identifier then
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, 'The repairshop in this moment is ~r~NOT~w~ usable.')
                                else
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, '[E] - Take Weapon Back')
                                    if IsControlJustPressed(0, 38) then
                                        TriggerServerEvent('weapons:server:TakeBackWeapon', k, data)
                                    end
                                end
                            end
                        else
                            if data.RepairingData.CitizenId == nil then
                                DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, 'You dont have a weapon in your hand.')
                            elseif data.RepairingData.CitizenId == PlayerData.identifier then
                                DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, '[E] - Take Weapon Back')
                                if IsControlJustPressed(0, 38) then
                                    TriggerServerEvent('weapons:server:TakeBackWeapon', k, data)
                                end
                            end
                        end
                    end
                end
            end
        end
        if not inRange then
            Wait(1000)
        end
        Wait(0)
    end
end)

RegisterNetEvent("weapons:client:SyncRepairShops", function(NewData, key)
    BlueStarkInventory.WeaponRepairPoints[key].IsRepairing = NewData.IsRepairing
    BlueStarkInventory.WeaponRepairPoints[key].RepairingData = NewData.RepairingData
end)