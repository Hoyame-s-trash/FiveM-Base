Locales["en"] = {
    ["shop_menu"] = "Carnival shop",

    ["mugshot"] = "mugshot",

    ["teddy"] = "Ours en peluche",
    ["bunch_of_flowers"] = "Bouquet de fleurs",
    ["rose"] = "Rose",

    ["enjoy_your_items"] = "Profitez de vos nouveaux articles que vous venez d'acheter !",
    ["no_space"] = "Vous transportez déjà trop de choses dans vos poches, jetez d'abord quelque chose puis revenez ici.",

    ["icecream_cnp"] = "Glace à la vanille, à la pistache et au chocolat.",
    ["icecream_csj"] = "Citron, Stracciatella, glace à la fraise",
    ["icecream_vbo"] = "glace à la cerise acide, à la myrtille, aux noix",

    ["holding_gift"] = "Vous tenez déjà un cadeau, il n'y a pas de raison d'obtenir quelque chose de nouveau pour la main, jetez-le d'abord puis venez.",
    ["holding_icecream"] = "Tu dois d'abord jeter la crème glacée ! Tu ne peux pas tenir plus de choses dans tes mains ! Et puis ça va se salir, bleh...",

    ["gift_info"] = "Appuyez sur ~INPUT_CONTEXT~ pour le donner à quelqu'un. Appuyez sur ~INPUT_DETONATE~ pour cacher le cadeau.",
    ["lick_info"] = "Appuyez sur ~INPUT_CONTEXT~ pour lécher la glace. Appuyez sur ~INPUT_DETONATE~ pour la jeter.",

    ["open_shop"] = "Appuyez sur ~INPUT_CONTEXT~ pour ouvrir la boutique.",

    ["new_highscore_personal"] = "Nouveau record personnel !",
    ["new_world_record"] = "RECORD MONDIAL !",

    ["player_denied"] = "Le joueur a refusé le cadeau :/ triste...",
    ["far_away"] = "Vous êtes trop éloigné de l'autre personne.",

    ["no_money"] = "Tu n'as pas assez d'argent. Il te faut au moins des $% d'argent !",
    ["no_tickets"] = "Vous n'avez pas assez de tickets. Vous avez besoin de %s de billets au moins !",

    ["play_carnival"] = "~INPUT_CONTEXT~ ~g~$%s~s~ Play\n~INPUT_ENTER~ Afficher les meilleurs scores",
    ["play_carnival_nohighscore"] = "~INPUT_CONTEXT~ ~g~$%s~s~ Play",

    ["play_carnival_free"] = "~INPUT_CONTEXT~ Jouer~INPUT_ENTER~ Voir les meilleurs scores",
    ["play_carnival_nohighscore_free"] = "~INPUT_CONTEXT~ Lecture",

    ["play_carnival_target_free"] = "Cliquez ici pour jouer",
    ["play_carnival_target"] = "Payer <font color = 'lime'>$%s</font> Jouer",
    ["play_carnival_target_score"] = "Voir les meilleurs scores",

    -- this will be displayed on beaver game machine its best to leave this as "gameover"
    ["gameover"] = "GAMEOVER",

    ["choose_difficulty"] = "Choisissez votre difficulté",

    ["choose_difficulty_highscore"] = "Afficher le meilleur score par difficulté",

    ["pay_title"] = "Vous devrez payer des %.",

    ["high_score_name"] = "Le score le plus élevé pour : %s",
    ["high_score_difficulty"] = "Pour la difficulté : %s",

    -- guides

    ["target_help"] = "Tireur d'élite !\n\n" ..
            "Vous y verrez deux types de cibles\n" ..
            "L'une est 'X', la deuxième cible est 'O'.\n\n" ..
            "Le but est de tirer le plus grand nombre possible de cibles de type 'O'. Tirer les cibles de type 'X' vous donne une pénalité.",

    ["beaver_help"] = "Bang The Beaver !\n\n" ..
            "Vous devez viser le Castor et le frapper.\n\n" ..
            "Il existe quatre types de castors\n" ..
            "~g~Le castor vert perd un point de vie.\n"  ..
            "~o~Castor brun~w~ : gagne un point\n"  ..
            "~y~Castor d'or : double points.\n" ..
            "~r~Castor rouge : fin de la partie.\n",

    ["claw_help"] = "Machine à pinces d'arcade\n\n" ..
            "Vous pouvez naviguer dans le crochet avec les commandes suivantes : ~INPUT_SCRIPT_PAD_UP~ ~INPUT_SCRIPT_PAD_DOWN~ ~INPUT_SCRIPT_PAD_LEFT~ ~INPUT_SCRIPT_PAD_RIGHT~\n\n" ..
            "Pour abaisser le crochet, utiliser ~INPUT_CREATOR_ACCEPT~ ou ~INPUT_VEH_HANDBRAKE~\n\n" ..
            "Quittez le jeu avec\n~INPUT_CELLPHONE_CANCEL~.",

    -- difficulty translator
    ["diff_" .. DifficultyType.EASY] = "Facile",
    ["diff_" .. DifficultyType.MEDIUM] = "Moyen",
    ["diff_" .. DifficultyType.HARD] = "Difficile",

    -- game translator
    ["game_" .. GameType.NONE] = "Aucun",
    ["game_" .. GameType.BANG_BEAVER] = "Bang le castor",
    ["game_" .. GameType.FORTUNE_TELLER] = "Tireuse de cartes Nazar",
    ["game_" .. GameType.BALLOON_SHOOTER] = "Tireur de ballons",
    ["game_" .. GameType.TARGET_SHOOTER] = "Tireur à la cible",
    ["game_" .. GameType.ARCADE_CLAW] = "Griffe d'arcade",
    ["game_" .. GameType.BASKET_THROW] = "Lancer de panier",

    ["no_money"] = "~r~Vous n'avez pas assez d'argent (%s).",
}