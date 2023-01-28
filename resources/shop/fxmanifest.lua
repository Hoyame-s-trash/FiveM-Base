fx_version 'cerulean'
game 'gta5'

client_scripts {
	'config.lua',
	'client/main.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server_config.lua',
	'config.lua',
	'server/main.lua'
}

ui_page {
	'html/ui.html'
}

escrow_ignore {
	'config.lua',
	'server_config.lua',
	'client/main.lua',
	'server/main.lua',
}  


files {
	'html/ui.html',
	'html/font/*.ttf',
	'html/font/*.otf',
	'html/css/*.css',
	'html/images/*.jpg',
	'html/images/*.png',
	'html/js/*.js',
}


lua54 'on'