Callback = {}
Callback.Functions = {}
Callback.ServerCallbacks = {}

function Callback.Functions.TriggerCallback(name, cb, ...)
    Callback.ServerCallbacks[name] = cb
    TriggerServerEvent('ls-inventoryhud:Server:TriggerCallback', name, ...)
end

RegisterNetEvent('ls-inventoryhud:Client:TriggerCallback', function(name, ...)
    if Callback.ServerCallbacks[name] then
        Callback.ServerCallbacks[name](...)
        Callback.ServerCallbacks[name] = nil
    end
end)

local inInventory, vehicleTrunk, playerInventoryIdentifier, secInventoryIdentifier, rememberItems, preView = false, nil, nil, nil, {}, nil

function AddToRememberItems(ITEM)
	rememberItems[ITEM._id]= ITEM
end
function RemoveFromRememberItems(ITEM)
	rememberItems[ITEM._id]= nil
end

local function DrawPedToScreen(ped, draw)
    if draw == nil then draw = 0 end
    CreateThread(function()
        SetFrontendActive(true)
        ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_EMPTY_NO_BACKGROUND"), false, -1)
        Wait(100)
        SetMouseCursorVisibleInMenus(false)
        PlayerPedPreview = ClonePed(ped, false, false, true)
        local x, y, z = table.unpack(GetEntityCoords(PlayerPedPreview))
        SetEntityCoords(PlayerPedPreview, x, y, z - 10)
        FreezeEntityPosition(PlayerPedPreview, true)
        SetEntityVisible(PlayerPedPreview, false, false)
        NetworkSetEntityInvisibleToNetwork(PlayerPedPreview, false)
        Wait(200)
        SetPedAsNoLongerNeeded(PlayerPedPreview)
        GivePedToPauseMenu(PlayerPedPreview, draw)
        SetPauseMenuPedLighting(true)
        SetPauseMenuPedSleepState(true)
        ReplaceHudColourWithRgba(117, 0, 0, 0, 0)
        preView = PlayerPedPreview
    end)
end

local function DeleteDrawedPed()
    SetFrontendActive(false)
    DeleteEntity(preView)
end

local function RefreshPedScreen()
    Citizen.CreateThread(function()
        if DoesEntityExist(preView) then
            Wait(3000)
            DeleteDrawedPed()
            Wait(50)
            if inInventory then
                DrawPedToScreen(PlayerPedId(), 0)
            end
        end
    end)
end

function CheckAndRefreshPlayer(data)
    if data.itemD._data.AttachableSlot ~= nil then
        RefreshPedScreen()
    end
end

function isInventoryPlayer( invID ) 
    if invID == playerInventoryIdentifier then
        return true
    end
    return false
end


RegisterNetEvent("ls-inventory:c:ItemChanged", function(data)
	if data.toInventory == playerInventoryIdentifier or data.toInventory == secInventoryIdentifier then
        AddToRememberItems(data.itemD)
    else
        RemoveFromRememberItems(data.itemD) 
    end
	
    SendNUIMessage({
        action = "ItemChanged",
        fromInventory = data.fromInventory,
        itemD = data.itemD,
        toInventory = data.toInventory,
        toLocation = data.toLocation,
        toRotate = data.toRotate,
        toSlot = data.toSlot,
        toParent = data.toParent,
        notGonnaBeDeleted = data.notGonnaBeDeleted,
        containerData = data.containerData
    })
end)

AddEventHandler(Inventory.Events.PlayerLoaded, function()
    SetupInventory()
end)

function SetupInventory()
	DeleteInventory()
	Citizen.Wait(1000)
    Callback.Functions.TriggerCallback("ls-inventory:s:getAllItems", function(items)
        Callback.Functions.TriggerCallback("ls-inventory:s:getPlayerInventory", function(inventory)
            playerInventoryIdentifier = inventory._inventoryId
            SendNUIMessage({
                action = "setupInventory",
                items = items,
                inventory = inventory,
                weapons = Inventory.WeaponAttachment.Weapons,
                weight = Inventory.Weight,
                hahud = Inventory.HAHud,
            })
        end)
    end)

    SetupSkin()
end

function DeleteInventory()
    SendNUIMessage({
        action = "DeleteInventory",
    }) 
end

AddEventHandler(Inventory.Events.PlayerUnloaded, function()
    DeleteInventory()
end)

function OpenPlayerInventory(status)
	if IsNuiFocused() then return end
	
    if not inInventory and not IsEntityDead(PlayerPedId()) then
        local PlayerData = Inventory.ServerFramework.Functions.GetPlayerData()
        if not PlayerData.metadata["isdead"] and not PlayerData.metadata["inlaststand"] and not PlayerData.metadata["ishandcuffed"] and not IsPauseMenuActive() then
            DrawPedToScreen(PlayerPedId(), 0)

            inInventory = true
            
            SendNUIMessage({
                action = "ui",
                type = true
            })
            SetNuiFocus(true, true)

            if (status == nil or status) then
                SetupSecondInventory()
            end

            if Inventory.Blur then
                TriggerScreenblurFadeIn(250)
            end
        end
    end
end

function SetupSecondInventory()
    local inventoryFound = false
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped) then
        local vehicle = GetVehiclePedIsIn(ped, false)
        local glovebox = GetVehicleNumberPlateText(vehicle)

        local InventoryGettingData = {
            identifier = "G-"..glovebox,
            type = "vehicle",
            vehicleClass = GetVehicleClass(vehicle),
            vehicleModel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)),
            vehicleStorageType = "glovebox",
        }
        Callback.Functions.TriggerCallback("ls-inventory:s:getSecondInventory", function(inventory)
            secInventoryIdentifier = inventory._inventoryId
            SendNUIMessage({
                action = "setupSecondInventory",
                inventory = inventory,
				rememberItems = rememberItems,
            })
        end, InventoryGettingData)

        inventoryFound = true
    else
        local vehicle = GetClosestVehicle()
        if vehicle ~= 0 and vehicle ~= nil then
            local pos = GetEntityCoords(ped)
            local dimensionMin, dimensionMax = GetModelDimensions(GetEntityModel(vehicle))
            local trunkpos = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, (dimensionMin.y), 0.0)
            if (IsBackEngine(GetEntityModel(vehicle))) then
                trunkpos = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, (dimensionMax.y), 0.0)
            end
            if #(pos - trunkpos) < 1.5 and not IsPedInAnyVehicle(ped) then
                if GetVehicleDoorLockStatus(vehicle) < 2 then
					inventoryFound = true 
					
                    CurrentVehicle = GetVehicleNumberPlateText(vehicle) 
                    local InventoryGettingData = {
                        identifier = "T-"..CurrentVehicle,
                        type = "vehicle",
                        vehicleClass = GetVehicleClass(vehicle),
                        vehicleModel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)),
                        vehicleStorageType = "trunk",
                    }
                    Callback.Functions.TriggerCallback("ls-inventory:s:getSecondInventory", function(inventory)
                        secInventoryIdentifier = inventory._inventoryId
                        SendNUIMessage({
                            action = "setupSecondInventory",
                            inventory = inventory,
							rememberItems = rememberItems,
                        })
                    end, InventoryGettingData)

                    TaskTurnPedToFaceCoord(PlayerPedId(), trunkpos.x, trunkpos.y, trunkpos.z)
                    while (not HasAnimDictLoaded("anim@heists@prison_heiststation@cop_reactions")) do RequestAnimDict("anim@heists@prison_heiststation@cop_reactions") Wait(100) end
                    TaskPlayAnim(PlayerPedId(), "anim@heists@prison_heiststation@cop_reactions", "cop_b_idle", 2.0, 2.0, -1, 50, 0, false, false, false)
                    SetVehicleDoorOpen(vehicle, 5, false, false)
					
                    isInventoryOpen = true
                    vehicleTrunk = vehicle
                else
                    Inventory.Notify("client", "Vehicle Locked", "error")
                    inventoryFound = false
                    isInventoryOpen = false
                end
            else
                isInventoryOpen = false
            end
        else
            isInventoryOpen = false
        end
    end

    if not inventoryFound then

        local dropNearby = GetNearDrop()

        local InventoryGettingData = {
            identifier = dropNearby,
            type = "drop",
            nearDrop = DropsNear,
        }

        Callback.Functions.TriggerCallback("ls-inventoryhud:s:GetDropItems", function(inventory)
            secInventoryIdentifier = inventory._inventoryId
            SendNUIMessage({
                action = "setupSecondInventory",
                inventory = inventory,
				rememberItems = rememberItems,
            })
        end, InventoryGettingData)
        isInventoryOpen = true
    end
