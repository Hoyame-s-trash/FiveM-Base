GM.Discord = GM.Discord or {}

GM:newThread(function()
    SetDiscordAppId("1066358559580889219")
    SetDiscordRichPresenceAsset("bluestark_big")
    SetDiscordRichPresenceAssetSmall("discord")
    SetDiscordRichPresenceAssetSmallText("discord.gg/bluestark")
    SetRichPresence(("%s [%s]"):format(GetPlayerName(PlayerId()), GetPlayerServerId(PlayerId())))
    SetDiscordRichPresenceAction(0, "🔔 Discord", "https://discord.gg/bluestark")
    SetDiscordRichPresenceAction(1, "🌸 Se Connecter", "fivem://connect/755brd")
end)