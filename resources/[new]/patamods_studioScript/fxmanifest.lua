fx_version 'cerulean'

game 'gta5'
lua54 'yes'
author 'Sarish#0609'
description 'Studio Script made by Sarish (Patamods) for Patoche'

--Client Scripts-- 
client_scripts {
	'NativeUI.lua',
    'client.lua'
}

--Server Scripts-- 
server_scripts {
    'server.lua'
}

shared_scripts {
    'shared.lua'
}

escrow_ignore {
    'shared.lua',
    'client.lua',
    'NativeUI.lua',
    'server.lua'
}
dependency '/assetpacks'