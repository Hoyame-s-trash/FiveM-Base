-- Variable declaration --
Config                                  = {}
Config.Functions                        = {}

-- This variable declaration, uses your database
Config.DatabaseName = "mysql-async"

Config.Notify = function(message, type) 
    Config.ServerFramework.ShowHelpNotification(message)
end

Config.Version = "1.0.3" -- DO NOT CHANGE IT WILL BE UPDATED!

Config.Debug = false -- IF YOU WANT TO STABLE VERSION OF INVENTORY DO NOT MAKE TRUE!

Config.CheckInventoryEveryStart = false

Config.FivemAppeareance = true

-- Database function do not change, if your database doesnt in here you can add

Config.Database                         = function(plugin,type,query,var)
    local wait = promise.new()
    if type == 'fetchAll' and plugin == 'mysql-async' then
        MySQL.Async.fetchAll(query, var, function(result)
            wait:resolve(result)
        end)
    end
    if type == 'execute' and plugin == 'mysql-async' then
        MySQL.Async.execute(query, var, function(result)
            wait:resolve(result)
        end)
    end
    if type == 'execute' and plugin == 'ghmattisql' then
        exports['ghmattimysql']:execute(query, var, function(result)
            wait:resolve(result)
        end)
    end
    if type == 'fetchAll' and plugin == 'ghmattisql' then
        exports.ghmattimysql:execute(query, var, function(result)
            wait:resolve(result)
        end)
    end
    if type == 'execute' and plugin == 'oxmysql' then
        exports.oxmysql:query(query, var, function(result)
            wait:resolve(result)
        end)
    end
    if type == 'fetchAll' and plugin == 'oxmysql' then
        exports.oxmysql:query(query, var, function(result)
            wait:resolve(result)
        end)
    end
    return Citizen.Await(wait)
end

-- When click "TAB" or custom key will be make blur screen
-- to close you need to change true to false

Config.Blur                     = true

Config.HAHud                    = true -- Enables armor and health hud top on character


-- Weight settings
-- "Config.Weight.Divide", qb-core uses weights in grams if you use kilograms change 1000 to 1
-- "Config.Weight.MaxPlayerWeight", player max weight limit this "limit can be EXCEEDED" but walk speed will slow down
-- "Config.Weight.OverweightMultiplier", when if it exceeds the limit, multiplys with 2, calculation formula ( MaxWeight/(CurrentWeight*MultiplyNumber) )

Config.Weight                       = {}
Config.Weight.Divide                = 1
Config.Weight.MaxPlayerWeight       = 92
Config.Weight.OverweightMultiplier  = 2


-- Drop settings
-- "Config.RefreshDrops", refreshes all drops in typed seconds, used in client-side
-- "Config.RefreshServerDrops", refreshes and check all drops in typed seconds, used in server-side

Config.RefreshDrops         = 1 -- In seconds
Config.RefreshServerDrops   = 1 -- In seconds

BackEngineVehicles = {
    ["ninef"] = true,
    ["adder"] = true,
    ["vagner"] = true,
    ["t20"] = true,
    ["infernus"] = true,
    ["zentorno"] = true,
    ["reaper"] = true,
    ["comet2"] = true,
    ["comet3"] = true,
    ["jester"] = true,
    ["jester2"] = true,
    ["cheetah"] = true,
    ["cheetah2"] = true,
    ["prototipo"] = true,
    ["turismor"] = true,
    ["pfister811"] = true,
    ["ardent"] = true,
    ["nero"] = true,
    ["nero2"] = true,
    ["tempesta"] = true,
    ["vacca"] = true,
    ["bullet"] = true,
    ["osiris"] = true,
    ["entityxf"] = true,
    ["turismo2"] = true,
    ["fmj"] = true,
    ["re7b"] = true,
    ["tyrus"] = true,
    ["italigtb"] = true,
    ["penetrator"] = true,
    ["monroe"] = true,
    ["ninef2"] = true,
    ["stingergt"] = true,
    ["surfer"] = true,
    ["surfer2"] = true,
    ["gp1"] = true,
    ["autarch"] = true,
    ["tyrant"] = true
}

-- All clothing sizes, every clothes can have custom size


