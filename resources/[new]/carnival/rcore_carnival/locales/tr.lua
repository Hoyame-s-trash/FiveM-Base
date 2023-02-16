Locales["tr"] = {
    ["shop_menu"] = "Carnival shop",

    ["mugshot"] = "vesikalık fotoğraf",

    ["teddy"] = "Ayıcık",
    ["bunch_of_flowers"] = "Çiçek Buketi",
    ["rose"] = "Gül",

    ["enjoy_your_items"] = "Satın aldığın eşyaların  tadını çıkar!",
    ["no_space"] = "Çantan yeterince dolu, bir şeyleri yere bırakıp tekrar gel.",

    ["icecream_cnp"] = "Vanilla, Kiwi , Çikolatalı Dondurma",
    ["icecream_csj"] = "Limon, Stracciatella , Çilekli Dondurma",
    ["icecream_vbo"] = "Kiraz, Yaban mersini, Fındıklı Dondurma",

    ["holding_gift"] = "Zaten elinde bir Hediye var, birtane daha almak istiyorsan ilk önce elindekini bırak.",
    ["holding_icecream"] = "Dondurmayı atmalısın! Elin dolu! Ayrıca kirli olur...",

    ["gift_info"] = "Birine vermek için ~INPUT_CONTEXT~ ye bas\nSaklamak için ~INPUT_DETONATE~ ye bas",
    ["lick_info"] = "Dondurmanı yalamak için ~INPUT_CONTEXT~ \nAtmak için ~INPUT_DETONATE~ ",

    ["open_shop"] = "Shopu açmak için ~INPUT_CONTEXT~",

    ["new_highscore_personal"] = "Yeni kişisel rekor!",
    ["new_world_record"] = "DÜNYA REKORU!",

    ["player_denied"] = "Oyuncu hediyeyi red etti :/ üzücü...",
    ["far_away"] = "Diğer oyuncuya çok uzaksın",

    ["no_money"] = "Yeterli Paran yok. En az $%s ya ihtiyacın var!",
    ["no_tickets"] = "Yeterli Biletin yok. En az %s Bilete ihtiyacın var!",

    ["play_carnival"] = "~INPUT_CONTEXT~ ~g~$%s~s~ Oyna\n~INPUT_ENTER~ Rekor görüntüle",
    ["play_carnival_nohighscore"] = "~INPUT_CONTEXT~ ~g~$%s~s~ Oyna",

    ["play_carnival_free"] = "~INPUT_CONTEXT~ Oyna\n~INPUT_ENTER~ Rekor görüntüle",
    ["play_carnival_nohighscore_free"] = "~INPUT_CONTEXT~ Oyun",

    ["play_carnival_target_free"] = "Oynamak için buraya bas",
    ["play_carnival_target"] = "Öde <font color = 'lime'>$%s</font> Oyna",
    ["play_carnival_target_score"] = "Rekor görüntüle",

    -- bu, kunduz oyun makinesinde gösterilecek, bunu "gameover" olarak bırakmak en iyisi
    ["gameover"] = "GAMEOVER",

    ["choose_difficulty"] = "Zorluğunu seç",

    ["choose_difficulty_highscore"] = "Zorluğa göre rekorları görüntüle",

    ["pay_title"] = "$%s ödemen gerekiyor",

    ["high_score_name"] = "%s : için en iyi skor",
    ["high_score_difficulty"] = "%s : zorluk için ",

    -- rehberler

    ["target_help"] = "Hedef Atıcı!\n\n" ..
            "İki tip hedef göreceksin\n" ..
            "Biri 'X' diğeri ise 'O'\n\n" ..
            "Amaç 'O' olandan olabildiğince fazla vurmak.Eğer 'X'i vurursan ceza alırsın.",

    ["beaver_help"] = "Kunduz Bang!\n\n" ..
            "Kunduzu hedefleyip vurman gerekiyor.\n\n" ..
            "Dört farklı Kunduz var\n" ..
            "~g~Yeşil Kunduz~w~: bir hp kaybettirir\n"  ..
            "~o~Kahve Kunduz~w~: puan kazandırır\n"  ..
            "~y~Altın Kunduz~w~: Çift puan\n" ..
            "~r~Kırmızı Kunduz~w~: game over\n",

    ["claw_help"] = "Arcade Pençe Makinesi\n\n" ..
            "Pençeyi hareket ettir\n~INPUT_SCRIPT_PAD_UP~ ~INPUT_SCRIPT_PAD_DOWN~ ~INPUT_SCRIPT_PAD_LEFT~ ~INPUT_SCRIPT_PAD_RIGHT~\n\n" ..
            "Penceyi indirmek için\n~INPUT_CREATOR_ACCEPT~ veya ~INPUT_VEH_HANDBRAKE~\n\n" ..
            "Oyundan çıkmak için\n~INPUT_CELLPHONE_CANCEL~",

    -- zorluk çevirisi
    ["diff_" .. DifficultyType.EASY] = "Kolay",
    ["diff_" .. DifficultyType.MEDIUM] = "Medium",
    ["diff_" .. DifficultyType.HARD] = "Zor",

    -- oyun çevirisi
    ["game_" .. GameType.NONE] = "Hiç",
    ["game_" .. GameType.BANG_BEAVER] = "Kunduz Bang",
    ["game_" .. GameType.FORTUNE_TELLER] = "Falcı Nazar",
    ["game_" .. GameType.BALLOON_SHOOTER] = "Balon atıcı",
    ["game_" .. GameType.TARGET_SHOOTER] = "Hedef atıcı",
    ["game_" .. GameType.ARCADE_CLAW] = "Pençe Makinesi",
    ["game_" .. GameType.BASKET_THROW] = "Basketball",
}