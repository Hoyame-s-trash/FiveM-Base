GM.Admin = GM.Admin or {}

GM.Admin.ReportCooldown = 10 -- Minutes

GM.Admin.Permissions = {
    ["CREATE_RANK"] = {
        label = "Créer un rank",
        description = "Permet de créer un rank",
        error = "~r~Vous n'avez pas la permission de créer un nouveau rank.",
        value = false
    },
    ["RECRUIT_PLAYER_RANK"] = {
        label = "Recruter un joueur",
        description = "Permet de recruter un joueur dans un rank",
        error = "~r~Vous n'avez pas la permission de recruter un joueur dans un rank.",
        value = false
    },
    ["KICK_PLAYER_RANK"] = {
        label = "Expulser un joueur d'un rank",
        description = "Permet d'expulser un joueur d'un rank",
        error = "~r~Vous n'avez pas la permission d'expulser un joueur d'un rank.",
        value = false
    },
    ["MANAGE_RANK_COMMANDS"] = {
        label = "Gérer les commandes d'un rank",
        description = "Permet de gérer les commandes d'un rank",
        error = "~r~Vous n'avez pas la permission de gérer les commandes d'un rank.",
        value = false
    },
    ["MANAGE_RANK_PERMISSIONS"] = {
        label = "Gérer les permissions d'un rank",
        description = "Permet de gérer les permissions d'un rank",
        error = "~r~Vous n'avez pas la permission de gérer les permissions d'un rank.",
        value = false
    },
}