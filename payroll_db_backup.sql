/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.5-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: payroll_db
-- ------------------------------------------------------
-- Server version	11.8.5-MariaDB-4 from Debian

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `allowance`
--

DROP TABLE IF EXISTS `allowance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `allowance` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` enum('fixed','percentage') NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `taxable` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allowance`
--

LOCK TABLES `allowance` WRITE;
/*!40000 ALTER TABLE `allowance` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `allowance` VALUES
(1,'House Allowance','fixed',200000.00,0,1,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(2,'Transport Allowance','fixed',150000.00,0,1,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(3,'Medical Allowance','fixed',100000.00,1,1,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(4,'Overtime Bonus','fixed',50000.00,1,1,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL);
/*!40000 ALTER TABLE `allowance` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `attendances`
--

DROP TABLE IF EXISTS `attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `employee_id` varchar(50) NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `date` date NOT NULL COMMENT 'Date of attendance',
  `check_in` time DEFAULT NULL COMMENT 'Check-in time',
  `check_out` time DEFAULT NULL COMMENT 'Check-out time',
  `status` varchar(255) NOT NULL DEFAULT 'Present' COMMENT 'Attendance status: Present, Absent, Leave, Holiday',
  `hours_worked` decimal(5,2) DEFAULT NULL COMMENT 'Total hours worked',
  `notes` text DEFAULT NULL COMMENT 'Additional notes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attendances_employee_id_foreign` (`employee_id`),
  CONSTRAINT `attendances_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendances`
--

