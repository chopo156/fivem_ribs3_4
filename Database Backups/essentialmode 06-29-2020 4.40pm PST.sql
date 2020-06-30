/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `arrests_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `json_data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

CREATE TABLE `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(40) NOT NULL,
  `sender` varchar(40) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=549 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `bolos_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `json_data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `bwh_bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver` text NOT NULL,
  `sender` varchar(60) NOT NULL,
  `length` datetime DEFAULT NULL,
  `reason` text NOT NULL,
  `unbanned` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `bwh_identifiers` (
  `steam` varchar(60) NOT NULL,
  `license` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  `xbl` varchar(60) DEFAULT NULL,
  `live` varchar(60) DEFAULT NULL,
  `discord` varchar(60) DEFAULT NULL,
  `fivem` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`steam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `bwh_warnings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver` text NOT NULL,
  `sender` varchar(60) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `communityservice` (
  `identifier` varchar(100) NOT NULL,
  `actions_remaining` int(10) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=355 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `fine_types_mafia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `fine_types_muckyguns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `glovebox_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=596 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `limit` int(11) NOT NULL DEFAULT '-1',
  `rare` int(11) NOT NULL DEFAULT '0',
  `can_remove` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `owned_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `owned_vehicles` (
  `owner` varchar(22) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `stored` tinyint(1) NOT NULL DEFAULT '0',
  `modelname` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL COMMENT 'Name',
  `num` varchar(10) NOT NULL COMMENT 'Phone Number',
  `incoming` int(11) NOT NULL COMMENT 'Define Incoming Call',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accepts` int(11) NOT NULL COMMENT 'Accept Call',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isRead` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3309 DEFAULT CHARSET=utf8;

CREATE TABLE `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

CREATE TABLE `playerstattoos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `tattoos` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entering` varchar(255) DEFAULT NULL,
  `exit` varchar(255) DEFAULT NULL,
  `inside` varchar(255) DEFAULT NULL,
  `outside` varchar(255) DEFAULT NULL,
  `ipls` varchar(255) DEFAULT '[]',
  `gateway` varchar(255) DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `qalle_brottsregister` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dateofcrime` varchar(255) NOT NULL,
  `crime` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `trunk_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) NOT NULL,
  `name` varchar(50) NOT NULL,
  `money` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `user_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) NOT NULL,
  `item` varchar(50) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6300 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `users` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `skin` longtext COLLATE utf8mb4_bin,
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT '0',
  `loadout` longtext COLLATE utf8mb4_bin,
  `position` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `lastname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `dateofbirth` varchar(25) COLLATE utf8mb4_bin DEFAULT '',
  `sex` varchar(10) COLLATE utf8mb4_bin DEFAULT '',
  `height` varchar(5) COLLATE utf8mb4_bin DEFAULT '',
  `is_dead` tinyint(1) DEFAULT '0',
  `jail` int(11) NOT NULL DEFAULT '0',
  `status` longtext COLLATE utf8mb4_bin,
  `phone_number` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `wanted` int(11) NOT NULL DEFAULT '0',
  `last_property` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `vehicles_for_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `vehicleProps` longtext NOT NULL,
  `price` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

CREATE TABLE `warrants_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `json_data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `weashops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('caution', 'caution', 0);
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('property_black_money', 'Money Sale Property', 0);
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('society_ambulance', 'EMS', 1);
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('society_cardealer', 'Cardealer', 1),
('society_lizard', 'lizard', 1),
('society_mafia', 'Mafia', 1),
('society_mecano', 'Mechanic', 1),
('society_muckyguns', 'Mucky Guns', 1),
('society_police', 'Police', 1),
('society_taxi', 'Taxi', 1);

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(1, 'society_ambulance', 0, NULL);
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(2, 'society_cardealer', 0, NULL);
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(3, 'society_mafia', 0, NULL);
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(4, 'society_mecano', 751265, NULL),
(5, 'society_police', 8080, NULL),
(6, 'society_taxi', 217901, NULL),
(105, 'society_muckyguns', 2327340, NULL),
(144, 'society_lizard', 0, NULL),
(145, 'caution', 0, 'steam:11000013b44adb1'),
(146, 'property_black_money', 0, 'steam:11000013b44adb1'),
(147, 'caution', 0, 'steam:110000102beb001'),
(148, 'property_black_money', 2000000000, 'steam:110000102beb001');

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('property', 'Property', 0);
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('society_ambulance', 'EMS', 1);
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('society_cardealer', 'Cardealer', 1);
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('society_lizard', 'lizard', 1),
('society_mafia', 'Mafia', 1),
('society_mecano', 'Mechanic', 1),
('society_muckyguns', 'Mucky Guns', 1),
('society_police', 'Police', 1),
('society_taxi', 'Taxi', 1);

INSERT INTO `addon_inventory_items` (`id`, `inventory_name`, `name`, `count`, `owner`) VALUES
(2, 'society_mecano', 'fixkit', 204, NULL);
INSERT INTO `addon_inventory_items` (`id`, `inventory_name`, `name`, `count`, `owner`) VALUES
(3, 'society_mecano', 'fixtool', 29, NULL);
INSERT INTO `addon_inventory_items` (`id`, `inventory_name`, `name`, `count`, `owner`) VALUES
(4, 'society_mecano', 'turbo', 9, NULL);
INSERT INTO `addon_inventory_items` (`id`, `inventory_name`, `name`, `count`, `owner`) VALUES
(5, 'society_police', 'marijuana', 0, NULL),
(6, 'society_police', 'coke', 0, NULL),
(7, 'society_police', 'crack', 0, NULL),
(8, 'society_police', 'cannabis', 0, NULL),
(17, 'society_police', 'gold_o', 1, NULL),
(18, 'society_police', 'jewels', 0, NULL),
(40, 'society_mafia', 'clip', 3, NULL),
(41, 'society_muckyguns', 'clip', 4, NULL),
(42, 'society_police', 'laptop', 3, NULL),
(43, 'society_police', 'armor2', 7, NULL),
(44, 'society_police', 'fixkit', 0, NULL),
(45, 'society_police', 'clip', 0, NULL),
(46, 'society_police', 'turbo', 2, NULL),
(57, 'society_muckyguns', 'donut2', 1442, NULL),
(58, 'society_muckyguns', 'tuning_laptop', 1, NULL),
(59, 'society_muckyguns', 'turbo', 7, NULL),
(60, 'society_muckyguns', 'advancedlockpick', 1, NULL),
(61, 'society_muckyguns', 'highradio', 0, NULL),
(62, 'society_muckyguns', 'clothe', 0, NULL),
(63, 'society_muckyguns', 'laptop', 6, NULL),
(64, 'society_muckyguns', 'ring', 0, NULL),
(65, 'society_muckyguns', 'iphone', 0, NULL),
(126, 'society_mecano', 'iphone', 4, NULL),
(129, 'society_muckyguns', 'jewels', 0, NULL),
(130, 'property', 'bread', 0, 'steam:110000102beb001');









INSERT INTO `bwh_identifiers` (`steam`, `license`, `name`, `xbl`, `live`, `discord`, `fivem`) VALUES
('steam:110000102beb001', 'license:7606a1ef4ffbc3a966cec879b9c41931fb40df58', 'Nx2', 'xbl:2535451381380815', 'live:985153991628540', 'discord:177998451462635520', NULL);
INSERT INTO `bwh_identifiers` (`steam`, `license`, `name`, `xbl`, `live`, `discord`, `fivem`) VALUES
('steam:11000013b44adb1', 'license:ef3ca6eccb89b84e1ec6af72f8c5afc214662d24', 'house', NULL, NULL, 'discord:603359540905508875', NULL);








INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('property', 'Outfits', 0);
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('society_ambulance', 'EMS', 1);
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('society_mafia', 'Mafia', 1);
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('society_muckyguns', 'Mucky Guns', 1),
('society_police', 'Police', 1),
('user_ears', 'Ears', 0),
('user_glasses', 'Glasses', 0),
('user_helmet', 'Helmet', 0),
('user_mask', 'Mask', 0);

INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(1, 'society_ambulance', NULL, '{}');
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(2, 'society_mafia', NULL, '{}');
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(3, 'society_police', NULL, '{\"weapons\":[{\"name\":\"WEAPON_POOLCUE\",\"count\":1},{\"name\":\"WEAPON_SWITCHBLADE\",\"count\":3},{\"name\":\"WEAPON_PISTOL\",\"count\":2},{\"name\":\"WEAPON_BAT\",\"count\":3},{\"name\":\"WEAPON_KNIFE\",\"count\":1},{\"name\":\"WEAPON_NIGHTSTICK\",\"count\":3},{\"name\":\"WEAPON_COMBATPISTOL\",\"count\":2},{\"name\":\"WEAPON_STUNGUN\",\"count\":3},{\"name\":\"WEAPON_FLASHLIGHT\",\"count\":2},{\"name\":\"WEAPON_PETROLCAN\",\"count\":5},{\"name\":\"WEAPON_HATCHET\",\"count\":3},{\"name\":\"WEAPON_BATTLEAXE\",\"count\":2},{\"name\":\"WEAPON_PUMPSHOTGUN\",\"count\":2},{\"name\":\"WEAPON_HAMMER\",\"count\":1},{\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1},{\"name\":\"WEAPON_ADVANCEDRIFLE\",\"count\":1}]}');
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(249, 'society_muckyguns', NULL, '{\"weapons\":[{\"count\":2,\"name\":\"WEAPON_FLASHLIGHT\"},{\"count\":4,\"name\":\"WEAPON_PETROLCAN\"},{\"count\":1,\"name\":\"WEAPON_COMBATPISTOL\"},{\"count\":1,\"name\":\"WEAPON_ASSAULTSMG\"},{\"count\":1,\"name\":\"WEAPON_NIGHTSTICK\"},{\"count\":1,\"name\":\"WEAPON_SMOKEGRENADE\"},{\"count\":0,\"name\":\"WEAPON_STUNGUN\"},{\"count\":1,\"name\":\"WEAPON_FLARE\"},{\"count\":2,\"name\":\"WEAPON_PUMPSHOTGUN\"},{\"count\":0,\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"count\":1,\"name\":\"WEAPON_BAT\"},{\"count\":1,\"name\":\"WEAPON_BOTTLE\"},{\"count\":0,\"name\":\"WEAPON_ADVANCEDRIFLE\"},{\"count\":0,\"name\":\"WEAPON_HAMMER\"},{\"count\":0,\"name\":\"WEAPON_KNIFE\"},{\"count\":1,\"name\":\"WEAPON_GOLFCLUB\"},{\"count\":0,\"name\":\"WEAPON_CROWBAR\"},{\"count\":1,\"name\":\"WEAPON_MACHETE\"},{\"count\":1,\"name\":\"WEAPON_WRENCH\"},{\"count\":3,\"name\":\"WEAPON_PISTOL\"},{\"count\":1,\"name\":\"WEAPON_BALL\"}]}'),
(345, 'property', 'steam:11000013b44adb1', '{}'),
(346, 'user_ears', 'steam:11000013b44adb1', '{}'),
(347, 'user_glasses', 'steam:11000013b44adb1', '{}'),
(348, 'user_helmet', 'steam:11000013b44adb1', '{}'),
(349, 'user_mask', 'steam:11000013b44adb1', '{}'),
(350, 'property', 'steam:110000102beb001', '{}'),
(351, 'user_ears', 'steam:110000102beb001', '{}'),
(352, 'user_glasses', 'steam:110000102beb001', '{}'),
(353, 'user_helmet', 'steam:110000102beb001', '{}'),
(354, 'user_mask', 'steam:110000102beb001', '{}');

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Misuse of a horn', 30, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(2, 'Illegally Crossing a continuous Line', 40, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(3, 'Driving on the wrong side of the road', 250, 0);
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(4, 'Illegal U-Turn', 250, 0),
(5, 'Illegally Driving Off-road', 170, 0),
(6, 'Refusing a Lawful Command', 30, 0),
(7, 'Illegally Stopping a Vehicle', 150, 0),
(8, 'Illegal Parking', 70, 0),
(9, 'Failing to Yield to the right', 70, 0),
(10, 'Failure to comply with Vehicle Information', 90, 0),
(11, 'Failing to stop at a Stop Sign ', 105, 0),
(12, 'Failing to stop at a Red Light', 130, 0),
(13, 'Illegal Passing', 100, 0),
(14, 'Driving an illegal Vehicle', 100, 0),
(15, 'Driving without a License', 1500, 0),
(16, 'Hit and Run', 800, 0),
(17, 'Exceeding Speeds Over < 5 mph', 90, 0),
(18, 'Exceeding Speeds Over 5-15 mph', 120, 0),
(19, 'Exceeding Speeds Over 15-30 mph', 180, 0),
(20, 'Exceeding Speeds Over > 30 mph', 300, 0),
(21, 'Impeding traffic flow', 110, 1),
(22, 'Public Intoxication', 90, 1),
(23, 'Disorderly conduct', 90, 1),
(24, 'Obstruction of Justice', 130, 1),
(25, 'Insults towards Civilans', 75, 1),
(26, 'Disrespecting of an LEO', 110, 1),
(27, 'Verbal Threat towards a Civilan', 90, 1),
(28, 'Verbal Threat towards an LEO', 150, 1),
(29, 'Providing False Information', 250, 1),
(30, 'Attempt of Corruption', 1500, 1),
(31, 'Brandishing a weapon in city Limits', 120, 2),
(32, 'Brandishing a Lethal Weapon in city Limits', 300, 2),
(33, 'No Firearms License', 600, 2),
(34, 'Possession of an Illegal Weapon', 700, 2),
(35, 'Possession of Burglary Tools', 300, 2),
(36, 'Grand Theft Auto', 1800, 2),
(37, 'Intent to Sell/Distrube of an illegal Substance', 1500, 2),
(38, 'Frabrication of an Illegal Substance', 1500, 2),
(39, 'Possession of an Illegal Substance ', 650, 2),
(40, 'Kidnapping of a Civilan', 1500, 2),
(41, 'Kidnapping of an LEO', 2000, 2),
(42, 'Robbery', 650, 2),
(43, 'Armed Robbery of a Store', 650, 2),
(44, 'Armed Robbery of a Bank', 1500, 2),
(45, 'Assault on a Civilian', 2000, 3),
(46, 'Assault of an LEO', 2500, 3),
(47, 'Attempt of Murder of a Civilian', 3000, 3),
(48, 'Attempt of Murder of an LEO', 5000, 3),
(49, 'Murder of a Civilian', 10000, 3),
(50, 'Murder of an LEO', 30000, 3),
(51, 'Involuntary manslaughter', 1800, 3),
(52, 'Fraud', 2000, 2);

INSERT INTO `fine_types_mafia` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Raket', 3000, 0);
INSERT INTO `fine_types_mafia` (`id`, `label`, `amount`, `category`) VALUES
(2, 'Raket', 5000, 0);
INSERT INTO `fine_types_mafia` (`id`, `label`, `amount`, `category`) VALUES
(3, 'Raket', 10000, 1);
INSERT INTO `fine_types_mafia` (`id`, `label`, `amount`, `category`) VALUES
(4, 'Raket', 20000, 1),
(5, 'Raket', 50000, 2),
(6, 'Raket', 150000, 3),
(7, 'Raket', 350000, 3);

INSERT INTO `fine_types_muckyguns` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Raket', 3000, 0);
INSERT INTO `fine_types_muckyguns` (`id`, `label`, `amount`, `category`) VALUES
(2, 'Raket', 5000, 0);
INSERT INTO `fine_types_muckyguns` (`id`, `label`, `amount`, `category`) VALUES
(3, 'Raket', 10000, 1);
INSERT INTO `fine_types_muckyguns` (`id`, `label`, `amount`, `category`) VALUES
(4, 'Raket', 20000, 1),
(5, 'Raket', 50000, 2),
(6, 'Raket', 150000, 3),
(7, 'Raket', 350000, 3);



INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
('advancedlockpick', 'Multi-pick', 5, 0, 1);
INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
('airbag', 'Airbag', 6, 0, 1);
INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
('alive_chicken', 'Living chicken', 20, 0, 1);
INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
('armor', 'Armor', 2, 0, 1),
('armor2', 'Dense Armor', 2, 0, 1),
('bandage', 'Bandage', 15, 0, 1),
('bandage2', 'Small Bandage', 15, 0, 1),
('battery', 'Car Battery', 5, 0, 1),
('beer', 'Beer', 7, 0, 1),
('binoculars', 'Binoculars', 1, 0, 1),
('blowpipe', 'Blowtorch', 10, 0, 1),
('bread', 'Bread', 15, 0, 1),
('camera', 'Gopro 8', 5, 0, 1),
('cannabinoid', 'Chemicals', 15, 0, 1),
('cannabis', 'Weed Plant', 30, 0, 1),
('carokit', 'Body Kit', 10, 0, 1),
('carotool', 'Tools', 10, 0, 1),
('cburger', 'Cheese Burger', 3, 0, 1),
('clip', 'Weapon Clip', 5, 0, 1),
('clothe', 'Clothes', 40, 0, 1),
('coffees', 'Hot Coffee', 4, 0, 1),
('coke', 'Coke', 30, 0, 1),
('cola', 'Can of Cola', 4, 0, 1),
('copper', 'Copper', 55, 0, 1),
('crack', 'Crack', 15, 0, 1),
('cutted_wood', 'Cut wood', 30, 0, 1),
('dcburger', 'Double Cheese Burger', 2, 0, 1),
('diamond', 'Diamond', 35, 0, 1),
('donut', 'Donut', 15, 0, 1),
('donut2', 'Glazed Donut', 20, 0, 1),
('essence', 'Gas', 50, 0, 1),
('fabric', 'Fabric', 80, 0, 1),
('fish', 'Fish', 100, 0, 1),
('fishbait', 'Fish Bait', 8, 0, 1),
('fishingrod', 'Fishing rod', 3, 0, 1),
('fixkit', 'Repair Kit', 10, 0, 1),
('fixtool', 'Repair Tools', 10, 0, 1),
('fountain', 'Fountain Firework', 5, 0, 1),
('fries', 'Small Fries', 4, 0, 1),
('fries2', 'Large Fries', 5, 0, 1),
('gazbottle', 'Gas Bottle', 10, 0, 1),
('goldNecklace', 'GoldNecklace', 5, 0, 1),
('gold_o', 'Scrap gold', 25, 0, 1),
('gold_t', 'Gold', 5, 0, 1),
('handcuffs', 'handcuffs', -1, 0, 1),
('highradio', 'Aftermarket Radio', 6, 0, 1),
('highrim', 'Nice Rim', 2, 0, 1),
('hotdog', 'Hotdog', 5, 0, 1),
('iphone', 'iPhone X', 5, 0, 1),
('iron', 'Iron', 55, 0, 1),
('jewels', 'Jewels', 150, 0, 1),
('key', 'key', -1, 0, 1),
('laptop', 'Gaming Laptop', 5, 0, 1),
('licenseplate', 'License plate', 1, 0, 1),
('lowradio', 'Stock Radio', 8, 0, 1),
('marijuana', 'Bag of Weed', 20, 0, 1),
('medikit', 'Medikit', 15, 0, 1),
('mleko', 'Milk', 50, 0, 1),
('monster', 'Monster', 15, 0, 1),
('oxygen_mask', 'Oxygen Mask', 2, 0, 1),
('packaged_chicken', 'Chicken fillet', 100, 0, 1),
('packaged_plank', 'Packaged wood', 100, 0, 1),
('petrol', 'Oil', 24, 0, 1),
('petrol_raffin', 'Processed oil', 24, 0, 1),
('platinum', 'Platinum', 45, 0, 1),
('radio', 'Radio', 2, 0, 1),
('ring', 'Ring', 5, 0, 1),
('rolex', 'Daytona rolex', 5, 0, 1),
('samsungS10', 'Samsung S10', 5, 0, 1),
('shotburst', 'Shotburst Firework', 5, 0, 1),
('slaughtered_chicken', 'Slaughtered chicken', 25, 0, 1),
('spice', 'Spice', 30, 0, 1),
('sprite', 'Bottle of 7UP', 4, 0, 1),
('starburst', 'Starburst Firework', 5, 0, 1),
('stockrim', 'Stock Rim', 3, 0, 1),
('stone', 'Stone', 10, 0, 1),
('taco', 'Taco', 5, 0, 1),
('taco2', 'Deluxe Taco', 5, 0, 1),
('taco3', 'Steves Special Taco', 5, 0, 1),
('taco4', 'Steves Spicy Taco', 5, 0, 1),
('trailburst', 'Trailburst Firework', 5, 0, 1),
('tuning_laptop', 'Tuner Laptop', 2, 0, 1),
('turbo', 'Turbo', 5, 0, 1),
('turtlebait', 'Turtle Bait', 8, 0, 1),
('vodka', 'Vodka', 7, 0, 1),
('washed_stone', 'Washed stone', 10, 0, 1),
('water', 'Water', 15, 0, 1),
('wood', 'Wood', 25, 0, 1),
('wool', 'Wool', 40, 0, 1);

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Unemployed', 5, '{}', '{}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(2, 'ambulance', 0, 'ambulance', 'Jr. EMT', 20, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(3, 'ambulance', 1, 'doctor', 'EMT', 40, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}');
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(4, 'ambulance', 2, 'chief_doctor', 'Sr. EMT', 60, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(5, 'ambulance', 3, 'boss', 'EMT Supervisor', 80, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(6, 'offpolice', 0, 'recruit', 'Recrue', 5, '{}', '{}'),
(7, 'offpolice', 1, 'officer', 'Officier', 5, '{}', '{}'),
(8, 'offpolice', 2, 'sergeant', 'Sergent', 5, '{}', '{}'),
(9, 'offpolice', 3, 'lieutenant', 'Lieutenant', 6, '{}', '{}'),
(10, 'offpolice', 4, 'boss', 'Commandant', 10, '{}', '{}'),
(11, 'offambulance', 0, 'ambulance', 'Ambulance', 5, '{}', '{}'),
(12, 'offambulance', 1, 'doctor', 'Doctor', 5, '{}', '{}'),
(13, 'offambulance', 2, 'chief_doctor', 'Chief Doctor', 6, '{}', '{}'),
(14, 'offambulance', 3, 'boss', 'Boss', 10, '{}', '{}'),
(15, 'offmecano', 0, 'recrue', 'Technician', 5, '{}', '{}'),
(16, 'offmecano', 1, 'novice', 'Technician', 5, '{}', '{}'),
(17, 'offmecano', 2, 'experimente', 'Technician', 5, '{}', '{}'),
(18, 'offmecano', 3, 'chief', 'Chef déquipe', 6, '{}', '{}'),
(19, 'offmecano', 4, 'boss', 'Patron', 10, '{}', '{}'),
(20, 'lumberjack', 0, 'employee', 'Employee', 35, '{}', '{}'),
(21, 'fisherman', 0, 'employee', 'Employee', 10, '{}', '{}'),
(22, 'fueler', 0, 'employee', 'Employee', 25, '{}', '{}'),
(23, 'reporter', 0, 'employee', 'Employee', 10, '{}', '{}'),
(24, 'tailor', 0, 'employee', 'Employee', 25, '{\"mask_1\":0,\"arms\":1,\"glasses_1\":0,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":0,\"torso_1\":24,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":0,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":36,\"tshirt_2\":0,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":48,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}', '{\"mask_1\":0,\"arms\":5,\"glasses_1\":5,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":1,\"torso_1\":52,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":1,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":23,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":42,\"tshirt_2\":4,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":36,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}'),
(25, 'miner', 0, 'employee', 'Employee', 20, '{\"tshirt_2\":1,\"ears_1\":8,\"glasses_1\":15,\"torso_2\":0,\"ears_2\":2,\"glasses_2\":3,\"shoes_2\":1,\"pants_1\":75,\"shoes_1\":51,\"bags_1\":0,\"helmet_2\":0,\"pants_2\":7,\"torso_1\":71,\"tshirt_1\":59,\"arms\":2,\"bags_2\":0,\"helmet_1\":0}', '{}'),
(26, 'slaughterer', 0, 'employee', 'Employee', 20, '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":67,\"pants_1\":36,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":0,\"torso_1\":56,\"beard_2\":6,\"shoes_1\":12,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":15,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":0,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}', '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":72,\"pants_1\":45,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":1,\"torso_1\":49,\"beard_2\":6,\"shoes_1\":24,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":9,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":5,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}'),
(27, 'krowa', 0, 'employee', 'Farmer', 5, '', ''),
(28, 'mafia', 0, 'soldato', 'Ptite-Frappe', 20, '{}', '{}'),
(29, 'mafia', 1, 'capo', 'Capo', 40, '{}', '{}'),
(30, 'mafia', 2, 'consigliere', 'Consigliere', 60, '{}', '{}'),
(31, 'mafia', 3, 'boss', 'Don', 80, '{}', '{}'),
(32, 'mecano', 0, 'recrue', 'Recruit', 40, '{}', '{}'),
(33, 'mecano', 1, 'novice', 'Novice', 60, '{}', '{}'),
(34, 'mecano', 2, 'experimente', 'Experienced', 80, '{}', '{}'),
(35, 'mecano', 3, 'chief', 'Leader', 100, '{}', '{}'),
(36, 'mecano', 4, 'boss', 'Boss', 120, '{}', '{}'),
(37, 'pawn', 0, 'employee', 'Boss', 100, '', ''),
(38, 'police', 0, 'recruit', 'Recruit', 140, '{}', '{}'),
(39, 'police', 1, 'officer', 'Officer', 160, '{}', '{}'),
(40, 'police', 2, 'sergeant', 'Sergeant', 180, '{}', '{}'),
(41, 'police', 3, 'lieutenant', 'Lieutenant', 200, '{}', '{}'),
(42, 'police', 4, 'boss', 'Chief', 250, '{}', '{}'),
(43, 'taxi', 0, 'recrue', 'Speedy Recruit', 12, '{}', '{}'),
(44, 'taxi', 1, 'novice', 'Speedy Novice', 24, '{}', '{}'),
(45, 'taxi', 2, 'experimente', 'Speedy Experimental', 36, '{}', '{}'),
(46, 'taxi', 3, 'uber', 'Speedy Driver', 75, '{}', '{}'),
(47, 'taxi', 4, 'boss', 'Boss', 150, '{}', '{}'),
(48, 'cardealer', 0, 'recruit', 'Recruit', 10, '{}', '{}'),
(49, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
(50, 'cardealer', 2, 'experienced', 'Experienced', 40, '{}', '{}'),
(51, 'cardealer', 3, 'boss', 'Boss', 0, '{}', '{}'),
(52, 'steves', 0, 'boss', 'Boss', 10, '{}', '{}'),
(53, 'gopostal', 0, 'employee', 'Sedex', 200, '{\"tshirt_1\":59,\"torso_1\":89,\"arms\":31,\"pants_1\":36,\"glasses_1\":19,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"face\":2,\"glasses_2\":0,\"torso_2\":1,\"shoes\":35,\"hair_1\":0,\"skin\":0,\"sex\":0,\"glasses_1\":19,\"pants_2\":0,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":5}', '{\"tshirt_1\":36,\"torso_1\":0,\"arms\":68,\"pants_1\":30,\"glasses_1\":15,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"face\":27,\"glasses_2\":0,\"torso_2\":11,\"shoes\":26,\"hair_1\":5,\"skin\":0,\"sex\":1,\"glasses_1\":15,\"pants_2\":2,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":19}'),
(54, 'bus', 0, 'employee', 'Valores', 200, '{\"tshirt_1\":59,\"torso_1\":89,\"arms\":31,\"pants_1\":36,\"glasses_1\":19,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"face\":2,\"glasses_2\":0,\"torso_2\":1,\"shoes\":35,\"hair_1\":0,\"skin\":0,\"sex\":0,\"glasses_1\":19,\"pants_2\":0,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":5}', '{\"tshirt_1\":36,\"torso_1\":0,\"arms\":68,\"pants_1\":30,\"glasses_1\":15,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"face\":27,\"glasses_2\":0,\"torso_2\":11,\"shoes\":26,\"hair_1\":5,\"skin\":0,\"sex\":1,\"glasses_1\":15,\"pants_2\":2,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":19}'),
(55, 'muckey', 0, 'recruit', 'Recruit', 10, '{}', '{}'),
(56, 'muckey', 1, 'novice', 'Novice', 25, '{}', '{}'),
(57, 'muckey', 2, 'experienced', 'Experienced', 40, '{}', '{}'),
(58, 'muckey', 3, 'boss', 'Boss', 0, '{}', '{}'),
(59, 'mcdirty', 0, 'recruit', 'Recruit', 10, '{}', '{}'),
(60, 'mcdirty', 1, 'novice', 'Novice', 25, '{}', '{}'),
(61, 'mcdirty', 2, 'experienced', 'Experienced', 40, '{}', '{}'),
(62, 'mcdirty', 3, 'boss', 'Boss', 0, '{}', '{}'),
(63, 'firm', 0, 'recruit', 'Recruit', 10, '{}', '{}'),
(64, 'firm', 1, 'novice', 'Novice', 25, '{}', '{}'),
(65, 'firm', 2, 'experienced', 'Experienced', 40, '{}', '{}'),
(66, 'firm', 3, 'boss', 'Boss', 0, '{}', '{}'),
(67, 'hallers', 0, 'recruit', 'Recruit', 10, '{}', '{}'),
(68, 'hallers', 1, 'novice', 'Novice', 25, '{}', '{}'),
(69, 'hallers', 2, 'experienced', 'Experienced', 40, '{}', '{}'),
(70, 'hallers', 3, 'boss', 'Boss', 0, '{}', '{}'),
(71, 'muckyguns', 0, 'soldato', 'Ptite-Frappe', 150, '{}', '{}'),
(72, 'muckyguns', 1, 'capo', 'Capo', 180, '{}', '{}'),
(73, 'muckyguns', 2, 'consigliere', 'Consigliere', 200, '{}', '{}'),
(74, 'muckyguns', 3, 'boss', 'Boss', 250, '{}', '{}'),
(75, 'lizard', 0, 'recrue', 'Recrue', 12, '{}', '{}'),
(76, 'lizard', 1, 'novice', 'Novice', 24, '{}', '{}'),
(77, 'lizard', 2, 'experimente', 'Experimente', 36, '{}', '{}'),
(78, 'lizard', 3, 'chief', 'Chef d\'équipe', 48, '{}', '{}'),
(79, 'lizard', 4, 'boss', 'Patron', 0, '{}', '{}');

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('ambulance', 'EMS', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('bus', 'busdriver', 0);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('cardealer', 'Cardealer', 1);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('firm', 'Firm', 1),
('fisherman', 'Fisherman', 0),
('fueler', 'Fueler', 0),
('gopostal', 'Postie', 0),
('hallers', 'Hallers', 1),
('krowa', 'Farmer', 0),
('lizard', 'lizard', 0),
('lumberjack', 'Lumberjack', 0),
('mafia', 'Mafia', 1),
('mcdirty', 'McDirty', 1),
('mecano', 'Mechanic', 1),
('miner', 'Miner', 0),
('muckey', 'Muckey', 1),
('muckyguns', 'Mucky Guns', 1),
('offambulance', 'Off-Duty', 1),
('offmecano', 'Off-Duty', 1),
('offpolice', 'Off-Duty', 1),
('pawn', 'Pawn', 1),
('police', 'Police', 1),
('reporter', 'Reporter', 0),
('slaughterer', 'Butcher', 0),
('steves', 'Steves Tacos', 1),
('tailor', 'Tailor', 0),
('taxi', 'Taxi', 1),
('unemployed', 'Unemployed', 0);

INSERT INTO `licenses` (`type`, `label`) VALUES
('coke_processing', 'Coke Processing License');
INSERT INTO `licenses` (`type`, `label`) VALUES
('dmv', 'Driving Permit');
INSERT INTO `licenses` (`type`, `label`) VALUES
('drive', 'Drivers License');
INSERT INTO `licenses` (`type`, `label`) VALUES
('drive_bike', 'Motorcycle License'),
('drive_truck', 'Commercial Drivers License'),
('gold_processing', 'Gold Processing License'),
('spice_processing', 'Spice Processing License'),
('weapon', 'Weapon License'),
('weed_processing', 'Weed Processing License');

INSERT INTO `owned_properties` (`id`, `name`, `price`, `rented`, `owner`) VALUES
(26, 'ExecutiveCool', 5000000, 0, 'steam:110000102beb001');
INSERT INTO `owned_properties` (`id`, `name`, `price`, `rented`, `owner`) VALUES
(27, 'PowerBrokerPolished', 5000000, 0, 'steam:110000102beb001');
INSERT INTO `owned_properties` (`id`, `name`, `price`, `rented`, `owner`) VALUES
(28, 'IntegrityWay30', 1700000, 0, 'steam:110000102beb001');
INSERT INTO `owned_properties` (`id`, `name`, `price`, `rented`, `owner`) VALUES
(29, 'IntegrityWay28', 1700000, 0, 'steam:110000102beb001'),
(30, 'LBPowerBrokerConservative', 3500000, 0, 'steam:110000102beb001'),
(31, 'DellPerroHeightst7', 1700000, 0, 'steam:110000102beb001');

INSERT INTO `owned_vehicles` (`owner`, `state`, `plate`, `vehicle`, `type`, `job`, `stored`, `modelname`) VALUES
('steam:110000102beb001', 1, 'SCN 520', '{\"modSeats\":-1,\"modEngine\":3,\"modStruts\":-1,\"modAPlate\":-1,\"dirtLevel\":7.5290741920472,\"modXenon\":1,\"modWindows\":-1,\"modAerials\":-1,\"modTurbo\":1,\"modHydrolic\":-1,\"modArmor\":4,\"color2\":55,\"windowTint\":1,\"modDoorSpeaker\":-1,\"wheelColor\":0,\"plateIndex\":1,\"neonColor\":[0,255,0],\"modExhaust\":-1,\"modOrnaments\":-1,\"health\":970,\"modGrille\":-1,\"modAirFilter\":-1,\"modBackWheels\":-1,\"modDashboard\":-1,\"modArchCover\":-1,\"modTrimB\":-1,\"modSteeringWheel\":-1,\"modHood\":-1,\"color1\":64,\"modFrame\":-1,\"modTrunk\":-1,\"neonEnabled\":[1,1,1,1],\"tyreSmokeColor\":[0,255,0],\"modTank\":-1,\"modBrakes\":2,\"modFrontBumper\":-1,\"modHorns\":-1,\"modRoof\":-1,\"modFrontWheels\":-1,\"modSuspension\":3,\"modEngineBlock\":-1,\"modSmokeEnabled\":1,\"plate\":\"SCN 520\",\"extras\":[],\"modTrimA\":-1,\"modRightFender\":-1,\"modSpoilers\":-1,\"modLivery\":-1,\"modRearBumper\":0,\"modPlateHolder\":-1,\"modVanityPlate\":-1,\"wheels\":7,\"modFender\":-1,\"modDial\":-1,\"modSideSkirt\":-1,\"modShifterLeavers\":-1,\"modTransmission\":2,\"pearlescentColor\":55,\"modSpeakers\":-1,\"model\":-315459455}', 'car', NULL, 0, '488nlargo');












INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{\"y\":564.89,\"z\":182.959,\"x\":119.384}', '{\"x\":117.347,\"y\":559.506,\"z\":183.304}', '{\"y\":557.032,\"z\":183.301,\"x\":118.037}', '{\"y\":567.798,\"z\":182.131,\"x\":119.249}', '[]', NULL, 1, 1, 0, '{\"x\":118.748,\"y\":566.573,\"z\":175.697}', 1500000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{\"x\":372.796,\"y\":428.327,\"z\":144.685}', '{\"x\":373.548,\"y\":422.982,\"z\":144.907},', '{\"y\":420.075,\"z\":145.904,\"x\":372.161}', '{\"x\":372.454,\"y\":432.886,\"z\":143.443}', '[]', NULL, 1, 1, 0, '{\"x\":377.349,\"y\":429.422,\"z\":137.3}', 1500000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{\"y\":-379.165,\"z\":37.961,\"x\":-936.363}', '{\"y\":-365.476,\"z\":113.274,\"x\":-913.097}', '{\"y\":-367.637,\"z\":113.274,\"x\":-918.022}', '{\"y\":-382.023,\"z\":37.961,\"x\":-943.626}', '[]', NULL, 1, 1, 0, '{\"x\":-927.554,\"y\":-377.744,\"z\":112.674}', 1700000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{\"y\":440.8,\"z\":146.702,\"x\":346.964}', '{\"y\":437.456,\"z\":148.394,\"x\":341.683}', '{\"y\":435.626,\"z\":148.394,\"x\":339.595}', '{\"x\":350.535,\"y\":443.329,\"z\":145.764}', '[]', NULL, 1, 1, 0, '{\"x\":337.726,\"y\":436.985,\"z\":140.77}', 1500000),
(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{\"y\":502.696,\"z\":136.421,\"x\":-176.003}', '{\"y\":497.817,\"z\":136.653,\"x\":-174.349}', '{\"y\":495.069,\"z\":136.666,\"x\":-173.331}', '{\"y\":506.412,\"z\":135.0664,\"x\":-177.927}', '[]', NULL, 1, 1, 0, '{\"x\":-174.725,\"y\":493.095,\"z\":129.043}', 1500000),
(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{\"y\":596.58,\"z\":142.641,\"x\":-686.554}', '{\"y\":591.988,\"z\":144.392,\"x\":-681.728}', '{\"y\":590.608,\"z\":144.392,\"x\":-680.124}', '{\"y\":599.019,\"z\":142.059,\"x\":-689.492}', '[]', NULL, 1, 1, 0, '{\"x\":-680.46,\"y\":588.6,\"z\":136.769}', 1500000),
(7, 'LowEndApartment', 'Basic apartment', '{\"y\":-1078.735,\"z\":28.4031,\"x\":292.528}', '{\"y\":-1007.152,\"z\":-102.002,\"x\":265.845}', '{\"y\":-1002.802,\"z\":-100.008,\"x\":265.307}', '{\"y\":-1078.669,\"z\":28.401,\"x\":296.738}', '[]', NULL, 1, 1, 0, '{\"x\":265.916,\"y\":-999.38,\"z\":-100.008}', 562500),
(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{\"y\":454.955,\"z\":96.462,\"x\":-1294.433}', '{\"x\":-1289.917,\"y\":449.541,\"z\":96.902}', '{\"y\":446.322,\"z\":96.899,\"x\":-1289.642}', '{\"y\":455.453,\"z\":96.517,\"x\":-1298.851}', '[]', NULL, 1, 1, 0, '{\"x\":-1287.306,\"y\":455.901,\"z\":89.294}', 1500000),
(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{\"x\":-853.346,\"y\":696.678,\"z\":147.782}', '{\"y\":690.875,\"z\":151.86,\"x\":-859.961}', '{\"y\":688.361,\"z\":151.857,\"x\":-859.395}', '{\"y\":701.628,\"z\":147.773,\"x\":-855.007}', '[]', NULL, 1, 1, 0, '{\"x\":-858.543,\"y\":697.514,\"z\":144.253}', 1500000),
(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{\"y\":620.494,\"z\":141.588,\"x\":-752.82}', '{\"y\":618.62,\"z\":143.153,\"x\":-759.317}', '{\"y\":617.629,\"z\":143.153,\"x\":-760.789}', '{\"y\":621.281,\"z\":141.254,\"x\":-750.919}', '[]', NULL, 1, 1, 0, '{\"x\":-762.504,\"y\":618.992,\"z\":135.53}', 1500000),
(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{\"y\":37.025,\"z\":42.58,\"x\":-618.299}', '{\"y\":58.898,\"z\":97.2,\"x\":-603.301}', '{\"y\":58.941,\"z\":97.2,\"x\":-608.741}', '{\"y\":30.603,\"z\":42.524,\"x\":-620.017}', '[]', NULL, 1, 1, 0, '{\"x\":-622.173,\"y\":54.585,\"z\":96.599}', 1700000),
(12, 'MiltonDrive', 'Milton Drive', '{\"x\":-775.17,\"y\":312.01,\"z\":84.658}', NULL, NULL, '{\"x\":-775.346,\"y\":306.776,\"z\":84.7}', '[]', NULL, 0, 0, 1, NULL, 0),
(13, 'Modern1Apartment', 'Modern Apartment 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_01_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.661,\"y\":327.672,\"z\":210.396}', 1300000),
(14, 'Modern2Apartment', 'Modern Apartment 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_01_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.735,\"y\":326.757,\"z\":186.313}', 1300000),
(15, 'Modern3Apartment', 'Modern Apartment 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_01_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.386,\"y\":330.782,\"z\":195.08}', 1300000),
(16, 'Mody1Apartment', 'Mody Apartment 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_02_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.615,\"y\":327.878,\"z\":210.396}', 1300000),
(17, 'Mody2Apartment', 'Mody Apartment 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_02_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.297,\"y\":327.092,\"z\":186.313}', 1300000),
(18, 'Mody3Apartment', 'Mody Apartment 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_02_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.303,\"y\":330.932,\"z\":195.085}', 1300000),
(19, 'Vibrant1Apartment', 'Vibrant Apartment 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_03_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.885,\"y\":327.641,\"z\":210.396}', 1300000),
(20, 'Vibrant2Apartment', 'Vibrant Apartment 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_03_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.607,\"y\":327.344,\"z\":186.313}', 1300000),
(21, 'Vibrant3Apartment', 'Vibrant Apartment 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_03_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.525,\"y\":330.851,\"z\":195.085}', 1300000),
(22, 'Sharp1Apartment', 'Sharp Apartment 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_04_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.527,\"y\":327.89,\"z\":210.396}', 1300000),
(23, 'Sharp2Apartment', 'Sharp Apartment 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_04_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.642,\"y\":326.497,\"z\":186.313}', 1300000),
(24, 'Sharp3Apartment', 'Sharp Apartment 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_04_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.503,\"y\":331.318,\"z\":195.085}', 1300000),
(25, 'Monochrome1Apartment', 'Monochrome Apartment 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_05_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.289,\"y\":328.086,\"z\":210.396}', 1300000),
(26, 'Monochrome2Apartment', 'Monochrome Apartment 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_05_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.692,\"y\":326.762,\"z\":186.313}', 1300000),
(27, 'Monochrome3Apartment', 'Monochrome Apartment 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_05_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.094,\"y\":330.976,\"z\":195.085}', 1300000),
(28, 'Seductive1Apartment', 'Seductive Apartment 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_06_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.263,\"y\":328.104,\"z\":210.396}', 1300000),
(29, 'Seductive2Apartment', 'Seductive Apartment 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_06_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.655,\"y\":326.611,\"z\":186.313}', 1300000),
(30, 'Seductive3Apartment', 'Seductive Apartment 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_06_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.3,\"y\":331.414,\"z\":195.085}', 1300000),
(31, 'Regal1Apartment', 'Regal Apartment 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_07_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.956,\"y\":328.257,\"z\":210.396}', 1300000),
(32, 'Regal2Apartment', 'Regal Apartment 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_07_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.545,\"y\":326.659,\"z\":186.313}', 1300000),
(33, 'Regal3Apartment', 'Regal Apartment 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_07_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.087,\"y\":331.429,\"z\":195.123}', 1300000),
(34, 'Aqua1Apartment', 'Aqua Apartment 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_08_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.187,\"y\":328.47,\"z\":210.396}', 1300000),
(35, 'Aqua2Apartment', 'Aqua Apartment 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_08_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.658,\"y\":326.563,\"z\":186.313}', 1300000),
(36, 'Aqua3Apartment', 'Aqua Apartment 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_08_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.287,\"y\":331.084,\"z\":195.086}', 1300000),
(37, 'IntegrityWay', '4 Integrity Way', '{\"x\":-47.804,\"y\":-585.867,\"z\":36.956}', NULL, NULL, '{\"x\":-54.178,\"y\":-583.762,\"z\":35.798}', '[]', NULL, 0, 0, 1, NULL, 0),
(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{\"x\":-31.409,\"y\":-594.927,\"z\":79.03}', '{\"x\":-26.098,\"y\":-596.909,\"z\":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-11.923,\"y\":-597.083,\"z\":78.43}', 1700000),
(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{\"x\":-17.702,\"y\":-588.524,\"z\":89.114}', '{\"x\":-16.21,\"y\":-582.569,\"z\":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-26.327,\"y\":-588.384,\"z\":89.123}', 1700000),
(40, 'DellPerroHeights', 'Dell Perro Heights', '{\"x\":-1447.06,\"y\":-538.28,\"z\":33.74}', NULL, NULL, '{\"x\":-1440.022,\"y\":-548.696,\"z\":33.74}', '[]', NULL, 0, 0, 1, NULL, 0),
(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{\"x\":-1452.125,\"y\":-540.591,\"z\":73.044}', '{\"x\":-1455.435,\"y\":-535.79,\"z\":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1467.058,\"y\":-527.571,\"z\":72.443}', 1700000),
(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{\"x\":-1451.562,\"y\":-523.535,\"z\":55.928}', '{\"x\":-1456.02,\"y\":-519.209,\"z\":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1457.026,\"y\":-530.219,\"z\":55.937}', 1700000),
(43, 'MazeBankBuilding', 'Maze Bank Building', '{\"x\":-79.18,\"y\":-795.92,\"z\":43.35}', NULL, NULL, '{\"x\":-72.50,\"y\":-786.92,\"z\":43.40}', '[]', NULL, 0, 0, 1, NULL, 0),
(44, 'OldSpiceWarm', 'Old Spice Warm', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_01a\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(45, 'OldSpiceClassical', 'Old Spice Classical', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_01b\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(46, 'OldSpiceVintage', 'Old Spice Vintage', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_01c\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(47, 'ExecutiveRich', 'Executive Rich', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_02b\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(48, 'ExecutiveCool', 'Executive Cool', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_02c\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(49, 'ExecutiveContrast', 'Executive Contrast', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_02a\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(50, 'PowerBrokerIce', 'Power Broker Ice', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_03a\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(51, 'PowerBrokerConservative', 'Power Broker Conservative', NULL, '', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_03b\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(52, 'PowerBrokerPolished', 'Power Broker Polished', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_03c\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(53, 'LomBank', 'Lom Bank', '{\"x\":-1581.36,\"y\":-558.23,\"z\":34.07}', NULL, NULL, '{\"x\":-1583.60,\"y\":-555.12,\"z\":34.07}', '[]', NULL, 0, 0, 1, NULL, 0),
(54, 'LBOldSpiceWarm', 'LB Old Spice Warm', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_01a\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(55, 'LBOldSpiceClassical', 'LB Old Spice Classical', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_01b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(56, 'LBOldSpiceVintage', 'LB Old Spice Vintage', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_01c\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(57, 'LBExecutiveRich', 'LB Executive Rich', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_02b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(58, 'LBExecutiveCool', 'LB Executive Cool', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_02c\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(59, 'LBExecutiveContrast', 'LB Executive Contrast', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_02a\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(60, 'LBPowerBrokerIce', 'LB Power Broker Ice', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_03a\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(61, 'LBPowerBrokerConservative', 'LB Power Broker Conservative', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_03b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(62, 'LBPowerBrokerPolished', 'LB Power Broker Polished', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_03c\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(63, 'MazeBankWest', 'Maze Bank West', '{\"x\":-1379.58,\"y\":-499.63,\"z\":32.22}', NULL, NULL, '{\"x\":-1378.95,\"y\":-502.82,\"z\":32.22}', '[]', NULL, 0, 0, 1, NULL, 0),
(64, 'MBWOldSpiceWarm', 'MBW Old Spice Warm', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_01a\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(65, 'MBWOldSpiceClassical', 'MBW Old Spice Classical', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_01b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(66, 'MBWOldSpiceVintage', 'MBW Old Spice Vintage', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_01c\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(67, 'MBWExecutiveRich', 'MBW Executive Rich', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_02b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(68, 'MBWExecutiveCool', 'MBW Executive Cool', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_02c\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(69, 'MBWExecutive Contrast', 'MBW Executive Contrast', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_02a\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(70, 'MBWPowerBrokerIce', 'MBW Power Broker Ice', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_03a\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(71, 'MBWPowerBrokerConvservative', 'MBW Power Broker Convservative', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_03b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(72, 'MBWPowerBrokerPolished', 'MBW Power Broker Polished', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_03c\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000);





INSERT INTO `shops` (`id`, `name`, `item`, `price`) VALUES
(1, 'TwentyFourSeven', 'bread', 5);
INSERT INTO `shops` (`id`, `name`, `item`, `price`) VALUES
(2, 'TwentyFourSeven', 'water', 5);
INSERT INTO `shops` (`id`, `name`, `item`, `price`) VALUES
(3, 'TwentyFourSeven', 'radio', 10);
INSERT INTO `shops` (`id`, `name`, `item`, `price`) VALUES
(4, 'TwentyFourSeven', 'fishbait', 3),
(5, 'TwentyFourSeven', 'turtlebait', 8),
(6, 'TwentyFourSeven', 'fishingrod', 12),
(7, 'Hallers', 'beer', 5),
(8, 'RobsLiquor', 'bread', 5),
(9, 'RobsLiquor', 'water', 5),
(10, 'RobsLiquor', 'radio', 10),
(11, 'RobsLiquor', 'fishbait', 3),
(12, 'RobsLiquor', 'bandage2', 8),
(13, 'RobsLiquor', 'turtlebait', 8),
(14, 'RobsLiquor', 'fishingrod', 12),
(15, 'RobsLiquor', 'advancedlockpick', 5000),
(16, 'RobsLiquor', 'armor', 1000),
(17, 'LTDgasoline', 'bread', 5),
(18, 'LTDgasoline', 'water', 5),
(19, 'LTDgasoline', 'radio', 10),
(20, 'LTDgasoline', 'fishbait', 3),
(21, 'LTDgasoline', 'turtlebait', 8),
(22, 'LTDgasoline', 'fishingrod', 12),
(23, 'Steves', 'donut', 4),
(24, 'Steves', 'donut2', 5),
(25, 'Steves', 'monster', 4),
(26, 'Steves', 'taco', 2),
(27, 'Steves', 'taco2', 3),
(28, 'Steves', 'taco3', 3),
(29, 'Steves', 'taco4', 4),
(30, 'Steves', 'hotdog', 2),
(31, 'Police', 'fixkit', 0),
(32, 'Police', 'radio', 0),
(33, 'Police', 'armor2', 0),
(34, 'Steves', 'licenseplate', 15),
(35, 'Police', 'turbo', 0),
(36, 'Police', 'clip', 0),
(37, 'Police', 'bandage2', 0),
(38, 'TwentyFourSeven', 'binoculars', 100),
(39, 'Police', 'binoculars', 100),
(40, 'LTDgasoline', 'binoculars', 100),
(41, 'RobsLiquor', 'clip', 500),
(42, 'Mcdirtys', 'bandage2', 0),
(43, 'Mcdirtys', 'armor2', 0),
(44, 'Mcdirtys', 'clip', 300),
(45, 'Mcdirtys', 'turbo', 500),
(46, 'Mcdirtys', 'bread', 0),
(47, 'Mcdirtys', 'monster', 0),
(49, 'Steves', 'handcuffs', 500),
(50, 'Steves', 'key', 1000),
(51, 'Hallers', 'vodka', 20),
(52, 'Steves', 'armor2', 2000),
(53, 'Steves', 'advancedlockpick', 1500),
(54, 'Steves', 'bandage2', 500);





INSERT INTO `user_accounts` (`id`, `identifier`, `name`, `money`) VALUES
(69, 'steam:11000013b44adb1', 'black_money', 0);
INSERT INTO `user_accounts` (`id`, `identifier`, `name`, `money`) VALUES
(70, 'steam:110000102beb001', 'black_money', 0);


INSERT INTO `user_inventory` (`id`, `identifier`, `item`, `count`) VALUES
(6211, 'steam:110000102beb001', 'monster', 0);
INSERT INTO `user_inventory` (`id`, `identifier`, `item`, `count`) VALUES
(6212, 'steam:110000102beb001', 'fixtool', 0);
INSERT INTO `user_inventory` (`id`, `identifier`, `item`, `count`) VALUES
(6213, 'steam:110000102beb001', 'radio', 1);
INSERT INTO `user_inventory` (`id`, `identifier`, `item`, `count`) VALUES
(6214, 'steam:110000102beb001', 'iphone', 0),
(6215, 'steam:110000102beb001', 'rolex', 0),
(6216, 'steam:110000102beb001', 'alive_chicken', 0),
(6217, 'steam:110000102beb001', 'key', 0),
(6218, 'steam:110000102beb001', 'gold_t', 0),
(6219, 'steam:110000102beb001', 'armor2', 0),
(6220, 'steam:110000102beb001', 'sprite', 0),
(6221, 'steam:110000102beb001', 'cola', 0),
(6222, 'steam:110000102beb001', 'washed_stone', 0),
(6223, 'steam:110000102beb001', 'gold_o', 0),
(6224, 'steam:110000102beb001', 'trailburst', 0),
(6225, 'steam:110000102beb001', 'carokit', 0),
(6226, 'steam:110000102beb001', 'coffees', 0),
(6227, 'steam:110000102beb001', 'copper', 0),
(6228, 'steam:110000102beb001', 'fabric', 0),
(6229, 'steam:110000102beb001', 'laptop', 0),
(6230, 'steam:110000102beb001', 'marijuana', 0),
(6231, 'steam:110000102beb001', 'coke', 0),
(6232, 'steam:110000102beb001', 'petrol', 0),
(6233, 'steam:110000102beb001', 'fries', 0),
(6234, 'steam:110000102beb001', 'iron', 0),
(6235, 'steam:110000102beb001', 'handcuffs', 0),
(6236, 'steam:110000102beb001', 'fish', 0),
(6237, 'steam:110000102beb001', 'jewels', 0),
(6238, 'steam:110000102beb001', 'oxygen_mask', 0),
(6239, 'steam:110000102beb001', 'wool', 0),
(6240, 'steam:110000102beb001', 'wood', 0),
(6241, 'steam:110000102beb001', 'armor', 1),
(6242, 'steam:110000102beb001', 'water', 1),
(6243, 'steam:110000102beb001', 'battery', 0),
(6244, 'steam:110000102beb001', 'cannabis', 0),
(6245, 'steam:110000102beb001', 'highrim', 0),
(6246, 'steam:110000102beb001', 'bandage', 0),
(6247, 'steam:110000102beb001', 'turtlebait', 1),
(6248, 'steam:110000102beb001', 'fishingrod', 1),
(6249, 'steam:110000102beb001', 'fishbait', 1),
(6250, 'steam:110000102beb001', 'bread', 1),
(6251, 'steam:110000102beb001', 'tuning_laptop', 0),
(6252, 'steam:110000102beb001', 'taco4', 0),
(6253, 'steam:110000102beb001', 'turbo', 0),
(6254, 'steam:110000102beb001', 'shotburst', 0),
(6255, 'steam:110000102beb001', 'taco', 0),
(6256, 'steam:110000102beb001', 'stone', 0),
(6257, 'steam:110000102beb001', 'stockrim', 0),
(6258, 'steam:110000102beb001', 'fountain', 0),
(6259, 'steam:110000102beb001', 'blowpipe', 0),
(6260, 'steam:110000102beb001', 'starburst', 0),
(6261, 'steam:110000102beb001', 'licenseplate', 0),
(6262, 'steam:110000102beb001', 'mleko', 0),
(6263, 'steam:110000102beb001', 'spice', 0),
(6264, 'steam:110000102beb001', 'essence', 0),
(6265, 'steam:110000102beb001', 'slaughtered_chicken', 0),
(6266, 'steam:110000102beb001', 'taco2', 0),
(6267, 'steam:110000102beb001', 'samsungS10', 0),
(6268, 'steam:110000102beb001', 'ring', 0),
(6269, 'steam:110000102beb001', 'advancedlockpick', 1),
(6270, 'steam:110000102beb001', 'platinum', 0),
(6271, 'steam:110000102beb001', 'cannabinoid', 0),
(6272, 'steam:110000102beb001', 'petrol_raffin', 0),
(6273, 'steam:110000102beb001', 'carotool', 0),
(6274, 'steam:110000102beb001', 'gazbottle', 0),
(6275, 'steam:110000102beb001', 'packaged_plank', 0),
(6276, 'steam:110000102beb001', 'camera', 0),
(6277, 'steam:110000102beb001', 'donut', 0),
(6278, 'steam:110000102beb001', 'cburger', 0),
(6279, 'steam:110000102beb001', 'taco3', 0),
(6280, 'steam:110000102beb001', 'diamond', 0),
(6281, 'steam:110000102beb001', 'clothe', 0),
(6282, 'steam:110000102beb001', 'bandage2', 15),
(6283, 'steam:110000102beb001', 'medikit', 0),
(6284, 'steam:110000102beb001', 'fries2', 0),
(6285, 'steam:110000102beb001', 'beer', 0),
(6286, 'steam:110000102beb001', 'goldNecklace', 0),
(6287, 'steam:110000102beb001', 'highradio', 0),
(6288, 'steam:110000102beb001', 'lowradio', 0),
(6289, 'steam:110000102beb001', 'dcburger', 0),
(6290, 'steam:110000102beb001', 'airbag', 0),
(6291, 'steam:110000102beb001', 'hotdog', 0),
(6292, 'steam:110000102beb001', 'binoculars', 1),
(6293, 'steam:110000102beb001', 'fixkit', 0),
(6294, 'steam:110000102beb001', 'cutted_wood', 0),
(6295, 'steam:110000102beb001', 'clip', 12),
(6296, 'steam:110000102beb001', 'crack', 0),
(6297, 'steam:110000102beb001', 'vodka', 0),
(6298, 'steam:110000102beb001', 'donut2', 0),
(6299, 'steam:110000102beb001', 'packaged_chicken', 0);



INSERT INTO `users` (`identifier`, `license`, `money`, `name`, `skin`, `job`, `job_grade`, `loadout`, `position`, `bank`, `permission_level`, `group`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `is_dead`, `jail`, `status`, `phone_number`, `wanted`, `last_property`) VALUES
('steam:110000102beb001', 'license:7606a1ef4ffbc3a966cec879b9c41931fb40df58', 1979649310, 'Nx2', '{\"chest_1\":0,\"lipstick_3\":0,\"shoes_2\":0,\"eyebrows_2\":0,\"face\":0,\"beard_1\":0,\"makeup_4\":0,\"pants_2\":6,\"eyebrows_3\":0,\"chain_1\":0,\"eyebrows_1\":0,\"age_1\":0,\"bracelets_2\":0,\"lipstick_2\":0,\"decals_2\":0,\"watches_2\":0,\"blush_1\":0,\"bags_2\":0,\"complexion_1\":0,\"helmet_2\":0,\"bracelets_1\":-1,\"ears_2\":0,\"chest_3\":0,\"sun_2\":0,\"moles_1\":0,\"torso_1\":6,\"bproof_1\":0,\"makeup_1\":0,\"blemishes_1\":0,\"hair_color_1\":15,\"pants_1\":0,\"makeup_3\":0,\"blush_2\":0,\"arms\":0,\"helmet_1\":-1,\"bodyb_1\":0,\"arms_2\":0,\"blush_3\":0,\"sun_1\":0,\"beard_3\":0,\"moles_2\":0,\"blemishes_2\":0,\"glasses_1\":0,\"beard_2\":0,\"sex\":0,\"hair_color_2\":0,\"beard_4\":0,\"eyebrows_4\":0,\"glasses_2\":0,\"skin\":0,\"ears_1\":-1,\"hair_1\":2,\"chest_2\":0,\"bodyb_2\":0,\"bproof_2\":0,\"mask_2\":0,\"torso_2\":0,\"tshirt_2\":0,\"bags_1\":0,\"complexion_2\":0,\"shoes_1\":12,\"watches_1\":-1,\"makeup_2\":0,\"lipstick_4\":0,\"chain_2\":0,\"lipstick_1\":0,\"eye_color\":0,\"age_2\":0,\"hair_2\":0,\"mask_1\":0,\"tshirt_1\":14,\"decals_1\":0}', 'mecano', 4, '[{\"name\":\"WEAPON_PETROLCAN\",\"ammo\":4500,\"components\":[],\"label\":\"Jerrycan\"}]', '{\"y\":-802.3999999999,\"z\":30.800000000002,\"x\":216.59999999998}', 10735, 100, 'superadmin', 'Nx2', 'Dev', '20000708', 'm', '200', 0, 0, '[{\"val\":246300,\"percent\":24.63,\"name\":\"hunger\"},{\"val\":309725,\"percent\":30.9725,\"name\":\"thirst\"}]', '820-7949', 0, NULL);
INSERT INTO `users` (`identifier`, `license`, `money`, `name`, `skin`, `job`, `job_grade`, `loadout`, `position`, `bank`, `permission_level`, `group`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `is_dead`, `jail`, `status`, `phone_number`, `wanted`, `last_property`) VALUES
('steam:11000013b44adb1', 'license:ef3ca6eccb89b84e1ec6af72f8c5afc214662d24', 10000, 'house', '{\"face\":0,\"hair_1\":0,\"skin\":0,\"eyebrows_3\":0,\"beard_2\":0,\"tshirt_1\":0,\"ears_2\":0,\"chain_1\":0,\"complexion_2\":0,\"makeup_3\":0,\"beard_4\":0,\"arms\":0,\"makeup_4\":0,\"pants_2\":0,\"blush_3\":0,\"mask_2\":0,\"blush_2\":0,\"bodyb_2\":0,\"sun_1\":0,\"makeup_2\":0,\"lipstick_3\":0,\"shoes_1\":0,\"blemishes_1\":0,\"torso_2\":0,\"eyebrows_2\":0,\"age_2\":0,\"bproof_1\":0,\"torso_1\":0,\"ears_1\":-1,\"eyebrows_1\":0,\"helmet_1\":-1,\"arms_2\":0,\"beard_3\":0,\"sex\":0,\"eye_color\":0,\"chest_2\":0,\"tshirt_2\":0,\"moles_2\":0,\"glasses_2\":0,\"glasses_1\":0,\"age_1\":0,\"bags_1\":0,\"watches_2\":0,\"moles_1\":0,\"lipstick_1\":0,\"bags_2\":0,\"eyebrows_4\":0,\"chest_3\":0,\"beard_1\":0,\"hair_2\":0,\"decals_2\":0,\"shoes_2\":0,\"makeup_1\":0,\"lipstick_4\":0,\"helmet_2\":0,\"blemishes_2\":0,\"complexion_1\":0,\"hair_color_1\":0,\"pants_1\":0,\"chain_2\":0,\"bracelets_2\":0,\"watches_1\":-1,\"bracelets_1\":-1,\"hair_color_2\":0,\"decals_1\":0,\"mask_1\":0,\"blush_1\":0,\"lipstick_2\":0,\"bproof_2\":0,\"bodyb_1\":0,\"chest_1\":0,\"sun_2\":0}', 'unemployed', 0, '[{\"name\":\"PISTOL\",\"components\":[],\"ammo\":1000}]', '{\"y\":-458.19999999996,\"x\":-1479.0,\"z\":35.600000000006}', 10000, 100, 'superadmin', 'House', 'Name', '1999-03-03', 'm', '160', 0, 0, '[{\"name\":\"hunger\",\"val\":953100,\"percent\":95.31},{\"name\":\"thirst\",\"val\":964825,\"percent\":96.4825}]', '730-9551', 0, NULL);


INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('addons', 'Addons');
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('addons2', 'Addons2');
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('bikes', 'Addon Bikes');
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('casino', 'Casino'),
('compacts', 'Compacts'),
('coupes', 'Coupes'),
('motorcycles', 'Motos'),
('muscle', 'Muscle'),
('offroad', 'Off Road'),
('robin', 'Robins Imports'),
('sedans', 'Sedans'),
('sports', 'Sports'),
('sportsclassics', 'Sports Classics'),
('super', 'Super'),
('suvs', 'SUVs'),
('vans', 'Vans'),
('yank', 'Yank');



INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('VW Passat', '16cc', 45000, 'addons');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('Renault Clio', '17cliofl', 12500, 'addons');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('Skoda Octavia', '17octavia', 22000, 'addons');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('PUG 205', '205', 22500, 'addons2'),
('PUG 205 Trailer', '205t', 5000, 'addons2'),
('Peugeot 208GTI', '208gti21', 22000, 'addons'),
('Ford F350', '20f350', 75000, 'yank'),
('BMW 328', '328nii', 25000, 'addons'),
('Ferrari 488', '488nlargo', 600000, 'addons'),
('Mclaren 650s', '650s', 420000, 'addons'),
('Mercedes A45 AMG', 'a45amg', 62000, 'addons'),
('Adder', 'adder', 900000, 'super'),
('Akuma', 'AKUMA', 7500, 'motorcycles'),
('Alpha', 'alpha', 60000, 'sports'),
('Ardent', 'ardent', 1150000, 'sportsclassics'),
('Asbo', 'asbo', 6000, 'casino'),
('Asea', 'asea', 5500, 'sedans'),
('Autarch', 'autarch', 1955000, 'super'),
('Avarus', 'avarus', 18000, 'motorcycles'),
('Bagger', 'bagger', 13500, 'motorcycles'),
('Baller', 'baller2', 40000, 'suvs'),
('Baller Sport', 'baller3', 60000, 'suvs'),
('Banshee', 'banshee', 70000, 'sports'),
('Banshee 900R', 'banshee2', 255000, 'super'),
('Bati 801', 'bati', 12000, 'motorcycles'),
('Bati 801RR', 'bati2', 19000, 'motorcycles'),
('Bugatti Chiron', 'bcss', 1850000, 'addons'),
('Bentayga 17', 'bentayga17', 255000, 'addons'),
('Bestia GTS', 'bestiagts', 55000, 'sports'),
('BF400', 'bf400', 6500, 'motorcycles'),
('Bf Injection', 'bfinjection', 16000, 'offroad'),
('Bifta', 'bifta', 12000, 'offroad'),
('Bison', 'bison', 45000, 'vans'),
('Blade', 'blade', 15000, 'muscle'),
('Blazer', 'blazer', 6500, 'offroad'),
('Blazer Sport', 'blazer4', 8500, 'offroad'),
('blazer5', 'blazer5', 1755600, 'offroad'),
('Blista', 'blista', 8000, 'compacts'),
('BMW M8', 'bmwm8', 62500, 'addons'),
('BMX (velo)', 'bmx', 160, 'motorcycles'),
('Bobcat XL', 'bobcatxl', 32000, 'vans'),
('Brawler', 'brawler', 45000, 'offroad'),
('Brioso R/A', 'brioso', 18000, 'compacts'),
('Btype', 'btype', 62000, 'sportsclassics'),
('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
('Buccaneer', 'buccaneer', 18000, 'muscle'),
('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
('Buffalo', 'buffalo', 12000, 'sports'),
('Buffalo S', 'buffalo2', 20000, 'sports'),
('Bullet', 'bullet', 90000, 'super'),
('Burrito', 'burrito3', 19000, 'vans'),
('Corvette C7', 'c7', 150000, 'yank'),
('Camper', 'camper', 42000, 'vans'),
('Caracara 2', 'caracara2', 55000, 'casino'),
('Carbonizzare', 'carbonizzare', 75000, 'sports'),
('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
('Casco', 'casco', 30000, 'sportsclassics'),
('Cavalcade', 'cavalcade2', 55000, 'suvs'),
('Lada', 'cheburek', 20000, 'robin'),
('Cheetah', 'cheetah', 375000, 'super'),
('Chimera', 'chimera', 38000, 'motorcycles'),
('Chino', 'chino', 15000, 'muscle'),
('Chino Luxe', 'chino2', 19000, 'muscle'),
('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
('Mercedes CLS53', 'CLS53', 35000, 'addons'),
('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
('Comet', 'comet2', 65000, 'sports'),
('Comet GTT', 'comet3', 120000, 'robin'),
('Comet 5', 'comet5', 1145000, 'sports'),
('Contender', 'contender', 70000, 'suvs'),
('Coquette', 'coquette', 65000, 'sports'),
('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
('Honda CRX', 'crx2', 22000, 'addons'),
('Cyclone', 'cyclone', 1890000, 'super'),
('Daemon', 'daemon', 11500, 'motorcycles'),
('Daemon High', 'daemon2', 13500, 'motorcycles'),
('Defiler', 'defiler', 9800, 'motorcycles'),
('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
('Dominator', 'dominator', 35000, 'muscle'),
('Double T', 'double', 28000, 'motorcycles'),
('Drafter', 'drafter', 48000, 'casino'),
('Dubsta', 'dubsta', 45000, 'suvs'),
('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
('Dukes', 'dukes', 28000, 'muscle'),
('Dune Buggy', 'dune', 8000, 'offroad'),
('Dynasty', 'dynasty', 5000, 'casino'),
('Drift E34', 'e34', 45000, 'addons2'),
('Silverado EC17', 'ec17silv', 80000, 'yank'),
('Elegy LE', 'elegy', 60000, 'robin'),
('Elegy', 'elegy2', 38500, 'sports'),
('Emerus', 'emerus', 72000, 'casino'),
('Emperor', 'emperor', 8500, 'sedans'),
('Enduro', 'enduro', 5500, 'motorcycles'),
('Entity XF', 'entityxf', 425000, 'super'),
('Esskey', 'esskey', 4200, 'motorcycles'),
('Everon', 'everon', 115000, 'casino'),
('Evo 9', 'evo9', 45000, 'addons'),
('RangeRover Evoque', 'evoque', 95000, 'addons'),
('Exemplar', 'exemplar', 32000, 'coupes'),
('Ferrari F355', 'f355', 290000, 'addons'),
('F620', 'f620', 40000, 'coupes'),
('BMW M4', 'f82', 75000, 'addons2'),
('Ferrari F8T', 'f8t', 480000, 'addons'),
('Faction', 'faction', 20000, 'muscle'),
('Faction Rider', 'faction2', 30000, 'muscle'),
('Faction XL', 'faction3', 40000, 'muscle'),
('Faggio', 'faggio', 1900, 'motorcycles'),
('Vespa', 'faggio2', 2800, 'motorcycles'),
('Drift RX7', 'fc3s', 50000, 'addons2'),
('Husqvarna FC450', 'fc450', 22500, 'bikes'),
('Felon', 'felon', 42000, 'coupes'),
('Felon GT', 'felon2', 55000, 'coupes'),
('Feltzer', 'feltzer2', 55000, 'sports'),
('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
('Fixter (velo)', 'fixter', 225, 'motorcycles'),
('FMJ', 'fmj', 185000, 'super'),
('Formula', 'formula', 3500000, 'casino'),
('Formula 2', 'formula2', 5000000, 'casino'),
('KIA Fortek', 'fortek', 9000, 'addons'),
('Jaguar F-Pace', 'fpacehm', 35000, 'addons'),
('Fhantom', 'fq2', 17000, 'suvs'),
('Fugitive', 'fugitive', 12000, 'sedans'),
('Furia', 'furia', 160000, 'casino'),
('Furore GT', 'furoregt', 45000, 'sports'),
('Fusilade', 'fusilade', 40000, 'sports'),
('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
('Gauntlet', 'gauntlet', 30000, 'muscle'),
('Gauntlet 3', 'gauntlet3', 47000, 'casino'),
('Gauntlet 4', 'gauntlet4', 50000, 'casino'),
('Gang Burrito', 'gburrito', 45000, 'vans'),
('Burrito', 'gburrito2', 29000, 'vans'),
('Glendale', 'glendale', 6500, 'sedans'),
('GMC Kerb', 'gmcyd', 45000, 'yank'),
('Honda GoldWing', 'goldwing', 45000, 'bikes'),
('Golf V', 'golfgti', 28000, 'addons'),
('Grabger', 'granger', 50000, 'suvs'),
('Gresley', 'gresley', 47500, 'yank'),
('Suzuki GSXR', 'gsxr', 50000, 'bikes'),
('GT 500', 'gt500', 785000, 'sportsclassics'),
('Guardian', 'guardian', 45000, 'offroad'),
('Kawasaki H2', 'h2carb', 150000, 'bikes'),
('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
('Hellion', 'hellion', 32000, 'casino'),
('Hermes', 'hermes', 535000, 'muscle'),
('Lamborghini Huracan', 'hevo', 300000, 'addons'),
('Hexer', 'hexer', 12000, 'motorcycles'),
('Hotknife', 'hotknife', 125000, 'muscle'),
('Huntley S', 'huntley', 40000, 'suvs'),
('Hustler', 'hustler', 625000, 'muscle'),
('Imorgon', 'imorgon', 85000, 'casino'),
('Infernus', 'infernus', 180000, 'super'),
('Innovation', 'innovation', 23500, 'motorcycles'),
('Intruder', 'intruder', 7500, 'sedans'),
('Lexus ISF', 'ISF', 27500, 'addons'),
('Issi', 'issi2', 10000, 'compacts'),
('Issi 3', 'issi3', 28000, 'casino'),
('Issi 7', 'issi7', 36000, 'casino'),
('Itali 2', 'italigtb', 150000, 'robin'),
('Itali 3', 'italigtb2', 120000, 'robin'),
('Itali GTO', 'italigto', 110000, 'robin'),
('Jackal', 'jackal', 38000, 'coupes'),
('JB-700 2', 'jb7002', 155000, 'casino'),
('Koenigesegg Jesko', 'jes', 600000, 'addons'),
('Jester', 'jester', 65000, 'sports'),
('Jester(Racecar)', 'jester2', 135000, 'sports'),
('Jester GTT', 'jester3', 79000, 'robin'),
('Journey', 'journey', 6500, 'vans'),
('Jugular', 'jugular', 42500, 'casino'),
('Kamacho', 'kamacho', 345000, 'offroad'),
('Kanjo', 'kanjo', 9000, 'casino'),
('Khamelion', 'khamelion', 38000, 'sports'),
('Koenigesegg Agera R', 'KoenigseggAgeraR', 675000, 'addons'),
('Komoda', 'komoda', 135000, 'casino'),
('Krieger', 'krieger', 75000, 'casino'),
('Kuruma', 'kuruma', 30000, 'sports'),
('Landstalker', 'landstalker', 35000, 'suvs'),
('RE-7B', 'le7b', 325000, 'super'),
('Locust', 'locust', 11500, 'casino'),
('Lamborghini Murcielago', 'lp670sv', 290000, 'addons'),
('Suzuki LTR450', 'ltr450', 10000, 'bikes'),
('Lynx', 'lynx', 40000, 'sports'),
('BMW M135i', 'm135i', 19000, 'addons'),
('BMW M2', 'm2f22', 65000, 'addons'),
('Drift M3', 'm3kean', 48000, 'addons'),
('BMW M5 E60', 'm5e60', 130000, 'addons'),
('BMW M5', 'm5f90', 87500, 'addons'),
('Mamba', 'mamba', 70000, 'sports'),
('Manana', 'manana', 12800, 'sportsclassics'),
('Manchez', 'manchez', 5300, 'motorcycles'),
('Massacro', 'massacro', 65000, 'sports'),
('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
('Mesa', 'mesa', 16000, 'suvs'),
('Mesa Trail', 'mesa3', 40000, 'suvs'),
('Minivan', 'minivan', 13000, 'vans'),
('Tesla Model S', 'models', 95000, 'addons'),
('Monroe', 'monroe', 55000, 'sportsclassics'),
('The Liberator', 'monster', 210000, 'offroad'),
('Moonbeam', 'moonbeam', 18000, 'vans'),
('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
('Maserati Quattroporte', 'mqgts', 65000, 'addons'),
('Honda Grom', 'msx', 25000, 'bikes'),
('Mustang DM', 'mustang65', 90000, 'yank'),
('Aprilia MXV450', 'mxv450', 25000, 'bikes'),
('Aprilia MXV450 Supermoto', 'mxv450sm', 35000, 'bikes'),
('Nebula', 'nebula', 8000, 'casino'),
('Nemesis', 'nemesis', 5800, 'motorcycles'),
('Neo', 'neo', 950000, 'casino'),
('Neon', 'neon', 1500000, 'sports'),
('Nightblade', 'nightblade', 35000, 'motorcycles'),
('Nightshade', 'nightshade', 65000, 'muscle'),
('9F', 'ninef', 65000, 'sports'),
('9F Cabrio', 'ninef2', 80000, 'sports'),
('Novak', 'novak', 125000, 'casino'),
('Omnis', 'omnis', 35000, 'sports'),
('Oppressor', 'oppressor', 3524500, 'super'),
('Oracle XS', 'oracle2', 35000, 'coupes'),
('Osiris', 'osiris', 160000, 'super'),
('Outlaw', 'outlaw', 95000, 'casino'),
('Mclaren P1', 'p1', 1000000, 'addons'),
('Panto', 'panto', 10000, 'compacts'),
('Paradise', 'paradise', 19000, 'vans'),
('Paragon', 'paragon', 167500, 'casino'),
('Pariah', 'pariah', 1420000, 'sports'),
('Passat TDI', 'passatr', 38000, 'yank'),
('Patriot', 'patriot', 55000, 'suvs'),
('PCJ-600', 'pcj', 6200, 'motorcycles'),
('Porsche Cayenne', 'pcs18', 325000, 'addons'),
('Penumbra', 'penumbra', 28000, 'sports'),
('Peyote 2', 'peyote2', 29000, 'casino'),
('Pfister', 'pfister811', 85000, 'super'),
('Porsche GT3', 'pgt3', 200000, 'addons'),
('Phoenix', 'phoenix', 12500, 'muscle'),
('Picador', 'picador', 18000, 'muscle'),
('Pigalle', 'pigalle', 20000, 'sportsclassics'),
('Stomp 110', 'pitbike', 1200, 'bikes');
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('VW Polo', 'polo2018', 30000, 'addons2'),
('Prairie', 'prairie', 12000, 'compacts'),
('Premier', 'premier', 8000, 'sedans'),
('Primo Custom', 'primo2', 14000, 'sedans'),
('X80 Proto', 'prototipo', 2500000, 'super'),
('Audi Q8', 'q820', 70000, 'addons'),
('Yamaha R1', 'r1', 40000, 'bikes'),
('Yamaha R6', 'r6', 80000, 'bikes'),
('Radius', 'radi', 29000, 'suvs'),
('raiden', 'raiden', 1375000, 'sports'),
('dodge Ram ', 'ram2500', 70000, 'yank'),
('Rapid GT', 'rapidgt', 35000, 'sports'),
('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
('Reaper', 'reaper', 150000, 'super'),
('Rebel', 'rebel2', 35000, 'offroad'),
('Rebela', 'rebela', 98000, 'casino'),
('Rebla', 'rebla', 50000, 'robin'),
('Regina', 'regina', 5000, 'sedans'),
('Retinue', 'retinue', 615000, 'sportsclassics'),
('Retinue 2', 'retinue2', 65000, 'casino'),
('Revolter', 'revolter', 1610000, 'sports'),
('riata', 'riata', 380000, 'offroad'),
('Suzuki RMZ', 'rmz2', 39000, 'bikes'),
('Rocoto', 'rocoto', 45000, 'suvs'),
('R-Rocket', 'rrocket', 85000, 'casino'),
('Audi RS3', 'rs318', 32000, 'addons'),
('Audi RS5R', 'rs5r', 62500, 'addons'),
('Audi RS6', 'rs6', 47000, 'addons'),
('Drift R30', 'rsx', 20000, 'addons'),
('Ruffian', 'ruffian', 6800, 'motorcycles'),
('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
('Rumpo', 'rumpo', 15000, 'vans'),
('Rumpo Trail', 'rumpo3', 19500, 'vans'),
('Mercedes S600', 's600w220', 35000, 'addons2'),
('S80', 's80', 190000, 'casino'),
('Sabre Turbo', 'sabregt', 20000, 'muscle'),
('Sabre GT', 'sabregt2', 25000, 'muscle'),
('Sanchez', 'sanchez', 5300, 'motorcycles'),
('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
('Sanctus', 'sanctus', 25000, 'motorcycles'),
('Sandking', 'sandking', 55000, 'offroad'),
('Savestra', 'savestra', 990000, 'sportsclassics'),
('SC 1', 'sc1', 1603000, 'super'),
('Schafter', 'schafter2', 25000, 'sedans'),
('Schafter V12', 'schafter3', 50000, 'sports'),
('Schlagen GT', 'schlagen', 115000, 'robin'),
('VW Scirocco', 'scijo', 25000, 'addons2'),
('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
('Seminole', 'seminole', 25000, 'suvs'),
('Sentinel', 'sentinel', 32000, 'coupes'),
('Sentinel XS', 'sentinel2', 40000, 'coupes'),
('Sentinel3', 'sentinel3', 650000, 'sports'),
('Seven 70', 'seven70', 39500, 'sports'),
('ETR1', 'sheava', 220000, 'super'),
('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
('Slamvan 2', 'slamvan2', 48000, 'robin'),
('Slam Van', 'slamvan3', 11500, 'muscle'),
('Sovereign', 'sovereign', 22000, 'motorcycles'),
('Stinger', 'stinger', 80000, 'sportsclassics'),
('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
('Streiter', 'streiter', 500000, 'sports'),
('Stretch', 'stretch', 90000, 'sedans'),
('Stromberg', 'stromberg', 3185350, 'sports'),
('Stryder', 'stryder', 55000, 'casino'),
('04 Scooby', 'subwrx', 55000, 'addons2'),
('Sugoi', 'sugoi', 130000, 'casino'),
('Sultan', 'sultan', 15000, 'sports'),
('Sultan 2', 'sultan2', 135000, 'casino'),
('Sultan RS', 'sultanrs', 65000, 'super'),
('Subaru 22b', 'sultanrs2', 65000, 'addons'),
('Super Diamond', 'superd', 130000, 'sedans'),
('Surano', 'surano', 50000, 'sports'),
('Surfer', 'surfer', 12000, 'vans'),
('RangeRover SVR', 'SVR14', 190000, 'addons2'),
('KTM SXF450', 'sxf450', 29000, 'bikes'),
('KTM SXF450 Supermoto', 'sxf450sm', 32000, 'bikes'),
('T20', 't20', 300000, 'super'),
('Tailgater', 'tailgater', 30000, 'sedans'),
('Tampa', 'tampa', 16000, 'muscle'),
('Drift Tampa', 'tampa2', 80000, 'sports'),
('Porsche Taycan', 'taycan', 110000, 'addons2'),
('TBird', 'tbird64', 60000, 'yank'),
('Thrax', 'thrax', 65000, 'casino'),
('Thrust', 'thrust', 24000, 'motorcycles'),
('TM SMR450', 'tmsm', 35000, 'bikes'),
('Toro', 'toros', 65000, 'robin'),
('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
('Trophy Truck', 'trophytruck', 60000, 'offroad'),
('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
('Tropos', 'tropos', 40000, 'sports'),
('Turismo R', 'turismor', 350000, 'super'),
('Tyrus', 'tyrus', 600000, 'super'),
('Woodys Taxi', 'v250', 19000, 'addons'),
('Vacca', 'vacca', 120000, 'super'),
('Vader', 'vader', 7200, 'motorcycles'),
('Vagrant', 'vagrant', 142500, 'casino'),
('Verlierer', 'verlierer2', 70000, 'sports'),
('Vigero', 'vigero', 12500, 'muscle'),
('Virgo', 'virgo', 14000, 'muscle'),
('Viseris', 'viseris', 875000, 'sportsclassics'),
('Visione', 'visione', 2250000, 'super'),
('Voltic', 'voltic', 90000, 'super'),
('Voltic 2', 'voltic2', 3830400, 'super'),
('Volvo 850r', 'volvo850r', 32000, 'addons2'),
('Volvo XC90', 'volvoxc90', 60000, 'addons2'),
('Voodoo', 'voodoo', 7200, 'muscle'),
('Vortex', 'vortex', 9800, 'motorcycles'),
('VSTR', 'vstr', 160000, 'casino'),
('Warrener', 'warrener', 4000, 'sedans'),
('Washington', 'washington', 9000, 'sedans'),
('Windsor', 'windsor', 95000, 'coupes'),
('Windsor Drop', 'windsor2', 125000, 'coupes'),
('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
('Jaguar XJ', 'xj', 42500, 'addons2'),
('XLS', 'xls', 32000, 'suvs'),
('Yosemite', 'yosemite', 485000, 'muscle'),
('Yosemite 2', 'yosemite2', 325000, 'casino'),
('Youga', 'youga', 10800, 'vans'),
('Youga Luxuary', 'youga2', 14500, 'vans'),
('Z190', 'z190', 900000, 'sportsclassics'),
('Zentorno', 'zentorno', 1500000, 'super'),
('Zhaba', 'zhaba', 1250000, 'casino'),
('Zion', 'zion', 36000, 'coupes'),
('Zion Cabrio', 'zion2', 45000, 'coupes'),
('Zion 3', 'zion3', 11000, 'casino'),
('Chrysler Zr1', 'zl12017', 80000, 'yank'),
('Zombie', 'zombiea', 9500, 'motorcycles'),
('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
('Zorrusso', 'zorrusso', 62000, 'casino'),
('Z-Type', 'ztype', 220000, 'sportsclassics'),
('Kawasaki Ninja ZX-10R', 'zx10r', 62000, 'bikes');





INSERT INTO `weashops` (`id`, `zone`, `item`, `price`) VALUES
(1, 'GunShop', 'WEAPON_BALL', 2);
INSERT INTO `weashops` (`id`, `zone`, `item`, `price`) VALUES
(2, 'GunShop', 'WEAPON_BAT', 85);
INSERT INTO `weashops` (`id`, `zone`, `item`, `price`) VALUES
(3, 'GunShop', 'WEAPON_BATTLEAXE', 195);
INSERT INTO `weashops` (`id`, `zone`, `item`, `price`) VALUES
(4, 'GunShop', 'WEAPON_BOTTLE', 1),
(5, 'GunShop', 'WEAPON_CROWBAR', 35),
(6, 'GunShop', 'WEAPON_DAGGER', 185),
(7, 'GunShop', 'WEAPON_FIREEXTINGUISHER', 20),
(8, 'GunShop', 'WEAPON_FLASHLIGHT', 15),
(9, 'GunShop', 'WEAPON_GOLFCLUB', 75),
(10, 'GunShop', 'WEAPON_HAMMER', 15),
(11, 'GunShop', 'WEAPON_HATCHET', 95),
(12, 'GunShop', 'WEAPON_KNIFE', 35),
(13, 'GunShop', 'WEAPON_KNUCKLE', 95),
(14, 'GunShop', 'WEAPON_MACHETE', 200),
(15, 'GunShop', 'WEAPON_PETROLCAN', 100),
(16, 'GunShop', 'WEAPON_POOLCUE', 15),
(17, 'GunShop', 'WEAPON_SNOWBALL', 5),
(18, 'GunShop', 'WEAPON_SWITCHBLADE', 75),
(19, 'GunShop', 'WEAPON_WRENCH', 35),
(20, 'GunShop', 'WEAPON_STUNGUN', 1000),
(24, 'BlackWeashop', 'WEAPON_SAWNOFFSHOTGUN', 110000),
(25, 'BlackWeashop', 'WEAPON_MARKSMANPISTOL', 50000),
(26, 'BlackWeashop', 'WEAPON_ASSAULTRIFLE', 150000),
(27, 'BlackWeashop', 'WEAPON_COMBATPISTOL', 60000);


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;