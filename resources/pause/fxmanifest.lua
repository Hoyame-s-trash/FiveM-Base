game 'gta5'

fx_version 'cerulean'

lua54 'yes'

ui_page 'dist/ui.html'

files {
	'dist/css/fonts/*.ttf',
	'dist/ui.html',
	'dist/css/*.css',
	'dist/listener.js',
	'dist/progressbar.js',
	'dist/images/*.png',
	'dist/images/*.gif',
}

shared_scripts {
	"shared/*.lua"
}

client_scripts {
	"client/*.lua",
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	"server/*.lua",
}