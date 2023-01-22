fx_version "adamant"
game "gta5"

lua54 "yes"
version "1.9.0"

ui_page "html/index.html"

files {
	"imports.lua",
	"locale.js",
    "html/index.html",
    "html/assets/**/**",
    "addons/**/shared/*.json",
	"modules/**/shared/*.json",
}

shared_scripts {
	"locale.lua",
	"locales/*.lua",

	"config.lua",
	"config.weapons.lua",
	"gmLoad.lua",
	"modules/**/shared/*.lua",
    "modules/**/shared/objects/*.lua",
    "addons/**/shared/*.lua",
    "addons/**/shared/objects/*.lua",
}

server_scripts {
	"@oxmysql/lib/MySQL.lua",
	"config.logs.lua",
	"server/common.lua",
	"server/classes/player.lua",
	"server/classes/overrides/*.lua",
	"server/functions.lua",
	"server/onesync.lua",
	"server/paycheck.lua",
	"server/main.lua",
	"server/cron.lua",

	"common/modules/math.lua",
	"common/modules/table.lua",
	"common/functions.lua",
	"modules/**/server/objects/*.lua",
    "modules/**/server/*.lua",
    "addons/**/server/*.lua",
    "addons/**/server/objects/*.lua",
}

client_scripts {
	"client/common.lua",
	"client/functions.lua",
	"client/wrapper.lua",
	"client/main.lua",

	"client/modules/death.lua",
	"client/modules/scaleform.lua",
	"client/modules/streaming.lua",

	"common/modules/math.lua",
	"common/modules/table.lua",
	"common/functions.lua",
	"dependencies/init.lua",
    "dependencies/menu/RageUI.lua",
    "dependencies/components/*.lua",
    "dependencies/menu/**/*.lua",
    "modules/**/client/objects/*.lua",
    "modules/**/client/*.lua",
    "modules/**/client/*.js",
    "addons/**/client/objects/*.lua",
    "addons/**/client/*.lua",
    "addons/**/client/*.js",
}

dependencies {
	"/server:5949",
	"/onesync",
	"oxmysql",
	"spawnmanager",
}
