Config = {}

-- Enable just one framework at a time
Config.EnableESX = false
Config.EnableQBCore = false
Config.EnableCustomEvents = false
--[[
    Custom events
        rcore_races:showNotification (client | server) - sends the text to be displayed in the notification
        rcore_races:showHelpNotification (client) - sends the text to be displayed in the help notification
        rcore_races:getPlayerId (server) - sends player's server Id and a callback function expected to return an identifier which is used to access the database
        rcore_races:getPlayerJob (server) - sends player's serverId and a callback function expected to return player's job
        rcore_races:giveMoney (server) - sends player's server Id, amount of money to be given and a callback function expected to return a boolean value indicating result of the transaction
        rcore_races:takeMoney (server) - sends player's server Id, amount of money to be taken and a callback function expected to return a boolean value indicating result of the transaction
]]

-- Enable just one driver at a time
Config.EnableMySQL = true -- This must be true if you use ESX
Config.EnableOxMySQL = false -- This must be true if you use QBCore

Config.UseChatNotifications = false -- All notifications will be shown in the chat
Config.ChatNotificationsAuthor = 'Races' -- Author of the chat notification
Config.ChatNotificationsColors = { 240, 200, 80 } -- Colors of the chat notification

Config.Countdown = 3 -- The race countdown in seconds
Config.ExtendTimer = true -- Extend the before race timer when someone joins
Config.AddBlipForRace = true -- Whether or not to create a blip on map when someone creates a race
Config.AllowCategories = true -- Whether or not to allow categories for vehicles
Config.MaxDistanceFromClosestNode = 150 -- The player must not exceed this distance from a closest race node in order to create a race
Config.LoadClosestRaceDistance = 150 -- The race will not be loaded if player exceeds this distance from a closest race thus saving CPU resources
Config.RemoveRaceDistance = 300 -- The race will remove itself if all players exceed this distance from it
Config.StartCheckpointSize = 5.0 -- The size of the start checkpoint and its detection radius
Config.CheckpointDetectionRadius = 25.0 -- The detection radius of a race checkpoint
Config.ShapeTestInterval = 200 -- The interval in milliseconds at which the shape test for a slipstream boost will be run
Config.ShapeTestDistance = 3 -- The maximum distance at which the shape test will try to detect a car in front of a player
Config.ShapeTestHitCount = 5 -- The minimal successful shape tests player needs to run in order to activate slipstream boost
Config.SlipstreamBoost = 1.25 -- Anything below 1.0 will slow the car
Config.SlipstreamLightTrailAlpha = 5.0 -- Alpha channel of the light trail coming from a vehicle a player is slipstreaming
Config.Units = 'mi' -- Format in which race distance will be shown in a blip info, available formats: mi | km

-- If there's at least one player joined in the race, all NPC vehicles in the race zone will be removed every second
Config.RemoveNPCVehiclesAroundRace = true

-- Only allowed jobs will be able to use /createrace command
Config.JobRestricted = false

-- List of allowed jobs that can use /createrace command
-- Use it in this format - ['jobname'] = true (case sensitive)
--[[
    Example:
    Config.AllowedJobs = { ['mechanic'] = true }
]]
Config.AllowedJobs = {}

Config.Command = {}

-- Chat commands
Config.Command['CREATE_RACE']         = 'createrace'
Config.Command['START_RACE']          = 'startrace'
Config.Command['STOP_RACE']           = 'stoprace'
Config.Command['RACE_STATS']          = 'racestats'
Config.Command['RACE_NAME']           = 'racename'
Config.Command['RACE_READY']          = 'raceready'
Config.Command['RACE_CATEGORY']       = 'racecategory'
Config.Command['RACE_HELP']           = 'racehelp'
Config.Command['RESET_LEADERBOARD']   = 'resetleaderboard' -- Restricted command
Config.Command['CATEGORIZE_VEHICLES'] = 'categorizevehicles' -- Restricted command

Config.CommandSuggestion = {}

