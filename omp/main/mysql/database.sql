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
INSERT INTO `author_settings` VALUES (1,'','country','CA'),(1,'en_US','affiliation','University of Calgary'),(1,'en_US','familyName','Clark'),(1,'en_US','givenName','Arthur'),(2,'','country','CA'),(2,'en_US','affiliation','Athabasca University'),(2,'en_US','familyName','Finkel'),(2,'en_US','givenName','Alvin'),(3,'','country','CA'),(3,'','orcid',''),(3,'','url',''),(3,'en_US','affiliation',''),(3,'en_US','biography',''),(3,'en_US','familyName','Carter'),(3,'en_US','givenName','Sarah'),(3,'en_US','preferredPublicName',''),(3,'fr_CA','affiliation',''),(3,'fr_CA','biography',''),(3,'fr_CA','familyName',''),(3,'fr_CA','givenName',''),(3,'fr_CA','preferredPublicName',''),(4,'','country','CA'),(4,'','orcid',''),(4,'','url',''),(4,'en_US','affiliation',''),(4,'en_US','biography',''),(4,'en_US','familyName','Fortna'),(4,'en_US','givenName','Peter'),(4,'en_US','preferredPublicName',''),(4,'fr_CA','affiliation',''),(4,'fr_CA','biography',''),(4,'fr_CA','familyName',''),(4,'fr_CA','givenName',''),(4,'fr_CA','preferredPublicName',''),(5,'','country','CA'),(5,'','orcid',''),(5,'','url',''),(5,'en_US','affiliation',''),(5,'en_US','biography',''),(5,'en_US','familyName','Friesen'),(5,'en_US','givenName','Gerald'),(5,'en_US','preferredPublicName',''),(5,'fr_CA','affiliation',''),(5,'fr_CA','biography',''),(5,'fr_CA','familyName',''),(5,'fr_CA','givenName',''),(5,'fr_CA','preferredPublicName',''),(6,'','country','CA'),(6,'','orcid',''),(6,'','url',''),(6,'en_US','affiliation',''),(6,'en_US','biography',''),(6,'en_US','familyName','Dick'),(6,'en_US','givenName','Lyle'),(6,'en_US','preferredPublicName',''),(6,'fr_CA','affiliation',''),(6,'fr_CA','biography',''),(6,'fr_CA','familyName',''),(6,'fr_CA','givenName',''),(6,'fr_CA','preferredPublicName',''),(7,'','country','CA'),(7,'','orcid',''),(7,'','url',''),(7,'en_US','affiliation',''),(7,'en_US','biography',''),(7,'en_US','familyName','Wheeler'),(7,'en_US','givenName','Winona'),(7,'en_US','preferredPublicName',''),(7,'fr_CA','affiliation',''),(7,'fr_CA','biography',''),(7,'fr_CA','familyName',''),(7,'fr_CA','givenName',''),(7,'fr_CA','preferredPublicName',''),(8,'','country','CA'),(8,'','orcid',''),(8,'','url',''),(8,'en_US','affiliation',''),(8,'en_US','biography',''),(8,'en_US','familyName','Dyce'),(8,'en_US','givenName','Matt'),(8,'en_US','preferredPublicName',''),(8,'fr_CA','affiliation',''),(8,'fr_CA','biography',''),(8,'fr_CA','familyName',''),(8,'fr_CA','givenName',''),(8,'fr_CA','preferredPublicName',''),(9,'','country','CA'),(9,'','orcid',''),(9,'','url',''),(9,'en_US','affiliation',''),(9,'en_US','biography',''),(9,'en_US','familyName','Opp'),(9,'en_US','givenName','James'),(9,'en_US','preferredPublicName',''),(9,'fr_CA','affiliation',''),(9,'fr_CA','biography',''),(9,'fr_CA','familyName',''),(9,'fr_CA','givenName',''),(9,'fr_CA','preferredPublicName',''),(10,'','country','CA'),(10,'en_US','affiliation','Athabasca University'),(10,'en_US','familyName','Barnetson'),(10,'en_US','givenName','Bob'),(11,'','country','CA'),(11,'en_US','affiliation','University of British Columbia'),(11,'en_US','familyName','Beaty'),(11,'en_US','givenName','Bart'),(12,'','country','CA'),(12,'','orcid',''),(12,'','url',''),(12,'en_US','affiliation','University of Alberta'),(12,'en_US','biography',''),(12,'en_US','familyName','Miller'),(12,'en_US','givenName','Toby'),(12,'en_US','preferredPublicName',''),(12,'fr_CA','affiliation',''),(12,'fr_CA','biography',''),(12,'fr_CA','familyName',''),(12,'fr_CA','givenName',''),(12,'fr_CA','preferredPublicName',''),(13,'','country','CA'),(13,'','orcid',''),(13,'','url',''),(13,'en_US','affiliation','Athabasca University'),(13,'en_US','biography',''),(13,'en_US','familyName','Wagman'),(13,'en_US','givenName','Ira'),(13,'en_US','preferredPublicName',''),(13,'fr_CA','affiliation',''),(13,'fr_CA','biography',''),(13,'fr_CA','familyName',''),(13,'fr_CA','givenName',''),(13,'fr_CA','preferredPublicName',''),(14,'','country','CA'),(14,'','orcid',''),(14,'','url',''),(14,'en_US','affiliation','University of Calgary'),(14,'en_US','biography',''),(14,'en_US','familyName','Straw'),(14,'en_US','givenName','Will'),(14,'en_US','preferredPublicName',''),(14,'fr_CA','affiliation',''),(14,'fr_CA','biography',''),(14,'fr_CA','familyName',''),(14,'fr_CA','givenName',''),(14,'fr_CA','preferredPublicName',''),(15,'','country','CA'),(15,'en_US','affiliation','University of Southern California'),(15,'en_US','familyName','Allan'),(15,'en_US','givenName','Chantal'),(16,'','country','US'),(16,'en_US','affiliation','SUNY'),(16,'en_US','familyName','Bernnard'),(16,'en_US','givenName','Deborah'),(17,'','country','US'),(17,'','orcid',''),(17,'','url',''),(17,'en_US','affiliation','SUNY'),(17,'en_US','biography',''),(17,'en_US','familyName','Bobish'),(17,'en_US','givenName','Greg'),(17,'en_US','preferredPublicName',''),(17,'fr_CA','affiliation',''),(17,'fr_CA','biography',''),(17,'fr_CA','familyName',''),(17,'fr_CA','givenName',''),(17,'fr_CA','preferredPublicName',''),(18,'','country','US'),(18,'','orcid',''),(18,'','url',''),(18,'en_US','affiliation','SUNY'),(18,'en_US','biography',''),(18,'en_US','familyName','Bullis'),(18,'en_US','givenName','Daryl'),(18,'en_US','preferredPublicName',''),(18,'fr_CA','affiliation',''),(18,'fr_CA','biography',''),(18,'fr_CA','familyName',''),(18,'fr_CA','givenName',''),(18,'fr_CA','preferredPublicName',''),(19,'','country','US'),(19,'','orcid',''),(19,'','url',''),(19,'en_US','affiliation','SUNY'),(19,'en_US','biography',''),(19,'en_US','familyName','Hecker'),(19,'en_US','givenName','Jenna'),(19,'en_US','preferredPublicName',''),(19,'fr_CA','affiliation',''),(19,'fr_CA','biography',''),(19,'fr_CA','familyName',''),(19,'fr_CA','givenName',''),(19,'fr_CA','preferredPublicName',''),(20,'','country','CA'),(20,'en_US','affiliation','Athabasca University'),(20,'en_US','familyName','Kennepohl'),(20,'en_US','givenName','Dietmar'),(21,'','country','CA'),(21,'','orcid',''),(21,'','url',''),(21,'en_US','affiliation','University of Calgary'),(21,'en_US','biography',''),(21,'en_US','familyName','Anderson'),(21,'en_US','givenName','Terry'),(21,'en_US','preferredPublicName',''),(21,'fr_CA','affiliation',''),(21,'fr_CA','biography',''),(21,'fr_CA','familyName',''),(21,'fr_CA','givenName',''),(21,'fr_CA','preferredPublicName',''),(22,'','country','CA'),(22,'','orcid',''),(22,'','url',''),(22,'en_US','affiliation','University of Alberta'),(22,'en_US','biography',''),(22,'en_US','familyName','Gorsky'),(22,'en_US','givenName','Paul'),(22,'en_US','preferredPublicName',''),(22,'fr_CA','affiliation',''),(22,'fr_CA','biography',''),(22,'fr_CA','familyName',''),(22,'fr_CA','givenName',''),(22,'fr_CA','preferredPublicName',''),(23,'','country','CA'),(23,'','orcid',''),(23,'','url',''),(23,'en_US','affiliation','Athabasca University'),(23,'en_US','biography',''),(23,'en_US','familyName','Parchoma'),(23,'en_US','givenName','Gale'),(23,'en_US','preferredPublicName',''),(23,'fr_CA','affiliation',''),(23,'fr_CA','biography',''),(23,'fr_CA','familyName',''),(23,'fr_CA','givenName',''),(23,'fr_CA','preferredPublicName',''),(24,'','country','CA'),(24,'','orcid',''),(24,'','url',''),(24,'en_US','affiliation','University of Alberta'),(24,'en_US','biography',''),(24,'en_US','familyName','Palmer'),(24,'en_US','givenName','Stuart'),(24,'en_US','preferredPublicName',''),(24,'fr_CA','affiliation',''),(24,'fr_CA','biography',''),(24,'fr_CA','familyName',''),(24,'fr_CA','givenName',''),(24,'fr_CA','preferredPublicName',''),(25,'','country','AU'),(25,'','orcid',''),(25,'','url',''),(25,'en_US','affiliation','University of Melbourne'),(25,'en_US','biography',''),(25,'en_US','familyName','Barnes'),(25,'en_US','givenName','Daniel'),(25,'fr_CA','affiliation',''),(25,'fr_CA','biography',''),(25,'fr_CA','familyName',''),(25,'fr_CA','givenName',''),(26,'','country','CA'),(26,'en_US','affiliation','University of Sussex'),(26,'en_US','familyName','Perini'),(26,'en_US','givenName','Fernando'),(27,'','country','GB'),(27,'','orcid',''),(27,'','url',''),(27,'en_US','affiliation',''),(27,'en_US','biography',''),(27,'en_US','familyName','Mansell'),(27,'en_US','givenName','Robin'),(27,'en_US','preferredPublicName',''),(27,'fr_CA','affiliation',''),(27,'fr_CA','biography',''),(27,'fr_CA','familyName',''),(27,'fr_CA','givenName',''),(27,'fr_CA','preferredPublicName',''),(28,'','country','AR'),(28,'','orcid',''),(28,'','url',''),(28,'en_US','affiliation',''),(28,'en_US','biography',''),(28,'en_US','familyName','Galperin'),(28,'en_US','givenName','Hernan'),(28,'en_US','preferredPublicName',''),(28,'fr_CA','affiliation',''),(28,'fr_CA','biography',''),(28,'fr_CA','familyName',''),(28,'fr_CA','givenName',''),(28,'fr_CA','preferredPublicName',''),(29,'','country','CL'),(29,'','orcid',''),(29,'','url',''),(29,'en_US','affiliation',''),(29,'en_US','biography',''),(29,'en_US','familyName','Bello'),(29,'en_US','givenName','Pablo'),(29,'en_US','preferredPublicName',''),(29,'fr_CA','affiliation',''),(29,'fr_CA','biography',''),(29,'fr_CA','familyName',''),(29,'fr_CA','givenName',''),(29,'fr_CA','preferredPublicName',''),(30,'','country','AR'),(30,'','orcid',''),(30,'','url',''),(30,'en_US','affiliation',''),(30,'en_US','biography',''),(30,'en_US','familyName','Rabinovich'),(30,'en_US','givenName','Eleonora'),(30,'en_US','preferredPublicName',''),(30,'fr_CA','affiliation',''),(30,'fr_CA','biography',''),(30,'fr_CA','familyName',''),(30,'fr_CA','givenName',''),(30,'fr_CA','preferredPublicName',''),(31,'','country','CA'),(31,'en_US','affiliation','Buffalo National Park Foundation'),(31,'en_US','familyName','Brower'),(31,'en_US','givenName','Jennifer'),(32,'','country','CA'),(32,'en_US','affiliation','University of Alberta'),(32,'en_US','familyName','Locke Hart'),(32,'en_US','givenName','Jonathan'),(33,'','country','CA'),(33,'en_US','affiliation','International Development Research Centre'),(33,'en_US','familyName','Elder'),(33,'en_US','givenName','Laurent'),(34,'','country','CA'),(34,'','orcid',''),(34,'','url',''),(34,'en_US','affiliation',''),(34,'en_US','biography',''),(34,'en_US','familyName','Emdon'),(34,'en_US','givenName','Heloise'),(34,'en_US','preferredPublicName',''),(34,'fr_CA','affiliation',''),(34,'fr_CA','biography',''),(34,'fr_CA','familyName',''),(34,'fr_CA','givenName',''),(34,'fr_CA','preferredPublicName',''),(35,'','country','CA'),(35,'','orcid',''),(35,'','url',''),(35,'en_US','affiliation',''),(35,'en_US','biography',''),(35,'en_US','familyName','Tulus'),(35,'en_US','givenName','Frank'),(35,'en_US','preferredPublicName',''),(35,'fr_CA','affiliation',''),(35,'fr_CA','biography',''),(35,'fr_CA','familyName',''),(35,'fr_CA','givenName',''),(35,'fr_CA','preferredPublicName',''),(36,'','country','AR'),(36,'','orcid',''),(36,'','url',''),(36,'en_US','affiliation',''),(36,'en_US','biography',''),(36,'en_US','familyName','Hyma'),(36,'en_US','givenName','Raymond'),(36,'en_US','preferredPublicName',''),(36,'fr_CA','affiliation',''),(36,'fr_CA','biography',''),(36,'fr_CA','familyName',''),(36,'fr_CA','givenName',''),(36,'fr_CA','preferredPublicName',''),(37,'','country','CA'),(37,'','orcid',''),(37,'','url',''),(37,'en_US','affiliation',''),(37,'en_US','biography',''),(37,'en_US','familyName','Valk'),(37,'en_US','givenName','John'),(37,'en_US','preferredPublicName',''),(37,'fr_CA','affiliation',''),(37,'fr_CA','biography',''),(37,'fr_CA','familyName',''),(37,'fr_CA','givenName',''),(37,'fr_CA','preferredPublicName',''),(38,'','country','CA'),(38,'','orcid',''),(38,'','url',''),(38,'en_US','affiliation',''),(38,'en_US','biography',''),(38,'en_US','familyName','Fourati'),(38,'en_US','givenName','Khaled'),(38,'en_US','preferredPublicName',''),(38,'fr_CA','affiliation',''),(38,'fr_CA','biography',''),(38,'fr_CA','familyName',''),(38,'fr_CA','givenName',''),(38,'fr_CA','preferredPublicName',''),(39,'','country','CA'),(39,'','orcid',''),(39,'','url',''),(39,'en_US','affiliation',''),(39,'en_US','biography',''),(39,'en_US','familyName','de Beer'),(39,'en_US','givenName','Jeremy'),(39,'en_US','preferredPublicName',''),(39,'fr_CA','affiliation',''),(39,'fr_CA','biography',''),(39,'fr_CA','familyName',''),(39,'fr_CA','givenName',''),(39,'fr_CA','preferredPublicName',''),(40,'','country','CA'),(40,'','orcid',''),(40,'','url',''),(40,'en_US','affiliation',''),(40,'en_US','biography',''),(40,'en_US','familyName','Bannerman'),(40,'en_US','givenName','Sara'),(40,'en_US','preferredPublicName',''),(40,'fr_CA','affiliation',''),(40,'fr_CA','biography',''),(40,'fr_CA','familyName',''),(40,'fr_CA','givenName',''),(40,'fr_CA','preferredPublicName',''),(41,'','country','CA'),(41,'en_US','affiliation','Athabasca University'),(41,'en_US','familyName','Ally'),(41,'en_US','givenName','Mohamed'),(42,'','country','GB'),(42,'','orcid',''),(42,'','url',''),(42,'en_US','affiliation',''),(42,'en_US','biography',''),(42,'en_US','familyName','Traxler'),(42,'en_US','givenName','John'),(42,'en_US','preferredPublicName',''),(42,'fr_CA','affiliation',''),(42,'fr_CA','biography',''),(42,'fr_CA','familyName',''),(42,'fr_CA','givenName',''),(42,'fr_CA','preferredPublicName',''),(43,'','country','CA'),(43,'','orcid',''),(43,'','url',''),(43,'en_US','affiliation',''),(43,'en_US','biography',''),(43,'en_US','familyName','Koole'),(43,'en_US','givenName','Marguerite'),(43,'en_US','preferredPublicName',''),(43,'fr_CA','affiliation',''),(43,'fr_CA','biography',''),(43,'fr_CA','familyName',''),(43,'fr_CA','givenName',''),(43,'fr_CA','preferredPublicName',''),(44,'','country','NO'),(44,'','orcid',''),(44,'','url',''),(44,'en_US','affiliation',''),(44,'en_US','biography',''),(44,'en_US','familyName','Rekkedal'),(44,'en_US','givenName','Torstein'),(44,'en_US','preferredPublicName',''),(44,'fr_CA','affiliation',''),(44,'fr_CA','biography',''),(44,'fr_CA','familyName',''),(44,'fr_CA','givenName',''),(44,'fr_CA','preferredPublicName',''),(45,'','country','CA'),(45,'en_US','affiliation','University of Alberta'),(45,'en_US','familyName','Dawson'),(45,'en_US','givenName','Michael'),(46,'','country','CA'),(46,'','orcid',''),(46,'','url',''),(46,'en_US','affiliation','Athabasca University'),(46,'en_US','biography',''),(46,'en_US','familyName','Dupuis'),(46,'en_US','givenName','Brian'),(46,'en_US','preferredPublicName',''),(46,'fr_CA','affiliation',''),(46,'fr_CA','biography',''),(46,'fr_CA','familyName',''),(46,'fr_CA','givenName',''),(46,'fr_CA','preferredPublicName',''),(47,'','country','CA'),(47,'','orcid',''),(47,'','url',''),(47,'en_US','affiliation','University of Calgary'),(47,'en_US','biography',''),(47,'en_US','familyName','Wilson'),(47,'en_US','givenName','Michael'),(47,'en_US','preferredPublicName',''),(47,'fr_CA','affiliation',''),(47,'fr_CA','biography',''),(47,'fr_CA','familyName',''),(47,'fr_CA','givenName',''),(47,'fr_CA','preferredPublicName',''),(48,'','country','CA'),(48,'en_US','affiliation','University of Calgary'),(48,'en_US','familyName','Foran'),(48,'en_US','givenName','Max'),(49,'','country','CA'),(49,'en_US','affiliation','London School of Economics'),(49,'en_US','familyName','Power'),(49,'en_US','givenName','Michael'),(50,'','country','CA'),(50,'en_US','affiliation','International Development Research Centre'),(50,'en_US','familyName','Smith'),(50,'en_US','givenName','Matthew'),(51,'','country','US'),(51,'','orcid',''),(51,'','url',''),(51,'en_US','affiliation',''),(51,'en_US','biography',''),(51,'en_US','familyName','Benkler'),(51,'en_US','givenName','Yochai'),(51,'en_US','preferredPublicName',''),(51,'fr_CA','affiliation',''),(51,'fr_CA','biography',''),(51,'fr_CA','familyName',''),(51,'fr_CA','givenName',''),(51,'fr_CA','preferredPublicName',''),(52,'','country','CA'),(52,'','orcid',''),(52,'','url',''),(52,'en_US','affiliation',''),(52,'en_US','biography',''),(52,'en_US','familyName','Reilly'),(52,'en_US','givenName','Katherine'),(52,'en_US','preferredPublicName',''),(52,'fr_CA','affiliation',''),(52,'fr_CA','biography',''),(52,'fr_CA','familyName',''),(52,'fr_CA','givenName',''),(52,'fr_CA','preferredPublicName',''),(53,'','country','US'),(53,'','orcid',''),(53,'','url',''),(53,'en_US','affiliation',''),(53,'en_US','biography',''),(53,'en_US','familyName','Loudon'),(53,'en_US','givenName','Melissa'),(53,'en_US','preferredPublicName',''),(53,'fr_CA','affiliation',''),(53,'fr_CA','biography',''),(53,'fr_CA','familyName',''),(53,'fr_CA','givenName',''),(53,'fr_CA','preferredPublicName',''),(54,'','country','ZA'),(54,'','orcid',''),(54,'','url',''),(54,'en_US','affiliation',''),(54,'en_US','biography',''),(54,'en_US','familyName','Rivett'),(54,'en_US','givenName','Ulrike'),(54,'en_US','preferredPublicName',''),(54,'fr_CA','affiliation',''),(54,'fr_CA','biography',''),(54,'fr_CA','familyName',''),(54,'fr_CA','givenName',''),(54,'fr_CA','preferredPublicName',''),(55,'','country','GB'),(55,'','orcid',''),(55,'','url',''),(55,'en_US','affiliation',''),(55,'en_US','biography',''),(55,'en_US','familyName','Graham'),(55,'en_US','givenName','Mark'),(55,'en_US','preferredPublicName',''),(55,'fr_CA','affiliation',''),(55,'fr_CA','biography',''),(55,'fr_CA','familyName',''),(55,'fr_CA','givenName',''),(55,'fr_CA','preferredPublicName',''),(56,'','country','NO'),(56,'','orcid',''),(56,'','url',''),(56,'en_US','affiliation',''),(56,'en_US','biography',''),(56,'en_US','familyName','Haarstad'),(56,'en_US','givenName','Håvard'),(56,'en_US','preferredPublicName',''),(56,'fr_CA','affiliation',''),(56,'fr_CA','biography',''),(56,'fr_CA','familyName',''),(56,'fr_CA','givenName',''),(56,'fr_CA','preferredPublicName',''),(57,'','country','US'),(57,'','orcid',''),(57,'','url',''),(57,'en_US','affiliation',''),(57,'en_US','biography',''),(57,'en_US','familyName','Smith'),(57,'en_US','givenName','Marshall'),(57,'en_US','preferredPublicName',''),(57,'fr_CA','affiliation',''),(57,'fr_CA','biography',''),(57,'fr_CA','familyName',''),(57,'fr_CA','givenName',''),(57,'fr_CA','preferredPublicName','');
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
INSERT INTO `authors` VALUES (1,'aclark@mailinator.com',1,1,0.00,13),(2,'afinkel@mailinator.com',1,2,0.00,14),(3,'scarter@mailinator.com',1,2,1.00,14),(4,'pfortna@mailinator.com',1,2,2.00,14),(5,'gfriesen@mailinator.com',1,2,3.00,13),(6,'ldick@mailinator.com',1,2,4.00,13),(7,'wwheeler@mailinator.com',1,2,5.00,13),(8,'mdyce@mailinator.com',1,2,6.00,13),(9,'jopp@mailinator.com',1,2,7.00,13),(10,'bbarnetson@mailinator.com',1,3,0.00,13),(11,'bbeaty@mailinator.com',1,4,0.00,14),(12,'tmiller@mailinator.com',1,4,1.00,13),(13,'awagman@mailinator.com',1,4,2.00,13),(14,'wstraw@mailinator.com',1,4,3.00,13),(15,'callan@mailinator.com',1,5,0.00,13),(16,'dbernnard@mailinator.com',1,6,0.00,14),(17,'gbobish@mailinator.com',1,6,1.00,13),(18,'dbullis@mailinator.com',1,6,2.00,13),(19,'jhecker@mailinator.com',1,6,3.00,13),(20,'dkennepohl@mailinator.com',1,7,0.00,14),(21,'tanderson@mailinator.com',1,7,1.00,13),(22,'pgorsky@mailinator.com',1,7,2.00,13),(23,'gparchoma@mailinator.com',1,7,3.00,13),(24,'spalmer@mailinator.com',1,7,4.00,13),(25,'dbarnes@mailinator.com',1,8,0.00,13),(26,'fperini@mailinator.com',1,9,0.00,14),(27,'rmansell@mailinator.com',1,9,1.00,13),(28,'hgalperin@mailinator.com',1,9,2.00,13),(29,'pbello@mailinator.com',1,9,3.00,13),(30,'erabinovich@mailinator.com',1,9,4.00,13),(31,'jbrower@mailinator.com',1,10,0.00,13),(32,'jlockehart@mailinator.com',1,11,0.00,13),(33,'lelder@mailinator.com',1,12,0.00,14),(34,'lelder@mailinator.com',1,12,1.00,14),(35,'ftulus@mailinator.com',1,12,2.00,13),(36,'rhyma@mailinator.com',1,12,3.00,13),(37,'jvalk@mailinator.com',1,12,4.00,13),(38,'fkourati@mailinator.com',1,12,5.00,13),(39,'jdebeer@mailinator.com',1,12,6.00,13),(40,'sbannerman@mailinator.com',1,12,7.00,13),(41,'mally@mailinator.com',1,13,0.00,14),(42,'jtraxler@mailinator.com',1,13,1.00,13),(43,'mkoole@mailinator.com',1,13,2.00,13),(44,'trekkedal@mailinator.com',1,13,3.00,13),(45,'mdawson@mailinator.com',1,14,0.00,14),(46,'bdupuis@mailinator.com',1,14,1.00,13),(47,'mwilson@mailinator.com',1,14,2.00,13),(48,'mforan@mailinator.com',1,15,0.00,13),(49,'mpower@mailinator.com',1,16,0.00,13),(50,'msmith@mailinator.com',1,17,0.00,14),(51,'ybenkler@mailinator.com',1,17,1.00,13),(52,'kreilly@mailinator.com',1,17,2.00,13),(53,'mloudon@mailinator.com',1,17,3.00,13),(54,'urivett@mailinator.com',1,17,4.00,13),(55,'mgraham@mailinator.com',1,17,5.00,13),(56,'hhaarstad@mailinator.com',1,17,6.00,13),(57,'masmith@mailinator.com',1,17,7.00,13);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entries`
--

LOCK TABLES `controlled_vocab_entries` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entries` VALUES (1,12,1.00),(2,12,2.00),(3,17,1.00),(4,17,2.00),(8,22,1.00),(9,22,2.00),(10,22,3.00),(11,27,1.00),(12,27,2.00),(13,32,1.00),(14,42,1.00),(15,42,2.00),(16,42,3.00),(17,47,1.00),(18,47,2.00),(19,47,3.00),(20,57,1.00),(21,57,2.00),(22,62,1.00),(24,67,1.00),(25,82,1.00),(26,82,2.00);
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
INSERT INTO `controlled_vocab_entry_settings` VALUES (1,'en_US','submissionKeyword','Business & Economics','string'),(2,'en_US','submissionKeyword','Political & International Studies','string'),(3,'en_US','submissionKeyword','Canadian Studies','string'),(4,'en_US','submissionKeyword','Communication & Cultural Studies','string'),(8,'en_US','submissionKeyword','Canadian Studies','string'),(9,'en_US','submissionKeyword','Communication & Cultural Studies','string'),(10,'en_US','submissionKeyword','Political & International Studies','string'),(11,'en_US','submissionKeyword','information literacy','string'),(12,'en_US','submissionKeyword','academic libraries','string'),(13,'en_US','submissionKeyword','Education','string'),(14,'en_US','submissionKeyword','Information','string'),(15,'en_US','submissionKeyword','society','string'),(16,'en_US','submissionKeyword','ICT','string'),(17,'en_US','submissionKeyword','Biography & Memoir','string'),(18,'en_US','submissionKeyword','Environmental Studies','string'),(19,'en_US','submissionKeyword','Political & International Studies','string'),(20,'en_US','submissionKeyword','International Development','string'),(21,'en_US','submissionKeyword','ICT','string'),(22,'en_US','submissionKeyword','Educational Technology','string'),(24,'en_US','submissionKeyword','Psychology','string'),(25,'en_US','submissionKeyword','International Development','string'),(26,'en_US','submissionKeyword','ICT','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
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
INSERT INTO `edit_decisions` VALUES (1,1,NULL,1,NULL,3,18,'2022-10-26 07:28:06'),(2,1,1,3,1,3,2,'2022-10-26 07:28:21'),(3,2,NULL,1,NULL,3,18,'2022-10-26 07:30:11'),(4,4,NULL,1,NULL,3,1,'2022-10-26 07:32:32'),(5,4,3,2,1,3,3,'2022-10-26 07:32:50'),(6,4,4,3,1,3,2,'2022-10-26 07:33:07'),(7,4,NULL,4,NULL,3,7,'2022-10-26 07:33:25'),(8,5,NULL,1,NULL,3,1,'2022-10-26 07:34:41'),(9,5,5,2,1,3,3,'2022-10-26 07:34:56'),(10,5,6,3,1,3,2,'2022-10-26 07:35:13'),(11,5,NULL,4,NULL,3,7,'2022-10-26 07:35:29'),(12,6,NULL,1,NULL,3,1,'2022-10-26 07:37:25'),(13,6,7,2,1,6,23,'2022-10-26 07:37:50'),(14,7,NULL,1,NULL,3,18,'2022-10-26 07:39:46'),(15,7,8,3,1,3,2,'2022-10-26 07:40:05'),(16,9,NULL,1,NULL,3,1,'2022-10-26 07:42:13'),(17,11,NULL,1,NULL,3,1,'2022-10-26 07:43:53'),(18,11,10,2,1,3,3,'2022-10-26 07:44:07'),(19,11,11,3,1,3,2,'2022-10-26 07:45:06'),(20,12,NULL,1,NULL,3,1,'2022-10-26 07:46:41'),(21,13,NULL,1,NULL,3,1,'2022-10-26 07:48:33'),(22,13,13,2,1,3,3,'2022-10-26 07:48:49'),(23,13,14,3,1,3,2,'2022-10-26 07:50:03'),(24,14,NULL,1,NULL,3,1,'2022-10-26 07:51:35'),(25,14,15,2,1,3,3,'2022-10-26 07:51:54'),(26,14,16,3,1,3,2,'2022-10-26 07:52:13'),(27,14,NULL,4,NULL,3,7,'2022-10-26 07:52:32'),(28,15,NULL,1,NULL,3,18,'2022-10-26 07:54:37'),(29,16,NULL,1,NULL,3,18,'2022-10-26 07:55:33'),(30,17,NULL,1,NULL,3,1,'2022-10-26 07:58:27');
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
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
INSERT INTO `email_log` VALUES (1,1048585,1,0,'2022-10-26 07:27:55',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Arthur Clark,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/1</p><p>If you have been logged out, you can login again with the username aclark</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(2,1048585,1,3,'2022-10-26 07:28:06',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>','','','Your submission has been sent for review','<p>Dear Arthur Clark,</p><p>I am pleased to inform you that an editor has reviewed your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(3,1048585,1,3,'2022-10-26 07:28:21',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Arthur Clark,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(4,1048585,2,0,'2022-10-26 07:29:56',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Alvin Finkel\" <afinkel@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Alvin Finkel,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The West and Beyond: New Perspectives on an Imagined Region, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/2</p><p>If you have been logged out, you can login again with the username afinkel</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/2\">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(5,1048585,2,0,'2022-10-26 07:29:56',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Sarah Carter\" <scarter@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nAlvin Finkel has submitted the manuscript, &quot;The West and Beyond: New Perspectives on an Imagined Region&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(6,1048585,2,0,'2022-10-26 07:29:56',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Peter Fortna\" <pfortna@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nAlvin Finkel has submitted the manuscript, &quot;The West and Beyond: New Perspectives on an Imagined Region&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(7,1048585,2,0,'2022-10-26 07:29:56',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Gerald Friesen\" <gfriesen@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nAlvin Finkel has submitted the manuscript, &quot;The West and Beyond: New Perspectives on an Imagined Region&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(8,1048585,2,0,'2022-10-26 07:29:56',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Lyle Dick\" <ldick@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nAlvin Finkel has submitted the manuscript, &quot;The West and Beyond: New Perspectives on an Imagined Region&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(9,1048585,2,0,'2022-10-26 07:29:56',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Winona Wheeler\" <wwheeler@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nAlvin Finkel has submitted the manuscript, &quot;The West and Beyond: New Perspectives on an Imagined Region&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(10,1048585,2,0,'2022-10-26 07:29:56',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Matt Dyce\" <mdyce@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nAlvin Finkel has submitted the manuscript, &quot;The West and Beyond: New Perspectives on an Imagined Region&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(11,1048585,2,0,'2022-10-26 07:29:56',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"James Opp\" <jopp@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nAlvin Finkel has submitted the manuscript, &quot;The West and Beyond: New Perspectives on an Imagined Region&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(12,1048585,2,3,'2022-10-26 07:30:12',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Alvin Finkel\" <afinkel@mailinator.com>','','','Your submission has been sent for review','<p>Dear Alvin Finkel,</p><p>I am pleased to inform you that an editor has reviewed your submission, The West and Beyond: New Perspectives on an Imagined Region, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(13,1048585,3,0,'2022-10-26 07:31:12',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Bob Barnetson\" <bbarnetson@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Bob Barnetson,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The Political Economy of Workplace Injury in Canada, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/3</p><p>If you have been logged out, you can login again with the username bbarnetson</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/3\">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(14,1048585,4,0,'2022-10-26 07:32:17',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Bart Beaty,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/4</p><p>If you have been logged out, you can login again with the username bbeaty</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(15,1048585,4,0,'2022-10-26 07:32:17',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Toby Miller\" <tmiller@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nBart Beaty has submitted the manuscript, &quot;How Canadians Communicate: Contexts of Canadian Popular Culture&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(16,1048585,4,0,'2022-10-26 07:32:17',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ira Wagman\" <awagman@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nBart Beaty has submitted the manuscript, &quot;How Canadians Communicate: Contexts of Canadian Popular Culture&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(17,1048585,4,0,'2022-10-26 07:32:17',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Will Straw\" <wstraw@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nBart Beaty has submitted the manuscript, &quot;How Canadians Communicate: Contexts of Canadian Popular Culture&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(18,1048585,4,3,'2022-10-26 07:32:32',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Bart Beaty,</p><p>I am pleased to inform you that an editor has reviewed your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(19,1048585,4,3,'2022-10-26 07:32:50',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Your submission has been sent for review','<p>Dear Bart Beaty,</p><p>I am pleased to inform you that an editor has reviewed your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(20,1048585,4,3,'2022-10-26 07:33:08',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Bart Beaty,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(21,1048585,4,3,'2022-10-26 07:33:26',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Bart Beaty,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(22,1048585,5,0,'2022-10-26 07:34:28',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Chantal Allan,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Bomb Canada and Other Unkind Remarks in the American Media, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/5</p><p>If you have been logged out, you can login again with the username callan</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(23,1048585,5,3,'2022-10-26 07:34:41',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Chantal Allan,</p><p>I am pleased to inform you that an editor has reviewed your submission, Bomb Canada and Other Unkind Remarks in the American Media, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(24,1048585,5,3,'2022-10-26 07:34:57',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Your submission has been sent for review','<p>Dear Chantal Allan,</p><p>I am pleased to inform you that an editor has reviewed your submission, Bomb Canada and Other Unkind Remarks in the American Media, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(25,1048585,5,3,'2022-10-26 07:35:13',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Chantal Allan,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Bomb Canada and Other Unkind Remarks in the American Media, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(26,1048585,5,3,'2022-10-26 07:35:29',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Chantal Allan,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, Bomb Canada and Other Unkind Remarks in the American Media, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(27,1048585,6,0,'2022-10-26 07:37:09',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Deborah Bernnard\" <dbernnard@mailinator.com>','','\"David Buskins\" <dbuskins@mailinator.com>','Thank you for your submission to {$pressName}','<p>Dear Deborah Bernnard,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, The Information Literacy User’s Guide, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/6</p><p>If you have been logged out, you can login again with the username dbernnard</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/6\">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(28,1048585,6,0,'2022-10-26 07:37:10',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Greg Bobish\" <gbobish@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nDeborah Bernnard has submitted the manuscript, &quot;The Information Literacy User’s Guide&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(29,1048585,6,0,'2022-10-26 07:37:10',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daryl Bullis\" <dbullis@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nDeborah Bernnard has submitted the manuscript, &quot;The Information Literacy User’s Guide&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(30,1048585,6,0,'2022-10-26 07:37:10',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Jenna Hecker\" <jhecker@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nDeborah Bernnard has submitted the manuscript, &quot;The Information Literacy User’s Guide&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(31,1048585,6,3,'2022-10-26 07:37:25',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Deborah Bernnard\" <dbernnard@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Deborah Bernnard,</p><p>I am pleased to inform you that an editor has reviewed your submission, The Information Literacy User’s Guide, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(32,1048585,7,0,'2022-10-26 07:39:29',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Dietmar Kennepohl,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Accessible Elements: Teaching Science Online and at a Distance, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/7</p><p>If you have been logged out, you can login again with the username dkennepohl</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/7\">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(33,1048585,7,0,'2022-10-26 07:39:29',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Terry Anderson\" <tanderson@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nDietmar Kennepohl has submitted the manuscript, &quot;Accessible Elements: Teaching Science Online and at a Distance&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(34,1048585,7,0,'2022-10-26 07:39:29',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Paul Gorsky\" <pgorsky@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nDietmar Kennepohl has submitted the manuscript, &quot;Accessible Elements: Teaching Science Online and at a Distance&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(35,1048585,7,0,'2022-10-26 07:39:29',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Gale Parchoma\" <gparchoma@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nDietmar Kennepohl has submitted the manuscript, &quot;Accessible Elements: Teaching Science Online and at a Distance&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(36,1048585,7,0,'2022-10-26 07:39:29',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Stuart Palmer\" <spalmer@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nDietmar Kennepohl has submitted the manuscript, &quot;Accessible Elements: Teaching Science Online and at a Distance&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(37,1048585,7,3,'2022-10-26 07:39:46',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>','','','Your submission has been sent for review','<p>Dear Dietmar Kennepohl,</p><p>I am pleased to inform you that an editor has reviewed your submission, Accessible Elements: Teaching Science Online and at a Distance, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(38,1048585,7,3,'2022-10-26 07:40:05',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Dietmar Kennepohl,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Accessible Elements: Teaching Science Online and at a Distance, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/7\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(39,1048585,8,0,'2022-10-26 07:40:34',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Daniel Barnes,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Editorial, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/8</p><p>If you have been logged out, you can login again with the username dbarnes</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/8\">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(40,1048585,9,0,'2022-10-26 07:41:55',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Fernando Perini\" <fperini@mailinator.com>','','\"David Buskins\" <dbuskins@mailinator.com>','Thank you for your submission to {$pressName}','<p>Dear Fernando Perini,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Enabling Openness: The future of the information society in Latin America and the Caribbean, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/9</p><p>If you have been logged out, you can login again with the username fperini</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/9\">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(41,1048585,9,0,'2022-10-26 07:41:55',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Robin Mansell\" <rmansell@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nFernando Perini has submitted the manuscript, &quot;Enabling Openness: The future of the information society in Latin America and the Caribbean&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(42,1048585,9,0,'2022-10-26 07:41:55',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Hernan Galperin\" <hgalperin@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nFernando Perini has submitted the manuscript, &quot;Enabling Openness: The future of the information society in Latin America and the Caribbean&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(43,1048585,9,0,'2022-10-26 07:41:55',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Pablo Bello\" <pbello@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nFernando Perini has submitted the manuscript, &quot;Enabling Openness: The future of the information society in Latin America and the Caribbean&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(44,1048585,9,0,'2022-10-26 07:41:55',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Eleonora Rabinovich\" <erabinovich@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nFernando Perini has submitted the manuscript, &quot;Enabling Openness: The future of the information society in Latin America and the Caribbean&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(45,1048585,9,3,'2022-10-26 07:42:13',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Fernando Perini\" <fperini@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Fernando Perini,</p><p>I am pleased to inform you that an editor has reviewed your submission, Enabling Openness: The future of the information society in Latin America and the Caribbean, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(46,1048585,10,0,'2022-10-26 07:43:16',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Jennifer Brower\" <jbrower@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Jennifer Brower,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Lost Tracks: Buffalo National Park, 1909-1939, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/10</p><p>If you have been logged out, you can login again with the username jbrower</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/10\">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(47,1048585,11,0,'2022-10-26 07:43:40',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Jonathan Locke Hart,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Dreamwork, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/11</p><p>If you have been logged out, you can login again with the username jlockehart</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/11\">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(48,1048585,11,3,'2022-10-26 07:43:53',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that an editor has reviewed your submission, Dreamwork, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(49,1048585,11,3,'2022-10-26 07:44:08',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Your submission has been sent for review','<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that an editor has reviewed your submission, Dreamwork, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(50,1048585,11,10,'2022-10-26 07:44:32',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Dreamwork,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-11-23, if not before.<br />\n<br />\nAdela Gallego'),(51,1048585,11,12,'2022-10-26 07:44:43',1073741829,'\"Gonzalo Favio\" <gfavio@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Dreamwork,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-11-23, if not before.<br />\n<br />\nGonzalo Favio'),(52,1048585,11,3,'2022-10-26 07:45:06',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Dreamwork, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/11\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(53,1048585,12,0,'2022-10-26 07:46:23',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Laurent Elder\" <lelder@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Laurent Elder,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Connecting ICTs to Development, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/12</p><p>If you have been logged out, you can login again with the username lelder</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/12\">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(54,1048585,12,0,'2022-10-26 07:46:23',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Frank Tulus\" <ftulus@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nLaurent Elder has submitted the manuscript, &quot;Connecting ICTs to Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(55,1048585,12,0,'2022-10-26 07:46:23',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Raymond Hyma\" <rhyma@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nLaurent Elder has submitted the manuscript, &quot;Connecting ICTs to Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(56,1048585,12,0,'2022-10-26 07:46:23',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Valk\" <jvalk@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nLaurent Elder has submitted the manuscript, &quot;Connecting ICTs to Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(57,1048585,12,0,'2022-10-26 07:46:23',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Khaled Fourati\" <fkourati@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nLaurent Elder has submitted the manuscript, &quot;Connecting ICTs to Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(58,1048585,12,0,'2022-10-26 07:46:23',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Jeremy de Beer\" <jdebeer@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nLaurent Elder has submitted the manuscript, &quot;Connecting ICTs to Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(59,1048585,12,0,'2022-10-26 07:46:23',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Sara Bannerman\" <sbannerman@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nLaurent Elder has submitted the manuscript, &quot;Connecting ICTs to Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(60,1048585,12,3,'2022-10-26 07:46:41',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Laurent Elder\" <lelder@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Laurent Elder,</p><p>I am pleased to inform you that an editor has reviewed your submission, Connecting ICTs to Development, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(61,1048585,12,8,'2022-10-26 07:47:18',1073741829,'\"Paul Hudson\" <phudson@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Connecting ICTs to Development,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-11-23, if not before.<br />\n<br />\nPaul Hudson'),(62,1048585,13,0,'2022-10-26 07:48:17',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Mohamed Ally,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Mobile Learning: Transforming the Delivery of Education and Training, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/13</p><p>If you have been logged out, you can login again with the username mally</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(63,1048585,13,0,'2022-10-26 07:48:17',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Traxler\" <jtraxler@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nMohamed Ally has submitted the manuscript, &quot;Mobile Learning: Transforming the Delivery of Education and Training&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(64,1048585,13,0,'2022-10-26 07:48:17',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Marguerite Koole\" <mkoole@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nMohamed Ally has submitted the manuscript, &quot;Mobile Learning: Transforming the Delivery of Education and Training&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(65,1048585,13,0,'2022-10-26 07:48:17',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Torstein Rekkedal\" <trekkedal@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nMohamed Ally has submitted the manuscript, &quot;Mobile Learning: Transforming the Delivery of Education and Training&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(66,1048585,13,3,'2022-10-26 07:48:33',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that an editor has reviewed your submission, Mobile Learning: Transforming the Delivery of Education and Training, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(67,1048585,13,3,'2022-10-26 07:48:49',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Your submission has been sent for review','<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that an editor has reviewed your submission, Mobile Learning: Transforming the Delivery of Education and Training, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(68,1048585,13,10,'2022-10-26 07:49:24',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Mobile Learning: Transforming the Delivery of Education and Training,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-11-23, if not before.<br />\n<br />\nAdela Gallego'),(69,1048585,13,12,'2022-10-26 07:49:37',1073741829,'\"Gonzalo Favio\" <gfavio@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Mobile Learning: Transforming the Delivery of Education and Training,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-11-23, if not before.<br />\n<br />\nGonzalo Favio'),(70,1048585,13,3,'2022-10-26 07:50:04',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Mobile Learning: Transforming the Delivery of Education and Training, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(71,1048585,14,0,'2022-10-26 07:51:17',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Michael Dawson,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/14</p><p>If you have been logged out, you can login again with the username mdawson</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(72,1048585,14,0,'2022-10-26 07:51:17',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Brian Dupuis\" <bdupuis@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nMichael Dawson has submitted the manuscript, &quot;From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(73,1048585,14,0,'2022-10-26 07:51:17',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Michael Wilson\" <mwilson@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nMichael Dawson has submitted the manuscript, &quot;From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(74,1048585,14,3,'2022-10-26 07:51:35',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Michael Dawson,</p><p>I am pleased to inform you that an editor has reviewed your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(75,1048585,14,3,'2022-10-26 07:51:54',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Your submission has been sent for review','<p>Dear Michael Dawson,</p><p>I am pleased to inform you that an editor has reviewed your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(76,1048585,14,3,'2022-10-26 07:52:13',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Michael Dawson,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(77,1048585,14,3,'2022-10-26 07:52:32',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Michael Dawson,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(78,1048585,15,0,'2022-10-26 07:54:23',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Max Foran\" <mforan@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Max Foran,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Expansive Discourses: Urban Sprawl in Calgary, 1945-1978, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/15</p><p>If you have been logged out, you can login again with the username mforan</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/15\">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(79,1048585,15,3,'2022-10-26 07:54:37',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Max Foran\" <mforan@mailinator.com>','','','Your submission has been sent for review','<p>Dear Max Foran,</p><p>I am pleased to inform you that an editor has reviewed your submission, Expansive Discourses: Urban Sprawl in Calgary, 1945-1978, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(80,1048585,16,0,'2022-10-26 07:55:16',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Michael Power\" <mpower@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Michael Power,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, A Designer\'s Log: Case Studies in Instructional Design, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/16</p><p>If you have been logged out, you can login again with the username mpower</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/16\">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(81,1048585,16,3,'2022-10-26 07:55:33',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Power\" <mpower@mailinator.com>','','','Your submission has been sent for review','<p>Dear Michael Power,</p><p>I am pleased to inform you that an editor has reviewed your submission, A Designer\'s Log: Case Studies in Instructional Design, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(82,1048585,16,10,'2022-10-26 07:56:06',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;A Designer\'s Log: Case Studies in Instructional Design,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-11-23, if not before.<br />\n<br />\nAdela Gallego'),(83,1048585,17,0,'2022-10-26 07:58:05',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Matthew Smith\" <msmith@mailinator.com>','','','Thank you for your submission to {$pressName}','<p>Dear Matthew Smith,</p><p>Thank you for your submission to Public Knowledge Press. We have received your submission, Open Development: Networked Innovations in International Development, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/authorDashboard/submission/17</p><p>If you have been logged out, you can login again with the username msmith</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/17\">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p><br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(84,1048585,17,0,'2022-10-26 07:58:05',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Yochai Benkler\" <ybenkler@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nMatthew Smith has submitted the manuscript, &quot;Open Development: Networked Innovations in International Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(85,1048585,17,0,'2022-10-26 07:58:05',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Katherine Reilly\" <kreilly@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nMatthew Smith has submitted the manuscript, &quot;Open Development: Networked Innovations in International Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(86,1048585,17,0,'2022-10-26 07:58:05',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Melissa Loudon\" <mloudon@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nMatthew Smith has submitted the manuscript, &quot;Open Development: Networked Innovations in International Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(87,1048585,17,0,'2022-10-26 07:58:05',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Ulrike Rivett\" <urivett@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nMatthew Smith has submitted the manuscript, &quot;Open Development: Networked Innovations in International Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(88,1048585,17,0,'2022-10-26 07:58:05',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Mark Graham\" <mgraham@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nMatthew Smith has submitted the manuscript, &quot;Open Development: Networked Innovations in International Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(89,1048585,17,0,'2022-10-26 07:58:05',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Håvard Haarstad\" <hhaarstad@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nMatthew Smith has submitted the manuscript, &quot;Open Development: Networked Innovations in International Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(90,1048585,17,0,'2022-10-26 07:58:05',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Marshall Smith\" <masmith@mailinator.com>','','','Submission Acknowledgement','Hello,<br />\n<br />\nMatthew Smith has submitted the manuscript, &quot;Open Development: Networked Innovations in International Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n<br><br><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto:%20%7B$contactEmail%7D\">{$contactEmail}</a></p>'),(91,1048585,17,3,'2022-10-26 07:58:28',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Matthew Smith\" <msmith@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Matthew Smith,</p><p>I am pleased to inform you that an editor has reviewed your submission, Open Development: Networked Innovations in International Development, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>');
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
INSERT INTO `email_log_users` VALUES (1,19),(2,19),(3,19),(4,20),(12,20),(13,21),(14,22),(18,22),(19,22),(20,22),(21,22),(22,23),(23,23),(24,23),(25,23),(26,23),(27,24),(31,24),(32,25),(37,25),(38,25),(39,3),(40,26),(45,26),(46,27),(47,28),(48,28),(49,28),(50,3),(51,3),(52,28),(53,29),(60,29),(61,3),(62,30),(66,30),(67,30),(68,3),(69,3),(70,30),(71,31),(74,31),(75,31),(76,31),(77,31),(78,32),(79,32),(80,33),(81,33),(82,3),(83,34),(91,34);
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
  `enabled` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email_templates_email_key` (`email_key`,`context_id`),
  KEY `email_templates_context_id` (`context_id`),
  CONSTRAINT `email_templates_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
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
INSERT INTO `email_templates_default_data` VALUES ('ANNOUNCEMENT','en_US','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href=\"{$announcementUrl}\">full announcement</a>.'),('ANNOUNCEMENT','fr_CA','',''),('COPYEDIT_REQUEST','en_US','Submission {$submissionId} is ready to be copyedited for {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready to be copyedited:</p><p><a href\"{$submissionUrl}\">{$submissionId} {$submissionTitle}</a><br />{$pressName}</p><p>Please follow these steps to complete this task:</p><ol><li>1. Click on the Submission URL below.</li><li>2. Open any files available under Draft Files and edit the files. Use the Copyediting Discussions area if you need to contact the editor(s) or author(s).</li><li>3. Save the copyedited file(s) and upload them to the Copyedited panel.</li><li>4. Use the Copyediting Discussions to notify the editor(s) that all files have been prepared, and that the Production process may begin.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.</p><p>Kind regards,</p>{$signature}'),('COPYEDIT_REQUEST','fr_CA','Demande de révision d\'une soumission','{$recipientName},<br />\n<br />\nJ\'aimerais que vous effectuiez la révision du manuscrit intitulé « {$submissionTitle} » pour la revue {$pressName} à l\'aide des étapes suivantes.<br />\n1. Cliquer sur l\'URL de la soumission ci-dessous.<br />\n2. Ouvrir le(s) fichier(s) disponible(s) sous Fichiers des ébauches finales et effectuer votre révision, tout en ajoutant des discussions sur la révision, le cas échéant.<br />\n3. Enregistrer le(s) fichier(s) révisé(s) et le(s) téléverser dans la section Version(s) révisée(s).<br />\n4. Informer le,la rédacteur-trice que tous les fichiers ont été révisés et que l\'étape de production peut débuter.<br />\n<br />\nURL de la revue {$pressName} : {$pressUrl}<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}'),('DISCUSSION_NOTIFICATION','en_US','{$subject}','{$content}<hr><p>Reply to this message at <a href=\"{$submissionUrl}\">{$pressName}</a>.'),('DISCUSSION_NOTIFICATION','fr_CA','',''),('EDITORIAL_REMINDER','en_US','Outstanding editorial tasks for {$pressName}','<p>Dear {$recipientName},</p><p>You are currently assigned to {$numberOfSubmissions} submissions in <a href=\"{$pressUrl}\">{$pressName}</a>. The following submissions are <b>waiting for your response</b>.</p>{$outstandingTasks}<p>View all of your assignments in your <a href=\"{$submissionsUrl}\">submission dashboard</a>.</p><p>This is an automated email from {$pressName}. You are receiving this email because you are an editor. To unsubscribe from these emails, please visit your <a href=\"{$userProfileUrl}\">user profile</a>.</p><p>If you have any questions about your assignments, please contact {$contactName} at {$contactEmail}.</p>'),('EDITORIAL_REMINDER','fr_CA','',''),('EDITOR_ASSIGN','en_US','Editorial Assignment','{$recipientName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$pressName} has been assigned to you to see through the editorial process in your role as an Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you,'),('EDITOR_ASSIGN','fr_CA','Travail éditorial','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; à la presse {$pressName} vous a été assignée. En tant que rédacteur en chef, vous devrez superviser le processus éditorial de cette soumission.<br />\n<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci,'),('EDITOR_DECISION_ACCEPT','en_US','Your submission has been accepted to {$pressName}','<p>Dear {$recipientName},</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, {$submissionTitle}, to meet or exceed our expectations. We are excited to publish your piece in {$pressName} and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for {$pressName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),('EDITOR_DECISION_ACCEPT','fr_CA','Décision du rédacteur en chef','{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$pressName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}'),('EDITOR_DECISION_BACK_FROM_COPYEDITING','en_US','Your submission has been sent back to review','<p>Dear {$recipientName},</p><p>Your submission, {$submissionTitle}, has been sent back to the review stage. It will undergo further review before it can be accepted for publication.</p><p>Occasionally, a decision to accept a submission will be recorded accidentally in our system and we must send it back to review. I apologize for any confusion this has caused. We will work to complete any further review quickly so that you have a final decision as soon as possible.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>'),('EDITOR_DECISION_BACK_FROM_COPYEDITING','fr_CA','',''),('EDITOR_DECISION_BACK_FROM_PRODUCTION','en_US','Your submission has been sent back to copyediting','<p>Dear {$recipientName},</p><p>Your submission, {$submissionTitle}, has been sent back to the copyediting stage, where it will undergo further copyediting and formatting to prepare it for publication.</p><p>Occasionally, a submission is sent to the production stage before it is ready for the final galleys to be prepared for publication. Your submission is still forthcoming. I apologize for any confusion.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We will contact you if we need any further assistance.</p><p>Kind regards,</p><p>{$signature}</p>'),('EDITOR_DECISION_BACK_FROM_PRODUCTION','fr_CA','',''),('EDITOR_DECISION_CANCEL_REVIEW_ROUND','en_US','A review round for your submission has been cancelled','<p>Dear {$recipientName},</p><p>We recently opened a new review round for your submission, {$submissionTitle}. We are closing this review round now.</p><p>Occasionally, a decision to open a round of review will be recorded accidentally in our system and we must cancel this review round. I apologize for any confusion this may have caused.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>'),('EDITOR_DECISION_CANCEL_REVIEW_ROUND','fr_CA','',''),('EDITOR_DECISION_DECLINE','en_US','Your submission has been declined','<p>Dear {$recipientName},</p><p>While we appreciate receiving your submission, we are unable to accept {$submissionTitle} for publication on the basis of the comments from reviewers.</p><p>The reviewers\' comments are included at the bottom of this email.</p><p>Thank you for submitting to {$pressName}. Although it is disappointing to have a submission declined, I hope you find the reviewers\' comments to be constructive and helpful.</p><p>You are now free to submit the work elsewhere if you choose to do so.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),('EDITOR_DECISION_DECLINE','fr_CA','Décision du rédacteur','{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de refuser votre soumission.'),('EDITOR_DECISION_INITIAL_DECLINE','en_US','Your submission has been declined','<p>Dear {$recipientName},</p><p>I’m sorry to inform you that, after reviewing your submission, {$submissionTitle}, the editor has found that it does not meet our requirements for publication in {$pressName}.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p>{$signature}'),('EDITOR_DECISION_INITIAL_DECLINE','fr_CA','Décision du rédacteur','\n			{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à  la revue {$pressName}.<br />\n<br />\nNotre décision est de refuser votre soumission.'),('EDITOR_DECISION_NEW_ROUND','en_US','Your submission has been sent for another round of review','<p>Dear {$recipientName},</p>\n<p>Your revised submission, {$submissionTitle}, has been sent for a new round of peer review. \nYou will hear from us with feedback from the reviewers and information about the next steps.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),('EDITOR_DECISION_NEW_ROUND','fr_CA','',''),('EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','en_US','An update regarding your submission','<p>The following email was sent to {$submittingAuthorName} from {$pressName} regarding {$submissionTitle}.</p>\n<p>You are receiving a copy of this notification because you are identified as an author of the submission. Any instructions in the message below are intended for the submitting author, {$submittingAuthorName}, and no action is required of you at this time.</p>\n\n{$messageToSubmittingAuthor}'),('EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','fr_CA','',''),('EDITOR_DECISION_RESUBMIT','en_US','Your submission has been reviewed - please revise and resubmit','<p>Dear {$recipientName},</p><p>After reviewing your submission, {$submissionTitle}, the reviewers have recommended that your submission cannot be accepted for publication in its current form. However, we would like to encourage you to submit a revised version that addresses the reviewers\' comments. Your revisions will be reviewed by an editor and may be sent out for another round of peer review.</p><p>Please note that resubmitting your work does not guarantee that it will be accepted.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point and identify what changes you have made. If you find any of the reviewer\'s comments inappropriate, please explain your perspective. If you have questions about the recommendations in your review, please include these in your response.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments <a href=\"{$authorSubmissionUrl}\">at your submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),('EDITOR_DECISION_RESUBMIT','fr_CA','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de vous demander d\'apporter des révisions à votre soumission et de la soumettre à nouveau.'),('EDITOR_DECISION_REVERT_DECLINE','en_US','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will complete the round of review and you will be notified when a \ndecision is made.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),('EDITOR_DECISION_REVERT_DECLINE','fr_CA','',''),('EDITOR_DECISION_REVERT_INITIAL_DECLINE','en_US','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will look further at your submission before deciding whether to decline \nthe submission or send it for review.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),('EDITOR_DECISION_REVERT_INITIAL_DECLINE','fr_CA','',''),('EDITOR_DECISION_REVISIONS','en_US','Your submission has been reviewed and we encourage you to submit revisions','<p>Dear {$recipientName},</p><p>Your submission {$submissionTitle} has been reviewed and we would like to encourage you to submit revisions that address the reviewers\' comments. An editor will review these revisions and if they address the concerns adequately, your submission may be accepted for publication.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point in the reviewers\' comments and identify what changes you have made. If you find any of the reviewer\'s comments to be unjustified or inappropriate, please explain your perspective.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments at your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),('EDITOR_DECISION_REVISIONS','fr_CA','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est de vous demander d\'apporter des révisions à votre soumission.'),('EDITOR_DECISION_SEND_TO_EXTERNAL','en_US','Your submission has been sent for review','<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>{$reviewTypeDescription} You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>'),('EDITOR_DECISION_SEND_TO_EXTERNAL','fr_CA','Décision du rédacteur','{$authors},<br />\n<br />\nNous avons pris une décision concernant votre soumission « {$submissionTitle} » à la revue {$pressName}.<br />\n<br />\nNotre décision est d\'envoyer votre soumission en évaluation.<br />\n<br />\nURL de la soumission : {$submissionUrl}'),('EDITOR_DECISION_SEND_TO_INTERNAL','en_US','Your submission has been sent for internal review','<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>'),('EDITOR_DECISION_SEND_TO_INTERNAL','fr_CA','',''),('EDITOR_DECISION_SEND_TO_PRODUCTION','en_US','Next steps for publishing your submission','<p>Dear {$recipientName},</p><p>I am writing from {$pressName} to let you know that the editing of your submission, {$submissionTitle}, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),('EDITOR_DECISION_SEND_TO_PRODUCTION','fr_CA','Décision du rédacteur','{$authors},<br />\n<br />\nL\'édition de votre soumission « {$submissionTitle} » est complétée. Nous l\'envoyons maintenant en production.<br />\n<br />\nURL de la soumission : {$submissionUrl}'),('EDITOR_DECISION_SKIP_REVIEW','en_US','Your submission has been sent for copyediting','<p>Dear {$recipientName},</p>\n<p>I am pleased to inform you that we have decided to accept your submission without peer review. We found your submission, {$submissionTitle}, to meet our expectations, and we do not require that work of this type undergo peer review. We are excited to publish your piece in {$pressName} and we thank you for choosing our press as a venue for your work.</p>\n<p>Your submission will soon be published on the press site for {$pressName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on your efforts.</p>\n<p>Your submission will now undergo copy editing and formatting to prepare it for publication. </p>\n<p>You will shortly receive further instructions.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),('EDITOR_DECISION_SKIP_REVIEW','fr_CA','',''),('EDITOR_RECOMMENDATION','en_US','Editor Recommendation','<p>Dear {$recipientName},</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission {$submissionTitle}.</p><p>My recommendation is:<br />{$recommendation}.</p><p>Please visit the submission\'s <a href=\"{$submissionUrl}\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>{$senderName}</p>'),('EDITOR_RECOMMENDATION','fr_CA','Recommandation du rédacteur','{$editors},<br />\n<br />\nLa recommandation concernant la soumission « {$submissionTitle} » à la revue {$pressName} est de : {$recommendation}'),('EMAIL_LINK','en_US','Manuscript of Possible Interest','Thought you might be interested in seeing &quot;{$submissionTitle}&quot; by {$authors} published in Vol {$volume}, No {$number} ({$year}) of {$pressName} at &quot;{$submissionUrl}&quot;.'),('EMAIL_LINK','fr_CA','Manuscrit susceptible d\'intéresser','Nous crayons que l\'article intitulé &quot;{$submissionTitle}&quot; par {$authors} publié dans le Volume {$volume}, No {$number} ({$year}) de la presse {$pressName} au &quot;{$submissionUrl}&quot; pourrait vous intéresser.'),('INDEX_COMPLETE','en_US','Index Galleys Complete','{$recipientName}:<br />\n<br />\nIndexes have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$pressName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signatureFullName}'),('INDEX_COMPLETE','fr_CA','Indexage des épreuves en placard complété','{$recipientName}:<br />\n<br />\nLes index du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$pressName} sont prêts et peuvent être révisés.<br />\n<br />\nSi vous avez questions, n\'hésitez pas à me contacter.<br />\n<br />\n{$signatureFullName}'),('INDEX_REQUEST','en_US','Request Index','{$recipientName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$pressName} now needs indexes created by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and use the Page Proofs file to create the galleys according to press standards.<br />\n3. Send the COMPLETE email to the editor.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.<br />\n<br />\n{$signature}'),('INDEX_REQUEST','fr_CA','Requête d\'indexage','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; par la presse {$pressName} doit désormais être indexée. Veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez les fichiers d\'épreuves de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir contribué à cette presse.<br />\n<br />\n{$signature}'),('LAYOUT_COMPLETE','en_US','Galleys Complete','<p>Dear {$recipientName},<p><p>Galleys have now been prepared for the following submission and are ready for final review.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$pressName}</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p><p>{$senderName}</p>'),('LAYOUT_COMPLETE','fr_CA','Épreuves en placard complétées','{$recipientName}:<br />\n<br />\nLes épreuves en placard du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$pressName} ont été préparées et peuvent être révisées.<br />\n<br />\nSi vous avez questions, n\'hésitez pas à me contacter.<br />\n<br />\n{$senderName}'),('LAYOUT_REQUEST','en_US','Submission {$submissionId} is ready for production at {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready for layout editing:</p><p><a href=\"{$submissionUrl}\">{$submissionId} {$submissionTitle}</a><br />{$pressName}</p><ol><li>1. Click on the Submission URL above.</li><li>2. Download the Production Ready files and use them to create the galleys according to the press\'s standards.</li><li>3. Upload the galleys to the Publication Formats section of the submission.</li><li>4. Use the Production Discussions to notify the editor that the galleys are ready.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.</p><p>Kind regards,</p>{$signature}'),('LAYOUT_REQUEST','fr_CA','Requête des épreuves en placard','{$recipientName}:<br />\n<br />\nIl faut maintenant préparer les épreuves en placard de la soumission &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Pour ce faire, veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez le fichier Version de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir contribué à cette presse.'),('MANUAL_PAYMENT_NOTIFICATION','en_US','Manual Payment Notification','A manual payment needs to be processed for the press {$pressName} and the user {$senderName} (username &quot;{$senderUsername}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$paymentName}&quot;.<br />\nThe cost is {$paymentAmount} ({$paymentCurrencyCode}).<br />\n<br />\nThis email was generated by the Open Monograph Press Manual Payment plugin.'),('NOTIFICATION','en_US','New notification from {$pressName}','You have a new notification from {$pressName}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$notificationUrl}<br />\n<br />\nThis is an automatically generated email; please do not reply to this message.<br />\n{$pressSignature}<hr />{$unsubscribeLink}'),('NOTIFICATION','fr_CA','Nouvelle notification de {$pressName}','Vous avez reçu une nouvelle notification de {$pressName}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLien: {$notificationUrl}<br />\n<br />\n{$pressSignature}'),('NOTIFICATION_CENTER_DEFAULT','en_US','A message regarding {$pressName}','Please enter your message.'),('NOTIFICATION_CENTER_DEFAULT','fr_CA','Un message à propos de la presse {$pressName}','Veuillez saisir votre message.'),('PASSWORD_RESET','en_US','Password Reset','Your password has been successfully reset for use with the {$siteTitle} web site.<br />\n<br />\nYour username: {$recipientUsername}<br />\nYour new password: {$password}<br />\n<br />\n{$siteContactName}'),('PASSWORD_RESET','fr_CA','Réinitialisation du mot de passe','Votre mot de passe vous permettant d\'avoir accès au site Web {$siteTitle} a été réinitialisé. Veuillez noter votre nom d\'utilisateur et mot de passe dans vos dossiers, car vous en aurez besoin pour vos travaux auprès de la presse.<br />\n<br />\nVotre nom d\'utilisateur: {$recipientUsername}<br />\nVotre nouveau mot de passe: {$password}<br />\n<br />\n{$siteContactName}'),('PASSWORD_RESET_CONFIRM','en_US','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),('PASSWORD_RESET_CONFIRM','fr_CA','Confirmation de réinitialisation du mot de passe','Nous avons reçu une requête de réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette requête, veuillez ignorer ce courriel et votre mot de passe demeurera le même. Si vous souhaitez modifier votre mot de passe, cliquez sur l\'adresse URL ci-dessous.<br />\n<br />\nModifier mon mot de passe: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),('PAYPAL_INVESTIGATE_PAYMENT','en_US','Unusual PayPal Activity','Open Monograph Press has encountered unusual activity relating to PayPal payment support for the press {$pressName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by the Open Monograph Press PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n'),('REVIEWER_REGISTER','en_US','Registration as Reviewer with {$pressName}','In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$pressName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the press through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),('REVIEWER_REGISTER','fr_CA','Inscription à titre d\'évaluateur pour la presse {$pressName}','En raison de votre expertise, nous avons ajouté votre nom à notre base de données d\'évaluateurs pour la presse {$pressName}. Ceci ne vous oblige à rien, mais nous permet simplement de vous approcher si nous recevons une soumission que vous pourriez évaluer. Après avoir reçu une demande d\'évaluation, vous aurez la possibilité de lire le titre et le résumé de l\'article en question. Vous serez toujours libre d\'accepter ou de refuser l\'invitation. Vous pouvez demander que l\'on retire votre nom de notre liste d\'évaluateurs en tout temps.<br />\n<br />\nVoici votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin dans tous vos échanges avec la presse à travers son site Web. Vous pourriez, par exemple, mettre votre profil à jour, y compris vos champs d\'intérêt en ce qui concerne l\'évaluation des articles.<br />\n<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$signature}'),('REVIEW_ACK','en_US','Thank you for your review','<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, {$submissionTitle}, for {$pressName}. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>{$decisionDescription}</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$pressName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>'),('REVIEW_ACK','fr_CA','Accusé de réception de l\'évaluation d\'une soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir évalué la soumission intitulée « {$submissionTitle} » pour la revue {$pressName}. Nous vous sommes reconnaissants de votre contribution à la qualité des travaux que nous publions.'),('REVIEW_CANCEL','en_US','Request for Review Cancelled','{$recipientName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this review process in the future.<br />\n<br />\nIf you have any questions, please contact me.'),('REVIEW_CANCEL','fr_CA','Annulation de la requête d\'évaluation','{$recipientName}:<br />\n<br />\n<br />\nNous avons décidé d\'annuler notre requête d\'évaluation pour la soumission &quot;{$submissionTitle}&quot; de la presse {$pressName}. Nous vous prions de nous excuser pour tout inconvénient que cette décision pourrait occasionner et nous espérons que vous serez en mesure d\'évaluer une soumission dans un avenir prochain.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à me contacter.'),('REVIEW_CONFIRM','en_US','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$senderName}'),('REVIEW_CONFIRM','fr_CA','En mesure d\'évaluer','Éditeurs:<br />\n<br />\nJe peux et je souhaite évaluer la soumission &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Merci de m\'avoir invité à évaluer cet article. Je prévois terminer mon évaluation d\'ici le {$reviewDueDate}.<br />\n<br />\n{$senderName}'),('REVIEW_DECLINE','en_US','Unable to Review','Editor(s):<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$senderName}'),('REVIEW_DECLINE','fr_CA','Ne peux pas évaluer','Éditeurs:<br />\n<br />\nMalheureusement, je ne pourrai pas évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Merci de m\'avoir invité à évaluer cet article et n\'hésitez pas à me contacter dans un avenir prochain.<br />\n<br />\n{$senderName}'),('REVIEW_REINSTATE','en_US','Request for Review Reinstated','{$recipientName}:<br />\n<br />\nWe would like to reinstate our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We hope that you will be able to assist with this press\'s review process.<br />\n<br />\nIf you have any questions, please contact me.'),('REVIEW_REINSTATE','fr_CA','',''),('REVIEW_REMIND','en_US','Submission Review Reminder','{$recipientName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$signature}'),('REVIEW_REMIND','fr_CA','Rappel d\'évaluation','{$recipientName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoyés par courriel. {$passwordResetUrl}<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Nous vous prions d\'agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$signature}'),('REVIEW_REMIND_AUTO','en_US','Automated Submission Review Reminder','{$recipientName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$signature}'),('REVIEW_REMIND_AUTO','fr_CA','Rappel automatique d\'évaluation d\'une soumission','{$recipientName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Ce courriel a été généré et envoyé automatiquement parce que vous avez dépassé la date d\'échéance. Toutefois, nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoyés par courriel. {$passwordResetUrl}<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Veuillez agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$signature}'),('REVIEW_REQUEST','en_US','Manuscript Review Request','Dear {$recipientName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$signature}<br />\n'),('REVIEW_REQUEST','fr_CA','Requête d\'évaluation d\'un manuscrit','Bonjour {$recipientName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nVeuillez ouvrir une session sur le site Web de la presse d\'ici le {$responseDueDate} pour indiquer si vous serez en mesure d\'évaluer l\'article ou non. Ceci vous permettra également d\'accéder à la soumission, et de saisir votre évaluation et vos recommandations.<br />\n<br />\n<br />\nL\'évaluation doit être terminée d\'ici le {$reviewDueDate}.<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci de votre intérêt à évaluer des articles pour notre presse.<br />\n<br />\n{$signature}<br />\n'),('REVIEW_REQUEST_SUBSEQUENT','en_US','Request to review a revised submission','<p>Dear {$recipientName},</p><p>Thank you for your review of <a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a>. The authors have considered the reviewers\' feedback and have now submitted a revised version of their work. I\'m writing to ask if you would conduct a second round of peer review for this submission. {$pressName}.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can <a href=\"{$reviewAssignmentUrl}\">follow the review steps</a> to view the submission, upload review files, and submit your review comments.<p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p>Abstract</p>{$submissionAbstract}<p>Please accept or decline the review by {$responseDueDate}.</p><p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}'),('REVIEW_REQUEST_SUBSEQUENT','fr_CA','',''),('REVIEW_RESEND_REQUEST','en_US','Requesting your review again for {$pressName}','<p>Dear {$recipientName},</p><p>Recently, you declined our request to review a submission, {$submissionTitle}, for {$pressName}. I\'m writing to see if you are able to conduct the review after all.</p><p>We would be grateful if you\'re able to perform this review, but we understand if that is not possible at this time. Either way, please <a href=\"{$reviewAssignmentUrl}\">accept or decline the request</a> by {$responseDueDate}, so that we can find an alternate reviewer.<p>If you have any questions, please contact me.</p><p>Kind regards,</p>{$signature}'),('REVIEW_RESEND_REQUEST','fr_CA','',''),('REVIEW_RESPONSE_OVERDUE_AUTO','en_US','Manuscript Review Request','Dear {$recipientName},<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$signature}<br />\n'),('REVIEW_RESPONSE_OVERDUE_AUTO','fr_CA','',''),('STATISTICS_REPORT_NOTIFICATION','en_US','Editorial activity for {$month}, {$year}','\n{$recipientName}, <br />\n<br />\nYour press health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the press to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published book stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$pressSignature}'),('STATISTICS_REPORT_NOTIFICATION','fr_CA','',''),('SUBMISSION_ACK','en_US','Thank you for your submission to {$pressName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$pressName}. We have received your submission, {$submissionTitle}, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: {$authorSubmissionUrl}</p><p>If you have been logged out, you can login again with the username {$recipientUsername}</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p>{$pressSignature}'),('SUBMISSION_ACK','fr_CA','Accusé de réception de la soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$pressName}. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d\'édition en accédant au site Web de la revue :<br />\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$pressSignature}'),('SUBMISSION_ACK_NOT_USER','en_US','Submission Acknowledgement','Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$pressName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n{$pressSignature}'),('SUBMISSION_ACK_NOT_USER','fr_CA','Accusé de réception d\'une soumission','Bonjour,<br />\n<br />\n{$submitterName} a envoyé un manuscrit intitulé &quot;{$submissionTitle}&quot; à la presse {$pressName}. <br />\n<br />\nSi vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir envoyé votre article à cette presse.<br />\n<br />\n{$pressSignature}'),('USER_REGISTER','en_US','Press Registration','{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$pressName}. We have included your username and password in this email, which are needed for all work with this press through its website. At any point, you can ask to be removed from the list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),('USER_REGISTER','fr_CA','Inscription à la presse','{$recipientName}<br />\n<br />\nVous êtes désormais inscrit à la presse {$pressName}. Ce courriel contient votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin pour tous vos travaux au sein de la presse. Vous pouvez demander que l\'on retire votre nom de la liste des utilisateurs en tout temps. Il suffit de me contacter.<br />\n<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$signature}'),('USER_VALIDATE_CONTEXT','en_US','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$pressName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$signature}'),('USER_VALIDATE_CONTEXT','fr_CA','',''),('USER_VALIDATE_SITE','en_US','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$signature}'),('USER_VALIDATE_SITE','fr_CA','','');
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
) ENGINE=InnoDB AUTO_INCREMENT=489 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,19,'2022-10-26 07:27:36',268435458,'submission.event.general.metadataUpdated',0),(2,1048585,1,19,'2022-10-26 07:27:37',268435458,'submission.event.general.metadataUpdated',0),(3,515,1,19,'2022-10-26 07:27:39',1342177281,'submission.event.fileUploaded',0),(4,1048585,1,19,'2022-10-26 07:27:39',1342177288,'submission.event.fileRevised',0),(5,515,1,19,'2022-10-26 07:27:40',1342177296,'submission.event.fileEdited',0),(6,1048585,1,19,'2022-10-26 07:27:40',1342177296,'submission.event.fileEdited',0),(7,1048585,1,19,'2022-10-26 07:27:54',268435458,'submission.event.general.metadataUpdated',0),(8,1048585,1,19,'2022-10-26 07:27:55',268435457,'submission.event.submissionSubmitted',0),(9,1048585,1,3,'2022-10-26 07:28:06',805306371,'editor.submission.decision.sendExternalReview.log',0),(10,515,2,3,'2022-10-26 07:28:06',1342177281,'submission.event.fileUploaded',0),(11,1048585,1,3,'2022-10-26 07:28:06',1342177288,'submission.event.fileRevised',0),(12,1048585,1,3,'2022-10-26 07:28:16',1073741825,'log.review.reviewerAssigned',0),(13,1048585,1,3,'2022-10-26 07:28:21',805306371,'editor.submission.decision.accept.log',0),(14,1048585,1,3,'2022-10-26 07:28:29',268435459,'submission.event.participantAdded',0),(15,1048585,2,20,'2022-10-26 07:28:39',268435458,'submission.event.general.metadataUpdated',0),(16,1048585,2,20,'2022-10-26 07:28:39',268435458,'submission.event.general.metadataUpdated',0),(17,515,3,20,'2022-10-26 07:28:41',1342177281,'submission.event.fileUploaded',0),(18,1048585,2,20,'2022-10-26 07:28:41',1342177288,'submission.event.fileRevised',0),(19,515,3,20,'2022-10-26 07:28:42',1342177296,'submission.event.fileEdited',0),(20,1048585,2,20,'2022-10-26 07:28:42',1342177296,'submission.event.fileEdited',0),(21,515,4,20,'2022-10-26 07:28:42',1342177281,'submission.event.fileUploaded',0),(22,1048585,2,20,'2022-10-26 07:28:42',1342177288,'submission.event.fileRevised',0),(23,515,4,20,'2022-10-26 07:28:44',1342177296,'submission.event.fileEdited',0),(24,1048585,2,20,'2022-10-26 07:28:44',1342177296,'submission.event.fileEdited',0),(25,515,5,20,'2022-10-26 07:28:44',1342177281,'submission.event.fileUploaded',0),(26,1048585,2,20,'2022-10-26 07:28:44',1342177288,'submission.event.fileRevised',0),(27,515,5,20,'2022-10-26 07:28:45',1342177296,'submission.event.fileEdited',0),(28,1048585,2,20,'2022-10-26 07:28:45',1342177296,'submission.event.fileEdited',0),(29,515,6,20,'2022-10-26 07:28:46',1342177281,'submission.event.fileUploaded',0),(30,1048585,2,20,'2022-10-26 07:28:46',1342177288,'submission.event.fileRevised',0),(31,515,6,20,'2022-10-26 07:28:47',1342177296,'submission.event.fileEdited',0),(32,1048585,2,20,'2022-10-26 07:28:47',1342177296,'submission.event.fileEdited',0),(33,1048585,2,20,'2022-10-26 07:29:53',268435458,'submission.event.general.metadataUpdated',0),(34,1048585,2,20,'2022-10-26 07:29:56',268435457,'submission.event.submissionSubmitted',0),(35,1048585,2,3,'2022-10-26 07:30:11',805306371,'editor.submission.decision.sendExternalReview.log',0),(36,515,7,3,'2022-10-26 07:30:12',1342177281,'submission.event.fileUploaded',0),(37,1048585,2,3,'2022-10-26 07:30:12',1342177288,'submission.event.fileRevised',0),(38,515,8,3,'2022-10-26 07:30:12',1342177281,'submission.event.fileUploaded',0),(39,1048585,2,3,'2022-10-26 07:30:12',1342177288,'submission.event.fileRevised',0),(40,515,9,3,'2022-10-26 07:30:12',1342177281,'submission.event.fileUploaded',0),(41,1048585,2,3,'2022-10-26 07:30:12',1342177288,'submission.event.fileRevised',0),(42,515,10,3,'2022-10-26 07:30:13',1342177281,'submission.event.fileUploaded',0),(43,1048585,2,3,'2022-10-26 07:30:13',1342177288,'submission.event.fileRevised',0),(44,1048585,2,3,'2022-10-26 07:30:24',1073741825,'log.review.reviewerAssigned',0),(45,1048585,2,3,'2022-10-26 07:30:33',1073741825,'log.review.reviewerAssigned',0),(46,1048585,3,21,'2022-10-26 07:30:43',268435458,'submission.event.general.metadataUpdated',0),(47,1048585,3,21,'2022-10-26 07:30:43',268435458,'submission.event.general.metadataUpdated',0),(48,515,11,21,'2022-10-26 07:30:45',1342177281,'submission.event.fileUploaded',0),(49,1048585,3,21,'2022-10-26 07:30:45',1342177288,'submission.event.fileRevised',0),(50,515,11,21,'2022-10-26 07:30:47',1342177296,'submission.event.fileEdited',0),(51,1048585,3,21,'2022-10-26 07:30:47',1342177296,'submission.event.fileEdited',0),(52,1048585,3,21,'2022-10-26 07:31:10',268435458,'submission.event.general.metadataUpdated',0),(53,1048585,3,21,'2022-10-26 07:31:12',268435457,'submission.event.submissionSubmitted',0),(54,1048585,4,22,'2022-10-26 07:31:21',268435458,'submission.event.general.metadataUpdated',0),(55,1048585,4,22,'2022-10-26 07:31:21',268435458,'submission.event.general.metadataUpdated',0),(56,515,12,22,'2022-10-26 07:31:23',1342177281,'submission.event.fileUploaded',0),(57,1048585,4,22,'2022-10-26 07:31:23',1342177288,'submission.event.fileRevised',0),(58,515,12,22,'2022-10-26 07:31:24',1342177296,'submission.event.fileEdited',0),(59,1048585,4,22,'2022-10-26 07:31:24',1342177296,'submission.event.fileEdited',0),(60,515,13,22,'2022-10-26 07:31:24',1342177281,'submission.event.fileUploaded',0),(61,1048585,4,22,'2022-10-26 07:31:24',1342177288,'submission.event.fileRevised',0),(62,515,13,22,'2022-10-26 07:31:26',1342177296,'submission.event.fileEdited',0),(63,1048585,4,22,'2022-10-26 07:31:26',1342177296,'submission.event.fileEdited',0),(64,515,14,22,'2022-10-26 07:31:26',1342177281,'submission.event.fileUploaded',0),(65,1048585,4,22,'2022-10-26 07:31:26',1342177288,'submission.event.fileRevised',0),(66,515,14,22,'2022-10-26 07:31:27',1342177296,'submission.event.fileEdited',0),(67,1048585,4,22,'2022-10-26 07:31:27',1342177296,'submission.event.fileEdited',0),(68,515,15,22,'2022-10-26 07:31:28',1342177281,'submission.event.fileUploaded',0),(69,1048585,4,22,'2022-10-26 07:31:28',1342177288,'submission.event.fileRevised',0),(70,515,15,22,'2022-10-26 07:31:29',1342177296,'submission.event.fileEdited',0),(71,1048585,4,22,'2022-10-26 07:31:29',1342177296,'submission.event.fileEdited',0),(72,1048585,4,22,'2022-10-26 07:32:15',268435458,'submission.event.general.metadataUpdated',0),(73,1048585,4,22,'2022-10-26 07:32:17',268435457,'submission.event.submissionSubmitted',0),(74,1048585,4,3,'2022-10-26 07:32:32',805306371,'editor.submission.decision.sendInternalReview.log',0),(75,515,16,3,'2022-10-26 07:32:32',1342177281,'submission.event.fileUploaded',0),(76,1048585,4,3,'2022-10-26 07:32:32',1342177288,'submission.event.fileRevised',0),(77,515,17,3,'2022-10-26 07:32:32',1342177281,'submission.event.fileUploaded',0),(78,1048585,4,3,'2022-10-26 07:32:32',1342177288,'submission.event.fileRevised',0),(79,515,18,3,'2022-10-26 07:32:33',1342177281,'submission.event.fileUploaded',0),(80,1048585,4,3,'2022-10-26 07:32:33',1342177288,'submission.event.fileRevised',0),(81,515,19,3,'2022-10-26 07:32:33',1342177281,'submission.event.fileUploaded',0),(82,1048585,4,3,'2022-10-26 07:32:33',1342177288,'submission.event.fileRevised',0),(83,1048585,4,3,'2022-10-26 07:32:43',1073741825,'log.review.reviewerAssigned',0),(84,1048585,4,3,'2022-10-26 07:32:50',805306371,'editor.submission.decision.sendExternalReview.log',0),(85,1048585,4,3,'2022-10-26 07:33:01',1073741825,'log.review.reviewerAssigned',0),(86,1048585,4,3,'2022-10-26 07:33:08',805306371,'editor.submission.decision.accept.log',0),(87,1048585,4,3,'2022-10-26 07:33:19',268435459,'submission.event.participantAdded',0),(88,1048585,4,3,'2022-10-26 07:33:25',805306371,'editor.submission.decision.sendToProduction.log',0),(89,1048585,4,3,'2022-10-26 07:33:37',268435459,'submission.event.participantAdded',0),(90,1048585,4,3,'2022-10-26 07:33:45',268435474,'submission.event.publicationFormatCreated',0),(91,1048585,5,23,'2022-10-26 07:33:55',268435458,'submission.event.general.metadataUpdated',0),(92,1048585,5,23,'2022-10-26 07:33:55',268435458,'submission.event.general.metadataUpdated',0),(93,515,20,23,'2022-10-26 07:33:57',1342177281,'submission.event.fileUploaded',0),(94,1048585,5,23,'2022-10-26 07:33:57',1342177288,'submission.event.fileRevised',0),(95,515,20,23,'2022-10-26 07:33:59',1342177296,'submission.event.fileEdited',0),(96,1048585,5,23,'2022-10-26 07:33:59',1342177296,'submission.event.fileEdited',0),(97,1048585,5,23,'2022-10-26 07:34:27',268435458,'submission.event.general.metadataUpdated',0),(98,1048585,5,23,'2022-10-26 07:34:28',268435457,'submission.event.submissionSubmitted',0),(99,1048585,5,3,'2022-10-26 07:34:41',805306371,'editor.submission.decision.sendInternalReview.log',0),(100,515,21,3,'2022-10-26 07:34:42',1342177281,'submission.event.fileUploaded',0),(101,1048585,5,3,'2022-10-26 07:34:42',1342177288,'submission.event.fileRevised',0),(102,1048585,5,3,'2022-10-26 07:34:51',1073741825,'log.review.reviewerAssigned',0),(103,1048585,5,3,'2022-10-26 07:34:56',805306371,'editor.submission.decision.sendExternalReview.log',0),(104,1048585,5,3,'2022-10-26 07:35:07',1073741825,'log.review.reviewerAssigned',0),(105,1048585,5,3,'2022-10-26 07:35:13',805306371,'editor.submission.decision.accept.log',0),(106,1048585,5,3,'2022-10-26 07:35:22',268435459,'submission.event.participantAdded',0),(107,1048585,5,3,'2022-10-26 07:35:29',805306371,'editor.submission.decision.sendToProduction.log',0),(108,1048585,5,3,'2022-10-26 07:35:39',268435459,'submission.event.participantAdded',0),(109,1048585,5,3,'2022-10-26 07:35:46',268435459,'submission.event.participantAdded',0),(110,1048585,5,3,'2022-10-26 07:35:51',268435474,'submission.event.publicationFormatCreated',0),(111,515,22,3,'2022-10-26 07:35:55',1342177281,'submission.event.fileUploaded',0),(112,1048585,5,3,'2022-10-26 07:35:55',1342177288,'submission.event.fileRevised',0),(113,1048585,5,3,'2022-10-26 07:35:57',268435464,'submission.event.publicationFormatPublished',0),(114,1048585,5,3,'2022-10-26 07:35:59',268435476,'submission.event.publicationFormatMadeAvailable',0),(115,515,22,3,'2022-10-26 07:36:01',1342177296,'submission.event.fileEdited',0),(116,1048585,5,3,'2022-10-26 07:36:01',1342177296,'submission.event.fileEdited',0),(117,515,22,3,'2022-10-26 07:36:01',1342177287,'submission.event.signoffSignoff',0),(118,515,22,3,'2022-10-26 07:36:04',1342177296,'submission.event.fileEdited',0),(119,1048585,5,3,'2022-10-26 07:36:04',1342177296,'submission.event.fileEdited',0),(120,1048585,5,3,'2022-10-26 07:36:06',268435462,'publication.event.published',0),(121,1048585,6,24,'2022-10-26 07:36:16',268435458,'submission.event.general.metadataUpdated',0),(122,1048585,6,24,'2022-10-26 07:36:16',268435458,'submission.event.general.metadataUpdated',0),(123,515,23,24,'2022-10-26 07:36:18',1342177281,'submission.event.fileUploaded',0),(124,1048585,6,24,'2022-10-26 07:36:18',1342177288,'submission.event.fileRevised',0),(125,515,23,24,'2022-10-26 07:36:20',1342177296,'submission.event.fileEdited',0),(126,1048585,6,24,'2022-10-26 07:36:20',1342177296,'submission.event.fileEdited',0),(127,515,24,24,'2022-10-26 07:36:20',1342177281,'submission.event.fileUploaded',0),(128,1048585,6,24,'2022-10-26 07:36:20',1342177288,'submission.event.fileRevised',0),(129,515,24,24,'2022-10-26 07:36:21',1342177296,'submission.event.fileEdited',0),(130,1048585,6,24,'2022-10-26 07:36:21',1342177296,'submission.event.fileEdited',0),(131,515,25,24,'2022-10-26 07:36:22',1342177281,'submission.event.fileUploaded',0),(132,1048585,6,24,'2022-10-26 07:36:22',1342177288,'submission.event.fileRevised',0),(133,515,25,24,'2022-10-26 07:36:23',1342177296,'submission.event.fileEdited',0),(134,1048585,6,24,'2022-10-26 07:36:23',1342177296,'submission.event.fileEdited',0),(135,515,26,24,'2022-10-26 07:36:23',1342177281,'submission.event.fileUploaded',0),(136,1048585,6,24,'2022-10-26 07:36:23',1342177288,'submission.event.fileRevised',0),(137,515,26,24,'2022-10-26 07:36:25',1342177296,'submission.event.fileEdited',0),(138,1048585,6,24,'2022-10-26 07:36:25',1342177296,'submission.event.fileEdited',0),(139,1048585,6,24,'2022-10-26 07:37:08',268435458,'submission.event.general.metadataUpdated',0),(140,1048585,6,24,'2022-10-26 07:37:10',268435457,'submission.event.submissionSubmitted',0),(141,1048585,6,3,'2022-10-26 07:37:25',805306371,'editor.submission.decision.sendInternalReview.log',0),(142,515,27,3,'2022-10-26 07:37:25',1342177281,'submission.event.fileUploaded',0),(143,1048585,6,3,'2022-10-26 07:37:25',1342177288,'submission.event.fileRevised',0),(144,515,28,3,'2022-10-26 07:37:25',1342177281,'submission.event.fileUploaded',0),(145,1048585,6,3,'2022-10-26 07:37:25',1342177288,'submission.event.fileRevised',0),(146,515,29,3,'2022-10-26 07:37:25',1342177281,'submission.event.fileUploaded',0),(147,1048585,6,3,'2022-10-26 07:37:25',1342177288,'submission.event.fileRevised',0),(148,515,30,3,'2022-10-26 07:37:26',1342177281,'submission.event.fileUploaded',0),(149,1048585,6,3,'2022-10-26 07:37:26',1342177288,'submission.event.fileRevised',0),(150,1048585,6,3,'2022-10-26 07:37:36',268435459,'submission.event.participantAdded',0),(151,1048585,6,6,'2022-10-26 07:37:50',805306372,'editor.submission.recommend.accept.log',0),(152,1048585,7,25,'2022-10-26 07:38:13',268435458,'submission.event.general.metadataUpdated',0),(153,1048585,7,25,'2022-10-26 07:38:13',268435458,'submission.event.general.metadataUpdated',0),(154,515,31,25,'2022-10-26 07:38:15',1342177281,'submission.event.fileUploaded',0),(155,1048585,7,25,'2022-10-26 07:38:15',1342177288,'submission.event.fileRevised',0),(156,515,31,25,'2022-10-26 07:38:17',1342177296,'submission.event.fileEdited',0),(157,1048585,7,25,'2022-10-26 07:38:17',1342177296,'submission.event.fileEdited',0),(158,515,32,25,'2022-10-26 07:38:17',1342177281,'submission.event.fileUploaded',0),(159,1048585,7,25,'2022-10-26 07:38:17',1342177288,'submission.event.fileRevised',0),(160,515,32,25,'2022-10-26 07:38:18',1342177296,'submission.event.fileEdited',0),(161,1048585,7,25,'2022-10-26 07:38:18',1342177296,'submission.event.fileEdited',0),(162,515,33,25,'2022-10-26 07:38:19',1342177281,'submission.event.fileUploaded',0),(163,1048585,7,25,'2022-10-26 07:38:19',1342177288,'submission.event.fileRevised',0),(164,515,33,25,'2022-10-26 07:38:20',1342177296,'submission.event.fileEdited',0),(165,1048585,7,25,'2022-10-26 07:38:20',1342177296,'submission.event.fileEdited',0),(166,515,34,25,'2022-10-26 07:38:20',1342177281,'submission.event.fileUploaded',0),(167,1048585,7,25,'2022-10-26 07:38:20',1342177288,'submission.event.fileRevised',0),(168,515,34,25,'2022-10-26 07:38:21',1342177296,'submission.event.fileEdited',0),(169,1048585,7,25,'2022-10-26 07:38:21',1342177296,'submission.event.fileEdited',0),(170,515,35,25,'2022-10-26 07:38:22',1342177281,'submission.event.fileUploaded',0),(171,1048585,7,25,'2022-10-26 07:38:22',1342177288,'submission.event.fileRevised',0),(172,515,35,25,'2022-10-26 07:38:23',1342177296,'submission.event.fileEdited',0),(173,1048585,7,25,'2022-10-26 07:38:23',1342177296,'submission.event.fileEdited',0),(174,1048585,7,25,'2022-10-26 07:39:27',268435458,'submission.event.general.metadataUpdated',0),(175,1048585,7,25,'2022-10-26 07:39:29',268435457,'submission.event.submissionSubmitted',0),(176,1048585,7,3,'2022-10-26 07:39:46',805306371,'editor.submission.decision.sendExternalReview.log',0),(177,515,36,3,'2022-10-26 07:39:47',1342177281,'submission.event.fileUploaded',0),(178,1048585,7,3,'2022-10-26 07:39:47',1342177288,'submission.event.fileRevised',0),(179,515,37,3,'2022-10-26 07:39:47',1342177281,'submission.event.fileUploaded',0),(180,1048585,7,3,'2022-10-26 07:39:47',1342177288,'submission.event.fileRevised',0),(181,515,38,3,'2022-10-26 07:39:47',1342177281,'submission.event.fileUploaded',0),(182,1048585,7,3,'2022-10-26 07:39:47',1342177288,'submission.event.fileRevised',0),(183,515,39,3,'2022-10-26 07:39:47',1342177281,'submission.event.fileUploaded',0),(184,1048585,7,3,'2022-10-26 07:39:47',1342177288,'submission.event.fileRevised',0),(185,515,40,3,'2022-10-26 07:39:47',1342177281,'submission.event.fileUploaded',0),(186,1048585,7,3,'2022-10-26 07:39:47',1342177288,'submission.event.fileRevised',0),(187,1048585,7,3,'2022-10-26 07:39:58',1073741825,'log.review.reviewerAssigned',0),(188,1048585,7,3,'2022-10-26 07:40:05',805306371,'editor.submission.decision.accept.log',0),(189,1048585,7,3,'2022-10-26 07:40:16',268435459,'submission.event.participantAdded',0),(190,1048585,8,3,'2022-10-26 07:40:28',268435458,'submission.event.general.metadataUpdated',0),(191,1048585,8,3,'2022-10-26 07:40:28',268435458,'submission.event.general.metadataUpdated',0),(192,515,41,3,'2022-10-26 07:40:30',1342177281,'submission.event.fileUploaded',0),(193,1048585,8,3,'2022-10-26 07:40:30',1342177288,'submission.event.fileRevised',0),(194,515,41,3,'2022-10-26 07:40:32',1342177296,'submission.event.fileEdited',0),(195,1048585,8,3,'2022-10-26 07:40:32',1342177296,'submission.event.fileEdited',0),(196,1048585,8,3,'2022-10-26 07:40:33',268435458,'submission.event.general.metadataUpdated',0),(197,1048585,8,3,'2022-10-26 07:40:34',268435457,'submission.event.submissionSubmitted',0),(198,1048585,9,26,'2022-10-26 07:40:43',268435458,'submission.event.general.metadataUpdated',0),(199,1048585,9,26,'2022-10-26 07:40:43',268435458,'submission.event.general.metadataUpdated',0),(200,515,42,26,'2022-10-26 07:40:45',1342177281,'submission.event.fileUploaded',0),(201,1048585,9,26,'2022-10-26 07:40:45',1342177288,'submission.event.fileRevised',0),(202,515,42,26,'2022-10-26 07:40:46',1342177296,'submission.event.fileEdited',0),(203,1048585,9,26,'2022-10-26 07:40:46',1342177296,'submission.event.fileEdited',0),(204,515,43,26,'2022-10-26 07:40:47',1342177281,'submission.event.fileUploaded',0),(205,1048585,9,26,'2022-10-26 07:40:47',1342177288,'submission.event.fileRevised',0),(206,515,43,26,'2022-10-26 07:40:48',1342177296,'submission.event.fileEdited',0),(207,1048585,9,26,'2022-10-26 07:40:48',1342177296,'submission.event.fileEdited',0),(208,515,44,26,'2022-10-26 07:40:48',1342177281,'submission.event.fileUploaded',0),(209,1048585,9,26,'2022-10-26 07:40:48',1342177288,'submission.event.fileRevised',0),(210,515,44,26,'2022-10-26 07:40:50',1342177296,'submission.event.fileEdited',0),(211,1048585,9,26,'2022-10-26 07:40:50',1342177296,'submission.event.fileEdited',0),(212,515,45,26,'2022-10-26 07:40:50',1342177281,'submission.event.fileUploaded',0),(213,1048585,9,26,'2022-10-26 07:40:50',1342177288,'submission.event.fileRevised',0),(214,515,45,26,'2022-10-26 07:40:51',1342177296,'submission.event.fileEdited',0),(215,1048585,9,26,'2022-10-26 07:40:51',1342177296,'submission.event.fileEdited',0),(216,515,46,26,'2022-10-26 07:40:52',1342177281,'submission.event.fileUploaded',0),(217,1048585,9,26,'2022-10-26 07:40:52',1342177288,'submission.event.fileRevised',0),(218,515,46,26,'2022-10-26 07:40:53',1342177296,'submission.event.fileEdited',0),(219,1048585,9,26,'2022-10-26 07:40:53',1342177296,'submission.event.fileEdited',0),(220,1048585,9,26,'2022-10-26 07:41:53',268435458,'submission.event.general.metadataUpdated',0),(221,1048585,9,26,'2022-10-26 07:41:55',268435457,'submission.event.submissionSubmitted',0),(222,1048585,9,3,'2022-10-26 07:42:13',805306371,'editor.submission.decision.sendInternalReview.log',0),(223,515,47,3,'2022-10-26 07:42:13',1342177281,'submission.event.fileUploaded',0),(224,1048585,9,3,'2022-10-26 07:42:13',1342177288,'submission.event.fileRevised',0),(225,515,48,3,'2022-10-26 07:42:13',1342177281,'submission.event.fileUploaded',0),(226,1048585,9,3,'2022-10-26 07:42:13',1342177288,'submission.event.fileRevised',0),(227,515,49,3,'2022-10-26 07:42:13',1342177281,'submission.event.fileUploaded',0),(228,1048585,9,3,'2022-10-26 07:42:13',1342177288,'submission.event.fileRevised',0),(229,515,50,3,'2022-10-26 07:42:14',1342177281,'submission.event.fileUploaded',0),(230,1048585,9,3,'2022-10-26 07:42:14',1342177288,'submission.event.fileRevised',0),(231,515,51,3,'2022-10-26 07:42:14',1342177281,'submission.event.fileUploaded',0),(232,1048585,9,3,'2022-10-26 07:42:14',1342177288,'submission.event.fileRevised',0),(233,1048585,10,27,'2022-10-26 07:42:28',268435458,'submission.event.general.metadataUpdated',0),(234,1048585,10,27,'2022-10-26 07:42:28',268435458,'submission.event.general.metadataUpdated',0),(235,515,52,27,'2022-10-26 07:42:30',1342177281,'submission.event.fileUploaded',0),(236,1048585,10,27,'2022-10-26 07:42:30',1342177288,'submission.event.fileRevised',0),(237,515,52,27,'2022-10-26 07:42:32',1342177296,'submission.event.fileEdited',0),(238,1048585,10,27,'2022-10-26 07:42:32',1342177296,'submission.event.fileEdited',0),(239,1048585,10,27,'2022-10-26 07:43:14',268435458,'submission.event.general.metadataUpdated',0),(240,1048585,10,27,'2022-10-26 07:43:16',268435457,'submission.event.submissionSubmitted',0),(241,1048585,11,28,'2022-10-26 07:43:26',268435458,'submission.event.general.metadataUpdated',0),(242,1048585,11,28,'2022-10-26 07:43:26',268435458,'submission.event.general.metadataUpdated',0),(243,515,53,28,'2022-10-26 07:43:28',1342177281,'submission.event.fileUploaded',0),(244,1048585,11,28,'2022-10-26 07:43:28',1342177288,'submission.event.fileRevised',0),(245,515,53,28,'2022-10-26 07:43:29',1342177296,'submission.event.fileEdited',0),(246,1048585,11,28,'2022-10-26 07:43:29',1342177296,'submission.event.fileEdited',0),(247,1048585,11,28,'2022-10-26 07:43:39',268435458,'submission.event.general.metadataUpdated',0),(248,1048585,11,28,'2022-10-26 07:43:40',268435457,'submission.event.submissionSubmitted',0),(249,1048585,11,3,'2022-10-26 07:43:53',805306371,'editor.submission.decision.sendInternalReview.log',0),(250,515,54,3,'2022-10-26 07:43:53',1342177281,'submission.event.fileUploaded',0),(251,1048585,11,3,'2022-10-26 07:43:54',1342177288,'submission.event.fileRevised',0),(252,1048585,11,3,'2022-10-26 07:44:03',1073741825,'log.review.reviewerAssigned',0),(253,1048585,11,3,'2022-10-26 07:44:07',805306371,'editor.submission.decision.sendExternalReview.log',0),(254,1048585,11,3,'2022-10-26 07:44:17',1073741825,'log.review.reviewerAssigned',0),(255,1048585,11,3,'2022-10-26 07:44:25',1073741825,'log.review.reviewerAssigned',0),(256,1048585,11,10,'2022-10-26 07:44:32',1073741830,'log.review.reviewAccepted',0),(257,1048585,11,10,'2022-10-26 07:44:36',1073741848,'log.review.reviewReady',0),(258,1048585,11,12,'2022-10-26 07:44:43',1073741830,'log.review.reviewAccepted',0),(259,1048585,11,12,'2022-10-26 07:44:47',1073741848,'log.review.reviewReady',0),(260,1048585,11,3,'2022-10-26 07:45:06',805306371,'editor.submission.decision.accept.log',0),(261,1048585,11,3,'2022-10-26 07:45:06',1073741856,'submission.event.decisionReviewerEmailSent',0),(262,1048585,12,29,'2022-10-26 07:45:20',268435458,'submission.event.general.metadataUpdated',0),(263,1048585,12,29,'2022-10-26 07:45:20',268435458,'submission.event.general.metadataUpdated',0),(264,515,55,29,'2022-10-26 07:45:22',1342177281,'submission.event.fileUploaded',0),(265,1048585,12,29,'2022-10-26 07:45:22',1342177288,'submission.event.fileRevised',0),(266,515,55,29,'2022-10-26 07:45:24',1342177296,'submission.event.fileEdited',0),(267,1048585,12,29,'2022-10-26 07:45:24',1342177296,'submission.event.fileEdited',0),(268,515,56,29,'2022-10-26 07:45:24',1342177281,'submission.event.fileUploaded',0),(269,1048585,12,29,'2022-10-26 07:45:24',1342177288,'submission.event.fileRevised',0),(270,515,56,29,'2022-10-26 07:45:25',1342177296,'submission.event.fileEdited',0),(271,1048585,12,29,'2022-10-26 07:45:25',1342177296,'submission.event.fileEdited',0),(272,515,57,29,'2022-10-26 07:45:25',1342177281,'submission.event.fileUploaded',0),(273,1048585,12,29,'2022-10-26 07:45:25',1342177288,'submission.event.fileRevised',0),(274,515,57,29,'2022-10-26 07:45:27',1342177296,'submission.event.fileEdited',0),(275,1048585,12,29,'2022-10-26 07:45:27',1342177296,'submission.event.fileEdited',0),(276,1048585,12,29,'2022-10-26 07:46:21',268435458,'submission.event.general.metadataUpdated',0),(277,1048585,12,29,'2022-10-26 07:46:23',268435457,'submission.event.submissionSubmitted',0),(278,1048585,12,3,'2022-10-26 07:46:41',805306371,'editor.submission.decision.sendInternalReview.log',0),(279,515,58,3,'2022-10-26 07:46:41',1342177281,'submission.event.fileUploaded',0),(280,1048585,12,3,'2022-10-26 07:46:41',1342177288,'submission.event.fileRevised',0),(281,515,59,3,'2022-10-26 07:46:41',1342177281,'submission.event.fileUploaded',0),(282,1048585,12,3,'2022-10-26 07:46:41',1342177288,'submission.event.fileRevised',0),(283,515,60,3,'2022-10-26 07:46:41',1342177281,'submission.event.fileUploaded',0),(284,1048585,12,3,'2022-10-26 07:46:41',1342177288,'submission.event.fileRevised',0),(285,1048585,12,3,'2022-10-26 07:46:52',1073741825,'log.review.reviewerAssigned',0),(286,1048585,12,3,'2022-10-26 07:47:01',1073741825,'log.review.reviewerAssigned',0),(287,1048585,12,3,'2022-10-26 07:47:09',1073741825,'log.review.reviewerAssigned',0),(288,1048585,12,8,'2022-10-26 07:47:18',1073741830,'log.review.reviewAccepted',0),(289,1048585,12,8,'2022-10-26 07:47:22',1073741848,'log.review.reviewReady',0),(290,1048585,13,30,'2022-10-26 07:47:33',268435458,'submission.event.general.metadataUpdated',0),(291,1048585,13,30,'2022-10-26 07:47:33',268435458,'submission.event.general.metadataUpdated',0),(292,515,61,30,'2022-10-26 07:47:35',1342177281,'submission.event.fileUploaded',0),(293,1048585,13,30,'2022-10-26 07:47:35',1342177288,'submission.event.fileRevised',0),(294,515,61,30,'2022-10-26 07:47:36',1342177296,'submission.event.fileEdited',0),(295,1048585,13,30,'2022-10-26 07:47:36',1342177296,'submission.event.fileEdited',0),(296,515,62,30,'2022-10-26 07:47:37',1342177281,'submission.event.fileUploaded',0),(297,1048585,13,30,'2022-10-26 07:47:37',1342177288,'submission.event.fileRevised',0),(298,515,62,30,'2022-10-26 07:47:38',1342177296,'submission.event.fileEdited',0),(299,1048585,13,30,'2022-10-26 07:47:38',1342177296,'submission.event.fileEdited',0),(300,515,63,30,'2022-10-26 07:47:38',1342177281,'submission.event.fileUploaded',0),(301,1048585,13,30,'2022-10-26 07:47:38',1342177288,'submission.event.fileRevised',0),(302,515,63,30,'2022-10-26 07:47:40',1342177296,'submission.event.fileEdited',0),(303,1048585,13,30,'2022-10-26 07:47:40',1342177296,'submission.event.fileEdited',0),(304,1048585,13,30,'2022-10-26 07:48:15',268435458,'submission.event.general.metadataUpdated',0),(305,1048585,13,30,'2022-10-26 07:48:17',268435457,'submission.event.submissionSubmitted',0),(306,1048585,13,3,'2022-10-26 07:48:33',805306371,'editor.submission.decision.sendInternalReview.log',0),(307,515,64,3,'2022-10-26 07:48:33',1342177281,'submission.event.fileUploaded',0),(308,1048585,13,3,'2022-10-26 07:48:33',1342177288,'submission.event.fileRevised',0),(309,515,65,3,'2022-10-26 07:48:33',1342177281,'submission.event.fileUploaded',0),(310,1048585,13,3,'2022-10-26 07:48:33',1342177288,'submission.event.fileRevised',0),(311,515,66,3,'2022-10-26 07:48:33',1342177281,'submission.event.fileUploaded',0),(312,1048585,13,3,'2022-10-26 07:48:33',1342177288,'submission.event.fileRevised',0),(313,1048585,13,3,'2022-10-26 07:48:43',1073741825,'log.review.reviewerAssigned',0),(314,1048585,13,3,'2022-10-26 07:48:49',805306371,'editor.submission.decision.sendExternalReview.log',0),(315,1048585,13,3,'2022-10-26 07:48:59',1073741825,'log.review.reviewerAssigned',0),(316,1048585,13,3,'2022-10-26 07:49:08',1073741825,'log.review.reviewerAssigned',0),(317,1048585,13,3,'2022-10-26 07:49:16',1073741825,'log.review.reviewerAssigned',0),(318,1048585,13,10,'2022-10-26 07:49:24',1073741830,'log.review.reviewAccepted',0),(319,1048585,13,10,'2022-10-26 07:49:29',1073741848,'log.review.reviewReady',0),(320,1048585,13,12,'2022-10-26 07:49:37',1073741830,'log.review.reviewAccepted',0),(321,1048585,13,12,'2022-10-26 07:49:41',1073741848,'log.review.reviewReady',0),(322,1048585,13,3,'2022-10-26 07:50:03',805306371,'editor.submission.decision.accept.log',0),(323,1048585,13,3,'2022-10-26 07:50:04',1073741856,'submission.event.decisionReviewerEmailSent',0),(324,1048585,14,31,'2022-10-26 07:50:19',268435458,'submission.event.general.metadataUpdated',0),(325,1048585,14,31,'2022-10-26 07:50:20',268435458,'submission.event.general.metadataUpdated',0),(326,515,67,31,'2022-10-26 07:50:22',1342177281,'submission.event.fileUploaded',0),(327,1048585,14,31,'2022-10-26 07:50:22',1342177288,'submission.event.fileRevised',0),(328,515,67,31,'2022-10-26 07:50:23',1342177296,'submission.event.fileEdited',0),(329,1048585,14,31,'2022-10-26 07:50:23',1342177296,'submission.event.fileEdited',0),(330,515,68,31,'2022-10-26 07:50:23',1342177281,'submission.event.fileUploaded',0),(331,1048585,14,31,'2022-10-26 07:50:23',1342177288,'submission.event.fileRevised',0),(332,515,68,31,'2022-10-26 07:50:25',1342177296,'submission.event.fileEdited',0),(333,1048585,14,31,'2022-10-26 07:50:25',1342177296,'submission.event.fileEdited',0),(334,515,69,31,'2022-10-26 07:50:25',1342177281,'submission.event.fileUploaded',0),(335,1048585,14,31,'2022-10-26 07:50:25',1342177288,'submission.event.fileRevised',0),(336,515,69,31,'2022-10-26 07:50:26',1342177296,'submission.event.fileEdited',0),(337,1048585,14,31,'2022-10-26 07:50:26',1342177296,'submission.event.fileEdited',0),(338,515,70,31,'2022-10-26 07:50:26',1342177281,'submission.event.fileUploaded',0),(339,1048585,14,31,'2022-10-26 07:50:27',1342177288,'submission.event.fileRevised',0),(340,515,70,31,'2022-10-26 07:50:28',1342177296,'submission.event.fileEdited',0),(341,1048585,14,31,'2022-10-26 07:50:28',1342177296,'submission.event.fileEdited',0),(342,515,71,31,'2022-10-26 07:50:28',1342177281,'submission.event.fileUploaded',0),(343,1048585,14,31,'2022-10-26 07:50:28',1342177288,'submission.event.fileRevised',0),(344,515,71,31,'2022-10-26 07:50:30',1342177296,'submission.event.fileEdited',0),(345,1048585,14,31,'2022-10-26 07:50:30',1342177296,'submission.event.fileEdited',0),(346,515,72,31,'2022-10-26 07:50:30',1342177281,'submission.event.fileUploaded',0),(347,1048585,14,31,'2022-10-26 07:50:30',1342177288,'submission.event.fileRevised',0),(348,515,72,31,'2022-10-26 07:50:32',1342177296,'submission.event.fileEdited',0),(349,1048585,14,31,'2022-10-26 07:50:32',1342177296,'submission.event.fileEdited',0),(350,1048585,14,31,'2022-10-26 07:51:15',268435458,'submission.event.general.metadataUpdated',0),(351,1048585,14,31,'2022-10-26 07:51:17',268435457,'submission.event.submissionSubmitted',0),(352,1048585,14,3,'2022-10-26 07:51:35',805306371,'editor.submission.decision.sendInternalReview.log',0),(353,515,73,3,'2022-10-26 07:51:36',1342177281,'submission.event.fileUploaded',0),(354,1048585,14,3,'2022-10-26 07:51:36',1342177288,'submission.event.fileRevised',0),(355,515,74,3,'2022-10-26 07:51:36',1342177281,'submission.event.fileUploaded',0),(356,1048585,14,3,'2022-10-26 07:51:36',1342177288,'submission.event.fileRevised',0),(357,515,75,3,'2022-10-26 07:51:36',1342177281,'submission.event.fileUploaded',0),(358,1048585,14,3,'2022-10-26 07:51:36',1342177288,'submission.event.fileRevised',0),(359,515,76,3,'2022-10-26 07:51:36',1342177281,'submission.event.fileUploaded',0),(360,1048585,14,3,'2022-10-26 07:51:36',1342177288,'submission.event.fileRevised',0),(361,515,77,3,'2022-10-26 07:51:36',1342177281,'submission.event.fileUploaded',0),(362,1048585,14,3,'2022-10-26 07:51:36',1342177288,'submission.event.fileRevised',0),(363,515,78,3,'2022-10-26 07:51:36',1342177281,'submission.event.fileUploaded',0),(364,1048585,14,3,'2022-10-26 07:51:36',1342177288,'submission.event.fileRevised',0),(365,1048585,14,3,'2022-10-26 07:51:47',1073741825,'log.review.reviewerAssigned',0),(366,1048585,14,3,'2022-10-26 07:51:54',805306371,'editor.submission.decision.sendExternalReview.log',0),(367,1048585,14,3,'2022-10-26 07:52:06',1073741825,'log.review.reviewerAssigned',0),(368,1048585,14,3,'2022-10-26 07:52:13',805306371,'editor.submission.decision.accept.log',0),(369,1048585,14,3,'2022-10-26 07:52:24',268435459,'submission.event.participantAdded',0),(370,1048585,14,3,'2022-10-26 07:52:32',805306371,'editor.submission.decision.sendToProduction.log',0),(371,1048585,14,3,'2022-10-26 07:52:44',268435459,'submission.event.participantAdded',0),(372,1048585,14,3,'2022-10-26 07:52:51',268435459,'submission.event.participantAdded',0),(373,1048585,14,3,'2022-10-26 07:52:57',268435474,'submission.event.publicationFormatCreated',0),(374,515,79,3,'2022-10-26 07:53:07',1342177281,'submission.event.fileUploaded',0),(375,1048585,14,3,'2022-10-26 07:53:07',1342177288,'submission.event.fileRevised',0),(376,515,80,3,'2022-10-26 07:53:07',1342177281,'submission.event.fileUploaded',0),(377,1048585,14,3,'2022-10-26 07:53:07',1342177288,'submission.event.fileRevised',0),(378,515,81,3,'2022-10-26 07:53:07',1342177281,'submission.event.fileUploaded',0),(379,1048585,14,3,'2022-10-26 07:53:07',1342177288,'submission.event.fileRevised',0),(380,515,82,3,'2022-10-26 07:53:07',1342177281,'submission.event.fileUploaded',0),(381,1048585,14,3,'2022-10-26 07:53:07',1342177288,'submission.event.fileRevised',0),(382,515,83,3,'2022-10-26 07:53:07',1342177281,'submission.event.fileUploaded',0),(383,1048585,14,3,'2022-10-26 07:53:07',1342177288,'submission.event.fileRevised',0),(384,515,84,3,'2022-10-26 07:53:07',1342177281,'submission.event.fileUploaded',0),(385,1048585,14,3,'2022-10-26 07:53:07',1342177288,'submission.event.fileRevised',0),(386,1048585,14,3,'2022-10-26 07:53:09',268435464,'submission.event.publicationFormatPublished',0),(387,1048585,14,3,'2022-10-26 07:53:11',268435476,'submission.event.publicationFormatMadeAvailable',0),(388,515,84,3,'2022-10-26 07:53:14',1342177296,'submission.event.fileEdited',0),(389,1048585,14,3,'2022-10-26 07:53:14',1342177296,'submission.event.fileEdited',0),(390,515,84,3,'2022-10-26 07:53:14',1342177287,'submission.event.signoffSignoff',0),(391,515,84,3,'2022-10-26 07:53:18',1342177296,'submission.event.fileEdited',0),(392,1048585,14,3,'2022-10-26 07:53:18',1342177296,'submission.event.fileEdited',0),(393,515,83,3,'2022-10-26 07:53:20',1342177296,'submission.event.fileEdited',0),(394,1048585,14,3,'2022-10-26 07:53:20',1342177296,'submission.event.fileEdited',0),(395,515,83,3,'2022-10-26 07:53:20',1342177287,'submission.event.signoffSignoff',0),(396,515,83,3,'2022-10-26 07:53:23',1342177296,'submission.event.fileEdited',0),(397,1048585,14,3,'2022-10-26 07:53:23',1342177296,'submission.event.fileEdited',0),(398,515,82,3,'2022-10-26 07:53:26',1342177296,'submission.event.fileEdited',0),(399,1048585,14,3,'2022-10-26 07:53:26',1342177296,'submission.event.fileEdited',0),(400,515,82,3,'2022-10-26 07:53:26',1342177287,'submission.event.signoffSignoff',0),(401,515,82,3,'2022-10-26 07:53:30',1342177296,'submission.event.fileEdited',0),(402,1048585,14,3,'2022-10-26 07:53:30',1342177296,'submission.event.fileEdited',0),(403,515,81,3,'2022-10-26 07:53:32',1342177296,'submission.event.fileEdited',0),(404,1048585,14,3,'2022-10-26 07:53:32',1342177296,'submission.event.fileEdited',0),(405,515,81,3,'2022-10-26 07:53:32',1342177287,'submission.event.signoffSignoff',0),(406,515,81,3,'2022-10-26 07:53:37',1342177296,'submission.event.fileEdited',0),(407,1048585,14,3,'2022-10-26 07:53:37',1342177296,'submission.event.fileEdited',0),(408,515,80,3,'2022-10-26 07:53:39',1342177296,'submission.event.fileEdited',0),(409,1048585,14,3,'2022-10-26 07:53:39',1342177296,'submission.event.fileEdited',0),(410,515,80,3,'2022-10-26 07:53:39',1342177287,'submission.event.signoffSignoff',0),(411,515,80,3,'2022-10-26 07:53:43',1342177296,'submission.event.fileEdited',0),(412,1048585,14,3,'2022-10-26 07:53:43',1342177296,'submission.event.fileEdited',0),(413,515,79,3,'2022-10-26 07:53:46',1342177296,'submission.event.fileEdited',0),(414,1048585,14,3,'2022-10-26 07:53:46',1342177296,'submission.event.fileEdited',0),(415,515,79,3,'2022-10-26 07:53:46',1342177287,'submission.event.signoffSignoff',0),(416,515,79,3,'2022-10-26 07:53:50',1342177296,'submission.event.fileEdited',0),(417,1048585,14,3,'2022-10-26 07:53:50',1342177296,'submission.event.fileEdited',0),(418,1048585,14,3,'2022-10-26 07:53:53',268435462,'publication.event.published',0),(419,1048585,15,32,'2022-10-26 07:54:04',268435458,'submission.event.general.metadataUpdated',0),(420,1048585,15,32,'2022-10-26 07:54:04',268435458,'submission.event.general.metadataUpdated',0),(421,515,85,32,'2022-10-26 07:54:05',1342177281,'submission.event.fileUploaded',0),(422,1048585,15,32,'2022-10-26 07:54:05',1342177288,'submission.event.fileRevised',0),(423,515,85,32,'2022-10-26 07:54:07',1342177296,'submission.event.fileEdited',0),(424,1048585,15,32,'2022-10-26 07:54:07',1342177296,'submission.event.fileEdited',0),(425,1048585,15,32,'2022-10-26 07:54:21',268435458,'submission.event.general.metadataUpdated',0),(426,1048585,15,32,'2022-10-26 07:54:23',268435457,'submission.event.submissionSubmitted',0),(427,1048585,15,3,'2022-10-26 07:54:37',805306371,'editor.submission.decision.sendExternalReview.log',0),(428,515,86,3,'2022-10-26 07:54:37',1342177281,'submission.event.fileUploaded',0),(429,1048585,15,3,'2022-10-26 07:54:37',1342177288,'submission.event.fileRevised',0),(430,1048585,16,33,'2022-10-26 07:54:49',268435458,'submission.event.general.metadataUpdated',0),(431,1048585,16,33,'2022-10-26 07:54:49',268435458,'submission.event.general.metadataUpdated',0),(432,515,87,33,'2022-10-26 07:54:51',1342177281,'submission.event.fileUploaded',0),(433,1048585,16,33,'2022-10-26 07:54:51',1342177288,'submission.event.fileRevised',0),(434,515,87,33,'2022-10-26 07:54:53',1342177296,'submission.event.fileEdited',0),(435,1048585,16,33,'2022-10-26 07:54:53',1342177296,'submission.event.fileEdited',0),(436,1048585,16,33,'2022-10-26 07:55:15',268435458,'submission.event.general.metadataUpdated',0),(437,1048585,16,33,'2022-10-26 07:55:16',268435457,'submission.event.submissionSubmitted',0),(438,1048585,16,3,'2022-10-26 07:55:33',805306371,'editor.submission.decision.sendExternalReview.log',0),(439,515,88,3,'2022-10-26 07:55:33',1342177281,'submission.event.fileUploaded',0),(440,1048585,16,3,'2022-10-26 07:55:33',1342177288,'submission.event.fileRevised',0),(441,1048585,16,3,'2022-10-26 07:55:43',1073741825,'log.review.reviewerAssigned',0),(442,1048585,16,3,'2022-10-26 07:55:50',1073741825,'log.review.reviewerAssigned',0),(443,1048585,16,3,'2022-10-26 07:55:58',1073741825,'log.review.reviewerAssigned',0),(444,1048585,16,10,'2022-10-26 07:56:06',1073741830,'log.review.reviewAccepted',0),(445,1048585,16,10,'2022-10-26 07:56:10',1073741848,'log.review.reviewReady',0),(446,1048585,17,34,'2022-10-26 07:56:20',268435458,'submission.event.general.metadataUpdated',0),(447,1048585,17,34,'2022-10-26 07:56:20',268435458,'submission.event.general.metadataUpdated',0),(448,515,89,34,'2022-10-26 07:56:22',1342177281,'submission.event.fileUploaded',0),(449,1048585,17,34,'2022-10-26 07:56:22',1342177288,'submission.event.fileRevised',0),(450,515,89,34,'2022-10-26 07:56:24',1342177296,'submission.event.fileEdited',0),(451,1048585,17,34,'2022-10-26 07:56:24',1342177296,'submission.event.fileEdited',0),(452,515,90,34,'2022-10-26 07:56:24',1342177281,'submission.event.fileUploaded',0),(453,1048585,17,34,'2022-10-26 07:56:24',1342177288,'submission.event.fileRevised',0),(454,515,90,34,'2022-10-26 07:56:25',1342177296,'submission.event.fileEdited',0),(455,1048585,17,34,'2022-10-26 07:56:25',1342177296,'submission.event.fileEdited',0),(456,515,91,34,'2022-10-26 07:56:26',1342177281,'submission.event.fileUploaded',0),(457,1048585,17,34,'2022-10-26 07:56:26',1342177288,'submission.event.fileRevised',0),(458,515,91,34,'2022-10-26 07:56:27',1342177296,'submission.event.fileEdited',0),(459,1048585,17,34,'2022-10-26 07:56:27',1342177296,'submission.event.fileEdited',0),(460,515,92,34,'2022-10-26 07:56:27',1342177281,'submission.event.fileUploaded',0),(461,1048585,17,34,'2022-10-26 07:56:27',1342177288,'submission.event.fileRevised',0),(462,515,92,34,'2022-10-26 07:56:29',1342177296,'submission.event.fileEdited',0),(463,1048585,17,34,'2022-10-26 07:56:29',1342177296,'submission.event.fileEdited',0),(464,515,93,34,'2022-10-26 07:56:29',1342177281,'submission.event.fileUploaded',0),(465,1048585,17,34,'2022-10-26 07:56:29',1342177288,'submission.event.fileRevised',0),(466,515,93,34,'2022-10-26 07:56:30',1342177296,'submission.event.fileEdited',0),(467,1048585,17,34,'2022-10-26 07:56:30',1342177296,'submission.event.fileEdited',0),(468,515,94,34,'2022-10-26 07:56:31',1342177281,'submission.event.fileUploaded',0),(469,1048585,17,34,'2022-10-26 07:56:31',1342177288,'submission.event.fileRevised',0),(470,515,94,34,'2022-10-26 07:56:32',1342177296,'submission.event.fileEdited',0),(471,1048585,17,34,'2022-10-26 07:56:32',1342177296,'submission.event.fileEdited',0),(472,1048585,17,34,'2022-10-26 07:58:02',268435458,'submission.event.general.metadataUpdated',0),(473,1048585,17,34,'2022-10-26 07:58:05',268435457,'submission.event.submissionSubmitted',0),(474,1048585,17,3,'2022-10-26 07:58:27',805306371,'editor.submission.decision.sendInternalReview.log',0),(475,515,95,3,'2022-10-26 07:58:29',1342177281,'submission.event.fileUploaded',0),(476,1048585,17,3,'2022-10-26 07:58:29',1342177288,'submission.event.fileRevised',0),(477,515,96,3,'2022-10-26 07:58:29',1342177281,'submission.event.fileUploaded',0),(478,1048585,17,3,'2022-10-26 07:58:29',1342177288,'submission.event.fileRevised',0),(479,515,97,3,'2022-10-26 07:58:29',1342177281,'submission.event.fileUploaded',0),(480,1048585,17,3,'2022-10-26 07:58:29',1342177288,'submission.event.fileRevised',0),(481,515,98,3,'2022-10-26 07:58:29',1342177281,'submission.event.fileUploaded',0),(482,1048585,17,3,'2022-10-26 07:58:29',1342177288,'submission.event.fileRevised',0),(483,515,99,3,'2022-10-26 07:58:29',1342177281,'submission.event.fileUploaded',0),(484,1048585,17,3,'2022-10-26 07:58:29',1342177288,'submission.event.fileRevised',0),(485,515,100,3,'2022-10-26 07:58:29',1342177281,'submission.event.fileUploaded',0),(486,1048585,17,3,'2022-10-26 07:58:29',1342177288,'submission.event.fileRevised',0),(487,1048585,17,3,'2022-10-26 07:58:41',1073741825,'log.review.reviewerAssigned',0),(488,1048585,17,3,'2022-10-26 07:58:51',1073741825,'log.review.reviewerAssigned',0);
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
INSERT INTO `event_log_settings` VALUES (3,'fileId','1','int'),(3,'fileStage','2','int'),(3,'originalFileName','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(3,'sourceSubmissionFileId',NULL,'string'),(3,'submissionFileId','1','int'),(3,'submissionId','1','int'),(3,'username','aclark','string'),(4,'fileId','1','int'),(4,'fileStage','2','int'),(4,'name','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(4,'submissionFileId','1','int'),(4,'submissionId','1','int'),(4,'username','aclark','string'),(5,'fileId','1','int'),(5,'fileStage','2','int'),(5,'originalFileName','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(5,'sourceSubmissionFileId',NULL,'string'),(5,'submissionFileId','1','int'),(5,'submissionId','1','int'),(5,'username','aclark','string'),(6,'fileId','1','int'),(6,'fileStage','2','int'),(6,'name','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(6,'originalFileName','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(6,'sourceSubmissionFileId',NULL,'string'),(6,'submissionFileId','1','int'),(6,'submissionId','1','int'),(6,'username','aclark','string'),(9,'decision','18','int'),(9,'editorId','3','int'),(9,'editorName','Daniel Barnes','string'),(9,'submissionId','1','int'),(10,'fileId','1','int'),(10,'fileStage','4','int'),(10,'originalFileName','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(10,'sourceSubmissionFileId','1','int'),(10,'submissionFileId','2','int'),(10,'submissionId','1','int'),(10,'username','dbarnes','string'),(11,'fileId','1','int'),(11,'fileStage','4','int'),(11,'name','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(11,'submissionFileId','2','int'),(11,'submissionId','1','int'),(11,'username','dbarnes','string'),(12,'reviewAssignmentId','1','int'),(12,'reviewerName','Gonzalo Favio','string'),(12,'round','1','int'),(12,'stageId','3','int'),(12,'submissionId','1','int'),(13,'decision','2','int'),(13,'editorId','3','int'),(13,'editorName','Daniel Barnes','string'),(13,'submissionId','1','int'),(14,'name','Sarah Vogt','string'),(14,'userGroupName','Copyeditor','string'),(14,'username','svogt','string'),(17,'fileId','2','int'),(17,'fileStage','2','int'),(17,'originalFileName','Critical History in Western Canada 1900–.pdf','string'),(17,'sourceSubmissionFileId',NULL,'string'),(17,'submissionFileId','3','int'),(17,'submissionId','2','int'),(17,'username','afinkel','string'),(18,'fileId','2','int'),(18,'fileStage','2','int'),(18,'name','Critical History in Western Canada 1900–.pdf','string'),(18,'submissionFileId','3','int'),(18,'submissionId','2','int'),(18,'username','afinkel','string'),(19,'fileId','2','int'),(19,'fileStage','2','int'),(19,'originalFileName','Critical History in Western Canada 1900–.pdf','string'),(19,'sourceSubmissionFileId',NULL,'string'),(19,'submissionFileId','3','int'),(19,'submissionId','2','int'),(19,'username','afinkel','string'),(20,'fileId','2','int'),(20,'fileStage','2','int'),(20,'name','Critical History in Western Canada 1900–.pdf','string'),(20,'originalFileName','Critical History in Western Canada 1900–.pdf','string'),(20,'sourceSubmissionFileId',NULL,'string'),(20,'submissionFileId','3','int'),(20,'submissionId','2','int'),(20,'username','afinkel','string'),(21,'fileId','3','int'),(21,'fileStage','2','int'),(21,'originalFileName','Vernacular Currents in Western Canadian .pdf','string'),(21,'sourceSubmissionFileId',NULL,'string'),(21,'submissionFileId','4','int'),(21,'submissionId','2','int'),(21,'username','afinkel','string'),(22,'fileId','3','int'),(22,'fileStage','2','int'),(22,'name','Vernacular Currents in Western Canadian .pdf','string'),(22,'submissionFileId','4','int'),(22,'submissionId','2','int'),(22,'username','afinkel','string'),(23,'fileId','3','int'),(23,'fileStage','2','int'),(23,'originalFileName','Vernacular Currents in Western Canadian .pdf','string'),(23,'sourceSubmissionFileId',NULL,'string'),(23,'submissionFileId','4','int'),(23,'submissionId','2','int'),(23,'username','afinkel','string'),(24,'fileId','3','int'),(24,'fileStage','2','int'),(24,'name','Vernacular Currents in Western Canadian .pdf','string'),(24,'originalFileName','Vernacular Currents in Western Canadian .pdf','string'),(24,'sourceSubmissionFileId',NULL,'string'),(24,'submissionFileId','4','int'),(24,'submissionId','2','int'),(24,'username','afinkel','string'),(25,'fileId','4','int'),(25,'fileStage','2','int'),(25,'originalFileName','Cree Intellectual Traditions in History.pdf','string'),(25,'sourceSubmissionFileId',NULL,'string'),(25,'submissionFileId','5','int'),(25,'submissionId','2','int'),(25,'username','afinkel','string'),(26,'fileId','4','int'),(26,'fileStage','2','int'),(26,'name','Cree Intellectual Traditions in History.pdf','string'),(26,'submissionFileId','5','int'),(26,'submissionId','2','int'),(26,'username','afinkel','string'),(27,'fileId','4','int'),(27,'fileStage','2','int'),(27,'originalFileName','Cree Intellectual Traditions in History.pdf','string'),(27,'sourceSubmissionFileId',NULL,'string'),(27,'submissionFileId','5','int'),(27,'submissionId','2','int'),(27,'username','afinkel','string'),(28,'fileId','4','int'),(28,'fileStage','2','int'),(28,'name','Cree Intellectual Traditions in History.pdf','string'),(28,'originalFileName','Cree Intellectual Traditions in History.pdf','string'),(28,'sourceSubmissionFileId',NULL,'string'),(28,'submissionFileId','5','int'),(28,'submissionId','2','int'),(28,'username','afinkel','string'),(29,'fileId','5','int'),(29,'fileStage','2','int'),(29,'originalFileName','Visualizing Space, Race, and History in .pdf','string'),(29,'sourceSubmissionFileId',NULL,'string'),(29,'submissionFileId','6','int'),(29,'submissionId','2','int'),(29,'username','afinkel','string'),(30,'fileId','5','int'),(30,'fileStage','2','int'),(30,'name','Visualizing Space, Race, and History in .pdf','string'),(30,'submissionFileId','6','int'),(30,'submissionId','2','int'),(30,'username','afinkel','string'),(31,'fileId','5','int'),(31,'fileStage','2','int'),(31,'originalFileName','Visualizing Space, Race, and History in .pdf','string'),(31,'sourceSubmissionFileId',NULL,'string'),(31,'submissionFileId','6','int'),(31,'submissionId','2','int'),(31,'username','afinkel','string'),(32,'fileId','5','int'),(32,'fileStage','2','int'),(32,'name','Visualizing Space, Race, and History in .pdf','string'),(32,'originalFileName','Visualizing Space, Race, and History in .pdf','string'),(32,'sourceSubmissionFileId',NULL,'string'),(32,'submissionFileId','6','int'),(32,'submissionId','2','int'),(32,'username','afinkel','string'),(35,'decision','18','int'),(35,'editorId','3','int'),(35,'editorName','Daniel Barnes','string'),(35,'submissionId','2','int'),(36,'fileId','5','int'),(36,'fileStage','4','int'),(36,'originalFileName','Visualizing Space, Race, and History in .pdf','string'),(36,'sourceSubmissionFileId','6','int'),(36,'submissionFileId','7','int'),(36,'submissionId','2','int'),(36,'username','dbarnes','string'),(37,'fileId','5','int'),(37,'fileStage','4','int'),(37,'name','Visualizing Space, Race, and History in .pdf','string'),(37,'submissionFileId','7','int'),(37,'submissionId','2','int'),(37,'username','dbarnes','string'),(38,'fileId','4','int'),(38,'fileStage','4','int'),(38,'originalFileName','Cree Intellectual Traditions in History.pdf','string'),(38,'sourceSubmissionFileId','5','int'),(38,'submissionFileId','8','int'),(38,'submissionId','2','int'),(38,'username','dbarnes','string'),(39,'fileId','4','int'),(39,'fileStage','4','int'),(39,'name','Cree Intellectual Traditions in History.pdf','string'),(39,'submissionFileId','8','int'),(39,'submissionId','2','int'),(39,'username','dbarnes','string'),(40,'fileId','3','int'),(40,'fileStage','4','int'),(40,'originalFileName','Vernacular Currents in Western Canadian .pdf','string'),(40,'sourceSubmissionFileId','4','int'),(40,'submissionFileId','9','int'),(40,'submissionId','2','int'),(40,'username','dbarnes','string'),(41,'fileId','3','int'),(41,'fileStage','4','int'),(41,'name','Vernacular Currents in Western Canadian .pdf','string'),(41,'submissionFileId','9','int'),(41,'submissionId','2','int'),(41,'username','dbarnes','string'),(42,'fileId','2','int'),(42,'fileStage','4','int'),(42,'originalFileName','Critical History in Western Canada 1900–.pdf','string'),(42,'sourceSubmissionFileId','3','int'),(42,'submissionFileId','10','int'),(42,'submissionId','2','int'),(42,'username','dbarnes','string'),(43,'fileId','2','int'),(43,'fileStage','4','int'),(43,'name','Critical History in Western Canada 1900–.pdf','string'),(43,'submissionFileId','10','int'),(43,'submissionId','2','int'),(43,'username','dbarnes','string'),(44,'reviewAssignmentId','2','int'),(44,'reviewerName','Al Zacharia','string'),(44,'round','1','int'),(44,'stageId','3','int'),(44,'submissionId','2','int'),(45,'reviewAssignmentId','3','int'),(45,'reviewerName','Gonzalo Favio','string'),(45,'round','1','int'),(45,'stageId','3','int'),(45,'submissionId','2','int'),(48,'fileId','6','int'),(48,'fileStage','2','int'),(48,'originalFileName','The Political Economy of Workplace Injury in Canada.pdf','string'),(48,'sourceSubmissionFileId',NULL,'string'),(48,'submissionFileId','11','int'),(48,'submissionId','3','int'),(48,'username','bbarnetson','string'),(49,'fileId','6','int'),(49,'fileStage','2','int'),(49,'name','The Political Economy of Workplace Injury in Canada.pdf','string'),(49,'submissionFileId','11','int'),(49,'submissionId','3','int'),(49,'username','bbarnetson','string'),(50,'fileId','6','int'),(50,'fileStage','2','int'),(50,'originalFileName','The Political Economy of Workplace Injury in Canada.pdf','string'),(50,'sourceSubmissionFileId',NULL,'string'),(50,'submissionFileId','11','int'),(50,'submissionId','3','int'),(50,'username','bbarnetson','string'),(51,'fileId','6','int'),(51,'fileStage','2','int'),(51,'name','The Political Economy of Workplace Injury in Canada.pdf','string'),(51,'originalFileName','The Political Economy of Workplace Injury in Canada.pdf','string'),(51,'sourceSubmissionFileId',NULL,'string'),(51,'submissionFileId','11','int'),(51,'submissionId','3','int'),(51,'username','bbarnetson','string'),(56,'fileId','7','int'),(56,'fileStage','2','int'),(56,'originalFileName','Introduction: Contexts of Popular Cultur.pdf','string'),(56,'sourceSubmissionFileId',NULL,'string'),(56,'submissionFileId','12','int'),(56,'submissionId','4','int'),(56,'username','bbeaty','string'),(57,'fileId','7','int'),(57,'fileStage','2','int'),(57,'name','Introduction: Contexts of Popular Cultur.pdf','string'),(57,'submissionFileId','12','int'),(57,'submissionId','4','int'),(57,'username','bbeaty','string'),(58,'fileId','7','int'),(58,'fileStage','2','int'),(58,'originalFileName','Introduction: Contexts of Popular Cultur.pdf','string'),(58,'sourceSubmissionFileId',NULL,'string'),(58,'submissionFileId','12','int'),(58,'submissionId','4','int'),(58,'username','bbeaty','string'),(59,'fileId','7','int'),(59,'fileStage','2','int'),(59,'name','Introduction: Contexts of Popular Cultur.pdf','string'),(59,'originalFileName','Introduction: Contexts of Popular Cultur.pdf','string'),(59,'sourceSubmissionFileId',NULL,'string'),(59,'submissionFileId','12','int'),(59,'submissionId','4','int'),(59,'username','bbeaty','string'),(60,'fileId','8','int'),(60,'fileStage','2','int'),(60,'originalFileName','Chapter 1. A Future for Media Studies: C.pdf','string'),(60,'sourceSubmissionFileId',NULL,'string'),(60,'submissionFileId','13','int'),(60,'submissionId','4','int'),(60,'username','bbeaty','string'),(61,'fileId','8','int'),(61,'fileStage','2','int'),(61,'name','Chapter 1. A Future for Media Studies: C.pdf','string'),(61,'submissionFileId','13','int'),(61,'submissionId','4','int'),(61,'username','bbeaty','string'),(62,'fileId','8','int'),(62,'fileStage','2','int'),(62,'originalFileName','Chapter 1. A Future for Media Studies: C.pdf','string'),(62,'sourceSubmissionFileId',NULL,'string'),(62,'submissionFileId','13','int'),(62,'submissionId','4','int'),(62,'username','bbeaty','string'),(63,'fileId','8','int'),(63,'fileStage','2','int'),(63,'name','Chapter 1. A Future for Media Studies: C.pdf','string'),(63,'originalFileName','Chapter 1. A Future for Media Studies: C.pdf','string'),(63,'sourceSubmissionFileId',NULL,'string'),(63,'submissionFileId','13','int'),(63,'submissionId','4','int'),(63,'username','bbeaty','string'),(64,'fileId','9','int'),(64,'fileStage','2','int'),(64,'originalFileName','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(64,'sourceSubmissionFileId',NULL,'string'),(64,'submissionFileId','14','int'),(64,'submissionId','4','int'),(64,'username','bbeaty','string'),(65,'fileId','9','int'),(65,'fileStage','2','int'),(65,'name','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(65,'submissionFileId','14','int'),(65,'submissionId','4','int'),(65,'username','bbeaty','string'),(66,'fileId','9','int'),(66,'fileStage','2','int'),(66,'originalFileName','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(66,'sourceSubmissionFileId',NULL,'string'),(66,'submissionFileId','14','int'),(66,'submissionId','4','int'),(66,'username','bbeaty','string'),(67,'fileId','9','int'),(67,'fileStage','2','int'),(67,'name','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(67,'originalFileName','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(67,'sourceSubmissionFileId',NULL,'string'),(67,'submissionFileId','14','int'),(67,'submissionId','4','int'),(67,'username','bbeaty','string'),(68,'fileId','10','int'),(68,'fileStage','2','int'),(68,'originalFileName','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(68,'sourceSubmissionFileId',NULL,'string'),(68,'submissionFileId','15','int'),(68,'submissionId','4','int'),(68,'username','bbeaty','string'),(69,'fileId','10','int'),(69,'fileStage','2','int'),(69,'name','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(69,'submissionFileId','15','int'),(69,'submissionId','4','int'),(69,'username','bbeaty','string'),(70,'fileId','10','int'),(70,'fileStage','2','int'),(70,'originalFileName','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(70,'sourceSubmissionFileId',NULL,'string'),(70,'submissionFileId','15','int'),(70,'submissionId','4','int'),(70,'username','bbeaty','string'),(71,'fileId','10','int'),(71,'fileStage','2','int'),(71,'name','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(71,'originalFileName','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(71,'sourceSubmissionFileId',NULL,'string'),(71,'submissionFileId','15','int'),(71,'submissionId','4','int'),(71,'username','bbeaty','string'),(74,'decision','1','int'),(74,'editorId','3','int'),(74,'editorName','Daniel Barnes','string'),(74,'submissionId','4','int'),(75,'fileId','10','int'),(75,'fileStage','19','int'),(75,'originalFileName','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(75,'sourceSubmissionFileId','15','int'),(75,'submissionFileId','16','int'),(75,'submissionId','4','int'),(75,'username','dbarnes','string'),(76,'fileId','10','int'),(76,'fileStage','19','int'),(76,'name','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(76,'submissionFileId','16','int'),(76,'submissionId','4','int'),(76,'username','dbarnes','string'),(77,'fileId','9','int'),(77,'fileStage','19','int'),(77,'originalFileName','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(77,'sourceSubmissionFileId','14','int'),(77,'submissionFileId','17','int'),(77,'submissionId','4','int'),(77,'username','dbarnes','string'),(78,'fileId','9','int'),(78,'fileStage','19','int'),(78,'name','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(78,'submissionFileId','17','int'),(78,'submissionId','4','int'),(78,'username','dbarnes','string'),(79,'fileId','8','int'),(79,'fileStage','19','int'),(79,'originalFileName','Chapter 1. A Future for Media Studies: C.pdf','string'),(79,'sourceSubmissionFileId','13','int'),(79,'submissionFileId','18','int'),(79,'submissionId','4','int'),(79,'username','dbarnes','string'),(80,'fileId','8','int'),(80,'fileStage','19','int'),(80,'name','Chapter 1. A Future for Media Studies: C.pdf','string'),(80,'submissionFileId','18','int'),(80,'submissionId','4','int'),(80,'username','dbarnes','string'),(81,'fileId','7','int'),(81,'fileStage','19','int'),(81,'originalFileName','Introduction: Contexts of Popular Cultur.pdf','string'),(81,'sourceSubmissionFileId','12','int'),(81,'submissionFileId','19','int'),(81,'submissionId','4','int'),(81,'username','dbarnes','string'),(82,'fileId','7','int'),(82,'fileStage','19','int'),(82,'name','Introduction: Contexts of Popular Cultur.pdf','string'),(82,'submissionFileId','19','int'),(82,'submissionId','4','int'),(82,'username','dbarnes','string'),(83,'reviewAssignmentId','4','int'),(83,'reviewerName','Aisla McCrae','string'),(83,'round','1','int'),(83,'stageId','2','int'),(83,'submissionId','4','int'),(84,'decision','3','int'),(84,'editorId','3','int'),(84,'editorName','Daniel Barnes','string'),(84,'submissionId','4','int'),(85,'reviewAssignmentId','5','int'),(85,'reviewerName','Al Zacharia','string'),(85,'round','1','int'),(85,'stageId','3','int'),(85,'submissionId','4','int'),(86,'decision','2','int'),(86,'editorId','3','int'),(86,'editorName','Daniel Barnes','string'),(86,'submissionId','4','int'),(87,'name','Maria Fritz','string'),(87,'userGroupName','Copyeditor','string'),(87,'username','mfritz','string'),(88,'decision','7','int'),(88,'editorId','3','int'),(88,'editorName','Daniel Barnes','string'),(88,'submissionId','4','int'),(89,'name','Graham Cox','string'),(89,'userGroupName','Layout Editor','string'),(89,'username','gcox','string'),(90,'formatName','PDF','string'),(93,'fileId','11','int'),(93,'fileStage','2','int'),(93,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(93,'sourceSubmissionFileId',NULL,'string'),(93,'submissionFileId','20','int'),(93,'submissionId','5','int'),(93,'username','callan','string'),(94,'fileId','11','int'),(94,'fileStage','2','int'),(94,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(94,'submissionFileId','20','int'),(94,'submissionId','5','int'),(94,'username','callan','string'),(95,'fileId','11','int'),(95,'fileStage','2','int'),(95,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(95,'sourceSubmissionFileId',NULL,'string'),(95,'submissionFileId','20','int'),(95,'submissionId','5','int'),(95,'username','callan','string'),(96,'fileId','11','int'),(96,'fileStage','2','int'),(96,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(96,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(96,'sourceSubmissionFileId',NULL,'string'),(96,'submissionFileId','20','int'),(96,'submissionId','5','int'),(96,'username','callan','string'),(99,'decision','1','int'),(99,'editorId','3','int'),(99,'editorName','Daniel Barnes','string'),(99,'submissionId','5','int'),(100,'fileId','11','int'),(100,'fileStage','19','int'),(100,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(100,'sourceSubmissionFileId','20','int'),(100,'submissionFileId','21','int'),(100,'submissionId','5','int'),(100,'username','dbarnes','string'),(101,'fileId','11','int'),(101,'fileStage','19','int'),(101,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(101,'submissionFileId','21','int'),(101,'submissionId','5','int'),(101,'username','dbarnes','string'),(102,'reviewAssignmentId','6','int'),(102,'reviewerName','Paul Hudson','string'),(102,'round','1','int'),(102,'stageId','2','int'),(102,'submissionId','5','int'),(103,'decision','3','int'),(103,'editorId','3','int'),(103,'editorName','Daniel Barnes','string'),(103,'submissionId','5','int'),(104,'reviewAssignmentId','7','int'),(104,'reviewerName','Gonzalo Favio','string'),(104,'round','1','int'),(104,'stageId','3','int'),(104,'submissionId','5','int'),(105,'decision','2','int'),(105,'editorId','3','int'),(105,'editorName','Daniel Barnes','string'),(105,'submissionId','5','int'),(106,'name','Sarah Vogt','string'),(106,'userGroupName','Copyeditor','string'),(106,'username','svogt','string'),(107,'decision','7','int'),(107,'editorId','3','int'),(107,'editorName','Daniel Barnes','string'),(107,'submissionId','5','int'),(108,'name','Stephen Hellier','string'),(108,'userGroupName','Layout Editor','string'),(108,'username','shellier','string'),(109,'name','Catherine Turner','string'),(109,'userGroupName','Proofreader','string'),(109,'username','cturner','string'),(110,'formatName','PDF','string'),(111,'fileId','11','int'),(111,'fileStage','10','int'),(111,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(111,'sourceSubmissionFileId','20','int'),(111,'submissionFileId','22','int'),(111,'submissionId','5','int'),(111,'username','dbarnes','string'),(112,'fileId','11','int'),(112,'fileStage','10','int'),(112,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(112,'submissionFileId','22','int'),(112,'submissionId','5','int'),(112,'username','dbarnes','string'),(113,'publicationFormatName','PDF','string'),(114,'publicationFormatName','PDF','string'),(115,'fileId','11','int'),(115,'fileStage','10','int'),(115,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(115,'sourceSubmissionFileId','20','int'),(115,'submissionFileId','22','int'),(115,'submissionId','5','int'),(115,'username','dbarnes','string'),(116,'fileId','11','int'),(116,'fileStage','10','int'),(116,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(116,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(116,'sourceSubmissionFileId','20','int'),(116,'submissionFileId','22','int'),(116,'submissionId','5','int'),(116,'username','dbarnes','string'),(117,'file','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(117,'name','Daniel Barnes','string'),(117,'username','dbarnes','string'),(118,'fileId','11','int'),(118,'fileStage','10','int'),(118,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(118,'sourceSubmissionFileId','20','int'),(118,'submissionFileId','22','int'),(118,'submissionId','5','int'),(118,'username','dbarnes','string'),(119,'fileId','11','int'),(119,'fileStage','10','int'),(119,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(119,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(119,'sourceSubmissionFileId','20','int'),(119,'submissionFileId','22','int'),(119,'submissionId','5','int'),(119,'username','dbarnes','string'),(123,'fileId','12','int'),(123,'fileStage','2','int'),(123,'originalFileName','Identify: Understanding Your Information.pdf','string'),(123,'sourceSubmissionFileId',NULL,'string'),(123,'submissionFileId','23','int'),(123,'submissionId','6','int'),(123,'username','dbernnard','string'),(124,'fileId','12','int'),(124,'fileStage','2','int'),(124,'name','Identify: Understanding Your Information.pdf','string'),(124,'submissionFileId','23','int'),(124,'submissionId','6','int'),(124,'username','dbernnard','string'),(125,'fileId','12','int'),(125,'fileStage','2','int'),(125,'originalFileName','Identify: Understanding Your Information.pdf','string'),(125,'sourceSubmissionFileId',NULL,'string'),(125,'submissionFileId','23','int'),(125,'submissionId','6','int'),(125,'username','dbernnard','string'),(126,'fileId','12','int'),(126,'fileStage','2','int'),(126,'name','Identify: Understanding Your Information.pdf','string'),(126,'originalFileName','Identify: Understanding Your Information.pdf','string'),(126,'sourceSubmissionFileId',NULL,'string'),(126,'submissionFileId','23','int'),(126,'submissionId','6','int'),(126,'username','dbernnard','string'),(127,'fileId','13','int'),(127,'fileStage','2','int'),(127,'originalFileName','Scope: Knowing What Is Available.pdf','string'),(127,'sourceSubmissionFileId',NULL,'string'),(127,'submissionFileId','24','int'),(127,'submissionId','6','int'),(127,'username','dbernnard','string'),(128,'fileId','13','int'),(128,'fileStage','2','int'),(128,'name','Scope: Knowing What Is Available.pdf','string'),(128,'submissionFileId','24','int'),(128,'submissionId','6','int'),(128,'username','dbernnard','string'),(129,'fileId','13','int'),(129,'fileStage','2','int'),(129,'originalFileName','Scope: Knowing What Is Available.pdf','string'),(129,'sourceSubmissionFileId',NULL,'string'),(129,'submissionFileId','24','int'),(129,'submissionId','6','int'),(129,'username','dbernnard','string'),(130,'fileId','13','int'),(130,'fileStage','2','int'),(130,'name','Scope: Knowing What Is Available.pdf','string'),(130,'originalFileName','Scope: Knowing What Is Available.pdf','string'),(130,'sourceSubmissionFileId',NULL,'string'),(130,'submissionFileId','24','int'),(130,'submissionId','6','int'),(130,'username','dbernnard','string'),(131,'fileId','14','int'),(131,'fileStage','2','int'),(131,'originalFileName','Plan: Developing Research Strategies.pdf','string'),(131,'sourceSubmissionFileId',NULL,'string'),(131,'submissionFileId','25','int'),(131,'submissionId','6','int'),(131,'username','dbernnard','string'),(132,'fileId','14','int'),(132,'fileStage','2','int'),(132,'name','Plan: Developing Research Strategies.pdf','string'),(132,'submissionFileId','25','int'),(132,'submissionId','6','int'),(132,'username','dbernnard','string'),(133,'fileId','14','int'),(133,'fileStage','2','int'),(133,'originalFileName','Plan: Developing Research Strategies.pdf','string'),(133,'sourceSubmissionFileId',NULL,'string'),(133,'submissionFileId','25','int'),(133,'submissionId','6','int'),(133,'username','dbernnard','string'),(134,'fileId','14','int'),(134,'fileStage','2','int'),(134,'name','Plan: Developing Research Strategies.pdf','string'),(134,'originalFileName','Plan: Developing Research Strategies.pdf','string'),(134,'sourceSubmissionFileId',NULL,'string'),(134,'submissionFileId','25','int'),(134,'submissionId','6','int'),(134,'username','dbernnard','string'),(135,'fileId','15','int'),(135,'fileStage','2','int'),(135,'originalFileName','Gather: Finding What You Need.pdf','string'),(135,'sourceSubmissionFileId',NULL,'string'),(135,'submissionFileId','26','int'),(135,'submissionId','6','int'),(135,'username','dbernnard','string'),(136,'fileId','15','int'),(136,'fileStage','2','int'),(136,'name','Gather: Finding What You Need.pdf','string'),(136,'submissionFileId','26','int'),(136,'submissionId','6','int'),(136,'username','dbernnard','string'),(137,'fileId','15','int'),(137,'fileStage','2','int'),(137,'originalFileName','Gather: Finding What You Need.pdf','string'),(137,'sourceSubmissionFileId',NULL,'string'),(137,'submissionFileId','26','int'),(137,'submissionId','6','int'),(137,'username','dbernnard','string'),(138,'fileId','15','int'),(138,'fileStage','2','int'),(138,'name','Gather: Finding What You Need.pdf','string'),(138,'originalFileName','Gather: Finding What You Need.pdf','string'),(138,'sourceSubmissionFileId',NULL,'string'),(138,'submissionFileId','26','int'),(138,'submissionId','6','int'),(138,'username','dbernnard','string'),(141,'decision','1','int'),(141,'editorId','3','int'),(141,'editorName','Daniel Barnes','string'),(141,'submissionId','6','int'),(142,'fileId','15','int'),(142,'fileStage','19','int'),(142,'originalFileName','Gather: Finding What You Need.pdf','string'),(142,'sourceSubmissionFileId','26','int'),(142,'submissionFileId','27','int'),(142,'submissionId','6','int'),(142,'username','dbarnes','string'),(143,'fileId','15','int'),(143,'fileStage','19','int'),(143,'name','Gather: Finding What You Need.pdf','string'),(143,'submissionFileId','27','int'),(143,'submissionId','6','int'),(143,'username','dbarnes','string'),(144,'fileId','14','int'),(144,'fileStage','19','int'),(144,'originalFileName','Plan: Developing Research Strategies.pdf','string'),(144,'sourceSubmissionFileId','25','int'),(144,'submissionFileId','28','int'),(144,'submissionId','6','int'),(144,'username','dbarnes','string'),(145,'fileId','14','int'),(145,'fileStage','19','int'),(145,'name','Plan: Developing Research Strategies.pdf','string'),(145,'submissionFileId','28','int'),(145,'submissionId','6','int'),(145,'username','dbarnes','string'),(146,'fileId','13','int'),(146,'fileStage','19','int'),(146,'originalFileName','Scope: Knowing What Is Available.pdf','string'),(146,'sourceSubmissionFileId','24','int'),(146,'submissionFileId','29','int'),(146,'submissionId','6','int'),(146,'username','dbarnes','string'),(147,'fileId','13','int'),(147,'fileStage','19','int'),(147,'name','Scope: Knowing What Is Available.pdf','string'),(147,'submissionFileId','29','int'),(147,'submissionId','6','int'),(147,'username','dbarnes','string'),(148,'fileId','12','int'),(148,'fileStage','19','int'),(148,'originalFileName','Identify: Understanding Your Information.pdf','string'),(148,'sourceSubmissionFileId','23','int'),(148,'submissionFileId','30','int'),(148,'submissionId','6','int'),(148,'username','dbarnes','string'),(149,'fileId','12','int'),(149,'fileStage','19','int'),(149,'name','Identify: Understanding Your Information.pdf','string'),(149,'submissionFileId','30','int'),(149,'submissionId','6','int'),(149,'username','dbarnes','string'),(150,'name','Minoti Inoue','string'),(150,'userGroupName','Series editor','string'),(150,'username','minoue','string'),(151,'decision','23','int'),(151,'editorId','6','int'),(151,'editorName','Minoti Inoue','string'),(151,'submissionId','6','int'),(154,'fileId','16','int'),(154,'fileStage','2','int'),(154,'originalFileName','Introduction.pdf','string'),(154,'sourceSubmissionFileId',NULL,'string'),(154,'submissionFileId','31','int'),(154,'submissionId','7','int'),(154,'username','dkennepohl','string'),(155,'fileId','16','int'),(155,'fileStage','2','int'),(155,'name','Introduction.pdf','string'),(155,'submissionFileId','31','int'),(155,'submissionId','7','int'),(155,'username','dkennepohl','string'),(156,'fileId','16','int'),(156,'fileStage','2','int'),(156,'originalFileName','Introduction.pdf','string'),(156,'sourceSubmissionFileId',NULL,'string'),(156,'submissionFileId','31','int'),(156,'submissionId','7','int'),(156,'username','dkennepohl','string'),(157,'fileId','16','int'),(157,'fileStage','2','int'),(157,'name','Introduction.pdf','string'),(157,'originalFileName','Introduction.pdf','string'),(157,'sourceSubmissionFileId',NULL,'string'),(157,'submissionFileId','31','int'),(157,'submissionId','7','int'),(157,'username','dkennepohl','string'),(158,'fileId','17','int'),(158,'fileStage','2','int'),(158,'originalFileName','Chapter 1: Interactions Affording Distan.pdf','string'),(158,'sourceSubmissionFileId',NULL,'string'),(158,'submissionFileId','32','int'),(158,'submissionId','7','int'),(158,'username','dkennepohl','string'),(159,'fileId','17','int'),(159,'fileStage','2','int'),(159,'name','Chapter 1: Interactions Affording Distan.pdf','string'),(159,'submissionFileId','32','int'),(159,'submissionId','7','int'),(159,'username','dkennepohl','string'),(160,'fileId','17','int'),(160,'fileStage','2','int'),(160,'originalFileName','Chapter 1: Interactions Affording Distan.pdf','string'),(160,'sourceSubmissionFileId',NULL,'string'),(160,'submissionFileId','32','int'),(160,'submissionId','7','int'),(160,'username','dkennepohl','string'),(161,'fileId','17','int'),(161,'fileStage','2','int'),(161,'name','Chapter 1: Interactions Affording Distan.pdf','string'),(161,'originalFileName','Chapter 1: Interactions Affording Distan.pdf','string'),(161,'sourceSubmissionFileId',NULL,'string'),(161,'submissionFileId','32','int'),(161,'submissionId','7','int'),(161,'username','dkennepohl','string'),(162,'fileId','18','int'),(162,'fileStage','2','int'),(162,'originalFileName','Chapter 2: Learning Science at a Distanc.pdf','string'),(162,'sourceSubmissionFileId',NULL,'string'),(162,'submissionFileId','33','int'),(162,'submissionId','7','int'),(162,'username','dkennepohl','string'),(163,'fileId','18','int'),(163,'fileStage','2','int'),(163,'name','Chapter 2: Learning Science at a Distanc.pdf','string'),(163,'submissionFileId','33','int'),(163,'submissionId','7','int'),(163,'username','dkennepohl','string'),(164,'fileId','18','int'),(164,'fileStage','2','int'),(164,'originalFileName','Chapter 2: Learning Science at a Distanc.pdf','string'),(164,'sourceSubmissionFileId',NULL,'string'),(164,'submissionFileId','33','int'),(164,'submissionId','7','int'),(164,'username','dkennepohl','string'),(165,'fileId','18','int'),(165,'fileStage','2','int'),(165,'name','Chapter 2: Learning Science at a Distanc.pdf','string'),(165,'originalFileName','Chapter 2: Learning Science at a Distanc.pdf','string'),(165,'sourceSubmissionFileId',NULL,'string'),(165,'submissionFileId','33','int'),(165,'submissionId','7','int'),(165,'username','dkennepohl','string'),(166,'fileId','19','int'),(166,'fileStage','2','int'),(166,'originalFileName','Chapter 3: Leadership Strategies for Coo.pdf','string'),(166,'sourceSubmissionFileId',NULL,'string'),(166,'submissionFileId','34','int'),(166,'submissionId','7','int'),(166,'username','dkennepohl','string'),(167,'fileId','19','int'),(167,'fileStage','2','int'),(167,'name','Chapter 3: Leadership Strategies for Coo.pdf','string'),(167,'submissionFileId','34','int'),(167,'submissionId','7','int'),(167,'username','dkennepohl','string'),(168,'fileId','19','int'),(168,'fileStage','2','int'),(168,'originalFileName','Chapter 3: Leadership Strategies for Coo.pdf','string'),(168,'sourceSubmissionFileId',NULL,'string'),(168,'submissionFileId','34','int'),(168,'submissionId','7','int'),(168,'username','dkennepohl','string'),(169,'fileId','19','int'),(169,'fileStage','2','int'),(169,'name','Chapter 3: Leadership Strategies for Coo.pdf','string'),(169,'originalFileName','Chapter 3: Leadership Strategies for Coo.pdf','string'),(169,'sourceSubmissionFileId',NULL,'string'),(169,'submissionFileId','34','int'),(169,'submissionId','7','int'),(169,'username','dkennepohl','string'),(170,'fileId','20','int'),(170,'fileStage','2','int'),(170,'originalFileName','Chapter 4: Toward New Models of Flexible.pdf','string'),(170,'sourceSubmissionFileId',NULL,'string'),(170,'submissionFileId','35','int'),(170,'submissionId','7','int'),(170,'username','dkennepohl','string'),(171,'fileId','20','int'),(171,'fileStage','2','int'),(171,'name','Chapter 4: Toward New Models of Flexible.pdf','string'),(171,'submissionFileId','35','int'),(171,'submissionId','7','int'),(171,'username','dkennepohl','string'),(172,'fileId','20','int'),(172,'fileStage','2','int'),(172,'originalFileName','Chapter 4: Toward New Models of Flexible.pdf','string'),(172,'sourceSubmissionFileId',NULL,'string'),(172,'submissionFileId','35','int'),(172,'submissionId','7','int'),(172,'username','dkennepohl','string'),(173,'fileId','20','int'),(173,'fileStage','2','int'),(173,'name','Chapter 4: Toward New Models of Flexible.pdf','string'),(173,'originalFileName','Chapter 4: Toward New Models of Flexible.pdf','string'),(173,'sourceSubmissionFileId',NULL,'string'),(173,'submissionFileId','35','int'),(173,'submissionId','7','int'),(173,'username','dkennepohl','string'),(176,'decision','18','int'),(176,'editorId','3','int'),(176,'editorName','Daniel Barnes','string'),(176,'submissionId','7','int'),(177,'fileId','20','int'),(177,'fileStage','4','int'),(177,'originalFileName','Chapter 4: Toward New Models of Flexible.pdf','string'),(177,'sourceSubmissionFileId','35','int'),(177,'submissionFileId','36','int'),(177,'submissionId','7','int'),(177,'username','dbarnes','string'),(178,'fileId','20','int'),(178,'fileStage','4','int'),(178,'name','Chapter 4: Toward New Models of Flexible.pdf','string'),(178,'submissionFileId','36','int'),(178,'submissionId','7','int'),(178,'username','dbarnes','string'),(179,'fileId','19','int'),(179,'fileStage','4','int'),(179,'originalFileName','Chapter 3: Leadership Strategies for Coo.pdf','string'),(179,'sourceSubmissionFileId','34','int'),(179,'submissionFileId','37','int'),(179,'submissionId','7','int'),(179,'username','dbarnes','string'),(180,'fileId','19','int'),(180,'fileStage','4','int'),(180,'name','Chapter 3: Leadership Strategies for Coo.pdf','string'),(180,'submissionFileId','37','int'),(180,'submissionId','7','int'),(180,'username','dbarnes','string'),(181,'fileId','18','int'),(181,'fileStage','4','int'),(181,'originalFileName','Chapter 2: Learning Science at a Distanc.pdf','string'),(181,'sourceSubmissionFileId','33','int'),(181,'submissionFileId','38','int'),(181,'submissionId','7','int'),(181,'username','dbarnes','string'),(182,'fileId','18','int'),(182,'fileStage','4','int'),(182,'name','Chapter 2: Learning Science at a Distanc.pdf','string'),(182,'submissionFileId','38','int'),(182,'submissionId','7','int'),(182,'username','dbarnes','string'),(183,'fileId','17','int'),(183,'fileStage','4','int'),(183,'originalFileName','Chapter 1: Interactions Affording Distan.pdf','string'),(183,'sourceSubmissionFileId','32','int'),(183,'submissionFileId','39','int'),(183,'submissionId','7','int'),(183,'username','dbarnes','string'),(184,'fileId','17','int'),(184,'fileStage','4','int'),(184,'name','Chapter 1: Interactions Affording Distan.pdf','string'),(184,'submissionFileId','39','int'),(184,'submissionId','7','int'),(184,'username','dbarnes','string'),(185,'fileId','16','int'),(185,'fileStage','4','int'),(185,'originalFileName','Introduction.pdf','string'),(185,'sourceSubmissionFileId','31','int'),(185,'submissionFileId','40','int'),(185,'submissionId','7','int'),(185,'username','dbarnes','string'),(186,'fileId','16','int'),(186,'fileStage','4','int'),(186,'name','Introduction.pdf','string'),(186,'submissionFileId','40','int'),(186,'submissionId','7','int'),(186,'username','dbarnes','string'),(187,'reviewAssignmentId','8','int'),(187,'reviewerName','Adela Gallego','string'),(187,'round','1','int'),(187,'stageId','3','int'),(187,'submissionId','7','int'),(188,'decision','2','int'),(188,'editorId','3','int'),(188,'editorName','Daniel Barnes','string'),(188,'submissionId','7','int'),(189,'name','Maria Fritz','string'),(189,'userGroupName','Copyeditor','string'),(189,'username','mfritz','string'),(192,'fileId','21','int'),(192,'fileStage','2','int'),(192,'originalFileName','Editorial.pdf','string'),(192,'sourceSubmissionFileId',NULL,'string'),(192,'submissionFileId','41','int'),(192,'submissionId','8','int'),(192,'username','dbarnes','string'),(193,'fileId','21','int'),(193,'fileStage','2','int'),(193,'name','Editorial.pdf','string'),(193,'submissionFileId','41','int'),(193,'submissionId','8','int'),(193,'username','dbarnes','string'),(194,'fileId','21','int'),(194,'fileStage','2','int'),(194,'originalFileName','Editorial.pdf','string'),(194,'sourceSubmissionFileId',NULL,'string'),(194,'submissionFileId','41','int'),(194,'submissionId','8','int'),(194,'username','dbarnes','string'),(195,'fileId','21','int'),(195,'fileStage','2','int'),(195,'name','Editorial.pdf','string'),(195,'originalFileName','Editorial.pdf','string'),(195,'sourceSubmissionFileId',NULL,'string'),(195,'submissionFileId','41','int'),(195,'submissionId','8','int'),(195,'username','dbarnes','string'),(200,'fileId','22','int'),(200,'fileStage','2','int'),(200,'originalFileName','Internet, openness and the future of the.pdf','string'),(200,'sourceSubmissionFileId',NULL,'string'),(200,'submissionFileId','42','int'),(200,'submissionId','9','int'),(200,'username','fperini','string'),(201,'fileId','22','int'),(201,'fileStage','2','int'),(201,'name','Internet, openness and the future of the.pdf','string'),(201,'submissionFileId','42','int'),(201,'submissionId','9','int'),(201,'username','fperini','string'),(202,'fileId','22','int'),(202,'fileStage','2','int'),(202,'originalFileName','Internet, openness and the future of the.pdf','string'),(202,'sourceSubmissionFileId',NULL,'string'),(202,'submissionFileId','42','int'),(202,'submissionId','9','int'),(202,'username','fperini','string'),(203,'fileId','22','int'),(203,'fileStage','2','int'),(203,'name','Internet, openness and the future of the.pdf','string'),(203,'originalFileName','Internet, openness and the future of the.pdf','string'),(203,'sourceSubmissionFileId',NULL,'string'),(203,'submissionFileId','42','int'),(203,'submissionId','9','int'),(203,'username','fperini','string'),(204,'fileId','23','int'),(204,'fileStage','2','int'),(204,'originalFileName','Imagining the Internet: Open, closed or .pdf','string'),(204,'sourceSubmissionFileId',NULL,'string'),(204,'submissionFileId','43','int'),(204,'submissionId','9','int'),(204,'username','fperini','string'),(205,'fileId','23','int'),(205,'fileStage','2','int'),(205,'name','Imagining the Internet: Open, closed or .pdf','string'),(205,'submissionFileId','43','int'),(205,'submissionId','9','int'),(205,'username','fperini','string'),(206,'fileId','23','int'),(206,'fileStage','2','int'),(206,'originalFileName','Imagining the Internet: Open, closed or .pdf','string'),(206,'sourceSubmissionFileId',NULL,'string'),(206,'submissionFileId','43','int'),(206,'submissionId','9','int'),(206,'username','fperini','string'),(207,'fileId','23','int'),(207,'fileStage','2','int'),(207,'name','Imagining the Internet: Open, closed or .pdf','string'),(207,'originalFileName','Imagining the Internet: Open, closed or .pdf','string'),(207,'sourceSubmissionFileId',NULL,'string'),(207,'submissionFileId','43','int'),(207,'submissionId','9','int'),(207,'username','fperini','string'),(208,'fileId','24','int'),(208,'fileStage','2','int'),(208,'originalFileName','The internet in LAC will remain free, pu.pdf','string'),(208,'sourceSubmissionFileId',NULL,'string'),(208,'submissionFileId','44','int'),(208,'submissionId','9','int'),(208,'username','fperini','string'),(209,'fileId','24','int'),(209,'fileStage','2','int'),(209,'name','The internet in LAC will remain free, pu.pdf','string'),(209,'submissionFileId','44','int'),(209,'submissionId','9','int'),(209,'username','fperini','string'),(210,'fileId','24','int'),(210,'fileStage','2','int'),(210,'originalFileName','The internet in LAC will remain free, pu.pdf','string'),(210,'sourceSubmissionFileId',NULL,'string'),(210,'submissionFileId','44','int'),(210,'submissionId','9','int'),(210,'username','fperini','string'),(211,'fileId','24','int'),(211,'fileStage','2','int'),(211,'name','The internet in LAC will remain free, pu.pdf','string'),(211,'originalFileName','The internet in LAC will remain free, pu.pdf','string'),(211,'sourceSubmissionFileId',NULL,'string'),(211,'submissionFileId','44','int'),(211,'submissionId','9','int'),(211,'username','fperini','string'),(212,'fileId','25','int'),(212,'fileStage','2','int'),(212,'originalFileName','Free Internet?.pdf','string'),(212,'sourceSubmissionFileId',NULL,'string'),(212,'submissionFileId','45','int'),(212,'submissionId','9','int'),(212,'username','fperini','string'),(213,'fileId','25','int'),(213,'fileStage','2','int'),(213,'name','Free Internet?.pdf','string'),(213,'submissionFileId','45','int'),(213,'submissionId','9','int'),(213,'username','fperini','string'),(214,'fileId','25','int'),(214,'fileStage','2','int'),(214,'originalFileName','Free Internet?.pdf','string'),(214,'sourceSubmissionFileId',NULL,'string'),(214,'submissionFileId','45','int'),(214,'submissionId','9','int'),(214,'username','fperini','string'),(215,'fileId','25','int'),(215,'fileStage','2','int'),(215,'name','Free Internet?.pdf','string'),(215,'originalFileName','Free Internet?.pdf','string'),(215,'sourceSubmissionFileId',NULL,'string'),(215,'submissionFileId','45','int'),(215,'submissionId','9','int'),(215,'username','fperini','string'),(216,'fileId','26','int'),(216,'fileStage','2','int'),(216,'originalFileName','Risks and challenges for freedom of expr.pdf','string'),(216,'sourceSubmissionFileId',NULL,'string'),(216,'submissionFileId','46','int'),(216,'submissionId','9','int'),(216,'username','fperini','string'),(217,'fileId','26','int'),(217,'fileStage','2','int'),(217,'name','Risks and challenges for freedom of expr.pdf','string'),(217,'submissionFileId','46','int'),(217,'submissionId','9','int'),(217,'username','fperini','string'),(218,'fileId','26','int'),(218,'fileStage','2','int'),(218,'originalFileName','Risks and challenges for freedom of expr.pdf','string'),(218,'sourceSubmissionFileId',NULL,'string'),(218,'submissionFileId','46','int'),(218,'submissionId','9','int'),(218,'username','fperini','string'),(219,'fileId','26','int'),(219,'fileStage','2','int'),(219,'name','Risks and challenges for freedom of expr.pdf','string'),(219,'originalFileName','Risks and challenges for freedom of expr.pdf','string'),(219,'sourceSubmissionFileId',NULL,'string'),(219,'submissionFileId','46','int'),(219,'submissionId','9','int'),(219,'username','fperini','string'),(222,'decision','1','int'),(222,'editorId','3','int'),(222,'editorName','Daniel Barnes','string'),(222,'submissionId','9','int'),(223,'fileId','26','int'),(223,'fileStage','19','int'),(223,'originalFileName','Risks and challenges for freedom of expr.pdf','string'),(223,'sourceSubmissionFileId','46','int'),(223,'submissionFileId','47','int'),(223,'submissionId','9','int'),(223,'username','dbarnes','string'),(224,'fileId','26','int'),(224,'fileStage','19','int'),(224,'name','Risks and challenges for freedom of expr.pdf','string'),(224,'submissionFileId','47','int'),(224,'submissionId','9','int'),(224,'username','dbarnes','string'),(225,'fileId','25','int'),(225,'fileStage','19','int'),(225,'originalFileName','Free Internet?.pdf','string'),(225,'sourceSubmissionFileId','45','int'),(225,'submissionFileId','48','int'),(225,'submissionId','9','int'),(225,'username','dbarnes','string'),(226,'fileId','25','int'),(226,'fileStage','19','int'),(226,'name','Free Internet?.pdf','string'),(226,'submissionFileId','48','int'),(226,'submissionId','9','int'),(226,'username','dbarnes','string'),(227,'fileId','24','int'),(227,'fileStage','19','int'),(227,'originalFileName','The internet in LAC will remain free, pu.pdf','string'),(227,'sourceSubmissionFileId','44','int'),(227,'submissionFileId','49','int'),(227,'submissionId','9','int'),(227,'username','dbarnes','string'),(228,'fileId','24','int'),(228,'fileStage','19','int'),(228,'name','The internet in LAC will remain free, pu.pdf','string'),(228,'submissionFileId','49','int'),(228,'submissionId','9','int'),(228,'username','dbarnes','string'),(229,'fileId','23','int'),(229,'fileStage','19','int'),(229,'originalFileName','Imagining the Internet: Open, closed or .pdf','string'),(229,'sourceSubmissionFileId','43','int'),(229,'submissionFileId','50','int'),(229,'submissionId','9','int'),(229,'username','dbarnes','string'),(230,'fileId','23','int'),(230,'fileStage','19','int'),(230,'name','Imagining the Internet: Open, closed or .pdf','string'),(230,'submissionFileId','50','int'),(230,'submissionId','9','int'),(230,'username','dbarnes','string'),(231,'fileId','22','int'),(231,'fileStage','19','int'),(231,'originalFileName','Internet, openness and the future of the.pdf','string'),(231,'sourceSubmissionFileId','42','int'),(231,'submissionFileId','51','int'),(231,'submissionId','9','int'),(231,'username','dbarnes','string'),(232,'fileId','22','int'),(232,'fileStage','19','int'),(232,'name','Internet, openness and the future of the.pdf','string'),(232,'submissionFileId','51','int'),(232,'submissionId','9','int'),(232,'username','dbarnes','string'),(235,'fileId','27','int'),(235,'fileStage','2','int'),(235,'originalFileName','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(235,'sourceSubmissionFileId',NULL,'string'),(235,'submissionFileId','52','int'),(235,'submissionId','10','int'),(235,'username','jbrower','string'),(236,'fileId','27','int'),(236,'fileStage','2','int'),(236,'name','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(236,'submissionFileId','52','int'),(236,'submissionId','10','int'),(236,'username','jbrower','string'),(237,'fileId','27','int'),(237,'fileStage','2','int'),(237,'originalFileName','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(237,'sourceSubmissionFileId',NULL,'string'),(237,'submissionFileId','52','int'),(237,'submissionId','10','int'),(237,'username','jbrower','string'),(238,'fileId','27','int'),(238,'fileStage','2','int'),(238,'name','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(238,'originalFileName','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(238,'sourceSubmissionFileId',NULL,'string'),(238,'submissionFileId','52','int'),(238,'submissionId','10','int'),(238,'username','jbrower','string'),(243,'fileId','28','int'),(243,'fileStage','2','int'),(243,'originalFileName','Dreamwork.pdf','string'),(243,'sourceSubmissionFileId',NULL,'string'),(243,'submissionFileId','53','int'),(243,'submissionId','11','int'),(243,'username','jlockehart','string'),(244,'fileId','28','int'),(244,'fileStage','2','int'),(244,'name','Dreamwork.pdf','string'),(244,'submissionFileId','53','int'),(244,'submissionId','11','int'),(244,'username','jlockehart','string'),(245,'fileId','28','int'),(245,'fileStage','2','int'),(245,'originalFileName','Dreamwork.pdf','string'),(245,'sourceSubmissionFileId',NULL,'string'),(245,'submissionFileId','53','int'),(245,'submissionId','11','int'),(245,'username','jlockehart','string'),(246,'fileId','28','int'),(246,'fileStage','2','int'),(246,'name','Dreamwork.pdf','string'),(246,'originalFileName','Dreamwork.pdf','string'),(246,'sourceSubmissionFileId',NULL,'string'),(246,'submissionFileId','53','int'),(246,'submissionId','11','int'),(246,'username','jlockehart','string'),(249,'decision','1','int'),(249,'editorId','3','int'),(249,'editorName','Daniel Barnes','string'),(249,'submissionId','11','int'),(250,'fileId','28','int'),(250,'fileStage','19','int'),(250,'originalFileName','Dreamwork.pdf','string'),(250,'sourceSubmissionFileId','53','int'),(250,'submissionFileId','54','int'),(250,'submissionId','11','int'),(250,'username','dbarnes','string'),(251,'fileId','28','int'),(251,'fileStage','19','int'),(251,'name','Dreamwork.pdf','string'),(251,'submissionFileId','54','int'),(251,'submissionId','11','int'),(251,'username','dbarnes','string'),(252,'reviewAssignmentId','9','int'),(252,'reviewerName','Aisla McCrae','string'),(252,'round','1','int'),(252,'stageId','2','int'),(252,'submissionId','11','int'),(253,'decision','3','int'),(253,'editorId','3','int'),(253,'editorName','Daniel Barnes','string'),(253,'submissionId','11','int'),(254,'reviewAssignmentId','10','int'),(254,'reviewerName','Adela Gallego','string'),(254,'round','1','int'),(254,'stageId','3','int'),(254,'submissionId','11','int'),(255,'reviewAssignmentId','11','int'),(255,'reviewerName','Gonzalo Favio','string'),(255,'round','1','int'),(255,'stageId','3','int'),(255,'submissionId','11','int'),(256,'reviewAssignmentId','10','int'),(256,'reviewerName','Adela Gallego','string'),(256,'round','1','int'),(256,'submissionId','11','int'),(257,'reviewAssignmentId','10','int'),(257,'reviewerName','Adela Gallego','string'),(257,'round','1','int'),(257,'submissionId','11','int'),(258,'reviewAssignmentId','11','int'),(258,'reviewerName','Gonzalo Favio','string'),(258,'round','1','int'),(258,'submissionId','11','int'),(259,'reviewAssignmentId','11','int'),(259,'reviewerName','Gonzalo Favio','string'),(259,'round','1','int'),(259,'submissionId','11','int'),(260,'decision','2','int'),(260,'editorId','3','int'),(260,'editorName','Daniel Barnes','string'),(260,'submissionId','11','int'),(261,'recipientCount','2','int'),(261,'subject','Thank you for your review','string'),(264,'fileId','29','int'),(264,'fileStage','2','int'),(264,'originalFileName','Catalyzing Access through Social and Tec.pdf','string'),(264,'sourceSubmissionFileId',NULL,'string'),(264,'submissionFileId','55','int'),(264,'submissionId','12','int'),(264,'username','lelder','string'),(265,'fileId','29','int'),(265,'fileStage','2','int'),(265,'name','Catalyzing Access through Social and Tec.pdf','string'),(265,'submissionFileId','55','int'),(265,'submissionId','12','int'),(265,'username','lelder','string'),(266,'fileId','29','int'),(266,'fileStage','2','int'),(266,'originalFileName','Catalyzing Access through Social and Tec.pdf','string'),(266,'sourceSubmissionFileId',NULL,'string'),(266,'submissionFileId','55','int'),(266,'submissionId','12','int'),(266,'username','lelder','string'),(267,'fileId','29','int'),(267,'fileStage','2','int'),(267,'name','Catalyzing Access through Social and Tec.pdf','string'),(267,'originalFileName','Catalyzing Access through Social and Tec.pdf','string'),(267,'sourceSubmissionFileId',NULL,'string'),(267,'submissionFileId','55','int'),(267,'submissionId','12','int'),(267,'username','lelder','string'),(268,'fileId','30','int'),(268,'fileStage','2','int'),(268,'originalFileName','Catalyzing Access via Telecommunications.pdf','string'),(268,'sourceSubmissionFileId',NULL,'string'),(268,'submissionFileId','56','int'),(268,'submissionId','12','int'),(268,'username','lelder','string'),(269,'fileId','30','int'),(269,'fileStage','2','int'),(269,'name','Catalyzing Access via Telecommunications.pdf','string'),(269,'submissionFileId','56','int'),(269,'submissionId','12','int'),(269,'username','lelder','string'),(270,'fileId','30','int'),(270,'fileStage','2','int'),(270,'originalFileName','Catalyzing Access via Telecommunications.pdf','string'),(270,'sourceSubmissionFileId',NULL,'string'),(270,'submissionFileId','56','int'),(270,'submissionId','12','int'),(270,'username','lelder','string'),(271,'fileId','30','int'),(271,'fileStage','2','int'),(271,'name','Catalyzing Access via Telecommunications.pdf','string'),(271,'originalFileName','Catalyzing Access via Telecommunications.pdf','string'),(271,'sourceSubmissionFileId',NULL,'string'),(271,'submissionFileId','56','int'),(271,'submissionId','12','int'),(271,'username','lelder','string'),(272,'fileId','31','int'),(272,'fileStage','2','int'),(272,'originalFileName','Access to Knowledge as a New Paradigm fo.pdf','string'),(272,'sourceSubmissionFileId',NULL,'string'),(272,'submissionFileId','57','int'),(272,'submissionId','12','int'),(272,'username','lelder','string'),(273,'fileId','31','int'),(273,'fileStage','2','int'),(273,'name','Access to Knowledge as a New Paradigm fo.pdf','string'),(273,'submissionFileId','57','int'),(273,'submissionId','12','int'),(273,'username','lelder','string'),(274,'fileId','31','int'),(274,'fileStage','2','int'),(274,'originalFileName','Access to Knowledge as a New Paradigm fo.pdf','string'),(274,'sourceSubmissionFileId',NULL,'string'),(274,'submissionFileId','57','int'),(274,'submissionId','12','int'),(274,'username','lelder','string'),(275,'fileId','31','int'),(275,'fileStage','2','int'),(275,'name','Access to Knowledge as a New Paradigm fo.pdf','string'),(275,'originalFileName','Access to Knowledge as a New Paradigm fo.pdf','string'),(275,'sourceSubmissionFileId',NULL,'string'),(275,'submissionFileId','57','int'),(275,'submissionId','12','int'),(275,'username','lelder','string'),(278,'decision','1','int'),(278,'editorId','3','int'),(278,'editorName','Daniel Barnes','string'),(278,'submissionId','12','int'),(279,'fileId','31','int'),(279,'fileStage','19','int'),(279,'originalFileName','Access to Knowledge as a New Paradigm fo.pdf','string'),(279,'sourceSubmissionFileId','57','int'),(279,'submissionFileId','58','int'),(279,'submissionId','12','int'),(279,'username','dbarnes','string'),(280,'fileId','31','int'),(280,'fileStage','19','int'),(280,'name','Access to Knowledge as a New Paradigm fo.pdf','string'),(280,'submissionFileId','58','int'),(280,'submissionId','12','int'),(280,'username','dbarnes','string'),(281,'fileId','30','int'),(281,'fileStage','19','int'),(281,'originalFileName','Catalyzing Access via Telecommunications.pdf','string'),(281,'sourceSubmissionFileId','56','int'),(281,'submissionFileId','59','int'),(281,'submissionId','12','int'),(281,'username','dbarnes','string'),(282,'fileId','30','int'),(282,'fileStage','19','int'),(282,'name','Catalyzing Access via Telecommunications.pdf','string'),(282,'submissionFileId','59','int'),(282,'submissionId','12','int'),(282,'username','dbarnes','string'),(283,'fileId','29','int'),(283,'fileStage','19','int'),(283,'originalFileName','Catalyzing Access through Social and Tec.pdf','string'),(283,'sourceSubmissionFileId','55','int'),(283,'submissionFileId','60','int'),(283,'submissionId','12','int'),(283,'username','dbarnes','string'),(284,'fileId','29','int'),(284,'fileStage','19','int'),(284,'name','Catalyzing Access through Social and Tec.pdf','string'),(284,'submissionFileId','60','int'),(284,'submissionId','12','int'),(284,'username','dbarnes','string'),(285,'reviewAssignmentId','12','int'),(285,'reviewerName','Julie Janssen','string'),(285,'round','1','int'),(285,'stageId','2','int'),(285,'submissionId','12','int'),(286,'reviewAssignmentId','13','int'),(286,'reviewerName','Paul Hudson','string'),(286,'round','1','int'),(286,'stageId','2','int'),(286,'submissionId','12','int'),(287,'reviewAssignmentId','14','int'),(287,'reviewerName','Aisla McCrae','string'),(287,'round','1','int'),(287,'stageId','2','int'),(287,'submissionId','12','int'),(288,'reviewAssignmentId','13','int'),(288,'reviewerName','Paul Hudson','string'),(288,'round','1','int'),(288,'submissionId','12','int'),(289,'reviewAssignmentId','13','int'),(289,'reviewerName','Paul Hudson','string'),(289,'round','1','int'),(289,'submissionId','12','int'),(292,'fileId','32','int'),(292,'fileStage','2','int'),(292,'originalFileName','Current State of Mobile Learning.pdf','string'),(292,'sourceSubmissionFileId',NULL,'string'),(292,'submissionFileId','61','int'),(292,'submissionId','13','int'),(292,'username','mally','string'),(293,'fileId','32','int'),(293,'fileStage','2','int'),(293,'name','Current State of Mobile Learning.pdf','string'),(293,'submissionFileId','61','int'),(293,'submissionId','13','int'),(293,'username','mally','string'),(294,'fileId','32','int'),(294,'fileStage','2','int'),(294,'originalFileName','Current State of Mobile Learning.pdf','string'),(294,'sourceSubmissionFileId',NULL,'string'),(294,'submissionFileId','61','int'),(294,'submissionId','13','int'),(294,'username','mally','string'),(295,'fileId','32','int'),(295,'fileStage','2','int'),(295,'name','Current State of Mobile Learning.pdf','string'),(295,'originalFileName','Current State of Mobile Learning.pdf','string'),(295,'sourceSubmissionFileId',NULL,'string'),(295,'submissionFileId','61','int'),(295,'submissionId','13','int'),(295,'username','mally','string'),(296,'fileId','33','int'),(296,'fileStage','2','int'),(296,'originalFileName','A Model for Framing Mobile Learning.pdf','string'),(296,'sourceSubmissionFileId',NULL,'string'),(296,'submissionFileId','62','int'),(296,'submissionId','13','int'),(296,'username','mally','string'),(297,'fileId','33','int'),(297,'fileStage','2','int'),(297,'name','A Model for Framing Mobile Learning.pdf','string'),(297,'submissionFileId','62','int'),(297,'submissionId','13','int'),(297,'username','mally','string'),(298,'fileId','33','int'),(298,'fileStage','2','int'),(298,'originalFileName','A Model for Framing Mobile Learning.pdf','string'),(298,'sourceSubmissionFileId',NULL,'string'),(298,'submissionFileId','62','int'),(298,'submissionId','13','int'),(298,'username','mally','string'),(299,'fileId','33','int'),(299,'fileStage','2','int'),(299,'name','A Model for Framing Mobile Learning.pdf','string'),(299,'originalFileName','A Model for Framing Mobile Learning.pdf','string'),(299,'sourceSubmissionFileId',NULL,'string'),(299,'submissionFileId','62','int'),(299,'submissionId','13','int'),(299,'username','mally','string'),(300,'fileId','34','int'),(300,'fileStage','2','int'),(300,'originalFileName','Mobile Distance Learning with PDAs: Deve.pdf','string'),(300,'sourceSubmissionFileId',NULL,'string'),(300,'submissionFileId','63','int'),(300,'submissionId','13','int'),(300,'username','mally','string'),(301,'fileId','34','int'),(301,'fileStage','2','int'),(301,'name','Mobile Distance Learning with PDAs: Deve.pdf','string'),(301,'submissionFileId','63','int'),(301,'submissionId','13','int'),(301,'username','mally','string'),(302,'fileId','34','int'),(302,'fileStage','2','int'),(302,'originalFileName','Mobile Distance Learning with PDAs: Deve.pdf','string'),(302,'sourceSubmissionFileId',NULL,'string'),(302,'submissionFileId','63','int'),(302,'submissionId','13','int'),(302,'username','mally','string'),(303,'fileId','34','int'),(303,'fileStage','2','int'),(303,'name','Mobile Distance Learning with PDAs: Deve.pdf','string'),(303,'originalFileName','Mobile Distance Learning with PDAs: Deve.pdf','string'),(303,'sourceSubmissionFileId',NULL,'string'),(303,'submissionFileId','63','int'),(303,'submissionId','13','int'),(303,'username','mally','string'),(306,'decision','1','int'),(306,'editorId','3','int'),(306,'editorName','Daniel Barnes','string'),(306,'submissionId','13','int'),(307,'fileId','34','int'),(307,'fileStage','19','int'),(307,'originalFileName','Mobile Distance Learning with PDAs: Deve.pdf','string'),(307,'sourceSubmissionFileId','63','int'),(307,'submissionFileId','64','int'),(307,'submissionId','13','int'),(307,'username','dbarnes','string'),(308,'fileId','34','int'),(308,'fileStage','19','int'),(308,'name','Mobile Distance Learning with PDAs: Deve.pdf','string'),(308,'submissionFileId','64','int'),(308,'submissionId','13','int'),(308,'username','dbarnes','string'),(309,'fileId','33','int'),(309,'fileStage','19','int'),(309,'originalFileName','A Model for Framing Mobile Learning.pdf','string'),(309,'sourceSubmissionFileId','62','int'),(309,'submissionFileId','65','int'),(309,'submissionId','13','int'),(309,'username','dbarnes','string'),(310,'fileId','33','int'),(310,'fileStage','19','int'),(310,'name','A Model for Framing Mobile Learning.pdf','string'),(310,'submissionFileId','65','int'),(310,'submissionId','13','int'),(310,'username','dbarnes','string'),(311,'fileId','32','int'),(311,'fileStage','19','int'),(311,'originalFileName','Current State of Mobile Learning.pdf','string'),(311,'sourceSubmissionFileId','61','int'),(311,'submissionFileId','66','int'),(311,'submissionId','13','int'),(311,'username','dbarnes','string'),(312,'fileId','32','int'),(312,'fileStage','19','int'),(312,'name','Current State of Mobile Learning.pdf','string'),(312,'submissionFileId','66','int'),(312,'submissionId','13','int'),(312,'username','dbarnes','string'),(313,'reviewAssignmentId','15','int'),(313,'reviewerName','Paul Hudson','string'),(313,'round','1','int'),(313,'stageId','2','int'),(313,'submissionId','13','int'),(314,'decision','3','int'),(314,'editorId','3','int'),(314,'editorName','Daniel Barnes','string'),(314,'submissionId','13','int'),(315,'reviewAssignmentId','16','int'),(315,'reviewerName','Adela Gallego','string'),(315,'round','1','int'),(315,'stageId','3','int'),(315,'submissionId','13','int'),(316,'reviewAssignmentId','17','int'),(316,'reviewerName','Al Zacharia','string'),(316,'round','1','int'),(316,'stageId','3','int'),(316,'submissionId','13','int'),(317,'reviewAssignmentId','18','int'),(317,'reviewerName','Gonzalo Favio','string'),(317,'round','1','int'),(317,'stageId','3','int'),(317,'submissionId','13','int'),(318,'reviewAssignmentId','16','int'),(318,'reviewerName','Adela Gallego','string'),(318,'round','1','int'),(318,'submissionId','13','int'),(319,'reviewAssignmentId','16','int'),(319,'reviewerName','Adela Gallego','string'),(319,'round','1','int'),(319,'submissionId','13','int'),(320,'reviewAssignmentId','18','int'),(320,'reviewerName','Gonzalo Favio','string'),(320,'round','1','int'),(320,'submissionId','13','int'),(321,'reviewAssignmentId','18','int'),(321,'reviewerName','Gonzalo Favio','string'),(321,'round','1','int'),(321,'submissionId','13','int'),(322,'decision','2','int'),(322,'editorId','3','int'),(322,'editorName','Daniel Barnes','string'),(322,'submissionId','13','int'),(323,'recipientCount','2','int'),(323,'subject','Thank you for your review','string'),(326,'fileId','35','int'),(326,'fileStage','2','int'),(326,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(326,'sourceSubmissionFileId',NULL,'string'),(326,'submissionFileId','67','int'),(326,'submissionId','14','int'),(326,'username','mdawson','string'),(327,'fileId','35','int'),(327,'fileStage','2','int'),(327,'name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(327,'submissionFileId','67','int'),(327,'submissionId','14','int'),(327,'username','mdawson','string'),(328,'fileId','35','int'),(328,'fileStage','2','int'),(328,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(328,'sourceSubmissionFileId',NULL,'string'),(328,'submissionFileId','67','int'),(328,'submissionId','14','int'),(328,'username','mdawson','string'),(329,'fileId','35','int'),(329,'fileStage','2','int'),(329,'name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(329,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(329,'sourceSubmissionFileId',NULL,'string'),(329,'submissionFileId','67','int'),(329,'submissionId','14','int'),(329,'username','mdawson','string'),(330,'fileId','36','int'),(330,'fileStage','2','int'),(330,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(330,'sourceSubmissionFileId',NULL,'string'),(330,'submissionFileId','68','int'),(330,'submissionId','14','int'),(330,'username','mdawson','string'),(331,'fileId','36','int'),(331,'fileStage','2','int'),(331,'name','Chapter 2: Classical Music and the Class.pdf','string'),(331,'submissionFileId','68','int'),(331,'submissionId','14','int'),(331,'username','mdawson','string'),(332,'fileId','36','int'),(332,'fileStage','2','int'),(332,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(332,'sourceSubmissionFileId',NULL,'string'),(332,'submissionFileId','68','int'),(332,'submissionId','14','int'),(332,'username','mdawson','string'),(333,'fileId','36','int'),(333,'fileStage','2','int'),(333,'name','Chapter 2: Classical Music and the Class.pdf','string'),(333,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(333,'sourceSubmissionFileId',NULL,'string'),(333,'submissionFileId','68','int'),(333,'submissionId','14','int'),(333,'username','mdawson','string'),(334,'fileId','37','int'),(334,'fileStage','2','int'),(334,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(334,'sourceSubmissionFileId',NULL,'string'),(334,'submissionFileId','69','int'),(334,'submissionId','14','int'),(334,'username','mdawson','string'),(335,'fileId','37','int'),(335,'fileStage','2','int'),(335,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(335,'submissionFileId','69','int'),(335,'submissionId','14','int'),(335,'username','mdawson','string'),(336,'fileId','37','int'),(336,'fileStage','2','int'),(336,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(336,'sourceSubmissionFileId',NULL,'string'),(336,'submissionFileId','69','int'),(336,'submissionId','14','int'),(336,'username','mdawson','string'),(337,'fileId','37','int'),(337,'fileStage','2','int'),(337,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(337,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(337,'sourceSubmissionFileId',NULL,'string'),(337,'submissionFileId','69','int'),(337,'submissionId','14','int'),(337,'username','mdawson','string'),(338,'fileId','38','int'),(338,'fileStage','2','int'),(338,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(338,'sourceSubmissionFileId',NULL,'string'),(338,'submissionFileId','70','int'),(338,'submissionId','14','int'),(338,'username','mdawson','string'),(339,'fileId','38','int'),(339,'fileStage','2','int'),(339,'name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(339,'submissionFileId','70','int'),(339,'submissionId','14','int'),(339,'username','mdawson','string'),(340,'fileId','38','int'),(340,'fileStage','2','int'),(340,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(340,'sourceSubmissionFileId',NULL,'string'),(340,'submissionFileId','70','int'),(340,'submissionId','14','int'),(340,'username','mdawson','string'),(341,'fileId','38','int'),(341,'fileStage','2','int'),(341,'name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(341,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(341,'sourceSubmissionFileId',NULL,'string'),(341,'submissionFileId','70','int'),(341,'submissionId','14','int'),(341,'username','mdawson','string'),(342,'fileId','39','int'),(342,'fileStage','2','int'),(342,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(342,'sourceSubmissionFileId',NULL,'string'),(342,'submissionFileId','71','int'),(342,'submissionId','14','int'),(342,'username','mdawson','string'),(343,'fileId','39','int'),(343,'fileStage','2','int'),(343,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(343,'submissionFileId','71','int'),(343,'submissionId','14','int'),(343,'username','mdawson','string'),(344,'fileId','39','int'),(344,'fileStage','2','int'),(344,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(344,'sourceSubmissionFileId',NULL,'string'),(344,'submissionFileId','71','int'),(344,'submissionId','14','int'),(344,'username','mdawson','string'),(345,'fileId','39','int'),(345,'fileStage','2','int'),(345,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(345,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(345,'sourceSubmissionFileId',NULL,'string'),(345,'submissionFileId','71','int'),(345,'submissionId','14','int'),(345,'username','mdawson','string'),(346,'fileId','40','int'),(346,'fileStage','2','int'),(346,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(346,'sourceSubmissionFileId',NULL,'string'),(346,'submissionFileId','72','int'),(346,'submissionId','14','int'),(346,'username','mdawson','string'),(347,'fileId','40','int'),(347,'fileStage','2','int'),(347,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(347,'submissionFileId','72','int'),(347,'submissionId','14','int'),(347,'username','mdawson','string'),(348,'fileId','40','int'),(348,'fileStage','2','int'),(348,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(348,'sourceSubmissionFileId',NULL,'string'),(348,'submissionFileId','72','int'),(348,'submissionId','14','int'),(348,'username','mdawson','string'),(349,'fileId','40','int'),(349,'fileStage','2','int'),(349,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(349,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(349,'sourceSubmissionFileId',NULL,'string'),(349,'submissionFileId','72','int'),(349,'submissionId','14','int'),(349,'username','mdawson','string'),(352,'decision','1','int'),(352,'editorId','3','int'),(352,'editorName','Daniel Barnes','string'),(352,'submissionId','14','int'),(353,'fileId','40','int'),(353,'fileStage','19','int'),(353,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(353,'sourceSubmissionFileId','72','int'),(353,'submissionFileId','73','int'),(353,'submissionId','14','int'),(353,'username','dbarnes','string'),(354,'fileId','40','int'),(354,'fileStage','19','int'),(354,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(354,'submissionFileId','73','int'),(354,'submissionId','14','int'),(354,'username','dbarnes','string'),(355,'fileId','37','int'),(355,'fileStage','19','int'),(355,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(355,'sourceSubmissionFileId','69','int'),(355,'submissionFileId','74','int'),(355,'submissionId','14','int'),(355,'username','dbarnes','string'),(356,'fileId','37','int'),(356,'fileStage','19','int'),(356,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(356,'submissionFileId','74','int'),(356,'submissionId','14','int'),(356,'username','dbarnes','string'),(357,'fileId','38','int'),(357,'fileStage','19','int'),(357,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(357,'sourceSubmissionFileId','70','int'),(357,'submissionFileId','75','int'),(357,'submissionId','14','int'),(357,'username','dbarnes','string'),(358,'fileId','38','int'),(358,'fileStage','19','int'),(358,'name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(358,'submissionFileId','75','int'),(358,'submissionId','14','int'),(358,'username','dbarnes','string'),(359,'fileId','39','int'),(359,'fileStage','19','int'),(359,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(359,'sourceSubmissionFileId','71','int'),(359,'submissionFileId','76','int'),(359,'submissionId','14','int'),(359,'username','dbarnes','string'),(360,'fileId','39','int'),(360,'fileStage','19','int'),(360,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(360,'submissionFileId','76','int'),(360,'submissionId','14','int'),(360,'username','dbarnes','string'),(361,'fileId','36','int'),(361,'fileStage','19','int'),(361,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(361,'sourceSubmissionFileId','68','int'),(361,'submissionFileId','77','int'),(361,'submissionId','14','int'),(361,'username','dbarnes','string'),(362,'fileId','36','int'),(362,'fileStage','19','int'),(362,'name','Chapter 2: Classical Music and the Class.pdf','string'),(362,'submissionFileId','77','int'),(362,'submissionId','14','int'),(362,'username','dbarnes','string'),(363,'fileId','35','int'),(363,'fileStage','19','int'),(363,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(363,'sourceSubmissionFileId','67','int'),(363,'submissionFileId','78','int'),(363,'submissionId','14','int'),(363,'username','dbarnes','string'),(364,'fileId','35','int'),(364,'fileStage','19','int'),(364,'name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(364,'submissionFileId','78','int'),(364,'submissionId','14','int'),(364,'username','dbarnes','string'),(365,'reviewAssignmentId','19','int'),(365,'reviewerName','Julie Janssen','string'),(365,'round','1','int'),(365,'stageId','2','int'),(365,'submissionId','14','int'),(366,'decision','3','int'),(366,'editorId','3','int'),(366,'editorName','Daniel Barnes','string'),(366,'submissionId','14','int'),(367,'reviewAssignmentId','20','int'),(367,'reviewerName','Al Zacharia','string'),(367,'round','1','int'),(367,'stageId','3','int'),(367,'submissionId','14','int'),(368,'decision','2','int'),(368,'editorId','3','int'),(368,'editorName','Daniel Barnes','string'),(368,'submissionId','14','int'),(369,'name','Maria Fritz','string'),(369,'userGroupName','Copyeditor','string'),(369,'username','mfritz','string'),(370,'decision','7','int'),(370,'editorId','3','int'),(370,'editorName','Daniel Barnes','string'),(370,'submissionId','14','int'),(371,'name','Graham Cox','string'),(371,'userGroupName','Layout Editor','string'),(371,'username','gcox','string'),(372,'name','Sabine Kumar','string'),(372,'userGroupName','Proofreader','string'),(372,'username','skumar','string'),(373,'formatName','PDF','string'),(374,'fileId','40','int'),(374,'fileStage','10','int'),(374,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(374,'sourceSubmissionFileId','72','int'),(374,'submissionFileId','79','int'),(374,'submissionId','14','int'),(374,'username','dbarnes','string'),(375,'fileId','40','int'),(375,'fileStage','10','int'),(375,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(375,'submissionFileId','79','int'),(375,'submissionId','14','int'),(375,'username','dbarnes','string'),(376,'fileId','39','int'),(376,'fileStage','10','int'),(376,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(376,'sourceSubmissionFileId','71','int'),(376,'submissionFileId','80','int'),(376,'submissionId','14','int'),(376,'username','dbarnes','string'),(377,'fileId','39','int'),(377,'fileStage','10','int'),(377,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(377,'submissionFileId','80','int'),(377,'submissionId','14','int'),(377,'username','dbarnes','string'),(378,'fileId','38','int'),(378,'fileStage','10','int'),(378,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(378,'sourceSubmissionFileId','70','int'),(378,'submissionFileId','81','int'),(378,'submissionId','14','int'),(378,'username','dbarnes','string'),(379,'fileId','38','int'),(379,'fileStage','10','int'),(379,'name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(379,'submissionFileId','81','int'),(379,'submissionId','14','int'),(379,'username','dbarnes','string'),(380,'fileId','37','int'),(380,'fileStage','10','int'),(380,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(380,'sourceSubmissionFileId','69','int'),(380,'submissionFileId','82','int'),(380,'submissionId','14','int'),(380,'username','dbarnes','string'),(381,'fileId','37','int'),(381,'fileStage','10','int'),(381,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(381,'submissionFileId','82','int'),(381,'submissionId','14','int'),(381,'username','dbarnes','string'),(382,'fileId','36','int'),(382,'fileStage','10','int'),(382,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(382,'sourceSubmissionFileId','68','int'),(382,'submissionFileId','83','int'),(382,'submissionId','14','int'),(382,'username','dbarnes','string'),(383,'fileId','36','int'),(383,'fileStage','10','int'),(383,'name','Chapter 2: Classical Music and the Class.pdf','string'),(383,'submissionFileId','83','int'),(383,'submissionId','14','int'),(383,'username','dbarnes','string'),(384,'fileId','35','int'),(384,'fileStage','10','int'),(384,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(384,'sourceSubmissionFileId','67','int'),(384,'submissionFileId','84','int'),(384,'submissionId','14','int'),(384,'username','dbarnes','string'),(385,'fileId','35','int'),(385,'fileStage','10','int'),(385,'name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(385,'submissionFileId','84','int'),(385,'submissionId','14','int'),(385,'username','dbarnes','string'),(386,'publicationFormatName','PDF','string'),(387,'publicationFormatName','PDF','string'),(388,'fileId','35','int'),(388,'fileStage','10','int'),(388,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(388,'sourceSubmissionFileId','67','int'),(388,'submissionFileId','84','int'),(388,'submissionId','14','int'),(388,'username','dbarnes','string'),(389,'fileId','35','int'),(389,'fileStage','10','int'),(389,'name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(389,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(389,'sourceSubmissionFileId','67','int'),(389,'submissionFileId','84','int'),(389,'submissionId','14','int'),(389,'username','dbarnes','string'),(390,'file','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(390,'name','Daniel Barnes','string'),(390,'username','dbarnes','string'),(391,'fileId','35','int'),(391,'fileStage','10','int'),(391,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(391,'sourceSubmissionFileId','67','int'),(391,'submissionFileId','84','int'),(391,'submissionId','14','int'),(391,'username','dbarnes','string'),(392,'fileId','35','int'),(392,'fileStage','10','int'),(392,'name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(392,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(392,'sourceSubmissionFileId','67','int'),(392,'submissionFileId','84','int'),(392,'submissionId','14','int'),(392,'username','dbarnes','string'),(393,'fileId','36','int'),(393,'fileStage','10','int'),(393,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(393,'sourceSubmissionFileId','68','int'),(393,'submissionFileId','83','int'),(393,'submissionId','14','int'),(393,'username','dbarnes','string'),(394,'fileId','36','int'),(394,'fileStage','10','int'),(394,'name','Chapter 2: Classical Music and the Class.pdf','string'),(394,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(394,'sourceSubmissionFileId','68','int'),(394,'submissionFileId','83','int'),(394,'submissionId','14','int'),(394,'username','dbarnes','string'),(395,'file','Chapter 2: Classical Music and the Class.pdf','string'),(395,'name','Daniel Barnes','string'),(395,'username','dbarnes','string'),(396,'fileId','36','int'),(396,'fileStage','10','int'),(396,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(396,'sourceSubmissionFileId','68','int'),(396,'submissionFileId','83','int'),(396,'submissionId','14','int'),(396,'username','dbarnes','string'),(397,'fileId','36','int'),(397,'fileStage','10','int'),(397,'name','Chapter 2: Classical Music and the Class.pdf','string'),(397,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(397,'sourceSubmissionFileId','68','int'),(397,'submissionFileId','83','int'),(397,'submissionId','14','int'),(397,'username','dbarnes','string'),(398,'fileId','37','int'),(398,'fileStage','10','int'),(398,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(398,'sourceSubmissionFileId','69','int'),(398,'submissionFileId','82','int'),(398,'submissionId','14','int'),(398,'username','dbarnes','string'),(399,'fileId','37','int'),(399,'fileStage','10','int'),(399,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(399,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(399,'sourceSubmissionFileId','69','int'),(399,'submissionFileId','82','int'),(399,'submissionId','14','int'),(399,'username','dbarnes','string'),(400,'file','Chapter 3: Situated Cognition and Bricol.pdf','string'),(400,'name','Daniel Barnes','string'),(400,'username','dbarnes','string'),(401,'fileId','37','int'),(401,'fileStage','10','int'),(401,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(401,'sourceSubmissionFileId','69','int'),(401,'submissionFileId','82','int'),(401,'submissionId','14','int'),(401,'username','dbarnes','string'),(402,'fileId','37','int'),(402,'fileStage','10','int'),(402,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(402,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(402,'sourceSubmissionFileId','69','int'),(402,'submissionFileId','82','int'),(402,'submissionId','14','int'),(402,'username','dbarnes','string'),(403,'fileId','38','int'),(403,'fileStage','10','int'),(403,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(403,'sourceSubmissionFileId','70','int'),(403,'submissionFileId','81','int'),(403,'submissionId','14','int'),(403,'username','dbarnes','string'),(404,'fileId','38','int'),(404,'fileStage','10','int'),(404,'name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(404,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(404,'sourceSubmissionFileId','70','int'),(404,'submissionFileId','81','int'),(404,'submissionId','14','int'),(404,'username','dbarnes','string'),(405,'file','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(405,'name','Daniel Barnes','string'),(405,'username','dbarnes','string'),(406,'fileId','38','int'),(406,'fileStage','10','int'),(406,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(406,'sourceSubmissionFileId','70','int'),(406,'submissionFileId','81','int'),(406,'submissionId','14','int'),(406,'username','dbarnes','string'),(407,'fileId','38','int'),(407,'fileStage','10','int'),(407,'name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(407,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(407,'sourceSubmissionFileId','70','int'),(407,'submissionFileId','81','int'),(407,'submissionId','14','int'),(407,'username','dbarnes','string'),(408,'fileId','39','int'),(408,'fileStage','10','int'),(408,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(408,'sourceSubmissionFileId','71','int'),(408,'submissionFileId','80','int'),(408,'submissionId','14','int'),(408,'username','dbarnes','string'),(409,'fileId','39','int'),(409,'fileStage','10','int'),(409,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(409,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(409,'sourceSubmissionFileId','71','int'),(409,'submissionFileId','80','int'),(409,'submissionId','14','int'),(409,'username','dbarnes','string'),(410,'file','Segmentation of Vascular Ultrasound Imag.pdf','string'),(410,'name','Daniel Barnes','string'),(410,'username','dbarnes','string'),(411,'fileId','39','int'),(411,'fileStage','10','int'),(411,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(411,'sourceSubmissionFileId','71','int'),(411,'submissionFileId','80','int'),(411,'submissionId','14','int'),(411,'username','dbarnes','string'),(412,'fileId','39','int'),(412,'fileStage','10','int'),(412,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(412,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(412,'sourceSubmissionFileId','71','int'),(412,'submissionFileId','80','int'),(412,'submissionId','14','int'),(412,'username','dbarnes','string'),(413,'fileId','40','int'),(413,'fileStage','10','int'),(413,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(413,'sourceSubmissionFileId','72','int'),(413,'submissionFileId','79','int'),(413,'submissionId','14','int'),(413,'username','dbarnes','string'),(414,'fileId','40','int'),(414,'fileStage','10','int'),(414,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(414,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(414,'sourceSubmissionFileId','72','int'),(414,'submissionFileId','79','int'),(414,'submissionId','14','int'),(414,'username','dbarnes','string'),(415,'file','The Canadian Nutrient File: Nutrient Val.pdf','string'),(415,'name','Daniel Barnes','string'),(415,'username','dbarnes','string'),(416,'fileId','40','int'),(416,'fileStage','10','int'),(416,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(416,'sourceSubmissionFileId','72','int'),(416,'submissionFileId','79','int'),(416,'submissionId','14','int'),(416,'username','dbarnes','string'),(417,'fileId','40','int'),(417,'fileStage','10','int'),(417,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(417,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(417,'sourceSubmissionFileId','72','int'),(417,'submissionFileId','79','int'),(417,'submissionId','14','int'),(417,'username','dbarnes','string'),(421,'fileId','41','int'),(421,'fileStage','2','int'),(421,'originalFileName','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(421,'sourceSubmissionFileId',NULL,'string'),(421,'submissionFileId','85','int'),(421,'submissionId','15','int'),(421,'username','mforan','string'),(422,'fileId','41','int'),(422,'fileStage','2','int'),(422,'name','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(422,'submissionFileId','85','int'),(422,'submissionId','15','int'),(422,'username','mforan','string'),(423,'fileId','41','int'),(423,'fileStage','2','int'),(423,'originalFileName','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(423,'sourceSubmissionFileId',NULL,'string'),(423,'submissionFileId','85','int'),(423,'submissionId','15','int'),(423,'username','mforan','string'),(424,'fileId','41','int'),(424,'fileStage','2','int'),(424,'name','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(424,'originalFileName','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(424,'sourceSubmissionFileId',NULL,'string'),(424,'submissionFileId','85','int'),(424,'submissionId','15','int'),(424,'username','mforan','string'),(427,'decision','18','int'),(427,'editorId','3','int'),(427,'editorName','Daniel Barnes','string'),(427,'submissionId','15','int'),(428,'fileId','41','int'),(428,'fileStage','4','int'),(428,'originalFileName','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(428,'sourceSubmissionFileId','85','int'),(428,'submissionFileId','86','int'),(428,'submissionId','15','int'),(428,'username','dbarnes','string'),(429,'fileId','41','int'),(429,'fileStage','4','int'),(429,'name','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(429,'submissionFileId','86','int'),(429,'submissionId','15','int'),(429,'username','dbarnes','string'),(432,'fileId','42','int'),(432,'fileStage','2','int'),(432,'originalFileName','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(432,'sourceSubmissionFileId',NULL,'string'),(432,'submissionFileId','87','int'),(432,'submissionId','16','int'),(432,'username','mpower','string'),(433,'fileId','42','int'),(433,'fileStage','2','int'),(433,'name','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(433,'submissionFileId','87','int'),(433,'submissionId','16','int'),(433,'username','mpower','string'),(434,'fileId','42','int'),(434,'fileStage','2','int'),(434,'originalFileName','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(434,'sourceSubmissionFileId',NULL,'string'),(434,'submissionFileId','87','int'),(434,'submissionId','16','int'),(434,'username','mpower','string'),(435,'fileId','42','int'),(435,'fileStage','2','int'),(435,'name','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(435,'originalFileName','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(435,'sourceSubmissionFileId',NULL,'string'),(435,'submissionFileId','87','int'),(435,'submissionId','16','int'),(435,'username','mpower','string'),(438,'decision','18','int'),(438,'editorId','3','int'),(438,'editorName','Daniel Barnes','string'),(438,'submissionId','16','int'),(439,'fileId','42','int'),(439,'fileStage','4','int'),(439,'originalFileName','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(439,'sourceSubmissionFileId','87','int'),(439,'submissionFileId','88','int'),(439,'submissionId','16','int'),(439,'username','dbarnes','string'),(440,'fileId','42','int'),(440,'fileStage','4','int'),(440,'name','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(440,'submissionFileId','88','int'),(440,'submissionId','16','int'),(440,'username','dbarnes','string'),(441,'reviewAssignmentId','21','int'),(441,'reviewerName','Adela Gallego','string'),(441,'round','1','int'),(441,'stageId','3','int'),(441,'submissionId','16','int'),(442,'reviewAssignmentId','22','int'),(442,'reviewerName','Al Zacharia','string'),(442,'round','1','int'),(442,'stageId','3','int'),(442,'submissionId','16','int'),(443,'reviewAssignmentId','23','int'),(443,'reviewerName','Gonzalo Favio','string'),(443,'round','1','int'),(443,'stageId','3','int'),(443,'submissionId','16','int'),(444,'reviewAssignmentId','21','int'),(444,'reviewerName','Adela Gallego','string'),(444,'round','1','int'),(444,'submissionId','16','int'),(445,'reviewAssignmentId','21','int'),(445,'reviewerName','Adela Gallego','string'),(445,'round','1','int'),(445,'submissionId','16','int'),(448,'fileId','43','int'),(448,'fileStage','2','int'),(448,'originalFileName','Preface.pdf','string'),(448,'sourceSubmissionFileId',NULL,'string'),(448,'submissionFileId','89','int'),(448,'submissionId','17','int'),(448,'username','msmith','string'),(449,'fileId','43','int'),(449,'fileStage','2','int'),(449,'name','Preface.pdf','string'),(449,'submissionFileId','89','int'),(449,'submissionId','17','int'),(449,'username','msmith','string'),(450,'fileId','43','int'),(450,'fileStage','2','int'),(450,'originalFileName','Preface.pdf','string'),(450,'sourceSubmissionFileId',NULL,'string'),(450,'submissionFileId','89','int'),(450,'submissionId','17','int'),(450,'username','msmith','string'),(451,'fileId','43','int'),(451,'fileStage','2','int'),(451,'name','Preface.pdf','string'),(451,'originalFileName','Preface.pdf','string'),(451,'sourceSubmissionFileId',NULL,'string'),(451,'submissionFileId','89','int'),(451,'submissionId','17','int'),(451,'username','msmith','string'),(452,'fileId','44','int'),(452,'fileStage','2','int'),(452,'originalFileName','Introduction.pdf','string'),(452,'sourceSubmissionFileId',NULL,'string'),(452,'submissionFileId','90','int'),(452,'submissionId','17','int'),(452,'username','msmith','string'),(453,'fileId','44','int'),(453,'fileStage','2','int'),(453,'name','Introduction.pdf','string'),(453,'submissionFileId','90','int'),(453,'submissionId','17','int'),(453,'username','msmith','string'),(454,'fileId','44','int'),(454,'fileStage','2','int'),(454,'originalFileName','Introduction.pdf','string'),(454,'sourceSubmissionFileId',NULL,'string'),(454,'submissionFileId','90','int'),(454,'submissionId','17','int'),(454,'username','msmith','string'),(455,'fileId','44','int'),(455,'fileStage','2','int'),(455,'name','Introduction.pdf','string'),(455,'originalFileName','Introduction.pdf','string'),(455,'sourceSubmissionFileId',NULL,'string'),(455,'submissionFileId','90','int'),(455,'submissionId','17','int'),(455,'username','msmith','string'),(456,'fileId','45','int'),(456,'fileStage','2','int'),(456,'originalFileName','The Emergence of Open Development in a N.pdf','string'),(456,'sourceSubmissionFileId',NULL,'string'),(456,'submissionFileId','91','int'),(456,'submissionId','17','int'),(456,'username','msmith','string'),(457,'fileId','45','int'),(457,'fileStage','2','int'),(457,'name','The Emergence of Open Development in a N.pdf','string'),(457,'submissionFileId','91','int'),(457,'submissionId','17','int'),(457,'username','msmith','string'),(458,'fileId','45','int'),(458,'fileStage','2','int'),(458,'originalFileName','The Emergence of Open Development in a N.pdf','string'),(458,'sourceSubmissionFileId',NULL,'string'),(458,'submissionFileId','91','int'),(458,'submissionId','17','int'),(458,'username','msmith','string'),(459,'fileId','45','int'),(459,'fileStage','2','int'),(459,'name','The Emergence of Open Development in a N.pdf','string'),(459,'originalFileName','The Emergence of Open Development in a N.pdf','string'),(459,'sourceSubmissionFileId',NULL,'string'),(459,'submissionFileId','91','int'),(459,'submissionId','17','int'),(459,'username','msmith','string'),(460,'fileId','46','int'),(460,'fileStage','2','int'),(460,'originalFileName','Enacting Openness in ICT4D Research.pdf','string'),(460,'sourceSubmissionFileId',NULL,'string'),(460,'submissionFileId','92','int'),(460,'submissionId','17','int'),(460,'username','msmith','string'),(461,'fileId','46','int'),(461,'fileStage','2','int'),(461,'name','Enacting Openness in ICT4D Research.pdf','string'),(461,'submissionFileId','92','int'),(461,'submissionId','17','int'),(461,'username','msmith','string'),(462,'fileId','46','int'),(462,'fileStage','2','int'),(462,'originalFileName','Enacting Openness in ICT4D Research.pdf','string'),(462,'sourceSubmissionFileId',NULL,'string'),(462,'submissionFileId','92','int'),(462,'submissionId','17','int'),(462,'username','msmith','string'),(463,'fileId','46','int'),(463,'fileStage','2','int'),(463,'name','Enacting Openness in ICT4D Research.pdf','string'),(463,'originalFileName','Enacting Openness in ICT4D Research.pdf','string'),(463,'sourceSubmissionFileId',NULL,'string'),(463,'submissionFileId','92','int'),(463,'submissionId','17','int'),(463,'username','msmith','string'),(464,'fileId','47','int'),(464,'fileStage','2','int'),(464,'originalFileName','Transparency and Development: Ethical Co.pdf','string'),(464,'sourceSubmissionFileId',NULL,'string'),(464,'submissionFileId','93','int'),(464,'submissionId','17','int'),(464,'username','msmith','string'),(465,'fileId','47','int'),(465,'fileStage','2','int'),(465,'name','Transparency and Development: Ethical Co.pdf','string'),(465,'submissionFileId','93','int'),(465,'submissionId','17','int'),(465,'username','msmith','string'),(466,'fileId','47','int'),(466,'fileStage','2','int'),(466,'originalFileName','Transparency and Development: Ethical Co.pdf','string'),(466,'sourceSubmissionFileId',NULL,'string'),(466,'submissionFileId','93','int'),(466,'submissionId','17','int'),(466,'username','msmith','string'),(467,'fileId','47','int'),(467,'fileStage','2','int'),(467,'name','Transparency and Development: Ethical Co.pdf','string'),(467,'originalFileName','Transparency and Development: Ethical Co.pdf','string'),(467,'sourceSubmissionFileId',NULL,'string'),(467,'submissionFileId','93','int'),(467,'submissionId','17','int'),(467,'username','msmith','string'),(468,'fileId','48','int'),(468,'fileStage','2','int'),(468,'originalFileName','Open Educational Resources: Opportunitie.pdf','string'),(468,'sourceSubmissionFileId',NULL,'string'),(468,'submissionFileId','94','int'),(468,'submissionId','17','int'),(468,'username','msmith','string'),(469,'fileId','48','int'),(469,'fileStage','2','int'),(469,'name','Open Educational Resources: Opportunitie.pdf','string'),(469,'submissionFileId','94','int'),(469,'submissionId','17','int'),(469,'username','msmith','string'),(470,'fileId','48','int'),(470,'fileStage','2','int'),(470,'originalFileName','Open Educational Resources: Opportunitie.pdf','string'),(470,'sourceSubmissionFileId',NULL,'string'),(470,'submissionFileId','94','int'),(470,'submissionId','17','int'),(470,'username','msmith','string'),(471,'fileId','48','int'),(471,'fileStage','2','int'),(471,'name','Open Educational Resources: Opportunitie.pdf','string'),(471,'originalFileName','Open Educational Resources: Opportunitie.pdf','string'),(471,'sourceSubmissionFileId',NULL,'string'),(471,'submissionFileId','94','int'),(471,'submissionId','17','int'),(471,'username','msmith','string'),(474,'decision','1','int'),(474,'editorId','3','int'),(474,'editorName','Daniel Barnes','string'),(474,'submissionId','17','int'),(475,'fileId','48','int'),(475,'fileStage','19','int'),(475,'originalFileName','Open Educational Resources: Opportunitie.pdf','string'),(475,'sourceSubmissionFileId','94','int'),(475,'submissionFileId','95','int'),(475,'submissionId','17','int'),(475,'username','dbarnes','string'),(476,'fileId','48','int'),(476,'fileStage','19','int'),(476,'name','Open Educational Resources: Opportunitie.pdf','string'),(476,'submissionFileId','95','int'),(476,'submissionId','17','int'),(476,'username','dbarnes','string'),(477,'fileId','47','int'),(477,'fileStage','19','int'),(477,'originalFileName','Transparency and Development: Ethical Co.pdf','string'),(477,'sourceSubmissionFileId','93','int'),(477,'submissionFileId','96','int'),(477,'submissionId','17','int'),(477,'username','dbarnes','string'),(478,'fileId','47','int'),(478,'fileStage','19','int'),(478,'name','Transparency and Development: Ethical Co.pdf','string'),(478,'submissionFileId','96','int'),(478,'submissionId','17','int'),(478,'username','dbarnes','string'),(479,'fileId','46','int'),(479,'fileStage','19','int'),(479,'originalFileName','Enacting Openness in ICT4D Research.pdf','string'),(479,'sourceSubmissionFileId','92','int'),(479,'submissionFileId','97','int'),(479,'submissionId','17','int'),(479,'username','dbarnes','string'),(480,'fileId','46','int'),(480,'fileStage','19','int'),(480,'name','Enacting Openness in ICT4D Research.pdf','string'),(480,'submissionFileId','97','int'),(480,'submissionId','17','int'),(480,'username','dbarnes','string'),(481,'fileId','45','int'),(481,'fileStage','19','int'),(481,'originalFileName','The Emergence of Open Development in a N.pdf','string'),(481,'sourceSubmissionFileId','91','int'),(481,'submissionFileId','98','int'),(481,'submissionId','17','int'),(481,'username','dbarnes','string'),(482,'fileId','45','int'),(482,'fileStage','19','int'),(482,'name','The Emergence of Open Development in a N.pdf','string'),(482,'submissionFileId','98','int'),(482,'submissionId','17','int'),(482,'username','dbarnes','string'),(483,'fileId','44','int'),(483,'fileStage','19','int'),(483,'originalFileName','Introduction.pdf','string'),(483,'sourceSubmissionFileId','90','int'),(483,'submissionFileId','99','int'),(483,'submissionId','17','int'),(483,'username','dbarnes','string'),(484,'fileId','44','int'),(484,'fileStage','19','int'),(484,'name','Introduction.pdf','string'),(484,'submissionFileId','99','int'),(484,'submissionId','17','int'),(484,'username','dbarnes','string'),(485,'fileId','43','int'),(485,'fileStage','19','int'),(485,'originalFileName','Preface.pdf','string'),(485,'sourceSubmissionFileId','89','int'),(485,'submissionFileId','100','int'),(485,'submissionId','17','int'),(485,'username','dbarnes','string'),(486,'fileId','43','int'),(486,'fileStage','19','int'),(486,'name','Preface.pdf','string'),(486,'submissionFileId','100','int'),(486,'submissionId','17','int'),(486,'username','dbarnes','string'),(487,'reviewAssignmentId','24','int'),(487,'reviewerName','Julie Janssen','string'),(487,'round','1','int'),(487,'stageId','2','int'),(487,'submissionId','17','int'),(488,'reviewAssignmentId','25','int'),(488,'reviewerName','Paul Hudson','string'),(488,'round','1','int'),(488,'stageId','2','int'),(488,'submissionId','17','int');
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'presses/1/monographs/1/6358e16aed2f5.pdf','application/pdf'),(2,'presses/1/monographs/2/6358e1a92c3e3.pdf','application/pdf'),(3,'presses/1/monographs/2/6358e1aabb72b.pdf','application/pdf'),(4,'presses/1/monographs/2/6358e1ac62275.pdf','application/pdf'),(5,'presses/1/monographs/2/6358e1ae01a45.pdf','application/pdf'),(6,'presses/1/monographs/3/6358e225dcea5.pdf','application/pdf'),(7,'presses/1/monographs/4/6358e24b3f8a5.pdf','application/pdf'),(8,'presses/1/monographs/4/6358e24ccaafb.pdf','application/pdf'),(9,'presses/1/monographs/4/6358e24e65473.pdf','application/pdf'),(10,'presses/1/monographs/4/6358e25009ba9.pdf','application/pdf'),(11,'presses/1/monographs/5/6358e2e5b161d.pdf','application/pdf'),(12,'presses/1/monographs/6/6358e372d3cfe.pdf','application/pdf'),(13,'presses/1/monographs/6/6358e3746ff30.pdf','application/pdf'),(14,'presses/1/monographs/6/6358e3760bbd8.pdf','application/pdf'),(15,'presses/1/monographs/6/6358e3779ecea.pdf','application/pdf'),(16,'presses/1/monographs/7/6358e3e7c97e8.pdf','application/pdf'),(17,'presses/1/monographs/7/6358e3e963011.pdf','application/pdf'),(18,'presses/1/monographs/7/6358e3eaf0f84.pdf','application/pdf'),(19,'presses/1/monographs/7/6358e3ec970cf.pdf','application/pdf'),(20,'presses/1/monographs/7/6358e3ee36fac.pdf','application/pdf'),(21,'presses/1/monographs/8/6358e46eb1573.pdf','application/pdf'),(22,'presses/1/monographs/9/6358e47d8b022.pdf','application/pdf'),(23,'presses/1/monographs/9/6358e47f22cf5.pdf','application/pdf'),(24,'presses/1/monographs/9/6358e480b3713.pdf','application/pdf'),(25,'presses/1/monographs/9/6358e4824f72a.pdf','application/pdf'),(26,'presses/1/monographs/9/6358e48417290.pdf','application/pdf'),(27,'presses/1/monographs/10/6358e4e6bba8f.pdf','application/pdf'),(28,'presses/1/monographs/11/6358e52038d99.pdf','application/pdf'),(29,'presses/1/monographs/12/6358e592a340a.pdf','application/pdf'),(30,'presses/1/monographs/12/6358e5943a92c.pdf','application/pdf'),(31,'presses/1/monographs/12/6358e595cedaa.pdf','application/pdf'),(32,'presses/1/monographs/13/6358e6178977c.pdf','application/pdf'),(33,'presses/1/monographs/13/6358e619218f6.pdf','application/pdf'),(34,'presses/1/monographs/13/6358e61aafeea.pdf','application/pdf'),(35,'presses/1/monographs/14/6358e6be23cce.pdf','application/pdf'),(36,'presses/1/monographs/14/6358e6bfb03f0.pdf','application/pdf'),(37,'presses/1/monographs/14/6358e6c14eb50.pdf','application/pdf'),(38,'presses/1/monographs/14/6358e6c2eb863.pdf','application/pdf'),(39,'presses/1/monographs/14/6358e6c4926ee.pdf','application/pdf'),(40,'presses/1/monographs/14/6358e6c6b04b4.pdf','application/pdf'),(41,'presses/1/monographs/15/6358e79dd71ab.pdf','application/pdf'),(42,'presses/1/monographs/16/6358e7cbc519e.pdf','application/pdf'),(43,'presses/1/monographs/17/6358e826cc0cf.pdf','application/pdf'),(44,'presses/1/monographs/17/6358e8286a2ae.pdf','application/pdf'),(45,'presses/1/monographs/17/6358e82a03968.pdf','application/pdf'),(46,'presses/1/monographs/17/6358e82b96e38.pdf','application/pdf'),(47,'presses/1/monographs/17/6358e82d532b3.pdf','application/pdf'),(48,'presses/1/monographs/17/6358e82f0c488.pdf','application/pdf');
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
INSERT INTO `job_batches` VALUES ('97977d29-30b2-47bd-91d1-9066e6305b57','',0,0,0,'[]','a:0:{}',NULL,1666768957,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
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
-- Table structure for table `mailable_templates`
--

DROP TABLE IF EXISTS `mailable_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailable_templates` (
  `email_id` bigint(20) NOT NULL,
  `mailable_id` varchar(255) NOT NULL,
  PRIMARY KEY (`email_id`,`mailable_id`),
  KEY `mailable_templates_email_id` (`email_id`),
  CONSTRAINT `mailable_templates_email_id_foreign` FOREIGN KEY (`email_id`) REFERENCES `email_templates` (`email_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailable_templates`
--

LOCK TABLES `mailable_templates` WRITE;
/*!40000 ALTER TABLE `mailable_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailable_templates` ENABLE KEYS */;
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
INSERT INTO `notes` VALUES (1,1048586,1,6,'2022-10-26 07:37:50','2022-10-26 07:37:50','Editor Recommendation','<p>Dear Daniel Barnes, David Buskins,</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission The Information Literacy User’s Guide.</p><p>My recommendation is:<br />Accept Submission.</p><p>Please visit the submission\'s <a href=\"http://localhost/index.php/publicknowledge/workflow/access/6\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>Minoti Inoue</p>');
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
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (11,1,3,2,16777217,'2022-10-26 07:27:55',NULL,1048585,1),(12,1,0,2,16777243,'2022-10-26 07:27:55',NULL,1048585,1),(13,1,0,2,16777245,'2022-10-26 07:27:55',NULL,1048585,1),(14,1,0,2,16777236,'2022-10-26 07:28:06','2022-10-26 07:28:10',523,1),(15,1,12,3,16777227,'2022-10-26 07:28:16',NULL,517,1),(17,1,19,2,16777230,'2022-10-26 07:28:21',NULL,1048585,1),(18,1,3,2,16777251,'2022-10-26 07:28:21','2022-10-26 07:28:25',1048585,1),(35,1,3,2,16777217,'2022-10-26 07:29:55',NULL,1048585,2),(36,1,0,2,16777243,'2022-10-26 07:29:55',NULL,1048585,2),(37,1,0,2,16777245,'2022-10-26 07:29:55',NULL,1048585,2),(38,1,0,2,16777236,'2022-10-26 07:30:12','2022-10-26 07:30:18',523,2),(39,1,11,3,16777227,'2022-10-26 07:30:24',NULL,517,2),(41,1,12,3,16777227,'2022-10-26 07:30:33',NULL,517,3),(48,1,3,2,16777217,'2022-10-26 07:31:12',NULL,1048585,3),(49,1,0,2,16777243,'2022-10-26 07:31:12',NULL,1048585,3),(50,1,0,2,16777245,'2022-10-26 07:31:12',NULL,1048585,3),(62,1,3,2,16777217,'2022-10-26 07:32:17',NULL,1048585,4),(63,1,0,2,16777243,'2022-10-26 07:32:17',NULL,1048585,4),(64,1,0,2,16777245,'2022-10-26 07:32:17','2022-10-26 07:33:31',1048585,4),(65,1,0,2,16777236,'2022-10-26 07:32:32','2022-10-26 07:32:37',523,3),(67,1,9,3,16777227,'2022-10-26 07:32:43',NULL,517,4),(69,1,0,2,16777236,'2022-10-26 07:32:50','2022-10-26 07:32:55',523,4),(71,1,11,3,16777227,'2022-10-26 07:33:01',NULL,517,5),(76,1,22,2,16777235,'2022-10-26 07:33:26',NULL,1048585,4),(77,1,3,2,16777254,'2022-10-26 07:33:26',NULL,1048585,4),(85,1,3,2,16777217,'2022-10-26 07:34:28',NULL,1048585,5),(88,1,0,2,16777236,'2022-10-26 07:34:41','2022-10-26 07:34:46',523,5),(90,1,8,3,16777227,'2022-10-26 07:34:51',NULL,517,6),(92,1,0,2,16777236,'2022-10-26 07:34:56','2022-10-26 07:35:01',523,6),(94,1,12,3,16777227,'2022-10-26 07:35:07',NULL,517,7),(99,1,23,2,16777235,'2022-10-26 07:35:29',NULL,1048585,5),(100,1,3,2,16777254,'2022-10-26 07:35:29',NULL,1048585,5),(103,1,0,2,16777246,'2022-10-26 07:36:06',NULL,1048585,5),(115,1,3,2,16777217,'2022-10-26 07:37:09',NULL,1048585,6),(116,1,4,2,16777217,'2022-10-26 07:37:09',NULL,1048585,6),(117,1,0,2,16777243,'2022-10-26 07:37:09',NULL,1048585,6),(118,1,0,2,16777245,'2022-10-26 07:37:09',NULL,1048585,6),(119,1,0,2,16777236,'2022-10-26 07:37:25','2022-10-26 07:37:31',523,7),(120,1,24,2,16777229,'2022-10-26 07:37:25',NULL,1048585,6),(122,1,3,3,16777249,'2022-10-26 07:37:50',NULL,1048586,1),(123,1,4,3,16777249,'2022-10-26 07:37:50',NULL,1048586,1),(138,1,3,2,16777217,'2022-10-26 07:39:29',NULL,1048585,7),(139,1,0,2,16777243,'2022-10-26 07:39:29',NULL,1048585,7),(140,1,0,2,16777245,'2022-10-26 07:39:29',NULL,1048585,7),(141,1,0,2,16777236,'2022-10-26 07:39:46','2022-10-26 07:39:52',523,8),(142,1,10,3,16777227,'2022-10-26 07:39:58',NULL,517,8),(144,1,25,2,16777230,'2022-10-26 07:40:05',NULL,1048585,7),(145,1,3,2,16777251,'2022-10-26 07:40:05','2022-10-26 07:40:10',1048585,7),(147,1,3,2,16777217,'2022-10-26 07:40:34',NULL,1048585,8),(148,1,0,2,16777243,'2022-10-26 07:40:34',NULL,1048585,8),(149,1,0,2,16777245,'2022-10-26 07:40:34',NULL,1048585,8),(164,1,3,2,16777217,'2022-10-26 07:41:54',NULL,1048585,9),(165,1,4,2,16777217,'2022-10-26 07:41:54',NULL,1048585,9),(166,1,0,2,16777243,'2022-10-26 07:41:54',NULL,1048585,9),(167,1,0,2,16777245,'2022-10-26 07:41:54',NULL,1048585,9),(168,1,0,2,16777236,'2022-10-26 07:42:13','2022-10-26 07:42:20',523,9),(169,1,26,2,16777229,'2022-10-26 07:42:13',NULL,1048585,9),(179,1,3,2,16777217,'2022-10-26 07:43:16',NULL,1048585,10),(180,1,0,2,16777243,'2022-10-26 07:43:16',NULL,1048585,10),(181,1,0,2,16777245,'2022-10-26 07:43:16',NULL,1048585,10),(184,1,3,2,16777217,'2022-10-26 07:43:40',NULL,1048585,11),(185,1,0,2,16777243,'2022-10-26 07:43:40',NULL,1048585,11),(186,1,0,2,16777245,'2022-10-26 07:43:40',NULL,1048585,11),(187,1,0,2,16777236,'2022-10-26 07:43:53','2022-10-26 07:43:57',523,10),(189,1,9,3,16777227,'2022-10-26 07:44:03',NULL,517,9),(191,1,0,2,16777236,'2022-10-26 07:44:07','2022-10-26 07:44:11',523,11),(197,1,3,2,16777219,'2022-10-26 07:44:36',NULL,517,10),(198,1,3,2,16777219,'2022-10-26 07:44:47',NULL,517,11),(199,1,28,2,16777230,'2022-10-26 07:45:06',NULL,1048585,11),(200,1,3,2,16777251,'2022-10-26 07:45:06','2022-10-26 07:45:11',1048585,11),(214,1,3,2,16777217,'2022-10-26 07:46:23',NULL,1048585,12),(215,1,0,2,16777243,'2022-10-26 07:46:23',NULL,1048585,12),(216,1,0,2,16777245,'2022-10-26 07:46:23',NULL,1048585,12),(217,1,0,2,16777236,'2022-10-26 07:46:41','2022-10-26 07:46:46',523,12),(218,1,29,2,16777229,'2022-10-26 07:46:41',NULL,1048585,12),(219,1,7,3,16777227,'2022-10-26 07:46:52',NULL,517,12),(223,1,9,3,16777227,'2022-10-26 07:47:09',NULL,517,14),(225,1,3,2,16777219,'2022-10-26 07:47:22',NULL,517,13),(235,1,3,2,16777217,'2022-10-26 07:48:17',NULL,1048585,13),(236,1,0,2,16777243,'2022-10-26 07:48:17',NULL,1048585,13),(237,1,0,2,16777245,'2022-10-26 07:48:17',NULL,1048585,13),(238,1,0,2,16777236,'2022-10-26 07:48:33','2022-10-26 07:48:38',523,13),(240,1,8,3,16777227,'2022-10-26 07:48:43',NULL,517,15),(242,1,0,2,16777236,'2022-10-26 07:48:49','2022-10-26 07:48:54',523,14),(246,1,11,3,16777227,'2022-10-26 07:49:08',NULL,517,17),(250,1,3,2,16777219,'2022-10-26 07:49:28',NULL,517,16),(251,1,3,2,16777219,'2022-10-26 07:49:41',NULL,517,18),(252,1,30,2,16777230,'2022-10-26 07:50:04',NULL,1048585,13),(253,1,3,2,16777251,'2022-10-26 07:50:04','2022-10-26 07:50:09',1048585,13),(264,1,3,2,16777217,'2022-10-26 07:51:17',NULL,1048585,14),(267,1,0,2,16777236,'2022-10-26 07:51:35','2022-10-26 07:51:42',523,15),(269,1,7,3,16777227,'2022-10-26 07:51:47',NULL,517,19),(271,1,0,2,16777236,'2022-10-26 07:51:54','2022-10-26 07:52:00',523,16),(273,1,11,3,16777227,'2022-10-26 07:52:06',NULL,517,20),(278,1,31,2,16777235,'2022-10-26 07:52:32',NULL,1048585,14),(279,1,3,2,16777254,'2022-10-26 07:52:33',NULL,1048585,14),(282,1,0,2,16777246,'2022-10-26 07:53:53',NULL,1048585,14),(286,1,3,2,16777217,'2022-10-26 07:54:22',NULL,1048585,15),(287,1,0,2,16777243,'2022-10-26 07:54:22',NULL,1048585,15),(288,1,0,2,16777245,'2022-10-26 07:54:22',NULL,1048585,15),(289,1,0,2,16777236,'2022-10-26 07:54:37','2022-10-26 07:54:41',523,17),(295,1,3,2,16777217,'2022-10-26 07:55:16',NULL,1048585,16),(296,1,0,2,16777243,'2022-10-26 07:55:16',NULL,1048585,16),(297,1,0,2,16777245,'2022-10-26 07:55:16',NULL,1048585,16),(298,1,0,2,16777236,'2022-10-26 07:55:33','2022-10-26 07:55:37',523,18),(301,1,11,3,16777227,'2022-10-26 07:55:50',NULL,517,22),(303,1,12,3,16777227,'2022-10-26 07:55:58',NULL,517,23),(305,1,3,2,16777219,'2022-10-26 07:56:10',NULL,517,21),(325,1,3,2,16777217,'2022-10-26 07:58:05',NULL,1048585,17),(326,1,0,2,16777243,'2022-10-26 07:58:05',NULL,1048585,17),(327,1,0,2,16777245,'2022-10-26 07:58:05',NULL,1048585,17),(328,1,0,2,16777236,'2022-10-26 07:58:27','2022-10-26 07:58:35',523,19),(329,1,34,2,16777229,'2022-10-26 07:58:28',NULL,1048585,17),(330,1,7,3,16777227,'2022-10-26 07:58:41',NULL,517,24),(332,1,8,3,16777227,'2022-10-26 07:58:51',NULL,517,25);
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
INSERT INTO `press_settings` VALUES (1,'','contactEmail','rvaca@mailinator.com',NULL),(1,'','contactName','Ramiro Vaca',NULL),(1,'','country','IS',NULL),(1,'','coverThumbnailsMaxHeight','100',NULL),(1,'','coverThumbnailsMaxWidth','106',NULL),(1,'','defaultReviewMode','2',NULL),(1,'','disableSubmissions','0',NULL),(1,'','doiCreationTime','copyEditCreationTime',NULL),(1,'','doiSuffixType','default',NULL),(1,'','emailSignature','<br/><hr /><br/><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto: {$contactEmail}\">{$contactEmail}</a></p>',NULL),(1,'','enableDois','1',NULL),(1,'','enableGeoUsageStats','',NULL),(1,'','enableInstitutionUsageStats','0',NULL),(1,'','isSushiApiPublic','1',NULL),(1,'','itemsPerPage','25',NULL),(1,'','keywords','request',NULL),(1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada',NULL),(1,'','notifyAllAuthors','1',NULL),(1,'','numPageLinks','10',NULL),(1,'','numWeeksPerResponse','4',NULL),(1,'','numWeeksPerReview','4',NULL),(1,'','paymentPluginName','ManualPayment',NULL),(1,'','registrationAgency','',NULL),(1,'','supportedFormLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedSubmissionLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportEmail','rvaca@mailinator.com',NULL),(1,'','supportName','Ramiro Vaca',NULL),(1,'','themePluginPath','default',NULL),(1,'','type','enable',NULL),(1,'en_US','acronym','JPK',NULL),(1,'en_US','authorInformation','Interested in submitting to this press? We recommend that you review the <a href=\"http://localhost/index.php/publicknowledge/about\">About the Press</a> page for the press\' section policies and <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.php/publicknowledge/user/register\">register</a> with the press prior to submitting, or if already registered can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the 5 step process.',NULL),(1,'en_US','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">',NULL),(1,'en_US','librarianInformation','We encourage research librarians to list this press among their library\'s electronic press holdings. As well, this open source publishing system is suitable for libraries to host for their faculty members to use with presses they are involved in editing (see <a href=\"https://pkp.sfu.ca/omp\">Open Monograph Press</a>).',NULL),(1,'en_US','name','Public Knowledge Press',NULL),(1,'en_US','openAccessPolicy','This press provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),(1,'en_US','privacyStatement','<p>The names and email addresses entered in this press site will be used exclusively for the stated purposes of this press and will not be made available for any other purpose or to any other party.</p>',NULL),(1,'en_US','readerInformation','We encourage readers to sign up for the publishing notification service for this press. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the homepage for the press. This registration will result in the reader receiving the Table of Contents by email for each new monograph of the press. This list also allows the press to claim a certain level of support or readership. See the press <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a> which assures readers that their name and email address will not be used for other purposes.',NULL),(1,'en_US','searchDescription','Public Knowledge Press is a publisher dedicated to the subject of public access to science.',NULL),(1,'en_US','submissionChecklist','[{\"order\":1,\"content\":\"The submission has not been previously published, nor is it before another press for consideration (or an explanation has been provided in Comments to the Editor).\"},{\"order\":2,\"content\":\"The submission file is in the Microsoft Word, RTF, or OpenDocument file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":4,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the <a href=\\\"http:\\/\\/localhost\\/index.php\\/publicknowledge\\/about\\/submissions#authorGuidelines\\\" target=\\\"_blank\\\">Author Guidelines<\\/a>, which is found in About the Press.\"}]',NULL),(1,'fr_CA','authorInformation','Vous souhaitez soumettre une contribution à cette presse ? Nous vous recommandons de lire la page\n <a href=\"http://localhost/index.php/publicknowledge/about\">À propos de cette presse</a> pour connaitre ses règlements et la page\n <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Lignes directrices à l\'intention des auteurs-es</a>. Les auteurs-es doivent <a href=\"http://localhost/index.php/publicknowledge/user/register\">s\'inscrire</a> auprès de la presse avant d\'envoyer une soumission. Si vous êtes déjà inscrit-e, il suffit simplement <a href=\"http://localhost/index.php/index/login\">d\'ouvrir une session</a> pour débuter la procédure en 5 étapes.',NULL),(1,'fr_CA','librarianInformation','Nous encourageons les bibliothécaires de recherche à ajouter cette presse à la liste électronique des ressources documentaires de la bibliothèque. De plus, ce système d\'édition à libre accès convient à toutes les bibliothèques et permet aux membres des facultés de l\'utiliser pour les presses auxquelles ils contribuent à titre de rédacteur en chef. (voir <a href=\"http://pkp.sfu.ca/omp\">Open Monograph Press</a>).',NULL),(1,'fr_CA','name','Press de la connaissance du public',NULL),(1,'fr_CA','openAccessPolicy','Cette presse offre un accès libre immédiat à son contenu en partant du principe que la recherche doit être accessible au grand public, car cela favorise un meilleur échange des connaissances à l\'échelle mondiale.',NULL),(1,'fr_CA','privacyStatement','<p>Les noms et adresses courriel saisis sur ce site de presse seront utilisés exclusivement pour les fins convenues de cette presse. Ils ne seront pas utilisés pour d\'autres fins ou transmis à une tierce partie.</p>',NULL),(1,'fr_CA','readerInformation','Nous encourageons les lecteurs à s\'abonner au service d\'avis de publication de cette presse. Utilisez le lien <a href=\"http://localhost/index.php/publicknowledge/user/register\">d\'inscription</a> situé en haut de la page d\'accueil de la presse. Cette inscription permettra au lecteur de recevoir la table des matières de chaque nouvelle monographie de cette presse par courriel. Cette liste permet également à la presse d\'affirmer qu\'elle compte un certain nombre de lecteurs. Consultez <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">l\'énoncé de confidentialité </a> de la presse, lequel stipule que les noms et adresses courriel de ses lecteurs ne seront pas utilisés à d\'autres fins.',NULL),(1,'fr_CA','submissionChecklist','[{\"order\":1,\"content\":\"Cette soumission n\'a jamais été publiée et n\'a pas été soumise à une autre presse (ou une explication a été ajoutée à la section Commentaires du rédacteur en chef).\"},{\"order\":2,\"content\":\"Le fichier soumis est de format Microsoft Word, RTF ou OpenDocument.\"},{\"order\":3,\"content\":\"Les adresses URL des références ont été fournies si elles étaient disponibles.\"},{\"order\":4,\"content\":\"Le texte est publié à simple interligne ; utiliser une police de caractères de 12 points ; utiliser des caractères italiques au lieu de souligner (sauf pour les adresses URL) ; et toutes les illustrations, figures et tableaux doivent être insérés dans le texte aux endroits appropriés plutôt qu\'à la fin.\"},{\"order\":5,\"content\":\"Le texte respecte les exigences stylistiques et bibliographiques conformément aux <a href=\\\"http:\\/\\/localhost\\/index.php\\/publicknowledge\\/about\\/submissions#authorGuidelines\\\" target=\\\"_blank\\\">lignes directrices à l\'intention des auteurs<\\/a>, disponibles dans la rubrique À propos de cette presse.\"}]',NULL);
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
INSERT INTO `publication_settings` VALUES (1,'','categoryIds','[]'),(1,'en_US','abstract','<p>The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities―and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.</p>'),(1,'en_US','prefix',''),(1,'en_US','subtitle',''),(1,'en_US','title','The ABCs of Human Survival: A Paradigm for Global Citizenship'),(1,'fr_CA','abstract',''),(1,'fr_CA','prefix',''),(1,'fr_CA','subtitle',''),(1,'fr_CA','title',''),(2,'','categoryIds','[]'),(2,'en_US','abstract','<p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p>'),(2,'en_US','prefix',''),(2,'en_US','subtitle',''),(2,'en_US','title','The West and Beyond: New Perspectives on an Imagined Region'),(2,'fr_CA','abstract',''),(2,'fr_CA','prefix',''),(2,'fr_CA','subtitle',''),(2,'fr_CA','title',''),(3,'','categoryIds','[]'),(3,'en_US','abstract','<p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.</p>'),(3,'en_US','prefix',''),(3,'en_US','subtitle',''),(3,'en_US','title','The Political Economy of Workplace Injury in Canada'),(3,'fr_CA','abstract',''),(3,'fr_CA','prefix',''),(3,'fr_CA','subtitle',''),(3,'fr_CA','title',''),(4,'','categoryIds','[]'),(4,'en_US','abstract','<p>What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.</p>'),(4,'en_US','prefix',''),(4,'en_US','subtitle',''),(4,'en_US','title','How Canadians Communicate: Contexts of Canadian Popular Culture'),(4,'fr_CA','abstract',''),(4,'fr_CA','prefix',''),(4,'fr_CA','subtitle',''),(4,'fr_CA','title',''),(5,'','categoryIds','[]'),(5,'','copyrightYear','2022'),(5,'en_US','abstract','<p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.</p>'),(5,'en_US','copyrightHolder','Public Knowledge Press'),(5,'en_US','prefix',''),(5,'en_US','subtitle',''),(5,'en_US','title','Bomb Canada and Other Unkind Remarks in the American Media'),(5,'fr_CA','abstract',''),(5,'fr_CA','copyrightHolder','Press de la connaissance du public'),(5,'fr_CA','prefix',''),(5,'fr_CA','subtitle',''),(5,'fr_CA','title',''),(6,'','categoryIds','[]'),(6,'en_US','abstract','<p>Good researchers have a host of tools at their disposal that make navigating today’s complex information ecosystem much more manageable. Gaining the knowledge, abilities, and self-reflection necessary to be a good researcher helps not only in academic settings, but is invaluable in any career, and throughout one’s life. The Information Literacy User’s Guide will start you on this route to success.</p>'),(6,'en_US','prefix',''),(6,'en_US','subtitle',''),(6,'en_US','title','The Information Literacy User’s Guide'),(6,'fr_CA','abstract',''),(6,'fr_CA','prefix',''),(6,'fr_CA','subtitle',''),(6,'fr_CA','title',''),(7,'','categoryIds','[]'),(7,'en_US','abstract','<p>Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.</p>'),(7,'en_US','prefix',''),(7,'en_US','subtitle',''),(7,'en_US','title','Accessible Elements: Teaching Science Online and at a Distance'),(7,'fr_CA','abstract',''),(7,'fr_CA','prefix',''),(7,'fr_CA','subtitle',''),(7,'fr_CA','title',''),(8,'','categoryIds','[]'),(8,'en_US','abstract','<p>A Note From The Publisher</p>'),(8,'en_US','prefix',''),(8,'en_US','subtitle',''),(8,'en_US','title','Editorial'),(8,'fr_CA','abstract',''),(8,'fr_CA','prefix',''),(8,'fr_CA','subtitle',''),(8,'fr_CA','title',''),(9,'','categoryIds','[]'),(9,'en_US','abstract','<p>In recent years, the Internet and other network technologies have emerged as a central issue for development in Latin America and the Caribbean. They have shown their potential to increase productivity and economic competitiveness, to create new ways to deliver education and health services, and to be driving forces for the modernization of the provision of public services.</p>'),(9,'en_US','prefix',''),(9,'en_US','subtitle',''),(9,'en_US','title','Enabling Openness: The future of the information society in Latin America and the Caribbean'),(9,'fr_CA','abstract',''),(9,'fr_CA','prefix',''),(9,'fr_CA','subtitle',''),(9,'fr_CA','title',''),(10,'','categoryIds','[]'),(10,'en_US','abstract','<p>While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.</p>'),(10,'en_US','prefix',''),(10,'en_US','subtitle',''),(10,'en_US','title','Lost Tracks: Buffalo National Park, 1909-1939'),(10,'fr_CA','abstract',''),(10,'fr_CA','prefix',''),(10,'fr_CA','subtitle',''),(10,'fr_CA','title',''),(11,'','categoryIds','[]'),(11,'en_US','abstract','<p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.</p>'),(11,'en_US','prefix',''),(11,'en_US','subtitle',''),(11,'en_US','title','Dreamwork'),(11,'fr_CA','abstract',''),(11,'fr_CA','prefix',''),(11,'fr_CA','subtitle',''),(11,'fr_CA','title',''),(12,'','categoryIds','[]'),(12,'en_US','abstract','<p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.</p>'),(12,'en_US','prefix',''),(12,'en_US','subtitle',''),(12,'en_US','title','Connecting ICTs to Development'),(12,'fr_CA','abstract',''),(12,'fr_CA','prefix',''),(12,'fr_CA','subtitle',''),(12,'fr_CA','title',''),(13,'','categoryIds','[]'),(13,'en_US','abstract','<p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.</p>'),(13,'en_US','prefix',''),(13,'en_US','subtitle',''),(13,'en_US','title','Mobile Learning: Transforming the Delivery of Education and Training'),(13,'fr_CA','abstract',''),(13,'fr_CA','prefix',''),(13,'fr_CA','subtitle',''),(13,'fr_CA','title',''),(14,'','categoryIds','[]'),(14,'','copyrightYear','2022'),(14,'en_US','abstract','<p>From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.</p>'),(14,'en_US','copyrightHolder','Public Knowledge Press'),(14,'en_US','prefix',''),(14,'en_US','subtitle',''),(14,'en_US','title','From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots'),(14,'fr_CA','abstract',''),(14,'fr_CA','copyrightHolder','Press de la connaissance du public'),(14,'fr_CA','prefix',''),(14,'fr_CA','subtitle',''),(14,'fr_CA','title',''),(15,'','categoryIds','[]'),(15,'en_US','abstract','<p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.</p>'),(15,'en_US','prefix',''),(15,'en_US','subtitle',''),(15,'en_US','title','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978'),(15,'fr_CA','abstract',''),(15,'fr_CA','prefix',''),(15,'fr_CA','subtitle',''),(15,'fr_CA','title',''),(16,'','categoryIds','[]'),(16,'en_US','abstract','<p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.</p>'),(16,'en_US','prefix',''),(16,'en_US','subtitle',''),(16,'en_US','title','A Designer\'s Log: Case Studies in Instructional Design'),(16,'fr_CA','abstract',''),(16,'fr_CA','prefix',''),(16,'fr_CA','subtitle',''),(16,'fr_CA','title',''),(17,'','categoryIds','[]'),(17,'en_US','abstract','<p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.</p>'),(17,'en_US','prefix',''),(17,'en_US','subtitle',''),(17,'en_US','title','Open Development: Networked Innovations in International Development'),(17,'fr_CA','abstract',''),(17,'fr_CA','prefix',''),(17,'fr_CA','subtitle',''),(17,'fr_CA','title','');
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
INSERT INTO `publications` VALUES (1,NULL,'2022-10-26 07:27:54',NULL,'pub','publication',0.00,NULL,NULL,1,1,NULL,1,NULL),(2,NULL,'2022-10-26 07:29:53',NULL,'pub','publication',0.00,NULL,NULL,2,1,NULL,1,NULL),(3,NULL,'2022-10-26 07:31:10',NULL,'pub','publication',0.00,NULL,NULL,3,1,NULL,1,NULL),(4,NULL,'2022-10-26 07:32:15',NULL,'pub','publication',0.00,3,NULL,4,1,NULL,1,NULL),(5,'2022-10-26','2022-10-26 07:36:06',NULL,'pub','publication',0.00,NULL,NULL,5,3,NULL,1,NULL),(6,NULL,'2022-10-26 07:37:07',NULL,'pub','publication',0.00,1,NULL,6,1,NULL,1,NULL),(7,NULL,'2022-10-26 07:39:27',NULL,'pub','publication',0.00,4,NULL,7,1,NULL,1,NULL),(8,NULL,'2022-10-26 07:40:33',NULL,'pub','publication',0.00,NULL,NULL,8,1,NULL,1,NULL),(9,NULL,'2022-10-26 07:41:52',NULL,'pub','publication',0.00,1,NULL,9,1,NULL,1,NULL),(10,NULL,'2022-10-26 07:43:14',NULL,'pub','publication',0.00,NULL,NULL,10,1,NULL,1,NULL),(11,NULL,'2022-10-26 07:43:39',NULL,'pub','publication',0.00,NULL,NULL,11,1,NULL,1,NULL),(12,NULL,'2022-10-26 07:46:21',NULL,'pub','publication',0.00,NULL,NULL,12,1,NULL,1,NULL),(13,NULL,'2022-10-26 07:48:15',NULL,'pub','publication',0.00,NULL,NULL,13,1,NULL,1,NULL),(14,'2022-10-26','2022-10-26 07:53:53',NULL,'pub','publication',0.00,5,NULL,14,3,NULL,1,NULL),(15,NULL,'2022-10-26 07:54:21',NULL,'pub','publication',0.00,NULL,NULL,15,1,NULL,1,NULL),(16,NULL,'2022-10-26 07:55:15',NULL,'pub','publication',0.00,NULL,NULL,16,1,NULL,1,NULL),(17,NULL,'2022-10-26 07:58:02',NULL,'pub','publication',0.00,NULL,NULL,17,1,NULL,1,NULL);
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
INSERT INTO `review_assignments` VALUES (1,1,12,NULL,NULL,'2022-10-26 07:28:16','2022-10-26 07:28:16',NULL,NULL,NULL,'2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:28:16',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,1,NULL,0,0),(2,2,11,NULL,NULL,'2022-10-26 07:30:24','2022-10-26 07:30:24',NULL,NULL,NULL,'2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:30:24',0,0,0,NULL,NULL,NULL,NULL,2,3,2,1,1,NULL,0,0),(3,2,12,NULL,NULL,'2022-10-26 07:30:33','2022-10-26 07:30:33',NULL,NULL,NULL,'2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:30:33',0,0,0,NULL,NULL,NULL,NULL,2,3,2,1,1,NULL,0,0),(4,4,9,NULL,NULL,'2022-10-26 07:32:43','2022-10-26 07:32:43',NULL,NULL,NULL,'2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:32:43',0,0,0,NULL,NULL,NULL,NULL,3,2,2,1,1,NULL,0,0),(5,4,11,NULL,NULL,'2022-10-26 07:33:01','2022-10-26 07:33:01',NULL,NULL,NULL,'2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:33:01',0,0,0,NULL,NULL,NULL,NULL,4,3,2,1,1,NULL,0,0),(6,5,8,NULL,NULL,'2022-10-26 07:34:51','2022-10-26 07:34:51',NULL,NULL,NULL,'2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:34:51',0,0,0,NULL,NULL,NULL,NULL,5,2,2,1,1,NULL,0,0),(7,5,12,NULL,NULL,'2022-10-26 07:35:07','2022-10-26 07:35:07',NULL,NULL,NULL,'2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:35:07',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,1,NULL,0,0),(8,7,10,NULL,NULL,'2022-10-26 07:39:58','2022-10-26 07:39:58',NULL,NULL,NULL,'2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:39:58',0,0,0,NULL,NULL,NULL,NULL,8,3,2,1,1,NULL,0,0),(9,11,9,NULL,NULL,'2022-10-26 07:44:03','2022-10-26 07:44:03',NULL,NULL,NULL,'2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:44:03',0,0,0,NULL,NULL,NULL,NULL,10,2,2,1,1,NULL,0,0),(10,11,10,NULL,0,'2022-10-26 07:44:17','2022-10-26 07:44:17','2022-10-26 07:44:32','2022-10-26 07:44:36','2022-10-26 07:45:06','2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:45:06',0,0,0,NULL,NULL,NULL,0,11,3,2,1,4,NULL,0,0),(11,11,12,NULL,0,'2022-10-26 07:44:25','2022-10-26 07:44:25','2022-10-26 07:44:43','2022-10-26 07:44:47','2022-10-26 07:45:06','2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:45:06',0,0,0,NULL,NULL,NULL,0,11,3,2,1,4,NULL,0,0),(12,12,7,NULL,NULL,'2022-10-26 07:46:52','2022-10-26 07:46:52',NULL,NULL,NULL,'2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:46:52',0,0,0,NULL,NULL,NULL,NULL,12,2,2,1,1,NULL,0,0),(13,12,8,NULL,0,'2022-10-26 07:47:01','2022-10-26 07:47:01','2022-10-26 07:47:18','2022-10-26 07:47:22',NULL,'2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:47:22',0,0,0,NULL,NULL,NULL,0,12,2,2,1,4,NULL,0,0),(14,12,9,NULL,NULL,'2022-10-26 07:47:09','2022-10-26 07:47:10',NULL,NULL,NULL,'2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:47:10',0,0,0,NULL,NULL,NULL,NULL,12,2,2,1,1,NULL,0,0),(15,13,8,NULL,NULL,'2022-10-26 07:48:43','2022-10-26 07:48:43',NULL,NULL,NULL,'2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:48:43',0,0,0,NULL,NULL,NULL,NULL,13,2,2,1,1,NULL,0,0),(16,13,10,NULL,0,'2022-10-26 07:48:59','2022-10-26 07:48:59','2022-10-26 07:49:24','2022-10-26 07:49:28','2022-10-26 07:50:04','2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:50:04',0,0,0,NULL,NULL,NULL,0,14,3,2,1,4,NULL,0,0),(17,13,11,NULL,NULL,'2022-10-26 07:49:08','2022-10-26 07:49:08',NULL,NULL,NULL,'2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:49:08',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,1,NULL,0,0),(18,13,12,NULL,0,'2022-10-26 07:49:16','2022-10-26 07:49:16','2022-10-26 07:49:37','2022-10-26 07:49:41','2022-10-26 07:50:04','2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:50:04',0,0,0,NULL,NULL,NULL,0,14,3,2,1,4,NULL,0,0),(19,14,7,NULL,NULL,'2022-10-26 07:51:47','2022-10-26 07:51:48',NULL,NULL,NULL,'2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:51:48',0,0,0,NULL,NULL,NULL,NULL,15,2,2,1,1,NULL,0,0),(20,14,11,NULL,NULL,'2022-10-26 07:52:06','2022-10-26 07:52:06',NULL,NULL,NULL,'2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:52:06',0,0,0,NULL,NULL,NULL,NULL,16,3,2,1,1,NULL,0,0),(21,16,10,NULL,0,'2022-10-26 07:55:43','2022-10-26 07:55:43','2022-10-26 07:56:06','2022-10-26 07:56:10',NULL,'2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:56:10',0,0,0,NULL,NULL,NULL,0,18,3,2,1,4,NULL,0,0),(22,16,11,NULL,NULL,'2022-10-26 07:55:50','2022-10-26 07:55:51',NULL,NULL,NULL,'2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:55:51',0,0,0,NULL,NULL,NULL,NULL,18,3,2,1,1,NULL,0,0),(23,16,12,NULL,NULL,'2022-10-26 07:55:58','2022-10-26 07:55:58',NULL,NULL,NULL,'2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:55:58',0,0,0,NULL,NULL,NULL,NULL,18,3,2,1,1,NULL,0,0),(24,17,7,NULL,NULL,'2022-10-26 07:58:41','2022-10-26 07:58:41',NULL,NULL,NULL,'2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:58:41',0,0,0,NULL,NULL,NULL,NULL,19,2,2,1,1,NULL,0,0),(25,17,8,NULL,NULL,'2022-10-26 07:58:51','2022-10-26 07:58:51',NULL,NULL,NULL,'2022-11-23 00:00:00','2022-11-23 00:00:00','2022-10-26 07:58:51',0,0,0,NULL,NULL,NULL,NULL,19,2,2,1,1,NULL,0,0);
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
INSERT INTO `review_files` VALUES (1,2),(2,7),(2,8),(2,9),(2,10),(3,7),(3,8),(3,9),(3,10),(4,16),(4,17),(4,18),(4,19),(6,21),(8,36),(8,37),(8,38),(8,39),(8,40),(9,54),(12,58),(12,59),(12,60),(13,58),(13,59),(13,60),(14,58),(14,59),(14,60),(15,64),(15,65),(15,66),(19,73),(19,74),(19,75),(19,76),(19,77),(19,78),(21,88),(22,88),(23,88),(24,95),(24,96),(24,97),(24,98),(24,99),(24,100),(25,95),(25,96),(25,97),(25,98),(25,99),(25,100);
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
INSERT INTO `review_round_files` VALUES (1,1,3,2),(2,2,3,7),(2,2,3,8),(2,2,3,9),(2,2,3,10),(4,3,2,16),(4,3,2,17),(4,3,2,18),(4,3,2,19),(5,5,2,21),(6,7,2,27),(6,7,2,28),(6,7,2,29),(6,7,2,30),(7,8,3,36),(7,8,3,37),(7,8,3,38),(7,8,3,39),(7,8,3,40),(9,9,2,47),(9,9,2,48),(9,9,2,49),(9,9,2,50),(9,9,2,51),(11,10,2,54),(12,12,2,58),(12,12,2,59),(12,12,2,60),(13,13,2,64),(13,13,2,65),(13,13,2,66),(14,15,2,73),(14,15,2,74),(14,15,2,75),(14,15,2,76),(14,15,2,77),(14,15,2,78),(15,17,3,86),(16,18,3,88),(17,19,2,95),(17,19,2,96),(17,19,2,97),(17,19,2,98),(17,19,2,99),(17,19,2,100);
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
INSERT INTO `scheduled_tasks` VALUES ('APP\\tasks\\UsageStatsLoader','2022-10-26 07:22:38'),('PKP\\task\\EditorialReminders','2022-10-26 07:22:38'),('PKP\\task\\ProcessQueueJobs','2022-10-26 07:22:38'),('PKP\\task\\PublishSubmissions','2022-10-26 07:22:37'),('PKP\\task\\RemoveUnvalidatedExpiredUsers','2022-10-26 07:22:37'),('PKP\\task\\ReviewReminder','2022-10-26 07:22:37'),('PKP\\task\\StatisticsReport','2022-10-26 07:22:37'),('PKP\\task\\UpdateIPGeoDB','2022-10-26 07:22:37');
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
INSERT INTO `sessions` VALUES ('01u0053ujssoc6dipnmu38tikd',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666769629,1666769669,0,'csrf|a:2:{s:9:\"timestamp\";i:1666769669;s:5:\"token\";s:32:\"742849897d7a2196cb21361b505a6a88\";}username|s:6:\"callan\";','localhost'),('07u7ogvgnskmie25vlh32776op',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770864,1666770882,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1666770882;s:5:\"token\";s:32:\"1b1ffbfbf93e397a107a9779b188f316\";}','localhost'),('1qkfipg063lr30vph4kqca30p1',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666769875,1666769884,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1666769884;s:5:\"token\";s:32:\"912d25e7c43c574a3d96acb959f53743\";}','localhost'),('1u0btu9a5apqg9tpqb0eiufv2k',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666769887,1666769970,0,'csrf|a:2:{s:9:\"timestamp\";i:1666769970;s:5:\"token\";s:32:\"fceb1d35e735b54a8ab229c4d73dc322\";}username|s:10:\"dkennepohl\";','localhost'),('2k4h0u964v3h3o1gtg33dom40v',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666768997,1666769003,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1666769004;s:5:\"token\";s:32:\"3877347efa4539522d34a88af49cb849\";}','localhost'),('30ve50vh02evffllrsgf23co58',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666768956,1666768981,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1666768981;s:5:\"token\";s:32:\"cc1a1083d287e07e16f91888742d1dd8\";}','localhost'),('3e1imhceiqqvp6j5vtj20lto9c',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770570,1666770582,0,'username|s:6:\"gfavio\";csrf|a:2:{s:9:\"timestamp\";i:1666770582;s:5:\"token\";s:32:\"e69ab65911ec85d25e5f75477632ab72\";}','localhost'),('3fdptes2eqoajvsfv3rvt0v7mq',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770432,1666770443,0,'username|s:7:\"phudson\";csrf|a:2:{s:9:\"timestamp\";i:1666770443;s:5:\"token\";s:32:\"47477e980434ad923961b8b053de6970\";}','localhost'),('3frha6rm0ehp9018po1tln487h',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770583,1666770611,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1666770611;s:5:\"token\";s:32:\"15f126de370598231fbb48cda3fea734\";}','localhost'),('3ofqtjmtrg5l73t3h54mme099e',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666769196,1666769205,0,'username|s:5:\"rvaca\";csrf|a:2:{s:9:\"timestamp\";i:1666769205;s:5:\"token\";s:32:\"b9da2cabfeb56b2dca008edfe54729ca\";}','localhost'),('6021ui4hn81n7t8if0ovd2gn25',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770498,1666770558,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1666770558;s:5:\"token\";s:32:\"bf6a101bcd05c701450d3ee9238a26e1\";}','localhost'),('6jj3kj8cam2tb5urp43gtvi9g9',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770199,1666770221,0,'csrf|a:2:{s:9:\"timestamp\";i:1666770221;s:5:\"token\";s:32:\"2896d1e1a5f0eebc5e16017bbcdb3d3c\";}username|s:10:\"jlockehart\";','localhost'),('76aqrrkhqr77f3atdeap7e08ro',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666769250,1666769276,0,'csrf|a:2:{s:9:\"timestamp\";i:1666769276;s:5:\"token\";s:32:\"62aa31f8584ca9ce43a15e7c06ba9006\";}username|s:6:\"aclark\";','localhost'),('83go1okd3qn1vqf4es664blehe',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666769024,1666769196,0,'username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1666769195;s:5:\"token\";s:32:\"d186221ade381e46fcb445d9dc79f4a6\";}','localhost'),('8m3v0a8fpjavrnirchb0imsmq0',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666769005,1666769012,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1666769012;s:5:\"token\";s:32:\"e90626b51e5ad882624027f9ed9ef23d\";}','localhost'),('9087hlk37ch87aq3v5bmufrpok',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770837,1666770863,0,'csrf|a:2:{s:9:\"timestamp\";i:1666770863;s:5:\"token\";s:32:\"af7969dc5e227e7bbc0e01010c782e5e\";}username|s:6:\"mforan\";','localhost'),('bb0boqrvtkp9tlc583k8nh7rtr',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770558,1666770569,0,'username|s:8:\"agallego\";csrf|a:2:{s:9:\"timestamp\";i:1666770569;s:5:\"token\";s:32:\"d90638a0c3f61552309ee7e1d5dceb25\";}','localhost'),('c0dmb8sl2pcb94mvn9ijdbn4sn',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770883,1666770917,0,'csrf|a:2:{s:9:\"timestamp\";i:1666770917;s:5:\"token\";s:32:\"d13c3da11c583debc31f7fb35c156ad6\";}username|s:6:\"mpower\";','localhost'),('c0jlniifrh40bos4n50qfi7imo',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770117,1666770140,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1666770140;s:5:\"token\";s:32:\"a98ee6846aef9275756dfe5e948118dd\";}','localhost'),('ccge4hvi3ahmrc0tltijmakff8',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666769669,1666769768,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1666769768;s:5:\"token\";s:32:\"5f0f0cdd19ed1e8823584fa47dd9c0e4\";}','localhost'),('ceme11o62kf0n1it76rlmmfjk8',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770447,1666770498,0,'csrf|a:2:{s:9:\"timestamp\";i:1666770497;s:5:\"token\";s:32:\"bb629568cd0cc76b157d59cb6e2442d2\";}username|s:5:\"mally\";','localhost'),('eusn56smqplqfm3dttipihi6dl',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770037,1666770116,0,'csrf|a:2:{s:9:\"timestamp\";i:1666770116;s:5:\"token\";s:32:\"64f8f48ddcd5b6777ce99ee2685c0790\";}username|s:7:\"fperini\";','localhost'),('f25amfk6sjutfmqkr566ghvok9',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666769277,1666769310,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1666769310;s:5:\"token\";s:32:\"8ea754af338fe57ed1b840595e30cb51\";}','localhost'),('f54tp4upuekr5m80ergn5praqa',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666768981,1666768996,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1666768996;s:5:\"token\";s:32:\"ece6b87aa2cea38a6e0cfc65d47ff2f4\";}','localhost'),('gop7lbp8qsrhjdul0kogsh704t',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666771087,1666771132,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1666771131;s:5:\"token\";s:32:\"1d692b978a9f2e98b3cd803fd2fafb89\";}','localhost'),('gpd61e5mg6k4phv2rpd2l1926l',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666769831,1666769858,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1666769858;s:5:\"token\";s:32:\"ecc3c9debb5a8614f7a628d010600cbb\";}','localhost'),('i21sfik9n9mo1297h1c31n2vri',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666769770,1666769831,0,'csrf|a:2:{s:9:\"timestamp\";i:1666769830;s:5:\"token\";s:32:\"250c5916e01afded035b26175ea655ed\";}username|s:9:\"dbernnard\";','localhost'),('i2hkd38p2h9js3uats08t1u3ga',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666769230,1666769248,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1666769248;s:5:\"token\";s:32:\"ef91ac5fa9b68e9f9d81f02dacc38c39\";}','localhost'),('ii788n928iva3khhaqqtuo6l9b',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770021,1666770034,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1666770034;s:5:\"token\";s:32:\"d0247e70c230d9bfa3267085e6e37d80\";}','localhost'),('jucfl5vviofbdpta26i4p1q9br',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770974,1666771087,0,'csrf|a:2:{s:9:\"timestamp\";i:1666771086;s:5:\"token\";s:32:\"57dcebcd103af27ce1dfc7b8928a5b77\";}username|s:6:\"msmith\";','localhost'),('k3jhi9vlm1ocomedcs86b318o1',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770266,1666770277,0,'username|s:8:\"agallego\";csrf|a:2:{s:9:\"timestamp\";i:1666770277;s:5:\"token\";s:32:\"90aaa5ca9ec294d3b5dcde4e670dc144\";}','localhost'),('m99hm1v20q8ei90g19rgdhcvop',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666769539,1666769626,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1666769626;s:5:\"token\";s:32:\"d65b069c3b5e4642354fda22569352c1\";}','localhost'),('mnv5sbaquje8j5771up1qek17t',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770314,1666770384,0,'csrf|a:2:{s:9:\"timestamp\";i:1666770384;s:5:\"token\";s:32:\"6bb7d80c440c76b5f64dd9b563b7b6fb\";}username|s:6:\"lelder\";','localhost'),('msp5nu5mnler17bs19ar92jsbc',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666769013,1666769020,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1666769020;s:5:\"token\";s:32:\"e4b801d268ebb4b63c1eb57b397f1f70\";}','localhost'),('ng48kjsbdcgpqmidoutuf771rn',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666769312,1666769397,0,'csrf|a:2:{s:9:\"timestamp\";i:1666769397;s:5:\"token\";s:32:\"814092d919ed7d7c7dc10ef0355daaf2\";}username|s:7:\"afinkel\";','localhost'),('nsg4kib0aejf9kgqsqbpd678i2',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770960,1666770971,0,'username|s:8:\"agallego\";csrf|a:2:{s:9:\"timestamp\";i:1666770971;s:5:\"token\";s:32:\"2407d02a88040b6141526166cf0fcd09\";}','localhost'),('nt2vucgrim3e2dmps1mf1q7k4g',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770278,1666770288,0,'username|s:6:\"gfavio\";csrf|a:2:{s:9:\"timestamp\";i:1666770288;s:5:\"token\";s:32:\"f1af42c7b590e38a62eb550488fa628e\";}','localhost'),('o08ubqu9ifc57c2urotf3f1j0p',21,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666769437,1666769472,0,'csrf|a:2:{s:9:\"timestamp\";i:1666769472;s:5:\"token\";s:32:\"cf23e0f665f1d2d06d12e0fc38a02e11\";}username|s:10:\"bbarnetson\";userId|i:21;','localhost'),('obgpij6kk51ct9c18kqmkgmgfd',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770613,1666770678,0,'csrf|a:2:{s:9:\"timestamp\";i:1666770678;s:5:\"token\";s:32:\"658816f18b044fd6cd6f903e747d7c35\";}username|s:7:\"mdawson\";','localhost'),('pvag95cd6uolen2t7e7id9b7hn',27,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770142,1666770196,0,'csrf|a:2:{s:9:\"timestamp\";i:1666770196;s:5:\"token\";s:32:\"0c6d32003747002915981ad020fe223c\";}username|s:7:\"jbrower\";userId|i:27;','localhost'),('qchh4ms55i8onvapcu9pl1tpt8',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666769398,1666769434,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1666769433;s:5:\"token\";s:32:\"ebc81cea926341ea1daec4cdf4b0d11d\";}','localhost'),('s8us6es52ag52f7ajl848ionmt',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666769971,1666770017,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1666770018;s:5:\"token\";s:32:\"7f841558a03f1f92a3aabc1e847fa8b4\";}','localhost'),('sj7mocuedrvla0hb4semeujeb0',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770385,1666770431,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1666770431;s:5:\"token\";s:32:\"a6884dcb5c8396e6bf2b2af7e566f2f0\";}','localhost'),('spbkrccd7l79cploa65ig2gvt2',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666769208,1666769228,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1666769228;s:5:\"token\";s:32:\"b55be156f21777727b485b739cc72fa1\";}','localhost'),('ucanul5eo7l2ctmu1afcv3v4kp',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770289,1666770312,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1666770312;s:5:\"token\";s:32:\"d8c1fcf17fc183e73e2037fdaa788d2b\";}','localhost'),('v118jdreuraqeac4qnk7tss20t',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666769474,1666769538,0,'csrf|a:2:{s:9:\"timestamp\";i:1666769538;s:5:\"token\";s:32:\"e4d22333c14234621bbc7abfaabc2a58\";}username|s:6:\"bbeaty\";','localhost'),('v4t5rpic9dc4qnhrqpm90buqbr',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666769858,1666769874,0,'username|s:6:\"minoue\";csrf|a:2:{s:9:\"timestamp\";i:1666769874;s:5:\"token\";s:32:\"65dae020dee3b8ca08b9152d25f8b8ed\";}','localhost'),('vc9eu3ii1o06osjlpaam6t1occ',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770679,1666770835,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1666770835;s:5:\"token\";s:32:\"6da12c7e06ace648b502f5c7bebae0da\";}','localhost'),('vjjhlva3fcj9gdnka91qe2jg46',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770221,1666770266,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1666770266;s:5:\"token\";s:32:\"3487cd1f279b65ac03bbfbb2b8a69075\";}','localhost'),('vshu9sq79kr8j5gj3maqkmlgua',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/105.0.5195.102 Safari/537.36',1666770918,1666770959,0,'username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1666770959;s:5:\"token\";s:32:\"fb09d9c7a4f79add5d5bcef174689bb2\";}','localhost');
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES (1,1,13,19,'2022-10-26 07:27:36',0,0),(2,1,3,3,'2022-10-26 07:27:55',0,1),(3,1,6,14,'2022-10-26 07:28:29',0,0),(4,2,14,20,'2022-10-26 07:28:39',0,0),(5,2,3,3,'2022-10-26 07:29:55',0,1),(6,3,13,21,'2022-10-26 07:30:43',0,0),(7,3,3,3,'2022-10-26 07:31:12',0,1),(8,4,14,22,'2022-10-26 07:31:21',0,0),(9,4,3,3,'2022-10-26 07:32:17',0,1),(10,4,6,13,'2022-10-26 07:33:19',0,0),(11,4,10,15,'2022-10-26 07:33:37',0,0),(12,5,13,23,'2022-10-26 07:33:55',0,0),(13,5,3,3,'2022-10-26 07:34:28',0,1),(14,5,6,14,'2022-10-26 07:35:22',0,0),(15,5,10,16,'2022-10-26 07:35:39',0,0),(16,5,12,17,'2022-10-26 07:35:46',0,0),(17,6,14,24,'2022-10-26 07:36:16',0,0),(18,6,3,3,'2022-10-26 07:37:09',0,1),(19,6,5,4,'2022-10-26 07:37:09',0,1),(20,6,5,6,'2022-10-26 07:37:36',1,0),(21,7,14,25,'2022-10-26 07:38:13',0,0),(22,7,3,3,'2022-10-26 07:39:29',0,1),(23,7,6,13,'2022-10-26 07:40:16',0,0),(24,8,13,3,'2022-10-26 07:40:28',0,0),(25,8,3,3,'2022-10-26 07:40:34',0,1),(26,9,14,26,'2022-10-26 07:40:43',0,0),(27,9,3,3,'2022-10-26 07:41:54',0,1),(28,9,5,4,'2022-10-26 07:41:54',0,1),(29,10,13,27,'2022-10-26 07:42:28',0,0),(30,10,3,3,'2022-10-26 07:43:16',0,1),(31,11,13,28,'2022-10-26 07:43:26',0,0),(32,11,3,3,'2022-10-26 07:43:40',0,1),(33,12,14,29,'2022-10-26 07:45:20',0,0),(34,12,3,3,'2022-10-26 07:46:23',0,1),(35,13,14,30,'2022-10-26 07:47:33',0,0),(36,13,3,3,'2022-10-26 07:48:17',0,1),(37,14,14,31,'2022-10-26 07:50:19',0,0),(38,14,3,3,'2022-10-26 07:51:17',0,1),(39,14,6,13,'2022-10-26 07:52:24',0,0),(40,14,10,15,'2022-10-26 07:52:44',0,0),(41,14,12,18,'2022-10-26 07:52:51',0,0),(42,15,13,32,'2022-10-26 07:54:04',0,0),(43,15,3,3,'2022-10-26 07:54:22',0,1),(44,16,13,33,'2022-10-26 07:54:49',0,0),(45,16,3,3,'2022-10-26 07:55:16',0,1),(46,17,14,34,'2022-10-26 07:56:20',0,0),(47,17,3,3,'2022-10-26 07:58:04',0,1);
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
  UNIQUE KEY `section_editors_pkey` (`context_id`,`assoc_id`,`assoc_type`,`user_id`),
  KEY `subeditor_submission_group_context_id` (`context_id`),
  KEY `subeditor_submission_group_user_id` (`user_id`),
  KEY `subeditor_submission_group_assoc_id` (`assoc_id`,`assoc_type`),
  CONSTRAINT `section_editors_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `subeditor_submission_group_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subeditor_submission_group`
--

LOCK TABLES `subeditor_submission_group` WRITE;
/*!40000 ALTER TABLE `subeditor_submission_group` DISABLE KEYS */;
INSERT INTO `subeditor_submission_group` VALUES (1,1,530,4),(1,2,530,5);
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
INSERT INTO `submission_chapter_authors` VALUES (1,1,0,0.00),(1,2,0,0.00),(1,3,0,0.00),(5,4,0,0.00),(6,5,0,0.00),(7,6,0,0.00),(8,7,0,0.00),(9,7,0,1.00),(10,8,0,0.00),(10,9,0,0.00),(10,10,0,0.00),(10,11,0,0.00),(10,12,0,0.00),(11,13,0,0.00),(12,14,0,0.00),(13,15,0,0.00),(14,16,0,0.00),(15,17,0,0.00),(15,18,0,0.00),(15,19,0,0.00),(15,20,0,0.00),(15,21,0,0.00),(15,22,0,0.00),(16,23,0,0.00),(17,24,0,0.00),(18,25,0,0.00),(19,26,0,0.00),(20,27,0,0.00),(21,28,0,0.00),(22,29,0,0.00),(23,30,0,0.00),(24,31,0,0.00),(26,32,0,0.00),(27,33,0,0.00),(28,34,0,0.00),(29,35,0,0.00),(30,36,0,0.00),(31,37,0,0.00),(31,38,0,0.00),(31,39,0,0.00),(31,40,0,0.00),(31,41,0,0.00),(31,42,0,0.00),(31,43,0,0.00),(31,44,0,0.00),(31,45,0,0.00),(32,46,0,0.00),(32,47,0,0.00),(35,48,0,0.00),(36,48,0,1.00),(37,49,0,0.00),(38,49,0,1.00),(39,50,0,0.00),(40,50,0,1.00),(42,51,0,0.00),(43,52,0,0.00),(44,53,0,0.00),(45,54,0,0.00),(45,57,0,0.00),(46,55,0,0.00),(47,56,0,0.00),(48,58,0,0.00),(48,59,0,0.00),(48,60,0,0.00),(49,61,0,0.00),(49,62,0,0.00),(49,63,0,0.00),(49,64,0,0.00),(49,65,0,0.00),(50,67,0,0.00),(50,68,0,0.00),(51,66,0,0.00),(52,67,0,1.00),(52,68,0,1.00),(53,69,0,0.00),(54,69,0,1.00),(55,70,0,0.00),(56,70,0,1.00),(57,71,0,0.00);
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
INSERT INTO `submission_chapter_settings` VALUES (1,'','datePublished',NULL,'string'),(1,'','isPageEnabled',NULL,'string'),(1,'','licenseUrl',NULL,'string'),(1,'','pages','','string'),(1,'en_US','abstract','','string'),(1,'en_US','subtitle','','string'),(1,'en_US','title','Choosing the Future','string'),(1,'fr_CA','abstract','','string'),(1,'fr_CA','subtitle','','string'),(1,'fr_CA','title','','string'),(2,'','datePublished',NULL,'string'),(2,'','isPageEnabled',NULL,'string'),(2,'','licenseUrl',NULL,'string'),(2,'','pages','','string'),(2,'en_US','abstract','','string'),(2,'en_US','subtitle','','string'),(2,'en_US','title','Axioms','string'),(2,'fr_CA','abstract','','string'),(2,'fr_CA','subtitle','','string'),(2,'fr_CA','title','','string'),(3,'','datePublished',NULL,'string'),(3,'','isPageEnabled',NULL,'string'),(3,'','licenseUrl',NULL,'string'),(3,'','pages','','string'),(3,'en_US','abstract','','string'),(3,'en_US','subtitle','','string'),(3,'en_US','title','Paradigm Shift','string'),(3,'fr_CA','abstract','','string'),(3,'fr_CA','subtitle','','string'),(3,'fr_CA','title','','string'),(4,'','datePublished',NULL,'string'),(4,'','isPageEnabled',NULL,'string'),(4,'','licenseUrl','','string'),(4,'','pages','','string'),(4,'en_US','abstract','','string'),(4,'en_US','subtitle','','string'),(4,'en_US','title','Critical History in Western Canada 1900–2000','string'),(4,'fr_CA','abstract','','string'),(4,'fr_CA','subtitle','','string'),(4,'fr_CA','title','','string'),(5,'','datePublished',NULL,'string'),(5,'','isPageEnabled',NULL,'string'),(5,'','licenseUrl','','string'),(5,'','pages','','string'),(5,'en_US','abstract','','string'),(5,'en_US','subtitle','','string'),(5,'en_US','title','Vernacular Currents in Western Canadian Historiography: The Passion and Prose of Katherine Hughes, F.G. Roe, and Roy Ito','string'),(5,'fr_CA','abstract','','string'),(5,'fr_CA','subtitle','','string'),(5,'fr_CA','title','','string'),(6,'','datePublished',NULL,'string'),(6,'','isPageEnabled',NULL,'string'),(6,'','licenseUrl','','string'),(6,'','pages','','string'),(6,'en_US','abstract','','string'),(6,'en_US','subtitle','','string'),(6,'en_US','title','Cree Intellectual Traditions in History','string'),(6,'fr_CA','abstract','','string'),(6,'fr_CA','subtitle','','string'),(6,'fr_CA','title','','string'),(7,'','datePublished',NULL,'string'),(7,'','isPageEnabled',NULL,'string'),(7,'','licenseUrl','','string'),(7,'','pages','','string'),(7,'en_US','abstract','','string'),(7,'en_US','subtitle','','string'),(7,'en_US','title','Visualizing Space, Race, and History in the North: Photographic Narratives of the Athabasca-Mackenzie River Basin','string'),(7,'fr_CA','abstract','','string'),(7,'fr_CA','subtitle','','string'),(7,'fr_CA','title','','string'),(8,'','datePublished',NULL,'string'),(8,'','isPageEnabled',NULL,'string'),(8,'','licenseUrl',NULL,'string'),(8,'','pages','','string'),(8,'en_US','abstract','','string'),(8,'en_US','subtitle','','string'),(8,'en_US','title','Introduction','string'),(8,'fr_CA','abstract','','string'),(8,'fr_CA','subtitle','','string'),(8,'fr_CA','title','','string'),(9,'','datePublished',NULL,'string'),(9,'','isPageEnabled',NULL,'string'),(9,'','licenseUrl',NULL,'string'),(9,'','pages','','string'),(9,'en_US','abstract','','string'),(9,'en_US','subtitle','','string'),(9,'en_US','title','Part One. Employment Relationships in Canada','string'),(9,'fr_CA','abstract','','string'),(9,'fr_CA','subtitle','','string'),(9,'fr_CA','title','','string'),(10,'','datePublished',NULL,'string'),(10,'','isPageEnabled',NULL,'string'),(10,'','licenseUrl',NULL,'string'),(10,'','pages','','string'),(10,'en_US','abstract','','string'),(10,'en_US','subtitle','','string'),(10,'en_US','title','Part Two. Preventing Workplace Injury','string'),(10,'fr_CA','abstract','','string'),(10,'fr_CA','subtitle','','string'),(10,'fr_CA','title','','string'),(11,'','datePublished',NULL,'string'),(11,'','isPageEnabled',NULL,'string'),(11,'','licenseUrl',NULL,'string'),(11,'','pages','','string'),(11,'en_US','abstract','','string'),(11,'en_US','subtitle','','string'),(11,'en_US','title','Part Three. Critique of OHS in Canada','string'),(11,'fr_CA','abstract','','string'),(11,'fr_CA','subtitle','','string'),(11,'fr_CA','title','','string'),(12,'','datePublished',NULL,'string'),(12,'','isPageEnabled',NULL,'string'),(12,'','licenseUrl',NULL,'string'),(12,'','pages','','string'),(12,'en_US','abstract','','string'),(12,'en_US','subtitle','','string'),(12,'en_US','title','Part Four. Political Economy of Preventing Workplace Injury','string'),(12,'fr_CA','abstract','','string'),(12,'fr_CA','subtitle','','string'),(12,'fr_CA','title','','string'),(13,'','datePublished',NULL,'string'),(13,'','isPageEnabled',NULL,'string'),(13,'','licenseUrl','','string'),(13,'','pages','','string'),(13,'en_US','abstract','','string'),(13,'en_US','subtitle','','string'),(13,'en_US','title','Introduction: Contexts of Popular Culture','string'),(13,'fr_CA','abstract','','string'),(13,'fr_CA','subtitle','','string'),(13,'fr_CA','title','','string'),(14,'','datePublished',NULL,'string'),(14,'','isPageEnabled',NULL,'string'),(14,'','licenseUrl','','string'),(14,'','pages','','string'),(14,'en_US','abstract','','string'),(14,'en_US','subtitle','','string'),(14,'en_US','title','Chapter 1. A Future for Media Studies: Cultural Labour, Cultural Relations, Cultural Politics','string'),(14,'fr_CA','abstract','','string'),(14,'fr_CA','subtitle','','string'),(14,'fr_CA','title','','string'),(15,'','datePublished',NULL,'string'),(15,'','isPageEnabled',NULL,'string'),(15,'','licenseUrl','','string'),(15,'','pages','','string'),(15,'en_US','abstract','','string'),(15,'en_US','subtitle','','string'),(15,'en_US','title','Chapter 2. Log On, Goof Off, and Look Up: Facebook and the Rhythms of Canadian Internet Use','string'),(15,'fr_CA','abstract','','string'),(15,'fr_CA','subtitle','','string'),(15,'fr_CA','title','','string'),(16,'','datePublished',NULL,'string'),(16,'','isPageEnabled',NULL,'string'),(16,'','licenseUrl','','string'),(16,'','pages','','string'),(16,'en_US','abstract','','string'),(16,'en_US','subtitle','','string'),(16,'en_US','title','Chapter 3. Hawkers and Public Space: Free Commuter Newspapers in Canada','string'),(16,'fr_CA','abstract','','string'),(16,'fr_CA','subtitle','','string'),(16,'fr_CA','title','','string'),(17,'','datePublished',NULL,'string'),(17,'','isPageEnabled',NULL,'string'),(17,'','licenseUrl',NULL,'string'),(17,'','pages','','string'),(17,'en_US','abstract','','string'),(17,'en_US','subtitle','','string'),(17,'en_US','title','Prologue','string'),(17,'fr_CA','abstract','','string'),(17,'fr_CA','subtitle','','string'),(17,'fr_CA','title','','string'),(18,'','datePublished',NULL,'string'),(18,'','isPageEnabled',NULL,'string'),(18,'','licenseUrl',NULL,'string'),(18,'','pages','','string'),(18,'en_US','abstract','','string'),(18,'en_US','subtitle','','string'),(18,'en_US','title','Chapter 1: The First Five Years: 1867-1872','string'),(18,'fr_CA','abstract','','string'),(18,'fr_CA','subtitle','','string'),(18,'fr_CA','title','','string'),(19,'','datePublished',NULL,'string'),(19,'','isPageEnabled',NULL,'string'),(19,'','licenseUrl',NULL,'string'),(19,'','pages','','string'),(19,'en_US','abstract','','string'),(19,'en_US','subtitle','','string'),(19,'en_US','title','Chapter 2: Free Trade or \"Freedom\": 1911','string'),(19,'fr_CA','abstract','','string'),(19,'fr_CA','subtitle','','string'),(19,'fr_CA','title','','string'),(20,'','datePublished',NULL,'string'),(20,'','isPageEnabled',NULL,'string'),(20,'','licenseUrl',NULL,'string'),(20,'','pages','','string'),(20,'en_US','abstract','','string'),(20,'en_US','subtitle','','string'),(20,'en_US','title','Chapter 3: Castro, Nukes & the Cold War: 1953-1968','string'),(20,'fr_CA','abstract','','string'),(20,'fr_CA','subtitle','','string'),(20,'fr_CA','title','','string'),(21,'','datePublished',NULL,'string'),(21,'','isPageEnabled',NULL,'string'),(21,'','licenseUrl',NULL,'string'),(21,'','pages','','string'),(21,'en_US','abstract','','string'),(21,'en_US','subtitle','','string'),(21,'en_US','title','Chapter 4: Enter the Intellect: 1968-1984','string'),(21,'fr_CA','abstract','','string'),(21,'fr_CA','subtitle','','string'),(21,'fr_CA','title','','string'),(22,'','datePublished',NULL,'string'),(22,'','isPageEnabled',NULL,'string'),(22,'','licenseUrl',NULL,'string'),(22,'','pages','','string'),(22,'en_US','abstract','','string'),(22,'en_US','subtitle','','string'),(22,'en_US','title','Epilogue','string'),(22,'fr_CA','abstract','','string'),(22,'fr_CA','subtitle','','string'),(22,'fr_CA','title','','string'),(23,'','datePublished',NULL,'string'),(23,'','isPageEnabled',NULL,'string'),(23,'','licenseUrl','','string'),(23,'','pages','','string'),(23,'en_US','abstract','','string'),(23,'en_US','subtitle','','string'),(23,'en_US','title','Identify: Understanding Your Information Need','string'),(23,'fr_CA','abstract','','string'),(23,'fr_CA','subtitle','','string'),(23,'fr_CA','title','','string'),(24,'','datePublished',NULL,'string'),(24,'','isPageEnabled',NULL,'string'),(24,'','licenseUrl','','string'),(24,'','pages','','string'),(24,'en_US','abstract','','string'),(24,'en_US','subtitle','','string'),(24,'en_US','title','Scope: Knowing What Is Available','string'),(24,'fr_CA','abstract','','string'),(24,'fr_CA','subtitle','','string'),(24,'fr_CA','title','','string'),(25,'','datePublished',NULL,'string'),(25,'','isPageEnabled',NULL,'string'),(25,'','licenseUrl','','string'),(25,'','pages','','string'),(25,'en_US','abstract','','string'),(25,'en_US','subtitle','','string'),(25,'en_US','title','Plan: Developing Research Strategies','string'),(25,'fr_CA','abstract','','string'),(25,'fr_CA','subtitle','','string'),(25,'fr_CA','title','','string'),(26,'','datePublished',NULL,'string'),(26,'','isPageEnabled',NULL,'string'),(26,'','licenseUrl','','string'),(26,'','pages','','string'),(26,'en_US','abstract','','string'),(26,'en_US','subtitle','','string'),(26,'en_US','title','Gather: Finding What You Need','string'),(26,'fr_CA','abstract','','string'),(26,'fr_CA','subtitle','','string'),(26,'fr_CA','title','','string'),(27,'','datePublished',NULL,'string'),(27,'','isPageEnabled',NULL,'string'),(27,'','licenseUrl','','string'),(27,'','pages','','string'),(27,'en_US','abstract','','string'),(27,'en_US','subtitle','','string'),(27,'en_US','title','Introduction','string'),(27,'fr_CA','abstract','','string'),(27,'fr_CA','subtitle','','string'),(27,'fr_CA','title','','string'),(28,'','datePublished',NULL,'string'),(28,'','isPageEnabled',NULL,'string'),(28,'','licenseUrl','','string'),(28,'','pages','','string'),(28,'en_US','abstract','','string'),(28,'en_US','subtitle','','string'),(28,'en_US','title','Chapter 1: Interactions Affording Distance Science Education','string'),(28,'fr_CA','abstract','','string'),(28,'fr_CA','subtitle','','string'),(28,'fr_CA','title','','string'),(29,'','datePublished',NULL,'string'),(29,'','isPageEnabled',NULL,'string'),(29,'','licenseUrl','','string'),(29,'','pages','','string'),(29,'en_US','abstract','','string'),(29,'en_US','subtitle','','string'),(29,'en_US','title','Chapter 2: Learning Science at a Distance: Instructional Dialogues and Resources','string'),(29,'fr_CA','abstract','','string'),(29,'fr_CA','subtitle','','string'),(29,'fr_CA','title','','string'),(30,'','datePublished',NULL,'string'),(30,'','isPageEnabled',NULL,'string'),(30,'','licenseUrl','','string'),(30,'','pages','','string'),(30,'en_US','abstract','','string'),(30,'en_US','subtitle','','string'),(30,'en_US','title','Chapter 3: Leadership Strategies for Coordinating Distance Education Instructional Development Teams','string'),(30,'fr_CA','abstract','','string'),(30,'fr_CA','subtitle','','string'),(30,'fr_CA','title','','string'),(31,'','datePublished',NULL,'string'),(31,'','isPageEnabled',NULL,'string'),(31,'','licenseUrl','','string'),(31,'','pages','','string'),(31,'en_US','abstract','','string'),(31,'en_US','subtitle','','string'),(31,'en_US','title','Chapter 4: Toward New Models of Flexible Education to Enhance Quality in Australian Higher Education','string'),(31,'fr_CA','abstract','','string'),(31,'fr_CA','subtitle','','string'),(31,'fr_CA','title','','string'),(32,'','datePublished',NULL,'string'),(32,'','isPageEnabled',NULL,'string'),(32,'','licenseUrl','','string'),(32,'','pages','','string'),(32,'en_US','abstract','','string'),(32,'en_US','subtitle','','string'),(32,'en_US','title','Internet, openness and the future of the information society in LAC','string'),(32,'fr_CA','abstract','','string'),(32,'fr_CA','subtitle','','string'),(32,'fr_CA','title','','string'),(33,'','datePublished',NULL,'string'),(33,'','isPageEnabled',NULL,'string'),(33,'','licenseUrl','','string'),(33,'','pages','','string'),(33,'en_US','abstract','','string'),(33,'en_US','subtitle','','string'),(33,'en_US','title','Imagining the Internet: Open, closed or in between?','string'),(33,'fr_CA','abstract','','string'),(33,'fr_CA','subtitle','','string'),(33,'fr_CA','title','','string'),(34,'','datePublished',NULL,'string'),(34,'','isPageEnabled',NULL,'string'),(34,'','licenseUrl','','string'),(34,'','pages','','string'),(34,'en_US','abstract','','string'),(34,'en_US','subtitle','','string'),(34,'en_US','title','The internet in LAC will remain free, public and open over the next 10 years','string'),(34,'fr_CA','abstract','','string'),(34,'fr_CA','subtitle','','string'),(34,'fr_CA','title','','string'),(35,'','datePublished',NULL,'string'),(35,'','isPageEnabled',NULL,'string'),(35,'','licenseUrl','','string'),(35,'','pages','','string'),(35,'en_US','abstract','','string'),(35,'en_US','subtitle','','string'),(35,'en_US','title','Free Internet?','string'),(35,'fr_CA','abstract','','string'),(35,'fr_CA','subtitle','','string'),(35,'fr_CA','title','','string'),(36,'','datePublished',NULL,'string'),(36,'','isPageEnabled',NULL,'string'),(36,'','licenseUrl','','string'),(36,'','pages','','string'),(36,'en_US','abstract','','string'),(36,'en_US','subtitle','','string'),(36,'en_US','title','Risks and challenges for freedom of expression on the internet','string'),(36,'fr_CA','abstract','','string'),(36,'fr_CA','subtitle','','string'),(36,'fr_CA','title','','string'),(37,'','datePublished',NULL,'string'),(37,'','isPageEnabled',NULL,'string'),(37,'','licenseUrl',NULL,'string'),(37,'','pages','','string'),(37,'en_US','abstract','','string'),(37,'en_US','subtitle','','string'),(37,'en_US','title','Introduction','string'),(37,'fr_CA','abstract','','string'),(37,'fr_CA','subtitle','','string'),(37,'fr_CA','title','','string'),(38,'','datePublished',NULL,'string'),(38,'','isPageEnabled',NULL,'string'),(38,'','licenseUrl',NULL,'string'),(38,'','pages','','string'),(38,'en_US','abstract','','string'),(38,'en_US','subtitle','','string'),(38,'en_US','title','CHAPTER ONE: Where the Buffalo Roamed','string'),(38,'fr_CA','abstract','','string'),(38,'fr_CA','subtitle','','string'),(38,'fr_CA','title','','string'),(39,'','datePublished',NULL,'string'),(39,'','isPageEnabled',NULL,'string'),(39,'','licenseUrl',NULL,'string'),(39,'','pages','','string'),(39,'en_US','abstract','','string'),(39,'en_US','subtitle','','string'),(39,'en_US','title','CHAPTER TWO: Bison Conservation and Buffalo National Park','string'),(39,'fr_CA','abstract','','string'),(39,'fr_CA','subtitle','','string'),(39,'fr_CA','title','','string'),(40,'','datePublished',NULL,'string'),(40,'','isPageEnabled',NULL,'string'),(40,'','licenseUrl',NULL,'string'),(40,'','pages','','string'),(40,'en_US','abstract','','string'),(40,'en_US','subtitle','','string'),(40,'en_US','title','CHAPTER THREE: A Well-Run Ranch','string'),(40,'fr_CA','abstract','','string'),(40,'fr_CA','subtitle','','string'),(40,'fr_CA','title','','string'),(41,'','datePublished',NULL,'string'),(41,'','isPageEnabled',NULL,'string'),(41,'','licenseUrl',NULL,'string'),(41,'','pages','','string'),(41,'en_US','abstract','','string'),(41,'en_US','subtitle','','string'),(41,'en_US','title','CHAPTER FOUR: Zookeepers and Animal Breeders','string'),(41,'fr_CA','abstract','','string'),(41,'fr_CA','subtitle','','string'),(41,'fr_CA','title','','string'),(42,'','datePublished',NULL,'string'),(42,'','isPageEnabled',NULL,'string'),(42,'','licenseUrl',NULL,'string'),(42,'','pages','','string'),(42,'en_US','abstract','','string'),(42,'en_US','subtitle','','string'),(42,'en_US','title','CHAPTER FIVE: \"Evolving the Arctic Cow\"','string'),(42,'fr_CA','abstract','','string'),(42,'fr_CA','subtitle','','string'),(42,'fr_CA','title','','string'),(43,'','datePublished',NULL,'string'),(43,'','isPageEnabled',NULL,'string'),(43,'','licenseUrl',NULL,'string'),(43,'','pages','','string'),(43,'en_US','abstract','','string'),(43,'en_US','subtitle','','string'),(43,'en_US','title','CONCLUSION: The Forgotten Park','string'),(43,'fr_CA','abstract','','string'),(43,'fr_CA','subtitle','','string'),(43,'fr_CA','title','','string'),(44,'','datePublished',NULL,'string'),(44,'','isPageEnabled',NULL,'string'),(44,'','licenseUrl',NULL,'string'),(44,'','pages','','string'),(44,'en_US','abstract','','string'),(44,'en_US','subtitle','','string'),(44,'en_US','title','Bibliography','string'),(44,'fr_CA','abstract','','string'),(44,'fr_CA','subtitle','','string'),(44,'fr_CA','title','','string'),(45,'','datePublished',NULL,'string'),(45,'','isPageEnabled',NULL,'string'),(45,'','licenseUrl',NULL,'string'),(45,'','pages','','string'),(45,'en_US','abstract','','string'),(45,'en_US','subtitle','','string'),(45,'en_US','title','Index','string'),(45,'fr_CA','abstract','','string'),(45,'fr_CA','subtitle','','string'),(45,'fr_CA','title','','string'),(46,'','datePublished',NULL,'string'),(46,'','isPageEnabled',NULL,'string'),(46,'','licenseUrl',NULL,'string'),(46,'','pages','','string'),(46,'en_US','abstract','','string'),(46,'en_US','subtitle','','string'),(46,'en_US','title','Introduction','string'),(46,'fr_CA','abstract','','string'),(46,'fr_CA','subtitle','','string'),(46,'fr_CA','title','','string'),(47,'','datePublished',NULL,'string'),(47,'','isPageEnabled',NULL,'string'),(47,'','licenseUrl',NULL,'string'),(47,'','pages','','string'),(47,'en_US','abstract','','string'),(47,'en_US','subtitle','','string'),(47,'en_US','title','Poems','string'),(47,'fr_CA','abstract','','string'),(47,'fr_CA','subtitle','','string'),(47,'fr_CA','title','','string'),(48,'','datePublished',NULL,'string'),(48,'','isPageEnabled',NULL,'string'),(48,'','licenseUrl','','string'),(48,'','pages','','string'),(48,'en_US','abstract','','string'),(48,'en_US','subtitle','','string'),(48,'en_US','title','Catalyzing Access through Social and Technical Innovation','string'),(48,'fr_CA','abstract','','string'),(48,'fr_CA','subtitle','','string'),(48,'fr_CA','title','','string'),(49,'','datePublished',NULL,'string'),(49,'','isPageEnabled',NULL,'string'),(49,'','licenseUrl','','string'),(49,'','pages','','string'),(49,'en_US','abstract','','string'),(49,'en_US','subtitle','','string'),(49,'en_US','title','Catalyzing Access via Telecommunications Policy','string'),(49,'fr_CA','abstract','','string'),(49,'fr_CA','subtitle','','string'),(49,'fr_CA','title','','string'),(50,'','datePublished',NULL,'string'),(50,'','isPageEnabled',NULL,'string'),(50,'','licenseUrl','','string'),(50,'','pages','','string'),(50,'en_US','abstract','','string'),(50,'en_US','subtitle','','string'),(50,'en_US','title','Access to Knowledge as a New Paradigm for Research on ICTs and Intellectual Property','string'),(50,'fr_CA','abstract','','string'),(50,'fr_CA','subtitle','','string'),(50,'fr_CA','title','','string'),(51,'','datePublished',NULL,'string'),(51,'','isPageEnabled',NULL,'string'),(51,'','licenseUrl','','string'),(51,'','pages','','string'),(51,'en_US','abstract','','string'),(51,'en_US','subtitle','','string'),(51,'en_US','title','Current State of Mobile Learning','string'),(51,'fr_CA','abstract','','string'),(51,'fr_CA','subtitle','','string'),(51,'fr_CA','title','','string'),(52,'','datePublished',NULL,'string'),(52,'','isPageEnabled',NULL,'string'),(52,'','licenseUrl','','string'),(52,'','pages','','string'),(52,'en_US','abstract','','string'),(52,'en_US','subtitle','','string'),(52,'en_US','title','A Model for Framing Mobile Learning','string'),(52,'fr_CA','abstract','','string'),(52,'fr_CA','subtitle','','string'),(52,'fr_CA','title','','string'),(53,'','datePublished',NULL,'string'),(53,'','isPageEnabled',NULL,'string'),(53,'','licenseUrl','','string'),(53,'','pages','','string'),(53,'en_US','abstract','','string'),(53,'en_US','subtitle','','string'),(53,'en_US','title','Mobile Distance Learning with PDAs: Development and Testing of Pedagogical and System Solutions Supporting Mobile Distance Learners','string'),(53,'fr_CA','abstract','','string'),(53,'fr_CA','subtitle','','string'),(53,'fr_CA','title','','string'),(54,'','datePublished',NULL,'string'),(54,'','isPageEnabled',NULL,'string'),(54,'','licenseUrl',NULL,'string'),(54,'','pages','','string'),(54,'en_US','abstract','','string'),(54,'en_US','subtitle','','string'),(54,'en_US','title','Chapter 1: Mind Control—Internal or External?','string'),(54,'fr_CA','abstract','','string'),(54,'fr_CA','subtitle','','string'),(54,'fr_CA','title','','string'),(55,'','datePublished',NULL,'string'),(55,'','isPageEnabled',NULL,'string'),(55,'','licenseUrl',NULL,'string'),(55,'','pages','','string'),(55,'en_US','abstract','','string'),(55,'en_US','subtitle','','string'),(55,'en_US','title','Chapter 2: Classical Music and the Classical Mind','string'),(55,'fr_CA','abstract','','string'),(55,'fr_CA','subtitle','','string'),(55,'fr_CA','title','','string'),(56,'','datePublished',NULL,'string'),(56,'','isPageEnabled',NULL,'string'),(56,'','licenseUrl',NULL,'string'),(56,'','pages','','string'),(56,'en_US','abstract','','string'),(56,'en_US','subtitle','','string'),(56,'en_US','title','Chapter 3: Situated Cognition and Bricolage','string'),(56,'fr_CA','abstract','','string'),(56,'fr_CA','subtitle','','string'),(56,'fr_CA','title','','string'),(57,'','datePublished',NULL,'string'),(57,'','isPageEnabled',NULL,'string'),(57,'','licenseUrl',NULL,'string'),(57,'','pages','','string'),(57,'en_US','abstract','','string'),(57,'en_US','subtitle','','string'),(57,'en_US','title','Chapter 4: Braitenberg’s Vehicle 2','string'),(57,'fr_CA','abstract','','string'),(57,'fr_CA','subtitle','','string'),(57,'fr_CA','title','','string'),(58,'','datePublished',NULL,'string'),(58,'','isPageEnabled',NULL,'string'),(58,'','licenseUrl',NULL,'string'),(58,'','pages','','string'),(58,'en_US','abstract','','string'),(58,'en_US','subtitle','','string'),(58,'en_US','title','Setting the Stage','string'),(58,'fr_CA','abstract','','string'),(58,'fr_CA','subtitle','','string'),(58,'fr_CA','title','','string'),(59,'','datePublished',NULL,'string'),(59,'','isPageEnabled',NULL,'string'),(59,'','licenseUrl',NULL,'string'),(59,'','pages','','string'),(59,'en_US','abstract','','string'),(59,'en_US','subtitle','','string'),(59,'en_US','title','Going It Alone, 1945-1954','string'),(59,'fr_CA','abstract','','string'),(59,'fr_CA','subtitle','','string'),(59,'fr_CA','title','','string'),(60,'','datePublished',NULL,'string'),(60,'','isPageEnabled',NULL,'string'),(60,'','licenseUrl',NULL,'string'),(60,'','pages','','string'),(60,'en_US','abstract','','string'),(60,'en_US','subtitle','','string'),(60,'en_US','title','Establishing the Pattern, 1955-1962','string'),(60,'fr_CA','abstract','','string'),(60,'fr_CA','subtitle','','string'),(60,'fr_CA','title','','string'),(61,'','datePublished',NULL,'string'),(61,'','isPageEnabled',NULL,'string'),(61,'','licenseUrl',NULL,'string'),(61,'','pages','','string'),(61,'en_US','abstract','','string'),(61,'en_US','subtitle','','string'),(61,'en_US','title','Foreward','string'),(61,'fr_CA','abstract','','string'),(61,'fr_CA','subtitle','','string'),(61,'fr_CA','title','','string'),(62,'','datePublished',NULL,'string'),(62,'','isPageEnabled',NULL,'string'),(62,'','licenseUrl',NULL,'string'),(62,'','pages','','string'),(62,'en_US','abstract','','string'),(62,'en_US','subtitle','','string'),(62,'en_US','title','Preface','string'),(62,'fr_CA','abstract','','string'),(62,'fr_CA','subtitle','','string'),(62,'fr_CA','title','','string'),(63,'','datePublished',NULL,'string'),(63,'','isPageEnabled',NULL,'string'),(63,'','licenseUrl',NULL,'string'),(63,'','pages','','string'),(63,'en_US','abstract','','string'),(63,'en_US','subtitle','','string'),(63,'en_US','title','The Case Studies','string'),(63,'fr_CA','abstract','','string'),(63,'fr_CA','subtitle','','string'),(63,'fr_CA','title','','string'),(64,'','datePublished',NULL,'string'),(64,'','isPageEnabled',NULL,'string'),(64,'','licenseUrl',NULL,'string'),(64,'','pages','','string'),(64,'en_US','abstract','','string'),(64,'en_US','subtitle','','string'),(64,'en_US','title','Conclusion','string'),(64,'fr_CA','abstract','','string'),(64,'fr_CA','subtitle','','string'),(64,'fr_CA','title','','string'),(65,'','datePublished',NULL,'string'),(65,'','isPageEnabled',NULL,'string'),(65,'','licenseUrl',NULL,'string'),(65,'','pages','','string'),(65,'en_US','abstract','','string'),(65,'en_US','subtitle','','string'),(65,'en_US','title','Bibliography','string'),(65,'fr_CA','abstract','','string'),(65,'fr_CA','subtitle','','string'),(65,'fr_CA','title','','string'),(66,'','datePublished',NULL,'string'),(66,'','isPageEnabled',NULL,'string'),(66,'','licenseUrl','','string'),(66,'','pages','','string'),(66,'en_US','abstract','','string'),(66,'en_US','subtitle','','string'),(66,'en_US','title','Preface','string'),(66,'fr_CA','abstract','','string'),(66,'fr_CA','subtitle','','string'),(66,'fr_CA','title','','string'),(67,'','datePublished',NULL,'string'),(67,'','isPageEnabled',NULL,'string'),(67,'','licenseUrl','','string'),(67,'','pages','','string'),(67,'en_US','abstract','','string'),(67,'en_US','subtitle','','string'),(67,'en_US','title','Introduction','string'),(67,'fr_CA','abstract','','string'),(67,'fr_CA','subtitle','','string'),(67,'fr_CA','title','','string'),(68,'','datePublished',NULL,'string'),(68,'','isPageEnabled',NULL,'string'),(68,'','licenseUrl','','string'),(68,'','pages','','string'),(68,'en_US','abstract','','string'),(68,'en_US','subtitle','','string'),(68,'en_US','title','The Emergence of Open Development in a Network Society','string'),(68,'fr_CA','abstract','','string'),(68,'fr_CA','subtitle','','string'),(68,'fr_CA','title','','string'),(69,'','datePublished',NULL,'string'),(69,'','isPageEnabled',NULL,'string'),(69,'','licenseUrl','','string'),(69,'','pages','','string'),(69,'en_US','abstract','','string'),(69,'en_US','subtitle','','string'),(69,'en_US','title','Enacting Openness in ICT4D Research','string'),(69,'fr_CA','abstract','','string'),(69,'fr_CA','subtitle','','string'),(69,'fr_CA','title','','string'),(70,'','datePublished',NULL,'string'),(70,'','isPageEnabled',NULL,'string'),(70,'','licenseUrl','','string'),(70,'','pages','','string'),(70,'en_US','abstract','','string'),(70,'en_US','subtitle','','string'),(70,'en_US','title','Transparency and Development: Ethical Consumption through Web 2.0 and the Internet of Things','string'),(70,'fr_CA','abstract','','string'),(70,'fr_CA','subtitle','','string'),(70,'fr_CA','title','','string'),(71,'','datePublished',NULL,'string'),(71,'','isPageEnabled',NULL,'string'),(71,'','licenseUrl','','string'),(71,'','pages','','string'),(71,'en_US','abstract','','string'),(71,'en_US','subtitle','','string'),(71,'en_US','title','Open Educational Resources: Opportunities and Challenges for the Developing World','string'),(71,'fr_CA','abstract','','string'),(71,'fr_CA','subtitle','','string'),(71,'fr_CA','title','','string');
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
INSERT INTO `submission_comments` VALUES (1,1,4096,11,10,10,'','<p>I recommend that the author revise this submission.</p>','2022-10-26 07:44:36',NULL,1),(2,1,4096,11,11,12,'','<p>I recommend that the author resubmit this submission.</p>','2022-10-26 07:44:47',NULL,1),(3,1,4096,12,13,8,'','<p>I recommend declining this submission.</p>','2022-10-26 07:47:22',NULL,1),(4,1,4096,13,16,10,'','<p>I recommend requiring revisions.</p>','2022-10-26 07:49:28',NULL,1),(5,1,4096,13,18,12,'','<p>I recommend resubmitting.</p>','2022-10-26 07:49:41',NULL,1),(6,1,4096,16,21,10,'','<p>I recommend that the author revise this submission.</p>','2022-10-26 07:56:10',NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_revisions`
--

LOCK TABLES `submission_file_revisions` WRITE;
/*!40000 ALTER TABLE `submission_file_revisions` DISABLE KEYS */;
INSERT INTO `submission_file_revisions` VALUES (1,1,1),(2,2,1),(3,3,2),(4,4,3),(5,5,4),(6,6,5),(7,7,5),(8,8,4),(9,9,3),(10,10,2),(11,11,6),(12,12,7),(13,13,8),(14,14,9),(15,15,10),(16,16,10),(17,17,9),(18,18,8),(19,19,7),(20,20,11),(21,21,11),(22,22,11),(23,23,12),(24,24,13),(25,25,14),(26,26,15),(27,27,15),(28,28,14),(29,29,13),(30,30,12),(31,31,16),(32,32,17),(33,33,18),(34,34,19),(35,35,20),(36,36,20),(37,37,19),(38,38,18),(39,39,17),(40,40,16),(41,41,21),(42,42,22),(43,43,23),(44,44,24),(45,45,25),(46,46,26),(47,47,26),(48,48,25),(49,49,24),(50,50,23),(51,51,22),(52,52,27),(53,53,28),(54,54,28),(55,55,29),(56,56,30),(57,57,31),(58,58,31),(59,59,30),(60,60,29),(61,61,32),(62,62,33),(63,63,34),(64,64,34),(65,65,33),(66,66,32),(67,67,35),(68,68,36),(69,69,37),(70,70,38),(71,71,39),(72,72,40),(73,73,40),(74,74,37),(75,75,38),(76,76,39),(77,77,36),(78,78,35),(79,79,40),(80,80,39),(81,81,38),(82,82,37),(83,83,36),(84,84,35),(85,85,41),(86,86,41),(87,87,42),(88,88,42),(89,89,43),(90,90,44),(91,91,45),(92,92,46),(93,93,47),(94,94,48),(95,95,48),(96,96,47),(97,97,46),(98,98,45),(99,99,44),(100,100,43);
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
INSERT INTO `submission_file_settings` VALUES (1,'en_US','name','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(2,'en_US','name','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(3,'','chapterId','4','string'),(3,'en_US','name','Critical History in Western Canada 1900–.pdf','string'),(4,'','chapterId','5','string'),(4,'en_US','name','Vernacular Currents in Western Canadian .pdf','string'),(5,'','chapterId','6','string'),(5,'en_US','name','Cree Intellectual Traditions in History.pdf','string'),(6,'','chapterId','7','string'),(6,'en_US','name','Visualizing Space, Race, and History in .pdf','string'),(7,'','chapterId','7','string'),(7,'en_US','name','Visualizing Space, Race, and History in .pdf','string'),(8,'','chapterId','6','string'),(8,'en_US','name','Cree Intellectual Traditions in History.pdf','string'),(9,'','chapterId','5','string'),(9,'en_US','name','Vernacular Currents in Western Canadian .pdf','string'),(10,'','chapterId','4','string'),(10,'en_US','name','Critical History in Western Canada 1900–.pdf','string'),(11,'en_US','name','The Political Economy of Workplace Injury in Canada.pdf','string'),(12,'','chapterId','13','string'),(12,'en_US','name','Introduction: Contexts of Popular Cultur.pdf','string'),(13,'','chapterId','14','string'),(13,'en_US','name','Chapter 1. A Future for Media Studies: C.pdf','string'),(14,'','chapterId','15','string'),(14,'en_US','name','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(15,'','chapterId','16','string'),(15,'en_US','name','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(16,'','chapterId','16','string'),(16,'en_US','name','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(17,'','chapterId','15','string'),(17,'en_US','name','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(18,'','chapterId','14','string'),(18,'en_US','name','Chapter 1. A Future for Media Studies: C.pdf','string'),(19,'','chapterId','13','string'),(19,'en_US','name','Introduction: Contexts of Popular Cultur.pdf','string'),(20,'en_US','name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(21,'en_US','name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(22,'en_US','name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(23,'','chapterId','23','string'),(23,'en_US','name','Identify: Understanding Your Information.pdf','string'),(24,'','chapterId','24','string'),(24,'en_US','name','Scope: Knowing What Is Available.pdf','string'),(25,'','chapterId','25','string'),(25,'en_US','name','Plan: Developing Research Strategies.pdf','string'),(26,'','chapterId','26','string'),(26,'en_US','name','Gather: Finding What You Need.pdf','string'),(27,'','chapterId','26','string'),(27,'en_US','name','Gather: Finding What You Need.pdf','string'),(28,'','chapterId','25','string'),(28,'en_US','name','Plan: Developing Research Strategies.pdf','string'),(29,'','chapterId','24','string'),(29,'en_US','name','Scope: Knowing What Is Available.pdf','string'),(30,'','chapterId','23','string'),(30,'en_US','name','Identify: Understanding Your Information.pdf','string'),(31,'','chapterId','27','string'),(31,'en_US','name','Introduction.pdf','string'),(32,'','chapterId','28','string'),(32,'en_US','name','Chapter 1: Interactions Affording Distan.pdf','string'),(33,'','chapterId','29','string'),(33,'en_US','name','Chapter 2: Learning Science at a Distanc.pdf','string'),(34,'','chapterId','30','string'),(34,'en_US','name','Chapter 3: Leadership Strategies for Coo.pdf','string'),(35,'','chapterId','31','string'),(35,'en_US','name','Chapter 4: Toward New Models of Flexible.pdf','string'),(36,'','chapterId','31','string'),(36,'en_US','name','Chapter 4: Toward New Models of Flexible.pdf','string'),(37,'','chapterId','30','string'),(37,'en_US','name','Chapter 3: Leadership Strategies for Coo.pdf','string'),(38,'','chapterId','29','string'),(38,'en_US','name','Chapter 2: Learning Science at a Distanc.pdf','string'),(39,'','chapterId','28','string'),(39,'en_US','name','Chapter 1: Interactions Affording Distan.pdf','string'),(40,'','chapterId','27','string'),(40,'en_US','name','Introduction.pdf','string'),(41,'en_US','name','Editorial.pdf','string'),(42,'','chapterId','32','string'),(42,'en_US','name','Internet, openness and the future of the.pdf','string'),(43,'','chapterId','33','string'),(43,'en_US','name','Imagining the Internet: Open, closed or .pdf','string'),(44,'','chapterId','34','string'),(44,'en_US','name','The internet in LAC will remain free, pu.pdf','string'),(45,'','chapterId','35','string'),(45,'en_US','name','Free Internet?.pdf','string'),(46,'','chapterId','36','string'),(46,'en_US','name','Risks and challenges for freedom of expr.pdf','string'),(47,'','chapterId','36','string'),(47,'en_US','name','Risks and challenges for freedom of expr.pdf','string'),(48,'','chapterId','35','string'),(48,'en_US','name','Free Internet?.pdf','string'),(49,'','chapterId','34','string'),(49,'en_US','name','The internet in LAC will remain free, pu.pdf','string'),(50,'','chapterId','33','string'),(50,'en_US','name','Imagining the Internet: Open, closed or .pdf','string'),(51,'','chapterId','32','string'),(51,'en_US','name','Internet, openness and the future of the.pdf','string'),(52,'en_US','name','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(53,'en_US','name','Dreamwork.pdf','string'),(54,'en_US','name','Dreamwork.pdf','string'),(55,'','chapterId','48','string'),(55,'en_US','name','Catalyzing Access through Social and Tec.pdf','string'),(56,'','chapterId','49','string'),(56,'en_US','name','Catalyzing Access via Telecommunications.pdf','string'),(57,'','chapterId','50','string'),(57,'en_US','name','Access to Knowledge as a New Paradigm fo.pdf','string'),(58,'','chapterId','50','string'),(58,'en_US','name','Access to Knowledge as a New Paradigm fo.pdf','string'),(59,'','chapterId','49','string'),(59,'en_US','name','Catalyzing Access via Telecommunications.pdf','string'),(60,'','chapterId','48','string'),(60,'en_US','name','Catalyzing Access through Social and Tec.pdf','string'),(61,'','chapterId','51','string'),(61,'en_US','name','Current State of Mobile Learning.pdf','string'),(62,'','chapterId','52','string'),(62,'en_US','name','A Model for Framing Mobile Learning.pdf','string'),(63,'','chapterId','53','string'),(63,'en_US','name','Mobile Distance Learning with PDAs: Deve.pdf','string'),(64,'','chapterId','53','string'),(64,'en_US','name','Mobile Distance Learning with PDAs: Deve.pdf','string'),(65,'','chapterId','52','string'),(65,'en_US','name','A Model for Framing Mobile Learning.pdf','string'),(66,'','chapterId','51','string'),(66,'en_US','name','Current State of Mobile Learning.pdf','string'),(67,'','chapterId','54','string'),(67,'en_US','name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(68,'','chapterId','55','string'),(68,'en_US','name','Chapter 2: Classical Music and the Class.pdf','string'),(69,'','chapterId','56','string'),(69,'en_US','name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(70,'','chapterId','57','string'),(70,'en_US','name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(71,'en_US','name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(72,'en_US','name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(73,'en_US','name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(74,'','chapterId','56','string'),(74,'en_US','name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(75,'','chapterId','57','string'),(75,'en_US','name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(76,'en_US','name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(77,'','chapterId','55','string'),(77,'en_US','name','Chapter 2: Classical Music and the Class.pdf','string'),(78,'','chapterId','54','string'),(78,'en_US','name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(79,'en_US','name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(80,'en_US','name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(81,'','chapterId','57','string'),(81,'en_US','name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(82,'','chapterId','56','string'),(82,'en_US','name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(83,'','chapterId','55','string'),(83,'en_US','name','Chapter 2: Classical Music and the Class.pdf','string'),(84,'','chapterId','54','string'),(84,'en_US','name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(85,'en_US','name','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(86,'en_US','name','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(87,'en_US','name','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(88,'en_US','name','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(89,'','chapterId','66','string'),(89,'en_US','name','Preface.pdf','string'),(90,'','chapterId','67','string'),(90,'en_US','name','Introduction.pdf','string'),(91,'','chapterId','68','string'),(91,'en_US','name','The Emergence of Open Development in a N.pdf','string'),(92,'','chapterId','69','string'),(92,'en_US','name','Enacting Openness in ICT4D Research.pdf','string'),(93,'','chapterId','70','string'),(93,'en_US','name','Transparency and Development: Ethical Co.pdf','string'),(94,'','chapterId','71','string'),(94,'en_US','name','Open Educational Resources: Opportunitie.pdf','string'),(95,'','chapterId','71','string'),(95,'en_US','name','Open Educational Resources: Opportunitie.pdf','string'),(96,'','chapterId','70','string'),(96,'en_US','name','Transparency and Development: Ethical Co.pdf','string'),(97,'','chapterId','69','string'),(97,'en_US','name','Enacting Openness in ICT4D Research.pdf','string'),(98,'','chapterId','68','string'),(98,'en_US','name','The Emergence of Open Development in a N.pdf','string'),(99,'','chapterId','67','string'),(99,'en_US','name','Introduction.pdf','string'),(100,'','chapterId','66','string'),(100,'en_US','name','Preface.pdf','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (1,1,1,NULL,3,2,NULL,NULL,NULL,'2022-10-26 07:27:39','2022-10-26 07:27:40',19,NULL,NULL,NULL),(2,1,1,1,3,4,NULL,NULL,NULL,'2022-10-26 07:28:06','2022-10-26 07:28:06',19,523,1,NULL),(3,2,2,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:28:41','2022-10-26 07:28:42',20,NULL,NULL,NULL),(4,2,3,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:28:42','2022-10-26 07:28:44',20,NULL,NULL,NULL),(5,2,4,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:28:44','2022-10-26 07:28:45',20,NULL,NULL,NULL),(6,2,5,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:28:46','2022-10-26 07:28:47',20,NULL,NULL,NULL),(7,2,5,6,4,4,NULL,NULL,NULL,'2022-10-26 07:30:12','2022-10-26 07:30:12',20,523,2,NULL),(8,2,4,5,4,4,NULL,NULL,NULL,'2022-10-26 07:30:12','2022-10-26 07:30:12',20,523,2,NULL),(9,2,3,4,4,4,NULL,NULL,NULL,'2022-10-26 07:30:12','2022-10-26 07:30:12',20,523,2,NULL),(10,2,2,3,4,4,NULL,NULL,NULL,'2022-10-26 07:30:12','2022-10-26 07:30:12',20,523,2,NULL),(11,3,6,NULL,3,2,NULL,NULL,NULL,'2022-10-26 07:30:45','2022-10-26 07:30:47',21,NULL,NULL,NULL),(12,4,7,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:31:23','2022-10-26 07:31:24',22,NULL,NULL,NULL),(13,4,8,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:31:24','2022-10-26 07:31:26',22,NULL,NULL,NULL),(14,4,9,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:31:26','2022-10-26 07:31:27',22,NULL,NULL,NULL),(15,4,10,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:31:28','2022-10-26 07:31:29',22,NULL,NULL,NULL),(16,4,10,15,4,19,NULL,NULL,NULL,'2022-10-26 07:32:32','2022-10-26 07:32:32',22,523,3,NULL),(17,4,9,14,4,19,NULL,NULL,NULL,'2022-10-26 07:32:32','2022-10-26 07:32:32',22,523,3,NULL),(18,4,8,13,4,19,NULL,NULL,NULL,'2022-10-26 07:32:33','2022-10-26 07:32:33',22,523,3,NULL),(19,4,7,12,4,19,NULL,NULL,NULL,'2022-10-26 07:32:33','2022-10-26 07:32:33',22,523,3,NULL),(20,5,11,NULL,3,2,NULL,NULL,NULL,'2022-10-26 07:33:57','2022-10-26 07:33:59',23,NULL,NULL,NULL),(21,5,11,20,3,19,NULL,NULL,NULL,'2022-10-26 07:34:42','2022-10-26 07:34:42',23,523,5,NULL),(22,5,11,20,3,10,'0','openAccess',1,'2022-10-26 07:35:55','2022-10-26 07:36:04',23,521,2,NULL),(23,6,12,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:36:18','2022-10-26 07:36:20',24,NULL,NULL,NULL),(24,6,13,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:36:20','2022-10-26 07:36:21',24,NULL,NULL,NULL),(25,6,14,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:36:22','2022-10-26 07:36:23',24,NULL,NULL,NULL),(26,6,15,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:36:23','2022-10-26 07:36:25',24,NULL,NULL,NULL),(27,6,15,26,4,19,NULL,NULL,NULL,'2022-10-26 07:37:25','2022-10-26 07:37:25',24,523,7,NULL),(28,6,14,25,4,19,NULL,NULL,NULL,'2022-10-26 07:37:25','2022-10-26 07:37:25',24,523,7,NULL),(29,6,13,24,4,19,NULL,NULL,NULL,'2022-10-26 07:37:25','2022-10-26 07:37:25',24,523,7,NULL),(30,6,12,23,4,19,NULL,NULL,NULL,'2022-10-26 07:37:26','2022-10-26 07:37:26',24,523,7,NULL),(31,7,16,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:38:15','2022-10-26 07:38:17',25,NULL,NULL,NULL),(32,7,17,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:38:17','2022-10-26 07:38:18',25,NULL,NULL,NULL),(33,7,18,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:38:19','2022-10-26 07:38:20',25,NULL,NULL,NULL),(34,7,19,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:38:20','2022-10-26 07:38:21',25,NULL,NULL,NULL),(35,7,20,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:38:22','2022-10-26 07:38:23',25,NULL,NULL,NULL),(36,7,20,35,4,4,NULL,NULL,NULL,'2022-10-26 07:39:47','2022-10-26 07:39:47',25,523,8,NULL),(37,7,19,34,4,4,NULL,NULL,NULL,'2022-10-26 07:39:47','2022-10-26 07:39:47',25,523,8,NULL),(38,7,18,33,4,4,NULL,NULL,NULL,'2022-10-26 07:39:47','2022-10-26 07:39:47',25,523,8,NULL),(39,7,17,32,4,4,NULL,NULL,NULL,'2022-10-26 07:39:47','2022-10-26 07:39:47',25,523,8,NULL),(40,7,16,31,4,4,NULL,NULL,NULL,'2022-10-26 07:39:47','2022-10-26 07:39:47',25,523,8,NULL),(41,8,21,NULL,3,2,NULL,NULL,NULL,'2022-10-26 07:40:30','2022-10-26 07:40:32',3,NULL,NULL,NULL),(42,9,22,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:40:45','2022-10-26 07:40:46',26,NULL,NULL,NULL),(43,9,23,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:40:47','2022-10-26 07:40:48',26,NULL,NULL,NULL),(44,9,24,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:40:48','2022-10-26 07:40:50',26,NULL,NULL,NULL),(45,9,25,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:40:50','2022-10-26 07:40:51',26,NULL,NULL,NULL),(46,9,26,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:40:52','2022-10-26 07:40:53',26,NULL,NULL,NULL),(47,9,26,46,4,19,NULL,NULL,NULL,'2022-10-26 07:42:13','2022-10-26 07:42:13',26,523,9,NULL),(48,9,25,45,4,19,NULL,NULL,NULL,'2022-10-26 07:42:13','2022-10-26 07:42:13',26,523,9,NULL),(49,9,24,44,4,19,NULL,NULL,NULL,'2022-10-26 07:42:13','2022-10-26 07:42:13',26,523,9,NULL),(50,9,23,43,4,19,NULL,NULL,NULL,'2022-10-26 07:42:14','2022-10-26 07:42:14',26,523,9,NULL),(51,9,22,42,4,19,NULL,NULL,NULL,'2022-10-26 07:42:14','2022-10-26 07:42:14',26,523,9,NULL),(52,10,27,NULL,3,2,NULL,NULL,NULL,'2022-10-26 07:42:30','2022-10-26 07:42:32',27,NULL,NULL,NULL),(53,11,28,NULL,3,2,NULL,NULL,NULL,'2022-10-26 07:43:28','2022-10-26 07:43:29',28,NULL,NULL,NULL),(54,11,28,53,3,19,NULL,NULL,NULL,'2022-10-26 07:43:53','2022-10-26 07:43:53',28,523,10,NULL),(55,12,29,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:45:22','2022-10-26 07:45:24',29,NULL,NULL,NULL),(56,12,30,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:45:24','2022-10-26 07:45:25',29,NULL,NULL,NULL),(57,12,31,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:45:25','2022-10-26 07:45:27',29,NULL,NULL,NULL),(58,12,31,57,4,19,NULL,NULL,NULL,'2022-10-26 07:46:41','2022-10-26 07:46:41',29,523,12,NULL),(59,12,30,56,4,19,NULL,NULL,NULL,'2022-10-26 07:46:41','2022-10-26 07:46:41',29,523,12,NULL),(60,12,29,55,4,19,NULL,NULL,NULL,'2022-10-26 07:46:41','2022-10-26 07:46:41',29,523,12,NULL),(61,13,32,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:47:35','2022-10-26 07:47:36',30,NULL,NULL,NULL),(62,13,33,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:47:37','2022-10-26 07:47:38',30,NULL,NULL,NULL),(63,13,34,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:47:38','2022-10-26 07:47:40',30,NULL,NULL,NULL),(64,13,34,63,4,19,NULL,NULL,NULL,'2022-10-26 07:48:33','2022-10-26 07:48:33',30,523,13,NULL),(65,13,33,62,4,19,NULL,NULL,NULL,'2022-10-26 07:48:33','2022-10-26 07:48:33',30,523,13,NULL),(66,13,32,61,4,19,NULL,NULL,NULL,'2022-10-26 07:48:33','2022-10-26 07:48:33',30,523,13,NULL),(67,14,35,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:50:22','2022-10-26 07:50:23',31,NULL,NULL,NULL),(68,14,36,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:50:23','2022-10-26 07:50:25',31,NULL,NULL,NULL),(69,14,37,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:50:25','2022-10-26 07:50:26',31,NULL,NULL,NULL),(70,14,38,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:50:26','2022-10-26 07:50:28',31,NULL,NULL,NULL),(71,14,39,NULL,13,2,NULL,NULL,NULL,'2022-10-26 07:50:28','2022-10-26 07:50:30',31,NULL,NULL,NULL),(72,14,40,NULL,9,2,NULL,NULL,NULL,'2022-10-26 07:50:30','2022-10-26 07:50:32',31,NULL,NULL,NULL),(73,14,40,72,9,19,NULL,NULL,NULL,'2022-10-26 07:51:36','2022-10-26 07:51:36',31,523,15,NULL),(74,14,37,69,4,19,NULL,NULL,NULL,'2022-10-26 07:51:36','2022-10-26 07:51:36',31,523,15,NULL),(75,14,38,70,4,19,NULL,NULL,NULL,'2022-10-26 07:51:36','2022-10-26 07:51:36',31,523,15,NULL),(76,14,39,71,13,19,NULL,NULL,NULL,'2022-10-26 07:51:36','2022-10-26 07:51:36',31,523,15,NULL),(77,14,36,68,4,19,NULL,NULL,NULL,'2022-10-26 07:51:36','2022-10-26 07:51:36',31,523,15,NULL),(78,14,35,67,4,19,NULL,NULL,NULL,'2022-10-26 07:51:36','2022-10-26 07:51:36',31,523,15,NULL),(79,14,40,72,9,10,'0','openAccess',1,'2022-10-26 07:53:07','2022-10-26 07:53:50',31,521,3,NULL),(80,14,39,71,13,10,'0','openAccess',1,'2022-10-26 07:53:07','2022-10-26 07:53:43',31,521,3,NULL),(81,14,38,70,4,10,'0','openAccess',1,'2022-10-26 07:53:07','2022-10-26 07:53:37',31,521,3,NULL),(82,14,37,69,4,10,'0','openAccess',1,'2022-10-26 07:53:07','2022-10-26 07:53:30',31,521,3,NULL),(83,14,36,68,4,10,'0','openAccess',1,'2022-10-26 07:53:07','2022-10-26 07:53:23',31,521,3,NULL),(84,14,35,67,4,10,'0','openAccess',1,'2022-10-26 07:53:07','2022-10-26 07:53:18',31,521,3,NULL),(85,15,41,NULL,3,2,NULL,NULL,NULL,'2022-10-26 07:54:05','2022-10-26 07:54:07',32,NULL,NULL,NULL),(86,15,41,85,3,4,NULL,NULL,NULL,'2022-10-26 07:54:37','2022-10-26 07:54:37',32,523,17,NULL),(87,16,42,NULL,3,2,NULL,NULL,NULL,'2022-10-26 07:54:51','2022-10-26 07:54:53',33,NULL,NULL,NULL),(88,16,42,87,3,4,NULL,NULL,NULL,'2022-10-26 07:55:33','2022-10-26 07:55:33',33,523,18,NULL),(89,17,43,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:56:22','2022-10-26 07:56:24',34,NULL,NULL,NULL),(90,17,44,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:56:24','2022-10-26 07:56:25',34,NULL,NULL,NULL),(91,17,45,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:56:26','2022-10-26 07:56:27',34,NULL,NULL,NULL),(92,17,46,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:56:27','2022-10-26 07:56:29',34,NULL,NULL,NULL),(93,17,47,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:56:29','2022-10-26 07:56:30',34,NULL,NULL,NULL),(94,17,48,NULL,4,2,NULL,NULL,NULL,'2022-10-26 07:56:31','2022-10-26 07:56:32',34,NULL,NULL,NULL),(95,17,48,94,4,19,NULL,NULL,NULL,'2022-10-26 07:58:29','2022-10-26 07:58:29',34,523,19,NULL),(96,17,47,93,4,19,NULL,NULL,NULL,'2022-10-26 07:58:29','2022-10-26 07:58:29',34,523,19,NULL),(97,17,46,92,4,19,NULL,NULL,NULL,'2022-10-26 07:58:29','2022-10-26 07:58:29',34,523,19,NULL),(98,17,45,91,4,19,NULL,NULL,NULL,'2022-10-26 07:58:29','2022-10-26 07:58:29',34,523,19,NULL),(99,17,44,90,4,19,NULL,NULL,NULL,'2022-10-26 07:58:29','2022-10-26 07:58:29',34,523,19,NULL),(100,17,43,89,4,19,NULL,NULL,NULL,'2022-10-26 07:58:29','2022-10-26 07:58:29',34,523,19,NULL);
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
INSERT INTO `submission_search_object_keywords` VALUES (1,1,0),(1,2,1),(3,2,13),(1,3,2),(9,3,2),(9,3,7),(9,3,10),(1,4,3),(1,5,4),(2,6,0),(3,6,28),(2,7,1),(3,7,0),(3,7,8),(3,7,18),(3,7,29),(3,7,43),(2,8,2),(2,9,3),(2,10,4),(3,10,15),(2,11,5),(3,11,16),(3,12,1),(3,12,44),(3,13,2),(3,13,45),(3,14,3),(3,15,4),(3,16,5),(3,17,6),(3,18,7),(3,19,9),(3,20,10),(3,21,11),(3,22,12),(3,23,14),(3,24,17),(3,25,19),(3,26,20),(3,27,21),(3,28,22),(3,29,23),(3,30,24),(3,31,25),(3,32,26),(3,33,27),(3,34,30),(3,35,31),(3,36,32),(3,37,33),(3,38,34),(3,39,35),(3,40,36),(3,41,37),(3,42,38),(3,43,39),(3,44,40),(3,45,41),(11,45,57),(3,46,42),(5,47,0),(5,48,1),(5,48,4),(5,48,7),(5,49,2),(5,50,3),(5,51,5),(5,52,6),(9,53,0),(9,53,8),(9,54,1),(9,55,3),(9,56,4),(9,57,5),(9,58,6),(9,59,9),(9,60,11),(10,61,0),(11,61,0),(11,61,23),(10,62,1),(11,62,1),(11,62,24),(10,63,2),(11,63,3),(11,63,17),(10,64,3),(11,64,4),(11,64,18),(11,64,21),(10,65,4),(11,65,5),(11,65,19),(11,65,22),(10,66,5),(11,66,11),(11,66,53),(10,67,6),(11,67,13),(11,67,54),(11,68,2),(11,69,6),(11,70,7),(11,71,8),(11,72,9),(11,73,10),(11,74,12),(11,75,14),(11,76,15),(11,77,16),(11,78,20),(11,79,25),(11,80,26),(11,81,27),(11,82,28),(11,83,29),(11,84,30),(11,84,48),(11,85,31),(11,86,32),(11,87,33),(11,88,34),(11,89,35),(11,90,36),(11,91,37),(11,92,38),(11,93,39),(11,93,51),(11,94,40),(11,95,41),(11,96,42),(11,96,58),(11,97,43),(11,98,44),(11,99,45),(11,100,46),(11,101,47),(11,102,49),(11,103,50),(11,104,52),(11,105,55),(11,106,56),(11,107,59),(11,108,60),(11,109,61),(13,110,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_objects`
--

LOCK TABLES `submission_search_objects` WRITE;
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
INSERT INTO `submission_search_objects` VALUES (1,5,1,0),(2,5,2,0),(3,5,4,0),(4,5,16,0),(5,5,17,0),(6,5,8,0),(7,5,32,0),(8,5,64,0),(9,14,1,0),(10,14,2,0),(11,14,4,0),(12,14,16,0),(13,14,17,0),(14,14,8,0),(15,14,32,0),(16,14,64,0);
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
  `submission_progress` smallint(6) NOT NULL DEFAULT '1',
  `work_type` smallint(6) DEFAULT '0',
  PRIMARY KEY (`submission_id`),
  KEY `submissions_context_id` (`context_id`),
  KEY `submissions_publication_id` (`current_publication_id`),
  CONSTRAINT `submissions_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `submissions_publication_id` FOREIGN KEY (`current_publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,1,1,'2022-10-26 07:28:29','2022-10-26 07:27:55','2022-10-26 07:27:55',4,'en_US',1,0,2),(2,1,2,'2022-10-26 07:30:33','2022-10-26 07:29:55','2022-10-26 07:29:55',3,'en_US',1,0,1),(3,1,3,'2022-10-26 07:31:12','2022-10-26 07:31:12','2022-10-26 07:31:12',1,'en_US',1,0,2),(4,1,4,'2022-10-26 07:33:45','2022-10-26 07:32:17','2022-10-26 07:32:17',5,'en_US',1,0,1),(5,1,5,'2022-10-26 07:36:06','2022-10-26 07:34:28','2022-10-26 07:34:28',5,'en_US',3,0,2),(6,1,6,'2022-10-26 07:37:50','2022-10-26 07:37:09','2022-10-26 07:37:09',2,'en_US',1,0,1),(7,1,7,'2022-10-26 07:40:16','2022-10-26 07:39:29','2022-10-26 07:39:29',4,'en_US',1,0,1),(8,1,8,'2022-10-26 07:40:34','2022-10-26 07:40:34','2022-10-26 07:40:34',1,'en_US',1,0,2),(9,1,9,'2022-10-26 07:42:14','2022-10-26 07:41:54','2022-10-26 07:41:54',2,'en_US',1,0,1),(10,1,10,'2022-10-26 07:43:16','2022-10-26 07:43:16','2022-10-26 07:43:16',1,'en_US',1,0,2),(11,1,11,'2022-10-26 07:45:06','2022-10-26 07:43:40','2022-10-26 07:44:25',4,'en_US',1,0,2),(12,1,12,'2022-10-26 07:47:22','2022-10-26 07:46:23','2022-10-26 07:47:01',2,'en_US',1,0,1),(13,1,13,'2022-10-26 07:50:04','2022-10-26 07:48:17','2022-10-26 07:49:16',4,'en_US',1,0,1),(14,1,14,'2022-10-26 07:53:53','2022-10-26 07:51:17','2022-10-26 07:51:17',5,'en_US',3,0,1),(15,1,15,'2022-10-26 07:54:37','2022-10-26 07:54:22','2022-10-26 07:54:22',3,'en_US',1,0,2),(16,1,16,'2022-10-26 07:56:10','2022-10-26 07:55:16','2022-10-26 07:55:43',3,'en_US',1,0,2),(17,1,17,'2022-10-26 07:58:51','2022-10-26 07:58:04','2022-10-26 07:58:04',2,'en_US',1,0,1);
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
INSERT INTO `user_user_groups` VALUES (1,1),(2,1),(2,2),(3,3),(5,4),(5,5),(5,6),(6,13),(6,14),(10,15),(10,16),(12,17),(12,18),(13,3),(13,19),(13,21),(13,23),(13,27),(13,28),(13,32),(13,33),(14,20),(14,22),(14,24),(14,25),(14,26),(14,29),(14,30),(14,31),(14,34),(17,7),(17,8),(17,9),(18,10),(18,11),(18,12),(19,19),(19,20),(19,21),(19,22),(19,23),(19,24),(19,25),(19,26),(19,27),(19,28),(19,29),(19,30),(19,31),(19,32),(19,33),(19,34);
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
INSERT INTO `users` VALUES (1,'admin','$2y$10$dU6C9mANlIuk9bovqMGI1ejjmKCaEwYFQ7DY1010JXBq2O9A9Uq4q','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,'[]',NULL,NULL,'2022-10-26 07:22:30',NULL,'2022-10-26 07:27:11',NULL,NULL,NULL,0,NULL,1),(2,'rvaca','$2y$10$orXwgqMcITe27szW89XqhutHOgMxVXTOxg9kmagS4.I6zfJcCgvV.','rvaca@mailinator.com','','','',NULL,'MX','[]',NULL,NULL,'2022-10-26 07:23:54',NULL,'2022-10-26 07:26:42',0,NULL,NULL,0,NULL,1),(3,'dbarnes','$2y$10$5..mX51Dnm52avBKm5X9yuoO2aku.Wv9r7sgWyf1lD5D16wbBy1le','dbarnes@mailinator.com','','','',NULL,'AU','[]',NULL,NULL,'2022-10-26 07:24:02',NULL,'2022-10-26 07:58:07',0,NULL,NULL,0,NULL,1),(4,'dbuskins','$2y$10$iU1bme/22eyHdUvVbcG7huZLDEOIC3g7p.uvASc4Ll3xNOKtYqTlC','dbuskins@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2022-10-26 07:24:09',NULL,NULL,0,NULL,NULL,0,NULL,1),(5,'sberardo','$2y$10$LUJS1HOnXoCsJWm8OQtBPe069pSOIVj4XZbQIQpcGn/CEfOm428Yu','sberardo@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2022-10-26 07:24:16',NULL,NULL,0,NULL,NULL,0,NULL,1),(6,'minoue','$2y$10$X9zPlQXerGJVuFNtoWG1gO4a4RqSB.l2ATQ27LsRQuUp4mQ/HWrYe','minoue@mailinator.com','','','',NULL,'JP','[]',NULL,NULL,'2022-10-26 07:24:23',NULL,'2022-10-26 07:37:38',0,NULL,NULL,0,NULL,1),(7,'jjanssen','$2y$10$HsbACLS23QtPcvz8LUQRvO84SwmESarKeu.N.K3c.cpUWg6U1dfWy','jjanssen@mailinator.com','','','',NULL,'NL','[]',NULL,NULL,'2022-10-26 07:24:31',NULL,NULL,0,NULL,NULL,0,NULL,1),(8,'phudson','$2y$10$uGjJpb8RnDvHXGCRUpX1HOwRU9.8gHq.qzQg2.J4YDlzI9/riy1re','phudson@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2022-10-26 07:24:39',NULL,'2022-10-26 07:47:12',0,NULL,NULL,0,NULL,1),(9,'amccrae','$2y$10$fXDrlYi1Fss0gf9F9XQyYO/JiMX4HcBgSbpG.7ZJqw0HcKw6qV/GG','amccrae@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2022-10-26 07:24:48',NULL,NULL,0,NULL,NULL,0,NULL,1),(10,'agallego','$2y$10$RRXFJYXWUDW89ytyt52z2.FKd.OVF0gsx1t6fl1oQmiYFJXKLBknW','agallego@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2022-10-26 07:24:58',NULL,'2022-10-26 07:56:00',0,NULL,NULL,0,NULL,1),(11,'alzacharia','$2y$10$HqKhrVKeuX/IKe759x.CkOZREmOkQ6L3.nGiDKmGVtPfjt3zfJid.','alzacharia@mailinator.com','','','',NULL,'GH','[]',NULL,NULL,'2022-10-26 07:25:07',NULL,NULL,0,NULL,NULL,0,NULL,1),(12,'gfavio','$2y$10$dt3hkR7ihsjtOXu6oSuzoeqhKOY6l0cXPvxJnFeWchrzNfYDikoKC','gfavio@mailinator.com','','','',NULL,'ES','[]',NULL,NULL,'2022-10-26 07:25:18',NULL,'2022-10-26 07:49:30',0,NULL,NULL,0,NULL,1),(13,'mfritz','$2y$10$Fo6LOhC7t.dPgppSDcIal.mdCKtEMUjL5AuGlE1UVXEAhXdPjw4GG','mfritz@mailinator.com','','','',NULL,'BE','[]',NULL,NULL,'2022-10-26 07:25:28',NULL,NULL,0,NULL,NULL,0,NULL,1),(14,'svogt','$2y$10$PJLbMWvqySXixmQCRnHrO.p7C8b2rqL8qplelgPhEC5vY6RKLz4u2','svogt@mailinator.com','','','',NULL,'CL','[]',NULL,NULL,'2022-10-26 07:25:39',NULL,NULL,0,NULL,NULL,0,NULL,1),(15,'gcox','$2y$10$0xGTA.Gq.8VUvoNFyJZ78Of5DyivGdHVLS8QTH4ovY9hIHhfiZeIO','gcox@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2022-10-26 07:25:52',NULL,NULL,0,NULL,NULL,0,NULL,1),(16,'shellier','$2y$10$tBNuRGR6FrtUa/sP5T8zfeK6xAvca5kV9tcTuKgEUAElkrGzRfHJq','shellier@mailinator.com','','','',NULL,'ZA','[]',NULL,NULL,'2022-10-26 07:26:05',NULL,NULL,0,NULL,NULL,0,NULL,1),(17,'cturner','$2y$10$5fra6vmmli1tCHQbo3ACKeRCUiJmawn2BdUHkvT9NXZOxkSX3mu7m','cturner@mailinator.com','','','',NULL,'GB','[]',NULL,NULL,'2022-10-26 07:26:18',NULL,NULL,0,NULL,NULL,0,NULL,1),(18,'skumar','$2y$10$rNeI5AwPZ7jS9qVUKd0UQuKycZ1aet4sncIJbTl4xGiwK6VunqjcK','skumar@mailinator.com','','','',NULL,'SG','[]',NULL,NULL,'2022-10-26 07:26:31',NULL,NULL,0,NULL,NULL,0,NULL,1),(19,'aclark','$2y$10$K4NyyOgNroswgC7WZ3Qi/ucubbLdAFC4FIdOalAXFlT5aDM2X86ki','aclark@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2022-10-26 07:27:33',NULL,'2022-10-26 07:27:33',NULL,NULL,NULL,0,NULL,1),(20,'afinkel','$2y$10$tVNE0sL.RoXU0d7SgIXg9.57tm0FmBHMGE/6YiDbAzRXf7j8pWpTm','afinkel@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2022-10-26 07:28:35',NULL,'2022-10-26 07:28:35',NULL,NULL,NULL,0,NULL,1),(21,'bbarnetson','$2y$10$WCQpdzHztNm2PSUACZuNf.prmRgioU63nvm1PafLFDWcA0Vsl2U/i','bbarnetson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2022-10-26 07:30:40',NULL,'2022-10-26 07:30:40',NULL,NULL,NULL,0,NULL,1),(22,'bbeaty','$2y$10$AZ5OP2Zr3wCkTnDaz5hMM.bdyOWE5qRT2e417/b0tcVPVUoYLY7TW','bbeaty@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2022-10-26 07:31:17',NULL,'2022-10-26 07:31:17',NULL,NULL,NULL,0,NULL,1),(23,'callan','$2y$10$V5TJNk63IZOVa60osNJOuuYY0jiXf0OzuwbbkAMFoWcNIqK.ioadm','callan@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2022-10-26 07:33:51',NULL,'2022-10-26 07:33:52',NULL,NULL,NULL,0,NULL,1),(24,'dbernnard','$2y$10$CWZII55GJ9HStTx2SHJZSOZHU.9FAh0DIb5suelGGiju44/qpMryu','dbernnard@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2022-10-26 07:36:12',NULL,'2022-10-26 07:36:13',NULL,NULL,NULL,0,NULL,1),(25,'dkennepohl','$2y$10$RkHWlxVqSSKnAuXYWH37vuI8.i8QqyZJIZchttOvr.De5ezE.yeeC','dkennepohl@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2022-10-26 07:38:10',NULL,'2022-10-26 07:38:10',NULL,NULL,NULL,0,NULL,1),(26,'fperini','$2y$10$YKF.B9BXhlDeAQrtyygQ4uuz3g0MjhU..EGUThC7c/h.ylDScL0Xu','fperini@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2022-10-26 07:40:39',NULL,'2022-10-26 07:40:39',NULL,NULL,NULL,0,NULL,1),(27,'jbrower','$2y$10$cU1W5u7E2fb.gj9rAWmUSeD.ZvhNF1xIx7TJiiJ2CFF7xxRdk3KvS','jbrower@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2022-10-26 07:42:25',NULL,'2022-10-26 07:42:25',NULL,NULL,NULL,0,NULL,1),(28,'jlockehart','$2y$10$uYcCTRefAyQodz.HZ/uZQOJXoXav/Vz1yqI8RyHUo7kIhdVW77742','jlockehart@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2022-10-26 07:43:22',NULL,'2022-10-26 07:43:22',NULL,NULL,NULL,0,NULL,1),(29,'lelder','$2y$10$WE.eKP6aDYHl./hU0FODHe8TA1NUvkGjg79C4mshCoOECOOitun/O','lelder@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2022-10-26 07:45:17',NULL,'2022-10-26 07:45:17',NULL,NULL,NULL,0,NULL,1),(30,'mally','$2y$10$JGlVg41qiPQKxpybYlgt1us0vCtDOpgxP0G2LRrJHvLaUZrVEMlIe','mally@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2022-10-26 07:47:29',NULL,'2022-10-26 07:47:29',NULL,NULL,NULL,0,NULL,1),(31,'mdawson','$2y$10$9YbvyUGKOOxDyfg/tjku.OUe7o95zj7lQCA9RGkZAWv3iq3GMAtme','mdawson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2022-10-26 07:50:16',NULL,'2022-10-26 07:50:16',NULL,NULL,NULL,0,NULL,1),(32,'mforan','$2y$10$F8VnSUDEhpteKqjiIiKPYuGIl6qL9mjDiRBoUyDfrCyia.XLU3Lri','mforan@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2022-10-26 07:54:00',NULL,'2022-10-26 07:54:00',NULL,NULL,NULL,0,NULL,1),(33,'mpower','$2y$10$75LJa3.Dx.I7YQN8Jn5sD.i3IYFB0R7QgaMdPsSLQSqF5AejwEooC','mpower@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2022-10-26 07:54:46',NULL,'2022-10-26 07:54:46',NULL,NULL,NULL,0,NULL,1),(34,'msmith','$2y$10$jL8TXBRXeD0vZpSawnMYx.t0XLsvScAZTzxpepXlptWqKqej7qNBW','msmith@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2022-10-26 07:56:17',NULL,'2022-10-26 07:56:17',NULL,NULL,NULL,0,NULL,1);
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
INSERT INTO `versions` VALUES (1,0,0,0,'2022-10-26 07:22:31',1,'plugins.metadata','dc11','',0,0),(1,0,0,0,'2022-10-26 07:22:31',1,'plugins.pubIds','urn','\\APP\\plugins\\pubIds\\urn\\URNPubIdPlugin',0,0),(1,0,0,0,'2022-10-26 07:22:31',1,'plugins.blocks','information','InformationBlockPlugin',1,0),(1,0,0,0,'2022-10-26 07:22:31',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,0,0,0,'2022-10-26 07:22:31',1,'plugins.blocks','browse','\\APP\\plugins\\blocks\\browse\\BrowseBlockPlugin',1,0),(1,0,0,0,'2022-10-26 07:22:31',1,'plugins.blocks','makeSubmission','MakeSubmissionBlockPlugin',1,0),(1,0,0,0,'2022-10-26 07:22:31',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(1,0,0,0,'2022-10-26 07:22:31',1,'plugins.generic','dublinCoreMeta','DublinCoreMetaPlugin',1,0),(1,0,0,0,'2022-10-26 07:22:31',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(1,0,0,0,'2022-10-26 07:22:31',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(1,0,0,0,'2022-10-26 07:22:31',1,'plugins.generic','usageEvent','',0,1),(1,0,0,0,'2022-10-26 07:22:31',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(1,2,0,0,'2022-10-26 07:22:31',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(1,0,0,0,'2022-10-26 07:22:31',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,0,0,0,'2022-10-26 07:22:31',1,'plugins.generic','htmlMonographFile','HtmlMonographFilePlugin',1,0),(1,3,0,0,'2022-10-26 07:22:31',1,'plugins.generic','acron','AcronPlugin',1,1),(1,2,0,0,'2022-10-26 07:22:31',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),(1,0,0,0,'2022-10-26 07:22:31',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(1,0,0,0,'2022-10-26 07:22:31',1,'plugins.themes','default','DefaultThemePlugin',1,0),(1,0,0,0,'2022-10-26 07:22:31',1,'plugins.importexport','users','',0,0),(1,0,0,0,'2022-10-26 07:22:31',1,'plugins.importexport','csv','',0,0),(1,0,0,0,'2022-10-26 07:22:31',1,'plugins.importexport','onix30','',0,0),(1,0,0,0,'2022-10-26 07:22:31',1,'plugins.importexport','native','',0,0),(1,0,0,0,'2022-10-26 07:22:31',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,0,0,0,'2022-10-26 07:22:31',1,'plugins.paymethod','manual','',0,0),(1,0,0,0,'2022-10-26 07:22:31',1,'plugins.paymethod','paypal','',0,0),(1,0,0,0,'2022-10-26 07:22:31',1,'plugins.reports','monographReport','',0,0),(2,0,0,0,'2022-10-26 07:22:31',1,'plugins.reports','reviewReport','',0,0),(3,4,0,0,'2022-10-26 07:22:23',1,'core','omp','',0,1);
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

-- Dump completed on 2022-10-26  7:58:54