end

--------------------------------------------------
--------------                      --------------
----------        DROP FUNCTIONS        ----------
--------------                      --------------
--------------------------------------------------

function CreateDropId()
	local id = "DROP-"..math.random(10000, 99999)
    return id
end

Drops       = {}
DropsNear   = nil

Citizen.CreateThread(function()
    while true do
        Callback.Functions.TriggerCallback("ls-inventoryhud:server:GetDrops", function(drops)
            for _,v in pairs(Drops) do
                if v.object ~= nil then
                    DeleteObject(v.object)
                end
            end
            Drops = {}
            for k,v in pairs(drops) do
                Drops[k] = {}
                Drops[k].id = v._inventoryId
                Drops[k].coords = v.coords
                Drops[k].data = v.data

                if Drops[k].object == nil and json.encode(Drops[k].data) ~= '"[]"' then
                    if json.encode(Drops[k].data) ~= "[]" then
                        RequestModel(GetHashKey("hei_prop_heist_box"))
                        while not HasModelLoaded(GetHashKey("hei_prop_heist_box")) do Citizen.Wait(10) end
                        
						local box = CreateObject(GetHashKey('hei_prop_heist_box'), v.coords.x, v.coords.y, v.coords.z, false, false, false)
                        PlaceObjectOnGroundProperly(box)
                        FreezeEntityPosition(box, true)
                        SetEntityCollision(box, false, false)
                
                        Drops[k].object = box
                    end
                end

            end
            
        end)
        Citizen.Wait(Inventory.RefreshDrops*1000)
    end
end)

-- Citizen.CreateThread(function()
    -- while true do
        -- Citizen.Wait(100)
        -- DropsNear = nil
        -- for _,v in pairs(Drops) do
            -- if v.coords then
                -- local coordsP = GetEntityCoords(PlayerPedId())
                -- if #(coordsP - v.coords) < 2.0 then
                    -- DropsNear = v
                -- end
            -- end
        -- end
    -- end
-- end)

function FindNearDrops()
	for _,v in pairs(Drops) do
		if v.coords then
			local coordsP = GetEntityCoords(PlayerPedId())
			if #(coordsP - v.coords) < 2.0 then
				DropsNear = v
				break
			end
		end
	end
end

function GetNearDrop()
    local newId = CreateDropId()
	FindNearDrops()
    if DropsNear ~= nil then
        newId = DropsNear.id
    else
        RequestModel(GetHashKey("hei_prop_heist_box"))
        while not HasModelLoaded(GetHashKey("hei_prop_heist_box")) do Citizen.Wait(10) end
    
        DropsNear = {id=newId, coords=GetEntityCoords(PlayerPedId())}
        Drops[newId] = {id=newId, coords=GetEntityCoords(PlayerPedId())}
    end
    return newId
end

RegisterNetEvent("ls-inventoryhud:c:checkDropOpen", function(id)
    if secInventoryIdentifier == id then
        TriggerServerEvent("ls-inventoryhud:s:checkDropOpen", id)
    end
end)


--------------------------------------------------
--------------                      --------------
----------        DROP FUNCTIONS        ----------
--------------                      --------------
--------------------------------------------------

function CheckInventoryOpen()
    return inInventory
end

RegisterNUICallback("closeNUI", function()
    inInventory = false
    SetNuiFocus(false, false)

    secInventoryIdentifier = nil
    
    DeleteDrawedPed()

    if Inventory.Blur then
        TriggerScreenblurFadeOut(250)
    end

    if vehicleTrunk ~= nil then
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

        while (not HasAnimDictLoaded("anim@heists@fleeca_bank@scope_out@return_case")) do RequestAnimDict("anim@heists@fleeca_bank@scope_out@return_case") Wait(100) end
        TaskPlayAnimAdvanced(ped, 'anim@heists@fleeca_bank@scope_out@return_case', 'trevor_action', coords.x, coords.y, coords.z, 0.0, 0.0, GetEntityHeading(ped), 2.0, 2.0, 1000, 49, 0.25, 0, 0)

        Citizen.Wait(900)

        SetVehicleDoorShut(vehicleTrunk, 5, false)
    end

    vehicleTrunk = nil
end)

RegisterNUICallback("attachmentOpen", function(data, cb)
    DeleteDrawedPed()

    cb( "ok" )
    
end)

if Inventory.Debug then
    CreateThread(function()
        while true do
            Wait(0)
            if NetworkIsSessionStarted() then
                    Wait(50)
                    SetupInventory()
                return
            end
        end
    end)
end

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
					rememberItems = rememberItems,
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
			rememberItems = rememberItems,
        })
    end, InventoryGettingData)
end
exports("CustomInventory", OpenCustomInventory)


