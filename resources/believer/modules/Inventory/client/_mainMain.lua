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

function isInventoryPlayer( invID ) 
    if invID == playerInventoryIdentifier then
        return true
    end
    return false
end


RegisterNetEvent("ls-inventory:c:ItemChanged", function(data)
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

RegisterNetEvent(BlueStarkInventory.Events.PlayerLoaded)
AddEventHandler(BlueStarkInventory.Events.PlayerLoaded, function()
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
                weapons = BlueStarkInventory.WeaponAttachment.Weapons,
                weight = BlueStarkInventory.Weight,
                hahud = BlueStarkInventory.HAHud,
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

RegisterNetEvent(BlueStarkInventory.Events.PlayerUnloaded)
AddEventHandler(BlueStarkInventory.Events.PlayerUnloaded, function()
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

        if BlueStarkInventory.Blur then
            TriggerScreenblurFadeIn(250)
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
                    Callback.Functions.TriggerCallback("ls-inventory:s:getSecondInventory", function(inventory)
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
                    BlueStarkInventory.Notify("client", "Vehicle Locked", "error")
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
        Citizen.Wait(BlueStarkInventory.RefreshDrops*1000)
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

    if BlueStarkInventory.Blur then
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

if BlueStarkInventory.Debug then
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