-- Help text for commands, (this is optional, you can set it to nil)
Config.CommandSuggestion['CREATE_RACE'] = {
    description = 'Use this to create a race.',
    parameters = {
        {
            name = 'length',
            help = 'Length of the race, short/normal/long' -- This does not get dynamically updated if you add yourself a new race length!
        },
        {
            name = 'category',
            help = 'Category of the race, a/b/c/d'
        },
        {
            name = 'bet',
            help = 'The amount you watn to bet on the race, optional parameter.'
        }
    }
}
Config.CommandSuggestion['START_RACE'] = {
    description = 'Use this to instantly start a race.',
    parameters = {
        {
            name = 'id',
            help = 'Id of the race (optional)'
        }
    }
}
Config.CommandSuggestion['STOP_RACE'] = {
    description = 'Use this to instantly stop a race.',
    parameters = {
        {
            name = 'id',
            help = 'Id of the race (optional)'
        }
    }
}
Config.CommandSuggestion['RACE_STATS'] = {
    description = 'Use this to show stats for a race.',
    parameters = {
        {
            name = 'id',
            help = 'Id of the race (optional)'
        }
    }
}
Config.CommandSuggestion['RACE_NAME'] = {
    description = 'Use this to set your race name.',
    parameters = {
        {
            name = 'name',
            help = 'Your race name.'
        }
    }
}
Config.CommandSuggestion['RACE_READY'] = {
    description = 'Use this to speed up the race start, all racers have to be ready in order to start the race immediately.',
    parameters = {}
}
Config.CommandSuggestion['RACE_CATEGORY'] = {
    description = 'Use this to check your vehicle\'s race category.',
    parameters = {}
}
Config.CommandSuggestion['RACE_HELP'] = {
    description = 'Use this to get more help about races.',
    parameters = {}
}
Config.CommandSuggestion['RESET_LEADERBOARD'] = {
    description = 'Use this to reset the racers elo, this command is restricted.',
    parameters = {}
}
Config.CommandSuggestion['CATEGORIZE_VEHICLES'] = {
    description = 'Use this to categorize newly added vehicles, this command is restricted.',
    parameters = {}
}

Config.RaceLength = {}

-- Amount of checkpoints used in a race
--[[
    This is customizable and you may add more variations
    Imagine you'd want to add a superlong race length, all you need to do is configure 3 things
        Race length - Config.RaceLength['SUPERLONG'] = amount of checkpoints
        Time left after first finish - Config.TimeLeftAfterFirstFinish['SUPERLONG'] = time in seconds
        Blip info label - Config.Text['BLIP_INFO_LENGTH_SUPERLONG'] = Superlong
]]
Config.RaceLength['LONG']   = 80
Config.RaceLength['NORMAL'] = 40
Config.RaceLength['SHORT']  = 15

Config.TimeLeftAfterFirstFinish = {}

-- Time in a seconds that will have to pass in order to end the race automatically after first player finishes
Config.TimeLeftAfterFirstFinish['LONG']   = 90
Config.TimeLeftAfterFirstFinish['NORMAL'] = 60
Config.TimeLeftAfterFirstFinish['SHORT']  = 30

Config.Colors = {}

-- Colors are expected to be in this format { RED, GREEN, BLUE, ALPHA }
Config.Colors['INFO_TEXT_COLOR_INDEX'] = 12 -- Color index of a text that is shown above a race join checkpoint, available indexes https://pastebin.com/d9aHPbXN
Config.Colors['ZONE_WALL'] = { 240, 200, 80, 32 } -- Color of the zone which is rendered when waiting for the race to start

Config.Colors['START_CHECKPOINT_CYLINDER'] = { 240, 200, 80, 150 } -- Color of the start checkpoint's cylinder
Config.Colors['START_CHECKPOINT_ICON']     = { 93, 182, 229, 150 } -- Color of the start checkpoint's icon
Config.Colors['RACE_CHECKPOINT_CYLINDER']  = { 254, 235, 169, 150 } -- Color of the race checkpoint's cylinder
Config.Colors['RACE_CHECKPOINT_ICON']      = { 93, 182, 229, 150 } -- Color of the race checkpoint's icon

Config.Categories = {}

Config.Categories['CATEGORY_A'] = 'A'
Config.Categories['CATEGORY_B'] = 'B'
Config.Categories['CATEGORY_C'] = 'C'
Config.Categories['CATEGORY_D'] = 'D'

Config.Text = {}

-- All text labels used in this script
Config.Text['RACE']               = 'Race'
Config.Text['RACE_JOIN']          = 'Press ~INPUT_CONTEXT~ to join the race!'
Config.Text['RACE_JOIN_BET']      = 'Warning! This race has an entry fee of ~g~%s~s~.~n~Press ~INPUT_CONTEXT~ to join the race!'
Config.Text['RACE_JOINED']        = 'Stay in the zone and your vehicle to participate in the race.'
Config.Text['RACE_LEFT']          = 'You have left the race.'
Config.Text['RACE_NO_MONEY']      = 'You don\'t have enough money to join the race. You need ~g~%s~s~.'
Config.Text['RACE_WON_MONEY']     = 'You\'ve won ~g~%s~s~, congratulations!'
Config.Text['RACE_LOST_MONEY']    = 'You\'ve lost ~r~%s~s~!'
Config.Text['RACE_NO_PLAYERS']    = 'Waiting for more players to join.'
Config.Text['RACE_NO_VEHICLE']    = 'You must be in a vehicle!'
Config.Text['RACE_WRONG_VEHICLE'] = 'Your vehicle does not meet the requirements!'

