fx_version 'bodacious'
game 'gta5'

ui_page('html/ui.html')

files {
	'html/ui.html',
    'html/style.css',
    'html/font/credit.ttf',
    'html/font/SF-Pro-Text-Regular.otf',
    'html/font/Bariol_Regular.otf',
    'html/font/Vision-Black.otf',
    'html/font/Vision-Bold.otf',
    'html/font/Vision-Heavy.otf',
    'html/img/*.png',
}

shared_scripts {
	"config.lua",
}

client_scripts {
	"client/*.lua",
}

server_scripts {
	"@oxmysql/lib/MySQL.lua",
	"server/*.lua",
}