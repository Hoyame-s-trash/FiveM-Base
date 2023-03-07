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