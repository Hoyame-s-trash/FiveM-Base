GM.Inventory = GM.Inventory or {}
GM.Inventory.Functions = {}


GM.Inventory.Weight                       = {}
GM.Inventory.Weight.Divide                = 1
GM.Inventory.Weight.MaxPlayerWeight       = 92
GM.Inventory.Weight.OverweightMultiplier  = 2


GM.Inventory.RefreshDrops         = 1 -- In seconds
GM.Inventory.RefreshServerDrops   = 1 -- In seconds

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

Variations = {
    Jackets = {
        Male = {}, 
        Female = {}
    }, 
    Hair = {
        Male = {}, 
        Female = {}
    }, 
    Bags = {
        Male = {}, 
        Female = {}
    }, 
    Visor = {
        Male = {}, 
        Female = {}
    }, 
    Gloves = { 
        Male = { 
            [16] = 4, 
            [17] = 4, 
            [18] = 4, 
            [19] = 0, 
            [20] = 1, 
            [21] = 2, 
            [22] = 4, 
            [23] = 5, 
            [24] = 6, 
            [25] = 8, 
            [26] = 11, 
            [27] = 12, 
            [28] = 14, 
            [29] = 15, 
            [30] = 0, 
            [31] = 1, 
            [32] = 2, 
            [33] = 4, 
            [34] = 5, 
            [35] = 6, 
            [36] = 8, 
            [37] = 11, 
            [38] = 12, 
            [39] = 14, 
            [40] = 15, 
            [41] = 0, 
            [42] = 1, 
            [43] = 2, 
            [44] = 4, 
            [45] = 5, 
            [46] = 6, 
            [47] = 8, 
            [48] = 11, 
            [49] = 12, 
            [50] = 14, 
            [51] = 15, 
            [52] = 0, 
            [53] = 1, 
            [54] = 2, 
            [55] = 4, 
            [56] = 5, 
            [57] = 6, 
            [58] = 8, 
            [59] = 11, 
            [60] = 12, 
            [61] = 14, 
            [62] = 15, 
            [63] = 0, 
            [64] = 1, 
            [65] = 2, 
            [66] = 4, 
            [67] = 5, 
            [68] = 6, 
            [69] = 8, 
            [70] = 11, 
            [71] = 12, 
            [72] = 14, 
            [73] = 15, 
            [74] = 0, 
            [75] = 1, 
            [76] = 2, 
            [77] = 4, 
            [78] = 5, 
            [79] = 6, 
            [80] = 8, 
            [81] = 11, 
            [82] = 12, 
            [83] = 14, 
            [84] = 15, 
            [85] = 0, 
            [86] = 1, 
            [87] = 2, 
            [88] = 4, 
            [89] = 5, 
            [90] = 6, 
            [91] = 8, 
            [92] = 11, 
            [93] = 12, 
            [94] = 14, 
            [95] = 15, 
            [96] = 4, 
            [97] = 4, 
            [98] = 4, 
            [99] = 0, 
            [100] = 1, 
            [101] = 2, 
            [102] = 4, 
            [103] = 5, 
            [104] = 6, 
            [105] = 8, 
            [106] = 11, 
            [107] = 12, 
            [108] = 14, 
            [109] = 15, 
            [110] = 4, 
            [111] = 4, 
            [115] = 112, 
            [116] = 112, 
            [117] = 112, 
            [118] = 112, 
            [119] = 112, 
            [120] = 112, 
            [121] = 112, 
            [122] = 113, 
            [123] = 113, 
            [124] = 113, 
            [125] = 113, 
            [126] = 113, 
            [127] = 113, 
            [128] = 113, 
            [129] = 114, 
            [130] = 114, 
            [131] = 114, 
            [132] = 114, 
            [133] = 114, 
            [134] = 114, 
            [135] = 114, 
            [136] = 15, 
            [137] = 15, 
            [138] = 0, 
            [139] = 1, 
            [140] = 2, 
            [141] = 4, 
            [142] = 5, 
            [143] = 6, 
            [144] = 8, 
            [145] = 11, 
            [146] = 12, 
            [147] = 14, 
            [148] = 112, 
            [149] = 113, 
            [150] = 114, 
            [151] = 0, 
            [152] = 1, 
            [153] = 2, 
            [154] = 4, 
            [155] = 5, 
            [156] = 6, 
            [157] = 8, 
            [158] = 11, 
            [159] = 12, 
            [160] = 14, 
            [161] = 112, 
            [162] = 113, 
            [163] = 114, 
            [165] = 4, 
            [166] = 4, 
            [167] = 4, 
        }, 
        Female = { 
            [16] = 11, 
            [17] = 3, 
            [18] = 3,
            [19] = 3, 
            [20] = 0, 
            [21] = 1, 
            [22] = 2, 
            [23] = 3, 
            [24] = 4, 
            [25] = 5, 
            [26] = 6, 
            [27] = 7, 
            [28] = 9, 
            [29] = 11, 
            [30] = 12, 
            [31] = 14, 
            [32] = 15, 
            [33] = 0, 
            [34] = 1, 
            [35] = 2, 
            [36] = 3, 
            [37] = 4, 
            [38] = 5, 
            [39] = 6, 
            [40] = 7, 
            [41] = 9, 
            [42] = 11, 
            [43] = 12, 
            [44] = 14, 
            [45] = 15, 
            [46] = 0, 
            [47] = 1, 
            [48] = 2, 
            [49] = 3, 
            [50] = 4, 
            [51] = 5, 
            [52] = 6, 
            [53] = 7, 
            [54] = 9, 
            [55] = 11, 
            [56] = 12, 
            [57] = 14, 
            [58] = 15, 
            [59] = 0, 
            [60] = 1, 
            [61] = 2, 
            [62] = 3, 
            [63] = 4, 
            [64] = 5, 
            [65] = 6, 
            [66] = 7, 
            [67] = 9, 
            [68] = 11, 
            [69] = 12, 
            [70] = 14, 
            [71] = 15, 
            [72] = 0, 
            [73] = 1, 
            [74] = 4, 
            [75] = 3, 
            [76] = 4, 
            [77] = 5, 
            [78] = 6, 
            [79] = 7, 
            [80] = 9, 
            [81] = 11, 
            [82] = 12, 
            [83] = 14, 
            [84] = 15, 
            [85] = 0, 
            [86] = 1, 
            [87] = 2, 
            [88] = 3, 
            [89] = 4, 
            [90] = 5, 
            [91] = 6, 
            [92] = 7, 
            [93] = 9, 
            [94] = 11, 
            [95] = 12, 
            [96] = 14, 
            [97] = 15, 
            [98] = 0, 
            [99] = 1, 
            [100] = 2, 
            [101] = 3, 
            [102] = 4, 
            [103] = 5, 
            [104] = 6, 
            [105] = 7, 
            [106] = 9, 
            [107] = 11, 
            [108] = 12, 
            [109] = 14, 
            [110] = 15, 
            [111] = 3, 
            [112] = 3, 
            [113] = 3, 
            [114] = 0, 
            [115] = 1, 
            [116] = 2, 
            [117] = 3, 
            [118] = 4, 
            [119] = 5, 
            [120] = 6, 
            [121] = 7, 
            [122] = 9, 
            [123] = 11, 
            [124] = 12, 
            [125] = 14, 
            [126] = 15, 
            [127] = 3, 
            [128] = 3, 
            [132] = 129, 
            [133] = 129, 
            [134] = 129, 
            [135] = 129, 
            [136] = 129, 
            [137] = 129, 
            [138] = 129, 
            [139] = 130, 
            [140] = 130, 
            [141] = 130, 
            [142] = 130, 
            [143] = 130, 
            [144] = 130, 
            [145] = 130, 
            [146] = 131, 
            [147] = 131, 
            [148] = 131, 
            [149] = 131, 
            [150] = 131, 
            [151] = 131, 
            [152] = 131, 
            [154] = 153, 
            [155] = 153, 
            [156] = 153, 
            [157] = 153, 
            [158] = 153, 
            [159] = 153, 
            [160] = 153, 
            [162] = 161, 
            [163] = 161, 
            [164] = 161, 
            [165] = 161, 
            [166] = 161, 
            [167] = 161, 
            [168] = 161, 
            [169] = 15, 
            [170] = 15, 
            [171] = 0, 
            [172] = 1, 
            [173] = 2, 
            [174] = 3, 
            [175] = 4, 
            [176] = 5, 
            [177] = 6, 
            [178] = 7, 
            [179] = 9, 
            [180] = 11, 
            [181] = 12, 
            [182] = 14, 
            [183] = 129, 
            [184] = 130, 
            [185] = 131, 
            [186] = 153, 
            [187] = 0, 
            [188] = 1, 
            [189] = 2, 
            [190] = 3, 
            [191] = 4, 
            [192] = 5, 
            [193] = 6, 
            [194] = 7, 
            [195] = 9, 
            [196] = 11, 
            [197] = 12, 
            [198] = 14, 
            [199] = 129, 
            [200] = 130, 
            [201] = 131, 
            [202] = 153, 
            [203] = 161, 
            [204] = 161, 
            [206] = 3, 
            [207] = 3, 
            [208] = 3, 
        } 
    } 
}

GM.Inventory.ClothingWear = {
    ["top"] = {
		Drawable = 11,
        DatabaseName = "torso_1",
		Table = { Male = 15, Female = 74},
		Emote = {Dict = "clothingtie", Anim = "try_tie_negative_a", Move = 51, Dur = 1200}
	},
    ["shirts"] = {
		Drawable = 8,
        DatabaseName = "tshirt_1",
		Table = { Male = 15, Female = 15},
		Emote = {Dict = "clothingtie", Anim = "try_tie_negative_a", Move = 51, Dur = 1200}
	},
    ["pants"] = {
        Drawable = 4,
        DatabaseName = "pants_1",
		Table = {Male = 61, Female = 14},
		Emote = {Dict = "re@construction", Anim = "out_of_breath", Move = 51, Dur = 1300}
    },
    ["backpack"] = {
        Drawable = 5,
        DatabaseName = "bags_1",
		Table = {Male = 0, Female = 0},
		Emote = {Dict = "clothingtie", Anim = "try_tie_negative_a", Move = 51, Dur = 1200}
    },
    ["shoes"] = {
		Drawable = 6,
        DatabaseName = "shoes_1",
		Table = {Male = 34, Female = 35},
		Emote = {Dict = "random@domestic", Anim = "pickup_low", Move = 0, Dur = 1200}
	},
    ["mask"] = {
		Drawable = 1,
        DatabaseName = "mask_1",
		Table = {Male = 0, Female = 0 },
		Emote = {Dict = "mp_masks@standard_car@ds@", Anim = "put_on_mask", Move = 51, Dur = 800}
	},
    ["gloves"] = {
		Drawable = 3,
        DatabaseName = "arms_1",
		Table = Variations.Gloves,
        DrawableCheck = 11,
		Emote = {Dict = "nmt_3_rcm-10", Anim = "cs_nigel_dual-10", Move = 51, Dur = 1200}
	},
    ["hat"] = {
		Prop = 0,
        DatabaseName = "helmet_1",
		Emote = {Dict = "mp_masks@standard_car@ds@", Anim = "put_on_mask", Move = 51, Dur = 600},
	},
    ["ear"] = {
		Prop = 2,
        DatabaseName = "ears_1",
		Emote = {Dict = "mp_cp_stolen_tut", Anim = "b_think", Move = 51, Dur = 900},
	},
    ["watch"] = {
		Prop = 6,
        DatabaseName = "watches_1",
		Emote = {Dict = "nmt_3_rcm-10", Anim = "cs_nigel_dual-10", Move = 51, Dur = 1200},
	},
    ["glasses"] = {
		Prop = 1,
        DatabaseName = "glasses_1",
		Emote = {Dict = "clothingspecs", Anim = "take_off", Move = 51, Dur = 1400},
	},
    ["bracelet"] = {
		Prop = 7,
        DatabaseName = "bracelets_1",
		Emote = {Dict = "nmt_3_rcm-10", Anim = "cs_nigel_dual-10", Move = 51, Dur = 1200},
	},
    ["rig"] = {
		Drawable = 9,
        DatabaseName = "bproof_1",
		Table = {Male = 0, Female = 0 },
		Emote = {Dict = "mp_masks@standard_car@ds@", Anim = "put_on_mask", Move = 51, Dur = 800}
	},
}

GM.Inventory.ReloadTime = math.random(4000, 6000)

