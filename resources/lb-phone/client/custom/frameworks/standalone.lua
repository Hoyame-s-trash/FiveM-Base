CreateThread(function()
    if Config.Framework ~= "standalone" then
        return
    end

    while not NetworkIsSessionStarted() do
        Wait(500)
    end

    loaded = true

    function HasPhoneItem(number)
        if not Config.Item.Require then
            return true
        end

        if Config.Item.Unique then
            return HasPhoneNumber(number)
        end

        if GetResourceState("ox_inventory") == "started" and Config.Item.Inventory == "ox_inventory" then
            return (exports.ox_inventory:Search("count", Config.Item.Name) or 0) > 0
        end

        return true
    end

    function HasJob(jobs)
        return false
    end

    function CreateFrameworkVehicle()
        return false
    end
end)