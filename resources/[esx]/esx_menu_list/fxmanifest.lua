fx_version 'adamant'

game 'gta5'

description 'ESX Menu List'
lua54 'yes'
version '1.9.0'

client_scripts {
	'@believer/imports.lua',
	'@believer/client/wrapper.lua',
	'client/main.lua'
}

ui_page 'html/ui.html'

files {
	'html/ui.html',

	'html/css/app.css',

	'html/js/mustache.min.js',
	'html/js/app.js',

	'html/fonts/pdown.ttf',
	'html/fonts/bankgothic.ttf'
}

dependency 'believer'