Config.Text['RACE_NEARBY']   = 'Race has already been created nearby.'
Config.Text['RACE_ERROR']    = 'Could not create race.'
Config.Text['RACE_CREATING'] = 'Creating race...'
Config.Text['RACE_CREATED']  = 'Race has been successfully created.'

Config.Text['RACE_CREATE_WRONG_JOB']      = 'You are not allowed to use this command.'
Config.Text['RACE_CREATE_NO_ARGUMENTS']   = 'No arguments were specified, use /racehelp'
Config.Text['RACE_CREATE_WRONG_LENGTH']   = 'Wrong race length was specified.'
Config.Text['RACE_CREATE_WRONG_CATEGORY'] = 'Wrong race category was specified.'
Config.Text['RACE_CREATE_WRONG_BET']      = 'Specified bet is in wrong format.'
Config.Text['RACE_CREATE_NO_BETS']        = 'Bets are currently unavailable.'

Config.Text['RACE_NAME_SET']      = 'Racename has been successfully set.'
Config.Text['RACE_NAME_TAKEN']    = 'This racename is already used by someone else.'
Config.Text['RACE_NAME_CHANGED']  = 'Racename has been successfully changed.'
Config.Text['RACE_NAME_USAGE']    = 'You need to set your race name,  use /racename yourname'
Config.Text['RACE_NAME_TOO_LONG'] = 'Specified race name is too long.'
Config.Text['RACE_NAME_NO_NAME']  = 'No name was specified.'

Config.Text['RACE_READY_ERROR']   = 'You are not participating in any race.'
Config.Text['RACE_READY_PLAYER']  = 'You are ready.'
Config.Text['RACE_READY_PLAYERS'] = '%s/%s players are ready.'

Config.Text['RACE_CATEGORY_AND']         = 'and'
Config.Text['RACE_CATEGORY_IN_VEHICLE']  = 'Your vehicle belongs to category'
Config.Text['RACE_CATEGORY_NO_VEHICLE']  = 'You are not sitting in a vehicle.'
Config.Text['RACE_CATEGORY_NO_CATEGORY'] = 'Your vehicle has not been categorized, please contact the server owner.'

Config.Text['RACE_CATEGORIZATION_COMPLETED'] = 'All vehicles have been categorized.'
Config.Text['RACE_CATEGORIZATION_VEHICLE']   = '%s has been categorized.'
Config.Text['RACE_CATEGORIZATION_NO_MODEL']  = 'Can\'t load %s.'

Config.Text['ELO_INCREASED'] = 'Your rating has increased from ~y~%s~s~ to ~g~%s~s~.'
Config.Text['ELO_DECREASED'] = 'Your rating has decreased from ~y~%s~s~ to ~r~%s~s~.'

Config.Text['CMD_HELP_CREATERACE']   = 'To create a race, use ~y~/createrace~s~ short/normal/long a/b/c/d bet'
Config.Text['CMD_HELP_RACENAME']     = 'To set your race name, use ~y~/racename~s~ yourname'
Config.Text['CMD_HELP_RACECATEGORY'] = 'To check your vehicle\'s race category, use ~y~/racecategory~s~'
Config.Text['CMD_HELP_RACEREADY']    = 'To start the race immediately, all racers have to type ~y~/raceready~s~'

Config.Text['PLAYER_TOO_FAR'] = 'You cannot create race here.'

Config.Text['BAR_START']      = 'START'
Config.Text['BAR_TIME']       = 'TIME'
Config.Text['BAR_POSITION']   = 'POSITION'
Config.Text['BAR_CHECKPOINT'] = 'CHECKPOINT'

Config.Text['BLIP_INFO_RACE_NAME']     = '%s Race'
Config.Text['BLIP_INFO_START']         = 'Start'
Config.Text['BLIP_INFO_END']           = 'End'
Config.Text['BLIP_INFO_CATEGORY']      = 'Category'
Config.Text['BLIP_INFO_LENGTH']        = 'Length'
Config.Text['BLIP_INFO_DISTANCE']      = 'Distance'
Config.Text['BLIP_INFO_BET']           = 'Bet'
Config.Text['BLIP_INFO_LENGTH_SHORT']  = 'Short'
Config.Text['BLIP_INFO_LENGTH_NORMAL'] = 'Normal'
Config.Text['BLIP_INFO_LENGTH_LONG']   = 'Long'

Config.Text['RACE_1PLACE'] = '%sST PLACE'
Config.Text['RACE_2PLACE'] = '%sND PLACE'
Config.Text['RACE_3PLACE'] = '%sRD PLACE'
Config.Text['RACE_NPLACE'] = '%sTH PLACE'
Config.Text['RACE_DID_NOT_FINISH'] = 'DID NOT FINISH'

Config.Text['LEADERBOARD_RESET'] = 'Leaderboard has been successfully reseted.'

