fx_version 'adamant'

game 'gta5'

version "1.0"

lua54 "yes"

dependencies {
    '/server:4752',
    'aquiver-lib'
}

-- ESCROW VERSION
-- escrow_ignore {
--     'config.lua',

--     -- Server
--     'server_exports.lua',

--     -- Client
--     'client_exports.lua',

--     -- Frameworks
--     'server/frameworks/*.lua',

--     -- Shared (Items, and Shops)
--     'shared/**.lua'
-- }

-- UNENCRYPTED VERSION
escrow_ignore {
    '**.lua'
}

server_scripts {
    -- LIB
    '@aquiver-lib/exports/server_exports.lua',
    -- SHARED

    'config.lua',
    'shared/shared.lua',
    'shared/items/register.lua',
    'shared/items/items.lua',
    'shared/items/weapons.lua',
    'shared/shops.lua',

    'server/server.lua',
    'server/events.lua',
    'server/inventories/*.lua',
    'server/classes/*.lua',
    'server/classes/subclasses/*.lua',
    'server/shops/sv_shops.lua',
    'server/shops/sv_shops_class.lua',

    'server_exports.lua',

    -- Frameworks
    'server/frameworks/*.lua',

    -- Disable this dev file.
    -- 'server/dev.lua',

    'server_main.lua',
}

client_scripts {
    -- LIB
    '@aquiver-lib/exports/client_exports.lua',

    -- SHARED
    'config.lua',
    'shared/shared.lua',
    'shared/items/register.lua',
    'shared/items/items.lua',
    'shared/items/weapons.lua',
    'shared/shops.lua',

    'client/client.lua',
    'client/events.lua',
    'client/vehicles/cl_vehicles.lua',
    'client/shops/cl_shops.lua',
    'client/faction/cl_factions.lua',
    'client/clothes/cl_clothes_variations.lua',
    'client/clothes/cl_clothes.lua',
    'client/clothes/cl_class_variation.lua',
    'client/clothes/cl_class_takeoff.lua',
    'client/pedscreen/client.lua',
    'client/settings/client.lua',
    'client/player/cl_player_slots.lua',
    'client/player/cl_player_inventory.lua',
    'client/player/cl_player_weapon.lua',

    -- Disable this dev file.
    -- 'client/dev.lua',

    'client_exports.lua',
    'client_main.lua',
}

ui_page 'html/index.html'

files {
    'html/**',

}

dependency '/assetpacks'