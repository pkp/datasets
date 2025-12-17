-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: omp-ci
-- ------------------------------------------------------
-- Server version	8.0.44-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `access_keys`
--

DROP TABLE IF EXISTS `access_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_keys` (
  `access_key_id` bigint NOT NULL AUTO_INCREMENT,
  `context` varchar(40) NOT NULL,
  `key_hash` varchar(40) NOT NULL,
  `user_id` bigint NOT NULL,
  `assoc_id` bigint DEFAULT NULL,
  `expiry_date` datetime NOT NULL,
  PRIMARY KEY (`access_key_id`),
  KEY `access_keys_user_id` (`user_id`),
  KEY `access_keys_hash` (`key_hash`,`user_id`,`context`),
  CONSTRAINT `access_keys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Access keys are used to provide pseudo-login functionality for security-minimal tasks. Passkeys can be emailed directly to users, who can use them for a limited time in lieu of standard username and password.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_keys`
--

LOCK TABLES `access_keys` WRITE;
/*!40000 ALTER TABLE `access_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_settings`
--

DROP TABLE IF EXISTS `announcement_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_settings` (
  `announcement_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `announcement_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`announcement_setting_id`),
  UNIQUE KEY `announcement_settings_unique` (`announcement_id`,`locale`,`setting_name`),
  KEY `announcement_settings_announcement_id` (`announcement_id`),
  CONSTRAINT `announcement_settings_announcement_id_foreign` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`announcement_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about announcements, including localized properties like names and contents.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_settings`
--

LOCK TABLES `announcement_settings` WRITE;
/*!40000 ALTER TABLE `announcement_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_type_settings`
--

DROP TABLE IF EXISTS `announcement_type_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_type_settings` (
  `announcement_type_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`announcement_type_setting_id`),
  UNIQUE KEY `announcement_type_settings_unique` (`type_id`,`locale`,`setting_name`),
  KEY `announcement_type_settings_type_id` (`type_id`),
  CONSTRAINT `announcement_type_settings_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `announcement_types` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about announcement types, including localized properties like their names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_type_settings`
--

LOCK TABLES `announcement_type_settings` WRITE;
/*!40000 ALTER TABLE `announcement_type_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_type_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_types`
--

DROP TABLE IF EXISTS `announcement_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_types` (
  `type_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `announcement_types_context_id` (`context_id`),
  CONSTRAINT `announcement_types_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Announcement types allow for announcements to optionally be categorized.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_types`
--

LOCK TABLES `announcement_types` WRITE;
/*!40000 ALTER TABLE `announcement_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `announcement_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint DEFAULT NULL,
  `assoc_id` bigint NOT NULL,
  `type_id` bigint DEFAULT NULL,
  `date_expire` date DEFAULT NULL,
  `date_posted` datetime NOT NULL,
  PRIMARY KEY (`announcement_id`),
  KEY `announcements_type_id` (`type_id`),
  KEY `announcements_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `announcements_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `announcement_types` (`type_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Announcements are messages that can be presented to users e.g. on the homepage.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_settings`
--

DROP TABLE IF EXISTS `author_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_settings` (
  `author_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `author_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`author_setting_id`),
  UNIQUE KEY `author_settings_unique` (`author_id`,`locale`,`setting_name`),
  KEY `author_settings_author_id` (`author_id`),
  CONSTRAINT `author_settings_author_id` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8mb3 COMMENT='More data about authors, including localized properties such as their name and affiliation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_settings`
--

LOCK TABLES `author_settings` WRITE;
/*!40000 ALTER TABLE `author_settings` DISABLE KEYS */;
INSERT INTO `author_settings` VALUES (1,1,'en','affiliation','University of Calgary'),(2,1,'','country','CA'),(3,1,'en','familyName','Clark'),(4,1,'en','givenName','Arthur'),(5,2,'en','affiliation','Athabasca University'),(6,2,'','country','CA'),(7,2,'en','familyName','Finkel'),(8,2,'en','givenName','Alvin'),(13,3,'','country','CA'),(14,3,'fr_CA','familyName',NULL),(15,3,'en','familyName','Carter'),(16,3,'fr_CA','givenName',NULL),(17,3,'en','givenName','Sarah'),(20,3,'','isVolumeEditor','0'),(21,4,'fr_CA','affiliation',NULL),(22,4,'en','affiliation',NULL),(23,4,'fr_CA','biography',NULL),(24,4,'en','biography',NULL),(25,4,'','country','CA'),(26,4,'fr_CA','familyName',NULL),(27,4,'en','familyName','Fortna'),(28,4,'fr_CA','givenName',NULL),(29,4,'en','givenName','Peter'),(30,4,'fr_CA','preferredPublicName',NULL),(31,4,'en','preferredPublicName',NULL),(32,4,'','isVolumeEditor','0'),(33,5,'fr_CA','affiliation',NULL),(34,5,'en','affiliation',NULL),(35,5,'fr_CA','biography',NULL),(36,5,'en','biography',NULL),(37,5,'','country','CA'),(38,5,'fr_CA','familyName',NULL),(39,5,'en','familyName','Friesen'),(40,5,'fr_CA','givenName',NULL),(41,5,'en','givenName','Gerald'),(42,5,'fr_CA','preferredPublicName',NULL),(43,5,'en','preferredPublicName',NULL),(44,5,'','isVolumeEditor','0'),(45,6,'fr_CA','affiliation',NULL),(46,6,'en','affiliation',NULL),(47,6,'fr_CA','biography',NULL),(48,6,'en','biography',NULL),(49,6,'','country','CA'),(50,6,'fr_CA','familyName',NULL),(51,6,'en','familyName','Dick'),(52,6,'fr_CA','givenName',NULL),(53,6,'en','givenName','Lyle'),(54,6,'fr_CA','preferredPublicName',NULL),(55,6,'en','preferredPublicName',NULL),(56,6,'','isVolumeEditor','0'),(57,7,'fr_CA','affiliation',NULL),(58,7,'en','affiliation',NULL),(59,7,'fr_CA','biography',NULL),(60,7,'en','biography',NULL),(61,7,'','country','CA'),(62,7,'fr_CA','familyName',NULL),(63,7,'en','familyName','Wheeler'),(64,7,'fr_CA','givenName',NULL),(65,7,'en','givenName','Winona'),(66,7,'fr_CA','preferredPublicName',NULL),(67,7,'en','preferredPublicName',NULL),(68,7,'','isVolumeEditor','0'),(69,8,'fr_CA','affiliation',NULL),(70,8,'en','affiliation',NULL),(71,8,'fr_CA','biography',NULL),(72,8,'en','biography',NULL),(73,8,'','country','CA'),(74,8,'fr_CA','familyName',NULL),(75,8,'en','familyName','Dyce'),(76,8,'fr_CA','givenName',NULL),(77,8,'en','givenName','Matt'),(78,8,'fr_CA','preferredPublicName',NULL),(79,8,'en','preferredPublicName',NULL),(80,8,'','isVolumeEditor','0'),(81,9,'fr_CA','affiliation',NULL),(82,9,'en','affiliation',NULL),(83,9,'fr_CA','biography',NULL),(84,9,'en','biography',NULL),(85,9,'','country','CA'),(86,9,'fr_CA','familyName',NULL),(87,9,'en','familyName','Opp'),(88,9,'fr_CA','givenName',NULL),(89,9,'en','givenName','James'),(90,9,'fr_CA','preferredPublicName',NULL),(91,9,'en','preferredPublicName',NULL),(92,9,'','isVolumeEditor','0'),(105,11,'en','affiliation','Athabasca University'),(106,11,'','country','CA'),(107,11,'en','familyName','Barnetson'),(108,11,'en','givenName','Bob'),(109,12,'en','affiliation','University of British Columbia'),(110,12,'','country','CA'),(111,12,'en','familyName','Beaty'),(112,12,'en','givenName','Bart'),(113,13,'en','affiliation','University of Alberta'),(114,13,'','country','CA'),(115,13,'en','familyName','Miller'),(116,13,'en','givenName','Toby'),(117,14,'en','affiliation','Athabasca University'),(118,14,'','country','CA'),(119,14,'en','familyName','Wagman'),(120,14,'en','givenName','Ira'),(121,15,'en','affiliation','University of Calgary'),(122,15,'','country','CA'),(123,15,'en','familyName','Straw'),(124,15,'en','givenName','Will'),(125,16,'en','affiliation','University of Southern California'),(126,16,'','country','CA'),(127,16,'en','familyName','Allan'),(128,16,'en','givenName','Chantal'),(129,17,'en','affiliation','SUNY'),(130,17,'','country','US'),(131,17,'en','familyName','Bernnard'),(132,17,'en','givenName','Deborah'),(133,18,'en','affiliation','SUNY'),(134,18,'','country','US'),(135,18,'en','familyName','Bobish'),(136,18,'en','givenName','Greg'),(137,19,'en','affiliation','SUNY'),(138,19,'','country','US'),(139,19,'en','familyName','Bullis'),(140,19,'en','givenName','Daryl'),(141,20,'en','affiliation','SUNY'),(142,20,'','country','US'),(143,20,'en','familyName','Hecker'),(144,20,'en','givenName','Jenna'),(145,21,'en','affiliation','Athabasca University'),(146,21,'','country','CA'),(147,21,'en','familyName','Kennepohl'),(148,21,'en','givenName','Dietmar'),(149,22,'en','affiliation','University of Calgary'),(150,22,'','country','CA'),(151,22,'en','familyName','Anderson'),(152,22,'en','givenName','Terry'),(153,23,'en','affiliation','University of Alberta'),(154,23,'','country','CA'),(155,23,'en','familyName','Gorsky'),(156,23,'en','givenName','Paul'),(157,24,'en','affiliation','Athabasca University'),(158,24,'','country','CA'),(159,24,'en','familyName','Parchoma'),(160,24,'en','givenName','Gale'),(161,25,'en','affiliation','University of Alberta'),(162,25,'','country','CA'),(163,25,'en','familyName','Palmer'),(164,25,'en','givenName','Stuart'),(165,26,'en','affiliation','University of Sussex'),(166,26,'','country','CA'),(167,26,'en','familyName','Perini'),(168,26,'en','givenName','Fernando'),(169,27,'','country','GB'),(170,27,'en','familyName','Mansell'),(171,27,'en','givenName','Robin'),(172,28,'','country','AR'),(173,28,'en','familyName','Galperin'),(174,28,'en','givenName','Hernan'),(175,29,'','country','CL'),(176,29,'en','familyName','Bello'),(177,29,'en','givenName','Pablo'),(178,30,'','country','AR'),(179,30,'en','familyName','Rabinovich'),(180,30,'en','givenName','Eleonora'),(181,31,'en','affiliation','Buffalo National Park Foundation'),(182,31,'','country','CA'),(183,31,'en','familyName','Brower'),(184,31,'en','givenName','Jennifer'),(185,32,'en','affiliation','University of Alberta'),(186,32,'','country','CA'),(187,32,'en','familyName','Locke Hart'),(188,32,'en','givenName','Jonathan'),(189,33,'en','affiliation','International Development Research Centre'),(190,33,'','country','CA'),(191,33,'en','familyName','Elder'),(192,33,'en','givenName','Laurent'),(193,34,'','country','CA'),(194,34,'en','familyName','Emdon'),(195,34,'en','givenName','Heloise'),(196,35,'','country','CA'),(197,35,'en','familyName','Tulus'),(198,35,'en','givenName','Frank'),(199,36,'','country','AR'),(200,36,'en','familyName','Hyma'),(201,36,'en','givenName','Raymond'),(202,37,'','country','CA'),(203,37,'en','familyName','Valk'),(204,37,'en','givenName','John'),(205,38,'','country','CA'),(206,38,'en','familyName','Fourati'),(207,38,'en','givenName','Khaled'),(208,39,'','country','CA'),(209,39,'en','familyName','de Beer'),(210,39,'en','givenName','Jeremy'),(211,40,'','country','CA'),(212,40,'en','familyName','Bannerman'),(213,40,'en','givenName','Sara'),(214,41,'en','affiliation','Athabasca University'),(215,41,'','country','CA'),(216,41,'en','familyName','Ally'),(217,41,'en','givenName','Mohamed'),(218,42,'','country','GB'),(219,42,'en','familyName','Traxler'),(220,42,'en','givenName','John'),(221,43,'','country','CA'),(222,43,'en','familyName','Koole'),(223,43,'en','givenName','Marguerite'),(224,44,'','country','NO'),(225,44,'en','familyName','Rekkedal'),(226,44,'en','givenName','Torstein'),(227,45,'en','affiliation','University of Alberta'),(228,45,'','country','CA'),(229,45,'en','familyName','Dawson'),(230,45,'en','givenName','Michael'),(231,46,'en','affiliation','Athabasca University'),(232,46,'','country','CA'),(233,46,'en','familyName','Dupuis'),(234,46,'en','givenName','Brian'),(235,47,'en','affiliation','University of Calgary'),(236,47,'','country','CA'),(237,47,'en','familyName','Wilson'),(238,47,'en','givenName','Michael'),(239,48,'en','affiliation','University of Calgary'),(240,48,'','country','CA'),(241,48,'en','familyName','Foran'),(242,48,'en','givenName','Max'),(243,49,'en','affiliation','London School of Economics'),(244,49,'','country','CA'),(245,49,'en','familyName','Power'),(246,49,'en','givenName','Michael'),(247,50,'en','affiliation','International Development Research Centre'),(248,50,'','country','CA'),(249,50,'en','familyName','Smith'),(250,50,'en','givenName','Matthew'),(251,51,'','country','US'),(252,51,'en','familyName','Benkler'),(253,51,'en','givenName','Yochai'),(254,52,'','country','CA'),(255,52,'en','familyName','Reilly'),(256,52,'en','givenName','Katherine'),(257,53,'','country','US'),(258,53,'en','familyName','Loudon'),(259,53,'en','givenName','Melissa'),(260,54,'','country','SA'),(261,54,'en','familyName','Rivett'),(262,54,'en','givenName','Ulrike'),(263,55,'','country','GB'),(264,55,'en','familyName','Graham'),(265,55,'en','givenName','Mark'),(266,56,'','country','NO'),(267,56,'en','familyName','Haarstad'),(268,56,'en','givenName','Håvard'),(269,57,'','country','US'),(270,57,'en','familyName','Smith'),(271,57,'en','givenName','Marshall');
/*!40000 ALTER TABLE `author_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `author_id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `include_in_browse` smallint NOT NULL DEFAULT '1',
  `publication_id` bigint NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  `user_group_id` bigint DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  KEY `authors_user_group_id` (`user_group_id`),
  KEY `authors_publication_id_foreign` (`publication_id`),
  CONSTRAINT `authors_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE,
  CONSTRAINT `authors_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3 COMMENT='The authors of a publication.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'aclark@mailinator.com',1,1,0.00,13),(2,'afinkel@mailinator.com',1,2,0.00,13),(3,'scarter@mailinator.com',1,2,1.00,14),(4,'pfortna@mailinator.com',1,2,2.00,14),(5,'gfriesen@mailinator.com',1,2,3.00,15),(6,'ldick@mailinator.com',1,2,4.00,15),(7,'wwheeler@mailinator.com',1,2,5.00,15),(8,'mdyce@mailinator.com',1,2,6.00,15),(9,'jopp@mailinator.com',1,2,7.00,15),(11,'bbarnetson@mailinator.com',1,3,0.00,13),(12,'bbeaty@mailinator.com',1,4,0.00,13),(13,'tmiller@mailinator.com',1,4,0.00,13),(14,'awagman@mailinator.com',1,4,0.00,13),(15,'wstraw@mailinator.com',1,4,0.00,13),(16,'callan@mailinator.com',1,5,0.00,13),(17,'dbernnard@mailinator.com',1,6,0.00,13),(18,'gbobish@mailinator.com',1,6,0.00,13),(19,'dbullis@mailinator.com',1,6,0.00,13),(20,'jhecker@mailinator.com',1,6,0.00,13),(21,'dkennepohl@mailinator.com',1,7,0.00,13),(22,'tanderson@mailinator.com',1,7,0.00,13),(23,'pgorsky@mailinator.com',1,7,0.00,13),(24,'gparchoma@mailinator.com',1,7,0.00,13),(25,'spalmer@mailinator.com',1,7,0.00,13),(26,'fperini@mailinator.com',1,9,0.00,13),(27,'rmansell@mailinator.com',1,9,0.00,13),(28,'hgalperin@mailinator.com',1,9,0.00,13),(29,'pbello@mailinator.com',1,9,0.00,13),(30,'erabinovich@mailinator.com',1,9,0.00,13),(31,'jbrower@mailinator.com',1,10,0.00,13),(32,'jlockehart@mailinator.com',1,11,0.00,13),(33,'lelder@mailinator.com',1,12,0.00,13),(34,'lelder@mailinator.com',1,12,0.00,14),(35,'ftulus@mailinator.com',1,12,0.00,13),(36,'rhyma@mailinator.com',1,12,0.00,13),(37,'jvalk@mailinator.com',1,12,0.00,13),(38,'fkourati@mailinator.com',1,12,0.00,13),(39,'jdebeer@mailinator.com',1,12,0.00,13),(40,'sbannerman@mailinator.com',1,12,0.00,13),(41,'mally@mailinator.com',1,13,0.00,13),(42,'jtraxler@mailinator.com',1,13,0.00,13),(43,'mkoole@mailinator.com',1,13,0.00,13),(44,'trekkedal@mailinator.com',1,13,0.00,13),(45,'mdawson@mailinator.com',1,14,0.00,13),(46,'bdupuis@mailinator.com',1,14,0.00,13),(47,'mwilson@mailinator.com',1,14,0.00,13),(48,'mforan@mailinator.com',1,15,0.00,13),(49,'mpower@mailinator.com',1,16,0.00,13),(50,'msmith@mailinator.com',1,17,0.00,13),(51,'ybenkler@mailinator.com',1,17,0.00,13),(52,'kreilly@mailinator.com',1,17,0.00,13),(53,'mloudon@mailinator.com',1,17,0.00,13),(54,'urivett@mailinator.com',1,17,0.00,13),(55,'mgraham@mailinator.com',1,17,0.00,13),(56,'hhaarstad@mailinator.com',1,17,0.00,13),(57,'masmith@mailinator.com',1,17,0.00,13);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `seq` bigint DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `image` text,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_path` (`context_id`,`path`),
  KEY `category_context_id` (`context_id`),
  KEY `category_context_parent_id` (`context_id`,`parent_id`),
  KEY `category_parent_id` (`parent_id`),
  CONSTRAINT `categories_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='Categories permit the organization of submissions into a heirarchical structure.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,1,NULL,1,'applied-science',NULL),(2,1,1,2,'comp-sci',NULL),(3,1,1,3,'eng',NULL),(4,1,NULL,4,'social-sciences',NULL),(5,1,4,5,'sociology',NULL),(6,1,4,10000,'anthropology',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_settings`
--

DROP TABLE IF EXISTS `category_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_settings` (
  `category_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`category_setting_id`),
  UNIQUE KEY `category_settings_unique` (`category_id`,`locale`,`setting_name`),
  KEY `category_settings_category_id` (`category_id`),
  CONSTRAINT `category_settings_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COMMENT='More data about categories, including localized properties such as names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_settings`
--

LOCK TABLES `category_settings` WRITE;
/*!40000 ALTER TABLE `category_settings` DISABLE KEYS */;
INSERT INTO `category_settings` VALUES (1,1,'','sortOption','title-ASC'),(2,1,'en','title','Applied Science'),(3,1,'fr_CA','title',''),(4,1,'en','description',''),(5,1,'fr_CA','description',''),(6,2,'','sortOption','title-ASC'),(7,2,'en','title','Computer Science'),(8,2,'fr_CA','title',''),(9,2,'en','description',''),(10,2,'fr_CA','description',''),(11,3,'','sortOption','title-ASC'),(12,3,'en','title','Engineering'),(13,3,'fr_CA','title',''),(14,3,'en','description',''),(15,3,'fr_CA','description',''),(16,4,'','sortOption','title-ASC'),(17,4,'en','title','Social Sciences'),(18,4,'fr_CA','title',''),(19,4,'en','description',''),(20,4,'fr_CA','description',''),(21,5,'','sortOption','title-ASC'),(22,5,'en','title','Sociology'),(23,5,'fr_CA','title',''),(24,5,'en','description',''),(25,5,'fr_CA','description',''),(26,6,'','sortOption','title-ASC'),(27,6,'en','title','Anthropology'),(28,6,'fr_CA','title',''),(29,6,'en','description',''),(30,6,'fr_CA','description','');
/*!40000 ALTER TABLE `category_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citation_settings`
--

DROP TABLE IF EXISTS `citation_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citation_settings` (
  `citation_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `citation_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`citation_setting_id`),
  UNIQUE KEY `citation_settings_unique` (`citation_id`,`locale`,`setting_name`),
  KEY `citation_settings_citation_id` (`citation_id`),
  CONSTRAINT `citation_settings_citation_id` FOREIGN KEY (`citation_id`) REFERENCES `citations` (`citation_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Additional data about citations, including localized content.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citation_settings`
--

LOCK TABLES `citation_settings` WRITE;
/*!40000 ALTER TABLE `citation_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `citation_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citations`
--

DROP TABLE IF EXISTS `citations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citations` (
  `citation_id` bigint NOT NULL AUTO_INCREMENT,
  `publication_id` bigint NOT NULL,
  `raw_citation` text NOT NULL,
  `seq` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`citation_id`),
  UNIQUE KEY `citations_publication_seq` (`publication_id`,`seq`),
  KEY `citations_publication` (`publication_id`),
  CONSTRAINT `citations_publication` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A citation made by an associated publication.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citations`
--

LOCK TABLES `citations` WRITE;
/*!40000 ALTER TABLE `citations` DISABLE KEYS */;
/*!40000 ALTER TABLE `citations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `completed_payments`
--

DROP TABLE IF EXISTS `completed_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `completed_payments` (
  `completed_payment_id` bigint NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `payment_type` bigint NOT NULL,
  `context_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `assoc_id` varchar(16) DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `currency_code_alpha` varchar(3) DEFAULT NULL,
  `payment_method_plugin_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`completed_payment_id`),
  KEY `completed_payments_context_id` (`context_id`),
  KEY `completed_payments_user_id` (`user_id`),
  CONSTRAINT `completed_payments_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `completed_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A list of completed (fulfilled) payments, with information about the type of payment and the entity it relates to.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completed_payments`
--

LOCK TABLES `completed_payments` WRITE;
/*!40000 ALTER TABLE `completed_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `completed_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocab_entries`
--

DROP TABLE IF EXISTS `controlled_vocab_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlled_vocab_entries` (
  `controlled_vocab_entry_id` bigint NOT NULL AUTO_INCREMENT,
  `controlled_vocab_id` bigint NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_entry_id`),
  KEY `controlled_vocab_entries_controlled_vocab_id` (`controlled_vocab_id`),
  KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`),
  CONSTRAINT `controlled_vocab_entries_controlled_vocab_id_foreign` FOREIGN KEY (`controlled_vocab_id`) REFERENCES `controlled_vocabs` (`controlled_vocab_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COMMENT='The order that a word or phrase used in a controlled vocabulary should appear. For example, the order of keywords in a publication.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entries`
--

LOCK TABLES `controlled_vocab_entries` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entries` VALUES (1,12,1.00),(2,12,2.00),(3,17,1.00),(4,17,2.00),(14,22,1.00),(15,22,2.00),(16,22,3.00),(17,27,1.00),(18,27,2.00),(19,32,1.00),(20,42,1.00),(21,42,2.00),(22,42,3.00),(23,47,1.00),(24,47,2.00),(25,47,3.00),(26,57,1.00),(27,57,2.00),(28,62,1.00),(30,67,1.00),(31,82,1.00),(32,82,2.00);
/*!40000 ALTER TABLE `controlled_vocab_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocab_entry_settings`
--

DROP TABLE IF EXISTS `controlled_vocab_entry_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `controlled_vocab_entry_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`controlled_vocab_entry_setting_id`),
  UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`),
  CONSTRAINT `c_v_e_s_entry_id` FOREIGN KEY (`controlled_vocab_entry_id`) REFERENCES `controlled_vocab_entries` (`controlled_vocab_entry_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COMMENT='More data about a controlled vocabulary entry, including localized properties such as the actual word or phrase.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entry_settings`
--

LOCK TABLES `controlled_vocab_entry_settings` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entry_settings` VALUES (1,1,'en','submissionKeyword','Business & Economics','string'),(2,2,'en','submissionKeyword','Political & International Studies','string'),(3,3,'en','submissionKeyword','Canadian Studies','string'),(4,4,'en','submissionKeyword','Communication & Cultural Studies','string'),(14,14,'en','submissionKeyword','Canadian Studies','string'),(15,15,'en','submissionKeyword','Communication & Cultural Studies','string'),(16,16,'en','submissionKeyword','Political & International Studies','string'),(17,17,'en','submissionKeyword','information literacy','string'),(18,18,'en','submissionKeyword','academic libraries','string'),(19,19,'en','submissionKeyword','Education','string'),(20,20,'en','submissionKeyword','Information','string'),(21,21,'en','submissionKeyword','society','string'),(22,22,'en','submissionKeyword','ICT','string'),(23,23,'en','submissionKeyword','Biography & Memoir','string'),(24,24,'en','submissionKeyword','Environmental Studies','string'),(25,25,'en','submissionKeyword','Political & International Studies','string'),(26,26,'en','submissionKeyword','International Development','string'),(27,27,'en','submissionKeyword','ICT','string'),(28,28,'en','submissionKeyword','Educational Technology','string'),(30,30,'en','submissionKeyword','Psychology','string'),(31,31,'en','submissionKeyword','International Development','string'),(32,32,'en','submissionKeyword','ICT','string');
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocabs`
--

DROP TABLE IF EXISTS `controlled_vocabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlled_vocabs` (
  `controlled_vocab_id` bigint NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(64) NOT NULL,
  `assoc_type` bigint NOT NULL DEFAULT '0',
  `assoc_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`controlled_vocab_id`),
  UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb3 COMMENT='Every word or phrase used in a controlled vocabulary. Controlled vocabularies are used for submission metadata like keywords and subjects, reviewer interests, and wherever a similar dictionary of words or phrases is required. Each entry corresponds to a word or phrase like "cellular reproduction" and a type like "submissionKeyword".';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocabs`
--

LOCK TABLES `controlled_vocabs` WRITE;
/*!40000 ALTER TABLE `controlled_vocabs` DISABLE KEYS */;
INSERT INTO `controlled_vocabs` VALUES (1,'interest',0,0),(6,'submissionAgency',1048588,1),(11,'submissionAgency',1048588,2),(16,'submissionAgency',1048588,3),(21,'submissionAgency',1048588,4),(26,'submissionAgency',1048588,5),(31,'submissionAgency',1048588,6),(36,'submissionAgency',1048588,7),(41,'submissionAgency',1048588,8),(46,'submissionAgency',1048588,9),(51,'submissionAgency',1048588,10),(56,'submissionAgency',1048588,11),(61,'submissionAgency',1048588,12),(66,'submissionAgency',1048588,13),(71,'submissionAgency',1048588,14),(76,'submissionAgency',1048588,15),(81,'submissionAgency',1048588,16),(86,'submissionAgency',1048588,17),(4,'submissionDiscipline',1048588,1),(9,'submissionDiscipline',1048588,2),(14,'submissionDiscipline',1048588,3),(19,'submissionDiscipline',1048588,4),(24,'submissionDiscipline',1048588,5),(29,'submissionDiscipline',1048588,6),(34,'submissionDiscipline',1048588,7),(39,'submissionDiscipline',1048588,8),(44,'submissionDiscipline',1048588,9),(49,'submissionDiscipline',1048588,10),(54,'submissionDiscipline',1048588,11),(59,'submissionDiscipline',1048588,12),(64,'submissionDiscipline',1048588,13),(69,'submissionDiscipline',1048588,14),(74,'submissionDiscipline',1048588,15),(79,'submissionDiscipline',1048588,16),(84,'submissionDiscipline',1048588,17),(2,'submissionKeyword',1048588,1),(7,'submissionKeyword',1048588,2),(12,'submissionKeyword',1048588,3),(17,'submissionKeyword',1048588,4),(22,'submissionKeyword',1048588,5),(27,'submissionKeyword',1048588,6),(32,'submissionKeyword',1048588,7),(37,'submissionKeyword',1048588,8),(42,'submissionKeyword',1048588,9),(47,'submissionKeyword',1048588,10),(52,'submissionKeyword',1048588,11),(57,'submissionKeyword',1048588,12),(62,'submissionKeyword',1048588,13),(67,'submissionKeyword',1048588,14),(72,'submissionKeyword',1048588,15),(77,'submissionKeyword',1048588,16),(82,'submissionKeyword',1048588,17),(5,'submissionLanguage',1048588,1),(10,'submissionLanguage',1048588,2),(15,'submissionLanguage',1048588,3),(20,'submissionLanguage',1048588,4),(25,'submissionLanguage',1048588,5),(30,'submissionLanguage',1048588,6),(35,'submissionLanguage',1048588,7),(40,'submissionLanguage',1048588,8),(45,'submissionLanguage',1048588,9),(50,'submissionLanguage',1048588,10),(55,'submissionLanguage',1048588,11),(60,'submissionLanguage',1048588,12),(65,'submissionLanguage',1048588,13),(70,'submissionLanguage',1048588,14),(75,'submissionLanguage',1048588,15),(80,'submissionLanguage',1048588,16),(85,'submissionLanguage',1048588,17),(3,'submissionSubject',1048588,1),(8,'submissionSubject',1048588,2),(13,'submissionSubject',1048588,3),(18,'submissionSubject',1048588,4),(23,'submissionSubject',1048588,5),(28,'submissionSubject',1048588,6),(33,'submissionSubject',1048588,7),(38,'submissionSubject',1048588,8),(43,'submissionSubject',1048588,9),(48,'submissionSubject',1048588,10),(53,'submissionSubject',1048588,11),(58,'submissionSubject',1048588,12),(63,'submissionSubject',1048588,13),(68,'submissionSubject',1048588,14),(73,'submissionSubject',1048588,15),(78,'submissionSubject',1048588,16),(83,'submissionSubject',1048588,17);
/*!40000 ALTER TABLE `controlled_vocabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstone_oai_set_objects`
--

DROP TABLE IF EXISTS `data_object_tombstone_oai_set_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_object_tombstone_oai_set_objects` (
  `object_id` bigint NOT NULL AUTO_INCREMENT,
  `tombstone_id` bigint NOT NULL,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  PRIMARY KEY (`object_id`),
  KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`),
  CONSTRAINT `data_object_tombstone_oai_set_objects_tombstone_id` FOREIGN KEY (`tombstone_id`) REFERENCES `data_object_tombstones` (`tombstone_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='Relationships between tombstones and other data that can be collected in OAI sets, e.g. sections.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstone_oai_set_objects`
--

LOCK TABLES `data_object_tombstone_oai_set_objects` WRITE;
/*!40000 ALTER TABLE `data_object_tombstone_oai_set_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstone_oai_set_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstone_settings`
--

DROP TABLE IF EXISTS `data_object_tombstone_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_object_tombstone_settings` (
  `tombstone_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tombstone_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`tombstone_setting_id`),
  UNIQUE KEY `data_object_tombstone_settings_unique` (`tombstone_id`,`locale`,`setting_name`),
  KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`),
  CONSTRAINT `data_object_tombstone_settings_tombstone_id` FOREIGN KEY (`tombstone_id`) REFERENCES `data_object_tombstones` (`tombstone_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about data object tombstones, including localized content.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstone_settings`
--

LOCK TABLES `data_object_tombstone_settings` WRITE;
/*!40000 ALTER TABLE `data_object_tombstone_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstone_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstones`
--

DROP TABLE IF EXISTS `data_object_tombstones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_object_tombstones` (
  `tombstone_id` bigint NOT NULL AUTO_INCREMENT,
  `data_object_id` bigint NOT NULL,
  `date_deleted` datetime NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `data_object_tombstones_data_object_id` (`data_object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='Entries for published data that has been removed. Usually used in the OAI endpoint.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstones`
--

LOCK TABLES `data_object_tombstones` WRITE;
/*!40000 ALTER TABLE `data_object_tombstones` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doi_settings`
--

DROP TABLE IF EXISTS `doi_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doi_settings` (
  `doi_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `doi_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`doi_setting_id`),
  UNIQUE KEY `doi_settings_unique` (`doi_id`,`locale`,`setting_name`),
  KEY `doi_settings_doi_id` (`doi_id`),
  CONSTRAINT `doi_settings_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about DOIs, including the registration agency.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doi_settings`
--

LOCK TABLES `doi_settings` WRITE;
/*!40000 ALTER TABLE `doi_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `doi_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dois`
--

DROP TABLE IF EXISTS `dois`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dois` (
  `doi_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `doi` varchar(255) NOT NULL,
  `status` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`doi_id`),
  KEY `dois_context_id` (`context_id`),
  CONSTRAINT `dois_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Stores all DOIs used in the system.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dois`
--

LOCK TABLES `dois` WRITE;
/*!40000 ALTER TABLE `dois` DISABLE KEYS */;
/*!40000 ALTER TABLE `dois` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_decisions`
--

DROP TABLE IF EXISTS `edit_decisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edit_decisions` (
  `edit_decision_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `review_round_id` bigint DEFAULT NULL,
  `stage_id` bigint DEFAULT NULL,
  `round` smallint DEFAULT NULL,
  `editor_id` bigint NOT NULL,
  `decision` smallint NOT NULL COMMENT 'A numeric constant indicating the decision that was taken. Possible values are listed in the Decision class.',
  `date_decided` datetime NOT NULL,
  PRIMARY KEY (`edit_decision_id`),
  KEY `edit_decisions_submission_id` (`submission_id`),
  KEY `edit_decisions_editor_id` (`editor_id`),
  KEY `edit_decisions_review_round_id` (`review_round_id`),
  CONSTRAINT `edit_decisions_editor_id` FOREIGN KEY (`editor_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `edit_decisions_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`) ON DELETE CASCADE,
  CONSTRAINT `edit_decisions_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COMMENT='Editorial decisions recorded on a submission, such as decisions to accept or decline the submission, as well as decisions to send for review, send to copyediting, request revisions, and more.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
INSERT INTO `edit_decisions` VALUES (1,1,NULL,1,NULL,3,18,'2025-12-17 05:18:48'),(2,1,1,3,1,3,2,'2025-12-17 05:18:58'),(3,2,NULL,1,NULL,3,18,'2025-12-17 05:20:37'),(4,4,NULL,1,NULL,3,1,'2025-12-17 05:22:07'),(5,4,3,2,1,3,3,'2025-12-17 05:22:18'),(6,4,4,3,1,3,2,'2025-12-17 05:22:28'),(7,4,NULL,4,NULL,3,7,'2025-12-17 05:22:36'),(8,5,NULL,1,NULL,3,1,'2025-12-17 05:23:37'),(9,5,5,2,1,3,3,'2025-12-17 05:23:48'),(10,5,6,3,1,3,2,'2025-12-17 05:23:59'),(11,5,NULL,4,NULL,3,7,'2025-12-17 05:24:07'),(12,6,NULL,1,NULL,3,1,'2025-12-17 05:25:18'),(13,6,7,2,1,6,23,'2025-12-17 05:25:34'),(14,7,NULL,1,NULL,3,18,'2025-12-17 05:26:25'),(15,7,8,3,1,3,2,'2025-12-17 05:26:35'),(16,9,NULL,1,NULL,3,1,'2025-12-17 05:27:31'),(17,11,NULL,1,NULL,3,1,'2025-12-17 05:29:02'),(18,11,10,2,1,3,3,'2025-12-17 05:29:11'),(19,11,11,3,1,3,2,'2025-12-17 05:29:48'),(20,12,NULL,1,NULL,3,1,'2025-12-17 05:30:25'),(21,13,NULL,1,NULL,3,1,'2025-12-17 05:31:23'),(22,13,13,2,1,3,3,'2025-12-17 05:31:33'),(23,13,14,3,1,3,2,'2025-12-17 05:32:17'),(24,14,NULL,1,NULL,3,1,'2025-12-17 05:33:03'),(25,14,15,2,1,3,3,'2025-12-17 05:33:14'),(26,14,16,3,1,3,2,'2025-12-17 05:33:24'),(27,14,NULL,4,NULL,3,7,'2025-12-17 05:33:33'),(28,15,NULL,1,NULL,3,18,'2025-12-17 05:34:49'),(29,16,NULL,1,NULL,3,18,'2025-12-17 05:35:33'),(30,17,NULL,1,NULL,3,1,'2025-12-17 05:36:55');
/*!40000 ALTER TABLE `edit_decisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_log` (
  `log_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `sender_id` bigint NOT NULL,
  `date_sent` datetime NOT NULL,
  `event_type` bigint DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `recipients` text,
  `cc_recipients` text,
  `bcc_recipients` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  PRIMARY KEY (`log_id`),
  KEY `email_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb3 COMMENT='A record of email messages that are sent in relation to an associated entity, such as a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
INSERT INTO `email_log` VALUES (1,1048585,1,0,'2025-12-17 05:18:41',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/1\">The ABCs of Human Survival: A Paradigm for Global Citizenship</a><br />Arthur Clark</p><p><b>Abstract</b></p>The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities―and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(2,1048585,1,0,'2025-12-17 05:18:42',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Arthur Clark,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/1</p><p>If you have been logged out, you can login again with the username aclark.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(3,1048585,1,3,'2025-12-17 05:18:48',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>','','','Your submission has been sent for review','<p>Dear Arthur Clark,</p><p>I am pleased to inform you that an editor has reviewed your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(4,1048585,1,3,'2025-12-17 05:18:55',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>','','','Manuscript Review Request','<p>Dear Gonzalo Favio,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=1\">The ABCs of Human Survival: A Paradigm for Global Citizenship</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities―and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=1\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(5,1048585,1,3,'2025-12-17 05:18:58',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Arthur Clark,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(6,1048585,2,0,'2025-12-17 05:20:25',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: The West and Beyond: New Perspectives on an Imagined Region','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">The West and Beyond: New Perspectives on an Imagined Region</a><br />Alvin Finkel, Sarah Carter, Peter Fortna, Gerald Friesen, Lyle Dick, Winona Wheeler, Matt Dyce, James Opp</p><p><b>Abstract</b></p><p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p><p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(7,1048585,2,0,'2025-12-17 05:20:25',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: The West and Beyond: New Perspectives on an Imagined Region','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">The West and Beyond: New Perspectives on an Imagined Region</a><br />Alvin Finkel, Sarah Carter, Peter Fortna, Gerald Friesen, Lyle Dick, Winona Wheeler, Matt Dyce, James Opp</p><p><b>Abstract</b></p><p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p><p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(8,1048585,2,0,'2025-12-17 05:20:25',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: The West and Beyond: New Perspectives on an Imagined Region','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">The West and Beyond: New Perspectives on an Imagined Region</a><br />Alvin Finkel, Sarah Carter, Peter Fortna, Gerald Friesen, Lyle Dick, Winona Wheeler, Matt Dyce, James Opp</p><p><b>Abstract</b></p><p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p><p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(9,1048585,2,0,'2025-12-17 05:20:25',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Alvin Finkel\" <afinkel@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Alvin Finkel,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The West and Beyond: New Perspectives on an Imagined Region, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/2</p><p>If you have been logged out, you can login again with the username afinkel.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/2\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(10,1048585,2,0,'2025-12-17 05:20:25',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Sarah Carter\" <scarter@mailinator.com>, \"Peter Fortna\" <pfortna@mailinator.com>, \"Gerald Friesen\" <gfriesen@mailinator.com>, \"Lyle Dick\" <ldick@mailinator.com>, \"Winona Wheeler\" <wwheeler@mailinator.com>, \"Matt Dyce\" <mdyce@mailinator.com>, \"James Opp\" <jopp@mailinator.com>','','','Submission confirmation','<p>Dear Sarah Carter, Peter Fortna, Gerald Friesen, Lyle Dick, Winona Wheeler, Matt Dyce, James Opp,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Alvin Finkel, provided the following details:</p><p>The West and Beyond: New Perspectives on an Imagined Region<br>Alvin Finkel, Athabasca University<br>Sarah Carter, <br>Peter Fortna, <br>Gerald Friesen, <br>Lyle Dick, <br>Winona Wheeler, <br>Matt Dyce, <br>James Opp, </p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(11,1048585,2,3,'2025-12-17 05:20:37',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Alvin Finkel\" <afinkel@mailinator.com>','','','Your submission has been sent for review','<p>Dear Alvin Finkel,</p><p>I am pleased to inform you that an editor has reviewed your submission, The West and Beyond: New Perspectives on an Imagined Region, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(12,1048585,2,3,'2025-12-17 05:20:46',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Al Zacharia\" <alzacharia@mailinator.com>','','','Manuscript Review Request','<p>Dear Al Zacharia,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=2\">The West and Beyond: New Perspectives on an Imagined Region</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=2\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(13,1048585,2,3,'2025-12-17 05:20:53',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>','','','Manuscript Review Request','<p>Dear Gonzalo Favio,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=2\">The West and Beyond: New Perspectives on an Imagined Region</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=2\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(14,1048585,3,0,'2025-12-17 05:21:29',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: The Political Economy of Workplace Injury in Canada','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">The Political Economy of Workplace Injury in Canada</a><br />Bob Barnetson</p><p><b>Abstract</b></p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(15,1048585,3,0,'2025-12-17 05:21:29',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: The Political Economy of Workplace Injury in Canada','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">The Political Economy of Workplace Injury in Canada</a><br />Bob Barnetson</p><p><b>Abstract</b></p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(16,1048585,3,0,'2025-12-17 05:21:29',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: The Political Economy of Workplace Injury in Canada','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">The Political Economy of Workplace Injury in Canada</a><br />Bob Barnetson</p><p><b>Abstract</b></p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(17,1048585,3,0,'2025-12-17 05:21:29',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Bob Barnetson\" <bbarnetson@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Bob Barnetson,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The Political Economy of Workplace Injury in Canada, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/3</p><p>If you have been logged out, you can login again with the username bbarnetson.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/3\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(18,1048585,4,0,'2025-12-17 05:22:00',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/4\">How Canadians Communicate: Contexts of Canadian Popular Culture</a><br />Bart Beaty, Toby Miller, Ira Wagman, Will Straw</p><p><b>Abstract</b></p>What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(19,1048585,4,0,'2025-12-17 05:22:00',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Bart Beaty,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/4</p><p>If you have been logged out, you can login again with the username bbeaty.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(20,1048585,4,0,'2025-12-17 05:22:00',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Toby Miller\" <tmiller@mailinator.com>, \"Ira Wagman\" <awagman@mailinator.com>, \"Will Straw\" <wstraw@mailinator.com>','','','Submission confirmation','<p>Dear Toby Miller, Ira Wagman, Will Straw,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Bart Beaty, provided the following details:</p><p>How Canadians Communicate: Contexts of Canadian Popular Culture<br>Bart Beaty, University of British Columbia<br>Toby Miller, University of Alberta<br>Ira Wagman, Athabasca University<br>Will Straw, University of Calgary</p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(21,1048585,4,3,'2025-12-17 05:22:07',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Bart Beaty,</p><p>I am pleased to inform you that an editor has reviewed your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(22,1048585,4,3,'2025-12-17 05:22:15',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>','','','Manuscript Review Request','<p>Dear Aisla McCrae,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=4\">How Canadians Communicate: Contexts of Canadian Popular Culture</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=4\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(23,1048585,4,3,'2025-12-17 05:22:18',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Your submission has been sent for review','<p>Dear Bart Beaty,</p><p>I am pleased to inform you that an editor has reviewed your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(24,1048585,4,3,'2025-12-17 05:22:25',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Al Zacharia\" <alzacharia@mailinator.com>','','','Manuscript Review Request','<p>Dear Al Zacharia,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=4\">How Canadians Communicate: Contexts of Canadian Popular Culture</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=4\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(25,1048585,4,3,'2025-12-17 05:22:28',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Bart Beaty,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(26,1048585,4,3,'2025-12-17 05:22:37',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Bart Beaty,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(27,1048585,5,0,'2025-12-17 05:23:29',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Bomb Canada and Other Unkind Remarks in the American Media','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">Bomb Canada and Other Unkind Remarks in the American Media</a><br />Chantal Allan</p><p><b>Abstract</b></p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(28,1048585,5,0,'2025-12-17 05:23:29',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Bomb Canada and Other Unkind Remarks in the American Media','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">Bomb Canada and Other Unkind Remarks in the American Media</a><br />Chantal Allan</p><p><b>Abstract</b></p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(29,1048585,5,0,'2025-12-17 05:23:29',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Bomb Canada and Other Unkind Remarks in the American Media','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">Bomb Canada and Other Unkind Remarks in the American Media</a><br />Chantal Allan</p><p><b>Abstract</b></p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(30,1048585,5,0,'2025-12-17 05:23:29',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Chantal Allan,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Bomb Canada and Other Unkind Remarks in the American Media, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/5</p><p>If you have been logged out, you can login again with the username callan.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(31,1048585,5,3,'2025-12-17 05:23:37',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Chantal Allan,</p><p>I am pleased to inform you that an editor has reviewed your submission, Bomb Canada and Other Unkind Remarks in the American Media, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(32,1048585,5,3,'2025-12-17 05:23:45',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>','','','Manuscript Review Request','<p>Dear Paul Hudson,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=5\">Bomb Canada and Other Unkind Remarks in the American Media</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=5\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(33,1048585,5,3,'2025-12-17 05:23:48',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Your submission has been sent for review','<p>Dear Chantal Allan,</p><p>I am pleased to inform you that an editor has reviewed your submission, Bomb Canada and Other Unkind Remarks in the American Media, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(34,1048585,5,3,'2025-12-17 05:23:55',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>','','','Manuscript Review Request','<p>Dear Gonzalo Favio,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=5\">Bomb Canada and Other Unkind Remarks in the American Media</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=5\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(35,1048585,5,3,'2025-12-17 05:23:59',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Chantal Allan,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Bomb Canada and Other Unkind Remarks in the American Media, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(36,1048585,5,3,'2025-12-17 05:24:07',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Chantal Allan,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, Bomb Canada and Other Unkind Remarks in the American Media, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(37,1048585,6,0,'2025-12-17 05:25:10',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">The Information Literacy User’s Guide</a><br />Deborah Bernnard, Greg Bobish, Daryl Bullis, Jenna Hecker</p><p><b>Abstract</b></p>Good researchers have a host of tools at their disposal that make navigating today’s complex information ecosystem much more manageable. Gaining the knowledge, abilities, and self-reflection necessary to be a good researcher helps not only in academic settings, but is invaluable in any career, and throughout one’s life. The Information Literacy User’s Guide will start you on this route to success.<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(38,1048585,6,0,'2025-12-17 05:25:10',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Deborah Bernnard\" <dbernnard@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Deborah Bernnard,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The Information Literacy User’s Guide, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/6</p><p>If you have been logged out, you can login again with the username dbernnard.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/6\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(39,1048585,6,0,'2025-12-17 05:25:10',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Greg Bobish\" <gbobish@mailinator.com>, \"Daryl Bullis\" <dbullis@mailinator.com>, \"Jenna Hecker\" <jhecker@mailinator.com>','','','Submission confirmation','<p>Dear Greg Bobish, Daryl Bullis, Jenna Hecker,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Deborah Bernnard, provided the following details:</p><p>The Information Literacy User’s Guide<br>Deborah Bernnard, SUNY<br>Greg Bobish, SUNY<br>Daryl Bullis, SUNY<br>Jenna Hecker, SUNY</p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(40,1048585,6,3,'2025-12-17 05:25:18',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Deborah Bernnard\" <dbernnard@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Deborah Bernnard,</p><p>I am pleased to inform you that an editor has reviewed your submission, The Information Literacy User’s Guide, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(41,1048585,7,0,'2025-12-17 05:26:16',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">Accessible Elements: Teaching Science Online and at a Distance</a><br />Dietmar Kennepohl, Terry Anderson, Paul Gorsky, Gale Parchoma, Stuart Palmer</p><p><b>Abstract</b></p>Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(42,1048585,7,0,'2025-12-17 05:26:16',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Dietmar Kennepohl,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Accessible Elements: Teaching Science Online and at a Distance, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/7</p><p>If you have been logged out, you can login again with the username dkennepohl.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/7\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(43,1048585,7,0,'2025-12-17 05:26:16',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Terry Anderson\" <tanderson@mailinator.com>, \"Paul Gorsky\" <pgorsky@mailinator.com>, \"Gale Parchoma\" <gparchoma@mailinator.com>, \"Stuart Palmer\" <spalmer@mailinator.com>','','','Submission confirmation','<p>Dear Terry Anderson, Paul Gorsky, Gale Parchoma, Stuart Palmer,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Dietmar Kennepohl, provided the following details:</p><p>Accessible Elements: Teaching Science Online and at a Distance<br>Dietmar Kennepohl, Athabasca University<br>Terry Anderson, University of Calgary<br>Paul Gorsky, University of Alberta<br>Gale Parchoma, Athabasca University<br>Stuart Palmer, University of Alberta</p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(44,1048585,7,3,'2025-12-17 05:26:25',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>','','','Your submission has been sent for review','<p>Dear Dietmar Kennepohl,</p><p>I am pleased to inform you that an editor has reviewed your submission, Accessible Elements: Teaching Science Online and at a Distance, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(45,1048585,7,3,'2025-12-17 05:26:32',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Manuscript Review Request','<p>Dear Adela Gallego,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=7\">Accessible Elements: Teaching Science Online and at a Distance</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=7\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(46,1048585,7,3,'2025-12-17 05:26:36',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Dietmar Kennepohl,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Accessible Elements: Teaching Science Online and at a Distance, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/7\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(47,1048585,8,0,'2025-12-17 05:26:48',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Editorial</a><br /></p><p><b>Abstract</b></p>A Note From The Publisher<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(48,1048585,8,0,'2025-12-17 05:26:48',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Editorial','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Editorial</a><br /></p><p><b>Abstract</b></p>A Note From The Publisher<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(49,1048585,8,0,'2025-12-17 05:26:48',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Editorial','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Editorial</a><br /></p><p><b>Abstract</b></p>A Note From The Publisher<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(50,1048585,8,0,'2025-12-17 05:26:48',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Editorial','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Editorial</a><br /></p><p><b>Abstract</b></p>A Note From The Publisher<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(51,1048585,9,0,'2025-12-17 05:27:23',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/9\">Enabling Openness: The future of the information society in Latin America and the Caribbean</a><br />Fernando Perini, Robin Mansell, Hernan Galperin, Pablo Bello, Eleonora Rabinovich</p><p><b>Abstract</b></p>In recent years, the Internet and other network technologies have emerged as a central issue for development in Latin America and the Caribbean. They have shown their potential to increase productivity and economic competitiveness, to create new ways to deliver education and health services, and to be driving forces for the modernization of the provision of public services.<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(52,1048585,9,0,'2025-12-17 05:27:23',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Fernando Perini\" <fperini@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Fernando Perini,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Enabling Openness: The future of the information society in Latin America and the Caribbean, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/9</p><p>If you have been logged out, you can login again with the username fperini.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/9\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(53,1048585,9,0,'2025-12-17 05:27:23',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Robin Mansell\" <rmansell@mailinator.com>, \"Hernan Galperin\" <hgalperin@mailinator.com>, \"Pablo Bello\" <pbello@mailinator.com>, \"Eleonora Rabinovich\" <erabinovich@mailinator.com>','','','Submission confirmation','<p>Dear Robin Mansell, Hernan Galperin, Pablo Bello, Eleonora Rabinovich,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Fernando Perini, provided the following details:</p><p>Enabling Openness: The future of the information society in Latin America and the Caribbean<br>Fernando Perini, University of Sussex<br>Robin Mansell, <br>Hernan Galperin, <br>Pablo Bello, <br>Eleonora Rabinovich, </p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(54,1048585,9,3,'2025-12-17 05:27:32',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Fernando Perini\" <fperini@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Fernando Perini,</p><p>I am pleased to inform you that an editor has reviewed your submission, Enabling Openness: The future of the information society in Latin America and the Caribbean, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(55,1048585,10,0,'2025-12-17 05:28:38',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Lost Tracks: Buffalo National Park, 1909-1939','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">Lost Tracks: Buffalo National Park, 1909-1939</a><br />Jennifer Brower</p><p><b>Abstract</b></p>While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(56,1048585,10,0,'2025-12-17 05:28:38',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Lost Tracks: Buffalo National Park, 1909-1939','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">Lost Tracks: Buffalo National Park, 1909-1939</a><br />Jennifer Brower</p><p><b>Abstract</b></p>While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(57,1048585,10,0,'2025-12-17 05:28:38',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Lost Tracks: Buffalo National Park, 1909-1939','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">Lost Tracks: Buffalo National Park, 1909-1939</a><br />Jennifer Brower</p><p><b>Abstract</b></p>While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(58,1048585,10,0,'2025-12-17 05:28:38',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Jennifer Brower\" <jbrower@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Jennifer Brower,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Lost Tracks: Buffalo National Park, 1909-1939, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/10</p><p>If you have been logged out, you can login again with the username jbrower.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/10\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(59,1048585,11,0,'2025-12-17 05:28:55',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Dreamwork','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">Dreamwork</a><br />Jonathan Locke Hart</p><p><b>Abstract</b></p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(60,1048585,11,0,'2025-12-17 05:28:55',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Dreamwork','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">Dreamwork</a><br />Jonathan Locke Hart</p><p><b>Abstract</b></p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(61,1048585,11,0,'2025-12-17 05:28:55',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Dreamwork','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">Dreamwork</a><br />Jonathan Locke Hart</p><p><b>Abstract</b></p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(62,1048585,11,0,'2025-12-17 05:28:55',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Jonathan Locke Hart,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Dreamwork, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/11</p><p>If you have been logged out, you can login again with the username jlockehart.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/11\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(63,1048585,11,3,'2025-12-17 05:29:02',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that an editor has reviewed your submission, Dreamwork, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(64,1048585,11,3,'2025-12-17 05:29:09',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>','','','Manuscript Review Request','<p>Dear Aisla McCrae,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=11\">Dreamwork</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=11\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(65,1048585,11,3,'2025-12-17 05:29:11',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Your submission has been sent for review','<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that an editor has reviewed your submission, Dreamwork, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(66,1048585,11,3,'2025-12-17 05:29:18',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Manuscript Review Request','<p>Dear Adela Gallego,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=11\">Dreamwork</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=11\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(67,1048585,11,3,'2025-12-17 05:29:24',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>','','','Manuscript Review Request','<p>Dear Gonzalo Favio,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=11\">Dreamwork</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=11\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(68,1048585,11,10,'2025-12-17 05:29:27',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Adela Gallego accepted review assignment for #11 Locke Hart — Dreamwork','<p>Dear Ramiro Vaca,</p><p>Adela Gallego has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">#11 Locke Hart — Dreamwork</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p><b>Review Due:</b> 2026-01-14</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.'),(69,1048585,11,12,'2025-12-17 05:29:35',1073741829,'\"Gonzalo Favio\" <gfavio@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Gonzalo Favio accepted review assignment for #11 Locke Hart — Dreamwork','<p>Dear Ramiro Vaca,</p><p>Gonzalo Favio has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">#11 Locke Hart — Dreamwork</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p><b>Review Due:</b> 2026-01-14</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.'),(70,1048585,11,3,'2025-12-17 05:29:48',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Dreamwork, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/11\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(71,1048585,11,3,'2025-12-17 05:29:49',1073741825,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Thank you for your review','<p>Dear Adela Gallego,</p>\n<p>Thank you for completing your review of the submission, Dreamwork, for Public Knowledge Press. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>We have chosen to accept this submission without revisions.</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for Public Knowledge Press, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>'),(72,1048585,11,3,'2025-12-17 05:29:49',1073741825,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>','','','Thank you for your review','<p>Dear Gonzalo Favio,</p>\n<p>Thank you for completing your review of the submission, Dreamwork, for Public Knowledge Press. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>We have chosen to accept this submission without revisions.</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for Public Knowledge Press, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>'),(73,1048585,12,0,'2025-12-17 05:30:17',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Connecting ICTs to Development','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">Connecting ICTs to Development</a><br />Laurent Elder, Heloise Emdon, Frank Tulus, Raymond Hyma, John Valk, Khaled Fourati, Jeremy de Beer, Sara Bannerman</p><p><b>Abstract</b></p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(74,1048585,12,0,'2025-12-17 05:30:17',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Connecting ICTs to Development','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">Connecting ICTs to Development</a><br />Laurent Elder, Heloise Emdon, Frank Tulus, Raymond Hyma, John Valk, Khaled Fourati, Jeremy de Beer, Sara Bannerman</p><p><b>Abstract</b></p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(75,1048585,12,0,'2025-12-17 05:30:17',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Connecting ICTs to Development','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">Connecting ICTs to Development</a><br />Laurent Elder, Heloise Emdon, Frank Tulus, Raymond Hyma, John Valk, Khaled Fourati, Jeremy de Beer, Sara Bannerman</p><p><b>Abstract</b></p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(76,1048585,12,0,'2025-12-17 05:30:17',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Laurent Elder\" <lelder@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Laurent Elder,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Connecting ICTs to Development, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/12</p><p>If you have been logged out, you can login again with the username lelder.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/12\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(77,1048585,12,0,'2025-12-17 05:30:17',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Frank Tulus\" <ftulus@mailinator.com>, \"Raymond Hyma\" <rhyma@mailinator.com>, \"John Valk\" <jvalk@mailinator.com>, \"Khaled Fourati\" <fkourati@mailinator.com>, \"Jeremy de Beer\" <jdebeer@mailinator.com>, \"Sara Bannerman\" <sbannerman@mailinator.com>','','','Submission confirmation','<p>Dear Frank Tulus, Raymond Hyma, John Valk, Khaled Fourati, Jeremy de Beer, Sara Bannerman,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Laurent Elder, provided the following details:</p><p>Connecting ICTs to Development<br>Laurent Elder, International Development Research Centre<br>Heloise Emdon, <br>Frank Tulus, <br>Raymond Hyma, <br>John Valk, <br>Khaled Fourati, <br>Jeremy de Beer, <br>Sara Bannerman, </p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(78,1048585,12,3,'2025-12-17 05:30:25',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Laurent Elder\" <lelder@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Laurent Elder,</p><p>I am pleased to inform you that an editor has reviewed your submission, Connecting ICTs to Development, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(79,1048585,12,3,'2025-12-17 05:30:32',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>','','','Manuscript Review Request','<p>Dear Julie Janssen,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=12\">Connecting ICTs to Development</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=12\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(80,1048585,12,3,'2025-12-17 05:30:38',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>','','','Manuscript Review Request','<p>Dear Paul Hudson,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=12\">Connecting ICTs to Development</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=12\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(81,1048585,12,3,'2025-12-17 05:30:44',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>','','','Manuscript Review Request','<p>Dear Aisla McCrae,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=12\">Connecting ICTs to Development</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=12\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(82,1048585,12,8,'2025-12-17 05:30:48',1073741829,'\"Paul Hudson\" <phudson@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Paul Hudson accepted review assignment for #12 Elder et al. — Connecting ICTs to Development','<p>Dear Ramiro Vaca,</p><p>Paul Hudson has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">#12 Elder et al. — Connecting ICTs to Development</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p><b>Review Due:</b> 2026-01-14</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.'),(83,1048585,13,0,'2025-12-17 05:31:15',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">Mobile Learning: Transforming the Delivery of Education and Training</a><br />Mohamed Ally, John Traxler, Marguerite Koole, Torstein Rekkedal</p><p><b>Abstract</b></p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(84,1048585,13,0,'2025-12-17 05:31:15',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">Mobile Learning: Transforming the Delivery of Education and Training</a><br />Mohamed Ally, John Traxler, Marguerite Koole, Torstein Rekkedal</p><p><b>Abstract</b></p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(85,1048585,13,0,'2025-12-17 05:31:15',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">Mobile Learning: Transforming the Delivery of Education and Training</a><br />Mohamed Ally, John Traxler, Marguerite Koole, Torstein Rekkedal</p><p><b>Abstract</b></p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(86,1048585,13,0,'2025-12-17 05:31:15',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Mohamed Ally,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Mobile Learning: Transforming the Delivery of Education and Training, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/13</p><p>If you have been logged out, you can login again with the username mally.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(87,1048585,13,0,'2025-12-17 05:31:15',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Traxler\" <jtraxler@mailinator.com>, \"Marguerite Koole\" <mkoole@mailinator.com>, \"Torstein Rekkedal\" <trekkedal@mailinator.com>','','','Submission confirmation','<p>Dear John Traxler, Marguerite Koole, Torstein Rekkedal,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Mohamed Ally, provided the following details:</p><p>Mobile Learning: Transforming the Delivery of Education and Training<br>Mohamed Ally, Athabasca University<br>John Traxler, <br>Marguerite Koole, <br>Torstein Rekkedal, </p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(88,1048585,13,3,'2025-12-17 05:31:23',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that an editor has reviewed your submission, Mobile Learning: Transforming the Delivery of Education and Training, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(89,1048585,13,3,'2025-12-17 05:31:30',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>','','','Manuscript Review Request','<p>Dear Paul Hudson,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13\">Mobile Learning: Transforming the Delivery of Education and Training</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(90,1048585,13,3,'2025-12-17 05:31:33',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Your submission has been sent for review','<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that an editor has reviewed your submission, Mobile Learning: Transforming the Delivery of Education and Training, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(91,1048585,13,3,'2025-12-17 05:31:40',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Manuscript Review Request','<p>Dear Adela Gallego,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13\">Mobile Learning: Transforming the Delivery of Education and Training</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(92,1048585,13,3,'2025-12-17 05:31:45',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Al Zacharia\" <alzacharia@mailinator.com>','','','Manuscript Review Request','<p>Dear Al Zacharia,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13\">Mobile Learning: Transforming the Delivery of Education and Training</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(93,1048585,13,3,'2025-12-17 05:31:51',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>','','','Manuscript Review Request','<p>Dear Gonzalo Favio,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13\">Mobile Learning: Transforming the Delivery of Education and Training</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(94,1048585,13,10,'2025-12-17 05:31:55',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Adela Gallego accepted review assignment for #13 Ally et al. — Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear Ramiro Vaca,</p><p>Adela Gallego has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">#13 Ally et al. — Mobile Learning: Transforming the Delivery of Education and Training</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p><b>Review Due:</b> 2026-01-14</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.'),(95,1048585,13,12,'2025-12-17 05:32:03',1073741829,'\"Gonzalo Favio\" <gfavio@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Gonzalo Favio accepted review assignment for #13 Ally et al. — Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear Ramiro Vaca,</p><p>Gonzalo Favio has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">#13 Ally et al. — Mobile Learning: Transforming the Delivery of Education and Training</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p><b>Review Due:</b> 2026-01-14</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.'),(96,1048585,13,3,'2025-12-17 05:32:17',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Mobile Learning: Transforming the Delivery of Education and Training, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(97,1048585,13,3,'2025-12-17 05:32:18',1073741825,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Thank you for your review','<p>Dear Adela Gallego,</p>\n<p>Thank you for completing your review of the submission, Mobile Learning: Transforming the Delivery of Education and Training, for Public Knowledge Press. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>We have chosen to accept this submission without revisions.</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for Public Knowledge Press, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>'),(98,1048585,13,3,'2025-12-17 05:32:18',1073741825,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>','','','Thank you for your review','<p>Dear Gonzalo Favio,</p>\n<p>Thank you for completing your review of the submission, Mobile Learning: Transforming the Delivery of Education and Training, for Public Knowledge Press. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>We have chosen to accept this submission without revisions.</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for Public Knowledge Press, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>'),(99,1048585,14,0,'2025-12-17 05:32:54',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/14\">From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots</a><br />Michael Dawson, Brian Dupuis, Michael Wilson</p><p><b>Abstract</b></p>From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(100,1048585,14,0,'2025-12-17 05:32:54',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Michael Dawson,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/14</p><p>If you have been logged out, you can login again with the username mdawson.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(101,1048585,14,0,'2025-12-17 05:32:54',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Brian Dupuis\" <bdupuis@mailinator.com>, \"Michael Wilson\" <mwilson@mailinator.com>','','','Submission confirmation','<p>Dear Brian Dupuis, Michael Wilson,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Michael Dawson, provided the following details:</p><p>From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots<br>Michael Dawson, University of Alberta<br>Brian Dupuis, Athabasca University<br>Michael Wilson, University of Calgary</p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(102,1048585,14,3,'2025-12-17 05:33:03',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Michael Dawson,</p><p>I am pleased to inform you that an editor has reviewed your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(103,1048585,14,3,'2025-12-17 05:33:11',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>','','','Manuscript Review Request','<p>Dear Julie Janssen,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=14\">From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=14\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(104,1048585,14,3,'2025-12-17 05:33:14',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Your submission has been sent for review','<p>Dear Michael Dawson,</p><p>I am pleased to inform you that an editor has reviewed your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(105,1048585,14,3,'2025-12-17 05:33:21',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Al Zacharia\" <alzacharia@mailinator.com>','','','Manuscript Review Request','<p>Dear Al Zacharia,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=14\">From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=14\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(106,1048585,14,3,'2025-12-17 05:33:25',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Michael Dawson,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(107,1048585,14,3,'2025-12-17 05:33:33',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Michael Dawson,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(108,1048585,15,0,'2025-12-17 05:34:41',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Expansive Discourses: Urban Sprawl in Calgary, 1945-1978','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">Expansive Discourses: Urban Sprawl in Calgary, 1945-1978</a><br />Max Foran</p><p><b>Abstract</b></p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(109,1048585,15,0,'2025-12-17 05:34:41',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Expansive Discourses: Urban Sprawl in Calgary, 1945-1978','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">Expansive Discourses: Urban Sprawl in Calgary, 1945-1978</a><br />Max Foran</p><p><b>Abstract</b></p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(110,1048585,15,0,'2025-12-17 05:34:41',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Expansive Discourses: Urban Sprawl in Calgary, 1945-1978','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">Expansive Discourses: Urban Sprawl in Calgary, 1945-1978</a><br />Max Foran</p><p><b>Abstract</b></p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(111,1048585,15,0,'2025-12-17 05:34:41',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Max Foran\" <mforan@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Max Foran,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Expansive Discourses: Urban Sprawl in Calgary, 1945-1978, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/15</p><p>If you have been logged out, you can login again with the username mforan.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/15\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(112,1048585,15,3,'2025-12-17 05:34:49',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Max Foran\" <mforan@mailinator.com>','','','Your submission has been sent for review','<p>Dear Max Foran,</p><p>I am pleased to inform you that an editor has reviewed your submission, Expansive Discourses: Urban Sprawl in Calgary, 1945-1978, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(113,1048585,16,0,'2025-12-17 05:35:24',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: A Designer\'s Log: Case Studies in Instructional Design','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">A Designer\'s Log: Case Studies in Instructional Design</a><br />Michael Power</p><p><b>Abstract</b></p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(114,1048585,16,0,'2025-12-17 05:35:24',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: A Designer\'s Log: Case Studies in Instructional Design','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">A Designer\'s Log: Case Studies in Instructional Design</a><br />Michael Power</p><p><b>Abstract</b></p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(115,1048585,16,0,'2025-12-17 05:35:24',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: A Designer\'s Log: Case Studies in Instructional Design','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">A Designer\'s Log: Case Studies in Instructional Design</a><br />Michael Power</p><p><b>Abstract</b></p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(116,1048585,16,0,'2025-12-17 05:35:24',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Michael Power\" <mpower@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Michael Power,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, A Designer\'s Log: Case Studies in Instructional Design, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/16</p><p>If you have been logged out, you can login again with the username mpower.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/16\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(117,1048585,16,3,'2025-12-17 05:35:33',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Power\" <mpower@mailinator.com>','','','Your submission has been sent for review','<p>Dear Michael Power,</p><p>I am pleased to inform you that an editor has reviewed your submission, A Designer\'s Log: Case Studies in Instructional Design, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(118,1048585,16,3,'2025-12-17 05:35:41',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>','','','Manuscript Review Request','<p>Dear Adela Gallego,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=16\">A Designer\'s Log: Case Studies in Instructional Design</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=16\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(119,1048585,16,3,'2025-12-17 05:35:47',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Al Zacharia\" <alzacharia@mailinator.com>','','','Manuscript Review Request','<p>Dear Al Zacharia,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=16\">A Designer\'s Log: Case Studies in Instructional Design</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=16\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(120,1048585,16,3,'2025-12-17 05:35:53',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>','','','Manuscript Review Request','<p>Dear Gonzalo Favio,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=16\">A Designer\'s Log: Case Studies in Instructional Design</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=16\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(121,1048585,16,10,'2025-12-17 05:35:57',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Adela Gallego accepted review assignment for #16 Power — A Designer\'s Log: Case Studies in Instructional Design','<p>Dear Ramiro Vaca,</p><p>Adela Gallego has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">#16 Power — A Designer\'s Log: Case Studies in Instructional Design</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><p><b>Review Due:</b> 2026-01-14</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.'),(122,1048585,17,0,'2025-12-17 05:36:45',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Open Development: Networked Innovations in International Development','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">Open Development: Networked Innovations in International Development</a><br />Matthew Smith, Yochai Benkler, Katherine Reilly, Melissa Loudon, Ulrike Rivett, Mark Graham, Håvard Haarstad, Marshall Smith</p><p><b>Abstract</b></p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(123,1048585,17,0,'2025-12-17 05:36:45',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Open Development: Networked Innovations in International Development','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">Open Development: Networked Innovations in International Development</a><br />Matthew Smith, Yochai Benkler, Katherine Reilly, Melissa Loudon, Ulrike Rivett, Mark Graham, Håvard Haarstad, Marshall Smith</p><p><b>Abstract</b></p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(124,1048585,17,0,'2025-12-17 05:36:45',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Open Development: Networked Innovations in International Development','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">Open Development: Networked Innovations in International Development</a><br />Matthew Smith, Yochai Benkler, Katherine Reilly, Melissa Loudon, Ulrike Rivett, Mark Graham, Håvard Haarstad, Marshall Smith</p><p><b>Abstract</b></p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(125,1048585,17,0,'2025-12-17 05:36:45',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Matthew Smith\" <msmith@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Matthew Smith,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Open Development: Networked Innovations in International Development, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/17</p><p>If you have been logged out, you can login again with the username msmith.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/17\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(126,1048585,17,0,'2025-12-17 05:36:46',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Yochai Benkler\" <ybenkler@mailinator.com>, \"Katherine Reilly\" <kreilly@mailinator.com>, \"Melissa Loudon\" <mloudon@mailinator.com>, \"Ulrike Rivett\" <urivett@mailinator.com>, \"Mark Graham\" <mgraham@mailinator.com>, \"Håvard Haarstad\" <hhaarstad@mailinator.com>, \"Marshall Smith\" <masmith@mailinator.com>','','','Submission confirmation','<p>Dear Yochai Benkler, Katherine Reilly, Melissa Loudon, Ulrike Rivett, Mark Graham, Håvard Haarstad, Marshall Smith,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Matthew Smith, provided the following details:</p><p>Open Development: Networked Innovations in International Development<br>Matthew Smith, International Development Research Centre<br>Yochai Benkler, <br>Katherine Reilly, <br>Melissa Loudon, <br>Ulrike Rivett, <br>Mark Graham, <br>Håvard Haarstad, <br>Marshall Smith, </p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(127,1048585,17,3,'2025-12-17 05:36:55',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Matthew Smith\" <msmith@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Matthew Smith,</p><p>I am pleased to inform you that an editor has reviewed your submission, Open Development: Networked Innovations in International Development, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(128,1048585,17,3,'2025-12-17 05:37:04',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>','','','Manuscript Review Request','<p>Dear Julie Janssen,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=17\">Open Development: Networked Innovations in International Development</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=17\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>'),(129,1048585,17,3,'2025-12-17 05:37:10',1073741833,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>','','','Manuscript Review Request','<p>Dear Paul Hudson,</p>\r\n<p>I believe that you would serve as an excellent reviewer for a submission to Public Knowledge Press. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p>\r\n<p>If you are able to review this submission, your review is due by 2026-01-14. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p>\r\n<p><a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=17\">Open Development: Networked Innovations in International Development</a></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.</p>\r\n<p>Please <a href=\"http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=17\">accept or decline</a> the review by <strong>2026-01-14</strong>.</p>\r\n<p>You may contact me with any questions about the submission or the review process.</p>\r\n<p>Thank you for considering this request. Your help is much appreciated.</p>\r\n<p>Kind regards,</p>\r\n<p>Daniel Barnes</p>');
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log_users`
--

DROP TABLE IF EXISTS `email_log_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_log_users` (
  `email_log_user_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email_log_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`email_log_user_id`),
  UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`),
  KEY `email_log_users_email_log_id` (`email_log_id`),
  KEY `email_log_users_user_id` (`user_id`),
  CONSTRAINT `email_log_users_email_log_id_foreign` FOREIGN KEY (`email_log_id`) REFERENCES `email_log` (`log_id`) ON DELETE CASCADE,
  CONSTRAINT `email_log_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb3 COMMENT='A record of users associated with an email log entry.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log_users`
--

LOCK TABLES `email_log_users` WRITE;
/*!40000 ALTER TABLE `email_log_users` DISABLE KEYS */;
INSERT INTO `email_log_users` VALUES (1,1,4),(2,2,19),(3,3,19),(4,4,12),(5,5,19),(6,6,1),(7,7,2),(8,8,3),(9,9,20),(10,11,20),(11,12,11),(12,13,12),(13,14,1),(14,15,2),(15,16,3),(16,17,21),(17,18,3),(18,19,22),(19,21,22),(20,22,9),(21,23,22),(22,24,11),(23,25,22),(24,26,22),(25,27,1),(26,28,2),(27,29,3),(28,30,23),(29,31,23),(30,32,8),(31,33,23),(32,34,12),(33,35,23),(34,36,23),(35,37,4),(36,38,24),(37,40,24),(38,41,3),(39,42,25),(40,44,25),(41,45,10),(42,46,25),(43,47,3),(44,48,1),(45,49,2),(46,50,3),(47,51,4),(48,52,26),(49,54,26),(50,55,1),(51,56,2),(52,57,3),(53,58,27),(54,59,1),(55,60,2),(56,61,3),(57,62,28),(58,63,28),(59,64,9),(60,65,28),(61,66,10),(62,67,12),(63,68,2),(64,69,2),(65,70,28),(66,71,10),(67,72,12),(68,73,1),(69,74,2),(70,75,3),(71,76,29),(72,78,29),(73,79,7),(74,80,8),(75,81,9),(76,82,2),(77,83,1),(78,84,2),(79,85,3),(80,86,30),(81,88,30),(82,89,8),(83,90,30),(84,91,10),(85,92,11),(86,93,12),(87,94,2),(88,95,2),(89,96,30),(90,97,10),(91,98,12),(92,99,3),(93,100,31),(94,102,31),(95,103,7),(96,104,31),(97,105,11),(98,106,31),(99,107,31),(100,108,1),(101,109,2),(102,110,3),(103,111,32),(104,112,32),(105,113,1),(106,114,2),(107,115,3),(108,116,33),(109,117,33),(110,118,10),(111,119,11),(112,120,12),(113,121,2),(114,122,1),(115,123,2),(116,124,3),(117,125,34),(118,127,34),(119,128,7),(120,129,8);
/*!40000 ALTER TABLE `email_log_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates` (
  `email_id` bigint NOT NULL AUTO_INCREMENT,
  `email_key` varchar(255) NOT NULL COMMENT 'Unique identifier for this email.',
  `context_id` bigint NOT NULL,
  `alternate_to` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email_templates_email_key` (`email_key`,`context_id`),
  KEY `email_templates_context_id` (`context_id`),
  KEY `email_templates_alternate_to` (`alternate_to`),
  CONSTRAINT `email_templates_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COMMENT='Custom email templates created by each context, and overrides of the default templates.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES (1,'COPYEDIT_REQUEST',1,'DISCUSSION_NOTIFICATION_COPYEDITING'),(2,'EDITOR_ASSIGN_SUBMISSION',1,'DISCUSSION_NOTIFICATION_SUBMISSION'),(3,'EDITOR_ASSIGN_REVIEW',1,'DISCUSSION_NOTIFICATION_REVIEW'),(4,'EDITOR_ASSIGN_PRODUCTION',1,'DISCUSSION_NOTIFICATION_PRODUCTION'),(5,'LAYOUT_REQUEST',1,'DISCUSSION_NOTIFICATION_PRODUCTION'),(6,'LAYOUT_COMPLETE',1,'DISCUSSION_NOTIFICATION_PRODUCTION'),(7,'INDEX_REQUEST',1,'DISCUSSION_NOTIFICATION_PRODUCTION'),(8,'INDEX_COMPLETE',1,'DISCUSSION_NOTIFICATION_PRODUCTION');
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default_data`
--

DROP TABLE IF EXISTS `email_templates_default_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates_default_data` (
  `email_templates_default_data_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email_key` varchar(255) NOT NULL COMMENT 'Unique identifier for this email.',
  `locale` varchar(14) NOT NULL DEFAULT 'en',
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text,
  PRIMARY KEY (`email_templates_default_data_id`),
  UNIQUE KEY `email_templates_default_data_unique` (`email_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb3 COMMENT='Default email templates created for every installed locale.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default_data`
--

LOCK TABLES `email_templates_default_data` WRITE;
/*!40000 ALTER TABLE `email_templates_default_data` DISABLE KEYS */;
INSERT INTO `email_templates_default_data` VALUES (1,'PASSWORD_RESET_CONFIRM','en','Password Reset Confirm','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),(3,'USER_REGISTER','en','User Created','Press Registration','{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$pressName}. We have included your username and password in this email, which are needed for all work with this press through its website. At any point, you can ask to be removed from the list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),(5,'USER_VALIDATE_CONTEXT','en','Validate Email (Press Registration)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$pressName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$pressSignature}'),(7,'USER_VALIDATE_SITE','en','Validate Email (Site)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$siteSignature}'),(9,'REVIEWER_REGISTER','en','Reviewer Register','Registration as Reviewer with {$pressName}','In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$pressName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the press through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),(11,'SUBMISSION_ACK','en','Submission Confirmation','Thank you for your submission to {$pressName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$pressName}. We have received your submission, {$submissionTitle}, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: {$authorSubmissionUrl}</p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Thank you for considering {$pressName} as a venue for your work.</p>{$pressSignature}'),(13,'SUBMISSION_ACK_NOT_USER','en','Submission Confirmation (Other Authors)','Submission confirmation','<p>Dear {$recipientName},</p><p>You have been named as a co-author on a submission to {$pressName}. The submitter, {$submitterName}, provided the following details:</p><p>{$submissionTitle}<br>{$authorsWithAffiliation}</p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering {$pressName} as a venue for your work.</p><p>Kind regards,</p>{$pressSignature}'),(15,'EDITOR_ASSIGN','en','Editor Assigned','You have been assigned as an editor on a submission to {$pressName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>If you find the submission to be relevant for {$pressName}, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$pressSignature}'),(17,'REVIEW_CANCEL','en','Reviewer Unassign','Request for Review Cancelled','{$recipientName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this review process in the future.<br />\n<br />\nIf you have any questions, please contact me.'),(19,'REVIEW_REINSTATE','en','Reviewer Reinstate','Can you still review something for {$pressName}?','<p>Dear {$recipientName},</p><p>We recently cancelled our request for you to review a submission, {$submissionTitle}, for {$pressName}. We\'ve reversed that decision and we hope that you are still able to conduct the review.</p><p>If you are able to assist with this submission\'s review, you can <a href=\"{$reviewAssignmentUrl}\">login to the press</a> to view the submission, upload review files, and submit your review request.</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p>{$signature}'),(21,'REVIEW_RESEND_REQUEST','en','Resend Review Request to Reviewer','Requesting your review again for {$pressName}','<p>Dear {$recipientName},</p><p>Recently, you declined our request to review a submission, {$submissionTitle}, for {$pressName}. I\'m writing to see if you are able to conduct the review after all.</p><p>We would be grateful if you\'re able to perform this review, but we understand if that is not possible at this time. Either way, please <a href=\"{$reviewAssignmentUrl}\">accept or decline the request</a> by {$responseDueDate}, so that we can find an alternate reviewer.</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p>{$signature}'),(23,'REVIEW_REQUEST','en','Review Request','Manuscript Review Request','<p>Dear {$recipientName},</p><p>I believe that you would serve as an excellent reviewer for a submission  to {$pressName}. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please <a href=\"{$reviewAssignmentUrl}\">accept or decline</a> the review by <b>{$responseDueDate}</b>.</p><p>You may contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}'),(25,'REVIEW_REQUEST_SUBSEQUENT','en','Review Request Subsequent','Request to review a revised submission','<p>Dear {$recipientName},</p><p>Thank you for your review of <a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a>. The authors have considered the reviewers\' feedback and have now submitted a revised version of their work. I\'m writing to ask if you would conduct a second round of peer review for this submission.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can <a href=\"{$reviewAssignmentUrl}\">follow the review steps</a> to view the submission, upload review files, and submit your review comments.<p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please <a href=\"{$reviewAssignmentUrl}\">accept or decline</a> the review by <b>{$responseDueDate}</b>.</p><p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}'),(27,'REVIEW_RESPONSE_OVERDUE_AUTO','en','Review Response Overdue (Automated)','Manuscript Review Request','Dear {$recipientName},<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$pressSignature}<br />\n'),(29,'REVIEW_CONFIRM','en','Review Confirm','Review accepted: {$reviewerName} accepted review assignment for #{$submissionId} {$authorsShort} — {$submissionTitle}','<p>Dear {$recipientName},</p><p>{$reviewerName} has accepted the following review:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — {$submissionTitle}</a><br /><b>Type:</b> {$reviewMethod}</p><p><b>Review Due:</b> {$reviewDueDate}</p><p>Login to <a href=\"{$submissionUrl}\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"{$pressUrl}\">{$pressName}</a>.'),(31,'REVIEW_DECLINE','en','Review Decline','Unable to Review','Editor(s):<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$senderName}'),(33,'REVIEW_ACK','en','Review Acknowledgement','Thank you for your review','<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, {$submissionTitle}, for {$pressName}. We appreciate your time and expertise in contributing to the quality of the work that we publish.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$pressName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>'),(35,'REVIEW_REMIND','en','Review Reminder','A reminder to please complete your review','<p>Dear {$recipientName},</p><p>Just a gentle reminder of our request for your review of the submission, \"{$submissionTitle},\" for {$pressName}. We were expecting to have this review by {$reviewDueDate} and we would be pleased to receive it as soon as you are able to prepare it.</p><p>You can <a href=\"{$reviewAssignmentUrl}\">login to the press</a> and follow the review steps to view the submission, upload review files, and submit your review comments.</p><p>If you need an extension of the deadline, please contact me. I look forward to hearing from you.</p><p>Thank you in advance and kind regards,</p>{$signature}'),(37,'REVIEW_REMIND_AUTO','en','Review Reminder (Automated)','A reminder to please complete your review','<p>Dear {$recipientName}:</p><p>This email is an automated reminder from {$pressName} in regards to our request for your review of the submission, \"{$submissionTitle}.\"</p><p>We were expecting to have this review by {$reviewDueDate} and we would be pleased to receive it as soon as you are able to prepare it.</p><p>Please <a href=\"{$reviewAssignmentUrl}\">login to the press</a> and follow the review steps to view the submission, upload review files, and submit your review comments.</p><p>If you need an extension of the deadline, please contact me. I look forward to hearing from you.</p><p>Thank you in advance and kind regards,</p>{$pressSignature}'),(39,'REVIEW_COMPLETE','en','Review Completed','Review complete: {$reviewerName} recommends {$reviewRecommendation} for #{$submissionId} {$authorsShort} — {$submissionTitle}','<p>Dear {$recipientName},</p><p>{$reviewerName} completed the following review:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — {$submissionTitle}</a><br /><b>Recommendation:</b> {$reviewRecommendation}<br /><b>Type:</b> {$reviewMethod}</p><p>Login to <a href=\"{$submissionUrl}\">view all files and comments</a> provided by this reviewer.</p>'),(41,'REVIEW_EDIT','en','Review Edited','Your review assignment has been changed for {$pressName}','<p>Dear {$recipientName},</p><p>An editor has made changes to your review assignment for {$pressName}. Please review the details below and let us know if you have any questions.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a><br /><b>Type:</b> {$reviewMethod}<br /><b>Accept or Decline By:</b> {$responseDueDate}<br /><b>Submit Review By:</b> {$reviewDueDate}</p><p>You can login to <a href=\"{$reviewAssignmentUrl}\">complete this review</a> at any time.</p>'),(43,'EDITOR_DECISION_ACCEPT','en','Submission Accepted','Your submission has been accepted to {$pressName}','<p>Dear {$recipientName},</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, {$submissionTitle}, to meet or exceed our expectations. We are excited to publish your piece in {$pressName} and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for {$pressName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),(45,'EDITOR_DECISION_SEND_TO_INTERNAL','en','Sent to Internal Review','Your submission has been sent for internal review','<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>'),(47,'EDITOR_DECISION_SEND_TO_EXTERNAL','en','Sent to Review','Your submission has been sent for review','<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>{$reviewTypeDescription} You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>'),(49,'EDITOR_DECISION_SEND_TO_PRODUCTION','en','Sent to Production','Next steps for publishing your submission','<p>Dear {$recipientName},</p><p>I am writing from {$pressName} to let you know that the editing of your submission, {$submissionTitle}, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),(51,'EDITOR_DECISION_REVISIONS','en','Revisions Requested','Your submission has been reviewed and we encourage you to submit revisions','<p>Dear {$recipientName},</p><p>Your submission {$submissionTitle} has been reviewed and we would like to encourage you to submit revisions that address the reviewers\' comments. An editor will review these revisions and if they address the concerns adequately, your submission may be accepted for publication.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point in the reviewers\' comments and identify what changes you have made. If you find any of the reviewer\'s comments to be unjustified or inappropriate, please explain your perspective.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments at your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),(53,'EDITOR_DECISION_RESUBMIT','en','Resubmit for Review','Your submission has been reviewed - please revise and resubmit','<p>Dear {$recipientName},</p><p>After reviewing your submission, {$submissionTitle}, the reviewers have recommended that your submission cannot be accepted for publication in its current form. However, we would like to encourage you to submit a revised version that addresses the reviewers\' comments. Your revisions will be reviewed by an editor and may be sent out for another round of peer review.</p><p>Please note that resubmitting your work does not guarantee that it will be accepted.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point and identify what changes you have made. If you find any of the reviewer\'s comments inappropriate, please explain your perspective. If you have questions about the recommendations in your review, please include these in your response.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments <a href=\"{$authorSubmissionUrl}\">at your submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),(55,'EDITOR_DECISION_DECLINE','en','Submission Declined','Your submission has been declined','<p>Dear {$recipientName},</p><p>While we appreciate receiving your submission, we are unable to accept {$submissionTitle} for publication on the basis of the comments from reviewers.</p><p>The reviewers\' comments are included at the bottom of this email.</p><p>Thank you for submitting to {$pressName}. Although it is disappointing to have a submission declined, I hope you find the reviewers\' comments to be constructive and helpful.</p><p>You are now free to submit the work elsewhere if you choose to do so.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),(57,'EDITOR_DECISION_INITIAL_DECLINE','en','Submission Declined (Pre-Review)','Your submission has been declined','<p>Dear {$recipientName},</p><p>I’m sorry to inform you that, after reviewing your submission, {$submissionTitle}, the editor has found that it does not meet our requirements for publication in {$pressName}.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p>{$signature}'),(59,'EDITOR_RECOMMENDATION','en','Recommendation Made','Editor Recommendation','<p>Dear {$recipientName},</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission {$submissionTitle}.</p><p>My recommendation is: {$recommendation}.</p><p>Please visit the submission\'s <a href=\"{$submissionUrl}\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>{$senderName}</p>'),(61,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','en','Notify Other Authors','An update regarding your submission','<p>The following email was sent to {$submittingAuthorName} from {$pressName} regarding {$submissionTitle}.</p>\n<p>You are receiving a copy of this notification because you are identified as an author of the submission. Any instructions in the message below are intended for the submitting author, {$submittingAuthorName}, and no action is required of you at this time.</p>\n\n{$messageToSubmittingAuthor}'),(63,'EDITOR_DECISION_NOTIFY_REVIEWERS','en','Notify Reviewers of Decision','Thank you for your review','<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, {$submissionTitle}, for {$pressName}. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>{$decisionDescription}</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$pressName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>'),(65,'EDITOR_DECISION_NEW_ROUND','en','New Review Round Initiated','Your submission has been sent for another round of review','<p>Dear {$recipientName},</p>\n<p>Your revised submission, {$submissionTitle}, has been sent for a new round of peer review. \nYou will hear from us with feedback from the reviewers and information about the next steps.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),(67,'EDITOR_DECISION_REVERT_DECLINE','en','Reinstate Declined Submission','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will complete the round of review and you will be notified when a \ndecision is made.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),(69,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','en','Reinstate Submission Declined Without Review','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will look further at your submission before deciding whether to decline \nthe submission or send it for review.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),(71,'EDITOR_DECISION_SKIP_REVIEW','en','Submission Accepted (Without Review)','Your submission has been sent for copyediting','<p>Dear {$recipientName},</p>\n<p>I am pleased to inform you that we have decided to accept your submission without peer review. We found your submission, {$submissionTitle}, to meet our expectations, and we do not require that work of this type undergo peer review. We are excited to publish your piece in {$pressName} and we thank you for choosing our press as a venue for your work.</p>\n<p>Your submission will soon be published on the press site for {$pressName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on your efforts.</p>\n<p>Your submission will now undergo copy editing and formatting to prepare it for publication. </p>\n<p>You will shortly receive further instructions.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),(73,'EDITOR_DECISION_BACK_FROM_PRODUCTION','en','Submission Sent Back to Copyediting','Your submission has been sent back to copyediting','<p>Dear {$recipientName},</p><p>Your submission, {$submissionTitle}, has been sent back to the copyediting stage, where it will undergo further copyediting and formatting to prepare it for publication.</p><p>Occasionally, a submission is sent to the production stage before it is ready for the final galleys to be prepared for publication. Your submission is still forthcoming. I apologize for any confusion.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We will contact you if we need any further assistance.</p><p>Kind regards,</p><p>{$signature}</p>'),(75,'EDITOR_DECISION_BACK_FROM_COPYEDITING','en','Submission Sent Back from Copyediting','Your submission has been sent back to review','<p>Dear {$recipientName},</p><p>Your submission, {$submissionTitle}, has been sent back to the review stage. It will undergo further review before it can be accepted for publication.</p><p>Occasionally, a decision to accept a submission will be recorded accidentally in our system and we must send it back to review. I apologize for any confusion this has caused. We will work to complete any further review quickly so that you have a final decision as soon as possible.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>'),(77,'EDITOR_DECISION_CANCEL_REVIEW_ROUND','en','Review Round Cancelled','A review round for your submission has been cancelled','<p>Dear {$recipientName},</p><p>We recently opened a new review round for your submission, {$submissionTitle}. We are closing this review round now.</p><p>Occasionally, a decision to open a round of review will be recorded accidentally in our system and we must cancel this review round. I apologize for any confusion this may have caused.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>'),(79,'REVISED_VERSION_NOTIFY','en','Revised Version Notification','Revised Version Uploaded','<p>Dear {$recipientName},</p><p>The author has uploaded revisions for the submission, <b>{$authorsShort} — {$submissionTitle}</b>. <p>As an assigned editor, we ask that you login and <a href=\"{$submissionUrl}\">view the revisions</a> and make a decision to accept, decline or send the submission for further review.</p><br><br>—<br>This is an automated message from <a href=\"{$pressUrl}\">{$pressName}</a>.'),(81,'STATISTICS_REPORT_NOTIFICATION','en','Statistics Report Notification','Editorial activity for {$month}, {$year}','\n{$recipientName}, <br />\n<br />\nYour press health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the press to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published book stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$pressSignature}'),(83,'ANNOUNCEMENT','en','New Announcement','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href=\"{$announcementUrl}\">full announcement</a>.'),(85,'DISCUSSION_NOTIFICATION_SUBMISSION','en','Discussion (Submission)','A message regarding {$pressName}','Please enter your message.'),(87,'DISCUSSION_NOTIFICATION_REVIEW','en','Discussion (Review)','A message regarding {$pressName}','Please enter your message.'),(89,'DISCUSSION_NOTIFICATION_COPYEDITING','en','Discussion (Copyediting)','A message regarding {$pressName}','Please enter your message.'),(91,'DISCUSSION_NOTIFICATION_PRODUCTION','en','Discussion (Production)','A message regarding {$pressName}','Please enter your message.'),(93,'COPYEDIT_REQUEST','en','Request Copyedit','Submission {$submissionId} is ready to be copyedited for {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready to be copyedited:</p><p><a href\"{$submissionUrl}\">{$submissionId} — {$submissionTitle}</a><br />{$pressName}</p><p>Please follow these steps to complete this task:</p><ol><li>Click on the Submission URL below.</li><li>Open any files available under Draft Files and edit the files. Use the Copyediting Discussions area if you need to contact the editor(s) or author(s).</li><li>Save the copyedited file(s) and upload them to the Copyedited panel.</li><li>Use the Copyediting Discussions to notify the editor(s) that all files have been prepared, and that the Production process may begin.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to {$pressName}.</p><p>Kind regards,</p>{$signature}'),(95,'EDITOR_ASSIGN_SUBMISSION','en','Assign Editor','You have been assigned as an editor on a submission to {$pressName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>If you find the submission to be relevant for {$pressName}, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$pressSignature}'),(97,'EDITOR_ASSIGN_REVIEW','en','Assign Editor','You have been assigned as an editor on a submission to {$pressName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the review stage.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the submission</a> and assign qualified reviewers. You can assign a reviewer by clicking \"Add Reviewer\".</p><p>Thank you in advance.</p><p>Kind regards,</p>{$signature}'),(99,'EDITOR_ASSIGN_PRODUCTION','en','Assign Editor','You have been assigned as an editor on a submission to {$pressName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the production stage.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the submission</a>. Once production-ready files are available, upload them under the <strong>Publication > Publication Formats</strong> section.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$signature}'),(101,'LAYOUT_REQUEST','en','Ready for Production','Submission {$submissionId} is ready for production at {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready for layout editing:</p><p><a href=\"{$submissionUrl}\">{$submissionId} {$submissionTitle}</a><br />{$pressName}</p><ol><li>Click on the Submission URL above.</li><li>Download the Production Ready files and use them to create the galleys according to the press\'s standards.</li><li>Upload the galleys to the Publication Formats section of the submission.</li><li>Use the Production Discussions to notify the editor that the galleys are ready.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.</p><p>Kind regards,</p>{$signature}'),(103,'LAYOUT_COMPLETE','en','Galleys Complete','Galleys Complete','<p>Dear {$recipientName},<p><p>Galleys have now been prepared for the following submission and are ready for final review.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$pressName}</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p><p>{$senderName}</p>'),(105,'INDEX_REQUEST','en','Index Requested','Request Index','{$recipientName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$pressName} now needs indexes created by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and use the Page Proofs file to create the galleys according to press standards.<br />\n3. Send the COMPLETE email to the editor.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.<br />\n<br />\n{$signature}'),(107,'INDEX_COMPLETE','en','Index Completed','Index Galleys Complete','{$recipientName}:<br />\n<br />\nIndexes have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$pressName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$senderName}'),(109,'VERSION_CREATED','en','Version Created','A new version was created for {$submissionTitle}','<p>Dear {$recipientName}, </p><p>This is an automated message to inform you that a new version of your submission, {$submissionTitle}, was created. You can view this version from your submission dashboard at the following link:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a></p><hr><p>This is an automatic email sent from <a href=\"{$pressUrl}\">{$pressName}</a>.</p>'),(111,'EDITORIAL_REMINDER','en','Editorial Reminder','Outstanding editorial tasks for {$pressName}','<p>Dear {$recipientName},</p><p>You are currently assigned to {$numberOfSubmissions} submissions in <a href=\"{$pressUrl}\">{$pressName}</a>. The following submissions are <b>waiting for your response</b>.</p>{$outstandingTasks}<p>View all of your assignments in your <a href=\"{$submissionsUrl}\">submission dashboard</a>.</p><p>If you have any questions about your assignments, please contact {$contactName} at {$contactEmail}.</p>'),(113,'SUBMISSION_SAVED_FOR_LATER','en','Submission Saved for Later','Resume your submission to {$pressName}','<p>Dear {$recipientName},</p><p>Your submission details have been saved in our system, but it has not yet been submitted for consideration. You can return to complete your submission at any time by following the link below.</p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — {$submissionTitle}</a></p><hr><p>This is an automated email from <a href=\"{$pressUrl}\">{$pressName}</a>.</p>'),(115,'SUBMISSION_NEEDS_EDITOR','en','Submission Needs Editor','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear {$recipientName},</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"{$pressUrl}\">{$pressName}</a>.</p>'),(117,'MANUAL_PAYMENT_NOTIFICATION','en','Manual Payment Notify','Manual Payment Notification','A manual payment needs to be processed for the press {$pressName} and the user {$senderName} (username &quot;{$senderUsername}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$paymentName}&quot;.<br />\nThe cost is {$paymentAmount} ({$paymentCurrencyCode}).<br />\n<br />\nThis email was generated by the Open Monograph Press Manual Payment plugin.'),(119,'PASSWORD_RESET_CONFIRM','fr_CA','Confirmation de la réinitialisation du mot de passe','Confirmation de réinitialisation du mot de passe','Nous avons reçu une requête de réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette requête, veuillez ignorer ce courriel et votre mot de passe demeurera le même. Si vous souhaitez modifier votre mot de passe, cliquez sur l\'adresse URL ci-dessous.<br />\n<br />\nModifier mon mot de passe: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),(120,'USER_REGISTER','fr_CA','Création de l\'utilisateur-trice','Inscription à la presse','{$recipientName}<br />\n<br />\nVous êtes désormais inscrit à la presse {$pressName}. Ce courriel contient votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin pour tous vos travaux au sein de la presse. Vous pouvez demander que l\'on retire votre nom de la liste des utilisateurs en tout temps. Il suffit de me contacter.<br />\n<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$signature}'),(121,'USER_VALIDATE_CONTEXT','fr_CA','','',''),(122,'USER_VALIDATE_SITE','fr_CA','Valider le courriel (site)','',''),(123,'REVIEWER_REGISTER','fr_CA','Inscription d\'une évaluateur-trice','Inscription à titre d\'évaluateur pour la presse {$pressName}','En raison de votre expertise, nous avons ajouté votre nom à notre base de données d\'évaluateurs pour la presse {$pressName}. Ceci ne vous oblige à rien, mais nous permet simplement de vous approcher si nous recevons une soumission que vous pourriez évaluer. Après avoir reçu une demande d\'évaluation, vous aurez la possibilité de lire le titre et le résumé de l\'article en question. Vous serez toujours libre d\'accepter ou de refuser l\'invitation. Vous pouvez demander que l\'on retire votre nom de notre liste d\'évaluateurs en tout temps.<br />\n<br />\nVoici votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin dans tous vos échanges avec la presse à travers son site Web. Vous pourriez, par exemple, mettre votre profil à jour, y compris vos champs d\'intérêt en ce qui concerne l\'évaluation des articles.<br />\n<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$signature}'),(124,'SUBMISSION_ACK','fr_CA','Confirmation de soumission','Accusé de réception de la soumission à {$pressName}','<p>{$recipientName},</p><p>Nous vous remercions d\'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$pressName}. Nous l\'avons bien reçu et un membre de notre équipe éditorial le prendre en charge sous peu. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d\'édition en accédant au site Web de la revue :</p>\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$pressSignature}'),(125,'SUBMISSION_ACK_NOT_USER','fr_CA','Confirmation de soumission (autres auteur-es)','Accusé de réception de la soumission','<p>Bonjour,</p><p>Le manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à la revue {$pressName}.</p><p>Si vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à la revue {$pressName} pour la publication de vos travaux.</p><p>Cordialement,</p>{$pressSignature}'),(126,'EDITOR_ASSIGN','fr_CA','Rédacteur-trice assigné','Travail éditorial','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; à la presse {$pressName} vous a été assignée. En tant que rédacteur en chef, vous devrez superviser le processus éditorial de cette soumission.<br />\n<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci,'),(127,'REVIEW_CANCEL','fr_CA','Évaluateur.trice non assigné.e','Annulation de la requête d\'évaluation','{$recipientName}:<br />\n<br />\n<br />\nNous avons décidé d\'annuler notre requête d\'évaluation pour la soumission &quot;{$submissionTitle}&quot; de la presse {$pressName}. Nous vous prions de nous excuser pour tout inconvénient que cette décision pourrait occasionner et nous espérons que vous serez en mesure d\'évaluer une soumission dans un avenir prochain.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à me contacter.'),(128,'REVIEW_REINSTATE','fr_CA','Évaluateur.trice réintégré.e','',''),(129,'REVIEW_RESEND_REQUEST','fr_CA','Envoyer de nouveau la demande d\'évaluation à l\'évaluateur-trice','Demande d\'évaluation réitérée pour {$pressName}','<p>{$recipientName},</p><p>Vous avez décliné récemment notre invitation à évaluer la soumission, {$submissionTitle}, pour {$pressName}. Je vous écris afin de vous demander si vous accepteriez de reconsidérer votre décision et d\'accepter de l\'évaluer.</p><p>Nous vous en serions très reconnaissant, mais nous comprenons également que vous soyez dans l\'impossibilité de le faire en ce moment. Quoi qu\'il en soit, pouvez-vous s\'il vous plait <a href=\"{$reviewAssignmentUrl}\">accepter ou approuver notre demande</a> avant le {$responseDueDate}.</p><p>Si vous avez des questions, n\'hésitez pas nous contacter.</p><p>Cordialement,</p>{$signature}'),(130,'REVIEW_REQUEST','fr_CA','Demande d\'évaluation','Requête d\'évaluation d\'un manuscrit','Bonjour {$recipientName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nVeuillez ouvrir une session sur le site Web de la presse d\'ici le {$responseDueDate} pour indiquer si vous serez en mesure d\'évaluer l\'article ou non. Ceci vous permettra également d\'accéder à la soumission, et de saisir votre évaluation et vos recommandations.<br />\n<br />\n<br />\nL\'évaluation doit être terminée d\'ici le {$reviewDueDate}.<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci de votre intérêt à évaluer des articles pour notre presse.<br />\n<br />\n{$signature}<br />\n'),(131,'REVIEW_REQUEST_SUBSEQUENT','fr_CA','Demande d\'évaluation (nouveau cycle)','',''),(132,'REVIEW_RESPONSE_OVERDUE_AUTO','fr_CA','Rappel automatique pour une invitation à évaluer','',''),(133,'REVIEW_CONFIRM','fr_CA','Évaluation confirmée','Acceptation d\'évaluation','Rédacteurs-trices,<br />\n<br />\nJe suis en mesure d\'évaluer la soumission intitulée « {$submissionTitle} » pour la revue {$pressName}. Je vous remercie d\'avoir pensé à moi. Je devrais être en mesure de compléter l\'évaluation pour la date du {$reviewDueDate}, voire avant.<br />\n<br />\n{$senderName}'),(134,'REVIEW_DECLINE','fr_CA','Évaluation refusée','Ne peux pas évaluer','Éditeurs:<br />\n<br />\nMalheureusement, je ne pourrai pas évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Merci de m\'avoir invité à évaluer cet article et n\'hésitez pas à me contacter dans un avenir prochain.<br />\n<br />\n{$senderName}'),(135,'REVIEW_ACK','fr_CA','Accusé de réception de l\'évaluation','Accusé de réception de l\'évaluation d\'une soumission','<p>{$recipientName},</p>\n<p>Nous vous remercions d\'avoir évaluer la soumission, {$submissionTitle}, pour {$pressName}. Nous apprécions l\'expertise et le temps que vous y avez consacrés et qui contribuent à la qualité des travaux que nous publions.</p>\n<p>Ce fut un plaisir de travailler avec vous et nous espérons avoir opportunité de le faire encore à l\'avenir.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>'),(136,'REVIEW_REMIND','fr_CA','Rappel d\'évaluation','Rappel d\'évaluation','{$recipientName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoyés par courriel. {$passwordLostUrl}<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Nous vous prions d\'agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$signature}'),(137,'REVIEW_REMIND_AUTO','fr_CA','Rappel automatique d\'évaluation','Rappel d\'évaluation','{$recipientName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Ce courriel a été généré et envoyé automatiquement parce que vous avez dépassé la date d\'échéance. Toutefois, nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoyés par courriel. {$passwordLostUrl}<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Veuillez agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$pressSignature}'),(138,'REVIEW_COMPLETE','fr_CA','Évaluation terminée','Évaluation terminée: {$reviewerName} recommande {$reviewRecommendation} pour #{$submissionId} {$authorsShort} — {$submissionTitle}','<p>{$recipientName},</p><p>{$reviewerName} a terminé son évaluation :</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — {$submissionTitle}</a><br /><b>Recommandation :</b> {$reviewRecommendation}<br /><b>Type :</b> {$reviewMethod}</p><p>Connectez-vous <a href=\"{$submissionUrl}\">afin de consulter les commentaires</a> de l\'évaluateur-trice.</p>'),(139,'REVIEW_EDIT','fr_CA','','','<p>{$recipientName},</p><p>Un-e rédacteur-trice a modifié l\'assignation de votre évaluation pour {$pressName}. S\'il vous plaît, consulter les détails ci-dessous et n\'hésitez pas à nous contacter si vous avez des questions.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a><br /><b>Type :</b> {$reviewMethod}<br /><b>Accepté ou rejeté avant le :</b> {$responseDueDate}<br /><b>Évaluation soumise avant le :</b> {$reviewDueDate}</p><p>Vous pouvez vous connectez afin de <a href=\"{$reviewAssignmentUrl}\">terminer cette évaluation</a>.</p>'),(140,'EDITOR_DECISION_ACCEPT','fr_CA','Soumission acceptée','Décision du rédacteur en chef','{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$pressName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}'),(141,'EDITOR_DECISION_SEND_TO_INTERNAL','fr_CA','','',''),(142,'EDITOR_DECISION_SEND_TO_EXTERNAL','fr_CA','Envoyé à l\'évaluation','Votre manuscrit a été envoyé en évaluation','<p>{$recipientName},</p><p>Nous sommes heureux de vous annoncer qu\'un-e redacteur-trice à évaluer votre manuscrit, {$submissionTitle}, et a décidé de l\'envoyer en évaluation. Un-e redacteur-trice identifiera des évaluateurs-trices qui feront des commentaires sur votre manuscrit.</p><p>{$reviewTypeDescription} Nous vous ferons part de leurs commentaires et vous informerons des prochaines étapes par la suite.</p><p>S\'il vous plait, prenez en considération que le fait d\'envoyer votre manuscrit en évaluation ne garantit en rien le fait d\'être publié. Nous prendrons en considération les recommandations des évaluateurs avant de décider de publier votre manuscrit.</p><p>Si vous avez des questions, vous pouvez nous contacter à partir de votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumission</a>.</p><p>{$signature}</p>'),(143,'EDITOR_DECISION_SEND_TO_PRODUCTION','fr_CA','Envoyé en production','Décision du rédacteur','<p>{$recipientName},</p><p>Je vous écris de la part de {$pressName} afin de vous confirmer que la révision de votre soumission, {$submissionTitle}, est terminée. Votre soumission sera envoyée à l\'étape de production, nous procéderons à la mise en page avant publication. Nous vous contacterons au besoin.</p><p>Si vous avez des questions, vous pouvez nous rejoindre à partir du <a href=\"{$authorSubmissionUrl}\">tableau de bord de votre soumission</a>.</p><p>Cordialement,</p>{$signature}'),(144,'EDITOR_DECISION_REVISIONS','fr_CA','Révisions demandées','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de vous demander d\'apporter des révisions à votre soumission.'),(145,'EDITOR_DECISION_RESUBMIT','fr_CA','Soumettez à nouveau pour évaluation','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de vous demander d\'apporter des révisions à votre soumission et de la soumettre à nouveau.'),(146,'EDITOR_DECISION_DECLINE','fr_CA','Soumission refusée','Décision du rédacteur','{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de refuser votre soumission.'),(147,'EDITOR_DECISION_INITIAL_DECLINE','fr_CA','Soumission refusée avant évaluation','Décision du rédacteur','<p>{$recipientName},</p><p>Nous avons le regret de vous informer qu\'après avoir évaluer votre manuscrit, {$submissionTitle}, le-la rédacteur-trice en a conclue qu\'il ne rencontre pas les exigences nécessaires pour être publier dans {$pressName}.</p><p>Cordialement,</p>{$signature}'),(148,'EDITOR_RECOMMENDATION','fr_CA','Recommandation émise','Recommandation du rédacteur','<p>{$recipientName},</p><p>Ma recommandation concernant la soumission « {$submissionTitle} » à la revue {$pressName} est de : {$recommendation}</p><p>S\'il vous plait, consulter la <a href=\"{$submissionUrl}\">page de la soumission</a> afin de donner suite à cette recommandation.</p><p>Cordialement,</p><p>{$senderName}</p>'),(149,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','fr_CA','Envoyer une notification aux autres auteur-es','Mise à jour concernant votre soumission','<p>Ce courriel a été envoyé à {$submittingAuthorName} par {$pressName} concernant {$submissionTitle}.</p>\n<p>Vous recevez une copie de cet avis car vous êtes identifié comme auteur-e de cette soumission. Toutes les instructions dans le message ci-dessous sont à l\'intention de l\'auteur-e de correspondance, {$submittingAuthorName}. </p><p>Aucune action n\'est attendue de votre part.</p>\n\n{$messageToSubmittingAuthor}'),(150,'EDITOR_DECISION_NOTIFY_REVIEWERS','fr_CA','Notifier les évaluateurs-trices de la décision','Décision éditoriale suite à votre évaluation','<p>{$recipientName},</p>\n<p>Nous vous remercions d\'avoir complété votre évaluation de la soumission, {$submissionTitle}, pour {$pressName}. Nous vous sommes reconnaissant pour votre temps et votre expertise qui contribue à la qualité des travaux que nous publions. Nous avons partagé vos commentaires avec l\'auteur-e, ainsi que ceux des autres évaluateurs-trices. </p>\n<p>En fonction des recommandations reçues, nous avons informé l\'auteur-e de notre décision qui est la suivante: </p>\n<p>{$decisionDescription}</p>\n<p>Votre recommandation a été prise en considération conjointement avec celles des autres évaluateurs-trices avant d\'en arriver à cette décision.</p>\n<p>Ce fut un plaisir de travailler avec vous à cette évaluation pour {$pressName}. Nous espérons avoir l\'opportunité de renouveler cette expérience avec vous à l\'avenir.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>'),(151,'EDITOR_DECISION_NEW_ROUND','fr_CA','Un nouveau cycle d\'évaluation a été lancé','Votre soumission fera l\'objet d\'un nouveau cycle d\'évaluation','<p>{$recipientName},</p>\n<p>Votre soumission révisée, {$submissionTitle}, fera l\'objet d\'un nouveau cycle d\'évaluation par les pairs. \nNous vous contacterons afin de vous faire part des commentaires des évaluateurs et vous fournir des informations sur les prochaines étapes.</p>\n<p>Si vous avec des questions, vous pouvez nous contacter à partir de votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumission</a>.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>\n'),(152,'EDITOR_DECISION_REVERT_DECLINE','fr_CA','Rétablir une soumission refusée','Nous avons renversé la décision de rejeter votre soumission','<p>{$recipientName},</p>\n<p>La décision de rejeter votre soumission, {$submissionTitle}, a été renversée. Un-e rédacteur-trice complétera le cycle d\'évaluation et vous serez informé-e lorsqu\'une décision éditoriale sera prise.</p>\n<p>Si vous avez des questions, vous pouvez nous contacter sur votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumissions</a>.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>\n'),(153,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','fr_CA','Rétablir une soumission refusée sans évaluation','Nous avons renversé la décision de rejeter votre soumission','<p>{$recipientName},</p>\n<p>La décision de rejeter votre soumission, {$submissionTitle}, a été renversée. Un-e rédacteur-trice consultera en détail votre soumission avant de décider de la rejeter ou de l\'envoyer en évaluation.</p>\n<p>Si vous avez des questions, vous pouvez nous contacter à partir de votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumission</a>.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>\n'),(154,'EDITOR_DECISION_SKIP_REVIEW','fr_CA','Soumission acceptée (sans évaluation)','',''),(155,'EDITOR_DECISION_BACK_FROM_PRODUCTION','fr_CA','Soumission renvoyée à la révision','Votre soumission a été renvoyée à l\'étape de révision','<p>{$recipientName},</p><p>Votre soumission, {$submissionTitle}, a été renvoyée à l\'étape de révision, où nous procéderons à des révisions supplémentaires ainsi qu\'à la mise en page en prévision de la publication.</p><p>Nous nous excusons pour la confusion que cette opération peut occasionner.</p><p>Si vous avez des questions, vous pouvez nous contacter à partir de votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumission</a>.</p><p>Cordialement,</p><p>{$signature}</p>'),(156,'EDITOR_DECISION_BACK_FROM_COPYEDITING','fr_CA','Soumission renvoyée de l\'étape de révision','Votre soumission a été renvoyée à l\'étape d\'évaluation.','<p>{$recipientName},</p><p>Votre soumission, {$submissionTitle}, a été renvoyée à l\'étape d\'évaluation. Elle sera réévaluée avant de pouvoir être acceptée.</p><p>Il peut arriver qu\'une décision d\'accepter une soumission soit prise par erreur dans notre système et qu\'elle doive être renvoyée à l\'étape d\'évaluation. Nous nous excusons cette la confusion. Nous allons faire en sorte de compléter le processus d\'évaluation rapidement afin de vous communiquer notre décision finale le plus tôt possible.</p><p>Nous vous contacterons au besoin.</p><p>Si vous avez des questions, n\'hésitez pas à nous contacter à partir de votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumission</a>.</p><p>Cordialement,</p><p>{$signature}</p>'),(157,'EDITOR_DECISION_CANCEL_REVIEW_ROUND','fr_CA','Cycle d\'évaluation annulé','Un cycle d\'évaluation de votre soumission a été annulé','<p>{$recipientName},</p><p>Nous avions déclenché un nouveau cycle d\'évaluation pour votre soumission, {$submissionTitle}. Nous fermons désormais ce cycle.</p><p>Nous nous excusons pour la confusion que cette action peut occasionner. </p><p>Nous vous contacterons si nous avons besoin d\'une aide supplémentaire de votre part.</p><p>Si vous avez des questions, vous pouvez nous contacter à partir de votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumissions</a></p>.<p>Kind regards,</p><p>{$signature}</p>'),(158,'REVISED_VERSION_NOTIFY','fr_CA','Notification de la version révisée','',''),(159,'STATISTICS_REPORT_NOTIFICATION','fr_CA','Notification sur les rapports statistiques','',''),(160,'ANNOUNCEMENT','fr_CA','Nouvelle annonce','',''),(161,'DISCUSSION_NOTIFICATION_SUBMISSION','fr_CA','Discussion (soumission)','Un message à propos de la revue {$pressName}','Prière de saisir votre message.'),(162,'DISCUSSION_NOTIFICATION_REVIEW','fr_CA','Discussion (évaluation)','Un message à propos de la revue {$pressName}','Prière de saisir votre message.'),(163,'DISCUSSION_NOTIFICATION_COPYEDITING','fr_CA','Discussion (révision)','Un message à propos de la revue {$pressName}','Prière de saisir votre message.'),(164,'DISCUSSION_NOTIFICATION_PRODUCTION','fr_CA','Discussion (production)','Un message à propos de la revue {$pressName}','Prière de saisir votre message.'),(165,'COPYEDIT_REQUEST','fr_CA','Demande de révision','Demande de révision d\'une soumission','{$recipientName},<br />\n<br />\nJ\'aimerais que vous effectuiez la révision du manuscrit intitulé « {$submissionTitle} » pour la revue {$pressName} à l\'aide des étapes suivantes.<br />\n1. Cliquer sur l\'URL de la soumission ci-dessous.<br />\n2. Ouvrir le(s) fichier(s) disponible(s) sous Fichiers des ébauches finales et effectuer votre révision, tout en ajoutant des discussions sur la révision, le cas échéant.<br />\n3. Enregistrer le(s) fichier(s) révisé(s) et le(s) téléverser dans la section Version(s) révisée(s).<br />\n4. Informer le,la rédacteur-trice que tous les fichiers ont été révisés et que l\'étape de production peut débuter.<br />\n<br />\nURL de la revue {$pressName} : {$pressUrl}<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}'),(166,'EDITOR_ASSIGN_SUBMISSION','fr_CA','Assigner un-e rédacteur-trice','Travail éditorial','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; à la presse {$pressName} vous a été assignée. En tant que rédacteur en chef, vous devrez superviser le processus éditorial de cette soumission.<br />\n<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci,'),(167,'EDITOR_ASSIGN_REVIEW','fr_CA','Assigner un-e rédacteur-trice','Travail éditorial',''),(168,'EDITOR_ASSIGN_PRODUCTION','fr_CA','Assigner un-e rédacteur-trice','Travail éditorial',''),(169,'LAYOUT_REQUEST','fr_CA','Prêt pour production','Requête des épreuves en placard','{$recipientName}:<br />\n<br />\nIl faut maintenant préparer les épreuves en placard de la soumission &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Pour ce faire, veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez le fichier Version de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir contribué à cette presse.'),(170,'LAYOUT_COMPLETE','fr_CA','','Épreuves en placard complétées','{$recipientName}:<br />\n<br />\nLes épreuves en placard du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$pressName} ont été préparées et peuvent être révisées.<br />\n<br />\nSi vous avez questions, n\'hésitez pas à me contacter.<br />\n<br />\n{$senderName}'),(171,'INDEX_REQUEST','fr_CA','','Requête d\'indexage','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; par la presse {$pressName} doit désormais être indexée. Veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez les fichiers d\'épreuves de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir contribué à cette presse.<br />\n<br />\n{$signature}'),(172,'INDEX_COMPLETE','fr_CA','','Indexage des épreuves en placard complété','{$recipientName}:<br />\n<br />\nLes index du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$pressName} sont prêts et peuvent être révisés.<br />\n<br />\nSi vous avez questions, n\'hésitez pas à me contacter.<br />\n<br />\n{$signatureFullName}'),(173,'VERSION_CREATED','fr_CA','Version créée','Une nouvelle version a été créée pour {$submissionTitle}','<p>{$recipientName}, </p><p>Ceci est un courriel automatique de <a href=\"{$pressUrl}\">{$pressName}</a> pour vous informer qu\'une nouvelle version de votre soumission, {$submissionTitle}, a été créée. Vous pouvez consulter cette version à partir de votre tableau de bord de soumission:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a></p><hr>'),(174,'EDITORIAL_REMINDER','fr_CA','Rappel éditorial','Tâches éditoriales en attente pour {$pressName}','<p>$recipientName}, </p><p>Vous êtes présentement assigné-e à {$numberOfSubmissions} soumissions dans <a href=\"{$pressUrl}\">{$journalName}</a>. Des actions sont <b>attendues de votre part pour ces soumissions</b>.</p>{$outstandingTasks}<p>Vous pouvez consulter toutes vos soumissions dans votre <a href=\"{$submissionsUrl}\">tableau de bord des soumissions</a>.</p><p>Si vous avez des questions, contactez {$contactName} par courriel à l’adresse: {$contactEmail}. </p>'),(175,'SUBMISSION_SAVED_FOR_LATER','fr_CA','Soumission incomplète sauvegardée','Reprendre votre soumission à {$pressName}','<p>{$recipientName},</p><p>Les détails de votre soumission ont été enregistrés, mais vous ne l\'avez pas encore finalisée. Vous pouvez le faire en cliquant sur le lien ci-dessous: </p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — {$submissionTitle}</a></p><hr><p>Ceci est un message automatique de <a href=\"{$pressUrl}\">{$pressName}</a>.</p>'),(176,'SUBMISSION_NEEDS_EDITOR','fr_CA','Soumission en attente de rédacteur-trice','Un-e rédacteur-trice doit être assigné-e à la nouvelle soumission : {$submissionTitle}','<p>{$recipientName},</p><p>La soumission suivante a été soumise et aucun-e rédacteur-trice ne lui est assigné-e.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>S\'il vous plait, assignez un-e rédacteur-trice qui sera responsable de la soumission. </p><hr><p>Ceci est un courriel automatique de <a href=\"{$pressUrl}\">{$pressName}</a>.</p>'),(177,'MANUAL_PAYMENT_NOTIFICATION','fr_CA','','','');
/*!40000 ALTER TABLE `email_templates_default_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_settings`
--

DROP TABLE IF EXISTS `email_templates_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates_settings` (
  `email_template_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`email_template_setting_id`),
  UNIQUE KEY `email_templates_settings_unique` (`email_id`,`locale`,`setting_name`),
  KEY `email_templates_settings_email_id` (`email_id`),
  CONSTRAINT `email_templates_settings_email_id` FOREIGN KEY (`email_id`) REFERENCES `email_templates` (`email_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about custom email templates, including localized properties such as the subject and body.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_settings`
--

LOCK TABLES `email_templates_settings` WRITE;
/*!40000 ALTER TABLE `email_templates_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log`
--

DROP TABLE IF EXISTS `event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_log` (
  `log_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL COMMENT 'NULL if it''s system or automated event',
  `date_logged` datetime NOT NULL,
  `event_type` bigint DEFAULT NULL,
  `message` text,
  `is_translated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `event_log_user_id` (`user_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `event_log_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=524 DEFAULT CHARSET=utf8mb3 COMMENT='A log of all events related to an object like a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,19,'2025-12-17 05:18:24',268435458,'submission.event.general.metadataUpdated',0),(2,1048585,1,19,'2025-12-17 05:18:24',268435458,'submission.event.general.metadataUpdated',0),(3,515,1,19,'2025-12-17 05:18:26',1342177281,'submission.event.fileUploaded',0),(4,1048585,1,19,'2025-12-17 05:18:26',1342177288,'submission.event.fileRevised',0),(5,515,1,19,'2025-12-17 05:18:26',1342177296,'submission.event.fileEdited',0),(6,515,2,19,'2025-12-17 05:18:26',1342177281,'submission.event.fileUploaded',0),(7,1048585,1,19,'2025-12-17 05:18:26',1342177288,'submission.event.fileRevised',0),(8,515,2,19,'2025-12-17 05:18:27',1342177296,'submission.event.fileEdited',0),(9,515,3,19,'2025-12-17 05:18:27',1342177281,'submission.event.fileUploaded',0),(10,1048585,1,19,'2025-12-17 05:18:27',1342177288,'submission.event.fileRevised',0),(11,515,3,19,'2025-12-17 05:18:27',1342177296,'submission.event.fileEdited',0),(12,1048585,1,19,'2025-12-17 05:18:41',268435457,'submission.event.submissionSubmitted',0),(13,1048585,1,3,'2025-12-17 05:18:48',805306371,'editor.submission.decision.sendExternalReview.log',0),(14,515,4,3,'2025-12-17 05:18:48',1342177281,'submission.event.fileUploaded',0),(15,1048585,1,3,'2025-12-17 05:18:48',1342177288,'submission.event.fileRevised',0),(16,515,5,3,'2025-12-17 05:18:48',1342177281,'submission.event.fileUploaded',0),(17,1048585,1,3,'2025-12-17 05:18:48',1342177288,'submission.event.fileRevised',0),(18,515,6,3,'2025-12-17 05:18:48',1342177281,'submission.event.fileUploaded',0),(19,1048585,1,3,'2025-12-17 05:18:48',1342177288,'submission.event.fileRevised',0),(20,1048585,1,3,'2025-12-17 05:18:55',1073741825,'log.review.reviewerAssigned',0),(21,1048585,1,3,'2025-12-17 05:18:58',805306371,'editor.submission.decision.accept.log',0),(22,1048585,1,3,'2025-12-17 05:19:02',268435459,'submission.event.participantAdded',0),(23,1048585,2,20,'2025-12-17 05:19:09',268435458,'submission.event.general.metadataUpdated',0),(24,1048585,2,20,'2025-12-17 05:19:09',268435458,'submission.event.general.metadataUpdated',0),(25,515,7,20,'2025-12-17 05:19:18',1342177281,'submission.event.fileUploaded',0),(26,1048585,2,20,'2025-12-17 05:19:18',1342177288,'submission.event.fileRevised',0),(27,515,7,20,'2025-12-17 05:19:18',1342177296,'submission.event.fileEdited',0),(28,1048585,2,20,'2025-12-17 05:19:19',268435458,'submission.event.general.metadataUpdated',0),(29,515,8,20,'2025-12-17 05:19:19',1342177281,'submission.event.fileUploaded',0),(30,1048585,2,20,'2025-12-17 05:19:19',1342177288,'submission.event.fileRevised',0),(31,515,8,20,'2025-12-17 05:19:19',1342177296,'submission.event.fileEdited',0),(32,515,9,20,'2025-12-17 05:19:20',1342177281,'submission.event.fileUploaded',0),(33,1048585,2,20,'2025-12-17 05:19:20',1342177288,'submission.event.fileRevised',0),(34,515,9,20,'2025-12-17 05:19:20',1342177296,'submission.event.fileEdited',0),(35,515,10,20,'2025-12-17 05:19:21',1342177281,'submission.event.fileUploaded',0),(36,1048585,2,20,'2025-12-17 05:19:21',1342177288,'submission.event.fileRevised',0),(37,515,10,20,'2025-12-17 05:19:21',1342177296,'submission.event.fileEdited',0),(38,515,11,20,'2025-12-17 05:19:22',1342177281,'submission.event.fileUploaded',0),(39,1048585,2,20,'2025-12-17 05:19:22',1342177288,'submission.event.fileRevised',0),(40,515,11,20,'2025-12-17 05:19:22',1342177296,'submission.event.fileEdited',0),(41,515,11,20,'2025-12-17 05:19:23',1342177282,'submission.event.fileDeleted',0),(42,1048585,2,20,'2025-12-17 05:19:23',1342177282,'submission.event.fileDeleted',0),(43,1048585,2,20,'2025-12-17 05:20:25',268435457,'submission.event.submissionSubmitted',0),(44,1048585,2,3,'2025-12-17 05:20:37',805306371,'editor.submission.decision.sendExternalReview.log',0),(45,515,12,3,'2025-12-17 05:20:38',1342177281,'submission.event.fileUploaded',0),(46,1048585,2,3,'2025-12-17 05:20:38',1342177288,'submission.event.fileRevised',0),(47,515,13,3,'2025-12-17 05:20:38',1342177281,'submission.event.fileUploaded',0),(48,1048585,2,3,'2025-12-17 05:20:38',1342177288,'submission.event.fileRevised',0),(49,515,14,3,'2025-12-17 05:20:38',1342177281,'submission.event.fileUploaded',0),(50,1048585,2,3,'2025-12-17 05:20:38',1342177288,'submission.event.fileRevised',0),(51,515,15,3,'2025-12-17 05:20:38',1342177281,'submission.event.fileUploaded',0),(52,1048585,2,3,'2025-12-17 05:20:38',1342177288,'submission.event.fileRevised',0),(53,1048585,2,3,'2025-12-17 05:20:46',1073741825,'log.review.reviewerAssigned',0),(54,1048585,2,3,'2025-12-17 05:20:53',1073741825,'log.review.reviewerAssigned',0),(55,1048585,3,21,'2025-12-17 05:20:59',268435458,'submission.event.general.metadataUpdated',0),(56,1048585,3,21,'2025-12-17 05:21:00',268435458,'submission.event.general.metadataUpdated',0),(57,515,16,21,'2025-12-17 05:21:01',1342177281,'submission.event.fileUploaded',0),(58,1048585,3,21,'2025-12-17 05:21:01',1342177288,'submission.event.fileRevised',0),(59,515,16,21,'2025-12-17 05:21:01',1342177296,'submission.event.fileEdited',0),(60,515,17,21,'2025-12-17 05:21:02',1342177281,'submission.event.fileUploaded',0),(61,1048585,3,21,'2025-12-17 05:21:02',1342177288,'submission.event.fileRevised',0),(62,515,17,21,'2025-12-17 05:21:02',1342177296,'submission.event.fileEdited',0),(63,515,18,21,'2025-12-17 05:21:02',1342177281,'submission.event.fileUploaded',0),(64,1048585,3,21,'2025-12-17 05:21:02',1342177288,'submission.event.fileRevised',0),(65,515,18,21,'2025-12-17 05:21:03',1342177296,'submission.event.fileEdited',0),(66,515,19,21,'2025-12-17 05:21:03',1342177281,'submission.event.fileUploaded',0),(67,1048585,3,21,'2025-12-17 05:21:03',1342177288,'submission.event.fileRevised',0),(68,515,19,21,'2025-12-17 05:21:03',1342177296,'submission.event.fileEdited',0),(69,515,20,21,'2025-12-17 05:21:04',1342177281,'submission.event.fileUploaded',0),(70,1048585,3,21,'2025-12-17 05:21:04',1342177288,'submission.event.fileRevised',0),(71,515,20,21,'2025-12-17 05:21:04',1342177296,'submission.event.fileEdited',0),(72,1048585,3,21,'2025-12-17 05:21:29',268435457,'submission.event.submissionSubmitted',0),(73,1048585,4,22,'2025-12-17 05:21:35',268435458,'submission.event.general.metadataUpdated',0),(74,1048585,4,22,'2025-12-17 05:21:36',268435458,'submission.event.general.metadataUpdated',0),(75,515,21,22,'2025-12-17 05:21:37',1342177281,'submission.event.fileUploaded',0),(76,1048585,4,22,'2025-12-17 05:21:37',1342177288,'submission.event.fileRevised',0),(77,515,21,22,'2025-12-17 05:21:37',1342177296,'submission.event.fileEdited',0),(78,515,22,22,'2025-12-17 05:21:38',1342177281,'submission.event.fileUploaded',0),(79,1048585,4,22,'2025-12-17 05:21:38',1342177288,'submission.event.fileRevised',0),(80,515,22,22,'2025-12-17 05:21:38',1342177296,'submission.event.fileEdited',0),(81,515,23,22,'2025-12-17 05:21:38',1342177281,'submission.event.fileUploaded',0),(82,1048585,4,22,'2025-12-17 05:21:38',1342177288,'submission.event.fileRevised',0),(83,515,23,22,'2025-12-17 05:21:39',1342177296,'submission.event.fileEdited',0),(84,515,24,22,'2025-12-17 05:21:39',1342177281,'submission.event.fileUploaded',0),(85,1048585,4,22,'2025-12-17 05:21:39',1342177288,'submission.event.fileRevised',0),(86,515,24,22,'2025-12-17 05:21:39',1342177296,'submission.event.fileEdited',0),(87,1048585,4,22,'2025-12-17 05:22:00',268435457,'submission.event.submissionSubmitted',0),(88,1048585,4,3,'2025-12-17 05:22:07',805306371,'editor.submission.decision.sendInternalReview.log',0),(89,515,25,3,'2025-12-17 05:22:08',1342177281,'submission.event.fileUploaded',0),(90,1048585,4,3,'2025-12-17 05:22:08',1342177288,'submission.event.fileRevised',0),(91,515,26,3,'2025-12-17 05:22:08',1342177281,'submission.event.fileUploaded',0),(92,1048585,4,3,'2025-12-17 05:22:08',1342177288,'submission.event.fileRevised',0),(93,515,27,3,'2025-12-17 05:22:08',1342177281,'submission.event.fileUploaded',0),(94,1048585,4,3,'2025-12-17 05:22:08',1342177288,'submission.event.fileRevised',0),(95,515,28,3,'2025-12-17 05:22:08',1342177281,'submission.event.fileUploaded',0),(96,1048585,4,3,'2025-12-17 05:22:08',1342177288,'submission.event.fileRevised',0),(97,1048585,4,3,'2025-12-17 05:22:15',1073741825,'log.review.reviewerAssigned',0),(98,1048585,4,3,'2025-12-17 05:22:18',805306371,'editor.submission.decision.sendExternalReview.log',0),(99,1048585,4,3,'2025-12-17 05:22:25',1073741825,'log.review.reviewerAssigned',0),(100,1048585,4,3,'2025-12-17 05:22:28',805306371,'editor.submission.decision.accept.log',0),(101,1048585,4,3,'2025-12-17 05:22:33',268435459,'submission.event.participantAdded',0),(102,1048585,4,3,'2025-12-17 05:22:36',805306371,'editor.submission.decision.sendToProduction.log',0),(103,1048585,4,3,'2025-12-17 05:22:42',268435459,'submission.event.participantAdded',0),(104,1048585,4,3,'2025-12-17 05:22:46',268435474,'submission.event.publicationFormatCreated',NULL),(105,1048585,5,23,'2025-12-17 05:22:54',268435458,'submission.event.general.metadataUpdated',0),(106,1048585,5,23,'2025-12-17 05:22:54',268435458,'submission.event.general.metadataUpdated',0),(107,515,29,23,'2025-12-17 05:22:55',1342177281,'submission.event.fileUploaded',0),(108,1048585,5,23,'2025-12-17 05:22:55',1342177288,'submission.event.fileRevised',0),(109,515,29,23,'2025-12-17 05:22:55',1342177296,'submission.event.fileEdited',0),(110,515,30,23,'2025-12-17 05:22:56',1342177281,'submission.event.fileUploaded',0),(111,1048585,5,23,'2025-12-17 05:22:56',1342177288,'submission.event.fileRevised',0),(112,515,30,23,'2025-12-17 05:22:56',1342177296,'submission.event.fileEdited',0),(113,515,31,23,'2025-12-17 05:22:57',1342177281,'submission.event.fileUploaded',0),(114,1048585,5,23,'2025-12-17 05:22:57',1342177288,'submission.event.fileRevised',0),(115,515,31,23,'2025-12-17 05:22:57',1342177296,'submission.event.fileEdited',0),(116,515,32,23,'2025-12-17 05:22:58',1342177281,'submission.event.fileUploaded',0),(117,1048585,5,23,'2025-12-17 05:22:58',1342177288,'submission.event.fileRevised',0),(118,515,32,23,'2025-12-17 05:22:58',1342177296,'submission.event.fileEdited',0),(119,515,33,23,'2025-12-17 05:22:58',1342177281,'submission.event.fileUploaded',0),(120,1048585,5,23,'2025-12-17 05:22:58',1342177288,'submission.event.fileRevised',0),(121,515,33,23,'2025-12-17 05:22:58',1342177296,'submission.event.fileEdited',0),(122,515,34,23,'2025-12-17 05:22:59',1342177281,'submission.event.fileUploaded',0),(123,1048585,5,23,'2025-12-17 05:22:59',1342177288,'submission.event.fileRevised',0),(124,515,34,23,'2025-12-17 05:22:59',1342177296,'submission.event.fileEdited',0),(125,1048585,5,23,'2025-12-17 05:23:29',268435457,'submission.event.submissionSubmitted',0),(126,1048585,5,3,'2025-12-17 05:23:37',805306371,'editor.submission.decision.sendInternalReview.log',0),(127,515,35,3,'2025-12-17 05:23:37',1342177281,'submission.event.fileUploaded',0),(128,1048585,5,3,'2025-12-17 05:23:37',1342177288,'submission.event.fileRevised',0),(129,515,36,3,'2025-12-17 05:23:37',1342177281,'submission.event.fileUploaded',0),(130,1048585,5,3,'2025-12-17 05:23:37',1342177288,'submission.event.fileRevised',0),(131,515,37,3,'2025-12-17 05:23:38',1342177281,'submission.event.fileUploaded',0),(132,1048585,5,3,'2025-12-17 05:23:38',1342177288,'submission.event.fileRevised',0),(133,515,38,3,'2025-12-17 05:23:38',1342177281,'submission.event.fileUploaded',0),(134,1048585,5,3,'2025-12-17 05:23:38',1342177288,'submission.event.fileRevised',0),(135,515,39,3,'2025-12-17 05:23:38',1342177281,'submission.event.fileUploaded',0),(136,1048585,5,3,'2025-12-17 05:23:38',1342177288,'submission.event.fileRevised',0),(137,515,40,3,'2025-12-17 05:23:38',1342177281,'submission.event.fileUploaded',0),(138,1048585,5,3,'2025-12-17 05:23:38',1342177288,'submission.event.fileRevised',0),(139,1048585,5,3,'2025-12-17 05:23:45',1073741825,'log.review.reviewerAssigned',0),(140,1048585,5,3,'2025-12-17 05:23:48',805306371,'editor.submission.decision.sendExternalReview.log',0),(141,1048585,5,3,'2025-12-17 05:23:55',1073741825,'log.review.reviewerAssigned',0),(142,1048585,5,3,'2025-12-17 05:23:59',805306371,'editor.submission.decision.accept.log',0),(143,1048585,5,3,'2025-12-17 05:24:03',268435459,'submission.event.participantAdded',0),(144,1048585,5,3,'2025-12-17 05:24:07',805306371,'editor.submission.decision.sendToProduction.log',0),(145,1048585,5,3,'2025-12-17 05:24:13',268435459,'submission.event.participantAdded',0),(146,1048585,5,3,'2025-12-17 05:24:16',268435459,'submission.event.participantAdded',0),(147,1048585,5,3,'2025-12-17 05:24:20',268435474,'submission.event.publicationFormatCreated',NULL),(148,515,41,3,'2025-12-17 05:24:23',1342177281,'submission.event.fileUploaded',0),(149,1048585,5,3,'2025-12-17 05:24:23',1342177288,'submission.event.fileRevised',0),(150,1048585,5,3,'2025-12-17 05:24:24',268435464,'submission.event.publicationFormatPublished',0),(151,1048585,5,3,'2025-12-17 05:24:25',268435476,'submission.event.publicationFormatMadeAvailable',0),(152,515,41,3,'2025-12-17 05:24:26',1342177296,'submission.event.fileEdited',0),(153,515,41,3,'2025-12-17 05:24:26',1342177287,'submission.event.signoffSignoff',0),(154,515,41,3,'2025-12-17 05:24:28',1342177296,'submission.event.fileEdited',0),(155,1048585,5,3,'2025-12-17 05:24:30',268435462,'publication.event.published',0),(156,1048585,5,3,'2025-12-17 05:24:35',268435463,'publication.event.unpublished',0),(157,1048585,5,3,'2025-12-17 05:24:40',268435462,'publication.event.published',0),(158,1048585,6,24,'2025-12-17 05:24:45',268435458,'submission.event.general.metadataUpdated',0),(159,1048585,6,24,'2025-12-17 05:24:46',268435458,'submission.event.general.metadataUpdated',0),(160,515,42,24,'2025-12-17 05:24:47',1342177281,'submission.event.fileUploaded',0),(161,1048585,6,24,'2025-12-17 05:24:47',1342177288,'submission.event.fileRevised',0),(162,515,42,24,'2025-12-17 05:24:47',1342177296,'submission.event.fileEdited',0),(163,515,43,24,'2025-12-17 05:24:48',1342177281,'submission.event.fileUploaded',0),(164,1048585,6,24,'2025-12-17 05:24:48',1342177288,'submission.event.fileRevised',0),(165,515,43,24,'2025-12-17 05:24:48',1342177296,'submission.event.fileEdited',0),(166,515,44,24,'2025-12-17 05:24:49',1342177281,'submission.event.fileUploaded',0),(167,1048585,6,24,'2025-12-17 05:24:49',1342177288,'submission.event.fileRevised',0),(168,515,44,24,'2025-12-17 05:24:49',1342177296,'submission.event.fileEdited',0),(169,515,45,24,'2025-12-17 05:24:49',1342177281,'submission.event.fileUploaded',0),(170,1048585,6,24,'2025-12-17 05:24:49',1342177288,'submission.event.fileRevised',0),(171,515,45,24,'2025-12-17 05:24:50',1342177296,'submission.event.fileEdited',0),(172,1048585,6,24,'2025-12-17 05:25:10',268435457,'submission.event.submissionSubmitted',0),(173,1048585,6,3,'2025-12-17 05:25:18',805306371,'editor.submission.decision.sendInternalReview.log',0),(174,515,46,3,'2025-12-17 05:25:18',1342177281,'submission.event.fileUploaded',0),(175,1048585,6,3,'2025-12-17 05:25:18',1342177288,'submission.event.fileRevised',0),(176,515,47,3,'2025-12-17 05:25:18',1342177281,'submission.event.fileUploaded',0),(177,1048585,6,3,'2025-12-17 05:25:18',1342177288,'submission.event.fileRevised',0),(178,515,48,3,'2025-12-17 05:25:18',1342177281,'submission.event.fileUploaded',0),(179,1048585,6,3,'2025-12-17 05:25:18',1342177288,'submission.event.fileRevised',0),(180,515,49,3,'2025-12-17 05:25:18',1342177281,'submission.event.fileUploaded',0),(181,1048585,6,3,'2025-12-17 05:25:18',1342177288,'submission.event.fileRevised',0),(182,1048585,6,3,'2025-12-17 05:25:22',268435459,'submission.event.participantAdded',0),(183,1048585,6,3,'2025-12-17 05:25:26',268435459,'submission.event.participantAdded',0),(184,1048585,6,6,'2025-12-17 05:25:34',805306372,'editor.submission.recommend.accept.log',0),(185,1048585,7,25,'2025-12-17 05:25:45',268435458,'submission.event.general.metadataUpdated',0),(186,1048585,7,25,'2025-12-17 05:25:45',268435458,'submission.event.general.metadataUpdated',0),(187,515,50,25,'2025-12-17 05:25:46',1342177281,'submission.event.fileUploaded',0),(188,1048585,7,25,'2025-12-17 05:25:46',1342177288,'submission.event.fileRevised',0),(189,515,50,25,'2025-12-17 05:25:47',1342177296,'submission.event.fileEdited',0),(190,515,51,25,'2025-12-17 05:25:47',1342177281,'submission.event.fileUploaded',0),(191,1048585,7,25,'2025-12-17 05:25:47',1342177288,'submission.event.fileRevised',0),(192,515,51,25,'2025-12-17 05:25:47',1342177296,'submission.event.fileEdited',0),(193,515,52,25,'2025-12-17 05:25:48',1342177281,'submission.event.fileUploaded',0),(194,1048585,7,25,'2025-12-17 05:25:48',1342177288,'submission.event.fileRevised',0),(195,515,52,25,'2025-12-17 05:25:48',1342177296,'submission.event.fileEdited',0),(196,515,53,25,'2025-12-17 05:25:49',1342177281,'submission.event.fileUploaded',0),(197,1048585,7,25,'2025-12-17 05:25:49',1342177288,'submission.event.fileRevised',0),(198,515,53,25,'2025-12-17 05:25:49',1342177296,'submission.event.fileEdited',0),(199,515,54,25,'2025-12-17 05:25:50',1342177281,'submission.event.fileUploaded',0),(200,1048585,7,25,'2025-12-17 05:25:50',1342177288,'submission.event.fileRevised',0),(201,515,54,25,'2025-12-17 05:25:50',1342177296,'submission.event.fileEdited',0),(202,1048585,7,25,'2025-12-17 05:26:16',268435457,'submission.event.submissionSubmitted',0),(203,1048585,7,3,'2025-12-17 05:26:25',805306371,'editor.submission.decision.sendExternalReview.log',0),(204,515,55,3,'2025-12-17 05:26:25',1342177281,'submission.event.fileUploaded',0),(205,1048585,7,3,'2025-12-17 05:26:25',1342177288,'submission.event.fileRevised',0),(206,515,56,3,'2025-12-17 05:26:25',1342177281,'submission.event.fileUploaded',0),(207,1048585,7,3,'2025-12-17 05:26:25',1342177288,'submission.event.fileRevised',0),(208,515,57,3,'2025-12-17 05:26:25',1342177281,'submission.event.fileUploaded',0),(209,1048585,7,3,'2025-12-17 05:26:25',1342177288,'submission.event.fileRevised',0),(210,515,58,3,'2025-12-17 05:26:25',1342177281,'submission.event.fileUploaded',0),(211,1048585,7,3,'2025-12-17 05:26:25',1342177288,'submission.event.fileRevised',0),(212,515,59,3,'2025-12-17 05:26:25',1342177281,'submission.event.fileUploaded',0),(213,1048585,7,3,'2025-12-17 05:26:25',1342177288,'submission.event.fileRevised',0),(214,1048585,7,3,'2025-12-17 05:26:32',1073741825,'log.review.reviewerAssigned',0),(215,1048585,7,3,'2025-12-17 05:26:35',805306371,'editor.submission.decision.accept.log',0),(216,1048585,7,3,'2025-12-17 05:26:40',268435459,'submission.event.participantAdded',0),(217,1048585,8,3,'2025-12-17 05:26:46',268435458,'submission.event.general.metadataUpdated',0),(218,515,60,3,'2025-12-17 05:26:47',1342177281,'submission.event.fileUploaded',0),(219,1048585,8,3,'2025-12-17 05:26:47',1342177288,'submission.event.fileRevised',0),(220,515,60,3,'2025-12-17 05:26:47',1342177296,'submission.event.fileEdited',0),(221,1048585,8,3,'2025-12-17 05:26:48',268435457,'submission.event.submissionSubmitted',0),(222,1048585,9,26,'2025-12-17 05:26:53',268435458,'submission.event.general.metadataUpdated',0),(223,1048585,9,26,'2025-12-17 05:26:53',268435458,'submission.event.general.metadataUpdated',0),(224,515,61,26,'2025-12-17 05:26:54',1342177281,'submission.event.fileUploaded',0),(225,1048585,9,26,'2025-12-17 05:26:54',1342177288,'submission.event.fileRevised',0),(226,515,61,26,'2025-12-17 05:26:54',1342177296,'submission.event.fileEdited',0),(227,515,62,26,'2025-12-17 05:26:55',1342177281,'submission.event.fileUploaded',0),(228,1048585,9,26,'2025-12-17 05:26:55',1342177288,'submission.event.fileRevised',0),(229,515,62,26,'2025-12-17 05:26:55',1342177296,'submission.event.fileEdited',0),(230,515,63,26,'2025-12-17 05:26:56',1342177281,'submission.event.fileUploaded',0),(231,1048585,9,26,'2025-12-17 05:26:56',1342177288,'submission.event.fileRevised',0),(232,515,63,26,'2025-12-17 05:26:56',1342177296,'submission.event.fileEdited',0),(233,515,64,26,'2025-12-17 05:26:57',1342177281,'submission.event.fileUploaded',0),(234,1048585,9,26,'2025-12-17 05:26:57',1342177288,'submission.event.fileRevised',0),(235,515,64,26,'2025-12-17 05:26:57',1342177296,'submission.event.fileEdited',0),(236,515,65,26,'2025-12-17 05:26:58',1342177281,'submission.event.fileUploaded',0),(237,1048585,9,26,'2025-12-17 05:26:58',1342177288,'submission.event.fileRevised',0),(238,515,65,26,'2025-12-17 05:26:58',1342177296,'submission.event.fileEdited',0),(239,1048585,9,26,'2025-12-17 05:27:23',268435457,'submission.event.submissionSubmitted',0),(240,1048585,9,3,'2025-12-17 05:27:31',805306371,'editor.submission.decision.sendInternalReview.log',0),(241,515,66,3,'2025-12-17 05:27:32',1342177281,'submission.event.fileUploaded',0),(242,1048585,9,3,'2025-12-17 05:27:32',1342177288,'submission.event.fileRevised',0),(243,515,67,3,'2025-12-17 05:27:32',1342177281,'submission.event.fileUploaded',0),(244,1048585,9,3,'2025-12-17 05:27:32',1342177288,'submission.event.fileRevised',0),(245,515,68,3,'2025-12-17 05:27:32',1342177281,'submission.event.fileUploaded',0),(246,1048585,9,3,'2025-12-17 05:27:32',1342177288,'submission.event.fileRevised',0),(247,515,69,3,'2025-12-17 05:27:32',1342177281,'submission.event.fileUploaded',0),(248,1048585,9,3,'2025-12-17 05:27:32',1342177288,'submission.event.fileRevised',0),(249,515,70,3,'2025-12-17 05:27:32',1342177281,'submission.event.fileUploaded',0),(250,1048585,9,3,'2025-12-17 05:27:32',1342177288,'submission.event.fileRevised',0),(251,1048585,10,27,'2025-12-17 05:27:39',268435458,'submission.event.general.metadataUpdated',0),(252,1048585,10,27,'2025-12-17 05:27:40',268435458,'submission.event.general.metadataUpdated',0),(253,515,71,27,'2025-12-17 05:27:41',1342177281,'submission.event.fileUploaded',0),(254,1048585,10,27,'2025-12-17 05:27:41',1342177288,'submission.event.fileRevised',0),(255,515,71,27,'2025-12-17 05:27:41',1342177296,'submission.event.fileEdited',0),(256,515,72,27,'2025-12-17 05:27:42',1342177281,'submission.event.fileUploaded',0),(257,1048585,10,27,'2025-12-17 05:27:42',1342177288,'submission.event.fileRevised',0),(258,515,72,27,'2025-12-17 05:27:42',1342177296,'submission.event.fileEdited',0),(259,515,73,27,'2025-12-17 05:27:43',1342177281,'submission.event.fileUploaded',0),(260,1048585,10,27,'2025-12-17 05:27:43',1342177288,'submission.event.fileRevised',0),(261,515,73,27,'2025-12-17 05:27:43',1342177296,'submission.event.fileEdited',0),(262,515,74,27,'2025-12-17 05:27:43',1342177281,'submission.event.fileUploaded',0),(263,1048585,10,27,'2025-12-17 05:27:43',1342177288,'submission.event.fileRevised',0),(264,515,74,27,'2025-12-17 05:27:44',1342177296,'submission.event.fileEdited',0),(265,515,75,27,'2025-12-17 05:27:44',1342177281,'submission.event.fileUploaded',0),(266,1048585,10,27,'2025-12-17 05:27:44',1342177288,'submission.event.fileRevised',0),(267,515,75,27,'2025-12-17 05:27:45',1342177296,'submission.event.fileEdited',0),(268,515,76,27,'2025-12-17 05:27:45',1342177281,'submission.event.fileUploaded',0),(269,1048585,10,27,'2025-12-17 05:27:45',1342177288,'submission.event.fileRevised',0),(270,515,76,27,'2025-12-17 05:27:45',1342177296,'submission.event.fileEdited',0),(271,515,77,27,'2025-12-17 05:27:46',1342177281,'submission.event.fileUploaded',0),(272,1048585,10,27,'2025-12-17 05:27:46',1342177288,'submission.event.fileRevised',0),(273,515,77,27,'2025-12-17 05:27:46',1342177296,'submission.event.fileEdited',0),(274,515,78,27,'2025-12-17 05:27:47',1342177281,'submission.event.fileUploaded',0),(275,1048585,10,27,'2025-12-17 05:27:47',1342177288,'submission.event.fileRevised',0),(276,515,78,27,'2025-12-17 05:27:47',1342177296,'submission.event.fileEdited',0),(277,515,79,27,'2025-12-17 05:27:48',1342177281,'submission.event.fileUploaded',0),(278,1048585,10,27,'2025-12-17 05:27:48',1342177288,'submission.event.fileRevised',0),(279,515,79,27,'2025-12-17 05:27:48',1342177296,'submission.event.fileEdited',0),(280,1048585,10,27,'2025-12-17 05:28:38',268435457,'submission.event.submissionSubmitted',0),(281,1048585,11,28,'2025-12-17 05:28:43',268435458,'submission.event.general.metadataUpdated',0),(282,1048585,11,28,'2025-12-17 05:28:44',268435458,'submission.event.general.metadataUpdated',0),(283,515,80,28,'2025-12-17 05:28:45',1342177281,'submission.event.fileUploaded',0),(284,1048585,11,28,'2025-12-17 05:28:45',1342177288,'submission.event.fileRevised',0),(285,515,80,28,'2025-12-17 05:28:45',1342177296,'submission.event.fileEdited',0),(286,515,81,28,'2025-12-17 05:28:46',1342177281,'submission.event.fileUploaded',0),(287,1048585,11,28,'2025-12-17 05:28:46',1342177288,'submission.event.fileRevised',0),(288,515,81,28,'2025-12-17 05:28:46',1342177296,'submission.event.fileEdited',0),(289,1048585,11,28,'2025-12-17 05:28:55',268435457,'submission.event.submissionSubmitted',0),(290,1048585,11,3,'2025-12-17 05:29:02',805306371,'editor.submission.decision.sendInternalReview.log',0),(291,515,82,3,'2025-12-17 05:29:02',1342177281,'submission.event.fileUploaded',0),(292,1048585,11,3,'2025-12-17 05:29:02',1342177288,'submission.event.fileRevised',0),(293,515,83,3,'2025-12-17 05:29:02',1342177281,'submission.event.fileUploaded',0),(294,1048585,11,3,'2025-12-17 05:29:02',1342177288,'submission.event.fileRevised',0),(295,1048585,11,3,'2025-12-17 05:29:09',1073741825,'log.review.reviewerAssigned',0),(296,1048585,11,3,'2025-12-17 05:29:11',805306371,'editor.submission.decision.sendExternalReview.log',0),(297,1048585,11,3,'2025-12-17 05:29:18',1073741825,'log.review.reviewerAssigned',0),(298,1048585,11,3,'2025-12-17 05:29:24',1073741825,'log.review.reviewerAssigned',0),(299,1048585,11,10,'2025-12-17 05:29:27',1073741830,'log.review.reviewAccepted',NULL),(300,1048585,11,10,'2025-12-17 05:29:31',1073741848,'log.review.reviewReady',0),(301,1048585,11,12,'2025-12-17 05:29:35',1073741830,'log.review.reviewAccepted',NULL),(302,1048585,11,12,'2025-12-17 05:29:39',1073741848,'log.review.reviewReady',0),(303,1048585,11,3,'2025-12-17 05:29:48',805306371,'editor.submission.decision.accept.log',0),(304,1048585,11,3,'2025-12-17 05:29:49',805306375,'submission.event.decisionReviewerEmailSent',0),(305,1048585,12,29,'2025-12-17 05:29:57',268435458,'submission.event.general.metadataUpdated',0),(306,1048585,12,29,'2025-12-17 05:29:58',268435458,'submission.event.general.metadataUpdated',0),(307,515,84,29,'2025-12-17 05:29:59',1342177281,'submission.event.fileUploaded',0),(308,1048585,12,29,'2025-12-17 05:29:59',1342177288,'submission.event.fileRevised',0),(309,515,84,29,'2025-12-17 05:29:59',1342177296,'submission.event.fileEdited',0),(310,515,85,29,'2025-12-17 05:30:00',1342177281,'submission.event.fileUploaded',0),(311,1048585,12,29,'2025-12-17 05:30:00',1342177288,'submission.event.fileRevised',0),(312,515,85,29,'2025-12-17 05:30:00',1342177296,'submission.event.fileEdited',0),(313,515,86,29,'2025-12-17 05:30:01',1342177281,'submission.event.fileUploaded',0),(314,1048585,12,29,'2025-12-17 05:30:01',1342177288,'submission.event.fileRevised',0),(315,515,86,29,'2025-12-17 05:30:01',1342177296,'submission.event.fileEdited',0),(316,1048585,12,29,'2025-12-17 05:30:17',268435457,'submission.event.submissionSubmitted',0),(317,1048585,12,3,'2025-12-17 05:30:25',805306371,'editor.submission.decision.sendInternalReview.log',0),(318,515,87,3,'2025-12-17 05:30:25',1342177281,'submission.event.fileUploaded',0),(319,1048585,12,3,'2025-12-17 05:30:25',1342177288,'submission.event.fileRevised',0),(320,515,88,3,'2025-12-17 05:30:25',1342177281,'submission.event.fileUploaded',0),(321,1048585,12,3,'2025-12-17 05:30:25',1342177288,'submission.event.fileRevised',0),(322,515,89,3,'2025-12-17 05:30:25',1342177281,'submission.event.fileUploaded',0),(323,1048585,12,3,'2025-12-17 05:30:25',1342177288,'submission.event.fileRevised',0),(324,1048585,12,3,'2025-12-17 05:30:32',1073741825,'log.review.reviewerAssigned',0),(325,1048585,12,3,'2025-12-17 05:30:38',1073741825,'log.review.reviewerAssigned',0),(326,1048585,12,3,'2025-12-17 05:30:44',1073741825,'log.review.reviewerAssigned',0),(327,1048585,12,8,'2025-12-17 05:30:48',1073741830,'log.review.reviewAccepted',NULL),(328,1048585,12,8,'2025-12-17 05:30:52',1073741848,'log.review.reviewReady',0),(329,1048585,13,30,'2025-12-17 05:30:57',268435458,'submission.event.general.metadataUpdated',0),(330,1048585,13,30,'2025-12-17 05:30:57',268435458,'submission.event.general.metadataUpdated',0),(331,515,90,30,'2025-12-17 05:30:58',1342177281,'submission.event.fileUploaded',0),(332,1048585,13,30,'2025-12-17 05:30:58',1342177288,'submission.event.fileRevised',0),(333,515,90,30,'2025-12-17 05:30:59',1342177296,'submission.event.fileEdited',0),(334,515,91,30,'2025-12-17 05:30:59',1342177281,'submission.event.fileUploaded',0),(335,1048585,13,30,'2025-12-17 05:30:59',1342177288,'submission.event.fileRevised',0),(336,515,91,30,'2025-12-17 05:30:59',1342177296,'submission.event.fileEdited',0),(337,515,92,30,'2025-12-17 05:31:00',1342177281,'submission.event.fileUploaded',0),(338,1048585,13,30,'2025-12-17 05:31:00',1342177288,'submission.event.fileRevised',0),(339,515,92,30,'2025-12-17 05:31:00',1342177296,'submission.event.fileEdited',0),(340,1048585,13,30,'2025-12-17 05:31:15',268435457,'submission.event.submissionSubmitted',0),(341,1048585,13,3,'2025-12-17 05:31:23',805306371,'editor.submission.decision.sendInternalReview.log',0),(342,515,93,3,'2025-12-17 05:31:23',1342177281,'submission.event.fileUploaded',0),(343,1048585,13,3,'2025-12-17 05:31:23',1342177288,'submission.event.fileRevised',0),(344,515,94,3,'2025-12-17 05:31:23',1342177281,'submission.event.fileUploaded',0),(345,1048585,13,3,'2025-12-17 05:31:23',1342177288,'submission.event.fileRevised',0),(346,515,95,3,'2025-12-17 05:31:23',1342177281,'submission.event.fileUploaded',0),(347,1048585,13,3,'2025-12-17 05:31:23',1342177288,'submission.event.fileRevised',0),(348,1048585,13,3,'2025-12-17 05:31:30',1073741825,'log.review.reviewerAssigned',0),(349,1048585,13,3,'2025-12-17 05:31:33',805306371,'editor.submission.decision.sendExternalReview.log',0),(350,1048585,13,3,'2025-12-17 05:31:40',1073741825,'log.review.reviewerAssigned',0),(351,1048585,13,3,'2025-12-17 05:31:45',1073741825,'log.review.reviewerAssigned',0),(352,1048585,13,3,'2025-12-17 05:31:51',1073741825,'log.review.reviewerAssigned',0),(353,1048585,13,10,'2025-12-17 05:31:55',1073741830,'log.review.reviewAccepted',NULL),(354,1048585,13,10,'2025-12-17 05:31:59',1073741848,'log.review.reviewReady',0),(355,1048585,13,12,'2025-12-17 05:32:03',1073741830,'log.review.reviewAccepted',NULL),(356,1048585,13,12,'2025-12-17 05:32:07',1073741848,'log.review.reviewReady',0),(357,1048585,13,3,'2025-12-17 05:32:17',805306371,'editor.submission.decision.accept.log',0),(358,1048585,13,3,'2025-12-17 05:32:18',805306375,'submission.event.decisionReviewerEmailSent',0),(359,1048585,14,31,'2025-12-17 05:32:27',268435458,'submission.event.general.metadataUpdated',0),(360,1048585,14,31,'2025-12-17 05:32:28',268435458,'submission.event.general.metadataUpdated',0),(361,515,96,31,'2025-12-17 05:32:29',1342177281,'submission.event.fileUploaded',0),(362,1048585,14,31,'2025-12-17 05:32:29',1342177288,'submission.event.fileRevised',0),(363,515,96,31,'2025-12-17 05:32:29',1342177296,'submission.event.fileEdited',0),(364,515,97,31,'2025-12-17 05:32:30',1342177281,'submission.event.fileUploaded',0),(365,1048585,14,31,'2025-12-17 05:32:30',1342177288,'submission.event.fileRevised',0),(366,515,97,31,'2025-12-17 05:32:30',1342177296,'submission.event.fileEdited',0),(367,515,98,31,'2025-12-17 05:32:30',1342177281,'submission.event.fileUploaded',0),(368,1048585,14,31,'2025-12-17 05:32:30',1342177288,'submission.event.fileRevised',0),(369,515,98,31,'2025-12-17 05:32:31',1342177296,'submission.event.fileEdited',0),(370,515,99,31,'2025-12-17 05:32:31',1342177281,'submission.event.fileUploaded',0),(371,1048585,14,31,'2025-12-17 05:32:31',1342177288,'submission.event.fileRevised',0),(372,515,99,31,'2025-12-17 05:32:32',1342177296,'submission.event.fileEdited',0),(373,515,100,31,'2025-12-17 05:32:32',1342177281,'submission.event.fileUploaded',0),(374,1048585,14,31,'2025-12-17 05:32:32',1342177288,'submission.event.fileRevised',0),(375,515,100,31,'2025-12-17 05:32:33',1342177296,'submission.event.fileEdited',0),(376,515,101,31,'2025-12-17 05:32:33',1342177281,'submission.event.fileUploaded',0),(377,1048585,14,31,'2025-12-17 05:32:33',1342177288,'submission.event.fileRevised',0),(378,515,101,31,'2025-12-17 05:32:33',1342177296,'submission.event.fileEdited',0),(379,1048585,14,31,'2025-12-17 05:32:54',268435457,'submission.event.submissionSubmitted',0),(380,1048585,14,3,'2025-12-17 05:33:03',805306371,'editor.submission.decision.sendInternalReview.log',0),(381,515,102,3,'2025-12-17 05:33:04',1342177281,'submission.event.fileUploaded',0),(382,1048585,14,3,'2025-12-17 05:33:04',1342177288,'submission.event.fileRevised',0),(383,515,103,3,'2025-12-17 05:33:04',1342177281,'submission.event.fileUploaded',0),(384,1048585,14,3,'2025-12-17 05:33:04',1342177288,'submission.event.fileRevised',0),(385,515,104,3,'2025-12-17 05:33:04',1342177281,'submission.event.fileUploaded',0),(386,1048585,14,3,'2025-12-17 05:33:04',1342177288,'submission.event.fileRevised',0),(387,515,105,3,'2025-12-17 05:33:04',1342177281,'submission.event.fileUploaded',0),(388,1048585,14,3,'2025-12-17 05:33:04',1342177288,'submission.event.fileRevised',0),(389,515,106,3,'2025-12-17 05:33:04',1342177281,'submission.event.fileUploaded',0),(390,1048585,14,3,'2025-12-17 05:33:04',1342177288,'submission.event.fileRevised',0),(391,515,107,3,'2025-12-17 05:33:04',1342177281,'submission.event.fileUploaded',0),(392,1048585,14,3,'2025-12-17 05:33:04',1342177288,'submission.event.fileRevised',0),(393,1048585,14,3,'2025-12-17 05:33:11',1073741825,'log.review.reviewerAssigned',0),(394,1048585,14,3,'2025-12-17 05:33:14',805306371,'editor.submission.decision.sendExternalReview.log',0),(395,1048585,14,3,'2025-12-17 05:33:21',1073741825,'log.review.reviewerAssigned',0),(396,1048585,14,3,'2025-12-17 05:33:24',805306371,'editor.submission.decision.accept.log',0),(397,1048585,14,3,'2025-12-17 05:33:29',268435459,'submission.event.participantAdded',0),(398,1048585,14,3,'2025-12-17 05:33:33',805306371,'editor.submission.decision.sendToProduction.log',0),(399,1048585,14,3,'2025-12-17 05:33:38',268435459,'submission.event.participantAdded',0),(400,1048585,14,3,'2025-12-17 05:33:42',268435459,'submission.event.participantAdded',0),(401,1048585,14,3,'2025-12-17 05:33:46',268435474,'submission.event.publicationFormatCreated',NULL),(402,515,108,3,'2025-12-17 05:33:50',1342177281,'submission.event.fileUploaded',0),(403,1048585,14,3,'2025-12-17 05:33:50',1342177288,'submission.event.fileRevised',0),(404,515,109,3,'2025-12-17 05:33:50',1342177281,'submission.event.fileUploaded',0),(405,1048585,14,3,'2025-12-17 05:33:50',1342177288,'submission.event.fileRevised',0),(406,515,110,3,'2025-12-17 05:33:50',1342177281,'submission.event.fileUploaded',0),(407,1048585,14,3,'2025-12-17 05:33:50',1342177288,'submission.event.fileRevised',0),(408,515,111,3,'2025-12-17 05:33:50',1342177281,'submission.event.fileUploaded',0),(409,1048585,14,3,'2025-12-17 05:33:50',1342177288,'submission.event.fileRevised',0),(410,515,112,3,'2025-12-17 05:33:50',1342177281,'submission.event.fileUploaded',0),(411,1048585,14,3,'2025-12-17 05:33:50',1342177288,'submission.event.fileRevised',0),(412,515,113,3,'2025-12-17 05:33:50',1342177281,'submission.event.fileUploaded',0),(413,1048585,14,3,'2025-12-17 05:33:50',1342177288,'submission.event.fileRevised',0),(414,1048585,14,3,'2025-12-17 05:33:52',268435464,'submission.event.publicationFormatPublished',0),(415,1048585,14,3,'2025-12-17 05:33:53',268435476,'submission.event.publicationFormatMadeAvailable',0),(416,515,113,3,'2025-12-17 05:33:54',1342177296,'submission.event.fileEdited',0),(417,515,113,3,'2025-12-17 05:33:54',1342177287,'submission.event.signoffSignoff',0),(418,515,113,3,'2025-12-17 05:33:56',1342177296,'submission.event.fileEdited',0),(419,515,111,3,'2025-12-17 05:33:57',1342177296,'submission.event.fileEdited',0),(420,515,111,3,'2025-12-17 05:33:57',1342177287,'submission.event.signoffSignoff',0),(421,515,111,3,'2025-12-17 05:33:59',1342177296,'submission.event.fileEdited',0),(422,515,112,3,'2025-12-17 05:34:01',1342177296,'submission.event.fileEdited',0),(423,515,112,3,'2025-12-17 05:34:01',1342177287,'submission.event.signoffSignoff',0),(424,515,112,3,'2025-12-17 05:34:03',1342177296,'submission.event.fileEdited',0),(425,515,110,3,'2025-12-17 05:34:04',1342177296,'submission.event.fileEdited',0),(426,515,110,3,'2025-12-17 05:34:04',1342177287,'submission.event.signoffSignoff',0),(427,515,110,3,'2025-12-17 05:34:06',1342177296,'submission.event.fileEdited',0),(428,515,109,3,'2025-12-17 05:34:08',1342177296,'submission.event.fileEdited',0),(429,515,109,3,'2025-12-17 05:34:08',1342177287,'submission.event.signoffSignoff',0),(430,515,109,3,'2025-12-17 05:34:09',1342177296,'submission.event.fileEdited',0),(431,515,108,3,'2025-12-17 05:34:11',1342177296,'submission.event.fileEdited',0),(432,515,108,3,'2025-12-17 05:34:11',1342177287,'submission.event.signoffSignoff',0),(433,515,108,3,'2025-12-17 05:34:13',1342177296,'submission.event.fileEdited',0),(434,1048585,14,3,'2025-12-17 05:34:15',268435462,'publication.event.published',0),(435,1048585,15,32,'2025-12-17 05:34:24',268435458,'submission.event.general.metadataUpdated',0),(436,1048585,15,32,'2025-12-17 05:34:24',268435458,'submission.event.general.metadataUpdated',0),(437,515,114,32,'2025-12-17 05:34:25',1342177281,'submission.event.fileUploaded',0),(438,1048585,15,32,'2025-12-17 05:34:25',1342177288,'submission.event.fileRevised',0),(439,515,114,32,'2025-12-17 05:34:25',1342177296,'submission.event.fileEdited',0),(440,515,115,32,'2025-12-17 05:34:26',1342177281,'submission.event.fileUploaded',0),(441,1048585,15,32,'2025-12-17 05:34:26',1342177288,'submission.event.fileRevised',0),(442,515,115,32,'2025-12-17 05:34:26',1342177296,'submission.event.fileEdited',0),(443,515,116,32,'2025-12-17 05:34:27',1342177281,'submission.event.fileUploaded',0),(444,1048585,15,32,'2025-12-17 05:34:27',1342177288,'submission.event.fileRevised',0),(445,515,116,32,'2025-12-17 05:34:27',1342177296,'submission.event.fileEdited',0),(446,1048585,15,32,'2025-12-17 05:34:41',268435457,'submission.event.submissionSubmitted',0),(447,1048585,15,3,'2025-12-17 05:34:49',805306371,'editor.submission.decision.sendExternalReview.log',0),(448,515,117,3,'2025-12-17 05:34:49',1342177281,'submission.event.fileUploaded',0),(449,1048585,15,3,'2025-12-17 05:34:49',1342177288,'submission.event.fileRevised',0),(450,515,118,3,'2025-12-17 05:34:49',1342177281,'submission.event.fileUploaded',0),(451,1048585,15,3,'2025-12-17 05:34:49',1342177288,'submission.event.fileRevised',0),(452,515,119,3,'2025-12-17 05:34:49',1342177281,'submission.event.fileUploaded',0),(453,1048585,15,3,'2025-12-17 05:34:49',1342177288,'submission.event.fileRevised',0),(454,1048585,16,33,'2025-12-17 05:34:56',268435458,'submission.event.general.metadataUpdated',0),(455,1048585,16,33,'2025-12-17 05:34:56',268435458,'submission.event.general.metadataUpdated',0),(456,515,120,33,'2025-12-17 05:34:57',1342177281,'submission.event.fileUploaded',0),(457,1048585,16,33,'2025-12-17 05:34:57',1342177288,'submission.event.fileRevised',0),(458,515,120,33,'2025-12-17 05:34:57',1342177296,'submission.event.fileEdited',0),(459,515,121,33,'2025-12-17 05:34:58',1342177281,'submission.event.fileUploaded',0),(460,1048585,16,33,'2025-12-17 05:34:58',1342177288,'submission.event.fileRevised',0),(461,515,121,33,'2025-12-17 05:34:58',1342177296,'submission.event.fileEdited',0),(462,515,122,33,'2025-12-17 05:34:59',1342177281,'submission.event.fileUploaded',0),(463,1048585,16,33,'2025-12-17 05:34:59',1342177288,'submission.event.fileRevised',0),(464,515,122,33,'2025-12-17 05:34:59',1342177296,'submission.event.fileEdited',0),(465,515,123,33,'2025-12-17 05:35:00',1342177281,'submission.event.fileUploaded',0),(466,1048585,16,33,'2025-12-17 05:35:00',1342177288,'submission.event.fileRevised',0),(467,515,123,33,'2025-12-17 05:35:00',1342177296,'submission.event.fileEdited',0),(468,515,124,33,'2025-12-17 05:35:00',1342177281,'submission.event.fileUploaded',0),(469,1048585,16,33,'2025-12-17 05:35:00',1342177288,'submission.event.fileRevised',0),(470,515,124,33,'2025-12-17 05:35:01',1342177296,'submission.event.fileEdited',0),(471,1048585,16,33,'2025-12-17 05:35:24',268435457,'submission.event.submissionSubmitted',0),(472,1048585,16,3,'2025-12-17 05:35:33',805306371,'editor.submission.decision.sendExternalReview.log',0),(473,515,125,3,'2025-12-17 05:35:34',1342177281,'submission.event.fileUploaded',0),(474,1048585,16,3,'2025-12-17 05:35:34',1342177288,'submission.event.fileRevised',0),(475,515,126,3,'2025-12-17 05:35:34',1342177281,'submission.event.fileUploaded',0),(476,1048585,16,3,'2025-12-17 05:35:34',1342177288,'submission.event.fileRevised',0),(477,515,127,3,'2025-12-17 05:35:34',1342177281,'submission.event.fileUploaded',0),(478,1048585,16,3,'2025-12-17 05:35:34',1342177288,'submission.event.fileRevised',0),(479,515,128,3,'2025-12-17 05:35:34',1342177281,'submission.event.fileUploaded',0),(480,1048585,16,3,'2025-12-17 05:35:34',1342177288,'submission.event.fileRevised',0),(481,515,129,3,'2025-12-17 05:35:34',1342177281,'submission.event.fileUploaded',0),(482,1048585,16,3,'2025-12-17 05:35:34',1342177288,'submission.event.fileRevised',0),(483,1048585,16,3,'2025-12-17 05:35:41',1073741825,'log.review.reviewerAssigned',0),(484,1048585,16,3,'2025-12-17 05:35:47',1073741825,'log.review.reviewerAssigned',0),(485,1048585,16,3,'2025-12-17 05:35:53',1073741825,'log.review.reviewerAssigned',0),(486,1048585,16,10,'2025-12-17 05:35:57',1073741830,'log.review.reviewAccepted',NULL),(487,1048585,16,10,'2025-12-17 05:36:02',1073741848,'log.review.reviewReady',0),(488,1048585,17,34,'2025-12-17 05:36:07',268435458,'submission.event.general.metadataUpdated',0),(489,1048585,17,34,'2025-12-17 05:36:08',268435458,'submission.event.general.metadataUpdated',0),(490,515,130,34,'2025-12-17 05:36:09',1342177281,'submission.event.fileUploaded',0),(491,1048585,17,34,'2025-12-17 05:36:09',1342177288,'submission.event.fileRevised',0),(492,515,130,34,'2025-12-17 05:36:09',1342177296,'submission.event.fileEdited',0),(493,515,131,34,'2025-12-17 05:36:09',1342177281,'submission.event.fileUploaded',0),(494,1048585,17,34,'2025-12-17 05:36:09',1342177288,'submission.event.fileRevised',0),(495,515,131,34,'2025-12-17 05:36:10',1342177296,'submission.event.fileEdited',0),(496,515,132,34,'2025-12-17 05:36:10',1342177281,'submission.event.fileUploaded',0),(497,1048585,17,34,'2025-12-17 05:36:10',1342177288,'submission.event.fileRevised',0),(498,515,132,34,'2025-12-17 05:36:11',1342177296,'submission.event.fileEdited',0),(499,515,133,34,'2025-12-17 05:36:11',1342177281,'submission.event.fileUploaded',0),(500,1048585,17,34,'2025-12-17 05:36:11',1342177288,'submission.event.fileRevised',0),(501,515,133,34,'2025-12-17 05:36:11',1342177296,'submission.event.fileEdited',0),(502,515,134,34,'2025-12-17 05:36:12',1342177281,'submission.event.fileUploaded',0),(503,1048585,17,34,'2025-12-17 05:36:12',1342177288,'submission.event.fileRevised',0),(504,515,134,34,'2025-12-17 05:36:12',1342177296,'submission.event.fileEdited',0),(505,515,135,34,'2025-12-17 05:36:13',1342177281,'submission.event.fileUploaded',0),(506,1048585,17,34,'2025-12-17 05:36:13',1342177288,'submission.event.fileRevised',0),(507,515,135,34,'2025-12-17 05:36:13',1342177296,'submission.event.fileEdited',0),(508,1048585,17,34,'2025-12-17 05:36:45',268435457,'submission.event.submissionSubmitted',0),(509,1048585,17,3,'2025-12-17 05:36:55',805306371,'editor.submission.decision.sendInternalReview.log',0),(510,515,136,3,'2025-12-17 05:36:56',1342177281,'submission.event.fileUploaded',0),(511,1048585,17,3,'2025-12-17 05:36:56',1342177288,'submission.event.fileRevised',0),(512,515,137,3,'2025-12-17 05:36:56',1342177281,'submission.event.fileUploaded',0),(513,1048585,17,3,'2025-12-17 05:36:56',1342177288,'submission.event.fileRevised',0),(514,515,138,3,'2025-12-17 05:36:56',1342177281,'submission.event.fileUploaded',0),(515,1048585,17,3,'2025-12-17 05:36:56',1342177288,'submission.event.fileRevised',0),(516,515,139,3,'2025-12-17 05:36:56',1342177281,'submission.event.fileUploaded',0),(517,1048585,17,3,'2025-12-17 05:36:56',1342177288,'submission.event.fileRevised',0),(518,515,140,3,'2025-12-17 05:36:56',1342177281,'submission.event.fileUploaded',0),(519,1048585,17,3,'2025-12-17 05:36:56',1342177288,'submission.event.fileRevised',0),(520,515,141,3,'2025-12-17 05:36:56',1342177281,'submission.event.fileUploaded',0),(521,1048585,17,3,'2025-12-17 05:36:56',1342177288,'submission.event.fileRevised',0),(522,1048585,17,3,'2025-12-17 05:37:03',1073741825,'log.review.reviewerAssigned',0),(523,1048585,17,3,'2025-12-17 05:37:10',1073741825,'log.review.reviewerAssigned',0);
/*!40000 ALTER TABLE `event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log_settings`
--

DROP TABLE IF EXISTS `event_log_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_log_settings` (
  `event_log_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `log_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`event_log_setting_id`),
  UNIQUE KEY `event_log_settings_unique` (`log_id`,`setting_name`,`locale`),
  KEY `event_log_settings_log_id` (`log_id`),
  KEY `event_log_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `event_log_settings_log_id` FOREIGN KEY (`log_id`) REFERENCES `event_log` (`log_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2650 DEFAULT CHARSET=utf8mb3 COMMENT='Data about an event log entry. This data is commonly used to display information about an event to a user.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
INSERT INTO `event_log_settings` VALUES (1,3,'','fileId','1'),(2,3,'en','filename','chapter1.pdf'),(3,3,'','fileStage','2'),(4,3,'','submissionFileId','1'),(5,3,'','submissionId','1'),(6,3,'','username','aclark'),(7,4,'','fileId','1'),(8,4,'en','filename','chapter1.pdf'),(9,4,'','fileStage','2'),(10,4,'','submissionFileId','1'),(11,4,'','submissionId','1'),(12,4,'','username','aclark'),(13,5,'','fileId','1'),(14,5,'en','filename','chapter1.pdf'),(15,5,'','fileStage','2'),(16,5,'','submissionFileId','1'),(17,5,'','submissionId','1'),(18,5,'','username','aclark'),(19,6,'','fileId','2'),(20,6,'en','filename','chapter2.pdf'),(21,6,'','fileStage','2'),(22,6,'','submissionFileId','2'),(23,6,'','submissionId','1'),(24,6,'','username','aclark'),(25,7,'','fileId','2'),(26,7,'en','filename','chapter2.pdf'),(27,7,'','fileStage','2'),(28,7,'','submissionFileId','2'),(29,7,'','submissionId','1'),(30,7,'','username','aclark'),(31,8,'','fileId','2'),(32,8,'en','filename','chapter2.pdf'),(33,8,'','fileStage','2'),(34,8,'','submissionFileId','2'),(35,8,'','submissionId','1'),(36,8,'','username','aclark'),(37,9,'','fileId','3'),(38,9,'en','filename','chapter3.pdf'),(39,9,'','fileStage','2'),(40,9,'','submissionFileId','3'),(41,9,'','submissionId','1'),(42,9,'','username','aclark'),(43,10,'','fileId','3'),(44,10,'en','filename','chapter3.pdf'),(45,10,'','fileStage','2'),(46,10,'','submissionFileId','3'),(47,10,'','submissionId','1'),(48,10,'','username','aclark'),(49,11,'','fileId','3'),(50,11,'en','filename','chapter3.pdf'),(51,11,'','fileStage','2'),(52,11,'','submissionFileId','3'),(53,11,'','submissionId','1'),(54,11,'','username','aclark'),(55,13,'','editorName','Daniel Barnes'),(56,14,'','fileId','3'),(57,14,'en','filename','chapter3.pdf'),(58,14,'','fileStage','4'),(59,14,'','sourceSubmissionFileId','3'),(60,14,'','submissionFileId','4'),(61,14,'','submissionId','1'),(62,14,'','username','dbarnes'),(63,15,'','fileId','3'),(64,15,'en','filename','chapter3.pdf'),(65,15,'','fileStage','4'),(66,15,'','sourceSubmissionFileId','3'),(67,15,'','submissionFileId','4'),(68,15,'','submissionId','1'),(69,15,'','username','dbarnes'),(70,16,'','fileId','1'),(71,16,'en','filename','chapter1.pdf'),(72,16,'','fileStage','4'),(73,16,'','sourceSubmissionFileId','1'),(74,16,'','submissionFileId','5'),(75,16,'','submissionId','1'),(76,16,'','username','dbarnes'),(77,17,'','fileId','1'),(78,17,'en','filename','chapter1.pdf'),(79,17,'','fileStage','4'),(80,17,'','sourceSubmissionFileId','1'),(81,17,'','submissionFileId','5'),(82,17,'','submissionId','1'),(83,17,'','username','dbarnes'),(84,18,'','fileId','2'),(85,18,'en','filename','chapter2.pdf'),(86,18,'','fileStage','4'),(87,18,'','sourceSubmissionFileId','2'),(88,18,'','submissionFileId','6'),(89,18,'','submissionId','1'),(90,18,'','username','dbarnes'),(91,19,'','fileId','2'),(92,19,'en','filename','chapter2.pdf'),(93,19,'','fileStage','4'),(94,19,'','sourceSubmissionFileId','2'),(95,19,'','submissionFileId','6'),(96,19,'','submissionId','1'),(97,19,'','username','dbarnes'),(98,20,'','reviewerName','Gonzalo Favio'),(99,20,'','round','1'),(100,20,'','stageId','3'),(101,20,'','submissionId','1'),(102,21,'','editorName','Daniel Barnes'),(103,22,'','userFullName','Sarah Vogt'),(104,22,'en','userGroupName','Copyeditor'),(105,22,'fr_CA','userGroupName','Réviseur-e'),(106,22,'','username','svogt'),(107,25,'','fileId','4'),(108,25,'en','filename','chapter1.pdf'),(109,25,'','fileStage','2'),(110,25,'','submissionFileId','7'),(111,25,'','submissionId','2'),(112,25,'','username','afinkel'),(113,26,'','fileId','4'),(114,26,'en','filename','chapter1.pdf'),(115,26,'','fileStage','2'),(116,26,'','submissionFileId','7'),(117,26,'','submissionId','2'),(118,26,'','username','afinkel'),(119,27,'','fileId','4'),(120,27,'en','filename','chapter1.pdf'),(121,27,'','fileStage','2'),(122,27,'','submissionFileId','7'),(123,27,'','submissionId','2'),(124,27,'','username','afinkel'),(125,29,'','fileId','5'),(126,29,'en','filename','chapter2.pdf'),(127,29,'','fileStage','2'),(128,29,'','submissionFileId','8'),(129,29,'','submissionId','2'),(130,29,'','username','afinkel'),(131,30,'','fileId','5'),(132,30,'en','filename','chapter2.pdf'),(133,30,'','fileStage','2'),(134,30,'','submissionFileId','8'),(135,30,'','submissionId','2'),(136,30,'','username','afinkel'),(137,31,'','fileId','5'),(138,31,'en','filename','chapter2.pdf'),(139,31,'','fileStage','2'),(140,31,'','submissionFileId','8'),(141,31,'','submissionId','2'),(142,31,'','username','afinkel'),(143,32,'','fileId','6'),(144,32,'en','filename','chapter3.pdf'),(145,32,'','fileStage','2'),(146,32,'','submissionFileId','9'),(147,32,'','submissionId','2'),(148,32,'','username','afinkel'),(149,33,'','fileId','6'),(150,33,'en','filename','chapter3.pdf'),(151,33,'','fileStage','2'),(152,33,'','submissionFileId','9'),(153,33,'','submissionId','2'),(154,33,'','username','afinkel'),(155,34,'','fileId','6'),(156,34,'en','filename','chapter3.pdf'),(157,34,'','fileStage','2'),(158,34,'','submissionFileId','9'),(159,34,'','submissionId','2'),(160,34,'','username','afinkel'),(161,35,'','fileId','7'),(162,35,'en','filename','chapter4.pdf'),(163,35,'','fileStage','2'),(164,35,'','submissionFileId','10'),(165,35,'','submissionId','2'),(166,35,'','username','afinkel'),(167,36,'','fileId','7'),(168,36,'en','filename','chapter4.pdf'),(169,36,'','fileStage','2'),(170,36,'','submissionFileId','10'),(171,36,'','submissionId','2'),(172,36,'','username','afinkel'),(173,37,'','fileId','7'),(174,37,'en','filename','chapter4.pdf'),(175,37,'','fileStage','2'),(176,37,'','submissionFileId','10'),(177,37,'','submissionId','2'),(178,37,'','username','afinkel'),(179,38,'','fileId','8'),(180,38,'en','filename','delete-this-file.pdf'),(181,38,'','fileStage','2'),(182,38,'','submissionFileId','11'),(183,38,'','submissionId','2'),(184,38,'','username','afinkel'),(185,39,'','fileId','8'),(186,39,'en','filename','delete-this-file.pdf'),(187,39,'','fileStage','2'),(188,39,'','submissionFileId','11'),(189,39,'','submissionId','2'),(190,39,'','username','afinkel'),(191,40,'','fileId','8'),(192,40,'en','filename','delete-this-file.pdf'),(193,40,'','fileStage','2'),(194,40,'','submissionFileId','11'),(195,40,'','submissionId','2'),(196,40,'','username','afinkel'),(197,41,'','fileId','8'),(198,41,'en','filename','delete-this-file.pdf'),(199,41,'','fileStage','2'),(200,41,'','submissionFileId','11'),(201,41,'','submissionId','2'),(202,41,'','username','afinkel'),(203,42,'','fileId','8'),(204,42,'en','filename','delete-this-file.pdf'),(205,42,'','fileStage','2'),(206,42,'','submissionFileId','11'),(207,42,'','submissionId','2'),(208,42,'','username','afinkel'),(209,44,'','editorName','Daniel Barnes'),(210,45,'','fileId','7'),(211,45,'en','filename','chapter4.pdf'),(212,45,'','fileStage','4'),(213,45,'','sourceSubmissionFileId','10'),(214,45,'','submissionFileId','12'),(215,45,'','submissionId','2'),(216,45,'','username','dbarnes'),(217,46,'','fileId','7'),(218,46,'en','filename','chapter4.pdf'),(219,46,'','fileStage','4'),(220,46,'','sourceSubmissionFileId','10'),(221,46,'','submissionFileId','12'),(222,46,'','submissionId','2'),(223,46,'','username','dbarnes'),(224,47,'','fileId','6'),(225,47,'en','filename','chapter3.pdf'),(226,47,'','fileStage','4'),(227,47,'','sourceSubmissionFileId','9'),(228,47,'','submissionFileId','13'),(229,47,'','submissionId','2'),(230,47,'','username','dbarnes'),(231,48,'','fileId','6'),(232,48,'en','filename','chapter3.pdf'),(233,48,'','fileStage','4'),(234,48,'','sourceSubmissionFileId','9'),(235,48,'','submissionFileId','13'),(236,48,'','submissionId','2'),(237,48,'','username','dbarnes'),(238,49,'','fileId','5'),(239,49,'en','filename','chapter2.pdf'),(240,49,'','fileStage','4'),(241,49,'','sourceSubmissionFileId','8'),(242,49,'','submissionFileId','14'),(243,49,'','submissionId','2'),(244,49,'','username','dbarnes'),(245,50,'','fileId','5'),(246,50,'en','filename','chapter2.pdf'),(247,50,'','fileStage','4'),(248,50,'','sourceSubmissionFileId','8'),(249,50,'','submissionFileId','14'),(250,50,'','submissionId','2'),(251,50,'','username','dbarnes'),(252,51,'','fileId','4'),(253,51,'en','filename','chapter1.pdf'),(254,51,'','fileStage','4'),(255,51,'','sourceSubmissionFileId','7'),(256,51,'','submissionFileId','15'),(257,51,'','submissionId','2'),(258,51,'','username','dbarnes'),(259,52,'','fileId','4'),(260,52,'en','filename','chapter1.pdf'),(261,52,'','fileStage','4'),(262,52,'','sourceSubmissionFileId','7'),(263,52,'','submissionFileId','15'),(264,52,'','submissionId','2'),(265,52,'','username','dbarnes'),(266,53,'','reviewerName','Al Zacharia'),(267,53,'','round','1'),(268,53,'','stageId','3'),(269,53,'','submissionId','2'),(270,54,'','reviewerName','Gonzalo Favio'),(271,54,'','round','1'),(272,54,'','stageId','3'),(273,54,'','submissionId','2'),(274,57,'','fileId','9'),(275,57,'en','filename','chapter1.pdf'),(276,57,'','fileStage','2'),(277,57,'','submissionFileId','16'),(278,57,'','submissionId','3'),(279,57,'','username','bbarnetson'),(280,58,'','fileId','9'),(281,58,'en','filename','chapter1.pdf'),(282,58,'','fileStage','2'),(283,58,'','submissionFileId','16'),(284,58,'','submissionId','3'),(285,58,'','username','bbarnetson'),(286,59,'','fileId','9'),(287,59,'en','filename','chapter1.pdf'),(288,59,'','fileStage','2'),(289,59,'','submissionFileId','16'),(290,59,'','submissionId','3'),(291,59,'','username','bbarnetson'),(292,60,'','fileId','10'),(293,60,'en','filename','chapter2.pdf'),(294,60,'','fileStage','2'),(295,60,'','submissionFileId','17'),(296,60,'','submissionId','3'),(297,60,'','username','bbarnetson'),(298,61,'','fileId','10'),(299,61,'en','filename','chapter2.pdf'),(300,61,'','fileStage','2'),(301,61,'','submissionFileId','17'),(302,61,'','submissionId','3'),(303,61,'','username','bbarnetson'),(304,62,'','fileId','10'),(305,62,'en','filename','chapter2.pdf'),(306,62,'','fileStage','2'),(307,62,'','submissionFileId','17'),(308,62,'','submissionId','3'),(309,62,'','username','bbarnetson'),(310,63,'','fileId','11'),(311,63,'en','filename','chapter3.pdf'),(312,63,'','fileStage','2'),(313,63,'','submissionFileId','18'),(314,63,'','submissionId','3'),(315,63,'','username','bbarnetson'),(316,64,'','fileId','11'),(317,64,'en','filename','chapter3.pdf'),(318,64,'','fileStage','2'),(319,64,'','submissionFileId','18'),(320,64,'','submissionId','3'),(321,64,'','username','bbarnetson'),(322,65,'','fileId','11'),(323,65,'en','filename','chapter3.pdf'),(324,65,'','fileStage','2'),(325,65,'','submissionFileId','18'),(326,65,'','submissionId','3'),(327,65,'','username','bbarnetson'),(328,66,'','fileId','12'),(329,66,'en','filename','chapter4.pdf'),(330,66,'','fileStage','2'),(331,66,'','submissionFileId','19'),(332,66,'','submissionId','3'),(333,66,'','username','bbarnetson'),(334,67,'','fileId','12'),(335,67,'en','filename','chapter4.pdf'),(336,67,'','fileStage','2'),(337,67,'','submissionFileId','19'),(338,67,'','submissionId','3'),(339,67,'','username','bbarnetson'),(340,68,'','fileId','12'),(341,68,'en','filename','chapter4.pdf'),(342,68,'','fileStage','2'),(343,68,'','submissionFileId','19'),(344,68,'','submissionId','3'),(345,68,'','username','bbarnetson'),(346,69,'','fileId','13'),(347,69,'en','filename','chapter5.pdf'),(348,69,'','fileStage','2'),(349,69,'','submissionFileId','20'),(350,69,'','submissionId','3'),(351,69,'','username','bbarnetson'),(352,70,'','fileId','13'),(353,70,'en','filename','chapter5.pdf'),(354,70,'','fileStage','2'),(355,70,'','submissionFileId','20'),(356,70,'','submissionId','3'),(357,70,'','username','bbarnetson'),(358,71,'','fileId','13'),(359,71,'en','filename','chapter5.pdf'),(360,71,'','fileStage','2'),(361,71,'','submissionFileId','20'),(362,71,'','submissionId','3'),(363,71,'','username','bbarnetson'),(364,75,'','fileId','14'),(365,75,'en','filename','chapter1.pdf'),(366,75,'','fileStage','2'),(367,75,'','submissionFileId','21'),(368,75,'','submissionId','4'),(369,75,'','username','bbeaty'),(370,76,'','fileId','14'),(371,76,'en','filename','chapter1.pdf'),(372,76,'','fileStage','2'),(373,76,'','submissionFileId','21'),(374,76,'','submissionId','4'),(375,76,'','username','bbeaty'),(376,77,'','fileId','14'),(377,77,'en','filename','chapter1.pdf'),(378,77,'','fileStage','2'),(379,77,'','submissionFileId','21'),(380,77,'','submissionId','4'),(381,77,'','username','bbeaty'),(382,78,'','fileId','15'),(383,78,'en','filename','chapter2.pdf'),(384,78,'','fileStage','2'),(385,78,'','submissionFileId','22'),(386,78,'','submissionId','4'),(387,78,'','username','bbeaty'),(388,79,'','fileId','15'),(389,79,'en','filename','chapter2.pdf'),(390,79,'','fileStage','2'),(391,79,'','submissionFileId','22'),(392,79,'','submissionId','4'),(393,79,'','username','bbeaty'),(394,80,'','fileId','15'),(395,80,'en','filename','chapter2.pdf'),(396,80,'','fileStage','2'),(397,80,'','submissionFileId','22'),(398,80,'','submissionId','4'),(399,80,'','username','bbeaty'),(400,81,'','fileId','16'),(401,81,'en','filename','chapter3.pdf'),(402,81,'','fileStage','2'),(403,81,'','submissionFileId','23'),(404,81,'','submissionId','4'),(405,81,'','username','bbeaty'),(406,82,'','fileId','16'),(407,82,'en','filename','chapter3.pdf'),(408,82,'','fileStage','2'),(409,82,'','submissionFileId','23'),(410,82,'','submissionId','4'),(411,82,'','username','bbeaty'),(412,83,'','fileId','16'),(413,83,'en','filename','chapter3.pdf'),(414,83,'','fileStage','2'),(415,83,'','submissionFileId','23'),(416,83,'','submissionId','4'),(417,83,'','username','bbeaty'),(418,84,'','fileId','17'),(419,84,'en','filename','intro.pdf'),(420,84,'','fileStage','2'),(421,84,'','submissionFileId','24'),(422,84,'','submissionId','4'),(423,84,'','username','bbeaty'),(424,85,'','fileId','17'),(425,85,'en','filename','intro.pdf'),(426,85,'','fileStage','2'),(427,85,'','submissionFileId','24'),(428,85,'','submissionId','4'),(429,85,'','username','bbeaty'),(430,86,'','fileId','17'),(431,86,'en','filename','intro.pdf'),(432,86,'','fileStage','2'),(433,86,'','submissionFileId','24'),(434,86,'','submissionId','4'),(435,86,'','username','bbeaty'),(436,88,'','editorName','Daniel Barnes'),(437,89,'','fileId','17'),(438,89,'en','filename','intro.pdf'),(439,89,'','fileStage','19'),(440,89,'','sourceSubmissionFileId','24'),(441,89,'','submissionFileId','25'),(442,89,'','submissionId','4'),(443,89,'','username','dbarnes'),(444,90,'','fileId','17'),(445,90,'en','filename','intro.pdf'),(446,90,'','fileStage','19'),(447,90,'','sourceSubmissionFileId','24'),(448,90,'','submissionFileId','25'),(449,90,'','submissionId','4'),(450,90,'','username','dbarnes'),(451,91,'','fileId','15'),(452,91,'en','filename','chapter2.pdf'),(453,91,'','fileStage','19'),(454,91,'','sourceSubmissionFileId','22'),(455,91,'','submissionFileId','26'),(456,91,'','submissionId','4'),(457,91,'','username','dbarnes'),(458,92,'','fileId','15'),(459,92,'en','filename','chapter2.pdf'),(460,92,'','fileStage','19'),(461,92,'','sourceSubmissionFileId','22'),(462,92,'','submissionFileId','26'),(463,92,'','submissionId','4'),(464,92,'','username','dbarnes'),(465,93,'','fileId','16'),(466,93,'en','filename','chapter3.pdf'),(467,93,'','fileStage','19'),(468,93,'','sourceSubmissionFileId','23'),(469,93,'','submissionFileId','27'),(470,93,'','submissionId','4'),(471,93,'','username','dbarnes'),(472,94,'','fileId','16'),(473,94,'en','filename','chapter3.pdf'),(474,94,'','fileStage','19'),(475,94,'','sourceSubmissionFileId','23'),(476,94,'','submissionFileId','27'),(477,94,'','submissionId','4'),(478,94,'','username','dbarnes'),(479,95,'','fileId','14'),(480,95,'en','filename','chapter1.pdf'),(481,95,'','fileStage','19'),(482,95,'','sourceSubmissionFileId','21'),(483,95,'','submissionFileId','28'),(484,95,'','submissionId','4'),(485,95,'','username','dbarnes'),(486,96,'','fileId','14'),(487,96,'en','filename','chapter1.pdf'),(488,96,'','fileStage','19'),(489,96,'','sourceSubmissionFileId','21'),(490,96,'','submissionFileId','28'),(491,96,'','submissionId','4'),(492,96,'','username','dbarnes'),(493,97,'','reviewerName','Aisla McCrae'),(494,97,'','round','1'),(495,97,'','stageId','2'),(496,97,'','submissionId','4'),(497,98,'','editorName','Daniel Barnes'),(498,99,'','reviewerName','Al Zacharia'),(499,99,'','round','1'),(500,99,'','stageId','3'),(501,99,'','submissionId','4'),(502,100,'','editorName','Daniel Barnes'),(503,101,'','userFullName','Maria Fritz'),(504,101,'en','userGroupName','Copyeditor'),(505,101,'fr_CA','userGroupName','Réviseur-e'),(506,101,'','username','mfritz'),(507,102,'','editorName','Daniel Barnes'),(508,103,'','userFullName','Graham Cox'),(509,103,'en','userGroupName','Layout Editor'),(510,103,'fr_CA','userGroupName','Responsable de la mise en page'),(511,103,'','username','gcox'),(512,104,'en','publicationFormatName','PDF'),(513,104,'fr_CA','publicationFormatName',''),(514,107,'','fileId','18'),(515,107,'en','filename','prologue.pdf'),(516,107,'','fileStage','2'),(517,107,'','submissionFileId','29'),(518,107,'','submissionId','5'),(519,107,'','username','callan'),(520,108,'','fileId','18'),(521,108,'en','filename','prologue.pdf'),(522,108,'','fileStage','2'),(523,108,'','submissionFileId','29'),(524,108,'','submissionId','5'),(525,108,'','username','callan'),(526,109,'','fileId','18'),(527,109,'en','filename','prologue.pdf'),(528,109,'','fileStage','2'),(529,109,'','submissionFileId','29'),(530,109,'','submissionId','5'),(531,109,'','username','callan'),(532,110,'','fileId','19'),(533,110,'en','filename','chapter1.pdf'),(534,110,'','fileStage','2'),(535,110,'','submissionFileId','30'),(536,110,'','submissionId','5'),(537,110,'','username','callan'),(538,111,'','fileId','19'),(539,111,'en','filename','chapter1.pdf'),(540,111,'','fileStage','2'),(541,111,'','submissionFileId','30'),(542,111,'','submissionId','5'),(543,111,'','username','callan'),(544,112,'','fileId','19'),(545,112,'en','filename','chapter1.pdf'),(546,112,'','fileStage','2'),(547,112,'','submissionFileId','30'),(548,112,'','submissionId','5'),(549,112,'','username','callan'),(550,113,'','fileId','20'),(551,113,'en','filename','chapter2.pdf'),(552,113,'','fileStage','2'),(553,113,'','submissionFileId','31'),(554,113,'','submissionId','5'),(555,113,'','username','callan'),(556,114,'','fileId','20'),(557,114,'en','filename','chapter2.pdf'),(558,114,'','fileStage','2'),(559,114,'','submissionFileId','31'),(560,114,'','submissionId','5'),(561,114,'','username','callan'),(562,115,'','fileId','20'),(563,115,'en','filename','chapter2.pdf'),(564,115,'','fileStage','2'),(565,115,'','submissionFileId','31'),(566,115,'','submissionId','5'),(567,115,'','username','callan'),(568,116,'','fileId','21'),(569,116,'en','filename','chapter3.pdf'),(570,116,'','fileStage','2'),(571,116,'','submissionFileId','32'),(572,116,'','submissionId','5'),(573,116,'','username','callan'),(574,117,'','fileId','21'),(575,117,'en','filename','chapter3.pdf'),(576,117,'','fileStage','2'),(577,117,'','submissionFileId','32'),(578,117,'','submissionId','5'),(579,117,'','username','callan'),(580,118,'','fileId','21'),(581,118,'en','filename','chapter3.pdf'),(582,118,'','fileStage','2'),(583,118,'','submissionFileId','32'),(584,118,'','submissionId','5'),(585,118,'','username','callan'),(586,119,'','fileId','22'),(587,119,'en','filename','chapter4.pdf'),(588,119,'','fileStage','2'),(589,119,'','submissionFileId','33'),(590,119,'','submissionId','5'),(591,119,'','username','callan'),(592,120,'','fileId','22'),(593,120,'en','filename','chapter4.pdf'),(594,120,'','fileStage','2'),(595,120,'','submissionFileId','33'),(596,120,'','submissionId','5'),(597,120,'','username','callan'),(598,121,'','fileId','22'),(599,121,'en','filename','chapter4.pdf'),(600,121,'','fileStage','2'),(601,121,'','submissionFileId','33'),(602,121,'','submissionId','5'),(603,121,'','username','callan'),(604,122,'','fileId','23'),(605,122,'en','filename','epilogue.pdf'),(606,122,'','fileStage','2'),(607,122,'','submissionFileId','34'),(608,122,'','submissionId','5'),(609,122,'','username','callan'),(610,123,'','fileId','23'),(611,123,'en','filename','epilogue.pdf'),(612,123,'','fileStage','2'),(613,123,'','submissionFileId','34'),(614,123,'','submissionId','5'),(615,123,'','username','callan'),(616,124,'','fileId','23'),(617,124,'en','filename','epilogue.pdf'),(618,124,'','fileStage','2'),(619,124,'','submissionFileId','34'),(620,124,'','submissionId','5'),(621,124,'','username','callan'),(622,126,'','editorName','Daniel Barnes'),(623,127,'','fileId','23'),(624,127,'en','filename','epilogue.pdf'),(625,127,'','fileStage','19'),(626,127,'','sourceSubmissionFileId','34'),(627,127,'','submissionFileId','35'),(628,127,'','submissionId','5'),(629,127,'','username','dbarnes'),(630,128,'','fileId','23'),(631,128,'en','filename','epilogue.pdf'),(632,128,'','fileStage','19'),(633,128,'','sourceSubmissionFileId','34'),(634,128,'','submissionFileId','35'),(635,128,'','submissionId','5'),(636,128,'','username','dbarnes'),(637,129,'','fileId','21'),(638,129,'en','filename','chapter3.pdf'),(639,129,'','fileStage','19'),(640,129,'','sourceSubmissionFileId','32'),(641,129,'','submissionFileId','36'),(642,129,'','submissionId','5'),(643,129,'','username','dbarnes'),(644,130,'','fileId','21'),(645,130,'en','filename','chapter3.pdf'),(646,130,'','fileStage','19'),(647,130,'','sourceSubmissionFileId','32'),(648,130,'','submissionFileId','36'),(649,130,'','submissionId','5'),(650,130,'','username','dbarnes'),(651,131,'','fileId','22'),(652,131,'en','filename','chapter4.pdf'),(653,131,'','fileStage','19'),(654,131,'','sourceSubmissionFileId','33'),(655,131,'','submissionFileId','37'),(656,131,'','submissionId','5'),(657,131,'','username','dbarnes'),(658,132,'','fileId','22'),(659,132,'en','filename','chapter4.pdf'),(660,132,'','fileStage','19'),(661,132,'','sourceSubmissionFileId','33'),(662,132,'','submissionFileId','37'),(663,132,'','submissionId','5'),(664,132,'','username','dbarnes'),(665,133,'','fileId','20'),(666,133,'en','filename','chapter2.pdf'),(667,133,'','fileStage','19'),(668,133,'','sourceSubmissionFileId','31'),(669,133,'','submissionFileId','38'),(670,133,'','submissionId','5'),(671,133,'','username','dbarnes'),(672,134,'','fileId','20'),(673,134,'en','filename','chapter2.pdf'),(674,134,'','fileStage','19'),(675,134,'','sourceSubmissionFileId','31'),(676,134,'','submissionFileId','38'),(677,134,'','submissionId','5'),(678,134,'','username','dbarnes'),(679,135,'','fileId','19'),(680,135,'en','filename','chapter1.pdf'),(681,135,'','fileStage','19'),(682,135,'','sourceSubmissionFileId','30'),(683,135,'','submissionFileId','39'),(684,135,'','submissionId','5'),(685,135,'','username','dbarnes'),(686,136,'','fileId','19'),(687,136,'en','filename','chapter1.pdf'),(688,136,'','fileStage','19'),(689,136,'','sourceSubmissionFileId','30'),(690,136,'','submissionFileId','39'),(691,136,'','submissionId','5'),(692,136,'','username','dbarnes'),(693,137,'','fileId','18'),(694,137,'en','filename','prologue.pdf'),(695,137,'','fileStage','19'),(696,137,'','sourceSubmissionFileId','29'),(697,137,'','submissionFileId','40'),(698,137,'','submissionId','5'),(699,137,'','username','dbarnes'),(700,138,'','fileId','18'),(701,138,'en','filename','prologue.pdf'),(702,138,'','fileStage','19'),(703,138,'','sourceSubmissionFileId','29'),(704,138,'','submissionFileId','40'),(705,138,'','submissionId','5'),(706,138,'','username','dbarnes'),(707,139,'','reviewerName','Paul Hudson'),(708,139,'','round','1'),(709,139,'','stageId','2'),(710,139,'','submissionId','5'),(711,140,'','editorName','Daniel Barnes'),(712,141,'','reviewerName','Gonzalo Favio'),(713,141,'','round','1'),(714,141,'','stageId','3'),(715,141,'','submissionId','5'),(716,142,'','editorName','Daniel Barnes'),(717,143,'','userFullName','Sarah Vogt'),(718,143,'en','userGroupName','Copyeditor'),(719,143,'fr_CA','userGroupName','Réviseur-e'),(720,143,'','username','svogt'),(721,144,'','editorName','Daniel Barnes'),(722,145,'','userFullName','Stephen Hellier'),(723,145,'en','userGroupName','Layout Editor'),(724,145,'fr_CA','userGroupName','Responsable de la mise en page'),(725,145,'','username','shellier'),(726,146,'','userFullName','Catherine Turner'),(727,146,'en','userGroupName','Proofreader'),(728,146,'fr_CA','userGroupName','Correcteur-trice d\'épreuves'),(729,146,'','username','cturner'),(730,147,'en','publicationFormatName','PDF'),(731,147,'fr_CA','publicationFormatName',''),(732,148,'','fileId','23'),(733,148,'en','filename','epilogue.pdf'),(734,148,'','fileStage','10'),(735,148,'','sourceSubmissionFileId','34'),(736,148,'','submissionFileId','41'),(737,148,'','submissionId','5'),(738,148,'','username','dbarnes'),(739,149,'','fileId','23'),(740,149,'en','filename','epilogue.pdf'),(741,149,'','fileStage','10'),(742,149,'','sourceSubmissionFileId','34'),(743,149,'','submissionFileId','41'),(744,149,'','submissionId','5'),(745,149,'','username','dbarnes'),(746,150,'en','publicationFormatName','PDF'),(747,150,'fr_CA','publicationFormatName',''),(748,151,'en','publicationFormatName','PDF'),(749,151,'fr_CA','publicationFormatName',''),(750,152,'','fileId','23'),(751,152,'en','filename','epilogue.pdf'),(752,152,'','fileStage','10'),(753,152,'','sourceSubmissionFileId','34'),(754,152,'','submissionFileId','41'),(755,152,'','submissionId','5'),(756,152,'','username','dbarnes'),(757,153,'en','filename','epilogue.pdf'),(758,153,'','userFullName','Daniel Barnes'),(759,153,'','username','dbarnes'),(760,154,'','fileId','23'),(761,154,'en','filename','epilogue.pdf'),(762,154,'','fileStage','10'),(763,154,'','sourceSubmissionFileId','34'),(764,154,'','submissionFileId','41'),(765,154,'','submissionId','5'),(766,154,'','username','dbarnes'),(767,160,'','fileId','24'),(768,160,'en','filename','chapter1.pdf'),(769,160,'','fileStage','2'),(770,160,'','submissionFileId','42'),(771,160,'','submissionId','6'),(772,160,'','username','dbernnard'),(773,161,'','fileId','24'),(774,161,'en','filename','chapter1.pdf'),(775,161,'','fileStage','2'),(776,161,'','submissionFileId','42'),(777,161,'','submissionId','6'),(778,161,'','username','dbernnard'),(779,162,'','fileId','24'),(780,162,'en','filename','chapter1.pdf'),(781,162,'','fileStage','2'),(782,162,'','submissionFileId','42'),(783,162,'','submissionId','6'),(784,162,'','username','dbernnard'),(785,163,'','fileId','25'),(786,163,'en','filename','chapter2.pdf'),(787,163,'','fileStage','2'),(788,163,'','submissionFileId','43'),(789,163,'','submissionId','6'),(790,163,'','username','dbernnard'),(791,164,'','fileId','25'),(792,164,'en','filename','chapter2.pdf'),(793,164,'','fileStage','2'),(794,164,'','submissionFileId','43'),(795,164,'','submissionId','6'),(796,164,'','username','dbernnard'),(797,165,'','fileId','25'),(798,165,'en','filename','chapter2.pdf'),(799,165,'','fileStage','2'),(800,165,'','submissionFileId','43'),(801,165,'','submissionId','6'),(802,165,'','username','dbernnard'),(803,166,'','fileId','26'),(804,166,'en','filename','chapter3.pdf'),(805,166,'','fileStage','2'),(806,166,'','submissionFileId','44'),(807,166,'','submissionId','6'),(808,166,'','username','dbernnard'),(809,167,'','fileId','26'),(810,167,'en','filename','chapter3.pdf'),(811,167,'','fileStage','2'),(812,167,'','submissionFileId','44'),(813,167,'','submissionId','6'),(814,167,'','username','dbernnard'),(815,168,'','fileId','26'),(816,168,'en','filename','chapter3.pdf'),(817,168,'','fileStage','2'),(818,168,'','submissionFileId','44'),(819,168,'','submissionId','6'),(820,168,'','username','dbernnard'),(821,169,'','fileId','27'),(822,169,'en','filename','chapter4.pdf'),(823,169,'','fileStage','2'),(824,169,'','submissionFileId','45'),(825,169,'','submissionId','6'),(826,169,'','username','dbernnard'),(827,170,'','fileId','27'),(828,170,'en','filename','chapter4.pdf'),(829,170,'','fileStage','2'),(830,170,'','submissionFileId','45'),(831,170,'','submissionId','6'),(832,170,'','username','dbernnard'),(833,171,'','fileId','27'),(834,171,'en','filename','chapter4.pdf'),(835,171,'','fileStage','2'),(836,171,'','submissionFileId','45'),(837,171,'','submissionId','6'),(838,171,'','username','dbernnard'),(839,173,'','editorName','Daniel Barnes'),(840,174,'','fileId','26'),(841,174,'en','filename','chapter3.pdf'),(842,174,'','fileStage','19'),(843,174,'','sourceSubmissionFileId','44'),(844,174,'','submissionFileId','46'),(845,174,'','submissionId','6'),(846,174,'','username','dbarnes'),(847,175,'','fileId','26'),(848,175,'en','filename','chapter3.pdf'),(849,175,'','fileStage','19'),(850,175,'','sourceSubmissionFileId','44'),(851,175,'','submissionFileId','46'),(852,175,'','submissionId','6'),(853,175,'','username','dbarnes'),(854,176,'','fileId','27'),(855,176,'en','filename','chapter4.pdf'),(856,176,'','fileStage','19'),(857,176,'','sourceSubmissionFileId','45'),(858,176,'','submissionFileId','47'),(859,176,'','submissionId','6'),(860,176,'','username','dbarnes'),(861,177,'','fileId','27'),(862,177,'en','filename','chapter4.pdf'),(863,177,'','fileStage','19'),(864,177,'','sourceSubmissionFileId','45'),(865,177,'','submissionFileId','47'),(866,177,'','submissionId','6'),(867,177,'','username','dbarnes'),(868,178,'','fileId','25'),(869,178,'en','filename','chapter2.pdf'),(870,178,'','fileStage','19'),(871,178,'','sourceSubmissionFileId','43'),(872,178,'','submissionFileId','48'),(873,178,'','submissionId','6'),(874,178,'','username','dbarnes'),(875,179,'','fileId','25'),(876,179,'en','filename','chapter2.pdf'),(877,179,'','fileStage','19'),(878,179,'','sourceSubmissionFileId','43'),(879,179,'','submissionFileId','48'),(880,179,'','submissionId','6'),(881,179,'','username','dbarnes'),(882,180,'','fileId','24'),(883,180,'en','filename','chapter1.pdf'),(884,180,'','fileStage','19'),(885,180,'','sourceSubmissionFileId','42'),(886,180,'','submissionFileId','49'),(887,180,'','submissionId','6'),(888,180,'','username','dbarnes'),(889,181,'','fileId','24'),(890,181,'en','filename','chapter1.pdf'),(891,181,'','fileStage','19'),(892,181,'','sourceSubmissionFileId','42'),(893,181,'','submissionFileId','49'),(894,181,'','submissionId','6'),(895,181,'','username','dbarnes'),(896,182,'','userFullName','Daniel Barnes'),(897,182,'en','userGroupName','Press editor'),(898,182,'fr_CA','userGroupName','Rédacteur/Rédactrice en chef de la presse'),(899,182,'','username','dbarnes'),(900,183,'','userFullName','Minoti Inoue'),(901,183,'en','userGroupName','Series editor'),(902,183,'fr_CA','userGroupName','Rédacteur/Rédactrice en chef de la série'),(903,183,'','username','minoue'),(904,184,'','editorName','Minoti Inoue'),(905,187,'','fileId','28'),(906,187,'en','filename','intro.pdf'),(907,187,'','fileStage','2'),(908,187,'','submissionFileId','50'),(909,187,'','submissionId','7'),(910,187,'','username','dkennepohl'),(911,188,'','fileId','28'),(912,188,'en','filename','intro.pdf'),(913,188,'','fileStage','2'),(914,188,'','submissionFileId','50'),(915,188,'','submissionId','7'),(916,188,'','username','dkennepohl'),(917,189,'','fileId','28'),(918,189,'en','filename','intro.pdf'),(919,189,'','fileStage','2'),(920,189,'','submissionFileId','50'),(921,189,'','submissionId','7'),(922,189,'','username','dkennepohl'),(923,190,'','fileId','29'),(924,190,'en','filename','chapter1.pdf'),(925,190,'','fileStage','2'),(926,190,'','submissionFileId','51'),(927,190,'','submissionId','7'),(928,190,'','username','dkennepohl'),(929,191,'','fileId','29'),(930,191,'en','filename','chapter1.pdf'),(931,191,'','fileStage','2'),(932,191,'','submissionFileId','51'),(933,191,'','submissionId','7'),(934,191,'','username','dkennepohl'),(935,192,'','fileId','29'),(936,192,'en','filename','chapter1.pdf'),(937,192,'','fileStage','2'),(938,192,'','submissionFileId','51'),(939,192,'','submissionId','7'),(940,192,'','username','dkennepohl'),(941,193,'','fileId','30'),(942,193,'en','filename','chapter2.pdf'),(943,193,'','fileStage','2'),(944,193,'','submissionFileId','52'),(945,193,'','submissionId','7'),(946,193,'','username','dkennepohl'),(947,194,'','fileId','30'),(948,194,'en','filename','chapter2.pdf'),(949,194,'','fileStage','2'),(950,194,'','submissionFileId','52'),(951,194,'','submissionId','7'),(952,194,'','username','dkennepohl'),(953,195,'','fileId','30'),(954,195,'en','filename','chapter2.pdf'),(955,195,'','fileStage','2'),(956,195,'','submissionFileId','52'),(957,195,'','submissionId','7'),(958,195,'','username','dkennepohl'),(959,196,'','fileId','31'),(960,196,'en','filename','chapter3.pdf'),(961,196,'','fileStage','2'),(962,196,'','submissionFileId','53'),(963,196,'','submissionId','7'),(964,196,'','username','dkennepohl'),(965,197,'','fileId','31'),(966,197,'en','filename','chapter3.pdf'),(967,197,'','fileStage','2'),(968,197,'','submissionFileId','53'),(969,197,'','submissionId','7'),(970,197,'','username','dkennepohl'),(971,198,'','fileId','31'),(972,198,'en','filename','chapter3.pdf'),(973,198,'','fileStage','2'),(974,198,'','submissionFileId','53'),(975,198,'','submissionId','7'),(976,198,'','username','dkennepohl'),(977,199,'','fileId','32'),(978,199,'en','filename','chapter4.pdf'),(979,199,'','fileStage','2'),(980,199,'','submissionFileId','54'),(981,199,'','submissionId','7'),(982,199,'','username','dkennepohl'),(983,200,'','fileId','32'),(984,200,'en','filename','chapter4.pdf'),(985,200,'','fileStage','2'),(986,200,'','submissionFileId','54'),(987,200,'','submissionId','7'),(988,200,'','username','dkennepohl'),(989,201,'','fileId','32'),(990,201,'en','filename','chapter4.pdf'),(991,201,'','fileStage','2'),(992,201,'','submissionFileId','54'),(993,201,'','submissionId','7'),(994,201,'','username','dkennepohl'),(995,203,'','editorName','Daniel Barnes'),(996,204,'','fileId','32'),(997,204,'en','filename','chapter4.pdf'),(998,204,'','fileStage','4'),(999,204,'','sourceSubmissionFileId','54'),(1000,204,'','submissionFileId','55'),(1001,204,'','submissionId','7'),(1002,204,'','username','dbarnes'),(1003,205,'','fileId','32'),(1004,205,'en','filename','chapter4.pdf'),(1005,205,'','fileStage','4'),(1006,205,'','sourceSubmissionFileId','54'),(1007,205,'','submissionFileId','55'),(1008,205,'','submissionId','7'),(1009,205,'','username','dbarnes'),(1010,206,'','fileId','31'),(1011,206,'en','filename','chapter3.pdf'),(1012,206,'','fileStage','4'),(1013,206,'','sourceSubmissionFileId','53'),(1014,206,'','submissionFileId','56'),(1015,206,'','submissionId','7'),(1016,206,'','username','dbarnes'),(1017,207,'','fileId','31'),(1018,207,'en','filename','chapter3.pdf'),(1019,207,'','fileStage','4'),(1020,207,'','sourceSubmissionFileId','53'),(1021,207,'','submissionFileId','56'),(1022,207,'','submissionId','7'),(1023,207,'','username','dbarnes'),(1024,208,'','fileId','30'),(1025,208,'en','filename','chapter2.pdf'),(1026,208,'','fileStage','4'),(1027,208,'','sourceSubmissionFileId','52'),(1028,208,'','submissionFileId','57'),(1029,208,'','submissionId','7'),(1030,208,'','username','dbarnes'),(1031,209,'','fileId','30'),(1032,209,'en','filename','chapter2.pdf'),(1033,209,'','fileStage','4'),(1034,209,'','sourceSubmissionFileId','52'),(1035,209,'','submissionFileId','57'),(1036,209,'','submissionId','7'),(1037,209,'','username','dbarnes'),(1038,210,'','fileId','29'),(1039,210,'en','filename','chapter1.pdf'),(1040,210,'','fileStage','4'),(1041,210,'','sourceSubmissionFileId','51'),(1042,210,'','submissionFileId','58'),(1043,210,'','submissionId','7'),(1044,210,'','username','dbarnes'),(1045,211,'','fileId','29'),(1046,211,'en','filename','chapter1.pdf'),(1047,211,'','fileStage','4'),(1048,211,'','sourceSubmissionFileId','51'),(1049,211,'','submissionFileId','58'),(1050,211,'','submissionId','7'),(1051,211,'','username','dbarnes'),(1052,212,'','fileId','28'),(1053,212,'en','filename','intro.pdf'),(1054,212,'','fileStage','4'),(1055,212,'','sourceSubmissionFileId','50'),(1056,212,'','submissionFileId','59'),(1057,212,'','submissionId','7'),(1058,212,'','username','dbarnes'),(1059,213,'','fileId','28'),(1060,213,'en','filename','intro.pdf'),(1061,213,'','fileStage','4'),(1062,213,'','sourceSubmissionFileId','50'),(1063,213,'','submissionFileId','59'),(1064,213,'','submissionId','7'),(1065,213,'','username','dbarnes'),(1066,214,'','reviewerName','Adela Gallego'),(1067,214,'','round','1'),(1068,214,'','stageId','3'),(1069,214,'','submissionId','7'),(1070,215,'','editorName','Daniel Barnes'),(1071,216,'','userFullName','Maria Fritz'),(1072,216,'en','userGroupName','Copyeditor'),(1073,216,'fr_CA','userGroupName','Réviseur-e'),(1074,216,'','username','mfritz'),(1075,218,'','fileId','33'),(1076,218,'en','filename','note.pdf'),(1077,218,'','fileStage','2'),(1078,218,'','submissionFileId','60'),(1079,218,'','submissionId','8'),(1080,218,'','username','dbarnes'),(1081,219,'','fileId','33'),(1082,219,'en','filename','note.pdf'),(1083,219,'','fileStage','2'),(1084,219,'','submissionFileId','60'),(1085,219,'','submissionId','8'),(1086,219,'','username','dbarnes'),(1087,220,'','fileId','33'),(1088,220,'en','filename','note.pdf'),(1089,220,'','fileStage','2'),(1090,220,'','submissionFileId','60'),(1091,220,'','submissionId','8'),(1092,220,'','username','dbarnes'),(1093,224,'','fileId','34'),(1094,224,'en','filename','chapter1.pdf'),(1095,224,'','fileStage','2'),(1096,224,'','submissionFileId','61'),(1097,224,'','submissionId','9'),(1098,224,'','username','fperini'),(1099,225,'','fileId','34'),(1100,225,'en','filename','chapter1.pdf'),(1101,225,'','fileStage','2'),(1102,225,'','submissionFileId','61'),(1103,225,'','submissionId','9'),(1104,225,'','username','fperini'),(1105,226,'','fileId','34'),(1106,226,'en','filename','chapter1.pdf'),(1107,226,'','fileStage','2'),(1108,226,'','submissionFileId','61'),(1109,226,'','submissionId','9'),(1110,226,'','username','fperini'),(1111,227,'','fileId','35'),(1112,227,'en','filename','chapter2.pdf'),(1113,227,'','fileStage','2'),(1114,227,'','submissionFileId','62'),(1115,227,'','submissionId','9'),(1116,227,'','username','fperini'),(1117,228,'','fileId','35'),(1118,228,'en','filename','chapter2.pdf'),(1119,228,'','fileStage','2'),(1120,228,'','submissionFileId','62'),(1121,228,'','submissionId','9'),(1122,228,'','username','fperini'),(1123,229,'','fileId','35'),(1124,229,'en','filename','chapter2.pdf'),(1125,229,'','fileStage','2'),(1126,229,'','submissionFileId','62'),(1127,229,'','submissionId','9'),(1128,229,'','username','fperini'),(1129,230,'','fileId','36'),(1130,230,'en','filename','chapter3.pdf'),(1131,230,'','fileStage','2'),(1132,230,'','submissionFileId','63'),(1133,230,'','submissionId','9'),(1134,230,'','username','fperini'),(1135,231,'','fileId','36'),(1136,231,'en','filename','chapter3.pdf'),(1137,231,'','fileStage','2'),(1138,231,'','submissionFileId','63'),(1139,231,'','submissionId','9'),(1140,231,'','username','fperini'),(1141,232,'','fileId','36'),(1142,232,'en','filename','chapter3.pdf'),(1143,232,'','fileStage','2'),(1144,232,'','submissionFileId','63'),(1145,232,'','submissionId','9'),(1146,232,'','username','fperini'),(1147,233,'','fileId','37'),(1148,233,'en','filename','chapter4.pdf'),(1149,233,'','fileStage','2'),(1150,233,'','submissionFileId','64'),(1151,233,'','submissionId','9'),(1152,233,'','username','fperini'),(1153,234,'','fileId','37'),(1154,234,'en','filename','chapter4.pdf'),(1155,234,'','fileStage','2'),(1156,234,'','submissionFileId','64'),(1157,234,'','submissionId','9'),(1158,234,'','username','fperini'),(1159,235,'','fileId','37'),(1160,235,'en','filename','chapter4.pdf'),(1161,235,'','fileStage','2'),(1162,235,'','submissionFileId','64'),(1163,235,'','submissionId','9'),(1164,235,'','username','fperini'),(1165,236,'','fileId','38'),(1166,236,'en','filename','chapter5.pdf'),(1167,236,'','fileStage','2'),(1168,236,'','submissionFileId','65'),(1169,236,'','submissionId','9'),(1170,236,'','username','fperini'),(1171,237,'','fileId','38'),(1172,237,'en','filename','chapter5.pdf'),(1173,237,'','fileStage','2'),(1174,237,'','submissionFileId','65'),(1175,237,'','submissionId','9'),(1176,237,'','username','fperini'),(1177,238,'','fileId','38'),(1178,238,'en','filename','chapter5.pdf'),(1179,238,'','fileStage','2'),(1180,238,'','submissionFileId','65'),(1181,238,'','submissionId','9'),(1182,238,'','username','fperini'),(1183,240,'','editorName','Daniel Barnes'),(1184,241,'','fileId','38'),(1185,241,'en','filename','chapter5.pdf'),(1186,241,'','fileStage','19'),(1187,241,'','sourceSubmissionFileId','65'),(1188,241,'','submissionFileId','66'),(1189,241,'','submissionId','9'),(1190,241,'','username','dbarnes'),(1191,242,'','fileId','38'),(1192,242,'en','filename','chapter5.pdf'),(1193,242,'','fileStage','19'),(1194,242,'','sourceSubmissionFileId','65'),(1195,242,'','submissionFileId','66'),(1196,242,'','submissionId','9'),(1197,242,'','username','dbarnes'),(1198,243,'','fileId','37'),(1199,243,'en','filename','chapter4.pdf'),(1200,243,'','fileStage','19'),(1201,243,'','sourceSubmissionFileId','64'),(1202,243,'','submissionFileId','67'),(1203,243,'','submissionId','9'),(1204,243,'','username','dbarnes'),(1205,244,'','fileId','37'),(1206,244,'en','filename','chapter4.pdf'),(1207,244,'','fileStage','19'),(1208,244,'','sourceSubmissionFileId','64'),(1209,244,'','submissionFileId','67'),(1210,244,'','submissionId','9'),(1211,244,'','username','dbarnes'),(1212,245,'','fileId','36'),(1213,245,'en','filename','chapter3.pdf'),(1214,245,'','fileStage','19'),(1215,245,'','sourceSubmissionFileId','63'),(1216,245,'','submissionFileId','68'),(1217,245,'','submissionId','9'),(1218,245,'','username','dbarnes'),(1219,246,'','fileId','36'),(1220,246,'en','filename','chapter3.pdf'),(1221,246,'','fileStage','19'),(1222,246,'','sourceSubmissionFileId','63'),(1223,246,'','submissionFileId','68'),(1224,246,'','submissionId','9'),(1225,246,'','username','dbarnes'),(1226,247,'','fileId','35'),(1227,247,'en','filename','chapter2.pdf'),(1228,247,'','fileStage','19'),(1229,247,'','sourceSubmissionFileId','62'),(1230,247,'','submissionFileId','69'),(1231,247,'','submissionId','9'),(1232,247,'','username','dbarnes'),(1233,248,'','fileId','35'),(1234,248,'en','filename','chapter2.pdf'),(1235,248,'','fileStage','19'),(1236,248,'','sourceSubmissionFileId','62'),(1237,248,'','submissionFileId','69'),(1238,248,'','submissionId','9'),(1239,248,'','username','dbarnes'),(1240,249,'','fileId','34'),(1241,249,'en','filename','chapter1.pdf'),(1242,249,'','fileStage','19'),(1243,249,'','sourceSubmissionFileId','61'),(1244,249,'','submissionFileId','70'),(1245,249,'','submissionId','9'),(1246,249,'','username','dbarnes'),(1247,250,'','fileId','34'),(1248,250,'en','filename','chapter1.pdf'),(1249,250,'','fileStage','19'),(1250,250,'','sourceSubmissionFileId','61'),(1251,250,'','submissionFileId','70'),(1252,250,'','submissionId','9'),(1253,250,'','username','dbarnes'),(1254,253,'','fileId','39'),(1255,253,'en','filename','intro.pdf'),(1256,253,'','fileStage','2'),(1257,253,'','submissionFileId','71'),(1258,253,'','submissionId','10'),(1259,253,'','username','jbrower'),(1260,254,'','fileId','39'),(1261,254,'en','filename','intro.pdf'),(1262,254,'','fileStage','2'),(1263,254,'','submissionFileId','71'),(1264,254,'','submissionId','10'),(1265,254,'','username','jbrower'),(1266,255,'','fileId','39'),(1267,255,'en','filename','intro.pdf'),(1268,255,'','fileStage','2'),(1269,255,'','submissionFileId','71'),(1270,255,'','submissionId','10'),(1271,255,'','username','jbrower'),(1272,256,'','fileId','40'),(1273,256,'en','filename','chapter1.pdf'),(1274,256,'','fileStage','2'),(1275,256,'','submissionFileId','72'),(1276,256,'','submissionId','10'),(1277,256,'','username','jbrower'),(1278,257,'','fileId','40'),(1279,257,'en','filename','chapter1.pdf'),(1280,257,'','fileStage','2'),(1281,257,'','submissionFileId','72'),(1282,257,'','submissionId','10'),(1283,257,'','username','jbrower'),(1284,258,'','fileId','40'),(1285,258,'en','filename','chapter1.pdf'),(1286,258,'','fileStage','2'),(1287,258,'','submissionFileId','72'),(1288,258,'','submissionId','10'),(1289,258,'','username','jbrower'),(1290,259,'','fileId','41'),(1291,259,'en','filename','chapter2.pdf'),(1292,259,'','fileStage','2'),(1293,259,'','submissionFileId','73'),(1294,259,'','submissionId','10'),(1295,259,'','username','jbrower'),(1296,260,'','fileId','41'),(1297,260,'en','filename','chapter2.pdf'),(1298,260,'','fileStage','2'),(1299,260,'','submissionFileId','73'),(1300,260,'','submissionId','10'),(1301,260,'','username','jbrower'),(1302,261,'','fileId','41'),(1303,261,'en','filename','chapter2.pdf'),(1304,261,'','fileStage','2'),(1305,261,'','submissionFileId','73'),(1306,261,'','submissionId','10'),(1307,261,'','username','jbrower'),(1308,262,'','fileId','42'),(1309,262,'en','filename','chapter3.pdf'),(1310,262,'','fileStage','2'),(1311,262,'','submissionFileId','74'),(1312,262,'','submissionId','10'),(1313,262,'','username','jbrower'),(1314,263,'','fileId','42'),(1315,263,'en','filename','chapter3.pdf'),(1316,263,'','fileStage','2'),(1317,263,'','submissionFileId','74'),(1318,263,'','submissionId','10'),(1319,263,'','username','jbrower'),(1320,264,'','fileId','42'),(1321,264,'en','filename','chapter3.pdf'),(1322,264,'','fileStage','2'),(1323,264,'','submissionFileId','74'),(1324,264,'','submissionId','10'),(1325,264,'','username','jbrower'),(1326,265,'','fileId','43'),(1327,265,'en','filename','chapter4.pdf'),(1328,265,'','fileStage','2'),(1329,265,'','submissionFileId','75'),(1330,265,'','submissionId','10'),(1331,265,'','username','jbrower'),(1332,266,'','fileId','43'),(1333,266,'en','filename','chapter4.pdf'),(1334,266,'','fileStage','2'),(1335,266,'','submissionFileId','75'),(1336,266,'','submissionId','10'),(1337,266,'','username','jbrower'),(1338,267,'','fileId','43'),(1339,267,'en','filename','chapter4.pdf'),(1340,267,'','fileStage','2'),(1341,267,'','submissionFileId','75'),(1342,267,'','submissionId','10'),(1343,267,'','username','jbrower'),(1344,268,'','fileId','44'),(1345,268,'en','filename','chapter5.pdf'),(1346,268,'','fileStage','2'),(1347,268,'','submissionFileId','76'),(1348,268,'','submissionId','10'),(1349,268,'','username','jbrower'),(1350,269,'','fileId','44'),(1351,269,'en','filename','chapter5.pdf'),(1352,269,'','fileStage','2'),(1353,269,'','submissionFileId','76'),(1354,269,'','submissionId','10'),(1355,269,'','username','jbrower'),(1356,270,'','fileId','44'),(1357,270,'en','filename','chapter5.pdf'),(1358,270,'','fileStage','2'),(1359,270,'','submissionFileId','76'),(1360,270,'','submissionId','10'),(1361,270,'','username','jbrower'),(1362,271,'','fileId','45'),(1363,271,'en','filename','conclusion.pdf'),(1364,271,'','fileStage','2'),(1365,271,'','submissionFileId','77'),(1366,271,'','submissionId','10'),(1367,271,'','username','jbrower'),(1368,272,'','fileId','45'),(1369,272,'en','filename','conclusion.pdf'),(1370,272,'','fileStage','2'),(1371,272,'','submissionFileId','77'),(1372,272,'','submissionId','10'),(1373,272,'','username','jbrower'),(1374,273,'','fileId','45'),(1375,273,'en','filename','conclusion.pdf'),(1376,273,'','fileStage','2'),(1377,273,'','submissionFileId','77'),(1378,273,'','submissionId','10'),(1379,273,'','username','jbrower'),(1380,274,'','fileId','46'),(1381,274,'en','filename','bibliography.pdf'),(1382,274,'','fileStage','2'),(1383,274,'','submissionFileId','78'),(1384,274,'','submissionId','10'),(1385,274,'','username','jbrower'),(1386,275,'','fileId','46'),(1387,275,'en','filename','bibliography.pdf'),(1388,275,'','fileStage','2'),(1389,275,'','submissionFileId','78'),(1390,275,'','submissionId','10'),(1391,275,'','username','jbrower'),(1392,276,'','fileId','46'),(1393,276,'en','filename','bibliography.pdf'),(1394,276,'','fileStage','2'),(1395,276,'','submissionFileId','78'),(1396,276,'','submissionId','10'),(1397,276,'','username','jbrower'),(1398,277,'','fileId','47'),(1399,277,'en','filename','index.pdf'),(1400,277,'','fileStage','2'),(1401,277,'','submissionFileId','79'),(1402,277,'','submissionId','10'),(1403,277,'','username','jbrower'),(1404,278,'','fileId','47'),(1405,278,'en','filename','index.pdf'),(1406,278,'','fileStage','2'),(1407,278,'','submissionFileId','79'),(1408,278,'','submissionId','10'),(1409,278,'','username','jbrower'),(1410,279,'','fileId','47'),(1411,279,'en','filename','index.pdf'),(1412,279,'','fileStage','2'),(1413,279,'','submissionFileId','79'),(1414,279,'','submissionId','10'),(1415,279,'','username','jbrower'),(1416,283,'','fileId','48'),(1417,283,'en','filename','intro.pdf'),(1418,283,'','fileStage','2'),(1419,283,'','submissionFileId','80'),(1420,283,'','submissionId','11'),(1421,283,'','username','jlockehart'),(1422,284,'','fileId','48'),(1423,284,'en','filename','intro.pdf'),(1424,284,'','fileStage','2'),(1425,284,'','submissionFileId','80'),(1426,284,'','submissionId','11'),(1427,284,'','username','jlockehart'),(1428,285,'','fileId','48'),(1429,285,'en','filename','intro.pdf'),(1430,285,'','fileStage','2'),(1431,285,'','submissionFileId','80'),(1432,285,'','submissionId','11'),(1433,285,'','username','jlockehart'),(1434,286,'','fileId','49'),(1435,286,'en','filename','poems.pdf'),(1436,286,'','fileStage','2'),(1437,286,'','submissionFileId','81'),(1438,286,'','submissionId','11'),(1439,286,'','username','jlockehart'),(1440,287,'','fileId','49'),(1441,287,'en','filename','poems.pdf'),(1442,287,'','fileStage','2'),(1443,287,'','submissionFileId','81'),(1444,287,'','submissionId','11'),(1445,287,'','username','jlockehart'),(1446,288,'','fileId','49'),(1447,288,'en','filename','poems.pdf'),(1448,288,'','fileStage','2'),(1449,288,'','submissionFileId','81'),(1450,288,'','submissionId','11'),(1451,288,'','username','jlockehart'),(1452,290,'','editorName','Daniel Barnes'),(1453,291,'','fileId','49'),(1454,291,'en','filename','poems.pdf'),(1455,291,'','fileStage','19'),(1456,291,'','sourceSubmissionFileId','81'),(1457,291,'','submissionFileId','82'),(1458,291,'','submissionId','11'),(1459,291,'','username','dbarnes'),(1460,292,'','fileId','49'),(1461,292,'en','filename','poems.pdf'),(1462,292,'','fileStage','19'),(1463,292,'','sourceSubmissionFileId','81'),(1464,292,'','submissionFileId','82'),(1465,292,'','submissionId','11'),(1466,292,'','username','dbarnes'),(1467,293,'','fileId','48'),(1468,293,'en','filename','intro.pdf'),(1469,293,'','fileStage','19'),(1470,293,'','sourceSubmissionFileId','80'),(1471,293,'','submissionFileId','83'),(1472,293,'','submissionId','11'),(1473,293,'','username','dbarnes'),(1474,294,'','fileId','48'),(1475,294,'en','filename','intro.pdf'),(1476,294,'','fileStage','19'),(1477,294,'','sourceSubmissionFileId','80'),(1478,294,'','submissionFileId','83'),(1479,294,'','submissionId','11'),(1480,294,'','username','dbarnes'),(1481,295,'','reviewerName','Aisla McCrae'),(1482,295,'','round','1'),(1483,295,'','stageId','2'),(1484,295,'','submissionId','11'),(1485,296,'','editorName','Daniel Barnes'),(1486,297,'','reviewerName','Adela Gallego'),(1487,297,'','round','1'),(1488,297,'','stageId','3'),(1489,297,'','submissionId','11'),(1490,298,'','reviewerName','Gonzalo Favio'),(1491,298,'','round','1'),(1492,298,'','stageId','3'),(1493,298,'','submissionId','11'),(1494,299,'','reviewAssignmentId','10'),(1495,299,'','reviewerName','Adela Gallego'),(1496,299,'','round','1'),(1497,299,'','submissionId','11'),(1498,300,'','reviewAssignmentId','10'),(1499,300,'','reviewerName','Adela Gallego'),(1500,300,'','round','1'),(1501,300,'','submissionId','11'),(1502,301,'','reviewAssignmentId','11'),(1503,301,'','reviewerName','Gonzalo Favio'),(1504,301,'','round','1'),(1505,301,'','submissionId','11'),(1506,302,'','reviewAssignmentId','11'),(1507,302,'','reviewerName','Gonzalo Favio'),(1508,302,'','round','1'),(1509,302,'','submissionId','11'),(1510,303,'','editorName','Daniel Barnes'),(1511,304,'','recipientCount','2'),(1512,304,'','subject','Thank you for your review'),(1513,307,'','fileId','50'),(1514,307,'en','filename','chapter1.pdf'),(1515,307,'','fileStage','2'),(1516,307,'','submissionFileId','84'),(1517,307,'','submissionId','12'),(1518,307,'','username','lelder'),(1519,308,'','fileId','50'),(1520,308,'en','filename','chapter1.pdf'),(1521,308,'','fileStage','2'),(1522,308,'','submissionFileId','84'),(1523,308,'','submissionId','12'),(1524,308,'','username','lelder'),(1525,309,'','fileId','50'),(1526,309,'en','filename','chapter1.pdf'),(1527,309,'','fileStage','2'),(1528,309,'','submissionFileId','84'),(1529,309,'','submissionId','12'),(1530,309,'','username','lelder'),(1531,310,'','fileId','51'),(1532,310,'en','filename','chapter2.pdf'),(1533,310,'','fileStage','2'),(1534,310,'','submissionFileId','85'),(1535,310,'','submissionId','12'),(1536,310,'','username','lelder'),(1537,311,'','fileId','51'),(1538,311,'en','filename','chapter2.pdf'),(1539,311,'','fileStage','2'),(1540,311,'','submissionFileId','85'),(1541,311,'','submissionId','12'),(1542,311,'','username','lelder'),(1543,312,'','fileId','51'),(1544,312,'en','filename','chapter2.pdf'),(1545,312,'','fileStage','2'),(1546,312,'','submissionFileId','85'),(1547,312,'','submissionId','12'),(1548,312,'','username','lelder'),(1549,313,'','fileId','52'),(1550,313,'en','filename','chapter3.pdf'),(1551,313,'','fileStage','2'),(1552,313,'','submissionFileId','86'),(1553,313,'','submissionId','12'),(1554,313,'','username','lelder'),(1555,314,'','fileId','52'),(1556,314,'en','filename','chapter3.pdf'),(1557,314,'','fileStage','2'),(1558,314,'','submissionFileId','86'),(1559,314,'','submissionId','12'),(1560,314,'','username','lelder'),(1561,315,'','fileId','52'),(1562,315,'en','filename','chapter3.pdf'),(1563,315,'','fileStage','2'),(1564,315,'','submissionFileId','86'),(1565,315,'','submissionId','12'),(1566,315,'','username','lelder'),(1567,317,'','editorName','Daniel Barnes'),(1568,318,'','fileId','52'),(1569,318,'en','filename','chapter3.pdf'),(1570,318,'','fileStage','19'),(1571,318,'','sourceSubmissionFileId','86'),(1572,318,'','submissionFileId','87'),(1573,318,'','submissionId','12'),(1574,318,'','username','dbarnes'),(1575,319,'','fileId','52'),(1576,319,'en','filename','chapter3.pdf'),(1577,319,'','fileStage','19'),(1578,319,'','sourceSubmissionFileId','86'),(1579,319,'','submissionFileId','87'),(1580,319,'','submissionId','12'),(1581,319,'','username','dbarnes'),(1582,320,'','fileId','51'),(1583,320,'en','filename','chapter2.pdf'),(1584,320,'','fileStage','19'),(1585,320,'','sourceSubmissionFileId','85'),(1586,320,'','submissionFileId','88'),(1587,320,'','submissionId','12'),(1588,320,'','username','dbarnes'),(1589,321,'','fileId','51'),(1590,321,'en','filename','chapter2.pdf'),(1591,321,'','fileStage','19'),(1592,321,'','sourceSubmissionFileId','85'),(1593,321,'','submissionFileId','88'),(1594,321,'','submissionId','12'),(1595,321,'','username','dbarnes'),(1596,322,'','fileId','50'),(1597,322,'en','filename','chapter1.pdf'),(1598,322,'','fileStage','19'),(1599,322,'','sourceSubmissionFileId','84'),(1600,322,'','submissionFileId','89'),(1601,322,'','submissionId','12'),(1602,322,'','username','dbarnes'),(1603,323,'','fileId','50'),(1604,323,'en','filename','chapter1.pdf'),(1605,323,'','fileStage','19'),(1606,323,'','sourceSubmissionFileId','84'),(1607,323,'','submissionFileId','89'),(1608,323,'','submissionId','12'),(1609,323,'','username','dbarnes'),(1610,324,'','reviewerName','Julie Janssen'),(1611,324,'','round','1'),(1612,324,'','stageId','2'),(1613,324,'','submissionId','12'),(1614,325,'','reviewerName','Paul Hudson'),(1615,325,'','round','1'),(1616,325,'','stageId','2'),(1617,325,'','submissionId','12'),(1618,326,'','reviewerName','Aisla McCrae'),(1619,326,'','round','1'),(1620,326,'','stageId','2'),(1621,326,'','submissionId','12'),(1622,327,'','reviewAssignmentId','13'),(1623,327,'','reviewerName','Paul Hudson'),(1624,327,'','round','1'),(1625,327,'','submissionId','12'),(1626,328,'','reviewAssignmentId','13'),(1627,328,'','reviewerName','Paul Hudson'),(1628,328,'','round','1'),(1629,328,'','submissionId','12'),(1630,331,'','fileId','53'),(1631,331,'en','filename','chapter1.pdf'),(1632,331,'','fileStage','2'),(1633,331,'','submissionFileId','90'),(1634,331,'','submissionId','13'),(1635,331,'','username','mally'),(1636,332,'','fileId','53'),(1637,332,'en','filename','chapter1.pdf'),(1638,332,'','fileStage','2'),(1639,332,'','submissionFileId','90'),(1640,332,'','submissionId','13'),(1641,332,'','username','mally'),(1642,333,'','fileId','53'),(1643,333,'en','filename','chapter1.pdf'),(1644,333,'','fileStage','2'),(1645,333,'','submissionFileId','90'),(1646,333,'','submissionId','13'),(1647,333,'','username','mally'),(1648,334,'','fileId','54'),(1649,334,'en','filename','chapter2.pdf'),(1650,334,'','fileStage','2'),(1651,334,'','submissionFileId','91'),(1652,334,'','submissionId','13'),(1653,334,'','username','mally'),(1654,335,'','fileId','54'),(1655,335,'en','filename','chapter2.pdf'),(1656,335,'','fileStage','2'),(1657,335,'','submissionFileId','91'),(1658,335,'','submissionId','13'),(1659,335,'','username','mally'),(1660,336,'','fileId','54'),(1661,336,'en','filename','chapter2.pdf'),(1662,336,'','fileStage','2'),(1663,336,'','submissionFileId','91'),(1664,336,'','submissionId','13'),(1665,336,'','username','mally'),(1666,337,'','fileId','55'),(1667,337,'en','filename','chapter3.pdf'),(1668,337,'','fileStage','2'),(1669,337,'','submissionFileId','92'),(1670,337,'','submissionId','13'),(1671,337,'','username','mally'),(1672,338,'','fileId','55'),(1673,338,'en','filename','chapter3.pdf'),(1674,338,'','fileStage','2'),(1675,338,'','submissionFileId','92'),(1676,338,'','submissionId','13'),(1677,338,'','username','mally'),(1678,339,'','fileId','55'),(1679,339,'en','filename','chapter3.pdf'),(1680,339,'','fileStage','2'),(1681,339,'','submissionFileId','92'),(1682,339,'','submissionId','13'),(1683,339,'','username','mally'),(1684,341,'','editorName','Daniel Barnes'),(1685,342,'','fileId','55'),(1686,342,'en','filename','chapter3.pdf'),(1687,342,'','fileStage','19'),(1688,342,'','sourceSubmissionFileId','92'),(1689,342,'','submissionFileId','93'),(1690,342,'','submissionId','13'),(1691,342,'','username','dbarnes'),(1692,343,'','fileId','55'),(1693,343,'en','filename','chapter3.pdf'),(1694,343,'','fileStage','19'),(1695,343,'','sourceSubmissionFileId','92'),(1696,343,'','submissionFileId','93'),(1697,343,'','submissionId','13'),(1698,343,'','username','dbarnes'),(1699,344,'','fileId','54'),(1700,344,'en','filename','chapter2.pdf'),(1701,344,'','fileStage','19'),(1702,344,'','sourceSubmissionFileId','91'),(1703,344,'','submissionFileId','94'),(1704,344,'','submissionId','13'),(1705,344,'','username','dbarnes'),(1706,345,'','fileId','54'),(1707,345,'en','filename','chapter2.pdf'),(1708,345,'','fileStage','19'),(1709,345,'','sourceSubmissionFileId','91'),(1710,345,'','submissionFileId','94'),(1711,345,'','submissionId','13'),(1712,345,'','username','dbarnes'),(1713,346,'','fileId','53'),(1714,346,'en','filename','chapter1.pdf'),(1715,346,'','fileStage','19'),(1716,346,'','sourceSubmissionFileId','90'),(1717,346,'','submissionFileId','95'),(1718,346,'','submissionId','13'),(1719,346,'','username','dbarnes'),(1720,347,'','fileId','53'),(1721,347,'en','filename','chapter1.pdf'),(1722,347,'','fileStage','19'),(1723,347,'','sourceSubmissionFileId','90'),(1724,347,'','submissionFileId','95'),(1725,347,'','submissionId','13'),(1726,347,'','username','dbarnes'),(1727,348,'','reviewerName','Paul Hudson'),(1728,348,'','round','1'),(1729,348,'','stageId','2'),(1730,348,'','submissionId','13'),(1731,349,'','editorName','Daniel Barnes'),(1732,350,'','reviewerName','Adela Gallego'),(1733,350,'','round','1'),(1734,350,'','stageId','3'),(1735,350,'','submissionId','13'),(1736,351,'','reviewerName','Al Zacharia'),(1737,351,'','round','1'),(1738,351,'','stageId','3'),(1739,351,'','submissionId','13'),(1740,352,'','reviewerName','Gonzalo Favio'),(1741,352,'','round','1'),(1742,352,'','stageId','3'),(1743,352,'','submissionId','13'),(1744,353,'','reviewAssignmentId','16'),(1745,353,'','reviewerName','Adela Gallego'),(1746,353,'','round','1'),(1747,353,'','submissionId','13'),(1748,354,'','reviewAssignmentId','16'),(1749,354,'','reviewerName','Adela Gallego'),(1750,354,'','round','1'),(1751,354,'','submissionId','13'),(1752,355,'','reviewAssignmentId','18'),(1753,355,'','reviewerName','Gonzalo Favio'),(1754,355,'','round','1'),(1755,355,'','submissionId','13'),(1756,356,'','reviewAssignmentId','18'),(1757,356,'','reviewerName','Gonzalo Favio'),(1758,356,'','round','1'),(1759,356,'','submissionId','13'),(1760,357,'','editorName','Daniel Barnes'),(1761,358,'','recipientCount','2'),(1762,358,'','subject','Thank you for your review'),(1763,361,'','fileId','56'),(1764,361,'en','filename','chapter1.pdf'),(1765,361,'','fileStage','2'),(1766,361,'','submissionFileId','96'),(1767,361,'','submissionId','14'),(1768,361,'','username','mdawson'),(1769,362,'','fileId','56'),(1770,362,'en','filename','chapter1.pdf'),(1771,362,'','fileStage','2'),(1772,362,'','submissionFileId','96'),(1773,362,'','submissionId','14'),(1774,362,'','username','mdawson'),(1775,363,'','fileId','56'),(1776,363,'en','filename','chapter1.pdf'),(1777,363,'','fileStage','2'),(1778,363,'','submissionFileId','96'),(1779,363,'','submissionId','14'),(1780,363,'','username','mdawson'),(1781,364,'','fileId','57'),(1782,364,'en','filename','chapter2.pdf'),(1783,364,'','fileStage','2'),(1784,364,'','submissionFileId','97'),(1785,364,'','submissionId','14'),(1786,364,'','username','mdawson'),(1787,365,'','fileId','57'),(1788,365,'en','filename','chapter2.pdf'),(1789,365,'','fileStage','2'),(1790,365,'','submissionFileId','97'),(1791,365,'','submissionId','14'),(1792,365,'','username','mdawson'),(1793,366,'','fileId','57'),(1794,366,'en','filename','chapter2.pdf'),(1795,366,'','fileStage','2'),(1796,366,'','submissionFileId','97'),(1797,366,'','submissionId','14'),(1798,366,'','username','mdawson'),(1799,367,'','fileId','58'),(1800,367,'en','filename','chapter3.pdf'),(1801,367,'','fileStage','2'),(1802,367,'','submissionFileId','98'),(1803,367,'','submissionId','14'),(1804,367,'','username','mdawson'),(1805,368,'','fileId','58'),(1806,368,'en','filename','chapter3.pdf'),(1807,368,'','fileStage','2'),(1808,368,'','submissionFileId','98'),(1809,368,'','submissionId','14'),(1810,368,'','username','mdawson'),(1811,369,'','fileId','58'),(1812,369,'en','filename','chapter3.pdf'),(1813,369,'','fileStage','2'),(1814,369,'','submissionFileId','98'),(1815,369,'','submissionId','14'),(1816,369,'','username','mdawson'),(1817,370,'','fileId','59'),(1818,370,'en','filename','chapter4.pdf'),(1819,370,'','fileStage','2'),(1820,370,'','submissionFileId','99'),(1821,370,'','submissionId','14'),(1822,370,'','username','mdawson'),(1823,371,'','fileId','59'),(1824,371,'en','filename','chapter4.pdf'),(1825,371,'','fileStage','2'),(1826,371,'','submissionFileId','99'),(1827,371,'','submissionId','14'),(1828,371,'','username','mdawson'),(1829,372,'','fileId','59'),(1830,372,'en','filename','chapter4.pdf'),(1831,372,'','fileStage','2'),(1832,372,'','submissionFileId','99'),(1833,372,'','submissionId','14'),(1834,372,'','username','mdawson'),(1835,373,'','fileId','60'),(1836,373,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(1837,373,'','fileStage','2'),(1838,373,'','submissionFileId','100'),(1839,373,'','submissionId','14'),(1840,373,'','username','mdawson'),(1841,374,'','fileId','60'),(1842,374,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(1843,374,'','fileStage','2'),(1844,374,'','submissionFileId','100'),(1845,374,'','submissionId','14'),(1846,374,'','username','mdawson'),(1847,375,'','fileId','60'),(1848,375,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(1849,375,'','fileStage','2'),(1850,375,'','submissionFileId','100'),(1851,375,'','submissionId','14'),(1852,375,'','username','mdawson'),(1853,376,'','fileId','61'),(1854,376,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(1855,376,'','fileStage','2'),(1856,376,'','submissionFileId','101'),(1857,376,'','submissionId','14'),(1858,376,'','username','mdawson'),(1859,377,'','fileId','61'),(1860,377,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(1861,377,'','fileStage','2'),(1862,377,'','submissionFileId','101'),(1863,377,'','submissionId','14'),(1864,377,'','username','mdawson'),(1865,378,'','fileId','61'),(1866,378,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(1867,378,'','fileStage','2'),(1868,378,'','submissionFileId','101'),(1869,378,'','submissionId','14'),(1870,378,'','username','mdawson'),(1871,380,'','editorName','Daniel Barnes'),(1872,381,'','fileId','61'),(1873,381,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(1874,381,'','fileStage','19'),(1875,381,'','sourceSubmissionFileId','101'),(1876,381,'','submissionFileId','102'),(1877,381,'','submissionId','14'),(1878,381,'','username','dbarnes'),(1879,382,'','fileId','61'),(1880,382,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(1881,382,'','fileStage','19'),(1882,382,'','sourceSubmissionFileId','101'),(1883,382,'','submissionFileId','102'),(1884,382,'','submissionId','14'),(1885,382,'','username','dbarnes'),(1886,383,'','fileId','60'),(1887,383,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(1888,383,'','fileStage','19'),(1889,383,'','sourceSubmissionFileId','100'),(1890,383,'','submissionFileId','103'),(1891,383,'','submissionId','14'),(1892,383,'','username','dbarnes'),(1893,384,'','fileId','60'),(1894,384,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(1895,384,'','fileStage','19'),(1896,384,'','sourceSubmissionFileId','100'),(1897,384,'','submissionFileId','103'),(1898,384,'','submissionId','14'),(1899,384,'','username','dbarnes'),(1900,385,'','fileId','59'),(1901,385,'en','filename','chapter4.pdf'),(1902,385,'','fileStage','19'),(1903,385,'','sourceSubmissionFileId','99'),(1904,385,'','submissionFileId','104'),(1905,385,'','submissionId','14'),(1906,385,'','username','dbarnes'),(1907,386,'','fileId','59'),(1908,386,'en','filename','chapter4.pdf'),(1909,386,'','fileStage','19'),(1910,386,'','sourceSubmissionFileId','99'),(1911,386,'','submissionFileId','104'),(1912,386,'','submissionId','14'),(1913,386,'','username','dbarnes'),(1914,387,'','fileId','57'),(1915,387,'en','filename','chapter2.pdf'),(1916,387,'','fileStage','19'),(1917,387,'','sourceSubmissionFileId','97'),(1918,387,'','submissionFileId','105'),(1919,387,'','submissionId','14'),(1920,387,'','username','dbarnes'),(1921,388,'','fileId','57'),(1922,388,'en','filename','chapter2.pdf'),(1923,388,'','fileStage','19'),(1924,388,'','sourceSubmissionFileId','97'),(1925,388,'','submissionFileId','105'),(1926,388,'','submissionId','14'),(1927,388,'','username','dbarnes'),(1928,389,'','fileId','58'),(1929,389,'en','filename','chapter3.pdf'),(1930,389,'','fileStage','19'),(1931,389,'','sourceSubmissionFileId','98'),(1932,389,'','submissionFileId','106'),(1933,389,'','submissionId','14'),(1934,389,'','username','dbarnes'),(1935,390,'','fileId','58'),(1936,390,'en','filename','chapter3.pdf'),(1937,390,'','fileStage','19'),(1938,390,'','sourceSubmissionFileId','98'),(1939,390,'','submissionFileId','106'),(1940,390,'','submissionId','14'),(1941,390,'','username','dbarnes'),(1942,391,'','fileId','56'),(1943,391,'en','filename','chapter1.pdf'),(1944,391,'','fileStage','19'),(1945,391,'','sourceSubmissionFileId','96'),(1946,391,'','submissionFileId','107'),(1947,391,'','submissionId','14'),(1948,391,'','username','dbarnes'),(1949,392,'','fileId','56'),(1950,392,'en','filename','chapter1.pdf'),(1951,392,'','fileStage','19'),(1952,392,'','sourceSubmissionFileId','96'),(1953,392,'','submissionFileId','107'),(1954,392,'','submissionId','14'),(1955,392,'','username','dbarnes'),(1956,393,'','reviewerName','Julie Janssen'),(1957,393,'','round','1'),(1958,393,'','stageId','2'),(1959,393,'','submissionId','14'),(1960,394,'','editorName','Daniel Barnes'),(1961,395,'','reviewerName','Al Zacharia'),(1962,395,'','round','1'),(1963,395,'','stageId','3'),(1964,395,'','submissionId','14'),(1965,396,'','editorName','Daniel Barnes'),(1966,397,'','userFullName','Maria Fritz'),(1967,397,'en','userGroupName','Copyeditor'),(1968,397,'fr_CA','userGroupName','Réviseur-e'),(1969,397,'','username','mfritz'),(1970,398,'','editorName','Daniel Barnes'),(1971,399,'','userFullName','Graham Cox'),(1972,399,'en','userGroupName','Layout Editor'),(1973,399,'fr_CA','userGroupName','Responsable de la mise en page'),(1974,399,'','username','gcox'),(1975,400,'','userFullName','Sabine Kumar'),(1976,400,'en','userGroupName','Proofreader'),(1977,400,'fr_CA','userGroupName','Correcteur-trice d\'épreuves'),(1978,400,'','username','skumar'),(1979,401,'en','publicationFormatName','PDF'),(1980,401,'fr_CA','publicationFormatName',''),(1981,402,'','fileId','61'),(1982,402,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(1983,402,'','fileStage','10'),(1984,402,'','sourceSubmissionFileId','101'),(1985,402,'','submissionFileId','108'),(1986,402,'','submissionId','14'),(1987,402,'','username','dbarnes'),(1988,403,'','fileId','61'),(1989,403,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(1990,403,'','fileStage','10'),(1991,403,'','sourceSubmissionFileId','101'),(1992,403,'','submissionFileId','108'),(1993,403,'','submissionId','14'),(1994,403,'','username','dbarnes'),(1995,404,'','fileId','60'),(1996,404,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(1997,404,'','fileStage','10'),(1998,404,'','sourceSubmissionFileId','100'),(1999,404,'','submissionFileId','109'),(2000,404,'','submissionId','14'),(2001,404,'','username','dbarnes'),(2002,405,'','fileId','60'),(2003,405,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(2004,405,'','fileStage','10'),(2005,405,'','sourceSubmissionFileId','100'),(2006,405,'','submissionFileId','109'),(2007,405,'','submissionId','14'),(2008,405,'','username','dbarnes'),(2009,406,'','fileId','59'),(2010,406,'en','filename','chapter4.pdf'),(2011,406,'','fileStage','10'),(2012,406,'','sourceSubmissionFileId','99'),(2013,406,'','submissionFileId','110'),(2014,406,'','submissionId','14'),(2015,406,'','username','dbarnes'),(2016,407,'','fileId','59'),(2017,407,'en','filename','chapter4.pdf'),(2018,407,'','fileStage','10'),(2019,407,'','sourceSubmissionFileId','99'),(2020,407,'','submissionFileId','110'),(2021,407,'','submissionId','14'),(2022,407,'','username','dbarnes'),(2023,408,'','fileId','57'),(2024,408,'en','filename','chapter2.pdf'),(2025,408,'','fileStage','10'),(2026,408,'','sourceSubmissionFileId','97'),(2027,408,'','submissionFileId','111'),(2028,408,'','submissionId','14'),(2029,408,'','username','dbarnes'),(2030,409,'','fileId','57'),(2031,409,'en','filename','chapter2.pdf'),(2032,409,'','fileStage','10'),(2033,409,'','sourceSubmissionFileId','97'),(2034,409,'','submissionFileId','111'),(2035,409,'','submissionId','14'),(2036,409,'','username','dbarnes'),(2037,410,'','fileId','58'),(2038,410,'en','filename','chapter3.pdf'),(2039,410,'','fileStage','10'),(2040,410,'','sourceSubmissionFileId','98'),(2041,410,'','submissionFileId','112'),(2042,410,'','submissionId','14'),(2043,410,'','username','dbarnes'),(2044,411,'','fileId','58'),(2045,411,'en','filename','chapter3.pdf'),(2046,411,'','fileStage','10'),(2047,411,'','sourceSubmissionFileId','98'),(2048,411,'','submissionFileId','112'),(2049,411,'','submissionId','14'),(2050,411,'','username','dbarnes'),(2051,412,'','fileId','56'),(2052,412,'en','filename','chapter1.pdf'),(2053,412,'','fileStage','10'),(2054,412,'','sourceSubmissionFileId','96'),(2055,412,'','submissionFileId','113'),(2056,412,'','submissionId','14'),(2057,412,'','username','dbarnes'),(2058,413,'','fileId','56'),(2059,413,'en','filename','chapter1.pdf'),(2060,413,'','fileStage','10'),(2061,413,'','sourceSubmissionFileId','96'),(2062,413,'','submissionFileId','113'),(2063,413,'','submissionId','14'),(2064,413,'','username','dbarnes'),(2065,414,'en','publicationFormatName','PDF'),(2066,414,'fr_CA','publicationFormatName',''),(2067,415,'en','publicationFormatName','PDF'),(2068,415,'fr_CA','publicationFormatName',''),(2069,416,'','fileId','56'),(2070,416,'en','filename','chapter1.pdf'),(2071,416,'','fileStage','10'),(2072,416,'','sourceSubmissionFileId','96'),(2073,416,'','submissionFileId','113'),(2074,416,'','submissionId','14'),(2075,416,'','username','dbarnes'),(2076,417,'en','filename','chapter1.pdf'),(2077,417,'','userFullName','Daniel Barnes'),(2078,417,'','username','dbarnes'),(2079,418,'','fileId','56'),(2080,418,'en','filename','chapter1.pdf'),(2081,418,'','fileStage','10'),(2082,418,'','sourceSubmissionFileId','96'),(2083,418,'','submissionFileId','113'),(2084,418,'','submissionId','14'),(2085,418,'','username','dbarnes'),(2086,419,'','fileId','57'),(2087,419,'en','filename','chapter2.pdf'),(2088,419,'','fileStage','10'),(2089,419,'','sourceSubmissionFileId','97'),(2090,419,'','submissionFileId','111'),(2091,419,'','submissionId','14'),(2092,419,'','username','dbarnes'),(2093,420,'en','filename','chapter2.pdf'),(2094,420,'','userFullName','Daniel Barnes'),(2095,420,'','username','dbarnes'),(2096,421,'','fileId','57'),(2097,421,'en','filename','chapter2.pdf'),(2098,421,'','fileStage','10'),(2099,421,'','sourceSubmissionFileId','97'),(2100,421,'','submissionFileId','111'),(2101,421,'','submissionId','14'),(2102,421,'','username','dbarnes'),(2103,422,'','fileId','58'),(2104,422,'en','filename','chapter3.pdf'),(2105,422,'','fileStage','10'),(2106,422,'','sourceSubmissionFileId','98'),(2107,422,'','submissionFileId','112'),(2108,422,'','submissionId','14'),(2109,422,'','username','dbarnes'),(2110,423,'en','filename','chapter3.pdf'),(2111,423,'','userFullName','Daniel Barnes'),(2112,423,'','username','dbarnes'),(2113,424,'','fileId','58'),(2114,424,'en','filename','chapter3.pdf'),(2115,424,'','fileStage','10'),(2116,424,'','sourceSubmissionFileId','98'),(2117,424,'','submissionFileId','112'),(2118,424,'','submissionId','14'),(2119,424,'','username','dbarnes'),(2120,425,'','fileId','59'),(2121,425,'en','filename','chapter4.pdf'),(2122,425,'','fileStage','10'),(2123,425,'','sourceSubmissionFileId','99'),(2124,425,'','submissionFileId','110'),(2125,425,'','submissionId','14'),(2126,425,'','username','dbarnes'),(2127,426,'en','filename','chapter4.pdf'),(2128,426,'','userFullName','Daniel Barnes'),(2129,426,'','username','dbarnes'),(2130,427,'','fileId','59'),(2131,427,'en','filename','chapter4.pdf'),(2132,427,'','fileStage','10'),(2133,427,'','sourceSubmissionFileId','99'),(2134,427,'','submissionFileId','110'),(2135,427,'','submissionId','14'),(2136,427,'','username','dbarnes'),(2137,428,'','fileId','60'),(2138,428,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(2139,428,'','fileStage','10'),(2140,428,'','sourceSubmissionFileId','100'),(2141,428,'','submissionFileId','109'),(2142,428,'','submissionId','14'),(2143,428,'','username','dbarnes'),(2144,429,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(2145,429,'','userFullName','Daniel Barnes'),(2146,429,'','username','dbarnes'),(2147,430,'','fileId','60'),(2148,430,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(2149,430,'','fileStage','10'),(2150,430,'','sourceSubmissionFileId','100'),(2151,430,'','submissionFileId','109'),(2152,430,'','submissionId','14'),(2153,430,'','username','dbarnes'),(2154,431,'','fileId','61'),(2155,431,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(2156,431,'','fileStage','10'),(2157,431,'','sourceSubmissionFileId','101'),(2158,431,'','submissionFileId','108'),(2159,431,'','submissionId','14'),(2160,431,'','username','dbarnes'),(2161,432,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(2162,432,'','userFullName','Daniel Barnes'),(2163,432,'','username','dbarnes'),(2164,433,'','fileId','61'),(2165,433,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(2166,433,'','fileStage','10'),(2167,433,'','sourceSubmissionFileId','101'),(2168,433,'','submissionFileId','108'),(2169,433,'','submissionId','14'),(2170,433,'','username','dbarnes'),(2171,437,'','fileId','62'),(2172,437,'en','filename','chapter1.pdf'),(2173,437,'','fileStage','2'),(2174,437,'','submissionFileId','114'),(2175,437,'','submissionId','15'),(2176,437,'','username','mforan'),(2177,438,'','fileId','62'),(2178,438,'en','filename','chapter1.pdf'),(2179,438,'','fileStage','2'),(2180,438,'','submissionFileId','114'),(2181,438,'','submissionId','15'),(2182,438,'','username','mforan'),(2183,439,'','fileId','62'),(2184,439,'en','filename','chapter1.pdf'),(2185,439,'','fileStage','2'),(2186,439,'','submissionFileId','114'),(2187,439,'','submissionId','15'),(2188,439,'','username','mforan'),(2189,440,'','fileId','63'),(2190,440,'en','filename','chapter2.pdf'),(2191,440,'','fileStage','2'),(2192,440,'','submissionFileId','115'),(2193,440,'','submissionId','15'),(2194,440,'','username','mforan'),(2195,441,'','fileId','63'),(2196,441,'en','filename','chapter2.pdf'),(2197,441,'','fileStage','2'),(2198,441,'','submissionFileId','115'),(2199,441,'','submissionId','15'),(2200,441,'','username','mforan'),(2201,442,'','fileId','63'),(2202,442,'en','filename','chapter2.pdf'),(2203,442,'','fileStage','2'),(2204,442,'','submissionFileId','115'),(2205,442,'','submissionId','15'),(2206,442,'','username','mforan'),(2207,443,'','fileId','64'),(2208,443,'en','filename','chapter3.pdf'),(2209,443,'','fileStage','2'),(2210,443,'','submissionFileId','116'),(2211,443,'','submissionId','15'),(2212,443,'','username','mforan'),(2213,444,'','fileId','64'),(2214,444,'en','filename','chapter3.pdf'),(2215,444,'','fileStage','2'),(2216,444,'','submissionFileId','116'),(2217,444,'','submissionId','15'),(2218,444,'','username','mforan'),(2219,445,'','fileId','64'),(2220,445,'en','filename','chapter3.pdf'),(2221,445,'','fileStage','2'),(2222,445,'','submissionFileId','116'),(2223,445,'','submissionId','15'),(2224,445,'','username','mforan'),(2225,447,'','editorName','Daniel Barnes'),(2226,448,'','fileId','64'),(2227,448,'en','filename','chapter3.pdf'),(2228,448,'','fileStage','4'),(2229,448,'','sourceSubmissionFileId','116'),(2230,448,'','submissionFileId','117'),(2231,448,'','submissionId','15'),(2232,448,'','username','dbarnes'),(2233,449,'','fileId','64'),(2234,449,'en','filename','chapter3.pdf'),(2235,449,'','fileStage','4'),(2236,449,'','sourceSubmissionFileId','116'),(2237,449,'','submissionFileId','117'),(2238,449,'','submissionId','15'),(2239,449,'','username','dbarnes'),(2240,450,'','fileId','63'),(2241,450,'en','filename','chapter2.pdf'),(2242,450,'','fileStage','4'),(2243,450,'','sourceSubmissionFileId','115'),(2244,450,'','submissionFileId','118'),(2245,450,'','submissionId','15'),(2246,450,'','username','dbarnes'),(2247,451,'','fileId','63'),(2248,451,'en','filename','chapter2.pdf'),(2249,451,'','fileStage','4'),(2250,451,'','sourceSubmissionFileId','115'),(2251,451,'','submissionFileId','118'),(2252,451,'','submissionId','15'),(2253,451,'','username','dbarnes'),(2254,452,'','fileId','62'),(2255,452,'en','filename','chapter1.pdf'),(2256,452,'','fileStage','4'),(2257,452,'','sourceSubmissionFileId','114'),(2258,452,'','submissionFileId','119'),(2259,452,'','submissionId','15'),(2260,452,'','username','dbarnes'),(2261,453,'','fileId','62'),(2262,453,'en','filename','chapter1.pdf'),(2263,453,'','fileStage','4'),(2264,453,'','sourceSubmissionFileId','114'),(2265,453,'','submissionFileId','119'),(2266,453,'','submissionId','15'),(2267,453,'','username','dbarnes'),(2268,456,'','fileId','65'),(2269,456,'en','filename','foreward.pdf'),(2270,456,'','fileStage','2'),(2271,456,'','submissionFileId','120'),(2272,456,'','submissionId','16'),(2273,456,'','username','mpower'),(2274,457,'','fileId','65'),(2275,457,'en','filename','foreward.pdf'),(2276,457,'','fileStage','2'),(2277,457,'','submissionFileId','120'),(2278,457,'','submissionId','16'),(2279,457,'','username','mpower'),(2280,458,'','fileId','65'),(2281,458,'en','filename','foreward.pdf'),(2282,458,'','fileStage','2'),(2283,458,'','submissionFileId','120'),(2284,458,'','submissionId','16'),(2285,458,'','username','mpower'),(2286,459,'','fileId','66'),(2287,459,'en','filename','preface.pdf'),(2288,459,'','fileStage','2'),(2289,459,'','submissionFileId','121'),(2290,459,'','submissionId','16'),(2291,459,'','username','mpower'),(2292,460,'','fileId','66'),(2293,460,'en','filename','preface.pdf'),(2294,460,'','fileStage','2'),(2295,460,'','submissionFileId','121'),(2296,460,'','submissionId','16'),(2297,460,'','username','mpower'),(2298,461,'','fileId','66'),(2299,461,'en','filename','preface.pdf'),(2300,461,'','fileStage','2'),(2301,461,'','submissionFileId','121'),(2302,461,'','submissionId','16'),(2303,461,'','username','mpower'),(2304,462,'','fileId','67'),(2305,462,'en','filename','cases.pdf'),(2306,462,'','fileStage','2'),(2307,462,'','submissionFileId','122'),(2308,462,'','submissionId','16'),(2309,462,'','username','mpower'),(2310,463,'','fileId','67'),(2311,463,'en','filename','cases.pdf'),(2312,463,'','fileStage','2'),(2313,463,'','submissionFileId','122'),(2314,463,'','submissionId','16'),(2315,463,'','username','mpower'),(2316,464,'','fileId','67'),(2317,464,'en','filename','cases.pdf'),(2318,464,'','fileStage','2'),(2319,464,'','submissionFileId','122'),(2320,464,'','submissionId','16'),(2321,464,'','username','mpower'),(2322,465,'','fileId','68'),(2323,465,'en','filename','conclusion.pdf'),(2324,465,'','fileStage','2'),(2325,465,'','submissionFileId','123'),(2326,465,'','submissionId','16'),(2327,465,'','username','mpower'),(2328,466,'','fileId','68'),(2329,466,'en','filename','conclusion.pdf'),(2330,466,'','fileStage','2'),(2331,466,'','submissionFileId','123'),(2332,466,'','submissionId','16'),(2333,466,'','username','mpower'),(2334,467,'','fileId','68'),(2335,467,'en','filename','conclusion.pdf'),(2336,467,'','fileStage','2'),(2337,467,'','submissionFileId','123'),(2338,467,'','submissionId','16'),(2339,467,'','username','mpower'),(2340,468,'','fileId','69'),(2341,468,'en','filename','bibliography.pdf'),(2342,468,'','fileStage','2'),(2343,468,'','submissionFileId','124'),(2344,468,'','submissionId','16'),(2345,468,'','username','mpower'),(2346,469,'','fileId','69'),(2347,469,'en','filename','bibliography.pdf'),(2348,469,'','fileStage','2'),(2349,469,'','submissionFileId','124'),(2350,469,'','submissionId','16'),(2351,469,'','username','mpower'),(2352,470,'','fileId','69'),(2353,470,'en','filename','bibliography.pdf'),(2354,470,'','fileStage','2'),(2355,470,'','submissionFileId','124'),(2356,470,'','submissionId','16'),(2357,470,'','username','mpower'),(2358,472,'','editorName','Daniel Barnes'),(2359,473,'','fileId','68'),(2360,473,'en','filename','conclusion.pdf'),(2361,473,'','fileStage','4'),(2362,473,'','sourceSubmissionFileId','123'),(2363,473,'','submissionFileId','125'),(2364,473,'','submissionId','16'),(2365,473,'','username','dbarnes'),(2366,474,'','fileId','68'),(2367,474,'en','filename','conclusion.pdf'),(2368,474,'','fileStage','4'),(2369,474,'','sourceSubmissionFileId','123'),(2370,474,'','submissionFileId','125'),(2371,474,'','submissionId','16'),(2372,474,'','username','dbarnes'),(2373,475,'','fileId','69'),(2374,475,'en','filename','bibliography.pdf'),(2375,475,'','fileStage','4'),(2376,475,'','sourceSubmissionFileId','124'),(2377,475,'','submissionFileId','126'),(2378,475,'','submissionId','16'),(2379,475,'','username','dbarnes'),(2380,476,'','fileId','69'),(2381,476,'en','filename','bibliography.pdf'),(2382,476,'','fileStage','4'),(2383,476,'','sourceSubmissionFileId','124'),(2384,476,'','submissionFileId','126'),(2385,476,'','submissionId','16'),(2386,476,'','username','dbarnes'),(2387,477,'','fileId','67'),(2388,477,'en','filename','cases.pdf'),(2389,477,'','fileStage','4'),(2390,477,'','sourceSubmissionFileId','122'),(2391,477,'','submissionFileId','127'),(2392,477,'','submissionId','16'),(2393,477,'','username','dbarnes'),(2394,478,'','fileId','67'),(2395,478,'en','filename','cases.pdf'),(2396,478,'','fileStage','4'),(2397,478,'','sourceSubmissionFileId','122'),(2398,478,'','submissionFileId','127'),(2399,478,'','submissionId','16'),(2400,478,'','username','dbarnes'),(2401,479,'','fileId','66'),(2402,479,'en','filename','preface.pdf'),(2403,479,'','fileStage','4'),(2404,479,'','sourceSubmissionFileId','121'),(2405,479,'','submissionFileId','128'),(2406,479,'','submissionId','16'),(2407,479,'','username','dbarnes'),(2408,480,'','fileId','66'),(2409,480,'en','filename','preface.pdf'),(2410,480,'','fileStage','4'),(2411,480,'','sourceSubmissionFileId','121'),(2412,480,'','submissionFileId','128'),(2413,480,'','submissionId','16'),(2414,480,'','username','dbarnes'),(2415,481,'','fileId','65'),(2416,481,'en','filename','foreward.pdf'),(2417,481,'','fileStage','4'),(2418,481,'','sourceSubmissionFileId','120'),(2419,481,'','submissionFileId','129'),(2420,481,'','submissionId','16'),(2421,481,'','username','dbarnes'),(2422,482,'','fileId','65'),(2423,482,'en','filename','foreward.pdf'),(2424,482,'','fileStage','4'),(2425,482,'','sourceSubmissionFileId','120'),(2426,482,'','submissionFileId','129'),(2427,482,'','submissionId','16'),(2428,482,'','username','dbarnes'),(2429,483,'','reviewerName','Adela Gallego'),(2430,483,'','round','1'),(2431,483,'','stageId','3'),(2432,483,'','submissionId','16'),(2433,484,'','reviewerName','Al Zacharia'),(2434,484,'','round','1'),(2435,484,'','stageId','3'),(2436,484,'','submissionId','16'),(2437,485,'','reviewerName','Gonzalo Favio'),(2438,485,'','round','1'),(2439,485,'','stageId','3'),(2440,485,'','submissionId','16'),(2441,486,'','reviewAssignmentId','21'),(2442,486,'','reviewerName','Adela Gallego'),(2443,486,'','round','1'),(2444,486,'','submissionId','16'),(2445,487,'','reviewAssignmentId','21'),(2446,487,'','reviewerName','Adela Gallego'),(2447,487,'','round','1'),(2448,487,'','submissionId','16'),(2449,490,'','fileId','70'),(2450,490,'en','filename','preface.pdf'),(2451,490,'','fileStage','2'),(2452,490,'','submissionFileId','130'),(2453,490,'','submissionId','17'),(2454,490,'','username','msmith'),(2455,491,'','fileId','70'),(2456,491,'en','filename','preface.pdf'),(2457,491,'','fileStage','2'),(2458,491,'','submissionFileId','130'),(2459,491,'','submissionId','17'),(2460,491,'','username','msmith'),(2461,492,'','fileId','70'),(2462,492,'en','filename','preface.pdf'),(2463,492,'','fileStage','2'),(2464,492,'','submissionFileId','130'),(2465,492,'','submissionId','17'),(2466,492,'','username','msmith'),(2467,493,'','fileId','71'),(2468,493,'en','filename','introduction.pdf'),(2469,493,'','fileStage','2'),(2470,493,'','submissionFileId','131'),(2471,493,'','submissionId','17'),(2472,493,'','username','msmith'),(2473,494,'','fileId','71'),(2474,494,'en','filename','introduction.pdf'),(2475,494,'','fileStage','2'),(2476,494,'','submissionFileId','131'),(2477,494,'','submissionId','17'),(2478,494,'','username','msmith'),(2479,495,'','fileId','71'),(2480,495,'en','filename','introduction.pdf'),(2481,495,'','fileStage','2'),(2482,495,'','submissionFileId','131'),(2483,495,'','submissionId','17'),(2484,495,'','username','msmith'),(2485,496,'','fileId','72'),(2486,496,'en','filename','chapter1.pdf'),(2487,496,'','fileStage','2'),(2488,496,'','submissionFileId','132'),(2489,496,'','submissionId','17'),(2490,496,'','username','msmith'),(2491,497,'','fileId','72'),(2492,497,'en','filename','chapter1.pdf'),(2493,497,'','fileStage','2'),(2494,497,'','submissionFileId','132'),(2495,497,'','submissionId','17'),(2496,497,'','username','msmith'),(2497,498,'','fileId','72'),(2498,498,'en','filename','chapter1.pdf'),(2499,498,'','fileStage','2'),(2500,498,'','submissionFileId','132'),(2501,498,'','submissionId','17'),(2502,498,'','username','msmith'),(2503,499,'','fileId','73'),(2504,499,'en','filename','chapter2.pdf'),(2505,499,'','fileStage','2'),(2506,499,'','submissionFileId','133'),(2507,499,'','submissionId','17'),(2508,499,'','username','msmith'),(2509,500,'','fileId','73'),(2510,500,'en','filename','chapter2.pdf'),(2511,500,'','fileStage','2'),(2512,500,'','submissionFileId','133'),(2513,500,'','submissionId','17'),(2514,500,'','username','msmith'),(2515,501,'','fileId','73'),(2516,501,'en','filename','chapter2.pdf'),(2517,501,'','fileStage','2'),(2518,501,'','submissionFileId','133'),(2519,501,'','submissionId','17'),(2520,501,'','username','msmith'),(2521,502,'','fileId','74'),(2522,502,'en','filename','chapter3.pdf'),(2523,502,'','fileStage','2'),(2524,502,'','submissionFileId','134'),(2525,502,'','submissionId','17'),(2526,502,'','username','msmith'),(2527,503,'','fileId','74'),(2528,503,'en','filename','chapter3.pdf'),(2529,503,'','fileStage','2'),(2530,503,'','submissionFileId','134'),(2531,503,'','submissionId','17'),(2532,503,'','username','msmith'),(2533,504,'','fileId','74'),(2534,504,'en','filename','chapter3.pdf'),(2535,504,'','fileStage','2'),(2536,504,'','submissionFileId','134'),(2537,504,'','submissionId','17'),(2538,504,'','username','msmith'),(2539,505,'','fileId','75'),(2540,505,'en','filename','chapter4.pdf'),(2541,505,'','fileStage','2'),(2542,505,'','submissionFileId','135'),(2543,505,'','submissionId','17'),(2544,505,'','username','msmith'),(2545,506,'','fileId','75'),(2546,506,'en','filename','chapter4.pdf'),(2547,506,'','fileStage','2'),(2548,506,'','submissionFileId','135'),(2549,506,'','submissionId','17'),(2550,506,'','username','msmith'),(2551,507,'','fileId','75'),(2552,507,'en','filename','chapter4.pdf'),(2553,507,'','fileStage','2'),(2554,507,'','submissionFileId','135'),(2555,507,'','submissionId','17'),(2556,507,'','username','msmith'),(2557,509,'','editorName','Daniel Barnes'),(2558,510,'','fileId','75'),(2559,510,'en','filename','chapter4.pdf'),(2560,510,'','fileStage','19'),(2561,510,'','sourceSubmissionFileId','135'),(2562,510,'','submissionFileId','136'),(2563,510,'','submissionId','17'),(2564,510,'','username','dbarnes'),(2565,511,'','fileId','75'),(2566,511,'en','filename','chapter4.pdf'),(2567,511,'','fileStage','19'),(2568,511,'','sourceSubmissionFileId','135'),(2569,511,'','submissionFileId','136'),(2570,511,'','submissionId','17'),(2571,511,'','username','dbarnes'),(2572,512,'','fileId','74'),(2573,512,'en','filename','chapter3.pdf'),(2574,512,'','fileStage','19'),(2575,512,'','sourceSubmissionFileId','134'),(2576,512,'','submissionFileId','137'),(2577,512,'','submissionId','17'),(2578,512,'','username','dbarnes'),(2579,513,'','fileId','74'),(2580,513,'en','filename','chapter3.pdf'),(2581,513,'','fileStage','19'),(2582,513,'','sourceSubmissionFileId','134'),(2583,513,'','submissionFileId','137'),(2584,513,'','submissionId','17'),(2585,513,'','username','dbarnes'),(2586,514,'','fileId','73'),(2587,514,'en','filename','chapter2.pdf'),(2588,514,'','fileStage','19'),(2589,514,'','sourceSubmissionFileId','133'),(2590,514,'','submissionFileId','138'),(2591,514,'','submissionId','17'),(2592,514,'','username','dbarnes'),(2593,515,'','fileId','73'),(2594,515,'en','filename','chapter2.pdf'),(2595,515,'','fileStage','19'),(2596,515,'','sourceSubmissionFileId','133'),(2597,515,'','submissionFileId','138'),(2598,515,'','submissionId','17'),(2599,515,'','username','dbarnes'),(2600,516,'','fileId','72'),(2601,516,'en','filename','chapter1.pdf'),(2602,516,'','fileStage','19'),(2603,516,'','sourceSubmissionFileId','132'),(2604,516,'','submissionFileId','139'),(2605,516,'','submissionId','17'),(2606,516,'','username','dbarnes'),(2607,517,'','fileId','72'),(2608,517,'en','filename','chapter1.pdf'),(2609,517,'','fileStage','19'),(2610,517,'','sourceSubmissionFileId','132'),(2611,517,'','submissionFileId','139'),(2612,517,'','submissionId','17'),(2613,517,'','username','dbarnes'),(2614,518,'','fileId','70'),(2615,518,'en','filename','preface.pdf'),(2616,518,'','fileStage','19'),(2617,518,'','sourceSubmissionFileId','130'),(2618,518,'','submissionFileId','140'),(2619,518,'','submissionId','17'),(2620,518,'','username','dbarnes'),(2621,519,'','fileId','70'),(2622,519,'en','filename','preface.pdf'),(2623,519,'','fileStage','19'),(2624,519,'','sourceSubmissionFileId','130'),(2625,519,'','submissionFileId','140'),(2626,519,'','submissionId','17'),(2627,519,'','username','dbarnes'),(2628,520,'','fileId','71'),(2629,520,'en','filename','introduction.pdf'),(2630,520,'','fileStage','19'),(2631,520,'','sourceSubmissionFileId','131'),(2632,520,'','submissionFileId','141'),(2633,520,'','submissionId','17'),(2634,520,'','username','dbarnes'),(2635,521,'','fileId','71'),(2636,521,'en','filename','introduction.pdf'),(2637,521,'','fileStage','19'),(2638,521,'','sourceSubmissionFileId','131'),(2639,521,'','submissionFileId','141'),(2640,521,'','submissionId','17'),(2641,521,'','username','dbarnes'),(2642,522,'','reviewerName','Julie Janssen'),(2643,522,'','round','1'),(2644,522,'','stageId','2'),(2645,522,'','submissionId','17'),(2646,523,'','reviewerName','Paul Hudson'),(2647,523,'','round','1'),(2648,523,'','stageId','2'),(2649,523,'','submissionId','17');
/*!40000 ALTER TABLE `event_log_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A log of all failed jobs.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features`
--

DROP TABLE IF EXISTS `features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features` (
  `feature_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `seq` bigint NOT NULL,
  PRIMARY KEY (`feature_id`),
  UNIQUE KEY `press_features_unique` (`assoc_type`,`assoc_id`,`submission_id`),
  KEY `features_submission_id` (`submission_id`),
  CONSTRAINT `features_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Information about which submissions are featured in the press.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features`
--

LOCK TABLES `features` WRITE;
/*!40000 ALTER TABLE `features` DISABLE KEYS */;
/*!40000 ALTER TABLE `features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `file_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `mimetype` varchar(255) NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb3 COMMENT='Records information in the database about files tracked by the system, linking them to the local filesystem.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'presses/1/monographs/1/69423d2212efc.pdf','application/pdf'),(2,'presses/1/monographs/1/69423d22de97a.pdf','application/pdf'),(3,'presses/1/monographs/1/69423d23c202f.pdf','application/pdf'),(4,'presses/1/monographs/2/69423d56ae74e.pdf','application/pdf'),(5,'presses/1/monographs/2/69423d578fb0c.pdf','application/pdf'),(6,'presses/1/monographs/2/69423d5871b52.pdf','application/pdf'),(7,'presses/1/monographs/2/69423d595f9f0.pdf','application/pdf'),(9,'presses/1/monographs/3/69423dbd2e5a8.pdf','application/pdf'),(10,'presses/1/monographs/3/69423dbe0963a.pdf','application/pdf'),(11,'presses/1/monographs/3/69423dbed6371.pdf','application/pdf'),(12,'presses/1/monographs/3/69423dbfb9b77.pdf','application/pdf'),(13,'presses/1/monographs/3/69423dc0a070c.pdf','application/pdf'),(14,'presses/1/monographs/4/69423de13738f.pdf','application/pdf'),(15,'presses/1/monographs/4/69423de20ed22.pdf','application/pdf'),(16,'presses/1/monographs/4/69423de2db305.pdf','application/pdf'),(17,'presses/1/monographs/4/69423de3b7063.pdf','application/pdf'),(18,'presses/1/monographs/5/69423e2faf95c.pdf','application/pdf'),(19,'presses/1/monographs/5/69423e307d059.pdf','application/pdf'),(20,'presses/1/monographs/5/69423e31450dc.pdf','application/pdf'),(21,'presses/1/monographs/5/69423e3206bc1.pdf','application/pdf'),(22,'presses/1/monographs/5/69423e32bf2b5.pdf','application/pdf'),(23,'presses/1/monographs/5/69423e3385b08.pdf','application/pdf'),(24,'presses/1/monographs/6/69423e9f474f9.pdf','application/pdf'),(25,'presses/1/monographs/6/69423ea024df4.pdf','application/pdf'),(26,'presses/1/monographs/6/69423ea100541.pdf','application/pdf'),(27,'presses/1/monographs/6/69423ea1da43e.pdf','application/pdf'),(28,'presses/1/monographs/7/69423edad1e58.pdf','application/pdf'),(29,'presses/1/monographs/7/69423edbae874.pdf','application/pdf'),(30,'presses/1/monographs/7/69423edc8f4ec.pdf','application/pdf'),(31,'presses/1/monographs/7/69423edd7393b.pdf','application/pdf'),(32,'presses/1/monographs/7/69423ede583ac.pdf','application/pdf'),(33,'presses/1/monographs/8/69423f1762416.pdf','application/pdf'),(34,'presses/1/monographs/9/69423f1e9cf0b.pdf','application/pdf'),(35,'presses/1/monographs/9/69423f1f72109.pdf','application/pdf'),(36,'presses/1/monographs/9/69423f204a9ab.pdf','application/pdf'),(37,'presses/1/monographs/9/69423f2125d68.pdf','application/pdf'),(38,'presses/1/monographs/9/69423f220969d.pdf','application/pdf'),(39,'presses/1/monographs/10/69423f4d5efcf.pdf','application/pdf'),(40,'presses/1/monographs/10/69423f4e344b1.pdf','application/pdf'),(41,'presses/1/monographs/10/69423f4f13ecd.pdf','application/pdf'),(42,'presses/1/monographs/10/69423f4fe64d0.pdf','application/pdf'),(43,'presses/1/monographs/10/69423f50c8482.pdf','application/pdf'),(44,'presses/1/monographs/10/69423f51b2aa1.pdf','application/pdf'),(45,'presses/1/monographs/10/69423f5295447.pdf','application/pdf'),(46,'presses/1/monographs/10/69423f537e0af.pdf','application/pdf'),(47,'presses/1/monographs/10/69423f5469440.pdf','application/pdf'),(48,'presses/1/monographs/11/69423f8d448a0.pdf','application/pdf'),(49,'presses/1/monographs/11/69423f8e1ed72.pdf','application/pdf'),(50,'presses/1/monographs/12/69423fd75077f.pdf','application/pdf'),(51,'presses/1/monographs/12/69423fd82cc00.pdf','application/pdf'),(52,'presses/1/monographs/12/69423fd90bea2.pdf','application/pdf'),(53,'presses/1/monographs/13/69424012cda94.pdf','application/pdf'),(54,'presses/1/monographs/13/69424013a2536.pdf','application/pdf'),(55,'presses/1/monographs/13/694240147bdfa.pdf','application/pdf'),(56,'presses/1/monographs/14/6942406d44a69.pdf','application/pdf'),(57,'presses/1/monographs/14/6942406e1be32.pdf','application/pdf'),(58,'presses/1/monographs/14/6942406ee9495.pdf','application/pdf'),(59,'presses/1/monographs/14/6942406fc410a.pdf','application/pdf'),(60,'presses/1/monographs/14/69424070a76f8.pdf','application/pdf'),(61,'presses/1/monographs/14/694240716203e.pdf','application/pdf'),(62,'presses/1/monographs/15/694240e16f52f.pdf','application/pdf'),(63,'presses/1/monographs/15/694240e2454f2.pdf','application/pdf'),(64,'presses/1/monographs/15/694240e3237dd.pdf','application/pdf'),(65,'presses/1/monographs/16/694241017cbbf.pdf','application/pdf'),(66,'presses/1/monographs/16/6942410251c22.pdf','application/pdf'),(67,'presses/1/monographs/16/694241032ecbb.pdf','application/pdf'),(68,'presses/1/monographs/16/6942410407ac8.pdf','application/pdf'),(69,'presses/1/monographs/16/69424104dacec.pdf','application/pdf'),(70,'presses/1/monographs/17/694241491e35f.pdf','application/pdf'),(71,'presses/1/monographs/17/69424149e5dbc.pdf','application/pdf'),(72,'presses/1/monographs/17/6942414ac53eb.pdf','application/pdf'),(73,'presses/1/monographs/17/6942414b9fb0d.pdf','application/pdf'),(74,'presses/1/monographs/17/6942414c78239.pdf','application/pdf'),(75,'presses/1/monographs/17/6942414d5d88e.pdf','application/pdf');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_groups`
--

DROP TABLE IF EXISTS `filter_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_groups` (
  `filter_group_id` bigint NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `input_type` varchar(255) DEFAULT NULL,
  `output_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`filter_group_id`),
  UNIQUE KEY `filter_groups_symbolic` (`symbolic`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COMMENT='Filter groups are used to organized filters into named sets, which can be retrieved by the application for invocation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_groups`
--

LOCK TABLES `filter_groups` WRITE;
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
INSERT INTO `filter_groups` VALUES (1,'publicationFormat=>dc11','plugins.metadata.dc11.publicationFormatAdapter.displayName','plugins.metadata.dc11.publicationFormatAdapter.description','class::classes.publicationFormat.PublicationFormat','metadata::APP\\plugins\\metadata\\dc11\\schema\\Dc11Schema(PUBLICATION_FORMAT)'),(2,'monographs=>onix30-xml','plugins.importexport.onix30.displayName','plugins.importexport.onix30.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/onix30/ONIX_BookProduct_3.0_reference.xsd)'),(3,'monograph=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),(4,'native-xml=>monograph','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),(5,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.author.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),(6,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.author.Author[]'),(7,'publication-format=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publicationFormat.PublicationFormat','xml::schema(plugins/importexport/native/native.xsd)'),(8,'native-xml=>PublicationFormat','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publicationFormat.PublicationFormat[]'),(9,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submissionFile.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),(10,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submissionFile.SubmissionFile[]'),(11,'monograph=>onix30-xml','plugins.importexport.onix30.displayName','plugins.importexport.onix30.description','class::classes.submission.Submission','xml::schema(plugins/importexport/native/ONIX_BookProduct_3.0_reference_notstrict.xsd)'),(12,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),(13,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication[]'),(14,'chapter=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.monograph.Chapter[]','xml::schema(plugins/importexport/native/native.xsd)'),(15,'native-xml=>chapter','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.monograph.Chapter[]'),(16,'user=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.user.User[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(17,'user-xml=>user','plugins.importexport.users.displayName','plugins.importexport.users.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::classes.users.User[]'),(18,'usergroup=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.security.UserGroup[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(19,'user-xml=>usergroup','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::lib.pkp.classes.security.UserGroup[]');
/*!40000 ALTER TABLE `filter_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_settings`
--

DROP TABLE IF EXISTS `filter_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_settings` (
  `filter_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `filter_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`filter_setting_id`),
  UNIQUE KEY `filter_settings_unique` (`filter_id`,`locale`,`setting_name`),
  KEY `filter_settings_id` (`filter_id`),
  CONSTRAINT `filter_settings_filter_id_foreign` FOREIGN KEY (`filter_id`) REFERENCES `filters` (`filter_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about filters, including localized content.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_settings`
--

LOCK TABLES `filter_settings` WRITE;
/*!40000 ALTER TABLE `filter_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filters`
--

DROP TABLE IF EXISTS `filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filters` (
  `filter_id` bigint NOT NULL AUTO_INCREMENT,
  `filter_group_id` bigint NOT NULL DEFAULT '0',
  `context_id` bigint NOT NULL DEFAULT '0',
  `display_name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `is_template` smallint NOT NULL DEFAULT '0',
  `parent_filter_id` bigint NOT NULL DEFAULT '0',
  `seq` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`filter_id`),
  KEY `filters_filter_group_id` (`filter_group_id`),
  CONSTRAINT `filters_filter_group_id_foreign` FOREIGN KEY (`filter_group_id`) REFERENCES `filter_groups` (`filter_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COMMENT='Filters represent a transformation of a supported piece of data from one form to another, such as a PHP object into an XML document.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,1,0,'Extract metadata from a(n) PublicationFormat','APP\\plugins\\metadata\\dc11\\filter\\Dc11SchemaPublicationFormatAdapter',0,0,0),(2,2,0,'ONIX 3.0 XML monograph export','APP\\plugins\\importexport\\onix30\\filter\\MonographONIX30XmlFilter',0,0,0),(3,3,0,'Native XML submission export','APP\\plugins\\importexport\\native\\filter\\MonographNativeXmlFilter',0,0,0),(4,4,0,'Native XML submission import','APP\\plugins\\importexport\\native\\filter\\NativeXmlMonographFilter',0,0,0),(5,5,0,'Native XML author export','APP\\plugins\\importexport\\native\\filter\\AuthorNativeXmlFilter',0,0,0),(6,6,0,'Native XML author import','APP\\plugins\\importexport\\native\\filter\\NativeXmlAuthorFilter',0,0,0),(7,7,0,'Native XML representation export','APP\\plugins\\importexport\\native\\filter\\PublicationFormatNativeXmlFilter',0,0,0),(8,8,0,'Native XML representation import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPublicationFormatFilter',0,0,0),(9,10,0,'Native XML submission file import','APP\\plugins\\importexport\\native\\filter\\NativeXmlMonographFileFilter',0,0,0),(10,9,0,'Native XML submission file export','PKP\\plugins\\importexport\\native\\filter\\SubmissionFileNativeXmlFilter',0,0,0),(11,11,0,'ONIX 3.0 XML monograph export','APP\\plugins\\importexport\\onix30\\filter\\MonographONIX30XmlFilter',0,0,0),(12,12,0,'Native XML Publication export','APP\\plugins\\importexport\\native\\filter\\PublicationNativeXmlFilter',0,0,0),(13,13,0,'Native XML publication import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPublicationFilter',0,0,0),(14,14,0,'Native XML chapter export','APP\\plugins\\importexport\\native\\filter\\ChapterNativeXmlFilter',0,0,0),(15,15,0,'Native XML Chapter import','APP\\plugins\\importexport\\native\\filter\\NativeXmlChapterFilter',0,0,0),(16,16,0,'User XML user export','PKP\\plugins\\importexport\\users\\filter\\PKPUserUserXmlFilter',0,0,0),(17,17,0,'User XML user import','PKP\\plugins\\importexport\\users\\filter\\UserXmlPKPUserFilter',0,0,0),(18,18,0,'Native XML user group export','PKP\\plugins\\importexport\\users\\filter\\UserGroupNativeXmlFilter',0,0,0),(19,19,0,'Native XML user group import','PKP\\plugins\\importexport\\users\\filter\\NativeXmlUserGroupFilter',0,0,0);
/*!40000 ALTER TABLE `filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_settings`
--

DROP TABLE IF EXISTS `genre_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre_settings` (
  `genre_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `genre_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`genre_setting_id`),
  UNIQUE KEY `genre_settings_unique` (`genre_id`,`locale`,`setting_name`),
  KEY `genre_settings_genre_id` (`genre_id`),
  CONSTRAINT `genre_settings_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COMMENT='More data about file genres, including localized properties such as the genre name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_settings`
--

LOCK TABLES `genre_settings` WRITE;
/*!40000 ALTER TABLE `genre_settings` DISABLE KEYS */;
INSERT INTO `genre_settings` VALUES (1,1,'en','name','Appendix','string'),(2,1,'fr_CA','name','Annexe','string'),(3,2,'en','name','Bibliography','string'),(4,2,'fr_CA','name','Bibliographie','string'),(5,3,'en','name','Book Manuscript','string'),(6,3,'fr_CA','name','Manuscrit de livre','string'),(7,4,'en','name','Chapter Manuscript','string'),(8,4,'fr_CA','name','Manuscrit de chapitre','string'),(9,5,'en','name','Glossary','string'),(10,5,'fr_CA','name','Glossaire','string'),(11,6,'en','name','Index','string'),(12,6,'fr_CA','name','Index','string'),(13,7,'en','name','Preface','string'),(14,7,'fr_CA','name','Préface','string'),(15,8,'en','name','Prospectus','string'),(16,8,'fr_CA','name','Prospectus','string'),(17,9,'en','name','Table','string'),(18,9,'fr_CA','name','Tableau','string'),(19,10,'en','name','Figure','string'),(20,10,'fr_CA','name','Figure','string'),(21,11,'en','name','Photo','string'),(22,11,'fr_CA','name','Photographie','string'),(23,12,'en','name','Illustration','string'),(24,12,'fr_CA','name','Illustration','string'),(25,13,'en','name','Other','string'),(26,13,'fr_CA','name','Autre','string'),(27,14,'en','name','Image','string'),(28,14,'fr_CA','name','Image','string'),(29,15,'en','name','HTML Stylesheet','string'),(30,15,'fr_CA','name','Feuille de style HTML','string');
/*!40000 ALTER TABLE `genre_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `seq` bigint NOT NULL,
  `enabled` smallint NOT NULL DEFAULT '1',
  `category` bigint NOT NULL DEFAULT '1',
  `dependent` smallint NOT NULL DEFAULT '0',
  `supplementary` smallint NOT NULL DEFAULT '0',
  `required` smallint NOT NULL DEFAULT '0' COMMENT 'Whether or not at least one file of this genre is required for a new submission.',
  `entry_key` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`genre_id`),
  KEY `genres_context_id` (`context_id`),
  CONSTRAINT `genres_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COMMENT='The types of submission files configured for each context, such as Article Text, Data Set, Transcript, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,1,0,1,1,0,1,0,'APPENDIX'),(2,1,1,1,1,0,1,0,'BIBLIOGRAPHY'),(3,1,2,1,1,0,0,1,'MANUSCRIPT'),(4,1,3,1,1,0,0,0,'CHAPTER'),(5,1,4,1,1,0,1,0,'GLOSSARY'),(6,1,5,1,1,0,1,0,'INDEX'),(7,1,6,1,1,0,1,0,'PREFACE'),(8,1,7,1,3,0,1,0,'PROSPECTUS'),(9,1,8,1,2,0,1,0,'TABLE'),(10,1,9,1,2,0,1,0,'FIGURE'),(11,1,10,1,2,0,1,0,'PHOTO'),(12,1,11,1,2,0,1,0,'ILLUSTRATION'),(13,1,15,1,3,0,1,0,'OTHER'),(14,1,13,1,2,1,0,0,'IMAGE'),(15,1,14,1,1,1,0,0,'STYLE');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identification_codes`
--

DROP TABLE IF EXISTS `identification_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identification_codes` (
  `identification_code_id` bigint NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint NOT NULL,
  `code` varchar(40) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`identification_code_id`),
  KEY `identification_codes_publication_format_id` (`publication_format_id`),
  KEY `identification_codes_key` (`identification_code_id`,`publication_format_id`,`code`),
  CONSTRAINT `identification_codes_publication_format_id` FOREIGN KEY (`publication_format_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='ONIX identification codes for publication formats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identification_codes`
--

LOCK TABLES `identification_codes` WRITE;
/*!40000 ALTER TABLE `identification_codes` DISABLE KEYS */;
INSERT INTO `identification_codes` VALUES (1,1,'02','951-98548-9-4'),(2,1,'15','978-951-98548-9-2');
/*!40000 ALTER TABLE `identification_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution_ip`
--

DROP TABLE IF EXISTS `institution_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institution_ip` (
  `institution_ip_id` bigint NOT NULL AUTO_INCREMENT,
  `institution_id` bigint NOT NULL,
  `ip_string` varchar(40) NOT NULL,
  `ip_start` bigint NOT NULL,
  `ip_end` bigint DEFAULT NULL,
  PRIMARY KEY (`institution_ip_id`),
  KEY `institution_ip_institution_id` (`institution_id`),
  KEY `institution_ip_start` (`ip_start`),
  KEY `institution_ip_end` (`ip_end`),
  CONSTRAINT `institution_ip_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Records IP address ranges and associates them with institutions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution_ip`
--

LOCK TABLES `institution_ip` WRITE;
/*!40000 ALTER TABLE `institution_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `institution_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution_settings`
--

DROP TABLE IF EXISTS `institution_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institution_settings` (
  `institution_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `institution_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`institution_setting_id`),
  UNIQUE KEY `institution_settings_unique` (`institution_id`,`locale`,`setting_name`),
  KEY `institution_settings_institution_id` (`institution_id`),
  CONSTRAINT `institution_settings_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about institutions, including localized properties like names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution_settings`
--

LOCK TABLES `institution_settings` WRITE;
/*!40000 ALTER TABLE `institution_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `institution_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutions`
--

DROP TABLE IF EXISTS `institutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institutions` (
  `institution_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `ror` varchar(255) DEFAULT NULL COMMENT 'ROR (Research Organization Registry) ID',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`institution_id`),
  KEY `institutions_context_id` (`context_id`),
  CONSTRAINT `institutions_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Institutions for statistics and subscriptions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutions`
--

LOCK TABLES `institutions` WRITE;
/*!40000 ALTER TABLE `institutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` text NOT NULL,
  `options` mediumtext,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Job batches allow jobs to be collected into groups for managed processing.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
INSERT INTO `job_batches` VALUES ('a09cb14d-f3f5-4db4-a8a2-6a2119e9c348','',0,0,0,'[]','a:0:{}',NULL,1765948500,NULL);
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='All pending or in-progress jobs.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_file_settings`
--

DROP TABLE IF EXISTS `library_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_file_settings` (
  `library_file_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `file_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)',
  PRIMARY KEY (`library_file_setting_id`),
  UNIQUE KEY `library_file_settings_unique` (`file_id`,`locale`,`setting_name`),
  KEY `library_file_settings_file_id` (`file_id`),
  CONSTRAINT `library_file_settings_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `library_files` (`file_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about library files, including localized content such as names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_file_settings`
--

LOCK TABLES `library_file_settings` WRITE;
/*!40000 ALTER TABLE `library_file_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_file_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_files`
--

DROP TABLE IF EXISTS `library_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_files` (
  `file_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `original_file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint NOT NULL,
  `type` smallint NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `submission_id` bigint DEFAULT NULL,
  `public_access` smallint DEFAULT '0',
  PRIMARY KEY (`file_id`),
  KEY `library_files_context_id` (`context_id`),
  KEY `library_files_submission_id` (`submission_id`),
  CONSTRAINT `library_files_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `library_files_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Library files can be associated with the context (press/server/journal) or with individual submissions, and are typically forms, agreements, and other administrative documents that are not part of the scholarly content.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_files`
--

LOCK TABLES `library_files` WRITE;
/*!40000 ALTER TABLE `library_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `markets`
--

DROP TABLE IF EXISTS `markets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `markets` (
  `market_id` bigint NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint NOT NULL,
  `countries_included` text,
  `countries_excluded` text,
  `regions_included` text,
  `regions_excluded` text,
  `market_date_role` varchar(40) NOT NULL,
  `market_date_format` varchar(40) NOT NULL,
  `market_date` varchar(255) NOT NULL,
  `price` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `price_type_code` varchar(255) DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `tax_rate_code` varchar(255) DEFAULT NULL,
  `tax_type_code` varchar(255) DEFAULT NULL,
  `agent_id` bigint DEFAULT NULL,
  `supplier_id` bigint DEFAULT NULL,
  PRIMARY KEY (`market_id`),
  KEY `markets_publication_format_id` (`publication_format_id`),
  KEY `format_markets_pkey` (`market_id`,`publication_format_id`),
  CONSTRAINT `markets_publication_format_id` FOREIGN KEY (`publication_format_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='ONIX market information for publication formats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `markets`
--

LOCK TABLES `markets` WRITE;
/*!40000 ALTER TABLE `markets` DISABLE KEYS */;
/*!40000 ALTER TABLE `markets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_context`
--

DROP TABLE IF EXISTS `metrics_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_context` (
  `metrics_context_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint NOT NULL,
  `date` date NOT NULL,
  `metric` int NOT NULL,
  PRIMARY KEY (`metrics_context_id`),
  KEY `metrics_context_load_id` (`load_id`),
  KEY `metrics_context_context_id` (`context_id`),
  CONSTRAINT `metrics_context_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics for views of the homepage.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_context`
--

LOCK TABLES `metrics_context` WRITE;
/*!40000 ALTER TABLE `metrics_context` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_counter_submission_daily`
--

DROP TABLE IF EXISTS `metrics_counter_submission_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_counter_submission_daily` (
  `metrics_counter_submission_daily_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `date` date NOT NULL,
  `metric_book_investigations` int NOT NULL,
  `metric_book_investigations_unique` int NOT NULL,
  `metric_book_requests` int NOT NULL,
  `metric_book_requests_unique` int NOT NULL,
  `metric_chapter_investigations` int NOT NULL,
  `metric_chapter_investigations_unique` int NOT NULL,
  `metric_chapter_requests` int NOT NULL,
  `metric_chapter_requests_unique` int NOT NULL,
  `metric_title_investigations_unique` int NOT NULL,
  `metric_title_requests_unique` int NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_daily_id`),
  UNIQUE KEY `msd_uc_load_id_context_id_submission_id_date` (`load_id`,`context_id`,`submission_id`,`date`),
  KEY `msd_load_id` (`load_id`),
  KEY `metrics_counter_submission_daily_context_id` (`context_id`),
  KEY `metrics_counter_submission_daily_submission_id` (`submission_id`),
  KEY `msd_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msd_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msd_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics matching the COUNTER R5 protocol for views and downloads of published submissions and files.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_counter_submission_daily`
--

LOCK TABLES `metrics_counter_submission_daily` WRITE;
/*!40000 ALTER TABLE `metrics_counter_submission_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_counter_submission_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_counter_submission_institution_daily`
--

DROP TABLE IF EXISTS `metrics_counter_submission_institution_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_counter_submission_institution_daily` (
  `metrics_counter_submission_institution_daily_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `institution_id` bigint NOT NULL,
  `date` date NOT NULL,
  `metric_book_investigations` int NOT NULL,
  `metric_book_investigations_unique` int NOT NULL,
  `metric_book_requests` int NOT NULL,
  `metric_book_requests_unique` int NOT NULL,
  `metric_chapter_investigations` int NOT NULL,
  `metric_chapter_investigations_unique` int NOT NULL,
  `metric_chapter_requests` int NOT NULL,
  `metric_chapter_requests_unique` int NOT NULL,
  `metric_title_investigations_unique` int NOT NULL,
  `metric_title_requests_unique` int NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_institution_daily_id`),
  UNIQUE KEY `msid_uc_load_id_context_id_submission_id_institution_id_date` (`load_id`,`context_id`,`submission_id`,`institution_id`,`date`),
  KEY `msid_load_id` (`load_id`),
  KEY `msid_context_id` (`context_id`),
  KEY `msid_submission_id` (`submission_id`),
  KEY `msid_institution_id` (`institution_id`),
  KEY `msid_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msid_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msid_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE,
  CONSTRAINT `msid_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics matching the COUNTER R5 protocol for views and downloads from institutions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_counter_submission_institution_daily`
--

LOCK TABLES `metrics_counter_submission_institution_daily` WRITE;
/*!40000 ALTER TABLE `metrics_counter_submission_institution_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_counter_submission_institution_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_counter_submission_institution_monthly`
--

DROP TABLE IF EXISTS `metrics_counter_submission_institution_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_counter_submission_institution_monthly` (
  `metrics_counter_submission_institution_monthly_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `institution_id` bigint NOT NULL,
  `month` int NOT NULL,
  `metric_book_investigations` int NOT NULL,
  `metric_book_investigations_unique` int NOT NULL,
  `metric_book_requests` int NOT NULL,
  `metric_book_requests_unique` int NOT NULL,
  `metric_chapter_investigations` int NOT NULL,
  `metric_chapter_investigations_unique` int NOT NULL,
  `metric_chapter_requests` int NOT NULL,
  `metric_chapter_requests_unique` int NOT NULL,
  `metric_title_investigations_unique` int NOT NULL,
  `metric_title_requests_unique` int NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_institution_monthly_id`),
  UNIQUE KEY `msim_uc_context_id_submission_id_institution_id_month` (`context_id`,`submission_id`,`institution_id`,`month`),
  KEY `msim_context_id` (`context_id`),
  KEY `msim_submission_id` (`submission_id`),
  KEY `msim_institution_id` (`institution_id`),
  KEY `msim_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msim_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msim_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE,
  CONSTRAINT `msim_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Monthly statistics matching the COUNTER R5 protocol for views and downloads from institutions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_counter_submission_institution_monthly`
--

LOCK TABLES `metrics_counter_submission_institution_monthly` WRITE;
/*!40000 ALTER TABLE `metrics_counter_submission_institution_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_counter_submission_institution_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_counter_submission_monthly`
--

DROP TABLE IF EXISTS `metrics_counter_submission_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_counter_submission_monthly` (
  `metrics_counter_submission_monthly_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `month` int NOT NULL,
  `metric_book_investigations` int NOT NULL,
  `metric_book_investigations_unique` int NOT NULL,
  `metric_book_requests` int NOT NULL,
  `metric_book_requests_unique` int NOT NULL,
  `metric_chapter_investigations` int NOT NULL,
  `metric_chapter_investigations_unique` int NOT NULL,
  `metric_chapter_requests` int NOT NULL,
  `metric_chapter_requests_unique` int NOT NULL,
  `metric_title_investigations_unique` int NOT NULL,
  `metric_title_requests_unique` int NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_monthly_id`),
  UNIQUE KEY `msm_uc_context_id_submission_id_month` (`context_id`,`submission_id`,`month`),
  KEY `metrics_counter_submission_monthly_context_id` (`context_id`),
  KEY `metrics_counter_submission_monthly_submission_id` (`submission_id`),
  KEY `msm_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msm_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msm_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Monthly statistics matching the COUNTER R5 protocol for views and downloads of published submissions and files.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_counter_submission_monthly`
--

LOCK TABLES `metrics_counter_submission_monthly` WRITE;
/*!40000 ALTER TABLE `metrics_counter_submission_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_counter_submission_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_series`
--

DROP TABLE IF EXISTS `metrics_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_series` (
  `metrics_series_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint NOT NULL,
  `series_id` bigint NOT NULL,
  `date` date NOT NULL,
  `metric` int NOT NULL,
  PRIMARY KEY (`metrics_series_id`),
  KEY `metrics_series_load_id` (`load_id`),
  KEY `metrics_series_context_id` (`context_id`),
  KEY `metrics_series_series_id` (`series_id`),
  KEY `metrics_series_context_id_series_id` (`context_id`,`series_id`),
  CONSTRAINT `metrics_series_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_series_series_id_foreign` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics for views of published submissions in each series.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_series`
--

LOCK TABLES `metrics_series` WRITE;
/*!40000 ALTER TABLE `metrics_series` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_submission`
--

DROP TABLE IF EXISTS `metrics_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_submission` (
  `metrics_submission_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `chapter_id` bigint DEFAULT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `file_type` bigint DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `date` date NOT NULL,
  `metric` int NOT NULL,
  PRIMARY KEY (`metrics_submission_id`),
  KEY `ms_load_id` (`load_id`),
  KEY `metrics_submission_context_id` (`context_id`),
  KEY `metrics_submission_submission_id` (`submission_id`),
  KEY `metrics_submission_chapter_id` (`chapter_id`),
  KEY `metrics_submission_representation_id` (`representation_id`),
  KEY `metrics_submission_submission_file_id` (`submission_file_id`),
  KEY `ms_context_id_submission_id_assoc_type_file_type` (`context_id`,`submission_id`,`assoc_type`,`file_type`),
  CONSTRAINT `metrics_submission_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_submission_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_submission_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_submission_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_submission_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics for views and downloads of published submissions and files.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_submission`
--

LOCK TABLES `metrics_submission` WRITE;
/*!40000 ALTER TABLE `metrics_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_submission_geo_daily`
--

DROP TABLE IF EXISTS `metrics_submission_geo_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_submission_geo_daily` (
  `metrics_submission_geo_daily_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `date` date NOT NULL,
  `metric` int NOT NULL,
  `metric_unique` int NOT NULL,
  PRIMARY KEY (`metrics_submission_geo_daily_id`),
  UNIQUE KEY `msgd_uc_load_context_submission_c_r_c_date` (`load_id`,`context_id`,`submission_id`,`country`,`region`,`city`(80),`date`),
  KEY `msgd_load_id` (`load_id`),
  KEY `metrics_submission_geo_daily_context_id` (`context_id`),
  KEY `metrics_submission_geo_daily_submission_id` (`submission_id`),
  KEY `msgd_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msgd_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msgd_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics by country, region and city for views and downloads of published submissions and files.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_submission_geo_daily`
--

LOCK TABLES `metrics_submission_geo_daily` WRITE;
/*!40000 ALTER TABLE `metrics_submission_geo_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_submission_geo_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_submission_geo_monthly`
--

DROP TABLE IF EXISTS `metrics_submission_geo_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_submission_geo_monthly` (
  `metrics_submission_geo_monthly_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `month` int NOT NULL,
  `metric` int NOT NULL,
  `metric_unique` int NOT NULL,
  PRIMARY KEY (`metrics_submission_geo_monthly_id`),
  UNIQUE KEY `msgm_uc_context_submission_c_r_c_month` (`context_id`,`submission_id`,`country`,`region`,`city`(80),`month`),
  KEY `metrics_submission_geo_monthly_context_id` (`context_id`),
  KEY `metrics_submission_geo_monthly_submission_id` (`submission_id`),
  KEY `msgm_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msgm_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msgm_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Monthly statistics by country, region and city for views and downloads of published submissions and files.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_submission_geo_monthly`
--

LOCK TABLES `metrics_submission_geo_monthly` WRITE;
/*!40000 ALTER TABLE `metrics_submission_geo_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_submission_geo_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_assignment_settings`
--

DROP TABLE IF EXISTS `navigation_menu_item_assignment_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_item_assignment_settings` (
  `navigation_menu_item_assignment_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `navigation_menu_item_assignment_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`navigation_menu_item_assignment_setting_id`),
  UNIQUE KEY `navigation_menu_item_assignment_settings_unique` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_assignment_settings_n_m_i_a_id` (`navigation_menu_item_assignment_id`),
  CONSTRAINT `assignment_settings_navigation_menu_item_assignment_id` FOREIGN KEY (`navigation_menu_item_assignment_id`) REFERENCES `navigation_menu_item_assignments` (`navigation_menu_item_assignment_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about navigation menu item assignments to navigation menus, including localized content.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_assignment_settings`
--

LOCK TABLES `navigation_menu_item_assignment_settings` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_assignment_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `navigation_menu_item_assignment_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_assignments`
--

DROP TABLE IF EXISTS `navigation_menu_item_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_item_assignments` (
  `navigation_menu_item_assignment_id` bigint NOT NULL AUTO_INCREMENT,
  `navigation_menu_id` bigint NOT NULL,
  `navigation_menu_item_id` bigint NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `seq` bigint DEFAULT '0',
  PRIMARY KEY (`navigation_menu_item_assignment_id`),
  KEY `navigation_menu_item_assignments_navigation_menu_id` (`navigation_menu_id`),
  KEY `navigation_menu_item_assignments_navigation_menu_item_id` (`navigation_menu_item_id`),
  CONSTRAINT `navigation_menu_item_assignments_navigation_menu_id_foreign` FOREIGN KEY (`navigation_menu_id`) REFERENCES `navigation_menus` (`navigation_menu_id`) ON DELETE CASCADE,
  CONSTRAINT `navigation_menu_item_assignments_navigation_menu_item_id_foreign` FOREIGN KEY (`navigation_menu_item_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COMMENT='Links navigation menu items to navigation menus.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_assignments`
--

LOCK TABLES `navigation_menu_item_assignments` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_assignments` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_assignments` VALUES (1,1,1,0,0),(2,1,2,0,1),(3,1,3,0,2),(4,1,4,3,0),(5,1,5,3,1),(6,1,6,3,2),(7,1,7,3,3),(8,2,8,0,0),(9,2,9,0,1),(10,2,10,0,2),(11,2,11,10,0),(12,2,12,10,1),(13,2,13,10,2),(14,2,14,10,3),(15,3,15,0,0),(16,3,16,0,1),(17,3,17,0,2),(18,3,18,17,0),(19,3,19,17,1),(20,3,20,17,2),(21,3,21,17,3),(22,3,22,17,4);
/*!40000 ALTER TABLE `navigation_menu_item_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_settings`
--

DROP TABLE IF EXISTS `navigation_menu_item_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_item_settings` (
  `navigation_menu_item_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `navigation_menu_item_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`navigation_menu_item_setting_id`),
  UNIQUE KEY `navigation_menu_item_settings_unique` (`navigation_menu_item_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_settings_navigation_menu_item_id` (`navigation_menu_item_id`),
  CONSTRAINT `navigation_menu_item_settings_navigation_menu_id` FOREIGN KEY (`navigation_menu_item_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COMMENT='More data about navigation menu items, including localized content such as names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_settings`
--

LOCK TABLES `navigation_menu_item_settings` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_settings` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_settings` VALUES (1,1,'','titleLocaleKey','navigation.register','string'),(2,2,'','titleLocaleKey','navigation.login','string'),(3,3,'','titleLocaleKey','{$loggedInUsername}','string'),(4,4,'','titleLocaleKey','navigation.dashboard','string'),(5,5,'','titleLocaleKey','common.viewProfile','string'),(6,6,'','titleLocaleKey','navigation.admin','string'),(7,7,'','titleLocaleKey','user.logOut','string'),(8,8,'','titleLocaleKey','navigation.register','string'),(9,9,'','titleLocaleKey','navigation.login','string'),(10,10,'','titleLocaleKey','{$loggedInUsername}','string'),(11,11,'','titleLocaleKey','navigation.dashboard','string'),(12,12,'','titleLocaleKey','common.viewProfile','string'),(13,13,'','titleLocaleKey','navigation.admin','string'),(14,14,'','titleLocaleKey','user.logOut','string'),(15,15,'','titleLocaleKey','navigation.catalog','string'),(16,16,'','titleLocaleKey','manager.announcements','string'),(17,17,'','titleLocaleKey','navigation.about','string'),(18,18,'','titleLocaleKey','about.aboutContext','string'),(19,19,'','titleLocaleKey','about.submissions','string'),(20,20,'','titleLocaleKey','about.editorialTeam','string'),(21,21,'','titleLocaleKey','manager.setup.privacyStatement','string'),(22,22,'','titleLocaleKey','about.contact','string'),(23,23,'','titleLocaleKey','common.search','string');
/*!40000 ALTER TABLE `navigation_menu_item_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_items`
--

DROP TABLE IF EXISTS `navigation_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_items` (
  `navigation_menu_item_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `path` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT '',
  PRIMARY KEY (`navigation_menu_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COMMENT='Navigation menu items are single elements within a navigation menu.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_items`
--

LOCK TABLES `navigation_menu_items` WRITE;
/*!40000 ALTER TABLE `navigation_menu_items` DISABLE KEYS */;
INSERT INTO `navigation_menu_items` VALUES (1,0,NULL,'NMI_TYPE_USER_REGISTER'),(2,0,NULL,'NMI_TYPE_USER_LOGIN'),(3,0,NULL,'NMI_TYPE_USER_DASHBOARD'),(4,0,NULL,'NMI_TYPE_USER_DASHBOARD'),(5,0,NULL,'NMI_TYPE_USER_PROFILE'),(6,0,NULL,'NMI_TYPE_ADMINISTRATION'),(7,0,NULL,'NMI_TYPE_USER_LOGOUT'),(8,1,NULL,'NMI_TYPE_USER_REGISTER'),(9,1,NULL,'NMI_TYPE_USER_LOGIN'),(10,1,NULL,'NMI_TYPE_USER_DASHBOARD'),(11,1,NULL,'NMI_TYPE_USER_DASHBOARD'),(12,1,NULL,'NMI_TYPE_USER_PROFILE'),(13,1,NULL,'NMI_TYPE_ADMINISTRATION'),(14,1,NULL,'NMI_TYPE_USER_LOGOUT'),(15,1,NULL,'NMI_TYPE_CATALOG'),(16,1,NULL,'NMI_TYPE_ANNOUNCEMENTS'),(17,1,NULL,'NMI_TYPE_ABOUT'),(18,1,NULL,'NMI_TYPE_ABOUT'),(19,1,NULL,'NMI_TYPE_SUBMISSIONS'),(20,1,NULL,'NMI_TYPE_EDITORIAL_TEAM'),(21,1,NULL,'NMI_TYPE_PRIVACY'),(22,1,NULL,'NMI_TYPE_CONTACT'),(23,1,NULL,'NMI_TYPE_SEARCH');
/*!40000 ALTER TABLE `navigation_menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menus`
--

DROP TABLE IF EXISTS `navigation_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menus` (
  `navigation_menu_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `area_name` varchar(255) DEFAULT '',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`navigation_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='Navigation menus on the website are installed with the software as a default set, and can be customized.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menus`
--

LOCK TABLES `navigation_menus` WRITE;
/*!40000 ALTER TABLE `navigation_menus` DISABLE KEYS */;
INSERT INTO `navigation_menus` VALUES (1,0,'user','User Navigation Menu'),(2,1,'user','User Navigation Menu'),(3,1,'primary','Primary Navigation Menu');
/*!40000 ALTER TABLE `navigation_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_releases`
--

DROP TABLE IF EXISTS `new_releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_releases` (
  `new_release_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  PRIMARY KEY (`new_release_id`),
  UNIQUE KEY `new_releases_unique` (`assoc_type`,`assoc_id`,`submission_id`),
  KEY `new_releases_submission_id` (`submission_id`),
  CONSTRAINT `new_releases_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Information about which submissions in the press are considered new releases.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_releases`
--

LOCK TABLES `new_releases` WRITE;
/*!40000 ALTER TABLE `new_releases` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_releases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `note_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `contents` text,
  PRIMARY KEY (`note_id`),
  KEY `notes_user_id` (`user_id`),
  KEY `notes_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='Notes allow users to annotate associated entities, such as submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,1048586,1,6,'2025-12-17 05:25:34','2025-12-17 05:25:34','Editor Recommendation','<p>Dear Daniel Barnes, David Buskins,</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission The Information Literacy User’s Guide.</p><p>My recommendation is: Accept Submission.</p><p>Please visit the submission\'s <a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>Minoti Inoue</p>');
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_settings`
--

DROP TABLE IF EXISTS `notification_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_settings` (
  `notification_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `notification_id` bigint NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` mediumtext NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`notification_setting_id`),
  UNIQUE KEY `notification_settings_unique` (`notification_id`,`locale`,`setting_name`),
  KEY `notification_settings_notification_id` (`notification_id`),
  CONSTRAINT `notification_settings_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 COMMENT='More data about notifications, including localized properties.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_settings`
--

LOCK TABLES `notification_settings` WRITE;
/*!40000 ALTER TABLE `notification_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_subscription_settings`
--

DROP TABLE IF EXISTS `notification_subscription_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_subscription_settings` (
  `setting_id` bigint NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` mediumtext NOT NULL,
  `user_id` bigint NOT NULL,
  `context` bigint DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`setting_id`),
  KEY `notification_subscription_settings_user_id` (`user_id`),
  KEY `notification_subscription_settings_context` (`context`),
  CONSTRAINT `notification_subscription_settings_context_foreign` FOREIGN KEY (`context`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `notification_subscription_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COMMENT='Which email notifications a user has chosen to unsubscribe from.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_subscription_settings`
--

LOCK TABLES `notification_subscription_settings` WRITE;
/*!40000 ALTER TABLE `notification_subscription_settings` DISABLE KEYS */;
INSERT INTO `notification_subscription_settings` VALUES (1,'blocked_emailed_notification','8',19,1,'int'),(2,'blocked_emailed_notification','8',20,1,'int'),(3,'blocked_emailed_notification','8',21,1,'int'),(4,'blocked_emailed_notification','8',22,1,'int'),(5,'blocked_emailed_notification','8',23,1,'int'),(6,'blocked_emailed_notification','8',24,1,'int'),(7,'blocked_emailed_notification','8',25,1,'int'),(8,'blocked_emailed_notification','8',26,1,'int'),(9,'blocked_emailed_notification','8',27,1,'int'),(10,'blocked_emailed_notification','8',28,1,'int'),(11,'blocked_emailed_notification','8',29,1,'int'),(12,'blocked_emailed_notification','8',30,1,'int'),(13,'blocked_emailed_notification','8',31,1,'int'),(14,'blocked_emailed_notification','8',32,1,'int'),(15,'blocked_emailed_notification','8',33,1,'int'),(16,'blocked_emailed_notification','8',34,1,'int');
/*!40000 ALTER TABLE `notification_subscription_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `level` bigint NOT NULL,
  `type` bigint NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint DEFAULT NULL,
  `assoc_id` bigint DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `notifications_context_id` (`context_id`),
  KEY `notifications_user_id` (`user_id`),
  KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  KEY `notifications_context_id_level` (`context_id`,`level`),
  KEY `notifications_assoc` (`assoc_type`,`assoc_id`),
  KEY `notifications_user_id_level` (`user_id`,`level`),
  CONSTRAINT `notifications_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8mb3 COMMENT='User notifications created during certain operations.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (14,1,4,2,16777217,'2025-12-17 05:18:41',NULL,1048585,1),(15,1,NULL,2,16777243,'2025-12-17 05:18:42',NULL,1048585,1),(16,1,NULL,2,16777245,'2025-12-17 05:18:42',NULL,1048585,1),(17,1,NULL,2,16777236,'2025-12-17 05:18:48','2025-12-17 05:18:50',523,1),(18,1,12,3,16777227,'2025-12-17 05:18:55',NULL,517,1),(20,1,19,2,16777230,'2025-12-17 05:18:58',NULL,1048585,1),(21,1,4,2,16777251,'2025-12-17 05:18:58',NULL,1048585,1),(31,1,NULL,3,16777220,'2025-12-17 05:20:25',NULL,1048585,2),(32,1,NULL,3,16777222,'2025-12-17 05:20:25',NULL,1048585,2),(33,1,NULL,3,16777223,'2025-12-17 05:20:25',NULL,1048585,2),(34,1,NULL,3,16777224,'2025-12-17 05:20:25',NULL,1048585,2),(35,1,1,3,16777247,'2025-12-17 05:20:25',NULL,1048585,2),(36,1,2,3,16777247,'2025-12-17 05:20:25',NULL,1048585,2),(37,1,3,3,16777247,'2025-12-17 05:20:25',NULL,1048585,2),(38,1,NULL,2,16777243,'2025-12-17 05:20:25',NULL,1048585,2),(39,1,NULL,2,16777245,'2025-12-17 05:20:25',NULL,1048585,2),(40,1,NULL,2,16777236,'2025-12-17 05:20:37','2025-12-17 05:20:41',523,2),(41,1,11,3,16777227,'2025-12-17 05:20:46',NULL,517,2),(43,1,12,3,16777227,'2025-12-17 05:20:53',NULL,517,3),(55,1,NULL,3,16777220,'2025-12-17 05:21:29',NULL,1048585,3),(56,1,NULL,3,16777222,'2025-12-17 05:21:29',NULL,1048585,3),(57,1,NULL,3,16777223,'2025-12-17 05:21:29',NULL,1048585,3),(58,1,NULL,3,16777224,'2025-12-17 05:21:29',NULL,1048585,3),(59,1,1,3,16777247,'2025-12-17 05:21:29',NULL,1048585,3),(60,1,2,3,16777247,'2025-12-17 05:21:29',NULL,1048585,3),(61,1,3,3,16777247,'2025-12-17 05:21:29',NULL,1048585,3),(62,1,NULL,2,16777243,'2025-12-17 05:21:29',NULL,1048585,3),(63,1,NULL,2,16777245,'2025-12-17 05:21:29',NULL,1048585,3),(72,1,3,2,16777217,'2025-12-17 05:22:00',NULL,1048585,4),(73,1,NULL,2,16777243,'2025-12-17 05:22:00',NULL,1048585,4),(74,1,NULL,2,16777245,'2025-12-17 05:22:00','2025-12-17 05:22:39',1048585,4),(75,1,NULL,2,16777236,'2025-12-17 05:22:07','2025-12-17 05:22:10',523,3),(77,1,9,3,16777227,'2025-12-17 05:22:15',NULL,517,4),(79,1,NULL,2,16777236,'2025-12-17 05:22:18','2025-12-17 05:22:20',523,4),(81,1,11,3,16777227,'2025-12-17 05:22:25',NULL,517,5),(86,1,22,2,16777235,'2025-12-17 05:22:37',NULL,1048585,4),(87,1,3,2,16777254,'2025-12-17 05:22:37',NULL,1048585,4),(101,1,NULL,3,16777220,'2025-12-17 05:23:29',NULL,1048585,5),(102,1,NULL,3,16777222,'2025-12-17 05:23:29',NULL,1048585,5),(103,1,NULL,3,16777223,'2025-12-17 05:23:29',NULL,1048585,5),(104,1,NULL,3,16777224,'2025-12-17 05:23:29',NULL,1048585,5),(105,1,1,3,16777247,'2025-12-17 05:23:29',NULL,1048585,5),(106,1,2,3,16777247,'2025-12-17 05:23:29',NULL,1048585,5),(107,1,3,3,16777247,'2025-12-17 05:23:29',NULL,1048585,5),(110,1,NULL,2,16777236,'2025-12-17 05:23:37','2025-12-17 05:23:40',523,5),(112,1,8,3,16777227,'2025-12-17 05:23:45',NULL,517,6),(114,1,NULL,2,16777236,'2025-12-17 05:23:48','2025-12-17 05:23:50',523,6),(116,1,12,3,16777227,'2025-12-17 05:23:55',NULL,517,7),(120,1,23,2,16777235,'2025-12-17 05:24:07',NULL,1048585,5),(123,1,NULL,2,16777246,'2025-12-17 05:24:30','2025-12-17 05:24:34',1048585,5),(132,1,4,2,16777217,'2025-12-17 05:25:10',NULL,1048585,6),(133,1,NULL,2,16777243,'2025-12-17 05:25:10',NULL,1048585,6),(134,1,NULL,2,16777245,'2025-12-17 05:25:10',NULL,1048585,6),(135,1,NULL,2,16777236,'2025-12-17 05:25:18','2025-12-17 05:25:20',523,7),(136,1,24,2,16777229,'2025-12-17 05:25:18',NULL,1048585,6),(139,1,3,3,16777249,'2025-12-17 05:25:34',NULL,1048586,1),(140,1,4,3,16777249,'2025-12-17 05:25:34',NULL,1048586,1),(151,1,3,2,16777217,'2025-12-17 05:26:16',NULL,1048585,7),(152,1,NULL,2,16777243,'2025-12-17 05:26:16',NULL,1048585,7),(153,1,NULL,2,16777245,'2025-12-17 05:26:16',NULL,1048585,7),(154,1,NULL,2,16777236,'2025-12-17 05:26:25','2025-12-17 05:26:27',523,8),(155,1,10,3,16777227,'2025-12-17 05:26:32',NULL,517,8),(157,1,25,2,16777230,'2025-12-17 05:26:36',NULL,1048585,7),(158,1,3,2,16777251,'2025-12-17 05:26:36','2025-12-17 05:26:37',1048585,7),(160,1,1,3,16777247,'2025-12-17 05:26:48',NULL,1048585,8),(161,1,2,3,16777247,'2025-12-17 05:26:48',NULL,1048585,8),(162,1,3,3,16777247,'2025-12-17 05:26:48',NULL,1048585,8),(163,1,NULL,2,16777243,'2025-12-17 05:26:48',NULL,1048585,8),(164,1,NULL,2,16777245,'2025-12-17 05:26:48',NULL,1048585,8),(175,1,4,2,16777217,'2025-12-17 05:27:23',NULL,1048585,9),(176,1,NULL,2,16777243,'2025-12-17 05:27:23',NULL,1048585,9),(177,1,NULL,2,16777245,'2025-12-17 05:27:23',NULL,1048585,9),(178,1,NULL,2,16777236,'2025-12-17 05:27:31','2025-12-17 05:27:34',523,9),(179,1,26,2,16777229,'2025-12-17 05:27:32',NULL,1048585,9),(198,1,NULL,3,16777220,'2025-12-17 05:28:38',NULL,1048585,10),(199,1,NULL,3,16777222,'2025-12-17 05:28:38',NULL,1048585,10),(200,1,NULL,3,16777223,'2025-12-17 05:28:38',NULL,1048585,10),(201,1,NULL,3,16777224,'2025-12-17 05:28:38',NULL,1048585,10),(202,1,1,3,16777247,'2025-12-17 05:28:38',NULL,1048585,10),(203,1,2,3,16777247,'2025-12-17 05:28:38',NULL,1048585,10),(204,1,3,3,16777247,'2025-12-17 05:28:38',NULL,1048585,10),(205,1,NULL,2,16777243,'2025-12-17 05:28:38',NULL,1048585,10),(206,1,NULL,2,16777245,'2025-12-17 05:28:38',NULL,1048585,10),(211,1,NULL,3,16777220,'2025-12-17 05:28:55',NULL,1048585,11),(212,1,NULL,3,16777222,'2025-12-17 05:28:55',NULL,1048585,11),(213,1,NULL,3,16777223,'2025-12-17 05:28:55',NULL,1048585,11),(214,1,NULL,3,16777224,'2025-12-17 05:28:55',NULL,1048585,11),(215,1,1,3,16777247,'2025-12-17 05:28:55',NULL,1048585,11),(216,1,2,3,16777247,'2025-12-17 05:28:55',NULL,1048585,11),(217,1,3,3,16777247,'2025-12-17 05:28:55',NULL,1048585,11),(218,1,NULL,2,16777243,'2025-12-17 05:28:55',NULL,1048585,11),(219,1,NULL,2,16777245,'2025-12-17 05:28:55',NULL,1048585,11),(220,1,NULL,2,16777236,'2025-12-17 05:29:02','2025-12-17 05:29:04',523,10),(222,1,9,3,16777227,'2025-12-17 05:29:09',NULL,517,9),(224,1,NULL,2,16777236,'2025-12-17 05:29:11','2025-12-17 05:29:13',523,11),(230,1,28,2,16777230,'2025-12-17 05:29:49',NULL,1048585,11),(237,1,NULL,3,16777220,'2025-12-17 05:30:17',NULL,1048585,12),(238,1,NULL,3,16777222,'2025-12-17 05:30:17',NULL,1048585,12),(239,1,NULL,3,16777223,'2025-12-17 05:30:17',NULL,1048585,12),(240,1,NULL,3,16777224,'2025-12-17 05:30:17',NULL,1048585,12),(241,1,1,3,16777247,'2025-12-17 05:30:17',NULL,1048585,12),(242,1,2,3,16777247,'2025-12-17 05:30:17',NULL,1048585,12),(243,1,3,3,16777247,'2025-12-17 05:30:17',NULL,1048585,12),(244,1,NULL,2,16777243,'2025-12-17 05:30:17',NULL,1048585,12),(245,1,NULL,2,16777245,'2025-12-17 05:30:17',NULL,1048585,12),(246,1,NULL,2,16777236,'2025-12-17 05:30:25','2025-12-17 05:30:27',523,12),(247,1,29,2,16777229,'2025-12-17 05:30:25',NULL,1048585,12),(248,1,7,3,16777227,'2025-12-17 05:30:32',NULL,517,12),(252,1,9,3,16777227,'2025-12-17 05:30:44',NULL,517,14),(260,1,NULL,3,16777220,'2025-12-17 05:31:15',NULL,1048585,13),(261,1,NULL,3,16777222,'2025-12-17 05:31:15',NULL,1048585,13),(262,1,NULL,3,16777223,'2025-12-17 05:31:15',NULL,1048585,13),(263,1,NULL,3,16777224,'2025-12-17 05:31:15',NULL,1048585,13),(264,1,1,3,16777247,'2025-12-17 05:31:15',NULL,1048585,13),(265,1,2,3,16777247,'2025-12-17 05:31:15',NULL,1048585,13),(266,1,3,3,16777247,'2025-12-17 05:31:15',NULL,1048585,13),(267,1,NULL,2,16777243,'2025-12-17 05:31:15',NULL,1048585,13),(268,1,NULL,2,16777245,'2025-12-17 05:31:15',NULL,1048585,13),(269,1,NULL,2,16777236,'2025-12-17 05:31:23','2025-12-17 05:31:25',523,13),(271,1,8,3,16777227,'2025-12-17 05:31:30',NULL,517,15),(273,1,NULL,2,16777236,'2025-12-17 05:31:33','2025-12-17 05:31:34',523,14),(277,1,11,3,16777227,'2025-12-17 05:31:45',NULL,517,17),(281,1,30,2,16777230,'2025-12-17 05:32:18',NULL,1048585,13),(291,1,3,2,16777217,'2025-12-17 05:32:54',NULL,1048585,14),(294,1,NULL,2,16777236,'2025-12-17 05:33:03','2025-12-17 05:33:06',523,15),(296,1,7,3,16777227,'2025-12-17 05:33:11',NULL,517,19),(298,1,NULL,2,16777236,'2025-12-17 05:33:14','2025-12-17 05:33:16',523,16),(300,1,11,3,16777227,'2025-12-17 05:33:21',NULL,517,20),(305,1,31,2,16777235,'2025-12-17 05:33:33',NULL,1048585,14),(306,1,3,2,16777254,'2025-12-17 05:33:33',NULL,1048585,14),(309,1,NULL,2,16777246,'2025-12-17 05:34:15',NULL,1048585,14),(316,1,NULL,3,16777220,'2025-12-17 05:34:41',NULL,1048585,15),(317,1,NULL,3,16777222,'2025-12-17 05:34:41',NULL,1048585,15),(318,1,NULL,3,16777223,'2025-12-17 05:34:41',NULL,1048585,15),(319,1,NULL,3,16777224,'2025-12-17 05:34:41',NULL,1048585,15),(320,1,1,3,16777247,'2025-12-17 05:34:41',NULL,1048585,15),(321,1,2,3,16777247,'2025-12-17 05:34:41',NULL,1048585,15),(322,1,3,3,16777247,'2025-12-17 05:34:41',NULL,1048585,15),(323,1,NULL,2,16777243,'2025-12-17 05:34:41',NULL,1048585,15),(324,1,NULL,2,16777245,'2025-12-17 05:34:41',NULL,1048585,15),(325,1,NULL,2,16777236,'2025-12-17 05:34:49','2025-12-17 05:34:50',523,17),(336,1,NULL,3,16777220,'2025-12-17 05:35:24',NULL,1048585,16),(337,1,NULL,3,16777222,'2025-12-17 05:35:24',NULL,1048585,16),(338,1,NULL,3,16777223,'2025-12-17 05:35:24',NULL,1048585,16),(339,1,NULL,3,16777224,'2025-12-17 05:35:24',NULL,1048585,16),(340,1,1,3,16777247,'2025-12-17 05:35:24',NULL,1048585,16),(341,1,2,3,16777247,'2025-12-17 05:35:24',NULL,1048585,16),(342,1,3,3,16777247,'2025-12-17 05:35:24',NULL,1048585,16),(343,1,NULL,2,16777243,'2025-12-17 05:35:24',NULL,1048585,16),(344,1,NULL,2,16777245,'2025-12-17 05:35:24',NULL,1048585,16),(345,1,NULL,2,16777236,'2025-12-17 05:35:33','2025-12-17 05:35:35',523,18),(348,1,11,3,16777227,'2025-12-17 05:35:47',NULL,517,22),(350,1,12,3,16777227,'2025-12-17 05:35:53',NULL,517,23),(364,1,NULL,3,16777220,'2025-12-17 05:36:45',NULL,1048585,17),(365,1,NULL,3,16777222,'2025-12-17 05:36:45',NULL,1048585,17),(366,1,NULL,3,16777223,'2025-12-17 05:36:45',NULL,1048585,17),(367,1,NULL,3,16777224,'2025-12-17 05:36:45',NULL,1048585,17),(368,1,1,3,16777247,'2025-12-17 05:36:45',NULL,1048585,17),(369,1,2,3,16777247,'2025-12-17 05:36:45',NULL,1048585,17),(370,1,3,3,16777247,'2025-12-17 05:36:45',NULL,1048585,17),(371,1,NULL,2,16777243,'2025-12-17 05:36:46',NULL,1048585,17),(372,1,NULL,2,16777245,'2025-12-17 05:36:46',NULL,1048585,17),(373,1,NULL,2,16777236,'2025-12-17 05:36:55','2025-12-17 05:36:58',523,19),(374,1,34,2,16777229,'2025-12-17 05:36:56',NULL,1048585,17),(375,1,7,3,16777227,'2025-12-17 05:37:03',NULL,517,24),(377,1,8,3,16777227,'2025-12-17 05:37:10',NULL,517,25);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_resumption_tokens`
--

DROP TABLE IF EXISTS `oai_resumption_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oai_resumption_tokens` (
  `oai_resumption_token_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `expire` bigint NOT NULL,
  `record_offset` int NOT NULL,
  `params` text,
  PRIMARY KEY (`oai_resumption_token_id`),
  UNIQUE KEY `oai_resumption_tokens_unique` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='OAI resumption tokens are used to allow for pagination of large result sets into manageable pieces.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oai_resumption_tokens`
--

LOCK TABLES `oai_resumption_tokens` WRITE;
/*!40000 ALTER TABLE `oai_resumption_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oai_resumption_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_settings`
--

DROP TABLE IF EXISTS `plugin_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin_settings` (
  `plugin_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(80) NOT NULL,
  `context_id` bigint NOT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`plugin_setting_id`),
  UNIQUE KEY `plugin_settings_unique` (`plugin_name`,`context_id`,`setting_name`),
  KEY `plugin_settings_plugin_name` (`plugin_name`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3 COMMENT='More data about plugins, including localized properties. This table is frequently used to store plugin-specific configuration.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_settings`
--

LOCK TABLES `plugin_settings` WRITE;
/*!40000 ALTER TABLE `plugin_settings` DISABLE KEYS */;
INSERT INTO `plugin_settings` VALUES (1,'defaultthemeplugin',0,'enabled','1','bool'),(2,'acronplugin',0,'enabled','1','bool'),(3,'acronplugin',0,'crontab','[{\"className\":\"PKP\\\\task\\\\ReviewReminder\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\PublishSubmissions\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\RemoveUnvalidatedExpiredUsers\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\UpdateIPGeoDB\",\"frequency\":{\"day\":\"10\"},\"args\":[]},{\"className\":\"APP\\\\tasks\\\\UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\EditorialReminders\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\ProcessQueueJobs\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\RemoveFailedJobs\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]','object'),(4,'tinymceplugin',0,'enabled','1','bool'),(5,'usageeventplugin',0,'enabled','1','bool'),(6,'developedbyblockplugin',0,'enabled','0','bool'),(7,'developedbyblockplugin',0,'seq','0','int'),(8,'developedbyblockplugin',0,'context','1','int'),(9,'languagetoggleblockplugin',0,'enabled','1','bool'),(10,'languagetoggleblockplugin',0,'seq','4','int'),(11,'languagetoggleblockplugin',0,'context','1','int'),(12,'tinymceplugin',1,'enabled','1','bool'),(13,'defaultthemeplugin',1,'enabled','1','bool'),(14,'informationblockplugin',1,'enabled','1','bool'),(15,'informationblockplugin',1,'seq','7','int'),(16,'informationblockplugin',1,'context','1','int'),(17,'developedbyblockplugin',1,'enabled','0','bool'),(18,'developedbyblockplugin',1,'seq','0','int'),(19,'developedbyblockplugin',1,'context','1','int'),(20,'browseblockplugin',1,'enabled','1','bool'),(21,'browseblockplugin',1,'seq','1','int'),(22,'browseblockplugin',1,'context','1','int'),(23,'browseblockplugin',1,'browseNewReleases','1','bool'),(24,'browseblockplugin',1,'browseCategories','1','bool'),(25,'browseblockplugin',1,'browseSeries','1','bool'),(26,'languagetoggleblockplugin',1,'enabled','1','bool'),(27,'languagetoggleblockplugin',1,'seq','4','int'),(28,'languagetoggleblockplugin',1,'context','1','int'),(29,'pdfjsviewerplugin',1,'enabled','1','bool'),(30,'htmlmonographfileplugin',1,'enabled','1','bool'),(31,'dublincoremetaplugin',1,'enabled','1','bool'),(32,'webfeedplugin',1,'enabled','1','bool'),(33,'webfeedplugin',1,'displayPage','homepage','string'),(34,'webfeedplugin',1,'displayItems','1','bool'),(35,'webfeedplugin',1,'recentItems','30','int'),(36,'webfeedplugin',1,'includeIdentifiers','0','bool'),(37,'googlescholarplugin',1,'enabled','1','bool'),(38,'defaultthemeplugin',1,'typography','notoSans','string'),(39,'defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),(40,'defaultthemeplugin',1,'baseColour','#1E6292','string'),(41,'defaultthemeplugin',1,'showCatalogSeriesListing','false','string'),(42,'defaultthemeplugin',1,'displayStats','none','string');
/*!40000 ALTER TABLE `plugin_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `press_settings`
--

DROP TABLE IF EXISTS `press_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `press_settings` (
  `press_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `press_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  PRIMARY KEY (`press_setting_id`),
  UNIQUE KEY `press_settings_unique` (`press_id`,`locale`,`setting_name`),
  KEY `press_settings_press_id` (`press_id`),
  CONSTRAINT `press_settings_press_id_foreign` FOREIGN KEY (`press_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb3 COMMENT='More data about presses, including localized properties such as policies.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `press_settings`
--

LOCK TABLES `press_settings` WRITE;
/*!40000 ALTER TABLE `press_settings` DISABLE KEYS */;
INSERT INTO `press_settings` VALUES (1,1,'en','acronym','JPK'),(3,1,'en','authorGuidelines','<p>Authors are invited to make a submission to this press. Those submissions considered to be a good fit will be sent for peer review before determining whether they will be accepted or rejected.</p><p>Before making a submission, authors are responsible for obtaining permission to publish any material included with the submission, such as photos, documents and datasets. All authors identified on the submission must consent to be identified as an author. Where appropriate, research should be approved by an appropriate ethics committee in accordance with the legal requirements of the study\'s country.</p><p>An editor may desk reject a submission if it does not meet minimum standards of quality. Before submitting, please ensure that the scope and outline of the book are structured and articulated properly. The title should be concise and the abstract should be able to stand on its own. This will increase the likelihood of reviewers agreeing to review the book. When you\'re satisfied that your submission meets this standard, please follow the checklist below to prepare your submission.</p>'),(4,1,'fr_CA','authorGuidelines','##default.contextSettings.authorGuidelines##'),(5,1,'en','authorInformation','Interested in submitting to this press? We recommend that you review the <a href=\"http://localhost/index.php/publicknowledge/about\">About the Press</a> page for the press\' section policies and <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.php/publicknowledge/user/register\">register</a> with the press prior to submitting, or if already registered can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the 5 step process.'),(6,1,'fr_CA','authorInformation','Vous souhaitez soumettre une contribution à cette presse ? Nous vous recommandons de lire la page\n <a href=\"http://localhost/index.php/publicknowledge/about\">À propos de cette presse</a> pour connaitre ses règlements et la page\n <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Lignes directrices à l\'intention des auteurs-es</a>. Les auteurs-es doivent <a href=\"http://localhost/index.php/publicknowledge/user/register\">s\'inscrire</a> auprès de la presse avant d\'envoyer une soumission. Si vous êtes déjà inscrit-e, il suffit simplement <a href=\"http://localhost/index.php/index/login\">d\'ouvrir une session</a> pour débuter la procédure en 5 étapes.'),(7,1,'en','beginSubmissionHelp','<p>Thank you for submitting to the Public Knowledge Press. You will be asked to upload files, identify co-authors, and provide information such as the title and abstract.<p><p>Please read our <a href=\"http://localhost/index.php/publicknowledge/about/submissions\" target=\"_blank\">Submission Guidelines</a> if you have not done so already. When filling out the forms, provide as many details as possible in order to help our editors evaluate your work.</p><p>Once you begin, you can save your submission and come back to it later. You will be able to review and correct any information before you submit.</p>'),(8,1,'fr_CA','beginSubmissionHelp','<p>Merci de votre soumission à la revue Public Knowledge Press. Il vous sera demandé de téléverser des fichiers, identifier des co-auteur.trice.s et fournir des informations comme le titre et le résumé.<p><p>Si vous ne l\'avez pas encore fait, merci de consulter nos <a href=\"http://localhost/index.php/publicknowledge/about/submissions\" target=\"_blank\">Recommandations pour la soumission</a>. Lorsque vous remplissez les formulaires, merci de fournir autant de détails que possible pour aider nos éditeur.trice.s à évaluer votre travail. </p><p>Une fois que vous avez commencé, vous pouvez enregistrer votre soumission et y revenir plus tard. Vous pourrez alors réviser et modifier toutes les informations voulues avant de soumettre le tout.</p>'),(9,1,'','contactEmail','rvaca@mailinator.com'),(10,1,'','contactName','Ramiro Vaca'),(11,1,'en','contributorsHelp','<p>Add details for all of the contributors to this submission. Contributors added here will be sent an email confirmation of the submission, as well as a copy of all editorial decisions recorded against this submission.</p><p>If a contributor can not be contacted by email, because they must remain anonymous or do not have an email account, please do not enter a fake email address. You can add information about this contributor in a message to the editor at a later step in the submission process.</p>'),(12,1,'fr_CA','contributorsHelp','<p>Ajouter des informations relatives à tous les contributeurs.trices à cette soumission. Les contributeurs.trices ajouté.e.s ici se verront envoyer un courriel de confirmation de la soumission ainsi qu\'une copie de toutes les décisions éditoriales enregistrées pour cette soumission.</p><p>Si un.e contributeur.trice ne peut être contacté.e par courriel parce qu\'il ou elle doit demeurer anonyme ou n\'a pas de compte de messagerie, veuillez ne pas entrer de courriel fictif. Vous pouvez ajouter des informations sur ce ou cette contributeur.trice à une étape ultérieure du processus de soumission.</p>'),(13,1,'','country','IS'),(14,1,'','defaultReviewMode','2'),(15,1,'en','description','<p>Public Knowledge Press is a publisher dedicated to the subject of public access to science.</p>'),(16,1,'fr_CA','description','<p>Le Press de Public Knowledge est une presse sur le thème de l\'accès du public à la science.</p>'),(17,1,'en','detailsHelp','<p>Please provide the following details to help us manage your submission in our system.</p>'),(18,1,'fr_CA','detailsHelp','<p>Veuillez fournir les informations suivantes afin de nous aider à gérer votre soumission dans notre système.</p>'),(19,1,'','emailSignature','<br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(20,1,'','enableDois','1'),(21,1,'','doiSuffixType','default'),(22,1,'','registrationAgency',''),(23,1,'','disableSubmissions','0'),(24,1,'','editorialStatsEmail','1'),(25,1,'en','forTheEditorsHelp','<p>Please provide the following details in order to help our editorial team manage your submission.</p><p>When entering metadata, provide entries that you think would be most helpful to the person managing your submission. This information can be changed before publication.</p>'),(26,1,'fr_CA','forTheEditorsHelp','<p>S\'il vous plaît, fournissez les détails suivants afin d\'aider l\'équipe éditoriale à gérer votre soumission.</p><p>Dans vos métadonnées, assurez vous de fournir des informations que vous pensez pouvoir être utile à la personne qui gérera votre soumission. Cette information peut être changée avant publication.</p>'),(27,1,'','itemsPerPage','25'),(28,1,'','keywords','request'),(29,1,'en','librarianInformation','We encourage research librarians to list this press among their library\'s electronic press holdings. As well, this open source publishing system is suitable for libraries to host for their faculty members to use with presses they are involved in editing (see <a href=\"https://pkp.sfu.ca/omp\">Open Monograph Press</a>).'),(30,1,'fr_CA','librarianInformation','Nous encourageons les bibliothécaires de recherche à ajouter cette presse à la liste électronique des ressources documentaires de la bibliothèque. De plus, ce système d\'édition à libre accès convient à toutes les bibliothèques et permet aux membres des facultés de l\'utiliser pour les presses auxquelles ils contribuent à titre de rédacteur en chef. (voir <a href=\"http://pkp.sfu.ca/omp\">Open Monograph Press</a>).'),(31,1,'en','name','Public Knowledge Press'),(32,1,'fr_CA','name','Press de la connaissance du public'),(33,1,'','notifyAllAuthors','1'),(34,1,'','numPageLinks','10'),(35,1,'','numWeeksPerResponse','4'),(36,1,'','numWeeksPerReview','4'),(37,1,'en','openAccessPolicy','This press provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.'),(38,1,'fr_CA','openAccessPolicy','Cette presse offre un accès libre immédiat à son contenu en partant du principe que la recherche doit être accessible au grand public, car cela favorise un meilleur échange des connaissances à l\'échelle mondiale.'),(39,1,'en','privacyStatement','<p>The names and email addresses entered in this press site will be used exclusively for the stated purposes of this press and will not be made available for any other purpose or to any other party.</p>'),(40,1,'fr_CA','privacyStatement','<p>Les noms et adresses courriel saisis sur ce site de presse seront utilisés exclusivement pour les fins convenues de cette presse. Ils ne seront pas utilisés pour d\'autres fins ou transmis à une tierce partie.</p>'),(41,1,'en','readerInformation','We encourage readers to sign up for the publishing notification service for this press. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the homepage for the press. This registration will result in the reader receiving the Table of Contents by email for each new monograph of the press. This list also allows the press to claim a certain level of support or readership. See the press <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a> which assures readers that their name and email address will not be used for other purposes.'),(42,1,'fr_CA','readerInformation','Nous encourageons les lecteurs à s\'abonner au service d\'avis de publication de cette presse. Utilisez le lien <a href=\"http://localhost/index.php/publicknowledge/user/register\">d\'inscription</a> situé en haut de la page d\'accueil de la presse. Cette inscription permettra au lecteur de recevoir la table des matières de chaque nouvelle monographie de cette presse par courriel. Cette liste permet également à la presse d\'affirmer qu\'elle compte un certain nombre de lecteurs. Consultez <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">l\'énoncé de confidentialité </a> de la presse, lequel stipule que les noms et adresses courriel de ses lecteurs ne seront pas utilisés à d\'autres fins.'),(43,1,'en','reviewHelp','<p>Review the information you have entered before you complete your submission. You can change any of the details displayed here by clicking the edit button at the top of each section.</p><p>Once you complete your submission, a member of our editorial team will be assigned to review it. Please ensure the details you have entered here are as accurate as possible.</p>'),(44,1,'fr_CA','reviewHelp','<p>Révisez l\'information que vous avez fourni avant de finaliser votre soumission. Vous pouvez modifier chaque détails affichés en cliquant sur le bouton d\'édition en haut de chaque section.</p><p>Une fois votre soumission transmise, un membre de l\'équipe éditoriale lui sera assigné afin de l\'évaluer. S\'il vous plaît, assurez vous que les détails fournis sont le plus exactes possibles.</p>'),(45,1,'','submissionAcknowledgement','allAuthors'),(46,1,'en','submissionChecklist','<p>All submissions must meet the following requirements.</p><ul><li>This submission meets the requirements outlined in the <a href=\"http://localhost/index.php/publicknowledge/about/submissions\">Author Guidelines</a>.</li><li>This submission has not been previously published, nor is it before another press for consideration.</li><li>All references have been checked for accuracy and completeness.</li><li>All tables and figures have been numbered and labeled.</li><li>Permission has been obtained to publish all photos, datasets and other material provided with this submission.</li></ul>'),(47,1,'fr_CA','submissionChecklist','##default.contextSettings.checklist##'),(48,1,'','submitWithCategories','0'),(49,1,'','supportedFormLocales','[\"en\",\"fr_CA\"]'),(50,1,'','supportedLocales','[\"en\",\"fr_CA\"]'),(51,1,'','supportedSubmissionLocales','[\"en\",\"fr_CA\"]'),(52,1,'','themePluginPath','default'),(53,1,'','type','enable'),(54,1,'en','uploadFilesHelp','<p>Provide any files our editorial team may need to evaluate your submission. In addition to the main work, you may wish to submit data sets, conflict of interest statements, or other supplementary files if these will be helpful for our editors.</p>'),(55,1,'fr_CA','uploadFilesHelp','<p> Fournir tous les fichiers dont notre équipe éditoriale pourrait avoir besoin pour évaluer votre soumission. En plus du fichier principal, vous pouvez soumettre des ensembles de données, une déclaration relative au conflit d\'intérêt ou tout autre fichier potentiellement utile pour nos éditeur.trice.s.</p>'),(56,1,'','enableGeoUsageStats','disabled'),(57,1,'','enableInstitutionUsageStats','0'),(58,1,'','isSushiApiPublic','1'),(59,1,'','coverThumbnailsMaxWidth','106'),(60,1,'','coverThumbnailsMaxHeight','100'),(61,1,'','enabledDoiTypes','[\"publication\"]'),(62,1,'','doiCreationTime','copyEditCreationTime'),(63,1,'','paymentPluginName','ManualPayment'),(64,1,'','doiVersioning','0'),(65,1,'en','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">'),(66,1,'en','searchDescription','Public Knowledge Press is a publisher dedicated to the subject of public access to science.'),(67,1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada'),(68,1,'','supportEmail','rvaca@mailinator.com'),(69,1,'','supportName','Ramiro Vaca');
/*!40000 ALTER TABLE `press_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presses`
--

DROP TABLE IF EXISTS `presses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presses` (
  `press_id` bigint NOT NULL AUTO_INCREMENT,
  `path` varchar(32) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  `primary_locale` varchar(14) NOT NULL,
  `enabled` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`press_id`),
  UNIQUE KEY `press_path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='A list of presses managed by the system.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presses`
--

LOCK TABLES `presses` WRITE;
/*!40000 ALTER TABLE `presses` DISABLE KEYS */;
INSERT INTO `presses` VALUES (1,'publicknowledge',1.00,'en',1);
/*!40000 ALTER TABLE `presses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_categories`
--

DROP TABLE IF EXISTS `publication_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_categories` (
  `publication_category_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `publication_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`publication_category_id`),
  UNIQUE KEY `publication_categories_id` (`publication_id`,`category_id`),
  KEY `publication_categories_publication_id` (`publication_id`),
  KEY `publication_categories_category_id` (`category_id`),
  CONSTRAINT `publication_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE,
  CONSTRAINT `publication_categories_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Associates publications (and thus submissions) with categories.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_categories`
--

LOCK TABLES `publication_categories` WRITE;
/*!40000 ALTER TABLE `publication_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_dates`
--

DROP TABLE IF EXISTS `publication_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_dates` (
  `publication_date_id` bigint NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint NOT NULL,
  `role` varchar(40) NOT NULL,
  `date_format` varchar(40) NOT NULL,
  `date` varchar(255) NOT NULL,
  PRIMARY KEY (`publication_date_id`),
  KEY `publication_dates_publication_format_id` (`publication_format_id`),
  KEY `format_publication_dates_pkey` (`publication_date_id`,`publication_format_id`,`role`),
  CONSTRAINT `publication_dates_publication_format_id` FOREIGN KEY (`publication_format_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='ONIX publication dates for publication formats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_dates`
--

LOCK TABLES `publication_dates` WRITE;
/*!40000 ALTER TABLE `publication_dates` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication_dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_format_settings`
--

DROP TABLE IF EXISTS `publication_format_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_format_settings` (
  `publication_format_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`publication_format_setting_id`),
  UNIQUE KEY `publication_format_settings_unique` (`publication_format_id`,`locale`,`setting_name`),
  KEY `publication_format_id_key` (`publication_format_id`),
  CONSTRAINT `publication_format_settings_publication_format_id` FOREIGN KEY (`publication_format_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='More data about publication formats, including localized properties.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_format_settings`
--

LOCK TABLES `publication_format_settings` WRITE;
/*!40000 ALTER TABLE `publication_format_settings` DISABLE KEYS */;
INSERT INTO `publication_format_settings` VALUES (1,1,'en','name','PDF','string'),(2,1,'fr_CA','name','','string'),(3,2,'en','name','PDF','string'),(4,2,'fr_CA','name','','string'),(5,3,'en','name','PDF','string'),(6,3,'fr_CA','name','','string');
/*!40000 ALTER TABLE `publication_format_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_formats`
--

DROP TABLE IF EXISTS `publication_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_formats` (
  `publication_format_id` bigint NOT NULL AUTO_INCREMENT,
  `publication_id` bigint NOT NULL,
  `physical_format` smallint DEFAULT '1',
  `entry_key` varchar(64) DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  `file_size` varchar(255) DEFAULT NULL,
  `front_matter` varchar(255) DEFAULT NULL,
  `back_matter` varchar(255) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  `height_unit_code` varchar(255) DEFAULT NULL,
  `width` varchar(255) DEFAULT NULL,
  `width_unit_code` varchar(255) DEFAULT NULL,
  `thickness` varchar(255) DEFAULT NULL,
  `thickness_unit_code` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `weight_unit_code` varchar(255) DEFAULT NULL,
  `product_composition_code` varchar(255) DEFAULT NULL,
  `product_form_detail_code` varchar(255) DEFAULT NULL,
  `country_manufacture_code` varchar(255) DEFAULT NULL,
  `imprint` varchar(255) DEFAULT NULL,
  `product_availability_code` varchar(255) DEFAULT NULL,
  `technical_protection_code` varchar(255) DEFAULT NULL,
  `returnable_indicator_code` varchar(255) DEFAULT NULL,
  `remote_url` varchar(2047) DEFAULT NULL,
  `url_path` varchar(64) DEFAULT NULL,
  `is_approved` smallint NOT NULL DEFAULT '0',
  `is_available` smallint NOT NULL DEFAULT '0',
  `doi_id` bigint DEFAULT NULL,
  PRIMARY KEY (`publication_format_id`),
  KEY `publication_formats_publication_id` (`publication_id`),
  KEY `publication_formats_doi_id` (`doi_id`),
  CONSTRAINT `publication_formats_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `publication_formats_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='Publication formats are representations of a publication in a particular format, e.g. PDF, hardcover, etc. Each publication format may contain many chapters.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_formats`
--

LOCK TABLES `publication_formats` WRITE;
/*!40000 ALTER TABLE `publication_formats` DISABLE KEYS */;
INSERT INTO `publication_formats` VALUES (1,4,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://file-examples-com.github.io/uploads/2017/10/file-sample_150kB.pdf',NULL,0,0,NULL),(2,5,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(3,14,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL);
/*!40000 ALTER TABLE `publication_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_settings`
--

DROP TABLE IF EXISTS `publication_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_settings` (
  `publication_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `publication_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`publication_setting_id`),
  UNIQUE KEY `publication_settings_unique` (`publication_id`,`locale`,`setting_name`),
  KEY `publication_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `publication_settings_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3 COMMENT='More data about publications, including localized properties such as the title and abstract.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_settings`
--

LOCK TABLES `publication_settings` WRITE;
/*!40000 ALTER TABLE `publication_settings` DISABLE KEYS */;
INSERT INTO `publication_settings` VALUES (1,1,'en','abstract','The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities―and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.'),(2,1,'','categoryIds','[]'),(3,1,'en','title','The ABCs of Human Survival: A Paradigm for Global Citizenship'),(4,2,'','categoryIds','[]'),(5,2,'en','title','The West and Beyond: New Perspectives on an Imagined Region'),(6,2,'en','abstract','<p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p>'),(7,3,'en','abstract','Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.'),(8,3,'','categoryIds','[]'),(9,3,'en','title','The Political Economy of Workplace Injury in Canada'),(10,4,'en','abstract','What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.'),(11,4,'','categoryIds','[]'),(12,4,'en','title','How Canadians Communicate: Contexts of Canadian Popular Culture'),(13,5,'en','abstract','Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.'),(14,5,'','categoryIds','[]'),(15,5,'en','title','Bomb Canada and Other Unkind Remarks in the American Media'),(16,5,'en','copyrightHolder','Public Knowledge Press'),(17,5,'fr_CA','copyrightHolder','Press de la connaissance du public'),(18,5,'','copyrightYear','2025'),(19,6,'en','abstract','Good researchers have a host of tools at their disposal that make navigating today’s complex information ecosystem much more manageable. Gaining the knowledge, abilities, and self-reflection necessary to be a good researcher helps not only in academic settings, but is invaluable in any career, and throughout one’s life. The Information Literacy User’s Guide will start you on this route to success.'),(20,6,'','categoryIds','[]'),(21,6,'en','title','The Information Literacy User’s Guide'),(22,7,'en','abstract','Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.'),(23,7,'','categoryIds','[]'),(24,7,'en','title','Accessible Elements: Teaching Science Online and at a Distance'),(25,8,'en','abstract','A Note From The Publisher'),(26,8,'','categoryIds','[]'),(27,8,'en','title','Editorial'),(28,9,'en','abstract','In recent years, the Internet and other network technologies have emerged as a central issue for development in Latin America and the Caribbean. They have shown their potential to increase productivity and economic competitiveness, to create new ways to deliver education and health services, and to be driving forces for the modernization of the provision of public services.'),(29,9,'','categoryIds','[]'),(30,9,'en','title','Enabling Openness: The future of the information society in Latin America and the Caribbean'),(31,10,'en','abstract','While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.'),(32,10,'','categoryIds','[]'),(33,10,'en','title','Lost Tracks: Buffalo National Park, 1909-1939'),(34,11,'en','abstract','Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.'),(35,11,'','categoryIds','[]'),(36,11,'en','title','Dreamwork'),(37,12,'en','abstract','Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.'),(38,12,'','categoryIds','[]'),(39,12,'en','title','Connecting ICTs to Development'),(40,13,'en','abstract','This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.'),(41,13,'','categoryIds','[]'),(42,13,'en','title','Mobile Learning: Transforming the Delivery of Education and Training'),(43,14,'en','abstract','From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.'),(44,14,'','categoryIds','[]'),(45,14,'en','title','From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots'),(46,14,'en','copyrightHolder','Public Knowledge Press'),(47,14,'fr_CA','copyrightHolder','Press de la connaissance du public'),(48,14,'','copyrightYear','2025'),(49,15,'en','abstract','A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.'),(50,15,'','categoryIds','[]'),(51,15,'en','title','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978'),(52,16,'en','abstract','Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.'),(53,16,'','categoryIds','[]'),(54,16,'en','title','A Designer\'s Log: Case Studies in Instructional Design'),(55,17,'en','abstract','The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.'),(56,17,'','categoryIds','[]'),(57,17,'en','title','Open Development: Networked Innovations in International Development');
/*!40000 ALTER TABLE `publication_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications`
--

DROP TABLE IF EXISTS `publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publications` (
  `publication_id` bigint NOT NULL AUTO_INCREMENT,
  `date_published` date DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `primary_contact_id` bigint DEFAULT NULL,
  `publication_date_type` varchar(32) DEFAULT 'pub',
  `publication_type` varchar(32) DEFAULT 'publication',
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  `series_id` bigint DEFAULT NULL,
  `series_position` varchar(255) DEFAULT NULL,
  `submission_id` bigint NOT NULL,
  `status` smallint NOT NULL DEFAULT '1',
  `url_path` varchar(64) DEFAULT NULL,
  `version` bigint DEFAULT NULL,
  `doi_id` bigint DEFAULT NULL,
  PRIMARY KEY (`publication_id`),
  KEY `publications_primary_contact_id` (`primary_contact_id`),
  KEY `publications_section_id` (`series_id`),
  KEY `publications_submission_id` (`submission_id`),
  KEY `publications_doi_id` (`doi_id`),
  CONSTRAINT `publications_author_id` FOREIGN KEY (`primary_contact_id`) REFERENCES `authors` (`author_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_series_id` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COMMENT='Each publication is one version of a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,NULL,'2025-12-17 05:18:24',1,'pub','publication',0.00,1,NULL,1,1,NULL,1,NULL),(2,NULL,'2025-12-17 05:19:19',2,'pub','publication',0.00,NULL,NULL,2,1,NULL,1,NULL),(3,NULL,'2025-12-17 05:21:00',11,'pub','publication',0.00,NULL,NULL,3,1,NULL,1,NULL),(4,NULL,'2025-12-17 05:21:36',12,'pub','publication',0.00,3,NULL,4,1,NULL,1,NULL),(5,'2025-12-17','2025-12-17 05:24:40',16,'pub','publication',0.00,NULL,NULL,5,3,NULL,1,NULL),(6,NULL,'2025-12-17 05:24:46',17,'pub','publication',0.00,1,NULL,6,1,NULL,1,NULL),(7,NULL,'2025-12-17 05:25:45',21,'pub','publication',0.00,4,NULL,7,1,NULL,1,NULL),(8,NULL,'2025-12-17 05:26:46',NULL,'pub','publication',0.00,NULL,NULL,8,1,NULL,1,NULL),(9,NULL,'2025-12-17 05:26:53',26,'pub','publication',0.00,1,NULL,9,1,NULL,1,NULL),(10,NULL,'2025-12-17 05:27:40',31,'pub','publication',0.00,NULL,NULL,10,1,NULL,1,NULL),(11,NULL,'2025-12-17 05:28:44',32,'pub','publication',0.00,NULL,NULL,11,1,NULL,1,NULL),(12,NULL,'2025-12-17 05:29:58',33,'pub','publication',0.00,NULL,NULL,12,1,NULL,1,NULL),(13,NULL,'2025-12-17 05:30:57',41,'pub','publication',0.00,NULL,NULL,13,1,NULL,1,NULL),(14,'2025-12-17','2025-12-17 05:34:15',45,'pub','publication',0.00,5,NULL,14,3,NULL,1,NULL),(15,NULL,'2025-12-17 05:34:24',48,'pub','publication',0.00,NULL,NULL,15,1,NULL,1,NULL),(16,NULL,'2025-12-17 05:34:56',49,'pub','publication',0.00,NULL,NULL,16,1,NULL,1,NULL),(17,NULL,'2025-12-17 05:36:07',50,'pub','publication',0.00,NULL,NULL,17,1,NULL,1,NULL);
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queries` (
  `query_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `stage_id` smallint NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `closed` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`query_id`),
  KEY `queries_assoc_id` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='Discussions, usually related to a submission, created by editors, authors and other editorial staff.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
INSERT INTO `queries` VALUES (1,1048585,6,2,1.00,NULL,NULL,0);
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_participants`
--

DROP TABLE IF EXISTS `query_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `query_participants` (
  `query_participant_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `query_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`query_participant_id`),
  UNIQUE KEY `query_participants_unique` (`query_id`,`user_id`),
  KEY `query_participants_query_id` (`query_id`),
  KEY `query_participants_user_id` (`user_id`),
  CONSTRAINT `query_participants_query_id_foreign` FOREIGN KEY (`query_id`) REFERENCES `queries` (`query_id`) ON DELETE CASCADE,
  CONSTRAINT `query_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='The users assigned to a discussion.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_participants`
--

LOCK TABLES `query_participants` WRITE;
/*!40000 ALTER TABLE `query_participants` DISABLE KEYS */;
INSERT INTO `query_participants` VALUES (1,1,3),(2,1,4);
/*!40000 ALTER TABLE `query_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queued_payments`
--

DROP TABLE IF EXISTS `queued_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queued_payments` (
  `queued_payment_id` bigint NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `payment_data` text,
  PRIMARY KEY (`queued_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A list of queued (unfilled) payments, i.e. payments that have not yet been completed via an online payment system.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queued_payments`
--

LOCK TABLES `queued_payments` WRITE;
/*!40000 ALTER TABLE `queued_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `queued_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `representatives`
--

DROP TABLE IF EXISTS `representatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `representatives` (
  `representative_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `role` varchar(40) NOT NULL,
  `representative_id_type` varchar(255) DEFAULT NULL,
  `representative_id_value` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `is_supplier` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`representative_id`),
  KEY `representatives_submission_id` (`submission_id`),
  KEY `format_representatives_pkey` (`representative_id`,`submission_id`),
  CONSTRAINT `representatives_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='ONIX representatives for publication formats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `representatives`
--

LOCK TABLES `representatives` WRITE;
/*!40000 ALTER TABLE `representatives` DISABLE KEYS */;
/*!40000 ALTER TABLE `representatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_assignments`
--

DROP TABLE IF EXISTS `review_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_assignments` (
  `review_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `reviewer_id` bigint NOT NULL,
  `competing_interests` text,
  `recommendation` smallint DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` smallint NOT NULL DEFAULT '0',
  `declined` smallint NOT NULL DEFAULT '0',
  `cancelled` smallint NOT NULL DEFAULT '0',
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` smallint DEFAULT NULL,
  `review_round_id` bigint NOT NULL,
  `stage_id` smallint NOT NULL,
  `review_method` smallint NOT NULL DEFAULT '1',
  `round` smallint NOT NULL DEFAULT '1',
  `step` smallint NOT NULL DEFAULT '1',
  `review_form_id` bigint DEFAULT NULL,
  `considered` smallint DEFAULT NULL,
  `request_resent` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`review_id`),
  KEY `review_assignments_submission_id` (`submission_id`),
  KEY `review_assignments_reviewer_id` (`reviewer_id`),
  KEY `review_assignment_reviewer_round` (`review_round_id`,`reviewer_id`),
  KEY `review_assignments_form_id` (`review_form_id`),
  KEY `review_assignments_reviewer_review` (`reviewer_id`,`review_id`),
  CONSTRAINT `review_assignments_review_form_id_foreign` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`),
  CONSTRAINT `review_assignments_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`),
  CONSTRAINT `review_assignments_reviewer_id_foreign` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `review_assignments_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COMMENT='Data about peer review assignments for all submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignments`
--

LOCK TABLES `review_assignments` WRITE;
/*!40000 ALTER TABLE `review_assignments` DISABLE KEYS */;
INSERT INTO `review_assignments` VALUES (1,1,12,NULL,NULL,'2025-12-17 05:18:55','2025-12-17 05:18:55',NULL,NULL,NULL,'2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:18:55',0,0,0,NULL,NULL,NULL,1,3,2,1,0,NULL,0,0),(2,2,11,NULL,NULL,'2025-12-17 05:20:46','2025-12-17 05:20:46',NULL,NULL,NULL,'2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:20:46',0,0,0,NULL,NULL,NULL,2,3,1,1,0,NULL,0,0),(3,2,12,NULL,NULL,'2025-12-17 05:20:53','2025-12-17 05:20:53',NULL,NULL,NULL,'2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:20:53',0,0,0,NULL,NULL,NULL,2,3,2,1,0,NULL,0,0),(4,4,9,NULL,NULL,'2025-12-17 05:22:15','2025-12-17 05:22:15',NULL,NULL,NULL,'2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:22:15',0,0,0,NULL,NULL,NULL,3,2,2,1,0,NULL,0,0),(5,4,11,NULL,NULL,'2025-12-17 05:22:25','2025-12-17 05:22:25',NULL,NULL,NULL,'2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:22:25',0,0,0,NULL,NULL,NULL,4,3,2,1,0,NULL,0,0),(6,5,8,NULL,NULL,'2025-12-17 05:23:45','2025-12-17 05:23:45',NULL,NULL,NULL,'2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:23:45',0,0,0,NULL,NULL,NULL,5,2,2,1,0,NULL,0,0),(7,5,12,NULL,NULL,'2025-12-17 05:23:55','2025-12-17 05:23:56',NULL,NULL,NULL,'2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:23:56',0,0,0,NULL,NULL,NULL,6,3,2,1,0,NULL,0,0),(8,7,10,NULL,NULL,'2025-12-17 05:26:32','2025-12-17 05:26:32',NULL,NULL,NULL,'2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:26:32',0,0,0,NULL,NULL,NULL,8,3,2,1,0,NULL,0,0),(9,11,9,NULL,NULL,'2025-12-17 05:29:09','2025-12-17 05:29:09',NULL,NULL,NULL,'2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:29:09',0,0,0,NULL,NULL,NULL,10,2,2,1,0,NULL,0,0),(10,11,10,NULL,0,'2025-12-17 05:29:18','2025-12-17 05:29:18','2025-12-17 05:29:27','2025-12-17 05:29:31','2025-12-17 05:29:49','2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:29:49',0,0,0,NULL,NULL,NULL,11,3,2,1,4,NULL,0,0),(11,11,12,NULL,0,'2025-12-17 05:29:24','2025-12-17 05:29:24','2025-12-17 05:29:35','2025-12-17 05:29:39','2025-12-17 05:29:49','2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:29:49',0,0,0,NULL,NULL,NULL,11,3,2,1,4,NULL,0,0),(12,12,7,NULL,NULL,'2025-12-17 05:30:32','2025-12-17 05:30:32',NULL,NULL,NULL,'2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:30:32',0,0,0,NULL,NULL,NULL,12,2,2,1,0,NULL,0,0),(13,12,8,NULL,0,'2025-12-17 05:30:38','2025-12-17 05:30:38','2025-12-17 05:30:48','2025-12-17 05:30:52',NULL,'2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:30:52',0,0,0,NULL,NULL,NULL,12,2,2,1,4,NULL,0,0),(14,12,9,NULL,NULL,'2025-12-17 05:30:44','2025-12-17 05:30:44',NULL,NULL,NULL,'2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:30:44',0,0,0,NULL,NULL,NULL,12,2,2,1,0,NULL,0,0),(15,13,8,NULL,NULL,'2025-12-17 05:31:30','2025-12-17 05:31:30',NULL,NULL,NULL,'2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:31:30',0,0,0,NULL,NULL,NULL,13,2,2,1,0,NULL,0,0),(16,13,10,NULL,0,'2025-12-17 05:31:40','2025-12-17 05:31:40','2025-12-17 05:31:55','2025-12-17 05:31:59','2025-12-17 05:32:18','2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:32:18',0,0,0,NULL,NULL,NULL,14,3,2,1,4,NULL,0,0),(17,13,11,NULL,NULL,'2025-12-17 05:31:45','2025-12-17 05:31:45',NULL,NULL,NULL,'2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:31:45',0,0,0,NULL,NULL,NULL,14,3,2,1,0,NULL,0,0),(18,13,12,NULL,0,'2025-12-17 05:31:51','2025-12-17 05:31:51','2025-12-17 05:32:03','2025-12-17 05:32:07','2025-12-17 05:32:18','2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:32:18',0,0,0,NULL,NULL,NULL,14,3,2,1,4,NULL,0,0),(19,14,7,NULL,NULL,'2025-12-17 05:33:11','2025-12-17 05:33:11',NULL,NULL,NULL,'2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:33:11',0,0,0,NULL,NULL,NULL,15,2,2,1,0,NULL,0,0),(20,14,11,NULL,NULL,'2025-12-17 05:33:21','2025-12-17 05:33:21',NULL,NULL,NULL,'2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:33:21',0,0,0,NULL,NULL,NULL,16,3,2,1,0,NULL,0,0),(21,16,10,NULL,0,'2025-12-17 05:35:41','2025-12-17 05:35:41','2025-12-17 05:35:57','2025-12-17 05:36:02',NULL,'2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:36:02',0,0,0,NULL,NULL,NULL,18,3,2,1,4,NULL,0,0),(22,16,11,NULL,NULL,'2025-12-17 05:35:47','2025-12-17 05:35:47',NULL,NULL,NULL,'2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:35:47',0,0,0,NULL,NULL,NULL,18,3,2,1,0,NULL,0,0),(23,16,12,NULL,NULL,'2025-12-17 05:35:53','2025-12-17 05:35:53',NULL,NULL,NULL,'2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:35:53',0,0,0,NULL,NULL,NULL,18,3,2,1,0,NULL,0,0),(24,17,7,NULL,NULL,'2025-12-17 05:37:03','2025-12-17 05:37:04',NULL,NULL,NULL,'2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:37:04',0,0,0,NULL,NULL,NULL,19,2,2,1,0,NULL,0,0),(25,17,8,NULL,NULL,'2025-12-17 05:37:10','2025-12-17 05:37:10',NULL,NULL,NULL,'2026-01-14 00:00:00','2026-01-14 00:00:00','2025-12-17 05:37:10',0,0,0,NULL,NULL,NULL,19,2,2,1,0,NULL,0,0);
/*!40000 ALTER TABLE `review_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_files`
--

DROP TABLE IF EXISTS `review_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_files` (
  `review_file_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `review_id` bigint NOT NULL,
  `submission_file_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`review_file_id`),
  UNIQUE KEY `review_files_unique` (`review_id`,`submission_file_id`),
  KEY `review_files_review_id` (`review_id`),
  KEY `review_files_submission_file_id` (`submission_file_id`),
  CONSTRAINT `review_files_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `review_assignments` (`review_id`) ON DELETE CASCADE,
  CONSTRAINT `review_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb3 COMMENT='A list of the submission files made available to each assigned reviewer.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_files`
--

LOCK TABLES `review_files` WRITE;
/*!40000 ALTER TABLE `review_files` DISABLE KEYS */;
INSERT INTO `review_files` VALUES (1,1,4),(2,1,5),(3,1,6),(4,2,12),(5,2,13),(6,2,14),(7,2,15),(8,3,12),(9,3,13),(10,3,14),(11,3,15),(12,4,25),(13,4,26),(14,4,27),(15,4,28),(20,6,35),(21,6,36),(16,6,37),(17,6,38),(18,6,39),(19,6,40),(22,8,55),(23,8,56),(24,8,57),(25,8,58),(26,8,59),(27,9,82),(28,9,83),(29,12,87),(30,12,88),(31,12,89),(32,13,87),(33,13,88),(34,13,89),(35,14,87),(36,14,88),(37,14,89),(38,15,93),(39,15,94),(40,15,95),(41,19,102),(42,19,103),(43,19,104),(44,19,105),(45,19,106),(46,19,107),(51,21,125),(47,21,126),(48,21,127),(49,21,128),(50,21,129),(56,22,125),(52,22,126),(53,22,127),(54,22,128),(55,22,129),(61,23,125),(57,23,126),(58,23,127),(59,23,128),(60,23,129),(62,24,136),(63,24,137),(64,24,138),(65,24,139),(66,24,140),(67,24,141),(68,25,136),(69,25,137),(70,25,138),(71,25,139),(72,25,140),(73,25,141);
/*!40000 ALTER TABLE `review_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_element_settings`
--

DROP TABLE IF EXISTS `review_form_element_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_element_settings` (
  `review_form_element_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `review_form_element_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`review_form_element_setting_id`),
  UNIQUE KEY `review_form_element_settings_unique` (`review_form_element_id`,`locale`,`setting_name`),
  KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`),
  CONSTRAINT `review_form_element_settings_review_form_element_id` FOREIGN KEY (`review_form_element_id`) REFERENCES `review_form_elements` (`review_form_element_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about review form elements, including localized content such as question text.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_element_settings`
--

LOCK TABLES `review_form_element_settings` WRITE;
/*!40000 ALTER TABLE `review_form_element_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_element_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_elements`
--

DROP TABLE IF EXISTS `review_form_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_elements` (
  `review_form_element_id` bigint NOT NULL AUTO_INCREMENT,
  `review_form_id` bigint NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  `element_type` bigint DEFAULT NULL,
  `required` smallint DEFAULT NULL,
  `included` smallint DEFAULT NULL,
  PRIMARY KEY (`review_form_element_id`),
  KEY `review_form_elements_review_form_id` (`review_form_id`),
  CONSTRAINT `review_form_elements_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Each review form element represents a single question on a review form.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_elements`
--

LOCK TABLES `review_form_elements` WRITE;
/*!40000 ALTER TABLE `review_form_elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_responses`
--

DROP TABLE IF EXISTS `review_form_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_responses` (
  `review_form_response_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `review_form_element_id` bigint NOT NULL,
  `review_id` bigint NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text,
  PRIMARY KEY (`review_form_response_id`),
  KEY `review_form_responses_review_form_element_id` (`review_form_element_id`),
  KEY `review_form_responses_review_id` (`review_id`),
  KEY `review_form_responses_unique` (`review_form_element_id`,`review_id`),
  CONSTRAINT `review_form_responses_review_form_element_id_foreign` FOREIGN KEY (`review_form_element_id`) REFERENCES `review_form_elements` (`review_form_element_id`) ON DELETE CASCADE,
  CONSTRAINT `review_form_responses_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `review_assignments` (`review_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Each review form response records a reviewer''s answer to a review form element associated with a peer review.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_responses`
--

LOCK TABLES `review_form_responses` WRITE;
/*!40000 ALTER TABLE `review_form_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_settings`
--

DROP TABLE IF EXISTS `review_form_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_settings` (
  `review_form_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `review_form_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`review_form_setting_id`),
  UNIQUE KEY `review_form_settings_unique` (`review_form_id`,`locale`,`setting_name`),
  KEY `review_form_settings_review_form_id` (`review_form_id`),
  CONSTRAINT `review_form_settings_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about review forms, including localized content such as names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_settings`
--

LOCK TABLES `review_form_settings` WRITE;
/*!40000 ALTER TABLE `review_form_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_forms`
--

DROP TABLE IF EXISTS `review_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_forms` (
  `review_form_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  `is_active` smallint DEFAULT NULL,
  PRIMARY KEY (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Review forms provide custom templates for peer reviews with several types of questions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_forms`
--

LOCK TABLES `review_forms` WRITE;
/*!40000 ALTER TABLE `review_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_round_files`
--

DROP TABLE IF EXISTS `review_round_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_round_files` (
  `review_round_file_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `review_round_id` bigint NOT NULL,
  `stage_id` smallint NOT NULL,
  `submission_file_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`review_round_file_id`),
  UNIQUE KEY `review_round_files_unique` (`submission_id`,`review_round_id`,`submission_file_id`),
  KEY `review_round_files_submission_id` (`submission_id`),
  KEY `review_round_files_review_round_id` (`review_round_id`),
  KEY `review_round_files_submission_file_id` (`submission_file_id`),
  CONSTRAINT `review_round_files_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`) ON DELETE CASCADE,
  CONSTRAINT `review_round_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `review_round_files_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb3 COMMENT='Records the files made available to reviewers for a round of reviews. These can be further customized on a per review basis with review_files.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_round_files`
--

LOCK TABLES `review_round_files` WRITE;
/*!40000 ALTER TABLE `review_round_files` DISABLE KEYS */;
INSERT INTO `review_round_files` VALUES (1,1,1,3,4),(2,1,1,3,5),(3,1,1,3,6),(4,2,2,3,12),(5,2,2,3,13),(6,2,2,3,14),(7,2,2,3,15),(8,4,3,2,25),(9,4,3,2,26),(10,4,3,2,27),(11,4,3,2,28),(12,5,5,2,35),(13,5,5,2,36),(14,5,5,2,37),(15,5,5,2,38),(16,5,5,2,39),(17,5,5,2,40),(18,6,7,2,46),(19,6,7,2,47),(20,6,7,2,48),(21,6,7,2,49),(22,7,8,3,55),(23,7,8,3,56),(24,7,8,3,57),(25,7,8,3,58),(26,7,8,3,59),(27,9,9,2,66),(28,9,9,2,67),(29,9,9,2,68),(30,9,9,2,69),(31,9,9,2,70),(32,11,10,2,82),(33,11,10,2,83),(34,12,12,2,87),(35,12,12,2,88),(36,12,12,2,89),(37,13,13,2,93),(38,13,13,2,94),(39,13,13,2,95),(40,14,15,2,102),(41,14,15,2,103),(42,14,15,2,104),(43,14,15,2,105),(44,14,15,2,106),(45,14,15,2,107),(46,15,17,3,117),(47,15,17,3,118),(48,15,17,3,119),(49,16,18,3,125),(50,16,18,3,126),(51,16,18,3,127),(52,16,18,3,128),(53,16,18,3,129),(54,17,19,2,136),(55,17,19,2,137),(56,17,19,2,138),(57,17,19,2,139),(58,17,19,2,140),(59,17,19,2,141);
/*!40000 ALTER TABLE `review_round_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_rounds`
--

DROP TABLE IF EXISTS `review_rounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_rounds` (
  `review_round_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `stage_id` bigint DEFAULT NULL,
  `round` smallint NOT NULL,
  `review_revision` bigint DEFAULT NULL,
  `status` bigint DEFAULT NULL,
  PRIMARY KEY (`review_round_id`),
  UNIQUE KEY `review_rounds_submission_id_stage_id_round_pkey` (`submission_id`,`stage_id`,`round`),
  KEY `review_rounds_submission_id` (`submission_id`),
  CONSTRAINT `review_rounds_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COMMENT='Peer review assignments are organized into multiple rounds on a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_rounds`
--

LOCK TABLES `review_rounds` WRITE;
/*!40000 ALTER TABLE `review_rounds` DISABLE KEYS */;
INSERT INTO `review_rounds` VALUES (1,1,3,1,NULL,4),(2,2,3,1,NULL,7),(3,4,2,1,NULL,4),(4,4,3,1,NULL,4),(5,5,2,1,NULL,4),(6,5,3,1,NULL,4),(7,6,2,1,NULL,14),(8,7,3,1,NULL,4),(9,9,2,1,NULL,6),(10,11,2,1,NULL,4),(11,11,3,1,NULL,4),(12,12,2,1,NULL,8),(13,13,2,1,NULL,4),(14,13,3,1,NULL,4),(15,14,2,1,NULL,4),(16,14,3,1,NULL,4),(17,15,3,1,NULL,6),(18,16,3,1,NULL,8),(19,17,2,1,NULL,7);
/*!40000 ALTER TABLE `review_rounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_rights`
--

DROP TABLE IF EXISTS `sales_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_rights` (
  `sales_rights_id` bigint NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint NOT NULL,
  `type` varchar(40) NOT NULL,
  `row_setting` smallint NOT NULL DEFAULT '0',
  `countries_included` text,
  `countries_excluded` text,
  `regions_included` text,
  `regions_excluded` text,
  PRIMARY KEY (`sales_rights_id`),
  KEY `sales_rights_publication_format_id` (`publication_format_id`),
  KEY `format_sales_rights_pkey` (`sales_rights_id`,`publication_format_id`),
  CONSTRAINT `sales_rights_publication_format_id` FOREIGN KEY (`publication_format_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='ONIX sales rights for publication formats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_rights`
--

LOCK TABLES `sales_rights` WRITE;
/*!40000 ALTER TABLE `sales_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled_tasks`
--

DROP TABLE IF EXISTS `scheduled_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduled_tasks` (
  `scheduled_task_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL,
  `last_run` datetime DEFAULT NULL,
  PRIMARY KEY (`scheduled_task_id`),
  UNIQUE KEY `scheduled_tasks_unique` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COMMENT='The last time each scheduled task was run.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_tasks`
--

LOCK TABLES `scheduled_tasks` WRITE;
/*!40000 ALTER TABLE `scheduled_tasks` DISABLE KEYS */;
INSERT INTO `scheduled_tasks` VALUES (1,'PKP\\task\\ReviewReminder','2025-12-17 05:15:00'),(2,'PKP\\task\\PublishSubmissions','2025-12-17 05:15:00'),(3,'PKP\\task\\StatisticsReport','2025-12-17 05:15:00'),(4,'PKP\\task\\RemoveUnvalidatedExpiredUsers','2025-12-17 05:15:00'),(5,'PKP\\task\\UpdateIPGeoDB','2025-12-17 05:15:00'),(6,'APP\\tasks\\UsageStatsLoader','2025-12-17 05:15:01'),(7,'PKP\\task\\EditorialReminders','2025-12-17 05:15:01'),(8,'PKP\\task\\ProcessQueueJobs','2025-12-17 05:15:01'),(9,'PKP\\task\\RemoveFailedJobs','2025-12-17 05:15:01');
/*!40000 ALTER TABLE `scheduled_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series` (
  `series_id` bigint NOT NULL AUTO_INCREMENT,
  `press_id` bigint NOT NULL,
  `review_form_id` bigint DEFAULT NULL,
  `seq` double(8,2) DEFAULT '0.00',
  `featured` smallint NOT NULL DEFAULT '0',
  `editor_restricted` smallint NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL,
  `image` text,
  `is_inactive` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`series_id`),
  UNIQUE KEY `series_path` (`press_id`,`path`),
  KEY `series_press_id` (`press_id`),
  KEY `series_review_form_id` (`review_form_id`),
  CONSTRAINT `series_press_id` FOREIGN KEY (`press_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `series_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='A list of press series, into which submissions can be organized.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES (1,1,NULL,0.00,0,0,'lis','[]',0),(2,1,NULL,0.00,0,0,'pe','[]',0),(3,1,NULL,0.00,0,0,'his','[]',0),(4,1,NULL,0.00,0,0,'ed','[]',0),(5,1,NULL,0.00,0,0,'psy','[]',0);
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series_categories`
--

DROP TABLE IF EXISTS `series_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series_categories` (
  `series_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  UNIQUE KEY `series_categories_id` (`series_id`,`category_id`),
  KEY `series_categories_series_id` (`series_id`),
  KEY `series_categories_category_id` (`category_id`),
  CONSTRAINT `series_categories_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE,
  CONSTRAINT `series_categories_series_id` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A list of relationships between series and category information.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series_categories`
--

LOCK TABLES `series_categories` WRITE;
/*!40000 ALTER TABLE `series_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `series_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series_settings`
--

DROP TABLE IF EXISTS `series_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series_settings` (
  `series_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `series_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  PRIMARY KEY (`series_setting_id`),
  UNIQUE KEY `series_settings_unique` (`series_id`,`locale`,`setting_name`),
  KEY `series_settings_series_id` (`series_id`),
  CONSTRAINT `series_settings_series_id` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3 COMMENT='More data about series, including localized properties such as series titles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series_settings`
--

LOCK TABLES `series_settings` WRITE;
/*!40000 ALTER TABLE `series_settings` DISABLE KEYS */;
INSERT INTO `series_settings` VALUES (1,1,'en','title','Library & Information Studies'),(2,1,'fr_CA','title',''),(3,1,'en','description',''),(4,1,'fr_CA','description',''),(5,1,'','onlineIssn',''),(6,1,'en','prefix',''),(7,1,'fr_CA','prefix',''),(8,1,'','printIssn',''),(9,1,'','sortOption','title-ASC'),(10,1,'en','subtitle',''),(11,1,'fr_CA','subtitle',''),(12,2,'en','title','Political Economy'),(13,2,'fr_CA','title',''),(14,2,'en','description',''),(15,2,'fr_CA','description',''),(16,2,'','onlineIssn',''),(17,2,'en','prefix',''),(18,2,'fr_CA','prefix',''),(19,2,'','printIssn',''),(20,2,'','sortOption','title-ASC'),(21,2,'en','subtitle',''),(22,2,'fr_CA','subtitle',''),(23,3,'en','title','History'),(24,3,'fr_CA','title',''),(25,3,'en','description',''),(26,3,'fr_CA','description',''),(27,3,'','onlineIssn',''),(28,3,'en','prefix',''),(29,3,'fr_CA','prefix',''),(30,3,'','printIssn',''),(31,3,'','sortOption','title-ASC'),(32,3,'en','subtitle',''),(33,3,'fr_CA','subtitle',''),(34,4,'en','title','Education'),(35,4,'fr_CA','title',''),(36,4,'en','description',''),(37,4,'fr_CA','description',''),(38,4,'','onlineIssn',''),(39,4,'en','prefix',''),(40,4,'fr_CA','prefix',''),(41,4,'','printIssn',''),(42,4,'','sortOption','title-ASC'),(43,4,'en','subtitle',''),(44,4,'fr_CA','subtitle',''),(45,5,'en','title','Psychology'),(46,5,'fr_CA','title',''),(47,5,'en','description',''),(48,5,'fr_CA','description',''),(49,5,'','onlineIssn',''),(50,5,'en','prefix',''),(51,5,'fr_CA','prefix',''),(52,5,'','printIssn',''),(53,5,'','sortOption','title-ASC'),(54,5,'en','subtitle',''),(55,5,'fr_CA','subtitle','');
/*!40000 ALTER TABLE `series_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `ip_address` varchar(39) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created` bigint NOT NULL DEFAULT '0',
  `last_used` bigint NOT NULL DEFAULT '0',
  `remember` smallint NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  UNIQUE KEY `sessions_pkey` (`session_id`),
  KEY `sessions_user_id` (`user_id`),
  CONSTRAINT `sessions_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Session data for logged-in users.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('1k2m1i990g5uroo841iu8dcavs',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765948829,1765948854,1,'csrf|a:2:{s:9:\"timestamp\";i:1765948853;s:5:\"token\";s:32:\"7d98a0b5ca8285c9d6a284c600dbc6cb\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('1p8jplm4d22ihnj3r49n3t8fdn',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949528,1765949540,1,'csrf|a:2:{s:9:\"timestamp\";i:1765949540;s:5:\"token\";s:32:\"b7f78927b56df81aa608fa9c587818ab\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('2ucnsn9291a5ae9qlbtdiep6e0',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949111,1765949127,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949127;s:5:\"token\";s:32:\"54d2fd4e56b56d85531ca9628ea0bf63\";}username|s:7:\"dbarnes\";','localhost'),('36oqjgd0gvkvl4dnclcvbp6b9k',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765948722,1765948742,1,'csrf|a:2:{s:9:\"timestamp\";i:1765948742;s:5:\"token\";s:32:\"9d2cb40e84a608f00387a8231cc909db\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('3l1f05cooqnghu703an6eb7t1d',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949754,1765949762,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949762;s:5:\"token\";s:32:\"fd3ae15797e582af88659e0a1ae7d21a\";}username|s:8:\"agallego\";','localhost'),('3qd9le96fl0nvliden2i249pmp',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949394,1765949418,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949418;s:5:\"token\";s:32:\"39eb7de360f0b77d51fbc161023413ae\";}username|s:6:\"lelder\";','localhost'),('4cbqakhkirh15l86mieoisg33b',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765948540,1765948543,1,'csrf|a:2:{s:9:\"timestamp\";i:1765948543;s:5:\"token\";s:32:\"89e841b2e99369348f40601371dccc88\";}userId|i:1;username|s:5:\"admin\";','localhost'),('55hn8jfb2kkkskd5n63tkc8b4v',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949764,1765949806,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949806;s:5:\"token\";s:32:\"033242e5d22b5992cbce6fdc54777102\";}username|s:6:\"msmith\";','localhost'),('56r93opk3kpr24g9om4vqdmdqn',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949372,1765949379,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949379;s:5:\"token\";s:32:\"73e8926495cbfc185a2332250b3202f5\";}username|s:6:\"gfavio\";','localhost'),('5qu6tba1dp5jhisb4adik9u4r9',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949244,1765949254,1,'csrf|a:2:{s:9:\"timestamp\";i:1765949254;s:5:\"token\";s:32:\"cd7c182c720fcbccfb30ec2d28cc3804\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('601hrotmq9oasavis2un2t4a06',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765948744,1765948828,0,'csrf|a:2:{s:9:\"timestamp\";i:1765948828;s:5:\"token\";s:32:\"9b2c8f3c12852081600ef8abe170baee\";}username|s:7:\"afinkel\";','localhost'),('7kocmo63ueaoenqksvdg1t07t4',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949454,1765949476,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949476;s:5:\"token\";s:32:\"a573660d554653b832332ec41e73695e\";}username|s:5:\"mally\";','localhost'),('89jrpvv0sogauovb7hrr3ku29n',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949210,1765949244,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949244;s:5:\"token\";s:32:\"cac1e72eb442e5b18e46ffa96a967b42\";}username|s:7:\"fperini\";','localhost'),('8qp81rs6jvm51bm306rnml94q0',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949661,1765949681,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949681;s:5:\"token\";s:32:\"1fcb42c83ba340030aea2e0d614e1c2c\";}username|s:6:\"mforan\";','localhost'),('9vtkm326hhboh3g23vu4i66hi3',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949693,1765949725,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949725;s:5:\"token\";s:32:\"54fd0e788e2d8e2dc6d4734a2f03800e\";}username|s:6:\"mpower\";','localhost'),('adrcr4ac5hht7brs37afa9gd3n',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949544,1765949575,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949575;s:5:\"token\";s:32:\"f130c0d6dbd33faa89ef7e7c5ea0834f\";}username|s:7:\"mdawson\";','localhost'),('ai3vr5c2q5jhhq7lbk9srm31po',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949725,1765949754,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949754;s:5:\"token\";s:32:\"c0e1a6bac9f79e55f42c821bed2c8525\";}username|s:7:\"dbarnes\";','localhost'),('bcm8rnbfdrp7bhu6g41orp1fte',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949071,1765949076,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949076;s:5:\"token\";s:32:\"35e8a4e33a92f204051e01863d34ed28\";}username|s:7:\"dbarnes\";','localhost'),('bugedn6q5bbb059r4q3o54aeun',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949010,1765949070,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949070;s:5:\"token\";s:32:\"19a17f224e027fc153a80076f5eee60c\";}username|s:7:\"dbarnes\";','localhost'),('c1eadju3123uslgmurj33ocbn3',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949445,1765949452,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949452;s:5:\"token\";s:32:\"8ec3ad180f218498d004b60c2565ff8b\";}username|s:7:\"phudson\";','localhost'),('ced2fuqk6eeu0h7pknbc37fnqm',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949520,1765949527,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949527;s:5:\"token\";s:32:\"a750d7dd763914aa022dac72beb85e1c\";}username|s:6:\"gfavio\";','localhost'),('d9rf205lapvm39u4gi1isc0rit',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949380,1765949391,1,'csrf|a:2:{s:9:\"timestamp\";i:1765949391;s:5:\"token\";s:32:\"1c3e191b8d170570b28c62048cfe3b32\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('du0ag75f85op52ngpm7eekrr84',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765948500,1765948518,1,'csrf|a:2:{s:9:\"timestamp\";i:1765948518;s:5:\"token\";s:32:\"fc49837dea1ac53eeeeaeaaa01cd5279\";}userId|i:1;username|s:5:\"admin\";','localhost'),('eapv607c0mgrq0gupq6m4oejma',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949135,1765949140,1,'csrf|a:2:{s:9:\"timestamp\";i:1765949140;s:5:\"token\";s:32:\"da6ff15a76d6a330ee006d12e69fdabf\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('efjukab35upe57puiuj3bemv2b',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949807,1765949830,1,'csrf|a:2:{s:9:\"timestamp\";i:1765949830;s:5:\"token\";s:32:\"a86fa6192538b89912d43a255a54578d\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('ekobrhkqbrqqngjdnt6ivctn5h',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949076,1765949080,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949080;s:5:\"token\";s:32:\"1e1d178c84550a677b85060e06d7dd0a\";}username|s:7:\"dbarnes\";','localhost'),('fc6paatfppt85oktlkd9kc0vte',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765948659,1765948664,0,'csrf|a:2:{s:9:\"timestamp\";i:1765948664;s:5:\"token\";s:32:\"0aab4441a839ac09dfd75b640cc342ae\";}username|s:5:\"rvaca\";','localhost'),('fjuaf5mi0fjhnh5eol95dn6d2p',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949682,1765949691,1,'csrf|a:2:{s:9:\"timestamp\";i:1765949691;s:5:\"token\";s:32:\"835505b2fb94f33b408202195bba877f\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('g51tfd013qldpchgc2c2g7ilo7',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949203,1765949208,1,'csrf|a:2:{s:9:\"timestamp\";i:1765949208;s:5:\"token\";s:32:\"862bd1ee3aca65651fc062875715d32a\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('gavbkruuskp9aacduqjin57628',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949512,1765949520,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949520;s:5:\"token\";s:32:\"b771d5e2fcc5c62a5050fb428ae8cab7\";}username|s:8:\"agallego\";','localhost'),('lefj8vc720rvjk0fpf0fs60dg3',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949177,1765949200,1,'csrf|a:2:{s:9:\"timestamp\";i:1765949201;s:5:\"token\";s:32:\"c87b4f9ddbd93214611b5f1eab0c7d11\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('lul00nlp6dfdc3vueb5er5lja9',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949476,1765949512,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949512;s:5:\"token\";s:32:\"29425e90d7483e7abe4c7388df9e7b6d\";}username|s:7:\"dbarnes\";','localhost'),('m33d0rb23mu656qv0c2gjigl64',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949082,1765949111,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949111;s:5:\"token\";s:32:\"a67e7034490a028b25c6c4237b27bd00\";}username|s:9:\"dbernnard\";','localhost'),('mqcedqhce86k80eian9nbpnq5c',21,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765948856,1765948890,0,'csrf|a:2:{s:9:\"timestamp\";i:1765948890;s:5:\"token\";s:32:\"d0f60d49cee83dd866bbe2e0bbda654b\";}username|s:10:\"bbarnetson\";userId|i:21;','localhost'),('n3093a9toqrp4o0lbu91pi50j8',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765948534,1765948539,1,'csrf|a:2:{s:9:\"timestamp\";i:1765948539;s:5:\"token\";s:32:\"b2e2e028a5bf3e62f72e12fe0e8920f6\";}userId|i:1;username|s:5:\"admin\";','localhost'),('n5a2crab3er364s6ksci5mmm69',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765948921,1765948967,0,'csrf|a:2:{s:9:\"timestamp\";i:1765948966;s:5:\"token\";s:32:\"e44a93d49a289420f2ae5149744513ec\";}username|s:7:\"dbarnes\";','localhost'),('nf199gqpo32ifb338mhci323ul',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765948892,1765948921,0,'csrf|a:2:{s:9:\"timestamp\";i:1765948921;s:5:\"token\";s:32:\"90d70e760398cd78aa57c557f6bab775\";}username|s:6:\"bbeaty\";','localhost'),('nm2h45gqmbt2v3qh274rshpqab',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949575,1765949655,1,'csrf|a:2:{s:9:\"timestamp\";i:1765949655;s:5:\"token\";s:32:\"70053cc916940a1759918799f2b2c008\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('nngr8p2co7bfuulk9mq5vt0li6',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765948685,1765948699,1,'csrf|a:2:{s:9:\"timestamp\";i:1765948699;s:5:\"token\";s:32:\"a4eeacd39970606b2eb4dd2c3f4f9d47\";}userId|i:1;username|s:5:\"admin\";','localhost'),('opeam75ke1g24e0l0jtg1b39fn',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765948701,1765948722,0,'csrf|a:2:{s:9:\"timestamp\";i:1765948722;s:5:\"token\";s:32:\"e607dcbbb8698be63ebc16f49927a51a\";}username|s:6:\"aclark\";','localhost'),('q2el8igbu69rfnnun4ljks9lq8',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949418,1765949444,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949444;s:5:\"token\";s:32:\"8b88cfec94a58ce3ddd1dd37c54d5b2d\";}username|s:7:\"dbarnes\";','localhost'),('q3d065c30es7gpj5un2m93m0uq',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949127,1765949135,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949135;s:5:\"token\";s:32:\"2f4a9fdb3205a14f490531dbc6218eb7\";}username|s:6:\"minoue\";','localhost'),('q7fqin902sq9pi0l4a8ju55s5r',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949320,1765949336,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949336;s:5:\"token\";s:32:\"e09c6d332597594d6bf07befceb3d405\";}username|s:10:\"jlockehart\";','localhost'),('rh44tv5j183d7otg06dg68gjq8',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949365,1765949372,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949372;s:5:\"token\";s:32:\"872a74bfddcfa473038c795b44a6e1d7\";}username|s:8:\"agallego\";','localhost'),('rl5f2b2qi4q7vickecqalj5f7e',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949142,1765949177,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949177;s:5:\"token\";s:32:\"f5e78d8eebd98e887054bb39890dd365\";}username|s:10:\"dkennepohl\";','localhost'),('rn6iokrd2ii6cbke6k6s5j22a0',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765948971,1765949010,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949010;s:5:\"token\";s:32:\"0acb728ee6dd6730ffbb04814620c852\";}username|s:6:\"callan\";','localhost'),('tkupsasf3tplr6d9s3r4c3mhee',27,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949257,1765949318,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949318;s:5:\"token\";s:32:\"98e43377bdec0876b5ea5c324015bd5b\";}username|s:7:\"jbrower\";userId|i:27;','localhost'),('ud8jk8qar703tshsuna6vmcult',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765948529,1765948534,1,'csrf|a:2:{s:9:\"timestamp\";i:1765948534;s:5:\"token\";s:32:\"97392bc2fd400646a43404192556959e\";}userId|i:1;username|s:5:\"admin\";','localhost'),('uhacu4qf7g7ei8fg9gjqg0q34i',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765949336,1765949364,0,'csrf|a:2:{s:9:\"timestamp\";i:1765949364;s:5:\"token\";s:32:\"40fd1fe0dc21a3557e112adf1f389082\";}username|s:7:\"dbarnes\";','localhost'),('v86gra73u7m23ffqlos18lo3te',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765948518,1765948528,1,'csrf|a:2:{s:9:\"timestamp\";i:1765948528;s:5:\"token\";s:32:\"7e510de2ea78fa6aa776b14bf615228c\";}userId|i:1;username|s:5:\"admin\";','localhost'),('vdhjl32h3qiqrnpit76321jrg0',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765948545,1765948659,0,'csrf|a:2:{s:9:\"timestamp\";i:1765948659;s:5:\"token\";s:32:\"b5356a514b79788a7e85986186c59dc1\";}username|s:5:\"admin\";','localhost'),('vosl6ha0rl3t8o3d5tnvleijbh',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1765948667,1765948683,1,'csrf|a:2:{s:9:\"timestamp\";i:1765948683;s:5:\"token\";s:32:\"3e736f3f3df01d0264e04dd8f8a42998\";}userId|i:1;username|s:5:\"admin\";','localhost');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site` (
  `site_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `redirect` bigint NOT NULL DEFAULT '0' COMMENT 'If not 0, redirect to the specified journal/conference/... site.',
  `primary_locale` varchar(14) NOT NULL COMMENT 'Primary locale for the site.',
  `min_password_length` smallint NOT NULL DEFAULT '6',
  `installed_locales` varchar(1024) NOT NULL DEFAULT 'en' COMMENT 'Locales for which support has been installed.',
  `supported_locales` varchar(1024) DEFAULT NULL COMMENT 'Locales supported by the site (for hosted journals/conferences/...).',
  `original_style_file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='A singleton table describing basic information about the site.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (1,0,'en',6,'[\"en\",\"fr_CA\"]','[\"en\",\"fr_CA\"]',NULL);
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_settings` (
  `site_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_value` mediumtext,
  PRIMARY KEY (`site_setting_id`),
  UNIQUE KEY `site_settings_unique` (`setting_name`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COMMENT='More data about the site, including localized properties such as its name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES (1,'contactEmail','en','pkpadmin@mailinator.com'),(2,'contactName','en','Open Monograph Press'),(3,'contactName','fr_CA','Open Monograph Press'),(4,'compressStatsLogs','','0'),(5,'enableGeoUsageStats','','disabled'),(6,'enableInstitutionUsageStats','','0'),(7,'keepDailyUsageStats','','0'),(8,'isSiteSushiPlatform','','0'),(9,'isSushiApiPublic','','1'),(10,'disableSharedReviewerStatistics','','0'),(11,'themePluginPath','','default'),(12,'uniqueSiteId','','6626AB96-8150-44DF-8D9B-D12EEC382B13');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spotlight_settings`
--

DROP TABLE IF EXISTS `spotlight_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spotlight_settings` (
  `spotlight_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `spotlight_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)',
  PRIMARY KEY (`spotlight_setting_id`),
  UNIQUE KEY `spotlight_settings_unique` (`spotlight_id`,`locale`,`setting_name`),
  KEY `spotlight_settings_id` (`spotlight_id`),
  CONSTRAINT `spotlight_settings_spotlight_id_foreign` FOREIGN KEY (`spotlight_id`) REFERENCES `spotlights` (`spotlight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about spotlights, including localized properties.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spotlight_settings`
--

LOCK TABLES `spotlight_settings` WRITE;
/*!40000 ALTER TABLE `spotlight_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `spotlight_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spotlights`
--

DROP TABLE IF EXISTS `spotlights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spotlights` (
  `spotlight_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint NOT NULL,
  `assoc_id` smallint NOT NULL,
  `press_id` bigint NOT NULL,
  PRIMARY KEY (`spotlight_id`),
  KEY `spotlights_press_id` (`press_id`),
  KEY `spotlights_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `spotlights_press_id_foreign` FOREIGN KEY (`press_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Information about which submissions to the press are spotlighted.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spotlights`
--

LOCK TABLES `spotlights` WRITE;
/*!40000 ALTER TABLE `spotlights` DISABLE KEYS */;
/*!40000 ALTER TABLE `spotlights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stage_assignments`
--

DROP TABLE IF EXISTS `stage_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stage_assignments` (
  `stage_assignment_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `user_group_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `date_assigned` datetime NOT NULL,
  `recommend_only` smallint NOT NULL DEFAULT '0',
  `can_change_metadata` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`stage_assignment_id`),
  UNIQUE KEY `stage_assignment` (`submission_id`,`user_group_id`,`user_id`),
  KEY `stage_assignments_user_group_id` (`user_group_id`),
  KEY `stage_assignments_user_id` (`user_id`),
  KEY `stage_assignments_submission_id` (`submission_id`),
  CONSTRAINT `stage_assignments_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE,
  CONSTRAINT `stage_assignments_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `stage_assignments_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COMMENT='Who can access a submission while it is in the editorial workflow. Includes all editorial and author assignments. For reviewers, see review_assignments.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES (1,1,13,19,'2025-12-17 05:18:41',0,0),(2,1,5,4,'2025-12-17 05:18:41',0,1),(3,1,6,14,'2025-12-17 05:19:02',0,0),(4,2,13,20,'2025-12-17 05:20:25',0,0),(5,3,13,21,'2025-12-17 05:21:29',0,0),(6,4,13,22,'2025-12-17 05:22:00',0,0),(7,4,3,3,'2025-12-17 05:22:00',0,1),(8,4,6,13,'2025-12-17 05:22:33',0,0),(9,4,10,15,'2025-12-17 05:22:42',0,0),(10,5,13,23,'2025-12-17 05:23:29',0,0),(11,5,6,14,'2025-12-17 05:24:03',0,0),(12,5,10,16,'2025-12-17 05:24:13',0,0),(13,5,12,17,'2025-12-17 05:24:16',0,0),(14,6,13,24,'2025-12-17 05:25:10',0,0),(15,6,5,4,'2025-12-17 05:25:10',0,1),(16,6,3,3,'2025-12-17 05:25:22',0,1),(17,6,5,6,'2025-12-17 05:25:26',1,1),(18,7,13,25,'2025-12-17 05:26:16',0,0),(19,7,3,3,'2025-12-17 05:26:16',0,1),(20,7,6,13,'2025-12-17 05:26:40',0,0),(21,8,3,3,'2025-12-17 05:26:46',0,1),(22,9,13,26,'2025-12-17 05:27:23',0,0),(23,9,5,4,'2025-12-17 05:27:23',0,1),(24,10,13,27,'2025-12-17 05:28:38',0,0),(25,11,13,28,'2025-12-17 05:28:55',0,0),(26,12,13,29,'2025-12-17 05:30:17',0,0),(27,13,13,30,'2025-12-17 05:31:15',0,0),(28,14,13,31,'2025-12-17 05:32:54',0,0),(29,14,3,3,'2025-12-17 05:32:54',0,1),(30,14,6,13,'2025-12-17 05:33:29',0,0),(31,14,10,15,'2025-12-17 05:33:38',0,0),(32,14,12,18,'2025-12-17 05:33:42',0,0),(33,15,13,32,'2025-12-17 05:34:41',0,0),(34,16,13,33,'2025-12-17 05:35:24',0,0),(35,17,13,34,'2025-12-17 05:36:45',0,0);
/*!40000 ALTER TABLE `stage_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_page_settings`
--

DROP TABLE IF EXISTS `static_page_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `static_page_settings` (
  `static_page_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `static_page_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`static_page_setting_id`),
  KEY `static_page_settings_static_page_id` (`static_page_id`),
  CONSTRAINT `static_page_settings_static_page_id` FOREIGN KEY (`static_page_id`) REFERENCES `static_pages` (`static_page_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_page_settings`
--

LOCK TABLES `static_page_settings` WRITE;
/*!40000 ALTER TABLE `static_page_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_page_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_pages`
--

DROP TABLE IF EXISTS `static_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `static_pages` (
  `static_page_id` bigint NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `context_id` bigint NOT NULL,
  PRIMARY KEY (`static_page_id`),
  KEY `static_pages_context_id` (`context_id`),
  CONSTRAINT `static_pages_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_pages`
--

LOCK TABLES `static_pages` WRITE;
/*!40000 ALTER TABLE `static_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subeditor_submission_group`
--

DROP TABLE IF EXISTS `subeditor_submission_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subeditor_submission_group` (
  `subeditor_submission_group_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `assoc_type` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `user_group_id` bigint NOT NULL,
  PRIMARY KEY (`subeditor_submission_group_id`),
  UNIQUE KEY `section_editors_unique` (`context_id`,`assoc_id`,`assoc_type`,`user_id`,`user_group_id`),
  KEY `subeditor_submission_group_context_id` (`context_id`),
  KEY `subeditor_submission_group_user_id` (`user_id`),
  KEY `subeditor_submission_group_user_group_id` (`user_group_id`),
  KEY `subeditor_submission_group_assoc_id` (`assoc_id`,`assoc_type`),
  CONSTRAINT `section_editors_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `subeditor_submission_group_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `subeditor_submission_group_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='Subeditor assignments to e.g. sections and categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subeditor_submission_group`
--

LOCK TABLES `subeditor_submission_group` WRITE;
/*!40000 ALTER TABLE `subeditor_submission_group` DISABLE KEYS */;
INSERT INTO `subeditor_submission_group` VALUES (1,1,1,530,4,5),(2,1,2,530,5,5),(3,1,3,530,3,3),(4,1,4,530,3,3),(5,1,5,530,3,3);
/*!40000 ALTER TABLE `subeditor_submission_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_chapter_authors`
--

DROP TABLE IF EXISTS `submission_chapter_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_chapter_authors` (
  `author_id` bigint NOT NULL,
  `chapter_id` bigint NOT NULL,
  `primary_contact` smallint NOT NULL DEFAULT '0',
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  UNIQUE KEY `chapter_authors_pkey` (`author_id`,`chapter_id`),
  KEY `submission_chapter_authors_author_id` (`author_id`),
  KEY `submission_chapter_authors_chapter_id` (`chapter_id`),
  CONSTRAINT `submission_chapter_authors_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_chapter_authors_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='The list of authors associated with each submission chapter.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_chapter_authors`
--

LOCK TABLES `submission_chapter_authors` WRITE;
/*!40000 ALTER TABLE `submission_chapter_authors` DISABLE KEYS */;
INSERT INTO `submission_chapter_authors` VALUES (1,1,0,0.00),(1,2,0,0.00),(1,3,0,0.00),(5,4,0,0.00),(6,5,0,0.00),(7,6,0,0.00),(8,7,0,0.00),(9,7,0,1.00),(11,8,0,0.00),(11,9,0,0.00),(11,10,0,0.00),(11,11,0,0.00),(11,12,0,0.00),(12,13,0,0.00),(13,14,0,0.00),(14,15,0,0.00),(15,16,0,0.00),(16,17,0,0.00),(16,18,0,0.00),(16,19,0,0.00),(16,20,0,0.00),(16,21,0,0.00),(16,22,0,0.00),(17,23,0,0.00),(18,24,0,0.00),(19,25,0,0.00),(20,26,0,0.00),(21,27,0,0.00),(22,28,0,0.00),(23,29,0,0.00),(24,30,0,0.00),(25,31,0,0.00),(26,32,0,0.00),(27,33,0,0.00),(28,34,0,0.00),(29,35,0,0.00),(30,36,0,0.00),(31,37,0,0.00),(31,38,0,0.00),(31,39,0,0.00),(31,40,0,0.00),(31,41,0,0.00),(31,42,0,0.00),(31,43,0,0.00),(31,44,0,0.00),(31,45,0,0.00),(32,46,0,0.00),(32,47,0,0.00),(35,48,0,0.00),(36,48,0,1.00),(37,49,0,0.00),(38,49,0,1.00),(39,50,0,0.00),(40,50,0,1.00),(42,51,0,0.00),(43,52,0,0.00),(44,53,0,0.00),(45,54,0,0.00),(45,57,0,0.00),(46,55,0,0.00),(47,56,0,0.00),(48,58,0,0.00),(48,59,0,0.00),(48,60,0,0.00),(49,61,0,0.00),(49,62,0,0.00),(49,63,0,0.00),(49,64,0,0.00),(49,65,0,0.00),(50,67,0,0.00),(50,68,0,0.00),(51,66,0,0.00),(52,67,0,1.00),(52,68,0,1.00),(53,69,0,0.00),(54,69,0,1.00),(55,70,0,0.00),(56,70,0,1.00),(57,71,0,0.00);
/*!40000 ALTER TABLE `submission_chapter_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_chapter_settings`
--

DROP TABLE IF EXISTS `submission_chapter_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_chapter_settings` (
  `submission_chapter_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `chapter_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`submission_chapter_setting_id`),
  UNIQUE KEY `submission_chapter_settings_unique` (`chapter_id`,`locale`,`setting_name`),
  KEY `submission_chapter_settings_chapter_id` (`chapter_id`),
  CONSTRAINT `submission_chapter_settings_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=711 DEFAULT CHARSET=utf8mb3 COMMENT='More information about submission chapters, including localized properties such as chapter titles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_chapter_settings`
--

LOCK TABLES `submission_chapter_settings` WRITE;
/*!40000 ALTER TABLE `submission_chapter_settings` DISABLE KEYS */;
INSERT INTO `submission_chapter_settings` VALUES (1,1,'en','title','Choosing the Future','string'),(2,1,'fr_CA','title','','string'),(3,1,'en','subtitle','','string'),(4,1,'fr_CA','subtitle','','string'),(5,1,'en','abstract','','string'),(6,1,'fr_CA','abstract','','string'),(7,1,'','datePublished',NULL,'string'),(8,1,'','pages','','string'),(9,1,'','isPageEnabled','0','bool'),(10,1,'','licenseUrl',NULL,'string'),(11,2,'en','title','Axioms','string'),(12,2,'fr_CA','title','','string'),(13,2,'en','subtitle','','string'),(14,2,'fr_CA','subtitle','','string'),(15,2,'en','abstract','','string'),(16,2,'fr_CA','abstract','','string'),(17,2,'','datePublished',NULL,'string'),(18,2,'','pages','','string'),(19,2,'','isPageEnabled','0','bool'),(20,2,'','licenseUrl',NULL,'string'),(21,3,'en','title','Paradigm Shift','string'),(22,3,'fr_CA','title','','string'),(23,3,'en','subtitle','','string'),(24,3,'fr_CA','subtitle','','string'),(25,3,'en','abstract','','string'),(26,3,'fr_CA','abstract','','string'),(27,3,'','datePublished',NULL,'string'),(28,3,'','pages','','string'),(29,3,'','isPageEnabled','0','bool'),(30,3,'','licenseUrl',NULL,'string'),(31,4,'en','title','Critical History in Western Canada 1900–2000','string'),(32,4,'fr_CA','title','','string'),(33,4,'en','subtitle','','string'),(34,4,'fr_CA','subtitle','','string'),(35,4,'en','abstract','','string'),(36,4,'fr_CA','abstract','','string'),(37,4,'','datePublished',NULL,'string'),(38,4,'','pages','','string'),(39,4,'','isPageEnabled','0','bool'),(40,4,'','licenseUrl','','string'),(41,5,'en','title','Vernacular Currents in Western Canadian Historiography: The Passion and Prose of Katherine Hughes, F.G. Roe, and Roy Ito','string'),(42,5,'fr_CA','title','','string'),(43,5,'en','subtitle','','string'),(44,5,'fr_CA','subtitle','','string'),(45,5,'en','abstract','','string'),(46,5,'fr_CA','abstract','','string'),(47,5,'','datePublished',NULL,'string'),(48,5,'','pages','','string'),(49,5,'','isPageEnabled','0','bool'),(50,5,'','licenseUrl','','string'),(51,6,'en','title','Cree Intellectual Traditions in History','string'),(52,6,'fr_CA','title','','string'),(53,6,'en','subtitle','','string'),(54,6,'fr_CA','subtitle','','string'),(55,6,'en','abstract','','string'),(56,6,'fr_CA','abstract','','string'),(57,6,'','datePublished',NULL,'string'),(58,6,'','pages','','string'),(59,6,'','isPageEnabled','0','bool'),(60,6,'','licenseUrl','','string'),(61,7,'en','title','Visualizing Space, Race, and History in the North: Photographic Narratives of the Athabasca-Mackenzie River Basin','string'),(62,7,'fr_CA','title','','string'),(63,7,'en','subtitle','','string'),(64,7,'fr_CA','subtitle','','string'),(65,7,'en','abstract','','string'),(66,7,'fr_CA','abstract','','string'),(67,7,'','datePublished',NULL,'string'),(68,7,'','pages','','string'),(69,7,'','isPageEnabled','0','bool'),(70,7,'','licenseUrl','','string'),(71,8,'en','title','Introduction','string'),(72,8,'fr_CA','title','','string'),(73,8,'en','subtitle','','string'),(74,8,'fr_CA','subtitle','','string'),(75,8,'en','abstract','','string'),(76,8,'fr_CA','abstract','','string'),(77,8,'','datePublished',NULL,'string'),(78,8,'','pages','','string'),(79,8,'','isPageEnabled','0','bool'),(80,8,'','licenseUrl',NULL,'string'),(81,9,'en','title','Part One. Employment Relationships in Canada','string'),(82,9,'fr_CA','title','','string'),(83,9,'en','subtitle','','string'),(84,9,'fr_CA','subtitle','','string'),(85,9,'en','abstract','','string'),(86,9,'fr_CA','abstract','','string'),(87,9,'','datePublished',NULL,'string'),(88,9,'','pages','','string'),(89,9,'','isPageEnabled','0','bool'),(90,9,'','licenseUrl',NULL,'string'),(91,10,'en','title','Part Two. Preventing Workplace Injury','string'),(92,10,'fr_CA','title','','string'),(93,10,'en','subtitle','','string'),(94,10,'fr_CA','subtitle','','string'),(95,10,'en','abstract','','string'),(96,10,'fr_CA','abstract','','string'),(97,10,'','datePublished',NULL,'string'),(98,10,'','pages','','string'),(99,10,'','isPageEnabled','0','bool'),(100,10,'','licenseUrl',NULL,'string'),(101,11,'en','title','Part Three. Critique of OHS in Canada','string'),(102,11,'fr_CA','title','','string'),(103,11,'en','subtitle','','string'),(104,11,'fr_CA','subtitle','','string'),(105,11,'en','abstract','','string'),(106,11,'fr_CA','abstract','','string'),(107,11,'','datePublished',NULL,'string'),(108,11,'','pages','','string'),(109,11,'','isPageEnabled','0','bool'),(110,11,'','licenseUrl',NULL,'string'),(111,12,'en','title','Part Four. Political Economy of Preventing Workplace Injury','string'),(112,12,'fr_CA','title','','string'),(113,12,'en','subtitle','','string'),(114,12,'fr_CA','subtitle','','string'),(115,12,'en','abstract','','string'),(116,12,'fr_CA','abstract','','string'),(117,12,'','datePublished',NULL,'string'),(118,12,'','pages','','string'),(119,12,'','isPageEnabled','0','bool'),(120,12,'','licenseUrl',NULL,'string'),(121,13,'en','title','Introduction: Contexts of Popular Culture','string'),(122,13,'fr_CA','title','','string'),(123,13,'en','subtitle','','string'),(124,13,'fr_CA','subtitle','','string'),(125,13,'en','abstract','','string'),(126,13,'fr_CA','abstract','','string'),(127,13,'','datePublished',NULL,'string'),(128,13,'','pages','','string'),(129,13,'','isPageEnabled','0','bool'),(130,13,'','licenseUrl',NULL,'string'),(131,14,'en','title','Chapter 1. A Future for Media Studies: Cultural Labour, Cultural Relations, Cultural Politics','string'),(132,14,'fr_CA','title','','string'),(133,14,'en','subtitle','','string'),(134,14,'fr_CA','subtitle','','string'),(135,14,'en','abstract','','string'),(136,14,'fr_CA','abstract','','string'),(137,14,'','datePublished',NULL,'string'),(138,14,'','pages','','string'),(139,14,'','isPageEnabled','0','bool'),(140,14,'','licenseUrl',NULL,'string'),(141,15,'en','title','Chapter 2. Log On, Goof Off, and Look Up: Facebook and the Rhythms of Canadian Internet Use','string'),(142,15,'fr_CA','title','','string'),(143,15,'en','subtitle','','string'),(144,15,'fr_CA','subtitle','','string'),(145,15,'en','abstract','','string'),(146,15,'fr_CA','abstract','','string'),(147,15,'','datePublished',NULL,'string'),(148,15,'','pages','','string'),(149,15,'','isPageEnabled','0','bool'),(150,15,'','licenseUrl',NULL,'string'),(151,16,'en','title','Chapter 3. Hawkers and Public Space: Free Commuter Newspapers in Canada','string'),(152,16,'fr_CA','title','','string'),(153,16,'en','subtitle','','string'),(154,16,'fr_CA','subtitle','','string'),(155,16,'en','abstract','','string'),(156,16,'fr_CA','abstract','','string'),(157,16,'','datePublished',NULL,'string'),(158,16,'','pages','','string'),(159,16,'','isPageEnabled','0','bool'),(160,16,'','licenseUrl',NULL,'string'),(161,17,'en','title','Prologue','string'),(162,17,'fr_CA','title','','string'),(163,17,'en','subtitle','','string'),(164,17,'fr_CA','subtitle','','string'),(165,17,'en','abstract','','string'),(166,17,'fr_CA','abstract','','string'),(167,17,'','datePublished',NULL,'string'),(168,17,'','pages','','string'),(169,17,'','isPageEnabled','0','bool'),(170,17,'','licenseUrl',NULL,'string'),(171,18,'en','title','Chapter 1: The First Five Years: 1867-1872','string'),(172,18,'fr_CA','title','','string'),(173,18,'en','subtitle','','string'),(174,18,'fr_CA','subtitle','','string'),(175,18,'en','abstract','','string'),(176,18,'fr_CA','abstract','','string'),(177,18,'','datePublished',NULL,'string'),(178,18,'','pages','','string'),(179,18,'','isPageEnabled','0','bool'),(180,18,'','licenseUrl',NULL,'string'),(181,19,'en','title','Chapter 2: Free Trade or \"Freedom\": 1911','string'),(182,19,'fr_CA','title','','string'),(183,19,'en','subtitle','','string'),(184,19,'fr_CA','subtitle','','string'),(185,19,'en','abstract','','string'),(186,19,'fr_CA','abstract','','string'),(187,19,'','datePublished',NULL,'string'),(188,19,'','pages','','string'),(189,19,'','isPageEnabled','0','bool'),(190,19,'','licenseUrl',NULL,'string'),(191,20,'en','title','Chapter 3: Castro, Nukes & the Cold War: 1953-1968','string'),(192,20,'fr_CA','title','','string'),(193,20,'en','subtitle','','string'),(194,20,'fr_CA','subtitle','','string'),(195,20,'en','abstract','','string'),(196,20,'fr_CA','abstract','','string'),(197,20,'','datePublished',NULL,'string'),(198,20,'','pages','','string'),(199,20,'','isPageEnabled','0','bool'),(200,20,'','licenseUrl',NULL,'string'),(201,21,'en','title','Chapter 4: Enter the Intellect: 1968-1984','string'),(202,21,'fr_CA','title','','string'),(203,21,'en','subtitle','','string'),(204,21,'fr_CA','subtitle','','string'),(205,21,'en','abstract','','string'),(206,21,'fr_CA','abstract','','string'),(207,21,'','datePublished',NULL,'string'),(208,21,'','pages','','string'),(209,21,'','isPageEnabled','0','bool'),(210,21,'','licenseUrl',NULL,'string'),(211,22,'en','title','Epilogue','string'),(212,22,'fr_CA','title','','string'),(213,22,'en','subtitle','','string'),(214,22,'fr_CA','subtitle','','string'),(215,22,'en','abstract','','string'),(216,22,'fr_CA','abstract','','string'),(217,22,'','datePublished',NULL,'string'),(218,22,'','pages','','string'),(219,22,'','isPageEnabled','0','bool'),(220,22,'','licenseUrl',NULL,'string'),(221,23,'en','title','Identify: Understanding Your Information Need','string'),(222,23,'fr_CA','title','','string'),(223,23,'en','subtitle','','string'),(224,23,'fr_CA','subtitle','','string'),(225,23,'en','abstract','','string'),(226,23,'fr_CA','abstract','','string'),(227,23,'','datePublished',NULL,'string'),(228,23,'','pages','','string'),(229,23,'','isPageEnabled','0','bool'),(230,23,'','licenseUrl',NULL,'string'),(231,24,'en','title','Scope: Knowing What Is Available','string'),(232,24,'fr_CA','title','','string'),(233,24,'en','subtitle','','string'),(234,24,'fr_CA','subtitle','','string'),(235,24,'en','abstract','','string'),(236,24,'fr_CA','abstract','','string'),(237,24,'','datePublished',NULL,'string'),(238,24,'','pages','','string'),(239,24,'','isPageEnabled','0','bool'),(240,24,'','licenseUrl',NULL,'string'),(241,25,'en','title','Plan: Developing Research Strategies','string'),(242,25,'fr_CA','title','','string'),(243,25,'en','subtitle','','string'),(244,25,'fr_CA','subtitle','','string'),(245,25,'en','abstract','','string'),(246,25,'fr_CA','abstract','','string'),(247,25,'','datePublished',NULL,'string'),(248,25,'','pages','','string'),(249,25,'','isPageEnabled','0','bool'),(250,25,'','licenseUrl',NULL,'string'),(251,26,'en','title','Gather: Finding What You Need','string'),(252,26,'fr_CA','title','','string'),(253,26,'en','subtitle','','string'),(254,26,'fr_CA','subtitle','','string'),(255,26,'en','abstract','','string'),(256,26,'fr_CA','abstract','','string'),(257,26,'','datePublished',NULL,'string'),(258,26,'','pages','','string'),(259,26,'','isPageEnabled','0','bool'),(260,26,'','licenseUrl',NULL,'string'),(261,27,'en','title','Introduction','string'),(262,27,'fr_CA','title','','string'),(263,27,'en','subtitle','','string'),(264,27,'fr_CA','subtitle','','string'),(265,27,'en','abstract','','string'),(266,27,'fr_CA','abstract','','string'),(267,27,'','datePublished',NULL,'string'),(268,27,'','pages','','string'),(269,27,'','isPageEnabled','0','bool'),(270,27,'','licenseUrl',NULL,'string'),(271,28,'en','title','Chapter 1: Interactions Affording Distance Science Education','string'),(272,28,'fr_CA','title','','string'),(273,28,'en','subtitle','','string'),(274,28,'fr_CA','subtitle','','string'),(275,28,'en','abstract','','string'),(276,28,'fr_CA','abstract','','string'),(277,28,'','datePublished',NULL,'string'),(278,28,'','pages','','string'),(279,28,'','isPageEnabled','0','bool'),(280,28,'','licenseUrl',NULL,'string'),(281,29,'en','title','Chapter 2: Learning Science at a Distance: Instructional Dialogues and Resources','string'),(282,29,'fr_CA','title','','string'),(283,29,'en','subtitle','','string'),(284,29,'fr_CA','subtitle','','string'),(285,29,'en','abstract','','string'),(286,29,'fr_CA','abstract','','string'),(287,29,'','datePublished',NULL,'string'),(288,29,'','pages','','string'),(289,29,'','isPageEnabled','0','bool'),(290,29,'','licenseUrl',NULL,'string'),(291,30,'en','title','Chapter 3: Leadership Strategies for Coordinating Distance Education Instructional Development Teams','string'),(292,30,'fr_CA','title','','string'),(293,30,'en','subtitle','','string'),(294,30,'fr_CA','subtitle','','string'),(295,30,'en','abstract','','string'),(296,30,'fr_CA','abstract','','string'),(297,30,'','datePublished',NULL,'string'),(298,30,'','pages','','string'),(299,30,'','isPageEnabled','0','bool'),(300,30,'','licenseUrl',NULL,'string'),(301,31,'en','title','Chapter 4: Toward New Models of Flexible Education to Enhance Quality in Australian Higher Education','string'),(302,31,'fr_CA','title','','string'),(303,31,'en','subtitle','','string'),(304,31,'fr_CA','subtitle','','string'),(305,31,'en','abstract','','string'),(306,31,'fr_CA','abstract','','string'),(307,31,'','datePublished',NULL,'string'),(308,31,'','pages','','string'),(309,31,'','isPageEnabled','0','bool'),(310,31,'','licenseUrl',NULL,'string'),(311,32,'en','title','Internet, openness and the future of the information society in LAC','string'),(312,32,'fr_CA','title','','string'),(313,32,'en','subtitle','','string'),(314,32,'fr_CA','subtitle','','string'),(315,32,'en','abstract','','string'),(316,32,'fr_CA','abstract','','string'),(317,32,'','datePublished',NULL,'string'),(318,32,'','pages','','string'),(319,32,'','isPageEnabled','0','bool'),(320,32,'','licenseUrl',NULL,'string'),(321,33,'en','title','Imagining the Internet: Open, closed or in between?','string'),(322,33,'fr_CA','title','','string'),(323,33,'en','subtitle','','string'),(324,33,'fr_CA','subtitle','','string'),(325,33,'en','abstract','','string'),(326,33,'fr_CA','abstract','','string'),(327,33,'','datePublished',NULL,'string'),(328,33,'','pages','','string'),(329,33,'','isPageEnabled','0','bool'),(330,33,'','licenseUrl',NULL,'string'),(331,34,'en','title','The internet in LAC will remain free, public and open over the next 10 years','string'),(332,34,'fr_CA','title','','string'),(333,34,'en','subtitle','','string'),(334,34,'fr_CA','subtitle','','string'),(335,34,'en','abstract','','string'),(336,34,'fr_CA','abstract','','string'),(337,34,'','datePublished',NULL,'string'),(338,34,'','pages','','string'),(339,34,'','isPageEnabled','0','bool'),(340,34,'','licenseUrl',NULL,'string'),(341,35,'en','title','Free Internet?','string'),(342,35,'fr_CA','title','','string'),(343,35,'en','subtitle','','string'),(344,35,'fr_CA','subtitle','','string'),(345,35,'en','abstract','','string'),(346,35,'fr_CA','abstract','','string'),(347,35,'','datePublished',NULL,'string'),(348,35,'','pages','','string'),(349,35,'','isPageEnabled','0','bool'),(350,35,'','licenseUrl',NULL,'string'),(351,36,'en','title','Risks and challenges for freedom of expression on the internet','string'),(352,36,'fr_CA','title','','string'),(353,36,'en','subtitle','','string'),(354,36,'fr_CA','subtitle','','string'),(355,36,'en','abstract','','string'),(356,36,'fr_CA','abstract','','string'),(357,36,'','datePublished',NULL,'string'),(358,36,'','pages','','string'),(359,36,'','isPageEnabled','0','bool'),(360,36,'','licenseUrl',NULL,'string'),(361,37,'en','title','Introduction','string'),(362,37,'fr_CA','title','','string'),(363,37,'en','subtitle','','string'),(364,37,'fr_CA','subtitle','','string'),(365,37,'en','abstract','','string'),(366,37,'fr_CA','abstract','','string'),(367,37,'','datePublished',NULL,'string'),(368,37,'','pages','','string'),(369,37,'','isPageEnabled','0','bool'),(370,37,'','licenseUrl',NULL,'string'),(371,38,'en','title','CHAPTER ONE: Where the Buffalo Roamed','string'),(372,38,'fr_CA','title','','string'),(373,38,'en','subtitle','','string'),(374,38,'fr_CA','subtitle','','string'),(375,38,'en','abstract','','string'),(376,38,'fr_CA','abstract','','string'),(377,38,'','datePublished',NULL,'string'),(378,38,'','pages','','string'),(379,38,'','isPageEnabled','0','bool'),(380,38,'','licenseUrl',NULL,'string'),(381,39,'en','title','CHAPTER TWO: Bison Conservation and Buffalo National Park','string'),(382,39,'fr_CA','title','','string'),(383,39,'en','subtitle','','string'),(384,39,'fr_CA','subtitle','','string'),(385,39,'en','abstract','','string'),(386,39,'fr_CA','abstract','','string'),(387,39,'','datePublished',NULL,'string'),(388,39,'','pages','','string'),(389,39,'','isPageEnabled','0','bool'),(390,39,'','licenseUrl',NULL,'string'),(391,40,'en','title','CHAPTER THREE: A Well-Run Ranch','string'),(392,40,'fr_CA','title','','string'),(393,40,'en','subtitle','','string'),(394,40,'fr_CA','subtitle','','string'),(395,40,'en','abstract','','string'),(396,40,'fr_CA','abstract','','string'),(397,40,'','datePublished',NULL,'string'),(398,40,'','pages','','string'),(399,40,'','isPageEnabled','0','bool'),(400,40,'','licenseUrl',NULL,'string'),(401,41,'en','title','CHAPTER FOUR: Zookeepers and Animal Breeders','string'),(402,41,'fr_CA','title','','string'),(403,41,'en','subtitle','','string'),(404,41,'fr_CA','subtitle','','string'),(405,41,'en','abstract','','string'),(406,41,'fr_CA','abstract','','string'),(407,41,'','datePublished',NULL,'string'),(408,41,'','pages','','string'),(409,41,'','isPageEnabled','0','bool'),(410,41,'','licenseUrl',NULL,'string'),(411,42,'en','title','CHAPTER FIVE: \"Evolving the Arctic Cow\"','string'),(412,42,'fr_CA','title','','string'),(413,42,'en','subtitle','','string'),(414,42,'fr_CA','subtitle','','string'),(415,42,'en','abstract','','string'),(416,42,'fr_CA','abstract','','string'),(417,42,'','datePublished',NULL,'string'),(418,42,'','pages','','string'),(419,42,'','isPageEnabled','0','bool'),(420,42,'','licenseUrl',NULL,'string'),(421,43,'en','title','CONCLUSION: The Forgotten Park','string'),(422,43,'fr_CA','title','','string'),(423,43,'en','subtitle','','string'),(424,43,'fr_CA','subtitle','','string'),(425,43,'en','abstract','','string'),(426,43,'fr_CA','abstract','','string'),(427,43,'','datePublished',NULL,'string'),(428,43,'','pages','','string'),(429,43,'','isPageEnabled','0','bool'),(430,43,'','licenseUrl',NULL,'string'),(431,44,'en','title','Bibliography','string'),(432,44,'fr_CA','title','','string'),(433,44,'en','subtitle','','string'),(434,44,'fr_CA','subtitle','','string'),(435,44,'en','abstract','','string'),(436,44,'fr_CA','abstract','','string'),(437,44,'','datePublished',NULL,'string'),(438,44,'','pages','','string'),(439,44,'','isPageEnabled','0','bool'),(440,44,'','licenseUrl',NULL,'string'),(441,45,'en','title','Index','string'),(442,45,'fr_CA','title','','string'),(443,45,'en','subtitle','','string'),(444,45,'fr_CA','subtitle','','string'),(445,45,'en','abstract','','string'),(446,45,'fr_CA','abstract','','string'),(447,45,'','datePublished',NULL,'string'),(448,45,'','pages','','string'),(449,45,'','isPageEnabled','0','bool'),(450,45,'','licenseUrl',NULL,'string'),(451,46,'en','title','Introduction','string'),(452,46,'fr_CA','title','','string'),(453,46,'en','subtitle','','string'),(454,46,'fr_CA','subtitle','','string'),(455,46,'en','abstract','','string'),(456,46,'fr_CA','abstract','','string'),(457,46,'','datePublished',NULL,'string'),(458,46,'','pages','','string'),(459,46,'','isPageEnabled','0','bool'),(460,46,'','licenseUrl',NULL,'string'),(461,47,'en','title','Poems','string'),(462,47,'fr_CA','title','','string'),(463,47,'en','subtitle','','string'),(464,47,'fr_CA','subtitle','','string'),(465,47,'en','abstract','','string'),(466,47,'fr_CA','abstract','','string'),(467,47,'','datePublished',NULL,'string'),(468,47,'','pages','','string'),(469,47,'','isPageEnabled','0','bool'),(470,47,'','licenseUrl',NULL,'string'),(471,48,'en','title','Catalyzing Access through Social and Technical Innovation','string'),(472,48,'fr_CA','title','','string'),(473,48,'en','subtitle','','string'),(474,48,'fr_CA','subtitle','','string'),(475,48,'en','abstract','','string'),(476,48,'fr_CA','abstract','','string'),(477,48,'','datePublished',NULL,'string'),(478,48,'','pages','','string'),(479,48,'','isPageEnabled','0','bool'),(480,48,'','licenseUrl',NULL,'string'),(481,49,'en','title','Catalyzing Access via Telecommunications Policy','string'),(482,49,'fr_CA','title','','string'),(483,49,'en','subtitle','','string'),(484,49,'fr_CA','subtitle','','string'),(485,49,'en','abstract','','string'),(486,49,'fr_CA','abstract','','string'),(487,49,'','datePublished',NULL,'string'),(488,49,'','pages','','string'),(489,49,'','isPageEnabled','0','bool'),(490,49,'','licenseUrl',NULL,'string'),(491,50,'en','title','Access to Knowledge as a New Paradigm for Research on ICTs and Intellectual Property','string'),(492,50,'fr_CA','title','','string'),(493,50,'en','subtitle','','string'),(494,50,'fr_CA','subtitle','','string'),(495,50,'en','abstract','','string'),(496,50,'fr_CA','abstract','','string'),(497,50,'','datePublished',NULL,'string'),(498,50,'','pages','','string'),(499,50,'','isPageEnabled','0','bool'),(500,50,'','licenseUrl',NULL,'string'),(501,51,'en','title','Current State of Mobile Learning','string'),(502,51,'fr_CA','title','','string'),(503,51,'en','subtitle','','string'),(504,51,'fr_CA','subtitle','','string'),(505,51,'en','abstract','','string'),(506,51,'fr_CA','abstract','','string'),(507,51,'','datePublished',NULL,'string'),(508,51,'','pages','','string'),(509,51,'','isPageEnabled','0','bool'),(510,51,'','licenseUrl',NULL,'string'),(511,52,'en','title','A Model for Framing Mobile Learning','string'),(512,52,'fr_CA','title','','string'),(513,52,'en','subtitle','','string'),(514,52,'fr_CA','subtitle','','string'),(515,52,'en','abstract','','string'),(516,52,'fr_CA','abstract','','string'),(517,52,'','datePublished',NULL,'string'),(518,52,'','pages','','string'),(519,52,'','isPageEnabled','0','bool'),(520,52,'','licenseUrl',NULL,'string'),(521,53,'en','title','Mobile Distance Learning with PDAs: Development and Testing of Pedagogical and System Solutions Supporting Mobile Distance Learners','string'),(522,53,'fr_CA','title','','string'),(523,53,'en','subtitle','','string'),(524,53,'fr_CA','subtitle','','string'),(525,53,'en','abstract','','string'),(526,53,'fr_CA','abstract','','string'),(527,53,'','datePublished',NULL,'string'),(528,53,'','pages','','string'),(529,53,'','isPageEnabled','0','bool'),(530,53,'','licenseUrl',NULL,'string'),(531,54,'en','title','Chapter 1: Mind Control—Internal or External?','string'),(532,54,'fr_CA','title','','string'),(533,54,'en','subtitle','','string'),(534,54,'fr_CA','subtitle','','string'),(535,54,'en','abstract','','string'),(536,54,'fr_CA','abstract','','string'),(537,54,'','datePublished',NULL,'string'),(538,54,'','pages','','string'),(539,54,'','isPageEnabled','1','bool'),(540,54,'','licenseUrl',NULL,'string'),(541,55,'en','title','Chapter 2: Classical Music and the Classical Mind','string'),(542,55,'fr_CA','title','','string'),(543,55,'en','subtitle','','string'),(544,55,'fr_CA','subtitle','','string'),(545,55,'en','abstract','','string'),(546,55,'fr_CA','abstract','','string'),(547,55,'','datePublished',NULL,'string'),(548,55,'','pages','','string'),(549,55,'','isPageEnabled','0','bool'),(550,55,'','licenseUrl',NULL,'string'),(551,56,'en','title','Chapter 3: Situated Cognition and Bricolage','string'),(552,56,'fr_CA','title','','string'),(553,56,'en','subtitle','','string'),(554,56,'fr_CA','subtitle','','string'),(555,56,'en','abstract','','string'),(556,56,'fr_CA','abstract','','string'),(557,56,'','datePublished',NULL,'string'),(558,56,'','pages','','string'),(559,56,'','isPageEnabled','0','bool'),(560,56,'','licenseUrl',NULL,'string'),(561,57,'en','title','Chapter 4: Braitenberg’s Vehicle 2','string'),(562,57,'fr_CA','title','','string'),(563,57,'en','subtitle','','string'),(564,57,'fr_CA','subtitle','','string'),(565,57,'en','abstract','','string'),(566,57,'fr_CA','abstract','','string'),(567,57,'','datePublished',NULL,'string'),(568,57,'','pages','','string'),(569,57,'','isPageEnabled','0','bool'),(570,57,'','licenseUrl',NULL,'string'),(571,58,'en','title','Setting the Stage','string'),(572,58,'fr_CA','title','','string'),(573,58,'en','subtitle','','string'),(574,58,'fr_CA','subtitle','','string'),(575,58,'en','abstract','','string'),(576,58,'fr_CA','abstract','','string'),(577,58,'','datePublished',NULL,'string'),(578,58,'','pages','','string'),(579,58,'','isPageEnabled','0','bool'),(580,58,'','licenseUrl',NULL,'string'),(581,59,'en','title','Going It Alone, 1945-1954','string'),(582,59,'fr_CA','title','','string'),(583,59,'en','subtitle','','string'),(584,59,'fr_CA','subtitle','','string'),(585,59,'en','abstract','','string'),(586,59,'fr_CA','abstract','','string'),(587,59,'','datePublished',NULL,'string'),(588,59,'','pages','','string'),(589,59,'','isPageEnabled','0','bool'),(590,59,'','licenseUrl',NULL,'string'),(591,60,'en','title','Establishing the Pattern, 1955-1962','string'),(592,60,'fr_CA','title','','string'),(593,60,'en','subtitle','','string'),(594,60,'fr_CA','subtitle','','string'),(595,60,'en','abstract','','string'),(596,60,'fr_CA','abstract','','string'),(597,60,'','datePublished',NULL,'string'),(598,60,'','pages','','string'),(599,60,'','isPageEnabled','0','bool'),(600,60,'','licenseUrl',NULL,'string'),(601,61,'en','title','Foreward','string'),(602,61,'fr_CA','title','','string'),(603,61,'en','subtitle','','string'),(604,61,'fr_CA','subtitle','','string'),(605,61,'en','abstract','','string'),(606,61,'fr_CA','abstract','','string'),(607,61,'','datePublished',NULL,'string'),(608,61,'','pages','','string'),(609,61,'','isPageEnabled','0','bool'),(610,61,'','licenseUrl',NULL,'string'),(611,62,'en','title','Preface','string'),(612,62,'fr_CA','title','','string'),(613,62,'en','subtitle','','string'),(614,62,'fr_CA','subtitle','','string'),(615,62,'en','abstract','','string'),(616,62,'fr_CA','abstract','','string'),(617,62,'','datePublished',NULL,'string'),(618,62,'','pages','','string'),(619,62,'','isPageEnabled','0','bool'),(620,62,'','licenseUrl',NULL,'string'),(621,63,'en','title','The Case Studies','string'),(622,63,'fr_CA','title','','string'),(623,63,'en','subtitle','','string'),(624,63,'fr_CA','subtitle','','string'),(625,63,'en','abstract','','string'),(626,63,'fr_CA','abstract','','string'),(627,63,'','datePublished',NULL,'string'),(628,63,'','pages','','string'),(629,63,'','isPageEnabled','0','bool'),(630,63,'','licenseUrl',NULL,'string'),(631,64,'en','title','Conclusion','string'),(632,64,'fr_CA','title','','string'),(633,64,'en','subtitle','','string'),(634,64,'fr_CA','subtitle','','string'),(635,64,'en','abstract','','string'),(636,64,'fr_CA','abstract','','string'),(637,64,'','datePublished',NULL,'string'),(638,64,'','pages','','string'),(639,64,'','isPageEnabled','0','bool'),(640,64,'','licenseUrl',NULL,'string'),(641,65,'en','title','Bibliography','string'),(642,65,'fr_CA','title','','string'),(643,65,'en','subtitle','','string'),(644,65,'fr_CA','subtitle','','string'),(645,65,'en','abstract','','string'),(646,65,'fr_CA','abstract','','string'),(647,65,'','datePublished',NULL,'string'),(648,65,'','pages','','string'),(649,65,'','isPageEnabled','0','bool'),(650,65,'','licenseUrl',NULL,'string'),(651,66,'en','title','Preface','string'),(652,66,'fr_CA','title','','string'),(653,66,'en','subtitle','','string'),(654,66,'fr_CA','subtitle','','string'),(655,66,'en','abstract','','string'),(656,66,'fr_CA','abstract','','string'),(657,66,'','datePublished',NULL,'string'),(658,66,'','pages','','string'),(659,66,'','isPageEnabled','0','bool'),(660,66,'','licenseUrl',NULL,'string'),(661,67,'en','title','Introduction','string'),(662,67,'fr_CA','title','','string'),(663,67,'en','subtitle','','string'),(664,67,'fr_CA','subtitle','','string'),(665,67,'en','abstract','','string'),(666,67,'fr_CA','abstract','','string'),(667,67,'','datePublished',NULL,'string'),(668,67,'','pages','','string'),(669,67,'','isPageEnabled','0','bool'),(670,67,'','licenseUrl',NULL,'string'),(671,68,'en','title','The Emergence of Open Development in a Network Society','string'),(672,68,'fr_CA','title','','string'),(673,68,'en','subtitle','','string'),(674,68,'fr_CA','subtitle','','string'),(675,68,'en','abstract','','string'),(676,68,'fr_CA','abstract','','string'),(677,68,'','datePublished',NULL,'string'),(678,68,'','pages','','string'),(679,68,'','isPageEnabled','0','bool'),(680,68,'','licenseUrl',NULL,'string'),(681,69,'en','title','Enacting Openness in ICT4D Research','string'),(682,69,'fr_CA','title','','string'),(683,69,'en','subtitle','','string'),(684,69,'fr_CA','subtitle','','string'),(685,69,'en','abstract','','string'),(686,69,'fr_CA','abstract','','string'),(687,69,'','datePublished',NULL,'string'),(688,69,'','pages','','string'),(689,69,'','isPageEnabled','0','bool'),(690,69,'','licenseUrl',NULL,'string'),(691,70,'en','title','Transparency and Development: Ethical Consumption through Web 2.0 and the Internet of Things','string'),(692,70,'fr_CA','title','','string'),(693,70,'en','subtitle','','string'),(694,70,'fr_CA','subtitle','','string'),(695,70,'en','abstract','','string'),(696,70,'fr_CA','abstract','','string'),(697,70,'','datePublished',NULL,'string'),(698,70,'','pages','','string'),(699,70,'','isPageEnabled','0','bool'),(700,70,'','licenseUrl',NULL,'string'),(701,71,'en','title','Open Educational Resources: Opportunities and Challenges for the Developing World','string'),(702,71,'fr_CA','title','','string'),(703,71,'en','subtitle','','string'),(704,71,'fr_CA','subtitle','','string'),(705,71,'en','abstract','','string'),(706,71,'fr_CA','abstract','','string'),(707,71,'','datePublished',NULL,'string'),(708,71,'','pages','','string'),(709,71,'','isPageEnabled','0','bool'),(710,71,'','licenseUrl',NULL,'string');
/*!40000 ALTER TABLE `submission_chapter_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_chapters`
--

DROP TABLE IF EXISTS `submission_chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_chapters` (
  `chapter_id` bigint NOT NULL AUTO_INCREMENT,
  `primary_contact_id` bigint DEFAULT NULL,
  `publication_id` bigint NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  `source_chapter_id` bigint DEFAULT NULL,
  `doi_id` bigint DEFAULT NULL,
  PRIMARY KEY (`chapter_id`),
  KEY `chapters_chapter_id` (`chapter_id`),
  KEY `submission_chapters_primary_contact_id` (`primary_contact_id`),
  KEY `submission_chapters_publication_id` (`publication_id`),
  KEY `submission_chapters_source_chapter_id` (`source_chapter_id`),
  KEY `submission_chapters_doi_id_foreign` (`doi_id`),
  CONSTRAINT `submission_chapters_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `submission_chapters_primary_contact_id_foreign` FOREIGN KEY (`primary_contact_id`) REFERENCES `authors` (`author_id`) ON DELETE SET NULL,
  CONSTRAINT `submission_chapters_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_chapters_source_chapter_id_foreign` FOREIGN KEY (`source_chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3 COMMENT='A list of chapters for each submission (when submissions are divided into chapters).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_chapters`
--

LOCK TABLES `submission_chapters` WRITE;
/*!40000 ALTER TABLE `submission_chapters` DISABLE KEYS */;
INSERT INTO `submission_chapters` VALUES (1,NULL,1,1.00,1,NULL),(2,NULL,1,2.00,2,NULL),(3,NULL,1,3.00,3,NULL),(4,NULL,2,1.00,4,NULL),(5,NULL,2,2.00,5,NULL),(6,NULL,2,3.00,6,NULL),(7,NULL,2,4.00,7,NULL),(8,NULL,3,1.00,8,NULL),(9,NULL,3,2.00,9,NULL),(10,NULL,3,3.00,10,NULL),(11,NULL,3,4.00,11,NULL),(12,NULL,3,5.00,12,NULL),(13,NULL,4,1.00,13,NULL),(14,NULL,4,2.00,14,NULL),(15,NULL,4,3.00,15,NULL),(16,NULL,4,4.00,16,NULL),(17,NULL,5,1.00,17,NULL),(18,NULL,5,2.00,18,NULL),(19,NULL,5,3.00,19,NULL),(20,NULL,5,4.00,20,NULL),(21,NULL,5,5.00,21,NULL),(22,NULL,5,6.00,22,NULL),(23,NULL,6,1.00,23,NULL),(24,NULL,6,2.00,24,NULL),(25,NULL,6,3.00,25,NULL),(26,NULL,6,4.00,26,NULL),(27,NULL,7,1.00,27,NULL),(28,NULL,7,2.00,28,NULL),(29,NULL,7,3.00,29,NULL),(30,NULL,7,4.00,30,NULL),(31,NULL,7,5.00,31,NULL),(32,NULL,9,1.00,32,NULL),(33,NULL,9,2.00,33,NULL),(34,NULL,9,3.00,34,NULL),(35,NULL,9,4.00,35,NULL),(36,NULL,9,5.00,36,NULL),(37,NULL,10,1.00,37,NULL),(38,NULL,10,2.00,38,NULL),(39,NULL,10,3.00,39,NULL),(40,NULL,10,4.00,40,NULL),(41,NULL,10,5.00,41,NULL),(42,NULL,10,6.00,42,NULL),(43,NULL,10,7.00,43,NULL),(44,NULL,10,8.00,44,NULL),(45,NULL,10,9.00,45,NULL),(46,NULL,11,1.00,46,NULL),(47,NULL,11,2.00,47,NULL),(48,NULL,12,1.00,48,NULL),(49,NULL,12,2.00,49,NULL),(50,NULL,12,3.00,50,NULL),(51,NULL,13,1.00,51,NULL),(52,NULL,13,2.00,52,NULL),(53,NULL,13,3.00,53,NULL),(54,NULL,14,1.00,54,NULL),(55,NULL,14,2.00,55,NULL),(56,NULL,14,3.00,56,NULL),(57,NULL,14,4.00,57,NULL),(58,NULL,15,1.00,58,NULL),(59,NULL,15,2.00,59,NULL),(60,NULL,15,3.00,60,NULL),(61,NULL,16,1.00,61,NULL),(62,NULL,16,2.00,62,NULL),(63,NULL,16,3.00,63,NULL),(64,NULL,16,4.00,64,NULL),(65,NULL,16,5.00,65,NULL),(66,NULL,17,1.00,66,NULL),(67,NULL,17,2.00,67,NULL),(68,NULL,17,3.00,68,NULL),(69,NULL,17,4.00,69,NULL),(70,NULL,17,5.00,70,NULL),(71,NULL,17,6.00,71,NULL);
/*!40000 ALTER TABLE `submission_chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_comments`
--

DROP TABLE IF EXISTS `submission_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_comments` (
  `comment_id` bigint NOT NULL AUTO_INCREMENT,
  `comment_type` bigint DEFAULT NULL,
  `role_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `author_id` bigint NOT NULL,
  `comment_title` text NOT NULL,
  `comments` text,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` smallint DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `submission_comments_submission_id` (`submission_id`),
  KEY `submission_comments_author_id` (`author_id`),
  CONSTRAINT `submission_comments_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_comments_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='Comments on a submission, e.g. peer review comments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_comments`
--

LOCK TABLES `submission_comments` WRITE;
/*!40000 ALTER TABLE `submission_comments` DISABLE KEYS */;
INSERT INTO `submission_comments` VALUES (1,1,4096,11,10,10,'','<p>I recommend that the author revise this submission.</p>','2025-12-17 05:29:31',NULL,1),(2,1,4096,11,11,12,'','<p>I recommend that the author resubmit this submission.</p>','2025-12-17 05:29:39',NULL,1),(3,1,4096,12,13,8,'','<p>I recommend declining this submission.</p>','2025-12-17 05:30:52',NULL,1),(4,1,4096,13,16,10,'','<p>I recommend requiring revisions.</p>','2025-12-17 05:31:59',NULL,1),(5,1,4096,13,18,12,'','<p>I recommend resubmitting.</p>','2025-12-17 05:32:07',NULL,1),(6,1,4096,16,21,10,'','<p>I recommend that the author revise this submission.</p>','2025-12-17 05:36:02',NULL,1);
/*!40000 ALTER TABLE `submission_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_revisions`
--

DROP TABLE IF EXISTS `submission_file_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_file_revisions` (
  `revision_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_file_id` bigint unsigned NOT NULL,
  `file_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`revision_id`),
  KEY `submission_file_revisions_submission_file_id` (`submission_file_id`),
  KEY `submission_file_revisions_file_id` (`file_id`),
  CONSTRAINT `submission_file_revisions_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_file_revisions_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb3 COMMENT='Revisions map submission_file entries to files on the data store.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_revisions`
--

LOCK TABLES `submission_file_revisions` WRITE;
/*!40000 ALTER TABLE `submission_file_revisions` DISABLE KEYS */;
INSERT INTO `submission_file_revisions` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,3),(5,5,1),(6,6,2),(7,7,4),(8,8,5),(9,9,6),(10,10,7),(12,12,7),(13,13,6),(14,14,5),(15,15,4),(16,16,9),(17,17,10),(18,18,11),(19,19,12),(20,20,13),(21,21,14),(22,22,15),(23,23,16),(24,24,17),(25,25,17),(26,26,15),(27,27,16),(28,28,14),(29,29,18),(30,30,19),(31,31,20),(32,32,21),(33,33,22),(34,34,23),(35,35,23),(36,36,21),(37,37,22),(38,38,20),(39,39,19),(40,40,18),(41,41,23),(42,42,24),(43,43,25),(44,44,26),(45,45,27),(46,46,26),(47,47,27),(48,48,25),(49,49,24),(50,50,28),(51,51,29),(52,52,30),(53,53,31),(54,54,32),(55,55,32),(56,56,31),(57,57,30),(58,58,29),(59,59,28),(60,60,33),(61,61,34),(62,62,35),(63,63,36),(64,64,37),(65,65,38),(66,66,38),(67,67,37),(68,68,36),(69,69,35),(70,70,34),(71,71,39),(72,72,40),(73,73,41),(74,74,42),(75,75,43),(76,76,44),(77,77,45),(78,78,46),(79,79,47),(80,80,48),(81,81,49),(82,82,49),(83,83,48),(84,84,50),(85,85,51),(86,86,52),(87,87,52),(88,88,51),(89,89,50),(90,90,53),(91,91,54),(92,92,55),(93,93,55),(94,94,54),(95,95,53),(96,96,56),(97,97,57),(98,98,58),(99,99,59),(100,100,60),(101,101,61),(102,102,61),(103,103,60),(104,104,59),(105,105,57),(106,106,58),(107,107,56),(108,108,61),(109,109,60),(110,110,59),(111,111,57),(112,112,58),(113,113,56),(114,114,62),(115,115,63),(116,116,64),(117,117,64),(118,118,63),(119,119,62),(120,120,65),(121,121,66),(122,122,67),(123,123,68),(124,124,69),(125,125,68),(126,126,69),(127,127,67),(128,128,66),(129,129,65),(130,130,70),(131,131,71),(132,132,72),(133,133,73),(134,134,74),(135,135,75),(136,136,75),(137,137,74),(138,138,73),(139,139,72),(140,140,70),(141,141,71);
/*!40000 ALTER TABLE `submission_file_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_settings`
--

DROP TABLE IF EXISTS `submission_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_file_settings` (
  `submission_file_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_file_id` bigint unsigned NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`submission_file_setting_id`),
  UNIQUE KEY `submission_file_settings_unique` (`submission_file_id`,`locale`,`setting_name`),
  KEY `submission_file_settings_submission_file_id` (`submission_file_id`),
  CONSTRAINT `submission_file_settings_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8mb3 COMMENT='Localized data about submission files like published metadata.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_settings`
--

LOCK TABLES `submission_file_settings` WRITE;
/*!40000 ALTER TABLE `submission_file_settings` DISABLE KEYS */;
INSERT INTO `submission_file_settings` VALUES (1,1,'en','name','chapter1.pdf'),(2,2,'en','name','chapter2.pdf'),(3,3,'en','name','chapter3.pdf'),(4,1,'','chapterId','1'),(5,2,'','chapterId','2'),(6,3,'','chapterId','3'),(7,4,'en','name','chapter3.pdf'),(8,4,'','chapterId','3'),(9,5,'en','name','chapter1.pdf'),(10,5,'','chapterId','1'),(11,6,'en','name','chapter2.pdf'),(12,6,'','chapterId','2'),(13,7,'en','name','chapter1.pdf'),(14,8,'en','name','chapter2.pdf'),(15,9,'en','name','chapter3.pdf'),(16,10,'en','name','chapter4.pdf'),(18,7,'','chapterId','4'),(19,8,'','chapterId','5'),(20,9,'','chapterId','6'),(21,10,'','chapterId','7'),(22,12,'en','name','chapter4.pdf'),(23,12,'','chapterId','7'),(24,13,'en','name','chapter3.pdf'),(25,13,'','chapterId','6'),(26,14,'en','name','chapter2.pdf'),(27,14,'','chapterId','5'),(28,15,'en','name','chapter1.pdf'),(29,15,'','chapterId','4'),(30,16,'en','name','chapter1.pdf'),(31,17,'en','name','chapter2.pdf'),(32,18,'en','name','chapter3.pdf'),(33,19,'en','name','chapter4.pdf'),(34,20,'en','name','chapter5.pdf'),(35,16,'','chapterId','8'),(36,17,'','chapterId','9'),(37,18,'','chapterId','10'),(38,19,'','chapterId','11'),(39,20,'','chapterId','12'),(40,21,'en','name','chapter1.pdf'),(41,22,'en','name','chapter2.pdf'),(42,23,'en','name','chapter3.pdf'),(43,24,'en','name','intro.pdf'),(44,24,'','chapterId','13'),(45,21,'','chapterId','14'),(46,22,'','chapterId','15'),(47,23,'','chapterId','16'),(48,25,'en','name','intro.pdf'),(49,25,'','chapterId','13'),(50,26,'en','name','chapter2.pdf'),(51,26,'','chapterId','15'),(52,27,'en','name','chapter3.pdf'),(53,27,'','chapterId','16'),(54,28,'en','name','chapter1.pdf'),(55,28,'','chapterId','14'),(56,29,'en','name','prologue.pdf'),(57,30,'en','name','chapter1.pdf'),(58,31,'en','name','chapter2.pdf'),(59,32,'en','name','chapter3.pdf'),(60,33,'en','name','chapter4.pdf'),(61,34,'en','name','epilogue.pdf'),(62,29,'','chapterId','17'),(63,30,'','chapterId','18'),(64,31,'','chapterId','19'),(65,32,'','chapterId','20'),(66,33,'','chapterId','21'),(67,34,'','chapterId','22'),(68,35,'en','name','epilogue.pdf'),(69,35,'','chapterId','22'),(70,36,'en','name','chapter3.pdf'),(71,36,'','chapterId','20'),(72,37,'en','name','chapter4.pdf'),(73,37,'','chapterId','21'),(74,38,'en','name','chapter2.pdf'),(75,38,'','chapterId','19'),(76,39,'en','name','chapter1.pdf'),(77,39,'','chapterId','18'),(78,40,'en','name','prologue.pdf'),(79,40,'','chapterId','17'),(80,41,'en','name','epilogue.pdf'),(81,41,'','chapterId','22'),(82,42,'en','name','chapter1.pdf'),(83,43,'en','name','chapter2.pdf'),(84,44,'en','name','chapter3.pdf'),(85,45,'en','name','chapter4.pdf'),(86,42,'','chapterId','23'),(87,43,'','chapterId','24'),(88,44,'','chapterId','25'),(89,45,'','chapterId','26'),(90,46,'en','name','chapter3.pdf'),(91,46,'','chapterId','25'),(92,47,'en','name','chapter4.pdf'),(93,47,'','chapterId','26'),(94,48,'en','name','chapter2.pdf'),(95,48,'','chapterId','24'),(96,49,'en','name','chapter1.pdf'),(97,49,'','chapterId','23'),(98,50,'en','name','intro.pdf'),(99,51,'en','name','chapter1.pdf'),(100,52,'en','name','chapter2.pdf'),(101,53,'en','name','chapter3.pdf'),(102,54,'en','name','chapter4.pdf'),(103,50,'','chapterId','27'),(104,51,'','chapterId','28'),(105,52,'','chapterId','29'),(106,53,'','chapterId','30'),(107,54,'','chapterId','31'),(108,55,'en','name','chapter4.pdf'),(109,55,'','chapterId','31'),(110,56,'en','name','chapter3.pdf'),(111,56,'','chapterId','30'),(112,57,'en','name','chapter2.pdf'),(113,57,'','chapterId','29'),(114,58,'en','name','chapter1.pdf'),(115,58,'','chapterId','28'),(116,59,'en','name','intro.pdf'),(117,59,'','chapterId','27'),(118,60,'en','name','note.pdf'),(119,61,'en','name','chapter1.pdf'),(120,62,'en','name','chapter2.pdf'),(121,63,'en','name','chapter3.pdf'),(122,64,'en','name','chapter4.pdf'),(123,65,'en','name','chapter5.pdf'),(124,61,'','chapterId','32'),(125,62,'','chapterId','33'),(126,63,'','chapterId','34'),(127,64,'','chapterId','35'),(128,65,'','chapterId','36'),(129,66,'en','name','chapter5.pdf'),(130,66,'','chapterId','36'),(131,67,'en','name','chapter4.pdf'),(132,67,'','chapterId','35'),(133,68,'en','name','chapter3.pdf'),(134,68,'','chapterId','34'),(135,69,'en','name','chapter2.pdf'),(136,69,'','chapterId','33'),(137,70,'en','name','chapter1.pdf'),(138,70,'','chapterId','32'),(139,71,'en','name','intro.pdf'),(140,72,'en','name','chapter1.pdf'),(141,73,'en','name','chapter2.pdf'),(142,74,'en','name','chapter3.pdf'),(143,75,'en','name','chapter4.pdf'),(144,76,'en','name','chapter5.pdf'),(145,77,'en','name','conclusion.pdf'),(146,78,'en','name','bibliography.pdf'),(147,79,'en','name','index.pdf'),(148,71,'','chapterId','37'),(149,72,'','chapterId','38'),(150,73,'','chapterId','39'),(151,74,'','chapterId','40'),(152,75,'','chapterId','41'),(153,76,'','chapterId','42'),(154,77,'','chapterId','43'),(155,78,'','chapterId','44'),(156,79,'','chapterId','45'),(157,80,'en','name','intro.pdf'),(158,81,'en','name','poems.pdf'),(159,80,'','chapterId','46'),(160,81,'','chapterId','47'),(161,82,'en','name','poems.pdf'),(162,82,'','chapterId','47'),(163,83,'en','name','intro.pdf'),(164,83,'','chapterId','46'),(165,84,'en','name','chapter1.pdf'),(166,85,'en','name','chapter2.pdf'),(167,86,'en','name','chapter3.pdf'),(168,84,'','chapterId','48'),(169,85,'','chapterId','49'),(170,86,'','chapterId','50'),(171,87,'en','name','chapter3.pdf'),(172,87,'','chapterId','50'),(173,88,'en','name','chapter2.pdf'),(174,88,'','chapterId','49'),(175,89,'en','name','chapter1.pdf'),(176,89,'','chapterId','48'),(177,90,'en','name','chapter1.pdf'),(178,91,'en','name','chapter2.pdf'),(179,92,'en','name','chapter3.pdf'),(180,90,'','chapterId','51'),(181,91,'','chapterId','52'),(182,92,'','chapterId','53'),(183,93,'en','name','chapter3.pdf'),(184,93,'','chapterId','53'),(185,94,'en','name','chapter2.pdf'),(186,94,'','chapterId','52'),(187,95,'en','name','chapter1.pdf'),(188,95,'','chapterId','51'),(189,96,'en','name','chapter1.pdf'),(190,97,'en','name','chapter2.pdf'),(191,98,'en','name','chapter3.pdf'),(192,99,'en','name','chapter4.pdf'),(193,100,'en','name','Segmentation of Vascular Ultrasound Imag.pdf'),(194,101,'en','name','The Canadian Nutrient File: Nutrient Val.pdf'),(196,96,'','chapterId','54'),(197,97,'','chapterId','55'),(198,98,'','chapterId','56'),(199,99,'','chapterId','57'),(200,102,'en','name','The Canadian Nutrient File: Nutrient Val.pdf'),(201,103,'en','name','Segmentation of Vascular Ultrasound Imag.pdf'),(202,104,'en','name','chapter4.pdf'),(203,104,'','chapterId','57'),(204,105,'en','name','chapter2.pdf'),(205,105,'','chapterId','55'),(206,106,'en','name','chapter3.pdf'),(207,106,'','chapterId','56'),(208,107,'en','name','chapter1.pdf'),(209,107,'','chapterId','54'),(210,108,'en','name','The Canadian Nutrient File: Nutrient Val.pdf'),(211,109,'en','name','Segmentation of Vascular Ultrasound Imag.pdf'),(212,110,'en','name','chapter4.pdf'),(213,110,'','chapterId','57'),(214,111,'en','name','chapter2.pdf'),(215,111,'','chapterId','55'),(216,112,'en','name','chapter3.pdf'),(217,112,'','chapterId','56'),(218,113,'en','name','chapter1.pdf'),(219,113,'','chapterId','54'),(220,114,'en','name','chapter1.pdf'),(221,115,'en','name','chapter2.pdf'),(222,116,'en','name','chapter3.pdf'),(223,114,'','chapterId','58'),(224,115,'','chapterId','59'),(225,116,'','chapterId','60'),(226,117,'en','name','chapter3.pdf'),(227,117,'','chapterId','60'),(228,118,'en','name','chapter2.pdf'),(229,118,'','chapterId','59'),(230,119,'en','name','chapter1.pdf'),(231,119,'','chapterId','58'),(232,120,'en','name','foreward.pdf'),(233,121,'en','name','preface.pdf'),(234,122,'en','name','cases.pdf'),(235,123,'en','name','conclusion.pdf'),(236,124,'en','name','bibliography.pdf'),(237,120,'','chapterId','61'),(238,121,'','chapterId','62'),(239,122,'','chapterId','63'),(240,123,'','chapterId','64'),(241,124,'','chapterId','65'),(242,125,'en','name','conclusion.pdf'),(243,125,'','chapterId','64'),(244,126,'en','name','bibliography.pdf'),(245,126,'','chapterId','65'),(246,127,'en','name','cases.pdf'),(247,127,'','chapterId','63'),(248,128,'en','name','preface.pdf'),(249,128,'','chapterId','62'),(250,129,'en','name','foreward.pdf'),(251,129,'','chapterId','61'),(252,130,'en','name','preface.pdf'),(253,131,'en','name','introduction.pdf'),(254,132,'en','name','chapter1.pdf'),(255,133,'en','name','chapter2.pdf'),(256,134,'en','name','chapter3.pdf'),(257,135,'en','name','chapter4.pdf'),(258,130,'','chapterId','66'),(259,131,'','chapterId','67'),(260,132,'','chapterId','68'),(261,133,'','chapterId','69'),(262,134,'','chapterId','70'),(263,135,'','chapterId','71'),(264,136,'en','name','chapter4.pdf'),(265,136,'','chapterId','71'),(266,137,'en','name','chapter3.pdf'),(267,137,'','chapterId','70'),(268,138,'en','name','chapter2.pdf'),(269,138,'','chapterId','69'),(270,139,'en','name','chapter1.pdf'),(271,139,'','chapterId','68'),(272,140,'en','name','preface.pdf'),(273,140,'','chapterId','66'),(274,141,'en','name','introduction.pdf'),(275,141,'','chapterId','67');
/*!40000 ALTER TABLE `submission_file_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_files`
--

DROP TABLE IF EXISTS `submission_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_files` (
  `submission_file_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `file_id` bigint unsigned NOT NULL,
  `source_submission_file_id` bigint unsigned DEFAULT NULL,
  `genre_id` bigint DEFAULT NULL,
  `file_stage` bigint NOT NULL,
  `direct_sales_price` varchar(255) DEFAULT NULL,
  `sales_type` varchar(255) DEFAULT NULL,
  `viewable` smallint DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `uploader_user_id` bigint DEFAULT NULL,
  `assoc_type` bigint DEFAULT NULL,
  `assoc_id` bigint DEFAULT NULL,
  `doi_id` bigint DEFAULT NULL,
  PRIMARY KEY (`submission_file_id`),
  KEY `submission_files_submission_id` (`submission_id`),
  KEY `submission_files_file_id` (`file_id`),
  KEY `submission_files_genre_id` (`genre_id`),
  KEY `submission_files_uploader_user_id` (`uploader_user_id`),
  KEY `submission_files_stage_assoc` (`file_stage`,`assoc_type`,`assoc_id`),
  KEY `submission_files_source_submission_file_id` (`source_submission_file_id`),
  KEY `submission_files_doi_id` (`doi_id`),
  CONSTRAINT `submission_files_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `submission_files_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_files_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE SET NULL,
  CONSTRAINT `submission_files_source_submission_file_id_foreign` FOREIGN KEY (`source_submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_files_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_files_uploader_user_id_foreign` FOREIGN KEY (`uploader_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb3 COMMENT='All files associated with a submission, such as those uploaded during submission, as revisions, or by copyeditors or layout editors for production.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (1,1,1,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:18:26','2025-12-17 05:18:26',19,NULL,NULL,NULL),(2,1,2,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:18:26','2025-12-17 05:18:27',19,NULL,NULL,NULL),(3,1,3,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:18:27','2025-12-17 05:18:27',19,NULL,NULL,NULL),(4,1,3,3,3,4,NULL,NULL,NULL,'2025-12-17 05:18:48','2025-12-17 05:18:48',19,523,1,NULL),(5,1,1,1,3,4,NULL,NULL,NULL,'2025-12-17 05:18:48','2025-12-17 05:18:48',19,523,1,NULL),(6,1,2,2,3,4,NULL,NULL,NULL,'2025-12-17 05:18:48','2025-12-17 05:18:48',19,523,1,NULL),(7,2,4,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:19:18','2025-12-17 05:19:18',20,NULL,NULL,NULL),(8,2,5,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:19:19','2025-12-17 05:19:19',20,NULL,NULL,NULL),(9,2,6,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:19:20','2025-12-17 05:19:20',20,NULL,NULL,NULL),(10,2,7,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:19:21','2025-12-17 05:19:21',20,NULL,NULL,NULL),(12,2,7,10,3,4,NULL,NULL,NULL,'2025-12-17 05:20:38','2025-12-17 05:20:38',20,523,2,NULL),(13,2,6,9,3,4,NULL,NULL,NULL,'2025-12-17 05:20:38','2025-12-17 05:20:38',20,523,2,NULL),(14,2,5,8,3,4,NULL,NULL,NULL,'2025-12-17 05:20:38','2025-12-17 05:20:38',20,523,2,NULL),(15,2,4,7,3,4,NULL,NULL,NULL,'2025-12-17 05:20:38','2025-12-17 05:20:38',20,523,2,NULL),(16,3,9,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:21:01','2025-12-17 05:21:01',21,NULL,NULL,NULL),(17,3,10,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:21:02','2025-12-17 05:21:02',21,NULL,NULL,NULL),(18,3,11,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:21:02','2025-12-17 05:21:03',21,NULL,NULL,NULL),(19,3,12,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:21:03','2025-12-17 05:21:03',21,NULL,NULL,NULL),(20,3,13,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:21:04','2025-12-17 05:21:04',21,NULL,NULL,NULL),(21,4,14,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:21:37','2025-12-17 05:21:37',22,NULL,NULL,NULL),(22,4,15,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:21:38','2025-12-17 05:21:38',22,NULL,NULL,NULL),(23,4,16,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:21:38','2025-12-17 05:21:39',22,NULL,NULL,NULL),(24,4,17,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:21:39','2025-12-17 05:21:39',22,NULL,NULL,NULL),(25,4,17,24,3,19,NULL,NULL,NULL,'2025-12-17 05:22:08','2025-12-17 05:22:08',22,523,3,NULL),(26,4,15,22,3,19,NULL,NULL,NULL,'2025-12-17 05:22:08','2025-12-17 05:22:08',22,523,3,NULL),(27,4,16,23,3,19,NULL,NULL,NULL,'2025-12-17 05:22:08','2025-12-17 05:22:08',22,523,3,NULL),(28,4,14,21,3,19,NULL,NULL,NULL,'2025-12-17 05:22:08','2025-12-17 05:22:08',22,523,3,NULL),(29,5,18,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:22:55','2025-12-17 05:22:55',23,NULL,NULL,NULL),(30,5,19,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:22:56','2025-12-17 05:22:56',23,NULL,NULL,NULL),(31,5,20,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:22:57','2025-12-17 05:22:57',23,NULL,NULL,NULL),(32,5,21,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:22:58','2025-12-17 05:22:58',23,NULL,NULL,NULL),(33,5,22,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:22:58','2025-12-17 05:22:58',23,NULL,NULL,NULL),(34,5,23,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:22:59','2025-12-17 05:22:59',23,NULL,NULL,NULL),(35,5,23,34,3,19,NULL,NULL,NULL,'2025-12-17 05:23:37','2025-12-17 05:23:37',23,523,5,NULL),(36,5,21,32,3,19,NULL,NULL,NULL,'2025-12-17 05:23:37','2025-12-17 05:23:37',23,523,5,NULL),(37,5,22,33,3,19,NULL,NULL,NULL,'2025-12-17 05:23:38','2025-12-17 05:23:38',23,523,5,NULL),(38,5,20,31,3,19,NULL,NULL,NULL,'2025-12-17 05:23:38','2025-12-17 05:23:38',23,523,5,NULL),(39,5,19,30,3,19,NULL,NULL,NULL,'2025-12-17 05:23:38','2025-12-17 05:23:38',23,523,5,NULL),(40,5,18,29,3,19,NULL,NULL,NULL,'2025-12-17 05:23:38','2025-12-17 05:23:38',23,523,5,NULL),(41,5,23,34,3,10,'0','openAccess',1,'2025-12-17 05:24:23','2025-12-17 05:24:28',23,521,2,NULL),(42,6,24,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:24:47','2025-12-17 05:24:47',24,NULL,NULL,NULL),(43,6,25,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:24:48','2025-12-17 05:24:48',24,NULL,NULL,NULL),(44,6,26,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:24:49','2025-12-17 05:24:49',24,NULL,NULL,NULL),(45,6,27,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:24:49','2025-12-17 05:24:50',24,NULL,NULL,NULL),(46,6,26,44,3,19,NULL,NULL,NULL,'2025-12-17 05:25:18','2025-12-17 05:25:18',24,523,7,NULL),(47,6,27,45,3,19,NULL,NULL,NULL,'2025-12-17 05:25:18','2025-12-17 05:25:18',24,523,7,NULL),(48,6,25,43,3,19,NULL,NULL,NULL,'2025-12-17 05:25:18','2025-12-17 05:25:18',24,523,7,NULL),(49,6,24,42,3,19,NULL,NULL,NULL,'2025-12-17 05:25:18','2025-12-17 05:25:18',24,523,7,NULL),(50,7,28,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:25:46','2025-12-17 05:25:47',25,NULL,NULL,NULL),(51,7,29,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:25:47','2025-12-17 05:25:47',25,NULL,NULL,NULL),(52,7,30,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:25:48','2025-12-17 05:25:48',25,NULL,NULL,NULL),(53,7,31,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:25:49','2025-12-17 05:25:49',25,NULL,NULL,NULL),(54,7,32,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:25:50','2025-12-17 05:25:50',25,NULL,NULL,NULL),(55,7,32,54,3,4,NULL,NULL,NULL,'2025-12-17 05:26:25','2025-12-17 05:26:25',25,523,8,NULL),(56,7,31,53,3,4,NULL,NULL,NULL,'2025-12-17 05:26:25','2025-12-17 05:26:25',25,523,8,NULL),(57,7,30,52,3,4,NULL,NULL,NULL,'2025-12-17 05:26:25','2025-12-17 05:26:25',25,523,8,NULL),(58,7,29,51,3,4,NULL,NULL,NULL,'2025-12-17 05:26:25','2025-12-17 05:26:25',25,523,8,NULL),(59,7,28,50,3,4,NULL,NULL,NULL,'2025-12-17 05:26:25','2025-12-17 05:26:25',25,523,8,NULL),(60,8,33,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:26:47','2025-12-17 05:26:47',3,NULL,NULL,NULL),(61,9,34,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:26:54','2025-12-17 05:26:54',26,NULL,NULL,NULL),(62,9,35,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:26:55','2025-12-17 05:26:55',26,NULL,NULL,NULL),(63,9,36,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:26:56','2025-12-17 05:26:56',26,NULL,NULL,NULL),(64,9,37,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:26:57','2025-12-17 05:26:57',26,NULL,NULL,NULL),(65,9,38,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:26:58','2025-12-17 05:26:58',26,NULL,NULL,NULL),(66,9,38,65,3,19,NULL,NULL,NULL,'2025-12-17 05:27:32','2025-12-17 05:27:32',26,523,9,NULL),(67,9,37,64,3,19,NULL,NULL,NULL,'2025-12-17 05:27:32','2025-12-17 05:27:32',26,523,9,NULL),(68,9,36,63,3,19,NULL,NULL,NULL,'2025-12-17 05:27:32','2025-12-17 05:27:32',26,523,9,NULL),(69,9,35,62,3,19,NULL,NULL,NULL,'2025-12-17 05:27:32','2025-12-17 05:27:32',26,523,9,NULL),(70,9,34,61,3,19,NULL,NULL,NULL,'2025-12-17 05:27:32','2025-12-17 05:27:32',26,523,9,NULL),(71,10,39,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:27:41','2025-12-17 05:27:41',27,NULL,NULL,NULL),(72,10,40,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:27:42','2025-12-17 05:27:42',27,NULL,NULL,NULL),(73,10,41,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:27:43','2025-12-17 05:27:43',27,NULL,NULL,NULL),(74,10,42,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:27:43','2025-12-17 05:27:44',27,NULL,NULL,NULL),(75,10,43,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:27:44','2025-12-17 05:27:45',27,NULL,NULL,NULL),(76,10,44,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:27:45','2025-12-17 05:27:45',27,NULL,NULL,NULL),(77,10,45,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:27:46','2025-12-17 05:27:46',27,NULL,NULL,NULL),(78,10,46,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:27:47','2025-12-17 05:27:47',27,NULL,NULL,NULL),(79,10,47,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:27:48','2025-12-17 05:27:48',27,NULL,NULL,NULL),(80,11,48,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:28:45','2025-12-17 05:28:45',28,NULL,NULL,NULL),(81,11,49,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:28:46','2025-12-17 05:28:46',28,NULL,NULL,NULL),(82,11,49,81,3,19,NULL,NULL,NULL,'2025-12-17 05:29:02','2025-12-17 05:29:02',28,523,10,NULL),(83,11,48,80,3,19,NULL,NULL,NULL,'2025-12-17 05:29:02','2025-12-17 05:29:02',28,523,10,NULL),(84,12,50,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:29:59','2025-12-17 05:29:59',29,NULL,NULL,NULL),(85,12,51,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:30:00','2025-12-17 05:30:00',29,NULL,NULL,NULL),(86,12,52,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:30:01','2025-12-17 05:30:01',29,NULL,NULL,NULL),(87,12,52,86,3,19,NULL,NULL,NULL,'2025-12-17 05:30:25','2025-12-17 05:30:25',29,523,12,NULL),(88,12,51,85,3,19,NULL,NULL,NULL,'2025-12-17 05:30:25','2025-12-17 05:30:25',29,523,12,NULL),(89,12,50,84,3,19,NULL,NULL,NULL,'2025-12-17 05:30:25','2025-12-17 05:30:25',29,523,12,NULL),(90,13,53,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:30:58','2025-12-17 05:30:59',30,NULL,NULL,NULL),(91,13,54,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:30:59','2025-12-17 05:30:59',30,NULL,NULL,NULL),(92,13,55,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:31:00','2025-12-17 05:31:00',30,NULL,NULL,NULL),(93,13,55,92,3,19,NULL,NULL,NULL,'2025-12-17 05:31:23','2025-12-17 05:31:23',30,523,13,NULL),(94,13,54,91,3,19,NULL,NULL,NULL,'2025-12-17 05:31:23','2025-12-17 05:31:23',30,523,13,NULL),(95,13,53,90,3,19,NULL,NULL,NULL,'2025-12-17 05:31:23','2025-12-17 05:31:23',30,523,13,NULL),(96,14,56,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:32:29','2025-12-17 05:32:29',31,NULL,NULL,NULL),(97,14,57,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:32:30','2025-12-17 05:32:30',31,NULL,NULL,NULL),(98,14,58,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:32:30','2025-12-17 05:32:31',31,NULL,NULL,NULL),(99,14,59,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:32:31','2025-12-17 05:32:32',31,NULL,NULL,NULL),(100,14,60,NULL,13,2,NULL,NULL,NULL,'2025-12-17 05:32:32','2025-12-17 05:32:33',31,NULL,NULL,NULL),(101,14,61,NULL,9,2,NULL,NULL,NULL,'2025-12-17 05:32:33','2025-12-17 05:32:33',31,NULL,NULL,NULL),(102,14,61,101,9,19,NULL,NULL,NULL,'2025-12-17 05:33:04','2025-12-17 05:33:04',31,523,15,NULL),(103,14,60,100,13,19,NULL,NULL,NULL,'2025-12-17 05:33:04','2025-12-17 05:33:04',31,523,15,NULL),(104,14,59,99,3,19,NULL,NULL,NULL,'2025-12-17 05:33:04','2025-12-17 05:33:04',31,523,15,NULL),(105,14,57,97,3,19,NULL,NULL,NULL,'2025-12-17 05:33:04','2025-12-17 05:33:04',31,523,15,NULL),(106,14,58,98,3,19,NULL,NULL,NULL,'2025-12-17 05:33:04','2025-12-17 05:33:04',31,523,15,NULL),(107,14,56,96,3,19,NULL,NULL,NULL,'2025-12-17 05:33:04','2025-12-17 05:33:04',31,523,15,NULL),(108,14,61,101,9,10,'0','openAccess',1,'2025-12-17 05:33:50','2025-12-17 05:34:13',31,521,3,NULL),(109,14,60,100,13,10,'0','openAccess',1,'2025-12-17 05:33:50','2025-12-17 05:34:09',31,521,3,NULL),(110,14,59,99,3,10,'0','openAccess',1,'2025-12-17 05:33:50','2025-12-17 05:34:06',31,521,3,NULL),(111,14,57,97,3,10,'0','openAccess',1,'2025-12-17 05:33:50','2025-12-17 05:33:59',31,521,3,NULL),(112,14,58,98,3,10,'0','openAccess',1,'2025-12-17 05:33:50','2025-12-17 05:34:03',31,521,3,NULL),(113,14,56,96,3,10,'0','openAccess',1,'2025-12-17 05:33:50','2025-12-17 05:33:56',31,521,3,NULL),(114,15,62,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:34:25','2025-12-17 05:34:25',32,NULL,NULL,NULL),(115,15,63,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:34:26','2025-12-17 05:34:26',32,NULL,NULL,NULL),(116,15,64,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:34:27','2025-12-17 05:34:27',32,NULL,NULL,NULL),(117,15,64,116,3,4,NULL,NULL,NULL,'2025-12-17 05:34:49','2025-12-17 05:34:49',32,523,17,NULL),(118,15,63,115,3,4,NULL,NULL,NULL,'2025-12-17 05:34:49','2025-12-17 05:34:49',32,523,17,NULL),(119,15,62,114,3,4,NULL,NULL,NULL,'2025-12-17 05:34:49','2025-12-17 05:34:49',32,523,17,NULL),(120,16,65,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:34:57','2025-12-17 05:34:57',33,NULL,NULL,NULL),(121,16,66,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:34:58','2025-12-17 05:34:58',33,NULL,NULL,NULL),(122,16,67,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:34:59','2025-12-17 05:34:59',33,NULL,NULL,NULL),(123,16,68,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:35:00','2025-12-17 05:35:00',33,NULL,NULL,NULL),(124,16,69,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:35:00','2025-12-17 05:35:01',33,NULL,NULL,NULL),(125,16,68,123,3,4,NULL,NULL,NULL,'2025-12-17 05:35:33','2025-12-17 05:35:33',33,523,18,NULL),(126,16,69,124,3,4,NULL,NULL,NULL,'2025-12-17 05:35:34','2025-12-17 05:35:34',33,523,18,NULL),(127,16,67,122,3,4,NULL,NULL,NULL,'2025-12-17 05:35:34','2025-12-17 05:35:34',33,523,18,NULL),(128,16,66,121,3,4,NULL,NULL,NULL,'2025-12-17 05:35:34','2025-12-17 05:35:34',33,523,18,NULL),(129,16,65,120,3,4,NULL,NULL,NULL,'2025-12-17 05:35:34','2025-12-17 05:35:34',33,523,18,NULL),(130,17,70,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:36:09','2025-12-17 05:36:09',34,NULL,NULL,NULL),(131,17,71,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:36:09','2025-12-17 05:36:10',34,NULL,NULL,NULL),(132,17,72,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:36:10','2025-12-17 05:36:11',34,NULL,NULL,NULL),(133,17,73,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:36:11','2025-12-17 05:36:11',34,NULL,NULL,NULL),(134,17,74,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:36:12','2025-12-17 05:36:12',34,NULL,NULL,NULL),(135,17,75,NULL,3,2,NULL,NULL,NULL,'2025-12-17 05:36:13','2025-12-17 05:36:13',34,NULL,NULL,NULL),(136,17,75,135,3,19,NULL,NULL,NULL,'2025-12-17 05:36:56','2025-12-17 05:36:56',34,523,19,NULL),(137,17,74,134,3,19,NULL,NULL,NULL,'2025-12-17 05:36:56','2025-12-17 05:36:56',34,523,19,NULL),(138,17,73,133,3,19,NULL,NULL,NULL,'2025-12-17 05:36:56','2025-12-17 05:36:56',34,523,19,NULL),(139,17,72,132,3,19,NULL,NULL,NULL,'2025-12-17 05:36:56','2025-12-17 05:36:56',34,523,19,NULL),(140,17,70,130,3,19,NULL,NULL,NULL,'2025-12-17 05:36:56','2025-12-17 05:36:56',34,523,19,NULL),(141,17,71,131,3,19,NULL,NULL,NULL,'2025-12-17 05:36:56','2025-12-17 05:36:56',34,523,19,NULL);
/*!40000 ALTER TABLE `submission_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_keyword_list`
--

DROP TABLE IF EXISTS `submission_search_keyword_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_search_keyword_list` (
  `keyword_id` bigint NOT NULL AUTO_INCREMENT,
  `keyword_text` varchar(60) NOT NULL,
  PRIMARY KEY (`keyword_id`),
  UNIQUE KEY `submission_search_keyword_text` (`keyword_text`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb3 COMMENT='A list of all keywords used in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES (83,'acting'),(108,'affect'),(102,'agent'),(104,'agents'),(55,'alberta'),(2,'allan'),(10,'american'),(20,'americans'),(17,'anti'),(58,'athabasca'),(96,'behaviour'),(32,'bilateral'),(6,'bomb'),(42,'book'),(15,'border'),(62,'brains'),(56,'brian'),(61,'bricks'),(60,'calgary'),(5,'california'),(7,'canada'),(47,'canadian'),(36,'canadianism'),(105,'capable'),(1,'chantal'),(76,'characteristics'),(78,'classical'),(64,'cognitive'),(49,'communication'),(45,'complex'),(25,'confederation'),(72,'construction'),(16,'continent'),(89,'control'),(50,'cultural'),(54,'dawson'),(90,'development'),(75,'discussing'),(77,'distinguish'),(87,'distributed'),(19,'documented'),(57,'dupuis'),(27,'election'),(63,'embodied'),(85,'embodiment'),(81,'emphasis'),(103,'environment'),(30,'events'),(23,'examines'),(28,'examining'),(98,'examples'),(106,'exhibiting'),(86,'exploration'),(95,'exploring'),(70,'foundational'),(41,'hilarious'),(35,'history'),(71,'ideas'),(99,'illustrate'),(69,'illustrates'),(84,'importance'),(37,'informative'),(52,'international'),(68,'introduces'),(100,'key'),(44,'layer'),(66,'lego'),(29,'major'),(11,'media'),(53,'michael'),(74,'mindstorms'),(14,'nations'),(22,'neighbour'),(21,'northern'),(88,'notions'),(97,'numerous'),(26,'obama'),(73,'observation'),(79,'places'),(51,'political'),(24,'portrayed'),(39,'provoking'),(110,'psychology'),(33,'relations'),(46,'relationship'),(9,'remarks'),(80,'renewed'),(43,'reveals'),(67,'robots'),(65,'science'),(107,'sense'),(82,'sensing'),(18,'sentiment'),(93,'simple'),(4,'southern'),(13,'states'),(48,'studies'),(92,'synthesizing'),(94,'systems'),(31,'tested'),(101,'theme'),(91,'theories'),(38,'thought'),(40,'times'),(34,'tracks'),(12,'united'),(3,'university'),(8,'unkind'),(59,'wilson'),(109,'world');
/*!40000 ALTER TABLE `submission_search_keyword_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_object_keywords`
--

DROP TABLE IF EXISTS `submission_search_object_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_search_object_keywords` (
  `submission_search_object_keyword_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `object_id` bigint NOT NULL,
  `keyword_id` bigint NOT NULL,
  `pos` int NOT NULL COMMENT 'Word position of the keyword in the object.',
  PRIMARY KEY (`submission_search_object_keyword_id`),
  UNIQUE KEY `submission_search_object_keywords_unique` (`object_id`,`pos`),
  KEY `submission_search_object_keywords_object_id` (`object_id`),
  KEY `submission_search_object_keywords_keyword_id` (`keyword_id`),
  CONSTRAINT `submission_search_object_keywords_keyword_id` FOREIGN KEY (`keyword_id`) REFERENCES `submission_search_keyword_list` (`keyword_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_search_object_keywords_object_id_foreign` FOREIGN KEY (`object_id`) REFERENCES `submission_search_objects` (`object_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb3 COMMENT='Relationships between search objects and keywords in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_object_keywords`
--

LOCK TABLES `submission_search_object_keywords` WRITE;
/*!40000 ALTER TABLE `submission_search_object_keywords` DISABLE KEYS */;
INSERT INTO `submission_search_object_keywords` VALUES (68,9,1,0),(69,9,2,1),(70,9,3,2),(71,9,4,3),(72,9,5,4),(73,10,6,0),(74,10,7,1),(75,10,8,2),(76,10,9,3),(77,10,10,4),(78,10,11,5),(79,11,7,0),(80,11,12,1),(81,11,13,2),(82,11,14,3),(83,11,15,4),(84,11,16,5),(85,11,17,6),(86,11,10,7),(87,11,18,8),(88,11,7,9),(89,11,19,10),(90,11,20,11),(91,11,21,12),(92,11,22,13),(93,11,2,14),(94,11,23,15),(95,11,10,16),(96,11,11,17),(97,11,24,18),(98,11,7,19),(99,11,25,20),(100,11,26,21),(101,11,27,22),(102,11,28,23),(103,11,29,24),(104,11,30,25),(105,11,31,26),(106,11,32,27),(107,11,33,28),(108,11,6,29),(109,11,7,30),(110,11,34,31),(111,11,35,32),(112,11,17,33),(113,11,36,34),(114,11,37,35),(115,11,38,36),(116,11,39,37),(117,11,40,38),(118,11,41,39),(119,11,42,40),(120,11,43,41),(121,11,44,42),(122,11,45,43),(123,11,46,44),(124,11,7,45),(125,11,12,46),(126,11,13,47),(127,13,47,0),(128,13,48,1),(129,13,49,2),(130,13,50,3),(131,13,48,4),(132,13,51,5),(133,13,52,6),(134,13,48,7),(135,17,53,0),(136,17,54,1),(137,17,3,2),(138,17,55,3),(139,17,56,4),(140,17,57,5),(141,17,58,6),(142,17,3,7),(143,17,53,8),(144,17,59,9),(145,17,3,10),(146,17,60,11),(147,18,61,0),(148,18,62,1),(149,18,63,2),(150,18,64,3),(151,18,65,4),(152,18,66,5),(153,18,67,6),(154,19,61,0),(155,19,62,1),(156,19,68,2),(157,19,63,3),(158,19,64,4),(159,19,65,5),(160,19,69,6),(161,19,70,7),(162,19,71,8),(163,19,72,9),(164,19,73,10),(165,19,66,11),(166,19,74,12),(167,19,67,13),(168,19,75,14),(169,19,76,15),(170,19,77,16),(171,19,63,17),(172,19,64,18),(173,19,65,19),(174,19,78,20),(175,19,64,21),(176,19,65,22),(177,19,61,23),(178,19,62,24),(179,19,79,25),(180,19,80,26),(181,19,81,27),(182,19,82,28),(183,19,83,29),(184,19,84,30),(185,19,85,31),(186,19,86,32),(187,19,87,33),(188,19,88,34),(189,19,89,35),(190,19,90,36),(191,19,91,37),(192,19,92,38),(193,19,93,39),(194,19,94,40),(195,19,95,41),(196,19,96,42),(197,19,97,43),(198,19,98,44),(199,19,99,45),(200,19,100,46),(201,19,101,47),(202,19,84,48),(203,19,102,49),(204,19,103,50),(205,19,93,51),(206,19,104,52),(207,19,66,53),(208,19,67,54),(209,19,105,55),(210,19,106,56),(211,19,45,57),(212,19,96,58),(213,19,107,59),(214,19,108,60),(215,19,109,61),(216,21,110,0);
/*!40000 ALTER TABLE `submission_search_object_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_objects`
--

DROP TABLE IF EXISTS `submission_search_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_search_objects` (
  `object_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `type` int NOT NULL COMMENT 'Type of item. E.g., abstract, fulltext, etc.',
  `assoc_id` bigint DEFAULT NULL COMMENT 'Optional ID of an associated record (e.g., a file_id)',
  PRIMARY KEY (`object_id`),
  KEY `submission_search_objects_submission_id` (`submission_id`),
  CONSTRAINT `submission_search_object_submission` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COMMENT='A list of all search objects indexed in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_objects`
--

LOCK TABLES `submission_search_objects` WRITE;
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
INSERT INTO `submission_search_objects` VALUES (9,5,1,NULL),(10,5,2,NULL),(11,5,4,NULL),(12,5,16,NULL),(13,5,17,NULL),(14,5,8,NULL),(15,5,32,NULL),(16,5,64,NULL),(17,14,1,NULL),(18,14,2,NULL),(19,14,4,NULL),(20,14,16,NULL),(21,14,17,NULL),(22,14,8,NULL),(23,14,32,NULL),(24,14,64,NULL);
/*!40000 ALTER TABLE `submission_search_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_settings`
--

DROP TABLE IF EXISTS `submission_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_settings` (
  `submission_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`submission_setting_id`),
  UNIQUE KEY `submission_settings_unique` (`submission_id`,`locale`,`setting_name`),
  KEY `submission_settings_submission_id` (`submission_id`),
  CONSTRAINT `submission_settings_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Localized data about submissions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_settings`
--

LOCK TABLES `submission_settings` WRITE;
/*!40000 ALTER TABLE `submission_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions`
--

DROP TABLE IF EXISTS `submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submissions` (
  `submission_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `current_publication_id` bigint DEFAULT NULL,
  `date_last_activity` datetime DEFAULT NULL,
  `date_submitted` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `stage_id` bigint NOT NULL DEFAULT '1',
  `locale` varchar(14) DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '1',
  `submission_progress` varchar(50) NOT NULL DEFAULT 'start',
  `work_type` smallint DEFAULT '0',
  PRIMARY KEY (`submission_id`),
  KEY `submissions_context_id` (`context_id`),
  KEY `submissions_publication_id` (`current_publication_id`),
  CONSTRAINT `submissions_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `submissions_publication_id` FOREIGN KEY (`current_publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COMMENT='All submissions submitted to the context, including incomplete, declined and unpublished submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,1,1,'2025-12-17 05:19:02','2025-12-17 05:18:41','2025-12-17 05:18:41',4,'en',1,'',0),(2,1,2,'2025-12-17 05:20:53','2025-12-17 05:20:25','2025-12-17 05:20:25',3,'en',1,'',1),(3,1,3,'2025-12-17 05:21:29','2025-12-17 05:21:29','2025-12-17 05:21:29',1,'en',1,'',0),(4,1,4,'2025-12-17 05:22:46','2025-12-17 05:22:00','2025-12-17 05:22:00',5,'en',1,'',0),(5,1,5,'2025-12-17 05:24:40','2025-12-17 05:23:29','2025-12-17 05:23:29',5,'en',3,'',0),(6,1,6,'2025-12-17 05:25:34','2025-12-17 05:25:10','2025-12-17 05:25:10',2,'en',1,'',0),(7,1,7,'2025-12-17 05:26:40','2025-12-17 05:26:16','2025-12-17 05:26:16',4,'en',1,'',0),(8,1,8,'2025-12-17 05:26:48','2025-12-17 05:26:48','2025-12-17 05:26:48',1,'en',1,'',0),(9,1,9,'2025-12-17 05:27:32','2025-12-17 05:27:23','2025-12-17 05:27:23',2,'en',1,'',0),(10,1,10,'2025-12-17 05:28:38','2025-12-17 05:28:38','2025-12-17 05:28:38',1,'en',1,'',0),(11,1,11,'2025-12-17 05:29:49','2025-12-17 05:28:55','2025-12-17 05:28:55',4,'en',1,'',0),(12,1,12,'2025-12-17 05:30:52','2025-12-17 05:30:17','2025-12-17 05:30:17',2,'en',1,'',0),(13,1,13,'2025-12-17 05:32:18','2025-12-17 05:31:15','2025-12-17 05:31:15',4,'en',1,'',0),(14,1,14,'2025-12-17 05:34:15','2025-12-17 05:32:54','2025-12-17 05:32:54',5,'en',3,'',0),(15,1,15,'2025-12-17 05:34:49','2025-12-17 05:34:41','2025-12-17 05:34:41',3,'en',1,'',0),(16,1,16,'2025-12-17 05:36:02','2025-12-17 05:35:24','2025-12-17 05:35:24',3,'en',1,'',0),(17,1,17,'2025-12-17 05:37:10','2025-12-17 05:36:45','2025-12-17 05:36:45',2,'en',1,'',0);
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporary_files`
--

DROP TABLE IF EXISTS `temporary_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temporary_files` (
  `file_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` bigint NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `temporary_files_user_id` (`user_id`),
  CONSTRAINT `temporary_files_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary files, e.g. where files are kept during an upload process before they are moved somewhere more appropriate.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporary_files`
--

LOCK TABLES `temporary_files` WRITE;
/*!40000 ALTER TABLE `temporary_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `temporary_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_institution_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_institution_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_institution_temporary_records` (
  `usage_stats_temp_institution_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `line_number` bigint NOT NULL,
  `institution_id` bigint NOT NULL,
  PRIMARY KEY (`usage_stats_temp_institution_id`),
  UNIQUE KEY `usi_load_id_line_number_institution_id` (`load_id`,`line_number`,`institution_id`),
  KEY `usi_institution_id` (`institution_id`),
  CONSTRAINT `usi_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats by institution. Data in this table is provisional. See the metrics_* tables for compiled stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_institution_temporary_records`
--

LOCK TABLES `usage_stats_institution_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_institution_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_institution_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_total_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_total_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_total_temporary_records` (
  `usage_stats_temp_total_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint NOT NULL,
  `canonical_url` varchar(255) NOT NULL,
  `series_id` bigint DEFAULT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint DEFAULT NULL,
  `chapter_id` bigint DEFAULT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `file_type` smallint DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_total_id`),
  KEY `ust_series_id` (`series_id`),
  KEY `ust_context_id` (`context_id`),
  KEY `ust_submission_id` (`submission_id`),
  KEY `ust_chapter_id` (`chapter_id`),
  KEY `ust_representation_id` (`representation_id`),
  KEY `ust_submission_file_id` (`submission_file_id`),
  KEY `ust_load_id_context_id_ip_ua_url` (`load_id`,`context_id`,`ip`,`user_agent`,`canonical_url`),
  CONSTRAINT `ust_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_series_id_foreign` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats totals based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_total_temporary_records`
--

LOCK TABLES `usage_stats_total_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_total_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_total_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_unique_item_investigations_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_unique_item_investigations_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_unique_item_investigations_temporary_records` (
  `usage_stats_temp_unique_item_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `chapter_id` bigint DEFAULT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `file_type` smallint DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_unique_item_id`),
  KEY `usii_context_id` (`context_id`),
  KEY `usii_submission_id` (`submission_id`),
  KEY `usii_chapter_id` (`chapter_id`),
  KEY `usii_representation_id` (`representation_id`),
  KEY `usii_submission_file_id` (`submission_file_id`),
  KEY `usii_load_id_context_id_ip_ua` (`load_id`,`context_id`,`ip`,`user_agent`),
  CONSTRAINT `usii_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats on unique downloads based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_unique_item_investigations_temporary_records`
--

LOCK TABLES `usage_stats_unique_item_investigations_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_unique_item_investigations_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_unique_item_investigations_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_unique_item_requests_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_unique_item_requests_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_unique_item_requests_temporary_records` (
  `usage_stats_temp_item_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `chapter_id` bigint DEFAULT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `file_type` smallint DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_item_id`),
  KEY `usir_context_id` (`context_id`),
  KEY `usir_submission_id` (`submission_id`),
  KEY `usir_chapter_id` (`chapter_id`),
  KEY `usir_representation_id` (`representation_id`),
  KEY `usir_submission_file_id` (`submission_file_id`),
  KEY `usir_load_id_context_id_ip_ua` (`load_id`,`context_id`,`ip`,`user_agent`),
  CONSTRAINT `usir_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats on unique views based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_unique_item_requests_temporary_records`
--

LOCK TABLES `usage_stats_unique_item_requests_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_unique_item_requests_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_unique_item_requests_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_unique_title_investigations_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_unique_title_investigations_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_unique_title_investigations_temporary_records` (
  `usage_stats_temp_unique_investigations_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `chapter_id` bigint DEFAULT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `file_type` smallint DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_unique_investigations_id`),
  KEY `usti_context_id` (`context_id`),
  KEY `usti_submission_id` (`submission_id`),
  KEY `usti_chapter_id` (`chapter_id`),
  KEY `usti_representation_id` (`representation_id`),
  KEY `usti_submission_file_id` (`submission_file_id`),
  KEY `usti_load_id_context_id_ip_ua` (`load_id`,`context_id`,`ip`,`user_agent`),
  CONSTRAINT `usti_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE,
  CONSTRAINT `usti_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `usti_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE,
  CONSTRAINT `usti_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `usti_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats for views and downloads from institutions based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_unique_title_investigations_temporary_records`
--

LOCK TABLES `usage_stats_unique_title_investigations_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_unique_title_investigations_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_unique_title_investigations_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_unique_title_requests_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_unique_title_requests_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_unique_title_requests_temporary_records` (
  `usage_stats_temp_unique_requests_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `chapter_id` bigint DEFAULT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `file_type` smallint DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_unique_requests_id`),
  KEY `ustr_context_id` (`context_id`),
  KEY `ustr_submission_id` (`submission_id`),
  KEY `ustr_chapter_id` (`chapter_id`),
  KEY `ustr_representation_id` (`representation_id`),
  KEY `ustr_submission_file_id` (`submission_file_id`),
  KEY `ustr_load_id_context_id_ip_ua` (`load_id`,`context_id`,`ip`,`user_agent`),
  CONSTRAINT `ustr_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE,
  CONSTRAINT `ustr_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `ustr_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE,
  CONSTRAINT `ustr_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `ustr_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats for unique title requests. Data in this table is provisional. See the metrics_* tables for compiled stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_unique_title_requests_temporary_records`
--

LOCK TABLES `usage_stats_unique_title_requests_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_unique_title_requests_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_unique_title_requests_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_settings`
--

DROP TABLE IF EXISTS `user_group_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_settings` (
  `user_group_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_group_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`user_group_setting_id`),
  UNIQUE KEY `user_group_settings_unique` (`user_group_id`,`locale`,`setting_name`),
  KEY `user_group_settings_user_group_id` (`user_group_id`),
  CONSTRAINT `user_group_settings_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb3 COMMENT='More data about user groups, including localized properties such as the name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_settings`
--

LOCK TABLES `user_group_settings` WRITE;
/*!40000 ALTER TABLE `user_group_settings` DISABLE KEYS */;
INSERT INTO `user_group_settings` VALUES (1,1,'en','name','Site Admin'),(2,1,'fr_CA','name','Administrateur-trice du site'),(3,2,'','nameLocaleKey','default.groups.name.manager'),(4,2,'','abbrevLocaleKey','default.groups.abbrev.manager'),(5,2,'en','abbrev','PM'),(6,2,'en','name','Press manager'),(7,2,'fr_CA','abbrev','MP'),(8,2,'fr_CA','name','Gestionnaire de la presse'),(9,3,'','nameLocaleKey','default.groups.name.editor'),(10,3,'','abbrevLocaleKey','default.groups.abbrev.editor'),(11,3,'en','abbrev','PE'),(12,3,'en','name','Press editor'),(13,3,'fr_CA','abbrev','RP'),(14,3,'fr_CA','name','Rédacteur/Rédactrice en chef de la presse'),(15,4,'','nameLocaleKey','default.groups.name.productionEditor'),(16,4,'','abbrevLocaleKey','default.groups.abbrev.productionEditor'),(17,4,'en','abbrev','ProdE'),(18,4,'en','name','Production editor'),(19,4,'fr_CA','abbrev','DirProd'),(20,4,'fr_CA','name','Directeur-trice de production'),(21,5,'','nameLocaleKey','default.groups.name.sectionEditor'),(22,5,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor'),(23,5,'en','abbrev','AcqE'),(24,5,'en','name','Series editor'),(25,5,'fr_CA','abbrev','RS'),(26,5,'fr_CA','name','Rédacteur/Rédactrice en chef de la série'),(27,6,'','nameLocaleKey','default.groups.name.copyeditor'),(28,6,'','abbrevLocaleKey','default.groups.abbrev.copyeditor'),(29,6,'en','abbrev','CE'),(30,6,'en','name','Copyeditor'),(31,6,'fr_CA','abbrev','RÉV'),(32,6,'fr_CA','name','Réviseur-e'),(33,7,'','nameLocaleKey','default.groups.name.designer'),(34,7,'','abbrevLocaleKey','default.groups.abbrev.designer'),(35,7,'en','abbrev','Design'),(36,7,'en','name','Designer'),(37,7,'fr_CA','abbrev','Design'),(38,7,'fr_CA','name','Designer'),(39,8,'','nameLocaleKey','default.groups.name.funding'),(40,8,'','abbrevLocaleKey','default.groups.abbrev.funding'),(41,8,'en','abbrev','FC'),(42,8,'en','name','Funding coordinator'),(43,8,'fr_CA','abbrev','CF'),(44,8,'fr_CA','name','Coordonnateur-trice du financement'),(45,9,'','nameLocaleKey','default.groups.name.indexer'),(46,9,'','abbrevLocaleKey','default.groups.abbrev.indexer'),(47,9,'en','abbrev','IND'),(48,9,'en','name','Indexer'),(49,9,'fr_CA','abbrev','Indx'),(50,9,'fr_CA','name','Indexeur-e'),(51,10,'','nameLocaleKey','default.groups.name.layoutEditor'),(52,10,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor'),(53,10,'en','abbrev','LE'),(54,10,'en','name','Layout Editor'),(55,10,'fr_CA','abbrev','RespMP'),(56,10,'fr_CA','name','Responsable de la mise en page'),(57,11,'','nameLocaleKey','default.groups.name.marketing'),(58,11,'','abbrevLocaleKey','default.groups.abbrev.marketing'),(59,11,'en','abbrev','MS'),(60,11,'en','name','Marketing and sales coordinator'),(61,11,'fr_CA','abbrev','CVM'),(62,11,'fr_CA','name','Coordonnateur-trice des ventes et du marketing'),(63,12,'','nameLocaleKey','default.groups.name.proofreader'),(64,12,'','abbrevLocaleKey','default.groups.abbrev.proofreader'),(65,12,'en','abbrev','PR'),(66,12,'en','name','Proofreader'),(67,12,'fr_CA','abbrev','CorEp'),(68,12,'fr_CA','name','Correcteur-trice d\'épreuves'),(69,13,'','nameLocaleKey','default.groups.name.author'),(70,13,'','abbrevLocaleKey','default.groups.abbrev.author'),(71,13,'en','abbrev','AU'),(72,13,'en','name','Author'),(73,13,'fr_CA','abbrev','AU'),(74,13,'fr_CA','name','Auteur-e'),(75,14,'','nameLocaleKey','default.groups.name.volumeEditor'),(76,14,'','abbrevLocaleKey','default.groups.abbrev.volumeEditor'),(77,14,'en','abbrev','VE'),(78,14,'en','name','Volume editor'),(79,14,'fr_CA','abbrev','RV'),(80,14,'fr_CA','name','Rédacteur/Rédactrice en chef du volume'),(81,15,'','nameLocaleKey','default.groups.name.chapterAuthor'),(82,15,'','abbrevLocaleKey','default.groups.abbrev.chapterAuthor'),(83,15,'en','abbrev','CA'),(84,15,'en','name','Chapter Author'),(85,15,'fr_CA','abbrev','AC'),(86,15,'fr_CA','name','Auteur du chapitre'),(87,16,'','nameLocaleKey','default.groups.name.translator'),(88,16,'','abbrevLocaleKey','default.groups.abbrev.translator'),(89,16,'en','abbrev','Trans'),(90,16,'en','name','Translator'),(91,16,'fr_CA','abbrev','Trad'),(92,16,'fr_CA','name','Traducteur-trice'),(93,17,'','nameLocaleKey','default.groups.name.internalReviewer'),(94,17,'','abbrevLocaleKey','default.groups.abbrev.internalReviewer'),(95,17,'en','abbrev','IR'),(96,17,'en','name','Internal Reviewer'),(97,17,'fr_CA','abbrev','EvalInt'),(98,17,'fr_CA','name','Évaluateur-trice interne'),(99,18,'','nameLocaleKey','default.groups.name.externalReviewer'),(100,18,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer'),(101,18,'en','abbrev','ER'),(102,18,'en','name','External Reviewer'),(103,18,'fr_CA','abbrev','EvEx'),(104,18,'fr_CA','name','Évaluateur-trice externe'),(105,19,'','nameLocaleKey','default.groups.name.reader'),(106,19,'','abbrevLocaleKey','default.groups.abbrev.reader'),(107,19,'en','abbrev','Read'),(108,19,'en','name','Reader'),(109,19,'fr_CA','abbrev','Lect'),(110,19,'fr_CA','name','Lecteur-trice'),(111,14,'','recommendOnly','0');
/*!40000 ALTER TABLE `user_group_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_stage`
--

DROP TABLE IF EXISTS `user_group_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_stage` (
  `user_group_stage_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `user_group_id` bigint NOT NULL,
  `stage_id` bigint NOT NULL,
  PRIMARY KEY (`user_group_stage_id`),
  UNIQUE KEY `user_group_stage_unique` (`context_id`,`user_group_id`,`stage_id`),
  KEY `user_group_stage_context_id` (`context_id`),
  KEY `user_group_stage_user_group_id` (`user_group_id`),
  KEY `user_group_stage_stage_id` (`stage_id`),
  CONSTRAINT `user_group_stage_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `user_group_stage_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 COMMENT='Which stages of the editorial workflow the user_groups can access.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_stage`
--

LOCK TABLES `user_group_stage` WRITE;
/*!40000 ALTER TABLE `user_group_stage` DISABLE KEYS */;
INSERT INTO `user_group_stage` VALUES (1,1,3,1),(2,1,3,2),(3,1,3,3),(4,1,3,4),(5,1,3,5),(6,1,4,4),(7,1,4,5),(8,1,5,1),(9,1,5,2),(10,1,5,3),(11,1,5,4),(12,1,5,5),(13,1,6,4),(14,1,7,5),(15,1,8,1),(16,1,8,2),(17,1,8,3),(18,1,9,5),(19,1,10,5),(20,1,11,4),(21,1,12,5),(22,1,13,1),(23,1,13,2),(24,1,13,3),(25,1,13,4),(26,1,13,5),(41,1,14,1),(42,1,14,2),(43,1,14,3),(44,1,14,4),(45,1,14,5),(32,1,15,4),(33,1,15,5),(34,1,16,1),(35,1,16,2),(36,1,16,3),(37,1,16,4),(38,1,16,5),(39,1,17,2),(40,1,18,3);
/*!40000 ALTER TABLE `user_group_stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_groups` (
  `user_group_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  `is_default` smallint NOT NULL DEFAULT '0',
  `show_title` smallint NOT NULL DEFAULT '1',
  `permit_self_registration` smallint NOT NULL DEFAULT '0',
  `permit_metadata_edit` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_group_id`),
  KEY `user_groups_user_group_id` (`user_group_id`),
  KEY `user_groups_context_id` (`context_id`),
  KEY `user_groups_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COMMENT='All defined user roles in a context, such as Author, Reviewer, Section Editor and Journal Manager.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,0,1,1,1,0,0),(2,1,16,1,1,0,1),(3,1,16,1,1,0,1),(4,1,16,1,1,0,1),(5,1,17,1,1,0,1),(6,1,4097,1,1,0,0),(7,1,4097,1,1,0,0),(8,1,4097,1,1,0,0),(9,1,4097,1,1,0,0),(10,1,4097,1,1,0,0),(11,1,4097,1,1,0,0),(12,1,4097,1,1,0,0),(13,1,65536,1,1,1,0),(14,1,65536,1,1,1,0),(15,1,65536,1,1,1,0),(16,1,65536,1,1,0,0),(17,1,4096,1,1,0,0),(18,1,4096,1,1,1,0),(19,1,1048576,1,1,1,0);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_interests`
--

DROP TABLE IF EXISTS `user_interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_interests` (
  `user_interest_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `controlled_vocab_entry_id` bigint NOT NULL,
  PRIMARY KEY (`user_interest_id`),
  UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`),
  KEY `user_interests_user_id` (`user_id`),
  KEY `user_interests_controlled_vocab_entry_id` (`controlled_vocab_entry_id`),
  CONSTRAINT `user_interests_controlled_vocab_entry_id_foreign` FOREIGN KEY (`controlled_vocab_entry_id`) REFERENCES `controlled_vocab_entries` (`controlled_vocab_entry_id`) ON DELETE CASCADE,
  CONSTRAINT `user_interests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Associates users with user interests (which are stored in the controlled vocabulary tables).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interests`
--

LOCK TABLES `user_interests` WRITE;
/*!40000 ALTER TABLE `user_interests` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_settings` (
  `user_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`user_setting_id`),
  UNIQUE KEY `user_settings_unique` (`user_id`,`locale`,`setting_name`),
  KEY `user_settings_user_id` (`user_id`),
  KEY `user_settings_locale_setting_name_index` (`setting_name`,`locale`),
  CONSTRAINT `user_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8mb3 COMMENT='More data about users, including localized properties like their name and affiliation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
INSERT INTO `user_settings` VALUES (1,1,'en','familyName','admin'),(2,1,'en','givenName','admin'),(3,2,'en','affiliation','Universidad Nacional Autónoma de México'),(4,2,'fr_CA','affiliation',''),(5,2,'en','biography',''),(6,2,'fr_CA','biography',''),(7,2,'en','familyName','Vaca'),(8,2,'fr_CA','familyName',''),(9,2,'en','givenName','Ramiro'),(10,2,'fr_CA','givenName',''),(11,2,'','orcid',''),(12,2,'en','preferredPublicName',''),(13,2,'fr_CA','preferredPublicName',''),(14,2,'en','signature',''),(15,2,'fr_CA','signature',''),(16,3,'en','affiliation','University of Melbourne'),(17,3,'fr_CA','affiliation',''),(18,3,'en','biography',''),(19,3,'fr_CA','biography',''),(20,3,'en','familyName','Barnes'),(21,3,'fr_CA','familyName',''),(22,3,'en','givenName','Daniel'),(23,3,'fr_CA','givenName',''),(24,3,'','orcid',''),(25,3,'en','preferredPublicName',''),(26,3,'fr_CA','preferredPublicName',''),(27,3,'en','signature',''),(28,3,'fr_CA','signature',''),(29,4,'en','affiliation','University of Chicago'),(30,4,'fr_CA','affiliation',''),(31,4,'en','biography',''),(32,4,'fr_CA','biography',''),(33,4,'en','familyName','Buskins'),(34,4,'fr_CA','familyName',''),(35,4,'en','givenName','David'),(36,4,'fr_CA','givenName',''),(37,4,'','orcid',''),(38,4,'en','preferredPublicName',''),(39,4,'fr_CA','preferredPublicName',''),(40,4,'en','signature',''),(41,4,'fr_CA','signature',''),(42,5,'en','affiliation','University of Toronto'),(43,5,'fr_CA','affiliation',''),(44,5,'en','biography',''),(45,5,'fr_CA','biography',''),(46,5,'en','familyName','Berardo'),(47,5,'fr_CA','familyName',''),(48,5,'en','givenName','Stephanie'),(49,5,'fr_CA','givenName',''),(50,5,'','orcid',''),(51,5,'en','preferredPublicName',''),(52,5,'fr_CA','preferredPublicName',''),(53,5,'en','signature',''),(54,5,'fr_CA','signature',''),(55,6,'en','affiliation','Kyoto University'),(56,6,'fr_CA','affiliation',''),(57,6,'en','biography',''),(58,6,'fr_CA','biography',''),(59,6,'en','familyName','Inoue'),(60,6,'fr_CA','familyName',''),(61,6,'en','givenName','Minoti'),(62,6,'fr_CA','givenName',''),(63,6,'','orcid',''),(64,6,'en','preferredPublicName',''),(65,6,'fr_CA','preferredPublicName',''),(66,6,'en','signature',''),(67,6,'fr_CA','signature',''),(68,7,'en','affiliation','Utrecht University'),(69,7,'fr_CA','affiliation',''),(70,7,'en','biography',''),(71,7,'fr_CA','biography',''),(72,7,'en','familyName','Janssen'),(73,7,'fr_CA','familyName',''),(74,7,'en','givenName','Julie'),(75,7,'fr_CA','givenName',''),(76,7,'','orcid',''),(77,7,'en','preferredPublicName',''),(78,7,'fr_CA','preferredPublicName',''),(79,7,'en','signature',''),(80,7,'fr_CA','signature',''),(81,8,'en','affiliation','McGill University'),(82,8,'fr_CA','affiliation',''),(83,8,'en','biography',''),(84,8,'fr_CA','biography',''),(85,8,'en','familyName','Hudson'),(86,8,'fr_CA','familyName',''),(87,8,'en','givenName','Paul'),(88,8,'fr_CA','givenName',''),(89,8,'','orcid',''),(90,8,'en','preferredPublicName',''),(91,8,'fr_CA','preferredPublicName',''),(92,8,'en','signature',''),(93,8,'fr_CA','signature',''),(94,9,'en','affiliation','University of Manitoba'),(95,9,'fr_CA','affiliation',''),(96,9,'en','biography',''),(97,9,'fr_CA','biography',''),(98,9,'en','familyName','McCrae'),(99,9,'fr_CA','familyName',''),(100,9,'en','givenName','Aisla'),(101,9,'fr_CA','givenName',''),(102,9,'','orcid',''),(103,9,'en','preferredPublicName',''),(104,9,'fr_CA','preferredPublicName',''),(105,9,'en','signature',''),(106,9,'fr_CA','signature',''),(107,10,'en','affiliation','State University of New York'),(108,10,'fr_CA','affiliation',''),(109,10,'en','biography',''),(110,10,'fr_CA','biography',''),(111,10,'en','familyName','Gallego'),(112,10,'fr_CA','familyName',''),(113,10,'en','givenName','Adela'),(114,10,'fr_CA','givenName',''),(115,10,'','orcid',''),(116,10,'en','preferredPublicName',''),(117,10,'fr_CA','preferredPublicName',''),(118,10,'en','signature',''),(119,10,'fr_CA','signature',''),(120,11,'en','affiliation','KNUST'),(121,11,'fr_CA','affiliation',''),(122,11,'en','biography',''),(123,11,'fr_CA','biography',''),(124,11,'en','familyName','Zacharia'),(125,11,'fr_CA','familyName',''),(126,11,'en','givenName','Al'),(127,11,'fr_CA','givenName',''),(128,11,'','orcid',''),(129,11,'en','preferredPublicName',''),(130,11,'fr_CA','preferredPublicName',''),(131,11,'en','signature',''),(132,11,'fr_CA','signature',''),(133,12,'en','affiliation','Madrid'),(134,12,'fr_CA','affiliation',''),(135,12,'en','biography',''),(136,12,'fr_CA','biography',''),(137,12,'en','familyName','Favio'),(138,12,'fr_CA','familyName',''),(139,12,'en','givenName','Gonzalo'),(140,12,'fr_CA','givenName',''),(141,12,'','orcid',''),(142,12,'en','preferredPublicName',''),(143,12,'fr_CA','preferredPublicName',''),(144,12,'en','signature',''),(145,12,'fr_CA','signature',''),(146,13,'en','affiliation','Ghent University'),(147,13,'fr_CA','affiliation',''),(148,13,'en','biography',''),(149,13,'fr_CA','biography',''),(150,13,'en','familyName','Fritz'),(151,13,'fr_CA','familyName',''),(152,13,'en','givenName','Maria'),(153,13,'fr_CA','givenName',''),(154,13,'','orcid',''),(155,13,'en','preferredPublicName',''),(156,13,'fr_CA','preferredPublicName',''),(157,13,'en','signature',''),(158,13,'fr_CA','signature',''),(159,14,'en','affiliation','Universidad de Chile'),(160,14,'fr_CA','affiliation',''),(161,14,'en','biography',''),(162,14,'fr_CA','biography',''),(163,14,'en','familyName','Vogt'),(164,14,'fr_CA','familyName',''),(165,14,'en','givenName','Sarah'),(166,14,'fr_CA','givenName',''),(167,14,'','orcid',''),(168,14,'en','preferredPublicName',''),(169,14,'fr_CA','preferredPublicName',''),(170,14,'en','signature',''),(171,14,'fr_CA','signature',''),(172,15,'en','affiliation','Duke University'),(173,15,'fr_CA','affiliation',''),(174,15,'en','biography',''),(175,15,'fr_CA','biography',''),(176,15,'en','familyName','Cox'),(177,15,'fr_CA','familyName',''),(178,15,'en','givenName','Graham'),(179,15,'fr_CA','givenName',''),(180,15,'','orcid',''),(181,15,'en','preferredPublicName',''),(182,15,'fr_CA','preferredPublicName',''),(183,15,'en','signature',''),(184,15,'fr_CA','signature',''),(185,16,'en','affiliation','University of Cape Town'),(186,16,'fr_CA','affiliation',''),(187,16,'en','biography',''),(188,16,'fr_CA','biography',''),(189,16,'en','familyName','Hellier'),(190,16,'fr_CA','familyName',''),(191,16,'en','givenName','Stephen'),(192,16,'fr_CA','givenName',''),(193,16,'','orcid',''),(194,16,'en','preferredPublicName',''),(195,16,'fr_CA','preferredPublicName',''),(196,16,'en','signature',''),(197,16,'fr_CA','signature',''),(198,17,'en','affiliation','Imperial College London'),(199,17,'fr_CA','affiliation',''),(200,17,'en','biography',''),(201,17,'fr_CA','biography',''),(202,17,'en','familyName','Turner'),(203,17,'fr_CA','familyName',''),(204,17,'en','givenName','Catherine'),(205,17,'fr_CA','givenName',''),(206,17,'','orcid',''),(207,17,'en','preferredPublicName',''),(208,17,'fr_CA','preferredPublicName',''),(209,17,'en','signature',''),(210,17,'fr_CA','signature',''),(211,18,'en','affiliation','National University of Singapore'),(212,18,'fr_CA','affiliation',''),(213,18,'en','biography',''),(214,18,'fr_CA','biography',''),(215,18,'en','familyName','Kumar'),(216,18,'fr_CA','familyName',''),(217,18,'en','givenName','Sabine'),(218,18,'fr_CA','givenName',''),(219,18,'','orcid',''),(220,18,'en','preferredPublicName',''),(221,18,'fr_CA','preferredPublicName',''),(222,18,'en','signature',''),(223,18,'fr_CA','signature',''),(224,19,'en','affiliation','University of Calgary'),(225,19,'en','familyName','Clark'),(226,19,'en','givenName','Arthur'),(227,20,'en','affiliation','Athabasca University'),(228,20,'en','familyName','Finkel'),(229,20,'en','givenName','Alvin'),(230,21,'en','affiliation','Athabasca University'),(231,21,'en','familyName','Barnetson'),(232,21,'en','givenName','Bob'),(233,22,'en','affiliation','University of British Columbia'),(234,22,'en','familyName','Beaty'),(235,22,'en','givenName','Bart'),(236,23,'en','affiliation','University of Southern California'),(237,23,'en','familyName','Allan'),(238,23,'en','givenName','Chantal'),(239,24,'en','affiliation','SUNY'),(240,24,'en','familyName','Bernnard'),(241,24,'en','givenName','Deborah'),(242,25,'en','affiliation','Athabasca University'),(243,25,'en','familyName','Kennepohl'),(244,25,'en','givenName','Dietmar'),(245,26,'en','affiliation','University of Sussex'),(246,26,'en','familyName','Perini'),(247,26,'en','givenName','Fernando'),(248,27,'en','affiliation','Buffalo National Park Foundation'),(249,27,'en','familyName','Brower'),(250,27,'en','givenName','Jennifer'),(251,28,'en','affiliation','University of Alberta'),(252,28,'en','familyName','Locke Hart'),(253,28,'en','givenName','Jonathan'),(254,29,'en','affiliation','International Development Research Centre'),(255,29,'en','familyName','Elder'),(256,29,'en','givenName','Laurent'),(257,30,'en','affiliation','Athabasca University'),(258,30,'en','familyName','Ally'),(259,30,'en','givenName','Mohamed'),(260,31,'en','affiliation','University of Alberta'),(261,31,'en','familyName','Dawson'),(262,31,'en','givenName','Michael'),(263,32,'en','affiliation','University of Calgary'),(264,32,'en','familyName','Foran'),(265,32,'en','givenName','Max'),(266,33,'en','affiliation','London School of Economics'),(267,33,'en','familyName','Power'),(268,33,'en','givenName','Michael'),(269,34,'en','affiliation','International Development Research Centre'),(270,34,'en','familyName','Smith'),(271,34,'en','givenName','Matthew');
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_groups`
--

DROP TABLE IF EXISTS `user_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_groups` (
  `user_user_group_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_group_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`user_user_group_id`),
  UNIQUE KEY `user_user_groups_unique` (`user_group_id`,`user_id`),
  KEY `user_user_groups_user_group_id` (`user_group_id`),
  KEY `user_user_groups_user_id` (`user_id`),
  CONSTRAINT `user_user_groups_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `user_user_groups_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3 COMMENT='Maps users to their assigned user_groups.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_groups`
--

LOCK TABLES `user_user_groups` WRITE;
/*!40000 ALTER TABLE `user_user_groups` DISABLE KEYS */;
INSERT INTO `user_user_groups` VALUES (1,1,1),(2,2,1),(3,2,2),(4,3,3),(5,5,4),(6,5,5),(7,5,6),(14,6,13),(15,6,14),(16,10,15),(17,10,16),(18,12,17),(19,12,18),(21,13,19),(23,13,20),(25,13,21),(27,13,22),(29,13,23),(31,13,24),(33,13,25),(35,13,26),(37,13,27),(39,13,28),(41,13,29),(43,13,30),(45,13,31),(47,13,32),(49,13,33),(51,13,34),(8,17,7),(9,17,8),(10,17,9),(11,18,10),(12,18,11),(13,18,12),(20,19,19),(22,19,20),(24,19,21),(26,19,22),(28,19,23),(30,19,24),(32,19,25),(34,19,26),(36,19,27),(38,19,28),(40,19,29),(42,19,30),(44,19,31),(46,19,32),(48,19,33),(50,19,34);
/*!40000 ALTER TABLE `user_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `locales` varchar(255) NOT NULL DEFAULT '[]',
  `gossip` text,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime DEFAULT NULL,
  `must_change_password` smallint DEFAULT NULL,
  `auth_id` bigint DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` smallint NOT NULL DEFAULT '0',
  `disabled_reason` text,
  `inline_help` smallint DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_username` (`username`),
  UNIQUE KEY `users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3 COMMENT='All registered users, including authentication data and profile data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2y$10$fPj2zJnsKpbSuNqhk7W5ieCfVa2x9pXDx5vSLgXYrmh36RLaWGIZu','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,'[]',NULL,NULL,'2025-12-17 05:14:56',NULL,'2025-12-17 05:18:06',NULL,NULL,NULL,0,NULL,1),(2,'rvaca','$2y$10$X3FcQ1bTodZOy59rVpO09ebVsjqJbVxyY6/22qB23SUpiKot0zIG6','rvaca@mailinator.com','','','',NULL,'MX','[]',NULL,NULL,'2025-12-17 05:15:51',NULL,'2025-12-17 05:17:44',0,NULL,NULL,0,NULL,1),(3,'dbarnes','$2y$10$7MiFbuwxuzJN0BScJ/bN/.6mlMzlki9U1CpQyYIA7loJMtJfRVi4S','dbarnes@mailinator.com','','','',NULL,'AU','[]',NULL,NULL,'2025-12-17 05:15:56',NULL,'2025-12-17 05:36:48',0,NULL,NULL,0,NULL,1),(4,'dbuskins','$2y$10$plOEk.4dxs5V8cNySUq0gezfKLZ1lojVwzFFiuzznfWcD0dIksAa.','dbuskins@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2025-12-17 05:16:01',NULL,NULL,0,NULL,NULL,0,NULL,1),(5,'sberardo','$2y$10$x/eysVv4b0zzMut0dSlOuO8NvAsjhmXfwU9JWp2gO5XNMsMv5oLR2','sberardo@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2025-12-17 05:16:07',NULL,NULL,0,NULL,NULL,0,NULL,1),(6,'minoue','$2y$10$.OhUBYesOJhM4aHQLyERGecDEb7wQTNT.RhYau/18n8Uxu4.uJ2uW','minoue@mailinator.com','','','',NULL,'JP','[]',NULL,NULL,'2025-12-17 05:16:12',NULL,'2025-12-17 05:25:28',0,NULL,NULL,0,NULL,1),(7,'jjanssen','$2y$10$B56ElwM3hrlRSVX/AcSYCeMqmVYWH6iw74qA0PwgxlDctrTZTi/Ba','jjanssen@mailinator.com','','','',NULL,'NL','[]',NULL,NULL,'2025-12-17 05:16:18',NULL,NULL,0,NULL,NULL,0,NULL,1),(8,'phudson','$2y$10$/Jh1rZDgykOgPBbNUhrP9OG4KbT4sYw8bnkwEFsDwYFg9ThJfhrcu','phudson@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2025-12-17 05:16:24',NULL,'2025-12-17 05:30:46',0,NULL,NULL,0,NULL,1),(9,'amccrae','$2y$10$rUd7hMHmQkjVTBOl4o2ib.AA12BVaKEFoCCjNi6Csaztamn/jhSF2','amccrae@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2025-12-17 05:16:30',NULL,NULL,0,NULL,NULL,0,NULL,1),(10,'agallego','$2y$10$1atPDZQXJdjHza4YB6j2NuDj8z/uyYwUkHA0ppScnMkViu0TzVfE2','agallego@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2025-12-17 05:16:37',NULL,'2025-12-17 05:35:55',0,NULL,NULL,0,NULL,1),(11,'alzacharia','$2y$10$oeqBFqe15ueZFSO0IAzJAeAdiHukL6vABWIDVr22ANi5c/6.YUc8a','alzacharia@mailinator.com','','','',NULL,'GH','[]',NULL,NULL,'2025-12-17 05:16:44',NULL,NULL,0,NULL,NULL,0,NULL,1),(12,'gfavio','$2y$10$27uhZKYscp7WIbSQkikK/eQnI6UKMHB.lD/cD6qJJfruhuNV2Xb2q','gfavio@mailinator.com','','','',NULL,'ES','[]',NULL,NULL,'2025-12-17 05:16:51',NULL,'2025-12-17 05:32:01',0,NULL,NULL,0,NULL,1),(13,'mfritz','$2y$10$LP4CS4dYxdsC7FT0FIVulOhQo4S5eD7mX23X1iTPWNwP/RyExRAki','mfritz@mailinator.com','','','',NULL,'BE','[]',NULL,NULL,'2025-12-17 05:16:58',NULL,NULL,0,NULL,NULL,0,NULL,1),(14,'svogt','$2y$10$VtCbOSYGokFLJfHIoEQ1muiPoDY7gsX9kqtkEVR.vqBQiE5sVy9jO','svogt@mailinator.com','','','',NULL,'CL','[]',NULL,NULL,'2025-12-17 05:17:05',NULL,NULL,0,NULL,NULL,0,NULL,1),(15,'gcox','$2y$10$gt2ooeA/4YOb0jB6AUkJe..FLJALgJQ0QqlIAJY6Oau5ncu/aVpaK','gcox@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2025-12-17 05:17:13',NULL,NULL,0,NULL,NULL,0,NULL,1),(16,'shellier','$2y$10$fAC6f8o/q.22W37xARBx5e7y0Eq.crTH0DJJe3R5WBoJgHYlIYuXy','shellier@mailinator.com','','','',NULL,'ZA','[]',NULL,NULL,'2025-12-17 05:17:21',NULL,NULL,0,NULL,NULL,0,NULL,1),(17,'cturner','$2y$10$ndc4DJ4SjZqKOTjCKCJe6ORBHWs1.MWzmGZjr3dY4pdMEI4gGP4vm','cturner@mailinator.com','','','',NULL,'GB','[]',NULL,NULL,'2025-12-17 05:17:29',NULL,NULL,0,NULL,NULL,0,NULL,1),(18,'skumar','$2y$10$N7yzs9iEOnk0ZUCET95cTeoPg.Nn3Lb17BE1kZhq0oDSD2BTlR5kK','skumar@mailinator.com','','','',NULL,'SG','[]',NULL,NULL,'2025-12-17 05:17:37',NULL,NULL,0,NULL,NULL,0,NULL,1),(19,'aclark','$2y$10$G2sz7hyT4t0q9IMxuEJh7OLJyjs869NpRwOQgX376uiJVYJN7foiK','aclark@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-12-17 05:18:23',NULL,'2025-12-17 05:18:23',NULL,NULL,NULL,0,NULL,1),(20,'afinkel','$2y$10$o.kM8mHoK2hVitZknWCS9OaJmFHVrI5wzQyZNI7vXirJ77seAl9Te','afinkel@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-12-17 05:19:06',NULL,'2025-12-17 05:19:06',NULL,NULL,NULL,0,NULL,1),(21,'bbarnetson','$2y$10$WBgiPJovB3v4Cbz/vGt4V.dn20yLdTQJCRTTNKoCxolx2D6CtnrhK','bbarnetson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-12-17 05:20:58',NULL,'2025-12-17 05:20:58',NULL,NULL,NULL,0,NULL,1),(22,'bbeaty','$2y$10$jiyePENfHkU0WH9Qkyq8Z.05i1xxGSlFc9b1PXoi8yXLOfjWkR7Le','bbeaty@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-12-17 05:21:34',NULL,'2025-12-17 05:21:34',NULL,NULL,NULL,0,NULL,1),(23,'callan','$2y$10$gjqU0N4a82DxTzv8STO3EeoU0bU6FwFZe8WqIawyKo9TiT/MBt4U.','callan@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-12-17 05:22:53',NULL,'2025-12-17 05:22:53',NULL,NULL,NULL,0,NULL,1),(24,'dbernnard','$2y$10$pcSrNn.wrSkWu4o29oP5.eLTRJ4II6abVLVAqZsAQx2wOJ.Mmx3Aa','dbernnard@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2025-12-17 05:24:44',NULL,'2025-12-17 05:24:44',NULL,NULL,NULL,0,NULL,1),(25,'dkennepohl','$2y$10$n9/aBgaa.rkwu49IeaT1SeJrnS.PxPV/EmumI2SaMDdZY5APYHfXm','dkennepohl@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-12-17 05:25:44',NULL,'2025-12-17 05:25:44',NULL,NULL,NULL,0,NULL,1),(26,'fperini','$2y$10$twpfCS9S//HJOvcFtLAFpuMjVDa09KjmcnkTlKsqJitvuESRyk5lS','fperini@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-12-17 05:26:52',NULL,'2025-12-17 05:26:52',NULL,NULL,NULL,0,NULL,1),(27,'jbrower','$2y$10$cCLrI8OpqUwj1YIIsHqQaO.1pcKgNtdk/J4exWae4qPtULVGS1TAS','jbrower@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-12-17 05:27:38',NULL,'2025-12-17 05:27:38',NULL,NULL,NULL,0,NULL,1),(28,'jlockehart','$2y$10$bTIXQB9EOma.DsRyQJgz2.PvXk2ugsw7lVONtbXc4t9THpCuKEzsq','jlockehart@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-12-17 05:28:42',NULL,'2025-12-17 05:28:42',NULL,NULL,NULL,0,NULL,1),(29,'lelder','$2y$10$BWwsXYmNjEeiGOnQmpNtNuCgtyFGccO2.Ltl21OJqe3hn3MLzpe6y','lelder@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-12-17 05:29:56',NULL,'2025-12-17 05:29:56',NULL,NULL,NULL,0,NULL,1),(30,'mally','$2y$10$vCodg7lJebLiQIlLniHLCOnZI9z1/KeCg2DvrkgX6dlQk5Z9fx/Nm','mally@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-12-17 05:30:56',NULL,'2025-12-17 05:30:56',NULL,NULL,NULL,0,NULL,1),(31,'mdawson','$2y$10$XKBv/OKRvFGY6bJhzfbUkuZk2.bvG.Ey84O8pxQbvLsI9nCAdUek.','mdawson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-12-17 05:32:26',NULL,'2025-12-17 05:32:26',NULL,NULL,NULL,0,NULL,1),(32,'mforan','$2y$10$dsabkLFfWWILEygRtNWMZOk1AJXTLEmP5Ydp17HtcaEw0sgTbudxa','mforan@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-12-17 05:34:22',NULL,'2025-12-17 05:34:23',NULL,NULL,NULL,0,NULL,1),(33,'mpower','$2y$10$2Hb1blvGjYgLKQASI9/01.q0Lt5VndEqOycUJ9cjQ5nd8Rm5pVgau','mpower@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-12-17 05:34:55',NULL,'2025-12-17 05:34:55',NULL,NULL,NULL,0,NULL,1),(34,'msmith','$2y$10$YjbAw6EAdkPld5eOD7IaJeP85UFqZ3FeKvuyu91Ve3aYLheRx504m','msmith@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-12-17 05:36:06',NULL,'2025-12-17 05:36:06',NULL,NULL,NULL,0,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `versions` (
  `version_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `major` int NOT NULL DEFAULT '0' COMMENT 'Major component of version number, e.g. the 2 in OJS 2.3.8-0',
  `minor` int NOT NULL DEFAULT '0' COMMENT 'Minor component of version number, e.g. the 3 in OJS 2.3.8-0',
  `revision` int NOT NULL DEFAULT '0' COMMENT 'Revision component of version number, e.g. the 8 in OJS 2.3.8-0',
  `build` int NOT NULL DEFAULT '0' COMMENT 'Build component of version number, e.g. the 0 in OJS 2.3.8-0',
  `date_installed` datetime NOT NULL,
  `current` smallint NOT NULL DEFAULT '0' COMMENT '1 iff the version entry being described is currently active. This permits the table to store past installation history for forensic purposes.',
  `product_type` varchar(30) DEFAULT NULL COMMENT 'Describes the type of product this row describes, e.g. "plugins.generic" (for a generic plugin) or "core" for the application itself',
  `product` varchar(30) DEFAULT NULL COMMENT 'Uniquely identifies the product this version row describes, e.g. "ojs2" for OJS 2.x, "languageToggle" for the language toggle block plugin, etc.',
  `product_class_name` varchar(80) DEFAULT NULL COMMENT 'Specifies the class name associated with this product, for plugins, or the empty string where not applicable.',
  `lazy_load` smallint NOT NULL DEFAULT '0' COMMENT '1 iff the row describes a lazy-load plugin; 0 otherwise',
  `sitewide` smallint NOT NULL DEFAULT '0' COMMENT '1 iff the row describes a site-wide plugin; 0 otherwise',
  PRIMARY KEY (`version_id`),
  UNIQUE KEY `versions_unique` (`product_type`,`product`,`major`,`minor`,`revision`,`build`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COMMENT='Describes the installation and upgrade version history for the application and all installed plugins.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,1,0,0,0,'2025-12-17 05:14:57',1,'plugins.metadata','dc11','',0,0),(2,1,0,0,0,'2025-12-17 05:14:57',1,'plugins.pubIds','urn','\\APP\\plugins\\pubIds\\urn\\URNPubIdPlugin',0,0),(3,1,0,0,0,'2025-12-17 05:14:57',1,'plugins.blocks','makeSubmission','MakeSubmissionBlockPlugin',1,0),(4,1,0,0,0,'2025-12-17 05:14:57',1,'plugins.blocks','information','InformationBlockPlugin',1,0),(5,1,0,0,0,'2025-12-17 05:14:57',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(6,1,0,0,0,'2025-12-17 05:14:57',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),(7,1,0,0,0,'2025-12-17 05:14:57',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(8,1,0,0,0,'2025-12-17 05:14:57',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(9,1,0,0,0,'2025-12-17 05:14:57',1,'plugins.generic','htmlMonographFile','HtmlMonographFilePlugin',1,0),(10,1,0,0,0,'2025-12-17 05:14:57',1,'plugins.generic','dublinCoreMeta','DublinCoreMetaPlugin',1,0),(11,1,3,0,0,'2025-12-17 05:14:57',1,'plugins.generic','acron','AcronPlugin',1,1),(12,1,0,0,0,'2025-12-17 05:14:57',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(13,1,0,0,0,'2025-12-17 05:14:57',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(14,0,1,0,0,'2025-12-17 05:14:57',1,'plugins.generic','citationStyleLanguage','CitationStyleLanguagePlugin',1,0),(15,1,2,0,0,'2025-12-17 05:14:57',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),(16,1,0,0,0,'2025-12-17 05:14:57',1,'plugins.generic','usageEvent','',0,1),(17,1,0,0,0,'2025-12-17 05:14:57',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(18,1,0,0,0,'2025-12-17 05:14:57',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(19,1,2,0,0,'2025-12-17 05:14:57',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(20,1,0,0,0,'2025-12-17 05:14:57',1,'plugins.themes','default','DefaultThemePlugin',1,0),(21,1,0,0,0,'2025-12-17 05:14:57',1,'plugins.importexport','onix30','',0,0),(22,1,0,0,0,'2025-12-17 05:14:57',1,'plugins.importexport','csv','',0,0),(23,1,0,0,0,'2025-12-17 05:14:57',1,'plugins.importexport','native','',0,0),(24,1,0,0,0,'2025-12-17 05:14:57',1,'plugins.importexport','users','',0,0),(25,1,0,0,0,'2025-12-17 05:14:57',1,'plugins.oaiMetadataFormats','dc','',0,0),(26,1,0,0,0,'2025-12-17 05:14:57',1,'plugins.paymethod','manual','',0,0),(27,1,0,0,0,'2025-12-17 05:14:57',1,'plugins.paymethod','paypal','',0,0),(28,2,0,1,0,'2025-12-17 05:14:57',1,'plugins.reports','reviewReport','',0,0),(29,1,0,0,0,'2025-12-17 05:14:57',1,'plugins.reports','monographReport','',0,0),(30,3,4,0,10,'2025-12-17 05:14:49',1,'core','omp','',0,1);
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-17  5:37:11
