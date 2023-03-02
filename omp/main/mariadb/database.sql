-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: omp-ci
-- ------------------------------------------------------
-- Server version	10.1.48-MariaDB-0ubuntu0.18.04.1

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
INSERT INTO `author_settings` VALUES (1,'','country','CA'),(1,'en','affiliation','University of Calgary'),(1,'en','familyName','Clark'),(1,'en','givenName','Arthur'),(2,'','country','CA'),(2,'en','affiliation','Athabasca University'),(2,'en','familyName','Finkel'),(2,'en','givenName','Alvin'),(3,'','country','CA'),(3,'','isVolumeEditor','0'),(3,'en','familyName','Carter'),(3,'en','givenName','Sarah'),(3,'fr_CA','familyName',NULL),(3,'fr_CA','givenName',NULL),(4,'','country','CA'),(4,'','isVolumeEditor','0'),(4,'en','affiliation',NULL),(4,'en','biography',NULL),(4,'en','familyName','Fortna'),(4,'en','givenName','Peter'),(4,'en','preferredPublicName',NULL),(4,'fr_CA','affiliation',NULL),(4,'fr_CA','biography',NULL),(4,'fr_CA','familyName',NULL),(4,'fr_CA','givenName',NULL),(4,'fr_CA','preferredPublicName',NULL),(5,'','country','CA'),(5,'','isVolumeEditor','0'),(5,'en','affiliation',NULL),(5,'en','biography',NULL),(5,'en','familyName','Friesen'),(5,'en','givenName','Gerald'),(5,'en','preferredPublicName',NULL),(5,'fr_CA','affiliation',NULL),(5,'fr_CA','biography',NULL),(5,'fr_CA','familyName',NULL),(5,'fr_CA','givenName',NULL),(5,'fr_CA','preferredPublicName',NULL),(6,'','country','CA'),(6,'','isVolumeEditor','0'),(6,'en','affiliation',NULL),(6,'en','biography',NULL),(6,'en','familyName','Dick'),(6,'en','givenName','Lyle'),(6,'en','preferredPublicName',NULL),(6,'fr_CA','affiliation',NULL),(6,'fr_CA','biography',NULL),(6,'fr_CA','familyName',NULL),(6,'fr_CA','givenName',NULL),(6,'fr_CA','preferredPublicName',NULL),(7,'','country','CA'),(7,'','isVolumeEditor','0'),(7,'en','affiliation',NULL),(7,'en','biography',NULL),(7,'en','familyName','Wheeler'),(7,'en','givenName','Winona'),(7,'en','preferredPublicName',NULL),(7,'fr_CA','affiliation',NULL),(7,'fr_CA','biography',NULL),(7,'fr_CA','familyName',NULL),(7,'fr_CA','givenName',NULL),(7,'fr_CA','preferredPublicName',NULL),(8,'','country','CA'),(8,'','isVolumeEditor','0'),(8,'en','affiliation',NULL),(8,'en','biography',NULL),(8,'en','familyName','Dyce'),(8,'en','givenName','Matt'),(8,'en','preferredPublicName',NULL),(8,'fr_CA','affiliation',NULL),(8,'fr_CA','biography',NULL),(8,'fr_CA','familyName',NULL),(8,'fr_CA','givenName',NULL),(8,'fr_CA','preferredPublicName',NULL),(9,'','country','CA'),(9,'','isVolumeEditor','0'),(9,'en','affiliation',NULL),(9,'en','biography',NULL),(9,'en','familyName','Opp'),(9,'en','givenName','James'),(9,'en','preferredPublicName',NULL),(9,'fr_CA','affiliation',NULL),(9,'fr_CA','biography',NULL),(9,'fr_CA','familyName',NULL),(9,'fr_CA','givenName',NULL),(9,'fr_CA','preferredPublicName',NULL),(11,'','country','CA'),(11,'en','affiliation','Athabasca University'),(11,'en','familyName','Barnetson'),(11,'en','givenName','Bob'),(12,'','country','CA'),(12,'en','affiliation','University of British Columbia'),(12,'en','familyName','Beaty'),(12,'en','givenName','Bart'),(13,'','country','CA'),(13,'en','affiliation','University of Alberta'),(13,'en','familyName','Miller'),(13,'en','givenName','Toby'),(14,'','country','CA'),(14,'en','affiliation','Athabasca University'),(14,'en','familyName','Wagman'),(14,'en','givenName','Ira'),(15,'','country','CA'),(15,'en','affiliation','University of Calgary'),(15,'en','familyName','Straw'),(15,'en','givenName','Will'),(16,'','country','CA'),(16,'en','affiliation','University of Southern California'),(16,'en','familyName','Allan'),(16,'en','givenName','Chantal'),(17,'','country','US'),(17,'en','affiliation','SUNY'),(17,'en','familyName','Bernnard'),(17,'en','givenName','Deborah'),(18,'','country','US'),(18,'en','affiliation','SUNY'),(18,'en','familyName','Bobish'),(18,'en','givenName','Greg'),(19,'','country','US'),(19,'en','affiliation','SUNY'),(19,'en','familyName','Bullis'),(19,'en','givenName','Daryl'),(20,'','country','US'),(20,'en','affiliation','SUNY'),(20,'en','familyName','Hecker'),(20,'en','givenName','Jenna'),(21,'','country','CA'),(21,'en','affiliation','Athabasca University'),(21,'en','familyName','Kennepohl'),(21,'en','givenName','Dietmar'),(22,'','country','CA'),(22,'en','affiliation','University of Calgary'),(22,'en','familyName','Anderson'),(22,'en','givenName','Terry'),(23,'','country','CA'),(23,'en','affiliation','University of Alberta'),(23,'en','familyName','Gorsky'),(23,'en','givenName','Paul'),(24,'','country','CA'),(24,'en','affiliation','Athabasca University'),(24,'en','familyName','Parchoma'),(24,'en','givenName','Gale'),(25,'','country','CA'),(25,'en','affiliation','University of Alberta'),(25,'en','familyName','Palmer'),(25,'en','givenName','Stuart'),(26,'','country','CA'),(26,'en','affiliation','University of Sussex'),(26,'en','familyName','Perini'),(26,'en','givenName','Fernando'),(27,'','country','GB'),(27,'en','familyName','Mansell'),(27,'en','givenName','Robin'),(28,'','country','AR'),(28,'en','familyName','Galperin'),(28,'en','givenName','Hernan'),(29,'','country','CL'),(29,'en','familyName','Bello'),(29,'en','givenName','Pablo'),(30,'','country','AR'),(30,'en','familyName','Rabinovich'),(30,'en','givenName','Eleonora'),(31,'','country','CA'),(31,'en','affiliation','Buffalo National Park Foundation'),(31,'en','familyName','Brower'),(31,'en','givenName','Jennifer'),(32,'','country','CA'),(32,'en','affiliation','University of Alberta'),(32,'en','familyName','Locke Hart'),(32,'en','givenName','Jonathan'),(33,'','country','CA'),(33,'en','affiliation','International Development Research Centre'),(33,'en','familyName','Elder'),(33,'en','givenName','Laurent'),(34,'','country','CA'),(34,'en','familyName','Emdon'),(34,'en','givenName','Heloise'),(35,'','country','CA'),(35,'en','familyName','Tulus'),(35,'en','givenName','Frank'),(36,'','country','AR'),(36,'en','familyName','Hyma'),(36,'en','givenName','Raymond'),(37,'','country','CA'),(37,'en','familyName','Valk'),(37,'en','givenName','John'),(38,'','country','CA'),(38,'en','familyName','Fourati'),(38,'en','givenName','Khaled'),(39,'','country','CA'),(39,'en','familyName','de Beer'),(39,'en','givenName','Jeremy'),(40,'','country','CA'),(40,'en','familyName','Bannerman'),(40,'en','givenName','Sara'),(41,'','country','CA'),(41,'en','affiliation','Athabasca University'),(41,'en','familyName','Ally'),(41,'en','givenName','Mohamed'),(42,'','country','GB'),(42,'en','familyName','Traxler'),(42,'en','givenName','John'),(43,'','country','CA'),(43,'en','familyName','Koole'),(43,'en','givenName','Marguerite'),(44,'','country','NO'),(44,'en','familyName','Rekkedal'),(44,'en','givenName','Torstein'),(45,'','country','CA'),(45,'en','affiliation','University of Alberta'),(45,'en','familyName','Dawson'),(45,'en','givenName','Michael'),(46,'','country','CA'),(46,'en','affiliation','Athabasca University'),(46,'en','familyName','Dupuis'),(46,'en','givenName','Brian'),(47,'','country','CA'),(47,'en','affiliation','University of Calgary'),(47,'en','familyName','Wilson'),(47,'en','givenName','Michael'),(48,'','country','CA'),(48,'en','affiliation','University of Calgary'),(48,'en','familyName','Foran'),(48,'en','givenName','Max'),(49,'','country','CA'),(49,'en','affiliation','London School of Economics'),(49,'en','familyName','Power'),(49,'en','givenName','Michael'),(50,'','country','CA'),(50,'en','affiliation','International Development Research Centre'),(50,'en','familyName','Smith'),(50,'en','givenName','Matthew'),(51,'','country','US'),(51,'en','familyName','Benkler'),(51,'en','givenName','Yochai'),(52,'','country','CA'),(52,'en','familyName','Reilly'),(52,'en','givenName','Katherine'),(53,'','country','US'),(53,'en','familyName','Loudon'),(53,'en','givenName','Melissa'),(54,'','country','SA'),(54,'en','familyName','Rivett'),(54,'en','givenName','Ulrike'),(55,'','country','GB'),(55,'en','familyName','Graham'),(55,'en','givenName','Mark'),(56,'','country','NO'),(56,'en','familyName','Haarstad'),(56,'en','givenName','Håvard'),(57,'','country','US'),(57,'en','familyName','Smith'),(57,'en','givenName','Marshall');
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
INSERT INTO `category_settings` VALUES (1,'','sortOption','title-ASC'),(1,'en','description',''),(1,'en','title','Applied Science'),(1,'fr_CA','description',''),(1,'fr_CA','title',''),(2,'','sortOption','title-ASC'),(2,'en','description',''),(2,'en','title','Computer Science'),(2,'fr_CA','description',''),(2,'fr_CA','title',''),(3,'','sortOption','title-ASC'),(3,'en','description',''),(3,'en','title','Engineering'),(3,'fr_CA','description',''),(3,'fr_CA','title',''),(4,'','sortOption','title-ASC'),(4,'en','description',''),(4,'en','title','Social Sciences'),(4,'fr_CA','description',''),(4,'fr_CA','title',''),(5,'','sortOption','title-ASC'),(5,'en','description',''),(5,'en','title','Sociology'),(5,'fr_CA','description',''),(5,'fr_CA','title',''),(6,'','sortOption','title-ASC'),(6,'en','description',''),(6,'en','title','Anthropology'),(6,'fr_CA','description',''),(6,'fr_CA','title','');
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
INSERT INTO `controlled_vocab_entry_settings` VALUES (1,'en','submissionKeyword','Business & Economics','string'),(2,'en','submissionKeyword','Political & International Studies','string'),(3,'en','submissionKeyword','Canadian Studies','string'),(4,'en','submissionKeyword','Communication & Cultural Studies','string'),(14,'en','submissionKeyword','Canadian Studies','string'),(15,'en','submissionKeyword','Communication & Cultural Studies','string'),(16,'en','submissionKeyword','Political & International Studies','string'),(17,'en','submissionKeyword','information literacy','string'),(18,'en','submissionKeyword','academic libraries','string'),(19,'en','submissionKeyword','Education','string'),(20,'en','submissionKeyword','Information','string'),(21,'en','submissionKeyword','society','string'),(22,'en','submissionKeyword','ICT','string'),(23,'en','submissionKeyword','Biography & Memoir','string'),(24,'en','submissionKeyword','Environmental Studies','string'),(25,'en','submissionKeyword','Political & International Studies','string'),(26,'en','submissionKeyword','International Development','string'),(27,'en','submissionKeyword','ICT','string'),(28,'en','submissionKeyword','Educational Technology','string'),(30,'en','submissionKeyword','Psychology','string'),(31,'en','submissionKeyword','International Development','string'),(32,'en','submissionKeyword','ICT','string');
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
INSERT INTO `edit_decisions` VALUES (1,1,NULL,1,NULL,3,18,'2023-03-02 22:46:47'),(2,1,1,3,1,3,2,'2023-03-02 22:47:03'),(3,2,NULL,1,NULL,3,18,'2023-03-02 22:50:03'),(4,4,NULL,1,NULL,3,1,'2023-03-02 22:52:24'),(5,4,3,2,1,3,3,'2023-03-02 22:52:41'),(6,4,4,3,1,3,2,'2023-03-02 22:52:59'),(7,4,NULL,4,NULL,3,7,'2023-03-02 22:53:15'),(8,5,NULL,1,NULL,3,1,'2023-03-02 22:54:53'),(9,5,5,2,1,3,3,'2023-03-02 22:55:12'),(10,5,6,3,1,3,2,'2023-03-02 22:55:31'),(11,5,NULL,4,NULL,3,7,'2023-03-02 22:55:50'),(12,6,NULL,1,NULL,3,1,'2023-03-02 22:57:56'),(13,6,7,2,1,6,23,'2023-03-02 22:58:34'),(14,7,NULL,1,NULL,3,18,'2023-03-02 23:00:04'),(15,7,8,3,1,3,2,'2023-03-02 23:00:23'),(16,9,NULL,1,NULL,3,1,'2023-03-02 23:01:59'),(17,11,NULL,1,NULL,3,1,'2023-03-02 23:04:25'),(18,11,10,2,1,3,3,'2023-03-02 23:04:40'),(19,11,11,3,1,3,2,'2023-03-02 23:05:41'),(20,12,NULL,1,NULL,3,1,'2023-03-02 23:06:44'),(21,13,NULL,1,NULL,3,1,'2023-03-02 23:08:18'),(22,13,13,2,1,3,3,'2023-03-02 23:08:35'),(23,13,14,3,1,3,2,'2023-03-02 23:09:49'),(24,14,NULL,1,NULL,3,1,'2023-03-02 23:11:00'),(25,14,15,2,1,3,3,'2023-03-02 23:11:19'),(26,14,16,3,1,3,2,'2023-03-02 23:11:37'),(27,14,NULL,4,NULL,3,7,'2023-03-02 23:11:54'),(28,15,NULL,1,NULL,3,18,'2023-03-02 23:14:02'),(29,16,NULL,1,NULL,3,18,'2023-03-02 23:15:17'),(30,17,NULL,1,NULL,3,1,'2023-03-02 23:17:29');
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
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
INSERT INTO `email_log` VALUES (1,1048585,1,0,'2023-03-02 22:46:33',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: The ABCs of Human Survival: A Paradigm for Global Citizenship','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/1\">The ABCs of Human Survival: A Paradigm for Global Citizenship</a><br />Arthur Clark</p><p><b>Abstract</b></p>The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities―and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(2,1048585,1,0,'2023-03-02 22:46:33',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: The ABCs of Human Survival: A Paradigm for Global Citizenship','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/1\">The ABCs of Human Survival: A Paradigm for Global Citizenship</a><br />Arthur Clark</p><p><b>Abstract</b></p>The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities―and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(3,1048585,1,0,'2023-03-02 22:46:33',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: The ABCs of Human Survival: A Paradigm for Global Citizenship','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/1\">The ABCs of Human Survival: A Paradigm for Global Citizenship</a><br />Arthur Clark</p><p><b>Abstract</b></p>The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities―and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(4,1048585,1,0,'2023-03-02 22:46:33',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Arthur Clark,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/1</p><p>If you have been logged out, you can login again with the username aclark.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(5,1048585,1,3,'2023-03-02 22:46:47',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>','','','Your submission has been sent for review','<p>Dear Arthur Clark,</p><p>I am pleased to inform you that an editor has reviewed your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(6,1048585,1,3,'2023-03-02 22:47:03',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Arthur Clark,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(7,1048585,2,0,'2023-03-02 22:49:33',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: The West and Beyond: New Perspectives on an Imagined Region','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">The West and Beyond: New Perspectives on an Imagined Region</a><br />Alvin Finkel, Sarah Carter, Peter Fortna, Gerald Friesen, Lyle Dick, Winona Wheeler, Matt Dyce, James Opp</p><p><b>Abstract</b></p><p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p><p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(8,1048585,2,0,'2023-03-02 22:49:34',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: The West and Beyond: New Perspectives on an Imagined Region','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">The West and Beyond: New Perspectives on an Imagined Region</a><br />Alvin Finkel, Sarah Carter, Peter Fortna, Gerald Friesen, Lyle Dick, Winona Wheeler, Matt Dyce, James Opp</p><p><b>Abstract</b></p><p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p><p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(9,1048585,2,0,'2023-03-02 22:49:34',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: The West and Beyond: New Perspectives on an Imagined Region','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/2\">The West and Beyond: New Perspectives on an Imagined Region</a><br />Alvin Finkel, Sarah Carter, Peter Fortna, Gerald Friesen, Lyle Dick, Winona Wheeler, Matt Dyce, James Opp</p><p><b>Abstract</b></p><p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p><p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(10,1048585,2,0,'2023-03-02 22:49:34',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Alvin Finkel\" <afinkel@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Alvin Finkel,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The West and Beyond: New Perspectives on an Imagined Region, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/2</p><p>If you have been logged out, you can login again with the username afinkel.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/2\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(11,1048585,2,0,'2023-03-02 22:49:34',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Sarah Carter\" <scarter@mailinator.com>, \"Peter Fortna\" <pfortna@mailinator.com>, \"Gerald Friesen\" <gfriesen@mailinator.com>, \"Lyle Dick\" <ldick@mailinator.com>, \"Winona Wheeler\" <wwheeler@mailinator.com>, \"Matt Dyce\" <mdyce@mailinator.com>, \"James Opp\" <jopp@mailinator.com>','','','Submission confirmation','<p>Dear Sarah Carter, Peter Fortna, Gerald Friesen, Lyle Dick, Winona Wheeler, Matt Dyce, James Opp,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Alvin Finkel, provided the following details:</p><p>The West and Beyond: New Perspectives on an Imagined Region<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(12,1048585,2,3,'2023-03-02 22:50:03',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Alvin Finkel\" <afinkel@mailinator.com>','','','Your submission has been sent for review','<p>Dear Alvin Finkel,</p><p>I am pleased to inform you that an editor has reviewed your submission, The West and Beyond: New Perspectives on an Imagined Region, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(13,1048585,3,0,'2023-03-02 22:51:23',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: The Political Economy of Workplace Injury in Canada','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">The Political Economy of Workplace Injury in Canada</a><br />Bob Barnetson</p><p><b>Abstract</b></p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(14,1048585,3,0,'2023-03-02 22:51:23',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: The Political Economy of Workplace Injury in Canada','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">The Political Economy of Workplace Injury in Canada</a><br />Bob Barnetson</p><p><b>Abstract</b></p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(15,1048585,3,0,'2023-03-02 22:51:23',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: The Political Economy of Workplace Injury in Canada','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/3\">The Political Economy of Workplace Injury in Canada</a><br />Bob Barnetson</p><p><b>Abstract</b></p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(16,1048585,3,0,'2023-03-02 22:51:23',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Bob Barnetson\" <bbarnetson@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Bob Barnetson,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The Political Economy of Workplace Injury in Canada, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/3</p><p>If you have been logged out, you can login again with the username bbarnetson.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/3\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(17,1048585,4,0,'2023-03-02 22:52:09',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: How Canadians Communicate: Contexts of Canadian Popular Culture','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/4\">How Canadians Communicate: Contexts of Canadian Popular Culture</a><br />Bart Beaty, Toby Miller, Ira Wagman, Will Straw</p><p><b>Abstract</b></p>What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(18,1048585,4,0,'2023-03-02 22:52:09',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: How Canadians Communicate: Contexts of Canadian Popular Culture','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/4\">How Canadians Communicate: Contexts of Canadian Popular Culture</a><br />Bart Beaty, Toby Miller, Ira Wagman, Will Straw</p><p><b>Abstract</b></p>What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(19,1048585,4,0,'2023-03-02 22:52:09',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: How Canadians Communicate: Contexts of Canadian Popular Culture','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/4\">How Canadians Communicate: Contexts of Canadian Popular Culture</a><br />Bart Beaty, Toby Miller, Ira Wagman, Will Straw</p><p><b>Abstract</b></p>What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(20,1048585,4,0,'2023-03-02 22:52:10',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Bart Beaty,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/4</p><p>If you have been logged out, you can login again with the username bbeaty.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(21,1048585,4,0,'2023-03-02 22:52:10',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Toby Miller\" <tmiller@mailinator.com>, \"Ira Wagman\" <awagman@mailinator.com>, \"Will Straw\" <wstraw@mailinator.com>','','','Submission confirmation','<p>Dear Toby Miller, Ira Wagman, Will Straw,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Bart Beaty, provided the following details:</p><p>How Canadians Communicate: Contexts of Canadian Popular Culture<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(22,1048585,4,3,'2023-03-02 22:52:24',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Bart Beaty,</p><p>I am pleased to inform you that an editor has reviewed your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(23,1048585,4,3,'2023-03-02 22:52:41',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Your submission has been sent for review','<p>Dear Bart Beaty,</p><p>I am pleased to inform you that an editor has reviewed your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(24,1048585,4,3,'2023-03-02 22:52:59',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Bart Beaty,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(25,1048585,4,3,'2023-03-02 22:53:15',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Bart Beaty,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(26,1048585,5,0,'2023-03-02 22:54:36',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Bomb Canada and Other Unkind Remarks in the American Media','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">Bomb Canada and Other Unkind Remarks in the American Media</a><br />Chantal Allan</p><p><b>Abstract</b></p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(27,1048585,5,0,'2023-03-02 22:54:36',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Bomb Canada and Other Unkind Remarks in the American Media','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">Bomb Canada and Other Unkind Remarks in the American Media</a><br />Chantal Allan</p><p><b>Abstract</b></p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(28,1048585,5,0,'2023-03-02 22:54:36',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Bomb Canada and Other Unkind Remarks in the American Media','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/5\">Bomb Canada and Other Unkind Remarks in the American Media</a><br />Chantal Allan</p><p><b>Abstract</b></p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(29,1048585,5,0,'2023-03-02 22:54:36',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Chantal Allan,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Bomb Canada and Other Unkind Remarks in the American Media, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/5</p><p>If you have been logged out, you can login again with the username callan.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(30,1048585,5,3,'2023-03-02 22:54:53',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Chantal Allan,</p><p>I am pleased to inform you that an editor has reviewed your submission, Bomb Canada and Other Unkind Remarks in the American Media, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(31,1048585,5,3,'2023-03-02 22:55:12',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Your submission has been sent for review','<p>Dear Chantal Allan,</p><p>I am pleased to inform you that an editor has reviewed your submission, Bomb Canada and Other Unkind Remarks in the American Media, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(32,1048585,5,3,'2023-03-02 22:55:31',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Chantal Allan,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Bomb Canada and Other Unkind Remarks in the American Media, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(33,1048585,5,3,'2023-03-02 22:55:50',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Chantal Allan,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, Bomb Canada and Other Unkind Remarks in the American Media, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(34,1048585,6,0,'2023-03-02 22:57:40',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: The Information Literacy User’s Guide','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">The Information Literacy User’s Guide</a><br />Deborah Bernnard, Greg Bobish, Daryl Bullis, Jenna Hecker</p><p><b>Abstract</b></p>Good researchers have a host of tools at their disposal that make navigating today’s complex information ecosystem much more manageable. Gaining the knowledge, abilities, and self-reflection necessary to be a good researcher helps not only in academic settings, but is invaluable in any career, and throughout one’s life. The Information Literacy User’s Guide will start you on this route to success.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(35,1048585,6,0,'2023-03-02 22:57:40',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: The Information Literacy User’s Guide','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">The Information Literacy User’s Guide</a><br />Deborah Bernnard, Greg Bobish, Daryl Bullis, Jenna Hecker</p><p><b>Abstract</b></p>Good researchers have a host of tools at their disposal that make navigating today’s complex information ecosystem much more manageable. Gaining the knowledge, abilities, and self-reflection necessary to be a good researcher helps not only in academic settings, but is invaluable in any career, and throughout one’s life. The Information Literacy User’s Guide will start you on this route to success.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(36,1048585,6,0,'2023-03-02 22:57:40',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: The Information Literacy User’s Guide','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">The Information Literacy User’s Guide</a><br />Deborah Bernnard, Greg Bobish, Daryl Bullis, Jenna Hecker</p><p><b>Abstract</b></p>Good researchers have a host of tools at their disposal that make navigating today’s complex information ecosystem much more manageable. Gaining the knowledge, abilities, and self-reflection necessary to be a good researcher helps not only in academic settings, but is invaluable in any career, and throughout one’s life. The Information Literacy User’s Guide will start you on this route to success.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(37,1048585,6,0,'2023-03-02 22:57:40',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Deborah Bernnard\" <dbernnard@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Deborah Bernnard,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The Information Literacy User’s Guide, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/6</p><p>If you have been logged out, you can login again with the username dbernnard.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/6\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(38,1048585,6,0,'2023-03-02 22:57:40',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Greg Bobish\" <gbobish@mailinator.com>, \"Daryl Bullis\" <dbullis@mailinator.com>, \"Jenna Hecker\" <jhecker@mailinator.com>','','','Submission confirmation','<p>Dear Greg Bobish, Daryl Bullis, Jenna Hecker,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Deborah Bernnard, provided the following details:</p><p>The Information Literacy User’s Guide<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(39,1048585,6,3,'2023-03-02 22:57:56',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Deborah Bernnard\" <dbernnard@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Deborah Bernnard,</p><p>I am pleased to inform you that an editor has reviewed your submission, The Information Literacy User’s Guide, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(40,1048585,7,0,'2023-03-02 22:59:47',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Accessible Elements: Teaching Science Online and at a Distance','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">Accessible Elements: Teaching Science Online and at a Distance</a><br />Dietmar Kennepohl, Terry Anderson, Paul Gorsky, Gale Parchoma, Stuart Palmer</p><p><b>Abstract</b></p>Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(41,1048585,7,0,'2023-03-02 22:59:47',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Accessible Elements: Teaching Science Online and at a Distance','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">Accessible Elements: Teaching Science Online and at a Distance</a><br />Dietmar Kennepohl, Terry Anderson, Paul Gorsky, Gale Parchoma, Stuart Palmer</p><p><b>Abstract</b></p>Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(42,1048585,7,0,'2023-03-02 22:59:47',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Accessible Elements: Teaching Science Online and at a Distance','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/7\">Accessible Elements: Teaching Science Online and at a Distance</a><br />Dietmar Kennepohl, Terry Anderson, Paul Gorsky, Gale Parchoma, Stuart Palmer</p><p><b>Abstract</b></p>Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(43,1048585,7,0,'2023-03-02 22:59:47',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Dietmar Kennepohl,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Accessible Elements: Teaching Science Online and at a Distance, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/7</p><p>If you have been logged out, you can login again with the username dkennepohl.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/7\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(44,1048585,7,0,'2023-03-02 22:59:47',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Terry Anderson\" <tanderson@mailinator.com>, \"Paul Gorsky\" <pgorsky@mailinator.com>, \"Gale Parchoma\" <gparchoma@mailinator.com>, \"Stuart Palmer\" <spalmer@mailinator.com>','','','Submission confirmation','<p>Dear Terry Anderson, Paul Gorsky, Gale Parchoma, Stuart Palmer,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Dietmar Kennepohl, provided the following details:</p><p>Accessible Elements: Teaching Science Online and at a Distance<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(45,1048585,7,3,'2023-03-02 23:00:04',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>','','','Your submission has been sent for review','<p>Dear Dietmar Kennepohl,</p><p>I am pleased to inform you that an editor has reviewed your submission, Accessible Elements: Teaching Science Online and at a Distance, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(46,1048585,7,3,'2023-03-02 23:00:23',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Dietmar Kennepohl,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Accessible Elements: Teaching Science Online and at a Distance, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/7\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(47,1048585,8,0,'2023-03-02 23:00:47',805306370,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','You have been assigned as an editor on a submission to Public Knowledge Press','<p>Dear Daniel Barnes,</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Editorial</a><br /></p><p><b>Abstract</b></p>A Note From The Publisher<p>If you find the submission to be relevant for Public Knowledge Press, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(48,1048585,8,0,'2023-03-02 23:00:47',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Editorial','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Editorial</a><br /></p><p><b>Abstract</b></p>A Note From The Publisher<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(49,1048585,8,0,'2023-03-02 23:00:47',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Editorial','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Editorial</a><br /></p><p><b>Abstract</b></p>A Note From The Publisher<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(50,1048585,8,0,'2023-03-02 23:00:47',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Editorial','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/8\">Editorial</a><br /></p><p><b>Abstract</b></p>A Note From The Publisher<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(51,1048585,9,0,'2023-03-02 23:01:43',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Enabling Openness: The future of the information society in Latin America and the Caribbean','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/9\">Enabling Openness: The future of the information society in Latin America and the Caribbean</a><br />Fernando Perini, Robin Mansell, Hernan Galperin, Pablo Bello, Eleonora Rabinovich</p><p><b>Abstract</b></p>In recent years, the Internet and other network technologies have emerged as a central issue for development in Latin America and the Caribbean. They have shown their potential to increase productivity and economic competitiveness, to create new ways to deliver education and health services, and to be driving forces for the modernization of the provision of public services.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(52,1048585,9,0,'2023-03-02 23:01:43',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Enabling Openness: The future of the information society in Latin America and the Caribbean','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/9\">Enabling Openness: The future of the information society in Latin America and the Caribbean</a><br />Fernando Perini, Robin Mansell, Hernan Galperin, Pablo Bello, Eleonora Rabinovich</p><p><b>Abstract</b></p>In recent years, the Internet and other network technologies have emerged as a central issue for development in Latin America and the Caribbean. They have shown their potential to increase productivity and economic competitiveness, to create new ways to deliver education and health services, and to be driving forces for the modernization of the provision of public services.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(53,1048585,9,0,'2023-03-02 23:01:43',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Enabling Openness: The future of the information society in Latin America and the Caribbean','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/9\">Enabling Openness: The future of the information society in Latin America and the Caribbean</a><br />Fernando Perini, Robin Mansell, Hernan Galperin, Pablo Bello, Eleonora Rabinovich</p><p><b>Abstract</b></p>In recent years, the Internet and other network technologies have emerged as a central issue for development in Latin America and the Caribbean. They have shown their potential to increase productivity and economic competitiveness, to create new ways to deliver education and health services, and to be driving forces for the modernization of the provision of public services.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(54,1048585,9,0,'2023-03-02 23:01:43',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Fernando Perini\" <fperini@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Fernando Perini,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Enabling Openness: The future of the information society in Latin America and the Caribbean, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/9</p><p>If you have been logged out, you can login again with the username fperini.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/9\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(55,1048585,9,0,'2023-03-02 23:01:43',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Robin Mansell\" <rmansell@mailinator.com>, \"Hernan Galperin\" <hgalperin@mailinator.com>, \"Pablo Bello\" <pbello@mailinator.com>, \"Eleonora Rabinovich\" <erabinovich@mailinator.com>','','','Submission confirmation','<p>Dear Robin Mansell, Hernan Galperin, Pablo Bello, Eleonora Rabinovich,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Fernando Perini, provided the following details:</p><p>Enabling Openness: The future of the information society in Latin America and the Caribbean<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(56,1048585,9,3,'2023-03-02 23:01:59',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Fernando Perini\" <fperini@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Fernando Perini,</p><p>I am pleased to inform you that an editor has reviewed your submission, Enabling Openness: The future of the information society in Latin America and the Caribbean, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(57,1048585,10,0,'2023-03-02 23:03:45',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Lost Tracks: Buffalo National Park, 1909-1939','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">Lost Tracks: Buffalo National Park, 1909-1939</a><br />Jennifer Brower</p><p><b>Abstract</b></p>While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(58,1048585,10,0,'2023-03-02 23:03:45',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Lost Tracks: Buffalo National Park, 1909-1939','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">Lost Tracks: Buffalo National Park, 1909-1939</a><br />Jennifer Brower</p><p><b>Abstract</b></p>While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(59,1048585,10,0,'2023-03-02 23:03:45',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Lost Tracks: Buffalo National Park, 1909-1939','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/10\">Lost Tracks: Buffalo National Park, 1909-1939</a><br />Jennifer Brower</p><p><b>Abstract</b></p>While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(60,1048585,10,0,'2023-03-02 23:03:45',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Jennifer Brower\" <jbrower@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Jennifer Brower,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Lost Tracks: Buffalo National Park, 1909-1939, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/10</p><p>If you have been logged out, you can login again with the username jbrower.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/10\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(61,1048585,11,0,'2023-03-02 23:04:11',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Dreamwork','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">Dreamwork</a><br />Jonathan Locke Hart</p><p><b>Abstract</b></p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(62,1048585,11,0,'2023-03-02 23:04:11',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Dreamwork','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">Dreamwork</a><br />Jonathan Locke Hart</p><p><b>Abstract</b></p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(63,1048585,11,0,'2023-03-02 23:04:11',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Dreamwork','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">Dreamwork</a><br />Jonathan Locke Hart</p><p><b>Abstract</b></p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(64,1048585,11,0,'2023-03-02 23:04:11',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Jonathan Locke Hart,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Dreamwork, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/11</p><p>If you have been logged out, you can login again with the username jlockehart.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/11\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(65,1048585,11,3,'2023-03-02 23:04:25',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that an editor has reviewed your submission, Dreamwork, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(66,1048585,11,3,'2023-03-02 23:04:41',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Your submission has been sent for review','<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that an editor has reviewed your submission, Dreamwork, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(67,1048585,11,10,'2023-03-02 23:05:06',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Adela Gallego accepted review assignment for #11 Locke Hart — Dreamwork','<p>Dear Ramiro Vaca,</p><p>Adela Gallego has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">#11 Locke Hart — Dreamwork</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><b>Review Due:</b> 2023-03-30</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.'),(68,1048585,11,12,'2023-03-02 23:05:18',1073741829,'\"Gonzalo Favio\" <gfavio@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Gonzalo Favio accepted review assignment for #11 Locke Hart — Dreamwork','<p>Dear Ramiro Vaca,</p><p>Gonzalo Favio has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">#11 Locke Hart — Dreamwork</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><b>Review Due:</b> 2023-03-30</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/11\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.'),(69,1048585,11,3,'2023-03-02 23:05:42',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Dreamwork, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/11\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(70,1048585,12,0,'2023-03-02 23:06:28',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Connecting ICTs to Development','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">Connecting ICTs to Development</a><br />Laurent Elder, Heloise Emdon, Frank Tulus, Raymond Hyma, John Valk, Khaled Fourati, Jeremy de Beer, Sara Bannerman</p><p><b>Abstract</b></p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(71,1048585,12,0,'2023-03-02 23:06:28',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Connecting ICTs to Development','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">Connecting ICTs to Development</a><br />Laurent Elder, Heloise Emdon, Frank Tulus, Raymond Hyma, John Valk, Khaled Fourati, Jeremy de Beer, Sara Bannerman</p><p><b>Abstract</b></p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(72,1048585,12,0,'2023-03-02 23:06:28',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Connecting ICTs to Development','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">Connecting ICTs to Development</a><br />Laurent Elder, Heloise Emdon, Frank Tulus, Raymond Hyma, John Valk, Khaled Fourati, Jeremy de Beer, Sara Bannerman</p><p><b>Abstract</b></p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(73,1048585,12,0,'2023-03-02 23:06:28',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Laurent Elder\" <lelder@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Laurent Elder,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Connecting ICTs to Development, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/12</p><p>If you have been logged out, you can login again with the username lelder.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/12\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(74,1048585,12,0,'2023-03-02 23:06:28',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Frank Tulus\" <ftulus@mailinator.com>, \"Raymond Hyma\" <rhyma@mailinator.com>, \"John Valk\" <jvalk@mailinator.com>, \"Khaled Fourati\" <fkourati@mailinator.com>, \"Jeremy de Beer\" <jdebeer@mailinator.com>, \"Sara Bannerman\" <sbannerman@mailinator.com>','','','Submission confirmation','<p>Dear Frank Tulus, Raymond Hyma, John Valk, Khaled Fourati, Jeremy de Beer, Sara Bannerman,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Laurent Elder, provided the following details:</p><p>Connecting ICTs to Development<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(75,1048585,12,3,'2023-03-02 23:06:45',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Laurent Elder\" <lelder@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Laurent Elder,</p><p>I am pleased to inform you that an editor has reviewed your submission, Connecting ICTs to Development, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(76,1048585,12,8,'2023-03-02 23:07:19',1073741829,'\"Paul Hudson\" <phudson@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Paul Hudson accepted review assignment for #12 Elder et al. — Connecting ICTs to Development','<p>Dear Ramiro Vaca,</p><p>Paul Hudson has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">#12 Elder et al. — Connecting ICTs to Development</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><b>Review Due:</b> 2023-03-30</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/12\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.'),(77,1048585,13,0,'2023-03-02 23:08:03',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">Mobile Learning: Transforming the Delivery of Education and Training</a><br />Mohamed Ally, John Traxler, Marguerite Koole, Torstein Rekkedal</p><p><b>Abstract</b></p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(78,1048585,13,0,'2023-03-02 23:08:03',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">Mobile Learning: Transforming the Delivery of Education and Training</a><br />Mohamed Ally, John Traxler, Marguerite Koole, Torstein Rekkedal</p><p><b>Abstract</b></p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(79,1048585,13,0,'2023-03-02 23:08:03',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">Mobile Learning: Transforming the Delivery of Education and Training</a><br />Mohamed Ally, John Traxler, Marguerite Koole, Torstein Rekkedal</p><p><b>Abstract</b></p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(80,1048585,13,0,'2023-03-02 23:08:03',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Mohamed Ally,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Mobile Learning: Transforming the Delivery of Education and Training, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/13</p><p>If you have been logged out, you can login again with the username mally.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(81,1048585,13,0,'2023-03-02 23:08:03',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Traxler\" <jtraxler@mailinator.com>, \"Marguerite Koole\" <mkoole@mailinator.com>, \"Torstein Rekkedal\" <trekkedal@mailinator.com>','','','Submission confirmation','<p>Dear John Traxler, Marguerite Koole, Torstein Rekkedal,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Mohamed Ally, provided the following details:</p><p>Mobile Learning: Transforming the Delivery of Education and Training<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(82,1048585,13,3,'2023-03-02 23:08:18',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that an editor has reviewed your submission, Mobile Learning: Transforming the Delivery of Education and Training, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(83,1048585,13,3,'2023-03-02 23:08:35',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Your submission has been sent for review','<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that an editor has reviewed your submission, Mobile Learning: Transforming the Delivery of Education and Training, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(84,1048585,13,10,'2023-03-02 23:09:10',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Adela Gallego accepted review assignment for #13 Ally et al. — Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear Ramiro Vaca,</p><p>Adela Gallego has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">#13 Ally et al. — Mobile Learning: Transforming the Delivery of Education and Training</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><b>Review Due:</b> 2023-03-30</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.'),(85,1048585,13,12,'2023-03-02 23:09:23',1073741829,'\"Gonzalo Favio\" <gfavio@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Gonzalo Favio accepted review assignment for #13 Ally et al. — Mobile Learning: Transforming the Delivery of Education and Training','<p>Dear Ramiro Vaca,</p><p>Gonzalo Favio has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">#13 Ally et al. — Mobile Learning: Transforming the Delivery of Education and Training</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><b>Review Due:</b> 2023-03-30</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/13\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.'),(86,1048585,13,3,'2023-03-02 23:09:49',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Mobile Learning: Transforming the Delivery of Education and Training, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(87,1048585,14,0,'2023-03-02 23:10:43',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/14\">From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots</a><br />Michael Dawson, Brian Dupuis, Michael Wilson</p><p><b>Abstract</b></p>From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(88,1048585,14,0,'2023-03-02 23:10:43',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/14\">From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots</a><br />Michael Dawson, Brian Dupuis, Michael Wilson</p><p><b>Abstract</b></p>From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(89,1048585,14,0,'2023-03-02 23:10:43',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/14\">From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots</a><br />Michael Dawson, Brian Dupuis, Michael Wilson</p><p><b>Abstract</b></p>From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(90,1048585,14,0,'2023-03-02 23:10:43',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Michael Dawson,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/14</p><p>If you have been logged out, you can login again with the username mdawson.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(91,1048585,14,0,'2023-03-02 23:10:43',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Brian Dupuis\" <bdupuis@mailinator.com>, \"Michael Wilson\" <mwilson@mailinator.com>','','','Submission confirmation','<p>Dear Brian Dupuis, Michael Wilson,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Michael Dawson, provided the following details:</p><p>From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(92,1048585,14,3,'2023-03-02 23:11:00',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Michael Dawson,</p><p>I am pleased to inform you that an editor has reviewed your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(93,1048585,14,3,'2023-03-02 23:11:19',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Your submission has been sent for review','<p>Dear Michael Dawson,</p><p>I am pleased to inform you that an editor has reviewed your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(94,1048585,14,3,'2023-03-02 23:11:37',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Michael Dawson,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(95,1048585,14,3,'2023-03-02 23:11:54',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Michael Dawson,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(96,1048585,15,0,'2023-03-02 23:13:46',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Expansive Discourses: Urban Sprawl in Calgary, 1945-1978','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">Expansive Discourses: Urban Sprawl in Calgary, 1945-1978</a><br />Max Foran</p><p><b>Abstract</b></p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(97,1048585,15,0,'2023-03-02 23:13:46',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Expansive Discourses: Urban Sprawl in Calgary, 1945-1978','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">Expansive Discourses: Urban Sprawl in Calgary, 1945-1978</a><br />Max Foran</p><p><b>Abstract</b></p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(98,1048585,15,0,'2023-03-02 23:13:46',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Expansive Discourses: Urban Sprawl in Calgary, 1945-1978','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/15\">Expansive Discourses: Urban Sprawl in Calgary, 1945-1978</a><br />Max Foran</p><p><b>Abstract</b></p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(99,1048585,15,0,'2023-03-02 23:13:46',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Max Foran\" <mforan@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Max Foran,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Expansive Discourses: Urban Sprawl in Calgary, 1945-1978, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/15</p><p>If you have been logged out, you can login again with the username mforan.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/15\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(100,1048585,15,3,'2023-03-02 23:14:02',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Max Foran\" <mforan@mailinator.com>','','','Your submission has been sent for review','<p>Dear Max Foran,</p><p>I am pleased to inform you that an editor has reviewed your submission, Expansive Discourses: Urban Sprawl in Calgary, 1945-1978, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(101,1048585,16,0,'2023-03-02 23:14:58',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: A Designer\'s Log: Case Studies in Instructional Design','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">A Designer\'s Log: Case Studies in Instructional Design</a><br />Michael Power</p><p><b>Abstract</b></p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(102,1048585,16,0,'2023-03-02 23:14:59',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: A Designer\'s Log: Case Studies in Instructional Design','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">A Designer\'s Log: Case Studies in Instructional Design</a><br />Michael Power</p><p><b>Abstract</b></p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(103,1048585,16,0,'2023-03-02 23:14:59',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: A Designer\'s Log: Case Studies in Instructional Design','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">A Designer\'s Log: Case Studies in Instructional Design</a><br />Michael Power</p><p><b>Abstract</b></p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(104,1048585,16,0,'2023-03-02 23:14:59',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Michael Power\" <mpower@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Michael Power,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, A Designer\'s Log: Case Studies in Instructional Design, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/16</p><p>If you have been logged out, you can login again with the username mpower.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/16\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(105,1048585,16,3,'2023-03-02 23:15:17',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Power\" <mpower@mailinator.com>','','','Your submission has been sent for review','<p>Dear Michael Power,</p><p>I am pleased to inform you that an editor has reviewed your submission, A Designer\'s Log: Case Studies in Instructional Design, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(106,1048585,16,10,'2023-03-02 23:15:54',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','Review accepted: Adela Gallego accepted review assignment for #16 Power — A Designer\'s Log: Case Studies in Instructional Design','<p>Dear Ramiro Vaca,</p><p>Adela Gallego has accepted the following review:</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">#16 Power — A Designer\'s Log: Case Studies in Instructional Design</a><br /><b>Type:</b> Anonymous Reviewer/Anonymous Author</p><b>Review Due:</b> 2023-03-30</p><p>Login to <a href=\"http://localhost/index.php/publicknowledge/workflow/access/16\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.'),(107,1048585,17,0,'2023-03-02 23:17:10',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"admin admin\" <pkpadmin@mailinator.com>','','','A new submission needs an editor to be assigned: Open Development: Networked Innovations in International Development','<p>Dear admin admin,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">Open Development: Networked Innovations in International Development</a><br />Matthew Smith, Yochai Benkler, Katherine Reilly, Melissa Loudon, Ulrike Rivett, Mark Graham, Håvard Haarstad, Marshall Smith</p><p><b>Abstract</b></p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(108,1048585,17,0,'2023-03-02 23:17:10',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ramiro Vaca\" <rvaca@mailinator.com>','','','A new submission needs an editor to be assigned: Open Development: Networked Innovations in International Development','<p>Dear Ramiro Vaca,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">Open Development: Networked Innovations in International Development</a><br />Matthew Smith, Yochai Benkler, Katherine Reilly, Melissa Loudon, Ulrike Rivett, Mark Graham, Håvard Haarstad, Marshall Smith</p><p><b>Abstract</b></p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(109,1048585,17,0,'2023-03-02 23:17:10',805306373,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','A new submission needs an editor to be assigned: Open Development: Networked Innovations in International Development','<p>Dear Daniel Barnes,</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"http://localhost/index.php/publicknowledge/workflow/access/17\">Open Development: Networked Innovations in International Development</a><br />Matthew Smith, Yochai Benkler, Katherine Reilly, Melissa Loudon, Ulrike Rivett, Mark Graham, Håvard Haarstad, Marshall Smith</p><p><b>Abstract</b></p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(110,1048585,17,0,'2023-03-02 23:17:10',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Matthew Smith\" <msmith@mailinator.com>','','','Thank you for your submission to Public Knowledge Press','<p>Dear Matthew Smith,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Open Development: Networked Innovations in International Development, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/17</p><p>If you have been logged out, you can login again with the username msmith.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/17\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(111,1048585,17,0,'2023-03-02 23:17:10',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Yochai Benkler\" <ybenkler@mailinator.com>, \"Katherine Reilly\" <kreilly@mailinator.com>, \"Melissa Loudon\" <mloudon@mailinator.com>, \"Ulrike Rivett\" <urivett@mailinator.com>, \"Mark Graham\" <mgraham@mailinator.com>, \"Håvard Haarstad\" <hhaarstad@mailinator.com>, \"Marshall Smith\" <masmith@mailinator.com>','','','Submission confirmation','<p>Dear Yochai Benkler, Katherine Reilly, Melissa Loudon, Ulrike Rivett, Mark Graham, Håvard Haarstad, Marshall Smith,</p><p>You have been named as a co-author on a submission to Public Knowledge Press. The submitter, Matthew Smith, provided the following details:</p><p>Open Development: Networked Innovations in International Development<br></p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering Public Knowledge Press as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>'),(112,1048585,17,3,'2023-03-02 23:17:29',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Matthew Smith\" <msmith@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Matthew Smith,</p><p>I am pleased to inform you that an editor has reviewed your submission, Open Development: Networked Innovations in International Development, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>');
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
INSERT INTO `email_log_users` VALUES (1,1),(2,2),(3,3),(4,19),(5,19),(6,19),(7,1),(8,2),(9,3),(10,20),(12,20),(13,1),(14,2),(15,3),(16,21),(17,1),(18,2),(19,3),(20,22),(22,22),(23,22),(24,22),(25,22),(26,1),(27,2),(28,3),(29,23),(30,23),(31,23),(32,23),(33,23),(34,1),(35,2),(36,3),(37,24),(39,24),(40,1),(41,2),(42,3),(43,25),(45,25),(46,25),(47,3),(48,1),(49,2),(50,3),(51,1),(52,2),(53,3),(54,26),(56,26),(57,1),(58,2),(59,3),(60,27),(61,1),(62,2),(63,3),(64,28),(65,28),(66,28),(67,2),(68,2),(69,28),(70,1),(71,2),(72,3),(73,29),(75,29),(76,2),(77,1),(78,2),(79,3),(80,30),(82,30),(83,30),(84,2),(85,2),(86,30),(87,1),(88,2),(89,3),(90,31),(92,31),(93,31),(94,31),(95,31),(96,1),(97,2),(98,3),(99,32),(100,32),(101,1),(102,2),(103,3),(104,33),(105,33),(106,2),(107,1),(108,2),(109,3),(110,34),(112,34);
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
  `email_key` varchar(255) NOT NULL COMMENT 'Unique identifier for this email.',
  `locale` varchar(14) NOT NULL DEFAULT 'en',
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
INSERT INTO `email_templates_default_data` VALUES ('ANNOUNCEMENT','en','New Announcement','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href=\"{$announcementUrl}\">full announcement</a>.'),('ANNOUNCEMENT','fr_CA','','',''),('COPYEDIT_REQUEST','en','Request Copyedit','Submission {$submissionId} is ready to be copyedited for {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready to be copyedited:</p><p><a href\"{$submissionUrl}\">{$submissionId} — {$submissionTitle}</a><br />{$pressName}</p><p>Please follow these steps to complete this task:</p><ol><li>Click on the Submission URL below.</li><li>Open any files available under Draft Files and edit the files. Use the Copyediting Discussions area if you need to contact the editor(s) or author(s).</li><li>Save the copyedited file(s) and upload them to the Copyedited panel.</li><li>Use the Copyediting Discussions to notify the editor(s) that all files have been prepared, and that the Production process may begin.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to {$pressName}.</p><p>Kind regards,</p>{$signature}'),('COPYEDIT_REQUEST','fr_CA','','Demande de révision d\'une soumission','{$recipientName},<br />\n<br />\nJ\'aimerais que vous effectuiez la révision du manuscrit intitulé « {$submissionTitle} » pour la revue {$pressName} à l\'aide des étapes suivantes.<br />\n1. Cliquer sur l\'URL de la soumission ci-dessous.<br />\n2. Ouvrir le(s) fichier(s) disponible(s) sous Fichiers des ébauches finales et effectuer votre révision, tout en ajoutant des discussions sur la révision, le cas échéant.<br />\n3. Enregistrer le(s) fichier(s) révisé(s) et le(s) téléverser dans la section Version(s) révisée(s).<br />\n4. Informer le,la rédacteur-trice que tous les fichiers ont été révisés et que l\'étape de production peut débuter.<br />\n<br />\nURL de la revue {$pressName} : {$pressUrl}<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}'),('DISCUSSION_NOTIFICATION_COPYEDITING','en','Discussion (Copyediting)','A message regarding {$pressName}','Please enter your message.'),('DISCUSSION_NOTIFICATION_COPYEDITING','fr_CA','','Un message à propos de la revue {$pressName}','Prière de saisir votre message.'),('DISCUSSION_NOTIFICATION_PRODUCTION','en','Discussion (Production)','A message regarding {$pressName}','Please enter your message.'),('DISCUSSION_NOTIFICATION_PRODUCTION','fr_CA','','Un message à propos de la revue {$pressName}','Prière de saisir votre message.'),('DISCUSSION_NOTIFICATION_REVIEW','en','Discussion (Review)','A message regarding {$pressName}','Please enter your message.'),('DISCUSSION_NOTIFICATION_REVIEW','fr_CA','','Un message à propos de la revue {$pressName}','Prière de saisir votre message.'),('DISCUSSION_NOTIFICATION_SUBMISSION','en','Discussion (Submission)','A message regarding {$pressName}','Please enter your message.'),('DISCUSSION_NOTIFICATION_SUBMISSION','fr_CA','','Un message à propos de la revue {$pressName}','Prière de saisir votre message.'),('EDITORIAL_REMINDER','en','Editorial Reminder','Outstanding editorial tasks for {$pressName}','<p>Dear {$recipientName},</p><p>You are currently assigned to {$numberOfSubmissions} submissions in <a href=\"{$pressUrl}\">{$pressName}</a>. The following submissions are <b>waiting for your response</b>.</p>{$outstandingTasks}<p>View all of your assignments in your <a href=\"{$submissionsUrl}\">submission dashboard</a>.</p><p>If you have any questions about your assignments, please contact {$contactName} at {$contactEmail}.</p>'),('EDITORIAL_REMINDER','fr_CA','','',''),('EDITOR_ASSIGN','en','Editor Assigned','You have been assigned as an editor on a submission to {$pressName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>If you find the submission to be relevant for {$pressName}, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$pressSignature}'),('EDITOR_ASSIGN','fr_CA','','Travail éditorial','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; à la presse {$pressName} vous a été assignée. En tant que rédacteur en chef, vous devrez superviser le processus éditorial de cette soumission.<br />\n<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci,'),('EDITOR_ASSIGN_PRODUCTION','en','Assign Editor','You have been assigned as an editor on a submission to {$pressName}',''),('EDITOR_ASSIGN_PRODUCTION','fr_CA','','Travail éditorial',''),('EDITOR_ASSIGN_REVIEW','en','Assign Editor','You have been assigned as an editor on a submission to {$pressName}',''),('EDITOR_ASSIGN_REVIEW','fr_CA','','Travail éditorial',''),('EDITOR_ASSIGN_SUBMISSION','en','Assign Editor','You have been assigned as an editor on a submission to {$pressName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>If you find the submission to be relevant for {$pressName}, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$pressSignature}'),('EDITOR_ASSIGN_SUBMISSION','fr_CA','','Travail éditorial','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; à la presse {$pressName} vous a été assignée. En tant que rédacteur en chef, vous devrez superviser le processus éditorial de cette soumission.<br />\n<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci,'),('EDITOR_DECISION_ACCEPT','en','Submission Accepted','Your submission has been accepted to {$pressName}','<p>Dear {$recipientName},</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, {$submissionTitle}, to meet or exceed our expectations. We are excited to publish your piece in {$pressName} and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for {$pressName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),('EDITOR_DECISION_ACCEPT','fr_CA','','Décision du rédacteur en chef','{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$pressName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}'),('EDITOR_DECISION_BACK_FROM_COPYEDITING','en','Submission Sent Back from Copyediting','Your submission has been sent back to review','<p>Dear {$recipientName},</p><p>Your submission, {$submissionTitle}, has been sent back to the review stage. It will undergo further review before it can be accepted for publication.</p><p>Occasionally, a decision to accept a submission will be recorded accidentally in our system and we must send it back to review. I apologize for any confusion this has caused. We will work to complete any further review quickly so that you have a final decision as soon as possible.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>'),('EDITOR_DECISION_BACK_FROM_COPYEDITING','fr_CA','','',''),('EDITOR_DECISION_BACK_FROM_PRODUCTION','en','Submission Sent Back to Copyediting','Your submission has been sent back to copyediting','<p>Dear {$recipientName},</p><p>Your submission, {$submissionTitle}, has been sent back to the copyediting stage, where it will undergo further copyediting and formatting to prepare it for publication.</p><p>Occasionally, a submission is sent to the production stage before it is ready for the final galleys to be prepared for publication. Your submission is still forthcoming. I apologize for any confusion.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We will contact you if we need any further assistance.</p><p>Kind regards,</p><p>{$signature}</p>'),('EDITOR_DECISION_BACK_FROM_PRODUCTION','fr_CA','','',''),('EDITOR_DECISION_CANCEL_REVIEW_ROUND','en','Review Round Cancelled','A review round for your submission has been cancelled','<p>Dear {$recipientName},</p><p>We recently opened a new review round for your submission, {$submissionTitle}. We are closing this review round now.</p><p>Occasionally, a decision to open a round of review will be recorded accidentally in our system and we must cancel this review round. I apologize for any confusion this may have caused.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>'),('EDITOR_DECISION_CANCEL_REVIEW_ROUND','fr_CA','','',''),('EDITOR_DECISION_DECLINE','en','Submission Declined','Your submission has been declined','<p>Dear {$recipientName},</p><p>While we appreciate receiving your submission, we are unable to accept {$submissionTitle} for publication on the basis of the comments from reviewers.</p><p>The reviewers\' comments are included at the bottom of this email.</p><p>Thank you for submitting to {$pressName}. Although it is disappointing to have a submission declined, I hope you find the reviewers\' comments to be constructive and helpful.</p><p>You are now free to submit the work elsewhere if you choose to do so.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),('EDITOR_DECISION_DECLINE','fr_CA','','Décision du rédacteur','{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de refuser votre soumission.'),('EDITOR_DECISION_INITIAL_DECLINE','en','Submission Declined (Pre-Review)','Your submission has been declined','<p>Dear {$recipientName},</p><p>I’m sorry to inform you that, after reviewing your submission, {$submissionTitle}, the editor has found that it does not meet our requirements for publication in {$pressName}.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p>{$signature}'),('EDITOR_DECISION_INITIAL_DECLINE','fr_CA','','Décision du rédacteur','\n			{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à  la revue {$pressName}.<br />\n<br />\nNotre décision est de refuser votre soumission.'),('EDITOR_DECISION_NEW_ROUND','en','New Review Round Initiated','Your submission has been sent for another round of review','<p>Dear {$recipientName},</p>\n<p>Your revised submission, {$submissionTitle}, has been sent for a new round of peer review. \nYou will hear from us with feedback from the reviewers and information about the next steps.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),('EDITOR_DECISION_NEW_ROUND','fr_CA','','',''),('EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','en','Notify Other Authors','An update regarding your submission','<p>The following email was sent to {$submittingAuthorName} from {$pressName} regarding {$submissionTitle}.</p>\n<p>You are receiving a copy of this notification because you are identified as an author of the submission. Any instructions in the message below are intended for the submitting author, {$submittingAuthorName}, and no action is required of you at this time.</p>\n\n{$messageToSubmittingAuthor}'),('EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','fr_CA','','',''),('EDITOR_DECISION_NOTIFY_REVIEWERS','en','Notify Reviewers of Decision','Thank you for your review','<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, {$submissionTitle}, for {$pressName}. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>{$decisionDescription}</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$pressName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>'),('EDITOR_DECISION_NOTIFY_REVIEWERS','fr_CA','','',''),('EDITOR_DECISION_RESUBMIT','en','Resubmit for Review','Your submission has been reviewed - please revise and resubmit','<p>Dear {$recipientName},</p><p>After reviewing your submission, {$submissionTitle}, the reviewers have recommended that your submission cannot be accepted for publication in its current form. However, we would like to encourage you to submit a revised version that addresses the reviewers\' comments. Your revisions will be reviewed by an editor and may be sent out for another round of peer review.</p><p>Please note that resubmitting your work does not guarantee that it will be accepted.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point and identify what changes you have made. If you find any of the reviewer\'s comments inappropriate, please explain your perspective. If you have questions about the recommendations in your review, please include these in your response.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments <a href=\"{$authorSubmissionUrl}\">at your submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),('EDITOR_DECISION_RESUBMIT','fr_CA','','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de vous demander d\'apporter des révisions à votre soumission et de la soumettre à nouveau.'),('EDITOR_DECISION_REVERT_DECLINE','en','Reinstate Declined Submission','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will complete the round of review and you will be notified when a \ndecision is made.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),('EDITOR_DECISION_REVERT_DECLINE','fr_CA','','',''),('EDITOR_DECISION_REVERT_INITIAL_DECLINE','en','Reinstate Submission Declined Without Review','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will look further at your submission before deciding whether to decline \nthe submission or send it for review.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),('EDITOR_DECISION_REVERT_INITIAL_DECLINE','fr_CA','','',''),('EDITOR_DECISION_REVISIONS','en','Revisions Requested','Your submission has been reviewed and we encourage you to submit revisions','<p>Dear {$recipientName},</p><p>Your submission {$submissionTitle} has been reviewed and we would like to encourage you to submit revisions that address the reviewers\' comments. An editor will review these revisions and if they address the concerns adequately, your submission may be accepted for publication.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point in the reviewers\' comments and identify what changes you have made. If you find any of the reviewer\'s comments to be unjustified or inappropriate, please explain your perspective.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments at your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),('EDITOR_DECISION_REVISIONS','fr_CA','','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de vous demander d\'apporter des révisions à votre soumission.'),('EDITOR_DECISION_SEND_TO_EXTERNAL','en','Sent to Review','Your submission has been sent for review','<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>{$reviewTypeDescription} You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>'),('EDITOR_DECISION_SEND_TO_EXTERNAL','fr_CA','','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est d\'envoyer votre soumission en évaluation.<br />\n<br />\nURL de la soumission : {$submissionUrl}'),('EDITOR_DECISION_SEND_TO_INTERNAL','en','Sent to Internal Review','Your submission has been sent for internal review','<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>'),('EDITOR_DECISION_SEND_TO_INTERNAL','fr_CA','','',''),('EDITOR_DECISION_SEND_TO_PRODUCTION','en','Sent to Production','Next steps for publishing your submission','<p>Dear {$recipientName},</p><p>I am writing from {$pressName} to let you know that the editing of your submission, {$submissionTitle}, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),('EDITOR_DECISION_SEND_TO_PRODUCTION','fr_CA','','Décision du rédacteur','{$authors},<br />\n<br />\nL\'édition de votre soumission « {$submissionTitle} » est complétée. Nous l\'envoyons maintenant en production.<br />\n<br />\nURL de la soumission : {$submissionUrl}'),('EDITOR_DECISION_SKIP_REVIEW','en','Submission Accepted (Without Review)','Your submission has been sent for copyediting','<p>Dear {$recipientName},</p>\n<p>I am pleased to inform you that we have decided to accept your submission without peer review. We found your submission, {$submissionTitle}, to meet our expectations, and we do not require that work of this type undergo peer review. We are excited to publish your piece in {$pressName} and we thank you for choosing our press as a venue for your work.</p>\n<p>Your submission will soon be published on the press site for {$pressName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on your efforts.</p>\n<p>Your submission will now undergo copy editing and formatting to prepare it for publication. </p>\n<p>You will shortly receive further instructions.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),('EDITOR_DECISION_SKIP_REVIEW','fr_CA','','',''),('EDITOR_RECOMMENDATION','en','Recommendation Made','Editor Recommendation','<p>Dear {$recipientName},</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission {$submissionTitle}.</p><p>My recommendation is: {$recommendation}.</p><p>Please visit the submission\'s <a href=\"{$submissionUrl}\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>{$senderName}</p>'),('EDITOR_RECOMMENDATION','fr_CA','','Recommandation du rédacteur','{$editors},<br />\n<br />\nLa recommandation concernant la soumission « {$submissionTitle} » à la revue {$pressName} est de : {$recommendation}'),('INDEX_COMPLETE','en','Index Completed','Index Galleys Complete','{$recipientName}:<br />\n<br />\nIndexes have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$pressName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signatureFullName}'),('INDEX_COMPLETE','fr_CA','','Indexage des épreuves en placard complété','{$recipientName}:<br />\n<br />\nLes index du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$pressName} sont prêts et peuvent être révisés.<br />\n<br />\nSi vous avez questions, n\'hésitez pas à me contacter.<br />\n<br />\n{$signatureFullName}'),('INDEX_REQUEST','en','Index Requested','Request Index','{$recipientName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$pressName} now needs indexes created by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and use the Page Proofs file to create the galleys according to press standards.<br />\n3. Send the COMPLETE email to the editor.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.<br />\n<br />\n{$signature}'),('INDEX_REQUEST','fr_CA','','Requête d\'indexage','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; par la presse {$pressName} doit désormais être indexée. Veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez les fichiers d\'épreuves de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir contribué à cette presse.<br />\n<br />\n{$signature}'),('LAYOUT_COMPLETE','en','','Galleys Complete','<p>Dear {$recipientName},<p><p>Galleys have now been prepared for the following submission and are ready for final review.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$pressName}</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p><p>{$senderName}</p>'),('LAYOUT_COMPLETE','fr_CA','','Épreuves en placard complétées','{$recipientName}:<br />\n<br />\nLes épreuves en placard du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$pressName} ont été préparées et peuvent être révisées.<br />\n<br />\nSi vous avez questions, n\'hésitez pas à me contacter.<br />\n<br />\n{$senderName}'),('LAYOUT_REQUEST','en','Ready for Production','Submission {$submissionId} is ready for production at {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready for layout editing:</p><p><a href=\"{$submissionUrl}\">{$submissionId} {$submissionTitle}</a><br />{$pressName}</p><ol><li>Click on the Submission URL above.</li><li>Download the Production Ready files and use them to create the galleys according to the press\'s standards.</li><li>Upload the galleys to the Publication Formats section of the submission.</li><li>Use the Production Discussions to notify the editor that the galleys are ready.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.</p><p>Kind regards,</p>{$signature}'),('LAYOUT_REQUEST','fr_CA','','Requête des épreuves en placard','{$recipientName}:<br />\n<br />\nIl faut maintenant préparer les épreuves en placard de la soumission &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Pour ce faire, veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez le fichier Version de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir contribué à cette presse.'),('MANUAL_PAYMENT_NOTIFICATION','en','','Manual Payment Notification','A manual payment needs to be processed for the press {$pressName} and the user {$senderName} (username &quot;{$senderUsername}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$paymentName}&quot;.<br />\nThe cost is {$paymentAmount} ({$paymentCurrencyCode}).<br />\n<br />\nThis email was generated by the Open Monograph Press Manual Payment plugin.'),('PASSWORD_RESET_CONFIRM','en','Password Reset Confirm','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$lostPasswordUrl}<br />\n<br />\n{$siteContactName}'),('PASSWORD_RESET_CONFIRM','fr_CA','','Confirmation de réinitialisation du mot de passe','Nous avons reçu une requête de réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette requête, veuillez ignorer ce courriel et votre mot de passe demeurera le même. Si vous souhaitez modifier votre mot de passe, cliquez sur l\'adresse URL ci-dessous.<br />\n<br />\nModifier mon mot de passe: {$lostPasswordUrl}<br />\n<br />\n{$siteContactName}'),('REVIEWER_REGISTER','en','Reviewer Register','Registration as Reviewer with {$pressName}','In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$pressName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the press through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),('REVIEWER_REGISTER','fr_CA','','Inscription à titre d\'évaluateur pour la presse {$pressName}','En raison de votre expertise, nous avons ajouté votre nom à notre base de données d\'évaluateurs pour la presse {$pressName}. Ceci ne vous oblige à rien, mais nous permet simplement de vous approcher si nous recevons une soumission que vous pourriez évaluer. Après avoir reçu une demande d\'évaluation, vous aurez la possibilité de lire le titre et le résumé de l\'article en question. Vous serez toujours libre d\'accepter ou de refuser l\'invitation. Vous pouvez demander que l\'on retire votre nom de notre liste d\'évaluateurs en tout temps.<br />\n<br />\nVoici votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin dans tous vos échanges avec la presse à travers son site Web. Vous pourriez, par exemple, mettre votre profil à jour, y compris vos champs d\'intérêt en ce qui concerne l\'évaluation des articles.<br />\n<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$signature}'),('REVIEW_ACK','en','','Thank you for your review','<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, {$submissionTitle}, for {$pressName}. We appreciate your time and expertise in contributing to the quality of the work that we publish.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$pressName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>'),('REVIEW_ACK','fr_CA','','Accusé de réception de l\'évaluation d\'une soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir évalué la soumission intitulée « {$submissionTitle} » pour la revue {$pressName}. Nous vous sommes reconnaissants de votre contribution à la qualité des travaux que nous publions.'),('REVIEW_CANCEL','en','Reviewer Unassign','Request for Review Cancelled','{$recipientName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this review process in the future.<br />\n<br />\nIf you have any questions, please contact me.'),('REVIEW_CANCEL','fr_CA','','Annulation de la requête d\'évaluation','{$recipientName}:<br />\n<br />\n<br />\nNous avons décidé d\'annuler notre requête d\'évaluation pour la soumission &quot;{$submissionTitle}&quot; de la presse {$pressName}. Nous vous prions de nous excuser pour tout inconvénient que cette décision pourrait occasionner et nous espérons que vous serez en mesure d\'évaluer une soumission dans un avenir prochain.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à me contacter.'),('REVIEW_COMPLETE','en','Review Completed','Review complete: {$reviewerName} recommends {$reviewRecommendation} for #{$submissionId} {$authorsShort} — {$submissionTitle}','<p>Dear {$recipientName},</p><p>{$reviewerName} completed the following review:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — {$submissionTitle}</a><br /><b>Recommendation:</b> {$reviewRecommendation}<br /><b>Type:</b> {$reviewMethod}</p><p>Login to <a href=\"{$submissionUrl}\">view all files and comments</a> provided by this reviewer.</p>'),('REVIEW_COMPLETE','fr_CA','','',''),('REVIEW_CONFIRM','en','Review Confirm','Review accepted: {$reviewerName} accepted review assignment for #{$submissionId} {$authorsShort} — {$submissionTitle}','<p>Dear {$recipientName},</p><p>{$reviewerName} has accepted the following review:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — {$submissionTitle}</a><br /><b>Type:</b> {$reviewMethod}</p><b>Review Due:</b> {$reviewDueDate}</p><p>Login to <a href=\"{$submissionUrl}\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"{$pressUrl}\">{$pressName}</a>.'),('REVIEW_CONFIRM','fr_CA','','Acceptation d\'évaluation','Rédacteurs-trices,<br />\n<br />\nJe suis en mesure d\'évaluer la soumission intitulée « {$submissionTitle} » pour la revue {$pressName}. Je vous remercie d\'avoir pensé à moi. Je devrais être en mesure de compléter l\'évaluation pour la date du {$reviewDueDate}, voire avant.<br />\n<br />\n{$senderName}'),('REVIEW_DECLINE','en','Review Decline','Unable to Review','Editor(s):<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$senderName}'),('REVIEW_DECLINE','fr_CA','','Ne peux pas évaluer','Éditeurs:<br />\n<br />\nMalheureusement, je ne pourrai pas évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Merci de m\'avoir invité à évaluer cet article et n\'hésitez pas à me contacter dans un avenir prochain.<br />\n<br />\n{$senderName}'),('REVIEW_EDIT','en','Review Edited','Your review assignment has been changed for {$pressName}','<p>Dear {$recipientName},</p><p>An editor has made changes to your review assignment for {$pressName}. Please review the details below and let us know if you have any questions.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a><br /><b>Type:</b> {$reviewMethod}<br /><b>Accept or Decline By:</b> {$responseDueDate}<br /><b>Submit Review By:</b> {$reviewDueDate}</p><p>You can login to <a href=\"{$reviewAssignmentUrl}\">complete this review</a> at any time.</p>'),('REVIEW_EDIT','fr_CA','','',''),('REVIEW_REINSTATE','en','Reviewer Reinstate','Can you still review something for {$pressName}?','<p>Dear {$recipientName},</p><p>We recently cancelled our request for you to review a submission, {$submissionTitle}, for {$pressName}. We\'ve reversed that decision and we hope that you are still able to conduct the review.</p><p>If you are able to assist with this submission\'s review, you can <a href=\"{$reviewAssignmentUrl}\">login to the press</a> to view the submission, upload review files, and submit your review request.</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p>{$signature}'),('REVIEW_REINSTATE','fr_CA','','',''),('REVIEW_REMIND','en','Review Reminder','A reminder to please complete your review','<p>Dear {$recipientName},</p><p>Just a gentle reminder of our request for your review of the submission, \"{$submissionTitle},\" for {$pressName}. We were expecting to have this review by {$reviewDueDate} and we would be pleased to receive it as soon as you are able to prepare it.</p><p>You can <a href=\"{$reviewAssignmentUrl}\">login to the press</a> and follow the review steps to view the submission, upload review files, and submit your review comments.</p><p>If you need an extension of the deadline, please contact me. I look forward to hearing from you.</p><p>Thank you in advance and kind regards,</p>{$signature}'),('REVIEW_REMIND','fr_CA','','Rappel d\'évaluation','{$recipientName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoyés par courriel. {$lostPasswordUrl}<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Nous vous prions d\'agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$signature}'),('REVIEW_REMIND_AUTO','en','Review Reminder (Automated)','A reminder to please complete your review','<p>Dear {$recipientName}:</p><p>This email is an automated reminder from {$pressName} in regards to our request for your review of the submission, \"{$submissionTitle}.\"</p><p>We were expecting to have this review by {$reviewDueDate} and we would be pleased to receive it as soon as you are able to prepare it.</p><p>Please <a href=\"{$reviewAssignmentUrl}\">login to the press</a> and follow the review steps to view the submission, upload review files, and submit your review comments.</p><p>If you need an extension of the deadline, please contact me. I look forward to hearing from you.</p><p>Thank you in advance and kind regards,</p>{$pressSignature}'),('REVIEW_REMIND_AUTO','fr_CA','','Rappel d\'évaluation','{$recipientName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Ce courriel a été généré et envoyé automatiquement parce que vous avez dépassé la date d\'échéance. Toutefois, nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoyés par courriel. {$lostPasswordUrl}<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Veuillez agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$pressSignature}'),('REVIEW_REQUEST','en','Review Request','Manuscript Review Request','<p>Dear {$recipientName},</p><p>I believe that you would serve as an excellent reviewer for a submission  to {$pressName}. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please <a href=\"{$reviewAssignmentUrl}\">accept or decline</a> the review by <b>{$responseDueDate}</b>.</p><p>You may contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}'),('REVIEW_REQUEST','fr_CA','','Requête d\'évaluation d\'un manuscrit','Bonjour {$recipientName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nVeuillez ouvrir une session sur le site Web de la presse d\'ici le {$responseDueDate} pour indiquer si vous serez en mesure d\'évaluer l\'article ou non. Ceci vous permettra également d\'accéder à la soumission, et de saisir votre évaluation et vos recommandations.<br />\n<br />\n<br />\nL\'évaluation doit être terminée d\'ici le {$reviewDueDate}.<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci de votre intérêt à évaluer des articles pour notre presse.<br />\n<br />\n{$signature}<br />\n'),('REVIEW_REQUEST_SUBSEQUENT','en','Review Request Subsequent','Request to review a revised submission','<p>Dear {$recipientName},</p><p>Thank you for your review of <a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a>. The authors have considered the reviewers\' feedback and have now submitted a revised version of their work. I\'m writing to ask if you would conduct a second round of peer review for this submission.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can <a href=\"{$reviewAssignmentUrl}\">follow the review steps</a> to view the submission, upload review files, and submit your review comments.<p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please <a href=\"{$reviewAssignmentUrl}\">accept or decline</a> the review by <b>{$responseDueDate}</b>.</p><p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}'),('REVIEW_REQUEST_SUBSEQUENT','fr_CA','','',''),('REVIEW_RESEND_REQUEST','en','Resend Review Request to Reviewer','Requesting your review again for {$pressName}','<p>Dear {$recipientName},</p><p>Recently, you declined our request to review a submission, {$submissionTitle}, for {$pressName}. I\'m writing to see if you are able to conduct the review after all.</p><p>We would be grateful if you\'re able to perform this review, but we understand if that is not possible at this time. Either way, please <a href=\"{$reviewAssignmentUrl}\">accept or decline the request</a> by {$responseDueDate}, so that we can find an alternate reviewer.<p>If you have any questions, please contact me.</p><p>Kind regards,</p>{$signature}'),('REVIEW_RESEND_REQUEST','fr_CA','','',''),('REVIEW_RESPONSE_OVERDUE_AUTO','en','Review Response Overdue (Automated)','Manuscript Review Request','Dear {$recipientName},<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$pressSignature}<br />\n'),('REVIEW_RESPONSE_OVERDUE_AUTO','fr_CA','','',''),('REVISED_VERSION_NOTIFY','en','Revised Version Notification','Revised Version Uploaded','<p>Dear {$recipientName},</p><p>The author has uploaded revisions for the submission, <b>{$authorsShort} — {$submissionTitle}</b>. <p>As an assigned editor, we ask that you login and <a href=\"{$submissionUrl}\">view the revisions</a> and make a decision to accept, decline or send the submission for further review.</p><br><br>—<br>This is an automated message from <a href=\"{$pressUrl}\">{$pressName}</a>.'),('REVISED_VERSION_NOTIFY','fr_CA','','',''),('STATISTICS_REPORT_NOTIFICATION','en','Statistics Report Notification','Editorial activity for {$month}, {$year}','\n{$recipientName}, <br />\n<br />\nYour press health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the press to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published book stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$pressSignature}'),('STATISTICS_REPORT_NOTIFICATION','fr_CA','','',''),('SUBMISSION_ACK','en','Submission Confirmation','Thank you for your submission to {$pressName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$pressName}. We have received your submission, {$submissionTitle}, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: {$authorSubmissionUrl}</p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Thank you for considering {$pressName} as a venue for your work.</p>{$pressSignature}'),('SUBMISSION_ACK','fr_CA','','Accusé de réception de la soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$pressName}. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d\'édition en accédant au site Web de la revue :<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$pressSignature}'),('SUBMISSION_ACK_NOT_USER','en','Submission Confirmation (Other Authors)','Submission confirmation','<p>Dear {$recipientName},</p><p>You have been named as a co-author on a submission to {$pressName}. The submitter, {$submitterName}, provided the following details:</p><p>{$submissionTitle}<br>{$authorsWithAffiliation}</p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering {$pressName} as a venue for your work.</p><p>Kind regards,</p>{$pressSignature}'),('SUBMISSION_ACK_NOT_USER','fr_CA','','Accusé de réception de la soumission','<p>Bonjour,</p><p>Le manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à la revue {$pressName}.</p><p>Si vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à la revue {$pressName} pour la publication de vos travaux.</p><p>Cordialement,</p>{$pressSignature}'),('SUBMISSION_NEEDS_EDITOR','en','Submission Needs Editor','A new submission needs an editor to be assigned: {$submissionTitle}','<p>Dear {$recipientName},</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"{$pressUrl}\">{$pressName}</a>.</p>'),('SUBMISSION_NEEDS_EDITOR','fr_CA','','',''),('SUBMISSION_SAVED_FOR_LATER','en','Submission Saved for Later','Resume your submission to {$pressName}','<p>Dear {$recipientName},</p><p>Your submission details have been saved in our system, but it has not yet been submitted for consideration. You can return to complete your submission at any time by following the link below.</p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — {$submissionTitle}</a></p><hr><p>This is an automated email from <a href=\"{$pressUrl}\">{$pressName}</a>.</p>'),('SUBMISSION_SAVED_FOR_LATER','fr_CA','','',''),('USER_REGISTER','en','User Created','Press Registration','{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$pressName}. We have included your username and password in this email, which are needed for all work with this press through its website. At any point, you can ask to be removed from the list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),('USER_REGISTER','fr_CA','','Inscription à la presse','{$recipientName}<br />\n<br />\nVous êtes désormais inscrit à la presse {$pressName}. Ce courriel contient votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin pour tous vos travaux au sein de la presse. Vous pouvez demander que l\'on retire votre nom de la liste des utilisateurs en tout temps. Il suffit de me contacter.<br />\n<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$signature}'),('USER_VALIDATE_CONTEXT','en','Validate Email (Press Registration)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$pressName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$pressSignature}'),('USER_VALIDATE_CONTEXT','fr_CA','','',''),('USER_VALIDATE_SITE','en','Validate Email (Site)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$siteSignature}'),('USER_VALIDATE_SITE','fr_CA','','',''),('VERSION_CREATED','en','Version Created','A new version was created for {$submissionTitle}','<p>Dear {$recipientName}, </p><p>This is an automated message to inform you that a new version of your submission, {$submissionTitle}, was created. You can view this version from your submission dashboard at the following link:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a></p><hr><p>This is an automatic email sent from <a href=\"{$pressUrl}\">{$pressName}</a>.</p>'),('VERSION_CREATED','fr_CA','','','');
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
) ENGINE=InnoDB AUTO_INCREMENT=613 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,19,'2023-03-02 22:46:08',268435458,'submission.event.general.metadataUpdated',0),(2,1048585,1,19,'2023-03-02 22:46:09',268435458,'submission.event.general.metadataUpdated',0),(3,515,1,19,'2023-03-02 22:46:12',1342177281,'submission.event.fileUploaded',0),(4,1048585,1,19,'2023-03-02 22:46:12',1342177288,'submission.event.fileRevised',0),(5,515,1,19,'2023-03-02 22:46:13',1342177296,'submission.event.fileEdited',0),(6,1048585,1,19,'2023-03-02 22:46:13',1342177296,'submission.event.fileEdited',0),(7,515,2,19,'2023-03-02 22:46:13',1342177281,'submission.event.fileUploaded',0),(8,1048585,1,19,'2023-03-02 22:46:13',1342177288,'submission.event.fileRevised',0),(9,515,2,19,'2023-03-02 22:46:14',1342177296,'submission.event.fileEdited',0),(10,1048585,1,19,'2023-03-02 22:46:14',1342177296,'submission.event.fileEdited',0),(11,515,3,19,'2023-03-02 22:46:15',1342177281,'submission.event.fileUploaded',0),(12,1048585,1,19,'2023-03-02 22:46:15',1342177288,'submission.event.fileRevised',0),(13,515,3,19,'2023-03-02 22:46:15',1342177296,'submission.event.fileEdited',0),(14,1048585,1,19,'2023-03-02 22:46:15',1342177296,'submission.event.fileEdited',0),(15,1048585,1,19,'2023-03-02 22:46:33',268435457,'submission.event.submissionSubmitted',0),(16,1048585,1,3,'2023-03-02 22:46:47',805306371,'editor.submission.decision.sendExternalReview.log',0),(17,515,4,3,'2023-03-02 22:46:47',1342177281,'submission.event.fileUploaded',0),(18,1048585,1,3,'2023-03-02 22:46:47',1342177288,'submission.event.fileRevised',0),(19,515,5,3,'2023-03-02 22:46:47',1342177281,'submission.event.fileUploaded',0),(20,1048585,1,3,'2023-03-02 22:46:47',1342177288,'submission.event.fileRevised',0),(21,515,6,3,'2023-03-02 22:46:48',1342177281,'submission.event.fileUploaded',0),(22,1048585,1,3,'2023-03-02 22:46:48',1342177288,'submission.event.fileRevised',0),(23,1048585,1,3,'2023-03-02 22:46:57',1073741825,'log.review.reviewerAssigned',0),(24,1048585,1,3,'2023-03-02 22:47:03',805306371,'editor.submission.decision.accept.log',0),(25,1048585,1,3,'2023-03-02 22:47:12',268435459,'submission.event.participantAdded',0),(26,1048585,2,20,'2023-03-02 22:47:24',268435458,'submission.event.general.metadataUpdated',0),(27,1048585,2,20,'2023-03-02 22:47:24',268435458,'submission.event.general.metadataUpdated',0),(28,1048585,2,20,'2023-03-02 22:47:37',268435458,'submission.event.general.metadataUpdated',0),(29,515,7,20,'2023-03-02 22:47:38',1342177281,'submission.event.fileUploaded',0),(30,1048585,2,20,'2023-03-02 22:47:38',1342177288,'submission.event.fileRevised',0),(31,515,7,20,'2023-03-02 22:47:38',1342177296,'submission.event.fileEdited',0),(32,1048585,2,20,'2023-03-02 22:47:38',1342177296,'submission.event.fileEdited',0),(33,515,8,20,'2023-03-02 22:47:39',1342177281,'submission.event.fileUploaded',0),(34,1048585,2,20,'2023-03-02 22:47:39',1342177288,'submission.event.fileRevised',0),(35,515,8,20,'2023-03-02 22:47:39',1342177296,'submission.event.fileEdited',0),(36,1048585,2,20,'2023-03-02 22:47:39',1342177296,'submission.event.fileEdited',0),(37,515,9,20,'2023-03-02 22:47:40',1342177281,'submission.event.fileUploaded',0),(38,1048585,2,20,'2023-03-02 22:47:40',1342177288,'submission.event.fileRevised',0),(39,515,9,20,'2023-03-02 22:47:41',1342177296,'submission.event.fileEdited',0),(40,1048585,2,20,'2023-03-02 22:47:41',1342177296,'submission.event.fileEdited',0),(41,515,10,20,'2023-03-02 22:47:41',1342177281,'submission.event.fileUploaded',0),(42,1048585,2,20,'2023-03-02 22:47:41',1342177288,'submission.event.fileRevised',0),(43,515,10,20,'2023-03-02 22:47:42',1342177296,'submission.event.fileEdited',0),(44,1048585,2,20,'2023-03-02 22:47:42',1342177296,'submission.event.fileEdited',0),(45,515,11,20,'2023-03-02 22:47:43',1342177281,'submission.event.fileUploaded',0),(46,1048585,2,20,'2023-03-02 22:47:43',1342177288,'submission.event.fileRevised',0),(47,515,11,20,'2023-03-02 22:47:43',1342177296,'submission.event.fileEdited',0),(48,1048585,2,20,'2023-03-02 22:47:43',1342177296,'submission.event.fileEdited',0),(49,515,11,20,'2023-03-02 22:47:44',1342177282,'submission.event.fileDeleted',0),(50,1048585,2,20,'2023-03-02 22:49:33',268435457,'submission.event.submissionSubmitted',0),(51,1048585,2,3,'2023-03-02 22:50:03',805306371,'editor.submission.decision.sendExternalReview.log',0),(52,515,12,3,'2023-03-02 22:50:03',1342177281,'submission.event.fileUploaded',0),(53,1048585,2,3,'2023-03-02 22:50:03',1342177288,'submission.event.fileRevised',0),(54,515,13,3,'2023-03-02 22:50:03',1342177281,'submission.event.fileUploaded',0),(55,1048585,2,3,'2023-03-02 22:50:03',1342177288,'submission.event.fileRevised',0),(56,515,14,3,'2023-03-02 22:50:03',1342177281,'submission.event.fileUploaded',0),(57,1048585,2,3,'2023-03-02 22:50:03',1342177288,'submission.event.fileRevised',0),(58,515,15,3,'2023-03-02 22:50:04',1342177281,'submission.event.fileUploaded',0),(59,1048585,2,3,'2023-03-02 22:50:04',1342177288,'submission.event.fileRevised',0),(60,1048585,2,3,'2023-03-02 22:50:18',1073741825,'log.review.reviewerAssigned',0),(61,1048585,2,3,'2023-03-02 22:50:27',1073741825,'log.review.reviewerAssigned',0),(62,1048585,3,21,'2023-03-02 22:50:38',268435458,'submission.event.general.metadataUpdated',0),(63,1048585,3,21,'2023-03-02 22:50:39',268435458,'submission.event.general.metadataUpdated',0),(64,515,16,21,'2023-03-02 22:50:42',1342177281,'submission.event.fileUploaded',0),(65,1048585,3,21,'2023-03-02 22:50:42',1342177288,'submission.event.fileRevised',0),(66,515,16,21,'2023-03-02 22:50:43',1342177296,'submission.event.fileEdited',0),(67,1048585,3,21,'2023-03-02 22:50:43',1342177296,'submission.event.fileEdited',0),(68,515,17,21,'2023-03-02 22:50:44',1342177281,'submission.event.fileUploaded',0),(69,1048585,3,21,'2023-03-02 22:50:44',1342177288,'submission.event.fileRevised',0),(70,515,17,21,'2023-03-02 22:50:44',1342177296,'submission.event.fileEdited',0),(71,1048585,3,21,'2023-03-02 22:50:44',1342177296,'submission.event.fileEdited',0),(72,515,18,21,'2023-03-02 22:50:45',1342177281,'submission.event.fileUploaded',0),(73,1048585,3,21,'2023-03-02 22:50:45',1342177288,'submission.event.fileRevised',0),(74,515,18,21,'2023-03-02 22:50:45',1342177296,'submission.event.fileEdited',0),(75,1048585,3,21,'2023-03-02 22:50:45',1342177296,'submission.event.fileEdited',0),(76,515,19,21,'2023-03-02 22:50:46',1342177281,'submission.event.fileUploaded',0),(77,1048585,3,21,'2023-03-02 22:50:46',1342177288,'submission.event.fileRevised',0),(78,515,19,21,'2023-03-02 22:50:46',1342177296,'submission.event.fileEdited',0),(79,1048585,3,21,'2023-03-02 22:50:46',1342177296,'submission.event.fileEdited',0),(80,515,20,21,'2023-03-02 22:50:47',1342177281,'submission.event.fileUploaded',0),(81,1048585,3,21,'2023-03-02 22:50:47',1342177288,'submission.event.fileRevised',0),(82,515,20,21,'2023-03-02 22:50:48',1342177296,'submission.event.fileEdited',0),(83,1048585,3,21,'2023-03-02 22:50:48',1342177296,'submission.event.fileEdited',0),(84,1048585,3,21,'2023-03-02 22:51:23',268435457,'submission.event.submissionSubmitted',0),(85,1048585,4,22,'2023-03-02 22:51:33',268435458,'submission.event.general.metadataUpdated',0),(86,1048585,4,22,'2023-03-02 22:51:34',268435458,'submission.event.general.metadataUpdated',0),(87,515,21,22,'2023-03-02 22:51:37',1342177281,'submission.event.fileUploaded',0),(88,1048585,4,22,'2023-03-02 22:51:37',1342177288,'submission.event.fileRevised',0),(89,515,21,22,'2023-03-02 22:51:37',1342177296,'submission.event.fileEdited',0),(90,1048585,4,22,'2023-03-02 22:51:37',1342177296,'submission.event.fileEdited',0),(91,515,22,22,'2023-03-02 22:51:38',1342177281,'submission.event.fileUploaded',0),(92,1048585,4,22,'2023-03-02 22:51:38',1342177288,'submission.event.fileRevised',0),(93,515,22,22,'2023-03-02 22:51:38',1342177296,'submission.event.fileEdited',0),(94,1048585,4,22,'2023-03-02 22:51:38',1342177296,'submission.event.fileEdited',0),(95,515,23,22,'2023-03-02 22:51:39',1342177281,'submission.event.fileUploaded',0),(96,1048585,4,22,'2023-03-02 22:51:39',1342177288,'submission.event.fileRevised',0),(97,515,23,22,'2023-03-02 22:51:39',1342177296,'submission.event.fileEdited',0),(98,1048585,4,22,'2023-03-02 22:51:39',1342177296,'submission.event.fileEdited',0),(99,515,24,22,'2023-03-02 22:51:40',1342177281,'submission.event.fileUploaded',0),(100,1048585,4,22,'2023-03-02 22:51:40',1342177288,'submission.event.fileRevised',0),(101,515,24,22,'2023-03-02 22:51:41',1342177296,'submission.event.fileEdited',0),(102,1048585,4,22,'2023-03-02 22:51:41',1342177296,'submission.event.fileEdited',0),(103,1048585,4,22,'2023-03-02 22:52:09',268435457,'submission.event.submissionSubmitted',0),(104,1048585,4,3,'2023-03-02 22:52:24',805306371,'editor.submission.decision.sendInternalReview.log',0),(105,515,25,3,'2023-03-02 22:52:24',1342177281,'submission.event.fileUploaded',0),(106,1048585,4,3,'2023-03-02 22:52:24',1342177288,'submission.event.fileRevised',0),(107,515,26,3,'2023-03-02 22:52:25',1342177281,'submission.event.fileUploaded',0),(108,1048585,4,3,'2023-03-02 22:52:25',1342177288,'submission.event.fileRevised',0),(109,515,27,3,'2023-03-02 22:52:25',1342177281,'submission.event.fileUploaded',0),(110,1048585,4,3,'2023-03-02 22:52:25',1342177288,'submission.event.fileRevised',0),(111,515,28,3,'2023-03-02 22:52:25',1342177281,'submission.event.fileUploaded',0),(112,1048585,4,3,'2023-03-02 22:52:25',1342177288,'submission.event.fileRevised',0),(113,1048585,4,3,'2023-03-02 22:52:35',1073741825,'log.review.reviewerAssigned',0),(114,1048585,4,3,'2023-03-02 22:52:41',805306371,'editor.submission.decision.sendExternalReview.log',0),(115,1048585,4,3,'2023-03-02 22:52:52',1073741825,'log.review.reviewerAssigned',0),(116,1048585,4,3,'2023-03-02 22:52:59',805306371,'editor.submission.decision.accept.log',0),(117,1048585,4,3,'2023-03-02 22:53:08',268435459,'submission.event.participantAdded',0),(118,1048585,4,3,'2023-03-02 22:53:15',805306371,'editor.submission.decision.sendToProduction.log',0),(119,1048585,4,3,'2023-03-02 22:53:26',268435459,'submission.event.participantAdded',0),(120,1048585,4,3,'2023-03-02 22:53:34',268435474,'submission.event.publicationFormatCreated',0),(121,1048585,5,23,'2023-03-02 22:53:43',268435458,'submission.event.general.metadataUpdated',0),(122,1048585,5,23,'2023-03-02 22:53:44',268435458,'submission.event.general.metadataUpdated',0),(123,515,29,23,'2023-03-02 22:53:47',1342177281,'submission.event.fileUploaded',0),(124,1048585,5,23,'2023-03-02 22:53:47',1342177288,'submission.event.fileRevised',0),(125,515,29,23,'2023-03-02 22:53:47',1342177296,'submission.event.fileEdited',0),(126,1048585,5,23,'2023-03-02 22:53:47',1342177296,'submission.event.fileEdited',0),(127,515,30,23,'2023-03-02 22:53:48',1342177281,'submission.event.fileUploaded',0),(128,1048585,5,23,'2023-03-02 22:53:48',1342177288,'submission.event.fileRevised',0),(129,515,30,23,'2023-03-02 22:53:48',1342177296,'submission.event.fileEdited',0),(130,1048585,5,23,'2023-03-02 22:53:48',1342177296,'submission.event.fileEdited',0),(131,515,31,23,'2023-03-02 22:53:49',1342177281,'submission.event.fileUploaded',0),(132,1048585,5,23,'2023-03-02 22:53:49',1342177288,'submission.event.fileRevised',0),(133,515,31,23,'2023-03-02 22:53:49',1342177296,'submission.event.fileEdited',0),(134,1048585,5,23,'2023-03-02 22:53:49',1342177296,'submission.event.fileEdited',0),(135,515,32,23,'2023-03-02 22:53:50',1342177281,'submission.event.fileUploaded',0),(136,1048585,5,23,'2023-03-02 22:53:50',1342177288,'submission.event.fileRevised',0),(137,515,32,23,'2023-03-02 22:53:51',1342177296,'submission.event.fileEdited',0),(138,1048585,5,23,'2023-03-02 22:53:51',1342177296,'submission.event.fileEdited',0),(139,515,33,23,'2023-03-02 22:53:51',1342177281,'submission.event.fileUploaded',0),(140,1048585,5,23,'2023-03-02 22:53:51',1342177288,'submission.event.fileRevised',0),(141,515,33,23,'2023-03-02 22:53:52',1342177296,'submission.event.fileEdited',0),(142,1048585,5,23,'2023-03-02 22:53:52',1342177296,'submission.event.fileEdited',0),(143,515,34,23,'2023-03-02 22:53:52',1342177281,'submission.event.fileUploaded',0),(144,1048585,5,23,'2023-03-02 22:53:53',1342177288,'submission.event.fileRevised',0),(145,515,34,23,'2023-03-02 22:53:53',1342177296,'submission.event.fileEdited',0),(146,1048585,5,23,'2023-03-02 22:53:53',1342177296,'submission.event.fileEdited',0),(147,1048585,5,23,'2023-03-02 22:54:36',268435457,'submission.event.submissionSubmitted',0),(148,1048585,5,3,'2023-03-02 22:54:53',805306371,'editor.submission.decision.sendInternalReview.log',0),(149,515,35,3,'2023-03-02 22:54:53',1342177281,'submission.event.fileUploaded',0),(150,1048585,5,3,'2023-03-02 22:54:53',1342177288,'submission.event.fileRevised',0),(151,515,36,3,'2023-03-02 22:54:53',1342177281,'submission.event.fileUploaded',0),(152,1048585,5,3,'2023-03-02 22:54:53',1342177288,'submission.event.fileRevised',0),(153,515,37,3,'2023-03-02 22:54:53',1342177281,'submission.event.fileUploaded',0),(154,1048585,5,3,'2023-03-02 22:54:53',1342177288,'submission.event.fileRevised',0),(155,515,38,3,'2023-03-02 22:54:53',1342177281,'submission.event.fileUploaded',0),(156,1048585,5,3,'2023-03-02 22:54:53',1342177288,'submission.event.fileRevised',0),(157,515,39,3,'2023-03-02 22:54:54',1342177281,'submission.event.fileUploaded',0),(158,1048585,5,3,'2023-03-02 22:54:54',1342177288,'submission.event.fileRevised',0),(159,515,40,3,'2023-03-02 22:54:54',1342177281,'submission.event.fileUploaded',0),(160,1048585,5,3,'2023-03-02 22:54:54',1342177288,'submission.event.fileRevised',0),(161,1048585,5,3,'2023-03-02 22:55:04',1073741825,'log.review.reviewerAssigned',0),(162,1048585,5,3,'2023-03-02 22:55:12',805306371,'editor.submission.decision.sendExternalReview.log',0),(163,1048585,5,3,'2023-03-02 22:55:23',1073741825,'log.review.reviewerAssigned',0),(164,1048585,5,3,'2023-03-02 22:55:31',805306371,'editor.submission.decision.accept.log',0),(165,1048585,5,3,'2023-03-02 22:55:42',268435459,'submission.event.participantAdded',0),(166,1048585,5,3,'2023-03-02 22:55:50',805306371,'editor.submission.decision.sendToProduction.log',0),(167,1048585,5,3,'2023-03-02 22:56:02',268435459,'submission.event.participantAdded',0),(168,1048585,5,3,'2023-03-02 22:56:09',268435459,'submission.event.participantAdded',0),(169,1048585,5,3,'2023-03-02 22:56:16',268435474,'submission.event.publicationFormatCreated',0),(170,515,41,3,'2023-03-02 22:56:20',1342177281,'submission.event.fileUploaded',0),(171,1048585,5,3,'2023-03-02 22:56:20',1342177288,'submission.event.fileRevised',0),(172,1048585,5,3,'2023-03-02 22:56:23',268435464,'submission.event.publicationFormatPublished',0),(173,1048585,5,3,'2023-03-02 22:56:25',268435476,'submission.event.publicationFormatMadeAvailable',0),(174,515,41,3,'2023-03-02 22:56:28',1342177296,'submission.event.fileEdited',0),(175,1048585,5,3,'2023-03-02 22:56:28',1342177296,'submission.event.fileEdited',0),(176,515,41,3,'2023-03-02 22:56:28',1342177287,'submission.event.signoffSignoff',0),(177,515,41,3,'2023-03-02 22:56:31',1342177296,'submission.event.fileEdited',0),(178,1048585,5,3,'2023-03-02 22:56:31',1342177296,'submission.event.fileEdited',0),(179,1048585,5,3,'2023-03-02 22:56:34',268435462,'publication.event.published',0),(180,1048585,5,3,'2023-03-02 22:56:45',268435463,'publication.event.unpublished',0),(181,1048585,5,3,'2023-03-02 22:56:55',268435462,'publication.event.published',0),(182,1048585,6,24,'2023-03-02 22:57:04',268435458,'submission.event.general.metadataUpdated',0),(183,1048585,6,24,'2023-03-02 22:57:05',268435458,'submission.event.general.metadataUpdated',0),(184,515,42,24,'2023-03-02 22:57:08',1342177281,'submission.event.fileUploaded',0),(185,1048585,6,24,'2023-03-02 22:57:08',1342177288,'submission.event.fileRevised',0),(186,515,42,24,'2023-03-02 22:57:08',1342177296,'submission.event.fileEdited',0),(187,1048585,6,24,'2023-03-02 22:57:08',1342177296,'submission.event.fileEdited',0),(188,515,43,24,'2023-03-02 22:57:09',1342177281,'submission.event.fileUploaded',0),(189,1048585,6,24,'2023-03-02 22:57:09',1342177288,'submission.event.fileRevised',0),(190,515,43,24,'2023-03-02 22:57:09',1342177296,'submission.event.fileEdited',0),(191,1048585,6,24,'2023-03-02 22:57:09',1342177296,'submission.event.fileEdited',0),(192,515,44,24,'2023-03-02 22:57:10',1342177281,'submission.event.fileUploaded',0),(193,1048585,6,24,'2023-03-02 22:57:10',1342177288,'submission.event.fileRevised',0),(194,515,44,24,'2023-03-02 22:57:11',1342177296,'submission.event.fileEdited',0),(195,1048585,6,24,'2023-03-02 22:57:11',1342177296,'submission.event.fileEdited',0),(196,515,45,24,'2023-03-02 22:57:11',1342177281,'submission.event.fileUploaded',0),(197,1048585,6,24,'2023-03-02 22:57:11',1342177288,'submission.event.fileRevised',0),(198,515,45,24,'2023-03-02 22:57:12',1342177296,'submission.event.fileEdited',0),(199,1048585,6,24,'2023-03-02 22:57:12',1342177296,'submission.event.fileEdited',0),(200,1048585,6,24,'2023-03-02 22:57:40',268435457,'submission.event.submissionSubmitted',0),(201,1048585,6,3,'2023-03-02 22:57:56',805306371,'editor.submission.decision.sendInternalReview.log',0),(202,515,46,3,'2023-03-02 22:57:56',1342177281,'submission.event.fileUploaded',0),(203,1048585,6,3,'2023-03-02 22:57:56',1342177288,'submission.event.fileRevised',0),(204,515,47,3,'2023-03-02 22:57:56',1342177281,'submission.event.fileUploaded',0),(205,1048585,6,3,'2023-03-02 22:57:56',1342177288,'submission.event.fileRevised',0),(206,515,48,3,'2023-03-02 22:57:56',1342177281,'submission.event.fileUploaded',0),(207,1048585,6,3,'2023-03-02 22:57:56',1342177288,'submission.event.fileRevised',0),(208,515,49,3,'2023-03-02 22:57:57',1342177281,'submission.event.fileUploaded',0),(209,1048585,6,3,'2023-03-02 22:57:57',1342177288,'submission.event.fileRevised',0),(210,1048585,6,3,'2023-03-02 22:58:07',268435459,'submission.event.participantAdded',0),(211,1048585,6,3,'2023-03-02 22:58:12',268435459,'submission.event.participantAdded',0),(212,1048585,6,3,'2023-03-02 22:58:18',268435459,'submission.event.participantAdded',0),(213,1048585,6,6,'2023-03-02 22:58:34',805306372,'editor.submission.recommend.accept.log',0),(214,1048585,7,25,'2023-03-02 22:59:00',268435458,'submission.event.general.metadataUpdated',0),(215,1048585,7,25,'2023-03-02 22:59:00',268435458,'submission.event.general.metadataUpdated',0),(216,515,50,25,'2023-03-02 22:59:04',1342177281,'submission.event.fileUploaded',0),(217,1048585,7,25,'2023-03-02 22:59:04',1342177288,'submission.event.fileRevised',0),(218,515,50,25,'2023-03-02 22:59:04',1342177296,'submission.event.fileEdited',0),(219,1048585,7,25,'2023-03-02 22:59:04',1342177296,'submission.event.fileEdited',0),(220,515,51,25,'2023-03-02 22:59:05',1342177281,'submission.event.fileUploaded',0),(221,1048585,7,25,'2023-03-02 22:59:05',1342177288,'submission.event.fileRevised',0),(222,515,51,25,'2023-03-02 22:59:05',1342177296,'submission.event.fileEdited',0),(223,1048585,7,25,'2023-03-02 22:59:05',1342177296,'submission.event.fileEdited',0),(224,515,52,25,'2023-03-02 22:59:06',1342177281,'submission.event.fileUploaded',0),(225,1048585,7,25,'2023-03-02 22:59:06',1342177288,'submission.event.fileRevised',0),(226,515,52,25,'2023-03-02 22:59:06',1342177296,'submission.event.fileEdited',0),(227,1048585,7,25,'2023-03-02 22:59:06',1342177296,'submission.event.fileEdited',0),(228,515,53,25,'2023-03-02 22:59:07',1342177281,'submission.event.fileUploaded',0),(229,1048585,7,25,'2023-03-02 22:59:07',1342177288,'submission.event.fileRevised',0),(230,515,53,25,'2023-03-02 22:59:07',1342177296,'submission.event.fileEdited',0),(231,1048585,7,25,'2023-03-02 22:59:07',1342177296,'submission.event.fileEdited',0),(232,515,54,25,'2023-03-02 22:59:08',1342177281,'submission.event.fileUploaded',0),(233,1048585,7,25,'2023-03-02 22:59:08',1342177288,'submission.event.fileRevised',0),(234,515,54,25,'2023-03-02 22:59:09',1342177296,'submission.event.fileEdited',0),(235,1048585,7,25,'2023-03-02 22:59:09',1342177296,'submission.event.fileEdited',0),(236,1048585,7,25,'2023-03-02 22:59:47',268435457,'submission.event.submissionSubmitted',0),(237,1048585,7,3,'2023-03-02 23:00:04',805306371,'editor.submission.decision.sendExternalReview.log',0),(238,515,55,3,'2023-03-02 23:00:04',1342177281,'submission.event.fileUploaded',0),(239,1048585,7,3,'2023-03-02 23:00:04',1342177288,'submission.event.fileRevised',0),(240,515,56,3,'2023-03-02 23:00:05',1342177281,'submission.event.fileUploaded',0),(241,1048585,7,3,'2023-03-02 23:00:05',1342177288,'submission.event.fileRevised',0),(242,515,57,3,'2023-03-02 23:00:05',1342177281,'submission.event.fileUploaded',0),(243,1048585,7,3,'2023-03-02 23:00:05',1342177288,'submission.event.fileRevised',0),(244,515,58,3,'2023-03-02 23:00:05',1342177281,'submission.event.fileUploaded',0),(245,1048585,7,3,'2023-03-02 23:00:05',1342177288,'submission.event.fileRevised',0),(246,515,59,3,'2023-03-02 23:00:05',1342177281,'submission.event.fileUploaded',0),(247,1048585,7,3,'2023-03-02 23:00:05',1342177288,'submission.event.fileRevised',0),(248,1048585,7,3,'2023-03-02 23:00:16',1073741825,'log.review.reviewerAssigned',0),(249,1048585,7,3,'2023-03-02 23:00:23',805306371,'editor.submission.decision.accept.log',0),(250,1048585,7,3,'2023-03-02 23:00:33',268435459,'submission.event.participantAdded',0),(251,1048585,8,3,'2023-03-02 23:00:43',268435458,'submission.event.general.metadataUpdated',0),(252,515,60,3,'2023-03-02 23:00:46',1342177281,'submission.event.fileUploaded',0),(253,1048585,8,3,'2023-03-02 23:00:46',1342177288,'submission.event.fileRevised',0),(254,515,60,3,'2023-03-02 23:00:46',1342177296,'submission.event.fileEdited',0),(255,1048585,8,3,'2023-03-02 23:00:47',1342177296,'submission.event.fileEdited',0),(256,1048585,8,3,'2023-03-02 23:00:47',268435457,'submission.event.submissionSubmitted',0),(257,1048585,9,26,'2023-03-02 23:00:56',268435458,'submission.event.general.metadataUpdated',0),(258,1048585,9,26,'2023-03-02 23:00:56',268435458,'submission.event.general.metadataUpdated',0),(259,515,61,26,'2023-03-02 23:01:00',1342177281,'submission.event.fileUploaded',0),(260,1048585,9,26,'2023-03-02 23:01:00',1342177288,'submission.event.fileRevised',0),(261,515,61,26,'2023-03-02 23:01:00',1342177296,'submission.event.fileEdited',0),(262,1048585,9,26,'2023-03-02 23:01:00',1342177296,'submission.event.fileEdited',0),(263,515,62,26,'2023-03-02 23:01:01',1342177281,'submission.event.fileUploaded',0),(264,1048585,9,26,'2023-03-02 23:01:01',1342177288,'submission.event.fileRevised',0),(265,515,62,26,'2023-03-02 23:01:01',1342177296,'submission.event.fileEdited',0),(266,1048585,9,26,'2023-03-02 23:01:01',1342177296,'submission.event.fileEdited',0),(267,515,63,26,'2023-03-02 23:01:02',1342177281,'submission.event.fileUploaded',0),(268,1048585,9,26,'2023-03-02 23:01:02',1342177288,'submission.event.fileRevised',0),(269,515,63,26,'2023-03-02 23:01:02',1342177296,'submission.event.fileEdited',0),(270,1048585,9,26,'2023-03-02 23:01:02',1342177296,'submission.event.fileEdited',0),(271,515,64,26,'2023-03-02 23:01:03',1342177281,'submission.event.fileUploaded',0),(272,1048585,9,26,'2023-03-02 23:01:03',1342177288,'submission.event.fileRevised',0),(273,515,64,26,'2023-03-02 23:01:03',1342177296,'submission.event.fileEdited',0),(274,1048585,9,26,'2023-03-02 23:01:03',1342177296,'submission.event.fileEdited',0),(275,515,65,26,'2023-03-02 23:01:04',1342177281,'submission.event.fileUploaded',0),(276,1048585,9,26,'2023-03-02 23:01:04',1342177288,'submission.event.fileRevised',0),(277,515,65,26,'2023-03-02 23:01:05',1342177296,'submission.event.fileEdited',0),(278,1048585,9,26,'2023-03-02 23:01:05',1342177296,'submission.event.fileEdited',0),(279,1048585,9,26,'2023-03-02 23:01:43',268435457,'submission.event.submissionSubmitted',0),(280,1048585,9,3,'2023-03-02 23:01:59',805306371,'editor.submission.decision.sendInternalReview.log',0),(281,515,66,3,'2023-03-02 23:01:59',1342177281,'submission.event.fileUploaded',0),(282,1048585,9,3,'2023-03-02 23:01:59',1342177288,'submission.event.fileRevised',0),(283,515,67,3,'2023-03-02 23:01:59',1342177281,'submission.event.fileUploaded',0),(284,1048585,9,3,'2023-03-02 23:01:59',1342177288,'submission.event.fileRevised',0),(285,515,68,3,'2023-03-02 23:01:59',1342177281,'submission.event.fileUploaded',0),(286,1048585,9,3,'2023-03-02 23:01:59',1342177288,'submission.event.fileRevised',0),(287,515,69,3,'2023-03-02 23:02:00',1342177281,'submission.event.fileUploaded',0),(288,1048585,9,3,'2023-03-02 23:02:00',1342177288,'submission.event.fileRevised',0),(289,515,70,3,'2023-03-02 23:02:00',1342177281,'submission.event.fileUploaded',0),(290,1048585,9,3,'2023-03-02 23:02:00',1342177288,'submission.event.fileRevised',0),(291,1048585,10,27,'2023-03-02 23:02:14',268435458,'submission.event.general.metadataUpdated',0),(292,1048585,10,27,'2023-03-02 23:02:14',268435458,'submission.event.general.metadataUpdated',0),(293,515,71,27,'2023-03-02 23:02:18',1342177281,'submission.event.fileUploaded',0),(294,1048585,10,27,'2023-03-02 23:02:18',1342177288,'submission.event.fileRevised',0),(295,515,71,27,'2023-03-02 23:02:18',1342177296,'submission.event.fileEdited',0),(296,1048585,10,27,'2023-03-02 23:02:18',1342177296,'submission.event.fileEdited',0),(297,515,72,27,'2023-03-02 23:02:19',1342177281,'submission.event.fileUploaded',0),(298,1048585,10,27,'2023-03-02 23:02:19',1342177288,'submission.event.fileRevised',0),(299,515,72,27,'2023-03-02 23:02:19',1342177296,'submission.event.fileEdited',0),(300,1048585,10,27,'2023-03-02 23:02:19',1342177296,'submission.event.fileEdited',0),(301,515,73,27,'2023-03-02 23:02:20',1342177281,'submission.event.fileUploaded',0),(302,1048585,10,27,'2023-03-02 23:02:20',1342177288,'submission.event.fileRevised',0),(303,515,73,27,'2023-03-02 23:02:20',1342177296,'submission.event.fileEdited',0),(304,1048585,10,27,'2023-03-02 23:02:20',1342177296,'submission.event.fileEdited',0),(305,515,74,27,'2023-03-02 23:02:21',1342177281,'submission.event.fileUploaded',0),(306,1048585,10,27,'2023-03-02 23:02:21',1342177288,'submission.event.fileRevised',0),(307,515,74,27,'2023-03-02 23:02:22',1342177296,'submission.event.fileEdited',0),(308,1048585,10,27,'2023-03-02 23:02:22',1342177296,'submission.event.fileEdited',0),(309,515,75,27,'2023-03-02 23:02:22',1342177281,'submission.event.fileUploaded',0),(310,1048585,10,27,'2023-03-02 23:02:22',1342177288,'submission.event.fileRevised',0),(311,515,75,27,'2023-03-02 23:02:23',1342177296,'submission.event.fileEdited',0),(312,1048585,10,27,'2023-03-02 23:02:23',1342177296,'submission.event.fileEdited',0),(313,515,76,27,'2023-03-02 23:02:24',1342177281,'submission.event.fileUploaded',0),(314,1048585,10,27,'2023-03-02 23:02:24',1342177288,'submission.event.fileRevised',0),(315,515,76,27,'2023-03-02 23:02:24',1342177296,'submission.event.fileEdited',0),(316,1048585,10,27,'2023-03-02 23:02:24',1342177296,'submission.event.fileEdited',0),(317,515,77,27,'2023-03-02 23:02:25',1342177281,'submission.event.fileUploaded',0),(318,1048585,10,27,'2023-03-02 23:02:25',1342177288,'submission.event.fileRevised',0),(319,515,77,27,'2023-03-02 23:02:25',1342177296,'submission.event.fileEdited',0),(320,1048585,10,27,'2023-03-02 23:02:25',1342177296,'submission.event.fileEdited',0),(321,515,78,27,'2023-03-02 23:02:26',1342177281,'submission.event.fileUploaded',0),(322,1048585,10,27,'2023-03-02 23:02:26',1342177288,'submission.event.fileRevised',0),(323,515,78,27,'2023-03-02 23:02:27',1342177296,'submission.event.fileEdited',0),(324,1048585,10,27,'2023-03-02 23:02:27',1342177296,'submission.event.fileEdited',0),(325,515,79,27,'2023-03-02 23:02:27',1342177281,'submission.event.fileUploaded',0),(326,1048585,10,27,'2023-03-02 23:02:27',1342177288,'submission.event.fileRevised',0),(327,515,79,27,'2023-03-02 23:02:28',1342177296,'submission.event.fileEdited',0),(328,1048585,10,27,'2023-03-02 23:02:28',1342177296,'submission.event.fileEdited',0),(329,1048585,10,27,'2023-03-02 23:03:45',268435457,'submission.event.submissionSubmitted',0),(330,1048585,11,28,'2023-03-02 23:03:55',268435458,'submission.event.general.metadataUpdated',0),(331,1048585,11,28,'2023-03-02 23:03:55',268435458,'submission.event.general.metadataUpdated',0),(332,515,80,28,'2023-03-02 23:03:58',1342177281,'submission.event.fileUploaded',0),(333,1048585,11,28,'2023-03-02 23:03:58',1342177288,'submission.event.fileRevised',0),(334,515,80,28,'2023-03-02 23:03:58',1342177296,'submission.event.fileEdited',0),(335,1048585,11,28,'2023-03-02 23:03:58',1342177296,'submission.event.fileEdited',0),(336,515,81,28,'2023-03-02 23:03:59',1342177281,'submission.event.fileUploaded',0),(337,1048585,11,28,'2023-03-02 23:03:59',1342177288,'submission.event.fileRevised',0),(338,515,81,28,'2023-03-02 23:03:59',1342177296,'submission.event.fileEdited',0),(339,1048585,11,28,'2023-03-02 23:03:59',1342177296,'submission.event.fileEdited',0),(340,1048585,11,28,'2023-03-02 23:04:11',268435457,'submission.event.submissionSubmitted',0),(341,1048585,11,3,'2023-03-02 23:04:25',805306371,'editor.submission.decision.sendInternalReview.log',0),(342,515,82,3,'2023-03-02 23:04:25',1342177281,'submission.event.fileUploaded',0),(343,1048585,11,3,'2023-03-02 23:04:25',1342177288,'submission.event.fileRevised',0),(344,515,83,3,'2023-03-02 23:04:26',1342177281,'submission.event.fileUploaded',0),(345,1048585,11,3,'2023-03-02 23:04:26',1342177288,'submission.event.fileRevised',0),(346,1048585,11,3,'2023-03-02 23:04:35',1073741825,'log.review.reviewerAssigned',0),(347,1048585,11,3,'2023-03-02 23:04:40',805306371,'editor.submission.decision.sendExternalReview.log',0),(348,1048585,11,3,'2023-03-02 23:04:51',1073741825,'log.review.reviewerAssigned',0),(349,1048585,11,3,'2023-03-02 23:04:58',1073741825,'log.review.reviewerAssigned',0),(350,1048585,11,10,'2023-03-02 23:05:06',1073741830,'log.review.reviewAccepted',0),(351,1048585,11,10,'2023-03-02 23:05:11',1073741848,'log.review.reviewReady',0),(352,1048585,11,12,'2023-03-02 23:05:18',1073741830,'log.review.reviewAccepted',0),(353,1048585,11,12,'2023-03-02 23:05:23',1073741848,'log.review.reviewReady',0),(354,1048585,11,3,'2023-03-02 23:05:41',805306371,'editor.submission.decision.accept.log',0),(355,1048585,11,3,'2023-03-02 23:05:42',1073741856,'submission.event.decisionReviewerEmailSent',0),(356,1048585,12,29,'2023-03-02 23:05:58',268435458,'submission.event.general.metadataUpdated',0),(357,1048585,12,29,'2023-03-02 23:05:58',268435458,'submission.event.general.metadataUpdated',0),(358,515,84,29,'2023-03-02 23:06:02',1342177281,'submission.event.fileUploaded',0),(359,1048585,12,29,'2023-03-02 23:06:02',1342177288,'submission.event.fileRevised',0),(360,515,84,29,'2023-03-02 23:06:02',1342177296,'submission.event.fileEdited',0),(361,1048585,12,29,'2023-03-02 23:06:02',1342177296,'submission.event.fileEdited',0),(362,515,85,29,'2023-03-02 23:06:03',1342177281,'submission.event.fileUploaded',0),(363,1048585,12,29,'2023-03-02 23:06:03',1342177288,'submission.event.fileRevised',0),(364,515,85,29,'2023-03-02 23:06:03',1342177296,'submission.event.fileEdited',0),(365,1048585,12,29,'2023-03-02 23:06:03',1342177296,'submission.event.fileEdited',0),(366,515,86,29,'2023-03-02 23:06:04',1342177281,'submission.event.fileUploaded',0),(367,1048585,12,29,'2023-03-02 23:06:04',1342177288,'submission.event.fileRevised',0),(368,515,86,29,'2023-03-02 23:06:04',1342177296,'submission.event.fileEdited',0),(369,1048585,12,29,'2023-03-02 23:06:04',1342177296,'submission.event.fileEdited',0),(370,1048585,12,29,'2023-03-02 23:06:28',268435457,'submission.event.submissionSubmitted',0),(371,1048585,12,3,'2023-03-02 23:06:44',805306371,'editor.submission.decision.sendInternalReview.log',0),(372,515,87,3,'2023-03-02 23:06:45',1342177281,'submission.event.fileUploaded',0),(373,1048585,12,3,'2023-03-02 23:06:45',1342177288,'submission.event.fileRevised',0),(374,515,88,3,'2023-03-02 23:06:45',1342177281,'submission.event.fileUploaded',0),(375,1048585,12,3,'2023-03-02 23:06:45',1342177288,'submission.event.fileRevised',0),(376,515,89,3,'2023-03-02 23:06:45',1342177281,'submission.event.fileUploaded',0),(377,1048585,12,3,'2023-03-02 23:06:45',1342177288,'submission.event.fileRevised',0),(378,1048585,12,3,'2023-03-02 23:06:55',1073741825,'log.review.reviewerAssigned',0),(379,1048585,12,3,'2023-03-02 23:07:03',1073741825,'log.review.reviewerAssigned',0),(380,1048585,12,3,'2023-03-02 23:07:11',1073741825,'log.review.reviewerAssigned',0),(381,1048585,12,8,'2023-03-02 23:07:19',1073741830,'log.review.reviewAccepted',0),(382,1048585,12,8,'2023-03-02 23:07:24',1073741848,'log.review.reviewReady',0),(383,1048585,13,30,'2023-03-02 23:07:34',268435458,'submission.event.general.metadataUpdated',0),(384,1048585,13,30,'2023-03-02 23:07:35',268435458,'submission.event.general.metadataUpdated',0),(385,515,90,30,'2023-03-02 23:07:38',1342177281,'submission.event.fileUploaded',0),(386,1048585,13,30,'2023-03-02 23:07:38',1342177288,'submission.event.fileRevised',0),(387,515,90,30,'2023-03-02 23:07:39',1342177296,'submission.event.fileEdited',0),(388,1048585,13,30,'2023-03-02 23:07:39',1342177296,'submission.event.fileEdited',0),(389,515,91,30,'2023-03-02 23:07:40',1342177281,'submission.event.fileUploaded',0),(390,1048585,13,30,'2023-03-02 23:07:40',1342177288,'submission.event.fileRevised',0),(391,515,91,30,'2023-03-02 23:07:40',1342177296,'submission.event.fileEdited',0),(392,1048585,13,30,'2023-03-02 23:07:40',1342177296,'submission.event.fileEdited',0),(393,515,92,30,'2023-03-02 23:07:41',1342177281,'submission.event.fileUploaded',0),(394,1048585,13,30,'2023-03-02 23:07:41',1342177288,'submission.event.fileRevised',0),(395,515,92,30,'2023-03-02 23:07:41',1342177296,'submission.event.fileEdited',0),(396,1048585,13,30,'2023-03-02 23:07:41',1342177296,'submission.event.fileEdited',0),(397,1048585,13,30,'2023-03-02 23:08:03',268435457,'submission.event.submissionSubmitted',0),(398,1048585,13,3,'2023-03-02 23:08:18',805306371,'editor.submission.decision.sendInternalReview.log',0),(399,515,93,3,'2023-03-02 23:08:18',1342177281,'submission.event.fileUploaded',0),(400,1048585,13,3,'2023-03-02 23:08:18',1342177288,'submission.event.fileRevised',0),(401,515,94,3,'2023-03-02 23:08:18',1342177281,'submission.event.fileUploaded',0),(402,1048585,13,3,'2023-03-02 23:08:18',1342177288,'submission.event.fileRevised',0),(403,515,95,3,'2023-03-02 23:08:19',1342177281,'submission.event.fileUploaded',0),(404,1048585,13,3,'2023-03-02 23:08:19',1342177288,'submission.event.fileRevised',0),(405,1048585,13,3,'2023-03-02 23:08:29',1073741825,'log.review.reviewerAssigned',0),(406,1048585,13,3,'2023-03-02 23:08:35',805306371,'editor.submission.decision.sendExternalReview.log',0),(407,1048585,13,3,'2023-03-02 23:08:46',1073741825,'log.review.reviewerAssigned',0),(408,1048585,13,3,'2023-03-02 23:08:53',1073741825,'log.review.reviewerAssigned',0),(409,1048585,13,3,'2023-03-02 23:09:02',1073741825,'log.review.reviewerAssigned',0),(410,1048585,13,10,'2023-03-02 23:09:10',1073741830,'log.review.reviewAccepted',0),(411,1048585,13,10,'2023-03-02 23:09:16',1073741848,'log.review.reviewReady',0),(412,1048585,13,12,'2023-03-02 23:09:23',1073741830,'log.review.reviewAccepted',0),(413,1048585,13,12,'2023-03-02 23:09:28',1073741848,'log.review.reviewReady',0),(414,1048585,13,3,'2023-03-02 23:09:49',805306371,'editor.submission.decision.accept.log',0),(415,1048585,13,3,'2023-03-02 23:09:49',1073741856,'submission.event.decisionReviewerEmailSent',0),(416,1048585,14,31,'2023-03-02 23:10:03',268435458,'submission.event.general.metadataUpdated',0),(417,1048585,14,31,'2023-03-02 23:10:04',268435458,'submission.event.general.metadataUpdated',0),(418,515,96,31,'2023-03-02 23:10:07',1342177281,'submission.event.fileUploaded',0),(419,1048585,14,31,'2023-03-02 23:10:07',1342177288,'submission.event.fileRevised',0),(420,515,96,31,'2023-03-02 23:10:07',1342177296,'submission.event.fileEdited',0),(421,1048585,14,31,'2023-03-02 23:10:07',1342177296,'submission.event.fileEdited',0),(422,515,97,31,'2023-03-02 23:10:08',1342177281,'submission.event.fileUploaded',0),(423,1048585,14,31,'2023-03-02 23:10:08',1342177288,'submission.event.fileRevised',0),(424,515,97,31,'2023-03-02 23:10:08',1342177296,'submission.event.fileEdited',0),(425,1048585,14,31,'2023-03-02 23:10:08',1342177296,'submission.event.fileEdited',0),(426,515,98,31,'2023-03-02 23:10:09',1342177281,'submission.event.fileUploaded',0),(427,1048585,14,31,'2023-03-02 23:10:09',1342177288,'submission.event.fileRevised',0),(428,515,98,31,'2023-03-02 23:10:09',1342177296,'submission.event.fileEdited',0),(429,1048585,14,31,'2023-03-02 23:10:09',1342177296,'submission.event.fileEdited',0),(430,515,99,31,'2023-03-02 23:10:10',1342177281,'submission.event.fileUploaded',0),(431,1048585,14,31,'2023-03-02 23:10:10',1342177288,'submission.event.fileRevised',0),(432,515,99,31,'2023-03-02 23:10:11',1342177296,'submission.event.fileEdited',0),(433,1048585,14,31,'2023-03-02 23:10:11',1342177296,'submission.event.fileEdited',0),(434,515,100,31,'2023-03-02 23:10:11',1342177281,'submission.event.fileUploaded',0),(435,1048585,14,31,'2023-03-02 23:10:11',1342177288,'submission.event.fileRevised',0),(436,515,100,31,'2023-03-02 23:10:12',1342177296,'submission.event.fileEdited',0),(437,1048585,14,31,'2023-03-02 23:10:12',1342177296,'submission.event.fileEdited',0),(438,515,101,31,'2023-03-02 23:10:13',1342177281,'submission.event.fileUploaded',0),(439,1048585,14,31,'2023-03-02 23:10:13',1342177288,'submission.event.fileRevised',0),(440,515,101,31,'2023-03-02 23:10:13',1342177296,'submission.event.fileEdited',0),(441,1048585,14,31,'2023-03-02 23:10:13',1342177296,'submission.event.fileEdited',0),(442,1048585,14,31,'2023-03-02 23:10:43',268435457,'submission.event.submissionSubmitted',0),(443,1048585,14,3,'2023-03-02 23:11:00',805306371,'editor.submission.decision.sendInternalReview.log',0),(444,515,102,3,'2023-03-02 23:11:01',1342177281,'submission.event.fileUploaded',0),(445,1048585,14,3,'2023-03-02 23:11:01',1342177288,'submission.event.fileRevised',0),(446,515,103,3,'2023-03-02 23:11:01',1342177281,'submission.event.fileUploaded',0),(447,1048585,14,3,'2023-03-02 23:11:01',1342177288,'submission.event.fileRevised',0),(448,515,104,3,'2023-03-02 23:11:01',1342177281,'submission.event.fileUploaded',0),(449,1048585,14,3,'2023-03-02 23:11:01',1342177288,'submission.event.fileRevised',0),(450,515,105,3,'2023-03-02 23:11:01',1342177281,'submission.event.fileUploaded',0),(451,1048585,14,3,'2023-03-02 23:11:01',1342177288,'submission.event.fileRevised',0),(452,515,106,3,'2023-03-02 23:11:01',1342177281,'submission.event.fileUploaded',0),(453,1048585,14,3,'2023-03-02 23:11:01',1342177288,'submission.event.fileRevised',0),(454,515,107,3,'2023-03-02 23:11:02',1342177281,'submission.event.fileUploaded',0),(455,1048585,14,3,'2023-03-02 23:11:02',1342177288,'submission.event.fileRevised',0),(456,1048585,14,3,'2023-03-02 23:11:12',1073741825,'log.review.reviewerAssigned',0),(457,1048585,14,3,'2023-03-02 23:11:19',805306371,'editor.submission.decision.sendExternalReview.log',0),(458,1048585,14,3,'2023-03-02 23:11:30',1073741825,'log.review.reviewerAssigned',0),(459,1048585,14,3,'2023-03-02 23:11:37',805306371,'editor.submission.decision.accept.log',0),(460,1048585,14,3,'2023-03-02 23:11:47',268435459,'submission.event.participantAdded',0),(461,1048585,14,3,'2023-03-02 23:11:54',805306371,'editor.submission.decision.sendToProduction.log',0),(462,1048585,14,3,'2023-03-02 23:12:06',268435459,'submission.event.participantAdded',0),(463,1048585,14,3,'2023-03-02 23:12:12',268435459,'submission.event.participantAdded',0),(464,1048585,14,3,'2023-03-02 23:12:19',268435474,'submission.event.publicationFormatCreated',0),(465,515,108,3,'2023-03-02 23:12:26',1342177281,'submission.event.fileUploaded',0),(466,1048585,14,3,'2023-03-02 23:12:26',1342177288,'submission.event.fileRevised',0),(467,515,109,3,'2023-03-02 23:12:26',1342177281,'submission.event.fileUploaded',0),(468,1048585,14,3,'2023-03-02 23:12:26',1342177288,'submission.event.fileRevised',0),(469,515,110,3,'2023-03-02 23:12:26',1342177281,'submission.event.fileUploaded',0),(470,1048585,14,3,'2023-03-02 23:12:26',1342177288,'submission.event.fileRevised',0),(471,515,111,3,'2023-03-02 23:12:26',1342177281,'submission.event.fileUploaded',0),(472,1048585,14,3,'2023-03-02 23:12:26',1342177288,'submission.event.fileRevised',0),(473,515,112,3,'2023-03-02 23:12:26',1342177281,'submission.event.fileUploaded',0),(474,1048585,14,3,'2023-03-02 23:12:26',1342177288,'submission.event.fileRevised',0),(475,515,113,3,'2023-03-02 23:12:26',1342177281,'submission.event.fileUploaded',0),(476,1048585,14,3,'2023-03-02 23:12:26',1342177288,'submission.event.fileRevised',0),(477,1048585,14,3,'2023-03-02 23:12:28',268435464,'submission.event.publicationFormatPublished',0),(478,1048585,14,3,'2023-03-02 23:12:31',268435476,'submission.event.publicationFormatMadeAvailable',0),(479,515,113,3,'2023-03-02 23:12:33',1342177296,'submission.event.fileEdited',0),(480,1048585,14,3,'2023-03-02 23:12:33',1342177296,'submission.event.fileEdited',0),(481,515,113,3,'2023-03-02 23:12:33',1342177287,'submission.event.signoffSignoff',0),(482,515,113,3,'2023-03-02 23:12:37',1342177296,'submission.event.fileEdited',0),(483,1048585,14,3,'2023-03-02 23:12:37',1342177296,'submission.event.fileEdited',0),(484,515,112,3,'2023-03-02 23:12:39',1342177296,'submission.event.fileEdited',0),(485,1048585,14,3,'2023-03-02 23:12:39',1342177296,'submission.event.fileEdited',0),(486,515,112,3,'2023-03-02 23:12:39',1342177287,'submission.event.signoffSignoff',0),(487,515,112,3,'2023-03-02 23:12:42',1342177296,'submission.event.fileEdited',0),(488,1048585,14,3,'2023-03-02 23:12:42',1342177296,'submission.event.fileEdited',0),(489,515,111,3,'2023-03-02 23:12:45',1342177296,'submission.event.fileEdited',0),(490,1048585,14,3,'2023-03-02 23:12:45',1342177296,'submission.event.fileEdited',0),(491,515,111,3,'2023-03-02 23:12:45',1342177287,'submission.event.signoffSignoff',0),(492,515,111,3,'2023-03-02 23:12:48',1342177296,'submission.event.fileEdited',0),(493,1048585,14,3,'2023-03-02 23:12:48',1342177296,'submission.event.fileEdited',0),(494,515,110,3,'2023-03-02 23:12:51',1342177296,'submission.event.fileEdited',0),(495,1048585,14,3,'2023-03-02 23:12:51',1342177296,'submission.event.fileEdited',0),(496,515,110,3,'2023-03-02 23:12:51',1342177287,'submission.event.signoffSignoff',0),(497,515,110,3,'2023-03-02 23:12:54',1342177296,'submission.event.fileEdited',0),(498,1048585,14,3,'2023-03-02 23:12:54',1342177296,'submission.event.fileEdited',0),(499,515,109,3,'2023-03-02 23:12:57',1342177296,'submission.event.fileEdited',0),(500,1048585,14,3,'2023-03-02 23:12:57',1342177296,'submission.event.fileEdited',0),(501,515,109,3,'2023-03-02 23:12:57',1342177287,'submission.event.signoffSignoff',0),(502,515,109,3,'2023-03-02 23:13:01',1342177296,'submission.event.fileEdited',0),(503,1048585,14,3,'2023-03-02 23:13:01',1342177296,'submission.event.fileEdited',0),(504,515,108,3,'2023-03-02 23:13:03',1342177296,'submission.event.fileEdited',0),(505,1048585,14,3,'2023-03-02 23:13:03',1342177296,'submission.event.fileEdited',0),(506,515,108,3,'2023-03-02 23:13:03',1342177287,'submission.event.signoffSignoff',0),(507,515,108,3,'2023-03-02 23:13:07',1342177296,'submission.event.fileEdited',0),(508,1048585,14,3,'2023-03-02 23:13:07',1342177296,'submission.event.fileEdited',0),(509,1048585,14,3,'2023-03-02 23:13:10',268435462,'publication.event.published',0),(510,1048585,15,32,'2023-03-02 23:13:21',268435458,'submission.event.general.metadataUpdated',0),(511,1048585,15,32,'2023-03-02 23:13:21',268435458,'submission.event.general.metadataUpdated',0),(512,515,114,32,'2023-03-02 23:13:24',1342177281,'submission.event.fileUploaded',0),(513,1048585,15,32,'2023-03-02 23:13:24',1342177288,'submission.event.fileRevised',0),(514,515,114,32,'2023-03-02 23:13:25',1342177296,'submission.event.fileEdited',0),(515,1048585,15,32,'2023-03-02 23:13:25',1342177296,'submission.event.fileEdited',0),(516,515,115,32,'2023-03-02 23:13:25',1342177281,'submission.event.fileUploaded',0),(517,1048585,15,32,'2023-03-02 23:13:26',1342177288,'submission.event.fileRevised',0),(518,515,115,32,'2023-03-02 23:13:26',1342177296,'submission.event.fileEdited',0),(519,1048585,15,32,'2023-03-02 23:13:26',1342177296,'submission.event.fileEdited',0),(520,515,116,32,'2023-03-02 23:13:27',1342177281,'submission.event.fileUploaded',0),(521,1048585,15,32,'2023-03-02 23:13:27',1342177288,'submission.event.fileRevised',0),(522,515,116,32,'2023-03-02 23:13:27',1342177296,'submission.event.fileEdited',0),(523,1048585,15,32,'2023-03-02 23:13:27',1342177296,'submission.event.fileEdited',0),(524,1048585,15,32,'2023-03-02 23:13:46',268435457,'submission.event.submissionSubmitted',0),(525,1048585,15,3,'2023-03-02 23:14:02',805306371,'editor.submission.decision.sendExternalReview.log',0),(526,515,117,3,'2023-03-02 23:14:02',1342177281,'submission.event.fileUploaded',0),(527,1048585,15,3,'2023-03-02 23:14:02',1342177288,'submission.event.fileRevised',0),(528,515,118,3,'2023-03-02 23:14:02',1342177281,'submission.event.fileUploaded',0),(529,1048585,15,3,'2023-03-02 23:14:02',1342177288,'submission.event.fileRevised',0),(530,515,119,3,'2023-03-02 23:14:02',1342177281,'submission.event.fileUploaded',0),(531,1048585,15,3,'2023-03-02 23:14:02',1342177288,'submission.event.fileRevised',0),(532,1048585,16,33,'2023-03-02 23:14:16',268435458,'submission.event.general.metadataUpdated',0),(533,1048585,16,33,'2023-03-02 23:14:17',268435458,'submission.event.general.metadataUpdated',0),(534,515,120,33,'2023-03-02 23:14:20',1342177281,'submission.event.fileUploaded',0),(535,1048585,16,33,'2023-03-02 23:14:20',1342177288,'submission.event.fileRevised',0),(536,515,120,33,'2023-03-02 23:14:20',1342177296,'submission.event.fileEdited',0),(537,1048585,16,33,'2023-03-02 23:14:20',1342177296,'submission.event.fileEdited',0),(538,515,121,33,'2023-03-02 23:14:21',1342177281,'submission.event.fileUploaded',0),(539,1048585,16,33,'2023-03-02 23:14:21',1342177288,'submission.event.fileRevised',0),(540,515,121,33,'2023-03-02 23:14:22',1342177296,'submission.event.fileEdited',0),(541,1048585,16,33,'2023-03-02 23:14:22',1342177296,'submission.event.fileEdited',0),(542,515,122,33,'2023-03-02 23:14:22',1342177281,'submission.event.fileUploaded',0),(543,1048585,16,33,'2023-03-02 23:14:22',1342177288,'submission.event.fileRevised',0),(544,515,122,33,'2023-03-02 23:14:23',1342177296,'submission.event.fileEdited',0),(545,1048585,16,33,'2023-03-02 23:14:23',1342177296,'submission.event.fileEdited',0),(546,515,123,33,'2023-03-02 23:14:23',1342177281,'submission.event.fileUploaded',0),(547,1048585,16,33,'2023-03-02 23:14:23',1342177288,'submission.event.fileRevised',0),(548,515,123,33,'2023-03-02 23:14:24',1342177296,'submission.event.fileEdited',0),(549,1048585,16,33,'2023-03-02 23:14:24',1342177296,'submission.event.fileEdited',0),(550,515,124,33,'2023-03-02 23:14:25',1342177281,'submission.event.fileUploaded',0),(551,1048585,16,33,'2023-03-02 23:14:25',1342177288,'submission.event.fileRevised',0),(552,515,124,33,'2023-03-02 23:14:25',1342177296,'submission.event.fileEdited',0),(553,1048585,16,33,'2023-03-02 23:14:25',1342177296,'submission.event.fileEdited',0),(554,1048585,16,33,'2023-03-02 23:14:58',268435457,'submission.event.submissionSubmitted',0),(555,1048585,16,3,'2023-03-02 23:15:17',805306371,'editor.submission.decision.sendExternalReview.log',0),(556,515,125,3,'2023-03-02 23:15:17',1342177281,'submission.event.fileUploaded',0),(557,1048585,16,3,'2023-03-02 23:15:17',1342177288,'submission.event.fileRevised',0),(558,515,126,3,'2023-03-02 23:15:17',1342177281,'submission.event.fileUploaded',0),(559,1048585,16,3,'2023-03-02 23:15:17',1342177288,'submission.event.fileRevised',0),(560,515,127,3,'2023-03-02 23:15:17',1342177281,'submission.event.fileUploaded',0),(561,1048585,16,3,'2023-03-02 23:15:17',1342177288,'submission.event.fileRevised',0),(562,515,128,3,'2023-03-02 23:15:17',1342177281,'submission.event.fileUploaded',0),(563,1048585,16,3,'2023-03-02 23:15:17',1342177288,'submission.event.fileRevised',0),(564,515,129,3,'2023-03-02 23:15:17',1342177281,'submission.event.fileUploaded',0),(565,1048585,16,3,'2023-03-02 23:15:17',1342177288,'submission.event.fileRevised',0),(566,1048585,16,3,'2023-03-02 23:15:28',1073741825,'log.review.reviewerAssigned',0),(567,1048585,16,3,'2023-03-02 23:15:36',1073741825,'log.review.reviewerAssigned',0),(568,1048585,16,3,'2023-03-02 23:15:44',1073741825,'log.review.reviewerAssigned',0),(569,1048585,16,10,'2023-03-02 23:15:54',1073741830,'log.review.reviewAccepted',0),(570,1048585,16,10,'2023-03-02 23:16:00',1073741848,'log.review.reviewReady',0),(571,1048585,17,34,'2023-03-02 23:16:10',268435458,'submission.event.general.metadataUpdated',0),(572,1048585,17,34,'2023-03-02 23:16:10',268435458,'submission.event.general.metadataUpdated',0),(573,515,130,34,'2023-03-02 23:16:14',1342177281,'submission.event.fileUploaded',0),(574,1048585,17,34,'2023-03-02 23:16:14',1342177288,'submission.event.fileRevised',0),(575,515,130,34,'2023-03-02 23:16:14',1342177296,'submission.event.fileEdited',0),(576,1048585,17,34,'2023-03-02 23:16:14',1342177296,'submission.event.fileEdited',0),(577,515,131,34,'2023-03-02 23:16:15',1342177281,'submission.event.fileUploaded',0),(578,1048585,17,34,'2023-03-02 23:16:15',1342177288,'submission.event.fileRevised',0),(579,515,131,34,'2023-03-02 23:16:15',1342177296,'submission.event.fileEdited',0),(580,1048585,17,34,'2023-03-02 23:16:15',1342177296,'submission.event.fileEdited',0),(581,515,132,34,'2023-03-02 23:16:16',1342177281,'submission.event.fileUploaded',0),(582,1048585,17,34,'2023-03-02 23:16:16',1342177288,'submission.event.fileRevised',0),(583,515,132,34,'2023-03-02 23:16:16',1342177296,'submission.event.fileEdited',0),(584,1048585,17,34,'2023-03-02 23:16:16',1342177296,'submission.event.fileEdited',0),(585,515,133,34,'2023-03-02 23:16:17',1342177281,'submission.event.fileUploaded',0),(586,1048585,17,34,'2023-03-02 23:16:17',1342177288,'submission.event.fileRevised',0),(587,515,133,34,'2023-03-02 23:16:17',1342177296,'submission.event.fileEdited',0),(588,1048585,17,34,'2023-03-02 23:16:17',1342177296,'submission.event.fileEdited',0),(589,515,134,34,'2023-03-02 23:16:18',1342177281,'submission.event.fileUploaded',0),(590,1048585,17,34,'2023-03-02 23:16:18',1342177288,'submission.event.fileRevised',0),(591,515,134,34,'2023-03-02 23:16:19',1342177296,'submission.event.fileEdited',0),(592,1048585,17,34,'2023-03-02 23:16:19',1342177296,'submission.event.fileEdited',0),(593,515,135,34,'2023-03-02 23:16:19',1342177281,'submission.event.fileUploaded',0),(594,1048585,17,34,'2023-03-02 23:16:19',1342177288,'submission.event.fileRevised',0),(595,515,135,34,'2023-03-02 23:16:20',1342177296,'submission.event.fileEdited',0),(596,1048585,17,34,'2023-03-02 23:16:20',1342177296,'submission.event.fileEdited',0),(597,1048585,17,34,'2023-03-02 23:17:10',268435457,'submission.event.submissionSubmitted',0),(598,1048585,17,3,'2023-03-02 23:17:29',805306371,'editor.submission.decision.sendInternalReview.log',0),(599,515,136,3,'2023-03-02 23:17:30',1342177281,'submission.event.fileUploaded',0),(600,1048585,17,3,'2023-03-02 23:17:30',1342177288,'submission.event.fileRevised',0),(601,515,137,3,'2023-03-02 23:17:30',1342177281,'submission.event.fileUploaded',0),(602,1048585,17,3,'2023-03-02 23:17:30',1342177288,'submission.event.fileRevised',0),(603,515,138,3,'2023-03-02 23:17:30',1342177281,'submission.event.fileUploaded',0),(604,1048585,17,3,'2023-03-02 23:17:30',1342177288,'submission.event.fileRevised',0),(605,515,139,3,'2023-03-02 23:17:30',1342177281,'submission.event.fileUploaded',0),(606,1048585,17,3,'2023-03-02 23:17:30',1342177288,'submission.event.fileRevised',0),(607,515,140,3,'2023-03-02 23:17:30',1342177281,'submission.event.fileUploaded',0),(608,1048585,17,3,'2023-03-02 23:17:30',1342177288,'submission.event.fileRevised',0),(609,515,141,3,'2023-03-02 23:17:30',1342177281,'submission.event.fileUploaded',0),(610,1048585,17,3,'2023-03-02 23:17:30',1342177288,'submission.event.fileRevised',0),(611,1048585,17,3,'2023-03-02 23:17:42',1073741825,'log.review.reviewerAssigned',0),(612,1048585,17,3,'2023-03-02 23:17:50',1073741825,'log.review.reviewerAssigned',0);
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
INSERT INTO `event_log_settings` VALUES (3,'fileId','1','int'),(3,'fileStage','2','int'),(3,'originalFileName','chapter1.pdf','string'),(3,'sourceSubmissionFileId',NULL,'string'),(3,'submissionFileId','1','int'),(3,'submissionId','1','int'),(3,'username','aclark','string'),(4,'fileId','1','int'),(4,'fileStage','2','int'),(4,'name','chapter1.pdf','string'),(4,'submissionFileId','1','int'),(4,'submissionId','1','int'),(4,'username','aclark','string'),(5,'fileId','1','int'),(5,'fileStage','2','int'),(5,'originalFileName','chapter1.pdf','string'),(5,'sourceSubmissionFileId',NULL,'string'),(5,'submissionFileId','1','int'),(5,'submissionId','1','int'),(5,'username','aclark','string'),(6,'fileId','1','int'),(6,'fileStage','2','int'),(6,'name','chapter1.pdf','string'),(6,'originalFileName','chapter1.pdf','string'),(6,'sourceSubmissionFileId',NULL,'string'),(6,'submissionFileId','1','int'),(6,'submissionId','1','int'),(6,'username','aclark','string'),(7,'fileId','2','int'),(7,'fileStage','2','int'),(7,'originalFileName','chapter2.pdf','string'),(7,'sourceSubmissionFileId',NULL,'string'),(7,'submissionFileId','2','int'),(7,'submissionId','1','int'),(7,'username','aclark','string'),(8,'fileId','2','int'),(8,'fileStage','2','int'),(8,'name','chapter2.pdf','string'),(8,'submissionFileId','2','int'),(8,'submissionId','1','int'),(8,'username','aclark','string'),(9,'fileId','2','int'),(9,'fileStage','2','int'),(9,'originalFileName','chapter2.pdf','string'),(9,'sourceSubmissionFileId',NULL,'string'),(9,'submissionFileId','2','int'),(9,'submissionId','1','int'),(9,'username','aclark','string'),(10,'fileId','2','int'),(10,'fileStage','2','int'),(10,'name','chapter2.pdf','string'),(10,'originalFileName','chapter2.pdf','string'),(10,'sourceSubmissionFileId',NULL,'string'),(10,'submissionFileId','2','int'),(10,'submissionId','1','int'),(10,'username','aclark','string'),(11,'fileId','3','int'),(11,'fileStage','2','int'),(11,'originalFileName','chapter3.pdf','string'),(11,'sourceSubmissionFileId',NULL,'string'),(11,'submissionFileId','3','int'),(11,'submissionId','1','int'),(11,'username','aclark','string'),(12,'fileId','3','int'),(12,'fileStage','2','int'),(12,'name','chapter3.pdf','string'),(12,'submissionFileId','3','int'),(12,'submissionId','1','int'),(12,'username','aclark','string'),(13,'fileId','3','int'),(13,'fileStage','2','int'),(13,'originalFileName','chapter3.pdf','string'),(13,'sourceSubmissionFileId',NULL,'string'),(13,'submissionFileId','3','int'),(13,'submissionId','1','int'),(13,'username','aclark','string'),(14,'fileId','3','int'),(14,'fileStage','2','int'),(14,'name','chapter3.pdf','string'),(14,'originalFileName','chapter3.pdf','string'),(14,'sourceSubmissionFileId',NULL,'string'),(14,'submissionFileId','3','int'),(14,'submissionId','1','int'),(14,'username','aclark','string'),(16,'decision','18','int'),(16,'editorId','3','int'),(16,'editorName','Daniel Barnes','string'),(16,'submissionId','1','int'),(17,'fileId','2','int'),(17,'fileStage','4','int'),(17,'originalFileName','chapter2.pdf','string'),(17,'sourceSubmissionFileId','2','int'),(17,'submissionFileId','4','int'),(17,'submissionId','1','int'),(17,'username','dbarnes','string'),(18,'fileId','2','int'),(18,'fileStage','4','int'),(18,'name','chapter2.pdf','string'),(18,'submissionFileId','4','int'),(18,'submissionId','1','int'),(18,'username','dbarnes','string'),(19,'fileId','3','int'),(19,'fileStage','4','int'),(19,'originalFileName','chapter3.pdf','string'),(19,'sourceSubmissionFileId','3','int'),(19,'submissionFileId','5','int'),(19,'submissionId','1','int'),(19,'username','dbarnes','string'),(20,'fileId','3','int'),(20,'fileStage','4','int'),(20,'name','chapter3.pdf','string'),(20,'submissionFileId','5','int'),(20,'submissionId','1','int'),(20,'username','dbarnes','string'),(21,'fileId','1','int'),(21,'fileStage','4','int'),(21,'originalFileName','chapter1.pdf','string'),(21,'sourceSubmissionFileId','1','int'),(21,'submissionFileId','6','int'),(21,'submissionId','1','int'),(21,'username','dbarnes','string'),(22,'fileId','1','int'),(22,'fileStage','4','int'),(22,'name','chapter1.pdf','string'),(22,'submissionFileId','6','int'),(22,'submissionId','1','int'),(22,'username','dbarnes','string'),(23,'reviewAssignmentId','1','int'),(23,'reviewerName','Gonzalo Favio','string'),(23,'round','1','int'),(23,'stageId','3','int'),(23,'submissionId','1','int'),(24,'decision','2','int'),(24,'editorId','3','int'),(24,'editorName','Daniel Barnes','string'),(24,'submissionId','1','int'),(25,'name','Sarah Vogt','string'),(25,'userGroupName','Copyeditor','string'),(25,'username','svogt','string'),(29,'fileId','4','int'),(29,'fileStage','2','int'),(29,'originalFileName','chapter1.pdf','string'),(29,'sourceSubmissionFileId',NULL,'string'),(29,'submissionFileId','7','int'),(29,'submissionId','2','int'),(29,'username','afinkel','string'),(30,'fileId','4','int'),(30,'fileStage','2','int'),(30,'name','chapter1.pdf','string'),(30,'submissionFileId','7','int'),(30,'submissionId','2','int'),(30,'username','afinkel','string'),(31,'fileId','4','int'),(31,'fileStage','2','int'),(31,'originalFileName','chapter1.pdf','string'),(31,'sourceSubmissionFileId',NULL,'string'),(31,'submissionFileId','7','int'),(31,'submissionId','2','int'),(31,'username','afinkel','string'),(32,'fileId','4','int'),(32,'fileStage','2','int'),(32,'name','chapter1.pdf','string'),(32,'originalFileName','chapter1.pdf','string'),(32,'sourceSubmissionFileId',NULL,'string'),(32,'submissionFileId','7','int'),(32,'submissionId','2','int'),(32,'username','afinkel','string'),(33,'fileId','5','int'),(33,'fileStage','2','int'),(33,'originalFileName','chapter2.pdf','string'),(33,'sourceSubmissionFileId',NULL,'string'),(33,'submissionFileId','8','int'),(33,'submissionId','2','int'),(33,'username','afinkel','string'),(34,'fileId','5','int'),(34,'fileStage','2','int'),(34,'name','chapter2.pdf','string'),(34,'submissionFileId','8','int'),(34,'submissionId','2','int'),(34,'username','afinkel','string'),(35,'fileId','5','int'),(35,'fileStage','2','int'),(35,'originalFileName','chapter2.pdf','string'),(35,'sourceSubmissionFileId',NULL,'string'),(35,'submissionFileId','8','int'),(35,'submissionId','2','int'),(35,'username','afinkel','string'),(36,'fileId','5','int'),(36,'fileStage','2','int'),(36,'name','chapter2.pdf','string'),(36,'originalFileName','chapter2.pdf','string'),(36,'sourceSubmissionFileId',NULL,'string'),(36,'submissionFileId','8','int'),(36,'submissionId','2','int'),(36,'username','afinkel','string'),(37,'fileId','6','int'),(37,'fileStage','2','int'),(37,'originalFileName','chapter3.pdf','string'),(37,'sourceSubmissionFileId',NULL,'string'),(37,'submissionFileId','9','int'),(37,'submissionId','2','int'),(37,'username','afinkel','string'),(38,'fileId','6','int'),(38,'fileStage','2','int'),(38,'name','chapter3.pdf','string'),(38,'submissionFileId','9','int'),(38,'submissionId','2','int'),(38,'username','afinkel','string'),(39,'fileId','6','int'),(39,'fileStage','2','int'),(39,'originalFileName','chapter3.pdf','string'),(39,'sourceSubmissionFileId',NULL,'string'),(39,'submissionFileId','9','int'),(39,'submissionId','2','int'),(39,'username','afinkel','string'),(40,'fileId','6','int'),(40,'fileStage','2','int'),(40,'name','chapter3.pdf','string'),(40,'originalFileName','chapter3.pdf','string'),(40,'sourceSubmissionFileId',NULL,'string'),(40,'submissionFileId','9','int'),(40,'submissionId','2','int'),(40,'username','afinkel','string'),(41,'fileId','7','int'),(41,'fileStage','2','int'),(41,'originalFileName','chapter4.pdf','string'),(41,'sourceSubmissionFileId',NULL,'string'),(41,'submissionFileId','10','int'),(41,'submissionId','2','int'),(41,'username','afinkel','string'),(42,'fileId','7','int'),(42,'fileStage','2','int'),(42,'name','chapter4.pdf','string'),(42,'submissionFileId','10','int'),(42,'submissionId','2','int'),(42,'username','afinkel','string'),(43,'fileId','7','int'),(43,'fileStage','2','int'),(43,'originalFileName','chapter4.pdf','string'),(43,'sourceSubmissionFileId',NULL,'string'),(43,'submissionFileId','10','int'),(43,'submissionId','2','int'),(43,'username','afinkel','string'),(44,'fileId','7','int'),(44,'fileStage','2','int'),(44,'name','chapter4.pdf','string'),(44,'originalFileName','chapter4.pdf','string'),(44,'sourceSubmissionFileId',NULL,'string'),(44,'submissionFileId','10','int'),(44,'submissionId','2','int'),(44,'username','afinkel','string'),(45,'fileId','8','int'),(45,'fileStage','2','int'),(45,'originalFileName','delete-this-file.pdf','string'),(45,'sourceSubmissionFileId',NULL,'string'),(45,'submissionFileId','11','int'),(45,'submissionId','2','int'),(45,'username','afinkel','string'),(46,'fileId','8','int'),(46,'fileStage','2','int'),(46,'name','delete-this-file.pdf','string'),(46,'submissionFileId','11','int'),(46,'submissionId','2','int'),(46,'username','afinkel','string'),(47,'fileId','8','int'),(47,'fileStage','2','int'),(47,'originalFileName','delete-this-file.pdf','string'),(47,'sourceSubmissionFileId',NULL,'string'),(47,'submissionFileId','11','int'),(47,'submissionId','2','int'),(47,'username','afinkel','string'),(48,'fileId','8','int'),(48,'fileStage','2','int'),(48,'name','delete-this-file.pdf','string'),(48,'originalFileName','delete-this-file.pdf','string'),(48,'sourceSubmissionFileId',NULL,'string'),(48,'submissionFileId','11','int'),(48,'submissionId','2','int'),(48,'username','afinkel','string'),(49,'fileStage','2','int'),(49,'sourceSubmissionFileId',NULL,'string'),(49,'submissionFileId','11','int'),(49,'submissionId','2','int'),(49,'username','afinkel','string'),(51,'decision','18','int'),(51,'editorId','3','int'),(51,'editorName','Daniel Barnes','string'),(51,'submissionId','2','int'),(52,'fileId','7','int'),(52,'fileStage','4','int'),(52,'originalFileName','chapter4.pdf','string'),(52,'sourceSubmissionFileId','10','int'),(52,'submissionFileId','12','int'),(52,'submissionId','2','int'),(52,'username','dbarnes','string'),(53,'fileId','7','int'),(53,'fileStage','4','int'),(53,'name','chapter4.pdf','string'),(53,'submissionFileId','12','int'),(53,'submissionId','2','int'),(53,'username','dbarnes','string'),(54,'fileId','5','int'),(54,'fileStage','4','int'),(54,'originalFileName','chapter2.pdf','string'),(54,'sourceSubmissionFileId','8','int'),(54,'submissionFileId','13','int'),(54,'submissionId','2','int'),(54,'username','dbarnes','string'),(55,'fileId','5','int'),(55,'fileStage','4','int'),(55,'name','chapter2.pdf','string'),(55,'submissionFileId','13','int'),(55,'submissionId','2','int'),(55,'username','dbarnes','string'),(56,'fileId','4','int'),(56,'fileStage','4','int'),(56,'originalFileName','chapter1.pdf','string'),(56,'sourceSubmissionFileId','7','int'),(56,'submissionFileId','14','int'),(56,'submissionId','2','int'),(56,'username','dbarnes','string'),(57,'fileId','4','int'),(57,'fileStage','4','int'),(57,'name','chapter1.pdf','string'),(57,'submissionFileId','14','int'),(57,'submissionId','2','int'),(57,'username','dbarnes','string'),(58,'fileId','6','int'),(58,'fileStage','4','int'),(58,'originalFileName','chapter3.pdf','string'),(58,'sourceSubmissionFileId','9','int'),(58,'submissionFileId','15','int'),(58,'submissionId','2','int'),(58,'username','dbarnes','string'),(59,'fileId','6','int'),(59,'fileStage','4','int'),(59,'name','chapter3.pdf','string'),(59,'submissionFileId','15','int'),(59,'submissionId','2','int'),(59,'username','dbarnes','string'),(60,'reviewAssignmentId','2','int'),(60,'reviewerName','Al Zacharia','string'),(60,'round','1','int'),(60,'stageId','3','int'),(60,'submissionId','2','int'),(61,'reviewAssignmentId','3','int'),(61,'reviewerName','Gonzalo Favio','string'),(61,'round','1','int'),(61,'stageId','3','int'),(61,'submissionId','2','int'),(64,'fileId','9','int'),(64,'fileStage','2','int'),(64,'originalFileName','chapter1.pdf','string'),(64,'sourceSubmissionFileId',NULL,'string'),(64,'submissionFileId','16','int'),(64,'submissionId','3','int'),(64,'username','bbarnetson','string'),(65,'fileId','9','int'),(65,'fileStage','2','int'),(65,'name','chapter1.pdf','string'),(65,'submissionFileId','16','int'),(65,'submissionId','3','int'),(65,'username','bbarnetson','string'),(66,'fileId','9','int'),(66,'fileStage','2','int'),(66,'originalFileName','chapter1.pdf','string'),(66,'sourceSubmissionFileId',NULL,'string'),(66,'submissionFileId','16','int'),(66,'submissionId','3','int'),(66,'username','bbarnetson','string'),(67,'fileId','9','int'),(67,'fileStage','2','int'),(67,'name','chapter1.pdf','string'),(67,'originalFileName','chapter1.pdf','string'),(67,'sourceSubmissionFileId',NULL,'string'),(67,'submissionFileId','16','int'),(67,'submissionId','3','int'),(67,'username','bbarnetson','string'),(68,'fileId','10','int'),(68,'fileStage','2','int'),(68,'originalFileName','chapter2.pdf','string'),(68,'sourceSubmissionFileId',NULL,'string'),(68,'submissionFileId','17','int'),(68,'submissionId','3','int'),(68,'username','bbarnetson','string'),(69,'fileId','10','int'),(69,'fileStage','2','int'),(69,'name','chapter2.pdf','string'),(69,'submissionFileId','17','int'),(69,'submissionId','3','int'),(69,'username','bbarnetson','string'),(70,'fileId','10','int'),(70,'fileStage','2','int'),(70,'originalFileName','chapter2.pdf','string'),(70,'sourceSubmissionFileId',NULL,'string'),(70,'submissionFileId','17','int'),(70,'submissionId','3','int'),(70,'username','bbarnetson','string'),(71,'fileId','10','int'),(71,'fileStage','2','int'),(71,'name','chapter2.pdf','string'),(71,'originalFileName','chapter2.pdf','string'),(71,'sourceSubmissionFileId',NULL,'string'),(71,'submissionFileId','17','int'),(71,'submissionId','3','int'),(71,'username','bbarnetson','string'),(72,'fileId','11','int'),(72,'fileStage','2','int'),(72,'originalFileName','chapter3.pdf','string'),(72,'sourceSubmissionFileId',NULL,'string'),(72,'submissionFileId','18','int'),(72,'submissionId','3','int'),(72,'username','bbarnetson','string'),(73,'fileId','11','int'),(73,'fileStage','2','int'),(73,'name','chapter3.pdf','string'),(73,'submissionFileId','18','int'),(73,'submissionId','3','int'),(73,'username','bbarnetson','string'),(74,'fileId','11','int'),(74,'fileStage','2','int'),(74,'originalFileName','chapter3.pdf','string'),(74,'sourceSubmissionFileId',NULL,'string'),(74,'submissionFileId','18','int'),(74,'submissionId','3','int'),(74,'username','bbarnetson','string'),(75,'fileId','11','int'),(75,'fileStage','2','int'),(75,'name','chapter3.pdf','string'),(75,'originalFileName','chapter3.pdf','string'),(75,'sourceSubmissionFileId',NULL,'string'),(75,'submissionFileId','18','int'),(75,'submissionId','3','int'),(75,'username','bbarnetson','string'),(76,'fileId','12','int'),(76,'fileStage','2','int'),(76,'originalFileName','chapter4.pdf','string'),(76,'sourceSubmissionFileId',NULL,'string'),(76,'submissionFileId','19','int'),(76,'submissionId','3','int'),(76,'username','bbarnetson','string'),(77,'fileId','12','int'),(77,'fileStage','2','int'),(77,'name','chapter4.pdf','string'),(77,'submissionFileId','19','int'),(77,'submissionId','3','int'),(77,'username','bbarnetson','string'),(78,'fileId','12','int'),(78,'fileStage','2','int'),(78,'originalFileName','chapter4.pdf','string'),(78,'sourceSubmissionFileId',NULL,'string'),(78,'submissionFileId','19','int'),(78,'submissionId','3','int'),(78,'username','bbarnetson','string'),(79,'fileId','12','int'),(79,'fileStage','2','int'),(79,'name','chapter4.pdf','string'),(79,'originalFileName','chapter4.pdf','string'),(79,'sourceSubmissionFileId',NULL,'string'),(79,'submissionFileId','19','int'),(79,'submissionId','3','int'),(79,'username','bbarnetson','string'),(80,'fileId','13','int'),(80,'fileStage','2','int'),(80,'originalFileName','chapter5.pdf','string'),(80,'sourceSubmissionFileId',NULL,'string'),(80,'submissionFileId','20','int'),(80,'submissionId','3','int'),(80,'username','bbarnetson','string'),(81,'fileId','13','int'),(81,'fileStage','2','int'),(81,'name','chapter5.pdf','string'),(81,'submissionFileId','20','int'),(81,'submissionId','3','int'),(81,'username','bbarnetson','string'),(82,'fileId','13','int'),(82,'fileStage','2','int'),(82,'originalFileName','chapter5.pdf','string'),(82,'sourceSubmissionFileId',NULL,'string'),(82,'submissionFileId','20','int'),(82,'submissionId','3','int'),(82,'username','bbarnetson','string'),(83,'fileId','13','int'),(83,'fileStage','2','int'),(83,'name','chapter5.pdf','string'),(83,'originalFileName','chapter5.pdf','string'),(83,'sourceSubmissionFileId',NULL,'string'),(83,'submissionFileId','20','int'),(83,'submissionId','3','int'),(83,'username','bbarnetson','string'),(87,'fileId','14','int'),(87,'fileStage','2','int'),(87,'originalFileName','chapter1.pdf','string'),(87,'sourceSubmissionFileId',NULL,'string'),(87,'submissionFileId','21','int'),(87,'submissionId','4','int'),(87,'username','bbeaty','string'),(88,'fileId','14','int'),(88,'fileStage','2','int'),(88,'name','chapter1.pdf','string'),(88,'submissionFileId','21','int'),(88,'submissionId','4','int'),(88,'username','bbeaty','string'),(89,'fileId','14','int'),(89,'fileStage','2','int'),(89,'originalFileName','chapter1.pdf','string'),(89,'sourceSubmissionFileId',NULL,'string'),(89,'submissionFileId','21','int'),(89,'submissionId','4','int'),(89,'username','bbeaty','string'),(90,'fileId','14','int'),(90,'fileStage','2','int'),(90,'name','chapter1.pdf','string'),(90,'originalFileName','chapter1.pdf','string'),(90,'sourceSubmissionFileId',NULL,'string'),(90,'submissionFileId','21','int'),(90,'submissionId','4','int'),(90,'username','bbeaty','string'),(91,'fileId','15','int'),(91,'fileStage','2','int'),(91,'originalFileName','chapter2.pdf','string'),(91,'sourceSubmissionFileId',NULL,'string'),(91,'submissionFileId','22','int'),(91,'submissionId','4','int'),(91,'username','bbeaty','string'),(92,'fileId','15','int'),(92,'fileStage','2','int'),(92,'name','chapter2.pdf','string'),(92,'submissionFileId','22','int'),(92,'submissionId','4','int'),(92,'username','bbeaty','string'),(93,'fileId','15','int'),(93,'fileStage','2','int'),(93,'originalFileName','chapter2.pdf','string'),(93,'sourceSubmissionFileId',NULL,'string'),(93,'submissionFileId','22','int'),(93,'submissionId','4','int'),(93,'username','bbeaty','string'),(94,'fileId','15','int'),(94,'fileStage','2','int'),(94,'name','chapter2.pdf','string'),(94,'originalFileName','chapter2.pdf','string'),(94,'sourceSubmissionFileId',NULL,'string'),(94,'submissionFileId','22','int'),(94,'submissionId','4','int'),(94,'username','bbeaty','string'),(95,'fileId','16','int'),(95,'fileStage','2','int'),(95,'originalFileName','chapter3.pdf','string'),(95,'sourceSubmissionFileId',NULL,'string'),(95,'submissionFileId','23','int'),(95,'submissionId','4','int'),(95,'username','bbeaty','string'),(96,'fileId','16','int'),(96,'fileStage','2','int'),(96,'name','chapter3.pdf','string'),(96,'submissionFileId','23','int'),(96,'submissionId','4','int'),(96,'username','bbeaty','string'),(97,'fileId','16','int'),(97,'fileStage','2','int'),(97,'originalFileName','chapter3.pdf','string'),(97,'sourceSubmissionFileId',NULL,'string'),(97,'submissionFileId','23','int'),(97,'submissionId','4','int'),(97,'username','bbeaty','string'),(98,'fileId','16','int'),(98,'fileStage','2','int'),(98,'name','chapter3.pdf','string'),(98,'originalFileName','chapter3.pdf','string'),(98,'sourceSubmissionFileId',NULL,'string'),(98,'submissionFileId','23','int'),(98,'submissionId','4','int'),(98,'username','bbeaty','string'),(99,'fileId','17','int'),(99,'fileStage','2','int'),(99,'originalFileName','intro.pdf','string'),(99,'sourceSubmissionFileId',NULL,'string'),(99,'submissionFileId','24','int'),(99,'submissionId','4','int'),(99,'username','bbeaty','string'),(100,'fileId','17','int'),(100,'fileStage','2','int'),(100,'name','intro.pdf','string'),(100,'submissionFileId','24','int'),(100,'submissionId','4','int'),(100,'username','bbeaty','string'),(101,'fileId','17','int'),(101,'fileStage','2','int'),(101,'originalFileName','intro.pdf','string'),(101,'sourceSubmissionFileId',NULL,'string'),(101,'submissionFileId','24','int'),(101,'submissionId','4','int'),(101,'username','bbeaty','string'),(102,'fileId','17','int'),(102,'fileStage','2','int'),(102,'name','intro.pdf','string'),(102,'originalFileName','intro.pdf','string'),(102,'sourceSubmissionFileId',NULL,'string'),(102,'submissionFileId','24','int'),(102,'submissionId','4','int'),(102,'username','bbeaty','string'),(104,'decision','1','int'),(104,'editorId','3','int'),(104,'editorName','Daniel Barnes','string'),(104,'submissionId','4','int'),(105,'fileId','17','int'),(105,'fileStage','19','int'),(105,'originalFileName','intro.pdf','string'),(105,'sourceSubmissionFileId','24','int'),(105,'submissionFileId','25','int'),(105,'submissionId','4','int'),(105,'username','dbarnes','string'),(106,'fileId','17','int'),(106,'fileStage','19','int'),(106,'name','intro.pdf','string'),(106,'submissionFileId','25','int'),(106,'submissionId','4','int'),(106,'username','dbarnes','string'),(107,'fileId','16','int'),(107,'fileStage','19','int'),(107,'originalFileName','chapter3.pdf','string'),(107,'sourceSubmissionFileId','23','int'),(107,'submissionFileId','26','int'),(107,'submissionId','4','int'),(107,'username','dbarnes','string'),(108,'fileId','16','int'),(108,'fileStage','19','int'),(108,'name','chapter3.pdf','string'),(108,'submissionFileId','26','int'),(108,'submissionId','4','int'),(108,'username','dbarnes','string'),(109,'fileId','14','int'),(109,'fileStage','19','int'),(109,'originalFileName','chapter1.pdf','string'),(109,'sourceSubmissionFileId','21','int'),(109,'submissionFileId','27','int'),(109,'submissionId','4','int'),(109,'username','dbarnes','string'),(110,'fileId','14','int'),(110,'fileStage','19','int'),(110,'name','chapter1.pdf','string'),(110,'submissionFileId','27','int'),(110,'submissionId','4','int'),(110,'username','dbarnes','string'),(111,'fileId','15','int'),(111,'fileStage','19','int'),(111,'originalFileName','chapter2.pdf','string'),(111,'sourceSubmissionFileId','22','int'),(111,'submissionFileId','28','int'),(111,'submissionId','4','int'),(111,'username','dbarnes','string'),(112,'fileId','15','int'),(112,'fileStage','19','int'),(112,'name','chapter2.pdf','string'),(112,'submissionFileId','28','int'),(112,'submissionId','4','int'),(112,'username','dbarnes','string'),(113,'reviewAssignmentId','4','int'),(113,'reviewerName','Aisla McCrae','string'),(113,'round','1','int'),(113,'stageId','2','int'),(113,'submissionId','4','int'),(114,'decision','3','int'),(114,'editorId','3','int'),(114,'editorName','Daniel Barnes','string'),(114,'submissionId','4','int'),(115,'reviewAssignmentId','5','int'),(115,'reviewerName','Al Zacharia','string'),(115,'round','1','int'),(115,'stageId','3','int'),(115,'submissionId','4','int'),(116,'decision','2','int'),(116,'editorId','3','int'),(116,'editorName','Daniel Barnes','string'),(116,'submissionId','4','int'),(117,'name','Maria Fritz','string'),(117,'userGroupName','Copyeditor','string'),(117,'username','mfritz','string'),(118,'decision','7','int'),(118,'editorId','3','int'),(118,'editorName','Daniel Barnes','string'),(118,'submissionId','4','int'),(119,'name','Graham Cox','string'),(119,'userGroupName','Layout Editor','string'),(119,'username','gcox','string'),(120,'formatName','PDF','string'),(123,'fileId','18','int'),(123,'fileStage','2','int'),(123,'originalFileName','prologue.pdf','string'),(123,'sourceSubmissionFileId',NULL,'string'),(123,'submissionFileId','29','int'),(123,'submissionId','5','int'),(123,'username','callan','string'),(124,'fileId','18','int'),(124,'fileStage','2','int'),(124,'name','prologue.pdf','string'),(124,'submissionFileId','29','int'),(124,'submissionId','5','int'),(124,'username','callan','string'),(125,'fileId','18','int'),(125,'fileStage','2','int'),(125,'originalFileName','prologue.pdf','string'),(125,'sourceSubmissionFileId',NULL,'string'),(125,'submissionFileId','29','int'),(125,'submissionId','5','int'),(125,'username','callan','string'),(126,'fileId','18','int'),(126,'fileStage','2','int'),(126,'name','prologue.pdf','string'),(126,'originalFileName','prologue.pdf','string'),(126,'sourceSubmissionFileId',NULL,'string'),(126,'submissionFileId','29','int'),(126,'submissionId','5','int'),(126,'username','callan','string'),(127,'fileId','19','int'),(127,'fileStage','2','int'),(127,'originalFileName','chapter1.pdf','string'),(127,'sourceSubmissionFileId',NULL,'string'),(127,'submissionFileId','30','int'),(127,'submissionId','5','int'),(127,'username','callan','string'),(128,'fileId','19','int'),(128,'fileStage','2','int'),(128,'name','chapter1.pdf','string'),(128,'submissionFileId','30','int'),(128,'submissionId','5','int'),(128,'username','callan','string'),(129,'fileId','19','int'),(129,'fileStage','2','int'),(129,'originalFileName','chapter1.pdf','string'),(129,'sourceSubmissionFileId',NULL,'string'),(129,'submissionFileId','30','int'),(129,'submissionId','5','int'),(129,'username','callan','string'),(130,'fileId','19','int'),(130,'fileStage','2','int'),(130,'name','chapter1.pdf','string'),(130,'originalFileName','chapter1.pdf','string'),(130,'sourceSubmissionFileId',NULL,'string'),(130,'submissionFileId','30','int'),(130,'submissionId','5','int'),(130,'username','callan','string'),(131,'fileId','20','int'),(131,'fileStage','2','int'),(131,'originalFileName','chapter2.pdf','string'),(131,'sourceSubmissionFileId',NULL,'string'),(131,'submissionFileId','31','int'),(131,'submissionId','5','int'),(131,'username','callan','string'),(132,'fileId','20','int'),(132,'fileStage','2','int'),(132,'name','chapter2.pdf','string'),(132,'submissionFileId','31','int'),(132,'submissionId','5','int'),(132,'username','callan','string'),(133,'fileId','20','int'),(133,'fileStage','2','int'),(133,'originalFileName','chapter2.pdf','string'),(133,'sourceSubmissionFileId',NULL,'string'),(133,'submissionFileId','31','int'),(133,'submissionId','5','int'),(133,'username','callan','string'),(134,'fileId','20','int'),(134,'fileStage','2','int'),(134,'name','chapter2.pdf','string'),(134,'originalFileName','chapter2.pdf','string'),(134,'sourceSubmissionFileId',NULL,'string'),(134,'submissionFileId','31','int'),(134,'submissionId','5','int'),(134,'username','callan','string'),(135,'fileId','21','int'),(135,'fileStage','2','int'),(135,'originalFileName','chapter3.pdf','string'),(135,'sourceSubmissionFileId',NULL,'string'),(135,'submissionFileId','32','int'),(135,'submissionId','5','int'),(135,'username','callan','string'),(136,'fileId','21','int'),(136,'fileStage','2','int'),(136,'name','chapter3.pdf','string'),(136,'submissionFileId','32','int'),(136,'submissionId','5','int'),(136,'username','callan','string'),(137,'fileId','21','int'),(137,'fileStage','2','int'),(137,'originalFileName','chapter3.pdf','string'),(137,'sourceSubmissionFileId',NULL,'string'),(137,'submissionFileId','32','int'),(137,'submissionId','5','int'),(137,'username','callan','string'),(138,'fileId','21','int'),(138,'fileStage','2','int'),(138,'name','chapter3.pdf','string'),(138,'originalFileName','chapter3.pdf','string'),(138,'sourceSubmissionFileId',NULL,'string'),(138,'submissionFileId','32','int'),(138,'submissionId','5','int'),(138,'username','callan','string'),(139,'fileId','22','int'),(139,'fileStage','2','int'),(139,'originalFileName','chapter4.pdf','string'),(139,'sourceSubmissionFileId',NULL,'string'),(139,'submissionFileId','33','int'),(139,'submissionId','5','int'),(139,'username','callan','string'),(140,'fileId','22','int'),(140,'fileStage','2','int'),(140,'name','chapter4.pdf','string'),(140,'submissionFileId','33','int'),(140,'submissionId','5','int'),(140,'username','callan','string'),(141,'fileId','22','int'),(141,'fileStage','2','int'),(141,'originalFileName','chapter4.pdf','string'),(141,'sourceSubmissionFileId',NULL,'string'),(141,'submissionFileId','33','int'),(141,'submissionId','5','int'),(141,'username','callan','string'),(142,'fileId','22','int'),(142,'fileStage','2','int'),(142,'name','chapter4.pdf','string'),(142,'originalFileName','chapter4.pdf','string'),(142,'sourceSubmissionFileId',NULL,'string'),(142,'submissionFileId','33','int'),(142,'submissionId','5','int'),(142,'username','callan','string'),(143,'fileId','23','int'),(143,'fileStage','2','int'),(143,'originalFileName','epilogue.pdf','string'),(143,'sourceSubmissionFileId',NULL,'string'),(143,'submissionFileId','34','int'),(143,'submissionId','5','int'),(143,'username','callan','string'),(144,'fileId','23','int'),(144,'fileStage','2','int'),(144,'name','epilogue.pdf','string'),(144,'submissionFileId','34','int'),(144,'submissionId','5','int'),(144,'username','callan','string'),(145,'fileId','23','int'),(145,'fileStage','2','int'),(145,'originalFileName','epilogue.pdf','string'),(145,'sourceSubmissionFileId',NULL,'string'),(145,'submissionFileId','34','int'),(145,'submissionId','5','int'),(145,'username','callan','string'),(146,'fileId','23','int'),(146,'fileStage','2','int'),(146,'name','epilogue.pdf','string'),(146,'originalFileName','epilogue.pdf','string'),(146,'sourceSubmissionFileId',NULL,'string'),(146,'submissionFileId','34','int'),(146,'submissionId','5','int'),(146,'username','callan','string'),(148,'decision','1','int'),(148,'editorId','3','int'),(148,'editorName','Daniel Barnes','string'),(148,'submissionId','5','int'),(149,'fileId','22','int'),(149,'fileStage','19','int'),(149,'originalFileName','chapter4.pdf','string'),(149,'sourceSubmissionFileId','33','int'),(149,'submissionFileId','35','int'),(149,'submissionId','5','int'),(149,'username','dbarnes','string'),(150,'fileId','22','int'),(150,'fileStage','19','int'),(150,'name','chapter4.pdf','string'),(150,'submissionFileId','35','int'),(150,'submissionId','5','int'),(150,'username','dbarnes','string'),(151,'fileId','23','int'),(151,'fileStage','19','int'),(151,'originalFileName','epilogue.pdf','string'),(151,'sourceSubmissionFileId','34','int'),(151,'submissionFileId','36','int'),(151,'submissionId','5','int'),(151,'username','dbarnes','string'),(152,'fileId','23','int'),(152,'fileStage','19','int'),(152,'name','epilogue.pdf','string'),(152,'submissionFileId','36','int'),(152,'submissionId','5','int'),(152,'username','dbarnes','string'),(153,'fileId','20','int'),(153,'fileStage','19','int'),(153,'originalFileName','chapter2.pdf','string'),(153,'sourceSubmissionFileId','31','int'),(153,'submissionFileId','37','int'),(153,'submissionId','5','int'),(153,'username','dbarnes','string'),(154,'fileId','20','int'),(154,'fileStage','19','int'),(154,'name','chapter2.pdf','string'),(154,'submissionFileId','37','int'),(154,'submissionId','5','int'),(154,'username','dbarnes','string'),(155,'fileId','21','int'),(155,'fileStage','19','int'),(155,'originalFileName','chapter3.pdf','string'),(155,'sourceSubmissionFileId','32','int'),(155,'submissionFileId','38','int'),(155,'submissionId','5','int'),(155,'username','dbarnes','string'),(156,'fileId','21','int'),(156,'fileStage','19','int'),(156,'name','chapter3.pdf','string'),(156,'submissionFileId','38','int'),(156,'submissionId','5','int'),(156,'username','dbarnes','string'),(157,'fileId','19','int'),(157,'fileStage','19','int'),(157,'originalFileName','chapter1.pdf','string'),(157,'sourceSubmissionFileId','30','int'),(157,'submissionFileId','39','int'),(157,'submissionId','5','int'),(157,'username','dbarnes','string'),(158,'fileId','19','int'),(158,'fileStage','19','int'),(158,'name','chapter1.pdf','string'),(158,'submissionFileId','39','int'),(158,'submissionId','5','int'),(158,'username','dbarnes','string'),(159,'fileId','18','int'),(159,'fileStage','19','int'),(159,'originalFileName','prologue.pdf','string'),(159,'sourceSubmissionFileId','29','int'),(159,'submissionFileId','40','int'),(159,'submissionId','5','int'),(159,'username','dbarnes','string'),(160,'fileId','18','int'),(160,'fileStage','19','int'),(160,'name','prologue.pdf','string'),(160,'submissionFileId','40','int'),(160,'submissionId','5','int'),(160,'username','dbarnes','string'),(161,'reviewAssignmentId','6','int'),(161,'reviewerName','Paul Hudson','string'),(161,'round','1','int'),(161,'stageId','2','int'),(161,'submissionId','5','int'),(162,'decision','3','int'),(162,'editorId','3','int'),(162,'editorName','Daniel Barnes','string'),(162,'submissionId','5','int'),(163,'reviewAssignmentId','7','int'),(163,'reviewerName','Gonzalo Favio','string'),(163,'round','1','int'),(163,'stageId','3','int'),(163,'submissionId','5','int'),(164,'decision','2','int'),(164,'editorId','3','int'),(164,'editorName','Daniel Barnes','string'),(164,'submissionId','5','int'),(165,'name','Sarah Vogt','string'),(165,'userGroupName','Copyeditor','string'),(165,'username','svogt','string'),(166,'decision','7','int'),(166,'editorId','3','int'),(166,'editorName','Daniel Barnes','string'),(166,'submissionId','5','int'),(167,'name','Stephen Hellier','string'),(167,'userGroupName','Layout Editor','string'),(167,'username','shellier','string'),(168,'name','Catherine Turner','string'),(168,'userGroupName','Proofreader','string'),(168,'username','cturner','string'),(169,'formatName','PDF','string'),(170,'fileId','23','int'),(170,'fileStage','10','int'),(170,'originalFileName','epilogue.pdf','string'),(170,'sourceSubmissionFileId','34','int'),(170,'submissionFileId','41','int'),(170,'submissionId','5','int'),(170,'username','dbarnes','string'),(171,'fileId','23','int'),(171,'fileStage','10','int'),(171,'name','epilogue.pdf','string'),(171,'submissionFileId','41','int'),(171,'submissionId','5','int'),(171,'username','dbarnes','string'),(172,'publicationFormatName','PDF','string'),(173,'publicationFormatName','PDF','string'),(174,'fileId','23','int'),(174,'fileStage','10','int'),(174,'originalFileName','epilogue.pdf','string'),(174,'sourceSubmissionFileId','34','int'),(174,'submissionFileId','41','int'),(174,'submissionId','5','int'),(174,'username','dbarnes','string'),(175,'fileId','23','int'),(175,'fileStage','10','int'),(175,'name','epilogue.pdf','string'),(175,'originalFileName','epilogue.pdf','string'),(175,'sourceSubmissionFileId','34','int'),(175,'submissionFileId','41','int'),(175,'submissionId','5','int'),(175,'username','dbarnes','string'),(176,'file','epilogue.pdf','string'),(176,'name','Daniel Barnes','string'),(176,'username','dbarnes','string'),(177,'fileId','23','int'),(177,'fileStage','10','int'),(177,'originalFileName','epilogue.pdf','string'),(177,'sourceSubmissionFileId','34','int'),(177,'submissionFileId','41','int'),(177,'submissionId','5','int'),(177,'username','dbarnes','string'),(178,'fileId','23','int'),(178,'fileStage','10','int'),(178,'name','epilogue.pdf','string'),(178,'originalFileName','epilogue.pdf','string'),(178,'sourceSubmissionFileId','34','int'),(178,'submissionFileId','41','int'),(178,'submissionId','5','int'),(178,'username','dbarnes','string'),(184,'fileId','24','int'),(184,'fileStage','2','int'),(184,'originalFileName','chapter1.pdf','string'),(184,'sourceSubmissionFileId',NULL,'string'),(184,'submissionFileId','42','int'),(184,'submissionId','6','int'),(184,'username','dbernnard','string'),(185,'fileId','24','int'),(185,'fileStage','2','int'),(185,'name','chapter1.pdf','string'),(185,'submissionFileId','42','int'),(185,'submissionId','6','int'),(185,'username','dbernnard','string'),(186,'fileId','24','int'),(186,'fileStage','2','int'),(186,'originalFileName','chapter1.pdf','string'),(186,'sourceSubmissionFileId',NULL,'string'),(186,'submissionFileId','42','int'),(186,'submissionId','6','int'),(186,'username','dbernnard','string'),(187,'fileId','24','int'),(187,'fileStage','2','int'),(187,'name','chapter1.pdf','string'),(187,'originalFileName','chapter1.pdf','string'),(187,'sourceSubmissionFileId',NULL,'string'),(187,'submissionFileId','42','int'),(187,'submissionId','6','int'),(187,'username','dbernnard','string'),(188,'fileId','25','int'),(188,'fileStage','2','int'),(188,'originalFileName','chapter2.pdf','string'),(188,'sourceSubmissionFileId',NULL,'string'),(188,'submissionFileId','43','int'),(188,'submissionId','6','int'),(188,'username','dbernnard','string'),(189,'fileId','25','int'),(189,'fileStage','2','int'),(189,'name','chapter2.pdf','string'),(189,'submissionFileId','43','int'),(189,'submissionId','6','int'),(189,'username','dbernnard','string'),(190,'fileId','25','int'),(190,'fileStage','2','int'),(190,'originalFileName','chapter2.pdf','string'),(190,'sourceSubmissionFileId',NULL,'string'),(190,'submissionFileId','43','int'),(190,'submissionId','6','int'),(190,'username','dbernnard','string'),(191,'fileId','25','int'),(191,'fileStage','2','int'),(191,'name','chapter2.pdf','string'),(191,'originalFileName','chapter2.pdf','string'),(191,'sourceSubmissionFileId',NULL,'string'),(191,'submissionFileId','43','int'),(191,'submissionId','6','int'),(191,'username','dbernnard','string'),(192,'fileId','26','int'),(192,'fileStage','2','int'),(192,'originalFileName','chapter3.pdf','string'),(192,'sourceSubmissionFileId',NULL,'string'),(192,'submissionFileId','44','int'),(192,'submissionId','6','int'),(192,'username','dbernnard','string'),(193,'fileId','26','int'),(193,'fileStage','2','int'),(193,'name','chapter3.pdf','string'),(193,'submissionFileId','44','int'),(193,'submissionId','6','int'),(193,'username','dbernnard','string'),(194,'fileId','26','int'),(194,'fileStage','2','int'),(194,'originalFileName','chapter3.pdf','string'),(194,'sourceSubmissionFileId',NULL,'string'),(194,'submissionFileId','44','int'),(194,'submissionId','6','int'),(194,'username','dbernnard','string'),(195,'fileId','26','int'),(195,'fileStage','2','int'),(195,'name','chapter3.pdf','string'),(195,'originalFileName','chapter3.pdf','string'),(195,'sourceSubmissionFileId',NULL,'string'),(195,'submissionFileId','44','int'),(195,'submissionId','6','int'),(195,'username','dbernnard','string'),(196,'fileId','27','int'),(196,'fileStage','2','int'),(196,'originalFileName','chapter4.pdf','string'),(196,'sourceSubmissionFileId',NULL,'string'),(196,'submissionFileId','45','int'),(196,'submissionId','6','int'),(196,'username','dbernnard','string'),(197,'fileId','27','int'),(197,'fileStage','2','int'),(197,'name','chapter4.pdf','string'),(197,'submissionFileId','45','int'),(197,'submissionId','6','int'),(197,'username','dbernnard','string'),(198,'fileId','27','int'),(198,'fileStage','2','int'),(198,'originalFileName','chapter4.pdf','string'),(198,'sourceSubmissionFileId',NULL,'string'),(198,'submissionFileId','45','int'),(198,'submissionId','6','int'),(198,'username','dbernnard','string'),(199,'fileId','27','int'),(199,'fileStage','2','int'),(199,'name','chapter4.pdf','string'),(199,'originalFileName','chapter4.pdf','string'),(199,'sourceSubmissionFileId',NULL,'string'),(199,'submissionFileId','45','int'),(199,'submissionId','6','int'),(199,'username','dbernnard','string'),(201,'decision','1','int'),(201,'editorId','3','int'),(201,'editorName','Daniel Barnes','string'),(201,'submissionId','6','int'),(202,'fileId','26','int'),(202,'fileStage','19','int'),(202,'originalFileName','chapter3.pdf','string'),(202,'sourceSubmissionFileId','44','int'),(202,'submissionFileId','46','int'),(202,'submissionId','6','int'),(202,'username','dbarnes','string'),(203,'fileId','26','int'),(203,'fileStage','19','int'),(203,'name','chapter3.pdf','string'),(203,'submissionFileId','46','int'),(203,'submissionId','6','int'),(203,'username','dbarnes','string'),(204,'fileId','27','int'),(204,'fileStage','19','int'),(204,'originalFileName','chapter4.pdf','string'),(204,'sourceSubmissionFileId','45','int'),(204,'submissionFileId','47','int'),(204,'submissionId','6','int'),(204,'username','dbarnes','string'),(205,'fileId','27','int'),(205,'fileStage','19','int'),(205,'name','chapter4.pdf','string'),(205,'submissionFileId','47','int'),(205,'submissionId','6','int'),(205,'username','dbarnes','string'),(206,'fileId','25','int'),(206,'fileStage','19','int'),(206,'originalFileName','chapter2.pdf','string'),(206,'sourceSubmissionFileId','43','int'),(206,'submissionFileId','48','int'),(206,'submissionId','6','int'),(206,'username','dbarnes','string'),(207,'fileId','25','int'),(207,'fileStage','19','int'),(207,'name','chapter2.pdf','string'),(207,'submissionFileId','48','int'),(207,'submissionId','6','int'),(207,'username','dbarnes','string'),(208,'fileId','24','int'),(208,'fileStage','19','int'),(208,'originalFileName','chapter1.pdf','string'),(208,'sourceSubmissionFileId','42','int'),(208,'submissionFileId','49','int'),(208,'submissionId','6','int'),(208,'username','dbarnes','string'),(209,'fileId','24','int'),(209,'fileStage','19','int'),(209,'name','chapter1.pdf','string'),(209,'submissionFileId','49','int'),(209,'submissionId','6','int'),(209,'username','dbarnes','string'),(210,'name','Daniel Barnes','string'),(210,'userGroupName','Press editor','string'),(210,'username','dbarnes','string'),(211,'name','David Buskins','string'),(211,'userGroupName','Series editor','string'),(211,'username','dbuskins','string'),(212,'name','Minoti Inoue','string'),(212,'userGroupName','Series editor','string'),(212,'username','minoue','string'),(213,'decision','23','int'),(213,'editorId','6','int'),(213,'editorName','Minoti Inoue','string'),(213,'submissionId','6','int'),(216,'fileId','28','int'),(216,'fileStage','2','int'),(216,'originalFileName','intro.pdf','string'),(216,'sourceSubmissionFileId',NULL,'string'),(216,'submissionFileId','50','int'),(216,'submissionId','7','int'),(216,'username','dkennepohl','string'),(217,'fileId','28','int'),(217,'fileStage','2','int'),(217,'name','intro.pdf','string'),(217,'submissionFileId','50','int'),(217,'submissionId','7','int'),(217,'username','dkennepohl','string'),(218,'fileId','28','int'),(218,'fileStage','2','int'),(218,'originalFileName','intro.pdf','string'),(218,'sourceSubmissionFileId',NULL,'string'),(218,'submissionFileId','50','int'),(218,'submissionId','7','int'),(218,'username','dkennepohl','string'),(219,'fileId','28','int'),(219,'fileStage','2','int'),(219,'name','intro.pdf','string'),(219,'originalFileName','intro.pdf','string'),(219,'sourceSubmissionFileId',NULL,'string'),(219,'submissionFileId','50','int'),(219,'submissionId','7','int'),(219,'username','dkennepohl','string'),(220,'fileId','29','int'),(220,'fileStage','2','int'),(220,'originalFileName','chapter1.pdf','string'),(220,'sourceSubmissionFileId',NULL,'string'),(220,'submissionFileId','51','int'),(220,'submissionId','7','int'),(220,'username','dkennepohl','string'),(221,'fileId','29','int'),(221,'fileStage','2','int'),(221,'name','chapter1.pdf','string'),(221,'submissionFileId','51','int'),(221,'submissionId','7','int'),(221,'username','dkennepohl','string'),(222,'fileId','29','int'),(222,'fileStage','2','int'),(222,'originalFileName','chapter1.pdf','string'),(222,'sourceSubmissionFileId',NULL,'string'),(222,'submissionFileId','51','int'),(222,'submissionId','7','int'),(222,'username','dkennepohl','string'),(223,'fileId','29','int'),(223,'fileStage','2','int'),(223,'name','chapter1.pdf','string'),(223,'originalFileName','chapter1.pdf','string'),(223,'sourceSubmissionFileId',NULL,'string'),(223,'submissionFileId','51','int'),(223,'submissionId','7','int'),(223,'username','dkennepohl','string'),(224,'fileId','30','int'),(224,'fileStage','2','int'),(224,'originalFileName','chapter2.pdf','string'),(224,'sourceSubmissionFileId',NULL,'string'),(224,'submissionFileId','52','int'),(224,'submissionId','7','int'),(224,'username','dkennepohl','string'),(225,'fileId','30','int'),(225,'fileStage','2','int'),(225,'name','chapter2.pdf','string'),(225,'submissionFileId','52','int'),(225,'submissionId','7','int'),(225,'username','dkennepohl','string'),(226,'fileId','30','int'),(226,'fileStage','2','int'),(226,'originalFileName','chapter2.pdf','string'),(226,'sourceSubmissionFileId',NULL,'string'),(226,'submissionFileId','52','int'),(226,'submissionId','7','int'),(226,'username','dkennepohl','string'),(227,'fileId','30','int'),(227,'fileStage','2','int'),(227,'name','chapter2.pdf','string'),(227,'originalFileName','chapter2.pdf','string'),(227,'sourceSubmissionFileId',NULL,'string'),(227,'submissionFileId','52','int'),(227,'submissionId','7','int'),(227,'username','dkennepohl','string'),(228,'fileId','31','int'),(228,'fileStage','2','int'),(228,'originalFileName','chapter3.pdf','string'),(228,'sourceSubmissionFileId',NULL,'string'),(228,'submissionFileId','53','int'),(228,'submissionId','7','int'),(228,'username','dkennepohl','string'),(229,'fileId','31','int'),(229,'fileStage','2','int'),(229,'name','chapter3.pdf','string'),(229,'submissionFileId','53','int'),(229,'submissionId','7','int'),(229,'username','dkennepohl','string'),(230,'fileId','31','int'),(230,'fileStage','2','int'),(230,'originalFileName','chapter3.pdf','string'),(230,'sourceSubmissionFileId',NULL,'string'),(230,'submissionFileId','53','int'),(230,'submissionId','7','int'),(230,'username','dkennepohl','string'),(231,'fileId','31','int'),(231,'fileStage','2','int'),(231,'name','chapter3.pdf','string'),(231,'originalFileName','chapter3.pdf','string'),(231,'sourceSubmissionFileId',NULL,'string'),(231,'submissionFileId','53','int'),(231,'submissionId','7','int'),(231,'username','dkennepohl','string'),(232,'fileId','32','int'),(232,'fileStage','2','int'),(232,'originalFileName','chapter4.pdf','string'),(232,'sourceSubmissionFileId',NULL,'string'),(232,'submissionFileId','54','int'),(232,'submissionId','7','int'),(232,'username','dkennepohl','string'),(233,'fileId','32','int'),(233,'fileStage','2','int'),(233,'name','chapter4.pdf','string'),(233,'submissionFileId','54','int'),(233,'submissionId','7','int'),(233,'username','dkennepohl','string'),(234,'fileId','32','int'),(234,'fileStage','2','int'),(234,'originalFileName','chapter4.pdf','string'),(234,'sourceSubmissionFileId',NULL,'string'),(234,'submissionFileId','54','int'),(234,'submissionId','7','int'),(234,'username','dkennepohl','string'),(235,'fileId','32','int'),(235,'fileStage','2','int'),(235,'name','chapter4.pdf','string'),(235,'originalFileName','chapter4.pdf','string'),(235,'sourceSubmissionFileId',NULL,'string'),(235,'submissionFileId','54','int'),(235,'submissionId','7','int'),(235,'username','dkennepohl','string'),(237,'decision','18','int'),(237,'editorId','3','int'),(237,'editorName','Daniel Barnes','string'),(237,'submissionId','7','int'),(238,'fileId','32','int'),(238,'fileStage','4','int'),(238,'originalFileName','chapter4.pdf','string'),(238,'sourceSubmissionFileId','54','int'),(238,'submissionFileId','55','int'),(238,'submissionId','7','int'),(238,'username','dbarnes','string'),(239,'fileId','32','int'),(239,'fileStage','4','int'),(239,'name','chapter4.pdf','string'),(239,'submissionFileId','55','int'),(239,'submissionId','7','int'),(239,'username','dbarnes','string'),(240,'fileId','30','int'),(240,'fileStage','4','int'),(240,'originalFileName','chapter2.pdf','string'),(240,'sourceSubmissionFileId','52','int'),(240,'submissionFileId','56','int'),(240,'submissionId','7','int'),(240,'username','dbarnes','string'),(241,'fileId','30','int'),(241,'fileStage','4','int'),(241,'name','chapter2.pdf','string'),(241,'submissionFileId','56','int'),(241,'submissionId','7','int'),(241,'username','dbarnes','string'),(242,'fileId','29','int'),(242,'fileStage','4','int'),(242,'originalFileName','chapter1.pdf','string'),(242,'sourceSubmissionFileId','51','int'),(242,'submissionFileId','57','int'),(242,'submissionId','7','int'),(242,'username','dbarnes','string'),(243,'fileId','29','int'),(243,'fileStage','4','int'),(243,'name','chapter1.pdf','string'),(243,'submissionFileId','57','int'),(243,'submissionId','7','int'),(243,'username','dbarnes','string'),(244,'fileId','31','int'),(244,'fileStage','4','int'),(244,'originalFileName','chapter3.pdf','string'),(244,'sourceSubmissionFileId','53','int'),(244,'submissionFileId','58','int'),(244,'submissionId','7','int'),(244,'username','dbarnes','string'),(245,'fileId','31','int'),(245,'fileStage','4','int'),(245,'name','chapter3.pdf','string'),(245,'submissionFileId','58','int'),(245,'submissionId','7','int'),(245,'username','dbarnes','string'),(246,'fileId','28','int'),(246,'fileStage','4','int'),(246,'originalFileName','intro.pdf','string'),(246,'sourceSubmissionFileId','50','int'),(246,'submissionFileId','59','int'),(246,'submissionId','7','int'),(246,'username','dbarnes','string'),(247,'fileId','28','int'),(247,'fileStage','4','int'),(247,'name','intro.pdf','string'),(247,'submissionFileId','59','int'),(247,'submissionId','7','int'),(247,'username','dbarnes','string'),(248,'reviewAssignmentId','8','int'),(248,'reviewerName','Adela Gallego','string'),(248,'round','1','int'),(248,'stageId','3','int'),(248,'submissionId','7','int'),(249,'decision','2','int'),(249,'editorId','3','int'),(249,'editorName','Daniel Barnes','string'),(249,'submissionId','7','int'),(250,'name','Maria Fritz','string'),(250,'userGroupName','Copyeditor','string'),(250,'username','mfritz','string'),(252,'fileId','33','int'),(252,'fileStage','2','int'),(252,'originalFileName','note.pdf','string'),(252,'sourceSubmissionFileId',NULL,'string'),(252,'submissionFileId','60','int'),(252,'submissionId','8','int'),(252,'username','dbarnes','string'),(253,'fileId','33','int'),(253,'fileStage','2','int'),(253,'name','note.pdf','string'),(253,'submissionFileId','60','int'),(253,'submissionId','8','int'),(253,'username','dbarnes','string'),(254,'fileId','33','int'),(254,'fileStage','2','int'),(254,'originalFileName','note.pdf','string'),(254,'sourceSubmissionFileId',NULL,'string'),(254,'submissionFileId','60','int'),(254,'submissionId','8','int'),(254,'username','dbarnes','string'),(255,'fileId','33','int'),(255,'fileStage','2','int'),(255,'name','note.pdf','string'),(255,'originalFileName','note.pdf','string'),(255,'sourceSubmissionFileId',NULL,'string'),(255,'submissionFileId','60','int'),(255,'submissionId','8','int'),(255,'username','dbarnes','string'),(259,'fileId','34','int'),(259,'fileStage','2','int'),(259,'originalFileName','chapter1.pdf','string'),(259,'sourceSubmissionFileId',NULL,'string'),(259,'submissionFileId','61','int'),(259,'submissionId','9','int'),(259,'username','fperini','string'),(260,'fileId','34','int'),(260,'fileStage','2','int'),(260,'name','chapter1.pdf','string'),(260,'submissionFileId','61','int'),(260,'submissionId','9','int'),(260,'username','fperini','string'),(261,'fileId','34','int'),(261,'fileStage','2','int'),(261,'originalFileName','chapter1.pdf','string'),(261,'sourceSubmissionFileId',NULL,'string'),(261,'submissionFileId','61','int'),(261,'submissionId','9','int'),(261,'username','fperini','string'),(262,'fileId','34','int'),(262,'fileStage','2','int'),(262,'name','chapter1.pdf','string'),(262,'originalFileName','chapter1.pdf','string'),(262,'sourceSubmissionFileId',NULL,'string'),(262,'submissionFileId','61','int'),(262,'submissionId','9','int'),(262,'username','fperini','string'),(263,'fileId','35','int'),(263,'fileStage','2','int'),(263,'originalFileName','chapter2.pdf','string'),(263,'sourceSubmissionFileId',NULL,'string'),(263,'submissionFileId','62','int'),(263,'submissionId','9','int'),(263,'username','fperini','string'),(264,'fileId','35','int'),(264,'fileStage','2','int'),(264,'name','chapter2.pdf','string'),(264,'submissionFileId','62','int'),(264,'submissionId','9','int'),(264,'username','fperini','string'),(265,'fileId','35','int'),(265,'fileStage','2','int'),(265,'originalFileName','chapter2.pdf','string'),(265,'sourceSubmissionFileId',NULL,'string'),(265,'submissionFileId','62','int'),(265,'submissionId','9','int'),(265,'username','fperini','string'),(266,'fileId','35','int'),(266,'fileStage','2','int'),(266,'name','chapter2.pdf','string'),(266,'originalFileName','chapter2.pdf','string'),(266,'sourceSubmissionFileId',NULL,'string'),(266,'submissionFileId','62','int'),(266,'submissionId','9','int'),(266,'username','fperini','string'),(267,'fileId','36','int'),(267,'fileStage','2','int'),(267,'originalFileName','chapter3.pdf','string'),(267,'sourceSubmissionFileId',NULL,'string'),(267,'submissionFileId','63','int'),(267,'submissionId','9','int'),(267,'username','fperini','string'),(268,'fileId','36','int'),(268,'fileStage','2','int'),(268,'name','chapter3.pdf','string'),(268,'submissionFileId','63','int'),(268,'submissionId','9','int'),(268,'username','fperini','string'),(269,'fileId','36','int'),(269,'fileStage','2','int'),(269,'originalFileName','chapter3.pdf','string'),(269,'sourceSubmissionFileId',NULL,'string'),(269,'submissionFileId','63','int'),(269,'submissionId','9','int'),(269,'username','fperini','string'),(270,'fileId','36','int'),(270,'fileStage','2','int'),(270,'name','chapter3.pdf','string'),(270,'originalFileName','chapter3.pdf','string'),(270,'sourceSubmissionFileId',NULL,'string'),(270,'submissionFileId','63','int'),(270,'submissionId','9','int'),(270,'username','fperini','string'),(271,'fileId','37','int'),(271,'fileStage','2','int'),(271,'originalFileName','chapter4.pdf','string'),(271,'sourceSubmissionFileId',NULL,'string'),(271,'submissionFileId','64','int'),(271,'submissionId','9','int'),(271,'username','fperini','string'),(272,'fileId','37','int'),(272,'fileStage','2','int'),(272,'name','chapter4.pdf','string'),(272,'submissionFileId','64','int'),(272,'submissionId','9','int'),(272,'username','fperini','string'),(273,'fileId','37','int'),(273,'fileStage','2','int'),(273,'originalFileName','chapter4.pdf','string'),(273,'sourceSubmissionFileId',NULL,'string'),(273,'submissionFileId','64','int'),(273,'submissionId','9','int'),(273,'username','fperini','string'),(274,'fileId','37','int'),(274,'fileStage','2','int'),(274,'name','chapter4.pdf','string'),(274,'originalFileName','chapter4.pdf','string'),(274,'sourceSubmissionFileId',NULL,'string'),(274,'submissionFileId','64','int'),(274,'submissionId','9','int'),(274,'username','fperini','string'),(275,'fileId','38','int'),(275,'fileStage','2','int'),(275,'originalFileName','chapter5.pdf','string'),(275,'sourceSubmissionFileId',NULL,'string'),(275,'submissionFileId','65','int'),(275,'submissionId','9','int'),(275,'username','fperini','string'),(276,'fileId','38','int'),(276,'fileStage','2','int'),(276,'name','chapter5.pdf','string'),(276,'submissionFileId','65','int'),(276,'submissionId','9','int'),(276,'username','fperini','string'),(277,'fileId','38','int'),(277,'fileStage','2','int'),(277,'originalFileName','chapter5.pdf','string'),(277,'sourceSubmissionFileId',NULL,'string'),(277,'submissionFileId','65','int'),(277,'submissionId','9','int'),(277,'username','fperini','string'),(278,'fileId','38','int'),(278,'fileStage','2','int'),(278,'name','chapter5.pdf','string'),(278,'originalFileName','chapter5.pdf','string'),(278,'sourceSubmissionFileId',NULL,'string'),(278,'submissionFileId','65','int'),(278,'submissionId','9','int'),(278,'username','fperini','string'),(280,'decision','1','int'),(280,'editorId','3','int'),(280,'editorName','Daniel Barnes','string'),(280,'submissionId','9','int'),(281,'fileId','38','int'),(281,'fileStage','19','int'),(281,'originalFileName','chapter5.pdf','string'),(281,'sourceSubmissionFileId','65','int'),(281,'submissionFileId','66','int'),(281,'submissionId','9','int'),(281,'username','dbarnes','string'),(282,'fileId','38','int'),(282,'fileStage','19','int'),(282,'name','chapter5.pdf','string'),(282,'submissionFileId','66','int'),(282,'submissionId','9','int'),(282,'username','dbarnes','string'),(283,'fileId','37','int'),(283,'fileStage','19','int'),(283,'originalFileName','chapter4.pdf','string'),(283,'sourceSubmissionFileId','64','int'),(283,'submissionFileId','67','int'),(283,'submissionId','9','int'),(283,'username','dbarnes','string'),(284,'fileId','37','int'),(284,'fileStage','19','int'),(284,'name','chapter4.pdf','string'),(284,'submissionFileId','67','int'),(284,'submissionId','9','int'),(284,'username','dbarnes','string'),(285,'fileId','36','int'),(285,'fileStage','19','int'),(285,'originalFileName','chapter3.pdf','string'),(285,'sourceSubmissionFileId','63','int'),(285,'submissionFileId','68','int'),(285,'submissionId','9','int'),(285,'username','dbarnes','string'),(286,'fileId','36','int'),(286,'fileStage','19','int'),(286,'name','chapter3.pdf','string'),(286,'submissionFileId','68','int'),(286,'submissionId','9','int'),(286,'username','dbarnes','string'),(287,'fileId','35','int'),(287,'fileStage','19','int'),(287,'originalFileName','chapter2.pdf','string'),(287,'sourceSubmissionFileId','62','int'),(287,'submissionFileId','69','int'),(287,'submissionId','9','int'),(287,'username','dbarnes','string'),(288,'fileId','35','int'),(288,'fileStage','19','int'),(288,'name','chapter2.pdf','string'),(288,'submissionFileId','69','int'),(288,'submissionId','9','int'),(288,'username','dbarnes','string'),(289,'fileId','34','int'),(289,'fileStage','19','int'),(289,'originalFileName','chapter1.pdf','string'),(289,'sourceSubmissionFileId','61','int'),(289,'submissionFileId','70','int'),(289,'submissionId','9','int'),(289,'username','dbarnes','string'),(290,'fileId','34','int'),(290,'fileStage','19','int'),(290,'name','chapter1.pdf','string'),(290,'submissionFileId','70','int'),(290,'submissionId','9','int'),(290,'username','dbarnes','string'),(293,'fileId','39','int'),(293,'fileStage','2','int'),(293,'originalFileName','intro.pdf','string'),(293,'sourceSubmissionFileId',NULL,'string'),(293,'submissionFileId','71','int'),(293,'submissionId','10','int'),(293,'username','jbrower','string'),(294,'fileId','39','int'),(294,'fileStage','2','int'),(294,'name','intro.pdf','string'),(294,'submissionFileId','71','int'),(294,'submissionId','10','int'),(294,'username','jbrower','string'),(295,'fileId','39','int'),(295,'fileStage','2','int'),(295,'originalFileName','intro.pdf','string'),(295,'sourceSubmissionFileId',NULL,'string'),(295,'submissionFileId','71','int'),(295,'submissionId','10','int'),(295,'username','jbrower','string'),(296,'fileId','39','int'),(296,'fileStage','2','int'),(296,'name','intro.pdf','string'),(296,'originalFileName','intro.pdf','string'),(296,'sourceSubmissionFileId',NULL,'string'),(296,'submissionFileId','71','int'),(296,'submissionId','10','int'),(296,'username','jbrower','string'),(297,'fileId','40','int'),(297,'fileStage','2','int'),(297,'originalFileName','chapter1.pdf','string'),(297,'sourceSubmissionFileId',NULL,'string'),(297,'submissionFileId','72','int'),(297,'submissionId','10','int'),(297,'username','jbrower','string'),(298,'fileId','40','int'),(298,'fileStage','2','int'),(298,'name','chapter1.pdf','string'),(298,'submissionFileId','72','int'),(298,'submissionId','10','int'),(298,'username','jbrower','string'),(299,'fileId','40','int'),(299,'fileStage','2','int'),(299,'originalFileName','chapter1.pdf','string'),(299,'sourceSubmissionFileId',NULL,'string'),(299,'submissionFileId','72','int'),(299,'submissionId','10','int'),(299,'username','jbrower','string'),(300,'fileId','40','int'),(300,'fileStage','2','int'),(300,'name','chapter1.pdf','string'),(300,'originalFileName','chapter1.pdf','string'),(300,'sourceSubmissionFileId',NULL,'string'),(300,'submissionFileId','72','int'),(300,'submissionId','10','int'),(300,'username','jbrower','string'),(301,'fileId','41','int'),(301,'fileStage','2','int'),(301,'originalFileName','chapter2.pdf','string'),(301,'sourceSubmissionFileId',NULL,'string'),(301,'submissionFileId','73','int'),(301,'submissionId','10','int'),(301,'username','jbrower','string'),(302,'fileId','41','int'),(302,'fileStage','2','int'),(302,'name','chapter2.pdf','string'),(302,'submissionFileId','73','int'),(302,'submissionId','10','int'),(302,'username','jbrower','string'),(303,'fileId','41','int'),(303,'fileStage','2','int'),(303,'originalFileName','chapter2.pdf','string'),(303,'sourceSubmissionFileId',NULL,'string'),(303,'submissionFileId','73','int'),(303,'submissionId','10','int'),(303,'username','jbrower','string'),(304,'fileId','41','int'),(304,'fileStage','2','int'),(304,'name','chapter2.pdf','string'),(304,'originalFileName','chapter2.pdf','string'),(304,'sourceSubmissionFileId',NULL,'string'),(304,'submissionFileId','73','int'),(304,'submissionId','10','int'),(304,'username','jbrower','string'),(305,'fileId','42','int'),(305,'fileStage','2','int'),(305,'originalFileName','chapter3.pdf','string'),(305,'sourceSubmissionFileId',NULL,'string'),(305,'submissionFileId','74','int'),(305,'submissionId','10','int'),(305,'username','jbrower','string'),(306,'fileId','42','int'),(306,'fileStage','2','int'),(306,'name','chapter3.pdf','string'),(306,'submissionFileId','74','int'),(306,'submissionId','10','int'),(306,'username','jbrower','string'),(307,'fileId','42','int'),(307,'fileStage','2','int'),(307,'originalFileName','chapter3.pdf','string'),(307,'sourceSubmissionFileId',NULL,'string'),(307,'submissionFileId','74','int'),(307,'submissionId','10','int'),(307,'username','jbrower','string'),(308,'fileId','42','int'),(308,'fileStage','2','int'),(308,'name','chapter3.pdf','string'),(308,'originalFileName','chapter3.pdf','string'),(308,'sourceSubmissionFileId',NULL,'string'),(308,'submissionFileId','74','int'),(308,'submissionId','10','int'),(308,'username','jbrower','string'),(309,'fileId','43','int'),(309,'fileStage','2','int'),(309,'originalFileName','chapter4.pdf','string'),(309,'sourceSubmissionFileId',NULL,'string'),(309,'submissionFileId','75','int'),(309,'submissionId','10','int'),(309,'username','jbrower','string'),(310,'fileId','43','int'),(310,'fileStage','2','int'),(310,'name','chapter4.pdf','string'),(310,'submissionFileId','75','int'),(310,'submissionId','10','int'),(310,'username','jbrower','string'),(311,'fileId','43','int'),(311,'fileStage','2','int'),(311,'originalFileName','chapter4.pdf','string'),(311,'sourceSubmissionFileId',NULL,'string'),(311,'submissionFileId','75','int'),(311,'submissionId','10','int'),(311,'username','jbrower','string'),(312,'fileId','43','int'),(312,'fileStage','2','int'),(312,'name','chapter4.pdf','string'),(312,'originalFileName','chapter4.pdf','string'),(312,'sourceSubmissionFileId',NULL,'string'),(312,'submissionFileId','75','int'),(312,'submissionId','10','int'),(312,'username','jbrower','string'),(313,'fileId','44','int'),(313,'fileStage','2','int'),(313,'originalFileName','chapter5.pdf','string'),(313,'sourceSubmissionFileId',NULL,'string'),(313,'submissionFileId','76','int'),(313,'submissionId','10','int'),(313,'username','jbrower','string'),(314,'fileId','44','int'),(314,'fileStage','2','int'),(314,'name','chapter5.pdf','string'),(314,'submissionFileId','76','int'),(314,'submissionId','10','int'),(314,'username','jbrower','string'),(315,'fileId','44','int'),(315,'fileStage','2','int'),(315,'originalFileName','chapter5.pdf','string'),(315,'sourceSubmissionFileId',NULL,'string'),(315,'submissionFileId','76','int'),(315,'submissionId','10','int'),(315,'username','jbrower','string'),(316,'fileId','44','int'),(316,'fileStage','2','int'),(316,'name','chapter5.pdf','string'),(316,'originalFileName','chapter5.pdf','string'),(316,'sourceSubmissionFileId',NULL,'string'),(316,'submissionFileId','76','int'),(316,'submissionId','10','int'),(316,'username','jbrower','string'),(317,'fileId','45','int'),(317,'fileStage','2','int'),(317,'originalFileName','conclusion.pdf','string'),(317,'sourceSubmissionFileId',NULL,'string'),(317,'submissionFileId','77','int'),(317,'submissionId','10','int'),(317,'username','jbrower','string'),(318,'fileId','45','int'),(318,'fileStage','2','int'),(318,'name','conclusion.pdf','string'),(318,'submissionFileId','77','int'),(318,'submissionId','10','int'),(318,'username','jbrower','string'),(319,'fileId','45','int'),(319,'fileStage','2','int'),(319,'originalFileName','conclusion.pdf','string'),(319,'sourceSubmissionFileId',NULL,'string'),(319,'submissionFileId','77','int'),(319,'submissionId','10','int'),(319,'username','jbrower','string'),(320,'fileId','45','int'),(320,'fileStage','2','int'),(320,'name','conclusion.pdf','string'),(320,'originalFileName','conclusion.pdf','string'),(320,'sourceSubmissionFileId',NULL,'string'),(320,'submissionFileId','77','int'),(320,'submissionId','10','int'),(320,'username','jbrower','string'),(321,'fileId','46','int'),(321,'fileStage','2','int'),(321,'originalFileName','bibliography.pdf','string'),(321,'sourceSubmissionFileId',NULL,'string'),(321,'submissionFileId','78','int'),(321,'submissionId','10','int'),(321,'username','jbrower','string'),(322,'fileId','46','int'),(322,'fileStage','2','int'),(322,'name','bibliography.pdf','string'),(322,'submissionFileId','78','int'),(322,'submissionId','10','int'),(322,'username','jbrower','string'),(323,'fileId','46','int'),(323,'fileStage','2','int'),(323,'originalFileName','bibliography.pdf','string'),(323,'sourceSubmissionFileId',NULL,'string'),(323,'submissionFileId','78','int'),(323,'submissionId','10','int'),(323,'username','jbrower','string'),(324,'fileId','46','int'),(324,'fileStage','2','int'),(324,'name','bibliography.pdf','string'),(324,'originalFileName','bibliography.pdf','string'),(324,'sourceSubmissionFileId',NULL,'string'),(324,'submissionFileId','78','int'),(324,'submissionId','10','int'),(324,'username','jbrower','string'),(325,'fileId','47','int'),(325,'fileStage','2','int'),(325,'originalFileName','index.pdf','string'),(325,'sourceSubmissionFileId',NULL,'string'),(325,'submissionFileId','79','int'),(325,'submissionId','10','int'),(325,'username','jbrower','string'),(326,'fileId','47','int'),(326,'fileStage','2','int'),(326,'name','index.pdf','string'),(326,'submissionFileId','79','int'),(326,'submissionId','10','int'),(326,'username','jbrower','string'),(327,'fileId','47','int'),(327,'fileStage','2','int'),(327,'originalFileName','index.pdf','string'),(327,'sourceSubmissionFileId',NULL,'string'),(327,'submissionFileId','79','int'),(327,'submissionId','10','int'),(327,'username','jbrower','string'),(328,'fileId','47','int'),(328,'fileStage','2','int'),(328,'name','index.pdf','string'),(328,'originalFileName','index.pdf','string'),(328,'sourceSubmissionFileId',NULL,'string'),(328,'submissionFileId','79','int'),(328,'submissionId','10','int'),(328,'username','jbrower','string'),(332,'fileId','48','int'),(332,'fileStage','2','int'),(332,'originalFileName','intro.pdf','string'),(332,'sourceSubmissionFileId',NULL,'string'),(332,'submissionFileId','80','int'),(332,'submissionId','11','int'),(332,'username','jlockehart','string'),(333,'fileId','48','int'),(333,'fileStage','2','int'),(333,'name','intro.pdf','string'),(333,'submissionFileId','80','int'),(333,'submissionId','11','int'),(333,'username','jlockehart','string'),(334,'fileId','48','int'),(334,'fileStage','2','int'),(334,'originalFileName','intro.pdf','string'),(334,'sourceSubmissionFileId',NULL,'string'),(334,'submissionFileId','80','int'),(334,'submissionId','11','int'),(334,'username','jlockehart','string'),(335,'fileId','48','int'),(335,'fileStage','2','int'),(335,'name','intro.pdf','string'),(335,'originalFileName','intro.pdf','string'),(335,'sourceSubmissionFileId',NULL,'string'),(335,'submissionFileId','80','int'),(335,'submissionId','11','int'),(335,'username','jlockehart','string'),(336,'fileId','49','int'),(336,'fileStage','2','int'),(336,'originalFileName','poems.pdf','string'),(336,'sourceSubmissionFileId',NULL,'string'),(336,'submissionFileId','81','int'),(336,'submissionId','11','int'),(336,'username','jlockehart','string'),(337,'fileId','49','int'),(337,'fileStage','2','int'),(337,'name','poems.pdf','string'),(337,'submissionFileId','81','int'),(337,'submissionId','11','int'),(337,'username','jlockehart','string'),(338,'fileId','49','int'),(338,'fileStage','2','int'),(338,'originalFileName','poems.pdf','string'),(338,'sourceSubmissionFileId',NULL,'string'),(338,'submissionFileId','81','int'),(338,'submissionId','11','int'),(338,'username','jlockehart','string'),(339,'fileId','49','int'),(339,'fileStage','2','int'),(339,'name','poems.pdf','string'),(339,'originalFileName','poems.pdf','string'),(339,'sourceSubmissionFileId',NULL,'string'),(339,'submissionFileId','81','int'),(339,'submissionId','11','int'),(339,'username','jlockehart','string'),(341,'decision','1','int'),(341,'editorId','3','int'),(341,'editorName','Daniel Barnes','string'),(341,'submissionId','11','int'),(342,'fileId','49','int'),(342,'fileStage','19','int'),(342,'originalFileName','poems.pdf','string'),(342,'sourceSubmissionFileId','81','int'),(342,'submissionFileId','82','int'),(342,'submissionId','11','int'),(342,'username','dbarnes','string'),(343,'fileId','49','int'),(343,'fileStage','19','int'),(343,'name','poems.pdf','string'),(343,'submissionFileId','82','int'),(343,'submissionId','11','int'),(343,'username','dbarnes','string'),(344,'fileId','48','int'),(344,'fileStage','19','int'),(344,'originalFileName','intro.pdf','string'),(344,'sourceSubmissionFileId','80','int'),(344,'submissionFileId','83','int'),(344,'submissionId','11','int'),(344,'username','dbarnes','string'),(345,'fileId','48','int'),(345,'fileStage','19','int'),(345,'name','intro.pdf','string'),(345,'submissionFileId','83','int'),(345,'submissionId','11','int'),(345,'username','dbarnes','string'),(346,'reviewAssignmentId','9','int'),(346,'reviewerName','Aisla McCrae','string'),(346,'round','1','int'),(346,'stageId','2','int'),(346,'submissionId','11','int'),(347,'decision','3','int'),(347,'editorId','3','int'),(347,'editorName','Daniel Barnes','string'),(347,'submissionId','11','int'),(348,'reviewAssignmentId','10','int'),(348,'reviewerName','Adela Gallego','string'),(348,'round','1','int'),(348,'stageId','3','int'),(348,'submissionId','11','int'),(349,'reviewAssignmentId','11','int'),(349,'reviewerName','Gonzalo Favio','string'),(349,'round','1','int'),(349,'stageId','3','int'),(349,'submissionId','11','int'),(350,'reviewAssignmentId','10','int'),(350,'reviewerName','Adela Gallego','string'),(350,'round','1','int'),(350,'submissionId','11','int'),(351,'reviewAssignmentId','10','int'),(351,'reviewerName','Adela Gallego','string'),(351,'round','1','int'),(351,'submissionId','11','int'),(352,'reviewAssignmentId','11','int'),(352,'reviewerName','Gonzalo Favio','string'),(352,'round','1','int'),(352,'submissionId','11','int'),(353,'reviewAssignmentId','11','int'),(353,'reviewerName','Gonzalo Favio','string'),(353,'round','1','int'),(353,'submissionId','11','int'),(354,'decision','2','int'),(354,'editorId','3','int'),(354,'editorName','Daniel Barnes','string'),(354,'submissionId','11','int'),(355,'recipientCount','2','int'),(355,'subject','Thank you for your review','string'),(358,'fileId','50','int'),(358,'fileStage','2','int'),(358,'originalFileName','chapter1.pdf','string'),(358,'sourceSubmissionFileId',NULL,'string'),(358,'submissionFileId','84','int'),(358,'submissionId','12','int'),(358,'username','lelder','string'),(359,'fileId','50','int'),(359,'fileStage','2','int'),(359,'name','chapter1.pdf','string'),(359,'submissionFileId','84','int'),(359,'submissionId','12','int'),(359,'username','lelder','string'),(360,'fileId','50','int'),(360,'fileStage','2','int'),(360,'originalFileName','chapter1.pdf','string'),(360,'sourceSubmissionFileId',NULL,'string'),(360,'submissionFileId','84','int'),(360,'submissionId','12','int'),(360,'username','lelder','string'),(361,'fileId','50','int'),(361,'fileStage','2','int'),(361,'name','chapter1.pdf','string'),(361,'originalFileName','chapter1.pdf','string'),(361,'sourceSubmissionFileId',NULL,'string'),(361,'submissionFileId','84','int'),(361,'submissionId','12','int'),(361,'username','lelder','string'),(362,'fileId','51','int'),(362,'fileStage','2','int'),(362,'originalFileName','chapter2.pdf','string'),(362,'sourceSubmissionFileId',NULL,'string'),(362,'submissionFileId','85','int'),(362,'submissionId','12','int'),(362,'username','lelder','string'),(363,'fileId','51','int'),(363,'fileStage','2','int'),(363,'name','chapter2.pdf','string'),(363,'submissionFileId','85','int'),(363,'submissionId','12','int'),(363,'username','lelder','string'),(364,'fileId','51','int'),(364,'fileStage','2','int'),(364,'originalFileName','chapter2.pdf','string'),(364,'sourceSubmissionFileId',NULL,'string'),(364,'submissionFileId','85','int'),(364,'submissionId','12','int'),(364,'username','lelder','string'),(365,'fileId','51','int'),(365,'fileStage','2','int'),(365,'name','chapter2.pdf','string'),(365,'originalFileName','chapter2.pdf','string'),(365,'sourceSubmissionFileId',NULL,'string'),(365,'submissionFileId','85','int'),(365,'submissionId','12','int'),(365,'username','lelder','string'),(366,'fileId','52','int'),(366,'fileStage','2','int'),(366,'originalFileName','chapter3.pdf','string'),(366,'sourceSubmissionFileId',NULL,'string'),(366,'submissionFileId','86','int'),(366,'submissionId','12','int'),(366,'username','lelder','string'),(367,'fileId','52','int'),(367,'fileStage','2','int'),(367,'name','chapter3.pdf','string'),(367,'submissionFileId','86','int'),(367,'submissionId','12','int'),(367,'username','lelder','string'),(368,'fileId','52','int'),(368,'fileStage','2','int'),(368,'originalFileName','chapter3.pdf','string'),(368,'sourceSubmissionFileId',NULL,'string'),(368,'submissionFileId','86','int'),(368,'submissionId','12','int'),(368,'username','lelder','string'),(369,'fileId','52','int'),(369,'fileStage','2','int'),(369,'name','chapter3.pdf','string'),(369,'originalFileName','chapter3.pdf','string'),(369,'sourceSubmissionFileId',NULL,'string'),(369,'submissionFileId','86','int'),(369,'submissionId','12','int'),(369,'username','lelder','string'),(371,'decision','1','int'),(371,'editorId','3','int'),(371,'editorName','Daniel Barnes','string'),(371,'submissionId','12','int'),(372,'fileId','52','int'),(372,'fileStage','19','int'),(372,'originalFileName','chapter3.pdf','string'),(372,'sourceSubmissionFileId','86','int'),(372,'submissionFileId','87','int'),(372,'submissionId','12','int'),(372,'username','dbarnes','string'),(373,'fileId','52','int'),(373,'fileStage','19','int'),(373,'name','chapter3.pdf','string'),(373,'submissionFileId','87','int'),(373,'submissionId','12','int'),(373,'username','dbarnes','string'),(374,'fileId','51','int'),(374,'fileStage','19','int'),(374,'originalFileName','chapter2.pdf','string'),(374,'sourceSubmissionFileId','85','int'),(374,'submissionFileId','88','int'),(374,'submissionId','12','int'),(374,'username','dbarnes','string'),(375,'fileId','51','int'),(375,'fileStage','19','int'),(375,'name','chapter2.pdf','string'),(375,'submissionFileId','88','int'),(375,'submissionId','12','int'),(375,'username','dbarnes','string'),(376,'fileId','50','int'),(376,'fileStage','19','int'),(376,'originalFileName','chapter1.pdf','string'),(376,'sourceSubmissionFileId','84','int'),(376,'submissionFileId','89','int'),(376,'submissionId','12','int'),(376,'username','dbarnes','string'),(377,'fileId','50','int'),(377,'fileStage','19','int'),(377,'name','chapter1.pdf','string'),(377,'submissionFileId','89','int'),(377,'submissionId','12','int'),(377,'username','dbarnes','string'),(378,'reviewAssignmentId','12','int'),(378,'reviewerName','Julie Janssen','string'),(378,'round','1','int'),(378,'stageId','2','int'),(378,'submissionId','12','int'),(379,'reviewAssignmentId','13','int'),(379,'reviewerName','Paul Hudson','string'),(379,'round','1','int'),(379,'stageId','2','int'),(379,'submissionId','12','int'),(380,'reviewAssignmentId','14','int'),(380,'reviewerName','Aisla McCrae','string'),(380,'round','1','int'),(380,'stageId','2','int'),(380,'submissionId','12','int'),(381,'reviewAssignmentId','13','int'),(381,'reviewerName','Paul Hudson','string'),(381,'round','1','int'),(381,'submissionId','12','int'),(382,'reviewAssignmentId','13','int'),(382,'reviewerName','Paul Hudson','string'),(382,'round','1','int'),(382,'submissionId','12','int'),(385,'fileId','53','int'),(385,'fileStage','2','int'),(385,'originalFileName','chapter1.pdf','string'),(385,'sourceSubmissionFileId',NULL,'string'),(385,'submissionFileId','90','int'),(385,'submissionId','13','int'),(385,'username','mally','string'),(386,'fileId','53','int'),(386,'fileStage','2','int'),(386,'name','chapter1.pdf','string'),(386,'submissionFileId','90','int'),(386,'submissionId','13','int'),(386,'username','mally','string'),(387,'fileId','53','int'),(387,'fileStage','2','int'),(387,'originalFileName','chapter1.pdf','string'),(387,'sourceSubmissionFileId',NULL,'string'),(387,'submissionFileId','90','int'),(387,'submissionId','13','int'),(387,'username','mally','string'),(388,'fileId','53','int'),(388,'fileStage','2','int'),(388,'name','chapter1.pdf','string'),(388,'originalFileName','chapter1.pdf','string'),(388,'sourceSubmissionFileId',NULL,'string'),(388,'submissionFileId','90','int'),(388,'submissionId','13','int'),(388,'username','mally','string'),(389,'fileId','54','int'),(389,'fileStage','2','int'),(389,'originalFileName','chapter2.pdf','string'),(389,'sourceSubmissionFileId',NULL,'string'),(389,'submissionFileId','91','int'),(389,'submissionId','13','int'),(389,'username','mally','string'),(390,'fileId','54','int'),(390,'fileStage','2','int'),(390,'name','chapter2.pdf','string'),(390,'submissionFileId','91','int'),(390,'submissionId','13','int'),(390,'username','mally','string'),(391,'fileId','54','int'),(391,'fileStage','2','int'),(391,'originalFileName','chapter2.pdf','string'),(391,'sourceSubmissionFileId',NULL,'string'),(391,'submissionFileId','91','int'),(391,'submissionId','13','int'),(391,'username','mally','string'),(392,'fileId','54','int'),(392,'fileStage','2','int'),(392,'name','chapter2.pdf','string'),(392,'originalFileName','chapter2.pdf','string'),(392,'sourceSubmissionFileId',NULL,'string'),(392,'submissionFileId','91','int'),(392,'submissionId','13','int'),(392,'username','mally','string'),(393,'fileId','55','int'),(393,'fileStage','2','int'),(393,'originalFileName','chapter3.pdf','string'),(393,'sourceSubmissionFileId',NULL,'string'),(393,'submissionFileId','92','int'),(393,'submissionId','13','int'),(393,'username','mally','string'),(394,'fileId','55','int'),(394,'fileStage','2','int'),(394,'name','chapter3.pdf','string'),(394,'submissionFileId','92','int'),(394,'submissionId','13','int'),(394,'username','mally','string'),(395,'fileId','55','int'),(395,'fileStage','2','int'),(395,'originalFileName','chapter3.pdf','string'),(395,'sourceSubmissionFileId',NULL,'string'),(395,'submissionFileId','92','int'),(395,'submissionId','13','int'),(395,'username','mally','string'),(396,'fileId','55','int'),(396,'fileStage','2','int'),(396,'name','chapter3.pdf','string'),(396,'originalFileName','chapter3.pdf','string'),(396,'sourceSubmissionFileId',NULL,'string'),(396,'submissionFileId','92','int'),(396,'submissionId','13','int'),(396,'username','mally','string'),(398,'decision','1','int'),(398,'editorId','3','int'),(398,'editorName','Daniel Barnes','string'),(398,'submissionId','13','int'),(399,'fileId','55','int'),(399,'fileStage','19','int'),(399,'originalFileName','chapter3.pdf','string'),(399,'sourceSubmissionFileId','92','int'),(399,'submissionFileId','93','int'),(399,'submissionId','13','int'),(399,'username','dbarnes','string'),(400,'fileId','55','int'),(400,'fileStage','19','int'),(400,'name','chapter3.pdf','string'),(400,'submissionFileId','93','int'),(400,'submissionId','13','int'),(400,'username','dbarnes','string'),(401,'fileId','53','int'),(401,'fileStage','19','int'),(401,'originalFileName','chapter1.pdf','string'),(401,'sourceSubmissionFileId','90','int'),(401,'submissionFileId','94','int'),(401,'submissionId','13','int'),(401,'username','dbarnes','string'),(402,'fileId','53','int'),(402,'fileStage','19','int'),(402,'name','chapter1.pdf','string'),(402,'submissionFileId','94','int'),(402,'submissionId','13','int'),(402,'username','dbarnes','string'),(403,'fileId','54','int'),(403,'fileStage','19','int'),(403,'originalFileName','chapter2.pdf','string'),(403,'sourceSubmissionFileId','91','int'),(403,'submissionFileId','95','int'),(403,'submissionId','13','int'),(403,'username','dbarnes','string'),(404,'fileId','54','int'),(404,'fileStage','19','int'),(404,'name','chapter2.pdf','string'),(404,'submissionFileId','95','int'),(404,'submissionId','13','int'),(404,'username','dbarnes','string'),(405,'reviewAssignmentId','15','int'),(405,'reviewerName','Paul Hudson','string'),(405,'round','1','int'),(405,'stageId','2','int'),(405,'submissionId','13','int'),(406,'decision','3','int'),(406,'editorId','3','int'),(406,'editorName','Daniel Barnes','string'),(406,'submissionId','13','int'),(407,'reviewAssignmentId','16','int'),(407,'reviewerName','Adela Gallego','string'),(407,'round','1','int'),(407,'stageId','3','int'),(407,'submissionId','13','int'),(408,'reviewAssignmentId','17','int'),(408,'reviewerName','Al Zacharia','string'),(408,'round','1','int'),(408,'stageId','3','int'),(408,'submissionId','13','int'),(409,'reviewAssignmentId','18','int'),(409,'reviewerName','Gonzalo Favio','string'),(409,'round','1','int'),(409,'stageId','3','int'),(409,'submissionId','13','int'),(410,'reviewAssignmentId','16','int'),(410,'reviewerName','Adela Gallego','string'),(410,'round','1','int'),(410,'submissionId','13','int'),(411,'reviewAssignmentId','16','int'),(411,'reviewerName','Adela Gallego','string'),(411,'round','1','int'),(411,'submissionId','13','int'),(412,'reviewAssignmentId','18','int'),(412,'reviewerName','Gonzalo Favio','string'),(412,'round','1','int'),(412,'submissionId','13','int'),(413,'reviewAssignmentId','18','int'),(413,'reviewerName','Gonzalo Favio','string'),(413,'round','1','int'),(413,'submissionId','13','int'),(414,'decision','2','int'),(414,'editorId','3','int'),(414,'editorName','Daniel Barnes','string'),(414,'submissionId','13','int'),(415,'recipientCount','2','int'),(415,'subject','Thank you for your review','string'),(418,'fileId','56','int'),(418,'fileStage','2','int'),(418,'originalFileName','chapter1.pdf','string'),(418,'sourceSubmissionFileId',NULL,'string'),(418,'submissionFileId','96','int'),(418,'submissionId','14','int'),(418,'username','mdawson','string'),(419,'fileId','56','int'),(419,'fileStage','2','int'),(419,'name','chapter1.pdf','string'),(419,'submissionFileId','96','int'),(419,'submissionId','14','int'),(419,'username','mdawson','string'),(420,'fileId','56','int'),(420,'fileStage','2','int'),(420,'originalFileName','chapter1.pdf','string'),(420,'sourceSubmissionFileId',NULL,'string'),(420,'submissionFileId','96','int'),(420,'submissionId','14','int'),(420,'username','mdawson','string'),(421,'fileId','56','int'),(421,'fileStage','2','int'),(421,'name','chapter1.pdf','string'),(421,'originalFileName','chapter1.pdf','string'),(421,'sourceSubmissionFileId',NULL,'string'),(421,'submissionFileId','96','int'),(421,'submissionId','14','int'),(421,'username','mdawson','string'),(422,'fileId','57','int'),(422,'fileStage','2','int'),(422,'originalFileName','chapter2.pdf','string'),(422,'sourceSubmissionFileId',NULL,'string'),(422,'submissionFileId','97','int'),(422,'submissionId','14','int'),(422,'username','mdawson','string'),(423,'fileId','57','int'),(423,'fileStage','2','int'),(423,'name','chapter2.pdf','string'),(423,'submissionFileId','97','int'),(423,'submissionId','14','int'),(423,'username','mdawson','string'),(424,'fileId','57','int'),(424,'fileStage','2','int'),(424,'originalFileName','chapter2.pdf','string'),(424,'sourceSubmissionFileId',NULL,'string'),(424,'submissionFileId','97','int'),(424,'submissionId','14','int'),(424,'username','mdawson','string'),(425,'fileId','57','int'),(425,'fileStage','2','int'),(425,'name','chapter2.pdf','string'),(425,'originalFileName','chapter2.pdf','string'),(425,'sourceSubmissionFileId',NULL,'string'),(425,'submissionFileId','97','int'),(425,'submissionId','14','int'),(425,'username','mdawson','string'),(426,'fileId','58','int'),(426,'fileStage','2','int'),(426,'originalFileName','chapter3.pdf','string'),(426,'sourceSubmissionFileId',NULL,'string'),(426,'submissionFileId','98','int'),(426,'submissionId','14','int'),(426,'username','mdawson','string'),(427,'fileId','58','int'),(427,'fileStage','2','int'),(427,'name','chapter3.pdf','string'),(427,'submissionFileId','98','int'),(427,'submissionId','14','int'),(427,'username','mdawson','string'),(428,'fileId','58','int'),(428,'fileStage','2','int'),(428,'originalFileName','chapter3.pdf','string'),(428,'sourceSubmissionFileId',NULL,'string'),(428,'submissionFileId','98','int'),(428,'submissionId','14','int'),(428,'username','mdawson','string'),(429,'fileId','58','int'),(429,'fileStage','2','int'),(429,'name','chapter3.pdf','string'),(429,'originalFileName','chapter3.pdf','string'),(429,'sourceSubmissionFileId',NULL,'string'),(429,'submissionFileId','98','int'),(429,'submissionId','14','int'),(429,'username','mdawson','string'),(430,'fileId','59','int'),(430,'fileStage','2','int'),(430,'originalFileName','chapter4.pdf','string'),(430,'sourceSubmissionFileId',NULL,'string'),(430,'submissionFileId','99','int'),(430,'submissionId','14','int'),(430,'username','mdawson','string'),(431,'fileId','59','int'),(431,'fileStage','2','int'),(431,'name','chapter4.pdf','string'),(431,'submissionFileId','99','int'),(431,'submissionId','14','int'),(431,'username','mdawson','string'),(432,'fileId','59','int'),(432,'fileStage','2','int'),(432,'originalFileName','chapter4.pdf','string'),(432,'sourceSubmissionFileId',NULL,'string'),(432,'submissionFileId','99','int'),(432,'submissionId','14','int'),(432,'username','mdawson','string'),(433,'fileId','59','int'),(433,'fileStage','2','int'),(433,'name','chapter4.pdf','string'),(433,'originalFileName','chapter4.pdf','string'),(433,'sourceSubmissionFileId',NULL,'string'),(433,'submissionFileId','99','int'),(433,'submissionId','14','int'),(433,'username','mdawson','string'),(434,'fileId','60','int'),(434,'fileStage','2','int'),(434,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(434,'sourceSubmissionFileId',NULL,'string'),(434,'submissionFileId','100','int'),(434,'submissionId','14','int'),(434,'username','mdawson','string'),(435,'fileId','60','int'),(435,'fileStage','2','int'),(435,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(435,'submissionFileId','100','int'),(435,'submissionId','14','int'),(435,'username','mdawson','string'),(436,'fileId','60','int'),(436,'fileStage','2','int'),(436,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(436,'sourceSubmissionFileId',NULL,'string'),(436,'submissionFileId','100','int'),(436,'submissionId','14','int'),(436,'username','mdawson','string'),(437,'fileId','60','int'),(437,'fileStage','2','int'),(437,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(437,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(437,'sourceSubmissionFileId',NULL,'string'),(437,'submissionFileId','100','int'),(437,'submissionId','14','int'),(437,'username','mdawson','string'),(438,'fileId','61','int'),(438,'fileStage','2','int'),(438,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(438,'sourceSubmissionFileId',NULL,'string'),(438,'submissionFileId','101','int'),(438,'submissionId','14','int'),(438,'username','mdawson','string'),(439,'fileId','61','int'),(439,'fileStage','2','int'),(439,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(439,'submissionFileId','101','int'),(439,'submissionId','14','int'),(439,'username','mdawson','string'),(440,'fileId','61','int'),(440,'fileStage','2','int'),(440,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(440,'sourceSubmissionFileId',NULL,'string'),(440,'submissionFileId','101','int'),(440,'submissionId','14','int'),(440,'username','mdawson','string'),(441,'fileId','61','int'),(441,'fileStage','2','int'),(441,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(441,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(441,'sourceSubmissionFileId',NULL,'string'),(441,'submissionFileId','101','int'),(441,'submissionId','14','int'),(441,'username','mdawson','string'),(443,'decision','1','int'),(443,'editorId','3','int'),(443,'editorName','Daniel Barnes','string'),(443,'submissionId','14','int'),(444,'fileId','61','int'),(444,'fileStage','19','int'),(444,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(444,'sourceSubmissionFileId','101','int'),(444,'submissionFileId','102','int'),(444,'submissionId','14','int'),(444,'username','dbarnes','string'),(445,'fileId','61','int'),(445,'fileStage','19','int'),(445,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(445,'submissionFileId','102','int'),(445,'submissionId','14','int'),(445,'username','dbarnes','string'),(446,'fileId','60','int'),(446,'fileStage','19','int'),(446,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(446,'sourceSubmissionFileId','100','int'),(446,'submissionFileId','103','int'),(446,'submissionId','14','int'),(446,'username','dbarnes','string'),(447,'fileId','60','int'),(447,'fileStage','19','int'),(447,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(447,'submissionFileId','103','int'),(447,'submissionId','14','int'),(447,'username','dbarnes','string'),(448,'fileId','59','int'),(448,'fileStage','19','int'),(448,'originalFileName','chapter4.pdf','string'),(448,'sourceSubmissionFileId','99','int'),(448,'submissionFileId','104','int'),(448,'submissionId','14','int'),(448,'username','dbarnes','string'),(449,'fileId','59','int'),(449,'fileStage','19','int'),(449,'name','chapter4.pdf','string'),(449,'submissionFileId','104','int'),(449,'submissionId','14','int'),(449,'username','dbarnes','string'),(450,'fileId','58','int'),(450,'fileStage','19','int'),(450,'originalFileName','chapter3.pdf','string'),(450,'sourceSubmissionFileId','98','int'),(450,'submissionFileId','105','int'),(450,'submissionId','14','int'),(450,'username','dbarnes','string'),(451,'fileId','58','int'),(451,'fileStage','19','int'),(451,'name','chapter3.pdf','string'),(451,'submissionFileId','105','int'),(451,'submissionId','14','int'),(451,'username','dbarnes','string'),(452,'fileId','57','int'),(452,'fileStage','19','int'),(452,'originalFileName','chapter2.pdf','string'),(452,'sourceSubmissionFileId','97','int'),(452,'submissionFileId','106','int'),(452,'submissionId','14','int'),(452,'username','dbarnes','string'),(453,'fileId','57','int'),(453,'fileStage','19','int'),(453,'name','chapter2.pdf','string'),(453,'submissionFileId','106','int'),(453,'submissionId','14','int'),(453,'username','dbarnes','string'),(454,'fileId','56','int'),(454,'fileStage','19','int'),(454,'originalFileName','chapter1.pdf','string'),(454,'sourceSubmissionFileId','96','int'),(454,'submissionFileId','107','int'),(454,'submissionId','14','int'),(454,'username','dbarnes','string'),(455,'fileId','56','int'),(455,'fileStage','19','int'),(455,'name','chapter1.pdf','string'),(455,'submissionFileId','107','int'),(455,'submissionId','14','int'),(455,'username','dbarnes','string'),(456,'reviewAssignmentId','19','int'),(456,'reviewerName','Julie Janssen','string'),(456,'round','1','int'),(456,'stageId','2','int'),(456,'submissionId','14','int'),(457,'decision','3','int'),(457,'editorId','3','int'),(457,'editorName','Daniel Barnes','string'),(457,'submissionId','14','int'),(458,'reviewAssignmentId','20','int'),(458,'reviewerName','Al Zacharia','string'),(458,'round','1','int'),(458,'stageId','3','int'),(458,'submissionId','14','int'),(459,'decision','2','int'),(459,'editorId','3','int'),(459,'editorName','Daniel Barnes','string'),(459,'submissionId','14','int'),(460,'name','Maria Fritz','string'),(460,'userGroupName','Copyeditor','string'),(460,'username','mfritz','string'),(461,'decision','7','int'),(461,'editorId','3','int'),(461,'editorName','Daniel Barnes','string'),(461,'submissionId','14','int'),(462,'name','Graham Cox','string'),(462,'userGroupName','Layout Editor','string'),(462,'username','gcox','string'),(463,'name','Sabine Kumar','string'),(463,'userGroupName','Proofreader','string'),(463,'username','skumar','string'),(464,'formatName','PDF','string'),(465,'fileId','61','int'),(465,'fileStage','10','int'),(465,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(465,'sourceSubmissionFileId','101','int'),(465,'submissionFileId','108','int'),(465,'submissionId','14','int'),(465,'username','dbarnes','string'),(466,'fileId','61','int'),(466,'fileStage','10','int'),(466,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(466,'submissionFileId','108','int'),(466,'submissionId','14','int'),(466,'username','dbarnes','string'),(467,'fileId','60','int'),(467,'fileStage','10','int'),(467,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(467,'sourceSubmissionFileId','100','int'),(467,'submissionFileId','109','int'),(467,'submissionId','14','int'),(467,'username','dbarnes','string'),(468,'fileId','60','int'),(468,'fileStage','10','int'),(468,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(468,'submissionFileId','109','int'),(468,'submissionId','14','int'),(468,'username','dbarnes','string'),(469,'fileId','59','int'),(469,'fileStage','10','int'),(469,'originalFileName','chapter4.pdf','string'),(469,'sourceSubmissionFileId','99','int'),(469,'submissionFileId','110','int'),(469,'submissionId','14','int'),(469,'username','dbarnes','string'),(470,'fileId','59','int'),(470,'fileStage','10','int'),(470,'name','chapter4.pdf','string'),(470,'submissionFileId','110','int'),(470,'submissionId','14','int'),(470,'username','dbarnes','string'),(471,'fileId','58','int'),(471,'fileStage','10','int'),(471,'originalFileName','chapter3.pdf','string'),(471,'sourceSubmissionFileId','98','int'),(471,'submissionFileId','111','int'),(471,'submissionId','14','int'),(471,'username','dbarnes','string'),(472,'fileId','58','int'),(472,'fileStage','10','int'),(472,'name','chapter3.pdf','string'),(472,'submissionFileId','111','int'),(472,'submissionId','14','int'),(472,'username','dbarnes','string'),(473,'fileId','57','int'),(473,'fileStage','10','int'),(473,'originalFileName','chapter2.pdf','string'),(473,'sourceSubmissionFileId','97','int'),(473,'submissionFileId','112','int'),(473,'submissionId','14','int'),(473,'username','dbarnes','string'),(474,'fileId','57','int'),(474,'fileStage','10','int'),(474,'name','chapter2.pdf','string'),(474,'submissionFileId','112','int'),(474,'submissionId','14','int'),(474,'username','dbarnes','string'),(475,'fileId','56','int'),(475,'fileStage','10','int'),(475,'originalFileName','chapter1.pdf','string'),(475,'sourceSubmissionFileId','96','int'),(475,'submissionFileId','113','int'),(475,'submissionId','14','int'),(475,'username','dbarnes','string'),(476,'fileId','56','int'),(476,'fileStage','10','int'),(476,'name','chapter1.pdf','string'),(476,'submissionFileId','113','int'),(476,'submissionId','14','int'),(476,'username','dbarnes','string'),(477,'publicationFormatName','PDF','string'),(478,'publicationFormatName','PDF','string'),(479,'fileId','56','int'),(479,'fileStage','10','int'),(479,'originalFileName','chapter1.pdf','string'),(479,'sourceSubmissionFileId','96','int'),(479,'submissionFileId','113','int'),(479,'submissionId','14','int'),(479,'username','dbarnes','string'),(480,'fileId','56','int'),(480,'fileStage','10','int'),(480,'name','chapter1.pdf','string'),(480,'originalFileName','chapter1.pdf','string'),(480,'sourceSubmissionFileId','96','int'),(480,'submissionFileId','113','int'),(480,'submissionId','14','int'),(480,'username','dbarnes','string'),(481,'file','chapter1.pdf','string'),(481,'name','Daniel Barnes','string'),(481,'username','dbarnes','string'),(482,'fileId','56','int'),(482,'fileStage','10','int'),(482,'originalFileName','chapter1.pdf','string'),(482,'sourceSubmissionFileId','96','int'),(482,'submissionFileId','113','int'),(482,'submissionId','14','int'),(482,'username','dbarnes','string'),(483,'fileId','56','int'),(483,'fileStage','10','int'),(483,'name','chapter1.pdf','string'),(483,'originalFileName','chapter1.pdf','string'),(483,'sourceSubmissionFileId','96','int'),(483,'submissionFileId','113','int'),(483,'submissionId','14','int'),(483,'username','dbarnes','string'),(484,'fileId','57','int'),(484,'fileStage','10','int'),(484,'originalFileName','chapter2.pdf','string'),(484,'sourceSubmissionFileId','97','int'),(484,'submissionFileId','112','int'),(484,'submissionId','14','int'),(484,'username','dbarnes','string'),(485,'fileId','57','int'),(485,'fileStage','10','int'),(485,'name','chapter2.pdf','string'),(485,'originalFileName','chapter2.pdf','string'),(485,'sourceSubmissionFileId','97','int'),(485,'submissionFileId','112','int'),(485,'submissionId','14','int'),(485,'username','dbarnes','string'),(486,'file','chapter2.pdf','string'),(486,'name','Daniel Barnes','string'),(486,'username','dbarnes','string'),(487,'fileId','57','int'),(487,'fileStage','10','int'),(487,'originalFileName','chapter2.pdf','string'),(487,'sourceSubmissionFileId','97','int'),(487,'submissionFileId','112','int'),(487,'submissionId','14','int'),(487,'username','dbarnes','string'),(488,'fileId','57','int'),(488,'fileStage','10','int'),(488,'name','chapter2.pdf','string'),(488,'originalFileName','chapter2.pdf','string'),(488,'sourceSubmissionFileId','97','int'),(488,'submissionFileId','112','int'),(488,'submissionId','14','int'),(488,'username','dbarnes','string'),(489,'fileId','58','int'),(489,'fileStage','10','int'),(489,'originalFileName','chapter3.pdf','string'),(489,'sourceSubmissionFileId','98','int'),(489,'submissionFileId','111','int'),(489,'submissionId','14','int'),(489,'username','dbarnes','string'),(490,'fileId','58','int'),(490,'fileStage','10','int'),(490,'name','chapter3.pdf','string'),(490,'originalFileName','chapter3.pdf','string'),(490,'sourceSubmissionFileId','98','int'),(490,'submissionFileId','111','int'),(490,'submissionId','14','int'),(490,'username','dbarnes','string'),(491,'file','chapter3.pdf','string'),(491,'name','Daniel Barnes','string'),(491,'username','dbarnes','string'),(492,'fileId','58','int'),(492,'fileStage','10','int'),(492,'originalFileName','chapter3.pdf','string'),(492,'sourceSubmissionFileId','98','int'),(492,'submissionFileId','111','int'),(492,'submissionId','14','int'),(492,'username','dbarnes','string'),(493,'fileId','58','int'),(493,'fileStage','10','int'),(493,'name','chapter3.pdf','string'),(493,'originalFileName','chapter3.pdf','string'),(493,'sourceSubmissionFileId','98','int'),(493,'submissionFileId','111','int'),(493,'submissionId','14','int'),(493,'username','dbarnes','string'),(494,'fileId','59','int'),(494,'fileStage','10','int'),(494,'originalFileName','chapter4.pdf','string'),(494,'sourceSubmissionFileId','99','int'),(494,'submissionFileId','110','int'),(494,'submissionId','14','int'),(494,'username','dbarnes','string'),(495,'fileId','59','int'),(495,'fileStage','10','int'),(495,'name','chapter4.pdf','string'),(495,'originalFileName','chapter4.pdf','string'),(495,'sourceSubmissionFileId','99','int'),(495,'submissionFileId','110','int'),(495,'submissionId','14','int'),(495,'username','dbarnes','string'),(496,'file','chapter4.pdf','string'),(496,'name','Daniel Barnes','string'),(496,'username','dbarnes','string'),(497,'fileId','59','int'),(497,'fileStage','10','int'),(497,'originalFileName','chapter4.pdf','string'),(497,'sourceSubmissionFileId','99','int'),(497,'submissionFileId','110','int'),(497,'submissionId','14','int'),(497,'username','dbarnes','string'),(498,'fileId','59','int'),(498,'fileStage','10','int'),(498,'name','chapter4.pdf','string'),(498,'originalFileName','chapter4.pdf','string'),(498,'sourceSubmissionFileId','99','int'),(498,'submissionFileId','110','int'),(498,'submissionId','14','int'),(498,'username','dbarnes','string'),(499,'fileId','60','int'),(499,'fileStage','10','int'),(499,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(499,'sourceSubmissionFileId','100','int'),(499,'submissionFileId','109','int'),(499,'submissionId','14','int'),(499,'username','dbarnes','string'),(500,'fileId','60','int'),(500,'fileStage','10','int'),(500,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(500,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(500,'sourceSubmissionFileId','100','int'),(500,'submissionFileId','109','int'),(500,'submissionId','14','int'),(500,'username','dbarnes','string'),(501,'file','Segmentation of Vascular Ultrasound Imag.pdf','string'),(501,'name','Daniel Barnes','string'),(501,'username','dbarnes','string'),(502,'fileId','60','int'),(502,'fileStage','10','int'),(502,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(502,'sourceSubmissionFileId','100','int'),(502,'submissionFileId','109','int'),(502,'submissionId','14','int'),(502,'username','dbarnes','string'),(503,'fileId','60','int'),(503,'fileStage','10','int'),(503,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(503,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(503,'sourceSubmissionFileId','100','int'),(503,'submissionFileId','109','int'),(503,'submissionId','14','int'),(503,'username','dbarnes','string'),(504,'fileId','61','int'),(504,'fileStage','10','int'),(504,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(504,'sourceSubmissionFileId','101','int'),(504,'submissionFileId','108','int'),(504,'submissionId','14','int'),(504,'username','dbarnes','string'),(505,'fileId','61','int'),(505,'fileStage','10','int'),(505,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(505,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(505,'sourceSubmissionFileId','101','int'),(505,'submissionFileId','108','int'),(505,'submissionId','14','int'),(505,'username','dbarnes','string'),(506,'file','The Canadian Nutrient File: Nutrient Val.pdf','string'),(506,'name','Daniel Barnes','string'),(506,'username','dbarnes','string'),(507,'fileId','61','int'),(507,'fileStage','10','int'),(507,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(507,'sourceSubmissionFileId','101','int'),(507,'submissionFileId','108','int'),(507,'submissionId','14','int'),(507,'username','dbarnes','string'),(508,'fileId','61','int'),(508,'fileStage','10','int'),(508,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(508,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(508,'sourceSubmissionFileId','101','int'),(508,'submissionFileId','108','int'),(508,'submissionId','14','int'),(508,'username','dbarnes','string'),(512,'fileId','62','int'),(512,'fileStage','2','int'),(512,'originalFileName','chapter1.pdf','string'),(512,'sourceSubmissionFileId',NULL,'string'),(512,'submissionFileId','114','int'),(512,'submissionId','15','int'),(512,'username','mforan','string'),(513,'fileId','62','int'),(513,'fileStage','2','int'),(513,'name','chapter1.pdf','string'),(513,'submissionFileId','114','int'),(513,'submissionId','15','int'),(513,'username','mforan','string'),(514,'fileId','62','int'),(514,'fileStage','2','int'),(514,'originalFileName','chapter1.pdf','string'),(514,'sourceSubmissionFileId',NULL,'string'),(514,'submissionFileId','114','int'),(514,'submissionId','15','int'),(514,'username','mforan','string'),(515,'fileId','62','int'),(515,'fileStage','2','int'),(515,'name','chapter1.pdf','string'),(515,'originalFileName','chapter1.pdf','string'),(515,'sourceSubmissionFileId',NULL,'string'),(515,'submissionFileId','114','int'),(515,'submissionId','15','int'),(515,'username','mforan','string'),(516,'fileId','63','int'),(516,'fileStage','2','int'),(516,'originalFileName','chapter2.pdf','string'),(516,'sourceSubmissionFileId',NULL,'string'),(516,'submissionFileId','115','int'),(516,'submissionId','15','int'),(516,'username','mforan','string'),(517,'fileId','63','int'),(517,'fileStage','2','int'),(517,'name','chapter2.pdf','string'),(517,'submissionFileId','115','int'),(517,'submissionId','15','int'),(517,'username','mforan','string'),(518,'fileId','63','int'),(518,'fileStage','2','int'),(518,'originalFileName','chapter2.pdf','string'),(518,'sourceSubmissionFileId',NULL,'string'),(518,'submissionFileId','115','int'),(518,'submissionId','15','int'),(518,'username','mforan','string'),(519,'fileId','63','int'),(519,'fileStage','2','int'),(519,'name','chapter2.pdf','string'),(519,'originalFileName','chapter2.pdf','string'),(519,'sourceSubmissionFileId',NULL,'string'),(519,'submissionFileId','115','int'),(519,'submissionId','15','int'),(519,'username','mforan','string'),(520,'fileId','64','int'),(520,'fileStage','2','int'),(520,'originalFileName','chapter3.pdf','string'),(520,'sourceSubmissionFileId',NULL,'string'),(520,'submissionFileId','116','int'),(520,'submissionId','15','int'),(520,'username','mforan','string'),(521,'fileId','64','int'),(521,'fileStage','2','int'),(521,'name','chapter3.pdf','string'),(521,'submissionFileId','116','int'),(521,'submissionId','15','int'),(521,'username','mforan','string'),(522,'fileId','64','int'),(522,'fileStage','2','int'),(522,'originalFileName','chapter3.pdf','string'),(522,'sourceSubmissionFileId',NULL,'string'),(522,'submissionFileId','116','int'),(522,'submissionId','15','int'),(522,'username','mforan','string'),(523,'fileId','64','int'),(523,'fileStage','2','int'),(523,'name','chapter3.pdf','string'),(523,'originalFileName','chapter3.pdf','string'),(523,'sourceSubmissionFileId',NULL,'string'),(523,'submissionFileId','116','int'),(523,'submissionId','15','int'),(523,'username','mforan','string'),(525,'decision','18','int'),(525,'editorId','3','int'),(525,'editorName','Daniel Barnes','string'),(525,'submissionId','15','int'),(526,'fileId','64','int'),(526,'fileStage','4','int'),(526,'originalFileName','chapter3.pdf','string'),(526,'sourceSubmissionFileId','116','int'),(526,'submissionFileId','117','int'),(526,'submissionId','15','int'),(526,'username','dbarnes','string'),(527,'fileId','64','int'),(527,'fileStage','4','int'),(527,'name','chapter3.pdf','string'),(527,'submissionFileId','117','int'),(527,'submissionId','15','int'),(527,'username','dbarnes','string'),(528,'fileId','62','int'),(528,'fileStage','4','int'),(528,'originalFileName','chapter1.pdf','string'),(528,'sourceSubmissionFileId','114','int'),(528,'submissionFileId','118','int'),(528,'submissionId','15','int'),(528,'username','dbarnes','string'),(529,'fileId','62','int'),(529,'fileStage','4','int'),(529,'name','chapter1.pdf','string'),(529,'submissionFileId','118','int'),(529,'submissionId','15','int'),(529,'username','dbarnes','string'),(530,'fileId','63','int'),(530,'fileStage','4','int'),(530,'originalFileName','chapter2.pdf','string'),(530,'sourceSubmissionFileId','115','int'),(530,'submissionFileId','119','int'),(530,'submissionId','15','int'),(530,'username','dbarnes','string'),(531,'fileId','63','int'),(531,'fileStage','4','int'),(531,'name','chapter2.pdf','string'),(531,'submissionFileId','119','int'),(531,'submissionId','15','int'),(531,'username','dbarnes','string'),(534,'fileId','65','int'),(534,'fileStage','2','int'),(534,'originalFileName','foreward.pdf','string'),(534,'sourceSubmissionFileId',NULL,'string'),(534,'submissionFileId','120','int'),(534,'submissionId','16','int'),(534,'username','mpower','string'),(535,'fileId','65','int'),(535,'fileStage','2','int'),(535,'name','foreward.pdf','string'),(535,'submissionFileId','120','int'),(535,'submissionId','16','int'),(535,'username','mpower','string'),(536,'fileId','65','int'),(536,'fileStage','2','int'),(536,'originalFileName','foreward.pdf','string'),(536,'sourceSubmissionFileId',NULL,'string'),(536,'submissionFileId','120','int'),(536,'submissionId','16','int'),(536,'username','mpower','string'),(537,'fileId','65','int'),(537,'fileStage','2','int'),(537,'name','foreward.pdf','string'),(537,'originalFileName','foreward.pdf','string'),(537,'sourceSubmissionFileId',NULL,'string'),(537,'submissionFileId','120','int'),(537,'submissionId','16','int'),(537,'username','mpower','string'),(538,'fileId','66','int'),(538,'fileStage','2','int'),(538,'originalFileName','preface.pdf','string'),(538,'sourceSubmissionFileId',NULL,'string'),(538,'submissionFileId','121','int'),(538,'submissionId','16','int'),(538,'username','mpower','string'),(539,'fileId','66','int'),(539,'fileStage','2','int'),(539,'name','preface.pdf','string'),(539,'submissionFileId','121','int'),(539,'submissionId','16','int'),(539,'username','mpower','string'),(540,'fileId','66','int'),(540,'fileStage','2','int'),(540,'originalFileName','preface.pdf','string'),(540,'sourceSubmissionFileId',NULL,'string'),(540,'submissionFileId','121','int'),(540,'submissionId','16','int'),(540,'username','mpower','string'),(541,'fileId','66','int'),(541,'fileStage','2','int'),(541,'name','preface.pdf','string'),(541,'originalFileName','preface.pdf','string'),(541,'sourceSubmissionFileId',NULL,'string'),(541,'submissionFileId','121','int'),(541,'submissionId','16','int'),(541,'username','mpower','string'),(542,'fileId','67','int'),(542,'fileStage','2','int'),(542,'originalFileName','cases.pdf','string'),(542,'sourceSubmissionFileId',NULL,'string'),(542,'submissionFileId','122','int'),(542,'submissionId','16','int'),(542,'username','mpower','string'),(543,'fileId','67','int'),(543,'fileStage','2','int'),(543,'name','cases.pdf','string'),(543,'submissionFileId','122','int'),(543,'submissionId','16','int'),(543,'username','mpower','string'),(544,'fileId','67','int'),(544,'fileStage','2','int'),(544,'originalFileName','cases.pdf','string'),(544,'sourceSubmissionFileId',NULL,'string'),(544,'submissionFileId','122','int'),(544,'submissionId','16','int'),(544,'username','mpower','string'),(545,'fileId','67','int'),(545,'fileStage','2','int'),(545,'name','cases.pdf','string'),(545,'originalFileName','cases.pdf','string'),(545,'sourceSubmissionFileId',NULL,'string'),(545,'submissionFileId','122','int'),(545,'submissionId','16','int'),(545,'username','mpower','string'),(546,'fileId','68','int'),(546,'fileStage','2','int'),(546,'originalFileName','conclusion.pdf','string'),(546,'sourceSubmissionFileId',NULL,'string'),(546,'submissionFileId','123','int'),(546,'submissionId','16','int'),(546,'username','mpower','string'),(547,'fileId','68','int'),(547,'fileStage','2','int'),(547,'name','conclusion.pdf','string'),(547,'submissionFileId','123','int'),(547,'submissionId','16','int'),(547,'username','mpower','string'),(548,'fileId','68','int'),(548,'fileStage','2','int'),(548,'originalFileName','conclusion.pdf','string'),(548,'sourceSubmissionFileId',NULL,'string'),(548,'submissionFileId','123','int'),(548,'submissionId','16','int'),(548,'username','mpower','string'),(549,'fileId','68','int'),(549,'fileStage','2','int'),(549,'name','conclusion.pdf','string'),(549,'originalFileName','conclusion.pdf','string'),(549,'sourceSubmissionFileId',NULL,'string'),(549,'submissionFileId','123','int'),(549,'submissionId','16','int'),(549,'username','mpower','string'),(550,'fileId','69','int'),(550,'fileStage','2','int'),(550,'originalFileName','bibliography.pdf','string'),(550,'sourceSubmissionFileId',NULL,'string'),(550,'submissionFileId','124','int'),(550,'submissionId','16','int'),(550,'username','mpower','string'),(551,'fileId','69','int'),(551,'fileStage','2','int'),(551,'name','bibliography.pdf','string'),(551,'submissionFileId','124','int'),(551,'submissionId','16','int'),(551,'username','mpower','string'),(552,'fileId','69','int'),(552,'fileStage','2','int'),(552,'originalFileName','bibliography.pdf','string'),(552,'sourceSubmissionFileId',NULL,'string'),(552,'submissionFileId','124','int'),(552,'submissionId','16','int'),(552,'username','mpower','string'),(553,'fileId','69','int'),(553,'fileStage','2','int'),(553,'name','bibliography.pdf','string'),(553,'originalFileName','bibliography.pdf','string'),(553,'sourceSubmissionFileId',NULL,'string'),(553,'submissionFileId','124','int'),(553,'submissionId','16','int'),(553,'username','mpower','string'),(555,'decision','18','int'),(555,'editorId','3','int'),(555,'editorName','Daniel Barnes','string'),(555,'submissionId','16','int'),(556,'fileId','69','int'),(556,'fileStage','4','int'),(556,'originalFileName','bibliography.pdf','string'),(556,'sourceSubmissionFileId','124','int'),(556,'submissionFileId','125','int'),(556,'submissionId','16','int'),(556,'username','dbarnes','string'),(557,'fileId','69','int'),(557,'fileStage','4','int'),(557,'name','bibliography.pdf','string'),(557,'submissionFileId','125','int'),(557,'submissionId','16','int'),(557,'username','dbarnes','string'),(558,'fileId','67','int'),(558,'fileStage','4','int'),(558,'originalFileName','cases.pdf','string'),(558,'sourceSubmissionFileId','122','int'),(558,'submissionFileId','126','int'),(558,'submissionId','16','int'),(558,'username','dbarnes','string'),(559,'fileId','67','int'),(559,'fileStage','4','int'),(559,'name','cases.pdf','string'),(559,'submissionFileId','126','int'),(559,'submissionId','16','int'),(559,'username','dbarnes','string'),(560,'fileId','66','int'),(560,'fileStage','4','int'),(560,'originalFileName','preface.pdf','string'),(560,'sourceSubmissionFileId','121','int'),(560,'submissionFileId','127','int'),(560,'submissionId','16','int'),(560,'username','dbarnes','string'),(561,'fileId','66','int'),(561,'fileStage','4','int'),(561,'name','preface.pdf','string'),(561,'submissionFileId','127','int'),(561,'submissionId','16','int'),(561,'username','dbarnes','string'),(562,'fileId','65','int'),(562,'fileStage','4','int'),(562,'originalFileName','foreward.pdf','string'),(562,'sourceSubmissionFileId','120','int'),(562,'submissionFileId','128','int'),(562,'submissionId','16','int'),(562,'username','dbarnes','string'),(563,'fileId','65','int'),(563,'fileStage','4','int'),(563,'name','foreward.pdf','string'),(563,'submissionFileId','128','int'),(563,'submissionId','16','int'),(563,'username','dbarnes','string'),(564,'fileId','68','int'),(564,'fileStage','4','int'),(564,'originalFileName','conclusion.pdf','string'),(564,'sourceSubmissionFileId','123','int'),(564,'submissionFileId','129','int'),(564,'submissionId','16','int'),(564,'username','dbarnes','string'),(565,'fileId','68','int'),(565,'fileStage','4','int'),(565,'name','conclusion.pdf','string'),(565,'submissionFileId','129','int'),(565,'submissionId','16','int'),(565,'username','dbarnes','string'),(566,'reviewAssignmentId','21','int'),(566,'reviewerName','Adela Gallego','string'),(566,'round','1','int'),(566,'stageId','3','int'),(566,'submissionId','16','int'),(567,'reviewAssignmentId','22','int'),(567,'reviewerName','Al Zacharia','string'),(567,'round','1','int'),(567,'stageId','3','int'),(567,'submissionId','16','int'),(568,'reviewAssignmentId','23','int'),(568,'reviewerName','Gonzalo Favio','string'),(568,'round','1','int'),(568,'stageId','3','int'),(568,'submissionId','16','int'),(569,'reviewAssignmentId','21','int'),(569,'reviewerName','Adela Gallego','string'),(569,'round','1','int'),(569,'submissionId','16','int'),(570,'reviewAssignmentId','21','int'),(570,'reviewerName','Adela Gallego','string'),(570,'round','1','int'),(570,'submissionId','16','int'),(573,'fileId','70','int'),(573,'fileStage','2','int'),(573,'originalFileName','preface.pdf','string'),(573,'sourceSubmissionFileId',NULL,'string'),(573,'submissionFileId','130','int'),(573,'submissionId','17','int'),(573,'username','msmith','string'),(574,'fileId','70','int'),(574,'fileStage','2','int'),(574,'name','preface.pdf','string'),(574,'submissionFileId','130','int'),(574,'submissionId','17','int'),(574,'username','msmith','string'),(575,'fileId','70','int'),(575,'fileStage','2','int'),(575,'originalFileName','preface.pdf','string'),(575,'sourceSubmissionFileId',NULL,'string'),(575,'submissionFileId','130','int'),(575,'submissionId','17','int'),(575,'username','msmith','string'),(576,'fileId','70','int'),(576,'fileStage','2','int'),(576,'name','preface.pdf','string'),(576,'originalFileName','preface.pdf','string'),(576,'sourceSubmissionFileId',NULL,'string'),(576,'submissionFileId','130','int'),(576,'submissionId','17','int'),(576,'username','msmith','string'),(577,'fileId','71','int'),(577,'fileStage','2','int'),(577,'originalFileName','introduction.pdf','string'),(577,'sourceSubmissionFileId',NULL,'string'),(577,'submissionFileId','131','int'),(577,'submissionId','17','int'),(577,'username','msmith','string'),(578,'fileId','71','int'),(578,'fileStage','2','int'),(578,'name','introduction.pdf','string'),(578,'submissionFileId','131','int'),(578,'submissionId','17','int'),(578,'username','msmith','string'),(579,'fileId','71','int'),(579,'fileStage','2','int'),(579,'originalFileName','introduction.pdf','string'),(579,'sourceSubmissionFileId',NULL,'string'),(579,'submissionFileId','131','int'),(579,'submissionId','17','int'),(579,'username','msmith','string'),(580,'fileId','71','int'),(580,'fileStage','2','int'),(580,'name','introduction.pdf','string'),(580,'originalFileName','introduction.pdf','string'),(580,'sourceSubmissionFileId',NULL,'string'),(580,'submissionFileId','131','int'),(580,'submissionId','17','int'),(580,'username','msmith','string'),(581,'fileId','72','int'),(581,'fileStage','2','int'),(581,'originalFileName','chapter1.pdf','string'),(581,'sourceSubmissionFileId',NULL,'string'),(581,'submissionFileId','132','int'),(581,'submissionId','17','int'),(581,'username','msmith','string'),(582,'fileId','72','int'),(582,'fileStage','2','int'),(582,'name','chapter1.pdf','string'),(582,'submissionFileId','132','int'),(582,'submissionId','17','int'),(582,'username','msmith','string'),(583,'fileId','72','int'),(583,'fileStage','2','int'),(583,'originalFileName','chapter1.pdf','string'),(583,'sourceSubmissionFileId',NULL,'string'),(583,'submissionFileId','132','int'),(583,'submissionId','17','int'),(583,'username','msmith','string'),(584,'fileId','72','int'),(584,'fileStage','2','int'),(584,'name','chapter1.pdf','string'),(584,'originalFileName','chapter1.pdf','string'),(584,'sourceSubmissionFileId',NULL,'string'),(584,'submissionFileId','132','int'),(584,'submissionId','17','int'),(584,'username','msmith','string'),(585,'fileId','73','int'),(585,'fileStage','2','int'),(585,'originalFileName','chapter2.pdf','string'),(585,'sourceSubmissionFileId',NULL,'string'),(585,'submissionFileId','133','int'),(585,'submissionId','17','int'),(585,'username','msmith','string'),(586,'fileId','73','int'),(586,'fileStage','2','int'),(586,'name','chapter2.pdf','string'),(586,'submissionFileId','133','int'),(586,'submissionId','17','int'),(586,'username','msmith','string'),(587,'fileId','73','int'),(587,'fileStage','2','int'),(587,'originalFileName','chapter2.pdf','string'),(587,'sourceSubmissionFileId',NULL,'string'),(587,'submissionFileId','133','int'),(587,'submissionId','17','int'),(587,'username','msmith','string'),(588,'fileId','73','int'),(588,'fileStage','2','int'),(588,'name','chapter2.pdf','string'),(588,'originalFileName','chapter2.pdf','string'),(588,'sourceSubmissionFileId',NULL,'string'),(588,'submissionFileId','133','int'),(588,'submissionId','17','int'),(588,'username','msmith','string'),(589,'fileId','74','int'),(589,'fileStage','2','int'),(589,'originalFileName','chapter3.pdf','string'),(589,'sourceSubmissionFileId',NULL,'string'),(589,'submissionFileId','134','int'),(589,'submissionId','17','int'),(589,'username','msmith','string'),(590,'fileId','74','int'),(590,'fileStage','2','int'),(590,'name','chapter3.pdf','string'),(590,'submissionFileId','134','int'),(590,'submissionId','17','int'),(590,'username','msmith','string'),(591,'fileId','74','int'),(591,'fileStage','2','int'),(591,'originalFileName','chapter3.pdf','string'),(591,'sourceSubmissionFileId',NULL,'string'),(591,'submissionFileId','134','int'),(591,'submissionId','17','int'),(591,'username','msmith','string'),(592,'fileId','74','int'),(592,'fileStage','2','int'),(592,'name','chapter3.pdf','string'),(592,'originalFileName','chapter3.pdf','string'),(592,'sourceSubmissionFileId',NULL,'string'),(592,'submissionFileId','134','int'),(592,'submissionId','17','int'),(592,'username','msmith','string'),(593,'fileId','75','int'),(593,'fileStage','2','int'),(593,'originalFileName','chapter4.pdf','string'),(593,'sourceSubmissionFileId',NULL,'string'),(593,'submissionFileId','135','int'),(593,'submissionId','17','int'),(593,'username','msmith','string'),(594,'fileId','75','int'),(594,'fileStage','2','int'),(594,'name','chapter4.pdf','string'),(594,'submissionFileId','135','int'),(594,'submissionId','17','int'),(594,'username','msmith','string'),(595,'fileId','75','int'),(595,'fileStage','2','int'),(595,'originalFileName','chapter4.pdf','string'),(595,'sourceSubmissionFileId',NULL,'string'),(595,'submissionFileId','135','int'),(595,'submissionId','17','int'),(595,'username','msmith','string'),(596,'fileId','75','int'),(596,'fileStage','2','int'),(596,'name','chapter4.pdf','string'),(596,'originalFileName','chapter4.pdf','string'),(596,'sourceSubmissionFileId',NULL,'string'),(596,'submissionFileId','135','int'),(596,'submissionId','17','int'),(596,'username','msmith','string'),(598,'decision','1','int'),(598,'editorId','3','int'),(598,'editorName','Daniel Barnes','string'),(598,'submissionId','17','int'),(599,'fileId','75','int'),(599,'fileStage','19','int'),(599,'originalFileName','chapter4.pdf','string'),(599,'sourceSubmissionFileId','135','int'),(599,'submissionFileId','136','int'),(599,'submissionId','17','int'),(599,'username','dbarnes','string'),(600,'fileId','75','int'),(600,'fileStage','19','int'),(600,'name','chapter4.pdf','string'),(600,'submissionFileId','136','int'),(600,'submissionId','17','int'),(600,'username','dbarnes','string'),(601,'fileId','74','int'),(601,'fileStage','19','int'),(601,'originalFileName','chapter3.pdf','string'),(601,'sourceSubmissionFileId','134','int'),(601,'submissionFileId','137','int'),(601,'submissionId','17','int'),(601,'username','dbarnes','string'),(602,'fileId','74','int'),(602,'fileStage','19','int'),(602,'name','chapter3.pdf','string'),(602,'submissionFileId','137','int'),(602,'submissionId','17','int'),(602,'username','dbarnes','string'),(603,'fileId','73','int'),(603,'fileStage','19','int'),(603,'originalFileName','chapter2.pdf','string'),(603,'sourceSubmissionFileId','133','int'),(603,'submissionFileId','138','int'),(603,'submissionId','17','int'),(603,'username','dbarnes','string'),(604,'fileId','73','int'),(604,'fileStage','19','int'),(604,'name','chapter2.pdf','string'),(604,'submissionFileId','138','int'),(604,'submissionId','17','int'),(604,'username','dbarnes','string'),(605,'fileId','72','int'),(605,'fileStage','19','int'),(605,'originalFileName','chapter1.pdf','string'),(605,'sourceSubmissionFileId','132','int'),(605,'submissionFileId','139','int'),(605,'submissionId','17','int'),(605,'username','dbarnes','string'),(606,'fileId','72','int'),(606,'fileStage','19','int'),(606,'name','chapter1.pdf','string'),(606,'submissionFileId','139','int'),(606,'submissionId','17','int'),(606,'username','dbarnes','string'),(607,'fileId','71','int'),(607,'fileStage','19','int'),(607,'originalFileName','introduction.pdf','string'),(607,'sourceSubmissionFileId','131','int'),(607,'submissionFileId','140','int'),(607,'submissionId','17','int'),(607,'username','dbarnes','string'),(608,'fileId','71','int'),(608,'fileStage','19','int'),(608,'name','introduction.pdf','string'),(608,'submissionFileId','140','int'),(608,'submissionId','17','int'),(608,'username','dbarnes','string'),(609,'fileId','70','int'),(609,'fileStage','19','int'),(609,'originalFileName','preface.pdf','string'),(609,'sourceSubmissionFileId','130','int'),(609,'submissionFileId','141','int'),(609,'submissionId','17','int'),(609,'username','dbarnes','string'),(610,'fileId','70','int'),(610,'fileStage','19','int'),(610,'name','preface.pdf','string'),(610,'submissionFileId','141','int'),(610,'submissionId','17','int'),(610,'username','dbarnes','string'),(611,'reviewAssignmentId','24','int'),(611,'reviewerName','Julie Janssen','string'),(611,'round','1','int'),(611,'stageId','2','int'),(611,'submissionId','17','int'),(612,'reviewAssignmentId','25','int'),(612,'reviewerName','Paul Hudson','string'),(612,'round','1','int'),(612,'stageId','2','int'),(612,'submissionId','17','int');
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
INSERT INTO `files` VALUES (1,'presses/1/monographs/1/64012734b86d5.pdf','application/pdf'),(2,'presses/1/monographs/1/64012735d3314.pdf','application/pdf'),(3,'presses/1/monographs/1/6401273707341.pdf','application/pdf'),(4,'presses/1/monographs/2/6401278a233cd.pdf','application/pdf'),(5,'presses/1/monographs/2/6401278b7560a.pdf','application/pdf'),(6,'presses/1/monographs/2/6401278c9ff07.pdf','application/pdf'),(7,'presses/1/monographs/2/6401278dcfcd2.pdf','application/pdf'),(9,'presses/1/monographs/3/64012842d03db.pdf','application/pdf'),(10,'presses/1/monographs/3/64012843f2e08.pdf','application/pdf'),(11,'presses/1/monographs/3/64012845289db.pdf','application/pdf'),(12,'presses/1/monographs/3/640128464bfc2.pdf','application/pdf'),(13,'presses/1/monographs/3/6401284794fc3.pdf','application/pdf'),(14,'presses/1/monographs/4/6401287946fba.pdf','application/pdf'),(15,'presses/1/monographs/4/6401287a64843.pdf','application/pdf'),(16,'presses/1/monographs/4/6401287b8c64d.pdf','application/pdf'),(17,'presses/1/monographs/4/6401287cabeb3.pdf','application/pdf'),(18,'presses/1/monographs/5/640128fb289d7.pdf','application/pdf'),(19,'presses/1/monographs/5/640128fc490d4.pdf','application/pdf'),(20,'presses/1/monographs/5/640128fd6d42e.pdf','application/pdf'),(21,'presses/1/monographs/5/640128fe89027.pdf','application/pdf'),(22,'presses/1/monographs/5/640128ffc8ed3.pdf','application/pdf'),(23,'presses/1/monographs/5/64012900ea01e.pdf','application/pdf'),(24,'presses/1/monographs/6/640129c474d13.pdf','application/pdf'),(25,'presses/1/monographs/6/640129c58591f.pdf','application/pdf'),(26,'presses/1/monographs/6/640129c6a4fc8.pdf','application/pdf'),(27,'presses/1/monographs/6/640129c7c330a.pdf','application/pdf'),(28,'presses/1/monographs/7/64012a37f168d.pdf','application/pdf'),(29,'presses/1/monographs/7/64012a391a2c4.pdf','application/pdf'),(30,'presses/1/monographs/7/64012a3a4a8d5.pdf','application/pdf'),(31,'presses/1/monographs/7/64012a3b6fd84.pdf','application/pdf'),(32,'presses/1/monographs/7/64012a3cc12ae.pdf','application/pdf'),(33,'presses/1/monographs/8/64012a9ea4d99.pdf','application/pdf'),(34,'presses/1/monographs/9/64012aac0df2a.pdf','application/pdf'),(35,'presses/1/monographs/9/64012aad2e272.pdf','application/pdf'),(36,'presses/1/monographs/9/64012aae4a7a6.pdf','application/pdf'),(37,'presses/1/monographs/9/64012aaf74e8e.pdf','application/pdf'),(38,'presses/1/monographs/9/64012ab0c0a6e.pdf','application/pdf'),(39,'presses/1/monographs/10/64012afa2d444.pdf','application/pdf'),(40,'presses/1/monographs/10/64012afb41f53.pdf','application/pdf'),(41,'presses/1/monographs/10/64012afc82284.pdf','application/pdf'),(42,'presses/1/monographs/10/64012afdade48.pdf','application/pdf'),(43,'presses/1/monographs/10/64012afed4bc8.pdf','application/pdf'),(44,'presses/1/monographs/10/64012b000c75a.pdf','application/pdf'),(45,'presses/1/monographs/10/64012b0143f9e.pdf','application/pdf'),(46,'presses/1/monographs/10/64012b028c948.pdf','application/pdf'),(47,'presses/1/monographs/10/64012b03d0df8.pdf','application/pdf'),(48,'presses/1/monographs/11/64012b5e76cc8.pdf','application/pdf'),(49,'presses/1/monographs/11/64012b5f91181.pdf','application/pdf'),(50,'presses/1/monographs/12/64012bd9eed6a.pdf','application/pdf'),(51,'presses/1/monographs/12/64012bdb17903.pdf','application/pdf'),(52,'presses/1/monographs/12/64012bdc3cd71.pdf','application/pdf'),(53,'presses/1/monographs/13/64012c3acd290.pdf','application/pdf'),(54,'presses/1/monographs/13/64012c3c04ba5.pdf','application/pdf'),(55,'presses/1/monographs/13/64012c3d3616f.pdf','application/pdf'),(56,'presses/1/monographs/14/64012ccf31ab6.pdf','application/pdf'),(57,'presses/1/monographs/14/64012cd045592.pdf','application/pdf'),(58,'presses/1/monographs/14/64012cd164cf8.pdf','application/pdf'),(59,'presses/1/monographs/14/64012cd288f8a.pdf','application/pdf'),(60,'presses/1/monographs/14/64012cd3ccb94.pdf','application/pdf'),(61,'presses/1/monographs/14/64012cd4f0256.pdf','application/pdf'),(62,'presses/1/monographs/15/64012d94ce624.pdf','application/pdf'),(63,'presses/1/monographs/15/64012d95ec223.pdf','application/pdf'),(64,'presses/1/monographs/15/64012d9721e33.pdf','application/pdf'),(65,'presses/1/monographs/16/64012dcc847a4.pdf','application/pdf'),(66,'presses/1/monographs/16/64012dcd99a44.pdf','application/pdf'),(67,'presses/1/monographs/16/64012dceba67e.pdf','application/pdf'),(68,'presses/1/monographs/16/64012dcfd42e9.pdf','application/pdf'),(69,'presses/1/monographs/16/64012dd1267b6.pdf','application/pdf'),(70,'presses/1/monographs/17/64012e3e17a50.pdf','application/pdf'),(71,'presses/1/monographs/17/64012e3f31629.pdf','application/pdf'),(72,'presses/1/monographs/17/64012e40550af.pdf','application/pdf'),(73,'presses/1/monographs/17/64012e4176740.pdf','application/pdf'),(74,'presses/1/monographs/17/64012e42ad256.pdf','application/pdf'),(75,'presses/1/monographs/17/64012e43ce129.pdf','application/pdf');
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
INSERT INTO `genre_settings` VALUES (1,'en','name','Appendix','string'),(1,'fr_CA','name','Annexe','string'),(2,'en','name','Bibliography','string'),(2,'fr_CA','name','Bibliographie','string'),(3,'en','name','Book Manuscript','string'),(3,'fr_CA','name','Manuscrit de livre','string'),(4,'en','name','Chapter Manuscript','string'),(4,'fr_CA','name','Manuscrit de chapitre','string'),(5,'en','name','Glossary','string'),(5,'fr_CA','name','Glossaire','string'),(6,'en','name','Index','string'),(6,'fr_CA','name','Index','string'),(7,'en','name','Preface','string'),(7,'fr_CA','name','Préface','string'),(8,'en','name','Prospectus','string'),(8,'fr_CA','name','Prospectus','string'),(9,'en','name','Table','string'),(9,'fr_CA','name','Tableau','string'),(10,'en','name','Figure','string'),(10,'fr_CA','name','Figure','string'),(11,'en','name','Photo','string'),(11,'fr_CA','name','Photographie','string'),(12,'en','name','Illustration','string'),(12,'fr_CA','name','Illustration','string'),(13,'en','name','Other','string'),(13,'fr_CA','name','Autre','string'),(14,'en','name','Image','string'),(14,'fr_CA','name','Image','string'),(15,'en','name','HTML Stylesheet','string'),(15,'fr_CA','name','Feuille de style HTML','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
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
INSERT INTO `job_batches` VALUES ('9898407d-9768-4969-9223-acbdba099af8','',0,0,0,'[]','a:0:{}',NULL,1677796844,NULL);
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
  `submission_id` bigint(20) DEFAULT NULL,
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
INSERT INTO `notes` VALUES (1,1048586,1,6,'2023-03-02 22:58:34','2023-03-02 22:58:34','Editor Recommendation','<p>Dear Daniel Barnes, David Buskins,</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission The Information Literacy User’s Guide.</p><p>My recommendation is: Accept Submission.</p><p>Please visit the submission\'s <a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>Minoti Inoue</p>');
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
INSERT INTO `notifications` VALUES (14,1,0,3,16777220,'2023-03-02 22:46:33',NULL,1048585,1),(15,1,0,3,16777222,'2023-03-02 22:46:33',NULL,1048585,1),(16,1,0,3,16777223,'2023-03-02 22:46:33',NULL,1048585,1),(17,1,0,3,16777224,'2023-03-02 22:46:33',NULL,1048585,1),(18,1,1,3,16777247,'2023-03-02 22:46:33',NULL,1048585,1),(19,1,2,3,16777247,'2023-03-02 22:46:33',NULL,1048585,1),(20,1,3,3,16777247,'2023-03-02 22:46:33',NULL,1048585,1),(21,1,0,2,16777236,'2023-03-02 22:46:47','2023-03-02 22:46:52',523,1),(22,1,12,3,16777227,'2023-03-02 22:46:57',NULL,517,1),(24,1,19,2,16777230,'2023-03-02 22:47:03',NULL,1048585,1),(34,1,0,3,16777220,'2023-03-02 22:49:33',NULL,1048585,2),(35,1,0,3,16777222,'2023-03-02 22:49:33',NULL,1048585,2),(36,1,0,3,16777223,'2023-03-02 22:49:33',NULL,1048585,2),(37,1,0,3,16777224,'2023-03-02 22:49:33',NULL,1048585,2),(38,1,1,3,16777247,'2023-03-02 22:49:33',NULL,1048585,2),(39,1,2,3,16777247,'2023-03-02 22:49:33',NULL,1048585,2),(40,1,3,3,16777247,'2023-03-02 22:49:33',NULL,1048585,2),(41,1,0,2,16777236,'2023-03-02 22:50:03','2023-03-02 22:50:11',523,2),(42,1,11,3,16777227,'2023-03-02 22:50:18',NULL,517,2),(44,1,12,3,16777227,'2023-03-02 22:50:27',NULL,517,3),(56,1,0,3,16777220,'2023-03-02 22:51:23',NULL,1048585,3),(57,1,0,3,16777222,'2023-03-02 22:51:23',NULL,1048585,3),(58,1,0,3,16777223,'2023-03-02 22:51:23',NULL,1048585,3),(59,1,0,3,16777224,'2023-03-02 22:51:23',NULL,1048585,3),(60,1,1,3,16777247,'2023-03-02 22:51:23',NULL,1048585,3),(61,1,2,3,16777247,'2023-03-02 22:51:23',NULL,1048585,3),(62,1,3,3,16777247,'2023-03-02 22:51:23',NULL,1048585,3),(71,1,0,3,16777220,'2023-03-02 22:52:09',NULL,1048585,4),(72,1,0,3,16777222,'2023-03-02 22:52:09',NULL,1048585,4),(73,1,0,3,16777223,'2023-03-02 22:52:09',NULL,1048585,4),(74,1,0,3,16777224,'2023-03-02 22:52:09',NULL,1048585,4),(75,1,1,3,16777247,'2023-03-02 22:52:09',NULL,1048585,4),(76,1,2,3,16777247,'2023-03-02 22:52:09',NULL,1048585,4),(77,1,3,3,16777247,'2023-03-02 22:52:09',NULL,1048585,4),(78,1,0,2,16777236,'2023-03-02 22:52:24','2023-03-02 22:52:30',523,3),(80,1,9,3,16777227,'2023-03-02 22:52:35',NULL,517,4),(82,1,0,2,16777236,'2023-03-02 22:52:41','2023-03-02 22:52:47',523,4),(84,1,11,3,16777227,'2023-03-02 22:52:52',NULL,517,5),(88,1,22,2,16777235,'2023-03-02 22:53:16',NULL,1048585,4),(102,1,0,3,16777220,'2023-03-02 22:54:36',NULL,1048585,5),(103,1,0,3,16777222,'2023-03-02 22:54:36',NULL,1048585,5),(104,1,0,3,16777223,'2023-03-02 22:54:36',NULL,1048585,5),(105,1,0,3,16777224,'2023-03-02 22:54:36',NULL,1048585,5),(106,1,1,3,16777247,'2023-03-02 22:54:36',NULL,1048585,5),(107,1,2,3,16777247,'2023-03-02 22:54:36',NULL,1048585,5),(108,1,3,3,16777247,'2023-03-02 22:54:36',NULL,1048585,5),(109,1,0,2,16777236,'2023-03-02 22:54:53','2023-03-02 22:54:59',523,5),(111,1,8,3,16777227,'2023-03-02 22:55:04',NULL,517,6),(113,1,0,2,16777236,'2023-03-02 22:55:12','2023-03-02 22:55:17',523,6),(115,1,12,3,16777227,'2023-03-02 22:55:23',NULL,517,7),(119,1,23,2,16777235,'2023-03-02 22:55:50',NULL,1048585,5),(122,1,0,2,16777246,'2023-03-02 22:56:34','2023-03-02 22:56:44',1048585,5),(138,1,0,2,16777236,'2023-03-02 22:57:56','2023-03-02 22:58:02',523,7),(139,1,24,2,16777229,'2023-03-02 22:57:56',NULL,1048585,6),(143,1,3,3,16777249,'2023-03-02 22:58:34',NULL,1048586,1),(144,1,4,3,16777249,'2023-03-02 22:58:34',NULL,1048586,1),(155,1,0,3,16777220,'2023-03-02 22:59:47',NULL,1048585,7),(156,1,0,3,16777222,'2023-03-02 22:59:47',NULL,1048585,7),(157,1,0,3,16777223,'2023-03-02 22:59:47',NULL,1048585,7),(158,1,0,3,16777224,'2023-03-02 22:59:47',NULL,1048585,7),(159,1,1,3,16777247,'2023-03-02 22:59:47',NULL,1048585,7),(160,1,2,3,16777247,'2023-03-02 22:59:47',NULL,1048585,7),(161,1,3,3,16777247,'2023-03-02 22:59:47',NULL,1048585,7),(162,1,0,2,16777236,'2023-03-02 23:00:04','2023-03-02 23:00:10',523,8),(163,1,10,3,16777227,'2023-03-02 23:00:16',NULL,517,8),(165,1,25,2,16777230,'2023-03-02 23:00:23',NULL,1048585,7),(167,1,1,3,16777247,'2023-03-02 23:00:47',NULL,1048585,8),(168,1,2,3,16777247,'2023-03-02 23:00:47',NULL,1048585,8),(169,1,3,3,16777247,'2023-03-02 23:00:47',NULL,1048585,8),(180,1,0,3,16777220,'2023-03-02 23:01:43',NULL,1048585,9),(181,1,0,3,16777222,'2023-03-02 23:01:43',NULL,1048585,9),(182,1,0,3,16777223,'2023-03-02 23:01:43',NULL,1048585,9),(183,1,0,3,16777224,'2023-03-02 23:01:43',NULL,1048585,9),(184,1,1,3,16777247,'2023-03-02 23:01:43',NULL,1048585,9),(185,1,2,3,16777247,'2023-03-02 23:01:43',NULL,1048585,9),(186,1,3,3,16777247,'2023-03-02 23:01:43',NULL,1048585,9),(187,1,0,2,16777236,'2023-03-02 23:01:59','2023-03-02 23:02:05',523,9),(188,1,26,2,16777229,'2023-03-02 23:01:59',NULL,1048585,9),(207,1,0,3,16777220,'2023-03-02 23:03:45',NULL,1048585,10),(208,1,0,3,16777222,'2023-03-02 23:03:45',NULL,1048585,10),(209,1,0,3,16777223,'2023-03-02 23:03:45',NULL,1048585,10),(210,1,0,3,16777224,'2023-03-02 23:03:45',NULL,1048585,10),(211,1,1,3,16777247,'2023-03-02 23:03:45',NULL,1048585,10),(212,1,2,3,16777247,'2023-03-02 23:03:45',NULL,1048585,10),(213,1,3,3,16777247,'2023-03-02 23:03:45',NULL,1048585,10),(218,1,0,3,16777220,'2023-03-02 23:04:11',NULL,1048585,11),(219,1,0,3,16777222,'2023-03-02 23:04:11',NULL,1048585,11),(220,1,0,3,16777223,'2023-03-02 23:04:11',NULL,1048585,11),(221,1,0,3,16777224,'2023-03-02 23:04:11',NULL,1048585,11),(222,1,1,3,16777247,'2023-03-02 23:04:11',NULL,1048585,11),(223,1,2,3,16777247,'2023-03-02 23:04:11',NULL,1048585,11),(224,1,3,3,16777247,'2023-03-02 23:04:11',NULL,1048585,11),(225,1,0,2,16777236,'2023-03-02 23:04:25','2023-03-02 23:04:29',523,10),(227,1,9,3,16777227,'2023-03-02 23:04:35',NULL,517,9),(229,1,0,2,16777236,'2023-03-02 23:04:40','2023-03-02 23:04:45',523,11),(235,1,28,2,16777230,'2023-03-02 23:05:42',NULL,1048585,11),(242,1,0,3,16777220,'2023-03-02 23:06:28',NULL,1048585,12),(243,1,0,3,16777222,'2023-03-02 23:06:28',NULL,1048585,12),(244,1,0,3,16777223,'2023-03-02 23:06:28',NULL,1048585,12),(245,1,0,3,16777224,'2023-03-02 23:06:28',NULL,1048585,12),(246,1,1,3,16777247,'2023-03-02 23:06:28',NULL,1048585,12),(247,1,2,3,16777247,'2023-03-02 23:06:28',NULL,1048585,12),(248,1,3,3,16777247,'2023-03-02 23:06:28',NULL,1048585,12),(249,1,0,2,16777236,'2023-03-02 23:06:44','2023-03-02 23:06:50',523,12),(250,1,29,2,16777229,'2023-03-02 23:06:45',NULL,1048585,12),(251,1,7,3,16777227,'2023-03-02 23:06:55',NULL,517,12),(255,1,9,3,16777227,'2023-03-02 23:07:11',NULL,517,14),(263,1,0,3,16777220,'2023-03-02 23:08:03',NULL,1048585,13),(264,1,0,3,16777222,'2023-03-02 23:08:03',NULL,1048585,13),(265,1,0,3,16777223,'2023-03-02 23:08:03',NULL,1048585,13),(266,1,0,3,16777224,'2023-03-02 23:08:03',NULL,1048585,13),(267,1,1,3,16777247,'2023-03-02 23:08:03',NULL,1048585,13),(268,1,2,3,16777247,'2023-03-02 23:08:03',NULL,1048585,13),(269,1,3,3,16777247,'2023-03-02 23:08:03',NULL,1048585,13),(270,1,0,2,16777236,'2023-03-02 23:08:18','2023-03-02 23:08:23',523,13),(272,1,8,3,16777227,'2023-03-02 23:08:29',NULL,517,15),(274,1,0,2,16777236,'2023-03-02 23:08:35','2023-03-02 23:08:40',523,14),(278,1,11,3,16777227,'2023-03-02 23:08:53',NULL,517,17),(282,1,30,2,16777230,'2023-03-02 23:09:49',NULL,1048585,13),(291,1,0,3,16777220,'2023-03-02 23:10:43',NULL,1048585,14),(292,1,0,3,16777222,'2023-03-02 23:10:43',NULL,1048585,14),(293,1,0,3,16777223,'2023-03-02 23:10:43',NULL,1048585,14),(294,1,0,3,16777224,'2023-03-02 23:10:43',NULL,1048585,14),(295,1,1,3,16777247,'2023-03-02 23:10:43',NULL,1048585,14),(296,1,2,3,16777247,'2023-03-02 23:10:43',NULL,1048585,14),(297,1,3,3,16777247,'2023-03-02 23:10:43',NULL,1048585,14),(298,1,0,2,16777236,'2023-03-02 23:11:00','2023-03-02 23:11:06',523,15),(300,1,7,3,16777227,'2023-03-02 23:11:12',NULL,517,19),(302,1,0,2,16777236,'2023-03-02 23:11:19','2023-03-02 23:11:24',523,16),(304,1,11,3,16777227,'2023-03-02 23:11:30',NULL,517,20),(308,1,31,2,16777235,'2023-03-02 23:11:54',NULL,1048585,14),(311,1,0,2,16777246,'2023-03-02 23:13:10',NULL,1048585,14),(318,1,0,3,16777220,'2023-03-02 23:13:46',NULL,1048585,15),(319,1,0,3,16777222,'2023-03-02 23:13:46',NULL,1048585,15),(320,1,0,3,16777223,'2023-03-02 23:13:46',NULL,1048585,15),(321,1,0,3,16777224,'2023-03-02 23:13:46',NULL,1048585,15),(322,1,1,3,16777247,'2023-03-02 23:13:46',NULL,1048585,15),(323,1,2,3,16777247,'2023-03-02 23:13:46',NULL,1048585,15),(324,1,3,3,16777247,'2023-03-02 23:13:46',NULL,1048585,15),(325,1,0,2,16777236,'2023-03-02 23:14:02','2023-03-02 23:14:07',523,17),(336,1,0,3,16777220,'2023-03-02 23:14:58',NULL,1048585,16),(337,1,0,3,16777222,'2023-03-02 23:14:58',NULL,1048585,16),(338,1,0,3,16777223,'2023-03-02 23:14:58',NULL,1048585,16),(339,1,0,3,16777224,'2023-03-02 23:14:58',NULL,1048585,16),(340,1,1,3,16777247,'2023-03-02 23:14:58',NULL,1048585,16),(341,1,2,3,16777247,'2023-03-02 23:14:58',NULL,1048585,16),(342,1,3,3,16777247,'2023-03-02 23:14:58',NULL,1048585,16),(343,1,0,2,16777236,'2023-03-02 23:15:17','2023-03-02 23:15:23',523,18),(346,1,11,3,16777227,'2023-03-02 23:15:36',NULL,517,22),(348,1,12,3,16777227,'2023-03-02 23:15:44',NULL,517,23),(362,1,0,3,16777220,'2023-03-02 23:17:10',NULL,1048585,17),(363,1,0,3,16777222,'2023-03-02 23:17:10',NULL,1048585,17),(364,1,0,3,16777223,'2023-03-02 23:17:10',NULL,1048585,17),(365,1,0,3,16777224,'2023-03-02 23:17:10',NULL,1048585,17),(366,1,1,3,16777247,'2023-03-02 23:17:10',NULL,1048585,17),(367,1,2,3,16777247,'2023-03-02 23:17:10',NULL,1048585,17),(368,1,3,3,16777247,'2023-03-02 23:17:10',NULL,1048585,17),(369,1,0,2,16777236,'2023-03-02 23:17:29','2023-03-02 23:17:36',523,19),(370,1,34,2,16777229,'2023-03-02 23:17:29',NULL,1048585,17),(371,1,7,3,16777227,'2023-03-02 23:17:42',NULL,517,24),(373,1,8,3,16777227,'2023-03-02 23:17:50',NULL,517,25);
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
INSERT INTO `plugin_settings` VALUES ('acronplugin',0,'crontab','[{\"className\":\"PKP\\\\task\\\\ReviewReminder\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\PublishSubmissions\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\RemoveUnvalidatedExpiredUsers\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\UpdateIPGeoDB\",\"frequency\":{\"day\":\"10\"},\"args\":[]},{\"className\":\"APP\\\\tasks\\\\UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\EditorialReminders\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"PKP\\\\task\\\\ProcessQueueJobs\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"PKP\\\\task\\\\RemoveFailedJobs\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]','object'),('acronplugin',0,'enabled','1','bool'),('browseblockplugin',1,'browseCategories','1','bool'),('browseblockplugin',1,'browseNewReleases','1','bool'),('browseblockplugin',1,'browseSeries','1','bool'),('browseblockplugin',1,'context','1','int'),('browseblockplugin',1,'enabled','1','bool'),('browseblockplugin',1,'seq','1','int'),('defaultthemeplugin',0,'enabled','1','bool'),('defaultthemeplugin',1,'baseColour','#1E6292','string'),('defaultthemeplugin',1,'displayStats','none','string'),('defaultthemeplugin',1,'enabled','1','bool'),('defaultthemeplugin',1,'showCatalogSeriesListing','false','string'),('defaultthemeplugin',1,'typography','notoSans','string'),('defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),('developedbyblockplugin',0,'context','1','int'),('developedbyblockplugin',0,'enabled','0','bool'),('developedbyblockplugin',0,'seq','0','int'),('developedbyblockplugin',1,'context','1','int'),('developedbyblockplugin',1,'enabled','0','bool'),('developedbyblockplugin',1,'seq','0','int'),('dublincoremetaplugin',1,'enabled','1','bool'),('googlescholarplugin',1,'enabled','1','bool'),('htmlmonographfileplugin',1,'enabled','1','bool'),('informationblockplugin',1,'context','1','int'),('informationblockplugin',1,'enabled','1','bool'),('informationblockplugin',1,'seq','7','int'),('languagetoggleblockplugin',0,'context','1','int'),('languagetoggleblockplugin',0,'enabled','1','bool'),('languagetoggleblockplugin',0,'seq','4','int'),('languagetoggleblockplugin',1,'context','1','int'),('languagetoggleblockplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',1,'seq','4','int'),('pdfjsviewerplugin',1,'enabled','1','bool'),('tinymceplugin',0,'enabled','1','bool'),('tinymceplugin',1,'enabled','1','bool'),('usageeventplugin',0,'enabled','1','bool'),('usageeventplugin',0,'uniqueSiteId','','string'),('webfeedplugin',1,'displayItems','1','bool'),('webfeedplugin',1,'displayPage','homepage','string'),('webfeedplugin',1,'enabled','1','bool');
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
INSERT INTO `press_settings` VALUES (1,'','contactEmail','rvaca@mailinator.com',NULL),(1,'','contactName','Ramiro Vaca',NULL),(1,'','country','IS',NULL),(1,'','coverThumbnailsMaxHeight','100',NULL),(1,'','coverThumbnailsMaxWidth','106',NULL),(1,'','defaultReviewMode','2',NULL),(1,'','disableSubmissions','0',NULL),(1,'','doiCreationTime','copyEditCreationTime',NULL),(1,'','doiSuffixType','default',NULL),(1,'','doiVersioning','0',NULL),(1,'','editorialStatsEmail','1',NULL),(1,'','emailSignature','<br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a>.</p>',NULL),(1,'','enabledDoiTypes','[\"publication\"]',NULL),(1,'','enableDois','1',NULL),(1,'','enableGeoUsageStats','disabled',NULL),(1,'','enableInstitutionUsageStats','0',NULL),(1,'','isSushiApiPublic','1',NULL),(1,'','itemsPerPage','25',NULL),(1,'','keywords','request',NULL),(1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada',NULL),(1,'','notifyAllAuthors','1',NULL),(1,'','numPageLinks','10',NULL),(1,'','numWeeksPerResponse','4',NULL),(1,'','numWeeksPerReview','4',NULL),(1,'','paymentPluginName','ManualPayment',NULL),(1,'','registrationAgency','',NULL),(1,'','submissionAcknowledgement','allAuthors',NULL),(1,'','submitWithCategories','0',NULL),(1,'','supportedFormLocales','[\"en\",\"fr_CA\"]',NULL),(1,'','supportedLocales','[\"en\",\"fr_CA\"]',NULL),(1,'','supportedSubmissionLocales','[\"en\",\"fr_CA\"]',NULL),(1,'','supportEmail','rvaca@mailinator.com',NULL),(1,'','supportName','Ramiro Vaca',NULL),(1,'','themePluginPath','default',NULL),(1,'','type','enable',NULL),(1,'en','acronym','JPK',NULL),(1,'en','authorGuidelines','<p>Authors are invited to make a submission to this press. Those submissions considered to be a good fit will be sent for peer review before determining whether they will be accepted or rejected.</p><p>Before making a submission, authors are responsible for obtaining permission to publish any material included with the submission, such as photos, documents and datasets. All authors identified on the submission must consent to be identified as an author. Where appropriate, research should be approved by an appropriate ethics committee in accordance with the legal requirements of the study\'s country.</p><p>An editor may desk reject a submission if it does not meet minimum standards of quality. Before submitting, please ensure that the scope and outline of the book are structured and articulated properly. The title should be concise and the abstract should be able to stand on its own. This will increase the likelihood of reviewers agreeing to review the book. When you\'re satisfied that your submission meets this standard, please follow the checklist below to prepare your submission.</p>',NULL),(1,'en','authorInformation','Interested in submitting to this press? We recommend that you review the <a href=\"http://localhost/index.php/publicknowledge/about\">About the Press</a> page for the press\' section policies and <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.php/publicknowledge/user/register\">register</a> with the press prior to submitting, or if already registered can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the 5 step process.',NULL),(1,'en','beginSubmissionHelp','<p>Thank you for submitting to the Public Knowledge Press. You will be asked to upload files, identify co-authors, and provide information such as the title and abstract.<p><p>Please read our <a href=\"http://localhost/index.php/publicknowledge/about/submissions\" target=\"_blank\">Submission Guidelines</a> if you have not done so already. When filling out the forms, provide as many details as possible in order to help our editors evaluate your work.</p><p>Once you begin, you can save your submission and come back to it later. You will be able to review and correct any information before you submit.</p>',NULL),(1,'en','contributorsHelp','<p>Add details for all of the contributors to this submission. Contributors added here will be sent an email confirmation of the submission, as well as a copy of all editorial decisions recorded against this submission.</p><p>If a contributor can not be contacted by email, because they must remain anonymous or do not have an email account, please do not enter a fake email address. You can add information about this contributor in a message to the editor at a later step in the submission process.</p>',NULL),(1,'en','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">',NULL),(1,'en','description','<p>Public Knowledge Press is a publisher dedicated to the subject of public access to science.</p>',NULL),(1,'en','detailsHelp','<p>Please provide the following details to help us manage your submission in our system.</p>',NULL),(1,'en','forTheEditorsHelp','<p>Please provide the following details in order to help our editorial team manage your submission.</p><p>When entering metadata, provide entries that you think would be most helpful to the person managing your submission. This information can be changed before publication.</p>',NULL),(1,'en','librarianInformation','We encourage research librarians to list this press among their library\'s electronic press holdings. As well, this open source publishing system is suitable for libraries to host for their faculty members to use with presses they are involved in editing (see <a href=\"https://pkp.sfu.ca/omp\">Open Monograph Press</a>).',NULL),(1,'en','name','Public Knowledge Press',NULL),(1,'en','openAccessPolicy','This press provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),(1,'en','privacyStatement','<p>The names and email addresses entered in this press site will be used exclusively for the stated purposes of this press and will not be made available for any other purpose or to any other party.</p>',NULL),(1,'en','readerInformation','We encourage readers to sign up for the publishing notification service for this press. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the homepage for the press. This registration will result in the reader receiving the Table of Contents by email for each new monograph of the press. This list also allows the press to claim a certain level of support or readership. See the press <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a> which assures readers that their name and email address will not be used for other purposes.',NULL),(1,'en','reviewHelp','<p>Review the information you have entered before you complete your submission. You can change any of the details displayed here by clicking the edit button at the top of each section.</p><p>Once you complete your submission, a member of our editorial team will be assigned to review it. Please ensure the details you have entered here are as accurate as possible.</p>',NULL),(1,'en','searchDescription','Public Knowledge Press is a publisher dedicated to the subject of public access to science.',NULL),(1,'en','submissionChecklist','<p>All submissions must meet the following requirements.</p><ul><li>This submission meets the requirements outlined in the <a href=\"http://localhost/index.php/publicknowledge/about/submissions\">Author Guidelines</a>.</li><li>This submission has not been previously published, nor is it before another press for consideration.</li><li>All references have been checked for accuracy and completeness.</li><li>All tables and figures have been numbered and labeled.</li><li>Permission has been obtained to publish all photos, datasets and other material provided with this submission.</li></ul>',NULL),(1,'en','uploadFilesHelp','<p>Provide any files our editorial team may need to evaluate your submission. In addition to the main work, you may wish to submit data sets, conflict of interest statements, or other supplementary files if these will be helpful for our editors.</p>',NULL),(1,'fr_CA','authorGuidelines','##default.contextSettings.authorGuidelines##',NULL),(1,'fr_CA','authorInformation','Vous souhaitez soumettre une contribution à cette presse ? Nous vous recommandons de lire la page\n <a href=\"http://localhost/index.php/publicknowledge/about\">À propos de cette presse</a> pour connaitre ses règlements et la page\n <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Lignes directrices à l\'intention des auteurs-es</a>. Les auteurs-es doivent <a href=\"http://localhost/index.php/publicknowledge/user/register\">s\'inscrire</a> auprès de la presse avant d\'envoyer une soumission. Si vous êtes déjà inscrit-e, il suffit simplement <a href=\"http://localhost/index.php/index/login\">d\'ouvrir une session</a> pour débuter la procédure en 5 étapes.',NULL),(1,'fr_CA','beginSubmissionHelp','##default.submission.step.beforeYouBegin##',NULL),(1,'fr_CA','contributorsHelp','##default.submission.step.contributors##',NULL),(1,'fr_CA','description','<p>Le Press de Public Knowledge est une presse sur le thème de l\'accès du public à la science.</p>',NULL),(1,'fr_CA','detailsHelp','##default.submission.step.details##',NULL),(1,'fr_CA','forTheEditorsHelp','##default.submission.step.forTheEditors##',NULL),(1,'fr_CA','librarianInformation','Nous encourageons les bibliothécaires de recherche à ajouter cette presse à la liste électronique des ressources documentaires de la bibliothèque. De plus, ce système d\'édition à libre accès convient à toutes les bibliothèques et permet aux membres des facultés de l\'utiliser pour les presses auxquelles ils contribuent à titre de rédacteur en chef. (voir <a href=\"http://pkp.sfu.ca/omp\">Open Monograph Press</a>).',NULL),(1,'fr_CA','name','Press de la connaissance du public',NULL),(1,'fr_CA','openAccessPolicy','Cette presse offre un accès libre immédiat à son contenu en partant du principe que la recherche doit être accessible au grand public, car cela favorise un meilleur échange des connaissances à l\'échelle mondiale.',NULL),(1,'fr_CA','privacyStatement','<p>Les noms et adresses courriel saisis sur ce site de presse seront utilisés exclusivement pour les fins convenues de cette presse. Ils ne seront pas utilisés pour d\'autres fins ou transmis à une tierce partie.</p>',NULL),(1,'fr_CA','readerInformation','Nous encourageons les lecteurs à s\'abonner au service d\'avis de publication de cette presse. Utilisez le lien <a href=\"http://localhost/index.php/publicknowledge/user/register\">d\'inscription</a> situé en haut de la page d\'accueil de la presse. Cette inscription permettra au lecteur de recevoir la table des matières de chaque nouvelle monographie de cette presse par courriel. Cette liste permet également à la presse d\'affirmer qu\'elle compte un certain nombre de lecteurs. Consultez <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">l\'énoncé de confidentialité </a> de la presse, lequel stipule que les noms et adresses courriel de ses lecteurs ne seront pas utilisés à d\'autres fins.',NULL),(1,'fr_CA','reviewHelp','##default.submission.step.review##',NULL),(1,'fr_CA','submissionChecklist','##default.contextSettings.checklist##',NULL),(1,'fr_CA','uploadFilesHelp','##default.submission.step.uploadFiles##',NULL);
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
INSERT INTO `publication_format_settings` VALUES (1,'en','name','PDF','string'),(1,'fr_CA','name','','string'),(2,'en','name','PDF','string'),(2,'fr_CA','name','','string'),(3,'en','name','PDF','string'),(3,'fr_CA','name','','string');
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
INSERT INTO `publication_settings` VALUES (1,'','categoryIds','[]'),(1,'en','abstract','The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities―and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.'),(1,'en','title','The ABCs of Human Survival: A Paradigm for Global Citizenship'),(2,'','categoryIds','[]'),(2,'en','abstract','<p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p>'),(2,'en','title','The West and Beyond: New Perspectives on an Imagined Region'),(2,'fr_CA','title',''),(3,'','categoryIds','[]'),(3,'en','abstract','Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.'),(3,'en','title','The Political Economy of Workplace Injury in Canada'),(4,'','categoryIds','[]'),(4,'en','abstract','What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.'),(4,'en','title','How Canadians Communicate: Contexts of Canadian Popular Culture'),(5,'','categoryIds','[]'),(5,'','copyrightYear','2023'),(5,'en','abstract','Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.'),(5,'en','copyrightHolder','Public Knowledge Press'),(5,'en','title','Bomb Canada and Other Unkind Remarks in the American Media'),(5,'fr_CA','copyrightHolder','Press de la connaissance du public'),(6,'','categoryIds','[]'),(6,'en','abstract','Good researchers have a host of tools at their disposal that make navigating today’s complex information ecosystem much more manageable. Gaining the knowledge, abilities, and self-reflection necessary to be a good researcher helps not only in academic settings, but is invaluable in any career, and throughout one’s life. The Information Literacy User’s Guide will start you on this route to success.'),(6,'en','title','The Information Literacy User’s Guide'),(7,'','categoryIds','[]'),(7,'en','abstract','Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.'),(7,'en','title','Accessible Elements: Teaching Science Online and at a Distance'),(8,'','categoryIds','[]'),(8,'en','abstract','A Note From The Publisher'),(8,'en','title','Editorial'),(9,'','categoryIds','[]'),(9,'en','abstract','In recent years, the Internet and other network technologies have emerged as a central issue for development in Latin America and the Caribbean. They have shown their potential to increase productivity and economic competitiveness, to create new ways to deliver education and health services, and to be driving forces for the modernization of the provision of public services.'),(9,'en','title','Enabling Openness: The future of the information society in Latin America and the Caribbean'),(10,'','categoryIds','[]'),(10,'en','abstract','While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.'),(10,'en','title','Lost Tracks: Buffalo National Park, 1909-1939'),(11,'','categoryIds','[]'),(11,'en','abstract','Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.'),(11,'en','title','Dreamwork'),(12,'','categoryIds','[]'),(12,'en','abstract','Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.'),(12,'en','title','Connecting ICTs to Development'),(13,'','categoryIds','[]'),(13,'en','abstract','This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.'),(13,'en','title','Mobile Learning: Transforming the Delivery of Education and Training'),(14,'','categoryIds','[]'),(14,'','copyrightYear','2023'),(14,'en','abstract','From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.'),(14,'en','copyrightHolder','Public Knowledge Press'),(14,'en','title','From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots'),(14,'fr_CA','copyrightHolder','Press de la connaissance du public'),(15,'','categoryIds','[]'),(15,'en','abstract','A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.'),(15,'en','title','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978'),(16,'','categoryIds','[]'),(16,'en','abstract','Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.'),(16,'en','title','A Designer\'s Log: Case Studies in Instructional Design'),(17,'','categoryIds','[]'),(17,'en','abstract','The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.'),(17,'en','title','Open Development: Networked Innovations in International Development');
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
INSERT INTO `publications` VALUES (1,NULL,'2023-03-02 22:46:09',1,'pub','publication',0.00,1,NULL,1,1,NULL,1,NULL),(2,NULL,'2023-03-02 22:47:37',2,'pub','publication',0.00,NULL,NULL,2,1,NULL,1,NULL),(3,NULL,'2023-03-02 22:50:39',11,'pub','publication',0.00,NULL,NULL,3,1,NULL,1,NULL),(4,NULL,'2023-03-02 22:51:34',12,'pub','publication',0.00,3,NULL,4,1,NULL,1,NULL),(5,'2023-03-02','2023-03-02 22:56:55',16,'pub','publication',0.00,NULL,NULL,5,3,NULL,1,NULL),(6,NULL,'2023-03-02 22:57:05',17,'pub','publication',0.00,1,NULL,6,1,NULL,1,NULL),(7,NULL,'2023-03-02 22:59:00',21,'pub','publication',0.00,4,NULL,7,1,NULL,1,NULL),(8,NULL,'2023-03-02 23:00:43',NULL,'pub','publication',0.00,NULL,NULL,8,1,NULL,1,NULL),(9,NULL,'2023-03-02 23:00:56',26,'pub','publication',0.00,1,NULL,9,1,NULL,1,NULL),(10,NULL,'2023-03-02 23:02:14',31,'pub','publication',0.00,NULL,NULL,10,1,NULL,1,NULL),(11,NULL,'2023-03-02 23:03:55',32,'pub','publication',0.00,NULL,NULL,11,1,NULL,1,NULL),(12,NULL,'2023-03-02 23:05:58',33,'pub','publication',0.00,NULL,NULL,12,1,NULL,1,NULL),(13,NULL,'2023-03-02 23:07:35',41,'pub','publication',0.00,NULL,NULL,13,1,NULL,1,NULL),(14,'2023-03-02','2023-03-02 23:13:10',45,'pub','publication',0.00,5,NULL,14,3,NULL,1,NULL),(15,NULL,'2023-03-02 23:13:21',48,'pub','publication',0.00,NULL,NULL,15,1,NULL,1,NULL),(16,NULL,'2023-03-02 23:14:17',49,'pub','publication',0.00,NULL,NULL,16,1,NULL,1,NULL),(17,NULL,'2023-03-02 23:16:10',50,'pub','publication',0.00,NULL,NULL,17,1,NULL,1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignments`
--

LOCK TABLES `review_assignments` WRITE;
/*!40000 ALTER TABLE `review_assignments` DISABLE KEYS */;
INSERT INTO `review_assignments` VALUES (1,1,12,NULL,NULL,'2023-03-02 22:46:57','2023-03-02 22:46:57',NULL,NULL,NULL,'2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 22:46:57',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,0,NULL,0,0),(2,2,11,NULL,NULL,'2023-03-02 22:50:18','2023-03-02 22:50:18',NULL,NULL,NULL,'2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 22:50:18',0,0,0,NULL,NULL,NULL,NULL,2,3,1,1,0,NULL,0,0),(3,2,12,NULL,NULL,'2023-03-02 22:50:27','2023-03-02 22:50:27',NULL,NULL,NULL,'2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 22:50:27',0,0,0,NULL,NULL,NULL,NULL,2,3,2,1,0,NULL,0,0),(4,4,9,NULL,NULL,'2023-03-02 22:52:35','2023-03-02 22:52:35',NULL,NULL,NULL,'2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 22:52:35',0,0,0,NULL,NULL,NULL,NULL,3,2,2,1,0,NULL,0,0),(5,4,11,NULL,NULL,'2023-03-02 22:52:52','2023-03-02 22:52:52',NULL,NULL,NULL,'2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 22:52:52',0,0,0,NULL,NULL,NULL,NULL,4,3,2,1,0,NULL,0,0),(6,5,8,NULL,NULL,'2023-03-02 22:55:04','2023-03-02 22:55:05',NULL,NULL,NULL,'2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 22:55:05',0,0,0,NULL,NULL,NULL,NULL,5,2,2,1,0,NULL,0,0),(7,5,12,NULL,NULL,'2023-03-02 22:55:23','2023-03-02 22:55:23',NULL,NULL,NULL,'2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 22:55:23',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,0,NULL,0,0),(8,7,10,NULL,NULL,'2023-03-02 23:00:16','2023-03-02 23:00:16',NULL,NULL,NULL,'2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 23:00:16',0,0,0,NULL,NULL,NULL,NULL,8,3,2,1,0,NULL,0,0),(9,11,9,NULL,NULL,'2023-03-02 23:04:35','2023-03-02 23:04:35',NULL,NULL,NULL,'2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 23:04:35',0,0,0,NULL,NULL,NULL,NULL,10,2,2,1,0,NULL,0,0),(10,11,10,NULL,0,'2023-03-02 23:04:51','2023-03-02 23:04:51','2023-03-02 23:05:06','2023-03-02 23:05:11','2023-03-02 23:05:42','2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 23:05:42',0,0,0,NULL,NULL,NULL,NULL,11,3,2,1,4,NULL,0,0),(11,11,12,NULL,0,'2023-03-02 23:04:58','2023-03-02 23:04:58','2023-03-02 23:05:18','2023-03-02 23:05:23','2023-03-02 23:05:42','2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 23:05:42',0,0,0,NULL,NULL,NULL,NULL,11,3,2,1,4,NULL,0,0),(12,12,7,NULL,NULL,'2023-03-02 23:06:55','2023-03-02 23:06:55',NULL,NULL,NULL,'2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 23:06:55',0,0,0,NULL,NULL,NULL,NULL,12,2,2,1,0,NULL,0,0),(13,12,8,NULL,0,'2023-03-02 23:07:03','2023-03-02 23:07:03','2023-03-02 23:07:19','2023-03-02 23:07:24',NULL,'2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 23:07:24',0,0,0,NULL,NULL,NULL,NULL,12,2,2,1,4,NULL,0,0),(14,12,9,NULL,NULL,'2023-03-02 23:07:11','2023-03-02 23:07:11',NULL,NULL,NULL,'2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 23:07:11',0,0,0,NULL,NULL,NULL,NULL,12,2,2,1,0,NULL,0,0),(15,13,8,NULL,NULL,'2023-03-02 23:08:29','2023-03-02 23:08:29',NULL,NULL,NULL,'2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 23:08:29',0,0,0,NULL,NULL,NULL,NULL,13,2,2,1,0,NULL,0,0),(16,13,10,NULL,0,'2023-03-02 23:08:46','2023-03-02 23:08:46','2023-03-02 23:09:10','2023-03-02 23:09:16','2023-03-02 23:09:49','2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 23:09:49',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,4,NULL,0,0),(17,13,11,NULL,NULL,'2023-03-02 23:08:53','2023-03-02 23:08:53',NULL,NULL,NULL,'2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 23:08:53',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,0,NULL,0,0),(18,13,12,NULL,0,'2023-03-02 23:09:02','2023-03-02 23:09:02','2023-03-02 23:09:23','2023-03-02 23:09:28','2023-03-02 23:09:49','2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 23:09:49',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,4,NULL,0,0),(19,14,7,NULL,NULL,'2023-03-02 23:11:12','2023-03-02 23:11:12',NULL,NULL,NULL,'2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 23:11:12',0,0,0,NULL,NULL,NULL,NULL,15,2,2,1,0,NULL,0,0),(20,14,11,NULL,NULL,'2023-03-02 23:11:30','2023-03-02 23:11:30',NULL,NULL,NULL,'2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 23:11:30',0,0,0,NULL,NULL,NULL,NULL,16,3,2,1,0,NULL,0,0),(21,16,10,NULL,0,'2023-03-02 23:15:28','2023-03-02 23:15:28','2023-03-02 23:15:54','2023-03-02 23:16:00',NULL,'2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 23:16:00',0,0,0,NULL,NULL,NULL,NULL,18,3,2,1,4,NULL,0,0),(22,16,11,NULL,NULL,'2023-03-02 23:15:36','2023-03-02 23:15:36',NULL,NULL,NULL,'2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 23:15:36',0,0,0,NULL,NULL,NULL,NULL,18,3,2,1,0,NULL,0,0),(23,16,12,NULL,NULL,'2023-03-02 23:15:44','2023-03-02 23:15:45',NULL,NULL,NULL,'2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 23:15:45',0,0,0,NULL,NULL,NULL,NULL,18,3,2,1,0,NULL,0,0),(24,17,7,NULL,NULL,'2023-03-02 23:17:42','2023-03-02 23:17:42',NULL,NULL,NULL,'2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 23:17:42',0,0,0,NULL,NULL,NULL,NULL,19,2,2,1,0,NULL,0,0),(25,17,8,NULL,NULL,'2023-03-02 23:17:50','2023-03-02 23:17:50',NULL,NULL,NULL,'2023-03-30 00:00:00','2023-03-30 00:00:00','2023-03-02 23:17:50',0,0,0,NULL,NULL,NULL,NULL,19,2,2,1,0,NULL,0,0);
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
INSERT INTO `scheduled_tasks` VALUES ('APP\\tasks\\UsageStatsLoader','2023-03-02 22:40:45'),('PKP\\task\\EditorialReminders','2023-03-02 22:40:45'),('PKP\\task\\ProcessQueueJobs','2023-03-02 22:40:45'),('PKP\\task\\PublishSubmissions','2023-03-02 22:40:44'),('PKP\\task\\RemoveFailedJobs','2023-03-02 22:40:45'),('PKP\\task\\RemoveUnvalidatedExpiredUsers','2023-03-02 22:40:44'),('PKP\\task\\ReviewReminder','2023-03-02 22:40:44'),('PKP\\task\\StatisticsReport','2023-03-02 22:40:44'),('PKP\\task\\UpdateIPGeoDB','2023-03-02 22:40:44');
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
INSERT INTO `series_settings` VALUES (1,'','onlineIssn',''),(1,'','printIssn',''),(1,'','sortOption','title-ASC'),(1,'en','description',''),(1,'en','prefix',''),(1,'en','subtitle',''),(1,'en','title','Library & Information Studies'),(1,'fr_CA','description',''),(1,'fr_CA','prefix',''),(1,'fr_CA','subtitle',''),(1,'fr_CA','title',''),(2,'','onlineIssn',''),(2,'','printIssn',''),(2,'','sortOption','title-ASC'),(2,'en','description',''),(2,'en','prefix',''),(2,'en','subtitle',''),(2,'en','title','Political Economy'),(2,'fr_CA','description',''),(2,'fr_CA','prefix',''),(2,'fr_CA','subtitle',''),(2,'fr_CA','title',''),(3,'','onlineIssn',''),(3,'','printIssn',''),(3,'','sortOption','title-ASC'),(3,'en','description',''),(3,'en','prefix',''),(3,'en','subtitle',''),(3,'en','title','History'),(3,'fr_CA','description',''),(3,'fr_CA','prefix',''),(3,'fr_CA','subtitle',''),(3,'fr_CA','title',''),(4,'','onlineIssn',''),(4,'','printIssn',''),(4,'','sortOption','title-ASC'),(4,'en','description',''),(4,'en','prefix',''),(4,'en','subtitle',''),(4,'en','title','Education'),(4,'fr_CA','description',''),(4,'fr_CA','prefix',''),(4,'fr_CA','subtitle',''),(4,'fr_CA','title',''),(5,'','onlineIssn',''),(5,'','printIssn',''),(5,'','sortOption','title-ASC'),(5,'en','description',''),(5,'en','prefix',''),(5,'en','subtitle',''),(5,'en','title','Psychology'),(5,'fr_CA','description',''),(5,'fr_CA','prefix',''),(5,'fr_CA','subtitle',''),(5,'fr_CA','title','');
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
INSERT INTO `sessions` VALUES ('0gdcdp8u9dfmhlod0jkllaenj6',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798449,1677798484,0,'csrf|a:2:{s:9:\"timestamp\";i:1677798484;s:5:\"token\";s:32:\"716631b1735a0e4d82047a153e931f89\";}username|s:5:\"mally\";','localhost'),('0u66lr6hco4283csajb4i10qd3',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677797163,1677797194,0,'csrf|a:2:{s:9:\"timestamp\";i:1677797194;s:5:\"token\";s:32:\"f11efd1d99a6866cc9b6f7065681cdf4\";}username|s:6:\"aclark\";','localhost'),('11l7ijbelfvf4sjfb5e0cb1tdr',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677797195,1677797233,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1677797233;s:5:\"token\";s:32:\"e79289523d162b3dc27a2a580f96d5f3\";}','localhost'),('25krap54tg0okvu4v9tmikmj3v',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798598,1677798645,0,'csrf|a:2:{s:9:\"timestamp\";i:1677798644;s:5:\"token\";s:32:\"e2fd079cdcead46278d1f79adb4be316\";}username|s:7:\"mdawson\";','localhost'),('375v34irbl36n6c3pml4l5r66n',27,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798129,1677798225,0,'csrf|a:2:{s:9:\"timestamp\";i:1677798226;s:5:\"token\";s:32:\"93f6f6d01beccefc162737f5cfdd2b30\";}username|s:7:\"jbrower\";userId|i:27;','localhost'),('3mu3qhfrilq9vgv61chlink8vn',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677797115,1677797137,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1677797137;s:5:\"token\";s:32:\"b9d2ac58ce30fe26363d8629291894d9\";}','localhost'),('3s9kfr1at5npfa201rhengbnh0',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677796873,1677796891,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1677796891;s:5:\"token\";s:32:\"44c44b553c06288bc1ac27807d688273\";}','localhost'),('54kj6h25dlpt50j42u75faoja4',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798900,1677798946,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1677798946;s:5:\"token\";s:32:\"007bf909a90e3339dcb29737d46018aa\";}','localhost'),('6mbr6e3qi9a131d87v3esmi3dj',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798038,1677798047,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1677798047;s:5:\"token\";s:32:\"c62c841c79e1a12057841b998dd55ef8\";}','localhost'),('7uo9dng6juds84hkms0tov913g',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798433,1677798445,0,'username|s:7:\"phudson\";csrf|a:2:{s:9:\"timestamp\";i:1677798445;s:5:\"token\";s:32:\"fbe6cd10d90a49089c5958846e62e216\";}','localhost'),('8gkdqjajbl5pvbvh8vh7k78dda',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798300,1677798311,0,'username|s:8:\"agallego\";csrf|a:2:{s:9:\"timestamp\";i:1677798311;s:5:\"token\";s:32:\"92a86146d1223d3c70f60518698bcb9c\";}','localhost'),('9uq2orkm1dma0499eemh44rf62',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798645,1677798792,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1677798792;s:5:\"token\";s:32:\"686b0c780950a364999b29180d6dbfd5\";}','localhost'),('a1hib2i3v9l2a99qbei5i1qq9f',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798312,1677798324,0,'username|s:6:\"gfavio\";csrf|a:2:{s:9:\"timestamp\";i:1677798324;s:5:\"token\";s:32:\"d13447d8a16eed3ba520da4c7b196a4c\";}','localhost'),('a4ofh5h0bsiqdjllsd6htubton',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677797819,1677797862,0,'csrf|a:2:{s:9:\"timestamp\";i:1677797862;s:5:\"token\";s:32:\"63ad1c0d6eb9b68b17386c2c51710713\";}username|s:9:\"dbernnard\";','localhost'),('ae3su74me65odgg1gk7892t3jb',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798570,1677798595,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1677798595;s:5:\"token\";s:32:\"3c074e880387e432dbde644781099567\";}','localhost'),('bvvamtg8n899phnbuskbrn0b4l',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798544,1677798556,0,'username|s:8:\"agallego\";csrf|a:2:{s:9:\"timestamp\";i:1677798556;s:5:\"token\";s:32:\"f5becf4ca1250840b43c6e9c6e4b51c5\";}','localhost'),('c6pejjjjr3c7gq2qqn6b7cnb6h',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798230,1677798252,0,'csrf|a:2:{s:9:\"timestamp\";i:1677798252;s:5:\"token\";s:32:\"26b4552262ec4886bceda4fbedebbc85\";}username|s:10:\"jlockehart\";','localhost'),('e3699q5pem2kvntqafhsjhnjuh',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677797797,1677797807,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1677797807;s:5:\"token\";s:32:\"3131f47f5cc5c46d1133bb05fc60f05d\";}','localhost'),('f22jmdhh2v188vck5qerhq55p3',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677796909,1677796918,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1677796918;s:5:\"token\";s:32:\"32d457648f097646d1813411c77a2c77\";}','localhost'),('f8740mifb9fckqfobnvdfmlg7c',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677797990,1677798034,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1677798034;s:5:\"token\";s:32:\"c3ba1a648cd52177773e424cd899ac98\";}','localhost'),('fm2uepgk1epnk11djtdteb3soq',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677797863,1677797900,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1677797900;s:5:\"token\";s:32:\"ef4d6da88405cd225848a72dcada4b5d\";}','localhost'),('ghkaj9b71v6al6rbsea2q5s2b9',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677796844,1677796873,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1677796873;s:5:\"token\";s:32:\"5dd04174011eed1b1f030824ecb2ca41\";}','localhost'),('ho0o5dvc5k7ablac631f2llb4u',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798325,1677798348,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1677798348;s:5:\"token\";s:32:\"410746d39d6ef6085987a1406df34e39\";}','localhost'),('i1s7nuhttemm8qef9thp86k9r7',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798105,1677798126,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1677798126;s:5:\"token\";s:32:\"12fd900514bf902b058b1f2414766384\";}','localhost'),('ihultnn52ehtbetflcuqjb1esb',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798485,1677798543,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1677798543;s:5:\"token\";s:32:\"f7a8bf795e2ba1c3d9f46f27e6fbcc36\";}','localhost'),('inn2g2j30agvip7kqc4o2u2f2q',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798352,1677798390,0,'csrf|a:2:{s:9:\"timestamp\";i:1677798390;s:5:\"token\";s:32:\"06d0be37bd600b24279f12b6ca627e89\";}username|s:6:\"lelder\";','localhost'),('ji0bdv4niro817mrhd9vpia7ql',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798965,1677799031,0,'csrf|a:2:{s:9:\"timestamp\";i:1677799031;s:5:\"token\";s:32:\"f600a7c3df3b7ea0aa3c5d3990cf8262\";}username|s:6:\"msmith\";','localhost'),('km3cjgtaj7652f39np4c1hv884',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677797934,1677797989,0,'csrf|a:2:{s:9:\"timestamp\";i:1677797989;s:5:\"token\";s:32:\"248d658b335f523a59fd76c6d92373c5\";}username|s:10:\"dkennepohl\";','localhost'),('l1eq8apvid17idb7bn57rn704l',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677797384,1677797428,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1677797427;s:5:\"token\";s:32:\"70203299f0dcb4ed394c216a41bebef1\";}','localhost'),('m0kron3pl9sc9oul4al667m3fi',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798828,1677798848,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1677798848;s:5:\"token\";s:32:\"3e2311138447735ed4abc5b30005c8a4\";}','localhost'),('mbhngac0cn011l6krso80fr1r3',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677797901,1677797919,0,'username|s:6:\"minoue\";csrf|a:2:{s:9:\"timestamp\";i:1677797919;s:5:\"token\";s:32:\"7adbd5640b1a17b6ec8f125ca6e6e79d\";}','localhost'),('musuclbmm5vm6j1l5vmta5fsic',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798557,1677798569,0,'username|s:6:\"gfavio\";csrf|a:2:{s:9:\"timestamp\";i:1677798569;s:5:\"token\";s:32:\"3da96371dd9247dc00a78fa54147133d\";}','localhost'),('mvsleqtu1sks1tbeeq0ae9h4lm',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677797678,1677797795,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1677797795;s:5:\"token\";s:32:\"1e81aeabbdbcda66a692303ddafc7cd8\";}','localhost'),('n53e6nsvqqqcuac7f1fr7bjsct',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677797140,1677797160,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1677797160;s:5:\"token\";s:32:\"634f6c312e234a1e8b548b3dbea005d7\";}','localhost'),('nb4ipknlotr3d06hfeoo30gqfc',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677799032,1677799071,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1677799070;s:5:\"token\";s:32:\"d09cc8cc1a3f4e2ded547d7c6e4a9f6c\";}','localhost'),('nirggp3m4kt7iu1dl2cv38l4pb',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677797531,1677797614,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1677797614;s:5:\"token\";s:32:\"69b056d11159998f9a26580f6dbbbae6\";}','localhost'),('npr9dq8afdeahafv9qnut14ocp',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677796919,1677796925,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1677796925;s:5:\"token\";s:32:\"be1cf3373ef2fd17fbc1c0b44660d015\";}','localhost'),('oi9djv67leple2v69j87b78hv9',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677796929,1677797094,0,'username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1677797093;s:5:\"token\";s:32:\"54967b0151f0a95a36559617ad20d7cb\";}','localhost'),('p8b6gpai636u35o1tjvhd4m237',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798851,1677798900,0,'csrf|a:2:{s:9:\"timestamp\";i:1677798900;s:5:\"token\";s:32:\"86af4182b20e856c7e2d804a8684d982\";}username|s:6:\"mpower\";','localhost'),('p8kom7oc9cblfabj4rqh4klt1v',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677797488,1677797531,0,'csrf|a:2:{s:9:\"timestamp\";i:1677797531;s:5:\"token\";s:32:\"835bef44e1445af5feb02cd13cd39d9d\";}username|s:6:\"bbeaty\";','localhost'),('pbaa2lc5ift8dhvs35eq2e1mcl',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677796894,1677796908,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1677796908;s:5:\"token\";s:32:\"c017064bc6caf9801e3d5f5225cf2024\";}','localhost'),('poi8f5rpqogrpth74t7evgjkd1',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798390,1677798432,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1677798433;s:5:\"token\";s:32:\"b27fdcedb3dfbaf990d2acb1148c9f7e\";}','localhost'),('rlevhnofausd9cih8lntu7av21',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677797618,1677797678,0,'csrf|a:2:{s:9:\"timestamp\";i:1677797678;s:5:\"token\";s:32:\"90c5f4d3c6f1b90ad39accfbc4c7d4d6\";}username|s:6:\"callan\";','localhost'),('rlf4i81p46l6r6ic4n4os4a3p4',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677797921,1677797930,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1677797930;s:5:\"token\";s:32:\"95e8409de199ee2b7fa3c89c2f74471f\";}','localhost'),('rvj1glkqnjeg8eeeb6sf6btl45',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677797094,1677797111,0,'username|s:5:\"rvaca\";csrf|a:2:{s:9:\"timestamp\";i:1677797110;s:5:\"token\";s:32:\"b843c495db27d69689883f2c89a57cb4\";}','localhost'),('snissgvmhcdufajv8t5c3dk1p4',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798253,1677798299,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1677798299;s:5:\"token\";s:32:\"e3bb19c113b0984314bb10eff192725b\";}','localhost'),('t4evecbrngimthm2osv4fo61o2',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677797807,1677797816,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1677797816;s:5:\"token\";s:32:\"a25ecac0c81538216041573fe0aaec58\";}','localhost'),('tau0sifklj6cj3re4slr5ajjub',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798795,1677798828,0,'csrf|a:2:{s:9:\"timestamp\";i:1677798827;s:5:\"token\";s:32:\"5efb813348ff04da95365133ad3b1578\";}username|s:6:\"mforan\";','localhost'),('tpu2n4gkiniea33f3cp5o5369p',21,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677797433,1677797484,0,'csrf|a:2:{s:9:\"timestamp\";i:1677797484;s:5:\"token\";s:32:\"06ffeb2f387bf804ea55e77557500fe2\";}username|s:10:\"bbarnetson\";userId|i:21;','localhost'),('udjkspe2dctf5u36rgulhq73ko',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798051,1677798104,0,'csrf|a:2:{s:9:\"timestamp\";i:1677798104;s:5:\"token\";s:32:\"866b7d5239a3a5a25b05b1f781e0990a\";}username|s:7:\"fperini\";','localhost'),('uh5m3u3i1viqbuja182ceb0dn4',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677798947,1677798960,0,'username|s:8:\"agallego\";csrf|a:2:{s:9:\"timestamp\";i:1677798960;s:5:\"token\";s:32:\"f3b08a4f27f7783348c99ab5c62b61a7\";}','localhost'),('velgkk7tqamsffn1rmvrubov30',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/110.0.5481.100 Safari/537.36',1677797237,1677797384,0,'csrf|a:2:{s:9:\"timestamp\";i:1677797383;s:5:\"token\";s:32:\"1935ed4d30cbf81329cbffaad54d80ed\";}username|s:7:\"afinkel\";','localhost');
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
  `installed_locales` varchar(1024) NOT NULL DEFAULT 'en' COMMENT 'Locales for which support has been installed.',
  `supported_locales` varchar(1024) DEFAULT NULL COMMENT 'Locales supported by the site (for hosted journals/conferences/...).',
  `original_style_file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (0,'en',6,'[\"en\",\"fr_CA\"]','[\"en\",\"fr_CA\"]',NULL);
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
INSERT INTO `site_settings` VALUES ('compressStatsLogs','','0'),('contactEmail','en','pkpadmin@mailinator.com'),('contactName','en','Open Monograph Press'),('contactName','fr_CA','Open Monograph Press'),('enableGeoUsageStats','','disabled'),('enableInstitutionUsageStats','','0'),('isSiteSushiPlatform','','0'),('isSushiApiPublic','','1'),('keepDailyUsageStats','','0'),('themePluginPath','','default');
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
INSERT INTO `stage_assignments` VALUES (1,1,13,19,'2023-03-02 22:46:33',0,0),(2,1,6,14,'2023-03-02 22:47:12',0,0),(3,2,13,20,'2023-03-02 22:49:34',0,0),(4,3,13,21,'2023-03-02 22:51:23',0,0),(5,4,13,22,'2023-03-02 22:52:10',0,0),(6,4,6,13,'2023-03-02 22:53:08',0,0),(7,4,10,15,'2023-03-02 22:53:26',0,0),(8,5,13,23,'2023-03-02 22:54:36',0,0),(9,5,6,14,'2023-03-02 22:55:42',0,0),(10,5,10,16,'2023-03-02 22:56:02',0,0),(11,5,12,17,'2023-03-02 22:56:09',0,0),(12,6,13,24,'2023-03-02 22:57:40',0,0),(13,6,3,3,'2023-03-02 22:58:07',0,1),(14,6,5,4,'2023-03-02 22:58:12',0,0),(15,6,5,6,'2023-03-02 22:58:18',1,0),(16,7,13,25,'2023-03-02 22:59:47',0,0),(17,7,6,13,'2023-03-02 23:00:33',0,0),(18,8,3,3,'2023-03-02 23:00:43',0,1),(19,9,13,26,'2023-03-02 23:01:43',0,0),(20,10,13,27,'2023-03-02 23:03:45',0,0),(21,11,13,28,'2023-03-02 23:04:11',0,0),(22,12,13,29,'2023-03-02 23:06:28',0,0),(23,13,13,30,'2023-03-02 23:08:03',0,0),(24,14,13,31,'2023-03-02 23:10:43',0,0),(25,14,6,13,'2023-03-02 23:11:47',0,0),(26,14,10,15,'2023-03-02 23:12:06',0,0),(27,14,12,18,'2023-03-02 23:12:12',0,0),(28,15,13,32,'2023-03-02 23:13:46',0,0),(29,16,13,33,'2023-03-02 23:14:59',0,0),(30,17,13,34,'2023-03-02 23:17:10',0,0);
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
INSERT INTO `submission_chapter_authors` VALUES (1,1,0,0.00),(1,2,0,0.00),(1,3,0,0.00),(5,4,0,0.00),(6,5,0,0.00),(7,6,0,0.00),(8,7,0,0.00),(9,7,0,1.00),(11,8,0,0.00),(11,9,0,0.00),(11,10,0,0.00),(11,11,0,0.00),(11,12,0,0.00),(12,13,0,0.00),(13,14,0,0.00),(14,15,0,0.00),(15,16,0,0.00),(16,17,0,0.00),(16,18,0,0.00),(16,19,0,0.00),(16,20,0,0.00),(16,21,0,0.00),(16,22,0,0.00),(17,23,0,0.00),(18,24,0,0.00),(19,25,0,0.00),(20,26,0,0.00),(21,27,0,0.00),(22,28,0,0.00),(23,29,0,0.00),(24,30,0,0.00),(25,31,0,0.00),(26,32,0,0.00),(27,33,0,0.00),(28,34,0,0.00),(29,35,0,0.00),(30,36,0,0.00),(31,37,0,0.00),(31,38,0,0.00),(31,39,0,0.00),(31,40,0,0.00),(31,41,0,0.00),(31,42,0,0.00),(31,43,0,0.00),(31,44,0,0.00),(31,45,0,0.00),(32,46,0,0.00),(32,47,0,0.00),(35,48,0,0.00),(36,48,0,1.00),(37,49,0,0.00),(38,49,0,1.00),(39,50,0,0.00),(40,50,0,1.00),(42,51,0,0.00),(43,52,0,0.00),(44,53,0,0.00),(45,54,0,0.00),(45,57,0,0.00),(46,55,0,0.00),(47,56,0,0.00),(48,58,0,0.00),(48,59,0,0.00),(48,60,0,0.00),(49,61,0,0.00),(49,62,0,0.00),(49,63,0,0.00),(49,64,0,0.00),(49,65,0,0.00),(50,67,0,0.00),(50,68,0,0.00),(51,66,0,0.00),(52,67,0,1.00),(52,68,0,1.00),(53,69,0,0.00),(54,69,0,1.00),(55,70,0,0.00),(56,70,0,1.00),(57,71,0,0.00);
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
INSERT INTO `submission_chapter_settings` VALUES (1,'','datePublished',NULL,'string'),(1,'','isPageEnabled',NULL,'string'),(1,'','licenseUrl',NULL,'string'),(1,'','pages','','string'),(1,'en','abstract','','string'),(1,'en','subtitle','','string'),(1,'en','title','Choosing the Future','string'),(1,'fr_CA','abstract','','string'),(1,'fr_CA','subtitle','','string'),(1,'fr_CA','title','','string'),(2,'','datePublished',NULL,'string'),(2,'','isPageEnabled',NULL,'string'),(2,'','licenseUrl',NULL,'string'),(2,'','pages','','string'),(2,'en','abstract','','string'),(2,'en','subtitle','','string'),(2,'en','title','Axioms','string'),(2,'fr_CA','abstract','','string'),(2,'fr_CA','subtitle','','string'),(2,'fr_CA','title','','string'),(3,'','datePublished',NULL,'string'),(3,'','isPageEnabled',NULL,'string'),(3,'','licenseUrl',NULL,'string'),(3,'','pages','','string'),(3,'en','abstract','','string'),(3,'en','subtitle','','string'),(3,'en','title','Paradigm Shift','string'),(3,'fr_CA','abstract','','string'),(3,'fr_CA','subtitle','','string'),(3,'fr_CA','title','','string'),(4,'','datePublished',NULL,'string'),(4,'','isPageEnabled',NULL,'string'),(4,'','licenseUrl','','string'),(4,'','pages','','string'),(4,'en','abstract','','string'),(4,'en','subtitle','','string'),(4,'en','title','Critical History in Western Canada 1900–2000','string'),(4,'fr_CA','abstract','','string'),(4,'fr_CA','subtitle','','string'),(4,'fr_CA','title','','string'),(5,'','datePublished',NULL,'string'),(5,'','isPageEnabled',NULL,'string'),(5,'','licenseUrl','','string'),(5,'','pages','','string'),(5,'en','abstract','','string'),(5,'en','subtitle','','string'),(5,'en','title','Vernacular Currents in Western Canadian Historiography: The Passion and Prose of Katherine Hughes, F.G. Roe, and Roy Ito','string'),(5,'fr_CA','abstract','','string'),(5,'fr_CA','subtitle','','string'),(5,'fr_CA','title','','string'),(6,'','datePublished',NULL,'string'),(6,'','isPageEnabled',NULL,'string'),(6,'','licenseUrl','','string'),(6,'','pages','','string'),(6,'en','abstract','','string'),(6,'en','subtitle','','string'),(6,'en','title','Cree Intellectual Traditions in History','string'),(6,'fr_CA','abstract','','string'),(6,'fr_CA','subtitle','','string'),(6,'fr_CA','title','','string'),(7,'','datePublished',NULL,'string'),(7,'','isPageEnabled',NULL,'string'),(7,'','licenseUrl','','string'),(7,'','pages','','string'),(7,'en','abstract','','string'),(7,'en','subtitle','','string'),(7,'en','title','Visualizing Space, Race, and History in the North: Photographic Narratives of the Athabasca-Mackenzie River Basin','string'),(7,'fr_CA','abstract','','string'),(7,'fr_CA','subtitle','','string'),(7,'fr_CA','title','','string'),(8,'','datePublished',NULL,'string'),(8,'','isPageEnabled',NULL,'string'),(8,'','licenseUrl',NULL,'string'),(8,'','pages','','string'),(8,'en','abstract','','string'),(8,'en','subtitle','','string'),(8,'en','title','Introduction','string'),(8,'fr_CA','abstract','','string'),(8,'fr_CA','subtitle','','string'),(8,'fr_CA','title','','string'),(9,'','datePublished',NULL,'string'),(9,'','isPageEnabled',NULL,'string'),(9,'','licenseUrl',NULL,'string'),(9,'','pages','','string'),(9,'en','abstract','','string'),(9,'en','subtitle','','string'),(9,'en','title','Part One. Employment Relationships in Canada','string'),(9,'fr_CA','abstract','','string'),(9,'fr_CA','subtitle','','string'),(9,'fr_CA','title','','string'),(10,'','datePublished',NULL,'string'),(10,'','isPageEnabled',NULL,'string'),(10,'','licenseUrl',NULL,'string'),(10,'','pages','','string'),(10,'en','abstract','','string'),(10,'en','subtitle','','string'),(10,'en','title','Part Two. Preventing Workplace Injury','string'),(10,'fr_CA','abstract','','string'),(10,'fr_CA','subtitle','','string'),(10,'fr_CA','title','','string'),(11,'','datePublished',NULL,'string'),(11,'','isPageEnabled',NULL,'string'),(11,'','licenseUrl',NULL,'string'),(11,'','pages','','string'),(11,'en','abstract','','string'),(11,'en','subtitle','','string'),(11,'en','title','Part Three. Critique of OHS in Canada','string'),(11,'fr_CA','abstract','','string'),(11,'fr_CA','subtitle','','string'),(11,'fr_CA','title','','string'),(12,'','datePublished',NULL,'string'),(12,'','isPageEnabled',NULL,'string'),(12,'','licenseUrl',NULL,'string'),(12,'','pages','','string'),(12,'en','abstract','','string'),(12,'en','subtitle','','string'),(12,'en','title','Part Four. Political Economy of Preventing Workplace Injury','string'),(12,'fr_CA','abstract','','string'),(12,'fr_CA','subtitle','','string'),(12,'fr_CA','title','','string'),(13,'','datePublished',NULL,'string'),(13,'','isPageEnabled',NULL,'string'),(13,'','licenseUrl',NULL,'string'),(13,'','pages','','string'),(13,'en','abstract','','string'),(13,'en','subtitle','','string'),(13,'en','title','Introduction: Contexts of Popular Culture','string'),(13,'fr_CA','abstract','','string'),(13,'fr_CA','subtitle','','string'),(13,'fr_CA','title','','string'),(14,'','datePublished',NULL,'string'),(14,'','isPageEnabled',NULL,'string'),(14,'','licenseUrl',NULL,'string'),(14,'','pages','','string'),(14,'en','abstract','','string'),(14,'en','subtitle','','string'),(14,'en','title','Chapter 1. A Future for Media Studies: Cultural Labour, Cultural Relations, Cultural Politics','string'),(14,'fr_CA','abstract','','string'),(14,'fr_CA','subtitle','','string'),(14,'fr_CA','title','','string'),(15,'','datePublished',NULL,'string'),(15,'','isPageEnabled',NULL,'string'),(15,'','licenseUrl',NULL,'string'),(15,'','pages','','string'),(15,'en','abstract','','string'),(15,'en','subtitle','','string'),(15,'en','title','Chapter 2. Log On, Goof Off, and Look Up: Facebook and the Rhythms of Canadian Internet Use','string'),(15,'fr_CA','abstract','','string'),(15,'fr_CA','subtitle','','string'),(15,'fr_CA','title','','string'),(16,'','datePublished',NULL,'string'),(16,'','isPageEnabled',NULL,'string'),(16,'','licenseUrl',NULL,'string'),(16,'','pages','','string'),(16,'en','abstract','','string'),(16,'en','subtitle','','string'),(16,'en','title','Chapter 3. Hawkers and Public Space: Free Commuter Newspapers in Canada','string'),(16,'fr_CA','abstract','','string'),(16,'fr_CA','subtitle','','string'),(16,'fr_CA','title','','string'),(17,'','datePublished',NULL,'string'),(17,'','isPageEnabled',NULL,'string'),(17,'','licenseUrl',NULL,'string'),(17,'','pages','','string'),(17,'en','abstract','','string'),(17,'en','subtitle','','string'),(17,'en','title','Prologue','string'),(17,'fr_CA','abstract','','string'),(17,'fr_CA','subtitle','','string'),(17,'fr_CA','title','','string'),(18,'','datePublished',NULL,'string'),(18,'','isPageEnabled',NULL,'string'),(18,'','licenseUrl',NULL,'string'),(18,'','pages','','string'),(18,'en','abstract','','string'),(18,'en','subtitle','','string'),(18,'en','title','Chapter 1: The First Five Years: 1867-1872','string'),(18,'fr_CA','abstract','','string'),(18,'fr_CA','subtitle','','string'),(18,'fr_CA','title','','string'),(19,'','datePublished',NULL,'string'),(19,'','isPageEnabled',NULL,'string'),(19,'','licenseUrl',NULL,'string'),(19,'','pages','','string'),(19,'en','abstract','','string'),(19,'en','subtitle','','string'),(19,'en','title','Chapter 2: Free Trade or \"Freedom\": 1911','string'),(19,'fr_CA','abstract','','string'),(19,'fr_CA','subtitle','','string'),(19,'fr_CA','title','','string'),(20,'','datePublished',NULL,'string'),(20,'','isPageEnabled',NULL,'string'),(20,'','licenseUrl',NULL,'string'),(20,'','pages','','string'),(20,'en','abstract','','string'),(20,'en','subtitle','','string'),(20,'en','title','Chapter 3: Castro, Nukes & the Cold War: 1953-1968','string'),(20,'fr_CA','abstract','','string'),(20,'fr_CA','subtitle','','string'),(20,'fr_CA','title','','string'),(21,'','datePublished',NULL,'string'),(21,'','isPageEnabled',NULL,'string'),(21,'','licenseUrl',NULL,'string'),(21,'','pages','','string'),(21,'en','abstract','','string'),(21,'en','subtitle','','string'),(21,'en','title','Chapter 4: Enter the Intellect: 1968-1984','string'),(21,'fr_CA','abstract','','string'),(21,'fr_CA','subtitle','','string'),(21,'fr_CA','title','','string'),(22,'','datePublished',NULL,'string'),(22,'','isPageEnabled',NULL,'string'),(22,'','licenseUrl',NULL,'string'),(22,'','pages','','string'),(22,'en','abstract','','string'),(22,'en','subtitle','','string'),(22,'en','title','Epilogue','string'),(22,'fr_CA','abstract','','string'),(22,'fr_CA','subtitle','','string'),(22,'fr_CA','title','','string'),(23,'','datePublished',NULL,'string'),(23,'','isPageEnabled',NULL,'string'),(23,'','licenseUrl',NULL,'string'),(23,'','pages','','string'),(23,'en','abstract','','string'),(23,'en','subtitle','','string'),(23,'en','title','Identify: Understanding Your Information Need','string'),(23,'fr_CA','abstract','','string'),(23,'fr_CA','subtitle','','string'),(23,'fr_CA','title','','string'),(24,'','datePublished',NULL,'string'),(24,'','isPageEnabled',NULL,'string'),(24,'','licenseUrl',NULL,'string'),(24,'','pages','','string'),(24,'en','abstract','','string'),(24,'en','subtitle','','string'),(24,'en','title','Scope: Knowing What Is Available','string'),(24,'fr_CA','abstract','','string'),(24,'fr_CA','subtitle','','string'),(24,'fr_CA','title','','string'),(25,'','datePublished',NULL,'string'),(25,'','isPageEnabled',NULL,'string'),(25,'','licenseUrl',NULL,'string'),(25,'','pages','','string'),(25,'en','abstract','','string'),(25,'en','subtitle','','string'),(25,'en','title','Plan: Developing Research Strategies','string'),(25,'fr_CA','abstract','','string'),(25,'fr_CA','subtitle','','string'),(25,'fr_CA','title','','string'),(26,'','datePublished',NULL,'string'),(26,'','isPageEnabled',NULL,'string'),(26,'','licenseUrl',NULL,'string'),(26,'','pages','','string'),(26,'en','abstract','','string'),(26,'en','subtitle','','string'),(26,'en','title','Gather: Finding What You Need','string'),(26,'fr_CA','abstract','','string'),(26,'fr_CA','subtitle','','string'),(26,'fr_CA','title','','string'),(27,'','datePublished',NULL,'string'),(27,'','isPageEnabled',NULL,'string'),(27,'','licenseUrl',NULL,'string'),(27,'','pages','','string'),(27,'en','abstract','','string'),(27,'en','subtitle','','string'),(27,'en','title','Introduction','string'),(27,'fr_CA','abstract','','string'),(27,'fr_CA','subtitle','','string'),(27,'fr_CA','title','','string'),(28,'','datePublished',NULL,'string'),(28,'','isPageEnabled',NULL,'string'),(28,'','licenseUrl',NULL,'string'),(28,'','pages','','string'),(28,'en','abstract','','string'),(28,'en','subtitle','','string'),(28,'en','title','Chapter 1: Interactions Affording Distance Science Education','string'),(28,'fr_CA','abstract','','string'),(28,'fr_CA','subtitle','','string'),(28,'fr_CA','title','','string'),(29,'','datePublished',NULL,'string'),(29,'','isPageEnabled',NULL,'string'),(29,'','licenseUrl',NULL,'string'),(29,'','pages','','string'),(29,'en','abstract','','string'),(29,'en','subtitle','','string'),(29,'en','title','Chapter 2: Learning Science at a Distance: Instructional Dialogues and Resources','string'),(29,'fr_CA','abstract','','string'),(29,'fr_CA','subtitle','','string'),(29,'fr_CA','title','','string'),(30,'','datePublished',NULL,'string'),(30,'','isPageEnabled',NULL,'string'),(30,'','licenseUrl',NULL,'string'),(30,'','pages','','string'),(30,'en','abstract','','string'),(30,'en','subtitle','','string'),(30,'en','title','Chapter 3: Leadership Strategies for Coordinating Distance Education Instructional Development Teams','string'),(30,'fr_CA','abstract','','string'),(30,'fr_CA','subtitle','','string'),(30,'fr_CA','title','','string'),(31,'','datePublished',NULL,'string'),(31,'','isPageEnabled',NULL,'string'),(31,'','licenseUrl',NULL,'string'),(31,'','pages','','string'),(31,'en','abstract','','string'),(31,'en','subtitle','','string'),(31,'en','title','Chapter 4: Toward New Models of Flexible Education to Enhance Quality in Australian Higher Education','string'),(31,'fr_CA','abstract','','string'),(31,'fr_CA','subtitle','','string'),(31,'fr_CA','title','','string'),(32,'','datePublished',NULL,'string'),(32,'','isPageEnabled',NULL,'string'),(32,'','licenseUrl',NULL,'string'),(32,'','pages','','string'),(32,'en','abstract','','string'),(32,'en','subtitle','','string'),(32,'en','title','Internet, openness and the future of the information society in LAC','string'),(32,'fr_CA','abstract','','string'),(32,'fr_CA','subtitle','','string'),(32,'fr_CA','title','','string'),(33,'','datePublished',NULL,'string'),(33,'','isPageEnabled',NULL,'string'),(33,'','licenseUrl',NULL,'string'),(33,'','pages','','string'),(33,'en','abstract','','string'),(33,'en','subtitle','','string'),(33,'en','title','Imagining the Internet: Open, closed or in between?','string'),(33,'fr_CA','abstract','','string'),(33,'fr_CA','subtitle','','string'),(33,'fr_CA','title','','string'),(34,'','datePublished',NULL,'string'),(34,'','isPageEnabled',NULL,'string'),(34,'','licenseUrl',NULL,'string'),(34,'','pages','','string'),(34,'en','abstract','','string'),(34,'en','subtitle','','string'),(34,'en','title','The internet in LAC will remain free, public and open over the next 10 years','string'),(34,'fr_CA','abstract','','string'),(34,'fr_CA','subtitle','','string'),(34,'fr_CA','title','','string'),(35,'','datePublished',NULL,'string'),(35,'','isPageEnabled',NULL,'string'),(35,'','licenseUrl',NULL,'string'),(35,'','pages','','string'),(35,'en','abstract','','string'),(35,'en','subtitle','','string'),(35,'en','title','Free Internet?','string'),(35,'fr_CA','abstract','','string'),(35,'fr_CA','subtitle','','string'),(35,'fr_CA','title','','string'),(36,'','datePublished',NULL,'string'),(36,'','isPageEnabled',NULL,'string'),(36,'','licenseUrl',NULL,'string'),(36,'','pages','','string'),(36,'en','abstract','','string'),(36,'en','subtitle','','string'),(36,'en','title','Risks and challenges for freedom of expression on the internet','string'),(36,'fr_CA','abstract','','string'),(36,'fr_CA','subtitle','','string'),(36,'fr_CA','title','','string'),(37,'','datePublished',NULL,'string'),(37,'','isPageEnabled',NULL,'string'),(37,'','licenseUrl',NULL,'string'),(37,'','pages','','string'),(37,'en','abstract','','string'),(37,'en','subtitle','','string'),(37,'en','title','Introduction','string'),(37,'fr_CA','abstract','','string'),(37,'fr_CA','subtitle','','string'),(37,'fr_CA','title','','string'),(38,'','datePublished',NULL,'string'),(38,'','isPageEnabled',NULL,'string'),(38,'','licenseUrl',NULL,'string'),(38,'','pages','','string'),(38,'en','abstract','','string'),(38,'en','subtitle','','string'),(38,'en','title','CHAPTER ONE: Where the Buffalo Roamed','string'),(38,'fr_CA','abstract','','string'),(38,'fr_CA','subtitle','','string'),(38,'fr_CA','title','','string'),(39,'','datePublished',NULL,'string'),(39,'','isPageEnabled',NULL,'string'),(39,'','licenseUrl',NULL,'string'),(39,'','pages','','string'),(39,'en','abstract','','string'),(39,'en','subtitle','','string'),(39,'en','title','CHAPTER TWO: Bison Conservation and Buffalo National Park','string'),(39,'fr_CA','abstract','','string'),(39,'fr_CA','subtitle','','string'),(39,'fr_CA','title','','string'),(40,'','datePublished',NULL,'string'),(40,'','isPageEnabled',NULL,'string'),(40,'','licenseUrl',NULL,'string'),(40,'','pages','','string'),(40,'en','abstract','','string'),(40,'en','subtitle','','string'),(40,'en','title','CHAPTER THREE: A Well-Run Ranch','string'),(40,'fr_CA','abstract','','string'),(40,'fr_CA','subtitle','','string'),(40,'fr_CA','title','','string'),(41,'','datePublished',NULL,'string'),(41,'','isPageEnabled',NULL,'string'),(41,'','licenseUrl',NULL,'string'),(41,'','pages','','string'),(41,'en','abstract','','string'),(41,'en','subtitle','','string'),(41,'en','title','CHAPTER FOUR: Zookeepers and Animal Breeders','string'),(41,'fr_CA','abstract','','string'),(41,'fr_CA','subtitle','','string'),(41,'fr_CA','title','','string'),(42,'','datePublished',NULL,'string'),(42,'','isPageEnabled',NULL,'string'),(42,'','licenseUrl',NULL,'string'),(42,'','pages','','string'),(42,'en','abstract','','string'),(42,'en','subtitle','','string'),(42,'en','title','CHAPTER FIVE: \"Evolving the Arctic Cow\"','string'),(42,'fr_CA','abstract','','string'),(42,'fr_CA','subtitle','','string'),(42,'fr_CA','title','','string'),(43,'','datePublished',NULL,'string'),(43,'','isPageEnabled',NULL,'string'),(43,'','licenseUrl',NULL,'string'),(43,'','pages','','string'),(43,'en','abstract','','string'),(43,'en','subtitle','','string'),(43,'en','title','CONCLUSION: The Forgotten Park','string'),(43,'fr_CA','abstract','','string'),(43,'fr_CA','subtitle','','string'),(43,'fr_CA','title','','string'),(44,'','datePublished',NULL,'string'),(44,'','isPageEnabled',NULL,'string'),(44,'','licenseUrl',NULL,'string'),(44,'','pages','','string'),(44,'en','abstract','','string'),(44,'en','subtitle','','string'),(44,'en','title','Bibliography','string'),(44,'fr_CA','abstract','','string'),(44,'fr_CA','subtitle','','string'),(44,'fr_CA','title','','string'),(45,'','datePublished',NULL,'string'),(45,'','isPageEnabled',NULL,'string'),(45,'','licenseUrl',NULL,'string'),(45,'','pages','','string'),(45,'en','abstract','','string'),(45,'en','subtitle','','string'),(45,'en','title','Index','string'),(45,'fr_CA','abstract','','string'),(45,'fr_CA','subtitle','','string'),(45,'fr_CA','title','','string'),(46,'','datePublished',NULL,'string'),(46,'','isPageEnabled',NULL,'string'),(46,'','licenseUrl',NULL,'string'),(46,'','pages','','string'),(46,'en','abstract','','string'),(46,'en','subtitle','','string'),(46,'en','title','Introduction','string'),(46,'fr_CA','abstract','','string'),(46,'fr_CA','subtitle','','string'),(46,'fr_CA','title','','string'),(47,'','datePublished',NULL,'string'),(47,'','isPageEnabled',NULL,'string'),(47,'','licenseUrl',NULL,'string'),(47,'','pages','','string'),(47,'en','abstract','','string'),(47,'en','subtitle','','string'),(47,'en','title','Poems','string'),(47,'fr_CA','abstract','','string'),(47,'fr_CA','subtitle','','string'),(47,'fr_CA','title','','string'),(48,'','datePublished',NULL,'string'),(48,'','isPageEnabled',NULL,'string'),(48,'','licenseUrl',NULL,'string'),(48,'','pages','','string'),(48,'en','abstract','','string'),(48,'en','subtitle','','string'),(48,'en','title','Catalyzing Access through Social and Technical Innovation','string'),(48,'fr_CA','abstract','','string'),(48,'fr_CA','subtitle','','string'),(48,'fr_CA','title','','string'),(49,'','datePublished',NULL,'string'),(49,'','isPageEnabled',NULL,'string'),(49,'','licenseUrl',NULL,'string'),(49,'','pages','','string'),(49,'en','abstract','','string'),(49,'en','subtitle','','string'),(49,'en','title','Catalyzing Access via Telecommunications Policy','string'),(49,'fr_CA','abstract','','string'),(49,'fr_CA','subtitle','','string'),(49,'fr_CA','title','','string'),(50,'','datePublished',NULL,'string'),(50,'','isPageEnabled',NULL,'string'),(50,'','licenseUrl',NULL,'string'),(50,'','pages','','string'),(50,'en','abstract','','string'),(50,'en','subtitle','','string'),(50,'en','title','Access to Knowledge as a New Paradigm for Research on ICTs and Intellectual Property','string'),(50,'fr_CA','abstract','','string'),(50,'fr_CA','subtitle','','string'),(50,'fr_CA','title','','string'),(51,'','datePublished',NULL,'string'),(51,'','isPageEnabled',NULL,'string'),(51,'','licenseUrl',NULL,'string'),(51,'','pages','','string'),(51,'en','abstract','','string'),(51,'en','subtitle','','string'),(51,'en','title','Current State of Mobile Learning','string'),(51,'fr_CA','abstract','','string'),(51,'fr_CA','subtitle','','string'),(51,'fr_CA','title','','string'),(52,'','datePublished',NULL,'string'),(52,'','isPageEnabled',NULL,'string'),(52,'','licenseUrl',NULL,'string'),(52,'','pages','','string'),(52,'en','abstract','','string'),(52,'en','subtitle','','string'),(52,'en','title','A Model for Framing Mobile Learning','string'),(52,'fr_CA','abstract','','string'),(52,'fr_CA','subtitle','','string'),(52,'fr_CA','title','','string'),(53,'','datePublished',NULL,'string'),(53,'','isPageEnabled',NULL,'string'),(53,'','licenseUrl',NULL,'string'),(53,'','pages','','string'),(53,'en','abstract','','string'),(53,'en','subtitle','','string'),(53,'en','title','Mobile Distance Learning with PDAs: Development and Testing of Pedagogical and System Solutions Supporting Mobile Distance Learners','string'),(53,'fr_CA','abstract','','string'),(53,'fr_CA','subtitle','','string'),(53,'fr_CA','title','','string'),(54,'','datePublished',NULL,'string'),(54,'','isPageEnabled',NULL,'string'),(54,'','licenseUrl',NULL,'string'),(54,'','pages','','string'),(54,'en','abstract','','string'),(54,'en','subtitle','','string'),(54,'en','title','Chapter 1: Mind Control—Internal or External?','string'),(54,'fr_CA','abstract','','string'),(54,'fr_CA','subtitle','','string'),(54,'fr_CA','title','','string'),(55,'','datePublished',NULL,'string'),(55,'','isPageEnabled',NULL,'string'),(55,'','licenseUrl',NULL,'string'),(55,'','pages','','string'),(55,'en','abstract','','string'),(55,'en','subtitle','','string'),(55,'en','title','Chapter 2: Classical Music and the Classical Mind','string'),(55,'fr_CA','abstract','','string'),(55,'fr_CA','subtitle','','string'),(55,'fr_CA','title','','string'),(56,'','datePublished',NULL,'string'),(56,'','isPageEnabled',NULL,'string'),(56,'','licenseUrl',NULL,'string'),(56,'','pages','','string'),(56,'en','abstract','','string'),(56,'en','subtitle','','string'),(56,'en','title','Chapter 3: Situated Cognition and Bricolage','string'),(56,'fr_CA','abstract','','string'),(56,'fr_CA','subtitle','','string'),(56,'fr_CA','title','','string'),(57,'','datePublished',NULL,'string'),(57,'','isPageEnabled',NULL,'string'),(57,'','licenseUrl',NULL,'string'),(57,'','pages','','string'),(57,'en','abstract','','string'),(57,'en','subtitle','','string'),(57,'en','title','Chapter 4: Braitenberg’s Vehicle 2','string'),(57,'fr_CA','abstract','','string'),(57,'fr_CA','subtitle','','string'),(57,'fr_CA','title','','string'),(58,'','datePublished',NULL,'string'),(58,'','isPageEnabled',NULL,'string'),(58,'','licenseUrl',NULL,'string'),(58,'','pages','','string'),(58,'en','abstract','','string'),(58,'en','subtitle','','string'),(58,'en','title','Setting the Stage','string'),(58,'fr_CA','abstract','','string'),(58,'fr_CA','subtitle','','string'),(58,'fr_CA','title','','string'),(59,'','datePublished',NULL,'string'),(59,'','isPageEnabled',NULL,'string'),(59,'','licenseUrl',NULL,'string'),(59,'','pages','','string'),(59,'en','abstract','','string'),(59,'en','subtitle','','string'),(59,'en','title','Going It Alone, 1945-1954','string'),(59,'fr_CA','abstract','','string'),(59,'fr_CA','subtitle','','string'),(59,'fr_CA','title','','string'),(60,'','datePublished',NULL,'string'),(60,'','isPageEnabled',NULL,'string'),(60,'','licenseUrl',NULL,'string'),(60,'','pages','','string'),(60,'en','abstract','','string'),(60,'en','subtitle','','string'),(60,'en','title','Establishing the Pattern, 1955-1962','string'),(60,'fr_CA','abstract','','string'),(60,'fr_CA','subtitle','','string'),(60,'fr_CA','title','','string'),(61,'','datePublished',NULL,'string'),(61,'','isPageEnabled',NULL,'string'),(61,'','licenseUrl',NULL,'string'),(61,'','pages','','string'),(61,'en','abstract','','string'),(61,'en','subtitle','','string'),(61,'en','title','Foreward','string'),(61,'fr_CA','abstract','','string'),(61,'fr_CA','subtitle','','string'),(61,'fr_CA','title','','string'),(62,'','datePublished',NULL,'string'),(62,'','isPageEnabled',NULL,'string'),(62,'','licenseUrl',NULL,'string'),(62,'','pages','','string'),(62,'en','abstract','','string'),(62,'en','subtitle','','string'),(62,'en','title','Preface','string'),(62,'fr_CA','abstract','','string'),(62,'fr_CA','subtitle','','string'),(62,'fr_CA','title','','string'),(63,'','datePublished',NULL,'string'),(63,'','isPageEnabled',NULL,'string'),(63,'','licenseUrl',NULL,'string'),(63,'','pages','','string'),(63,'en','abstract','','string'),(63,'en','subtitle','','string'),(63,'en','title','The Case Studies','string'),(63,'fr_CA','abstract','','string'),(63,'fr_CA','subtitle','','string'),(63,'fr_CA','title','','string'),(64,'','datePublished',NULL,'string'),(64,'','isPageEnabled',NULL,'string'),(64,'','licenseUrl',NULL,'string'),(64,'','pages','','string'),(64,'en','abstract','','string'),(64,'en','subtitle','','string'),(64,'en','title','Conclusion','string'),(64,'fr_CA','abstract','','string'),(64,'fr_CA','subtitle','','string'),(64,'fr_CA','title','','string'),(65,'','datePublished',NULL,'string'),(65,'','isPageEnabled',NULL,'string'),(65,'','licenseUrl',NULL,'string'),(65,'','pages','','string'),(65,'en','abstract','','string'),(65,'en','subtitle','','string'),(65,'en','title','Bibliography','string'),(65,'fr_CA','abstract','','string'),(65,'fr_CA','subtitle','','string'),(65,'fr_CA','title','','string'),(66,'','datePublished',NULL,'string'),(66,'','isPageEnabled',NULL,'string'),(66,'','licenseUrl',NULL,'string'),(66,'','pages','','string'),(66,'en','abstract','','string'),(66,'en','subtitle','','string'),(66,'en','title','Preface','string'),(66,'fr_CA','abstract','','string'),(66,'fr_CA','subtitle','','string'),(66,'fr_CA','title','','string'),(67,'','datePublished',NULL,'string'),(67,'','isPageEnabled',NULL,'string'),(67,'','licenseUrl',NULL,'string'),(67,'','pages','','string'),(67,'en','abstract','','string'),(67,'en','subtitle','','string'),(67,'en','title','Introduction','string'),(67,'fr_CA','abstract','','string'),(67,'fr_CA','subtitle','','string'),(67,'fr_CA','title','','string'),(68,'','datePublished',NULL,'string'),(68,'','isPageEnabled',NULL,'string'),(68,'','licenseUrl',NULL,'string'),(68,'','pages','','string'),(68,'en','abstract','','string'),(68,'en','subtitle','','string'),(68,'en','title','The Emergence of Open Development in a Network Society','string'),(68,'fr_CA','abstract','','string'),(68,'fr_CA','subtitle','','string'),(68,'fr_CA','title','','string'),(69,'','datePublished',NULL,'string'),(69,'','isPageEnabled',NULL,'string'),(69,'','licenseUrl',NULL,'string'),(69,'','pages','','string'),(69,'en','abstract','','string'),(69,'en','subtitle','','string'),(69,'en','title','Enacting Openness in ICT4D Research','string'),(69,'fr_CA','abstract','','string'),(69,'fr_CA','subtitle','','string'),(69,'fr_CA','title','','string'),(70,'','datePublished',NULL,'string'),(70,'','isPageEnabled',NULL,'string'),(70,'','licenseUrl',NULL,'string'),(70,'','pages','','string'),(70,'en','abstract','','string'),(70,'en','subtitle','','string'),(70,'en','title','Transparency and Development: Ethical Consumption through Web 2.0 and the Internet of Things','string'),(70,'fr_CA','abstract','','string'),(70,'fr_CA','subtitle','','string'),(70,'fr_CA','title','','string'),(71,'','datePublished',NULL,'string'),(71,'','isPageEnabled',NULL,'string'),(71,'','licenseUrl',NULL,'string'),(71,'','pages','','string'),(71,'en','abstract','','string'),(71,'en','subtitle','','string'),(71,'en','title','Open Educational Resources: Opportunities and Challenges for the Developing World','string'),(71,'fr_CA','abstract','','string'),(71,'fr_CA','subtitle','','string'),(71,'fr_CA','title','','string');
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
INSERT INTO `submission_comments` VALUES (1,1,4096,11,10,10,'','<p>I recommend that the author revise this submission.</p>','2023-03-02 23:05:11',NULL,1),(2,1,4096,11,11,12,'','<p>I recommend that the author resubmit this submission.</p>','2023-03-02 23:05:23',NULL,1),(3,1,4096,12,13,8,'','<p>I recommend declining this submission.</p>','2023-03-02 23:07:24',NULL,1),(4,1,4096,13,16,10,'','<p>I recommend requiring revisions.</p>','2023-03-02 23:09:16',NULL,1),(5,1,4096,13,18,12,'','<p>I recommend resubmitting.</p>','2023-03-02 23:09:28',NULL,1),(6,1,4096,16,21,10,'','<p>I recommend that the author revise this submission.</p>','2023-03-02 23:16:00',NULL,1);
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
INSERT INTO `submission_file_revisions` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,2),(5,5,3),(6,6,1),(7,7,4),(8,8,5),(9,9,6),(10,10,7),(12,12,7),(13,13,5),(14,14,4),(15,15,6),(16,16,9),(17,17,10),(18,18,11),(19,19,12),(20,20,13),(21,21,14),(22,22,15),(23,23,16),(24,24,17),(25,25,17),(26,26,16),(27,27,14),(28,28,15),(29,29,18),(30,30,19),(31,31,20),(32,32,21),(33,33,22),(34,34,23),(35,35,22),(36,36,23),(37,37,20),(38,38,21),(39,39,19),(40,40,18),(41,41,23),(42,42,24),(43,43,25),(44,44,26),(45,45,27),(46,46,26),(47,47,27),(48,48,25),(49,49,24),(50,50,28),(51,51,29),(52,52,30),(53,53,31),(54,54,32),(55,55,32),(56,56,30),(57,57,29),(58,58,31),(59,59,28),(60,60,33),(61,61,34),(62,62,35),(63,63,36),(64,64,37),(65,65,38),(66,66,38),(67,67,37),(68,68,36),(69,69,35),(70,70,34),(71,71,39),(72,72,40),(73,73,41),(74,74,42),(75,75,43),(76,76,44),(77,77,45),(78,78,46),(79,79,47),(80,80,48),(81,81,49),(82,82,49),(83,83,48),(84,84,50),(85,85,51),(86,86,52),(87,87,52),(88,88,51),(89,89,50),(90,90,53),(91,91,54),(92,92,55),(93,93,55),(94,94,53),(95,95,54),(96,96,56),(97,97,57),(98,98,58),(99,99,59),(100,100,60),(101,101,61),(102,102,61),(103,103,60),(104,104,59),(105,105,58),(106,106,57),(107,107,56),(108,108,61),(109,109,60),(110,110,59),(111,111,58),(112,112,57),(113,113,56),(114,114,62),(115,115,63),(116,116,64),(117,117,64),(118,118,62),(119,119,63),(120,120,65),(121,121,66),(122,122,67),(123,123,68),(124,124,69),(125,125,69),(126,126,67),(127,127,66),(128,128,65),(129,129,68),(130,130,70),(131,131,71),(132,132,72),(133,133,73),(134,134,74),(135,135,75),(136,136,75),(137,137,74),(138,138,73),(139,139,72),(140,140,71),(141,141,70);
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
INSERT INTO `submission_file_settings` VALUES (1,'','chapterId','1','string'),(1,'en','name','chapter1.pdf','string'),(2,'','chapterId','2','string'),(2,'en','name','chapter2.pdf','string'),(3,'','chapterId','3','string'),(3,'en','name','chapter3.pdf','string'),(4,'','chapterId','2','string'),(4,'en','name','chapter2.pdf','string'),(5,'','chapterId','3','string'),(5,'en','name','chapter3.pdf','string'),(6,'','chapterId','1','string'),(6,'en','name','chapter1.pdf','string'),(7,'','chapterId','4','string'),(7,'en','name','chapter1.pdf','string'),(8,'','chapterId','5','string'),(8,'en','name','chapter2.pdf','string'),(9,'','chapterId','6','string'),(9,'en','name','chapter3.pdf','string'),(10,'','chapterId','7','string'),(10,'en','name','chapter4.pdf','string'),(12,'','chapterId','7','string'),(12,'en','name','chapter4.pdf','string'),(13,'','chapterId','5','string'),(13,'en','name','chapter2.pdf','string'),(14,'','chapterId','4','string'),(14,'en','name','chapter1.pdf','string'),(15,'','chapterId','6','string'),(15,'en','name','chapter3.pdf','string'),(16,'','chapterId','8','string'),(16,'en','name','chapter1.pdf','string'),(17,'','chapterId','9','string'),(17,'en','name','chapter2.pdf','string'),(18,'','chapterId','10','string'),(18,'en','name','chapter3.pdf','string'),(19,'','chapterId','11','string'),(19,'en','name','chapter4.pdf','string'),(20,'','chapterId','12','string'),(20,'en','name','chapter5.pdf','string'),(21,'','chapterId','14','string'),(21,'en','name','chapter1.pdf','string'),(22,'','chapterId','15','string'),(22,'en','name','chapter2.pdf','string'),(23,'','chapterId','16','string'),(23,'en','name','chapter3.pdf','string'),(24,'','chapterId','13','string'),(24,'en','name','intro.pdf','string'),(25,'','chapterId','13','string'),(25,'en','name','intro.pdf','string'),(26,'','chapterId','16','string'),(26,'en','name','chapter3.pdf','string'),(27,'','chapterId','14','string'),(27,'en','name','chapter1.pdf','string'),(28,'','chapterId','15','string'),(28,'en','name','chapter2.pdf','string'),(29,'','chapterId','17','string'),(29,'en','name','prologue.pdf','string'),(30,'','chapterId','18','string'),(30,'en','name','chapter1.pdf','string'),(31,'','chapterId','19','string'),(31,'en','name','chapter2.pdf','string'),(32,'','chapterId','20','string'),(32,'en','name','chapter3.pdf','string'),(33,'','chapterId','21','string'),(33,'en','name','chapter4.pdf','string'),(34,'','chapterId','22','string'),(34,'en','name','epilogue.pdf','string'),(35,'','chapterId','21','string'),(35,'en','name','chapter4.pdf','string'),(36,'','chapterId','22','string'),(36,'en','name','epilogue.pdf','string'),(37,'','chapterId','19','string'),(37,'en','name','chapter2.pdf','string'),(38,'','chapterId','20','string'),(38,'en','name','chapter3.pdf','string'),(39,'','chapterId','18','string'),(39,'en','name','chapter1.pdf','string'),(40,'','chapterId','17','string'),(40,'en','name','prologue.pdf','string'),(41,'','chapterId','22','string'),(41,'en','name','epilogue.pdf','string'),(42,'','chapterId','23','string'),(42,'en','name','chapter1.pdf','string'),(43,'','chapterId','24','string'),(43,'en','name','chapter2.pdf','string'),(44,'','chapterId','25','string'),(44,'en','name','chapter3.pdf','string'),(45,'','chapterId','26','string'),(45,'en','name','chapter4.pdf','string'),(46,'','chapterId','25','string'),(46,'en','name','chapter3.pdf','string'),(47,'','chapterId','26','string'),(47,'en','name','chapter4.pdf','string'),(48,'','chapterId','24','string'),(48,'en','name','chapter2.pdf','string'),(49,'','chapterId','23','string'),(49,'en','name','chapter1.pdf','string'),(50,'','chapterId','27','string'),(50,'en','name','intro.pdf','string'),(51,'','chapterId','28','string'),(51,'en','name','chapter1.pdf','string'),(52,'','chapterId','29','string'),(52,'en','name','chapter2.pdf','string'),(53,'','chapterId','30','string'),(53,'en','name','chapter3.pdf','string'),(54,'','chapterId','31','string'),(54,'en','name','chapter4.pdf','string'),(55,'','chapterId','31','string'),(55,'en','name','chapter4.pdf','string'),(56,'','chapterId','29','string'),(56,'en','name','chapter2.pdf','string'),(57,'','chapterId','28','string'),(57,'en','name','chapter1.pdf','string'),(58,'','chapterId','30','string'),(58,'en','name','chapter3.pdf','string'),(59,'','chapterId','27','string'),(59,'en','name','intro.pdf','string'),(60,'en','name','note.pdf','string'),(61,'','chapterId','32','string'),(61,'en','name','chapter1.pdf','string'),(62,'','chapterId','33','string'),(62,'en','name','chapter2.pdf','string'),(63,'','chapterId','34','string'),(63,'en','name','chapter3.pdf','string'),(64,'','chapterId','35','string'),(64,'en','name','chapter4.pdf','string'),(65,'','chapterId','36','string'),(65,'en','name','chapter5.pdf','string'),(66,'','chapterId','36','string'),(66,'en','name','chapter5.pdf','string'),(67,'','chapterId','35','string'),(67,'en','name','chapter4.pdf','string'),(68,'','chapterId','34','string'),(68,'en','name','chapter3.pdf','string'),(69,'','chapterId','33','string'),(69,'en','name','chapter2.pdf','string'),(70,'','chapterId','32','string'),(70,'en','name','chapter1.pdf','string'),(71,'','chapterId','37','string'),(71,'en','name','intro.pdf','string'),(72,'','chapterId','38','string'),(72,'en','name','chapter1.pdf','string'),(73,'','chapterId','39','string'),(73,'en','name','chapter2.pdf','string'),(74,'','chapterId','40','string'),(74,'en','name','chapter3.pdf','string'),(75,'','chapterId','41','string'),(75,'en','name','chapter4.pdf','string'),(76,'','chapterId','42','string'),(76,'en','name','chapter5.pdf','string'),(77,'','chapterId','43','string'),(77,'en','name','conclusion.pdf','string'),(78,'','chapterId','44','string'),(78,'en','name','bibliography.pdf','string'),(79,'','chapterId','45','string'),(79,'en','name','index.pdf','string'),(80,'','chapterId','46','string'),(80,'en','name','intro.pdf','string'),(81,'','chapterId','47','string'),(81,'en','name','poems.pdf','string'),(82,'','chapterId','47','string'),(82,'en','name','poems.pdf','string'),(83,'','chapterId','46','string'),(83,'en','name','intro.pdf','string'),(84,'','chapterId','48','string'),(84,'en','name','chapter1.pdf','string'),(85,'','chapterId','49','string'),(85,'en','name','chapter2.pdf','string'),(86,'','chapterId','50','string'),(86,'en','name','chapter3.pdf','string'),(87,'','chapterId','50','string'),(87,'en','name','chapter3.pdf','string'),(88,'','chapterId','49','string'),(88,'en','name','chapter2.pdf','string'),(89,'','chapterId','48','string'),(89,'en','name','chapter1.pdf','string'),(90,'','chapterId','51','string'),(90,'en','name','chapter1.pdf','string'),(91,'','chapterId','52','string'),(91,'en','name','chapter2.pdf','string'),(92,'','chapterId','53','string'),(92,'en','name','chapter3.pdf','string'),(93,'','chapterId','53','string'),(93,'en','name','chapter3.pdf','string'),(94,'','chapterId','51','string'),(94,'en','name','chapter1.pdf','string'),(95,'','chapterId','52','string'),(95,'en','name','chapter2.pdf','string'),(96,'','chapterId','54','string'),(96,'en','name','chapter1.pdf','string'),(97,'','chapterId','55','string'),(97,'en','name','chapter2.pdf','string'),(98,'','chapterId','56','string'),(98,'en','name','chapter3.pdf','string'),(99,'','chapterId','57','string'),(99,'en','name','chapter4.pdf','string'),(100,'en','name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(101,'en','name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(102,'en','name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(103,'en','name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(104,'','chapterId','57','string'),(104,'en','name','chapter4.pdf','string'),(105,'','chapterId','56','string'),(105,'en','name','chapter3.pdf','string'),(106,'','chapterId','55','string'),(106,'en','name','chapter2.pdf','string'),(107,'','chapterId','54','string'),(107,'en','name','chapter1.pdf','string'),(108,'en','name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(109,'en','name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(110,'','chapterId','57','string'),(110,'en','name','chapter4.pdf','string'),(111,'','chapterId','56','string'),(111,'en','name','chapter3.pdf','string'),(112,'','chapterId','55','string'),(112,'en','name','chapter2.pdf','string'),(113,'','chapterId','54','string'),(113,'en','name','chapter1.pdf','string'),(114,'','chapterId','58','string'),(114,'en','name','chapter1.pdf','string'),(115,'','chapterId','59','string'),(115,'en','name','chapter2.pdf','string'),(116,'','chapterId','60','string'),(116,'en','name','chapter3.pdf','string'),(117,'','chapterId','60','string'),(117,'en','name','chapter3.pdf','string'),(118,'','chapterId','58','string'),(118,'en','name','chapter1.pdf','string'),(119,'','chapterId','59','string'),(119,'en','name','chapter2.pdf','string'),(120,'','chapterId','61','string'),(120,'en','name','foreward.pdf','string'),(121,'','chapterId','62','string'),(121,'en','name','preface.pdf','string'),(122,'','chapterId','63','string'),(122,'en','name','cases.pdf','string'),(123,'','chapterId','64','string'),(123,'en','name','conclusion.pdf','string'),(124,'','chapterId','65','string'),(124,'en','name','bibliography.pdf','string'),(125,'','chapterId','65','string'),(125,'en','name','bibliography.pdf','string'),(126,'','chapterId','63','string'),(126,'en','name','cases.pdf','string'),(127,'','chapterId','62','string'),(127,'en','name','preface.pdf','string'),(128,'','chapterId','61','string'),(128,'en','name','foreward.pdf','string'),(129,'','chapterId','64','string'),(129,'en','name','conclusion.pdf','string'),(130,'','chapterId','66','string'),(130,'en','name','preface.pdf','string'),(131,'','chapterId','67','string'),(131,'en','name','introduction.pdf','string'),(132,'','chapterId','68','string'),(132,'en','name','chapter1.pdf','string'),(133,'','chapterId','69','string'),(133,'en','name','chapter2.pdf','string'),(134,'','chapterId','70','string'),(134,'en','name','chapter3.pdf','string'),(135,'','chapterId','71','string'),(135,'en','name','chapter4.pdf','string'),(136,'','chapterId','71','string'),(136,'en','name','chapter4.pdf','string'),(137,'','chapterId','70','string'),(137,'en','name','chapter3.pdf','string'),(138,'','chapterId','69','string'),(138,'en','name','chapter2.pdf','string'),(139,'','chapterId','68','string'),(139,'en','name','chapter1.pdf','string'),(140,'','chapterId','67','string'),(140,'en','name','introduction.pdf','string'),(141,'','chapterId','66','string'),(141,'en','name','preface.pdf','string');
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
INSERT INTO `submission_files` VALUES (1,1,1,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:46:12','2023-03-02 22:46:13',19,NULL,NULL,NULL),(2,1,2,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:46:13','2023-03-02 22:46:14',19,NULL,NULL,NULL),(3,1,3,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:46:15','2023-03-02 22:46:15',19,NULL,NULL,NULL),(4,1,2,2,3,4,NULL,NULL,NULL,'2023-03-02 22:46:47','2023-03-02 22:46:47',19,523,1,NULL),(5,1,3,3,3,4,NULL,NULL,NULL,'2023-03-02 22:46:47','2023-03-02 22:46:47',19,523,1,NULL),(6,1,1,1,3,4,NULL,NULL,NULL,'2023-03-02 22:46:47','2023-03-02 22:46:47',19,523,1,NULL),(7,2,4,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:47:38','2023-03-02 22:47:38',20,NULL,NULL,NULL),(8,2,5,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:47:39','2023-03-02 22:47:39',20,NULL,NULL,NULL),(9,2,6,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:47:40','2023-03-02 22:47:41',20,NULL,NULL,NULL),(10,2,7,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:47:41','2023-03-02 22:47:42',20,NULL,NULL,NULL),(12,2,7,10,3,4,NULL,NULL,NULL,'2023-03-02 22:50:03','2023-03-02 22:50:03',20,523,2,NULL),(13,2,5,8,3,4,NULL,NULL,NULL,'2023-03-02 22:50:03','2023-03-02 22:50:03',20,523,2,NULL),(14,2,4,7,3,4,NULL,NULL,NULL,'2023-03-02 22:50:03','2023-03-02 22:50:03',20,523,2,NULL),(15,2,6,9,3,4,NULL,NULL,NULL,'2023-03-02 22:50:04','2023-03-02 22:50:04',20,523,2,NULL),(16,3,9,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:50:42','2023-03-02 22:50:43',21,NULL,NULL,NULL),(17,3,10,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:50:44','2023-03-02 22:50:44',21,NULL,NULL,NULL),(18,3,11,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:50:45','2023-03-02 22:50:45',21,NULL,NULL,NULL),(19,3,12,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:50:46','2023-03-02 22:50:46',21,NULL,NULL,NULL),(20,3,13,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:50:47','2023-03-02 22:50:48',21,NULL,NULL,NULL),(21,4,14,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:51:37','2023-03-02 22:51:37',22,NULL,NULL,NULL),(22,4,15,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:51:38','2023-03-02 22:51:38',22,NULL,NULL,NULL),(23,4,16,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:51:39','2023-03-02 22:51:39',22,NULL,NULL,NULL),(24,4,17,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:51:40','2023-03-02 22:51:41',22,NULL,NULL,NULL),(25,4,17,24,3,19,NULL,NULL,NULL,'2023-03-02 22:52:24','2023-03-02 22:52:24',22,523,3,NULL),(26,4,16,23,3,19,NULL,NULL,NULL,'2023-03-02 22:52:25','2023-03-02 22:52:25',22,523,3,NULL),(27,4,14,21,3,19,NULL,NULL,NULL,'2023-03-02 22:52:25','2023-03-02 22:52:25',22,523,3,NULL),(28,4,15,22,3,19,NULL,NULL,NULL,'2023-03-02 22:52:25','2023-03-02 22:52:25',22,523,3,NULL),(29,5,18,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:53:47','2023-03-02 22:53:47',23,NULL,NULL,NULL),(30,5,19,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:53:48','2023-03-02 22:53:48',23,NULL,NULL,NULL),(31,5,20,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:53:49','2023-03-02 22:53:49',23,NULL,NULL,NULL),(32,5,21,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:53:50','2023-03-02 22:53:51',23,NULL,NULL,NULL),(33,5,22,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:53:51','2023-03-02 22:53:52',23,NULL,NULL,NULL),(34,5,23,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:53:52','2023-03-02 22:53:53',23,NULL,NULL,NULL),(35,5,22,33,3,19,NULL,NULL,NULL,'2023-03-02 22:54:53','2023-03-02 22:54:53',23,523,5,NULL),(36,5,23,34,3,19,NULL,NULL,NULL,'2023-03-02 22:54:53','2023-03-02 22:54:53',23,523,5,NULL),(37,5,20,31,3,19,NULL,NULL,NULL,'2023-03-02 22:54:53','2023-03-02 22:54:53',23,523,5,NULL),(38,5,21,32,3,19,NULL,NULL,NULL,'2023-03-02 22:54:53','2023-03-02 22:54:53',23,523,5,NULL),(39,5,19,30,3,19,NULL,NULL,NULL,'2023-03-02 22:54:54','2023-03-02 22:54:54',23,523,5,NULL),(40,5,18,29,3,19,NULL,NULL,NULL,'2023-03-02 22:54:54','2023-03-02 22:54:54',23,523,5,NULL),(41,5,23,34,3,10,'0','openAccess',1,'2023-03-02 22:56:20','2023-03-02 22:56:31',23,521,2,NULL),(42,6,24,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:57:08','2023-03-02 22:57:08',24,NULL,NULL,NULL),(43,6,25,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:57:09','2023-03-02 22:57:09',24,NULL,NULL,NULL),(44,6,26,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:57:10','2023-03-02 22:57:11',24,NULL,NULL,NULL),(45,6,27,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:57:11','2023-03-02 22:57:12',24,NULL,NULL,NULL),(46,6,26,44,3,19,NULL,NULL,NULL,'2023-03-02 22:57:56','2023-03-02 22:57:56',24,523,7,NULL),(47,6,27,45,3,19,NULL,NULL,NULL,'2023-03-02 22:57:56','2023-03-02 22:57:56',24,523,7,NULL),(48,6,25,43,3,19,NULL,NULL,NULL,'2023-03-02 22:57:56','2023-03-02 22:57:56',24,523,7,NULL),(49,6,24,42,3,19,NULL,NULL,NULL,'2023-03-02 22:57:57','2023-03-02 22:57:57',24,523,7,NULL),(50,7,28,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:59:04','2023-03-02 22:59:04',25,NULL,NULL,NULL),(51,7,29,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:59:05','2023-03-02 22:59:05',25,NULL,NULL,NULL),(52,7,30,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:59:06','2023-03-02 22:59:06',25,NULL,NULL,NULL),(53,7,31,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:59:07','2023-03-02 22:59:07',25,NULL,NULL,NULL),(54,7,32,NULL,3,2,NULL,NULL,NULL,'2023-03-02 22:59:08','2023-03-02 22:59:09',25,NULL,NULL,NULL),(55,7,32,54,3,4,NULL,NULL,NULL,'2023-03-02 23:00:04','2023-03-02 23:00:04',25,523,8,NULL),(56,7,30,52,3,4,NULL,NULL,NULL,'2023-03-02 23:00:04','2023-03-02 23:00:04',25,523,8,NULL),(57,7,29,51,3,4,NULL,NULL,NULL,'2023-03-02 23:00:05','2023-03-02 23:00:05',25,523,8,NULL),(58,7,31,53,3,4,NULL,NULL,NULL,'2023-03-02 23:00:05','2023-03-02 23:00:05',25,523,8,NULL),(59,7,28,50,3,4,NULL,NULL,NULL,'2023-03-02 23:00:05','2023-03-02 23:00:05',25,523,8,NULL),(60,8,33,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:00:46','2023-03-02 23:00:46',3,NULL,NULL,NULL),(61,9,34,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:01:00','2023-03-02 23:01:00',26,NULL,NULL,NULL),(62,9,35,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:01:01','2023-03-02 23:01:01',26,NULL,NULL,NULL),(63,9,36,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:01:02','2023-03-02 23:01:02',26,NULL,NULL,NULL),(64,9,37,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:01:03','2023-03-02 23:01:03',26,NULL,NULL,NULL),(65,9,38,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:01:04','2023-03-02 23:01:05',26,NULL,NULL,NULL),(66,9,38,65,3,19,NULL,NULL,NULL,'2023-03-02 23:01:59','2023-03-02 23:01:59',26,523,9,NULL),(67,9,37,64,3,19,NULL,NULL,NULL,'2023-03-02 23:01:59','2023-03-02 23:01:59',26,523,9,NULL),(68,9,36,63,3,19,NULL,NULL,NULL,'2023-03-02 23:01:59','2023-03-02 23:01:59',26,523,9,NULL),(69,9,35,62,3,19,NULL,NULL,NULL,'2023-03-02 23:02:00','2023-03-02 23:02:00',26,523,9,NULL),(70,9,34,61,3,19,NULL,NULL,NULL,'2023-03-02 23:02:00','2023-03-02 23:02:00',26,523,9,NULL),(71,10,39,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:02:18','2023-03-02 23:02:18',27,NULL,NULL,NULL),(72,10,40,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:02:19','2023-03-02 23:02:19',27,NULL,NULL,NULL),(73,10,41,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:02:20','2023-03-02 23:02:20',27,NULL,NULL,NULL),(74,10,42,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:02:21','2023-03-02 23:02:22',27,NULL,NULL,NULL),(75,10,43,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:02:22','2023-03-02 23:02:23',27,NULL,NULL,NULL),(76,10,44,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:02:24','2023-03-02 23:02:24',27,NULL,NULL,NULL),(77,10,45,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:02:25','2023-03-02 23:02:25',27,NULL,NULL,NULL),(78,10,46,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:02:26','2023-03-02 23:02:27',27,NULL,NULL,NULL),(79,10,47,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:02:27','2023-03-02 23:02:28',27,NULL,NULL,NULL),(80,11,48,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:03:58','2023-03-02 23:03:58',28,NULL,NULL,NULL),(81,11,49,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:03:59','2023-03-02 23:03:59',28,NULL,NULL,NULL),(82,11,49,81,3,19,NULL,NULL,NULL,'2023-03-02 23:04:25','2023-03-02 23:04:25',28,523,10,NULL),(83,11,48,80,3,19,NULL,NULL,NULL,'2023-03-02 23:04:26','2023-03-02 23:04:26',28,523,10,NULL),(84,12,50,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:06:02','2023-03-02 23:06:02',29,NULL,NULL,NULL),(85,12,51,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:06:03','2023-03-02 23:06:03',29,NULL,NULL,NULL),(86,12,52,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:06:04','2023-03-02 23:06:04',29,NULL,NULL,NULL),(87,12,52,86,3,19,NULL,NULL,NULL,'2023-03-02 23:06:45','2023-03-02 23:06:45',29,523,12,NULL),(88,12,51,85,3,19,NULL,NULL,NULL,'2023-03-02 23:06:45','2023-03-02 23:06:45',29,523,12,NULL),(89,12,50,84,3,19,NULL,NULL,NULL,'2023-03-02 23:06:45','2023-03-02 23:06:45',29,523,12,NULL),(90,13,53,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:07:38','2023-03-02 23:07:39',30,NULL,NULL,NULL),(91,13,54,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:07:40','2023-03-02 23:07:40',30,NULL,NULL,NULL),(92,13,55,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:07:41','2023-03-02 23:07:41',30,NULL,NULL,NULL),(93,13,55,92,3,19,NULL,NULL,NULL,'2023-03-02 23:08:18','2023-03-02 23:08:18',30,523,13,NULL),(94,13,53,90,3,19,NULL,NULL,NULL,'2023-03-02 23:08:18','2023-03-02 23:08:18',30,523,13,NULL),(95,13,54,91,3,19,NULL,NULL,NULL,'2023-03-02 23:08:19','2023-03-02 23:08:19',30,523,13,NULL),(96,14,56,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:10:07','2023-03-02 23:10:07',31,NULL,NULL,NULL),(97,14,57,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:10:08','2023-03-02 23:10:08',31,NULL,NULL,NULL),(98,14,58,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:10:09','2023-03-02 23:10:09',31,NULL,NULL,NULL),(99,14,59,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:10:10','2023-03-02 23:10:11',31,NULL,NULL,NULL),(100,14,60,NULL,13,2,NULL,NULL,NULL,'2023-03-02 23:10:11','2023-03-02 23:10:12',31,NULL,NULL,NULL),(101,14,61,NULL,9,2,NULL,NULL,NULL,'2023-03-02 23:10:13','2023-03-02 23:10:13',31,NULL,NULL,NULL),(102,14,61,101,9,19,NULL,NULL,NULL,'2023-03-02 23:11:01','2023-03-02 23:11:01',31,523,15,NULL),(103,14,60,100,13,19,NULL,NULL,NULL,'2023-03-02 23:11:01','2023-03-02 23:11:01',31,523,15,NULL),(104,14,59,99,3,19,NULL,NULL,NULL,'2023-03-02 23:11:01','2023-03-02 23:11:01',31,523,15,NULL),(105,14,58,98,3,19,NULL,NULL,NULL,'2023-03-02 23:11:01','2023-03-02 23:11:01',31,523,15,NULL),(106,14,57,97,3,19,NULL,NULL,NULL,'2023-03-02 23:11:01','2023-03-02 23:11:01',31,523,15,NULL),(107,14,56,96,3,19,NULL,NULL,NULL,'2023-03-02 23:11:02','2023-03-02 23:11:02',31,523,15,NULL),(108,14,61,101,9,10,'0','openAccess',1,'2023-03-02 23:12:26','2023-03-02 23:13:07',31,521,3,NULL),(109,14,60,100,13,10,'0','openAccess',1,'2023-03-02 23:12:26','2023-03-02 23:13:01',31,521,3,NULL),(110,14,59,99,3,10,'0','openAccess',1,'2023-03-02 23:12:26','2023-03-02 23:12:54',31,521,3,NULL),(111,14,58,98,3,10,'0','openAccess',1,'2023-03-02 23:12:26','2023-03-02 23:12:48',31,521,3,NULL),(112,14,57,97,3,10,'0','openAccess',1,'2023-03-02 23:12:26','2023-03-02 23:12:42',31,521,3,NULL),(113,14,56,96,3,10,'0','openAccess',1,'2023-03-02 23:12:26','2023-03-02 23:12:37',31,521,3,NULL),(114,15,62,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:13:24','2023-03-02 23:13:25',32,NULL,NULL,NULL),(115,15,63,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:13:25','2023-03-02 23:13:26',32,NULL,NULL,NULL),(116,15,64,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:13:27','2023-03-02 23:13:27',32,NULL,NULL,NULL),(117,15,64,116,3,4,NULL,NULL,NULL,'2023-03-02 23:14:02','2023-03-02 23:14:02',32,523,17,NULL),(118,15,62,114,3,4,NULL,NULL,NULL,'2023-03-02 23:14:02','2023-03-02 23:14:02',32,523,17,NULL),(119,15,63,115,3,4,NULL,NULL,NULL,'2023-03-02 23:14:02','2023-03-02 23:14:02',32,523,17,NULL),(120,16,65,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:14:20','2023-03-02 23:14:20',33,NULL,NULL,NULL),(121,16,66,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:14:21','2023-03-02 23:14:22',33,NULL,NULL,NULL),(122,16,67,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:14:22','2023-03-02 23:14:23',33,NULL,NULL,NULL),(123,16,68,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:14:23','2023-03-02 23:14:24',33,NULL,NULL,NULL),(124,16,69,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:14:25','2023-03-02 23:14:25',33,NULL,NULL,NULL),(125,16,69,124,3,4,NULL,NULL,NULL,'2023-03-02 23:15:17','2023-03-02 23:15:17',33,523,18,NULL),(126,16,67,122,3,4,NULL,NULL,NULL,'2023-03-02 23:15:17','2023-03-02 23:15:17',33,523,18,NULL),(127,16,66,121,3,4,NULL,NULL,NULL,'2023-03-02 23:15:17','2023-03-02 23:15:17',33,523,18,NULL),(128,16,65,120,3,4,NULL,NULL,NULL,'2023-03-02 23:15:17','2023-03-02 23:15:17',33,523,18,NULL),(129,16,68,123,3,4,NULL,NULL,NULL,'2023-03-02 23:15:17','2023-03-02 23:15:17',33,523,18,NULL),(130,17,70,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:16:14','2023-03-02 23:16:14',34,NULL,NULL,NULL),(131,17,71,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:16:15','2023-03-02 23:16:15',34,NULL,NULL,NULL),(132,17,72,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:16:16','2023-03-02 23:16:16',34,NULL,NULL,NULL),(133,17,73,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:16:17','2023-03-02 23:16:17',34,NULL,NULL,NULL),(134,17,74,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:16:18','2023-03-02 23:16:19',34,NULL,NULL,NULL),(135,17,75,NULL,3,2,NULL,NULL,NULL,'2023-03-02 23:16:19','2023-03-02 23:16:20',34,NULL,NULL,NULL),(136,17,75,135,3,19,NULL,NULL,NULL,'2023-03-02 23:17:30','2023-03-02 23:17:30',34,523,19,NULL),(137,17,74,134,3,19,NULL,NULL,NULL,'2023-03-02 23:17:30','2023-03-02 23:17:30',34,523,19,NULL),(138,17,73,133,3,19,NULL,NULL,NULL,'2023-03-02 23:17:30','2023-03-02 23:17:30',34,523,19,NULL),(139,17,72,132,3,19,NULL,NULL,NULL,'2023-03-02 23:17:30','2023-03-02 23:17:30',34,523,19,NULL),(140,17,71,131,3,19,NULL,NULL,NULL,'2023-03-02 23:17:30','2023-03-02 23:17:30',34,523,19,NULL),(141,17,70,130,3,19,NULL,NULL,NULL,'2023-03-02 23:17:30','2023-03-02 23:17:30',34,523,19,NULL);
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
  `submission_progress` varchar(50) NOT NULL DEFAULT 'start',
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
INSERT INTO `submissions` VALUES (1,1,1,'2023-03-02 22:47:12','2023-03-02 22:46:33','2023-03-02 22:46:33',4,'en',1,'',0),(2,1,2,'2023-03-02 22:50:27','2023-03-02 22:49:33','2023-03-02 22:49:33',3,'en',1,'',1),(3,1,3,'2023-03-02 22:51:23','2023-03-02 22:51:23','2023-03-02 22:51:23',1,'en',1,'',0),(4,1,4,'2023-03-02 22:53:34','2023-03-02 22:52:09','2023-03-02 22:52:09',5,'en',1,'',0),(5,1,5,'2023-03-02 22:56:55','2023-03-02 22:54:36','2023-03-02 22:54:36',5,'en',3,'',0),(6,1,6,'2023-03-02 22:58:34','2023-03-02 22:57:40','2023-03-02 22:57:40',2,'en',1,'',0),(7,1,7,'2023-03-02 23:00:33','2023-03-02 22:59:47','2023-03-02 22:59:47',4,'en',1,'',0),(8,1,8,'2023-03-02 23:00:47','2023-03-02 23:00:47','2023-03-02 23:00:47',1,'en',1,'',0),(9,1,9,'2023-03-02 23:02:00','2023-03-02 23:01:43','2023-03-02 23:01:43',2,'en',1,'',0),(10,1,10,'2023-03-02 23:03:45','2023-03-02 23:03:45','2023-03-02 23:03:45',1,'en',1,'',0),(11,1,11,'2023-03-02 23:05:42','2023-03-02 23:04:11','2023-03-02 23:04:11',4,'en',1,'',0),(12,1,12,'2023-03-02 23:07:24','2023-03-02 23:06:28','2023-03-02 23:06:28',2,'en',1,'',0),(13,1,13,'2023-03-02 23:09:49','2023-03-02 23:08:03','2023-03-02 23:08:03',4,'en',1,'',0),(14,1,14,'2023-03-02 23:13:10','2023-03-02 23:10:43','2023-03-02 23:10:43',5,'en',3,'',0),(15,1,15,'2023-03-02 23:14:02','2023-03-02 23:13:46','2023-03-02 23:13:46',3,'en',1,'',0),(16,1,16,'2023-03-02 23:16:00','2023-03-02 23:14:58','2023-03-02 23:14:58',3,'en',1,'',0),(17,1,17,'2023-03-02 23:17:50','2023-03-02 23:17:10','2023-03-02 23:17:10',2,'en',1,'',0);
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
INSERT INTO `user_group_settings` VALUES (1,'en','name','Site Admin'),(1,'fr_CA','name','Administrateur-trice du site'),(2,'','abbrevLocaleKey','default.groups.abbrev.manager'),(2,'','nameLocaleKey','default.groups.name.manager'),(2,'en','abbrev','PM'),(2,'en','name','Press manager'),(2,'fr_CA','abbrev','MP'),(2,'fr_CA','name','Gestionnaire de la presse'),(3,'','abbrevLocaleKey','default.groups.abbrev.editor'),(3,'','nameLocaleKey','default.groups.name.editor'),(3,'en','abbrev','PE'),(3,'en','name','Press editor'),(3,'fr_CA','abbrev','RP'),(3,'fr_CA','name','Rédacteur/Rédactrice en chef de la presse'),(4,'','abbrevLocaleKey','default.groups.abbrev.productionEditor'),(4,'','nameLocaleKey','default.groups.name.productionEditor'),(4,'en','abbrev','ProdE'),(4,'en','name','Production editor'),(4,'fr_CA','abbrev','DirProd'),(4,'fr_CA','name','Directeur-trice de production'),(5,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor'),(5,'','nameLocaleKey','default.groups.name.sectionEditor'),(5,'en','abbrev','AcqE'),(5,'en','name','Series editor'),(5,'fr_CA','abbrev','RS'),(5,'fr_CA','name','Rédacteur/Rédactrice en chef de la série'),(6,'','abbrevLocaleKey','default.groups.abbrev.copyeditor'),(6,'','nameLocaleKey','default.groups.name.copyeditor'),(6,'en','abbrev','CE'),(6,'en','name','Copyeditor'),(6,'fr_CA','abbrev','RÉV'),(6,'fr_CA','name','Réviseur-e'),(7,'','abbrevLocaleKey','default.groups.abbrev.designer'),(7,'','nameLocaleKey','default.groups.name.designer'),(7,'en','abbrev','Design'),(7,'en','name','Designer'),(7,'fr_CA','abbrev','Design'),(7,'fr_CA','name','Designer'),(8,'','abbrevLocaleKey','default.groups.abbrev.funding'),(8,'','nameLocaleKey','default.groups.name.funding'),(8,'en','abbrev','FC'),(8,'en','name','Funding coordinator'),(8,'fr_CA','abbrev','CF'),(8,'fr_CA','name','Coordonnateur-trice du financement'),(9,'','abbrevLocaleKey','default.groups.abbrev.indexer'),(9,'','nameLocaleKey','default.groups.name.indexer'),(9,'en','abbrev','IND'),(9,'en','name','Indexer'),(9,'fr_CA','abbrev','Indx'),(9,'fr_CA','name','Indexeur-e'),(10,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor'),(10,'','nameLocaleKey','default.groups.name.layoutEditor'),(10,'en','abbrev','LE'),(10,'en','name','Layout Editor'),(10,'fr_CA','abbrev','RespMP'),(10,'fr_CA','name','Responsable de la mise en page'),(11,'','abbrevLocaleKey','default.groups.abbrev.marketing'),(11,'','nameLocaleKey','default.groups.name.marketing'),(11,'en','abbrev','MS'),(11,'en','name','Marketing and sales coordinator'),(11,'fr_CA','abbrev','CVM'),(11,'fr_CA','name','Coordonnateur-trice des ventes et du marketing'),(12,'','abbrevLocaleKey','default.groups.abbrev.proofreader'),(12,'','nameLocaleKey','default.groups.name.proofreader'),(12,'en','abbrev','PR'),(12,'en','name','Proofreader'),(12,'fr_CA','abbrev','CorEp'),(12,'fr_CA','name','Correcteur-trice d\'épreuves'),(13,'','abbrevLocaleKey','default.groups.abbrev.author'),(13,'','nameLocaleKey','default.groups.name.author'),(13,'en','abbrev','AU'),(13,'en','name','Author'),(13,'fr_CA','abbrev','AU'),(13,'fr_CA','name','Auteur-e'),(14,'','abbrevLocaleKey','default.groups.abbrev.volumeEditor'),(14,'','nameLocaleKey','default.groups.name.volumeEditor'),(14,'','recommendOnly','0'),(14,'en','abbrev','VE'),(14,'en','name','Volume editor'),(14,'fr_CA','abbrev','RV'),(14,'fr_CA','name','Rédacteur/Rédactrice en chef du volume'),(15,'','abbrevLocaleKey','default.groups.abbrev.chapterAuthor'),(15,'','nameLocaleKey','default.groups.name.chapterAuthor'),(15,'en','abbrev','CA'),(15,'en','name','Chapter Author'),(15,'fr_CA','abbrev','AC'),(15,'fr_CA','name','Auteur du chapitre'),(16,'','abbrevLocaleKey','default.groups.abbrev.translator'),(16,'','nameLocaleKey','default.groups.name.translator'),(16,'en','abbrev','Trans'),(16,'en','name','Translator'),(16,'fr_CA','abbrev','Trad'),(16,'fr_CA','name','Traducteur-trice'),(17,'','abbrevLocaleKey','default.groups.abbrev.internalReviewer'),(17,'','nameLocaleKey','default.groups.name.internalReviewer'),(17,'en','abbrev','IR'),(17,'en','name','Internal Reviewer'),(17,'fr_CA','abbrev','EvalInt'),(17,'fr_CA','name','Évaluateur-trice interne'),(18,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer'),(18,'','nameLocaleKey','default.groups.name.externalReviewer'),(18,'en','abbrev','ER'),(18,'en','name','External Reviewer'),(18,'fr_CA','abbrev','EvEx'),(18,'fr_CA','name','Évaluateur-trice externe'),(19,'','abbrevLocaleKey','default.groups.abbrev.reader'),(19,'','nameLocaleKey','default.groups.name.reader'),(19,'en','abbrev','Read'),(19,'en','name','Reader'),(19,'fr_CA','abbrev','Lect'),(19,'fr_CA','name','Lecteur-trice');
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
INSERT INTO `user_settings` VALUES (1,'en','familyName','admin'),(1,'en','givenName','admin'),(2,'','orcid',''),(2,'en','affiliation','Universidad Nacional Autónoma de México'),(2,'en','biography',''),(2,'en','familyName','Vaca'),(2,'en','givenName','Ramiro'),(2,'en','preferredPublicName',''),(2,'en','signature',''),(2,'fr_CA','affiliation',''),(2,'fr_CA','biography',''),(2,'fr_CA','familyName',''),(2,'fr_CA','givenName',''),(2,'fr_CA','preferredPublicName',''),(2,'fr_CA','signature',''),(3,'','orcid',''),(3,'en','affiliation','University of Melbourne'),(3,'en','biography',''),(3,'en','familyName','Barnes'),(3,'en','givenName','Daniel'),(3,'en','preferredPublicName',''),(3,'en','signature',''),(3,'fr_CA','affiliation',''),(3,'fr_CA','biography',''),(3,'fr_CA','familyName',''),(3,'fr_CA','givenName',''),(3,'fr_CA','preferredPublicName',''),(3,'fr_CA','signature',''),(4,'','orcid',''),(4,'en','affiliation','University of Chicago'),(4,'en','biography',''),(4,'en','familyName','Buskins'),(4,'en','givenName','David'),(4,'en','preferredPublicName',''),(4,'en','signature',''),(4,'fr_CA','affiliation',''),(4,'fr_CA','biography',''),(4,'fr_CA','familyName',''),(4,'fr_CA','givenName',''),(4,'fr_CA','preferredPublicName',''),(4,'fr_CA','signature',''),(5,'','orcid',''),(5,'en','affiliation','University of Toronto'),(5,'en','biography',''),(5,'en','familyName','Berardo'),(5,'en','givenName','Stephanie'),(5,'en','preferredPublicName',''),(5,'en','signature',''),(5,'fr_CA','affiliation',''),(5,'fr_CA','biography',''),(5,'fr_CA','familyName',''),(5,'fr_CA','givenName',''),(5,'fr_CA','preferredPublicName',''),(5,'fr_CA','signature',''),(6,'','orcid',''),(6,'en','affiliation','Kyoto University'),(6,'en','biography',''),(6,'en','familyName','Inoue'),(6,'en','givenName','Minoti'),(6,'en','preferredPublicName',''),(6,'en','signature',''),(6,'fr_CA','affiliation',''),(6,'fr_CA','biography',''),(6,'fr_CA','familyName',''),(6,'fr_CA','givenName',''),(6,'fr_CA','preferredPublicName',''),(6,'fr_CA','signature',''),(7,'','orcid',''),(7,'en','affiliation','Utrecht University'),(7,'en','biography',''),(7,'en','familyName','Janssen'),(7,'en','givenName','Julie'),(7,'en','preferredPublicName',''),(7,'en','signature',''),(7,'fr_CA','affiliation',''),(7,'fr_CA','biography',''),(7,'fr_CA','familyName',''),(7,'fr_CA','givenName',''),(7,'fr_CA','preferredPublicName',''),(7,'fr_CA','signature',''),(8,'','orcid',''),(8,'en','affiliation','McGill University'),(8,'en','biography',''),(8,'en','familyName','Hudson'),(8,'en','givenName','Paul'),(8,'en','preferredPublicName',''),(8,'en','signature',''),(8,'fr_CA','affiliation',''),(8,'fr_CA','biography',''),(8,'fr_CA','familyName',''),(8,'fr_CA','givenName',''),(8,'fr_CA','preferredPublicName',''),(8,'fr_CA','signature',''),(9,'','orcid',''),(9,'en','affiliation','University of Manitoba'),(9,'en','biography',''),(9,'en','familyName','McCrae'),(9,'en','givenName','Aisla'),(9,'en','preferredPublicName',''),(9,'en','signature',''),(9,'fr_CA','affiliation',''),(9,'fr_CA','biography',''),(9,'fr_CA','familyName',''),(9,'fr_CA','givenName',''),(9,'fr_CA','preferredPublicName',''),(9,'fr_CA','signature',''),(10,'','orcid',''),(10,'en','affiliation','State University of New York'),(10,'en','biography',''),(10,'en','familyName','Gallego'),(10,'en','givenName','Adela'),(10,'en','preferredPublicName',''),(10,'en','signature',''),(10,'fr_CA','affiliation',''),(10,'fr_CA','biography',''),(10,'fr_CA','familyName',''),(10,'fr_CA','givenName',''),(10,'fr_CA','preferredPublicName',''),(10,'fr_CA','signature',''),(11,'','orcid',''),(11,'en','affiliation','KNUST'),(11,'en','biography',''),(11,'en','familyName','Zacharia'),(11,'en','givenName','Al'),(11,'en','preferredPublicName',''),(11,'en','signature',''),(11,'fr_CA','affiliation',''),(11,'fr_CA','biography',''),(11,'fr_CA','familyName',''),(11,'fr_CA','givenName',''),(11,'fr_CA','preferredPublicName',''),(11,'fr_CA','signature',''),(12,'','orcid',''),(12,'en','affiliation','Madrid'),(12,'en','biography',''),(12,'en','familyName','Favio'),(12,'en','givenName','Gonzalo'),(12,'en','preferredPublicName',''),(12,'en','signature',''),(12,'fr_CA','affiliation',''),(12,'fr_CA','biography',''),(12,'fr_CA','familyName',''),(12,'fr_CA','givenName',''),(12,'fr_CA','preferredPublicName',''),(12,'fr_CA','signature',''),(13,'','orcid',''),(13,'en','affiliation','Ghent University'),(13,'en','biography',''),(13,'en','familyName','Fritz'),(13,'en','givenName','Maria'),(13,'en','preferredPublicName',''),(13,'en','signature',''),(13,'fr_CA','affiliation',''),(13,'fr_CA','biography',''),(13,'fr_CA','familyName',''),(13,'fr_CA','givenName',''),(13,'fr_CA','preferredPublicName',''),(13,'fr_CA','signature',''),(14,'','orcid',''),(14,'en','affiliation','Universidad de Chile'),(14,'en','biography',''),(14,'en','familyName','Vogt'),(14,'en','givenName','Sarah'),(14,'en','preferredPublicName',''),(14,'en','signature',''),(14,'fr_CA','affiliation',''),(14,'fr_CA','biography',''),(14,'fr_CA','familyName',''),(14,'fr_CA','givenName',''),(14,'fr_CA','preferredPublicName',''),(14,'fr_CA','signature',''),(15,'','orcid',''),(15,'en','affiliation','Duke University'),(15,'en','biography',''),(15,'en','familyName','Cox'),(15,'en','givenName','Graham'),(15,'en','preferredPublicName',''),(15,'en','signature',''),(15,'fr_CA','affiliation',''),(15,'fr_CA','biography',''),(15,'fr_CA','familyName',''),(15,'fr_CA','givenName',''),(15,'fr_CA','preferredPublicName',''),(15,'fr_CA','signature',''),(16,'','orcid',''),(16,'en','affiliation','University of Cape Town'),(16,'en','biography',''),(16,'en','familyName','Hellier'),(16,'en','givenName','Stephen'),(16,'en','preferredPublicName',''),(16,'en','signature',''),(16,'fr_CA','affiliation',''),(16,'fr_CA','biography',''),(16,'fr_CA','familyName',''),(16,'fr_CA','givenName',''),(16,'fr_CA','preferredPublicName',''),(16,'fr_CA','signature',''),(17,'','orcid',''),(17,'en','affiliation','Imperial College London'),(17,'en','biography',''),(17,'en','familyName','Turner'),(17,'en','givenName','Catherine'),(17,'en','preferredPublicName',''),(17,'en','signature',''),(17,'fr_CA','affiliation',''),(17,'fr_CA','biography',''),(17,'fr_CA','familyName',''),(17,'fr_CA','givenName',''),(17,'fr_CA','preferredPublicName',''),(17,'fr_CA','signature',''),(18,'','orcid',''),(18,'en','affiliation','National University of Singapore'),(18,'en','biography',''),(18,'en','familyName','Kumar'),(18,'en','givenName','Sabine'),(18,'en','preferredPublicName',''),(18,'en','signature',''),(18,'fr_CA','affiliation',''),(18,'fr_CA','biography',''),(18,'fr_CA','familyName',''),(18,'fr_CA','givenName',''),(18,'fr_CA','preferredPublicName',''),(18,'fr_CA','signature',''),(19,'en','affiliation','University of Calgary'),(19,'en','familyName','Clark'),(19,'en','givenName','Arthur'),(20,'en','affiliation','Athabasca University'),(20,'en','familyName','Finkel'),(20,'en','givenName','Alvin'),(21,'en','affiliation','Athabasca University'),(21,'en','familyName','Barnetson'),(21,'en','givenName','Bob'),(22,'en','affiliation','University of British Columbia'),(22,'en','familyName','Beaty'),(22,'en','givenName','Bart'),(23,'en','affiliation','University of Southern California'),(23,'en','familyName','Allan'),(23,'en','givenName','Chantal'),(24,'en','affiliation','SUNY'),(24,'en','familyName','Bernnard'),(24,'en','givenName','Deborah'),(25,'en','affiliation','Athabasca University'),(25,'en','familyName','Kennepohl'),(25,'en','givenName','Dietmar'),(26,'en','affiliation','University of Sussex'),(26,'en','familyName','Perini'),(26,'en','givenName','Fernando'),(27,'en','affiliation','Buffalo National Park Foundation'),(27,'en','familyName','Brower'),(27,'en','givenName','Jennifer'),(28,'en','affiliation','University of Alberta'),(28,'en','familyName','Locke Hart'),(28,'en','givenName','Jonathan'),(29,'en','affiliation','International Development Research Centre'),(29,'en','familyName','Elder'),(29,'en','givenName','Laurent'),(30,'en','affiliation','Athabasca University'),(30,'en','familyName','Ally'),(30,'en','givenName','Mohamed'),(31,'en','affiliation','University of Alberta'),(31,'en','familyName','Dawson'),(31,'en','givenName','Michael'),(32,'en','affiliation','University of Calgary'),(32,'en','familyName','Foran'),(32,'en','givenName','Max'),(33,'en','affiliation','London School of Economics'),(33,'en','familyName','Power'),(33,'en','givenName','Michael'),(34,'en','affiliation','International Development Research Centre'),(34,'en','familyName','Smith'),(34,'en','givenName','Matthew');
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
INSERT INTO `users` VALUES (1,'admin','$2y$10$S5EEB.kZ9rK1QNbydLAzSuR5n5Bt82i03qAvcTXzAx2f4gBEz6L.O','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,'[]',NULL,NULL,'2023-03-02 22:40:33',NULL,'2023-03-02 22:45:40',NULL,NULL,NULL,0,NULL,1),(2,'rvaca','$2y$10$4KKYzgPraxyc.FfXMoaBtusV29yu17lUhx9fGdQzfMkipVx27quJi','rvaca@mailinator.com','','','',NULL,'MX','[]',NULL,NULL,'2023-03-02 22:42:19',NULL,'2023-03-02 22:45:07',0,NULL,NULL,0,NULL,1),(3,'dbarnes','$2y$10$tM8y0JYu10ASJCnmj7vptu7nnrYTi/LjZk5LeDOr6WMSGf8.FbN92','dbarnes@mailinator.com','','','',NULL,'AU','[]',NULL,NULL,'2023-03-02 22:42:25',NULL,'2023-03-02 23:17:12',0,NULL,NULL,0,NULL,1),(4,'dbuskins','$2y$10$7WJvwhMTQtOa/mcYjJJap.tGZut3PNu2emKrx9v.dYrRz36xcrN8q','dbuskins@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2023-03-02 22:42:32',NULL,NULL,0,NULL,NULL,0,NULL,1),(5,'sberardo','$2y$10$ZEnX2K/eT/bPUzkwefeRzen/6c9iJLZBuHvfRaDY9Kh76U03lM8yK','sberardo@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2023-03-02 22:42:39',NULL,NULL,0,NULL,NULL,0,NULL,1),(6,'minoue','$2y$10$Jr8oG5WI0Z9gCP937i9ExuVX42P0Sp0kbAWEoC46Zuerky9xly4c6','minoue@mailinator.com','','','',NULL,'JP','[]',NULL,NULL,'2023-03-02 22:42:47',NULL,'2023-03-02 22:58:21',0,NULL,NULL,0,NULL,1),(7,'jjanssen','$2y$10$4QBSgxYn3mTRofL3r/2CsOQKlEIsq2.gshBPdNbBoOIDeAGm8/rx6','jjanssen@mailinator.com','','','',NULL,'NL','[]',NULL,NULL,'2023-03-02 22:42:54',NULL,NULL,0,NULL,NULL,0,NULL,1),(8,'phudson','$2y$10$JiY3P8TiuM7.qAXqVoU0n.OELpqQMvrlDHZjMFtEbtEpJzoHjBszm','phudson@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2023-03-02 22:43:02',NULL,'2023-03-02 23:07:13',0,NULL,NULL,0,NULL,1),(9,'amccrae','$2y$10$ecacPU6Jw0pPLtxaaLfBmefimbt8pm7axUeshctp/jnHQEaRm6nBm','amccrae@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2023-03-02 22:43:11',NULL,NULL,0,NULL,NULL,0,NULL,1),(10,'agallego','$2y$10$8CZquyN5Q95nWkFrQsfgLuSaRdj9VhfDVxzLpCBSpFonN/4PYdhTO','agallego@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2023-03-02 22:43:19',NULL,'2023-03-02 23:15:47',0,NULL,NULL,0,NULL,1),(11,'alzacharia','$2y$10$xmFdaWADDFUfqkwlcugNeOB7wAoyZgibrFWaBRJfiu1OAzTkOz4Gi','alzacharia@mailinator.com','','','',NULL,'GH','[]',NULL,NULL,'2023-03-02 22:43:29',NULL,NULL,0,NULL,NULL,0,NULL,1),(12,'gfavio','$2y$10$GiZLZesHy79epeOJzELtPuwXughIyYaXcr4MqiWZZ.vD917RqMR2G','gfavio@mailinator.com','','','',NULL,'ES','[]',NULL,NULL,'2023-03-02 22:43:40',NULL,'2023-03-02 23:09:17',0,NULL,NULL,0,NULL,1),(13,'mfritz','$2y$10$Vcv7EyD19wa3MB9reRL6v.kD4C1mah0bfAolgz6WjMjLwd1qtyGB.','mfritz@mailinator.com','','','',NULL,'BE','[]',NULL,NULL,'2023-03-02 22:43:50',NULL,NULL,0,NULL,NULL,0,NULL,1),(14,'svogt','$2y$10$sPOy4p2X30PqZLr8PLpuZOb9FhdHy52tsbv1grGxVUjFTIMFF3j9e','svogt@mailinator.com','','','',NULL,'CL','[]',NULL,NULL,'2023-03-02 22:44:01',NULL,NULL,0,NULL,NULL,0,NULL,1),(15,'gcox','$2y$10$YRp9EC9fQPpdeVfmM2JcxeSKUBuohhzfxb.ix7RQfraGAxbhdcsqa','gcox@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2023-03-02 22:44:12',NULL,NULL,0,NULL,NULL,0,NULL,1),(16,'shellier','$2y$10$KINZ24pAAIjHKKit613Rz.iaLmBxkylhVCbNVITgvzvk8XgfZx.K6','shellier@mailinator.com','','','',NULL,'ZA','[]',NULL,NULL,'2023-03-02 22:44:25',NULL,NULL,0,NULL,NULL,0,NULL,1),(17,'cturner','$2y$10$Gx3ZfKGonkRgtH4ymBnn5uqasdhsnC/.VjpZvSBJJAalUPcs3v5o6','cturner@mailinator.com','','','',NULL,'GB','[]',NULL,NULL,'2023-03-02 22:44:36',NULL,NULL,0,NULL,NULL,0,NULL,1),(18,'skumar','$2y$10$B8SIQavS1cdfPr3hiIhXgOUTw/RKU47HVV1X8itlfrecMiAT3RE5y','skumar@mailinator.com','','','',NULL,'SG','[]',NULL,NULL,'2023-03-02 22:44:49',NULL,NULL,0,NULL,NULL,0,NULL,1),(19,'aclark','$2y$10$tiB6IoCXXaALzVN.cOd9B.YvDjmFknayUAAviKDvY.78EIWz1DPZG','aclark@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-02 22:46:06',NULL,'2023-03-02 22:46:06',NULL,NULL,NULL,0,NULL,1),(20,'afinkel','$2y$10$fB1ZbKWJqmHx85VTP9ynZet8VLPL1SnYtFp9MgCT8tz47OzDiwPhG','afinkel@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-02 22:47:19',NULL,'2023-03-02 22:47:19',NULL,NULL,NULL,0,NULL,1),(21,'bbarnetson','$2y$10$Mnj47movr/0Gd6DNPv20duNc8KRa2hqk98bLQ3MAZIm0a.3eMVNya','bbarnetson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-02 22:50:36',NULL,'2023-03-02 22:50:36',NULL,NULL,NULL,0,NULL,1),(22,'bbeaty','$2y$10$bxtE83Fm3TmOpRbE7esZ1Oxvg3jUP3dFxjoCfVbbbKcuh3bI8qoru','bbeaty@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-02 22:51:30',NULL,'2023-03-02 22:51:30',NULL,NULL,NULL,0,NULL,1),(23,'callan','$2y$10$0/8Wtdelxm/dpcN15J7X/uQ/Q0wuxo07GrpRwucTS5JKWwK6qbDuG','callan@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-02 22:53:40',NULL,'2023-03-02 22:53:40',NULL,NULL,NULL,0,NULL,1),(24,'dbernnard','$2y$10$FYT9G2QLmFkwJr4Xu45Gm.GgUwA9i4EoQjvfKtXhPygRKdmtNEf/y','dbernnard@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2023-03-02 22:57:02',NULL,'2023-03-02 22:57:02',NULL,NULL,NULL,0,NULL,1),(25,'dkennepohl','$2y$10$hZNmRQkkdRhP7F1dZ8gVSeeXpf1Tmd3ZhfzLINmmoHyK3FtxYgkBm','dkennepohl@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-02 22:58:57',NULL,'2023-03-02 22:58:57',NULL,NULL,NULL,0,NULL,1),(26,'fperini','$2y$10$g8LKnvPIqg5f8OJI3yLJ/eWDLPokCf1Srs4785cgXv7O.7cQCCnnq','fperini@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-02 23:00:53',NULL,'2023-03-02 23:00:53',NULL,NULL,NULL,0,NULL,1),(27,'jbrower','$2y$10$AusB/VyyGWziupCtvsLZn.wkCLYouf/vQwhHICN1SXA9RVpl13IgO','jbrower@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-02 23:02:11',NULL,'2023-03-02 23:02:11',NULL,NULL,NULL,0,NULL,1),(28,'jlockehart','$2y$10$gGW0/EOcB/MBevFdviOenOZFEiwVPR1aszsJfQaUYfziEkAt5y6o2','jlockehart@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-02 23:03:52',NULL,'2023-03-02 23:03:52',NULL,NULL,NULL,0,NULL,1),(29,'lelder','$2y$10$UzQR53MeLykhAawXbTySP.qPlJ0umFMKARq3XhYY5IVAz/OBSpHuy','lelder@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-02 23:05:55',NULL,'2023-03-02 23:05:55',NULL,NULL,NULL,0,NULL,1),(30,'mally','$2y$10$ncCv7k2fTATW4hOQtU9meegmCkBEtMY.GV2T7ouNl2vK.G6ePTRwm','mally@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-02 23:07:32',NULL,'2023-03-02 23:07:32',NULL,NULL,NULL,0,NULL,1),(31,'mdawson','$2y$10$4RiJvMNZb/QLZW6ucafPFut/TNVV1BIcZzCizi4ipekhIQTGfYnN6','mdawson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-02 23:10:01',NULL,'2023-03-02 23:10:01',NULL,NULL,NULL,0,NULL,1),(32,'mforan','$2y$10$WnhgbSW/dxsbkv7dtf/52OrHgAQEq/QiOFFKmKxaGhrDDreMlUP/q','mforan@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-02 23:13:18',NULL,'2023-03-02 23:13:18',NULL,NULL,NULL,0,NULL,1),(33,'mpower','$2y$10$fYF9aD3JwwVIQtMzTUuwVuN.gnVojukb/LbU1ZeJi/4i0KDR8fTua','mpower@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-02 23:14:13',NULL,'2023-03-02 23:14:13',NULL,NULL,NULL,0,NULL,1),(34,'msmith','$2y$10$NsA4ch7RX69BaBpQpc2zeu5nKw0YM3W4EvEwuwFF5S/z/uV2896IG','msmith@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2023-03-02 23:16:07',NULL,'2023-03-02 23:16:07',NULL,NULL,NULL,0,NULL,1);
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
INSERT INTO `versions` VALUES (1,0,0,0,'2023-03-02 22:40:33',1,'plugins.metadata','dc11','',0,0),(1,0,0,0,'2023-03-02 22:40:33',1,'plugins.pubIds','urn','\\APP\\plugins\\pubIds\\urn\\URNPubIdPlugin',0,0),(1,0,0,0,'2023-03-02 22:40:33',1,'plugins.blocks','browse','\\APP\\plugins\\blocks\\browse\\BrowseBlockPlugin',1,0),(1,0,0,0,'2023-03-02 22:40:33',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,0,0,0,'2023-03-02 22:40:33',1,'plugins.blocks','makeSubmission','MakeSubmissionBlockPlugin',1,0),(1,0,0,0,'2023-03-02 22:40:33',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(1,0,0,0,'2023-03-02 22:40:33',1,'plugins.blocks','information','InformationBlockPlugin',1,0),(1,0,0,0,'2023-03-02 22:40:33',1,'plugins.generic','usageEvent','',0,1),(1,0,0,0,'2023-03-02 22:40:33',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(1,3,0,0,'2023-03-02 22:40:33',1,'plugins.generic','acron','AcronPlugin',1,1),(1,0,0,0,'2023-03-02 22:40:33',1,'plugins.generic','dublinCoreMeta','DublinCoreMetaPlugin',1,0),(1,0,0,0,'2023-03-02 22:40:33',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(1,0,0,0,'2023-03-02 22:40:33',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(1,2,0,0,'2023-03-02 22:40:33',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(1,0,0,0,'2023-03-02 22:40:33',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(1,0,0,0,'2023-03-02 22:40:33',1,'plugins.generic','htmlMonographFile','HtmlMonographFilePlugin',1,0),(1,0,0,0,'2023-03-02 22:40:33',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,2,0,0,'2023-03-02 22:40:33',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),(0,1,0,0,'2023-03-02 22:40:33',1,'plugins.generic','citationStyleLanguage','CitationStyleLanguagePlugin',1,0),(1,0,0,0,'2023-03-02 22:40:33',1,'plugins.themes','default','DefaultThemePlugin',1,0),(1,0,0,0,'2023-03-02 22:40:33',1,'plugins.importexport','users','',0,0),(1,0,0,0,'2023-03-02 22:40:33',1,'plugins.importexport','onix30','',0,0),(1,0,0,0,'2023-03-02 22:40:33',1,'plugins.importexport','csv','',0,0),(1,0,0,0,'2023-03-02 22:40:33',1,'plugins.importexport','native','',0,0),(1,0,0,0,'2023-03-02 22:40:33',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,0,0,0,'2023-03-02 22:40:33',1,'plugins.paymethod','manual','',0,0),(1,0,0,0,'2023-03-02 22:40:33',1,'plugins.paymethod','paypal','',0,0),(2,0,0,0,'2023-03-02 22:40:33',1,'plugins.reports','reviewReport','',0,0),(1,0,0,0,'2023-03-02 22:40:33',1,'plugins.reports','monographReport','',0,0),(3,4,0,0,'2023-03-02 22:40:20',1,'core','omp','',0,1);
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

-- Dump completed on 2023-03-02 23:17:55
