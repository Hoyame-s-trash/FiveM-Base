game 'gta5'

fx_version 'cerulean'

lua54 'yes'

ui_page 'html/ui.html'

files {
	'html/css/fonts/*.ttf',
	'html/ui.html',
	'html/css/*.css',
	'html/listener.js',
	'html/progressbar.js',
	'html/images/*.png',
	'html/images/*.gif',
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