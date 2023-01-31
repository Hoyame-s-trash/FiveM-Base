GM:newThread(function()
    while (GM.Command == nil) do
        Wait(50)
    end

    GM.Command:register({
        name = "commands",
        label = "Ouvrir le menu des commandes",
        description = "Permet d'ouvrir le menu des commandes",
        permissions = false,
    }, function(playerSrc)
        TriggerClientEvent("Command:openMenu", playerSrc, GM.Command.List)
    end)

    GM.Command:register({
        name = "admin",
        label = "Ouvrir le menu d'administration",
        description = "Permet d'ouvrir le menu d'administration",
        keys = {"keyboard", "F10"},
    }, function(playerSrc)
        TriggerClientEvent("Admin:openMenu", playerSrc)
    end)

    
end)