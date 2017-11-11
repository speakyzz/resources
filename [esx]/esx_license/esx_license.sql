USE `essentialmode`;

CREATE TABLE `licenses` (
  
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  
  PRIMARY KEY (`id`)
);

CREATE TABLE `user_licenses` (
  
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  
  PRIMARY KEY (`id`)
);

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
('dmv', 'Code de la route', 1, 0, 0),
('drive', 'Permis de conduire', 1, 0, 0),
('drive_bike', 'Permis moto', 1, 0, 0),
('drive_truck', 'Permis camion', 1, 0, 0),
('weapon', 'Permis d\'arme', 1, 0, 0);
