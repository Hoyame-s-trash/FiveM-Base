Callback = {}
Callback.Functions = {}
Callback.ServerCallbacks = {}

Callback.Functions.CreateCallback = function(name, cb)
    Callback.ServerCallbacks[name] = cb
end

Callback.Functions.TriggerCallback = function(name, source, cb, ...)
    local src = source
    if Callback.ServerCallbacks[name] then
        Callback.ServerCallbacks[name](src, cb, ...)
    end
end


RegisterNetEvent('ls-inventoryhud:Server:TriggerCallback', function(name, ...)
    local src = source
    Callback.Functions.TriggerCallback(name, src, function(...)
        TriggerClientEvent('ls-inventoryhud:Client:TriggerCallback', src, name, ...)
    end, ...)
end)