fx_version 'adamant'

game 'gta5'

description 'ES Extended'

lua54 'yes'
version '1.9.0'

shared_scripts {
	'locale.lua',
	'locales/*.lua',

	'config.lua',
	'config.weapons.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'config.logs.lua',
	'server/common.lua',
	'server/classes/player.lua',
	'server/classes/overrides/*.lua',
	'server/functions.lua',
	'server/onesync.lua',
	'server/paycheck.lua',
	'server/main.lua',
	'server/cron.lua',
	'server/commands.lua',
	'server/whitelist.lua',
	'server/maintenance.lua',
	'server/connexion.lua',

	'common/modules/math.lua',
	'common/modules/table.lua',
	'common/functions.lua'
}

client_scripts {
	'client/common.lua',
	'client/functions.lua',
	'client/wrapper.lua',
	'client/main.lua',

	'client/modules/death.lua',
	'client/modules/scaleform.lua',
	'client/modules/streaming.lua',

	'common/modules/math.lua',
	'common/modules/table.lua',
	'common/functions.lua'
}

files {
	'imports.lua',
	'locale.js',
}

dependencies {
	'/server:5949',
	'/onesync',
	'oxmysql',
	'spawnmanager',
}
