GM:newThread(function()
    while (GM.Command == nil) do
        Wait(50)
    end

    GM.Command:register({
        name = "creator",
        label = "Ouvrir le menu du créateur",
        description = "Permet d'ouvrir le menu du créateur",
    }, function(playerSrc)
        TriggerClientEvent("Believer:creator:openMenu", playerSrc)
    end)
end)