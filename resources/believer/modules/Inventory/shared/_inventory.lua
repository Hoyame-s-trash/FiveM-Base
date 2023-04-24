GM.Inventory = {}

GM.Inventory.IS_VEHICLE_EXIST = function(plate)
    -- You should have to add your mysql table here and query with mysql to see if its exist or not.
    -- EXAMPLE:
    -- return exports["oxmysql"]:single_async("SELECT * FROM vehicles WHERE plate = ?", { plate }) ~= nil

    return true
end

GM.Inventory.NEARBY_PLAYER_RANGE = 5.0
GM.Inventory.NEARBY_PLAYERS_SHOW_NAMES = true

GM.Inventory.PLAYER_INVENTORY_DEFAULTS = {
    SLOTS = 40,
    MAX_WEIGHT = 100
}

GM.Inventory.DROPPED_ITEMS = {
    REMAIN_ON_GROUND = 86400, -- (os.time() + REMAIN_ON_GROUND)
    GRID_RANGE = 5.0,
    GRID_MAX_WEIGHT = 1000.0,
    GRID_SLOTS = 20,
    DEFAULT_DROPPED_MODEL = `ba_prop_battle_ps_box_01`
}

GM.Inventory.SHOP_OPEN_RANGE = 3.0

GM.Inventory.SAVE_INVENTORIES_MS = 60000 * 30   -- (30 minutes by default)
GM.Inventory.FACTION_CREATE_SAFE_OBJECTS = true -- (If disabled then the safe objects will not be created on the clients.)
GM.Inventory.FACTION_SAFE_OPEN_RANGE = 3.0
GM.Inventory.FACTION_SAFE_OBJECT_MODEL = "p_v_43_safe_s"
GM.Inventory.FACTION_INVENTORIES = {
    -- ["police"] = {
    --     header = "Police Safe",
    --     x = 1137,
    --     y = -645,
    --     z = 56.75,
    --     heading = 60.0,
    --     slotsAmount = 40,
    --     maxWeight = 2000
    -- }
}

GM.Inventory.FACTION_INVENTORIES["police"] = {
    header = "Police Safe",
    x = -46.47,
    y = 213.13,
    z = 106.55,
    heading = 162.4,
    slotsAmount = 40,
    maxWeight = 2000
}

-- Ammo will apply with different item as bullet to these weapons. (You have to register the ammo also as item.)
GM.Inventory.AMMO_WEAPONS = {
    [`weapon_pistol`] = "9mm_rounds",
    -- Add your weapons here.
}
GM.Inventory.MELEE_WEAPONS = {
    [`weapon_dagger`] = true,
    [`weapon_bat`] = true,
    [`weapon_bottle`] = true,
    [`weapon_crowbar`] = true,
    [`weapon_flashlight`] = true,
    [`weapon_golfclub`] = true,
    [`weapon_hammer`] = true,
    [`weapon_hatchet`] = true,
    [`weapon_knuckle`] = true,
    [`weapon_knife`] = true,
    [`weapon_switchblade`] = true,
    [`weapon_machete`] = true,
    [`weapon_nightstick`] = true,
    [`weapon_wrench`] = true,
    [`weapon_battleaxe`] = true,
    [`weapon_poolcue`] = true,
    [`weapon_stone_hatchet`] = true
}
-- Ammo will apply as stack count to these weapons. (So these weapons should be stackable most of the cases.)
GM.Inventory.THROWABLE_WEAPONS = {
    [`weapon_grenade`] = true,
    [`weapon_bzgas`] = true,
    [`weapon_molotov`] = true,
    [`weapon_stickybomb`] = true,
    [`weapon_proxmine`] = true,
    [`weapon_snowball`] = true,
    [`weapon_pipebomb`] = true,
    [`weapon_ball`] = true,
    [`weapon_smokegrenade`] = true,
    [`weapon_flare`] = true
}
GM.Inventory.MISC_WEAPONS = {
    [`weapon_petrolcan`] = true,
    [`weapon_fireextinguisher`] = true,
    [`weapon_hazardcan`] = true,
    [`weapon_fertilizercan`] = true
}

GM.Inventory.NO_AUTO_RELOAD = true                                    -- (Do not reload the weapon automatically)
GM.Inventory.NO_AUTOSWAP_ON_EMPTY = true                              -- (Do not swap to empty hand when the bullet rans out)
GM.Inventory.REDUCE_WEAPON_DURABILITY_CHANCE = 80
GM.Inventory.REDUCE_WEAPON_DURABILITY_AMOUNT = { MIN = 25, MAX = 50 } -- This will be divided with /100, so 0.25 and 0.5
GM.Inventory.DELETE_WEAPON_ON_DURABILITY_ZERO = false                 -- (Delete the item if the durability reached zero)

