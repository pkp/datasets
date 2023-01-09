-- MySQL dump 10.13  Distrib 5.7.39, for Linux (x86_64)
--
-- Host: localhost    Database: omp-ci
-- ------------------------------------------------------
-- Server version	5.7.39-0ubuntu0.18.04.2

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `announcement_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) DEFAULT NULL,
  UNIQUE KEY `announcement_settings_pkey` (`announcement_id`,`locale`,`setting_name`),
  KEY `announcement_settings_announcement_id` (`announcement_id`),
  CONSTRAINT `announcement_settings_announcement_id_foreign` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`announcement_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `announcement_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `announcement_type_settings_type_id` (`type_id`),
  CONSTRAINT `announcement_type_settings_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `announcement_types` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `author_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  UNIQUE KEY `author_settings_pkey` (`author_id`,`locale`,`setting_name`),
  KEY `author_settings_author_id` (`author_id`),
  CONSTRAINT `author_settings_author_id` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_settings`
--

LOCK TABLES `author_settings` WRITE;
/*!40000 ALTER TABLE `author_settings` DISABLE KEYS */;
INSERT INTO `author_settings` VALUES (1,'','country','CA'),(1,'en_US','affiliation','University of Calgary'),(1,'en_US','familyName','Clark'),(1,'en_US','givenName','Arthur'),(2,'','country','CA'),(2,'en_US','affiliation','Athabasca University'),(2,'en_US','familyName','Finkel'),(2,'en_US','givenName','Alvin'),(3,'','country','CA'),(3,'','isVolumeEditor','0'),(3,'en_US','familyName','Carter'),(3,'en_US','givenName','Sarah'),(3,'fr_CA','familyName',NULL),(3,'fr_CA','givenName',NULL),(4,'','country','CA'),(4,'','isVolumeEditor','0'),(4,'en_US','affiliation',NULL),(4,'en_US','biography',NULL),(4,'en_US','familyName','Fortna'),(4,'en_US','givenName','Peter'),(4,'en_US','preferredPublicName',NULL),(4,'fr_CA','affiliation',NULL),(4,'fr_CA','biography',NULL),(4,'fr_CA','familyName',NULL),(4,'fr_CA','givenName',NULL),(4,'fr_CA','preferredPublicName',NULL),(5,'','country','CA'),(5,'','isVolumeEditor','0'),(5,'en_US','affiliation',NULL),(5,'en_US','biography',NULL),(5,'en_US','familyName','Friesen'),(5,'en_US','givenName','Gerald'),(5,'en_US','preferredPublicName',NULL),(5,'fr_CA','affiliation',NULL),(5,'fr_CA','biography',NULL),(5,'fr_CA','familyName',NULL),(5,'fr_CA','givenName',NULL),(5,'fr_CA','preferredPublicName',NULL),(6,'','country','CA'),(6,'','isVolumeEditor','0'),(6,'en_US','affiliation',NULL),(6,'en_US','biography',NULL),(6,'en_US','familyName','Dick'),(6,'en_US','givenName','Lyle'),(6,'en_US','preferredPublicName',NULL),(6,'fr_CA','affiliation',NULL),(6,'fr_CA','biography',NULL),(6,'fr_CA','familyName',NULL),(6,'fr_CA','givenName',NULL),(6,'fr_CA','preferredPublicName',NULL),(7,'','country','CA'),(7,'','isVolumeEditor','0'),(7,'en_US','affiliation',NULL),(7,'en_US','biography',NULL),(7,'en_US','familyName','Wheeler'),(7,'en_US','givenName','Winona'),(7,'en_US','preferredPublicName',NULL),(7,'fr_CA','affiliation',NULL),(7,'fr_CA','biography',NULL),(7,'fr_CA','familyName',NULL),(7,'fr_CA','givenName',NULL),(7,'fr_CA','preferredPublicName',NULL),(8,'','country','CA'),(8,'','isVolumeEditor','0'),(8,'en_US','affiliation',NULL),(8,'en_US','biography',NULL),(8,'en_US','familyName','Dyce'),(8,'en_US','givenName','Matt'),(8,'en_US','preferredPublicName',NULL),(8,'fr_CA','affiliation',NULL),(8,'fr_CA','biography',NULL),(8,'fr_CA','familyName',NULL),(8,'fr_CA','givenName',NULL),(8,'fr_CA','preferredPublicName',NULL),(9,'','country','CA'),(9,'','isVolumeEditor','0'),(9,'en_US','affiliation',NULL),(9,'en_US','biography',NULL),(9,'en_US','familyName','Opp'),(9,'en_US','givenName','James'),(9,'en_US','preferredPublicName',NULL),(9,'fr_CA','affiliation',NULL),(9,'fr_CA','biography',NULL),(9,'fr_CA','familyName',NULL),(9,'fr_CA','givenName',NULL),(9,'fr_CA','preferredPublicName',NULL),(11,'','country','CA'),(11,'en_US','affiliation','Athabasca University'),(11,'en_US','familyName','Barnetson'),(11,'en_US','givenName','Bob'),(12,'','country','CA'),(12,'en_US','affiliation','University of British Columbia'),(12,'en_US','familyName','Beaty'),(12,'en_US','givenName','Bart'),(13,'','country','CA'),(13,'en_US','affiliation','University of Alberta'),(13,'en_US','familyName','Miller'),(13,'en_US','givenName','Toby'),(14,'','country','CA'),(14,'en_US','affiliation','Athabasca University'),(14,'en_US','familyName','Wagman'),(14,'en_US','givenName','Ira'),(15,'','country','CA'),(15,'en_US','affiliation','University of Calgary'),(15,'en_US','familyName','Straw'),(15,'en_US','givenName','Will'),(16,'','country','CA'),(16,'en_US','affiliation','University of Southern California'),(16,'en_US','familyName','Allan'),(16,'en_US','givenName','Chantal'),(17,'','country','US'),(17,'en_US','affiliation','SUNY'),(17,'en_US','familyName','Bernnard'),(17,'en_US','givenName','Deborah'),(18,'','country','US'),(18,'en_US','affiliation','SUNY'),(18,'en_US','familyName','Bobish'),(18,'en_US','givenName','Greg'),(19,'','country','US'),(19,'en_US','affiliation','SUNY'),(19,'en_US','familyName','Bullis'),(19,'en_US','givenName','Daryl'),(20,'','country','US'),(20,'en_US','affiliation','SUNY'),(20,'en_US','familyName','Hecker'),(20,'en_US','givenName','Jenna'),(21,'','country','CA'),(21,'en_US','affiliation','Athabasca University'),(21,'en_US','familyName','Kennepohl'),(21,'en_US','givenName','Dietmar'),(22,'','country','CA'),(22,'en_US','affiliation','University of Calgary'),(22,'en_US','familyName','Anderson'),(22,'en_US','givenName','Terry'),(23,'','country','CA'),(23,'en_US','affiliation','University of Alberta'),(23,'en_US','familyName','Gorsky'),(23,'en_US','givenName','Paul'),(24,'','country','CA'),(24,'en_US','affiliation','Athabasca University'),(24,'en_US','familyName','Parchoma'),(24,'en_US','givenName','Gale'),(25,'','country','CA'),(25,'en_US','affiliation','University of Alberta'),(25,'en_US','familyName','Palmer'),(25,'en_US','givenName','Stuart'),(26,'','country','CA'),(26,'en_US','affiliation','University of Sussex'),(26,'en_US','familyName','Perini'),(26,'en_US','givenName','Fernando'),(27,'','country','GB'),(27,'en_US','familyName','Mansell'),(27,'en_US','givenName','Robin'),(28,'','country','AR'),(28,'en_US','familyName','Galperin'),(28,'en_US','givenName','Hernan'),(29,'','country','CL'),(29,'en_US','familyName','Bello'),(29,'en_US','givenName','Pablo'),(30,'','country','AR'),(30,'en_US','familyName','Rabinovich'),(30,'en_US','givenName','Eleonora'),(31,'','country','CA'),(31,'en_US','affiliation','Buffalo National Park Foundation'),(31,'en_US','familyName','Brower'),(31,'en_US','givenName','Jennifer'),(32,'','country','CA'),(32,'en_US','affiliation','University of Alberta'),(32,'en_US','familyName','Locke Hart'),(32,'en_US','givenName','Jonathan'),(33,'','country','CA'),(33,'en_US','affiliation','International Development Research Centre'),(33,'en_US','familyName','Elder'),(33,'en_US','givenName','Laurent'),(34,'','country','CA'),(34,'en_US','familyName','Emdon'),(34,'en_US','givenName','Heloise'),(35,'','country','CA'),(35,'en_US','familyName','Tulus'),(35,'en_US','givenName','Frank'),(36,'','country','AR'),(36,'en_US','familyName','Hyma'),(36,'en_US','givenName','Raymond'),(37,'','country','CA'),(37,'en_US','familyName','Valk'),(37,'en_US','givenName','John'),(38,'','country','CA'),(38,'en_US','familyName','Fourati'),(38,'en_US','givenName','Khaled'),(39,'','country','CA'),(39,'en_US','familyName','de Beer'),(39,'en_US','givenName','Jeremy'),(40,'','country','CA'),(40,'en_US','familyName','Bannerman'),(40,'en_US','givenName','Sara'),(41,'','country','CA'),(41,'en_US','affiliation','Athabasca University'),(41,'en_US','familyName','Ally'),(41,'en_US','givenName','Mohamed'),(42,'','country','GB'),(42,'en_US','familyName','Traxler'),(42,'en_US','givenName','John'),(43,'','country','CA'),(43,'en_US','familyName','Koole'),(43,'en_US','givenName','Marguerite'),(44,'','country','NO'),(44,'en_US','familyName','Rekkedal'),(44,'en_US','givenName','Torstein'),(45,'','country','CA'),(45,'en_US','affiliation','University of Alberta'),(45,'en_US','familyName','Dawson'),(45,'en_US','givenName','Michael'),(46,'','country','CA'),(46,'en_US','affiliation','Athabasca University'),(46,'en_US','familyName','Dupuis'),(46,'en_US','givenName','Brian'),(47,'','country','CA'),(47,'en_US','affiliation','University of Calgary'),(47,'en_US','familyName','Wilson'),(47,'en_US','givenName','Michael'),(48,'','country','CA'),(48,'en_US','affiliation','University of Calgary'),(48,'en_US','familyName','Foran'),(48,'en_US','givenName','Max'),(49,'','country','CA'),(49,'en_US','affiliation','London School of Economics'),(49,'en_US','familyName','Power'),(49,'en_US','givenName','Michael'),(50,'','country','CA'),(50,'en_US','affiliation','International Development Research Centre'),(50,'en_US','familyName','Smith'),(50,'en_US','givenName','Matthew'),(51,'','country','US'),(51,'en_US','familyName','Benkler'),(51,'en_US','givenName','Yochai'),(52,'','country','CA'),(52,'en_US','familyName','Reilly'),(52,'en_US','givenName','Katherine'),(53,'','country','US'),(53,'en_US','familyName','Loudon'),(53,'en_US','givenName','Melissa'),(54,'','country','SA'),(54,'en_US','familyName','Rivett'),(54,'en_US','givenName','Ulrike'),(55,'','country','GB'),(55,'en_US','familyName','Graham'),(55,'en_US','givenName','Mark'),(56,'','country','NO'),(56,'en_US','familyName','Haarstad'),(56,'en_US','givenName','Håvard'),(57,'','country','US'),(57,'en_US','familyName','Smith'),(57,'en_US','givenName','Marshall');
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
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
  `category_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  UNIQUE KEY `category_settings_pkey` (`category_id`,`locale`,`setting_name`),
  KEY `category_settings_category_id` (`category_id`),
  CONSTRAINT `category_settings_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_settings`
--

LOCK TABLES `category_settings` WRITE;
/*!40000 ALTER TABLE `category_settings` DISABLE KEYS */;
INSERT INTO `category_settings` VALUES (1,'','sortOption','title-ASC'),(1,'en_US','description',''),(1,'en_US','title','Applied Science'),(1,'fr_CA','description',''),(1,'fr_CA','title',''),(2,'','sortOption','title-ASC'),(2,'en_US','description',''),(2,'en_US','title','Computer Science'),(2,'fr_CA','description',''),(2,'fr_CA','title',''),(3,'','sortOption','title-ASC'),(3,'en_US','description',''),(3,'en_US','title','Engineering'),(3,'fr_CA','description',''),(3,'fr_CA','title',''),(4,'','sortOption','title-ASC'),(4,'en_US','description',''),(4,'en_US','title','Social Sciences'),(4,'fr_CA','description',''),(4,'fr_CA','title',''),(5,'','sortOption','title-ASC'),(5,'en_US','description',''),(5,'en_US','title','Sociology'),(5,'fr_CA','description',''),(5,'fr_CA','title',''),(6,'','sortOption','title-ASC'),(6,'en_US','description',''),(6,'en_US','title','Anthropology'),(6,'fr_CA','description',''),(6,'fr_CA','title','');
/*!40000 ALTER TABLE `category_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citation_settings`
--

DROP TABLE IF EXISTS `citation_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citation_settings` (
  `citation_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `citation_settings_pkey` (`citation_id`,`locale`,`setting_name`),
  KEY `citation_settings_citation_id` (`citation_id`),
  CONSTRAINT `citation_settings_citation_id` FOREIGN KEY (`citation_id`) REFERENCES `citations` (`citation_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
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
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`),
  CONSTRAINT `c_v_e_s_entry_id` FOREIGN KEY (`controlled_vocab_entry_id`) REFERENCES `controlled_vocab_entries` (`controlled_vocab_entry_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entry_settings`
--

LOCK TABLES `controlled_vocab_entry_settings` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entry_settings` VALUES (1,'en_US','submissionKeyword','Business & Economics','string'),(2,'en_US','submissionKeyword','Political & International Studies','string'),(3,'en_US','submissionKeyword','Canadian Studies','string'),(4,'en_US','submissionKeyword','Communication & Cultural Studies','string'),(14,'en_US','submissionKeyword','Canadian Studies','string'),(15,'en_US','submissionKeyword','Communication & Cultural Studies','string'),(16,'en_US','submissionKeyword','Political & International Studies','string'),(17,'en_US','submissionKeyword','information literacy','string'),(18,'en_US','submissionKeyword','academic libraries','string'),(19,'en_US','submissionKeyword','Education','string'),(20,'en_US','submissionKeyword','Information','string'),(21,'en_US','submissionKeyword','society','string'),(22,'en_US','submissionKeyword','ICT','string'),(23,'en_US','submissionKeyword','Biography & Memoir','string'),(24,'en_US','submissionKeyword','Environmental Studies','string'),(25,'en_US','submissionKeyword','Political & International Studies','string'),(26,'en_US','submissionKeyword','International Development','string'),(27,'en_US','submissionKeyword','ICT','string'),(28,'en_US','submissionKeyword','Educational Technology','string'),(30,'en_US','submissionKeyword','Psychology','string'),(31,'en_US','submissionKeyword','International Development','string'),(32,'en_US','submissionKeyword','ICT','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
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
  `tombstone_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `data_object_tombstone_settings_pkey` (`tombstone_id`,`locale`,`setting_name`),
  KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`),
  CONSTRAINT `data_object_tombstone_settings_tombstone_id` FOREIGN KEY (`tombstone_id`) REFERENCES `data_object_tombstones` (`tombstone_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
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
  `doi_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  UNIQUE KEY `doi_settings_pkey` (`doi_id`,`locale`,`setting_name`),
  KEY `doi_settings_doi_id` (`doi_id`),
  CONSTRAINT `doi_settings_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
INSERT INTO `edit_decisions` VALUES (1,1,NULL,1,NULL,3,18,'2023-01-09 23:25:18'),(2,1,1,3,1,3,2,'2023-01-09 23:25:35'),(3,2,NULL,1,NULL,3,18,'2023-01-09 23:28:20'),(4,4,NULL,1,NULL,3,1,'2023-01-09 23:30:49'),(5,4,3,2,1,3,3,'2023-01-09 23:31:07'),(6,4,4,3,1,3,2,'2023-01-09 23:31:25'),(7,4,NULL,4,NULL,3,7,'2023-01-09 23:31:43'),(8,5,NULL,1,NULL,3,1,'2023-01-09 23:33:23'),(9,5,5,2,1,3,3,'2023-01-09 23:33:43'),(10,5,6,3,1,3,2,'2023-01-09 23:34:02'),(11,5,NULL,4,NULL,3,7,'2023-01-09 23:34:21'),(12,6,NULL,1,NULL,3,1,'2023-01-09 23:36:29'),(13,6,7,2,1,6,23,'2023-01-09 23:37:07'),(14,7,NULL,1,NULL,3,18,'2023-01-09 23:38:37'),(15,7,8,3,1,3,2,'2023-01-09 23:38:56'),(16,9,NULL,1,NULL,3,1,'2023-01-09 23:40:39'),(17,11,NULL,1,NULL,3,1,'2023-01-09 23:43:11'),(18,11,10,2,1,3,3,'2023-01-09 23:43:26'),(19,11,11,3,1,3,2,'2023-01-09 23:44:27'),(20,12,NULL,1,NULL,3,1,'2023-01-09 23:45:28'),(21,13,NULL,1,NULL,3,1,'2023-01-09 23:47:01'),(22,13,13,2,1,3,3,'2023-01-09 23:47:18'),(23,13,14,3,1,3,2,'2023-01-09 23:48:31'),(24,14,NULL,1,NULL,3,1,'2023-01-09 23:49:47'),(25,14,15,2,1,3,3,'2023-01-09 23:50:06'),(26,14,16,3,1,3,2,'2023-01-09 23:50:24'),(27,14,NULL,4,NULL,3,7,'2023-01-09 23:50:42'),(28,15,NULL,1,NULL,3,18,'2023-01-09 23:52:52'),(29,16,NULL,1,NULL,3,18,'2023-01-09 23:54:12'),(30,17,NULL,1,NULL,3,1,'2023-01-09 23:56:28');
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
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
INSERT INTO `email_log` VALUES (1,1048585,1,0,'2023-01-09 23:25:05',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/1\">The ABCs of Human Survival: A Paradigm for Global Citizenship</a><br />Arthur Clark</p><p><b>Abstract</b></p>The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities―and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(2,1048585,1,0,'2023-01-09 23:25:05',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/1\">The ABCs of Human Survival: A Paradigm for Global Citizenship</a><br />Arthur Clark</p><p><b>Abstract</b></p>The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities―and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(3,1048585,1,0,'2023-01-09 23:25:05',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/1\">The ABCs of Human Survival: A Paradigm for Global Citizenship</a><br />Arthur Clark</p><p><b>Abstract</b></p>The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities―and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(4,1048585,1,0,'2023-01-09 23:25:05',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Arthur Clark,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/1</p><p>If you have been logged out, you can login again with the username aclark.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p>{$signature}'),(5,1048585,1,3,'2023-01-09 23:25:18',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>','','','Your submission has been sent for review','<p>Dear Arthur Clark,</p><p>I am pleased to inform you that an editor has reviewed your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(6,1048585,1,3,'2023-01-09 23:25:35',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Arthur Clark,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(7,1048585,2,0,'2023-01-09 23:27:53',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">The West and Beyond: New Perspectives on an Imagined Region</a><br />Alvin Finkel, Sarah Carter, Peter Fortna, Gerald Friesen, Lyle Dick, Winona Wheeler, Matt Dyce, James Opp</p><p><b>Abstract</b></p><p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p><p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(8,1048585,2,0,'2023-01-09 23:27:53',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">The West and Beyond: New Perspectives on an Imagined Region</a><br />Alvin Finkel, Sarah Carter, Peter Fortna, Gerald Friesen, Lyle Dick, Winona Wheeler, Matt Dyce, James Opp</p><p><b>Abstract</b></p><p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p><p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(9,1048585,2,0,'2023-01-09 23:27:53',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">The West and Beyond: New Perspectives on an Imagined Region</a><br />Alvin Finkel, Sarah Carter, Peter Fortna, Gerald Friesen, Lyle Dick, Winona Wheeler, Matt Dyce, James Opp</p><p><b>Abstract</b></p><p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p><p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(10,1048585,2,0,'2023-01-09 23:27:53',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Alvin Finkel\" <afinkel@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Alvin Finkel,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The West and Beyond: New Perspectives on an Imagined Region, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/2</p><p>If you have been logged out, you can login again with the username afinkel.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/2\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p>{$signature}'),(11,1048585,2,0,'2023-01-09 23:27:53',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Sarah Carter\" <scarter@mailinator.com>, \"Peter Fortna\" <pfortna@mailinator.com>, \"Gerald Friesen\" <gfriesen@mailinator.com>, \"Lyle Dick\" <ldick@mailinator.com>, \"Winona Wheeler\" <wwheeler@mailinator.com>, \"Matt Dyce\" <mdyce@mailinator.com>, \"James Opp\" <jopp@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nAlvin Finkel has submitted the manuscript, &quot;The West and Beyond: New Perspectives on an Imagined Region&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(12,1048585,2,3,'2023-01-09 23:28:20',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Alvin Finkel\" <afinkel@mailinator.com>','','','Your submission has been sent for review','<p>Dear Alvin Finkel,</p><p>I am pleased to inform you that an editor has reviewed your submission, The West and Beyond: New Perspectives on an Imagined Region, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(13,1048585,3,0,'2023-01-09 23:29:44',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">The Political Economy of Workplace Injury in Canada</a><br />Bob Barnetson</p><p><b>Abstract</b></p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(14,1048585,3,0,'2023-01-09 23:29:44',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">The Political Economy of Workplace Injury in Canada</a><br />Bob Barnetson</p><p><b>Abstract</b></p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(15,1048585,3,0,'2023-01-09 23:29:44',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">The Political Economy of Workplace Injury in Canada</a><br />Bob Barnetson</p><p><b>Abstract</b></p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(16,1048585,3,0,'2023-01-09 23:29:44',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Bob Barnetson\" <bbarnetson@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Bob Barnetson,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The Political Economy of Workplace Injury in Canada, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/3</p><p>If you have been logged out, you can login again with the username bbarnetson.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/3\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p>{$signature}'),(17,1048585,4,0,'2023-01-09 23:30:33',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/4\">How Canadians Communicate: Contexts of Canadian Popular Culture</a><br />Bart Beaty, Toby Miller, Ira Wagman, Will Straw</p><p><b>Abstract</b></p>What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(18,1048585,4,0,'2023-01-09 23:30:34',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/4\">How Canadians Communicate: Contexts of Canadian Popular Culture</a><br />Bart Beaty, Toby Miller, Ira Wagman, Will Straw</p><p><b>Abstract</b></p>What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(19,1048585,4,0,'2023-01-09 23:30:34',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/4\">How Canadians Communicate: Contexts of Canadian Popular Culture</a><br />Bart Beaty, Toby Miller, Ira Wagman, Will Straw</p><p><b>Abstract</b></p>What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(20,1048585,4,0,'2023-01-09 23:30:34',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Bart Beaty,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/4</p><p>If you have been logged out, you can login again with the username bbeaty.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p>{$signature}'),(21,1048585,4,0,'2023-01-09 23:30:34',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Toby Miller\" <tmiller@mailinator.com>, \"Ira Wagman\" <awagman@mailinator.com>, \"Will Straw\" <wstraw@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nBart Beaty has submitted the manuscript, &quot;How Canadians Communicate: Contexts of Canadian Popular Culture&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(22,1048585,4,3,'2023-01-09 23:30:50',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Bart Beaty,</p><p>I am pleased to inform you that an editor has reviewed your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(23,1048585,4,3,'2023-01-09 23:31:07',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Your submission has been sent for review','<p>Dear Bart Beaty,</p><p>I am pleased to inform you that an editor has reviewed your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(24,1048585,4,3,'2023-01-09 23:31:25',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Bart Beaty,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(25,1048585,4,3,'2023-01-09 23:31:43',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Bart Beaty,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(26,1048585,5,0,'2023-01-09 23:33:06',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">Bomb Canada and Other Unkind Remarks in the American Media</a><br />Chantal Allan</p><p><b>Abstract</b></p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(27,1048585,5,0,'2023-01-09 23:33:06',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">Bomb Canada and Other Unkind Remarks in the American Media</a><br />Chantal Allan</p><p><b>Abstract</b></p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(28,1048585,5,0,'2023-01-09 23:33:06',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">Bomb Canada and Other Unkind Remarks in the American Media</a><br />Chantal Allan</p><p><b>Abstract</b></p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(29,1048585,5,0,'2023-01-09 23:33:06',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Chantal Allan,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Bomb Canada and Other Unkind Remarks in the American Media, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/5</p><p>If you have been logged out, you can login again with the username callan.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p>{$signature}'),(30,1048585,5,3,'2023-01-09 23:33:24',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Chantal Allan,</p><p>I am pleased to inform you that an editor has reviewed your submission, Bomb Canada and Other Unkind Remarks in the American Media, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(31,1048585,5,3,'2023-01-09 23:33:43',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Your submission has been sent for review','<p>Dear Chantal Allan,</p><p>I am pleased to inform you that an editor has reviewed your submission, Bomb Canada and Other Unkind Remarks in the American Media, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(32,1048585,5,3,'2023-01-09 23:34:03',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Chantal Allan,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Bomb Canada and Other Unkind Remarks in the American Media, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(33,1048585,5,3,'2023-01-09 23:34:21',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Chantal Allan,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, Bomb Canada and Other Unkind Remarks in the American Media, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(34,1048585,6,0,'2023-01-09 23:36:13',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">The Information Literacy User’s Guide</a><br />Deborah Bernnard, Greg Bobish, Daryl Bullis, Jenna Hecker</p><p><b>Abstract</b></p>Good researchers have a host of tools at their disposal that make navigating today’s complex information ecosystem much more manageable. Gaining the knowledge, abilities, and self-reflection necessary to be a good researcher helps not only in academic settings, but is invaluable in any career, and throughout one’s life. The Information Literacy User’s Guide will start you on this route to success.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(35,1048585,6,0,'2023-01-09 23:36:13',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">The Information Literacy User’s Guide</a><br />Deborah Bernnard, Greg Bobish, Daryl Bullis, Jenna Hecker</p><p><b>Abstract</b></p>Good researchers have a host of tools at their disposal that make navigating today’s complex information ecosystem much more manageable. Gaining the knowledge, abilities, and self-reflection necessary to be a good researcher helps not only in academic settings, but is invaluable in any career, and throughout one’s life. The Information Literacy User’s Guide will start you on this route to success.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(36,1048585,6,0,'2023-01-09 23:36:13',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">The Information Literacy User’s Guide</a><br />Deborah Bernnard, Greg Bobish, Daryl Bullis, Jenna Hecker</p><p><b>Abstract</b></p>Good researchers have a host of tools at their disposal that make navigating today’s complex information ecosystem much more manageable. Gaining the knowledge, abilities, and self-reflection necessary to be a good researcher helps not only in academic settings, but is invaluable in any career, and throughout one’s life. The Information Literacy User’s Guide will start you on this route to success.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(37,1048585,6,0,'2023-01-09 23:36:13',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Deborah Bernnard\" <dbernnard@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Deborah Bernnard,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The Information Literacy User’s Guide, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/6</p><p>If you have been logged out, you can login again with the username dbernnard.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/6\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p>{$signature}'),(38,1048585,6,0,'2023-01-09 23:36:13',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Greg Bobish\" <gbobish@mailinator.com>, \"Daryl Bullis\" <dbullis@mailinator.com>, \"Jenna Hecker\" <jhecker@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nDeborah Bernnard has submitted the manuscript, &quot;The Information Literacy User’s Guide&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(39,1048585,6,3,'2023-01-09 23:36:29',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Deborah Bernnard\" <dbernnard@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Deborah Bernnard,</p><p>I am pleased to inform you that an editor has reviewed your submission, The Information Literacy User’s Guide, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(40,1048585,7,0,'2023-01-09 23:38:20',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">Accessible Elements: Teaching Science Online and at a Distance</a><br />Dietmar Kennepohl, Terry Anderson, Paul Gorsky, Gale Parchoma, Stuart Palmer</p><p><b>Abstract</b></p>Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(41,1048585,7,0,'2023-01-09 23:38:20',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">Accessible Elements: Teaching Science Online and at a Distance</a><br />Dietmar Kennepohl, Terry Anderson, Paul Gorsky, Gale Parchoma, Stuart Palmer</p><p><b>Abstract</b></p>Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(42,1048585,7,0,'2023-01-09 23:38:20',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">Accessible Elements: Teaching Science Online and at a Distance</a><br />Dietmar Kennepohl, Terry Anderson, Paul Gorsky, Gale Parchoma, Stuart Palmer</p><p><b>Abstract</b></p>Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(43,1048585,7,0,'2023-01-09 23:38:20',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Dietmar Kennepohl,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Accessible Elements: Teaching Science Online and at a Distance, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/7</p><p>If you have been logged out, you can login again with the username dkennepohl.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/7\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p>{$signature}'),(44,1048585,7,0,'2023-01-09 23:38:20',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Terry Anderson\" <tanderson@mailinator.com>, \"Paul Gorsky\" <pgorsky@mailinator.com>, \"Gale Parchoma\" <gparchoma@mailinator.com>, \"Stuart Palmer\" <spalmer@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nDietmar Kennepohl has submitted the manuscript, &quot;Accessible Elements: Teaching Science Online and at a Distance&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(45,1048585,7,3,'2023-01-09 23:38:37',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>','','','Your submission has been sent for review','<p>Dear Dietmar Kennepohl,</p><p>I am pleased to inform you that an editor has reviewed your submission, Accessible Elements: Teaching Science Online and at a Distance, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(46,1048585,7,3,'2023-01-09 23:38:57',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Dietmar Kennepohl,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Accessible Elements: Teaching Science Online and at a Distance, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/7\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(47,1048585,8,0,'2023-01-09 23:39:24',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Editorial</a><br /></p><p><b>Abstract</b></p>A Note From The Publisher<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(48,1048585,8,0,'2023-01-09 23:39:24',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Editorial</a><br /></p><p><b>Abstract</b></p>A Note From The Publisher<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(49,1048585,8,0,'2023-01-09 23:39:24',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Editorial</a><br /></p><p><b>Abstract</b></p>A Note From The Publisher<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(50,1048585,9,0,'2023-01-09 23:40:21',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/9\">Enabling Openness: The future of the information society in Latin America and the Caribbean</a><br />Fernando Perini, Robin Mansell, Hernan Galperin, Pablo Bello, Eleonora Rabinovich</p><p><b>Abstract</b></p>In recent years, the Internet and other network technologies have emerged as a central issue for development in Latin America and the Caribbean. They have shown their potential to increase productivity and economic competitiveness, to create new ways to deliver education and health services, and to be driving forces for the modernization of the provision of public services.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(51,1048585,9,0,'2023-01-09 23:40:21',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/9\">Enabling Openness: The future of the information society in Latin America and the Caribbean</a><br />Fernando Perini, Robin Mansell, Hernan Galperin, Pablo Bello, Eleonora Rabinovich</p><p><b>Abstract</b></p>In recent years, the Internet and other network technologies have emerged as a central issue for development in Latin America and the Caribbean. They have shown their potential to increase productivity and economic competitiveness, to create new ways to deliver education and health services, and to be driving forces for the modernization of the provision of public services.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(52,1048585,9,0,'2023-01-09 23:40:21',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/9\">Enabling Openness: The future of the information society in Latin America and the Caribbean</a><br />Fernando Perini, Robin Mansell, Hernan Galperin, Pablo Bello, Eleonora Rabinovich</p><p><b>Abstract</b></p>In recent years, the Internet and other network technologies have emerged as a central issue for development in Latin America and the Caribbean. They have shown their potential to increase productivity and economic competitiveness, to create new ways to deliver education and health services, and to be driving forces for the modernization of the provision of public services.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(53,1048585,9,0,'2023-01-09 23:40:21',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Fernando Perini\" <fperini@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Fernando Perini,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Enabling Openness: The future of the information society in Latin America and the Caribbean, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/9</p><p>If you have been logged out, you can login again with the username fperini.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/9\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p>{$signature}'),(54,1048585,9,0,'2023-01-09 23:40:21',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Robin Mansell\" <rmansell@mailinator.com>, \"Hernan Galperin\" <hgalperin@mailinator.com>, \"Pablo Bello\" <pbello@mailinator.com>, \"Eleonora Rabinovich\" <erabinovich@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nFernando Perini has submitted the manuscript, &quot;Enabling Openness: The future of the information society in Latin America and the Caribbean&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(55,1048585,9,3,'2023-01-09 23:40:39',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Fernando Perini\" <fperini@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Fernando Perini,</p><p>I am pleased to inform you that an editor has reviewed your submission, Enabling Openness: The future of the information society in Latin America and the Caribbean, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(56,1048585,10,0,'2023-01-09 23:42:27',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">Lost Tracks: Buffalo National Park, 1909-1939</a><br />Jennifer Brower</p><p><b>Abstract</b></p>While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(57,1048585,10,0,'2023-01-09 23:42:27',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">Lost Tracks: Buffalo National Park, 1909-1939</a><br />Jennifer Brower</p><p><b>Abstract</b></p>While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(58,1048585,10,0,'2023-01-09 23:42:27',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">Lost Tracks: Buffalo National Park, 1909-1939</a><br />Jennifer Brower</p><p><b>Abstract</b></p>While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(59,1048585,10,0,'2023-01-09 23:42:27',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Jennifer Brower\" <jbrower@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Jennifer Brower,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Lost Tracks: Buffalo National Park, 1909-1939, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/10</p><p>If you have been logged out, you can login again with the username jbrower.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/10\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p>{$signature}'),(60,1048585,11,0,'2023-01-09 23:42:55',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">Dreamwork</a><br />Jonathan Locke Hart</p><p><b>Abstract</b></p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(61,1048585,11,0,'2023-01-09 23:42:55',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">Dreamwork</a><br />Jonathan Locke Hart</p><p><b>Abstract</b></p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(62,1048585,11,0,'2023-01-09 23:42:55',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">Dreamwork</a><br />Jonathan Locke Hart</p><p><b>Abstract</b></p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(63,1048585,11,0,'2023-01-09 23:42:56',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Jonathan Locke Hart,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Dreamwork, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/11</p><p>If you have been logged out, you can login again with the username jlockehart.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/11\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p>{$signature}'),(64,1048585,11,3,'2023-01-09 23:43:11',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that an editor has reviewed your submission, Dreamwork, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(65,1048585,11,3,'2023-01-09 23:43:26',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Your submission has been sent for review','<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that an editor has reviewed your submission, Dreamwork, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(66,1048585,11,10,'2023-01-09 23:43:52',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Dreamwork,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2023-02-06, if not before.<br />\n<br />\nAdela Gallego'),(67,1048585,11,12,'2023-01-09 23:44:03',1073741829,'\"Gonzalo Favio\" <gfavio@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Dreamwork,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2023-02-06, if not before.<br />\n<br />\nGonzalo Favio'),(68,1048585,11,3,'2023-01-09 23:44:27',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Dreamwork, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/11\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(69,1048585,12,0,'2023-01-09 23:45:11',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">Connecting ICTs to Development</a><br />Laurent Elder, Heloise Emdon, Frank Tulus, Raymond Hyma, John Valk, Khaled Fourati, Jeremy de Beer, Sara Bannerman</p><p><b>Abstract</b></p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(70,1048585,12,0,'2023-01-09 23:45:11',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">Connecting ICTs to Development</a><br />Laurent Elder, Heloise Emdon, Frank Tulus, Raymond Hyma, John Valk, Khaled Fourati, Jeremy de Beer, Sara Bannerman</p><p><b>Abstract</b></p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(71,1048585,12,0,'2023-01-09 23:45:11',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">Connecting ICTs to Development</a><br />Laurent Elder, Heloise Emdon, Frank Tulus, Raymond Hyma, John Valk, Khaled Fourati, Jeremy de Beer, Sara Bannerman</p><p><b>Abstract</b></p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(72,1048585,12,0,'2023-01-09 23:45:11',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Laurent Elder\" <lelder@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Laurent Elder,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Connecting ICTs to Development, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/12</p><p>If you have been logged out, you can login again with the username lelder.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/12\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p>{$signature}'),(73,1048585,12,0,'2023-01-09 23:45:11',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Frank Tulus\" <ftulus@mailinator.com>, \"Raymond Hyma\" <rhyma@mailinator.com>, \"John Valk\" <jvalk@mailinator.com>, \"Khaled Fourati\" <fkourati@mailinator.com>, \"Jeremy de Beer\" <jdebeer@mailinator.com>, \"Sara Bannerman\" <sbannerman@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nLaurent Elder has submitted the manuscript, &quot;Connecting ICTs to Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(74,1048585,12,3,'2023-01-09 23:45:28',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Laurent Elder\" <lelder@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Laurent Elder,</p><p>I am pleased to inform you that an editor has reviewed your submission, Connecting ICTs to Development, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(75,1048585,12,8,'2023-01-09 23:46:02',1073741829,'\"Paul Hudson\" <phudson@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Connecting ICTs to Development,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2023-02-06, if not before.<br />\n<br />\nPaul Hudson'),(76,1048585,13,0,'2023-01-09 23:46:45',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">Mobile Learning: Transforming the Delivery of Education and Training</a><br />Mohamed Ally, John Traxler, Marguerite Koole, Torstein Rekkedal</p><p><b>Abstract</b></p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(77,1048585,13,0,'2023-01-09 23:46:45',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">Mobile Learning: Transforming the Delivery of Education and Training</a><br />Mohamed Ally, John Traxler, Marguerite Koole, Torstein Rekkedal</p><p><b>Abstract</b></p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(78,1048585,13,0,'2023-01-09 23:46:45',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">Mobile Learning: Transforming the Delivery of Education and Training</a><br />Mohamed Ally, John Traxler, Marguerite Koole, Torstein Rekkedal</p><p><b>Abstract</b></p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(79,1048585,13,0,'2023-01-09 23:46:45',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Mohamed Ally,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Mobile Learning: Transforming the Delivery of Education and Training, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/13</p><p>If you have been logged out, you can login again with the username mally.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p>{$signature}'),(80,1048585,13,0,'2023-01-09 23:46:45',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Traxler\" <jtraxler@mailinator.com>, \"Marguerite Koole\" <mkoole@mailinator.com>, \"Torstein Rekkedal\" <trekkedal@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nMohamed Ally has submitted the manuscript, &quot;Mobile Learning: Transforming the Delivery of Education and Training&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(81,1048585,13,3,'2023-01-09 23:47:01',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that an editor has reviewed your submission, Mobile Learning: Transforming the Delivery of Education and Training, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(82,1048585,13,3,'2023-01-09 23:47:18',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Your submission has been sent for review','<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that an editor has reviewed your submission, Mobile Learning: Transforming the Delivery of Education and Training, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(83,1048585,13,10,'2023-01-09 23:47:52',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Mobile Learning: Transforming the Delivery of Education and Training,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2023-02-06, if not before.<br />\n<br />\nAdela Gallego'),(84,1048585,13,12,'2023-01-09 23:48:04',1073741829,'\"Gonzalo Favio\" <gfavio@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Mobile Learning: Transforming the Delivery of Education and Training,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2023-02-06, if not before.<br />\n<br />\nGonzalo Favio'),(85,1048585,13,3,'2023-01-09 23:48:31',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Mobile Learning: Transforming the Delivery of Education and Training, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(86,1048585,14,0,'2023-01-09 23:49:28',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/14\">From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots</a><br />Michael Dawson, Brian Dupuis, Michael Wilson</p><p><b>Abstract</b></p>From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(87,1048585,14,0,'2023-01-09 23:49:28',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/14\">From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots</a><br />Michael Dawson, Brian Dupuis, Michael Wilson</p><p><b>Abstract</b></p>From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(88,1048585,14,0,'2023-01-09 23:49:28',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/14\">From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots</a><br />Michael Dawson, Brian Dupuis, Michael Wilson</p><p><b>Abstract</b></p>From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(89,1048585,14,0,'2023-01-09 23:49:28',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Michael Dawson,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/14</p><p>If you have been logged out, you can login again with the username mdawson.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p>{$signature}'),(90,1048585,14,0,'2023-01-09 23:49:28',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Brian Dupuis\" <bdupuis@mailinator.com>, \"Michael Wilson\" <mwilson@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nMichael Dawson has submitted the manuscript, &quot;From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(91,1048585,14,3,'2023-01-09 23:49:47',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Michael Dawson,</p><p>I am pleased to inform you that an editor has reviewed your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(92,1048585,14,3,'2023-01-09 23:50:06',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Your submission has been sent for review','<p>Dear Michael Dawson,</p><p>I am pleased to inform you that an editor has reviewed your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(93,1048585,14,3,'2023-01-09 23:50:24',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Michael Dawson,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(94,1048585,14,3,'2023-01-09 23:50:42',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Michael Dawson,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(95,1048585,15,0,'2023-01-09 23:52:34',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">Expansive Discourses: Urban Sprawl in Calgary, 1945-1978</a><br />Max Foran</p><p><b>Abstract</b></p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(96,1048585,15,0,'2023-01-09 23:52:34',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">Expansive Discourses: Urban Sprawl in Calgary, 1945-1978</a><br />Max Foran</p><p><b>Abstract</b></p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(97,1048585,15,0,'2023-01-09 23:52:35',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">Expansive Discourses: Urban Sprawl in Calgary, 1945-1978</a><br />Max Foran</p><p><b>Abstract</b></p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(98,1048585,15,0,'2023-01-09 23:52:35',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Max Foran\" <mforan@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Max Foran,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Expansive Discourses: Urban Sprawl in Calgary, 1945-1978, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/15</p><p>If you have been logged out, you can login again with the username mforan.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/15\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p>{$signature}'),(99,1048585,15,3,'2023-01-09 23:52:52',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Max Foran\" <mforan@mailinator.com>','','','Your submission has been sent for review','<p>Dear Max Foran,</p><p>I am pleased to inform you that an editor has reviewed your submission, Expansive Discourses: Urban Sprawl in Calgary, 1945-1978, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(100,1048585,16,0,'2023-01-09 23:53:51',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">A Designer\'s Log: Case Studies in Instructional Design</a><br />Michael Power</p><p><b>Abstract</b></p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(101,1048585,16,0,'2023-01-09 23:53:51',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">A Designer\'s Log: Case Studies in Instructional Design</a><br />Michael Power</p><p><b>Abstract</b></p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(102,1048585,16,0,'2023-01-09 23:53:51',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">A Designer\'s Log: Case Studies in Instructional Design</a><br />Michael Power</p><p><b>Abstract</b></p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(103,1048585,16,0,'2023-01-09 23:53:51',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Michael Power\" <mpower@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Michael Power,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, A Designer\'s Log: Case Studies in Instructional Design, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/16</p><p>If you have been logged out, you can login again with the username mpower.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/16\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p>{$signature}'),(104,1048585,16,3,'2023-01-09 23:54:12',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Power\" <mpower@mailinator.com>','','','Your submission has been sent for review','<p>Dear Michael Power,</p><p>I am pleased to inform you that an editor has reviewed your submission, A Designer\'s Log: Case Studies in Instructional Design, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(105,1048585,16,10,'2023-01-09 23:54:49',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;A Designer\'s Log: Case Studies in Instructional Design,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2023-02-06, if not before.<br />\n<br />\nAdela Gallego'),(106,1048585,17,0,'2023-01-09 23:56:06',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">Open Development: Networked Innovations in International Development</a><br />Matthew Smith, Yochai Benkler, Katherine Reilly, Melissa Loudon, Ulrike Rivett, Mark Graham, Håvard Haarstad, Marshall Smith</p><p><b>Abstract</b></p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(107,1048585,17,0,'2023-01-09 23:56:06',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">Open Development: Networked Innovations in International Development</a><br />Matthew Smith, Yochai Benkler, Katherine Reilly, Melissa Loudon, Ulrike Rivett, Mark Graham, Håvard Haarstad, Marshall Smith</p><p><b>Abstract</b></p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(108,1048585,17,0,'2023-01-09 23:56:06',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">Open Development: Networked Innovations in International Development</a><br />Matthew Smith, Yochai Benkler, Katherine Reilly, Melissa Loudon, Ulrike Rivett, Mark Graham, Håvard Haarstad, Marshall Smith</p><p><b>Abstract</b></p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(109,1048585,17,0,'2023-01-09 23:56:06',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Matthew Smith\" <msmith@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Matthew Smith,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Open Development: Networked Innovations in International Development, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/17</p><p>If you have been logged out, you can login again with the username msmith.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/17\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p>{$signature}'),(110,1048585,17,0,'2023-01-09 23:56:06',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Yochai Benkler\" <ybenkler@mailinator.com>, \"Katherine Reilly\" <kreilly@mailinator.com>, \"Melissa Loudon\" <mloudon@mailinator.com>, \"Ulrike Rivett\" <urivett@mailinator.com>, \"Mark Graham\" <mgraham@mailinator.com>, \"Håvard Haarstad\" <hhaarstad@mailinator.com>, \"Marshall Smith\" <masmith@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nMatthew Smith has submitted the manuscript, &quot;Open Development: Networked Innovations in International Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(111,1048585,17,3,'2023-01-09 23:56:28',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Matthew Smith\" <msmith@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Matthew Smith,</p><p>I am pleased to inform you that an editor has reviewed your submission, Open Development: Networked Innovations in International Development, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>');
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log_users`
--

DROP TABLE IF EXISTS `email_log_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_log_users` (
  `email_log_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`),
  KEY `email_log_users_email_log_id` (`email_log_id`),
  KEY `email_log_users_user_id` (`user_id`),
  CONSTRAINT `email_log_users_email_log_id_foreign` FOREIGN KEY (`email_log_id`) REFERENCES `email_log` (`log_id`) ON DELETE CASCADE,
  CONSTRAINT `email_log_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log_users`
--

LOCK TABLES `email_log_users` WRITE;
/*!40000 ALTER TABLE `email_log_users` DISABLE KEYS */;
INSERT INTO `email_log_users` VALUES (1,1),(2,2),(3,3),(4,19),(5,19),(6,19),(7,1),(8,2),(9,3),(10,20),(12,20),(13,1),(14,2),(15,3),(16,21),(17,1),(18,2),(19,3),(20,22),(22,22),(23,22),(24,22),(25,22),(26,1),(27,2),(28,3),(29,23),(30,23),(31,23),(32,23),(33,23),(34,1),(35,2),(36,3),(37,24),(39,24),(40,1),(41,2),(42,3),(43,25),(45,25),(46,25),(47,1),(48,2),(49,3),(50,1),(51,2),(52,3),(53,26),(55,26),(56,1),(57,2),(58,3),(59,27),(60,1),(61,2),(62,3),(63,28),(64,28),(65,28),(66,2),(67,2),(68,28),(69,1),(70,2),(71,3),(72,29),(74,29),(75,2),(76,1),(77,2),(78,3),(79,30),(81,30),(82,30),(83,2),(84,2),(85,30),(86,1),(87,2),(88,3),(89,31),(91,31),(92,31),(93,31),(94,31),(95,1),(96,2),(97,3),(98,32),(99,32),(100,1),(101,2),(102,3),(103,33),(104,33),(105,2),(106,1),(107,2),(108,3),(109,34),(111,34);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES (1,'COPYEDIT_REQUEST',1,'DISCUSSION_NOTIFICATION_COPYEDITING'),(2,'EDITOR_ASSIGN_SUBMISSION',1,'DISCUSSION_NOTIFICATION_SUBMISSION'),(3,'EDITOR_ASSIGN_REVIEW',1,'DISCUSSION_NOTIFICATION_REVIEW'),(4,'EDITOR_ASSIGN_PRODUCTION',1,'DISCUSSION_NOTIFICATION_COPYEDITING'),(5,'LAYOUT_REQUEST',1,'DISCUSSION_NOTIFICATION_PRODUCTION'),(6,'LAYOUT_COMPLETE',1,'DISCUSSION_NOTIFICATION_PRODUCTION'),(7,'INDEX_REQUEST',1,'DISCUSSION_NOTIFICATION_PRODUCTION'),(8,'INDEX_COMPLETE',1,'DISCUSSION_NOTIFICATION_PRODUCTION');
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default_data`
--

DROP TABLE IF EXISTS `email_templates_default_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_default_data` (
  `email_key` varchar(255) NOT NULL COMMENT 'Unique identifier for this email.',
  `locale` varchar(14) NOT NULL DEFAULT 'en_US',
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text,
  UNIQUE KEY `email_templates_default_data_pkey` (`email_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default_data`
--

LOCK TABLES `email_templates_default_data` WRITE;
/*!40000 ALTER TABLE `email_templates_default_data` DISABLE KEYS */;
INSERT INTO `email_templates_default_data` VALUES ('ANNOUNCEMENT','en_US','New Announcement','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href=\"{$announcementUrl}\">full announcement</a>.'),('ANNOUNCEMENT','fr_CA','','',''),('COPYEDIT_REQUEST','en_US','Request Copyedit','Submission {$submissionId} is ready to be copyedited for {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready to be copyedited:</p><p><a href\"{$submissionUrl}\">{$submissionId} {$submissionTitle}</a><br />{$pressName}</p><p>Please follow these steps to complete this task:</p><ol><li>1. Click on the Submission URL below.</li><li>2. Open any files available under Draft Files and edit the files. Use the Copyediting Discussions area if you need to contact the editor(s) or author(s).</li><li>3. Save the copyedited file(s) and upload them to the Copyedited panel.</li><li>4. Use the Copyediting Discussions to notify the editor(s) that all files have been prepared, and that the Production process may begin.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.</p><p>Kind regards,</p>{$signature}'),('COPYEDIT_REQUEST','fr_CA','','Demande de révision d\'une soumission','{$recipientName},<br />\n<br />\nJ\'aimerais que vous effectuiez la révision du manuscrit intitulé « {$submissionTitle} » pour la revue {$pressName} à l\'aide des étapes suivantes.<br />\n1. Cliquer sur l\'URL de la soumission ci-dessous.<br />\n2. Ouvrir le(s) fichier(s) disponible(s) sous Fichiers des ébauches finales et effectuer votre révision, tout en ajoutant des discussions sur la révision, le cas échéant.<br />\n3. Enregistrer le(s) fichier(s) révisé(s) et le(s) téléverser dans la section Version(s) révisée(s).<br />\n4. Informer le,la rédacteur-trice que tous les fichiers ont été révisés et que l\'étape de production peut débuter.<br />\n<br />\nURL de la revue {$pressName} : {$pressUrl}<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}'),('DISCUSSION_NOTIFICATION_COPYEDITING','en_US','Discussion (Copyediting)','A message regarding {$pressName}','Please enter your message.'),('DISCUSSION_NOTIFICATION_COPYEDITING','fr_CA','','Un message à propos de la revue {$pressName}','Prière de saisir votre message.'),('DISCUSSION_NOTIFICATION_PRODUCTION','en_US','Discussion (Production)','A message regarding {$pressName}','Please enter your message.'),('DISCUSSION_NOTIFICATION_PRODUCTION','fr_CA','','Un message à propos de la revue {$pressName}','Prière de saisir votre message.'),('DISCUSSION_NOTIFICATION_REVIEW','en_US','Discussion (Review)','A message regarding {$pressName}','Please enter your message.'),('DISCUSSION_NOTIFICATION_REVIEW','fr_CA','','Un message à propos de la revue {$pressName}','Prière de saisir votre message.'),('DISCUSSION_NOTIFICATION_SUBMISSION','en_US','Discussion (Submission)','A message regarding {$pressName}','Please enter your message.'),('DISCUSSION_NOTIFICATION_SUBMISSION','fr_CA','','Un message à propos de la revue {$pressName}','Prière de saisir votre message.'),('EDITORIAL_REMINDER','en_US','Editorial Reminder','Outstanding editorial tasks for {$pressName}','<p>Dear {$recipientName},</p><p>You are currently assigned to {$numberOfSubmissions} submissions in <a href=\"{$pressUrl}\">{$pressName}</a>. The following submissions are <b>waiting for your response</b>.</p>{$outstandingTasks}<p>View all of your assignments in your <a href=\"{$submissionsUrl}\">submission dashboard</a>.</p><p>If you have any questions about your assignments, please contact {$contactName} at {$contactEmail}.</p>'),('EDITORIAL_REMINDER','fr_CA','','',''),('EDITOR_ASSIGN_PRODUCTION','en_US','Editor Assigned','Editorial Assignment','{$recipientName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$pressName} has been assigned to you to see through the editorial process in your role as an Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you,'),('EDITOR_ASSIGN_PRODUCTION','fr_CA','','Travail éditorial','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; à la presse {$pressName} vous a été assignée. En tant que rédacteur en chef, vous devrez superviser le processus éditorial de cette soumission.<br />\n<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci,'),('EDITOR_ASSIGN_REVIEW','en_US','Editor Assigned','Editorial Assignment','{$recipientName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$pressName} has been assigned to you to see through the editorial process in your role as an Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you,'),('EDITOR_ASSIGN_REVIEW','fr_CA','','Travail éditorial','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; à la presse {$pressName} vous a été assignée. En tant que rédacteur en chef, vous devrez superviser le processus éditorial de cette soumission.<br />\n<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci,'),('EDITOR_ASSIGN_SUBMISSION','en_US','Editor Assigned','Editorial Assignment','{$recipientName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$pressName} has been assigned to you to see through the editorial process in your role as an Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you,'),('EDITOR_ASSIGN_SUBMISSION','fr_CA','','Travail éditorial','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; à la presse {$pressName} vous a été assignée. En tant que rédacteur en chef, vous devrez superviser le processus éditorial de cette soumission.<br />\n<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci,'),('EDITOR_DECISION_ACCEPT','en_US','Submission Accepted','Your submission has been accepted to {$pressName}','<p>Dear {$recipientName},</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, {$submissionTitle}, to meet or exceed our expectations. We are excited to publish your piece in {$pressName} and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for {$pressName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),('EDITOR_DECISION_ACCEPT','fr_CA','','Décision du rédacteur en chef','{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$pressName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}'),('EDITOR_DECISION_BACK_FROM_COPYEDITING','en_US','Submission Sent Back from Copyediting','Your submission has been sent back to review','<p>Dear {$recipientName},</p><p>Your submission, {$submissionTitle}, has been sent back to the review stage. It will undergo further review before it can be accepted for publication.</p><p>Occasionally, a decision to accept a submission will be recorded accidentally in our system and we must send it back to review. I apologize for any confusion this has caused. We will work to complete any further review quickly so that you have a final decision as soon as possible.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>'),('EDITOR_DECISION_BACK_FROM_COPYEDITING','fr_CA','','',''),('EDITOR_DECISION_BACK_FROM_PRODUCTION','en_US','Submission Sent Back to Copyediting','Your submission has been sent back to copyediting','<p>Dear {$recipientName},</p><p>Your submission, {$submissionTitle}, has been sent back to the copyediting stage, where it will undergo further copyediting and formatting to prepare it for publication.</p><p>Occasionally, a submission is sent to the production stage before it is ready for the final galleys to be prepared for publication. Your submission is still forthcoming. I apologize for any confusion.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We will contact you if we need any further assistance.</p><p>Kind regards,</p><p>{$signature}</p>'),('EDITOR_DECISION_BACK_FROM_PRODUCTION','fr_CA','','',''),('EDITOR_DECISION_CANCEL_REVIEW_ROUND','en_US','Review Round Cancelled','A review round for your submission has been cancelled','<p>Dear {$recipientName},</p><p>We recently opened a new review round for your submission, {$submissionTitle}. We are closing this review round now.</p><p>Occasionally, a decision to open a round of review will be recorded accidentally in our system and we must cancel this review round. I apologize for any confusion this may have caused.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>'),('EDITOR_DECISION_CANCEL_REVIEW_ROUND','fr_CA','','',''),('EDITOR_DECISION_DECLINE','en_US','Submission Declined','Your submission has been declined','<p>Dear {$recipientName},</p><p>While we appreciate receiving your submission, we are unable to accept {$submissionTitle} for publication on the basis of the comments from reviewers.</p><p>The reviewers\' comments are included at the bottom of this email.</p><p>Thank you for submitting to {$pressName}. Although it is disappointing to have a submission declined, I hope you find the reviewers\' comments to be constructive and helpful.</p><p>You are now free to submit the work elsewhere if you choose to do so.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),('EDITOR_DECISION_DECLINE','fr_CA','','Décision du rédacteur','{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de refuser votre soumission.'),('EDITOR_DECISION_INITIAL_DECLINE','en_US','Submission Declined (Pre-Review)','Your submission has been declined','<p>Dear {$recipientName},</p><p>I’m sorry to inform you that, after reviewing your submission, {$submissionTitle}, the editor has found that it does not meet our requirements for publication in {$pressName}.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p>{$signature}'),('EDITOR_DECISION_INITIAL_DECLINE','fr_CA','','Décision du rédacteur','\n			{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à  la revue {$pressName}.<br />\n<br />\nNotre décision est de refuser votre soumission.'),('EDITOR_DECISION_NEW_ROUND','en_US','New Review Round Initiated','Your submission has been sent for another round of review','<p>Dear {$recipientName},</p>\n<p>Your revised submission, {$submissionTitle}, has been sent for a new round of peer review. \nYou will hear from us with feedback from the reviewers and information about the next steps.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),('EDITOR_DECISION_NEW_ROUND','fr_CA','','',''),('EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','en_US','Notify Other Authors','An update regarding your submission','<p>The following email was sent to {$submittingAuthorName} from {$pressName} regarding {$submissionTitle}.</p>\n<p>You are receiving a copy of this notification because you are identified as an author of the submission. Any instructions in the message below are intended for the submitting author, {$submittingAuthorName}, and no action is required of you at this time.</p>\n\n{$messageToSubmittingAuthor}'),('EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','fr_CA','','',''),('EDITOR_DECISION_NOTIFY_REVIEWERS','en_US','Notify Reviewers of Decision','Thank you for your review','<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, {$submissionTitle}, for {$pressName}. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>{$decisionDescription}</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$pressName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>'),('EDITOR_DECISION_NOTIFY_REVIEWERS','fr_CA','','',''),('EDITOR_DECISION_RESUBMIT','en_US','Resubmit for Review','Your submission has been reviewed - please revise and resubmit','<p>Dear {$recipientName},</p><p>After reviewing your submission, {$submissionTitle}, the reviewers have recommended that your submission cannot be accepted for publication in its current form. However, we would like to encourage you to submit a revised version that addresses the reviewers\' comments. Your revisions will be reviewed by an editor and may be sent out for another round of peer review.</p><p>Please note that resubmitting your work does not guarantee that it will be accepted.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point and identify what changes you have made. If you find any of the reviewer\'s comments inappropriate, please explain your perspective. If you have questions about the recommendations in your review, please include these in your response.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments <a href=\"{$authorSubmissionUrl}\">at your submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),('EDITOR_DECISION_RESUBMIT','fr_CA','','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de vous demander d\'apporter des révisions à votre soumission et de la soumettre à nouveau.'),('EDITOR_DECISION_REVERT_DECLINE','en_US','Reinstate Declined Submission','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will complete the round of review and you will be notified when a \ndecision is made.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),('EDITOR_DECISION_REVERT_DECLINE','fr_CA','','',''),('EDITOR_DECISION_REVERT_INITIAL_DECLINE','en_US','Reinstate Submission Declined Without Review','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will look further at your submission before deciding whether to decline \nthe submission or send it for review.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),('EDITOR_DECISION_REVERT_INITIAL_DECLINE','fr_CA','','',''),('EDITOR_DECISION_REVISIONS','en_US','Revisions Requested','Your submission has been reviewed and we encourage you to submit revisions','<p>Dear {$recipientName},</p><p>Your submission {$submissionTitle} has been reviewed and we would like to encourage you to submit revisions that address the reviewers\' comments. An editor will review these revisions and if they address the concerns adequately, your submission may be accepted for publication.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point in the reviewers\' comments and identify what changes you have made. If you find any of the reviewer\'s comments to be unjustified or inappropriate, please explain your perspective.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments at your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),('EDITOR_DECISION_REVISIONS','fr_CA','','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de vous demander d\'apporter des révisions à votre soumission.'),('EDITOR_DECISION_SEND_TO_EXTERNAL','en_US','Sent to Review','Your submission has been sent for review','<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>{$reviewTypeDescription} You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>'),('EDITOR_DECISION_SEND_TO_EXTERNAL','fr_CA','','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est d\'envoyer votre soumission en évaluation.<br />\n<br />\nURL de la soumission : {$submissionUrl}'),('EDITOR_DECISION_SEND_TO_INTERNAL','en_US','Sent to Internal Review','Your submission has been sent for internal review','<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>'),('EDITOR_DECISION_SEND_TO_INTERNAL','fr_CA','','',''),('EDITOR_DECISION_SEND_TO_PRODUCTION','en_US','Sent to Production','Next steps for publishing your submission','<p>Dear {$recipientName},</p><p>I am writing from {$pressName} to let you know that the editing of your submission, {$submissionTitle}, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),('EDITOR_DECISION_SEND_TO_PRODUCTION','fr_CA','','Décision du rédacteur','{$authors},<br />\n<br />\nL\'édition de votre soumission « {$submissionTitle} » est complétée. Nous l\'envoyons maintenant en production.<br />\n<br />\nURL de la soumission : {$submissionUrl}'),('EDITOR_DECISION_SKIP_REVIEW','en_US','Submission Accepted (Without Review)','Your submission has been sent for copyediting','<p>Dear {$recipientName},</p>\n<p>I am pleased to inform you that we have decided to accept your submission without peer review. We found your submission, {$submissionTitle}, to meet our expectations, and we do not require that work of this type undergo peer review. We are excited to publish your piece in {$pressName} and we thank you for choosing our press as a venue for your work.</p>\n<p>Your submission will soon be published on the press site for {$pressName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on your efforts.</p>\n<p>Your submission will now undergo copy editing and formatting to prepare it for publication. </p>\n<p>You will shortly receive further instructions.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),('EDITOR_DECISION_SKIP_REVIEW','fr_CA','','',''),('EDITOR_RECOMMENDATION','en_US','Recommendation Made','Editor Recommendation','<p>Dear {$recipientName},</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission {$submissionTitle}.</p><p>My recommendation is:<br />{$recommendation}.</p><p>Please visit the submission\'s <a href=\"{$submissionUrl}\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>{$senderName}</p>'),('EDITOR_RECOMMENDATION','fr_CA','','Recommandation du rédacteur','{$editors},<br />\n<br />\nLa recommandation concernant la soumission « {$submissionTitle} » à la revue {$pressName} est de : {$recommendation}'),('INDEX_COMPLETE','en_US','Index Completed','Index Galleys Complete','{$recipientName}:<br />\n<br />\nIndexes have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$pressName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signatureFullName}'),('INDEX_COMPLETE','fr_CA','','Indexage des épreuves en placard complété','{$recipientName}:<br />\n<br />\nLes index du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$pressName} sont prêts et peuvent être révisés.<br />\n<br />\nSi vous avez questions, n\'hésitez pas à me contacter.<br />\n<br />\n{$signatureFullName}'),('INDEX_REQUEST','en_US','Index Requested','Request Index','{$recipientName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$pressName} now needs indexes created by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and use the Page Proofs file to create the galleys according to press standards.<br />\n3. Send the COMPLETE email to the editor.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.<br />\n<br />\n{$signature}'),('INDEX_REQUEST','fr_CA','','Requête d\'indexage','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; par la presse {$pressName} doit désormais être indexée. Veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez les fichiers d\'épreuves de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir contribué à cette presse.<br />\n<br />\n{$signature}'),('LAYOUT_COMPLETE','en_US','','Galleys Complete','<p>Dear {$recipientName},<p><p>Galleys have now been prepared for the following submission and are ready for final review.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$pressName}</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p><p>{$senderName}</p>'),('LAYOUT_COMPLETE','fr_CA','','Épreuves en placard complétées','{$recipientName}:<br />\n<br />\nLes épreuves en placard du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$pressName} ont été préparées et peuvent être révisées.<br />\n<br />\nSi vous avez questions, n\'hésitez pas à me contacter.<br />\n<br />\n{$senderName}'),('LAYOUT_REQUEST','en_US','Ready for Production','Submission {$submissionId} is ready for production at {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready for layout editing:</p><p><a href=\"{$submissionUrl}\">{$submissionId} {$submissionTitle}</a><br />{$pressName}</p><ol><li>1. Click on the Submission URL above.</li><li>2. Download the Production Ready files and use them to create the galleys according to the press\'s standards.</li><li>3. Upload the galleys to the Publication Formats section of the submission.</li><li>4. Use the Production Discussions to notify the editor that the galleys are ready.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.</p><p>Kind regards,</p>{$signature}'),('LAYOUT_REQUEST','fr_CA','','Requête des épreuves en placard','{$recipientName}:<br />\n<br />\nIl faut maintenant préparer les épreuves en placard de la soumission &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Pour ce faire, veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez le fichier Version de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir contribué à cette presse.'),('PASSWORD_RESET','en_US','Password Reset','Password Reset','Your password has been successfully reset for use with the {$siteTitle} web site.<br />\n<br />\nYour username: {$recipientUsername}<br />\nYour new password: {$password}<br />\n<br />\n{$siteContactName}'),('PASSWORD_RESET','fr_CA','','Réinitialisation du mot de passe','Votre mot de passe vous permettant d\'avoir accès au site Web {$siteTitle} a été réinitialisé. Veuillez noter votre nom d\'utilisateur et mot de passe dans vos dossiers, car vous en aurez besoin pour vos travaux auprès de la presse.<br />\n<br />\nVotre nom d\'utilisateur: {$recipientUsername}<br />\nVotre nouveau mot de passe: {$password}<br />\n<br />\n{$siteContactName}'),('PASSWORD_RESET_CONFIRM','en_US','Password Reset Confirm','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),('PASSWORD_RESET_CONFIRM','fr_CA','','Confirmation de réinitialisation du mot de passe','Nous avons reçu une requête de réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette requête, veuillez ignorer ce courriel et votre mot de passe demeurera le même. Si vous souhaitez modifier votre mot de passe, cliquez sur l\'adresse URL ci-dessous.<br />\n<br />\nModifier mon mot de passe: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),('REVIEWER_REGISTER','en_US','Reviewer Register','Registration as Reviewer with {$pressName}','In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$pressName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the press through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),('REVIEWER_REGISTER','fr_CA','','Inscription à titre d\'évaluateur pour la presse {$pressName}','En raison de votre expertise, nous avons ajouté votre nom à notre base de données d\'évaluateurs pour la presse {$pressName}. Ceci ne vous oblige à rien, mais nous permet simplement de vous approcher si nous recevons une soumission que vous pourriez évaluer. Après avoir reçu une demande d\'évaluation, vous aurez la possibilité de lire le titre et le résumé de l\'article en question. Vous serez toujours libre d\'accepter ou de refuser l\'invitation. Vous pouvez demander que l\'on retire votre nom de notre liste d\'évaluateurs en tout temps.<br />\n<br />\nVoici votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin dans tous vos échanges avec la presse à travers son site Web. Vous pourriez, par exemple, mettre votre profil à jour, y compris vos champs d\'intérêt en ce qui concerne l\'évaluation des articles.<br />\n<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$signature}'),('REVIEW_ACK','en_US','','Thank you for your review','<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, {$submissionTitle}, for {$pressName}. We appreciate your time and expertise in contributing to the quality of the work that we publish.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$pressName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>'),('REVIEW_ACK','fr_CA','','Accusé de réception de l\'évaluation d\'une soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir évalué la soumission intitulée « {$submissionTitle} » pour la revue {$pressName}. Nous vous sommes reconnaissants de votre contribution à la qualité des travaux que nous publions.'),('REVIEW_CANCEL','en_US','Reviewer Unassign','Request for Review Cancelled','{$recipientName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this review process in the future.<br />\n<br />\nIf you have any questions, please contact me.'),('REVIEW_CANCEL','fr_CA','','Annulation de la requête d\'évaluation','{$recipientName}:<br />\n<br />\n<br />\nNous avons décidé d\'annuler notre requête d\'évaluation pour la soumission &quot;{$submissionTitle}&quot; de la presse {$pressName}. Nous vous prions de nous excuser pour tout inconvénient que cette décision pourrait occasionner et nous espérons que vous serez en mesure d\'évaluer une soumission dans un avenir prochain.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à me contacter.'),('REVIEW_COMPLETE','en_US','Review Completed','Review completed for #{$submissionId} - {$submissionTitle}','<p>Dear {$recipientName}, </p><p>{$senderName} has completed the review on the submission <a href=\"{$submissionUrl}\">{$submissionId} {$submissionTitle}</a><br /></p><hr><p>This is an automatic email sent from <a href=\"{$pressUrl}\">{$pressName}</a>.</p>'),('REVIEW_COMPLETE','fr_CA','','',''),('REVIEW_CONFIRM','en_US','Review Confirm','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$senderName}'),('REVIEW_CONFIRM','fr_CA','','En mesure d\'évaluer','Éditeurs:<br />\n<br />\nJe peux et je souhaite évaluer la soumission &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Merci de m\'avoir invité à évaluer cet article. Je prévois terminer mon évaluation d\'ici le {$reviewDueDate}.<br />\n<br />\n{$senderName}'),('REVIEW_DECLINE','en_US','Review Decline','Unable to Review','Editor(s):<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$senderName}'),('REVIEW_DECLINE','fr_CA','','Ne peux pas évaluer','Éditeurs:<br />\n<br />\nMalheureusement, je ne pourrai pas évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Merci de m\'avoir invité à évaluer cet article et n\'hésitez pas à me contacter dans un avenir prochain.<br />\n<br />\n{$senderName}'),('REVIEW_EDIT','en_US','Review Edited','Your review assignment has been changed for {$pressName}','<p>Dear {$recipientName}, </p><p>Review details on the submission <p><a href=\"{$submissionUrl}\">{$submissionId} {$submissionTitle}</a> have been changed.<br /></p><p>This is an automatic email sent from {$pressName}</p>'),('REVIEW_EDIT','fr_CA','','',''),('REVIEW_REINSTATE','en_US','Reviewer Reinstate','Request for Review Reinstated','{$recipientName}:<br />\n<br />\nWe would like to reinstate our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We hope that you will be able to assist with this press\'s review process.<br />\n<br />\nIf you have any questions, please contact me.'),('REVIEW_REINSTATE','fr_CA','','',''),('REVIEW_REMIND','en_US','Review Reminder','Submission Review Reminder','{$recipientName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$signature}'),('REVIEW_REMIND','fr_CA','','Rappel d\'évaluation','{$recipientName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoyés par courriel. {$passwordResetUrl}<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Nous vous prions d\'agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$signature}'),('REVIEW_REMIND_AUTO','en_US','Review Reminder (Automated)','Automated Submission Review Reminder','{$recipientName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$signature}'),('REVIEW_REMIND_AUTO','fr_CA','','Rappel automatique d\'évaluation d\'une soumission','{$recipientName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Ce courriel a été généré et envoyé automatiquement parce que vous avez dépassé la date d\'échéance. Toutefois, nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoyés par courriel. {$passwordResetUrl}<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Veuillez agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$signature}'),('REVIEW_REQUEST','en_US','Review Request','Manuscript Review Request','Dear {$recipientName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$signature}<br />\n'),('REVIEW_REQUEST','fr_CA','','Requête d\'évaluation d\'un manuscrit','Bonjour {$recipientName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nVeuillez ouvrir une session sur le site Web de la presse d\'ici le {$responseDueDate} pour indiquer si vous serez en mesure d\'évaluer l\'article ou non. Ceci vous permettra également d\'accéder à la soumission, et de saisir votre évaluation et vos recommandations.<br />\n<br />\n<br />\nL\'évaluation doit être terminée d\'ici le {$reviewDueDate}.<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci de votre intérêt à évaluer des articles pour notre presse.<br />\n<br />\n{$signature}<br />\n'),('REVIEW_REQUEST_SUBSEQUENT','en_US','Review Request Subsequent','Request to review a revised submission','<p>Dear {$recipientName},</p><p>Thank you for your review of <a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a>. The authors have considered the reviewers\' feedback and have now submitted a revised version of their work. I\'m writing to ask if you would conduct a second round of peer review for this submission. {$pressName}.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can <a href=\"{$reviewAssignmentUrl}\">follow the review steps</a> to view the submission, upload review files, and submit your review comments.<p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p>Abstract</p>{$submissionAbstract}<p>Please accept or decline the review by {$responseDueDate}.</p><p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}'),('REVIEW_REQUEST_SUBSEQUENT','fr_CA','','',''),('REVIEW_RESEND_REQUEST','en_US','Resend Review Request to Reviewer','Requesting your review again for {$pressName}','<p>Dear {$recipientName},</p><p>Recently, you declined our request to review a submission, {$submissionTitle}, for {$pressName}. I\'m writing to see if you are able to conduct the review after all.</p><p>We would be grateful if you\'re able to perform this review, but we understand if that is not possible at this time. Either way, please <a href=\"{$reviewAssignmentUrl}\">accept or decline the request</a> by {$responseDueDate}, so that we can find an alternate reviewer.<p>If you have any questions, please contact me.</p><p>Kind regards,</p>{$signature}'),('REVIEW_RESEND_REQUEST','fr_CA','','',''),('REVIEW_RESPONSE_OVERDUE_AUTO','en_US','Review Response Overdue (Automated)','Manuscript Review Request','Dear {$recipientName},<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$signature}<br />\n'),('REVIEW_RESPONSE_OVERDUE_AUTO','fr_CA','','',''),('STATISTICS_REPORT_NOTIFICATION','en_US','Statistics Report Notification','Editorial activity for {$month}, {$year}','\n{$recipientName}, <br />\n<br />\nYour press health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the press to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published book stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$pressSignature}'),('STATISTICS_REPORT_NOTIFICATION','fr_CA','','',''),('SUBMISSION_ACK','en_US','Submission Confirmation','Thank you for your submission to {$pressName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$pressName}. We have received your submission, {$submissionTitle}, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: {$authorSubmissionUrl}</p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Thank you for considering {$pressName} as a venue for your work.</p>{$signature}'),('SUBMISSION_ACK','fr_CA','','Accusé de réception de la soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$pressName}. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d\'édition en accédant au site Web de la revue :<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$pressSignature}'),('SUBMISSION_ACK_NOT_USER','en_US','Submission Confirmation (Other Authors)','Submission Acknowledgement','Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$pressName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n{$pressSignature}'),('SUBMISSION_ACK_NOT_USER','fr_CA','','Accusé de réception d\'une soumission','Bonjour,<br />\n<br />\n{$submitterName} a envoyé un manuscrit intitulé &quot;{$submissionTitle}&quot; à la presse {$pressName}. <br />\n<br />\nSi vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir envoyé votre article à cette presse.<br />\n<br />\n{$pressSignature}'),('SUBMISSION_NEEDS_EDITOR','en_US','Submission Needs Editor','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear {$recipientName},</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"{$pressUrl}\">{$pressName}</a>.</p>'),('SUBMISSION_NEEDS_EDITOR','fr_CA','','',''),('SUBMISSION_SAVED_FOR_LATER','en_US','Submission Saved for Later','Resume your submission to {$pressName}','<p>Dear {$recipientName},</p><p>Your submission details have been saved in our system, but it has not yet been submitted for consideration. You can return to complete your submission at any time by following the link below.</p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — {$submissionTitle}</a></p><hr><p>This is an automated email from <a href=\"{$pressUrl}\">{$pressName}</a>.</p>'),('SUBMISSION_SAVED_FOR_LATER','fr_CA','','',''),('USER_REGISTER','en_US','User Created','Press Registration','{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$pressName}. We have included your username and password in this email, which are needed for all work with this press through its website. At any point, you can ask to be removed from the list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),('USER_REGISTER','fr_CA','','Inscription à la presse','{$recipientName}<br />\n<br />\nVous êtes désormais inscrit à la presse {$pressName}. Ce courriel contient votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin pour tous vos travaux au sein de la presse. Vous pouvez demander que l\'on retire votre nom de la liste des utilisateurs en tout temps. Il suffit de me contacter.<br />\n<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$signature}'),('USER_VALIDATE_CONTEXT','en_US','Validate Email (Press Registration)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$pressName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$signature}'),('USER_VALIDATE_CONTEXT','fr_CA','','',''),('USER_VALIDATE_SITE','en_US','Validate Email (Site)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$signature}'),('USER_VALIDATE_SITE','fr_CA','','',''),('VERSION_CREATED','en_US','Version Created','A new version was created for {$submissionTitle}','<p>Dear {$recipientName}, </p><p>This is an automated message to inform you that a new version of your submission, {$submissionTitle}, was created. You can view this version from your submission dashboard at the following link:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a></p><hr><p>This is an automatic email sent from <a href=\"{$pressUrl}\">{$pressName}</a>.</p>'),('VERSION_CREATED','fr_CA','','','');
/*!40000 ALTER TABLE `email_templates_default_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_settings`
--

DROP TABLE IF EXISTS `email_templates_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_settings` (
  `email_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  UNIQUE KEY `email_settings_pkey` (`email_id`,`locale`,`setting_name`),
  KEY `email_templates_settings_email_id` (`email_id`),
  CONSTRAINT `email_templates_settings_email_id` FOREIGN KEY (`email_id`) REFERENCES `email_templates` (`email_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=612 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,19,'2023-01-09 23:24:39',268435458,'submission.event.general.metadataUpdated',0),(2,1048585,1,19,'2023-01-09 23:24:39',268435458,'submission.event.general.metadataUpdated',0),(3,515,1,19,'2023-01-09 23:24:43',1342177281,'submission.event.fileUploaded',0),(4,1048585,1,19,'2023-01-09 23:24:43',1342177288,'submission.event.fileRevised',0),(5,515,1,19,'2023-01-09 23:24:43',1342177296,'submission.event.fileEdited',0),(6,1048585,1,19,'2023-01-09 23:24:43',1342177296,'submission.event.fileEdited',0),(7,515,2,19,'2023-01-09 23:24:44',1342177281,'submission.event.fileUploaded',0),(8,1048585,1,19,'2023-01-09 23:24:44',1342177288,'submission.event.fileRevised',0),(9,515,2,19,'2023-01-09 23:24:44',1342177296,'submission.event.fileEdited',0),(10,1048585,1,19,'2023-01-09 23:24:44',1342177296,'submission.event.fileEdited',0),(11,515,3,19,'2023-01-09 23:24:45',1342177281,'submission.event.fileUploaded',0),(12,1048585,1,19,'2023-01-09 23:24:45',1342177288,'submission.event.fileRevised',0),(13,515,3,19,'2023-01-09 23:24:45',1342177296,'submission.event.fileEdited',0),(14,1048585,1,19,'2023-01-09 23:24:45',1342177296,'submission.event.fileEdited',0),(15,1048585,1,19,'2023-01-09 23:25:05',268435457,'submission.event.submissionSubmitted',0),(16,1048585,1,3,'2023-01-09 23:25:18',805306371,'editor.submission.decision.sendExternalReview.log',0),(17,515,4,3,'2023-01-09 23:25:18',1342177281,'submission.event.fileUploaded',0),(18,1048585,1,3,'2023-01-09 23:25:18',1342177288,'submission.event.fileRevised',0),(19,515,5,3,'2023-01-09 23:25:19',1342177281,'submission.event.fileUploaded',0),(20,1048585,1,3,'2023-01-09 23:25:19',1342177288,'submission.event.fileRevised',0),(21,515,6,3,'2023-01-09 23:25:19',1342177281,'submission.event.fileUploaded',0),(22,1048585,1,3,'2023-01-09 23:25:19',1342177288,'submission.event.fileRevised',0),(23,1048585,1,3,'2023-01-09 23:25:29',1073741825,'log.review.reviewerAssigned',0),(24,1048585,1,3,'2023-01-09 23:25:35',805306371,'editor.submission.decision.accept.log',0),(25,1048585,1,3,'2023-01-09 23:25:43',268435459,'submission.event.participantAdded',0),(26,1048585,2,20,'2023-01-09 23:25:56',268435458,'submission.event.general.metadataUpdated',0),(27,1048585,2,20,'2023-01-09 23:25:57',268435458,'submission.event.general.metadataUpdated',0),(28,515,7,20,'2023-01-09 23:26:00',1342177281,'submission.event.fileUploaded',0),(29,1048585,2,20,'2023-01-09 23:26:00',1342177288,'submission.event.fileRevised',0),(30,515,7,20,'2023-01-09 23:26:00',1342177296,'submission.event.fileEdited',0),(31,1048585,2,20,'2023-01-09 23:26:00',1342177296,'submission.event.fileEdited',0),(32,515,8,20,'2023-01-09 23:26:01',1342177281,'submission.event.fileUploaded',0),(33,1048585,2,20,'2023-01-09 23:26:01',1342177288,'submission.event.fileRevised',0),(34,515,8,20,'2023-01-09 23:26:02',1342177296,'submission.event.fileEdited',0),(35,1048585,2,20,'2023-01-09 23:26:02',1342177296,'submission.event.fileEdited',0),(36,515,9,20,'2023-01-09 23:26:02',1342177281,'submission.event.fileUploaded',0),(37,1048585,2,20,'2023-01-09 23:26:02',1342177288,'submission.event.fileRevised',0),(38,515,9,20,'2023-01-09 23:26:03',1342177296,'submission.event.fileEdited',0),(39,1048585,2,20,'2023-01-09 23:26:03',1342177296,'submission.event.fileEdited',0),(40,515,10,20,'2023-01-09 23:26:04',1342177281,'submission.event.fileUploaded',0),(41,1048585,2,20,'2023-01-09 23:26:04',1342177288,'submission.event.fileRevised',0),(42,515,10,20,'2023-01-09 23:26:04',1342177296,'submission.event.fileEdited',0),(43,1048585,2,20,'2023-01-09 23:26:04',1342177296,'submission.event.fileEdited',0),(44,515,11,20,'2023-01-09 23:26:05',1342177281,'submission.event.fileUploaded',0),(45,1048585,2,20,'2023-01-09 23:26:05',1342177288,'submission.event.fileRevised',0),(46,515,11,20,'2023-01-09 23:26:05',1342177296,'submission.event.fileEdited',0),(47,1048585,2,20,'2023-01-09 23:26:05',1342177296,'submission.event.fileEdited',0),(48,1048585,2,20,'2023-01-09 23:26:50',268435458,'submission.event.general.metadataUpdated',0),(49,1048585,2,20,'2023-01-09 23:27:53',268435457,'submission.event.submissionSubmitted',0),(50,1048585,2,3,'2023-01-09 23:28:20',805306371,'editor.submission.decision.sendExternalReview.log',0),(51,515,12,3,'2023-01-09 23:28:21',1342177281,'submission.event.fileUploaded',0),(52,1048585,2,3,'2023-01-09 23:28:21',1342177288,'submission.event.fileRevised',0),(53,515,13,3,'2023-01-09 23:28:21',1342177281,'submission.event.fileUploaded',0),(54,1048585,2,3,'2023-01-09 23:28:21',1342177288,'submission.event.fileRevised',0),(55,515,14,3,'2023-01-09 23:28:21',1342177281,'submission.event.fileUploaded',0),(56,1048585,2,3,'2023-01-09 23:28:21',1342177288,'submission.event.fileRevised',0),(57,515,15,3,'2023-01-09 23:28:21',1342177281,'submission.event.fileUploaded',0),(58,1048585,2,3,'2023-01-09 23:28:21',1342177288,'submission.event.fileRevised',0),(59,1048585,2,3,'2023-01-09 23:28:35',1073741825,'log.review.reviewerAssigned',0),(60,1048585,2,3,'2023-01-09 23:28:46',1073741825,'log.review.reviewerAssigned',0),(61,1048585,3,21,'2023-01-09 23:28:58',268435458,'submission.event.general.metadataUpdated',0),(62,1048585,3,21,'2023-01-09 23:28:58',268435458,'submission.event.general.metadataUpdated',0),(63,515,16,21,'2023-01-09 23:29:01',1342177281,'submission.event.fileUploaded',0),(64,1048585,3,21,'2023-01-09 23:29:01',1342177288,'submission.event.fileRevised',0),(65,515,16,21,'2023-01-09 23:29:02',1342177296,'submission.event.fileEdited',0),(66,1048585,3,21,'2023-01-09 23:29:02',1342177296,'submission.event.fileEdited',0),(67,515,17,21,'2023-01-09 23:29:03',1342177281,'submission.event.fileUploaded',0),(68,1048585,3,21,'2023-01-09 23:29:03',1342177288,'submission.event.fileRevised',0),(69,515,17,21,'2023-01-09 23:29:03',1342177296,'submission.event.fileEdited',0),(70,1048585,3,21,'2023-01-09 23:29:03',1342177296,'submission.event.fileEdited',0),(71,515,18,21,'2023-01-09 23:29:04',1342177281,'submission.event.fileUploaded',0),(72,1048585,3,21,'2023-01-09 23:29:04',1342177288,'submission.event.fileRevised',0),(73,515,18,21,'2023-01-09 23:29:04',1342177296,'submission.event.fileEdited',0),(74,1048585,3,21,'2023-01-09 23:29:04',1342177296,'submission.event.fileEdited',0),(75,515,19,21,'2023-01-09 23:29:05',1342177281,'submission.event.fileUploaded',0),(76,1048585,3,21,'2023-01-09 23:29:05',1342177288,'submission.event.fileRevised',0),(77,515,19,21,'2023-01-09 23:29:06',1342177296,'submission.event.fileEdited',0),(78,1048585,3,21,'2023-01-09 23:29:06',1342177296,'submission.event.fileEdited',0),(79,515,20,21,'2023-01-09 23:29:06',1342177281,'submission.event.fileUploaded',0),(80,1048585,3,21,'2023-01-09 23:29:06',1342177288,'submission.event.fileRevised',0),(81,515,20,21,'2023-01-09 23:29:07',1342177296,'submission.event.fileEdited',0),(82,1048585,3,21,'2023-01-09 23:29:07',1342177296,'submission.event.fileEdited',0),(83,1048585,3,21,'2023-01-09 23:29:44',268435457,'submission.event.submissionSubmitted',0),(84,1048585,4,22,'2023-01-09 23:29:55',268435458,'submission.event.general.metadataUpdated',0),(85,1048585,4,22,'2023-01-09 23:29:56',268435458,'submission.event.general.metadataUpdated',0),(86,515,21,22,'2023-01-09 23:29:59',1342177281,'submission.event.fileUploaded',0),(87,1048585,4,22,'2023-01-09 23:29:59',1342177288,'submission.event.fileRevised',0),(88,515,21,22,'2023-01-09 23:29:59',1342177296,'submission.event.fileEdited',0),(89,1048585,4,22,'2023-01-09 23:29:59',1342177296,'submission.event.fileEdited',0),(90,515,22,22,'2023-01-09 23:30:00',1342177281,'submission.event.fileUploaded',0),(91,1048585,4,22,'2023-01-09 23:30:00',1342177288,'submission.event.fileRevised',0),(92,515,22,22,'2023-01-09 23:30:00',1342177296,'submission.event.fileEdited',0),(93,1048585,4,22,'2023-01-09 23:30:00',1342177296,'submission.event.fileEdited',0),(94,515,23,22,'2023-01-09 23:30:01',1342177281,'submission.event.fileUploaded',0),(95,1048585,4,22,'2023-01-09 23:30:01',1342177288,'submission.event.fileRevised',0),(96,515,23,22,'2023-01-09 23:30:02',1342177296,'submission.event.fileEdited',0),(97,1048585,4,22,'2023-01-09 23:30:02',1342177296,'submission.event.fileEdited',0),(98,515,24,22,'2023-01-09 23:30:02',1342177281,'submission.event.fileUploaded',0),(99,1048585,4,22,'2023-01-09 23:30:02',1342177288,'submission.event.fileRevised',0),(100,515,24,22,'2023-01-09 23:30:03',1342177296,'submission.event.fileEdited',0),(101,1048585,4,22,'2023-01-09 23:30:03',1342177296,'submission.event.fileEdited',0),(102,1048585,4,22,'2023-01-09 23:30:34',268435457,'submission.event.submissionSubmitted',0),(103,1048585,4,3,'2023-01-09 23:30:49',805306371,'editor.submission.decision.sendInternalReview.log',0),(104,515,25,3,'2023-01-09 23:30:50',1342177281,'submission.event.fileUploaded',0),(105,1048585,4,3,'2023-01-09 23:30:50',1342177288,'submission.event.fileRevised',0),(106,515,26,3,'2023-01-09 23:30:50',1342177281,'submission.event.fileUploaded',0),(107,1048585,4,3,'2023-01-09 23:30:50',1342177288,'submission.event.fileRevised',0),(108,515,27,3,'2023-01-09 23:30:50',1342177281,'submission.event.fileUploaded',0),(109,1048585,4,3,'2023-01-09 23:30:50',1342177288,'submission.event.fileRevised',0),(110,515,28,3,'2023-01-09 23:30:50',1342177281,'submission.event.fileUploaded',0),(111,1048585,4,3,'2023-01-09 23:30:50',1342177288,'submission.event.fileRevised',0),(112,1048585,4,3,'2023-01-09 23:31:01',1073741825,'log.review.reviewerAssigned',0),(113,1048585,4,3,'2023-01-09 23:31:07',805306371,'editor.submission.decision.sendExternalReview.log',0),(114,1048585,4,3,'2023-01-09 23:31:18',1073741825,'log.review.reviewerAssigned',0),(115,1048585,4,3,'2023-01-09 23:31:25',805306371,'editor.submission.decision.accept.log',0),(116,1048585,4,3,'2023-01-09 23:31:35',268435459,'submission.event.participantAdded',0),(117,1048585,4,3,'2023-01-09 23:31:43',805306371,'editor.submission.decision.sendToProduction.log',0),(118,1048585,4,3,'2023-01-09 23:31:53',268435459,'submission.event.participantAdded',0),(119,1048585,4,3,'2023-01-09 23:32:01',268435474,'submission.event.publicationFormatCreated',0),(120,1048585,5,23,'2023-01-09 23:32:10',268435458,'submission.event.general.metadataUpdated',0),(121,1048585,5,23,'2023-01-09 23:32:11',268435458,'submission.event.general.metadataUpdated',0),(122,515,29,23,'2023-01-09 23:32:14',1342177281,'submission.event.fileUploaded',0),(123,1048585,5,23,'2023-01-09 23:32:14',1342177288,'submission.event.fileRevised',0),(124,515,29,23,'2023-01-09 23:32:14',1342177296,'submission.event.fileEdited',0),(125,1048585,5,23,'2023-01-09 23:32:14',1342177296,'submission.event.fileEdited',0),(126,515,30,23,'2023-01-09 23:32:15',1342177281,'submission.event.fileUploaded',0),(127,1048585,5,23,'2023-01-09 23:32:15',1342177288,'submission.event.fileRevised',0),(128,515,30,23,'2023-01-09 23:32:16',1342177296,'submission.event.fileEdited',0),(129,1048585,5,23,'2023-01-09 23:32:16',1342177296,'submission.event.fileEdited',0),(130,515,31,23,'2023-01-09 23:32:16',1342177281,'submission.event.fileUploaded',0),(131,1048585,5,23,'2023-01-09 23:32:16',1342177288,'submission.event.fileRevised',0),(132,515,31,23,'2023-01-09 23:32:17',1342177296,'submission.event.fileEdited',0),(133,1048585,5,23,'2023-01-09 23:32:17',1342177296,'submission.event.fileEdited',0),(134,515,32,23,'2023-01-09 23:32:18',1342177281,'submission.event.fileUploaded',0),(135,1048585,5,23,'2023-01-09 23:32:18',1342177288,'submission.event.fileRevised',0),(136,515,32,23,'2023-01-09 23:32:18',1342177296,'submission.event.fileEdited',0),(137,1048585,5,23,'2023-01-09 23:32:18',1342177296,'submission.event.fileEdited',0),(138,515,33,23,'2023-01-09 23:32:19',1342177281,'submission.event.fileUploaded',0),(139,1048585,5,23,'2023-01-09 23:32:19',1342177288,'submission.event.fileRevised',0),(140,515,33,23,'2023-01-09 23:32:19',1342177296,'submission.event.fileEdited',0),(141,1048585,5,23,'2023-01-09 23:32:19',1342177296,'submission.event.fileEdited',0),(142,515,34,23,'2023-01-09 23:32:20',1342177281,'submission.event.fileUploaded',0),(143,1048585,5,23,'2023-01-09 23:32:20',1342177288,'submission.event.fileRevised',0),(144,515,34,23,'2023-01-09 23:32:21',1342177296,'submission.event.fileEdited',0),(145,1048585,5,23,'2023-01-09 23:32:21',1342177296,'submission.event.fileEdited',0),(146,1048585,5,23,'2023-01-09 23:33:06',268435457,'submission.event.submissionSubmitted',0),(147,1048585,5,3,'2023-01-09 23:33:24',805306371,'editor.submission.decision.sendInternalReview.log',0),(148,515,35,3,'2023-01-09 23:33:24',1342177281,'submission.event.fileUploaded',0),(149,1048585,5,3,'2023-01-09 23:33:24',1342177288,'submission.event.fileRevised',0),(150,515,36,3,'2023-01-09 23:33:24',1342177281,'submission.event.fileUploaded',0),(151,1048585,5,3,'2023-01-09 23:33:24',1342177288,'submission.event.fileRevised',0),(152,515,37,3,'2023-01-09 23:33:24',1342177281,'submission.event.fileUploaded',0),(153,1048585,5,3,'2023-01-09 23:33:24',1342177288,'submission.event.fileRevised',0),(154,515,38,3,'2023-01-09 23:33:25',1342177281,'submission.event.fileUploaded',0),(155,1048585,5,3,'2023-01-09 23:33:25',1342177288,'submission.event.fileRevised',0),(156,515,39,3,'2023-01-09 23:33:25',1342177281,'submission.event.fileUploaded',0),(157,1048585,5,3,'2023-01-09 23:33:25',1342177288,'submission.event.fileRevised',0),(158,515,40,3,'2023-01-09 23:33:25',1342177281,'submission.event.fileUploaded',0),(159,1048585,5,3,'2023-01-09 23:33:25',1342177288,'submission.event.fileRevised',0),(160,1048585,5,3,'2023-01-09 23:33:36',1073741825,'log.review.reviewerAssigned',0),(161,1048585,5,3,'2023-01-09 23:33:43',805306371,'editor.submission.decision.sendExternalReview.log',0),(162,1048585,5,3,'2023-01-09 23:33:55',1073741825,'log.review.reviewerAssigned',0),(163,1048585,5,3,'2023-01-09 23:34:02',805306371,'editor.submission.decision.accept.log',0),(164,1048585,5,3,'2023-01-09 23:34:13',268435459,'submission.event.participantAdded',0),(165,1048585,5,3,'2023-01-09 23:34:21',805306371,'editor.submission.decision.sendToProduction.log',0),(166,1048585,5,3,'2023-01-09 23:34:33',268435459,'submission.event.participantAdded',0),(167,1048585,5,3,'2023-01-09 23:34:40',268435459,'submission.event.participantAdded',0),(168,1048585,5,3,'2023-01-09 23:34:47',268435474,'submission.event.publicationFormatCreated',0),(169,515,41,3,'2023-01-09 23:34:50',1342177281,'submission.event.fileUploaded',0),(170,1048585,5,3,'2023-01-09 23:34:50',1342177288,'submission.event.fileRevised',0),(171,1048585,5,3,'2023-01-09 23:34:53',268435464,'submission.event.publicationFormatPublished',0),(172,1048585,5,3,'2023-01-09 23:34:56',268435476,'submission.event.publicationFormatMadeAvailable',0),(173,515,41,3,'2023-01-09 23:34:58',1342177296,'submission.event.fileEdited',0),(174,1048585,5,3,'2023-01-09 23:34:58',1342177296,'submission.event.fileEdited',0),(175,515,41,3,'2023-01-09 23:34:58',1342177287,'submission.event.signoffSignoff',0),(176,515,41,3,'2023-01-09 23:35:01',1342177296,'submission.event.fileEdited',0),(177,1048585,5,3,'2023-01-09 23:35:01',1342177296,'submission.event.fileEdited',0),(178,1048585,5,3,'2023-01-09 23:35:04',268435462,'publication.event.published',0),(179,1048585,5,3,'2023-01-09 23:35:15',268435463,'publication.event.unpublished',0),(180,1048585,5,3,'2023-01-09 23:35:26',268435462,'publication.event.published',0),(181,1048585,6,24,'2023-01-09 23:35:36',268435458,'submission.event.general.metadataUpdated',0),(182,1048585,6,24,'2023-01-09 23:35:37',268435458,'submission.event.general.metadataUpdated',0),(183,515,42,24,'2023-01-09 23:35:40',1342177281,'submission.event.fileUploaded',0),(184,1048585,6,24,'2023-01-09 23:35:40',1342177288,'submission.event.fileRevised',0),(185,515,42,24,'2023-01-09 23:35:40',1342177296,'submission.event.fileEdited',0),(186,1048585,6,24,'2023-01-09 23:35:40',1342177296,'submission.event.fileEdited',0),(187,515,43,24,'2023-01-09 23:35:41',1342177281,'submission.event.fileUploaded',0),(188,1048585,6,24,'2023-01-09 23:35:41',1342177288,'submission.event.fileRevised',0),(189,515,43,24,'2023-01-09 23:35:42',1342177296,'submission.event.fileEdited',0),(190,1048585,6,24,'2023-01-09 23:35:42',1342177296,'submission.event.fileEdited',0),(191,515,44,24,'2023-01-09 23:35:42',1342177281,'submission.event.fileUploaded',0),(192,1048585,6,24,'2023-01-09 23:35:42',1342177288,'submission.event.fileRevised',0),(193,515,44,24,'2023-01-09 23:35:43',1342177296,'submission.event.fileEdited',0),(194,1048585,6,24,'2023-01-09 23:35:43',1342177296,'submission.event.fileEdited',0),(195,515,45,24,'2023-01-09 23:35:44',1342177281,'submission.event.fileUploaded',0),(196,1048585,6,24,'2023-01-09 23:35:44',1342177288,'submission.event.fileRevised',0),(197,515,45,24,'2023-01-09 23:35:44',1342177296,'submission.event.fileEdited',0),(198,1048585,6,24,'2023-01-09 23:35:44',1342177296,'submission.event.fileEdited',0),(199,1048585,6,24,'2023-01-09 23:36:13',268435457,'submission.event.submissionSubmitted',0),(200,1048585,6,3,'2023-01-09 23:36:29',805306371,'editor.submission.decision.sendInternalReview.log',0),(201,515,46,3,'2023-01-09 23:36:30',1342177281,'submission.event.fileUploaded',0),(202,1048585,6,3,'2023-01-09 23:36:30',1342177288,'submission.event.fileRevised',0),(203,515,47,3,'2023-01-09 23:36:30',1342177281,'submission.event.fileUploaded',0),(204,1048585,6,3,'2023-01-09 23:36:30',1342177288,'submission.event.fileRevised',0),(205,515,48,3,'2023-01-09 23:36:30',1342177281,'submission.event.fileUploaded',0),(206,1048585,6,3,'2023-01-09 23:36:30',1342177288,'submission.event.fileRevised',0),(207,515,49,3,'2023-01-09 23:36:30',1342177281,'submission.event.fileUploaded',0),(208,1048585,6,3,'2023-01-09 23:36:30',1342177288,'submission.event.fileRevised',0),(209,1048585,6,3,'2023-01-09 23:36:39',268435459,'submission.event.participantAdded',0),(210,1048585,6,3,'2023-01-09 23:36:45',268435459,'submission.event.participantAdded',0),(211,1048585,6,3,'2023-01-09 23:36:51',268435459,'submission.event.participantAdded',0),(212,1048585,6,6,'2023-01-09 23:37:07',805306372,'editor.submission.recommend.accept.log',0),(213,1048585,7,25,'2023-01-09 23:37:31',268435458,'submission.event.general.metadataUpdated',0),(214,1048585,7,25,'2023-01-09 23:37:32',268435458,'submission.event.general.metadataUpdated',0),(215,515,50,25,'2023-01-09 23:37:35',1342177281,'submission.event.fileUploaded',0),(216,1048585,7,25,'2023-01-09 23:37:35',1342177288,'submission.event.fileRevised',0),(217,515,50,25,'2023-01-09 23:37:35',1342177296,'submission.event.fileEdited',0),(218,1048585,7,25,'2023-01-09 23:37:35',1342177296,'submission.event.fileEdited',0),(219,515,51,25,'2023-01-09 23:37:36',1342177281,'submission.event.fileUploaded',0),(220,1048585,7,25,'2023-01-09 23:37:36',1342177288,'submission.event.fileRevised',0),(221,515,51,25,'2023-01-09 23:37:36',1342177296,'submission.event.fileEdited',0),(222,1048585,7,25,'2023-01-09 23:37:36',1342177296,'submission.event.fileEdited',0),(223,515,52,25,'2023-01-09 23:37:37',1342177281,'submission.event.fileUploaded',0),(224,1048585,7,25,'2023-01-09 23:37:37',1342177288,'submission.event.fileRevised',0),(225,515,52,25,'2023-01-09 23:37:38',1342177296,'submission.event.fileEdited',0),(226,1048585,7,25,'2023-01-09 23:37:38',1342177296,'submission.event.fileEdited',0),(227,515,53,25,'2023-01-09 23:37:38',1342177281,'submission.event.fileUploaded',0),(228,1048585,7,25,'2023-01-09 23:37:38',1342177288,'submission.event.fileRevised',0),(229,515,53,25,'2023-01-09 23:37:39',1342177296,'submission.event.fileEdited',0),(230,1048585,7,25,'2023-01-09 23:37:39',1342177296,'submission.event.fileEdited',0),(231,515,54,25,'2023-01-09 23:37:40',1342177281,'submission.event.fileUploaded',0),(232,1048585,7,25,'2023-01-09 23:37:40',1342177288,'submission.event.fileRevised',0),(233,515,54,25,'2023-01-09 23:37:40',1342177296,'submission.event.fileEdited',0),(234,1048585,7,25,'2023-01-09 23:37:40',1342177296,'submission.event.fileEdited',0),(235,1048585,7,25,'2023-01-09 23:38:20',268435457,'submission.event.submissionSubmitted',0),(236,1048585,7,3,'2023-01-09 23:38:37',805306371,'editor.submission.decision.sendExternalReview.log',0),(237,515,55,3,'2023-01-09 23:38:38',1342177281,'submission.event.fileUploaded',0),(238,1048585,7,3,'2023-01-09 23:38:38',1342177288,'submission.event.fileRevised',0),(239,515,56,3,'2023-01-09 23:38:38',1342177281,'submission.event.fileUploaded',0),(240,1048585,7,3,'2023-01-09 23:38:38',1342177288,'submission.event.fileRevised',0),(241,515,57,3,'2023-01-09 23:38:38',1342177281,'submission.event.fileUploaded',0),(242,1048585,7,3,'2023-01-09 23:38:38',1342177288,'submission.event.fileRevised',0),(243,515,58,3,'2023-01-09 23:38:38',1342177281,'submission.event.fileUploaded',0),(244,1048585,7,3,'2023-01-09 23:38:38',1342177288,'submission.event.fileRevised',0),(245,515,59,3,'2023-01-09 23:38:38',1342177281,'submission.event.fileUploaded',0),(246,1048585,7,3,'2023-01-09 23:38:38',1342177288,'submission.event.fileRevised',0),(247,1048585,7,3,'2023-01-09 23:38:49',1073741825,'log.review.reviewerAssigned',0),(248,1048585,7,3,'2023-01-09 23:38:56',805306371,'editor.submission.decision.accept.log',0),(249,1048585,7,3,'2023-01-09 23:39:07',268435459,'submission.event.participantAdded',0),(250,1048585,8,3,'2023-01-09 23:39:19',268435458,'submission.event.general.metadataUpdated',0),(251,515,60,3,'2023-01-09 23:39:22',1342177281,'submission.event.fileUploaded',0),(252,1048585,8,3,'2023-01-09 23:39:22',1342177288,'submission.event.fileRevised',0),(253,515,60,3,'2023-01-09 23:39:23',1342177296,'submission.event.fileEdited',0),(254,1048585,8,3,'2023-01-09 23:39:23',1342177296,'submission.event.fileEdited',0),(255,1048585,8,3,'2023-01-09 23:39:24',268435457,'submission.event.submissionSubmitted',0),(256,1048585,9,26,'2023-01-09 23:39:33',268435458,'submission.event.general.metadataUpdated',0),(257,1048585,9,26,'2023-01-09 23:39:33',268435458,'submission.event.general.metadataUpdated',0),(258,515,61,26,'2023-01-09 23:39:36',1342177281,'submission.event.fileUploaded',0),(259,1048585,9,26,'2023-01-09 23:39:36',1342177288,'submission.event.fileRevised',0),(260,515,61,26,'2023-01-09 23:39:37',1342177296,'submission.event.fileEdited',0),(261,1048585,9,26,'2023-01-09 23:39:37',1342177296,'submission.event.fileEdited',0),(262,515,62,26,'2023-01-09 23:39:37',1342177281,'submission.event.fileUploaded',0),(263,1048585,9,26,'2023-01-09 23:39:37',1342177288,'submission.event.fileRevised',0),(264,515,62,26,'2023-01-09 23:39:38',1342177296,'submission.event.fileEdited',0),(265,1048585,9,26,'2023-01-09 23:39:38',1342177296,'submission.event.fileEdited',0),(266,515,63,26,'2023-01-09 23:39:39',1342177281,'submission.event.fileUploaded',0),(267,1048585,9,26,'2023-01-09 23:39:39',1342177288,'submission.event.fileRevised',0),(268,515,63,26,'2023-01-09 23:39:39',1342177296,'submission.event.fileEdited',0),(269,1048585,9,26,'2023-01-09 23:39:39',1342177296,'submission.event.fileEdited',0),(270,515,64,26,'2023-01-09 23:39:40',1342177281,'submission.event.fileUploaded',0),(271,1048585,9,26,'2023-01-09 23:39:40',1342177288,'submission.event.fileRevised',0),(272,515,64,26,'2023-01-09 23:39:40',1342177296,'submission.event.fileEdited',0),(273,1048585,9,26,'2023-01-09 23:39:40',1342177296,'submission.event.fileEdited',0),(274,515,65,26,'2023-01-09 23:39:41',1342177281,'submission.event.fileUploaded',0),(275,1048585,9,26,'2023-01-09 23:39:41',1342177288,'submission.event.fileRevised',0),(276,515,65,26,'2023-01-09 23:39:42',1342177296,'submission.event.fileEdited',0),(277,1048585,9,26,'2023-01-09 23:39:42',1342177296,'submission.event.fileEdited',0),(278,1048585,9,26,'2023-01-09 23:40:21',268435457,'submission.event.submissionSubmitted',0),(279,1048585,9,3,'2023-01-09 23:40:39',805306371,'editor.submission.decision.sendInternalReview.log',0),(280,515,66,3,'2023-01-09 23:40:39',1342177281,'submission.event.fileUploaded',0),(281,1048585,9,3,'2023-01-09 23:40:39',1342177288,'submission.event.fileRevised',0),(282,515,67,3,'2023-01-09 23:40:39',1342177281,'submission.event.fileUploaded',0),(283,1048585,9,3,'2023-01-09 23:40:39',1342177288,'submission.event.fileRevised',0),(284,515,68,3,'2023-01-09 23:40:39',1342177281,'submission.event.fileUploaded',0),(285,1048585,9,3,'2023-01-09 23:40:39',1342177288,'submission.event.fileRevised',0),(286,515,69,3,'2023-01-09 23:40:40',1342177281,'submission.event.fileUploaded',0),(287,1048585,9,3,'2023-01-09 23:40:40',1342177288,'submission.event.fileRevised',0),(288,515,70,3,'2023-01-09 23:40:40',1342177281,'submission.event.fileUploaded',0),(289,1048585,9,3,'2023-01-09 23:40:40',1342177288,'submission.event.fileRevised',0),(290,1048585,10,27,'2023-01-09 23:40:55',268435458,'submission.event.general.metadataUpdated',0),(291,1048585,10,27,'2023-01-09 23:40:55',268435458,'submission.event.general.metadataUpdated',0),(292,515,71,27,'2023-01-09 23:40:58',1342177281,'submission.event.fileUploaded',0),(293,1048585,10,27,'2023-01-09 23:40:58',1342177288,'submission.event.fileRevised',0),(294,515,71,27,'2023-01-09 23:40:59',1342177296,'submission.event.fileEdited',0),(295,1048585,10,27,'2023-01-09 23:40:59',1342177296,'submission.event.fileEdited',0),(296,515,72,27,'2023-01-09 23:40:59',1342177281,'submission.event.fileUploaded',0),(297,1048585,10,27,'2023-01-09 23:40:59',1342177288,'submission.event.fileRevised',0),(298,515,72,27,'2023-01-09 23:41:00',1342177296,'submission.event.fileEdited',0),(299,1048585,10,27,'2023-01-09 23:41:00',1342177296,'submission.event.fileEdited',0),(300,515,73,27,'2023-01-09 23:41:01',1342177281,'submission.event.fileUploaded',0),(301,1048585,10,27,'2023-01-09 23:41:01',1342177288,'submission.event.fileRevised',0),(302,515,73,27,'2023-01-09 23:41:01',1342177296,'submission.event.fileEdited',0),(303,1048585,10,27,'2023-01-09 23:41:01',1342177296,'submission.event.fileEdited',0),(304,515,74,27,'2023-01-09 23:41:02',1342177281,'submission.event.fileUploaded',0),(305,1048585,10,27,'2023-01-09 23:41:02',1342177288,'submission.event.fileRevised',0),(306,515,74,27,'2023-01-09 23:41:02',1342177296,'submission.event.fileEdited',0),(307,1048585,10,27,'2023-01-09 23:41:02',1342177296,'submission.event.fileEdited',0),(308,515,75,27,'2023-01-09 23:41:03',1342177281,'submission.event.fileUploaded',0),(309,1048585,10,27,'2023-01-09 23:41:03',1342177288,'submission.event.fileRevised',0),(310,515,75,27,'2023-01-09 23:41:04',1342177296,'submission.event.fileEdited',0),(311,1048585,10,27,'2023-01-09 23:41:04',1342177296,'submission.event.fileEdited',0),(312,515,76,27,'2023-01-09 23:41:05',1342177281,'submission.event.fileUploaded',0),(313,1048585,10,27,'2023-01-09 23:41:05',1342177288,'submission.event.fileRevised',0),(314,515,76,27,'2023-01-09 23:41:05',1342177296,'submission.event.fileEdited',0),(315,1048585,10,27,'2023-01-09 23:41:05',1342177296,'submission.event.fileEdited',0),(316,515,77,27,'2023-01-09 23:41:06',1342177281,'submission.event.fileUploaded',0),(317,1048585,10,27,'2023-01-09 23:41:06',1342177288,'submission.event.fileRevised',0),(318,515,77,27,'2023-01-09 23:41:06',1342177296,'submission.event.fileEdited',0),(319,1048585,10,27,'2023-01-09 23:41:06',1342177296,'submission.event.fileEdited',0),(320,515,78,27,'2023-01-09 23:41:07',1342177281,'submission.event.fileUploaded',0),(321,1048585,10,27,'2023-01-09 23:41:07',1342177288,'submission.event.fileRevised',0),(322,515,78,27,'2023-01-09 23:41:08',1342177296,'submission.event.fileEdited',0),(323,1048585,10,27,'2023-01-09 23:41:08',1342177296,'submission.event.fileEdited',0),(324,515,79,27,'2023-01-09 23:41:09',1342177281,'submission.event.fileUploaded',0),(325,1048585,10,27,'2023-01-09 23:41:09',1342177288,'submission.event.fileRevised',0),(326,515,79,27,'2023-01-09 23:41:09',1342177296,'submission.event.fileEdited',0),(327,1048585,10,27,'2023-01-09 23:41:09',1342177296,'submission.event.fileEdited',0),(328,1048585,10,27,'2023-01-09 23:42:27',268435457,'submission.event.submissionSubmitted',0),(329,1048585,11,28,'2023-01-09 23:42:38',268435458,'submission.event.general.metadataUpdated',0),(330,1048585,11,28,'2023-01-09 23:42:38',268435458,'submission.event.general.metadataUpdated',0),(331,515,80,28,'2023-01-09 23:42:41',1342177281,'submission.event.fileUploaded',0),(332,1048585,11,28,'2023-01-09 23:42:41',1342177288,'submission.event.fileRevised',0),(333,515,80,28,'2023-01-09 23:42:42',1342177296,'submission.event.fileEdited',0),(334,1048585,11,28,'2023-01-09 23:42:42',1342177296,'submission.event.fileEdited',0),(335,515,81,28,'2023-01-09 23:42:42',1342177281,'submission.event.fileUploaded',0),(336,1048585,11,28,'2023-01-09 23:42:42',1342177288,'submission.event.fileRevised',0),(337,515,81,28,'2023-01-09 23:42:43',1342177296,'submission.event.fileEdited',0),(338,1048585,11,28,'2023-01-09 23:42:43',1342177296,'submission.event.fileEdited',0),(339,1048585,11,28,'2023-01-09 23:42:55',268435457,'submission.event.submissionSubmitted',0),(340,1048585,11,3,'2023-01-09 23:43:11',805306371,'editor.submission.decision.sendInternalReview.log',0),(341,515,82,3,'2023-01-09 23:43:11',1342177281,'submission.event.fileUploaded',0),(342,1048585,11,3,'2023-01-09 23:43:11',1342177288,'submission.event.fileRevised',0),(343,515,83,3,'2023-01-09 23:43:11',1342177281,'submission.event.fileUploaded',0),(344,1048585,11,3,'2023-01-09 23:43:11',1342177288,'submission.event.fileRevised',0),(345,1048585,11,3,'2023-01-09 23:43:21',1073741825,'log.review.reviewerAssigned',0),(346,1048585,11,3,'2023-01-09 23:43:26',805306371,'editor.submission.decision.sendExternalReview.log',0),(347,1048585,11,3,'2023-01-09 23:43:36',1073741825,'log.review.reviewerAssigned',0),(348,1048585,11,3,'2023-01-09 23:43:44',1073741825,'log.review.reviewerAssigned',0),(349,1048585,11,10,'2023-01-09 23:43:52',1073741830,'log.review.reviewAccepted',0),(350,1048585,11,10,'2023-01-09 23:43:56',1073741848,'log.review.reviewReady',0),(351,1048585,11,12,'2023-01-09 23:44:03',1073741830,'log.review.reviewAccepted',0),(352,1048585,11,12,'2023-01-09 23:44:07',1073741848,'log.review.reviewReady',0),(353,1048585,11,3,'2023-01-09 23:44:27',805306371,'editor.submission.decision.accept.log',0),(354,1048585,11,3,'2023-01-09 23:44:27',1073741856,'submission.event.decisionReviewerEmailSent',0),(355,1048585,12,29,'2023-01-09 23:44:41',268435458,'submission.event.general.metadataUpdated',0),(356,1048585,12,29,'2023-01-09 23:44:42',268435458,'submission.event.general.metadataUpdated',0),(357,515,84,29,'2023-01-09 23:44:45',1342177281,'submission.event.fileUploaded',0),(358,1048585,12,29,'2023-01-09 23:44:45',1342177288,'submission.event.fileRevised',0),(359,515,84,29,'2023-01-09 23:44:45',1342177296,'submission.event.fileEdited',0),(360,1048585,12,29,'2023-01-09 23:44:45',1342177296,'submission.event.fileEdited',0),(361,515,85,29,'2023-01-09 23:44:46',1342177281,'submission.event.fileUploaded',0),(362,1048585,12,29,'2023-01-09 23:44:46',1342177288,'submission.event.fileRevised',0),(363,515,85,29,'2023-01-09 23:44:46',1342177296,'submission.event.fileEdited',0),(364,1048585,12,29,'2023-01-09 23:44:46',1342177296,'submission.event.fileEdited',0),(365,515,86,29,'2023-01-09 23:44:47',1342177281,'submission.event.fileUploaded',0),(366,1048585,12,29,'2023-01-09 23:44:47',1342177288,'submission.event.fileRevised',0),(367,515,86,29,'2023-01-09 23:44:48',1342177296,'submission.event.fileEdited',0),(368,1048585,12,29,'2023-01-09 23:44:48',1342177296,'submission.event.fileEdited',0),(369,1048585,12,29,'2023-01-09 23:45:11',268435457,'submission.event.submissionSubmitted',0),(370,1048585,12,3,'2023-01-09 23:45:28',805306371,'editor.submission.decision.sendInternalReview.log',0),(371,515,87,3,'2023-01-09 23:45:28',1342177281,'submission.event.fileUploaded',0),(372,1048585,12,3,'2023-01-09 23:45:28',1342177288,'submission.event.fileRevised',0),(373,515,88,3,'2023-01-09 23:45:28',1342177281,'submission.event.fileUploaded',0),(374,1048585,12,3,'2023-01-09 23:45:28',1342177288,'submission.event.fileRevised',0),(375,515,89,3,'2023-01-09 23:45:29',1342177281,'submission.event.fileUploaded',0),(376,1048585,12,3,'2023-01-09 23:45:29',1342177288,'submission.event.fileRevised',0),(377,1048585,12,3,'2023-01-09 23:45:39',1073741825,'log.review.reviewerAssigned',0),(378,1048585,12,3,'2023-01-09 23:45:46',1073741825,'log.review.reviewerAssigned',0),(379,1048585,12,3,'2023-01-09 23:45:54',1073741825,'log.review.reviewerAssigned',0),(380,1048585,12,8,'2023-01-09 23:46:02',1073741830,'log.review.reviewAccepted',0),(381,1048585,12,8,'2023-01-09 23:46:06',1073741848,'log.review.reviewReady',0),(382,1048585,13,30,'2023-01-09 23:46:16',268435458,'submission.event.general.metadataUpdated',0),(383,1048585,13,30,'2023-01-09 23:46:17',268435458,'submission.event.general.metadataUpdated',0),(384,515,90,30,'2023-01-09 23:46:20',1342177281,'submission.event.fileUploaded',0),(385,1048585,13,30,'2023-01-09 23:46:20',1342177288,'submission.event.fileRevised',0),(386,515,90,30,'2023-01-09 23:46:20',1342177296,'submission.event.fileEdited',0),(387,1048585,13,30,'2023-01-09 23:46:20',1342177296,'submission.event.fileEdited',0),(388,515,91,30,'2023-01-09 23:46:21',1342177281,'submission.event.fileUploaded',0),(389,1048585,13,30,'2023-01-09 23:46:21',1342177288,'submission.event.fileRevised',0),(390,515,91,30,'2023-01-09 23:46:21',1342177296,'submission.event.fileEdited',0),(391,1048585,13,30,'2023-01-09 23:46:21',1342177296,'submission.event.fileEdited',0),(392,515,92,30,'2023-01-09 23:46:22',1342177281,'submission.event.fileUploaded',0),(393,1048585,13,30,'2023-01-09 23:46:22',1342177288,'submission.event.fileRevised',0),(394,515,92,30,'2023-01-09 23:46:22',1342177296,'submission.event.fileEdited',0),(395,1048585,13,30,'2023-01-09 23:46:22',1342177296,'submission.event.fileEdited',0),(396,1048585,13,30,'2023-01-09 23:46:45',268435457,'submission.event.submissionSubmitted',0),(397,1048585,13,3,'2023-01-09 23:47:01',805306371,'editor.submission.decision.sendInternalReview.log',0),(398,515,93,3,'2023-01-09 23:47:02',1342177281,'submission.event.fileUploaded',0),(399,1048585,13,3,'2023-01-09 23:47:02',1342177288,'submission.event.fileRevised',0),(400,515,94,3,'2023-01-09 23:47:02',1342177281,'submission.event.fileUploaded',0),(401,1048585,13,3,'2023-01-09 23:47:02',1342177288,'submission.event.fileRevised',0),(402,515,95,3,'2023-01-09 23:47:02',1342177281,'submission.event.fileUploaded',0),(403,1048585,13,3,'2023-01-09 23:47:02',1342177288,'submission.event.fileRevised',0),(404,1048585,13,3,'2023-01-09 23:47:12',1073741825,'log.review.reviewerAssigned',0),(405,1048585,13,3,'2023-01-09 23:47:18',805306371,'editor.submission.decision.sendExternalReview.log',0),(406,1048585,13,3,'2023-01-09 23:47:28',1073741825,'log.review.reviewerAssigned',0),(407,1048585,13,3,'2023-01-09 23:47:35',1073741825,'log.review.reviewerAssigned',0),(408,1048585,13,3,'2023-01-09 23:47:44',1073741825,'log.review.reviewerAssigned',0),(409,1048585,13,10,'2023-01-09 23:47:52',1073741830,'log.review.reviewAccepted',0),(410,1048585,13,10,'2023-01-09 23:47:56',1073741848,'log.review.reviewReady',0),(411,1048585,13,12,'2023-01-09 23:48:04',1073741830,'log.review.reviewAccepted',0),(412,1048585,13,12,'2023-01-09 23:48:09',1073741848,'log.review.reviewReady',0),(413,1048585,13,3,'2023-01-09 23:48:31',805306371,'editor.submission.decision.accept.log',0),(414,1048585,13,3,'2023-01-09 23:48:31',1073741856,'submission.event.decisionReviewerEmailSent',0),(415,1048585,14,31,'2023-01-09 23:48:46',268435458,'submission.event.general.metadataUpdated',0),(416,1048585,14,31,'2023-01-09 23:48:46',268435458,'submission.event.general.metadataUpdated',0),(417,515,96,31,'2023-01-09 23:48:49',1342177281,'submission.event.fileUploaded',0),(418,1048585,14,31,'2023-01-09 23:48:49',1342177288,'submission.event.fileRevised',0),(419,515,96,31,'2023-01-09 23:48:50',1342177296,'submission.event.fileEdited',0),(420,1048585,14,31,'2023-01-09 23:48:50',1342177296,'submission.event.fileEdited',0),(421,515,97,31,'2023-01-09 23:48:51',1342177281,'submission.event.fileUploaded',0),(422,1048585,14,31,'2023-01-09 23:48:51',1342177288,'submission.event.fileRevised',0),(423,515,97,31,'2023-01-09 23:48:51',1342177296,'submission.event.fileEdited',0),(424,1048585,14,31,'2023-01-09 23:48:51',1342177296,'submission.event.fileEdited',0),(425,515,98,31,'2023-01-09 23:48:52',1342177281,'submission.event.fileUploaded',0),(426,1048585,14,31,'2023-01-09 23:48:52',1342177288,'submission.event.fileRevised',0),(427,515,98,31,'2023-01-09 23:48:52',1342177296,'submission.event.fileEdited',0),(428,1048585,14,31,'2023-01-09 23:48:52',1342177296,'submission.event.fileEdited',0),(429,515,99,31,'2023-01-09 23:48:53',1342177281,'submission.event.fileUploaded',0),(430,1048585,14,31,'2023-01-09 23:48:53',1342177288,'submission.event.fileRevised',0),(431,515,99,31,'2023-01-09 23:48:54',1342177296,'submission.event.fileEdited',0),(432,1048585,14,31,'2023-01-09 23:48:54',1342177296,'submission.event.fileEdited',0),(433,515,100,31,'2023-01-09 23:48:54',1342177281,'submission.event.fileUploaded',0),(434,1048585,14,31,'2023-01-09 23:48:54',1342177288,'submission.event.fileRevised',0),(435,515,100,31,'2023-01-09 23:48:55',1342177296,'submission.event.fileEdited',0),(436,1048585,14,31,'2023-01-09 23:48:55',1342177296,'submission.event.fileEdited',0),(437,515,101,31,'2023-01-09 23:48:56',1342177281,'submission.event.fileUploaded',0),(438,1048585,14,31,'2023-01-09 23:48:56',1342177288,'submission.event.fileRevised',0),(439,515,101,31,'2023-01-09 23:48:57',1342177296,'submission.event.fileEdited',0),(440,1048585,14,31,'2023-01-09 23:48:57',1342177296,'submission.event.fileEdited',0),(441,1048585,14,31,'2023-01-09 23:49:28',268435457,'submission.event.submissionSubmitted',0),(442,1048585,14,3,'2023-01-09 23:49:47',805306371,'editor.submission.decision.sendInternalReview.log',0),(443,515,102,3,'2023-01-09 23:49:47',1342177281,'submission.event.fileUploaded',0),(444,1048585,14,3,'2023-01-09 23:49:47',1342177288,'submission.event.fileRevised',0),(445,515,103,3,'2023-01-09 23:49:47',1342177281,'submission.event.fileUploaded',0),(446,1048585,14,3,'2023-01-09 23:49:47',1342177288,'submission.event.fileRevised',0),(447,515,104,3,'2023-01-09 23:49:47',1342177281,'submission.event.fileUploaded',0),(448,1048585,14,3,'2023-01-09 23:49:47',1342177288,'submission.event.fileRevised',0),(449,515,105,3,'2023-01-09 23:49:48',1342177281,'submission.event.fileUploaded',0),(450,1048585,14,3,'2023-01-09 23:49:48',1342177288,'submission.event.fileRevised',0),(451,515,106,3,'2023-01-09 23:49:48',1342177281,'submission.event.fileUploaded',0),(452,1048585,14,3,'2023-01-09 23:49:48',1342177288,'submission.event.fileRevised',0),(453,515,107,3,'2023-01-09 23:49:48',1342177281,'submission.event.fileUploaded',0),(454,1048585,14,3,'2023-01-09 23:49:48',1342177288,'submission.event.fileRevised',0),(455,1048585,14,3,'2023-01-09 23:49:59',1073741825,'log.review.reviewerAssigned',0),(456,1048585,14,3,'2023-01-09 23:50:06',805306371,'editor.submission.decision.sendExternalReview.log',0),(457,1048585,14,3,'2023-01-09 23:50:16',1073741825,'log.review.reviewerAssigned',0),(458,1048585,14,3,'2023-01-09 23:50:24',805306371,'editor.submission.decision.accept.log',0),(459,1048585,14,3,'2023-01-09 23:50:35',268435459,'submission.event.participantAdded',0),(460,1048585,14,3,'2023-01-09 23:50:42',805306371,'editor.submission.decision.sendToProduction.log',0),(461,1048585,14,3,'2023-01-09 23:50:54',268435459,'submission.event.participantAdded',0),(462,1048585,14,3,'2023-01-09 23:51:01',268435459,'submission.event.participantAdded',0),(463,1048585,14,3,'2023-01-09 23:51:07',268435474,'submission.event.publicationFormatCreated',0),(464,515,108,3,'2023-01-09 23:51:14',1342177281,'submission.event.fileUploaded',0),(465,1048585,14,3,'2023-01-09 23:51:14',1342177288,'submission.event.fileRevised',0),(466,515,109,3,'2023-01-09 23:51:14',1342177281,'submission.event.fileUploaded',0),(467,1048585,14,3,'2023-01-09 23:51:14',1342177288,'submission.event.fileRevised',0),(468,515,110,3,'2023-01-09 23:51:14',1342177281,'submission.event.fileUploaded',0),(469,1048585,14,3,'2023-01-09 23:51:14',1342177288,'submission.event.fileRevised',0),(470,515,111,3,'2023-01-09 23:51:14',1342177281,'submission.event.fileUploaded',0),(471,1048585,14,3,'2023-01-09 23:51:14',1342177288,'submission.event.fileRevised',0),(472,515,112,3,'2023-01-09 23:51:14',1342177281,'submission.event.fileUploaded',0),(473,1048585,14,3,'2023-01-09 23:51:14',1342177288,'submission.event.fileRevised',0),(474,515,113,3,'2023-01-09 23:51:14',1342177281,'submission.event.fileUploaded',0),(475,1048585,14,3,'2023-01-09 23:51:14',1342177288,'submission.event.fileRevised',0),(476,1048585,14,3,'2023-01-09 23:51:16',268435464,'submission.event.publicationFormatPublished',0),(477,1048585,14,3,'2023-01-09 23:51:19',268435476,'submission.event.publicationFormatMadeAvailable',0),(478,515,113,3,'2023-01-09 23:51:22',1342177296,'submission.event.fileEdited',0),(479,1048585,14,3,'2023-01-09 23:51:22',1342177296,'submission.event.fileEdited',0),(480,515,113,3,'2023-01-09 23:51:22',1342177287,'submission.event.signoffSignoff',0),(481,515,113,3,'2023-01-09 23:51:26',1342177296,'submission.event.fileEdited',0),(482,1048585,14,3,'2023-01-09 23:51:26',1342177296,'submission.event.fileEdited',0),(483,515,112,3,'2023-01-09 23:51:28',1342177296,'submission.event.fileEdited',0),(484,1048585,14,3,'2023-01-09 23:51:28',1342177296,'submission.event.fileEdited',0),(485,515,112,3,'2023-01-09 23:51:28',1342177287,'submission.event.signoffSignoff',0),(486,515,112,3,'2023-01-09 23:51:31',1342177296,'submission.event.fileEdited',0),(487,1048585,14,3,'2023-01-09 23:51:31',1342177296,'submission.event.fileEdited',0),(488,515,111,3,'2023-01-09 23:51:33',1342177296,'submission.event.fileEdited',0),(489,1048585,14,3,'2023-01-09 23:51:33',1342177296,'submission.event.fileEdited',0),(490,515,111,3,'2023-01-09 23:51:33',1342177287,'submission.event.signoffSignoff',0),(491,515,111,3,'2023-01-09 23:51:36',1342177296,'submission.event.fileEdited',0),(492,1048585,14,3,'2023-01-09 23:51:36',1342177296,'submission.event.fileEdited',0),(493,515,110,3,'2023-01-09 23:51:40',1342177296,'submission.event.fileEdited',0),(494,1048585,14,3,'2023-01-09 23:51:40',1342177296,'submission.event.fileEdited',0),(495,515,110,3,'2023-01-09 23:51:40',1342177287,'submission.event.signoffSignoff',0),(496,515,110,3,'2023-01-09 23:51:43',1342177296,'submission.event.fileEdited',0),(497,1048585,14,3,'2023-01-09 23:51:43',1342177296,'submission.event.fileEdited',0),(498,515,109,3,'2023-01-09 23:51:45',1342177296,'submission.event.fileEdited',0),(499,1048585,14,3,'2023-01-09 23:51:45',1342177296,'submission.event.fileEdited',0),(500,515,109,3,'2023-01-09 23:51:45',1342177287,'submission.event.signoffSignoff',0),(501,515,109,3,'2023-01-09 23:51:48',1342177296,'submission.event.fileEdited',0),(502,1048585,14,3,'2023-01-09 23:51:48',1342177296,'submission.event.fileEdited',0),(503,515,108,3,'2023-01-09 23:51:51',1342177296,'submission.event.fileEdited',0),(504,1048585,14,3,'2023-01-09 23:51:51',1342177296,'submission.event.fileEdited',0),(505,515,108,3,'2023-01-09 23:51:51',1342177287,'submission.event.signoffSignoff',0),(506,515,108,3,'2023-01-09 23:51:54',1342177296,'submission.event.fileEdited',0),(507,1048585,14,3,'2023-01-09 23:51:54',1342177296,'submission.event.fileEdited',0),(508,1048585,14,3,'2023-01-09 23:51:57',268435462,'publication.event.published',0),(509,1048585,15,32,'2023-01-09 23:52:08',268435458,'submission.event.general.metadataUpdated',0),(510,1048585,15,32,'2023-01-09 23:52:09',268435458,'submission.event.general.metadataUpdated',0),(511,515,114,32,'2023-01-09 23:52:12',1342177281,'submission.event.fileUploaded',0),(512,1048585,15,32,'2023-01-09 23:52:12',1342177288,'submission.event.fileRevised',0),(513,515,114,32,'2023-01-09 23:52:12',1342177296,'submission.event.fileEdited',0),(514,1048585,15,32,'2023-01-09 23:52:12',1342177296,'submission.event.fileEdited',0),(515,515,115,32,'2023-01-09 23:52:13',1342177281,'submission.event.fileUploaded',0),(516,1048585,15,32,'2023-01-09 23:52:13',1342177288,'submission.event.fileRevised',0),(517,515,115,32,'2023-01-09 23:52:13',1342177296,'submission.event.fileEdited',0),(518,1048585,15,32,'2023-01-09 23:52:13',1342177296,'submission.event.fileEdited',0),(519,515,116,32,'2023-01-09 23:52:14',1342177281,'submission.event.fileUploaded',0),(520,1048585,15,32,'2023-01-09 23:52:14',1342177288,'submission.event.fileRevised',0),(521,515,116,32,'2023-01-09 23:52:15',1342177296,'submission.event.fileEdited',0),(522,1048585,15,32,'2023-01-09 23:52:15',1342177296,'submission.event.fileEdited',0),(523,1048585,15,32,'2023-01-09 23:52:35',268435457,'submission.event.submissionSubmitted',0),(524,1048585,15,3,'2023-01-09 23:52:52',805306371,'editor.submission.decision.sendExternalReview.log',0),(525,515,117,3,'2023-01-09 23:52:52',1342177281,'submission.event.fileUploaded',0),(526,1048585,15,3,'2023-01-09 23:52:52',1342177288,'submission.event.fileRevised',0),(527,515,118,3,'2023-01-09 23:52:52',1342177281,'submission.event.fileUploaded',0),(528,1048585,15,3,'2023-01-09 23:52:52',1342177288,'submission.event.fileRevised',0),(529,515,119,3,'2023-01-09 23:52:52',1342177281,'submission.event.fileUploaded',0),(530,1048585,15,3,'2023-01-09 23:52:52',1342177288,'submission.event.fileRevised',0),(531,1048585,16,33,'2023-01-09 23:53:06',268435458,'submission.event.general.metadataUpdated',0),(532,1048585,16,33,'2023-01-09 23:53:07',268435458,'submission.event.general.metadataUpdated',0),(533,515,120,33,'2023-01-09 23:53:10',1342177281,'submission.event.fileUploaded',0),(534,1048585,16,33,'2023-01-09 23:53:10',1342177288,'submission.event.fileRevised',0),(535,515,120,33,'2023-01-09 23:53:10',1342177296,'submission.event.fileEdited',0),(536,1048585,16,33,'2023-01-09 23:53:10',1342177296,'submission.event.fileEdited',0),(537,515,121,33,'2023-01-09 23:53:11',1342177281,'submission.event.fileUploaded',0),(538,1048585,16,33,'2023-01-09 23:53:11',1342177288,'submission.event.fileRevised',0),(539,515,121,33,'2023-01-09 23:53:12',1342177296,'submission.event.fileEdited',0),(540,1048585,16,33,'2023-01-09 23:53:12',1342177296,'submission.event.fileEdited',0),(541,515,122,33,'2023-01-09 23:53:12',1342177281,'submission.event.fileUploaded',0),(542,1048585,16,33,'2023-01-09 23:53:12',1342177288,'submission.event.fileRevised',0),(543,515,122,33,'2023-01-09 23:53:13',1342177296,'submission.event.fileEdited',0),(544,1048585,16,33,'2023-01-09 23:53:13',1342177296,'submission.event.fileEdited',0),(545,515,123,33,'2023-01-09 23:53:14',1342177281,'submission.event.fileUploaded',0),(546,1048585,16,33,'2023-01-09 23:53:14',1342177288,'submission.event.fileRevised',0),(547,515,123,33,'2023-01-09 23:53:14',1342177296,'submission.event.fileEdited',0),(548,1048585,16,33,'2023-01-09 23:53:14',1342177296,'submission.event.fileEdited',0),(549,515,124,33,'2023-01-09 23:53:15',1342177281,'submission.event.fileUploaded',0),(550,1048585,16,33,'2023-01-09 23:53:15',1342177288,'submission.event.fileRevised',0),(551,515,124,33,'2023-01-09 23:53:15',1342177296,'submission.event.fileEdited',0),(552,1048585,16,33,'2023-01-09 23:53:15',1342177296,'submission.event.fileEdited',0),(553,1048585,16,33,'2023-01-09 23:53:51',268435457,'submission.event.submissionSubmitted',0),(554,1048585,16,3,'2023-01-09 23:54:12',805306371,'editor.submission.decision.sendExternalReview.log',0),(555,515,125,3,'2023-01-09 23:54:12',1342177281,'submission.event.fileUploaded',0),(556,1048585,16,3,'2023-01-09 23:54:12',1342177288,'submission.event.fileRevised',0),(557,515,126,3,'2023-01-09 23:54:13',1342177281,'submission.event.fileUploaded',0),(558,1048585,16,3,'2023-01-09 23:54:13',1342177288,'submission.event.fileRevised',0),(559,515,127,3,'2023-01-09 23:54:13',1342177281,'submission.event.fileUploaded',0),(560,1048585,16,3,'2023-01-09 23:54:13',1342177288,'submission.event.fileRevised',0),(561,515,128,3,'2023-01-09 23:54:13',1342177281,'submission.event.fileUploaded',0),(562,1048585,16,3,'2023-01-09 23:54:13',1342177288,'submission.event.fileRevised',0),(563,515,129,3,'2023-01-09 23:54:13',1342177281,'submission.event.fileUploaded',0),(564,1048585,16,3,'2023-01-09 23:54:13',1342177288,'submission.event.fileRevised',0),(565,1048585,16,3,'2023-01-09 23:54:23',1073741825,'log.review.reviewerAssigned',0),(566,1048585,16,3,'2023-01-09 23:54:31',1073741825,'log.review.reviewerAssigned',0),(567,1048585,16,3,'2023-01-09 23:54:40',1073741825,'log.review.reviewerAssigned',0),(568,1048585,16,10,'2023-01-09 23:54:49',1073741830,'log.review.reviewAccepted',0),(569,1048585,16,10,'2023-01-09 23:54:53',1073741848,'log.review.reviewReady',0),(570,1048585,17,34,'2023-01-09 23:55:04',268435458,'submission.event.general.metadataUpdated',0),(571,1048585,17,34,'2023-01-09 23:55:05',268435458,'submission.event.general.metadataUpdated',0),(572,515,130,34,'2023-01-09 23:55:08',1342177281,'submission.event.fileUploaded',0),(573,1048585,17,34,'2023-01-09 23:55:08',1342177288,'submission.event.fileRevised',0),(574,515,130,34,'2023-01-09 23:55:08',1342177296,'submission.event.fileEdited',0),(575,1048585,17,34,'2023-01-09 23:55:08',1342177296,'submission.event.fileEdited',0),(576,515,131,34,'2023-01-09 23:55:09',1342177281,'submission.event.fileUploaded',0),(577,1048585,17,34,'2023-01-09 23:55:09',1342177288,'submission.event.fileRevised',0),(578,515,131,34,'2023-01-09 23:55:09',1342177296,'submission.event.fileEdited',0),(579,1048585,17,34,'2023-01-09 23:55:09',1342177296,'submission.event.fileEdited',0),(580,515,132,34,'2023-01-09 23:55:10',1342177281,'submission.event.fileUploaded',0),(581,1048585,17,34,'2023-01-09 23:55:10',1342177288,'submission.event.fileRevised',0),(582,515,132,34,'2023-01-09 23:55:11',1342177296,'submission.event.fileEdited',0),(583,1048585,17,34,'2023-01-09 23:55:11',1342177296,'submission.event.fileEdited',0),(584,515,133,34,'2023-01-09 23:55:11',1342177281,'submission.event.fileUploaded',0),(585,1048585,17,34,'2023-01-09 23:55:11',1342177288,'submission.event.fileRevised',0),(586,515,133,34,'2023-01-09 23:55:12',1342177296,'submission.event.fileEdited',0),(587,1048585,17,34,'2023-01-09 23:55:12',1342177296,'submission.event.fileEdited',0),(588,515,134,34,'2023-01-09 23:55:13',1342177281,'submission.event.fileUploaded',0),(589,1048585,17,34,'2023-01-09 23:55:13',1342177288,'submission.event.fileRevised',0),(590,515,134,34,'2023-01-09 23:55:13',1342177296,'submission.event.fileEdited',0),(591,1048585,17,34,'2023-01-09 23:55:13',1342177296,'submission.event.fileEdited',0),(592,515,135,34,'2023-01-09 23:55:14',1342177281,'submission.event.fileUploaded',0),(593,1048585,17,34,'2023-01-09 23:55:14',1342177288,'submission.event.fileRevised',0),(594,515,135,34,'2023-01-09 23:55:14',1342177296,'submission.event.fileEdited',0),(595,1048585,17,34,'2023-01-09 23:55:15',1342177296,'submission.event.fileEdited',0),(596,1048585,17,34,'2023-01-09 23:56:06',268435457,'submission.event.submissionSubmitted',0),(597,1048585,17,3,'2023-01-09 23:56:28',805306371,'editor.submission.decision.sendInternalReview.log',0),(598,515,136,3,'2023-01-09 23:56:29',1342177281,'submission.event.fileUploaded',0),(599,1048585,17,3,'2023-01-09 23:56:29',1342177288,'submission.event.fileRevised',0),(600,515,137,3,'2023-01-09 23:56:29',1342177281,'submission.event.fileUploaded',0),(601,1048585,17,3,'2023-01-09 23:56:29',1342177288,'submission.event.fileRevised',0),(602,515,138,3,'2023-01-09 23:56:29',1342177281,'submission.event.fileUploaded',0),(603,1048585,17,3,'2023-01-09 23:56:29',1342177288,'submission.event.fileRevised',0),(604,515,139,3,'2023-01-09 23:56:29',1342177281,'submission.event.fileUploaded',0),(605,1048585,17,3,'2023-01-09 23:56:29',1342177288,'submission.event.fileRevised',0),(606,515,140,3,'2023-01-09 23:56:29',1342177281,'submission.event.fileUploaded',0),(607,1048585,17,3,'2023-01-09 23:56:29',1342177288,'submission.event.fileRevised',0),(608,515,141,3,'2023-01-09 23:56:29',1342177281,'submission.event.fileUploaded',0),(609,1048585,17,3,'2023-01-09 23:56:29',1342177288,'submission.event.fileRevised',0),(610,1048585,17,3,'2023-01-09 23:56:41',1073741825,'log.review.reviewerAssigned',0),(611,1048585,17,3,'2023-01-09 23:56:50',1073741825,'log.review.reviewerAssigned',0);
/*!40000 ALTER TABLE `event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log_settings`
--

DROP TABLE IF EXISTS `event_log_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_log_settings` (
  `log_id` bigint(20) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `event_log_settings_pkey` (`log_id`,`setting_name`),
  KEY `event_log_settings_log_id` (`log_id`),
  KEY `event_log_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `event_log_settings_log_id` FOREIGN KEY (`log_id`) REFERENCES `event_log` (`log_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
INSERT INTO `event_log_settings` VALUES (3,'fileId','1','int'),(3,'fileStage','2','int'),(3,'originalFileName','chapter1.pdf','string'),(3,'sourceSubmissionFileId',NULL,'string'),(3,'submissionFileId','1','int'),(3,'submissionId','1','int'),(3,'username','aclark','string'),(4,'fileId','1','int'),(4,'fileStage','2','int'),(4,'name','chapter1.pdf','string'),(4,'submissionFileId','1','int'),(4,'submissionId','1','int'),(4,'username','aclark','string'),(5,'fileId','1','int'),(5,'fileStage','2','int'),(5,'originalFileName','chapter1.pdf','string'),(5,'sourceSubmissionFileId',NULL,'string'),(5,'submissionFileId','1','int'),(5,'submissionId','1','int'),(5,'username','aclark','string'),(6,'fileId','1','int'),(6,'fileStage','2','int'),(6,'name','chapter1.pdf','string'),(6,'originalFileName','chapter1.pdf','string'),(6,'sourceSubmissionFileId',NULL,'string'),(6,'submissionFileId','1','int'),(6,'submissionId','1','int'),(6,'username','aclark','string'),(7,'fileId','2','int'),(7,'fileStage','2','int'),(7,'originalFileName','chapter2.pdf','string'),(7,'sourceSubmissionFileId',NULL,'string'),(7,'submissionFileId','2','int'),(7,'submissionId','1','int'),(7,'username','aclark','string'),(8,'fileId','2','int'),(8,'fileStage','2','int'),(8,'name','chapter2.pdf','string'),(8,'submissionFileId','2','int'),(8,'submissionId','1','int'),(8,'username','aclark','string'),(9,'fileId','2','int'),(9,'fileStage','2','int'),(9,'originalFileName','chapter2.pdf','string'),(9,'sourceSubmissionFileId',NULL,'string'),(9,'submissionFileId','2','int'),(9,'submissionId','1','int'),(9,'username','aclark','string'),(10,'fileId','2','int'),(10,'fileStage','2','int'),(10,'name','chapter2.pdf','string'),(10,'originalFileName','chapter2.pdf','string'),(10,'sourceSubmissionFileId',NULL,'string'),(10,'submissionFileId','2','int'),(10,'submissionId','1','int'),(10,'username','aclark','string'),(11,'fileId','3','int'),(11,'fileStage','2','int'),(11,'originalFileName','chapter3.pdf','string'),(11,'sourceSubmissionFileId',NULL,'string'),(11,'submissionFileId','3','int'),(11,'submissionId','1','int'),(11,'username','aclark','string'),(12,'fileId','3','int'),(12,'fileStage','2','int'),(12,'name','chapter3.pdf','string'),(12,'submissionFileId','3','int'),(12,'submissionId','1','int'),(12,'username','aclark','string'),(13,'fileId','3','int'),(13,'fileStage','2','int'),(13,'originalFileName','chapter3.pdf','string'),(13,'sourceSubmissionFileId',NULL,'string'),(13,'submissionFileId','3','int'),(13,'submissionId','1','int'),(13,'username','aclark','string'),(14,'fileId','3','int'),(14,'fileStage','2','int'),(14,'name','chapter3.pdf','string'),(14,'originalFileName','chapter3.pdf','string'),(14,'sourceSubmissionFileId',NULL,'string'),(14,'submissionFileId','3','int'),(14,'submissionId','1','int'),(14,'username','aclark','string'),(16,'decision','18','int'),(16,'editorId','3','int'),(16,'editorName','Daniel Barnes','string'),(16,'submissionId','1','int'),(17,'fileId','3','int'),(17,'fileStage','4','int'),(17,'originalFileName','chapter3.pdf','string'),(17,'sourceSubmissionFileId','3','int'),(17,'submissionFileId','4','int'),(17,'submissionId','1','int'),(17,'username','dbarnes','string'),(18,'fileId','3','int'),(18,'fileStage','4','int'),(18,'name','chapter3.pdf','string'),(18,'submissionFileId','4','int'),(18,'submissionId','1','int'),(18,'username','dbarnes','string'),(19,'fileId','2','int'),(19,'fileStage','4','int'),(19,'originalFileName','chapter2.pdf','string'),(19,'sourceSubmissionFileId','2','int'),(19,'submissionFileId','5','int'),(19,'submissionId','1','int'),(19,'username','dbarnes','string'),(20,'fileId','2','int'),(20,'fileStage','4','int'),(20,'name','chapter2.pdf','string'),(20,'submissionFileId','5','int'),(20,'submissionId','1','int'),(20,'username','dbarnes','string'),(21,'fileId','1','int'),(21,'fileStage','4','int'),(21,'originalFileName','chapter1.pdf','string'),(21,'sourceSubmissionFileId','1','int'),(21,'submissionFileId','6','int'),(21,'submissionId','1','int'),(21,'username','dbarnes','string'),(22,'fileId','1','int'),(22,'fileStage','4','int'),(22,'name','chapter1.pdf','string'),(22,'submissionFileId','6','int'),(22,'submissionId','1','int'),(22,'username','dbarnes','string'),(23,'reviewAssignmentId','1','int'),(23,'reviewerName','Gonzalo Favio','string'),(23,'round','1','int'),(23,'stageId','3','int'),(23,'submissionId','1','int'),(24,'decision','2','int'),(24,'editorId','3','int'),(24,'editorName','Daniel Barnes','string'),(24,'submissionId','1','int'),(25,'name','Sarah Vogt','string'),(25,'userGroupName','Copyeditor','string'),(25,'username','svogt','string'),(28,'fileId','4','int'),(28,'fileStage','2','int'),(28,'originalFileName','chapter1.pdf','string'),(28,'sourceSubmissionFileId',NULL,'string'),(28,'submissionFileId','7','int'),(28,'submissionId','2','int'),(28,'username','afinkel','string'),(29,'fileId','4','int'),(29,'fileStage','2','int'),(29,'name','chapter1.pdf','string'),(29,'submissionFileId','7','int'),(29,'submissionId','2','int'),(29,'username','afinkel','string'),(30,'fileId','4','int'),(30,'fileStage','2','int'),(30,'originalFileName','chapter1.pdf','string'),(30,'sourceSubmissionFileId',NULL,'string'),(30,'submissionFileId','7','int'),(30,'submissionId','2','int'),(30,'username','afinkel','string'),(31,'fileId','4','int'),(31,'fileStage','2','int'),(31,'name','chapter1.pdf','string'),(31,'originalFileName','chapter1.pdf','string'),(31,'sourceSubmissionFileId',NULL,'string'),(31,'submissionFileId','7','int'),(31,'submissionId','2','int'),(31,'username','afinkel','string'),(32,'fileId','5','int'),(32,'fileStage','2','int'),(32,'originalFileName','chapter2.pdf','string'),(32,'sourceSubmissionFileId',NULL,'string'),(32,'submissionFileId','8','int'),(32,'submissionId','2','int'),(32,'username','afinkel','string'),(33,'fileId','5','int'),(33,'fileStage','2','int'),(33,'name','chapter2.pdf','string'),(33,'submissionFileId','8','int'),(33,'submissionId','2','int'),(33,'username','afinkel','string'),(34,'fileId','5','int'),(34,'fileStage','2','int'),(34,'originalFileName','chapter2.pdf','string'),(34,'sourceSubmissionFileId',NULL,'string'),(34,'submissionFileId','8','int'),(34,'submissionId','2','int'),(34,'username','afinkel','string'),(35,'fileId','5','int'),(35,'fileStage','2','int'),(35,'name','chapter2.pdf','string'),(35,'originalFileName','chapter2.pdf','string'),(35,'sourceSubmissionFileId',NULL,'string'),(35,'submissionFileId','8','int'),(35,'submissionId','2','int'),(35,'username','afinkel','string'),(36,'fileId','6','int'),(36,'fileStage','2','int'),(36,'originalFileName','chapter3.pdf','string'),(36,'sourceSubmissionFileId',NULL,'string'),(36,'submissionFileId','9','int'),(36,'submissionId','2','int'),(36,'username','afinkel','string'),(37,'fileId','6','int'),(37,'fileStage','2','int'),(37,'name','chapter3.pdf','string'),(37,'submissionFileId','9','int'),(37,'submissionId','2','int'),(37,'username','afinkel','string'),(38,'fileId','6','int'),(38,'fileStage','2','int'),(38,'originalFileName','chapter3.pdf','string'),(38,'sourceSubmissionFileId',NULL,'string'),(38,'submissionFileId','9','int'),(38,'submissionId','2','int'),(38,'username','afinkel','string'),(39,'fileId','6','int'),(39,'fileStage','2','int'),(39,'name','chapter3.pdf','string'),(39,'originalFileName','chapter3.pdf','string'),(39,'sourceSubmissionFileId',NULL,'string'),(39,'submissionFileId','9','int'),(39,'submissionId','2','int'),(39,'username','afinkel','string'),(40,'fileId','7','int'),(40,'fileStage','2','int'),(40,'originalFileName','chapter4.pdf','string'),(40,'sourceSubmissionFileId',NULL,'string'),(40,'submissionFileId','10','int'),(40,'submissionId','2','int'),(40,'username','afinkel','string'),(41,'fileId','7','int'),(41,'fileStage','2','int'),(41,'name','chapter4.pdf','string'),(41,'submissionFileId','10','int'),(41,'submissionId','2','int'),(41,'username','afinkel','string'),(42,'fileId','7','int'),(42,'fileStage','2','int'),(42,'originalFileName','chapter4.pdf','string'),(42,'sourceSubmissionFileId',NULL,'string'),(42,'submissionFileId','10','int'),(42,'submissionId','2','int'),(42,'username','afinkel','string'),(43,'fileId','7','int'),(43,'fileStage','2','int'),(43,'name','chapter4.pdf','string'),(43,'originalFileName','chapter4.pdf','string'),(43,'sourceSubmissionFileId',NULL,'string'),(43,'submissionFileId','10','int'),(43,'submissionId','2','int'),(43,'username','afinkel','string'),(44,'fileId','8','int'),(44,'fileStage','2','int'),(44,'originalFileName','delete-this-file.pdf','string'),(44,'sourceSubmissionFileId',NULL,'string'),(44,'submissionFileId','11','int'),(44,'submissionId','2','int'),(44,'username','afinkel','string'),(45,'fileId','8','int'),(45,'fileStage','2','int'),(45,'name','delete-this-file.pdf','string'),(45,'submissionFileId','11','int'),(45,'submissionId','2','int'),(45,'username','afinkel','string'),(46,'fileId','8','int'),(46,'fileStage','2','int'),(46,'originalFileName','delete-this-file.pdf','string'),(46,'sourceSubmissionFileId',NULL,'string'),(46,'submissionFileId','11','int'),(46,'submissionId','2','int'),(46,'username','afinkel','string'),(47,'fileId','8','int'),(47,'fileStage','2','int'),(47,'name','delete-this-file.pdf','string'),(47,'originalFileName','delete-this-file.pdf','string'),(47,'sourceSubmissionFileId',NULL,'string'),(47,'submissionFileId','11','int'),(47,'submissionId','2','int'),(47,'username','afinkel','string'),(50,'decision','18','int'),(50,'editorId','3','int'),(50,'editorName','Daniel Barnes','string'),(50,'submissionId','2','int'),(51,'fileId','6','int'),(51,'fileStage','4','int'),(51,'originalFileName','chapter3.pdf','string'),(51,'sourceSubmissionFileId','9','int'),(51,'submissionFileId','12','int'),(51,'submissionId','2','int'),(51,'username','dbarnes','string'),(52,'fileId','6','int'),(52,'fileStage','4','int'),(52,'name','chapter3.pdf','string'),(52,'submissionFileId','12','int'),(52,'submissionId','2','int'),(52,'username','dbarnes','string'),(53,'fileId','7','int'),(53,'fileStage','4','int'),(53,'originalFileName','chapter4.pdf','string'),(53,'sourceSubmissionFileId','10','int'),(53,'submissionFileId','13','int'),(53,'submissionId','2','int'),(53,'username','dbarnes','string'),(54,'fileId','7','int'),(54,'fileStage','4','int'),(54,'name','chapter4.pdf','string'),(54,'submissionFileId','13','int'),(54,'submissionId','2','int'),(54,'username','dbarnes','string'),(55,'fileId','5','int'),(55,'fileStage','4','int'),(55,'originalFileName','chapter2.pdf','string'),(55,'sourceSubmissionFileId','8','int'),(55,'submissionFileId','14','int'),(55,'submissionId','2','int'),(55,'username','dbarnes','string'),(56,'fileId','5','int'),(56,'fileStage','4','int'),(56,'name','chapter2.pdf','string'),(56,'submissionFileId','14','int'),(56,'submissionId','2','int'),(56,'username','dbarnes','string'),(57,'fileId','4','int'),(57,'fileStage','4','int'),(57,'originalFileName','chapter1.pdf','string'),(57,'sourceSubmissionFileId','7','int'),(57,'submissionFileId','15','int'),(57,'submissionId','2','int'),(57,'username','dbarnes','string'),(58,'fileId','4','int'),(58,'fileStage','4','int'),(58,'name','chapter1.pdf','string'),(58,'submissionFileId','15','int'),(58,'submissionId','2','int'),(58,'username','dbarnes','string'),(59,'reviewAssignmentId','2','int'),(59,'reviewerName','Al Zacharia','string'),(59,'round','1','int'),(59,'stageId','3','int'),(59,'submissionId','2','int'),(60,'reviewAssignmentId','3','int'),(60,'reviewerName','Gonzalo Favio','string'),(60,'round','1','int'),(60,'stageId','3','int'),(60,'submissionId','2','int'),(63,'fileId','9','int'),(63,'fileStage','2','int'),(63,'originalFileName','chapter1.pdf','string'),(63,'sourceSubmissionFileId',NULL,'string'),(63,'submissionFileId','16','int'),(63,'submissionId','3','int'),(63,'username','bbarnetson','string'),(64,'fileId','9','int'),(64,'fileStage','2','int'),(64,'name','chapter1.pdf','string'),(64,'submissionFileId','16','int'),(64,'submissionId','3','int'),(64,'username','bbarnetson','string'),(65,'fileId','9','int'),(65,'fileStage','2','int'),(65,'originalFileName','chapter1.pdf','string'),(65,'sourceSubmissionFileId',NULL,'string'),(65,'submissionFileId','16','int'),(65,'submissionId','3','int'),(65,'username','bbarnetson','string'),(66,'fileId','9','int'),(66,'fileStage','2','int'),(66,'name','chapter1.pdf','string'),(66,'originalFileName','chapter1.pdf','string'),(66,'sourceSubmissionFileId',NULL,'string'),(66,'submissionFileId','16','int'),(66,'submissionId','3','int'),(66,'username','bbarnetson','string'),(67,'fileId','10','int'),(67,'fileStage','2','int'),(67,'originalFileName','chapter2.pdf','string'),(67,'sourceSubmissionFileId',NULL,'string'),(67,'submissionFileId','17','int'),(67,'submissionId','3','int'),(67,'username','bbarnetson','string'),(68,'fileId','10','int'),(68,'fileStage','2','int'),(68,'name','chapter2.pdf','string'),(68,'submissionFileId','17','int'),(68,'submissionId','3','int'),(68,'username','bbarnetson','string'),(69,'fileId','10','int'),(69,'fileStage','2','int'),(69,'originalFileName','chapter2.pdf','string'),(69,'sourceSubmissionFileId',NULL,'string'),(69,'submissionFileId','17','int'),(69,'submissionId','3','int'),(69,'username','bbarnetson','string'),(70,'fileId','10','int'),(70,'fileStage','2','int'),(70,'name','chapter2.pdf','string'),(70,'originalFileName','chapter2.pdf','string'),(70,'sourceSubmissionFileId',NULL,'string'),(70,'submissionFileId','17','int'),(70,'submissionId','3','int'),(70,'username','bbarnetson','string'),(71,'fileId','11','int'),(71,'fileStage','2','int'),(71,'originalFileName','chapter3.pdf','string'),(71,'sourceSubmissionFileId',NULL,'string'),(71,'submissionFileId','18','int'),(71,'submissionId','3','int'),(71,'username','bbarnetson','string'),(72,'fileId','11','int'),(72,'fileStage','2','int'),(72,'name','chapter3.pdf','string'),(72,'submissionFileId','18','int'),(72,'submissionId','3','int'),(72,'username','bbarnetson','string'),(73,'fileId','11','int'),(73,'fileStage','2','int'),(73,'originalFileName','chapter3.pdf','string'),(73,'sourceSubmissionFileId',NULL,'string'),(73,'submissionFileId','18','int'),(73,'submissionId','3','int'),(73,'username','bbarnetson','string'),(74,'fileId','11','int'),(74,'fileStage','2','int'),(74,'name','chapter3.pdf','string'),(74,'originalFileName','chapter3.pdf','string'),(74,'sourceSubmissionFileId',NULL,'string'),(74,'submissionFileId','18','int'),(74,'submissionId','3','int'),(74,'username','bbarnetson','string'),(75,'fileId','12','int'),(75,'fileStage','2','int'),(75,'originalFileName','chapter4.pdf','string'),(75,'sourceSubmissionFileId',NULL,'string'),(75,'submissionFileId','19','int'),(75,'submissionId','3','int'),(75,'username','bbarnetson','string'),(76,'fileId','12','int'),(76,'fileStage','2','int'),(76,'name','chapter4.pdf','string'),(76,'submissionFileId','19','int'),(76,'submissionId','3','int'),(76,'username','bbarnetson','string'),(77,'fileId','12','int'),(77,'fileStage','2','int'),(77,'originalFileName','chapter4.pdf','string'),(77,'sourceSubmissionFileId',NULL,'string'),(77,'submissionFileId','19','int'),(77,'submissionId','3','int'),(77,'username','bbarnetson','string'),(78,'fileId','12','int'),(78,'fileStage','2','int'),(78,'name','chapter4.pdf','string'),(78,'originalFileName','chapter4.pdf','string'),(78,'sourceSubmissionFileId',NULL,'string'),(78,'submissionFileId','19','int'),(78,'submissionId','3','int'),(78,'username','bbarnetson','string'),(79,'fileId','13','int'),(79,'fileStage','2','int'),(79,'originalFileName','chapter5.pdf','string'),(79,'sourceSubmissionFileId',NULL,'string'),(79,'submissionFileId','20','int'),(79,'submissionId','3','int'),(79,'username','bbarnetson','string'),(80,'fileId','13','int'),(80,'fileStage','2','int'),(80,'name','chapter5.pdf','string'),(80,'submissionFileId','20','int'),(80,'submissionId','3','int'),(80,'username','bbarnetson','string'),(81,'fileId','13','int'),(81,'fileStage','2','int'),(81,'originalFileName','chapter5.pdf','string'),(81,'sourceSubmissionFileId',NULL,'string'),(81,'submissionFileId','20','int'),(81,'submissionId','3','int'),(81,'username','bbarnetson','string'),(82,'fileId','13','int'),(82,'fileStage','2','int'),(82,'name','chapter5.pdf','string'),(82,'originalFileName','chapter5.pdf','string'),(82,'sourceSubmissionFileId',NULL,'string'),(82,'submissionFileId','20','int'),(82,'submissionId','3','int'),(82,'username','bbarnetson','string'),(86,'fileId','14','int'),(86,'fileStage','2','int'),(86,'originalFileName','chapter1.pdf','string'),(86,'sourceSubmissionFileId',NULL,'string'),(86,'submissionFileId','21','int'),(86,'submissionId','4','int'),(86,'username','bbeaty','string'),(87,'fileId','14','int'),(87,'fileStage','2','int'),(87,'name','chapter1.pdf','string'),(87,'submissionFileId','21','int'),(87,'submissionId','4','int'),(87,'username','bbeaty','string'),(88,'fileId','14','int'),(88,'fileStage','2','int'),(88,'originalFileName','chapter1.pdf','string'),(88,'sourceSubmissionFileId',NULL,'string'),(88,'submissionFileId','21','int'),(88,'submissionId','4','int'),(88,'username','bbeaty','string'),(89,'fileId','14','int'),(89,'fileStage','2','int'),(89,'name','chapter1.pdf','string'),(89,'originalFileName','chapter1.pdf','string'),(89,'sourceSubmissionFileId',NULL,'string'),(89,'submissionFileId','21','int'),(89,'submissionId','4','int'),(89,'username','bbeaty','string'),(90,'fileId','15','int'),(90,'fileStage','2','int'),(90,'originalFileName','chapter2.pdf','string'),(90,'sourceSubmissionFileId',NULL,'string'),(90,'submissionFileId','22','int'),(90,'submissionId','4','int'),(90,'username','bbeaty','string'),(91,'fileId','15','int'),(91,'fileStage','2','int'),(91,'name','chapter2.pdf','string'),(91,'submissionFileId','22','int'),(91,'submissionId','4','int'),(91,'username','bbeaty','string'),(92,'fileId','15','int'),(92,'fileStage','2','int'),(92,'originalFileName','chapter2.pdf','string'),(92,'sourceSubmissionFileId',NULL,'string'),(92,'submissionFileId','22','int'),(92,'submissionId','4','int'),(92,'username','bbeaty','string'),(93,'fileId','15','int'),(93,'fileStage','2','int'),(93,'name','chapter2.pdf','string'),(93,'originalFileName','chapter2.pdf','string'),(93,'sourceSubmissionFileId',NULL,'string'),(93,'submissionFileId','22','int'),(93,'submissionId','4','int'),(93,'username','bbeaty','string'),(94,'fileId','16','int'),(94,'fileStage','2','int'),(94,'originalFileName','chapter3.pdf','string'),(94,'sourceSubmissionFileId',NULL,'string'),(94,'submissionFileId','23','int'),(94,'submissionId','4','int'),(94,'username','bbeaty','string'),(95,'fileId','16','int'),(95,'fileStage','2','int'),(95,'name','chapter3.pdf','string'),(95,'submissionFileId','23','int'),(95,'submissionId','4','int'),(95,'username','bbeaty','string'),(96,'fileId','16','int'),(96,'fileStage','2','int'),(96,'originalFileName','chapter3.pdf','string'),(96,'sourceSubmissionFileId',NULL,'string'),(96,'submissionFileId','23','int'),(96,'submissionId','4','int'),(96,'username','bbeaty','string'),(97,'fileId','16','int'),(97,'fileStage','2','int'),(97,'name','chapter3.pdf','string'),(97,'originalFileName','chapter3.pdf','string'),(97,'sourceSubmissionFileId',NULL,'string'),(97,'submissionFileId','23','int'),(97,'submissionId','4','int'),(97,'username','bbeaty','string'),(98,'fileId','17','int'),(98,'fileStage','2','int'),(98,'originalFileName','intro.pdf','string'),(98,'sourceSubmissionFileId',NULL,'string'),(98,'submissionFileId','24','int'),(98,'submissionId','4','int'),(98,'username','bbeaty','string'),(99,'fileId','17','int'),(99,'fileStage','2','int'),(99,'name','intro.pdf','string'),(99,'submissionFileId','24','int'),(99,'submissionId','4','int'),(99,'username','bbeaty','string'),(100,'fileId','17','int'),(100,'fileStage','2','int'),(100,'originalFileName','intro.pdf','string'),(100,'sourceSubmissionFileId',NULL,'string'),(100,'submissionFileId','24','int'),(100,'submissionId','4','int'),(100,'username','bbeaty','string'),(101,'fileId','17','int'),(101,'fileStage','2','int'),(101,'name','intro.pdf','string'),(101,'originalFileName','intro.pdf','string'),(101,'sourceSubmissionFileId',NULL,'string'),(101,'submissionFileId','24','int'),(101,'submissionId','4','int'),(101,'username','bbeaty','string'),(103,'decision','1','int'),(103,'editorId','3','int'),(103,'editorName','Daniel Barnes','string'),(103,'submissionId','4','int'),(104,'fileId','17','int'),(104,'fileStage','19','int'),(104,'originalFileName','intro.pdf','string'),(104,'sourceSubmissionFileId','24','int'),(104,'submissionFileId','25','int'),(104,'submissionId','4','int'),(104,'username','dbarnes','string'),(105,'fileId','17','int'),(105,'fileStage','19','int'),(105,'name','intro.pdf','string'),(105,'submissionFileId','25','int'),(105,'submissionId','4','int'),(105,'username','dbarnes','string'),(106,'fileId','15','int'),(106,'fileStage','19','int'),(106,'originalFileName','chapter2.pdf','string'),(106,'sourceSubmissionFileId','22','int'),(106,'submissionFileId','26','int'),(106,'submissionId','4','int'),(106,'username','dbarnes','string'),(107,'fileId','15','int'),(107,'fileStage','19','int'),(107,'name','chapter2.pdf','string'),(107,'submissionFileId','26','int'),(107,'submissionId','4','int'),(107,'username','dbarnes','string'),(108,'fileId','16','int'),(108,'fileStage','19','int'),(108,'originalFileName','chapter3.pdf','string'),(108,'sourceSubmissionFileId','23','int'),(108,'submissionFileId','27','int'),(108,'submissionId','4','int'),(108,'username','dbarnes','string'),(109,'fileId','16','int'),(109,'fileStage','19','int'),(109,'name','chapter3.pdf','string'),(109,'submissionFileId','27','int'),(109,'submissionId','4','int'),(109,'username','dbarnes','string'),(110,'fileId','14','int'),(110,'fileStage','19','int'),(110,'originalFileName','chapter1.pdf','string'),(110,'sourceSubmissionFileId','21','int'),(110,'submissionFileId','28','int'),(110,'submissionId','4','int'),(110,'username','dbarnes','string'),(111,'fileId','14','int'),(111,'fileStage','19','int'),(111,'name','chapter1.pdf','string'),(111,'submissionFileId','28','int'),(111,'submissionId','4','int'),(111,'username','dbarnes','string'),(112,'reviewAssignmentId','4','int'),(112,'reviewerName','Aisla McCrae','string'),(112,'round','1','int'),(112,'stageId','2','int'),(112,'submissionId','4','int'),(113,'decision','3','int'),(113,'editorId','3','int'),(113,'editorName','Daniel Barnes','string'),(113,'submissionId','4','int'),(114,'reviewAssignmentId','5','int'),(114,'reviewerName','Al Zacharia','string'),(114,'round','1','int'),(114,'stageId','3','int'),(114,'submissionId','4','int'),(115,'decision','2','int'),(115,'editorId','3','int'),(115,'editorName','Daniel Barnes','string'),(115,'submissionId','4','int'),(116,'name','Maria Fritz','string'),(116,'userGroupName','Copyeditor','string'),(116,'username','mfritz','string'),(117,'decision','7','int'),(117,'editorId','3','int'),(117,'editorName','Daniel Barnes','string'),(117,'submissionId','4','int'),(118,'name','Graham Cox','string'),(118,'userGroupName','Layout Editor','string'),(118,'username','gcox','string'),(119,'formatName','PDF','string'),(122,'fileId','18','int'),(122,'fileStage','2','int'),(122,'originalFileName','prologue.pdf','string'),(122,'sourceSubmissionFileId',NULL,'string'),(122,'submissionFileId','29','int'),(122,'submissionId','5','int'),(122,'username','callan','string'),(123,'fileId','18','int'),(123,'fileStage','2','int'),(123,'name','prologue.pdf','string'),(123,'submissionFileId','29','int'),(123,'submissionId','5','int'),(123,'username','callan','string'),(124,'fileId','18','int'),(124,'fileStage','2','int'),(124,'originalFileName','prologue.pdf','string'),(124,'sourceSubmissionFileId',NULL,'string'),(124,'submissionFileId','29','int'),(124,'submissionId','5','int'),(124,'username','callan','string'),(125,'fileId','18','int'),(125,'fileStage','2','int'),(125,'name','prologue.pdf','string'),(125,'originalFileName','prologue.pdf','string'),(125,'sourceSubmissionFileId',NULL,'string'),(125,'submissionFileId','29','int'),(125,'submissionId','5','int'),(125,'username','callan','string'),(126,'fileId','19','int'),(126,'fileStage','2','int'),(126,'originalFileName','chapter1.pdf','string'),(126,'sourceSubmissionFileId',NULL,'string'),(126,'submissionFileId','30','int'),(126,'submissionId','5','int'),(126,'username','callan','string'),(127,'fileId','19','int'),(127,'fileStage','2','int'),(127,'name','chapter1.pdf','string'),(127,'submissionFileId','30','int'),(127,'submissionId','5','int'),(127,'username','callan','string'),(128,'fileId','19','int'),(128,'fileStage','2','int'),(128,'originalFileName','chapter1.pdf','string'),(128,'sourceSubmissionFileId',NULL,'string'),(128,'submissionFileId','30','int'),(128,'submissionId','5','int'),(128,'username','callan','string'),(129,'fileId','19','int'),(129,'fileStage','2','int'),(129,'name','chapter1.pdf','string'),(129,'originalFileName','chapter1.pdf','string'),(129,'sourceSubmissionFileId',NULL,'string'),(129,'submissionFileId','30','int'),(129,'submissionId','5','int'),(129,'username','callan','string'),(130,'fileId','20','int'),(130,'fileStage','2','int'),(130,'originalFileName','chapter2.pdf','string'),(130,'sourceSubmissionFileId',NULL,'string'),(130,'submissionFileId','31','int'),(130,'submissionId','5','int'),(130,'username','callan','string'),(131,'fileId','20','int'),(131,'fileStage','2','int'),(131,'name','chapter2.pdf','string'),(131,'submissionFileId','31','int'),(131,'submissionId','5','int'),(131,'username','callan','string'),(132,'fileId','20','int'),(132,'fileStage','2','int'),(132,'originalFileName','chapter2.pdf','string'),(132,'sourceSubmissionFileId',NULL,'string'),(132,'submissionFileId','31','int'),(132,'submissionId','5','int'),(132,'username','callan','string'),(133,'fileId','20','int'),(133,'fileStage','2','int'),(133,'name','chapter2.pdf','string'),(133,'originalFileName','chapter2.pdf','string'),(133,'sourceSubmissionFileId',NULL,'string'),(133,'submissionFileId','31','int'),(133,'submissionId','5','int'),(133,'username','callan','string'),(134,'fileId','21','int'),(134,'fileStage','2','int'),(134,'originalFileName','chapter3.pdf','string'),(134,'sourceSubmissionFileId',NULL,'string'),(134,'submissionFileId','32','int'),(134,'submissionId','5','int'),(134,'username','callan','string'),(135,'fileId','21','int'),(135,'fileStage','2','int'),(135,'name','chapter3.pdf','string'),(135,'submissionFileId','32','int'),(135,'submissionId','5','int'),(135,'username','callan','string'),(136,'fileId','21','int'),(136,'fileStage','2','int'),(136,'originalFileName','chapter3.pdf','string'),(136,'sourceSubmissionFileId',NULL,'string'),(136,'submissionFileId','32','int'),(136,'submissionId','5','int'),(136,'username','callan','string'),(137,'fileId','21','int'),(137,'fileStage','2','int'),(137,'name','chapter3.pdf','string'),(137,'originalFileName','chapter3.pdf','string'),(137,'sourceSubmissionFileId',NULL,'string'),(137,'submissionFileId','32','int'),(137,'submissionId','5','int'),(137,'username','callan','string'),(138,'fileId','22','int'),(138,'fileStage','2','int'),(138,'originalFileName','chapter4.pdf','string'),(138,'sourceSubmissionFileId',NULL,'string'),(138,'submissionFileId','33','int'),(138,'submissionId','5','int'),(138,'username','callan','string'),(139,'fileId','22','int'),(139,'fileStage','2','int'),(139,'name','chapter4.pdf','string'),(139,'submissionFileId','33','int'),(139,'submissionId','5','int'),(139,'username','callan','string'),(140,'fileId','22','int'),(140,'fileStage','2','int'),(140,'originalFileName','chapter4.pdf','string'),(140,'sourceSubmissionFileId',NULL,'string'),(140,'submissionFileId','33','int'),(140,'submissionId','5','int'),(140,'username','callan','string'),(141,'fileId','22','int'),(141,'fileStage','2','int'),(141,'name','chapter4.pdf','string'),(141,'originalFileName','chapter4.pdf','string'),(141,'sourceSubmissionFileId',NULL,'string'),(141,'submissionFileId','33','int'),(141,'submissionId','5','int'),(141,'username','callan','string'),(142,'fileId','23','int'),(142,'fileStage','2','int'),(142,'originalFileName','epilogue.pdf','string'),(142,'sourceSubmissionFileId',NULL,'string'),(142,'submissionFileId','34','int'),(142,'submissionId','5','int'),(142,'username','callan','string'),(143,'fileId','23','int'),(143,'fileStage','2','int'),(143,'name','epilogue.pdf','string'),(143,'submissionFileId','34','int'),(143,'submissionId','5','int'),(143,'username','callan','string'),(144,'fileId','23','int'),(144,'fileStage','2','int'),(144,'originalFileName','epilogue.pdf','string'),(144,'sourceSubmissionFileId',NULL,'string'),(144,'submissionFileId','34','int'),(144,'submissionId','5','int'),(144,'username','callan','string'),(145,'fileId','23','int'),(145,'fileStage','2','int'),(145,'name','epilogue.pdf','string'),(145,'originalFileName','epilogue.pdf','string'),(145,'sourceSubmissionFileId',NULL,'string'),(145,'submissionFileId','34','int'),(145,'submissionId','5','int'),(145,'username','callan','string'),(147,'decision','1','int'),(147,'editorId','3','int'),(147,'editorName','Daniel Barnes','string'),(147,'submissionId','5','int'),(148,'fileId','23','int'),(148,'fileStage','19','int'),(148,'originalFileName','epilogue.pdf','string'),(148,'sourceSubmissionFileId','34','int'),(148,'submissionFileId','35','int'),(148,'submissionId','5','int'),(148,'username','dbarnes','string'),(149,'fileId','23','int'),(149,'fileStage','19','int'),(149,'name','epilogue.pdf','string'),(149,'submissionFileId','35','int'),(149,'submissionId','5','int'),(149,'username','dbarnes','string'),(150,'fileId','22','int'),(150,'fileStage','19','int'),(150,'originalFileName','chapter4.pdf','string'),(150,'sourceSubmissionFileId','33','int'),(150,'submissionFileId','36','int'),(150,'submissionId','5','int'),(150,'username','dbarnes','string'),(151,'fileId','22','int'),(151,'fileStage','19','int'),(151,'name','chapter4.pdf','string'),(151,'submissionFileId','36','int'),(151,'submissionId','5','int'),(151,'username','dbarnes','string'),(152,'fileId','21','int'),(152,'fileStage','19','int'),(152,'originalFileName','chapter3.pdf','string'),(152,'sourceSubmissionFileId','32','int'),(152,'submissionFileId','37','int'),(152,'submissionId','5','int'),(152,'username','dbarnes','string'),(153,'fileId','21','int'),(153,'fileStage','19','int'),(153,'name','chapter3.pdf','string'),(153,'submissionFileId','37','int'),(153,'submissionId','5','int'),(153,'username','dbarnes','string'),(154,'fileId','20','int'),(154,'fileStage','19','int'),(154,'originalFileName','chapter2.pdf','string'),(154,'sourceSubmissionFileId','31','int'),(154,'submissionFileId','38','int'),(154,'submissionId','5','int'),(154,'username','dbarnes','string'),(155,'fileId','20','int'),(155,'fileStage','19','int'),(155,'name','chapter2.pdf','string'),(155,'submissionFileId','38','int'),(155,'submissionId','5','int'),(155,'username','dbarnes','string'),(156,'fileId','19','int'),(156,'fileStage','19','int'),(156,'originalFileName','chapter1.pdf','string'),(156,'sourceSubmissionFileId','30','int'),(156,'submissionFileId','39','int'),(156,'submissionId','5','int'),(156,'username','dbarnes','string'),(157,'fileId','19','int'),(157,'fileStage','19','int'),(157,'name','chapter1.pdf','string'),(157,'submissionFileId','39','int'),(157,'submissionId','5','int'),(157,'username','dbarnes','string'),(158,'fileId','18','int'),(158,'fileStage','19','int'),(158,'originalFileName','prologue.pdf','string'),(158,'sourceSubmissionFileId','29','int'),(158,'submissionFileId','40','int'),(158,'submissionId','5','int'),(158,'username','dbarnes','string'),(159,'fileId','18','int'),(159,'fileStage','19','int'),(159,'name','prologue.pdf','string'),(159,'submissionFileId','40','int'),(159,'submissionId','5','int'),(159,'username','dbarnes','string'),(160,'reviewAssignmentId','6','int'),(160,'reviewerName','Paul Hudson','string'),(160,'round','1','int'),(160,'stageId','2','int'),(160,'submissionId','5','int'),(161,'decision','3','int'),(161,'editorId','3','int'),(161,'editorName','Daniel Barnes','string'),(161,'submissionId','5','int'),(162,'reviewAssignmentId','7','int'),(162,'reviewerName','Gonzalo Favio','string'),(162,'round','1','int'),(162,'stageId','3','int'),(162,'submissionId','5','int'),(163,'decision','2','int'),(163,'editorId','3','int'),(163,'editorName','Daniel Barnes','string'),(163,'submissionId','5','int'),(164,'name','Sarah Vogt','string'),(164,'userGroupName','Copyeditor','string'),(164,'username','svogt','string'),(165,'decision','7','int'),(165,'editorId','3','int'),(165,'editorName','Daniel Barnes','string'),(165,'submissionId','5','int'),(166,'name','Stephen Hellier','string'),(166,'userGroupName','Layout Editor','string'),(166,'username','shellier','string'),(167,'name','Catherine Turner','string'),(167,'userGroupName','Proofreader','string'),(167,'username','cturner','string'),(168,'formatName','PDF','string'),(169,'fileId','23','int'),(169,'fileStage','10','int'),(169,'originalFileName','epilogue.pdf','string'),(169,'sourceSubmissionFileId','34','int'),(169,'submissionFileId','41','int'),(169,'submissionId','5','int'),(169,'username','dbarnes','string'),(170,'fileId','23','int'),(170,'fileStage','10','int'),(170,'name','epilogue.pdf','string'),(170,'submissionFileId','41','int'),(170,'submissionId','5','int'),(170,'username','dbarnes','string'),(171,'publicationFormatName','PDF','string'),(172,'publicationFormatName','PDF','string'),(173,'fileId','23','int'),(173,'fileStage','10','int'),(173,'originalFileName','epilogue.pdf','string'),(173,'sourceSubmissionFileId','34','int'),(173,'submissionFileId','41','int'),(173,'submissionId','5','int'),(173,'username','dbarnes','string'),(174,'fileId','23','int'),(174,'fileStage','10','int'),(174,'name','epilogue.pdf','string'),(174,'originalFileName','epilogue.pdf','string'),(174,'sourceSubmissionFileId','34','int'),(174,'submissionFileId','41','int'),(174,'submissionId','5','int'),(174,'username','dbarnes','string'),(175,'file','epilogue.pdf','string'),(175,'name','Daniel Barnes','string'),(175,'username','dbarnes','string'),(176,'fileId','23','int'),(176,'fileStage','10','int'),(176,'originalFileName','epilogue.pdf','string'),(176,'sourceSubmissionFileId','34','int'),(176,'submissionFileId','41','int'),(176,'submissionId','5','int'),(176,'username','dbarnes','string'),(177,'fileId','23','int'),(177,'fileStage','10','int'),(177,'name','epilogue.pdf','string'),(177,'originalFileName','epilogue.pdf','string'),(177,'sourceSubmissionFileId','34','int'),(177,'submissionFileId','41','int'),(177,'submissionId','5','int'),(177,'username','dbarnes','string'),(183,'fileId','24','int'),(183,'fileStage','2','int'),(183,'originalFileName','chapter1.pdf','string'),(183,'sourceSubmissionFileId',NULL,'string'),(183,'submissionFileId','42','int'),(183,'submissionId','6','int'),(183,'username','dbernnard','string'),(184,'fileId','24','int'),(184,'fileStage','2','int'),(184,'name','chapter1.pdf','string'),(184,'submissionFileId','42','int'),(184,'submissionId','6','int'),(184,'username','dbernnard','string'),(185,'fileId','24','int'),(185,'fileStage','2','int'),(185,'originalFileName','chapter1.pdf','string'),(185,'sourceSubmissionFileId',NULL,'string'),(185,'submissionFileId','42','int'),(185,'submissionId','6','int'),(185,'username','dbernnard','string'),(186,'fileId','24','int'),(186,'fileStage','2','int'),(186,'name','chapter1.pdf','string'),(186,'originalFileName','chapter1.pdf','string'),(186,'sourceSubmissionFileId',NULL,'string'),(186,'submissionFileId','42','int'),(186,'submissionId','6','int'),(186,'username','dbernnard','string'),(187,'fileId','25','int'),(187,'fileStage','2','int'),(187,'originalFileName','chapter2.pdf','string'),(187,'sourceSubmissionFileId',NULL,'string'),(187,'submissionFileId','43','int'),(187,'submissionId','6','int'),(187,'username','dbernnard','string'),(188,'fileId','25','int'),(188,'fileStage','2','int'),(188,'name','chapter2.pdf','string'),(188,'submissionFileId','43','int'),(188,'submissionId','6','int'),(188,'username','dbernnard','string'),(189,'fileId','25','int'),(189,'fileStage','2','int'),(189,'originalFileName','chapter2.pdf','string'),(189,'sourceSubmissionFileId',NULL,'string'),(189,'submissionFileId','43','int'),(189,'submissionId','6','int'),(189,'username','dbernnard','string'),(190,'fileId','25','int'),(190,'fileStage','2','int'),(190,'name','chapter2.pdf','string'),(190,'originalFileName','chapter2.pdf','string'),(190,'sourceSubmissionFileId',NULL,'string'),(190,'submissionFileId','43','int'),(190,'submissionId','6','int'),(190,'username','dbernnard','string'),(191,'fileId','26','int'),(191,'fileStage','2','int'),(191,'originalFileName','chapter3.pdf','string'),(191,'sourceSubmissionFileId',NULL,'string'),(191,'submissionFileId','44','int'),(191,'submissionId','6','int'),(191,'username','dbernnard','string'),(192,'fileId','26','int'),(192,'fileStage','2','int'),(192,'name','chapter3.pdf','string'),(192,'submissionFileId','44','int'),(192,'submissionId','6','int'),(192,'username','dbernnard','string'),(193,'fileId','26','int'),(193,'fileStage','2','int'),(193,'originalFileName','chapter3.pdf','string'),(193,'sourceSubmissionFileId',NULL,'string'),(193,'submissionFileId','44','int'),(193,'submissionId','6','int'),(193,'username','dbernnard','string'),(194,'fileId','26','int'),(194,'fileStage','2','int'),(194,'name','chapter3.pdf','string'),(194,'originalFileName','chapter3.pdf','string'),(194,'sourceSubmissionFileId',NULL,'string'),(194,'submissionFileId','44','int'),(194,'submissionId','6','int'),(194,'username','dbernnard','string'),(195,'fileId','27','int'),(195,'fileStage','2','int'),(195,'originalFileName','chapter4.pdf','string'),(195,'sourceSubmissionFileId',NULL,'string'),(195,'submissionFileId','45','int'),(195,'submissionId','6','int'),(195,'username','dbernnard','string'),(196,'fileId','27','int'),(196,'fileStage','2','int'),(196,'name','chapter4.pdf','string'),(196,'submissionFileId','45','int'),(196,'submissionId','6','int'),(196,'username','dbernnard','string'),(197,'fileId','27','int'),(197,'fileStage','2','int'),(197,'originalFileName','chapter4.pdf','string'),(197,'sourceSubmissionFileId',NULL,'string'),(197,'submissionFileId','45','int'),(197,'submissionId','6','int'),(197,'username','dbernnard','string'),(198,'fileId','27','int'),(198,'fileStage','2','int'),(198,'name','chapter4.pdf','string'),(198,'originalFileName','chapter4.pdf','string'),(198,'sourceSubmissionFileId',NULL,'string'),(198,'submissionFileId','45','int'),(198,'submissionId','6','int'),(198,'username','dbernnard','string'),(200,'decision','1','int'),(200,'editorId','3','int'),(200,'editorName','Daniel Barnes','string'),(200,'submissionId','6','int'),(201,'fileId','27','int'),(201,'fileStage','19','int'),(201,'originalFileName','chapter4.pdf','string'),(201,'sourceSubmissionFileId','45','int'),(201,'submissionFileId','46','int'),(201,'submissionId','6','int'),(201,'username','dbarnes','string'),(202,'fileId','27','int'),(202,'fileStage','19','int'),(202,'name','chapter4.pdf','string'),(202,'submissionFileId','46','int'),(202,'submissionId','6','int'),(202,'username','dbarnes','string'),(203,'fileId','25','int'),(203,'fileStage','19','int'),(203,'originalFileName','chapter2.pdf','string'),(203,'sourceSubmissionFileId','43','int'),(203,'submissionFileId','47','int'),(203,'submissionId','6','int'),(203,'username','dbarnes','string'),(204,'fileId','25','int'),(204,'fileStage','19','int'),(204,'name','chapter2.pdf','string'),(204,'submissionFileId','47','int'),(204,'submissionId','6','int'),(204,'username','dbarnes','string'),(205,'fileId','26','int'),(205,'fileStage','19','int'),(205,'originalFileName','chapter3.pdf','string'),(205,'sourceSubmissionFileId','44','int'),(205,'submissionFileId','48','int'),(205,'submissionId','6','int'),(205,'username','dbarnes','string'),(206,'fileId','26','int'),(206,'fileStage','19','int'),(206,'name','chapter3.pdf','string'),(206,'submissionFileId','48','int'),(206,'submissionId','6','int'),(206,'username','dbarnes','string'),(207,'fileId','24','int'),(207,'fileStage','19','int'),(207,'originalFileName','chapter1.pdf','string'),(207,'sourceSubmissionFileId','42','int'),(207,'submissionFileId','49','int'),(207,'submissionId','6','int'),(207,'username','dbarnes','string'),(208,'fileId','24','int'),(208,'fileStage','19','int'),(208,'name','chapter1.pdf','string'),(208,'submissionFileId','49','int'),(208,'submissionId','6','int'),(208,'username','dbarnes','string'),(209,'name','Daniel Barnes','string'),(209,'userGroupName','Press editor','string'),(209,'username','dbarnes','string'),(210,'name','David Buskins','string'),(210,'userGroupName','Series editor','string'),(210,'username','dbuskins','string'),(211,'name','Minoti Inoue','string'),(211,'userGroupName','Series editor','string'),(211,'username','minoue','string'),(212,'decision','23','int'),(212,'editorId','6','int'),(212,'editorName','Minoti Inoue','string'),(212,'submissionId','6','int'),(215,'fileId','28','int'),(215,'fileStage','2','int'),(215,'originalFileName','intro.pdf','string'),(215,'sourceSubmissionFileId',NULL,'string'),(215,'submissionFileId','50','int'),(215,'submissionId','7','int'),(215,'username','dkennepohl','string'),(216,'fileId','28','int'),(216,'fileStage','2','int'),(216,'name','intro.pdf','string'),(216,'submissionFileId','50','int'),(216,'submissionId','7','int'),(216,'username','dkennepohl','string'),(217,'fileId','28','int'),(217,'fileStage','2','int'),(217,'originalFileName','intro.pdf','string'),(217,'sourceSubmissionFileId',NULL,'string'),(217,'submissionFileId','50','int'),(217,'submissionId','7','int'),(217,'username','dkennepohl','string'),(218,'fileId','28','int'),(218,'fileStage','2','int'),(218,'name','intro.pdf','string'),(218,'originalFileName','intro.pdf','string'),(218,'sourceSubmissionFileId',NULL,'string'),(218,'submissionFileId','50','int'),(218,'submissionId','7','int'),(218,'username','dkennepohl','string'),(219,'fileId','29','int'),(219,'fileStage','2','int'),(219,'originalFileName','chapter1.pdf','string'),(219,'sourceSubmissionFileId',NULL,'string'),(219,'submissionFileId','51','int'),(219,'submissionId','7','int'),(219,'username','dkennepohl','string'),(220,'fileId','29','int'),(220,'fileStage','2','int'),(220,'name','chapter1.pdf','string'),(220,'submissionFileId','51','int'),(220,'submissionId','7','int'),(220,'username','dkennepohl','string'),(221,'fileId','29','int'),(221,'fileStage','2','int'),(221,'originalFileName','chapter1.pdf','string'),(221,'sourceSubmissionFileId',NULL,'string'),(221,'submissionFileId','51','int'),(221,'submissionId','7','int'),(221,'username','dkennepohl','string'),(222,'fileId','29','int'),(222,'fileStage','2','int'),(222,'name','chapter1.pdf','string'),(222,'originalFileName','chapter1.pdf','string'),(222,'sourceSubmissionFileId',NULL,'string'),(222,'submissionFileId','51','int'),(222,'submissionId','7','int'),(222,'username','dkennepohl','string'),(223,'fileId','30','int'),(223,'fileStage','2','int'),(223,'originalFileName','chapter2.pdf','string'),(223,'sourceSubmissionFileId',NULL,'string'),(223,'submissionFileId','52','int'),(223,'submissionId','7','int'),(223,'username','dkennepohl','string'),(224,'fileId','30','int'),(224,'fileStage','2','int'),(224,'name','chapter2.pdf','string'),(224,'submissionFileId','52','int'),(224,'submissionId','7','int'),(224,'username','dkennepohl','string'),(225,'fileId','30','int'),(225,'fileStage','2','int'),(225,'originalFileName','chapter2.pdf','string'),(225,'sourceSubmissionFileId',NULL,'string'),(225,'submissionFileId','52','int'),(225,'submissionId','7','int'),(225,'username','dkennepohl','string'),(226,'fileId','30','int'),(226,'fileStage','2','int'),(226,'name','chapter2.pdf','string'),(226,'originalFileName','chapter2.pdf','string'),(226,'sourceSubmissionFileId',NULL,'string'),(226,'submissionFileId','52','int'),(226,'submissionId','7','int'),(226,'username','dkennepohl','string'),(227,'fileId','31','int'),(227,'fileStage','2','int'),(227,'originalFileName','chapter3.pdf','string'),(227,'sourceSubmissionFileId',NULL,'string'),(227,'submissionFileId','53','int'),(227,'submissionId','7','int'),(227,'username','dkennepohl','string'),(228,'fileId','31','int'),(228,'fileStage','2','int'),(228,'name','chapter3.pdf','string'),(228,'submissionFileId','53','int'),(228,'submissionId','7','int'),(228,'username','dkennepohl','string'),(229,'fileId','31','int'),(229,'fileStage','2','int'),(229,'originalFileName','chapter3.pdf','string'),(229,'sourceSubmissionFileId',NULL,'string'),(229,'submissionFileId','53','int'),(229,'submissionId','7','int'),(229,'username','dkennepohl','string'),(230,'fileId','31','int'),(230,'fileStage','2','int'),(230,'name','chapter3.pdf','string'),(230,'originalFileName','chapter3.pdf','string'),(230,'sourceSubmissionFileId',NULL,'string'),(230,'submissionFileId','53','int'),(230,'submissionId','7','int'),(230,'username','dkennepohl','string'),(231,'fileId','32','int'),(231,'fileStage','2','int'),(231,'originalFileName','chapter4.pdf','string'),(231,'sourceSubmissionFileId',NULL,'string'),(231,'submissionFileId','54','int'),(231,'submissionId','7','int'),(231,'username','dkennepohl','string'),(232,'fileId','32','int'),(232,'fileStage','2','int'),(232,'name','chapter4.pdf','string'),(232,'submissionFileId','54','int'),(232,'submissionId','7','int'),(232,'username','dkennepohl','string'),(233,'fileId','32','int'),(233,'fileStage','2','int'),(233,'originalFileName','chapter4.pdf','string'),(233,'sourceSubmissionFileId',NULL,'string'),(233,'submissionFileId','54','int'),(233,'submissionId','7','int'),(233,'username','dkennepohl','string'),(234,'fileId','32','int'),(234,'fileStage','2','int'),(234,'name','chapter4.pdf','string'),(234,'originalFileName','chapter4.pdf','string'),(234,'sourceSubmissionFileId',NULL,'string'),(234,'submissionFileId','54','int'),(234,'submissionId','7','int'),(234,'username','dkennepohl','string'),(236,'decision','18','int'),(236,'editorId','3','int'),(236,'editorName','Daniel Barnes','string'),(236,'submissionId','7','int'),(237,'fileId','32','int'),(237,'fileStage','4','int'),(237,'originalFileName','chapter4.pdf','string'),(237,'sourceSubmissionFileId','54','int'),(237,'submissionFileId','55','int'),(237,'submissionId','7','int'),(237,'username','dbarnes','string'),(238,'fileId','32','int'),(238,'fileStage','4','int'),(238,'name','chapter4.pdf','string'),(238,'submissionFileId','55','int'),(238,'submissionId','7','int'),(238,'username','dbarnes','string'),(239,'fileId','30','int'),(239,'fileStage','4','int'),(239,'originalFileName','chapter2.pdf','string'),(239,'sourceSubmissionFileId','52','int'),(239,'submissionFileId','56','int'),(239,'submissionId','7','int'),(239,'username','dbarnes','string'),(240,'fileId','30','int'),(240,'fileStage','4','int'),(240,'name','chapter2.pdf','string'),(240,'submissionFileId','56','int'),(240,'submissionId','7','int'),(240,'username','dbarnes','string'),(241,'fileId','28','int'),(241,'fileStage','4','int'),(241,'originalFileName','intro.pdf','string'),(241,'sourceSubmissionFileId','50','int'),(241,'submissionFileId','57','int'),(241,'submissionId','7','int'),(241,'username','dbarnes','string'),(242,'fileId','28','int'),(242,'fileStage','4','int'),(242,'name','intro.pdf','string'),(242,'submissionFileId','57','int'),(242,'submissionId','7','int'),(242,'username','dbarnes','string'),(243,'fileId','31','int'),(243,'fileStage','4','int'),(243,'originalFileName','chapter3.pdf','string'),(243,'sourceSubmissionFileId','53','int'),(243,'submissionFileId','58','int'),(243,'submissionId','7','int'),(243,'username','dbarnes','string'),(244,'fileId','31','int'),(244,'fileStage','4','int'),(244,'name','chapter3.pdf','string'),(244,'submissionFileId','58','int'),(244,'submissionId','7','int'),(244,'username','dbarnes','string'),(245,'fileId','29','int'),(245,'fileStage','4','int'),(245,'originalFileName','chapter1.pdf','string'),(245,'sourceSubmissionFileId','51','int'),(245,'submissionFileId','59','int'),(245,'submissionId','7','int'),(245,'username','dbarnes','string'),(246,'fileId','29','int'),(246,'fileStage','4','int'),(246,'name','chapter1.pdf','string'),(246,'submissionFileId','59','int'),(246,'submissionId','7','int'),(246,'username','dbarnes','string'),(247,'reviewAssignmentId','8','int'),(247,'reviewerName','Adela Gallego','string'),(247,'round','1','int'),(247,'stageId','3','int'),(247,'submissionId','7','int'),(248,'decision','2','int'),(248,'editorId','3','int'),(248,'editorName','Daniel Barnes','string'),(248,'submissionId','7','int'),(249,'name','Maria Fritz','string'),(249,'userGroupName','Copyeditor','string'),(249,'username','mfritz','string'),(251,'fileId','33','int'),(251,'fileStage','2','int'),(251,'originalFileName','note.pdf','string'),(251,'sourceSubmissionFileId',NULL,'string'),(251,'submissionFileId','60','int'),(251,'submissionId','8','int'),(251,'username','dbarnes','string'),(252,'fileId','33','int'),(252,'fileStage','2','int'),(252,'name','note.pdf','string'),(252,'submissionFileId','60','int'),(252,'submissionId','8','int'),(252,'username','dbarnes','string'),(253,'fileId','33','int'),(253,'fileStage','2','int'),(253,'originalFileName','note.pdf','string'),(253,'sourceSubmissionFileId',NULL,'string'),(253,'submissionFileId','60','int'),(253,'submissionId','8','int'),(253,'username','dbarnes','string'),(254,'fileId','33','int'),(254,'fileStage','2','int'),(254,'name','note.pdf','string'),(254,'originalFileName','note.pdf','string'),(254,'sourceSubmissionFileId',NULL,'string'),(254,'submissionFileId','60','int'),(254,'submissionId','8','int'),(254,'username','dbarnes','string'),(258,'fileId','34','int'),(258,'fileStage','2','int'),(258,'originalFileName','chapter1.pdf','string'),(258,'sourceSubmissionFileId',NULL,'string'),(258,'submissionFileId','61','int'),(258,'submissionId','9','int'),(258,'username','fperini','string'),(259,'fileId','34','int'),(259,'fileStage','2','int'),(259,'name','chapter1.pdf','string'),(259,'submissionFileId','61','int'),(259,'submissionId','9','int'),(259,'username','fperini','string'),(260,'fileId','34','int'),(260,'fileStage','2','int'),(260,'originalFileName','chapter1.pdf','string'),(260,'sourceSubmissionFileId',NULL,'string'),(260,'submissionFileId','61','int'),(260,'submissionId','9','int'),(260,'username','fperini','string'),(261,'fileId','34','int'),(261,'fileStage','2','int'),(261,'name','chapter1.pdf','string'),(261,'originalFileName','chapter1.pdf','string'),(261,'sourceSubmissionFileId',NULL,'string'),(261,'submissionFileId','61','int'),(261,'submissionId','9','int'),(261,'username','fperini','string'),(262,'fileId','35','int'),(262,'fileStage','2','int'),(262,'originalFileName','chapter2.pdf','string'),(262,'sourceSubmissionFileId',NULL,'string'),(262,'submissionFileId','62','int'),(262,'submissionId','9','int'),(262,'username','fperini','string'),(263,'fileId','35','int'),(263,'fileStage','2','int'),(263,'name','chapter2.pdf','string'),(263,'submissionFileId','62','int'),(263,'submissionId','9','int'),(263,'username','fperini','string'),(264,'fileId','35','int'),(264,'fileStage','2','int'),(264,'originalFileName','chapter2.pdf','string'),(264,'sourceSubmissionFileId',NULL,'string'),(264,'submissionFileId','62','int'),(264,'submissionId','9','int'),(264,'username','fperini','string'),(265,'fileId','35','int'),(265,'fileStage','2','int'),(265,'name','chapter2.pdf','string'),(265,'originalFileName','chapter2.pdf','string'),(265,'sourceSubmissionFileId',NULL,'string'),(265,'submissionFileId','62','int'),(265,'submissionId','9','int'),(265,'username','fperini','string'),(266,'fileId','36','int'),(266,'fileStage','2','int'),(266,'originalFileName','chapter3.pdf','string'),(266,'sourceSubmissionFileId',NULL,'string'),(266,'submissionFileId','63','int'),(266,'submissionId','9','int'),(266,'username','fperini','string'),(267,'fileId','36','int'),(267,'fileStage','2','int'),(267,'name','chapter3.pdf','string'),(267,'submissionFileId','63','int'),(267,'submissionId','9','int'),(267,'username','fperini','string'),(268,'fileId','36','int'),(268,'fileStage','2','int'),(268,'originalFileName','chapter3.pdf','string'),(268,'sourceSubmissionFileId',NULL,'string'),(268,'submissionFileId','63','int'),(268,'submissionId','9','int'),(268,'username','fperini','string'),(269,'fileId','36','int'),(269,'fileStage','2','int'),(269,'name','chapter3.pdf','string'),(269,'originalFileName','chapter3.pdf','string'),(269,'sourceSubmissionFileId',NULL,'string'),(269,'submissionFileId','63','int'),(269,'submissionId','9','int'),(269,'username','fperini','string'),(270,'fileId','37','int'),(270,'fileStage','2','int'),(270,'originalFileName','chapter4.pdf','string'),(270,'sourceSubmissionFileId',NULL,'string'),(270,'submissionFileId','64','int'),(270,'submissionId','9','int'),(270,'username','fperini','string'),(271,'fileId','37','int'),(271,'fileStage','2','int'),(271,'name','chapter4.pdf','string'),(271,'submissionFileId','64','int'),(271,'submissionId','9','int'),(271,'username','fperini','string'),(272,'fileId','37','int'),(272,'fileStage','2','int'),(272,'originalFileName','chapter4.pdf','string'),(272,'sourceSubmissionFileId',NULL,'string'),(272,'submissionFileId','64','int'),(272,'submissionId','9','int'),(272,'username','fperini','string'),(273,'fileId','37','int'),(273,'fileStage','2','int'),(273,'name','chapter4.pdf','string'),(273,'originalFileName','chapter4.pdf','string'),(273,'sourceSubmissionFileId',NULL,'string'),(273,'submissionFileId','64','int'),(273,'submissionId','9','int'),(273,'username','fperini','string'),(274,'fileId','38','int'),(274,'fileStage','2','int'),(274,'originalFileName','chapter5.pdf','string'),(274,'sourceSubmissionFileId',NULL,'string'),(274,'submissionFileId','65','int'),(274,'submissionId','9','int'),(274,'username','fperini','string'),(275,'fileId','38','int'),(275,'fileStage','2','int'),(275,'name','chapter5.pdf','string'),(275,'submissionFileId','65','int'),(275,'submissionId','9','int'),(275,'username','fperini','string'),(276,'fileId','38','int'),(276,'fileStage','2','int'),(276,'originalFileName','chapter5.pdf','string'),(276,'sourceSubmissionFileId',NULL,'string'),(276,'submissionFileId','65','int'),(276,'submissionId','9','int'),(276,'username','fperini','string'),(277,'fileId','38','int'),(277,'fileStage','2','int'),(277,'name','chapter5.pdf','string'),(277,'originalFileName','chapter5.pdf','string'),(277,'sourceSubmissionFileId',NULL,'string'),(277,'submissionFileId','65','int'),(277,'submissionId','9','int'),(277,'username','fperini','string'),(279,'decision','1','int'),(279,'editorId','3','int'),(279,'editorName','Daniel Barnes','string'),(279,'submissionId','9','int'),(280,'fileId','38','int'),(280,'fileStage','19','int'),(280,'originalFileName','chapter5.pdf','string'),(280,'sourceSubmissionFileId','65','int'),(280,'submissionFileId','66','int'),(280,'submissionId','9','int'),(280,'username','dbarnes','string'),(281,'fileId','38','int'),(281,'fileStage','19','int'),(281,'name','chapter5.pdf','string'),(281,'submissionFileId','66','int'),(281,'submissionId','9','int'),(281,'username','dbarnes','string'),(282,'fileId','35','int'),(282,'fileStage','19','int'),(282,'originalFileName','chapter2.pdf','string'),(282,'sourceSubmissionFileId','62','int'),(282,'submissionFileId','67','int'),(282,'submissionId','9','int'),(282,'username','dbarnes','string'),(283,'fileId','35','int'),(283,'fileStage','19','int'),(283,'name','chapter2.pdf','string'),(283,'submissionFileId','67','int'),(283,'submissionId','9','int'),(283,'username','dbarnes','string'),(284,'fileId','34','int'),(284,'fileStage','19','int'),(284,'originalFileName','chapter1.pdf','string'),(284,'sourceSubmissionFileId','61','int'),(284,'submissionFileId','68','int'),(284,'submissionId','9','int'),(284,'username','dbarnes','string'),(285,'fileId','34','int'),(285,'fileStage','19','int'),(285,'name','chapter1.pdf','string'),(285,'submissionFileId','68','int'),(285,'submissionId','9','int'),(285,'username','dbarnes','string'),(286,'fileId','36','int'),(286,'fileStage','19','int'),(286,'originalFileName','chapter3.pdf','string'),(286,'sourceSubmissionFileId','63','int'),(286,'submissionFileId','69','int'),(286,'submissionId','9','int'),(286,'username','dbarnes','string'),(287,'fileId','36','int'),(287,'fileStage','19','int'),(287,'name','chapter3.pdf','string'),(287,'submissionFileId','69','int'),(287,'submissionId','9','int'),(287,'username','dbarnes','string'),(288,'fileId','37','int'),(288,'fileStage','19','int'),(288,'originalFileName','chapter4.pdf','string'),(288,'sourceSubmissionFileId','64','int'),(288,'submissionFileId','70','int'),(288,'submissionId','9','int'),(288,'username','dbarnes','string'),(289,'fileId','37','int'),(289,'fileStage','19','int'),(289,'name','chapter4.pdf','string'),(289,'submissionFileId','70','int'),(289,'submissionId','9','int'),(289,'username','dbarnes','string'),(292,'fileId','39','int'),(292,'fileStage','2','int'),(292,'originalFileName','intro.pdf','string'),(292,'sourceSubmissionFileId',NULL,'string'),(292,'submissionFileId','71','int'),(292,'submissionId','10','int'),(292,'username','jbrower','string'),(293,'fileId','39','int'),(293,'fileStage','2','int'),(293,'name','intro.pdf','string'),(293,'submissionFileId','71','int'),(293,'submissionId','10','int'),(293,'username','jbrower','string'),(294,'fileId','39','int'),(294,'fileStage','2','int'),(294,'originalFileName','intro.pdf','string'),(294,'sourceSubmissionFileId',NULL,'string'),(294,'submissionFileId','71','int'),(294,'submissionId','10','int'),(294,'username','jbrower','string'),(295,'fileId','39','int'),(295,'fileStage','2','int'),(295,'name','intro.pdf','string'),(295,'originalFileName','intro.pdf','string'),(295,'sourceSubmissionFileId',NULL,'string'),(295,'submissionFileId','71','int'),(295,'submissionId','10','int'),(295,'username','jbrower','string'),(296,'fileId','40','int'),(296,'fileStage','2','int'),(296,'originalFileName','chapter1.pdf','string'),(296,'sourceSubmissionFileId',NULL,'string'),(296,'submissionFileId','72','int'),(296,'submissionId','10','int'),(296,'username','jbrower','string'),(297,'fileId','40','int'),(297,'fileStage','2','int'),(297,'name','chapter1.pdf','string'),(297,'submissionFileId','72','int'),(297,'submissionId','10','int'),(297,'username','jbrower','string'),(298,'fileId','40','int'),(298,'fileStage','2','int'),(298,'originalFileName','chapter1.pdf','string'),(298,'sourceSubmissionFileId',NULL,'string'),(298,'submissionFileId','72','int'),(298,'submissionId','10','int'),(298,'username','jbrower','string'),(299,'fileId','40','int'),(299,'fileStage','2','int'),(299,'name','chapter1.pdf','string'),(299,'originalFileName','chapter1.pdf','string'),(299,'sourceSubmissionFileId',NULL,'string'),(299,'submissionFileId','72','int'),(299,'submissionId','10','int'),(299,'username','jbrower','string'),(300,'fileId','41','int'),(300,'fileStage','2','int'),(300,'originalFileName','chapter2.pdf','string'),(300,'sourceSubmissionFileId',NULL,'string'),(300,'submissionFileId','73','int'),(300,'submissionId','10','int'),(300,'username','jbrower','string'),(301,'fileId','41','int'),(301,'fileStage','2','int'),(301,'name','chapter2.pdf','string'),(301,'submissionFileId','73','int'),(301,'submissionId','10','int'),(301,'username','jbrower','string'),(302,'fileId','41','int'),(302,'fileStage','2','int'),(302,'originalFileName','chapter2.pdf','string'),(302,'sourceSubmissionFileId',NULL,'string'),(302,'submissionFileId','73','int'),(302,'submissionId','10','int'),(302,'username','jbrower','string'),(303,'fileId','41','int'),(303,'fileStage','2','int'),(303,'name','chapter2.pdf','string'),(303,'originalFileName','chapter2.pdf','string'),(303,'sourceSubmissionFileId',NULL,'string'),(303,'submissionFileId','73','int'),(303,'submissionId','10','int'),(303,'username','jbrower','string'),(304,'fileId','42','int'),(304,'fileStage','2','int'),(304,'originalFileName','chapter3.pdf','string'),(304,'sourceSubmissionFileId',NULL,'string'),(304,'submissionFileId','74','int'),(304,'submissionId','10','int'),(304,'username','jbrower','string'),(305,'fileId','42','int'),(305,'fileStage','2','int'),(305,'name','chapter3.pdf','string'),(305,'submissionFileId','74','int'),(305,'submissionId','10','int'),(305,'username','jbrower','string'),(306,'fileId','42','int'),(306,'fileStage','2','int'),(306,'originalFileName','chapter3.pdf','string'),(306,'sourceSubmissionFileId',NULL,'string'),(306,'submissionFileId','74','int'),(306,'submissionId','10','int'),(306,'username','jbrower','string'),(307,'fileId','42','int'),(307,'fileStage','2','int'),(307,'name','chapter3.pdf','string'),(307,'originalFileName','chapter3.pdf','string'),(307,'sourceSubmissionFileId',NULL,'string'),(307,'submissionFileId','74','int'),(307,'submissionId','10','int'),(307,'username','jbrower','string'),(308,'fileId','43','int'),(308,'fileStage','2','int'),(308,'originalFileName','chapter4.pdf','string'),(308,'sourceSubmissionFileId',NULL,'string'),(308,'submissionFileId','75','int'),(308,'submissionId','10','int'),(308,'username','jbrower','string'),(309,'fileId','43','int'),(309,'fileStage','2','int'),(309,'name','chapter4.pdf','string'),(309,'submissionFileId','75','int'),(309,'submissionId','10','int'),(309,'username','jbrower','string'),(310,'fileId','43','int'),(310,'fileStage','2','int'),(310,'originalFileName','chapter4.pdf','string'),(310,'sourceSubmissionFileId',NULL,'string'),(310,'submissionFileId','75','int'),(310,'submissionId','10','int'),(310,'username','jbrower','string'),(311,'fileId','43','int'),(311,'fileStage','2','int'),(311,'name','chapter4.pdf','string'),(311,'originalFileName','chapter4.pdf','string'),(311,'sourceSubmissionFileId',NULL,'string'),(311,'submissionFileId','75','int'),(311,'submissionId','10','int'),(311,'username','jbrower','string'),(312,'fileId','44','int'),(312,'fileStage','2','int'),(312,'originalFileName','chapter5.pdf','string'),(312,'sourceSubmissionFileId',NULL,'string'),(312,'submissionFileId','76','int'),(312,'submissionId','10','int'),(312,'username','jbrower','string'),(313,'fileId','44','int'),(313,'fileStage','2','int'),(313,'name','chapter5.pdf','string'),(313,'submissionFileId','76','int'),(313,'submissionId','10','int'),(313,'username','jbrower','string'),(314,'fileId','44','int'),(314,'fileStage','2','int'),(314,'originalFileName','chapter5.pdf','string'),(314,'sourceSubmissionFileId',NULL,'string'),(314,'submissionFileId','76','int'),(314,'submissionId','10','int'),(314,'username','jbrower','string'),(315,'fileId','44','int'),(315,'fileStage','2','int'),(315,'name','chapter5.pdf','string'),(315,'originalFileName','chapter5.pdf','string'),(315,'sourceSubmissionFileId',NULL,'string'),(315,'submissionFileId','76','int'),(315,'submissionId','10','int'),(315,'username','jbrower','string'),(316,'fileId','45','int'),(316,'fileStage','2','int'),(316,'originalFileName','conclusion.pdf','string'),(316,'sourceSubmissionFileId',NULL,'string'),(316,'submissionFileId','77','int'),(316,'submissionId','10','int'),(316,'username','jbrower','string'),(317,'fileId','45','int'),(317,'fileStage','2','int'),(317,'name','conclusion.pdf','string'),(317,'submissionFileId','77','int'),(317,'submissionId','10','int'),(317,'username','jbrower','string'),(318,'fileId','45','int'),(318,'fileStage','2','int'),(318,'originalFileName','conclusion.pdf','string'),(318,'sourceSubmissionFileId',NULL,'string'),(318,'submissionFileId','77','int'),(318,'submissionId','10','int'),(318,'username','jbrower','string'),(319,'fileId','45','int'),(319,'fileStage','2','int'),(319,'name','conclusion.pdf','string'),(319,'originalFileName','conclusion.pdf','string'),(319,'sourceSubmissionFileId',NULL,'string'),(319,'submissionFileId','77','int'),(319,'submissionId','10','int'),(319,'username','jbrower','string'),(320,'fileId','46','int'),(320,'fileStage','2','int'),(320,'originalFileName','bibliography.pdf','string'),(320,'sourceSubmissionFileId',NULL,'string'),(320,'submissionFileId','78','int'),(320,'submissionId','10','int'),(320,'username','jbrower','string'),(321,'fileId','46','int'),(321,'fileStage','2','int'),(321,'name','bibliography.pdf','string'),(321,'submissionFileId','78','int'),(321,'submissionId','10','int'),(321,'username','jbrower','string'),(322,'fileId','46','int'),(322,'fileStage','2','int'),(322,'originalFileName','bibliography.pdf','string'),(322,'sourceSubmissionFileId',NULL,'string'),(322,'submissionFileId','78','int'),(322,'submissionId','10','int'),(322,'username','jbrower','string'),(323,'fileId','46','int'),(323,'fileStage','2','int'),(323,'name','bibliography.pdf','string'),(323,'originalFileName','bibliography.pdf','string'),(323,'sourceSubmissionFileId',NULL,'string'),(323,'submissionFileId','78','int'),(323,'submissionId','10','int'),(323,'username','jbrower','string'),(324,'fileId','47','int'),(324,'fileStage','2','int'),(324,'originalFileName','index.pdf','string'),(324,'sourceSubmissionFileId',NULL,'string'),(324,'submissionFileId','79','int'),(324,'submissionId','10','int'),(324,'username','jbrower','string'),(325,'fileId','47','int'),(325,'fileStage','2','int'),(325,'name','index.pdf','string'),(325,'submissionFileId','79','int'),(325,'submissionId','10','int'),(325,'username','jbrower','string'),(326,'fileId','47','int'),(326,'fileStage','2','int'),(326,'originalFileName','index.pdf','string'),(326,'sourceSubmissionFileId',NULL,'string'),(326,'submissionFileId','79','int'),(326,'submissionId','10','int'),(326,'username','jbrower','string'),(327,'fileId','47','int'),(327,'fileStage','2','int'),(327,'name','index.pdf','string'),(327,'originalFileName','index.pdf','string'),(327,'sourceSubmissionFileId',NULL,'string'),(327,'submissionFileId','79','int'),(327,'submissionId','10','int'),(327,'username','jbrower','string'),(331,'fileId','48','int'),(331,'fileStage','2','int'),(331,'originalFileName','intro.pdf','string'),(331,'sourceSubmissionFileId',NULL,'string'),(331,'submissionFileId','80','int'),(331,'submissionId','11','int'),(331,'username','jlockehart','string'),(332,'fileId','48','int'),(332,'fileStage','2','int'),(332,'name','intro.pdf','string'),(332,'submissionFileId','80','int'),(332,'submissionId','11','int'),(332,'username','jlockehart','string'),(333,'fileId','48','int'),(333,'fileStage','2','int'),(333,'originalFileName','intro.pdf','string'),(333,'sourceSubmissionFileId',NULL,'string'),(333,'submissionFileId','80','int'),(333,'submissionId','11','int'),(333,'username','jlockehart','string'),(334,'fileId','48','int'),(334,'fileStage','2','int'),(334,'name','intro.pdf','string'),(334,'originalFileName','intro.pdf','string'),(334,'sourceSubmissionFileId',NULL,'string'),(334,'submissionFileId','80','int'),(334,'submissionId','11','int'),(334,'username','jlockehart','string'),(335,'fileId','49','int'),(335,'fileStage','2','int'),(335,'originalFileName','poems.pdf','string'),(335,'sourceSubmissionFileId',NULL,'string'),(335,'submissionFileId','81','int'),(335,'submissionId','11','int'),(335,'username','jlockehart','string'),(336,'fileId','49','int'),(336,'fileStage','2','int'),(336,'name','poems.pdf','string'),(336,'submissionFileId','81','int'),(336,'submissionId','11','int'),(336,'username','jlockehart','string'),(337,'fileId','49','int'),(337,'fileStage','2','int'),(337,'originalFileName','poems.pdf','string'),(337,'sourceSubmissionFileId',NULL,'string'),(337,'submissionFileId','81','int'),(337,'submissionId','11','int'),(337,'username','jlockehart','string'),(338,'fileId','49','int'),(338,'fileStage','2','int'),(338,'name','poems.pdf','string'),(338,'originalFileName','poems.pdf','string'),(338,'sourceSubmissionFileId',NULL,'string'),(338,'submissionFileId','81','int'),(338,'submissionId','11','int'),(338,'username','jlockehart','string'),(340,'decision','1','int'),(340,'editorId','3','int'),(340,'editorName','Daniel Barnes','string'),(340,'submissionId','11','int'),(341,'fileId','49','int'),(341,'fileStage','19','int'),(341,'originalFileName','poems.pdf','string'),(341,'sourceSubmissionFileId','81','int'),(341,'submissionFileId','82','int'),(341,'submissionId','11','int'),(341,'username','dbarnes','string'),(342,'fileId','49','int'),(342,'fileStage','19','int'),(342,'name','poems.pdf','string'),(342,'submissionFileId','82','int'),(342,'submissionId','11','int'),(342,'username','dbarnes','string'),(343,'fileId','48','int'),(343,'fileStage','19','int'),(343,'originalFileName','intro.pdf','string'),(343,'sourceSubmissionFileId','80','int'),(343,'submissionFileId','83','int'),(343,'submissionId','11','int'),(343,'username','dbarnes','string'),(344,'fileId','48','int'),(344,'fileStage','19','int'),(344,'name','intro.pdf','string'),(344,'submissionFileId','83','int'),(344,'submissionId','11','int'),(344,'username','dbarnes','string'),(345,'reviewAssignmentId','9','int'),(345,'reviewerName','Aisla McCrae','string'),(345,'round','1','int'),(345,'stageId','2','int'),(345,'submissionId','11','int'),(346,'decision','3','int'),(346,'editorId','3','int'),(346,'editorName','Daniel Barnes','string'),(346,'submissionId','11','int'),(347,'reviewAssignmentId','10','int'),(347,'reviewerName','Adela Gallego','string'),(347,'round','1','int'),(347,'stageId','3','int'),(347,'submissionId','11','int'),(348,'reviewAssignmentId','11','int'),(348,'reviewerName','Gonzalo Favio','string'),(348,'round','1','int'),(348,'stageId','3','int'),(348,'submissionId','11','int'),(349,'reviewAssignmentId','10','int'),(349,'reviewerName','Adela Gallego','string'),(349,'round','1','int'),(349,'submissionId','11','int'),(350,'reviewAssignmentId','10','int'),(350,'reviewerName','Adela Gallego','string'),(350,'round','1','int'),(350,'submissionId','11','int'),(351,'reviewAssignmentId','11','int'),(351,'reviewerName','Gonzalo Favio','string'),(351,'round','1','int'),(351,'submissionId','11','int'),(352,'reviewAssignmentId','11','int'),(352,'reviewerName','Gonzalo Favio','string'),(352,'round','1','int'),(352,'submissionId','11','int'),(353,'decision','2','int'),(353,'editorId','3','int'),(353,'editorName','Daniel Barnes','string'),(353,'submissionId','11','int'),(354,'recipientCount','2','int'),(354,'subject','Thank you for your review','string'),(357,'fileId','50','int'),(357,'fileStage','2','int'),(357,'originalFileName','chapter1.pdf','string'),(357,'sourceSubmissionFileId',NULL,'string'),(357,'submissionFileId','84','int'),(357,'submissionId','12','int'),(357,'username','lelder','string'),(358,'fileId','50','int'),(358,'fileStage','2','int'),(358,'name','chapter1.pdf','string'),(358,'submissionFileId','84','int'),(358,'submissionId','12','int'),(358,'username','lelder','string'),(359,'fileId','50','int'),(359,'fileStage','2','int'),(359,'originalFileName','chapter1.pdf','string'),(359,'sourceSubmissionFileId',NULL,'string'),(359,'submissionFileId','84','int'),(359,'submissionId','12','int'),(359,'username','lelder','string'),(360,'fileId','50','int'),(360,'fileStage','2','int'),(360,'name','chapter1.pdf','string'),(360,'originalFileName','chapter1.pdf','string'),(360,'sourceSubmissionFileId',NULL,'string'),(360,'submissionFileId','84','int'),(360,'submissionId','12','int'),(360,'username','lelder','string'),(361,'fileId','51','int'),(361,'fileStage','2','int'),(361,'originalFileName','chapter2.pdf','string'),(361,'sourceSubmissionFileId',NULL,'string'),(361,'submissionFileId','85','int'),(361,'submissionId','12','int'),(361,'username','lelder','string'),(362,'fileId','51','int'),(362,'fileStage','2','int'),(362,'name','chapter2.pdf','string'),(362,'submissionFileId','85','int'),(362,'submissionId','12','int'),(362,'username','lelder','string'),(363,'fileId','51','int'),(363,'fileStage','2','int'),(363,'originalFileName','chapter2.pdf','string'),(363,'sourceSubmissionFileId',NULL,'string'),(363,'submissionFileId','85','int'),(363,'submissionId','12','int'),(363,'username','lelder','string'),(364,'fileId','51','int'),(364,'fileStage','2','int'),(364,'name','chapter2.pdf','string'),(364,'originalFileName','chapter2.pdf','string'),(364,'sourceSubmissionFileId',NULL,'string'),(364,'submissionFileId','85','int'),(364,'submissionId','12','int'),(364,'username','lelder','string'),(365,'fileId','52','int'),(365,'fileStage','2','int'),(365,'originalFileName','chapter3.pdf','string'),(365,'sourceSubmissionFileId',NULL,'string'),(365,'submissionFileId','86','int'),(365,'submissionId','12','int'),(365,'username','lelder','string'),(366,'fileId','52','int'),(366,'fileStage','2','int'),(366,'name','chapter3.pdf','string'),(366,'submissionFileId','86','int'),(366,'submissionId','12','int'),(366,'username','lelder','string'),(367,'fileId','52','int'),(367,'fileStage','2','int'),(367,'originalFileName','chapter3.pdf','string'),(367,'sourceSubmissionFileId',NULL,'string'),(367,'submissionFileId','86','int'),(367,'submissionId','12','int'),(367,'username','lelder','string'),(368,'fileId','52','int'),(368,'fileStage','2','int'),(368,'name','chapter3.pdf','string'),(368,'originalFileName','chapter3.pdf','string'),(368,'sourceSubmissionFileId',NULL,'string'),(368,'submissionFileId','86','int'),(368,'submissionId','12','int'),(368,'username','lelder','string'),(370,'decision','1','int'),(370,'editorId','3','int'),(370,'editorName','Daniel Barnes','string'),(370,'submissionId','12','int'),(371,'fileId','52','int'),(371,'fileStage','19','int'),(371,'originalFileName','chapter3.pdf','string'),(371,'sourceSubmissionFileId','86','int'),(371,'submissionFileId','87','int'),(371,'submissionId','12','int'),(371,'username','dbarnes','string'),(372,'fileId','52','int'),(372,'fileStage','19','int'),(372,'name','chapter3.pdf','string'),(372,'submissionFileId','87','int'),(372,'submissionId','12','int'),(372,'username','dbarnes','string'),(373,'fileId','50','int'),(373,'fileStage','19','int'),(373,'originalFileName','chapter1.pdf','string'),(373,'sourceSubmissionFileId','84','int'),(373,'submissionFileId','88','int'),(373,'submissionId','12','int'),(373,'username','dbarnes','string'),(374,'fileId','50','int'),(374,'fileStage','19','int'),(374,'name','chapter1.pdf','string'),(374,'submissionFileId','88','int'),(374,'submissionId','12','int'),(374,'username','dbarnes','string'),(375,'fileId','51','int'),(375,'fileStage','19','int'),(375,'originalFileName','chapter2.pdf','string'),(375,'sourceSubmissionFileId','85','int'),(375,'submissionFileId','89','int'),(375,'submissionId','12','int'),(375,'username','dbarnes','string'),(376,'fileId','51','int'),(376,'fileStage','19','int'),(376,'name','chapter2.pdf','string'),(376,'submissionFileId','89','int'),(376,'submissionId','12','int'),(376,'username','dbarnes','string'),(377,'reviewAssignmentId','12','int'),(377,'reviewerName','Julie Janssen','string'),(377,'round','1','int'),(377,'stageId','2','int'),(377,'submissionId','12','int'),(378,'reviewAssignmentId','13','int'),(378,'reviewerName','Paul Hudson','string'),(378,'round','1','int'),(378,'stageId','2','int'),(378,'submissionId','12','int'),(379,'reviewAssignmentId','14','int'),(379,'reviewerName','Aisla McCrae','string'),(379,'round','1','int'),(379,'stageId','2','int'),(379,'submissionId','12','int'),(380,'reviewAssignmentId','13','int'),(380,'reviewerName','Paul Hudson','string'),(380,'round','1','int'),(380,'submissionId','12','int'),(381,'reviewAssignmentId','13','int'),(381,'reviewerName','Paul Hudson','string'),(381,'round','1','int'),(381,'submissionId','12','int'),(384,'fileId','53','int'),(384,'fileStage','2','int'),(384,'originalFileName','chapter1.pdf','string'),(384,'sourceSubmissionFileId',NULL,'string'),(384,'submissionFileId','90','int'),(384,'submissionId','13','int'),(384,'username','mally','string'),(385,'fileId','53','int'),(385,'fileStage','2','int'),(385,'name','chapter1.pdf','string'),(385,'submissionFileId','90','int'),(385,'submissionId','13','int'),(385,'username','mally','string'),(386,'fileId','53','int'),(386,'fileStage','2','int'),(386,'originalFileName','chapter1.pdf','string'),(386,'sourceSubmissionFileId',NULL,'string'),(386,'submissionFileId','90','int'),(386,'submissionId','13','int'),(386,'username','mally','string'),(387,'fileId','53','int'),(387,'fileStage','2','int'),(387,'name','chapter1.pdf','string'),(387,'originalFileName','chapter1.pdf','string'),(387,'sourceSubmissionFileId',NULL,'string'),(387,'submissionFileId','90','int'),(387,'submissionId','13','int'),(387,'username','mally','string'),(388,'fileId','54','int'),(388,'fileStage','2','int'),(388,'originalFileName','chapter2.pdf','string'),(388,'sourceSubmissionFileId',NULL,'string'),(388,'submissionFileId','91','int'),(388,'submissionId','13','int'),(388,'username','mally','string'),(389,'fileId','54','int'),(389,'fileStage','2','int'),(389,'name','chapter2.pdf','string'),(389,'submissionFileId','91','int'),(389,'submissionId','13','int'),(389,'username','mally','string'),(390,'fileId','54','int'),(390,'fileStage','2','int'),(390,'originalFileName','chapter2.pdf','string'),(390,'sourceSubmissionFileId',NULL,'string'),(390,'submissionFileId','91','int'),(390,'submissionId','13','int'),(390,'username','mally','string'),(391,'fileId','54','int'),(391,'fileStage','2','int'),(391,'name','chapter2.pdf','string'),(391,'originalFileName','chapter2.pdf','string'),(391,'sourceSubmissionFileId',NULL,'string'),(391,'submissionFileId','91','int'),(391,'submissionId','13','int'),(391,'username','mally','string'),(392,'fileId','55','int'),(392,'fileStage','2','int'),(392,'originalFileName','chapter3.pdf','string'),(392,'sourceSubmissionFileId',NULL,'string'),(392,'submissionFileId','92','int'),(392,'submissionId','13','int'),(392,'username','mally','string'),(393,'fileId','55','int'),(393,'fileStage','2','int'),(393,'name','chapter3.pdf','string'),(393,'submissionFileId','92','int'),(393,'submissionId','13','int'),(393,'username','mally','string'),(394,'fileId','55','int'),(394,'fileStage','2','int'),(394,'originalFileName','chapter3.pdf','string'),(394,'sourceSubmissionFileId',NULL,'string'),(394,'submissionFileId','92','int'),(394,'submissionId','13','int'),(394,'username','mally','string'),(395,'fileId','55','int'),(395,'fileStage','2','int'),(395,'name','chapter3.pdf','string'),(395,'originalFileName','chapter3.pdf','string'),(395,'sourceSubmissionFileId',NULL,'string'),(395,'submissionFileId','92','int'),(395,'submissionId','13','int'),(395,'username','mally','string'),(397,'decision','1','int'),(397,'editorId','3','int'),(397,'editorName','Daniel Barnes','string'),(397,'submissionId','13','int'),(398,'fileId','55','int'),(398,'fileStage','19','int'),(398,'originalFileName','chapter3.pdf','string'),(398,'sourceSubmissionFileId','92','int'),(398,'submissionFileId','93','int'),(398,'submissionId','13','int'),(398,'username','dbarnes','string'),(399,'fileId','55','int'),(399,'fileStage','19','int'),(399,'name','chapter3.pdf','string'),(399,'submissionFileId','93','int'),(399,'submissionId','13','int'),(399,'username','dbarnes','string'),(400,'fileId','54','int'),(400,'fileStage','19','int'),(400,'originalFileName','chapter2.pdf','string'),(400,'sourceSubmissionFileId','91','int'),(400,'submissionFileId','94','int'),(400,'submissionId','13','int'),(400,'username','dbarnes','string'),(401,'fileId','54','int'),(401,'fileStage','19','int'),(401,'name','chapter2.pdf','string'),(401,'submissionFileId','94','int'),(401,'submissionId','13','int'),(401,'username','dbarnes','string'),(402,'fileId','53','int'),(402,'fileStage','19','int'),(402,'originalFileName','chapter1.pdf','string'),(402,'sourceSubmissionFileId','90','int'),(402,'submissionFileId','95','int'),(402,'submissionId','13','int'),(402,'username','dbarnes','string'),(403,'fileId','53','int'),(403,'fileStage','19','int'),(403,'name','chapter1.pdf','string'),(403,'submissionFileId','95','int'),(403,'submissionId','13','int'),(403,'username','dbarnes','string'),(404,'reviewAssignmentId','15','int'),(404,'reviewerName','Paul Hudson','string'),(404,'round','1','int'),(404,'stageId','2','int'),(404,'submissionId','13','int'),(405,'decision','3','int'),(405,'editorId','3','int'),(405,'editorName','Daniel Barnes','string'),(405,'submissionId','13','int'),(406,'reviewAssignmentId','16','int'),(406,'reviewerName','Adela Gallego','string'),(406,'round','1','int'),(406,'stageId','3','int'),(406,'submissionId','13','int'),(407,'reviewAssignmentId','17','int'),(407,'reviewerName','Al Zacharia','string'),(407,'round','1','int'),(407,'stageId','3','int'),(407,'submissionId','13','int'),(408,'reviewAssignmentId','18','int'),(408,'reviewerName','Gonzalo Favio','string'),(408,'round','1','int'),(408,'stageId','3','int'),(408,'submissionId','13','int'),(409,'reviewAssignmentId','16','int'),(409,'reviewerName','Adela Gallego','string'),(409,'round','1','int'),(409,'submissionId','13','int'),(410,'reviewAssignmentId','16','int'),(410,'reviewerName','Adela Gallego','string'),(410,'round','1','int'),(410,'submissionId','13','int'),(411,'reviewAssignmentId','18','int'),(411,'reviewerName','Gonzalo Favio','string'),(411,'round','1','int'),(411,'submissionId','13','int'),(412,'reviewAssignmentId','18','int'),(412,'reviewerName','Gonzalo Favio','string'),(412,'round','1','int'),(412,'submissionId','13','int'),(413,'decision','2','int'),(413,'editorId','3','int'),(413,'editorName','Daniel Barnes','string'),(413,'submissionId','13','int'),(414,'recipientCount','2','int'),(414,'subject','Thank you for your review','string'),(417,'fileId','56','int'),(417,'fileStage','2','int'),(417,'originalFileName','chapter1.pdf','string'),(417,'sourceSubmissionFileId',NULL,'string'),(417,'submissionFileId','96','int'),(417,'submissionId','14','int'),(417,'username','mdawson','string'),(418,'fileId','56','int'),(418,'fileStage','2','int'),(418,'name','chapter1.pdf','string'),(418,'submissionFileId','96','int'),(418,'submissionId','14','int'),(418,'username','mdawson','string'),(419,'fileId','56','int'),(419,'fileStage','2','int'),(419,'originalFileName','chapter1.pdf','string'),(419,'sourceSubmissionFileId',NULL,'string'),(419,'submissionFileId','96','int'),(419,'submissionId','14','int'),(419,'username','mdawson','string'),(420,'fileId','56','int'),(420,'fileStage','2','int'),(420,'name','chapter1.pdf','string'),(420,'originalFileName','chapter1.pdf','string'),(420,'sourceSubmissionFileId',NULL,'string'),(420,'submissionFileId','96','int'),(420,'submissionId','14','int'),(420,'username','mdawson','string'),(421,'fileId','57','int'),(421,'fileStage','2','int'),(421,'originalFileName','chapter2.pdf','string'),(421,'sourceSubmissionFileId',NULL,'string'),(421,'submissionFileId','97','int'),(421,'submissionId','14','int'),(421,'username','mdawson','string'),(422,'fileId','57','int'),(422,'fileStage','2','int'),(422,'name','chapter2.pdf','string'),(422,'submissionFileId','97','int'),(422,'submissionId','14','int'),(422,'username','mdawson','string'),(423,'fileId','57','int'),(423,'fileStage','2','int'),(423,'originalFileName','chapter2.pdf','string'),(423,'sourceSubmissionFileId',NULL,'string'),(423,'submissionFileId','97','int'),(423,'submissionId','14','int'),(423,'username','mdawson','string'),(424,'fileId','57','int'),(424,'fileStage','2','int'),(424,'name','chapter2.pdf','string'),(424,'originalFileName','chapter2.pdf','string'),(424,'sourceSubmissionFileId',NULL,'string'),(424,'submissionFileId','97','int'),(424,'submissionId','14','int'),(424,'username','mdawson','string'),(425,'fileId','58','int'),(425,'fileStage','2','int'),(425,'originalFileName','chapter3.pdf','string'),(425,'sourceSubmissionFileId',NULL,'string'),(425,'submissionFileId','98','int'),(425,'submissionId','14','int'),(425,'username','mdawson','string'),(426,'fileId','58','int'),(426,'fileStage','2','int'),(426,'name','chapter3.pdf','string'),(426,'submissionFileId','98','int'),(426,'submissionId','14','int'),(426,'username','mdawson','string'),(427,'fileId','58','int'),(427,'fileStage','2','int'),(427,'originalFileName','chapter3.pdf','string'),(427,'sourceSubmissionFileId',NULL,'string'),(427,'submissionFileId','98','int'),(427,'submissionId','14','int'),(427,'username','mdawson','string'),(428,'fileId','58','int'),(428,'fileStage','2','int'),(428,'name','chapter3.pdf','string'),(428,'originalFileName','chapter3.pdf','string'),(428,'sourceSubmissionFileId',NULL,'string'),(428,'submissionFileId','98','int'),(428,'submissionId','14','int'),(428,'username','mdawson','string'),(429,'fileId','59','int'),(429,'fileStage','2','int'),(429,'originalFileName','chapter4.pdf','string'),(429,'sourceSubmissionFileId',NULL,'string'),(429,'submissionFileId','99','int'),(429,'submissionId','14','int'),(429,'username','mdawson','string'),(430,'fileId','59','int'),(430,'fileStage','2','int'),(430,'name','chapter4.pdf','string'),(430,'submissionFileId','99','int'),(430,'submissionId','14','int'),(430,'username','mdawson','string'),(431,'fileId','59','int'),(431,'fileStage','2','int'),(431,'originalFileName','chapter4.pdf','string'),(431,'sourceSubmissionFileId',NULL,'string'),(431,'submissionFileId','99','int'),(431,'submissionId','14','int'),(431,'username','mdawson','string'),(432,'fileId','59','int'),(432,'fileStage','2','int'),(432,'name','chapter4.pdf','string'),(432,'originalFileName','chapter4.pdf','string'),(432,'sourceSubmissionFileId',NULL,'string'),(432,'submissionFileId','99','int'),(432,'submissionId','14','int'),(432,'username','mdawson','string'),(433,'fileId','60','int'),(433,'fileStage','2','int'),(433,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(433,'sourceSubmissionFileId',NULL,'string'),(433,'submissionFileId','100','int'),(433,'submissionId','14','int'),(433,'username','mdawson','string'),(434,'fileId','60','int'),(434,'fileStage','2','int'),(434,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(434,'submissionFileId','100','int'),(434,'submissionId','14','int'),(434,'username','mdawson','string'),(435,'fileId','60','int'),(435,'fileStage','2','int'),(435,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(435,'sourceSubmissionFileId',NULL,'string'),(435,'submissionFileId','100','int'),(435,'submissionId','14','int'),(435,'username','mdawson','string'),(436,'fileId','60','int'),(436,'fileStage','2','int'),(436,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(436,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(436,'sourceSubmissionFileId',NULL,'string'),(436,'submissionFileId','100','int'),(436,'submissionId','14','int'),(436,'username','mdawson','string'),(437,'fileId','61','int'),(437,'fileStage','2','int'),(437,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(437,'sourceSubmissionFileId',NULL,'string'),(437,'submissionFileId','101','int'),(437,'submissionId','14','int'),(437,'username','mdawson','string'),(438,'fileId','61','int'),(438,'fileStage','2','int'),(438,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(438,'submissionFileId','101','int'),(438,'submissionId','14','int'),(438,'username','mdawson','string'),(439,'fileId','61','int'),(439,'fileStage','2','int'),(439,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(439,'sourceSubmissionFileId',NULL,'string'),(439,'submissionFileId','101','int'),(439,'submissionId','14','int'),(439,'username','mdawson','string'),(440,'fileId','61','int'),(440,'fileStage','2','int'),(440,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(440,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(440,'sourceSubmissionFileId',NULL,'string'),(440,'submissionFileId','101','int'),(440,'submissionId','14','int'),(440,'username','mdawson','string'),(442,'decision','1','int'),(442,'editorId','3','int'),(442,'editorName','Daniel Barnes','string'),(442,'submissionId','14','int'),(443,'fileId','60','int'),(443,'fileStage','19','int'),(443,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(443,'sourceSubmissionFileId','100','int'),(443,'submissionFileId','102','int'),(443,'submissionId','14','int'),(443,'username','dbarnes','string'),(444,'fileId','60','int'),(444,'fileStage','19','int'),(444,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(444,'submissionFileId','102','int'),(444,'submissionId','14','int'),(444,'username','dbarnes','string'),(445,'fileId','61','int'),(445,'fileStage','19','int'),(445,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(445,'sourceSubmissionFileId','101','int'),(445,'submissionFileId','103','int'),(445,'submissionId','14','int'),(445,'username','dbarnes','string'),(446,'fileId','61','int'),(446,'fileStage','19','int'),(446,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(446,'submissionFileId','103','int'),(446,'submissionId','14','int'),(446,'username','dbarnes','string'),(447,'fileId','59','int'),(447,'fileStage','19','int'),(447,'originalFileName','chapter4.pdf','string'),(447,'sourceSubmissionFileId','99','int'),(447,'submissionFileId','104','int'),(447,'submissionId','14','int'),(447,'username','dbarnes','string'),(448,'fileId','59','int'),(448,'fileStage','19','int'),(448,'name','chapter4.pdf','string'),(448,'submissionFileId','104','int'),(448,'submissionId','14','int'),(448,'username','dbarnes','string'),(449,'fileId','58','int'),(449,'fileStage','19','int'),(449,'originalFileName','chapter3.pdf','string'),(449,'sourceSubmissionFileId','98','int'),(449,'submissionFileId','105','int'),(449,'submissionId','14','int'),(449,'username','dbarnes','string'),(450,'fileId','58','int'),(450,'fileStage','19','int'),(450,'name','chapter3.pdf','string'),(450,'submissionFileId','105','int'),(450,'submissionId','14','int'),(450,'username','dbarnes','string'),(451,'fileId','57','int'),(451,'fileStage','19','int'),(451,'originalFileName','chapter2.pdf','string'),(451,'sourceSubmissionFileId','97','int'),(451,'submissionFileId','106','int'),(451,'submissionId','14','int'),(451,'username','dbarnes','string'),(452,'fileId','57','int'),(452,'fileStage','19','int'),(452,'name','chapter2.pdf','string'),(452,'submissionFileId','106','int'),(452,'submissionId','14','int'),(452,'username','dbarnes','string'),(453,'fileId','56','int'),(453,'fileStage','19','int'),(453,'originalFileName','chapter1.pdf','string'),(453,'sourceSubmissionFileId','96','int'),(453,'submissionFileId','107','int'),(453,'submissionId','14','int'),(453,'username','dbarnes','string'),(454,'fileId','56','int'),(454,'fileStage','19','int'),(454,'name','chapter1.pdf','string'),(454,'submissionFileId','107','int'),(454,'submissionId','14','int'),(454,'username','dbarnes','string'),(455,'reviewAssignmentId','19','int'),(455,'reviewerName','Julie Janssen','string'),(455,'round','1','int'),(455,'stageId','2','int'),(455,'submissionId','14','int'),(456,'decision','3','int'),(456,'editorId','3','int'),(456,'editorName','Daniel Barnes','string'),(456,'submissionId','14','int'),(457,'reviewAssignmentId','20','int'),(457,'reviewerName','Al Zacharia','string'),(457,'round','1','int'),(457,'stageId','3','int'),(457,'submissionId','14','int'),(458,'decision','2','int'),(458,'editorId','3','int'),(458,'editorName','Daniel Barnes','string'),(458,'submissionId','14','int'),(459,'name','Maria Fritz','string'),(459,'userGroupName','Copyeditor','string'),(459,'username','mfritz','string'),(460,'decision','7','int'),(460,'editorId','3','int'),(460,'editorName','Daniel Barnes','string'),(460,'submissionId','14','int'),(461,'name','Graham Cox','string'),(461,'userGroupName','Layout Editor','string'),(461,'username','gcox','string'),(462,'name','Sabine Kumar','string'),(462,'userGroupName','Proofreader','string'),(462,'username','skumar','string'),(463,'formatName','PDF','string'),(464,'fileId','61','int'),(464,'fileStage','10','int'),(464,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(464,'sourceSubmissionFileId','101','int'),(464,'submissionFileId','108','int'),(464,'submissionId','14','int'),(464,'username','dbarnes','string'),(465,'fileId','61','int'),(465,'fileStage','10','int'),(465,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(465,'submissionFileId','108','int'),(465,'submissionId','14','int'),(465,'username','dbarnes','string'),(466,'fileId','60','int'),(466,'fileStage','10','int'),(466,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(466,'sourceSubmissionFileId','100','int'),(466,'submissionFileId','109','int'),(466,'submissionId','14','int'),(466,'username','dbarnes','string'),(467,'fileId','60','int'),(467,'fileStage','10','int'),(467,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(467,'submissionFileId','109','int'),(467,'submissionId','14','int'),(467,'username','dbarnes','string'),(468,'fileId','59','int'),(468,'fileStage','10','int'),(468,'originalFileName','chapter4.pdf','string'),(468,'sourceSubmissionFileId','99','int'),(468,'submissionFileId','110','int'),(468,'submissionId','14','int'),(468,'username','dbarnes','string'),(469,'fileId','59','int'),(469,'fileStage','10','int'),(469,'name','chapter4.pdf','string'),(469,'submissionFileId','110','int'),(469,'submissionId','14','int'),(469,'username','dbarnes','string'),(470,'fileId','58','int'),(470,'fileStage','10','int'),(470,'originalFileName','chapter3.pdf','string'),(470,'sourceSubmissionFileId','98','int'),(470,'submissionFileId','111','int'),(470,'submissionId','14','int'),(470,'username','dbarnes','string'),(471,'fileId','58','int'),(471,'fileStage','10','int'),(471,'name','chapter3.pdf','string'),(471,'submissionFileId','111','int'),(471,'submissionId','14','int'),(471,'username','dbarnes','string'),(472,'fileId','57','int'),(472,'fileStage','10','int'),(472,'originalFileName','chapter2.pdf','string'),(472,'sourceSubmissionFileId','97','int'),(472,'submissionFileId','112','int'),(472,'submissionId','14','int'),(472,'username','dbarnes','string'),(473,'fileId','57','int'),(473,'fileStage','10','int'),(473,'name','chapter2.pdf','string'),(473,'submissionFileId','112','int'),(473,'submissionId','14','int'),(473,'username','dbarnes','string'),(474,'fileId','56','int'),(474,'fileStage','10','int'),(474,'originalFileName','chapter1.pdf','string'),(474,'sourceSubmissionFileId','96','int'),(474,'submissionFileId','113','int'),(474,'submissionId','14','int'),(474,'username','dbarnes','string'),(475,'fileId','56','int'),(475,'fileStage','10','int'),(475,'name','chapter1.pdf','string'),(475,'submissionFileId','113','int'),(475,'submissionId','14','int'),(475,'username','dbarnes','string'),(476,'publicationFormatName','PDF','string'),(477,'publicationFormatName','PDF','string'),(478,'fileId','56','int'),(478,'fileStage','10','int'),(478,'originalFileName','chapter1.pdf','string'),(478,'sourceSubmissionFileId','96','int'),(478,'submissionFileId','113','int'),(478,'submissionId','14','int'),(478,'username','dbarnes','string'),(479,'fileId','56','int'),(479,'fileStage','10','int'),(479,'name','chapter1.pdf','string'),(479,'originalFileName','chapter1.pdf','string'),(479,'sourceSubmissionFileId','96','int'),(479,'submissionFileId','113','int'),(479,'submissionId','14','int'),(479,'username','dbarnes','string'),(480,'file','chapter1.pdf','string'),(480,'name','Daniel Barnes','string'),(480,'username','dbarnes','string'),(481,'fileId','56','int'),(481,'fileStage','10','int'),(481,'originalFileName','chapter1.pdf','string'),(481,'sourceSubmissionFileId','96','int'),(481,'submissionFileId','113','int'),(481,'submissionId','14','int'),(481,'username','dbarnes','string'),(482,'fileId','56','int'),(482,'fileStage','10','int'),(482,'name','chapter1.pdf','string'),(482,'originalFileName','chapter1.pdf','string'),(482,'sourceSubmissionFileId','96','int'),(482,'submissionFileId','113','int'),(482,'submissionId','14','int'),(482,'username','dbarnes','string'),(483,'fileId','57','int'),(483,'fileStage','10','int'),(483,'originalFileName','chapter2.pdf','string'),(483,'sourceSubmissionFileId','97','int'),(483,'submissionFileId','112','int'),(483,'submissionId','14','int'),(483,'username','dbarnes','string'),(484,'fileId','57','int'),(484,'fileStage','10','int'),(484,'name','chapter2.pdf','string'),(484,'originalFileName','chapter2.pdf','string'),(484,'sourceSubmissionFileId','97','int'),(484,'submissionFileId','112','int'),(484,'submissionId','14','int'),(484,'username','dbarnes','string'),(485,'file','chapter2.pdf','string'),(485,'name','Daniel Barnes','string'),(485,'username','dbarnes','string'),(486,'fileId','57','int'),(486,'fileStage','10','int'),(486,'originalFileName','chapter2.pdf','string'),(486,'sourceSubmissionFileId','97','int'),(486,'submissionFileId','112','int'),(486,'submissionId','14','int'),(486,'username','dbarnes','string'),(487,'fileId','57','int'),(487,'fileStage','10','int'),(487,'name','chapter2.pdf','string'),(487,'originalFileName','chapter2.pdf','string'),(487,'sourceSubmissionFileId','97','int'),(487,'submissionFileId','112','int'),(487,'submissionId','14','int'),(487,'username','dbarnes','string'),(488,'fileId','58','int'),(488,'fileStage','10','int'),(488,'originalFileName','chapter3.pdf','string'),(488,'sourceSubmissionFileId','98','int'),(488,'submissionFileId','111','int'),(488,'submissionId','14','int'),(488,'username','dbarnes','string'),(489,'fileId','58','int'),(489,'fileStage','10','int'),(489,'name','chapter3.pdf','string'),(489,'originalFileName','chapter3.pdf','string'),(489,'sourceSubmissionFileId','98','int'),(489,'submissionFileId','111','int'),(489,'submissionId','14','int'),(489,'username','dbarnes','string'),(490,'file','chapter3.pdf','string'),(490,'name','Daniel Barnes','string'),(490,'username','dbarnes','string'),(491,'fileId','58','int'),(491,'fileStage','10','int'),(491,'originalFileName','chapter3.pdf','string'),(491,'sourceSubmissionFileId','98','int'),(491,'submissionFileId','111','int'),(491,'submissionId','14','int'),(491,'username','dbarnes','string'),(492,'fileId','58','int'),(492,'fileStage','10','int'),(492,'name','chapter3.pdf','string'),(492,'originalFileName','chapter3.pdf','string'),(492,'sourceSubmissionFileId','98','int'),(492,'submissionFileId','111','int'),(492,'submissionId','14','int'),(492,'username','dbarnes','string'),(493,'fileId','59','int'),(493,'fileStage','10','int'),(493,'originalFileName','chapter4.pdf','string'),(493,'sourceSubmissionFileId','99','int'),(493,'submissionFileId','110','int'),(493,'submissionId','14','int'),(493,'username','dbarnes','string'),(494,'fileId','59','int'),(494,'fileStage','10','int'),(494,'name','chapter4.pdf','string'),(494,'originalFileName','chapter4.pdf','string'),(494,'sourceSubmissionFileId','99','int'),(494,'submissionFileId','110','int'),(494,'submissionId','14','int'),(494,'username','dbarnes','string'),(495,'file','chapter4.pdf','string'),(495,'name','Daniel Barnes','string'),(495,'username','dbarnes','string'),(496,'fileId','59','int'),(496,'fileStage','10','int'),(496,'originalFileName','chapter4.pdf','string'),(496,'sourceSubmissionFileId','99','int'),(496,'submissionFileId','110','int'),(496,'submissionId','14','int'),(496,'username','dbarnes','string'),(497,'fileId','59','int'),(497,'fileStage','10','int'),(497,'name','chapter4.pdf','string'),(497,'originalFileName','chapter4.pdf','string'),(497,'sourceSubmissionFileId','99','int'),(497,'submissionFileId','110','int'),(497,'submissionId','14','int'),(497,'username','dbarnes','string'),(498,'fileId','60','int'),(498,'fileStage','10','int'),(498,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(498,'sourceSubmissionFileId','100','int'),(498,'submissionFileId','109','int'),(498,'submissionId','14','int'),(498,'username','dbarnes','string'),(499,'fileId','60','int'),(499,'fileStage','10','int'),(499,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(499,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(499,'sourceSubmissionFileId','100','int'),(499,'submissionFileId','109','int'),(499,'submissionId','14','int'),(499,'username','dbarnes','string'),(500,'file','Segmentation of Vascular Ultrasound Imag.pdf','string'),(500,'name','Daniel Barnes','string'),(500,'username','dbarnes','string'),(501,'fileId','60','int'),(501,'fileStage','10','int'),(501,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(501,'sourceSubmissionFileId','100','int'),(501,'submissionFileId','109','int'),(501,'submissionId','14','int'),(501,'username','dbarnes','string'),(502,'fileId','60','int'),(502,'fileStage','10','int'),(502,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(502,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(502,'sourceSubmissionFileId','100','int'),(502,'submissionFileId','109','int'),(502,'submissionId','14','int'),(502,'username','dbarnes','string'),(503,'fileId','61','int'),(503,'fileStage','10','int'),(503,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(503,'sourceSubmissionFileId','101','int'),(503,'submissionFileId','108','int'),(503,'submissionId','14','int'),(503,'username','dbarnes','string'),(504,'fileId','61','int'),(504,'fileStage','10','int'),(504,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(504,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(504,'sourceSubmissionFileId','101','int'),(504,'submissionFileId','108','int'),(504,'submissionId','14','int'),(504,'username','dbarnes','string'),(505,'file','The Canadian Nutrient File: Nutrient Val.pdf','string'),(505,'name','Daniel Barnes','string'),(505,'username','dbarnes','string'),(506,'fileId','61','int'),(506,'fileStage','10','int'),(506,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(506,'sourceSubmissionFileId','101','int'),(506,'submissionFileId','108','int'),(506,'submissionId','14','int'),(506,'username','dbarnes','string'),(507,'fileId','61','int'),(507,'fileStage','10','int'),(507,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(507,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(507,'sourceSubmissionFileId','101','int'),(507,'submissionFileId','108','int'),(507,'submissionId','14','int'),(507,'username','dbarnes','string'),(511,'fileId','62','int'),(511,'fileStage','2','int'),(511,'originalFileName','chapter1.pdf','string'),(511,'sourceSubmissionFileId',NULL,'string'),(511,'submissionFileId','114','int'),(511,'submissionId','15','int'),(511,'username','mforan','string'),(512,'fileId','62','int'),(512,'fileStage','2','int'),(512,'name','chapter1.pdf','string'),(512,'submissionFileId','114','int'),(512,'submissionId','15','int'),(512,'username','mforan','string'),(513,'fileId','62','int'),(513,'fileStage','2','int'),(513,'originalFileName','chapter1.pdf','string'),(513,'sourceSubmissionFileId',NULL,'string'),(513,'submissionFileId','114','int'),(513,'submissionId','15','int'),(513,'username','mforan','string'),(514,'fileId','62','int'),(514,'fileStage','2','int'),(514,'name','chapter1.pdf','string'),(514,'originalFileName','chapter1.pdf','string'),(514,'sourceSubmissionFileId',NULL,'string'),(514,'submissionFileId','114','int'),(514,'submissionId','15','int'),(514,'username','mforan','string'),(515,'fileId','63','int'),(515,'fileStage','2','int'),(515,'originalFileName','chapter2.pdf','string'),(515,'sourceSubmissionFileId',NULL,'string'),(515,'submissionFileId','115','int'),(515,'submissionId','15','int'),(515,'username','mforan','string'),(516,'fileId','63','int'),(516,'fileStage','2','int'),(516,'name','chapter2.pdf','string'),(516,'submissionFileId','115','int'),(516,'submissionId','15','int'),(516,'username','mforan','string'),(517,'fileId','63','int'),(517,'fileStage','2','int'),(517,'originalFileName','chapter2.pdf','string'),(517,'sourceSubmissionFileId',NULL,'string'),(517,'submissionFileId','115','int'),(517,'submissionId','15','int'),(517,'username','mforan','string'),(518,'fileId','63','int'),(518,'fileStage','2','int'),(518,'name','chapter2.pdf','string'),(518,'originalFileName','chapter2.pdf','string'),(518,'sourceSubmissionFileId',NULL,'string'),(518,'submissionFileId','115','int'),(518,'submissionId','15','int'),(518,'username','mforan','string'),(519,'fileId','64','int'),(519,'fileStage','2','int'),(519,'originalFileName','chapter3.pdf','string'),(519,'sourceSubmissionFileId',NULL,'string'),(519,'submissionFileId','116','int'),(519,'submissionId','15','int'),(519,'username','mforan','string'),(520,'fileId','64','int'),(520,'fileStage','2','int'),(520,'name','chapter3.pdf','string'),(520,'submissionFileId','116','int'),(520,'submissionId','15','int'),(520,'username','mforan','string'),(521,'fileId','64','int'),(521,'fileStage','2','int'),(521,'originalFileName','chapter3.pdf','string'),(521,'sourceSubmissionFileId',NULL,'string'),(521,'submissionFileId','116','int'),(521,'submissionId','15','int'),(521,'username','mforan','string'),(522,'fileId','64','int'),(522,'fileStage','2','int'),(522,'name','chapter3.pdf','string'),(522,'originalFileName','chapter3.pdf','string'),(522,'sourceSubmissionFileId',NULL,'string'),(522,'submissionFileId','116','int'),(522,'submissionId','15','int'),(522,'username','mforan','string'),(524,'decision','18','int'),(524,'editorId','3','int'),(524,'editorName','Daniel Barnes','string'),(524,'submissionId','15','int'),(525,'fileId','64','int'),(525,'fileStage','4','int'),(525,'originalFileName','chapter3.pdf','string'),(525,'sourceSubmissionFileId','116','int'),(525,'submissionFileId','117','int'),(525,'submissionId','15','int'),(525,'username','dbarnes','string'),(526,'fileId','64','int'),(526,'fileStage','4','int'),(526,'name','chapter3.pdf','string'),(526,'submissionFileId','117','int'),(526,'submissionId','15','int'),(526,'username','dbarnes','string'),(527,'fileId','63','int'),(527,'fileStage','4','int'),(527,'originalFileName','chapter2.pdf','string'),(527,'sourceSubmissionFileId','115','int'),(527,'submissionFileId','118','int'),(527,'submissionId','15','int'),(527,'username','dbarnes','string'),(528,'fileId','63','int'),(528,'fileStage','4','int'),(528,'name','chapter2.pdf','string'),(528,'submissionFileId','118','int'),(528,'submissionId','15','int'),(528,'username','dbarnes','string'),(529,'fileId','62','int'),(529,'fileStage','4','int'),(529,'originalFileName','chapter1.pdf','string'),(529,'sourceSubmissionFileId','114','int'),(529,'submissionFileId','119','int'),(529,'submissionId','15','int'),(529,'username','dbarnes','string'),(530,'fileId','62','int'),(530,'fileStage','4','int'),(530,'name','chapter1.pdf','string'),(530,'submissionFileId','119','int'),(530,'submissionId','15','int'),(530,'username','dbarnes','string'),(533,'fileId','65','int'),(533,'fileStage','2','int'),(533,'originalFileName','foreward.pdf','string'),(533,'sourceSubmissionFileId',NULL,'string'),(533,'submissionFileId','120','int'),(533,'submissionId','16','int'),(533,'username','mpower','string'),(534,'fileId','65','int'),(534,'fileStage','2','int'),(534,'name','foreward.pdf','string'),(534,'submissionFileId','120','int'),(534,'submissionId','16','int'),(534,'username','mpower','string'),(535,'fileId','65','int'),(535,'fileStage','2','int'),(535,'originalFileName','foreward.pdf','string'),(535,'sourceSubmissionFileId',NULL,'string'),(535,'submissionFileId','120','int'),(535,'submissionId','16','int'),(535,'username','mpower','string'),(536,'fileId','65','int'),(536,'fileStage','2','int'),(536,'name','foreward.pdf','string'),(536,'originalFileName','foreward.pdf','string'),(536,'sourceSubmissionFileId',NULL,'string'),(536,'submissionFileId','120','int'),(536,'submissionId','16','int'),(536,'username','mpower','string'),(537,'fileId','66','int'),(537,'fileStage','2','int'),(537,'originalFileName','preface.pdf','string'),(537,'sourceSubmissionFileId',NULL,'string'),(537,'submissionFileId','121','int'),(537,'submissionId','16','int'),(537,'username','mpower','string'),(538,'fileId','66','int'),(538,'fileStage','2','int'),(538,'name','preface.pdf','string'),(538,'submissionFileId','121','int'),(538,'submissionId','16','int'),(538,'username','mpower','string'),(539,'fileId','66','int'),(539,'fileStage','2','int'),(539,'originalFileName','preface.pdf','string'),(539,'sourceSubmissionFileId',NULL,'string'),(539,'submissionFileId','121','int'),(539,'submissionId','16','int'),(539,'username','mpower','string'),(540,'fileId','66','int'),(540,'fileStage','2','int'),(540,'name','preface.pdf','string'),(540,'originalFileName','preface.pdf','string'),(540,'sourceSubmissionFileId',NULL,'string'),(540,'submissionFileId','121','int'),(540,'submissionId','16','int'),(540,'username','mpower','string'),(541,'fileId','67','int'),(541,'fileStage','2','int'),(541,'originalFileName','cases.pdf','string'),(541,'sourceSubmissionFileId',NULL,'string'),(541,'submissionFileId','122','int'),(541,'submissionId','16','int'),(541,'username','mpower','string'),(542,'fileId','67','int'),(542,'fileStage','2','int'),(542,'name','cases.pdf','string'),(542,'submissionFileId','122','int'),(542,'submissionId','16','int'),(542,'username','mpower','string'),(543,'fileId','67','int'),(543,'fileStage','2','int'),(543,'originalFileName','cases.pdf','string'),(543,'sourceSubmissionFileId',NULL,'string'),(543,'submissionFileId','122','int'),(543,'submissionId','16','int'),(543,'username','mpower','string'),(544,'fileId','67','int'),(544,'fileStage','2','int'),(544,'name','cases.pdf','string'),(544,'originalFileName','cases.pdf','string'),(544,'sourceSubmissionFileId',NULL,'string'),(544,'submissionFileId','122','int'),(544,'submissionId','16','int'),(544,'username','mpower','string'),(545,'fileId','68','int'),(545,'fileStage','2','int'),(545,'originalFileName','conclusion.pdf','string'),(545,'sourceSubmissionFileId',NULL,'string'),(545,'submissionFileId','123','int'),(545,'submissionId','16','int'),(545,'username','mpower','string'),(546,'fileId','68','int'),(546,'fileStage','2','int'),(546,'name','conclusion.pdf','string'),(546,'submissionFileId','123','int'),(546,'submissionId','16','int'),(546,'username','mpower','string'),(547,'fileId','68','int'),(547,'fileStage','2','int'),(547,'originalFileName','conclusion.pdf','string'),(547,'sourceSubmissionFileId',NULL,'string'),(547,'submissionFileId','123','int'),(547,'submissionId','16','int'),(547,'username','mpower','string'),(548,'fileId','68','int'),(548,'fileStage','2','int'),(548,'name','conclusion.pdf','string'),(548,'originalFileName','conclusion.pdf','string'),(548,'sourceSubmissionFileId',NULL,'string'),(548,'submissionFileId','123','int'),(548,'submissionId','16','int'),(548,'username','mpower','string'),(549,'fileId','69','int'),(549,'fileStage','2','int'),(549,'originalFileName','bibliography.pdf','string'),(549,'sourceSubmissionFileId',NULL,'string'),(549,'submissionFileId','124','int'),(549,'submissionId','16','int'),(549,'username','mpower','string'),(550,'fileId','69','int'),(550,'fileStage','2','int'),(550,'name','bibliography.pdf','string'),(550,'submissionFileId','124','int'),(550,'submissionId','16','int'),(550,'username','mpower','string'),(551,'fileId','69','int'),(551,'fileStage','2','int'),(551,'originalFileName','bibliography.pdf','string'),(551,'sourceSubmissionFileId',NULL,'string'),(551,'submissionFileId','124','int'),(551,'submissionId','16','int'),(551,'username','mpower','string'),(552,'fileId','69','int'),(552,'fileStage','2','int'),(552,'name','bibliography.pdf','string'),(552,'originalFileName','bibliography.pdf','string'),(552,'sourceSubmissionFileId',NULL,'string'),(552,'submissionFileId','124','int'),(552,'submissionId','16','int'),(552,'username','mpower','string'),(554,'decision','18','int'),(554,'editorId','3','int'),(554,'editorName','Daniel Barnes','string'),(554,'submissionId','16','int'),(555,'fileId','68','int'),(555,'fileStage','4','int'),(555,'originalFileName','conclusion.pdf','string'),(555,'sourceSubmissionFileId','123','int'),(555,'submissionFileId','125','int'),(555,'submissionId','16','int'),(555,'username','dbarnes','string'),(556,'fileId','68','int'),(556,'fileStage','4','int'),(556,'name','conclusion.pdf','string'),(556,'submissionFileId','125','int'),(556,'submissionId','16','int'),(556,'username','dbarnes','string'),(557,'fileId','69','int'),(557,'fileStage','4','int'),(557,'originalFileName','bibliography.pdf','string'),(557,'sourceSubmissionFileId','124','int'),(557,'submissionFileId','126','int'),(557,'submissionId','16','int'),(557,'username','dbarnes','string'),(558,'fileId','69','int'),(558,'fileStage','4','int'),(558,'name','bibliography.pdf','string'),(558,'submissionFileId','126','int'),(558,'submissionId','16','int'),(558,'username','dbarnes','string'),(559,'fileId','67','int'),(559,'fileStage','4','int'),(559,'originalFileName','cases.pdf','string'),(559,'sourceSubmissionFileId','122','int'),(559,'submissionFileId','127','int'),(559,'submissionId','16','int'),(559,'username','dbarnes','string'),(560,'fileId','67','int'),(560,'fileStage','4','int'),(560,'name','cases.pdf','string'),(560,'submissionFileId','127','int'),(560,'submissionId','16','int'),(560,'username','dbarnes','string'),(561,'fileId','66','int'),(561,'fileStage','4','int'),(561,'originalFileName','preface.pdf','string'),(561,'sourceSubmissionFileId','121','int'),(561,'submissionFileId','128','int'),(561,'submissionId','16','int'),(561,'username','dbarnes','string'),(562,'fileId','66','int'),(562,'fileStage','4','int'),(562,'name','preface.pdf','string'),(562,'submissionFileId','128','int'),(562,'submissionId','16','int'),(562,'username','dbarnes','string'),(563,'fileId','65','int'),(563,'fileStage','4','int'),(563,'originalFileName','foreward.pdf','string'),(563,'sourceSubmissionFileId','120','int'),(563,'submissionFileId','129','int'),(563,'submissionId','16','int'),(563,'username','dbarnes','string'),(564,'fileId','65','int'),(564,'fileStage','4','int'),(564,'name','foreward.pdf','string'),(564,'submissionFileId','129','int'),(564,'submissionId','16','int'),(564,'username','dbarnes','string'),(565,'reviewAssignmentId','21','int'),(565,'reviewerName','Adela Gallego','string'),(565,'round','1','int'),(565,'stageId','3','int'),(565,'submissionId','16','int'),(566,'reviewAssignmentId','22','int'),(566,'reviewerName','Al Zacharia','string'),(566,'round','1','int'),(566,'stageId','3','int'),(566,'submissionId','16','int'),(567,'reviewAssignmentId','23','int'),(567,'reviewerName','Gonzalo Favio','string'),(567,'round','1','int'),(567,'stageId','3','int'),(567,'submissionId','16','int'),(568,'reviewAssignmentId','21','int'),(568,'reviewerName','Adela Gallego','string'),(568,'round','1','int'),(568,'submissionId','16','int'),(569,'reviewAssignmentId','21','int'),(569,'reviewerName','Adela Gallego','string'),(569,'round','1','int'),(569,'submissionId','16','int'),(572,'fileId','70','int'),(572,'fileStage','2','int'),(572,'originalFileName','preface.pdf','string'),(572,'sourceSubmissionFileId',NULL,'string'),(572,'submissionFileId','130','int'),(572,'submissionId','17','int'),(572,'username','msmith','string'),(573,'fileId','70','int'),(573,'fileStage','2','int'),(573,'name','preface.pdf','string'),(573,'submissionFileId','130','int'),(573,'submissionId','17','int'),(573,'username','msmith','string'),(574,'fileId','70','int'),(574,'fileStage','2','int'),(574,'originalFileName','preface.pdf','string'),(574,'sourceSubmissionFileId',NULL,'string'),(574,'submissionFileId','130','int'),(574,'submissionId','17','int'),(574,'username','msmith','string'),(575,'fileId','70','int'),(575,'fileStage','2','int'),(575,'name','preface.pdf','string'),(575,'originalFileName','preface.pdf','string'),(575,'sourceSubmissionFileId',NULL,'string'),(575,'submissionFileId','130','int'),(575,'submissionId','17','int'),(575,'username','msmith','string'),(576,'fileId','71','int'),(576,'fileStage','2','int'),(576,'originalFileName','introduction.pdf','string'),(576,'sourceSubmissionFileId',NULL,'string'),(576,'submissionFileId','131','int'),(576,'submissionId','17','int'),(576,'username','msmith','string'),(577,'fileId','71','int'),(577,'fileStage','2','int'),(577,'name','introduction.pdf','string'),(577,'submissionFileId','131','int'),(577,'submissionId','17','int'),(577,'username','msmith','string'),(578,'fileId','71','int'),(578,'fileStage','2','int'),(578,'originalFileName','introduction.pdf','string'),(578,'sourceSubmissionFileId',NULL,'string'),(578,'submissionFileId','131','int'),(578,'submissionId','17','int'),(578,'username','msmith','string'),(579,'fileId','71','int'),(579,'fileStage','2','int'),(579,'name','introduction.pdf','string'),(579,'originalFileName','introduction.pdf','string'),(579,'sourceSubmissionFileId',NULL,'string'),(579,'submissionFileId','131','int'),(579,'submissionId','17','int'),(579,'username','msmith','string'),(580,'fileId','72','int'),(580,'fileStage','2','int'),(580,'originalFileName','chapter1.pdf','string'),(580,'sourceSubmissionFileId',NULL,'string'),(580,'submissionFileId','132','int'),(580,'submissionId','17','int'),(580,'username','msmith','string'),(581,'fileId','72','int'),(581,'fileStage','2','int'),(581,'name','chapter1.pdf','string'),(581,'submissionFileId','132','int'),(581,'submissionId','17','int'),(581,'username','msmith','string'),(582,'fileId','72','int'),(582,'fileStage','2','int'),(582,'originalFileName','chapter1.pdf','string'),(582,'sourceSubmissionFileId',NULL,'string'),(582,'submissionFileId','132','int'),(582,'submissionId','17','int'),(582,'username','msmith','string'),(583,'fileId','72','int'),(583,'fileStage','2','int'),(583,'name','chapter1.pdf','string'),(583,'originalFileName','chapter1.pdf','string'),(583,'sourceSubmissionFileId',NULL,'string'),(583,'submissionFileId','132','int'),(583,'submissionId','17','int'),(583,'username','msmith','string'),(584,'fileId','73','int'),(584,'fileStage','2','int'),(584,'originalFileName','chapter2.pdf','string'),(584,'sourceSubmissionFileId',NULL,'string'),(584,'submissionFileId','133','int'),(584,'submissionId','17','int'),(584,'username','msmith','string'),(585,'fileId','73','int'),(585,'fileStage','2','int'),(585,'name','chapter2.pdf','string'),(585,'submissionFileId','133','int'),(585,'submissionId','17','int'),(585,'username','msmith','string'),(586,'fileId','73','int'),(586,'fileStage','2','int'),(586,'originalFileName','chapter2.pdf','string'),(586,'sourceSubmissionFileId',NULL,'string'),(586,'submissionFileId','133','int'),(586,'submissionId','17','int'),(586,'username','msmith','string'),(587,'fileId','73','int'),(587,'fileStage','2','int'),(587,'name','chapter2.pdf','string'),(587,'originalFileName','chapter2.pdf','string'),(587,'sourceSubmissionFileId',NULL,'string'),(587,'submissionFileId','133','int'),(587,'submissionId','17','int'),(587,'username','msmith','string'),(588,'fileId','74','int'),(588,'fileStage','2','int'),(588,'originalFileName','chapter3.pdf','string'),(588,'sourceSubmissionFileId',NULL,'string'),(588,'submissionFileId','134','int'),(588,'submissionId','17','int'),(588,'username','msmith','string'),(589,'fileId','74','int'),(589,'fileStage','2','int'),(589,'name','chapter3.pdf','string'),(589,'submissionFileId','134','int'),(589,'submissionId','17','int'),(589,'username','msmith','string'),(590,'fileId','74','int'),(590,'fileStage','2','int'),(590,'originalFileName','chapter3.pdf','string'),(590,'sourceSubmissionFileId',NULL,'string'),(590,'submissionFileId','134','int'),(590,'submissionId','17','int'),(590,'username','msmith','string'),(591,'fileId','74','int'),(591,'fileStage','2','int'),(591,'name','chapter3.pdf','string'),(591,'originalFileName','chapter3.pdf','string'),(591,'sourceSubmissionFileId',NULL,'string'),(591,'submissionFileId','134','int'),(591,'submissionId','17','int'),(591,'username','msmith','string'),(592,'fileId','75','int'),(592,'fileStage','2','int'),(592,'originalFileName','chapter4.pdf','string'),(592,'sourceSubmissionFileId',NULL,'string'),(592,'submissionFileId','135','int'),(592,'submissionId','17','int'),(592,'username','msmith','string'),(593,'fileId','75','int'),(593,'fileStage','2','int'),(593,'name','chapter4.pdf','string'),(593,'submissionFileId','135','int'),(593,'submissionId','17','int'),(593,'username','msmith','string'),(594,'fileId','75','int'),(594,'fileStage','2','int'),(594,'originalFileName','chapter4.pdf','string'),(594,'sourceSubmissionFileId',NULL,'string'),(594,'submissionFileId','135','int'),(594,'submissionId','17','int'),(594,'username','msmith','string'),(595,'fileId','75','int'),(595,'fileStage','2','int'),(595,'name','chapter4.pdf','string'),(595,'originalFileName','chapter4.pdf','string'),(595,'sourceSubmissionFileId',NULL,'string'),(595,'submissionFileId','135','int'),(595,'submissionId','17','int'),(595,'username','msmith','string'),(597,'decision','1','int'),(597,'editorId','3','int'),(597,'editorName','Daniel Barnes','string'),(597,'submissionId','17','int'),(598,'fileId','75','int'),(598,'fileStage','19','int'),(598,'originalFileName','chapter4.pdf','string'),(598,'sourceSubmissionFileId','135','int'),(598,'submissionFileId','136','int'),(598,'submissionId','17','int'),(598,'username','dbarnes','string'),(599,'fileId','75','int'),(599,'fileStage','19','int'),(599,'name','chapter4.pdf','string'),(599,'submissionFileId','136','int'),(599,'submissionId','17','int'),(599,'username','dbarnes','string'),(600,'fileId','73','int'),(600,'fileStage','19','int'),(600,'originalFileName','chapter2.pdf','string'),(600,'sourceSubmissionFileId','133','int'),(600,'submissionFileId','137','int'),(600,'submissionId','17','int'),(600,'username','dbarnes','string'),(601,'fileId','73','int'),(601,'fileStage','19','int'),(601,'name','chapter2.pdf','string'),(601,'submissionFileId','137','int'),(601,'submissionId','17','int'),(601,'username','dbarnes','string'),(602,'fileId','72','int'),(602,'fileStage','19','int'),(602,'originalFileName','chapter1.pdf','string'),(602,'sourceSubmissionFileId','132','int'),(602,'submissionFileId','138','int'),(602,'submissionId','17','int'),(602,'username','dbarnes','string'),(603,'fileId','72','int'),(603,'fileStage','19','int'),(603,'name','chapter1.pdf','string'),(603,'submissionFileId','138','int'),(603,'submissionId','17','int'),(603,'username','dbarnes','string'),(604,'fileId','70','int'),(604,'fileStage','19','int'),(604,'originalFileName','preface.pdf','string'),(604,'sourceSubmissionFileId','130','int'),(604,'submissionFileId','139','int'),(604,'submissionId','17','int'),(604,'username','dbarnes','string'),(605,'fileId','70','int'),(605,'fileStage','19','int'),(605,'name','preface.pdf','string'),(605,'submissionFileId','139','int'),(605,'submissionId','17','int'),(605,'username','dbarnes','string'),(606,'fileId','74','int'),(606,'fileStage','19','int'),(606,'originalFileName','chapter3.pdf','string'),(606,'sourceSubmissionFileId','134','int'),(606,'submissionFileId','140','int'),(606,'submissionId','17','int'),(606,'username','dbarnes','string'),(607,'fileId','74','int'),(607,'fileStage','19','int'),(607,'name','chapter3.pdf','string'),(607,'submissionFileId','140','int'),(607,'submissionId','17','int'),(607,'username','dbarnes','string'),(608,'fileId','71','int'),(608,'fileStage','19','int'),(608,'originalFileName','introduction.pdf','string'),(608,'sourceSubmissionFileId','131','int'),(608,'submissionFileId','141','int'),(608,'submissionId','17','int'),(608,'username','dbarnes','string'),(609,'fileId','71','int'),(609,'fileStage','19','int'),(609,'name','introduction.pdf','string'),(609,'submissionFileId','141','int'),(609,'submissionId','17','int'),(609,'username','dbarnes','string'),(610,'reviewAssignmentId','24','int'),(610,'reviewerName','Julie Janssen','string'),(610,'round','1','int'),(610,'stageId','2','int'),(610,'submissionId','17','int'),(611,'reviewAssignmentId','25','int'),(611,'reviewerName','Paul Hudson','string'),(611,'round','1','int'),(611,'stageId','2','int'),(611,'submissionId','17','int');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `submission_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `seq` bigint(20) NOT NULL,
  UNIQUE KEY `press_features_pkey` (`assoc_type`,`assoc_id`,`submission_id`),
  KEY `features_submission_id` (`submission_id`),
  CONSTRAINT `features_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'presses/1/monographs/1/63bca23aee47b.pdf','application/pdf'),(2,'presses/1/monographs/1/63bca23c27e80.pdf','application/pdf'),(3,'presses/1/monographs/1/63bca23d5c28e.pdf','application/pdf'),(4,'presses/1/monographs/2/63bca2886bbdc.pdf','application/pdf'),(5,'presses/1/monographs/2/63bca289a6428.pdf','application/pdf'),(6,'presses/1/monographs/2/63bca28ad4ab1.pdf','application/pdf'),(7,'presses/1/monographs/2/63bca28c20772.pdf','application/pdf'),(8,'presses/1/monographs/2/63bca28d5e357.pdf','application/pdf'),(9,'presses/1/monographs/3/63bca33dea615.pdf','application/pdf'),(10,'presses/1/monographs/3/63bca33f2a8bc.pdf','application/pdf'),(11,'presses/1/monographs/3/63bca3405a501.pdf','application/pdf'),(12,'presses/1/monographs/3/63bca3418fd8a.pdf','application/pdf'),(13,'presses/1/monographs/3/63bca342c9799.pdf','application/pdf'),(14,'presses/1/monographs/4/63bca3772e2dd.pdf','application/pdf'),(15,'presses/1/monographs/4/63bca3786012a.pdf','application/pdf'),(16,'presses/1/monographs/4/63bca37996972.pdf','application/pdf'),(17,'presses/1/monographs/4/63bca37acbf98.pdf','application/pdf'),(18,'presses/1/monographs/5/63bca3fe70c11.pdf','application/pdf'),(19,'presses/1/monographs/5/63bca3ff9e6c8.pdf','application/pdf'),(20,'presses/1/monographs/5/63bca400cefc2.pdf','application/pdf'),(21,'presses/1/monographs/5/63bca402049e5.pdf','application/pdf'),(22,'presses/1/monographs/5/63bca40337052.pdf','application/pdf'),(23,'presses/1/monographs/5/63bca4048b694.pdf','application/pdf'),(24,'presses/1/monographs/6/63bca4cc6576a.pdf','application/pdf'),(25,'presses/1/monographs/6/63bca4cd98437.pdf','application/pdf'),(26,'presses/1/monographs/6/63bca4ced5b35.pdf','application/pdf'),(27,'presses/1/monographs/6/63bca4d015279.pdf','application/pdf'),(28,'presses/1/monographs/7/63bca53f2ee6f.pdf','application/pdf'),(29,'presses/1/monographs/7/63bca540588d3.pdf','application/pdf'),(30,'presses/1/monographs/7/63bca5418c59d.pdf','application/pdf'),(31,'presses/1/monographs/7/63bca542c26cd.pdf','application/pdf'),(32,'presses/1/monographs/7/63bca54420467.pdf','application/pdf'),(33,'presses/1/monographs/8/63bca5aa9b92a.pdf','application/pdf'),(34,'presses/1/monographs/9/63bca5b89fab2.pdf','application/pdf'),(35,'presses/1/monographs/9/63bca5b9d8e85.pdf','application/pdf'),(36,'presses/1/monographs/9/63bca5bb36157.pdf','application/pdf'),(37,'presses/1/monographs/9/63bca5bc66661.pdf','application/pdf'),(38,'presses/1/monographs/9/63bca5bd95b8e.pdf','application/pdf'),(39,'presses/1/monographs/10/63bca60ab4d8b.pdf','application/pdf'),(40,'presses/1/monographs/10/63bca60be3696.pdf','application/pdf'),(41,'presses/1/monographs/10/63bca60d2cf1d.pdf','application/pdf'),(42,'presses/1/monographs/10/63bca60e62dc0.pdf','application/pdf'),(43,'presses/1/monographs/10/63bca60f9a071.pdf','application/pdf'),(44,'presses/1/monographs/10/63bca61103605.pdf','application/pdf'),(45,'presses/1/monographs/10/63bca6125e6c7.pdf','application/pdf'),(46,'presses/1/monographs/10/63bca613b5974.pdf','application/pdf'),(47,'presses/1/monographs/10/63bca6151ad2c.pdf','application/pdf'),(48,'presses/1/monographs/11/63bca671b51c3.pdf','application/pdf'),(49,'presses/1/monographs/11/63bca672de594.pdf','application/pdf'),(50,'presses/1/monographs/12/63bca6ed21517.pdf','application/pdf'),(51,'presses/1/monographs/12/63bca6ee5048c.pdf','application/pdf'),(52,'presses/1/monographs/12/63bca6ef87b35.pdf','application/pdf'),(53,'presses/1/monographs/13/63bca74c14cf8.pdf','application/pdf'),(54,'presses/1/monographs/13/63bca74d45017.pdf','application/pdf'),(55,'presses/1/monographs/13/63bca74e7602f.pdf','application/pdf'),(56,'presses/1/monographs/14/63bca7e1e76f2.pdf','application/pdf'),(57,'presses/1/monographs/14/63bca7e3286a5.pdf','application/pdf'),(58,'presses/1/monographs/14/63bca7e456037.pdf','application/pdf'),(59,'presses/1/monographs/14/63bca7e58808e.pdf','application/pdf'),(60,'presses/1/monographs/14/63bca7e6dfe19.pdf','application/pdf'),(61,'presses/1/monographs/14/63bca7e831cea.pdf','application/pdf'),(62,'presses/1/monographs/15/63bca8ac39d7f.pdf','application/pdf'),(63,'presses/1/monographs/15/63bca8ad6476f.pdf','application/pdf'),(64,'presses/1/monographs/15/63bca8ae8eebd.pdf','application/pdf'),(65,'presses/1/monographs/16/63bca8e659ef1.pdf','application/pdf'),(66,'presses/1/monographs/16/63bca8e783821.pdf','application/pdf'),(67,'presses/1/monographs/16/63bca8e8bac26.pdf','application/pdf'),(68,'presses/1/monographs/16/63bca8e9f1df0.pdf','application/pdf'),(69,'presses/1/monographs/16/63bca8eb39eb7.pdf','application/pdf'),(70,'presses/1/monographs/17/63bca95c43032.pdf','application/pdf'),(71,'presses/1/monographs/17/63bca95d7c8af.pdf','application/pdf'),(72,'presses/1/monographs/17/63bca95eab392.pdf','application/pdf'),(73,'presses/1/monographs/17/63bca95fdc217.pdf','application/pdf'),(74,'presses/1/monographs/17/63bca96122529.pdf','application/pdf'),(75,'presses/1/monographs/17/63bca9627c06f.pdf','application/pdf');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
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
  `filter_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `filter_settings_pkey` (`filter_id`,`locale`,`setting_name`),
  KEY `filter_settings_id` (`filter_id`),
  CONSTRAINT `filter_settings_filter_id_foreign` FOREIGN KEY (`filter_id`) REFERENCES `filters` (`filter_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,1,0,'Extract metadata from a(n) PublicationFormat','APP\\plugins\\metadata\\dc11\\filter\\Dc11SchemaPublicationFormatAdapter',0,0,0),(2,2,0,'User XML user export','PKP\\plugins\\importexport\\users\\filter\\PKPUserUserXmlFilter',0,0,0),(3,3,0,'User XML user import','PKP\\plugins\\importexport\\users\\filter\\UserXmlPKPUserFilter',0,0,0),(4,4,0,'Native XML user group export','PKP\\plugins\\importexport\\users\\filter\\UserGroupNativeXmlFilter',0,0,0),(5,5,0,'Native XML user group import','PKP\\plugins\\importexport\\users\\filter\\NativeXmlUserGroupFilter',0,0,0),(6,6,0,'ONIX 3.0 XML monograph export','plugins.importexport.onix30.filter.MonographONIX30XmlFilter',0,0,0),(7,7,0,'Native XML submission export','APP\\plugins\\importexport\\native\\filter\\MonographNativeXmlFilter',0,0,0),(8,8,0,'Native XML submission import','APP\\plugins\\importexport\\native\\filter\\NativeXmlMonographFilter',0,0,0),(9,9,0,'Native XML author export','APP\\plugins\\importexport\\native\\filter\\AuthorNativeXmlFilter',0,0,0),(10,10,0,'Native XML author import','APP\\plugins\\importexport\\native\\filter\\NativeXmlAuthorFilter',0,0,0),(11,11,0,'Native XML representation export','APP\\plugins\\importexport\\native\\filter\\PublicationFormatNativeXmlFilter',0,0,0),(12,12,0,'Native XML representation import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPublicationFormatFilter',0,0,0),(13,14,0,'Native XML submission file import','APP\\plugins\\importexport\\native\\filter\\NativeXmlMonographFileFilter',0,0,0),(14,13,0,'Native XML submission file export','PKP\\plugins\\importexport\\native\\filter\\SubmissionFileNativeXmlFilter',0,0,0),(15,15,0,'ONIX 3.0 XML monograph export','plugins.importexport.onix30.filter.MonographONIX30XmlFilter',0,0,0),(16,16,0,'Native XML Publication export','APP\\plugins\\importexport\\native\\filter\\PublicationNativeXmlFilter',0,0,0),(17,17,0,'Native XML publication import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPublicationFilter',0,0,0),(18,18,0,'Native XML chapter export','APP\\plugins\\importexport\\native\\filter\\ChapterNativeXmlFilter',0,0,0),(19,19,0,'Native XML Chapter import','APP\\plugins\\importexport\\native\\filter\\NativeXmlChapterFilter',0,0,0);
/*!40000 ALTER TABLE `filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_settings`
--

DROP TABLE IF EXISTS `genre_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre_settings` (
  `genre_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `genre_settings_pkey` (`genre_id`,`locale`,`setting_name`),
  KEY `genre_settings_genre_id` (`genre_id`),
  CONSTRAINT `genre_settings_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_settings`
--

LOCK TABLES `genre_settings` WRITE;
/*!40000 ALTER TABLE `genre_settings` DISABLE KEYS */;
INSERT INTO `genre_settings` VALUES (1,'en_US','name','Appendix','string'),(1,'fr_CA','name','Annexe','string'),(2,'en_US','name','Bibliography','string'),(2,'fr_CA','name','Bibliographie','string'),(3,'en_US','name','Book Manuscript','string'),(3,'fr_CA','name','Manuscrit de livre','string'),(4,'en_US','name','Chapter Manuscript','string'),(4,'fr_CA','name','Manuscrit de chapitre','string'),(5,'en_US','name','Glossary','string'),(5,'fr_CA','name','Glossaire','string'),(6,'en_US','name','Index','string'),(6,'fr_CA','name','Index','string'),(7,'en_US','name','Preface','string'),(7,'fr_CA','name','Préface','string'),(8,'en_US','name','Prospectus','string'),(8,'fr_CA','name','Prospectus','string'),(9,'en_US','name','Table','string'),(9,'fr_CA','name','Tableau','string'),(10,'en_US','name','Figure','string'),(10,'fr_CA','name','Figure','string'),(11,'en_US','name','Photo','string'),(11,'fr_CA','name','Photographie','string'),(12,'en_US','name','Illustration','string'),(12,'fr_CA','name','Illustration','string'),(13,'en_US','name','Other','string'),(13,'fr_CA','name','Autre','string'),(14,'en_US','name','Image','string'),(14,'fr_CA','name','Image','string'),(15,'en_US','name','HTML Stylesheet','string'),(15,'fr_CA','name','Feuille de style HTML','string');
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
  `entry_key` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`genre_id`),
  KEY `genres_context_id` (`context_id`),
  CONSTRAINT `genres_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,1,0,1,1,0,1,'APPENDIX'),(2,1,1,1,1,0,1,'BIBLIOGRAPHY'),(3,1,2,1,1,0,0,'MANUSCRIPT'),(4,1,3,1,1,0,0,'CHAPTER'),(5,1,4,1,1,0,1,'GLOSSARY'),(6,1,5,1,1,0,1,'INDEX'),(7,1,6,1,1,0,1,'PREFACE'),(8,1,7,1,3,0,1,'PROSPECTUS'),(9,1,8,1,2,0,1,'TABLE'),(10,1,9,1,2,0,1,'FIGURE'),(11,1,10,1,2,0,1,'PHOTO'),(12,1,11,1,2,0,1,'ILLUSTRATION'),(13,1,15,1,3,0,1,'OTHER'),(14,1,13,1,2,1,0,'IMAGE'),(15,1,14,1,1,1,0,'STYLE');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `institution_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  UNIQUE KEY `institution_settings_pkey` (`institution_id`,`locale`,`setting_name`),
  KEY `institution_settings_institution_id` (`institution_id`),
  CONSTRAINT `institution_settings_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `ror` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`institution_id`),
  KEY `institutions_context_id` (`context_id`),
  CONSTRAINT `institutions_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutions`
--

LOCK TABLES `institutions` WRITE;
/*!40000 ALTER TABLE `institutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_views`
--

DROP TABLE IF EXISTS `item_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_views` (
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_last_viewed` datetime DEFAULT NULL,
  UNIQUE KEY `item_views_pkey` (`assoc_type`,`assoc_id`,`user_id`),
  KEY `item_views_user_id` (`user_id`),
  CONSTRAINT `item_views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_views`
--

LOCK TABLES `item_views` WRITE;
/*!40000 ALTER TABLE `item_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_views` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
INSERT INTO `job_batches` VALUES ('982fb318-f817-4c98-902a-77e7debb0a19','',0,0,0,'[]','a:0:{}',NULL,1673306356,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
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
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)',
  UNIQUE KEY `library_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  KEY `library_file_settings_file_id` (`file_id`),
  CONSTRAINT `library_file_settings_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `library_files` (`file_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `submission_id` bigint(20) NOT NULL,
  `public_access` smallint(6) DEFAULT '0',
  PRIMARY KEY (`file_id`),
  KEY `library_files_context_id` (`context_id`),
  KEY `library_files_submission_id` (`submission_id`),
  CONSTRAINT `library_files_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `library_files_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `metric` int(11) NOT NULL,
  KEY `metrics_context_load_id` (`load_id`),
  KEY `metrics_context_context_id` (`context_id`),
  CONSTRAINT `metrics_context_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `msd_uc_load_id_context_id_submission_id_date` (`load_id`,`context_id`,`submission_id`,`date`),
  KEY `msd_load_id` (`load_id`),
  KEY `metrics_counter_submission_daily_context_id` (`context_id`),
  KEY `metrics_counter_submission_daily_submission_id` (`submission_id`),
  KEY `msd_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msd_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msd_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `msid_uc_load_id_context_id_submission_id_institution_id_date` (`load_id`,`context_id`,`submission_id`,`institution_id`,`date`),
  KEY `msid_load_id` (`load_id`),
  KEY `msid_context_id` (`context_id`),
  KEY `msid_submission_id` (`submission_id`),
  KEY `msid_institution_id` (`institution_id`),
  KEY `msid_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msid_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msid_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE,
  CONSTRAINT `msid_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `msim_uc_context_id_submission_id_institution_id_month` (`context_id`,`submission_id`,`institution_id`,`month`),
  KEY `msim_context_id` (`context_id`),
  KEY `msim_submission_id` (`submission_id`),
  KEY `msim_institution_id` (`institution_id`),
  KEY `msim_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msim_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msim_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE,
  CONSTRAINT `msim_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `msm_uc_context_id_submission_id_month` (`context_id`,`submission_id`,`month`),
  KEY `metrics_counter_submission_monthly_context_id` (`context_id`),
  KEY `metrics_counter_submission_monthly_submission_id` (`submission_id`),
  KEY `msm_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msm_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msm_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `series_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `metric` int(11) NOT NULL,
  KEY `metrics_series_load_id` (`load_id`),
  KEY `metrics_series_context_id` (`context_id`),
  KEY `metrics_series_series_id` (`series_id`),
  KEY `metrics_series_context_id_series_id` (`context_id`,`series_id`),
  CONSTRAINT `metrics_series_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_series_series_id_foreign` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `date` date NOT NULL,
  `metric` int(11) NOT NULL,
  `metric_unique` int(11) NOT NULL,
  UNIQUE KEY `msgd_uc_load_context_submission_c_r_c_date` (`load_id`,`context_id`,`submission_id`,`country`,`region`,`city`,`date`),
  KEY `msgd_load_id` (`load_id`),
  KEY `metrics_submission_geo_daily_context_id` (`context_id`),
  KEY `metrics_submission_geo_daily_submission_id` (`submission_id`),
  KEY `msgd_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msgd_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msgd_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `context_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `month` int(11) NOT NULL,
  `metric` int(11) NOT NULL,
  `metric_unique` int(11) NOT NULL,
  UNIQUE KEY `msgm_uc_context_submission_c_r_c_month` (`context_id`,`submission_id`,`country`,`region`,`city`,`month`),
  KEY `metrics_submission_geo_monthly_context_id` (`context_id`),
  KEY `metrics_submission_geo_monthly_submission_id` (`submission_id`),
  KEY `msgm_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msgm_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msgm_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `navigation_menu_item_assignment_settings_pkey` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_assignment_settings_n_m_i_a_id` (`navigation_menu_item_assignment_id`),
  CONSTRAINT `assignment_settings_navigation_menu_item_assignment_id` FOREIGN KEY (`navigation_menu_item_assignment_id`) REFERENCES `navigation_menu_item_assignments` (`navigation_menu_item_assignment_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
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
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `navigation_menu_item_settings_pkey` (`navigation_menu_item_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_settings_navigation_menu_item_id` (`navigation_menu_item_id`),
  CONSTRAINT `navigation_menu_item_settings_navigation_menu_id` FOREIGN KEY (`navigation_menu_item_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_settings`
--

LOCK TABLES `navigation_menu_item_settings` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_settings` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_settings` VALUES (1,'','titleLocaleKey','navigation.register','string'),(2,'','titleLocaleKey','navigation.login','string'),(3,'','titleLocaleKey','{$loggedInUsername}','string'),(4,'','titleLocaleKey','navigation.dashboard','string'),(5,'','titleLocaleKey','common.viewProfile','string'),(6,'','titleLocaleKey','navigation.admin','string'),(7,'','titleLocaleKey','user.logOut','string'),(8,'','titleLocaleKey','navigation.register','string'),(9,'','titleLocaleKey','navigation.login','string'),(10,'','titleLocaleKey','{$loggedInUsername}','string'),(11,'','titleLocaleKey','navigation.dashboard','string'),(12,'','titleLocaleKey','common.viewProfile','string'),(13,'','titleLocaleKey','navigation.admin','string'),(14,'','titleLocaleKey','user.logOut','string'),(15,'','titleLocaleKey','navigation.catalog','string'),(16,'','titleLocaleKey','manager.announcements','string'),(17,'','titleLocaleKey','navigation.about','string'),(18,'','titleLocaleKey','about.aboutContext','string'),(19,'','titleLocaleKey','about.submissions','string'),(20,'','titleLocaleKey','about.editorialTeam','string'),(21,'','titleLocaleKey','manager.setup.privacyStatement','string'),(22,'','titleLocaleKey','about.contact','string'),(23,'','titleLocaleKey','common.search','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
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
  `submission_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  UNIQUE KEY `new_releases_pkey` (`assoc_type`,`assoc_id`,`submission_id`),
  KEY `new_releases_submission_id` (`submission_id`),
  CONSTRAINT `new_releases_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,1048586,1,6,'2023-01-09 23:37:07','2023-01-09 23:37:07','Editor Recommendation','<p>Dear Daniel Barnes, David Buskins,</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission The Information Literacy User’s Guide.</p><p>My recommendation is:<br />Accept Submission.</p><p>Please visit the submission\'s <a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>Minoti Inoue</p>');
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_settings`
--

DROP TABLE IF EXISTS `notification_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_settings` (
  `notification_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` mediumtext NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `notification_settings_pkey` (`notification_id`,`locale`,`setting_name`),
  KEY `notification_settings_notification_id` (`notification_id`),
  CONSTRAINT `notification_settings_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
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
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `level` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  KEY `notifications_context_id` (`context_id`,`level`),
  KEY `notifications_assoc` (`assoc_type`,`assoc_id`),
  KEY `notifications_user_id_level` (`user_id`,`level`)
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (14,1,0,3,16777220,'2023-01-09 23:25:05',NULL,1048585,1),(15,1,0,3,16777222,'2023-01-09 23:25:05',NULL,1048585,1),(16,1,0,3,16777223,'2023-01-09 23:25:05',NULL,1048585,1),(17,1,0,3,16777224,'2023-01-09 23:25:05',NULL,1048585,1),(18,1,1,3,16777247,'2023-01-09 23:25:05',NULL,1048585,1),(19,1,2,3,16777247,'2023-01-09 23:25:05',NULL,1048585,1),(20,1,3,3,16777247,'2023-01-09 23:25:05',NULL,1048585,1),(21,1,0,2,16777236,'2023-01-09 23:25:18','2023-01-09 23:25:23',523,1),(22,1,12,3,16777227,'2023-01-09 23:25:29',NULL,517,1),(24,1,19,2,16777230,'2023-01-09 23:25:35',NULL,1048585,1),(34,1,0,3,16777220,'2023-01-09 23:27:53',NULL,1048585,2),(35,1,0,3,16777222,'2023-01-09 23:27:53',NULL,1048585,2),(36,1,0,3,16777223,'2023-01-09 23:27:53',NULL,1048585,2),(37,1,0,3,16777224,'2023-01-09 23:27:53',NULL,1048585,2),(38,1,1,3,16777247,'2023-01-09 23:27:53',NULL,1048585,2),(39,1,2,3,16777247,'2023-01-09 23:27:53',NULL,1048585,2),(40,1,3,3,16777247,'2023-01-09 23:27:53',NULL,1048585,2),(41,1,0,2,16777236,'2023-01-09 23:28:20','2023-01-09 23:28:29',523,2),(42,1,11,3,16777227,'2023-01-09 23:28:35',NULL,517,2),(44,1,12,3,16777227,'2023-01-09 23:28:46',NULL,517,3),(56,1,0,3,16777220,'2023-01-09 23:29:44',NULL,1048585,3),(57,1,0,3,16777222,'2023-01-09 23:29:44',NULL,1048585,3),(58,1,0,3,16777223,'2023-01-09 23:29:44',NULL,1048585,3),(59,1,0,3,16777224,'2023-01-09 23:29:44',NULL,1048585,3),(60,1,1,3,16777247,'2023-01-09 23:29:44',NULL,1048585,3),(61,1,2,3,16777247,'2023-01-09 23:29:44',NULL,1048585,3),(62,1,3,3,16777247,'2023-01-09 23:29:44',NULL,1048585,3),(71,1,0,3,16777220,'2023-01-09 23:30:33',NULL,1048585,4),(72,1,0,3,16777222,'2023-01-09 23:30:33',NULL,1048585,4),(73,1,0,3,16777223,'2023-01-09 23:30:33',NULL,1048585,4),(74,1,0,3,16777224,'2023-01-09 23:30:33',NULL,1048585,4),(75,1,1,3,16777247,'2023-01-09 23:30:33',NULL,1048585,4),(76,1,2,3,16777247,'2023-01-09 23:30:33',NULL,1048585,4),(77,1,3,3,16777247,'2023-01-09 23:30:33',NULL,1048585,4),(78,1,0,2,16777236,'2023-01-09 23:30:50','2023-01-09 23:30:55',523,3),(80,1,9,3,16777227,'2023-01-09 23:31:01',NULL,517,4),(82,1,0,2,16777236,'2023-01-09 23:31:07','2023-01-09 23:31:12',523,4),(84,1,11,3,16777227,'2023-01-09 23:31:18',NULL,517,5),(88,1,22,2,16777235,'2023-01-09 23:31:43',NULL,1048585,4),(102,1,0,3,16777220,'2023-01-09 23:33:06',NULL,1048585,5),(103,1,0,3,16777222,'2023-01-09 23:33:06',NULL,1048585,5),(104,1,0,3,16777223,'2023-01-09 23:33:06',NULL,1048585,5),(105,1,0,3,16777224,'2023-01-09 23:33:06',NULL,1048585,5),(106,1,1,3,16777247,'2023-01-09 23:33:06',NULL,1048585,5),(107,1,2,3,16777247,'2023-01-09 23:33:06',NULL,1048585,5),(108,1,3,3,16777247,'2023-01-09 23:33:06',NULL,1048585,5),(109,1,0,2,16777236,'2023-01-09 23:33:24','2023-01-09 23:33:30',523,5),(111,1,8,3,16777227,'2023-01-09 23:33:36',NULL,517,6),(113,1,0,2,16777236,'2023-01-09 23:33:43','2023-01-09 23:33:49',523,6),(115,1,12,3,16777227,'2023-01-09 23:33:55',NULL,517,7),(119,1,23,2,16777235,'2023-01-09 23:34:21',NULL,1048585,5),(122,1,0,2,16777246,'2023-01-09 23:35:04','2023-01-09 23:35:14',1048585,5),(138,1,0,2,16777236,'2023-01-09 23:36:29','2023-01-09 23:36:35',523,7),(139,1,24,2,16777229,'2023-01-09 23:36:29',NULL,1048585,6),(143,1,3,3,16777249,'2023-01-09 23:37:07',NULL,1048586,1),(144,1,4,3,16777249,'2023-01-09 23:37:07',NULL,1048586,1),(155,1,0,3,16777220,'2023-01-09 23:38:20',NULL,1048585,7),(156,1,0,3,16777222,'2023-01-09 23:38:20',NULL,1048585,7),(157,1,0,3,16777223,'2023-01-09 23:38:20',NULL,1048585,7),(158,1,0,3,16777224,'2023-01-09 23:38:20',NULL,1048585,7),(159,1,1,3,16777247,'2023-01-09 23:38:20',NULL,1048585,7),(160,1,2,3,16777247,'2023-01-09 23:38:20',NULL,1048585,7),(161,1,3,3,16777247,'2023-01-09 23:38:20',NULL,1048585,7),(162,1,0,2,16777236,'2023-01-09 23:38:37','2023-01-09 23:38:44',523,8),(163,1,10,3,16777227,'2023-01-09 23:38:49',NULL,517,8),(165,1,25,2,16777230,'2023-01-09 23:38:57',NULL,1048585,7),(167,1,1,3,16777247,'2023-01-09 23:39:24',NULL,1048585,8),(168,1,2,3,16777247,'2023-01-09 23:39:24',NULL,1048585,8),(169,1,3,3,16777247,'2023-01-09 23:39:24',NULL,1048585,8),(180,1,0,3,16777220,'2023-01-09 23:40:21',NULL,1048585,9),(181,1,0,3,16777222,'2023-01-09 23:40:21',NULL,1048585,9),(182,1,0,3,16777223,'2023-01-09 23:40:21',NULL,1048585,9),(183,1,0,3,16777224,'2023-01-09 23:40:21',NULL,1048585,9),(184,1,1,3,16777247,'2023-01-09 23:40:21',NULL,1048585,9),(185,1,2,3,16777247,'2023-01-09 23:40:21',NULL,1048585,9),(186,1,3,3,16777247,'2023-01-09 23:40:21',NULL,1048585,9),(187,1,0,2,16777236,'2023-01-09 23:40:39','2023-01-09 23:40:45',523,9),(188,1,26,2,16777229,'2023-01-09 23:40:39',NULL,1048585,9),(207,1,0,3,16777220,'2023-01-09 23:42:27',NULL,1048585,10),(208,1,0,3,16777222,'2023-01-09 23:42:27',NULL,1048585,10),(209,1,0,3,16777223,'2023-01-09 23:42:27',NULL,1048585,10),(210,1,0,3,16777224,'2023-01-09 23:42:27',NULL,1048585,10),(211,1,1,3,16777247,'2023-01-09 23:42:27',NULL,1048585,10),(212,1,2,3,16777247,'2023-01-09 23:42:27',NULL,1048585,10),(213,1,3,3,16777247,'2023-01-09 23:42:27',NULL,1048585,10),(218,1,0,3,16777220,'2023-01-09 23:42:55',NULL,1048585,11),(219,1,0,3,16777222,'2023-01-09 23:42:55',NULL,1048585,11),(220,1,0,3,16777223,'2023-01-09 23:42:55',NULL,1048585,11),(221,1,0,3,16777224,'2023-01-09 23:42:55',NULL,1048585,11),(222,1,1,3,16777247,'2023-01-09 23:42:55',NULL,1048585,11),(223,1,2,3,16777247,'2023-01-09 23:42:55',NULL,1048585,11),(224,1,3,3,16777247,'2023-01-09 23:42:55',NULL,1048585,11),(225,1,0,2,16777236,'2023-01-09 23:43:11','2023-01-09 23:43:15',523,10),(227,1,9,3,16777227,'2023-01-09 23:43:21',NULL,517,9),(229,1,0,2,16777236,'2023-01-09 23:43:26','2023-01-09 23:43:30',523,11),(235,1,28,2,16777230,'2023-01-09 23:44:27',NULL,1048585,11),(242,1,0,3,16777220,'2023-01-09 23:45:11',NULL,1048585,12),(243,1,0,3,16777222,'2023-01-09 23:45:11',NULL,1048585,12),(244,1,0,3,16777223,'2023-01-09 23:45:11',NULL,1048585,12),(245,1,0,3,16777224,'2023-01-09 23:45:11',NULL,1048585,12),(246,1,1,3,16777247,'2023-01-09 23:45:11',NULL,1048585,12),(247,1,2,3,16777247,'2023-01-09 23:45:11',NULL,1048585,12),(248,1,3,3,16777247,'2023-01-09 23:45:11',NULL,1048585,12),(249,1,0,2,16777236,'2023-01-09 23:45:28','2023-01-09 23:45:33',523,12),(250,1,29,2,16777229,'2023-01-09 23:45:28',NULL,1048585,12),(251,1,7,3,16777227,'2023-01-09 23:45:39',NULL,517,12),(255,1,9,3,16777227,'2023-01-09 23:45:54',NULL,517,14),(263,1,0,3,16777220,'2023-01-09 23:46:44',NULL,1048585,13),(264,1,0,3,16777222,'2023-01-09 23:46:44',NULL,1048585,13),(265,1,0,3,16777223,'2023-01-09 23:46:44',NULL,1048585,13),(266,1,0,3,16777224,'2023-01-09 23:46:44',NULL,1048585,13),(267,1,1,3,16777247,'2023-01-09 23:46:44',NULL,1048585,13),(268,1,2,3,16777247,'2023-01-09 23:46:44',NULL,1048585,13),(269,1,3,3,16777247,'2023-01-09 23:46:44',NULL,1048585,13),(270,1,0,2,16777236,'2023-01-09 23:47:01','2023-01-09 23:47:06',523,13),(272,1,8,3,16777227,'2023-01-09 23:47:12',NULL,517,15),(274,1,0,2,16777236,'2023-01-09 23:47:18','2023-01-09 23:47:22',523,14),(278,1,11,3,16777227,'2023-01-09 23:47:35',NULL,517,17),(282,1,30,2,16777230,'2023-01-09 23:48:31',NULL,1048585,13),(291,1,0,3,16777220,'2023-01-09 23:49:28',NULL,1048585,14),(292,1,0,3,16777222,'2023-01-09 23:49:28',NULL,1048585,14),(293,1,0,3,16777223,'2023-01-09 23:49:28',NULL,1048585,14),(294,1,0,3,16777224,'2023-01-09 23:49:28',NULL,1048585,14),(295,1,1,3,16777247,'2023-01-09 23:49:28',NULL,1048585,14),(296,1,2,3,16777247,'2023-01-09 23:49:28',NULL,1048585,14),(297,1,3,3,16777247,'2023-01-09 23:49:28',NULL,1048585,14),(298,1,0,2,16777236,'2023-01-09 23:49:47','2023-01-09 23:49:53',523,15),(300,1,7,3,16777227,'2023-01-09 23:49:59',NULL,517,19),(302,1,0,2,16777236,'2023-01-09 23:50:06','2023-01-09 23:50:11',523,16),(304,1,11,3,16777227,'2023-01-09 23:50:16',NULL,517,20),(308,1,31,2,16777235,'2023-01-09 23:50:42',NULL,1048585,14),(311,1,0,2,16777246,'2023-01-09 23:51:58',NULL,1048585,14),(318,1,0,3,16777220,'2023-01-09 23:52:34',NULL,1048585,15),(319,1,0,3,16777222,'2023-01-09 23:52:34',NULL,1048585,15),(320,1,0,3,16777223,'2023-01-09 23:52:34',NULL,1048585,15),(321,1,0,3,16777224,'2023-01-09 23:52:34',NULL,1048585,15),(322,1,1,3,16777247,'2023-01-09 23:52:34',NULL,1048585,15),(323,1,2,3,16777247,'2023-01-09 23:52:34',NULL,1048585,15),(324,1,3,3,16777247,'2023-01-09 23:52:34',NULL,1048585,15),(325,1,0,2,16777236,'2023-01-09 23:52:52','2023-01-09 23:52:57',523,17),(336,1,0,3,16777220,'2023-01-09 23:53:50',NULL,1048585,16),(337,1,0,3,16777222,'2023-01-09 23:53:50',NULL,1048585,16),(338,1,0,3,16777223,'2023-01-09 23:53:50',NULL,1048585,16),(339,1,0,3,16777224,'2023-01-09 23:53:50',NULL,1048585,16),(340,1,1,3,16777247,'2023-01-09 23:53:50',NULL,1048585,16),(341,1,2,3,16777247,'2023-01-09 23:53:50',NULL,1048585,16),(342,1,3,3,16777247,'2023-01-09 23:53:50',NULL,1048585,16),(343,1,0,2,16777236,'2023-01-09 23:54:12','2023-01-09 23:54:18',523,18),(346,1,11,3,16777227,'2023-01-09 23:54:31',NULL,517,22),(348,1,12,3,16777227,'2023-01-09 23:54:40',NULL,517,23),(362,1,0,3,16777220,'2023-01-09 23:56:06',NULL,1048585,17),(363,1,0,3,16777222,'2023-01-09 23:56:06',NULL,1048585,17),(364,1,0,3,16777223,'2023-01-09 23:56:06',NULL,1048585,17),(365,1,0,3,16777224,'2023-01-09 23:56:06',NULL,1048585,17),(366,1,1,3,16777247,'2023-01-09 23:56:06',NULL,1048585,17),(367,1,2,3,16777247,'2023-01-09 23:56:06',NULL,1048585,17),(368,1,3,3,16777247,'2023-01-09 23:56:06',NULL,1048585,17),(369,1,0,2,16777236,'2023-01-09 23:56:28','2023-01-09 23:56:35',523,19),(370,1,34,2,16777229,'2023-01-09 23:56:28',NULL,1048585,17),(371,1,7,3,16777227,'2023-01-09 23:56:41',NULL,517,24),(373,1,8,3,16777227,'2023-01-09 23:56:50',NULL,517,25);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_resumption_tokens`
--

DROP TABLE IF EXISTS `oai_resumption_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oai_resumption_tokens` (
  `token` varchar(32) NOT NULL,
  `expire` bigint(20) NOT NULL,
  `record_offset` int(11) NOT NULL,
  `params` text,
  UNIQUE KEY `oai_resumption_tokens_pkey` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `plugin_name` varchar(80) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `plugin_settings_pkey` (`plugin_name`,`context_id`,`setting_name`),
  KEY `plugin_settings_plugin_name` (`plugin_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_settings`
--

LOCK TABLES `plugin_settings` WRITE;
/*!40000 ALTER TABLE `plugin_settings` DISABLE KEYS */;
INSERT INTO `plugin_settings` VALUES ('acronplugin',0,'crontab','[{\"className\":\"PKP\\\\task\\\\ReviewReminder\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\PublishSubmissions\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\RemoveUnvalidatedExpiredUsers\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\UpdateIPGeoDB\",\"frequency\":{\"day\":\"10\"},\"args\":[]},{\"className\":\"APP\\\\tasks\\\\UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\EditorialReminders\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\ProcessQueueJobs\",\"frequency\":{\"hour\":24},\"args\":[]}]','object'),('acronplugin',0,'enabled','1','bool'),('browseblockplugin',1,'browseCategories','1','bool'),('browseblockplugin',1,'browseNewReleases','1','bool'),('browseblockplugin',1,'browseSeries','1','bool'),('browseblockplugin',1,'context','1','int'),('browseblockplugin',1,'enabled','1','bool'),('browseblockplugin',1,'seq','1','int'),('defaultthemeplugin',0,'enabled','1','bool'),('defaultthemeplugin',1,'baseColour','#1E6292','string'),('defaultthemeplugin',1,'displayStats','none','string'),('defaultthemeplugin',1,'enabled','1','bool'),('defaultthemeplugin',1,'showCatalogSeriesListing','false','string'),('defaultthemeplugin',1,'typography','notoSans','string'),('defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),('developedbyblockplugin',0,'context','1','int'),('developedbyblockplugin',0,'enabled','0','bool'),('developedbyblockplugin',0,'seq','0','int'),('developedbyblockplugin',1,'context','1','int'),('developedbyblockplugin',1,'enabled','0','bool'),('developedbyblockplugin',1,'seq','0','int'),('dublincoremetaplugin',1,'enabled','1','bool'),('googlescholarplugin',1,'enabled','1','bool'),('htmlmonographfileplugin',1,'enabled','1','bool'),('informationblockplugin',1,'context','1','int'),('informationblockplugin',1,'enabled','1','bool'),('informationblockplugin',1,'seq','7','int'),('languagetoggleblockplugin',0,'context','1','int'),('languagetoggleblockplugin',0,'enabled','1','bool'),('languagetoggleblockplugin',0,'seq','4','int'),('languagetoggleblockplugin',1,'context','1','int'),('languagetoggleblockplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',1,'seq','4','int'),('pdfjsviewerplugin',1,'enabled','1','bool'),('tinymceplugin',0,'enabled','1','bool'),('tinymceplugin',1,'enabled','1','bool'),('usageeventplugin',0,'enabled','1','bool'),('usageeventplugin',0,'uniqueSiteId','','string'),('webfeedplugin',1,'displayItems','1','bool'),('webfeedplugin',1,'displayPage','homepage','string'),('webfeedplugin',1,'enabled','1','bool');
/*!40000 ALTER TABLE `plugin_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `press_settings`
--

DROP TABLE IF EXISTS `press_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `press_settings` (
  `press_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) DEFAULT NULL,
  UNIQUE KEY `press_settings_pkey` (`press_id`,`locale`,`setting_name`),
  KEY `press_settings_press_id` (`press_id`),
  CONSTRAINT `press_settings_press_id_foreign` FOREIGN KEY (`press_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `press_settings`
--

LOCK TABLES `press_settings` WRITE;
/*!40000 ALTER TABLE `press_settings` DISABLE KEYS */;
INSERT INTO `press_settings` VALUES (1,'','contactEmail','rvaca@mailinator.com',NULL),(1,'','contactName','Ramiro Vaca',NULL),(1,'','country','IS',NULL),(1,'','coverThumbnailsMaxHeight','100',NULL),(1,'','coverThumbnailsMaxWidth','106',NULL),(1,'','defaultReviewMode','2',NULL),(1,'','disableSubmissions','0',NULL),(1,'','doiCreationTime','copyEditCreationTime',NULL),(1,'','doiSuffixType','default',NULL),(1,'','editorialStatsEmail','1',NULL),(1,'','emailSignature','<br/><hr /><br/><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto: {$contactEmail}\">{$contactEmail}</a></p>',NULL),(1,'','enableDois','1',NULL),(1,'','enableGeoUsageStats','',NULL),(1,'','enableInstitutionUsageStats','0',NULL),(1,'','isSushiApiPublic','1',NULL),(1,'','itemsPerPage','25',NULL),(1,'','keywords','request',NULL),(1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada',NULL),(1,'','notifyAllAuthors','1',NULL),(1,'','numPageLinks','10',NULL),(1,'','numWeeksPerResponse','4',NULL),(1,'','numWeeksPerReview','4',NULL),(1,'','paymentPluginName','ManualPayment',NULL),(1,'','registrationAgency','',NULL),(1,'','submissionAcknowledgement','allAuthors',NULL),(1,'','supportedFormLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedSubmissionLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportEmail','rvaca@mailinator.com',NULL),(1,'','supportName','Ramiro Vaca',NULL),(1,'','themePluginPath','default',NULL),(1,'','type','enable',NULL),(1,'en_US','acronym','JPK',NULL),(1,'en_US','authorGuidelines','<p>Authors are invited to make a submission to this press. Those submissions considered to be a good fit will be sent for peer review before determining whether they will be accepted or rejected.</p><p>Before making a submission, authors are responsible for obtaining permission to publish any material included with the submission, such as photos, documents and datasets. All authors identified on the submission must consent to be identified as an author. Where appropriate, research should be approved by an appropriate ethics committee in accordance with the legal requirements of the study\'s country.</p><p>An editor may desk reject a submission if it does not meet minimum standards of quality. Before submitting, please ensure that the scope and outline of the book are structured and articulated properly. The title should be concise and the abstract should be able to stand on its own. This will increase the likelihood of reviewers agreeing to review the book. When you\'re satisfied that your submission meets this standard, please follow the checklist below to prepare your submission.</p>',NULL),(1,'en_US','authorInformation','Interested in submitting to this press? We recommend that you review the <a href=\"http://localhost/index.php/publicknowledge/about\">About the Press</a> page for the press\' section policies and <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.php/publicknowledge/user/register\">register</a> with the press prior to submitting, or if already registered can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the 5 step process.',NULL),(1,'en_US','beginSubmissionHelp','<p>Thank you for submitting to the Public Knowledge Press. You will be asked to upload files, identify co-authors, and provide information such as the title and abstract.<p><p>Please read our <a href=\"http://localhost/index.php/publicknowledge/about/submissions\" target=\"_blank\">Submission Guidelines</a> if you have not done so already. When filling out the forms, provide as many details as possible in order to help our editors evaluate your work.</p><p>Once you begin, you can save your submission and come back to it later. You will be able to review and correct any information before you submit.</p>',NULL),(1,'en_US','contributorsHelp','<p>Add details for all of the contributors to this submission. Contributors added here will be sent an email confirmation of the submission, as well as a copy of all editorial decisions recorded against this submission.</p><p>If a contributor can not be contacted by email, because they must remain anonymous or do not have an email account, please do not enter a fake email address. You can add information about this contributor in a message to the editor at a later step in the submission process.</p>',NULL),(1,'en_US','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">',NULL),(1,'en_US','detailsHelp','<p>Please provide the following details to help us manage your submission in our system.</p>',NULL),(1,'en_US','forTheEditorsHelp','<p>Please provide the following details in order to help our editorial team manage your submission.</p><p>When entering metadata such as keywords, provide entries that you think would be most helpful to the person managing your submission. This information can be changed before publication.</p>',NULL),(1,'en_US','librarianInformation','We encourage research librarians to list this press among their library\'s electronic press holdings. As well, this open source publishing system is suitable for libraries to host for their faculty members to use with presses they are involved in editing (see <a href=\"https://pkp.sfu.ca/omp\">Open Monograph Press</a>).',NULL),(1,'en_US','name','Public Knowledge Press',NULL),(1,'en_US','openAccessPolicy','This press provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),(1,'en_US','privacyStatement','<p>The names and email addresses entered in this press site will be used exclusively for the stated purposes of this press and will not be made available for any other purpose or to any other party.</p>',NULL),(1,'en_US','readerInformation','We encourage readers to sign up for the publishing notification service for this press. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the homepage for the press. This registration will result in the reader receiving the Table of Contents by email for each new monograph of the press. This list also allows the press to claim a certain level of support or readership. See the press <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a> which assures readers that their name and email address will not be used for other purposes.',NULL),(1,'en_US','reviewHelp','<p>Review the information you have entered before you complete your submission. You can change any of the details displayed here by clicking the edit button at the top of each section.</p><p>Once you complete your submission, a member of our editorial team will be assigned to review it. Please ensure the details you have entered here are as accurate as possible.</p>',NULL),(1,'en_US','searchDescription','Public Knowledge Press is a publisher dedicated to the subject of public access to science.',NULL),(1,'en_US','submissionChecklist','<p>All submissions must meet the following requirements.</p><ul><li>This submission meets the requirements outlined in the <a href=\"http://localhost/index.php/publicknowledge/about/submissions\">Author Guidelines</a>.</li><li>This submission has not been previously published, nor is it before another press for consideration.</li><li>All references have been checked for accuracy and completeness.</li><li>All tables and figures have been numbered and labeled.</li><li>Permission has been obtained to publish all photos, datasets and other material provided with this submission.</li></ul>',NULL),(1,'en_US','uploadFilesHelp','<p>Provide any files our editorial team may need to evaluate your submission. In addition to the main work, you may wish to submit data sets, conflict of interest statements, or other supplementary files if these will be helpful for our editors.</p>',NULL),(1,'fr_CA','authorGuidelines','##default.contextSettings.authorGuidelines##',NULL),(1,'fr_CA','authorInformation','Vous souhaitez soumettre une contribution à cette presse ? Nous vous recommandons de lire la page\n <a href=\"http://localhost/index.php/publicknowledge/about\">À propos de cette presse</a> pour connaitre ses règlements et la page\n <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Lignes directrices à l\'intention des auteurs-es</a>. Les auteurs-es doivent <a href=\"http://localhost/index.php/publicknowledge/user/register\">s\'inscrire</a> auprès de la presse avant d\'envoyer une soumission. Si vous êtes déjà inscrit-e, il suffit simplement <a href=\"http://localhost/index.php/index/login\">d\'ouvrir une session</a> pour débuter la procédure en 5 étapes.',NULL),(1,'fr_CA','beginSubmissionHelp','##default.submission.step.beforeYouBegin##',NULL),(1,'fr_CA','contributorsHelp','##default.submission.step.contributors##',NULL),(1,'fr_CA','detailsHelp','##default.submission.step.details##',NULL),(1,'fr_CA','forTheEditorsHelp','##default.submission.step.forTheEditors##',NULL),(1,'fr_CA','librarianInformation','Nous encourageons les bibliothécaires de recherche à ajouter cette presse à la liste électronique des ressources documentaires de la bibliothèque. De plus, ce système d\'édition à libre accès convient à toutes les bibliothèques et permet aux membres des facultés de l\'utiliser pour les presses auxquelles ils contribuent à titre de rédacteur en chef. (voir <a href=\"http://pkp.sfu.ca/omp\">Open Monograph Press</a>).',NULL),(1,'fr_CA','name','Press de la connaissance du public',NULL),(1,'fr_CA','openAccessPolicy','Cette presse offre un accès libre immédiat à son contenu en partant du principe que la recherche doit être accessible au grand public, car cela favorise un meilleur échange des connaissances à l\'échelle mondiale.',NULL),(1,'fr_CA','privacyStatement','<p>Les noms et adresses courriel saisis sur ce site de presse seront utilisés exclusivement pour les fins convenues de cette presse. Ils ne seront pas utilisés pour d\'autres fins ou transmis à une tierce partie.</p>',NULL),(1,'fr_CA','readerInformation','Nous encourageons les lecteurs à s\'abonner au service d\'avis de publication de cette presse. Utilisez le lien <a href=\"http://localhost/index.php/publicknowledge/user/register\">d\'inscription</a> situé en haut de la page d\'accueil de la presse. Cette inscription permettra au lecteur de recevoir la table des matières de chaque nouvelle monographie de cette presse par courriel. Cette liste permet également à la presse d\'affirmer qu\'elle compte un certain nombre de lecteurs. Consultez <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">l\'énoncé de confidentialité </a> de la presse, lequel stipule que les noms et adresses courriel de ses lecteurs ne seront pas utilisés à d\'autres fins.',NULL),(1,'fr_CA','reviewHelp','##default.submission.step.review##',NULL),(1,'fr_CA','submissionChecklist','##default.contextSettings.checklist##',NULL),(1,'fr_CA','uploadFilesHelp','##default.submission.step.uploadFiles##',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presses`
--

LOCK TABLES `presses` WRITE;
/*!40000 ALTER TABLE `presses` DISABLE KEYS */;
INSERT INTO `presses` VALUES (1,'publicknowledge',1.00,'en_US',1);
/*!40000 ALTER TABLE `presses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_categories`
--

DROP TABLE IF EXISTS `publication_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_categories` (
  `publication_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  UNIQUE KEY `publication_categories_id` (`publication_id`,`category_id`),
  KEY `publication_categories_publication_id` (`publication_id`),
  KEY `publication_categories_category_id` (`category_id`),
  CONSTRAINT `publication_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE,
  CONSTRAINT `publication_categories_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `publication_format_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `publication_format_settings_pkey` (`publication_format_id`,`locale`,`setting_name`),
  KEY `publication_format_id_key` (`publication_format_id`),
  CONSTRAINT `publication_format_settings_publication_format_id` FOREIGN KEY (`publication_format_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_format_settings`
--

LOCK TABLES `publication_format_settings` WRITE;
/*!40000 ALTER TABLE `publication_format_settings` DISABLE KEYS */;
INSERT INTO `publication_format_settings` VALUES (1,'en_US','name','PDF','string'),(1,'fr_CA','name','','string'),(2,'en_US','name','PDF','string'),(2,'fr_CA','name','','string'),(3,'en_US','name','PDF','string'),(3,'fr_CA','name','','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
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
  `publication_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  UNIQUE KEY `publication_settings_pkey` (`publication_id`,`locale`,`setting_name`),
  KEY `publication_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `publication_settings_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_settings`
--

LOCK TABLES `publication_settings` WRITE;
/*!40000 ALTER TABLE `publication_settings` DISABLE KEYS */;
INSERT INTO `publication_settings` VALUES (1,'','categoryIds','[]'),(1,'en_US','abstract','The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities―and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.'),(1,'en_US','title','The ABCs of Human Survival: A Paradigm for Global Citizenship'),(2,'','categoryIds','[]'),(2,'en_US','abstract','<p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p>'),(2,'en_US','title','The West and Beyond: New Perspectives on an Imagined Region'),(3,'','categoryIds','[]'),(3,'en_US','abstract','Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.'),(3,'en_US','title','The Political Economy of Workplace Injury in Canada'),(4,'','categoryIds','[]'),(4,'en_US','abstract','What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.'),(4,'en_US','title','How Canadians Communicate: Contexts of Canadian Popular Culture'),(5,'','categoryIds','[]'),(5,'','copyrightYear','2023'),(5,'en_US','abstract','Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.'),(5,'en_US','copyrightHolder','Public Knowledge Press'),(5,'en_US','title','Bomb Canada and Other Unkind Remarks in the American Media'),(5,'fr_CA','copyrightHolder','Press de la connaissance du public'),(6,'','categoryIds','[]'),(6,'en_US','abstract','Good researchers have a host of tools at their disposal that make navigating today’s complex information ecosystem much more manageable. Gaining the knowledge, abilities, and self-reflection necessary to be a good researcher helps not only in academic settings, but is invaluable in any career, and throughout one’s life. The Information Literacy User’s Guide will start you on this route to success.'),(6,'en_US','title','The Information Literacy User’s Guide'),(7,'','categoryIds','[]'),(7,'en_US','abstract','Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.'),(7,'en_US','title','Accessible Elements: Teaching Science Online and at a Distance'),(8,'','categoryIds','[]'),(8,'en_US','abstract','A Note From The Publisher'),(8,'en_US','title','Editorial'),(9,'','categoryIds','[]'),(9,'en_US','abstract','In recent years, the Internet and other network technologies have emerged as a central issue for development in Latin America and the Caribbean. They have shown their potential to increase productivity and economic competitiveness, to create new ways to deliver education and health services, and to be driving forces for the modernization of the provision of public services.'),(9,'en_US','title','Enabling Openness: The future of the information society in Latin America and the Caribbean'),(10,'','categoryIds','[]'),(10,'en_US','abstract','While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.'),(10,'en_US','title','Lost Tracks: Buffalo National Park, 1909-1939'),(11,'','categoryIds','[]'),(11,'en_US','abstract','Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.'),(11,'en_US','title','Dreamwork'),(12,'','categoryIds','[]'),(12,'en_US','abstract','Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.'),(12,'en_US','title','Connecting ICTs to Development'),(13,'','categoryIds','[]'),(13,'en_US','abstract','This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.'),(13,'en_US','title','Mobile Learning: Transforming the Delivery of Education and Training'),(14,'','categoryIds','[]'),(14,'','copyrightYear','2023'),(14,'en_US','abstract','From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.'),(14,'en_US','copyrightHolder','Public Knowledge Press'),(14,'en_US','title','From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots'),(14,'fr_CA','copyrightHolder','Press de la connaissance du public'),(15,'','categoryIds','[]'),(15,'en_US','abstract','A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.'),(15,'en_US','title','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978'),(16,'','categoryIds','[]'),(16,'en_US','abstract','Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.'),(16,'en_US','title','A Designer\'s Log: Case Studies in Instructional Design'),(17,'','categoryIds','[]'),(17,'en_US','abstract','The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.'),(17,'en_US','title','Open Development: Networked Innovations in International Development');
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
  CONSTRAINT `publications_series_id` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE,
  CONSTRAINT `publications_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,NULL,'2023-01-09 23:24:39',1,'pub','publication',0.00,NULL,NULL,1,1,NULL,1,NULL),(2,NULL,'2023-01-09 23:26:50',2,'pub','publication',0.00,NULL,NULL,2,1,NULL,1,NULL),(3,NULL,'2023-01-09 23:28:58',11,'pub','publication',0.00,NULL,NULL,3,1,NULL,1,NULL),(4,NULL,'2023-01-09 23:29:55',12,'pub','publication',0.00,NULL,NULL,4,1,NULL,1,NULL),(5,'2023-01-09','2023-01-09 23:35:26',16,'pub','publication',0.00,NULL,NULL,5,3,NULL,1,NULL),(6,NULL,'2023-01-09 23:35:37',17,'pub','publication',0.00,NULL,NULL,6,1,NULL,1,NULL),(7,NULL,'2023-01-09 23:37:32',21,'pub','publication',0.00,NULL,NULL,7,1,NULL,1,NULL),(8,NULL,'2023-01-09 23:39:19',NULL,'pub','publication',0.00,NULL,NULL,8,1,NULL,1,NULL),(9,NULL,'2023-01-09 23:39:33',26,'pub','publication',0.00,NULL,NULL,9,1,NULL,1,NULL),(10,NULL,'2023-01-09 23:40:55',31,'pub','publication',0.00,NULL,NULL,10,1,NULL,1,NULL),(11,NULL,'2023-01-09 23:42:38',32,'pub','publication',0.00,NULL,NULL,11,1,NULL,1,NULL),(12,NULL,'2023-01-09 23:44:42',33,'pub','publication',0.00,NULL,NULL,12,1,NULL,1,NULL),(13,NULL,'2023-01-09 23:46:17',41,'pub','publication',0.00,NULL,NULL,13,1,NULL,1,NULL),(14,'2023-01-09','2023-01-09 23:51:57',45,'pub','publication',0.00,NULL,NULL,14,3,NULL,1,NULL),(15,NULL,'2023-01-09 23:52:09',48,'pub','publication',0.00,NULL,NULL,15,1,NULL,1,NULL),(16,NULL,'2023-01-09 23:53:07',49,'pub','publication',0.00,NULL,NULL,16,1,NULL,1,NULL),(17,NULL,'2023-01-09 23:55:05',50,'pub','publication',0.00,NULL,NULL,17,1,NULL,1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
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
  `query_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `query_participants_pkey` (`query_id`,`user_id`),
  KEY `query_participants_query_id` (`query_id`),
  KEY `query_participants_user_id` (`user_id`),
  CONSTRAINT `query_participants_query_id_foreign` FOREIGN KEY (`query_id`) REFERENCES `queries` (`query_id`) ON DELETE CASCADE,
  CONSTRAINT `query_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_participants`
--

LOCK TABLES `query_participants` WRITE;
/*!40000 ALTER TABLE `query_participants` DISABLE KEYS */;
INSERT INTO `query_participants` VALUES (1,3),(1,4);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `unconsidered` smallint(6) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignments`
--

LOCK TABLES `review_assignments` WRITE;
/*!40000 ALTER TABLE `review_assignments` DISABLE KEYS */;
INSERT INTO `review_assignments` VALUES (1,1,12,NULL,NULL,'2023-01-09 23:25:29','2023-01-09 23:25:29',NULL,NULL,NULL,'2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:25:29',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,1,NULL,0,0),(2,2,11,NULL,NULL,'2023-01-09 23:28:35','2023-01-09 23:28:35',NULL,NULL,NULL,'2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:28:35',0,0,0,NULL,NULL,NULL,NULL,2,3,2,1,1,NULL,0,0),(3,2,12,NULL,NULL,'2023-01-09 23:28:46','2023-01-09 23:28:46',NULL,NULL,NULL,'2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:28:46',0,0,0,NULL,NULL,NULL,NULL,2,3,2,1,1,NULL,0,0),(4,4,9,NULL,NULL,'2023-01-09 23:31:01','2023-01-09 23:31:01',NULL,NULL,NULL,'2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:31:01',0,0,0,NULL,NULL,NULL,NULL,3,2,2,1,1,NULL,0,0),(5,4,11,NULL,NULL,'2023-01-09 23:31:18','2023-01-09 23:31:18',NULL,NULL,NULL,'2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:31:18',0,0,0,NULL,NULL,NULL,NULL,4,3,2,1,1,NULL,0,0),(6,5,8,NULL,NULL,'2023-01-09 23:33:36','2023-01-09 23:33:36',NULL,NULL,NULL,'2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:33:36',0,0,0,NULL,NULL,NULL,NULL,5,2,2,1,1,NULL,0,0),(7,5,12,NULL,NULL,'2023-01-09 23:33:55','2023-01-09 23:33:55',NULL,NULL,NULL,'2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:33:55',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,1,NULL,0,0),(8,7,10,NULL,NULL,'2023-01-09 23:38:49','2023-01-09 23:38:49',NULL,NULL,NULL,'2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:38:49',0,0,0,NULL,NULL,NULL,NULL,8,3,2,1,1,NULL,0,0),(9,11,9,NULL,NULL,'2023-01-09 23:43:21','2023-01-09 23:43:21',NULL,NULL,NULL,'2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:43:21',0,0,0,NULL,NULL,NULL,NULL,10,2,2,1,1,NULL,0,0),(10,11,10,NULL,0,'2023-01-09 23:43:36','2023-01-09 23:43:36','2023-01-09 23:43:52','2023-01-09 23:43:56','2023-01-09 23:44:27','2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:44:27',0,0,0,NULL,NULL,NULL,0,11,3,2,1,4,NULL,0,0),(11,11,12,NULL,0,'2023-01-09 23:43:44','2023-01-09 23:43:44','2023-01-09 23:44:03','2023-01-09 23:44:07','2023-01-09 23:44:27','2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:44:27',0,0,0,NULL,NULL,NULL,0,11,3,2,1,4,NULL,0,0),(12,12,7,NULL,NULL,'2023-01-09 23:45:39','2023-01-09 23:45:39',NULL,NULL,NULL,'2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:45:39',0,0,0,NULL,NULL,NULL,NULL,12,2,2,1,1,NULL,0,0),(13,12,8,NULL,0,'2023-01-09 23:45:46','2023-01-09 23:45:46','2023-01-09 23:46:02','2023-01-09 23:46:06',NULL,'2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:46:06',0,0,0,NULL,NULL,NULL,0,12,2,2,1,4,NULL,0,0),(14,12,9,NULL,NULL,'2023-01-09 23:45:54','2023-01-09 23:45:54',NULL,NULL,NULL,'2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:45:54',0,0,0,NULL,NULL,NULL,NULL,12,2,2,1,1,NULL,0,0),(15,13,8,NULL,NULL,'2023-01-09 23:47:12','2023-01-09 23:47:12',NULL,NULL,NULL,'2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:47:12',0,0,0,NULL,NULL,NULL,NULL,13,2,2,1,1,NULL,0,0),(16,13,10,NULL,0,'2023-01-09 23:47:28','2023-01-09 23:47:28','2023-01-09 23:47:52','2023-01-09 23:47:56','2023-01-09 23:48:31','2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:48:31',0,0,0,NULL,NULL,NULL,0,14,3,2,1,4,NULL,0,0),(17,13,11,NULL,NULL,'2023-01-09 23:47:35','2023-01-09 23:47:35',NULL,NULL,NULL,'2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:47:35',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,1,NULL,0,0),(18,13,12,NULL,0,'2023-01-09 23:47:44','2023-01-09 23:47:44','2023-01-09 23:48:04','2023-01-09 23:48:09','2023-01-09 23:48:31','2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:48:31',0,0,0,NULL,NULL,NULL,0,14,3,2,1,4,NULL,0,0),(19,14,7,NULL,NULL,'2023-01-09 23:49:59','2023-01-09 23:49:59',NULL,NULL,NULL,'2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:49:59',0,0,0,NULL,NULL,NULL,NULL,15,2,2,1,1,NULL,0,0),(20,14,11,NULL,NULL,'2023-01-09 23:50:16','2023-01-09 23:50:16',NULL,NULL,NULL,'2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:50:16',0,0,0,NULL,NULL,NULL,NULL,16,3,2,1,1,NULL,0,0),(21,16,10,NULL,0,'2023-01-09 23:54:23','2023-01-09 23:54:23','2023-01-09 23:54:49','2023-01-09 23:54:53',NULL,'2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:54:53',0,0,0,NULL,NULL,NULL,0,18,3,2,1,4,NULL,0,0),(22,16,11,NULL,NULL,'2023-01-09 23:54:31','2023-01-09 23:54:31',NULL,NULL,NULL,'2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:54:31',0,0,0,NULL,NULL,NULL,NULL,18,3,2,1,1,NULL,0,0),(23,16,12,NULL,NULL,'2023-01-09 23:54:40','2023-01-09 23:54:40',NULL,NULL,NULL,'2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:54:40',0,0,0,NULL,NULL,NULL,NULL,18,3,2,1,1,NULL,0,0),(24,17,7,NULL,NULL,'2023-01-09 23:56:41','2023-01-09 23:56:41',NULL,NULL,NULL,'2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:56:41',0,0,0,NULL,NULL,NULL,NULL,19,2,2,1,1,NULL,0,0),(25,17,8,NULL,NULL,'2023-01-09 23:56:50','2023-01-09 23:56:50',NULL,NULL,NULL,'2023-02-06 00:00:00','2023-02-06 00:00:00','2023-01-09 23:56:50',0,0,0,NULL,NULL,NULL,NULL,19,2,2,1,1,NULL,0,0);
/*!40000 ALTER TABLE `review_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_files`
--

DROP TABLE IF EXISTS `review_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_files` (
  `review_id` bigint(20) NOT NULL,
  `submission_file_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `review_files_pkey` (`review_id`,`submission_file_id`),
  KEY `review_files_review_id` (`review_id`),
  KEY `review_files_submission_file_id` (`submission_file_id`),
  CONSTRAINT `review_files_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `review_assignments` (`review_id`) ON DELETE CASCADE,
  CONSTRAINT `review_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_files`
--

LOCK TABLES `review_files` WRITE;
/*!40000 ALTER TABLE `review_files` DISABLE KEYS */;
INSERT INTO `review_files` VALUES (1,4),(1,5),(1,6),(2,12),(2,13),(2,14),(2,15),(3,12),(3,13),(3,14),(3,15),(4,25),(4,26),(4,27),(4,28),(6,35),(6,36),(6,37),(6,38),(6,39),(6,40),(8,55),(8,56),(8,57),(8,58),(8,59),(9,82),(9,83),(12,87),(12,88),(12,89),(13,87),(13,88),(13,89),(14,87),(14,88),(14,89),(15,93),(15,94),(15,95),(19,102),(19,103),(19,104),(19,105),(19,106),(19,107),(21,125),(21,126),(21,127),(21,128),(21,129),(22,125),(22,126),(22,127),(22,128),(22,129),(23,125),(23,126),(23,127),(23,128),(23,129),(24,136),(24,137),(24,138),(24,139),(24,140),(24,141),(25,136),(25,137),(25,138),(25,139),(25,140),(25,141);
/*!40000 ALTER TABLE `review_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_element_settings`
--

DROP TABLE IF EXISTS `review_form_element_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_element_settings` (
  `review_form_element_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_element_settings_pkey` (`review_form_element_id`,`locale`,`setting_name`),
  KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`),
  CONSTRAINT `review_form_element_settings_review_form_element_id` FOREIGN KEY (`review_form_element_id`) REFERENCES `review_form_elements` (`review_form_element_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `review_form_element_id` bigint(20) NOT NULL,
  `review_id` bigint(20) NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text,
  KEY `review_form_responses_review_form_element_id` (`review_form_element_id`),
  KEY `review_form_responses_review_id` (`review_id`),
  KEY `review_form_responses_pkey` (`review_form_element_id`,`review_id`),
  CONSTRAINT `review_form_responses_review_form_element_id_foreign` FOREIGN KEY (`review_form_element_id`) REFERENCES `review_form_elements` (`review_form_element_id`) ON DELETE CASCADE,
  CONSTRAINT `review_form_responses_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `review_assignments` (`review_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `review_form_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_settings_pkey` (`review_form_id`,`locale`,`setting_name`),
  KEY `review_form_settings_review_form_id` (`review_form_id`),
  CONSTRAINT `review_form_settings_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `submission_file_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `review_round_files_pkey` (`submission_id`,`review_round_id`,`submission_file_id`),
  KEY `review_round_files_submission_id` (`submission_id`),
  KEY `review_round_files_submission_file_id` (`submission_file_id`),
  CONSTRAINT `review_round_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `review_round_files_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_round_files`
--

LOCK TABLES `review_round_files` WRITE;
/*!40000 ALTER TABLE `review_round_files` DISABLE KEYS */;
INSERT INTO `review_round_files` VALUES (1,1,3,4),(1,1,3,5),(1,1,3,6),(2,2,3,12),(2,2,3,13),(2,2,3,14),(2,2,3,15),(4,3,2,25),(4,3,2,26),(4,3,2,27),(4,3,2,28),(5,5,2,35),(5,5,2,36),(5,5,2,37),(5,5,2,38),(5,5,2,39),(5,5,2,40),(6,7,2,46),(6,7,2,47),(6,7,2,48),(6,7,2,49),(7,8,3,55),(7,8,3,56),(7,8,3,57),(7,8,3,58),(7,8,3,59),(9,9,2,66),(9,9,2,67),(9,9,2,68),(9,9,2,69),(9,9,2,70),(11,10,2,82),(11,10,2,83),(12,12,2,87),(12,12,2,88),(12,12,2,89),(13,13,2,93),(13,13,2,94),(13,13,2,95),(14,15,2,102),(14,15,2,103),(14,15,2,104),(14,15,2,105),(14,15,2,106),(14,15,2,107),(15,17,3,117),(15,17,3,118),(15,17,3,119),(16,18,3,125),(16,18,3,126),(16,18,3,127),(16,18,3,128),(16,18,3,129),(17,19,2,136),(17,19,2,137),(17,19,2,138),(17,19,2,139),(17,19,2,140),(17,19,2,141);
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
  KEY `review_rounds_submission_id` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `class_name` varchar(255) NOT NULL,
  `last_run` datetime DEFAULT NULL,
  UNIQUE KEY `scheduled_tasks_pkey` (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_tasks`
--

LOCK TABLES `scheduled_tasks` WRITE;
/*!40000 ALTER TABLE `scheduled_tasks` DISABLE KEYS */;
INSERT INTO `scheduled_tasks` VALUES ('APP\\tasks\\UsageStatsLoader','2023-01-09 23:19:18'),('PKP\\task\\EditorialReminders','2023-01-09 23:19:18'),('PKP\\task\\ProcessQueueJobs','2023-01-09 23:19:18'),('PKP\\task\\PublishSubmissions','2023-01-09 23:19:16'),('PKP\\task\\RemoveUnvalidatedExpiredUsers','2023-01-09 23:19:16'),('PKP\\task\\ReviewReminder','2023-01-09 23:19:16'),('PKP\\task\\StatisticsReport','2023-01-09 23:19:16'),('PKP\\task\\UpdateIPGeoDB','2023-01-09 23:19:16');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES (1,1,NULL,0.00,0,0,'lis','a:0:{}',0),(2,1,NULL,0.00,0,0,'pe','a:0:{}',0),(3,1,NULL,0.00,0,0,'his','a:0:{}',0),(4,1,NULL,0.00,0,0,'ed','a:0:{}',0),(5,1,NULL,0.00,0,0,'psy','a:0:{}',0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `series_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `series_settings_pkey` (`series_id`,`locale`,`setting_name`),
  KEY `series_settings_series_id` (`series_id`),
  CONSTRAINT `series_settings_series_id` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series_settings`
--

LOCK TABLES `series_settings` WRITE;
/*!40000 ALTER TABLE `series_settings` DISABLE KEYS */;
INSERT INTO `series_settings` VALUES (1,'','onlineIssn','','string'),(1,'','printIssn','','string'),(1,'','sortOption','title-ASC','string'),(1,'en_US','description','','string'),(1,'en_US','prefix','','string'),(1,'en_US','subtitle','','string'),(1,'en_US','title','Library & Information Studies','string'),(1,'fr_CA','description','','string'),(1,'fr_CA','prefix','','string'),(1,'fr_CA','subtitle','','string'),(1,'fr_CA','title','','string'),(2,'','onlineIssn','','string'),(2,'','printIssn','','string'),(2,'','sortOption','title-ASC','string'),(2,'en_US','description','','string'),(2,'en_US','prefix','','string'),(2,'en_US','subtitle','','string'),(2,'en_US','title','Political Economy','string'),(2,'fr_CA','description','','string'),(2,'fr_CA','prefix','','string'),(2,'fr_CA','subtitle','','string'),(2,'fr_CA','title','','string'),(3,'','onlineIssn','','string'),(3,'','printIssn','','string'),(3,'','sortOption','title-ASC','string'),(3,'en_US','description','','string'),(3,'en_US','prefix','','string'),(3,'en_US','subtitle','','string'),(3,'en_US','title','History','string'),(3,'fr_CA','description','','string'),(3,'fr_CA','prefix','','string'),(3,'fr_CA','subtitle','','string'),(3,'fr_CA','title','','string'),(4,'','onlineIssn','','string'),(4,'','printIssn','','string'),(4,'','sortOption','title-ASC','string'),(4,'en_US','description','','string'),(4,'en_US','prefix','','string'),(4,'en_US','subtitle','','string'),(4,'en_US','title','Education','string'),(4,'fr_CA','description','','string'),(4,'fr_CA','prefix','','string'),(4,'fr_CA','subtitle','','string'),(4,'fr_CA','title','','string'),(5,'','onlineIssn','','string'),(5,'','printIssn','','string'),(5,'','sortOption','title-ASC','string'),(5,'en_US','description','','string'),(5,'en_US','prefix','','string'),(5,'en_US','subtitle','','string'),(5,'en_US','title','Psychology','string'),(5,'fr_CA','description','','string'),(5,'fr_CA','prefix','','string'),(5,'fr_CA','subtitle','','string'),(5,'fr_CA','title','','string');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('036svtteve545abssne8blp67p',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673306441,1673306601,0,'username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1673306600;s:5:\"token\";s:32:\"f7dca9d52e32ea5d29508eba8d5bbc11\";}','localhost'),('0glhse8v5b4ml3n18g7flakn6r',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673307331,1673307375,0,'csrf|a:2:{s:9:\"timestamp\";i:1673307375;s:5:\"token\";s:32:\"3d9d304357c04f0addbb6251cf255174\";}username|s:9:\"dbernnard\";','localhost'),('16470ha9rstngm3pd8v4i93h2a',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673307307,1673307317,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1673307317;s:5:\"token\";s:32:\"61c812ee15be700d2841b05af1c51a53\";}','localhost'),('1tc9i0auc7rg397ga9np0aetrf',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673308007,1673308065,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1673308065;s:5:\"token\";s:32:\"8172ca6324ce370b66b9ab5fa001178c\";}','localhost'),('2ek4b4hgadpavla96kpndkbo5i',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673307623,1673307646,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1673307646;s:5:\"token\";s:32:\"e69d3050bab78c0a7ed28be01d61595e\";}','localhost'),('30tt4o2qh12sv99rfc4skcl5a3',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673307502,1673307548,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1673307548;s:5:\"token\";s:32:\"50ed6aa3fc576e7e80b73ebc8588f0c5\";}','localhost'),('3asuksacfb5gn1g3j55514odob',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673307446,1673307502,0,'csrf|a:2:{s:9:\"timestamp\";i:1673307502;s:5:\"token\";s:32:\"b18392d8b61fe1f072fc2f7890c34946\";}username|s:10:\"dkennepohl\";','localhost'),('3k1am60290khopeocp0onemi4r',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673307553,1673307563,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1673307563;s:5:\"token\";s:32:\"2174b59a2e42f0eddf244d341347ff33\";}','localhost'),('5b0riprj8jmfc9ng7ltb93bhs3',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673308482,1673308494,0,'username|s:8:\"agallego\";csrf|a:2:{s:9:\"timestamp\";i:1673308494;s:5:\"token\";s:32:\"80d2e2579a3c478afacc3a2c4cc508f4\";}','localhost'),('5ebcj3l6k2ad6nj5nnqptrm8qc',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673308356,1673308378,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1673308378;s:5:\"token\";s:32:\"6a5bd098745dd6470fc1aed365e8bad7\";}','localhost'),('5sbvtrad6c0ukhhraabk03o2m7',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673306989,1673307035,0,'csrf|a:2:{s:9:\"timestamp\";i:1673307035;s:5:\"token\";s:32:\"094c4ff39a734cde7ea8f7712c2dbee0\";}username|s:6:\"bbeaty\";','localhost'),('618v5no8m67s9f1iinel4bdste',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673308090,1673308117,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1673308117;s:5:\"token\";s:32:\"7f1d699f6f771d36ba5763225595670f\";}','localhost'),('641sl7bij7jsab3cb5q27pa1tb',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673307376,1673307412,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1673307413;s:5:\"token\";s:32:\"697601391ff0fa3325cf6e6d0771364b\";}','localhost'),('6kiodtmheviasrcn9ak6hauu98',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673308569,1673308611,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1673308610;s:5:\"token\";s:32:\"964615ccbbe473c16acecf256cb5f964\";}','localhost'),('6tluggj5g4ov9onjjkhd73vf71',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673306356,1673306379,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1673306379;s:5:\"token\";s:32:\"4483236f22210df6f5f2cf0da709d02d\";}','localhost'),('75ilvpq1t6pq599sog43eb4m6d',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673306707,1673306745,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1673306745;s:5:\"token\";s:32:\"233e70886a5bd1ff870b3bc2dc1e0a03\";}','localhost'),('7b0c96jfracf40iosunu6f0gpt',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673307752,1673307777,0,'csrf|a:2:{s:9:\"timestamp\";i:1673307777;s:5:\"token\";s:32:\"c54907886a3abe97cfb6088647fcd102\";}username|s:10:\"jlockehart\";','localhost'),('7b5vmcoh1ilrkf8jn67kpblgqg',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673306431,1673306438,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1673306438;s:5:\"token\";s:32:\"78d5ca3bfc6d223414a8b3aa8e7756e7\";}','localhost'),('7fve9pbc9qvifrnq5i6mhgvmra',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673307125,1673307188,0,'csrf|a:2:{s:9:\"timestamp\";i:1673307188;s:5:\"token\";s:32:\"e9efe9a690e3f1169ec064db40977f6d\";}username|s:6:\"callan\";','localhost'),('7hn0ngq9th7phckn3kvsjiiino',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673308078,1673308089,0,'username|s:6:\"gfavio\";csrf|a:2:{s:9:\"timestamp\";i:1673308089;s:5:\"token\";s:32:\"488ccbbfb69d208369fcc65dbd918962\";}','localhost'),('7muv55p8staer2b6tlf7j1trf6',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673306883,1673306926,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1673306926;s:5:\"token\";s:32:\"77c41e1051cf7208fff08e94ae29a4a5\";}','localhost'),('7ok4ov6nprln0s3ti02pe7iukj',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673307189,1673307305,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1673307306;s:5:\"token\";s:32:\"59bb946e59de98730d4f89183a940cb0\";}','localhost'),('7vcitn4vnb5kcmqhpl3spn1c1n',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673308120,1673308169,0,'csrf|a:2:{s:9:\"timestamp\";i:1673308169;s:5:\"token\";s:32:\"1ba34fb757205366896ae5894bdfd8a2\";}username|s:7:\"mdawson\";','localhost'),('9v47c6d1798sasvpvn93uvegbt',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673307413,1673307431,0,'username|s:6:\"minoue\";csrf|a:2:{s:9:\"timestamp\";i:1673307431;s:5:\"token\";s:32:\"cf7613ef3f52a0a19ef9c75f137ad396\";}','localhost'),('a6apq7nqnl2ci49nemncke9o59',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673308170,1673308319,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1673308319;s:5:\"token\";s:32:\"d1ae16c48586eb847ae67a6fd1eb8c83\";}','localhost'),('d7u8ggbuvmfal4vg269gmu2suo',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673307913,1673307955,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1673307955;s:5:\"token\";s:32:\"66bcf40e782afa09e44250436df7b8dc\";}','localhost'),('emh4asgovha11cs9aigrcas461',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673307848,1673307872,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1673307872;s:5:\"token\";s:32:\"8ccdfad785745c38469953ae9e8d8699\";}','localhost'),('en4tt1qpujpe9fmqt2k1d9trbj',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673306673,1673306706,0,'csrf|a:2:{s:9:\"timestamp\";i:1673306706;s:5:\"token\";s:32:\"19b4d48d323f4be7e1ffaaceb709f12f\";}username|s:6:\"aclark\";','localhost'),('h59og0vfndrda6j1bk4jq6qh21',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673306403,1673306420,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1673306420;s:5:\"token\";s:32:\"89dd4c78b869733334504de6c05ffedc\";}','localhost'),('henebf9qvj0fj645utc333e250',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673308066,1673308077,0,'username|s:8:\"agallego\";csrf|a:2:{s:9:\"timestamp\";i:1673308077;s:5:\"token\";s:32:\"01c402cc54a8679a13bc7ec59cfe512b\";}','localhost'),('isknlcbkk4d664qm5ebuvdoiju',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673307876,1673307913,0,'csrf|a:2:{s:9:\"timestamp\";i:1673307913;s:5:\"token\";s:32:\"f1478ffe0700749b86ab139f33278384\";}username|s:6:\"lelder\";','localhost'),('k6qb49on8680h768t6nc8hc6v8',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673307826,1673307836,0,'username|s:8:\"agallego\";csrf|a:2:{s:9:\"timestamp\";i:1673307836;s:5:\"token\";s:32:\"34f8cf3acfd2ee5362700475035bb076\";}','localhost'),('kdmgui35giek49uvll03nt5erb',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673306379,1673306400,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1673306400;s:5:\"token\";s:32:\"f4f5c0061af8b8217046d2ed2dd08b99\";}','localhost'),('kqvlhqu19sq8ift5as9rj0mk95',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673307432,1673307442,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1673307442;s:5:\"token\";s:32:\"a8db2b67ff94d8dd96aa47f9eef440dd\";}','localhost'),('l8hsdqb62mf1e6e9jcuibbs4me',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673307567,1673307623,0,'csrf|a:2:{s:9:\"timestamp\";i:1673307622;s:5:\"token\";s:32:\"767b5d5bce1c0f33068d3639c9de71c5\";}username|s:7:\"fperini\";','localhost'),('lgd8j63cj1m17spho8nncu7db9',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673306602,1673306620,0,'username|s:5:\"rvaca\";csrf|a:2:{s:9:\"timestamp\";i:1673306618;s:5:\"token\";s:32:\"1bd03c89de9f7b7182b9920c34dda6e3\";}','localhost'),('lpgns5t07mg39kulsgcm6ep01j',27,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673307649,1673307748,0,'csrf|a:2:{s:9:\"timestamp\";i:1673307748;s:5:\"token\";s:32:\"b469fab6787b872642bb9e5ac5b5207d\";}username|s:7:\"jbrower\";userId|i:27;','localhost'),('lqk1hhi6kllgtqdlpbqfofoo3a',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673307971,1673308006,0,'csrf|a:2:{s:9:\"timestamp\";i:1673308006;s:5:\"token\";s:32:\"c13c0a51bb38ddb6cdc89a18f5b0ec44\";}username|s:5:\"mally\";','localhost'),('mp7dp9hjfs99khrv9mrlgvs04l',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673307837,1673307848,0,'username|s:6:\"gfavio\";csrf|a:2:{s:9:\"timestamp\";i:1673307848;s:5:\"token\";s:32:\"d736ff704fd04e2e2953bf9e1c26b222\";}','localhost'),('mtvab4onng39em36nbte9u8im1',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673307318,1673307328,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1673307328;s:5:\"token\";s:32:\"36c4d2cfcdb9943cc41ebd47072a40a6\";}','localhost'),('n9dco4ut6elumno6iqt95t19q0',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673307036,1673307121,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1673307121;s:5:\"token\";s:32:\"be0b9e1aa54a18b2c2bcbcd7bd585670\";}','localhost'),('n9dt3il33cdpt68o3h4pmtltsv',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673306649,1673306669,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1673306669;s:5:\"token\";s:32:\"965c798258d4b6cbf89b23c613c2b38b\";}','localhost'),('oblv8983visv2101niuhathgkr',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673308433,1673308481,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1673308481;s:5:\"token\";s:32:\"25c1b2890a26eacbf06643bbd902bff8\";}','localhost'),('oqnvr4hnvumf1vogmhof0d6ou4',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673306421,1673306430,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1673306430;s:5:\"token\";s:32:\"0f7b7967aec61fbfddffe80ea930a3eb\";}','localhost'),('q95lltitvppdlvokcvj75bmpto',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673308499,1673308568,0,'csrf|a:2:{s:9:\"timestamp\";i:1673308568;s:5:\"token\";s:32:\"8cdf9e7ea932c88594263505a72716b3\";}username|s:6:\"msmith\";','localhost'),('t5asucsoocu2g4hm4j7tq6ob4d',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673306749,1673306882,0,'csrf|a:2:{s:9:\"timestamp\";i:1673306881;s:5:\"token\";s:32:\"2f4cdad597a908e2409724e64b69fa39\";}username|s:7:\"afinkel\";','localhost'),('tbdkhvpcmq0k7ffe4guv8vu3hq',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673308323,1673308356,0,'csrf|a:2:{s:9:\"timestamp\";i:1673308356;s:5:\"token\";s:32:\"8df4b4e865773dca1e9e71840d995ef3\";}username|s:6:\"mforan\";','localhost'),('tm9pbv1r1i3l5734c1ugns401l',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673307777,1673307825,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1673307825;s:5:\"token\";s:32:\"53ee8488bd6a4f53aa3db0e6e69c3882\";}','localhost'),('vgsllargfe8pcvvilrsko95hoc',21,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673306932,1673306985,0,'csrf|a:2:{s:9:\"timestamp\";i:1673306985;s:5:\"token\";s:32:\"6dfee6d7b9fcb042f0a355e40e9ee799\";}username|s:10:\"bbarnetson\";userId|i:21;','localhost'),('vlmmjd9stnej4mpieobf5r47vv',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673306624,1673306646,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1673306646;s:5:\"token\";s:32:\"b6c5fa24b6d1a090bfba73fa52c22b28\";}','localhost'),('vsrlitiir0v77uuh63vr2dctrm',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673308381,1673308432,0,'csrf|a:2:{s:9:\"timestamp\";i:1673308432;s:5:\"token\";s:32:\"5f32ab6688001c04e883363beb9e3b13\";}username|s:6:\"mpower\";','localhost'),('vu06eihn23nm0ahfsqv2sf2ah3',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1673307956,1673307966,0,'username|s:7:\"phudson\";csrf|a:2:{s:9:\"timestamp\";i:1673307966;s:5:\"token\";s:32:\"eef3f7c5b32b6bc823375f5d9caa414c\";}','localhost');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site` (
  `redirect` bigint(20) NOT NULL DEFAULT '0' COMMENT 'If not 0, redirect to the specified journal/conference/... site.',
  `primary_locale` varchar(14) NOT NULL COMMENT 'Primary locale for the site.',
  `min_password_length` smallint(6) NOT NULL DEFAULT '6',
  `installed_locales` varchar(1024) NOT NULL DEFAULT 'en_US' COMMENT 'Locales for which support has been installed.',
  `supported_locales` varchar(1024) DEFAULT NULL COMMENT 'Locales supported by the site (for hosted journals/conferences/...).',
  `original_style_file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (0,'en_US',6,'[\"en_US\",\"fr_CA\"]','[\"en_US\",\"fr_CA\"]',NULL);
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_settings` (
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_value` mediumtext,
  UNIQUE KEY `site_settings_pkey` (`setting_name`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES ('compressStatsLogs','','0'),('contactEmail','en_US','pkpadmin@mailinator.com'),('contactName','en_US','Open Monograph Press'),('contactName','fr_CA','Open Monograph Press'),('enableGeoUsageStats','','disabled'),('enableInstitutionUsageStats','','0'),('isSiteSushiPlatform','','0'),('isSushiApiPublic','','1'),('keepDailyUsageStats','','0'),('themePluginPath','','default');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spotlight_settings`
--

DROP TABLE IF EXISTS `spotlight_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spotlight_settings` (
  `spotlight_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)',
  UNIQUE KEY `spotlight_settings_pkey` (`spotlight_id`,`locale`,`setting_name`),
  KEY `spotlight_settings_id` (`spotlight_id`),
  CONSTRAINT `spotlight_settings_spotlight_id_foreign` FOREIGN KEY (`spotlight_id`) REFERENCES `spotlights` (`spotlight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES (1,1,13,19,'2023-01-09 23:25:05',0,0),(2,1,6,14,'2023-01-09 23:25:43',0,0),(3,2,13,20,'2023-01-09 23:27:53',0,0),(4,3,13,21,'2023-01-09 23:29:44',0,0),(5,4,13,22,'2023-01-09 23:30:33',0,0),(6,4,6,13,'2023-01-09 23:31:35',0,0),(7,4,10,15,'2023-01-09 23:31:53',0,0),(8,5,13,23,'2023-01-09 23:33:06',0,0),(9,5,6,14,'2023-01-09 23:34:13',0,0),(10,5,10,16,'2023-01-09 23:34:33',0,0),(11,5,12,17,'2023-01-09 23:34:40',0,0),(12,6,13,24,'2023-01-09 23:36:13',0,0),(13,6,3,3,'2023-01-09 23:36:39',0,1),(14,6,5,4,'2023-01-09 23:36:45',0,0),(15,6,5,6,'2023-01-09 23:36:51',1,0),(16,7,13,25,'2023-01-09 23:38:20',0,0),(17,7,6,13,'2023-01-09 23:39:07',0,0),(18,8,3,3,'2023-01-09 23:39:19',0,1),(19,9,13,26,'2023-01-09 23:40:21',0,0),(20,10,13,27,'2023-01-09 23:42:27',0,0),(21,11,13,28,'2023-01-09 23:42:55',0,0),(22,12,13,29,'2023-01-09 23:45:11',0,0),(23,13,13,30,'2023-01-09 23:46:44',0,0),(24,14,13,31,'2023-01-09 23:49:28',0,0),(25,14,6,13,'2023-01-09 23:50:35',0,0),(26,14,10,15,'2023-01-09 23:50:54',0,0),(27,14,12,18,'2023-01-09 23:51:01',0,0),(28,15,13,32,'2023-01-09 23:52:34',0,0),(29,16,13,33,'2023-01-09 23:53:50',0,0),(30,17,13,34,'2023-01-09 23:56:06',0,0);
/*!40000 ALTER TABLE `stage_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_page_settings`
--

DROP TABLE IF EXISTS `static_page_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_page_settings` (
  `static_page_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `static_page_settings_pkey` (`static_page_id`,`locale`,`setting_name`),
  KEY `static_page_settings_static_page_id` (`static_page_id`)
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
  `context_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  UNIQUE KEY `section_editors_pkey` (`context_id`,`assoc_id`,`assoc_type`,`user_id`),
  KEY `subeditor_submission_group_context_id` (`context_id`),
  KEY `subeditor_submission_group_user_id` (`user_id`),
  KEY `subeditor_submission_group_user_group_id` (`user_group_id`),
  KEY `subeditor_submission_group_assoc_id` (`assoc_id`,`assoc_type`),
  CONSTRAINT `section_editors_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `subeditor_submission_group_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `subeditor_submission_group_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subeditor_submission_group`
--

LOCK TABLES `subeditor_submission_group` WRITE;
/*!40000 ALTER TABLE `subeditor_submission_group` DISABLE KEYS */;
INSERT INTO `subeditor_submission_group` VALUES (1,0,530,3,3);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_chapter_authors`
--

LOCK TABLES `submission_chapter_authors` WRITE;
/*!40000 ALTER TABLE `submission_chapter_authors` DISABLE KEYS */;
INSERT INTO `submission_chapter_authors` VALUES (1,1,0,0.00),(1,2,0,0.00),(1,3,0,0.00),(5,4,0,0.00),(6,5,0,0.00),(7,6,0,0.00),(8,7,0,0.00),(9,7,0,1.00),(11,8,0,0.00),(11,9,0,0.00),(11,10,0,0.00),(11,11,0,0.00),(11,12,0,0.00),(12,13,0,0.00),(13,14,0,0.00),(14,15,0,0.00),(15,16,0,0.00),(16,17,0,0.00),(16,18,0,0.00),(16,19,0,0.00),(16,20,0,0.00),(16,21,0,0.00),(16,22,0,0.00),(17,23,0,0.00),(18,24,0,0.00),(19,25,0,0.00),(20,26,0,0.00),(21,27,0,0.00),(22,28,0,0.00),(23,29,0,0.00),(24,30,0,0.00),(25,31,0,0.00),(26,32,0,0.00),(27,33,0,0.00),(28,34,0,0.00),(29,35,0,0.00),(30,36,0,0.00),(31,37,0,0.00),(31,38,0,0.00),(31,39,0,0.00),(31,40,0,0.00),(31,41,0,0.00),(31,42,0,0.00),(31,43,0,0.00),(31,44,0,0.00),(31,45,0,0.00),(32,46,0,0.00),(32,47,0,0.00),(35,48,0,0.00),(36,48,0,1.00),(37,49,0,0.00),(38,49,0,1.00),(39,50,0,0.00),(40,50,0,1.00),(42,51,0,0.00),(43,52,0,0.00),(44,53,0,0.00),(45,54,0,0.00),(45,57,0,0.00),(46,55,0,0.00),(47,56,0,0.00),(48,58,0,0.00),(48,59,0,0.00),(48,60,0,0.00),(49,61,0,0.00),(49,62,0,0.00),(49,63,0,0.00),(49,64,0,0.00),(49,65,0,0.00),(50,67,0,1.00),(50,68,0,1.00),(51,66,0,0.00),(52,67,0,0.00),(52,68,0,0.00),(53,69,0,1.00),(54,69,0,0.00),(55,70,0,1.00),(56,70,0,0.00),(57,71,0,0.00);
/*!40000 ALTER TABLE `submission_chapter_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_chapter_settings`
--

DROP TABLE IF EXISTS `submission_chapter_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_chapter_settings` (
  `chapter_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `submission_chapter_settings_pkey` (`chapter_id`,`locale`,`setting_name`),
  KEY `submission_chapter_settings_chapter_id` (`chapter_id`),
  CONSTRAINT `submission_chapter_settings_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_chapter_settings`
--

LOCK TABLES `submission_chapter_settings` WRITE;
/*!40000 ALTER TABLE `submission_chapter_settings` DISABLE KEYS */;
INSERT INTO `submission_chapter_settings` VALUES (1,'','datePublished',NULL,'string'),(1,'','isPageEnabled',NULL,'string'),(1,'','licenseUrl',NULL,'string'),(1,'','pages','','string'),(1,'en_US','abstract','','string'),(1,'en_US','subtitle','','string'),(1,'en_US','title','Choosing the Future','string'),(1,'fr_CA','abstract','','string'),(1,'fr_CA','subtitle','','string'),(1,'fr_CA','title','','string'),(2,'','datePublished',NULL,'string'),(2,'','isPageEnabled',NULL,'string'),(2,'','licenseUrl',NULL,'string'),(2,'','pages','','string'),(2,'en_US','abstract','','string'),(2,'en_US','subtitle','','string'),(2,'en_US','title','Axioms','string'),(2,'fr_CA','abstract','','string'),(2,'fr_CA','subtitle','','string'),(2,'fr_CA','title','','string'),(3,'','datePublished',NULL,'string'),(3,'','isPageEnabled',NULL,'string'),(3,'','licenseUrl',NULL,'string'),(3,'','pages','','string'),(3,'en_US','abstract','','string'),(3,'en_US','subtitle','','string'),(3,'en_US','title','Paradigm Shift','string'),(3,'fr_CA','abstract','','string'),(3,'fr_CA','subtitle','','string'),(3,'fr_CA','title','','string'),(4,'','datePublished',NULL,'string'),(4,'','isPageEnabled',NULL,'string'),(4,'','licenseUrl','','string'),(4,'','pages','','string'),(4,'en_US','abstract','','string'),(4,'en_US','subtitle','','string'),(4,'en_US','title','Critical History in Western Canada 1900–2000','string'),(4,'fr_CA','abstract','','string'),(4,'fr_CA','subtitle','','string'),(4,'fr_CA','title','','string'),(5,'','datePublished',NULL,'string'),(5,'','isPageEnabled',NULL,'string'),(5,'','licenseUrl','','string'),(5,'','pages','','string'),(5,'en_US','abstract','','string'),(5,'en_US','subtitle','','string'),(5,'en_US','title','Vernacular Currents in Western Canadian Historiography: The Passion and Prose of Katherine Hughes, F.G. Roe, and Roy Ito','string'),(5,'fr_CA','abstract','','string'),(5,'fr_CA','subtitle','','string'),(5,'fr_CA','title','','string'),(6,'','datePublished',NULL,'string'),(6,'','isPageEnabled',NULL,'string'),(6,'','licenseUrl','','string'),(6,'','pages','','string'),(6,'en_US','abstract','','string'),(6,'en_US','subtitle','','string'),(6,'en_US','title','Cree Intellectual Traditions in History','string'),(6,'fr_CA','abstract','','string'),(6,'fr_CA','subtitle','','string'),(6,'fr_CA','title','','string'),(7,'','datePublished',NULL,'string'),(7,'','isPageEnabled',NULL,'string'),(7,'','licenseUrl','','string'),(7,'','pages','','string'),(7,'en_US','abstract','','string'),(7,'en_US','subtitle','','string'),(7,'en_US','title','Visualizing Space, Race, and History in the North: Photographic Narratives of the Athabasca-Mackenzie River Basin','string'),(7,'fr_CA','abstract','','string'),(7,'fr_CA','subtitle','','string'),(7,'fr_CA','title','','string'),(8,'','datePublished',NULL,'string'),(8,'','isPageEnabled',NULL,'string'),(8,'','licenseUrl',NULL,'string'),(8,'','pages','','string'),(8,'en_US','abstract','','string'),(8,'en_US','subtitle','','string'),(8,'en_US','title','Introduction','string'),(8,'fr_CA','abstract','','string'),(8,'fr_CA','subtitle','','string'),(8,'fr_CA','title','','string'),(9,'','datePublished',NULL,'string'),(9,'','isPageEnabled',NULL,'string'),(9,'','licenseUrl',NULL,'string'),(9,'','pages','','string'),(9,'en_US','abstract','','string'),(9,'en_US','subtitle','','string'),(9,'en_US','title','Part One. Employment Relationships in Canada','string'),(9,'fr_CA','abstract','','string'),(9,'fr_CA','subtitle','','string'),(9,'fr_CA','title','','string'),(10,'','datePublished',NULL,'string'),(10,'','isPageEnabled',NULL,'string'),(10,'','licenseUrl',NULL,'string'),(10,'','pages','','string'),(10,'en_US','abstract','','string'),(10,'en_US','subtitle','','string'),(10,'en_US','title','Part Two. Preventing Workplace Injury','string'),(10,'fr_CA','abstract','','string'),(10,'fr_CA','subtitle','','string'),(10,'fr_CA','title','','string'),(11,'','datePublished',NULL,'string'),(11,'','isPageEnabled',NULL,'string'),(11,'','licenseUrl',NULL,'string'),(11,'','pages','','string'),(11,'en_US','abstract','','string'),(11,'en_US','subtitle','','string'),(11,'en_US','title','Part Three. Critique of OHS in Canada','string'),(11,'fr_CA','abstract','','string'),(11,'fr_CA','subtitle','','string'),(11,'fr_CA','title','','string'),(12,'','datePublished',NULL,'string'),(12,'','isPageEnabled',NULL,'string'),(12,'','licenseUrl',NULL,'string'),(12,'','pages','','string'),(12,'en_US','abstract','','string'),(12,'en_US','subtitle','','string'),(12,'en_US','title','Part Four. Political Economy of Preventing Workplace Injury','string'),(12,'fr_CA','abstract','','string'),(12,'fr_CA','subtitle','','string'),(12,'fr_CA','title','','string'),(13,'','datePublished',NULL,'string'),(13,'','isPageEnabled',NULL,'string'),(13,'','licenseUrl',NULL,'string'),(13,'','pages','','string'),(13,'en_US','abstract','','string'),(13,'en_US','subtitle','','string'),(13,'en_US','title','Introduction: Contexts of Popular Culture','string'),(13,'fr_CA','abstract','','string'),(13,'fr_CA','subtitle','','string'),(13,'fr_CA','title','','string'),(14,'','datePublished',NULL,'string'),(14,'','isPageEnabled',NULL,'string'),(14,'','licenseUrl',NULL,'string'),(14,'','pages','','string'),(14,'en_US','abstract','','string'),(14,'en_US','subtitle','','string'),(14,'en_US','title','Chapter 1. A Future for Media Studies: Cultural Labour, Cultural Relations, Cultural Politics','string'),(14,'fr_CA','abstract','','string'),(14,'fr_CA','subtitle','','string'),(14,'fr_CA','title','','string'),(15,'','datePublished',NULL,'string'),(15,'','isPageEnabled',NULL,'string'),(15,'','licenseUrl',NULL,'string'),(15,'','pages','','string'),(15,'en_US','abstract','','string'),(15,'en_US','subtitle','','string'),(15,'en_US','title','Chapter 2. Log On, Goof Off, and Look Up: Facebook and the Rhythms of Canadian Internet Use','string'),(15,'fr_CA','abstract','','string'),(15,'fr_CA','subtitle','','string'),(15,'fr_CA','title','','string'),(16,'','datePublished',NULL,'string'),(16,'','isPageEnabled',NULL,'string'),(16,'','licenseUrl',NULL,'string'),(16,'','pages','','string'),(16,'en_US','abstract','','string'),(16,'en_US','subtitle','','string'),(16,'en_US','title','Chapter 3. Hawkers and Public Space: Free Commuter Newspapers in Canada','string'),(16,'fr_CA','abstract','','string'),(16,'fr_CA','subtitle','','string'),(16,'fr_CA','title','','string'),(17,'','datePublished',NULL,'string'),(17,'','isPageEnabled',NULL,'string'),(17,'','licenseUrl',NULL,'string'),(17,'','pages','','string'),(17,'en_US','abstract','','string'),(17,'en_US','subtitle','','string'),(17,'en_US','title','Prologue','string'),(17,'fr_CA','abstract','','string'),(17,'fr_CA','subtitle','','string'),(17,'fr_CA','title','','string'),(18,'','datePublished',NULL,'string'),(18,'','isPageEnabled',NULL,'string'),(18,'','licenseUrl',NULL,'string'),(18,'','pages','','string'),(18,'en_US','abstract','','string'),(18,'en_US','subtitle','','string'),(18,'en_US','title','Chapter 1: The First Five Years: 1867-1872','string'),(18,'fr_CA','abstract','','string'),(18,'fr_CA','subtitle','','string'),(18,'fr_CA','title','','string'),(19,'','datePublished',NULL,'string'),(19,'','isPageEnabled',NULL,'string'),(19,'','licenseUrl',NULL,'string'),(19,'','pages','','string'),(19,'en_US','abstract','','string'),(19,'en_US','subtitle','','string'),(19,'en_US','title','Chapter 2: Free Trade or \"Freedom\": 1911','string'),(19,'fr_CA','abstract','','string'),(19,'fr_CA','subtitle','','string'),(19,'fr_CA','title','','string'),(20,'','datePublished',NULL,'string'),(20,'','isPageEnabled',NULL,'string'),(20,'','licenseUrl',NULL,'string'),(20,'','pages','','string'),(20,'en_US','abstract','','string'),(20,'en_US','subtitle','','string'),(20,'en_US','title','Chapter 3: Castro, Nukes & the Cold War: 1953-1968','string'),(20,'fr_CA','abstract','','string'),(20,'fr_CA','subtitle','','string'),(20,'fr_CA','title','','string'),(21,'','datePublished',NULL,'string'),(21,'','isPageEnabled',NULL,'string'),(21,'','licenseUrl',NULL,'string'),(21,'','pages','','string'),(21,'en_US','abstract','','string'),(21,'en_US','subtitle','','string'),(21,'en_US','title','Chapter 4: Enter the Intellect: 1968-1984','string'),(21,'fr_CA','abstract','','string'),(21,'fr_CA','subtitle','','string'),(21,'fr_CA','title','','string'),(22,'','datePublished',NULL,'string'),(22,'','isPageEnabled',NULL,'string'),(22,'','licenseUrl',NULL,'string'),(22,'','pages','','string'),(22,'en_US','abstract','','string'),(22,'en_US','subtitle','','string'),(22,'en_US','title','Epilogue','string'),(22,'fr_CA','abstract','','string'),(22,'fr_CA','subtitle','','string'),(22,'fr_CA','title','','string'),(23,'','datePublished',NULL,'string'),(23,'','isPageEnabled',NULL,'string'),(23,'','licenseUrl',NULL,'string'),(23,'','pages','','string'),(23,'en_US','abstract','','string'),(23,'en_US','subtitle','','string'),(23,'en_US','title','Identify: Understanding Your Information Need','string'),(23,'fr_CA','abstract','','string'),(23,'fr_CA','subtitle','','string'),(23,'fr_CA','title','','string'),(24,'','datePublished',NULL,'string'),(24,'','isPageEnabled',NULL,'string'),(24,'','licenseUrl',NULL,'string'),(24,'','pages','','string'),(24,'en_US','abstract','','string'),(24,'en_US','subtitle','','string'),(24,'en_US','title','Scope: Knowing What Is Available','string'),(24,'fr_CA','abstract','','string'),(24,'fr_CA','subtitle','','string'),(24,'fr_CA','title','','string'),(25,'','datePublished',NULL,'string'),(25,'','isPageEnabled',NULL,'string'),(25,'','licenseUrl',NULL,'string'),(25,'','pages','','string'),(25,'en_US','abstract','','string'),(25,'en_US','subtitle','','string'),(25,'en_US','title','Plan: Developing Research Strategies','string'),(25,'fr_CA','abstract','','string'),(25,'fr_CA','subtitle','','string'),(25,'fr_CA','title','','string'),(26,'','datePublished',NULL,'string'),(26,'','isPageEnabled',NULL,'string'),(26,'','licenseUrl',NULL,'string'),(26,'','pages','','string'),(26,'en_US','abstract','','string'),(26,'en_US','subtitle','','string'),(26,'en_US','title','Gather: Finding What You Need','string'),(26,'fr_CA','abstract','','string'),(26,'fr_CA','subtitle','','string'),(26,'fr_CA','title','','string'),(27,'','datePublished',NULL,'string'),(27,'','isPageEnabled',NULL,'string'),(27,'','licenseUrl',NULL,'string'),(27,'','pages','','string'),(27,'en_US','abstract','','string'),(27,'en_US','subtitle','','string'),(27,'en_US','title','Introduction','string'),(27,'fr_CA','abstract','','string'),(27,'fr_CA','subtitle','','string'),(27,'fr_CA','title','','string'),(28,'','datePublished',NULL,'string'),(28,'','isPageEnabled',NULL,'string'),(28,'','licenseUrl',NULL,'string'),(28,'','pages','','string'),(28,'en_US','abstract','','string'),(28,'en_US','subtitle','','string'),(28,'en_US','title','Chapter 1: Interactions Affording Distance Science Education','string'),(28,'fr_CA','abstract','','string'),(28,'fr_CA','subtitle','','string'),(28,'fr_CA','title','','string'),(29,'','datePublished',NULL,'string'),(29,'','isPageEnabled',NULL,'string'),(29,'','licenseUrl',NULL,'string'),(29,'','pages','','string'),(29,'en_US','abstract','','string'),(29,'en_US','subtitle','','string'),(29,'en_US','title','Chapter 2: Learning Science at a Distance: Instructional Dialogues and Resources','string'),(29,'fr_CA','abstract','','string'),(29,'fr_CA','subtitle','','string'),(29,'fr_CA','title','','string'),(30,'','datePublished',NULL,'string'),(30,'','isPageEnabled',NULL,'string'),(30,'','licenseUrl',NULL,'string'),(30,'','pages','','string'),(30,'en_US','abstract','','string'),(30,'en_US','subtitle','','string'),(30,'en_US','title','Chapter 3: Leadership Strategies for Coordinating Distance Education Instructional Development Teams','string'),(30,'fr_CA','abstract','','string'),(30,'fr_CA','subtitle','','string'),(30,'fr_CA','title','','string'),(31,'','datePublished',NULL,'string'),(31,'','isPageEnabled',NULL,'string'),(31,'','licenseUrl',NULL,'string'),(31,'','pages','','string'),(31,'en_US','abstract','','string'),(31,'en_US','subtitle','','string'),(31,'en_US','title','Chapter 4: Toward New Models of Flexible Education to Enhance Quality in Australian Higher Education','string'),(31,'fr_CA','abstract','','string'),(31,'fr_CA','subtitle','','string'),(31,'fr_CA','title','','string'),(32,'','datePublished',NULL,'string'),(32,'','isPageEnabled',NULL,'string'),(32,'','licenseUrl',NULL,'string'),(32,'','pages','','string'),(32,'en_US','abstract','','string'),(32,'en_US','subtitle','','string'),(32,'en_US','title','Internet, openness and the future of the information society in LAC','string'),(32,'fr_CA','abstract','','string'),(32,'fr_CA','subtitle','','string'),(32,'fr_CA','title','','string'),(33,'','datePublished',NULL,'string'),(33,'','isPageEnabled',NULL,'string'),(33,'','licenseUrl',NULL,'string'),(33,'','pages','','string'),(33,'en_US','abstract','','string'),(33,'en_US','subtitle','','string'),(33,'en_US','title','Imagining the Internet: Open, closed or in between?','string'),(33,'fr_CA','abstract','','string'),(33,'fr_CA','subtitle','','string'),(33,'fr_CA','title','','string'),(34,'','datePublished',NULL,'string'),(34,'','isPageEnabled',NULL,'string'),(34,'','licenseUrl',NULL,'string'),(34,'','pages','','string'),(34,'en_US','abstract','','string'),(34,'en_US','subtitle','','string'),(34,'en_US','title','The internet in LAC will remain free, public and open over the next 10 years','string'),(34,'fr_CA','abstract','','string'),(34,'fr_CA','subtitle','','string'),(34,'fr_CA','title','','string'),(35,'','datePublished',NULL,'string'),(35,'','isPageEnabled',NULL,'string'),(35,'','licenseUrl',NULL,'string'),(35,'','pages','','string'),(35,'en_US','abstract','','string'),(35,'en_US','subtitle','','string'),(35,'en_US','title','Free Internet?','string'),(35,'fr_CA','abstract','','string'),(35,'fr_CA','subtitle','','string'),(35,'fr_CA','title','','string'),(36,'','datePublished',NULL,'string'),(36,'','isPageEnabled',NULL,'string'),(36,'','licenseUrl',NULL,'string'),(36,'','pages','','string'),(36,'en_US','abstract','','string'),(36,'en_US','subtitle','','string'),(36,'en_US','title','Risks and challenges for freedom of expression on the internet','string'),(36,'fr_CA','abstract','','string'),(36,'fr_CA','subtitle','','string'),(36,'fr_CA','title','','string'),(37,'','datePublished',NULL,'string'),(37,'','isPageEnabled',NULL,'string'),(37,'','licenseUrl',NULL,'string'),(37,'','pages','','string'),(37,'en_US','abstract','','string'),(37,'en_US','subtitle','','string'),(37,'en_US','title','Introduction','string'),(37,'fr_CA','abstract','','string'),(37,'fr_CA','subtitle','','string'),(37,'fr_CA','title','','string'),(38,'','datePublished',NULL,'string'),(38,'','isPageEnabled',NULL,'string'),(38,'','licenseUrl',NULL,'string'),(38,'','pages','','string'),(38,'en_US','abstract','','string'),(38,'en_US','subtitle','','string'),(38,'en_US','title','CHAPTER ONE: Where the Buffalo Roamed','string'),(38,'fr_CA','abstract','','string'),(38,'fr_CA','subtitle','','string'),(38,'fr_CA','title','','string'),(39,'','datePublished',NULL,'string'),(39,'','isPageEnabled',NULL,'string'),(39,'','licenseUrl',NULL,'string'),(39,'','pages','','string'),(39,'en_US','abstract','','string'),(39,'en_US','subtitle','','string'),(39,'en_US','title','CHAPTER TWO: Bison Conservation and Buffalo National Park','string'),(39,'fr_CA','abstract','','string'),(39,'fr_CA','subtitle','','string'),(39,'fr_CA','title','','string'),(40,'','datePublished',NULL,'string'),(40,'','isPageEnabled',NULL,'string'),(40,'','licenseUrl',NULL,'string'),(40,'','pages','','string'),(40,'en_US','abstract','','string'),(40,'en_US','subtitle','','string'),(40,'en_US','title','CHAPTER THREE: A Well-Run Ranch','string'),(40,'fr_CA','abstract','','string'),(40,'fr_CA','subtitle','','string'),(40,'fr_CA','title','','string'),(41,'','datePublished',NULL,'string'),(41,'','isPageEnabled',NULL,'string'),(41,'','licenseUrl',NULL,'string'),(41,'','pages','','string'),(41,'en_US','abstract','','string'),(41,'en_US','subtitle','','string'),(41,'en_US','title','CHAPTER FOUR: Zookeepers and Animal Breeders','string'),(41,'fr_CA','abstract','','string'),(41,'fr_CA','subtitle','','string'),(41,'fr_CA','title','','string'),(42,'','datePublished',NULL,'string'),(42,'','isPageEnabled',NULL,'string'),(42,'','licenseUrl',NULL,'string'),(42,'','pages','','string'),(42,'en_US','abstract','','string'),(42,'en_US','subtitle','','string'),(42,'en_US','title','CHAPTER FIVE: \"Evolving the Arctic Cow\"','string'),(42,'fr_CA','abstract','','string'),(42,'fr_CA','subtitle','','string'),(42,'fr_CA','title','','string'),(43,'','datePublished',NULL,'string'),(43,'','isPageEnabled',NULL,'string'),(43,'','licenseUrl',NULL,'string'),(43,'','pages','','string'),(43,'en_US','abstract','','string'),(43,'en_US','subtitle','','string'),(43,'en_US','title','CONCLUSION: The Forgotten Park','string'),(43,'fr_CA','abstract','','string'),(43,'fr_CA','subtitle','','string'),(43,'fr_CA','title','','string'),(44,'','datePublished',NULL,'string'),(44,'','isPageEnabled',NULL,'string'),(44,'','licenseUrl',NULL,'string'),(44,'','pages','','string'),(44,'en_US','abstract','','string'),(44,'en_US','subtitle','','string'),(44,'en_US','title','Bibliography','string'),(44,'fr_CA','abstract','','string'),(44,'fr_CA','subtitle','','string'),(44,'fr_CA','title','','string'),(45,'','datePublished',NULL,'string'),(45,'','isPageEnabled',NULL,'string'),(45,'','licenseUrl',NULL,'string'),(45,'','pages','','string'),(45,'en_US','abstract','','string'),(45,'en_US','subtitle','','string'),(45,'en_US','title','Index','string'),(45,'fr_CA','abstract','','string'),(45,'fr_CA','subtitle','','string'),(45,'fr_CA','title','','string'),(46,'','datePublished',NULL,'string'),(46,'','isPageEnabled',NULL,'string'),(46,'','licenseUrl',NULL,'string'),(46,'','pages','','string'),(46,'en_US','abstract','','string'),(46,'en_US','subtitle','','string'),(46,'en_US','title','Introduction','string'),(46,'fr_CA','abstract','','string'),(46,'fr_CA','subtitle','','string'),(46,'fr_CA','title','','string'),(47,'','datePublished',NULL,'string'),(47,'','isPageEnabled',NULL,'string'),(47,'','licenseUrl',NULL,'string'),(47,'','pages','','string'),(47,'en_US','abstract','','string'),(47,'en_US','subtitle','','string'),(47,'en_US','title','Poems','string'),(47,'fr_CA','abstract','','string'),(47,'fr_CA','subtitle','','string'),(47,'fr_CA','title','','string'),(48,'','datePublished',NULL,'string'),(48,'','isPageEnabled',NULL,'string'),(48,'','licenseUrl',NULL,'string'),(48,'','pages','','string'),(48,'en_US','abstract','','string'),(48,'en_US','subtitle','','string'),(48,'en_US','title','Catalyzing Access through Social and Technical Innovation','string'),(48,'fr_CA','abstract','','string'),(48,'fr_CA','subtitle','','string'),(48,'fr_CA','title','','string'),(49,'','datePublished',NULL,'string'),(49,'','isPageEnabled',NULL,'string'),(49,'','licenseUrl',NULL,'string'),(49,'','pages','','string'),(49,'en_US','abstract','','string'),(49,'en_US','subtitle','','string'),(49,'en_US','title','Catalyzing Access via Telecommunications Policy','string'),(49,'fr_CA','abstract','','string'),(49,'fr_CA','subtitle','','string'),(49,'fr_CA','title','','string'),(50,'','datePublished',NULL,'string'),(50,'','isPageEnabled',NULL,'string'),(50,'','licenseUrl',NULL,'string'),(50,'','pages','','string'),(50,'en_US','abstract','','string'),(50,'en_US','subtitle','','string'),(50,'en_US','title','Access to Knowledge as a New Paradigm for Research on ICTs and Intellectual Property','string'),(50,'fr_CA','abstract','','string'),(50,'fr_CA','subtitle','','string'),(50,'fr_CA','title','','string'),(51,'','datePublished',NULL,'string'),(51,'','isPageEnabled',NULL,'string'),(51,'','licenseUrl',NULL,'string'),(51,'','pages','','string'),(51,'en_US','abstract','','string'),(51,'en_US','subtitle','','string'),(51,'en_US','title','Current State of Mobile Learning','string'),(51,'fr_CA','abstract','','string'),(51,'fr_CA','subtitle','','string'),(51,'fr_CA','title','','string'),(52,'','datePublished',NULL,'string'),(52,'','isPageEnabled',NULL,'string'),(52,'','licenseUrl',NULL,'string'),(52,'','pages','','string'),(52,'en_US','abstract','','string'),(52,'en_US','subtitle','','string'),(52,'en_US','title','A Model for Framing Mobile Learning','string'),(52,'fr_CA','abstract','','string'),(52,'fr_CA','subtitle','','string'),(52,'fr_CA','title','','string'),(53,'','datePublished',NULL,'string'),(53,'','isPageEnabled',NULL,'string'),(53,'','licenseUrl',NULL,'string'),(53,'','pages','','string'),(53,'en_US','abstract','','string'),(53,'en_US','subtitle','','string'),(53,'en_US','title','Mobile Distance Learning with PDAs: Development and Testing of Pedagogical and System Solutions Supporting Mobile Distance Learners','string'),(53,'fr_CA','abstract','','string'),(53,'fr_CA','subtitle','','string'),(53,'fr_CA','title','','string'),(54,'','datePublished',NULL,'string'),(54,'','isPageEnabled',NULL,'string'),(54,'','licenseUrl',NULL,'string'),(54,'','pages','','string'),(54,'en_US','abstract','','string'),(54,'en_US','subtitle','','string'),(54,'en_US','title','Chapter 1: Mind Control—Internal or External?','string'),(54,'fr_CA','abstract','','string'),(54,'fr_CA','subtitle','','string'),(54,'fr_CA','title','','string'),(55,'','datePublished',NULL,'string'),(55,'','isPageEnabled',NULL,'string'),(55,'','licenseUrl',NULL,'string'),(55,'','pages','','string'),(55,'en_US','abstract','','string'),(55,'en_US','subtitle','','string'),(55,'en_US','title','Chapter 2: Classical Music and the Classical Mind','string'),(55,'fr_CA','abstract','','string'),(55,'fr_CA','subtitle','','string'),(55,'fr_CA','title','','string'),(56,'','datePublished',NULL,'string'),(56,'','isPageEnabled',NULL,'string'),(56,'','licenseUrl',NULL,'string'),(56,'','pages','','string'),(56,'en_US','abstract','','string'),(56,'en_US','subtitle','','string'),(56,'en_US','title','Chapter 3: Situated Cognition and Bricolage','string'),(56,'fr_CA','abstract','','string'),(56,'fr_CA','subtitle','','string'),(56,'fr_CA','title','','string'),(57,'','datePublished',NULL,'string'),(57,'','isPageEnabled',NULL,'string'),(57,'','licenseUrl',NULL,'string'),(57,'','pages','','string'),(57,'en_US','abstract','','string'),(57,'en_US','subtitle','','string'),(57,'en_US','title','Chapter 4: Braitenberg’s Vehicle 2','string'),(57,'fr_CA','abstract','','string'),(57,'fr_CA','subtitle','','string'),(57,'fr_CA','title','','string'),(58,'','datePublished',NULL,'string'),(58,'','isPageEnabled',NULL,'string'),(58,'','licenseUrl',NULL,'string'),(58,'','pages','','string'),(58,'en_US','abstract','','string'),(58,'en_US','subtitle','','string'),(58,'en_US','title','Setting the Stage','string'),(58,'fr_CA','abstract','','string'),(58,'fr_CA','subtitle','','string'),(58,'fr_CA','title','','string'),(59,'','datePublished',NULL,'string'),(59,'','isPageEnabled',NULL,'string'),(59,'','licenseUrl',NULL,'string'),(59,'','pages','','string'),(59,'en_US','abstract','','string'),(59,'en_US','subtitle','','string'),(59,'en_US','title','Going It Alone, 1945-1954','string'),(59,'fr_CA','abstract','','string'),(59,'fr_CA','subtitle','','string'),(59,'fr_CA','title','','string'),(60,'','datePublished',NULL,'string'),(60,'','isPageEnabled',NULL,'string'),(60,'','licenseUrl',NULL,'string'),(60,'','pages','','string'),(60,'en_US','abstract','','string'),(60,'en_US','subtitle','','string'),(60,'en_US','title','Establishing the Pattern, 1955-1962','string'),(60,'fr_CA','abstract','','string'),(60,'fr_CA','subtitle','','string'),(60,'fr_CA','title','','string'),(61,'','datePublished',NULL,'string'),(61,'','isPageEnabled',NULL,'string'),(61,'','licenseUrl',NULL,'string'),(61,'','pages','','string'),(61,'en_US','abstract','','string'),(61,'en_US','subtitle','','string'),(61,'en_US','title','Foreward','string'),(61,'fr_CA','abstract','','string'),(61,'fr_CA','subtitle','','string'),(61,'fr_CA','title','','string'),(62,'','datePublished',NULL,'string'),(62,'','isPageEnabled',NULL,'string'),(62,'','licenseUrl',NULL,'string'),(62,'','pages','','string'),(62,'en_US','abstract','','string'),(62,'en_US','subtitle','','string'),(62,'en_US','title','Preface','string'),(62,'fr_CA','abstract','','string'),(62,'fr_CA','subtitle','','string'),(62,'fr_CA','title','','string'),(63,'','datePublished',NULL,'string'),(63,'','isPageEnabled',NULL,'string'),(63,'','licenseUrl',NULL,'string'),(63,'','pages','','string'),(63,'en_US','abstract','','string'),(63,'en_US','subtitle','','string'),(63,'en_US','title','The Case Studies','string'),(63,'fr_CA','abstract','','string'),(63,'fr_CA','subtitle','','string'),(63,'fr_CA','title','','string'),(64,'','datePublished',NULL,'string'),(64,'','isPageEnabled',NULL,'string'),(64,'','licenseUrl',NULL,'string'),(64,'','pages','','string'),(64,'en_US','abstract','','string'),(64,'en_US','subtitle','','string'),(64,'en_US','title','Conclusion','string'),(64,'fr_CA','abstract','','string'),(64,'fr_CA','subtitle','','string'),(64,'fr_CA','title','','string'),(65,'','datePublished',NULL,'string'),(65,'','isPageEnabled',NULL,'string'),(65,'','licenseUrl',NULL,'string'),(65,'','pages','','string'),(65,'en_US','abstract','','string'),(65,'en_US','subtitle','','string'),(65,'en_US','title','Bibliography','string'),(65,'fr_CA','abstract','','string'),(65,'fr_CA','subtitle','','string'),(65,'fr_CA','title','','string'),(66,'','datePublished',NULL,'string'),(66,'','isPageEnabled',NULL,'string'),(66,'','licenseUrl',NULL,'string'),(66,'','pages','','string'),(66,'en_US','abstract','','string'),(66,'en_US','subtitle','','string'),(66,'en_US','title','Preface','string'),(66,'fr_CA','abstract','','string'),(66,'fr_CA','subtitle','','string'),(66,'fr_CA','title','','string'),(67,'','datePublished',NULL,'string'),(67,'','isPageEnabled',NULL,'string'),(67,'','licenseUrl',NULL,'string'),(67,'','pages','','string'),(67,'en_US','abstract','','string'),(67,'en_US','subtitle','','string'),(67,'en_US','title','Introduction','string'),(67,'fr_CA','abstract','','string'),(67,'fr_CA','subtitle','','string'),(67,'fr_CA','title','','string'),(68,'','datePublished',NULL,'string'),(68,'','isPageEnabled',NULL,'string'),(68,'','licenseUrl',NULL,'string'),(68,'','pages','','string'),(68,'en_US','abstract','','string'),(68,'en_US','subtitle','','string'),(68,'en_US','title','The Emergence of Open Development in a Network Society','string'),(68,'fr_CA','abstract','','string'),(68,'fr_CA','subtitle','','string'),(68,'fr_CA','title','','string'),(69,'','datePublished',NULL,'string'),(69,'','isPageEnabled',NULL,'string'),(69,'','licenseUrl',NULL,'string'),(69,'','pages','','string'),(69,'en_US','abstract','','string'),(69,'en_US','subtitle','','string'),(69,'en_US','title','Enacting Openness in ICT4D Research','string'),(69,'fr_CA','abstract','','string'),(69,'fr_CA','subtitle','','string'),(69,'fr_CA','title','','string'),(70,'','datePublished',NULL,'string'),(70,'','isPageEnabled',NULL,'string'),(70,'','licenseUrl',NULL,'string'),(70,'','pages','','string'),(70,'en_US','abstract','','string'),(70,'en_US','subtitle','','string'),(70,'en_US','title','Transparency and Development: Ethical Consumption through Web 2.0 and the Internet of Things','string'),(70,'fr_CA','abstract','','string'),(70,'fr_CA','subtitle','','string'),(70,'fr_CA','title','','string'),(71,'','datePublished',NULL,'string'),(71,'','isPageEnabled',NULL,'string'),(71,'','licenseUrl',NULL,'string'),(71,'','pages','','string'),(71,'en_US','abstract','','string'),(71,'en_US','subtitle','','string'),(71,'en_US','title','Open Educational Resources: Opportunities and Challenges for the Developing World','string'),(71,'fr_CA','abstract','','string'),(71,'fr_CA','subtitle','','string'),(71,'fr_CA','title','','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_comments`
--

LOCK TABLES `submission_comments` WRITE;
/*!40000 ALTER TABLE `submission_comments` DISABLE KEYS */;
INSERT INTO `submission_comments` VALUES (1,1,4096,11,10,10,'','<p>I recommend that the author revise this submission.</p>','2023-01-09 23:43:56',NULL,1),(2,1,4096,11,11,12,'','<p>I recommend that the author resubmit this submission.</p>','2023-01-09 23:44:07',NULL,1),(3,1,4096,12,13,8,'','<p>I recommend declining this submission.</p>','2023-01-09 23:46:06',NULL,1),(4,1,4096,13,16,10,'','<p>I recommend requiring revisions.</p>','2023-01-09 23:47:56',NULL,1),(5,1,4096,13,18,12,'','<p>I recommend resubmitting.</p>','2023-01-09 23:48:09',NULL,1),(6,1,4096,16,21,10,'','<p>I recommend that the author revise this submission.</p>','2023-01-09 23:54:53',NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_revisions`
--

LOCK TABLES `submission_file_revisions` WRITE;
/*!40000 ALTER TABLE `submission_file_revisions` DISABLE KEYS */;
INSERT INTO `submission_file_revisions` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,3),(5,5,2),(6,6,1),(7,7,4),(8,8,5),(9,9,6),(10,10,7),(12,12,6),(13,13,7),(14,14,5),(15,15,4),(16,16,9),(17,17,10),(18,18,11),(19,19,12),(20,20,13),(21,21,14),(22,22,15),(23,23,16),(24,24,17),(25,25,17),(26,26,15),(27,27,16),(28,28,14),(29,29,18),(30,30,19),(31,31,20),(32,32,21),(33,33,22),(34,34,23),(35,35,23),(36,36,22),(37,37,21),(38,38,20),(39,39,19),(40,40,18),(41,41,23),(42,42,24),(43,43,25),(44,44,26),(45,45,27),(46,46,27),(47,47,25),(48,48,26),(49,49,24),(50,50,28),(51,51,29),(52,52,30),(53,53,31),(54,54,32),(55,55,32),(56,56,30),(57,57,28),(58,58,31),(59,59,29),(60,60,33),(61,61,34),(62,62,35),(63,63,36),(64,64,37),(65,65,38),(66,66,38),(67,67,35),(68,68,34),(69,69,36),(70,70,37),(71,71,39),(72,72,40),(73,73,41),(74,74,42),(75,75,43),(76,76,44),(77,77,45),(78,78,46),(79,79,47),(80,80,48),(81,81,49),(82,82,49),(83,83,48),(84,84,50),(85,85,51),(86,86,52),(87,87,52),(88,88,50),(89,89,51),(90,90,53),(91,91,54),(92,92,55),(93,93,55),(94,94,54),(95,95,53),(96,96,56),(97,97,57),(98,98,58),(99,99,59),(100,100,60),(101,101,61),(102,102,60),(103,103,61),(104,104,59),(105,105,58),(106,106,57),(107,107,56),(108,108,61),(109,109,60),(110,110,59),(111,111,58),(112,112,57),(113,113,56),(114,114,62),(115,115,63),(116,116,64),(117,117,64),(118,118,63),(119,119,62),(120,120,65),(121,121,66),(122,122,67),(123,123,68),(124,124,69),(125,125,68),(126,126,69),(127,127,67),(128,128,66),(129,129,65),(130,130,70),(131,131,71),(132,132,72),(133,133,73),(134,134,74),(135,135,75),(136,136,75),(137,137,73),(138,138,72),(139,139,70),(140,140,74),(141,141,71);
/*!40000 ALTER TABLE `submission_file_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_settings`
--

DROP TABLE IF EXISTS `submission_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_file_settings` (
  `submission_file_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL DEFAULT 'string' COMMENT '(bool|int|float|string|object|date)',
  UNIQUE KEY `submission_file_settings_pkey` (`submission_file_id`,`locale`,`setting_name`),
  KEY `submission_file_settings_submission_file_id` (`submission_file_id`),
  CONSTRAINT `submission_file_settings_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_settings`
--

LOCK TABLES `submission_file_settings` WRITE;
/*!40000 ALTER TABLE `submission_file_settings` DISABLE KEYS */;
INSERT INTO `submission_file_settings` VALUES (1,'','chapterId','1','string'),(1,'en_US','name','chapter1.pdf','string'),(2,'','chapterId','2','string'),(2,'en_US','name','chapter2.pdf','string'),(3,'','chapterId','3','string'),(3,'en_US','name','chapter3.pdf','string'),(4,'','chapterId','3','string'),(4,'en_US','name','chapter3.pdf','string'),(5,'','chapterId','2','string'),(5,'en_US','name','chapter2.pdf','string'),(6,'','chapterId','1','string'),(6,'en_US','name','chapter1.pdf','string'),(7,'','chapterId','4','string'),(7,'en_US','name','chapter1.pdf','string'),(8,'','chapterId','5','string'),(8,'en_US','name','chapter2.pdf','string'),(9,'','chapterId','6','string'),(9,'en_US','name','chapter3.pdf','string'),(10,'','chapterId','7','string'),(10,'en_US','name','chapter4.pdf','string'),(12,'','chapterId','6','string'),(12,'en_US','name','chapter3.pdf','string'),(13,'','chapterId','7','string'),(13,'en_US','name','chapter4.pdf','string'),(14,'','chapterId','5','string'),(14,'en_US','name','chapter2.pdf','string'),(15,'','chapterId','4','string'),(15,'en_US','name','chapter1.pdf','string'),(16,'','chapterId','8','string'),(16,'en_US','name','chapter1.pdf','string'),(17,'','chapterId','9','string'),(17,'en_US','name','chapter2.pdf','string'),(18,'','chapterId','10','string'),(18,'en_US','name','chapter3.pdf','string'),(19,'','chapterId','11','string'),(19,'en_US','name','chapter4.pdf','string'),(20,'','chapterId','12','string'),(20,'en_US','name','chapter5.pdf','string'),(21,'','chapterId','14','string'),(21,'en_US','name','chapter1.pdf','string'),(22,'','chapterId','15','string'),(22,'en_US','name','chapter2.pdf','string'),(23,'','chapterId','16','string'),(23,'en_US','name','chapter3.pdf','string'),(24,'','chapterId','13','string'),(24,'en_US','name','intro.pdf','string'),(25,'','chapterId','13','string'),(25,'en_US','name','intro.pdf','string'),(26,'','chapterId','15','string'),(26,'en_US','name','chapter2.pdf','string'),(27,'','chapterId','16','string'),(27,'en_US','name','chapter3.pdf','string'),(28,'','chapterId','14','string'),(28,'en_US','name','chapter1.pdf','string'),(29,'','chapterId','17','string'),(29,'en_US','name','prologue.pdf','string'),(30,'','chapterId','18','string'),(30,'en_US','name','chapter1.pdf','string'),(31,'','chapterId','19','string'),(31,'en_US','name','chapter2.pdf','string'),(32,'','chapterId','20','string'),(32,'en_US','name','chapter3.pdf','string'),(33,'','chapterId','21','string'),(33,'en_US','name','chapter4.pdf','string'),(34,'','chapterId','22','string'),(34,'en_US','name','epilogue.pdf','string'),(35,'','chapterId','22','string'),(35,'en_US','name','epilogue.pdf','string'),(36,'','chapterId','21','string'),(36,'en_US','name','chapter4.pdf','string'),(37,'','chapterId','20','string'),(37,'en_US','name','chapter3.pdf','string'),(38,'','chapterId','19','string'),(38,'en_US','name','chapter2.pdf','string'),(39,'','chapterId','18','string'),(39,'en_US','name','chapter1.pdf','string'),(40,'','chapterId','17','string'),(40,'en_US','name','prologue.pdf','string'),(41,'','chapterId','22','string'),(41,'en_US','name','epilogue.pdf','string'),(42,'','chapterId','23','string'),(42,'en_US','name','chapter1.pdf','string'),(43,'','chapterId','24','string'),(43,'en_US','name','chapter2.pdf','string'),(44,'','chapterId','25','string'),(44,'en_US','name','chapter3.pdf','string'),(45,'','chapterId','26','string'),(45,'en_US','name','chapter4.pdf','string'),(46,'','chapterId','26','string'),(46,'en_US','name','chapter4.pdf','string'),(47,'','chapterId','24','string'),(47,'en_US','name','chapter2.pdf','string'),(48,'','chapterId','25','string'),(48,'en_US','name','chapter3.pdf','string'),(49,'','chapterId','23','string'),(49,'en_US','name','chapter1.pdf','string'),(50,'','chapterId','27','string'),(50,'en_US','name','intro.pdf','string'),(51,'','chapterId','28','string'),(51,'en_US','name','chapter1.pdf','string'),(52,'','chapterId','29','string'),(52,'en_US','name','chapter2.pdf','string'),(53,'','chapterId','30','string'),(53,'en_US','name','chapter3.pdf','string'),(54,'','chapterId','31','string'),(54,'en_US','name','chapter4.pdf','string'),(55,'','chapterId','31','string'),(55,'en_US','name','chapter4.pdf','string'),(56,'','chapterId','29','string'),(56,'en_US','name','chapter2.pdf','string'),(57,'','chapterId','27','string'),(57,'en_US','name','intro.pdf','string'),(58,'','chapterId','30','string'),(58,'en_US','name','chapter3.pdf','string'),(59,'','chapterId','28','string'),(59,'en_US','name','chapter1.pdf','string'),(60,'en_US','name','note.pdf','string'),(61,'','chapterId','32','string'),(61,'en_US','name','chapter1.pdf','string'),(62,'','chapterId','33','string'),(62,'en_US','name','chapter2.pdf','string'),(63,'','chapterId','34','string'),(63,'en_US','name','chapter3.pdf','string'),(64,'','chapterId','35','string'),(64,'en_US','name','chapter4.pdf','string'),(65,'','chapterId','36','string'),(65,'en_US','name','chapter5.pdf','string'),(66,'','chapterId','36','string'),(66,'en_US','name','chapter5.pdf','string'),(67,'','chapterId','33','string'),(67,'en_US','name','chapter2.pdf','string'),(68,'','chapterId','32','string'),(68,'en_US','name','chapter1.pdf','string'),(69,'','chapterId','34','string'),(69,'en_US','name','chapter3.pdf','string'),(70,'','chapterId','35','string'),(70,'en_US','name','chapter4.pdf','string'),(71,'','chapterId','37','string'),(71,'en_US','name','intro.pdf','string'),(72,'','chapterId','38','string'),(72,'en_US','name','chapter1.pdf','string'),(73,'','chapterId','39','string'),(73,'en_US','name','chapter2.pdf','string'),(74,'','chapterId','40','string'),(74,'en_US','name','chapter3.pdf','string'),(75,'','chapterId','41','string'),(75,'en_US','name','chapter4.pdf','string'),(76,'','chapterId','42','string'),(76,'en_US','name','chapter5.pdf','string'),(77,'','chapterId','43','string'),(77,'en_US','name','conclusion.pdf','string'),(78,'','chapterId','44','string'),(78,'en_US','name','bibliography.pdf','string'),(79,'','chapterId','45','string'),(79,'en_US','name','index.pdf','string'),(80,'','chapterId','46','string'),(80,'en_US','name','intro.pdf','string'),(81,'','chapterId','47','string'),(81,'en_US','name','poems.pdf','string'),(82,'','chapterId','47','string'),(82,'en_US','name','poems.pdf','string'),(83,'','chapterId','46','string'),(83,'en_US','name','intro.pdf','string'),(84,'','chapterId','48','string'),(84,'en_US','name','chapter1.pdf','string'),(85,'','chapterId','49','string'),(85,'en_US','name','chapter2.pdf','string'),(86,'','chapterId','50','string'),(86,'en_US','name','chapter3.pdf','string'),(87,'','chapterId','50','string'),(87,'en_US','name','chapter3.pdf','string'),(88,'','chapterId','48','string'),(88,'en_US','name','chapter1.pdf','string'),(89,'','chapterId','49','string'),(89,'en_US','name','chapter2.pdf','string'),(90,'','chapterId','51','string'),(90,'en_US','name','chapter1.pdf','string'),(91,'','chapterId','52','string'),(91,'en_US','name','chapter2.pdf','string'),(92,'','chapterId','53','string'),(92,'en_US','name','chapter3.pdf','string'),(93,'','chapterId','53','string'),(93,'en_US','name','chapter3.pdf','string'),(94,'','chapterId','52','string'),(94,'en_US','name','chapter2.pdf','string'),(95,'','chapterId','51','string'),(95,'en_US','name','chapter1.pdf','string'),(96,'','chapterId','54','string'),(96,'en_US','name','chapter1.pdf','string'),(97,'','chapterId','55','string'),(97,'en_US','name','chapter2.pdf','string'),(98,'','chapterId','56','string'),(98,'en_US','name','chapter3.pdf','string'),(99,'','chapterId','57','string'),(99,'en_US','name','chapter4.pdf','string'),(100,'en_US','name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(101,'en_US','name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(102,'en_US','name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(103,'en_US','name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(104,'','chapterId','57','string'),(104,'en_US','name','chapter4.pdf','string'),(105,'','chapterId','56','string'),(105,'en_US','name','chapter3.pdf','string'),(106,'','chapterId','55','string'),(106,'en_US','name','chapter2.pdf','string'),(107,'','chapterId','54','string'),(107,'en_US','name','chapter1.pdf','string'),(108,'en_US','name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(109,'en_US','name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(110,'','chapterId','57','string'),(110,'en_US','name','chapter4.pdf','string'),(111,'','chapterId','56','string'),(111,'en_US','name','chapter3.pdf','string'),(112,'','chapterId','55','string'),(112,'en_US','name','chapter2.pdf','string'),(113,'','chapterId','54','string'),(113,'en_US','name','chapter1.pdf','string'),(114,'','chapterId','58','string'),(114,'en_US','name','chapter1.pdf','string'),(115,'','chapterId','59','string'),(115,'en_US','name','chapter2.pdf','string'),(116,'','chapterId','60','string'),(116,'en_US','name','chapter3.pdf','string'),(117,'','chapterId','60','string'),(117,'en_US','name','chapter3.pdf','string'),(118,'','chapterId','59','string'),(118,'en_US','name','chapter2.pdf','string'),(119,'','chapterId','58','string'),(119,'en_US','name','chapter1.pdf','string'),(120,'','chapterId','61','string'),(120,'en_US','name','foreward.pdf','string'),(121,'','chapterId','62','string'),(121,'en_US','name','preface.pdf','string'),(122,'','chapterId','63','string'),(122,'en_US','name','cases.pdf','string'),(123,'','chapterId','64','string'),(123,'en_US','name','conclusion.pdf','string'),(124,'','chapterId','65','string'),(124,'en_US','name','bibliography.pdf','string'),(125,'','chapterId','64','string'),(125,'en_US','name','conclusion.pdf','string'),(126,'','chapterId','65','string'),(126,'en_US','name','bibliography.pdf','string'),(127,'','chapterId','63','string'),(127,'en_US','name','cases.pdf','string'),(128,'','chapterId','62','string'),(128,'en_US','name','preface.pdf','string'),(129,'','chapterId','61','string'),(129,'en_US','name','foreward.pdf','string'),(130,'','chapterId','66','string'),(130,'en_US','name','preface.pdf','string'),(131,'','chapterId','67','string'),(131,'en_US','name','introduction.pdf','string'),(132,'','chapterId','68','string'),(132,'en_US','name','chapter1.pdf','string'),(133,'','chapterId','69','string'),(133,'en_US','name','chapter2.pdf','string'),(134,'','chapterId','70','string'),(134,'en_US','name','chapter3.pdf','string'),(135,'','chapterId','71','string'),(135,'en_US','name','chapter4.pdf','string'),(136,'','chapterId','71','string'),(136,'en_US','name','chapter4.pdf','string'),(137,'','chapterId','69','string'),(137,'en_US','name','chapter2.pdf','string'),(138,'','chapterId','68','string'),(138,'en_US','name','chapter1.pdf','string'),(139,'','chapterId','66','string'),(139,'en_US','name','preface.pdf','string'),(140,'','chapterId','70','string'),(140,'en_US','name','chapter3.pdf','string'),(141,'','chapterId','67','string'),(141,'en_US','name','introduction.pdf','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (1,1,1,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:24:42','2023-01-09 23:24:43',19,NULL,NULL,NULL),(2,1,2,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:24:44','2023-01-09 23:24:44',19,NULL,NULL,NULL),(3,1,3,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:24:45','2023-01-09 23:24:45',19,NULL,NULL,NULL),(4,1,3,3,3,4,NULL,NULL,NULL,'2023-01-09 23:25:18','2023-01-09 23:25:18',19,523,1,NULL),(5,1,2,2,3,4,NULL,NULL,NULL,'2023-01-09 23:25:19','2023-01-09 23:25:19',19,523,1,NULL),(6,1,1,1,3,4,NULL,NULL,NULL,'2023-01-09 23:25:19','2023-01-09 23:25:19',19,523,1,NULL),(7,2,4,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:26:00','2023-01-09 23:26:00',20,NULL,NULL,NULL),(8,2,5,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:26:01','2023-01-09 23:26:02',20,NULL,NULL,NULL),(9,2,6,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:26:02','2023-01-09 23:26:03',20,NULL,NULL,NULL),(10,2,7,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:26:04','2023-01-09 23:26:04',20,NULL,NULL,NULL),(12,2,6,9,3,4,NULL,NULL,NULL,'2023-01-09 23:28:21','2023-01-09 23:28:21',20,523,2,NULL),(13,2,7,10,3,4,NULL,NULL,NULL,'2023-01-09 23:28:21','2023-01-09 23:28:21',20,523,2,NULL),(14,2,5,8,3,4,NULL,NULL,NULL,'2023-01-09 23:28:21','2023-01-09 23:28:21',20,523,2,NULL),(15,2,4,7,3,4,NULL,NULL,NULL,'2023-01-09 23:28:21','2023-01-09 23:28:21',20,523,2,NULL),(16,3,9,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:29:01','2023-01-09 23:29:02',21,NULL,NULL,NULL),(17,3,10,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:29:03','2023-01-09 23:29:03',21,NULL,NULL,NULL),(18,3,11,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:29:04','2023-01-09 23:29:04',21,NULL,NULL,NULL),(19,3,12,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:29:05','2023-01-09 23:29:06',21,NULL,NULL,NULL),(20,3,13,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:29:06','2023-01-09 23:29:07',21,NULL,NULL,NULL),(21,4,14,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:29:59','2023-01-09 23:29:59',22,NULL,NULL,NULL),(22,4,15,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:30:00','2023-01-09 23:30:00',22,NULL,NULL,NULL),(23,4,16,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:30:01','2023-01-09 23:30:02',22,NULL,NULL,NULL),(24,4,17,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:30:02','2023-01-09 23:30:03',22,NULL,NULL,NULL),(25,4,17,24,3,19,NULL,NULL,NULL,'2023-01-09 23:30:50','2023-01-09 23:30:50',22,523,3,NULL),(26,4,15,22,3,19,NULL,NULL,NULL,'2023-01-09 23:30:50','2023-01-09 23:30:50',22,523,3,NULL),(27,4,16,23,3,19,NULL,NULL,NULL,'2023-01-09 23:30:50','2023-01-09 23:30:50',22,523,3,NULL),(28,4,14,21,3,19,NULL,NULL,NULL,'2023-01-09 23:30:50','2023-01-09 23:30:50',22,523,3,NULL),(29,5,18,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:32:14','2023-01-09 23:32:14',23,NULL,NULL,NULL),(30,5,19,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:32:15','2023-01-09 23:32:16',23,NULL,NULL,NULL),(31,5,20,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:32:16','2023-01-09 23:32:17',23,NULL,NULL,NULL),(32,5,21,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:32:18','2023-01-09 23:32:18',23,NULL,NULL,NULL),(33,5,22,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:32:19','2023-01-09 23:32:19',23,NULL,NULL,NULL),(34,5,23,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:32:20','2023-01-09 23:32:21',23,NULL,NULL,NULL),(35,5,23,34,3,19,NULL,NULL,NULL,'2023-01-09 23:33:24','2023-01-09 23:33:24',23,523,5,NULL),(36,5,22,33,3,19,NULL,NULL,NULL,'2023-01-09 23:33:24','2023-01-09 23:33:24',23,523,5,NULL),(37,5,21,32,3,19,NULL,NULL,NULL,'2023-01-09 23:33:24','2023-01-09 23:33:24',23,523,5,NULL),(38,5,20,31,3,19,NULL,NULL,NULL,'2023-01-09 23:33:25','2023-01-09 23:33:25',23,523,5,NULL),(39,5,19,30,3,19,NULL,NULL,NULL,'2023-01-09 23:33:25','2023-01-09 23:33:25',23,523,5,NULL),(40,5,18,29,3,19,NULL,NULL,NULL,'2023-01-09 23:33:25','2023-01-09 23:33:25',23,523,5,NULL),(41,5,23,34,3,10,'0','openAccess',1,'2023-01-09 23:34:50','2023-01-09 23:35:01',23,521,2,NULL),(42,6,24,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:35:40','2023-01-09 23:35:40',24,NULL,NULL,NULL),(43,6,25,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:35:41','2023-01-09 23:35:42',24,NULL,NULL,NULL),(44,6,26,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:35:42','2023-01-09 23:35:43',24,NULL,NULL,NULL),(45,6,27,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:35:44','2023-01-09 23:35:44',24,NULL,NULL,NULL),(46,6,27,45,3,19,NULL,NULL,NULL,'2023-01-09 23:36:30','2023-01-09 23:36:30',24,523,7,NULL),(47,6,25,43,3,19,NULL,NULL,NULL,'2023-01-09 23:36:30','2023-01-09 23:36:30',24,523,7,NULL),(48,6,26,44,3,19,NULL,NULL,NULL,'2023-01-09 23:36:30','2023-01-09 23:36:30',24,523,7,NULL),(49,6,24,42,3,19,NULL,NULL,NULL,'2023-01-09 23:36:30','2023-01-09 23:36:30',24,523,7,NULL),(50,7,28,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:37:35','2023-01-09 23:37:35',25,NULL,NULL,NULL),(51,7,29,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:37:36','2023-01-09 23:37:36',25,NULL,NULL,NULL),(52,7,30,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:37:37','2023-01-09 23:37:38',25,NULL,NULL,NULL),(53,7,31,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:37:38','2023-01-09 23:37:39',25,NULL,NULL,NULL),(54,7,32,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:37:40','2023-01-09 23:37:40',25,NULL,NULL,NULL),(55,7,32,54,3,4,NULL,NULL,NULL,'2023-01-09 23:38:38','2023-01-09 23:38:38',25,523,8,NULL),(56,7,30,52,3,4,NULL,NULL,NULL,'2023-01-09 23:38:38','2023-01-09 23:38:38',25,523,8,NULL),(57,7,28,50,3,4,NULL,NULL,NULL,'2023-01-09 23:38:38','2023-01-09 23:38:38',25,523,8,NULL),(58,7,31,53,3,4,NULL,NULL,NULL,'2023-01-09 23:38:38','2023-01-09 23:38:38',25,523,8,NULL),(59,7,29,51,3,4,NULL,NULL,NULL,'2023-01-09 23:38:38','2023-01-09 23:38:38',25,523,8,NULL),(60,8,33,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:39:22','2023-01-09 23:39:23',3,NULL,NULL,NULL),(61,9,34,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:39:36','2023-01-09 23:39:37',26,NULL,NULL,NULL),(62,9,35,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:39:37','2023-01-09 23:39:38',26,NULL,NULL,NULL),(63,9,36,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:39:39','2023-01-09 23:39:39',26,NULL,NULL,NULL),(64,9,37,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:39:40','2023-01-09 23:39:40',26,NULL,NULL,NULL),(65,9,38,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:39:41','2023-01-09 23:39:42',26,NULL,NULL,NULL),(66,9,38,65,3,19,NULL,NULL,NULL,'2023-01-09 23:40:39','2023-01-09 23:40:39',26,523,9,NULL),(67,9,35,62,3,19,NULL,NULL,NULL,'2023-01-09 23:40:39','2023-01-09 23:40:39',26,523,9,NULL),(68,9,34,61,3,19,NULL,NULL,NULL,'2023-01-09 23:40:39','2023-01-09 23:40:39',26,523,9,NULL),(69,9,36,63,3,19,NULL,NULL,NULL,'2023-01-09 23:40:40','2023-01-09 23:40:40',26,523,9,NULL),(70,9,37,64,3,19,NULL,NULL,NULL,'2023-01-09 23:40:40','2023-01-09 23:40:40',26,523,9,NULL),(71,10,39,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:40:58','2023-01-09 23:40:59',27,NULL,NULL,NULL),(72,10,40,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:40:59','2023-01-09 23:41:00',27,NULL,NULL,NULL),(73,10,41,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:41:01','2023-01-09 23:41:01',27,NULL,NULL,NULL),(74,10,42,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:41:02','2023-01-09 23:41:02',27,NULL,NULL,NULL),(75,10,43,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:41:03','2023-01-09 23:41:04',27,NULL,NULL,NULL),(76,10,44,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:41:05','2023-01-09 23:41:05',27,NULL,NULL,NULL),(77,10,45,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:41:06','2023-01-09 23:41:06',27,NULL,NULL,NULL),(78,10,46,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:41:07','2023-01-09 23:41:08',27,NULL,NULL,NULL),(79,10,47,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:41:09','2023-01-09 23:41:09',27,NULL,NULL,NULL),(80,11,48,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:42:41','2023-01-09 23:42:42',28,NULL,NULL,NULL),(81,11,49,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:42:42','2023-01-09 23:42:43',28,NULL,NULL,NULL),(82,11,49,81,3,19,NULL,NULL,NULL,'2023-01-09 23:43:11','2023-01-09 23:43:11',28,523,10,NULL),(83,11,48,80,3,19,NULL,NULL,NULL,'2023-01-09 23:43:11','2023-01-09 23:43:11',28,523,10,NULL),(84,12,50,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:44:45','2023-01-09 23:44:45',29,NULL,NULL,NULL),(85,12,51,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:44:46','2023-01-09 23:44:46',29,NULL,NULL,NULL),(86,12,52,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:44:47','2023-01-09 23:44:48',29,NULL,NULL,NULL),(87,12,52,86,3,19,NULL,NULL,NULL,'2023-01-09 23:45:28','2023-01-09 23:45:28',29,523,12,NULL),(88,12,50,84,3,19,NULL,NULL,NULL,'2023-01-09 23:45:28','2023-01-09 23:45:28',29,523,12,NULL),(89,12,51,85,3,19,NULL,NULL,NULL,'2023-01-09 23:45:29','2023-01-09 23:45:29',29,523,12,NULL),(90,13,53,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:46:20','2023-01-09 23:46:20',30,NULL,NULL,NULL),(91,13,54,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:46:21','2023-01-09 23:46:21',30,NULL,NULL,NULL),(92,13,55,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:46:22','2023-01-09 23:46:22',30,NULL,NULL,NULL),(93,13,55,92,3,19,NULL,NULL,NULL,'2023-01-09 23:47:02','2023-01-09 23:47:02',30,523,13,NULL),(94,13,54,91,3,19,NULL,NULL,NULL,'2023-01-09 23:47:02','2023-01-09 23:47:02',30,523,13,NULL),(95,13,53,90,3,19,NULL,NULL,NULL,'2023-01-09 23:47:02','2023-01-09 23:47:02',30,523,13,NULL),(96,14,56,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:48:49','2023-01-09 23:48:50',31,NULL,NULL,NULL),(97,14,57,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:48:51','2023-01-09 23:48:51',31,NULL,NULL,NULL),(98,14,58,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:48:52','2023-01-09 23:48:52',31,NULL,NULL,NULL),(99,14,59,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:48:53','2023-01-09 23:48:54',31,NULL,NULL,NULL),(100,14,60,NULL,13,2,NULL,NULL,NULL,'2023-01-09 23:48:54','2023-01-09 23:48:55',31,NULL,NULL,NULL),(101,14,61,NULL,9,2,NULL,NULL,NULL,'2023-01-09 23:48:56','2023-01-09 23:48:57',31,NULL,NULL,NULL),(102,14,60,100,13,19,NULL,NULL,NULL,'2023-01-09 23:49:47','2023-01-09 23:49:47',31,523,15,NULL),(103,14,61,101,9,19,NULL,NULL,NULL,'2023-01-09 23:49:47','2023-01-09 23:49:47',31,523,15,NULL),(104,14,59,99,3,19,NULL,NULL,NULL,'2023-01-09 23:49:47','2023-01-09 23:49:47',31,523,15,NULL),(105,14,58,98,3,19,NULL,NULL,NULL,'2023-01-09 23:49:48','2023-01-09 23:49:48',31,523,15,NULL),(106,14,57,97,3,19,NULL,NULL,NULL,'2023-01-09 23:49:48','2023-01-09 23:49:48',31,523,15,NULL),(107,14,56,96,3,19,NULL,NULL,NULL,'2023-01-09 23:49:48','2023-01-09 23:49:48',31,523,15,NULL),(108,14,61,101,9,10,'0','openAccess',1,'2023-01-09 23:51:14','2023-01-09 23:51:54',31,521,3,NULL),(109,14,60,100,13,10,'0','openAccess',1,'2023-01-09 23:51:14','2023-01-09 23:51:48',31,521,3,NULL),(110,14,59,99,3,10,'0','openAccess',1,'2023-01-09 23:51:14','2023-01-09 23:51:43',31,521,3,NULL),(111,14,58,98,3,10,'0','openAccess',1,'2023-01-09 23:51:14','2023-01-09 23:51:36',31,521,3,NULL),(112,14,57,97,3,10,'0','openAccess',1,'2023-01-09 23:51:14','2023-01-09 23:51:31',31,521,3,NULL),(113,14,56,96,3,10,'0','openAccess',1,'2023-01-09 23:51:14','2023-01-09 23:51:26',31,521,3,NULL),(114,15,62,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:52:12','2023-01-09 23:52:12',32,NULL,NULL,NULL),(115,15,63,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:52:13','2023-01-09 23:52:13',32,NULL,NULL,NULL),(116,15,64,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:52:14','2023-01-09 23:52:15',32,NULL,NULL,NULL),(117,15,64,116,3,4,NULL,NULL,NULL,'2023-01-09 23:52:52','2023-01-09 23:52:52',32,523,17,NULL),(118,15,63,115,3,4,NULL,NULL,NULL,'2023-01-09 23:52:52','2023-01-09 23:52:52',32,523,17,NULL),(119,15,62,114,3,4,NULL,NULL,NULL,'2023-01-09 23:52:52','2023-01-09 23:52:52',32,523,17,NULL),(120,16,65,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:53:10','2023-01-09 23:53:10',33,NULL,NULL,NULL),(121,16,66,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:53:11','2023-01-09 23:53:12',33,NULL,NULL,NULL),(122,16,67,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:53:12','2023-01-09 23:53:13',33,NULL,NULL,NULL),(123,16,68,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:53:14','2023-01-09 23:53:14',33,NULL,NULL,NULL),(124,16,69,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:53:15','2023-01-09 23:53:15',33,NULL,NULL,NULL),(125,16,68,123,3,4,NULL,NULL,NULL,'2023-01-09 23:54:12','2023-01-09 23:54:12',33,523,18,NULL),(126,16,69,124,3,4,NULL,NULL,NULL,'2023-01-09 23:54:13','2023-01-09 23:54:13',33,523,18,NULL),(127,16,67,122,3,4,NULL,NULL,NULL,'2023-01-09 23:54:13','2023-01-09 23:54:13',33,523,18,NULL),(128,16,66,121,3,4,NULL,NULL,NULL,'2023-01-09 23:54:13','2023-01-09 23:54:13',33,523,18,NULL),(129,16,65,120,3,4,NULL,NULL,NULL,'2023-01-09 23:54:13','2023-01-09 23:54:13',33,523,18,NULL),(130,17,70,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:55:08','2023-01-09 23:55:08',34,NULL,NULL,NULL),(131,17,71,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:55:09','2023-01-09 23:55:09',34,NULL,NULL,NULL),(132,17,72,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:55:10','2023-01-09 23:55:11',34,NULL,NULL,NULL),(133,17,73,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:55:11','2023-01-09 23:55:12',34,NULL,NULL,NULL),(134,17,74,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:55:13','2023-01-09 23:55:13',34,NULL,NULL,NULL),(135,17,75,NULL,3,2,NULL,NULL,NULL,'2023-01-09 23:55:14','2023-01-09 23:55:14',34,NULL,NULL,NULL),(136,17,75,135,3,19,NULL,NULL,NULL,'2023-01-09 23:56:29','2023-01-09 23:56:29',34,523,19,NULL),(137,17,73,133,3,19,NULL,NULL,NULL,'2023-01-09 23:56:29','2023-01-09 23:56:29',34,523,19,NULL),(138,17,72,132,3,19,NULL,NULL,NULL,'2023-01-09 23:56:29','2023-01-09 23:56:29',34,523,19,NULL),(139,17,70,130,3,19,NULL,NULL,NULL,'2023-01-09 23:56:29','2023-01-09 23:56:29',34,523,19,NULL),(140,17,74,134,3,19,NULL,NULL,NULL,'2023-01-09 23:56:29','2023-01-09 23:56:29',34,523,19,NULL),(141,17,71,131,3,19,NULL,NULL,NULL,'2023-01-09 23:56:29','2023-01-09 23:56:29',34,523,19,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
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
  `object_id` bigint(20) NOT NULL,
  `keyword_id` bigint(20) NOT NULL,
  `pos` int(11) NOT NULL COMMENT 'Word position of the keyword in the object.',
  UNIQUE KEY `submission_search_object_keywords_pkey` (`object_id`,`pos`),
  KEY `submission_search_object_keywords_object_id` (`object_id`),
  KEY `submission_search_object_keywords_keyword_id` (`keyword_id`),
  CONSTRAINT `submission_search_object_keywords_keyword_id` FOREIGN KEY (`keyword_id`) REFERENCES `submission_search_keyword_list` (`keyword_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_search_object_keywords_object_id_foreign` FOREIGN KEY (`object_id`) REFERENCES `submission_search_objects` (`object_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_object_keywords`
--

LOCK TABLES `submission_search_object_keywords` WRITE;
/*!40000 ALTER TABLE `submission_search_object_keywords` DISABLE KEYS */;
INSERT INTO `submission_search_object_keywords` VALUES (9,1,0),(9,2,1),(11,2,13),(9,3,2),(17,3,2),(17,3,7),(17,3,10),(9,4,3),(9,5,4),(10,6,0),(11,6,28),(10,7,1),(11,7,0),(11,7,8),(11,7,18),(11,7,29),(11,7,43),(10,8,2),(10,9,3),(10,10,4),(11,10,15),(10,11,5),(11,11,16),(11,12,1),(11,12,44),(11,13,2),(11,13,45),(11,14,3),(11,15,4),(11,16,5),(11,17,6),(11,18,7),(11,19,9),(11,20,10),(11,21,11),(11,22,12),(11,23,14),(11,24,17),(11,25,19),(11,26,20),(11,27,21),(11,28,22),(11,29,23),(11,30,24),(11,31,25),(11,32,26),(11,33,27),(11,34,30),(11,35,31),(11,36,32),(11,37,33),(11,38,34),(11,39,35),(11,40,36),(11,41,37),(11,42,38),(11,43,39),(11,44,40),(11,45,41),(19,45,57),(11,46,42),(13,47,0),(13,48,1),(13,48,4),(13,48,7),(13,49,2),(13,50,3),(13,51,5),(13,52,6),(17,53,0),(17,53,8),(17,54,1),(17,55,3),(17,56,4),(17,57,5),(17,58,6),(17,59,9),(17,60,11),(18,61,0),(19,61,0),(19,61,23),(18,62,1),(19,62,1),(19,62,24),(18,63,2),(19,63,3),(19,63,17),(18,64,3),(19,64,4),(19,64,18),(19,64,21),(18,65,4),(19,65,5),(19,65,19),(19,65,22),(18,66,5),(19,66,11),(19,66,53),(18,67,6),(19,67,13),(19,67,54),(19,68,2),(19,69,6),(19,70,7),(19,71,8),(19,72,9),(19,73,10),(19,74,12),(19,75,14),(19,76,15),(19,77,16),(19,78,20),(19,79,25),(19,80,26),(19,81,27),(19,82,28),(19,83,29),(19,84,30),(19,84,48),(19,85,31),(19,86,32),(19,87,33),(19,88,34),(19,89,35),(19,90,36),(19,91,37),(19,92,38),(19,93,39),(19,93,51),(19,94,40),(19,95,41),(19,96,42),(19,96,58),(19,97,43),(19,98,44),(19,99,45),(19,100,46),(19,101,47),(19,102,49),(19,103,50),(19,104,52),(19,105,55),(19,106,56),(19,107,59),(19,108,60),(19,109,61),(21,110,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
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
  `submission_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  UNIQUE KEY `submission_settings_pkey` (`submission_id`,`locale`,`setting_name`),
  KEY `submission_settings_submission_id` (`submission_id`),
  CONSTRAINT `submission_settings_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `submission_progress` varchar(50) NOT NULL DEFAULT 'files',
  `work_type` smallint(6) DEFAULT '0',
  PRIMARY KEY (`submission_id`),
  KEY `submissions_context_id` (`context_id`),
  KEY `submissions_publication_id` (`current_publication_id`),
  CONSTRAINT `submissions_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `submissions_publication_id` FOREIGN KEY (`current_publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,1,1,'2023-01-09 23:25:43','2023-01-09 23:25:05','2023-01-09 23:25:05',4,'en_US',1,'',0),(2,1,2,'2023-01-09 23:28:46','2023-01-09 23:27:53','2023-01-09 23:27:53',3,'en_US',1,'',1),(3,1,3,'2023-01-09 23:29:44','2023-01-09 23:29:44','2023-01-09 23:29:44',1,'en_US',1,'',0),(4,1,4,'2023-01-09 23:32:01','2023-01-09 23:30:33','2023-01-09 23:30:33',5,'en_US',1,'',0),(5,1,5,'2023-01-09 23:35:26','2023-01-09 23:33:06','2023-01-09 23:33:06',5,'en_US',3,'',0),(6,1,6,'2023-01-09 23:37:07','2023-01-09 23:36:13','2023-01-09 23:36:13',2,'en_US',1,'',0),(7,1,7,'2023-01-09 23:39:07','2023-01-09 23:38:20','2023-01-09 23:38:20',4,'en_US',1,'',0),(8,1,8,'2023-01-09 23:39:24','2023-01-09 23:39:24','2023-01-09 23:39:24',1,'en_US',1,'',0),(9,1,9,'2023-01-09 23:40:40','2023-01-09 23:40:21','2023-01-09 23:40:21',2,'en_US',1,'',0),(10,1,10,'2023-01-09 23:42:27','2023-01-09 23:42:27','2023-01-09 23:42:27',1,'en_US',1,'',0),(11,1,11,'2023-01-09 23:44:27','2023-01-09 23:42:55','2023-01-09 23:43:44',4,'en_US',1,'',0),(12,1,12,'2023-01-09 23:46:06','2023-01-09 23:45:11','2023-01-09 23:45:46',2,'en_US',1,'',0),(13,1,13,'2023-01-09 23:48:31','2023-01-09 23:46:44','2023-01-09 23:47:44',4,'en_US',1,'',0),(14,1,14,'2023-01-09 23:51:57','2023-01-09 23:49:28','2023-01-09 23:49:28',5,'en_US',3,'',0),(15,1,15,'2023-01-09 23:52:52','2023-01-09 23:52:34','2023-01-09 23:52:34',3,'en_US',1,'',0),(16,1,16,'2023-01-09 23:54:53','2023-01-09 23:53:50','2023-01-09 23:54:23',3,'en_US',1,'',0),(17,1,17,'2023-01-09 23:56:50','2023-01-09 23:56:06','2023-01-09 23:56:06',2,'en_US',1,'',0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `load_id` varchar(255) NOT NULL,
  `line_number` bigint(20) NOT NULL,
  `institution_id` bigint(20) NOT NULL,
  UNIQUE KEY `usi_load_id_line_number_institution_id` (`load_id`,`line_number`,`institution_id`),
  KEY `usi_institution_id` (`institution_id`),
  CONSTRAINT `usi_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `user_group_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  UNIQUE KEY `user_group_settings_pkey` (`user_group_id`,`locale`,`setting_name`),
  KEY `user_group_settings_user_group_id` (`user_group_id`),
  CONSTRAINT `user_group_settings_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_settings`
--

LOCK TABLES `user_group_settings` WRITE;
/*!40000 ALTER TABLE `user_group_settings` DISABLE KEYS */;
INSERT INTO `user_group_settings` VALUES (1,'en_US','name','Site Admin'),(1,'fr_CA','name','Administrateur-trice du site'),(2,'','abbrevLocaleKey','default.groups.abbrev.manager'),(2,'','nameLocaleKey','default.groups.name.manager'),(2,'en_US','abbrev','PM'),(2,'en_US','name','Press manager'),(2,'fr_CA','abbrev','MP'),(2,'fr_CA','name','Gestionnaire de la presse'),(3,'','abbrevLocaleKey','default.groups.abbrev.editor'),(3,'','nameLocaleKey','default.groups.name.editor'),(3,'en_US','abbrev','PE'),(3,'en_US','name','Press editor'),(3,'fr_CA','abbrev','RP'),(3,'fr_CA','name','Rédacteur/Rédactrice en chef de la presse'),(4,'','abbrevLocaleKey','default.groups.abbrev.productionEditor'),(4,'','nameLocaleKey','default.groups.name.productionEditor'),(4,'en_US','abbrev','ProdE'),(4,'en_US','name','Production editor'),(4,'fr_CA','abbrev','DirProd'),(4,'fr_CA','name','Directeur-trice de production'),(5,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor'),(5,'','nameLocaleKey','default.groups.name.sectionEditor'),(5,'en_US','abbrev','AcqE'),(5,'en_US','name','Series editor'),(5,'fr_CA','abbrev','RS'),(5,'fr_CA','name','Rédacteur/Rédactrice en chef de la série'),(6,'','abbrevLocaleKey','default.groups.abbrev.copyeditor'),(6,'','nameLocaleKey','default.groups.name.copyeditor'),(6,'en_US','abbrev','CE'),(6,'en_US','name','Copyeditor'),(6,'fr_CA','abbrev','RÉV'),(6,'fr_CA','name','Réviseur-e'),(7,'','abbrevLocaleKey','default.groups.abbrev.designer'),(7,'','nameLocaleKey','default.groups.name.designer'),(7,'en_US','abbrev','Design'),(7,'en_US','name','Designer'),(7,'fr_CA','abbrev','Design'),(7,'fr_CA','name','Designer'),(8,'','abbrevLocaleKey','default.groups.abbrev.funding'),(8,'','nameLocaleKey','default.groups.name.funding'),(8,'en_US','abbrev','FC'),(8,'en_US','name','Funding coordinator'),(8,'fr_CA','abbrev','CF'),(8,'fr_CA','name','Coordonnateur-trice du financement'),(9,'','abbrevLocaleKey','default.groups.abbrev.indexer'),(9,'','nameLocaleKey','default.groups.name.indexer'),(9,'en_US','abbrev','IND'),(9,'en_US','name','Indexer'),(9,'fr_CA','abbrev','Indx'),(9,'fr_CA','name','Indexeur-e'),(10,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor'),(10,'','nameLocaleKey','default.groups.name.layoutEditor'),(10,'en_US','abbrev','LE'),(10,'en_US','name','Layout Editor'),(10,'fr_CA','abbrev','RespMP'),(10,'fr_CA','name','Responsable de la mise en page'),(11,'','abbrevLocaleKey','default.groups.abbrev.marketing'),(11,'','nameLocaleKey','default.groups.name.marketing'),(11,'en_US','abbrev','MS'),(11,'en_US','name','Marketing and sales coordinator'),(11,'fr_CA','abbrev','CVM'),(11,'fr_CA','name','Coordonnateur-trice des ventes et du marketing'),(12,'','abbrevLocaleKey','default.groups.abbrev.proofreader'),(12,'','nameLocaleKey','default.groups.name.proofreader'),(12,'en_US','abbrev','PR'),(12,'en_US','name','Proofreader'),(12,'fr_CA','abbrev','CorEp'),(12,'fr_CA','name','Correcteur-trice d\'épreuves'),(13,'','abbrevLocaleKey','default.groups.abbrev.author'),(13,'','nameLocaleKey','default.groups.name.author'),(13,'en_US','abbrev','AU'),(13,'en_US','name','Author'),(13,'fr_CA','abbrev','AU'),(13,'fr_CA','name','Auteur-e'),(14,'','abbrevLocaleKey','default.groups.abbrev.volumeEditor'),(14,'','nameLocaleKey','default.groups.name.volumeEditor'),(14,'','recommendOnly','0'),(14,'en_US','abbrev','VE'),(14,'en_US','name','Volume editor'),(14,'fr_CA','abbrev','RV'),(14,'fr_CA','name','Rédacteur/Rédactrice en chef du volume'),(15,'','abbrevLocaleKey','default.groups.abbrev.chapterAuthor'),(15,'','nameLocaleKey','default.groups.name.chapterAuthor'),(15,'en_US','abbrev','CA'),(15,'en_US','name','Chapter Author'),(15,'fr_CA','abbrev','AC'),(15,'fr_CA','name','Auteur du chapitre'),(16,'','abbrevLocaleKey','default.groups.abbrev.translator'),(16,'','nameLocaleKey','default.groups.name.translator'),(16,'en_US','abbrev','Trans'),(16,'en_US','name','Translator'),(16,'fr_CA','abbrev','Trad'),(16,'fr_CA','name','Traducteur-trice'),(17,'','abbrevLocaleKey','default.groups.abbrev.internalReviewer'),(17,'','nameLocaleKey','default.groups.name.internalReviewer'),(17,'en_US','abbrev','IR'),(17,'en_US','name','Internal Reviewer'),(17,'fr_CA','abbrev','EvalInt'),(17,'fr_CA','name','Évaluateur-trice interne'),(18,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer'),(18,'','nameLocaleKey','default.groups.name.externalReviewer'),(18,'en_US','abbrev','ER'),(18,'en_US','name','External Reviewer'),(18,'fr_CA','abbrev','EvEx'),(18,'fr_CA','name','Évaluateur-trice externe'),(19,'','abbrevLocaleKey','default.groups.abbrev.reader'),(19,'','nameLocaleKey','default.groups.name.reader'),(19,'en_US','abbrev','Read'),(19,'en_US','name','Reader'),(19,'fr_CA','abbrev','Lect'),(19,'fr_CA','name','Lecteur-trice');
/*!40000 ALTER TABLE `user_group_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_stage`
--

DROP TABLE IF EXISTS `user_group_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_stage` (
  `context_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) NOT NULL,
  UNIQUE KEY `user_group_stage_pkey` (`context_id`,`user_group_id`,`stage_id`),
  KEY `user_group_stage_context_id` (`context_id`),
  KEY `user_group_stage_user_group_id` (`user_group_id`),
  KEY `user_group_stage_stage_id` (`stage_id`),
  CONSTRAINT `user_group_stage_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `user_group_stage_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_stage`
--

LOCK TABLES `user_group_stage` WRITE;
/*!40000 ALTER TABLE `user_group_stage` DISABLE KEYS */;
INSERT INTO `user_group_stage` VALUES (1,3,1),(1,3,2),(1,3,3),(1,3,4),(1,3,5),(1,4,4),(1,4,5),(1,5,1),(1,5,2),(1,5,3),(1,5,4),(1,5,5),(1,6,4),(1,7,5),(1,8,1),(1,8,2),(1,8,3),(1,9,5),(1,10,5),(1,11,4),(1,12,5),(1,13,1),(1,13,2),(1,13,3),(1,13,4),(1,13,5),(1,14,1),(1,14,2),(1,14,3),(1,14,4),(1,14,5),(1,15,4),(1,15,5),(1,16,1),(1,16,2),(1,16,3),(1,16,4),(1,16,5),(1,17,2),(1,18,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
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
  `user_id` bigint(20) NOT NULL,
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`),
  KEY `user_interests_user_id` (`user_id`),
  KEY `user_interests_controlled_vocab_entry_id` (`controlled_vocab_entry_id`),
  CONSTRAINT `user_interests_controlled_vocab_entry_id_foreign` FOREIGN KEY (`controlled_vocab_entry_id`) REFERENCES `controlled_vocab_entries` (`controlled_vocab_entry_id`) ON DELETE CASCADE,
  CONSTRAINT `user_interests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `user_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  UNIQUE KEY `user_settings_pkey` (`user_id`,`locale`,`setting_name`),
  KEY `user_settings_user_id` (`user_id`),
  KEY `user_settings_locale_setting_name_index` (`setting_name`,`locale`),
  CONSTRAINT `user_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
INSERT INTO `user_settings` VALUES (1,'en_US','familyName','admin'),(1,'en_US','givenName','admin'),(2,'','orcid',''),(2,'en_US','affiliation','Universidad Nacional Autónoma de México'),(2,'en_US','biography',''),(2,'en_US','familyName','Vaca'),(2,'en_US','givenName','Ramiro'),(2,'en_US','preferredPublicName',''),(2,'en_US','signature',''),(2,'fr_CA','affiliation',''),(2,'fr_CA','biography',''),(2,'fr_CA','familyName',''),(2,'fr_CA','givenName',''),(2,'fr_CA','preferredPublicName',''),(2,'fr_CA','signature',''),(3,'','orcid',''),(3,'en_US','affiliation','University of Melbourne'),(3,'en_US','biography',''),(3,'en_US','familyName','Barnes'),(3,'en_US','givenName','Daniel'),(3,'en_US','preferredPublicName',''),(3,'en_US','signature',''),(3,'fr_CA','affiliation',''),(3,'fr_CA','biography',''),(3,'fr_CA','familyName',''),(3,'fr_CA','givenName',''),(3,'fr_CA','preferredPublicName',''),(3,'fr_CA','signature',''),(4,'','orcid',''),(4,'en_US','affiliation','University of Chicago'),(4,'en_US','biography',''),(4,'en_US','familyName','Buskins'),(4,'en_US','givenName','David'),(4,'en_US','preferredPublicName',''),(4,'en_US','signature',''),(4,'fr_CA','affiliation',''),(4,'fr_CA','biography',''),(4,'fr_CA','familyName',''),(4,'fr_CA','givenName',''),(4,'fr_CA','preferredPublicName',''),(4,'fr_CA','signature',''),(5,'','orcid',''),(5,'en_US','affiliation','University of Toronto'),(5,'en_US','biography',''),(5,'en_US','familyName','Berardo'),(5,'en_US','givenName','Stephanie'),(5,'en_US','preferredPublicName',''),(5,'en_US','signature',''),(5,'fr_CA','affiliation',''),(5,'fr_CA','biography',''),(5,'fr_CA','familyName',''),(5,'fr_CA','givenName',''),(5,'fr_CA','preferredPublicName',''),(5,'fr_CA','signature',''),(6,'','orcid',''),(6,'en_US','affiliation','Kyoto University'),(6,'en_US','biography',''),(6,'en_US','familyName','Inoue'),(6,'en_US','givenName','Minoti'),(6,'en_US','preferredPublicName',''),(6,'en_US','signature',''),(6,'fr_CA','affiliation',''),(6,'fr_CA','biography',''),(6,'fr_CA','familyName',''),(6,'fr_CA','givenName',''),(6,'fr_CA','preferredPublicName',''),(6,'fr_CA','signature',''),(7,'','orcid',''),(7,'en_US','affiliation','Utrecht University'),(7,'en_US','biography',''),(7,'en_US','familyName','Janssen'),(7,'en_US','givenName','Julie'),(7,'en_US','preferredPublicName',''),(7,'en_US','signature',''),(7,'fr_CA','affiliation',''),(7,'fr_CA','biography',''),(7,'fr_CA','familyName',''),(7,'fr_CA','givenName',''),(7,'fr_CA','preferredPublicName',''),(7,'fr_CA','signature',''),(8,'','orcid',''),(8,'en_US','affiliation','McGill University'),(8,'en_US','biography',''),(8,'en_US','familyName','Hudson'),(8,'en_US','givenName','Paul'),(8,'en_US','preferredPublicName',''),(8,'en_US','signature',''),(8,'fr_CA','affiliation',''),(8,'fr_CA','biography',''),(8,'fr_CA','familyName',''),(8,'fr_CA','givenName',''),(8,'fr_CA','preferredPublicName',''),(8,'fr_CA','signature',''),(9,'','orcid',''),(9,'en_US','affiliation','University of Manitoba'),(9,'en_US','biography',''),(9,'en_US','familyName','McCrae'),(9,'en_US','givenName','Aisla'),(9,'en_US','preferredPublicName',''),(9,'en_US','signature',''),(9,'fr_CA','affiliation',''),(9,'fr_CA','biography',''),(9,'fr_CA','familyName',''),(9,'fr_CA','givenName',''),(9,'fr_CA','preferredPublicName',''),(9,'fr_CA','signature',''),(10,'','orcid',''),(10,'en_US','affiliation','State University of New York'),(10,'en_US','biography',''),(10,'en_US','familyName','Gallego'),(10,'en_US','givenName','Adela'),(10,'en_US','preferredPublicName',''),(10,'en_US','signature',''),(10,'fr_CA','affiliation',''),(10,'fr_CA','biography',''),(10,'fr_CA','familyName',''),(10,'fr_CA','givenName',''),(10,'fr_CA','preferredPublicName',''),(10,'fr_CA','signature',''),(11,'','orcid',''),(11,'en_US','affiliation','KNUST'),(11,'en_US','biography',''),(11,'en_US','familyName','Zacharia'),(11,'en_US','givenName','Al'),(11,'en_US','preferredPublicName',''),(11,'en_US','signature',''),(11,'fr_CA','affiliation',''),(11,'fr_CA','biography',''),(11,'fr_CA','familyName',''),(11,'fr_CA','givenName',''),(11,'fr_CA','preferredPublicName',''),(11,'fr_CA','signature',''),(12,'','orcid',''),(12,'en_US','affiliation','Madrid'),(12,'en_US','biography',''),(12,'en_US','familyName','Favio'),(12,'en_US','givenName','Gonzalo'),(12,'en_US','preferredPublicName',''),(12,'en_US','signature',''),(12,'fr_CA','affiliation',''),(12,'fr_CA','biography',''),(12,'fr_CA','familyName',''),(12,'fr_CA','givenName',''),(12,'fr_CA','preferredPublicName',''),(12,'fr_CA','signature',''),(13,'','orcid',''),(13,'en_US','affiliation','Ghent University'),(13,'en_US','biography',''),(13,'en_US','familyName','Fritz'),(13,'en_US','givenName','Maria'),(13,'en_US','preferredPublicName',''),(13,'en_US','signature',''),(13,'fr_CA','affiliation',''),(13,'fr_CA','biography',''),(13,'fr_CA','familyName',''),(13,'fr_CA','givenName',''),(13,'fr_CA','preferredPublicName',''),(13,'fr_CA','signature',''),(14,'','orcid',''),(14,'en_US','affiliation','Universidad de Chile'),(14,'en_US','biography',''),(14,'en_US','familyName','Vogt'),(14,'en_US','givenName','Sarah'),(14,'en_US','preferredPublicName',''),(14,'en_US','signature',''),(14,'fr_CA','affiliation',''),(14,'fr_CA','biography',''),(14,'fr_CA','familyName',''),(14,'fr_CA','givenName',''),(14,'fr_CA','preferredPublicName',''),(14,'fr_CA','signature',''),(15,'','orcid',''),(15,'en_US','affiliation','Duke University'),(15,'en_US','biography',''),(15,'en_US','familyName','Cox'),(15,'en_US','givenName','Graham'),(15,'en_US','preferredPublicName',''),(15,'en_US','signature',''),(15,'fr_CA','affiliation',''),(15,'fr_CA','biography',''),(15,'fr_CA','familyName',''),(15,'fr_CA','givenName',''),(15,'fr_CA','preferredPublicName',''),(15,'fr_CA','signature',''),(16,'','orcid',''),(16,'en_US','affiliation','University of Cape Town'),(16,'en_US','biography',''),(16,'en_US','familyName','Hellier'),(16,'en_US','givenName','Stephen'),(16,'en_US','preferredPublicName',''),(16,'en_US','signature',''),(16,'fr_CA','affiliation',''),(16,'fr_CA','biography',''),(16,'fr_CA','familyName',''),(16,'fr_CA','givenName',''),(16,'fr_CA','preferredPublicName',''),(16,'fr_CA','signature',''),(17,'','orcid',''),(17,'en_US','affiliation','Imperial College London'),(17,'en_US','biography',''),(17,'en_US','familyName','Turner'),(17,'en_US','givenName','Catherine'),(17,'en_US','preferredPublicName',''),(17,'en_US','signature',''),(17,'fr_CA','affiliation',''),(17,'fr_CA','biography',''),(17,'fr_CA','familyName',''),(17,'fr_CA','givenName',''),(17,'fr_CA','preferredPublicName',''),(17,'fr_CA','signature',''),(18,'','orcid',''),(18,'en_US','affiliation','National University of Singapore'),(18,'en_US','biography',''),(18,'en_US','familyName','Kumar'),(18,'en_US','givenName','Sabine'),(18,'en_US','preferredPublicName',''),(18,'en_US','signature',''),(18,'fr_CA','affiliation',''),(18,'fr_CA','biography',''),(18,'fr_CA','familyName',''),(18,'fr_CA','givenName',''),(18,'fr_CA','preferredPublicName',''),(18,'fr_CA','signature',''),(19,'en_US','affiliation','University of Calgary'),(19,'en_US','familyName','Clark'),(19,'en_US','givenName','Arthur'),(20,'en_US','affiliation','Athabasca University'),(20,'en_US','familyName','Finkel'),(20,'en_US','givenName','Alvin'),(21,'en_US','affiliation','Athabasca University'),(21,'en_US','familyName','Barnetson'),(21,'en_US','givenName','Bob'),(22,'en_US','affiliation','University of British Columbia'),(22,'en_US','familyName','Beaty'),(22,'en_US','givenName','Bart'),(23,'en_US','affiliation','University of Southern California'),(23,'en_US','familyName','Allan'),(23,'en_US','givenName','Chantal'),(24,'en_US','affiliation','SUNY'),(24,'en_US','familyName','Bernnard'),(24,'en_US','givenName','Deborah'),(25,'en_US','affiliation','Athabasca University'),(25,'en_US','familyName','Kennepohl'),(25,'en_US','givenName','Dietmar'),(26,'en_US','affiliation','University of Sussex'),(26,'en_US','familyName','Perini'),(26,'en_US','givenName','Fernando'),(27,'en_US','affiliation','Buffalo National Park Foundation'),(27,'en_US','familyName','Brower'),(27,'en_US','givenName','Jennifer'),(28,'en_US','affiliation','University of Alberta'),(28,'en_US','familyName','Locke Hart'),(28,'en_US','givenName','Jonathan'),(29,'en_US','affiliation','International Development Research Centre'),(29,'en_US','familyName','Elder'),(29,'en_US','givenName','Laurent'),(30,'en_US','affiliation','Athabasca University'),(30,'en_US','familyName','Ally'),(30,'en_US','givenName','Mohamed'),(31,'en_US','affiliation','University of Alberta'),(31,'en_US','familyName','Dawson'),(31,'en_US','givenName','Michael'),(32,'en_US','affiliation','University of Calgary'),(32,'en_US','familyName','Foran'),(32,'en_US','givenName','Max'),(33,'en_US','affiliation','London School of Economics'),(33,'en_US','familyName','Power'),(33,'en_US','givenName','Michael'),(34,'en_US','affiliation','International Development Research Centre'),(34,'en_US','familyName','Smith'),(34,'en_US','givenName','Matthew');
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_groups`
--

DROP TABLE IF EXISTS `user_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user_groups` (
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `user_user_groups_pkey` (`user_group_id`,`user_id`),
  KEY `user_user_groups_user_group_id` (`user_group_id`),
  KEY `user_user_groups_user_id` (`user_id`),
  CONSTRAINT `user_user_groups_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `user_user_groups_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_groups`
--

LOCK TABLES `user_user_groups` WRITE;
/*!40000 ALTER TABLE `user_user_groups` DISABLE KEYS */;
INSERT INTO `user_user_groups` VALUES (1,1),(2,1),(2,2),(3,3),(5,4),(5,5),(5,6),(6,13),(6,14),(10,15),(10,16),(12,17),(12,18),(13,19),(13,20),(13,21),(13,22),(13,23),(13,24),(13,25),(13,26),(13,27),(13,28),(13,29),(13,30),(13,31),(13,32),(13,33),(13,34),(17,7),(17,8),(17,9),(18,10),(18,11),(18,12),(19,19),(19,20),(19,21),(19,22),(19,23),(19,24),(19,25),(19,26),(19,27),(19,28),(19,29),(19,30),(19,31),(19,32),(19,33),(19,34);
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2y$10$Ju9y.XjIl1zeX6Gc3.AdP.df31P60lRQpRdWuomaMS2ercdzj/OnW','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,'[]',NULL,NULL,'2023-01-09 23:19:09',NULL,'2023-01-09 23:24:10',NULL,NULL,NULL,0,NULL,1),(2,'rvaca','$2y$10$Xix8usP/c5dzMUjXYnEjyu/jPUPGc60f1fv.ZaAfp4uKFQqFwGtHq','rvaca@mailinator.com','','','',NULL,'MX','[]',NULL,NULL,'2023-01-09 23:20:51',NULL,'2023-01-09 23:23:36',0,NULL,NULL,0,NULL,1),(3,'dbarnes','$2y$10$WbKFvE4V1IL9NF3DmBMkmOGYl/MX80yOY.a9eTuYh0Jy9F0TJhC4G','dbarnes@mailinator.com','','','',NULL,'AU','[]',NULL,NULL,'2023-01-09 23:20:57',NULL,'2023-01-09 23:56:09',0,NULL,NULL,0,NULL,1),(4,'dbuskins','$2y$10$sfZFKFdOBqWFys131d0uzeSQj.RE60UQ57XTrj7Ai38FJ5WxXvR0u','dbuskins@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2023-01-09 23:21:04',NULL,NULL,0,NULL,NULL,0,NULL,1),(5,'sberardo','$2y$10$8LK5rajVOOQxTq8AwGjlJOOe/7RB4antMglS3npzWWlUIulGw5RoW','sberardo@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2023-01-09 23:21:10',NULL,NULL,0,NULL,NULL,0,NULL,1),(6,'minoue','$2y$10$VMKzPXcjfQ.jn19o6IRUGOiBTPQXguTXVnSMWKRpvFjE2bumfnvdO','minoue@mailinator.com','','','',NULL,'JP','[]',NULL,NULL,'2023-01-09 23:21:18',NULL,'2023-01-09 23:36:53',0,NULL,NULL,0,NULL,1),(7,'jjanssen','$2y$10$em1STZdhxngior8I2x.Qjei8/1.RggAqt1s4t3cHNR2UlVl.8X8..','jjanssen@mailinator.com','','','',NULL,'NL','[]',NULL,NULL,'2023-01-09 23:21:25',NULL,NULL,0,NULL,NULL,0,NULL,1),(8,'phudson','$2y$10$C3CQi7CS8/fHMjDBCm8ZT.hiEEPx54x.fgAKS5kQZ8/UN/.5AfadW','phudson@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2023-01-09 23:21:34',NULL,'2023-01-09 23:45:56',0,NULL,NULL,0,NULL,1),(9,'amccrae','$2y$10$pWrDqSZXg2MoN11nQpLzuex/1jcn8Yk1Q7H10e7x0xA22/0WbV0qa','amccrae@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2023-01-09 23:21:42',NULL,NULL,0,NULL,NULL,0,NULL,1),(10,'agallego','$2y$10$WtEySpp//igUx39q.B1Px.QwC5je8L/mp5W3MbZ87811Hl25iTESi','agallego@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2023-01-09 23:21:51',NULL,'2023-01-09 23:54:42',0,NULL,NULL,0,NULL,1),(11,'alzacharia','$2y$10$Vq.xeZl/kCjchSG6AbmaH.Cz5vbDc9xpWr4UspNLJ61vFG.XseXau','alzacharia@mailinator.com','','','',NULL,'GH','[]',NULL,NULL,'2023-01-09 23:22:00',NULL,NULL,0,NULL,NULL,0,NULL,1),(12,'gfavio','$2y$10$/xJeoAWbpUk6L3iS7QgXjeejnsGixNnbFeGrvQaGejT25Hzr1totG','gfavio@mailinator.com','','','',NULL,'ES','[]',NULL,NULL,'2023-01-09 23:22:10',NULL,'2023-01-09 23:47:58',0,NULL,NULL,0,NULL,1),(13,'mfritz','$2y$10$/d3NanhYodSlkOgE68hJ3OnMEVXofnB0.ddgDsuGctjdhkk1ul8BK','mfritz@mailinator.com','','','',NULL,'BE','[]',NULL,NULL,'2023-01-09 23:22:20',NULL,NULL,0,NULL,NULL,0,NULL,1),(14,'svogt','$2y$10$d74QB1l8NyQp1U3fiw9ezu8xnvaq1q2NUGoHnF5oShp14l1ATLMoC','svogt@mailinator.com','','','',NULL,'CL','[]',NULL,NULL,'2023-01-09 23:22:31',NULL,NULL,0,NULL,NULL,0,NULL,1),(15,'gcox','$2y$10$kPy/eiS.n4SgFmD.0eR4We98Na.WXws45FU1HfkhdzcJp8nsqyNdi','gcox@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2023-01-09 23:22:42',NULL,NULL,0,NULL,NULL,0,NULL,1),(16,'shellier','$2y$10$C7ngQWZPAsgvc.8GUFcf/.l6lsGb9ezbPmgpRndF55DdG.HHCeQfe','shellier@mailinator.com','','','',NULL,'ZA','[]',NULL,NULL,'2023-01-09 23:22:54',NULL,NULL,0,NULL,NULL,0,NULL,1),(17,'cturner','$2y$10$bPzg/QrCTzU59GGaKvjHq.2SLtqrr3M07UfST0UXHMTpNTfEpRlcW','cturner@mailinator.com','','','',NULL,'GB','[]',NULL,NULL,'2023-01-09 23:23:06',NULL,NULL,0,NULL,NULL,0,NULL,1),(18,'skumar','$2y$10$pej.D3v074mFc96hK37GheTlBLUiuslfYIRWig3Gukrgam1qCNc2y','skumar@mailinator.com','','','',NULL,'SG','[]',NULL,NULL,'2023-01-09 23:23:18',NULL,NULL,0,NULL,NULL,0,NULL,1),(19,'aclark','$2y$10$CB8HuiKjIPHbCAnJXYqCzuF9/dtxN.Y4i4PJMMC5pciAYgUvt4y9W','aclark@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-01-09 23:24:36',NULL,'2023-01-09 23:24:36',NULL,NULL,NULL,0,NULL,1),(20,'afinkel','$2y$10$VU6rW6W7MDGNr7HJzrVXTuOSJ5L.EdabgRG2cu.iUU5Qe6xstbMuG','afinkel@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-01-09 23:25:52',NULL,'2023-01-09 23:25:52',NULL,NULL,NULL,0,NULL,1),(21,'bbarnetson','$2y$10$xRGYlhSfQhYZQCkBzw3Hlemc76p2I06/OzIc2Vsh89S/tbvzJ7Rn6','bbarnetson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-01-09 23:28:54',NULL,'2023-01-09 23:28:55',NULL,NULL,NULL,0,NULL,1),(22,'bbeaty','$2y$10$23NN4FZecF.6Vw4UTGYKXO2Yhz8ILJmZFCACPUFuB/gwNtct1MC6C','bbeaty@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-01-09 23:29:52',NULL,'2023-01-09 23:29:52',NULL,NULL,NULL,0,NULL,1),(23,'callan','$2y$10$P72We4HaJXUV68t7zSoFGuiCABPz36wVfIjJLlTo00AuKd2ka77bi','callan@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-01-09 23:32:08',NULL,'2023-01-09 23:32:08',NULL,NULL,NULL,0,NULL,1),(24,'dbernnard','$2y$10$O2aztWd4hf2t3XZWZ1B.n.CXLVvFy4V2QB84garKEIY6ephUToUcC','dbernnard@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2023-01-09 23:35:33',NULL,'2023-01-09 23:35:34',NULL,NULL,NULL,0,NULL,1),(25,'dkennepohl','$2y$10$XRo/al62jZGRz9GDjtUcDudB5peioJ/vOkyC8LZjq5q7736wSoRvW','dkennepohl@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-01-09 23:37:28',NULL,'2023-01-09 23:37:29',NULL,NULL,NULL,0,NULL,1),(26,'fperini','$2y$10$n1ot5/el8HRNTZ/KIhrO6e4YZbWMXr85C2D5JM3tHakfM3miVOLW6','fperini@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-01-09 23:39:30',NULL,'2023-01-09 23:39:30',NULL,NULL,NULL,0,NULL,1),(27,'jbrower','$2y$10$XY2jBaHAQOou4CwTxQrjJO/aCT2FTN.CTTl84JkzE6bidJBBCkMNm','jbrower@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-01-09 23:40:52',NULL,'2023-01-09 23:40:52',NULL,NULL,NULL,0,NULL,1),(28,'jlockehart','$2y$10$kBVjQPFuMmtNpRCkZcrNg./JB0e7Ix5uuJuTJe3TYxzsJ/yWX8zlq','jlockehart@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-01-09 23:42:35',NULL,'2023-01-09 23:42:35',NULL,NULL,NULL,0,NULL,1),(29,'lelder','$2y$10$oyGwKSOXrZsJej8prJ0tquRIzGIy.zKAT0pWuTS9rXAhw7fWH6s0y','lelder@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-01-09 23:44:38',NULL,'2023-01-09 23:44:38',NULL,NULL,NULL,0,NULL,1),(30,'mally','$2y$10$zCMJ4kc5LjABxA0YxCuSBuZC7u4EoQtUZ8lM/OPA41nzbmQduD8ti','mally@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-01-09 23:46:13',NULL,'2023-01-09 23:46:13',NULL,NULL,NULL,0,NULL,1),(31,'mdawson','$2y$10$4NnsQ4xkNaddE/b6OuCjqO6AJ6yHMAPkHgVCteGx.mcz9SCoPIcHC','mdawson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-01-09 23:48:43',NULL,'2023-01-09 23:48:43',NULL,NULL,NULL,0,NULL,1),(32,'mforan','$2y$10$.HAg7KSfwFyBhpguTf0nHueox/6jqMw25HF4ARS0Sx/AoXerDsgUW','mforan@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-01-09 23:52:05',NULL,'2023-01-09 23:52:05',NULL,NULL,NULL,0,NULL,1),(33,'mpower','$2y$10$3NOUU3tAdGUun4mYLV4vHu6Ec1BzsUTw6FAB7wgnQRGaD.fVMvl5q','mpower@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-01-09 23:53:04',NULL,'2023-01-09 23:53:04',NULL,NULL,NULL,0,NULL,1),(34,'msmith','$2y$10$OnA1xJig5AOO5g.yXfwBAeeroF2tcBR1vrMz2rMlkqLnbBRY3zKRu','msmith@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-01-09 23:55:01',NULL,'2023-01-09 23:55:01',NULL,NULL,NULL,0,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
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
  UNIQUE KEY `versions_pkey` (`product_type`,`product`,`major`,`minor`,`revision`,`build`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,0,0,0,'2023-01-09 23:19:09',1,'plugins.metadata','dc11','',0,0),(1,0,0,0,'2023-01-09 23:19:09',1,'plugins.pubIds','urn','\\APP\\plugins\\pubIds\\urn\\URNPubIdPlugin',0,0),(1,0,0,0,'2023-01-09 23:19:09',1,'plugins.blocks','information','InformationBlockPlugin',1,0),(1,0,0,0,'2023-01-09 23:19:09',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,0,0,0,'2023-01-09 23:19:09',1,'plugins.blocks','browse','\\APP\\plugins\\blocks\\browse\\BrowseBlockPlugin',1,0),(1,0,0,0,'2023-01-09 23:19:09',1,'plugins.blocks','makeSubmission','MakeSubmissionBlockPlugin',1,0),(1,0,0,0,'2023-01-09 23:19:09',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(1,0,0,0,'2023-01-09 23:19:09',1,'plugins.generic','dublinCoreMeta','DublinCoreMetaPlugin',1,0),(1,0,0,0,'2023-01-09 23:19:09',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(1,0,0,0,'2023-01-09 23:19:09',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(1,0,0,0,'2023-01-09 23:19:09',1,'plugins.generic','usageEvent','',0,1),(1,0,0,0,'2023-01-09 23:19:09',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(1,2,0,0,'2023-01-09 23:19:09',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(1,0,0,0,'2023-01-09 23:19:09',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,0,0,0,'2023-01-09 23:19:09',1,'plugins.generic','htmlMonographFile','HtmlMonographFilePlugin',1,0),(1,3,0,0,'2023-01-09 23:19:09',1,'plugins.generic','acron','AcronPlugin',1,1),(1,2,0,0,'2023-01-09 23:19:09',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),(1,0,0,0,'2023-01-09 23:19:09',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(1,0,0,0,'2023-01-09 23:19:09',1,'plugins.themes','default','DefaultThemePlugin',1,0),(1,0,0,0,'2023-01-09 23:19:09',1,'plugins.importexport','users','',0,0),(1,0,0,0,'2023-01-09 23:19:09',1,'plugins.importexport','csv','',0,0),(1,0,0,0,'2023-01-09 23:19:09',1,'plugins.importexport','onix30','',0,0),(1,0,0,0,'2023-01-09 23:19:09',1,'plugins.importexport','native','',0,0),(1,0,0,0,'2023-01-09 23:19:09',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,0,0,0,'2023-01-09 23:19:09',1,'plugins.paymethod','manual','',0,0),(1,0,0,0,'2023-01-09 23:19:09',1,'plugins.paymethod','paypal','',0,0),(1,0,0,0,'2023-01-09 23:19:09',1,'plugins.reports','monographReport','',0,0),(2,0,0,0,'2023-01-09 23:19:09',1,'plugins.reports','reviewReport','',0,0),(3,4,0,0,'2023-01-09 23:19:01',1,'core','omp','',0,1);
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

-- Dump completed on 2023-01-09 23:56:54
