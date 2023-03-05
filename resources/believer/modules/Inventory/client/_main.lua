GM.Inventory = GM.Inventory or {}

Callback = {}
Callback.Functions = {}
Callback.ServerCallbacks = {}

function Callback.Functions.TriggerCallback(name, cb, ...)
    Callback.ServerCallbacks[name] = cb
    TriggerServerEvent('inventory:Server:TriggerCallback', name, ...)
end

RegisterNetEvent('inventory:Client:TriggerCallback', function(name, ...)
    if Callback.ServerCallbacks[name] then
        Callback.ServerCallbacks[name](...)
        Callback.ServerCallbacks[name] = nil
    end
end)

local inInventory, vehicleTrunk, playerInventoryIdentifier, secInventoryIdentifier, rememberItems, preView = false, nil, nil, nil, {}, nil

local function DrawPedToScreen(ped, draw)
    if draw == nil then draw = 0 end
    CreateThread(function()
        local heading = GetEntityHeading(ped)
        SetFrontendActive(true)
        ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_EMPTY_NO_BACKGROUND"), false, -1)
        Wait(100)
        SetMouseCursorVisibleInMenus(false)
        PlayerPedPreview = ClonePed(ped, heading, true, false)
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

function isInventoryPlayer(invID) 
    if invID == playerInventoryIdentifier then
        return true
    end
    return false
end


RegisterNetEvent("Inventory:c:ItemChanged", function(data)
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

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function()
    SetupInventory()
end)

function SetupInventory()
    DeleteInventory()
    Citizen.Wait(500)
    Callback.Functions.TriggerCallback("Inventory:s:getAllItems", function(items)
        Callback.Functions.TriggerCallback("Inventory:s:getPlayerInventory", function(inventory)
            playerInventoryIdentifier = inventory._inventoryId
            SendNUIMessage({
                action = "setupInventory",
                items = items,
                inventory = inventory,
                weapons = GM.Inventory.WeaponAttachment.Weapons,
                weight = GM.Inventory.Weight,
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

RegisterNetEvent("esx:onPlayerDeath")
AddEventHandler("esx:onPlayerDeath", function()
    DeleteInventory()
end)

function OpenPlayerInventory(status) 
    if not inInventory and not IsEntityDead(PlayerPedId()) then
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
        Callback.Functions.TriggerCallback("Inventory:s:getSecondInventory", function(inventory)
            secInventoryIdentifier = inventory._inventoryId
            SendNUIMessage({
                action = "setupSecondInventory",
                inventory = inventory,
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
                    CurrentVehicle = GetVehicleNumberPlateText(vehicle) 
                    local InventoryGettingData = {
                        identifier = "T-"..CurrentVehicle,
                        type = "vehicle",
                        vehicleClass = GetVehicleClass(vehicle),
                        vehicleModel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)),
                        vehicleStorageType = "trunk",
                    }
                    Callback.Functions.TriggerCallback("Inventory:s:getSecondInventory", function(inventory)
                        secInventoryIdentifier = inventory._inventoryId
                        SendNUIMessage({
                            action = "setupSecondInventory",
                            inventory = inventory,
                        })
                    end, InventoryGettingData)

                    TaskTurnPedToFaceCoord(PlayerPedId(), trunkpos.x, trunkpos.y, trunkpos.z)
                    while (not HasAnimDictLoaded("anim@heists@prison_heiststation@cop_reactions")) do RequestAnimDict("anim@heists@prison_heiststation@cop_reactions") Wait(100) end
                    TaskPlayAnim(PlayerPedId(), "anim@heists@prison_heiststation@cop_reactions", "cop_b_idle", 2.0, 2.0, -1, 50, 0, false, false, false)
                    SetVehicleDoorOpen(vehicle, 5, false, false)

                    inventoryFound = true 
                    isInventoryOpen = true
                    vehicleTrunk = vehicle
                else
                    ESX.ShowHelpNotification("Vehicle Locked")
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

        Callback.Functions.TriggerCallback("inventory:s:GetDropItems", function(inventory)
            secInventoryIdentifier = inventory._inventoryId
            SendNUIMessage({
                action = "setupSecondInventory",
                inventory = inventory,
            })
        end, InventoryGettingData)
        isInventoryOpen = true
    end
end

function CreateDropId()
	local id = "DROP-"..math.random(10000, 99999)
    return id
end

Drops       = {}
DropsNear   = nil

Citizen.CreateThread(function()
    while true do
        Callback.Functions.TriggerCallback("inventory:server:GetDrops", function(drops)
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
                        
                        local box = CreateObject(GetHashKey('hei_prop_heist_box'), v.coords, false, false, false)
                        PlaceObjectOnGroundProperly(box)
                        FreezeEntityPosition(box, true)
                        SetEntityCollision(box, false, false)
                
                        Drops[k].object = box
                    end
                end

            end
            
        end)
        Citizen.Wait(GM.Inventory.RefreshDrops*1000)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        DropsNear = nil
        for _,v in pairs(Drops) do
            if v.coords then
                local coordsP = GetEntityCoords(PlayerPedId())
                if #(coordsP - v.coords) < 2.0 then
                    DropsNear = v
                end
            end
        end
    end
end)

function GetNearDrop()
    local newId = CreateDropId()
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

RegisterNetEvent("inventory:c:checkDropOpen", function(id)
    if secInventoryIdentifier == id then
        TriggerServerEvent("inventory:s:checkDropOpen", id)
    end
end)

function CheckInventoryOpen()
    return inInventory
end

RegisterNUICallback("closeNUI", function()
    inInventory = false
    SetNuiFocus(false, false)

    secInventoryIdentifier = nil
    
    DeleteDrawedPed()

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

RegisterCommand('inventory', function()
    OpenPlayerInventory()
end, false)
RegisterCommand("rob", function()
    local player, distance = GetClosestPlayer()

    if CheckInventoryOpen() then return end
    
    if distance < 4.0 and player ~= -1 then
        local player2 = GetPlayerServerId(player)
        Callback.Functions.TriggerCallback("inventory:s:getPlayerId", function(idReturn)
            local InventoryGettingData = {
                identifier = idReturn,
                type = "player",
            }
            Callback.Functions.TriggerCallback("Inventory:s:getSecondInventory", function(inventory)
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

RegisterNetEvent("inventory:c:OpenCustomInventory", function(id, tpl, temp)
    OpenCustomInventory(id, tpl, temp)
end)

function OpenCustomInventory(InventoryID, InventoryTPL, isTemporary)
    if CheckInventoryOpen() then return end

    if InventoryID == nil or InventoryID == "" then return end
    if InventoryTPL == nil or InventoryTPL == "" then return end
    if isTemporary == nil then isTemporary = false end

    local InventoryGettingData = {
        identifier = InventoryID,
        type = "custom",
        inventoryCode = InventoryTPL,
        isTemporary = isTemporary,
    }
    Callback.Functions.TriggerCallback("Inventory:s:getSecondInventory", function(inventory)
        OpenPlayerInventory(false)
        secInventoryIdentifier = inventory._inventoryId

        SendNUIMessage({
            action = "setupSecondInventory",
            inventory = inventory,
        })
    end, InventoryGettingData)
end
exports("CustomInventory", OpenCustomInventory)

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

currentWeapon     = nil
currentWeaponData = {}

RegisterNetEvent('inventory:c:useWeapon', function(weaponData, shootbool)
    local ped = PlayerPedId()
    local weaponName = tostring(weaponData._name)

    if currentWeapon == weaponName then
        SetCurrentPedWeapon(ped, 'WEAPON_UNARMED', true)
        RemoveAllPedWeapons(ped, true)
        TriggerEvent('Inventory:setCurrentWeapon', nil, shootbool)
        currentWeapon = nil
        currentWeaponData = {}
        ESX.ShowNotification("~g~Vous avez rangé votre arme.")
        return
    elseif weaponName == "weapon_stickybomb" or weaponName == "weapon_pipebomb" or weaponName == "weapon_smokegrenade" or weaponName == "weapon_flare" or weaponName == "weapon_proxmine" or weaponName == "weapon_ball"  or weaponName == "weapon_molotov" or weaponName == "weapon_grenade" or weaponName == "weapon_bzgas" then
        GiveWeaponToPed(ped, GetHashKey(weaponName), 1, false, false)
        SetPedAmmo(ped, GetHashKey(weaponName), 1)
        SetCurrentPedWeapon(ped, GetHashKey(weaponName), true)
        TriggerEvent('Inventory:setCurrentWeapon', weaponData, shootbool)
        currentWeapon = weaponName
        currentWeaponData = {}
    elseif weaponName == "weapon_snowball" then
        GiveWeaponToPed(ped, GetHashKey(weaponName), 10, false, false)
        SetPedAmmo(ped, GetHashKey(weaponName), 10)
        SetCurrentPedWeapon(ped, GetHashKey(weaponName), true)
        TriggerServerEvent('ESX:Server:RemoveItem', weaponName, 1)
        -- Todo check this
        TriggerEvent('Inventory:setCurrentWeapon', weaponData, shootbool)
        currentWeapon = weaponName
        currentWeaponData = {}
    else
        TriggerEvent('Inventory:setCurrentWeapon', weaponData, shootbool)
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
    ESX.ShowNotification("~g~Vous avez équipé votre "..weaponData._data.Label..".")
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
    for _,v in pairs(GM.Inventory.Weapons) do
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
    if CurrentWeight >= GM.Inventory.Weight.MaxPlayerWeight then
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
            SetPedMoveRateOverride(PlayerPedId(), GM.Inventory.Weight.MaxPlayerWeight/(CurrentWeight*GM.Inventory.Weight.OverweightMultiplier))
            Citizen.Wait(0)
        end
    end)
end


RegisterNetEvent("Inventory:c:addItem", function(item)
    SendNUIMessage({
        action = "AddItem",
        itemData = item,
    })
end)

RegisterNetEvent("Inventory:c:removeItem", function(itemID, Amount)
    SendNUIMessage({
        action = "RemoveItem",
        itemID = itemID,
        amount = Amount
    })
end)

RegisterNetEvent("Inventory:c:updateItem", function(itemID, inventoryId, newData)
    SendNUIMessage({
        action = "UpdateItem",
        itemID = itemID,
        inventoryID = inventoryId,
        newD = newData
    })
end)

RegisterNUICallback("AddItemFromAttachment", function(data, cb)
    TriggerServerEvent("Inventory:s:AddItemFromAttachment", data)
end)

RegisterNUICallback("ItemChanged", function(data, cb)
    CheckAndRefreshPlayer(data)

    data.itemD.loc.x = splitText(data.toLocation, "-")[1]
    data.itemD.loc.y = splitText(data.toLocation, "-")[2]
    data.itemD.loc.r = data.toRotate
    data.itemD.slotId = data.toSlot
    data.itemD._parent = data.toParent

    TriggerServerEvent("Inventory:s:ItemChanged", data)
end)

RegisterNUICallback("FastUseChanged", function(data, cb)
    TriggerServerEvent("Inventory:s:FastUseChanged", data)
end)

RegisterNUICallback("UseItem", function(data, cb)
    TriggerServerEvent("Inventory:s:UseItem", data)
end)

RegisterNUICallback("UseItemContext", function(data, cb)
    TriggerServerEvent("Inventory:s:UseItemContext", data)
end)

RegisterNUICallback("RemoveItem", function(data, cb)
    TriggerServerEvent("Inventory:s:RemoveItem", data)
end)


RegisterNUICallback("UpdateItem", function(data, cb)
    TriggerServerEvent("Inventory:s:UpdateItem", data)
end)

function splitText(s, sep)
    local fields = {}
    
    local sep = sep or " "
    local pattern = string.format("([^%s]+)", sep)
    string.gsub(s, pattern, function(c) fields[#fields + 1] = c end)
    
    return fields
end

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

    for k,v in pairs(GM.Inventory.WeaponAttachment.Bones) do

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
            for k,v in pairs(GM.Inventory.WeaponAttachment.Bones) do
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
    while not HasModelLoaded(model) do 
        Citizen.Wait(10) 
    end
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
    while not HasModelLoaded(model) do 
        Citizen.Wait(10) 
    end

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

skinData = {}

function SetupSkin() 
    ESX.TriggerServerCallback("esx_skin:getPlayerSkin", function(skin)
        
        if type(skin) ~= "table" then
            skinData = json.decode(skin)
        else
            skinData = skin
        end
        
        Wait(1500)
        TriggerEvent("inventory:c:refreshClothes")

        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(5000)
                SendNUIMessage({
                    action = "refreshClothes"
                })
            end
        end)
    end)

    --CreateClothLoop()
end

function DeleteSkin()
    skinData = {}
end

RegisterNetEvent("inventory:c:refreshClothes")
AddEventHandler("inventory:c:refreshClothes", function()
     SendNUIMessage({action = "refreshClothesFully"})
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
                local Clothe = GM.Inventory.ClothingWear[data.clothingname]
                if (Clothe.Drawable ~= nil) then
                    if type(Clothe.Table[Gender]) == "table" then
                        if Clothe.DrawableCheck ~= nil then
                            local variations = Clothe.Table[Gender][GetPedDrawableVariation(Ped, Clothe.DrawableCheck)]
                            if variations == nil then variations = 15 end
                            SetPedComponentVariation(Ped, Clothe.Drawable, variations, 0, 0)

                            if skinData[Clothe.DatabaseName] ~= variations then
                                skinData[Clothe.DatabaseName] = variations
                                local test = (Clothe.DatabaseName):gsub("_1", "_2")
                                skinData[test] = 0
                            end
                        end
                    else
                        SetPedComponentVariation(Ped, Clothe.Drawable, Clothe.Table[Gender], 0, 0)

                        if skinData[Clothe.DatabaseName] ~= Clothe.Table[Gender] then
                            skinData[Clothe.DatabaseName] = Clothe.Table[Gender]
                            local test = (Clothe.DatabaseName):gsub("_1", "_2")
                            skinData[test] = 0
                        end
                    end

                elseif (Clothe.Prop ~= nil) then
                    ClearPedProp(Ped, Clothe.Prop)

                    if skinData[Clothe.DatabaseName] ~= Clothe.Prop then
                        skinData[Clothe.DatabaseName] = 0
                        local test = (Clothe.DatabaseName):gsub("_1", "_2")
                        skinData[test] = 0
                    end
                end
                CheckData()
            else
                local Clothe = GM.Inventory.ClothingWear[data.clothingname]
                PlayToggleEmote(Clothe.Emote, function()
                    if (Clothe.Drawable ~= nil) then
                        local Texture = GetPedTextureVariation(Ped, Clothe.Drawable)
                        SetPedComponentVariation(Ped, Clothe.Drawable, Clothe.Table[Gender], Texture, 0)

                        if skinData[Clothe.DatabaseName] ~= Clothe.Table[Gender] then
                            skinData[Clothe.DatabaseName] = Clothe.Table[Gender]
                            local test = (Clothe.DatabaseName):gsub("_1", "_2")
                            skinData[test] = Texture
                        end
                    elseif (Clothe.Prop ~= nil) then
                        ClearPedProp(Ped, Clothe.Prop)

                        if skinData[Clothe.DatabaseName] ~= Clothe.Prop then
                            local test = (Clothe.DatabaseName):gsub("_1", "_2")
                            skinData[test] = 0
                        end
                    end
                    CheckData()
                end)
            end
        else
            if not data.animation then
                local info = data.clothedata
                local Clothe = GM.Inventory.ClothingWear[data.clothingname]
                if info ~= nil then
                    if Clothe.Drawable then
                        SetPedComponentVariation(Ped, Clothe.Drawable, info[Gender].id, 0, 2)
                        SetPedComponentVariation(Ped, Clothe.Drawable, info[Gender].id, info[Gender].texture, 0)
    
                        if skinData[Clothe.DatabaseName] ~= info[Gender].id then
                            skinData[Clothe.DatabaseName] = info[Gender].id
                            local test = (Clothe.DatabaseName):gsub("_1", "_2")
                            skinData[test] = info[Gender].texture
                        end
                    else
                        SetPedPropIndex(Ped,info.prop, info[Gender].id, info[Gender].texture, true)
    
                        if skinData[Clothe.DatabaseName] ~= info[Gender].id then
                            skinData[Clothe.DatabaseName] = info[Gender].id
                            local test = (Clothe.DatabaseName):gsub("_1", "_2")
                            skinData[test] = info[Gender].texture
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

                                if skinData[Clothe.DatabaseName] ~= variations then
                                    skinData[Clothe.DatabaseName] = variations
                                    local test = (Clothe.DatabaseName):gsub("_1", "_2")
                                    skinData[test] = Texture
                                end
                            end
                        else
                            SetPedComponentVariation(Ped, Clothe.Drawable, Clothe.Table[Gender], 0, 0)

                            if skinData[Clothe.DatabaseName] ~= Clothe.Table[Gender] then
                                skinData[Clothe.DatabaseName] = Clothe.Table[Gender]
                                local test = (Clothe.DatabaseName):gsub("_1", "_2")
                                skinData[test] = 0
                            end
                        end

                    elseif (Clothe.Prop ~= nil) then
                        ClearPedProp(Ped, Clothe.Prop)

                        if skinData[Clothe.DatabaseName].item ~= Clothe.Prop then
                            skinData[Clothe.DatabaseName].item = 0
                            skinData[Clothe.DatabaseName].texture = 0
                        end

                        if skinData[Clothe.DatabaseName] ~= Clothe.Prop then
                            skinData[Clothe.DatabaseName] = 0
                            local test = (Clothe.DatabaseName):gsub("_1", "_2")
                            skinData[test] = 0
                        end
                    end
                end
            else
                local Clothe = GM.Inventory.ClothingWear[data.clothingname]
                PlayToggleEmote(Clothe.Emote, function()
                    local info = data.clothedata
                    if info ~= nil then
                        if info.drawable then
                            SetPedComponentVariation(Ped, info.drawable, info[Gender].id, 0, 2)
                            SetPedComponentVariation(Ped, info.drawable, info[Gender].id, info[Gender].texture, 0)
    
                            if skinData[Clothe.DatabaseName] ~= info[Gender].id then
                                skinData[Clothe.DatabaseName] = info[Gender].id
                                local test = (Clothe.DatabaseName):gsub("_1", "_2")
                                skinData[test] = info[Gender].texture
                            end
                        else
                            SetPedPropIndex(Ped,info.prop, info[Gender].id, info[Gender].texture, true)
    
                            if skinData[Clothe.DatabaseName].item ~= info[Gender].id then
                                skinData[Clothe.DatabaseName].item = info[Gender].id
                                local test = (Clothe.DatabaseName):gsub("_1", "_2")
                                skinData[test] = info[Gender].texture
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
    
                                    if skinData[Clothe.DatabaseName] ~= variations then
                                        skinData[Clothe.DatabaseName] = variations
                                        local test = (Clothe.DatabaseName):gsub("_1", "_2")
                                        skinData[test] = Texture
                                    end
                                end
                            else
                                SetPedComponentVariation(Ped, Clothe.Drawable, Clothe.Table[Gender], 0, 0)
    
                                if skinData[Clothe.DatabaseName] ~= Clothe.Table[Gender] then
                                    skinData[Clothe.DatabaseName] = Clothe.Table[Gender]
                                    local test = (Clothe.DatabaseName):gsub("_1", "_2")
                                    skinData[test] = 0
                                end
                            end
    
                        elseif (Clothe.Prop ~= nil) then
                            ClearPedProp(Ped, Clothe.Prop)
    
                            if skinData[Clothe.DatabaseName].item ~= Clothe.Prop then
                                skinData[Clothe.DatabaseName].item = 0
                                skinData[Clothe.DatabaseName].texture = 0
                            end
    
                            if skinData[Clothe.DatabaseName] ~= Clothe.Prop then
                                skinData[Clothe.DatabaseName] = 0
                                local test = (Clothe.DatabaseName):gsub("_1", "_2")
                                skinData[test] = 0
                            end
                        end
                    end
                    CheckData()
                end)
            end
        end
    else
        TriggerServerEvent("inventory:s:changeClothes", data)
    end
end)

RegisterNetEvent("inventory:c:changeClothes", function(data)
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
    ESX.TriggerServerCallback("esx_skin:getPlayerSkin", function(skin)
        local secondData = nil
        if type(skin) ~= "table" then
            secondData = json.decode(skin)
        else
            secondData = skin
        end
        
        if secondData ~= nil then
            local realClothing = skinData
            
            local anyChanges = false
            for k,v in pairs(secondData) do
                if not FindAndCheck(k) then
                    realClothing[k] = v
                    anyChanges = true
                end
            end

            if anyChanges then
                TriggerServerEvent('esx_skin:save', realClothing)
            end
        end
    end)
end

function FindAndCheck(key)
    for _,v in pairs(GM.Inventory.ClothingWear) do
        if v.DatabaseName == key then
            return true
        end
    end
    return false
end
function CreateClothLoop()
    Citizen.CreateThread(function()
        while inventoryCreated do
            local tempValue = skinData
            Wait(5000)
            if skinData ~= nil then
                local anyDiffrence = false
                for k,v in pairs(skinData) do
                    if FindAndCheck(k) then
                        if tempValue[k] ~= v then
                            anyDiffrence = true
                            break
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

RegisterNetEvent("Inventory:giveClothesItem")
AddEventHandler("Inventory:giveClothesItem", function(data, previousSkinData, isFirst)
    if isFirst then
        for key,v in pairs(GM.Inventory.ClothingWear) do
            if data[v.DatabaseName] ~= nil then
                if data[v.DatabaseName] >= 0 then
                    local itemData = data[v.DatabaseName]
                    local itm = v.DatabaseName:gsub("_1", "_2")
                    local secItemdata = data[itm]

                    local info = {}
                    if v.Drawable ~= nil then
                        info.clothData = {
                            ["drawable"] = v.Drawable,
                            ["Male"] = {id= itemData, texture=secItemdata},
                            ["Female"] = {id= itemData, texture=secItemdata},
                        }
                    else
                        info.clothData = {
                            ["prop"] = v.Prop,
                            ["Male"] = {id= itemData, texture=secItemdata},
                            ["Female"] = {id= itemData, texture=secItemdata},
                        }
                    end

                    local givinItem = key
                    if givinItem == "backpack" then
                        if (itemData == 40 or itemData == 41 or itemData == 44 or itemData == 45 or itemData == 81 or itemData == 82 or itemData == 85 or itemData == 86) then
                            givinItem = "bag1"
                        end
                    elseif givinItem == "rig" then
                        if (itemData == 16) then
                            givinItem = "rig1"
                        end
                    end

                    TriggerServerEvent("Inventory:giveClothes", givinItem, 1, info)
                end
            end
        end
    else
        for key,v in pairs(GM.Inventory.ClothingWear) do
            local pre = previousSkinData
            local itm = v.DatabaseName:gsub("_1", "_2")
            local secItemdata = data[itm]
            if (data[v.DatabaseName] ~= pre[v.DatabaseName] or data[itm] ~= pre[itm]) then
                local itemData = data[v.DatabaseName]

                local info = {}
                if v.Drawable ~= nil then
                    info.clothData = {
                        ["drawable"] = v.Drawable,
                        ["Male"] = {id= itemData, texture=secItemdata},
                        ["Female"] = {id= itemData, texture=secItemdata},
                    }
                else
                    info.clothData = {
                        ["prop"] = v.Prop,
                        ["Male"] = {id= itemData, texture=secItemdata},
                        ["Female"] = {id= itemData, texture=secItemdata},
                    }
                end

                local givinItem = key
                if givinItem == "backpack" then
                    if (itemData == 40 or itemData == 41 or itemData == 44 or itemData == 45 or itemData == 81 or itemData == 82 or itemData == 85 or itemData == 86) then
                        givinItem = "bag1"
                    end
                elseif givinItem == "rig" then
                    if (itemData == 16 or itemData == 1) then
                        givinItem = "rig1"
                    end
                end

                TriggerServerEvent("Inventory:giveClothes", givinItem, 1, info)
            end
        end
    end
end)

RegisterCommand("giveclothes", function(source, args)
    if (args[1] == nil) then
        ESX.ShowNotification("~r~Merci de mettre le type de vêtement")
        return
    end

    local clothes_type = tostring(args[1])
    if (not clothes_type) then
        ESX.ShowNotification("~r~Merci de mettre le type de vêtement.")
        return
    end

    local clothes_data = GM.Inventory.ClothingWear[clothes_type]
    if (not clothes_data) then
        ESX.ShowNotification("~r~Impossible de trouver le type de vêtement.")
        return
    end

    local item = clothes_data.DatabaseName:gsub("_1", "_2")
    if (not item) then return end

    local clothes_drawable = tonumber(args[2])
    if (not clothes_drawable) then 
        ESX.ShowNotification("~r~Merci de mettre le drawable.")
        return
    end

    local clothes_textures = tonumber(args[3])
    if (not clothes_textures) then
        ESX.ShowNotification("~r~Merci de mettre la texture.")
        return 
    end

    local info = {}
    if clothes_data.Drawable ~= nil then
        info.clothData = {
            ["drawable"] = clothes_data.Drawable,
            ["Male"] = { id = clothes_drawable, texture = clothes_textures},
            ["Female"] = { id = clothes_drawable, texture = clothes_textures},
        }
    else
        info.clothData = {
            ["prop"] = clothes_data.Prop,
            ["Male"] = { id = clothes_drawable, texture = clothes_textures},
            ["Female"] = { id = clothes_drawable, texture = clothes_textures},
        }
    end

    TriggerServerEvent("Inventory:giveClothes", clothes_type, 1, info)
end)

RegisterNUICallback("checkPrice", function(data, cb)
    Callback.Functions.TriggerCallback("inventory:s:checkPrice", function(value)
        if (value) then
            ESX.ShowNotification("You bought an item!")
        else
            ESX.ShowNotification("You not enough money to bought!")
        end
        cb(value)
    end, data)
end)

local PlayerData, CurrentWeaponData, CanShoot, MultiplierAmount = {}, {}, true, 0

-- Handlers

AddEventHandler('esx:playerLoaded', function()
    PlayerData = ESX.GetPlayerData()
    ESX.TriggerServerCallback("weapons:server:GetConfig", function(RepairPoints)
        for k, data in pairs(RepairPoints) do
            GM.Inventory.WeaponRepairPoints[k].IsRepairing = data.IsRepairing
            GM.Inventory.WeaponRepairPoints[k].RepairingData = data.RepairingData
        end
    end)
end)

RegisterNetEvent('esx:onPlayerDeath', function()
    for k in pairs(GM.Inventory.WeaponRepairPoints) do
        GM.Inventory.WeaponRepairPoints[k].IsRepairing = false
        GM.Inventory.WeaponRepairPoints[k].RepairingData = {}
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
    GM.Inventory.WeaponRepairPoints[key].IsRepairing = NewData.IsRepairing
    GM.Inventory.WeaponRepairPoints[key].RepairingData = NewData.RepairingData
end)


RegisterNetEvent('Inventory:setCurrentWeapon', function(data, bool)
    if data ~= false then
        CurrentWeaponData = data
    else
        CurrentWeaponData = {}
    end
    CanShoot = bool
end)

RegisterNetEvent('Inventory:setWeaponQuality', function(amount)
    if CurrentWeaponData and next(CurrentWeaponData) then
        TriggerServerEvent("Inventory:setWeaponQuality", CurrentWeaponData, amount)
    end
end)

RegisterNetEvent('Inventory:addAmmo', function(type, amount, itemData)
    local ped = PlayerPedId()
    local weapon = GetSelectedPedWeapon(ped)

    local WeaponData = GM.Inventory.WeaponList[weapon]
    if (not WeaponData) then
        ESX.ShowNotification("~r~Cette arme n'est pas dans la liste des armes.\nMerci de contacter un administrateur ("..weapon..").")
        return
    end

    if CurrentWeaponData then
        if (WeaponData["name"] == "weapon_unarmed") then
            ESX.ShowNotification("~r~Vous n'avez pas d'arme en main.")
            return
        end
        if WeaponData["ammotype"] == type:upper() then
            local total = GetAmmoInPedWeapon(ped, weapon)
            local _, maxAmmo = GetMaxAmmo(ped, weapon)
            if total < maxAmmo then
                AddAmmoToPed(ped,weapon,amount)
                MakePedReload(ped)
                TriggerServerEvent("Inventory:updateWeaponAmmo", CurrentWeaponData, total + amount)
                TriggerServerEvent("Inventory:RemoveItem", itemData)

                ESX.ShowNotification("~g~Vous avez rechargé votre arme.")
            else
                ESX.ShowNotification("~r~Vous avez déjà assez de munitions.")
            end
        else
            ESX.ShowNotification("~r~Vous n'avez pas le bon type de munitions ("..WeaponData["ammotype"]..").")
        end
    else
        ESX.ShowNotification("~r~Vous n'avez pas d'arme en main.")
    end
end)

CreateThread(function()
    SetWeaponsNoAutoswap(true)
    Wait(1000)
    while true do
        Wait(750)
        HideHudComponentThisFrame(19)
        HideHudComponentThisFrame(20)
        BlockWeaponWheelThisFrame()
        SetPedCanSwitchWeapon(PlayerPedId(), false)
    end
end)

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        if IsPedArmed(ped, 7) == 1 and (IsControlJustReleased(0, 24) or IsDisabledControlJustReleased(0, 24)) then
            local weapon = GetSelectedPedWeapon(ped)
            local ammo = GetAmmoInPedWeapon(ped, weapon)
            TriggerServerEvent("Inventory:updateWeaponAmmo", CurrentWeaponData, tonumber(ammo))
            if MultiplierAmount > 0 then
                TriggerServerEvent("Inventory:updateWeaponQuality", CurrentWeaponData, MultiplierAmount)
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
        for k, data in pairs(GM.Inventory.WeaponRepairPoints) do
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
                                local WeaponData = GM.Inventory.WeaponAttachment.Ammo[GetHashKey(WEAPON_DATA.name)]
                                local WeaponClass = (SplitStr(WeaponData.ammotype, "_")[2]):lower()
                                DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, '[E] Repair Weapon, ~g~'..GM.Inventory.WeaponRepairCosts[WeaponClass]..'~w~')
                                if IsControlJustPressed(0, 38) then
                                    ESX.TriggerServerCallback('weapons:server:RepairWeapon', function(HasMoney)
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
    GM.Inventory.WeaponRepairPoints[key].IsRepairing = NewData.IsRepairing
    GM.Inventory.WeaponRepairPoints[key].RepairingData = NewData.RepairingData
end)


RegisterNetEvent("Inventory:forceClose")
AddEventHandler("Inventory:forceClose", function()
    if CheckInventoryOpen() then
        OpenPlayerInventory(false) 
    end
end)