CreateThread(function()
    while Inventory.HAHud do
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
    for _,v in pairs(Inventory.Weapons) do
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

local CurrentWeight = 0
local currentLoopWeight = false

RegisterNUICallback("WeightChanged", function(data, cb)
    CurrentWeight = tonumber(data.weightData)
    if type(CurrentWeight) ~= "number" then return end
    if CurrentWeight >= Inventory.Weight.MaxPlayerWeight then
        if not currentLoopWeight then
            LoopMoveSpeed()
        end
    else
        currentLoopWeight = false
    end
    cb( "ok" )
end)

function LoopMoveSpeed()
    currentLoopWeight = true
    Citizen.CreateThread(function()
        while currentLoopWeight do
            SetPedMoveRateOverride(PlayerPedId(), Inventory.Weight.MaxPlayerWeight/(CurrentWeight*Inventory.Weight.OverweightMultiplier))
			
			if CurrentWeight >= Inventory.Weight.MaxPlayerWeight*Inventory.Weight.OverweightDisableJump then
				DisableControlAction(0, 22, true)
			end
			
            Citizen.Wait(0)
        end
    end)
end






RegisterNetEvent("ls-inventory:c:addItem", function(item)
    SendNUIMessage({
        action = "AddItem",
        itemData = item,
    })
end)

RegisterNetEvent("ls-inventory:c:removeItem", function(itemID, Amount)
    SendNUIMessage({
        action = "RemoveItem",
        itemID = itemID,
        amount = Amount
    })
end)

RegisterNetEvent("ls-inventory:c:updateItem", function(itemID, inventoryId, newData)
    SendNUIMessage({
        action = "UpdateItem",
        itemID = itemID,
        inventoryID = inventoryId,
        newD = newData
    })
end)

RegisterNUICallback("AddItemFromAttachment", function(data, cb)
    TriggerServerEvent("ls-inventory:s:AddItemFromAttachment", data)
end)

RegisterNUICallback("ItemChanged", function(data, cb)
    CheckAndRefreshPlayer(data)

    data.itemD.loc.x = splitText(data.toLocation, "-")[1]
    data.itemD.loc.y = splitText(data.toLocation, "-")[2]
    data.itemD.loc.r = data.toRotate
    data.itemD.slotId = data.toSlot
    data.itemD._parent = data.toParent

    TriggerServerEvent("ls-inventory:s:ItemChanged", data)
end)

RegisterNUICallback("FastUseChanged", function(data, cb)
    TriggerServerEvent("ls-inventory:s:FastUseChanged", data)
end)

RegisterNUICallback("UseItem", function(data, cb)
    TriggerServerEvent("ls-inventory:s:UseItem", data)
end)

RegisterNUICallback("UseItemContext", function(data, cb)
    TriggerServerEvent("ls-inventory:s:UseItemContext", data)
end)

RegisterNUICallback("RemoveItem", function(data, cb)
    TriggerServerEvent("ls-inventory:s:RemoveItem", data)
end)


RegisterNUICallback("UpdateItem", function(data, cb)
    TriggerServerEvent("ls-inventory:s:UpdateItem", data)
end)

function splitText(s, sep)
    local fields = {}
    
    local sep = sep or " "
    local pattern = string.format("([^%s]+)", sep)
    string.gsub(s, pattern, function(c) fields[#fields + 1] = c end)
    
    return fields
end



--------------------------------------------------
--------------                      --------------
----------     ATTACHMENT FUNCTIONS     ----------
--------------                      --------------
--------------------------------------------------


WeaponObject = nil
cam = nil
local EditingWeapon = false

function getWeaponFOV(hash)
    local ped = GetPlayerPed(-1)

    if GetWeapontypeGroup(hash) == -957766203 then
        return 30.0
    end
    if GetWeapontypeGroup(hash) == 416676503 then
        return 20.0
    end
    if GetWeapontypeGroup(hash) == 860033945 then
        return 35.0
    end
    if GetWeapontypeGroup(hash) == 970310034 then
        return 27.0
    end
    if GetWeapontypeGroup(hash) == 1159398588 then
        return 30.0
    end
    if GetWeapontypeGroup(hash) == -1212426201 then
        return 40.0
    end
    if GetWeapontypeGroup(hash) == -1569042529 then
        return 40.0
    end

    return 35.0
end

RegisterNUICallback("attachmentOpen", function(data, cb)
    if EditingWeapon then return end

    CreateWeaponAttachmentMenu(data)
    
    if Inventory.Blur then
        TriggerScreenblurFadeOut(250)
    end

    cb( "ok" )
    
end)

function CreateWeaponAttachmentMenu(data)
    local weaponAttachment = {}

    local coords = vector3(14.7363, -1091.3844, 29.7970)
    local x, y, z = table.unpack(coords)

    local lastRotation = vector3(0.0, 0.0, 0.0)

    RequestWeaponAsset(GetHashKey(data.weapon), 31, 0)

    while not HasWeaponAssetLoaded(GetHashKey(data.weapon)) do Citizen.Wait(10) end

    WeaponObject = CreateWeaponObject(GetHashKey(data.weapon),  120, x, y, z , true, 1.0, 0)
    SetEntityHeading(WeaponObject, 337.0456)

    SetEntityRotation(WeaponObject, lastRotation)
    FreezeEntityPosition(WeaponObject, true)
     
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 14.1498, -1092.9255, 29.7970, 0.0 ,0.0, 0, 60.00, false, 0)
    PointCamAtEntity(cam, WeaponObject, 0,0,0, true)
       
    SetCamFov(cam, getWeaponFOV(GetHashKey(data.weapon)))
    SetCamActive(cam, true)
    RenderScriptCams(cam, false, 1, true, true)

    Citizen.Wait(100)

    offset = true

    for k,v in pairs(Inventory.WeaponAttachment.Bones) do

        local bi = GetEntityBoneIndexByName(WeaponObject, k)
        if bi ~= -1 then
            local cord = GetWorldPositionOfEntityBone(entity, bi)
            local ok, xx, yy = GetScreenCoordFromWorldCoord(cord[1], cord[2], cord[3])
            if offset then
                xx = xx * 100
                yy = yy * 100
                
                if (yy > 45) then
                    yy = yy + 10.0
                else
                    yy = yy - 10.0
                end
                if (xx > 50) then
                    xx = xx + 10.0
                else
                    xx = xx - 10.0
                end
            end
            weaponAttachment[k] = { x = xx, y = yy, label = v.label, attach_component = v.attach_component, slot = v.slot, global_name= v.global_name } 
        end
    end

    SendNUIMessage({
        action = "attachment",
        attachmentList = weaponAttachment
    })
    Citizen.Wait(50)
    EditingWeapon = true
    SetupAttachment()
end

function SetupAttachment()
    Citizen.CreateThread(function ()
        while EditingWeapon do
            local weaponAttachment = {}

            x,y,z = table.unpack(GetEntityCoords(weaponObject, true))
   
            NetworkOverrideClockTime(1, 00, 00)
            DrawSpotLight(x , y + 10.0, z + 10.2, 10, -10.0, -15.0, 255, 255, 255, 25.0, 4.0, 2.0, 20.0, 0.0)
            DisplayRadar(false)

            local offset = false
            for k,v in pairs(Inventory.WeaponAttachment.Bones) do
                local bi = GetEntityBoneIndexByName(WeaponObject, k)
                if bi ~= -1 then
                    local cord = GetWorldPositionOfEntityBone(WeaponObject, bi)
                    local _, xx, yy = GetScreenCoordFromWorldCoord(cord[1], cord[2], cord[3])
                    if offset then
                        xx = xx * 100
                        yy = yy * 100
                        
                        if (yy > 45) then
                            yy = yy + 10.0
                        else
                            yy = yy - 10.0
                        end
                        if (xx > 50) then
                            xx = xx + 10.0
                        else
                            xx = xx - 10.0
                        end
                    end
                    weaponAttachment[k] = { x = xx, y = yy, label = v.label, attach_component = v.attach_component, slot = v.slot, add_left=v.add_left, add_top=v.add_top, global_name= v.global_name } 
                end 
            end

            SendNUIMessage({
                action = "updateAttachment",
                attachmentList = weaponAttachment
            })

            Citizen.Wait(0)
        end
    end)
end

RegisterNUICallback("updateAttachRotate", function(data, cb)

    SetEntityRotation(WeaponObject, GetEntityRotation(WeaponObject).x, GetEntityRotation(WeaponObject).y+data.y, GetEntityRotation(WeaponObject).z+data.x)

    cb( "ok" )
end)

RegisterNUICallback("addAttachment", function(data, cb)

    local result = GetItemComponent(data.name, data.component)

    local model = GetWeaponComponentTypeModel(result)
    RequestModel(model)
    while not HasModelLoaded(model) do Citizen.Wait(10) end
    if data.attach_component ~= "tint" then
        GiveWeaponComponentToWeaponObject(WeaponObject, GetHashKey(result))
    else
        SetPedWeaponTintIndex(WeaponObject, result)
    end

    SetModelAsNoLongerNeeded(model)

    cb( "ok" )
end)

RegisterNUICallback("removeAttachment", function(data, cb)

    local result = GetItemComponent(data.name, data.component)

    local model = GetWeaponComponentTypeModel(result)
    RequestModel(model)
    while not HasModelLoaded(model) do Citizen.Wait(10) end

    if data.attach_component ~= "tint" then
        RemoveWeaponComponentFromWeaponObject(WeaponObject, GetHashKey(result))
    else
        SetPedWeaponTintIndex(WeaponObject, 0)
    end

    SetModelAsNoLongerNeeded(model)

    if data.attach_component == "clip" then
        local result = GetItemComponent(data.name, "clip_default")
    
        local model = GetWeaponComponentTypeModel(result)
        RequestModel(model)
        while not HasModelLoaded(model) do Citizen.Wait(10) end
        GiveWeaponComponentToWeaponObject(WeaponObject, GetHashKey(result))
        SetModelAsNoLongerNeeded(model)
    end

    cb( "ok" )
end)

RegisterNUICallback("closeNUI", function()
    SetTimecycleModifier('default')

    DeleteObject(WeaponObject)
    SetCamActive(cam, false)
    DestroyCam(cam, true)
    RenderScriptCams(false, false, 1, true, true)
    EditingWeapon = false
end)





--------------------------------------------------
--------------                      --------------
----------      CLOTHING FUNCTIONS      ----------
--------------                      --------------
--------------------------------------------------

if not Inventory.FivemAppeareance then
    skinData = {}

    function SetupSkin()
        Callback.Functions.TriggerCallback("ls-inventoryhud:s:getSkin", function(_, skin)
            skinData = json.decode(skin)
            Wait(1500)
            TriggerEvent("ls-inventoryhud:c:refreshClothes")

            Citizen.CreateThread(function()
                while true do
                    Citizen.Wait(5000)
                    SendNUIMessage({
                        action = "refreshClothes"
                    })
                end
            end)
        end)

        CreateClothLoop()
    end

    function DeleteSkin()
        skinData = {}
    end

    RegisterNetEvent("ls-inventoryhud:c:refreshClothes")
    AddEventHandler("ls-inventoryhud:c:refreshClothes", function()
        SendNUIMessage({action = "refreshClothesFully"})
    end)
	
	RegisterNetEvent("ls-inventoryhud:c:resetupSkin")
    AddEventHandler("ls-inventoryhud:c:resetupSkin", function()
		Callback.Functions.TriggerCallback("ls-inventoryhud:s:getSkin", function(_, skin)
            skinData = json.decode(skin)
            Wait(1500)
            TriggerEvent("ls-inventoryhud:c:refreshClothes")

            Citizen.CreateThread(function()
                while true do
                    Citizen.Wait(5000)
                    SendNUIMessage({
                        action = "refreshClothes"
                    })
                end
            end)
        end)
    end)

    function IncurCooldown(ms)
        Citizen.CreateThread(function()
            Cooldown = true Wait(ms) Cooldown = false
        end)
    end

    function PlayToggleEmote(e, cb)
        local Ped = PlayerPedId()
        while not HasAnimDictLoaded(e.Dict) do RequestAnimDict(e.Dict) Wait(100) end
        if IsPedInAnyVehicle(Ped) then e.Move = 51 end
        TaskPlayAnim(Ped, e.Dict, e.Anim, 3.0, 3.0, e.Dur, e.Move, 0, false, false, false)
        local Pause = e.Dur-500 if Pause < 500 then Pause = 500 end
        IncurCooldown(Pause)
        Wait(Pause) -- Lets wait for the emote to play for a bit then do the callback.
        cb()
    end

    function IsMpPed(ped)
        local Male = GetHashKey("mp_m_freemode_01") local Female = GetHashKey("mp_f_freemode_01")
        local CurrentModel = GetEntityModel(ped)
        if CurrentModel == Male then return "Male" elseif CurrentModel == Female then return "Female" else return false end
    end

    RegisterNUICallback("changeClothes", function(data, cb)
        local Ped = PlayerPedId()
        local Gender = IsMpPed(Ped)

        if skinData == nil then return end

        if isInventoryPlayer(data.inventoryid) then
            if not data.dress then
                if not data.animation then
                    local Clothe = Inventory.ClothingWear[data.clothingname]
                    if (Clothe.Drawable ~= nil) then
                        if type(Clothe.Table[Gender]) == "table" then
                            if Clothe.DrawableCheck ~= nil then
                                local variations = Clothe.Table[Gender][GetPedDrawableVariation(Ped, Clothe.DrawableCheck)]
                                if variations == nil then variations = 15 end
                                local Texture = GetPedTextureVariation(Ped, Clothe.Drawable)
                                SetPedComponentVariation(Ped, Clothe.Drawable, variations, Texture, 0)

                                if skinData[Clothe.DatabaseName].item ~= variations then
                                    skinData[Clothe.DatabaseName].item = variations
                                    skinData[Clothe.DatabaseName].texture = Texture
                                end
                            end
                        else
                            SetPedComponentVariation(Ped, Clothe.Drawable, Clothe.Table[Gender], 0, 0)

                            if skinData[Clothe.DatabaseName].item ~= Clothe.Table[Gender] then
                                skinData[Clothe.DatabaseName].item = Clothe.Table[Gender]
                                skinData[Clothe.DatabaseName].texture = 0
                            end
                        end

                    elseif (Clothe.Prop ~= nil) then
                        ClearPedProp(Ped, Clothe.Prop)

                        if skinData[Clothe.DatabaseName].item ~= Clothe.Prop then
                            skinData[Clothe.DatabaseName].item = 0
                            skinData[Clothe.DatabaseName].texture = 0
                        end
                    end
                    CheckData()
                else
                    local Clothe = Inventory.ClothingWear[data.clothingname]
                    PlayToggleEmote(Clothe.Emote, function()
                        if (Clothe.Drawable ~= nil) then
                            local Texture = GetPedTextureVariation(Ped, Clothe.Drawable)
                            SetPedComponentVariation(Ped, Clothe.Drawable, Clothe.Table[Gender], Texture, 0)

                            if skinData[Clothe.DatabaseName].item ~= Clothe.Table[Gender] then
                                skinData[Clothe.DatabaseName].item = Clothe.Table[Gender]
                                skinData[Clothe.DatabaseName].texture = Texture
                            end
                        elseif (Clothe.Prop ~= nil) then
                            ClearPedProp(Ped, Clothe.Prop)

                            if skinData[Clothe.DatabaseName].item ~= Clothe.Prop then
                                skinData[Clothe.DatabaseName].item = 0
                                skinData[Clothe.DatabaseName].texture = 0
                            end
                        end
                        CheckData()
                    end)
                end
            else
                if not data.animation then
                    local info = data.clothedata
                    local Clothe = Inventory.ClothingWear[data.clothingname]
                    if info ~= nil then
                        if info.drawable then
                            SetPedComponentVariation(Ped, info.drawable, info[Gender].id, 0, 2)
                            SetPedComponentVariation(Ped, info.drawable, info[Gender].id, info[Gender].texture, 0)

                            if skinData[Clothe.DatabaseName].item ~= info[Gender].id then
                                skinData[Clothe.DatabaseName].item = info[Gender].id
                                skinData[Clothe.DatabaseName].texture = info[Gender].texture
                            end
                        else
                            SetPedPropIndex(Ped,info.prop, info[Gender].id, info[Gender].texture, true)

                            if skinData[Clothe.DatabaseName].item ~= info[Gender].id then
                                skinData[Clothe.DatabaseName].item = info[Gender].id
                                skinData[Clothe.DatabaseName].texture = info[Gender].texture
                            end
                        end
                    else
                        if (Clothe.Drawable ~= nil) then
                            if type(Clothe.Table[Gender]) == "table" then
                                if Clothe.DrawableCheck ~= nil then
                                    local variations = Clothe.Table[Gender][GetPedDrawableVariation(Ped, Clothe.DrawableCheck)]
                                    if variations == nil then variations = 15 end
                                    local Texture = GetPedTextureVariation(Ped, Clothe.Drawable)
                                    SetPedComponentVariation(Ped, Clothe.Drawable, variations, Texture, 0)

                                    if skinData[Clothe.DatabaseName].item ~= variations then
                                        skinData[Clothe.DatabaseName].item = variations
                                        skinData[Clothe.DatabaseName].texture = Texture
                                    end
                                end
                            else
                                SetPedComponentVariation(Ped, Clothe.Drawable, Clothe.Table[Gender], 0, 0)

                                if skinData[Clothe.DatabaseName].item ~= Clothe.Table[Gender] then
                                    skinData[Clothe.DatabaseName].item = Clothe.Table[Gender]
                                    skinData[Clothe.DatabaseName].texture = 0
                                end
                            end

                        elseif (Clothe.Prop ~= nil) then
                            ClearPedProp(Ped, Clothe.Prop)

                            if skinData[Clothe.DatabaseName].item ~= Clothe.Prop then
                                skinData[Clothe.DatabaseName].item = 0
                                skinData[Clothe.DatabaseName].texture = 0
                            end
                        end
                    end
                else
                    local Clothe = Inventory.ClothingWear[data.clothingname]
                    PlayToggleEmote(Clothe.Emote, function()
                        local info = data.clothedata
                        if info.drawable then
                            SetPedComponentVariation(Ped, info.drawable, info[Gender].id, 0, 2)
                            SetPedComponentVariation(Ped, info.drawable, info[Gender].id, info[Gender].texture, 0)

                            if skinData[Clothe.DatabaseName].item ~= info[Gender].id then
                                skinData[Clothe.DatabaseName].item = info[Gender].id
                                skinData[Clothe.DatabaseName].texture = info[Gender].texture
                            end
                        else
                            SetPedPropIndex(Ped,info.prop, info[Gender].id, info[Gender].texture, true)

                            if skinData[Clothe.DatabaseName].item ~= info[Gender].id then
                                skinData[Clothe.DatabaseName].item = info[Gender].id
                                skinData[Clothe.DatabaseName].texture = info[Gender].texture
                            end
                        end
                        CheckData()
                    end)
                end
            end
        else
            TriggerServerEvent("ls-inventoryhud:s:changeClothes", data)
        end
    end)

    RegisterNetEvent("ls-inventoryhud:c:changeClothes", function(data)
        SendNUIMessage({
            action = "undressSecondChar",
            animation = data.animation,
            dress = data.dress,
            inventoryid = data.inventoryid,
            clothingname = data.clothingname,
            clothedata = data.clothedata,
            itemdata = data.itemdata,
        })
    end)

    function CheckData()
        Callback.Functions.TriggerCallback("ls-inventoryhud:s:getSkin", function(model, skin)
            model = GetEntityModel(PlayerPedId())
            
            local secondData = json.decode(skin)
            if secondData ~= nil then
                local realClothing = skinData or {}
                
                local anyChanges = false
                for k,v in pairs(secondData) do
                    if not FindAndCheck(k) then
                        realClothing[k] = v
                        anyChanges = true
                    end
                end

                if anyChanges then
                    TriggerEvent('qb-clothing:client:loadPlayerClothing', realClothing)
                    TriggerServerEvent("qb-clothing:saveSkin", model, json.encode(realClothing))
					
					skinData = realClothing
                end
            end
        end)
    end

    function FindAndCheck(key)
        for _,v in pairs(Inventory.ClothingWear)do
            if v.DatabaseName == key then
                return true
            end
        end
        return false
    end
    function CreateClothLoop()
        Citizen.CreateThread(function()
            while true do
                local tempValue = skinData
                Wait(5000)
                if skinData ~= nil then
                    local anyDiffrence = false
                    for k,v in pairs(skinData) do
                        if tempValue[k] ~= nil then
                            if tempValue[k].item ~= nil then
                                if type(tempValue) ~= "table" then
                                    anyDiffrence = true
                                    break
                                end
                                if tempValue[k] == nil then
                                    anyDiffrence = true
                                    break
                                end
                                if tempValue[k].item == nil or tempValue[k].texture == nil then
                                    anyDiffrence = true
                                    break
                                end
                                if tempValue[k].item ~= v.item or tempValue[k].texture ~= v.texture then
                                    anyDiffrence = true
                                    break
                                end
                            end
                        end
                    end

                    if anyDiffrence then
                        CheckData()
                    end
                end
            end
        end)
    end

    RegisterNetEvent("ls-inventoryhud:c:giveClothesAsItem")
    AddEventHandler("ls-inventoryhud:c:giveClothesAsItem", function(data, previousSkinData, isFirst)
        if isFirst then
            for key,v in pairs(Inventory.ClothingWear) do
                if data[v.DatabaseName] ~= nil and data[v.DatabaseName].item >= 0 then
                    local itemData = data[v.DatabaseName]

                    local info = {}
                    if v.Drawable ~= nil then
                        info.clothData = {
                            ["drawable"] = v.Drawable,
                            ["Male"] = {id= itemData.item, texture=itemData.texture},
                            ["Female"] = {id= itemData.item, texture=itemData.texture},
                        }
                    else
                        info.clothData = {
                            ["prop"] = v.Prop,
                            ["Male"] = {id= itemData.item, texture=itemData.texture},
                            ["Female"] = {id= itemData.item, texture=itemData.texture},
                        }
                    end

                    local givinItem = key
                    if givinItem == "backpack" then
                        if (itemData.item == 40 or itemData.item == 41 or itemData.item == 44 or itemData.item == 45 or itemData.item == 81 or itemData.item == 82 or itemData.item == 85 or itemData.item == 86) then
                            givinItem = "bag1"
                        end
                    elseif givinItem == "rig" then
                        if (itemData.item == 16) then
                            givinItem = "rig1"
                        end
                    end

                    TriggerServerEvent("inventory:s:GiveItem", givinItem, 1, info)
                end
            end
        else
            for key,v in pairs(Inventory.ClothingWear) do
                local pre = json.decode(previousSkinData)
                if (data[v.DatabaseName].item ~= pre[v.DatabaseName].item or data[v.DatabaseName].texture ~= pre[v.DatabaseName].texture) then
                    local itemData = data[v.DatabaseName]

                    local info = {}
                    if v.Drawable ~= nil then
                        info.clothData = {
                            ["drawable"] = v.Drawable,
                            ["Male"] = {id= itemData.item, texture=itemData.texture},
                            ["Female"] = {id= itemData.item, texture=itemData.texture},
                        }
                    else
                        info.clothData = {
                            ["prop"] = v.Prop,
                            ["Male"] = {id= itemData.item, texture=itemData.texture},
                            ["Female"] = {id= itemData.item, texture=itemData.texture},
                        }
                    end

                    local givinItem = key
                    if givinItem == "backpack" then
                        if (itemData.item == 40 or itemData.item == 41 or itemData.item == 44 or itemData.item == 45 or itemData.item == 81 or itemData.item == 82 or itemData.item == 85 or itemData.item == 86) then
                            givinItem = "bag1"
                        end
                    elseif givinItem == "rig" then
                        if (itemData.item == 16) then
                            givinItem = "rig1"
                        end
                    end

                    TriggerServerEvent("inventory:s:GiveItem", givinItem, 1, info)
                end
            end
        end
    end)
else
    skinData = {}

    function SetupSkin() 
        skinData = exports["fivem-appearance"]:getPedAppearance(PlayerPedId())
        Wait(1500)
        TriggerEvent("ls-inventoryhud:c:refreshClothes")

        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(5000)
                SendNUIMessage({
                    action = "refreshClothes"
                })
            end
        end)

        CreateClothLoop()
    end

    function DeleteSkin()
        skinData = {}
    end
	
	RegisterNetEvent("ls-inventoryhud:c:resetupSkin")
    AddEventHandler("ls-inventoryhud:c:resetupSkin", function()
		SetupSkin()
    end)

    RegisterNetEvent("ls-inventoryhud:c:refreshClothes")
    AddEventHandler("ls-inventoryhud:c:refreshClothes", function()
		skinData = exports["fivem-appearance"]:getPedAppearance(PlayerPedId())
        Wait(1500)
        TriggerEvent("ls-inventoryhud:c:refreshClothes")
    end)

    function IncurCooldown(ms)
        Citizen.CreateThread(function()
            Cooldown = true Wait(ms) Cooldown = false
        end)
    end

    function PlayToggleEmote(e, cb)
        local Ped = PlayerPedId()
        while not HasAnimDictLoaded(e.Dict) do RequestAnimDict(e.Dict) Wait(100) end
        if IsPedInAnyVehicle(Ped) then e.Move = 51 end
        TaskPlayAnim(Ped, e.Dict, e.Anim, 3.0, 3.0, e.Dur, e.Move, 0, false, false, false)
        local Pause = e.Dur-500 if Pause < 500 then Pause = 500 end
        IncurCooldown(Pause)
        Wait(Pause) -- Lets wait for the emote to play for a bit then do the callback.
        cb()
    end

    function IsMpPed(ped)
        local Male = GetHashKey("mp_m_freemode_01") local Female = GetHashKey("mp_f_freemode_01")
        local CurrentModel = GetEntityModel(ped)
        if CurrentModel == Male then return "Male" elseif CurrentModel == Female then return "Female" else return false end
    end

    RegisterNUICallback("changeClothes", function(data, cb)
        local Ped = PlayerPedId()
        local Gender = IsMpPed(Ped)

        if skinData == nil then return end
		
		print(json.encode(data))

        if isInventoryPlayer(data.inventoryid) then
            if not data.dress then
                if not data.animation then
                    local Clothe = Inventory.ClothingWear[data.clothingname]
                    if (Clothe.Drawable ~= nil) then
                        if type(Clothe.Table[Gender]) == "table" then
                            if Clothe.DrawableCheck ~= nil then
                                local variations = Clothe.Table[Gender][GetPedDrawableVariation(Ped, Clothe.DrawableCheck)]
                                if variations == nil then variations = 15 end
                                local Texture = GetPedTextureVariation(Ped, Clothe.Drawable)
                                SetPedComponentVariation(Ped, Clothe.Drawable, variations, Texture, 0)

                                if skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable ~= variations then
                                    skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable = variations
                                    skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].texture = Texture
                                end

                                --data[v.TypeItem][FFSI(data, CheckAndGetDrawable(v), v.TypeItem)]
                            end
                        else
                            SetPedComponentVariation(Ped, Clothe.Drawable, Clothe.Table[Gender], 0, 0)

                            if skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable ~= Clothe.Table[Gender] then
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable = Clothe.Table[Gender]
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].texture = 0
                            end
                        end

                    elseif (Clothe.Prop ~= nil) then
                        ClearPedProp(Ped, Clothe.Prop)

                        if skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable ~= Clothe.Prop then
                            skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable = 0
                            skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].texture = 0
                        end
                    end
                    CheckData()
                else
                    local Clothe = Inventory.ClothingWear[data.clothingname]
                    PlayToggleEmote(Clothe.Emote, function()
                        if (Clothe.Drawable ~= nil) then
                            local Texture = GetPedTextureVariation(Ped, Clothe.Drawable)
                            SetPedComponentVariation(Ped, Clothe.Drawable, Clothe.Table[Gender], Texture, 0)

                            if skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable ~= Clothe.Table[Gender] then
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable = Clothe.Table[Gender]
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].texture = Texture
                            end
                        elseif (Clothe.Prop ~= nil) then
                            ClearPedProp(Ped, Clothe.Prop)

                            if skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable ~= Clothe.Prop then
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable = 0
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].texture = 0
                            end
                        end
                        CheckData()
                    end)
                end
            else
                if not data.animation then
                    local info = data.clothedata
                    local Clothe = Inventory.ClothingWear[data.clothingname]
                    if info ~= nil then
                        if info.drawable then
                            SetPedComponentVariation(Ped, info.drawable, info[Gender].id, 0, 2)
                            SetPedComponentVariation(Ped, info.drawable, info[Gender].id, info[Gender].texture, 0)

                            if skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable ~= info[Gender].id then
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable = info[Gender].id
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].texture = info[Gender].texture
                            end
                        else
                            SetPedPropIndex(Ped,info.prop, info[Gender].id, info[Gender].texture, true)

                            if skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable ~= info[Gender].id then
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable = info[Gender].id
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].texture = info[Gender].texture
                            end
                        end
                    else
                        if (Clothe.Drawable ~= nil) then
                            if type(Clothe.Table[Gender]) == "table" then
                                if Clothe.DrawableCheck ~= nil then
                                    local variations = Clothe.Table[Gender][GetPedDrawableVariation(Ped, Clothe.DrawableCheck)]
                                    if variations == nil then variations = 15 end
                                    local Texture = GetPedTextureVariation(Ped, Clothe.Drawable)
                                    SetPedComponentVariation(Ped, Clothe.Drawable, variations, Texture, 0)

                                    if skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable ~= variations then
                                        skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable = variations
                                        skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].texture = Texture
                                    end
                                end
                            else
                                SetPedComponentVariation(Ped, Clothe.Drawable, Clothe.Table[Gender], 0, 0)

                                if skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable ~= Clothe.Table[Gender] then
                                    skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable = Clothe.Table[Gender]
                                    skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].texture = 0
                                end
                            end

                        elseif (Clothe.Prop ~= nil) then
                            ClearPedProp(Ped, Clothe.Prop)

                            if skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable ~= Clothe.Prop then
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable = 0
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].texture = 0
                            end
                        end
                    end
                else
                    local Clothe = Inventory.ClothingWear[data.clothingname]
                    PlayToggleEmote(Clothe.Emote, function()
                        local info = data.clothedata
                        if info.drawable then
                            SetPedComponentVariation(Ped, info.drawable, info[Gender].id, 0, 2)
                            SetPedComponentVariation(Ped, info.drawable, info[Gender].id, info[Gender].texture, 0)

                            if skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable ~= info[Gender].id then
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable = info[Gender].id
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].texture = info[Gender].texture
                            end
                        else
                            SetPedPropIndex(Ped,info.prop, info[Gender].id, info[Gender].texture, true)

                            if skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable ~= info[Gender].id then
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].drawable = info[Gender].id
                                skinData[Clothe.TypeItem][FFSI(skinData, CheckAndGetDrawable(Clothe), Clothe.TypeItem)].texture = info[Gender].texture
                            end
                        end
                        CheckData()
                    end)
                end
            end
        else
            TriggerServerEvent("ls-inventoryhud:s:changeClothes", data)
        end
    end)

    RegisterNetEvent("ls-inventoryhud:c:changeClothes", function(data)
        SendNUIMessage({
            action = "undressSecondChar",
            animation = data.animation,
            dress = data.dress,
            inventoryid = data.inventoryid,
            clothingname = data.clothingname,
            clothedata = data.clothedata,
            itemdata = data.itemdata,
        })
    end)

    function CheckData()
        local secondData = exports["fivem-appearance"]:getPedAppearance(PlayerPedId())
        if secondData ~= nil then
            local realClothing = skinData
            
            local anyChanges = false
            for k,v in pairs(secondData) do
                if k ~= "components" or k ~= "props" then
					if type(v) == "table" then
						for key,value in pairs(v) do
							if not FindAndCheck(value) then
								realClothing[k][key] = value
								anyChanges = true
							end
						end
					end
                end
            end
			
			Citizen.Wait(250)
            if anyChanges then
                TriggerServerEvent('fivem-appearance:server:saveAppearance', realClothing)
                for k,v in pairs(realClothing) do
                    if k == "components" then
                        exports["fivem-appearance"]:setPedComponents(v)
                    elseif k == "props" then
                        exports["fivem-appearance"]:setPedProps(v)
                    end
                end
                
            end
        end
    end

    function FindAndCheck(key)
        for _,v in pairs(Inventory.ClothingWear)do
            if v.DatabaseName == key then
                return true
            end
        end
        return false
    end
    function CreateClothLoop()
        Citizen.CreateThread(function()
            while true do
                local tempValue = skinData
                Wait(5000)
                if skinData ~= nil then
                    local anyDiffrence = false
                    for k,v in pairs(skinData) do
                        if k == "components" or k == "props" then 
                            if tempValue[k] ~= nil then
                                for key,value in pairs(v) do
                                    if value.drawable ~= nil then
                                        if type(tempValue) ~= "table" then
                                            anyDiffrence = true
                                            break
                                        end
                                        if value == nil then
                                            anyDiffrence = true
                                            break
                                        end
                                        if value.drawable == nil or value.texture == nil then
                                            anyDiffrence = true
                                            break
                                        end
                                        if tempValue[k][key].drawable ~= value.drawable or tempValue[k][key].texture ~= value.texture then
                                            anyDiffrence = true
                                            break
                                        end
                                    end
                                end
                            end
                        end
                    end

                    if anyDiffrence then
                        CheckData()
                    end
                end
            end
        end)
    end

    RegisterNetEvent("ls-inventoryhud:c:giveClothesAsItem")
    AddEventHandler("ls-inventoryhud:c:giveClothesAsItem", function(data, previousSkinData, isFirst)
        if isFirst then
            for key,v in pairs(Inventory.ClothingWear) do
                if data[v.TypeItem][FFSI(data, CheckAndGetDrawable(v), v.TypeItem)] ~= nil and data[v.TypeItem][FFSI(data, CheckAndGetDrawable(v), v.TypeItem)].drawable >= 0 then
                    local itemData = data[v.TypeItem][FFSI(data, CheckAndGetDrawable(v), v.TypeItem)]

                    local info = {}
                    if v.Drawable ~= nil then
                        info.clothData = {
                            ["drawable"] = v.Drawable,
                            ["Male"] = {id= itemData.drawable, texture=itemData.texture},
                            ["Female"] = {id= itemData.drawable, texture=itemData.texture},
                        }
                    else
                        info.clothData = {
                            ["prop"] = v.Prop,
                            ["Male"] = {id= itemData.drawable, texture=itemData.texture},
                            ["Female"] = {id= itemData.drawable, texture=itemData.texture},
                        }
                    end

                    local givinItem = key
                    if givinItem == "backpack" then
                        if (itemData.drawable == 40 or itemData.drawable == 41 or itemData.drawable == 44 or itemData.drawable == 45 or itemData.drawable == 81 or itemData.drawable == 82 or itemData.drawable == 85 or itemData.drawable == 86) then
                            givinItem = "bag1"
                        end
                    elseif givinItem == "rig" then
                        if (itemData.drawable == 16) then
                            givinItem = "rig1"
                        end
                    end

                    TriggerServerEvent("inventory:s:GiveItem", givinItem, 1, info)
                end
            end
        else
            for key,v in pairs(Inventory.ClothingWear) do
                local pre = previousSkinData
                local newItem = data[v.TypeItem][FFSI(data, CheckAndGetDrawable(v), v.TypeItem)]
                local oldItem = pre[v.TypeItem][FFSI(data, CheckAndGetDrawable(v), v.TypeItem)]
                if (newItem.drawable ~= oldItem.drawable or newItem.texture ~= oldItem.texture) then
                    local itemData = newItem

                    local info = {}
                    if v.Drawable ~= nil then
                        info.clothData = {
                            ["drawable"] = v.Drawable,
                            ["Male"] = {id= newItem.drawable, texture=newItem.texture},
                            ["Female"] = {id= newItem.drawable, texture=newItem.texture},
                        }
                    else
                        info.clothData = {
                            ["prop"] = v.Prop,
                            ["Male"] = {id= newItem.drawable, texture=newItem.texture},
                            ["Female"] = {id= newItem.drawable, texture=newItem.texture},
                        }
                    end

                    local givinItem = key
                    if givinItem == "backpack" then
                        if (itemData.drawable == 40 or itemData.drawable == 41 or itemData.drawable == 44 or itemData.drawable == 45 or itemData.drawable == 81 or itemData.drawable == 82 or itemData.drawable == 85 or itemData.drawable == 86) then
                            givinItem = "bag1"
                        end
                    elseif givinItem == "rig" then
                        if (itemData.drawable == 16) then
                            givinItem = "rig1"
                        end
                    end

                    TriggerServerEvent("inventory:s:GiveItem", givinItem, 1, info)
                end
            end
        end
    end)

    function CheckAndGetDrawable(item)
        if item.TypeItem == "props" then
            return item.Prop
        else
            return item.Drawable
        end
    end

    function FFSI(table, id, type)
        if type == "props" then
            for k,v in pairs(table[type]) do
                if id == v.prop_id then
                    return k
                end 
            end
        else
            for k,v in pairs(table[type]) do
                if id == v.component_id then
                    return k
                end 
            end
        end
    end
