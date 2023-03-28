-- MySQL dump 10.13  Distrib 5.7.41, for Linux (x86_64)
--
-- Host: localhost    Database: omp-ci
-- ------------------------------------------------------
-- Server version	5.7.41-0ubuntu0.18.04.1

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Access keys are used to provide pseudo-login functionality for security-minimal tasks. Passkeys can be emailed directly to users, who can use them for a limited time in lieu of standard username and password.';
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
  `setting_value` mediumtext,
  `setting_type` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`announcement_setting_id`),
  UNIQUE KEY `announcement_settings_unique` (`announcement_id`,`locale`,`setting_name`),
  KEY `announcement_settings_announcement_id` (`announcement_id`),
  CONSTRAINT `announcement_settings_announcement_id_foreign` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`announcement_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about announcements, including localized properties like names and contents.';
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
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`announcement_type_setting_id`),
  UNIQUE KEY `announcement_type_settings_unique` (`type_id`,`locale`,`setting_name`),
  KEY `announcement_type_settings_type_id` (`type_id`),
  CONSTRAINT `announcement_type_settings_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `announcement_types` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about announcement types, including localized properties like their names.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Announcement types allow for announcements to optionally be categorized.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Announcements are messages that can be presented to users e.g. on the homepage.';
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
  `setting_value` mediumtext,
  PRIMARY KEY (`author_setting_id`),
  UNIQUE KEY `author_settings_unique` (`author_id`,`locale`,`setting_name`),
  KEY `author_settings_author_id` (`author_id`),
  CONSTRAINT `author_settings_author_id` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8 COMMENT='More data about authors, including localized properties such as their name and affiliation.';
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
  `include_in_browse` smallint(6) NOT NULL DEFAULT '1',
  `publication_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  `user_group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  KEY `authors_user_group_id` (`user_group_id`),
  KEY `authors_publication_id_foreign` (`publication_id`),
  CONSTRAINT `authors_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE,
  CONSTRAINT `authors_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='The authors of a publication.';
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
  `image` text,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_path` (`context_id`,`path`),
  KEY `category_context_id` (`context_id`),
  KEY `category_context_parent_id` (`context_id`,`parent_id`),
  KEY `category_parent_id` (`parent_id`),
  CONSTRAINT `categories_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Categories permit the organization of submissions into a heirarchical structure.';
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
  `setting_value` mediumtext,
  PRIMARY KEY (`category_setting_id`),
  UNIQUE KEY `category_settings_unique` (`category_id`,`locale`,`setting_name`),
  KEY `category_settings_category_id` (`category_id`),
  CONSTRAINT `category_settings_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='More data about categories, including localized properties such as names.';
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
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`citation_setting_id`),
  UNIQUE KEY `citation_settings_unique` (`citation_id`,`locale`,`setting_name`),
  KEY `citation_settings_citation_id` (`citation_id`),
  CONSTRAINT `citation_settings_citation_id` FOREIGN KEY (`citation_id`) REFERENCES `citations` (`citation_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Additional data about citations, including localized content.';
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
  `seq` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`citation_id`),
  UNIQUE KEY `citations_publication_seq` (`publication_id`,`seq`),
  KEY `citations_publication` (`publication_id`),
  CONSTRAINT `citations_publication` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A citation made by an associated publication.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A list of completed (fulfilled) payments, with information about the type of payment and the entity it relates to.';
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='The order that a word or phrase used in a controlled vocabulary should appear. For example, the order of keywords in a publication.';
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
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`controlled_vocab_entry_setting_id`),
  UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`),
  CONSTRAINT `c_v_e_s_entry_id` FOREIGN KEY (`controlled_vocab_entry_id`) REFERENCES `controlled_vocab_entries` (`controlled_vocab_entry_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='More data about a controlled vocabulary entry, including localized properties such as the actual word or phrase.';
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
  `assoc_type` bigint(20) NOT NULL DEFAULT '0',
  `assoc_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`controlled_vocab_id`),
  UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='Every word or phrase used in a controlled vocabulary. Controlled vocabularies are used for submission metadata like keywords and subjects, reviewer interests, and wherever a similar dictionary of words or phrases is required. Each entry corresponds to a word or phrase like "cellular reproduction" and a type like "submissionKeyword".';
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Relationships between tombstones and other data that can be collected in OAI sets, e.g. sections.';
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
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`tombstone_setting_id`),
  UNIQUE KEY `data_object_tombstone_settings_unique` (`tombstone_id`,`locale`,`setting_name`),
  KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`),
  CONSTRAINT `data_object_tombstone_settings_tombstone_id` FOREIGN KEY (`tombstone_id`) REFERENCES `data_object_tombstones` (`tombstone_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about data object tombstones, including localized content.';
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Entries for published data that has been removed. Usually used in the OAI endpoint.';
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
  `setting_value` mediumtext,
  PRIMARY KEY (`doi_setting_id`),
  UNIQUE KEY `doi_settings_unique` (`doi_id`,`locale`,`setting_name`),
  KEY `doi_settings_doi_id` (`doi_id`),
  CONSTRAINT `doi_settings_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about DOIs, including the registration agency.';
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
  `status` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`doi_id`),
  KEY `dois_context_id` (`context_id`),
  CONSTRAINT `dois_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all DOIs used in the system.';
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='Editorial decisions recorded on a submission, such as decisions to accept or decline the submission, as well as decisions to send for review, send to copyediting, request revisions, and more.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
INSERT INTO `edit_decisions` VALUES (1,1,NULL,1,NULL,3,18,'2023-03-28 23:23:07'),(2,1,1,3,1,3,2,'2023-03-28 23:23:25'),(3,2,NULL,1,NULL,3,18,'2023-03-28 23:26:30'),(4,4,NULL,1,NULL,3,1,'2023-03-28 23:28:57'),(5,4,3,2,1,3,3,'2023-03-28 23:29:15'),(6,4,4,3,1,3,2,'2023-03-28 23:29:33'),(7,4,NULL,4,NULL,3,7,'2023-03-28 23:29:53'),(8,5,NULL,1,NULL,3,1,'2023-03-28 23:31:34'),(9,5,5,2,1,3,3,'2023-03-28 23:31:53'),(10,5,6,3,1,3,2,'2023-03-28 23:32:12'),(11,5,NULL,4,NULL,3,7,'2023-03-28 23:32:32'),(12,6,NULL,1,NULL,3,1,'2023-03-28 23:34:38'),(13,6,7,2,1,6,23,'2023-03-28 23:35:10'),(14,7,NULL,1,NULL,3,18,'2023-03-28 23:36:39'),(15,7,8,3,1,3,2,'2023-03-28 23:36:59'),(16,9,NULL,1,NULL,3,1,'2023-03-28 23:38:40'),(17,11,NULL,1,NULL,3,1,'2023-03-28 23:41:11'),(18,11,10,2,1,3,3,'2023-03-28 23:41:26'),(19,11,11,3,1,3,2,'2023-03-28 23:42:29'),(20,12,NULL,1,NULL,3,1,'2023-03-28 23:43:30'),(21,13,NULL,1,NULL,3,1,'2023-03-28 23:45:00'),(22,13,13,2,1,3,3,'2023-03-28 23:45:16'),(23,13,14,3,1,3,2,'2023-03-28 23:46:26'),(24,14,NULL,1,NULL,3,1,'2023-03-28 23:47:35'),(25,14,15,2,1,3,3,'2023-03-28 23:47:52'),(26,14,16,3,1,3,2,'2023-03-28 23:48:08'),(27,14,NULL,4,NULL,3,7,'2023-03-28 23:48:26'),(28,15,NULL,1,NULL,3,18,'2023-03-28 23:50:28'),(29,16,NULL,1,NULL,3,18,'2023-03-28 23:51:39'),(30,17,NULL,1,NULL,3,1,'2023-03-28 23:53:44');
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
  `recipients` text,
  `cc_recipients` text,
  `bcc_recipients` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  PRIMARY KEY (`log_id`),
  KEY `email_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='A record of email messages that are sent in relation to an associated entity, such as a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
INSERT INTO `email_log` VALUES (1,1048585,1,0,'2023-03-28 23:22:54',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/1\">The ABCs of Human Survival: A Paradigm for Global Citizenship</a><br />Arthur Clark</p><p><b>Abstract</b></p>The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities―and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(2,1048585,1,0,'2023-03-28 23:22:54',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Arthur Clark,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/1</p><p>If you have been logged out, you can login again with the username aclark.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(3,1048585,1,3,'2023-03-28 23:23:08',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>','','','Your submission has been sent for review','<p>Dear Arthur Clark,</p><p>I am pleased to inform you that an editor has reviewed your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(4,1048585,1,3,'2023-03-28 23:23:25',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Arthur Clark,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(5,1048585,2,0,'2023-03-28 23:26:00',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: The West and Beyond: New Perspectives on an Imagined Region','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">The West and Beyond: New Perspectives on an Imagined Region</a><br />Alvin Finkel, Sarah Carter, Peter Fortna, Gerald Friesen, Lyle Dick, Winona Wheeler, Matt Dyce, James Opp</p><p><b>Abstract</b></p><p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p><p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(6,1048585,2,0,'2023-03-28 23:26:00',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: The West and Beyond: New Perspectives on an Imagined Region','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">The West and Beyond: New Perspectives on an Imagined Region</a><br />Alvin Finkel, Sarah Carter, Peter Fortna, Gerald Friesen, Lyle Dick, Winona Wheeler, Matt Dyce, James Opp</p><p><b>Abstract</b></p><p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p><p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(7,1048585,2,0,'2023-03-28 23:26:00',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: The West and Beyond: New Perspectives on an Imagined Region','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">The West and Beyond: New Perspectives on an Imagined Region</a><br />Alvin Finkel, Sarah Carter, Peter Fortna, Gerald Friesen, Lyle Dick, Winona Wheeler, Matt Dyce, James Opp</p><p><b>Abstract</b></p><p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p><p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(8,1048585,2,0,'2023-03-28 23:26:00',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Alvin Finkel\" <afinkel@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Alvin Finkel,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The West and Beyond: New Perspectives on an Imagined Region, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/2</p><p>If you have been logged out, you can login again with the username afinkel.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/2\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(9,1048585,2,0,'2023-03-28 23:26:00',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Sarah Carter\" <scarter@mailinator.com>, \"Peter Fortna\" <pfortna@mailinator.com>, \"Gerald Friesen\" <gfriesen@mailinator.com>, \"Lyle Dick\" <ldick@mailinator.com>, \"Winona Wheeler\" <wwheeler@mailinator.com>, \"Matt Dyce\" <mdyce@mailinator.com>, \"James Opp\" <jopp@mailinator.com>','','','Submission confirmation','<p>Dear Sarah Carter, Peter Fortna, Gerald Friesen, Lyle Dick, Winona Wheeler, Matt Dyce, James Opp,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Alvin Finkel, provided the following details:</p><p>The West and Beyond: New Perspectives on an Imagined Region<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(10,1048585,2,3,'2023-03-28 23:26:30',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Alvin Finkel\" <afinkel@mailinator.com>','','','Your submission has been sent for review','<p>Dear Alvin Finkel,</p><p>I am pleased to inform you that an editor has reviewed your submission, The West and Beyond: New Perspectives on an Imagined Region, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(11,1048585,3,0,'2023-03-28 23:27:53',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: The Political Economy of Workplace Injury in Canada','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">The Political Economy of Workplace Injury in Canada</a><br />Bob Barnetson</p><p><b>Abstract</b></p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(12,1048585,3,0,'2023-03-28 23:27:53',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: The Political Economy of Workplace Injury in Canada','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">The Political Economy of Workplace Injury in Canada</a><br />Bob Barnetson</p><p><b>Abstract</b></p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(13,1048585,3,0,'2023-03-28 23:27:53',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: The Political Economy of Workplace Injury in Canada','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">The Political Economy of Workplace Injury in Canada</a><br />Bob Barnetson</p><p><b>Abstract</b></p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(14,1048585,3,0,'2023-03-28 23:27:53',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Bob Barnetson\" <bbarnetson@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Bob Barnetson,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The Political Economy of Workplace Injury in Canada, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/3</p><p>If you have been logged out, you can login again with the username bbarnetson.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/3\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(15,1048585,4,0,'2023-03-28 23:28:42',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/4\">How Canadians Communicate: Contexts of Canadian Popular Culture</a><br />Bart Beaty, Toby Miller, Ira Wagman, Will Straw</p><p><b>Abstract</b></p>What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(16,1048585,4,0,'2023-03-28 23:28:42',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Bart Beaty,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/4</p><p>If you have been logged out, you can login again with the username bbeaty.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(17,1048585,4,0,'2023-03-28 23:28:42',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Toby Miller\" <tmiller@mailinator.com>, \"Ira Wagman\" <awagman@mailinator.com>, \"Will Straw\" <wstraw@mailinator.com>','','','Submission confirmation','<p>Dear Toby Miller, Ira Wagman, Will Straw,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Bart Beaty, provided the following details:</p><p>How Canadians Communicate: Contexts of Canadian Popular Culture<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(18,1048585,4,3,'2023-03-28 23:28:57',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Bart Beaty,</p><p>I am pleased to inform you that an editor has reviewed your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(19,1048585,4,3,'2023-03-28 23:29:15',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Your submission has been sent for review','<p>Dear Bart Beaty,</p><p>I am pleased to inform you that an editor has reviewed your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(20,1048585,4,3,'2023-03-28 23:29:34',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Bart Beaty,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(21,1048585,4,3,'2023-03-28 23:29:53',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Bart Beaty,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(22,1048585,5,0,'2023-03-28 23:31:17',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Bomb Canada and Other Unkind Remarks in the American Media','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">Bomb Canada and Other Unkind Remarks in the American Media</a><br />Chantal Allan</p><p><b>Abstract</b></p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(23,1048585,5,0,'2023-03-28 23:31:17',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Bomb Canada and Other Unkind Remarks in the American Media','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">Bomb Canada and Other Unkind Remarks in the American Media</a><br />Chantal Allan</p><p><b>Abstract</b></p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(24,1048585,5,0,'2023-03-28 23:31:17',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Bomb Canada and Other Unkind Remarks in the American Media','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">Bomb Canada and Other Unkind Remarks in the American Media</a><br />Chantal Allan</p><p><b>Abstract</b></p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(25,1048585,5,0,'2023-03-28 23:31:17',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Chantal Allan,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Bomb Canada and Other Unkind Remarks in the American Media, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/5</p><p>If you have been logged out, you can login again with the username callan.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(26,1048585,5,3,'2023-03-28 23:31:34',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Chantal Allan,</p><p>I am pleased to inform you that an editor has reviewed your submission, Bomb Canada and Other Unkind Remarks in the American Media, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(27,1048585,5,3,'2023-03-28 23:31:53',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Your submission has been sent for review','<p>Dear Chantal Allan,</p><p>I am pleased to inform you that an editor has reviewed your submission, Bomb Canada and Other Unkind Remarks in the American Media, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(28,1048585,5,3,'2023-03-28 23:32:12',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Chantal Allan,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Bomb Canada and Other Unkind Remarks in the American Media, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(29,1048585,5,3,'2023-03-28 23:32:32',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Chantal Allan,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, Bomb Canada and Other Unkind Remarks in the American Media, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(30,1048585,6,0,'2023-03-28 23:34:22',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">The Information Literacy User’s Guide</a><br />Deborah Bernnard, Greg Bobish, Daryl Bullis, Jenna Hecker</p><p><b>Abstract</b></p>Good researchers have a host of tools at their disposal that make navigating today’s complex information ecosystem much more manageable. Gaining the knowledge, abilities, and self-reflection necessary to be a good researcher helps not only in academic settings, but is invaluable in any career, and throughout one’s life. The Information Literacy User’s Guide will start you on this route to success.<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(31,1048585,6,0,'2023-03-28 23:34:22',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Deborah Bernnard\" <dbernnard@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Deborah Bernnard,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The Information Literacy User’s Guide, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/6</p><p>If you have been logged out, you can login again with the username dbernnard.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/6\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(32,1048585,6,0,'2023-03-28 23:34:22',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Greg Bobish\" <gbobish@mailinator.com>, \"Daryl Bullis\" <dbullis@mailinator.com>, \"Jenna Hecker\" <jhecker@mailinator.com>','','','Submission confirmation','<p>Dear Greg Bobish, Daryl Bullis, Jenna Hecker,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Deborah Bernnard, provided the following details:</p><p>The Information Literacy User’s Guide<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(33,1048585,6,3,'2023-03-28 23:34:38',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Deborah Bernnard\" <dbernnard@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Deborah Bernnard,</p><p>I am pleased to inform you that an editor has reviewed your submission, The Information Literacy User’s Guide, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(34,1048585,7,0,'2023-03-28 23:36:22',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">Accessible Elements: Teaching Science Online and at a Distance</a><br />Dietmar Kennepohl, Terry Anderson, Paul Gorsky, Gale Parchoma, Stuart Palmer</p><p><b>Abstract</b></p>Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(35,1048585,7,0,'2023-03-28 23:36:22',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Dietmar Kennepohl,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Accessible Elements: Teaching Science Online and at a Distance, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/7</p><p>If you have been logged out, you can login again with the username dkennepohl.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/7\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(36,1048585,7,0,'2023-03-28 23:36:22',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Terry Anderson\" <tanderson@mailinator.com>, \"Paul Gorsky\" <pgorsky@mailinator.com>, \"Gale Parchoma\" <gparchoma@mailinator.com>, \"Stuart Palmer\" <spalmer@mailinator.com>','','','Submission confirmation','<p>Dear Terry Anderson, Paul Gorsky, Gale Parchoma, Stuart Palmer,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Dietmar Kennepohl, provided the following details:</p><p>Accessible Elements: Teaching Science Online and at a Distance<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(37,1048585,7,3,'2023-03-28 23:36:39',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>','','','Your submission has been sent for review','<p>Dear Dietmar Kennepohl,</p><p>I am pleased to inform you that an editor has reviewed your submission, Accessible Elements: Teaching Science Online and at a Distance, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(38,1048585,7,3,'2023-03-28 23:36:59',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Dietmar Kennepohl,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Accessible Elements: Teaching Science Online and at a Distance, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/7\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(39,1048585,8,0,'2023-03-28 23:37:26',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Editorial</a><br /></p><p><b>Abstract</b></p>A Note From The Publisher<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(40,1048585,8,0,'2023-03-28 23:37:26',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Editorial','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Editorial</a><br /></p><p><b>Abstract</b></p>A Note From The Publisher<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(41,1048585,8,0,'2023-03-28 23:37:26',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Editorial','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Editorial</a><br /></p><p><b>Abstract</b></p>A Note From The Publisher<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(42,1048585,8,0,'2023-03-28 23:37:26',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Editorial','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Editorial</a><br /></p><p><b>Abstract</b></p>A Note From The Publisher<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(43,1048585,9,0,'2023-03-28 23:38:23',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"David Buskins\" <dbuskins@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear David Buskins,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/9\">Enabling Openness: The future of the information society in Latin America and the Caribbean</a><br />Fernando Perini, Robin Mansell, Hernan Galperin, Pablo Bello, Eleonora Rabinovich</p><p><b>Abstract</b></p>In recent years, the Internet and other network technologies have emerged as a central issue for development in Latin America and the Caribbean. They have shown their potential to increase productivity and economic competitiveness, to create new ways to deliver education and health services, and to be driving forces for the modernization of the provision of public services.<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(44,1048585,9,0,'2023-03-28 23:38:23',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Fernando Perini\" <fperini@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Fernando Perini,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Enabling Openness: The future of the information society in Latin America and the Caribbean, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/9</p><p>If you have been logged out, you can login again with the username fperini.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/9\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(45,1048585,9,0,'2023-03-28 23:38:23',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Robin Mansell\" <rmansell@mailinator.com>, \"Hernan Galperin\" <hgalperin@mailinator.com>, \"Pablo Bello\" <pbello@mailinator.com>, \"Eleonora Rabinovich\" <erabinovich@mailinator.com>','','','Submission confirmation','<p>Dear Robin Mansell, Hernan Galperin, Pablo Bello, Eleonora Rabinovich,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Fernando Perini, provided the following details:</p><p>Enabling Openness: The future of the information society in Latin America and the Caribbean<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(46,1048585,9,3,'2023-03-28 23:38:41',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Fernando Perini\" <fperini@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Fernando Perini,</p><p>I am pleased to inform you that an editor has reviewed your submission, Enabling Openness: The future of the information society in Latin America and the Caribbean, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(47,1048585,10,0,'2023-03-28 23:40:28',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Lost Tracks: Buffalo National Park, 1909-1939','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">Lost Tracks: Buffalo National Park, 1909-1939</a><br />Jennifer Brower</p><p><b>Abstract</b></p>While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(48,1048585,10,0,'2023-03-28 23:40:28',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Lost Tracks: Buffalo National Park, 1909-1939','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">Lost Tracks: Buffalo National Park, 1909-1939</a><br />Jennifer Brower</p><p><b>Abstract</b></p>While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(49,1048585,10,0,'2023-03-28 23:40:28',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Lost Tracks: Buffalo National Park, 1909-1939','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">Lost Tracks: Buffalo National Park, 1909-1939</a><br />Jennifer Brower</p><p><b>Abstract</b></p>While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(50,1048585,10,0,'2023-03-28 23:40:29',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Jennifer Brower\" <jbrower@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Jennifer Brower,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Lost Tracks: Buffalo National Park, 1909-1939, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/10</p><p>If you have been logged out, you can login again with the username jbrower.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/10\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(51,1048585,11,0,'2023-03-28 23:40:56',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Dreamwork','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">Dreamwork</a><br />Jonathan Locke Hart</p><p><b>Abstract</b></p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(52,1048585,11,0,'2023-03-28 23:40:56',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Dreamwork','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">Dreamwork</a><br />Jonathan Locke Hart</p><p><b>Abstract</b></p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(53,1048585,11,0,'2023-03-28 23:40:56',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Dreamwork','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">Dreamwork</a><br />Jonathan Locke Hart</p><p><b>Abstract</b></p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(54,1048585,11,0,'2023-03-28 23:40:56',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Jonathan Locke Hart,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Dreamwork, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/11</p><p>If you have been logged out, you can login again with the username jlockehart.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/11\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(55,1048585,11,3,'2023-03-28 23:41:11',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that an editor has reviewed your submission, Dreamwork, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(56,1048585,11,3,'2023-03-28 23:41:26',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Your submission has been sent for review','<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that an editor has reviewed your submission, Dreamwork, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(57,1048585,11,10,'2023-03-28 23:41:51',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Adela Gallego accepted review assignment for #11 Locke Hart — Dreamwork','<p>Dear Ramiro Vaca,</p><p>Adela Gallego has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">#11 Locke Hart — Dreamwork</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><b>Review Due:</b> 2023-04-25</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.'),(58,1048585,11,12,'2023-03-28 23:42:04',1073741829,'\"Gonzalo Favio\" <gfavio@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Gonzalo Favio accepted review assignment for #11 Locke Hart — Dreamwork','<p>Dear Ramiro Vaca,</p><p>Gonzalo Favio has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">#11 Locke Hart — Dreamwork</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><b>Review Due:</b> 2023-04-25</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.'),(59,1048585,11,3,'2023-03-28 23:42:29',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Dreamwork, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/11\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(60,1048585,12,0,'2023-03-28 23:43:14',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Connecting ICTs to Development','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">Connecting ICTs to Development</a><br />Laurent Elder, Heloise Emdon, Frank Tulus, Raymond Hyma, John Valk, Khaled Fourati, Jeremy de Beer, Sara Bannerman</p><p><b>Abstract</b></p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(61,1048585,12,0,'2023-03-28 23:43:14',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Connecting ICTs to Development','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">Connecting ICTs to Development</a><br />Laurent Elder, Heloise Emdon, Frank Tulus, Raymond Hyma, John Valk, Khaled Fourati, Jeremy de Beer, Sara Bannerman</p><p><b>Abstract</b></p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(62,1048585,12,0,'2023-03-28 23:43:14',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Connecting ICTs to Development','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">Connecting ICTs to Development</a><br />Laurent Elder, Heloise Emdon, Frank Tulus, Raymond Hyma, John Valk, Khaled Fourati, Jeremy de Beer, Sara Bannerman</p><p><b>Abstract</b></p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(63,1048585,12,0,'2023-03-28 23:43:14',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Laurent Elder\" <lelder@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Laurent Elder,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Connecting ICTs to Development, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/12</p><p>If you have been logged out, you can login again with the username lelder.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/12\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(64,1048585,12,0,'2023-03-28 23:43:14',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Frank Tulus\" <ftulus@mailinator.com>, \"Raymond Hyma\" <rhyma@mailinator.com>, \"John Valk\" <jvalk@mailinator.com>, \"Khaled Fourati\" <fkourati@mailinator.com>, \"Jeremy de Beer\" <jdebeer@mailinator.com>, \"Sara Bannerman\" <sbannerman@mailinator.com>','','','Submission confirmation','<p>Dear Frank Tulus, Raymond Hyma, John Valk, Khaled Fourati, Jeremy de Beer, Sara Bannerman,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Laurent Elder, provided the following details:</p><p>Connecting ICTs to Development<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(65,1048585,12,3,'2023-03-28 23:43:30',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Laurent Elder\" <lelder@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Laurent Elder,</p><p>I am pleased to inform you that an editor has reviewed your submission, Connecting ICTs to Development, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(66,1048585,12,8,'2023-03-28 23:44:04',1073741829,'\"Paul Hudson\" <phudson@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Paul Hudson accepted review assignment for #12 Elder et al. — Connecting ICTs to Development','<p>Dear Ramiro Vaca,</p><p>Paul Hudson has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">#12 Elder et al. — Connecting ICTs to Development</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><b>Review Due:</b> 2023-04-25</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.'),(67,1048585,13,0,'2023-03-28 23:44:45',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">Mobile Learning: Transforming the Delivery of Education and Training</a><br />Mohamed Ally, John Traxler, Marguerite Koole, Torstein Rekkedal</p><p><b>Abstract</b></p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(68,1048585,13,0,'2023-03-28 23:44:45',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">Mobile Learning: Transforming the Delivery of Education and Training</a><br />Mohamed Ally, John Traxler, Marguerite Koole, Torstein Rekkedal</p><p><b>Abstract</b></p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(69,1048585,13,0,'2023-03-28 23:44:45',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">Mobile Learning: Transforming the Delivery of Education and Training</a><br />Mohamed Ally, John Traxler, Marguerite Koole, Torstein Rekkedal</p><p><b>Abstract</b></p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(70,1048585,13,0,'2023-03-28 23:44:45',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Mohamed Ally,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Mobile Learning: Transforming the Delivery of Education and Training, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/13</p><p>If you have been logged out, you can login again with the username mally.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(71,1048585,13,0,'2023-03-28 23:44:45',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Traxler\" <jtraxler@mailinator.com>, \"Marguerite Koole\" <mkoole@mailinator.com>, \"Torstein Rekkedal\" <trekkedal@mailinator.com>','','','Submission confirmation','<p>Dear John Traxler, Marguerite Koole, Torstein Rekkedal,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Mohamed Ally, provided the following details:</p><p>Mobile Learning: Transforming the Delivery of Education and Training<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(72,1048585,13,3,'2023-03-28 23:45:00',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that an editor has reviewed your submission, Mobile Learning: Transforming the Delivery of Education and Training, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(73,1048585,13,3,'2023-03-28 23:45:16',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Your submission has been sent for review','<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that an editor has reviewed your submission, Mobile Learning: Transforming the Delivery of Education and Training, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(74,1048585,13,10,'2023-03-28 23:45:49',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Adela Gallego accepted review assignment for #13 Ally et al. — Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear Ramiro Vaca,</p><p>Adela Gallego has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">#13 Ally et al. — Mobile Learning: Transforming the Delivery of Education and Training</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><b>Review Due:</b> 2023-04-25</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.'),(75,1048585,13,12,'2023-03-28 23:46:01',1073741829,'\"Gonzalo Favio\" <gfavio@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Gonzalo Favio accepted review assignment for #13 Ally et al. — Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear Ramiro Vaca,</p><p>Gonzalo Favio has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">#13 Ally et al. — Mobile Learning: Transforming the Delivery of Education and Training</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><b>Review Due:</b> 2023-04-25</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.'),(76,1048585,13,3,'2023-03-28 23:46:26',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Mobile Learning: Transforming the Delivery of Education and Training, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(77,1048585,14,0,'2023-03-28 23:47:18',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/14\">From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots</a><br />Michael Dawson, Brian Dupuis, Michael Wilson</p><p><b>Abstract</b></p>From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(78,1048585,14,0,'2023-03-28 23:47:18',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Michael Dawson,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/14</p><p>If you have been logged out, you can login again with the username mdawson.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(79,1048585,14,0,'2023-03-28 23:47:18',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Brian Dupuis\" <bdupuis@mailinator.com>, \"Michael Wilson\" <mwilson@mailinator.com>','','','Submission confirmation','<p>Dear Brian Dupuis, Michael Wilson,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Michael Dawson, provided the following details:</p><p>From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(80,1048585,14,3,'2023-03-28 23:47:35',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Michael Dawson,</p><p>I am pleased to inform you that an editor has reviewed your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(81,1048585,14,3,'2023-03-28 23:47:52',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Your submission has been sent for review','<p>Dear Michael Dawson,</p><p>I am pleased to inform you that an editor has reviewed your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(82,1048585,14,3,'2023-03-28 23:48:08',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Michael Dawson,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(83,1048585,14,3,'2023-03-28 23:48:26',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Michael Dawson,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(84,1048585,15,0,'2023-03-28 23:50:13',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Expansive Discourses: Urban Sprawl in Calgary, 1945-1978','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">Expansive Discourses: Urban Sprawl in Calgary, 1945-1978</a><br />Max Foran</p><p><b>Abstract</b></p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(85,1048585,15,0,'2023-03-28 23:50:13',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Expansive Discourses: Urban Sprawl in Calgary, 1945-1978','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">Expansive Discourses: Urban Sprawl in Calgary, 1945-1978</a><br />Max Foran</p><p><b>Abstract</b></p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(86,1048585,15,0,'2023-03-28 23:50:13',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Expansive Discourses: Urban Sprawl in Calgary, 1945-1978','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">Expansive Discourses: Urban Sprawl in Calgary, 1945-1978</a><br />Max Foran</p><p><b>Abstract</b></p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(87,1048585,15,0,'2023-03-28 23:50:13',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Max Foran\" <mforan@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Max Foran,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Expansive Discourses: Urban Sprawl in Calgary, 1945-1978, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/15</p><p>If you have been logged out, you can login again with the username mforan.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/15\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(88,1048585,15,3,'2023-03-28 23:50:28',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Max Foran\" <mforan@mailinator.com>','','','Your submission has been sent for review','<p>Dear Max Foran,</p><p>I am pleased to inform you that an editor has reviewed your submission, Expansive Discourses: Urban Sprawl in Calgary, 1945-1978, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(89,1048585,16,0,'2023-03-28 23:51:22',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: A Designer\'s Log: Case Studies in Instructional Design','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">A Designer\'s Log: Case Studies in Instructional Design</a><br />Michael Power</p><p><b>Abstract</b></p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(90,1048585,16,0,'2023-03-28 23:51:22',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: A Designer\'s Log: Case Studies in Instructional Design','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">A Designer\'s Log: Case Studies in Instructional Design</a><br />Michael Power</p><p><b>Abstract</b></p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(91,1048585,16,0,'2023-03-28 23:51:22',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: A Designer\'s Log: Case Studies in Instructional Design','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">A Designer\'s Log: Case Studies in Instructional Design</a><br />Michael Power</p><p><b>Abstract</b></p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(92,1048585,16,0,'2023-03-28 23:51:22',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Michael Power\" <mpower@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Michael Power,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, A Designer\'s Log: Case Studies in Instructional Design, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/16</p><p>If you have been logged out, you can login again with the username mpower.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/16\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(93,1048585,16,3,'2023-03-28 23:51:39',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Power\" <mpower@mailinator.com>','','','Your submission has been sent for review','<p>Dear Michael Power,</p><p>I am pleased to inform you that an editor has reviewed your submission, A Designer\'s Log: Case Studies in Instructional Design, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(94,1048585,16,10,'2023-03-28 23:52:14',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Adela Gallego accepted review assignment for #16 Power — A Designer\'s Log: Case Studies in Instructional Design','<p>Dear Ramiro Vaca,</p><p>Adela Gallego has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">#16 Power — A Designer\'s Log: Case Studies in Instructional Design</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><b>Review Due:</b> 2023-04-25</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.'),(95,1048585,17,0,'2023-03-28 23:53:25',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Open Development: Networked Innovations in International Development','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">Open Development: Networked Innovations in International Development</a><br />Matthew Smith, Yochai Benkler, Katherine Reilly, Melissa Loudon, Ulrike Rivett, Mark Graham, Håvard Haarstad, Marshall Smith</p><p><b>Abstract</b></p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(96,1048585,17,0,'2023-03-28 23:53:25',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Open Development: Networked Innovations in International Development','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">Open Development: Networked Innovations in International Development</a><br />Matthew Smith, Yochai Benkler, Katherine Reilly, Melissa Loudon, Ulrike Rivett, Mark Graham, Håvard Haarstad, Marshall Smith</p><p><b>Abstract</b></p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(97,1048585,17,0,'2023-03-28 23:53:25',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Open Development: Networked Innovations in International Development','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">Open Development: Networked Innovations in International Development</a><br />Matthew Smith, Yochai Benkler, Katherine Reilly, Melissa Loudon, Ulrike Rivett, Mark Graham, Håvard Haarstad, Marshall Smith</p><p><b>Abstract</b></p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(98,1048585,17,0,'2023-03-28 23:53:25',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Matthew Smith\" <msmith@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Matthew Smith,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Open Development: Networked Innovations in International Development, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/17</p><p>If you have been logged out, you can login again with the username msmith.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/17\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(99,1048585,17,0,'2023-03-28 23:53:25',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Yochai Benkler\" <ybenkler@mailinator.com>, \"Katherine Reilly\" <kreilly@mailinator.com>, \"Melissa Loudon\" <mloudon@mailinator.com>, \"Ulrike Rivett\" <urivett@mailinator.com>, \"Mark Graham\" <mgraham@mailinator.com>, \"Håvard Haarstad\" <hhaarstad@mailinator.com>, \"Marshall Smith\" <masmith@mailinator.com>','','','Submission confirmation','<p>Dear Yochai Benkler, Katherine Reilly, Melissa Loudon, Ulrike Rivett, Mark Graham, Håvard Haarstad, Marshall Smith,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Matthew Smith, provided the following details:</p><p>Open Development: Networked Innovations in International Development<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(100,1048585,17,3,'2023-03-28 23:53:44',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Matthew Smith\" <msmith@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Matthew Smith,</p><p>I am pleased to inform you that an editor has reviewed your submission, Open Development: Networked Innovations in International Development, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>');
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
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COMMENT='A record of users associated with an email log entry.';
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Custom email templates created by each context, and overrides of the default templates.';
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
  `body` text,
  PRIMARY KEY (`email_templates_default_data_id`),
  UNIQUE KEY `email_templates_default_data_unique` (`email_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8 COMMENT='Default email templates created for every installed locale.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default_data`
--

LOCK TABLES `email_templates_default_data` WRITE;
/*!40000 ALTER TABLE `email_templates_default_data` DISABLE KEYS */;
INSERT INTO `email_templates_default_data` VALUES (1,'PASSWORD_RESET_CONFIRM','en','Password Reset Confirm','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$lostPasswordUrl}<br />\n<br />\n{$siteContactName}'),(3,'USER_REGISTER','en','User Created','Press Registration','{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$pressName}. We have included your username and password in this email, which are needed for all work with this press through its website. At any point, you can ask to be removed from the list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),(5,'USER_VALIDATE_CONTEXT','en','Validate Email (Press Registration)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$pressName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$pressSignature}'),(7,'USER_VALIDATE_SITE','en','Validate Email (Site)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$siteSignature}'),(9,'REVIEWER_REGISTER','en','Reviewer Register','Registration as Reviewer with {$pressName}','In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$pressName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the press through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),(11,'SUBMISSION_ACK','en','Submission Confirmation','Thank you for your submission to {$pressName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$pressName}. We have received your submission, {$submissionTitle}, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: {$authorSubmissionUrl}</p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Thank you for considering {$pressName} as a venue for your work.</p>{$pressSignature}'),(13,'SUBMISSION_ACK_NOT_USER','en','Submission Confirmation (Other Authors)','Submission confirmation','<p>Dear {$recipientName},</p><p>You have been named as a co-author on a submission to {$pressName}. The submitter, {$submitterName}, provided the following details:</p><p>{$submissionTitle}<br>{$authorsWithAffiliation}</p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering {$pressName} as a venue for your work.</p><p>Kind regards,</p>{$pressSignature}'),(15,'EDITOR_ASSIGN','en','Editor Assigned','You have been assigned as an editor on a submission to {$pressName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>If you find the submission to be relevant for {$pressName}, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$pressSignature}'),(17,'REVIEW_CANCEL','en','Reviewer Unassign','Request for Review Cancelled','{$recipientName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this review process in the future.<br />\n<br />\nIf you have any questions, please contact me.'),(19,'REVIEW_REINSTATE','en','Reviewer Reinstate','Can you still review something for {$pressName}?','<p>Dear {$recipientName},</p><p>We recently cancelled our request for you to review a submission, {$submissionTitle}, for {$pressName}. We\'ve reversed that decision and we hope that you are still able to conduct the review.</p><p>If you are able to assist with this submission\'s review, you can <a href=\"{$reviewAssignmentUrl}\">login to the press</a> to view the submission, upload review files, and submit your review request.</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p>{$signature}'),(21,'REVIEW_RESEND_REQUEST','en','Resend Review Request to Reviewer','Requesting your review again for {$pressName}','<p>Dear {$recipientName},</p><p>Recently, you declined our request to review a submission, {$submissionTitle}, for {$pressName}. I\'m writing to see if you are able to conduct the review after all.</p><p>We would be grateful if you\'re able to perform this review, but we understand if that is not possible at this time. Either way, please <a href=\"{$reviewAssignmentUrl}\">accept or decline the request</a> by {$responseDueDate}, so that we can find an alternate reviewer.<p>If you have any questions, please contact me.</p><p>Kind regards,</p>{$signature}'),(23,'REVIEW_REQUEST','en','Review Request','Manuscript Review Request','<p>Dear {$recipientName},</p><p>I believe that you would serve as an excellent reviewer for a submission  to {$pressName}. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please <a href=\"{$reviewAssignmentUrl}\">accept or decline</a> the review by <b>{$responseDueDate}</b>.</p><p>You may contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}'),(25,'REVIEW_REQUEST_SUBSEQUENT','en','Review Request Subsequent','Request to review a revised submission','<p>Dear {$recipientName},</p><p>Thank you for your review of <a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a>. The authors have considered the reviewers\' feedback and have now submitted a revised version of their work. I\'m writing to ask if you would conduct a second round of peer review for this submission.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can <a href=\"{$reviewAssignmentUrl}\">follow the review steps</a> to view the submission, upload review files, and submit your review comments.<p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please <a href=\"{$reviewAssignmentUrl}\">accept or decline</a> the review by <b>{$responseDueDate}</b>.</p><p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}'),(27,'REVIEW_RESPONSE_OVERDUE_AUTO','en','Review Response Overdue (Automated)','Manuscript Review Request','Dear {$recipientName},<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$pressSignature}<br />\n'),(29,'REVIEW_CONFIRM','en','Review Confirm','Review accepted: {$reviewerName} accepted review assignment for #{$submissionId} {$authorsShort} — {$submissionTitle}','<p>Dear {$recipientName},</p><p>{$reviewerName} has accepted the following review:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — {$submissionTitle}</a><br /><b>Type:</b> {$reviewMethod}</p><b>Review Due:</b> {$reviewDueDate}</p><p>Login to <a href=\"{$submissionUrl}\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"{$pressUrl}\">{$pressName}</a>.'),(31,'REVIEW_DECLINE','en','Review Decline','Unable to Review','Editor(s):<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$senderName}'),(33,'REVIEW_ACK','en','','Thank you for your review','<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, {$submissionTitle}, for {$pressName}. We appreciate your time and expertise in contributing to the quality of the work that we publish.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$pressName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>'),(35,'REVIEW_REMIND','en','Review Reminder','A reminder to please complete your review','<p>Dear {$recipientName},</p><p>Just a gentle reminder of our request for your review of the submission, \"{$submissionTitle},\" for {$pressName}. We were expecting to have this review by {$reviewDueDate} and we would be pleased to receive it as soon as you are able to prepare it.</p><p>You can <a href=\"{$reviewAssignmentUrl}\">login to the press</a> and follow the review steps to view the submission, upload review files, and submit your review comments.</p><p>If you need an extension of the deadline, please contact me. I look forward to hearing from you.</p><p>Thank you in advance and kind regards,</p>{$signature}'),(37,'REVIEW_REMIND_AUTO','en','Review Reminder (Automated)','A reminder to please complete your review','<p>Dear {$recipientName}:</p><p>This email is an automated reminder from {$pressName} in regards to our request for your review of the submission, \"{$submissionTitle}.\"</p><p>We were expecting to have this review by {$reviewDueDate} and we would be pleased to receive it as soon as you are able to prepare it.</p><p>Please <a href=\"{$reviewAssignmentUrl}\">login to the press</a> and follow the review steps to view the submission, upload review files, and submit your review comments.</p><p>If you need an extension of the deadline, please contact me. I look forward to hearing from you.</p><p>Thank you in advance and kind regards,</p>{$pressSignature}'),(39,'REVIEW_COMPLETE','en','Review Completed','Review complete: {$reviewerName} recommends {$reviewRecommendation} for #{$submissionId} {$authorsShort} — {$submissionTitle}','<p>Dear {$recipientName},</p><p>{$reviewerName} completed the following review:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — {$submissionTitle}</a><br /><b>Recommendation:</b> {$reviewRecommendation}<br /><b>Type:</b> {$reviewMethod}</p><p>Login to <a href=\"{$submissionUrl}\">view all files and comments</a> provided by this reviewer.</p>'),(41,'REVIEW_EDIT','en','Review Edited','Your review assignment has been changed for {$pressName}','<p>Dear {$recipientName},</p><p>An editor has made changes to your review assignment for {$pressName}. Please review the details below and let us know if you have any questions.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a><br /><b>Type:</b> {$reviewMethod}<br /><b>Accept or Decline By:</b> {$responseDueDate}<br /><b>Submit Review By:</b> {$reviewDueDate}</p><p>You can login to <a href=\"{$reviewAssignmentUrl}\">complete this review</a> at any time.</p>'),(43,'EDITOR_DECISION_ACCEPT','en','Submission Accepted','Your submission has been accepted to {$pressName}','<p>Dear {$recipientName},</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, {$submissionTitle}, to meet or exceed our expectations. We are excited to publish your piece in {$pressName} and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for {$pressName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),(45,'EDITOR_DECISION_SEND_TO_INTERNAL','en','Sent to Internal Review','Your submission has been sent for internal review','<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>'),(47,'EDITOR_DECISION_SEND_TO_EXTERNAL','en','Sent to Review','Your submission has been sent for review','<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>{$reviewTypeDescription} You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>'),(49,'EDITOR_DECISION_SEND_TO_PRODUCTION','en','Sent to Production','Next steps for publishing your submission','<p>Dear {$recipientName},</p><p>I am writing from {$pressName} to let you know that the editing of your submission, {$submissionTitle}, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),(51,'EDITOR_DECISION_REVISIONS','en','Revisions Requested','Your submission has been reviewed and we encourage you to submit revisions','<p>Dear {$recipientName},</p><p>Your submission {$submissionTitle} has been reviewed and we would like to encourage you to submit revisions that address the reviewers\' comments. An editor will review these revisions and if they address the concerns adequately, your submission may be accepted for publication.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point in the reviewers\' comments and identify what changes you have made. If you find any of the reviewer\'s comments to be unjustified or inappropriate, please explain your perspective.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments at your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),(53,'EDITOR_DECISION_RESUBMIT','en','Resubmit for Review','Your submission has been reviewed - please revise and resubmit','<p>Dear {$recipientName},</p><p>After reviewing your submission, {$submissionTitle}, the reviewers have recommended that your submission cannot be accepted for publication in its current form. However, we would like to encourage you to submit a revised version that addresses the reviewers\' comments. Your revisions will be reviewed by an editor and may be sent out for another round of peer review.</p><p>Please note that resubmitting your work does not guarantee that it will be accepted.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point and identify what changes you have made. If you find any of the reviewer\'s comments inappropriate, please explain your perspective. If you have questions about the recommendations in your review, please include these in your response.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments <a href=\"{$authorSubmissionUrl}\">at your submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),(55,'EDITOR_DECISION_DECLINE','en','Submission Declined','Your submission has been declined','<p>Dear {$recipientName},</p><p>While we appreciate receiving your submission, we are unable to accept {$submissionTitle} for publication on the basis of the comments from reviewers.</p><p>The reviewers\' comments are included at the bottom of this email.</p><p>Thank you for submitting to {$pressName}. Although it is disappointing to have a submission declined, I hope you find the reviewers\' comments to be constructive and helpful.</p><p>You are now free to submit the work elsewhere if you choose to do so.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),(57,'EDITOR_DECISION_INITIAL_DECLINE','en','Submission Declined (Pre-Review)','Your submission has been declined','<p>Dear {$recipientName},</p><p>I’m sorry to inform you that, after reviewing your submission, {$submissionTitle}, the editor has found that it does not meet our requirements for publication in {$pressName}.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p>{$signature}'),(59,'EDITOR_RECOMMENDATION','en','Recommendation Made','Editor Recommendation','<p>Dear {$recipientName},</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission {$submissionTitle}.</p><p>My recommendation is: {$recommendation}.</p><p>Please visit the submission\'s <a href=\"{$submissionUrl}\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>{$senderName}</p>'),(61,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','en','Notify Other Authors','An update regarding your submission','<p>The following email was sent to {$submittingAuthorName} from {$pressName} regarding {$submissionTitle}.</p>\n<p>You are receiving a copy of this notification because you are identified as an author of the submission. Any instructions in the message below are intended for the submitting author, {$submittingAuthorName}, and no action is required of you at this time.</p>\n\n{$messageToSubmittingAuthor}'),(63,'EDITOR_DECISION_NOTIFY_REVIEWERS','en','Notify Reviewers of Decision','Thank you for your review','<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, {$submissionTitle}, for {$pressName}. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>{$decisionDescription}</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$pressName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>'),(65,'EDITOR_DECISION_NEW_ROUND','en','New Review Round Initiated','Your submission has been sent for another round of review','<p>Dear {$recipientName},</p>\n<p>Your revised submission, {$submissionTitle}, has been sent for a new round of peer review. \nYou will hear from us with feedback from the reviewers and information about the next steps.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),(67,'EDITOR_DECISION_REVERT_DECLINE','en','Reinstate Declined Submission','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will complete the round of review and you will be notified when a \ndecision is made.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),(69,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','en','Reinstate Submission Declined Without Review','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will look further at your submission before deciding whether to decline \nthe submission or send it for review.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),(71,'EDITOR_DECISION_SKIP_REVIEW','en','Submission Accepted (Without Review)','Your submission has been sent for copyediting','<p>Dear {$recipientName},</p>\n<p>I am pleased to inform you that we have decided to accept your submission without peer review. We found your submission, {$submissionTitle}, to meet our expectations, and we do not require that work of this type undergo peer review. We are excited to publish your piece in {$pressName} and we thank you for choosing our press as a venue for your work.</p>\n<p>Your submission will soon be published on the press site for {$pressName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on your efforts.</p>\n<p>Your submission will now undergo copy editing and formatting to prepare it for publication. </p>\n<p>You will shortly receive further instructions.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),(73,'EDITOR_DECISION_BACK_FROM_PRODUCTION','en','Submission Sent Back to Copyediting','Your submission has been sent back to copyediting','<p>Dear {$recipientName},</p><p>Your submission, {$submissionTitle}, has been sent back to the copyediting stage, where it will undergo further copyediting and formatting to prepare it for publication.</p><p>Occasionally, a submission is sent to the production stage before it is ready for the final galleys to be prepared for publication. Your submission is still forthcoming. I apologize for any confusion.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We will contact you if we need any further assistance.</p><p>Kind regards,</p><p>{$signature}</p>'),(75,'EDITOR_DECISION_BACK_FROM_COPYEDITING','en','Submission Sent Back from Copyediting','Your submission has been sent back to review','<p>Dear {$recipientName},</p><p>Your submission, {$submissionTitle}, has been sent back to the review stage. It will undergo further review before it can be accepted for publication.</p><p>Occasionally, a decision to accept a submission will be recorded accidentally in our system and we must send it back to review. I apologize for any confusion this has caused. We will work to complete any further review quickly so that you have a final decision as soon as possible.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>'),(77,'EDITOR_DECISION_CANCEL_REVIEW_ROUND','en','Review Round Cancelled','A review round for your submission has been cancelled','<p>Dear {$recipientName},</p><p>We recently opened a new review round for your submission, {$submissionTitle}. We are closing this review round now.</p><p>Occasionally, a decision to open a round of review will be recorded accidentally in our system and we must cancel this review round. I apologize for any confusion this may have caused.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>'),(79,'REVISED_VERSION_NOTIFY','en','Revised Version Notification','Revised Version Uploaded','<p>Dear {$recipientName},</p><p>The author has uploaded revisions for the submission, <b>{$authorsShort} — {$submissionTitle}</b>. <p>As an assigned editor, we ask that you login and <a href=\"{$submissionUrl}\">view the revisions</a> and make a decision to accept, decline or send the submission for further review.</p><br><br>—<br>This is an automated message from <a href=\"{$pressUrl}\">{$pressName}</a>.'),(81,'STATISTICS_REPORT_NOTIFICATION','en','Statistics Report Notification','Editorial activity for {$month}, {$year}','\n{$recipientName}, <br />\n<br />\nYour press health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the press to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published book stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$pressSignature}'),(83,'ANNOUNCEMENT','en','New Announcement','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href=\"{$announcementUrl}\">full announcement</a>.'),(85,'DISCUSSION_NOTIFICATION_SUBMISSION','en','Discussion (Submission)','A message regarding {$pressName}','Please enter your message.'),(87,'DISCUSSION_NOTIFICATION_REVIEW','en','Discussion (Review)','A message regarding {$pressName}','Please enter your message.'),(89,'DISCUSSION_NOTIFICATION_COPYEDITING','en','Discussion (Copyediting)','A message regarding {$pressName}','Please enter your message.'),(91,'DISCUSSION_NOTIFICATION_PRODUCTION','en','Discussion (Production)','A message regarding {$pressName}','Please enter your message.'),(93,'COPYEDIT_REQUEST','en','Request Copyedit','Submission {$submissionId} is ready to be copyedited for {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready to be copyedited:</p><p><a href\"{$submissionUrl}\">{$submissionId} — {$submissionTitle}</a><br />{$pressName}</p><p>Please follow these steps to complete this task:</p><ol><li>Click on the Submission URL below.</li><li>Open any files available under Draft Files and edit the files. Use the Copyediting Discussions area if you need to contact the editor(s) or author(s).</li><li>Save the copyedited file(s) and upload them to the Copyedited panel.</li><li>Use the Copyediting Discussions to notify the editor(s) that all files have been prepared, and that the Production process may begin.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to {$pressName}.</p><p>Kind regards,</p>{$signature}'),(95,'EDITOR_ASSIGN_SUBMISSION','en','Assign Editor','You have been assigned as an editor on a submission to {$pressName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>If you find the submission to be relevant for {$pressName}, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$pressSignature}'),(97,'EDITOR_ASSIGN_REVIEW','en','Assign Editor','You have been assigned as an editor on a submission to {$pressName}',''),(99,'EDITOR_ASSIGN_PRODUCTION','en','Assign Editor','You have been assigned as an editor on a submission to {$pressName}',''),(101,'LAYOUT_REQUEST','en','Ready for Production','Submission {$submissionId} is ready for production at {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready for layout editing:</p><p><a href=\"{$submissionUrl}\">{$submissionId} {$submissionTitle}</a><br />{$pressName}</p><ol><li>Click on the Submission URL above.</li><li>Download the Production Ready files and use them to create the galleys according to the press\'s standards.</li><li>Upload the galleys to the Publication Formats section of the submission.</li><li>Use the Production Discussions to notify the editor that the galleys are ready.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.</p><p>Kind regards,</p>{$signature}'),(103,'LAYOUT_COMPLETE','en','','Galleys Complete','<p>Dear {$recipientName},<p><p>Galleys have now been prepared for the following submission and are ready for final review.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$pressName}</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p><p>{$senderName}</p>'),(105,'INDEX_REQUEST','en','Index Requested','Request Index','{$recipientName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$pressName} now needs indexes created by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and use the Page Proofs file to create the galleys according to press standards.<br />\n3. Send the COMPLETE email to the editor.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.<br />\n<br />\n{$signature}'),(107,'INDEX_COMPLETE','en','Index Completed','Index Galleys Complete','{$recipientName}:<br />\n<br />\nIndexes have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$pressName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signatureFullName}'),(109,'VERSION_CREATED','en','Version Created','A new version was created for {$submissionTitle}','<p>Dear {$recipientName}, </p><p>This is an automated message to inform you that a new version of your submission, {$submissionTitle}, was created. You can view this version from your submission dashboard at the following link:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a></p><hr><p>This is an automatic email sent from <a href=\"{$pressUrl}\">{$pressName}</a>.</p>'),(111,'EDITORIAL_REMINDER','en','Editorial Reminder','Outstanding editorial tasks for {$pressName}','<p>Dear {$recipientName},</p><p>You are currently assigned to {$numberOfSubmissions} submissions in <a href=\"{$pressUrl}\">{$pressName}</a>. The following submissions are <b>waiting for your response</b>.</p>{$outstandingTasks}<p>View all of your assignments in your <a href=\"{$submissionsUrl}\">submission dashboard</a>.</p><p>If you have any questions about your assignments, please contact {$contactName} at {$contactEmail}.</p>'),(113,'SUBMISSION_SAVED_FOR_LATER','en','Submission Saved for Later','Resume your submission to {$pressName}','<p>Dear {$recipientName},</p><p>Your submission details have been saved in our system, but it has not yet been submitted for consideration. You can return to complete your submission at any time by following the link below.</p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — {$submissionTitle}</a></p><hr><p>This is an automated email from <a href=\"{$pressUrl}\">{$pressName}</a>.</p>'),(115,'SUBMISSION_NEEDS_EDITOR','en','Submission Needs Editor','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear {$recipientName},</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"{$pressUrl}\">{$pressName}</a>.</p>'),(117,'MANUAL_PAYMENT_NOTIFICATION','en','','Manual Payment Notification','A manual payment needs to be processed for the press {$pressName} and the user {$senderName} (username &quot;{$senderUsername}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$paymentName}&quot;.<br />\nThe cost is {$paymentAmount} ({$paymentCurrencyCode}).<br />\n<br />\nThis email was generated by the Open Monograph Press Manual Payment plugin.'),(118,'PASSWORD_RESET_CONFIRM','fr_CA','','Confirmation de réinitialisation du mot de passe','Nous avons reçu une requête de réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette requête, veuillez ignorer ce courriel et votre mot de passe demeurera le même. Si vous souhaitez modifier votre mot de passe, cliquez sur l\'adresse URL ci-dessous.<br />\n<br />\nModifier mon mot de passe: {$lostPasswordUrl}<br />\n<br />\n{$siteContactName}'),(119,'USER_REGISTER','fr_CA','','Inscription à la presse','{$recipientName}<br />\n<br />\nVous êtes désormais inscrit à la presse {$pressName}. Ce courriel contient votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin pour tous vos travaux au sein de la presse. Vous pouvez demander que l\'on retire votre nom de la liste des utilisateurs en tout temps. Il suffit de me contacter.<br />\n<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$signature}'),(120,'USER_VALIDATE_CONTEXT','fr_CA','','',''),(121,'USER_VALIDATE_SITE','fr_CA','','',''),(122,'REVIEWER_REGISTER','fr_CA','','Inscription à titre d\'évaluateur pour la presse {$pressName}','En raison de votre expertise, nous avons ajouté votre nom à notre base de données d\'évaluateurs pour la presse {$pressName}. Ceci ne vous oblige à rien, mais nous permet simplement de vous approcher si nous recevons une soumission que vous pourriez évaluer. Après avoir reçu une demande d\'évaluation, vous aurez la possibilité de lire le titre et le résumé de l\'article en question. Vous serez toujours libre d\'accepter ou de refuser l\'invitation. Vous pouvez demander que l\'on retire votre nom de notre liste d\'évaluateurs en tout temps.<br />\n<br />\nVoici votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin dans tous vos échanges avec la presse à travers son site Web. Vous pourriez, par exemple, mettre votre profil à jour, y compris vos champs d\'intérêt en ce qui concerne l\'évaluation des articles.<br />\n<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$signature}'),(123,'SUBMISSION_ACK','fr_CA','','Accusé de réception de la soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$pressName}. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d\'édition en accédant au site Web de la revue :<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$pressSignature}'),(124,'SUBMISSION_ACK_NOT_USER','fr_CA','','Accusé de réception de la soumission','<p>Bonjour,</p><p>Le manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à la revue {$pressName}.</p><p>Si vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à la revue {$pressName} pour la publication de vos travaux.</p><p>Cordialement,</p>{$pressSignature}'),(125,'EDITOR_ASSIGN','fr_CA','','Travail éditorial','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; à la presse {$pressName} vous a été assignée. En tant que rédacteur en chef, vous devrez superviser le processus éditorial de cette soumission.<br />\n<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci,'),(126,'REVIEW_CANCEL','fr_CA','','Annulation de la requête d\'évaluation','{$recipientName}:<br />\n<br />\n<br />\nNous avons décidé d\'annuler notre requête d\'évaluation pour la soumission &quot;{$submissionTitle}&quot; de la presse {$pressName}. Nous vous prions de nous excuser pour tout inconvénient que cette décision pourrait occasionner et nous espérons que vous serez en mesure d\'évaluer une soumission dans un avenir prochain.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à me contacter.'),(127,'REVIEW_REINSTATE','fr_CA','','',''),(128,'REVIEW_RESEND_REQUEST','fr_CA','','',''),(129,'REVIEW_REQUEST','fr_CA','','Requête d\'évaluation d\'un manuscrit','Bonjour {$recipientName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nVeuillez ouvrir une session sur le site Web de la presse d\'ici le {$responseDueDate} pour indiquer si vous serez en mesure d\'évaluer l\'article ou non. Ceci vous permettra également d\'accéder à la soumission, et de saisir votre évaluation et vos recommandations.<br />\n<br />\n<br />\nL\'évaluation doit être terminée d\'ici le {$reviewDueDate}.<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci de votre intérêt à évaluer des articles pour notre presse.<br />\n<br />\n{$signature}<br />\n'),(130,'REVIEW_REQUEST_SUBSEQUENT','fr_CA','','',''),(131,'REVIEW_RESPONSE_OVERDUE_AUTO','fr_CA','','',''),(132,'REVIEW_CONFIRM','fr_CA','','Acceptation d\'évaluation','Rédacteurs-trices,<br />\n<br />\nJe suis en mesure d\'évaluer la soumission intitulée « {$submissionTitle} » pour la revue {$pressName}. Je vous remercie d\'avoir pensé à moi. Je devrais être en mesure de compléter l\'évaluation pour la date du {$reviewDueDate}, voire avant.<br />\n<br />\n{$senderName}'),(133,'REVIEW_DECLINE','fr_CA','','Ne peux pas évaluer','Éditeurs:<br />\n<br />\nMalheureusement, je ne pourrai pas évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Merci de m\'avoir invité à évaluer cet article et n\'hésitez pas à me contacter dans un avenir prochain.<br />\n<br />\n{$senderName}'),(134,'REVIEW_ACK','fr_CA','','Accusé de réception de l\'évaluation d\'une soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir évalué la soumission intitulée « {$submissionTitle} » pour la revue {$pressName}. Nous vous sommes reconnaissants de votre contribution à la qualité des travaux que nous publions.'),(135,'REVIEW_REMIND','fr_CA','','Rappel d\'évaluation','{$recipientName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoyés par courriel. {$lostPasswordUrl}<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Nous vous prions d\'agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$signature}'),(136,'REVIEW_REMIND_AUTO','fr_CA','','Rappel d\'évaluation','{$recipientName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Ce courriel a été généré et envoyé automatiquement parce que vous avez dépassé la date d\'échéance. Toutefois, nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoyés par courriel. {$lostPasswordUrl}<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Veuillez agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$pressSignature}'),(137,'REVIEW_COMPLETE','fr_CA','','',''),(138,'REVIEW_EDIT','fr_CA','','',''),(139,'EDITOR_DECISION_ACCEPT','fr_CA','','Décision du rédacteur en chef','{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$pressName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}'),(140,'EDITOR_DECISION_SEND_TO_INTERNAL','fr_CA','','',''),(141,'EDITOR_DECISION_SEND_TO_EXTERNAL','fr_CA','','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est d\'envoyer votre soumission en évaluation.<br />\n<br />\nURL de la soumission : {$submissionUrl}'),(142,'EDITOR_DECISION_SEND_TO_PRODUCTION','fr_CA','','Décision du rédacteur','{$authors},<br />\n<br />\nL\'édition de votre soumission « {$submissionTitle} » est complétée. Nous l\'envoyons maintenant en production.<br />\n<br />\nURL de la soumission : {$submissionUrl}'),(143,'EDITOR_DECISION_REVISIONS','fr_CA','','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de vous demander d\'apporter des révisions à votre soumission.'),(144,'EDITOR_DECISION_RESUBMIT','fr_CA','','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de vous demander d\'apporter des révisions à votre soumission et de la soumettre à nouveau.'),(145,'EDITOR_DECISION_DECLINE','fr_CA','','Décision du rédacteur','{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de refuser votre soumission.'),(146,'EDITOR_DECISION_INITIAL_DECLINE','fr_CA','','Décision du rédacteur','\n			{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à  la revue {$pressName}.<br />\n<br />\nNotre décision est de refuser votre soumission.'),(147,'EDITOR_RECOMMENDATION','fr_CA','','Recommandation du rédacteur','{$editors},<br />\n<br />\nLa recommandation concernant la soumission « {$submissionTitle} » à la revue {$pressName} est de : {$recommendation}'),(148,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','fr_CA','','',''),(149,'EDITOR_DECISION_NOTIFY_REVIEWERS','fr_CA','','',''),(150,'EDITOR_DECISION_NEW_ROUND','fr_CA','','',''),(151,'EDITOR_DECISION_REVERT_DECLINE','fr_CA','','',''),(152,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','fr_CA','','',''),(153,'EDITOR_DECISION_SKIP_REVIEW','fr_CA','','',''),(154,'EDITOR_DECISION_BACK_FROM_PRODUCTION','fr_CA','','',''),(155,'EDITOR_DECISION_BACK_FROM_COPYEDITING','fr_CA','','',''),(156,'EDITOR_DECISION_CANCEL_REVIEW_ROUND','fr_CA','','',''),(157,'REVISED_VERSION_NOTIFY','fr_CA','','',''),(158,'STATISTICS_REPORT_NOTIFICATION','fr_CA','','',''),(159,'ANNOUNCEMENT','fr_CA','','',''),(160,'DISCUSSION_NOTIFICATION_SUBMISSION','fr_CA','','Un message à propos de la revue {$pressName}','Prière de saisir votre message.'),(161,'DISCUSSION_NOTIFICATION_REVIEW','fr_CA','','Un message à propos de la revue {$pressName}','Prière de saisir votre message.'),(162,'DISCUSSION_NOTIFICATION_COPYEDITING','fr_CA','','Un message à propos de la revue {$pressName}','Prière de saisir votre message.'),(163,'DISCUSSION_NOTIFICATION_PRODUCTION','fr_CA','','Un message à propos de la revue {$pressName}','Prière de saisir votre message.'),(164,'COPYEDIT_REQUEST','fr_CA','','Demande de révision d\'une soumission','{$recipientName},<br />\n<br />\nJ\'aimerais que vous effectuiez la révision du manuscrit intitulé « {$submissionTitle} » pour la revue {$pressName} à l\'aide des étapes suivantes.<br />\n1. Cliquer sur l\'URL de la soumission ci-dessous.<br />\n2. Ouvrir le(s) fichier(s) disponible(s) sous Fichiers des ébauches finales et effectuer votre révision, tout en ajoutant des discussions sur la révision, le cas échéant.<br />\n3. Enregistrer le(s) fichier(s) révisé(s) et le(s) téléverser dans la section Version(s) révisée(s).<br />\n4. Informer le,la rédacteur-trice que tous les fichiers ont été révisés et que l\'étape de production peut débuter.<br />\n<br />\nURL de la revue {$pressName} : {$pressUrl}<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}'),(165,'EDITOR_ASSIGN_SUBMISSION','fr_CA','','Travail éditorial','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; à la presse {$pressName} vous a été assignée. En tant que rédacteur en chef, vous devrez superviser le processus éditorial de cette soumission.<br />\n<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci,'),(166,'EDITOR_ASSIGN_REVIEW','fr_CA','','Travail éditorial',''),(167,'EDITOR_ASSIGN_PRODUCTION','fr_CA','','Travail éditorial',''),(168,'LAYOUT_REQUEST','fr_CA','','Requête des épreuves en placard','{$recipientName}:<br />\n<br />\nIl faut maintenant préparer les épreuves en placard de la soumission &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Pour ce faire, veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez le fichier Version de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir contribué à cette presse.'),(169,'LAYOUT_COMPLETE','fr_CA','','Épreuves en placard complétées','{$recipientName}:<br />\n<br />\nLes épreuves en placard du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$pressName} ont été préparées et peuvent être révisées.<br />\n<br />\nSi vous avez questions, n\'hésitez pas à me contacter.<br />\n<br />\n{$senderName}'),(170,'INDEX_REQUEST','fr_CA','','Requête d\'indexage','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; par la presse {$pressName} doit désormais être indexée. Veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez les fichiers d\'épreuves de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir contribué à cette presse.<br />\n<br />\n{$signature}'),(171,'INDEX_COMPLETE','fr_CA','','Indexage des épreuves en placard complété','{$recipientName}:<br />\n<br />\nLes index du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$pressName} sont prêts et peuvent être révisés.<br />\n<br />\nSi vous avez questions, n\'hésitez pas à me contacter.<br />\n<br />\n{$signatureFullName}'),(172,'VERSION_CREATED','fr_CA','','',''),(173,'EDITORIAL_REMINDER','fr_CA','','',''),(174,'SUBMISSION_SAVED_FOR_LATER','fr_CA','','',''),(175,'SUBMISSION_NEEDS_EDITOR','fr_CA','','','');
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
  `setting_value` mediumtext,
  PRIMARY KEY (`email_template_setting_id`),
  UNIQUE KEY `email_templates_settings_unique` (`email_id`,`locale`,`setting_name`),
  KEY `email_templates_settings_email_id` (`email_id`),
  CONSTRAINT `email_templates_settings_email_id` FOREIGN KEY (`email_id`) REFERENCES `email_templates` (`email_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about custom email templates, including localized properties such as the subject and body.';
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
  `user_id` bigint(20) NOT NULL,
  `date_logged` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `message` text,
  `is_translated` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `event_log_user_id` (`user_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `event_log_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=612 DEFAULT CHARSET=utf8 COMMENT='A log of all events related to an object like a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,19,'2023-03-28 23:22:27',268435458,'submission.event.general.metadataUpdated',0),(2,1048585,1,19,'2023-03-28 23:22:28',268435458,'submission.event.general.metadataUpdated',0),(3,515,1,19,'2023-03-28 23:22:31',1342177281,'submission.event.fileUploaded',0),(4,1048585,1,19,'2023-03-28 23:22:31',1342177288,'submission.event.fileRevised',0),(5,515,1,19,'2023-03-28 23:22:32',1342177296,'submission.event.fileEdited',0),(6,1048585,1,19,'2023-03-28 23:22:32',1342177296,'submission.event.fileEdited',0),(7,515,2,19,'2023-03-28 23:22:32',1342177281,'submission.event.fileUploaded',0),(8,1048585,1,19,'2023-03-28 23:22:32',1342177288,'submission.event.fileRevised',0),(9,515,2,19,'2023-03-28 23:22:33',1342177296,'submission.event.fileEdited',0),(10,1048585,1,19,'2023-03-28 23:22:33',1342177296,'submission.event.fileEdited',0),(11,515,3,19,'2023-03-28 23:22:34',1342177281,'submission.event.fileUploaded',0),(12,1048585,1,19,'2023-03-28 23:22:34',1342177288,'submission.event.fileRevised',0),(13,515,3,19,'2023-03-28 23:22:34',1342177296,'submission.event.fileEdited',0),(14,1048585,1,19,'2023-03-28 23:22:34',1342177296,'submission.event.fileEdited',0),(15,1048585,1,19,'2023-03-28 23:22:53',268435457,'submission.event.submissionSubmitted',0),(16,1048585,1,3,'2023-03-28 23:23:07',805306371,'editor.submission.decision.sendExternalReview.log',0),(17,515,4,3,'2023-03-28 23:23:08',1342177281,'submission.event.fileUploaded',0),(18,1048585,1,3,'2023-03-28 23:23:08',1342177288,'submission.event.fileRevised',0),(19,515,5,3,'2023-03-28 23:23:08',1342177281,'submission.event.fileUploaded',0),(20,1048585,1,3,'2023-03-28 23:23:08',1342177288,'submission.event.fileRevised',0),(21,515,6,3,'2023-03-28 23:23:08',1342177281,'submission.event.fileUploaded',0),(22,1048585,1,3,'2023-03-28 23:23:08',1342177288,'submission.event.fileRevised',0),(23,1048585,1,3,'2023-03-28 23:23:19',1073741825,'log.review.reviewerAssigned',0),(24,1048585,1,3,'2023-03-28 23:23:25',805306371,'editor.submission.decision.accept.log',0),(25,1048585,1,3,'2023-03-28 23:23:34',268435459,'submission.event.participantAdded',0),(26,1048585,2,20,'2023-03-28 23:23:47',268435458,'submission.event.general.metadataUpdated',0),(27,1048585,2,20,'2023-03-28 23:23:47',268435458,'submission.event.general.metadataUpdated',0),(28,1048585,2,20,'2023-03-28 23:24:00',268435458,'submission.event.general.metadataUpdated',0),(29,515,7,20,'2023-03-28 23:24:01',1342177281,'submission.event.fileUploaded',0),(30,1048585,2,20,'2023-03-28 23:24:01',1342177288,'submission.event.fileRevised',0),(31,515,7,20,'2023-03-28 23:24:01',1342177296,'submission.event.fileEdited',0),(32,1048585,2,20,'2023-03-28 23:24:01',1342177296,'submission.event.fileEdited',0),(33,515,8,20,'2023-03-28 23:24:02',1342177281,'submission.event.fileUploaded',0),(34,1048585,2,20,'2023-03-28 23:24:02',1342177288,'submission.event.fileRevised',0),(35,515,8,20,'2023-03-28 23:24:02',1342177296,'submission.event.fileEdited',0),(36,1048585,2,20,'2023-03-28 23:24:02',1342177296,'submission.event.fileEdited',0),(37,515,9,20,'2023-03-28 23:24:03',1342177281,'submission.event.fileUploaded',0),(38,1048585,2,20,'2023-03-28 23:24:03',1342177288,'submission.event.fileRevised',0),(39,515,9,20,'2023-03-28 23:24:04',1342177296,'submission.event.fileEdited',0),(40,1048585,2,20,'2023-03-28 23:24:04',1342177296,'submission.event.fileEdited',0),(41,515,10,20,'2023-03-28 23:24:04',1342177281,'submission.event.fileUploaded',0),(42,1048585,2,20,'2023-03-28 23:24:04',1342177288,'submission.event.fileRevised',0),(43,515,10,20,'2023-03-28 23:24:05',1342177296,'submission.event.fileEdited',0),(44,1048585,2,20,'2023-03-28 23:24:05',1342177296,'submission.event.fileEdited',0),(45,515,11,20,'2023-03-28 23:24:06',1342177281,'submission.event.fileUploaded',0),(46,1048585,2,20,'2023-03-28 23:24:06',1342177288,'submission.event.fileRevised',0),(47,515,11,20,'2023-03-28 23:24:06',1342177296,'submission.event.fileEdited',0),(48,1048585,2,20,'2023-03-28 23:24:06',1342177296,'submission.event.fileEdited',0),(49,515,11,20,'2023-03-28 23:24:07',1342177282,'submission.event.fileDeleted',0),(50,1048585,2,20,'2023-03-28 23:26:00',268435457,'submission.event.submissionSubmitted',0),(51,1048585,2,3,'2023-03-28 23:26:30',805306371,'editor.submission.decision.sendExternalReview.log',0),(52,515,12,3,'2023-03-28 23:26:30',1342177281,'submission.event.fileUploaded',0),(53,1048585,2,3,'2023-03-28 23:26:30',1342177288,'submission.event.fileRevised',0),(54,515,13,3,'2023-03-28 23:26:31',1342177281,'submission.event.fileUploaded',0),(55,1048585,2,3,'2023-03-28 23:26:31',1342177288,'submission.event.fileRevised',0),(56,515,14,3,'2023-03-28 23:26:31',1342177281,'submission.event.fileUploaded',0),(57,1048585,2,3,'2023-03-28 23:26:31',1342177288,'submission.event.fileRevised',0),(58,515,15,3,'2023-03-28 23:26:31',1342177281,'submission.event.fileUploaded',0),(59,1048585,2,3,'2023-03-28 23:26:31',1342177288,'submission.event.fileRevised',0),(60,1048585,2,3,'2023-03-28 23:26:46',1073741825,'log.review.reviewerAssigned',0),(61,1048585,2,3,'2023-03-28 23:26:56',1073741825,'log.review.reviewerAssigned',0),(62,1048585,3,21,'2023-03-28 23:27:07',268435458,'submission.event.general.metadataUpdated',0),(63,1048585,3,21,'2023-03-28 23:27:08',268435458,'submission.event.general.metadataUpdated',0),(64,515,16,21,'2023-03-28 23:27:11',1342177281,'submission.event.fileUploaded',0),(65,1048585,3,21,'2023-03-28 23:27:11',1342177288,'submission.event.fileRevised',0),(66,515,16,21,'2023-03-28 23:27:12',1342177296,'submission.event.fileEdited',0),(67,1048585,3,21,'2023-03-28 23:27:12',1342177296,'submission.event.fileEdited',0),(68,515,17,21,'2023-03-28 23:27:13',1342177281,'submission.event.fileUploaded',0),(69,1048585,3,21,'2023-03-28 23:27:13',1342177288,'submission.event.fileRevised',0),(70,515,17,21,'2023-03-28 23:27:13',1342177296,'submission.event.fileEdited',0),(71,1048585,3,21,'2023-03-28 23:27:13',1342177296,'submission.event.fileEdited',0),(72,515,18,21,'2023-03-28 23:27:14',1342177281,'submission.event.fileUploaded',0),(73,1048585,3,21,'2023-03-28 23:27:14',1342177288,'submission.event.fileRevised',0),(74,515,18,21,'2023-03-28 23:27:14',1342177296,'submission.event.fileEdited',0),(75,1048585,3,21,'2023-03-28 23:27:14',1342177296,'submission.event.fileEdited',0),(76,515,19,21,'2023-03-28 23:27:15',1342177281,'submission.event.fileUploaded',0),(77,1048585,3,21,'2023-03-28 23:27:15',1342177288,'submission.event.fileRevised',0),(78,515,19,21,'2023-03-28 23:27:15',1342177296,'submission.event.fileEdited',0),(79,1048585,3,21,'2023-03-28 23:27:15',1342177296,'submission.event.fileEdited',0),(80,515,20,21,'2023-03-28 23:27:16',1342177281,'submission.event.fileUploaded',0),(81,1048585,3,21,'2023-03-28 23:27:16',1342177288,'submission.event.fileRevised',0),(82,515,20,21,'2023-03-28 23:27:17',1342177296,'submission.event.fileEdited',0),(83,1048585,3,21,'2023-03-28 23:27:17',1342177296,'submission.event.fileEdited',0),(84,1048585,3,21,'2023-03-28 23:27:53',268435457,'submission.event.submissionSubmitted',0),(85,1048585,4,22,'2023-03-28 23:28:04',268435458,'submission.event.general.metadataUpdated',0),(86,1048585,4,22,'2023-03-28 23:28:04',268435458,'submission.event.general.metadataUpdated',0),(87,515,21,22,'2023-03-28 23:28:08',1342177281,'submission.event.fileUploaded',0),(88,1048585,4,22,'2023-03-28 23:28:08',1342177288,'submission.event.fileRevised',0),(89,515,21,22,'2023-03-28 23:28:08',1342177296,'submission.event.fileEdited',0),(90,1048585,4,22,'2023-03-28 23:28:08',1342177296,'submission.event.fileEdited',0),(91,515,22,22,'2023-03-28 23:28:09',1342177281,'submission.event.fileUploaded',0),(92,1048585,4,22,'2023-03-28 23:28:09',1342177288,'submission.event.fileRevised',0),(93,515,22,22,'2023-03-28 23:28:09',1342177296,'submission.event.fileEdited',0),(94,1048585,4,22,'2023-03-28 23:28:09',1342177296,'submission.event.fileEdited',0),(95,515,23,22,'2023-03-28 23:28:10',1342177281,'submission.event.fileUploaded',0),(96,1048585,4,22,'2023-03-28 23:28:10',1342177288,'submission.event.fileRevised',0),(97,515,23,22,'2023-03-28 23:28:10',1342177296,'submission.event.fileEdited',0),(98,1048585,4,22,'2023-03-28 23:28:10',1342177296,'submission.event.fileEdited',0),(99,515,24,22,'2023-03-28 23:28:11',1342177281,'submission.event.fileUploaded',0),(100,1048585,4,22,'2023-03-28 23:28:11',1342177288,'submission.event.fileRevised',0),(101,515,24,22,'2023-03-28 23:28:11',1342177296,'submission.event.fileEdited',0),(102,1048585,4,22,'2023-03-28 23:28:11',1342177296,'submission.event.fileEdited',0),(103,1048585,4,22,'2023-03-28 23:28:42',268435457,'submission.event.submissionSubmitted',0),(104,1048585,4,3,'2023-03-28 23:28:57',805306371,'editor.submission.decision.sendInternalReview.log',0),(105,515,25,3,'2023-03-28 23:28:57',1342177281,'submission.event.fileUploaded',0),(106,1048585,4,3,'2023-03-28 23:28:57',1342177288,'submission.event.fileRevised',0),(107,515,26,3,'2023-03-28 23:28:57',1342177281,'submission.event.fileUploaded',0),(108,1048585,4,3,'2023-03-28 23:28:57',1342177288,'submission.event.fileRevised',0),(109,515,27,3,'2023-03-28 23:28:58',1342177281,'submission.event.fileUploaded',0),(110,1048585,4,3,'2023-03-28 23:28:58',1342177288,'submission.event.fileRevised',0),(111,515,28,3,'2023-03-28 23:28:58',1342177281,'submission.event.fileUploaded',0),(112,1048585,4,3,'2023-03-28 23:28:58',1342177288,'submission.event.fileRevised',0),(113,1048585,4,3,'2023-03-28 23:29:09',1073741825,'log.review.reviewerAssigned',0),(114,1048585,4,3,'2023-03-28 23:29:15',805306371,'editor.submission.decision.sendExternalReview.log',0),(115,1048585,4,3,'2023-03-28 23:29:27',1073741825,'log.review.reviewerAssigned',0),(116,1048585,4,3,'2023-03-28 23:29:33',805306371,'editor.submission.decision.accept.log',0),(117,1048585,4,3,'2023-03-28 23:29:45',268435459,'submission.event.participantAdded',0),(118,1048585,4,3,'2023-03-28 23:29:53',805306371,'editor.submission.decision.sendToProduction.log',0),(119,1048585,4,3,'2023-03-28 23:30:04',268435459,'submission.event.participantAdded',0),(120,1048585,4,3,'2023-03-28 23:30:12',268435474,'submission.event.publicationFormatCreated',0),(121,1048585,5,23,'2023-03-28 23:30:21',268435458,'submission.event.general.metadataUpdated',0),(122,1048585,5,23,'2023-03-28 23:30:22',268435458,'submission.event.general.metadataUpdated',0),(123,515,29,23,'2023-03-28 23:30:26',1342177281,'submission.event.fileUploaded',0),(124,1048585,5,23,'2023-03-28 23:30:26',1342177288,'submission.event.fileRevised',0),(125,515,29,23,'2023-03-28 23:30:26',1342177296,'submission.event.fileEdited',0),(126,1048585,5,23,'2023-03-28 23:30:26',1342177296,'submission.event.fileEdited',0),(127,515,30,23,'2023-03-28 23:30:27',1342177281,'submission.event.fileUploaded',0),(128,1048585,5,23,'2023-03-28 23:30:27',1342177288,'submission.event.fileRevised',0),(129,515,30,23,'2023-03-28 23:30:27',1342177296,'submission.event.fileEdited',0),(130,1048585,5,23,'2023-03-28 23:30:27',1342177296,'submission.event.fileEdited',0),(131,515,31,23,'2023-03-28 23:30:28',1342177281,'submission.event.fileUploaded',0),(132,1048585,5,23,'2023-03-28 23:30:28',1342177288,'submission.event.fileRevised',0),(133,515,31,23,'2023-03-28 23:30:28',1342177296,'submission.event.fileEdited',0),(134,1048585,5,23,'2023-03-28 23:30:28',1342177296,'submission.event.fileEdited',0),(135,515,32,23,'2023-03-28 23:30:29',1342177281,'submission.event.fileUploaded',0),(136,1048585,5,23,'2023-03-28 23:30:29',1342177288,'submission.event.fileRevised',0),(137,515,32,23,'2023-03-28 23:30:29',1342177296,'submission.event.fileEdited',0),(138,1048585,5,23,'2023-03-28 23:30:29',1342177296,'submission.event.fileEdited',0),(139,515,33,23,'2023-03-28 23:30:30',1342177281,'submission.event.fileUploaded',0),(140,1048585,5,23,'2023-03-28 23:30:30',1342177288,'submission.event.fileRevised',0),(141,515,33,23,'2023-03-28 23:30:31',1342177296,'submission.event.fileEdited',0),(142,1048585,5,23,'2023-03-28 23:30:31',1342177296,'submission.event.fileEdited',0),(143,515,34,23,'2023-03-28 23:30:31',1342177281,'submission.event.fileUploaded',0),(144,1048585,5,23,'2023-03-28 23:30:31',1342177288,'submission.event.fileRevised',0),(145,515,34,23,'2023-03-28 23:30:32',1342177296,'submission.event.fileEdited',0),(146,1048585,5,23,'2023-03-28 23:30:32',1342177296,'submission.event.fileEdited',0),(147,1048585,5,23,'2023-03-28 23:31:16',268435457,'submission.event.submissionSubmitted',0),(148,1048585,5,3,'2023-03-28 23:31:34',805306371,'editor.submission.decision.sendInternalReview.log',0),(149,515,35,3,'2023-03-28 23:31:35',1342177281,'submission.event.fileUploaded',0),(150,1048585,5,3,'2023-03-28 23:31:35',1342177288,'submission.event.fileRevised',0),(151,515,36,3,'2023-03-28 23:31:35',1342177281,'submission.event.fileUploaded',0),(152,1048585,5,3,'2023-03-28 23:31:35',1342177288,'submission.event.fileRevised',0),(153,515,37,3,'2023-03-28 23:31:35',1342177281,'submission.event.fileUploaded',0),(154,1048585,5,3,'2023-03-28 23:31:35',1342177288,'submission.event.fileRevised',0),(155,515,38,3,'2023-03-28 23:31:35',1342177281,'submission.event.fileUploaded',0),(156,1048585,5,3,'2023-03-28 23:31:35',1342177288,'submission.event.fileRevised',0),(157,515,39,3,'2023-03-28 23:31:35',1342177281,'submission.event.fileUploaded',0),(158,1048585,5,3,'2023-03-28 23:31:35',1342177288,'submission.event.fileRevised',0),(159,515,40,3,'2023-03-28 23:31:35',1342177281,'submission.event.fileUploaded',0),(160,1048585,5,3,'2023-03-28 23:31:35',1342177288,'submission.event.fileRevised',0),(161,1048585,5,3,'2023-03-28 23:31:46',1073741825,'log.review.reviewerAssigned',0),(162,1048585,5,3,'2023-03-28 23:31:53',805306371,'editor.submission.decision.sendExternalReview.log',0),(163,1048585,5,3,'2023-03-28 23:32:05',1073741825,'log.review.reviewerAssigned',0),(164,1048585,5,3,'2023-03-28 23:32:12',805306371,'editor.submission.decision.accept.log',0),(165,1048585,5,3,'2023-03-28 23:32:23',268435459,'submission.event.participantAdded',0),(166,1048585,5,3,'2023-03-28 23:32:32',805306371,'editor.submission.decision.sendToProduction.log',0),(167,1048585,5,3,'2023-03-28 23:32:44',268435459,'submission.event.participantAdded',0),(168,1048585,5,3,'2023-03-28 23:32:51',268435459,'submission.event.participantAdded',0),(169,1048585,5,3,'2023-03-28 23:32:58',268435474,'submission.event.publicationFormatCreated',0),(170,515,41,3,'2023-03-28 23:33:01',1342177281,'submission.event.fileUploaded',0),(171,1048585,5,3,'2023-03-28 23:33:01',1342177288,'submission.event.fileRevised',0),(172,1048585,5,3,'2023-03-28 23:33:04',268435464,'submission.event.publicationFormatPublished',0),(173,1048585,5,3,'2023-03-28 23:33:07',268435476,'submission.event.publicationFormatMadeAvailable',0),(174,515,41,3,'2023-03-28 23:33:09',1342177296,'submission.event.fileEdited',0),(175,1048585,5,3,'2023-03-28 23:33:09',1342177296,'submission.event.fileEdited',0),(176,515,41,3,'2023-03-28 23:33:09',1342177287,'submission.event.signoffSignoff',0),(177,515,41,3,'2023-03-28 23:33:12',1342177296,'submission.event.fileEdited',0),(178,1048585,5,3,'2023-03-28 23:33:12',1342177296,'submission.event.fileEdited',0),(179,1048585,5,3,'2023-03-28 23:33:15',268435462,'publication.event.published',0),(180,1048585,5,3,'2023-03-28 23:33:26',268435463,'publication.event.unpublished',0),(181,1048585,5,3,'2023-03-28 23:33:36',268435462,'publication.event.published',0),(182,1048585,6,24,'2023-03-28 23:33:46',268435458,'submission.event.general.metadataUpdated',0),(183,1048585,6,24,'2023-03-28 23:33:46',268435458,'submission.event.general.metadataUpdated',0),(184,515,42,24,'2023-03-28 23:33:50',1342177281,'submission.event.fileUploaded',0),(185,1048585,6,24,'2023-03-28 23:33:50',1342177288,'submission.event.fileRevised',0),(186,515,42,24,'2023-03-28 23:33:50',1342177296,'submission.event.fileEdited',0),(187,1048585,6,24,'2023-03-28 23:33:50',1342177296,'submission.event.fileEdited',0),(188,515,43,24,'2023-03-28 23:33:51',1342177281,'submission.event.fileUploaded',0),(189,1048585,6,24,'2023-03-28 23:33:51',1342177288,'submission.event.fileRevised',0),(190,515,43,24,'2023-03-28 23:33:51',1342177296,'submission.event.fileEdited',0),(191,1048585,6,24,'2023-03-28 23:33:51',1342177296,'submission.event.fileEdited',0),(192,515,44,24,'2023-03-28 23:33:52',1342177281,'submission.event.fileUploaded',0),(193,1048585,6,24,'2023-03-28 23:33:52',1342177288,'submission.event.fileRevised',0),(194,515,44,24,'2023-03-28 23:33:52',1342177296,'submission.event.fileEdited',0),(195,1048585,6,24,'2023-03-28 23:33:52',1342177296,'submission.event.fileEdited',0),(196,515,45,24,'2023-03-28 23:33:53',1342177281,'submission.event.fileUploaded',0),(197,1048585,6,24,'2023-03-28 23:33:53',1342177288,'submission.event.fileRevised',0),(198,515,45,24,'2023-03-28 23:33:53',1342177296,'submission.event.fileEdited',0),(199,1048585,6,24,'2023-03-28 23:33:53',1342177296,'submission.event.fileEdited',0),(200,1048585,6,24,'2023-03-28 23:34:22',268435457,'submission.event.submissionSubmitted',0),(201,1048585,6,3,'2023-03-28 23:34:38',805306371,'editor.submission.decision.sendInternalReview.log',0),(202,515,46,3,'2023-03-28 23:34:38',1342177281,'submission.event.fileUploaded',0),(203,1048585,6,3,'2023-03-28 23:34:38',1342177288,'submission.event.fileRevised',0),(204,515,47,3,'2023-03-28 23:34:38',1342177281,'submission.event.fileUploaded',0),(205,1048585,6,3,'2023-03-28 23:34:38',1342177288,'submission.event.fileRevised',0),(206,515,48,3,'2023-03-28 23:34:38',1342177281,'submission.event.fileUploaded',0),(207,1048585,6,3,'2023-03-28 23:34:38',1342177288,'submission.event.fileRevised',0),(208,515,49,3,'2023-03-28 23:34:38',1342177281,'submission.event.fileUploaded',0),(209,1048585,6,3,'2023-03-28 23:34:38',1342177288,'submission.event.fileRevised',0),(210,1048585,6,3,'2023-03-28 23:34:48',268435459,'submission.event.participantAdded',0),(211,1048585,6,3,'2023-03-28 23:34:54',268435459,'submission.event.participantAdded',0),(212,1048585,6,6,'2023-03-28 23:35:10',805306372,'editor.submission.recommend.accept.log',0),(213,1048585,7,25,'2023-03-28 23:35:34',268435458,'submission.event.general.metadataUpdated',0),(214,1048585,7,25,'2023-03-28 23:35:35',268435458,'submission.event.general.metadataUpdated',0),(215,515,50,25,'2023-03-28 23:35:38',1342177281,'submission.event.fileUploaded',0),(216,1048585,7,25,'2023-03-28 23:35:38',1342177288,'submission.event.fileRevised',0),(217,515,50,25,'2023-03-28 23:35:39',1342177296,'submission.event.fileEdited',0),(218,1048585,7,25,'2023-03-28 23:35:39',1342177296,'submission.event.fileEdited',0),(219,515,51,25,'2023-03-28 23:35:39',1342177281,'submission.event.fileUploaded',0),(220,1048585,7,25,'2023-03-28 23:35:39',1342177288,'submission.event.fileRevised',0),(221,515,51,25,'2023-03-28 23:35:40',1342177296,'submission.event.fileEdited',0),(222,1048585,7,25,'2023-03-28 23:35:40',1342177296,'submission.event.fileEdited',0),(223,515,52,25,'2023-03-28 23:35:41',1342177281,'submission.event.fileUploaded',0),(224,1048585,7,25,'2023-03-28 23:35:41',1342177288,'submission.event.fileRevised',0),(225,515,52,25,'2023-03-28 23:35:41',1342177296,'submission.event.fileEdited',0),(226,1048585,7,25,'2023-03-28 23:35:41',1342177296,'submission.event.fileEdited',0),(227,515,53,25,'2023-03-28 23:35:42',1342177281,'submission.event.fileUploaded',0),(228,1048585,7,25,'2023-03-28 23:35:42',1342177288,'submission.event.fileRevised',0),(229,515,53,25,'2023-03-28 23:35:42',1342177296,'submission.event.fileEdited',0),(230,1048585,7,25,'2023-03-28 23:35:42',1342177296,'submission.event.fileEdited',0),(231,515,54,25,'2023-03-28 23:35:43',1342177281,'submission.event.fileUploaded',0),(232,1048585,7,25,'2023-03-28 23:35:43',1342177288,'submission.event.fileRevised',0),(233,515,54,25,'2023-03-28 23:35:43',1342177296,'submission.event.fileEdited',0),(234,1048585,7,25,'2023-03-28 23:35:43',1342177296,'submission.event.fileEdited',0),(235,1048585,7,25,'2023-03-28 23:36:22',268435457,'submission.event.submissionSubmitted',0),(236,1048585,7,3,'2023-03-28 23:36:39',805306371,'editor.submission.decision.sendExternalReview.log',0),(237,515,55,3,'2023-03-28 23:36:39',1342177281,'submission.event.fileUploaded',0),(238,1048585,7,3,'2023-03-28 23:36:39',1342177288,'submission.event.fileRevised',0),(239,515,56,3,'2023-03-28 23:36:39',1342177281,'submission.event.fileUploaded',0),(240,1048585,7,3,'2023-03-28 23:36:39',1342177288,'submission.event.fileRevised',0),(241,515,57,3,'2023-03-28 23:36:40',1342177281,'submission.event.fileUploaded',0),(242,1048585,7,3,'2023-03-28 23:36:40',1342177288,'submission.event.fileRevised',0),(243,515,58,3,'2023-03-28 23:36:40',1342177281,'submission.event.fileUploaded',0),(244,1048585,7,3,'2023-03-28 23:36:40',1342177288,'submission.event.fileRevised',0),(245,515,59,3,'2023-03-28 23:36:40',1342177281,'submission.event.fileUploaded',0),(246,1048585,7,3,'2023-03-28 23:36:40',1342177288,'submission.event.fileRevised',0),(247,1048585,7,3,'2023-03-28 23:36:51',1073741825,'log.review.reviewerAssigned',0),(248,1048585,7,3,'2023-03-28 23:36:59',805306371,'editor.submission.decision.accept.log',0),(249,1048585,7,3,'2023-03-28 23:37:10',268435459,'submission.event.participantAdded',0),(250,1048585,8,3,'2023-03-28 23:37:22',268435458,'submission.event.general.metadataUpdated',0),(251,515,60,3,'2023-03-28 23:37:25',1342177281,'submission.event.fileUploaded',0),(252,1048585,8,3,'2023-03-28 23:37:25',1342177288,'submission.event.fileRevised',0),(253,515,60,3,'2023-03-28 23:37:25',1342177296,'submission.event.fileEdited',0),(254,1048585,8,3,'2023-03-28 23:37:25',1342177296,'submission.event.fileEdited',0),(255,1048585,8,3,'2023-03-28 23:37:26',268435457,'submission.event.submissionSubmitted',0),(256,1048585,9,26,'2023-03-28 23:37:35',268435458,'submission.event.general.metadataUpdated',0),(257,1048585,9,26,'2023-03-28 23:37:35',268435458,'submission.event.general.metadataUpdated',0),(258,515,61,26,'2023-03-28 23:37:39',1342177281,'submission.event.fileUploaded',0),(259,1048585,9,26,'2023-03-28 23:37:39',1342177288,'submission.event.fileRevised',0),(260,515,61,26,'2023-03-28 23:37:39',1342177296,'submission.event.fileEdited',0),(261,1048585,9,26,'2023-03-28 23:37:39',1342177296,'submission.event.fileEdited',0),(262,515,62,26,'2023-03-28 23:37:40',1342177281,'submission.event.fileUploaded',0),(263,1048585,9,26,'2023-03-28 23:37:40',1342177288,'submission.event.fileRevised',0),(264,515,62,26,'2023-03-28 23:37:40',1342177296,'submission.event.fileEdited',0),(265,1048585,9,26,'2023-03-28 23:37:40',1342177296,'submission.event.fileEdited',0),(266,515,63,26,'2023-03-28 23:37:41',1342177281,'submission.event.fileUploaded',0),(267,1048585,9,26,'2023-03-28 23:37:41',1342177288,'submission.event.fileRevised',0),(268,515,63,26,'2023-03-28 23:37:41',1342177296,'submission.event.fileEdited',0),(269,1048585,9,26,'2023-03-28 23:37:41',1342177296,'submission.event.fileEdited',0),(270,515,64,26,'2023-03-28 23:37:42',1342177281,'submission.event.fileUploaded',0),(271,1048585,9,26,'2023-03-28 23:37:42',1342177288,'submission.event.fileRevised',0),(272,515,64,26,'2023-03-28 23:37:43',1342177296,'submission.event.fileEdited',0),(273,1048585,9,26,'2023-03-28 23:37:43',1342177296,'submission.event.fileEdited',0),(274,515,65,26,'2023-03-28 23:37:44',1342177281,'submission.event.fileUploaded',0),(275,1048585,9,26,'2023-03-28 23:37:44',1342177288,'submission.event.fileRevised',0),(276,515,65,26,'2023-03-28 23:37:44',1342177296,'submission.event.fileEdited',0),(277,1048585,9,26,'2023-03-28 23:37:44',1342177296,'submission.event.fileEdited',0),(278,1048585,9,26,'2023-03-28 23:38:22',268435457,'submission.event.submissionSubmitted',0),(279,1048585,9,3,'2023-03-28 23:38:40',805306371,'editor.submission.decision.sendInternalReview.log',0),(280,515,66,3,'2023-03-28 23:38:41',1342177281,'submission.event.fileUploaded',0),(281,1048585,9,3,'2023-03-28 23:38:41',1342177288,'submission.event.fileRevised',0),(282,515,67,3,'2023-03-28 23:38:41',1342177281,'submission.event.fileUploaded',0),(283,1048585,9,3,'2023-03-28 23:38:41',1342177288,'submission.event.fileRevised',0),(284,515,68,3,'2023-03-28 23:38:41',1342177281,'submission.event.fileUploaded',0),(285,1048585,9,3,'2023-03-28 23:38:41',1342177288,'submission.event.fileRevised',0),(286,515,69,3,'2023-03-28 23:38:41',1342177281,'submission.event.fileUploaded',0),(287,1048585,9,3,'2023-03-28 23:38:41',1342177288,'submission.event.fileRevised',0),(288,515,70,3,'2023-03-28 23:38:41',1342177281,'submission.event.fileUploaded',0),(289,1048585,9,3,'2023-03-28 23:38:41',1342177288,'submission.event.fileRevised',0),(290,1048585,10,27,'2023-03-28 23:38:56',268435458,'submission.event.general.metadataUpdated',0),(291,1048585,10,27,'2023-03-28 23:38:56',268435458,'submission.event.general.metadataUpdated',0),(292,515,71,27,'2023-03-28 23:39:00',1342177281,'submission.event.fileUploaded',0),(293,1048585,10,27,'2023-03-28 23:39:00',1342177288,'submission.event.fileRevised',0),(294,515,71,27,'2023-03-28 23:39:00',1342177296,'submission.event.fileEdited',0),(295,1048585,10,27,'2023-03-28 23:39:00',1342177296,'submission.event.fileEdited',0),(296,515,72,27,'2023-03-28 23:39:01',1342177281,'submission.event.fileUploaded',0),(297,1048585,10,27,'2023-03-28 23:39:01',1342177288,'submission.event.fileRevised',0),(298,515,72,27,'2023-03-28 23:39:01',1342177296,'submission.event.fileEdited',0),(299,1048585,10,27,'2023-03-28 23:39:01',1342177296,'submission.event.fileEdited',0),(300,515,73,27,'2023-03-28 23:39:02',1342177281,'submission.event.fileUploaded',0),(301,1048585,10,27,'2023-03-28 23:39:02',1342177288,'submission.event.fileRevised',0),(302,515,73,27,'2023-03-28 23:39:02',1342177296,'submission.event.fileEdited',0),(303,1048585,10,27,'2023-03-28 23:39:02',1342177296,'submission.event.fileEdited',0),(304,515,74,27,'2023-03-28 23:39:03',1342177281,'submission.event.fileUploaded',0),(305,1048585,10,27,'2023-03-28 23:39:03',1342177288,'submission.event.fileRevised',0),(306,515,74,27,'2023-03-28 23:39:04',1342177296,'submission.event.fileEdited',0),(307,1048585,10,27,'2023-03-28 23:39:04',1342177296,'submission.event.fileEdited',0),(308,515,75,27,'2023-03-28 23:39:04',1342177281,'submission.event.fileUploaded',0),(309,1048585,10,27,'2023-03-28 23:39:04',1342177288,'submission.event.fileRevised',0),(310,515,75,27,'2023-03-28 23:39:05',1342177296,'submission.event.fileEdited',0),(311,1048585,10,27,'2023-03-28 23:39:05',1342177296,'submission.event.fileEdited',0),(312,515,76,27,'2023-03-28 23:39:06',1342177281,'submission.event.fileUploaded',0),(313,1048585,10,27,'2023-03-28 23:39:06',1342177288,'submission.event.fileRevised',0),(314,515,76,27,'2023-03-28 23:39:06',1342177296,'submission.event.fileEdited',0),(315,1048585,10,27,'2023-03-28 23:39:06',1342177296,'submission.event.fileEdited',0),(316,515,77,27,'2023-03-28 23:39:07',1342177281,'submission.event.fileUploaded',0),(317,1048585,10,27,'2023-03-28 23:39:07',1342177288,'submission.event.fileRevised',0),(318,515,77,27,'2023-03-28 23:39:07',1342177296,'submission.event.fileEdited',0),(319,1048585,10,27,'2023-03-28 23:39:07',1342177296,'submission.event.fileEdited',0),(320,515,78,27,'2023-03-28 23:39:08',1342177281,'submission.event.fileUploaded',0),(321,1048585,10,27,'2023-03-28 23:39:08',1342177288,'submission.event.fileRevised',0),(322,515,78,27,'2023-03-28 23:39:08',1342177296,'submission.event.fileEdited',0),(323,1048585,10,27,'2023-03-28 23:39:08',1342177296,'submission.event.fileEdited',0),(324,515,79,27,'2023-03-28 23:39:09',1342177281,'submission.event.fileUploaded',0),(325,1048585,10,27,'2023-03-28 23:39:09',1342177288,'submission.event.fileRevised',0),(326,515,79,27,'2023-03-28 23:39:10',1342177296,'submission.event.fileEdited',0),(327,1048585,10,27,'2023-03-28 23:39:10',1342177296,'submission.event.fileEdited',0),(328,1048585,10,27,'2023-03-28 23:40:28',268435457,'submission.event.submissionSubmitted',0),(329,1048585,11,28,'2023-03-28 23:40:38',268435458,'submission.event.general.metadataUpdated',0),(330,1048585,11,28,'2023-03-28 23:40:39',268435458,'submission.event.general.metadataUpdated',0),(331,515,80,28,'2023-03-28 23:40:42',1342177281,'submission.event.fileUploaded',0),(332,1048585,11,28,'2023-03-28 23:40:42',1342177288,'submission.event.fileRevised',0),(333,515,80,28,'2023-03-28 23:40:43',1342177296,'submission.event.fileEdited',0),(334,1048585,11,28,'2023-03-28 23:40:43',1342177296,'submission.event.fileEdited',0),(335,515,81,28,'2023-03-28 23:40:43',1342177281,'submission.event.fileUploaded',0),(336,1048585,11,28,'2023-03-28 23:40:43',1342177288,'submission.event.fileRevised',0),(337,515,81,28,'2023-03-28 23:40:44',1342177296,'submission.event.fileEdited',0),(338,1048585,11,28,'2023-03-28 23:40:44',1342177296,'submission.event.fileEdited',0),(339,1048585,11,28,'2023-03-28 23:40:56',268435457,'submission.event.submissionSubmitted',0),(340,1048585,11,3,'2023-03-28 23:41:11',805306371,'editor.submission.decision.sendInternalReview.log',0),(341,515,82,3,'2023-03-28 23:41:11',1342177281,'submission.event.fileUploaded',0),(342,1048585,11,3,'2023-03-28 23:41:11',1342177288,'submission.event.fileRevised',0),(343,515,83,3,'2023-03-28 23:41:11',1342177281,'submission.event.fileUploaded',0),(344,1048585,11,3,'2023-03-28 23:41:11',1342177288,'submission.event.fileRevised',0),(345,1048585,11,3,'2023-03-28 23:41:21',1073741825,'log.review.reviewerAssigned',0),(346,1048585,11,3,'2023-03-28 23:41:26',805306371,'editor.submission.decision.sendExternalReview.log',0),(347,1048585,11,3,'2023-03-28 23:41:36',1073741825,'log.review.reviewerAssigned',0),(348,1048585,11,3,'2023-03-28 23:41:44',1073741825,'log.review.reviewerAssigned',0),(349,1048585,11,10,'2023-03-28 23:41:51',1073741830,'log.review.reviewAccepted',0),(350,1048585,11,10,'2023-03-28 23:41:57',1073741848,'log.review.reviewReady',0),(351,1048585,11,12,'2023-03-28 23:42:04',1073741830,'log.review.reviewAccepted',0),(352,1048585,11,12,'2023-03-28 23:42:09',1073741848,'log.review.reviewReady',0),(353,1048585,11,3,'2023-03-28 23:42:29',805306371,'editor.submission.decision.accept.log',0),(354,1048585,11,3,'2023-03-28 23:42:29',1073741856,'submission.event.decisionReviewerEmailSent',0),(355,1048585,12,29,'2023-03-28 23:42:44',268435458,'submission.event.general.metadataUpdated',0),(356,1048585,12,29,'2023-03-28 23:42:44',268435458,'submission.event.general.metadataUpdated',0),(357,515,84,29,'2023-03-28 23:42:48',1342177281,'submission.event.fileUploaded',0),(358,1048585,12,29,'2023-03-28 23:42:48',1342177288,'submission.event.fileRevised',0),(359,515,84,29,'2023-03-28 23:42:48',1342177296,'submission.event.fileEdited',0),(360,1048585,12,29,'2023-03-28 23:42:48',1342177296,'submission.event.fileEdited',0),(361,515,85,29,'2023-03-28 23:42:49',1342177281,'submission.event.fileUploaded',0),(362,1048585,12,29,'2023-03-28 23:42:49',1342177288,'submission.event.fileRevised',0),(363,515,85,29,'2023-03-28 23:42:49',1342177296,'submission.event.fileEdited',0),(364,1048585,12,29,'2023-03-28 23:42:49',1342177296,'submission.event.fileEdited',0),(365,515,86,29,'2023-03-28 23:42:50',1342177281,'submission.event.fileUploaded',0),(366,1048585,12,29,'2023-03-28 23:42:50',1342177288,'submission.event.fileRevised',0),(367,515,86,29,'2023-03-28 23:42:50',1342177296,'submission.event.fileEdited',0),(368,1048585,12,29,'2023-03-28 23:42:50',1342177296,'submission.event.fileEdited',0),(369,1048585,12,29,'2023-03-28 23:43:14',268435457,'submission.event.submissionSubmitted',0),(370,1048585,12,3,'2023-03-28 23:43:30',805306371,'editor.submission.decision.sendInternalReview.log',0),(371,515,87,3,'2023-03-28 23:43:31',1342177281,'submission.event.fileUploaded',0),(372,1048585,12,3,'2023-03-28 23:43:31',1342177288,'submission.event.fileRevised',0),(373,515,88,3,'2023-03-28 23:43:31',1342177281,'submission.event.fileUploaded',0),(374,1048585,12,3,'2023-03-28 23:43:31',1342177288,'submission.event.fileRevised',0),(375,515,89,3,'2023-03-28 23:43:31',1342177281,'submission.event.fileUploaded',0),(376,1048585,12,3,'2023-03-28 23:43:31',1342177288,'submission.event.fileRevised',0),(377,1048585,12,3,'2023-03-28 23:43:41',1073741825,'log.review.reviewerAssigned',0),(378,1048585,12,3,'2023-03-28 23:43:49',1073741825,'log.review.reviewerAssigned',0),(379,1048585,12,3,'2023-03-28 23:43:57',1073741825,'log.review.reviewerAssigned',0),(380,1048585,12,8,'2023-03-28 23:44:04',1073741830,'log.review.reviewAccepted',0),(381,1048585,12,8,'2023-03-28 23:44:09',1073741848,'log.review.reviewReady',0),(382,1048585,13,30,'2023-03-28 23:44:19',268435458,'submission.event.general.metadataUpdated',0),(383,1048585,13,30,'2023-03-28 23:44:19',268435458,'submission.event.general.metadataUpdated',0),(384,515,90,30,'2023-03-28 23:44:22',1342177281,'submission.event.fileUploaded',0),(385,1048585,13,30,'2023-03-28 23:44:22',1342177288,'submission.event.fileRevised',0),(386,515,90,30,'2023-03-28 23:44:23',1342177296,'submission.event.fileEdited',0),(387,1048585,13,30,'2023-03-28 23:44:23',1342177296,'submission.event.fileEdited',0),(388,515,91,30,'2023-03-28 23:44:23',1342177281,'submission.event.fileUploaded',0),(389,1048585,13,30,'2023-03-28 23:44:23',1342177288,'submission.event.fileRevised',0),(390,515,91,30,'2023-03-28 23:44:24',1342177296,'submission.event.fileEdited',0),(391,1048585,13,30,'2023-03-28 23:44:24',1342177296,'submission.event.fileEdited',0),(392,515,92,30,'2023-03-28 23:44:25',1342177281,'submission.event.fileUploaded',0),(393,1048585,13,30,'2023-03-28 23:44:25',1342177288,'submission.event.fileRevised',0),(394,515,92,30,'2023-03-28 23:44:25',1342177296,'submission.event.fileEdited',0),(395,1048585,13,30,'2023-03-28 23:44:25',1342177296,'submission.event.fileEdited',0),(396,1048585,13,30,'2023-03-28 23:44:45',268435457,'submission.event.submissionSubmitted',0),(397,1048585,13,3,'2023-03-28 23:45:00',805306371,'editor.submission.decision.sendInternalReview.log',0),(398,515,93,3,'2023-03-28 23:45:00',1342177281,'submission.event.fileUploaded',0),(399,1048585,13,3,'2023-03-28 23:45:00',1342177288,'submission.event.fileRevised',0),(400,515,94,3,'2023-03-28 23:45:01',1342177281,'submission.event.fileUploaded',0),(401,1048585,13,3,'2023-03-28 23:45:01',1342177288,'submission.event.fileRevised',0),(402,515,95,3,'2023-03-28 23:45:01',1342177281,'submission.event.fileUploaded',0),(403,1048585,13,3,'2023-03-28 23:45:01',1342177288,'submission.event.fileRevised',0),(404,1048585,13,3,'2023-03-28 23:45:10',1073741825,'log.review.reviewerAssigned',0),(405,1048585,13,3,'2023-03-28 23:45:16',805306371,'editor.submission.decision.sendExternalReview.log',0),(406,1048585,13,3,'2023-03-28 23:45:26',1073741825,'log.review.reviewerAssigned',0),(407,1048585,13,3,'2023-03-28 23:45:33',1073741825,'log.review.reviewerAssigned',0),(408,1048585,13,3,'2023-03-28 23:45:41',1073741825,'log.review.reviewerAssigned',0),(409,1048585,13,10,'2023-03-28 23:45:49',1073741830,'log.review.reviewAccepted',0),(410,1048585,13,10,'2023-03-28 23:45:54',1073741848,'log.review.reviewReady',0),(411,1048585,13,12,'2023-03-28 23:46:01',1073741830,'log.review.reviewAccepted',0),(412,1048585,13,12,'2023-03-28 23:46:06',1073741848,'log.review.reviewReady',0),(413,1048585,13,3,'2023-03-28 23:46:26',805306371,'editor.submission.decision.accept.log',0),(414,1048585,13,3,'2023-03-28 23:46:26',1073741856,'submission.event.decisionReviewerEmailSent',0),(415,1048585,14,31,'2023-03-28 23:46:40',268435458,'submission.event.general.metadataUpdated',0),(416,1048585,14,31,'2023-03-28 23:46:41',268435458,'submission.event.general.metadataUpdated',0),(417,515,96,31,'2023-03-28 23:46:44',1342177281,'submission.event.fileUploaded',0),(418,1048585,14,31,'2023-03-28 23:46:44',1342177288,'submission.event.fileRevised',0),(419,515,96,31,'2023-03-28 23:46:44',1342177296,'submission.event.fileEdited',0),(420,1048585,14,31,'2023-03-28 23:46:44',1342177296,'submission.event.fileEdited',0),(421,515,97,31,'2023-03-28 23:46:45',1342177281,'submission.event.fileUploaded',0),(422,1048585,14,31,'2023-03-28 23:46:45',1342177288,'submission.event.fileRevised',0),(423,515,97,31,'2023-03-28 23:46:45',1342177296,'submission.event.fileEdited',0),(424,1048585,14,31,'2023-03-28 23:46:45',1342177296,'submission.event.fileEdited',0),(425,515,98,31,'2023-03-28 23:46:46',1342177281,'submission.event.fileUploaded',0),(426,1048585,14,31,'2023-03-28 23:46:46',1342177288,'submission.event.fileRevised',0),(427,515,98,31,'2023-03-28 23:46:46',1342177296,'submission.event.fileEdited',0),(428,1048585,14,31,'2023-03-28 23:46:46',1342177296,'submission.event.fileEdited',0),(429,515,99,31,'2023-03-28 23:46:47',1342177281,'submission.event.fileUploaded',0),(430,1048585,14,31,'2023-03-28 23:46:47',1342177288,'submission.event.fileRevised',0),(431,515,99,31,'2023-03-28 23:46:47',1342177296,'submission.event.fileEdited',0),(432,1048585,14,31,'2023-03-28 23:46:47',1342177296,'submission.event.fileEdited',0),(433,515,100,31,'2023-03-28 23:46:48',1342177281,'submission.event.fileUploaded',0),(434,1048585,14,31,'2023-03-28 23:46:48',1342177288,'submission.event.fileRevised',0),(435,515,100,31,'2023-03-28 23:46:49',1342177296,'submission.event.fileEdited',0),(436,1048585,14,31,'2023-03-28 23:46:49',1342177296,'submission.event.fileEdited',0),(437,515,101,31,'2023-03-28 23:46:49',1342177281,'submission.event.fileUploaded',0),(438,1048585,14,31,'2023-03-28 23:46:49',1342177288,'submission.event.fileRevised',0),(439,515,101,31,'2023-03-28 23:46:50',1342177296,'submission.event.fileEdited',0),(440,1048585,14,31,'2023-03-28 23:46:50',1342177296,'submission.event.fileEdited',0),(441,1048585,14,31,'2023-03-28 23:47:18',268435457,'submission.event.submissionSubmitted',0),(442,1048585,14,3,'2023-03-28 23:47:35',805306371,'editor.submission.decision.sendInternalReview.log',0),(443,515,102,3,'2023-03-28 23:47:35',1342177281,'submission.event.fileUploaded',0),(444,1048585,14,3,'2023-03-28 23:47:35',1342177288,'submission.event.fileRevised',0),(445,515,103,3,'2023-03-28 23:47:35',1342177281,'submission.event.fileUploaded',0),(446,1048585,14,3,'2023-03-28 23:47:35',1342177288,'submission.event.fileRevised',0),(447,515,104,3,'2023-03-28 23:47:35',1342177281,'submission.event.fileUploaded',0),(448,1048585,14,3,'2023-03-28 23:47:35',1342177288,'submission.event.fileRevised',0),(449,515,105,3,'2023-03-28 23:47:36',1342177281,'submission.event.fileUploaded',0),(450,1048585,14,3,'2023-03-28 23:47:36',1342177288,'submission.event.fileRevised',0),(451,515,106,3,'2023-03-28 23:47:36',1342177281,'submission.event.fileUploaded',0),(452,1048585,14,3,'2023-03-28 23:47:36',1342177288,'submission.event.fileRevised',0),(453,515,107,3,'2023-03-28 23:47:36',1342177281,'submission.event.fileUploaded',0),(454,1048585,14,3,'2023-03-28 23:47:36',1342177288,'submission.event.fileRevised',0),(455,1048585,14,3,'2023-03-28 23:47:46',1073741825,'log.review.reviewerAssigned',0),(456,1048585,14,3,'2023-03-28 23:47:52',805306371,'editor.submission.decision.sendExternalReview.log',0),(457,1048585,14,3,'2023-03-28 23:48:02',1073741825,'log.review.reviewerAssigned',0),(458,1048585,14,3,'2023-03-28 23:48:08',805306371,'editor.submission.decision.accept.log',0),(459,1048585,14,3,'2023-03-28 23:48:19',268435459,'submission.event.participantAdded',0),(460,1048585,14,3,'2023-03-28 23:48:26',805306371,'editor.submission.decision.sendToProduction.log',0),(461,1048585,14,3,'2023-03-28 23:48:36',268435459,'submission.event.participantAdded',0),(462,1048585,14,3,'2023-03-28 23:48:43',268435459,'submission.event.participantAdded',0),(463,1048585,14,3,'2023-03-28 23:48:49',268435474,'submission.event.publicationFormatCreated',0),(464,515,108,3,'2023-03-28 23:48:56',1342177281,'submission.event.fileUploaded',0),(465,1048585,14,3,'2023-03-28 23:48:56',1342177288,'submission.event.fileRevised',0),(466,515,109,3,'2023-03-28 23:48:56',1342177281,'submission.event.fileUploaded',0),(467,1048585,14,3,'2023-03-28 23:48:56',1342177288,'submission.event.fileRevised',0),(468,515,110,3,'2023-03-28 23:48:56',1342177281,'submission.event.fileUploaded',0),(469,1048585,14,3,'2023-03-28 23:48:56',1342177288,'submission.event.fileRevised',0),(470,515,111,3,'2023-03-28 23:48:56',1342177281,'submission.event.fileUploaded',0),(471,1048585,14,3,'2023-03-28 23:48:56',1342177288,'submission.event.fileRevised',0),(472,515,112,3,'2023-03-28 23:48:56',1342177281,'submission.event.fileUploaded',0),(473,1048585,14,3,'2023-03-28 23:48:56',1342177288,'submission.event.fileRevised',0),(474,515,113,3,'2023-03-28 23:48:56',1342177281,'submission.event.fileUploaded',0),(475,1048585,14,3,'2023-03-28 23:48:56',1342177288,'submission.event.fileRevised',0),(476,1048585,14,3,'2023-03-28 23:48:58',268435464,'submission.event.publicationFormatPublished',0),(477,1048585,14,3,'2023-03-28 23:49:01',268435476,'submission.event.publicationFormatMadeAvailable',0),(478,515,113,3,'2023-03-28 23:49:03',1342177296,'submission.event.fileEdited',0),(479,1048585,14,3,'2023-03-28 23:49:03',1342177296,'submission.event.fileEdited',0),(480,515,113,3,'2023-03-28 23:49:03',1342177287,'submission.event.signoffSignoff',0),(481,515,113,3,'2023-03-28 23:49:06',1342177296,'submission.event.fileEdited',0),(482,1048585,14,3,'2023-03-28 23:49:06',1342177296,'submission.event.fileEdited',0),(483,515,112,3,'2023-03-28 23:49:08',1342177296,'submission.event.fileEdited',0),(484,1048585,14,3,'2023-03-28 23:49:08',1342177296,'submission.event.fileEdited',0),(485,515,112,3,'2023-03-28 23:49:08',1342177287,'submission.event.signoffSignoff',0),(486,515,112,3,'2023-03-28 23:49:12',1342177296,'submission.event.fileEdited',0),(487,1048585,14,3,'2023-03-28 23:49:12',1342177296,'submission.event.fileEdited',0),(488,515,111,3,'2023-03-28 23:49:14',1342177296,'submission.event.fileEdited',0),(489,1048585,14,3,'2023-03-28 23:49:14',1342177296,'submission.event.fileEdited',0),(490,515,111,3,'2023-03-28 23:49:14',1342177287,'submission.event.signoffSignoff',0),(491,515,111,3,'2023-03-28 23:49:17',1342177296,'submission.event.fileEdited',0),(492,1048585,14,3,'2023-03-28 23:49:17',1342177296,'submission.event.fileEdited',0),(493,515,110,3,'2023-03-28 23:49:20',1342177296,'submission.event.fileEdited',0),(494,1048585,14,3,'2023-03-28 23:49:20',1342177296,'submission.event.fileEdited',0),(495,515,110,3,'2023-03-28 23:49:20',1342177287,'submission.event.signoffSignoff',0),(496,515,110,3,'2023-03-28 23:49:23',1342177296,'submission.event.fileEdited',0),(497,1048585,14,3,'2023-03-28 23:49:23',1342177296,'submission.event.fileEdited',0),(498,515,109,3,'2023-03-28 23:49:25',1342177296,'submission.event.fileEdited',0),(499,1048585,14,3,'2023-03-28 23:49:25',1342177296,'submission.event.fileEdited',0),(500,515,109,3,'2023-03-28 23:49:25',1342177287,'submission.event.signoffSignoff',0),(501,515,109,3,'2023-03-28 23:49:29',1342177296,'submission.event.fileEdited',0),(502,1048585,14,3,'2023-03-28 23:49:29',1342177296,'submission.event.fileEdited',0),(503,515,108,3,'2023-03-28 23:49:32',1342177296,'submission.event.fileEdited',0),(504,1048585,14,3,'2023-03-28 23:49:32',1342177296,'submission.event.fileEdited',0),(505,515,108,3,'2023-03-28 23:49:32',1342177287,'submission.event.signoffSignoff',0),(506,515,108,3,'2023-03-28 23:49:35',1342177296,'submission.event.fileEdited',0),(507,1048585,14,3,'2023-03-28 23:49:35',1342177296,'submission.event.fileEdited',0),(508,1048585,14,3,'2023-03-28 23:49:38',268435462,'publication.event.published',0),(509,1048585,15,32,'2023-03-28 23:49:48',268435458,'submission.event.general.metadataUpdated',0),(510,1048585,15,32,'2023-03-28 23:49:49',268435458,'submission.event.general.metadataUpdated',0),(511,515,114,32,'2023-03-28 23:49:52',1342177281,'submission.event.fileUploaded',0),(512,1048585,15,32,'2023-03-28 23:49:52',1342177288,'submission.event.fileRevised',0),(513,515,114,32,'2023-03-28 23:49:52',1342177296,'submission.event.fileEdited',0),(514,1048585,15,32,'2023-03-28 23:49:52',1342177296,'submission.event.fileEdited',0),(515,515,115,32,'2023-03-28 23:49:53',1342177281,'submission.event.fileUploaded',0),(516,1048585,15,32,'2023-03-28 23:49:53',1342177288,'submission.event.fileRevised',0),(517,515,115,32,'2023-03-28 23:49:53',1342177296,'submission.event.fileEdited',0),(518,1048585,15,32,'2023-03-28 23:49:53',1342177296,'submission.event.fileEdited',0),(519,515,116,32,'2023-03-28 23:49:54',1342177281,'submission.event.fileUploaded',0),(520,1048585,15,32,'2023-03-28 23:49:54',1342177288,'submission.event.fileRevised',0),(521,515,116,32,'2023-03-28 23:49:54',1342177296,'submission.event.fileEdited',0),(522,1048585,15,32,'2023-03-28 23:49:54',1342177296,'submission.event.fileEdited',0),(523,1048585,15,32,'2023-03-28 23:50:13',268435457,'submission.event.submissionSubmitted',0),(524,1048585,15,3,'2023-03-28 23:50:28',805306371,'editor.submission.decision.sendExternalReview.log',0),(525,515,117,3,'2023-03-28 23:50:28',1342177281,'submission.event.fileUploaded',0),(526,1048585,15,3,'2023-03-28 23:50:28',1342177288,'submission.event.fileRevised',0),(527,515,118,3,'2023-03-28 23:50:28',1342177281,'submission.event.fileUploaded',0),(528,1048585,15,3,'2023-03-28 23:50:28',1342177288,'submission.event.fileRevised',0),(529,515,119,3,'2023-03-28 23:50:29',1342177281,'submission.event.fileUploaded',0),(530,1048585,15,3,'2023-03-28 23:50:29',1342177288,'submission.event.fileRevised',0),(531,1048585,16,33,'2023-03-28 23:50:41',268435458,'submission.event.general.metadataUpdated',0),(532,1048585,16,33,'2023-03-28 23:50:41',268435458,'submission.event.general.metadataUpdated',0),(533,515,120,33,'2023-03-28 23:50:45',1342177281,'submission.event.fileUploaded',0),(534,1048585,16,33,'2023-03-28 23:50:45',1342177288,'submission.event.fileRevised',0),(535,515,120,33,'2023-03-28 23:50:45',1342177296,'submission.event.fileEdited',0),(536,1048585,16,33,'2023-03-28 23:50:45',1342177296,'submission.event.fileEdited',0),(537,515,121,33,'2023-03-28 23:50:46',1342177281,'submission.event.fileUploaded',0),(538,1048585,16,33,'2023-03-28 23:50:46',1342177288,'submission.event.fileRevised',0),(539,515,121,33,'2023-03-28 23:50:46',1342177296,'submission.event.fileEdited',0),(540,1048585,16,33,'2023-03-28 23:50:46',1342177296,'submission.event.fileEdited',0),(541,515,122,33,'2023-03-28 23:50:47',1342177281,'submission.event.fileUploaded',0),(542,1048585,16,33,'2023-03-28 23:50:47',1342177288,'submission.event.fileRevised',0),(543,515,122,33,'2023-03-28 23:50:47',1342177296,'submission.event.fileEdited',0),(544,1048585,16,33,'2023-03-28 23:50:47',1342177296,'submission.event.fileEdited',0),(545,515,123,33,'2023-03-28 23:50:48',1342177281,'submission.event.fileUploaded',0),(546,1048585,16,33,'2023-03-28 23:50:48',1342177288,'submission.event.fileRevised',0),(547,515,123,33,'2023-03-28 23:50:48',1342177296,'submission.event.fileEdited',0),(548,1048585,16,33,'2023-03-28 23:50:48',1342177296,'submission.event.fileEdited',0),(549,515,124,33,'2023-03-28 23:50:49',1342177281,'submission.event.fileUploaded',0),(550,1048585,16,33,'2023-03-28 23:50:49',1342177288,'submission.event.fileRevised',0),(551,515,124,33,'2023-03-28 23:50:49',1342177296,'submission.event.fileEdited',0),(552,1048585,16,33,'2023-03-28 23:50:49',1342177296,'submission.event.fileEdited',0),(553,1048585,16,33,'2023-03-28 23:51:22',268435457,'submission.event.submissionSubmitted',0),(554,1048585,16,3,'2023-03-28 23:51:39',805306371,'editor.submission.decision.sendExternalReview.log',0),(555,515,125,3,'2023-03-28 23:51:39',1342177281,'submission.event.fileUploaded',0),(556,1048585,16,3,'2023-03-28 23:51:39',1342177288,'submission.event.fileRevised',0),(557,515,126,3,'2023-03-28 23:51:39',1342177281,'submission.event.fileUploaded',0),(558,1048585,16,3,'2023-03-28 23:51:39',1342177288,'submission.event.fileRevised',0),(559,515,127,3,'2023-03-28 23:51:39',1342177281,'submission.event.fileUploaded',0),(560,1048585,16,3,'2023-03-28 23:51:39',1342177288,'submission.event.fileRevised',0),(561,515,128,3,'2023-03-28 23:51:39',1342177281,'submission.event.fileUploaded',0),(562,1048585,16,3,'2023-03-28 23:51:39',1342177288,'submission.event.fileRevised',0),(563,515,129,3,'2023-03-28 23:51:40',1342177281,'submission.event.fileUploaded',0),(564,1048585,16,3,'2023-03-28 23:51:40',1342177288,'submission.event.fileRevised',0),(565,1048585,16,3,'2023-03-28 23:51:50',1073741825,'log.review.reviewerAssigned',0),(566,1048585,16,3,'2023-03-28 23:51:58',1073741825,'log.review.reviewerAssigned',0),(567,1048585,16,3,'2023-03-28 23:52:06',1073741825,'log.review.reviewerAssigned',0),(568,1048585,16,10,'2023-03-28 23:52:14',1073741830,'log.review.reviewAccepted',0),(569,1048585,16,10,'2023-03-28 23:52:19',1073741848,'log.review.reviewReady',0),(570,1048585,17,34,'2023-03-28 23:52:29',268435458,'submission.event.general.metadataUpdated',0),(571,1048585,17,34,'2023-03-28 23:52:30',268435458,'submission.event.general.metadataUpdated',0),(572,515,130,34,'2023-03-28 23:52:33',1342177281,'submission.event.fileUploaded',0),(573,1048585,17,34,'2023-03-28 23:52:33',1342177288,'submission.event.fileRevised',0),(574,515,130,34,'2023-03-28 23:52:33',1342177296,'submission.event.fileEdited',0),(575,1048585,17,34,'2023-03-28 23:52:33',1342177296,'submission.event.fileEdited',0),(576,515,131,34,'2023-03-28 23:52:34',1342177281,'submission.event.fileUploaded',0),(577,1048585,17,34,'2023-03-28 23:52:34',1342177288,'submission.event.fileRevised',0),(578,515,131,34,'2023-03-28 23:52:34',1342177296,'submission.event.fileEdited',0),(579,1048585,17,34,'2023-03-28 23:52:34',1342177296,'submission.event.fileEdited',0),(580,515,132,34,'2023-03-28 23:52:35',1342177281,'submission.event.fileUploaded',0),(581,1048585,17,34,'2023-03-28 23:52:35',1342177288,'submission.event.fileRevised',0),(582,515,132,34,'2023-03-28 23:52:35',1342177296,'submission.event.fileEdited',0),(583,1048585,17,34,'2023-03-28 23:52:35',1342177296,'submission.event.fileEdited',0),(584,515,133,34,'2023-03-28 23:52:36',1342177281,'submission.event.fileUploaded',0),(585,1048585,17,34,'2023-03-28 23:52:36',1342177288,'submission.event.fileRevised',0),(586,515,133,34,'2023-03-28 23:52:36',1342177296,'submission.event.fileEdited',0),(587,1048585,17,34,'2023-03-28 23:52:36',1342177296,'submission.event.fileEdited',0),(588,515,134,34,'2023-03-28 23:52:37',1342177281,'submission.event.fileUploaded',0),(589,1048585,17,34,'2023-03-28 23:52:37',1342177288,'submission.event.fileRevised',0),(590,515,134,34,'2023-03-28 23:52:37',1342177296,'submission.event.fileEdited',0),(591,1048585,17,34,'2023-03-28 23:52:37',1342177296,'submission.event.fileEdited',0),(592,515,135,34,'2023-03-28 23:52:38',1342177281,'submission.event.fileUploaded',0),(593,1048585,17,34,'2023-03-28 23:52:38',1342177288,'submission.event.fileRevised',0),(594,515,135,34,'2023-03-28 23:52:39',1342177296,'submission.event.fileEdited',0),(595,1048585,17,34,'2023-03-28 23:52:39',1342177296,'submission.event.fileEdited',0),(596,1048585,17,34,'2023-03-28 23:53:25',268435457,'submission.event.submissionSubmitted',0),(597,1048585,17,3,'2023-03-28 23:53:44',805306371,'editor.submission.decision.sendInternalReview.log',0),(598,515,136,3,'2023-03-28 23:53:45',1342177281,'submission.event.fileUploaded',0),(599,1048585,17,3,'2023-03-28 23:53:45',1342177288,'submission.event.fileRevised',0),(600,515,137,3,'2023-03-28 23:53:45',1342177281,'submission.event.fileUploaded',0),(601,1048585,17,3,'2023-03-28 23:53:45',1342177288,'submission.event.fileRevised',0),(602,515,138,3,'2023-03-28 23:53:45',1342177281,'submission.event.fileUploaded',0),(603,1048585,17,3,'2023-03-28 23:53:45',1342177288,'submission.event.fileRevised',0),(604,515,139,3,'2023-03-28 23:53:45',1342177281,'submission.event.fileUploaded',0),(605,1048585,17,3,'2023-03-28 23:53:45',1342177288,'submission.event.fileRevised',0),(606,515,140,3,'2023-03-28 23:53:45',1342177281,'submission.event.fileUploaded',0),(607,1048585,17,3,'2023-03-28 23:53:45',1342177288,'submission.event.fileRevised',0),(608,515,141,3,'2023-03-28 23:53:45',1342177281,'submission.event.fileUploaded',0),(609,1048585,17,3,'2023-03-28 23:53:45',1342177288,'submission.event.fileRevised',0),(610,1048585,17,3,'2023-03-28 23:53:56',1073741825,'log.review.reviewerAssigned',0),(611,1048585,17,3,'2023-03-28 23:54:04',1073741825,'log.review.reviewerAssigned',0);
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
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`event_log_setting_id`),
  UNIQUE KEY `event_log_settings_unique` (`log_id`,`setting_name`),
  KEY `event_log_settings_log_id` (`log_id`),
  KEY `event_log_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `event_log_settings_log_id` FOREIGN KEY (`log_id`) REFERENCES `event_log` (`log_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3535 DEFAULT CHARSET=utf8 COMMENT='Data about an event log entry. This data is commonly used to display information about an event to a user.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
INSERT INTO `event_log_settings` VALUES (1,3,'fileStage','2','int'),(2,3,'sourceSubmissionFileId',NULL,'string'),(3,3,'submissionFileId','1','int'),(4,3,'fileId','1','int'),(5,3,'submissionId','1','int'),(6,3,'originalFileName','chapter1.pdf','string'),(7,3,'username','aclark','string'),(8,4,'fileStage','2','int'),(9,4,'submissionFileId','1','int'),(10,4,'fileId','1','int'),(11,4,'submissionId','1','int'),(12,4,'username','aclark','string'),(13,4,'name','chapter1.pdf','string'),(14,5,'fileStage','2','int'),(15,5,'sourceSubmissionFileId',NULL,'string'),(16,5,'submissionFileId','1','int'),(17,5,'fileId','1','int'),(18,5,'submissionId','1','int'),(19,5,'originalFileName','chapter1.pdf','string'),(20,5,'username','aclark','string'),(21,6,'fileStage','2','int'),(22,6,'sourceSubmissionFileId',NULL,'string'),(23,6,'submissionFileId','1','int'),(24,6,'fileId','1','int'),(25,6,'submissionId','1','int'),(26,6,'username','aclark','string'),(27,6,'originalFileName','chapter1.pdf','string'),(28,6,'name','chapter1.pdf','string'),(29,7,'fileStage','2','int'),(30,7,'sourceSubmissionFileId',NULL,'string'),(31,7,'submissionFileId','2','int'),(32,7,'fileId','2','int'),(33,7,'submissionId','1','int'),(34,7,'originalFileName','chapter2.pdf','string'),(35,7,'username','aclark','string'),(36,8,'fileStage','2','int'),(37,8,'submissionFileId','2','int'),(38,8,'fileId','2','int'),(39,8,'submissionId','1','int'),(40,8,'username','aclark','string'),(41,8,'name','chapter2.pdf','string'),(42,9,'fileStage','2','int'),(43,9,'sourceSubmissionFileId',NULL,'string'),(44,9,'submissionFileId','2','int'),(45,9,'fileId','2','int'),(46,9,'submissionId','1','int'),(47,9,'originalFileName','chapter2.pdf','string'),(48,9,'username','aclark','string'),(49,10,'fileStage','2','int'),(50,10,'sourceSubmissionFileId',NULL,'string'),(51,10,'submissionFileId','2','int'),(52,10,'fileId','2','int'),(53,10,'submissionId','1','int'),(54,10,'username','aclark','string'),(55,10,'originalFileName','chapter2.pdf','string'),(56,10,'name','chapter2.pdf','string'),(57,11,'fileStage','2','int'),(58,11,'sourceSubmissionFileId',NULL,'string'),(59,11,'submissionFileId','3','int'),(60,11,'fileId','3','int'),(61,11,'submissionId','1','int'),(62,11,'originalFileName','chapter3.pdf','string'),(63,11,'username','aclark','string'),(64,12,'fileStage','2','int'),(65,12,'submissionFileId','3','int'),(66,12,'fileId','3','int'),(67,12,'submissionId','1','int'),(68,12,'username','aclark','string'),(69,12,'name','chapter3.pdf','string'),(70,13,'fileStage','2','int'),(71,13,'sourceSubmissionFileId',NULL,'string'),(72,13,'submissionFileId','3','int'),(73,13,'fileId','3','int'),(74,13,'submissionId','1','int'),(75,13,'originalFileName','chapter3.pdf','string'),(76,13,'username','aclark','string'),(77,14,'fileStage','2','int'),(78,14,'sourceSubmissionFileId',NULL,'string'),(79,14,'submissionFileId','3','int'),(80,14,'fileId','3','int'),(81,14,'submissionId','1','int'),(82,14,'username','aclark','string'),(83,14,'originalFileName','chapter3.pdf','string'),(84,14,'name','chapter3.pdf','string'),(85,16,'editorId','3','int'),(86,16,'editorName','Daniel Barnes','string'),(87,16,'submissionId','1','int'),(88,16,'decision','18','int'),(89,17,'fileStage','4','int'),(90,17,'sourceSubmissionFileId','2','int'),(91,17,'submissionFileId','4','int'),(92,17,'fileId','2','int'),(93,17,'submissionId','1','int'),(94,17,'originalFileName','chapter2.pdf','string'),(95,17,'username','dbarnes','string'),(96,18,'fileStage','4','int'),(97,18,'submissionFileId','4','int'),(98,18,'fileId','2','int'),(99,18,'submissionId','1','int'),(100,18,'username','dbarnes','string'),(101,18,'name','chapter2.pdf','string'),(102,19,'fileStage','4','int'),(103,19,'sourceSubmissionFileId','3','int'),(104,19,'submissionFileId','5','int'),(105,19,'fileId','3','int'),(106,19,'submissionId','1','int'),(107,19,'originalFileName','chapter3.pdf','string'),(108,19,'username','dbarnes','string'),(109,20,'fileStage','4','int'),(110,20,'submissionFileId','5','int'),(111,20,'fileId','3','int'),(112,20,'submissionId','1','int'),(113,20,'username','dbarnes','string'),(114,20,'name','chapter3.pdf','string'),(115,21,'fileStage','4','int'),(116,21,'sourceSubmissionFileId','1','int'),(117,21,'submissionFileId','6','int'),(118,21,'fileId','1','int'),(119,21,'submissionId','1','int'),(120,21,'originalFileName','chapter1.pdf','string'),(121,21,'username','dbarnes','string'),(122,22,'fileStage','4','int'),(123,22,'submissionFileId','6','int'),(124,22,'fileId','1','int'),(125,22,'submissionId','1','int'),(126,22,'username','dbarnes','string'),(127,22,'name','chapter1.pdf','string'),(128,23,'reviewAssignmentId','1','int'),(129,23,'reviewerName','Gonzalo Favio','string'),(130,23,'submissionId','1','int'),(131,23,'stageId','3','int'),(132,23,'round','1','int'),(133,24,'editorId','3','int'),(134,24,'editorName','Daniel Barnes','string'),(135,24,'submissionId','1','int'),(136,24,'decision','2','int'),(137,25,'name','Sarah Vogt','string'),(138,25,'username','svogt','string'),(139,25,'userGroupName','Copyeditor','string'),(140,29,'fileStage','2','int'),(141,29,'sourceSubmissionFileId',NULL,'string'),(142,29,'submissionFileId','7','int'),(143,29,'fileId','4','int'),(144,29,'submissionId','2','int'),(145,29,'originalFileName','chapter1.pdf','string'),(146,29,'username','afinkel','string'),(147,30,'fileStage','2','int'),(148,30,'submissionFileId','7','int'),(149,30,'fileId','4','int'),(150,30,'submissionId','2','int'),(151,30,'username','afinkel','string'),(152,30,'name','chapter1.pdf','string'),(153,31,'fileStage','2','int'),(154,31,'sourceSubmissionFileId',NULL,'string'),(155,31,'submissionFileId','7','int'),(156,31,'fileId','4','int'),(157,31,'submissionId','2','int'),(158,31,'originalFileName','chapter1.pdf','string'),(159,31,'username','afinkel','string'),(160,32,'fileStage','2','int'),(161,32,'sourceSubmissionFileId',NULL,'string'),(162,32,'submissionFileId','7','int'),(163,32,'fileId','4','int'),(164,32,'submissionId','2','int'),(165,32,'username','afinkel','string'),(166,32,'originalFileName','chapter1.pdf','string'),(167,32,'name','chapter1.pdf','string'),(168,33,'fileStage','2','int'),(169,33,'sourceSubmissionFileId',NULL,'string'),(170,33,'submissionFileId','8','int'),(171,33,'fileId','5','int'),(172,33,'submissionId','2','int'),(173,33,'originalFileName','chapter2.pdf','string'),(174,33,'username','afinkel','string'),(175,34,'fileStage','2','int'),(176,34,'submissionFileId','8','int'),(177,34,'fileId','5','int'),(178,34,'submissionId','2','int'),(179,34,'username','afinkel','string'),(180,34,'name','chapter2.pdf','string'),(181,35,'fileStage','2','int'),(182,35,'sourceSubmissionFileId',NULL,'string'),(183,35,'submissionFileId','8','int'),(184,35,'fileId','5','int'),(185,35,'submissionId','2','int'),(186,35,'originalFileName','chapter2.pdf','string'),(187,35,'username','afinkel','string'),(188,36,'fileStage','2','int'),(189,36,'sourceSubmissionFileId',NULL,'string'),(190,36,'submissionFileId','8','int'),(191,36,'fileId','5','int'),(192,36,'submissionId','2','int'),(193,36,'username','afinkel','string'),(194,36,'originalFileName','chapter2.pdf','string'),(195,36,'name','chapter2.pdf','string'),(196,37,'fileStage','2','int'),(197,37,'sourceSubmissionFileId',NULL,'string'),(198,37,'submissionFileId','9','int'),(199,37,'fileId','6','int'),(200,37,'submissionId','2','int'),(201,37,'originalFileName','chapter3.pdf','string'),(202,37,'username','afinkel','string'),(203,38,'fileStage','2','int'),(204,38,'submissionFileId','9','int'),(205,38,'fileId','6','int'),(206,38,'submissionId','2','int'),(207,38,'username','afinkel','string'),(208,38,'name','chapter3.pdf','string'),(209,39,'fileStage','2','int'),(210,39,'sourceSubmissionFileId',NULL,'string'),(211,39,'submissionFileId','9','int'),(212,39,'fileId','6','int'),(213,39,'submissionId','2','int'),(214,39,'originalFileName','chapter3.pdf','string'),(215,39,'username','afinkel','string'),(216,40,'fileStage','2','int'),(217,40,'sourceSubmissionFileId',NULL,'string'),(218,40,'submissionFileId','9','int'),(219,40,'fileId','6','int'),(220,40,'submissionId','2','int'),(221,40,'username','afinkel','string'),(222,40,'originalFileName','chapter3.pdf','string'),(223,40,'name','chapter3.pdf','string'),(224,41,'fileStage','2','int'),(225,41,'sourceSubmissionFileId',NULL,'string'),(226,41,'submissionFileId','10','int'),(227,41,'fileId','7','int'),(228,41,'submissionId','2','int'),(229,41,'originalFileName','chapter4.pdf','string'),(230,41,'username','afinkel','string'),(231,42,'fileStage','2','int'),(232,42,'submissionFileId','10','int'),(233,42,'fileId','7','int'),(234,42,'submissionId','2','int'),(235,42,'username','afinkel','string'),(236,42,'name','chapter4.pdf','string'),(237,43,'fileStage','2','int'),(238,43,'sourceSubmissionFileId',NULL,'string'),(239,43,'submissionFileId','10','int'),(240,43,'fileId','7','int'),(241,43,'submissionId','2','int'),(242,43,'originalFileName','chapter4.pdf','string'),(243,43,'username','afinkel','string'),(244,44,'fileStage','2','int'),(245,44,'sourceSubmissionFileId',NULL,'string'),(246,44,'submissionFileId','10','int'),(247,44,'fileId','7','int'),(248,44,'submissionId','2','int'),(249,44,'username','afinkel','string'),(250,44,'originalFileName','chapter4.pdf','string'),(251,44,'name','chapter4.pdf','string'),(252,45,'fileStage','2','int'),(253,45,'sourceSubmissionFileId',NULL,'string'),(254,45,'submissionFileId','11','int'),(255,45,'fileId','8','int'),(256,45,'submissionId','2','int'),(257,45,'originalFileName','delete-this-file.pdf','string'),(258,45,'username','afinkel','string'),(259,46,'fileStage','2','int'),(260,46,'submissionFileId','11','int'),(261,46,'fileId','8','int'),(262,46,'submissionId','2','int'),(263,46,'username','afinkel','string'),(264,46,'name','delete-this-file.pdf','string'),(265,47,'fileStage','2','int'),(266,47,'sourceSubmissionFileId',NULL,'string'),(267,47,'submissionFileId','11','int'),(268,47,'fileId','8','int'),(269,47,'submissionId','2','int'),(270,47,'originalFileName','delete-this-file.pdf','string'),(271,47,'username','afinkel','string'),(272,48,'fileStage','2','int'),(273,48,'sourceSubmissionFileId',NULL,'string'),(274,48,'submissionFileId','11','int'),(275,48,'fileId','8','int'),(276,48,'submissionId','2','int'),(277,48,'username','afinkel','string'),(278,48,'originalFileName','delete-this-file.pdf','string'),(279,48,'name','delete-this-file.pdf','string'),(280,49,'fileStage','2','int'),(281,49,'sourceSubmissionFileId',NULL,'string'),(282,49,'submissionFileId','11','int'),(283,49,'submissionId','2','int'),(284,49,'username','afinkel','string'),(285,51,'editorId','3','int'),(286,51,'editorName','Daniel Barnes','string'),(287,51,'submissionId','2','int'),(288,51,'decision','18','int'),(289,52,'fileStage','4','int'),(290,52,'sourceSubmissionFileId','10','int'),(291,52,'submissionFileId','12','int'),(292,52,'fileId','7','int'),(293,52,'submissionId','2','int'),(294,52,'originalFileName','chapter4.pdf','string'),(295,52,'username','dbarnes','string'),(296,53,'fileStage','4','int'),(297,53,'submissionFileId','12','int'),(298,53,'fileId','7','int'),(299,53,'submissionId','2','int'),(300,53,'username','dbarnes','string'),(301,53,'name','chapter4.pdf','string'),(302,54,'fileStage','4','int'),(303,54,'sourceSubmissionFileId','8','int'),(304,54,'submissionFileId','13','int'),(305,54,'fileId','5','int'),(306,54,'submissionId','2','int'),(307,54,'originalFileName','chapter2.pdf','string'),(308,54,'username','dbarnes','string'),(309,55,'fileStage','4','int'),(310,55,'submissionFileId','13','int'),(311,55,'fileId','5','int'),(312,55,'submissionId','2','int'),(313,55,'username','dbarnes','string'),(314,55,'name','chapter2.pdf','string'),(315,56,'fileStage','4','int'),(316,56,'sourceSubmissionFileId','7','int'),(317,56,'submissionFileId','14','int'),(318,56,'fileId','4','int'),(319,56,'submissionId','2','int'),(320,56,'originalFileName','chapter1.pdf','string'),(321,56,'username','dbarnes','string'),(322,57,'fileStage','4','int'),(323,57,'submissionFileId','14','int'),(324,57,'fileId','4','int'),(325,57,'submissionId','2','int'),(326,57,'username','dbarnes','string'),(327,57,'name','chapter1.pdf','string'),(328,58,'fileStage','4','int'),(329,58,'sourceSubmissionFileId','9','int'),(330,58,'submissionFileId','15','int'),(331,58,'fileId','6','int'),(332,58,'submissionId','2','int'),(333,58,'originalFileName','chapter3.pdf','string'),(334,58,'username','dbarnes','string'),(335,59,'fileStage','4','int'),(336,59,'submissionFileId','15','int'),(337,59,'fileId','6','int'),(338,59,'submissionId','2','int'),(339,59,'username','dbarnes','string'),(340,59,'name','chapter3.pdf','string'),(341,60,'reviewAssignmentId','2','int'),(342,60,'reviewerName','Al Zacharia','string'),(343,60,'submissionId','2','int'),(344,60,'stageId','3','int'),(345,60,'round','1','int'),(346,61,'reviewAssignmentId','3','int'),(347,61,'reviewerName','Gonzalo Favio','string'),(348,61,'submissionId','2','int'),(349,61,'stageId','3','int'),(350,61,'round','1','int'),(351,64,'fileStage','2','int'),(352,64,'sourceSubmissionFileId',NULL,'string'),(353,64,'submissionFileId','16','int'),(354,64,'fileId','9','int'),(355,64,'submissionId','3','int'),(356,64,'originalFileName','chapter1.pdf','string'),(357,64,'username','bbarnetson','string'),(358,65,'fileStage','2','int'),(359,65,'submissionFileId','16','int'),(360,65,'fileId','9','int'),(361,65,'submissionId','3','int'),(362,65,'username','bbarnetson','string'),(363,65,'name','chapter1.pdf','string'),(364,66,'fileStage','2','int'),(365,66,'sourceSubmissionFileId',NULL,'string'),(366,66,'submissionFileId','16','int'),(367,66,'fileId','9','int'),(368,66,'submissionId','3','int'),(369,66,'originalFileName','chapter1.pdf','string'),(370,66,'username','bbarnetson','string'),(371,67,'fileStage','2','int'),(372,67,'sourceSubmissionFileId',NULL,'string'),(373,67,'submissionFileId','16','int'),(374,67,'fileId','9','int'),(375,67,'submissionId','3','int'),(376,67,'username','bbarnetson','string'),(377,67,'originalFileName','chapter1.pdf','string'),(378,67,'name','chapter1.pdf','string'),(379,68,'fileStage','2','int'),(380,68,'sourceSubmissionFileId',NULL,'string'),(381,68,'submissionFileId','17','int'),(382,68,'fileId','10','int'),(383,68,'submissionId','3','int'),(384,68,'originalFileName','chapter2.pdf','string'),(385,68,'username','bbarnetson','string'),(386,69,'fileStage','2','int'),(387,69,'submissionFileId','17','int'),(388,69,'fileId','10','int'),(389,69,'submissionId','3','int'),(390,69,'username','bbarnetson','string'),(391,69,'name','chapter2.pdf','string'),(392,70,'fileStage','2','int'),(393,70,'sourceSubmissionFileId',NULL,'string'),(394,70,'submissionFileId','17','int'),(395,70,'fileId','10','int'),(396,70,'submissionId','3','int'),(397,70,'originalFileName','chapter2.pdf','string'),(398,70,'username','bbarnetson','string'),(399,71,'fileStage','2','int'),(400,71,'sourceSubmissionFileId',NULL,'string'),(401,71,'submissionFileId','17','int'),(402,71,'fileId','10','int'),(403,71,'submissionId','3','int'),(404,71,'username','bbarnetson','string'),(405,71,'originalFileName','chapter2.pdf','string'),(406,71,'name','chapter2.pdf','string'),(407,72,'fileStage','2','int'),(408,72,'sourceSubmissionFileId',NULL,'string'),(409,72,'submissionFileId','18','int'),(410,72,'fileId','11','int'),(411,72,'submissionId','3','int'),(412,72,'originalFileName','chapter3.pdf','string'),(413,72,'username','bbarnetson','string'),(414,73,'fileStage','2','int'),(415,73,'submissionFileId','18','int'),(416,73,'fileId','11','int'),(417,73,'submissionId','3','int'),(418,73,'username','bbarnetson','string'),(419,73,'name','chapter3.pdf','string'),(420,74,'fileStage','2','int'),(421,74,'sourceSubmissionFileId',NULL,'string'),(422,74,'submissionFileId','18','int'),(423,74,'fileId','11','int'),(424,74,'submissionId','3','int'),(425,74,'originalFileName','chapter3.pdf','string'),(426,74,'username','bbarnetson','string'),(427,75,'fileStage','2','int'),(428,75,'sourceSubmissionFileId',NULL,'string'),(429,75,'submissionFileId','18','int'),(430,75,'fileId','11','int'),(431,75,'submissionId','3','int'),(432,75,'username','bbarnetson','string'),(433,75,'originalFileName','chapter3.pdf','string'),(434,75,'name','chapter3.pdf','string'),(435,76,'fileStage','2','int'),(436,76,'sourceSubmissionFileId',NULL,'string'),(437,76,'submissionFileId','19','int'),(438,76,'fileId','12','int'),(439,76,'submissionId','3','int'),(440,76,'originalFileName','chapter4.pdf','string'),(441,76,'username','bbarnetson','string'),(442,77,'fileStage','2','int'),(443,77,'submissionFileId','19','int'),(444,77,'fileId','12','int'),(445,77,'submissionId','3','int'),(446,77,'username','bbarnetson','string'),(447,77,'name','chapter4.pdf','string'),(448,78,'fileStage','2','int'),(449,78,'sourceSubmissionFileId',NULL,'string'),(450,78,'submissionFileId','19','int'),(451,78,'fileId','12','int'),(452,78,'submissionId','3','int'),(453,78,'originalFileName','chapter4.pdf','string'),(454,78,'username','bbarnetson','string'),(455,79,'fileStage','2','int'),(456,79,'sourceSubmissionFileId',NULL,'string'),(457,79,'submissionFileId','19','int'),(458,79,'fileId','12','int'),(459,79,'submissionId','3','int'),(460,79,'username','bbarnetson','string'),(461,79,'originalFileName','chapter4.pdf','string'),(462,79,'name','chapter4.pdf','string'),(463,80,'fileStage','2','int'),(464,80,'sourceSubmissionFileId',NULL,'string'),(465,80,'submissionFileId','20','int'),(466,80,'fileId','13','int'),(467,80,'submissionId','3','int'),(468,80,'originalFileName','chapter5.pdf','string'),(469,80,'username','bbarnetson','string'),(470,81,'fileStage','2','int'),(471,81,'submissionFileId','20','int'),(472,81,'fileId','13','int'),(473,81,'submissionId','3','int'),(474,81,'username','bbarnetson','string'),(475,81,'name','chapter5.pdf','string'),(476,82,'fileStage','2','int'),(477,82,'sourceSubmissionFileId',NULL,'string'),(478,82,'submissionFileId','20','int'),(479,82,'fileId','13','int'),(480,82,'submissionId','3','int'),(481,82,'originalFileName','chapter5.pdf','string'),(482,82,'username','bbarnetson','string'),(483,83,'fileStage','2','int'),(484,83,'sourceSubmissionFileId',NULL,'string'),(485,83,'submissionFileId','20','int'),(486,83,'fileId','13','int'),(487,83,'submissionId','3','int'),(488,83,'username','bbarnetson','string'),(489,83,'originalFileName','chapter5.pdf','string'),(490,83,'name','chapter5.pdf','string'),(491,87,'fileStage','2','int'),(492,87,'sourceSubmissionFileId',NULL,'string'),(493,87,'submissionFileId','21','int'),(494,87,'fileId','14','int'),(495,87,'submissionId','4','int'),(496,87,'originalFileName','chapter1.pdf','string'),(497,87,'username','bbeaty','string'),(498,88,'fileStage','2','int'),(499,88,'submissionFileId','21','int'),(500,88,'fileId','14','int'),(501,88,'submissionId','4','int'),(502,88,'username','bbeaty','string'),(503,88,'name','chapter1.pdf','string'),(504,89,'fileStage','2','int'),(505,89,'sourceSubmissionFileId',NULL,'string'),(506,89,'submissionFileId','21','int'),(507,89,'fileId','14','int'),(508,89,'submissionId','4','int'),(509,89,'originalFileName','chapter1.pdf','string'),(510,89,'username','bbeaty','string'),(511,90,'fileStage','2','int'),(512,90,'sourceSubmissionFileId',NULL,'string'),(513,90,'submissionFileId','21','int'),(514,90,'fileId','14','int'),(515,90,'submissionId','4','int'),(516,90,'username','bbeaty','string'),(517,90,'originalFileName','chapter1.pdf','string'),(518,90,'name','chapter1.pdf','string'),(519,91,'fileStage','2','int'),(520,91,'sourceSubmissionFileId',NULL,'string'),(521,91,'submissionFileId','22','int'),(522,91,'fileId','15','int'),(523,91,'submissionId','4','int'),(524,91,'originalFileName','chapter2.pdf','string'),(525,91,'username','bbeaty','string'),(526,92,'fileStage','2','int'),(527,92,'submissionFileId','22','int'),(528,92,'fileId','15','int'),(529,92,'submissionId','4','int'),(530,92,'username','bbeaty','string'),(531,92,'name','chapter2.pdf','string'),(532,93,'fileStage','2','int'),(533,93,'sourceSubmissionFileId',NULL,'string'),(534,93,'submissionFileId','22','int'),(535,93,'fileId','15','int'),(536,93,'submissionId','4','int'),(537,93,'originalFileName','chapter2.pdf','string'),(538,93,'username','bbeaty','string'),(539,94,'fileStage','2','int'),(540,94,'sourceSubmissionFileId',NULL,'string'),(541,94,'submissionFileId','22','int'),(542,94,'fileId','15','int'),(543,94,'submissionId','4','int'),(544,94,'username','bbeaty','string'),(545,94,'originalFileName','chapter2.pdf','string'),(546,94,'name','chapter2.pdf','string'),(547,95,'fileStage','2','int'),(548,95,'sourceSubmissionFileId',NULL,'string'),(549,95,'submissionFileId','23','int'),(550,95,'fileId','16','int'),(551,95,'submissionId','4','int'),(552,95,'originalFileName','chapter3.pdf','string'),(553,95,'username','bbeaty','string'),(554,96,'fileStage','2','int'),(555,96,'submissionFileId','23','int'),(556,96,'fileId','16','int'),(557,96,'submissionId','4','int'),(558,96,'username','bbeaty','string'),(559,96,'name','chapter3.pdf','string'),(560,97,'fileStage','2','int'),(561,97,'sourceSubmissionFileId',NULL,'string'),(562,97,'submissionFileId','23','int'),(563,97,'fileId','16','int'),(564,97,'submissionId','4','int'),(565,97,'originalFileName','chapter3.pdf','string'),(566,97,'username','bbeaty','string'),(567,98,'fileStage','2','int'),(568,98,'sourceSubmissionFileId',NULL,'string'),(569,98,'submissionFileId','23','int'),(570,98,'fileId','16','int'),(571,98,'submissionId','4','int'),(572,98,'username','bbeaty','string'),(573,98,'originalFileName','chapter3.pdf','string'),(574,98,'name','chapter3.pdf','string'),(575,99,'fileStage','2','int'),(576,99,'sourceSubmissionFileId',NULL,'string'),(577,99,'submissionFileId','24','int'),(578,99,'fileId','17','int'),(579,99,'submissionId','4','int'),(580,99,'originalFileName','intro.pdf','string'),(581,99,'username','bbeaty','string'),(582,100,'fileStage','2','int'),(583,100,'submissionFileId','24','int'),(584,100,'fileId','17','int'),(585,100,'submissionId','4','int'),(586,100,'username','bbeaty','string'),(587,100,'name','intro.pdf','string'),(588,101,'fileStage','2','int'),(589,101,'sourceSubmissionFileId',NULL,'string'),(590,101,'submissionFileId','24','int'),(591,101,'fileId','17','int'),(592,101,'submissionId','4','int'),(593,101,'originalFileName','intro.pdf','string'),(594,101,'username','bbeaty','string'),(595,102,'fileStage','2','int'),(596,102,'sourceSubmissionFileId',NULL,'string'),(597,102,'submissionFileId','24','int'),(598,102,'fileId','17','int'),(599,102,'submissionId','4','int'),(600,102,'username','bbeaty','string'),(601,102,'originalFileName','intro.pdf','string'),(602,102,'name','intro.pdf','string'),(603,104,'editorId','3','int'),(604,104,'editorName','Daniel Barnes','string'),(605,104,'submissionId','4','int'),(606,104,'decision','1','int'),(607,105,'fileStage','19','int'),(608,105,'sourceSubmissionFileId','24','int'),(609,105,'submissionFileId','25','int'),(610,105,'fileId','17','int'),(611,105,'submissionId','4','int'),(612,105,'originalFileName','intro.pdf','string'),(613,105,'username','dbarnes','string'),(614,106,'fileStage','19','int'),(615,106,'submissionFileId','25','int'),(616,106,'fileId','17','int'),(617,106,'submissionId','4','int'),(618,106,'username','dbarnes','string'),(619,106,'name','intro.pdf','string'),(620,107,'fileStage','19','int'),(621,107,'sourceSubmissionFileId','23','int'),(622,107,'submissionFileId','26','int'),(623,107,'fileId','16','int'),(624,107,'submissionId','4','int'),(625,107,'originalFileName','chapter3.pdf','string'),(626,107,'username','dbarnes','string'),(627,108,'fileStage','19','int'),(628,108,'submissionFileId','26','int'),(629,108,'fileId','16','int'),(630,108,'submissionId','4','int'),(631,108,'username','dbarnes','string'),(632,108,'name','chapter3.pdf','string'),(633,109,'fileStage','19','int'),(634,109,'sourceSubmissionFileId','22','int'),(635,109,'submissionFileId','27','int'),(636,109,'fileId','15','int'),(637,109,'submissionId','4','int'),(638,109,'originalFileName','chapter2.pdf','string'),(639,109,'username','dbarnes','string'),(640,110,'fileStage','19','int'),(641,110,'submissionFileId','27','int'),(642,110,'fileId','15','int'),(643,110,'submissionId','4','int'),(644,110,'username','dbarnes','string'),(645,110,'name','chapter2.pdf','string'),(646,111,'fileStage','19','int'),(647,111,'sourceSubmissionFileId','21','int'),(648,111,'submissionFileId','28','int'),(649,111,'fileId','14','int'),(650,111,'submissionId','4','int'),(651,111,'originalFileName','chapter1.pdf','string'),(652,111,'username','dbarnes','string'),(653,112,'fileStage','19','int'),(654,112,'submissionFileId','28','int'),(655,112,'fileId','14','int'),(656,112,'submissionId','4','int'),(657,112,'username','dbarnes','string'),(658,112,'name','chapter1.pdf','string'),(659,113,'reviewAssignmentId','4','int'),(660,113,'reviewerName','Aisla McCrae','string'),(661,113,'submissionId','4','int'),(662,113,'stageId','2','int'),(663,113,'round','1','int'),(664,114,'editorId','3','int'),(665,114,'editorName','Daniel Barnes','string'),(666,114,'submissionId','4','int'),(667,114,'decision','3','int'),(668,115,'reviewAssignmentId','5','int'),(669,115,'reviewerName','Al Zacharia','string'),(670,115,'submissionId','4','int'),(671,115,'stageId','3','int'),(672,115,'round','1','int'),(673,116,'editorId','3','int'),(674,116,'editorName','Daniel Barnes','string'),(675,116,'submissionId','4','int'),(676,116,'decision','2','int'),(677,117,'name','Maria Fritz','string'),(678,117,'username','mfritz','string'),(679,117,'userGroupName','Copyeditor','string'),(680,118,'editorId','3','int'),(681,118,'editorName','Daniel Barnes','string'),(682,118,'submissionId','4','int'),(683,118,'decision','7','int'),(684,119,'name','Graham Cox','string'),(685,119,'username','gcox','string'),(686,119,'userGroupName','Layout Editor','string'),(687,120,'formatName','PDF','string'),(688,123,'fileStage','2','int'),(689,123,'sourceSubmissionFileId',NULL,'string'),(690,123,'submissionFileId','29','int'),(691,123,'fileId','18','int'),(692,123,'submissionId','5','int'),(693,123,'originalFileName','prologue.pdf','string'),(694,123,'username','callan','string'),(695,124,'fileStage','2','int'),(696,124,'submissionFileId','29','int'),(697,124,'fileId','18','int'),(698,124,'submissionId','5','int'),(699,124,'username','callan','string'),(700,124,'name','prologue.pdf','string'),(701,125,'fileStage','2','int'),(702,125,'sourceSubmissionFileId',NULL,'string'),(703,125,'submissionFileId','29','int'),(704,125,'fileId','18','int'),(705,125,'submissionId','5','int'),(706,125,'originalFileName','prologue.pdf','string'),(707,125,'username','callan','string'),(708,126,'fileStage','2','int'),(709,126,'sourceSubmissionFileId',NULL,'string'),(710,126,'submissionFileId','29','int'),(711,126,'fileId','18','int'),(712,126,'submissionId','5','int'),(713,126,'username','callan','string'),(714,126,'originalFileName','prologue.pdf','string'),(715,126,'name','prologue.pdf','string'),(716,127,'fileStage','2','int'),(717,127,'sourceSubmissionFileId',NULL,'string'),(718,127,'submissionFileId','30','int'),(719,127,'fileId','19','int'),(720,127,'submissionId','5','int'),(721,127,'originalFileName','chapter1.pdf','string'),(722,127,'username','callan','string'),(723,128,'fileStage','2','int'),(724,128,'submissionFileId','30','int'),(725,128,'fileId','19','int'),(726,128,'submissionId','5','int'),(727,128,'username','callan','string'),(728,128,'name','chapter1.pdf','string'),(729,129,'fileStage','2','int'),(730,129,'sourceSubmissionFileId',NULL,'string'),(731,129,'submissionFileId','30','int'),(732,129,'fileId','19','int'),(733,129,'submissionId','5','int'),(734,129,'originalFileName','chapter1.pdf','string'),(735,129,'username','callan','string'),(736,130,'fileStage','2','int'),(737,130,'sourceSubmissionFileId',NULL,'string'),(738,130,'submissionFileId','30','int'),(739,130,'fileId','19','int'),(740,130,'submissionId','5','int'),(741,130,'username','callan','string'),(742,130,'originalFileName','chapter1.pdf','string'),(743,130,'name','chapter1.pdf','string'),(744,131,'fileStage','2','int'),(745,131,'sourceSubmissionFileId',NULL,'string'),(746,131,'submissionFileId','31','int'),(747,131,'fileId','20','int'),(748,131,'submissionId','5','int'),(749,131,'originalFileName','chapter2.pdf','string'),(750,131,'username','callan','string'),(751,132,'fileStage','2','int'),(752,132,'submissionFileId','31','int'),(753,132,'fileId','20','int'),(754,132,'submissionId','5','int'),(755,132,'username','callan','string'),(756,132,'name','chapter2.pdf','string'),(757,133,'fileStage','2','int'),(758,133,'sourceSubmissionFileId',NULL,'string'),(759,133,'submissionFileId','31','int'),(760,133,'fileId','20','int'),(761,133,'submissionId','5','int'),(762,133,'originalFileName','chapter2.pdf','string'),(763,133,'username','callan','string'),(764,134,'fileStage','2','int'),(765,134,'sourceSubmissionFileId',NULL,'string'),(766,134,'submissionFileId','31','int'),(767,134,'fileId','20','int'),(768,134,'submissionId','5','int'),(769,134,'username','callan','string'),(770,134,'originalFileName','chapter2.pdf','string'),(771,134,'name','chapter2.pdf','string'),(772,135,'fileStage','2','int'),(773,135,'sourceSubmissionFileId',NULL,'string'),(774,135,'submissionFileId','32','int'),(775,135,'fileId','21','int'),(776,135,'submissionId','5','int'),(777,135,'originalFileName','chapter3.pdf','string'),(778,135,'username','callan','string'),(779,136,'fileStage','2','int'),(780,136,'submissionFileId','32','int'),(781,136,'fileId','21','int'),(782,136,'submissionId','5','int'),(783,136,'username','callan','string'),(784,136,'name','chapter3.pdf','string'),(785,137,'fileStage','2','int'),(786,137,'sourceSubmissionFileId',NULL,'string'),(787,137,'submissionFileId','32','int'),(788,137,'fileId','21','int'),(789,137,'submissionId','5','int'),(790,137,'originalFileName','chapter3.pdf','string'),(791,137,'username','callan','string'),(792,138,'fileStage','2','int'),(793,138,'sourceSubmissionFileId',NULL,'string'),(794,138,'submissionFileId','32','int'),(795,138,'fileId','21','int'),(796,138,'submissionId','5','int'),(797,138,'username','callan','string'),(798,138,'originalFileName','chapter3.pdf','string'),(799,138,'name','chapter3.pdf','string'),(800,139,'fileStage','2','int'),(801,139,'sourceSubmissionFileId',NULL,'string'),(802,139,'submissionFileId','33','int'),(803,139,'fileId','22','int'),(804,139,'submissionId','5','int'),(805,139,'originalFileName','chapter4.pdf','string'),(806,139,'username','callan','string'),(807,140,'fileStage','2','int'),(808,140,'submissionFileId','33','int'),(809,140,'fileId','22','int'),(810,140,'submissionId','5','int'),(811,140,'username','callan','string'),(812,140,'name','chapter4.pdf','string'),(813,141,'fileStage','2','int'),(814,141,'sourceSubmissionFileId',NULL,'string'),(815,141,'submissionFileId','33','int'),(816,141,'fileId','22','int'),(817,141,'submissionId','5','int'),(818,141,'originalFileName','chapter4.pdf','string'),(819,141,'username','callan','string'),(820,142,'fileStage','2','int'),(821,142,'sourceSubmissionFileId',NULL,'string'),(822,142,'submissionFileId','33','int'),(823,142,'fileId','22','int'),(824,142,'submissionId','5','int'),(825,142,'username','callan','string'),(826,142,'originalFileName','chapter4.pdf','string'),(827,142,'name','chapter4.pdf','string'),(828,143,'fileStage','2','int'),(829,143,'sourceSubmissionFileId',NULL,'string'),(830,143,'submissionFileId','34','int'),(831,143,'fileId','23','int'),(832,143,'submissionId','5','int'),(833,143,'originalFileName','epilogue.pdf','string'),(834,143,'username','callan','string'),(835,144,'fileStage','2','int'),(836,144,'submissionFileId','34','int'),(837,144,'fileId','23','int'),(838,144,'submissionId','5','int'),(839,144,'username','callan','string'),(840,144,'name','epilogue.pdf','string'),(841,145,'fileStage','2','int'),(842,145,'sourceSubmissionFileId',NULL,'string'),(843,145,'submissionFileId','34','int'),(844,145,'fileId','23','int'),(845,145,'submissionId','5','int'),(846,145,'originalFileName','epilogue.pdf','string'),(847,145,'username','callan','string'),(848,146,'fileStage','2','int'),(849,146,'sourceSubmissionFileId',NULL,'string'),(850,146,'submissionFileId','34','int'),(851,146,'fileId','23','int'),(852,146,'submissionId','5','int'),(853,146,'username','callan','string'),(854,146,'originalFileName','epilogue.pdf','string'),(855,146,'name','epilogue.pdf','string'),(856,148,'editorId','3','int'),(857,148,'editorName','Daniel Barnes','string'),(858,148,'submissionId','5','int'),(859,148,'decision','1','int'),(860,149,'fileStage','19','int'),(861,149,'sourceSubmissionFileId','34','int'),(862,149,'submissionFileId','35','int'),(863,149,'fileId','23','int'),(864,149,'submissionId','5','int'),(865,149,'originalFileName','epilogue.pdf','string'),(866,149,'username','dbarnes','string'),(867,150,'fileStage','19','int'),(868,150,'submissionFileId','35','int'),(869,150,'fileId','23','int'),(870,150,'submissionId','5','int'),(871,150,'username','dbarnes','string'),(872,150,'name','epilogue.pdf','string'),(873,151,'fileStage','19','int'),(874,151,'sourceSubmissionFileId','33','int'),(875,151,'submissionFileId','36','int'),(876,151,'fileId','22','int'),(877,151,'submissionId','5','int'),(878,151,'originalFileName','chapter4.pdf','string'),(879,151,'username','dbarnes','string'),(880,152,'fileStage','19','int'),(881,152,'submissionFileId','36','int'),(882,152,'fileId','22','int'),(883,152,'submissionId','5','int'),(884,152,'username','dbarnes','string'),(885,152,'name','chapter4.pdf','string'),(886,153,'fileStage','19','int'),(887,153,'sourceSubmissionFileId','31','int'),(888,153,'submissionFileId','37','int'),(889,153,'fileId','20','int'),(890,153,'submissionId','5','int'),(891,153,'originalFileName','chapter2.pdf','string'),(892,153,'username','dbarnes','string'),(893,154,'fileStage','19','int'),(894,154,'submissionFileId','37','int'),(895,154,'fileId','20','int'),(896,154,'submissionId','5','int'),(897,154,'username','dbarnes','string'),(898,154,'name','chapter2.pdf','string'),(899,155,'fileStage','19','int'),(900,155,'sourceSubmissionFileId','30','int'),(901,155,'submissionFileId','38','int'),(902,155,'fileId','19','int'),(903,155,'submissionId','5','int'),(904,155,'originalFileName','chapter1.pdf','string'),(905,155,'username','dbarnes','string'),(906,156,'fileStage','19','int'),(907,156,'submissionFileId','38','int'),(908,156,'fileId','19','int'),(909,156,'submissionId','5','int'),(910,156,'username','dbarnes','string'),(911,156,'name','chapter1.pdf','string'),(912,157,'fileStage','19','int'),(913,157,'sourceSubmissionFileId','29','int'),(914,157,'submissionFileId','39','int'),(915,157,'fileId','18','int'),(916,157,'submissionId','5','int'),(917,157,'originalFileName','prologue.pdf','string'),(918,157,'username','dbarnes','string'),(919,158,'fileStage','19','int'),(920,158,'submissionFileId','39','int'),(921,158,'fileId','18','int'),(922,158,'submissionId','5','int'),(923,158,'username','dbarnes','string'),(924,158,'name','prologue.pdf','string'),(925,159,'fileStage','19','int'),(926,159,'sourceSubmissionFileId','32','int'),(927,159,'submissionFileId','40','int'),(928,159,'fileId','21','int'),(929,159,'submissionId','5','int'),(930,159,'originalFileName','chapter3.pdf','string'),(931,159,'username','dbarnes','string'),(932,160,'fileStage','19','int'),(933,160,'submissionFileId','40','int'),(934,160,'fileId','21','int'),(935,160,'submissionId','5','int'),(936,160,'username','dbarnes','string'),(937,160,'name','chapter3.pdf','string'),(938,161,'reviewAssignmentId','6','int'),(939,161,'reviewerName','Paul Hudson','string'),(940,161,'submissionId','5','int'),(941,161,'stageId','2','int'),(942,161,'round','1','int'),(943,162,'editorId','3','int'),(944,162,'editorName','Daniel Barnes','string'),(945,162,'submissionId','5','int'),(946,162,'decision','3','int'),(947,163,'reviewAssignmentId','7','int'),(948,163,'reviewerName','Gonzalo Favio','string'),(949,163,'submissionId','5','int'),(950,163,'stageId','3','int'),(951,163,'round','1','int'),(952,164,'editorId','3','int'),(953,164,'editorName','Daniel Barnes','string'),(954,164,'submissionId','5','int'),(955,164,'decision','2','int'),(956,165,'name','Sarah Vogt','string'),(957,165,'username','svogt','string'),(958,165,'userGroupName','Copyeditor','string'),(959,166,'editorId','3','int'),(960,166,'editorName','Daniel Barnes','string'),(961,166,'submissionId','5','int'),(962,166,'decision','7','int'),(963,167,'name','Stephen Hellier','string'),(964,167,'username','shellier','string'),(965,167,'userGroupName','Layout Editor','string'),(966,168,'name','Catherine Turner','string'),(967,168,'username','cturner','string'),(968,168,'userGroupName','Proofreader','string'),(969,169,'formatName','PDF','string'),(970,170,'fileStage','10','int'),(971,170,'sourceSubmissionFileId','34','int'),(972,170,'submissionFileId','41','int'),(973,170,'fileId','23','int'),(974,170,'submissionId','5','int'),(975,170,'originalFileName','epilogue.pdf','string'),(976,170,'username','dbarnes','string'),(977,171,'fileStage','10','int'),(978,171,'submissionFileId','41','int'),(979,171,'fileId','23','int'),(980,171,'submissionId','5','int'),(981,171,'username','dbarnes','string'),(982,171,'name','epilogue.pdf','string'),(983,172,'publicationFormatName','PDF','string'),(984,173,'publicationFormatName','PDF','string'),(985,174,'fileStage','10','int'),(986,174,'sourceSubmissionFileId','34','int'),(987,174,'submissionFileId','41','int'),(988,174,'fileId','23','int'),(989,174,'submissionId','5','int'),(990,174,'originalFileName','epilogue.pdf','string'),(991,174,'username','dbarnes','string'),(992,175,'fileStage','10','int'),(993,175,'sourceSubmissionFileId','34','int'),(994,175,'submissionFileId','41','int'),(995,175,'fileId','23','int'),(996,175,'submissionId','5','int'),(997,175,'username','dbarnes','string'),(998,175,'originalFileName','epilogue.pdf','string'),(999,175,'name','epilogue.pdf','string'),(1000,176,'file','epilogue.pdf','string'),(1001,176,'name','Daniel Barnes','string'),(1002,176,'username','dbarnes','string'),(1003,177,'fileStage','10','int'),(1004,177,'sourceSubmissionFileId','34','int'),(1005,177,'submissionFileId','41','int'),(1006,177,'fileId','23','int'),(1007,177,'submissionId','5','int'),(1008,177,'originalFileName','epilogue.pdf','string'),(1009,177,'username','dbarnes','string'),(1010,178,'fileStage','10','int'),(1011,178,'sourceSubmissionFileId','34','int'),(1012,178,'submissionFileId','41','int'),(1013,178,'fileId','23','int'),(1014,178,'submissionId','5','int'),(1015,178,'username','dbarnes','string'),(1016,178,'originalFileName','epilogue.pdf','string'),(1017,178,'name','epilogue.pdf','string'),(1018,184,'fileStage','2','int'),(1019,184,'sourceSubmissionFileId',NULL,'string'),(1020,184,'submissionFileId','42','int'),(1021,184,'fileId','24','int'),(1022,184,'submissionId','6','int'),(1023,184,'originalFileName','chapter1.pdf','string'),(1024,184,'username','dbernnard','string'),(1025,185,'fileStage','2','int'),(1026,185,'submissionFileId','42','int'),(1027,185,'fileId','24','int'),(1028,185,'submissionId','6','int'),(1029,185,'username','dbernnard','string'),(1030,185,'name','chapter1.pdf','string'),(1031,186,'fileStage','2','int'),(1032,186,'sourceSubmissionFileId',NULL,'string'),(1033,186,'submissionFileId','42','int'),(1034,186,'fileId','24','int'),(1035,186,'submissionId','6','int'),(1036,186,'originalFileName','chapter1.pdf','string'),(1037,186,'username','dbernnard','string'),(1038,187,'fileStage','2','int'),(1039,187,'sourceSubmissionFileId',NULL,'string'),(1040,187,'submissionFileId','42','int'),(1041,187,'fileId','24','int'),(1042,187,'submissionId','6','int'),(1043,187,'username','dbernnard','string'),(1044,187,'originalFileName','chapter1.pdf','string'),(1045,187,'name','chapter1.pdf','string'),(1046,188,'fileStage','2','int'),(1047,188,'sourceSubmissionFileId',NULL,'string'),(1048,188,'submissionFileId','43','int'),(1049,188,'fileId','25','int'),(1050,188,'submissionId','6','int'),(1051,188,'originalFileName','chapter2.pdf','string'),(1052,188,'username','dbernnard','string'),(1053,189,'fileStage','2','int'),(1054,189,'submissionFileId','43','int'),(1055,189,'fileId','25','int'),(1056,189,'submissionId','6','int'),(1057,189,'username','dbernnard','string'),(1058,189,'name','chapter2.pdf','string'),(1059,190,'fileStage','2','int'),(1060,190,'sourceSubmissionFileId',NULL,'string'),(1061,190,'submissionFileId','43','int'),(1062,190,'fileId','25','int'),(1063,190,'submissionId','6','int'),(1064,190,'originalFileName','chapter2.pdf','string'),(1065,190,'username','dbernnard','string'),(1066,191,'fileStage','2','int'),(1067,191,'sourceSubmissionFileId',NULL,'string'),(1068,191,'submissionFileId','43','int'),(1069,191,'fileId','25','int'),(1070,191,'submissionId','6','int'),(1071,191,'username','dbernnard','string'),(1072,191,'originalFileName','chapter2.pdf','string'),(1073,191,'name','chapter2.pdf','string'),(1074,192,'fileStage','2','int'),(1075,192,'sourceSubmissionFileId',NULL,'string'),(1076,192,'submissionFileId','44','int'),(1077,192,'fileId','26','int'),(1078,192,'submissionId','6','int'),(1079,192,'originalFileName','chapter3.pdf','string'),(1080,192,'username','dbernnard','string'),(1081,193,'fileStage','2','int'),(1082,193,'submissionFileId','44','int'),(1083,193,'fileId','26','int'),(1084,193,'submissionId','6','int'),(1085,193,'username','dbernnard','string'),(1086,193,'name','chapter3.pdf','string'),(1087,194,'fileStage','2','int'),(1088,194,'sourceSubmissionFileId',NULL,'string'),(1089,194,'submissionFileId','44','int'),(1090,194,'fileId','26','int'),(1091,194,'submissionId','6','int'),(1092,194,'originalFileName','chapter3.pdf','string'),(1093,194,'username','dbernnard','string'),(1094,195,'fileStage','2','int'),(1095,195,'sourceSubmissionFileId',NULL,'string'),(1096,195,'submissionFileId','44','int'),(1097,195,'fileId','26','int'),(1098,195,'submissionId','6','int'),(1099,195,'username','dbernnard','string'),(1100,195,'originalFileName','chapter3.pdf','string'),(1101,195,'name','chapter3.pdf','string'),(1102,196,'fileStage','2','int'),(1103,196,'sourceSubmissionFileId',NULL,'string'),(1104,196,'submissionFileId','45','int'),(1105,196,'fileId','27','int'),(1106,196,'submissionId','6','int'),(1107,196,'originalFileName','chapter4.pdf','string'),(1108,196,'username','dbernnard','string'),(1109,197,'fileStage','2','int'),(1110,197,'submissionFileId','45','int'),(1111,197,'fileId','27','int'),(1112,197,'submissionId','6','int'),(1113,197,'username','dbernnard','string'),(1114,197,'name','chapter4.pdf','string'),(1115,198,'fileStage','2','int'),(1116,198,'sourceSubmissionFileId',NULL,'string'),(1117,198,'submissionFileId','45','int'),(1118,198,'fileId','27','int'),(1119,198,'submissionId','6','int'),(1120,198,'originalFileName','chapter4.pdf','string'),(1121,198,'username','dbernnard','string'),(1122,199,'fileStage','2','int'),(1123,199,'sourceSubmissionFileId',NULL,'string'),(1124,199,'submissionFileId','45','int'),(1125,199,'fileId','27','int'),(1126,199,'submissionId','6','int'),(1127,199,'username','dbernnard','string'),(1128,199,'originalFileName','chapter4.pdf','string'),(1129,199,'name','chapter4.pdf','string'),(1130,201,'editorId','3','int'),(1131,201,'editorName','Daniel Barnes','string'),(1132,201,'submissionId','6','int'),(1133,201,'decision','1','int'),(1134,202,'fileStage','19','int'),(1135,202,'sourceSubmissionFileId','45','int'),(1136,202,'submissionFileId','46','int'),(1137,202,'fileId','27','int'),(1138,202,'submissionId','6','int'),(1139,202,'originalFileName','chapter4.pdf','string'),(1140,202,'username','dbarnes','string'),(1141,203,'fileStage','19','int'),(1142,203,'submissionFileId','46','int'),(1143,203,'fileId','27','int'),(1144,203,'submissionId','6','int'),(1145,203,'username','dbarnes','string'),(1146,203,'name','chapter4.pdf','string'),(1147,204,'fileStage','19','int'),(1148,204,'sourceSubmissionFileId','44','int'),(1149,204,'submissionFileId','47','int'),(1150,204,'fileId','26','int'),(1151,204,'submissionId','6','int'),(1152,204,'originalFileName','chapter3.pdf','string'),(1153,204,'username','dbarnes','string'),(1154,205,'fileStage','19','int'),(1155,205,'submissionFileId','47','int'),(1156,205,'fileId','26','int'),(1157,205,'submissionId','6','int'),(1158,205,'username','dbarnes','string'),(1159,205,'name','chapter3.pdf','string'),(1160,206,'fileStage','19','int'),(1161,206,'sourceSubmissionFileId','43','int'),(1162,206,'submissionFileId','48','int'),(1163,206,'fileId','25','int'),(1164,206,'submissionId','6','int'),(1165,206,'originalFileName','chapter2.pdf','string'),(1166,206,'username','dbarnes','string'),(1167,207,'fileStage','19','int'),(1168,207,'submissionFileId','48','int'),(1169,207,'fileId','25','int'),(1170,207,'submissionId','6','int'),(1171,207,'username','dbarnes','string'),(1172,207,'name','chapter2.pdf','string'),(1173,208,'fileStage','19','int'),(1174,208,'sourceSubmissionFileId','42','int'),(1175,208,'submissionFileId','49','int'),(1176,208,'fileId','24','int'),(1177,208,'submissionId','6','int'),(1178,208,'originalFileName','chapter1.pdf','string'),(1179,208,'username','dbarnes','string'),(1180,209,'fileStage','19','int'),(1181,209,'submissionFileId','49','int'),(1182,209,'fileId','24','int'),(1183,209,'submissionId','6','int'),(1184,209,'username','dbarnes','string'),(1185,209,'name','chapter1.pdf','string'),(1186,210,'name','Daniel Barnes','string'),(1187,210,'username','dbarnes','string'),(1188,210,'userGroupName','Press editor','string'),(1189,211,'name','Minoti Inoue','string'),(1190,211,'username','minoue','string'),(1191,211,'userGroupName','Series editor','string'),(1192,212,'editorId','6','int'),(1193,212,'editorName','Minoti Inoue','string'),(1194,212,'submissionId','6','int'),(1195,212,'decision','23','int'),(1196,215,'fileStage','2','int'),(1197,215,'sourceSubmissionFileId',NULL,'string'),(1198,215,'submissionFileId','50','int'),(1199,215,'fileId','28','int'),(1200,215,'submissionId','7','int'),(1201,215,'originalFileName','intro.pdf','string'),(1202,215,'username','dkennepohl','string'),(1203,216,'fileStage','2','int'),(1204,216,'submissionFileId','50','int'),(1205,216,'fileId','28','int'),(1206,216,'submissionId','7','int'),(1207,216,'username','dkennepohl','string'),(1208,216,'name','intro.pdf','string'),(1209,217,'fileStage','2','int'),(1210,217,'sourceSubmissionFileId',NULL,'string'),(1211,217,'submissionFileId','50','int'),(1212,217,'fileId','28','int'),(1213,217,'submissionId','7','int'),(1214,217,'originalFileName','intro.pdf','string'),(1215,217,'username','dkennepohl','string'),(1216,218,'fileStage','2','int'),(1217,218,'sourceSubmissionFileId',NULL,'string'),(1218,218,'submissionFileId','50','int'),(1219,218,'fileId','28','int'),(1220,218,'submissionId','7','int'),(1221,218,'username','dkennepohl','string'),(1222,218,'originalFileName','intro.pdf','string'),(1223,218,'name','intro.pdf','string'),(1224,219,'fileStage','2','int'),(1225,219,'sourceSubmissionFileId',NULL,'string'),(1226,219,'submissionFileId','51','int'),(1227,219,'fileId','29','int'),(1228,219,'submissionId','7','int'),(1229,219,'originalFileName','chapter1.pdf','string'),(1230,219,'username','dkennepohl','string'),(1231,220,'fileStage','2','int'),(1232,220,'submissionFileId','51','int'),(1233,220,'fileId','29','int'),(1234,220,'submissionId','7','int'),(1235,220,'username','dkennepohl','string'),(1236,220,'name','chapter1.pdf','string'),(1237,221,'fileStage','2','int'),(1238,221,'sourceSubmissionFileId',NULL,'string'),(1239,221,'submissionFileId','51','int'),(1240,221,'fileId','29','int'),(1241,221,'submissionId','7','int'),(1242,221,'originalFileName','chapter1.pdf','string'),(1243,221,'username','dkennepohl','string'),(1244,222,'fileStage','2','int'),(1245,222,'sourceSubmissionFileId',NULL,'string'),(1246,222,'submissionFileId','51','int'),(1247,222,'fileId','29','int'),(1248,222,'submissionId','7','int'),(1249,222,'username','dkennepohl','string'),(1250,222,'originalFileName','chapter1.pdf','string'),(1251,222,'name','chapter1.pdf','string'),(1252,223,'fileStage','2','int'),(1253,223,'sourceSubmissionFileId',NULL,'string'),(1254,223,'submissionFileId','52','int'),(1255,223,'fileId','30','int'),(1256,223,'submissionId','7','int'),(1257,223,'originalFileName','chapter2.pdf','string'),(1258,223,'username','dkennepohl','string'),(1259,224,'fileStage','2','int'),(1260,224,'submissionFileId','52','int'),(1261,224,'fileId','30','int'),(1262,224,'submissionId','7','int'),(1263,224,'username','dkennepohl','string'),(1264,224,'name','chapter2.pdf','string'),(1265,225,'fileStage','2','int'),(1266,225,'sourceSubmissionFileId',NULL,'string'),(1267,225,'submissionFileId','52','int'),(1268,225,'fileId','30','int'),(1269,225,'submissionId','7','int'),(1270,225,'originalFileName','chapter2.pdf','string'),(1271,225,'username','dkennepohl','string'),(1272,226,'fileStage','2','int'),(1273,226,'sourceSubmissionFileId',NULL,'string'),(1274,226,'submissionFileId','52','int'),(1275,226,'fileId','30','int'),(1276,226,'submissionId','7','int'),(1277,226,'username','dkennepohl','string'),(1278,226,'originalFileName','chapter2.pdf','string'),(1279,226,'name','chapter2.pdf','string'),(1280,227,'fileStage','2','int'),(1281,227,'sourceSubmissionFileId',NULL,'string'),(1282,227,'submissionFileId','53','int'),(1283,227,'fileId','31','int'),(1284,227,'submissionId','7','int'),(1285,227,'originalFileName','chapter3.pdf','string'),(1286,227,'username','dkennepohl','string'),(1287,228,'fileStage','2','int'),(1288,228,'submissionFileId','53','int'),(1289,228,'fileId','31','int'),(1290,228,'submissionId','7','int'),(1291,228,'username','dkennepohl','string'),(1292,228,'name','chapter3.pdf','string'),(1293,229,'fileStage','2','int'),(1294,229,'sourceSubmissionFileId',NULL,'string'),(1295,229,'submissionFileId','53','int'),(1296,229,'fileId','31','int'),(1297,229,'submissionId','7','int'),(1298,229,'originalFileName','chapter3.pdf','string'),(1299,229,'username','dkennepohl','string'),(1300,230,'fileStage','2','int'),(1301,230,'sourceSubmissionFileId',NULL,'string'),(1302,230,'submissionFileId','53','int'),(1303,230,'fileId','31','int'),(1304,230,'submissionId','7','int'),(1305,230,'username','dkennepohl','string'),(1306,230,'originalFileName','chapter3.pdf','string'),(1307,230,'name','chapter3.pdf','string'),(1308,231,'fileStage','2','int'),(1309,231,'sourceSubmissionFileId',NULL,'string'),(1310,231,'submissionFileId','54','int'),(1311,231,'fileId','32','int'),(1312,231,'submissionId','7','int'),(1313,231,'originalFileName','chapter4.pdf','string'),(1314,231,'username','dkennepohl','string'),(1315,232,'fileStage','2','int'),(1316,232,'submissionFileId','54','int'),(1317,232,'fileId','32','int'),(1318,232,'submissionId','7','int'),(1319,232,'username','dkennepohl','string'),(1320,232,'name','chapter4.pdf','string'),(1321,233,'fileStage','2','int'),(1322,233,'sourceSubmissionFileId',NULL,'string'),(1323,233,'submissionFileId','54','int'),(1324,233,'fileId','32','int'),(1325,233,'submissionId','7','int'),(1326,233,'originalFileName','chapter4.pdf','string'),(1327,233,'username','dkennepohl','string'),(1328,234,'fileStage','2','int'),(1329,234,'sourceSubmissionFileId',NULL,'string'),(1330,234,'submissionFileId','54','int'),(1331,234,'fileId','32','int'),(1332,234,'submissionId','7','int'),(1333,234,'username','dkennepohl','string'),(1334,234,'originalFileName','chapter4.pdf','string'),(1335,234,'name','chapter4.pdf','string'),(1336,236,'editorId','3','int'),(1337,236,'editorName','Daniel Barnes','string'),(1338,236,'submissionId','7','int'),(1339,236,'decision','18','int'),(1340,237,'fileStage','4','int'),(1341,237,'sourceSubmissionFileId','54','int'),(1342,237,'submissionFileId','55','int'),(1343,237,'fileId','32','int'),(1344,237,'submissionId','7','int'),(1345,237,'originalFileName','chapter4.pdf','string'),(1346,237,'username','dbarnes','string'),(1347,238,'fileStage','4','int'),(1348,238,'submissionFileId','55','int'),(1349,238,'fileId','32','int'),(1350,238,'submissionId','7','int'),(1351,238,'username','dbarnes','string'),(1352,238,'name','chapter4.pdf','string'),(1353,239,'fileStage','4','int'),(1354,239,'sourceSubmissionFileId','53','int'),(1355,239,'submissionFileId','56','int'),(1356,239,'fileId','31','int'),(1357,239,'submissionId','7','int'),(1358,239,'originalFileName','chapter3.pdf','string'),(1359,239,'username','dbarnes','string'),(1360,240,'fileStage','4','int'),(1361,240,'submissionFileId','56','int'),(1362,240,'fileId','31','int'),(1363,240,'submissionId','7','int'),(1364,240,'username','dbarnes','string'),(1365,240,'name','chapter3.pdf','string'),(1366,241,'fileStage','4','int'),(1367,241,'sourceSubmissionFileId','52','int'),(1368,241,'submissionFileId','57','int'),(1369,241,'fileId','30','int'),(1370,241,'submissionId','7','int'),(1371,241,'originalFileName','chapter2.pdf','string'),(1372,241,'username','dbarnes','string'),(1373,242,'fileStage','4','int'),(1374,242,'submissionFileId','57','int'),(1375,242,'fileId','30','int'),(1376,242,'submissionId','7','int'),(1377,242,'username','dbarnes','string'),(1378,242,'name','chapter2.pdf','string'),(1379,243,'fileStage','4','int'),(1380,243,'sourceSubmissionFileId','51','int'),(1381,243,'submissionFileId','58','int'),(1382,243,'fileId','29','int'),(1383,243,'submissionId','7','int'),(1384,243,'originalFileName','chapter1.pdf','string'),(1385,243,'username','dbarnes','string'),(1386,244,'fileStage','4','int'),(1387,244,'submissionFileId','58','int'),(1388,244,'fileId','29','int'),(1389,244,'submissionId','7','int'),(1390,244,'username','dbarnes','string'),(1391,244,'name','chapter1.pdf','string'),(1392,245,'fileStage','4','int'),(1393,245,'sourceSubmissionFileId','50','int'),(1394,245,'submissionFileId','59','int'),(1395,245,'fileId','28','int'),(1396,245,'submissionId','7','int'),(1397,245,'originalFileName','intro.pdf','string'),(1398,245,'username','dbarnes','string'),(1399,246,'fileStage','4','int'),(1400,246,'submissionFileId','59','int'),(1401,246,'fileId','28','int'),(1402,246,'submissionId','7','int'),(1403,246,'username','dbarnes','string'),(1404,246,'name','intro.pdf','string'),(1405,247,'reviewAssignmentId','8','int'),(1406,247,'reviewerName','Adela Gallego','string'),(1407,247,'submissionId','7','int'),(1408,247,'stageId','3','int'),(1409,247,'round','1','int'),(1410,248,'editorId','3','int'),(1411,248,'editorName','Daniel Barnes','string'),(1412,248,'submissionId','7','int'),(1413,248,'decision','2','int'),(1414,249,'name','Maria Fritz','string'),(1415,249,'username','mfritz','string'),(1416,249,'userGroupName','Copyeditor','string'),(1417,251,'fileStage','2','int'),(1418,251,'sourceSubmissionFileId',NULL,'string'),(1419,251,'submissionFileId','60','int'),(1420,251,'fileId','33','int'),(1421,251,'submissionId','8','int'),(1422,251,'originalFileName','note.pdf','string'),(1423,251,'username','dbarnes','string'),(1424,252,'fileStage','2','int'),(1425,252,'submissionFileId','60','int'),(1426,252,'fileId','33','int'),(1427,252,'submissionId','8','int'),(1428,252,'username','dbarnes','string'),(1429,252,'name','note.pdf','string'),(1430,253,'fileStage','2','int'),(1431,253,'sourceSubmissionFileId',NULL,'string'),(1432,253,'submissionFileId','60','int'),(1433,253,'fileId','33','int'),(1434,253,'submissionId','8','int'),(1435,253,'originalFileName','note.pdf','string'),(1436,253,'username','dbarnes','string'),(1437,254,'fileStage','2','int'),(1438,254,'sourceSubmissionFileId',NULL,'string'),(1439,254,'submissionFileId','60','int'),(1440,254,'fileId','33','int'),(1441,254,'submissionId','8','int'),(1442,254,'username','dbarnes','string'),(1443,254,'originalFileName','note.pdf','string'),(1444,254,'name','note.pdf','string'),(1445,258,'fileStage','2','int'),(1446,258,'sourceSubmissionFileId',NULL,'string'),(1447,258,'submissionFileId','61','int'),(1448,258,'fileId','34','int'),(1449,258,'submissionId','9','int'),(1450,258,'originalFileName','chapter1.pdf','string'),(1451,258,'username','fperini','string'),(1452,259,'fileStage','2','int'),(1453,259,'submissionFileId','61','int'),(1454,259,'fileId','34','int'),(1455,259,'submissionId','9','int'),(1456,259,'username','fperini','string'),(1457,259,'name','chapter1.pdf','string'),(1458,260,'fileStage','2','int'),(1459,260,'sourceSubmissionFileId',NULL,'string'),(1460,260,'submissionFileId','61','int'),(1461,260,'fileId','34','int'),(1462,260,'submissionId','9','int'),(1463,260,'originalFileName','chapter1.pdf','string'),(1464,260,'username','fperini','string'),(1465,261,'fileStage','2','int'),(1466,261,'sourceSubmissionFileId',NULL,'string'),(1467,261,'submissionFileId','61','int'),(1468,261,'fileId','34','int'),(1469,261,'submissionId','9','int'),(1470,261,'username','fperini','string'),(1471,261,'originalFileName','chapter1.pdf','string'),(1472,261,'name','chapter1.pdf','string'),(1473,262,'fileStage','2','int'),(1474,262,'sourceSubmissionFileId',NULL,'string'),(1475,262,'submissionFileId','62','int'),(1476,262,'fileId','35','int'),(1477,262,'submissionId','9','int'),(1478,262,'originalFileName','chapter2.pdf','string'),(1479,262,'username','fperini','string'),(1480,263,'fileStage','2','int'),(1481,263,'submissionFileId','62','int'),(1482,263,'fileId','35','int'),(1483,263,'submissionId','9','int'),(1484,263,'username','fperini','string'),(1485,263,'name','chapter2.pdf','string'),(1486,264,'fileStage','2','int'),(1487,264,'sourceSubmissionFileId',NULL,'string'),(1488,264,'submissionFileId','62','int'),(1489,264,'fileId','35','int'),(1490,264,'submissionId','9','int'),(1491,264,'originalFileName','chapter2.pdf','string'),(1492,264,'username','fperini','string'),(1493,265,'fileStage','2','int'),(1494,265,'sourceSubmissionFileId',NULL,'string'),(1495,265,'submissionFileId','62','int'),(1496,265,'fileId','35','int'),(1497,265,'submissionId','9','int'),(1498,265,'username','fperini','string'),(1499,265,'originalFileName','chapter2.pdf','string'),(1500,265,'name','chapter2.pdf','string'),(1501,266,'fileStage','2','int'),(1502,266,'sourceSubmissionFileId',NULL,'string'),(1503,266,'submissionFileId','63','int'),(1504,266,'fileId','36','int'),(1505,266,'submissionId','9','int'),(1506,266,'originalFileName','chapter3.pdf','string'),(1507,266,'username','fperini','string'),(1508,267,'fileStage','2','int'),(1509,267,'submissionFileId','63','int'),(1510,267,'fileId','36','int'),(1511,267,'submissionId','9','int'),(1512,267,'username','fperini','string'),(1513,267,'name','chapter3.pdf','string'),(1514,268,'fileStage','2','int'),(1515,268,'sourceSubmissionFileId',NULL,'string'),(1516,268,'submissionFileId','63','int'),(1517,268,'fileId','36','int'),(1518,268,'submissionId','9','int'),(1519,268,'originalFileName','chapter3.pdf','string'),(1520,268,'username','fperini','string'),(1521,269,'fileStage','2','int'),(1522,269,'sourceSubmissionFileId',NULL,'string'),(1523,269,'submissionFileId','63','int'),(1524,269,'fileId','36','int'),(1525,269,'submissionId','9','int'),(1526,269,'username','fperini','string'),(1527,269,'originalFileName','chapter3.pdf','string'),(1528,269,'name','chapter3.pdf','string'),(1529,270,'fileStage','2','int'),(1530,270,'sourceSubmissionFileId',NULL,'string'),(1531,270,'submissionFileId','64','int'),(1532,270,'fileId','37','int'),(1533,270,'submissionId','9','int'),(1534,270,'originalFileName','chapter4.pdf','string'),(1535,270,'username','fperini','string'),(1536,271,'fileStage','2','int'),(1537,271,'submissionFileId','64','int'),(1538,271,'fileId','37','int'),(1539,271,'submissionId','9','int'),(1540,271,'username','fperini','string'),(1541,271,'name','chapter4.pdf','string'),(1542,272,'fileStage','2','int'),(1543,272,'sourceSubmissionFileId',NULL,'string'),(1544,272,'submissionFileId','64','int'),(1545,272,'fileId','37','int'),(1546,272,'submissionId','9','int'),(1547,272,'originalFileName','chapter4.pdf','string'),(1548,272,'username','fperini','string'),(1549,273,'fileStage','2','int'),(1550,273,'sourceSubmissionFileId',NULL,'string'),(1551,273,'submissionFileId','64','int'),(1552,273,'fileId','37','int'),(1553,273,'submissionId','9','int'),(1554,273,'username','fperini','string'),(1555,273,'originalFileName','chapter4.pdf','string'),(1556,273,'name','chapter4.pdf','string'),(1557,274,'fileStage','2','int'),(1558,274,'sourceSubmissionFileId',NULL,'string'),(1559,274,'submissionFileId','65','int'),(1560,274,'fileId','38','int'),(1561,274,'submissionId','9','int'),(1562,274,'originalFileName','chapter5.pdf','string'),(1563,274,'username','fperini','string'),(1564,275,'fileStage','2','int'),(1565,275,'submissionFileId','65','int'),(1566,275,'fileId','38','int'),(1567,275,'submissionId','9','int'),(1568,275,'username','fperini','string'),(1569,275,'name','chapter5.pdf','string'),(1570,276,'fileStage','2','int'),(1571,276,'sourceSubmissionFileId',NULL,'string'),(1572,276,'submissionFileId','65','int'),(1573,276,'fileId','38','int'),(1574,276,'submissionId','9','int'),(1575,276,'originalFileName','chapter5.pdf','string'),(1576,276,'username','fperini','string'),(1577,277,'fileStage','2','int'),(1578,277,'sourceSubmissionFileId',NULL,'string'),(1579,277,'submissionFileId','65','int'),(1580,277,'fileId','38','int'),(1581,277,'submissionId','9','int'),(1582,277,'username','fperini','string'),(1583,277,'originalFileName','chapter5.pdf','string'),(1584,277,'name','chapter5.pdf','string'),(1585,279,'editorId','3','int'),(1586,279,'editorName','Daniel Barnes','string'),(1587,279,'submissionId','9','int'),(1588,279,'decision','1','int'),(1589,280,'fileStage','19','int'),(1590,280,'sourceSubmissionFileId','65','int'),(1591,280,'submissionFileId','66','int'),(1592,280,'fileId','38','int'),(1593,280,'submissionId','9','int'),(1594,280,'originalFileName','chapter5.pdf','string'),(1595,280,'username','dbarnes','string'),(1596,281,'fileStage','19','int'),(1597,281,'submissionFileId','66','int'),(1598,281,'fileId','38','int'),(1599,281,'submissionId','9','int'),(1600,281,'username','dbarnes','string'),(1601,281,'name','chapter5.pdf','string'),(1602,282,'fileStage','19','int'),(1603,282,'sourceSubmissionFileId','64','int'),(1604,282,'submissionFileId','67','int'),(1605,282,'fileId','37','int'),(1606,282,'submissionId','9','int'),(1607,282,'originalFileName','chapter4.pdf','string'),(1608,282,'username','dbarnes','string'),(1609,283,'fileStage','19','int'),(1610,283,'submissionFileId','67','int'),(1611,283,'fileId','37','int'),(1612,283,'submissionId','9','int'),(1613,283,'username','dbarnes','string'),(1614,283,'name','chapter4.pdf','string'),(1615,284,'fileStage','19','int'),(1616,284,'sourceSubmissionFileId','63','int'),(1617,284,'submissionFileId','68','int'),(1618,284,'fileId','36','int'),(1619,284,'submissionId','9','int'),(1620,284,'originalFileName','chapter3.pdf','string'),(1621,284,'username','dbarnes','string'),(1622,285,'fileStage','19','int'),(1623,285,'submissionFileId','68','int'),(1624,285,'fileId','36','int'),(1625,285,'submissionId','9','int'),(1626,285,'username','dbarnes','string'),(1627,285,'name','chapter3.pdf','string'),(1628,286,'fileStage','19','int'),(1629,286,'sourceSubmissionFileId','62','int'),(1630,286,'submissionFileId','69','int'),(1631,286,'fileId','35','int'),(1632,286,'submissionId','9','int'),(1633,286,'originalFileName','chapter2.pdf','string'),(1634,286,'username','dbarnes','string'),(1635,287,'fileStage','19','int'),(1636,287,'submissionFileId','69','int'),(1637,287,'fileId','35','int'),(1638,287,'submissionId','9','int'),(1639,287,'username','dbarnes','string'),(1640,287,'name','chapter2.pdf','string'),(1641,288,'fileStage','19','int'),(1642,288,'sourceSubmissionFileId','61','int'),(1643,288,'submissionFileId','70','int'),(1644,288,'fileId','34','int'),(1645,288,'submissionId','9','int'),(1646,288,'originalFileName','chapter1.pdf','string'),(1647,288,'username','dbarnes','string'),(1648,289,'fileStage','19','int'),(1649,289,'submissionFileId','70','int'),(1650,289,'fileId','34','int'),(1651,289,'submissionId','9','int'),(1652,289,'username','dbarnes','string'),(1653,289,'name','chapter1.pdf','string'),(1654,292,'fileStage','2','int'),(1655,292,'sourceSubmissionFileId',NULL,'string'),(1656,292,'submissionFileId','71','int'),(1657,292,'fileId','39','int'),(1658,292,'submissionId','10','int'),(1659,292,'originalFileName','intro.pdf','string'),(1660,292,'username','jbrower','string'),(1661,293,'fileStage','2','int'),(1662,293,'submissionFileId','71','int'),(1663,293,'fileId','39','int'),(1664,293,'submissionId','10','int'),(1665,293,'username','jbrower','string'),(1666,293,'name','intro.pdf','string'),(1667,294,'fileStage','2','int'),(1668,294,'sourceSubmissionFileId',NULL,'string'),(1669,294,'submissionFileId','71','int'),(1670,294,'fileId','39','int'),(1671,294,'submissionId','10','int'),(1672,294,'originalFileName','intro.pdf','string'),(1673,294,'username','jbrower','string'),(1674,295,'fileStage','2','int'),(1675,295,'sourceSubmissionFileId',NULL,'string'),(1676,295,'submissionFileId','71','int'),(1677,295,'fileId','39','int'),(1678,295,'submissionId','10','int'),(1679,295,'username','jbrower','string'),(1680,295,'originalFileName','intro.pdf','string'),(1681,295,'name','intro.pdf','string'),(1682,296,'fileStage','2','int'),(1683,296,'sourceSubmissionFileId',NULL,'string'),(1684,296,'submissionFileId','72','int'),(1685,296,'fileId','40','int'),(1686,296,'submissionId','10','int'),(1687,296,'originalFileName','chapter1.pdf','string'),(1688,296,'username','jbrower','string'),(1689,297,'fileStage','2','int'),(1690,297,'submissionFileId','72','int'),(1691,297,'fileId','40','int'),(1692,297,'submissionId','10','int'),(1693,297,'username','jbrower','string'),(1694,297,'name','chapter1.pdf','string'),(1695,298,'fileStage','2','int'),(1696,298,'sourceSubmissionFileId',NULL,'string'),(1697,298,'submissionFileId','72','int'),(1698,298,'fileId','40','int'),(1699,298,'submissionId','10','int'),(1700,298,'originalFileName','chapter1.pdf','string'),(1701,298,'username','jbrower','string'),(1702,299,'fileStage','2','int'),(1703,299,'sourceSubmissionFileId',NULL,'string'),(1704,299,'submissionFileId','72','int'),(1705,299,'fileId','40','int'),(1706,299,'submissionId','10','int'),(1707,299,'username','jbrower','string'),(1708,299,'originalFileName','chapter1.pdf','string'),(1709,299,'name','chapter1.pdf','string'),(1710,300,'fileStage','2','int'),(1711,300,'sourceSubmissionFileId',NULL,'string'),(1712,300,'submissionFileId','73','int'),(1713,300,'fileId','41','int'),(1714,300,'submissionId','10','int'),(1715,300,'originalFileName','chapter2.pdf','string'),(1716,300,'username','jbrower','string'),(1717,301,'fileStage','2','int'),(1718,301,'submissionFileId','73','int'),(1719,301,'fileId','41','int'),(1720,301,'submissionId','10','int'),(1721,301,'username','jbrower','string'),(1722,301,'name','chapter2.pdf','string'),(1723,302,'fileStage','2','int'),(1724,302,'sourceSubmissionFileId',NULL,'string'),(1725,302,'submissionFileId','73','int'),(1726,302,'fileId','41','int'),(1727,302,'submissionId','10','int'),(1728,302,'originalFileName','chapter2.pdf','string'),(1729,302,'username','jbrower','string'),(1730,303,'fileStage','2','int'),(1731,303,'sourceSubmissionFileId',NULL,'string'),(1732,303,'submissionFileId','73','int'),(1733,303,'fileId','41','int'),(1734,303,'submissionId','10','int'),(1735,303,'username','jbrower','string'),(1736,303,'originalFileName','chapter2.pdf','string'),(1737,303,'name','chapter2.pdf','string'),(1738,304,'fileStage','2','int'),(1739,304,'sourceSubmissionFileId',NULL,'string'),(1740,304,'submissionFileId','74','int'),(1741,304,'fileId','42','int'),(1742,304,'submissionId','10','int'),(1743,304,'originalFileName','chapter3.pdf','string'),(1744,304,'username','jbrower','string'),(1745,305,'fileStage','2','int'),(1746,305,'submissionFileId','74','int'),(1747,305,'fileId','42','int'),(1748,305,'submissionId','10','int'),(1749,305,'username','jbrower','string'),(1750,305,'name','chapter3.pdf','string'),(1751,306,'fileStage','2','int'),(1752,306,'sourceSubmissionFileId',NULL,'string'),(1753,306,'submissionFileId','74','int'),(1754,306,'fileId','42','int'),(1755,306,'submissionId','10','int'),(1756,306,'originalFileName','chapter3.pdf','string'),(1757,306,'username','jbrower','string'),(1758,307,'fileStage','2','int'),(1759,307,'sourceSubmissionFileId',NULL,'string'),(1760,307,'submissionFileId','74','int'),(1761,307,'fileId','42','int'),(1762,307,'submissionId','10','int'),(1763,307,'username','jbrower','string'),(1764,307,'originalFileName','chapter3.pdf','string'),(1765,307,'name','chapter3.pdf','string'),(1766,308,'fileStage','2','int'),(1767,308,'sourceSubmissionFileId',NULL,'string'),(1768,308,'submissionFileId','75','int'),(1769,308,'fileId','43','int'),(1770,308,'submissionId','10','int'),(1771,308,'originalFileName','chapter4.pdf','string'),(1772,308,'username','jbrower','string'),(1773,309,'fileStage','2','int'),(1774,309,'submissionFileId','75','int'),(1775,309,'fileId','43','int'),(1776,309,'submissionId','10','int'),(1777,309,'username','jbrower','string'),(1778,309,'name','chapter4.pdf','string'),(1779,310,'fileStage','2','int'),(1780,310,'sourceSubmissionFileId',NULL,'string'),(1781,310,'submissionFileId','75','int'),(1782,310,'fileId','43','int'),(1783,310,'submissionId','10','int'),(1784,310,'originalFileName','chapter4.pdf','string'),(1785,310,'username','jbrower','string'),(1786,311,'fileStage','2','int'),(1787,311,'sourceSubmissionFileId',NULL,'string'),(1788,311,'submissionFileId','75','int'),(1789,311,'fileId','43','int'),(1790,311,'submissionId','10','int'),(1791,311,'username','jbrower','string'),(1792,311,'originalFileName','chapter4.pdf','string'),(1793,311,'name','chapter4.pdf','string'),(1794,312,'fileStage','2','int'),(1795,312,'sourceSubmissionFileId',NULL,'string'),(1796,312,'submissionFileId','76','int'),(1797,312,'fileId','44','int'),(1798,312,'submissionId','10','int'),(1799,312,'originalFileName','chapter5.pdf','string'),(1800,312,'username','jbrower','string'),(1801,313,'fileStage','2','int'),(1802,313,'submissionFileId','76','int'),(1803,313,'fileId','44','int'),(1804,313,'submissionId','10','int'),(1805,313,'username','jbrower','string'),(1806,313,'name','chapter5.pdf','string'),(1807,314,'fileStage','2','int'),(1808,314,'sourceSubmissionFileId',NULL,'string'),(1809,314,'submissionFileId','76','int'),(1810,314,'fileId','44','int'),(1811,314,'submissionId','10','int'),(1812,314,'originalFileName','chapter5.pdf','string'),(1813,314,'username','jbrower','string'),(1814,315,'fileStage','2','int'),(1815,315,'sourceSubmissionFileId',NULL,'string'),(1816,315,'submissionFileId','76','int'),(1817,315,'fileId','44','int'),(1818,315,'submissionId','10','int'),(1819,315,'username','jbrower','string'),(1820,315,'originalFileName','chapter5.pdf','string'),(1821,315,'name','chapter5.pdf','string'),(1822,316,'fileStage','2','int'),(1823,316,'sourceSubmissionFileId',NULL,'string'),(1824,316,'submissionFileId','77','int'),(1825,316,'fileId','45','int'),(1826,316,'submissionId','10','int'),(1827,316,'originalFileName','conclusion.pdf','string'),(1828,316,'username','jbrower','string'),(1829,317,'fileStage','2','int'),(1830,317,'submissionFileId','77','int'),(1831,317,'fileId','45','int'),(1832,317,'submissionId','10','int'),(1833,317,'username','jbrower','string'),(1834,317,'name','conclusion.pdf','string'),(1835,318,'fileStage','2','int'),(1836,318,'sourceSubmissionFileId',NULL,'string'),(1837,318,'submissionFileId','77','int'),(1838,318,'fileId','45','int'),(1839,318,'submissionId','10','int'),(1840,318,'originalFileName','conclusion.pdf','string'),(1841,318,'username','jbrower','string'),(1842,319,'fileStage','2','int'),(1843,319,'sourceSubmissionFileId',NULL,'string'),(1844,319,'submissionFileId','77','int'),(1845,319,'fileId','45','int'),(1846,319,'submissionId','10','int'),(1847,319,'username','jbrower','string'),(1848,319,'originalFileName','conclusion.pdf','string'),(1849,319,'name','conclusion.pdf','string'),(1850,320,'fileStage','2','int'),(1851,320,'sourceSubmissionFileId',NULL,'string'),(1852,320,'submissionFileId','78','int'),(1853,320,'fileId','46','int'),(1854,320,'submissionId','10','int'),(1855,320,'originalFileName','bibliography.pdf','string'),(1856,320,'username','jbrower','string'),(1857,321,'fileStage','2','int'),(1858,321,'submissionFileId','78','int'),(1859,321,'fileId','46','int'),(1860,321,'submissionId','10','int'),(1861,321,'username','jbrower','string'),(1862,321,'name','bibliography.pdf','string'),(1863,322,'fileStage','2','int'),(1864,322,'sourceSubmissionFileId',NULL,'string'),(1865,322,'submissionFileId','78','int'),(1866,322,'fileId','46','int'),(1867,322,'submissionId','10','int'),(1868,322,'originalFileName','bibliography.pdf','string'),(1869,322,'username','jbrower','string'),(1870,323,'fileStage','2','int'),(1871,323,'sourceSubmissionFileId',NULL,'string'),(1872,323,'submissionFileId','78','int'),(1873,323,'fileId','46','int'),(1874,323,'submissionId','10','int'),(1875,323,'username','jbrower','string'),(1876,323,'originalFileName','bibliography.pdf','string'),(1877,323,'name','bibliography.pdf','string'),(1878,324,'fileStage','2','int'),(1879,324,'sourceSubmissionFileId',NULL,'string'),(1880,324,'submissionFileId','79','int'),(1881,324,'fileId','47','int'),(1882,324,'submissionId','10','int'),(1883,324,'originalFileName','index.pdf','string'),(1884,324,'username','jbrower','string'),(1885,325,'fileStage','2','int'),(1886,325,'submissionFileId','79','int'),(1887,325,'fileId','47','int'),(1888,325,'submissionId','10','int'),(1889,325,'username','jbrower','string'),(1890,325,'name','index.pdf','string'),(1891,326,'fileStage','2','int'),(1892,326,'sourceSubmissionFileId',NULL,'string'),(1893,326,'submissionFileId','79','int'),(1894,326,'fileId','47','int'),(1895,326,'submissionId','10','int'),(1896,326,'originalFileName','index.pdf','string'),(1897,326,'username','jbrower','string'),(1898,327,'fileStage','2','int'),(1899,327,'sourceSubmissionFileId',NULL,'string'),(1900,327,'submissionFileId','79','int'),(1901,327,'fileId','47','int'),(1902,327,'submissionId','10','int'),(1903,327,'username','jbrower','string'),(1904,327,'originalFileName','index.pdf','string'),(1905,327,'name','index.pdf','string'),(1906,331,'fileStage','2','int'),(1907,331,'sourceSubmissionFileId',NULL,'string'),(1908,331,'submissionFileId','80','int'),(1909,331,'fileId','48','int'),(1910,331,'submissionId','11','int'),(1911,331,'originalFileName','intro.pdf','string'),(1912,331,'username','jlockehart','string'),(1913,332,'fileStage','2','int'),(1914,332,'submissionFileId','80','int'),(1915,332,'fileId','48','int'),(1916,332,'submissionId','11','int'),(1917,332,'username','jlockehart','string'),(1918,332,'name','intro.pdf','string'),(1919,333,'fileStage','2','int'),(1920,333,'sourceSubmissionFileId',NULL,'string'),(1921,333,'submissionFileId','80','int'),(1922,333,'fileId','48','int'),(1923,333,'submissionId','11','int'),(1924,333,'originalFileName','intro.pdf','string'),(1925,333,'username','jlockehart','string'),(1926,334,'fileStage','2','int'),(1927,334,'sourceSubmissionFileId',NULL,'string'),(1928,334,'submissionFileId','80','int'),(1929,334,'fileId','48','int'),(1930,334,'submissionId','11','int'),(1931,334,'username','jlockehart','string'),(1932,334,'originalFileName','intro.pdf','string'),(1933,334,'name','intro.pdf','string'),(1934,335,'fileStage','2','int'),(1935,335,'sourceSubmissionFileId',NULL,'string'),(1936,335,'submissionFileId','81','int'),(1937,335,'fileId','49','int'),(1938,335,'submissionId','11','int'),(1939,335,'originalFileName','poems.pdf','string'),(1940,335,'username','jlockehart','string'),(1941,336,'fileStage','2','int'),(1942,336,'submissionFileId','81','int'),(1943,336,'fileId','49','int'),(1944,336,'submissionId','11','int'),(1945,336,'username','jlockehart','string'),(1946,336,'name','poems.pdf','string'),(1947,337,'fileStage','2','int'),(1948,337,'sourceSubmissionFileId',NULL,'string'),(1949,337,'submissionFileId','81','int'),(1950,337,'fileId','49','int'),(1951,337,'submissionId','11','int'),(1952,337,'originalFileName','poems.pdf','string'),(1953,337,'username','jlockehart','string'),(1954,338,'fileStage','2','int'),(1955,338,'sourceSubmissionFileId',NULL,'string'),(1956,338,'submissionFileId','81','int'),(1957,338,'fileId','49','int'),(1958,338,'submissionId','11','int'),(1959,338,'username','jlockehart','string'),(1960,338,'originalFileName','poems.pdf','string'),(1961,338,'name','poems.pdf','string'),(1962,340,'editorId','3','int'),(1963,340,'editorName','Daniel Barnes','string'),(1964,340,'submissionId','11','int'),(1965,340,'decision','1','int'),(1966,341,'fileStage','19','int'),(1967,341,'sourceSubmissionFileId','81','int'),(1968,341,'submissionFileId','82','int'),(1969,341,'fileId','49','int'),(1970,341,'submissionId','11','int'),(1971,341,'originalFileName','poems.pdf','string'),(1972,341,'username','dbarnes','string'),(1973,342,'fileStage','19','int'),(1974,342,'submissionFileId','82','int'),(1975,342,'fileId','49','int'),(1976,342,'submissionId','11','int'),(1977,342,'username','dbarnes','string'),(1978,342,'name','poems.pdf','string'),(1979,343,'fileStage','19','int'),(1980,343,'sourceSubmissionFileId','80','int'),(1981,343,'submissionFileId','83','int'),(1982,343,'fileId','48','int'),(1983,343,'submissionId','11','int'),(1984,343,'originalFileName','intro.pdf','string'),(1985,343,'username','dbarnes','string'),(1986,344,'fileStage','19','int'),(1987,344,'submissionFileId','83','int'),(1988,344,'fileId','48','int'),(1989,344,'submissionId','11','int'),(1990,344,'username','dbarnes','string'),(1991,344,'name','intro.pdf','string'),(1992,345,'reviewAssignmentId','9','int'),(1993,345,'reviewerName','Aisla McCrae','string'),(1994,345,'submissionId','11','int'),(1995,345,'stageId','2','int'),(1996,345,'round','1','int'),(1997,346,'editorId','3','int'),(1998,346,'editorName','Daniel Barnes','string'),(1999,346,'submissionId','11','int'),(2000,346,'decision','3','int'),(2001,347,'reviewAssignmentId','10','int'),(2002,347,'reviewerName','Adela Gallego','string'),(2003,347,'submissionId','11','int'),(2004,347,'stageId','3','int'),(2005,347,'round','1','int'),(2006,348,'reviewAssignmentId','11','int'),(2007,348,'reviewerName','Gonzalo Favio','string'),(2008,348,'submissionId','11','int'),(2009,348,'stageId','3','int'),(2010,348,'round','1','int'),(2011,349,'reviewAssignmentId','10','int'),(2012,349,'reviewerName','Adela Gallego','string'),(2013,349,'submissionId','11','int'),(2014,349,'round','1','int'),(2015,350,'reviewAssignmentId','10','int'),(2016,350,'reviewerName','Adela Gallego','string'),(2017,350,'submissionId','11','int'),(2018,350,'round','1','int'),(2019,351,'reviewAssignmentId','11','int'),(2020,351,'reviewerName','Gonzalo Favio','string'),(2021,351,'submissionId','11','int'),(2022,351,'round','1','int'),(2023,352,'reviewAssignmentId','11','int'),(2024,352,'reviewerName','Gonzalo Favio','string'),(2025,352,'submissionId','11','int'),(2026,352,'round','1','int'),(2027,353,'editorId','3','int'),(2028,353,'editorName','Daniel Barnes','string'),(2029,353,'submissionId','11','int'),(2030,353,'decision','2','int'),(2031,354,'recipientCount','2','int'),(2032,354,'subject','Thank you for your review','string'),(2033,357,'fileStage','2','int'),(2034,357,'sourceSubmissionFileId',NULL,'string'),(2035,357,'submissionFileId','84','int'),(2036,357,'fileId','50','int'),(2037,357,'submissionId','12','int'),(2038,357,'originalFileName','chapter1.pdf','string'),(2039,357,'username','lelder','string'),(2040,358,'fileStage','2','int'),(2041,358,'submissionFileId','84','int'),(2042,358,'fileId','50','int'),(2043,358,'submissionId','12','int'),(2044,358,'username','lelder','string'),(2045,358,'name','chapter1.pdf','string'),(2046,359,'fileStage','2','int'),(2047,359,'sourceSubmissionFileId',NULL,'string'),(2048,359,'submissionFileId','84','int'),(2049,359,'fileId','50','int'),(2050,359,'submissionId','12','int'),(2051,359,'originalFileName','chapter1.pdf','string'),(2052,359,'username','lelder','string'),(2053,360,'fileStage','2','int'),(2054,360,'sourceSubmissionFileId',NULL,'string'),(2055,360,'submissionFileId','84','int'),(2056,360,'fileId','50','int'),(2057,360,'submissionId','12','int'),(2058,360,'username','lelder','string'),(2059,360,'originalFileName','chapter1.pdf','string'),(2060,360,'name','chapter1.pdf','string'),(2061,361,'fileStage','2','int'),(2062,361,'sourceSubmissionFileId',NULL,'string'),(2063,361,'submissionFileId','85','int'),(2064,361,'fileId','51','int'),(2065,361,'submissionId','12','int'),(2066,361,'originalFileName','chapter2.pdf','string'),(2067,361,'username','lelder','string'),(2068,362,'fileStage','2','int'),(2069,362,'submissionFileId','85','int'),(2070,362,'fileId','51','int'),(2071,362,'submissionId','12','int'),(2072,362,'username','lelder','string'),(2073,362,'name','chapter2.pdf','string'),(2074,363,'fileStage','2','int'),(2075,363,'sourceSubmissionFileId',NULL,'string'),(2076,363,'submissionFileId','85','int'),(2077,363,'fileId','51','int'),(2078,363,'submissionId','12','int'),(2079,363,'originalFileName','chapter2.pdf','string'),(2080,363,'username','lelder','string'),(2081,364,'fileStage','2','int'),(2082,364,'sourceSubmissionFileId',NULL,'string'),(2083,364,'submissionFileId','85','int'),(2084,364,'fileId','51','int'),(2085,364,'submissionId','12','int'),(2086,364,'username','lelder','string'),(2087,364,'originalFileName','chapter2.pdf','string'),(2088,364,'name','chapter2.pdf','string'),(2089,365,'fileStage','2','int'),(2090,365,'sourceSubmissionFileId',NULL,'string'),(2091,365,'submissionFileId','86','int'),(2092,365,'fileId','52','int'),(2093,365,'submissionId','12','int'),(2094,365,'originalFileName','chapter3.pdf','string'),(2095,365,'username','lelder','string'),(2096,366,'fileStage','2','int'),(2097,366,'submissionFileId','86','int'),(2098,366,'fileId','52','int'),(2099,366,'submissionId','12','int'),(2100,366,'username','lelder','string'),(2101,366,'name','chapter3.pdf','string'),(2102,367,'fileStage','2','int'),(2103,367,'sourceSubmissionFileId',NULL,'string'),(2104,367,'submissionFileId','86','int'),(2105,367,'fileId','52','int'),(2106,367,'submissionId','12','int'),(2107,367,'originalFileName','chapter3.pdf','string'),(2108,367,'username','lelder','string'),(2109,368,'fileStage','2','int'),(2110,368,'sourceSubmissionFileId',NULL,'string'),(2111,368,'submissionFileId','86','int'),(2112,368,'fileId','52','int'),(2113,368,'submissionId','12','int'),(2114,368,'username','lelder','string'),(2115,368,'originalFileName','chapter3.pdf','string'),(2116,368,'name','chapter3.pdf','string'),(2117,370,'editorId','3','int'),(2118,370,'editorName','Daniel Barnes','string'),(2119,370,'submissionId','12','int'),(2120,370,'decision','1','int'),(2121,371,'fileStage','19','int'),(2122,371,'sourceSubmissionFileId','86','int'),(2123,371,'submissionFileId','87','int'),(2124,371,'fileId','52','int'),(2125,371,'submissionId','12','int'),(2126,371,'originalFileName','chapter3.pdf','string'),(2127,371,'username','dbarnes','string'),(2128,372,'fileStage','19','int'),(2129,372,'submissionFileId','87','int'),(2130,372,'fileId','52','int'),(2131,372,'submissionId','12','int'),(2132,372,'username','dbarnes','string'),(2133,372,'name','chapter3.pdf','string'),(2134,373,'fileStage','19','int'),(2135,373,'sourceSubmissionFileId','85','int'),(2136,373,'submissionFileId','88','int'),(2137,373,'fileId','51','int'),(2138,373,'submissionId','12','int'),(2139,373,'originalFileName','chapter2.pdf','string'),(2140,373,'username','dbarnes','string'),(2141,374,'fileStage','19','int'),(2142,374,'submissionFileId','88','int'),(2143,374,'fileId','51','int'),(2144,374,'submissionId','12','int'),(2145,374,'username','dbarnes','string'),(2146,374,'name','chapter2.pdf','string'),(2147,375,'fileStage','19','int'),(2148,375,'sourceSubmissionFileId','84','int'),(2149,375,'submissionFileId','89','int'),(2150,375,'fileId','50','int'),(2151,375,'submissionId','12','int'),(2152,375,'originalFileName','chapter1.pdf','string'),(2153,375,'username','dbarnes','string'),(2154,376,'fileStage','19','int'),(2155,376,'submissionFileId','89','int'),(2156,376,'fileId','50','int'),(2157,376,'submissionId','12','int'),(2158,376,'username','dbarnes','string'),(2159,376,'name','chapter1.pdf','string'),(2160,377,'reviewAssignmentId','12','int'),(2161,377,'reviewerName','Julie Janssen','string'),(2162,377,'submissionId','12','int'),(2163,377,'stageId','2','int'),(2164,377,'round','1','int'),(2165,378,'reviewAssignmentId','13','int'),(2166,378,'reviewerName','Paul Hudson','string'),(2167,378,'submissionId','12','int'),(2168,378,'stageId','2','int'),(2169,378,'round','1','int'),(2170,379,'reviewAssignmentId','14','int'),(2171,379,'reviewerName','Aisla McCrae','string'),(2172,379,'submissionId','12','int'),(2173,379,'stageId','2','int'),(2174,379,'round','1','int'),(2175,380,'reviewAssignmentId','13','int'),(2176,380,'reviewerName','Paul Hudson','string'),(2177,380,'submissionId','12','int'),(2178,380,'round','1','int'),(2179,381,'reviewAssignmentId','13','int'),(2180,381,'reviewerName','Paul Hudson','string'),(2181,381,'submissionId','12','int'),(2182,381,'round','1','int'),(2183,384,'fileStage','2','int'),(2184,384,'sourceSubmissionFileId',NULL,'string'),(2185,384,'submissionFileId','90','int'),(2186,384,'fileId','53','int'),(2187,384,'submissionId','13','int'),(2188,384,'originalFileName','chapter1.pdf','string'),(2189,384,'username','mally','string'),(2190,385,'fileStage','2','int'),(2191,385,'submissionFileId','90','int'),(2192,385,'fileId','53','int'),(2193,385,'submissionId','13','int'),(2194,385,'username','mally','string'),(2195,385,'name','chapter1.pdf','string'),(2196,386,'fileStage','2','int'),(2197,386,'sourceSubmissionFileId',NULL,'string'),(2198,386,'submissionFileId','90','int'),(2199,386,'fileId','53','int'),(2200,386,'submissionId','13','int'),(2201,386,'originalFileName','chapter1.pdf','string'),(2202,386,'username','mally','string'),(2203,387,'fileStage','2','int'),(2204,387,'sourceSubmissionFileId',NULL,'string'),(2205,387,'submissionFileId','90','int'),(2206,387,'fileId','53','int'),(2207,387,'submissionId','13','int'),(2208,387,'username','mally','string'),(2209,387,'originalFileName','chapter1.pdf','string'),(2210,387,'name','chapter1.pdf','string'),(2211,388,'fileStage','2','int'),(2212,388,'sourceSubmissionFileId',NULL,'string'),(2213,388,'submissionFileId','91','int'),(2214,388,'fileId','54','int'),(2215,388,'submissionId','13','int'),(2216,388,'originalFileName','chapter2.pdf','string'),(2217,388,'username','mally','string'),(2218,389,'fileStage','2','int'),(2219,389,'submissionFileId','91','int'),(2220,389,'fileId','54','int'),(2221,389,'submissionId','13','int'),(2222,389,'username','mally','string'),(2223,389,'name','chapter2.pdf','string'),(2224,390,'fileStage','2','int'),(2225,390,'sourceSubmissionFileId',NULL,'string'),(2226,390,'submissionFileId','91','int'),(2227,390,'fileId','54','int'),(2228,390,'submissionId','13','int'),(2229,390,'originalFileName','chapter2.pdf','string'),(2230,390,'username','mally','string'),(2231,391,'fileStage','2','int'),(2232,391,'sourceSubmissionFileId',NULL,'string'),(2233,391,'submissionFileId','91','int'),(2234,391,'fileId','54','int'),(2235,391,'submissionId','13','int'),(2236,391,'username','mally','string'),(2237,391,'originalFileName','chapter2.pdf','string'),(2238,391,'name','chapter2.pdf','string'),(2239,392,'fileStage','2','int'),(2240,392,'sourceSubmissionFileId',NULL,'string'),(2241,392,'submissionFileId','92','int'),(2242,392,'fileId','55','int'),(2243,392,'submissionId','13','int'),(2244,392,'originalFileName','chapter3.pdf','string'),(2245,392,'username','mally','string'),(2246,393,'fileStage','2','int'),(2247,393,'submissionFileId','92','int'),(2248,393,'fileId','55','int'),(2249,393,'submissionId','13','int'),(2250,393,'username','mally','string'),(2251,393,'name','chapter3.pdf','string'),(2252,394,'fileStage','2','int'),(2253,394,'sourceSubmissionFileId',NULL,'string'),(2254,394,'submissionFileId','92','int'),(2255,394,'fileId','55','int'),(2256,394,'submissionId','13','int'),(2257,394,'originalFileName','chapter3.pdf','string'),(2258,394,'username','mally','string'),(2259,395,'fileStage','2','int'),(2260,395,'sourceSubmissionFileId',NULL,'string'),(2261,395,'submissionFileId','92','int'),(2262,395,'fileId','55','int'),(2263,395,'submissionId','13','int'),(2264,395,'username','mally','string'),(2265,395,'originalFileName','chapter3.pdf','string'),(2266,395,'name','chapter3.pdf','string'),(2267,397,'editorId','3','int'),(2268,397,'editorName','Daniel Barnes','string'),(2269,397,'submissionId','13','int'),(2270,397,'decision','1','int'),(2271,398,'fileStage','19','int'),(2272,398,'sourceSubmissionFileId','92','int'),(2273,398,'submissionFileId','93','int'),(2274,398,'fileId','55','int'),(2275,398,'submissionId','13','int'),(2276,398,'originalFileName','chapter3.pdf','string'),(2277,398,'username','dbarnes','string'),(2278,399,'fileStage','19','int'),(2279,399,'submissionFileId','93','int'),(2280,399,'fileId','55','int'),(2281,399,'submissionId','13','int'),(2282,399,'username','dbarnes','string'),(2283,399,'name','chapter3.pdf','string'),(2284,400,'fileStage','19','int'),(2285,400,'sourceSubmissionFileId','91','int'),(2286,400,'submissionFileId','94','int'),(2287,400,'fileId','54','int'),(2288,400,'submissionId','13','int'),(2289,400,'originalFileName','chapter2.pdf','string'),(2290,400,'username','dbarnes','string'),(2291,401,'fileStage','19','int'),(2292,401,'submissionFileId','94','int'),(2293,401,'fileId','54','int'),(2294,401,'submissionId','13','int'),(2295,401,'username','dbarnes','string'),(2296,401,'name','chapter2.pdf','string'),(2297,402,'fileStage','19','int'),(2298,402,'sourceSubmissionFileId','90','int'),(2299,402,'submissionFileId','95','int'),(2300,402,'fileId','53','int'),(2301,402,'submissionId','13','int'),(2302,402,'originalFileName','chapter1.pdf','string'),(2303,402,'username','dbarnes','string'),(2304,403,'fileStage','19','int'),(2305,403,'submissionFileId','95','int'),(2306,403,'fileId','53','int'),(2307,403,'submissionId','13','int'),(2308,403,'username','dbarnes','string'),(2309,403,'name','chapter1.pdf','string'),(2310,404,'reviewAssignmentId','15','int'),(2311,404,'reviewerName','Paul Hudson','string'),(2312,404,'submissionId','13','int'),(2313,404,'stageId','2','int'),(2314,404,'round','1','int'),(2315,405,'editorId','3','int'),(2316,405,'editorName','Daniel Barnes','string'),(2317,405,'submissionId','13','int'),(2318,405,'decision','3','int'),(2319,406,'reviewAssignmentId','16','int'),(2320,406,'reviewerName','Adela Gallego','string'),(2321,406,'submissionId','13','int'),(2322,406,'stageId','3','int'),(2323,406,'round','1','int'),(2324,407,'reviewAssignmentId','17','int'),(2325,407,'reviewerName','Al Zacharia','string'),(2326,407,'submissionId','13','int'),(2327,407,'stageId','3','int'),(2328,407,'round','1','int'),(2329,408,'reviewAssignmentId','18','int'),(2330,408,'reviewerName','Gonzalo Favio','string'),(2331,408,'submissionId','13','int'),(2332,408,'stageId','3','int'),(2333,408,'round','1','int'),(2334,409,'reviewAssignmentId','16','int'),(2335,409,'reviewerName','Adela Gallego','string'),(2336,409,'submissionId','13','int'),(2337,409,'round','1','int'),(2338,410,'reviewAssignmentId','16','int'),(2339,410,'reviewerName','Adela Gallego','string'),(2340,410,'submissionId','13','int'),(2341,410,'round','1','int'),(2342,411,'reviewAssignmentId','18','int'),(2343,411,'reviewerName','Gonzalo Favio','string'),(2344,411,'submissionId','13','int'),(2345,411,'round','1','int'),(2346,412,'reviewAssignmentId','18','int'),(2347,412,'reviewerName','Gonzalo Favio','string'),(2348,412,'submissionId','13','int'),(2349,412,'round','1','int'),(2350,413,'editorId','3','int'),(2351,413,'editorName','Daniel Barnes','string'),(2352,413,'submissionId','13','int'),(2353,413,'decision','2','int'),(2354,414,'recipientCount','2','int'),(2355,414,'subject','Thank you for your review','string'),(2356,417,'fileStage','2','int'),(2357,417,'sourceSubmissionFileId',NULL,'string'),(2358,417,'submissionFileId','96','int'),(2359,417,'fileId','56','int'),(2360,417,'submissionId','14','int'),(2361,417,'originalFileName','chapter1.pdf','string'),(2362,417,'username','mdawson','string'),(2363,418,'fileStage','2','int'),(2364,418,'submissionFileId','96','int'),(2365,418,'fileId','56','int'),(2366,418,'submissionId','14','int'),(2367,418,'username','mdawson','string'),(2368,418,'name','chapter1.pdf','string'),(2369,419,'fileStage','2','int'),(2370,419,'sourceSubmissionFileId',NULL,'string'),(2371,419,'submissionFileId','96','int'),(2372,419,'fileId','56','int'),(2373,419,'submissionId','14','int'),(2374,419,'originalFileName','chapter1.pdf','string'),(2375,419,'username','mdawson','string'),(2376,420,'fileStage','2','int'),(2377,420,'sourceSubmissionFileId',NULL,'string'),(2378,420,'submissionFileId','96','int'),(2379,420,'fileId','56','int'),(2380,420,'submissionId','14','int'),(2381,420,'username','mdawson','string'),(2382,420,'originalFileName','chapter1.pdf','string'),(2383,420,'name','chapter1.pdf','string'),(2384,421,'fileStage','2','int'),(2385,421,'sourceSubmissionFileId',NULL,'string'),(2386,421,'submissionFileId','97','int'),(2387,421,'fileId','57','int'),(2388,421,'submissionId','14','int'),(2389,421,'originalFileName','chapter2.pdf','string'),(2390,421,'username','mdawson','string'),(2391,422,'fileStage','2','int'),(2392,422,'submissionFileId','97','int'),(2393,422,'fileId','57','int'),(2394,422,'submissionId','14','int'),(2395,422,'username','mdawson','string'),(2396,422,'name','chapter2.pdf','string'),(2397,423,'fileStage','2','int'),(2398,423,'sourceSubmissionFileId',NULL,'string'),(2399,423,'submissionFileId','97','int'),(2400,423,'fileId','57','int'),(2401,423,'submissionId','14','int'),(2402,423,'originalFileName','chapter2.pdf','string'),(2403,423,'username','mdawson','string'),(2404,424,'fileStage','2','int'),(2405,424,'sourceSubmissionFileId',NULL,'string'),(2406,424,'submissionFileId','97','int'),(2407,424,'fileId','57','int'),(2408,424,'submissionId','14','int'),(2409,424,'username','mdawson','string'),(2410,424,'originalFileName','chapter2.pdf','string'),(2411,424,'name','chapter2.pdf','string'),(2412,425,'fileStage','2','int'),(2413,425,'sourceSubmissionFileId',NULL,'string'),(2414,425,'submissionFileId','98','int'),(2415,425,'fileId','58','int'),(2416,425,'submissionId','14','int'),(2417,425,'originalFileName','chapter3.pdf','string'),(2418,425,'username','mdawson','string'),(2419,426,'fileStage','2','int'),(2420,426,'submissionFileId','98','int'),(2421,426,'fileId','58','int'),(2422,426,'submissionId','14','int'),(2423,426,'username','mdawson','string'),(2424,426,'name','chapter3.pdf','string'),(2425,427,'fileStage','2','int'),(2426,427,'sourceSubmissionFileId',NULL,'string'),(2427,427,'submissionFileId','98','int'),(2428,427,'fileId','58','int'),(2429,427,'submissionId','14','int'),(2430,427,'originalFileName','chapter3.pdf','string'),(2431,427,'username','mdawson','string'),(2432,428,'fileStage','2','int'),(2433,428,'sourceSubmissionFileId',NULL,'string'),(2434,428,'submissionFileId','98','int'),(2435,428,'fileId','58','int'),(2436,428,'submissionId','14','int'),(2437,428,'username','mdawson','string'),(2438,428,'originalFileName','chapter3.pdf','string'),(2439,428,'name','chapter3.pdf','string'),(2440,429,'fileStage','2','int'),(2441,429,'sourceSubmissionFileId',NULL,'string'),(2442,429,'submissionFileId','99','int'),(2443,429,'fileId','59','int'),(2444,429,'submissionId','14','int'),(2445,429,'originalFileName','chapter4.pdf','string'),(2446,429,'username','mdawson','string'),(2447,430,'fileStage','2','int'),(2448,430,'submissionFileId','99','int'),(2449,430,'fileId','59','int'),(2450,430,'submissionId','14','int'),(2451,430,'username','mdawson','string'),(2452,430,'name','chapter4.pdf','string'),(2453,431,'fileStage','2','int'),(2454,431,'sourceSubmissionFileId',NULL,'string'),(2455,431,'submissionFileId','99','int'),(2456,431,'fileId','59','int'),(2457,431,'submissionId','14','int'),(2458,431,'originalFileName','chapter4.pdf','string'),(2459,431,'username','mdawson','string'),(2460,432,'fileStage','2','int'),(2461,432,'sourceSubmissionFileId',NULL,'string'),(2462,432,'submissionFileId','99','int'),(2463,432,'fileId','59','int'),(2464,432,'submissionId','14','int'),(2465,432,'username','mdawson','string'),(2466,432,'originalFileName','chapter4.pdf','string'),(2467,432,'name','chapter4.pdf','string'),(2468,433,'fileStage','2','int'),(2469,433,'sourceSubmissionFileId',NULL,'string'),(2470,433,'submissionFileId','100','int'),(2471,433,'fileId','60','int'),(2472,433,'submissionId','14','int'),(2473,433,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(2474,433,'username','mdawson','string'),(2475,434,'fileStage','2','int'),(2476,434,'submissionFileId','100','int'),(2477,434,'fileId','60','int'),(2478,434,'submissionId','14','int'),(2479,434,'username','mdawson','string'),(2480,434,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(2481,435,'fileStage','2','int'),(2482,435,'sourceSubmissionFileId',NULL,'string'),(2483,435,'submissionFileId','100','int'),(2484,435,'fileId','60','int'),(2485,435,'submissionId','14','int'),(2486,435,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(2487,435,'username','mdawson','string'),(2488,436,'fileStage','2','int'),(2489,436,'sourceSubmissionFileId',NULL,'string'),(2490,436,'submissionFileId','100','int'),(2491,436,'fileId','60','int'),(2492,436,'submissionId','14','int'),(2493,436,'username','mdawson','string'),(2494,436,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(2495,436,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(2496,437,'fileStage','2','int'),(2497,437,'sourceSubmissionFileId',NULL,'string'),(2498,437,'submissionFileId','101','int'),(2499,437,'fileId','61','int'),(2500,437,'submissionId','14','int'),(2501,437,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(2502,437,'username','mdawson','string'),(2503,438,'fileStage','2','int'),(2504,438,'submissionFileId','101','int'),(2505,438,'fileId','61','int'),(2506,438,'submissionId','14','int'),(2507,438,'username','mdawson','string'),(2508,438,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(2509,439,'fileStage','2','int'),(2510,439,'sourceSubmissionFileId',NULL,'string'),(2511,439,'submissionFileId','101','int'),(2512,439,'fileId','61','int'),(2513,439,'submissionId','14','int'),(2514,439,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(2515,439,'username','mdawson','string'),(2516,440,'fileStage','2','int'),(2517,440,'sourceSubmissionFileId',NULL,'string'),(2518,440,'submissionFileId','101','int'),(2519,440,'fileId','61','int'),(2520,440,'submissionId','14','int'),(2521,440,'username','mdawson','string'),(2522,440,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(2523,440,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(2524,442,'editorId','3','int'),(2525,442,'editorName','Daniel Barnes','string'),(2526,442,'submissionId','14','int'),(2527,442,'decision','1','int'),(2528,443,'fileStage','19','int'),(2529,443,'sourceSubmissionFileId','101','int'),(2530,443,'submissionFileId','102','int'),(2531,443,'fileId','61','int'),(2532,443,'submissionId','14','int'),(2533,443,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(2534,443,'username','dbarnes','string'),(2535,444,'fileStage','19','int'),(2536,444,'submissionFileId','102','int'),(2537,444,'fileId','61','int'),(2538,444,'submissionId','14','int'),(2539,444,'username','dbarnes','string'),(2540,444,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(2541,445,'fileStage','19','int'),(2542,445,'sourceSubmissionFileId','100','int'),(2543,445,'submissionFileId','103','int'),(2544,445,'fileId','60','int'),(2545,445,'submissionId','14','int'),(2546,445,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(2547,445,'username','dbarnes','string'),(2548,446,'fileStage','19','int'),(2549,446,'submissionFileId','103','int'),(2550,446,'fileId','60','int'),(2551,446,'submissionId','14','int'),(2552,446,'username','dbarnes','string'),(2553,446,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(2554,447,'fileStage','19','int'),(2555,447,'sourceSubmissionFileId','98','int'),(2556,447,'submissionFileId','104','int'),(2557,447,'fileId','58','int'),(2558,447,'submissionId','14','int'),(2559,447,'originalFileName','chapter3.pdf','string'),(2560,447,'username','dbarnes','string'),(2561,448,'fileStage','19','int'),(2562,448,'submissionFileId','104','int'),(2563,448,'fileId','58','int'),(2564,448,'submissionId','14','int'),(2565,448,'username','dbarnes','string'),(2566,448,'name','chapter3.pdf','string'),(2567,449,'fileStage','19','int'),(2568,449,'sourceSubmissionFileId','97','int'),(2569,449,'submissionFileId','105','int'),(2570,449,'fileId','57','int'),(2571,449,'submissionId','14','int'),(2572,449,'originalFileName','chapter2.pdf','string'),(2573,449,'username','dbarnes','string'),(2574,450,'fileStage','19','int'),(2575,450,'submissionFileId','105','int'),(2576,450,'fileId','57','int'),(2577,450,'submissionId','14','int'),(2578,450,'username','dbarnes','string'),(2579,450,'name','chapter2.pdf','string'),(2580,451,'fileStage','19','int'),(2581,451,'sourceSubmissionFileId','96','int'),(2582,451,'submissionFileId','106','int'),(2583,451,'fileId','56','int'),(2584,451,'submissionId','14','int'),(2585,451,'originalFileName','chapter1.pdf','string'),(2586,451,'username','dbarnes','string'),(2587,452,'fileStage','19','int'),(2588,452,'submissionFileId','106','int'),(2589,452,'fileId','56','int'),(2590,452,'submissionId','14','int'),(2591,452,'username','dbarnes','string'),(2592,452,'name','chapter1.pdf','string'),(2593,453,'fileStage','19','int'),(2594,453,'sourceSubmissionFileId','99','int'),(2595,453,'submissionFileId','107','int'),(2596,453,'fileId','59','int'),(2597,453,'submissionId','14','int'),(2598,453,'originalFileName','chapter4.pdf','string'),(2599,453,'username','dbarnes','string'),(2600,454,'fileStage','19','int'),(2601,454,'submissionFileId','107','int'),(2602,454,'fileId','59','int'),(2603,454,'submissionId','14','int'),(2604,454,'username','dbarnes','string'),(2605,454,'name','chapter4.pdf','string'),(2606,455,'reviewAssignmentId','19','int'),(2607,455,'reviewerName','Julie Janssen','string'),(2608,455,'submissionId','14','int'),(2609,455,'stageId','2','int'),(2610,455,'round','1','int'),(2611,456,'editorId','3','int'),(2612,456,'editorName','Daniel Barnes','string'),(2613,456,'submissionId','14','int'),(2614,456,'decision','3','int'),(2615,457,'reviewAssignmentId','20','int'),(2616,457,'reviewerName','Al Zacharia','string'),(2617,457,'submissionId','14','int'),(2618,457,'stageId','3','int'),(2619,457,'round','1','int'),(2620,458,'editorId','3','int'),(2621,458,'editorName','Daniel Barnes','string'),(2622,458,'submissionId','14','int'),(2623,458,'decision','2','int'),(2624,459,'name','Maria Fritz','string'),(2625,459,'username','mfritz','string'),(2626,459,'userGroupName','Copyeditor','string'),(2627,460,'editorId','3','int'),(2628,460,'editorName','Daniel Barnes','string'),(2629,460,'submissionId','14','int'),(2630,460,'decision','7','int'),(2631,461,'name','Graham Cox','string'),(2632,461,'username','gcox','string'),(2633,461,'userGroupName','Layout Editor','string'),(2634,462,'name','Sabine Kumar','string'),(2635,462,'username','skumar','string'),(2636,462,'userGroupName','Proofreader','string'),(2637,463,'formatName','PDF','string'),(2638,464,'fileStage','10','int'),(2639,464,'sourceSubmissionFileId','101','int'),(2640,464,'submissionFileId','108','int'),(2641,464,'fileId','61','int'),(2642,464,'submissionId','14','int'),(2643,464,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(2644,464,'username','dbarnes','string'),(2645,465,'fileStage','10','int'),(2646,465,'submissionFileId','108','int'),(2647,465,'fileId','61','int'),(2648,465,'submissionId','14','int'),(2649,465,'username','dbarnes','string'),(2650,465,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(2651,466,'fileStage','10','int'),(2652,466,'sourceSubmissionFileId','100','int'),(2653,466,'submissionFileId','109','int'),(2654,466,'fileId','60','int'),(2655,466,'submissionId','14','int'),(2656,466,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(2657,466,'username','dbarnes','string'),(2658,467,'fileStage','10','int'),(2659,467,'submissionFileId','109','int'),(2660,467,'fileId','60','int'),(2661,467,'submissionId','14','int'),(2662,467,'username','dbarnes','string'),(2663,467,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(2664,468,'fileStage','10','int'),(2665,468,'sourceSubmissionFileId','99','int'),(2666,468,'submissionFileId','110','int'),(2667,468,'fileId','59','int'),(2668,468,'submissionId','14','int'),(2669,468,'originalFileName','chapter4.pdf','string'),(2670,468,'username','dbarnes','string'),(2671,469,'fileStage','10','int'),(2672,469,'submissionFileId','110','int'),(2673,469,'fileId','59','int'),(2674,469,'submissionId','14','int'),(2675,469,'username','dbarnes','string'),(2676,469,'name','chapter4.pdf','string'),(2677,470,'fileStage','10','int'),(2678,470,'sourceSubmissionFileId','98','int'),(2679,470,'submissionFileId','111','int'),(2680,470,'fileId','58','int'),(2681,470,'submissionId','14','int'),(2682,470,'originalFileName','chapter3.pdf','string'),(2683,470,'username','dbarnes','string'),(2684,471,'fileStage','10','int'),(2685,471,'submissionFileId','111','int'),(2686,471,'fileId','58','int'),(2687,471,'submissionId','14','int'),(2688,471,'username','dbarnes','string'),(2689,471,'name','chapter3.pdf','string'),(2690,472,'fileStage','10','int'),(2691,472,'sourceSubmissionFileId','97','int'),(2692,472,'submissionFileId','112','int'),(2693,472,'fileId','57','int'),(2694,472,'submissionId','14','int'),(2695,472,'originalFileName','chapter2.pdf','string'),(2696,472,'username','dbarnes','string'),(2697,473,'fileStage','10','int'),(2698,473,'submissionFileId','112','int'),(2699,473,'fileId','57','int'),(2700,473,'submissionId','14','int'),(2701,473,'username','dbarnes','string'),(2702,473,'name','chapter2.pdf','string'),(2703,474,'fileStage','10','int'),(2704,474,'sourceSubmissionFileId','96','int'),(2705,474,'submissionFileId','113','int'),(2706,474,'fileId','56','int'),(2707,474,'submissionId','14','int'),(2708,474,'originalFileName','chapter1.pdf','string'),(2709,474,'username','dbarnes','string'),(2710,475,'fileStage','10','int'),(2711,475,'submissionFileId','113','int'),(2712,475,'fileId','56','int'),(2713,475,'submissionId','14','int'),(2714,475,'username','dbarnes','string'),(2715,475,'name','chapter1.pdf','string'),(2716,476,'publicationFormatName','PDF','string'),(2717,477,'publicationFormatName','PDF','string'),(2718,478,'fileStage','10','int'),(2719,478,'sourceSubmissionFileId','96','int'),(2720,478,'submissionFileId','113','int'),(2721,478,'fileId','56','int'),(2722,478,'submissionId','14','int'),(2723,478,'originalFileName','chapter1.pdf','string'),(2724,478,'username','dbarnes','string'),(2725,479,'fileStage','10','int'),(2726,479,'sourceSubmissionFileId','96','int'),(2727,479,'submissionFileId','113','int'),(2728,479,'fileId','56','int'),(2729,479,'submissionId','14','int'),(2730,479,'username','dbarnes','string'),(2731,479,'originalFileName','chapter1.pdf','string'),(2732,479,'name','chapter1.pdf','string'),(2733,480,'file','chapter1.pdf','string'),(2734,480,'name','Daniel Barnes','string'),(2735,480,'username','dbarnes','string'),(2736,481,'fileStage','10','int'),(2737,481,'sourceSubmissionFileId','96','int'),(2738,481,'submissionFileId','113','int'),(2739,481,'fileId','56','int'),(2740,481,'submissionId','14','int'),(2741,481,'originalFileName','chapter1.pdf','string'),(2742,481,'username','dbarnes','string'),(2743,482,'fileStage','10','int'),(2744,482,'sourceSubmissionFileId','96','int'),(2745,482,'submissionFileId','113','int'),(2746,482,'fileId','56','int'),(2747,482,'submissionId','14','int'),(2748,482,'username','dbarnes','string'),(2749,482,'originalFileName','chapter1.pdf','string'),(2750,482,'name','chapter1.pdf','string'),(2751,483,'fileStage','10','int'),(2752,483,'sourceSubmissionFileId','97','int'),(2753,483,'submissionFileId','112','int'),(2754,483,'fileId','57','int'),(2755,483,'submissionId','14','int'),(2756,483,'originalFileName','chapter2.pdf','string'),(2757,483,'username','dbarnes','string'),(2758,484,'fileStage','10','int'),(2759,484,'sourceSubmissionFileId','97','int'),(2760,484,'submissionFileId','112','int'),(2761,484,'fileId','57','int'),(2762,484,'submissionId','14','int'),(2763,484,'username','dbarnes','string'),(2764,484,'originalFileName','chapter2.pdf','string'),(2765,484,'name','chapter2.pdf','string'),(2766,485,'file','chapter2.pdf','string'),(2767,485,'name','Daniel Barnes','string'),(2768,485,'username','dbarnes','string'),(2769,486,'fileStage','10','int'),(2770,486,'sourceSubmissionFileId','97','int'),(2771,486,'submissionFileId','112','int'),(2772,486,'fileId','57','int'),(2773,486,'submissionId','14','int'),(2774,486,'originalFileName','chapter2.pdf','string'),(2775,486,'username','dbarnes','string'),(2776,487,'fileStage','10','int'),(2777,487,'sourceSubmissionFileId','97','int'),(2778,487,'submissionFileId','112','int'),(2779,487,'fileId','57','int'),(2780,487,'submissionId','14','int'),(2781,487,'username','dbarnes','string'),(2782,487,'originalFileName','chapter2.pdf','string'),(2783,487,'name','chapter2.pdf','string'),(2784,488,'fileStage','10','int'),(2785,488,'sourceSubmissionFileId','98','int'),(2786,488,'submissionFileId','111','int'),(2787,488,'fileId','58','int'),(2788,488,'submissionId','14','int'),(2789,488,'originalFileName','chapter3.pdf','string'),(2790,488,'username','dbarnes','string'),(2791,489,'fileStage','10','int'),(2792,489,'sourceSubmissionFileId','98','int'),(2793,489,'submissionFileId','111','int'),(2794,489,'fileId','58','int'),(2795,489,'submissionId','14','int'),(2796,489,'username','dbarnes','string'),(2797,489,'originalFileName','chapter3.pdf','string'),(2798,489,'name','chapter3.pdf','string'),(2799,490,'file','chapter3.pdf','string'),(2800,490,'name','Daniel Barnes','string'),(2801,490,'username','dbarnes','string'),(2802,491,'fileStage','10','int'),(2803,491,'sourceSubmissionFileId','98','int'),(2804,491,'submissionFileId','111','int'),(2805,491,'fileId','58','int'),(2806,491,'submissionId','14','int'),(2807,491,'originalFileName','chapter3.pdf','string'),(2808,491,'username','dbarnes','string'),(2809,492,'fileStage','10','int'),(2810,492,'sourceSubmissionFileId','98','int'),(2811,492,'submissionFileId','111','int'),(2812,492,'fileId','58','int'),(2813,492,'submissionId','14','int'),(2814,492,'username','dbarnes','string'),(2815,492,'originalFileName','chapter3.pdf','string'),(2816,492,'name','chapter3.pdf','string'),(2817,493,'fileStage','10','int'),(2818,493,'sourceSubmissionFileId','99','int'),(2819,493,'submissionFileId','110','int'),(2820,493,'fileId','59','int'),(2821,493,'submissionId','14','int'),(2822,493,'originalFileName','chapter4.pdf','string'),(2823,493,'username','dbarnes','string'),(2824,494,'fileStage','10','int'),(2825,494,'sourceSubmissionFileId','99','int'),(2826,494,'submissionFileId','110','int'),(2827,494,'fileId','59','int'),(2828,494,'submissionId','14','int'),(2829,494,'username','dbarnes','string'),(2830,494,'originalFileName','chapter4.pdf','string'),(2831,494,'name','chapter4.pdf','string'),(2832,495,'file','chapter4.pdf','string'),(2833,495,'name','Daniel Barnes','string'),(2834,495,'username','dbarnes','string'),(2835,496,'fileStage','10','int'),(2836,496,'sourceSubmissionFileId','99','int'),(2837,496,'submissionFileId','110','int'),(2838,496,'fileId','59','int'),(2839,496,'submissionId','14','int'),(2840,496,'originalFileName','chapter4.pdf','string'),(2841,496,'username','dbarnes','string'),(2842,497,'fileStage','10','int'),(2843,497,'sourceSubmissionFileId','99','int'),(2844,497,'submissionFileId','110','int'),(2845,497,'fileId','59','int'),(2846,497,'submissionId','14','int'),(2847,497,'username','dbarnes','string'),(2848,497,'originalFileName','chapter4.pdf','string'),(2849,497,'name','chapter4.pdf','string'),(2850,498,'fileStage','10','int'),(2851,498,'sourceSubmissionFileId','100','int'),(2852,498,'submissionFileId','109','int'),(2853,498,'fileId','60','int'),(2854,498,'submissionId','14','int'),(2855,498,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(2856,498,'username','dbarnes','string'),(2857,499,'fileStage','10','int'),(2858,499,'sourceSubmissionFileId','100','int'),(2859,499,'submissionFileId','109','int'),(2860,499,'fileId','60','int'),(2861,499,'submissionId','14','int'),(2862,499,'username','dbarnes','string'),(2863,499,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(2864,499,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(2865,500,'file','Segmentation of Vascular Ultrasound Imag.pdf','string'),(2866,500,'name','Daniel Barnes','string'),(2867,500,'username','dbarnes','string'),(2868,501,'fileStage','10','int'),(2869,501,'sourceSubmissionFileId','100','int'),(2870,501,'submissionFileId','109','int'),(2871,501,'fileId','60','int'),(2872,501,'submissionId','14','int'),(2873,501,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(2874,501,'username','dbarnes','string'),(2875,502,'fileStage','10','int'),(2876,502,'sourceSubmissionFileId','100','int'),(2877,502,'submissionFileId','109','int'),(2878,502,'fileId','60','int'),(2879,502,'submissionId','14','int'),(2880,502,'username','dbarnes','string'),(2881,502,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(2882,502,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(2883,503,'fileStage','10','int'),(2884,503,'sourceSubmissionFileId','101','int'),(2885,503,'submissionFileId','108','int'),(2886,503,'fileId','61','int'),(2887,503,'submissionId','14','int'),(2888,503,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(2889,503,'username','dbarnes','string'),(2890,504,'fileStage','10','int'),(2891,504,'sourceSubmissionFileId','101','int'),(2892,504,'submissionFileId','108','int'),(2893,504,'fileId','61','int'),(2894,504,'submissionId','14','int'),(2895,504,'username','dbarnes','string'),(2896,504,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(2897,504,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(2898,505,'file','The Canadian Nutrient File: Nutrient Val.pdf','string'),(2899,505,'name','Daniel Barnes','string'),(2900,505,'username','dbarnes','string'),(2901,506,'fileStage','10','int'),(2902,506,'sourceSubmissionFileId','101','int'),(2903,506,'submissionFileId','108','int'),(2904,506,'fileId','61','int'),(2905,506,'submissionId','14','int'),(2906,506,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(2907,506,'username','dbarnes','string'),(2908,507,'fileStage','10','int'),(2909,507,'sourceSubmissionFileId','101','int'),(2910,507,'submissionFileId','108','int'),(2911,507,'fileId','61','int'),(2912,507,'submissionId','14','int'),(2913,507,'username','dbarnes','string'),(2914,507,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(2915,507,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(2916,511,'fileStage','2','int'),(2917,511,'sourceSubmissionFileId',NULL,'string'),(2918,511,'submissionFileId','114','int'),(2919,511,'fileId','62','int'),(2920,511,'submissionId','15','int'),(2921,511,'originalFileName','chapter1.pdf','string'),(2922,511,'username','mforan','string'),(2923,512,'fileStage','2','int'),(2924,512,'submissionFileId','114','int'),(2925,512,'fileId','62','int'),(2926,512,'submissionId','15','int'),(2927,512,'username','mforan','string'),(2928,512,'name','chapter1.pdf','string'),(2929,513,'fileStage','2','int'),(2930,513,'sourceSubmissionFileId',NULL,'string'),(2931,513,'submissionFileId','114','int'),(2932,513,'fileId','62','int'),(2933,513,'submissionId','15','int'),(2934,513,'originalFileName','chapter1.pdf','string'),(2935,513,'username','mforan','string'),(2936,514,'fileStage','2','int'),(2937,514,'sourceSubmissionFileId',NULL,'string'),(2938,514,'submissionFileId','114','int'),(2939,514,'fileId','62','int'),(2940,514,'submissionId','15','int'),(2941,514,'username','mforan','string'),(2942,514,'originalFileName','chapter1.pdf','string'),(2943,514,'name','chapter1.pdf','string'),(2944,515,'fileStage','2','int'),(2945,515,'sourceSubmissionFileId',NULL,'string'),(2946,515,'submissionFileId','115','int'),(2947,515,'fileId','63','int'),(2948,515,'submissionId','15','int'),(2949,515,'originalFileName','chapter2.pdf','string'),(2950,515,'username','mforan','string'),(2951,516,'fileStage','2','int'),(2952,516,'submissionFileId','115','int'),(2953,516,'fileId','63','int'),(2954,516,'submissionId','15','int'),(2955,516,'username','mforan','string'),(2956,516,'name','chapter2.pdf','string'),(2957,517,'fileStage','2','int'),(2958,517,'sourceSubmissionFileId',NULL,'string'),(2959,517,'submissionFileId','115','int'),(2960,517,'fileId','63','int'),(2961,517,'submissionId','15','int'),(2962,517,'originalFileName','chapter2.pdf','string'),(2963,517,'username','mforan','string'),(2964,518,'fileStage','2','int'),(2965,518,'sourceSubmissionFileId',NULL,'string'),(2966,518,'submissionFileId','115','int'),(2967,518,'fileId','63','int'),(2968,518,'submissionId','15','int'),(2969,518,'username','mforan','string'),(2970,518,'originalFileName','chapter2.pdf','string'),(2971,518,'name','chapter2.pdf','string'),(2972,519,'fileStage','2','int'),(2973,519,'sourceSubmissionFileId',NULL,'string'),(2974,519,'submissionFileId','116','int'),(2975,519,'fileId','64','int'),(2976,519,'submissionId','15','int'),(2977,519,'originalFileName','chapter3.pdf','string'),(2978,519,'username','mforan','string'),(2979,520,'fileStage','2','int'),(2980,520,'submissionFileId','116','int'),(2981,520,'fileId','64','int'),(2982,520,'submissionId','15','int'),(2983,520,'username','mforan','string'),(2984,520,'name','chapter3.pdf','string'),(2985,521,'fileStage','2','int'),(2986,521,'sourceSubmissionFileId',NULL,'string'),(2987,521,'submissionFileId','116','int'),(2988,521,'fileId','64','int'),(2989,521,'submissionId','15','int'),(2990,521,'originalFileName','chapter3.pdf','string'),(2991,521,'username','mforan','string'),(2992,522,'fileStage','2','int'),(2993,522,'sourceSubmissionFileId',NULL,'string'),(2994,522,'submissionFileId','116','int'),(2995,522,'fileId','64','int'),(2996,522,'submissionId','15','int'),(2997,522,'username','mforan','string'),(2998,522,'originalFileName','chapter3.pdf','string'),(2999,522,'name','chapter3.pdf','string'),(3000,524,'editorId','3','int'),(3001,524,'editorName','Daniel Barnes','string'),(3002,524,'submissionId','15','int'),(3003,524,'decision','18','int'),(3004,525,'fileStage','4','int'),(3005,525,'sourceSubmissionFileId','116','int'),(3006,525,'submissionFileId','117','int'),(3007,525,'fileId','64','int'),(3008,525,'submissionId','15','int'),(3009,525,'originalFileName','chapter3.pdf','string'),(3010,525,'username','dbarnes','string'),(3011,526,'fileStage','4','int'),(3012,526,'submissionFileId','117','int'),(3013,526,'fileId','64','int'),(3014,526,'submissionId','15','int'),(3015,526,'username','dbarnes','string'),(3016,526,'name','chapter3.pdf','string'),(3017,527,'fileStage','4','int'),(3018,527,'sourceSubmissionFileId','115','int'),(3019,527,'submissionFileId','118','int'),(3020,527,'fileId','63','int'),(3021,527,'submissionId','15','int'),(3022,527,'originalFileName','chapter2.pdf','string'),(3023,527,'username','dbarnes','string'),(3024,528,'fileStage','4','int'),(3025,528,'submissionFileId','118','int'),(3026,528,'fileId','63','int'),(3027,528,'submissionId','15','int'),(3028,528,'username','dbarnes','string'),(3029,528,'name','chapter2.pdf','string'),(3030,529,'fileStage','4','int'),(3031,529,'sourceSubmissionFileId','114','int'),(3032,529,'submissionFileId','119','int'),(3033,529,'fileId','62','int'),(3034,529,'submissionId','15','int'),(3035,529,'originalFileName','chapter1.pdf','string'),(3036,529,'username','dbarnes','string'),(3037,530,'fileStage','4','int'),(3038,530,'submissionFileId','119','int'),(3039,530,'fileId','62','int'),(3040,530,'submissionId','15','int'),(3041,530,'username','dbarnes','string'),(3042,530,'name','chapter1.pdf','string'),(3043,533,'fileStage','2','int'),(3044,533,'sourceSubmissionFileId',NULL,'string'),(3045,533,'submissionFileId','120','int'),(3046,533,'fileId','65','int'),(3047,533,'submissionId','16','int'),(3048,533,'originalFileName','foreward.pdf','string'),(3049,533,'username','mpower','string'),(3050,534,'fileStage','2','int'),(3051,534,'submissionFileId','120','int'),(3052,534,'fileId','65','int'),(3053,534,'submissionId','16','int'),(3054,534,'username','mpower','string'),(3055,534,'name','foreward.pdf','string'),(3056,535,'fileStage','2','int'),(3057,535,'sourceSubmissionFileId',NULL,'string'),(3058,535,'submissionFileId','120','int'),(3059,535,'fileId','65','int'),(3060,535,'submissionId','16','int'),(3061,535,'originalFileName','foreward.pdf','string'),(3062,535,'username','mpower','string'),(3063,536,'fileStage','2','int'),(3064,536,'sourceSubmissionFileId',NULL,'string'),(3065,536,'submissionFileId','120','int'),(3066,536,'fileId','65','int'),(3067,536,'submissionId','16','int'),(3068,536,'username','mpower','string'),(3069,536,'originalFileName','foreward.pdf','string'),(3070,536,'name','foreward.pdf','string'),(3071,537,'fileStage','2','int'),(3072,537,'sourceSubmissionFileId',NULL,'string'),(3073,537,'submissionFileId','121','int'),(3074,537,'fileId','66','int'),(3075,537,'submissionId','16','int'),(3076,537,'originalFileName','preface.pdf','string'),(3077,537,'username','mpower','string'),(3078,538,'fileStage','2','int'),(3079,538,'submissionFileId','121','int'),(3080,538,'fileId','66','int'),(3081,538,'submissionId','16','int'),(3082,538,'username','mpower','string'),(3083,538,'name','preface.pdf','string'),(3084,539,'fileStage','2','int'),(3085,539,'sourceSubmissionFileId',NULL,'string'),(3086,539,'submissionFileId','121','int'),(3087,539,'fileId','66','int'),(3088,539,'submissionId','16','int'),(3089,539,'originalFileName','preface.pdf','string'),(3090,539,'username','mpower','string'),(3091,540,'fileStage','2','int'),(3092,540,'sourceSubmissionFileId',NULL,'string'),(3093,540,'submissionFileId','121','int'),(3094,540,'fileId','66','int'),(3095,540,'submissionId','16','int'),(3096,540,'username','mpower','string'),(3097,540,'originalFileName','preface.pdf','string'),(3098,540,'name','preface.pdf','string'),(3099,541,'fileStage','2','int'),(3100,541,'sourceSubmissionFileId',NULL,'string'),(3101,541,'submissionFileId','122','int'),(3102,541,'fileId','67','int'),(3103,541,'submissionId','16','int'),(3104,541,'originalFileName','cases.pdf','string'),(3105,541,'username','mpower','string'),(3106,542,'fileStage','2','int'),(3107,542,'submissionFileId','122','int'),(3108,542,'fileId','67','int'),(3109,542,'submissionId','16','int'),(3110,542,'username','mpower','string'),(3111,542,'name','cases.pdf','string'),(3112,543,'fileStage','2','int'),(3113,543,'sourceSubmissionFileId',NULL,'string'),(3114,543,'submissionFileId','122','int'),(3115,543,'fileId','67','int'),(3116,543,'submissionId','16','int'),(3117,543,'originalFileName','cases.pdf','string'),(3118,543,'username','mpower','string'),(3119,544,'fileStage','2','int'),(3120,544,'sourceSubmissionFileId',NULL,'string'),(3121,544,'submissionFileId','122','int'),(3122,544,'fileId','67','int'),(3123,544,'submissionId','16','int'),(3124,544,'username','mpower','string'),(3125,544,'originalFileName','cases.pdf','string'),(3126,544,'name','cases.pdf','string'),(3127,545,'fileStage','2','int'),(3128,545,'sourceSubmissionFileId',NULL,'string'),(3129,545,'submissionFileId','123','int'),(3130,545,'fileId','68','int'),(3131,545,'submissionId','16','int'),(3132,545,'originalFileName','conclusion.pdf','string'),(3133,545,'username','mpower','string'),(3134,546,'fileStage','2','int'),(3135,546,'submissionFileId','123','int'),(3136,546,'fileId','68','int'),(3137,546,'submissionId','16','int'),(3138,546,'username','mpower','string'),(3139,546,'name','conclusion.pdf','string'),(3140,547,'fileStage','2','int'),(3141,547,'sourceSubmissionFileId',NULL,'string'),(3142,547,'submissionFileId','123','int'),(3143,547,'fileId','68','int'),(3144,547,'submissionId','16','int'),(3145,547,'originalFileName','conclusion.pdf','string'),(3146,547,'username','mpower','string'),(3147,548,'fileStage','2','int'),(3148,548,'sourceSubmissionFileId',NULL,'string'),(3149,548,'submissionFileId','123','int'),(3150,548,'fileId','68','int'),(3151,548,'submissionId','16','int'),(3152,548,'username','mpower','string'),(3153,548,'originalFileName','conclusion.pdf','string'),(3154,548,'name','conclusion.pdf','string'),(3155,549,'fileStage','2','int'),(3156,549,'sourceSubmissionFileId',NULL,'string'),(3157,549,'submissionFileId','124','int'),(3158,549,'fileId','69','int'),(3159,549,'submissionId','16','int'),(3160,549,'originalFileName','bibliography.pdf','string'),(3161,549,'username','mpower','string'),(3162,550,'fileStage','2','int'),(3163,550,'submissionFileId','124','int'),(3164,550,'fileId','69','int'),(3165,550,'submissionId','16','int'),(3166,550,'username','mpower','string'),(3167,550,'name','bibliography.pdf','string'),(3168,551,'fileStage','2','int'),(3169,551,'sourceSubmissionFileId',NULL,'string'),(3170,551,'submissionFileId','124','int'),(3171,551,'fileId','69','int'),(3172,551,'submissionId','16','int'),(3173,551,'originalFileName','bibliography.pdf','string'),(3174,551,'username','mpower','string'),(3175,552,'fileStage','2','int'),(3176,552,'sourceSubmissionFileId',NULL,'string'),(3177,552,'submissionFileId','124','int'),(3178,552,'fileId','69','int'),(3179,552,'submissionId','16','int'),(3180,552,'username','mpower','string'),(3181,552,'originalFileName','bibliography.pdf','string'),(3182,552,'name','bibliography.pdf','string'),(3183,554,'editorId','3','int'),(3184,554,'editorName','Daniel Barnes','string'),(3185,554,'submissionId','16','int'),(3186,554,'decision','18','int'),(3187,555,'fileStage','4','int'),(3188,555,'sourceSubmissionFileId','124','int'),(3189,555,'submissionFileId','125','int'),(3190,555,'fileId','69','int'),(3191,555,'submissionId','16','int'),(3192,555,'originalFileName','bibliography.pdf','string'),(3193,555,'username','dbarnes','string'),(3194,556,'fileStage','4','int'),(3195,556,'submissionFileId','125','int'),(3196,556,'fileId','69','int'),(3197,556,'submissionId','16','int'),(3198,556,'username','dbarnes','string'),(3199,556,'name','bibliography.pdf','string'),(3200,557,'fileStage','4','int'),(3201,557,'sourceSubmissionFileId','123','int'),(3202,557,'submissionFileId','126','int'),(3203,557,'fileId','68','int'),(3204,557,'submissionId','16','int'),(3205,557,'originalFileName','conclusion.pdf','string'),(3206,557,'username','dbarnes','string'),(3207,558,'fileStage','4','int'),(3208,558,'submissionFileId','126','int'),(3209,558,'fileId','68','int'),(3210,558,'submissionId','16','int'),(3211,558,'username','dbarnes','string'),(3212,558,'name','conclusion.pdf','string'),(3213,559,'fileStage','4','int'),(3214,559,'sourceSubmissionFileId','122','int'),(3215,559,'submissionFileId','127','int'),(3216,559,'fileId','67','int'),(3217,559,'submissionId','16','int'),(3218,559,'originalFileName','cases.pdf','string'),(3219,559,'username','dbarnes','string'),(3220,560,'fileStage','4','int'),(3221,560,'submissionFileId','127','int'),(3222,560,'fileId','67','int'),(3223,560,'submissionId','16','int'),(3224,560,'username','dbarnes','string'),(3225,560,'name','cases.pdf','string'),(3226,561,'fileStage','4','int'),(3227,561,'sourceSubmissionFileId','121','int'),(3228,561,'submissionFileId','128','int'),(3229,561,'fileId','66','int'),(3230,561,'submissionId','16','int'),(3231,561,'originalFileName','preface.pdf','string'),(3232,561,'username','dbarnes','string'),(3233,562,'fileStage','4','int'),(3234,562,'submissionFileId','128','int'),(3235,562,'fileId','66','int'),(3236,562,'submissionId','16','int'),(3237,562,'username','dbarnes','string'),(3238,562,'name','preface.pdf','string'),(3239,563,'fileStage','4','int'),(3240,563,'sourceSubmissionFileId','120','int'),(3241,563,'submissionFileId','129','int'),(3242,563,'fileId','65','int'),(3243,563,'submissionId','16','int'),(3244,563,'originalFileName','foreward.pdf','string'),(3245,563,'username','dbarnes','string'),(3246,564,'fileStage','4','int'),(3247,564,'submissionFileId','129','int'),(3248,564,'fileId','65','int'),(3249,564,'submissionId','16','int'),(3250,564,'username','dbarnes','string'),(3251,564,'name','foreward.pdf','string'),(3252,565,'reviewAssignmentId','21','int'),(3253,565,'reviewerName','Adela Gallego','string'),(3254,565,'submissionId','16','int'),(3255,565,'stageId','3','int'),(3256,565,'round','1','int'),(3257,566,'reviewAssignmentId','22','int'),(3258,566,'reviewerName','Al Zacharia','string'),(3259,566,'submissionId','16','int'),(3260,566,'stageId','3','int'),(3261,566,'round','1','int'),(3262,567,'reviewAssignmentId','23','int'),(3263,567,'reviewerName','Gonzalo Favio','string'),(3264,567,'submissionId','16','int'),(3265,567,'stageId','3','int'),(3266,567,'round','1','int'),(3267,568,'reviewAssignmentId','21','int'),(3268,568,'reviewerName','Adela Gallego','string'),(3269,568,'submissionId','16','int'),(3270,568,'round','1','int'),(3271,569,'reviewAssignmentId','21','int'),(3272,569,'reviewerName','Adela Gallego','string'),(3273,569,'submissionId','16','int'),(3274,569,'round','1','int'),(3275,572,'fileStage','2','int'),(3276,572,'sourceSubmissionFileId',NULL,'string'),(3277,572,'submissionFileId','130','int'),(3278,572,'fileId','70','int'),(3279,572,'submissionId','17','int'),(3280,572,'originalFileName','preface.pdf','string'),(3281,572,'username','msmith','string'),(3282,573,'fileStage','2','int'),(3283,573,'submissionFileId','130','int'),(3284,573,'fileId','70','int'),(3285,573,'submissionId','17','int'),(3286,573,'username','msmith','string'),(3287,573,'name','preface.pdf','string'),(3288,574,'fileStage','2','int'),(3289,574,'sourceSubmissionFileId',NULL,'string'),(3290,574,'submissionFileId','130','int'),(3291,574,'fileId','70','int'),(3292,574,'submissionId','17','int'),(3293,574,'originalFileName','preface.pdf','string'),(3294,574,'username','msmith','string'),(3295,575,'fileStage','2','int'),(3296,575,'sourceSubmissionFileId',NULL,'string'),(3297,575,'submissionFileId','130','int'),(3298,575,'fileId','70','int'),(3299,575,'submissionId','17','int'),(3300,575,'username','msmith','string'),(3301,575,'originalFileName','preface.pdf','string'),(3302,575,'name','preface.pdf','string'),(3303,576,'fileStage','2','int'),(3304,576,'sourceSubmissionFileId',NULL,'string'),(3305,576,'submissionFileId','131','int'),(3306,576,'fileId','71','int'),(3307,576,'submissionId','17','int'),(3308,576,'originalFileName','introduction.pdf','string'),(3309,576,'username','msmith','string'),(3310,577,'fileStage','2','int'),(3311,577,'submissionFileId','131','int'),(3312,577,'fileId','71','int'),(3313,577,'submissionId','17','int'),(3314,577,'username','msmith','string'),(3315,577,'name','introduction.pdf','string'),(3316,578,'fileStage','2','int'),(3317,578,'sourceSubmissionFileId',NULL,'string'),(3318,578,'submissionFileId','131','int'),(3319,578,'fileId','71','int'),(3320,578,'submissionId','17','int'),(3321,578,'originalFileName','introduction.pdf','string'),(3322,578,'username','msmith','string'),(3323,579,'fileStage','2','int'),(3324,579,'sourceSubmissionFileId',NULL,'string'),(3325,579,'submissionFileId','131','int'),(3326,579,'fileId','71','int'),(3327,579,'submissionId','17','int'),(3328,579,'username','msmith','string'),(3329,579,'originalFileName','introduction.pdf','string'),(3330,579,'name','introduction.pdf','string'),(3331,580,'fileStage','2','int'),(3332,580,'sourceSubmissionFileId',NULL,'string'),(3333,580,'submissionFileId','132','int'),(3334,580,'fileId','72','int'),(3335,580,'submissionId','17','int'),(3336,580,'originalFileName','chapter1.pdf','string'),(3337,580,'username','msmith','string'),(3338,581,'fileStage','2','int'),(3339,581,'submissionFileId','132','int'),(3340,581,'fileId','72','int'),(3341,581,'submissionId','17','int'),(3342,581,'username','msmith','string'),(3343,581,'name','chapter1.pdf','string'),(3344,582,'fileStage','2','int'),(3345,582,'sourceSubmissionFileId',NULL,'string'),(3346,582,'submissionFileId','132','int'),(3347,582,'fileId','72','int'),(3348,582,'submissionId','17','int'),(3349,582,'originalFileName','chapter1.pdf','string'),(3350,582,'username','msmith','string'),(3351,583,'fileStage','2','int'),(3352,583,'sourceSubmissionFileId',NULL,'string'),(3353,583,'submissionFileId','132','int'),(3354,583,'fileId','72','int'),(3355,583,'submissionId','17','int'),(3356,583,'username','msmith','string'),(3357,583,'originalFileName','chapter1.pdf','string'),(3358,583,'name','chapter1.pdf','string'),(3359,584,'fileStage','2','int'),(3360,584,'sourceSubmissionFileId',NULL,'string'),(3361,584,'submissionFileId','133','int'),(3362,584,'fileId','73','int'),(3363,584,'submissionId','17','int'),(3364,584,'originalFileName','chapter2.pdf','string'),(3365,584,'username','msmith','string'),(3366,585,'fileStage','2','int'),(3367,585,'submissionFileId','133','int'),(3368,585,'fileId','73','int'),(3369,585,'submissionId','17','int'),(3370,585,'username','msmith','string'),(3371,585,'name','chapter2.pdf','string'),(3372,586,'fileStage','2','int'),(3373,586,'sourceSubmissionFileId',NULL,'string'),(3374,586,'submissionFileId','133','int'),(3375,586,'fileId','73','int'),(3376,586,'submissionId','17','int'),(3377,586,'originalFileName','chapter2.pdf','string'),(3378,586,'username','msmith','string'),(3379,587,'fileStage','2','int'),(3380,587,'sourceSubmissionFileId',NULL,'string'),(3381,587,'submissionFileId','133','int'),(3382,587,'fileId','73','int'),(3383,587,'submissionId','17','int'),(3384,587,'username','msmith','string'),(3385,587,'originalFileName','chapter2.pdf','string'),(3386,587,'name','chapter2.pdf','string'),(3387,588,'fileStage','2','int'),(3388,588,'sourceSubmissionFileId',NULL,'string'),(3389,588,'submissionFileId','134','int'),(3390,588,'fileId','74','int'),(3391,588,'submissionId','17','int'),(3392,588,'originalFileName','chapter3.pdf','string'),(3393,588,'username','msmith','string'),(3394,589,'fileStage','2','int'),(3395,589,'submissionFileId','134','int'),(3396,589,'fileId','74','int'),(3397,589,'submissionId','17','int'),(3398,589,'username','msmith','string'),(3399,589,'name','chapter3.pdf','string'),(3400,590,'fileStage','2','int'),(3401,590,'sourceSubmissionFileId',NULL,'string'),(3402,590,'submissionFileId','134','int'),(3403,590,'fileId','74','int'),(3404,590,'submissionId','17','int'),(3405,590,'originalFileName','chapter3.pdf','string'),(3406,590,'username','msmith','string'),(3407,591,'fileStage','2','int'),(3408,591,'sourceSubmissionFileId',NULL,'string'),(3409,591,'submissionFileId','134','int'),(3410,591,'fileId','74','int'),(3411,591,'submissionId','17','int'),(3412,591,'username','msmith','string'),(3413,591,'originalFileName','chapter3.pdf','string'),(3414,591,'name','chapter3.pdf','string'),(3415,592,'fileStage','2','int'),(3416,592,'sourceSubmissionFileId',NULL,'string'),(3417,592,'submissionFileId','135','int'),(3418,592,'fileId','75','int'),(3419,592,'submissionId','17','int'),(3420,592,'originalFileName','chapter4.pdf','string'),(3421,592,'username','msmith','string'),(3422,593,'fileStage','2','int'),(3423,593,'submissionFileId','135','int'),(3424,593,'fileId','75','int'),(3425,593,'submissionId','17','int'),(3426,593,'username','msmith','string'),(3427,593,'name','chapter4.pdf','string'),(3428,594,'fileStage','2','int'),(3429,594,'sourceSubmissionFileId',NULL,'string'),(3430,594,'submissionFileId','135','int'),(3431,594,'fileId','75','int'),(3432,594,'submissionId','17','int'),(3433,594,'originalFileName','chapter4.pdf','string'),(3434,594,'username','msmith','string'),(3435,595,'fileStage','2','int'),(3436,595,'sourceSubmissionFileId',NULL,'string'),(3437,595,'submissionFileId','135','int'),(3438,595,'fileId','75','int'),(3439,595,'submissionId','17','int'),(3440,595,'username','msmith','string'),(3441,595,'originalFileName','chapter4.pdf','string'),(3442,595,'name','chapter4.pdf','string'),(3443,597,'editorId','3','int'),(3444,597,'editorName','Daniel Barnes','string'),(3445,597,'submissionId','17','int'),(3446,597,'decision','1','int'),(3447,598,'fileStage','19','int'),(3448,598,'sourceSubmissionFileId','135','int'),(3449,598,'submissionFileId','136','int'),(3450,598,'fileId','75','int'),(3451,598,'submissionId','17','int'),(3452,598,'originalFileName','chapter4.pdf','string'),(3453,598,'username','dbarnes','string'),(3454,599,'fileStage','19','int'),(3455,599,'submissionFileId','136','int'),(3456,599,'fileId','75','int'),(3457,599,'submissionId','17','int'),(3458,599,'username','dbarnes','string'),(3459,599,'name','chapter4.pdf','string'),(3460,600,'fileStage','19','int'),(3461,600,'sourceSubmissionFileId','133','int'),(3462,600,'submissionFileId','137','int'),(3463,600,'fileId','73','int'),(3464,600,'submissionId','17','int'),(3465,600,'originalFileName','chapter2.pdf','string'),(3466,600,'username','dbarnes','string'),(3467,601,'fileStage','19','int'),(3468,601,'submissionFileId','137','int'),(3469,601,'fileId','73','int'),(3470,601,'submissionId','17','int'),(3471,601,'username','dbarnes','string'),(3472,601,'name','chapter2.pdf','string'),(3473,602,'fileStage','19','int'),(3474,602,'sourceSubmissionFileId','132','int'),(3475,602,'submissionFileId','138','int'),(3476,602,'fileId','72','int'),(3477,602,'submissionId','17','int'),(3478,602,'originalFileName','chapter1.pdf','string'),(3479,602,'username','dbarnes','string'),(3480,603,'fileStage','19','int'),(3481,603,'submissionFileId','138','int'),(3482,603,'fileId','72','int'),(3483,603,'submissionId','17','int'),(3484,603,'username','dbarnes','string'),(3485,603,'name','chapter1.pdf','string'),(3486,604,'fileStage','19','int'),(3487,604,'sourceSubmissionFileId','130','int'),(3488,604,'submissionFileId','139','int'),(3489,604,'fileId','70','int'),(3490,604,'submissionId','17','int'),(3491,604,'originalFileName','preface.pdf','string'),(3492,604,'username','dbarnes','string'),(3493,605,'fileStage','19','int'),(3494,605,'submissionFileId','139','int'),(3495,605,'fileId','70','int'),(3496,605,'submissionId','17','int'),(3497,605,'username','dbarnes','string'),(3498,605,'name','preface.pdf','string'),(3499,606,'fileStage','19','int'),(3500,606,'sourceSubmissionFileId','131','int'),(3501,606,'submissionFileId','140','int'),(3502,606,'fileId','71','int'),(3503,606,'submissionId','17','int'),(3504,606,'originalFileName','introduction.pdf','string'),(3505,606,'username','dbarnes','string'),(3506,607,'fileStage','19','int'),(3507,607,'submissionFileId','140','int'),(3508,607,'fileId','71','int'),(3509,607,'submissionId','17','int'),(3510,607,'username','dbarnes','string'),(3511,607,'name','introduction.pdf','string'),(3512,608,'fileStage','19','int'),(3513,608,'sourceSubmissionFileId','134','int'),(3514,608,'submissionFileId','141','int'),(3515,608,'fileId','74','int'),(3516,608,'submissionId','17','int'),(3517,608,'originalFileName','chapter3.pdf','string'),(3518,608,'username','dbarnes','string'),(3519,609,'fileStage','19','int'),(3520,609,'submissionFileId','141','int'),(3521,609,'fileId','74','int'),(3522,609,'submissionId','17','int'),(3523,609,'username','dbarnes','string'),(3524,609,'name','chapter3.pdf','string'),(3525,610,'reviewAssignmentId','24','int'),(3526,610,'reviewerName','Julie Janssen','string'),(3527,610,'submissionId','17','int'),(3528,610,'stageId','2','int'),(3529,610,'round','1','int'),(3530,611,'reviewAssignmentId','25','int'),(3531,611,'reviewerName','Paul Hudson','string'),(3532,611,'submissionId','17','int'),(3533,611,'stageId','2','int'),(3534,611,'round','1','int');
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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A log of all failed jobs.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about which submissions are featured in the press.';
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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='Records information in the database about files tracked by the system, linking them to the local filesystem.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'presses/1/monographs/1/642376b79ec33.pdf','application/pdf'),(2,'presses/1/monographs/1/642376b8c5a20.pdf','application/pdf'),(3,'presses/1/monographs/1/642376b9f352b.pdf','application/pdf'),(4,'presses/1/monographs/2/642377111acb6.pdf','application/pdf'),(5,'presses/1/monographs/2/6423771247cec.pdf','application/pdf'),(6,'presses/1/monographs/2/642377139d535.pdf','application/pdf'),(7,'presses/1/monographs/2/64237714d6131.pdf','application/pdf'),(9,'presses/1/monographs/3/642377cfe0e34.pdf','application/pdf'),(10,'presses/1/monographs/3/642377d10bb85.pdf','application/pdf'),(11,'presses/1/monographs/3/642377d23b748.pdf','application/pdf'),(12,'presses/1/monographs/3/642377d35e88b.pdf','application/pdf'),(13,'presses/1/monographs/3/642377d4a6b9a.pdf','application/pdf'),(14,'presses/1/monographs/4/64237807efce3.pdf','application/pdf'),(15,'presses/1/monographs/4/642378091f163.pdf','application/pdf'),(16,'presses/1/monographs/4/6423780a47a2b.pdf','application/pdf'),(17,'presses/1/monographs/4/6423780b73d80.pdf','application/pdf'),(18,'presses/1/monographs/5/64237891ee56b.pdf','application/pdf'),(19,'presses/1/monographs/5/64237893151af.pdf','application/pdf'),(20,'presses/1/monographs/5/642378943bfac.pdf','application/pdf'),(21,'presses/1/monographs/5/6423789566cd4.pdf','application/pdf'),(22,'presses/1/monographs/5/64237896b59d3.pdf','application/pdf'),(23,'presses/1/monographs/5/64237897e17be.pdf','application/pdf'),(24,'presses/1/monographs/6/6423795e197db.pdf','application/pdf'),(25,'presses/1/monographs/6/6423795f37a25.pdf','application/pdf'),(26,'presses/1/monographs/6/642379605f601.pdf','application/pdf'),(27,'presses/1/monographs/6/64237961880c8.pdf','application/pdf'),(28,'presses/1/monographs/7/642379caa9721.pdf','application/pdf'),(29,'presses/1/monographs/7/642379cbc29b7.pdf','application/pdf'),(30,'presses/1/monographs/7/642379ccef0a4.pdf','application/pdf'),(31,'presses/1/monographs/7/642379ce2cc34.pdf','application/pdf'),(32,'presses/1/monographs/7/642379cf6ccc7.pdf','application/pdf'),(33,'presses/1/monographs/8/64237a3553c53.pdf','application/pdf'),(34,'presses/1/monographs/9/64237a4352a2c.pdf','application/pdf'),(35,'presses/1/monographs/9/64237a4471d91.pdf','application/pdf'),(36,'presses/1/monographs/9/64237a45979ed.pdf','application/pdf'),(37,'presses/1/monographs/9/64237a46bc513.pdf','application/pdf'),(38,'presses/1/monographs/9/64237a480d8d0.pdf','application/pdf'),(39,'presses/1/monographs/10/64237a940ad25.pdf','application/pdf'),(40,'presses/1/monographs/10/64237a9529459.pdf','application/pdf'),(41,'presses/1/monographs/10/64237a965240a.pdf','application/pdf'),(42,'presses/1/monographs/10/64237a9783781.pdf','application/pdf'),(43,'presses/1/monographs/10/64237a98d3f3d.pdf','application/pdf'),(44,'presses/1/monographs/10/64237a9a07313.pdf','application/pdf'),(45,'presses/1/monographs/10/64237a9b42132.pdf','application/pdf'),(46,'presses/1/monographs/10/64237a9c7f5de.pdf','application/pdf'),(47,'presses/1/monographs/10/64237a9dc5915.pdf','application/pdf'),(48,'presses/1/monographs/11/64237afaaa910.pdf','application/pdf'),(49,'presses/1/monographs/11/64237afbd6dc3.pdf','application/pdf'),(50,'presses/1/monographs/12/64237b78196f8.pdf','application/pdf'),(51,'presses/1/monographs/12/64237b7937468.pdf','application/pdf'),(52,'presses/1/monographs/12/64237b7a61a9f.pdf','application/pdf'),(53,'presses/1/monographs/13/64237bd6bdb17.pdf','application/pdf'),(54,'presses/1/monographs/13/64237bd7d16ce.pdf','application/pdf'),(55,'presses/1/monographs/13/64237bd8f3158.pdf','application/pdf'),(56,'presses/1/monographs/14/64237c640e9e0.pdf','application/pdf'),(57,'presses/1/monographs/14/64237c65222f2.pdf','application/pdf'),(58,'presses/1/monographs/14/64237c663c637.pdf','application/pdf'),(59,'presses/1/monographs/14/64237c6752ed6.pdf','application/pdf'),(60,'presses/1/monographs/14/64237c688b770.pdf','application/pdf'),(61,'presses/1/monographs/14/64237c6994cb3.pdf','application/pdf'),(62,'presses/1/monographs/15/64237d20230de.pdf','application/pdf'),(63,'presses/1/monographs/15/64237d2134b37.pdf','application/pdf'),(64,'presses/1/monographs/15/64237d2251765.pdf','application/pdf'),(65,'presses/1/monographs/16/64237d5504273.pdf','application/pdf'),(66,'presses/1/monographs/16/64237d56154cb.pdf','application/pdf'),(67,'presses/1/monographs/16/64237d57324dd.pdf','application/pdf'),(68,'presses/1/monographs/16/64237d5848894.pdf','application/pdf'),(69,'presses/1/monographs/16/64237d597f68d.pdf','application/pdf'),(70,'presses/1/monographs/17/64237dc112601.pdf','application/pdf'),(71,'presses/1/monographs/17/64237dc21f0f4.pdf','application/pdf'),(72,'presses/1/monographs/17/64237dc336c4d.pdf','application/pdf'),(73,'presses/1/monographs/17/64237dc450cd0.pdf','application/pdf'),(74,'presses/1/monographs/17/64237dc588289.pdf','application/pdf'),(75,'presses/1/monographs/17/64237dc6a9669.pdf','application/pdf');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='Filter groups are used to organized filters into named sets, which can be retrieved by the application for invocation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_groups`
--

LOCK TABLES `filter_groups` WRITE;
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
INSERT INTO `filter_groups` VALUES (1,'publicationFormat=>dc11','plugins.metadata.dc11.publicationFormatAdapter.displayName','plugins.metadata.dc11.publicationFormatAdapter.description','class::classes.publicationFormat.PublicationFormat','metadata::APP\\plugins\\metadata\\dc11\\schema\\Dc11Schema(PUBLICATION_FORMAT)'),(2,'user=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.user.User[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(3,'user-xml=>user','plugins.importexport.users.displayName','plugins.importexport.users.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::classes.users.User[]'),(4,'usergroup=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.security.UserGroup[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(5,'user-xml=>usergroup','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::lib.pkp.classes.security.UserGroup[]'),(6,'monographs=>onix30-xml','plugins.importexport.onix30.displayName','plugins.importexport.onix30.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/onix30/ONIX_BookProduct_3.0_reference.xsd)'),(7,'monograph=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),(8,'native-xml=>monograph','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),(9,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.author.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),(10,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.author.Author[]'),(11,'publication-format=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publicationFormat.PublicationFormat','xml::schema(plugins/importexport/native/native.xsd)'),(12,'native-xml=>PublicationFormat','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publicationFormat.PublicationFormat[]'),(13,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submissionFile.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),(14,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submissionFile.SubmissionFile[]'),(15,'monograph=>onix30-xml','plugins.importexport.onix30.displayName','plugins.importexport.onix30.description','class::classes.submission.Submission','xml::schema(plugins/importexport/native/ONIX_BookProduct_3.0_reference_notstrict.xsd)'),(16,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),(17,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication[]'),(18,'chapter=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.monograph.Chapter[]','xml::schema(plugins/importexport/native/native.xsd)'),(19,'native-xml=>chapter','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.monograph.Chapter[]');
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
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`filter_setting_id`),
  UNIQUE KEY `filter_settings_unique` (`filter_id`,`locale`,`setting_name`),
  KEY `filter_settings_id` (`filter_id`),
  CONSTRAINT `filter_settings_filter_id_foreign` FOREIGN KEY (`filter_id`) REFERENCES `filters` (`filter_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about filters, including localized content.';
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
  `filter_group_id` bigint(20) NOT NULL DEFAULT '0',
  `context_id` bigint(20) NOT NULL DEFAULT '0',
  `display_name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `is_template` smallint(6) NOT NULL DEFAULT '0',
  `parent_filter_id` bigint(20) NOT NULL DEFAULT '0',
  `seq` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`filter_id`),
  KEY `filters_filter_group_id` (`filter_group_id`),
  CONSTRAINT `filters_filter_group_id_foreign` FOREIGN KEY (`filter_group_id`) REFERENCES `filter_groups` (`filter_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='Filters represent a transformation of a supported piece of data from one form to another, such as a PHP object into an XML document.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,1,0,'Extract metadata from a(n) PublicationFormat','APP\\plugins\\metadata\\dc11\\filter\\Dc11SchemaPublicationFormatAdapter',0,0,0),(2,2,0,'User XML user export','PKP\\plugins\\importexport\\users\\filter\\PKPUserUserXmlFilter',0,0,0),(3,3,0,'User XML user import','PKP\\plugins\\importexport\\users\\filter\\UserXmlPKPUserFilter',0,0,0),(4,4,0,'Native XML user group export','PKP\\plugins\\importexport\\users\\filter\\UserGroupNativeXmlFilter',0,0,0),(5,5,0,'Native XML user group import','PKP\\plugins\\importexport\\users\\filter\\NativeXmlUserGroupFilter',0,0,0),(6,6,0,'ONIX 3.0 XML monograph export','APP\\plugins\\importexport\\onix30\\filter\\MonographONIX30XmlFilter',0,0,0),(7,7,0,'Native XML submission export','APP\\plugins\\importexport\\native\\filter\\MonographNativeXmlFilter',0,0,0),(8,8,0,'Native XML submission import','APP\\plugins\\importexport\\native\\filter\\NativeXmlMonographFilter',0,0,0),(9,9,0,'Native XML author export','APP\\plugins\\importexport\\native\\filter\\AuthorNativeXmlFilter',0,0,0),(10,10,0,'Native XML author import','APP\\plugins\\importexport\\native\\filter\\NativeXmlAuthorFilter',0,0,0),(11,11,0,'Native XML representation export','APP\\plugins\\importexport\\native\\filter\\PublicationFormatNativeXmlFilter',0,0,0),(12,12,0,'Native XML representation import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPublicationFormatFilter',0,0,0),(13,14,0,'Native XML submission file import','APP\\plugins\\importexport\\native\\filter\\NativeXmlMonographFileFilter',0,0,0),(14,13,0,'Native XML submission file export','PKP\\plugins\\importexport\\native\\filter\\SubmissionFileNativeXmlFilter',0,0,0),(15,15,0,'ONIX 3.0 XML monograph export','APP\\plugins\\importexport\\onix30\\filter\\MonographONIX30XmlFilter',0,0,0),(16,16,0,'Native XML Publication export','APP\\plugins\\importexport\\native\\filter\\PublicationNativeXmlFilter',0,0,0),(17,17,0,'Native XML publication import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPublicationFilter',0,0,0),(18,18,0,'Native XML chapter export','APP\\plugins\\importexport\\native\\filter\\ChapterNativeXmlFilter',0,0,0),(19,19,0,'Native XML Chapter import','APP\\plugins\\importexport\\native\\filter\\NativeXmlChapterFilter',0,0,0);
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
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`genre_setting_id`),
  UNIQUE KEY `genre_settings_unique` (`genre_id`,`locale`,`setting_name`),
  KEY `genre_settings_genre_id` (`genre_id`),
  CONSTRAINT `genre_settings_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='More data about file genres, including localized properties such as the genre name.';
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
  `enabled` smallint(6) NOT NULL DEFAULT '1',
  `category` bigint(20) NOT NULL DEFAULT '1',
  `dependent` smallint(6) NOT NULL DEFAULT '0',
  `supplementary` smallint(6) NOT NULL DEFAULT '0',
  `required` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Whether or not at least one file of this genre is required for a new submission.',
  `entry_key` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`genre_id`),
  KEY `genres_context_id` (`context_id`),
  CONSTRAINT `genres_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='The types of submission files configured for each context, such as Article Text, Data Set, Transcript, etc.';
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='ONIX identification codes for publication formats.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Records IP address ranges and associates them with institutions.';
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
  `setting_value` mediumtext,
  PRIMARY KEY (`institution_setting_id`),
  UNIQUE KEY `institution_settings_unique` (`institution_id`,`locale`,`setting_name`),
  KEY `institution_settings_institution_id` (`institution_id`),
  CONSTRAINT `institution_settings_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about institutions, including localized properties like names.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Institutions for statistics and subscriptions.';
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
  `options` mediumtext,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Job batches allow jobs to be collected into groups for managed processing.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
INSERT INTO `job_batches` VALUES ('98cc9b0c-18cf-4d4a-8027-70d31b90aeb2','',0,0,0,'[]','a:0:{}',NULL,1680045420,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='All pending or in-progress jobs.';
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
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)',
  PRIMARY KEY (`library_file_setting_id`),
  UNIQUE KEY `library_file_settings_unique` (`file_id`,`locale`,`setting_name`),
  KEY `library_file_settings_file_id` (`file_id`),
  CONSTRAINT `library_file_settings_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `library_files` (`file_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about library files, including localized content such as names.';
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
  `public_access` smallint(6) DEFAULT '0',
  PRIMARY KEY (`file_id`),
  KEY `library_files_context_id` (`context_id`),
  KEY `library_files_submission_id` (`submission_id`),
  CONSTRAINT `library_files_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `library_files_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Library files can be associated with the context (press/server/journal) or with individual submissions, and are typically forms, agreements, and other administrative documents that are not part of the scholarly content.';
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
  `agent_id` bigint(20) DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`market_id`),
  KEY `markets_publication_format_id` (`publication_format_id`),
  KEY `format_markets_pkey` (`market_id`,`publication_format_id`),
  CONSTRAINT `markets_publication_format_id` FOREIGN KEY (`publication_format_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ONIX market information for publication formats.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Daily statistics for views of the homepage.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Daily statistics matching the COUNTER R5 protocol for views and downloads of published submissions and files.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Daily statistics matching the COUNTER R5 protocol for views and downloads from institutions.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Monthly statistics matching the COUNTER R5 protocol for views and downloads from institutions.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Monthly statistics matching the COUNTER R5 protocol for views and downloads of published submissions and files.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Daily statistics for views of published submissions in each series.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Daily statistics for views and downloads of published submissions and files.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Daily statistics by country, region and city for views and downloads of published submissions and files.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Monthly statistics by country, region and city for views and downloads of published submissions and files.';
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
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`navigation_menu_item_assignment_setting_id`),
  UNIQUE KEY `navigation_menu_item_assignment_settings_unique` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_assignment_settings_n_m_i_a_id` (`navigation_menu_item_assignment_id`),
  CONSTRAINT `assignment_settings_navigation_menu_item_assignment_id` FOREIGN KEY (`navigation_menu_item_assignment_id`) REFERENCES `navigation_menu_item_assignments` (`navigation_menu_item_assignment_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about navigation menu item assignments to navigation menus, including localized content.';
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
  `seq` bigint(20) DEFAULT '0',
  PRIMARY KEY (`navigation_menu_item_assignment_id`),
  KEY `navigation_menu_item_assignments_navigation_menu_id` (`navigation_menu_id`),
  KEY `navigation_menu_item_assignments_navigation_menu_item_id` (`navigation_menu_item_id`),
  CONSTRAINT `navigation_menu_item_assignments_navigation_menu_id_foreign` FOREIGN KEY (`navigation_menu_id`) REFERENCES `navigation_menus` (`navigation_menu_id`) ON DELETE CASCADE,
  CONSTRAINT `navigation_menu_item_assignments_navigation_menu_item_id_foreign` FOREIGN KEY (`navigation_menu_item_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='Links navigation menu items to navigation menus.';
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
  `setting_value` longtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`navigation_menu_item_setting_id`),
  UNIQUE KEY `navigation_menu_item_settings_unique` (`navigation_menu_item_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_settings_navigation_menu_item_id` (`navigation_menu_item_id`),
  CONSTRAINT `navigation_menu_item_settings_navigation_menu_id` FOREIGN KEY (`navigation_menu_item_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='More data about navigation menu items, including localized content such as names.';
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='Navigation menu items are single elements within a navigation menu.';
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Navigation menus on the website are installed with the software as a default set, and can be customized.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about which submissions in the press are considered new releases.';
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
  `contents` text,
  PRIMARY KEY (`note_id`),
  KEY `notes_user_id` (`user_id`),
  KEY `notes_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Notes allow users to annotate associated entities, such as submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,1048586,1,6,'2023-03-28 23:35:10','2023-03-28 23:35:10','Editor Recommendation','<p>Dear Daniel Barnes, David Buskins,</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission The Information Literacy User’s Guide.</p><p>My recommendation is: Accept Submission.</p><p>Please visit the submission\'s <a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>Minoti Inoue</p>');
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='More data about notifications, including localized properties.';
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='Which email notifications a user has chosen to unsubscribe from.';
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
) ENGINE=InnoDB AUTO_INCREMENT=344 DEFAULT CHARSET=utf8 COMMENT='User notifications created during certain operations.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (14,1,4,2,16777217,'2023-03-28 23:22:53',NULL,1048585,1),(15,1,NULL,2,16777236,'2023-03-28 23:23:08','2023-03-28 23:23:13',523,1),(16,1,12,3,16777227,'2023-03-28 23:23:19',NULL,517,1),(18,1,19,2,16777230,'2023-03-28 23:23:25',NULL,1048585,1),(19,1,4,2,16777251,'2023-03-28 23:23:25',NULL,1048585,1),(29,1,NULL,3,16777220,'2023-03-28 23:26:00',NULL,1048585,2),(30,1,NULL,3,16777222,'2023-03-28 23:26:00',NULL,1048585,2),(31,1,NULL,3,16777223,'2023-03-28 23:26:00',NULL,1048585,2),(32,1,NULL,3,16777224,'2023-03-28 23:26:00',NULL,1048585,2),(33,1,1,3,16777247,'2023-03-28 23:26:00',NULL,1048585,2),(34,1,2,3,16777247,'2023-03-28 23:26:00',NULL,1048585,2),(35,1,3,3,16777247,'2023-03-28 23:26:00',NULL,1048585,2),(36,1,NULL,2,16777236,'2023-03-28 23:26:30','2023-03-28 23:26:39',523,2),(37,1,11,3,16777227,'2023-03-28 23:26:46',NULL,517,2),(39,1,12,3,16777227,'2023-03-28 23:26:56',NULL,517,3),(51,1,NULL,3,16777220,'2023-03-28 23:27:53',NULL,1048585,3),(52,1,NULL,3,16777222,'2023-03-28 23:27:53',NULL,1048585,3),(53,1,NULL,3,16777223,'2023-03-28 23:27:53',NULL,1048585,3),(54,1,NULL,3,16777224,'2023-03-28 23:27:53',NULL,1048585,3),(55,1,1,3,16777247,'2023-03-28 23:27:53',NULL,1048585,3),(56,1,2,3,16777247,'2023-03-28 23:27:53',NULL,1048585,3),(57,1,3,3,16777247,'2023-03-28 23:27:53',NULL,1048585,3),(66,1,3,2,16777217,'2023-03-28 23:28:42',NULL,1048585,4),(67,1,NULL,2,16777236,'2023-03-28 23:28:57','2023-03-28 23:29:03',523,3),(69,1,9,3,16777227,'2023-03-28 23:29:09',NULL,517,4),(71,1,NULL,2,16777236,'2023-03-28 23:29:15','2023-03-28 23:29:21',523,4),(73,1,11,3,16777227,'2023-03-28 23:29:27',NULL,517,5),(78,1,22,2,16777235,'2023-03-28 23:29:53',NULL,1048585,4),(79,1,3,2,16777254,'2023-03-28 23:29:53',NULL,1048585,4),(93,1,NULL,3,16777220,'2023-03-28 23:31:16',NULL,1048585,5),(94,1,NULL,3,16777222,'2023-03-28 23:31:16',NULL,1048585,5),(95,1,NULL,3,16777223,'2023-03-28 23:31:16',NULL,1048585,5),(96,1,NULL,3,16777224,'2023-03-28 23:31:16',NULL,1048585,5),(97,1,1,3,16777247,'2023-03-28 23:31:16',NULL,1048585,5),(98,1,2,3,16777247,'2023-03-28 23:31:16',NULL,1048585,5),(99,1,3,3,16777247,'2023-03-28 23:31:16',NULL,1048585,5),(100,1,NULL,2,16777236,'2023-03-28 23:31:34','2023-03-28 23:31:41',523,5),(102,1,8,3,16777227,'2023-03-28 23:31:46',NULL,517,6),(104,1,NULL,2,16777236,'2023-03-28 23:31:53','2023-03-28 23:31:59',523,6),(106,1,12,3,16777227,'2023-03-28 23:32:05',NULL,517,7),(110,1,23,2,16777235,'2023-03-28 23:32:32',NULL,1048585,5),(113,1,NULL,2,16777246,'2023-03-28 23:33:15','2023-03-28 23:33:25',1048585,5),(122,1,4,2,16777217,'2023-03-28 23:34:22',NULL,1048585,6),(123,1,NULL,2,16777236,'2023-03-28 23:34:38','2023-03-28 23:34:43',523,7),(124,1,24,2,16777229,'2023-03-28 23:34:38',NULL,1048585,6),(127,1,3,3,16777249,'2023-03-28 23:35:10',NULL,1048586,1),(128,1,4,3,16777249,'2023-03-28 23:35:10',NULL,1048586,1),(139,1,3,2,16777217,'2023-03-28 23:36:22',NULL,1048585,7),(140,1,NULL,2,16777236,'2023-03-28 23:36:39','2023-03-28 23:36:45',523,8),(141,1,10,3,16777227,'2023-03-28 23:36:51',NULL,517,8),(143,1,25,2,16777230,'2023-03-28 23:36:59',NULL,1048585,7),(144,1,3,2,16777251,'2023-03-28 23:36:59','2023-03-28 23:37:05',1048585,7),(146,1,1,3,16777247,'2023-03-28 23:37:26',NULL,1048585,8),(147,1,2,3,16777247,'2023-03-28 23:37:26',NULL,1048585,8),(148,1,3,3,16777247,'2023-03-28 23:37:26',NULL,1048585,8),(159,1,4,2,16777217,'2023-03-28 23:38:23',NULL,1048585,9),(160,1,NULL,2,16777236,'2023-03-28 23:38:40','2023-03-28 23:38:47',523,9),(161,1,26,2,16777229,'2023-03-28 23:38:41',NULL,1048585,9),(180,1,NULL,3,16777220,'2023-03-28 23:40:28',NULL,1048585,10),(181,1,NULL,3,16777222,'2023-03-28 23:40:28',NULL,1048585,10),(182,1,NULL,3,16777223,'2023-03-28 23:40:28',NULL,1048585,10),(183,1,NULL,3,16777224,'2023-03-28 23:40:28',NULL,1048585,10),(184,1,1,3,16777247,'2023-03-28 23:40:28',NULL,1048585,10),(185,1,2,3,16777247,'2023-03-28 23:40:28',NULL,1048585,10),(186,1,3,3,16777247,'2023-03-28 23:40:28',NULL,1048585,10),(191,1,NULL,3,16777220,'2023-03-28 23:40:56',NULL,1048585,11),(192,1,NULL,3,16777222,'2023-03-28 23:40:56',NULL,1048585,11),(193,1,NULL,3,16777223,'2023-03-28 23:40:56',NULL,1048585,11),(194,1,NULL,3,16777224,'2023-03-28 23:40:56',NULL,1048585,11),(195,1,1,3,16777247,'2023-03-28 23:40:56',NULL,1048585,11),(196,1,2,3,16777247,'2023-03-28 23:40:56',NULL,1048585,11),(197,1,3,3,16777247,'2023-03-28 23:40:56',NULL,1048585,11),(198,1,NULL,2,16777236,'2023-03-28 23:41:11','2023-03-28 23:41:15',523,10),(200,1,9,3,16777227,'2023-03-28 23:41:21',NULL,517,9),(202,1,NULL,2,16777236,'2023-03-28 23:41:26','2023-03-28 23:41:31',523,11),(208,1,28,2,16777230,'2023-03-28 23:42:29',NULL,1048585,11),(215,1,NULL,3,16777220,'2023-03-28 23:43:14',NULL,1048585,12),(216,1,NULL,3,16777222,'2023-03-28 23:43:14',NULL,1048585,12),(217,1,NULL,3,16777223,'2023-03-28 23:43:14',NULL,1048585,12),(218,1,NULL,3,16777224,'2023-03-28 23:43:14',NULL,1048585,12),(219,1,1,3,16777247,'2023-03-28 23:43:14',NULL,1048585,12),(220,1,2,3,16777247,'2023-03-28 23:43:14',NULL,1048585,12),(221,1,3,3,16777247,'2023-03-28 23:43:14',NULL,1048585,12),(222,1,NULL,2,16777236,'2023-03-28 23:43:30','2023-03-28 23:43:36',523,12),(223,1,29,2,16777229,'2023-03-28 23:43:31',NULL,1048585,12),(224,1,7,3,16777227,'2023-03-28 23:43:41',NULL,517,12),(228,1,9,3,16777227,'2023-03-28 23:43:57',NULL,517,14),(236,1,NULL,3,16777220,'2023-03-28 23:44:45',NULL,1048585,13),(237,1,NULL,3,16777222,'2023-03-28 23:44:45',NULL,1048585,13),(238,1,NULL,3,16777223,'2023-03-28 23:44:45',NULL,1048585,13),(239,1,NULL,3,16777224,'2023-03-28 23:44:45',NULL,1048585,13),(240,1,1,3,16777247,'2023-03-28 23:44:45',NULL,1048585,13),(241,1,2,3,16777247,'2023-03-28 23:44:45',NULL,1048585,13),(242,1,3,3,16777247,'2023-03-28 23:44:45',NULL,1048585,13),(243,1,NULL,2,16777236,'2023-03-28 23:45:00','2023-03-28 23:45:05',523,13),(245,1,8,3,16777227,'2023-03-28 23:45:10',NULL,517,15),(247,1,NULL,2,16777236,'2023-03-28 23:45:16','2023-03-28 23:45:20',523,14),(251,1,11,3,16777227,'2023-03-28 23:45:33',NULL,517,17),(255,1,30,2,16777230,'2023-03-28 23:46:26',NULL,1048585,13),(264,1,3,2,16777217,'2023-03-28 23:47:18',NULL,1048585,14),(265,1,NULL,2,16777236,'2023-03-28 23:47:35','2023-03-28 23:47:40',523,15),(267,1,7,3,16777227,'2023-03-28 23:47:46',NULL,517,19),(269,1,NULL,2,16777236,'2023-03-28 23:47:52','2023-03-28 23:47:57',523,16),(271,1,11,3,16777227,'2023-03-28 23:48:02',NULL,517,20),(276,1,31,2,16777235,'2023-03-28 23:48:26',NULL,1048585,14),(277,1,3,2,16777254,'2023-03-28 23:48:26',NULL,1048585,14),(280,1,NULL,2,16777246,'2023-03-28 23:49:38',NULL,1048585,14),(287,1,NULL,3,16777220,'2023-03-28 23:50:13',NULL,1048585,15),(288,1,NULL,3,16777222,'2023-03-28 23:50:13',NULL,1048585,15),(289,1,NULL,3,16777223,'2023-03-28 23:50:13',NULL,1048585,15),(290,1,NULL,3,16777224,'2023-03-28 23:50:13',NULL,1048585,15),(291,1,1,3,16777247,'2023-03-28 23:50:13',NULL,1048585,15),(292,1,2,3,16777247,'2023-03-28 23:50:13',NULL,1048585,15),(293,1,3,3,16777247,'2023-03-28 23:50:13',NULL,1048585,15),(294,1,NULL,2,16777236,'2023-03-28 23:50:28','2023-03-28 23:50:33',523,17),(305,1,NULL,3,16777220,'2023-03-28 23:51:22',NULL,1048585,16),(306,1,NULL,3,16777222,'2023-03-28 23:51:22',NULL,1048585,16),(307,1,NULL,3,16777223,'2023-03-28 23:51:22',NULL,1048585,16),(308,1,NULL,3,16777224,'2023-03-28 23:51:22',NULL,1048585,16),(309,1,1,3,16777247,'2023-03-28 23:51:22',NULL,1048585,16),(310,1,2,3,16777247,'2023-03-28 23:51:22',NULL,1048585,16),(311,1,3,3,16777247,'2023-03-28 23:51:22',NULL,1048585,16),(312,1,NULL,2,16777236,'2023-03-28 23:51:39','2023-03-28 23:51:44',523,18),(315,1,11,3,16777227,'2023-03-28 23:51:58',NULL,517,22),(317,1,12,3,16777227,'2023-03-28 23:52:06',NULL,517,23),(331,1,NULL,3,16777220,'2023-03-28 23:53:25',NULL,1048585,17),(332,1,NULL,3,16777222,'2023-03-28 23:53:25',NULL,1048585,17),(333,1,NULL,3,16777223,'2023-03-28 23:53:25',NULL,1048585,17),(334,1,NULL,3,16777224,'2023-03-28 23:53:25',NULL,1048585,17),(335,1,1,3,16777247,'2023-03-28 23:53:25',NULL,1048585,17),(336,1,2,3,16777247,'2023-03-28 23:53:25',NULL,1048585,17),(337,1,3,3,16777247,'2023-03-28 23:53:25',NULL,1048585,17),(338,1,NULL,2,16777236,'2023-03-28 23:53:44','2023-03-28 23:53:50',523,19),(339,1,34,2,16777229,'2023-03-28 23:53:44',NULL,1048585,17),(340,1,7,3,16777227,'2023-03-28 23:53:56',NULL,517,24),(342,1,8,3,16777227,'2023-03-28 23:54:04',NULL,517,25);
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
  `params` text,
  PRIMARY KEY (`oai_resumption_token_id`),
  UNIQUE KEY `oai_resumption_tokens_unique` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAI resumption tokens are used to allow for pagination of large result sets into manageable pieces.';
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
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`plugin_setting_id`),
  UNIQUE KEY `plugin_settings_unique` (`plugin_name`,`context_id`,`setting_name`),
  KEY `plugin_settings_plugin_name` (`plugin_name`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='More data about plugins, including localized properties. This table is frequently used to store plugin-specific configuration.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_settings`
--

LOCK TABLES `plugin_settings` WRITE;
/*!40000 ALTER TABLE `plugin_settings` DISABLE KEYS */;
INSERT INTO `plugin_settings` VALUES (1,'usageeventplugin',0,'enabled','1','bool'),(2,'usageeventplugin',0,'uniqueSiteId','','string'),(3,'acronplugin',0,'enabled','1','bool'),(4,'acronplugin',0,'crontab','[{\"className\":\"PKP\\\\task\\\\ReviewReminder\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\PublishSubmissions\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\RemoveUnvalidatedExpiredUsers\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\UpdateIPGeoDB\",\"frequency\":{\"day\":\"10\"},\"args\":[]},{\"className\":\"APP\\\\tasks\\\\UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\EditorialReminders\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\ProcessQueueJobs\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\RemoveFailedJobs\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]','object'),(5,'defaultthemeplugin',0,'enabled','1','bool'),(6,'tinymceplugin',0,'enabled','1','bool'),(7,'developedbyblockplugin',0,'enabled','0','bool'),(8,'developedbyblockplugin',0,'seq','0','int'),(9,'developedbyblockplugin',0,'context','1','int'),(10,'languagetoggleblockplugin',0,'enabled','1','bool'),(11,'languagetoggleblockplugin',0,'seq','4','int'),(12,'languagetoggleblockplugin',0,'context','1','int'),(13,'tinymceplugin',1,'enabled','1','bool'),(14,'defaultthemeplugin',1,'enabled','1','bool'),(15,'browseblockplugin',1,'enabled','1','bool'),(16,'browseblockplugin',1,'seq','1','int'),(17,'browseblockplugin',1,'context','1','int'),(18,'browseblockplugin',1,'browseNewReleases','1','bool'),(19,'browseblockplugin',1,'browseCategories','1','bool'),(20,'browseblockplugin',1,'browseSeries','1','bool'),(21,'developedbyblockplugin',1,'enabled','0','bool'),(22,'developedbyblockplugin',1,'seq','0','int'),(23,'developedbyblockplugin',1,'context','1','int'),(24,'languagetoggleblockplugin',1,'enabled','1','bool'),(25,'languagetoggleblockplugin',1,'seq','4','int'),(26,'languagetoggleblockplugin',1,'context','1','int'),(27,'informationblockplugin',1,'enabled','1','bool'),(28,'informationblockplugin',1,'seq','7','int'),(29,'informationblockplugin',1,'context','1','int'),(30,'googlescholarplugin',1,'enabled','1','bool'),(31,'dublincoremetaplugin',1,'enabled','1','bool'),(32,'pdfjsviewerplugin',1,'enabled','1','bool'),(33,'webfeedplugin',1,'enabled','1','bool'),(34,'webfeedplugin',1,'displayPage','homepage','string'),(35,'webfeedplugin',1,'displayItems','1','bool'),(36,'webfeedplugin',1,'recentItems','30','int'),(37,'webfeedplugin',1,'includeIdentifiers','0','bool'),(38,'htmlmonographfileplugin',1,'enabled','1','bool'),(39,'defaultthemeplugin',1,'typography','notoSans','string'),(40,'defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),(41,'defaultthemeplugin',1,'baseColour','#1E6292','string'),(42,'defaultthemeplugin',1,'showCatalogSeriesListing','false','string'),(43,'defaultthemeplugin',1,'displayStats','none','string');
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
  `setting_value` text,
  `setting_type` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`press_setting_id`),
  UNIQUE KEY `press_settings_unique` (`press_id`,`locale`,`setting_name`),
  KEY `press_settings_press_id` (`press_id`),
  CONSTRAINT `press_settings_press_id_foreign` FOREIGN KEY (`press_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='More data about presses, including localized properties such as policies.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `press_settings`
--

LOCK TABLES `press_settings` WRITE;
/*!40000 ALTER TABLE `press_settings` DISABLE KEYS */;
INSERT INTO `press_settings` VALUES (1,1,'en','acronym','JPK',NULL),(3,1,'en','authorGuidelines','<p>Authors are invited to make a submission to this press. Those submissions considered to be a good fit will be sent for peer review before determining whether they will be accepted or rejected.</p><p>Before making a submission, authors are responsible for obtaining permission to publish any material included with the submission, such as photos, documents and datasets. All authors identified on the submission must consent to be identified as an author. Where appropriate, research should be approved by an appropriate ethics committee in accordance with the legal requirements of the study\'s country.</p><p>An editor may desk reject a submission if it does not meet minimum standards of quality. Before submitting, please ensure that the scope and outline of the book are structured and articulated properly. The title should be concise and the abstract should be able to stand on its own. This will increase the likelihood of reviewers agreeing to review the book. When you\'re satisfied that your submission meets this standard, please follow the checklist below to prepare your submission.</p>',NULL),(4,1,'fr_CA','authorGuidelines','##default.contextSettings.authorGuidelines##',NULL),(5,1,'en','authorInformation','Interested in submitting to this press? We recommend that you review the <a href=\"http://localhost/index.php/publicknowledge/about\">About the Press</a> page for the press\' section policies and <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.php/publicknowledge/user/register\">register</a> with the press prior to submitting, or if already registered can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the 5 step process.',NULL),(6,1,'fr_CA','authorInformation','Vous souhaitez soumettre une contribution à cette presse ? Nous vous recommandons de lire la page\n <a href=\"http://localhost/index.php/publicknowledge/about\">À propos de cette presse</a> pour connaitre ses règlements et la page\n <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Lignes directrices à l\'intention des auteurs-es</a>. Les auteurs-es doivent <a href=\"http://localhost/index.php/publicknowledge/user/register\">s\'inscrire</a> auprès de la presse avant d\'envoyer une soumission. Si vous êtes déjà inscrit-e, il suffit simplement <a href=\"http://localhost/index.php/index/login\">d\'ouvrir une session</a> pour débuter la procédure en 5 étapes.',NULL),(7,1,'en','beginSubmissionHelp','<p>Thank you for submitting to the Public Knowledge Press. You will be asked to upload files, identify co-authors, and provide information such as the title and abstract.<p><p>Please read our <a href=\"http://localhost/index.php/publicknowledge/about/submissions\" target=\"_blank\">Submission Guidelines</a> if you have not done so already. When filling out the forms, provide as many details as possible in order to help our editors evaluate your work.</p><p>Once you begin, you can save your submission and come back to it later. You will be able to review and correct any information before you submit.</p>',NULL),(8,1,'fr_CA','beginSubmissionHelp','##default.submission.step.beforeYouBegin##',NULL),(9,1,'','contactEmail','rvaca@mailinator.com',NULL),(10,1,'','contactName','Ramiro Vaca',NULL),(11,1,'en','contributorsHelp','<p>Add details for all of the contributors to this submission. Contributors added here will be sent an email confirmation of the submission, as well as a copy of all editorial decisions recorded against this submission.</p><p>If a contributor can not be contacted by email, because they must remain anonymous or do not have an email account, please do not enter a fake email address. You can add information about this contributor in a message to the editor at a later step in the submission process.</p>',NULL),(12,1,'fr_CA','contributorsHelp','##default.submission.step.contributors##',NULL),(13,1,'','country','IS',NULL),(14,1,'','defaultReviewMode','2',NULL),(15,1,'en','description','<p>Public Knowledge Press is a publisher dedicated to the subject of public access to science.</p>',NULL),(16,1,'fr_CA','description','<p>Le Press de Public Knowledge est une presse sur le thème de l\'accès du public à la science.</p>',NULL),(17,1,'en','detailsHelp','<p>Please provide the following details to help us manage your submission in our system.</p>',NULL),(18,1,'fr_CA','detailsHelp','##default.submission.step.details##',NULL),(19,1,'','emailSignature','<br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>',NULL),(20,1,'','enableDois','1',NULL),(21,1,'','doiSuffixType','default',NULL),(22,1,'','registrationAgency','',NULL),(23,1,'','disableSubmissions','0',NULL),(24,1,'','editorialStatsEmail','1',NULL),(25,1,'en','forTheEditorsHelp','<p>Please provide the following details in order to help our editorial team manage your submission.</p><p>When entering metadata, provide entries that you think would be most helpful to the person managing your submission. This information can be changed before publication.</p>',NULL),(26,1,'fr_CA','forTheEditorsHelp','##default.submission.step.forTheEditors##',NULL),(27,1,'','itemsPerPage','25',NULL),(28,1,'','keywords','request',NULL),(29,1,'en','librarianInformation','We encourage research librarians to list this press among their library\'s electronic press holdings. As well, this open source publishing system is suitable for libraries to host for their faculty members to use with presses they are involved in editing (see <a href=\"https://pkp.sfu.ca/omp\">Open Monograph Press</a>).',NULL),(30,1,'fr_CA','librarianInformation','Nous encourageons les bibliothécaires de recherche à ajouter cette presse à la liste électronique des ressources documentaires de la bibliothèque. De plus, ce système d\'édition à libre accès convient à toutes les bibliothèques et permet aux membres des facultés de l\'utiliser pour les presses auxquelles ils contribuent à titre de rédacteur en chef. (voir <a href=\"http://pkp.sfu.ca/omp\">Open Monograph Press</a>).',NULL),(31,1,'en','name','Public Knowledge Press',NULL),(32,1,'fr_CA','name','Press de la connaissance du public',NULL),(33,1,'','notifyAllAuthors','1',NULL),(34,1,'','numPageLinks','10',NULL),(35,1,'','numWeeksPerResponse','4',NULL),(36,1,'','numWeeksPerReview','4',NULL),(37,1,'en','openAccessPolicy','This press provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),(38,1,'fr_CA','openAccessPolicy','Cette presse offre un accès libre immédiat à son contenu en partant du principe que la recherche doit être accessible au grand public, car cela favorise un meilleur échange des connaissances à l\'échelle mondiale.',NULL),(39,1,'en','privacyStatement','<p>The names and email addresses entered in this press site will be used exclusively for the stated purposes of this press and will not be made available for any other purpose or to any other party.</p>',NULL),(40,1,'fr_CA','privacyStatement','<p>Les noms et adresses courriel saisis sur ce site de presse seront utilisés exclusivement pour les fins convenues de cette presse. Ils ne seront pas utilisés pour d\'autres fins ou transmis à une tierce partie.</p>',NULL),(41,1,'en','readerInformation','We encourage readers to sign up for the publishing notification service for this press. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the homepage for the press. This registration will result in the reader receiving the Table of Contents by email for each new monograph of the press. This list also allows the press to claim a certain level of support or readership. See the press <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a> which assures readers that their name and email address will not be used for other purposes.',NULL),(42,1,'fr_CA','readerInformation','Nous encourageons les lecteurs à s\'abonner au service d\'avis de publication de cette presse. Utilisez le lien <a href=\"http://localhost/index.php/publicknowledge/user/register\">d\'inscription</a> situé en haut de la page d\'accueil de la presse. Cette inscription permettra au lecteur de recevoir la table des matières de chaque nouvelle monographie de cette presse par courriel. Cette liste permet également à la presse d\'affirmer qu\'elle compte un certain nombre de lecteurs. Consultez <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">l\'énoncé de confidentialité </a> de la presse, lequel stipule que les noms et adresses courriel de ses lecteurs ne seront pas utilisés à d\'autres fins.',NULL),(43,1,'en','reviewHelp','<p>Review the information you have entered before you complete your submission. You can change any of the details displayed here by clicking the edit button at the top of each section.</p><p>Once you complete your submission, a member of our editorial team will be assigned to review it. Please ensure the details you have entered here are as accurate as possible.</p>',NULL),(44,1,'fr_CA','reviewHelp','##default.submission.step.review##',NULL),(45,1,'','submissionAcknowledgement','allAuthors',NULL),(46,1,'en','submissionChecklist','<p>All submissions must meet the following requirements.</p><ul><li>This submission meets the requirements outlined in the <a href=\"http://localhost/index.php/publicknowledge/about/submissions\">Author Guidelines</a>.</li><li>This submission has not been previously published, nor is it before another press for consideration.</li><li>All references have been checked for accuracy and completeness.</li><li>All tables and figures have been numbered and labeled.</li><li>Permission has been obtained to publish all photos, datasets and other material provided with this submission.</li></ul>',NULL),(47,1,'fr_CA','submissionChecklist','##default.contextSettings.checklist##',NULL),(48,1,'','submitWithCategories','0',NULL),(49,1,'','supportedFormLocales','[\"en\",\"fr_CA\"]',NULL),(50,1,'','supportedLocales','[\"en\",\"fr_CA\"]',NULL),(51,1,'','supportedSubmissionLocales','[\"en\",\"fr_CA\"]',NULL),(52,1,'','themePluginPath','default',NULL),(53,1,'','type','enable',NULL),(54,1,'en','uploadFilesHelp','<p>Provide any files our editorial team may need to evaluate your submission. In addition to the main work, you may wish to submit data sets, conflict of interest statements, or other supplementary files if these will be helpful for our editors.</p>',NULL),(55,1,'fr_CA','uploadFilesHelp','##default.submission.step.uploadFiles##',NULL),(56,1,'','enableGeoUsageStats','disabled',NULL),(57,1,'','enableInstitutionUsageStats','0',NULL),(58,1,'','isSushiApiPublic','1',NULL),(59,1,'','coverThumbnailsMaxWidth','106',NULL),(60,1,'','coverThumbnailsMaxHeight','100',NULL),(61,1,'','enabledDoiTypes','[\"publication\"]',NULL),(62,1,'','doiCreationTime','copyEditCreationTime',NULL),(63,1,'','paymentPluginName','ManualPayment',NULL),(64,1,'','doiVersioning','0',NULL),(65,1,'en','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">',NULL),(66,1,'en','searchDescription','Public Knowledge Press is a publisher dedicated to the subject of public access to science.',NULL),(67,1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada',NULL),(68,1,'','supportEmail','rvaca@mailinator.com',NULL),(69,1,'','supportName','Ramiro Vaca',NULL);
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
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  `primary_locale` varchar(14) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`press_id`),
  UNIQUE KEY `press_path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='A list of presses managed by the system.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Associates publications (and thus submissions) with categories.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ONIX publication dates for publication formats.';
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
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`publication_format_setting_id`),
  UNIQUE KEY `publication_format_settings_unique` (`publication_format_id`,`locale`,`setting_name`),
  KEY `publication_format_id_key` (`publication_format_id`),
  CONSTRAINT `publication_format_settings_publication_format_id` FOREIGN KEY (`publication_format_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='More data about publication formats, including localized properties.';
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
  `submission_id` bigint(20) DEFAULT NULL,
  `physical_format` smallint(6) DEFAULT '1',
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
  `is_approved` smallint(6) NOT NULL DEFAULT '0',
  `is_available` smallint(6) NOT NULL DEFAULT '0',
  `doi_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`publication_format_id`),
  KEY `publication_formats_publication_id` (`publication_id`),
  KEY `publication_format_submission_id` (`submission_id`),
  KEY `publication_formats_doi_id` (`doi_id`),
  CONSTRAINT `publication_formats_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `publication_formats_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Publication formats are representations of a publication in a particular format, e.g. PDF, hardcover, etc. Each publication format may contain many chapters.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_formats`
--

LOCK TABLES `publication_formats` WRITE;
/*!40000 ALTER TABLE `publication_formats` DISABLE KEYS */;
INSERT INTO `publication_formats` VALUES (1,4,NULL,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'https://file-examples-com.github.io/uploads/2017/10/file-sample_150kB.pdf','',0,0,NULL),(2,5,NULL,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',1,1,NULL),(3,14,NULL,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',1,1,NULL);
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
  `setting_value` mediumtext,
  PRIMARY KEY (`publication_setting_id`),
  UNIQUE KEY `publication_settings_unique` (`publication_id`,`locale`,`setting_name`),
  KEY `publication_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `publication_settings_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='More data about publications, including localized properties such as the title and abstract.';
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
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  `series_id` bigint(20) DEFAULT NULL,
  `series_position` varchar(255) DEFAULT NULL,
  `submission_id` bigint(20) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='Each publication is one version of a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,NULL,'2023-03-28 23:22:28',1,'pub','publication',0.00,1,NULL,1,1,NULL,1,NULL),(2,NULL,'2023-03-28 23:24:00',2,'pub','publication',0.00,NULL,NULL,2,1,NULL,1,NULL),(3,NULL,'2023-03-28 23:27:08',11,'pub','publication',0.00,NULL,NULL,3,1,NULL,1,NULL),(4,NULL,'2023-03-28 23:28:04',12,'pub','publication',0.00,3,NULL,4,1,NULL,1,NULL),(5,'2023-03-28','2023-03-28 23:33:36',16,'pub','publication',0.00,NULL,NULL,5,3,NULL,1,NULL),(6,NULL,'2023-03-28 23:33:46',17,'pub','publication',0.00,1,NULL,6,1,NULL,1,NULL),(7,NULL,'2023-03-28 23:35:35',21,'pub','publication',0.00,4,NULL,7,1,NULL,1,NULL),(8,NULL,'2023-03-28 23:37:22',NULL,'pub','publication',0.00,NULL,NULL,8,1,NULL,1,NULL),(9,NULL,'2023-03-28 23:37:35',26,'pub','publication',0.00,1,NULL,9,1,NULL,1,NULL),(10,NULL,'2023-03-28 23:38:56',31,'pub','publication',0.00,NULL,NULL,10,1,NULL,1,NULL),(11,NULL,'2023-03-28 23:40:39',32,'pub','publication',0.00,NULL,NULL,11,1,NULL,1,NULL),(12,NULL,'2023-03-28 23:42:44',33,'pub','publication',0.00,NULL,NULL,12,1,NULL,1,NULL),(13,NULL,'2023-03-28 23:44:19',41,'pub','publication',0.00,NULL,NULL,13,1,NULL,1,NULL),(14,'2023-03-28','2023-03-28 23:49:38',45,'pub','publication',0.00,5,NULL,14,3,NULL,1,NULL),(15,NULL,'2023-03-28 23:49:49',48,'pub','publication',0.00,NULL,NULL,15,1,NULL,1,NULL),(16,NULL,'2023-03-28 23:50:41',49,'pub','publication',0.00,NULL,NULL,16,1,NULL,1,NULL),(17,NULL,'2023-03-28 23:52:30',50,'pub','publication',0.00,NULL,NULL,17,1,NULL,1,NULL);
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
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `closed` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`query_id`),
  KEY `queries_assoc_id` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Discussions, usually related to a submission, created by editors, authors and other editorial staff.';
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='The users assigned to a discussion.';
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
  `payment_data` text,
  PRIMARY KEY (`queued_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A list of queued (unfilled) payments, i.e. payments that have not yet been completed via an online payment system.';
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
  `is_supplier` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`representative_id`),
  KEY `representatives_submission_id` (`submission_id`),
  KEY `format_representatives_pkey` (`representative_id`,`submission_id`),
  CONSTRAINT `representatives_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ONIX representatives for publication formats.';
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
  `competing_interests` text,
  `recommendation` smallint(6) DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` smallint(6) NOT NULL DEFAULT '0',
  `declined` smallint(6) NOT NULL DEFAULT '0',
  `cancelled` smallint(6) NOT NULL DEFAULT '0',
  `reviewer_file_id` bigint(20) DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` smallint(6) DEFAULT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `review_method` smallint(6) NOT NULL DEFAULT '1',
  `round` smallint(6) NOT NULL DEFAULT '1',
  `step` smallint(6) NOT NULL DEFAULT '1',
  `review_form_id` bigint(20) DEFAULT NULL,
  `considered` smallint(6) DEFAULT NULL,
  `request_resent` smallint(6) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='Data about peer review assignments for all submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignments`
--

LOCK TABLES `review_assignments` WRITE;
/*!40000 ALTER TABLE `review_assignments` DISABLE KEYS */;
INSERT INTO `review_assignments` VALUES (1,1,12,NULL,NULL,'2023-03-28 23:23:19','2023-03-28 23:23:19',NULL,NULL,NULL,'2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:23:19',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,0,NULL,0,0),(2,2,11,NULL,NULL,'2023-03-28 23:26:46','2023-03-28 23:26:46',NULL,NULL,NULL,'2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:26:46',0,0,0,NULL,NULL,NULL,NULL,2,3,1,1,0,NULL,0,0),(3,2,12,NULL,NULL,'2023-03-28 23:26:56','2023-03-28 23:26:56',NULL,NULL,NULL,'2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:26:56',0,0,0,NULL,NULL,NULL,NULL,2,3,2,1,0,NULL,0,0),(4,4,9,NULL,NULL,'2023-03-28 23:29:09','2023-03-28 23:29:09',NULL,NULL,NULL,'2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:29:09',0,0,0,NULL,NULL,NULL,NULL,3,2,2,1,0,NULL,0,0),(5,4,11,NULL,NULL,'2023-03-28 23:29:27','2023-03-28 23:29:27',NULL,NULL,NULL,'2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:29:27',0,0,0,NULL,NULL,NULL,NULL,4,3,2,1,0,NULL,0,0),(6,5,8,NULL,NULL,'2023-03-28 23:31:46','2023-03-28 23:31:46',NULL,NULL,NULL,'2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:31:46',0,0,0,NULL,NULL,NULL,NULL,5,2,2,1,0,NULL,0,0),(7,5,12,NULL,NULL,'2023-03-28 23:32:05','2023-03-28 23:32:05',NULL,NULL,NULL,'2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:32:05',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,0,NULL,0,0),(8,7,10,NULL,NULL,'2023-03-28 23:36:51','2023-03-28 23:36:51',NULL,NULL,NULL,'2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:36:51',0,0,0,NULL,NULL,NULL,NULL,8,3,2,1,0,NULL,0,0),(9,11,9,NULL,NULL,'2023-03-28 23:41:21','2023-03-28 23:41:21',NULL,NULL,NULL,'2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:41:21',0,0,0,NULL,NULL,NULL,NULL,10,2,2,1,0,NULL,0,0),(10,11,10,NULL,0,'2023-03-28 23:41:36','2023-03-28 23:41:36','2023-03-28 23:41:51','2023-03-28 23:41:57','2023-03-28 23:42:29','2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:42:29',0,0,0,NULL,NULL,NULL,NULL,11,3,2,1,4,NULL,0,0),(11,11,12,NULL,0,'2023-03-28 23:41:44','2023-03-28 23:41:44','2023-03-28 23:42:04','2023-03-28 23:42:09','2023-03-28 23:42:29','2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:42:29',0,0,0,NULL,NULL,NULL,NULL,11,3,2,1,4,NULL,0,0),(12,12,7,NULL,NULL,'2023-03-28 23:43:41','2023-03-28 23:43:41',NULL,NULL,NULL,'2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:43:41',0,0,0,NULL,NULL,NULL,NULL,12,2,2,1,0,NULL,0,0),(13,12,8,NULL,0,'2023-03-28 23:43:49','2023-03-28 23:43:49','2023-03-28 23:44:04','2023-03-28 23:44:09',NULL,'2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:44:09',0,0,0,NULL,NULL,NULL,NULL,12,2,2,1,4,NULL,0,0),(14,12,9,NULL,NULL,'2023-03-28 23:43:57','2023-03-28 23:43:57',NULL,NULL,NULL,'2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:43:57',0,0,0,NULL,NULL,NULL,NULL,12,2,2,1,0,NULL,0,0),(15,13,8,NULL,NULL,'2023-03-28 23:45:10','2023-03-28 23:45:10',NULL,NULL,NULL,'2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:45:10',0,0,0,NULL,NULL,NULL,NULL,13,2,2,1,0,NULL,0,0),(16,13,10,NULL,0,'2023-03-28 23:45:26','2023-03-28 23:45:26','2023-03-28 23:45:49','2023-03-28 23:45:54','2023-03-28 23:46:26','2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:46:26',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,4,NULL,0,0),(17,13,11,NULL,NULL,'2023-03-28 23:45:33','2023-03-28 23:45:33',NULL,NULL,NULL,'2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:45:33',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,0,NULL,0,0),(18,13,12,NULL,0,'2023-03-28 23:45:41','2023-03-28 23:45:41','2023-03-28 23:46:01','2023-03-28 23:46:06','2023-03-28 23:46:26','2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:46:26',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,4,NULL,0,0),(19,14,7,NULL,NULL,'2023-03-28 23:47:46','2023-03-28 23:47:46',NULL,NULL,NULL,'2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:47:46',0,0,0,NULL,NULL,NULL,NULL,15,2,2,1,0,NULL,0,0),(20,14,11,NULL,NULL,'2023-03-28 23:48:02','2023-03-28 23:48:02',NULL,NULL,NULL,'2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:48:02',0,0,0,NULL,NULL,NULL,NULL,16,3,2,1,0,NULL,0,0),(21,16,10,NULL,0,'2023-03-28 23:51:50','2023-03-28 23:51:50','2023-03-28 23:52:14','2023-03-28 23:52:19',NULL,'2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:52:19',0,0,0,NULL,NULL,NULL,NULL,18,3,2,1,4,NULL,0,0),(22,16,11,NULL,NULL,'2023-03-28 23:51:58','2023-03-28 23:51:58',NULL,NULL,NULL,'2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:51:58',0,0,0,NULL,NULL,NULL,NULL,18,3,2,1,0,NULL,0,0),(23,16,12,NULL,NULL,'2023-03-28 23:52:06','2023-03-28 23:52:06',NULL,NULL,NULL,'2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:52:06',0,0,0,NULL,NULL,NULL,NULL,18,3,2,1,0,NULL,0,0),(24,17,7,NULL,NULL,'2023-03-28 23:53:56','2023-03-28 23:53:56',NULL,NULL,NULL,'2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:53:56',0,0,0,NULL,NULL,NULL,NULL,19,2,2,1,0,NULL,0,0),(25,17,8,NULL,NULL,'2023-03-28 23:54:04','2023-03-28 23:54:04',NULL,NULL,NULL,'2023-04-25 00:00:00','2023-04-25 00:00:00','2023-03-28 23:54:04',0,0,0,NULL,NULL,NULL,NULL,19,2,2,1,0,NULL,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='A list of the submission files made available to each assigned reviewer.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_files`
--

LOCK TABLES `review_files` WRITE;
/*!40000 ALTER TABLE `review_files` DISABLE KEYS */;
INSERT INTO `review_files` VALUES (2,1,4),(3,1,5),(1,1,6),(7,2,12),(4,2,13),(5,2,14),(6,2,15),(11,3,12),(10,3,13),(8,3,14),(9,3,15),(14,4,25),(15,4,26),(12,4,27),(13,4,28),(16,6,35),(17,6,36),(18,6,37),(19,6,38),(20,6,39),(21,6,40),(25,8,55),(26,8,56),(22,8,57),(23,8,58),(24,8,59),(27,9,82),(28,9,83),(29,12,87),(30,12,88),(31,12,89),(32,13,87),(33,13,88),(34,13,89),(35,14,87),(36,14,88),(37,14,89),(40,15,93),(38,15,94),(39,15,95),(44,19,102),(45,19,103),(46,19,104),(41,19,105),(42,19,106),(43,19,107),(48,21,125),(49,21,126),(50,21,127),(51,21,128),(47,21,129),(53,22,125),(54,22,126),(55,22,127),(56,22,128),(52,22,129),(58,23,125),(59,23,126),(60,23,127),(61,23,128),(57,23,129),(62,24,136),(63,24,137),(64,24,138),(65,24,139),(66,24,140),(67,24,141),(68,25,136),(69,25,137),(70,25,138),(71,25,139),(72,25,140),(73,25,141);
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
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`review_form_element_setting_id`),
  UNIQUE KEY `review_form_element_settings_unique` (`review_form_element_id`,`locale`,`setting_name`),
  KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`),
  CONSTRAINT `review_form_element_settings_review_form_element_id` FOREIGN KEY (`review_form_element_id`) REFERENCES `review_form_elements` (`review_form_element_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about review form elements, including localized content such as question text.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each review form element represents a single question on a review form.';
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
  `response_value` text,
  PRIMARY KEY (`review_form_response_id`),
  KEY `review_form_responses_review_form_element_id` (`review_form_element_id`),
  KEY `review_form_responses_review_id` (`review_id`),
  KEY `review_form_responses_unique` (`review_form_element_id`,`review_id`),
  CONSTRAINT `review_form_responses_review_form_element_id_foreign` FOREIGN KEY (`review_form_element_id`) REFERENCES `review_form_elements` (`review_form_element_id`) ON DELETE CASCADE,
  CONSTRAINT `review_form_responses_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `review_assignments` (`review_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each review form response records a reviewer''s answer to a review form element associated with a peer review.';
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
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`review_form_setting_id`),
  UNIQUE KEY `review_form_settings_unique` (`review_form_id`,`locale`,`setting_name`),
  KEY `review_form_settings_review_form_id` (`review_form_id`),
  CONSTRAINT `review_form_settings_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about review forms, including localized content such as names.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review forms provide custom templates for peer reviews with several types of questions.';
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='Records the files made available to reviewers for a round of reviews. These can be further customized on a per review basis with review_files.';
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='Peer review assignments are organized into multiple rounds on a submission.';
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
  `row_setting` smallint(6) NOT NULL DEFAULT '0',
  `countries_included` text,
  `countries_excluded` text,
  `regions_included` text,
  `regions_excluded` text,
  PRIMARY KEY (`sales_rights_id`),
  KEY `sales_rights_publication_format_id` (`publication_format_id`),
  KEY `format_sales_rights_pkey` (`sales_rights_id`,`publication_format_id`),
  CONSTRAINT `sales_rights_publication_format_id` FOREIGN KEY (`publication_format_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ONIX sales rights for publication formats.';
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='The last time each scheduled task was run.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_tasks`
--

LOCK TABLES `scheduled_tasks` WRITE;
/*!40000 ALTER TABLE `scheduled_tasks` DISABLE KEYS */;
INSERT INTO `scheduled_tasks` VALUES (1,'PKP\\task\\ReviewReminder','2023-03-28 23:17:00'),(2,'PKP\\task\\PublishSubmissions','2023-03-28 23:17:00'),(3,'PKP\\task\\StatisticsReport','2023-03-28 23:17:00'),(4,'PKP\\task\\RemoveUnvalidatedExpiredUsers','2023-03-28 23:17:00'),(5,'PKP\\task\\UpdateIPGeoDB','2023-03-28 23:17:00'),(6,'APP\\tasks\\UsageStatsLoader','2023-03-28 23:17:01'),(7,'PKP\\task\\EditorialReminders','2023-03-28 23:17:01'),(8,'PKP\\task\\ProcessQueueJobs','2023-03-28 23:17:01'),(9,'PKP\\task\\RemoveFailedJobs','2023-03-28 23:17:01');
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
  `seq` double(8,2) DEFAULT '0.00',
  `featured` smallint(6) NOT NULL DEFAULT '0',
  `editor_restricted` smallint(6) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL,
  `image` text,
  `is_inactive` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`series_id`),
  UNIQUE KEY `series_path` (`press_id`,`path`),
  KEY `series_press_id` (`press_id`),
  KEY `series_review_form_id` (`review_form_id`),
  CONSTRAINT `series_press_id` FOREIGN KEY (`press_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `series_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='A list of press series, into which submissions can be organized.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A list of relationships between series and category information.';
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
  `setting_value` text,
  PRIMARY KEY (`series_setting_id`),
  UNIQUE KEY `series_settings_unique` (`series_id`,`locale`,`setting_name`),
  KEY `series_settings_series_id` (`series_id`),
  CONSTRAINT `series_settings_series_id` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='More data about series, including localized properties such as series titles.';
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
  `created` bigint(20) NOT NULL DEFAULT '0',
  `last_used` bigint(20) NOT NULL DEFAULT '0',
  `remember` smallint(6) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  UNIQUE KEY `sessions_pkey` (`session_id`),
  KEY `sessions_user_id` (`user_id`),
  CONSTRAINT `sessions_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Session data for logged-in users.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('0mabvch2mnph038ep3l1hu6v9i',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680046833,1680046857,0,'csrf|a:2:{s:9:\"timestamp\";i:1680046857;s:5:\"token\";s:32:\"da8a702550c781ede81d9e7dc702174a\";}username|s:10:\"jlockehart\";','localhost'),('13dc7i931fp7s80ajdk4iduk1p',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680045775,1680045815,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1680045815;s:5:\"token\";s:32:\"a2d16ced98b062d65ca12a4da3cab468\";}','localhost'),('1402av216k33k5sohpqqtfc3ln',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680046585,1680046631,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1680046631;s:5:\"token\";s:32:\"8072300cc1c366e25cf006ee3b853f0f\";}','localhost'),('1ncoju23t5iehu1vc3202n6313',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680045477,1680045487,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1680045487;s:5:\"token\";s:32:\"31780ed330b1cd177ef529ae90811abd\";}','localhost'),('1scvn1kaf188fp1tbkhdekvddk',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680046649,1680046704,0,'csrf|a:2:{s:9:\"timestamp\";i:1680046704;s:5:\"token\";s:32:\"13ae7d272284418ad9f76697b191881a\";}username|s:7:\"fperini\";','localhost'),('29cem9vb1n6cbmdh9n11b6ceev',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680045419,1680045454,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1680045455;s:5:\"token\";s:32:\"9cf2519f4b7496531fe1ee114aff7674\";}','localhost'),('2e4hfu525m9qa3jt58egmnlfnl',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680046529,1680046584,0,'csrf|a:2:{s:9:\"timestamp\";i:1680046584;s:5:\"token\";s:32:\"7551c32a1afe4f48cc6961ff97d1be72\";}username|s:10:\"dkennepohl\";','localhost'),('3tbkgsv2jc21317qvsm63alnr4',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680045693,1680045715,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1680045715;s:5:\"token\";s:32:\"a0fadde98b834f31d6fe3acd2ddced53\";}','localhost'),('3uhckdk4h2lqg2sp673dqr3aa8',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680046931,1680046955,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1680046955;s:5:\"token\";s:32:\"8ef49e3e5e2906a24537095eae239f53\";}','localhost'),('4p528fqoq2q3f2h9sogpqs4v9r',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680045819,1680045970,0,'csrf|a:2:{s:9:\"timestamp\";i:1680045969;s:5:\"token\";s:32:\"e78d452fb14cd455764cb964fc5619be\";}username|s:7:\"afinkel\";','localhost'),('9g69s9pis22javpc1logq2d7vm',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680047383,1680047414,0,'csrf|a:2:{s:9:\"timestamp\";i:1680047414;s:5:\"token\";s:32:\"6c41a208dd79ecd07966636198c3545b\";}username|s:6:\"mforan\";','localhost'),('9sl3p8ekbqq2lbb2eoneb9b1f4',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680046279,1680046396,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1680046396;s:5:\"token\";s:32:\"f1374819b358f61abee039416667ff1b\";}','localhost'),('a3bkvfggk75en7309uliel80ei',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680045971,1680046017,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1680046016;s:5:\"token\";s:32:\"fdfa643181b2f223a646a4ac628d16a6\";}','localhost'),('a8iko2ms9rs368f5d44qg9ouov',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680046918,1680046930,0,'username|s:6:\"gfavio\";csrf|a:2:{s:9:\"timestamp\";i:1680046930;s:5:\"token\";s:32:\"495319428a0920ac7ed53b72a98173f0\";}','localhost'),('ao02q2h0d21q09cq2emf3v3iv9',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680047415,1680047433,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1680047433;s:5:\"token\";s:32:\"c54b29e6d2a190076a4d2f666775d1c0\";}','localhost'),('b4af8u9i10gqfm7r45rg1kuam3',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680046465,1680046496,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1680046496;s:5:\"token\";s:32:\"7c1e110a69c3c9d017ede304036b1958\";}','localhost'),('bjc43tt7hqrcs77qaq618vbgf7',27,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680046730,1680046829,0,'csrf|a:2:{s:9:\"timestamp\";i:1680046829;s:5:\"token\";s:32:\"69eedc37ded8d951d78ddf0f5e6eff7f\";}username|s:7:\"jbrower\";userId|i:27;','localhost'),('bm92l2gddr96tmtt9amj5r45ip',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680046408,1680046417,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1680046418;s:5:\"token\";s:32:\"1c92626a7e5e380abcb5f9b8586f443f\";}','localhost'),('c8ai9gltfjql93um73fipr2bfq',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680046397,1680046408,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1680046408;s:5:\"token\";s:32:\"13a514c6e9a6cb915535ae97357399e4\";}','localhost'),('ddmft8kgjv5jdv2iqoi5gmggnc',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680046858,1680046905,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1680046905;s:5:\"token\";s:32:\"e8e9dbeedc4a6c9978cfe5a2ac36fd31\";}','localhost'),('em8koa2itb91kqda3a80ct56k9',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680045742,1680045775,0,'csrf|a:2:{s:9:\"timestamp\";i:1680045775;s:5:\"token\";s:32:\"0d4074db5d26e4d028f33eea3c232cfd\";}username|s:6:\"aclark\";','localhost'),('eoae8s1s3hapmm8eegi4bct4de',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680047156,1680047167,0,'username|s:6:\"gfavio\";csrf|a:2:{s:9:\"timestamp\";i:1680047167;s:5:\"token\";s:32:\"da15e7818643204b0b32d380be7fb745\";}','localhost'),('eqddqi9nborebogcctmap4qtoc',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680045508,1680045674,0,'username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1680045673;s:5:\"token\";s:32:\"bc583a16282a6710fc1fb9d22cb43d99\";}','localhost'),('h17dqik9qvk7iqn841s9qklu5c',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680047436,1680047483,0,'csrf|a:2:{s:9:\"timestamp\";i:1680047483;s:5:\"token\";s:32:\"4c3631dd8ee8275eedc7b758c36f1975\";}username|s:6:\"mpower\";','localhost'),('haa1ja69r9rudqeumb56omf3om',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680046496,1680046514,0,'username|s:6:\"minoue\";csrf|a:2:{s:9:\"timestamp\";i:1680046514;s:5:\"token\";s:32:\"3d9c9fb13b8cd8aa6a1fca953dfe8ad9\";}','localhost'),('ifu3q7fp7psiv094k1g098e5i8',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680046078,1680046124,0,'csrf|a:2:{s:9:\"timestamp\";i:1680046123;s:5:\"token\";s:32:\"39d6c7f183b2219bdcd38edd8f0f8961\";}username|s:6:\"bbeaty\";','localhost'),('iuar1pen2ekarkvhg4gvvqgdut',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680046124,1680046212,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1680046212;s:5:\"token\";s:32:\"a7cb638bfe925f33a1a5d79b4266ce23\";}','localhost'),('jg8h7ij4d79p1hrivuavcovgc0',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680047039,1680047050,0,'username|s:7:\"phudson\";csrf|a:2:{s:9:\"timestamp\";i:1680047050;s:5:\"token\";s:32:\"36e3bae4fdbfc5eb6b8aed4be812267a\";}','localhost'),('jpbfeq0jq4j3g78fa9us8p1gda',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680047054,1680047087,0,'csrf|a:2:{s:9:\"timestamp\";i:1680047086;s:5:\"token\";s:32:\"538194c3d983224d6495d1cbc6699145\";}username|s:5:\"mally\";','localhost'),('k35nb7kjs37je3u58ig97a54cn',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680047087,1680047143,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1680047143;s:5:\"token\";s:32:\"0e6c9f2508162f2dcd7fe13c858e1eee\";}','localhost'),('kg6s1hk2fjm5ovc0lr9sihllgh',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680045455,1680045475,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1680045475;s:5:\"token\";s:32:\"66ca93163b9ed4a156d6f46857eb5f2c\";}','localhost'),('kujt93l2r4pjc4bcvtsmh4e1cm',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680047607,1680047645,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1680047644;s:5:\"token\";s:32:\"18c681198786842805c8c2a4a66a769d\";}','localhost'),('lbn78slsk0bt7csuuvdot1gu8l',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680047143,1680047155,0,'username|s:8:\"agallego\";csrf|a:2:{s:9:\"timestamp\";i:1680047155;s:5:\"token\";s:32:\"39e765c52b9c507a669a6a787c4846d6\";}','localhost'),('lf6gr0l3ssc8ftfuapbsismr1j',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680046420,1680046464,0,'csrf|a:2:{s:9:\"timestamp\";i:1680046464;s:5:\"token\";s:32:\"b6044c82d72500c1cd551720c690240c\";}username|s:9:\"dbernnard\";','localhost'),('m41dug6v5sn7b92o80bmtch7e1',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680045498,1680045505,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1680045505;s:5:\"token\";s:32:\"394de7e4d3b5f632d84d28e76b33a9d6\";}','localhost'),('m9riahdf3f09337f92fhvv8ga1',21,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680046022,1680046074,0,'csrf|a:2:{s:9:\"timestamp\";i:1680046074;s:5:\"token\";s:32:\"87d7f224751e0e147b2c39e05b39078f\";}username|s:10:\"bbarnetson\";userId|i:21;','localhost'),('mg659hqck4ta5nufbpf7sgkd60',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680046906,1680046917,0,'username|s:8:\"agallego\";csrf|a:2:{s:9:\"timestamp\";i:1680046918;s:5:\"token\";s:32:\"c5cc8292084f05f1bd0d68ae8331a73f\";}','localhost'),('nlsac6m7296v6c18rkm4so2usi',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680047240,1680047379,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1680047379;s:5:\"token\";s:32:\"4dae59db4cbb81e5f450e9df48a595cf\";}','localhost'),('o1gute0trvu8c5qbgpp1r43itc',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680045675,1680045688,0,'username|s:5:\"rvaca\";csrf|a:2:{s:9:\"timestamp\";i:1680045688;s:5:\"token\";s:32:\"44ff8affa808b83df21f361fe12da72e\";}','localhost'),('o4a85u0rbcv9ogkn2ebdvsjvg6',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680047195,1680047239,0,'csrf|a:2:{s:9:\"timestamp\";i:1680047239;s:5:\"token\";s:32:\"d1c8ae977d8422869368c212c0b77500\";}username|s:7:\"mdawson\";','localhost'),('od32j0ak4nd0g6ner0rpnekphe',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680046996,1680047038,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1680047038;s:5:\"token\";s:32:\"7de680373e9a03894cd0bd38dccb4441\";}','localhost'),('prnb4l8ss63vm45n3gpsj558f4',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680047528,1680047540,0,'username|s:8:\"agallego\";csrf|a:2:{s:9:\"timestamp\";i:1680047540;s:5:\"token\";s:32:\"05ebcb59d26595ea7f6a3cb2f52db390\";}','localhost'),('q6j8697rhfamcbu4md4k2qs6st',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680046216,1680046278,0,'csrf|a:2:{s:9:\"timestamp\";i:1680046278;s:5:\"token\";s:32:\"6dfca186fc124b2c9d30a0facb6f77b2\";}username|s:6:\"callan\";','localhost'),('qo87627u82f5ousujdbj1ie7nu',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680047544,1680047607,0,'csrf|a:2:{s:9:\"timestamp\";i:1680047607;s:5:\"token\";s:32:\"6ad5582231efe51b4606501aa34ff1b4\";}username|s:6:\"msmith\";','localhost'),('r3jcdbv3rt19smd2qu1fof388p',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680046635,1680046646,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1680046646;s:5:\"token\";s:32:\"6ced018b9f8550235e665e4ace642bc1\";}','localhost'),('r5ka2l5vu397k88l7tcp5dv8lt',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680046958,1680046995,0,'csrf|a:2:{s:9:\"timestamp\";i:1680046995;s:5:\"token\";s:32:\"909c2e3691a32f828a25e19211e39f57\";}username|s:6:\"lelder\";','localhost'),('s0m0o44k2d9s4n76abac5eppqk',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680047168,1680047192,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1680047192;s:5:\"token\";s:32:\"2fe1d59c2e1281e15c8e2fa4b55d7b03\";}','localhost'),('slj44oibghs1vk52l4brsgc6ou',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680046705,1680046727,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1680046727;s:5:\"token\";s:32:\"b4ff90807d5437000395223325f95333\";}','localhost'),('tpi4g98tuv7njb3btl5h1di860',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680046515,1680046525,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1680046525;s:5:\"token\";s:32:\"2a3915aa1faec0146b9ba36a00542918\";}','localhost'),('um0cdajotrjna42maa4pe92q3d',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680045718,1680045738,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1680045738;s:5:\"token\";s:32:\"586e79e2dcf47ca1753b6df1455ffc0d\";}','localhost'),('utnkfdn22h7if0knet0f330mf2',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680047484,1680047527,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1680047527;s:5:\"token\";s:32:\"45f41142db0cd43038ee3d6dbf4c44a6\";}','localhost'),('v36mics3u5s692b8qlc9cr246q',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1680045489,1680045497,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1680045497;s:5:\"token\";s:32:\"6eb0e278b6fcbd5381f14837ac8a71f6\";}','localhost');
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
  `redirect` bigint(20) NOT NULL DEFAULT '0' COMMENT 'If not 0, redirect to the specified journal/conference/... site.',
  `primary_locale` varchar(14) NOT NULL COMMENT 'Primary locale for the site.',
  `min_password_length` smallint(6) NOT NULL DEFAULT '6',
  `installed_locales` varchar(1024) NOT NULL DEFAULT 'en' COMMENT 'Locales for which support has been installed.',
  `supported_locales` varchar(1024) DEFAULT NULL COMMENT 'Locales supported by the site (for hosted journals/conferences/...).',
  `original_style_file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='A singleton table describing basic information about the site.';
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
  `setting_value` mediumtext,
  PRIMARY KEY (`site_setting_id`),
  UNIQUE KEY `site_settings_unique` (`setting_name`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='More data about the site, including localized properties such as its name.';
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
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)',
  PRIMARY KEY (`spotlight_setting_id`),
  UNIQUE KEY `spotlight_settings_unique` (`spotlight_id`,`locale`,`setting_name`),
  KEY `spotlight_settings_id` (`spotlight_id`),
  CONSTRAINT `spotlight_settings_spotlight_id_foreign` FOREIGN KEY (`spotlight_id`) REFERENCES `spotlights` (`spotlight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='More data about spotlights, including localized properties.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about which submissions to the press are spotlighted.';
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
  `recommend_only` smallint(6) NOT NULL DEFAULT '0',
  `can_change_metadata` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stage_assignment_id`),
  UNIQUE KEY `stage_assignment` (`submission_id`,`user_group_id`,`user_id`),
  KEY `stage_assignments_user_group_id` (`user_group_id`),
  KEY `stage_assignments_user_id` (`user_id`),
  KEY `stage_assignments_submission_id` (`submission_id`),
  CONSTRAINT `stage_assignments_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE,
  CONSTRAINT `stage_assignments_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `stage_assignments_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='Who can access a submission while it is in the editorial workflow. Includes all editorial and author assignments. For reviewers, see review_assignments.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES (1,1,13,19,'2023-03-28 23:22:54',0,0),(2,1,5,4,'2023-03-28 23:22:53',0,1),(3,1,6,14,'2023-03-28 23:23:34',0,0),(4,2,13,20,'2023-03-28 23:26:00',0,0),(5,3,13,21,'2023-03-28 23:27:53',0,0),(6,4,13,22,'2023-03-28 23:28:42',0,0),(7,4,3,3,'2023-03-28 23:28:42',0,1),(8,4,6,13,'2023-03-28 23:29:45',0,0),(9,4,10,15,'2023-03-28 23:30:04',0,0),(10,5,13,23,'2023-03-28 23:31:17',0,0),(11,5,6,14,'2023-03-28 23:32:23',0,0),(12,5,10,16,'2023-03-28 23:32:44',0,0),(13,5,12,17,'2023-03-28 23:32:51',0,0),(14,6,13,24,'2023-03-28 23:34:22',0,0),(15,6,5,4,'2023-03-28 23:34:22',0,1),(16,6,3,3,'2023-03-28 23:34:48',0,1),(17,6,5,6,'2023-03-28 23:34:54',1,0),(18,7,13,25,'2023-03-28 23:36:22',0,0),(19,7,3,3,'2023-03-28 23:36:22',0,1),(20,7,6,13,'2023-03-28 23:37:10',0,0),(21,8,3,3,'2023-03-28 23:37:21',0,1),(22,9,13,26,'2023-03-28 23:38:23',0,0),(23,9,5,4,'2023-03-28 23:38:23',0,1),(24,10,13,27,'2023-03-28 23:40:29',0,0),(25,11,13,28,'2023-03-28 23:40:56',0,0),(26,12,13,29,'2023-03-28 23:43:14',0,0),(27,13,13,30,'2023-03-28 23:44:45',0,0),(28,14,13,31,'2023-03-28 23:47:18',0,0),(29,14,3,3,'2023-03-28 23:47:18',0,1),(30,14,6,13,'2023-03-28 23:48:19',0,0),(31,14,10,15,'2023-03-28 23:48:36',0,0),(32,14,12,18,'2023-03-28 23:48:43',0,0),(33,15,13,32,'2023-03-28 23:50:13',0,0),(34,16,13,33,'2023-03-28 23:51:22',0,0),(35,17,13,34,'2023-03-28 23:53:25',0,0);
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
  `setting_value` longtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`static_page_setting_id`),
  KEY `static_page_settings_static_page_id` (`static_page_id`),
  CONSTRAINT `static_page_settings_static_page_id` FOREIGN KEY (`static_page_id`) REFERENCES `static_pages` (`static_page_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  PRIMARY KEY (`static_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Subeditor assignments to e.g. sections and categories';
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
  `primary_contact` smallint(6) NOT NULL DEFAULT '0',
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  UNIQUE KEY `chapter_authors_pkey` (`author_id`,`chapter_id`),
  KEY `submission_chapter_authors_author_id` (`author_id`),
  KEY `submission_chapter_authors_chapter_id` (`chapter_id`),
  CONSTRAINT `submission_chapter_authors_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_chapter_authors_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The list of authors associated with each submission chapter.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_chapter_authors`
--

LOCK TABLES `submission_chapter_authors` WRITE;
/*!40000 ALTER TABLE `submission_chapter_authors` DISABLE KEYS */;
INSERT INTO `submission_chapter_authors` VALUES (1,1,0,0.00),(1,2,0,0.00),(1,3,0,0.00),(5,4,0,0.00),(6,5,0,0.00),(7,6,0,0.00),(8,7,0,0.00),(9,7,0,1.00),(11,8,0,0.00),(11,9,0,0.00),(11,10,0,0.00),(11,11,0,0.00),(11,12,0,0.00),(12,13,0,0.00),(13,14,0,0.00),(14,15,0,0.00),(15,16,0,0.00),(16,17,0,0.00),(16,18,0,0.00),(16,19,0,0.00),(16,20,0,0.00),(16,21,0,0.00),(16,22,0,0.00),(17,23,0,0.00),(18,24,0,0.00),(19,25,0,0.00),(20,26,0,0.00),(21,27,0,0.00),(22,28,0,0.00),(23,29,0,0.00),(24,30,0,0.00),(25,31,0,0.00),(26,32,0,0.00),(27,33,0,0.00),(28,34,0,0.00),(29,35,0,0.00),(30,36,0,0.00),(31,37,0,0.00),(31,38,0,0.00),(31,39,0,0.00),(31,40,0,0.00),(31,41,0,0.00),(31,42,0,0.00),(31,43,0,0.00),(31,44,0,0.00),(31,45,0,0.00),(32,46,0,0.00),(32,47,0,0.00),(35,48,0,1.00),(36,48,0,0.00),(37,49,0,0.00),(38,49,0,1.00),(39,50,0,1.00),(40,50,0,0.00),(42,51,0,0.00),(43,52,0,0.00),(44,53,0,0.00),(45,54,0,0.00),(45,57,0,0.00),(46,55,0,0.00),(47,56,0,0.00),(48,58,0,0.00),(48,59,0,0.00),(48,60,0,0.00),(49,61,0,0.00),(49,62,0,0.00),(49,63,0,0.00),(49,64,0,0.00),(49,65,0,0.00),(50,67,0,0.00),(50,68,0,0.00),(51,66,0,0.00),(52,67,0,1.00),(52,68,0,1.00),(53,69,0,0.00),(54,69,0,1.00),(55,70,0,0.00),(56,70,0,1.00),(57,71,0,0.00);
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
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`submission_chapter_setting_id`),
  UNIQUE KEY `submission_chapter_settings_unique` (`chapter_id`,`locale`,`setting_name`),
  KEY `submission_chapter_settings_chapter_id` (`chapter_id`),
  CONSTRAINT `submission_chapter_settings_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=711 DEFAULT CHARSET=utf8 COMMENT='More information about submission chapters, including localized properties such as chapter titles.';
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
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='A list of chapters for each submission (when submissions are divided into chapters).';
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
  `comments` text,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `submission_comments_submission_id` (`submission_id`),
  KEY `submission_comments_author_id` (`author_id`),
  CONSTRAINT `submission_comments_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_comments_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Comments on a submission, e.g. peer review comments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_comments`
--

LOCK TABLES `submission_comments` WRITE;
/*!40000 ALTER TABLE `submission_comments` DISABLE KEYS */;
INSERT INTO `submission_comments` VALUES (1,1,4096,11,10,10,'','<p>I recommend that the author revise this submission.</p>','2023-03-28 23:41:57',NULL,1),(2,1,4096,11,11,12,'','<p>I recommend that the author resubmit this submission.</p>','2023-03-28 23:42:09',NULL,1),(3,1,4096,12,13,8,'','<p>I recommend declining this submission.</p>','2023-03-28 23:44:09',NULL,1),(4,1,4096,13,16,10,'','<p>I recommend requiring revisions.</p>','2023-03-28 23:45:54',NULL,1),(5,1,4096,13,18,12,'','<p>I recommend resubmitting.</p>','2023-03-28 23:46:06',NULL,1),(6,1,4096,16,21,10,'','<p>I recommend that the author revise this submission.</p>','2023-03-28 23:52:19',NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COMMENT='Revisions map submission_file entries to files on the data store.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_revisions`
--

LOCK TABLES `submission_file_revisions` WRITE;
/*!40000 ALTER TABLE `submission_file_revisions` DISABLE KEYS */;
INSERT INTO `submission_file_revisions` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,2),(5,5,3),(6,6,1),(7,7,4),(8,8,5),(9,9,6),(10,10,7),(12,12,7),(13,13,5),(14,14,4),(15,15,6),(16,16,9),(17,17,10),(18,18,11),(19,19,12),(20,20,13),(21,21,14),(22,22,15),(23,23,16),(24,24,17),(25,25,17),(26,26,16),(27,27,15),(28,28,14),(29,29,18),(30,30,19),(31,31,20),(32,32,21),(33,33,22),(34,34,23),(35,35,23),(36,36,22),(37,37,20),(38,38,19),(39,39,18),(40,40,21),(41,41,23),(42,42,24),(43,43,25),(44,44,26),(45,45,27),(46,46,27),(47,47,26),(48,48,25),(49,49,24),(50,50,28),(51,51,29),(52,52,30),(53,53,31),(54,54,32),(55,55,32),(56,56,31),(57,57,30),(58,58,29),(59,59,28),(60,60,33),(61,61,34),(62,62,35),(63,63,36),(64,64,37),(65,65,38),(66,66,38),(67,67,37),(68,68,36),(69,69,35),(70,70,34),(71,71,39),(72,72,40),(73,73,41),(74,74,42),(75,75,43),(76,76,44),(77,77,45),(78,78,46),(79,79,47),(80,80,48),(81,81,49),(82,82,49),(83,83,48),(84,84,50),(85,85,51),(86,86,52),(87,87,52),(88,88,51),(89,89,50),(90,90,53),(91,91,54),(92,92,55),(93,93,55),(94,94,54),(95,95,53),(96,96,56),(97,97,57),(98,98,58),(99,99,59),(100,100,60),(101,101,61),(102,102,61),(103,103,60),(104,104,58),(105,105,57),(106,106,56),(107,107,59),(108,108,61),(109,109,60),(110,110,59),(111,111,58),(112,112,57),(113,113,56),(114,114,62),(115,115,63),(116,116,64),(117,117,64),(118,118,63),(119,119,62),(120,120,65),(121,121,66),(122,122,67),(123,123,68),(124,124,69),(125,125,69),(126,126,68),(127,127,67),(128,128,66),(129,129,65),(130,130,70),(131,131,71),(132,132,72),(133,133,73),(134,134,74),(135,135,75),(136,136,75),(137,137,73),(138,138,72),(139,139,70),(140,140,71),(141,141,74);
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
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL DEFAULT 'string' COMMENT '(bool|int|float|string|object|date)',
  PRIMARY KEY (`submission_file_setting_id`),
  UNIQUE KEY `submission_file_settings_unique` (`submission_file_id`,`locale`,`setting_name`),
  KEY `submission_file_settings_submission_file_id` (`submission_file_id`),
  CONSTRAINT `submission_file_settings_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8 COMMENT='Localized data about submission files like published metadata.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_settings`
--

LOCK TABLES `submission_file_settings` WRITE;
/*!40000 ALTER TABLE `submission_file_settings` DISABLE KEYS */;
INSERT INTO `submission_file_settings` VALUES (1,1,'en','name','chapter1.pdf','string'),(2,2,'en','name','chapter2.pdf','string'),(3,3,'en','name','chapter3.pdf','string'),(4,1,'','chapterId','1','string'),(5,2,'','chapterId','2','string'),(6,3,'','chapterId','3','string'),(7,4,'en','name','chapter2.pdf','string'),(8,4,'','chapterId','2','string'),(9,5,'en','name','chapter3.pdf','string'),(10,5,'','chapterId','3','string'),(11,6,'en','name','chapter1.pdf','string'),(12,6,'','chapterId','1','string'),(13,7,'en','name','chapter1.pdf','string'),(14,8,'en','name','chapter2.pdf','string'),(15,9,'en','name','chapter3.pdf','string'),(16,10,'en','name','chapter4.pdf','string'),(18,7,'','chapterId','4','string'),(19,8,'','chapterId','5','string'),(20,9,'','chapterId','6','string'),(21,10,'','chapterId','7','string'),(22,12,'en','name','chapter4.pdf','string'),(23,12,'','chapterId','7','string'),(24,13,'en','name','chapter2.pdf','string'),(25,13,'','chapterId','5','string'),(26,14,'en','name','chapter1.pdf','string'),(27,14,'','chapterId','4','string'),(28,15,'en','name','chapter3.pdf','string'),(29,15,'','chapterId','6','string'),(30,16,'en','name','chapter1.pdf','string'),(31,17,'en','name','chapter2.pdf','string'),(32,18,'en','name','chapter3.pdf','string'),(33,19,'en','name','chapter4.pdf','string'),(34,20,'en','name','chapter5.pdf','string'),(35,16,'','chapterId','8','string'),(36,17,'','chapterId','9','string'),(37,18,'','chapterId','10','string'),(38,19,'','chapterId','11','string'),(39,20,'','chapterId','12','string'),(40,21,'en','name','chapter1.pdf','string'),(41,22,'en','name','chapter2.pdf','string'),(42,23,'en','name','chapter3.pdf','string'),(43,24,'en','name','intro.pdf','string'),(44,24,'','chapterId','13','string'),(45,21,'','chapterId','14','string'),(46,22,'','chapterId','15','string'),(47,23,'','chapterId','16','string'),(48,25,'en','name','intro.pdf','string'),(49,25,'','chapterId','13','string'),(50,26,'en','name','chapter3.pdf','string'),(51,26,'','chapterId','16','string'),(52,27,'en','name','chapter2.pdf','string'),(53,27,'','chapterId','15','string'),(54,28,'en','name','chapter1.pdf','string'),(55,28,'','chapterId','14','string'),(56,29,'en','name','prologue.pdf','string'),(57,30,'en','name','chapter1.pdf','string'),(58,31,'en','name','chapter2.pdf','string'),(59,32,'en','name','chapter3.pdf','string'),(60,33,'en','name','chapter4.pdf','string'),(61,34,'en','name','epilogue.pdf','string'),(62,29,'','chapterId','17','string'),(63,30,'','chapterId','18','string'),(64,31,'','chapterId','19','string'),(65,32,'','chapterId','20','string'),(66,33,'','chapterId','21','string'),(67,34,'','chapterId','22','string'),(68,35,'en','name','epilogue.pdf','string'),(69,35,'','chapterId','22','string'),(70,36,'en','name','chapter4.pdf','string'),(71,36,'','chapterId','21','string'),(72,37,'en','name','chapter2.pdf','string'),(73,37,'','chapterId','19','string'),(74,38,'en','name','chapter1.pdf','string'),(75,38,'','chapterId','18','string'),(76,39,'en','name','prologue.pdf','string'),(77,39,'','chapterId','17','string'),(78,40,'en','name','chapter3.pdf','string'),(79,40,'','chapterId','20','string'),(80,41,'en','name','epilogue.pdf','string'),(81,41,'','chapterId','22','string'),(82,42,'en','name','chapter1.pdf','string'),(83,43,'en','name','chapter2.pdf','string'),(84,44,'en','name','chapter3.pdf','string'),(85,45,'en','name','chapter4.pdf','string'),(86,42,'','chapterId','23','string'),(87,43,'','chapterId','24','string'),(88,44,'','chapterId','25','string'),(89,45,'','chapterId','26','string'),(90,46,'en','name','chapter4.pdf','string'),(91,46,'','chapterId','26','string'),(92,47,'en','name','chapter3.pdf','string'),(93,47,'','chapterId','25','string'),(94,48,'en','name','chapter2.pdf','string'),(95,48,'','chapterId','24','string'),(96,49,'en','name','chapter1.pdf','string'),(97,49,'','chapterId','23','string'),(98,50,'en','name','intro.pdf','string'),(99,51,'en','name','chapter1.pdf','string'),(100,52,'en','name','chapter2.pdf','string'),(101,53,'en','name','chapter3.pdf','string'),(102,54,'en','name','chapter4.pdf','string'),(103,50,'','chapterId','27','string'),(104,51,'','chapterId','28','string'),(105,52,'','chapterId','29','string'),(106,53,'','chapterId','30','string'),(107,54,'','chapterId','31','string'),(108,55,'en','name','chapter4.pdf','string'),(109,55,'','chapterId','31','string'),(110,56,'en','name','chapter3.pdf','string'),(111,56,'','chapterId','30','string'),(112,57,'en','name','chapter2.pdf','string'),(113,57,'','chapterId','29','string'),(114,58,'en','name','chapter1.pdf','string'),(115,58,'','chapterId','28','string'),(116,59,'en','name','intro.pdf','string'),(117,59,'','chapterId','27','string'),(118,60,'en','name','note.pdf','string'),(119,61,'en','name','chapter1.pdf','string'),(120,62,'en','name','chapter2.pdf','string'),(121,63,'en','name','chapter3.pdf','string'),(122,64,'en','name','chapter4.pdf','string'),(123,65,'en','name','chapter5.pdf','string'),(124,61,'','chapterId','32','string'),(125,62,'','chapterId','33','string'),(126,63,'','chapterId','34','string'),(127,64,'','chapterId','35','string'),(128,65,'','chapterId','36','string'),(129,66,'en','name','chapter5.pdf','string'),(130,66,'','chapterId','36','string'),(131,67,'en','name','chapter4.pdf','string'),(132,67,'','chapterId','35','string'),(133,68,'en','name','chapter3.pdf','string'),(134,68,'','chapterId','34','string'),(135,69,'en','name','chapter2.pdf','string'),(136,69,'','chapterId','33','string'),(137,70,'en','name','chapter1.pdf','string'),(138,70,'','chapterId','32','string'),(139,71,'en','name','intro.pdf','string'),(140,72,'en','name','chapter1.pdf','string'),(141,73,'en','name','chapter2.pdf','string'),(142,74,'en','name','chapter3.pdf','string'),(143,75,'en','name','chapter4.pdf','string'),(144,76,'en','name','chapter5.pdf','string'),(145,77,'en','name','conclusion.pdf','string'),(146,78,'en','name','bibliography.pdf','string'),(147,79,'en','name','index.pdf','string'),(148,71,'','chapterId','37','string'),(149,72,'','chapterId','38','string'),(150,73,'','chapterId','39','string'),(151,74,'','chapterId','40','string'),(152,75,'','chapterId','41','string'),(153,76,'','chapterId','42','string'),(154,77,'','chapterId','43','string'),(155,78,'','chapterId','44','string'),(156,79,'','chapterId','45','string'),(157,80,'en','name','intro.pdf','string'),(158,81,'en','name','poems.pdf','string'),(159,80,'','chapterId','46','string'),(160,81,'','chapterId','47','string'),(161,82,'en','name','poems.pdf','string'),(162,82,'','chapterId','47','string'),(163,83,'en','name','intro.pdf','string'),(164,83,'','chapterId','46','string'),(165,84,'en','name','chapter1.pdf','string'),(166,85,'en','name','chapter2.pdf','string'),(167,86,'en','name','chapter3.pdf','string'),(168,84,'','chapterId','48','string'),(169,85,'','chapterId','49','string'),(170,86,'','chapterId','50','string'),(171,87,'en','name','chapter3.pdf','string'),(172,87,'','chapterId','50','string'),(173,88,'en','name','chapter2.pdf','string'),(174,88,'','chapterId','49','string'),(175,89,'en','name','chapter1.pdf','string'),(176,89,'','chapterId','48','string'),(177,90,'en','name','chapter1.pdf','string'),(178,91,'en','name','chapter2.pdf','string'),(179,92,'en','name','chapter3.pdf','string'),(180,90,'','chapterId','51','string'),(181,91,'','chapterId','52','string'),(182,92,'','chapterId','53','string'),(183,93,'en','name','chapter3.pdf','string'),(184,93,'','chapterId','53','string'),(185,94,'en','name','chapter2.pdf','string'),(186,94,'','chapterId','52','string'),(187,95,'en','name','chapter1.pdf','string'),(188,95,'','chapterId','51','string'),(189,96,'en','name','chapter1.pdf','string'),(190,97,'en','name','chapter2.pdf','string'),(191,98,'en','name','chapter3.pdf','string'),(192,99,'en','name','chapter4.pdf','string'),(193,100,'en','name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(194,101,'en','name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(195,96,'','chapterId','54','string'),(196,97,'','chapterId','55','string'),(197,98,'','chapterId','56','string'),(198,99,'','chapterId','57','string'),(199,102,'en','name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(200,103,'en','name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(201,104,'en','name','chapter3.pdf','string'),(202,104,'','chapterId','56','string'),(203,105,'en','name','chapter2.pdf','string'),(204,105,'','chapterId','55','string'),(205,106,'en','name','chapter1.pdf','string'),(206,106,'','chapterId','54','string'),(207,107,'en','name','chapter4.pdf','string'),(208,107,'','chapterId','57','string'),(209,108,'en','name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(210,109,'en','name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(211,110,'en','name','chapter4.pdf','string'),(212,110,'','chapterId','57','string'),(213,111,'en','name','chapter3.pdf','string'),(214,111,'','chapterId','56','string'),(215,112,'en','name','chapter2.pdf','string'),(216,112,'','chapterId','55','string'),(217,113,'en','name','chapter1.pdf','string'),(218,113,'','chapterId','54','string'),(219,114,'en','name','chapter1.pdf','string'),(220,115,'en','name','chapter2.pdf','string'),(221,116,'en','name','chapter3.pdf','string'),(222,114,'','chapterId','58','string'),(223,115,'','chapterId','59','string'),(224,116,'','chapterId','60','string'),(225,117,'en','name','chapter3.pdf','string'),(226,117,'','chapterId','60','string'),(227,118,'en','name','chapter2.pdf','string'),(228,118,'','chapterId','59','string'),(229,119,'en','name','chapter1.pdf','string'),(230,119,'','chapterId','58','string'),(231,120,'en','name','foreward.pdf','string'),(232,121,'en','name','preface.pdf','string'),(233,122,'en','name','cases.pdf','string'),(234,123,'en','name','conclusion.pdf','string'),(235,124,'en','name','bibliography.pdf','string'),(236,120,'','chapterId','61','string'),(237,121,'','chapterId','62','string'),(238,122,'','chapterId','63','string'),(239,123,'','chapterId','64','string'),(240,124,'','chapterId','65','string'),(241,125,'en','name','bibliography.pdf','string'),(242,125,'','chapterId','65','string'),(243,126,'en','name','conclusion.pdf','string'),(244,126,'','chapterId','64','string'),(245,127,'en','name','cases.pdf','string'),(246,127,'','chapterId','63','string'),(247,128,'en','name','preface.pdf','string'),(248,128,'','chapterId','62','string'),(249,129,'en','name','foreward.pdf','string'),(250,129,'','chapterId','61','string'),(251,130,'en','name','preface.pdf','string'),(252,131,'en','name','introduction.pdf','string'),(253,132,'en','name','chapter1.pdf','string'),(254,133,'en','name','chapter2.pdf','string'),(255,134,'en','name','chapter3.pdf','string'),(256,135,'en','name','chapter4.pdf','string'),(257,130,'','chapterId','66','string'),(258,131,'','chapterId','67','string'),(259,132,'','chapterId','68','string'),(260,133,'','chapterId','69','string'),(261,134,'','chapterId','70','string'),(262,135,'','chapterId','71','string'),(263,136,'en','name','chapter4.pdf','string'),(264,136,'','chapterId','71','string'),(265,137,'en','name','chapter2.pdf','string'),(266,137,'','chapterId','69','string'),(267,138,'en','name','chapter1.pdf','string'),(268,138,'','chapterId','68','string'),(269,139,'en','name','preface.pdf','string'),(270,139,'','chapterId','66','string'),(271,140,'en','name','introduction.pdf','string'),(272,140,'','chapterId','67','string'),(273,141,'en','name','chapter3.pdf','string'),(274,141,'','chapterId','70','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COMMENT='All files associated with a submission, such as those uploaded during submission, as revisions, or by copyeditors or layout editors for production.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (1,1,1,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:22:31','2023-03-28 23:22:32',19,NULL,NULL,NULL),(2,1,2,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:22:32','2023-03-28 23:22:33',19,NULL,NULL,NULL),(3,1,3,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:22:34','2023-03-28 23:22:34',19,NULL,NULL,NULL),(4,1,2,2,3,4,NULL,NULL,NULL,'2023-03-28 23:23:08','2023-03-28 23:23:08',19,523,1,NULL),(5,1,3,3,3,4,NULL,NULL,NULL,'2023-03-28 23:23:08','2023-03-28 23:23:08',19,523,1,NULL),(6,1,1,1,3,4,NULL,NULL,NULL,'2023-03-28 23:23:08','2023-03-28 23:23:08',19,523,1,NULL),(7,2,4,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:24:01','2023-03-28 23:24:01',20,NULL,NULL,NULL),(8,2,5,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:24:02','2023-03-28 23:24:02',20,NULL,NULL,NULL),(9,2,6,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:24:03','2023-03-28 23:24:04',20,NULL,NULL,NULL),(10,2,7,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:24:04','2023-03-28 23:24:05',20,NULL,NULL,NULL),(12,2,7,10,3,4,NULL,NULL,NULL,'2023-03-28 23:26:30','2023-03-28 23:26:30',20,523,2,NULL),(13,2,5,8,3,4,NULL,NULL,NULL,'2023-03-28 23:26:31','2023-03-28 23:26:31',20,523,2,NULL),(14,2,4,7,3,4,NULL,NULL,NULL,'2023-03-28 23:26:31','2023-03-28 23:26:31',20,523,2,NULL),(15,2,6,9,3,4,NULL,NULL,NULL,'2023-03-28 23:26:31','2023-03-28 23:26:31',20,523,2,NULL),(16,3,9,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:27:11','2023-03-28 23:27:12',21,NULL,NULL,NULL),(17,3,10,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:27:13','2023-03-28 23:27:13',21,NULL,NULL,NULL),(18,3,11,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:27:14','2023-03-28 23:27:14',21,NULL,NULL,NULL),(19,3,12,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:27:15','2023-03-28 23:27:15',21,NULL,NULL,NULL),(20,3,13,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:27:16','2023-03-28 23:27:17',21,NULL,NULL,NULL),(21,4,14,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:28:08','2023-03-28 23:28:08',22,NULL,NULL,NULL),(22,4,15,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:28:09','2023-03-28 23:28:09',22,NULL,NULL,NULL),(23,4,16,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:28:10','2023-03-28 23:28:10',22,NULL,NULL,NULL),(24,4,17,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:28:11','2023-03-28 23:28:11',22,NULL,NULL,NULL),(25,4,17,24,3,19,NULL,NULL,NULL,'2023-03-28 23:28:57','2023-03-28 23:28:57',22,523,3,NULL),(26,4,16,23,3,19,NULL,NULL,NULL,'2023-03-28 23:28:57','2023-03-28 23:28:57',22,523,3,NULL),(27,4,15,22,3,19,NULL,NULL,NULL,'2023-03-28 23:28:58','2023-03-28 23:28:58',22,523,3,NULL),(28,4,14,21,3,19,NULL,NULL,NULL,'2023-03-28 23:28:58','2023-03-28 23:28:58',22,523,3,NULL),(29,5,18,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:30:25','2023-03-28 23:30:26',23,NULL,NULL,NULL),(30,5,19,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:30:27','2023-03-28 23:30:27',23,NULL,NULL,NULL),(31,5,20,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:30:28','2023-03-28 23:30:28',23,NULL,NULL,NULL),(32,5,21,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:30:29','2023-03-28 23:30:29',23,NULL,NULL,NULL),(33,5,22,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:30:30','2023-03-28 23:30:31',23,NULL,NULL,NULL),(34,5,23,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:30:31','2023-03-28 23:30:32',23,NULL,NULL,NULL),(35,5,23,34,3,19,NULL,NULL,NULL,'2023-03-28 23:31:35','2023-03-28 23:31:35',23,523,5,NULL),(36,5,22,33,3,19,NULL,NULL,NULL,'2023-03-28 23:31:35','2023-03-28 23:31:35',23,523,5,NULL),(37,5,20,31,3,19,NULL,NULL,NULL,'2023-03-28 23:31:35','2023-03-28 23:31:35',23,523,5,NULL),(38,5,19,30,3,19,NULL,NULL,NULL,'2023-03-28 23:31:35','2023-03-28 23:31:35',23,523,5,NULL),(39,5,18,29,3,19,NULL,NULL,NULL,'2023-03-28 23:31:35','2023-03-28 23:31:35',23,523,5,NULL),(40,5,21,32,3,19,NULL,NULL,NULL,'2023-03-28 23:31:35','2023-03-28 23:31:35',23,523,5,NULL),(41,5,23,34,3,10,'0','openAccess',1,'2023-03-28 23:33:01','2023-03-28 23:33:12',23,521,2,NULL),(42,6,24,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:33:50','2023-03-28 23:33:50',24,NULL,NULL,NULL),(43,6,25,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:33:51','2023-03-28 23:33:51',24,NULL,NULL,NULL),(44,6,26,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:33:52','2023-03-28 23:33:52',24,NULL,NULL,NULL),(45,6,27,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:33:53','2023-03-28 23:33:53',24,NULL,NULL,NULL),(46,6,27,45,3,19,NULL,NULL,NULL,'2023-03-28 23:34:38','2023-03-28 23:34:38',24,523,7,NULL),(47,6,26,44,3,19,NULL,NULL,NULL,'2023-03-28 23:34:38','2023-03-28 23:34:38',24,523,7,NULL),(48,6,25,43,3,19,NULL,NULL,NULL,'2023-03-28 23:34:38','2023-03-28 23:34:38',24,523,7,NULL),(49,6,24,42,3,19,NULL,NULL,NULL,'2023-03-28 23:34:38','2023-03-28 23:34:38',24,523,7,NULL),(50,7,28,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:35:38','2023-03-28 23:35:39',25,NULL,NULL,NULL),(51,7,29,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:35:39','2023-03-28 23:35:40',25,NULL,NULL,NULL),(52,7,30,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:35:41','2023-03-28 23:35:41',25,NULL,NULL,NULL),(53,7,31,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:35:42','2023-03-28 23:35:42',25,NULL,NULL,NULL),(54,7,32,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:35:43','2023-03-28 23:35:43',25,NULL,NULL,NULL),(55,7,32,54,3,4,NULL,NULL,NULL,'2023-03-28 23:36:39','2023-03-28 23:36:39',25,523,8,NULL),(56,7,31,53,3,4,NULL,NULL,NULL,'2023-03-28 23:36:39','2023-03-28 23:36:39',25,523,8,NULL),(57,7,30,52,3,4,NULL,NULL,NULL,'2023-03-28 23:36:40','2023-03-28 23:36:40',25,523,8,NULL),(58,7,29,51,3,4,NULL,NULL,NULL,'2023-03-28 23:36:40','2023-03-28 23:36:40',25,523,8,NULL),(59,7,28,50,3,4,NULL,NULL,NULL,'2023-03-28 23:36:40','2023-03-28 23:36:40',25,523,8,NULL),(60,8,33,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:37:25','2023-03-28 23:37:25',3,NULL,NULL,NULL),(61,9,34,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:37:39','2023-03-28 23:37:39',26,NULL,NULL,NULL),(62,9,35,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:37:40','2023-03-28 23:37:40',26,NULL,NULL,NULL),(63,9,36,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:37:41','2023-03-28 23:37:41',26,NULL,NULL,NULL),(64,9,37,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:37:42','2023-03-28 23:37:43',26,NULL,NULL,NULL),(65,9,38,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:37:44','2023-03-28 23:37:44',26,NULL,NULL,NULL),(66,9,38,65,3,19,NULL,NULL,NULL,'2023-03-28 23:38:41','2023-03-28 23:38:41',26,523,9,NULL),(67,9,37,64,3,19,NULL,NULL,NULL,'2023-03-28 23:38:41','2023-03-28 23:38:41',26,523,9,NULL),(68,9,36,63,3,19,NULL,NULL,NULL,'2023-03-28 23:38:41','2023-03-28 23:38:41',26,523,9,NULL),(69,9,35,62,3,19,NULL,NULL,NULL,'2023-03-28 23:38:41','2023-03-28 23:38:41',26,523,9,NULL),(70,9,34,61,3,19,NULL,NULL,NULL,'2023-03-28 23:38:41','2023-03-28 23:38:41',26,523,9,NULL),(71,10,39,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:39:00','2023-03-28 23:39:00',27,NULL,NULL,NULL),(72,10,40,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:39:01','2023-03-28 23:39:01',27,NULL,NULL,NULL),(73,10,41,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:39:02','2023-03-28 23:39:02',27,NULL,NULL,NULL),(74,10,42,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:39:03','2023-03-28 23:39:04',27,NULL,NULL,NULL),(75,10,43,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:39:04','2023-03-28 23:39:05',27,NULL,NULL,NULL),(76,10,44,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:39:06','2023-03-28 23:39:06',27,NULL,NULL,NULL),(77,10,45,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:39:07','2023-03-28 23:39:07',27,NULL,NULL,NULL),(78,10,46,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:39:08','2023-03-28 23:39:08',27,NULL,NULL,NULL),(79,10,47,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:39:09','2023-03-28 23:39:10',27,NULL,NULL,NULL),(80,11,48,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:40:42','2023-03-28 23:40:43',28,NULL,NULL,NULL),(81,11,49,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:40:43','2023-03-28 23:40:44',28,NULL,NULL,NULL),(82,11,49,81,3,19,NULL,NULL,NULL,'2023-03-28 23:41:11','2023-03-28 23:41:11',28,523,10,NULL),(83,11,48,80,3,19,NULL,NULL,NULL,'2023-03-28 23:41:11','2023-03-28 23:41:11',28,523,10,NULL),(84,12,50,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:42:48','2023-03-28 23:42:48',29,NULL,NULL,NULL),(85,12,51,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:42:49','2023-03-28 23:42:49',29,NULL,NULL,NULL),(86,12,52,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:42:50','2023-03-28 23:42:50',29,NULL,NULL,NULL),(87,12,52,86,3,19,NULL,NULL,NULL,'2023-03-28 23:43:31','2023-03-28 23:43:31',29,523,12,NULL),(88,12,51,85,3,19,NULL,NULL,NULL,'2023-03-28 23:43:31','2023-03-28 23:43:31',29,523,12,NULL),(89,12,50,84,3,19,NULL,NULL,NULL,'2023-03-28 23:43:31','2023-03-28 23:43:31',29,523,12,NULL),(90,13,53,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:44:22','2023-03-28 23:44:23',30,NULL,NULL,NULL),(91,13,54,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:44:23','2023-03-28 23:44:24',30,NULL,NULL,NULL),(92,13,55,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:44:25','2023-03-28 23:44:25',30,NULL,NULL,NULL),(93,13,55,92,3,19,NULL,NULL,NULL,'2023-03-28 23:45:00','2023-03-28 23:45:00',30,523,13,NULL),(94,13,54,91,3,19,NULL,NULL,NULL,'2023-03-28 23:45:01','2023-03-28 23:45:01',30,523,13,NULL),(95,13,53,90,3,19,NULL,NULL,NULL,'2023-03-28 23:45:01','2023-03-28 23:45:01',30,523,13,NULL),(96,14,56,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:46:44','2023-03-28 23:46:44',31,NULL,NULL,NULL),(97,14,57,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:46:45','2023-03-28 23:46:45',31,NULL,NULL,NULL),(98,14,58,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:46:46','2023-03-28 23:46:46',31,NULL,NULL,NULL),(99,14,59,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:46:47','2023-03-28 23:46:47',31,NULL,NULL,NULL),(100,14,60,NULL,13,2,NULL,NULL,NULL,'2023-03-28 23:46:48','2023-03-28 23:46:49',31,NULL,NULL,NULL),(101,14,61,NULL,9,2,NULL,NULL,NULL,'2023-03-28 23:46:49','2023-03-28 23:46:50',31,NULL,NULL,NULL),(102,14,61,101,9,19,NULL,NULL,NULL,'2023-03-28 23:47:35','2023-03-28 23:47:35',31,523,15,NULL),(103,14,60,100,13,19,NULL,NULL,NULL,'2023-03-28 23:47:35','2023-03-28 23:47:35',31,523,15,NULL),(104,14,58,98,3,19,NULL,NULL,NULL,'2023-03-28 23:47:35','2023-03-28 23:47:35',31,523,15,NULL),(105,14,57,97,3,19,NULL,NULL,NULL,'2023-03-28 23:47:36','2023-03-28 23:47:36',31,523,15,NULL),(106,14,56,96,3,19,NULL,NULL,NULL,'2023-03-28 23:47:36','2023-03-28 23:47:36',31,523,15,NULL),(107,14,59,99,3,19,NULL,NULL,NULL,'2023-03-28 23:47:36','2023-03-28 23:47:36',31,523,15,NULL),(108,14,61,101,9,10,'0','openAccess',1,'2023-03-28 23:48:56','2023-03-28 23:49:35',31,521,3,NULL),(109,14,60,100,13,10,'0','openAccess',1,'2023-03-28 23:48:56','2023-03-28 23:49:29',31,521,3,NULL),(110,14,59,99,3,10,'0','openAccess',1,'2023-03-28 23:48:56','2023-03-28 23:49:23',31,521,3,NULL),(111,14,58,98,3,10,'0','openAccess',1,'2023-03-28 23:48:56','2023-03-28 23:49:17',31,521,3,NULL),(112,14,57,97,3,10,'0','openAccess',1,'2023-03-28 23:48:56','2023-03-28 23:49:12',31,521,3,NULL),(113,14,56,96,3,10,'0','openAccess',1,'2023-03-28 23:48:56','2023-03-28 23:49:06',31,521,3,NULL),(114,15,62,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:49:52','2023-03-28 23:49:52',32,NULL,NULL,NULL),(115,15,63,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:49:53','2023-03-28 23:49:53',32,NULL,NULL,NULL),(116,15,64,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:49:54','2023-03-28 23:49:54',32,NULL,NULL,NULL),(117,15,64,116,3,4,NULL,NULL,NULL,'2023-03-28 23:50:28','2023-03-28 23:50:28',32,523,17,NULL),(118,15,63,115,3,4,NULL,NULL,NULL,'2023-03-28 23:50:28','2023-03-28 23:50:28',32,523,17,NULL),(119,15,62,114,3,4,NULL,NULL,NULL,'2023-03-28 23:50:29','2023-03-28 23:50:29',32,523,17,NULL),(120,16,65,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:50:45','2023-03-28 23:50:45',33,NULL,NULL,NULL),(121,16,66,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:50:46','2023-03-28 23:50:46',33,NULL,NULL,NULL),(122,16,67,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:50:47','2023-03-28 23:50:47',33,NULL,NULL,NULL),(123,16,68,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:50:48','2023-03-28 23:50:48',33,NULL,NULL,NULL),(124,16,69,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:50:49','2023-03-28 23:50:49',33,NULL,NULL,NULL),(125,16,69,124,3,4,NULL,NULL,NULL,'2023-03-28 23:51:39','2023-03-28 23:51:39',33,523,18,NULL),(126,16,68,123,3,4,NULL,NULL,NULL,'2023-03-28 23:51:39','2023-03-28 23:51:39',33,523,18,NULL),(127,16,67,122,3,4,NULL,NULL,NULL,'2023-03-28 23:51:39','2023-03-28 23:51:39',33,523,18,NULL),(128,16,66,121,3,4,NULL,NULL,NULL,'2023-03-28 23:51:39','2023-03-28 23:51:39',33,523,18,NULL),(129,16,65,120,3,4,NULL,NULL,NULL,'2023-03-28 23:51:40','2023-03-28 23:51:40',33,523,18,NULL),(130,17,70,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:52:33','2023-03-28 23:52:33',34,NULL,NULL,NULL),(131,17,71,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:52:34','2023-03-28 23:52:34',34,NULL,NULL,NULL),(132,17,72,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:52:35','2023-03-28 23:52:35',34,NULL,NULL,NULL),(133,17,73,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:52:36','2023-03-28 23:52:36',34,NULL,NULL,NULL),(134,17,74,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:52:37','2023-03-28 23:52:37',34,NULL,NULL,NULL),(135,17,75,NULL,3,2,NULL,NULL,NULL,'2023-03-28 23:52:38','2023-03-28 23:52:39',34,NULL,NULL,NULL),(136,17,75,135,3,19,NULL,NULL,NULL,'2023-03-28 23:53:45','2023-03-28 23:53:45',34,523,19,NULL),(137,17,73,133,3,19,NULL,NULL,NULL,'2023-03-28 23:53:45','2023-03-28 23:53:45',34,523,19,NULL),(138,17,72,132,3,19,NULL,NULL,NULL,'2023-03-28 23:53:45','2023-03-28 23:53:45',34,523,19,NULL),(139,17,70,130,3,19,NULL,NULL,NULL,'2023-03-28 23:53:45','2023-03-28 23:53:45',34,523,19,NULL),(140,17,71,131,3,19,NULL,NULL,NULL,'2023-03-28 23:53:45','2023-03-28 23:53:45',34,523,19,NULL),(141,17,74,134,3,19,NULL,NULL,NULL,'2023-03-28 23:53:45','2023-03-28 23:53:45',34,523,19,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='A list of all keywords used in the search index';
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
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8 COMMENT='Relationships between search objects and keywords in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_object_keywords`
--

LOCK TABLES `submission_search_object_keywords` WRITE;
/*!40000 ALTER TABLE `submission_search_object_keywords` DISABLE KEYS */;
INSERT INTO `submission_search_object_keywords` VALUES (131,9,1,0),(132,9,2,1),(133,9,3,2),(134,9,4,3),(135,9,5,4),(136,10,6,0),(137,10,7,1),(138,10,8,2),(139,10,9,3),(140,10,10,4),(141,10,11,5),(142,11,7,0),(143,11,12,1),(144,11,13,2),(145,11,14,3),(146,11,15,4),(147,11,16,5),(148,11,17,6),(149,11,18,7),(150,11,7,8),(151,11,19,9),(152,11,20,10),(153,11,21,11),(154,11,22,12),(155,11,2,13),(156,11,23,14),(157,11,10,15),(158,11,11,16),(159,11,24,17),(160,11,7,18),(161,11,25,19),(162,11,26,20),(163,11,27,21),(164,11,28,22),(165,11,29,23),(166,11,30,24),(167,11,31,25),(168,11,32,26),(169,11,33,27),(170,11,6,28),(171,11,7,29),(172,11,34,30),(173,11,35,31),(174,11,36,32),(175,11,37,33),(176,11,38,34),(177,11,39,35),(178,11,40,36),(179,11,41,37),(180,11,42,38),(181,11,43,39),(182,11,44,40),(183,11,45,41),(184,11,46,42),(185,11,7,43),(186,11,12,44),(187,11,13,45),(188,13,47,0),(189,13,48,1),(190,13,49,2),(191,13,50,3),(192,13,48,4),(193,13,51,5),(194,13,52,6),(195,13,48,7),(196,17,53,0),(197,17,54,1),(198,17,3,2),(199,17,55,3),(200,17,56,4),(201,17,57,5),(202,17,58,6),(203,17,3,7),(204,17,53,8),(205,17,59,9),(206,17,3,10),(207,17,60,11),(208,18,61,0),(209,18,62,1),(210,18,63,2),(211,18,64,3),(212,18,65,4),(213,18,66,5),(214,18,67,6),(215,19,61,0),(216,19,62,1),(217,19,68,2),(218,19,63,3),(219,19,64,4),(220,19,65,5),(221,19,69,6),(222,19,70,7),(223,19,71,8),(224,19,72,9),(225,19,73,10),(226,19,66,11),(227,19,74,12),(228,19,67,13),(229,19,75,14),(230,19,76,15),(231,19,77,16),(232,19,63,17),(233,19,64,18),(234,19,65,19),(235,19,78,20),(236,19,64,21),(237,19,65,22),(238,19,61,23),(239,19,62,24),(240,19,79,25),(241,19,80,26),(242,19,81,27),(243,19,82,28),(244,19,83,29),(245,19,84,30),(246,19,85,31),(247,19,86,32),(248,19,87,33),(249,19,88,34),(250,19,89,35),(251,19,90,36),(252,19,91,37),(253,19,92,38),(254,19,93,39),(255,19,94,40),(256,19,95,41),(257,19,96,42),(258,19,97,43),(259,19,98,44),(260,19,99,45),(261,19,100,46),(262,19,101,47),(263,19,84,48),(264,19,102,49),(265,19,103,50),(266,19,93,51),(267,19,104,52),(268,19,66,53),(269,19,67,54),(270,19,105,55),(271,19,106,56),(272,19,45,57),(273,19,96,58),(274,19,107,59),(275,19,108,60),(276,19,109,61),(277,21,110,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='A list of all search objects indexed in the search index';
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
  `setting_value` mediumtext,
  PRIMARY KEY (`submission_setting_id`),
  UNIQUE KEY `submission_settings_unique` (`submission_id`,`locale`,`setting_name`),
  KEY `submission_settings_submission_id` (`submission_id`),
  CONSTRAINT `submission_settings_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Localized data about submissions';
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
  `stage_id` bigint(20) NOT NULL DEFAULT '1',
  `locale` varchar(14) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  `submission_progress` varchar(50) NOT NULL DEFAULT 'start',
  `work_type` smallint(6) DEFAULT '0',
  PRIMARY KEY (`submission_id`),
  KEY `submissions_context_id` (`context_id`),
  KEY `submissions_publication_id` (`current_publication_id`),
  CONSTRAINT `submissions_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `submissions_publication_id` FOREIGN KEY (`current_publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='All submissions submitted to the context, including incomplete, declined and unpublished submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,1,1,'2023-03-28 23:23:34','2023-03-28 23:22:53','2023-03-28 23:22:53',4,'en',1,'',0),(2,1,2,'2023-03-28 23:26:56','2023-03-28 23:26:00','2023-03-28 23:26:00',3,'en',1,'',1),(3,1,3,'2023-03-28 23:27:53','2023-03-28 23:27:53','2023-03-28 23:27:53',1,'en',1,'',0),(4,1,4,'2023-03-28 23:30:12','2023-03-28 23:28:42','2023-03-28 23:28:42',5,'en',1,'',0),(5,1,5,'2023-03-28 23:33:36','2023-03-28 23:31:16','2023-03-28 23:31:16',5,'en',3,'',0),(6,1,6,'2023-03-28 23:35:10','2023-03-28 23:34:22','2023-03-28 23:34:22',2,'en',1,'',0),(7,1,7,'2023-03-28 23:37:10','2023-03-28 23:36:22','2023-03-28 23:36:22',4,'en',1,'',0),(8,1,8,'2023-03-28 23:37:26','2023-03-28 23:37:26','2023-03-28 23:37:26',1,'en',1,'',0),(9,1,9,'2023-03-28 23:38:41','2023-03-28 23:38:22','2023-03-28 23:38:22',2,'en',1,'',0),(10,1,10,'2023-03-28 23:40:28','2023-03-28 23:40:28','2023-03-28 23:40:28',1,'en',1,'',0),(11,1,11,'2023-03-28 23:42:29','2023-03-28 23:40:56','2023-03-28 23:40:56',4,'en',1,'',0),(12,1,12,'2023-03-28 23:44:09','2023-03-28 23:43:14','2023-03-28 23:43:14',2,'en',1,'',0),(13,1,13,'2023-03-28 23:46:26','2023-03-28 23:44:45','2023-03-28 23:44:45',4,'en',1,'',0),(14,1,14,'2023-03-28 23:49:38','2023-03-28 23:47:18','2023-03-28 23:47:18',5,'en',3,'',0),(15,1,15,'2023-03-28 23:50:29','2023-03-28 23:50:13','2023-03-28 23:50:13',3,'en',1,'',0),(16,1,16,'2023-03-28 23:52:19','2023-03-28 23:51:22','2023-03-28 23:51:22',3,'en',1,'',0),(17,1,17,'2023-03-28 23:54:04','2023-03-28 23:53:25','2023-03-28 23:53:25',2,'en',1,'',0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary files, e.g. where files are kept during an upload process before they are moved somewhere more appropriate.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary stats by institution. Data in this table is provisional. See the metrics_* tables for compiled stats.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary stats totals based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary stats on unique downloads based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary stats on unique views based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary stats for views and downloads from institutions based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary stats for unique title requests. Data in this table is provisional. See the metrics_* tables for compiled stats.';
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
  `setting_value` mediumtext,
  PRIMARY KEY (`user_group_setting_id`),
  UNIQUE KEY `user_group_settings_unique` (`user_group_id`,`locale`,`setting_name`),
  KEY `user_group_settings_user_group_id` (`user_group_id`),
  CONSTRAINT `user_group_settings_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COMMENT='More data about user groups, including localized properties such as the name.';
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='Which stages of the editorial workflow the user_groups can access.';
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
  `is_default` smallint(6) NOT NULL DEFAULT '0',
  `show_title` smallint(6) NOT NULL DEFAULT '1',
  `permit_self_registration` smallint(6) NOT NULL DEFAULT '0',
  `permit_metadata_edit` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_group_id`),
  KEY `user_groups_user_group_id` (`user_group_id`),
  KEY `user_groups_context_id` (`context_id`),
  KEY `user_groups_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='All defined user roles in a context, such as Author, Reviewer, Section Editor and Journal Manager.';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Associates users with user interests (which are stored in the controlled vocabulary tables).';
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
  `setting_value` mediumtext,
  PRIMARY KEY (`user_setting_id`),
  UNIQUE KEY `user_settings_unique` (`user_id`,`locale`,`setting_name`),
  KEY `user_settings_user_id` (`user_id`),
  KEY `user_settings_locale_setting_name_index` (`setting_name`,`locale`),
  CONSTRAINT `user_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8 COMMENT='More data about users, including localized properties like their name and affiliation.';
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='Maps users to their assigned user_groups.';
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
  `gossip` text,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime DEFAULT NULL,
  `must_change_password` smallint(6) DEFAULT NULL,
  `auth_id` bigint(20) DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` smallint(6) NOT NULL DEFAULT '0',
  `disabled_reason` text,
  `inline_help` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_username` (`username`),
  UNIQUE KEY `users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='All registered users, including authentication data and profile data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2y$10$4Jq9y41hNjG1bMqwkogTW.wYp9py9zotbknKkBKNjqouBqYdp2bQq','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,'[]',NULL,NULL,'2023-03-28 23:16:51',NULL,'2023-03-28 23:21:58',NULL,NULL,NULL,0,NULL,1),(2,'rvaca','$2y$10$xab8fUwBE4AYc25opCshkOibGBEslA2ZP8QGv6lhdGACNQLmegW56','rvaca@mailinator.com','','','',NULL,'MX','[]',NULL,NULL,'2023-03-28 23:18:38',NULL,'2023-03-28 23:21:25',0,NULL,NULL,0,NULL,1),(3,'dbarnes','$2y$10$/XPJhrI13uSerJD7LTRsI.771Qn5ofaxSt1gO3b7hz8dPcpJPh4pO','dbarnes@mailinator.com','','','',NULL,'AU','[]',NULL,NULL,'2023-03-28 23:18:44',NULL,'2023-03-28 23:53:27',0,NULL,NULL,0,NULL,1),(4,'dbuskins','$2y$10$PHDa06p8sTdah4rUd1mj3.CU4L5Ae6bbaztX12JxXvpL.nWTmqk4m','dbuskins@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2023-03-28 23:18:51',NULL,NULL,0,NULL,NULL,0,NULL,1),(5,'sberardo','$2y$10$1GuMNBotMwDB2NmkOcRo9Omeu.QEwCngIi0PjOPwHiKGEfMUK7OMy','sberardo@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2023-03-28 23:18:58',NULL,NULL,0,NULL,NULL,0,NULL,1),(6,'minoue','$2y$10$AerGK.xdY8uRZLWtVC9fXeViwt8RcQervsdIhAJFpQWcBXopi6vN6','minoue@mailinator.com','','','',NULL,'JP','[]',NULL,NULL,'2023-03-28 23:19:05',NULL,'2023-03-28 23:34:57',0,NULL,NULL,0,NULL,1),(7,'jjanssen','$2y$10$1AfO/ANTucEvMOw.D5WecOAxtdqcw3ZrWQdRCZOtXuWVHbOe8WCuG','jjanssen@mailinator.com','','','',NULL,'NL','[]',NULL,NULL,'2023-03-28 23:19:13',NULL,NULL,0,NULL,NULL,0,NULL,1),(8,'phudson','$2y$10$cYv/yJ4rRVz5OggkCk0.kO6xeLFtx0lFELxGj6L9sm.452DiwOZ92','phudson@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2023-03-28 23:19:21',NULL,'2023-03-28 23:43:59',0,NULL,NULL,0,NULL,1),(9,'amccrae','$2y$10$N2Nvla465uHom5G9i0JtKeGzX4CXhtCwXCUk2Shkv9TGPU6ajR64y','amccrae@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2023-03-28 23:19:30',NULL,NULL,0,NULL,NULL,0,NULL,1),(10,'agallego','$2y$10$K26206t.sTsMtnk2f22iZ.Uwao0Il0ma0qyuUNBtbNYpOCLszvT7e','agallego@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2023-03-28 23:19:39',NULL,'2023-03-28 23:52:08',0,NULL,NULL,0,NULL,1),(11,'alzacharia','$2y$10$r4XyeRLiQzrwPn/.G9epAujS2LVsarKmprTdf32P7hZidT9/3CWfa','alzacharia@mailinator.com','','','',NULL,'GH','[]',NULL,NULL,'2023-03-28 23:19:49',NULL,NULL,0,NULL,NULL,0,NULL,1),(12,'gfavio','$2y$10$wQUThLUAbEBX/Dk5.4HUyuwAf9hTKU00dVHwWR.V8DqZREeMtqGkW','gfavio@mailinator.com','','','',NULL,'ES','[]',NULL,NULL,'2023-03-28 23:19:59',NULL,'2023-03-28 23:45:56',0,NULL,NULL,0,NULL,1),(13,'mfritz','$2y$10$KPnVrGycZHsGTDsfien2IO0Vfk3ZY823lbeHW.AnynwQ6OebyqTsi','mfritz@mailinator.com','','','',NULL,'BE','[]',NULL,NULL,'2023-03-28 23:20:10',NULL,NULL,0,NULL,NULL,0,NULL,1),(14,'svogt','$2y$10$o1njl86fas25iQnGUkSoj.9b67ckUn/i3HwWc6vDen2LYzq8FHq/G','svogt@mailinator.com','','','',NULL,'CL','[]',NULL,NULL,'2023-03-28 23:20:21',NULL,NULL,0,NULL,NULL,0,NULL,1),(15,'gcox','$2y$10$nttJqSG24wGYrEdxkc8cLOYBWYlLv2hMnBO.YDgb/m43ebJDkwTh6','gcox@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2023-03-28 23:20:32',NULL,NULL,0,NULL,NULL,0,NULL,1),(16,'shellier','$2y$10$pwBr90.oqgMWzE233qSyWucuWHVkonZGOVXwmGVLzlEwIVBGSOXdu','shellier@mailinator.com','','','',NULL,'ZA','[]',NULL,NULL,'2023-03-28 23:20:44',NULL,NULL,0,NULL,NULL,0,NULL,1),(17,'cturner','$2y$10$zceiqnh3RXS4zl8X2Ti5AewvMBMnWuTYnHxNvKjizzDu.YyPidkrG','cturner@mailinator.com','','','',NULL,'GB','[]',NULL,NULL,'2023-03-28 23:20:57',NULL,NULL,0,NULL,NULL,0,NULL,1),(18,'skumar','$2y$10$HqoBg7Bah.WWc1dbViaRz.KiowG9EixNdpezu8BkDENkUfJZhFWG6','skumar@mailinator.com','','','',NULL,'SG','[]',NULL,NULL,'2023-03-28 23:21:10',NULL,NULL,0,NULL,NULL,0,NULL,1),(19,'aclark','$2y$10$zn6mt8mhXG2SNvXhaAxKu.6e3C6Zc1/9PeP4PM7QN/bLLVJGZZJQu','aclark@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-28 23:22:24',NULL,'2023-03-28 23:22:24',NULL,NULL,NULL,0,NULL,1),(20,'afinkel','$2y$10$CunI6BXZx.Gg65ZcRwk9d.qlUyQikQ24K0msTs4K2FxQ8aU7jTiRW','afinkel@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-28 23:23:42',NULL,'2023-03-28 23:23:42',NULL,NULL,NULL,0,NULL,1),(21,'bbarnetson','$2y$10$DFXmwl.hDBbj05clSi5DReswyETGWmn.2UFxOa62sc6KxYvWffV6K','bbarnetson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-28 23:27:05',NULL,'2023-03-28 23:27:05',NULL,NULL,NULL,0,NULL,1),(22,'bbeaty','$2y$10$WlFevd8CWroGP7SyFtc/QupUqh/RONyXHlmqVTL/8z/koBb5/f0j2','bbeaty@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-28 23:28:01',NULL,'2023-03-28 23:28:01',NULL,NULL,NULL,0,NULL,1),(23,'callan','$2y$10$NvaD79Hin5TM5FQdsiUjQe/Nw2nBUDI.yFN1ANQ6IJNiT3sN8z1J2','callan@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-28 23:30:19',NULL,'2023-03-28 23:30:19',NULL,NULL,NULL,0,NULL,1),(24,'dbernnard','$2y$10$thFRYPOX81xc0EPqbjAEuu4J4P1dRB8UQqcCZgFF./UGpQ9RC6IVC','dbernnard@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2023-03-28 23:33:43',NULL,'2023-03-28 23:33:43',NULL,NULL,NULL,0,NULL,1),(25,'dkennepohl','$2y$10$XnarA2pBDF/tQKk00nGHR.RwAZ.yXX0oWLs/.VVBiT7FFAWwRSW.e','dkennepohl@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-28 23:35:32',NULL,'2023-03-28 23:35:32',NULL,NULL,NULL,0,NULL,1),(26,'fperini','$2y$10$xCMsH99gJGNZrdxRRLX6sOashcpFr657jxAt8AKQTPq0Ftpw2C73m','fperini@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-28 23:37:32',NULL,'2023-03-28 23:37:32',NULL,NULL,NULL,0,NULL,1),(27,'jbrower','$2y$10$mHVDWy.aAEWe9nZbz6Mpbuzhqmtvqm4BBOQyOBI5lvSn6an/5SMpi','jbrower@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-28 23:38:53',NULL,'2023-03-28 23:38:53',NULL,NULL,NULL,0,NULL,1),(28,'jlockehart','$2y$10$a1qUsWaacUIODLQVNE6bSe2q/4UN339oGvrOm6TGMRKKIZcbOBFte','jlockehart@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-28 23:40:35',NULL,'2023-03-28 23:40:36',NULL,NULL,NULL,0,NULL,1),(29,'lelder','$2y$10$cWaosdPf8mhPatS0cEwKYOQITPs0jgq6xhsL.V0Isq2vlZ.RgUg82','lelder@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-28 23:42:41',NULL,'2023-03-28 23:42:41',NULL,NULL,NULL,0,NULL,1),(30,'mally','$2y$10$0PfD7UL6zIWmtS8YRS3e6.kucT/pCpEGdBiNCnju95IHL.W6JKTkW','mally@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-28 23:44:16',NULL,'2023-03-28 23:44:16',NULL,NULL,NULL,0,NULL,1),(31,'mdawson','$2y$10$u.Bd6E4wL/zDHzuYq4t4cO/zboV1ITaKvqjV./F5vD4lyqROhb942','mdawson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-28 23:46:37',NULL,'2023-03-28 23:46:38',NULL,NULL,NULL,0,NULL,1),(32,'mforan','$2y$10$YofIseyaEaam1fiL6M36NuN4NQK3Ym5jXp9i3pRdaxi11UjGuHb5O','mforan@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-28 23:49:45',NULL,'2023-03-28 23:49:46',NULL,NULL,NULL,0,NULL,1),(33,'mpower','$2y$10$4i8EEbDcwaScywQ/tc81W.Xp8dekUL/lrZYQtgTEJAfYV6djw6Wte','mpower@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-28 23:50:38',NULL,'2023-03-28 23:50:39',NULL,NULL,NULL,0,NULL,1),(34,'msmith','$2y$10$kdKkjv.4K8vV6T9AfyNBYuiOyW4utLRdO3ES5bgS9WUBu5d.uDony','msmith@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-28 23:52:26',NULL,'2023-03-28 23:52:26',NULL,NULL,NULL,0,NULL,1);
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
  `major` int(11) NOT NULL DEFAULT '0' COMMENT 'Major component of version number, e.g. the 2 in OJS 2.3.8-0',
  `minor` int(11) NOT NULL DEFAULT '0' COMMENT 'Minor component of version number, e.g. the 3 in OJS 2.3.8-0',
  `revision` int(11) NOT NULL DEFAULT '0' COMMENT 'Revision component of version number, e.g. the 8 in OJS 2.3.8-0',
  `build` int(11) NOT NULL DEFAULT '0' COMMENT 'Build component of version number, e.g. the 0 in OJS 2.3.8-0',
  `date_installed` datetime NOT NULL,
  `current` smallint(6) NOT NULL DEFAULT '0' COMMENT '1 iff the version entry being described is currently active. This permits the table to store past installation history for forensic purposes.',
  `product_type` varchar(30) DEFAULT NULL COMMENT 'Describes the type of product this row describes, e.g. "plugins.generic" (for a generic plugin) or "core" for the application itelf',
  `product` varchar(30) DEFAULT NULL COMMENT 'Uniquely identifies the product this version row describes, e.g. "ojs2" for OJS 2.x, "languageToggle" for the language toggle block plugin, etc.',
  `product_class_name` varchar(80) DEFAULT NULL COMMENT 'Specifies the class name associated with this product, for plugins, or the empty string where not applicable.',
  `lazy_load` smallint(6) NOT NULL DEFAULT '0' COMMENT '1 iff the row describes a lazy-load plugin; 0 otherwise',
  `sitewide` smallint(6) NOT NULL DEFAULT '0' COMMENT '1 iff the row describes a site-wide plugin; 0 otherwise',
  PRIMARY KEY (`version_id`),
  UNIQUE KEY `versions_unique` (`product_type`,`product`,`major`,`minor`,`revision`,`build`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='Describes the installation and upgrade version history for the application and all installed plugins.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,1,0,0,0,'2023-03-28 23:16:52',1,'plugins.metadata','dc11','',0,0),(2,1,0,0,0,'2023-03-28 23:16:52',1,'plugins.pubIds','urn','\\APP\\plugins\\pubIds\\urn\\URNPubIdPlugin',0,0),(3,1,0,0,0,'2023-03-28 23:16:52',1,'plugins.blocks','browse','\\APP\\plugins\\blocks\\browse\\BrowseBlockPlugin',1,0),(4,1,0,0,0,'2023-03-28 23:16:52',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(5,1,0,0,0,'2023-03-28 23:16:52',1,'plugins.blocks','makeSubmission','MakeSubmissionBlockPlugin',1,0),(6,1,0,0,0,'2023-03-28 23:16:52',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(7,1,0,0,0,'2023-03-28 23:16:52',1,'plugins.blocks','information','InformationBlockPlugin',1,0),(8,1,0,0,0,'2023-03-28 23:16:52',1,'plugins.generic','usageEvent','',0,1),(9,1,0,0,0,'2023-03-28 23:16:52',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(10,1,3,0,0,'2023-03-28 23:16:52',1,'plugins.generic','acron','AcronPlugin',1,1),(11,1,0,0,0,'2023-03-28 23:16:52',1,'plugins.generic','dublinCoreMeta','DublinCoreMetaPlugin',1,0),(12,1,0,0,0,'2023-03-28 23:16:52',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(13,1,0,0,0,'2023-03-28 23:16:52',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(14,1,2,0,0,'2023-03-28 23:16:52',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(15,1,0,0,0,'2023-03-28 23:16:52',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(16,1,0,0,0,'2023-03-28 23:16:52',1,'plugins.generic','htmlMonographFile','HtmlMonographFilePlugin',1,0),(17,1,0,0,0,'2023-03-28 23:16:52',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(18,1,2,0,0,'2023-03-28 23:16:52',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),(19,0,1,0,0,'2023-03-28 23:16:52',1,'plugins.generic','citationStyleLanguage','CitationStyleLanguagePlugin',1,0),(20,1,0,0,0,'2023-03-28 23:16:52',1,'plugins.themes','default','DefaultThemePlugin',1,0),(21,1,0,0,0,'2023-03-28 23:16:52',1,'plugins.importexport','users','',0,0),(22,1,0,0,0,'2023-03-28 23:16:52',1,'plugins.importexport','onix30','',0,0),(23,1,0,0,0,'2023-03-28 23:16:52',1,'plugins.importexport','csv','',0,0),(24,1,0,0,0,'2023-03-28 23:16:52',1,'plugins.importexport','native','',0,0),(25,1,0,0,0,'2023-03-28 23:16:52',1,'plugins.oaiMetadataFormats','dc','',0,0),(26,1,0,0,0,'2023-03-28 23:16:52',1,'plugins.paymethod','manual','',0,0),(27,1,0,0,0,'2023-03-28 23:16:52',1,'plugins.paymethod','paypal','',0,0),(28,2,0,1,0,'2023-03-28 23:16:52',1,'plugins.reports','reviewReport','',0,0),(29,1,0,0,0,'2023-03-28 23:16:52',1,'plugins.reports','monographReport','',0,0),(30,3,4,0,0,'2023-03-28 23:16:43',1,'core','omp','',0,1);
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

-- Dump completed on 2023-03-28 23:54:08
