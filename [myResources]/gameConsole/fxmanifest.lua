fx_version 'cerulean'
game 'gta5'
lua54 'yes'

client_scripts {
    'client/client.lua',
    'client/teleport.lua',
    'client/userName.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',

    'server/server.lua',
    'server/teleport.lua',
    'server/userName.lua'
}

ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/style.css',
    'nui/script.js',
    'nui/images/*',
}