LOCK TABLES `attendances` WRITE;
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `attendances` VALUES
(1,'EMP-DLAYPROL','Admin User','2026-01-25','08:25:00','17:25:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(2,'EMP-DLAYPROL','Admin User','2026-01-26','08:18:00','17:18:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(3,'EMP-DLAYPROL','Admin User','2026-01-27','08:30:00','17:30:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(4,'EMP-DLAYPROL','Admin User','2026-01-28','08:25:00','17:25:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(5,'EMP-DLAYPROL','Admin User','2026-01-29','08:09:00','17:09:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(6,'EMP-DLAYPROL','Admin User','2026-01-30','08:28:00','17:28:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(7,'EMP-DLAYPROL','Admin User','2026-01-31','08:17:00','17:17:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(8,'EMP-DLAYPROL','Admin User','2026-02-01','08:24:00','17:24:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(9,'EMP-DLAYPROL','Admin User','2026-02-02','08:14:00','17:14:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(10,'EMP-DLAYPROL','Admin User','2026-02-03','08:17:00','17:17:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(11,'EMP-DLAYPROL','Admin User','2026-02-04','08:11:00','17:11:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(12,'EMP-DLAYPROL','Admin User','2026-02-05','08:19:00','17:19:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(13,'EMP-DLAYPROL','Admin User','2026-02-06','08:28:00','17:28:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(14,'EMP-DLAYPROL','Admin User','2026-02-07','08:00:00','17:00:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(15,'EMP-DLAYPROL','Admin User','2026-02-08','08:26:00','17:26:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(16,'EMP-DLAYPROL','Admin User','2026-02-09','08:00:00','17:00:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(17,'EMP-DLAYPROL','Admin User','2026-02-10','08:01:00','17:01:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(18,'EMP-DLAYPROL','Admin User','2026-02-11','08:15:00','17:15:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(19,'EMP-DLAYPROL','Admin User','2026-02-12','08:30:00','17:30:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(20,'EMP-DLAYPROL','Admin User','2026-02-13','08:29:00','17:29:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(21,'EMP-EM6LKILQ','HR Manager Jane','2026-01-25','08:09:00','17:09:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(22,'EMP-EM6LKILQ','HR Manager Jane','2026-01-26','08:22:00','17:22:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(23,'EMP-EM6LKILQ','HR Manager Jane','2026-01-27','08:29:00','17:29:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(24,'EMP-EM6LKILQ','HR Manager Jane','2026-01-28','08:11:00','17:11:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(25,'EMP-EM6LKILQ','HR Manager Jane','2026-01-29','08:30:00','17:30:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(26,'EMP-EM6LKILQ','HR Manager Jane','2026-01-30','08:04:00','17:04:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(27,'EMP-EM6LKILQ','HR Manager Jane','2026-01-31','08:20:00','17:20:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(28,'EMP-EM6LKILQ','HR Manager Jane','2026-02-01','08:08:00','17:08:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(29,'EMP-EM6LKILQ','HR Manager Jane','2026-02-02','08:26:00','17:26:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(30,'EMP-EM6LKILQ','HR Manager Jane','2026-02-03','08:12:00','17:12:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(31,'EMP-EM6LKILQ','HR Manager Jane','2026-02-04','08:27:00','17:27:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(32,'EMP-EM6LKILQ','HR Manager Jane','2026-02-05','08:00:00','17:00:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(33,'EMP-EM6LKILQ','HR Manager Jane','2026-02-06','08:25:00','17:25:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(34,'EMP-EM6LKILQ','HR Manager Jane','2026-02-07','08:04:00','17:04:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(35,'EMP-EM6LKILQ','HR Manager Jane','2026-02-08','08:28:00','17:28:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(36,'EMP-EM6LKILQ','HR Manager Jane','2026-02-09','08:20:00','17:20:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(37,'EMP-EM6LKILQ','HR Manager Jane','2026-02-10','08:02:00','17:02:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(38,'EMP-EM6LKILQ','HR Manager Jane','2026-02-11','08:08:00','17:08:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(39,'EMP-EM6LKILQ','HR Manager Jane','2026-02-12','08:17:00','17:17:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(40,'EMP-EM6LKILQ','HR Manager Jane','2026-02-13','08:09:00','17:09:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(41,'EMP-P7Q2V6PK','Operations Manager John','2026-01-25','08:03:00','17:03:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(42,'EMP-P7Q2V6PK','Operations Manager John','2026-01-26','08:28:00','17:28:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(43,'EMP-P7Q2V6PK','Operations Manager John','2026-01-27','08:13:00','17:13:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(44,'EMP-P7Q2V6PK','Operations Manager John','2026-01-28','08:04:00','17:04:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(45,'EMP-P7Q2V6PK','Operations Manager John','2026-01-29','08:08:00','17:08:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(46,'EMP-P7Q2V6PK','Operations Manager John','2026-01-30','08:27:00','17:27:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(47,'EMP-P7Q2V6PK','Operations Manager John','2026-01-31','08:15:00','17:15:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(48,'EMP-P7Q2V6PK','Operations Manager John','2026-02-01','08:21:00','17:21:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(49,'EMP-P7Q2V6PK','Operations Manager John','2026-02-02','08:07:00','17:07:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(50,'EMP-P7Q2V6PK','Operations Manager John','2026-02-03','08:14:00','17:14:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(51,'EMP-P7Q2V6PK','Operations Manager John','2026-02-04','08:00:00','17:00:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(52,'EMP-P7Q2V6PK','Operations Manager John','2026-02-05','08:04:00','17:04:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(53,'EMP-P7Q2V6PK','Operations Manager John','2026-02-06','08:01:00','17:01:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(54,'EMP-P7Q2V6PK','Operations Manager John','2026-02-07','08:09:00','17:09:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(55,'EMP-P7Q2V6PK','Operations Manager John','2026-02-08','08:24:00','17:24:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(56,'EMP-P7Q2V6PK','Operations Manager John','2026-02-09','08:02:00','17:02:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(57,'EMP-P7Q2V6PK','Operations Manager John','2026-02-10','08:18:00','17:18:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(58,'EMP-P7Q2V6PK','Operations Manager John','2026-02-11','08:04:00','17:04:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(59,'EMP-P7Q2V6PK','Operations Manager John','2026-02-12','08:14:00','17:14:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(60,'EMP-P7Q2V6PK','Operations Manager John','2026-02-13','08:02:00','17:02:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(61,'EMP-CDXNNO6I','IT Manager David','2026-01-25','08:02:00','17:02:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(62,'EMP-CDXNNO6I','IT Manager David','2026-01-26','08:00:00','17:00:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(63,'EMP-CDXNNO6I','IT Manager David','2026-01-27','08:10:00','17:10:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(64,'EMP-CDXNNO6I','IT Manager David','2026-01-28','08:03:00','17:03:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(65,'EMP-CDXNNO6I','IT Manager David','2026-01-29','08:20:00','17:20:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(66,'EMP-CDXNNO6I','IT Manager David','2026-01-30','08:03:00','17:03:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(67,'EMP-CDXNNO6I','IT Manager David','2026-01-31','08:04:00','17:04:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(68,'EMP-CDXNNO6I','IT Manager David','2026-02-01','08:25:00','17:25:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(69,'EMP-CDXNNO6I','IT Manager David','2026-02-02','08:01:00','17:01:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(70,'EMP-CDXNNO6I','IT Manager David','2026-02-03','08:08:00','17:08:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(71,'EMP-CDXNNO6I','IT Manager David','2026-02-04','08:07:00','17:07:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(72,'EMP-CDXNNO6I','IT Manager David','2026-02-05','08:00:00','17:00:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(73,'EMP-CDXNNO6I','IT Manager David','2026-02-06','08:07:00','17:07:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(74,'EMP-CDXNNO6I','IT Manager David','2026-02-07','08:01:00','17:01:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(75,'EMP-CDXNNO6I','IT Manager David','2026-02-08','08:05:00','17:05:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(76,'EMP-CDXNNO6I','IT Manager David','2026-02-09','08:28:00','17:28:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(77,'EMP-CDXNNO6I','IT Manager David','2026-02-10','08:25:00','17:25:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(78,'EMP-CDXNNO6I','IT Manager David','2026-02-11','08:13:00','17:13:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(79,'EMP-CDXNNO6I','IT Manager David','2026-02-12','08:01:00','17:01:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(80,'EMP-CDXNNO6I','IT Manager David','2026-02-13','08:15:00','17:15:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(81,'EMP-4BN9PMLV','Finance Manager Mary','2026-01-25','08:16:00','17:16:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(82,'EMP-4BN9PMLV','Finance Manager Mary','2026-01-26','08:07:00','17:07:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(83,'EMP-4BN9PMLV','Finance Manager Mary','2026-01-27','08:02:00','17:02:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(84,'EMP-4BN9PMLV','Finance Manager Mary','2026-01-28','08:24:00','17:24:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(85,'EMP-4BN9PMLV','Finance Manager Mary','2026-01-29','08:27:00','17:27:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(86,'EMP-4BN9PMLV','Finance Manager Mary','2026-01-30','08:17:00','17:17:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(87,'EMP-4BN9PMLV','Finance Manager Mary','2026-01-31','08:08:00','17:08:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(88,'EMP-4BN9PMLV','Finance Manager Mary','2026-02-01','08:24:00','17:24:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(89,'EMP-4BN9PMLV','Finance Manager Mary','2026-02-02','08:12:00','17:12:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(90,'EMP-4BN9PMLV','Finance Manager Mary','2026-02-03','08:21:00','17:21:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(91,'EMP-4BN9PMLV','Finance Manager Mary','2026-02-04','08:21:00','17:21:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(92,'EMP-4BN9PMLV','Finance Manager Mary','2026-02-05','08:25:00','17:25:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(93,'EMP-4BN9PMLV','Finance Manager Mary','2026-02-06','08:15:00','17:15:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(94,'EMP-4BN9PMLV','Finance Manager Mary','2026-02-07','08:22:00','17:22:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(95,'EMP-4BN9PMLV','Finance Manager Mary','2026-02-08','08:09:00','17:09:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(96,'EMP-4BN9PMLV','Finance Manager Mary','2026-02-09','08:03:00','17:03:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(97,'EMP-4BN9PMLV','Finance Manager Mary','2026-02-10','08:07:00','17:07:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(98,'EMP-4BN9PMLV','Finance Manager Mary','2026-02-11','08:19:00','17:19:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(99,'EMP-4BN9PMLV','Finance Manager Mary','2026-02-12','08:23:00','17:23:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(100,'EMP-4BN9PMLV','Finance Manager Mary','2026-02-13','08:30:00','17:30:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(101,'EMP-BYFNS1ZE','Senior Developer Alice','2026-01-25','08:18:00','17:18:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(102,'EMP-BYFNS1ZE','Senior Developer Alice','2026-01-26','08:09:00','17:09:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(103,'EMP-BYFNS1ZE','Senior Developer Alice','2026-01-27','08:11:00','17:11:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(104,'EMP-BYFNS1ZE','Senior Developer Alice','2026-01-28','08:27:00','17:27:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(105,'EMP-BYFNS1ZE','Senior Developer Alice','2026-01-29','08:03:00','17:03:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(106,'EMP-BYFNS1ZE','Senior Developer Alice','2026-01-30','08:07:00','17:07:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(107,'EMP-BYFNS1ZE','Senior Developer Alice','2026-01-31','08:00:00','17:00:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(108,'EMP-BYFNS1ZE','Senior Developer Alice','2026-02-01','08:16:00','17:16:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(109,'EMP-BYFNS1ZE','Senior Developer Alice','2026-02-02','08:05:00','17:05:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(110,'EMP-BYFNS1ZE','Senior Developer Alice','2026-02-03','08:01:00','17:01:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(111,'EMP-BYFNS1ZE','Senior Developer Alice','2026-02-04','08:07:00','17:07:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(112,'EMP-BYFNS1ZE','Senior Developer Alice','2026-02-05','08:26:00','17:26:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(113,'EMP-BYFNS1ZE','Senior Developer Alice','2026-02-06','08:05:00','17:05:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(114,'EMP-BYFNS1ZE','Senior Developer Alice','2026-02-07','08:23:00','17:23:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(115,'EMP-BYFNS1ZE','Senior Developer Alice','2026-02-08','08:05:00','17:05:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(116,'EMP-BYFNS1ZE','Senior Developer Alice','2026-02-09','08:08:00','17:08:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(117,'EMP-BYFNS1ZE','Senior Developer Alice','2026-02-10','08:15:00','17:15:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(118,'EMP-BYFNS1ZE','Senior Developer Alice','2026-02-11','08:24:00','17:24:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(119,'EMP-BYFNS1ZE','Senior Developer Alice','2026-02-12','08:25:00','17:25:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(120,'EMP-BYFNS1ZE','Senior Developer Alice','2026-02-13','08:01:00','17:01:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(121,'EMP-9HXEAIOJ','Accountant Bob','2026-01-25','08:01:00','17:01:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(122,'EMP-9HXEAIOJ','Accountant Bob','2026-01-26','08:17:00','17:17:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(123,'EMP-9HXEAIOJ','Accountant Bob','2026-01-27','08:29:00','17:29:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(124,'EMP-9HXEAIOJ','Accountant Bob','2026-01-28','08:24:00','17:24:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(125,'EMP-9HXEAIOJ','Accountant Bob','2026-01-29','08:07:00','17:07:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(126,'EMP-9HXEAIOJ','Accountant Bob','2026-01-30','08:28:00','17:28:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(127,'EMP-9HXEAIOJ','Accountant Bob','2026-01-31','08:18:00','17:18:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(128,'EMP-9HXEAIOJ','Accountant Bob','2026-02-01','08:28:00','17:28:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(129,'EMP-9HXEAIOJ','Accountant Bob','2026-02-02','08:16:00','17:16:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(130,'EMP-9HXEAIOJ','Accountant Bob','2026-02-03','08:00:00','17:00:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(131,'EMP-9HXEAIOJ','Accountant Bob','2026-02-04','08:22:00','17:22:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(132,'EMP-9HXEAIOJ','Accountant Bob','2026-02-05','08:16:00','17:16:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(133,'EMP-9HXEAIOJ','Accountant Bob','2026-02-06','08:05:00','17:05:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(134,'EMP-9HXEAIOJ','Accountant Bob','2026-02-07','08:25:00','17:25:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(135,'EMP-9HXEAIOJ','Accountant Bob','2026-02-08','08:06:00','17:06:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(136,'EMP-9HXEAIOJ','Accountant Bob','2026-02-09','08:09:00','17:09:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(137,'EMP-9HXEAIOJ','Accountant Bob','2026-02-10','08:00:00','17:00:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(138,'EMP-9HXEAIOJ','Accountant Bob','2026-02-11','08:19:00','17:19:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(139,'EMP-9HXEAIOJ','Accountant Bob','2026-02-12','08:25:00','17:25:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(140,'EMP-9HXEAIOJ','Accountant Bob','2026-02-13','08:11:00','17:11:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(141,'EMP-V4BHORFP','HR Assistant Clara','2026-01-25','08:14:00','17:14:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(142,'EMP-V4BHORFP','HR Assistant Clara','2026-01-26','08:22:00','17:22:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(143,'EMP-V4BHORFP','HR Assistant Clara','2026-01-27','08:17:00','17:17:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(144,'EMP-V4BHORFP','HR Assistant Clara','2026-01-28','08:19:00','17:19:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(145,'EMP-V4BHORFP','HR Assistant Clara','2026-01-29','08:04:00','17:04:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(146,'EMP-V4BHORFP','HR Assistant Clara','2026-01-30','08:09:00','17:09:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(147,'EMP-V4BHORFP','HR Assistant Clara','2026-01-31','08:16:00','17:16:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(148,'EMP-V4BHORFP','HR Assistant Clara','2026-02-01','08:21:00','17:21:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(149,'EMP-V4BHORFP','HR Assistant Clara','2026-02-02','08:28:00','17:28:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(150,'EMP-V4BHORFP','HR Assistant Clara','2026-02-03','08:21:00','17:21:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(151,'EMP-V4BHORFP','HR Assistant Clara','2026-02-04','08:24:00','17:24:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(152,'EMP-V4BHORFP','HR Assistant Clara','2026-02-05','08:12:00','17:12:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(153,'EMP-V4BHORFP','HR Assistant Clara','2026-02-06','08:21:00','17:21:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(154,'EMP-V4BHORFP','HR Assistant Clara','2026-02-07','08:28:00','17:28:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(155,'EMP-V4BHORFP','HR Assistant Clara','2026-02-08','08:07:00','17:07:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(156,'EMP-V4BHORFP','HR Assistant Clara','2026-02-09','08:22:00','17:22:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(157,'EMP-V4BHORFP','HR Assistant Clara','2026-02-10','08:09:00','17:09:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(158,'EMP-V4BHORFP','HR Assistant Clara','2026-02-11','08:13:00','17:13:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(159,'EMP-V4BHORFP','HR Assistant Clara','2026-02-12','08:12:00','17:12:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(160,'EMP-V4BHORFP','HR Assistant Clara','2026-02-13','08:15:00','17:15:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(161,'EMP-OVQXWXLG','Marketing Specialist Tom','2026-01-25','08:09:00','17:09:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(162,'EMP-OVQXWXLG','Marketing Specialist Tom','2026-01-26','08:14:00','17:14:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(163,'EMP-OVQXWXLG','Marketing Specialist Tom','2026-01-27','08:15:00','17:15:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(164,'EMP-OVQXWXLG','Marketing Specialist Tom','2026-01-28','08:23:00','17:23:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(165,'EMP-OVQXWXLG','Marketing Specialist Tom','2026-01-29','08:03:00','17:03:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(166,'EMP-OVQXWXLG','Marketing Specialist Tom','2026-01-30','08:26:00','17:26:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(167,'EMP-OVQXWXLG','Marketing Specialist Tom','2026-01-31','08:14:00','17:14:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(168,'EMP-OVQXWXLG','Marketing Specialist Tom','2026-02-01','08:26:00','17:26:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(169,'EMP-OVQXWXLG','Marketing Specialist Tom','2026-02-02','08:29:00','17:29:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(170,'EMP-OVQXWXLG','Marketing Specialist Tom','2026-02-03','08:12:00','17:12:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(171,'EMP-OVQXWXLG','Marketing Specialist Tom','2026-02-04','08:25:00','17:25:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(172,'EMP-OVQXWXLG','Marketing Specialist Tom','2026-02-05','08:13:00','17:13:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(173,'EMP-OVQXWXLG','Marketing Specialist Tom','2026-02-06','08:08:00','17:08:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(174,'EMP-OVQXWXLG','Marketing Specialist Tom','2026-02-07','08:20:00','17:20:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(175,'EMP-OVQXWXLG','Marketing Specialist Tom','2026-02-08','08:04:00','17:04:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(176,'EMP-OVQXWXLG','Marketing Specialist Tom','2026-02-09','08:00:00','17:00:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(177,'EMP-OVQXWXLG','Marketing Specialist Tom','2026-02-10','08:10:00','17:10:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(178,'EMP-OVQXWXLG','Marketing Specialist Tom','2026-02-11','08:02:00','17:02:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(179,'EMP-OVQXWXLG','Marketing Specialist Tom','2026-02-12','08:24:00','17:24:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(180,'EMP-OVQXWXLG','Marketing Specialist Tom','2026-02-13','08:02:00','17:02:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(181,'EMP-DJ11KNVH','Operations Staff Sarah','2026-01-25','08:07:00','17:07:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(182,'EMP-DJ11KNVH','Operations Staff Sarah','2026-01-26','08:18:00','17:18:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(183,'EMP-DJ11KNVH','Operations Staff Sarah','2026-01-27','08:13:00','17:13:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(184,'EMP-DJ11KNVH','Operations Staff Sarah','2026-01-28','08:01:00','17:01:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(185,'EMP-DJ11KNVH','Operations Staff Sarah','2026-01-29','08:23:00','17:23:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(186,'EMP-DJ11KNVH','Operations Staff Sarah','2026-01-30','08:15:00','17:15:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(187,'EMP-DJ11KNVH','Operations Staff Sarah','2026-01-31','08:12:00','17:12:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(188,'EMP-DJ11KNVH','Operations Staff Sarah','2026-02-01','08:19:00','17:19:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(189,'EMP-DJ11KNVH','Operations Staff Sarah','2026-02-02','08:28:00','17:28:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(190,'EMP-DJ11KNVH','Operations Staff Sarah','2026-02-03','08:13:00','17:13:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(191,'EMP-DJ11KNVH','Operations Staff Sarah','2026-02-04','08:27:00','17:27:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(192,'EMP-DJ11KNVH','Operations Staff Sarah','2026-02-05','08:30:00','17:30:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(193,'EMP-DJ11KNVH','Operations Staff Sarah','2026-02-06','08:15:00','17:15:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(194,'EMP-DJ11KNVH','Operations Staff Sarah','2026-02-07','08:10:00','17:10:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(195,'EMP-DJ11KNVH','Operations Staff Sarah','2026-02-08','08:15:00','17:15:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(196,'EMP-DJ11KNVH','Operations Staff Sarah','2026-02-09','08:09:00','17:09:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(197,'EMP-DJ11KNVH','Operations Staff Sarah','2026-02-10','08:12:00','17:12:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(198,'EMP-DJ11KNVH','Operations Staff Sarah','2026-02-11','08:26:00','17:26:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(199,'EMP-DJ11KNVH','Operations Staff Sarah','2026-02-12','08:29:00','17:29:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59'),
(200,'EMP-DJ11KNVH','Operations Staff Sarah','2026-02-13','08:14:00','17:14:00','Present',9.00,NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59');
/*!40000 ALTER TABLE `attendances` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `banks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `name` varchar(255) NOT NULL COMMENT 'Bank name',
  `code` varchar(255) DEFAULT NULL COMMENT 'Bank code',
  `swift_code` varchar(255) DEFAULT NULL COMMENT 'SWIFT/BIC code',
  `contact_email` varchar(255) DEFAULT NULL COMMENT 'Contact email',
  `contact_phone` varchar(255) DEFAULT NULL COMMENT 'Contact phone',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Soft delete timestamp for recoverable deletion',
  PRIMARY KEY (`id`),
  UNIQUE KEY `banks_name_unique` (`name`),
  UNIQUE KEY `banks_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `banks` VALUES
(1,'CRDB Bank','CRDB','CORUTZTZ',NULL,NULL,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(2,'NMB Bank','NMB','NMBTZTXZ',NULL,NULL,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(3,'NBC Bank','NBC','NLCBTZTX',NULL,NULL,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(4,'Stanbic Bank','STANBIC','SBICTZTX',NULL,NULL,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(5,'Exim Bank','EXIM','EXIMTZTX',NULL,NULL,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL);
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `compliance_tasks`
--

DROP TABLE IF EXISTS `compliance_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `compliance_tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `task_id` varchar(255) NOT NULL COMMENT 'Unique task identifier (e.g., CTASK-123)',
  `type` varchar(255) NOT NULL COMMENT 'Task type: tax_filing, nssf_submission, nhif_submission, wcf_submission, sdl_submission',
  `description` varchar(255) DEFAULT NULL COMMENT 'Task description',
  `due_date` date NOT NULL COMMENT 'Due date for the task',
  `amount` decimal(15,2) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending' COMMENT 'Task status: Pending, Completed, Overdue',
  `submitted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Soft delete timestamp for recoverable deletion',
  PRIMARY KEY (`id`),
  UNIQUE KEY `compliance_tasks_task_id_unique` (`task_id`),
  KEY `compliance_tasks_employee_id_foreign` (`employee_id`),
  CONSTRAINT `compliance_tasks_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compliance_tasks`
--

LOCK TABLES `compliance_tasks` WRITE;
/*!40000 ALTER TABLE `compliance_tasks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `compliance_tasks` VALUES
(1,'CTASK001','nssf_submission','Monthly NSSF submission','2026-02-18',NULL,NULL,'EMP-EM6LKILQ','Pending',NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59',NULL),
(2,'CTASK002','tax_filing','Monthly PAYE tax filing','2026-02-20',NULL,NULL,'EMP-4BN9PMLV','Pending',NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59',NULL);
/*!40000 ALTER TABLE `compliance_tasks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `deductions`
--

DROP TABLE IF EXISTS `deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `deductions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category` enum('statutory','voluntary') NOT NULL,
  `type` enum('fixed','percentage') NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deductions`
--

LOCK TABLES `deductions` WRITE;
/*!40000 ALTER TABLE `deductions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `deductions` VALUES
(1,'NSSF','statutory','percentage',10.00,1,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(2,'NHIF','statutory','fixed',30000.00,1,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(3,'PAYE Tax','statutory','percentage',15.00,1,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(4,'Loan Repayment','voluntary','fixed',200000.00,1,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL);
/*!40000 ALTER TABLE `deductions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `name` varchar(255) NOT NULL COMMENT 'Department name',
  `description` text DEFAULT NULL COMMENT 'Department description',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Soft delete timestamp for recoverable deletion',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `departments` VALUES
(1,'Operations','Operations Department','2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(2,'HR','Human Resources Department','2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(3,'Finance','Finance Department','2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(4,'IT','Information Technology Department','2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(5,'Marketing','Marketing Department','2026-02-12 22:13:56','2026-02-12 22:13:56',NULL);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `employee_allowance`
--

DROP TABLE IF EXISTS `employee_allowance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_allowance` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(50) NOT NULL,
  `allowance_id` bigint(20) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_allowance_allowance_id_foreign` (`allowance_id`),
  KEY `employee_allowance_employee_id_foreign` (`employee_id`),
  CONSTRAINT `employee_allowance_allowance_id_foreign` FOREIGN KEY (`allowance_id`) REFERENCES `allowance` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_allowance_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_allowance`
--

LOCK TABLES `employee_allowance` WRITE;
/*!40000 ALTER TABLE `employee_allowance` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `employee_allowance` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `employee_deduction`
--

DROP TABLE IF EXISTS `employee_deduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_deduction` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(50) NOT NULL,
  `deduction_id` bigint(20) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_deduction_deduction_id_foreign` (`deduction_id`),
  KEY `employee_deduction_employee_id_foreign` (`employee_id`),
  CONSTRAINT `employee_deduction_deduction_id_foreign` FOREIGN KEY (`deduction_id`) REFERENCES `deductions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_deduction_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_deduction`
--

LOCK TABLES `employee_deduction` WRITE;
/*!40000 ALTER TABLE `employee_deduction` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `employee_deduction` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `department` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `base_salary` decimal(15,2) NOT NULL,
  `allowances` decimal(15,2) DEFAULT NULL,
  `deductions` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `gender` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `hire_date` date NOT NULL,
  `contract_end_date` date DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL COMMENT 'Name of the bank from banks table',
  `account_number` varchar(255) DEFAULT NULL,
  `employment_type` varchar(255) NOT NULL DEFAULT 'Full-Time',
  `nssf_number` varchar(255) DEFAULT NULL,
  `nhif_number` varchar(255) DEFAULT NULL,
  `tin_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `last_logout_at` timestamp NULL DEFAULT NULL,
  `auto_logout` tinyint(1) NOT NULL DEFAULT 0,
  `password_changed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_employee_id_unique` (`employee_id`),
  UNIQUE KEY `employees_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `employees` VALUES
(1,'EMP-DLAYPROL','Admin User','admin@payroll.com','$2y$12$qflkhUVY/g7YLq5YGjs1TOvuWjb2vunifFRF82YwgGdeHbU97jZTy',NULL,NULL,'Operations','admin','System Administrator',9000000.00,350000.00,650000.00,'active','male','1985-05-15','Tanzanian','+255712345678','Dar es Salaam','2024-01-15',NULL,'CRDB Bank','1234567890','full-time','NSSF001','NHIF001','TIN001','2026-02-12 22:13:56','2026-02-13 10:32:11',NULL,'2026-02-13 10:32:11','127.0.0.1','2026-02-13 09:48:47',0,NULL),
(2,'EMP-EM6LKILQ','HR Manager Jane','hr@payroll.com','$2y$12$OqNyWmcHQ71VHuy5daDlOOMgRzAI5iVWYWkIm/1tZHAw5Lx0zu6wC',NULL,NULL,'HR','hr','HR Manager',7500000.00,350000.00,650000.00,'active','female','1990-08-20','Tanzanian','+255712345679','Dar es Salaam','2024-02-01',NULL,'NMB Bank','1234567891','full-time','NSSF002','NHIF002','TIN002','2026-02-12 22:13:57','2026-02-13 09:49:41',NULL,'2026-02-13 09:49:41','127.0.0.1',NULL,0,NULL),
(3,'EMP-P7Q2V6PK','Operations Manager John','ops@payroll.com','$2y$12$9IEOBOnx0rZEy.n7zvHeRucPaZuOf7ZYi8iaiO1hNUsKTtIh1e8d.',NULL,NULL,'Operations','manager','Operations Manager',8000000.00,350000.00,650000.00,'active','male','1988-03-10','Tanzanian','+255712345680','Dar es Salaam','2024-02-15',NULL,'NBC Bank','1234567892','full-time','NSSF003','NHIF003','TIN003','2026-02-12 22:13:57','2026-02-12 22:13:57',NULL,NULL,NULL,NULL,0,NULL),
(4,'EMP-CDXNNO6I','IT Manager David','it@payroll.com','$2y$12$6vQlUBlb9QeMXkbtmOW9xeF88Y4NmGzFnKl89WHrucbAfT8/HcNma',NULL,NULL,'IT','manager','IT Manager',8500000.00,350000.00,650000.00,'active','male','1987-11-25','Tanzanian','+255712345681','Dar es Salaam','2024-03-01',NULL,'Stanbic Bank','1234567893','full-time','NSSF004','NHIF004','TIN004','2026-02-12 22:13:57','2026-02-12 22:13:57',NULL,NULL,NULL,NULL,0,NULL),
(5,'EMP-4BN9PMLV','Finance Manager Mary','finance@payroll.com','$2y$12$KuX3c5s3MQAGQM4FXfieremX3Gw6XFXUgH4ZCx1UpOXCbrUbB8H7.',NULL,NULL,'Finance','manager','Finance Manager',8200000.00,350000.00,650000.00,'active','female','1989-07-12','Tanzanian','+255712345682','Dar es Salaam','2024-03-15',NULL,'Exim Bank','1234567894','full-time','NSSF005','NHIF005','TIN005','2026-02-12 22:13:57','2026-02-12 22:13:57',NULL,NULL,NULL,NULL,0,NULL),
(6,'EMP-BYFNS1ZE','Senior Developer Alice','alice@payroll.com','$2y$12$qcjskCDqRsSkX/d6vRGgFumtAGPeobuMpB8pnSJ1PzfbGKluV0KMW',NULL,NULL,'IT','employee','Senior Software Developer',6000000.00,350000.00,650000.00,'active','female','1992-04-18','Tanzanian','+255712345683','Dar es Salaam','2024-04-01',NULL,'CRDB Bank','1234567895','full-time','NSSF006','NHIF006','TIN006','2026-02-12 22:13:58','2026-02-12 22:13:58',NULL,NULL,NULL,NULL,0,NULL),
(7,'EMP-9HXEAIOJ','Accountant Bob','bob@payroll.com','$2y$12$VDAKk2ACHB2YZ3gHpGA49OK1kQIOy1Z4xTWNARzPRmhSTGgOSyyBO',NULL,NULL,'Finance','employee','Senior Accountant',5500000.00,350000.00,650000.00,'active','male','1991-09-30','Tanzanian','+255712345684','Dar es Salaam','2024-04-15',NULL,'NMB Bank','1234567896','full-time','NSSF007','NHIF007','TIN007','2026-02-12 22:13:58','2026-02-12 22:13:58',NULL,NULL,NULL,NULL,0,NULL),
(8,'EMP-V4BHORFP','HR Assistant Clara','clara@payroll.com','$2y$12$wLtDlCHB73BdddB6y2yANOwpXXrQW2jwSp/2DFRJmfXGibDXT2gfW',NULL,NULL,'HR','employee','HR Assistant',4500000.00,350000.00,650000.00,'active','female','1993-12-05','Tanzanian','+255712345685','Dar es Salaam','2024-05-01',NULL,'NBC Bank','1234567897','full-time','NSSF008','NHIF008','TIN008','2026-02-12 22:13:58','2026-02-12 22:13:58',NULL,NULL,NULL,NULL,0,NULL),
(9,'EMP-OVQXWXLG','Marketing Specialist Tom','tom@payroll.com','$2y$12$gFDddpDBGE3nnGVu7FawoOhHecy71aq7ol9Vd0cAaNLK7k/FkVSNW',NULL,NULL,'Marketing','employee','Marketing Specialist',5000000.00,350000.00,650000.00,'active','male','1994-06-22','Tanzanian','+255712345686','Dar es Salaam','2024-05-15',NULL,'Stanbic Bank','1234567898','full-time','NSSF009','NHIF009','TIN009','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL,NULL,NULL,NULL,0,NULL),
(10,'EMP-DJ11KNVH','Operations Staff Sarah','sarah@payroll.com','$2y$12$M7Mbxtw2jb265m91trqLTuBz/n0zz5KIc9/A6VedAKH9SwMEP.NZ2',NULL,NULL,'Operations','employee','Operations Staff',4000000.00,350000.00,650000.00,'active','female','1995-01-14','Tanzanian','+255712345687','Dar es Salaam','2024-06-01',NULL,'Exim Bank','1234567899','full-time','NSSF010','NHIF010','TIN010','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL,NULL,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `leave_requests`
--

DROP TABLE IF EXISTS `leave_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `request_id` varchar(255) NOT NULL COMMENT 'Unique request identifier (e.g., LRQ-123)',
  `employee_id` varchar(50) NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `leave_type` varchar(255) NOT NULL COMMENT 'Leave type: Annual, Sick, Maternity, Unpaid',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `days` int(11) NOT NULL COMMENT 'Number of leave days',
  `reason` text DEFAULT NULL COMMENT 'Reason for leave',
  `status` varchar(255) NOT NULL DEFAULT 'Pending' COMMENT 'Status: Pending, Approved, Rejected',
  `approved_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Soft delete timestamp for recoverable deletion',
  PRIMARY KEY (`id`),
  UNIQUE KEY `leave_requests_request_id_unique` (`request_id`),
  KEY `leave_requests_employee_id_foreign` (`employee_id`),
  KEY `leave_requests_approved_by_foreign` (`approved_by`),
  CONSTRAINT `leave_requests_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE,
  CONSTRAINT `leave_requests_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_requests`
--

LOCK TABLES `leave_requests` WRITE;
/*!40000 ALTER TABLE `leave_requests` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `leave_requests` VALUES
(1,'LRQ001','EMP-BYFNS1ZE','Senior Developer Alice','Annual','2026-02-23','2026-03-02',7,'Annual vacation leave','Pending',NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59',NULL),
(2,'LRQ002','EMP-9HXEAIOJ','Accountant Bob','Sick','2026-02-11','2026-02-16',5,'Medical treatment','Approved','EMP-EM6LKILQ','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL);
/*!40000 ALTER TABLE `leave_requests` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES
(1,'2025_09_22_000001_create_roles_table',1),
(2,'2025_09_22_000002_create_departments_table',1),
(3,'2025_09_22_000003_create_banks_table',1),
(4,'2025_09_22_000004_create_employees_table',1),
(5,'2025_09_22_000005_create_attendances_table',1),
(6,'2025_09_22_000006_create_compliance_tasks_table',1),
(7,'2025_09_22_000007_create_leave_requests_table',1),
(8,'2025_09_22_000008_create_payrolls_table',1),
(9,'2025_09_22_000009_create_payroll_alerts_table',1),
(10,'2025_09_22_000010_create_payslips_table',1),
(11,'2025_09_22_000011_create_reports_table',1),
(12,'2025_09_22_000012_create_sessions_table',1),
(13,'2025_09_22_000013_create_transactions_table',1),
(14,'2025_09_22_000014_create_password_reset_tokens_table',1),
(15,'2025_09_23_110609_add_total_amount_to_payrolls_table',1),
(16,'2025_09_24_051552_create_settings_table',1),
(17,'2025_09_24_081524_create_allowances_table',1),
(18,'2025_09_24_081556_create_deductions_table',1),
(19,'2025_09_24_201050_update_employees_status_default',1),
(20,'2025_09_28_214452_rename_allowances_table',1),
(21,'2025_09_28_215037_create_employee_allowance_table',1),
(22,'2025_09_28_220258_create_employee_deduction_table',1),
(23,'2025_09_29_110736_add_session_fields_to_employees_table',1),
(24,'2025_10_01_093332_add_metadata_to_payroll_alerts_table',1),
(25,'2025_10_01_094902_create_retroactive_adjustments_table',1),
(26,'2025_10_01_095748_add_employer_contributions_to_payrolls_table',1),
(27,'2025_10_01_142740_add_amount_to_employee_allowance_table',1),
(28,'2025_10_01_143352_add_amount_to_pivot_tables',1),
(29,'2025_10_01_145219_fix_employee_allowance_employee_id_column',1),
(30,'2025_10_01_145625_fix_pivot_tables_for_string_employee_id',1),
(31,'2025_10_01_145952_modify_sessions_table_for_string_user_id',1),
(32,'2025_10_01_151529_modify_all_tables_for_string_employee_id',1),
(33,'2025_10_01_151811_modify_approved_by_column_in_leave_requests',1),
(34,'2025_10_04_114109_add_missing_columns_to_compliance_tasks_table',1),
(35,'2025_10_04_193923_modify_compliance_tasks_employee_id_nullable',1),
(36,'2026_02_13_002516_create_cache_table',1),
(37,'2026_02_21_001523_create_jobs_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `payroll_alerts`
--

DROP TABLE IF EXISTS `payroll_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll_alerts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `alert_id` varchar(255) NOT NULL COMMENT 'Unique alert identifier (e.g., ALT-123)',
  `employee_id` varchar(50) NOT NULL,
  `type` varchar(255) NOT NULL COMMENT 'Alert type: payroll_processed, payment_due, compliance_due, low_balance',
  `message` text NOT NULL COMMENT 'Alert message',
  `status` varchar(255) NOT NULL DEFAULT 'Unread' COMMENT 'Alert status: Unread, Read',
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Additional alert data in JSON format' CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Soft delete timestamp for recoverable deletion',
  PRIMARY KEY (`id`),
  UNIQUE KEY `payroll_alerts_alert_id_unique` (`alert_id`),
  KEY `payroll_alerts_type_status_index` (`type`,`status`),
  KEY `payroll_alerts_employee_id_status_index` (`employee_id`,`status`),
  CONSTRAINT `payroll_alerts_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_alerts`
--

LOCK TABLES `payroll_alerts` WRITE;
/*!40000 ALTER TABLE `payroll_alerts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `payroll_alerts` VALUES
(1,'ALT001','EMP-DLAYPROL','payroll_processed','Payroll for February 2026 has been processed successfully','Unread',NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59',NULL),
(2,'ALT002','EMP-EM6LKILQ','compliance_due','NSSF submission is due in 5 days','Unread',NULL,'2026-02-12 22:13:59','2026-02-12 22:13:59',NULL);
/*!40000 ALTER TABLE `payroll_alerts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `payrolls`
--

DROP TABLE IF EXISTS `payrolls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `payrolls` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `payroll_id` varchar(255) NOT NULL COMMENT 'Unique payroll identifier (e.g., PAY-123)',
  `employee_id` varchar(50) NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `period` varchar(255) NOT NULL COMMENT 'Payroll period (Y-m) - e.g., 2025-09',
  `base_salary` decimal(15,2) NOT NULL COMMENT 'Base salary for the period',
  `allowances` decimal(15,2) DEFAULT NULL COMMENT 'Total allowances',
  `total_amount` decimal(15,2) NOT NULL,
  `deductions` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Total deductions',
  `net_salary` decimal(15,2) NOT NULL COMMENT 'Net salary after deductions',
  `employer_contributions` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Total employer contributions (NSSF, NHIF, WCF, SDL)',
  `status` varchar(255) NOT NULL DEFAULT 'Pending' COMMENT 'Payroll status: Pending, Processed, Paid',
  `payment_date` date DEFAULT NULL COMMENT 'Date of payment',
  `payment_method` varchar(255) DEFAULT NULL COMMENT 'Payment method: Bank Transfer, Cheque',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Soft delete timestamp for recoverable deletion',
  PRIMARY KEY (`id`),
  UNIQUE KEY `payrolls_payroll_id_unique` (`payroll_id`),
  KEY `payrolls_created_by_foreign` (`created_by`),
  KEY `payrolls_employee_id_foreign` (`employee_id`),
  CONSTRAINT `payrolls_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `payrolls_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payrolls`
--

LOCK TABLES `payrolls` WRITE;
/*!40000 ALTER TABLE `payrolls` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `payrolls` VALUES
(1,'PAY2026-02AYPROL','EMP-DLAYPROL','Admin User','2026-02',9000000.00,350000.00,9350000.00,650000.00,8700000.00,0.00,'Processed','2026-02-13','Bank Transfer','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL,NULL),
(2,'PAY2026-026LKILQ','EMP-EM6LKILQ','HR Manager Jane','2026-02',7500000.00,350000.00,7850000.00,650000.00,7200000.00,0.00,'Processed','2026-02-13','Bank Transfer','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL,NULL),
(3,'PAY2026-02Q2V6PK','EMP-P7Q2V6PK','Operations Manager John','2026-02',8000000.00,350000.00,8350000.00,650000.00,7700000.00,0.00,'Processed','2026-02-13','Bank Transfer','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL,NULL),
(4,'PAY2026-02XNNO6I','EMP-CDXNNO6I','IT Manager David','2026-02',8500000.00,350000.00,8850000.00,650000.00,8200000.00,0.00,'Processed','2026-02-13','Bank Transfer','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL,NULL),
(5,'PAY2026-02N9PMLV','EMP-4BN9PMLV','Finance Manager Mary','2026-02',8200000.00,350000.00,8550000.00,650000.00,7900000.00,0.00,'Processed','2026-02-13','Bank Transfer','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL,NULL),
(6,'PAY2026-02FNS1ZE','EMP-BYFNS1ZE','Senior Developer Alice','2026-02',6000000.00,350000.00,6350000.00,650000.00,5700000.00,0.00,'Processed','2026-02-13','Bank Transfer','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL,NULL),
(7,'PAY2026-02XEAIOJ','EMP-9HXEAIOJ','Accountant Bob','2026-02',5500000.00,350000.00,5850000.00,650000.00,5200000.00,0.00,'Processed','2026-02-13','Bank Transfer','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL,NULL),
(8,'PAY2026-02BHORFP','EMP-V4BHORFP','HR Assistant Clara','2026-02',4500000.00,350000.00,4850000.00,650000.00,4200000.00,0.00,'Processed','2026-02-13','Bank Transfer','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL,NULL),
(9,'PAY2026-02QXWXLG','EMP-OVQXWXLG','Marketing Specialist Tom','2026-02',5000000.00,350000.00,5350000.00,650000.00,4700000.00,0.00,'Processed','2026-02-13','Bank Transfer','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL,NULL),
(10,'PAY2026-0211KNVH','EMP-DJ11KNVH','Operations Staff Sarah','2026-02',4000000.00,350000.00,4350000.00,650000.00,3700000.00,0.00,'Processed','2026-02-13','Bank Transfer','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL,NULL);
/*!40000 ALTER TABLE `payrolls` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `payslips`
--

DROP TABLE IF EXISTS `payslips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `payslips` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `payslip_id` varchar(255) NOT NULL COMMENT 'Unique payslip identifier (e.g., PSLIP-123)',
  `employee_id` varchar(50) NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `period` varchar(255) NOT NULL COMMENT 'Payslip period (Y-m)',
  `base_salary` decimal(15,2) NOT NULL COMMENT 'Base salary for the period',
  `allowances` decimal(15,2) DEFAULT NULL COMMENT 'Total allowances',
  `deductions` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT 'Total deductions',
  `net_salary` decimal(15,2) NOT NULL COMMENT 'Net salary after deductions',
  `status` varchar(255) NOT NULL DEFAULT 'Generated' COMMENT 'Payslip status: Generated, Sent, Viewed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Soft delete timestamp for recoverable deletion',
  PRIMARY KEY (`id`),
  UNIQUE KEY `payslips_payslip_id_unique` (`payslip_id`),
  KEY `payslips_employee_id_foreign` (`employee_id`),
  CONSTRAINT `payslips_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payslips`
--

LOCK TABLES `payslips` WRITE;
/*!40000 ALTER TABLE `payslips` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `payslips` VALUES
(1,'PSLIP2026-02AYPROL','EMP-DLAYPROL','Admin User','2026-02',9000000.00,350000.00,650000.00,8700000.00,'Generated','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL),
(2,'PSLIP2026-026LKILQ','EMP-EM6LKILQ','HR Manager Jane','2026-02',7500000.00,350000.00,650000.00,7200000.00,'Generated','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL),
(3,'PSLIP2026-02Q2V6PK','EMP-P7Q2V6PK','Operations Manager John','2026-02',8000000.00,350000.00,650000.00,7700000.00,'Generated','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL),
(4,'PSLIP2026-02XNNO6I','EMP-CDXNNO6I','IT Manager David','2026-02',8500000.00,350000.00,650000.00,8200000.00,'Generated','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL),
(5,'PSLIP2026-02N9PMLV','EMP-4BN9PMLV','Finance Manager Mary','2026-02',8200000.00,350000.00,650000.00,7900000.00,'Generated','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL),
(6,'PSLIP2026-02FNS1ZE','EMP-BYFNS1ZE','Senior Developer Alice','2026-02',6000000.00,350000.00,650000.00,5700000.00,'Generated','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL),
(7,'PSLIP2026-02XEAIOJ','EMP-9HXEAIOJ','Accountant Bob','2026-02',5500000.00,350000.00,650000.00,5200000.00,'Generated','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL),
(8,'PSLIP2026-02BHORFP','EMP-V4BHORFP','HR Assistant Clara','2026-02',4500000.00,350000.00,650000.00,4200000.00,'Generated','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL),
(9,'PSLIP2026-02QXWXLG','EMP-OVQXWXLG','Marketing Specialist Tom','2026-02',5000000.00,350000.00,650000.00,4700000.00,'Generated','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL),
(10,'PSLIP2026-0211KNVH','EMP-DJ11KNVH','Operations Staff Sarah','2026-02',4000000.00,350000.00,650000.00,3700000.00,'Generated','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL);
/*!40000 ALTER TABLE `payslips` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `report_id` varchar(255) NOT NULL COMMENT 'Unique identifier for the report (e.g., RPT-123)',
  `type` varchar(255) NOT NULL COMMENT 'Report type: payslip, payroll_summary, tax_report, nssf_report, nhif_report, wcf_report, sdl_report, year_end_summary',
  `period` varchar(255) NOT NULL COMMENT 'Report period (Y-m for monthly, Y for yearly)',
  `employee_id` varchar(50) NOT NULL,
  `batch_number` int(11) DEFAULT NULL,
  `export_format` varchar(255) NOT NULL COMMENT 'Export format: pdf, excel',
  `generated_by` varchar(50) DEFAULT NULL,
  `status` enum('pending','completed','failed') NOT NULL DEFAULT 'pending' COMMENT 'Report generation status',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Soft delete timestamp for recoverable deletion',
  PRIMARY KEY (`id`),
  UNIQUE KEY `reports_report_id_unique` (`report_id`),
  KEY `reports_generated_by_index` (`generated_by`),
  KEY `reports_type_index` (`type`),
  KEY `reports_period_index` (`period`),
  KEY `reports_employee_id_foreign` (`employee_id`),
  CONSTRAINT `reports_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE,
  CONSTRAINT `reports_generated_by_foreign` FOREIGN KEY (`generated_by`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `reports` VALUES
(1,'RPT001','payroll_summary','2026-02','EMP-BYFNS1ZE',1,'pdf','EMP-DLAYPROL','completed','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL),
(2,'RPT002','tax_report','2026-02','EMP-9HXEAIOJ',2,'excel','EMP-4BN9PMLV','pending','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL);
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `retroactive_adjustments`
--

DROP TABLE IF EXISTS `retroactive_adjustments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `retroactive_adjustments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `adjustment_id` varchar(255) NOT NULL,
  `employee_id` bigint(20) unsigned NOT NULL,
  `period` varchar(7) NOT NULL,
  `type` enum('allowance','deduction','salary_adjustment') NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `reason` text DEFAULT NULL,
  `status` enum('pending','applied','reverted') NOT NULL DEFAULT 'pending',
  `applied_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `retroactive_adjustments_adjustment_id_unique` (`adjustment_id`),
  KEY `retroactive_adjustments_created_by_foreign` (`created_by`),
  KEY `retroactive_adjustments_employee_id_period_index` (`employee_id`,`period`),
  KEY `retroactive_adjustments_status_period_index` (`status`,`period`),
  KEY `retroactive_adjustments_type_index` (`type`),
  CONSTRAINT `retroactive_adjustments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `retroactive_adjustments_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retroactive_adjustments`
--

LOCK TABLES `retroactive_adjustments` WRITE;
/*!40000 ALTER TABLE `retroactive_adjustments` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `retroactive_adjustments` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `name` varchar(255) NOT NULL COMMENT 'Role name (e.g., Admin, HR Manager)',
  `slug` varchar(255) NOT NULL COMMENT 'Unique role identifier',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `roles` VALUES
(1,'admin','admin','2026-02-12 22:13:56','2026-02-12 22:13:56'),
(2,'hr manager','hr','2026-02-12 22:13:56','2026-02-12 22:13:56'),
(3,'employee','employee','2026-02-12 22:13:56','2026-02-12 22:13:56'),
(4,'manager','manager','2026-02-12 22:13:56','2026-02-12 22:13:56');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`),
  CONSTRAINT `sessions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sessions` VALUES
('p3k80d3xAbphH0a78bIvAMUGdFZt2jfZb0x5eHVS','EMP-DLAYPROL','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64; rv:140.0) Gecko/20100101 Firefox/140.0','YTo3OntzOjY6Il90b2tlbiI7czo0MDoiV1VzWHk2UG5nZ1dQQ3dkRDdyakk1MnBWVGhrZFk0YU56V2ZRY3R0WiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQ1OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vZW1wbG95ZWVzP3RhYj1hZGQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7czoxMjoiRU1QLURMQVlQUk9MIjtzOjExOiJyZW1lbWJlcl9tZSI7YjowO3M6MTM6Imxhc3RfYWN0aXZpdHkiO2k6MTc3MDk4OTY1NTt9',1770989655),
('WyRhUcpcbpgFviZd2Zyepx3LrxVJCATXimD1Y57h',NULL,'127.0.0.1','Symfony','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV25WU2xJTm1HSWczVHViMVRCek56SDVFODl5b0dEelA2TkpSOU5VbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY6Imh0dHA6Ly9sb2NhbGhvc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1771632492);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `key` varchar(255) NOT NULL COMMENT 'Setting key identifier',
  `value` text DEFAULT NULL COMMENT 'Setting value (can be JSON)',
  `type` varchar(255) NOT NULL DEFAULT 'string' COMMENT 'Value type: string, integer, boolean, array, json',
  `category` varchar(255) NOT NULL DEFAULT 'general' COMMENT 'Setting category: payroll, notifications, integrations, allowances, deductions',
  `description` text DEFAULT NULL COMMENT 'Setting description',
  `is_public` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Whether setting is publicly accessible',
  `updated_by` bigint(20) unsigned DEFAULT NULL COMMENT 'Employee who last updated this setting',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Soft delete timestamp for recoverable deletion',
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`),
  KEY `settings_updated_by_foreign` (`updated_by`),
  KEY `settings_key_index` (`key`),
  KEY `settings_category_index` (`category`),
  CONSTRAINT `settings_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `employees` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `settings` VALUES
(1,'pay_schedule','monthly','string','payroll','Payroll processing schedule',0,NULL,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(2,'processing_day','25','integer','payroll','Day of month for payroll processing',0,NULL,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(3,'default_currency','TZS','string','payroll','Default currency for payroll',1,NULL,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(4,'overtime_calculation','1.5x','string','payroll','Overtime rate calculation method',0,NULL,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(5,'nssf_employer_rate','10.0','decimal','payroll','NSSF employer contribution rate (%)',1,NULL,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(6,'nssf_employee_rate','10.0','decimal','payroll','NSSF employee contribution rate (%)',1,NULL,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(7,'nhif_calculation_method','tiered','string','payroll','NHIF contribution calculation method',0,NULL,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(8,'paye_tax_free','270000','integer','payroll','PAYE tax-free threshold (TZS)',1,NULL,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(9,'wcf_rate','0.5','decimal','payroll','Workers Compensation Fund rate (%)',0,NULL,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(10,'sdl_rate','3.5','decimal','payroll','Skills Development Levy rate (%)',0,NULL,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(11,'email_notifications','[\"payroll_processing\",\"payment_confirmation\"]','array','notifications','Enabled email notification types',0,NULL,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(12,'sms_enabled','false','boolean','notifications','Enable SMS notifications',0,NULL,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(13,'sms_gateway','twilio','string','notifications','SMS gateway provider',0,NULL,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(14,'accounting_software','','string','integrations','Integrated accounting software',0,NULL,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(15,'attendance_sync','false','boolean','integrations','Enable attendance data sync',0,NULL,'2026-02-12 22:13:56','2026-02-12 22:13:56',NULL),
(16,'company_name','Jayfour Digital Solution','string','general',NULL,0,NULL,NULL,'2026-02-12 22:41:32',NULL),
(17,'company_email','jemsifredrick4@gmail.com','string','general',NULL,0,NULL,NULL,'2026-02-12 22:41:32',NULL),
(18,'company_phone','+255683186987','string','general',NULL,0,NULL,NULL,'2026-02-12 22:41:32',NULL),
(19,'company_address','Dar es Salaam, Tanzania','string','general',NULL,0,NULL,NULL,'2026-02-12 22:41:32',NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `transaction_id` varchar(255) NOT NULL COMMENT 'Unique transaction identifier (e.g., TXN-123)',
  `employee_id` varchar(50) NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL COMMENT 'Transaction type: salary_payment, bonus, deduction, reimbursement',
  `amount` decimal(15,2) NOT NULL COMMENT 'Transaction amount',
  `transaction_date` date NOT NULL COMMENT 'Date of transaction',
  `status` varchar(255) NOT NULL DEFAULT 'Pending' COMMENT 'Transaction status: Pending, Completed, Failed',
  `payment_method` varchar(255) DEFAULT NULL COMMENT 'Payment method: Bank Transfer, Cheque',
  `description` text DEFAULT NULL COMMENT 'Transaction description',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Soft delete timestamp for recoverable deletion',
  PRIMARY KEY (`id`),
  UNIQUE KEY `transactions_transaction_id_unique` (`transaction_id`),
  KEY `transactions_employee_id_foreign` (`employee_id`),
  CONSTRAINT `transactions_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `transactions` VALUES
(1,'TXN20260213AYPROL','EMP-DLAYPROL','Admin User','salary_payment',8700000.00,'2026-02-13','Completed','Bank Transfer','Salary payment for February 2026','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL),
(2,'TXN202602136LKILQ','EMP-EM6LKILQ','HR Manager Jane','salary_payment',7200000.00,'2026-02-13','Completed','Bank Transfer','Salary payment for February 2026','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL),
(3,'TXN20260213Q2V6PK','EMP-P7Q2V6PK','Operations Manager John','salary_payment',7700000.00,'2026-02-13','Completed','Bank Transfer','Salary payment for February 2026','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL),
(4,'TXN20260213XNNO6I','EMP-CDXNNO6I','IT Manager David','salary_payment',8200000.00,'2026-02-13','Completed','Bank Transfer','Salary payment for February 2026','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL),
(5,'TXN20260213N9PMLV','EMP-4BN9PMLV','Finance Manager Mary','salary_payment',7900000.00,'2026-02-13','Completed','Bank Transfer','Salary payment for February 2026','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL),
(6,'TXN20260213FNS1ZE','EMP-BYFNS1ZE','Senior Developer Alice','salary_payment',5700000.00,'2026-02-13','Completed','Bank Transfer','Salary payment for February 2026','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL),
(7,'TXN20260213XEAIOJ','EMP-9HXEAIOJ','Accountant Bob','salary_payment',5200000.00,'2026-02-13','Completed','Bank Transfer','Salary payment for February 2026','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL),
(8,'TXN20260213BHORFP','EMP-V4BHORFP','HR Assistant Clara','salary_payment',4200000.00,'2026-02-13','Completed','Bank Transfer','Salary payment for February 2026','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL),
(9,'TXN20260213QXWXLG','EMP-OVQXWXLG','Marketing Specialist Tom','salary_payment',4700000.00,'2026-02-13','Completed','Bank Transfer','Salary payment for February 2026','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL),
(10,'TXN2026021311KNVH','EMP-DJ11KNVH','Operations Staff Sarah','salary_payment',3700000.00,'2026-02-13','Completed','Bank Transfer','Salary payment for February 2026','2026-02-12 22:13:59','2026-02-12 22:13:59',NULL);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-02-21  4:08:52