end

RegisterNUICallback("checkPrice", function(data, cb)
    Callback.Functions.TriggerCallback("ls-inventoryhud:s:checkPrice", function(value)
        if (value) then
            Inventory.Notify("You bought an item!", "success")
        else
            Inventory.Notify("You not enough money to bought!", "error")
        end
        cb(value)
    end, data)
end)

local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData, CurrentWeaponData, CanShoot, MultiplierAmount = {}, {}, true, 0

-- Handlers

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    QBCore.Functions.TriggerCallback("weapons:server:GetInventory", function(RepairPoints)
        for k, data in pairs(RepairPoints) do
            Inventory.WeaponRepairPoints[k].IsRepairing = data.IsRepairing
            Inventory.WeaponRepairPoints[k].RepairingData = data.RepairingData
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    for k in pairs(Inventory.WeaponRepairPoints) do
        Inventory.WeaponRepairPoints[k].IsRepairing = false
        Inventory.WeaponRepairPoints[k].RepairingData = {}
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
    Inventory.WeaponRepairPoints[key].IsRepairing = NewData.IsRepairing
    Inventory.WeaponRepairPoints[key].RepairingData = NewData.RepairingData
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
        if QBCore.Shared.Weapons[weapon]["name"] ~= "weapon_unarmed" and QBCore.Shared.Weapons[weapon]["ammotype"] == type:upper() then
            local total = GetAmmoInPedWeapon(ped, weapon)
            local _, maxAmmo = GetMaxAmmo(ped, weapon)
            if total < maxAmmo then
                QBCore.Functions.Progressbar("taking_bullets", Lang:t('info.loading_bullets'), Inventory.ReloadTime, false, true, {
                    disableMovement = false,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    if QBCore.Shared.Weapons[weapon] then
                        AddAmmoToPed(ped,weapon,amount)
                        MakePedReload(ped)
                        TriggerServerEvent("weapons:server:AddWeaponAmmo", CurrentWeaponData, total + amount)
                        TriggerServerEvent('QBCore:Server:RemoveItem', itemData._name, 1, itemData._id)
                        TriggerEvent('QBCore:Notify', Lang:t('success.reloaded'), "success")
                    end
                end, function()
                    Inventory.Notify(Lang:t('error.canceled'), "error")
                end)
            else
                Inventory.Notify(Lang:t('error.max_ammo'), "error")
            end
        else
            Inventory.Notify(Lang:t('error.no_weapon'), "error")
        end
    else
        Inventory.Notify(Lang:t('error.no_weapon'), "error")
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
        if LocalPlayer.state.isLoggedIn then
            local ped = PlayerPedId()
            if CurrentWeaponData and next(CurrentWeaponData) then
                if IsPedShooting(ped) or IsControlJustPressed(0, 24) then
                    local weapon = GetSelectedPedWeapon(ped)
                    if CanShoot then
                        if weapon and weapon ~= 0 and QBCore.Shared.Weapons[weapon] then
                            local ammo = GetAmmoInPedWeapon(ped, weapon)
                            if QBCore.Shared.Weapons[weapon]["name"] == "weapon_snowball" then
                                TriggerServerEvent('QBCore:Server:RemoveItem', "snowball", 1)
                            elseif QBCore.Shared.Weapons[weapon]["name"] == "weapon_pipebomb" then
                                TriggerServerEvent('QBCore:Server:RemoveItem', "weapon_pipebomb", 1)
                            elseif QBCore.Shared.Weapons[weapon]["name"] == "weapon_molotov" then
                                TriggerServerEvent('QBCore:Server:RemoveItem', "weapon_molotov", 1)
                            elseif QBCore.Shared.Weapons[weapon]["name"] == "weapon_stickybomb" then
                                TriggerServerEvent('QBCore:Server:RemoveItem', "weapon_stickybomb", 1)
                            elseif QBCore.Shared.Weapons[weapon]["name"] == "weapon_grenade" then
                                TriggerServerEvent('QBCore:Server:RemoveItem', "weapon_grenade", 1)
                            elseif QBCore.Shared.Weapons[weapon]["name"] == "weapon_bzgas" then
                                TriggerServerEvent('QBCore:Server:RemoveItem', "weapon_bzgas", 1)
                            elseif QBCore.Shared.Weapons[weapon]["name"] == "weapon_proxmine" then
                                TriggerServerEvent('QBCore:Server:RemoveItem', "weapon_proxmine", 1)
                            elseif QBCore.Shared.Weapons[weapon]["name"] == "weapon_ball" then
                                TriggerServerEvent('QBCore:Server:RemoveItem', "weapon_ball", 1)
                            elseif QBCore.Shared.Weapons[weapon]["name"] == "weapon_smokegrenade" then
                                TriggerServerEvent('QBCore:Server:RemoveItem', "weapon_smokegrenade", 1)
                            elseif QBCore.Shared.Weapons[weapon]["name"] == "weapon_flare" then
                                TriggerServerEvent('QBCore:Server:RemoveItem', "weapon_flare", 1)
                            else
                                if ammo > 0 then
                                    MultiplierAmount = MultiplierAmount + 1
                                end
                            end
                        end
                    else
                        if weapon ~= -1569615261 then
                            TriggerEvent('inventory:client:CheckWeapon', QBCore.Shared.Weapons[weapon]["name"])
                            Inventory.Notify(Lang:t('error.weapon_broken'), "error")
                            MultiplierAmount = 0
                        end
                    end
                end
            end
        end
        Wait(1)
    end
end)

CreateThread(function()
    while true do
        if LocalPlayer.state.isLoggedIn then
            local inRange = false
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            for k, data in pairs(Inventory.WeaponRepairPoints) do
                local distance = #(pos - data.coords)
                if distance < 10 then
                    inRange = true
                    if distance < 1 then
                        if data.IsRepairing then
                            if data.RepairingData.CitizenId ~= PlayerData.citizenid then
                                DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, Lang:t('info.repairshop_not_usable'))
                            else
                                if not data.RepairingData.Ready then
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, Lang:t('info.weapon_will_repair'))
                                else
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, Lang:t('info.take_weapon_back'))
                                end
                            end
                        else
                            if CurrentWeaponData and next(CurrentWeaponData) then
                                if not data.RepairingData.Ready then
                                    local WeaponData = QBCore.Shared.Weapons[GetHashKey(CurrentWeaponData.name)]
                                    local WeaponClass = (QBCore.Shared.SplitStr(WeaponData.ammotype, "_")[2]):lower()
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, Lang:t('info.repair_weapon_price', { value = Inventory.WeaponRepairCosts[WeaponClass] }))
                                    if IsControlJustPressed(0, 38) then
                                        QBCore.Functions.TriggerCallback('weapons:server:RepairWeapon', function(HasMoney)
                                            if HasMoney then
                                                CurrentWeaponData = {}
                                            end
                                        end, k, CurrentWeaponData)
                                    end
                                else
                                    if data.RepairingData.CitizenId ~= PlayerData.citizenid then
                                        DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, Lang:t('info.repairshop_not_usable'))
                                    else
                                        DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, Lang:t('info.take_weapon_back'))
                                        if IsControlJustPressed(0, 38) then
                                            TriggerServerEvent('weapons:server:TakeBackWeapon', k, data)
                                        end
                                    end
                                end
                            else
                                if data.RepairingData.CitizenId == nil then
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, Lang:t('error.no_weapon_in_hand'))
                                elseif data.RepairingData.CitizenId == PlayerData.citizenid then
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, Lang:t('info.take_weapon_back'))
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
        end
        Wait(3)
    end
end)