GM.Inventory.WEAPON_COMPONENTS = {
    ["at_flashlight"] = {
        `COMPONENT_AT_AR_FLSH`,
        `COMPONENT_AT_AR_FLSH_REH`,
        `COMPONENT_AT_PI_FLSH`,
        `COMPONENT_AT_PI_FLSH_02`,
        `COMPONENT_AT_PI_FLSH_03`
    },
    ["at_suppressor_light"] = {
        `COMPONENT_AT_PI_SUPP`,
        `COMPONENT_AT_PI_SUPP_02`,
        `COMPONENT_CERAMICPISTOL_SUPP`,
        `COMPONENT_PISTOLXM3_SUPP`
    },
    ["at_suppressor_heavy"] = {
        `COMPONENT_AT_AR_SUPP`,
        `COMPONENT_AT_AR_SUPP_02`,
        `COMPONENT_AT_SR_SUPP`,
        `COMPONENT_AT_SR_SUPP_03`
    },
    ["at_grip"] = {
        `COMPONENT_AT_AR_AFGRIP`,
        `COMPONENT_AT_AR_AFGRIP_02`
    },
    ["at_barrel"] = {
        `COMPONENT_AT_AR_BARREL_02`,
        `COMPONENT_AT_BP_BARREL_02`,
        `COMPONENT_AT_CR_BARREL_02`,
        `COMPONENT_AT_MG_BARREL_02`,
        `COMPONENT_AT_MRFL_BARREL_02`,
        `COMPONENT_AT_SB_BARREL_02`,
        `COMPONENT_AT_SC_BARREL_02`,
        `COMPONENT_AT_SR_BARREL_02`
    },
    ["at_clip_extended_pistol"] = {
        `COMPONENT_APPISTOL_CLIP_02`,
        `COMPONENT_CERAMICPISTOL_CLIP_02`,
        `COMPONENT_COMBATPISTOL_CLIP_02`,
        `COMPONENT_HEAVYPISTOL_CLIP_02`,
        `COMPONENT_PISTOL_CLIP_02`,
        `COMPONENT_PISTOL_MK2_CLIP_02`,
        `COMPONENT_PISTOL50_CLIP_02`,
        `COMPONENT_SNSPISTOL_CLIP_02`,
        `COMPONENT_SNSPISTOL_MK2_CLIP_02`,
        `COMPONENT_VINTAGEPISTOL_CLIP_02`
    },
    ["at_clip_extended_smg"] = {
        `COMPONENT_ASSAULTSMG_CLIP_02`,
        `COMPONENT_COMBATPDW_CLIP_02`,
        `COMPONENT_MACHINEPISTOL_CLIP_02`,
        `COMPONENT_MICROSMG_CLIP_02`,
        `COMPONENT_MINISMG_CLIP_02`,
        `COMPONENT_SMG_CLIP_02`,
        `COMPONENT_SMG_MK2_CLIP_02`
    },
    ["at_clip_extended_shotgun"] = {
        `COMPONENT_ASSAULTSHOTGUN_CLIP_02`,
        `COMPONENT_HEAVYSHOTGUN_CLIP_02`
    },
    ["at_clip_extended_rifle"] = {
        `COMPONENT_ADVANCEDRIFLE_CLIP_02`,
        `COMPONENT_ASSAULTRIFLE_CLIP_02`,
        `COMPONENT_ASSAULTRIFLE_MK2_CLIP_02`,
        `COMPONENT_BULLPUPRIFLE_CLIP_02`,
        `COMPONENT_BULLPUPRIFLE_MK2_CLIP_02`,
        `COMPONENT_CARBINERIFLE_CLIP_02`,
        `COMPONENT_CARBINERIFLE_MK2_CLIP_02`,
        `COMPONENT_COMPACTRIFLE_CLIP_02`,
        `COMPONENT_HEAVYRIFLE_CLIP_02`,
        `COMPONENT_MILITARYRIFLE_CLIP_02`,
        `COMPONENT_SPECIALCARBINE_CLIP_02`,
        `COMPONENT_SPECIALCARBINE_MK2_CLIP_02`,
        `COMPONENT_TACTICALRIFLE_CLIP_02`
    },
    ["at_clip_extended_mg"] = {
        `COMPONENT_GUSENBERG_CLIP_02`,
        `COMPONENT_MG_CLIP_02`,
        `COMPONENT_COMBATMG_CLIP_02`,
        `COMPONENT_COMBATMG_MK2_CLIP_02`
    },
    ["at_clip_extended_sniper"] = {
        `COMPONENT_HEAVYSNIPER_MK2_CLIP_02`,
        `COMPONENT_MARKSMANRIFLE_CLIP_02`,
        `COMPONENT_MARKSMANRIFLE_MK2_CLIP_02`
    },
    ["at_clip_drum_smg"] = {
        `COMPONENT_COMBATPDW_CLIP_03`,
        `COMPONENT_MACHINEPISTOL_CLIP_03`,
        `COMPONENT_SMG_CLIP_03`
    },
    ["at_clip_drum_shotgun"] = {
        `COMPONENT_HEAVYSHOTGUN_CLIP_03`
    },
    ["at_clip_drum_rifle"] = {
        `COMPONENT_ASSAULTRIFLE_CLIP_03`,
        `COMPONENT_COMPACTRIFLE_CLIP_03`,
        `COMPONENT_CARBINERIFLE_CLIP_03`,
        `COMPONENT_SPECIALCARBINE_CLIP_03`
    },
    ["at_compensator"] = {
        `COMPONENT_AT_PI_COMP`,
        `COMPONENT_AT_PI_COMP_02`,
        `COMPONENT_AT_PI_COMP_03`
    },
    ["at_scope_macro"] = {
        `COMPONENT_AT_SCOPE_MACRO`,
        `COMPONENT_AT_SCOPE_MACRO_02`,
        `COMPONENT_AT_SCOPE_MACRO_MK2`,
        `COMPONENT_AT_SCOPE_MACRO_02_MK2`,
        `COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2`
    },
    ["at_scope_small"] = {
        `COMPONENT_AT_SCOPE_SMALL`,
        `COMPONENT_AT_SCOPE_SMALL_02`,
        `COMPONENT_AT_SCOPE_SMALL_MK2`,
        `COMPONENT_AT_SCOPE_SMALL_SMG_MK2`
    },
    ["at_scope_medium"] = {
        `COMPONENT_AT_SCOPE_MEDIUM`,
        `COMPONENT_AT_SCOPE_MEDIUM_MK2`
    },
    ["at_scope_large"] = {
        `COMPONENT_AT_SCOPE_LARGE_MK2`
    },
    ["at_scope_advanced"] = {
        `COMPONENT_AT_SCOPE_MAX`
    },
    ["at_scope_nv"] = {
        `COMPONENT_AT_SCOPE_NV`
    },
    ["at_scope_thermal"] = {
        `COMPONENT_AT_SCOPE_THERMAL`
    },
    ["at_scope_holo"] = {
        `COMPONENT_AT_PI_RAIL`,
        `COMPONENT_AT_PI_RAIL_02`,
        `COMPONENT_AT_SIGHTS`,
        `COMPONENT_AT_SIGHTS_SMG`
    },
    ["at_muzzle_flat"] = {
        `COMPONENT_AT_MUZZLE_01`
    },
    ["at_muzzle_tactical"] = {
        `COMPONENT_AT_MUZZLE_02`
    },
    ["at_muzzle_fat"] = {
        `COMPONENT_AT_MUZZLE_03`
    },
    ["at_muzzle_precision"] = {
        `COMPONENT_AT_MUZZLE_04`
    },
    ["at_muzzle_heavy"] = {
        `COMPONENT_AT_MUZZLE_05`
    },
    ["at_muzzle_slanted"] = {
        `COMPONENT_AT_MUZZLE_06`
    },
    ["at_muzzle_split"] = {
        `COMPONENT_AT_MUZZLE_07`
    },
    ["at_muzzle_squared"] = {
        `COMPONENT_AT_MUZZLE_08`
    },
    ["at_muzzle_bell"] = {
        `COMPONENT_AT_MUZZLE_09`
    },
    ["at_skin_luxe"] = {
        `COMPONENT_ASSAULTRIFLE_VARMOD_LUXE`,
        `COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER`,
        `COMPONENT_CARBINERIFLE_VARMOD_LUXE`,
        `COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER`,
        `COMPONENT_MARKSMANRIFLE_VARMOD_LUXE`,
        `COMPONENT_MG_VARMOD_LOWRIDER`,
        `COMPONENT_MICROSMG_VARMOD_LUXE`,
        `COMPONENT_PISTOL_VARMOD_LUXE`,
        `COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER`,
        `COMPONENT_SMG_VARMOD_LUXE`
    },
    ["at_skin_wood"] = {
        `COMPONENT_HEAVYPISTOL_VARMOD_LUXE`,
        `COMPONENT_SNIPERRIFLE_VARMOD_LUXE`,
        `COMPONENT_SNSPISTOL_VARMOD_LOWRIDER`
    },
    ["at_skin_metal"] = {
        `COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE`,
        `COMPONENT_APPISTOL_VARMOD_LUXE`,
        `COMPONENT_BULLPUPRIFLE_VARMOD_LOW`,
        `COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE`,
        `COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER`
    },
    ["at_skin_pearl"] = {
        `COMPONENT_PISTOL50_VARMOD_LUXE`
    },
    ["at_skin_camo"] = {
        `COMPONENT_ASSAULTRIFLE_MK2_CAMO`,
        `COMPONENT_BULLPUPRIFLE_MK2_CAMO`,
        `COMPONENT_CARBINERIFLE_MK2_CAMO`,
        `COMPONENT_COMBATMG_MK2_CAMO`,
        `COMPONENT_HEAVYSNIPER_MK2_CAMO`,
        `COMPONENT_MARKSMANRIFLE_MK2_CAMO`,
        `COMPONENT_PISTOL_MK2_CAMO`,
        `COMPONENT_PUMPSHOTGUN_MK2_CAMO`,
        `COMPONENT_REVOLVER_MK2_CAMO`,
        `COMPONENT_SMG_MK2_CAMO`,
        `COMPONENT_SNSPISTOL_MK2_CAMO`,
        `COMPONENT_SPECIALCARBINE_MK2_CAMO`
    },
    ["at_skin_brushstroke"] = {
        `COMPONENT_ASSAULTRIFLE_MK2_CAMO_02`,
        `COMPONENT_BULLPUPRIFLE_MK2_CAMO_02`,
        `COMPONENT_CARBINERIFLE_MK2_CAMO_02`,
        `COMPONENT_COMBATMG_MK2_CAMO_02`,
        `COMPONENT_HEAVYSNIPER_MK2_CAMO_02`,
        `COMPONENT_MARKSMANRIFLE_MK2_CAMO_02`,
        `COMPONENT_PISTOL_MK2_CAMO_02`,
        `COMPONENT_PUMPSHOTGUN_MK2_CAMO_02`,
        `COMPONENT_REVOLVER_MK2_CAMO_02`,
        `COMPONENT_SMG_MK2_CAMO_02`,
        `COMPONENT_SNSPISTOL_MK2_CAMO_02`,
        `COMPONENT_SPECIALCARBINE_MK2_CAMO_02`
    },
    ["at_skin_woodland"] = {
        `COMPONENT_ASSAULTRIFLE_MK2_CAMO_03`,
        `COMPONENT_BULLPUPRIFLE_MK2_CAMO_03`,
        `COMPONENT_CARBINERIFLE_MK2_CAMO_03`,
        `COMPONENT_COMBATMG_MK2_CAMO_03`,
        `COMPONENT_HEAVYSNIPER_MK2_CAMO_03`,
        `COMPONENT_MARKSMANRIFLE_MK2_CAMO_03`,
        `COMPONENT_PISTOL_MK2_CAMO_03`,
        `COMPONENT_PUMPSHOTGUN_MK2_CAMO_03`,
        `COMPONENT_REVOLVER_MK2_CAMO_03`,
        `COMPONENT_SMG_MK2_CAMO_03`,
        `COMPONENT_SNSPISTOL_MK2_CAMO_03`,
        `COMPONENT_SPECIALCARBINE_MK2_CAMO_03`
    },
    ["at_skin_skull"] = {
        `COMPONENT_ASSAULTRIFLE_MK2_CAMO_04`,
        `COMPONENT_BULLPUPRIFLE_MK2_CAMO_04`,
        `COMPONENT_CARBINERIFLE_MK2_CAMO_04`,
        `COMPONENT_COMBATMG_MK2_CAMO_04`,
        `COMPONENT_HEAVYSNIPER_MK2_CAMO_04`,
        `COMPONENT_MARKSMANRIFLE_MK2_CAMO_04`,
        `COMPONENT_PISTOL_MK2_CAMO_04`,
        `COMPONENT_PUMPSHOTGUN_MK2_CAMO_04`,
        `COMPONENT_REVOLVER_MK2_CAMO_04`,
        `COMPONENT_SMG_MK2_CAMO_04`,
        `COMPONENT_SNSPISTOL_MK2_CAMO_04`,
        `COMPONENT_SPECIALCARBINE_MK2_CAMO_04`
    },
    ["at_skin_sessanta"] = {
        `COMPONENT_ASSAULTRIFLE_MK2_CAMO_05`,
        `COMPONENT_BULLPUPRIFLE_MK2_CAMO_05`,
        `COMPONENT_CARBINERIFLE_MK2_CAMO_05`,
        `COMPONENT_COMBATMG_MK2_CAMO_05`,
        `COMPONENT_HEAVYSNIPER_MK2_CAMO_05`,
        `COMPONENT_MARKSMANRIFLE_MK2_CAMO_05`,
        `COMPONENT_PISTOL_MK2_CAMO_05`,
        `COMPONENT_PUMPSHOTGUN_MK2_CAMO_05`,
        `COMPONENT_REVOLVER_MK2_CAMO_05`,
        `COMPONENT_SMG_MK2_CAMO_05`,
        `COMPONENT_SNSPISTOL_MK2_CAMO_05`,
        `COMPONENT_SPECIALCARBINE_MK2_CAMO_05`
    },
    ["at_skin_perseus"] = {
        `COMPONENT_ASSAULTRIFLE_MK2_CAMO_06`,
        `COMPONENT_BULLPUPRIFLE_MK2_CAMO_06`,
        `COMPONENT_CARBINERIFLE_MK2_CAMO_06`,
        `COMPONENT_COMBATMG_MK2_CAMO_06`,
        `COMPONENT_HEAVYSNIPER_MK2_CAMO_06`,
        `COMPONENT_MARKSMANRIFLE_MK2_CAMO_06`,
        `COMPONENT_PISTOL_MK2_CAMO_06`,
        `COMPONENT_PUMPSHOTGUN_MK2_CAMO_06`,
        `COMPONENT_REVOLVER_MK2_CAMO_06`,
        `COMPONENT_SMG_MK2_CAMO_06`,
        `COMPONENT_SNSPISTOL_MK2_CAMO_06`,
        `COMPONENT_SPECIALCARBINE_MK2_CAMO_06`
    },
    ["at_skin_leopard"] = {
        `COMPONENT_ASSAULTRIFLE_MK2_CAMO_07`,
        `COMPONENT_BULLPUPRIFLE_MK2_CAMO_07`,
        `COMPONENT_CARBINERIFLE_MK2_CAMO_07`,
        `COMPONENT_COMBATMG_MK2_CAMO_07`,
        `COMPONENT_HEAVYSNIPER_MK2_CAMO_07`,
        `COMPONENT_MARKSMANRIFLE_MK2_CAMO_07`,
        `COMPONENT_PISTOL_MK2_CAMO_07`,
        `COMPONENT_PUMPSHOTGUN_MK2_CAMO_07`,
        `COMPONENT_REVOLVER_MK2_CAMO_07`,
        `COMPONENT_SMG_MK2_CAMO_07`,
        `COMPONENT_SNSPISTOL_MK2_CAMO_07`,
        `COMPONENT_SPECIALCARBINE_MK2_CAMO_07`
    },
    ["at_skin_zebra"] = {
        `COMPONENT_ASSAULTRIFLE_MK2_CAMO_08`,
        `COMPONENT_BULLPUPRIFLE_MK2_CAMO_08`,
        `COMPONENT_CARBINERIFLE_MK2_CAMO_08`,
        `COMPONENT_COMBATMG_MK2_CAMO_08`,
        `COMPONENT_HEAVYSNIPER_MK2_CAMO_08`,
        `COMPONENT_MARKSMANRIFLE_MK2_CAMO_08`,
        `COMPONENT_PISTOL_MK2_CAMO_08`,
        `COMPONENT_PUMPSHOTGUN_MK2_CAMO_08`,
        `COMPONENT_REVOLVER_MK2_CAMO_08`,
        `COMPONENT_SMG_MK2_CAMO_08`,
        `COMPONENT_SNSPISTOL_MK2_CAMO_08`,
        `COMPONENT_SPECIALCARBINE_MK2_CAMO_08`
    },
    ["at_skin_geometric"] = {
        `COMPONENT_ASSAULTRIFLE_MK2_CAMO_09`,
        `COMPONENT_BULLPUPRIFLE_MK2_CAMO_09`,
        `COMPONENT_CARBINERIFLE_MK2_CAMO_09`,
        `COMPONENT_COMBATMG_MK2_CAMO_09`,
        `COMPONENT_HEAVYSNIPER_MK2_CAMO_09`,
        `COMPONENT_MARKSMANRIFLE_MK2_CAMO_09`,
        `COMPONENT_PISTOL_MK2_CAMO_09`,
        `COMPONENT_PUMPSHOTGUN_MK2_CAMO_09`,
        `COMPONENT_REVOLVER_MK2_CAMO_09`,
        `COMPONENT_SMG_MK2_CAMO_09`,
        `COMPONENT_SNSPISTOL_MK2_CAMO_09`,
        `COMPONENT_SPECIALCARBINE_MK2_CAMO_09`
    },
    ["at_skin_boom"] = {
        `COMPONENT_ASSAULTRIFLE_MK2_CAMO_10`,
        `COMPONENT_BULLPUPRIFLE_MK2_CAMO_10`,
        `COMPONENT_CARBINERIFLE_MK2_CAMO_10`,
        `COMPONENT_COMBATMG_MK2_CAMO_10`,
        `COMPONENT_HEAVYSNIPER_MK2_CAMO_10`,
        `COMPONENT_MARKSMANRIFLE_MK2_CAMO_10`,
        `COMPONENT_PISTOL_MK2_CAMO_10`,
        `COMPONENT_PUMPSHOTGUN_MK2_CAMO_10`,
        `COMPONENT_REVOLVER_MK2_CAMO_10`,
        `COMPONENT_SMG_MK2_CAMO_10`,
        `COMPONENT_SNSPISTOL_MK2_CAMO_10`,
        `COMPONENT_SPECIALCARBINE_MK2_CAMO_10`
    },
    ["at_skin_patriotic"] = {
        `COMPONENT_ASSAULTRIFLE_MK2_CAMO_IND_01`,
        `COMPONENT_BULLPUPRIFLE_MK2_CAMO_IND_01`,
        `COMPONENT_CARBINERIFLE_MK2_CAMO_IND_01`,
        `COMPONENT_COMBATMG_MK2_CAMO_IND_01`,
        `COMPONENT_HEAVYSNIPER_MK2_CAMO_IND_01`,
        `COMPONENT_MARKSMANRIFLE_MK2_CAMO_IND_01`,
        `COMPONENT_PISTOL_MK2_CAMO_IND_01`,
        `COMPONENT_PUMPSHOTGUN_MK2_CAMO_IND_01`,
        `COMPONENT_REVOLVER_MK2_CAMO_IND_01`,
        `COMPONENT_SMG_MK2_CAMO_IND_01`,
        `COMPONENT_SNSPISTOL_MK2_CAMO_IND_01`,
        `COMPONENT_SPECIALCARBINE_MK2_CAMO_IND_01`
    }
}

