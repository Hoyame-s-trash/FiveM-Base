ALTER TABLE `users` ADD COLUMN `animation` longtext COLLATE utf8mb4_bin;
ALTER TABLE `users` ADD COLUMN `demarche` longtext COLLATE utf8mb4_bin;
ALTER TABLE `users` ADD COLUMN `expression` longtext COLLATE utf8mb4_bin;

CREATE TABLE IF NOT EXISTS `bluestark_animation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) NOT NULL,
  `nameanim` varchar(100) NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;