Config.Functions.Server = {
    GetFramework                    = function ()
        coreData = exports['believer']:getSharedObject()
        return coreData
    end,


    GetPlayer                       = function ( source )
        local EasyFramework = Config.ServerFramework
		if EasyFramework == nil then
            print("^1Empty framework detected!\n^7It's causes from framework, inventory doesn't affect framework!")
            return nil
        else
            return EasyFramework.GetPlayerFromId(source)
        end
    end,

    GetName                         = function ( source )
        return Config.Functions.Server.GetPlayer( source ).identifier 
    end,

    GetIdentifier                   = function(source)
        if Config.Functions.Server.GetPlayer(source) == nil then
            print("^1Empty Identifier detected!\n^7It's causes from framework or it wasn\'t important stuff.\nIf inventory doesn\'t works resetup the inventory!")
            return nil
        else
            local identifier = Config.Functions.Server.GetPlayer( source ).identifier
            local new = identifier
            if string.match(identifier, ":") then
                new = identifier:gsub(":", "-")
            end
            return new
        end
    end,

    GetPlayerFromUniqueValue        = function(id)
        local EasyFramework = Config.ServerFramework
        return EasyFramework.GetPlayerFromIdentifier(id)
    end,
}
Config.VehiclesInventory = {}
Config.VehiclesInventory.Models = {
    ["ASEA"] = {
        ["glovebox"] = "hhm3eomwf3cygww8e6kcgpt6",
    }
}
Config.VehiclesInventory.Classes = {
    [0] = {
        ["trunk"] = "coks1u2elb452g0hsd25w6if",
    },
    [1] = {
        ["trunk"] = "a584yw9439bwluc1voo2x1rm"
    },
    [2] = {
        ["trunk"] = "zpop64fqra28l9tnle839emg"
    },
    [3] = {
        ["trunk"] = "0vh1lnz1a7ojflbvoul4yaz0"
    },
    [4] = {
        ["trunk"] = "ar9kya72yoirzu2cfwr8hz85"
    },
    [5] = {
        ["trunk"] = "yexq0qwrv2fsnjot0l0tzmom"
    },
    [6] = {
        ["trunk"] = "zqohzbplr45rooxm81e655vz"
    },
    [7] = {
        ["trunk"] = "r9vfk2316yp7uoz5z4d7k4pr"
    },
    [8] = {
        ["trunk"] = "dcapvociisv5u7drc611yyvq"
    },
    [9] = {
        ["trunk"] = "p70ufhnlm9ai0f42v7w85nj0"
    },
    [12] = {
        ["trunk"] = "p70ufhnlm9ai0f42v7w85nj0"
    },
    [13] = {
        ["trunk"] = "nfi5z2p26m6e4ewpuxkjh2la"
    },
    [14] = {
        ["trunk"] = "m3jpk09d64ij0r6px1g80pcy"
    },
    [15] = {
        ["trunk"] = "irn05edljdp6hvamcdgm6tgz"
    },
    [16] = {
        ["trunk"] = "e5z2xps7t2km3nhrz6lufaob"
    },
}

Config.ServerFramework = Config.Functions.Server.GetFramework()
