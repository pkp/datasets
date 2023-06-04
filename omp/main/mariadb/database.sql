-- MySQL dump 10.19  Distrib 10.3.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: omp-ci
-- ------------------------------------------------------
-- Server version	10.3.38-MariaDB-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_keys` (
  `access_key_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context` varchar(40) NOT NULL,
  `key_hash` varchar(40) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `expiry_date` datetime NOT NULL,
  PRIMARY KEY (`access_key_id`),
  KEY `access_keys_user_id` (`user_id`),
  KEY `access_keys_hash` (`key_hash`,`user_id`,`context`),
  CONSTRAINT `access_keys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Access keys are used to provide pseudo-login functionality for security-minimal tasks. Passkeys can be emailed directly to users, who can use them for a limited time in lieu of standard username and password.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_settings` (
  `announcement_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `announcement_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`announcement_setting_id`),
  UNIQUE KEY `announcement_settings_unique` (`announcement_id`,`locale`,`setting_name`),
  KEY `announcement_settings_announcement_id` (`announcement_id`),
  CONSTRAINT `announcement_settings_announcement_id_foreign` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`announcement_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about announcements, including localized properties like names and contents.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_type_settings` (
  `announcement_type_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`announcement_type_setting_id`),
  UNIQUE KEY `announcement_type_settings_unique` (`type_id`,`locale`,`setting_name`),
  KEY `announcement_type_settings_type_id` (`type_id`),
  CONSTRAINT `announcement_type_settings_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `announcement_types` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about announcement types, including localized properties like their names.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `announcement_types_context_id` (`context_id`),
  CONSTRAINT `announcement_types_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Announcement types allow for announcements to optionally be categorized.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `announcement_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `date_expire` date DEFAULT NULL,
  `date_posted` datetime NOT NULL,
  PRIMARY KEY (`announcement_id`),
  KEY `announcements_type_id` (`type_id`),
  KEY `announcements_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `announcements_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `announcement_types` (`type_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Announcements are messages that can be presented to users e.g. on the homepage.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_settings` (
  `author_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`author_setting_id`),
  UNIQUE KEY `author_settings_unique` (`author_id`,`locale`,`setting_name`),
  KEY `author_settings_author_id` (`author_id`),
  CONSTRAINT `author_settings_author_id` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about authors, including localized properties such as their name and affiliation.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `author_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `include_in_browse` smallint(6) NOT NULL DEFAULT 1,
  `publication_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `user_group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  KEY `authors_user_group_id` (`user_group_id`),
  KEY `authors_publication_id_foreign` (`publication_id`),
  CONSTRAINT `authors_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE,
  CONSTRAINT `authors_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='The authors of a publication.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `seq` bigint(20) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `image` text DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_path` (`context_id`,`path`),
  KEY `category_context_id` (`context_id`),
  KEY `category_context_parent_id` (`context_id`,`parent_id`),
  KEY `category_parent_id` (`parent_id`),
  CONSTRAINT `categories_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Categories permit the organization of submissions into a heirarchical structure.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_settings` (
  `category_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`category_setting_id`),
  UNIQUE KEY `category_settings_unique` (`category_id`,`locale`,`setting_name`),
  KEY `category_settings_category_id` (`category_id`),
  CONSTRAINT `category_settings_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about categories, including localized properties such as names.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citation_settings` (
  `citation_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `citation_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`citation_setting_id`),
  UNIQUE KEY `citation_settings_unique` (`citation_id`,`locale`,`setting_name`),
  KEY `citation_settings_citation_id` (`citation_id`),
  CONSTRAINT `citation_settings_citation_id` FOREIGN KEY (`citation_id`) REFERENCES `citations` (`citation_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Additional data about citations, including localized content.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citations` (
  `citation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publication_id` bigint(20) NOT NULL,
  `raw_citation` text NOT NULL,
  `seq` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`citation_id`),
  UNIQUE KEY `citations_publication_seq` (`publication_id`,`seq`),
  KEY `citations_publication` (`publication_id`),
  CONSTRAINT `citations_publication` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A citation made by an associated publication.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `completed_payments` (
  `completed_payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `payment_type` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `assoc_id` varchar(16) DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `currency_code_alpha` varchar(3) DEFAULT NULL,
  `payment_method_plugin_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`completed_payment_id`),
  KEY `completed_payments_context_id` (`context_id`),
  KEY `completed_payments_user_id` (`user_id`),
  CONSTRAINT `completed_payments_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `completed_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A list of completed (fulfilled) payments, with information about the type of payment and the entity it relates to.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlled_vocab_entries` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `controlled_vocab_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_entry_id`),
  KEY `controlled_vocab_entries_controlled_vocab_id` (`controlled_vocab_id`),
  KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`),
  CONSTRAINT `controlled_vocab_entries_controlled_vocab_id_foreign` FOREIGN KEY (`controlled_vocab_id`) REFERENCES `controlled_vocabs` (`controlled_vocab_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='The order that a word or phrase used in a controlled vocabulary should appear. For example, the order of keywords in a publication.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`controlled_vocab_entry_setting_id`),
  UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`),
  CONSTRAINT `c_v_e_s_entry_id` FOREIGN KEY (`controlled_vocab_entry_id`) REFERENCES `controlled_vocab_entries` (`controlled_vocab_entry_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about a controlled vocabulary entry, including localized properties such as the actual word or phrase.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlled_vocabs` (
  `controlled_vocab_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(64) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`controlled_vocab_id`),
  UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Every word or phrase used in a controlled vocabulary. Controlled vocabularies are used for submission metadata like keywords and subjects, reviewer interests, and wherever a similar dictionary of words or phrases is required. Each entry corresponds to a word or phrase like "cellular reproduction" and a type like "submissionKeyword".';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_object_tombstone_oai_set_objects` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tombstone_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`object_id`),
  KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`),
  CONSTRAINT `data_object_tombstone_oai_set_objects_tombstone_id` FOREIGN KEY (`tombstone_id`) REFERENCES `data_object_tombstones` (`tombstone_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Relationships between tombstones and other data that can be collected in OAI sets, e.g. sections.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_object_tombstone_settings` (
  `tombstone_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tombstone_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`tombstone_setting_id`),
  UNIQUE KEY `data_object_tombstone_settings_unique` (`tombstone_id`,`locale`,`setting_name`),
  KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`),
  CONSTRAINT `data_object_tombstone_settings_tombstone_id` FOREIGN KEY (`tombstone_id`) REFERENCES `data_object_tombstones` (`tombstone_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about data object tombstones, including localized content.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_object_tombstones` (
  `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_object_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `data_object_tombstones_data_object_id` (`data_object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Entries for published data that has been removed. Usually used in the OAI endpoint.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doi_settings` (
  `doi_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `doi_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`doi_setting_id`),
  UNIQUE KEY `doi_settings_unique` (`doi_id`,`locale`,`setting_name`),
  KEY `doi_settings_doi_id` (`doi_id`),
  CONSTRAINT `doi_settings_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about DOIs, including the registration agency.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dois` (
  `doi_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `doi` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`doi_id`),
  KEY `dois_context_id` (`context_id`),
  CONSTRAINT `dois_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores all DOIs used in the system.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edit_decisions` (
  `edit_decision_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) DEFAULT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` smallint(6) DEFAULT NULL,
  `editor_id` bigint(20) NOT NULL,
  `decision` smallint(6) NOT NULL,
  `date_decided` datetime NOT NULL,
  PRIMARY KEY (`edit_decision_id`),
  KEY `edit_decisions_submission_id` (`submission_id`),
  KEY `edit_decisions_editor_id` (`editor_id`),
  KEY `edit_decisions_review_round_id` (`review_round_id`),
  CONSTRAINT `edit_decisions_editor_id` FOREIGN KEY (`editor_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `edit_decisions_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`) ON DELETE CASCADE,
  CONSTRAINT `edit_decisions_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Editorial decisions recorded on a submission, such as decisions to accept or decline the submission, as well as decisions to send for review, send to copyediting, request revisions, and more.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
INSERT INTO `edit_decisions` VALUES (1,1,NULL,1,NULL,3,18,'2023-06-04 21:56:18'),(2,1,1,3,1,3,2,'2023-06-04 21:56:35'),(3,2,NULL,1,NULL,3,18,'2023-06-04 21:59:44'),(4,4,NULL,1,NULL,3,1,'2023-06-04 22:02:06'),(5,4,3,2,1,3,3,'2023-06-04 22:02:23'),(6,4,4,3,1,3,2,'2023-06-04 22:02:39'),(7,4,NULL,4,NULL,3,7,'2023-06-04 22:02:56'),(8,5,NULL,1,NULL,3,1,'2023-06-04 22:04:31'),(9,5,5,2,1,3,3,'2023-06-04 22:04:50'),(10,5,6,3,1,3,2,'2023-06-04 22:05:09'),(11,5,NULL,4,NULL,3,7,'2023-06-04 22:05:28'),(12,6,NULL,1,NULL,3,1,'2023-06-04 22:07:28'),(13,6,7,2,1,6,23,'2023-06-04 22:07:59'),(14,7,NULL,1,NULL,3,18,'2023-06-04 22:09:23'),(15,7,8,3,1,3,2,'2023-06-04 22:09:40'),(16,9,NULL,1,NULL,3,1,'2023-06-04 22:11:14'),(17,11,NULL,1,NULL,3,1,'2023-06-04 22:13:35'),(18,11,10,2,1,3,3,'2023-06-04 22:13:50'),(19,11,11,3,1,3,2,'2023-06-04 22:14:50'),(20,12,NULL,1,NULL,3,1,'2023-06-04 22:15:47'),(21,13,NULL,1,NULL,3,1,'2023-06-04 22:17:16'),(22,13,13,2,1,3,3,'2023-06-04 22:17:33'),(23,13,14,3,1,3,2,'2023-06-04 22:18:44'),(24,14,NULL,1,NULL,3,1,'2023-06-04 22:19:55'),(25,14,15,2,1,3,3,'2023-06-04 22:20:12'),(26,14,16,3,1,3,2,'2023-06-04 22:20:29'),(27,14,NULL,4,NULL,3,7,'2023-06-04 22:20:47'),(28,15,NULL,1,NULL,3,18,'2023-06-04 22:22:50'),(29,16,NULL,1,NULL,3,18,'2023-06-04 22:24:03'),(30,17,NULL,1,NULL,3,1,'2023-06-04 22:26:12');
/*!40000 ALTER TABLE `edit_decisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `date_sent` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `recipients` text DEFAULT NULL,
  `cc_recipients` text DEFAULT NULL,
  `bcc_recipients` text DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `email_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A record of email messages that are sent in relation to an associated entity, such as a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
INSERT INTO `email_log` VALUES (1,1048585,1,0,'2023-06-04 21:56:03',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/1\">The ABCs of Human Survival: A Paradigm for Global Citizenship</a><br />Arthur Clark</p><p><b>Abstract</b></p>The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities―and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(2,1048585,1,0,'2023-06-04 21:56:04',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Arthur Clark,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/1</p><p>If you have been logged out, you can login again with the username aclark.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(3,1048585,1,3,'2023-06-04 21:56:18',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>','','','Your submission has been sent for review','<p>Dear Arthur Clark,</p><p>I am pleased to inform you that an editor has reviewed your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(4,1048585,1,3,'2023-06-04 21:56:35',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Arthur Clark,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(5,1048585,2,0,'2023-06-04 21:59:12',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: The West and Beyond: New Perspectives on an Imagined Region','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">The West and Beyond: New Perspectives on an Imagined Region</a><br />Alvin Finkel, Sarah Carter, Peter Fortna, Gerald Friesen, Lyle Dick, Winona Wheeler, Matt Dyce, James Opp</p><p><b>Abstract</b></p><p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p><p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(6,1048585,2,0,'2023-06-04 21:59:12',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: The West and Beyond: New Perspectives on an Imagined Region','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">The West and Beyond: New Perspectives on an Imagined Region</a><br />Alvin Finkel, Sarah Carter, Peter Fortna, Gerald Friesen, Lyle Dick, Winona Wheeler, Matt Dyce, James Opp</p><p><b>Abstract</b></p><p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p><p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(7,1048585,2,0,'2023-06-04 21:59:12',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: The West and Beyond: New Perspectives on an Imagined Region','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">The West and Beyond: New Perspectives on an Imagined Region</a><br />Alvin Finkel, Sarah Carter, Peter Fortna, Gerald Friesen, Lyle Dick, Winona Wheeler, Matt Dyce, James Opp</p><p><b>Abstract</b></p><p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p><p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(8,1048585,2,0,'2023-06-04 21:59:12',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Alvin Finkel\" <afinkel@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Alvin Finkel,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The West and Beyond: New Perspectives on an Imagined Region, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/2</p><p>If you have been logged out, you can login again with the username afinkel.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/2\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(9,1048585,2,0,'2023-06-04 21:59:12',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Sarah Carter\" <scarter@mailinator.com>, \"Peter Fortna\" <pfortna@mailinator.com>, \"Gerald Friesen\" <gfriesen@mailinator.com>, \"Lyle Dick\" <ldick@mailinator.com>, \"Winona Wheeler\" <wwheeler@mailinator.com>, \"Matt Dyce\" <mdyce@mailinator.com>, \"James Opp\" <jopp@mailinator.com>','','','Submission confirmation','<p>Dear Sarah Carter, Peter Fortna, Gerald Friesen, Lyle Dick, Winona Wheeler, Matt Dyce, James Opp,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Alvin Finkel, provided the following details:</p><p>The West and Beyond: New Perspectives on an Imagined Region<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(10,1048585,2,3,'2023-06-04 21:59:44',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Alvin Finkel\" <afinkel@mailinator.com>','','','Your submission has been sent for review','<p>Dear Alvin Finkel,</p><p>I am pleased to inform you that an editor has reviewed your submission, The West and Beyond: New Perspectives on an Imagined Region, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(11,1048585,3,0,'2023-06-04 22:01:07',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: The Political Economy of Workplace Injury in Canada','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">The Political Economy of Workplace Injury in Canada</a><br />Bob Barnetson</p><p><b>Abstract</b></p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(12,1048585,3,0,'2023-06-04 22:01:07',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: The Political Economy of Workplace Injury in Canada','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">The Political Economy of Workplace Injury in Canada</a><br />Bob Barnetson</p><p><b>Abstract</b></p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(13,1048585,3,0,'2023-06-04 22:01:07',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: The Political Economy of Workplace Injury in Canada','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">The Political Economy of Workplace Injury in Canada</a><br />Bob Barnetson</p><p><b>Abstract</b></p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(14,1048585,3,0,'2023-06-04 22:01:07',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Bob Barnetson\" <bbarnetson@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Bob Barnetson,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The Political Economy of Workplace Injury in Canada, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/3</p><p>If you have been logged out, you can login again with the username bbarnetson.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/3\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(15,1048585,4,0,'2023-06-04 22:01:52',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/4\">How Canadians Communicate: Contexts of Canadian Popular Culture</a><br />Bart Beaty, Toby Miller, Ira Wagman, Will Straw</p><p><b>Abstract</b></p>What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(16,1048585,4,0,'2023-06-04 22:01:52',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Bart Beaty,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/4</p><p>If you have been logged out, you can login again with the username bbeaty.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(17,1048585,4,0,'2023-06-04 22:01:52',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Toby Miller\" <tmiller@mailinator.com>, \"Ira Wagman\" <awagman@mailinator.com>, \"Will Straw\" <wstraw@mailinator.com>','','','Submission confirmation','<p>Dear Toby Miller, Ira Wagman, Will Straw,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Bart Beaty, provided the following details:</p><p>How Canadians Communicate: Contexts of Canadian Popular Culture<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(18,1048585,4,3,'2023-06-04 22:02:06',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Bart Beaty,</p><p>I am pleased to inform you that an editor has reviewed your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(19,1048585,4,3,'2023-06-04 22:02:23',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Your submission has been sent for review','<p>Dear Bart Beaty,</p><p>I am pleased to inform you that an editor has reviewed your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(20,1048585,4,3,'2023-06-04 22:02:39',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Bart Beaty,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(21,1048585,4,3,'2023-06-04 22:02:56',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Bart Beaty,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(22,1048585,5,0,'2023-06-04 22:04:15',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Bomb Canada and Other Unkind Remarks in the American Media','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">Bomb Canada and Other Unkind Remarks in the American Media</a><br />Chantal Allan</p><p><b>Abstract</b></p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(23,1048585,5,0,'2023-06-04 22:04:15',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Bomb Canada and Other Unkind Remarks in the American Media','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">Bomb Canada and Other Unkind Remarks in the American Media</a><br />Chantal Allan</p><p><b>Abstract</b></p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(24,1048585,5,0,'2023-06-04 22:04:15',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Bomb Canada and Other Unkind Remarks in the American Media','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">Bomb Canada and Other Unkind Remarks in the American Media</a><br />Chantal Allan</p><p><b>Abstract</b></p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(25,1048585,5,0,'2023-06-04 22:04:15',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Chantal Allan,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Bomb Canada and Other Unkind Remarks in the American Media, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/5</p><p>If you have been logged out, you can login again with the username callan.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(26,1048585,5,3,'2023-06-04 22:04:31',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Chantal Allan,</p><p>I am pleased to inform you that an editor has reviewed your submission, Bomb Canada and Other Unkind Remarks in the American Media, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(27,1048585,5,3,'2023-06-04 22:04:50',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Your submission has been sent for review','<p>Dear Chantal Allan,</p><p>I am pleased to inform you that an editor has reviewed your submission, Bomb Canada and Other Unkind Remarks in the American Media, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(28,1048585,5,3,'2023-06-04 22:05:09',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Chantal Allan,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Bomb Canada and Other Unkind Remarks in the American Media, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(29,1048585,5,3,'2023-06-04 22:05:28',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Chantal Allan,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, Bomb Canada and Other Unkind Remarks in the American Media, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(30,1048585,6,0,'2023-06-04 22:07:13',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">The Information Literacy User’s Guide</a><br />Deborah Bernnard, Greg Bobish, Daryl Bullis, Jenna Hecker</p><p><b>Abstract</b></p>Good researchers have a host of tools at their disposal that make navigating today’s complex information ecosystem much more manageable. Gaining the knowledge, abilities, and self-reflection necessary to be a good researcher helps not only in academic settings, but is invaluable in any career, and throughout one’s life. The Information Literacy User’s Guide will start you on this route to success.<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(31,1048585,6,0,'2023-06-04 22:07:13',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Deborah Bernnard\" <dbernnard@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Deborah Bernnard,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The Information Literacy User’s Guide, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/6</p><p>If you have been logged out, you can login again with the username dbernnard.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/6\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(32,1048585,6,0,'2023-06-04 22:07:13',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Greg Bobish\" <gbobish@mailinator.com>, \"Daryl Bullis\" <dbullis@mailinator.com>, \"Jenna Hecker\" <jhecker@mailinator.com>','','','Submission confirmation','<p>Dear Greg Bobish, Daryl Bullis, Jenna Hecker,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Deborah Bernnard, provided the following details:</p><p>The Information Literacy User’s Guide<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(33,1048585,6,3,'2023-06-04 22:07:28',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Deborah Bernnard\" <dbernnard@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Deborah Bernnard,</p><p>I am pleased to inform you that an editor has reviewed your submission, The Information Literacy User’s Guide, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(34,1048585,7,0,'2023-06-04 22:09:07',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">Accessible Elements: Teaching Science Online and at a Distance</a><br />Dietmar Kennepohl, Terry Anderson, Paul Gorsky, Gale Parchoma, Stuart Palmer</p><p><b>Abstract</b></p>Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(35,1048585,7,0,'2023-06-04 22:09:07',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Dietmar Kennepohl,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Accessible Elements: Teaching Science Online and at a Distance, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/7</p><p>If you have been logged out, you can login again with the username dkennepohl.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/7\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(36,1048585,7,0,'2023-06-04 22:09:07',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Terry Anderson\" <tanderson@mailinator.com>, \"Paul Gorsky\" <pgorsky@mailinator.com>, \"Gale Parchoma\" <gparchoma@mailinator.com>, \"Stuart Palmer\" <spalmer@mailinator.com>','','','Submission confirmation','<p>Dear Terry Anderson, Paul Gorsky, Gale Parchoma, Stuart Palmer,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Dietmar Kennepohl, provided the following details:</p><p>Accessible Elements: Teaching Science Online and at a Distance<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(37,1048585,7,3,'2023-06-04 22:09:23',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>','','','Your submission has been sent for review','<p>Dear Dietmar Kennepohl,</p><p>I am pleased to inform you that an editor has reviewed your submission, Accessible Elements: Teaching Science Online and at a Distance, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(38,1048585,7,3,'2023-06-04 22:09:40',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Dietmar Kennepohl,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Accessible Elements: Teaching Science Online and at a Distance, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/7\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(39,1048585,8,0,'2023-06-04 22:10:04',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Editorial</a><br /></p><p><b>Abstract</b></p>A Note From The Publisher<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(40,1048585,8,0,'2023-06-04 22:10:05',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Editorial','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Editorial</a><br /></p><p><b>Abstract</b></p>A Note From The Publisher<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(41,1048585,8,0,'2023-06-04 22:10:05',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Editorial','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Editorial</a><br /></p><p><b>Abstract</b></p>A Note From The Publisher<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(42,1048585,8,0,'2023-06-04 22:10:05',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Editorial','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Editorial</a><br /></p><p><b>Abstract</b></p>A Note From The Publisher<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(43,1048585,9,0,'2023-06-04 22:10:57',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/9\">Enabling Openness: The future of the information society in Latin America and the Caribbean</a><br />Fernando Perini, Robin Mansell, Hernan Galperin, Pablo Bello, Eleonora Rabinovich</p><p><b>Abstract</b></p>In recent years, the Internet and other network technologies have emerged as a central issue for development in Latin America and the Caribbean. They have shown their potential to increase productivity and economic competitiveness, to create new ways to deliver education and health services, and to be driving forces for the modernization of the provision of public services.<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(44,1048585,9,0,'2023-06-04 22:10:57',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Fernando Perini\" <fperini@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Fernando Perini,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Enabling Openness: The future of the information society in Latin America and the Caribbean, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/9</p><p>If you have been logged out, you can login again with the username fperini.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/9\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(45,1048585,9,0,'2023-06-04 22:10:57',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Robin Mansell\" <rmansell@mailinator.com>, \"Hernan Galperin\" <hgalperin@mailinator.com>, \"Pablo Bello\" <pbello@mailinator.com>, \"Eleonora Rabinovich\" <erabinovich@mailinator.com>','','','Submission confirmation','<p>Dear Robin Mansell, Hernan Galperin, Pablo Bello, Eleonora Rabinovich,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Fernando Perini, provided the following details:</p><p>Enabling Openness: The future of the information society in Latin America and the Caribbean<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(46,1048585,9,3,'2023-06-04 22:11:14',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Fernando Perini\" <fperini@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Fernando Perini,</p><p>I am pleased to inform you that an editor has reviewed your submission, Enabling Openness: The future of the information society in Latin America and the Caribbean, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(47,1048585,10,0,'2023-06-04 22:12:55',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Lost Tracks: Buffalo National Park, 1909-1939','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">Lost Tracks: Buffalo National Park, 1909-1939</a><br />Jennifer Brower</p><p><b>Abstract</b></p>While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(48,1048585,10,0,'2023-06-04 22:12:55',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Lost Tracks: Buffalo National Park, 1909-1939','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">Lost Tracks: Buffalo National Park, 1909-1939</a><br />Jennifer Brower</p><p><b>Abstract</b></p>While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(49,1048585,10,0,'2023-06-04 22:12:55',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Lost Tracks: Buffalo National Park, 1909-1939','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">Lost Tracks: Buffalo National Park, 1909-1939</a><br />Jennifer Brower</p><p><b>Abstract</b></p>While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(50,1048585,10,0,'2023-06-04 22:12:55',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Jennifer Brower\" <jbrower@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Jennifer Brower,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Lost Tracks: Buffalo National Park, 1909-1939, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/10</p><p>If you have been logged out, you can login again with the username jbrower.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/10\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(51,1048585,11,0,'2023-06-04 22:13:22',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Dreamwork','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">Dreamwork</a><br />Jonathan Locke Hart</p><p><b>Abstract</b></p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(52,1048585,11,0,'2023-06-04 22:13:22',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Dreamwork','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">Dreamwork</a><br />Jonathan Locke Hart</p><p><b>Abstract</b></p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(53,1048585,11,0,'2023-06-04 22:13:22',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Dreamwork','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">Dreamwork</a><br />Jonathan Locke Hart</p><p><b>Abstract</b></p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(54,1048585,11,0,'2023-06-04 22:13:22',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Jonathan Locke Hart,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Dreamwork, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/11</p><p>If you have been logged out, you can login again with the username jlockehart.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/11\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(55,1048585,11,3,'2023-06-04 22:13:35',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that an editor has reviewed your submission, Dreamwork, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(56,1048585,11,3,'2023-06-04 22:13:51',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Your submission has been sent for review','<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that an editor has reviewed your submission, Dreamwork, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(57,1048585,11,10,'2023-06-04 22:14:16',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Adela Gallego accepted review assignment for #11 Locke Hart — Dreamwork','<p>Dear Ramiro Vaca,</p><p>Adela Gallego has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">#11 Locke Hart — Dreamwork</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><b>Review Due:</b> 2023-07-02</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.'),(58,1048585,11,12,'2023-06-04 22:14:28',1073741829,'\"Gonzalo Favio\" <gfavio@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Gonzalo Favio accepted review assignment for #11 Locke Hart — Dreamwork','<p>Dear Ramiro Vaca,</p><p>Gonzalo Favio has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">#11 Locke Hart — Dreamwork</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><b>Review Due:</b> 2023-07-02</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.'),(59,1048585,11,3,'2023-06-04 22:14:50',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Dreamwork, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/11\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(60,1048585,12,0,'2023-06-04 22:15:32',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Connecting ICTs to Development','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">Connecting ICTs to Development</a><br />Laurent Elder, Heloise Emdon, Frank Tulus, Raymond Hyma, John Valk, Khaled Fourati, Jeremy de Beer, Sara Bannerman</p><p><b>Abstract</b></p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(61,1048585,12,0,'2023-06-04 22:15:32',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Connecting ICTs to Development','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">Connecting ICTs to Development</a><br />Laurent Elder, Heloise Emdon, Frank Tulus, Raymond Hyma, John Valk, Khaled Fourati, Jeremy de Beer, Sara Bannerman</p><p><b>Abstract</b></p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(62,1048585,12,0,'2023-06-04 22:15:33',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Connecting ICTs to Development','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">Connecting ICTs to Development</a><br />Laurent Elder, Heloise Emdon, Frank Tulus, Raymond Hyma, John Valk, Khaled Fourati, Jeremy de Beer, Sara Bannerman</p><p><b>Abstract</b></p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(63,1048585,12,0,'2023-06-04 22:15:33',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Laurent Elder\" <lelder@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Laurent Elder,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Connecting ICTs to Development, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/12</p><p>If you have been logged out, you can login again with the username lelder.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/12\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(64,1048585,12,0,'2023-06-04 22:15:33',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Frank Tulus\" <ftulus@mailinator.com>, \"Raymond Hyma\" <rhyma@mailinator.com>, \"John Valk\" <jvalk@mailinator.com>, \"Khaled Fourati\" <fkourati@mailinator.com>, \"Jeremy de Beer\" <jdebeer@mailinator.com>, \"Sara Bannerman\" <sbannerman@mailinator.com>','','','Submission confirmation','<p>Dear Frank Tulus, Raymond Hyma, John Valk, Khaled Fourati, Jeremy de Beer, Sara Bannerman,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Laurent Elder, provided the following details:</p><p>Connecting ICTs to Development<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(65,1048585,12,3,'2023-06-04 22:15:47',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Laurent Elder\" <lelder@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Laurent Elder,</p><p>I am pleased to inform you that an editor has reviewed your submission, Connecting ICTs to Development, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(66,1048585,12,8,'2023-06-04 22:16:21',1073741829,'\"Paul Hudson\" <phudson@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Paul Hudson accepted review assignment for #12 Elder et al. — Connecting ICTs to Development','<p>Dear Ramiro Vaca,</p><p>Paul Hudson has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">#12 Elder et al. — Connecting ICTs to Development</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><b>Review Due:</b> 2023-07-02</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.'),(67,1048585,13,0,'2023-06-04 22:17:02',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">Mobile Learning: Transforming the Delivery of Education and Training</a><br />Mohamed Ally, John Traxler, Marguerite Koole, Torstein Rekkedal</p><p><b>Abstract</b></p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(68,1048585,13,0,'2023-06-04 22:17:02',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">Mobile Learning: Transforming the Delivery of Education and Training</a><br />Mohamed Ally, John Traxler, Marguerite Koole, Torstein Rekkedal</p><p><b>Abstract</b></p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(69,1048585,13,0,'2023-06-04 22:17:02',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">Mobile Learning: Transforming the Delivery of Education and Training</a><br />Mohamed Ally, John Traxler, Marguerite Koole, Torstein Rekkedal</p><p><b>Abstract</b></p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(70,1048585,13,0,'2023-06-04 22:17:02',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Mohamed Ally,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Mobile Learning: Transforming the Delivery of Education and Training, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/13</p><p>If you have been logged out, you can login again with the username mally.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(71,1048585,13,0,'2023-06-04 22:17:02',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Traxler\" <jtraxler@mailinator.com>, \"Marguerite Koole\" <mkoole@mailinator.com>, \"Torstein Rekkedal\" <trekkedal@mailinator.com>','','','Submission confirmation','<p>Dear John Traxler, Marguerite Koole, Torstein Rekkedal,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Mohamed Ally, provided the following details:</p><p>Mobile Learning: Transforming the Delivery of Education and Training<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(72,1048585,13,3,'2023-06-04 22:17:17',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that an editor has reviewed your submission, Mobile Learning: Transforming the Delivery of Education and Training, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(73,1048585,13,3,'2023-06-04 22:17:33',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Your submission has been sent for review','<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that an editor has reviewed your submission, Mobile Learning: Transforming the Delivery of Education and Training, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(74,1048585,13,10,'2023-06-04 22:18:07',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Adela Gallego accepted review assignment for #13 Ally et al. — Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear Ramiro Vaca,</p><p>Adela Gallego has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">#13 Ally et al. — Mobile Learning: Transforming the Delivery of Education and Training</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><b>Review Due:</b> 2023-07-02</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.'),(75,1048585,13,12,'2023-06-04 22:18:20',1073741829,'\"Gonzalo Favio\" <gfavio@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Gonzalo Favio accepted review assignment for #13 Ally et al. — Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear Ramiro Vaca,</p><p>Gonzalo Favio has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">#13 Ally et al. — Mobile Learning: Transforming the Delivery of Education and Training</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><b>Review Due:</b> 2023-07-02</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.'),(76,1048585,13,3,'2023-06-04 22:18:44',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Mobile Learning: Transforming the Delivery of Education and Training, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(77,1048585,14,0,'2023-06-04 22:19:38',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/14\">From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots</a><br />Michael Dawson, Brian Dupuis, Michael Wilson</p><p><b>Abstract</b></p>From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(78,1048585,14,0,'2023-06-04 22:19:38',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Michael Dawson,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/14</p><p>If you have been logged out, you can login again with the username mdawson.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(79,1048585,14,0,'2023-06-04 22:19:38',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Brian Dupuis\" <bdupuis@mailinator.com>, \"Michael Wilson\" <mwilson@mailinator.com>','','','Submission confirmation','<p>Dear Brian Dupuis, Michael Wilson,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Michael Dawson, provided the following details:</p><p>From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(80,1048585,14,3,'2023-06-04 22:19:55',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Michael Dawson,</p><p>I am pleased to inform you that an editor has reviewed your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(81,1048585,14,3,'2023-06-04 22:20:12',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Your submission has been sent for review','<p>Dear Michael Dawson,</p><p>I am pleased to inform you that an editor has reviewed your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(82,1048585,14,3,'2023-06-04 22:20:30',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Michael Dawson,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(83,1048585,14,3,'2023-06-04 22:20:47',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Michael Dawson,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(84,1048585,15,0,'2023-06-04 22:22:34',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Expansive Discourses: Urban Sprawl in Calgary, 1945-1978','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">Expansive Discourses: Urban Sprawl in Calgary, 1945-1978</a><br />Max Foran</p><p><b>Abstract</b></p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(85,1048585,15,0,'2023-06-04 22:22:34',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Expansive Discourses: Urban Sprawl in Calgary, 1945-1978','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">Expansive Discourses: Urban Sprawl in Calgary, 1945-1978</a><br />Max Foran</p><p><b>Abstract</b></p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(86,1048585,15,0,'2023-06-04 22:22:34',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Expansive Discourses: Urban Sprawl in Calgary, 1945-1978','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">Expansive Discourses: Urban Sprawl in Calgary, 1945-1978</a><br />Max Foran</p><p><b>Abstract</b></p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(87,1048585,15,0,'2023-06-04 22:22:34',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Max Foran\" <mforan@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Max Foran,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Expansive Discourses: Urban Sprawl in Calgary, 1945-1978, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/15</p><p>If you have been logged out, you can login again with the username mforan.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/15\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(88,1048585,15,3,'2023-06-04 22:22:50',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Max Foran\" <mforan@mailinator.com>','','','Your submission has been sent for review','<p>Dear Max Foran,</p><p>I am pleased to inform you that an editor has reviewed your submission, Expansive Discourses: Urban Sprawl in Calgary, 1945-1978, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(89,1048585,16,0,'2023-06-04 22:23:46',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: A Designer\'s Log: Case Studies in Instructional Design','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">A Designer\'s Log: Case Studies in Instructional Design</a><br />Michael Power</p><p><b>Abstract</b></p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(90,1048585,16,0,'2023-06-04 22:23:46',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: A Designer\'s Log: Case Studies in Instructional Design','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">A Designer\'s Log: Case Studies in Instructional Design</a><br />Michael Power</p><p><b>Abstract</b></p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(91,1048585,16,0,'2023-06-04 22:23:46',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: A Designer\'s Log: Case Studies in Instructional Design','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">A Designer\'s Log: Case Studies in Instructional Design</a><br />Michael Power</p><p><b>Abstract</b></p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(92,1048585,16,0,'2023-06-04 22:23:46',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Michael Power\" <mpower@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Michael Power,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, A Designer\'s Log: Case Studies in Instructional Design, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/16</p><p>If you have been logged out, you can login again with the username mpower.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/16\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(93,1048585,16,3,'2023-06-04 22:24:03',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Power\" <mpower@mailinator.com>','','','Your submission has been sent for review','<p>Dear Michael Power,</p><p>I am pleased to inform you that an editor has reviewed your submission, A Designer\'s Log: Case Studies in Instructional Design, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(94,1048585,16,10,'2023-06-04 22:24:38',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Adela Gallego accepted review assignment for #16 Power — A Designer\'s Log: Case Studies in Instructional Design','<p>Dear Ramiro Vaca,</p><p>Adela Gallego has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">#16 Power — A Designer\'s Log: Case Studies in Instructional Design</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><b>Review Due:</b> 2023-07-02</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.'),(95,1048585,17,0,'2023-06-04 22:25:52',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Open Development: Networked Innovations in International Development','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">Open Development: Networked Innovations in International Development</a><br />Matthew Smith, Yochai Benkler, Katherine Reilly, Melissa Loudon, Ulrike Rivett, Mark Graham, Håvard Haarstad, Marshall Smith</p><p><b>Abstract</b></p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(96,1048585,17,0,'2023-06-04 22:25:52',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Open Development: Networked Innovations in International Development','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">Open Development: Networked Innovations in International Development</a><br />Matthew Smith, Yochai Benkler, Katherine Reilly, Melissa Loudon, Ulrike Rivett, Mark Graham, Håvard Haarstad, Marshall Smith</p><p><b>Abstract</b></p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(97,1048585,17,0,'2023-06-04 22:25:52',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Open Development: Networked Innovations in International Development','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">Open Development: Networked Innovations in International Development</a><br />Matthew Smith, Yochai Benkler, Katherine Reilly, Melissa Loudon, Ulrike Rivett, Mark Graham, Håvard Haarstad, Marshall Smith</p><p><b>Abstract</b></p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(98,1048585,17,0,'2023-06-04 22:25:52',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Matthew Smith\" <msmith@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Matthew Smith,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Open Development: Networked Innovations in International Development, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/17</p><p>If you have been logged out, you can login again with the username msmith.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/17\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(99,1048585,17,0,'2023-06-04 22:25:52',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Yochai Benkler\" <ybenkler@mailinator.com>, \"Katherine Reilly\" <kreilly@mailinator.com>, \"Melissa Loudon\" <mloudon@mailinator.com>, \"Ulrike Rivett\" <urivett@mailinator.com>, \"Mark Graham\" <mgraham@mailinator.com>, \"Håvard Haarstad\" <hhaarstad@mailinator.com>, \"Marshall Smith\" <masmith@mailinator.com>','','','Submission confirmation','<p>Dear Yochai Benkler, Katherine Reilly, Melissa Loudon, Ulrike Rivett, Mark Graham, Håvard Haarstad, Marshall Smith,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Matthew Smith, provided the following details:</p><p>Open Development: Networked Innovations in International Development<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(100,1048585,17,3,'2023-06-04 22:26:12',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Matthew Smith\" <msmith@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Matthew Smith,</p><p>I am pleased to inform you that an editor has reviewed your submission, Open Development: Networked Innovations in International Development, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>');
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log_users`
--

DROP TABLE IF EXISTS `email_log_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_log_users` (
  `email_log_user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email_log_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`email_log_user_id`),
  UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`),
  KEY `email_log_users_email_log_id` (`email_log_id`),
  KEY `email_log_users_user_id` (`user_id`),
  CONSTRAINT `email_log_users_email_log_id_foreign` FOREIGN KEY (`email_log_id`) REFERENCES `email_log` (`log_id`) ON DELETE CASCADE,
  CONSTRAINT `email_log_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A record of users associated with an email log entry.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log_users`
--

LOCK TABLES `email_log_users` WRITE;
/*!40000 ALTER TABLE `email_log_users` DISABLE KEYS */;
INSERT INTO `email_log_users` VALUES (1,1,4),(2,2,19),(3,3,19),(4,4,19),(5,5,1),(6,6,2),(7,7,3),(8,8,20),(9,10,20),(10,11,1),(11,12,2),(12,13,3),(13,14,21),(14,15,3),(15,16,22),(16,18,22),(17,19,22),(18,20,22),(19,21,22),(20,22,1),(21,23,2),(22,24,3),(23,25,23),(24,26,23),(25,27,23),(26,28,23),(27,29,23),(28,30,4),(29,31,24),(30,33,24),(31,34,3),(32,35,25),(33,37,25),(34,38,25),(35,39,3),(36,40,1),(37,41,2),(38,42,3),(39,43,4),(40,44,26),(41,46,26),(42,47,1),(43,48,2),(44,49,3),(45,50,27),(46,51,1),(47,52,2),(48,53,3),(49,54,28),(50,55,28),(51,56,28),(52,57,2),(53,58,2),(54,59,28),(55,60,1),(56,61,2),(57,62,3),(58,63,29),(59,65,29),(60,66,2),(61,67,1),(62,68,2),(63,69,3),(64,70,30),(65,72,30),(66,73,30),(67,74,2),(68,75,2),(69,76,30),(70,77,3),(71,78,31),(72,80,31),(73,81,31),(74,82,31),(75,83,31),(76,84,1),(77,85,2),(78,86,3),(79,87,32),(80,88,32),(81,89,1),(82,90,2),(83,91,3),(84,92,33),(85,93,33),(86,94,2),(87,95,1),(88,96,2),(89,97,3),(90,98,34),(91,100,34);
/*!40000 ALTER TABLE `email_log_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_key` varchar(255) NOT NULL COMMENT 'Unique identifier for this email.',
  `context_id` bigint(20) NOT NULL,
  `alternate_to` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email_templates_email_key` (`email_key`,`context_id`),
  KEY `email_templates_context_id` (`context_id`),
  KEY `email_templates_alternate_to` (`alternate_to`),
  CONSTRAINT `email_templates_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Custom email templates created by each context, and overrides of the default templates.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_default_data` (
  `email_templates_default_data_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email_key` varchar(255) NOT NULL COMMENT 'Unique identifier for this email.',
  `locale` varchar(14) NOT NULL DEFAULT 'en',
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text DEFAULT NULL,
  PRIMARY KEY (`email_templates_default_data_id`),
  UNIQUE KEY `email_templates_default_data_unique` (`email_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Default email templates created for every installed locale.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default_data`
--

LOCK TABLES `email_templates_default_data` WRITE;
/*!40000 ALTER TABLE `email_templates_default_data` DISABLE KEYS */;
INSERT INTO `email_templates_default_data` VALUES (1,'PASSWORD_RESET_CONFIRM','en','Password Reset Confirm','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$lostPasswordUrl}<br />\n<br />\n{$siteContactName}'),(3,'USER_REGISTER','en','User Created','Press Registration','{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$pressName}. We have included your username and password in this email, which are needed for all work with this press through its website. At any point, you can ask to be removed from the list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),(5,'USER_VALIDATE_CONTEXT','en','Validate Email (Press Registration)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$pressName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$pressSignature}'),(7,'USER_VALIDATE_SITE','en','Validate Email (Site)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$siteSignature}'),(9,'REVIEWER_REGISTER','en','Reviewer Register','Registration as Reviewer with {$pressName}','In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$pressName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the press through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),(11,'SUBMISSION_ACK','en','Submission Confirmation','Thank you for your submission to {$pressName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$pressName}. We have received your submission, {$submissionTitle}, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: {$authorSubmissionUrl}</p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Thank you for considering {$pressName} as a venue for your work.</p>{$pressSignature}'),(13,'SUBMISSION_ACK_NOT_USER','en','Submission Confirmation (Other Authors)','Submission confirmation','<p>Dear {$recipientName},</p><p>You have been named as a co-author on a submission to {$pressName}. The submitter, {$submitterName}, provided the following details:</p><p>{$submissionTitle}<br>{$authorsWithAffiliation}</p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering {$pressName} as a venue for your work.</p><p>Kind regards,</p>{$pressSignature}'),(15,'EDITOR_ASSIGN','en','Editor Assigned','You have been assigned as an editor on a submission to {$pressName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>If you find the submission to be relevant for {$pressName}, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$pressSignature}'),(17,'REVIEW_CANCEL','en','Reviewer Unassign','Request for Review Cancelled','{$recipientName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this review process in the future.<br />\n<br />\nIf you have any questions, please contact me.'),(19,'REVIEW_REINSTATE','en','Reviewer Reinstate','Can you still review something for {$pressName}?','<p>Dear {$recipientName},</p><p>We recently cancelled our request for you to review a submission, {$submissionTitle}, for {$pressName}. We\'ve reversed that decision and we hope that you are still able to conduct the review.</p><p>If you are able to assist with this submission\'s review, you can <a href=\"{$reviewAssignmentUrl}\">login to the press</a> to view the submission, upload review files, and submit your review request.</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p>{$signature}'),(21,'REVIEW_RESEND_REQUEST','en','Resend Review Request to Reviewer','Requesting your review again for {$pressName}','<p>Dear {$recipientName},</p><p>Recently, you declined our request to review a submission, {$submissionTitle}, for {$pressName}. I\'m writing to see if you are able to conduct the review after all.</p><p>We would be grateful if you\'re able to perform this review, but we understand if that is not possible at this time. Either way, please <a href=\"{$reviewAssignmentUrl}\">accept or decline the request</a> by {$responseDueDate}, so that we can find an alternate reviewer.<p>If you have any questions, please contact me.</p><p>Kind regards,</p>{$signature}'),(23,'REVIEW_REQUEST','en','Review Request','Manuscript Review Request','<p>Dear {$recipientName},</p><p>I believe that you would serve as an excellent reviewer for a submission  to {$pressName}. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please <a href=\"{$reviewAssignmentUrl}\">accept or decline</a> the review by <b>{$responseDueDate}</b>.</p><p>You may contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}'),(25,'REVIEW_REQUEST_SUBSEQUENT','en','Review Request Subsequent','Request to review a revised submission','<p>Dear {$recipientName},</p><p>Thank you for your review of <a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a>. The authors have considered the reviewers\' feedback and have now submitted a revised version of their work. I\'m writing to ask if you would conduct a second round of peer review for this submission.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can <a href=\"{$reviewAssignmentUrl}\">follow the review steps</a> to view the submission, upload review files, and submit your review comments.<p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please <a href=\"{$reviewAssignmentUrl}\">accept or decline</a> the review by <b>{$responseDueDate}</b>.</p><p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}'),(27,'REVIEW_RESPONSE_OVERDUE_AUTO','en','Review Response Overdue (Automated)','Manuscript Review Request','Dear {$recipientName},<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$pressSignature}<br />\n'),(29,'REVIEW_CONFIRM','en','Review Confirm','Review accepted: {$reviewerName} accepted review assignment for #{$submissionId} {$authorsShort} — {$submissionTitle}','<p>Dear {$recipientName},</p><p>{$reviewerName} has accepted the following review:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — {$submissionTitle}</a><br /><b>Type:</b> {$reviewMethod}</p><b>Review Due:</b> {$reviewDueDate}</p><p>Login to <a href=\"{$submissionUrl}\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"{$pressUrl}\">{$pressName}</a>.'),(31,'REVIEW_DECLINE','en','Review Decline','Unable to Review','Editor(s):<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$senderName}'),(33,'REVIEW_ACK','en','Review Acknowledgement','Thank you for your review','<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, {$submissionTitle}, for {$pressName}. We appreciate your time and expertise in contributing to the quality of the work that we publish.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$pressName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>'),(35,'REVIEW_REMIND','en','Review Reminder','A reminder to please complete your review','<p>Dear {$recipientName},</p><p>Just a gentle reminder of our request for your review of the submission, \"{$submissionTitle},\" for {$pressName}. We were expecting to have this review by {$reviewDueDate} and we would be pleased to receive it as soon as you are able to prepare it.</p><p>You can <a href=\"{$reviewAssignmentUrl}\">login to the press</a> and follow the review steps to view the submission, upload review files, and submit your review comments.</p><p>If you need an extension of the deadline, please contact me. I look forward to hearing from you.</p><p>Thank you in advance and kind regards,</p>{$signature}'),(37,'REVIEW_REMIND_AUTO','en','Review Reminder (Automated)','A reminder to please complete your review','<p>Dear {$recipientName}:</p><p>This email is an automated reminder from {$pressName} in regards to our request for your review of the submission, \"{$submissionTitle}.\"</p><p>We were expecting to have this review by {$reviewDueDate} and we would be pleased to receive it as soon as you are able to prepare it.</p><p>Please <a href=\"{$reviewAssignmentUrl}\">login to the press</a> and follow the review steps to view the submission, upload review files, and submit your review comments.</p><p>If you need an extension of the deadline, please contact me. I look forward to hearing from you.</p><p>Thank you in advance and kind regards,</p>{$pressSignature}'),(39,'REVIEW_COMPLETE','en','Review Completed','Review complete: {$reviewerName} recommends {$reviewRecommendation} for #{$submissionId} {$authorsShort} — {$submissionTitle}','<p>Dear {$recipientName},</p><p>{$reviewerName} completed the following review:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — {$submissionTitle}</a><br /><b>Recommendation:</b> {$reviewRecommendation}<br /><b>Type:</b> {$reviewMethod}</p><p>Login to <a href=\"{$submissionUrl}\">view all files and comments</a> provided by this reviewer.</p>'),(41,'REVIEW_EDIT','en','Review Edited','Your review assignment has been changed for {$pressName}','<p>Dear {$recipientName},</p><p>An editor has made changes to your review assignment for {$pressName}. Please review the details below and let us know if you have any questions.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a><br /><b>Type:</b> {$reviewMethod}<br /><b>Accept or Decline By:</b> {$responseDueDate}<br /><b>Submit Review By:</b> {$reviewDueDate}</p><p>You can login to <a href=\"{$reviewAssignmentUrl}\">complete this review</a> at any time.</p>'),(43,'EDITOR_DECISION_ACCEPT','en','Submission Accepted','Your submission has been accepted to {$pressName}','<p>Dear {$recipientName},</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, {$submissionTitle}, to meet or exceed our expectations. We are excited to publish your piece in {$pressName} and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for {$pressName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),(45,'EDITOR_DECISION_SEND_TO_INTERNAL','en','Sent to Internal Review','Your submission has been sent for internal review','<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>'),(47,'EDITOR_DECISION_SEND_TO_EXTERNAL','en','Sent to Review','Your submission has been sent for review','<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>{$reviewTypeDescription} You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>'),(49,'EDITOR_DECISION_SEND_TO_PRODUCTION','en','Sent to Production','Next steps for publishing your submission','<p>Dear {$recipientName},</p><p>I am writing from {$pressName} to let you know that the editing of your submission, {$submissionTitle}, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),(51,'EDITOR_DECISION_REVISIONS','en','Revisions Requested','Your submission has been reviewed and we encourage you to submit revisions','<p>Dear {$recipientName},</p><p>Your submission {$submissionTitle} has been reviewed and we would like to encourage you to submit revisions that address the reviewers\' comments. An editor will review these revisions and if they address the concerns adequately, your submission may be accepted for publication.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point in the reviewers\' comments and identify what changes you have made. If you find any of the reviewer\'s comments to be unjustified or inappropriate, please explain your perspective.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments at your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),(53,'EDITOR_DECISION_RESUBMIT','en','Resubmit for Review','Your submission has been reviewed - please revise and resubmit','<p>Dear {$recipientName},</p><p>After reviewing your submission, {$submissionTitle}, the reviewers have recommended that your submission cannot be accepted for publication in its current form. However, we would like to encourage you to submit a revised version that addresses the reviewers\' comments. Your revisions will be reviewed by an editor and may be sent out for another round of peer review.</p><p>Please note that resubmitting your work does not guarantee that it will be accepted.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point and identify what changes you have made. If you find any of the reviewer\'s comments inappropriate, please explain your perspective. If you have questions about the recommendations in your review, please include these in your response.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments <a href=\"{$authorSubmissionUrl}\">at your submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),(55,'EDITOR_DECISION_DECLINE','en','Submission Declined','Your submission has been declined','<p>Dear {$recipientName},</p><p>While we appreciate receiving your submission, we are unable to accept {$submissionTitle} for publication on the basis of the comments from reviewers.</p><p>The reviewers\' comments are included at the bottom of this email.</p><p>Thank you for submitting to {$pressName}. Although it is disappointing to have a submission declined, I hope you find the reviewers\' comments to be constructive and helpful.</p><p>You are now free to submit the work elsewhere if you choose to do so.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),(57,'EDITOR_DECISION_INITIAL_DECLINE','en','Submission Declined (Pre-Review)','Your submission has been declined','<p>Dear {$recipientName},</p><p>I’m sorry to inform you that, after reviewing your submission, {$submissionTitle}, the editor has found that it does not meet our requirements for publication in {$pressName}.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p>{$signature}'),(59,'EDITOR_RECOMMENDATION','en','Recommendation Made','Editor Recommendation','<p>Dear {$recipientName},</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission {$submissionTitle}.</p><p>My recommendation is: {$recommendation}.</p><p>Please visit the submission\'s <a href=\"{$submissionUrl}\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>{$senderName}</p>'),(61,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','en','Notify Other Authors','An update regarding your submission','<p>The following email was sent to {$submittingAuthorName} from {$pressName} regarding {$submissionTitle}.</p>\n<p>You are receiving a copy of this notification because you are identified as an author of the submission. Any instructions in the message below are intended for the submitting author, {$submittingAuthorName}, and no action is required of you at this time.</p>\n\n{$messageToSubmittingAuthor}'),(63,'EDITOR_DECISION_NOTIFY_REVIEWERS','en','Notify Reviewers of Decision','Thank you for your review','<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, {$submissionTitle}, for {$pressName}. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>{$decisionDescription}</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$pressName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>'),(65,'EDITOR_DECISION_NEW_ROUND','en','New Review Round Initiated','Your submission has been sent for another round of review','<p>Dear {$recipientName},</p>\n<p>Your revised submission, {$submissionTitle}, has been sent for a new round of peer review. \nYou will hear from us with feedback from the reviewers and information about the next steps.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),(67,'EDITOR_DECISION_REVERT_DECLINE','en','Reinstate Declined Submission','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will complete the round of review and you will be notified when a \ndecision is made.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),(69,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','en','Reinstate Submission Declined Without Review','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will look further at your submission before deciding whether to decline \nthe submission or send it for review.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),(71,'EDITOR_DECISION_SKIP_REVIEW','en','Submission Accepted (Without Review)','Your submission has been sent for copyediting','<p>Dear {$recipientName},</p>\n<p>I am pleased to inform you that we have decided to accept your submission without peer review. We found your submission, {$submissionTitle}, to meet our expectations, and we do not require that work of this type undergo peer review. We are excited to publish your piece in {$pressName} and we thank you for choosing our press as a venue for your work.</p>\n<p>Your submission will soon be published on the press site for {$pressName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on your efforts.</p>\n<p>Your submission will now undergo copy editing and formatting to prepare it for publication. </p>\n<p>You will shortly receive further instructions.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),(73,'EDITOR_DECISION_BACK_FROM_PRODUCTION','en','Submission Sent Back to Copyediting','Your submission has been sent back to copyediting','<p>Dear {$recipientName},</p><p>Your submission, {$submissionTitle}, has been sent back to the copyediting stage, where it will undergo further copyediting and formatting to prepare it for publication.</p><p>Occasionally, a submission is sent to the production stage before it is ready for the final galleys to be prepared for publication. Your submission is still forthcoming. I apologize for any confusion.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We will contact you if we need any further assistance.</p><p>Kind regards,</p><p>{$signature}</p>'),(75,'EDITOR_DECISION_BACK_FROM_COPYEDITING','en','Submission Sent Back from Copyediting','Your submission has been sent back to review','<p>Dear {$recipientName},</p><p>Your submission, {$submissionTitle}, has been sent back to the review stage. It will undergo further review before it can be accepted for publication.</p><p>Occasionally, a decision to accept a submission will be recorded accidentally in our system and we must send it back to review. I apologize for any confusion this has caused. We will work to complete any further review quickly so that you have a final decision as soon as possible.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>'),(77,'EDITOR_DECISION_CANCEL_REVIEW_ROUND','en','Review Round Cancelled','A review round for your submission has been cancelled','<p>Dear {$recipientName},</p><p>We recently opened a new review round for your submission, {$submissionTitle}. We are closing this review round now.</p><p>Occasionally, a decision to open a round of review will be recorded accidentally in our system and we must cancel this review round. I apologize for any confusion this may have caused.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>'),(79,'REVISED_VERSION_NOTIFY','en','Revised Version Notification','Revised Version Uploaded','<p>Dear {$recipientName},</p><p>The author has uploaded revisions for the submission, <b>{$authorsShort} — {$submissionTitle}</b>. <p>As an assigned editor, we ask that you login and <a href=\"{$submissionUrl}\">view the revisions</a> and make a decision to accept, decline or send the submission for further review.</p><br><br>—<br>This is an automated message from <a href=\"{$pressUrl}\">{$pressName}</a>.'),(81,'STATISTICS_REPORT_NOTIFICATION','en','Statistics Report Notification','Editorial activity for {$month}, {$year}','\n{$recipientName}, <br />\n<br />\nYour press health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the press to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published book stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$pressSignature}'),(83,'ANNOUNCEMENT','en','New Announcement','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href=\"{$announcementUrl}\">full announcement</a>.'),(85,'DISCUSSION_NOTIFICATION_SUBMISSION','en','Discussion (Submission)','A message regarding {$pressName}','Please enter your message.'),(87,'DISCUSSION_NOTIFICATION_REVIEW','en','Discussion (Review)','A message regarding {$pressName}','Please enter your message.'),(89,'DISCUSSION_NOTIFICATION_COPYEDITING','en','Discussion (Copyediting)','A message regarding {$pressName}','Please enter your message.'),(91,'DISCUSSION_NOTIFICATION_PRODUCTION','en','Discussion (Production)','A message regarding {$pressName}','Please enter your message.'),(93,'COPYEDIT_REQUEST','en','Request Copyedit','Submission {$submissionId} is ready to be copyedited for {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready to be copyedited:</p><p><a href\"{$submissionUrl}\">{$submissionId} — {$submissionTitle}</a><br />{$pressName}</p><p>Please follow these steps to complete this task:</p><ol><li>Click on the Submission URL below.</li><li>Open any files available under Draft Files and edit the files. Use the Copyediting Discussions area if you need to contact the editor(s) or author(s).</li><li>Save the copyedited file(s) and upload them to the Copyedited panel.</li><li>Use the Copyediting Discussions to notify the editor(s) that all files have been prepared, and that the Production process may begin.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to {$pressName}.</p><p>Kind regards,</p>{$signature}'),(95,'EDITOR_ASSIGN_SUBMISSION','en','Assign Editor','You have been assigned as an editor on a submission to {$pressName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>If you find the submission to be relevant for {$pressName}, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$pressSignature}'),(97,'EDITOR_ASSIGN_REVIEW','en','Assign Editor','You have been assigned as an editor on a submission to {$pressName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the review stage.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the submission</a> and assign qualified reviewers. You can assign a reviewer by clicking \"Add Reviewer\".</p><p>Thank you in advance.</p><p>Kind regards,</p>{$signature}'),(99,'EDITOR_ASSIGN_PRODUCTION','en','Assign Editor','You have been assigned as an editor on a submission to {$pressName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the production stage.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the submission</a>. Once production-ready files are available, upload them under the <strong>Publication > Publication Formats</strong> section.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$signature}'),(101,'LAYOUT_REQUEST','en','Ready for Production','Submission {$submissionId} is ready for production at {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready for layout editing:</p><p><a href=\"{$submissionUrl}\">{$submissionId} {$submissionTitle}</a><br />{$pressName}</p><ol><li>Click on the Submission URL above.</li><li>Download the Production Ready files and use them to create the galleys according to the press\'s standards.</li><li>Upload the galleys to the Publication Formats section of the submission.</li><li>Use the Production Discussions to notify the editor that the galleys are ready.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.</p><p>Kind regards,</p>{$signature}'),(103,'LAYOUT_COMPLETE','en','Galleys Complete','Galleys Complete','<p>Dear {$recipientName},<p><p>Galleys have now been prepared for the following submission and are ready for final review.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$pressName}</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p><p>{$senderName}</p>'),(105,'INDEX_REQUEST','en','Index Requested','Request Index','{$recipientName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$pressName} now needs indexes created by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and use the Page Proofs file to create the galleys according to press standards.<br />\n3. Send the COMPLETE email to the editor.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.<br />\n<br />\n{$signature}'),(107,'INDEX_COMPLETE','en','Index Completed','Index Galleys Complete','{$recipientName}:<br />\n<br />\nIndexes have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$pressName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$senderName}'),(109,'VERSION_CREATED','en','Version Created','A new version was created for {$submissionTitle}','<p>Dear {$recipientName}, </p><p>This is an automated message to inform you that a new version of your submission, {$submissionTitle}, was created. You can view this version from your submission dashboard at the following link:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a></p><hr><p>This is an automatic email sent from <a href=\"{$pressUrl}\">{$pressName}</a>.</p>'),(111,'EDITORIAL_REMINDER','en','Editorial Reminder','Outstanding editorial tasks for {$pressName}','<p>Dear {$recipientName},</p><p>You are currently assigned to {$numberOfSubmissions} submissions in <a href=\"{$pressUrl}\">{$pressName}</a>. The following submissions are <b>waiting for your response</b>.</p>{$outstandingTasks}<p>View all of your assignments in your <a href=\"{$submissionsUrl}\">submission dashboard</a>.</p><p>If you have any questions about your assignments, please contact {$contactName} at {$contactEmail}.</p>'),(113,'SUBMISSION_SAVED_FOR_LATER','en','Submission Saved for Later','Resume your submission to {$pressName}','<p>Dear {$recipientName},</p><p>Your submission details have been saved in our system, but it has not yet been submitted for consideration. You can return to complete your submission at any time by following the link below.</p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — {$submissionTitle}</a></p><hr><p>This is an automated email from <a href=\"{$pressUrl}\">{$pressName}</a>.</p>'),(115,'SUBMISSION_NEEDS_EDITOR','en','Submission Needs Editor','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear {$recipientName},</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"{$pressUrl}\">{$pressName}</a>.</p>'),(117,'MANUAL_PAYMENT_NOTIFICATION','en','Manual Payment Notify','Manual Payment Notification','A manual payment needs to be processed for the press {$pressName} and the user {$senderName} (username &quot;{$senderUsername}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$paymentName}&quot;.<br />\nThe cost is {$paymentAmount} ({$paymentCurrencyCode}).<br />\n<br />\nThis email was generated by the Open Monograph Press Manual Payment plugin.'),(119,'PASSWORD_RESET_CONFIRM','fr_CA','','Confirmation de réinitialisation du mot de passe','Nous avons reçu une requête de réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette requête, veuillez ignorer ce courriel et votre mot de passe demeurera le même. Si vous souhaitez modifier votre mot de passe, cliquez sur l\'adresse URL ci-dessous.<br />\n<br />\nModifier mon mot de passe: {$lostPasswordUrl}<br />\n<br />\n{$siteContactName}'),(120,'USER_REGISTER','fr_CA','','Inscription à la presse','{$recipientName}<br />\n<br />\nVous êtes désormais inscrit à la presse {$pressName}. Ce courriel contient votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin pour tous vos travaux au sein de la presse. Vous pouvez demander que l\'on retire votre nom de la liste des utilisateurs en tout temps. Il suffit de me contacter.<br />\n<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$signature}'),(121,'USER_VALIDATE_CONTEXT','fr_CA','','',''),(122,'USER_VALIDATE_SITE','fr_CA','','',''),(123,'REVIEWER_REGISTER','fr_CA','','Inscription à titre d\'évaluateur pour la presse {$pressName}','En raison de votre expertise, nous avons ajouté votre nom à notre base de données d\'évaluateurs pour la presse {$pressName}. Ceci ne vous oblige à rien, mais nous permet simplement de vous approcher si nous recevons une soumission que vous pourriez évaluer. Après avoir reçu une demande d\'évaluation, vous aurez la possibilité de lire le titre et le résumé de l\'article en question. Vous serez toujours libre d\'accepter ou de refuser l\'invitation. Vous pouvez demander que l\'on retire votre nom de notre liste d\'évaluateurs en tout temps.<br />\n<br />\nVoici votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin dans tous vos échanges avec la presse à travers son site Web. Vous pourriez, par exemple, mettre votre profil à jour, y compris vos champs d\'intérêt en ce qui concerne l\'évaluation des articles.<br />\n<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$signature}'),(124,'SUBMISSION_ACK','fr_CA','','Accusé de réception de la soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$pressName}. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d\'édition en accédant au site Web de la revue :<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$pressSignature}'),(125,'SUBMISSION_ACK_NOT_USER','fr_CA','','Accusé de réception de la soumission','<p>Bonjour,</p><p>Le manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à la revue {$pressName}.</p><p>Si vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à la revue {$pressName} pour la publication de vos travaux.</p><p>Cordialement,</p>{$pressSignature}'),(126,'EDITOR_ASSIGN','fr_CA','','Travail éditorial','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; à la presse {$pressName} vous a été assignée. En tant que rédacteur en chef, vous devrez superviser le processus éditorial de cette soumission.<br />\n<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci,'),(127,'REVIEW_CANCEL','fr_CA','','Annulation de la requête d\'évaluation','{$recipientName}:<br />\n<br />\n<br />\nNous avons décidé d\'annuler notre requête d\'évaluation pour la soumission &quot;{$submissionTitle}&quot; de la presse {$pressName}. Nous vous prions de nous excuser pour tout inconvénient que cette décision pourrait occasionner et nous espérons que vous serez en mesure d\'évaluer une soumission dans un avenir prochain.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à me contacter.'),(128,'REVIEW_REINSTATE','fr_CA','','',''),(129,'REVIEW_RESEND_REQUEST','fr_CA','','',''),(130,'REVIEW_REQUEST','fr_CA','','Requête d\'évaluation d\'un manuscrit','Bonjour {$recipientName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nVeuillez ouvrir une session sur le site Web de la presse d\'ici le {$responseDueDate} pour indiquer si vous serez en mesure d\'évaluer l\'article ou non. Ceci vous permettra également d\'accéder à la soumission, et de saisir votre évaluation et vos recommandations.<br />\n<br />\n<br />\nL\'évaluation doit être terminée d\'ici le {$reviewDueDate}.<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci de votre intérêt à évaluer des articles pour notre presse.<br />\n<br />\n{$signature}<br />\n'),(131,'REVIEW_REQUEST_SUBSEQUENT','fr_CA','','',''),(132,'REVIEW_RESPONSE_OVERDUE_AUTO','fr_CA','','',''),(133,'REVIEW_CONFIRM','fr_CA','','Acceptation d\'évaluation','Rédacteurs-trices,<br />\n<br />\nJe suis en mesure d\'évaluer la soumission intitulée « {$submissionTitle} » pour la revue {$pressName}. Je vous remercie d\'avoir pensé à moi. Je devrais être en mesure de compléter l\'évaluation pour la date du {$reviewDueDate}, voire avant.<br />\n<br />\n{$senderName}'),(134,'REVIEW_DECLINE','fr_CA','','Ne peux pas évaluer','Éditeurs:<br />\n<br />\nMalheureusement, je ne pourrai pas évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Merci de m\'avoir invité à évaluer cet article et n\'hésitez pas à me contacter dans un avenir prochain.<br />\n<br />\n{$senderName}'),(135,'REVIEW_ACK','fr_CA','','Accusé de réception de l\'évaluation d\'une soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir évalué la soumission intitulée « {$submissionTitle} » pour la revue {$pressName}. Nous vous sommes reconnaissants de votre contribution à la qualité des travaux que nous publions.'),(136,'REVIEW_REMIND','fr_CA','','Rappel d\'évaluation','{$recipientName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoyés par courriel. {$lostPasswordUrl}<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Nous vous prions d\'agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$signature}'),(137,'REVIEW_REMIND_AUTO','fr_CA','','Rappel d\'évaluation','{$recipientName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Ce courriel a été généré et envoyé automatiquement parce que vous avez dépassé la date d\'échéance. Toutefois, nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoyés par courriel. {$lostPasswordUrl}<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Veuillez agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$pressSignature}'),(138,'REVIEW_COMPLETE','fr_CA','Évaluation terminée','',''),(139,'REVIEW_EDIT','fr_CA','','',''),(140,'EDITOR_DECISION_ACCEPT','fr_CA','','Décision du rédacteur en chef','{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$pressName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}'),(141,'EDITOR_DECISION_SEND_TO_INTERNAL','fr_CA','','',''),(142,'EDITOR_DECISION_SEND_TO_EXTERNAL','fr_CA','','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est d\'envoyer votre soumission en évaluation.<br />\n<br />\nURL de la soumission : {$submissionUrl}'),(143,'EDITOR_DECISION_SEND_TO_PRODUCTION','fr_CA','','Décision du rédacteur','{$authors},<br />\n<br />\nL\'édition de votre soumission « {$submissionTitle} » est complétée. Nous l\'envoyons maintenant en production.<br />\n<br />\nURL de la soumission : {$submissionUrl}'),(144,'EDITOR_DECISION_REVISIONS','fr_CA','','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de vous demander d\'apporter des révisions à votre soumission.'),(145,'EDITOR_DECISION_RESUBMIT','fr_CA','','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de vous demander d\'apporter des révisions à votre soumission et de la soumettre à nouveau.'),(146,'EDITOR_DECISION_DECLINE','fr_CA','','Décision du rédacteur','{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de refuser votre soumission.'),(147,'EDITOR_DECISION_INITIAL_DECLINE','fr_CA','','Décision du rédacteur','\n			{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à  la revue {$pressName}.<br />\n<br />\nNotre décision est de refuser votre soumission.'),(148,'EDITOR_RECOMMENDATION','fr_CA','','Recommandation du rédacteur','{$editors},<br />\n<br />\nLa recommandation concernant la soumission « {$submissionTitle} » à la revue {$pressName} est de : {$recommendation}'),(149,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','fr_CA','','',''),(150,'EDITOR_DECISION_NOTIFY_REVIEWERS','fr_CA','','',''),(151,'EDITOR_DECISION_NEW_ROUND','fr_CA','','',''),(152,'EDITOR_DECISION_REVERT_DECLINE','fr_CA','','',''),(153,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','fr_CA','','',''),(154,'EDITOR_DECISION_SKIP_REVIEW','fr_CA','','',''),(155,'EDITOR_DECISION_BACK_FROM_PRODUCTION','fr_CA','','',''),(156,'EDITOR_DECISION_BACK_FROM_COPYEDITING','fr_CA','','',''),(157,'EDITOR_DECISION_CANCEL_REVIEW_ROUND','fr_CA','','',''),(158,'REVISED_VERSION_NOTIFY','fr_CA','','',''),(159,'STATISTICS_REPORT_NOTIFICATION','fr_CA','','',''),(160,'ANNOUNCEMENT','fr_CA','','',''),(161,'DISCUSSION_NOTIFICATION_SUBMISSION','fr_CA','','Un message à propos de la revue {$pressName}','Prière de saisir votre message.'),(162,'DISCUSSION_NOTIFICATION_REVIEW','fr_CA','','Un message à propos de la revue {$pressName}','Prière de saisir votre message.'),(163,'DISCUSSION_NOTIFICATION_COPYEDITING','fr_CA','','Un message à propos de la revue {$pressName}','Prière de saisir votre message.'),(164,'DISCUSSION_NOTIFICATION_PRODUCTION','fr_CA','','Un message à propos de la revue {$pressName}','Prière de saisir votre message.'),(165,'COPYEDIT_REQUEST','fr_CA','','Demande de révision d\'une soumission','{$recipientName},<br />\n<br />\nJ\'aimerais que vous effectuiez la révision du manuscrit intitulé « {$submissionTitle} » pour la revue {$pressName} à l\'aide des étapes suivantes.<br />\n1. Cliquer sur l\'URL de la soumission ci-dessous.<br />\n2. Ouvrir le(s) fichier(s) disponible(s) sous Fichiers des ébauches finales et effectuer votre révision, tout en ajoutant des discussions sur la révision, le cas échéant.<br />\n3. Enregistrer le(s) fichier(s) révisé(s) et le(s) téléverser dans la section Version(s) révisée(s).<br />\n4. Informer le,la rédacteur-trice que tous les fichiers ont été révisés et que l\'étape de production peut débuter.<br />\n<br />\nURL de la revue {$pressName} : {$pressUrl}<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}'),(166,'EDITOR_ASSIGN_SUBMISSION','fr_CA','','Travail éditorial','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; à la presse {$pressName} vous a été assignée. En tant que rédacteur en chef, vous devrez superviser le processus éditorial de cette soumission.<br />\n<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci,'),(167,'EDITOR_ASSIGN_REVIEW','fr_CA','','Travail éditorial',''),(168,'EDITOR_ASSIGN_PRODUCTION','fr_CA','','Travail éditorial',''),(169,'LAYOUT_REQUEST','fr_CA','','Requête des épreuves en placard','{$recipientName}:<br />\n<br />\nIl faut maintenant préparer les épreuves en placard de la soumission &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Pour ce faire, veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez le fichier Version de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir contribué à cette presse.'),(170,'LAYOUT_COMPLETE','fr_CA','','Épreuves en placard complétées','{$recipientName}:<br />\n<br />\nLes épreuves en placard du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$pressName} ont été préparées et peuvent être révisées.<br />\n<br />\nSi vous avez questions, n\'hésitez pas à me contacter.<br />\n<br />\n{$senderName}'),(171,'INDEX_REQUEST','fr_CA','','Requête d\'indexage','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; par la presse {$pressName} doit désormais être indexée. Veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez les fichiers d\'épreuves de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir contribué à cette presse.<br />\n<br />\n{$signature}'),(172,'INDEX_COMPLETE','fr_CA','','Indexage des épreuves en placard complété','{$recipientName}:<br />\n<br />\nLes index du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$pressName} sont prêts et peuvent être révisés.<br />\n<br />\nSi vous avez questions, n\'hésitez pas à me contacter.<br />\n<br />\n{$signatureFullName}'),(173,'VERSION_CREATED','fr_CA','Version créée','',''),(174,'EDITORIAL_REMINDER','fr_CA','','',''),(175,'SUBMISSION_SAVED_FOR_LATER','fr_CA','','',''),(176,'SUBMISSION_NEEDS_EDITOR','fr_CA','','',''),(177,'MANUAL_PAYMENT_NOTIFICATION','fr_CA','','','');
/*!40000 ALTER TABLE `email_templates_default_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_settings`
--

DROP TABLE IF EXISTS `email_templates_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_settings` (
  `email_template_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`email_template_setting_id`),
  UNIQUE KEY `email_templates_settings_unique` (`email_id`,`locale`,`setting_name`),
  KEY `email_templates_settings_email_id` (`email_id`),
  CONSTRAINT `email_templates_settings_email_id` FOREIGN KEY (`email_id`) REFERENCES `email_templates` (`email_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about custom email templates, including localized properties such as the subject and body.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL COMMENT 'NULL if it''s system or automated event',
  `date_logged` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_translated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `event_log_user_id` (`user_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `event_log_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A log of all events related to an object like a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,19,'2023-06-04 21:55:37',268435458,'submission.event.general.metadataUpdated',0),(2,1048585,1,19,'2023-06-04 21:55:38',268435458,'submission.event.general.metadataUpdated',0),(3,515,1,19,'2023-06-04 21:55:41',1342177281,'submission.event.fileUploaded',0),(4,1048585,1,19,'2023-06-04 21:55:41',1342177288,'submission.event.fileRevised',0),(5,515,1,19,'2023-06-04 21:55:42',1342177296,'submission.event.fileEdited',0),(6,515,2,19,'2023-06-04 21:55:42',1342177281,'submission.event.fileUploaded',0),(7,1048585,1,19,'2023-06-04 21:55:42',1342177288,'submission.event.fileRevised',0),(8,515,2,19,'2023-06-04 21:55:43',1342177296,'submission.event.fileEdited',0),(9,515,3,19,'2023-06-04 21:55:44',1342177281,'submission.event.fileUploaded',0),(10,1048585,1,19,'2023-06-04 21:55:44',1342177288,'submission.event.fileRevised',0),(11,515,3,19,'2023-06-04 21:55:44',1342177296,'submission.event.fileEdited',0),(12,1048585,1,19,'2023-06-04 21:56:03',268435457,'submission.event.submissionSubmitted',0),(13,1048585,1,3,'2023-06-04 21:56:18',805306371,'editor.submission.decision.sendExternalReview.log',0),(14,515,4,3,'2023-06-04 21:56:18',1342177281,'submission.event.fileUploaded',0),(15,1048585,1,3,'2023-06-04 21:56:18',1342177288,'submission.event.fileRevised',0),(16,515,5,3,'2023-06-04 21:56:18',1342177281,'submission.event.fileUploaded',0),(17,1048585,1,3,'2023-06-04 21:56:18',1342177288,'submission.event.fileRevised',0),(18,515,6,3,'2023-06-04 21:56:18',1342177281,'submission.event.fileUploaded',0),(19,1048585,1,3,'2023-06-04 21:56:18',1342177288,'submission.event.fileRevised',0),(20,1048585,1,3,'2023-06-04 21:56:28',1073741825,'log.review.reviewerAssigned',0),(21,1048585,1,3,'2023-06-04 21:56:35',805306371,'editor.submission.decision.accept.log',0),(22,1048585,1,3,'2023-06-04 21:56:45',268435459,'submission.event.participantAdded',0),(23,1048585,2,20,'2023-06-04 21:56:58',268435458,'submission.event.general.metadataUpdated',0),(24,1048585,2,20,'2023-06-04 21:56:59',268435458,'submission.event.general.metadataUpdated',0),(25,1048585,2,20,'2023-06-04 21:57:12',268435458,'submission.event.general.metadataUpdated',0),(26,515,7,20,'2023-06-04 21:57:12',1342177281,'submission.event.fileUploaded',0),(27,1048585,2,20,'2023-06-04 21:57:12',1342177288,'submission.event.fileRevised',0),(28,515,7,20,'2023-06-04 21:57:13',1342177296,'submission.event.fileEdited',0),(29,515,8,20,'2023-06-04 21:57:14',1342177281,'submission.event.fileUploaded',0),(30,1048585,2,20,'2023-06-04 21:57:14',1342177288,'submission.event.fileRevised',0),(31,515,8,20,'2023-06-04 21:57:14',1342177296,'submission.event.fileEdited',0),(32,515,9,20,'2023-06-04 21:57:15',1342177281,'submission.event.fileUploaded',0),(33,1048585,2,20,'2023-06-04 21:57:15',1342177288,'submission.event.fileRevised',0),(34,515,9,20,'2023-06-04 21:57:15',1342177296,'submission.event.fileEdited',0),(35,515,10,20,'2023-06-04 21:57:16',1342177281,'submission.event.fileUploaded',0),(36,1048585,2,20,'2023-06-04 21:57:16',1342177288,'submission.event.fileRevised',0),(37,515,10,20,'2023-06-04 21:57:17',1342177296,'submission.event.fileEdited',0),(38,515,11,20,'2023-06-04 21:57:17',1342177281,'submission.event.fileUploaded',0),(39,1048585,2,20,'2023-06-04 21:57:17',1342177288,'submission.event.fileRevised',0),(40,515,11,20,'2023-06-04 21:57:18',1342177296,'submission.event.fileEdited',0),(41,515,11,20,'2023-06-04 21:57:19',1342177282,'submission.event.fileDeleted',0),(42,1048585,2,20,'2023-06-04 21:59:12',268435457,'submission.event.submissionSubmitted',0),(43,1048585,2,3,'2023-06-04 21:59:44',805306371,'editor.submission.decision.sendExternalReview.log',0),(44,515,12,3,'2023-06-04 21:59:45',1342177281,'submission.event.fileUploaded',0),(45,1048585,2,3,'2023-06-04 21:59:45',1342177288,'submission.event.fileRevised',0),(46,515,13,3,'2023-06-04 21:59:45',1342177281,'submission.event.fileUploaded',0),(47,1048585,2,3,'2023-06-04 21:59:45',1342177288,'submission.event.fileRevised',0),(48,515,14,3,'2023-06-04 21:59:45',1342177281,'submission.event.fileUploaded',0),(49,1048585,2,3,'2023-06-04 21:59:45',1342177288,'submission.event.fileRevised',0),(50,515,15,3,'2023-06-04 21:59:45',1342177281,'submission.event.fileUploaded',0),(51,1048585,2,3,'2023-06-04 21:59:45',1342177288,'submission.event.fileRevised',0),(52,1048585,2,3,'2023-06-04 22:00:00',1073741825,'log.review.reviewerAssigned',0),(53,1048585,2,3,'2023-06-04 22:00:09',1073741825,'log.review.reviewerAssigned',0),(54,1048585,3,21,'2023-06-04 22:00:22',268435458,'submission.event.general.metadataUpdated',0),(55,1048585,3,21,'2023-06-04 22:00:23',268435458,'submission.event.general.metadataUpdated',0),(56,515,16,21,'2023-06-04 22:00:26',1342177281,'submission.event.fileUploaded',0),(57,1048585,3,21,'2023-06-04 22:00:26',1342177288,'submission.event.fileRevised',0),(58,515,16,21,'2023-06-04 22:00:26',1342177296,'submission.event.fileEdited',0),(59,515,17,21,'2023-06-04 22:00:27',1342177281,'submission.event.fileUploaded',0),(60,1048585,3,21,'2023-06-04 22:00:27',1342177288,'submission.event.fileRevised',0),(61,515,17,21,'2023-06-04 22:00:28',1342177296,'submission.event.fileEdited',0),(62,515,18,21,'2023-06-04 22:00:28',1342177281,'submission.event.fileUploaded',0),(63,1048585,3,21,'2023-06-04 22:00:28',1342177288,'submission.event.fileRevised',0),(64,515,18,21,'2023-06-04 22:00:29',1342177296,'submission.event.fileEdited',0),(65,515,19,21,'2023-06-04 22:00:30',1342177281,'submission.event.fileUploaded',0),(66,1048585,3,21,'2023-06-04 22:00:30',1342177288,'submission.event.fileRevised',0),(67,515,19,21,'2023-06-04 22:00:30',1342177296,'submission.event.fileEdited',0),(68,515,20,21,'2023-06-04 22:00:31',1342177281,'submission.event.fileUploaded',0),(69,1048585,3,21,'2023-06-04 22:00:31',1342177288,'submission.event.fileRevised',0),(70,515,20,21,'2023-06-04 22:00:31',1342177296,'submission.event.fileEdited',0),(71,1048585,3,21,'2023-06-04 22:01:07',268435457,'submission.event.submissionSubmitted',0),(72,1048585,4,22,'2023-06-04 22:01:17',268435458,'submission.event.general.metadataUpdated',0),(73,1048585,4,22,'2023-06-04 22:01:18',268435458,'submission.event.general.metadataUpdated',0),(74,515,21,22,'2023-06-04 22:01:21',1342177281,'submission.event.fileUploaded',0),(75,1048585,4,22,'2023-06-04 22:01:21',1342177288,'submission.event.fileRevised',0),(76,515,21,22,'2023-06-04 22:01:21',1342177296,'submission.event.fileEdited',0),(77,515,22,22,'2023-06-04 22:01:22',1342177281,'submission.event.fileUploaded',0),(78,1048585,4,22,'2023-06-04 22:01:22',1342177288,'submission.event.fileRevised',0),(79,515,22,22,'2023-06-04 22:01:22',1342177296,'submission.event.fileEdited',0),(80,515,23,22,'2023-06-04 22:01:23',1342177281,'submission.event.fileUploaded',0),(81,1048585,4,22,'2023-06-04 22:01:23',1342177288,'submission.event.fileRevised',0),(82,515,23,22,'2023-06-04 22:01:23',1342177296,'submission.event.fileEdited',0),(83,515,24,22,'2023-06-04 22:01:24',1342177281,'submission.event.fileUploaded',0),(84,1048585,4,22,'2023-06-04 22:01:24',1342177288,'submission.event.fileRevised',0),(85,515,24,22,'2023-06-04 22:01:25',1342177296,'submission.event.fileEdited',0),(86,1048585,4,22,'2023-06-04 22:01:52',268435457,'submission.event.submissionSubmitted',0),(87,1048585,4,3,'2023-06-04 22:02:06',805306371,'editor.submission.decision.sendInternalReview.log',0),(88,515,25,3,'2023-06-04 22:02:07',1342177281,'submission.event.fileUploaded',0),(89,1048585,4,3,'2023-06-04 22:02:07',1342177288,'submission.event.fileRevised',0),(90,515,26,3,'2023-06-04 22:02:07',1342177281,'submission.event.fileUploaded',0),(91,1048585,4,3,'2023-06-04 22:02:07',1342177288,'submission.event.fileRevised',0),(92,515,27,3,'2023-06-04 22:02:07',1342177281,'submission.event.fileUploaded',0),(93,1048585,4,3,'2023-06-04 22:02:07',1342177288,'submission.event.fileRevised',0),(94,515,28,3,'2023-06-04 22:02:07',1342177281,'submission.event.fileUploaded',0),(95,1048585,4,3,'2023-06-04 22:02:07',1342177288,'submission.event.fileRevised',0),(96,1048585,4,3,'2023-06-04 22:02:17',1073741825,'log.review.reviewerAssigned',0),(97,1048585,4,3,'2023-06-04 22:02:23',805306371,'editor.submission.decision.sendExternalReview.log',0),(98,1048585,4,3,'2023-06-04 22:02:33',1073741825,'log.review.reviewerAssigned',0),(99,1048585,4,3,'2023-06-04 22:02:39',805306371,'editor.submission.decision.accept.log',0),(100,1048585,4,3,'2023-06-04 22:02:49',268435459,'submission.event.participantAdded',0),(101,1048585,4,3,'2023-06-04 22:02:56',805306371,'editor.submission.decision.sendToProduction.log',0),(102,1048585,4,3,'2023-06-04 22:03:07',268435459,'submission.event.participantAdded',0),(103,1048585,4,3,'2023-06-04 22:03:14',268435474,'submission.event.publicationFormatCreated',NULL),(104,1048585,5,23,'2023-06-04 22:03:23',268435458,'submission.event.general.metadataUpdated',0),(105,1048585,5,23,'2023-06-04 22:03:24',268435458,'submission.event.general.metadataUpdated',0),(106,515,29,23,'2023-06-04 22:03:27',1342177281,'submission.event.fileUploaded',0),(107,1048585,5,23,'2023-06-04 22:03:27',1342177288,'submission.event.fileRevised',0),(108,515,29,23,'2023-06-04 22:03:27',1342177296,'submission.event.fileEdited',0),(109,515,30,23,'2023-06-04 22:03:28',1342177281,'submission.event.fileUploaded',0),(110,1048585,5,23,'2023-06-04 22:03:28',1342177288,'submission.event.fileRevised',0),(111,515,30,23,'2023-06-04 22:03:28',1342177296,'submission.event.fileEdited',0),(112,515,31,23,'2023-06-04 22:03:29',1342177281,'submission.event.fileUploaded',0),(113,1048585,5,23,'2023-06-04 22:03:29',1342177288,'submission.event.fileRevised',0),(114,515,31,23,'2023-06-04 22:03:29',1342177296,'submission.event.fileEdited',0),(115,515,32,23,'2023-06-04 22:03:30',1342177281,'submission.event.fileUploaded',0),(116,1048585,5,23,'2023-06-04 22:03:30',1342177288,'submission.event.fileRevised',0),(117,515,32,23,'2023-06-04 22:03:31',1342177296,'submission.event.fileEdited',0),(118,515,33,23,'2023-06-04 22:03:31',1342177281,'submission.event.fileUploaded',0),(119,1048585,5,23,'2023-06-04 22:03:31',1342177288,'submission.event.fileRevised',0),(120,515,33,23,'2023-06-04 22:03:32',1342177296,'submission.event.fileEdited',0),(121,515,34,23,'2023-06-04 22:03:33',1342177281,'submission.event.fileUploaded',0),(122,1048585,5,23,'2023-06-04 22:03:33',1342177288,'submission.event.fileRevised',0),(123,515,34,23,'2023-06-04 22:03:33',1342177296,'submission.event.fileEdited',0),(124,1048585,5,23,'2023-06-04 22:04:15',268435457,'submission.event.submissionSubmitted',0),(125,1048585,5,3,'2023-06-04 22:04:31',805306371,'editor.submission.decision.sendInternalReview.log',0),(126,515,35,3,'2023-06-04 22:04:31',1342177281,'submission.event.fileUploaded',0),(127,1048585,5,3,'2023-06-04 22:04:31',1342177288,'submission.event.fileRevised',0),(128,515,36,3,'2023-06-04 22:04:32',1342177281,'submission.event.fileUploaded',0),(129,1048585,5,3,'2023-06-04 22:04:32',1342177288,'submission.event.fileRevised',0),(130,515,37,3,'2023-06-04 22:04:32',1342177281,'submission.event.fileUploaded',0),(131,1048585,5,3,'2023-06-04 22:04:32',1342177288,'submission.event.fileRevised',0),(132,515,38,3,'2023-06-04 22:04:32',1342177281,'submission.event.fileUploaded',0),(133,1048585,5,3,'2023-06-04 22:04:32',1342177288,'submission.event.fileRevised',0),(134,515,39,3,'2023-06-04 22:04:32',1342177281,'submission.event.fileUploaded',0),(135,1048585,5,3,'2023-06-04 22:04:32',1342177288,'submission.event.fileRevised',0),(136,515,40,3,'2023-06-04 22:04:32',1342177281,'submission.event.fileUploaded',0),(137,1048585,5,3,'2023-06-04 22:04:32',1342177288,'submission.event.fileRevised',0),(138,1048585,5,3,'2023-06-04 22:04:43',1073741825,'log.review.reviewerAssigned',0),(139,1048585,5,3,'2023-06-04 22:04:50',805306371,'editor.submission.decision.sendExternalReview.log',0),(140,1048585,5,3,'2023-06-04 22:05:02',1073741825,'log.review.reviewerAssigned',0),(141,1048585,5,3,'2023-06-04 22:05:09',805306371,'editor.submission.decision.accept.log',0),(142,1048585,5,3,'2023-06-04 22:05:20',268435459,'submission.event.participantAdded',0),(143,1048585,5,3,'2023-06-04 22:05:28',805306371,'editor.submission.decision.sendToProduction.log',0),(144,1048585,5,3,'2023-06-04 22:05:40',268435459,'submission.event.participantAdded',0),(145,1048585,5,3,'2023-06-04 22:05:47',268435459,'submission.event.participantAdded',0),(146,1048585,5,3,'2023-06-04 22:05:53',268435474,'submission.event.publicationFormatCreated',NULL),(147,515,41,3,'2023-06-04 22:05:56',1342177281,'submission.event.fileUploaded',0),(148,1048585,5,3,'2023-06-04 22:05:56',1342177288,'submission.event.fileRevised',0),(149,1048585,5,3,'2023-06-04 22:05:59',268435464,'submission.event.publicationFormatPublished',0),(150,1048585,5,3,'2023-06-04 22:06:02',268435476,'submission.event.publicationFormatMadeAvailable',0),(151,515,41,3,'2023-06-04 22:06:04',1342177296,'submission.event.fileEdited',0),(152,515,41,3,'2023-06-04 22:06:04',1342177287,'submission.event.signoffSignoff',0),(153,515,41,3,'2023-06-04 22:06:07',1342177296,'submission.event.fileEdited',0),(154,1048585,5,3,'2023-06-04 22:06:09',268435462,'publication.event.published',0),(155,1048585,5,3,'2023-06-04 22:06:20',268435463,'publication.event.unpublished',0),(156,1048585,5,3,'2023-06-04 22:06:29',268435462,'publication.event.published',0),(157,1048585,6,24,'2023-06-04 22:06:38',268435458,'submission.event.general.metadataUpdated',0),(158,1048585,6,24,'2023-06-04 22:06:39',268435458,'submission.event.general.metadataUpdated',0),(159,515,42,24,'2023-06-04 22:06:42',1342177281,'submission.event.fileUploaded',0),(160,1048585,6,24,'2023-06-04 22:06:42',1342177288,'submission.event.fileRevised',0),(161,515,42,24,'2023-06-04 22:06:42',1342177296,'submission.event.fileEdited',0),(162,515,43,24,'2023-06-04 22:06:43',1342177281,'submission.event.fileUploaded',0),(163,1048585,6,24,'2023-06-04 22:06:43',1342177288,'submission.event.fileRevised',0),(164,515,43,24,'2023-06-04 22:06:43',1342177296,'submission.event.fileEdited',0),(165,515,44,24,'2023-06-04 22:06:44',1342177281,'submission.event.fileUploaded',0),(166,1048585,6,24,'2023-06-04 22:06:44',1342177288,'submission.event.fileRevised',0),(167,515,44,24,'2023-06-04 22:06:44',1342177296,'submission.event.fileEdited',0),(168,515,45,24,'2023-06-04 22:06:45',1342177281,'submission.event.fileUploaded',0),(169,1048585,6,24,'2023-06-04 22:06:45',1342177288,'submission.event.fileRevised',0),(170,515,45,24,'2023-06-04 22:06:46',1342177296,'submission.event.fileEdited',0),(171,1048585,6,24,'2023-06-04 22:07:13',268435457,'submission.event.submissionSubmitted',0),(172,1048585,6,3,'2023-06-04 22:07:28',805306371,'editor.submission.decision.sendInternalReview.log',0),(173,515,46,3,'2023-06-04 22:07:28',1342177281,'submission.event.fileUploaded',0),(174,1048585,6,3,'2023-06-04 22:07:28',1342177288,'submission.event.fileRevised',0),(175,515,47,3,'2023-06-04 22:07:28',1342177281,'submission.event.fileUploaded',0),(176,1048585,6,3,'2023-06-04 22:07:28',1342177288,'submission.event.fileRevised',0),(177,515,48,3,'2023-06-04 22:07:28',1342177281,'submission.event.fileUploaded',0),(178,1048585,6,3,'2023-06-04 22:07:28',1342177288,'submission.event.fileRevised',0),(179,515,49,3,'2023-06-04 22:07:29',1342177281,'submission.event.fileUploaded',0),(180,1048585,6,3,'2023-06-04 22:07:29',1342177288,'submission.event.fileRevised',0),(181,1048585,6,3,'2023-06-04 22:07:38',268435459,'submission.event.participantAdded',0),(182,1048585,6,3,'2023-06-04 22:07:44',268435459,'submission.event.participantAdded',0),(183,1048585,6,6,'2023-06-04 22:07:59',805306372,'editor.submission.recommend.accept.log',0),(184,1048585,7,25,'2023-06-04 22:08:22',268435458,'submission.event.general.metadataUpdated',0),(185,1048585,7,25,'2023-06-04 22:08:22',268435458,'submission.event.general.metadataUpdated',0),(186,515,50,25,'2023-06-04 22:08:25',1342177281,'submission.event.fileUploaded',0),(187,1048585,7,25,'2023-06-04 22:08:25',1342177288,'submission.event.fileRevised',0),(188,515,50,25,'2023-06-04 22:08:26',1342177296,'submission.event.fileEdited',0),(189,515,51,25,'2023-06-04 22:08:26',1342177281,'submission.event.fileUploaded',0),(190,1048585,7,25,'2023-06-04 22:08:26',1342177288,'submission.event.fileRevised',0),(191,515,51,25,'2023-06-04 22:08:27',1342177296,'submission.event.fileEdited',0),(192,515,52,25,'2023-06-04 22:08:28',1342177281,'submission.event.fileUploaded',0),(193,1048585,7,25,'2023-06-04 22:08:28',1342177288,'submission.event.fileRevised',0),(194,515,52,25,'2023-06-04 22:08:28',1342177296,'submission.event.fileEdited',0),(195,515,53,25,'2023-06-04 22:08:29',1342177281,'submission.event.fileUploaded',0),(196,1048585,7,25,'2023-06-04 22:08:29',1342177288,'submission.event.fileRevised',0),(197,515,53,25,'2023-06-04 22:08:29',1342177296,'submission.event.fileEdited',0),(198,515,54,25,'2023-06-04 22:08:30',1342177281,'submission.event.fileUploaded',0),(199,1048585,7,25,'2023-06-04 22:08:30',1342177288,'submission.event.fileRevised',0),(200,515,54,25,'2023-06-04 22:08:30',1342177296,'submission.event.fileEdited',0),(201,1048585,7,25,'2023-06-04 22:09:07',268435457,'submission.event.submissionSubmitted',0),(202,1048585,7,3,'2023-06-04 22:09:23',805306371,'editor.submission.decision.sendExternalReview.log',0),(203,515,55,3,'2023-06-04 22:09:23',1342177281,'submission.event.fileUploaded',0),(204,1048585,7,3,'2023-06-04 22:09:23',1342177288,'submission.event.fileRevised',0),(205,515,56,3,'2023-06-04 22:09:23',1342177281,'submission.event.fileUploaded',0),(206,1048585,7,3,'2023-06-04 22:09:23',1342177288,'submission.event.fileRevised',0),(207,515,57,3,'2023-06-04 22:09:23',1342177281,'submission.event.fileUploaded',0),(208,1048585,7,3,'2023-06-04 22:09:23',1342177288,'submission.event.fileRevised',0),(209,515,58,3,'2023-06-04 22:09:24',1342177281,'submission.event.fileUploaded',0),(210,1048585,7,3,'2023-06-04 22:09:24',1342177288,'submission.event.fileRevised',0),(211,515,59,3,'2023-06-04 22:09:24',1342177281,'submission.event.fileUploaded',0),(212,1048585,7,3,'2023-06-04 22:09:24',1342177288,'submission.event.fileRevised',0),(213,1048585,7,3,'2023-06-04 22:09:34',1073741825,'log.review.reviewerAssigned',0),(214,1048585,7,3,'2023-06-04 22:09:40',805306371,'editor.submission.decision.accept.log',0),(215,1048585,7,3,'2023-06-04 22:09:50',268435459,'submission.event.participantAdded',0),(216,1048585,8,3,'2023-06-04 22:10:00',268435458,'submission.event.general.metadataUpdated',0),(217,515,60,3,'2023-06-04 22:10:03',1342177281,'submission.event.fileUploaded',0),(218,1048585,8,3,'2023-06-04 22:10:03',1342177288,'submission.event.fileRevised',0),(219,515,60,3,'2023-06-04 22:10:04',1342177296,'submission.event.fileEdited',0),(220,1048585,8,3,'2023-06-04 22:10:05',268435457,'submission.event.submissionSubmitted',0),(221,1048585,9,26,'2023-06-04 22:10:13',268435458,'submission.event.general.metadataUpdated',0),(222,1048585,9,26,'2023-06-04 22:10:13',268435458,'submission.event.general.metadataUpdated',0),(223,515,61,26,'2023-06-04 22:10:16',1342177281,'submission.event.fileUploaded',0),(224,1048585,9,26,'2023-06-04 22:10:16',1342177288,'submission.event.fileRevised',0),(225,515,61,26,'2023-06-04 22:10:17',1342177296,'submission.event.fileEdited',0),(226,515,62,26,'2023-06-04 22:10:17',1342177281,'submission.event.fileUploaded',0),(227,1048585,9,26,'2023-06-04 22:10:17',1342177288,'submission.event.fileRevised',0),(228,515,62,26,'2023-06-04 22:10:18',1342177296,'submission.event.fileEdited',0),(229,515,63,26,'2023-06-04 22:10:19',1342177281,'submission.event.fileUploaded',0),(230,1048585,9,26,'2023-06-04 22:10:19',1342177288,'submission.event.fileRevised',0),(231,515,63,26,'2023-06-04 22:10:19',1342177296,'submission.event.fileEdited',0),(232,515,64,26,'2023-06-04 22:10:20',1342177281,'submission.event.fileUploaded',0),(233,1048585,9,26,'2023-06-04 22:10:20',1342177288,'submission.event.fileRevised',0),(234,515,64,26,'2023-06-04 22:10:20',1342177296,'submission.event.fileEdited',0),(235,515,65,26,'2023-06-04 22:10:21',1342177281,'submission.event.fileUploaded',0),(236,1048585,9,26,'2023-06-04 22:10:21',1342177288,'submission.event.fileRevised',0),(237,515,65,26,'2023-06-04 22:10:21',1342177296,'submission.event.fileEdited',0),(238,1048585,9,26,'2023-06-04 22:10:57',268435457,'submission.event.submissionSubmitted',0),(239,1048585,9,3,'2023-06-04 22:11:14',805306371,'editor.submission.decision.sendInternalReview.log',0),(240,515,66,3,'2023-06-04 22:11:15',1342177281,'submission.event.fileUploaded',0),(241,1048585,9,3,'2023-06-04 22:11:15',1342177288,'submission.event.fileRevised',0),(242,515,67,3,'2023-06-04 22:11:15',1342177281,'submission.event.fileUploaded',0),(243,1048585,9,3,'2023-06-04 22:11:15',1342177288,'submission.event.fileRevised',0),(244,515,68,3,'2023-06-04 22:11:15',1342177281,'submission.event.fileUploaded',0),(245,1048585,9,3,'2023-06-04 22:11:15',1342177288,'submission.event.fileRevised',0),(246,515,69,3,'2023-06-04 22:11:15',1342177281,'submission.event.fileUploaded',0),(247,1048585,9,3,'2023-06-04 22:11:15',1342177288,'submission.event.fileRevised',0),(248,515,70,3,'2023-06-04 22:11:15',1342177281,'submission.event.fileUploaded',0),(249,1048585,9,3,'2023-06-04 22:11:16',1342177288,'submission.event.fileRevised',0),(250,1048585,10,27,'2023-06-04 22:11:29',268435458,'submission.event.general.metadataUpdated',0),(251,1048585,10,27,'2023-06-04 22:11:30',268435458,'submission.event.general.metadataUpdated',0),(252,515,71,27,'2023-06-04 22:11:33',1342177281,'submission.event.fileUploaded',0),(253,1048585,10,27,'2023-06-04 22:11:33',1342177288,'submission.event.fileRevised',0),(254,515,71,27,'2023-06-04 22:11:33',1342177296,'submission.event.fileEdited',0),(255,515,72,27,'2023-06-04 22:11:34',1342177281,'submission.event.fileUploaded',0),(256,1048585,10,27,'2023-06-04 22:11:34',1342177288,'submission.event.fileRevised',0),(257,515,72,27,'2023-06-04 22:11:34',1342177296,'submission.event.fileEdited',0),(258,515,73,27,'2023-06-04 22:11:35',1342177281,'submission.event.fileUploaded',0),(259,1048585,10,27,'2023-06-04 22:11:35',1342177288,'submission.event.fileRevised',0),(260,515,73,27,'2023-06-04 22:11:36',1342177296,'submission.event.fileEdited',0),(261,515,74,27,'2023-06-04 22:11:36',1342177281,'submission.event.fileUploaded',0),(262,1048585,10,27,'2023-06-04 22:11:36',1342177288,'submission.event.fileRevised',0),(263,515,74,27,'2023-06-04 22:11:37',1342177296,'submission.event.fileEdited',0),(264,515,75,27,'2023-06-04 22:11:38',1342177281,'submission.event.fileUploaded',0),(265,1048585,10,27,'2023-06-04 22:11:38',1342177288,'submission.event.fileRevised',0),(266,515,75,27,'2023-06-04 22:11:38',1342177296,'submission.event.fileEdited',0),(267,515,76,27,'2023-06-04 22:11:39',1342177281,'submission.event.fileUploaded',0),(268,1048585,10,27,'2023-06-04 22:11:39',1342177288,'submission.event.fileRevised',0),(269,515,76,27,'2023-06-04 22:11:39',1342177296,'submission.event.fileEdited',0),(270,515,77,27,'2023-06-04 22:11:40',1342177281,'submission.event.fileUploaded',0),(271,1048585,10,27,'2023-06-04 22:11:40',1342177288,'submission.event.fileRevised',0),(272,515,77,27,'2023-06-04 22:11:40',1342177296,'submission.event.fileEdited',0),(273,515,78,27,'2023-06-04 22:11:41',1342177281,'submission.event.fileUploaded',0),(274,1048585,10,27,'2023-06-04 22:11:41',1342177288,'submission.event.fileRevised',0),(275,515,78,27,'2023-06-04 22:11:42',1342177296,'submission.event.fileEdited',0),(276,515,79,27,'2023-06-04 22:11:43',1342177281,'submission.event.fileUploaded',0),(277,1048585,10,27,'2023-06-04 22:11:43',1342177288,'submission.event.fileRevised',0),(278,515,79,27,'2023-06-04 22:11:43',1342177296,'submission.event.fileEdited',0),(279,1048585,10,27,'2023-06-04 22:12:55',268435457,'submission.event.submissionSubmitted',0),(280,1048585,11,28,'2023-06-04 22:13:05',268435458,'submission.event.general.metadataUpdated',0),(281,1048585,11,28,'2023-06-04 22:13:05',268435458,'submission.event.general.metadataUpdated',0),(282,515,80,28,'2023-06-04 22:13:08',1342177281,'submission.event.fileUploaded',0),(283,1048585,11,28,'2023-06-04 22:13:08',1342177288,'submission.event.fileRevised',0),(284,515,80,28,'2023-06-04 22:13:09',1342177296,'submission.event.fileEdited',0),(285,515,81,28,'2023-06-04 22:13:09',1342177281,'submission.event.fileUploaded',0),(286,1048585,11,28,'2023-06-04 22:13:09',1342177288,'submission.event.fileRevised',0),(287,515,81,28,'2023-06-04 22:13:10',1342177296,'submission.event.fileEdited',0),(288,1048585,11,28,'2023-06-04 22:13:22',268435457,'submission.event.submissionSubmitted',0),(289,1048585,11,3,'2023-06-04 22:13:35',805306371,'editor.submission.decision.sendInternalReview.log',0),(290,515,82,3,'2023-06-04 22:13:36',1342177281,'submission.event.fileUploaded',0),(291,1048585,11,3,'2023-06-04 22:13:36',1342177288,'submission.event.fileRevised',0),(292,515,83,3,'2023-06-04 22:13:36',1342177281,'submission.event.fileUploaded',0),(293,1048585,11,3,'2023-06-04 22:13:36',1342177288,'submission.event.fileRevised',0),(294,1048585,11,3,'2023-06-04 22:13:45',1073741825,'log.review.reviewerAssigned',0),(295,1048585,11,3,'2023-06-04 22:13:50',805306371,'editor.submission.decision.sendExternalReview.log',0),(296,1048585,11,3,'2023-06-04 22:14:01',1073741825,'log.review.reviewerAssigned',0),(297,1048585,11,3,'2023-06-04 22:14:08',1073741825,'log.review.reviewerAssigned',0),(298,1048585,11,10,'2023-06-04 22:14:16',1073741830,'log.review.reviewAccepted',NULL),(299,1048585,11,10,'2023-06-04 22:14:21',1073741848,'log.review.reviewReady',0),(300,1048585,11,12,'2023-06-04 22:14:28',1073741830,'log.review.reviewAccepted',NULL),(301,1048585,11,12,'2023-06-04 22:14:33',1073741848,'log.review.reviewReady',0),(302,1048585,11,3,'2023-06-04 22:14:50',805306371,'editor.submission.decision.accept.log',0),(303,1048585,11,3,'2023-06-04 22:14:50',805306375,'submission.event.decisionReviewerEmailSent',0),(304,1048585,12,29,'2023-06-04 22:15:04',268435458,'submission.event.general.metadataUpdated',0),(305,1048585,12,29,'2023-06-04 22:15:05',268435458,'submission.event.general.metadataUpdated',0),(306,515,84,29,'2023-06-04 22:15:08',1342177281,'submission.event.fileUploaded',0),(307,1048585,12,29,'2023-06-04 22:15:08',1342177288,'submission.event.fileRevised',0),(308,515,84,29,'2023-06-04 22:15:08',1342177296,'submission.event.fileEdited',0),(309,515,85,29,'2023-06-04 22:15:09',1342177281,'submission.event.fileUploaded',0),(310,1048585,12,29,'2023-06-04 22:15:09',1342177288,'submission.event.fileRevised',0),(311,515,85,29,'2023-06-04 22:15:09',1342177296,'submission.event.fileEdited',0),(312,515,86,29,'2023-06-04 22:15:10',1342177281,'submission.event.fileUploaded',0),(313,1048585,12,29,'2023-06-04 22:15:10',1342177288,'submission.event.fileRevised',0),(314,515,86,29,'2023-06-04 22:15:10',1342177296,'submission.event.fileEdited',0),(315,1048585,12,29,'2023-06-04 22:15:33',268435457,'submission.event.submissionSubmitted',0),(316,1048585,12,3,'2023-06-04 22:15:47',805306371,'editor.submission.decision.sendInternalReview.log',0),(317,515,87,3,'2023-06-04 22:15:48',1342177281,'submission.event.fileUploaded',0),(318,1048585,12,3,'2023-06-04 22:15:48',1342177288,'submission.event.fileRevised',0),(319,515,88,3,'2023-06-04 22:15:48',1342177281,'submission.event.fileUploaded',0),(320,1048585,12,3,'2023-06-04 22:15:48',1342177288,'submission.event.fileRevised',0),(321,515,89,3,'2023-06-04 22:15:48',1342177281,'submission.event.fileUploaded',0),(322,1048585,12,3,'2023-06-04 22:15:48',1342177288,'submission.event.fileRevised',0),(323,1048585,12,3,'2023-06-04 22:15:58',1073741825,'log.review.reviewerAssigned',0),(324,1048585,12,3,'2023-06-04 22:16:06',1073741825,'log.review.reviewerAssigned',0),(325,1048585,12,3,'2023-06-04 22:16:13',1073741825,'log.review.reviewerAssigned',0),(326,1048585,12,8,'2023-06-04 22:16:21',1073741830,'log.review.reviewAccepted',NULL),(327,1048585,12,8,'2023-06-04 22:16:25',1073741848,'log.review.reviewReady',0),(328,1048585,13,30,'2023-06-04 22:16:35',268435458,'submission.event.general.metadataUpdated',0),(329,1048585,13,30,'2023-06-04 22:16:36',268435458,'submission.event.general.metadataUpdated',0),(330,515,90,30,'2023-06-04 22:16:39',1342177281,'submission.event.fileUploaded',0),(331,1048585,13,30,'2023-06-04 22:16:39',1342177288,'submission.event.fileRevised',0),(332,515,90,30,'2023-06-04 22:16:39',1342177296,'submission.event.fileEdited',0),(333,515,91,30,'2023-06-04 22:16:40',1342177281,'submission.event.fileUploaded',0),(334,1048585,13,30,'2023-06-04 22:16:40',1342177288,'submission.event.fileRevised',0),(335,515,91,30,'2023-06-04 22:16:40',1342177296,'submission.event.fileEdited',0),(336,515,92,30,'2023-06-04 22:16:41',1342177281,'submission.event.fileUploaded',0),(337,1048585,13,30,'2023-06-04 22:16:41',1342177288,'submission.event.fileRevised',0),(338,515,92,30,'2023-06-04 22:16:41',1342177296,'submission.event.fileEdited',0),(339,1048585,13,30,'2023-06-04 22:17:02',268435457,'submission.event.submissionSubmitted',0),(340,1048585,13,3,'2023-06-04 22:17:16',805306371,'editor.submission.decision.sendInternalReview.log',0),(341,515,93,3,'2023-06-04 22:17:17',1342177281,'submission.event.fileUploaded',0),(342,1048585,13,3,'2023-06-04 22:17:17',1342177288,'submission.event.fileRevised',0),(343,515,94,3,'2023-06-04 22:17:17',1342177281,'submission.event.fileUploaded',0),(344,1048585,13,3,'2023-06-04 22:17:17',1342177288,'submission.event.fileRevised',0),(345,515,95,3,'2023-06-04 22:17:17',1342177281,'submission.event.fileUploaded',0),(346,1048585,13,3,'2023-06-04 22:17:17',1342177288,'submission.event.fileRevised',0),(347,1048585,13,3,'2023-06-04 22:17:27',1073741825,'log.review.reviewerAssigned',0),(348,1048585,13,3,'2023-06-04 22:17:33',805306371,'editor.submission.decision.sendExternalReview.log',0),(349,1048585,13,3,'2023-06-04 22:17:43',1073741825,'log.review.reviewerAssigned',0),(350,1048585,13,3,'2023-06-04 22:17:51',1073741825,'log.review.reviewerAssigned',0),(351,1048585,13,3,'2023-06-04 22:17:59',1073741825,'log.review.reviewerAssigned',0),(352,1048585,13,10,'2023-06-04 22:18:07',1073741830,'log.review.reviewAccepted',NULL),(353,1048585,13,10,'2023-06-04 22:18:12',1073741848,'log.review.reviewReady',0),(354,1048585,13,12,'2023-06-04 22:18:20',1073741830,'log.review.reviewAccepted',NULL),(355,1048585,13,12,'2023-06-04 22:18:24',1073741848,'log.review.reviewReady',0),(356,1048585,13,3,'2023-06-04 22:18:44',805306371,'editor.submission.decision.accept.log',0),(357,1048585,13,3,'2023-06-04 22:18:45',805306375,'submission.event.decisionReviewerEmailSent',0),(358,1048585,14,31,'2023-06-04 22:18:59',268435458,'submission.event.general.metadataUpdated',0),(359,1048585,14,31,'2023-06-04 22:19:00',268435458,'submission.event.general.metadataUpdated',0),(360,515,96,31,'2023-06-04 22:19:03',1342177281,'submission.event.fileUploaded',0),(361,1048585,14,31,'2023-06-04 22:19:03',1342177288,'submission.event.fileRevised',0),(362,515,96,31,'2023-06-04 22:19:03',1342177296,'submission.event.fileEdited',0),(363,515,97,31,'2023-06-04 22:19:04',1342177281,'submission.event.fileUploaded',0),(364,1048585,14,31,'2023-06-04 22:19:04',1342177288,'submission.event.fileRevised',0),(365,515,97,31,'2023-06-04 22:19:05',1342177296,'submission.event.fileEdited',0),(366,515,98,31,'2023-06-04 22:19:05',1342177281,'submission.event.fileUploaded',0),(367,1048585,14,31,'2023-06-04 22:19:05',1342177288,'submission.event.fileRevised',0),(368,515,98,31,'2023-06-04 22:19:06',1342177296,'submission.event.fileEdited',0),(369,515,99,31,'2023-06-04 22:19:07',1342177281,'submission.event.fileUploaded',0),(370,1048585,14,31,'2023-06-04 22:19:07',1342177288,'submission.event.fileRevised',0),(371,515,99,31,'2023-06-04 22:19:07',1342177296,'submission.event.fileEdited',0),(372,515,100,31,'2023-06-04 22:19:08',1342177281,'submission.event.fileUploaded',0),(373,1048585,14,31,'2023-06-04 22:19:08',1342177288,'submission.event.fileRevised',0),(374,515,100,31,'2023-06-04 22:19:08',1342177296,'submission.event.fileEdited',0),(375,515,101,31,'2023-06-04 22:19:09',1342177281,'submission.event.fileUploaded',0),(376,1048585,14,31,'2023-06-04 22:19:09',1342177288,'submission.event.fileRevised',0),(377,515,101,31,'2023-06-04 22:19:10',1342177296,'submission.event.fileEdited',0),(378,1048585,14,31,'2023-06-04 22:19:38',268435457,'submission.event.submissionSubmitted',0),(379,1048585,14,3,'2023-06-04 22:19:55',805306371,'editor.submission.decision.sendInternalReview.log',0),(380,515,102,3,'2023-06-04 22:19:55',1342177281,'submission.event.fileUploaded',0),(381,1048585,14,3,'2023-06-04 22:19:55',1342177288,'submission.event.fileRevised',0),(382,515,103,3,'2023-06-04 22:19:55',1342177281,'submission.event.fileUploaded',0),(383,1048585,14,3,'2023-06-04 22:19:55',1342177288,'submission.event.fileRevised',0),(384,515,104,3,'2023-06-04 22:19:55',1342177281,'submission.event.fileUploaded',0),(385,1048585,14,3,'2023-06-04 22:19:56',1342177288,'submission.event.fileRevised',0),(386,515,105,3,'2023-06-04 22:19:56',1342177281,'submission.event.fileUploaded',0),(387,1048585,14,3,'2023-06-04 22:19:56',1342177288,'submission.event.fileRevised',0),(388,515,106,3,'2023-06-04 22:19:56',1342177281,'submission.event.fileUploaded',0),(389,1048585,14,3,'2023-06-04 22:19:56',1342177288,'submission.event.fileRevised',0),(390,515,107,3,'2023-06-04 22:19:56',1342177281,'submission.event.fileUploaded',0),(391,1048585,14,3,'2023-06-04 22:19:56',1342177288,'submission.event.fileRevised',0),(392,1048585,14,3,'2023-06-04 22:20:06',1073741825,'log.review.reviewerAssigned',0),(393,1048585,14,3,'2023-06-04 22:20:12',805306371,'editor.submission.decision.sendExternalReview.log',0),(394,1048585,14,3,'2023-06-04 22:20:23',1073741825,'log.review.reviewerAssigned',0),(395,1048585,14,3,'2023-06-04 22:20:29',805306371,'editor.submission.decision.accept.log',0),(396,1048585,14,3,'2023-06-04 22:20:40',268435459,'submission.event.participantAdded',0),(397,1048585,14,3,'2023-06-04 22:20:47',805306371,'editor.submission.decision.sendToProduction.log',0),(398,1048585,14,3,'2023-06-04 22:20:57',268435459,'submission.event.participantAdded',0),(399,1048585,14,3,'2023-06-04 22:21:04',268435459,'submission.event.participantAdded',0),(400,1048585,14,3,'2023-06-04 22:21:10',268435474,'submission.event.publicationFormatCreated',NULL),(401,515,108,3,'2023-06-04 22:21:17',1342177281,'submission.event.fileUploaded',0),(402,1048585,14,3,'2023-06-04 22:21:17',1342177288,'submission.event.fileRevised',0),(403,515,109,3,'2023-06-04 22:21:17',1342177281,'submission.event.fileUploaded',0),(404,1048585,14,3,'2023-06-04 22:21:17',1342177288,'submission.event.fileRevised',0),(405,515,110,3,'2023-06-04 22:21:17',1342177281,'submission.event.fileUploaded',0),(406,1048585,14,3,'2023-06-04 22:21:17',1342177288,'submission.event.fileRevised',0),(407,515,111,3,'2023-06-04 22:21:17',1342177281,'submission.event.fileUploaded',0),(408,1048585,14,3,'2023-06-04 22:21:17',1342177288,'submission.event.fileRevised',0),(409,515,112,3,'2023-06-04 22:21:17',1342177281,'submission.event.fileUploaded',0),(410,1048585,14,3,'2023-06-04 22:21:17',1342177288,'submission.event.fileRevised',0),(411,515,113,3,'2023-06-04 22:21:17',1342177281,'submission.event.fileUploaded',0),(412,1048585,14,3,'2023-06-04 22:21:17',1342177288,'submission.event.fileRevised',0),(413,1048585,14,3,'2023-06-04 22:21:20',268435464,'submission.event.publicationFormatPublished',0),(414,1048585,14,3,'2023-06-04 22:21:22',268435476,'submission.event.publicationFormatMadeAvailable',0),(415,515,113,3,'2023-06-04 22:21:24',1342177296,'submission.event.fileEdited',0),(416,515,113,3,'2023-06-04 22:21:24',1342177287,'submission.event.signoffSignoff',0),(417,515,113,3,'2023-06-04 22:21:27',1342177296,'submission.event.fileEdited',0),(418,515,112,3,'2023-06-04 22:21:30',1342177296,'submission.event.fileEdited',0),(419,515,112,3,'2023-06-04 22:21:30',1342177287,'submission.event.signoffSignoff',0),(420,515,112,3,'2023-06-04 22:21:33',1342177296,'submission.event.fileEdited',0),(421,515,111,3,'2023-06-04 22:21:35',1342177296,'submission.event.fileEdited',0),(422,515,111,3,'2023-06-04 22:21:35',1342177287,'submission.event.signoffSignoff',0),(423,515,111,3,'2023-06-04 22:21:38',1342177296,'submission.event.fileEdited',0),(424,515,110,3,'2023-06-04 22:21:40',1342177296,'submission.event.fileEdited',0),(425,515,110,3,'2023-06-04 22:21:40',1342177287,'submission.event.signoffSignoff',0),(426,515,110,3,'2023-06-04 22:21:43',1342177296,'submission.event.fileEdited',0),(427,515,109,3,'2023-06-04 22:21:46',1342177296,'submission.event.fileEdited',0),(428,515,109,3,'2023-06-04 22:21:46',1342177287,'submission.event.signoffSignoff',0),(429,515,109,3,'2023-06-04 22:21:50',1342177296,'submission.event.fileEdited',0),(430,515,108,3,'2023-06-04 22:21:52',1342177296,'submission.event.fileEdited',0),(431,515,108,3,'2023-06-04 22:21:52',1342177287,'submission.event.signoffSignoff',0),(432,515,108,3,'2023-06-04 22:21:55',1342177296,'submission.event.fileEdited',0),(433,1048585,14,3,'2023-06-04 22:21:58',268435462,'publication.event.published',0),(434,1048585,15,32,'2023-06-04 22:22:09',268435458,'submission.event.general.metadataUpdated',0),(435,1048585,15,32,'2023-06-04 22:22:10',268435458,'submission.event.general.metadataUpdated',0),(436,515,114,32,'2023-06-04 22:22:13',1342177281,'submission.event.fileUploaded',0),(437,1048585,15,32,'2023-06-04 22:22:13',1342177288,'submission.event.fileRevised',0),(438,515,114,32,'2023-06-04 22:22:13',1342177296,'submission.event.fileEdited',0),(439,515,115,32,'2023-06-04 22:22:14',1342177281,'submission.event.fileUploaded',0),(440,1048585,15,32,'2023-06-04 22:22:14',1342177288,'submission.event.fileRevised',0),(441,515,115,32,'2023-06-04 22:22:14',1342177296,'submission.event.fileEdited',0),(442,515,116,32,'2023-06-04 22:22:15',1342177281,'submission.event.fileUploaded',0),(443,1048585,15,32,'2023-06-04 22:22:15',1342177288,'submission.event.fileRevised',0),(444,515,116,32,'2023-06-04 22:22:15',1342177296,'submission.event.fileEdited',0),(445,1048585,15,32,'2023-06-04 22:22:34',268435457,'submission.event.submissionSubmitted',0),(446,1048585,15,3,'2023-06-04 22:22:50',805306371,'editor.submission.decision.sendExternalReview.log',0),(447,515,117,3,'2023-06-04 22:22:50',1342177281,'submission.event.fileUploaded',0),(448,1048585,15,3,'2023-06-04 22:22:50',1342177288,'submission.event.fileRevised',0),(449,515,118,3,'2023-06-04 22:22:50',1342177281,'submission.event.fileUploaded',0),(450,1048585,15,3,'2023-06-04 22:22:50',1342177288,'submission.event.fileRevised',0),(451,515,119,3,'2023-06-04 22:22:50',1342177281,'submission.event.fileUploaded',0),(452,1048585,15,3,'2023-06-04 22:22:50',1342177288,'submission.event.fileRevised',0),(453,1048585,16,33,'2023-06-04 22:23:03',268435458,'submission.event.general.metadataUpdated',0),(454,1048585,16,33,'2023-06-04 22:23:04',268435458,'submission.event.general.metadataUpdated',0),(455,515,120,33,'2023-06-04 22:23:07',1342177281,'submission.event.fileUploaded',0),(456,1048585,16,33,'2023-06-04 22:23:07',1342177288,'submission.event.fileRevised',0),(457,515,120,33,'2023-06-04 22:23:08',1342177296,'submission.event.fileEdited',0),(458,515,121,33,'2023-06-04 22:23:08',1342177281,'submission.event.fileUploaded',0),(459,1048585,16,33,'2023-06-04 22:23:08',1342177288,'submission.event.fileRevised',0),(460,515,121,33,'2023-06-04 22:23:09',1342177296,'submission.event.fileEdited',0),(461,515,122,33,'2023-06-04 22:23:09',1342177281,'submission.event.fileUploaded',0),(462,1048585,16,33,'2023-06-04 22:23:09',1342177288,'submission.event.fileRevised',0),(463,515,122,33,'2023-06-04 22:23:10',1342177296,'submission.event.fileEdited',0),(464,515,123,33,'2023-06-04 22:23:11',1342177281,'submission.event.fileUploaded',0),(465,1048585,16,33,'2023-06-04 22:23:11',1342177288,'submission.event.fileRevised',0),(466,515,123,33,'2023-06-04 22:23:11',1342177296,'submission.event.fileEdited',0),(467,515,124,33,'2023-06-04 22:23:12',1342177281,'submission.event.fileUploaded',0),(468,1048585,16,33,'2023-06-04 22:23:12',1342177288,'submission.event.fileRevised',0),(469,515,124,33,'2023-06-04 22:23:12',1342177296,'submission.event.fileEdited',0),(470,1048585,16,33,'2023-06-04 22:23:46',268435457,'submission.event.submissionSubmitted',0),(471,1048585,16,3,'2023-06-04 22:24:03',805306371,'editor.submission.decision.sendExternalReview.log',0),(472,515,125,3,'2023-06-04 22:24:03',1342177281,'submission.event.fileUploaded',0),(473,1048585,16,3,'2023-06-04 22:24:03',1342177288,'submission.event.fileRevised',0),(474,515,126,3,'2023-06-04 22:24:03',1342177281,'submission.event.fileUploaded',0),(475,1048585,16,3,'2023-06-04 22:24:03',1342177288,'submission.event.fileRevised',0),(476,515,127,3,'2023-06-04 22:24:04',1342177281,'submission.event.fileUploaded',0),(477,1048585,16,3,'2023-06-04 22:24:04',1342177288,'submission.event.fileRevised',0),(478,515,128,3,'2023-06-04 22:24:04',1342177281,'submission.event.fileUploaded',0),(479,1048585,16,3,'2023-06-04 22:24:04',1342177288,'submission.event.fileRevised',0),(480,515,129,3,'2023-06-04 22:24:04',1342177281,'submission.event.fileUploaded',0),(481,1048585,16,3,'2023-06-04 22:24:04',1342177288,'submission.event.fileRevised',0),(482,1048585,16,3,'2023-06-04 22:24:14',1073741825,'log.review.reviewerAssigned',0),(483,1048585,16,3,'2023-06-04 22:24:22',1073741825,'log.review.reviewerAssigned',0),(484,1048585,16,3,'2023-06-04 22:24:29',1073741825,'log.review.reviewerAssigned',0),(485,1048585,16,10,'2023-06-04 22:24:38',1073741830,'log.review.reviewAccepted',NULL),(486,1048585,16,10,'2023-06-04 22:24:44',1073741848,'log.review.reviewReady',0),(487,1048585,17,34,'2023-06-04 22:24:53',268435458,'submission.event.general.metadataUpdated',0),(488,1048585,17,34,'2023-06-04 22:24:54',268435458,'submission.event.general.metadataUpdated',0),(489,515,130,34,'2023-06-04 22:24:57',1342177281,'submission.event.fileUploaded',0),(490,1048585,17,34,'2023-06-04 22:24:57',1342177288,'submission.event.fileRevised',0),(491,515,130,34,'2023-06-04 22:24:58',1342177296,'submission.event.fileEdited',0),(492,515,131,34,'2023-06-04 22:24:58',1342177281,'submission.event.fileUploaded',0),(493,1048585,17,34,'2023-06-04 22:24:58',1342177288,'submission.event.fileRevised',0),(494,515,131,34,'2023-06-04 22:24:59',1342177296,'submission.event.fileEdited',0),(495,515,132,34,'2023-06-04 22:25:00',1342177281,'submission.event.fileUploaded',0),(496,1048585,17,34,'2023-06-04 22:25:00',1342177288,'submission.event.fileRevised',0),(497,515,132,34,'2023-06-04 22:25:00',1342177296,'submission.event.fileEdited',0),(498,515,133,34,'2023-06-04 22:25:01',1342177281,'submission.event.fileUploaded',0),(499,1048585,17,34,'2023-06-04 22:25:01',1342177288,'submission.event.fileRevised',0),(500,515,133,34,'2023-06-04 22:25:01',1342177296,'submission.event.fileEdited',0),(501,515,134,34,'2023-06-04 22:25:02',1342177281,'submission.event.fileUploaded',0),(502,1048585,17,34,'2023-06-04 22:25:02',1342177288,'submission.event.fileRevised',0),(503,515,134,34,'2023-06-04 22:25:02',1342177296,'submission.event.fileEdited',0),(504,515,135,34,'2023-06-04 22:25:03',1342177281,'submission.event.fileUploaded',0),(505,1048585,17,34,'2023-06-04 22:25:03',1342177288,'submission.event.fileRevised',0),(506,515,135,34,'2023-06-04 22:25:04',1342177296,'submission.event.fileEdited',0),(507,1048585,17,34,'2023-06-04 22:25:52',268435457,'submission.event.submissionSubmitted',0),(508,1048585,17,3,'2023-06-04 22:26:12',805306371,'editor.submission.decision.sendInternalReview.log',0),(509,515,136,3,'2023-06-04 22:26:13',1342177281,'submission.event.fileUploaded',0),(510,1048585,17,3,'2023-06-04 22:26:13',1342177288,'submission.event.fileRevised',0),(511,515,137,3,'2023-06-04 22:26:13',1342177281,'submission.event.fileUploaded',0),(512,1048585,17,3,'2023-06-04 22:26:13',1342177288,'submission.event.fileRevised',0),(513,515,138,3,'2023-06-04 22:26:13',1342177281,'submission.event.fileUploaded',0),(514,1048585,17,3,'2023-06-04 22:26:13',1342177288,'submission.event.fileRevised',0),(515,515,139,3,'2023-06-04 22:26:13',1342177281,'submission.event.fileUploaded',0),(516,1048585,17,3,'2023-06-04 22:26:13',1342177288,'submission.event.fileRevised',0),(517,515,140,3,'2023-06-04 22:26:13',1342177281,'submission.event.fileUploaded',0),(518,1048585,17,3,'2023-06-04 22:26:13',1342177288,'submission.event.fileRevised',0),(519,515,141,3,'2023-06-04 22:26:13',1342177281,'submission.event.fileUploaded',0),(520,1048585,17,3,'2023-06-04 22:26:13',1342177288,'submission.event.fileRevised',0),(521,1048585,17,3,'2023-06-04 22:26:24',1073741825,'log.review.reviewerAssigned',0),(522,1048585,17,3,'2023-06-04 22:26:33',1073741825,'log.review.reviewerAssigned',0);
/*!40000 ALTER TABLE `event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log_settings`
--

DROP TABLE IF EXISTS `event_log_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_log_settings` (
  `event_log_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`event_log_setting_id`),
  UNIQUE KEY `event_log_settings_unique` (`log_id`,`setting_name`,`locale`),
  KEY `event_log_settings_log_id` (`log_id`),
  KEY `event_log_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `event_log_settings_log_id` FOREIGN KEY (`log_id`) REFERENCES `event_log` (`log_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2242 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Data about an event log entry. This data is commonly used to display information about an event to a user.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
INSERT INTO `event_log_settings` VALUES (1,3,'','fileId','1'),(2,3,'en','filename','chapter1.pdf'),(3,3,'','fileStage','2'),(4,3,'','submissionId','1'),(5,3,'','username','aclark'),(6,4,'','fileId','1'),(7,4,'en','filename','chapter1.pdf'),(8,4,'','fileStage','2'),(9,4,'','submissionId','1'),(10,4,'','username','aclark'),(11,5,'','fileId','1'),(12,5,'en','filename','chapter1.pdf'),(13,5,'','fileStage','2'),(14,5,'','submissionId','1'),(15,5,'','username','aclark'),(16,6,'','fileId','2'),(17,6,'en','filename','chapter2.pdf'),(18,6,'','fileStage','2'),(19,6,'','submissionId','1'),(20,6,'','username','aclark'),(21,7,'','fileId','2'),(22,7,'en','filename','chapter2.pdf'),(23,7,'','fileStage','2'),(24,7,'','submissionId','1'),(25,7,'','username','aclark'),(26,8,'','fileId','2'),(27,8,'en','filename','chapter2.pdf'),(28,8,'','fileStage','2'),(29,8,'','submissionId','1'),(30,8,'','username','aclark'),(31,9,'','fileId','3'),(32,9,'en','filename','chapter3.pdf'),(33,9,'','fileStage','2'),(34,9,'','submissionId','1'),(35,9,'','username','aclark'),(36,10,'','fileId','3'),(37,10,'en','filename','chapter3.pdf'),(38,10,'','fileStage','2'),(39,10,'','submissionId','1'),(40,10,'','username','aclark'),(41,11,'','fileId','3'),(42,11,'en','filename','chapter3.pdf'),(43,11,'','fileStage','2'),(44,11,'','submissionId','1'),(45,11,'','username','aclark'),(46,14,'','fileId','3'),(47,14,'en','filename','chapter3.pdf'),(48,14,'','fileStage','4'),(49,14,'','sourceSubmissionFileId','3'),(50,14,'','submissionId','1'),(51,14,'','username','dbarnes'),(52,15,'','fileId','3'),(53,15,'en','filename','chapter3.pdf'),(54,15,'','fileStage','4'),(55,15,'','sourceSubmissionFileId','3'),(56,15,'','submissionId','1'),(57,15,'','username','dbarnes'),(58,16,'','fileId','2'),(59,16,'en','filename','chapter2.pdf'),(60,16,'','fileStage','4'),(61,16,'','sourceSubmissionFileId','2'),(62,16,'','submissionId','1'),(63,16,'','username','dbarnes'),(64,17,'','fileId','2'),(65,17,'en','filename','chapter2.pdf'),(66,17,'','fileStage','4'),(67,17,'','sourceSubmissionFileId','2'),(68,17,'','submissionId','1'),(69,17,'','username','dbarnes'),(70,18,'','fileId','1'),(71,18,'en','filename','chapter1.pdf'),(72,18,'','fileStage','4'),(73,18,'','sourceSubmissionFileId','1'),(74,18,'','submissionId','1'),(75,18,'','username','dbarnes'),(76,19,'','fileId','1'),(77,19,'en','filename','chapter1.pdf'),(78,19,'','fileStage','4'),(79,19,'','sourceSubmissionFileId','1'),(80,19,'','submissionId','1'),(81,19,'','username','dbarnes'),(82,20,'','reviewerName','Gonzalo Favio'),(83,20,'','round','1'),(84,20,'','stageId','3'),(85,20,'','submissionId','1'),(86,22,'','userFullName','Sarah Vogt'),(87,22,'en','userGroupName','Copyeditor'),(88,22,'fr_CA','userGroupName','Réviseur-e'),(89,22,'','username','svogt'),(90,26,'','fileId','4'),(91,26,'en','filename','chapter1.pdf'),(92,26,'','fileStage','2'),(93,26,'','submissionId','2'),(94,26,'','username','afinkel'),(95,27,'','fileId','4'),(96,27,'en','filename','chapter1.pdf'),(97,27,'','fileStage','2'),(98,27,'','submissionId','2'),(99,27,'','username','afinkel'),(100,28,'','fileId','4'),(101,28,'en','filename','chapter1.pdf'),(102,28,'','fileStage','2'),(103,28,'','submissionId','2'),(104,28,'','username','afinkel'),(105,29,'','fileId','5'),(106,29,'en','filename','chapter2.pdf'),(107,29,'','fileStage','2'),(108,29,'','submissionId','2'),(109,29,'','username','afinkel'),(110,30,'','fileId','5'),(111,30,'en','filename','chapter2.pdf'),(112,30,'','fileStage','2'),(113,30,'','submissionId','2'),(114,30,'','username','afinkel'),(115,31,'','fileId','5'),(116,31,'en','filename','chapter2.pdf'),(117,31,'','fileStage','2'),(118,31,'','submissionId','2'),(119,31,'','username','afinkel'),(120,32,'','fileId','6'),(121,32,'en','filename','chapter3.pdf'),(122,32,'','fileStage','2'),(123,32,'','submissionId','2'),(124,32,'','username','afinkel'),(125,33,'','fileId','6'),(126,33,'en','filename','chapter3.pdf'),(127,33,'','fileStage','2'),(128,33,'','submissionId','2'),(129,33,'','username','afinkel'),(130,34,'','fileId','6'),(131,34,'en','filename','chapter3.pdf'),(132,34,'','fileStage','2'),(133,34,'','submissionId','2'),(134,34,'','username','afinkel'),(135,35,'','fileId','7'),(136,35,'en','filename','chapter4.pdf'),(137,35,'','fileStage','2'),(138,35,'','submissionId','2'),(139,35,'','username','afinkel'),(140,36,'','fileId','7'),(141,36,'en','filename','chapter4.pdf'),(142,36,'','fileStage','2'),(143,36,'','submissionId','2'),(144,36,'','username','afinkel'),(145,37,'','fileId','7'),(146,37,'en','filename','chapter4.pdf'),(147,37,'','fileStage','2'),(148,37,'','submissionId','2'),(149,37,'','username','afinkel'),(150,38,'','fileId','8'),(151,38,'en','filename','delete-this-file.pdf'),(152,38,'','fileStage','2'),(153,38,'','submissionId','2'),(154,38,'','username','afinkel'),(155,39,'','fileId','8'),(156,39,'en','filename','delete-this-file.pdf'),(157,39,'','fileStage','2'),(158,39,'','submissionId','2'),(159,39,'','username','afinkel'),(160,40,'','fileId','8'),(161,40,'en','filename','delete-this-file.pdf'),(162,40,'','fileStage','2'),(163,40,'','submissionId','2'),(164,40,'','username','afinkel'),(165,41,'','fileId','8'),(166,41,'en','filename','delete-this-file.pdf'),(167,41,'','fileStage','2'),(168,41,'','submissionId','2'),(169,41,'','username','afinkel'),(170,44,'','fileId','7'),(171,44,'en','filename','chapter4.pdf'),(172,44,'','fileStage','4'),(173,44,'','sourceSubmissionFileId','10'),(174,44,'','submissionId','2'),(175,44,'','username','dbarnes'),(176,45,'','fileId','7'),(177,45,'en','filename','chapter4.pdf'),(178,45,'','fileStage','4'),(179,45,'','sourceSubmissionFileId','10'),(180,45,'','submissionId','2'),(181,45,'','username','dbarnes'),(182,46,'','fileId','6'),(183,46,'en','filename','chapter3.pdf'),(184,46,'','fileStage','4'),(185,46,'','sourceSubmissionFileId','9'),(186,46,'','submissionId','2'),(187,46,'','username','dbarnes'),(188,47,'','fileId','6'),(189,47,'en','filename','chapter3.pdf'),(190,47,'','fileStage','4'),(191,47,'','sourceSubmissionFileId','9'),(192,47,'','submissionId','2'),(193,47,'','username','dbarnes'),(194,48,'','fileId','5'),(195,48,'en','filename','chapter2.pdf'),(196,48,'','fileStage','4'),(197,48,'','sourceSubmissionFileId','8'),(198,48,'','submissionId','2'),(199,48,'','username','dbarnes'),(200,49,'','fileId','5'),(201,49,'en','filename','chapter2.pdf'),(202,49,'','fileStage','4'),(203,49,'','sourceSubmissionFileId','8'),(204,49,'','submissionId','2'),(205,49,'','username','dbarnes'),(206,50,'','fileId','4'),(207,50,'en','filename','chapter1.pdf'),(208,50,'','fileStage','4'),(209,50,'','sourceSubmissionFileId','7'),(210,50,'','submissionId','2'),(211,50,'','username','dbarnes'),(212,51,'','fileId','4'),(213,51,'en','filename','chapter1.pdf'),(214,51,'','fileStage','4'),(215,51,'','sourceSubmissionFileId','7'),(216,51,'','submissionId','2'),(217,51,'','username','dbarnes'),(218,52,'','reviewerName','Al Zacharia'),(219,52,'','round','1'),(220,52,'','stageId','3'),(221,52,'','submissionId','2'),(222,53,'','reviewerName','Gonzalo Favio'),(223,53,'','round','1'),(224,53,'','stageId','3'),(225,53,'','submissionId','2'),(226,56,'','fileId','9'),(227,56,'en','filename','chapter1.pdf'),(228,56,'','fileStage','2'),(229,56,'','submissionId','3'),(230,56,'','username','bbarnetson'),(231,57,'','fileId','9'),(232,57,'en','filename','chapter1.pdf'),(233,57,'','fileStage','2'),(234,57,'','submissionId','3'),(235,57,'','username','bbarnetson'),(236,58,'','fileId','9'),(237,58,'en','filename','chapter1.pdf'),(238,58,'','fileStage','2'),(239,58,'','submissionId','3'),(240,58,'','username','bbarnetson'),(241,59,'','fileId','10'),(242,59,'en','filename','chapter2.pdf'),(243,59,'','fileStage','2'),(244,59,'','submissionId','3'),(245,59,'','username','bbarnetson'),(246,60,'','fileId','10'),(247,60,'en','filename','chapter2.pdf'),(248,60,'','fileStage','2'),(249,60,'','submissionId','3'),(250,60,'','username','bbarnetson'),(251,61,'','fileId','10'),(252,61,'en','filename','chapter2.pdf'),(253,61,'','fileStage','2'),(254,61,'','submissionId','3'),(255,61,'','username','bbarnetson'),(256,62,'','fileId','11'),(257,62,'en','filename','chapter3.pdf'),(258,62,'','fileStage','2'),(259,62,'','submissionId','3'),(260,62,'','username','bbarnetson'),(261,63,'','fileId','11'),(262,63,'en','filename','chapter3.pdf'),(263,63,'','fileStage','2'),(264,63,'','submissionId','3'),(265,63,'','username','bbarnetson'),(266,64,'','fileId','11'),(267,64,'en','filename','chapter3.pdf'),(268,64,'','fileStage','2'),(269,64,'','submissionId','3'),(270,64,'','username','bbarnetson'),(271,65,'','fileId','12'),(272,65,'en','filename','chapter4.pdf'),(273,65,'','fileStage','2'),(274,65,'','submissionId','3'),(275,65,'','username','bbarnetson'),(276,66,'','fileId','12'),(277,66,'en','filename','chapter4.pdf'),(278,66,'','fileStage','2'),(279,66,'','submissionId','3'),(280,66,'','username','bbarnetson'),(281,67,'','fileId','12'),(282,67,'en','filename','chapter4.pdf'),(283,67,'','fileStage','2'),(284,67,'','submissionId','3'),(285,67,'','username','bbarnetson'),(286,68,'','fileId','13'),(287,68,'en','filename','chapter5.pdf'),(288,68,'','fileStage','2'),(289,68,'','submissionId','3'),(290,68,'','username','bbarnetson'),(291,69,'','fileId','13'),(292,69,'en','filename','chapter5.pdf'),(293,69,'','fileStage','2'),(294,69,'','submissionId','3'),(295,69,'','username','bbarnetson'),(296,70,'','fileId','13'),(297,70,'en','filename','chapter5.pdf'),(298,70,'','fileStage','2'),(299,70,'','submissionId','3'),(300,70,'','username','bbarnetson'),(301,74,'','fileId','14'),(302,74,'en','filename','chapter1.pdf'),(303,74,'','fileStage','2'),(304,74,'','submissionId','4'),(305,74,'','username','bbeaty'),(306,75,'','fileId','14'),(307,75,'en','filename','chapter1.pdf'),(308,75,'','fileStage','2'),(309,75,'','submissionId','4'),(310,75,'','username','bbeaty'),(311,76,'','fileId','14'),(312,76,'en','filename','chapter1.pdf'),(313,76,'','fileStage','2'),(314,76,'','submissionId','4'),(315,76,'','username','bbeaty'),(316,77,'','fileId','15'),(317,77,'en','filename','chapter2.pdf'),(318,77,'','fileStage','2'),(319,77,'','submissionId','4'),(320,77,'','username','bbeaty'),(321,78,'','fileId','15'),(322,78,'en','filename','chapter2.pdf'),(323,78,'','fileStage','2'),(324,78,'','submissionId','4'),(325,78,'','username','bbeaty'),(326,79,'','fileId','15'),(327,79,'en','filename','chapter2.pdf'),(328,79,'','fileStage','2'),(329,79,'','submissionId','4'),(330,79,'','username','bbeaty'),(331,80,'','fileId','16'),(332,80,'en','filename','chapter3.pdf'),(333,80,'','fileStage','2'),(334,80,'','submissionId','4'),(335,80,'','username','bbeaty'),(336,81,'','fileId','16'),(337,81,'en','filename','chapter3.pdf'),(338,81,'','fileStage','2'),(339,81,'','submissionId','4'),(340,81,'','username','bbeaty'),(341,82,'','fileId','16'),(342,82,'en','filename','chapter3.pdf'),(343,82,'','fileStage','2'),(344,82,'','submissionId','4'),(345,82,'','username','bbeaty'),(346,83,'','fileId','17'),(347,83,'en','filename','intro.pdf'),(348,83,'','fileStage','2'),(349,83,'','submissionId','4'),(350,83,'','username','bbeaty'),(351,84,'','fileId','17'),(352,84,'en','filename','intro.pdf'),(353,84,'','fileStage','2'),(354,84,'','submissionId','4'),(355,84,'','username','bbeaty'),(356,85,'','fileId','17'),(357,85,'en','filename','intro.pdf'),(358,85,'','fileStage','2'),(359,85,'','submissionId','4'),(360,85,'','username','bbeaty'),(361,88,'','fileId','16'),(362,88,'en','filename','chapter3.pdf'),(363,88,'','fileStage','19'),(364,88,'','sourceSubmissionFileId','23'),(365,88,'','submissionId','4'),(366,88,'','username','dbarnes'),(367,89,'','fileId','16'),(368,89,'en','filename','chapter3.pdf'),(369,89,'','fileStage','19'),(370,89,'','sourceSubmissionFileId','23'),(371,89,'','submissionId','4'),(372,89,'','username','dbarnes'),(373,90,'','fileId','17'),(374,90,'en','filename','intro.pdf'),(375,90,'','fileStage','19'),(376,90,'','sourceSubmissionFileId','24'),(377,90,'','submissionId','4'),(378,90,'','username','dbarnes'),(379,91,'','fileId','17'),(380,91,'en','filename','intro.pdf'),(381,91,'','fileStage','19'),(382,91,'','sourceSubmissionFileId','24'),(383,91,'','submissionId','4'),(384,91,'','username','dbarnes'),(385,92,'','fileId','15'),(386,92,'en','filename','chapter2.pdf'),(387,92,'','fileStage','19'),(388,92,'','sourceSubmissionFileId','22'),(389,92,'','submissionId','4'),(390,92,'','username','dbarnes'),(391,93,'','fileId','15'),(392,93,'en','filename','chapter2.pdf'),(393,93,'','fileStage','19'),(394,93,'','sourceSubmissionFileId','22'),(395,93,'','submissionId','4'),(396,93,'','username','dbarnes'),(397,94,'','fileId','14'),(398,94,'en','filename','chapter1.pdf'),(399,94,'','fileStage','19'),(400,94,'','sourceSubmissionFileId','21'),(401,94,'','submissionId','4'),(402,94,'','username','dbarnes'),(403,95,'','fileId','14'),(404,95,'en','filename','chapter1.pdf'),(405,95,'','fileStage','19'),(406,95,'','sourceSubmissionFileId','21'),(407,95,'','submissionId','4'),(408,95,'','username','dbarnes'),(409,96,'','reviewerName','Aisla McCrae'),(410,96,'','round','1'),(411,96,'','stageId','2'),(412,96,'','submissionId','4'),(413,98,'','reviewerName','Al Zacharia'),(414,98,'','round','1'),(415,98,'','stageId','3'),(416,98,'','submissionId','4'),(417,100,'','userFullName','Maria Fritz'),(418,100,'en','userGroupName','Copyeditor'),(419,100,'fr_CA','userGroupName','Réviseur-e'),(420,100,'','username','mfritz'),(421,102,'','userFullName','Graham Cox'),(422,102,'en','userGroupName','Layout Editor'),(423,102,'fr_CA','userGroupName','Responsable de la mise en page'),(424,102,'','username','gcox'),(425,103,'en','publicationFormatName','PDF'),(426,103,'fr_CA','publicationFormatName',''),(427,106,'','fileId','18'),(428,106,'en','filename','prologue.pdf'),(429,106,'','fileStage','2'),(430,106,'','submissionId','5'),(431,106,'','username','callan'),(432,107,'','fileId','18'),(433,107,'en','filename','prologue.pdf'),(434,107,'','fileStage','2'),(435,107,'','submissionId','5'),(436,107,'','username','callan'),(437,108,'','fileId','18'),(438,108,'en','filename','prologue.pdf'),(439,108,'','fileStage','2'),(440,108,'','submissionId','5'),(441,108,'','username','callan'),(442,109,'','fileId','19'),(443,109,'en','filename','chapter1.pdf'),(444,109,'','fileStage','2'),(445,109,'','submissionId','5'),(446,109,'','username','callan'),(447,110,'','fileId','19'),(448,110,'en','filename','chapter1.pdf'),(449,110,'','fileStage','2'),(450,110,'','submissionId','5'),(451,110,'','username','callan'),(452,111,'','fileId','19'),(453,111,'en','filename','chapter1.pdf'),(454,111,'','fileStage','2'),(455,111,'','submissionId','5'),(456,111,'','username','callan'),(457,112,'','fileId','20'),(458,112,'en','filename','chapter2.pdf'),(459,112,'','fileStage','2'),(460,112,'','submissionId','5'),(461,112,'','username','callan'),(462,113,'','fileId','20'),(463,113,'en','filename','chapter2.pdf'),(464,113,'','fileStage','2'),(465,113,'','submissionId','5'),(466,113,'','username','callan'),(467,114,'','fileId','20'),(468,114,'en','filename','chapter2.pdf'),(469,114,'','fileStage','2'),(470,114,'','submissionId','5'),(471,114,'','username','callan'),(472,115,'','fileId','21'),(473,115,'en','filename','chapter3.pdf'),(474,115,'','fileStage','2'),(475,115,'','submissionId','5'),(476,115,'','username','callan'),(477,116,'','fileId','21'),(478,116,'en','filename','chapter3.pdf'),(479,116,'','fileStage','2'),(480,116,'','submissionId','5'),(481,116,'','username','callan'),(482,117,'','fileId','21'),(483,117,'en','filename','chapter3.pdf'),(484,117,'','fileStage','2'),(485,117,'','submissionId','5'),(486,117,'','username','callan'),(487,118,'','fileId','22'),(488,118,'en','filename','chapter4.pdf'),(489,118,'','fileStage','2'),(490,118,'','submissionId','5'),(491,118,'','username','callan'),(492,119,'','fileId','22'),(493,119,'en','filename','chapter4.pdf'),(494,119,'','fileStage','2'),(495,119,'','submissionId','5'),(496,119,'','username','callan'),(497,120,'','fileId','22'),(498,120,'en','filename','chapter4.pdf'),(499,120,'','fileStage','2'),(500,120,'','submissionId','5'),(501,120,'','username','callan'),(502,121,'','fileId','23'),(503,121,'en','filename','epilogue.pdf'),(504,121,'','fileStage','2'),(505,121,'','submissionId','5'),(506,121,'','username','callan'),(507,122,'','fileId','23'),(508,122,'en','filename','epilogue.pdf'),(509,122,'','fileStage','2'),(510,122,'','submissionId','5'),(511,122,'','username','callan'),(512,123,'','fileId','23'),(513,123,'en','filename','epilogue.pdf'),(514,123,'','fileStage','2'),(515,123,'','submissionId','5'),(516,123,'','username','callan'),(517,126,'','fileId','23'),(518,126,'en','filename','epilogue.pdf'),(519,126,'','fileStage','19'),(520,126,'','sourceSubmissionFileId','34'),(521,126,'','submissionId','5'),(522,126,'','username','dbarnes'),(523,127,'','fileId','23'),(524,127,'en','filename','epilogue.pdf'),(525,127,'','fileStage','19'),(526,127,'','sourceSubmissionFileId','34'),(527,127,'','submissionId','5'),(528,127,'','username','dbarnes'),(529,128,'','fileId','22'),(530,128,'en','filename','chapter4.pdf'),(531,128,'','fileStage','19'),(532,128,'','sourceSubmissionFileId','33'),(533,128,'','submissionId','5'),(534,128,'','username','dbarnes'),(535,129,'','fileId','22'),(536,129,'en','filename','chapter4.pdf'),(537,129,'','fileStage','19'),(538,129,'','sourceSubmissionFileId','33'),(539,129,'','submissionId','5'),(540,129,'','username','dbarnes'),(541,130,'','fileId','21'),(542,130,'en','filename','chapter3.pdf'),(543,130,'','fileStage','19'),(544,130,'','sourceSubmissionFileId','32'),(545,130,'','submissionId','5'),(546,130,'','username','dbarnes'),(547,131,'','fileId','21'),(548,131,'en','filename','chapter3.pdf'),(549,131,'','fileStage','19'),(550,131,'','sourceSubmissionFileId','32'),(551,131,'','submissionId','5'),(552,131,'','username','dbarnes'),(553,132,'','fileId','20'),(554,132,'en','filename','chapter2.pdf'),(555,132,'','fileStage','19'),(556,132,'','sourceSubmissionFileId','31'),(557,132,'','submissionId','5'),(558,132,'','username','dbarnes'),(559,133,'','fileId','20'),(560,133,'en','filename','chapter2.pdf'),(561,133,'','fileStage','19'),(562,133,'','sourceSubmissionFileId','31'),(563,133,'','submissionId','5'),(564,133,'','username','dbarnes'),(565,134,'','fileId','19'),(566,134,'en','filename','chapter1.pdf'),(567,134,'','fileStage','19'),(568,134,'','sourceSubmissionFileId','30'),(569,134,'','submissionId','5'),(570,134,'','username','dbarnes'),(571,135,'','fileId','19'),(572,135,'en','filename','chapter1.pdf'),(573,135,'','fileStage','19'),(574,135,'','sourceSubmissionFileId','30'),(575,135,'','submissionId','5'),(576,135,'','username','dbarnes'),(577,136,'','fileId','18'),(578,136,'en','filename','prologue.pdf'),(579,136,'','fileStage','19'),(580,136,'','sourceSubmissionFileId','29'),(581,136,'','submissionId','5'),(582,136,'','username','dbarnes'),(583,137,'','fileId','18'),(584,137,'en','filename','prologue.pdf'),(585,137,'','fileStage','19'),(586,137,'','sourceSubmissionFileId','29'),(587,137,'','submissionId','5'),(588,137,'','username','dbarnes'),(589,138,'','reviewerName','Paul Hudson'),(590,138,'','round','1'),(591,138,'','stageId','2'),(592,138,'','submissionId','5'),(593,140,'','reviewerName','Gonzalo Favio'),(594,140,'','round','1'),(595,140,'','stageId','3'),(596,140,'','submissionId','5'),(597,142,'','userFullName','Sarah Vogt'),(598,142,'en','userGroupName','Copyeditor'),(599,142,'fr_CA','userGroupName','Réviseur-e'),(600,142,'','username','svogt'),(601,144,'','userFullName','Stephen Hellier'),(602,144,'en','userGroupName','Layout Editor'),(603,144,'fr_CA','userGroupName','Responsable de la mise en page'),(604,144,'','username','shellier'),(605,145,'','userFullName','Catherine Turner'),(606,145,'en','userGroupName','Proofreader'),(607,145,'fr_CA','userGroupName','Correcteur-trice d\'épreuves'),(608,145,'','username','cturner'),(609,146,'en','publicationFormatName','PDF'),(610,146,'fr_CA','publicationFormatName',''),(611,147,'','fileId','23'),(612,147,'en','filename','epilogue.pdf'),(613,147,'','fileStage','10'),(614,147,'','sourceSubmissionFileId','34'),(615,147,'','submissionId','5'),(616,147,'','username','dbarnes'),(617,148,'','fileId','23'),(618,148,'en','filename','epilogue.pdf'),(619,148,'','fileStage','10'),(620,148,'','sourceSubmissionFileId','34'),(621,148,'','submissionId','5'),(622,148,'','username','dbarnes'),(623,149,'en','publicationFormatName','PDF'),(624,149,'fr_CA','publicationFormatName',''),(625,150,'en','publicationFormatName','PDF'),(626,150,'fr_CA','publicationFormatName',''),(627,151,'','fileId','23'),(628,151,'en','filename','epilogue.pdf'),(629,151,'','fileStage','10'),(630,151,'','sourceSubmissionFileId','34'),(631,151,'','submissionId','5'),(632,151,'','username','dbarnes'),(633,152,'en','filename','epilogue.pdf'),(634,152,'','userFullName','Daniel Barnes'),(635,152,'','username','dbarnes'),(636,153,'','fileId','23'),(637,153,'en','filename','epilogue.pdf'),(638,153,'','fileStage','10'),(639,153,'','sourceSubmissionFileId','34'),(640,153,'','submissionId','5'),(641,153,'','username','dbarnes'),(642,159,'','fileId','24'),(643,159,'en','filename','chapter1.pdf'),(644,159,'','fileStage','2'),(645,159,'','submissionId','6'),(646,159,'','username','dbernnard'),(647,160,'','fileId','24'),(648,160,'en','filename','chapter1.pdf'),(649,160,'','fileStage','2'),(650,160,'','submissionId','6'),(651,160,'','username','dbernnard'),(652,161,'','fileId','24'),(653,161,'en','filename','chapter1.pdf'),(654,161,'','fileStage','2'),(655,161,'','submissionId','6'),(656,161,'','username','dbernnard'),(657,162,'','fileId','25'),(658,162,'en','filename','chapter2.pdf'),(659,162,'','fileStage','2'),(660,162,'','submissionId','6'),(661,162,'','username','dbernnard'),(662,163,'','fileId','25'),(663,163,'en','filename','chapter2.pdf'),(664,163,'','fileStage','2'),(665,163,'','submissionId','6'),(666,163,'','username','dbernnard'),(667,164,'','fileId','25'),(668,164,'en','filename','chapter2.pdf'),(669,164,'','fileStage','2'),(670,164,'','submissionId','6'),(671,164,'','username','dbernnard'),(672,165,'','fileId','26'),(673,165,'en','filename','chapter3.pdf'),(674,165,'','fileStage','2'),(675,165,'','submissionId','6'),(676,165,'','username','dbernnard'),(677,166,'','fileId','26'),(678,166,'en','filename','chapter3.pdf'),(679,166,'','fileStage','2'),(680,166,'','submissionId','6'),(681,166,'','username','dbernnard'),(682,167,'','fileId','26'),(683,167,'en','filename','chapter3.pdf'),(684,167,'','fileStage','2'),(685,167,'','submissionId','6'),(686,167,'','username','dbernnard'),(687,168,'','fileId','27'),(688,168,'en','filename','chapter4.pdf'),(689,168,'','fileStage','2'),(690,168,'','submissionId','6'),(691,168,'','username','dbernnard'),(692,169,'','fileId','27'),(693,169,'en','filename','chapter4.pdf'),(694,169,'','fileStage','2'),(695,169,'','submissionId','6'),(696,169,'','username','dbernnard'),(697,170,'','fileId','27'),(698,170,'en','filename','chapter4.pdf'),(699,170,'','fileStage','2'),(700,170,'','submissionId','6'),(701,170,'','username','dbernnard'),(702,173,'','fileId','27'),(703,173,'en','filename','chapter4.pdf'),(704,173,'','fileStage','19'),(705,173,'','sourceSubmissionFileId','45'),(706,173,'','submissionId','6'),(707,173,'','username','dbarnes'),(708,174,'','fileId','27'),(709,174,'en','filename','chapter4.pdf'),(710,174,'','fileStage','19'),(711,174,'','sourceSubmissionFileId','45'),(712,174,'','submissionId','6'),(713,174,'','username','dbarnes'),(714,175,'','fileId','25'),(715,175,'en','filename','chapter2.pdf'),(716,175,'','fileStage','19'),(717,175,'','sourceSubmissionFileId','43'),(718,175,'','submissionId','6'),(719,175,'','username','dbarnes'),(720,176,'','fileId','25'),(721,176,'en','filename','chapter2.pdf'),(722,176,'','fileStage','19'),(723,176,'','sourceSubmissionFileId','43'),(724,176,'','submissionId','6'),(725,176,'','username','dbarnes'),(726,177,'','fileId','24'),(727,177,'en','filename','chapter1.pdf'),(728,177,'','fileStage','19'),(729,177,'','sourceSubmissionFileId','42'),(730,177,'','submissionId','6'),(731,177,'','username','dbarnes'),(732,178,'','fileId','24'),(733,178,'en','filename','chapter1.pdf'),(734,178,'','fileStage','19'),(735,178,'','sourceSubmissionFileId','42'),(736,178,'','submissionId','6'),(737,178,'','username','dbarnes'),(738,179,'','fileId','26'),(739,179,'en','filename','chapter3.pdf'),(740,179,'','fileStage','19'),(741,179,'','sourceSubmissionFileId','44'),(742,179,'','submissionId','6'),(743,179,'','username','dbarnes'),(744,180,'','fileId','26'),(745,180,'en','filename','chapter3.pdf'),(746,180,'','fileStage','19'),(747,180,'','sourceSubmissionFileId','44'),(748,180,'','submissionId','6'),(749,180,'','username','dbarnes'),(750,181,'','userFullName','Daniel Barnes'),(751,181,'en','userGroupName','Press editor'),(752,181,'fr_CA','userGroupName','Rédacteur/Rédactrice en chef de la presse'),(753,181,'','username','dbarnes'),(754,182,'','userFullName','Minoti Inoue'),(755,182,'en','userGroupName','Series editor'),(756,182,'fr_CA','userGroupName','Rédacteur/Rédactrice en chef de la série'),(757,182,'','username','minoue'),(758,186,'','fileId','28'),(759,186,'en','filename','intro.pdf'),(760,186,'','fileStage','2'),(761,186,'','submissionId','7'),(762,186,'','username','dkennepohl'),(763,187,'','fileId','28'),(764,187,'en','filename','intro.pdf'),(765,187,'','fileStage','2'),(766,187,'','submissionId','7'),(767,187,'','username','dkennepohl'),(768,188,'','fileId','28'),(769,188,'en','filename','intro.pdf'),(770,188,'','fileStage','2'),(771,188,'','submissionId','7'),(772,188,'','username','dkennepohl'),(773,189,'','fileId','29'),(774,189,'en','filename','chapter1.pdf'),(775,189,'','fileStage','2'),(776,189,'','submissionId','7'),(777,189,'','username','dkennepohl'),(778,190,'','fileId','29'),(779,190,'en','filename','chapter1.pdf'),(780,190,'','fileStage','2'),(781,190,'','submissionId','7'),(782,190,'','username','dkennepohl'),(783,191,'','fileId','29'),(784,191,'en','filename','chapter1.pdf'),(785,191,'','fileStage','2'),(786,191,'','submissionId','7'),(787,191,'','username','dkennepohl'),(788,192,'','fileId','30'),(789,192,'en','filename','chapter2.pdf'),(790,192,'','fileStage','2'),(791,192,'','submissionId','7'),(792,192,'','username','dkennepohl'),(793,193,'','fileId','30'),(794,193,'en','filename','chapter2.pdf'),(795,193,'','fileStage','2'),(796,193,'','submissionId','7'),(797,193,'','username','dkennepohl'),(798,194,'','fileId','30'),(799,194,'en','filename','chapter2.pdf'),(800,194,'','fileStage','2'),(801,194,'','submissionId','7'),(802,194,'','username','dkennepohl'),(803,195,'','fileId','31'),(804,195,'en','filename','chapter3.pdf'),(805,195,'','fileStage','2'),(806,195,'','submissionId','7'),(807,195,'','username','dkennepohl'),(808,196,'','fileId','31'),(809,196,'en','filename','chapter3.pdf'),(810,196,'','fileStage','2'),(811,196,'','submissionId','7'),(812,196,'','username','dkennepohl'),(813,197,'','fileId','31'),(814,197,'en','filename','chapter3.pdf'),(815,197,'','fileStage','2'),(816,197,'','submissionId','7'),(817,197,'','username','dkennepohl'),(818,198,'','fileId','32'),(819,198,'en','filename','chapter4.pdf'),(820,198,'','fileStage','2'),(821,198,'','submissionId','7'),(822,198,'','username','dkennepohl'),(823,199,'','fileId','32'),(824,199,'en','filename','chapter4.pdf'),(825,199,'','fileStage','2'),(826,199,'','submissionId','7'),(827,199,'','username','dkennepohl'),(828,200,'','fileId','32'),(829,200,'en','filename','chapter4.pdf'),(830,200,'','fileStage','2'),(831,200,'','submissionId','7'),(832,200,'','username','dkennepohl'),(833,203,'','fileId','32'),(834,203,'en','filename','chapter4.pdf'),(835,203,'','fileStage','4'),(836,203,'','sourceSubmissionFileId','54'),(837,203,'','submissionId','7'),(838,203,'','username','dbarnes'),(839,204,'','fileId','32'),(840,204,'en','filename','chapter4.pdf'),(841,204,'','fileStage','4'),(842,204,'','sourceSubmissionFileId','54'),(843,204,'','submissionId','7'),(844,204,'','username','dbarnes'),(845,205,'','fileId','30'),(846,205,'en','filename','chapter2.pdf'),(847,205,'','fileStage','4'),(848,205,'','sourceSubmissionFileId','52'),(849,205,'','submissionId','7'),(850,205,'','username','dbarnes'),(851,206,'','fileId','30'),(852,206,'en','filename','chapter2.pdf'),(853,206,'','fileStage','4'),(854,206,'','sourceSubmissionFileId','52'),(855,206,'','submissionId','7'),(856,206,'','username','dbarnes'),(857,207,'','fileId','31'),(858,207,'en','filename','chapter3.pdf'),(859,207,'','fileStage','4'),(860,207,'','sourceSubmissionFileId','53'),(861,207,'','submissionId','7'),(862,207,'','username','dbarnes'),(863,208,'','fileId','31'),(864,208,'en','filename','chapter3.pdf'),(865,208,'','fileStage','4'),(866,208,'','sourceSubmissionFileId','53'),(867,208,'','submissionId','7'),(868,208,'','username','dbarnes'),(869,209,'','fileId','29'),(870,209,'en','filename','chapter1.pdf'),(871,209,'','fileStage','4'),(872,209,'','sourceSubmissionFileId','51'),(873,209,'','submissionId','7'),(874,209,'','username','dbarnes'),(875,210,'','fileId','29'),(876,210,'en','filename','chapter1.pdf'),(877,210,'','fileStage','4'),(878,210,'','sourceSubmissionFileId','51'),(879,210,'','submissionId','7'),(880,210,'','username','dbarnes'),(881,211,'','fileId','28'),(882,211,'en','filename','intro.pdf'),(883,211,'','fileStage','4'),(884,211,'','sourceSubmissionFileId','50'),(885,211,'','submissionId','7'),(886,211,'','username','dbarnes'),(887,212,'','fileId','28'),(888,212,'en','filename','intro.pdf'),(889,212,'','fileStage','4'),(890,212,'','sourceSubmissionFileId','50'),(891,212,'','submissionId','7'),(892,212,'','username','dbarnes'),(893,213,'','reviewerName','Adela Gallego'),(894,213,'','round','1'),(895,213,'','stageId','3'),(896,213,'','submissionId','7'),(897,215,'','userFullName','Maria Fritz'),(898,215,'en','userGroupName','Copyeditor'),(899,215,'fr_CA','userGroupName','Réviseur-e'),(900,215,'','username','mfritz'),(901,217,'','fileId','33'),(902,217,'en','filename','note.pdf'),(903,217,'','fileStage','2'),(904,217,'','submissionId','8'),(905,217,'','username','dbarnes'),(906,218,'','fileId','33'),(907,218,'en','filename','note.pdf'),(908,218,'','fileStage','2'),(909,218,'','submissionId','8'),(910,218,'','username','dbarnes'),(911,219,'','fileId','33'),(912,219,'en','filename','note.pdf'),(913,219,'','fileStage','2'),(914,219,'','submissionId','8'),(915,219,'','username','dbarnes'),(916,223,'','fileId','34'),(917,223,'en','filename','chapter1.pdf'),(918,223,'','fileStage','2'),(919,223,'','submissionId','9'),(920,223,'','username','fperini'),(921,224,'','fileId','34'),(922,224,'en','filename','chapter1.pdf'),(923,224,'','fileStage','2'),(924,224,'','submissionId','9'),(925,224,'','username','fperini'),(926,225,'','fileId','34'),(927,225,'en','filename','chapter1.pdf'),(928,225,'','fileStage','2'),(929,225,'','submissionId','9'),(930,225,'','username','fperini'),(931,226,'','fileId','35'),(932,226,'en','filename','chapter2.pdf'),(933,226,'','fileStage','2'),(934,226,'','submissionId','9'),(935,226,'','username','fperini'),(936,227,'','fileId','35'),(937,227,'en','filename','chapter2.pdf'),(938,227,'','fileStage','2'),(939,227,'','submissionId','9'),(940,227,'','username','fperini'),(941,228,'','fileId','35'),(942,228,'en','filename','chapter2.pdf'),(943,228,'','fileStage','2'),(944,228,'','submissionId','9'),(945,228,'','username','fperini'),(946,229,'','fileId','36'),(947,229,'en','filename','chapter3.pdf'),(948,229,'','fileStage','2'),(949,229,'','submissionId','9'),(950,229,'','username','fperini'),(951,230,'','fileId','36'),(952,230,'en','filename','chapter3.pdf'),(953,230,'','fileStage','2'),(954,230,'','submissionId','9'),(955,230,'','username','fperini'),(956,231,'','fileId','36'),(957,231,'en','filename','chapter3.pdf'),(958,231,'','fileStage','2'),(959,231,'','submissionId','9'),(960,231,'','username','fperini'),(961,232,'','fileId','37'),(962,232,'en','filename','chapter4.pdf'),(963,232,'','fileStage','2'),(964,232,'','submissionId','9'),(965,232,'','username','fperini'),(966,233,'','fileId','37'),(967,233,'en','filename','chapter4.pdf'),(968,233,'','fileStage','2'),(969,233,'','submissionId','9'),(970,233,'','username','fperini'),(971,234,'','fileId','37'),(972,234,'en','filename','chapter4.pdf'),(973,234,'','fileStage','2'),(974,234,'','submissionId','9'),(975,234,'','username','fperini'),(976,235,'','fileId','38'),(977,235,'en','filename','chapter5.pdf'),(978,235,'','fileStage','2'),(979,235,'','submissionId','9'),(980,235,'','username','fperini'),(981,236,'','fileId','38'),(982,236,'en','filename','chapter5.pdf'),(983,236,'','fileStage','2'),(984,236,'','submissionId','9'),(985,236,'','username','fperini'),(986,237,'','fileId','38'),(987,237,'en','filename','chapter5.pdf'),(988,237,'','fileStage','2'),(989,237,'','submissionId','9'),(990,237,'','username','fperini'),(991,240,'','fileId','38'),(992,240,'en','filename','chapter5.pdf'),(993,240,'','fileStage','19'),(994,240,'','sourceSubmissionFileId','65'),(995,240,'','submissionId','9'),(996,240,'','username','dbarnes'),(997,241,'','fileId','38'),(998,241,'en','filename','chapter5.pdf'),(999,241,'','fileStage','19'),(1000,241,'','sourceSubmissionFileId','65'),(1001,241,'','submissionId','9'),(1002,241,'','username','dbarnes'),(1003,242,'','fileId','36'),(1004,242,'en','filename','chapter3.pdf'),(1005,242,'','fileStage','19'),(1006,242,'','sourceSubmissionFileId','63'),(1007,242,'','submissionId','9'),(1008,242,'','username','dbarnes'),(1009,243,'','fileId','36'),(1010,243,'en','filename','chapter3.pdf'),(1011,243,'','fileStage','19'),(1012,243,'','sourceSubmissionFileId','63'),(1013,243,'','submissionId','9'),(1014,243,'','username','dbarnes'),(1015,244,'','fileId','37'),(1016,244,'en','filename','chapter4.pdf'),(1017,244,'','fileStage','19'),(1018,244,'','sourceSubmissionFileId','64'),(1019,244,'','submissionId','9'),(1020,244,'','username','dbarnes'),(1021,245,'','fileId','37'),(1022,245,'en','filename','chapter4.pdf'),(1023,245,'','fileStage','19'),(1024,245,'','sourceSubmissionFileId','64'),(1025,245,'','submissionId','9'),(1026,245,'','username','dbarnes'),(1027,246,'','fileId','35'),(1028,246,'en','filename','chapter2.pdf'),(1029,246,'','fileStage','19'),(1030,246,'','sourceSubmissionFileId','62'),(1031,246,'','submissionId','9'),(1032,246,'','username','dbarnes'),(1033,247,'','fileId','35'),(1034,247,'en','filename','chapter2.pdf'),(1035,247,'','fileStage','19'),(1036,247,'','sourceSubmissionFileId','62'),(1037,247,'','submissionId','9'),(1038,247,'','username','dbarnes'),(1039,248,'','fileId','34'),(1040,248,'en','filename','chapter1.pdf'),(1041,248,'','fileStage','19'),(1042,248,'','sourceSubmissionFileId','61'),(1043,248,'','submissionId','9'),(1044,248,'','username','dbarnes'),(1045,249,'','fileId','34'),(1046,249,'en','filename','chapter1.pdf'),(1047,249,'','fileStage','19'),(1048,249,'','sourceSubmissionFileId','61'),(1049,249,'','submissionId','9'),(1050,249,'','username','dbarnes'),(1051,252,'','fileId','39'),(1052,252,'en','filename','intro.pdf'),(1053,252,'','fileStage','2'),(1054,252,'','submissionId','10'),(1055,252,'','username','jbrower'),(1056,253,'','fileId','39'),(1057,253,'en','filename','intro.pdf'),(1058,253,'','fileStage','2'),(1059,253,'','submissionId','10'),(1060,253,'','username','jbrower'),(1061,254,'','fileId','39'),(1062,254,'en','filename','intro.pdf'),(1063,254,'','fileStage','2'),(1064,254,'','submissionId','10'),(1065,254,'','username','jbrower'),(1066,255,'','fileId','40'),(1067,255,'en','filename','chapter1.pdf'),(1068,255,'','fileStage','2'),(1069,255,'','submissionId','10'),(1070,255,'','username','jbrower'),(1071,256,'','fileId','40'),(1072,256,'en','filename','chapter1.pdf'),(1073,256,'','fileStage','2'),(1074,256,'','submissionId','10'),(1075,256,'','username','jbrower'),(1076,257,'','fileId','40'),(1077,257,'en','filename','chapter1.pdf'),(1078,257,'','fileStage','2'),(1079,257,'','submissionId','10'),(1080,257,'','username','jbrower'),(1081,258,'','fileId','41'),(1082,258,'en','filename','chapter2.pdf'),(1083,258,'','fileStage','2'),(1084,258,'','submissionId','10'),(1085,258,'','username','jbrower'),(1086,259,'','fileId','41'),(1087,259,'en','filename','chapter2.pdf'),(1088,259,'','fileStage','2'),(1089,259,'','submissionId','10'),(1090,259,'','username','jbrower'),(1091,260,'','fileId','41'),(1092,260,'en','filename','chapter2.pdf'),(1093,260,'','fileStage','2'),(1094,260,'','submissionId','10'),(1095,260,'','username','jbrower'),(1096,261,'','fileId','42'),(1097,261,'en','filename','chapter3.pdf'),(1098,261,'','fileStage','2'),(1099,261,'','submissionId','10'),(1100,261,'','username','jbrower'),(1101,262,'','fileId','42'),(1102,262,'en','filename','chapter3.pdf'),(1103,262,'','fileStage','2'),(1104,262,'','submissionId','10'),(1105,262,'','username','jbrower'),(1106,263,'','fileId','42'),(1107,263,'en','filename','chapter3.pdf'),(1108,263,'','fileStage','2'),(1109,263,'','submissionId','10'),(1110,263,'','username','jbrower'),(1111,264,'','fileId','43'),(1112,264,'en','filename','chapter4.pdf'),(1113,264,'','fileStage','2'),(1114,264,'','submissionId','10'),(1115,264,'','username','jbrower'),(1116,265,'','fileId','43'),(1117,265,'en','filename','chapter4.pdf'),(1118,265,'','fileStage','2'),(1119,265,'','submissionId','10'),(1120,265,'','username','jbrower'),(1121,266,'','fileId','43'),(1122,266,'en','filename','chapter4.pdf'),(1123,266,'','fileStage','2'),(1124,266,'','submissionId','10'),(1125,266,'','username','jbrower'),(1126,267,'','fileId','44'),(1127,267,'en','filename','chapter5.pdf'),(1128,267,'','fileStage','2'),(1129,267,'','submissionId','10'),(1130,267,'','username','jbrower'),(1131,268,'','fileId','44'),(1132,268,'en','filename','chapter5.pdf'),(1133,268,'','fileStage','2'),(1134,268,'','submissionId','10'),(1135,268,'','username','jbrower'),(1136,269,'','fileId','44'),(1137,269,'en','filename','chapter5.pdf'),(1138,269,'','fileStage','2'),(1139,269,'','submissionId','10'),(1140,269,'','username','jbrower'),(1141,270,'','fileId','45'),(1142,270,'en','filename','conclusion.pdf'),(1143,270,'','fileStage','2'),(1144,270,'','submissionId','10'),(1145,270,'','username','jbrower'),(1146,271,'','fileId','45'),(1147,271,'en','filename','conclusion.pdf'),(1148,271,'','fileStage','2'),(1149,271,'','submissionId','10'),(1150,271,'','username','jbrower'),(1151,272,'','fileId','45'),(1152,272,'en','filename','conclusion.pdf'),(1153,272,'','fileStage','2'),(1154,272,'','submissionId','10'),(1155,272,'','username','jbrower'),(1156,273,'','fileId','46'),(1157,273,'en','filename','bibliography.pdf'),(1158,273,'','fileStage','2'),(1159,273,'','submissionId','10'),(1160,273,'','username','jbrower'),(1161,274,'','fileId','46'),(1162,274,'en','filename','bibliography.pdf'),(1163,274,'','fileStage','2'),(1164,274,'','submissionId','10'),(1165,274,'','username','jbrower'),(1166,275,'','fileId','46'),(1167,275,'en','filename','bibliography.pdf'),(1168,275,'','fileStage','2'),(1169,275,'','submissionId','10'),(1170,275,'','username','jbrower'),(1171,276,'','fileId','47'),(1172,276,'en','filename','index.pdf'),(1173,276,'','fileStage','2'),(1174,276,'','submissionId','10'),(1175,276,'','username','jbrower'),(1176,277,'','fileId','47'),(1177,277,'en','filename','index.pdf'),(1178,277,'','fileStage','2'),(1179,277,'','submissionId','10'),(1180,277,'','username','jbrower'),(1181,278,'','fileId','47'),(1182,278,'en','filename','index.pdf'),(1183,278,'','fileStage','2'),(1184,278,'','submissionId','10'),(1185,278,'','username','jbrower'),(1186,282,'','fileId','48'),(1187,282,'en','filename','intro.pdf'),(1188,282,'','fileStage','2'),(1189,282,'','submissionId','11'),(1190,282,'','username','jlockehart'),(1191,283,'','fileId','48'),(1192,283,'en','filename','intro.pdf'),(1193,283,'','fileStage','2'),(1194,283,'','submissionId','11'),(1195,283,'','username','jlockehart'),(1196,284,'','fileId','48'),(1197,284,'en','filename','intro.pdf'),(1198,284,'','fileStage','2'),(1199,284,'','submissionId','11'),(1200,284,'','username','jlockehart'),(1201,285,'','fileId','49'),(1202,285,'en','filename','poems.pdf'),(1203,285,'','fileStage','2'),(1204,285,'','submissionId','11'),(1205,285,'','username','jlockehart'),(1206,286,'','fileId','49'),(1207,286,'en','filename','poems.pdf'),(1208,286,'','fileStage','2'),(1209,286,'','submissionId','11'),(1210,286,'','username','jlockehart'),(1211,287,'','fileId','49'),(1212,287,'en','filename','poems.pdf'),(1213,287,'','fileStage','2'),(1214,287,'','submissionId','11'),(1215,287,'','username','jlockehart'),(1216,290,'','fileId','49'),(1217,290,'en','filename','poems.pdf'),(1218,290,'','fileStage','19'),(1219,290,'','sourceSubmissionFileId','81'),(1220,290,'','submissionId','11'),(1221,290,'','username','dbarnes'),(1222,291,'','fileId','49'),(1223,291,'en','filename','poems.pdf'),(1224,291,'','fileStage','19'),(1225,291,'','sourceSubmissionFileId','81'),(1226,291,'','submissionId','11'),(1227,291,'','username','dbarnes'),(1228,292,'','fileId','48'),(1229,292,'en','filename','intro.pdf'),(1230,292,'','fileStage','19'),(1231,292,'','sourceSubmissionFileId','80'),(1232,292,'','submissionId','11'),(1233,292,'','username','dbarnes'),(1234,293,'','fileId','48'),(1235,293,'en','filename','intro.pdf'),(1236,293,'','fileStage','19'),(1237,293,'','sourceSubmissionFileId','80'),(1238,293,'','submissionId','11'),(1239,293,'','username','dbarnes'),(1240,294,'','reviewerName','Aisla McCrae'),(1241,294,'','round','1'),(1242,294,'','stageId','2'),(1243,294,'','submissionId','11'),(1244,296,'','reviewerName','Adela Gallego'),(1245,296,'','round','1'),(1246,296,'','stageId','3'),(1247,296,'','submissionId','11'),(1248,297,'','reviewerName','Gonzalo Favio'),(1249,297,'','round','1'),(1250,297,'','stageId','3'),(1251,297,'','submissionId','11'),(1252,298,'','reviewAssignmentId','10'),(1253,298,'','reviewerName','Adela Gallego'),(1254,298,'','round','1'),(1255,298,'','submissionId','11'),(1256,299,'','reviewAssignmentId','10'),(1257,299,'','reviewerName','Adela Gallego'),(1258,299,'','round','1'),(1259,299,'','submissionId','11'),(1260,300,'','reviewAssignmentId','11'),(1261,300,'','reviewerName','Gonzalo Favio'),(1262,300,'','round','1'),(1263,300,'','submissionId','11'),(1264,301,'','reviewAssignmentId','11'),(1265,301,'','reviewerName','Gonzalo Favio'),(1266,301,'','round','1'),(1267,301,'','submissionId','11'),(1268,303,'','recipientCount','2'),(1269,303,'','subject','Thank you for your review'),(1270,306,'','fileId','50'),(1271,306,'en','filename','chapter1.pdf'),(1272,306,'','fileStage','2'),(1273,306,'','submissionId','12'),(1274,306,'','username','lelder'),(1275,307,'','fileId','50'),(1276,307,'en','filename','chapter1.pdf'),(1277,307,'','fileStage','2'),(1278,307,'','submissionId','12'),(1279,307,'','username','lelder'),(1280,308,'','fileId','50'),(1281,308,'en','filename','chapter1.pdf'),(1282,308,'','fileStage','2'),(1283,308,'','submissionId','12'),(1284,308,'','username','lelder'),(1285,309,'','fileId','51'),(1286,309,'en','filename','chapter2.pdf'),(1287,309,'','fileStage','2'),(1288,309,'','submissionId','12'),(1289,309,'','username','lelder'),(1290,310,'','fileId','51'),(1291,310,'en','filename','chapter2.pdf'),(1292,310,'','fileStage','2'),(1293,310,'','submissionId','12'),(1294,310,'','username','lelder'),(1295,311,'','fileId','51'),(1296,311,'en','filename','chapter2.pdf'),(1297,311,'','fileStage','2'),(1298,311,'','submissionId','12'),(1299,311,'','username','lelder'),(1300,312,'','fileId','52'),(1301,312,'en','filename','chapter3.pdf'),(1302,312,'','fileStage','2'),(1303,312,'','submissionId','12'),(1304,312,'','username','lelder'),(1305,313,'','fileId','52'),(1306,313,'en','filename','chapter3.pdf'),(1307,313,'','fileStage','2'),(1308,313,'','submissionId','12'),(1309,313,'','username','lelder'),(1310,314,'','fileId','52'),(1311,314,'en','filename','chapter3.pdf'),(1312,314,'','fileStage','2'),(1313,314,'','submissionId','12'),(1314,314,'','username','lelder'),(1315,317,'','fileId','52'),(1316,317,'en','filename','chapter3.pdf'),(1317,317,'','fileStage','19'),(1318,317,'','sourceSubmissionFileId','86'),(1319,317,'','submissionId','12'),(1320,317,'','username','dbarnes'),(1321,318,'','fileId','52'),(1322,318,'en','filename','chapter3.pdf'),(1323,318,'','fileStage','19'),(1324,318,'','sourceSubmissionFileId','86'),(1325,318,'','submissionId','12'),(1326,318,'','username','dbarnes'),(1327,319,'','fileId','51'),(1328,319,'en','filename','chapter2.pdf'),(1329,319,'','fileStage','19'),(1330,319,'','sourceSubmissionFileId','85'),(1331,319,'','submissionId','12'),(1332,319,'','username','dbarnes'),(1333,320,'','fileId','51'),(1334,320,'en','filename','chapter2.pdf'),(1335,320,'','fileStage','19'),(1336,320,'','sourceSubmissionFileId','85'),(1337,320,'','submissionId','12'),(1338,320,'','username','dbarnes'),(1339,321,'','fileId','50'),(1340,321,'en','filename','chapter1.pdf'),(1341,321,'','fileStage','19'),(1342,321,'','sourceSubmissionFileId','84'),(1343,321,'','submissionId','12'),(1344,321,'','username','dbarnes'),(1345,322,'','fileId','50'),(1346,322,'en','filename','chapter1.pdf'),(1347,322,'','fileStage','19'),(1348,322,'','sourceSubmissionFileId','84'),(1349,322,'','submissionId','12'),(1350,322,'','username','dbarnes'),(1351,323,'','reviewerName','Julie Janssen'),(1352,323,'','round','1'),(1353,323,'','stageId','2'),(1354,323,'','submissionId','12'),(1355,324,'','reviewerName','Paul Hudson'),(1356,324,'','round','1'),(1357,324,'','stageId','2'),(1358,324,'','submissionId','12'),(1359,325,'','reviewerName','Aisla McCrae'),(1360,325,'','round','1'),(1361,325,'','stageId','2'),(1362,325,'','submissionId','12'),(1363,326,'','reviewAssignmentId','13'),(1364,326,'','reviewerName','Paul Hudson'),(1365,326,'','round','1'),(1366,326,'','submissionId','12'),(1367,327,'','reviewAssignmentId','13'),(1368,327,'','reviewerName','Paul Hudson'),(1369,327,'','round','1'),(1370,327,'','submissionId','12'),(1371,330,'','fileId','53'),(1372,330,'en','filename','chapter1.pdf'),(1373,330,'','fileStage','2'),(1374,330,'','submissionId','13'),(1375,330,'','username','mally'),(1376,331,'','fileId','53'),(1377,331,'en','filename','chapter1.pdf'),(1378,331,'','fileStage','2'),(1379,331,'','submissionId','13'),(1380,331,'','username','mally'),(1381,332,'','fileId','53'),(1382,332,'en','filename','chapter1.pdf'),(1383,332,'','fileStage','2'),(1384,332,'','submissionId','13'),(1385,332,'','username','mally'),(1386,333,'','fileId','54'),(1387,333,'en','filename','chapter2.pdf'),(1388,333,'','fileStage','2'),(1389,333,'','submissionId','13'),(1390,333,'','username','mally'),(1391,334,'','fileId','54'),(1392,334,'en','filename','chapter2.pdf'),(1393,334,'','fileStage','2'),(1394,334,'','submissionId','13'),(1395,334,'','username','mally'),(1396,335,'','fileId','54'),(1397,335,'en','filename','chapter2.pdf'),(1398,335,'','fileStage','2'),(1399,335,'','submissionId','13'),(1400,335,'','username','mally'),(1401,336,'','fileId','55'),(1402,336,'en','filename','chapter3.pdf'),(1403,336,'','fileStage','2'),(1404,336,'','submissionId','13'),(1405,336,'','username','mally'),(1406,337,'','fileId','55'),(1407,337,'en','filename','chapter3.pdf'),(1408,337,'','fileStage','2'),(1409,337,'','submissionId','13'),(1410,337,'','username','mally'),(1411,338,'','fileId','55'),(1412,338,'en','filename','chapter3.pdf'),(1413,338,'','fileStage','2'),(1414,338,'','submissionId','13'),(1415,338,'','username','mally'),(1416,341,'','fileId','55'),(1417,341,'en','filename','chapter3.pdf'),(1418,341,'','fileStage','19'),(1419,341,'','sourceSubmissionFileId','92'),(1420,341,'','submissionId','13'),(1421,341,'','username','dbarnes'),(1422,342,'','fileId','55'),(1423,342,'en','filename','chapter3.pdf'),(1424,342,'','fileStage','19'),(1425,342,'','sourceSubmissionFileId','92'),(1426,342,'','submissionId','13'),(1427,342,'','username','dbarnes'),(1428,343,'','fileId','54'),(1429,343,'en','filename','chapter2.pdf'),(1430,343,'','fileStage','19'),(1431,343,'','sourceSubmissionFileId','91'),(1432,343,'','submissionId','13'),(1433,343,'','username','dbarnes'),(1434,344,'','fileId','54'),(1435,344,'en','filename','chapter2.pdf'),(1436,344,'','fileStage','19'),(1437,344,'','sourceSubmissionFileId','91'),(1438,344,'','submissionId','13'),(1439,344,'','username','dbarnes'),(1440,345,'','fileId','53'),(1441,345,'en','filename','chapter1.pdf'),(1442,345,'','fileStage','19'),(1443,345,'','sourceSubmissionFileId','90'),(1444,345,'','submissionId','13'),(1445,345,'','username','dbarnes'),(1446,346,'','fileId','53'),(1447,346,'en','filename','chapter1.pdf'),(1448,346,'','fileStage','19'),(1449,346,'','sourceSubmissionFileId','90'),(1450,346,'','submissionId','13'),(1451,346,'','username','dbarnes'),(1452,347,'','reviewerName','Paul Hudson'),(1453,347,'','round','1'),(1454,347,'','stageId','2'),(1455,347,'','submissionId','13'),(1456,349,'','reviewerName','Adela Gallego'),(1457,349,'','round','1'),(1458,349,'','stageId','3'),(1459,349,'','submissionId','13'),(1460,350,'','reviewerName','Al Zacharia'),(1461,350,'','round','1'),(1462,350,'','stageId','3'),(1463,350,'','submissionId','13'),(1464,351,'','reviewerName','Gonzalo Favio'),(1465,351,'','round','1'),(1466,351,'','stageId','3'),(1467,351,'','submissionId','13'),(1468,352,'','reviewAssignmentId','16'),(1469,352,'','reviewerName','Adela Gallego'),(1470,352,'','round','1'),(1471,352,'','submissionId','13'),(1472,353,'','reviewAssignmentId','16'),(1473,353,'','reviewerName','Adela Gallego'),(1474,353,'','round','1'),(1475,353,'','submissionId','13'),(1476,354,'','reviewAssignmentId','18'),(1477,354,'','reviewerName','Gonzalo Favio'),(1478,354,'','round','1'),(1479,354,'','submissionId','13'),(1480,355,'','reviewAssignmentId','18'),(1481,355,'','reviewerName','Gonzalo Favio'),(1482,355,'','round','1'),(1483,355,'','submissionId','13'),(1484,357,'','recipientCount','2'),(1485,357,'','subject','Thank you for your review'),(1486,360,'','fileId','56'),(1487,360,'en','filename','chapter1.pdf'),(1488,360,'','fileStage','2'),(1489,360,'','submissionId','14'),(1490,360,'','username','mdawson'),(1491,361,'','fileId','56'),(1492,361,'en','filename','chapter1.pdf'),(1493,361,'','fileStage','2'),(1494,361,'','submissionId','14'),(1495,361,'','username','mdawson'),(1496,362,'','fileId','56'),(1497,362,'en','filename','chapter1.pdf'),(1498,362,'','fileStage','2'),(1499,362,'','submissionId','14'),(1500,362,'','username','mdawson'),(1501,363,'','fileId','57'),(1502,363,'en','filename','chapter2.pdf'),(1503,363,'','fileStage','2'),(1504,363,'','submissionId','14'),(1505,363,'','username','mdawson'),(1506,364,'','fileId','57'),(1507,364,'en','filename','chapter2.pdf'),(1508,364,'','fileStage','2'),(1509,364,'','submissionId','14'),(1510,364,'','username','mdawson'),(1511,365,'','fileId','57'),(1512,365,'en','filename','chapter2.pdf'),(1513,365,'','fileStage','2'),(1514,365,'','submissionId','14'),(1515,365,'','username','mdawson'),(1516,366,'','fileId','58'),(1517,366,'en','filename','chapter3.pdf'),(1518,366,'','fileStage','2'),(1519,366,'','submissionId','14'),(1520,366,'','username','mdawson'),(1521,367,'','fileId','58'),(1522,367,'en','filename','chapter3.pdf'),(1523,367,'','fileStage','2'),(1524,367,'','submissionId','14'),(1525,367,'','username','mdawson'),(1526,368,'','fileId','58'),(1527,368,'en','filename','chapter3.pdf'),(1528,368,'','fileStage','2'),(1529,368,'','submissionId','14'),(1530,368,'','username','mdawson'),(1531,369,'','fileId','59'),(1532,369,'en','filename','chapter4.pdf'),(1533,369,'','fileStage','2'),(1534,369,'','submissionId','14'),(1535,369,'','username','mdawson'),(1536,370,'','fileId','59'),(1537,370,'en','filename','chapter4.pdf'),(1538,370,'','fileStage','2'),(1539,370,'','submissionId','14'),(1540,370,'','username','mdawson'),(1541,371,'','fileId','59'),(1542,371,'en','filename','chapter4.pdf'),(1543,371,'','fileStage','2'),(1544,371,'','submissionId','14'),(1545,371,'','username','mdawson'),(1546,372,'','fileId','60'),(1547,372,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(1548,372,'','fileStage','2'),(1549,372,'','submissionId','14'),(1550,372,'','username','mdawson'),(1551,373,'','fileId','60'),(1552,373,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(1553,373,'','fileStage','2'),(1554,373,'','submissionId','14'),(1555,373,'','username','mdawson'),(1556,374,'','fileId','60'),(1557,374,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(1558,374,'','fileStage','2'),(1559,374,'','submissionId','14'),(1560,374,'','username','mdawson'),(1561,375,'','fileId','61'),(1562,375,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(1563,375,'','fileStage','2'),(1564,375,'','submissionId','14'),(1565,375,'','username','mdawson'),(1566,376,'','fileId','61'),(1567,376,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(1568,376,'','fileStage','2'),(1569,376,'','submissionId','14'),(1570,376,'','username','mdawson'),(1571,377,'','fileId','61'),(1572,377,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(1573,377,'','fileStage','2'),(1574,377,'','submissionId','14'),(1575,377,'','username','mdawson'),(1576,380,'','fileId','61'),(1577,380,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(1578,380,'','fileStage','19'),(1579,380,'','sourceSubmissionFileId','101'),(1580,380,'','submissionId','14'),(1581,380,'','username','dbarnes'),(1582,381,'','fileId','61'),(1583,381,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(1584,381,'','fileStage','19'),(1585,381,'','sourceSubmissionFileId','101'),(1586,381,'','submissionId','14'),(1587,381,'','username','dbarnes'),(1588,382,'','fileId','60'),(1589,382,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(1590,382,'','fileStage','19'),(1591,382,'','sourceSubmissionFileId','100'),(1592,382,'','submissionId','14'),(1593,382,'','username','dbarnes'),(1594,383,'','fileId','60'),(1595,383,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(1596,383,'','fileStage','19'),(1597,383,'','sourceSubmissionFileId','100'),(1598,383,'','submissionId','14'),(1599,383,'','username','dbarnes'),(1600,384,'','fileId','59'),(1601,384,'en','filename','chapter4.pdf'),(1602,384,'','fileStage','19'),(1603,384,'','sourceSubmissionFileId','99'),(1604,384,'','submissionId','14'),(1605,384,'','username','dbarnes'),(1606,385,'','fileId','59'),(1607,385,'en','filename','chapter4.pdf'),(1608,385,'','fileStage','19'),(1609,385,'','sourceSubmissionFileId','99'),(1610,385,'','submissionId','14'),(1611,385,'','username','dbarnes'),(1612,386,'','fileId','58'),(1613,386,'en','filename','chapter3.pdf'),(1614,386,'','fileStage','19'),(1615,386,'','sourceSubmissionFileId','98'),(1616,386,'','submissionId','14'),(1617,386,'','username','dbarnes'),(1618,387,'','fileId','58'),(1619,387,'en','filename','chapter3.pdf'),(1620,387,'','fileStage','19'),(1621,387,'','sourceSubmissionFileId','98'),(1622,387,'','submissionId','14'),(1623,387,'','username','dbarnes'),(1624,388,'','fileId','57'),(1625,388,'en','filename','chapter2.pdf'),(1626,388,'','fileStage','19'),(1627,388,'','sourceSubmissionFileId','97'),(1628,388,'','submissionId','14'),(1629,388,'','username','dbarnes'),(1630,389,'','fileId','57'),(1631,389,'en','filename','chapter2.pdf'),(1632,389,'','fileStage','19'),(1633,389,'','sourceSubmissionFileId','97'),(1634,389,'','submissionId','14'),(1635,389,'','username','dbarnes'),(1636,390,'','fileId','56'),(1637,390,'en','filename','chapter1.pdf'),(1638,390,'','fileStage','19'),(1639,390,'','sourceSubmissionFileId','96'),(1640,390,'','submissionId','14'),(1641,390,'','username','dbarnes'),(1642,391,'','fileId','56'),(1643,391,'en','filename','chapter1.pdf'),(1644,391,'','fileStage','19'),(1645,391,'','sourceSubmissionFileId','96'),(1646,391,'','submissionId','14'),(1647,391,'','username','dbarnes'),(1648,392,'','reviewerName','Julie Janssen'),(1649,392,'','round','1'),(1650,392,'','stageId','2'),(1651,392,'','submissionId','14'),(1652,394,'','reviewerName','Al Zacharia'),(1653,394,'','round','1'),(1654,394,'','stageId','3'),(1655,394,'','submissionId','14'),(1656,396,'','userFullName','Maria Fritz'),(1657,396,'en','userGroupName','Copyeditor'),(1658,396,'fr_CA','userGroupName','Réviseur-e'),(1659,396,'','username','mfritz'),(1660,398,'','userFullName','Graham Cox'),(1661,398,'en','userGroupName','Layout Editor'),(1662,398,'fr_CA','userGroupName','Responsable de la mise en page'),(1663,398,'','username','gcox'),(1664,399,'','userFullName','Sabine Kumar'),(1665,399,'en','userGroupName','Proofreader'),(1666,399,'fr_CA','userGroupName','Correcteur-trice d\'épreuves'),(1667,399,'','username','skumar'),(1668,400,'en','publicationFormatName','PDF'),(1669,400,'fr_CA','publicationFormatName',''),(1670,401,'','fileId','61'),(1671,401,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(1672,401,'','fileStage','10'),(1673,401,'','sourceSubmissionFileId','101'),(1674,401,'','submissionId','14'),(1675,401,'','username','dbarnes'),(1676,402,'','fileId','61'),(1677,402,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(1678,402,'','fileStage','10'),(1679,402,'','sourceSubmissionFileId','101'),(1680,402,'','submissionId','14'),(1681,402,'','username','dbarnes'),(1682,403,'','fileId','60'),(1683,403,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(1684,403,'','fileStage','10'),(1685,403,'','sourceSubmissionFileId','100'),(1686,403,'','submissionId','14'),(1687,403,'','username','dbarnes'),(1688,404,'','fileId','60'),(1689,404,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(1690,404,'','fileStage','10'),(1691,404,'','sourceSubmissionFileId','100'),(1692,404,'','submissionId','14'),(1693,404,'','username','dbarnes'),(1694,405,'','fileId','59'),(1695,405,'en','filename','chapter4.pdf'),(1696,405,'','fileStage','10'),(1697,405,'','sourceSubmissionFileId','99'),(1698,405,'','submissionId','14'),(1699,405,'','username','dbarnes'),(1700,406,'','fileId','59'),(1701,406,'en','filename','chapter4.pdf'),(1702,406,'','fileStage','10'),(1703,406,'','sourceSubmissionFileId','99'),(1704,406,'','submissionId','14'),(1705,406,'','username','dbarnes'),(1706,407,'','fileId','58'),(1707,407,'en','filename','chapter3.pdf'),(1708,407,'','fileStage','10'),(1709,407,'','sourceSubmissionFileId','98'),(1710,407,'','submissionId','14'),(1711,407,'','username','dbarnes'),(1712,408,'','fileId','58'),(1713,408,'en','filename','chapter3.pdf'),(1714,408,'','fileStage','10'),(1715,408,'','sourceSubmissionFileId','98'),(1716,408,'','submissionId','14'),(1717,408,'','username','dbarnes'),(1718,409,'','fileId','57'),(1719,409,'en','filename','chapter2.pdf'),(1720,409,'','fileStage','10'),(1721,409,'','sourceSubmissionFileId','97'),(1722,409,'','submissionId','14'),(1723,409,'','username','dbarnes'),(1724,410,'','fileId','57'),(1725,410,'en','filename','chapter2.pdf'),(1726,410,'','fileStage','10'),(1727,410,'','sourceSubmissionFileId','97'),(1728,410,'','submissionId','14'),(1729,410,'','username','dbarnes'),(1730,411,'','fileId','56'),(1731,411,'en','filename','chapter1.pdf'),(1732,411,'','fileStage','10'),(1733,411,'','sourceSubmissionFileId','96'),(1734,411,'','submissionId','14'),(1735,411,'','username','dbarnes'),(1736,412,'','fileId','56'),(1737,412,'en','filename','chapter1.pdf'),(1738,412,'','fileStage','10'),(1739,412,'','sourceSubmissionFileId','96'),(1740,412,'','submissionId','14'),(1741,412,'','username','dbarnes'),(1742,413,'en','publicationFormatName','PDF'),(1743,413,'fr_CA','publicationFormatName',''),(1744,414,'en','publicationFormatName','PDF'),(1745,414,'fr_CA','publicationFormatName',''),(1746,415,'','fileId','56'),(1747,415,'en','filename','chapter1.pdf'),(1748,415,'','fileStage','10'),(1749,415,'','sourceSubmissionFileId','96'),(1750,415,'','submissionId','14'),(1751,415,'','username','dbarnes'),(1752,416,'en','filename','chapter1.pdf'),(1753,416,'','userFullName','Daniel Barnes'),(1754,416,'','username','dbarnes'),(1755,417,'','fileId','56'),(1756,417,'en','filename','chapter1.pdf'),(1757,417,'','fileStage','10'),(1758,417,'','sourceSubmissionFileId','96'),(1759,417,'','submissionId','14'),(1760,417,'','username','dbarnes'),(1761,418,'','fileId','57'),(1762,418,'en','filename','chapter2.pdf'),(1763,418,'','fileStage','10'),(1764,418,'','sourceSubmissionFileId','97'),(1765,418,'','submissionId','14'),(1766,418,'','username','dbarnes'),(1767,419,'en','filename','chapter2.pdf'),(1768,419,'','userFullName','Daniel Barnes'),(1769,419,'','username','dbarnes'),(1770,420,'','fileId','57'),(1771,420,'en','filename','chapter2.pdf'),(1772,420,'','fileStage','10'),(1773,420,'','sourceSubmissionFileId','97'),(1774,420,'','submissionId','14'),(1775,420,'','username','dbarnes'),(1776,421,'','fileId','58'),(1777,421,'en','filename','chapter3.pdf'),(1778,421,'','fileStage','10'),(1779,421,'','sourceSubmissionFileId','98'),(1780,421,'','submissionId','14'),(1781,421,'','username','dbarnes'),(1782,422,'en','filename','chapter3.pdf'),(1783,422,'','userFullName','Daniel Barnes'),(1784,422,'','username','dbarnes'),(1785,423,'','fileId','58'),(1786,423,'en','filename','chapter3.pdf'),(1787,423,'','fileStage','10'),(1788,423,'','sourceSubmissionFileId','98'),(1789,423,'','submissionId','14'),(1790,423,'','username','dbarnes'),(1791,424,'','fileId','59'),(1792,424,'en','filename','chapter4.pdf'),(1793,424,'','fileStage','10'),(1794,424,'','sourceSubmissionFileId','99'),(1795,424,'','submissionId','14'),(1796,424,'','username','dbarnes'),(1797,425,'en','filename','chapter4.pdf'),(1798,425,'','userFullName','Daniel Barnes'),(1799,425,'','username','dbarnes'),(1800,426,'','fileId','59'),(1801,426,'en','filename','chapter4.pdf'),(1802,426,'','fileStage','10'),(1803,426,'','sourceSubmissionFileId','99'),(1804,426,'','submissionId','14'),(1805,426,'','username','dbarnes'),(1806,427,'','fileId','60'),(1807,427,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(1808,427,'','fileStage','10'),(1809,427,'','sourceSubmissionFileId','100'),(1810,427,'','submissionId','14'),(1811,427,'','username','dbarnes'),(1812,428,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(1813,428,'','userFullName','Daniel Barnes'),(1814,428,'','username','dbarnes'),(1815,429,'','fileId','60'),(1816,429,'en','filename','Segmentation of Vascular Ultrasound Imag.pdf'),(1817,429,'','fileStage','10'),(1818,429,'','sourceSubmissionFileId','100'),(1819,429,'','submissionId','14'),(1820,429,'','username','dbarnes'),(1821,430,'','fileId','61'),(1822,430,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(1823,430,'','fileStage','10'),(1824,430,'','sourceSubmissionFileId','101'),(1825,430,'','submissionId','14'),(1826,430,'','username','dbarnes'),(1827,431,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(1828,431,'','userFullName','Daniel Barnes'),(1829,431,'','username','dbarnes'),(1830,432,'','fileId','61'),(1831,432,'en','filename','The Canadian Nutrient File: Nutrient Val.pdf'),(1832,432,'','fileStage','10'),(1833,432,'','sourceSubmissionFileId','101'),(1834,432,'','submissionId','14'),(1835,432,'','username','dbarnes'),(1836,436,'','fileId','62'),(1837,436,'en','filename','chapter1.pdf'),(1838,436,'','fileStage','2'),(1839,436,'','submissionId','15'),(1840,436,'','username','mforan'),(1841,437,'','fileId','62'),(1842,437,'en','filename','chapter1.pdf'),(1843,437,'','fileStage','2'),(1844,437,'','submissionId','15'),(1845,437,'','username','mforan'),(1846,438,'','fileId','62'),(1847,438,'en','filename','chapter1.pdf'),(1848,438,'','fileStage','2'),(1849,438,'','submissionId','15'),(1850,438,'','username','mforan'),(1851,439,'','fileId','63'),(1852,439,'en','filename','chapter2.pdf'),(1853,439,'','fileStage','2'),(1854,439,'','submissionId','15'),(1855,439,'','username','mforan'),(1856,440,'','fileId','63'),(1857,440,'en','filename','chapter2.pdf'),(1858,440,'','fileStage','2'),(1859,440,'','submissionId','15'),(1860,440,'','username','mforan'),(1861,441,'','fileId','63'),(1862,441,'en','filename','chapter2.pdf'),(1863,441,'','fileStage','2'),(1864,441,'','submissionId','15'),(1865,441,'','username','mforan'),(1866,442,'','fileId','64'),(1867,442,'en','filename','chapter3.pdf'),(1868,442,'','fileStage','2'),(1869,442,'','submissionId','15'),(1870,442,'','username','mforan'),(1871,443,'','fileId','64'),(1872,443,'en','filename','chapter3.pdf'),(1873,443,'','fileStage','2'),(1874,443,'','submissionId','15'),(1875,443,'','username','mforan'),(1876,444,'','fileId','64'),(1877,444,'en','filename','chapter3.pdf'),(1878,444,'','fileStage','2'),(1879,444,'','submissionId','15'),(1880,444,'','username','mforan'),(1881,447,'','fileId','64'),(1882,447,'en','filename','chapter3.pdf'),(1883,447,'','fileStage','4'),(1884,447,'','sourceSubmissionFileId','116'),(1885,447,'','submissionId','15'),(1886,447,'','username','dbarnes'),(1887,448,'','fileId','64'),(1888,448,'en','filename','chapter3.pdf'),(1889,448,'','fileStage','4'),(1890,448,'','sourceSubmissionFileId','116'),(1891,448,'','submissionId','15'),(1892,448,'','username','dbarnes'),(1893,449,'','fileId','63'),(1894,449,'en','filename','chapter2.pdf'),(1895,449,'','fileStage','4'),(1896,449,'','sourceSubmissionFileId','115'),(1897,449,'','submissionId','15'),(1898,449,'','username','dbarnes'),(1899,450,'','fileId','63'),(1900,450,'en','filename','chapter2.pdf'),(1901,450,'','fileStage','4'),(1902,450,'','sourceSubmissionFileId','115'),(1903,450,'','submissionId','15'),(1904,450,'','username','dbarnes'),(1905,451,'','fileId','62'),(1906,451,'en','filename','chapter1.pdf'),(1907,451,'','fileStage','4'),(1908,451,'','sourceSubmissionFileId','114'),(1909,451,'','submissionId','15'),(1910,451,'','username','dbarnes'),(1911,452,'','fileId','62'),(1912,452,'en','filename','chapter1.pdf'),(1913,452,'','fileStage','4'),(1914,452,'','sourceSubmissionFileId','114'),(1915,452,'','submissionId','15'),(1916,452,'','username','dbarnes'),(1917,455,'','fileId','65'),(1918,455,'en','filename','foreward.pdf'),(1919,455,'','fileStage','2'),(1920,455,'','submissionId','16'),(1921,455,'','username','mpower'),(1922,456,'','fileId','65'),(1923,456,'en','filename','foreward.pdf'),(1924,456,'','fileStage','2'),(1925,456,'','submissionId','16'),(1926,456,'','username','mpower'),(1927,457,'','fileId','65'),(1928,457,'en','filename','foreward.pdf'),(1929,457,'','fileStage','2'),(1930,457,'','submissionId','16'),(1931,457,'','username','mpower'),(1932,458,'','fileId','66'),(1933,458,'en','filename','preface.pdf'),(1934,458,'','fileStage','2'),(1935,458,'','submissionId','16'),(1936,458,'','username','mpower'),(1937,459,'','fileId','66'),(1938,459,'en','filename','preface.pdf'),(1939,459,'','fileStage','2'),(1940,459,'','submissionId','16'),(1941,459,'','username','mpower'),(1942,460,'','fileId','66'),(1943,460,'en','filename','preface.pdf'),(1944,460,'','fileStage','2'),(1945,460,'','submissionId','16'),(1946,460,'','username','mpower'),(1947,461,'','fileId','67'),(1948,461,'en','filename','cases.pdf'),(1949,461,'','fileStage','2'),(1950,461,'','submissionId','16'),(1951,461,'','username','mpower'),(1952,462,'','fileId','67'),(1953,462,'en','filename','cases.pdf'),(1954,462,'','fileStage','2'),(1955,462,'','submissionId','16'),(1956,462,'','username','mpower'),(1957,463,'','fileId','67'),(1958,463,'en','filename','cases.pdf'),(1959,463,'','fileStage','2'),(1960,463,'','submissionId','16'),(1961,463,'','username','mpower'),(1962,464,'','fileId','68'),(1963,464,'en','filename','conclusion.pdf'),(1964,464,'','fileStage','2'),(1965,464,'','submissionId','16'),(1966,464,'','username','mpower'),(1967,465,'','fileId','68'),(1968,465,'en','filename','conclusion.pdf'),(1969,465,'','fileStage','2'),(1970,465,'','submissionId','16'),(1971,465,'','username','mpower'),(1972,466,'','fileId','68'),(1973,466,'en','filename','conclusion.pdf'),(1974,466,'','fileStage','2'),(1975,466,'','submissionId','16'),(1976,466,'','username','mpower'),(1977,467,'','fileId','69'),(1978,467,'en','filename','bibliography.pdf'),(1979,467,'','fileStage','2'),(1980,467,'','submissionId','16'),(1981,467,'','username','mpower'),(1982,468,'','fileId','69'),(1983,468,'en','filename','bibliography.pdf'),(1984,468,'','fileStage','2'),(1985,468,'','submissionId','16'),(1986,468,'','username','mpower'),(1987,469,'','fileId','69'),(1988,469,'en','filename','bibliography.pdf'),(1989,469,'','fileStage','2'),(1990,469,'','submissionId','16'),(1991,469,'','username','mpower'),(1992,472,'','fileId','69'),(1993,472,'en','filename','bibliography.pdf'),(1994,472,'','fileStage','4'),(1995,472,'','sourceSubmissionFileId','124'),(1996,472,'','submissionId','16'),(1997,472,'','username','dbarnes'),(1998,473,'','fileId','69'),(1999,473,'en','filename','bibliography.pdf'),(2000,473,'','fileStage','4'),(2001,473,'','sourceSubmissionFileId','124'),(2002,473,'','submissionId','16'),(2003,473,'','username','dbarnes'),(2004,474,'','fileId','68'),(2005,474,'en','filename','conclusion.pdf'),(2006,474,'','fileStage','4'),(2007,474,'','sourceSubmissionFileId','123'),(2008,474,'','submissionId','16'),(2009,474,'','username','dbarnes'),(2010,475,'','fileId','68'),(2011,475,'en','filename','conclusion.pdf'),(2012,475,'','fileStage','4'),(2013,475,'','sourceSubmissionFileId','123'),(2014,475,'','submissionId','16'),(2015,475,'','username','dbarnes'),(2016,476,'','fileId','67'),(2017,476,'en','filename','cases.pdf'),(2018,476,'','fileStage','4'),(2019,476,'','sourceSubmissionFileId','122'),(2020,476,'','submissionId','16'),(2021,476,'','username','dbarnes'),(2022,477,'','fileId','67'),(2023,477,'en','filename','cases.pdf'),(2024,477,'','fileStage','4'),(2025,477,'','sourceSubmissionFileId','122'),(2026,477,'','submissionId','16'),(2027,477,'','username','dbarnes'),(2028,478,'','fileId','66'),(2029,478,'en','filename','preface.pdf'),(2030,478,'','fileStage','4'),(2031,478,'','sourceSubmissionFileId','121'),(2032,478,'','submissionId','16'),(2033,478,'','username','dbarnes'),(2034,479,'','fileId','66'),(2035,479,'en','filename','preface.pdf'),(2036,479,'','fileStage','4'),(2037,479,'','sourceSubmissionFileId','121'),(2038,479,'','submissionId','16'),(2039,479,'','username','dbarnes'),(2040,480,'','fileId','65'),(2041,480,'en','filename','foreward.pdf'),(2042,480,'','fileStage','4'),(2043,480,'','sourceSubmissionFileId','120'),(2044,480,'','submissionId','16'),(2045,480,'','username','dbarnes'),(2046,481,'','fileId','65'),(2047,481,'en','filename','foreward.pdf'),(2048,481,'','fileStage','4'),(2049,481,'','sourceSubmissionFileId','120'),(2050,481,'','submissionId','16'),(2051,481,'','username','dbarnes'),(2052,482,'','reviewerName','Adela Gallego'),(2053,482,'','round','1'),(2054,482,'','stageId','3'),(2055,482,'','submissionId','16'),(2056,483,'','reviewerName','Al Zacharia'),(2057,483,'','round','1'),(2058,483,'','stageId','3'),(2059,483,'','submissionId','16'),(2060,484,'','reviewerName','Gonzalo Favio'),(2061,484,'','round','1'),(2062,484,'','stageId','3'),(2063,484,'','submissionId','16'),(2064,485,'','reviewAssignmentId','21'),(2065,485,'','reviewerName','Adela Gallego'),(2066,485,'','round','1'),(2067,485,'','submissionId','16'),(2068,486,'','reviewAssignmentId','21'),(2069,486,'','reviewerName','Adela Gallego'),(2070,486,'','round','1'),(2071,486,'','submissionId','16'),(2072,489,'','fileId','70'),(2073,489,'en','filename','preface.pdf'),(2074,489,'','fileStage','2'),(2075,489,'','submissionId','17'),(2076,489,'','username','msmith'),(2077,490,'','fileId','70'),(2078,490,'en','filename','preface.pdf'),(2079,490,'','fileStage','2'),(2080,490,'','submissionId','17'),(2081,490,'','username','msmith'),(2082,491,'','fileId','70'),(2083,491,'en','filename','preface.pdf'),(2084,491,'','fileStage','2'),(2085,491,'','submissionId','17'),(2086,491,'','username','msmith'),(2087,492,'','fileId','71'),(2088,492,'en','filename','introduction.pdf'),(2089,492,'','fileStage','2'),(2090,492,'','submissionId','17'),(2091,492,'','username','msmith'),(2092,493,'','fileId','71'),(2093,493,'en','filename','introduction.pdf'),(2094,493,'','fileStage','2'),(2095,493,'','submissionId','17'),(2096,493,'','username','msmith'),(2097,494,'','fileId','71'),(2098,494,'en','filename','introduction.pdf'),(2099,494,'','fileStage','2'),(2100,494,'','submissionId','17'),(2101,494,'','username','msmith'),(2102,495,'','fileId','72'),(2103,495,'en','filename','chapter1.pdf'),(2104,495,'','fileStage','2'),(2105,495,'','submissionId','17'),(2106,495,'','username','msmith'),(2107,496,'','fileId','72'),(2108,496,'en','filename','chapter1.pdf'),(2109,496,'','fileStage','2'),(2110,496,'','submissionId','17'),(2111,496,'','username','msmith'),(2112,497,'','fileId','72'),(2113,497,'en','filename','chapter1.pdf'),(2114,497,'','fileStage','2'),(2115,497,'','submissionId','17'),(2116,497,'','username','msmith'),(2117,498,'','fileId','73'),(2118,498,'en','filename','chapter2.pdf'),(2119,498,'','fileStage','2'),(2120,498,'','submissionId','17'),(2121,498,'','username','msmith'),(2122,499,'','fileId','73'),(2123,499,'en','filename','chapter2.pdf'),(2124,499,'','fileStage','2'),(2125,499,'','submissionId','17'),(2126,499,'','username','msmith'),(2127,500,'','fileId','73'),(2128,500,'en','filename','chapter2.pdf'),(2129,500,'','fileStage','2'),(2130,500,'','submissionId','17'),(2131,500,'','username','msmith'),(2132,501,'','fileId','74'),(2133,501,'en','filename','chapter3.pdf'),(2134,501,'','fileStage','2'),(2135,501,'','submissionId','17'),(2136,501,'','username','msmith'),(2137,502,'','fileId','74'),(2138,502,'en','filename','chapter3.pdf'),(2139,502,'','fileStage','2'),(2140,502,'','submissionId','17'),(2141,502,'','username','msmith'),(2142,503,'','fileId','74'),(2143,503,'en','filename','chapter3.pdf'),(2144,503,'','fileStage','2'),(2145,503,'','submissionId','17'),(2146,503,'','username','msmith'),(2147,504,'','fileId','75'),(2148,504,'en','filename','chapter4.pdf'),(2149,504,'','fileStage','2'),(2150,504,'','submissionId','17'),(2151,504,'','username','msmith'),(2152,505,'','fileId','75'),(2153,505,'en','filename','chapter4.pdf'),(2154,505,'','fileStage','2'),(2155,505,'','submissionId','17'),(2156,505,'','username','msmith'),(2157,506,'','fileId','75'),(2158,506,'en','filename','chapter4.pdf'),(2159,506,'','fileStage','2'),(2160,506,'','submissionId','17'),(2161,506,'','username','msmith'),(2162,509,'','fileId','75'),(2163,509,'en','filename','chapter4.pdf'),(2164,509,'','fileStage','19'),(2165,509,'','sourceSubmissionFileId','135'),(2166,509,'','submissionId','17'),(2167,509,'','username','dbarnes'),(2168,510,'','fileId','75'),(2169,510,'en','filename','chapter4.pdf'),(2170,510,'','fileStage','19'),(2171,510,'','sourceSubmissionFileId','135'),(2172,510,'','submissionId','17'),(2173,510,'','username','dbarnes'),(2174,511,'','fileId','74'),(2175,511,'en','filename','chapter3.pdf'),(2176,511,'','fileStage','19'),(2177,511,'','sourceSubmissionFileId','134'),(2178,511,'','submissionId','17'),(2179,511,'','username','dbarnes'),(2180,512,'','fileId','74'),(2181,512,'en','filename','chapter3.pdf'),(2182,512,'','fileStage','19'),(2183,512,'','sourceSubmissionFileId','134'),(2184,512,'','submissionId','17'),(2185,512,'','username','dbarnes'),(2186,513,'','fileId','73'),(2187,513,'en','filename','chapter2.pdf'),(2188,513,'','fileStage','19'),(2189,513,'','sourceSubmissionFileId','133'),(2190,513,'','submissionId','17'),(2191,513,'','username','dbarnes'),(2192,514,'','fileId','73'),(2193,514,'en','filename','chapter2.pdf'),(2194,514,'','fileStage','19'),(2195,514,'','sourceSubmissionFileId','133'),(2196,514,'','submissionId','17'),(2197,514,'','username','dbarnes'),(2198,515,'','fileId','72'),(2199,515,'en','filename','chapter1.pdf'),(2200,515,'','fileStage','19'),(2201,515,'','sourceSubmissionFileId','132'),(2202,515,'','submissionId','17'),(2203,515,'','username','dbarnes'),(2204,516,'','fileId','72'),(2205,516,'en','filename','chapter1.pdf'),(2206,516,'','fileStage','19'),(2207,516,'','sourceSubmissionFileId','132'),(2208,516,'','submissionId','17'),(2209,516,'','username','dbarnes'),(2210,517,'','fileId','70'),(2211,517,'en','filename','preface.pdf'),(2212,517,'','fileStage','19'),(2213,517,'','sourceSubmissionFileId','130'),(2214,517,'','submissionId','17'),(2215,517,'','username','dbarnes'),(2216,518,'','fileId','70'),(2217,518,'en','filename','preface.pdf'),(2218,518,'','fileStage','19'),(2219,518,'','sourceSubmissionFileId','130'),(2220,518,'','submissionId','17'),(2221,518,'','username','dbarnes'),(2222,519,'','fileId','71'),(2223,519,'en','filename','introduction.pdf'),(2224,519,'','fileStage','19'),(2225,519,'','sourceSubmissionFileId','131'),(2226,519,'','submissionId','17'),(2227,519,'','username','dbarnes'),(2228,520,'','fileId','71'),(2229,520,'en','filename','introduction.pdf'),(2230,520,'','fileStage','19'),(2231,520,'','sourceSubmissionFileId','131'),(2232,520,'','submissionId','17'),(2233,520,'','username','dbarnes'),(2234,521,'','reviewerName','Julie Janssen'),(2235,521,'','round','1'),(2236,521,'','stageId','2'),(2237,521,'','submissionId','17'),(2238,522,'','reviewerName','Paul Hudson'),(2239,522,'','round','1'),(2240,522,'','stageId','2'),(2241,522,'','submissionId','17');
/*!40000 ALTER TABLE `event_log_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A log of all failed jobs.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `features` (
  `feature_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `seq` bigint(20) NOT NULL,
  PRIMARY KEY (`feature_id`),
  UNIQUE KEY `press_features_unique` (`assoc_type`,`assoc_id`,`submission_id`),
  KEY `features_submission_id` (`submission_id`),
  CONSTRAINT `features_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Information about which submissions are featured in the press.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `file_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `mimetype` varchar(255) NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Records information in the database about files tracked by the system, linking them to the local filesystem.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'presses/1/monographs/1/647d085db489a.pdf','application/pdf'),(2,'presses/1/monographs/1/647d085edfb2c.pdf','application/pdf'),(3,'presses/1/monographs/1/647d08601d5c8.pdf','application/pdf'),(4,'presses/1/monographs/2/647d08b8ce6bb.pdf','application/pdf'),(5,'presses/1/monographs/2/647d08ba0f8e8.pdf','application/pdf'),(6,'presses/1/monographs/2/647d08bb4f849.pdf','application/pdf'),(7,'presses/1/monographs/2/647d08bc8e525.pdf','application/pdf'),(9,'presses/1/monographs/3/647d097a80bae.pdf','application/pdf'),(10,'presses/1/monographs/3/647d097ba5c33.pdf','application/pdf'),(11,'presses/1/monographs/3/647d097cddd78.pdf','application/pdf'),(12,'presses/1/monographs/3/647d097e3df5d.pdf','application/pdf'),(13,'presses/1/monographs/3/647d097f82d45.pdf','application/pdf'),(14,'presses/1/monographs/4/647d09b132678.pdf','application/pdf'),(15,'presses/1/monographs/4/647d09b247b02.pdf','application/pdf'),(16,'presses/1/monographs/4/647d09b3713a4.pdf','application/pdf'),(17,'presses/1/monographs/4/647d09b498c32.pdf','application/pdf'),(18,'presses/1/monographs/5/647d0a2f45e75.pdf','application/pdf'),(19,'presses/1/monographs/5/647d0a3059aff.pdf','application/pdf'),(20,'presses/1/monographs/5/647d0a3178d40.pdf','application/pdf'),(21,'presses/1/monographs/5/647d0a329641e.pdf','application/pdf'),(22,'presses/1/monographs/5/647d0a33ddd49.pdf','application/pdf'),(23,'presses/1/monographs/5/647d0a35086a4.pdf','application/pdf'),(24,'presses/1/monographs/6/647d0af236eef.pdf','application/pdf'),(25,'presses/1/monographs/6/647d0af346c17.pdf','application/pdf'),(26,'presses/1/monographs/6/647d0af46a61e.pdf','application/pdf'),(27,'presses/1/monographs/6/647d0af585e3c.pdf','application/pdf'),(28,'presses/1/monographs/7/647d0b59d24f1.pdf','application/pdf'),(29,'presses/1/monographs/7/647d0b5ae2094.pdf','application/pdf'),(30,'presses/1/monographs/7/647d0b5c0fded.pdf','application/pdf'),(31,'presses/1/monographs/7/647d0b5d31ef4.pdf','application/pdf'),(32,'presses/1/monographs/7/647d0b5e71dbc.pdf','application/pdf'),(33,'presses/1/monographs/8/647d0bbbbf04b.pdf','application/pdf'),(34,'presses/1/monographs/9/647d0bc8c4a13.pdf','application/pdf'),(35,'presses/1/monographs/9/647d0bc9d5525.pdf','application/pdf'),(36,'presses/1/monographs/9/647d0bcb00000.pdf','application/pdf'),(37,'presses/1/monographs/9/647d0bcc20e7d.pdf','application/pdf'),(38,'presses/1/monographs/9/647d0bcd64282.pdf','application/pdf'),(39,'presses/1/monographs/10/647d0c1561348.pdf','application/pdf'),(40,'presses/1/monographs/10/647d0c167618b.pdf','application/pdf'),(41,'presses/1/monographs/10/647d0c17a4d07.pdf','application/pdf'),(42,'presses/1/monographs/10/647d0c18d8220.pdf','application/pdf'),(43,'presses/1/monographs/10/647d0c1a0a7f3.pdf','application/pdf'),(44,'presses/1/monographs/10/647d0c1b2e606.pdf','application/pdf'),(45,'presses/1/monographs/10/647d0c1c5fd4e.pdf','application/pdf'),(46,'presses/1/monographs/10/647d0c1d9b195.pdf','application/pdf'),(47,'presses/1/monographs/10/647d0c1f003b8.pdf','application/pdf'),(48,'presses/1/monographs/11/647d0c74be11d.pdf','application/pdf'),(49,'presses/1/monographs/11/647d0c75cfd8f.pdf','application/pdf'),(50,'presses/1/monographs/12/647d0cec4ce9c.pdf','application/pdf'),(51,'presses/1/monographs/12/647d0ced6325d.pdf','application/pdf'),(52,'presses/1/monographs/12/647d0cee878d7.pdf','application/pdf'),(53,'presses/1/monographs/13/647d0d4706088.pdf','application/pdf'),(54,'presses/1/monographs/13/647d0d4817f52.pdf','application/pdf'),(55,'presses/1/monographs/13/647d0d49315c5.pdf','application/pdf'),(56,'presses/1/monographs/14/647d0dd78e3fa.pdf','application/pdf'),(57,'presses/1/monographs/14/647d0dd89f1e9.pdf','application/pdf'),(58,'presses/1/monographs/14/647d0dd9c947d.pdf','application/pdf'),(59,'presses/1/monographs/14/647d0ddaead5e.pdf','application/pdf'),(60,'presses/1/monographs/14/647d0ddc16d3a.pdf','application/pdf'),(61,'presses/1/monographs/14/647d0ddd391a0.pdf','application/pdf'),(62,'presses/1/monographs/15/647d0e9522861.pdf','application/pdf'),(63,'presses/1/monographs/15/647d0e96363b1.pdf','application/pdf'),(64,'presses/1/monographs/15/647d0e975d812.pdf','application/pdf'),(65,'presses/1/monographs/16/647d0ecba48ba.pdf','application/pdf'),(66,'presses/1/monographs/16/647d0eccbbd4c.pdf','application/pdf'),(67,'presses/1/monographs/16/647d0ecde31f2.pdf','application/pdf'),(68,'presses/1/monographs/16/647d0ecf0e839.pdf','application/pdf'),(69,'presses/1/monographs/16/647d0ed058762.pdf','application/pdf'),(70,'presses/1/monographs/17/647d0f39cc1b0.pdf','application/pdf'),(71,'presses/1/monographs/17/647d0f3ae3e6e.pdf','application/pdf'),(72,'presses/1/monographs/17/647d0f3c16b2f.pdf','application/pdf'),(73,'presses/1/monographs/17/647d0f3d398c9.pdf','application/pdf'),(74,'presses/1/monographs/17/647d0f3e7f1f5.pdf','application/pdf'),(75,'presses/1/monographs/17/647d0f3fa7af1.pdf','application/pdf');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_groups`
--

DROP TABLE IF EXISTS `filter_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_groups` (
  `filter_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `input_type` varchar(255) DEFAULT NULL,
  `output_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`filter_group_id`),
  UNIQUE KEY `filter_groups_symbolic` (`symbolic`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Filter groups are used to organized filters into named sets, which can be retrieved by the application for invocation.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_settings` (
  `filter_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `filter_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`filter_setting_id`),
  UNIQUE KEY `filter_settings_unique` (`filter_id`,`locale`,`setting_name`),
  KEY `filter_settings_id` (`filter_id`),
  CONSTRAINT `filter_settings_filter_id_foreign` FOREIGN KEY (`filter_id`) REFERENCES `filters` (`filter_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about filters, including localized content.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filters` (
  `filter_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `filter_group_id` bigint(20) NOT NULL DEFAULT 0,
  `context_id` bigint(20) NOT NULL DEFAULT 0,
  `display_name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `is_template` smallint(6) NOT NULL DEFAULT 0,
  `parent_filter_id` bigint(20) NOT NULL DEFAULT 0,
  `seq` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`filter_id`),
  KEY `filters_filter_group_id` (`filter_group_id`),
  CONSTRAINT `filters_filter_group_id_foreign` FOREIGN KEY (`filter_group_id`) REFERENCES `filter_groups` (`filter_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Filters represent a transformation of a supported piece of data from one form to another, such as a PHP object into an XML document.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre_settings` (
  `genre_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `genre_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`genre_setting_id`),
  UNIQUE KEY `genre_settings_unique` (`genre_id`,`locale`,`setting_name`),
  KEY `genre_settings_genre_id` (`genre_id`),
  CONSTRAINT `genre_settings_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about file genres, including localized properties such as the genre name.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `genre_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `seq` bigint(20) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT 1,
  `category` bigint(20) NOT NULL DEFAULT 1,
  `dependent` smallint(6) NOT NULL DEFAULT 0,
  `supplementary` smallint(6) NOT NULL DEFAULT 0,
  `required` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Whether or not at least one file of this genre is required for a new submission.',
  `entry_key` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`genre_id`),
  KEY `genres_context_id` (`context_id`),
  CONSTRAINT `genres_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='The types of submission files configured for each context, such as Article Text, Data Set, Transcript, etc.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identification_codes` (
  `identification_code_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint(20) NOT NULL,
  `code` varchar(40) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`identification_code_id`),
  KEY `identification_codes_publication_format_id` (`publication_format_id`),
  KEY `identification_codes_key` (`identification_code_id`,`publication_format_id`,`code`),
  CONSTRAINT `identification_codes_publication_format_id` FOREIGN KEY (`publication_format_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='ONIX identification codes for publication formats.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institution_ip` (
  `institution_ip_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `institution_id` bigint(20) NOT NULL,
  `ip_string` varchar(40) NOT NULL,
  `ip_start` bigint(20) NOT NULL,
  `ip_end` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`institution_ip_id`),
  KEY `institution_ip_institution_id` (`institution_id`),
  KEY `institution_ip_start` (`ip_start`),
  KEY `institution_ip_end` (`ip_end`),
  CONSTRAINT `institution_ip_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Records IP address ranges and associates them with institutions.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institution_settings` (
  `institution_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `institution_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`institution_setting_id`),
  UNIQUE KEY `institution_settings_unique` (`institution_id`,`locale`,`setting_name`),
  KEY `institution_settings_institution_id` (`institution_id`),
  CONSTRAINT `institution_settings_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about institutions, including localized properties like names.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institutions` (
  `institution_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `ror` varchar(255) DEFAULT NULL COMMENT 'ROR (Research Organization Registry) ID',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`institution_id`),
  KEY `institutions_context_id` (`context_id`),
  CONSTRAINT `institutions_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Institutions for statistics and subscriptions.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` text NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Job batches allow jobs to be collected into groups for managed processing.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
INSERT INTO `job_batches` VALUES ('995546ed-e1ab-4586-9b99-11b579d066ca','',0,0,0,'[]','a:0:{}',NULL,1685915412,NULL);
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='All pending or in-progress jobs.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `library_file_settings` (
  `library_file_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)',
  PRIMARY KEY (`library_file_setting_id`),
  UNIQUE KEY `library_file_settings_unique` (`file_id`,`locale`,`setting_name`),
  KEY `library_file_settings_file_id` (`file_id`),
  CONSTRAINT `library_file_settings_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `library_files` (`file_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about library files, including localized content such as names.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `library_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `original_file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `type` smallint(6) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `public_access` smallint(6) DEFAULT 0,
  PRIMARY KEY (`file_id`),
  KEY `library_files_context_id` (`context_id`),
  KEY `library_files_submission_id` (`submission_id`),
  CONSTRAINT `library_files_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `library_files_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Library files can be associated with the context (press/server/journal) or with individual submissions, and are typically forms, agreements, and other administrative documents that are not part of the scholarly content.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `markets` (
  `market_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint(20) NOT NULL,
  `countries_included` text DEFAULT NULL,
  `countries_excluded` text DEFAULT NULL,
  `regions_included` text DEFAULT NULL,
  `regions_excluded` text DEFAULT NULL,
  `market_date_role` varchar(40) NOT NULL,
  `market_date_format` varchar(40) NOT NULL,
  `market_date` varchar(255) NOT NULL,
  `price` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `price_type_code` varchar(255) DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `tax_rate_code` varchar(255) DEFAULT NULL,
  `tax_type_code` varchar(255) DEFAULT NULL,
  `agent_id` bigint(20) DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`market_id`),
  KEY `markets_publication_format_id` (`publication_format_id`),
  KEY `format_markets_pkey` (`market_id`,`publication_format_id`),
  CONSTRAINT `markets_publication_format_id` FOREIGN KEY (`publication_format_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='ONIX market information for publication formats.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metrics_context` (
  `metrics_context_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `metric` int(11) NOT NULL,
  PRIMARY KEY (`metrics_context_id`),
  KEY `metrics_context_load_id` (`load_id`),
  KEY `metrics_context_context_id` (`context_id`),
  CONSTRAINT `metrics_context_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Daily statistics for views of the homepage.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metrics_counter_submission_daily` (
  `metrics_counter_submission_daily_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `metric_book_investigations` int(11) NOT NULL,
  `metric_book_investigations_unique` int(11) NOT NULL,
  `metric_book_requests` int(11) NOT NULL,
  `metric_book_requests_unique` int(11) NOT NULL,
  `metric_chapter_investigations` int(11) NOT NULL,
  `metric_chapter_investigations_unique` int(11) NOT NULL,
  `metric_chapter_requests` int(11) NOT NULL,
  `metric_chapter_requests_unique` int(11) NOT NULL,
  `metric_title_investigations_unique` int(11) NOT NULL,
  `metric_title_requests_unique` int(11) NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_daily_id`),
  UNIQUE KEY `msd_uc_load_id_context_id_submission_id_date` (`load_id`,`context_id`,`submission_id`,`date`),
  KEY `msd_load_id` (`load_id`),
  KEY `metrics_counter_submission_daily_context_id` (`context_id`),
  KEY `metrics_counter_submission_daily_submission_id` (`submission_id`),
  KEY `msd_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msd_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msd_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Daily statistics matching the COUNTER R5 protocol for views and downloads of published submissions and files.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metrics_counter_submission_institution_daily` (
  `metrics_counter_submission_institution_daily_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `institution_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `metric_book_investigations` int(11) NOT NULL,
  `metric_book_investigations_unique` int(11) NOT NULL,
  `metric_book_requests` int(11) NOT NULL,
  `metric_book_requests_unique` int(11) NOT NULL,
  `metric_chapter_investigations` int(11) NOT NULL,
  `metric_chapter_investigations_unique` int(11) NOT NULL,
  `metric_chapter_requests` int(11) NOT NULL,
  `metric_chapter_requests_unique` int(11) NOT NULL,
  `metric_title_investigations_unique` int(11) NOT NULL,
  `metric_title_requests_unique` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Daily statistics matching the COUNTER R5 protocol for views and downloads from institutions.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metrics_counter_submission_institution_monthly` (
  `metrics_counter_submission_institution_monthly_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `institution_id` bigint(20) NOT NULL,
  `month` int(11) NOT NULL,
  `metric_book_investigations` int(11) NOT NULL,
  `metric_book_investigations_unique` int(11) NOT NULL,
  `metric_book_requests` int(11) NOT NULL,
  `metric_book_requests_unique` int(11) NOT NULL,
  `metric_chapter_investigations` int(11) NOT NULL,
  `metric_chapter_investigations_unique` int(11) NOT NULL,
  `metric_chapter_requests` int(11) NOT NULL,
  `metric_chapter_requests_unique` int(11) NOT NULL,
  `metric_title_investigations_unique` int(11) NOT NULL,
  `metric_title_requests_unique` int(11) NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_institution_monthly_id`),
  UNIQUE KEY `msim_uc_context_id_submission_id_institution_id_month` (`context_id`,`submission_id`,`institution_id`,`month`),
  KEY `msim_context_id` (`context_id`),
  KEY `msim_submission_id` (`submission_id`),
  KEY `msim_institution_id` (`institution_id`),
  KEY `msim_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msim_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msim_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE,
  CONSTRAINT `msim_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Monthly statistics matching the COUNTER R5 protocol for views and downloads from institutions.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metrics_counter_submission_monthly` (
  `metrics_counter_submission_monthly_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `month` int(11) NOT NULL,
  `metric_book_investigations` int(11) NOT NULL,
  `metric_book_investigations_unique` int(11) NOT NULL,
  `metric_book_requests` int(11) NOT NULL,
  `metric_book_requests_unique` int(11) NOT NULL,
  `metric_chapter_investigations` int(11) NOT NULL,
  `metric_chapter_investigations_unique` int(11) NOT NULL,
  `metric_chapter_requests` int(11) NOT NULL,
  `metric_chapter_requests_unique` int(11) NOT NULL,
  `metric_title_investigations_unique` int(11) NOT NULL,
  `metric_title_requests_unique` int(11) NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_monthly_id`),
  UNIQUE KEY `msm_uc_context_id_submission_id_month` (`context_id`,`submission_id`,`month`),
  KEY `metrics_counter_submission_monthly_context_id` (`context_id`),
  KEY `metrics_counter_submission_monthly_submission_id` (`submission_id`),
  KEY `msm_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msm_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msm_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Monthly statistics matching the COUNTER R5 protocol for views and downloads of published submissions and files.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metrics_series` (
  `metrics_series_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `series_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `metric` int(11) NOT NULL,
  PRIMARY KEY (`metrics_series_id`),
  KEY `metrics_series_load_id` (`load_id`),
  KEY `metrics_series_context_id` (`context_id`),
  KEY `metrics_series_series_id` (`series_id`),
  KEY `metrics_series_context_id_series_id` (`context_id`,`series_id`),
  CONSTRAINT `metrics_series_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_series_series_id_foreign` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Daily statistics for views of published submissions in each series.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metrics_submission` (
  `metrics_submission_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `chapter_id` bigint(20) DEFAULT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `submission_file_id` bigint(20) unsigned DEFAULT NULL,
  `file_type` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `metric` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Daily statistics for views and downloads of published submissions and files.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metrics_submission_geo_daily` (
  `metrics_submission_geo_daily_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `date` date NOT NULL,
  `metric` int(11) NOT NULL,
  `metric_unique` int(11) NOT NULL,
  PRIMARY KEY (`metrics_submission_geo_daily_id`),
  UNIQUE KEY `msgd_uc_load_context_submission_c_r_c_date` (`load_id`,`context_id`,`submission_id`,`country`,`region`,`city`,`date`),
  KEY `msgd_load_id` (`load_id`),
  KEY `metrics_submission_geo_daily_context_id` (`context_id`),
  KEY `metrics_submission_geo_daily_submission_id` (`submission_id`),
  KEY `msgd_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msgd_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msgd_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Daily statistics by country, region and city for views and downloads of published submissions and files.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metrics_submission_geo_monthly` (
  `metrics_submission_geo_monthly_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `month` int(11) NOT NULL,
  `metric` int(11) NOT NULL,
  `metric_unique` int(11) NOT NULL,
  PRIMARY KEY (`metrics_submission_geo_monthly_id`),
  UNIQUE KEY `msgm_uc_context_submission_c_r_c_month` (`context_id`,`submission_id`,`country`,`region`,`city`,`month`),
  KEY `metrics_submission_geo_monthly_context_id` (`context_id`),
  KEY `metrics_submission_geo_monthly_submission_id` (`submission_id`),
  KEY `msgm_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msgm_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msgm_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Monthly statistics by country, region and city for views and downloads of published submissions and files.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menu_item_assignment_settings` (
  `navigation_menu_item_assignment_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`navigation_menu_item_assignment_setting_id`),
  UNIQUE KEY `navigation_menu_item_assignment_settings_unique` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_assignment_settings_n_m_i_a_id` (`navigation_menu_item_assignment_id`),
  CONSTRAINT `assignment_settings_navigation_menu_item_assignment_id` FOREIGN KEY (`navigation_menu_item_assignment_id`) REFERENCES `navigation_menu_item_assignments` (`navigation_menu_item_assignment_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about navigation menu item assignments to navigation menus, including localized content.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menu_item_assignments` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `navigation_menu_id` bigint(20) NOT NULL,
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `seq` bigint(20) DEFAULT 0,
  PRIMARY KEY (`navigation_menu_item_assignment_id`),
  KEY `navigation_menu_item_assignments_navigation_menu_id` (`navigation_menu_id`),
  KEY `navigation_menu_item_assignments_navigation_menu_item_id` (`navigation_menu_item_id`),
  CONSTRAINT `navigation_menu_item_assignments_navigation_menu_id_foreign` FOREIGN KEY (`navigation_menu_id`) REFERENCES `navigation_menus` (`navigation_menu_id`) ON DELETE CASCADE,
  CONSTRAINT `navigation_menu_item_assignments_navigation_menu_item_id_foreign` FOREIGN KEY (`navigation_menu_item_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Links navigation menu items to navigation menus.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menu_item_settings` (
  `navigation_menu_item_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`navigation_menu_item_setting_id`),
  UNIQUE KEY `navigation_menu_item_settings_unique` (`navigation_menu_item_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_settings_navigation_menu_item_id` (`navigation_menu_item_id`),
  CONSTRAINT `navigation_menu_item_settings_navigation_menu_id` FOREIGN KEY (`navigation_menu_item_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about navigation menu items, including localized content such as names.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menu_items` (
  `navigation_menu_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `path` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT '',
  PRIMARY KEY (`navigation_menu_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Navigation menu items are single elements within a navigation menu.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menus` (
  `navigation_menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `area_name` varchar(255) DEFAULT '',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`navigation_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Navigation menus on the website are installed with the software as a default set, and can be customized.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_releases` (
  `new_release_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`new_release_id`),
  UNIQUE KEY `new_releases_unique` (`assoc_type`,`assoc_id`,`submission_id`),
  KEY `new_releases_submission_id` (`submission_id`),
  CONSTRAINT `new_releases_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Information about which submissions in the press are considered new releases.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `note_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `contents` text DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  KEY `notes_user_id` (`user_id`),
  KEY `notes_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Notes allow users to annotate associated entities, such as submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,1048586,1,6,'2023-06-04 22:07:59','2023-06-04 22:07:59','Editor Recommendation','<p>Dear Daniel Barnes, David Buskins,</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission The Information Literacy User’s Guide.</p><p>My recommendation is: Accept Submission.</p><p>Please visit the submission\'s <a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>Minoti Inoue</p>');
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_settings`
--

DROP TABLE IF EXISTS `notification_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_settings` (
  `notification_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `notification_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` mediumtext NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`notification_setting_id`),
  UNIQUE KEY `notification_settings_unique` (`notification_id`,`locale`,`setting_name`),
  KEY `notification_settings_notification_id` (`notification_id`),
  CONSTRAINT `notification_settings_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about notifications, including localized properties.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_subscription_settings` (
  `setting_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` mediumtext NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `context` bigint(20) NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`setting_id`),
  KEY `notification_subscription_settings_user_id` (`user_id`),
  KEY `notification_subscription_settings_context` (`context`),
  CONSTRAINT `notification_subscription_settings_context_foreign` FOREIGN KEY (`context`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `notification_subscription_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Which email notifications a user has chosen to unsubscribe from.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `notification_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `level` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `notifications_context_id` (`context_id`),
  KEY `notifications_user_id` (`user_id`),
  KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  KEY `notifications_context_id_level` (`context_id`,`level`),
  KEY `notifications_assoc` (`assoc_type`,`assoc_id`),
  KEY `notifications_user_id_level` (`user_id`,`level`),
  CONSTRAINT `notifications_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=344 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='User notifications created during certain operations.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (14,1,4,2,16777217,'2023-06-04 21:56:03',NULL,1048585,1),(15,1,NULL,2,16777236,'2023-06-04 21:56:18','2023-06-04 21:56:23',523,1),(16,1,12,3,16777227,'2023-06-04 21:56:28',NULL,517,1),(18,1,19,2,16777230,'2023-06-04 21:56:35',NULL,1048585,1),(19,1,4,2,16777251,'2023-06-04 21:56:35',NULL,1048585,1),(29,1,NULL,3,16777220,'2023-06-04 21:59:12',NULL,1048585,2),(30,1,NULL,3,16777222,'2023-06-04 21:59:12',NULL,1048585,2),(31,1,NULL,3,16777223,'2023-06-04 21:59:12',NULL,1048585,2),(32,1,NULL,3,16777224,'2023-06-04 21:59:12',NULL,1048585,2),(33,1,1,3,16777247,'2023-06-04 21:59:12',NULL,1048585,2),(34,1,2,3,16777247,'2023-06-04 21:59:12',NULL,1048585,2),(35,1,3,3,16777247,'2023-06-04 21:59:12',NULL,1048585,2),(36,1,NULL,2,16777236,'2023-06-04 21:59:44','2023-06-04 21:59:53',523,2),(37,1,11,3,16777227,'2023-06-04 22:00:00',NULL,517,2),(39,1,12,3,16777227,'2023-06-04 22:00:09',NULL,517,3),(51,1,NULL,3,16777220,'2023-06-04 22:01:07',NULL,1048585,3),(52,1,NULL,3,16777222,'2023-06-04 22:01:07',NULL,1048585,3),(53,1,NULL,3,16777223,'2023-06-04 22:01:07',NULL,1048585,3),(54,1,NULL,3,16777224,'2023-06-04 22:01:07',NULL,1048585,3),(55,1,1,3,16777247,'2023-06-04 22:01:07',NULL,1048585,3),(56,1,2,3,16777247,'2023-06-04 22:01:07',NULL,1048585,3),(57,1,3,3,16777247,'2023-06-04 22:01:07',NULL,1048585,3),(66,1,3,2,16777217,'2023-06-04 22:01:52',NULL,1048585,4),(67,1,NULL,2,16777236,'2023-06-04 22:02:06','2023-06-04 22:02:12',523,3),(69,1,9,3,16777227,'2023-06-04 22:02:17',NULL,517,4),(71,1,NULL,2,16777236,'2023-06-04 22:02:23','2023-06-04 22:02:28',523,4),(73,1,11,3,16777227,'2023-06-04 22:02:33',NULL,517,5),(78,1,22,2,16777235,'2023-06-04 22:02:57',NULL,1048585,4),(79,1,3,2,16777254,'2023-06-04 22:02:57',NULL,1048585,4),(93,1,NULL,3,16777220,'2023-06-04 22:04:14',NULL,1048585,5),(94,1,NULL,3,16777222,'2023-06-04 22:04:14',NULL,1048585,5),(95,1,NULL,3,16777223,'2023-06-04 22:04:15',NULL,1048585,5),(96,1,NULL,3,16777224,'2023-06-04 22:04:15',NULL,1048585,5),(97,1,1,3,16777247,'2023-06-04 22:04:15',NULL,1048585,5),(98,1,2,3,16777247,'2023-06-04 22:04:15',NULL,1048585,5),(99,1,3,3,16777247,'2023-06-04 22:04:15',NULL,1048585,5),(100,1,NULL,2,16777236,'2023-06-04 22:04:31','2023-06-04 22:04:37',523,5),(102,1,8,3,16777227,'2023-06-04 22:04:43',NULL,517,6),(104,1,NULL,2,16777236,'2023-06-04 22:04:50','2023-06-04 22:04:56',523,6),(106,1,12,3,16777227,'2023-06-04 22:05:02',NULL,517,7),(110,1,23,2,16777235,'2023-06-04 22:05:28',NULL,1048585,5),(113,1,NULL,2,16777246,'2023-06-04 22:06:09','2023-06-04 22:06:19',1048585,5),(122,1,4,2,16777217,'2023-06-04 22:07:13',NULL,1048585,6),(123,1,NULL,2,16777236,'2023-06-04 22:07:28','2023-06-04 22:07:33',523,7),(124,1,24,2,16777229,'2023-06-04 22:07:28',NULL,1048585,6),(127,1,3,3,16777249,'2023-06-04 22:07:59',NULL,1048586,1),(128,1,4,3,16777249,'2023-06-04 22:07:59',NULL,1048586,1),(139,1,3,2,16777217,'2023-06-04 22:09:07',NULL,1048585,7),(140,1,NULL,2,16777236,'2023-06-04 22:09:23','2023-06-04 22:09:29',523,8),(141,1,10,3,16777227,'2023-06-04 22:09:34',NULL,517,8),(143,1,25,2,16777230,'2023-06-04 22:09:40',NULL,1048585,7),(144,1,3,2,16777251,'2023-06-04 22:09:40','2023-06-04 22:09:45',1048585,7),(146,1,1,3,16777247,'2023-06-04 22:10:05',NULL,1048585,8),(147,1,2,3,16777247,'2023-06-04 22:10:05',NULL,1048585,8),(148,1,3,3,16777247,'2023-06-04 22:10:05',NULL,1048585,8),(159,1,4,2,16777217,'2023-06-04 22:10:57',NULL,1048585,9),(160,1,NULL,2,16777236,'2023-06-04 22:11:14','2023-06-04 22:11:20',523,9),(161,1,26,2,16777229,'2023-06-04 22:11:15',NULL,1048585,9),(180,1,NULL,3,16777220,'2023-06-04 22:12:54',NULL,1048585,10),(181,1,NULL,3,16777222,'2023-06-04 22:12:54',NULL,1048585,10),(182,1,NULL,3,16777223,'2023-06-04 22:12:54',NULL,1048585,10),(183,1,NULL,3,16777224,'2023-06-04 22:12:54',NULL,1048585,10),(184,1,1,3,16777247,'2023-06-04 22:12:54',NULL,1048585,10),(185,1,2,3,16777247,'2023-06-04 22:12:55',NULL,1048585,10),(186,1,3,3,16777247,'2023-06-04 22:12:55',NULL,1048585,10),(191,1,NULL,3,16777220,'2023-06-04 22:13:22',NULL,1048585,11),(192,1,NULL,3,16777222,'2023-06-04 22:13:22',NULL,1048585,11),(193,1,NULL,3,16777223,'2023-06-04 22:13:22',NULL,1048585,11),(194,1,NULL,3,16777224,'2023-06-04 22:13:22',NULL,1048585,11),(195,1,1,3,16777247,'2023-06-04 22:13:22',NULL,1048585,11),(196,1,2,3,16777247,'2023-06-04 22:13:22',NULL,1048585,11),(197,1,3,3,16777247,'2023-06-04 22:13:22',NULL,1048585,11),(198,1,NULL,2,16777236,'2023-06-04 22:13:35','2023-06-04 22:13:40',523,10),(200,1,9,3,16777227,'2023-06-04 22:13:45',NULL,517,9),(202,1,NULL,2,16777236,'2023-06-04 22:13:50','2023-06-04 22:13:55',523,11),(208,1,28,2,16777230,'2023-06-04 22:14:50',NULL,1048585,11),(215,1,NULL,3,16777220,'2023-06-04 22:15:32',NULL,1048585,12),(216,1,NULL,3,16777222,'2023-06-04 22:15:32',NULL,1048585,12),(217,1,NULL,3,16777223,'2023-06-04 22:15:32',NULL,1048585,12),(218,1,NULL,3,16777224,'2023-06-04 22:15:32',NULL,1048585,12),(219,1,1,3,16777247,'2023-06-04 22:15:32',NULL,1048585,12),(220,1,2,3,16777247,'2023-06-04 22:15:32',NULL,1048585,12),(221,1,3,3,16777247,'2023-06-04 22:15:32',NULL,1048585,12),(222,1,NULL,2,16777236,'2023-06-04 22:15:47','2023-06-04 22:15:53',523,12),(223,1,29,2,16777229,'2023-06-04 22:15:47',NULL,1048585,12),(224,1,7,3,16777227,'2023-06-04 22:15:58',NULL,517,12),(228,1,9,3,16777227,'2023-06-04 22:16:13',NULL,517,14),(236,1,NULL,3,16777220,'2023-06-04 22:17:02',NULL,1048585,13),(237,1,NULL,3,16777222,'2023-06-04 22:17:02',NULL,1048585,13),(238,1,NULL,3,16777223,'2023-06-04 22:17:02',NULL,1048585,13),(239,1,NULL,3,16777224,'2023-06-04 22:17:02',NULL,1048585,13),(240,1,1,3,16777247,'2023-06-04 22:17:02',NULL,1048585,13),(241,1,2,3,16777247,'2023-06-04 22:17:02',NULL,1048585,13),(242,1,3,3,16777247,'2023-06-04 22:17:02',NULL,1048585,13),(243,1,NULL,2,16777236,'2023-06-04 22:17:16','2023-06-04 22:17:21',523,13),(245,1,8,3,16777227,'2023-06-04 22:17:27',NULL,517,15),(247,1,NULL,2,16777236,'2023-06-04 22:17:33','2023-06-04 22:17:37',523,14),(251,1,11,3,16777227,'2023-06-04 22:17:51',NULL,517,17),(255,1,30,2,16777230,'2023-06-04 22:18:45',NULL,1048585,13),(264,1,3,2,16777217,'2023-06-04 22:19:38',NULL,1048585,14),(265,1,NULL,2,16777236,'2023-06-04 22:19:55','2023-06-04 22:20:01',523,15),(267,1,7,3,16777227,'2023-06-04 22:20:06',NULL,517,19),(269,1,NULL,2,16777236,'2023-06-04 22:20:12','2023-06-04 22:20:17',523,16),(271,1,11,3,16777227,'2023-06-04 22:20:23',NULL,517,20),(276,1,31,2,16777235,'2023-06-04 22:20:47',NULL,1048585,14),(277,1,3,2,16777254,'2023-06-04 22:20:47',NULL,1048585,14),(280,1,NULL,2,16777246,'2023-06-04 22:21:58',NULL,1048585,14),(287,1,NULL,3,16777220,'2023-06-04 22:22:34',NULL,1048585,15),(288,1,NULL,3,16777222,'2023-06-04 22:22:34',NULL,1048585,15),(289,1,NULL,3,16777223,'2023-06-04 22:22:34',NULL,1048585,15),(290,1,NULL,3,16777224,'2023-06-04 22:22:34',NULL,1048585,15),(291,1,1,3,16777247,'2023-06-04 22:22:34',NULL,1048585,15),(292,1,2,3,16777247,'2023-06-04 22:22:34',NULL,1048585,15),(293,1,3,3,16777247,'2023-06-04 22:22:34',NULL,1048585,15),(294,1,NULL,2,16777236,'2023-06-04 22:22:50','2023-06-04 22:22:55',523,17),(305,1,NULL,3,16777220,'2023-06-04 22:23:46',NULL,1048585,16),(306,1,NULL,3,16777222,'2023-06-04 22:23:46',NULL,1048585,16),(307,1,NULL,3,16777223,'2023-06-04 22:23:46',NULL,1048585,16),(308,1,NULL,3,16777224,'2023-06-04 22:23:46',NULL,1048585,16),(309,1,1,3,16777247,'2023-06-04 22:23:46',NULL,1048585,16),(310,1,2,3,16777247,'2023-06-04 22:23:46',NULL,1048585,16),(311,1,3,3,16777247,'2023-06-04 22:23:46',NULL,1048585,16),(312,1,NULL,2,16777236,'2023-06-04 22:24:03','2023-06-04 22:24:08',523,18),(315,1,11,3,16777227,'2023-06-04 22:24:22',NULL,517,22),(317,1,12,3,16777227,'2023-06-04 22:24:29',NULL,517,23),(331,1,NULL,3,16777220,'2023-06-04 22:25:52',NULL,1048585,17),(332,1,NULL,3,16777222,'2023-06-04 22:25:52',NULL,1048585,17),(333,1,NULL,3,16777223,'2023-06-04 22:25:52',NULL,1048585,17),(334,1,NULL,3,16777224,'2023-06-04 22:25:52',NULL,1048585,17),(335,1,1,3,16777247,'2023-06-04 22:25:52',NULL,1048585,17),(336,1,2,3,16777247,'2023-06-04 22:25:52',NULL,1048585,17),(337,1,3,3,16777247,'2023-06-04 22:25:52',NULL,1048585,17),(338,1,NULL,2,16777236,'2023-06-04 22:26:12','2023-06-04 22:26:18',523,19),(339,1,34,2,16777229,'2023-06-04 22:26:12',NULL,1048585,17),(340,1,7,3,16777227,'2023-06-04 22:26:24',NULL,517,24),(342,1,8,3,16777227,'2023-06-04 22:26:33',NULL,517,25);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_resumption_tokens`
--

DROP TABLE IF EXISTS `oai_resumption_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oai_resumption_tokens` (
  `oai_resumption_token_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `expire` bigint(20) NOT NULL,
  `record_offset` int(11) NOT NULL,
  `params` text DEFAULT NULL,
  PRIMARY KEY (`oai_resumption_token_id`),
  UNIQUE KEY `oai_resumption_tokens_unique` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='OAI resumption tokens are used to allow for pagination of large result sets into manageable pieces.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_settings` (
  `plugin_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(80) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`plugin_setting_id`),
  UNIQUE KEY `plugin_settings_unique` (`plugin_name`,`context_id`,`setting_name`),
  KEY `plugin_settings_plugin_name` (`plugin_name`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about plugins, including localized properties. This table is frequently used to store plugin-specific configuration.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_settings`
--

LOCK TABLES `plugin_settings` WRITE;
/*!40000 ALTER TABLE `plugin_settings` DISABLE KEYS */;
INSERT INTO `plugin_settings` VALUES (1,'defaultthemeplugin',0,'enabled','1','bool'),(2,'tinymceplugin',0,'enabled','1','bool'),(3,'usageeventplugin',0,'enabled','1','bool'),(4,'usageeventplugin',0,'uniqueSiteId','','string'),(5,'acronplugin',0,'enabled','1','bool'),(6,'acronplugin',0,'crontab','[{\"className\":\"PKP\\\\task\\\\ReviewReminder\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\PublishSubmissions\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\RemoveUnvalidatedExpiredUsers\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\UpdateIPGeoDB\",\"frequency\":{\"day\":\"10\"},\"args\":[]},{\"className\":\"APP\\\\tasks\\\\UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\EditorialReminders\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\ProcessQueueJobs\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\RemoveFailedJobs\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]','object'),(7,'developedbyblockplugin',0,'enabled','0','bool'),(8,'developedbyblockplugin',0,'seq','0','int'),(9,'developedbyblockplugin',0,'context','1','int'),(10,'languagetoggleblockplugin',0,'enabled','1','bool'),(11,'languagetoggleblockplugin',0,'seq','4','int'),(12,'languagetoggleblockplugin',0,'context','1','int'),(13,'tinymceplugin',1,'enabled','1','bool'),(14,'defaultthemeplugin',1,'enabled','1','bool'),(15,'developedbyblockplugin',1,'enabled','0','bool'),(16,'developedbyblockplugin',1,'seq','0','int'),(17,'developedbyblockplugin',1,'context','1','int'),(18,'informationblockplugin',1,'enabled','1','bool'),(19,'informationblockplugin',1,'seq','7','int'),(20,'informationblockplugin',1,'context','1','int'),(21,'browseblockplugin',1,'enabled','1','bool'),(22,'browseblockplugin',1,'seq','1','int'),(23,'browseblockplugin',1,'context','1','int'),(24,'browseblockplugin',1,'browseNewReleases','1','bool'),(25,'browseblockplugin',1,'browseCategories','1','bool'),(26,'browseblockplugin',1,'browseSeries','1','bool'),(27,'languagetoggleblockplugin',1,'enabled','1','bool'),(28,'languagetoggleblockplugin',1,'seq','4','int'),(29,'languagetoggleblockplugin',1,'context','1','int'),(30,'webfeedplugin',1,'enabled','1','bool'),(31,'webfeedplugin',1,'displayPage','homepage','string'),(32,'webfeedplugin',1,'displayItems','1','bool'),(33,'webfeedplugin',1,'recentItems','30','int'),(34,'webfeedplugin',1,'includeIdentifiers','0','bool'),(35,'dublincoremetaplugin',1,'enabled','1','bool'),(36,'pdfjsviewerplugin',1,'enabled','1','bool'),(37,'htmlmonographfileplugin',1,'enabled','1','bool'),(38,'googlescholarplugin',1,'enabled','1','bool'),(39,'defaultthemeplugin',1,'typography','notoSans','string'),(40,'defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),(41,'defaultthemeplugin',1,'baseColour','#1E6292','string'),(42,'defaultthemeplugin',1,'showCatalogSeriesListing','false','string'),(43,'defaultthemeplugin',1,'displayStats','none','string');
/*!40000 ALTER TABLE `plugin_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `press_settings`
--

DROP TABLE IF EXISTS `press_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `press_settings` (
  `press_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `press_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  PRIMARY KEY (`press_setting_id`),
  UNIQUE KEY `press_settings_unique` (`press_id`,`locale`,`setting_name`),
  KEY `press_settings_press_id` (`press_id`),
  CONSTRAINT `press_settings_press_id_foreign` FOREIGN KEY (`press_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about presses, including localized properties such as policies.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `press_settings`
--

LOCK TABLES `press_settings` WRITE;
/*!40000 ALTER TABLE `press_settings` DISABLE KEYS */;
INSERT INTO `press_settings` VALUES (1,1,'en','acronym','JPK'),(3,1,'en','authorGuidelines','<p>Authors are invited to make a submission to this press. Those submissions considered to be a good fit will be sent for peer review before determining whether they will be accepted or rejected.</p><p>Before making a submission, authors are responsible for obtaining permission to publish any material included with the submission, such as photos, documents and datasets. All authors identified on the submission must consent to be identified as an author. Where appropriate, research should be approved by an appropriate ethics committee in accordance with the legal requirements of the study\'s country.</p><p>An editor may desk reject a submission if it does not meet minimum standards of quality. Before submitting, please ensure that the scope and outline of the book are structured and articulated properly. The title should be concise and the abstract should be able to stand on its own. This will increase the likelihood of reviewers agreeing to review the book. When you\'re satisfied that your submission meets this standard, please follow the checklist below to prepare your submission.</p>'),(4,1,'fr_CA','authorGuidelines','##default.contextSettings.authorGuidelines##'),(5,1,'en','authorInformation','Interested in submitting to this press? We recommend that you review the <a href=\"http://localhost/index.php/publicknowledge/about\">About the Press</a> page for the press\' section policies and <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.php/publicknowledge/user/register\">register</a> with the press prior to submitting, or if already registered can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the 5 step process.'),(6,1,'fr_CA','authorInformation','Vous souhaitez soumettre une contribution à cette presse ? Nous vous recommandons de lire la page\n <a href=\"http://localhost/index.php/publicknowledge/about\">À propos de cette presse</a> pour connaitre ses règlements et la page\n <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Lignes directrices à l\'intention des auteurs-es</a>. Les auteurs-es doivent <a href=\"http://localhost/index.php/publicknowledge/user/register\">s\'inscrire</a> auprès de la presse avant d\'envoyer une soumission. Si vous êtes déjà inscrit-e, il suffit simplement <a href=\"http://localhost/index.php/index/login\">d\'ouvrir une session</a> pour débuter la procédure en 5 étapes.'),(7,1,'en','beginSubmissionHelp','<p>Thank you for submitting to the Public Knowledge Press. You will be asked to upload files, identify co-authors, and provide information such as the title and abstract.<p><p>Please read our <a href=\"http://localhost/index.php/publicknowledge/about/submissions\" target=\"_blank\">Submission Guidelines</a> if you have not done so already. When filling out the forms, provide as many details as possible in order to help our editors evaluate your work.</p><p>Once you begin, you can save your submission and come back to it later. You will be able to review and correct any information before you submit.</p>'),(8,1,'fr_CA','beginSubmissionHelp','##default.submission.step.beforeYouBegin##'),(9,1,'','contactEmail','rvaca@mailinator.com'),(10,1,'','contactName','Ramiro Vaca'),(11,1,'en','contributorsHelp','<p>Add details for all of the contributors to this submission. Contributors added here will be sent an email confirmation of the submission, as well as a copy of all editorial decisions recorded against this submission.</p><p>If a contributor can not be contacted by email, because they must remain anonymous or do not have an email account, please do not enter a fake email address. You can add information about this contributor in a message to the editor at a later step in the submission process.</p>'),(12,1,'fr_CA','contributorsHelp','##default.submission.step.contributors##'),(13,1,'','country','IS'),(14,1,'','defaultReviewMode','2'),(15,1,'en','description','<p>Public Knowledge Press is a publisher dedicated to the subject of public access to science.</p>'),(16,1,'fr_CA','description','<p>Le Press de Public Knowledge est une presse sur le thème de l\'accès du public à la science.</p>'),(17,1,'en','detailsHelp','<p>Please provide the following details to help us manage your submission in our system.</p>'),(18,1,'fr_CA','detailsHelp','##default.submission.step.details##'),(19,1,'','emailSignature','<br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(20,1,'','enableDois','1'),(21,1,'','doiSuffixType','default'),(22,1,'','registrationAgency',''),(23,1,'','disableSubmissions','0'),(24,1,'','editorialStatsEmail','1'),(25,1,'en','forTheEditorsHelp','<p>Please provide the following details in order to help our editorial team manage your submission.</p><p>When entering metadata, provide entries that you think would be most helpful to the person managing your submission. This information can be changed before publication.</p>'),(26,1,'fr_CA','forTheEditorsHelp','##default.submission.step.forTheEditors##'),(27,1,'','itemsPerPage','25'),(28,1,'','keywords','request'),(29,1,'en','librarianInformation','We encourage research librarians to list this press among their library\'s electronic press holdings. As well, this open source publishing system is suitable for libraries to host for their faculty members to use with presses they are involved in editing (see <a href=\"https://pkp.sfu.ca/omp\">Open Monograph Press</a>).'),(30,1,'fr_CA','librarianInformation','Nous encourageons les bibliothécaires de recherche à ajouter cette presse à la liste électronique des ressources documentaires de la bibliothèque. De plus, ce système d\'édition à libre accès convient à toutes les bibliothèques et permet aux membres des facultés de l\'utiliser pour les presses auxquelles ils contribuent à titre de rédacteur en chef. (voir <a href=\"http://pkp.sfu.ca/omp\">Open Monograph Press</a>).'),(31,1,'en','name','Public Knowledge Press'),(32,1,'fr_CA','name','Press de la connaissance du public'),(33,1,'','notifyAllAuthors','1'),(34,1,'','numPageLinks','10'),(35,1,'','numWeeksPerResponse','4'),(36,1,'','numWeeksPerReview','4'),(37,1,'en','openAccessPolicy','This press provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.'),(38,1,'fr_CA','openAccessPolicy','Cette presse offre un accès libre immédiat à son contenu en partant du principe que la recherche doit être accessible au grand public, car cela favorise un meilleur échange des connaissances à l\'échelle mondiale.'),(39,1,'en','privacyStatement','<p>The names and email addresses entered in this press site will be used exclusively for the stated purposes of this press and will not be made available for any other purpose or to any other party.</p>'),(40,1,'fr_CA','privacyStatement','<p>Les noms et adresses courriel saisis sur ce site de presse seront utilisés exclusivement pour les fins convenues de cette presse. Ils ne seront pas utilisés pour d\'autres fins ou transmis à une tierce partie.</p>'),(41,1,'en','readerInformation','We encourage readers to sign up for the publishing notification service for this press. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the homepage for the press. This registration will result in the reader receiving the Table of Contents by email for each new monograph of the press. This list also allows the press to claim a certain level of support or readership. See the press <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a> which assures readers that their name and email address will not be used for other purposes.'),(42,1,'fr_CA','readerInformation','Nous encourageons les lecteurs à s\'abonner au service d\'avis de publication de cette presse. Utilisez le lien <a href=\"http://localhost/index.php/publicknowledge/user/register\">d\'inscription</a> situé en haut de la page d\'accueil de la presse. Cette inscription permettra au lecteur de recevoir la table des matières de chaque nouvelle monographie de cette presse par courriel. Cette liste permet également à la presse d\'affirmer qu\'elle compte un certain nombre de lecteurs. Consultez <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">l\'énoncé de confidentialité </a> de la presse, lequel stipule que les noms et adresses courriel de ses lecteurs ne seront pas utilisés à d\'autres fins.'),(43,1,'en','reviewHelp','<p>Review the information you have entered before you complete your submission. You can change any of the details displayed here by clicking the edit button at the top of each section.</p><p>Once you complete your submission, a member of our editorial team will be assigned to review it. Please ensure the details you have entered here are as accurate as possible.</p>'),(44,1,'fr_CA','reviewHelp','##default.submission.step.review##'),(45,1,'','submissionAcknowledgement','allAuthors'),(46,1,'en','submissionChecklist','<p>All submissions must meet the following requirements.</p><ul><li>This submission meets the requirements outlined in the <a href=\"http://localhost/index.php/publicknowledge/about/submissions\">Author Guidelines</a>.</li><li>This submission has not been previously published, nor is it before another press for consideration.</li><li>All references have been checked for accuracy and completeness.</li><li>All tables and figures have been numbered and labeled.</li><li>Permission has been obtained to publish all photos, datasets and other material provided with this submission.</li></ul>'),(47,1,'fr_CA','submissionChecklist','##default.contextSettings.checklist##'),(48,1,'','submitWithCategories','0'),(49,1,'','supportedFormLocales','[\"en\",\"fr_CA\"]'),(50,1,'','supportedLocales','[\"en\",\"fr_CA\"]'),(51,1,'','supportedSubmissionLocales','[\"en\",\"fr_CA\"]'),(52,1,'','themePluginPath','default'),(53,1,'','type','enable'),(54,1,'en','uploadFilesHelp','<p>Provide any files our editorial team may need to evaluate your submission. In addition to the main work, you may wish to submit data sets, conflict of interest statements, or other supplementary files if these will be helpful for our editors.</p>'),(55,1,'fr_CA','uploadFilesHelp','##default.submission.step.uploadFiles##'),(56,1,'','enableGeoUsageStats','disabled'),(57,1,'','enableInstitutionUsageStats','0'),(58,1,'','isSushiApiPublic','1'),(59,1,'','coverThumbnailsMaxWidth','106'),(60,1,'','coverThumbnailsMaxHeight','100'),(61,1,'','enabledDoiTypes','[\"publication\"]'),(62,1,'','doiCreationTime','copyEditCreationTime'),(63,1,'','paymentPluginName','ManualPayment'),(64,1,'','doiVersioning','0'),(65,1,'en','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">'),(66,1,'en','searchDescription','Public Knowledge Press is a publisher dedicated to the subject of public access to science.'),(67,1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada'),(68,1,'','supportEmail','rvaca@mailinator.com'),(69,1,'','supportName','Ramiro Vaca');
/*!40000 ALTER TABLE `press_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presses`
--

DROP TABLE IF EXISTS `presses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presses` (
  `press_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(32) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `primary_locale` varchar(14) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`press_id`),
  UNIQUE KEY `press_path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A list of presses managed by the system.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_categories` (
  `publication_category_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `publication_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`publication_category_id`),
  UNIQUE KEY `publication_categories_id` (`publication_id`,`category_id`),
  KEY `publication_categories_publication_id` (`publication_id`),
  KEY `publication_categories_category_id` (`category_id`),
  CONSTRAINT `publication_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE,
  CONSTRAINT `publication_categories_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Associates publications (and thus submissions) with categories.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_dates` (
  `publication_date_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint(20) NOT NULL,
  `role` varchar(40) NOT NULL,
  `date_format` varchar(40) NOT NULL,
  `date` varchar(255) NOT NULL,
  PRIMARY KEY (`publication_date_id`),
  KEY `publication_dates_publication_format_id` (`publication_format_id`),
  KEY `format_publication_dates_pkey` (`publication_date_id`,`publication_format_id`,`role`),
  CONSTRAINT `publication_dates_publication_format_id` FOREIGN KEY (`publication_format_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='ONIX publication dates for publication formats.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_format_settings` (
  `publication_format_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`publication_format_setting_id`),
  UNIQUE KEY `publication_format_settings_unique` (`publication_format_id`,`locale`,`setting_name`),
  KEY `publication_format_id_key` (`publication_format_id`),
  CONSTRAINT `publication_format_settings_publication_format_id` FOREIGN KEY (`publication_format_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about publication formats, including localized properties.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_formats` (
  `publication_format_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publication_id` bigint(20) NOT NULL,
  `physical_format` smallint(6) DEFAULT 1,
  `entry_key` varchar(64) DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
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
  `is_approved` smallint(6) NOT NULL DEFAULT 0,
  `is_available` smallint(6) NOT NULL DEFAULT 0,
  `doi_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`publication_format_id`),
  KEY `publication_formats_publication_id` (`publication_id`),
  KEY `publication_formats_doi_id` (`doi_id`),
  CONSTRAINT `publication_formats_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `publication_formats_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Publication formats are representations of a publication in a particular format, e.g. PDF, hardcover, etc. Each publication format may contain many chapters.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_settings` (
  `publication_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `publication_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`publication_setting_id`),
  UNIQUE KEY `publication_settings_unique` (`publication_id`,`locale`,`setting_name`),
  KEY `publication_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `publication_settings_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about publications, including localized properties such as the title and abstract.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_settings`
--

LOCK TABLES `publication_settings` WRITE;
/*!40000 ALTER TABLE `publication_settings` DISABLE KEYS */;
INSERT INTO `publication_settings` VALUES (1,1,'en','abstract','The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities―and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.'),(2,1,'','categoryIds','[]'),(3,1,'en','title','The ABCs of Human Survival: A Paradigm for Global Citizenship'),(4,2,'','categoryIds','[]'),(5,2,'en','title','The West and Beyond: New Perspectives on an Imagined Region'),(6,2,'en','abstract','<p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p>'),(7,2,'fr_CA','title',''),(8,3,'en','abstract','Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.'),(9,3,'','categoryIds','[]'),(10,3,'en','title','The Political Economy of Workplace Injury in Canada'),(11,4,'en','abstract','What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.'),(12,4,'','categoryIds','[]'),(13,4,'en','title','How Canadians Communicate: Contexts of Canadian Popular Culture'),(14,5,'en','abstract','Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.'),(15,5,'','categoryIds','[]'),(16,5,'en','title','Bomb Canada and Other Unkind Remarks in the American Media'),(17,5,'en','copyrightHolder','Public Knowledge Press'),(18,5,'fr_CA','copyrightHolder','Press de la connaissance du public'),(19,5,'','copyrightYear','2023'),(20,6,'en','abstract','Good researchers have a host of tools at their disposal that make navigating today’s complex information ecosystem much more manageable. Gaining the knowledge, abilities, and self-reflection necessary to be a good researcher helps not only in academic settings, but is invaluable in any career, and throughout one’s life. The Information Literacy User’s Guide will start you on this route to success.'),(21,6,'','categoryIds','[]'),(22,6,'en','title','The Information Literacy User’s Guide'),(23,7,'en','abstract','Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.'),(24,7,'','categoryIds','[]'),(25,7,'en','title','Accessible Elements: Teaching Science Online and at a Distance'),(26,8,'en','abstract','A Note From The Publisher'),(27,8,'','categoryIds','[]'),(28,8,'en','title','Editorial'),(29,9,'en','abstract','In recent years, the Internet and other network technologies have emerged as a central issue for development in Latin America and the Caribbean. They have shown their potential to increase productivity and economic competitiveness, to create new ways to deliver education and health services, and to be driving forces for the modernization of the provision of public services.'),(30,9,'','categoryIds','[]'),(31,9,'en','title','Enabling Openness: The future of the information society in Latin America and the Caribbean'),(32,10,'en','abstract','While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.'),(33,10,'','categoryIds','[]'),(34,10,'en','title','Lost Tracks: Buffalo National Park, 1909-1939'),(35,11,'en','abstract','Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.'),(36,11,'','categoryIds','[]'),(37,11,'en','title','Dreamwork'),(38,12,'en','abstract','Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.'),(39,12,'','categoryIds','[]'),(40,12,'en','title','Connecting ICTs to Development'),(41,13,'en','abstract','This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.'),(42,13,'','categoryIds','[]'),(43,13,'en','title','Mobile Learning: Transforming the Delivery of Education and Training'),(44,14,'en','abstract','From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.'),(45,14,'','categoryIds','[]'),(46,14,'en','title','From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots'),(47,14,'en','copyrightHolder','Public Knowledge Press'),(48,14,'fr_CA','copyrightHolder','Press de la connaissance du public'),(49,14,'','copyrightYear','2023'),(50,15,'en','abstract','A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.'),(51,15,'','categoryIds','[]'),(52,15,'en','title','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978'),(53,16,'en','abstract','Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.'),(54,16,'','categoryIds','[]'),(55,16,'en','title','A Designer\'s Log: Case Studies in Instructional Design'),(56,17,'en','abstract','The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.'),(57,17,'','categoryIds','[]'),(58,17,'en','title','Open Development: Networked Innovations in International Development');
/*!40000 ALTER TABLE `publication_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications`
--

DROP TABLE IF EXISTS `publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publications` (
  `publication_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_published` date DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `primary_contact_id` bigint(20) DEFAULT NULL,
  `publication_date_type` varchar(32) DEFAULT 'pub',
  `publication_type` varchar(32) DEFAULT 'publication',
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `series_id` bigint(20) DEFAULT NULL,
  `series_position` varchar(255) DEFAULT NULL,
  `submission_id` bigint(20) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `url_path` varchar(64) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  `doi_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`publication_id`),
  KEY `publications_primary_contact_id` (`primary_contact_id`),
  KEY `publications_section_id` (`series_id`),
  KEY `publications_submission_id` (`submission_id`),
  KEY `publications_doi_id` (`doi_id`),
  CONSTRAINT `publications_author_id` FOREIGN KEY (`primary_contact_id`) REFERENCES `authors` (`author_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_series_id` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Each publication is one version of a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,NULL,'2023-06-04 21:55:38',1,'pub','publication',0.00,1,NULL,1,1,NULL,1,NULL),(2,NULL,'2023-06-04 21:57:12',2,'pub','publication',0.00,NULL,NULL,2,1,NULL,1,NULL),(3,NULL,'2023-06-04 22:00:22',11,'pub','publication',0.00,NULL,NULL,3,1,NULL,1,NULL),(4,NULL,'2023-06-04 22:01:18',12,'pub','publication',0.00,3,NULL,4,1,NULL,1,NULL),(5,'2023-06-04','2023-06-04 22:06:29',16,'pub','publication',0.00,NULL,NULL,5,3,NULL,1,NULL),(6,NULL,'2023-06-04 22:06:39',17,'pub','publication',0.00,1,NULL,6,1,NULL,1,NULL),(7,NULL,'2023-06-04 22:08:22',21,'pub','publication',0.00,4,NULL,7,1,NULL,1,NULL),(8,NULL,'2023-06-04 22:10:00',NULL,'pub','publication',0.00,NULL,NULL,8,1,NULL,1,NULL),(9,NULL,'2023-06-04 22:10:13',26,'pub','publication',0.00,1,NULL,9,1,NULL,1,NULL),(10,NULL,'2023-06-04 22:11:30',31,'pub','publication',0.00,NULL,NULL,10,1,NULL,1,NULL),(11,NULL,'2023-06-04 22:13:05',32,'pub','publication',0.00,NULL,NULL,11,1,NULL,1,NULL),(12,NULL,'2023-06-04 22:15:05',33,'pub','publication',0.00,NULL,NULL,12,1,NULL,1,NULL),(13,NULL,'2023-06-04 22:16:36',41,'pub','publication',0.00,NULL,NULL,13,1,NULL,1,NULL),(14,'2023-06-04','2023-06-04 22:21:58',45,'pub','publication',0.00,5,NULL,14,3,NULL,1,NULL),(15,NULL,'2023-06-04 22:22:10',48,'pub','publication',0.00,NULL,NULL,15,1,NULL,1,NULL),(16,NULL,'2023-06-04 22:23:04',49,'pub','publication',0.00,NULL,NULL,16,1,NULL,1,NULL),(17,NULL,'2023-06-04 22:24:54',50,'pub','publication',0.00,NULL,NULL,17,1,NULL,1,NULL);
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queries` (
  `query_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `closed` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`query_id`),
  KEY `queries_assoc_id` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Discussions, usually related to a submission, created by editors, authors and other editorial staff.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query_participants` (
  `query_participant_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `query_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`query_participant_id`),
  UNIQUE KEY `query_participants_unique` (`query_id`,`user_id`),
  KEY `query_participants_query_id` (`query_id`),
  KEY `query_participants_user_id` (`user_id`),
  CONSTRAINT `query_participants_query_id_foreign` FOREIGN KEY (`query_id`) REFERENCES `queries` (`query_id`) ON DELETE CASCADE,
  CONSTRAINT `query_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='The users assigned to a discussion.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queued_payments` (
  `queued_payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `payment_data` text DEFAULT NULL,
  PRIMARY KEY (`queued_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A list of queued (unfilled) payments, i.e. payments that have not yet been completed via an online payment system.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `representatives` (
  `representative_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `role` varchar(40) NOT NULL,
  `representative_id_type` varchar(255) DEFAULT NULL,
  `representative_id_value` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `is_supplier` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`representative_id`),
  KEY `representatives_submission_id` (`submission_id`),
  KEY `format_representatives_pkey` (`representative_id`,`submission_id`),
  CONSTRAINT `representatives_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='ONIX representatives for publication formats.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_assignments` (
  `review_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `reviewer_id` bigint(20) NOT NULL,
  `competing_interests` text DEFAULT NULL,
  `recommendation` smallint(6) DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` smallint(6) NOT NULL DEFAULT 0,
  `declined` smallint(6) NOT NULL DEFAULT 0,
  `cancelled` smallint(6) NOT NULL DEFAULT 0,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` smallint(6) DEFAULT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `review_method` smallint(6) NOT NULL DEFAULT 1,
  `round` smallint(6) NOT NULL DEFAULT 1,
  `step` smallint(6) NOT NULL DEFAULT 1,
  `review_form_id` bigint(20) DEFAULT NULL,
  `considered` smallint(6) DEFAULT NULL,
  `request_resent` smallint(6) NOT NULL DEFAULT 0,
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Data about peer review assignments for all submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignments`
--

LOCK TABLES `review_assignments` WRITE;
/*!40000 ALTER TABLE `review_assignments` DISABLE KEYS */;
INSERT INTO `review_assignments` VALUES (1,1,12,NULL,NULL,'2023-06-04 21:56:28','2023-06-04 21:56:29',NULL,NULL,NULL,'2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 21:56:29',0,0,0,NULL,NULL,NULL,1,3,2,1,0,NULL,0,0),(2,2,11,NULL,NULL,'2023-06-04 22:00:00','2023-06-04 22:00:00',NULL,NULL,NULL,'2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 22:00:00',0,0,0,NULL,NULL,NULL,2,3,1,1,0,NULL,0,0),(3,2,12,NULL,NULL,'2023-06-04 22:00:09','2023-06-04 22:00:09',NULL,NULL,NULL,'2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 22:00:09',0,0,0,NULL,NULL,NULL,2,3,2,1,0,NULL,0,0),(4,4,9,NULL,NULL,'2023-06-04 22:02:17','2023-06-04 22:02:17',NULL,NULL,NULL,'2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 22:02:17',0,0,0,NULL,NULL,NULL,3,2,2,1,0,NULL,0,0),(5,4,11,NULL,NULL,'2023-06-04 22:02:33','2023-06-04 22:02:33',NULL,NULL,NULL,'2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 22:02:33',0,0,0,NULL,NULL,NULL,4,3,2,1,0,NULL,0,0),(6,5,8,NULL,NULL,'2023-06-04 22:04:43','2023-06-04 22:04:43',NULL,NULL,NULL,'2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 22:04:43',0,0,0,NULL,NULL,NULL,5,2,2,1,0,NULL,0,0),(7,5,12,NULL,NULL,'2023-06-04 22:05:02','2023-06-04 22:05:02',NULL,NULL,NULL,'2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 22:05:02',0,0,0,NULL,NULL,NULL,6,3,2,1,0,NULL,0,0),(8,7,10,NULL,NULL,'2023-06-04 22:09:34','2023-06-04 22:09:34',NULL,NULL,NULL,'2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 22:09:34',0,0,0,NULL,NULL,NULL,8,3,2,1,0,NULL,0,0),(9,11,9,NULL,NULL,'2023-06-04 22:13:45','2023-06-04 22:13:45',NULL,NULL,NULL,'2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 22:13:45',0,0,0,NULL,NULL,NULL,10,2,2,1,0,NULL,0,0),(10,11,10,NULL,0,'2023-06-04 22:14:01','2023-06-04 22:14:01','2023-06-04 22:14:16','2023-06-04 22:14:21','2023-06-04 22:14:50','2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 22:14:50',0,0,0,NULL,NULL,NULL,11,3,2,1,4,NULL,0,0),(11,11,12,NULL,0,'2023-06-04 22:14:08','2023-06-04 22:14:08','2023-06-04 22:14:28','2023-06-04 22:14:33','2023-06-04 22:14:50','2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 22:14:50',0,0,0,NULL,NULL,NULL,11,3,2,1,4,NULL,0,0),(12,12,7,NULL,NULL,'2023-06-04 22:15:58','2023-06-04 22:15:58',NULL,NULL,NULL,'2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 22:15:58',0,0,0,NULL,NULL,NULL,12,2,2,1,0,NULL,0,0),(13,12,8,NULL,0,'2023-06-04 22:16:06','2023-06-04 22:16:06','2023-06-04 22:16:21','2023-06-04 22:16:25',NULL,'2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 22:16:25',0,0,0,NULL,NULL,NULL,12,2,2,1,4,NULL,0,0),(14,12,9,NULL,NULL,'2023-06-04 22:16:13','2023-06-04 22:16:13',NULL,NULL,NULL,'2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 22:16:13',0,0,0,NULL,NULL,NULL,12,2,2,1,0,NULL,0,0),(15,13,8,NULL,NULL,'2023-06-04 22:17:27','2023-06-04 22:17:27',NULL,NULL,NULL,'2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 22:17:27',0,0,0,NULL,NULL,NULL,13,2,2,1,0,NULL,0,0),(16,13,10,NULL,0,'2023-06-04 22:17:43','2023-06-04 22:17:43','2023-06-04 22:18:07','2023-06-04 22:18:12','2023-06-04 22:18:45','2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 22:18:45',0,0,0,NULL,NULL,NULL,14,3,2,1,4,NULL,0,0),(17,13,11,NULL,NULL,'2023-06-04 22:17:51','2023-06-04 22:17:51',NULL,NULL,NULL,'2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 22:17:51',0,0,0,NULL,NULL,NULL,14,3,2,1,0,NULL,0,0),(18,13,12,NULL,0,'2023-06-04 22:17:59','2023-06-04 22:17:59','2023-06-04 22:18:20','2023-06-04 22:18:24','2023-06-04 22:18:45','2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 22:18:45',0,0,0,NULL,NULL,NULL,14,3,2,1,4,NULL,0,0),(19,14,7,NULL,NULL,'2023-06-04 22:20:06','2023-06-04 22:20:06',NULL,NULL,NULL,'2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 22:20:06',0,0,0,NULL,NULL,NULL,15,2,2,1,0,NULL,0,0),(20,14,11,NULL,NULL,'2023-06-04 22:20:23','2023-06-04 22:20:23',NULL,NULL,NULL,'2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 22:20:23',0,0,0,NULL,NULL,NULL,16,3,2,1,0,NULL,0,0),(21,16,10,NULL,0,'2023-06-04 22:24:14','2023-06-04 22:24:14','2023-06-04 22:24:38','2023-06-04 22:24:44',NULL,'2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 22:24:44',0,0,0,NULL,NULL,NULL,18,3,2,1,4,NULL,0,0),(22,16,11,NULL,NULL,'2023-06-04 22:24:22','2023-06-04 22:24:22',NULL,NULL,NULL,'2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 22:24:22',0,0,0,NULL,NULL,NULL,18,3,2,1,0,NULL,0,0),(23,16,12,NULL,NULL,'2023-06-04 22:24:29','2023-06-04 22:24:30',NULL,NULL,NULL,'2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 22:24:30',0,0,0,NULL,NULL,NULL,18,3,2,1,0,NULL,0,0),(24,17,7,NULL,NULL,'2023-06-04 22:26:24','2023-06-04 22:26:24',NULL,NULL,NULL,'2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 22:26:24',0,0,0,NULL,NULL,NULL,19,2,2,1,0,NULL,0,0),(25,17,8,NULL,NULL,'2023-06-04 22:26:33','2023-06-04 22:26:33',NULL,NULL,NULL,'2023-07-02 00:00:00','2023-07-02 00:00:00','2023-06-04 22:26:33',0,0,0,NULL,NULL,NULL,19,2,2,1,0,NULL,0,0);
/*!40000 ALTER TABLE `review_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_files`
--

DROP TABLE IF EXISTS `review_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_files` (
  `review_file_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `review_id` bigint(20) NOT NULL,
  `submission_file_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`review_file_id`),
  UNIQUE KEY `review_files_unique` (`review_id`,`submission_file_id`),
  KEY `review_files_review_id` (`review_id`),
  KEY `review_files_submission_file_id` (`submission_file_id`),
  CONSTRAINT `review_files_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `review_assignments` (`review_id`) ON DELETE CASCADE,
  CONSTRAINT `review_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A list of the submission files made available to each assigned reviewer.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_files`
--

LOCK TABLES `review_files` WRITE;
/*!40000 ALTER TABLE `review_files` DISABLE KEYS */;
INSERT INTO `review_files` VALUES (1,1,4),(3,1,5),(2,1,6),(6,2,12),(4,2,13),(5,2,14),(7,2,15),(8,3,12),(10,3,13),(11,3,14),(9,3,15),(12,4,25),(13,4,26),(14,4,27),(15,4,28),(21,6,35),(16,6,36),(17,6,37),(18,6,38),(19,6,39),(20,6,40),(26,8,55),(24,8,56),(25,8,57),(23,8,58),(22,8,59),(27,9,82),(28,9,83),(30,12,87),(31,12,88),(29,12,89),(33,13,87),(34,13,88),(32,13,89),(36,14,87),(37,14,88),(35,14,89),(39,15,93),(40,15,94),(38,15,95),(46,19,102),(44,19,103),(45,19,104),(43,19,105),(41,19,106),(42,19,107),(51,21,125),(50,21,126),(48,21,127),(49,21,128),(47,21,129),(55,22,125),(56,22,126),(52,22,127),(53,22,128),(54,22,129),(61,23,125),(60,23,126),(58,23,127),(59,23,128),(57,23,129),(63,24,136),(66,24,137),(62,24,138),(65,24,139),(67,24,140),(64,24,141),(69,25,136),(72,25,137),(68,25,138),(71,25,139),(73,25,140),(70,25,141);
/*!40000 ALTER TABLE `review_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_element_settings`
--

DROP TABLE IF EXISTS `review_form_element_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_element_settings` (
  `review_form_element_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `review_form_element_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`review_form_element_setting_id`),
  UNIQUE KEY `review_form_element_settings_unique` (`review_form_element_id`,`locale`,`setting_name`),
  KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`),
  CONSTRAINT `review_form_element_settings_review_form_element_id` FOREIGN KEY (`review_form_element_id`) REFERENCES `review_form_elements` (`review_form_element_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about review form elements, including localized content such as question text.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_elements` (
  `review_form_element_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `review_form_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  `element_type` bigint(20) DEFAULT NULL,
  `required` smallint(6) DEFAULT NULL,
  `included` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`review_form_element_id`),
  KEY `review_form_elements_review_form_id` (`review_form_id`),
  CONSTRAINT `review_form_elements_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Each review form element represents a single question on a review form.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_responses` (
  `review_form_response_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `review_form_element_id` bigint(20) NOT NULL,
  `review_id` bigint(20) NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text DEFAULT NULL,
  PRIMARY KEY (`review_form_response_id`),
  KEY `review_form_responses_review_form_element_id` (`review_form_element_id`),
  KEY `review_form_responses_review_id` (`review_id`),
  KEY `review_form_responses_unique` (`review_form_element_id`,`review_id`),
  CONSTRAINT `review_form_responses_review_form_element_id_foreign` FOREIGN KEY (`review_form_element_id`) REFERENCES `review_form_elements` (`review_form_element_id`) ON DELETE CASCADE,
  CONSTRAINT `review_form_responses_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `review_assignments` (`review_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Each review form response records a reviewer''s answer to a review form element associated with a peer review.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_settings` (
  `review_form_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `review_form_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`review_form_setting_id`),
  UNIQUE KEY `review_form_settings_unique` (`review_form_id`,`locale`,`setting_name`),
  KEY `review_form_settings_review_form_id` (`review_form_id`),
  CONSTRAINT `review_form_settings_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about review forms, including localized content such as names.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_forms` (
  `review_form_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  `is_active` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Review forms provide custom templates for peer reviews with several types of questions.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_round_files` (
  `review_round_file_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `submission_file_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`review_round_file_id`),
  UNIQUE KEY `review_round_files_unique` (`submission_id`,`review_round_id`,`submission_file_id`),
  KEY `review_round_files_submission_id` (`submission_id`),
  KEY `review_round_files_review_round_id` (`review_round_id`),
  KEY `review_round_files_submission_file_id` (`submission_file_id`),
  CONSTRAINT `review_round_files_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`) ON DELETE CASCADE,
  CONSTRAINT `review_round_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `review_round_files_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Records the files made available to reviewers for a round of reviews. These can be further customized on a per review basis with review_files.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_rounds` (
  `review_round_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` smallint(6) NOT NULL,
  `review_revision` bigint(20) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`review_round_id`),
  UNIQUE KEY `review_rounds_submission_id_stage_id_round_pkey` (`submission_id`,`stage_id`,`round`),
  KEY `review_rounds_submission_id` (`submission_id`),
  CONSTRAINT `review_rounds_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Peer review assignments are organized into multiple rounds on a submission.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_rights` (
  `sales_rights_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint(20) NOT NULL,
  `type` varchar(40) NOT NULL,
  `row_setting` smallint(6) NOT NULL DEFAULT 0,
  `countries_included` text DEFAULT NULL,
  `countries_excluded` text DEFAULT NULL,
  `regions_included` text DEFAULT NULL,
  `regions_excluded` text DEFAULT NULL,
  PRIMARY KEY (`sales_rights_id`),
  KEY `sales_rights_publication_format_id` (`publication_format_id`),
  KEY `format_sales_rights_pkey` (`sales_rights_id`,`publication_format_id`),
  CONSTRAINT `sales_rights_publication_format_id` FOREIGN KEY (`publication_format_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='ONIX sales rights for publication formats.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduled_tasks` (
  `scheduled_task_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL,
  `last_run` datetime DEFAULT NULL,
  PRIMARY KEY (`scheduled_task_id`),
  UNIQUE KEY `scheduled_tasks_unique` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='The last time each scheduled task was run.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_tasks`
--

LOCK TABLES `scheduled_tasks` WRITE;
/*!40000 ALTER TABLE `scheduled_tasks` DISABLE KEYS */;
INSERT INTO `scheduled_tasks` VALUES (1,'PKP\\task\\ReviewReminder','2023-06-04 21:50:12'),(2,'PKP\\task\\PublishSubmissions','2023-06-04 21:50:12'),(3,'PKP\\task\\StatisticsReport','2023-06-04 21:50:12'),(4,'PKP\\task\\RemoveUnvalidatedExpiredUsers','2023-06-04 21:50:12'),(5,'PKP\\task\\UpdateIPGeoDB','2023-06-04 21:50:12'),(6,'APP\\tasks\\UsageStatsLoader','2023-06-04 21:50:13'),(7,'PKP\\task\\EditorialReminders','2023-06-04 21:50:13'),(8,'PKP\\task\\ProcessQueueJobs','2023-06-04 21:50:13'),(9,'PKP\\task\\RemoveFailedJobs','2023-06-04 21:50:13');
/*!40000 ALTER TABLE `scheduled_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series` (
  `series_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `press_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) DEFAULT NULL,
  `seq` double(8,2) DEFAULT 0.00,
  `featured` smallint(6) NOT NULL DEFAULT 0,
  `editor_restricted` smallint(6) NOT NULL DEFAULT 0,
  `path` varchar(255) NOT NULL,
  `image` text DEFAULT NULL,
  `is_inactive` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`series_id`),
  UNIQUE KEY `series_path` (`press_id`,`path`),
  KEY `series_press_id` (`press_id`),
  KEY `series_review_form_id` (`review_form_id`),
  CONSTRAINT `series_press_id` FOREIGN KEY (`press_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `series_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A list of press series, into which submissions can be organized.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series_categories` (
  `series_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  UNIQUE KEY `series_categories_id` (`series_id`,`category_id`),
  KEY `series_categories_series_id` (`series_id`),
  KEY `series_categories_category_id` (`category_id`),
  CONSTRAINT `series_categories_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE,
  CONSTRAINT `series_categories_series_id` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A list of relationships between series and category information.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series_settings` (
  `series_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `series_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  PRIMARY KEY (`series_setting_id`),
  UNIQUE KEY `series_settings_unique` (`series_id`,`locale`,`setting_name`),
  KEY `series_settings_series_id` (`series_id`),
  CONSTRAINT `series_settings_series_id` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about series, including localized properties such as series titles.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip_address` varchar(39) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created` bigint(20) NOT NULL DEFAULT 0,
  `last_used` bigint(20) NOT NULL DEFAULT 0,
  `remember` smallint(6) NOT NULL DEFAULT 0,
  `data` text NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  UNIQUE KEY `sessions_pkey` (`session_id`),
  KEY `sessions_user_id` (`user_id`),
  CONSTRAINT `sessions_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Session data for logged-in users.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('16qecr9qa3dfj6g85k6t1nn7fj',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916484,1685916493,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1685916493;s:5:\"token\";s:32:\"50a0d6e0bd20a16f09a6c58b21fb21a2\";}','localhost'),('1ffukkceq90ai9btscieg37hnm',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916497,1685916548,0,'csrf|a:2:{s:9:\"timestamp\";i:1685916548;s:5:\"token\";s:32:\"d1a084ce24558559c998592b7e5d362a\";}username|s:10:\"dkennepohl\";','localhost'),('28kuvre81jvspu9gb9l46b2t0k',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685915481,1685915490,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1685915490;s:5:\"token\";s:32:\"4dd38236911da7616ce5d2dc3503f9e5\";}','localhost'),('2mbol3jd1f5b5jkgd391a8b35n',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685917472,1685917484,0,'username|s:8:\"agallego\";csrf|a:2:{s:9:\"timestamp\";i:1685917484;s:5:\"token\";s:32:\"a3f4595abbbe74dc0057acd21b0838f7\";}','localhost'),('38vm69bpkg3pfnkce7dhsvr7ss',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916659,1685916681,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1685916682;s:5:\"token\";s:32:\"4ba51c2e5e026e03d671b423cbcfff62\";}','localhost'),('39dcvbft9e9p4p82ohhj1i8mp6',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685917024,1685917080,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1685917080;s:5:\"token\";s:32:\"1cc47086c472918038763bb47aedbc52\";}','localhost'),('3nmdnm3o7fbiv4v8vbfied0vrk',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916435,1685916465,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1685916465;s:5:\"token\";s:32:\"35d6a1eca88988350e2ebc99db6e41be\";}','localhost'),('505bhb60q5kflepmfkiiequgku',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685917324,1685917356,0,'csrf|a:2:{s:9:\"timestamp\";i:1685917356;s:5:\"token\";s:32:\"aede4d6daf886cf3d57cf3744f4f7bfc\";}username|s:6:\"mforan\";','localhost'),('621tfh0259vsp6gjv68lltdflq',27,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916684,1685916776,0,'csrf|a:2:{s:9:\"timestamp\";i:1685916776;s:5:\"token\";s:32:\"b2b3db556253bad02715b6ba39748f83\";}username|s:7:\"jbrower\";userId|i:27;','localhost'),('67c7bm4m0q9c6tnu160556tm5r',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685915467,1685915480,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1685915480;s:5:\"token\";s:32:\"6b2c8a9e189b2875f48ba8f94a318571\";}','localhost'),('75ip1qtnrpca25gl3bkcjvvlif',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685917428,1685917471,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1685917471;s:5:\"token\";s:32:\"fe4c9277488db2016b605c794445ad35\";}','localhost'),('86a39u1odg8hn0ttr6os90bv38',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916975,1685916986,0,'username|s:7:\"phudson\";csrf|a:2:{s:9:\"timestamp\";i:1685916986;s:5:\"token\";s:32:\"9b637565c412ad6abe9d726216307984\";}','localhost'),('8hv2716104j64jsadmgs6te05q',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916862,1685916873,0,'username|s:6:\"gfavio\";csrf|a:2:{s:9:\"timestamp\";i:1685916873;s:5:\"token\";s:32:\"41574861ea5babbe9089aaad9cb2b53d\";}','localhost'),('9e3pl8g3nvdlqk4l416i6gs50j',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685917134,1685917179,0,'csrf|a:2:{s:9:\"timestamp\";i:1685917179;s:5:\"token\";s:32:\"6bfd718592f84d851fea064f8097e28c\";}username|s:7:\"mdawson\";','localhost'),('b1f220ob8qbr7fmnhnrdvrtv9r',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916934,1685916974,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1685916974;s:5:\"token\";s:32:\"55ac3371816d56bd4b02c75b04cbbc17\";}','localhost'),('c5761d0tr0pmfcf4qpgjjb05ug',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685915492,1685915499,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1685915499;s:5:\"token\";s:32:\"60e56d373d8c4f2f1447f5f0b433a7cd\";}','localhost'),('e1mfrug551vulbf7i25afe22dv',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685915664,1685915678,0,'username|s:5:\"rvaca\";csrf|a:2:{s:9:\"timestamp\";i:1685915678;s:5:\"token\";s:32:\"83c7470a7bf42529337ed4ce8fd740d2\";}','localhost'),('ekgu7upfu6out6g9e8jj4m2j6v',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916803,1685916849,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1685916849;s:5:\"token\";s:32:\"fbd07f42c65ebcc0c7c15ec4ab395aae\";}','localhost'),('f2ah16l4p36oj7vmfbkdrn3fpl',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685915412,1685915441,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1685915441;s:5:\"token\";s:32:\"93dc8b9280fb06b4cad7d9ba1e8cc68a\";}','localhost'),('fokmeta4qhjr7mtmndjimivmre',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685917356,1685917376,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1685917376;s:5:\"token\";s:32:\"b3622278720e96cda9fe66e7a12510c2\";}','localhost'),('gf59g1qptkgme9krh445m06jfj',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685917378,1685917427,0,'csrf|a:2:{s:9:\"timestamp\";i:1685917427;s:5:\"token\";s:32:\"6abae9c61f8e03236811f48b974d9fd6\";}username|s:6:\"mpower\";','localhost'),('h18vtuffo8k648i35deit7d5tu',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916850,1685916861,0,'username|s:8:\"agallego\";csrf|a:2:{s:9:\"timestamp\";i:1685916861;s:5:\"token\";s:32:\"e25903f7abb3aac41b344dc244542841\";}','localhost'),('i8ds954s0tn4vnts29equtfm29',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916256,1685916371,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1685916371;s:5:\"token\";s:32:\"901ea19cfc8217a89a27bd63769c9338\";}','localhost'),('ijjhejmrfgelpjsavc5o7upn9o',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916072,1685916114,0,'csrf|a:2:{s:9:\"timestamp\";i:1685916114;s:5:\"token\";s:32:\"e3ab46b9912094ad481b632ace3aae12\";}username|s:6:\"bbeaty\";','localhost'),('jpoqjgdh4sqqb1p8m6n9asvdia',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685917093,1685917105,0,'username|s:6:\"gfavio\";csrf|a:2:{s:9:\"timestamp\";i:1685917105;s:5:\"token\";s:32:\"a40fe004a1b10b871a98a2ca2ba8c6ff\";}','localhost'),('jvkplsm83ue0884unaiv47psul',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916114,1685916194,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1685916194;s:5:\"token\";s:32:\"312d6768c3cc3c608ec4871a80829fab\";}','localhost'),('kdkoh5dno4o15f8vn1ipaliu0b',21,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916016,1685916068,0,'csrf|a:2:{s:9:\"timestamp\";i:1685916068;s:5:\"token\";s:32:\"024c34e49c53e8980ca71d3113db9eaf\";}username|s:10:\"bbarnetson\";userId|i:21;','localhost'),('l0bt9psvm31j91ne5dgsnpjh7v',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685917488,1685917554,0,'csrf|a:2:{s:9:\"timestamp\";i:1685917553;s:5:\"token\";s:32:\"9b6ee722af19eee2d6183e756365a6fc\";}username|s:6:\"msmith\";','localhost'),('m4uhtu4rs2baaq4si9du29riso',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685917554,1685917593,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1685917593;s:5:\"token\";s:32:\"f3521aaff217407ecd601fd6ad4efa27\";}','localhost'),('m9onau3bbaooato0jces1cs46b',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916608,1685916658,0,'csrf|a:2:{s:9:\"timestamp\";i:1685916658;s:5:\"token\";s:32:\"a76cded8962cb13c6cda86357c5f76dd\";}username|s:7:\"fperini\";','localhost'),('maco1214lhnrul46h1idfev24j',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916990,1685917023,0,'csrf|a:2:{s:9:\"timestamp\";i:1685917023;s:5:\"token\";s:32:\"2886dceb46b0c517212674f498d6ea15\";}username|s:5:\"mally\";','localhost'),('mgv475h1gjh5ppqqlgjpm783bs',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916393,1685916434,0,'csrf|a:2:{s:9:\"timestamp\";i:1685916434;s:5:\"token\";s:32:\"9c347628e0b5584c4095d551c9d6a236\";}username|s:9:\"dbernnard\";','localhost'),('mqv1t2ocs3n6tun7fas370thf8',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916382,1685916391,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1685916391;s:5:\"token\";s:32:\"b29fcc16662b08c2463c35267fa98ca0\";}','localhost'),('nbv4e4emigavi3uvjnslaae4d3',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916466,1685916483,0,'username|s:6:\"minoue\";csrf|a:2:{s:9:\"timestamp\";i:1685916483;s:5:\"token\";s:32:\"e19e840874d6ee981b1f5475693c78af\";}','localhost'),('nef4256krvpe1as4nvav04spe0',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916549,1685916591,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1685916591;s:5:\"token\";s:32:\"79a0b67cc7ba4a42c55e2e7e3d1f1ee9\";}','localhost'),('nlnglhdg9bavr8uubt1qincu41',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685917106,1685917130,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1685917130;s:5:\"token\";s:32:\"935022de248ce1308bd410f114ac8161\";}','localhost'),('o2d15t2klsksjhvi6seduf2c0s',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685917180,1685917320,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1685917320;s:5:\"token\";s:32:\"e640437f7d92e164feb798b721e2f17e\";}','localhost'),('oeak8sgoo71urifme55f9677qc',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685915708,1685915729,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1685915728;s:5:\"token\";s:32:\"c2a1c513933b54248f2bd34e59e76c68\";}','localhost'),('oh0p5u3disdb9g3l6ofepm8l1l',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685915441,1685915465,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1685915465;s:5:\"token\";s:32:\"e673edc228c9d2e0947e4e5fcf0f6ed8\";}','localhost'),('p31cibap98gtrr095384n2ghmo',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916595,1685916604,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1685916604;s:5:\"token\";s:32:\"3ed84abaf5f7950828ff65bc55a69372\";}','localhost'),('p569r81gtknq35bf91gct07a69',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685915682,1685915705,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1685915704;s:5:\"token\";s:32:\"4e3ca98d06271963898b8dbad5a4db0c\";}','localhost'),('pbos9467isl17aaijaef4oe7i0',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685917080,1685917092,0,'username|s:8:\"agallego\";csrf|a:2:{s:9:\"timestamp\";i:1685917092;s:5:\"token\";s:32:\"e94993bcab26fa137c7e4521a8788efa\";}','localhost'),('q9ifnmv226u30t82gs99nu6rm1',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916779,1685916803,0,'csrf|a:2:{s:9:\"timestamp\";i:1685916803;s:5:\"token\";s:32:\"86afa701e61007d26e69ff8a2e8f030b\";}username|s:10:\"jlockehart\";','localhost'),('qmko7la6t74ru82a8qhrbrlts1',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916372,1685916382,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1685916382;s:5:\"token\";s:32:\"85d5fb8a82f7788d205ea789384dd2e6\";}','localhost'),('rt40uqe2ellt215asuot3mcj7d',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916899,1685916934,0,'csrf|a:2:{s:9:\"timestamp\";i:1685916934;s:5:\"token\";s:32:\"d71806d8f7880361b37604c113ac5500\";}username|s:6:\"lelder\";','localhost'),('sbavaadcdcl94k84r88umjadgu',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916874,1685916896,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1685916896;s:5:\"token\";s:32:\"76eb17e2258b3ad7535844ae89d80b5f\";}','localhost'),('sci5tpo3m9l67kqo1d2o4i43bo',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685915732,1685915765,0,'csrf|a:2:{s:9:\"timestamp\";i:1685915765;s:5:\"token\";s:32:\"8011d3601905cdf51d3c40796292169c\";}username|s:6:\"aclark\";','localhost'),('t0c9s6tquf593ohc55qudmef45',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685915503,1685915663,0,'username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1685915662;s:5:\"token\";s:32:\"6df1e2a7c717c40fe15c6f3109eb2df8\";}','localhost'),('v744v87rthsia5ilk02bqfmhr6',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685915810,1685915964,0,'csrf|a:2:{s:9:\"timestamp\";i:1685915964;s:5:\"token\";s:32:\"353bd308b075547e060122966fbe39c8\";}username|s:7:\"afinkel\";','localhost'),('vd0n180d0pt5vfnmmgkrpvp3fs',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685916198,1685916256,0,'csrf|a:2:{s:9:\"timestamp\";i:1685916256;s:5:\"token\";s:32:\"1faff4b08b85607ea3f13bd0265ae4bd\";}username|s:6:\"callan\";','localhost'),('vjsc25l5vcifk542p3kqs5ke76',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685915965,1685916010,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1685916009;s:5:\"token\";s:32:\"ccfd7d9e046e4be0faecfaabce780783\";}','localhost'),('vocq98il8hgpffsqgelhg3i9rc',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/113.0.5672.126 Safari/537.36',1685915765,1685915806,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1685915806;s:5:\"token\";s:32:\"6f79db744201a32170c4dc87cdc8bd63\";}','localhost');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site` (
  `site_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `redirect` bigint(20) NOT NULL DEFAULT 0 COMMENT 'If not 0, redirect to the specified journal/conference/... site.',
  `primary_locale` varchar(14) NOT NULL COMMENT 'Primary locale for the site.',
  `min_password_length` smallint(6) NOT NULL DEFAULT 6,
  `installed_locales` varchar(1024) NOT NULL DEFAULT 'en' COMMENT 'Locales for which support has been installed.',
  `supported_locales` varchar(1024) DEFAULT NULL COMMENT 'Locales supported by the site (for hosted journals/conferences/...).',
  `original_style_file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A singleton table describing basic information about the site.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_settings` (
  `site_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`site_setting_id`),
  UNIQUE KEY `site_settings_unique` (`setting_name`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about the site, including localized properties such as its name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES (1,'contactEmail','en','pkpadmin@mailinator.com'),(2,'contactName','en','Open Monograph Press'),(3,'contactName','fr_CA','Open Monograph Press'),(4,'compressStatsLogs','','0'),(5,'enableGeoUsageStats','','disabled'),(6,'enableInstitutionUsageStats','','0'),(7,'keepDailyUsageStats','','0'),(8,'isSiteSushiPlatform','','0'),(9,'isSushiApiPublic','','1'),(10,'themePluginPath','','default');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spotlight_settings`
--

DROP TABLE IF EXISTS `spotlight_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spotlight_settings` (
  `spotlight_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `spotlight_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)',
  PRIMARY KEY (`spotlight_setting_id`),
  UNIQUE KEY `spotlight_settings_unique` (`spotlight_id`,`locale`,`setting_name`),
  KEY `spotlight_settings_id` (`spotlight_id`),
  CONSTRAINT `spotlight_settings_spotlight_id_foreign` FOREIGN KEY (`spotlight_id`) REFERENCES `spotlights` (`spotlight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about spotlights, including localized properties.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spotlights` (
  `spotlight_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) NOT NULL,
  `assoc_id` smallint(6) NOT NULL,
  `press_id` bigint(20) NOT NULL,
  PRIMARY KEY (`spotlight_id`),
  KEY `spotlights_press_id` (`press_id`),
  KEY `spotlights_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `spotlights_press_id_foreign` FOREIGN KEY (`press_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Information about which submissions to the press are spotlighted.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stage_assignments` (
  `stage_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_assigned` datetime NOT NULL,
  `recommend_only` smallint(6) NOT NULL DEFAULT 0,
  `can_change_metadata` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`stage_assignment_id`),
  UNIQUE KEY `stage_assignment` (`submission_id`,`user_group_id`,`user_id`),
  KEY `stage_assignments_user_group_id` (`user_group_id`),
  KEY `stage_assignments_user_id` (`user_id`),
  KEY `stage_assignments_submission_id` (`submission_id`),
  CONSTRAINT `stage_assignments_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE,
  CONSTRAINT `stage_assignments_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `stage_assignments_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Who can access a submission while it is in the editorial workflow. Includes all editorial and author assignments. For reviewers, see review_assignments.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES (1,1,13,19,'2023-06-04 21:56:03',0,0),(2,1,5,4,'2023-06-04 21:56:03',0,1),(3,1,6,14,'2023-06-04 21:56:45',0,0),(4,2,13,20,'2023-06-04 21:59:12',0,0),(5,3,13,21,'2023-06-04 22:01:07',0,0),(6,4,13,22,'2023-06-04 22:01:52',0,0),(7,4,3,3,'2023-06-04 22:01:52',0,1),(8,4,6,13,'2023-06-04 22:02:49',0,0),(9,4,10,15,'2023-06-04 22:03:07',0,0),(10,5,13,23,'2023-06-04 22:04:14',0,0),(11,5,6,14,'2023-06-04 22:05:20',0,0),(12,5,10,16,'2023-06-04 22:05:40',0,0),(13,5,12,17,'2023-06-04 22:05:47',0,0),(14,6,13,24,'2023-06-04 22:07:13',0,0),(15,6,5,4,'2023-06-04 22:07:13',0,1),(16,6,3,3,'2023-06-04 22:07:38',0,1),(17,6,5,6,'2023-06-04 22:07:44',1,0),(18,7,13,25,'2023-06-04 22:09:07',0,0),(19,7,3,3,'2023-06-04 22:09:07',0,1),(20,7,6,13,'2023-06-04 22:09:50',0,0),(21,8,3,3,'2023-06-04 22:10:00',0,1),(22,9,13,26,'2023-06-04 22:10:57',0,0),(23,9,5,4,'2023-06-04 22:10:57',0,1),(24,10,13,27,'2023-06-04 22:12:54',0,0),(25,11,13,28,'2023-06-04 22:13:22',0,0),(26,12,13,29,'2023-06-04 22:15:32',0,0),(27,13,13,30,'2023-06-04 22:17:02',0,0),(28,14,13,31,'2023-06-04 22:19:38',0,0),(29,14,3,3,'2023-06-04 22:19:38',0,1),(30,14,6,13,'2023-06-04 22:20:40',0,0),(31,14,10,15,'2023-06-04 22:20:57',0,0),(32,14,12,18,'2023-06-04 22:21:04',0,0),(33,15,13,32,'2023-06-04 22:22:34',0,0),(34,16,13,33,'2023-06-04 22:23:46',0,0),(35,17,13,34,'2023-06-04 22:25:52',0,0);
/*!40000 ALTER TABLE `stage_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_page_settings`
--

DROP TABLE IF EXISTS `static_page_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_page_settings` (
  `static_page_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `static_page_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`static_page_setting_id`),
  KEY `static_page_settings_static_page_id` (`static_page_id`),
  CONSTRAINT `static_page_settings_static_page_id` FOREIGN KEY (`static_page_id`) REFERENCES `static_pages` (`static_page_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_pages` (
  `static_page_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  PRIMARY KEY (`static_page_id`),
  KEY `static_pages_context_id` (`context_id`),
  CONSTRAINT `static_pages_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subeditor_submission_group` (
  `subeditor_submission_group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`subeditor_submission_group_id`),
  UNIQUE KEY `section_editors_unique` (`context_id`,`assoc_id`,`assoc_type`,`user_id`,`user_group_id`),
  KEY `subeditor_submission_group_context_id` (`context_id`),
  KEY `subeditor_submission_group_user_id` (`user_id`),
  KEY `subeditor_submission_group_user_group_id` (`user_group_id`),
  KEY `subeditor_submission_group_assoc_id` (`assoc_id`,`assoc_type`),
  CONSTRAINT `section_editors_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `subeditor_submission_group_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `subeditor_submission_group_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Subeditor assignments to e.g. sections and categories';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_chapter_authors` (
  `author_id` bigint(20) NOT NULL,
  `chapter_id` bigint(20) NOT NULL,
  `primary_contact` smallint(6) NOT NULL DEFAULT 0,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  UNIQUE KEY `chapter_authors_pkey` (`author_id`,`chapter_id`),
  KEY `submission_chapter_authors_author_id` (`author_id`),
  KEY `submission_chapter_authors_chapter_id` (`chapter_id`),
  CONSTRAINT `submission_chapter_authors_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_chapter_authors_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='The list of authors associated with each submission chapter.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_chapter_authors`
--

LOCK TABLES `submission_chapter_authors` WRITE;
/*!40000 ALTER TABLE `submission_chapter_authors` DISABLE KEYS */;
INSERT INTO `submission_chapter_authors` VALUES (1,1,0,0.00),(1,2,0,0.00),(1,3,0,0.00),(5,4,0,0.00),(6,5,0,0.00),(7,6,0,0.00),(8,7,0,0.00),(9,7,0,1.00),(11,8,0,0.00),(11,9,0,0.00),(11,10,0,0.00),(11,11,0,0.00),(11,12,0,0.00),(12,13,0,0.00),(13,14,0,0.00),(14,15,0,0.00),(15,16,0,0.00),(16,17,0,0.00),(16,18,0,0.00),(16,19,0,0.00),(16,20,0,0.00),(16,21,0,0.00),(16,22,0,0.00),(17,23,0,0.00),(18,24,0,0.00),(19,25,0,0.00),(20,26,0,0.00),(21,27,0,0.00),(22,28,0,0.00),(23,29,0,0.00),(24,30,0,0.00),(25,31,0,0.00),(26,32,0,0.00),(27,33,0,0.00),(28,34,0,0.00),(29,35,0,0.00),(30,36,0,0.00),(31,37,0,0.00),(31,38,0,0.00),(31,39,0,0.00),(31,40,0,0.00),(31,41,0,0.00),(31,42,0,0.00),(31,43,0,0.00),(31,44,0,0.00),(31,45,0,0.00),(32,46,0,0.00),(32,47,0,0.00),(35,48,0,0.00),(36,48,0,1.00),(37,49,0,1.00),(38,49,0,0.00),(39,50,0,0.00),(40,50,0,1.00),(42,51,0,0.00),(43,52,0,0.00),(44,53,0,0.00),(45,54,0,0.00),(45,57,0,0.00),(46,55,0,0.00),(47,56,0,0.00),(48,58,0,0.00),(48,59,0,0.00),(48,60,0,0.00),(49,61,0,0.00),(49,62,0,0.00),(49,63,0,0.00),(49,64,0,0.00),(49,65,0,0.00),(50,67,0,1.00),(50,68,0,0.00),(51,66,0,0.00),(52,67,0,0.00),(52,68,0,1.00),(53,69,0,1.00),(54,69,0,0.00),(55,70,0,0.00),(56,70,0,1.00),(57,71,0,0.00);
/*!40000 ALTER TABLE `submission_chapter_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_chapter_settings`
--

DROP TABLE IF EXISTS `submission_chapter_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_chapter_settings` (
  `submission_chapter_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `chapter_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`submission_chapter_setting_id`),
  UNIQUE KEY `submission_chapter_settings_unique` (`chapter_id`,`locale`,`setting_name`),
  KEY `submission_chapter_settings_chapter_id` (`chapter_id`),
  CONSTRAINT `submission_chapter_settings_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=711 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More information about submission chapters, including localized properties such as chapter titles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_chapter_settings`
--

LOCK TABLES `submission_chapter_settings` WRITE;
/*!40000 ALTER TABLE `submission_chapter_settings` DISABLE KEYS */;
INSERT INTO `submission_chapter_settings` VALUES (1,1,'en','title','Choosing the Future','string'),(2,1,'fr_CA','title','','string'),(3,1,'en','subtitle','','string'),(4,1,'fr_CA','subtitle','','string'),(5,1,'en','abstract','','string'),(6,1,'fr_CA','abstract','','string'),(7,1,'','datePublished',NULL,'string'),(8,1,'','pages','','string'),(9,1,'','isPageEnabled',NULL,'string'),(10,1,'','licenseUrl',NULL,'string'),(11,2,'en','title','Axioms','string'),(12,2,'fr_CA','title','','string'),(13,2,'en','subtitle','','string'),(14,2,'fr_CA','subtitle','','string'),(15,2,'en','abstract','','string'),(16,2,'fr_CA','abstract','','string'),(17,2,'','datePublished',NULL,'string'),(18,2,'','pages','','string'),(19,2,'','isPageEnabled',NULL,'string'),(20,2,'','licenseUrl',NULL,'string'),(21,3,'en','title','Paradigm Shift','string'),(22,3,'fr_CA','title','','string'),(23,3,'en','subtitle','','string'),(24,3,'fr_CA','subtitle','','string'),(25,3,'en','abstract','','string'),(26,3,'fr_CA','abstract','','string'),(27,3,'','datePublished',NULL,'string'),(28,3,'','pages','','string'),(29,3,'','isPageEnabled',NULL,'string'),(30,3,'','licenseUrl',NULL,'string'),(31,4,'en','title','Critical History in Western Canada 1900–2000','string'),(32,4,'fr_CA','title','','string'),(33,4,'en','subtitle','','string'),(34,4,'fr_CA','subtitle','','string'),(35,4,'en','abstract','','string'),(36,4,'fr_CA','abstract','','string'),(37,4,'','datePublished',NULL,'string'),(38,4,'','pages','','string'),(39,4,'','isPageEnabled',NULL,'string'),(40,4,'','licenseUrl','','string'),(41,5,'en','title','Vernacular Currents in Western Canadian Historiography: The Passion and Prose of Katherine Hughes, F.G. Roe, and Roy Ito','string'),(42,5,'fr_CA','title','','string'),(43,5,'en','subtitle','','string'),(44,5,'fr_CA','subtitle','','string'),(45,5,'en','abstract','','string'),(46,5,'fr_CA','abstract','','string'),(47,5,'','datePublished',NULL,'string'),(48,5,'','pages','','string'),(49,5,'','isPageEnabled',NULL,'string'),(50,5,'','licenseUrl','','string'),(51,6,'en','title','Cree Intellectual Traditions in History','string'),(52,6,'fr_CA','title','','string'),(53,6,'en','subtitle','','string'),(54,6,'fr_CA','subtitle','','string'),(55,6,'en','abstract','','string'),(56,6,'fr_CA','abstract','','string'),(57,6,'','datePublished',NULL,'string'),(58,6,'','pages','','string'),(59,6,'','isPageEnabled',NULL,'string'),(60,6,'','licenseUrl','','string'),(61,7,'en','title','Visualizing Space, Race, and History in the North: Photographic Narratives of the Athabasca-Mackenzie River Basin','string'),(62,7,'fr_CA','title','','string'),(63,7,'en','subtitle','','string'),(64,7,'fr_CA','subtitle','','string'),(65,7,'en','abstract','','string'),(66,7,'fr_CA','abstract','','string'),(67,7,'','datePublished',NULL,'string'),(68,7,'','pages','','string'),(69,7,'','isPageEnabled',NULL,'string'),(70,7,'','licenseUrl','','string'),(71,8,'en','title','Introduction','string'),(72,8,'fr_CA','title','','string'),(73,8,'en','subtitle','','string'),(74,8,'fr_CA','subtitle','','string'),(75,8,'en','abstract','','string'),(76,8,'fr_CA','abstract','','string'),(77,8,'','datePublished',NULL,'string'),(78,8,'','pages','','string'),(79,8,'','isPageEnabled',NULL,'string'),(80,8,'','licenseUrl',NULL,'string'),(81,9,'en','title','Part One. Employment Relationships in Canada','string'),(82,9,'fr_CA','title','','string'),(83,9,'en','subtitle','','string'),(84,9,'fr_CA','subtitle','','string'),(85,9,'en','abstract','','string'),(86,9,'fr_CA','abstract','','string'),(87,9,'','datePublished',NULL,'string'),(88,9,'','pages','','string'),(89,9,'','isPageEnabled',NULL,'string'),(90,9,'','licenseUrl',NULL,'string'),(91,10,'en','title','Part Two. Preventing Workplace Injury','string'),(92,10,'fr_CA','title','','string'),(93,10,'en','subtitle','','string'),(94,10,'fr_CA','subtitle','','string'),(95,10,'en','abstract','','string'),(96,10,'fr_CA','abstract','','string'),(97,10,'','datePublished',NULL,'string'),(98,10,'','pages','','string'),(99,10,'','isPageEnabled',NULL,'string'),(100,10,'','licenseUrl',NULL,'string'),(101,11,'en','title','Part Three. Critique of OHS in Canada','string'),(102,11,'fr_CA','title','','string'),(103,11,'en','subtitle','','string'),(104,11,'fr_CA','subtitle','','string'),(105,11,'en','abstract','','string'),(106,11,'fr_CA','abstract','','string'),(107,11,'','datePublished',NULL,'string'),(108,11,'','pages','','string'),(109,11,'','isPageEnabled',NULL,'string'),(110,11,'','licenseUrl',NULL,'string'),(111,12,'en','title','Part Four. Political Economy of Preventing Workplace Injury','string'),(112,12,'fr_CA','title','','string'),(113,12,'en','subtitle','','string'),(114,12,'fr_CA','subtitle','','string'),(115,12,'en','abstract','','string'),(116,12,'fr_CA','abstract','','string'),(117,12,'','datePublished',NULL,'string'),(118,12,'','pages','','string'),(119,12,'','isPageEnabled',NULL,'string'),(120,12,'','licenseUrl',NULL,'string'),(121,13,'en','title','Introduction: Contexts of Popular Culture','string'),(122,13,'fr_CA','title','','string'),(123,13,'en','subtitle','','string'),(124,13,'fr_CA','subtitle','','string'),(125,13,'en','abstract','','string'),(126,13,'fr_CA','abstract','','string'),(127,13,'','datePublished',NULL,'string'),(128,13,'','pages','','string'),(129,13,'','isPageEnabled',NULL,'string'),(130,13,'','licenseUrl',NULL,'string'),(131,14,'en','title','Chapter 1. A Future for Media Studies: Cultural Labour, Cultural Relations, Cultural Politics','string'),(132,14,'fr_CA','title','','string'),(133,14,'en','subtitle','','string'),(134,14,'fr_CA','subtitle','','string'),(135,14,'en','abstract','','string'),(136,14,'fr_CA','abstract','','string'),(137,14,'','datePublished',NULL,'string'),(138,14,'','pages','','string'),(139,14,'','isPageEnabled',NULL,'string'),(140,14,'','licenseUrl',NULL,'string'),(141,15,'en','title','Chapter 2. Log On, Goof Off, and Look Up: Facebook and the Rhythms of Canadian Internet Use','string'),(142,15,'fr_CA','title','','string'),(143,15,'en','subtitle','','string'),(144,15,'fr_CA','subtitle','','string'),(145,15,'en','abstract','','string'),(146,15,'fr_CA','abstract','','string'),(147,15,'','datePublished',NULL,'string'),(148,15,'','pages','','string'),(149,15,'','isPageEnabled',NULL,'string'),(150,15,'','licenseUrl',NULL,'string'),(151,16,'en','title','Chapter 3. Hawkers and Public Space: Free Commuter Newspapers in Canada','string'),(152,16,'fr_CA','title','','string'),(153,16,'en','subtitle','','string'),(154,16,'fr_CA','subtitle','','string'),(155,16,'en','abstract','','string'),(156,16,'fr_CA','abstract','','string'),(157,16,'','datePublished',NULL,'string'),(158,16,'','pages','','string'),(159,16,'','isPageEnabled',NULL,'string'),(160,16,'','licenseUrl',NULL,'string'),(161,17,'en','title','Prologue','string'),(162,17,'fr_CA','title','','string'),(163,17,'en','subtitle','','string'),(164,17,'fr_CA','subtitle','','string'),(165,17,'en','abstract','','string'),(166,17,'fr_CA','abstract','','string'),(167,17,'','datePublished',NULL,'string'),(168,17,'','pages','','string'),(169,17,'','isPageEnabled',NULL,'string'),(170,17,'','licenseUrl',NULL,'string'),(171,18,'en','title','Chapter 1: The First Five Years: 1867-1872','string'),(172,18,'fr_CA','title','','string'),(173,18,'en','subtitle','','string'),(174,18,'fr_CA','subtitle','','string'),(175,18,'en','abstract','','string'),(176,18,'fr_CA','abstract','','string'),(177,18,'','datePublished',NULL,'string'),(178,18,'','pages','','string'),(179,18,'','isPageEnabled',NULL,'string'),(180,18,'','licenseUrl',NULL,'string'),(181,19,'en','title','Chapter 2: Free Trade or \"Freedom\": 1911','string'),(182,19,'fr_CA','title','','string'),(183,19,'en','subtitle','','string'),(184,19,'fr_CA','subtitle','','string'),(185,19,'en','abstract','','string'),(186,19,'fr_CA','abstract','','string'),(187,19,'','datePublished',NULL,'string'),(188,19,'','pages','','string'),(189,19,'','isPageEnabled',NULL,'string'),(190,19,'','licenseUrl',NULL,'string'),(191,20,'en','title','Chapter 3: Castro, Nukes & the Cold War: 1953-1968','string'),(192,20,'fr_CA','title','','string'),(193,20,'en','subtitle','','string'),(194,20,'fr_CA','subtitle','','string'),(195,20,'en','abstract','','string'),(196,20,'fr_CA','abstract','','string'),(197,20,'','datePublished',NULL,'string'),(198,20,'','pages','','string'),(199,20,'','isPageEnabled',NULL,'string'),(200,20,'','licenseUrl',NULL,'string'),(201,21,'en','title','Chapter 4: Enter the Intellect: 1968-1984','string'),(202,21,'fr_CA','title','','string'),(203,21,'en','subtitle','','string'),(204,21,'fr_CA','subtitle','','string'),(205,21,'en','abstract','','string'),(206,21,'fr_CA','abstract','','string'),(207,21,'','datePublished',NULL,'string'),(208,21,'','pages','','string'),(209,21,'','isPageEnabled',NULL,'string'),(210,21,'','licenseUrl',NULL,'string'),(211,22,'en','title','Epilogue','string'),(212,22,'fr_CA','title','','string'),(213,22,'en','subtitle','','string'),(214,22,'fr_CA','subtitle','','string'),(215,22,'en','abstract','','string'),(216,22,'fr_CA','abstract','','string'),(217,22,'','datePublished',NULL,'string'),(218,22,'','pages','','string'),(219,22,'','isPageEnabled',NULL,'string'),(220,22,'','licenseUrl',NULL,'string'),(221,23,'en','title','Identify: Understanding Your Information Need','string'),(222,23,'fr_CA','title','','string'),(223,23,'en','subtitle','','string'),(224,23,'fr_CA','subtitle','','string'),(225,23,'en','abstract','','string'),(226,23,'fr_CA','abstract','','string'),(227,23,'','datePublished',NULL,'string'),(228,23,'','pages','','string'),(229,23,'','isPageEnabled',NULL,'string'),(230,23,'','licenseUrl',NULL,'string'),(231,24,'en','title','Scope: Knowing What Is Available','string'),(232,24,'fr_CA','title','','string'),(233,24,'en','subtitle','','string'),(234,24,'fr_CA','subtitle','','string'),(235,24,'en','abstract','','string'),(236,24,'fr_CA','abstract','','string'),(237,24,'','datePublished',NULL,'string'),(238,24,'','pages','','string'),(239,24,'','isPageEnabled',NULL,'string'),(240,24,'','licenseUrl',NULL,'string'),(241,25,'en','title','Plan: Developing Research Strategies','string'),(242,25,'fr_CA','title','','string'),(243,25,'en','subtitle','','string'),(244,25,'fr_CA','subtitle','','string'),(245,25,'en','abstract','','string'),(246,25,'fr_CA','abstract','','string'),(247,25,'','datePublished',NULL,'string'),(248,25,'','pages','','string'),(249,25,'','isPageEnabled',NULL,'string'),(250,25,'','licenseUrl',NULL,'string'),(251,26,'en','title','Gather: Finding What You Need','string'),(252,26,'fr_CA','title','','string'),(253,26,'en','subtitle','','string'),(254,26,'fr_CA','subtitle','','string'),(255,26,'en','abstract','','string'),(256,26,'fr_CA','abstract','','string'),(257,26,'','datePublished',NULL,'string'),(258,26,'','pages','','string'),(259,26,'','isPageEnabled',NULL,'string'),(260,26,'','licenseUrl',NULL,'string'),(261,27,'en','title','Introduction','string'),(262,27,'fr_CA','title','','string'),(263,27,'en','subtitle','','string'),(264,27,'fr_CA','subtitle','','string'),(265,27,'en','abstract','','string'),(266,27,'fr_CA','abstract','','string'),(267,27,'','datePublished',NULL,'string'),(268,27,'','pages','','string'),(269,27,'','isPageEnabled',NULL,'string'),(270,27,'','licenseUrl',NULL,'string'),(271,28,'en','title','Chapter 1: Interactions Affording Distance Science Education','string'),(272,28,'fr_CA','title','','string'),(273,28,'en','subtitle','','string'),(274,28,'fr_CA','subtitle','','string'),(275,28,'en','abstract','','string'),(276,28,'fr_CA','abstract','','string'),(277,28,'','datePublished',NULL,'string'),(278,28,'','pages','','string'),(279,28,'','isPageEnabled',NULL,'string'),(280,28,'','licenseUrl',NULL,'string'),(281,29,'en','title','Chapter 2: Learning Science at a Distance: Instructional Dialogues and Resources','string'),(282,29,'fr_CA','title','','string'),(283,29,'en','subtitle','','string'),(284,29,'fr_CA','subtitle','','string'),(285,29,'en','abstract','','string'),(286,29,'fr_CA','abstract','','string'),(287,29,'','datePublished',NULL,'string'),(288,29,'','pages','','string'),(289,29,'','isPageEnabled',NULL,'string'),(290,29,'','licenseUrl',NULL,'string'),(291,30,'en','title','Chapter 3: Leadership Strategies for Coordinating Distance Education Instructional Development Teams','string'),(292,30,'fr_CA','title','','string'),(293,30,'en','subtitle','','string'),(294,30,'fr_CA','subtitle','','string'),(295,30,'en','abstract','','string'),(296,30,'fr_CA','abstract','','string'),(297,30,'','datePublished',NULL,'string'),(298,30,'','pages','','string'),(299,30,'','isPageEnabled',NULL,'string'),(300,30,'','licenseUrl',NULL,'string'),(301,31,'en','title','Chapter 4: Toward New Models of Flexible Education to Enhance Quality in Australian Higher Education','string'),(302,31,'fr_CA','title','','string'),(303,31,'en','subtitle','','string'),(304,31,'fr_CA','subtitle','','string'),(305,31,'en','abstract','','string'),(306,31,'fr_CA','abstract','','string'),(307,31,'','datePublished',NULL,'string'),(308,31,'','pages','','string'),(309,31,'','isPageEnabled',NULL,'string'),(310,31,'','licenseUrl',NULL,'string'),(311,32,'en','title','Internet, openness and the future of the information society in LAC','string'),(312,32,'fr_CA','title','','string'),(313,32,'en','subtitle','','string'),(314,32,'fr_CA','subtitle','','string'),(315,32,'en','abstract','','string'),(316,32,'fr_CA','abstract','','string'),(317,32,'','datePublished',NULL,'string'),(318,32,'','pages','','string'),(319,32,'','isPageEnabled',NULL,'string'),(320,32,'','licenseUrl',NULL,'string'),(321,33,'en','title','Imagining the Internet: Open, closed or in between?','string'),(322,33,'fr_CA','title','','string'),(323,33,'en','subtitle','','string'),(324,33,'fr_CA','subtitle','','string'),(325,33,'en','abstract','','string'),(326,33,'fr_CA','abstract','','string'),(327,33,'','datePublished',NULL,'string'),(328,33,'','pages','','string'),(329,33,'','isPageEnabled',NULL,'string'),(330,33,'','licenseUrl',NULL,'string'),(331,34,'en','title','The internet in LAC will remain free, public and open over the next 10 years','string'),(332,34,'fr_CA','title','','string'),(333,34,'en','subtitle','','string'),(334,34,'fr_CA','subtitle','','string'),(335,34,'en','abstract','','string'),(336,34,'fr_CA','abstract','','string'),(337,34,'','datePublished',NULL,'string'),(338,34,'','pages','','string'),(339,34,'','isPageEnabled',NULL,'string'),(340,34,'','licenseUrl',NULL,'string'),(341,35,'en','title','Free Internet?','string'),(342,35,'fr_CA','title','','string'),(343,35,'en','subtitle','','string'),(344,35,'fr_CA','subtitle','','string'),(345,35,'en','abstract','','string'),(346,35,'fr_CA','abstract','','string'),(347,35,'','datePublished',NULL,'string'),(348,35,'','pages','','string'),(349,35,'','isPageEnabled',NULL,'string'),(350,35,'','licenseUrl',NULL,'string'),(351,36,'en','title','Risks and challenges for freedom of expression on the internet','string'),(352,36,'fr_CA','title','','string'),(353,36,'en','subtitle','','string'),(354,36,'fr_CA','subtitle','','string'),(355,36,'en','abstract','','string'),(356,36,'fr_CA','abstract','','string'),(357,36,'','datePublished',NULL,'string'),(358,36,'','pages','','string'),(359,36,'','isPageEnabled',NULL,'string'),(360,36,'','licenseUrl',NULL,'string'),(361,37,'en','title','Introduction','string'),(362,37,'fr_CA','title','','string'),(363,37,'en','subtitle','','string'),(364,37,'fr_CA','subtitle','','string'),(365,37,'en','abstract','','string'),(366,37,'fr_CA','abstract','','string'),(367,37,'','datePublished',NULL,'string'),(368,37,'','pages','','string'),(369,37,'','isPageEnabled',NULL,'string'),(370,37,'','licenseUrl',NULL,'string'),(371,38,'en','title','CHAPTER ONE: Where the Buffalo Roamed','string'),(372,38,'fr_CA','title','','string'),(373,38,'en','subtitle','','string'),(374,38,'fr_CA','subtitle','','string'),(375,38,'en','abstract','','string'),(376,38,'fr_CA','abstract','','string'),(377,38,'','datePublished',NULL,'string'),(378,38,'','pages','','string'),(379,38,'','isPageEnabled',NULL,'string'),(380,38,'','licenseUrl',NULL,'string'),(381,39,'en','title','CHAPTER TWO: Bison Conservation and Buffalo National Park','string'),(382,39,'fr_CA','title','','string'),(383,39,'en','subtitle','','string'),(384,39,'fr_CA','subtitle','','string'),(385,39,'en','abstract','','string'),(386,39,'fr_CA','abstract','','string'),(387,39,'','datePublished',NULL,'string'),(388,39,'','pages','','string'),(389,39,'','isPageEnabled',NULL,'string'),(390,39,'','licenseUrl',NULL,'string'),(391,40,'en','title','CHAPTER THREE: A Well-Run Ranch','string'),(392,40,'fr_CA','title','','string'),(393,40,'en','subtitle','','string'),(394,40,'fr_CA','subtitle','','string'),(395,40,'en','abstract','','string'),(396,40,'fr_CA','abstract','','string'),(397,40,'','datePublished',NULL,'string'),(398,40,'','pages','','string'),(399,40,'','isPageEnabled',NULL,'string'),(400,40,'','licenseUrl',NULL,'string'),(401,41,'en','title','CHAPTER FOUR: Zookeepers and Animal Breeders','string'),(402,41,'fr_CA','title','','string'),(403,41,'en','subtitle','','string'),(404,41,'fr_CA','subtitle','','string'),(405,41,'en','abstract','','string'),(406,41,'fr_CA','abstract','','string'),(407,41,'','datePublished',NULL,'string'),(408,41,'','pages','','string'),(409,41,'','isPageEnabled',NULL,'string'),(410,41,'','licenseUrl',NULL,'string'),(411,42,'en','title','CHAPTER FIVE: \"Evolving the Arctic Cow\"','string'),(412,42,'fr_CA','title','','string'),(413,42,'en','subtitle','','string'),(414,42,'fr_CA','subtitle','','string'),(415,42,'en','abstract','','string'),(416,42,'fr_CA','abstract','','string'),(417,42,'','datePublished',NULL,'string'),(418,42,'','pages','','string'),(419,42,'','isPageEnabled',NULL,'string'),(420,42,'','licenseUrl',NULL,'string'),(421,43,'en','title','CONCLUSION: The Forgotten Park','string'),(422,43,'fr_CA','title','','string'),(423,43,'en','subtitle','','string'),(424,43,'fr_CA','subtitle','','string'),(425,43,'en','abstract','','string'),(426,43,'fr_CA','abstract','','string'),(427,43,'','datePublished',NULL,'string'),(428,43,'','pages','','string'),(429,43,'','isPageEnabled',NULL,'string'),(430,43,'','licenseUrl',NULL,'string'),(431,44,'en','title','Bibliography','string'),(432,44,'fr_CA','title','','string'),(433,44,'en','subtitle','','string'),(434,44,'fr_CA','subtitle','','string'),(435,44,'en','abstract','','string'),(436,44,'fr_CA','abstract','','string'),(437,44,'','datePublished',NULL,'string'),(438,44,'','pages','','string'),(439,44,'','isPageEnabled',NULL,'string'),(440,44,'','licenseUrl',NULL,'string'),(441,45,'en','title','Index','string'),(442,45,'fr_CA','title','','string'),(443,45,'en','subtitle','','string'),(444,45,'fr_CA','subtitle','','string'),(445,45,'en','abstract','','string'),(446,45,'fr_CA','abstract','','string'),(447,45,'','datePublished',NULL,'string'),(448,45,'','pages','','string'),(449,45,'','isPageEnabled',NULL,'string'),(450,45,'','licenseUrl',NULL,'string'),(451,46,'en','title','Introduction','string'),(452,46,'fr_CA','title','','string'),(453,46,'en','subtitle','','string'),(454,46,'fr_CA','subtitle','','string'),(455,46,'en','abstract','','string'),(456,46,'fr_CA','abstract','','string'),(457,46,'','datePublished',NULL,'string'),(458,46,'','pages','','string'),(459,46,'','isPageEnabled',NULL,'string'),(460,46,'','licenseUrl',NULL,'string'),(461,47,'en','title','Poems','string'),(462,47,'fr_CA','title','','string'),(463,47,'en','subtitle','','string'),(464,47,'fr_CA','subtitle','','string'),(465,47,'en','abstract','','string'),(466,47,'fr_CA','abstract','','string'),(467,47,'','datePublished',NULL,'string'),(468,47,'','pages','','string'),(469,47,'','isPageEnabled',NULL,'string'),(470,47,'','licenseUrl',NULL,'string'),(471,48,'en','title','Catalyzing Access through Social and Technical Innovation','string'),(472,48,'fr_CA','title','','string'),(473,48,'en','subtitle','','string'),(474,48,'fr_CA','subtitle','','string'),(475,48,'en','abstract','','string'),(476,48,'fr_CA','abstract','','string'),(477,48,'','datePublished',NULL,'string'),(478,48,'','pages','','string'),(479,48,'','isPageEnabled',NULL,'string'),(480,48,'','licenseUrl',NULL,'string'),(481,49,'en','title','Catalyzing Access via Telecommunications Policy','string'),(482,49,'fr_CA','title','','string'),(483,49,'en','subtitle','','string'),(484,49,'fr_CA','subtitle','','string'),(485,49,'en','abstract','','string'),(486,49,'fr_CA','abstract','','string'),(487,49,'','datePublished',NULL,'string'),(488,49,'','pages','','string'),(489,49,'','isPageEnabled',NULL,'string'),(490,49,'','licenseUrl',NULL,'string'),(491,50,'en','title','Access to Knowledge as a New Paradigm for Research on ICTs and Intellectual Property','string'),(492,50,'fr_CA','title','','string'),(493,50,'en','subtitle','','string'),(494,50,'fr_CA','subtitle','','string'),(495,50,'en','abstract','','string'),(496,50,'fr_CA','abstract','','string'),(497,50,'','datePublished',NULL,'string'),(498,50,'','pages','','string'),(499,50,'','isPageEnabled',NULL,'string'),(500,50,'','licenseUrl',NULL,'string'),(501,51,'en','title','Current State of Mobile Learning','string'),(502,51,'fr_CA','title','','string'),(503,51,'en','subtitle','','string'),(504,51,'fr_CA','subtitle','','string'),(505,51,'en','abstract','','string'),(506,51,'fr_CA','abstract','','string'),(507,51,'','datePublished',NULL,'string'),(508,51,'','pages','','string'),(509,51,'','isPageEnabled',NULL,'string'),(510,51,'','licenseUrl',NULL,'string'),(511,52,'en','title','A Model for Framing Mobile Learning','string'),(512,52,'fr_CA','title','','string'),(513,52,'en','subtitle','','string'),(514,52,'fr_CA','subtitle','','string'),(515,52,'en','abstract','','string'),(516,52,'fr_CA','abstract','','string'),(517,52,'','datePublished',NULL,'string'),(518,52,'','pages','','string'),(519,52,'','isPageEnabled',NULL,'string'),(520,52,'','licenseUrl',NULL,'string'),(521,53,'en','title','Mobile Distance Learning with PDAs: Development and Testing of Pedagogical and System Solutions Supporting Mobile Distance Learners','string'),(522,53,'fr_CA','title','','string'),(523,53,'en','subtitle','','string'),(524,53,'fr_CA','subtitle','','string'),(525,53,'en','abstract','','string'),(526,53,'fr_CA','abstract','','string'),(527,53,'','datePublished',NULL,'string'),(528,53,'','pages','','string'),(529,53,'','isPageEnabled',NULL,'string'),(530,53,'','licenseUrl',NULL,'string'),(531,54,'en','title','Chapter 1: Mind Control—Internal or External?','string'),(532,54,'fr_CA','title','','string'),(533,54,'en','subtitle','','string'),(534,54,'fr_CA','subtitle','','string'),(535,54,'en','abstract','','string'),(536,54,'fr_CA','abstract','','string'),(537,54,'','datePublished',NULL,'string'),(538,54,'','pages','','string'),(539,54,'','isPageEnabled',NULL,'string'),(540,54,'','licenseUrl',NULL,'string'),(541,55,'en','title','Chapter 2: Classical Music and the Classical Mind','string'),(542,55,'fr_CA','title','','string'),(543,55,'en','subtitle','','string'),(544,55,'fr_CA','subtitle','','string'),(545,55,'en','abstract','','string'),(546,55,'fr_CA','abstract','','string'),(547,55,'','datePublished',NULL,'string'),(548,55,'','pages','','string'),(549,55,'','isPageEnabled',NULL,'string'),(550,55,'','licenseUrl',NULL,'string'),(551,56,'en','title','Chapter 3: Situated Cognition and Bricolage','string'),(552,56,'fr_CA','title','','string'),(553,56,'en','subtitle','','string'),(554,56,'fr_CA','subtitle','','string'),(555,56,'en','abstract','','string'),(556,56,'fr_CA','abstract','','string'),(557,56,'','datePublished',NULL,'string'),(558,56,'','pages','','string'),(559,56,'','isPageEnabled',NULL,'string'),(560,56,'','licenseUrl',NULL,'string'),(561,57,'en','title','Chapter 4: Braitenberg’s Vehicle 2','string'),(562,57,'fr_CA','title','','string'),(563,57,'en','subtitle','','string'),(564,57,'fr_CA','subtitle','','string'),(565,57,'en','abstract','','string'),(566,57,'fr_CA','abstract','','string'),(567,57,'','datePublished',NULL,'string'),(568,57,'','pages','','string'),(569,57,'','isPageEnabled',NULL,'string'),(570,57,'','licenseUrl',NULL,'string'),(571,58,'en','title','Setting the Stage','string'),(572,58,'fr_CA','title','','string'),(573,58,'en','subtitle','','string'),(574,58,'fr_CA','subtitle','','string'),(575,58,'en','abstract','','string'),(576,58,'fr_CA','abstract','','string'),(577,58,'','datePublished',NULL,'string'),(578,58,'','pages','','string'),(579,58,'','isPageEnabled',NULL,'string'),(580,58,'','licenseUrl',NULL,'string'),(581,59,'en','title','Going It Alone, 1945-1954','string'),(582,59,'fr_CA','title','','string'),(583,59,'en','subtitle','','string'),(584,59,'fr_CA','subtitle','','string'),(585,59,'en','abstract','','string'),(586,59,'fr_CA','abstract','','string'),(587,59,'','datePublished',NULL,'string'),(588,59,'','pages','','string'),(589,59,'','isPageEnabled',NULL,'string'),(590,59,'','licenseUrl',NULL,'string'),(591,60,'en','title','Establishing the Pattern, 1955-1962','string'),(592,60,'fr_CA','title','','string'),(593,60,'en','subtitle','','string'),(594,60,'fr_CA','subtitle','','string'),(595,60,'en','abstract','','string'),(596,60,'fr_CA','abstract','','string'),(597,60,'','datePublished',NULL,'string'),(598,60,'','pages','','string'),(599,60,'','isPageEnabled',NULL,'string'),(600,60,'','licenseUrl',NULL,'string'),(601,61,'en','title','Foreward','string'),(602,61,'fr_CA','title','','string'),(603,61,'en','subtitle','','string'),(604,61,'fr_CA','subtitle','','string'),(605,61,'en','abstract','','string'),(606,61,'fr_CA','abstract','','string'),(607,61,'','datePublished',NULL,'string'),(608,61,'','pages','','string'),(609,61,'','isPageEnabled',NULL,'string'),(610,61,'','licenseUrl',NULL,'string'),(611,62,'en','title','Preface','string'),(612,62,'fr_CA','title','','string'),(613,62,'en','subtitle','','string'),(614,62,'fr_CA','subtitle','','string'),(615,62,'en','abstract','','string'),(616,62,'fr_CA','abstract','','string'),(617,62,'','datePublished',NULL,'string'),(618,62,'','pages','','string'),(619,62,'','isPageEnabled',NULL,'string'),(620,62,'','licenseUrl',NULL,'string'),(621,63,'en','title','The Case Studies','string'),(622,63,'fr_CA','title','','string'),(623,63,'en','subtitle','','string'),(624,63,'fr_CA','subtitle','','string'),(625,63,'en','abstract','','string'),(626,63,'fr_CA','abstract','','string'),(627,63,'','datePublished',NULL,'string'),(628,63,'','pages','','string'),(629,63,'','isPageEnabled',NULL,'string'),(630,63,'','licenseUrl',NULL,'string'),(631,64,'en','title','Conclusion','string'),(632,64,'fr_CA','title','','string'),(633,64,'en','subtitle','','string'),(634,64,'fr_CA','subtitle','','string'),(635,64,'en','abstract','','string'),(636,64,'fr_CA','abstract','','string'),(637,64,'','datePublished',NULL,'string'),(638,64,'','pages','','string'),(639,64,'','isPageEnabled',NULL,'string'),(640,64,'','licenseUrl',NULL,'string'),(641,65,'en','title','Bibliography','string'),(642,65,'fr_CA','title','','string'),(643,65,'en','subtitle','','string'),(644,65,'fr_CA','subtitle','','string'),(645,65,'en','abstract','','string'),(646,65,'fr_CA','abstract','','string'),(647,65,'','datePublished',NULL,'string'),(648,65,'','pages','','string'),(649,65,'','isPageEnabled',NULL,'string'),(650,65,'','licenseUrl',NULL,'string'),(651,66,'en','title','Preface','string'),(652,66,'fr_CA','title','','string'),(653,66,'en','subtitle','','string'),(654,66,'fr_CA','subtitle','','string'),(655,66,'en','abstract','','string'),(656,66,'fr_CA','abstract','','string'),(657,66,'','datePublished',NULL,'string'),(658,66,'','pages','','string'),(659,66,'','isPageEnabled',NULL,'string'),(660,66,'','licenseUrl',NULL,'string'),(661,67,'en','title','Introduction','string'),(662,67,'fr_CA','title','','string'),(663,67,'en','subtitle','','string'),(664,67,'fr_CA','subtitle','','string'),(665,67,'en','abstract','','string'),(666,67,'fr_CA','abstract','','string'),(667,67,'','datePublished',NULL,'string'),(668,67,'','pages','','string'),(669,67,'','isPageEnabled',NULL,'string'),(670,67,'','licenseUrl',NULL,'string'),(671,68,'en','title','The Emergence of Open Development in a Network Society','string'),(672,68,'fr_CA','title','','string'),(673,68,'en','subtitle','','string'),(674,68,'fr_CA','subtitle','','string'),(675,68,'en','abstract','','string'),(676,68,'fr_CA','abstract','','string'),(677,68,'','datePublished',NULL,'string'),(678,68,'','pages','','string'),(679,68,'','isPageEnabled',NULL,'string'),(680,68,'','licenseUrl',NULL,'string'),(681,69,'en','title','Enacting Openness in ICT4D Research','string'),(682,69,'fr_CA','title','','string'),(683,69,'en','subtitle','','string'),(684,69,'fr_CA','subtitle','','string'),(685,69,'en','abstract','','string'),(686,69,'fr_CA','abstract','','string'),(687,69,'','datePublished',NULL,'string'),(688,69,'','pages','','string'),(689,69,'','isPageEnabled',NULL,'string'),(690,69,'','licenseUrl',NULL,'string'),(691,70,'en','title','Transparency and Development: Ethical Consumption through Web 2.0 and the Internet of Things','string'),(692,70,'fr_CA','title','','string'),(693,70,'en','subtitle','','string'),(694,70,'fr_CA','subtitle','','string'),(695,70,'en','abstract','','string'),(696,70,'fr_CA','abstract','','string'),(697,70,'','datePublished',NULL,'string'),(698,70,'','pages','','string'),(699,70,'','isPageEnabled',NULL,'string'),(700,70,'','licenseUrl',NULL,'string'),(701,71,'en','title','Open Educational Resources: Opportunities and Challenges for the Developing World','string'),(702,71,'fr_CA','title','','string'),(703,71,'en','subtitle','','string'),(704,71,'fr_CA','subtitle','','string'),(705,71,'en','abstract','','string'),(706,71,'fr_CA','abstract','','string'),(707,71,'','datePublished',NULL,'string'),(708,71,'','pages','','string'),(709,71,'','isPageEnabled',NULL,'string'),(710,71,'','licenseUrl',NULL,'string');
/*!40000 ALTER TABLE `submission_chapter_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_chapters`
--

DROP TABLE IF EXISTS `submission_chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_chapters` (
  `chapter_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `primary_contact_id` bigint(20) DEFAULT NULL,
  `publication_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `source_chapter_id` bigint(20) DEFAULT NULL,
  `doi_id` bigint(20) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A list of chapters for each submission (when submissions are divided into chapters).';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_comments` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_type` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `comment_title` text NOT NULL,
  `comments` text DEFAULT NULL,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `submission_comments_submission_id` (`submission_id`),
  KEY `submission_comments_author_id` (`author_id`),
  CONSTRAINT `submission_comments_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_comments_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Comments on a submission, e.g. peer review comments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_comments`
--

LOCK TABLES `submission_comments` WRITE;
/*!40000 ALTER TABLE `submission_comments` DISABLE KEYS */;
INSERT INTO `submission_comments` VALUES (1,1,4096,11,10,10,'','<p>I recommend that the author revise this submission.</p>','2023-06-04 22:14:21',NULL,1),(2,1,4096,11,11,12,'','<p>I recommend that the author resubmit this submission.</p>','2023-06-04 22:14:33',NULL,1),(3,1,4096,12,13,8,'','<p>I recommend declining this submission.</p>','2023-06-04 22:16:25',NULL,1),(4,1,4096,13,16,10,'','<p>I recommend requiring revisions.</p>','2023-06-04 22:18:12',NULL,1),(5,1,4096,13,18,12,'','<p>I recommend resubmitting.</p>','2023-06-04 22:18:24',NULL,1),(6,1,4096,16,21,10,'','<p>I recommend that the author revise this submission.</p>','2023-06-04 22:24:44',NULL,1);
/*!40000 ALTER TABLE `submission_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_revisions`
--

DROP TABLE IF EXISTS `submission_file_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_file_revisions` (
  `revision_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `submission_file_id` bigint(20) unsigned NOT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`revision_id`),
  KEY `submission_file_revisions_submission_file_id` (`submission_file_id`),
  KEY `submission_file_revisions_file_id` (`file_id`),
  CONSTRAINT `submission_file_revisions_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_file_revisions_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Revisions map submission_file entries to files on the data store.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_revisions`
--

LOCK TABLES `submission_file_revisions` WRITE;
/*!40000 ALTER TABLE `submission_file_revisions` DISABLE KEYS */;
INSERT INTO `submission_file_revisions` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,3),(5,5,2),(6,6,1),(7,7,4),(8,8,5),(9,9,6),(10,10,7),(12,12,7),(13,13,6),(14,14,5),(15,15,4),(16,16,9),(17,17,10),(18,18,11),(19,19,12),(20,20,13),(21,21,14),(22,22,15),(23,23,16),(24,24,17),(25,25,16),(26,26,17),(27,27,15),(28,28,14),(29,29,18),(30,30,19),(31,31,20),(32,32,21),(33,33,22),(34,34,23),(35,35,23),(36,36,22),(37,37,21),(38,38,20),(39,39,19),(40,40,18),(41,41,23),(42,42,24),(43,43,25),(44,44,26),(45,45,27),(46,46,27),(47,47,25),(48,48,24),(49,49,26),(50,50,28),(51,51,29),(52,52,30),(53,53,31),(54,54,32),(55,55,32),(56,56,30),(57,57,31),(58,58,29),(59,59,28),(60,60,33),(61,61,34),(62,62,35),(63,63,36),(64,64,37),(65,65,38),(66,66,38),(67,67,36),(68,68,37),(69,69,35),(70,70,34),(71,71,39),(72,72,40),(73,73,41),(74,74,42),(75,75,43),(76,76,44),(77,77,45),(78,78,46),(79,79,47),(80,80,48),(81,81,49),(82,82,49),(83,83,48),(84,84,50),(85,85,51),(86,86,52),(87,87,52),(88,88,51),(89,89,50),(90,90,53),(91,91,54),(92,92,55),(93,93,55),(94,94,54),(95,95,53),(96,96,56),(97,97,57),(98,98,58),(99,99,59),(100,100,60),(101,101,61),(102,102,61),(103,103,60),(104,104,59),(105,105,58),(106,106,57),(107,107,56),(108,108,61),(109,109,60),(110,110,59),(111,111,58),(112,112,57),(113,113,56),(114,114,62),(115,115,63),(116,116,64),(117,117,64),(118,118,63),(119,119,62),(120,120,65),(121,121,66),(122,122,67),(123,123,68),(124,124,69),(125,125,69),(126,126,68),(127,127,67),(128,128,66),(129,129,65),(130,130,70),(131,131,71),(132,132,72),(133,133,73),(134,134,74),(135,135,75),(136,136,75),(137,137,74),(138,138,73),(139,139,72),(140,140,70),(141,141,71);
/*!40000 ALTER TABLE `submission_file_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_settings`
--

DROP TABLE IF EXISTS `submission_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_file_settings` (
  `submission_file_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `submission_file_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`submission_file_setting_id`),
  UNIQUE KEY `submission_file_settings_unique` (`submission_file_id`,`locale`,`setting_name`),
  KEY `submission_file_settings_submission_file_id` (`submission_file_id`),
  CONSTRAINT `submission_file_settings_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Localized data about submission files like published metadata.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_settings`
--

LOCK TABLES `submission_file_settings` WRITE;
/*!40000 ALTER TABLE `submission_file_settings` DISABLE KEYS */;
INSERT INTO `submission_file_settings` VALUES (1,1,'en','name','chapter1.pdf'),(2,2,'en','name','chapter2.pdf'),(3,3,'en','name','chapter3.pdf'),(4,1,'','chapterId','1'),(5,2,'','chapterId','2'),(6,3,'','chapterId','3'),(7,4,'en','name','chapter3.pdf'),(8,4,'','chapterId','3'),(9,5,'en','name','chapter2.pdf'),(10,5,'','chapterId','2'),(11,6,'en','name','chapter1.pdf'),(12,6,'','chapterId','1'),(13,7,'en','name','chapter1.pdf'),(14,8,'en','name','chapter2.pdf'),(15,9,'en','name','chapter3.pdf'),(16,10,'en','name','chapter4.pdf'),(18,7,'','chapterId','4'),(19,8,'','chapterId','5'),(20,9,'','chapterId','6'),(21,10,'','chapterId','7'),(22,12,'en','name','chapter4.pdf'),(23,12,'','chapterId','7'),(24,13,'en','name','chapter3.pdf'),(25,13,'','chapterId','6'),(26,14,'en','name','chapter2.pdf'),(27,14,'','chapterId','5'),(28,15,'en','name','chapter1.pdf'),(29,15,'','chapterId','4'),(30,16,'en','name','chapter1.pdf'),(31,17,'en','name','chapter2.pdf'),(32,18,'en','name','chapter3.pdf'),(33,19,'en','name','chapter4.pdf'),(34,20,'en','name','chapter5.pdf'),(35,16,'','chapterId','8'),(36,17,'','chapterId','9'),(37,18,'','chapterId','10'),(38,19,'','chapterId','11'),(39,20,'','chapterId','12'),(40,21,'en','name','chapter1.pdf'),(41,22,'en','name','chapter2.pdf'),(42,23,'en','name','chapter3.pdf'),(43,24,'en','name','intro.pdf'),(44,24,'','chapterId','13'),(45,21,'','chapterId','14'),(46,22,'','chapterId','15'),(47,23,'','chapterId','16'),(48,25,'en','name','chapter3.pdf'),(49,25,'','chapterId','16'),(50,26,'en','name','intro.pdf'),(51,26,'','chapterId','13'),(52,27,'en','name','chapter2.pdf'),(53,27,'','chapterId','15'),(54,28,'en','name','chapter1.pdf'),(55,28,'','chapterId','14'),(56,29,'en','name','prologue.pdf'),(57,30,'en','name','chapter1.pdf'),(58,31,'en','name','chapter2.pdf'),(59,32,'en','name','chapter3.pdf'),(60,33,'en','name','chapter4.pdf'),(61,34,'en','name','epilogue.pdf'),(62,29,'','chapterId','17'),(63,30,'','chapterId','18'),(64,31,'','chapterId','19'),(65,32,'','chapterId','20'),(66,33,'','chapterId','21'),(67,34,'','chapterId','22'),(68,35,'en','name','epilogue.pdf'),(69,35,'','chapterId','22'),(70,36,'en','name','chapter4.pdf'),(71,36,'','chapterId','21'),(72,37,'en','name','chapter3.pdf'),(73,37,'','chapterId','20'),(74,38,'en','name','chapter2.pdf'),(75,38,'','chapterId','19'),(76,39,'en','name','chapter1.pdf'),(77,39,'','chapterId','18'),(78,40,'en','name','prologue.pdf'),(79,40,'','chapterId','17'),(80,41,'en','name','epilogue.pdf'),(81,41,'','chapterId','22'),(82,42,'en','name','chapter1.pdf'),(83,43,'en','name','chapter2.pdf'),(84,44,'en','name','chapter3.pdf'),(85,45,'en','name','chapter4.pdf'),(86,42,'','chapterId','23'),(87,43,'','chapterId','24'),(88,44,'','chapterId','25'),(89,45,'','chapterId','26'),(90,46,'en','name','chapter4.pdf'),(91,46,'','chapterId','26'),(92,47,'en','name','chapter2.pdf'),(93,47,'','chapterId','24'),(94,48,'en','name','chapter1.pdf'),(95,48,'','chapterId','23'),(96,49,'en','name','chapter3.pdf'),(97,49,'','chapterId','25'),(98,50,'en','name','intro.pdf'),(99,51,'en','name','chapter1.pdf'),(100,52,'en','name','chapter2.pdf'),(101,53,'en','name','chapter3.pdf'),(102,54,'en','name','chapter4.pdf'),(103,50,'','chapterId','27'),(104,51,'','chapterId','28'),(105,52,'','chapterId','29'),(106,53,'','chapterId','30'),(107,54,'','chapterId','31'),(108,55,'en','name','chapter4.pdf'),(109,55,'','chapterId','31'),(110,56,'en','name','chapter2.pdf'),(111,56,'','chapterId','29'),(112,57,'en','name','chapter3.pdf'),(113,57,'','chapterId','30'),(114,58,'en','name','chapter1.pdf'),(115,58,'','chapterId','28'),(116,59,'en','name','intro.pdf'),(117,59,'','chapterId','27'),(118,60,'en','name','note.pdf'),(119,61,'en','name','chapter1.pdf'),(120,62,'en','name','chapter2.pdf'),(121,63,'en','name','chapter3.pdf'),(122,64,'en','name','chapter4.pdf'),(123,65,'en','name','chapter5.pdf'),(124,61,'','chapterId','32'),(125,62,'','chapterId','33'),(126,63,'','chapterId','34'),(127,64,'','chapterId','35'),(128,65,'','chapterId','36'),(129,66,'en','name','chapter5.pdf'),(130,66,'','chapterId','36'),(131,67,'en','name','chapter3.pdf'),(132,67,'','chapterId','34'),(133,68,'en','name','chapter4.pdf'),(134,68,'','chapterId','35'),(135,69,'en','name','chapter2.pdf'),(136,69,'','chapterId','33'),(137,70,'en','name','chapter1.pdf'),(138,70,'','chapterId','32'),(139,71,'en','name','intro.pdf'),(140,72,'en','name','chapter1.pdf'),(141,73,'en','name','chapter2.pdf'),(142,74,'en','name','chapter3.pdf'),(143,75,'en','name','chapter4.pdf'),(144,76,'en','name','chapter5.pdf'),(145,77,'en','name','conclusion.pdf'),(146,78,'en','name','bibliography.pdf'),(147,79,'en','name','index.pdf'),(148,71,'','chapterId','37'),(149,72,'','chapterId','38'),(150,73,'','chapterId','39'),(151,74,'','chapterId','40'),(152,75,'','chapterId','41'),(153,76,'','chapterId','42'),(154,77,'','chapterId','43'),(155,78,'','chapterId','44'),(156,79,'','chapterId','45'),(157,80,'en','name','intro.pdf'),(158,81,'en','name','poems.pdf'),(159,80,'','chapterId','46'),(160,81,'','chapterId','47'),(161,82,'en','name','poems.pdf'),(162,82,'','chapterId','47'),(163,83,'en','name','intro.pdf'),(164,83,'','chapterId','46'),(165,84,'en','name','chapter1.pdf'),(166,85,'en','name','chapter2.pdf'),(167,86,'en','name','chapter3.pdf'),(168,84,'','chapterId','48'),(169,85,'','chapterId','49'),(170,86,'','chapterId','50'),(171,87,'en','name','chapter3.pdf'),(172,87,'','chapterId','50'),(173,88,'en','name','chapter2.pdf'),(174,88,'','chapterId','49'),(175,89,'en','name','chapter1.pdf'),(176,89,'','chapterId','48'),(177,90,'en','name','chapter1.pdf'),(178,91,'en','name','chapter2.pdf'),(179,92,'en','name','chapter3.pdf'),(180,90,'','chapterId','51'),(181,91,'','chapterId','52'),(182,92,'','chapterId','53'),(183,93,'en','name','chapter3.pdf'),(184,93,'','chapterId','53'),(185,94,'en','name','chapter2.pdf'),(186,94,'','chapterId','52'),(187,95,'en','name','chapter1.pdf'),(188,95,'','chapterId','51'),(189,96,'en','name','chapter1.pdf'),(190,97,'en','name','chapter2.pdf'),(191,98,'en','name','chapter3.pdf'),(192,99,'en','name','chapter4.pdf'),(193,100,'en','name','Segmentation of Vascular Ultrasound Imag.pdf'),(194,101,'en','name','The Canadian Nutrient File: Nutrient Val.pdf'),(195,96,'','chapterId','54'),(196,97,'','chapterId','55'),(197,98,'','chapterId','56'),(198,99,'','chapterId','57'),(199,102,'en','name','The Canadian Nutrient File: Nutrient Val.pdf'),(200,103,'en','name','Segmentation of Vascular Ultrasound Imag.pdf'),(201,104,'en','name','chapter4.pdf'),(202,104,'','chapterId','57'),(203,105,'en','name','chapter3.pdf'),(204,105,'','chapterId','56'),(205,106,'en','name','chapter2.pdf'),(206,106,'','chapterId','55'),(207,107,'en','name','chapter1.pdf'),(208,107,'','chapterId','54'),(209,108,'en','name','The Canadian Nutrient File: Nutrient Val.pdf'),(210,109,'en','name','Segmentation of Vascular Ultrasound Imag.pdf'),(211,110,'en','name','chapter4.pdf'),(212,110,'','chapterId','57'),(213,111,'en','name','chapter3.pdf'),(214,111,'','chapterId','56'),(215,112,'en','name','chapter2.pdf'),(216,112,'','chapterId','55'),(217,113,'en','name','chapter1.pdf'),(218,113,'','chapterId','54'),(219,114,'en','name','chapter1.pdf'),(220,115,'en','name','chapter2.pdf'),(221,116,'en','name','chapter3.pdf'),(222,114,'','chapterId','58'),(223,115,'','chapterId','59'),(224,116,'','chapterId','60'),(225,117,'en','name','chapter3.pdf'),(226,117,'','chapterId','60'),(227,118,'en','name','chapter2.pdf'),(228,118,'','chapterId','59'),(229,119,'en','name','chapter1.pdf'),(230,119,'','chapterId','58'),(231,120,'en','name','foreward.pdf'),(232,121,'en','name','preface.pdf'),(233,122,'en','name','cases.pdf'),(234,123,'en','name','conclusion.pdf'),(235,124,'en','name','bibliography.pdf'),(236,120,'','chapterId','61'),(237,121,'','chapterId','62'),(238,122,'','chapterId','63'),(239,123,'','chapterId','64'),(240,124,'','chapterId','65'),(241,125,'en','name','bibliography.pdf'),(242,125,'','chapterId','65'),(243,126,'en','name','conclusion.pdf'),(244,126,'','chapterId','64'),(245,127,'en','name','cases.pdf'),(246,127,'','chapterId','63'),(247,128,'en','name','preface.pdf'),(248,128,'','chapterId','62'),(249,129,'en','name','foreward.pdf'),(250,129,'','chapterId','61'),(251,130,'en','name','preface.pdf'),(252,131,'en','name','introduction.pdf'),(253,132,'en','name','chapter1.pdf'),(254,133,'en','name','chapter2.pdf'),(255,134,'en','name','chapter3.pdf'),(256,135,'en','name','chapter4.pdf'),(257,130,'','chapterId','66'),(258,131,'','chapterId','67'),(259,132,'','chapterId','68'),(260,133,'','chapterId','69'),(261,134,'','chapterId','70'),(262,135,'','chapterId','71'),(263,136,'en','name','chapter4.pdf'),(264,136,'','chapterId','71'),(265,137,'en','name','chapter3.pdf'),(266,137,'','chapterId','70'),(267,138,'en','name','chapter2.pdf'),(268,138,'','chapterId','69'),(269,139,'en','name','chapter1.pdf'),(270,139,'','chapterId','68'),(271,140,'en','name','preface.pdf'),(272,140,'','chapterId','66'),(273,141,'en','name','introduction.pdf'),(274,141,'','chapterId','67');
/*!40000 ALTER TABLE `submission_file_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_files`
--

DROP TABLE IF EXISTS `submission_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_files` (
  `submission_file_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  `source_submission_file_id` bigint(20) unsigned DEFAULT NULL,
  `genre_id` bigint(20) DEFAULT NULL,
  `file_stage` bigint(20) NOT NULL,
  `direct_sales_price` varchar(255) DEFAULT NULL,
  `sales_type` varchar(255) DEFAULT NULL,
  `viewable` smallint(6) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `uploader_user_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `doi_id` bigint(20) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='All files associated with a submission, such as those uploaded during submission, as revisions, or by copyeditors or layout editors for production.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (1,1,1,NULL,3,2,NULL,NULL,NULL,'2023-06-04 21:55:41','2023-06-04 21:55:42',19,NULL,NULL,NULL),(2,1,2,NULL,3,2,NULL,NULL,NULL,'2023-06-04 21:55:42','2023-06-04 21:55:43',19,NULL,NULL,NULL),(3,1,3,NULL,3,2,NULL,NULL,NULL,'2023-06-04 21:55:44','2023-06-04 21:55:44',19,NULL,NULL,NULL),(4,1,3,3,3,4,NULL,NULL,NULL,'2023-06-04 21:56:18','2023-06-04 21:56:18',19,523,1,NULL),(5,1,2,2,3,4,NULL,NULL,NULL,'2023-06-04 21:56:18','2023-06-04 21:56:18',19,523,1,NULL),(6,1,1,1,3,4,NULL,NULL,NULL,'2023-06-04 21:56:18','2023-06-04 21:56:18',19,523,1,NULL),(7,2,4,NULL,3,2,NULL,NULL,NULL,'2023-06-04 21:57:12','2023-06-04 21:57:13',20,NULL,NULL,NULL),(8,2,5,NULL,3,2,NULL,NULL,NULL,'2023-06-04 21:57:14','2023-06-04 21:57:14',20,NULL,NULL,NULL),(9,2,6,NULL,3,2,NULL,NULL,NULL,'2023-06-04 21:57:15','2023-06-04 21:57:15',20,NULL,NULL,NULL),(10,2,7,NULL,3,2,NULL,NULL,NULL,'2023-06-04 21:57:16','2023-06-04 21:57:17',20,NULL,NULL,NULL),(12,2,7,10,3,4,NULL,NULL,NULL,'2023-06-04 21:59:45','2023-06-04 21:59:45',20,523,2,NULL),(13,2,6,9,3,4,NULL,NULL,NULL,'2023-06-04 21:59:45','2023-06-04 21:59:45',20,523,2,NULL),(14,2,5,8,3,4,NULL,NULL,NULL,'2023-06-04 21:59:45','2023-06-04 21:59:45',20,523,2,NULL),(15,2,4,7,3,4,NULL,NULL,NULL,'2023-06-04 21:59:45','2023-06-04 21:59:45',20,523,2,NULL),(16,3,9,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:00:26','2023-06-04 22:00:26',21,NULL,NULL,NULL),(17,3,10,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:00:27','2023-06-04 22:00:28',21,NULL,NULL,NULL),(18,3,11,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:00:28','2023-06-04 22:00:29',21,NULL,NULL,NULL),(19,3,12,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:00:30','2023-06-04 22:00:30',21,NULL,NULL,NULL),(20,3,13,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:00:31','2023-06-04 22:00:31',21,NULL,NULL,NULL),(21,4,14,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:01:21','2023-06-04 22:01:21',22,NULL,NULL,NULL),(22,4,15,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:01:22','2023-06-04 22:01:22',22,NULL,NULL,NULL),(23,4,16,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:01:23','2023-06-04 22:01:23',22,NULL,NULL,NULL),(24,4,17,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:01:24','2023-06-04 22:01:25',22,NULL,NULL,NULL),(25,4,16,23,3,19,NULL,NULL,NULL,'2023-06-04 22:02:07','2023-06-04 22:02:07',22,523,3,NULL),(26,4,17,24,3,19,NULL,NULL,NULL,'2023-06-04 22:02:07','2023-06-04 22:02:07',22,523,3,NULL),(27,4,15,22,3,19,NULL,NULL,NULL,'2023-06-04 22:02:07','2023-06-04 22:02:07',22,523,3,NULL),(28,4,14,21,3,19,NULL,NULL,NULL,'2023-06-04 22:02:07','2023-06-04 22:02:07',22,523,3,NULL),(29,5,18,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:03:27','2023-06-04 22:03:27',23,NULL,NULL,NULL),(30,5,19,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:03:28','2023-06-04 22:03:28',23,NULL,NULL,NULL),(31,5,20,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:03:29','2023-06-04 22:03:29',23,NULL,NULL,NULL),(32,5,21,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:03:30','2023-06-04 22:03:31',23,NULL,NULL,NULL),(33,5,22,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:03:31','2023-06-04 22:03:32',23,NULL,NULL,NULL),(34,5,23,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:03:33','2023-06-04 22:03:33',23,NULL,NULL,NULL),(35,5,23,34,3,19,NULL,NULL,NULL,'2023-06-04 22:04:31','2023-06-04 22:04:31',23,523,5,NULL),(36,5,22,33,3,19,NULL,NULL,NULL,'2023-06-04 22:04:32','2023-06-04 22:04:32',23,523,5,NULL),(37,5,21,32,3,19,NULL,NULL,NULL,'2023-06-04 22:04:32','2023-06-04 22:04:32',23,523,5,NULL),(38,5,20,31,3,19,NULL,NULL,NULL,'2023-06-04 22:04:32','2023-06-04 22:04:32',23,523,5,NULL),(39,5,19,30,3,19,NULL,NULL,NULL,'2023-06-04 22:04:32','2023-06-04 22:04:32',23,523,5,NULL),(40,5,18,29,3,19,NULL,NULL,NULL,'2023-06-04 22:04:32','2023-06-04 22:04:32',23,523,5,NULL),(41,5,23,34,3,10,'0','openAccess',1,'2023-06-04 22:05:56','2023-06-04 22:06:07',23,521,2,NULL),(42,6,24,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:06:42','2023-06-04 22:06:42',24,NULL,NULL,NULL),(43,6,25,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:06:43','2023-06-04 22:06:43',24,NULL,NULL,NULL),(44,6,26,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:06:44','2023-06-04 22:06:44',24,NULL,NULL,NULL),(45,6,27,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:06:45','2023-06-04 22:06:46',24,NULL,NULL,NULL),(46,6,27,45,3,19,NULL,NULL,NULL,'2023-06-04 22:07:28','2023-06-04 22:07:28',24,523,7,NULL),(47,6,25,43,3,19,NULL,NULL,NULL,'2023-06-04 22:07:28','2023-06-04 22:07:28',24,523,7,NULL),(48,6,24,42,3,19,NULL,NULL,NULL,'2023-06-04 22:07:28','2023-06-04 22:07:28',24,523,7,NULL),(49,6,26,44,3,19,NULL,NULL,NULL,'2023-06-04 22:07:29','2023-06-04 22:07:29',24,523,7,NULL),(50,7,28,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:08:25','2023-06-04 22:08:26',25,NULL,NULL,NULL),(51,7,29,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:08:26','2023-06-04 22:08:27',25,NULL,NULL,NULL),(52,7,30,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:08:28','2023-06-04 22:08:28',25,NULL,NULL,NULL),(53,7,31,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:08:29','2023-06-04 22:08:29',25,NULL,NULL,NULL),(54,7,32,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:08:30','2023-06-04 22:08:30',25,NULL,NULL,NULL),(55,7,32,54,3,4,NULL,NULL,NULL,'2023-06-04 22:09:23','2023-06-04 22:09:23',25,523,8,NULL),(56,7,30,52,3,4,NULL,NULL,NULL,'2023-06-04 22:09:23','2023-06-04 22:09:23',25,523,8,NULL),(57,7,31,53,3,4,NULL,NULL,NULL,'2023-06-04 22:09:23','2023-06-04 22:09:23',25,523,8,NULL),(58,7,29,51,3,4,NULL,NULL,NULL,'2023-06-04 22:09:24','2023-06-04 22:09:24',25,523,8,NULL),(59,7,28,50,3,4,NULL,NULL,NULL,'2023-06-04 22:09:24','2023-06-04 22:09:24',25,523,8,NULL),(60,8,33,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:10:03','2023-06-04 22:10:04',3,NULL,NULL,NULL),(61,9,34,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:10:16','2023-06-04 22:10:17',26,NULL,NULL,NULL),(62,9,35,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:10:17','2023-06-04 22:10:18',26,NULL,NULL,NULL),(63,9,36,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:10:19','2023-06-04 22:10:19',26,NULL,NULL,NULL),(64,9,37,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:10:20','2023-06-04 22:10:20',26,NULL,NULL,NULL),(65,9,38,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:10:21','2023-06-04 22:10:21',26,NULL,NULL,NULL),(66,9,38,65,3,19,NULL,NULL,NULL,'2023-06-04 22:11:15','2023-06-04 22:11:15',26,523,9,NULL),(67,9,36,63,3,19,NULL,NULL,NULL,'2023-06-04 22:11:15','2023-06-04 22:11:15',26,523,9,NULL),(68,9,37,64,3,19,NULL,NULL,NULL,'2023-06-04 22:11:15','2023-06-04 22:11:15',26,523,9,NULL),(69,9,35,62,3,19,NULL,NULL,NULL,'2023-06-04 22:11:15','2023-06-04 22:11:15',26,523,9,NULL),(70,9,34,61,3,19,NULL,NULL,NULL,'2023-06-04 22:11:15','2023-06-04 22:11:15',26,523,9,NULL),(71,10,39,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:11:33','2023-06-04 22:11:33',27,NULL,NULL,NULL),(72,10,40,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:11:34','2023-06-04 22:11:34',27,NULL,NULL,NULL),(73,10,41,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:11:35','2023-06-04 22:11:36',27,NULL,NULL,NULL),(74,10,42,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:11:36','2023-06-04 22:11:37',27,NULL,NULL,NULL),(75,10,43,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:11:38','2023-06-04 22:11:38',27,NULL,NULL,NULL),(76,10,44,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:11:39','2023-06-04 22:11:39',27,NULL,NULL,NULL),(77,10,45,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:11:40','2023-06-04 22:11:40',27,NULL,NULL,NULL),(78,10,46,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:11:41','2023-06-04 22:11:42',27,NULL,NULL,NULL),(79,10,47,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:11:43','2023-06-04 22:11:43',27,NULL,NULL,NULL),(80,11,48,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:13:08','2023-06-04 22:13:09',28,NULL,NULL,NULL),(81,11,49,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:13:09','2023-06-04 22:13:10',28,NULL,NULL,NULL),(82,11,49,81,3,19,NULL,NULL,NULL,'2023-06-04 22:13:36','2023-06-04 22:13:36',28,523,10,NULL),(83,11,48,80,3,19,NULL,NULL,NULL,'2023-06-04 22:13:36','2023-06-04 22:13:36',28,523,10,NULL),(84,12,50,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:15:08','2023-06-04 22:15:08',29,NULL,NULL,NULL),(85,12,51,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:15:09','2023-06-04 22:15:09',29,NULL,NULL,NULL),(86,12,52,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:15:10','2023-06-04 22:15:10',29,NULL,NULL,NULL),(87,12,52,86,3,19,NULL,NULL,NULL,'2023-06-04 22:15:48','2023-06-04 22:15:48',29,523,12,NULL),(88,12,51,85,3,19,NULL,NULL,NULL,'2023-06-04 22:15:48','2023-06-04 22:15:48',29,523,12,NULL),(89,12,50,84,3,19,NULL,NULL,NULL,'2023-06-04 22:15:48','2023-06-04 22:15:48',29,523,12,NULL),(90,13,53,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:16:39','2023-06-04 22:16:39',30,NULL,NULL,NULL),(91,13,54,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:16:40','2023-06-04 22:16:40',30,NULL,NULL,NULL),(92,13,55,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:16:41','2023-06-04 22:16:41',30,NULL,NULL,NULL),(93,13,55,92,3,19,NULL,NULL,NULL,'2023-06-04 22:17:17','2023-06-04 22:17:17',30,523,13,NULL),(94,13,54,91,3,19,NULL,NULL,NULL,'2023-06-04 22:17:17','2023-06-04 22:17:17',30,523,13,NULL),(95,13,53,90,3,19,NULL,NULL,NULL,'2023-06-04 22:17:17','2023-06-04 22:17:17',30,523,13,NULL),(96,14,56,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:19:03','2023-06-04 22:19:03',31,NULL,NULL,NULL),(97,14,57,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:19:04','2023-06-04 22:19:05',31,NULL,NULL,NULL),(98,14,58,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:19:05','2023-06-04 22:19:06',31,NULL,NULL,NULL),(99,14,59,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:19:06','2023-06-04 22:19:07',31,NULL,NULL,NULL),(100,14,60,NULL,13,2,NULL,NULL,NULL,'2023-06-04 22:19:08','2023-06-04 22:19:08',31,NULL,NULL,NULL),(101,14,61,NULL,9,2,NULL,NULL,NULL,'2023-06-04 22:19:09','2023-06-04 22:19:10',31,NULL,NULL,NULL),(102,14,61,101,9,19,NULL,NULL,NULL,'2023-06-04 22:19:55','2023-06-04 22:19:55',31,523,15,NULL),(103,14,60,100,13,19,NULL,NULL,NULL,'2023-06-04 22:19:55','2023-06-04 22:19:55',31,523,15,NULL),(104,14,59,99,3,19,NULL,NULL,NULL,'2023-06-04 22:19:55','2023-06-04 22:19:55',31,523,15,NULL),(105,14,58,98,3,19,NULL,NULL,NULL,'2023-06-04 22:19:56','2023-06-04 22:19:56',31,523,15,NULL),(106,14,57,97,3,19,NULL,NULL,NULL,'2023-06-04 22:19:56','2023-06-04 22:19:56',31,523,15,NULL),(107,14,56,96,3,19,NULL,NULL,NULL,'2023-06-04 22:19:56','2023-06-04 22:19:56',31,523,15,NULL),(108,14,61,101,9,10,'0','openAccess',1,'2023-06-04 22:21:17','2023-06-04 22:21:55',31,521,3,NULL),(109,14,60,100,13,10,'0','openAccess',1,'2023-06-04 22:21:17','2023-06-04 22:21:50',31,521,3,NULL),(110,14,59,99,3,10,'0','openAccess',1,'2023-06-04 22:21:17','2023-06-04 22:21:43',31,521,3,NULL),(111,14,58,98,3,10,'0','openAccess',1,'2023-06-04 22:21:17','2023-06-04 22:21:38',31,521,3,NULL),(112,14,57,97,3,10,'0','openAccess',1,'2023-06-04 22:21:17','2023-06-04 22:21:33',31,521,3,NULL),(113,14,56,96,3,10,'0','openAccess',1,'2023-06-04 22:21:17','2023-06-04 22:21:27',31,521,3,NULL),(114,15,62,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:22:13','2023-06-04 22:22:13',32,NULL,NULL,NULL),(115,15,63,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:22:14','2023-06-04 22:22:14',32,NULL,NULL,NULL),(116,15,64,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:22:15','2023-06-04 22:22:15',32,NULL,NULL,NULL),(117,15,64,116,3,4,NULL,NULL,NULL,'2023-06-04 22:22:50','2023-06-04 22:22:50',32,523,17,NULL),(118,15,63,115,3,4,NULL,NULL,NULL,'2023-06-04 22:22:50','2023-06-04 22:22:50',32,523,17,NULL),(119,15,62,114,3,4,NULL,NULL,NULL,'2023-06-04 22:22:50','2023-06-04 22:22:50',32,523,17,NULL),(120,16,65,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:23:07','2023-06-04 22:23:08',33,NULL,NULL,NULL),(121,16,66,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:23:08','2023-06-04 22:23:09',33,NULL,NULL,NULL),(122,16,67,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:23:09','2023-06-04 22:23:10',33,NULL,NULL,NULL),(123,16,68,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:23:11','2023-06-04 22:23:11',33,NULL,NULL,NULL),(124,16,69,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:23:12','2023-06-04 22:23:12',33,NULL,NULL,NULL),(125,16,69,124,3,4,NULL,NULL,NULL,'2023-06-04 22:24:03','2023-06-04 22:24:03',33,523,18,NULL),(126,16,68,123,3,4,NULL,NULL,NULL,'2023-06-04 22:24:03','2023-06-04 22:24:03',33,523,18,NULL),(127,16,67,122,3,4,NULL,NULL,NULL,'2023-06-04 22:24:04','2023-06-04 22:24:04',33,523,18,NULL),(128,16,66,121,3,4,NULL,NULL,NULL,'2023-06-04 22:24:04','2023-06-04 22:24:04',33,523,18,NULL),(129,16,65,120,3,4,NULL,NULL,NULL,'2023-06-04 22:24:04','2023-06-04 22:24:04',33,523,18,NULL),(130,17,70,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:24:57','2023-06-04 22:24:58',34,NULL,NULL,NULL),(131,17,71,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:24:58','2023-06-04 22:24:59',34,NULL,NULL,NULL),(132,17,72,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:25:00','2023-06-04 22:25:00',34,NULL,NULL,NULL),(133,17,73,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:25:01','2023-06-04 22:25:01',34,NULL,NULL,NULL),(134,17,74,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:25:02','2023-06-04 22:25:02',34,NULL,NULL,NULL),(135,17,75,NULL,3,2,NULL,NULL,NULL,'2023-06-04 22:25:03','2023-06-04 22:25:04',34,NULL,NULL,NULL),(136,17,75,135,3,19,NULL,NULL,NULL,'2023-06-04 22:26:13','2023-06-04 22:26:13',34,523,19,NULL),(137,17,74,134,3,19,NULL,NULL,NULL,'2023-06-04 22:26:13','2023-06-04 22:26:13',34,523,19,NULL),(138,17,73,133,3,19,NULL,NULL,NULL,'2023-06-04 22:26:13','2023-06-04 22:26:13',34,523,19,NULL),(139,17,72,132,3,19,NULL,NULL,NULL,'2023-06-04 22:26:13','2023-06-04 22:26:13',34,523,19,NULL),(140,17,70,130,3,19,NULL,NULL,NULL,'2023-06-04 22:26:13','2023-06-04 22:26:13',34,523,19,NULL),(141,17,71,131,3,19,NULL,NULL,NULL,'2023-06-04 22:26:13','2023-06-04 22:26:13',34,523,19,NULL);
/*!40000 ALTER TABLE `submission_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_keyword_list`
--

DROP TABLE IF EXISTS `submission_search_keyword_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_search_keyword_list` (
  `keyword_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `keyword_text` varchar(60) NOT NULL,
  PRIMARY KEY (`keyword_id`),
  UNIQUE KEY `submission_search_keyword_text` (`keyword_text`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A list of all keywords used in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES (83,'acting'),(108,'affect'),(104,'agents'),(102,'agent’s'),(55,'alberta'),(2,'allan'),(10,'american'),(20,'americans'),(17,'anti-american'),(36,'anti-canadianism'),(58,'athabasca'),(96,'behaviour'),(32,'bilateral'),(6,'bomb'),(42,'book'),(15,'border'),(62,'brains'),(56,'brian'),(61,'bricks'),(60,'calgary'),(5,'california'),(7,'canada'),(47,'canadian'),(105,'capable'),(1,'chantal'),(76,'characteristics'),(78,'classical'),(64,'cognitive'),(49,'communication'),(45,'complex'),(25,'confederation'),(72,'construction'),(16,'continent'),(89,'control'),(50,'cultural'),(54,'dawson'),(90,'development'),(75,'discussing'),(77,'distinguish'),(87,'distributed'),(19,'documented'),(57,'dupuis'),(27,'election'),(63,'embodied'),(85,'embodiment'),(81,'emphasis'),(103,'environment'),(30,'events'),(23,'examines'),(28,'examining'),(98,'examples'),(106,'exhibiting'),(86,'exploration'),(95,'exploring'),(70,'foundational'),(41,'hilarious'),(35,'history'),(71,'ideas'),(99,'illustrate'),(69,'illustrates'),(84,'importance'),(37,'informative'),(52,'international'),(68,'introduces'),(100,'key'),(44,'layer'),(66,'lego'),(29,'major'),(11,'media'),(53,'michael'),(74,'mindstorms'),(14,'nations'),(22,'neighbour'),(21,'northern'),(88,'notions'),(97,'numerous'),(26,'obama’s'),(73,'observation'),(79,'places'),(51,'political'),(24,'portrayed'),(39,'provoking'),(110,'psychology'),(33,'relations'),(46,'relationship'),(9,'remarks'),(80,'renewed'),(43,'reveals'),(67,'robots'),(65,'science'),(107,'sense'),(82,'sensing'),(18,'sentiment'),(93,'simple'),(4,'southern'),(13,'states'),(48,'studies'),(92,'synthesizing'),(94,'systems'),(31,'tested'),(101,'theme'),(91,'theories'),(38,'thought'),(40,'times'),(34,'tracks'),(12,'united'),(3,'university'),(8,'unkind'),(59,'wilson'),(109,'world');
/*!40000 ALTER TABLE `submission_search_keyword_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_object_keywords`
--

DROP TABLE IF EXISTS `submission_search_object_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_search_object_keywords` (
  `submission_search_object_keyword_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) NOT NULL,
  `keyword_id` bigint(20) NOT NULL,
  `pos` int(11) NOT NULL COMMENT 'Word position of the keyword in the object.',
  PRIMARY KEY (`submission_search_object_keyword_id`),
  UNIQUE KEY `submission_search_object_keywords_unique` (`object_id`,`pos`),
  KEY `submission_search_object_keywords_object_id` (`object_id`),
  KEY `submission_search_object_keywords_keyword_id` (`keyword_id`),
  CONSTRAINT `submission_search_object_keywords_keyword_id` FOREIGN KEY (`keyword_id`) REFERENCES `submission_search_keyword_list` (`keyword_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_search_object_keywords_object_id_foreign` FOREIGN KEY (`object_id`) REFERENCES `submission_search_objects` (`object_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Relationships between search objects and keywords in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_object_keywords`
--

LOCK TABLES `submission_search_object_keywords` WRITE;
/*!40000 ALTER TABLE `submission_search_object_keywords` DISABLE KEYS */;
INSERT INTO `submission_search_object_keywords` VALUES (66,9,1,0),(67,9,2,1),(68,9,3,2),(69,9,4,3),(70,9,5,4),(71,10,6,0),(72,10,7,1),(73,10,8,2),(74,10,9,3),(75,10,10,4),(76,10,11,5),(77,11,7,0),(78,11,12,1),(79,11,13,2),(80,11,14,3),(81,11,15,4),(82,11,16,5),(83,11,17,6),(84,11,18,7),(85,11,7,8),(86,11,19,9),(87,11,20,10),(88,11,21,11),(89,11,22,12),(90,11,2,13),(91,11,23,14),(92,11,10,15),(93,11,11,16),(94,11,24,17),(95,11,7,18),(96,11,25,19),(97,11,26,20),(98,11,27,21),(99,11,28,22),(100,11,29,23),(101,11,30,24),(102,11,31,25),(103,11,32,26),(104,11,33,27),(105,11,6,28),(106,11,7,29),(107,11,34,30),(108,11,35,31),(109,11,36,32),(110,11,37,33),(111,11,38,34),(112,11,39,35),(113,11,40,36),(114,11,41,37),(115,11,42,38),(116,11,43,39),(117,11,44,40),(118,11,45,41),(119,11,46,42),(120,11,7,43),(121,11,12,44),(122,11,13,45),(123,13,47,0),(124,13,48,1),(125,13,49,2),(126,13,50,3),(127,13,48,4),(128,13,51,5),(129,13,52,6),(130,13,48,7),(131,17,53,0),(132,17,54,1),(133,17,3,2),(134,17,55,3),(135,17,56,4),(136,17,57,5),(137,17,58,6),(138,17,3,7),(139,17,53,8),(140,17,59,9),(141,17,3,10),(142,17,60,11),(143,18,61,0),(144,18,62,1),(145,18,63,2),(146,18,64,3),(147,18,65,4),(148,18,66,5),(149,18,67,6),(150,19,61,0),(151,19,62,1),(152,19,68,2),(153,19,63,3),(154,19,64,4),(155,19,65,5),(156,19,69,6),(157,19,70,7),(158,19,71,8),(159,19,72,9),(160,19,73,10),(161,19,66,11),(162,19,74,12),(163,19,67,13),(164,19,75,14),(165,19,76,15),(166,19,77,16),(167,19,63,17),(168,19,64,18),(169,19,65,19),(170,19,78,20),(171,19,64,21),(172,19,65,22),(173,19,61,23),(174,19,62,24),(175,19,79,25),(176,19,80,26),(177,19,81,27),(178,19,82,28),(179,19,83,29),(180,19,84,30),(181,19,85,31),(182,19,86,32),(183,19,87,33),(184,19,88,34),(185,19,89,35),(186,19,90,36),(187,19,91,37),(188,19,92,38),(189,19,93,39),(190,19,94,40),(191,19,95,41),(192,19,96,42),(193,19,97,43),(194,19,98,44),(195,19,99,45),(196,19,100,46),(197,19,101,47),(198,19,84,48),(199,19,102,49),(200,19,103,50),(201,19,93,51),(202,19,104,52),(203,19,66,53),(204,19,67,54),(205,19,105,55),(206,19,106,56),(207,19,45,57),(208,19,96,58),(209,19,107,59),(210,19,108,60),(211,19,109,61),(212,21,110,0);
/*!40000 ALTER TABLE `submission_search_object_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_objects`
--

DROP TABLE IF EXISTS `submission_search_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_search_objects` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL COMMENT 'Type of item. E.g., abstract, fulltext, etc.',
  `assoc_id` bigint(20) DEFAULT NULL COMMENT 'Optional ID of an associated record (e.g., a file_id)',
  PRIMARY KEY (`object_id`),
  KEY `submission_search_objects_submission_id` (`submission_id`),
  CONSTRAINT `submission_search_object_submission` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A list of all search objects indexed in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_objects`
--

LOCK TABLES `submission_search_objects` WRITE;
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
INSERT INTO `submission_search_objects` VALUES (9,5,1,0),(10,5,2,0),(11,5,4,0),(12,5,16,0),(13,5,17,0),(14,5,8,0),(15,5,32,0),(16,5,64,0),(17,14,1,0),(18,14,2,0),(19,14,4,0),(20,14,16,0),(21,14,17,0),(22,14,8,0),(23,14,32,0),(24,14,64,0);
/*!40000 ALTER TABLE `submission_search_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_settings`
--

DROP TABLE IF EXISTS `submission_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_settings` (
  `submission_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`submission_setting_id`),
  UNIQUE KEY `submission_settings_unique` (`submission_id`,`locale`,`setting_name`),
  KEY `submission_settings_submission_id` (`submission_id`),
  CONSTRAINT `submission_settings_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Localized data about submissions';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissions` (
  `submission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `current_publication_id` bigint(20) DEFAULT NULL,
  `date_last_activity` datetime DEFAULT NULL,
  `date_submitted` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `stage_id` bigint(20) NOT NULL DEFAULT 1,
  `locale` varchar(14) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `submission_progress` varchar(50) NOT NULL DEFAULT 'start',
  `work_type` smallint(6) DEFAULT 0,
  PRIMARY KEY (`submission_id`),
  KEY `submissions_context_id` (`context_id`),
  KEY `submissions_publication_id` (`current_publication_id`),
  CONSTRAINT `submissions_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `submissions_publication_id` FOREIGN KEY (`current_publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='All submissions submitted to the context, including incomplete, declined and unpublished submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,1,1,'2023-06-04 21:56:45','2023-06-04 21:56:03','2023-06-04 21:56:03',4,'en',1,'',0),(2,1,2,'2023-06-04 22:00:09','2023-06-04 21:59:12','2023-06-04 21:59:12',3,'en',1,'',1),(3,1,3,'2023-06-04 22:01:07','2023-06-04 22:01:07','2023-06-04 22:01:07',1,'en',1,'',0),(4,1,4,'2023-06-04 22:03:14','2023-06-04 22:01:52','2023-06-04 22:01:52',5,'en',1,'',0),(5,1,5,'2023-06-04 22:06:29','2023-06-04 22:04:14','2023-06-04 22:04:14',5,'en',3,'',0),(6,1,6,'2023-06-04 22:07:59','2023-06-04 22:07:13','2023-06-04 22:07:13',2,'en',1,'',0),(7,1,7,'2023-06-04 22:09:50','2023-06-04 22:09:07','2023-06-04 22:09:07',4,'en',1,'',0),(8,1,8,'2023-06-04 22:10:05','2023-06-04 22:10:04','2023-06-04 22:10:04',1,'en',1,'',0),(9,1,9,'2023-06-04 22:11:16','2023-06-04 22:10:57','2023-06-04 22:10:57',2,'en',1,'',0),(10,1,10,'2023-06-04 22:12:55','2023-06-04 22:12:54','2023-06-04 22:12:54',1,'en',1,'',0),(11,1,11,'2023-06-04 22:14:50','2023-06-04 22:13:22','2023-06-04 22:13:22',4,'en',1,'',0),(12,1,12,'2023-06-04 22:16:26','2023-06-04 22:15:32','2023-06-04 22:15:32',2,'en',1,'',0),(13,1,13,'2023-06-04 22:18:45','2023-06-04 22:17:02','2023-06-04 22:17:02',4,'en',1,'',0),(14,1,14,'2023-06-04 22:21:58','2023-06-04 22:19:38','2023-06-04 22:19:38',5,'en',3,'',0),(15,1,15,'2023-06-04 22:22:50','2023-06-04 22:22:34','2023-06-04 22:22:34',3,'en',1,'',0),(16,1,16,'2023-06-04 22:24:44','2023-06-04 22:23:46','2023-06-04 22:23:46',3,'en',1,'',0),(17,1,17,'2023-06-04 22:26:33','2023-06-04 22:25:52','2023-06-04 22:25:52',2,'en',1,'',0);
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporary_files`
--

DROP TABLE IF EXISTS `temporary_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporary_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `temporary_files_user_id` (`user_id`),
  CONSTRAINT `temporary_files_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Temporary files, e.g. where files are kept during an upload process before they are moved somewhere more appropriate.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usage_stats_institution_temporary_records` (
  `usage_stats_temp_institution_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(255) NOT NULL,
  `line_number` bigint(20) NOT NULL,
  `institution_id` bigint(20) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_institution_id`),
  UNIQUE KEY `usi_load_id_line_number_institution_id` (`load_id`,`line_number`,`institution_id`),
  KEY `usi_institution_id` (`institution_id`),
  CONSTRAINT `usi_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Temporary stats by institution. Data in this table is provisional. See the metrics_* tables for compiled stats.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usage_stats_total_temporary_records` (
  `usage_stats_temp_total_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint(20) NOT NULL,
  `canonical_url` varchar(255) NOT NULL,
  `series_id` bigint(20) DEFAULT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `chapter_id` bigint(20) DEFAULT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `submission_file_id` bigint(20) unsigned DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `file_type` smallint(6) DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(255) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_total_id`),
  KEY `ust_series_id` (`series_id`),
  KEY `ust_context_id` (`context_id`),
  KEY `ust_submission_id` (`submission_id`),
  KEY `ust_chapter_id` (`chapter_id`),
  KEY `ust_representation_id` (`representation_id`),
  KEY `ust_submission_file_id` (`submission_file_id`),
  CONSTRAINT `ust_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_series_id_foreign` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Temporary stats totals based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usage_stats_unique_item_investigations_temporary_records` (
  `usage_stats_temp_unique_item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `chapter_id` bigint(20) DEFAULT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `submission_file_id` bigint(20) unsigned DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `file_type` smallint(6) DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(255) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_unique_item_id`),
  KEY `usii_context_id` (`context_id`),
  KEY `usii_submission_id` (`submission_id`),
  KEY `usii_chapter_id` (`chapter_id`),
  KEY `usii_representation_id` (`representation_id`),
  KEY `usii_submission_file_id` (`submission_file_id`),
  CONSTRAINT `usii_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Temporary stats on unique downloads based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usage_stats_unique_item_requests_temporary_records` (
  `usage_stats_temp_item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `chapter_id` bigint(20) DEFAULT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `submission_file_id` bigint(20) unsigned DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `file_type` smallint(6) DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(255) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_item_id`),
  KEY `usir_context_id` (`context_id`),
  KEY `usir_submission_id` (`submission_id`),
  KEY `usir_chapter_id` (`chapter_id`),
  KEY `usir_representation_id` (`representation_id`),
  KEY `usir_submission_file_id` (`submission_file_id`),
  CONSTRAINT `usir_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Temporary stats on unique views based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usage_stats_unique_title_investigations_temporary_records` (
  `usage_stats_temp_unique_investigations_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `chapter_id` bigint(20) DEFAULT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `submission_file_id` bigint(20) unsigned DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `file_type` smallint(6) DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(255) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_unique_investigations_id`),
  KEY `usti_context_id` (`context_id`),
  KEY `usti_submission_id` (`submission_id`),
  KEY `usti_chapter_id` (`chapter_id`),
  KEY `usti_representation_id` (`representation_id`),
  KEY `usti_submission_file_id` (`submission_file_id`),
  CONSTRAINT `usti_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE,
  CONSTRAINT `usti_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `usti_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE,
  CONSTRAINT `usti_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `usti_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Temporary stats for views and downloads from institutions based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usage_stats_unique_title_requests_temporary_records` (
  `usage_stats_temp_unique_requests_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `chapter_id` bigint(20) DEFAULT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `submission_file_id` bigint(20) unsigned DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `file_type` smallint(6) DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(255) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_unique_requests_id`),
  KEY `ustr_context_id` (`context_id`),
  KEY `ustr_submission_id` (`submission_id`),
  KEY `ustr_chapter_id` (`chapter_id`),
  KEY `ustr_representation_id` (`representation_id`),
  KEY `ustr_submission_file_id` (`submission_file_id`),
  CONSTRAINT `ustr_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE,
  CONSTRAINT `ustr_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `ustr_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE,
  CONSTRAINT `ustr_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `ustr_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Temporary stats for unique title requests. Data in this table is provisional. See the metrics_* tables for compiled stats.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_settings` (
  `user_group_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_group_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`user_group_setting_id`),
  UNIQUE KEY `user_group_settings_unique` (`user_group_id`,`locale`,`setting_name`),
  KEY `user_group_settings_user_group_id` (`user_group_id`),
  CONSTRAINT `user_group_settings_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about user groups, including localized properties such as the name.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_stage` (
  `user_group_stage_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_group_stage_id`),
  UNIQUE KEY `user_group_stage_unique` (`context_id`,`user_group_id`,`stage_id`),
  KEY `user_group_stage_context_id` (`context_id`),
  KEY `user_group_stage_user_group_id` (`user_group_id`),
  KEY `user_group_stage_stage_id` (`stage_id`),
  CONSTRAINT `user_group_stage_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `user_group_stage_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Which stages of the editorial workflow the user_groups can access.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `user_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `is_default` smallint(6) NOT NULL DEFAULT 0,
  `show_title` smallint(6) NOT NULL DEFAULT 1,
  `permit_self_registration` smallint(6) NOT NULL DEFAULT 0,
  `permit_metadata_edit` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_group_id`),
  KEY `user_groups_user_group_id` (`user_group_id`),
  KEY `user_groups_context_id` (`context_id`),
  KEY `user_groups_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='All defined user roles in a context, such as Author, Reviewer, Section Editor and Journal Manager.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_interests` (
  `user_interest_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_interest_id`),
  UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`),
  KEY `user_interests_user_id` (`user_id`),
  KEY `user_interests_controlled_vocab_entry_id` (`controlled_vocab_entry_id`),
  CONSTRAINT `user_interests_controlled_vocab_entry_id_foreign` FOREIGN KEY (`controlled_vocab_entry_id`) REFERENCES `controlled_vocab_entries` (`controlled_vocab_entry_id`) ON DELETE CASCADE,
  CONSTRAINT `user_interests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Associates users with user interests (which are stored in the controlled vocabulary tables).';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_settings` (
  `user_setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`user_setting_id`),
  UNIQUE KEY `user_settings_unique` (`user_id`,`locale`,`setting_name`),
  KEY `user_settings_user_id` (`user_id`),
  KEY `user_settings_locale_setting_name_index` (`setting_name`,`locale`),
  CONSTRAINT `user_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='More data about users, including localized properties like their name and affiliation.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user_groups` (
  `user_user_group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_user_group_id`),
  UNIQUE KEY `user_user_groups_unique` (`user_group_id`,`user_id`),
  KEY `user_user_groups_user_group_id` (`user_group_id`),
  KEY `user_user_groups_user_id` (`user_id`),
  CONSTRAINT `user_user_groups_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `user_user_groups_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Maps users to their assigned user_groups.';
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `locales` varchar(255) NOT NULL DEFAULT '[]',
  `gossip` text DEFAULT NULL,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime DEFAULT NULL,
  `must_change_password` smallint(6) DEFAULT NULL,
  `auth_id` bigint(20) DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` smallint(6) NOT NULL DEFAULT 0,
  `disabled_reason` text DEFAULT NULL,
  `inline_help` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_username` (`username`),
  UNIQUE KEY `users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='All registered users, including authentication data and profile data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2y$10$5cHhGWxc9rbfLzxxkGuj5.gpq770gajv2svGRoqp9WSM4Kbnj7AZe','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,'[]',NULL,NULL,'2023-06-04 21:50:04',NULL,'2023-06-04 21:55:08',NULL,NULL,NULL,0,NULL,1),(2,'rvaca','$2y$10$iVp/MP0ZhyTPWRxQcbZMVO609X4KjXjR7vUZCJtZQJCbBU8jJKh7u','rvaca@mailinator.com','','','',NULL,'MX','[]',NULL,NULL,'2023-06-04 21:51:53',NULL,'2023-06-04 21:54:34',0,NULL,NULL,0,NULL,1),(3,'dbarnes','$2y$10$XpWqqE4xDUnmRGSZquShZ.tHd91C./2YYC/sI/F1xXFwp.1y24zXq','dbarnes@mailinator.com','','','',NULL,'AU','[]',NULL,NULL,'2023-06-04 21:51:59',NULL,'2023-06-04 22:25:54',0,NULL,NULL,0,NULL,1),(4,'dbuskins','$2y$10$hE4GAcJFOTkMv4hHJo2z9OZR5xB/xCjpElou8hPISZCuhpzOqHQmy','dbuskins@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2023-06-04 21:52:06',NULL,NULL,0,NULL,NULL,0,NULL,1),(5,'sberardo','$2y$10$a1lHcHsqnrZZJQo9BVcXve.LA5S9XREREKAqPkB00oj1srrfczgSq','sberardo@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2023-06-04 21:52:13',NULL,NULL,0,NULL,NULL,0,NULL,1),(6,'minoue','$2y$10$o13YwIZB8ruIA5SH3Mmdw.8sdRC84eC5BsDhp/Ykg5kEPFDevq2.2','minoue@mailinator.com','','','',NULL,'JP','[]',NULL,NULL,'2023-06-04 21:52:20',NULL,'2023-06-04 22:07:46',0,NULL,NULL,0,NULL,1),(7,'jjanssen','$2y$10$1AYiOg1h1cFZYdKcXmKdsu0gUGPMr6c8Jx91KhCpsihSNEYQ9pKPW','jjanssen@mailinator.com','','','',NULL,'NL','[]',NULL,NULL,'2023-06-04 21:52:28',NULL,NULL,0,NULL,NULL,0,NULL,1),(8,'phudson','$2y$10$CiAbiNO0Bm.lKpBpFl5TsuH1YzM.zwpVFBsOz8QNmGoh09eXyZ.Je','phudson@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2023-06-04 21:52:35',NULL,'2023-06-04 22:16:15',0,NULL,NULL,0,NULL,1),(9,'amccrae','$2y$10$8MTJbcNi0DF9CPbB4EonD.O80dxUTIH.BbSHx4ntBPZdZs3/tJmLu','amccrae@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2023-06-04 21:52:44',NULL,NULL,0,NULL,NULL,0,NULL,1),(10,'agallego','$2y$10$BamDHKxIW4sxOfL98InvvOjGwNd0PCKasNAEhMiy2AoZ95jd6pV4u','agallego@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2023-06-04 21:52:53',NULL,'2023-06-04 22:24:32',0,NULL,NULL,0,NULL,1),(11,'alzacharia','$2y$10$tWbsulHvRany1C5ro9OwAe6FbZRKHYI8fW2mkePODtqcP7IRiG20y','alzacharia@mailinator.com','','','',NULL,'GH','[]',NULL,NULL,'2023-06-04 21:53:02',NULL,NULL,0,NULL,NULL,0,NULL,1),(12,'gfavio','$2y$10$UYssFS2i7SSMRe0mAQeFGObb1fQ6Ec1Wfgkvz2yEM22/GTxWtUQcO','gfavio@mailinator.com','','','',NULL,'ES','[]',NULL,NULL,'2023-06-04 21:53:12',NULL,'2023-06-04 22:18:13',0,NULL,NULL,0,NULL,1),(13,'mfritz','$2y$10$UyRbovIqqynxSJUnKSTtfuX05VPFXnO6dsGWxv9XRKSTs8EwKYaZK','mfritz@mailinator.com','','','',NULL,'BE','[]',NULL,NULL,'2023-06-04 21:53:22',NULL,NULL,0,NULL,NULL,0,NULL,1),(14,'svogt','$2y$10$N6IhJwWGkoAbx5WBcXl.8OcTkFSGSMXkwYDm0VF2KEF2kFYYPPF9O','svogt@mailinator.com','','','',NULL,'CL','[]',NULL,NULL,'2023-06-04 21:53:32',NULL,NULL,0,NULL,NULL,0,NULL,1),(15,'gcox','$2y$10$gfBjKUPudcR0nRNo00sQ5O3oFSSJCUqmGmqbqmFwkj009r53pUrf.','gcox@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2023-06-04 21:53:43',NULL,NULL,0,NULL,NULL,0,NULL,1),(16,'shellier','$2y$10$QR.ceRo2gPpAuNgEHg/rEuUwuOlcDzueKdzrScrWbtzMqKxF3N4P.','shellier@mailinator.com','','','',NULL,'ZA','[]',NULL,NULL,'2023-06-04 21:53:55',NULL,NULL,0,NULL,NULL,0,NULL,1),(17,'cturner','$2y$10$RrJO3x8q586pmFLPPQlsH.wEV3tHTDDdW3PlfPpybGMwq8gqpnEOG','cturner@mailinator.com','','','',NULL,'GB','[]',NULL,NULL,'2023-06-04 21:54:07',NULL,NULL,0,NULL,NULL,0,NULL,1),(18,'skumar','$2y$10$JEgOYJcNiRES2sbnr10heOyecjJ7KGfBMg9/y0j5LBdJhzkGjy/6a','skumar@mailinator.com','','','',NULL,'SG','[]',NULL,NULL,'2023-06-04 21:54:19',NULL,NULL,0,NULL,NULL,0,NULL,1),(19,'aclark','$2y$10$ioq5BxgcVx4AVP5Hq/uDleOKHARvfT9ZALyZYrmeGSYlSwvNIFOni','aclark@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-06-04 21:55:34',NULL,'2023-06-04 21:55:34',NULL,NULL,NULL,0,NULL,1),(20,'afinkel','$2y$10$flswT9d.0HV32up2p5Tn.uEjzi2huch.xlgEDn6yCWJvsz4O0HNcS','afinkel@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-06-04 21:56:53',NULL,'2023-06-04 21:56:53',NULL,NULL,NULL,0,NULL,1),(21,'bbarnetson','$2y$10$i.bebOw5xY2Eh/VAKzJSF.P7fGJJZFKvwuFfNLFEBwbIaFrLdso0a','bbarnetson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-06-04 22:00:19',NULL,'2023-06-04 22:00:19',NULL,NULL,NULL,0,NULL,1),(22,'bbeaty','$2y$10$lNlaXYDgN1Ztu1Q2HslSUOcqHYxut2WnbXfXx2fjwzMp6l9tcuubi','bbeaty@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-06-04 22:01:14',NULL,'2023-06-04 22:01:14',NULL,NULL,NULL,0,NULL,1),(23,'callan','$2y$10$6IO3QUIxih3DRJhzy3GeaumJa9Xy9YCQLac.XkQxTcXPvjDWs2yYC','callan@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-06-04 22:03:20',NULL,'2023-06-04 22:03:20',NULL,NULL,NULL,0,NULL,1),(24,'dbernnard','$2y$10$gQ5Ct4smVZG1g6N0BKyuG.u5wppdctE7f0fbSmJPsyF7kPZTsxfxO','dbernnard@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2023-06-04 22:06:35',NULL,'2023-06-04 22:06:36',NULL,NULL,NULL,0,NULL,1),(25,'dkennepohl','$2y$10$9GhapUHIVgheluUpXdidTO97HRsm3IMbSCuP3E8NzSfiWY68go6ka','dkennepohl@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-06-04 22:08:19',NULL,'2023-06-04 22:08:19',NULL,NULL,NULL,0,NULL,1),(26,'fperini','$2y$10$lgGoYSeRSrZhhS2QxwQGWudUnhn5H5BNypEjcPPIbsaM/ASl4JR.C','fperini@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-06-04 22:10:10',NULL,'2023-06-04 22:10:10',NULL,NULL,NULL,0,NULL,1),(27,'jbrower','$2y$10$xYyozpGYDKHBkwK3HXC10upVuzfUY3TcGcmUc48mleI86wQ49ussu','jbrower@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-06-04 22:11:27',NULL,'2023-06-04 22:11:27',NULL,NULL,NULL,0,NULL,1),(28,'jlockehart','$2y$10$fpGCu6kDBTjhuKekBrAmU.PVKS3WQ0RiE6B6dKwzU1W6F0pG9j9uW','jlockehart@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-06-04 22:13:02',NULL,'2023-06-04 22:13:02',NULL,NULL,NULL,0,NULL,1),(29,'lelder','$2y$10$EfwhWsGBaz9l5w17bLOGzutjx8XFy4A.Y6DzZ8QtelknwXtzPSSK.','lelder@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-06-04 22:15:01',NULL,'2023-06-04 22:15:01',NULL,NULL,NULL,0,NULL,1),(30,'mally','$2y$10$dASfEmWgBSBZwLg4X145suUKJLrVEGC3KlqFslggacMDIh.es2WY6','mally@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-06-04 22:16:32',NULL,'2023-06-04 22:16:32',NULL,NULL,NULL,0,NULL,1),(31,'mdawson','$2y$10$7Cwc6j5mbuOH/EvuYXDOFOHGk03jhQNMcwv5bPntGQFAVUbaLrbha','mdawson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-06-04 22:18:57',NULL,'2023-06-04 22:18:57',NULL,NULL,NULL,0,NULL,1),(32,'mforan','$2y$10$oZBylne3g0uheIFp4.1W7uGCxZHvyTFKOoWdNwZ.HiQufQmelZZtG','mforan@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-06-04 22:22:06',NULL,'2023-06-04 22:22:06',NULL,NULL,NULL,0,NULL,1),(33,'mpower','$2y$10$gk28iQP1kkBz0ydEMxNqyednwmH/u1UY8pw3TP7lIpPb2zzI/sEOC','mpower@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-06-04 22:23:01',NULL,'2023-06-04 22:23:01',NULL,NULL,NULL,0,NULL,1),(34,'msmith','$2y$10$L4TsZLhGqX.9n3U/a.cN4.oGu.4a0M0v9oECLfZm.AwDw/Yx7OFJm','msmith@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-06-04 22:24:51',NULL,'2023-06-04 22:24:51',NULL,NULL,NULL,0,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `version_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `major` int(11) NOT NULL DEFAULT 0 COMMENT 'Major component of version number, e.g. the 2 in OJS 2.3.8-0',
  `minor` int(11) NOT NULL DEFAULT 0 COMMENT 'Minor component of version number, e.g. the 3 in OJS 2.3.8-0',
  `revision` int(11) NOT NULL DEFAULT 0 COMMENT 'Revision component of version number, e.g. the 8 in OJS 2.3.8-0',
  `build` int(11) NOT NULL DEFAULT 0 COMMENT 'Build component of version number, e.g. the 0 in OJS 2.3.8-0',
  `date_installed` datetime NOT NULL,
  `current` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the version entry being described is currently active. This permits the table to store past installation history for forensic purposes.',
  `product_type` varchar(30) DEFAULT NULL COMMENT 'Describes the type of product this row describes, e.g. "plugins.generic" (for a generic plugin) or "core" for the application itself',
  `product` varchar(30) DEFAULT NULL COMMENT 'Uniquely identifies the product this version row describes, e.g. "ojs2" for OJS 2.x, "languageToggle" for the language toggle block plugin, etc.',
  `product_class_name` varchar(80) DEFAULT NULL COMMENT 'Specifies the class name associated with this product, for plugins, or the empty string where not applicable.',
  `lazy_load` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the row describes a lazy-load plugin; 0 otherwise',
  `sitewide` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the row describes a site-wide plugin; 0 otherwise',
  PRIMARY KEY (`version_id`),
  UNIQUE KEY `versions_unique` (`product_type`,`product`,`major`,`minor`,`revision`,`build`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Describes the installation and upgrade version history for the application and all installed plugins.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,1,0,0,0,'2023-06-04 21:50:05',1,'plugins.metadata','dc11','',0,0),(2,1,0,0,0,'2023-06-04 21:50:05',1,'plugins.pubIds','urn','\\APP\\plugins\\pubIds\\urn\\URNPubIdPlugin',0,0),(3,1,0,0,0,'2023-06-04 21:50:05',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(4,1,0,0,0,'2023-06-04 21:50:05',1,'plugins.blocks','information','InformationBlockPlugin',1,0),(5,1,0,0,0,'2023-06-04 21:50:05',1,'plugins.blocks','browse','\\APP\\plugins\\blocks\\browse\\BrowseBlockPlugin',1,0),(6,1,0,0,0,'2023-06-04 21:50:05',1,'plugins.blocks','makeSubmission','MakeSubmissionBlockPlugin',1,0),(7,1,0,0,0,'2023-06-04 21:50:05',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(8,0,1,0,0,'2023-06-04 21:50:05',1,'plugins.generic','citationStyleLanguage','CitationStyleLanguagePlugin',1,0),(9,1,0,0,0,'2023-06-04 21:50:05',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(10,1,0,0,0,'2023-06-04 21:50:05',1,'plugins.generic','dublinCoreMeta','DublinCoreMetaPlugin',1,0),(11,1,2,0,0,'2023-06-04 21:50:05',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),(12,1,0,0,0,'2023-06-04 21:50:05',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(13,1,0,0,0,'2023-06-04 21:50:05',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(14,1,0,0,0,'2023-06-04 21:50:05',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(15,1,0,0,0,'2023-06-04 21:50:05',1,'plugins.generic','usageEvent','',0,1),(16,1,0,0,0,'2023-06-04 21:50:05',1,'plugins.generic','htmlMonographFile','HtmlMonographFilePlugin',1,0),(17,1,0,0,0,'2023-06-04 21:50:05',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(18,1,2,0,0,'2023-06-04 21:50:05',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(19,1,3,0,0,'2023-06-04 21:50:05',1,'plugins.generic','acron','AcronPlugin',1,1),(20,1,0,0,0,'2023-06-04 21:50:05',1,'plugins.themes','default','DefaultThemePlugin',1,0),(21,1,0,0,0,'2023-06-04 21:50:05',1,'plugins.importexport','onix30','',0,0),(22,1,0,0,0,'2023-06-04 21:50:05',1,'plugins.importexport','native','',0,0),(23,1,0,0,0,'2023-06-04 21:50:05',1,'plugins.importexport','users','',0,0),(24,1,0,0,0,'2023-06-04 21:50:05',1,'plugins.importexport','csv','',0,0),(25,1,0,0,0,'2023-06-04 21:50:05',1,'plugins.oaiMetadataFormats','dc','',0,0),(26,1,0,0,0,'2023-06-04 21:50:05',1,'plugins.paymethod','paypal','',0,0),(27,1,0,0,0,'2023-06-04 21:50:05',1,'plugins.paymethod','manual','',0,0),(28,2,0,1,0,'2023-06-04 21:50:05',1,'plugins.reports','reviewReport','',0,0),(29,1,0,0,0,'2023-06-04 21:50:05',1,'plugins.reports','monographReport','',0,0),(30,3,4,0,0,'2023-06-04 21:49:54',1,'core','omp','',0,1);
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

-- Dump completed on 2023-06-04 22:26:37