GM.Inventory.VEHICLE_SIZES = {
    DEFAULT_TRUNK_SLOT = 20,
    DEFAULT_TRUNK_WEIGHT = 50.0,
    DEFAULT_GLOVEBOX_SLOT = 10,
    DEFAULT_GLOVEBOX_WEIGHT = 10.0,
    DATA = {
        [`infernus`] = {
            TRUNK = { SLOT = 10, WEIGHT = 35.0 },
            GLOVEBOX = { SLOT = 7, WEIGHT = 15.0 }
        }
    },
    getTrunkSlots = function(modelHash)
        local ref = GM.Inventory.VEHICLE_SIZES.DATA[modelHash]
        return (ref and ref.TRUNK and type(ref.TRUNK.SLOT) == "number")
            and
            ref.TRUNK.SLOT
            or
            GM.Inventory.VEHICLE_SIZES.DEFAULT_TRUNK_SLOT
    end,
    getTrunkMaxWeight = function(modelHash)
        local ref = GM.Inventory.VEHICLE_SIZES.DATA[modelHash]
        return (ref and ref.TRUNK and type(ref.TRUNK.WEIGHT) == "number")
            and
            ref.TRUNK.WEIGHT
            or
            GM.Inventory.VEHICLE_SIZES.DEFAULT_TRUNK_WEIGHT
    end,
    getGloveboxSlots = function(modelHash)
        local ref = GM.Inventory.VEHICLE_SIZES.DATA[modelHash]
        return (ref and ref.GLOVEBOX and type(ref.GLOVEBOX.SLOT) == "number")
            and
            ref.GLOVEBOX.SLOT
            or
            GM.Inventory.VEHICLE_SIZES.DEFAULT_GLOVEBOX_SLOT
    end,
    getGloveboxMaxWeight = function(modelHash)
        local ref = GM.Inventory.VEHICLE_SIZES.DATA[modelHash]
        return (ref and ref.GLOVEBOX and type(ref.GLOVEBOX.WEIGHT) == "number")
            and
            ref.GLOVEBOX.WEIGHT
            or
            GM.Inventory.VEHICLE_SIZES.DEFAULT_GLOVEBOX_WEIGHT
    end
}