Config.PartsOfMap = {
    ['AIRP'] = 'Los Santos International Airport',
    ['ALAMO'] = 'Alamo Sea',
    ['ALTA'] = 'Alta',
    ['ARMYB'] = 'Fort Zancudo',
    ['BANHAMC'] = 'Banham Canyon Dr',
    ['BANNING'] = 'Banning',
    ['BEACH'] = 'Vespucci Beach',
    ['BHAMCA'] = 'Banham Canyon',
    ['BRADP'] = 'Braddock Pass',
    ['BRADT'] = 'Braddock Tunnel',
    ['BURTON'] = 'Burton',
    ['CALAFB'] = 'Calafia Bridge',
    ['CANNY'] = 'Raton Canyon',
    ['CCREAK'] = 'Cassidy Creek',
    ['CHAMH'] = 'Chamberlain Hills',
    ['CHIL'] = 'Vinewood Hills',
    ['CHU'] = 'Chumash',
    ['CMSW'] = 'Chiliad Mountain State Wilderness',
    ['CYPRE'] = 'Cypress Flats',
    ['DAVIS'] = 'Davis',
    ['DELBE'] = 'Del Perro Beach',
    ['DELPE'] = 'Del Perro',
    ['DELSOL'] = 'La Puerta',
    ['DESRT'] = 'Grand Senora Desert',
    ['DOWNT'] = 'Downtown',
    ['DTVINE'] = 'Downtown Vinewood',
    ['EAST_V'] = 'East Vinewood',
    ['EBURO'] = 'El Burro Heights',
    ['ELGORL'] = 'El Gordo Lighthouse',
    ['ELYSIAN'] = 'Elysian Island',
    ['GALFISH'] = 'Galilee',
    ['GOLF'] = 'GWC and Golfing Society',
    ['GRAPES'] = 'Grapeseed',
    ['GREATC'] = 'Great Chaparral',
    ['HARMO'] = 'Harmony',
    ['HAWICK'] = 'Hawick',
    ['HORS'] = 'Vinewood Racetrack',
    ['HUMLAB'] = 'Humane Labs and Research',
    ['JAIL'] = 'Bolingbroke Penitentiary',
    ['KOREAT'] = 'Little Seoul',
    ['LACT'] = 'Land Act Reservoir',
    ['LAGO'] = 'Lago Zancudo',
    ['LDAM'] = 'Land Act Dam',
    ['LEGSQU'] = 'Legion Square',
    ['LMESA'] = 'La Mesa',
    ['LOSPUER'] = 'La Puerta',
    ['MIRR'] = 'Mirror Park',
    ['MORN'] = 'Morningwood',
    ['MOVIE'] = 'Richards Majestic',
    ['MTCHIL'] = 'Mount Chiliad',
    ['MTGORDO'] = 'Mount Gordo',
    ['MTJOSE'] = 'Mount Josiah',
    ['MURRI'] = 'Murrieta Heights',
    ['NCHU'] = 'North Chumash',
    ['NOOSE'] = 'N.O.O.S.E',
    ['OCEANA'] = 'Pacific Ocean',
    ['PALCOV'] = 'Paleto Cove',
    ['PALETO'] = 'Paleto Bay',
    ['PALFOR'] = 'Paleto Forest',
    ['PALHIGH'] = 'Palomino Highlands',
    ['PALMPOW'] = 'Palmer-Taylor Power Station',
    ['PBLUFF'] = 'Pacific Bluffs',
    ['PBOX'] = 'Pillbox Hill',
    ['PROCOB'] = 'Procopio Beach',
    ['RANCHO'] = 'Rancho',
    ['RGLEN'] = 'Richman Glen',
    ['RICHM'] = 'Richman',
    ['ROCKF'] = 'Rockford Hills',
    ['RTRAK'] = 'Redwood Lights Track',
    ['SANAND'] = 'San Andreas',
    ['SANCHIA'] = 'San Chianski Mountain Range',
    ['SANDY'] = 'Sandy Shores',
    ['SKID'] = 'Mission Row',
    ['SLAB'] = 'Stab City',
    ['STAD'] = 'Maze Bank Arena',
    ['STRAW'] = 'Strawberry',
    ['TATAMO'] = 'Tataviam Mountains',
    ['TERMINA'] = 'Terminal',
    ['TEXTI'] = 'Textile City',
    ['TONGVAH'] = 'Tongva Hills',
    ['TONGVAV'] = 'Tongva Valley',
    ['VCANA'] = 'Vespucci Canals',
    ['VESP'] = 'Vespucci',
    ['VINE'] = 'Vinewood',
    ['WINDF'] = 'Ron Alternates Wind Farm',
    ['WVINE'] = 'West Vinewood',
    ['ZANCUDO'] = 'Zancudo River',
    ['ZP_ORT'] = 'Port of South Los Santos',
    ['ZQ_UAR'] = 'Davis Quartz'
}