Variations = { Jackets = {Male = {}, Female = {}}, Hair = {Male = {}, Female = {}}, Bags = {Male = {}, Female = {}}, Visor = {Male = {}, Female = {}}, Gloves = { Male = { [16] = 4, [17] = 4, [18] = 4, [19] = 0, [20] = 1, [21] = 2, [22] = 4, [23] = 5, [24] = 6, [25] = 8, [26] = 11, [27] = 12, [28] = 14, [29] = 15, [30] = 0, [31] = 1, [32] = 2, [33] = 4, [34] = 5, [35] = 6, [36] = 8, [37] = 11, [38] = 12, [39] = 14, [40] = 15, [41] = 0, [42] = 1, [43] = 2, [44] = 4, [45] = 5, [46] = 6, [47] = 8, [48] = 11, [49] = 12, [50] = 14, [51] = 15, [52] = 0, [53] = 1, [54] = 2, [55] = 4, [56] = 5, [57] = 6, [58] = 8, [59] = 11, [60] = 12, [61] = 14, [62] = 15, [63] = 0, [64] = 1, [65] = 2, [66] = 4, [67] = 5, [68] = 6, [69] = 8, [70] = 11, [71] = 12, [72] = 14, [73] = 15, [74] = 0, [75] = 1, [76] = 2, [77] = 4, [78] = 5, [79] = 6, [80] = 8, [81] = 11, [82] = 12, [83] = 14, [84] = 15, [85] = 0, [86] = 1, [87] = 2, [88] = 4, [89] = 5, [90] = 6, [91] = 8, [92] = 11, [93] = 12, [94] = 14, [95] = 15, [96] = 4, [97] = 4, [98] = 4, [99] = 0, [100] = 1, [101] = 2, [102] = 4, [103] = 5, [104] = 6, [105] = 8, [106] = 11, [107] = 12, [108] = 14, [109] = 15, [110] = 4, [111] = 4, [115] = 112, [116] = 112, [117] = 112, [118] = 112, [119] = 112, [120] = 112, [121] = 112, [122] = 113, [123] = 113, [124] = 113, [125] = 113, [126] = 113, [127] = 113, [128] = 113, [129] = 114, [130] = 114, [131] = 114, [132] = 114, [133] = 114, [134] = 114, [135] = 114, [136] = 15, [137] = 15, [138] = 0, [139] = 1, [140] = 2, [141] = 4, [142] = 5, [143] = 6, [144] = 8, [145] = 11, [146] = 12, [147] = 14, [148] = 112, [149] = 113, [150] = 114, [151] = 0, [152] = 1, [153] = 2, [154] = 4, [155] = 5, [156] = 6, [157] = 8, [158] = 11, [159] = 12, [160] = 14, [161] = 112, [162] = 113, [163] = 114, [165] = 4, [166] = 4, [167] = 4, }, Female = { [16] = 11, [17] = 3, [18] = 3, [19] = 3, [20] = 0, [21] = 1, [22] = 2, [23] = 3, [24] = 4, [25] = 5, [26] = 6, [27] = 7, [28] = 9, [29] = 11, [30] = 12, [31] = 14, [32] = 15, [33] = 0, [34] = 1, [35] = 2, [36] = 3, [37] = 4, [38] = 5, [39] = 6, [40] = 7, [41] = 9, [42] = 11, [43] = 12, [44] = 14, [45] = 15, [46] = 0, [47] = 1, [48] = 2, [49] = 3, [50] = 4, [51] = 5, [52] = 6, [53] = 7, [54] = 9, [55] = 11, [56] = 12, [57] = 14, [58] = 15, [59] = 0, [60] = 1, [61] = 2, [62] = 3, [63] = 4, [64] = 5, [65] = 6, [66] = 7, [67] = 9, [68] = 11, [69] = 12, [70] = 14, [71] = 15, [72] = 0, [73] = 1, [74] = 4, [75] = 3, [76] = 4, [77] = 5, [78] = 6, [79] = 7, [80] = 9, [81] = 11, [82] = 12, [83] = 14, [84] = 15, [85] = 0, [86] = 1, [87] = 2, [88] = 3, [89] = 4, [90] = 5, [91] = 6, [92] = 7, [93] = 9, [94] = 11, [95] = 12, [96] = 14, [97] = 15, [98] = 0, [99] = 1, [100] = 2, [101] = 3, [102] = 4, [103] = 5, [104] = 6, [105] = 7, [106] = 9, [107] = 11, [108] = 12, [109] = 14, [110] = 15, [111] = 3, [112] = 3, [113] = 3, [114] = 0, [115] = 1, [116] = 2, [117] = 3, [118] = 4, [119] = 5, [120] = 6, [121] = 7, [122] = 9, [123] = 11, [124] = 12, [125] = 14, [126] = 15, [127] = 3, [128] = 3, [132] = 129, [133] = 129, [134] = 129, [135] = 129, [136] = 129, [137] = 129, [138] = 129, [139] = 130, [140] = 130, [141] = 130, [142] = 130, [143] = 130, [144] = 130, [145] = 130, [146] = 131, [147] = 131, [148] = 131, [149] = 131, [150] = 131, [151] = 131, [152] = 131, [154] = 153, [155] = 153, [156] = 153, [157] = 153, [158] = 153, [159] = 153, [160] = 153, [162] = 161, [163] = 161, [164] = 161, [165] = 161, [166] = 161, [167] = 161, [168] = 161, [169] = 15, [170] = 15, [171] = 0, [172] = 1, [173] = 2, [174] = 3, [175] = 4, [176] = 5, [177] = 6, [178] = 7, [179] = 9, [180] = 11, [181] = 12, [182] = 14, [183] = 129, [184] = 130, [185] = 131, [186] = 153, [187] = 0, [188] = 1, [189] = 2, [190] = 3, [191] = 4, [192] = 5, [193] = 6, [194] = 7, [195] = 9, [196] = 11, [197] = 12, [198] = 14, [199] = 129, [200] = 130, [201] = 131, [202] = 153, [203] = 161, [204] = 161, [206] = 3, [207] = 3, [208] = 3, } } }