GM.Inventory.DurabilityBlockedWeapons = {
    "weapon_stungun",
    "weapon_nightstick",
    "weapon_flashlight",
    "weapon_unarmed",
}

GM.Inventory.WeaponList = {
	-- // WEAPONS
	-- Melee
	[`weapon_unarmed`] 				 = {['name'] = 'weapon_unarmed', 		['label'] = 'Fists', 				['weapontype'] = 'Melee',	['ammotype'] = nil, ['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_dagger`] 				 = {['name'] = 'weapon_dagger', 		['label'] = 'Dagger', 				['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Knifed / Stabbed / Eviscerated'},
	[`weapon_bat`] 					 = {['name'] = 'weapon_bat', 			['label'] = 'Bat', 					['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_bottle`] 				 = {['name'] = 'weapon_bottle', 		['label'] = 'Broken Bottle', 		['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Knifed / Stabbed / Eviscerated'},
	[`weapon_crowbar`] 				 = {['name'] = 'weapon_crowbar', 		['label'] = 'Crowbar', 				['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_flashlight`] 			 = {['name'] = 'weapon_flashlight', 	['label'] = 'Flashlight', 			['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_golfclub`] 			 = {['name'] = 'weapon_golfclub', 		['label'] = 'Golfclub', 			['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_hammer`] 				 = {['name'] = 'weapon_hammer', 		['label'] = 'Hammer', 				['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_hatchet`] 				 = {['name'] = 'weapon_hatchet', 		['label'] = 'Hatchet', 				['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Knifed / Stabbed / Eviscerated'},
	[`weapon_knuckle`] 				 = {['name'] = 'weapon_knuckle', 		['label'] = 'Knuckle', 				['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_knife`] 				 = {['name'] = 'weapon_knife', 			['label'] = 'Knife', 				['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Knifed / Stabbed / Eviscerated'},
	[`weapon_machete`] 				 = {['name'] = 'weapon_machete', 		['label'] = 'Machete', 				['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Knifed / Stabbed / Eviscerated'},
	[`weapon_switchblade`] 			 = {['name'] = 'weapon_switchblade', 	['label'] = 'Switchblade', 			['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Knifed / Stabbed / Eviscerated'},
	[`weapon_nightstick`] 			 = {['name'] = 'weapon_nightstick', 	['label'] = 'Nightstick', 			['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_wrench`] 				 = {['name'] = 'weapon_wrench', 		['label'] = 'Wrench', 				['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_battleaxe`] 			 = {['name'] = 'weapon_battleaxe', 		['label'] = 'Battle Axe', 			['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Knifed / Stabbed / Eviscerated'},
	[`weapon_poolcue`] 				 = {['name'] = 'weapon_poolcue', 		['label'] = 'Poolcue', 				['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_briefcase`] 			 = {['name'] = 'weapon_briefcase', 		['label'] = 'Briefcase', 			['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_briefcase_02`] 		 = {['name'] = 'weapon_briefcase_02', 	['label'] = 'Briefcase', 			['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_garbagebag`] 			 = {['name'] = 'weapon_garbagebag', 	['label'] = 'Garbage Bag', 			['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_handcuffs`] 			 = {['name'] = 'weapon_handcuffs', 		['label'] = 'Handcuffs', 			['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_bread`] 				 = {['name'] = 'weapon_bread', 			['label'] = 'Baquette', 			['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_stone_hatchet`] 		 = {['name'] = 'weapon_stone_hatchet', 	['label'] = 'Stone Hatchet',        ['weapontype'] = 'Melee',	['ammotype'] = nil,	['damagereason'] = 'Knifed / Stabbed / Eviscerated'},

    -- Handguns
	[`weapon_pistol`] 				 = {['name'] = 'weapon_pistol', 		['label'] = 'Pistol', 				    ['weapontype'] = 'Pistol',	['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_pistol_mk2`] 			 = {['name'] = 'weapon_pistol_mk2', 	['label'] = 'Pistol Mk2', 			    ['weapontype'] = 'Pistol',	['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_combatpistol`] 		 = {['name'] = 'weapon_combatpistol', 	['label'] = 'Combat Pistol', 			['weapontype'] = 'Pistol',	['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_appistol`] 			 = {['name'] = 'weapon_appistol', 		['label'] = 'AP Pistol', 				['weapontype'] = 'Pistol',	['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_stungun`] 				 = {['name'] = 'weapon_stungun', 		['label'] = 'Taser', 					['weapontype'] = 'Pistol',	['ammotype'] = 'AMMO_STUNGUN',	['damagereason'] = 'Died'},
	[`weapon_pistol50`] 			 = {['name'] = 'weapon_pistol50', 		['label'] = 'Pistol .50 Cal', 			['weapontype'] = 'Pistol',	['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_snspistol`] 			 = {['name'] = 'weapon_snspistol', 		['label'] = 'SNS Pistol', 				['weapontype'] = 'Pistol',	['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_snspistol_mk2`] 	     = {['name'] = 'weapon_snspistol_mk2', 	['label'] = 'SNS Pistol MK2', 			['weapontype'] = 'Pistol',	['ammotype'] = 'AMMO_PISTOL',   ['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_heavypistol`] 			 = {['name'] = 'weapon_heavypistol', 	['label'] = 'Heavy Pistol', 			['weapontype'] = 'Pistol',	['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_vintagepistol`] 		 = {['name'] = 'weapon_vintagepistol', 	['label'] = 'Vintage Pistol', 			['weapontype'] = 'Pistol',	['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_flaregun`] 			 = {['name'] = 'weapon_flaregun', 		['label'] = 'Flare Gun', 				['weapontype'] = 'Pistol',	['ammotype'] = 'AMMO_FLARE',	['damagereason'] = 'Died'},
	[`weapon_marksmanpistol`] 		 = {['name'] = 'weapon_marksmanpistol', ['label'] = 'Marksman Pistol', 			['weapontype'] = 'Pistol',	['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_revolver`] 			 = {['name'] = 'weapon_revolver', 		['label'] = 'Revolver', 				['weapontype'] = 'Pistol',	['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_revolver_mk2`] 		 = {['name'] = 'weapon_revolver_mk2', 	['label'] = 'Revolver MK2', 		    ['weapontype'] = 'Pistol',	['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_doubleaction`] 	     = {['name'] = 'weapon_doubleaction', 	['label'] = 'Double Action Revolver',	['weapontype'] = 'Pistol',	['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_raypistol`]			 = {['name'] = 'weapon_raypistol',		['label'] = 'Ray Pistol',			    ['weapontype'] = 'Pistol',	['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_ceramicpistol`]		 = {['name'] = 'weapon_ceramicpistol', 	['label'] = 'Ceramic Pistol',		    ['weapontype'] = 'Pistol',	['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_navyrevolver`]        	 = {['name'] = 'weapon_navyrevolver', 	['label'] = 'Navy Revolver',		    ['weapontype'] = 'Pistol',	['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_gadgetpistol`] 		 = {['name'] = 'weapon_gadgetpistol', 	['label'] = 'Gadget Pistol',		    ['weapontype'] = 'Pistol',	['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_stungun_mp`] 			 = {['name'] = 'weapon_stungun_mp', 	['label'] = 'Taser', 					['weapontype'] = 'Pistol',	['ammotype'] = 'AMMO_STUNGUN',	['damagereason'] = 'Died'},

    -- Submachine Guns
	[`weapon_microsmg`] 			 = {['name'] = 'weapon_microsmg', 		['label'] = 'Micro SMG', 			['weapontype'] = 'Submachine Gun',	['ammotype'] = 'AMMO_SMG',		['damagereason'] = 'Riddled / Drilled / Finished / Submachine Gunned'},
	[`weapon_smg`] 				 	 = {['name'] = 'weapon_smg', 			['label'] = 'SMG', 					['weapontype'] = 'Submachine Gun',	['ammotype'] = 'AMMO_SMG',		['damagereason'] = 'Riddled / Drilled / Finished / Submachine Gunned'},
	[`weapon_smg_mk2`] 				 = {['name'] = 'weapon_smg_mk2', 		['label'] = 'SMG MK2', 			    ['weapontype'] = 'Submachine Gun',	['ammotype'] = 'AMMO_SMG',		['damagereason'] = 'Riddled / Drilled / Finished / Submachine Gunned'},
	[`weapon_assaultsmg`] 			 = {['name'] = 'weapon_assaultsmg', 	['label'] = 'Assault SMG', 			['weapontype'] = 'Submachine Gun',	['ammotype'] = 'AMMO_SMG',		['damagereason'] = 'Riddled / Drilled / Finished / Submachine Gunned'},
	[`weapon_combatpdw`] 			 = {['name'] = 'weapon_combatpdw', 		['label'] = 'Combat PDW', 			['weapontype'] = 'Submachine Gun',	['ammotype'] = 'AMMO_SMG',		['damagereason'] = 'Riddled / Drilled / Finished / Submachine Gunned'},
	[`weapon_machinepistol`] 		 = {['name'] = 'weapon_machinepistol', 	['label'] = 'Tec-9', 				['weapontype'] = 'Submachine Gun',	['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Riddled / Drilled / Finished / Submachine Gunned'},
	[`weapon_minismg`] 				 = {['name'] = 'weapon_minismg', 		['label'] = 'Mini SMG', 			['weapontype'] = 'Submachine Gun',	['ammotype'] = 'AMMO_SMG',		['damagereason'] = 'Riddled / Drilled / Finished / Submachine Gunned'},
	[`weapon_raycarbine`]	         = {['name'] = 'weapon_raycarbine', 	['label'] = 'Raycarbine',	        ['weapontype'] = 'Submachine Gun',	['ammotype'] = 'AMMO_SMG',		['damagereason'] = 'Riddled / Drilled / Finished / Submachine Gunned'},

    -- Shotguns
	[`weapon_pumpshotgun`] 			 = {['name'] = 'weapon_pumpshotgun', 	 	['label'] = 'Pump Shotgun', 			['weapontype'] = 'Shotgun',	['ammotype'] = 'AMMO_SHOTGUN',	['damagereason'] = 'Devastated / Pulverized / Shotgunned'},
	[`weapon_pumpshotgun_mk2`]		 = {['name'] = 'weapon_pumpshotgun_mk2',	['label'] = 'Pump Shotgun MK2', 		['weapontype'] = 'Shotgun',	['ammotype'] = 'AMMO_SHOTGUN',	['damagereason'] = 'Devastated / Pulverized / Shotgunned'},
	[`weapon_sawnoffshotgun`] 		 = {['name'] = 'weapon_sawnoffshotgun', 	['label'] = 'Sawn-off Shotgun', 		['weapontype'] = 'Shotgun',	['ammotype'] = 'AMMO_SHOTGUN',	['damagereason'] = 'Devastated / Pulverized / Shotgunned'},
	[`weapon_assaultshotgun`] 		 = {['name'] = 'weapon_assaultshotgun', 	['label'] = 'Assault Shotgun', 			['weapontype'] = 'Shotgun',	['ammotype'] = 'AMMO_SHOTGUN',	['damagereason'] = 'Devastated / Pulverized / Shotgunned'},
	[`weapon_bullpupshotgun`] 		 = {['name'] = 'weapon_bullpupshotgun', 	['label'] = 'Bullpup Shotgun', 			['weapontype'] = 'Shotgun',	['ammotype'] = 'AMMO_SHOTGUN',	['damagereason'] = 'Devastated / Pulverized / Shotgunned'},
	[`weapon_musket`] 			     = {['name'] = 'weapon_musket', 			['label'] = 'Musket', 					['weapontype'] = 'Shotgun',	['ammotype'] = 'AMMO_SHOTGUN',	['damagereason'] = 'Devastated / Pulverized / Shotgunned'},
	[`weapon_heavyshotgun`] 		 = {['name'] = 'weapon_heavyshotgun', 	 	['label'] = 'Heavy Shotgun', 			['weapontype'] = 'Shotgun',	['ammotype'] = 'AMMO_SHOTGUN',	['damagereason'] = 'Devastated / Pulverized / Shotgunned'},
	[`weapon_dbshotgun`] 			 = {['name'] = 'weapon_dbshotgun', 		 	['label'] = 'Double-barrel Shotgun', 	['weapontype'] = 'Shotgun',	['ammotype'] = 'AMMO_SHOTGUN',	['damagereason'] = 'Devastated / Pulverized / Shotgunned'},
	[`weapon_autoshotgun`] 			 = {['name'] = 'weapon_autoshotgun', 	 	['label'] = 'Auto Shotgun', 			['weapontype'] = 'Shotgun',	['ammotype'] = 'AMMO_SHOTGUN',	['damagereason'] = 'Devastated / Pulverized / Shotgunned'},
	[`weapon_combatshotgun`]		 = {['name'] = 'weapon_combatshotgun', 		['label'] = 'Combat Shotgun',		    ['weapontype'] = 'Shotgun',	['ammotype'] = 'AMMO_SHOTGUN',	['damagereason'] = 'Devastated / Pulverized / Shotgunned'},

    -- Assault Rifles
	[`weapon_assaultrifle`] 		 = {['name'] = 'weapon_assaultrifle', 	 	['label'] = 'Assault Rifle', 				['weapontype'] = 'Assault Rifle',	['ammotype'] = 'AMMO_RIFLE',	['damagereason'] = 'Ended / Rifled / Shot down / Floored'},
	[`weapon_assaultrifle_mk2`] 	 = {['name'] = 'weapon_assaultrifle_mk2', 	['label'] = 'Assault Rifle MK2', 			['weapontype'] = 'Assault Rifle',	['ammotype'] = 'AMMO_RIFLE',	['damagereason'] = 'Ended / Rifled / Shot down / Floored'},
	[`weapon_carbinerifle`] 		 = {['name'] = 'weapon_carbinerifle', 	 	['label'] = 'Carbine Rifle', 				['weapontype'] = 'Assault Rifle',	['ammotype'] = 'AMMO_RIFLE',	['damagereason'] = 'Ended / Rifled / Shot down / Floored'},
    [`weapon_carbinerifle_mk2`] 	 = {['name'] = 'weapon_carbinerifle_mk2', 	['label'] = 'Carbine Rifle MK2', 			['weapontype'] = 'Assault Rifle',	['ammotype'] = 'AMMO_RIFLE',	['damagereason'] = 'Ended / Rifled / Shot down / Floored'},
	[`weapon_advancedrifle`] 		 = {['name'] = 'weapon_advancedrifle', 	 	['label'] = 'Advanced Rifle', 				['weapontype'] = 'Assault Rifle',	['ammotype'] = 'AMMO_RIFLE',	['damagereason'] = 'Ended / Rifled / Shot down / Floored'},
	[`weapon_specialcarbine`] 		 = {['name'] = 'weapon_specialcarbine', 	['label'] = 'Special Carbine', 				['weapontype'] = 'Assault Rifle',	['ammotype'] = 'AMMO_RIFLE',	['damagereason'] = 'Ended / Rifled / Shot down / Floored'},
	[`weapon_specialcarbine_mk2`]	 = {['name'] = 'weapon_specialcarbine_mk2',	['label'] = 'Specialcarbine MK2',	        ['weapontype'] = 'Assault Rifle',	['ammotype'] = 'AMMO_RIFLE',	['damagereason'] = 'Ended / Rifled / Shot down / Floored'},
	[`weapon_bullpuprifle`] 		 = {['name'] = 'weapon_bullpuprifle', 	 	['label'] = 'Bullpup Rifle', 				['weapontype'] = 'Assault Rifle',	['ammotype'] = 'AMMO_RIFLE',	['damagereason'] = 'Ended / Rifled / Shot down / Floored'},
	[`weapon_bullpuprifle_mk2`]		 = {['name'] = 'weapon_bullpuprifle_mk2', 	['label'] = 'Bull Puprifle MK2',			['weapontype'] = 'Assault Rifle',	['ammotype'] = 'AMMO_RIFLE',	['damagereason'] = 'Ended / Rifled / Shot down / Floored'},
	[`weapon_compactrifle`] 		 = {['name'] = 'weapon_compactrifle', 	 	['label'] = 'Compact Rifle', 				['weapontype'] = 'Assault Rifle',	['ammotype'] = 'AMMO_RIFLE',	['damagereason'] = 'Ended / Rifled / Shot down / Floored'},
	[`weapon_militaryrifle`]		 = {['name'] = 'weapon_militaryrifle', 		['label'] = 'Military Rifle',   			['weapontype'] = 'Assault Rifle',	['ammotype'] = 'AMMO_RIFLE',	['damagereason'] = 'Ended / Rifled / Shot down / Floored'},
    [`weapon_heavyrifle`] 			 = {['name'] = 'weapon_heavyrifle', 	 	['label'] = 'Heavy Rifle', 					['weapontype'] = 'Assault Rifle',	['ammotype'] = 'AMMO_RIFLE',	['damagereason'] = 'Ended / Rifled / Shot down / Floored'},

    -- Light Machine Guns
	[`weapon_mg`] 					 = {['name'] = 'weapon_mg', 			['label'] = 'Machinegun', 			['weapontype'] = 'Light Machine Gun',	['ammotype'] = 'AMMO_MG',	['damagereason'] = 'Machine gunned / Sprayed / Ruined'},
	[`weapon_combatmg`] 			 = {['name'] = 'weapon_combatmg', 		['label'] = 'Combat MG', 			['weapontype'] = 'Light Machine Gun',	['ammotype'] = 'AMMO_MG',	['damagereason'] = 'Machine gunned / Sprayed / Ruined'},
	[`weapon_combatmg_mk2`]	 		 = {['name'] = 'weapon_combatmg_mk2', 	['label'] = 'Combat MG MK2',	    ['weapontype'] = 'Light Machine Gun',	['ammotype'] = 'AMMO_MG',	['damagereason'] = 'Machine gunned / Sprayed / Ruined'},
	[`weapon_gusenberg`] 			 = {['name'] = 'weapon_gusenberg', 		['label'] = 'Thompson SMG', 		['weapontype'] = 'Light Machine Gun',	['ammotype'] = 'AMMO_MG',	['damagereason'] = 'Machine gunned / Sprayed / Ruined'},

    -- Sniper Rifles
	[`weapon_sniperrifle`] 			 = {['name'] = 'weapon_sniperrifle', 	 	['label'] = 'Sniper Rifle', 			['weapontype'] = 'Sniper Rifle',	['ammotype'] = 'AMMO_SNIPER',			['damagereason'] = 'Sniped / Picked off / Scoped'},
	[`weapon_heavysniper`] 			 = {['name'] = 'weapon_heavysniper', 	 	['label'] = 'Heavy Sniper', 			['weapontype'] = 'Sniper Rifle',	['ammotype'] = 'AMMO_SNIPER',			['damagereason'] = 'Sniped / Picked off / Scoped'},
	[`weapon_heavysniper_mk2`]		 = {['name'] = 'weapon_heavysniper_mk2', 	['label'] = 'Heavysniper MK2',	        ['weapontype'] = 'Sniper Rifle',	['ammotype'] = 'AMMO_SNIPER',			['damagereason'] = 'Sniped / Picked off / Scoped'},
	[`weapon_marksmanrifle`] 		 = {['name'] = 'weapon_marksmanrifle', 	 	['label'] = 'Marksman Rifle', 			['weapontype'] = 'Sniper Rifle',	['ammotype'] = 'AMMO_SNIPER',			['damagereason'] = 'Sniped / Picked off / Scoped'},
	[`weapon_marksmanrifle_mk2`]	 = {['name'] = 'weapon_marksmanrifle_mk2',	['label'] = 'Marksman Rifle MK2',	    ['weapontype'] = 'Sniper Rifle',	['ammotype'] = 'AMMO_SNIPER',			['damagereason'] = 'Sniped / Picked off / Scoped'},
	[`weapon_remotesniper`] 		 = {['name'] = 'weapon_remotesniper', 	 	['label'] = 'Remote Sniper', 			['weapontype'] = 'Sniper Rifle',	['ammotype'] = 'AMMO_SNIPER_REMOTE',	['damagereason'] = 'Sniped / Picked off / Scoped'},

    -- Heavy Weapons
	[`weapon_rpg`] 					 = {['name'] = 'weapon_rpg', 			      	['label'] = 'RPG', 						['weapontype'] = 'Heavy Weapons',	['ammotype'] = 'AMMO_RPG',				['damagereason'] = 'Killed / Exploded / Obliterated / Destroyed / Erased / Annihilated'},
	[`weapon_grenadelauncher`] 		 = {['name'] = 'weapon_grenadelauncher', 	  	['label'] = 'Grenade Launcher', 		['weapontype'] = 'Heavy Weapons',	['ammotype'] = 'AMMO_GRENADELAUNCHER',	['damagereason'] = 'Killed / Exploded / Obliterated / Destroyed / Erased / Annihilated'},
	[`weapon_grenadelauncher_smoke`] = {['name'] = 'weapon_grenadelauncher_smoke',	['label'] = 'Smoke Grenade Launcher',	['weapontype'] = 'Heavy Weapons',	['ammotype'] = 'AMMO_GRENADELAUNCHER',	['damagereason'] = 'Killed / Exploded / Obliterated / Destroyed / Erased / Annihilated'},
	[`weapon_minigun`] 				 = {['name'] = 'weapon_minigun', 		      	['label'] = 'Minigun', 					['weapontype'] = 'Heavy Weapons',	['ammotype'] = 'AMMO_MINIGUN',			['damagereason'] = 'Killed / Exploded / Obliterated / Destroyed / Erased / Annihilated'},
	[`weapon_firework`] 			 = {['name'] = 'weapon_firework', 		 	  	['label'] = 'Firework Launcher', 		['weapontype'] = 'Heavy Weapons',	['ammotype'] = nil,						['damagereason'] = 'Killed / Exploded / Obliterated / Destroyed / Erased / Annihilated'},
	[`weapon_railgun`] 				 = {['name'] = 'weapon_railgun', 		 	  	['label'] = 'Railgun', 					['weapontype'] = 'Heavy Weapons',	['ammotype'] = nil,						['damagereason'] = 'Killed / Exploded / Obliterated / Destroyed / Erased / Annihilated'},
	[`weapon_hominglauncher`] 		 = {['name'] = 'weapon_hominglauncher', 	 	['label'] = 'Homing Launcher', 			['weapontype'] = 'Heavy Weapons',	['ammotype'] = 'AMMO_STINGER',			['damagereason'] = 'Killed / Exploded / Obliterated / Destroyed / Erased / Annihilated'},
	[`weapon_compactlauncher`] 		 = {['name'] = 'weapon_compactlauncher',  	  	['label'] = 'Compact Launcher', 		['weapontype'] = 'Heavy Weapons',	['ammotype'] = nil,						['damagereason'] = 'Killed / Exploded / Obliterated / Destroyed / Erased / Annihilated'},
	[`weapon_rayminigun`]			 = {['name'] = 'weapon_rayminigun', 		 	['label'] = 'Ray Minigun',		        ['weapontype'] = 'Heavy Weapons',	['ammotype'] = 'AMMO_MINIGUN',			['damagereason'] = 'Killed / Exploded / Obliterated / Destroyed / Erased / Annihilated'},
    [`weapon_emplauncher`] 			 = {['name'] = 'weapon_emplauncher', 			['label'] = 'EMP Launcher', 			['weapontype'] = 'Heavy Weapons',	['ammotype'] = 'AMMO_EMPLAUNCHER',		['damagereason'] = 'Died'},

    -- Throwables
	[`weapon_grenade`] 		        = {['name'] = 'weapon_grenade', 		['label'] = 'Grenade', 			['weapontype'] = 'Throwable',	['ammotype'] = nil,				['damagereason'] = 'Bombed / Exploded / Detonated / Blew up'},
	[`weapon_bzgas`] 		        = {['name'] = 'weapon_bzgas', 			['label'] = 'BZ Gas', 			['weapontype'] = 'Throwable',	['ammotype'] = nil,				['damagereason'] = 'Died'},
	[`weapon_molotov`] 		        = {['name'] = 'weapon_molotov', 		['label'] = 'Molotov', 			['weapontype'] = 'Throwable',	['ammotype'] = nil,				['damagereason'] = 'Torched / Flambeed / Barbecued'},
	[`weapon_stickybomb`] 	        = {['name'] = 'weapon_stickybomb', 	    ['label'] = 'C4', 				['weapontype'] = 'Throwable',	['ammotype'] = nil,				['damagereason'] = 'Bombed / Exploded / Detonated / Blew up'},
	[`weapon_proxmine`] 	        = {['name'] = 'weapon_proxmine', 		['label'] = 'Proxmine Grenade', ['weapontype'] = 'Throwable',	['ammotype'] = nil,				['damagereason'] = 'Bombed / Exploded / Detonated / Blew up'},
	[`weapon_snowball`] 	        = {['name'] = 'weapon_snowball', 		['label'] = 'Snowball', 		['weapontype'] = 'Throwable',	['ammotype'] = nil,				['damagereason'] = 'Died'},
	[`weapon_pipebomb`] 	        = {['name'] = 'weapon_pipebomb', 		['label'] = 'Pipe Bomb', 		['weapontype'] = 'Throwable',	['ammotype'] = nil,				['damagereason'] = 'Bombed / Exploded / Detonated / Blew up'},
	[`weapon_ball`] 		        = {['name'] = 'weapon_ball', 			['label'] = 'Ball', 			['weapontype'] = 'Throwable',	['ammotype'] = 'AMMO_BALL',		['damagereason'] = 'Died'},
	[`weapon_smokegrenade`]         = {['name'] = 'weapon_smokegrenade', 	['label'] = 'Smoke Grenade', 	['weapontype'] = 'Throwable',	['ammotype'] = nil,				['damagereason'] = 'Died'},
	[`weapon_flare`] 		        = {['name'] = 'weapon_flare', 			['label'] = 'Flare pistol', 	['weapontype'] = 'Throwable',	['ammotype'] = 'AMMO_FLARE',	['damagereason'] = 'Died'},

    -- Miscellaneous
	[`weapon_petrolcan`] 			= {['name'] = 'weapon_petrolcan', 		 	['label'] = 'Petrol Can', 				['weapontype'] = 'Miscellaneous',	['ammotype'] = 'AMMO_PETROLCAN',		['damagereason'] = 'Died'},
	[`gadget_parachute`] 			= {['name'] = 'gadget_parachute', 		 	['label'] = 'Parachute', 				['weapontype'] = 'Miscellaneous',	['ammotype'] = nil,						['damagereason'] = 'Died'},
	[`weapon_fireextinguisher`] 	= {['name'] = 'weapon_fireextinguisher',	['label'] = 'Fire Extinguisher',		['weapontype'] = 'Miscellaneous',	['ammotype'] = nil,						['damagereason'] = 'Died'},
	[`weapon_hazardcan`]			= {['name'] = 'weapon_hazardcan',			['label'] = 'Hazardcan',			    ['weapontype'] = 'Miscellaneous',	['ammotype'] = 'AMMO_PETROLCAN',		['damagereason'] = 'Died'},
    [`weapon_fertilizercan`]		= {['name'] = 'weapon_fertilizercan',		['label'] = 'Fertilizer Can',			['weapontype'] = 'Miscellaneous',	['ammotype'] = 'AMMO_FERTILIZERCAN',	['damagereason'] = 'Died'},
	[`weapon_barbed_wire`]			= {['name'] = 'weapon_barbed_wire',			['label'] = 'Barbed Wire',				['weapontype'] = 'Miscellaneous',	['ammotype'] = nil,						['damagereason'] = 'Prodded'},
	[`weapon_drowning`]				= {['name'] = 'weapon_drowning',			['label'] = 'Drowning',					['weapontype'] = 'Miscellaneous',	['ammotype'] = nil,						['damagereason'] = 'Died'},
	[`weapon_drowning_in_vehicle`]	= {['name'] = 'weapon_drowning_in_vehicle',	['label'] = 'Drowning in a Vehicle',	['weapontype'] = 'Miscellaneous',	['ammotype'] = nil,						['damagereason'] = 'Died'},
	[`weapon_bleeding`]				= {['name'] = 'weapon_bleeding',			['label'] = 'Bleeding',					['weapontype'] = 'Miscellaneous',	['ammotype'] = nil,						['damagereason'] = 'Bled out'},
	[`weapon_electric_fence`]		= {['name'] = 'weapon_electric_fence',		['label'] = 'Electric Fence',			['weapontype'] = 'Miscellaneous',	['ammotype'] = nil,						['damagereason'] = 'Fried'},
	[`weapon_explosion`]			= {['name'] = 'weapon_explosion',			['label'] = 'Explosion',				['weapontype'] = 'Miscellaneous',	['ammotype'] = nil,						['damagereason'] = 'Killed / Exploded / Obliterated / Destroyed / Erased / Annihilated'},
	[`weapon_fall`]					= {['name'] = 'weapon_fall',				['label'] = 'Fall',						['weapontype'] = 'Miscellaneous',	['ammotype'] = nil,						['damagereason'] = 'Committed suicide'},
	[`weapon_exhaustion`]			= {['name'] = 'weapon_exhaustion',			['label'] = 'Exhaustion',				['weapontype'] = 'Miscellaneous',	['ammotype'] = nil,						['damagereason'] = 'Died'},
	[`weapon_hit_by_water_cannon`]	= {['name'] = 'weapon_hit_by_water_cannon',	['label'] = 'Water Cannon',				['weapontype'] = 'Miscellaneous',	['ammotype'] = nil,						['damagereason'] = 'Died'},
	[`weapon_rammed_by_car`]		= {['name'] = 'weapon_rammed_by_car',		['label'] = 'Rammed - Vehicle',			['weapontype'] = 'Miscellaneous',	['ammotype'] = nil,						['damagereason'] = 'Flattened / Ran over / Ran down'},
	[`weapon_run_over_by_car`]		= {['name'] = 'weapon_run_over_by_car',		['label'] = 'Run Over - Vehicle',		['weapontype'] = 'Miscellaneous',	['ammotype'] = nil,						['damagereason'] = 'Flattened / Ran over / Ran down'},
	[`weapon_heli_crash`]			= {['name'] = 'weapon_heli_crash',			['label'] = 'Heli Crash',				['weapontype'] = 'Miscellaneous',	['ammotype'] = nil,						['damagereason'] = 'Helicopter Crash'},
	[`weapon_fire`]					= {['name'] = 'weapon_fire',				['label'] = 'Fire',						['weapontype'] = 'Miscellaneous',	['ammotype'] = nil,						['damagereason'] = 'Torched / Flambeed / Barbecued'},

	-- Animals
    [`weapon_animal`]               = {['name'] = 'weapon_animal',	['label'] = 'Animal',	['weapontype'] = 'Animals',	['ammotype'] = nil,	['damagereason'] = 'Mauled'},
    [`weapon_cougar`]               = {['name'] = 'weapon_cougar',	['label'] = 'Cougar',	['weapontype'] = 'Animals',	['ammotype'] = nil,	['damagereason'] = 'Mauled'},
}

GM.Inventory.DurabilityMultiplier = {
	-- Melee
	-- ['weapon_unarmed'] 				 = 0.15,
	['weapon_dagger'] 				 = 0.15,
	['weapon_bat'] 				 	 = 0.15,
	['weapon_bottle'] 				 = 0.15,
	['weapon_crowbar'] 				 = 0.15,
	-- ['weapon_flashlight'] 			 = 0.15,
	['weapon_golfclub'] 			 = 0.15,
	['weapon_hammer'] 				 = 0.15,
	['weapon_hatchet'] 				 = 0.15,
	['weapon_knuckle'] 				 = 0.15,
	['weapon_knife'] 				 = 0.15,
	['weapon_machete'] 				 = 0.15,
	['weapon_switchblade'] 			 = 0.15,
	-- ['weapon_nightstick'] 			 = 0.15,
	['weapon_wrench'] 				 = 0.15,
	['weapon_battleaxe'] 			 = 0.15,
	['weapon_poolcue'] 				 = 0.15,
	['weapon_briefcase'] 			 = 0.15,
	['weapon_briefcase_02'] 		 = 0.15,
	['weapon_garbagebag'] 			 = 0.15,
	['weapon_handcuffs'] 			 = 0.15,
	['weapon_bread'] 				 = 0.15,
	['weapon_stone_hatchet'] 		 = 0.15,

	-- Handguns
	['weapon_pistol'] 				 = 0.15,
	['weapon_pistol_mk2'] 			 = 0.15,
	['weapon_combatpistol'] 		 = 0.15,
	['weapon_appistol'] 			 = 0.15,
	-- ['weapon_stungun'] 				 = 0.15,
    -- ['weapon_stungun_mp'] 				 = 0.15,
	['weapon_pistol50'] 			 = 0.15,
	['weapon_snspistol'] 			 = 0.15,
	['weapon_heavypistol'] 			 = 0.15,
	['weapon_vintagepistol'] 		 = 0.15,
	['weapon_flaregun'] 			 = 0.15,
	['weapon_marksmanpistol'] 		 = 0.15,
	['weapon_revolver'] 			 = 0.15,
	['weapon_revolver_mk2'] 		 = 0.15,
	['weapon_doubleaction'] 		 = 0.15,
	['weapon_snspistol_mk2'] 		 = 0.15,
	['weapon_raypistol'] 			 = 0.15,
	['weapon_ceramicpistol'] 		 = 0.15,
	['weapon_navyrevolver'] 		 = 0.15,
	['weapon_gadgetpistol'] 		 = 0.15,

	-- Submachine Guns
	['weapon_microsmg'] 			 = 0.15,
	['weapon_smg'] 				     = 0.15,
	['weapon_smg_mk2'] 				 = 0.15,
	['weapon_assaultsmg'] 			 = 0.15,
	['weapon_combatpdw'] 			 = 0.15,
	['weapon_machinepistol'] 		 = 0.15,
	['weapon_minismg'] 				 = 0.15,
	['weapon_raycarbine'] 			 = 0.15,

	-- Shotguns
	['weapon_pumpshotgun'] 			= 0.15,
	['weapon_sawnoffshotgun'] 		= 0.15,
	['weapon_assaultshotgun'] 		= 0.15,
	['weapon_bullpupshotgun'] 		= 0.15,
	['weapon_musket'] 				= 0.15,
	['weapon_heavyshotgun'] 		= 0.15,
	['weapon_dbshotgun'] 			= 0.15,
	['weapon_autoshotgun'] 			= 0.15,
	['weapon_pumpshotgun_mk2'] 		= 0.15,
	['weapon_combatshotgun'] 		= 0.15,

	-- Assault Rifles
	['weapon_assaultrifle'] 		= 0.15,
	['weapon_assaultrifle_mk2'] 	= 0.15,
	['weapon_carbinerifle'] 		= 0.15,
	['weapon_carbinerifle_mk2'] 	= 0.15,
	['weapon_advancedrifle'] 		= 0.15,
	['weapon_specialcarbine'] 		= 0.15,
	['weapon_bullpuprifle'] 		= 0.15,
	['weapon_compactrifle'] 		= 0.15,
	['weapon_specialcarbine_mk2'] 	= 0.15,
	['weapon_bullpuprifle_mk2'] 	= 0.15,
	['weapon_militaryrifle'] 		= 0.15,
    ['weapon_heavyrifle']           = 0.15,

	-- Light Machine Guns
	['weapon_mg'] 				    = 0.15,
	['weapon_combatmg'] 			= 0.15,
	['weapon_gusenberg'] 			= 0.15,
	['weapon_combatmg_mk2'] 		= 0.15,

	-- Sniper Rifles
	['weapon_sniperrifle'] 			= 0.15,
	['weapon_heavysniper'] 			= 0.15,
	['weapon_marksmanrifle'] 		= 0.15,
	['weapon_remotesniper'] 		= 0.15,
	['weapon_heavysniper_mk2'] 		= 0.15,
	['weapon_marksmanrifle_mk2'] 	= 0.15,

	-- Heavy Weapons
	['weapon_rpg'] 				    = 0.15,
	['weapon_grenadelauncher'] 		= 0.15,
	['weapon_grenadelauncher_smoke']= 0.15,
    ['weapon_emplauncher']          = 0.15,
	['weapon_minigun'] 				= 0.15,
	['weapon_firework'] 			= 0.15,
	['weapon_railgun'] 				= 0.15,
	['weapon_hominglauncher'] 		= 0.15,
	['weapon_compactlauncher'] 		= 0.15,
	['weapon_rayminigun'] 			= 0.15,

	-- Throwables
	['weapon_grenade'] 				= 0.15,
	['weapon_bzgas'] 				= 0.15,
	['weapon_molotov'] 				= 0.15,
	['weapon_stickybomb'] 			= 0.15,
	['weapon_proxmine'] 			= 0.15,
	['weapon_snowball'] 			= 0.15,
	['weapon_pipebomb'] 			= 0.15,
	['weapon_ball'] 				= 0.15,
	['weapon_smokegrenade'] 		= 0.15,
	['weapon_flare'] 				= 0.15,

	-- Miscellaneous
	['weapon_petrolcan'] 			= 0.15,
	['weapon_fireextinguisher'] 	= 0.15,
	['weapon_hazardcan'] 			= 0.15,
    ['weapon_fertilizercan'] 		= 0.15,
}

GM.Inventory.WeaponRepairPoints = {
    [1] = {
        coords = vector3(964.02, -1267.41, 34.97),
        IsRepairing = false,
        RepairingData = {},
    }
}

GM.Inventory.WeaponRepairCosts = {
    ["pistol"] = 1000,
    ["smg"] = 3000,
    ["mg"] = 4000,
    ["rifle"] = 5000,
    ["sniper"] = 7000,
}

GM.Inventory.WeaponAttachment = {}
GM.Inventory.WeaponAttachment.Bones = {
    ["WAPClip"]         = {label = "Magazine", attach_component='clip', slot="0-0", add_left = 42, add_top = 42},
    ["Gun_GripR"]       = {label = "Finish", attach_component='luxary_finish', slot="1-0", add_left = 42, add_top = 42},
    ["WAPSupp"]      = {label = "Muzzle", attach_component='suppressor', slot="2-0", add_left = 42, add_top = -202},
    ["WAPFlshLasr"]         = {label = "Flashlight", attach_component='flashlight', slot="3-0", add_left = 45, add_top = 42},
    ["WAPScop"]         = {label = "Scope", attach_component='scope', slot="4-0", add_left = 42, add_top = 42},
    ["WAPGrip"]       = {label = "Grip", attach_component='grip', slot="5-0", add_left = 42, add_top = 42},
    ["gun_vfx_eject"]       = {label = "Tint", attach_component='tint', slot="6-0", add_left = 42, add_top = -202},
}

GM.Inventory.WeaponAttachment.Weapons = { 
    { 
        name = 'weapon_pistol', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_PISTOL_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_PISTOL_CLIP_02'}, 
            {name = 'flashlight', hash = 'COMPONENT_AT_PI_FLSH'}, 
            {name = 'suppressor', hash = 'COMPONENT_AT_PI_SUPP_02'}, 
            {name = 'luxary_finish', hash = 'COMPONENT_PISTOL_VARMOD_LUXE'} 
        } 
    }, 
    { 
        name = 'weapon_combatpistol', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_COMBATPISTOL_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_COMBATPISTOL_CLIP_02'}, 
            {name = 'flashlight', hash = 'COMPONENT_AT_PI_FLSH'}, 
            {name = 'suppressor', hash = 'COMPONENT_AT_PI_SUPP'}, 
            {name = 'luxary_finish', hash = 'COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER'} 
        } 
    }, 
    { 
        name = 'weapon_appistol', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_APPISTOL_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_APPISTOL_CLIP_02'}, 
            {name = 'flashlight', hash = 'COMPONENT_AT_PI_FLSH'}, 
            {name = 'suppressor', hash = 'COMPONENT_AT_PI_SUPP'}, 
            {name = 'luxary_finish', hash = 'COMPONENT_APPISTOL_VARMOD_LUXE'} 
        } 
    }, 
    { 
        name = 'weapon_pistol50', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_PISTOL50_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_PISTOL50_CLIP_02'}, 
            {name = 'flashlight', hash = 'COMPONENT_AT_PI_FLSH'}, 
            {name = 'suppressor', hash = 'COMPONENT_AT_AR_SUPP_02'}, 
            {name = 'luxary_finish', hash = 'COMPONENT_PISTOL50_VARMOD_LUXE'} 
        } 
    }, 
    { 
        name = 'weapon_snspistol', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_SNSPISTOL_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_SNSPISTOL_CLIP_02'}, 
            {name = 'luxary_finish', hash = 'COMPONENT_SNSPISTOL_VARMOD_LOWRIDER'} 
        } 
    }, 
    { 
        name = 'weapon_heavypistol', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_HEAVYPISTOL_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_HEAVYPISTOL_CLIP_02'}, 
            {name = 'flashlight', hash = 'COMPONENT_AT_PI_FLSH'}, 
            {name = 'suppressor', hash = 'COMPONENT_AT_PI_SUPP'}, 
            {name = 'luxary_finish', hash = 'COMPONENT_HEAVYPISTOL_VARMOD_LUXE'} 
        } 
    }, 
    { 
        name = 'weapon_vintagepistol', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_VINTAGEPISTOL_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_VINTAGEPISTOL_CLIP_02'}, 
            {name = 'suppressor', hash = 'COMPONENT_AT_PI_SUPP'} 
        } 
    }, 
    { 
        name = 'weapon_machinepistol', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_MACHINEPISTOL_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_MACHINEPISTOL_CLIP_02'}, 
            {name = 'clip_drum', hash = 'COMPONENT_MACHINEPISTOL_CLIP_03'}, 
            {name = 'suppressor', hash = 'COMPONENT_AT_PI_SUPP'} 
        } 
    }, 
    { 
        name = 'weapon_smg', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_SMG_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_SMG_CLIP_02'}, 
            {name = 'clip_drum', hash = 'COMPONENT_SMG_CLIP_03'}, 
            {name = 'flashlight', hash = 'COMPONENT_AT_AR_FLSH'}, 
            {name = 'scope', hash = 'COMPONENT_AT_SCOPE_MACRO_02'}, 
            {name = 'suppressor', hash = 'COMPONENT_AT_PI_SUPP'}, 
            {name = 'luxary_finish', hash = 'COMPONENT_SMG_VARMOD_LUXE'} 
        } 
    }, 
    { 
        name = 'weapon_assaultsmg', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_ASSAULTSMG_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_ASSAULTSMG_CLIP_02'}, 
            {name = 'flashlight', hash = 'COMPONENT_AT_AR_FLSH'}, 
            {name = 'scope', hash = 'COMPONENT_AT_SCOPE_MACRO'}, 
            {name = 'suppressor', hash = 'COMPONENT_AT_AR_SUPP_02'}, 
            {name = 'luxary_finish', hash = 'COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER'} 
        } 
    }, 
    { 
        name = 'weapon_microsmg', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_MICROSMG_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_MICROSMG_CLIP_02'}, 
            {name = 'flashlight', hash = 'COMPONENT_AT_PI_FLSH'}, 
            {name = 'scope', hash = 'COMPONENT_AT_SCOPE_MACRO'}, 
            {name = 'suppressor', hash = 'COMPONENT_AT_AR_SUPP_02'}, 
            {name = 'luxary_finish', hash = 'COMPONENT_MICROSMG_VARMOD_LUXE'} 
        } 
    }, 
    { 
        name = 'weapon_minismg', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_MINISMG_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_MINISMG_CLIP_02'} 
        } 
    }, 
    { 
        name = 'weapon_combatpdw', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_COMBATPDW_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_COMBATPDW_CLIP_02'}, 
            {name = 'clip_drum', hash = 'COMPONENT_COMBATPDW_CLIP_03'}, 
            {name = 'flashlight', hash = 'COMPONENT_AT_AR_FLSH'}, 
            {name = 'grip', hash = 'COMPONENT_AT_AR_AFGRIP'}, 
            {name = 'scope', hash = 'COMPONENT_AT_SCOPE_SMALL'} 
        } 
    }, 
    { 
        name = 'weapon_pumpshotgun', 
        components = { 
            {name = 'flashlight', hash = 'COMPONENT_AT_AR_FLSH'}, 
            {name = 'suppressor', hash = 'COMPONENT_AT_SR_SUPP'}, 
            {name = 'luxary_finish', hash = 'COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER'} 
        } 
    }, 
    { 
        name = 'weapon_sawnoffshotgun', 
        components = { 
            {name = 'luxary_finish', hash = 'COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE'} 
        } 
    }, 
    { 
        name = 'weapon_assaultshotgun', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_ASSAULTSHOTGUN_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_ASSAULTSHOTGUN_CLIP_02'}, 
            {name = 'flashlight', hash = 'COMPONENT_AT_AR_FLSH'}, 
            {name = 'suppressor', hash = 'COMPONENT_AT_AR_SUPP'}, 
            {name = 'grip', hash = 'COMPONENT_AT_AR_AFGRIP'} 
        } 
    }, 
    { 
        name = 'weapon_bullpupshotgun', 
        components = { 
            {name = 'flashlight', hash = 'COMPONENT_AT_AR_FLSH'}, 
            {name = 'suppressor', hash = 'COMPONENT_AT_AR_SUPP_02'}, 
            {name = 'grip', hash = 'COMPONENT_AT_AR_AFGRIP'} 
        } 
    }, 
    { 
        name = 'weapon_heavyshotgun', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_HEAVYSHOTGUN_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_HEAVYSHOTGUN_CLIP_02'}, 
            {name = 'clip_drum', hash = 'COMPONENT_HEAVYSHOTGUN_CLIP_03'}, 
            {name = 'flashlight', hash = 'COMPONENT_AT_AR_FLSH'}, 
            {name = 'suppressor', hash = 'COMPONENT_AT_AR_SUPP_02'}, 
            {name = 'grip', hash = 'COMPONENT_AT_AR_AFGRIP'} 
        } 
    }, 
    { 
        name = 'weapon_assaultrifle', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_ASSAULTRIFLE_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_ASSAULTRIFLE_CLIP_02'}, 
            {name = 'clip_drum', hash = 'COMPONENT_ASSAULTRIFLE_CLIP_03'}, 
            {name = 'flashlight', hash = 'COMPONENT_AT_AR_FLSH'}, 
            {name = 'scope', hash = 'COMPONENT_AT_SCOPE_MACRO'}, 
            {name = 'suppressor', hash = 'COMPONENT_AT_AR_SUPP_02'}, 
            {name = 'grip', hash = 'COMPONENT_AT_AR_AFGRIP'}, 
            {name = 'luxary_finish', hash = 'COMPONENT_ASSAULTRIFLE_VARMOD_LUXE'} 
        } 
    }, 
    { 
        name = 'weapon_carbinerifle', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_CARBINERIFLE_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_CARBINERIFLE_CLIP_02'}, 
            {name = 'clip_box', hash = 'COMPONENT_CARBINERIFLE_CLIP_03'}, 
            {name = 'flashlight', hash = 'COMPONENT_AT_AR_FLSH'}, 
            {name = 'scope', hash = 'COMPONENT_AT_SCOPE_MEDIUM'}, 
            {name = 'suppressor', hash = 'COMPONENT_AT_AR_SUPP'}, 
            {name = 'grip', hash = 'COMPONENT_AT_AR_AFGRIP'}, 
            {name = 'luxary_finish', hash = 'COMPONENT_CARBINERIFLE_VARMOD_LUXE'} 
        } 
    }, 
    { 
        name = 'weapon_advancedrifle', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_ADVANCEDRIFLE_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_ADVANCEDRIFLE_CLIP_02'}, 
            {name = 'flashlight', hash = 'COMPONENT_AT_AR_FLSH'}, 
            {name = 'scope', hash = 'COMPONENT_AT_SCOPE_SMALL'}, 
            {name = 'suppressor', hash = 'COMPONENT_AT_AR_SUPP'}, 
            {name = 'luxary_finish', hash = 'COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE'} 
        }
    }, 
    { 
        name = 'weapon_specialcarbine', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_SPECIALCARBINE_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_SPECIALCARBINE_CLIP_02'}, 
            {name = 'clip_drum', hash = 'COMPONENT_SPECIALCARBINE_CLIP_03'}, 
            {name = 'flashlight', hash = 'COMPONENT_AT_AR_FLSH'}, 
            {name = 'scope', hash = 'COMPONENT_AT_SCOPE_MEDIUM'}, 
            {name = 'suppressor', hash = 'COMPONENT_AT_AR_SUPP_02'}, 
            {name = 'grip', hash = 'COMPONENT_AT_AR_AFGRIP'}, 
            {name = 'luxary_finish', hash = 'COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER'} 
        } 
    }, 
    { 
        name = 'weapon_bullpuprifle', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_BULLPUPRIFLE_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_BULLPUPRIFLE_CLIP_02'}, 
            {name = 'flashlight', hash = 'COMPONENT_AT_AR_FLSH'}, 
            {name = 'scope', hash = 'COMPONENT_AT_SCOPE_SMALL'}, 
            {name = 'suppressor', hash = 'COMPONENT_AT_AR_SUPP'}, 
            {name = 'grip', hash = 'COMPONENT_AT_AR_AFGRIP'}, 
            {name = 'luxary_finish', hash = 'COMPONENT_BULLPUPRIFLE_VARMOD_LOW'} 
        } 
    }, 
    { 
        name = 'weapon_compactrifle', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_COMPACTRIFLE_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_COMPACTRIFLE_CLIP_02'}, 
            {name = 'clip_drum', hash = 'COMPONENT_COMPACTRIFLE_CLIP_03'} 
        } 
    }, 
    { 
        name = 'weapon_mg', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_MG_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_MG_CLIP_02'}, 
            {name = 'scope', hash = 'COMPONENT_AT_SCOPE_SMALL_02'}, 
            {name = 'luxary_finish', hash = 'COMPONENT_MG_VARMOD_LOWRIDER'} 
        } 
    }, 
    { 
        name = 'weapon_combatmg', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_COMBATMG_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_COMBATMG_CLIP_02'}, 
            {name = 'scope', hash = 'COMPONENT_AT_SCOPE_MEDIUM'}, 
            {name = 'grip', hash = 'COMPONENT_AT_AR_AFGRIP'}, 
            {name = 'luxary_finish', hash = 'COMPONENT_COMBATMG_VARMOD_LOWRIDER'} 
        } 
    }, 
    { 
        name = 'weapon_gusenberg', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_GUSENBERG_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_GUSENBERG_CLIP_02'}, 
        } 
    }, 
    { 
        name = 'weapon_sniperrifle', 
        components = { 
            {name = 'scope', hash = 'COMPONENT_AT_SCOPE_LARGE'}, 
            {name = 'scope_advanced', hash = 'COMPONENT_AT_SCOPE_MAX'}, 
            {name = 'suppressor', hash = 'COMPONENT_AT_AR_SUPP_02'}, 
            {name = 'luxary_finish', hash = 'COMPONENT_SNIPERRIFLE_VARMOD_LUXE'} 
        } 
    }, 
    { 
        name = 'weapon_heavysniper', 
        components = { 
            {name = 'scope', hash = 'COMPONENT_AT_SCOPE_LARGE'}, 
            {name = 'scope_advanced', hash = 'COMPONENT_AT_SCOPE_MAX'} 
        } 
    }, 
    { 
        name = 'weapon_marksmanrifle', 
        components = { 
            {name = 'clip_default', hash = 'COMPONENT_MARKSMANRIFLE_CLIP_01'}, 
            {name = 'clip_extended', hash = 'COMPONENT_MARKSMANRIFLE_CLIP_02'}, 
            {name = 'flashlight', hash = 'COMPONENT_AT_AR_FLSH'}, 
            {name = 'scope', hash = 'COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM'}, 
            {name = 'suppressor', hash = 'COMPONENT_AT_AR_SUPP'}, 
            {name = 'grip', hash = 'COMPONENT_AT_AR_AFGRIP'}, 
            {name = 'luxary_finish', hash = 'COMPONENT_MARKSMANRIFLE_VARMOD_LUXE'} 
        } 
    } 
}

