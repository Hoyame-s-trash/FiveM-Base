ScriptShared.Items:Add("pistol", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = "Pistol",
    weaponHash = `WEAPON_PISTOL`,
    usable = true,
    weight = 1.0,
    category = "Weapon",
    generateSerial = true,
    defaultMeta = {
        durability = 100
    },
    allowedAttachments = {
        "at_flashlight",
        "at_suppressor_light"
    }
})
ScriptShared.Items:Add("bat", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = "Bat",
    weaponHash = `WEAPON_BAT`,
    usable = true,
    weight = 1.0,
    category = "Weapon",
    defaultMeta = {
        durability = 100
    }
})
ScriptShared.Items:Add("grenade", {
    stackable = true,
    deletable = true,
    tradable = true,
    label = "Grenade",
    weaponHash = `WEAPON_GRENADE`,
    usable = true,
    weight = 1.0,
    category = "Weapon",
    generateSerial = true
})
ScriptShared.Items:Add("petrolcan", {
    stackable = true,
    deletable = true,
    tradable = true,
    label = "Petrol Can",
    weaponHash = `WEAPON_PETROLCAN`,
    usable = true,
    weight = 0.1,
    category = "Weapon"
})
ScriptShared.Items:Add("9mm_rounds", {
    stackable = true,
    deletable = true,
    tradable = true,
    label = "9mm rounds.",
    weight = 0.05,
    category = "Ammo"
})
ScriptShared.Items:Add("at_flashlight", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = "Flashlight",
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_suppressor_light", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Suppressor (Light)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_suppressor_heavy", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Suppressor (Heavy)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_grip", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Grip',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_barrel", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Barrel',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_clip_extended_pistol", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Extended Clip (Pistol)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_clip_extended_smg", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Extended Clip (SMG)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_clip_extended_shotgun", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Extended Clip (Shotgun)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_clip_extended_rifle", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Extended Clip (Rifle)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_clip_extended_mg", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Extended Clip (LMG)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_clip_extended_sniper", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Extended Clip (SR)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_clip_drum_smg", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Drum clip (SMG)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_clip_drum_shotgun", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Drum clip (Shotgun)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_clip_drum_rifle", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Drum clip (Rifle)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_compensator", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Compensator',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_scope_macro", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Scope (Macro)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_scope_small", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Scope (Small)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_scope_medium", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Scope (Medium)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_scope_large", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Scope (Large)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_scope_advanced", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Scope (Advanced)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_scope_nv", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Scope (Night Vision)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_scope_thermal", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Scope (Thermal)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_scope_holo", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Scope (Holo)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_muzzle_flat", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Muzzle (Flat)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_muzzle_tactical", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Muzzle (Tactical)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_muzzle_fat", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Muzzle (Fat)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_muzzle_precision", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Muzzle (Precision)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_muzzle_heavy", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Muzzle (Heavy)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_muzzle_slanted", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Muzzle (Slanted)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_muzzle_split", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Muzzle (Split)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_muzzle_squared", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Muzzle (Squared)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_muzzle_bell", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Muzzle (Bell)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_skin_luxe", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Weapon Skin (Luxe)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_skin_wood", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Weapon Skin (Wood)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_skin_metal", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Weapon Skin (Metal)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_skin_pearl", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Weapon Skin (Pearl)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_skin_camo", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Weapon Skin (Camo)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_skin_brushstroke", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Weapon Skin (Brushstroke)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_skin_woodland", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Weapon Skin (Woodland)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_skin_skull", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Weapon Skin (Skull)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_skin_sessanta", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Weapon Skin (Sessanta)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_skin_perseus", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Weapon Skin (Perseus)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_skin_leopard", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Weapon Skin (Leopard)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_skin_zebra", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Weapon Skin (Zebra)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_skin_geometric", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Weapon Skin (Geometric)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_skin_boom", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Weapon Skin (Boom)',
    weight = 1.0,
    category = "Weapon attachment"
})
ScriptShared.Items:Add("at_skin_patriotic", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = 'Weapon Skin (Patriotic)',
    weight = 1.0,
    category = "Weapon attachment"
})
