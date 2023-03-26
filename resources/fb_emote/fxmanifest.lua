fx_version 'cerulean'
games { 'gta5' }

client_scripts {
    "Rage/RMenu.lua",
    "Rage/menu/RageUI.lua",
    "Rage/menu/Menu.lua",
    "Rage/menu/MenuController.lua",
    "Rage/components/*.lua",
    "Rage/menu/elements/*.lua",
    "Rage/menu/items/*.lua",
    "Rage/menu/panels/*.lua",
    "Rage/menu/windows/*.lua",
    "client/*.lua"
}

server_scripts {
    "server/*.lua",
	'@oxmysql/lib/MySQL.lua',
}
