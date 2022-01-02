-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	8.0.27


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema kanver
--

CREATE DATABASE IF NOT EXISTS kanver;
USE kanver;

--
-- Definition of table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `idannouncement` int NOT NULL,
  `fk_user` int DEFAULT NULL,
  `fk_blood_type` int DEFAULT NULL,
  `fk_city` int DEFAULT NULL,
  `fk_announcement_type` int DEFAULT NULL,
  `announcement_date` datetime DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `fk_urgency` int DEFAULT NULL,
  PRIMARY KEY (`idannouncement`),
  KEY `FK_announcement_user` (`fk_user`),
  KEY `FK_announcement_bloodType` (`fk_blood_type`),
  KEY `FK_announcement_city` (`fk_city`),
  KEY `FK_announcement_announcementType` (`fk_announcement_type`),
  KEY `FK_announcement_urgency` (`fk_urgency`),
  CONSTRAINT `FK_announcement_announcementType` FOREIGN KEY (`fk_announcement_type`) REFERENCES `announcement_type` (`idannouncement_type`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_announcement_bloodType` FOREIGN KEY (`fk_blood_type`) REFERENCES `blood_type` (`idblood_type`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_announcement_city` FOREIGN KEY (`fk_city`) REFERENCES `cities` (`idcity`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_announcement_urgency` FOREIGN KEY (`fk_urgency`) REFERENCES `urgency` (`idurgency`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_announcement_user` FOREIGN KEY (`fk_user`) REFERENCES `user` (`iduser`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `announcement`
--

/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;


--
-- Definition of table `announcement_type`
--

DROP TABLE IF EXISTS `announcement_type`;
CREATE TABLE `announcement_type` (
  `idannouncement_type` int NOT NULL,
  `type_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idannouncement_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `announcement_type`
--

/*!40000 ALTER TABLE `announcement_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_type` ENABLE KEYS */;


--
-- Definition of table `blood_type`
--

DROP TABLE IF EXISTS `blood_type`;
CREATE TABLE `blood_type` (
  `idblood_type` int NOT NULL,
  `blood_type_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idblood_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `blood_type`
--

/*!40000 ALTER TABLE `blood_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `blood_type` ENABLE KEYS */;


--
-- Definition of table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `idcity` int NOT NULL,
  `city_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cities`
--

/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;


--
-- Definition of table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
CREATE TABLE `complaints` (
  `idcomplaints` int unsigned NOT NULL AUTO_INCREMENT,
  `complaint_content` varchar(45) NOT NULL,
  PRIMARY KEY (`idcomplaints`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `complaints`
--

/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;


--
-- Definition of table `donation_points`
--

DROP TABLE IF EXISTS `donation_points`;
CREATE TABLE `donation_points` (
  `iddonation_points` int NOT NULL,
  `fk_city` int DEFAULT NULL,
  `adress` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddonation_points`),
  KEY `FK_donation_points_city` (`fk_city`),
  CONSTRAINT `FK_donation_points_city` FOREIGN KEY (`fk_city`) REFERENCES `cities` (`idcity`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `donation_points`
--

/*!40000 ALTER TABLE `donation_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `donation_points` ENABLE KEYS */;


--
-- Definition of table `donor`
--

DROP TABLE IF EXISTS `donor`;
CREATE TABLE `donor` (
  `iddonor` int NOT NULL,
  `fk_user` int DEFAULT NULL,
  `fk_city` int DEFAULT NULL,
  `last_donation_date` datetime DEFAULT NULL,
  `disease_status` tinyint DEFAULT NULL,
  `drug_status` tinyint DEFAULT NULL,
  `alchol_status` tinyint DEFAULT NULL,
  `medicarton_status` tinyint DEFAULT NULL,
  PRIMARY KEY (`iddonor`),
  KEY `FK_donor_user` (`fk_user`),
  KEY `FK_donor_city` (`fk_city`),
  CONSTRAINT `FK_donor_city` FOREIGN KEY (`fk_city`) REFERENCES `cities` (`idcity`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_donor_user` FOREIGN KEY (`fk_user`) REFERENCES `user` (`iduser`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `donor`
--

/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;


--
-- Definition of table `urgency`
--

DROP TABLE IF EXISTS `urgency`;
CREATE TABLE `urgency` (
  `idurgency` int NOT NULL,
  `urgency_degree` int DEFAULT NULL,
  PRIMARY KEY (`idurgency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='				';

--
-- Dumping data for table `urgency`
--

/*!40000 ALTER TABLE `urgency` DISABLE KEYS */;
/*!40000 ALTER TABLE `urgency` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `iduser` int NOT NULL,
  `fk_blood_type` int NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `surname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phone_number` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_validate` tinyint NOT NULL,
  `is_mernis_ok` tinyint NOT NULL,
  `identity_number` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  `birthday` datetime NOT NULL,
  PRIMARY KEY (`iduser`),
  KEY `1_idx` (`fk_blood_type`),
  CONSTRAINT `FK_user_bloodType` FOREIGN KEY (`fk_blood_type`) REFERENCES `blood_type` (`idblood_type`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
