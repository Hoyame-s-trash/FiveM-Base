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

if _G.APIShared.CONFIG.AQUIVER_TEST_SERVER then
    Module["General"] = {
        shopName = "Test Server Shop (General)",
        items = {
            { name = "money",      price = 1 },
            { name = "gold",       price = 155 },
            { name = "cognac",     price = 25 },
            { name = "apple",      price = 45 },
            { name = "hotdog",     price = 65 },
            { name = "hamburger",  price = 75 },
            { name = "ironingot",  price = 100 },
            { name = "reddiamond", price = 120000 }
        },
        blip = {
            sprite = 52,
            colour = 69,
            scale = 0.8
        },
        locations = {
            vector3(-60.20, 217.59, 106.55)
        },
        peds = {
            {
                modelName = "a_m_m_soucent_01",
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                coords = vec3(-60.20, 217.59, 106.55),
                heading = 328.3,
            },
        }
    }
    Module["Weapon"] = {
        shopName = "Test Server Shop (Weapons)",
        items = {
            { name = "pistol",                  price = 1000 },
            { name = "bat",                     price = 500 },
            { name = "grenade",                 price = 50 },
            { name = "9mm_rounds",              price = 5 },
            { name = "at_flashlight",           price = 5 },
            { name = "at_clip_extended_pistol", price = 5 },
            { name = "at_skin_luxe",            price = 5 },
            { name = "at_skin_metal",           price = 5 },
            { name = "at_suppressor_light",     price = 5 },
            { name = "at_suppressor_heavy",     price = 5 }
        },
        blip = {
            sprite = 52,
            colour = 69,
            scale = 0.8
        },
        locations = {
            vector3(-53.38, 214.75, 106.55)
        },
        peds = {
            {
                modelName = "a_m_m_soucent_01",
                scenario = 'WORLD_HUMAN_AA_COFFEE',
                coords = vec3(-53.38, 214.75, 106.55),
                heading = 340.8,
            },
        }
    }
end

ScriptShared.Shops = Module
