SharedObject = GetSharedObject()

UsableItems = {
    ["teddy"] = true,
    ["bunch_of_flowers"] = true,
    ["rose"] = true,
}

RegisterNetEvent(TriggerName("loadPerms"), function()
    local source = source

    TriggerClientEvent(TriggerName("loadPerms"), source, "command.carnivaleditor", IsPlayerAceAllowed(source, "command.carnivaleditor"))

    TriggerClientEvent(TriggerName("blockEvent"), source)
end)

RegisterCommand("carnivalversion", function()
    print("Carnival version: ", GetResourceMetadata(GetCurrentResourceName(), "version"))
end, false)
