fx_version 'cerulean'
game 'gta5'
lua54 'yes'

client_scripts {
    'client/client.lua',
    'client/teleport.lua',
}

server_scripts {
    'server/server.lua',
    'server/teleport.lua'
}

ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/style.css',
    'nui/script.js',
    'nui/images/*',
}