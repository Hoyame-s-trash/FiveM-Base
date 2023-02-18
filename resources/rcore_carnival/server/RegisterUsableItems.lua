OnObjectLoaded(function()
    for k, v in pairs(UsableItems) do
        Debug("Registering item: " .. k)
        SharedObject.RegisterUsableItem(k, function(source)
            TriggerClientEvent("rcore_carnival:givePlayerGiftToHand", source, k)
        end)
    end
end)