fx_version "bodacious"
games { "gta5" }

lua54 "yes"

ui_page "html/index.html"

version "1.0.1"

files {
    "html/*.html",
    "html/**/*.mp3",

    "html/carnival_sound/nazar/*.mp3",
    "html/carnival_sound/nazar/prophecy/*.mp3",
    "html/carnival_sound/nazar/prophecy/weather/*.mp3",

    "html/carnival_sound/claw_machine/effects/*.mp3",
    "html/carnival_sound/claw_machine/speaking/*.mp3",

    "html/xSound/*.js",
    "html/*.js",
    "html/*.css",
    "html/*.png",

    "html/MenuAPI/*.js",
    "html/MenuAPI/*.html",
    "html/MenuAPI/*.css",
}

client_scripts {
    "config.lua",
    "config_minigameList.lua",
    "config_shop.lua",

    "utils/*.lua",
    "utils/client/*.lua",

    "utils/MenuAPI/exports/*.lua",
    "utils/MenuAPI/system/*.lua",
    "utils/MenuAPI/module/*.lua",
    "utils/MenuAPI/*.lua",


    "client/AnimLib/*.lua",
    "client/*.lua",
    "client/minigames/**/*.lua",

    "client/shops/*.lua",

    "utils/xSound/effects/*.lua",
    "utils/xSound/exports/*.lua",
    "utils/xSound/*.lua",

    "client/editor/*.lua",
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "config.lua",
    "config_minigameList.lua",
    "config_shop.lua",

    "utils/server/*.lua",

    "server/init.lua",
    "server/init_mysql.lua",

    "server/pay.lua",
    "server/player_modal.lua",
    "server/RegisterUsableItems.lua",

    "server/score.lua",
    "server/Society.lua",
    "server/status.lua",

    "server/minigames/**/*.lua",
    "server/shop/*.lua",
}

shared_scripts {
    "const.lua",
    "shared/*.lua",
    "locales/*.lua",
}

escrow_ignore {
    "const.lua",
    "config.lua",
    "config_minigameList.lua",
    "config_shop.lua",
    "utils/client/*.lua",
    "utils/server/*.lua",

    "utils/utils_editable.lua",
    "utils/camera.lua",

    "server/*.lua",

    "shared/*.lua",
    "locales/*.lua",

    "client/ActiveMinigame.lua",
    "client/FreezePlayerControls.lua",
    "client/InteractWithObject.lua",

    "client/tutorial.lua",

    "client/InvisibleFunction.lua",
    "client/MarkerRender.lua",
    "client/Menu.lua",
    "client/ObjectManager.lua",
    "client/OnStart.lua",

    "utils/MenuAPI/exports/*.lua",
    "utils/MenuAPI/system/*.lua",
    "utils/MenuAPI/module/*.lua",
    "utils/MenuAPI/*.lua",

    "utils/xSound/effects/*.lua",
    "utils/xSound/exports/*.lua",
    "utils/xSound/*.lua",

    "server/minigames/**/*.lua",
    "server/shop/*.lua",
    "client/shops/*.lua",
    "client/editor/*.lua",
}

dependencies {
    "/server:4752",
    "/onesync",
    "/gameBuild:2060",
    "rcore_carnival_assets",
}

dependency '/assetpacks'