GM.Inventory.Weapons = GM.Inventory.WeaponAttachment.Weapons

GM.Inventory.Functions.Server = {
    GetPlayer = function(source)
        return ESX.GetPlayerFromId(source)
    end,

    GetName                         = function ( source )
        return GM.Inventory.Functions.Server.GetPlayer( source ).identifier 
    end,

    GetIdentifier                   = function(source)
        if GM.Inventory.Functions.Server.GetPlayer(source) == nil then
            print("^1Empty Identifier detected!\n^7It's causes from framework or it wasn\'t important stuff.\nIf inventory doesn\'t works resetup the inventory!")
            return nil
        else
            local identifier = GM.Inventory.Functions.Server.GetPlayer( source ).identifier
            local new = identifier
            if string.match(identifier, ":") then
                new = identifier:gsub(":", "-")
            end
            return new
        end
    end,

    GetPlayerFromUniqueValue        = function(id)
        return ESX.GetPlayerFromIdentifier(id)
    end,
}
GM.Inventory.VehiclesInventory = {}
GM.Inventory.VehiclesInventory.Models = {
    ["ASEA"] = {
        ["glovebox"] = "hhm3eomwf3cygww8e6kcgpt6",
    }
}
GM.Inventory.VehiclesInventory.Classes = {
    [0] = {
        ["trunk"] = "coks1u2elb452g0hsd25w6if",
    },
    [1] = {
        ["trunk"] = "a584yw9439bwluc1voo2x1rm"
    },
    [2] = {
        ["trunk"] = "zpop64fqra28l9tnle839emg"
    },
    [3] = {
        ["trunk"] = "0vh1lnz1a7ojflbvoul4yaz0"
    },
    [4] = {
        ["trunk"] = "ar9kya72yoirzu2cfwr8hz85"
    },
    [5] = {
        ["trunk"] = "yexq0qwrv2fsnjot0l0tzmom"
    },
    [6] = {
        ["trunk"] = "zqohzbplr45rooxm81e655vz"
    },
    [7] = {
        ["trunk"] = "r9vfk2316yp7uoz5z4d7k4pr"
    },
    [8] = {
        ["trunk"] = "dcapvociisv5u7drc611yyvq"
    },
    [9] = {
        ["trunk"] = "p70ufhnlm9ai0f42v7w85nj0"
    },
    [12] = {
        ["trunk"] = "p70ufhnlm9ai0f42v7w85nj0"
    },
    [13] = {
        ["trunk"] = "nfi5z2p26m6e4ewpuxkjh2la"
    },
    [14] = {
        ["trunk"] = "m3jpk09d64ij0r6px1g80pcy"
    },
    [15] = {
        ["trunk"] = "irn05edljdp6hvamcdgm6tgz"
    },
    [16] = {
        ["trunk"] = "e5z2xps7t2km3nhrz6lufaob"
    },
}

