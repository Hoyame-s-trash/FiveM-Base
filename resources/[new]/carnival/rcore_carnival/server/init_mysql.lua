MySQL.ready(function()
    MySQL.Sync.execute([[
        CREATE TABLE IF NOT EXISTS `carnival_highscores` (
            `id` INT(11) NOT NULL AUTO_INCREMENT ,
            `player_identifier` varchar(128) NOT NULL,
            `player_name` varchar(128) NOT NULL,
            `game_identifier` varchar(64) NOT NULL,
            `score` int(11) NOT NULL DEFAULT '0',
            `difficulty` int(11) NOT NULL DEFAULT '0',
        PRIMARY KEY (`id`));
        ]], {})
end)