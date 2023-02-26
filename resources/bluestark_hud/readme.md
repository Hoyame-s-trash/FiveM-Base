#
# Voice level detection for pma-voice
# add -> exports['sanity_hud']:CurrentVoiceMode(VoiceLevel) to pma-voice/client/main on line 193
#

# Events

# Announce if you want to send an Announce
    TriggerEvent('hud:notification', 'announce','announce', 'Test', 12500)

# Notifications | meaning (success, info, error), Label just put text there, Message, Duration
    TriggerEvent('hud:notification','info', 'info', 'Test', 4500)
    TriggerEvent('hud:notification', 'success', 'success', 'Test', 5500)
    TriggerEvent('hud:notification', 'error','ERROR', 'Test', 6500)   

# Available Commands
> /Announce message | to send an announce
> /test to | test anything
> /id | to see your current id
> /ids | to see the id of your nearbyst player

# Discord
> if you have any other problems contact here
https://discord.gg/xc7g8wKu52