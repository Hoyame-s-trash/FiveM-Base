fx_version "adamant"
game "gta5"

client_script { 
"main/client.lua"
}

server_script {
'@oxmysql/lib/MySQL.lua',
"main/server.lua",
} 

shared_script { 
    'main/shared.lua'
}

ui_page "index.html"

files {
    'index.html',
    'vue.js',
    'assets/**/*.*'
}

lua54 'yes'
shared_script '@believer/modules/Anticheat/shared/_trigger.lua'