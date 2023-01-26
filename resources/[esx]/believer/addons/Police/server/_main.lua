GM.Police = GM.Police or {}

GM.Police["zones"] = {
    ["cloakroom"] = {
        name = "cloakroom",
        position = vector3(451.5, -980.5, 30.6),
        radius = 3.0,
        helpText = "Appuyez sur ~INPUT_CONTEXT~ pour accéder au vestiaire",
        onUsable = function(playerSrc)
            print(playerSrc)
        end
    }
}

GM:newThread(function()
    while (GM.Enterprise == nil) do
        Wait(150)
    end

    print("Loading police zones...")

    local enterpriseSelected = GM.Enterprise:getFromName("police")
    if (not enterpriseSelected) then return end

    print("Loading police zones...")

    for zoneName, zone in pairs(GM.Police["zones"]) do
        enterpriseSelected:addZone(zoneName, zone)
    end

    print("Police zones loaded !")
    print(enterpriseSelected:getZone("cloakroom"))

end)