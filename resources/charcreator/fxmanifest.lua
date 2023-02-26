fx_version 'adamant'

game 'gta5'

lua54 'yes'

escrow_ignore {
  'backend/**/config.lua'
}

shared_scripts {
  '@believer/imports.lua',
  'backend/**/config.lua'
}

client_scripts {
  'backend/npc/client/main.lua',
  'backend/**/client/config.lua',
  'backend/**/client/*.lua'
}



server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'backend/**/server/config.lua',
  'backend/**/server/*.lua'
}

ui_page 'frontend/index.html'

files {
	'frontend/**/*.*',
  'frontend/**/**/*.*',
  'frontend/**/**/**/*.*',
}
