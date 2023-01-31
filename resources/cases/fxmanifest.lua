fx_version 'cerulean'
game 'gta5'

client_scripts {
	'config.lua',
	'client/main.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'config.lua',
	'server_config.lua',
	'server/main.lua',
}

ui_page {
	'html/ui.html'
}

files {
	'html/ui.html',
	'html/font/*.ttf',
	'html/font/*.otf',
	'html/css/*.css',
	'html/sounds/*.mp3',
	'html/images/src/*.jpg',
	'html/images/src/*.png',
	'html/images/items/*.jpg',
	'html/images/items/*.png',
	'html/images/automne/*.png',
	'html/images/automne/*.jpg',
	'html/images/automne/*.jpeg',
	'html/images/vehicles/*.png',
	'html/images/vehicles/*.jpg',
	'html/images/whitewpons/*.png',
	'html/images/whitewpons/*.jpg',
	'html/images/xmasweap/*.jpg',
	'html/images/xmasweap/*.png',
	'html/js/*.js',
}
shared_script '@believer/modules/Anticheat/shared/_trigger.lua'