ScriptShared = {}

---@generic T
---@param data T
---@return T
function ScriptShared:createRet(data)
    return data
end

local Module = {}
---@type table<string, RegisteredItemData>
Module.Registered = {}

ScriptShared.Items = Module

---@param name string
function Module:Get(name)
    if (not self.Registered[name]) then
        print(("[^1WARNING^0] Inventory ITEM doens't exist : ^5%s^7"):format(name))
    end
    return self.Registered[name]
end

---@param name string
---@param d RegisteredItemData
function Module:Add(name, d)
    self.Registered[name] = d
end

ScriptShared.Items:Add("money", {
    stackable = true,
    deletable = true,
    tradable = true,
    label = "Espèces",
    weight = 0.0,
    category = "Argent"
})

ScriptShared.Items:Add("black_money", {
    stackable = true,
    deletable = true,
    tradable = true,
    label = "Argent sale",
    weight = 0.0,
    category = "Argent"
})

ScriptShared.Items:Add("handcuffs", {
    stackable = true,
    deletable = true,
    tradable = true,
    label = "Menottes",
    weight = 1.0,
    usable = true,
    category = "Utilisable",
    event = {
        server_event = false,
        client_event = "Police:item:handcuffs",
        onUseDeleteAmount = 0
    }
})

ScriptShared.Items:Add("bandage", {
    stackable = true,
    deletable = true,
    tradable = true,
    label = "Bandage",
    weight = 1.0,
    usable = true,
    category = "Médical",
    event = {
        server_event = "Ambulance:item:bandage",
        client_event = false,
        onUseDeleteAmount = 0
    }
})

