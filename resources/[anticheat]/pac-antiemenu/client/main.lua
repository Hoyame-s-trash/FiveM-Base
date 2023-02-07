local function CheckTable(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    
    return false
end

local IsolatedEnvironmentKeys = {
    ["121"] = {45, 0},
    ["214"] = {46, 0},
    ["212"] = {36, 0},
    ["10"] = {33, 0},
    ["11"] = {34, 0},
    ["168"] = {118, 0},
    ["57"] = {121, 0},
    ["169"] = {119, 0}
}

local entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enum.handle then
            enum.destructor(enum.handle)
        end
        enum.destructor = nil
        enum.handle = nil
    end
}
local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
        local iter, id = initFunc()
        if not id or id == 0 then
            disposeFunc(iter)
            return
        end
    
        local enum = {handle = iter, destructor = disposeFunc}
        setmetatable(enum, entityEnumerator)
    
        local next = true
        repeat
            coroutine.yield(id)
            next, id = moveFunc(iter)
        until not next
    
        enum.destructor, enum.handle = nil, nil
        disposeFunc(iter)
    end)
end

local function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

local function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

local function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

local function EnumeratePickups()
    return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end

Citizen.CreateThread(function()
    while Config.BlockExecutor do
        Wait(1000)
        if IsUsingKeyboard(2) then
            for k, v in pairs(IsolatedEnvironmentKeys) do
                if IsControlPressed(0, tonumber(k)) then
                    if IsolatedEnvironmentKeys[k][2] == 0 then
                        SendNUIMessage({
                            type = 0,
                            key = IsolatedEnvironmentKeys[k][1]
                        })
                    end
                    SetNuiFocus(true, false)
                    SetNuiFocusKeepInput(true)
                    IsolatedEnvironmentKeys[k][2] = IsolatedEnvironmentKeys[k][2] + 1
                else
                    if IsolatedEnvironmentKeys[k][2] ~= 0 then
                        if IsolatedEnvironmentKeys[k][2] > 5 then
                            SendNUIMessage({
                                type = 1,
                                key = IsolatedEnvironmentKeys[k][1]
                            })
                        end
                        SetNuiFocus(false, false)
                        SetNuiFocusKeepInput(false)
                        IsolatedEnvironmentKeys[k][2] = 0
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    local resourceList = {}
    local rscStored = false
    if (rscStored == false) then
        for i = 0, GetNumResources(), 1 do
            local resource_name = GetResourceByFindIndex(i)
            if resource_name and GetResourceState(resource_name) == "started" then
                table.insert(resourceList, resource_name)
                rscStored = true
            end
        end
    end

    while Config.BlockSpawnEntity do
        Citizen.Wait(2000)
        for vehicle in EnumerateVehicles() do
            local handle = GetEntityScript(vehicle)
            if handle ~= nil and handle ~= "" and NetworkGetEntityOwner(vehicle) then
                if (not CheckTable(resourceList, handle) and rscStored == true) then
                    TriggerServerEvent("pac:deleteentityfromall", vehicle)
                    TriggerServerEvent("pac:eulen", "Anti Vehicle Spawn", "Player tried to create a new vehicle wtih cheat. Resource name: "..handle.." Vehicle hash: "..vehicle)
                    break
                end
            end
        end

        for peds in EnumeratePeds() do
            local handle = GetEntityScript(peds)
            if handle ~= nil and handle ~= "" and NetworkGetEntityOwner(peds) then
                if (not CheckTable(resourceList, handle) and rscStored == true) then
                    TriggerServerEvent("pac:deleteentityfromall", peds)
                    TriggerServerEvent("pac:eulen", "Anti Ped Spawn", "Player tried to create a new ped with cheat. Resource name: "..handle.." Ped hash: "..peds)
                    break
                end
            end
        end

        for objects in EnumerateObjects() do
            local handle = GetEntityScript(objects)
            if handle ~= nil and handle ~= "" and NetworkGetEntityOwner(objects) then
                if (not CheckTable(resourceList, handle) and rscStored == true) then
                    TriggerServerEvent("pac:deleteentityfromall", objects)
                    TriggerServerEvent("pac:eulen", "Anti Object Spawn", "Player tried to create a new object with cheat. Resource name: "..handle.." Object hash: "..objects)
                    break
                end
            end
        end
    end
end)

RegisterNUICallback('isolated-detected', function(data)    
    TriggerServerEvent("pac:eulen", "ANTI EXECUTOR", "Player tried to create isolated environment. (" .. data.key .. ")")
end)

RegisterNetEvent("pac:deleteentityfromall", function(entity)
    if DoesEntityExist(entity) then
        DeleteEntity(entity)
        SetEntityAsMissionEntity(entity, true, true)
        SetEntityAsNoLongerNeeded(entity)
        SetEntityAlpha(entity, 0, false)
    end
    
    entityType = ""
    if (GetEntityType(entity) == 1) then entityType = "CPed" elseif (GetEntityType(entity) == 3) then entityType = "CObject" elseif (GetEntityType(entity) == 2) then entityType = "CVehicle" end

    for k,v in pairs(GetGamePool(entityType)) do
        if IsEntityAttachedToEntity(v, PlayerPedId()) then
            DetachEntity(v, true, true)
        end
    end
end)