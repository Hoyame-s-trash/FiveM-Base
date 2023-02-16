Locales["en"] = {
    ["shop_menu"] = "Carnival shop",

    ["mugshot"] = "mugshot",

    ["teddy"] = "Teddy bear",
    ["bunch_of_flowers"] = "Bunch of flowers",
    ["rose"] = "Rose",

    ["enjoy_your_items"] = "Enjoy your new items you just bought!",
    ["no_space"] = "You already carry too much in your pockets, throw something out first then go here again.",

    ["icecream_cnp"] = "Vanilla, Pistachio, Chocolate ice cream",
    ["icecream_csj"] = "Lemon, Stracciatella , Strawberry ice cream",
    ["icecream_vbo"] = "sour cherry, Blueberry, Nuts ice cream",

    ["holding_gift"] = "You're holding gift already there isnt point of getting anything new to the hand, throw away it first then come.",
    ["holding_icecream"] = "You gotta first throw away the ice cream! You cant hold more things in your hands! Also it would get dirty bleh...",

    ["gift_info"] = "Press ~INPUT_CONTEXT~ to give it to someone\nPress ~INPUT_DETONATE~ to hide the gift",
    ["lick_info"] = "Press ~INPUT_CONTEXT~ to lick ice cream\nPress ~INPUT_DETONATE~ to throw it away",

    ["open_shop"] = "Press ~INPUT_CONTEXT~ to open shop",

    ["new_highscore_personal"] = "New personal record!",
    ["new_world_record"] = "WORLD RECORD!",

    ["player_denied"] = "Player denied the gift :/ sad...",
    ["far_away"] = "You're too far away from the other person",

    ["no_money"] = "You dont have enough money. You need $%s money at least!",
    ["no_tickets"] = "You dont have enough tickets. You need %s tickets at least!",

    ["play_carnival"] = "~INPUT_CONTEXT~ ~g~$%s~s~ Play\n~INPUT_ENTER~ View high scores",
    ["play_carnival_nohighscore"] = "~INPUT_CONTEXT~ ~g~$%s~s~ Play",

    ["play_carnival_free"] = "~INPUT_CONTEXT~ Play\n~INPUT_ENTER~ View high scores",
    ["play_carnival_nohighscore_free"] = "~INPUT_CONTEXT~ Play",

    ["play_carnival_target_free"] = "Click here to play",
    ["play_carnival_target"] = "Pay <font color = 'lime'>$%s</font> Play",
    ["play_carnival_target_score"] = "View high scores",

    -- this will be displayed on beaver game machine its best to leave this as "gameover"
    ["gameover"] = "GAMEOVER",

    ["choose_difficulty"] = "Choose your difficulty",

    ["choose_difficulty_highscore"] = "View highest score per difficulty",

    ["pay_title"] = "You will have to pay $%s",

    ["high_score_name"] = "Highest score for: %s",
    ["high_score_difficulty"] = "For difficulty: %s",

    -- guides

    ["target_help"] = "Target Shooter!\n\n" ..
            "You will see two types of target in there\n" ..
            "One is 'X' the second target is 'O'\n\n" ..
            "The goal is to shoot as many targets of type 'O' as possible. Shooting the 'X' targets gives you a penalty.",

    ["beaver_help"] = "Bang The Beaver!\n\n" ..
            "You need to aim at the Beaver and then hit it.\n\n" ..
            "There are four types of Beaver\n" ..
            "~g~Green Beaver~w~: loses one hp\n"  ..
            "~o~Brown Beaver~w~: earns point\n"  ..
            "~y~Gold Beaver~w~: double points\n" ..
            "~r~Red Beaver~w~: game over\n",

    ["claw_help"] = "Arcade Claw Machine\n\n" ..
            "You can navigate the hook with\n~INPUT_SCRIPT_PAD_UP~ ~INPUT_SCRIPT_PAD_DOWN~ ~INPUT_SCRIPT_PAD_LEFT~ ~INPUT_SCRIPT_PAD_RIGHT~\n\n" ..
            "For lowering the hook use\n~INPUT_CREATOR_ACCEPT~ or ~INPUT_VEH_HANDBRAKE~\n\n" ..
            "Leave the game with\n~INPUT_CELLPHONE_CANCEL~",

    -- difficulty translator
    ["diff_" .. DifficultyType.EASY] = "Easy",
    ["diff_" .. DifficultyType.MEDIUM] = "Medium",
    ["diff_" .. DifficultyType.HARD] = "Hard",

    -- game translator
    ["game_" .. GameType.NONE] = "None",
    ["game_" .. GameType.BANG_BEAVER] = "Bang the beaver",
    ["game_" .. GameType.FORTUNE_TELLER] = "Nazar fortune teller",
    ["game_" .. GameType.BALLOON_SHOOTER] = "Balloon shooter",
    ["game_" .. GameType.TARGET_SHOOTER] = "Target shooter",
    ["game_" .. GameType.ARCADE_CLAW] = "Arcade claw",
    ["game_" .. GameType.BASKET_THROW] = "Basket throw",
}