ScriptShared.Items:Add("medikit", {
    stackable = true,
    deletable = true,
    tradable = true,
    label = "Bandage",
    weight = 1.0,
    usable = true,
    category = "Médical",
    event = {
        server_event = "Ambulance:item:medikit",
        client_event = false,
        onUseDeleteAmount = 0
    }
})

-- ScriptShared.Items:Add("money", {
--     stackable = true,
--     deletable = true,
--     tradable = true,
--     label = "Money",
--     weight = 0.0,
--     category = "Currency"
-- })
-- ScriptShared.Items:Add("gold", {
--     stackable = true,
--     deletable = true,
--     tradable = true,
--     label = "Gold",
--     weight = 1.5,
--     usable = true,
--     category = "Raw material",
--     server = {
--         export = "av_inventory_2_remastered.test",
--         onUseDeleteAmount = 1
--     }
-- })
-- ScriptShared.Items:Add("cognac", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = "Hennessy Cognac",
--     weight = 0.75,
--     droppedModel = `prop_cs_script_bottle`,
--     category = "Drink"
-- })
-- ScriptShared.Items:Add("hotdog", {
--     stackable = true,
--     deletable = true,
--     tradable = true,
--     label = "Hot-Dog",
--     weight = 0.25,
--     category = "Food"
-- })
-- ScriptShared.Items:Add("hamburger", {
--     stackable = true,
--     deletable = true,
--     tradable = true,
--     label = "Hamburger",
--     weight = 0.25,
--     category = "Food"
-- })
-- ScriptShared.Items:Add("ironingot", {
--     stackable = true,
--     deletable = true,
--     tradable = true,
--     label = "Iron Ingot",
--     weight = 0.75,
--     category = "Raw material"
-- })
-- ScriptShared.Items:Add("reddiamond", {
--     stackable = true,
--     deletable = true,
--     tradable = true,
--     label = "Red Diamond",
--     weight = 0.1,
--     category = "Raw material"
-- })
-- ScriptShared.Items:Add("apple", {
--     stackable = true,
--     deletable = true,
--     tradable = true,
--     label = "Apple",
--     weight = 0.25,
--     category = "Fruit"
-- })

