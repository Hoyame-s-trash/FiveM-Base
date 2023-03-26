fx_version 'cerulean'
game 'gta5'

ui_page 'html/ui.html'
files {
	'html/ui.html',
	'html/*.js',
	'html/style.css',
}

shared_scripts {
	"config.lua",
}

client_scripts {
	'client/*.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}

data_file "DLC_ITYP_REQUEST" "badge1.ytyp"
data_file "DLC_ITYP_REQUEST" "copbadge.ytyp"
data_file "DLC_ITYP_REQUEST" "prideprops_ytyp"
data_file "DLC_ITYP_REQUEST" "lilflags_ytyp"
data_file 'DLC_ITYP_REQUEST' 'bzzz_foodpack'
data_file 'DLC_ITYP_REQUEST' 'natty_props_lollipops.ytyp'
data_file 'DLC_ITYP_REQUEST' 'bebekbus.ytyp'