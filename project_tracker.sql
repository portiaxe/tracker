-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.17-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for project_tracker
CREATE DATABASE IF NOT EXISTS `project_tracker` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `project_tracker`;

-- Dumping structure for table project_tracker.userroles
CREATE TABLE IF NOT EXISTS `userroles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `role` enum('ADMIN','USER') NOT NULL DEFAULT 'USER',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `userroles_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table project_tracker.userroles: ~0 rows (approximately)
/*!40000 ALTER TABLE `userroles` DISABLE KEYS */;
REPLACE INTO `userroles` (`id`, `userId`, `role`) VALUES
	(1, 1, 'USER');
/*!40000 ALTER TABLE `userroles` ENABLE KEYS */;

-- Dumping structure for table project_tracker.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `userpass` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `accountNonLocked` tinyint(1) NOT NULL DEFAULT '1',
  `accountNonExpired` tinyint(1) NOT NULL DEFAULT '1',
  `credentialsNonExpired` tinyint(1) NOT NULL DEFAULT '1',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table project_tracker.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `username`, `userpass`, `created`, `updated`, `accountNonLocked`, `accountNonExpired`, `credentialsNonExpired`, `enabled`) VALUES
	(1, 'jerico', '$2a$10$KYhvk0F3CLRBixzutK7bjuG2b3sd.Py8ZeZQ3dGRBloif3i2krDD.', '2017-10-09 01:59:04', '2017-10-09 01:59:04', 1, 1, 1, 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for procedure project_tracker._proc_getUserByUsername
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `_proc_getUserByUsername`(
	IN `user_name` VARCHAR(255)
)
BEGIN
	SELECT u.username,
			 u.userpass,
			 u.created,
			 u.updated,
			 u.accountNonLocked,
			 u.accountNonExpired,
			 u.credentialsNonExpired
	  FROM users u; 
END//
DELIMITER ;

-- Dumping structure for procedure project_tracker._proc_getUserRolesById
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `_proc_getUserRolesById`(
	IN `user_id` INT
)
BEGIN
	SELECT ur.id,ur.role
	  FROM userroles ur
	 WHERE ur.userId = user_id;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
