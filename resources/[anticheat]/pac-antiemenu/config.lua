Config = {}

-- [[----------------------Settings---------------------------]]
Config.BlockExecutor = true
Config.BlockSpawnEntity = true

-- [[----------------------Log System---------------------------]]
Config.SendWebhook = false
Config.WebhookURL = ""

-- [[----------------------Punishment---------------------------]]
Config.Ban = false -- If this setting is true, you can use your own ban system.
Config.DropMessage = "E cheats detected!" -- If you set ban setting to false you can select your own drop message.
Config.BanFunction = function(source)
    -- You can trigger your ban event.
end