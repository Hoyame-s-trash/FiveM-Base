GM.AtmRobbery = GM.AtmRobbery or {}

GM.AtmRobbery.MinCops = 4
GM.AtmRobbery.RopeAnimDuration = 8000
GM.AtmRobbery.LootDuration = 60000
GM.AtmRobbery.MaxRopeLength = 8.0
GM.AtmRobbery.HitTarget = 2 -- nb of hits required to detach atm
GM.AtmRobbery.RandomCashMax = 100 -- + value in economy

GM.AtmRobbery.LosSantosPoint = vector3(-255.94, -983.93, 30.21)
GM.AtmRobbery.NorthPoint = vector3(882.54, 4948.51, 282.19)

GM.AtmRobbery.Models = {
    [`prop_fleeca_atm`] = {
        Destroyed = `bay_fleeca_atm_des`,
        Console = `bay_fleeca_atm_console`,
    },
    [`prop_atm_02`] = {
        Destroyed = `bay_atm_02_des`,
        Console = `bay_atm_02_console`,
    },
    [`prop_atm_03`] = {
        Destroyed = `bay_atm_03_des`,
        Console = `bay_atm_03_console`,
    },
}

GM.AtmRobbery.AllowedClass = {
	[0]  = true,  -- Compacts
	[1]  = true,  -- Sedans
	[2]  = true,  -- SUVs
	[3]  = true,  -- Coupes
	[4]  = true,  -- Muscle
	[5]  = true,  -- Sports Classics
	[6]  = true,  -- Sports
	[7]  = false, -- Super
	[8]  = false, -- Motorcycles
	[9]  = true,  -- Off-road
	[10] = true,  -- Industrial
	[11] = true,  -- Utility
	[12] = true,  -- Vans
	[13] = false, -- Cycles
	[14] = false, -- Boats
	[15] = true,  -- Helicopters
	[16] = true,  -- Planes
	[17] = true,  -- Service
	[18] = false, -- Emergency
	[19] = true,  -- Military
	[20] = true,  -- Commercial
	[21] = false, -- Trains
	[22] = false, -- Open Wheel
}