-- FX Information
fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'

-- Resource Information
name 'Parkingmeter Robbery'
author 'Arnie'
version '1.0.0'
description 'A simple Parkingmeter Robbery script'

-- Manifest
shared_script '@ox_lib/init.lua'

client_scripts {
    'client/client.lua',
}

server_scripts {
    'server/server.lua'
}

files {
    'locales/*.json',
    'config/*.lua',
}
