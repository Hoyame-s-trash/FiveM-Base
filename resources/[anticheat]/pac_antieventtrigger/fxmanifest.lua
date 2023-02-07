fx_version 'adamant'

author 'PAC STORE'
description 'This product mainly blocks triggering events from lua executors..'

lua54 'yes'
game 'gta5'

server_scripts {'config.lua', 'server.lua'}
exports {
    'getConfig'
}
files {'install.lua'}
escrow_ignore { 'install.lua', 'server.lua', 'config.lua' }
dependency '/assetpacks'