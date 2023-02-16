CREATE TABLE `basketball_rpg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(64) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



-- ITEMS ONLY FOR ESX (QBCore uses items.lua file, see README.md)
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('basketball',	'Basketball',	0,	0,	1),
('basketball_hoop',	'Basketball Hoop',	0,	0,	1);