Config.ClothingWear = {
    ["top"] = {
		Drawable = 11,
        DatabaseName = "torso_1",
        TypeItem = "components",
		Table = { Male = 15, Female = 74},
		Emote = {Dict = "clothingtie", Anim = "try_tie_negative_a", Move = 51, Dur = 1200}
	},
    ["shirts"] = {
		Drawable = 8,
        DatabaseName = "tshirt_1",
        TypeItem = "components",
		Table = { Male = 15, Female = 15},
		Emote = {Dict = "clothingtie", Anim = "try_tie_negative_a", Move = 51, Dur = 1200}
	},
    ["pants"] = {
        Drawable = 4,
        DatabaseName = "pants_1",
        TypeItem = "components",
		Table = {Male = 61, Female = 14},
		Emote = {Dict = "re@construction", Anim = "out_of_breath", Move = 51, Dur = 1300}
    },
    ["backpack"] = {
        Drawable = 5,
        DatabaseName = "bags_1",
        TypeItem = "components",
		Table = {Male = 0, Female = 0},
		Emote = {Dict = "clothingtie", Anim = "try_tie_negative_a", Move = 51, Dur = 1200}
    },
    ["shoes"] = {
		Drawable = 6,
        DatabaseName = "shoes_1",
        TypeItem = "components",
		Table = {Male = 34, Female = 35},
		Emote = {Dict = "random@domestic", Anim = "pickup_low", Move = 0, Dur = 1200}
	},
    ["mask"] = {
		Drawable = 1,
        DatabaseName = "mask_1",
        TypeItem = "components",
		Table = {Male = 0, Female = 0 },
		Emote = {Dict = "mp_masks@standard_car@ds@", Anim = "put_on_mask", Move = 51, Dur = 800}
	},
    ["rig"] = {
		Drawable = 9,
        DatabaseName = "bproof_1",
        TypeItem = "components",
		Table = {Male = 0, Female = 0 },
		Emote = {Dict = "mp_masks@standard_car@ds@", Anim = "put_on_mask", Move = 51, Dur = 800}
	},
    ["gloves"] = {
		Drawable = 3,
        DatabaseName = "arms_1",
		Table = Variations.Gloves,
        DrawableCheck = 11,
        TypeItem = "components",
		Emote = {Dict = "nmt_3_rcm-10", Anim = "cs_nigel_dual-10", Move = 51, Dur = 1200}
	},
    ["hat"] = {
		Prop = 0,
        DatabaseName = "helmet_1",
        TypeItem = "props",
		Emote = {Dict = "mp_masks@standard_car@ds@", Anim = "put_on_mask", Move = 51, Dur = 600},
	},
    ["ear"] = {
		Prop = 2,
        DatabaseName = "ears_1",
        TypeItem = "props",
		Emote = {Dict = "mp_cp_stolen_tut", Anim = "b_think", Move = 51, Dur = 900},
	},
    ["watch"] = {
		Prop = 6,
        DatabaseName = "watches_1",
        TypeItem = "props",
		Emote = {Dict = "nmt_3_rcm-10", Anim = "cs_nigel_dual-10", Move = 51, Dur = 1200},
	},
    ["glasses"] = {
		Prop = 1,
        DatabaseName = "glasses_1",
        TypeItem = "props",
		Emote = {Dict = "clothingspecs", Anim = "take_off", Move = 51, Dur = 1400},
	},
    ["bracelet"] = {
		Prop = 7,
        DatabaseName = "bracelets_1",
        TypeItem = "props",
		Emote = {Dict = "nmt_3_rcm-10", Anim = "cs_nigel_dual-10", Move = 51, Dur = 1200},
	},
}
