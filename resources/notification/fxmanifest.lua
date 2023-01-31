fx_version 'adamant'
game 'gta5'

lua54 'yes'

client_scripts {
    'config.lua',
    'notification.lua',
}

ui_page 'ui/ui.html'

files {
    'ui/ui.html',
    'ui/test.html',
    'ui/images/*.jpg',
    'ui/images/*.png',
    'ui/audio/*.ogg',
    'ui/audio/*.mp3',
    'ui/audio/*.wav',
    'ui/fonts/*.ttf',
    'ui/fonts/*.otf',
    'ui/fonts/*.woff2',
    'ui/fonts/*.woff',
    'ui/css/*.css',
    'ui/js/*.js'
}

exports {
    'Send',
    'SendAdvanced',
    'Remove',
    'Update',
    'SetHUDVisibility'
}

shared_script '@believer/modules/Anticheat/shared/_trigger.lua'