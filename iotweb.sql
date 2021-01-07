-- --------------------------------------------------------
-- Host:                         database-1.c0o3nvtq4hwj.us-east-1.rds.amazonaws.com
-- Server version:               10.4.8-MariaDB-log - Source distribution
-- Server OS:                    Linux
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for iotweb
CREATE DATABASE IF NOT EXISTS `iotweb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `iotweb`;

-- Dumping structure for table iotweb.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `Admin_id` int(11) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`Admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table iotweb.admin: ~1 rows (approximately)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT IGNORE INTO `admin` (`Admin_id`, `username`, `password`) VALUES
	(1, 'abi', '$2a$12$KSHR66P5Arve0W6pa8QTWOz/c2eq36vYC2B6OFfXd0UutJzceg3YK');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- Dumping structure for table iotweb.admin_login
CREATE TABLE IF NOT EXISTS `admin_login` (
  `Admin_id` int(11) NOT NULL,
  `logindata` datetime DEFAULT NULL,
  `logoutdata` datetime DEFAULT NULL,
  KEY `fa` (`Admin_id`),
  CONSTRAINT `fa` FOREIGN KEY (`Admin_id`) REFERENCES `admin` (`Admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table iotweb.admin_login: ~1 rows (approximately)
/*!40000 ALTER TABLE `admin_login` DISABLE KEYS */;
INSERT IGNORE INTO `admin_login` (`Admin_id`, `logindata`, `logoutdata`) VALUES
	(1, '2020-10-31 06:16:27', NULL);
/*!40000 ALTER TABLE `admin_login` ENABLE KEYS */;

-- Dumping structure for table iotweb.attendance
CREATE TABLE IF NOT EXISTS `attendance` (
  `rollno` varchar(8) DEFAULT NULL,
  `attend_date` date DEFAULT NULL,
  `attend_time` time DEFAULT NULL,
  KEY `rollno` (`rollno`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`rollno`) REFERENCES `register` (`Rollno`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table iotweb.attendance: ~0 rows (approximately)
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;

-- Dumping structure for table iotweb.components
CREATE TABLE IF NOT EXISTS `components` (
  `component_id` int(50) NOT NULL AUTO_INCREMENT,
  `component_name` varchar(50) NOT NULL,
  `component_model` varchar(50) NOT NULL,
  `component_count` int(50) NOT NULL,
  `transacted` int(50) DEFAULT NULL,
  PRIMARY KEY (`component_id`),
  UNIQUE KEY `component_model` (`component_model`),
  KEY `abi` (`component_id`,`component_count`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- Dumping data for table iotweb.components: ~1 rows (approximately)
/*!40000 ALTER TABLE `components` DISABLE KEYS */;
INSERT IGNORE INTO `components` (`component_id`, `component_name`, `component_model`, `component_count`, `transacted`) VALUES
	(28, 'raspberry', '3', 2, 0);
/*!40000 ALTER TABLE `components` ENABLE KEYS */;

-- Dumping structure for table iotweb.comp_request
CREATE TABLE IF NOT EXISTS `comp_request` (
  `request_id` int(100) NOT NULL AUTO_INCREMENT,
  `component_id` int(100) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `component_status` int(5) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `transaction_status` int(100) NOT NULL DEFAULT 0,
  `Date` date NOT NULL,
  PRIMARY KEY (`request_id`),
  KEY `email` (`email`),
  KEY `component_id` (`component_id`),
  CONSTRAINT `comp_request_ibfk_1` FOREIGN KEY (`email`) REFERENCES `register` (`email`) ON DELETE CASCADE,
  CONSTRAINT `comp_request_ibfk_2` FOREIGN KEY (`component_id`) REFERENCES `components` (`component_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table iotweb.comp_request: ~0 rows (approximately)
/*!40000 ALTER TABLE `comp_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `comp_request` ENABLE KEYS */;

-- Dumping structure for table iotweb.contests
CREATE TABLE IF NOT EXISTS `contests` (
  `contest_id` int(11) NOT NULL AUTO_INCREMENT,
  `contest_title` varchar(70) NOT NULL,
  `contest_desc` varchar(200) DEFAULT NULL,
  `image_name` varchar(50) NOT NULL,
  `contest_link` varchar(150) DEFAULT NULL,
  `last_date` varchar(50) DEFAULT NULL,
  `event_date` varchar(50) DEFAULT NULL,
  `contest_organisor` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`contest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table iotweb.contests: ~1 rows (approximately)
/*!40000 ALTER TABLE `contests` DISABLE KEYS */;
INSERT IGNORE INTO `contests` (`contest_id`, `contest_title`, `contest_desc`, `image_name`, `contest_link`, `last_date`, `event_date`, `contest_organisor`) VALUES
	(5, 'Lora', 'iot project contest', 'download (1).jpg', 'https://www.eenewsautomotive.com/news/iot-contest-innovative-lora-use-cases-designs', '3/10/2019', '30/10/2019', 'lora');
/*!40000 ALTER TABLE `contests` ENABLE KEYS */;

-- Dumping structure for table iotweb.contest_registration
CREATE TABLE IF NOT EXISTS `contest_registration` (
  `email` varchar(50) NOT NULL,
  `contest_id` int(11) NOT NULL,
  `visited` int(11) DEFAULT NULL,
  `registered` int(11) DEFAULT NULL,
  PRIMARY KEY (`email`,`contest_id`),
  KEY `f2` (`contest_id`),
  CONSTRAINT `f2` FOREIGN KEY (`contest_id`) REFERENCES `contests` (`contest_id`) ON DELETE CASCADE,
  CONSTRAINT `fcontest` FOREIGN KEY (`email`) REFERENCES `register` (`email`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table iotweb.contest_registration: ~0 rows (approximately)
/*!40000 ALTER TABLE `contest_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `contest_registration` ENABLE KEYS */;

-- Dumping structure for table iotweb.main_gallery
CREATE TABLE IF NOT EXISTS `main_gallery` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_title` varchar(50) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `file_name` varchar(100) NOT NULL,
  `index_page` int(11) DEFAULT NULL,
  `image_date` date DEFAULT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table iotweb.main_gallery: ~4 rows (approximately)
/*!40000 ALTER TABLE `main_gallery` DISABLE KEYS */;
INSERT IGNORE INTO `main_gallery` (`image_id`, `image_title`, `description`, `file_name`, `index_page`, `image_date`) VALUES
	(14, 'raspberry pi training', 'we given for students', 'course-3.jpg', 0, '2020-10-31'),
	(15, 'Training', 'training for lab students', 'IMG-20191013-WA0018.jpg', 0, '2020-10-31'),
	(16, 'lab students', 'all our lab students', 'bg_1.jpg', 0, '2020-10-31'),
	(17, 'vehicle detection', 'vehicle accedent detection', 'abiphoto.jpg', 0, '2020-10-31');
/*!40000 ALTER TABLE `main_gallery` ENABLE KEYS */;

-- Dumping structure for table iotweb.register
CREATE TABLE IF NOT EXISTS `register` (
  `name` varchar(30) NOT NULL,
  `Rollno` varchar(8) NOT NULL,
  `department` varchar(100) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(40) NOT NULL,
  `confrimation` int(2) NOT NULL,
  PRIMARY KEY (`Rollno`),
  UNIQUE KEY `mobile` (`mobile`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table iotweb.register: ~0 rows (approximately)
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
/*!40000 ALTER TABLE `register` ENABLE KEYS */;

-- Dumping structure for table iotweb.student_profile
CREATE TABLE IF NOT EXISTS `student_profile` (
  `Rollno` varchar(8) DEFAULT NULL,
  `projects_done` varchar(100) NOT NULL,
  `achivement` varchar(100) DEFAULT NULL,
  KEY `Rollno` (`Rollno`),
  CONSTRAINT `student_profile_ibfk_1` FOREIGN KEY (`Rollno`) REFERENCES `register` (`Rollno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table iotweb.student_profile: ~0 rows (approximately)
/*!40000 ALTER TABLE `student_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_profile` ENABLE KEYS */;

-- Dumping structure for table iotweb.training_videos
CREATE TABLE IF NOT EXISTS `training_videos` (
  `video_id` int(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `video_link` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`video_id`),
  UNIQUE KEY `u1` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table iotweb.training_videos: ~0 rows (approximately)
/*!40000 ALTER TABLE `training_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `training_videos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
