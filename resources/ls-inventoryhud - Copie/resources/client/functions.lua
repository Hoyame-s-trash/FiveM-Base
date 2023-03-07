RegisterCommand('inventory', function()
    OpenPlayerInventory()
end, false)
RegisterCommand("rob", function()
    local player, distance = GetClosestPlayer()

    if CheckInventoryOpen() then return end
    
    if distance < 4.0 and player ~= -1 then
        local player2 = GetPlayerServerId(player)
        Callback.Functions.TriggerCallback("ls-inventoryhud:s:getPlayerId", function(idReturn)
            local InventoryGettingData = {
                identifier = idReturn,
                type = "player",
            }
            Callback.Functions.TriggerCallback("ls-inventory:s:getSecondInventory", function(inventory)
                OpenPlayerInventory(false)
                secInventoryIdentifier = inventory._inventoryId

                inventory.items[secInventoryIdentifier]._tpl = "n6rko4gdc7h0cg8cd9xfsjkk"

                SendNUIMessage({
                    action = "setupSecondInventory",
                    inventory = inventory,
                })
            end, InventoryGettingData)
        end, player2)
    end
end)

RegisterCommand("test_shop", function()
    local item = {
        ["kurkakola"] = {
            amount = 50,
            price = 528,
        },
        ["weapon_pistol"] = {
            amount = 1,
            price = 1245,
        }
    }
    OpenShopInventory("SHOP-WEAPONSHOP", "shop1", true, item)
end)

function OpenShopInventory(InventoryID, InventoryTPL, isTemporary, items)
    if CheckInventoryOpen() then return end

    if InventoryID == nil or InventoryID == "" then print("Inventory ID wrong") end
    if InventoryTPL == nil or InventoryTPL == "" then print("Inventory Item ID wrong") end
    if isTemporary == nil then isTemporary = false end

    local InventoryGettingData = {
        identifier = InventoryID,
        type = "shop",
        inventoryCode = InventoryTPL,
        isTemporary = isTemporary,
        inventoryItems = items,
    }
    Callback.Functions.TriggerCallback("ls-inventory:s:getSecondInventory", function(inventory)
        OpenPlayerInventory(false)
        secInventoryIdentifier = inventory._inventoryId

        SendNUIMessage({
            action = "setupShopInventory",
            inventory = inventory,
        })
    end, InventoryGettingData)
end
exports("ShopInventory", OpenShopInventory)

RegisterNetEvent("ls-inventoryhud:c:OpenCustomInventory", function(id, tpl, temp)
    OpenCustomInventory(id, tpl, temp)
end)

function OpenCustomInventory(InventoryID, InventoryTPL, isTemporary)
    if CheckInventoryOpen() then return end

    if InventoryID == nil or InventoryID == "" then print("Inventory ID wrong") end
    if InventoryTPL == nil or InventoryTPL == "" then print("Inventory Item ID wrong") end
    if isTemporary == nil then isTemporary = false end

    local InventoryGettingData = {
        identifier = InventoryID,
        type = "custom",
        inventoryCode = InventoryTPL,
        isTemporary = isTemporary,
    }
    Callback.Functions.TriggerCallback("ls-inventory:s:getSecondInventory", function(inventory)
        OpenPlayerInventory(false)
        secInventoryIdentifier = inventory._inventoryId

        SendNUIMessage({
            action = "setupSecondInventory",
            inventory = inventory,
        })
    end, InventoryGettingData)
end
exports("CustomInventory", OpenCustomInventory)


CreateThread(function()
    while Config.HAHud do
        local player = PlayerPedId()

        SendNUIMessage({
            action = "RefreshPlayerData",
            health = GetEntityHealth(player) - 100,
            armor = GetPedArmour(player),
        })

        Citizen.Wait(200)
    end
end)


RegisterKeyMapping('inventory', "Open Inventory", 'keyboard', 'TAB')

for i = 1, 9 do
    RegisterCommand('slot' .. i,function()
            SendNUIMessage({
                action = "UseItemHotbar",
                key = i
            })
    end)

    RegisterKeyMapping('slot' .. i, 'Uses the item in slot ' .. i, 'keyboard', i)
end

-- Taken from https://github.com/qbcore-framework/qb-inventory/blob/3a0a231a4615032e335283971c2914ad9096e914/server/main.lua
currentWeapon     = nil
currentWeaponData = {}

RegisterNetEvent('ls-inventoryhud:c:checkAndUse', function(weaponData, shootbool)
    if currentWeaponData ~= nil then
        if currentWeaponData._id == weaponData._id then
            local ped = PlayerPedId()
            SetCurrentPedWeapon(ped, 'WEAPON_UNARMED', true)
            RemoveAllPedWeapons(ped, true)
            TriggerEvent('weapons:client:SetCurrentWeapon', nil, shootbool)
            currentWeapon = nil
            currentWeaponData = {}
        end
    end
end)


