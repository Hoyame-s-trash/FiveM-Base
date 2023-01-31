fx_version 'adamant'

game 'gta5'

description 'ESX Skin'

version '1.9.0'
lua54 'yes'
shared_script '@believer/imports.lua'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'@believer/locale.lua',
	'locales/*.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@believer/locale.lua',
	'locales/*.lua',
	'config.lua',
	'client/main.lua'
}

dependencies {
	'believer',
	'skinchanger'
}

shared_script '@believer/modules/Anticheat/shared/_trigger.lua'