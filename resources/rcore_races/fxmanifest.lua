fx_version 'cerulean'
game 'gta5'

lua54 'yes'

escrow_ignore {
    'config.lua',
    'config_vehicles.lua',
    'nodes.lua',
    
    'client/framework/*',
    'client/leaderboard.lua',

    'server/db/*',
    'server/framework/*',
}

shared_scripts {
    'config.lua',
    'vehicles.lua',
    'nodes.lua'
}

client_scripts {
    'config_vehicles.lua',
    'client/utils.lua',
    'client/framework/esx.lua',
    'client/framework/qbcore.lua',
    'client/framework/custom.lua',
    'client/framework/no_framework.lua',
    'client/race.lua',
    'client/main.lua',
    'client/scaleform.lua',
    'client/categorization.lua',
    'client/leaderboard.lua',
    'client/light_trail.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config_vehicles.lua',
    'server/utils.lua',
    'server/framework/esx.lua',
    'server/framework/qbcore.lua',
    'server/framework/custom.lua',
    'server/framework/no_framework.lua',
    'server/db/mysql-async.lua',
    'server/db/oxmysql.lua',
    'server/race.lua',
    'server/main.lua',
    'server/categorization.lua',
    'server/leaderboard.lua',
    'server/elo.lua'
}

files {
    'html/index.html',
    'html/script.js',
    'html/style.css',
    'vehicles.json'
}

ui_page 'html/index.html'

dependencies {
    '/server:4752',
    '/onesync',
}
dependency '/assetpacks'