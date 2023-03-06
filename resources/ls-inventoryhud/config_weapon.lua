Config.ReloadTime = math.random(4000, 6000)

Config.DurabilityBlockedWeapons = {
    "weapon_stungun",
    "weapon_nightstick",
    "weapon_flashlight",
    "weapon_unarmed",
}

Config.WeaponList = {
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

Config.DurabilityMultiplier = {
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

Config.WeaponRepairPoints = {
    [1] = {
        coords = vector3(964.02, -1267.41, 34.97),
        IsRepairing = false,
        RepairingData = {},
    }
}

Config.WeaponRepairCosts = {
    ["pistol"] = 1000,
    ["smg"] = 3000,
    ["mg"] = 4000,
    ["rifle"] = 5000,
    ["sniper"] = 7000,
}

Config.WeaponAttachment = {}
Config.WeaponAttachment.Bones = {
    ["WAPClip"]         = {label = "Magazine", attach_component='clip', slot="0-0", add_left = 42, add_top = 42},
    ["Gun_GripR"]       = {label = "Finish", attach_component='luxary_finish', slot="1-0", add_left = 42, add_top = 42},
    ["WAPSupp"]      = {label = "Muzzle", attach_component='suppressor', slot="2-0", add_left = 42, add_top = -202},
    ["WAPFlshLasr"]         = {label = "Flashlight", attach_component='flashlight', slot="3-0", add_left = 45, add_top = 42},
    ["WAPScop"]         = {label = "Scope", attach_component='scope', slot="4-0", add_left = 42, add_top = 42},
    ["WAPGrip"]       = {label = "Grip", attach_component='grip', slot="5-0", add_left = 42, add_top = 42},
    ["gun_vfx_eject"]       = {label = "Tint", attach_component='tint', slot="6-0", add_left = 42, add_top = -202},
}

Config.WeaponAttachment.Weapons = { 
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

Config.Weapons = Config.WeaponAttachment.Weapons
Config.WeaponAttachment.Ammo = Config.WeaponList