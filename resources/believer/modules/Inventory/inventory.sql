CREATE TABLE `user_inventory` (
  `id` int(11) NOT NULL,
  `identifier` varchar(55) NOT NULL,
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `user_inventory`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `user_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
COMMIT;