GM.Inventory.Items = {
    ["hhm3eomwf3cygww8e6kcgpt6"] = {
        ["item"] = {
            _id = "hhm3eomwf3cygww8e6kcgpt6",
            _name = "zort_port_rig",
            _parent = "",
            _type = "Node",
            _data = {
                Name = "Glove Box",
                Label = "Glove Box",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_generic",
                Type = "container",
                MaxStack = 1,
                Grids = {
                    [0] = {
                        _name ="1",
                        _id ="61bc85697113f767765c7fsd",
                        _parent ="hhm3eomwf3cygww8e6kcgpt6",
                        cellsH = 5,
                        cellsV = 10,
                    },
                },
                Itemimage = "",
            }
        }
    },

    ["zfrko4gdc7h0cg8cd9xfsjkk"] = {
        ["item"] = {
            _id = "zfrko4gdc7h0cg8cd9xfsjkk",
            _name = "Second Inventory",
            _parent = "",
            _type = "Node",
            _data = {
                Name = "Second Inventory",
                Label = "Second Inventory",
                Description = "",
                Width = 1,
                Height = 1,
                Weight =  0.0,
                Backgroundcolor =  "blue",
                ExamineTime =  0,
                ItemSound =  "",
                Type =  "container",
                MaxStack =  1,
                Grids =  {},
            }
        }
    },

    ["n6rko4gdc7h0cg8cd9xfsjkk"] = {
        ["item"] = {
            _id = "n6rko4gdc7h0cg8cd9xfsjkk",
            _name = "Second Inventory",
            _parent = "",
            _type = "Node",
            _data = {
                Name = "Second Inventory",
                Label = "Second Inventory",
                Description = "",
                Width = 1,
                Height = 1,
                Weight =  0.0,
                Backgroundcolor =  "blue",
                ExamineTime =  0,
                ItemSound =  "",
                Type =  "container",
                MaxStack =  1,
                Grids =  {
                    [0] = {
                        _name = "backpack",
                        _id = "61gd85697113f767765c7fsd",
                        _parent = "n6rko4gdc7h0cg8cd9xfsjkk",
                        cellsH =  1,
                        cellsV =  1,
                    },
                    [1] = {
                        _name = "rig",
                        _id = "61zy85697113f767765c7fgc",
                        _parent = "n6rko4gdc7h0cg8cd9xfsjkk",
                        cellsH =  1,
                        cellsV =  1,
                    },
                    [3] = {
                        _name = "firstweapon",
                        _id = "gclf85697113f767765c7fdd",
                        _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
                        cellsH =  1,
                        cellsV =  1,
                    },
                    [4] = {
                        _name = "secondweapon",
                        _id = "lclf85697113f767765c7fdd",
                        _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
                        cellsH =  1,
                        cellsV =  1,
                    },
                },
            }
        }
    },

    ["c6jgbwjs9tc2vb8gtpwe7rywe"] =  {
        ["item"] =  {
            _id =  "c6jgbwjs9tc2vb8gtpwe7rywe",
            _name =  "Player Inventory",
            _parent =  "",
            _type =  "Node",
            _data =  {
                Name =  "Player Inventory",
                Label =  "Player Inventory",
                Description =  "",
                Width =  1,
                Height =  1,
                Weight =  0.0,
                Backgroundcolor =  "blue",
                ExamineTime =  0,
                ItemSound =  "",
                Type =  "container",
                MaxStack =  1,
                Grids =  {
                    [0] = {
                        _name = "backpack",
                        _id = "61zd85697113f767765c7fsd",
                        _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
                        cellsH =  1,
                        cellsV =  1,
                    },
                    [1] = {
                        _name = "rig",
                        _id = "61jy85697113f767765c7fgc",
                        _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
                        cellsH =  1,
                        cellsV =  1,
                    },
                    [2] = {
                        _name = "shirts",
                        _id = "61lf85697113f767765c7fdd",
                        _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
                        cellsH =  1,
                        cellsV =  1,
                    },
                    [3] = {
                        _name = "firstweapon",
                        _id = "gclf85697113f767765c7fdd",
                        _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
                        cellsH =  1,
                        cellsV =  1,
                    },
                    [4] = {
                        _name = "secondweapon",
                        _id = "lclf85697113f767765c7fdd",
                        _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
                        cellsH =  1,
                        cellsV =  1,
                    },

                    [5] = {
                        _name = "pants",
                        _id = "61lf8569711yf767765c7fdd",
                        _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
                        cellsH =  1,
                        cellsV =  1,
                    },
                    [6] = {
                        _name = "top",
                        _id = "61lf85697113f767765cvfdd",
                        _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
                        cellsH =  1,
                        cellsV =  1,
                    },
                    [7] = {
                        _name = "shoes",
                        _id = "61lf85697113f767765cpfdd",
                        _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
                        cellsH =  1,
                        cellsV =  1,
                    },
                    [8] = {
                        _name = "mask",
                        _id = "61lf85697113f767765cufdd",
                        _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
                        cellsH =  1,
                        cellsV =  1,
                    },
                    [9] = {
                        _name = "gloves",
                        _id = "61lf85697113f767765cpfdd",
                        _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
                        cellsH =  1,
                        cellsV =  1,
                    },
                    [10] = {
                        _name = "hat",
                        _id = "61lf85697113f767765cufdd",
                        _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
                        cellsH =  1,
                        cellsV =  1,
                    },

                    [11] = {
                        _name = "glasses",
                        _id = "61lf85697113f767765cpfdd",
                        _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
                        cellsH =  1,
                        cellsV =  1,
                    },
                    [12] = {
                        _name = "ear",
                        _id = "61lf85697113f767765cufdd",
                        _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
                        cellsH =  1,
                        cellsV =  1,
                    },
                    [13] = {
                        _name = "bracelet",
                        _id = "61lf85697113f767765cpfdd",
                        _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
                        cellsH =  1,
                        cellsV =  1,
                    },
                    [14] = {
                        _name = "watch",
                        _id = "61lf85697113f767765cufdd",
                        _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
                        cellsH =  1,
                        cellsV =  1,
                    },
                },
            }
        }
    },

    ["pbep0kj5kinr4yuvrlq8x2p9"] =  {
        ["item"] =  {
            _id =  "pbep0kj5kinr4yuvrlq8x2p9",
            _name =  "Pocket Inventory",
            _parent =  "c6jgbwjs9tc2vb8gtpwe7rywe",
            _type =  "Item",
            _data =  {
                Name =  "Poches",
                Label =  "Poches",
                Description =  "",
                Width =  1,
                Height =  1,
                Weight =  0.0,
                Backgroundcolor =  "blue",
                ExamineTime =  2.5,
                ItemSound =  "gear_generic",
                Type =  "container",
                MaxStack =  1,
                Grids =  {
                    [0] = {
                        _name = "pckt1",
                        _id = "61bc85697113f767765c7fsd",
                        _parent = "pbep0kj5kinr4yuvrlq8x2p9",
                        cellsH =  1,
                        cellsV =  1,
                    },
                    [1] = {
                        _name = "pckt2",
                        _id = "61bc85697113f767765c7fgc",
                        _parent = "pbep0kj5kinr4yuvrlq8x2p9",
                        cellsH =  1,
                        cellsV =  1,
                    },
                    [2] = {
                        _name = "pckt3",
                        _id = "61bc85697113f767765c7fdd",
                        _parent = "pbep0kj5kinr4yuvrlq8x2p9",
                        cellsH =  1,
                        cellsV =  1,
                    },
                    [3] = {
                        _name = "pckt4",
                        _id = "61bc85697113f767765cgcdd",
                        _parent = "pbep0kj5kinr4yuvrlq8x2p9",
                        cellsH =  1,
                        cellsV =  1,
                    },
                    [4] = {
                        _name = "pckt5",
                        _id = "61bc85697113f767765cgcff",
                        _parent = "pbep0kj5kinr4yuvrlq8x2p9",
                        cellsH =  1,
                        cellsV =  2,
                    },
                },
            }
        }
    },

    ["top"] = {
        ["item"] = {
            _id = "top",
            _name = "clothing_top",
            _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
            _type = "Item",
            _data = {
                Name = "Shirt",
                AttachableSlot = "top",
                Label = "Shirt",
                Description = "",
                Width = 1,
                Height = 2,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_backpack",
                Type = "Clothing",
                MaxStack = 1,
                Grids = {},
                Itemimage = "icons/top.png",
            }
        }
    },

    ["shirts"] = {
        ["item"] = {
            _id = "shirts",
            _name = "clothing_shirts",
            _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
            _type = "Item",
            _data = {
                Name = "T-Shirt",
                AttachableSlot = "shirts",
                Label = "T-Shirt",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_backpack",
                Type = "Clothing",
                MaxStack = 1,
                Grids = {},
                Itemimage = "icons/shirt.png",
            }
        }
    },

    ["pants"] = {
        ["item"] = {
            _id = "pants",
            _name = "clothing_pants",
            _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
            _type = "Item",
            _data = {
                Name = "Pants",
                AttachableSlot = "pants",
                Label = "Pants",
                Description = "",
                Width = 1,
                Height = 2,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_backpack",
                Type = "Clothing",
                MaxStack = 1,
                Grids = {},
                Itemimage = "icons/pants.png",
            }
        }
    },

    ["shoes"] = {
        ["item"] = {
            _id = "shoes",
            _name = "clothing_shoes",
            _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
            _type = "Item",
            _data = {
                Name = "Shoes",
                AttachableSlot = "shoes",
                Label = "Shoes",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_backpack",
                Type = "Clothing",
                MaxStack = 1,
                Grids = {},
                Itemimage = "icons/shoes.png",
            }
        }
    },

    ["mask"] = {
        ["item"] = {
            _id = "mask",
            _name = "clothing_mask",
            _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
            _type = "Item",
            _data = {
                Name = "Mask",
                AttachableSlot = "mask",
                Label = "Mask",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_backpack",
                Type = "Clothing",
                MaxStack = 1,
                Grids = {},
                Itemimage = "icons/mask.png",
            }
        }
    },

    ["gloves"] = {
        ["item"] = {
            _id = "gloves",
            _name = "clothing_gloves",
            _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
            _type = "Item",
            _data = {
                Name = "Gloves",
                AttachableSlot = "gloves",
                Label = "Gloves",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_backpack",
                Type = "Clothing",
                MaxStack = 1,
                Grids = {},
                Itemimage = "icons/gloves.png",
            }
        }
    },

    ["hat"] = {
        ["item"] = {
            _id = "hat",
            _name = "clothing_hat",
            _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
            _type = "Item",
            _data = {
                Name = "Hat",
                AttachableSlot = "hat",
                Label = "Hat",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_backpack",
                Type = "Clothing",
                MaxStack = 1,
                Grids = {},
                Itemimage = "icons/hat.png",
            }
        }
    },

    ["ear"] = {
        ["item"] = {
            _id = "ear",
            _name = "clothing_ear",
            _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
            _type = "Item",
            _data = {
                Name = "Ear",
                AttachableSlot = "ear",
                Label = "Earrings",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_backpack",
                Type = "Clothing",
                MaxStack = 1,
                Grids = {},
                Itemimage = "icons/ear.png",
            }
        }
    },

    ["watch"] = {
        ["item"] = {
            _id = "watch",
            _name = "clothing_watch",
            _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
            _type = "Item",
            _data = {
                Name = "Watches",
                AttachableSlot = "watch",
                Label = "Watches",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_backpack",
                Type = "Clothing",
                MaxStack = 1,
                Grids = {},
                Itemimage = "icons/watch.png",
            }
        }
    },

    ["glasses"] = {
        ["item"] = {
            _id = "glasses",
            _name = "clothing_glasses",
            _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
            _type = "Item",
            _data = {
                Name = "Glasses",
                AttachableSlot = "glasses",
                Label = "Glasses",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_backpack",
                Type = "Clothing",
                MaxStack = 1,
                Grids = {},
                Itemimage = "icons/glasses.png",
            }
        }
    },

    ["bracelet"] = {
        ["item"] = {
            _id = "bracelet",
            _name = "clothing_bracelet",
            _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
            _type = "Item",
            _data = {
                Name = "Bracelet",
                AttachableSlot = "bracelet",
                Label = "Bracelet",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_backpack",
                Type = "Clothing",
                MaxStack = 1,
                Grids = {},
                Itemimage = "icons/bracelet.png",
            }
        }
    },

    ["rig1"] = {
        ["item"] = {
            _id = "rig1",
            _name = "military_rig",
            _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
            _type = "Item",
            _data = {
                Name = "Tactical Rig",
                AttachableSlot = "rig",
                Label = "Military Rig",
                Description = "",
                Width = 4,
                Height = 3,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_backpack",
                Type = "container",
                MaxStack = 1,
                Grids = {
                    [0] = {
                        _name ="tl_pouch",
                        _id ="tr_1",
                        _parent ="rig1",
                        cellsH = 2,
                        cellsV = 2,
                    },
                    [1] = {
                        _name ="tr_pouch1",
                        _id ="tr_2",
                        _parent ="rig1",
                        cellsH = 2,
                        cellsV = 1,
                    },
                    [2] = {
                        _name ="tr_pouch2",
                        _id ="tr_2",
                        _parent ="rig1",
                        cellsH = 2,
                        cellsV = 1,
                    },
                    [3] = {
                        _name ="b_pouch1",
                        _id ="tr_3",
                        _parent ="rig1",
                        cellsH = 2,
                        cellsV = 1,
                    },
                    [4] = {
                        _name ="b_pouch2",
                        _id ="tr_4",
                        _parent ="rig1",
                        cellsH = 2,
                        cellsV = 1,
                    },
                    [5] = {
                        _name ="b_pouch3",
                        _id ="tr_5",
                        _parent ="rig1",
                        cellsH = 2,
                        cellsV = 1,
                    },
                    [6] = {
                        _name ="b_pouch4",
                        _id ="tr_6",
                        _parent ="rig1",
                        cellsH = 2,
                        cellsV = 1,
                    },
                },
                Itemimage = "icons/armor.png",
            }
        }
    },

    ["bag1"] = {
        ["item"] = {
            _id = "bag1",
            _name = "sport_backpack",
            _parent = "c6jgbwjs9tc2vb8gtpwe7rywe",
            _type = "Item",
            _data = {
                Name = "Sac à dos",
                AttachableSlot = "backpack",
                Label = "Sport Bag",
                Description = "",
                Width = 4,
                Height = 3,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_backpack",
                Type = "container",
                MaxStack = 1,
                Grids = {
                    [0] = {
                        _name ="1",
                        _id ="61bc85697113f767765c7fsd",
                        _parent ="bag1",
                        cellsH = 4,
                        cellsV = 4,
                    },
                    [1] = {
                        _name ="2",
                        _id ="61bc85697113f767765c7fgc",
                        _parent ="bag1",
                        cellsH = 1,
                        cellsV = 4,
                    },
                    [2] = {
                        _name ="3",
                        _id ="61bc85697113f767765c7fdd",
                        _parent ="bag1",
                        cellsH = 1,
                        cellsV = 4,
                    },
                },
                Itemimage = "icons/bag.png",
            }
        }
    },

    ["weapon_case"] = {
        ["item"] = {
            ["_id"] = "weapon_case",
            ["_parent"] = "",
            ["_name"] = "case_weapon_case",
            ["_data"] = {
                ["ExamineTime"] = 1.0,
                ["Rarity"] = "common",
                ["Label"] = "Weapon Case",
                ["MaxStack"] = 1,
                ["Itemimage"] = "icons/weapon_case.png",
                ["Type"] = "container",
                ["Backgroundcolor"] = "black",
                ["Description"] = "It is very fragile, watch out",
                ["Name"] = "weapon_case",
                ["Weight"] = 2.5,
                ["ItemSound"] = "gear_generic",
                ["Height"] = 2,
                ["Width"] = 4,
                restrictedItems = {},
                authorizedCategory = {
                    ["Weapon"] = true
                }, 
                authorizedItems = {},
                Grids = {
                    [0] = {
                        _name ="1",
                        _id ="61bc85697113f767765c7fsd",
                        _parent ="qfjj7h3sb456b2z320vlamvu",
                        cellsH = 7,
                        cellsV = 8,
                    },
                }
            },
            ["_type"] = "Item"
        }
    },

    ["coks1u2elb452g0hsd25w6if"] = {    -- TRUNK CLASS 0
        ["item"] = {
            _id = "coks1u2elb452g0hsd25w6if",
            _name = "zort_port_rig",
            _parent = "",
            _type = "Node",
            _data = {
                Name = "Trunk",
                Label = "Glove Box",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_generic",
                Type = "container",
                MaxStack = 1,
                Grids = {
                    [0] = {
                        _name ="1",
                        _id ="61bc85697113f767765c7fsd",
                        _parent ="coks1u2elb452g0hsd25w6if",
                        cellsH = 12,
                        cellsV = 5,
                    },
                },
                Itemimage = "",
            }
        }
    },
    ["a584yw9439bwluc1voo2x1rm"] = {    -- TRUNK CLASS 1
        ["item"] = {
            _id = "a584yw9439bwluc1voo2x1rm",
            _name = "zort_port_rig",
            _parent = "",
            _type = "Node",
            _data = {
                Name = "Trunk",
                Label = "Trunk",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_generic",
                Type = "container",
                MaxStack = 1,
                Grids = {
                    [0] = {
                        _name ="1",
                        _id ="61bc85697113f767765c7fsd",
                        _parent ="a584yw9439bwluc1voo2x1rm",
                        cellsH = 15,
                        cellsV = 6,
                    },
                },
                Itemimage = "",
            }
        }
    },
    ["zpop64fqra28l9tnle839emg"] = {    -- TRUNK CLASS 2
        ["item"] = {
            _id = "zpop64fqra28l9tnle839emg",
            _name = "zort_port_rig",
            _parent = "",
            _type = "Node",
            _data = {
                Name = "Trunk",
                Label = "Trunk",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_generic",
                Type = "container",
                MaxStack = 1,
                Grids = {
                    [0] = {
                        _name ="1",
                        _id ="61bc85697113f767765c7fsd",
                        _parent ="zpop64fqra28l9tnle839emg",
                        cellsH = 17,
                        cellsV = 6,
                    },
                },
                Itemimage = "",
            }
        }
    },
    ["0vh1lnz1a7ojflbvoul4yaz0"] = {    -- TRUNK CLASS 3
        ["item"] = {
            _id = "0vh1lnz1a7ojflbvoul4yaz0",
            _name = "zort_port_rig",
            _parent = "",
            _type = "Node",
            _data = {
                Name = "Trunk",
                Label = "Trunk",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_generic",
                Type = "container",
                MaxStack = 1,
                Grids = {
                    [0] = {
                        _name ="1",
                        _id ="61bc85697113f767765c7fsd",
                        _parent ="0vh1lnz1a7ojflbvoul4yaz0",
                        cellsH = 5,
                        cellsV = 10,
                    },
                },
                Itemimage = "",
            }
        }
    },
    ["ar9kya72yoirzu2cfwr8hz85"] = {    -- TRUNK CLASS 4
        ["item"] = {
            _id = "ar9kya72yoirzu2cfwr8hz85",
            _name = "zort_port_rig",
            _parent = "",
            _type = "Node",
            _data = {
                Name = "Trunk",
                Label = "Trunk",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_generic",
                Type = "container",
                MaxStack = 1,
                Grids = {
                    [0] = {
                        _name ="1",
                        _id ="61bc85697113f767765c7fsd",
                        _parent ="ar9kya72yoirzu2cfwr8hz85",
                        cellsH = 9,
                        cellsV = 3,
                    },
                },
                Itemimage = "",
            }
        }
    },
    ["yexq0qwrv2fsnjot0l0tzmom"] = {    -- TRUNK CLASS 5
        ["item"] = {
            _id = "yexq0qwrv2fsnjot0l0tzmom",
            _name = "zort_port_rig",
            _parent = "",
            _type = "Node",
            _data = {
                Name = "Trunk",
                Label = "Trunk",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_generic",
                Type = "container",
                MaxStack = 1,
                Grids = {
                    [0] = {
                        _name ="1",
                        _id ="61bc85697113f767765c7fsd",
                        _parent ="yexq0qwrv2fsnjot0l0tzmom",
                        cellsH = 6,
                        cellsV = 2,
                    },
                },
                Itemimage = "",
            }
        }
    },
    ["zqohzbplr45rooxm81e655vz"] = {    -- TRUNK CLASS 6
        ["item"] = {
            _id = "zqohzbplr45rooxm81e655vz",
            _name = "zort_port_rig",
            _parent = "",
            _type = "Node",
            _data = {
                Name = "Trunk",
                Label = "Trunk",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_generic",
                Type = "container",
                MaxStack = 1,
                Grids = {
                    [0] = {
                        _name ="1",
                        _id ="61bc85697113f767765c7fsd",
                        _parent ="zqohzbplr45rooxm81e655vz",
                        cellsH = 6,
                        cellsV = 2,
                    },
                },
                Itemimage = "",
            }
        }
    },
    ["r9vfk2316yp7uoz5z4d7k4pr"] = {    -- TRUNK CLASS 7
        ["item"] = {
            _id = "r9vfk2316yp7uoz5z4d7k4pr",
            _name = "zort_port_rig",
            _parent = "",
            _type = "Node",
            _data = {
                Name = "Trunk",
                Label = "Trunk",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_generic",
                Type = "container",
                MaxStack = 1,
                Grids = {
                    [0] = {
                        _name ="1",
                        _id ="61bc85697113f767765c7fsd",
                        _parent ="r9vfk2316yp7uoz5z4d7k4pr",
                        cellsH = 4,
                        cellsV = 2,
                    },
                },
                Itemimage = "",
            }
        }
    },
    ["dcapvociisv5u7drc611yyvq"] = {    -- TRUNK CLASS 8
        ["item"] = {
            _id = "dcapvociisv5u7drc611yyvq",
            _name = "zort_port_rig",
            _parent = "",
            _type = "Node",
            _data = {
                Name = "Trunk",
                Label = "Trunk",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_generic",
                Type = "container",
                MaxStack = 1,
                Grids = {
                    [0] = {
                        _name ="1",
                        _id ="61bc85697113f767765c7fsd",
                        _parent ="dcapvociisv5u7drc611yyvq",
                        cellsH = 2,
                        cellsV = 2,
                    },
                },
                Itemimage = "",
            }
        }
    },
    ["p70ufhnlm9ai0f42v7w85nj0"] = {    -- TRUNK CLASS 9/12
        ["item"] = {
            _id = "p70ufhnlm9ai0f42v7w85nj0",
            _name = "zort_port_rig",
            _parent = "",
            _type = "Node",
            _data = {
                Name = "Trunk",
                Label = "Trunk",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_generic",
                Type = "container",
                MaxStack = 1,
                Grids = {
                    [0] = {
                        _name ="1",
                        _id ="61bc85697113f767765c7fsd",
                        _parent ="p70ufhnlm9ai0f42v7w85nj0",
                        cellsH = 24,
                        cellsV = 12,
                    },
                },
                Itemimage = "",
            }
        }
    },
    ["nfi5z2p26m6e4ewpuxkjh2la"] = {    -- TRUNK CLASS 13
        ["item"] = {
            _id = "nfi5z2p26m6e4ewpuxkjh2la",
            _name = "zort_port_rig",
            _parent = "",
            _type = "Node",
            _data = {
                Name = "Trunk",
                Label = "Trunk",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_generic",
                Type = "container",
                MaxStack = 1,
                Grids = {
                    [0] = {
                        _name ="1",
                        _id ="61bc85697113f767765c7fsd",
                        _parent ="nfi5z2p26m6e4ewpuxkjh2la",
                        cellsH = 1,
                        cellsV = 1,
                    },
                },
                Itemimage = "",
            }
        }
    },
    ["m3jpk09d64ij0r6px1g80pcy"] = {    -- TRUNK CLASS 14
        ["item"] = {
            _id = "m3jpk09d64ij0r6px1g80pcy",
            _name = "zort_port_rig",
            _parent = "",
            _type = "Node",
            _data = {
                Name = "Trunk",
                Label = "Trunk",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_generic",
                Type = "container",
                MaxStack = 1,
                Grids = {
                    [0] = {
                        _name ="1",
                        _id ="61bc85697113f767765c7fsd",
                        _parent ="m3jpk09d64ij0r6px1g80pcy",
                        cellsH = 24,
                        cellsV = 12,
                    },
                },
                Itemimage = "",
            }
        }
    },
    ["irn05edljdp6hvamcdgm6tgz"] = {    -- TRUNK CLASS 15
        ["item"] = {
            _id = "irn05edljdp6hvamcdgm6tgz",
            _name = "zort_port_rig",
            _parent = "",
            _type = "Node",
            _data = {
                Name = "Trunk",
                Label = "Trunk",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_generic",
                Type = "container",
                MaxStack = 1,
                Grids = {
                    [0] = {
                        _name ="1",
                        _id ="61bc85697113f767765c7fsd",
                        _parent ="irn05edljdp6hvamcdgm6tgz",
                        cellsH = 26,
                        cellsV = 14,
                    },
                },
                Itemimage = "",
            }
        }
    },
    ["e5z2xps7t2km3nhrz6lufaob"] = {    -- TRUNK CLASS 16
        ["item"] = {
            _id = "e5z2xps7t2km3nhrz6lufaob",
            _name = "zort_port_rig",
            _parent = "",
            _type = "Node",
            _data = {
                Name = "Trunk",
                Label = "Trunk",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_generic",
                Type = "container",
                MaxStack = 1,
                Grids = {
                    [0] = {
                        _name ="1",
                        _id ="61bc85697113f767765c7fsd",
                        _parent ="e5z2xps7t2km3nhrz6lufaob",
                        cellsH = 64,
                        cellsV = 10,
                    },
                },
                Itemimage = "",
            }
        }
    },
    ["qfjj7h3sb456b2z320vlamvu"] = {    -- EMPTY
        ["item"] = {
            _id = "qfjj7h3sb456b2z320vlamvu",
            _name = "zort_port_rig",
            _parent = "",
            _type = "Node",
            _data = {
                Name = "Trunk",
                Label = "Trunk",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_generic",
                Type = "container",
                MaxStack = 1,
                Grids = {
                    [0] = {
                        _name ="1",
                        _id ="61bc85697113f767765c7fsd",
                        _parent ="qfjj7h3sb456b2z320vlamvu",
                        cellsH = 1,
                        cellsV = 1,
                    },
                },
                Itemimage = "",
            }
        }
    },
    ["b6riv7imc527u8r853clpy5j"] = {    -- DROP INVENTORY
        ["item"] = {
            _id = "b6riv7imc527u8r853clpy5j",
            _name = "zort_port_rig",
            _parent = "",
            _type = "Node",
            _data = {
                Name = "Inventaire proximité",
                Label = "Inventaire proximité",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_generic",
                Type = "container",
                MaxStack = 1,
                Grids = {
                    [0] = {
                        _name ="1",
                        _id ="61bc85697113f767765c7fsd",
                        _parent ="b6riv7imc527u8r853clpy5j",
                        cellsH = 30,
                        cellsV = 10,
                    },
                },
                Itemimage = "",
            }
        }
    },

    ["custom_inventory"] = {    -- DROP INVENTORY
        ["item"] = {
            _id = "custom_inventory",
            _name = "inv_custom",
            _parent = "",
            _type = "Node",
            _data = {
                Name = "Custom Inventory",
                Label = "Custom Inventory",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 1.5,
                ExamineTime = 3.0,
                Backgroundcolor = "black",
                ItemSound = "gear_generic",
                Type = "container",
                MaxStack = 1,
                Grids = {
                    [0] = {
                        _name ="1",
                        _id ="custom_inventory_grid",
                        _parent ="custom_inventory",
                        cellsH = 30,
                        cellsV = 10,
                    },
                },
                Itemimage = "",
            }
        }
    },

    ["weapon_pistol"] = {
        ["item"] = {
            _id = "weapon_pistol",
            _name = "weapon_pistol",
            _parent = "",
            _type = "Item",
            _data = {
                Name = "Weapon Pistol",
                Label = "Weapon Pistol",
                Description = "",
                Width = 2,
                Height = 1,
                Weight = 0.8,
                ExamineTime = 1.0,
                Backgroundcolor = "black",
                ItemSound = "weap_pistol",
                Itemimage = "icons/weapon_pistol.png",
                Type = "Weapon",
                MaxStack = 1,
            }
        }
    },

    ["suppressor"] = {
        ["item"] = {
            _id = "suppressor",
            _name = "suppressor",
            _parent = "",
            _type = "Item",
            _data = {
                Name = "Suppressor",
                Label = "Suppressor",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 0.8,
                ExamineTime = 1.0,
                Backgroundcolor = "black",
                ItemSound = "weap_pistol",
                Itemimage = "icons/pistol_suppressor.png",
                Type = "Attachment",
                MaxStack = 1,
            }
        }
    },
    
    ["flashlight"] = {
        ["item"] = {
            _id = "flashlight",
            _name = "flashlight",
            _parent = "",
            _type = "Item",
            _data = {
                Name = "Flashlight",
                Label = "Flashlight",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 0.8,
                ExamineTime = 1.0,
                Backgroundcolor = "black",
                ItemSound = "weap_pistol",
                Itemimage = "icons/smg_flashlight.png",
                Type = "Attachment",
                MaxStack = 1,
            }
        }
    },

    ["clip_extended"] = {
        ["item"] = {
            _id = "clip_extended",
            _name = "clip_extended",
            _parent = "",
            _type = "Item",
            _data = {
                Name = "Clip Extended",
                Label = "Clip Extended",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 0.8,
                ExamineTime = 1.0,
                Backgroundcolor = "black",
                ItemSound = "weap_pistol",
                Itemimage = "icons/pistol_extendedclip.png",
                Type = "Attachment",
                MaxStack = 1,
            }
        }
    },

    ["clip_drum"] = {
        ["item"] = {
            _id = "clip_drum",
            _name = "clip_drum",
            _parent = "",
            _type = "Item",
            _data = {
                Name = "Clip Drum",
                Label = "Clip Drum",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 0.8,
                ExamineTime = 1.0,
                Backgroundcolor = "black",
                ItemSound = "weap_pistol",
                Itemimage = "icons/rifle_drummag.png",
                Type = "Attachment",
                MaxStack = 1,
            }
        }
    },

    ["scope"] = {
        ["item"] = {
            _id = "scope",
            _name = "scope",
            _parent = "",
            _type = "Item",
            _data = {
                Name = "Scope",
                Label = "Scope",
                Description = "",
                Width = 1,
                Height = 1,
                Weight = 0.8,
                ExamineTime = 1.0,
                Backgroundcolor = "black",
                ItemSound = "weap_pistol",
                Itemimage = "icons/smg_scope.png",
                Type = "Attachment",
                MaxStack = 1,
            }
        }
    },

    ["pistol_ammo"] = {
        ["item"] = {
            ["_parent"] = "",
            ["_data"] = {
                ["Itemimage"] = "icons/pistol_ammo.png",
                ["Width"] = 1,
                ["MaxStack"] = 20,
                ["Label"] = "9MM",
                ["Name"] = "pistol_ammo",
                ["Weight"] = 0.3,
                ["Type"] = "Item",
                ["Backgroundcolor"] = "black",
                ["Description"] = "Munitions pour pistolet",
                ["ExamineTime"] = 1.0,
                ["Rarity"] = "common",
                ["ItemSound"] = "gear_generic",
                ["Height"] = 1
            },
            ["_id"] = "pistol_ammo",
            ["_type"] = "Item",
            ["_name"] = "item_pistol_ammo"
        }
    },
}