RegisterNetEvent('ls-inventoryhud:c:useWeapon', function(weaponData, shootbool)
    local ped = PlayerPedId()
    local weaponName = tostring(weaponData._name)
    if currentWeapon == weaponName then
        SetCurrentPedWeapon(ped, 'WEAPON_UNARMED', true)
        RemoveAllPedWeapons(ped, true)
        TriggerEvent('weapons:client:SetCurrentWeapon', nil, shootbool)
        currentWeapon = nil
        currentWeaponData = {}
    elseif weaponName == "weapon_stickybomb" or weaponName == "weapon_pipebomb" or weaponName == "weapon_smokegrenade" or weaponName == "weapon_flare" or weaponName == "weapon_proxmine" or weaponName == "weapon_ball"  or weaponName == "weapon_molotov" or weaponName == "weapon_grenade" or weaponName == "weapon_bzgas" then
        GiveWeaponToPed(ped, GetHashKey(weaponName), 1, false, false)
        SetPedAmmo(ped, GetHashKey(weaponName), 1)
        SetCurrentPedWeapon(ped, GetHashKey(weaponName), true)
        TriggerEvent('weapons:client:SetCurrentWeapon', weaponData, shootbool)
        currentWeapon = weaponName
        currentWeaponData = {}
    elseif weaponName == "weapon_snowball" then
        GiveWeaponToPed(ped, GetHashKey(weaponName), 10, false, false)
        SetPedAmmo(ped, GetHashKey(weaponName), 10)
        SetCurrentPedWeapon(ped, GetHashKey(weaponName), true)
        TriggerServerEvent('QBCore:Server:RemoveItem', weaponName, 1)
        TriggerEvent('weapons:client:SetCurrentWeapon', weaponData, shootbool)
        currentWeapon = weaponName
        currentWeaponData = {}
    else
        TriggerEvent('weapons:client:SetCurrentWeapon', weaponData, shootbool)
        local ammo = tonumber(120)
        if weaponName == "weapon_petrolcan" or weaponName == "weapon_fireextinguisher" then
            ammo = 4000
        end

	    if name ~= weaponName then ammo = 0 end

        if weaponData.info.ammo ~= nil then ammo = weaponData.info.ammo end

        GiveWeaponToPed(ped, GetHashKey(weaponName), 0, false, false)
        SetPedAmmo(ped, GetHashKey(weaponName), ammo)
        SetCurrentPedWeapon(ped, GetHashKey(weaponName), true)
        if weaponData.info.attachment ~= nil then
            for _, attachment in pairs(weaponData.info.attachment) do
                GiveWeaponComponentToPed(ped, GetHashKey(weaponName), GetItemComponent(weaponData._name, attachment.component))
            end
        end
        currentWeapon = weaponName
        currentWeaponData = weaponData
    end
end)

RegisterNUICallback("checkCurrentWeapon", function(data, cb)
    if data.currentWeapon._id == currentWeaponData._id and not data.remove then
        GiveWeaponComponentToPed(PlayerPedId(), GetHashKey(currentWeapon), GetItemComponent(data.currentWeapon._name, data.component))
        currentWeaponData = data.currentWeapon
    elseif data.currentWeapon._id == currentWeaponData._id and data.remove then
        RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey(currentWeapon), GetItemComponent(data.currentWeapon._name, data.component))
        currentWeaponData = data.currentWeapon
    end
    cb( "ok" )
end)

function GetItemComponent(name,component)
    for _,v in pairs(Config.Weapons) do
        if v.name == name then
            for __,v2 in pairs(v.components) do
                if v2.name == component then
                    return v2.hash
                end
            end
        end
    end
    return false
end

function GetClosestVehicle(coords)
    local ped = PlayerPedId()
    local vehicles = GetGamePool('CVehicle')
    local closestDistance = -1
    local closestVehicle = -1
    if coords then
        coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
    else
        coords = GetEntityCoords(ped)
    end
    for i = 1, #vehicles, 1 do
        local vehicleCoords = GetEntityCoords(vehicles[i])
        local distance = #(vehicleCoords - coords)

        if closestDistance == -1 or closestDistance > distance then
            closestVehicle = vehicles[i]
            closestDistance = distance
        end
    end
    return closestVehicle, closestDistance
end

function IsBackEngine(vehModel)
    if BackEngineVehicles[vehModel] then return true end
    return false
end

function GetClosestPlayer(coords)
    local ped = PlayerPedId()
    if coords then
        coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
    else
        coords = GetEntityCoords(ped)
    end
    local closestPlayers = GetPlayersFromCoords(coords)
    local closestDistance = -1
    local closestPlayer = -1
    for i = 1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() and closestPlayers[i] ~= -1 then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = #(pos - coords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
    end
    return closestPlayer, closestDistance
end

function GetPlayersFromCoords(coords, distance)
    local players = GetActivePlayers()
    local ped = PlayerPedId()
    if coords then
        coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
    else
        coords = GetEntityCoords(ped)
    end
    distance = distance or 5
    local closePlayers = {}
    for _, player in pairs(players) do
        local target = GetPlayerPed(player)
        local targetCoords = GetEntityCoords(target)
        local targetdistance = #(targetCoords - coords)
        if targetdistance <= distance then
            closePlayers[#closePlayers + 1] = player
        end
    end
    return closePlayers
end

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(1)
		HideHudComponentThisFrame(19)
	end
end)