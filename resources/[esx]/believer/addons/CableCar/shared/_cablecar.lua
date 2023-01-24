GM.CableCar = GM.CableCar or {}

GM.CableCar.DoorMoveDuration = 5*1000
GM.CableCar.CableCarTravelTime = 3*60*1000
GM.CableCar.Duration = GM.CableCar.DoorMoveDuration + GM.CableCar.CableCarTravelTime + GM.CableCar.DoorMoveDuration
GM.CableCar.Price = 15
GM.CableCar.Corners = {
    vector3(1.5,  3.25, -5.0),
    vector3(1.5, -3.25, -5.0),
    vector3(-1.5,-3.25, -5.0),
    vector3(-1.5, 3.25, -5.0),
}

GM.CableCar.Tracks = {
    {
        Rotation = vector3(0.0, 0.0, 270.0),
        Coords = {
            vector3(-740.911, 5599.341, 47.25),
            vector3(-739.557, 5599.346, 46.997),
            vector3(-581.009, 5596.517, 77.379),
            vector3(-575.717, 5596.388, 79.22),
            vector3(-273.805, 5590.844, 240.795),
            vector3(-268.707, 5590.744, 243.395),
            vector3(6.896, 5585.668, 423.614),
            vector3(11.774, 5585.591, 426.711),
            vector3(236.82, 5581.445, 599.642),
            vector3(241.365, 5581.369, 603.183),
            vector3(412.855, 5578.216, 774.401),
            vector3(417.541, 5578.124, 777.688),
            vector3(444.93, 5577.589, 786.535),
            vector3(446.288, 5577.59, 786.75),
        }
    },
    {
        Rotation = vector3(0.0, 0.0, 90.0),
        Coords = {
            vector3(446.291, 5566.377, 786.75),
            vector3(444.937, 5566.383, 786.551),
            vector3(417.371, 5567.001, 777.708),
            vector3(412.661, 5567.085, 774.439),
            vector3(241.31, 5570.594, 603.137),
            vector3(236.821, 5570.663, 599.561),
            vector3(11.35, 5575.298, 426.629),
            vector3(6.575, 5575.391, 423.57),
            vector3(-268.965, 5580.996, 243.386),
            vector3(-273.993, 5581.124, 240.808),
            vector3(-575.898, 5587.286, 79.251),
            vector3(-581.321, 5587.4, 77.348),
            vector3(-739.646, 5590.614, 47.006),
            vector3(-740.97, 5590.617, 47.306),
        },
    },
}

GM.CableCar.UpAnim = {
    {
        [1]  = 'c1_up_9',
        [2]  = 'c1_up_1',
        [4]  = 'c1_up_3',
        [6]  = 'c1_up_4',
        [8]  = 'c1_up_5',
        [10] = 'c1_up_6',
        [12] = 'c1_up_8',
        [13] = 'c1_up_9',
    },
    {
        [1]  = 'c2_up_9',
        [2]  = 'c2_up_1',
        [4]  = 'c2_up_3',
        [6]  = 'c2_up_4',
        [8]  = 'c2_up_5',
        [10] = 'c2_up_6',
        [12] = 'c2_up_8',
        [13] = 'c2_up_9',
    },
}

GM.CableCar.DownAnim = {
    {
        [1]  = 'c1_down_1',
        [2]  = 'c1_down_2',
        [4]  = 'c1_down_3',
        [6]  = 'c1_down_4',
        [8]  = 'c1_down_5',
        [10] = 'c1_down_6',
        [12] = 'c1_down_8',
        [13] = 'c1_down_9',
    },
    {
        [1]  = 'c2_down_1',
        [2]  = 'c2_down_2',
        [4]  = 'c2_down_3',
        [6]  = 'c2_down_4',
        [8]  = 'c2_down_5',
        [10] = 'c2_down_6',
        [12] = 'c2_down_8',
        [13] = 'c2_down_9',
    },
}