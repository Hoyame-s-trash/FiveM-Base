GM.Police = GM.Police or {}

GM.Police.Lockers = {
    vector3(-1098.2945556641,-827.35394287109,26.827430725098),
}

GM.Police.Garage = {
    {
        name = "garage_1",
        label = "Garage 1",
        position = vector3(-1073.4967041016,-859.30712890625,4.8674116134644),
        helpNotification = "pour ouvrir le garage.",
        ped = {
            model = GetHashKey("s_f_y_cop_01"),
            position = vector3(-1075.6857910156,-858.44702148438,5.0418553352356),
            heading = 243.77
        },
        vehicles = {
            position = {
                vector4(-1070.6469726563,-857.72442626953,4.240786075592, 308.97),
            },
            list = {
                ["unmarked"] = {
                    "sultanrs",
                },
                ["all"] = {
                    "infernus",
                }
            },
        }
    },
}

GM.Police.Duty = {
    {
        name = "duty_1",
        label = "Prise de service 1",
        position = vector3(-1091.3719482422,-820.21496582031,27.034378051758),
        helpNotification = "pour prendre votre service.",
        ped = {
            model = GetHashKey("s_f_y_cop_01"),
            position = vector3(-1075.6857910156,-858.44702148438,5.0418553352356),
            heading = 243.77
        },
        vehicles = {
            position = {
                vector4(-1070.6469726563,-857.72442626953,4.240786075592, 308.97),
            },
            list = {
                ["unmarked"] = {
                    "sultanrs",
                },
                ["all"] = {
                    "infernus",
                }
            },
        }
    },
}