-- ScriptShared.Items:Add("pistol", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = "Pistol",
--     weaponHash = `WEAPON_PISTOL`,
--     usable = true,
--     weight = 1.0,
--     category = "Weapon",
--     generateSerial = true,
--     defaultMeta = {
--         durability = 100
--     },
--     allowedAttachments = {
--         "at_flashlight",
--         "at_suppressor_light"
--     }
-- })
-- ScriptShared.Items:Add("bat", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = "Bat",
--     weaponHash = `WEAPON_BAT`,
--     usable = true,
--     weight = 1.0,
--     category = "Weapon",
--     defaultMeta = {
--         durability = 100
--     }
-- })
-- ScriptShared.Items:Add("grenade", {
--     stackable = true,
--     deletable = true,
--     tradable = true,
--     label = "Grenade",
--     weaponHash = `WEAPON_GRENADE`,
--     usable = true,
--     weight = 1.0,
--     category = "Weapon",
--     generateSerial = true
-- })
-- ScriptShared.Items:Add("petrolcan", {
--     stackable = true,
--     deletable = true,
--     tradable = true,
--     label = "Petrol Can",
--     weaponHash = `WEAPON_PETROLCAN`,
--     usable = true,
--     weight = 0.1,
--     category = "Weapon"
-- })
-- ScriptShared.Items:Add("9mm_rounds", {
--     stackable = true,
--     deletable = true,
--     tradable = true,
--     label = "9mm rounds.",
--     weight = 0.05,
--     category = "Ammo"
-- })
-- ScriptShared.Items:Add("at_flashlight", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = "Flashlight",
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_suppressor_light", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Suppressor (Light)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_suppressor_heavy", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Suppressor (Heavy)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_grip", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Grip',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_barrel", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Barrel',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_clip_extended_pistol", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Extended Clip (Pistol)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_clip_extended_smg", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Extended Clip (SMG)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_clip_extended_shotgun", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Extended Clip (Shotgun)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_clip_extended_rifle", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Extended Clip (Rifle)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_clip_extended_mg", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Extended Clip (LMG)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_clip_extended_sniper", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Extended Clip (SR)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_clip_drum_smg", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Drum clip (SMG)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_clip_drum_shotgun", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Drum clip (Shotgun)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_clip_drum_rifle", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Drum clip (Rifle)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_compensator", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Compensator',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_scope_macro", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Scope (Macro)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_scope_small", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Scope (Small)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_scope_medium", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Scope (Medium)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_scope_large", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Scope (Large)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_scope_advanced", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Scope (Advanced)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_scope_nv", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Scope (Night Vision)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_scope_thermal", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Scope (Thermal)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_scope_holo", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Scope (Holo)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_muzzle_flat", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Muzzle (Flat)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_muzzle_tactical", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Muzzle (Tactical)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_muzzle_fat", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Muzzle (Fat)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_muzzle_precision", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Muzzle (Precision)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_muzzle_heavy", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Muzzle (Heavy)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_muzzle_slanted", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Muzzle (Slanted)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_muzzle_split", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Muzzle (Split)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_muzzle_squared", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Muzzle (Squared)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_muzzle_bell", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Muzzle (Bell)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_skin_luxe", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Weapon Skin (Luxe)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_skin_wood", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Weapon Skin (Wood)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_skin_metal", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Weapon Skin (Metal)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_skin_pearl", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Weapon Skin (Pearl)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_skin_camo", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Weapon Skin (Camo)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_skin_brushstroke", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Weapon Skin (Brushstroke)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_skin_woodland", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Weapon Skin (Woodland)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_skin_skull", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Weapon Skin (Skull)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_skin_sessanta", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Weapon Skin (Sessanta)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_skin_perseus", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Weapon Skin (Perseus)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_skin_leopard", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Weapon Skin (Leopard)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_skin_zebra", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Weapon Skin (Zebra)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_skin_geometric", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Weapon Skin (Geometric)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_skin_boom", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Weapon Skin (Boom)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })
-- ScriptShared.Items:Add("at_skin_patriotic", {
--     stackable = false,
--     deletable = true,
--     tradable = true,
--     label = 'Weapon Skin (Patriotic)',
--     weight = 1.0,
--     category = "Weapon attachment"
-- })

---@class ShopStaticData
---@field shopName string
---@field items ShopItem[]
---@field blip? { sprite: number; colour:number; scale:number; }
---@field locations { x: number; y:number; z:number; }[]
---@field peds? { modelName: string; scenario?:string; coords: vector3; heading:number; }[]

---@type { [string]: ShopStaticData }
local Module <const> = {
    -- ["General"] = {
    --     shopName = "General Shop",
    --     items = {
    --         { name = "gold",   price = 200 },
    --         { name = "cognac", price = 100 }
    --     },
    --     blip = {
    --         sprite = 52,
    --         colour = 69,
    --         scale = 0.8
    --     },
    --     locations = {
    --         vector3(223.832962, -792.619751, 30.695190)
    --     },
    --     peds = {
    --         {
    --             modelName = "mp_m_shopkeep_01",
    --             scenario = 'WORLD_HUMAN_AA_COFFEE',
    --             coords = vec3(223.832962, -792.619751, 31.0),
    --             heading = 270.311,
    --         },
    --     }
    -- }
}

-- Module["General"] = {
--     shopName = "Test Server Shop (General)",
--     items = {
--         { name = "money",      price = 1 },
--         { name = "gold",       price = 155 },
--         { name = "cognac",     price = 25 },
--         { name = "apple",      price = 45 },
--         { name = "hotdog",     price = 65 },
--         { name = "hamburger",  price = 75 },
--         { name = "ironingot",  price = 100 },
--         { name = "reddiamond", price = 120000 }
--     },
--     blip = {
--         sprite = 52,
--         colour = 69,
--         scale = 0.8
--     },
--     locations = {
--         vector3(-60.20, 217.59, 106.55)
--     },
--     peds = {
--         {
--             modelName = "a_m_m_soucent_01",
--             scenario = 'WORLD_HUMAN_AA_COFFEE',
--             coords = vec3(-60.20, 217.59, 106.55),
--             heading = 328.3,
--         },
--     }
-- }
-- Module["Weapon"] = {
--     shopName = "Test Server Shop (Weapons)",
--     items = {
--         { name = "pistol",                  price = 1000 },
--         { name = "bat",                     price = 500 },
--         { name = "grenade",                 price = 50 },
--         { name = "9mm_rounds",              price = 5 },
--         { name = "at_flashlight",           price = 5 },
--         { name = "at_clip_extended_pistol", price = 5 },
--         { name = "at_skin_luxe",            price = 5 },
--         { name = "at_skin_metal",           price = 5 },
--         { name = "at_suppressor_light",     price = 5 },
--         { name = "at_suppressor_heavy",     price = 5 }
--     },
--     blip = {
--         sprite = 52,
--         colour = 69,
--         scale = 0.8
--     },
--     locations = {
--         vector3(-53.38, 214.75, 106.55)
--     },
--     peds = {
--         {
--             modelName = "a_m_m_soucent_01",
--             scenario = 'WORLD_HUMAN_AA_COFFEE',
--             coords = vec3(-53.38, 214.75, 106.55),
--             heading = 340.8,
--         },
--     }
-- }

ScriptShared.Shops = Module

--- Export function to register an item data from another resource.
---@param name string Example: 'gold'
---@param d RegisteredItemData
exports("registerItem", function(name, d)
    ScriptShared.Items:Add(name, d)
end)

--- Export function to create a shop from another resource.
---@param id string Example: 'General'
---@param shopData ShopStaticData
exports("createShop", function(id, shopData)
    Module[id] = shopData

    -- If its server create the shop.
    if IsDuplicityVersion() then
        ScriptServer.Classes.Shop.new(id, shopData)
    end
end)