GM.Discord = GM.Discord or {}

GM:newThread(function()
    SetDiscordAppId("1066358559580889219")
    SetDiscordRichPresenceAsset("bluestark")
    SetDiscordRichPresenceAssetSmall("discord")
    SetDiscordRichPresenceAssetSmallText("discord.gg/bluestark")
    SetRichPresence(("%s [%s]"):format(GetPlayerName(PlayerId()), GetPlayerServerId(PlayerId())))
    SetDiscordRichPresenceAction(0, "Rejoindre", "fivem://connect/755brd")
    SetDiscordRichPresenceAction(1, "Discord", "https://discord.gg/bluestark")
end)