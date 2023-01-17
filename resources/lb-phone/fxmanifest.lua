fx_version "cerulean"
game "gta5"
lua54 "yes"

version "1.2.1"

shared_script {
    "config/*.lua",
    "shared/**/*.lua"
}

client_script "client/**/*.lua"

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "server/**/*.lua",
    "config/server.lua"
}

files {
    "ui/**/*",
    'ui/components.js',
    "config/**/*"
}

ui_page "ui/index.html"

dependencies {
    "loaf_lib",
    "mysql-async"
}

escrow_ignore {
    "config/**/*",

    "client/apps/framework/*.lua",
    "server/apps/framework/*.lua",
    "shared/*.lua",

    "client/custom/**/*.lua",
    "server/custom/**/*.lua",

    "server/apiKeys.lua",
}

dependency '/assetpacks'