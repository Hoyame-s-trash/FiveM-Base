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
    ["MY_PLAYER_GIVEALLWEAPONS"] = {
        label = "Donner toutes les armes",
        description = "Permet de donner toutes les armes",
        error = "~r~Vous n'avez pas la permission de donner toutes les armes.",
        value = false
    },
    ["MY_PLAYER_REMOVEALLWEAPONS"] = {
        label = "Retirer toutes les armes",
        description = "Permet de retirer toutes les armes",
        error = "~r~Vous n'avez pas la permission de retirer toutes les armes.",
        value = false
    },
    ["MY_PLAYER_GAMERTAG"] = {
        label = "Afficher les gamertags",
        description = "Permet d'afficher les gamertags",
        error = "~r~Vous n'avez pas la permission d'afficher les gamertags.",
        value = false
    },
    ["MY_PLAYER_BLIPS"] = {
        label = "Afficher les blips",
        description = "Permet d'afficher les blips",
        error = "~r~Vous n'avez pas la permission d'afficher les blips.",
        value = false
    },
    ["MY_PLAYER_INVISIBLESTAFF"] = {
        label = "Invisible par les admins",
        description = "Permet de ne pas être vu par les admins",
        error = "~r~Vous n'avez pas la permission d'être invisible par les admins.",
        value = false
    },
    ["CREATE_DRUGS"] = {
        label = "Créer une drogue",
        description = "Permet de créer une drogue",
        error = "~r~Vous n'avez pas la permission de créer une drogue.",
        value = false
    },
    ["DELETE_DRUGS"] = {
        label = "Supprimer une drogue",
        description = "Permet de créer des drogues",
        error = "~r~Vous n'avez pas la permission de créer des drogues.",
        value = false
    },
    ["MODIFY_DRUGS"] = {
        label = "Modifié une drogue",
        description = "Permet de modifié une drogue",
        error = "~r~Vous n'avez pas la permission de modifié une drogue.",
        value = false
    },
    ["SEND_ALL_CHAT"] = {
        label = "Envoyer des chat (ALL)",
        description = "Permet d'envoyer des chat (ALL)",
        error = "~r~Vous n'avez pas la permission d'envoyer des chat (ALL).",
        value = false
    },
}