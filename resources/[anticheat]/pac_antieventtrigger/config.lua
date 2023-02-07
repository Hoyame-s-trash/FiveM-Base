Config = {}

-- NOTE: You should ensure this script on TOP of your scripts!!!!!!! (otherwise it will not gonna work)
-- NOTE: You need to make your machine time the same as the real time, second by second. otherwise you may be banned incorrectly

-- [[----------------------Settings---------------------------]]
Config.WhitelistedEvents = {
    "time",
    "esx:triggerServerCallback",
    "esx:updateCoords",
    "getInformation",
    "__cfx_internal:commandFallback",
    "esx:onPlayerDeath",
    "pma-voice:setTalkingOnRadio"
}
Config.ToleranceRate = 3

-- [[----------------------Log System---------------------------]]
Config.SendWebhook = false
Config.WebhookURL = ""

-- [[----------------------Punishment---------------------------]]
Config.Ban = false -- If this setting is true, you can use your own ban system.
Config.BanFunction = function(source)
    -- You can trigger your ban event.
end

exports("getConfig", function()
    return Config
end)