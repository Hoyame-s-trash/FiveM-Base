CONFIG = {}

CONFIG.IS_VEHICLE_EXIST = function(plate)
    -- You should have to add your mysql table here and query with mysql to see if its exist or not.
    -- EXAMPLE:
    -- return exports["oxmysql"]:single_async("SELECT * FROM vehicles WHERE plate = ?", { plate }) ~= nil

    return true
end

CONFIG.NEARBY_PLAYER_RANGE = 5.0
CONFIG.NEARBY_PLAYERS_SHOW_NAMES = false

CONFIG.PLAYER_INVENTORY_DEFAULTS = {
    SLOTS = 60,
    MAX_WEIGHT = 100
}

CONFIG.DROPPED_ITEMS = {
    REMAIN_ON_GROUND = 86400, -- (os.time() + REMAIN_ON_GROUND)
    GRID_RANGE = 5.0,
    GRID_MAX_WEIGHT = 1000.0,
    GRID_SLOTS = 20,
    DEFAULT_DROPPED_MODEL = `prop_cs_box_clothes`
}

CONFIG.SHOP_OPEN_RANGE = 3.0

CONFIG.SAVE_INVENTORIES_MS = 60000 * 30   -- (30 minutes by default)
CONFIG.FACTION_CREATE_SAFE_OBJECTS = true -- (If disabled then the safe objects will not be created on the clients.)
CONFIG.FACTION_SAFE_OPEN_RANGE = 3.0
CONFIG.FACTION_SAFE_OBJECT_MODEL = "p_v_43_safe_s"
CONFIG.FACTION_INVENTORIES = {
    ["police"] = {
        header = "Police Safe",
        x = 1137,
        y = -645,
        z = 56.75,
        heading = 60.0,
        slotsAmount = 40,
        maxWeight = 2000
    }
}

-- Ammo will apply with different item as bullet to these weapons. (You have to register the ammo also as item.)
CONFIG.AMMO_WEAPONS = {
    [`weapon_pistol`] = "9mm_rounds",
    -- Add your weapons here.
}
CONFIG.MELEE_WEAPONS = {
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
CONFIG.THROWABLE_WEAPONS = {
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
CONFIG.MISC_WEAPONS = {
    [`weapon_petrolcan`] = true,
    [`weapon_fireextinguisher`] = true,
    [`weapon_hazardcan`] = true,
    [`weapon_fertilizercan`] = true
}

CONFIG.NO_AUTO_RELOAD = true                                    -- (Do not reload the weapon automatically)
CONFIG.NO_AUTOSWAP_ON_EMPTY = true                              -- (Do not swap to empty hand when the bullet rans out)
CONFIG.REDUCE_WEAPON_DURABILITY_CHANCE = 80
CONFIG.REDUCE_WEAPON_DURABILITY_AMOUNT = { MIN = 25, MAX = 50 } -- This will be divided with /100, so 0.25 and 0.5
CONFIG.DELETE_WEAPON_ON_DURABILITY_ZERO = false                 -- (Delete the item if the durability reached zero)

CONFIG.WEAPON_COMPONENTS = {
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

CONFIG.VEHICLE_SIZES = {
    DEFAULT_TRUNK_SLOT = 20,
    DEFAULT_TRUNK_WEIGHT = 50.0,
    DEFAULT_GLOVEBOX_SLOT = 10,
    DEFAULT_GLOVEBOX_WEIGHT = 10.0,
    DATA = { -- CONFIG COFFRE VEHICLES
        [`infernus`] = {
            TRUNK = { SLOT = 10, WEIGHT = 35.0 },
            GLOVEBOX = { SLOT = 7, WEIGHT = 15.0 }
        }
    },
    getTrunkSlots = function(modelHash)
        local ref = CONFIG.VEHICLE_SIZES.DATA[modelHash]
        return (ref and ref.TRUNK and type(ref.TRUNK.SLOT) == "number")
            and
            ref.TRUNK.SLOT
            or
            CONFIG.VEHICLE_SIZES.DEFAULT_TRUNK_SLOT
    end,
    getTrunkMaxWeight = function(modelHash)
        local ref = CONFIG.VEHICLE_SIZES.DATA[modelHash]
        return (ref and ref.TRUNK and type(ref.TRUNK.WEIGHT) == "number")
            and
            ref.TRUNK.WEIGHT
            or
            CONFIG.VEHICLE_SIZES.DEFAULT_TRUNK_WEIGHT
    end,
    getGloveboxSlots = function(modelHash)
        local ref = CONFIG.VEHICLE_SIZES.DATA[modelHash]
        return (ref and ref.GLOVEBOX and type(ref.GLOVEBOX.SLOT) == "number")
            and
            ref.GLOVEBOX.SLOT
            or
            CONFIG.VEHICLE_SIZES.DEFAULT_GLOVEBOX_SLOT
    end,
    getGloveboxMaxWeight = function(modelHash)
        local ref = CONFIG.VEHICLE_SIZES.DATA[modelHash]
        return (ref and ref.GLOVEBOX and type(ref.GLOVEBOX.WEIGHT) == "number")
            and
            ref.GLOVEBOX.WEIGHT
            or
            CONFIG.VEHICLE_SIZES.DEFAULT_GLOVEBOX_WEIGHT
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

ScriptShared.Items:Add("handcuffs", {
    stackable = true,
    deletable = true,
    tradable = true,
    label = "Menottes",
    weight = 1.0,
    usable = true,
    category = "Utilisable",
    server = {
        event = "Police:Handcuff",
        onUseDeleteAmount = 1
    }
})

---@class ShopStaticData
---@field shopName string
---@field items ShopItem[]
---@field blip? { sprite: number; colour:number; scale:number; }
---@field locations { x: number; y:number; z:number; }[]
---@field peds? { modelName: string; scenario?:string; coords: vector3; heading:number; }[]

---@type { [string]: ShopStaticData }
local Module <const> = {
    ["General"] = {
        shopName = "General Shop",
        items = {
            { name = "gold",   price = 200 },
            { name = "cognac", price = 100 }
        },
        blip = {
            sprite = 52,
            colour = 69,
            scale = 0.8
        },
        locations = {
            vector3(223.832962, -792.619751, 30.695190)
        },
        peds = {
            {
                modelName = "mp_m_shopkeep_01",
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                coords = vec3(223.832962, -792.619751, 31.0),
                heading = 270.311,
            },
        }
    }
}

ScriptShared.Shops = Module