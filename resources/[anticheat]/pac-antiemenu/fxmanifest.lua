fx_version 'adamant'

author 'PAC STORE'
description 'This product mainly blocks eulen cheats..'

lua54 'yes'
game 'gta5'

shared_scripts { 'config.lua' }
client_scripts { 'client/main.lua' }
server_scripts { 'server/main.lua' }

ui_page { 'html/index.html' }
files { 'html/index.html', 'html/script.js' }

escrow_ignore { 'config.lua', 'server/main.lua', 'client/main.lua' }
dependency '/assetpacks'