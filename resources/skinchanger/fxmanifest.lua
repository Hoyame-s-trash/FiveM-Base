fx_version 'adamant'

game 'gta5'

lua54 'yes'

description 'Official ESX-Legacy resource for handling the Player`s Skin'

version '1.9.0'

client_scripts {
	'@believer/locale.lua',
	'locales/*.lua',
	'config.lua',
	'client/main.lua'
}

shared_script '@believer/modules/Anticheat/shared/_trigger.lua'