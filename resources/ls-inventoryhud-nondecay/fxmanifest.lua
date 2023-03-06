fx_version 'cerulean'
game 'gta5'

lua54 'yes'

description 'LquenS made new inventory system'
version '2.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
	'locales/en.lua',
    'Inventory.lua',
    'Inventory_weapon.lua',

    'Inventory_s.lua',
    'Inventory_c.lua',
    'Inventory_items.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'resources/server/callback.lua',
    'resources/server/main.lua',
    'resources/server/classes.lua',
    'resources/server/functions.lua',
    'resources/server/items-convert.lua',
    'resources/weapon_s.lua'
}

client_scripts {
    'resources/client/callback.lua',
    'resources/client/main.lua',
    'resources/client/functions.lua',
    'resources/client/NUI.lua',
    'resources/weapon_c.lua'
}

ui_page {
    'html/ui.html'
}

files {
    'html/ui.html',
    'html/config.js',
    'html/classes.js',
    'html/main.js',
    'html/main.css',
    'html/icons/*.png',
	'html/icons/*.jpg',
    'html/need_icons/*.png',
    'html/style.css',
    'html/clothing.css',
    'html/sounds/*.mp3',
    'html/sounds/*.wav',
}

escrow_ignore {
    'resources/client/callback.lua',
    'resources/client/functions.lua',
	'resources/client/NUI.lua',
    'resources/server/callback.lua',
    'resources/server/functions.lua',
	'resources/server/classes.lua',
	'resources/server/items-convert.lua',
    'resources/weapon_s.lua',
    'resources/weapon_c.lua',
    'Inventory.lua',
	'Inventory_s.lua',
	'Inventory_c.lua',
	'Inventory_items.lua',
    'Inventory_weapon.lua'
}