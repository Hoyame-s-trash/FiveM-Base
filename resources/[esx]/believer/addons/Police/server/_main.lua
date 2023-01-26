GM.Police = GM.Police or {}

GM.Police["zones"] = {
    ["cloakroom"] = {
        name = "cloakroom",
        label = "Vestiaire",
        position = vector3(451.5, -980.5, 30.6),
        radius = 3.0,
        helpText = "accéder au vestiaire",
        onUsable = function(playerSrc)
            print(playerSrc)
        end
    }
}

GM:newThread(function()
    while (GM.Enterprise.Loaded == false) do
        Wait(100)
    end

    local enterpriseSelected = GM.Enterprise:getFromName("police")
    if (not enterpriseSelected) then return end

    for zoneName, zone in pairs(GM.Police["zones"]) do
        enterpriseSelected:addZone(zoneName, zone)
    end
end)