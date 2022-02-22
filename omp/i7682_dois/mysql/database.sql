-- MySQL dump 10.13  Distrib 5.7.36, for Linux (x86_64)
--
-- Host: localhost    Database: omp-ci
-- ------------------------------------------------------
-- Server version	5.7.36-0ubuntu0.18.04.1

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
  KEY `access_keys_hash` (`key_hash`,`user_id`,`context`)
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
  `setting_value` text,
  `setting_type` varchar(6) DEFAULT NULL,
  UNIQUE KEY `announcement_settings_pkey` (`announcement_id`,`locale`,`setting_name`),
  KEY `announcement_settings_announcement_id` (`announcement_id`),
  CONSTRAINT `announcement_settings_announcement_id_foreign` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`announcement_id`)
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
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `announcement_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `announcement_type_settings_type_id` (`type_id`),
  CONSTRAINT `announcement_type_settings_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `announcement_types` (`type_id`)
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
  CONSTRAINT `announcement_types_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`)
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
  KEY `announcements_type_id_foreign` (`type_id`),
  KEY `announcements_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `announcements_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `announcement_types` (`type_id`)
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
-- Table structure for table `auth_sources`
--

DROP TABLE IF EXISTS `auth_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_sources` (
  `auth_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `plugin` varchar(32) NOT NULL,
  `auth_default` smallint(6) NOT NULL DEFAULT '0',
  `settings` text,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sources`
--

LOCK TABLES `auth_sources` WRITE;
/*!40000 ALTER TABLE `auth_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sources` ENABLE KEYS */;
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
  `setting_value` text,
  UNIQUE KEY `author_settings_pkey` (`author_id`,`locale`,`setting_name`),
  KEY `author_settings_author_id` (`author_id`)
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
  KEY `authors_publication_id` (`publication_id`)
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
  KEY `category_context_id` (`context_id`,`parent_id`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,1,NULL,1,'applied-science',NULL),(2,1,1,3,'comp-sci',NULL),(3,1,1,4,'eng',NULL),(4,1,NULL,2,'social-sciences',NULL),(5,1,4,5,'sociology',NULL),(6,1,4,10000,'anthropology',NULL);
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
  `setting_value` text,
  UNIQUE KEY `category_settings_pkey` (`category_id`,`locale`,`setting_name`),
  CONSTRAINT `category_settings_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
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
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `citation_settings_pkey` (`citation_id`,`locale`,`setting_name`),
  KEY `citation_settings_citation_id` (`citation_id`)
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
  `publication_id` bigint(20) NOT NULL DEFAULT '0',
  `raw_citation` text NOT NULL,
  `seq` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`citation_id`),
  UNIQUE KEY `citations_publication_seq` (`publication_id`,`seq`),
  KEY `citations_publication` (`publication_id`)
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
  PRIMARY KEY (`completed_payment_id`)
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
  KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`)
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
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`)
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
  KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`)
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
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `data_object_tombstone_settings_pkey` (`tombstone_id`,`locale`,`setting_name`),
  KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`)
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
  `setting_value` text,
  UNIQUE KEY `doi_settings_pkey` (`doi_id`,`locale`,`setting_name`),
  KEY `doi_settings_doi_id` (`doi_id`),
  CONSTRAINT `doi_settings_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`)
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
  KEY `dois_context_id_foreign` (`context_id`),
  CONSTRAINT `dois_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`)
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
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` smallint(6) NOT NULL,
  `editor_id` bigint(20) NOT NULL,
  `decision` smallint(6) NOT NULL,
  `date_decided` datetime NOT NULL,
  PRIMARY KEY (`edit_decision_id`),
  KEY `edit_decisions_submission_id` (`submission_id`),
  KEY `edit_decisions_editor_id` (`editor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
INSERT INTO `edit_decisions` VALUES (1,1,0,1,0,3,3,'2022-02-22 19:53:41'),(2,1,1,3,1,3,2,'2022-02-22 19:53:51'),(3,2,0,1,0,3,3,'2022-02-22 19:55:57'),(4,4,0,1,0,3,1,'2022-02-22 19:58:24'),(5,4,3,2,1,3,3,'2022-02-22 19:58:37'),(6,4,4,3,1,3,2,'2022-02-22 19:58:51'),(7,4,0,4,0,3,7,'2022-02-22 19:59:04'),(8,5,0,1,0,3,1,'2022-02-22 20:00:34'),(9,5,5,2,1,3,3,'2022-02-22 20:00:45'),(10,5,6,3,1,3,2,'2022-02-22 20:00:56'),(11,5,0,4,0,3,7,'2022-02-22 20:01:07'),(12,6,0,1,0,3,1,'2022-02-22 20:03:00'),(13,6,7,2,1,6,15,'2022-02-22 20:03:22'),(14,7,0,1,0,3,3,'2022-02-22 20:05:35'),(15,7,8,3,1,3,2,'2022-02-22 20:05:50'),(16,9,0,1,0,3,1,'2022-02-22 20:07:58'),(17,11,0,1,0,3,1,'2022-02-22 20:09:37'),(18,11,10,2,1,3,3,'2022-02-22 20:09:47'),(19,11,11,3,1,3,2,'2022-02-22 20:10:36'),(20,12,0,1,0,3,1,'2022-02-22 20:12:17'),(21,13,0,1,0,3,1,'2022-02-22 20:14:08'),(22,13,13,2,1,3,3,'2022-02-22 20:14:20'),(23,13,14,3,1,3,2,'2022-02-22 20:15:27'),(24,14,0,1,0,3,1,'2022-02-22 20:16:52'),(25,14,15,2,1,3,3,'2022-02-22 20:17:06'),(26,14,16,3,1,3,2,'2022-02-22 20:17:20'),(27,14,0,4,0,3,7,'2022-02-22 20:17:35'),(28,15,0,1,0,3,3,'2022-02-22 20:19:36'),(29,16,0,1,0,3,3,'2022-02-22 20:20:25'),(30,17,0,1,0,3,1,'2022-02-22 20:23:32');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
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
  UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log_users`
--

LOCK TABLES `email_log_users` WRITE;
/*!40000 ALTER TABLE `email_log_users` DISABLE KEYS */;
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
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `context_id` bigint(20) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email_templates_email_key` (`email_key`,`context_id`)
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
-- Table structure for table `email_templates_default`
--

DROP TABLE IF EXISTS `email_templates_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_default` (
  `email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `can_disable` smallint(6) NOT NULL DEFAULT '0',
  `can_edit` smallint(6) NOT NULL DEFAULT '0',
  `from_role_id` bigint(20) DEFAULT NULL,
  `to_role_id` bigint(20) DEFAULT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  KEY `email_templates_default_email_key` (`email_key`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default`
--

LOCK TABLES `email_templates_default` WRITE;
/*!40000 ALTER TABLE `email_templates_default` DISABLE KEYS */;
INSERT INTO `email_templates_default` VALUES (1,'NOTIFICATION',0,1,NULL,NULL,NULL),(2,'NOTIFICATION_CENTER_DEFAULT',0,1,NULL,NULL,NULL),(3,'PASSWORD_RESET_CONFIRM',0,1,NULL,NULL,NULL),(4,'PASSWORD_RESET',0,1,NULL,NULL,NULL),(5,'USER_REGISTER',0,1,NULL,NULL,NULL),(6,'USER_VALIDATE_CONTEXT',0,1,NULL,NULL,NULL),(7,'USER_VALIDATE_SITE',0,1,NULL,NULL,NULL),(8,'REVIEWER_REGISTER',0,1,NULL,NULL,NULL),(9,'ISSUE_PUBLISH_NOTIFY',0,1,NULL,NULL,NULL),(10,'SUBMISSION_ACK',1,1,NULL,65536,1),(11,'SUBMISSION_ACK_NOT_USER',1,1,NULL,65536,1),(12,'EDITOR_ASSIGN',1,1,16,16,1),(13,'REVIEW_CANCEL',1,1,16,4096,3),(14,'REVIEW_REINSTATE',1,1,16,4096,3),(15,'REVIEW_REQUEST',1,1,16,4096,3),(16,'REVIEW_REQUEST_ONECLICK',1,1,16,4096,3),(17,'REVIEW_RESPONSE_OVERDUE_AUTO',0,1,NULL,4096,3),(18,'REVIEW_RESPONSE_OVERDUE_AUTO_ONECLICK',0,1,NULL,4096,3),(19,'REVIEW_REQUEST_ATTACHED',0,1,16,4096,3),(20,'REVIEW_CONFIRM',1,1,4096,16,3),(21,'REVIEW_DECLINE',1,1,4096,16,3),(22,'REVIEW_ACK',1,1,16,4096,3),(23,'REVIEW_REMIND',0,1,16,4096,3),(24,'REVIEW_REMIND_AUTO',0,1,NULL,4096,3),(25,'REVIEW_REMIND_ONECLICK',0,1,16,4096,3),(26,'REVIEW_REMIND_AUTO_ONECLICK',0,1,NULL,4096,3),(27,'EDITOR_DECISION_ACCEPT',0,1,16,65536,3),(28,'EDITOR_DECISION_SEND_TO_EXTERNAL',0,1,16,65536,3),(29,'EDITOR_DECISION_SEND_TO_PRODUCTION',0,1,16,65536,5),(30,'EDITOR_DECISION_REVISIONS',0,1,16,65536,3),(31,'EDITOR_DECISION_RESUBMIT',0,1,16,65536,3),(32,'EDITOR_DECISION_DECLINE',0,1,16,65536,3),(33,'EDITOR_DECISION_INITIAL_DECLINE',0,1,16,65536,1),(34,'EDITOR_RECOMMENDATION',0,1,16,16,3),(35,'COPYEDIT_REQUEST',1,1,16,4097,4),(36,'LAYOUT_REQUEST',1,1,16,4097,5),(37,'LAYOUT_COMPLETE',1,1,4097,16,5),(38,'INDEX_REQUEST',1,1,16,4097,5),(39,'INDEX_COMPLETE',1,1,4097,16,5),(40,'EMAIL_LINK',0,1,1048576,NULL,NULL),(41,'STATISTICS_REPORT_NOTIFICATION',1,1,16,17,NULL),(42,'ANNOUNCEMENT',0,1,16,1048576,NULL),(43,'PAYPAL_INVESTIGATE_PAYMENT',0,1,NULL,NULL,NULL),(44,'MANUAL_PAYMENT_NOTIFICATION',0,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `email_templates_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default_data`
--

DROP TABLE IF EXISTS `email_templates_default_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_default_data` (
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `locale` varchar(14) NOT NULL DEFAULT 'en_US',
  `subject` varchar(120) NOT NULL,
  `body` text,
  `description` text,
  UNIQUE KEY `email_templates_default_data_pkey` (`email_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default_data`
--

LOCK TABLES `email_templates_default_data` WRITE;
/*!40000 ALTER TABLE `email_templates_default_data` DISABLE KEYS */;
INSERT INTO `email_templates_default_data` VALUES ('ANNOUNCEMENT','en_US','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href=\"{$announcementUrl}\">full announcement</a>.','This email is sent when a new announcement is created.'),('ANNOUNCEMENT','fr_CA','','','##emails.announcement.description##'),('COPYEDIT_REQUEST','en_US','Copyediting Request','{$recipientName}:<br />\n<br />\nI would ask that you undertake the copyediting of &quot;{$submissionTitle}&quot; for {$pressName} by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and click on the File that appears in Step 1.<br />\n3. Consult Copyediting Instructions posted on webpage.<br />\n4. Open the downloaded file and copyedit, while adding Author Queries as needed.<br />\n5. Save copyedited file, and upload to Step 1 of Copyediting.<br />\n6. Send the COMPLETE email to the editor.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}','This email is sent by a Series Editor to a submission\'s Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.'),('COPYEDIT_REQUEST','fr_CA','Requête de révision','{$recipientName}:<br />\n<br />\nJ\'aimerais que vous entamiez le processus de révision de l\'article &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez suivre les étapes suivantes.<br />\n<br />\n1. Cliquez sure le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et cliquez sur le fichier qui apparait à l\'étape 1.<br />\n3. Lisez les instructions de révision publiées sur la page Web.<br />\n4. Ouvrez le fichier téléchargé et débutez le processus de révision, tout en ajoutant des questions pour les auteurs, au besoin.<br />\n5. Sauvegardez le fichier révisé et téléchargez-le à l\'étape 1 de Révision.<br />\n6. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}','Ce courriel est envoyé par le rédacteur en chef d\'une série au réviseur de la soumission afin qu\'il entame de processus de révision, lorsque l\'évaluation par les pairs est terminée. Il explique comment accéder à la soumission.'),('EDITOR_ASSIGN','en_US','Editorial Assignment','{$recipientName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$pressName} has been assigned to you to see through the editorial process in your role as an Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you,','This email notifies a Series Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the press site.'),('EDITOR_ASSIGN','fr_CA','Travail éditorial','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; à la presse {$pressName} vous a été assignée. En tant que rédacteur en chef, vous devrez superviser le processus éditorial de cette soumission.<br />\n<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci,','Ce courriel indique au rédacteur en chef d\'une série qu\'on lui a assigné la tâche de superviser une soumission tout au long de son processus éditorial. Il contient des renseignements sur la soumission et indique comment accéder au site de la presse.'),('EDITOR_DECISION_ACCEPT','en_US','Editor Decision','{$authors}:<br />\n<br />\nWe have reached a decision regarding your submission to {$pressName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}','This email from the Editor or Series Editor to an Author notifies them of a final decision regarding their submission.'),('EDITOR_DECISION_ACCEPT','fr_CA','Décision du rédacteur en chef','{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$pressName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}','Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l\'on a pris une décision finale concernant sa soumission.'),('EDITOR_DECISION_DECLINE','en_US','Editor Decision','{$authors}:<br />\n<br />\nWe have reached a decision regarding your submission to {$pressName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}','This email from the Editor or Series Editor to an Author notifies them of a final decision regarding their submission.'),('EDITOR_DECISION_DECLINE','fr_CA','Décision du rédacteur en chef','{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$pressName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}','Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l\'on a pris une décision finale concernant sa soumission.'),('EDITOR_DECISION_INITIAL_DECLINE','en_US','Editor Decision','\n			{$authors}:<br />\n<br />\nWe have reached a decision regarding your submission to {$pressName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission<br />\n<br />\nManuscript URL: {$submissionUrl}\n		','This email is send to the author if the editor declines his submission initially, before the review stage'),('EDITOR_DECISION_INITIAL_DECLINE','fr_CA','','','##emails.editorDecisionInitialDecline.description##'),('EDITOR_DECISION_RESUBMIT','en_US','Editor Decision','{$authors}:<br />\n<br />\nWe have reached a decision regarding your submission to {$pressName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}','This email from the Editor or Series Editor to an Author notifies them of a final decision regarding their submission.'),('EDITOR_DECISION_RESUBMIT','fr_CA','Décision du rédacteur en chef','{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$pressName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}','Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l\'on a pris une décision finale concernant sa soumission.'),('EDITOR_DECISION_REVISIONS','en_US','Editor Decision','{$authors}:<br />\n<br />\nWe have reached a decision regarding your submission to {$pressName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}','This email from the Editor or Series Editor to an Author notifies them of a final decision regarding their submission.'),('EDITOR_DECISION_REVISIONS','fr_CA','Décision du rédacteur en chef','{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$pressName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}','Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l\'on a pris une décision finale concernant sa soumission.'),('EDITOR_DECISION_SEND_TO_EXTERNAL','en_US','Editor Decision','{$authors}:<br />\n<br />\nWe have reached a decision regarding your submission to {$pressName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Send to Review<br />\n<br />\nManuscript URL: {$submissionUrl}','This email from the Editor or Series Editor to an Author notifies them that their submission is being sent to an external review.'),('EDITOR_DECISION_SEND_TO_EXTERNAL','fr_CA','Décision du rédacteur en chef','{$authors}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$pressName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}','Ce courriel est envoyé par un rédacteur en chef à un auteur pour l\'informer que sa soumission sera envoyée à un évaluateur externe.'),('EDITOR_DECISION_SEND_TO_PRODUCTION','en_US','Editor Decision','{$authors}:<br />\n<br />\nThe editing of your manuscript, &quot;{$submissionTitle},&quot; is complete.  We are now sending it to production.<br />\n<br />\nManuscript URL: {$submissionUrl}','This email from the Editor or Series Editor to an Author notifies them that their submission is being sent to production.'),('EDITOR_DECISION_SEND_TO_PRODUCTION','fr_CA','Décision du rédacteur en chef','{$authors}:<br />\n<br />\nLa révision de votre manuscrit &quot;{$submissionTitle}&quot; est terminée. Nous l\'envoyons maintenant en production.<br />\n<br />\nURL du manuscrit: {$submissionUrl}','Ce courriel est envoyé par un rédacteur en chef à un auteur pour l\'informer que sa soumission passera à l\'étape de production.'),('EDITOR_RECOMMENDATION','en_US','Editor Recommendation','{$editors}:<br />\n<br />\nThe recommendation regarding the submission to {$pressName}, &quot;{$submissionTitle}&quot; is: {$recommendation}','This email from the recommending Editor or Series Editor to the decision making Editors or Series Editors notifies them of a final recommendation regarding the submission.'),('EDITOR_RECOMMENDATION','fr_CA','','','##emails.editorRecommendation.description##'),('EMAIL_LINK','en_US','Manuscript of Possible Interest','Thought you might be interested in seeing &quot;{$submissionTitle}&quot; by {$authors} published in Vol {$volume}, No {$number} ({$year}) of {$pressName} at &quot;{$submissionUrl}&quot;.','This email template provides a registered reader with the opportunity to send information about a monograph to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Press Manager in the Reading Tools Administration page.'),('EMAIL_LINK','fr_CA','Manuscrit susceptible d\'intéresser','Nous crayons que l\'article intitulé &quot;{$submissionTitle}&quot; par {$authors} publié dans le Volume {$volume}, No {$number} ({$year}) de la presse {$pressName} au &quot;{$submissionUrl}&quot; pourrait vous intéresser.','Ce modèle de courriel permet à un lecteur inscrit d\'envoyer des renseignements sur une monographie à une personne qui pourrait être intéressée. Il est disponible dans les Outils de lecture et peut être activé par le gestionnaire de la presse sur la page Administration des outils de lecture.'),('INDEX_COMPLETE','en_US','Index Galleys Complete','{$recipientName}:<br />\n<br />\nIndexes have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$pressName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signatureFullName}','This email from the Indexer to the Series Editor notifies them that the index creation process has been completed.'),('INDEX_COMPLETE','fr_CA','Indexage des épreuves en placard complété','{$recipientName}:<br />\n<br />\nLes index du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$pressName} sont prêts et peuvent être révisés.<br />\n<br />\nSi vous avez questions, n\'hésitez pas à me contacter.<br />\n<br />\n{$signatureFullName}','Ce courriel est envoyé par l\'indexateur au rédacteur en chef d\'une série pour lui indiquer que l\'indexage est terminé.'),('INDEX_REQUEST','en_US','Request Index','{$recipientName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$pressName} now needs indexes created by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and use the Page Proofs file to create the galleys according to press standards.<br />\n3. Send the COMPLETE email to the editor.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.<br />\n<br />\n{$signature}','This email from the Series Editor to the Indexer notifies them that they have been assigned the task of creating indexes for a submission. It provides information about the submission and how to access it.'),('INDEX_REQUEST','fr_CA','Requête d\'indexage','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; par la presse {$pressName} doit désormais être indexée. Veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez les fichiers d\'épreuves de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir contribué à cette presse.<br />\n<br />\n{$signature}','Ce courriel est envoyé à l\'indexateur par le rédacteur en chef d\'une série pour lui indiquer qu\'il devra créer les index de la soumission en question. Il contient des renseignements sur la soumission et explique comment y accéder.'),('ISSUE_PUBLISH_NOTIFY','en_US','New Book Published','Readers:<br />\n<br />\n{$pressName} has just published its latest book at {$pressUrl}. We invite you to review the Table of Contents here and then visit our web site to review monographs and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$signature}','This email is sent to registered readers via the \"Notify Users\" link in the Editor\'s User Home. It notifies readers of a new book and invites them to visit the press at a supplied URL.'),('ISSUE_PUBLISH_NOTIFY','fr_CA','Nouveau livre publié','Chers lecteurs,<br />\n<br />\n{$pressName} a récemment publié son dernier livre au {$pressUrl}. Nous vous invitons à consulter la table des matières ici et à consulter notre site Web afin de lire les monographies et les articles qui vous intéressent.<br />\n<br />\nMerci de l\'intérêt que vous portez à nos publications.<br />\n<br />\n{$signature}','Ce courriel est envoyé aux lecteurs par le lien d\'avis aux utilisateurs qui se trouve sur la page du rédacteur en chef. Il indique aux lecteurs que l\'on a récemment publié un nouveau livre et les invite à cliquer sur le lien URL de la presse.'),('LAYOUT_COMPLETE','en_US','Layout Galleys Complete','{$recipientName}:<br />\n<br />\nGalleys have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$pressName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$senderName}','This email from the Layout Editor to the Series Editor notifies them that the layout process has been completed.'),('LAYOUT_COMPLETE','fr_CA','Épreuves en placard complétées','{$recipientName}:<br />\n<br />\nLes épreuves en placard du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$pressName} ont été préparées et peuvent être révisées.<br />\n<br />\nSi vous avez questions, n\'hésitez pas à me contacter.<br />\n<br />\n{$senderName}','Ce courriel est envoyé par le rédacteur metteur en page au rédacteur d\'une série pour l\'informer que la mise en page du manuscrit est terminée.'),('LAYOUT_REQUEST','en_US','Request Galleys','{$recipientName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$pressName} now needs galleys laid out by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and use the Layout Version file to create the galleys according to press standards.<br />\n3. Send the COMPLETE email to the editor.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.','This email from the Series Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.'),('LAYOUT_REQUEST','fr_CA','Requête des épreuves en placard','{$recipientName}:<br />\n<br />\nIl faut maintenant préparer les épreuves en placard de la soumission &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Pour ce faire, veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez le fichier Version de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir contribué à cette presse.','Ce courriel est envoyé au rédacteur metteur en page par le rédacteur en chef de la série pour lui indiquer qu\'on lui a demandé de faire la mise en page de la soumission. Il contient des renseignements sur la soumission et explique comment y accéder.'),('MANUAL_PAYMENT_NOTIFICATION','en_US','Manual Payment Notification','A manual payment needs to be processed for the press {$pressName} and the user {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$itemName}&quot;.<br />\nThe cost is {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nThis email was generated by the Open Monograph Press Manual Payment plugin.','This email template is used to notify a press manager contact that a manual payment was requested.'),('NOTIFICATION','en_US','New notification from {$siteTitle}','You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$notificationUrl}<br />\n<br />\nThis is an automatically generated email; please do not reply to this message.<br />\n{$signature}<hr />{$unsubscribeLink}','The email is sent to registered users that have selected to have this type of notification emailed to them.'),('NOTIFICATION','fr_CA','Nouvelle notification de {$siteTitle}','Vous avez reçu une nouvelle notification de {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLien: {$notificationUrl}<br />\n<br />\n{$signature}','Ce courriel est envoyé aux utilisateurs qui ont demandé qu\'on leur envoie ce type de notification par courriel.'),('NOTIFICATION_CENTER_DEFAULT','en_US','A message regarding {$pressName}','Please enter your message.','The default (blank) message used in the Notification Center Message Listbuilder.'),('NOTIFICATION_CENTER_DEFAULT','fr_CA','Un message à propos de la presse {$pressName}','Veuillez saisir votre message.','Le message (vierge) par défaut utilisé par le centre d\'alerte.'),('PASSWORD_RESET','en_US','Password Reset','Your password has been successfully reset for use with the {$siteTitle} web site.<br />\n<br />\nYour username: {$recipientUsername}<br />\nYour new password: {$password}<br />\n<br />\n{$signature}','This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.'),('PASSWORD_RESET','fr_CA','Réinitialisation du mot de passe','Votre mot de passe vous permettant d\'avoir accès au site Web {$siteTitle} a été réinitialisé. Veuillez noter votre nom d\'utilisateur et mot de passe dans vos dossiers, car vous en aurez besoin pour vos travaux auprès de la presse.<br />\n<br />\nVotre nom d\'utilisateur: {$recipientUsername}<br />\nVotre nouveau mot de passe: {$password}<br />\n<br />\n{$signature}','Ce courriel est envoyé à un utilisateur lorsque son mot de passe a été réinitialisé après avoir suivi les instructions du courriel \"PASSWORD_RESET_CONFIRM\".'),('PASSWORD_RESET_CONFIRM','en_US','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$passwordResetUrl}<br />\n<br />\n{$signature}','This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),('PASSWORD_RESET_CONFIRM','fr_CA','Confirmation de réinitialisation du mot de passe','Nous avons reçu une requête de réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette requête, veuillez ignorer ce courriel et votre mot de passe demeurera le même. Si vous souhaitez modifier votre mot de passe, cliquez sur l\'adresse URL ci-dessous.<br />\n<br />\nModifier mon mot de passe: {$passwordResetUrl}<br />\n<br />\n{$signature}','Ce courriel est envoyé à un utilisateur lorsqu\'il a indiqué avoir oublié son mot de passe ou être incapable d\'ouvrir une session. On lui fournit une adresse URL sur laquelle il peut cliquer pour modifier son mot de passe.'),('PAYPAL_INVESTIGATE_PAYMENT','en_US','Unusual PayPal Activity','Open Monograph Press has encountered unusual activity relating to PayPal payment support for the press {$pressName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by the Open Monograph Press PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n','This email template is used to notify the press\' primary contact that suspicious activity or activity requiring manual intervention was encountered by the PayPal plugin.'),('REVIEWER_REGISTER','en_US','Registration as Reviewer with {$pressName}','In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$pressName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the press through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}','This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.'),('REVIEWER_REGISTER','fr_CA','Inscription à titre d\'évaluateur pour la presse {$pressName}','En raison de votre expertise, nous avons ajouté votre nom à notre base de données d\'évaluateurs pour la presse {$pressName}. Ceci ne vous oblige à rien, mais nous permet simplement de vous approcher si nous recevons une soumission que vous pourriez évaluer. Après avoir reçu une demande d\'évaluation, vous aurez la possibilité de lire le titre et le résumé de l\'article en question. Vous serez toujours libre d\'accepter ou de refuser l\'invitation. Vous pouvez demander que l\'on retire votre nom de notre liste d\'évaluateurs en tout temps.<br />\n<br />\nVoici votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin dans tous vos échanges avec la presse à travers son site Web. Vous pourriez, par exemple, mettre votre profil à jour, y compris vos champs d\'intérêt en ce qui concerne l\'évaluation des articles.<br />\n<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$signature}','Ce courriel est envoyé à un nouvel évaluateur pour lui souhaiter la bienvenue dans le système et lui fournir une confirmation écrite de son nom d\'utilisateur et de son mot de passe.'),('REVIEW_ACK','en_US','Manuscript Review Acknowledgement','{$recipientName}:<br />\n<br />\nThank you for completing the review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We appreciate your contribution to the quality of the work that we publish.','This email is sent by a Series Editor to confirm receipt of a completed review and thank the reviewer for their contributions.'),('REVIEW_ACK','fr_CA','Accusé de réception pour l\'évaluation d\'un manuscrit','{$recipientName}:<br />\n<br />\n<br />\nMerci d\'avoir terminé l\'évaluation de l\'article &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Grâce à vous, nous sommes en mesure de publier des articles de qualité.','Ce courriel est envoyé par le rédacteur en chef d\'une série pour confirmer qu\'il a reçu l\'évaluation finale de l\'article et pour le remercier de sa contribution.'),('REVIEW_CANCEL','en_US','Request for Review Cancelled','{$recipientName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this review process in the future.<br />\n<br />\nIf you have any questions, please contact me.','This email is sent by the Series Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.'),('REVIEW_CANCEL','fr_CA','Annulation de la requête d\'évaluation','{$recipientName}:<br />\n<br />\n<br />\nNous avons décidé d\'annuler notre requête d\'évaluation pour la soumission &quot;{$submissionTitle}&quot; de la presse {$pressName}. Nous vous prions de nous excuser pour tout inconvénient que cette décision pourrait occasionner et nous espérons que vous serez en mesure d\'évaluer une soumission dans un avenir prochain.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à me contacter.','Ce courriel est envoyé à un évaluateur qui a entamé le processus d\'évaluation d\'une soumission par le rédacteur en chef d\'une série afin d\'informer l\'évaluateur que la procédure d\'évaluation a été annulée.'),('REVIEW_CONFIRM','en_US','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$senderName}','This email is sent by a Reviewer to the Series Editor in response to a review request to notify the Series Editor that the review request has been accepted and will be completed by the specified date.'),('REVIEW_CONFIRM','fr_CA','En mesure d\'évaluer','Éditeurs:<br />\n<br />\nJe peux et je souhaite évaluer la soumission &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Merci de m\'avoir invité à évaluer cet article. Je prévois terminer mon évaluation d\'ici le {$reviewDueDate}.<br />\n<br />\n{$senderName}','Ce courriel est envoyé au rédacteur en chef d\'une série pour répondre à la requête d\'évaluation. Il a pour but de permettre à l\'évaluateur d\'indiquer au rédacteur en chef qu\'il a accepté d\'évaluer l\'article et qu\'il aura terminé son évaluation dans les délais prescrits.'),('REVIEW_DECLINE','en_US','Unable to Review','Editor(s):<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$senderName}','This email is sent by a Reviewer to the Series Editor in response to a review request to notify the Series Editor that the review request has been declined.'),('REVIEW_DECLINE','fr_CA','Ne peux pas évaluer','Éditeurs:<br />\n<br />\nMalheureusement, je ne pourrai pas évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Merci de m\'avoir invité à évaluer cet article et n\'hésitez pas à me contacter dans un avenir prochain.<br />\n<br />\n{$senderName}','Ce courriel est envoyé par l\'évaluateur au rédacteur en chef d\'une série série pour indiquer qu\'il ne sera pas en mesure d\'évaluer l\'article en question.'),('REVIEW_REINSTATE','en_US','Request for Review Reinstated','{$recipientName}:<br />\n<br />\nWe would like to reinstate our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We hope that you will be able to assist with this press\'s review process.<br />\n<br />\nIf you have any questions, please contact me.','This email is sent by the Series Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.'),('REVIEW_REINSTATE','fr_CA','','','##emails.reviewReinstate.description##'),('REVIEW_REMIND','en_US','Submission Review Reminder','{$recipientName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$signature}','This email is sent by a Series Editor to remind a reviewer that their review is due.'),('REVIEW_REMIND','fr_CA','Rappel d\'évaluation','{$recipientName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoyés par courriel. {$passwordResetUrl}<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Nous vous prions d\'agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$signature}','Ce courriel est envoyé par le rédacteur en chef d\'une série pour rappeler à l\'évaluateur qu\'il doit envoyer sa soumission dès que possible.'),('REVIEW_REMIND_AUTO','en_US','Automated Submission Review Reminder','{$recipientName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$signature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REMIND_AUTO','fr_CA','Rappel automatique d\'évaluation d\'une soumission','{$recipientName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Ce courriel a été généré et envoyé automatiquement parce que vous avez dépassé la date d\'échéance. Toutefois, nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoyés par courriel. {$passwordResetUrl}<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Veuillez agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$signature}','Ce courriel est envoyé automatiquement lorsqu\'une évaluation est en retard (voir les options d\'évaluation à l\'étape 2 de la section Configuration de la presse) et que l\'accès de l\'évaluateur en un seul clic est désactivé. Les tâches prévues doivent être activées et configurée (voir le fichier de configuration du site).'),('REVIEW_REMIND_AUTO_ONECLICK','en_US','Automated Submission Review Reminder','{$recipientName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$signature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REMIND_AUTO_ONECLICK','fr_CA','Rappel automatique d\'évaluation d\'une soumission','{$recipientName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Ce courriel a été généré et envoyé automatiquement parce que vous avez dépassé la date d\'échéance. Toutefois, nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Veuillez agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$signature}','Ce courriel est envoyé automatiquement lorsqu\'une évaluation est en retard (voir les options d\'évaluation à l\'étape 2 de la section Configuration de la presse) et que l\'accès de l\'évaluateur en un seul clic est activé. Les tâches prévues doivent être activées et configurée (voir le fichier de configuration du site).'),('REVIEW_REMIND_ONECLICK','en_US','Submission Review Reminder','{$recipientName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$signature}','This email is sent by a Series Editor to remind a reviewer that their review is due.'),('REVIEW_REMIND_ONECLICK','fr_CA','Rappel d\'évaluation','{$recipientName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Nous vous prions d\'agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$signature}','Ce courriel est envoyé par le rédacteur en chef d\'une série pour rappeler à l\'évaluateur qu\'il doit envoyer sa soumission dès que possible.'),('REVIEW_REQUEST','en_US','Manuscript Review Request','Dear {$recipientName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$signature}<br />\n','This email from the Series Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED.)'),('REVIEW_REQUEST','fr_CA','Requête d\'évaluation d\'un manuscrit','Bonjour {$recipientName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nVeuillez ouvrir une session sur le site Web de la presse d\'ici le {$responseDueDate} pour indiquer si vous serez en mesure d\'évaluer l\'article ou non. Ceci vous permettra également d\'accéder à la soumission, et de saisir votre évaluation et vos recommandations.<br />\n<br />\n<br />\nL\'évaluation doit être terminée d\'ici le {$reviewDueDate}.<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci de votre intérêt à évaluer des articles pour notre presse.<br />\n<br />\n{$signature}<br />\n','Ce courriel est envoyé à un évaluateur par le rédacteur en chef d\'une série afin de lui demander s\'il accepte ou refuse d\'évaluer une soumission. Il contient des informations sur la soumission comme le titre et le résumé de l\'article, il indique la date d\'échéance pour l\'évaluation et explique comment on peut accéder à la soumission. Ce message est utilisé lorsqu\'on choisit l\'option Processus d\'évaluation standard à l\'étape 2 de la section Configuration de la presse. (Sinon, voir REVIEW_REQUEST_ATTACHED.)'),('REVIEW_REQUEST_ATTACHED','en_US','Manuscript Review Request','{$recipientName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; and I am asking that you consider undertaking this important task for us. The Review Guidelines for this press are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$signature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n','This email is sent by the Series Editor to a Reviewer to request that they accept or decline the task of reviewing a submission. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST.)'),('REVIEW_REQUEST_ATTACHED','fr_CA','Requête d\'évaluation d\'un manuscrit','{$recipientName}:<br />\n<br />\nJe crois que vous seriez un excellent évaluateur pour le manuscrit &quot;{$submissionTitle}&quot; et nous vous serions reconnaissants si vous acceptiez cette tâche importante. Vous trouverez ci-dessous les lignes directrices de cette presse concernant l\'évaluation. Vous trouverez également la soumission en pièce jointe. Votre évaluation de la soumission et vos recommandations devraient nous parvenir par courriel d\'ici le {$reviewDueDate}.<br />\n<br />\nVeuillez répondre à ce courriel d\'ici le {$responseDueDate} pour confirmer si vous acceptez d\'évaluer cet article.<br />\n<br />\n<br />\nNous vous remercions à l\'avance et espérons que vous accepterez cette requête.<br />\n<br />\n{$signature}<br />\n<br />\n<br />\nLignes directrices concernant l\'évaluation<br />\n<br />\n{$reviewGuidelines}<br />\n','Ce courriel est envoyé par le rédacteur en chef d\'une série à un évaluateur afin de lui demander s\'il accepte ou refuse d\'évaluer une soumission. Il contient la soumission en pièce jointe. Ce message est utilisé lorsque vous sélectionnez l\'option Processus d\'évaluation par courriel avec pièce jointe à l\'étape 2 de la Configuration de la presse. (Sinon, voir REVIEW_REQUEST.)'),('REVIEW_REQUEST_ONECLICK','en_US','Manuscript Review Request','{$recipientName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$pressName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the press web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$signature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$abstractTermIfEnabled}<br />\n{$submissionAbstract}','This email from the Series Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),('REVIEW_REQUEST_ONECLICK','fr_CA','Requête d\'évaluation d\'un manuscrit','{$recipientName}:<br />\n<br />\nJe crois que vous seriez un excellent évaluateur pour le manuscrit &quot;{$submissionTitle}&quot; soumis à la presse {$pressName}. Vous trouverez ci-dessous le résumé de l\'article. J\'espère que vous accepterez cette tâche importante du processus de publication.<br />\n<br />\nVeuillez ouvrir une session sur le site Web d\'ici le {$responseDueDate} pour indiquer si vous acceptez ou refusez d\'évaluer l\'article. Ceci vous permettra également d\'accéder à la soumission, et de saisir votre évaluation et vos recommandations.<br />\n<br />\nL\'évaluation doit être terminée d\'ici le {$reviewDueDate}.<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nMerci de votre intérêt à évaluer des articles pour notre presse.<br />\n<br />\n<br />\n{$signature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$abstractTermIfEnabled}<br />\n{$submissionAbstract}','Ce courriel est envoyé à un évaluateur par le rédacteur en chef d\'une série afin de lui demander s\'il accepte ou refuse d\'évaluer une soumission. Il fournit des informations sur la soumission comme le titre et le résumé de l\'article, il indique la date d\'échéance pour l\'évaluation et explique comment on peut accéder à la soumission. Ce message est utilisé lorsqu\'on choisit l\'option Processus d\'évaluation standard à l\'étape 2 de la section Configuration de la presse, et que l\'on a activé l\'option permettant à l\'évaluateur d\'avoir accès à la soumission en un seul clic.'),('REVIEW_RESPONSE_OVERDUE_AUTO','en_US','Manuscript Review Request','Dear {$recipientName},<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$signature}<br />\n','This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_RESPONSE_OVERDUE_AUTO','fr_CA','','','##emails.reviewResponseOverdueAuto.description##'),('REVIEW_RESPONSE_OVERDUE_AUTO_ONECLICK','en_US','Manuscript Review Request','{$recipientName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$signature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$abstractTermIfEnabled}<br />\n{$submissionAbstract}','This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_RESPONSE_OVERDUE_AUTO_ONECLICK','fr_CA','','','##emails.reviewResponseOverdueAutoOneclick.description##'),('STATISTICS_REPORT_NOTIFICATION','en_US','Editorial activity for {$month}, {$year}','\n{$name}, <br />\n<br />\nYour press health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the press to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published article stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$signature}','This email is automatically sent monthly to editors and journal managers to provide them a system health overview.'),('STATISTICS_REPORT_NOTIFICATION','fr_CA','','','##emails.statisticsReportNotification.description##'),('SUBMISSION_ACK','en_US','Submission Acknowledgement','{$recipientName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$pressName}. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n{$signature}','This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the press. It provides information about tracking the submission through the process and thanks the author for the submission.'),('SUBMISSION_ACK','fr_CA','Accusé de réception d\'une soumission','{$recipientName}:<br />\n<br />\nMerci d\'avoir envoyé votre manuscrit &quot;{$submissionTitle}&quot; à la presse {$pressName}. Le système de gestion virtuel de la presse que nous utilisons vous permet de suivre les progrès de votre article tout au long du processus de publication. Il suffit d\'ouvrir une session sur le site Web:<br />\n<br />\nURL du manuscrit: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir envoyé votre article à cette presse.<br />\n<br />\n{$signature}','Lorsqu\'il est activé, ce courriel est envoyé automatiquement à l\'auteur lorsqu\'il soumet son manuscrit à la presse. Il fournit des renseignements sur le suivi de la soumission tout au long du processus de publication et remercie l\'auteur d\'avoir envoyé une soumission.'),('SUBMISSION_ACK_NOT_USER','en_US','Submission Acknowledgement','Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$pressName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n{$signature}','This email, when enabled, is automatically sent to the other authors who are not users within OMP specified during the submission process.'),('SUBMISSION_ACK_NOT_USER','fr_CA','Accusé de réception d\'une soumission','Bonjour,<br />\n<br />\n{$submitterName} a envoyé un manuscrit intitulé &quot;{$submissionTitle}&quot; à la presse {$pressName}. <br />\n<br />\nSi vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir envoyé votre article à cette presse.<br />\n<br />\n{$signature}','Lorsqu\'il est activé, ce courriel est envoyé automatiquement aux autres auteurs qui ne font pas partie des utilisateurs d\'OMP identifiés pendant le processus de soumission.'),('USER_REGISTER','en_US','Press Registration','{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$pressName}. We have included your username and password in this email, which are needed for all work with this press through its website. At any point, you can ask to be removed from the list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('USER_REGISTER','fr_CA','Inscription à la presse','{$recipientName}<br />\n<br />\nVous êtes désormais inscrit à la presse {$pressName}. Ce courriel contient votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin pour tous vos travaux au sein de la presse. Vous pouvez demander que l\'on retire votre nom de la liste des utilisateurs en tout temps. Il suffit de me contacter.<br />\n<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$signature}','Ce courriel est envoyé à un nouvel utilisateur afin de lui souhaiter la bienvenue dans le système et lui fournir son nom d\'utilisateur et son mot de passe pour ses dossiers.'),('USER_VALIDATE_CONTEXT','en_US','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$pressName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$signature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('USER_VALIDATE_CONTEXT','fr_CA','','','##emails.userValidateContext.description##'),('USER_VALIDATE_SITE','en_US','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$signature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('USER_VALIDATE_SITE','fr_CA','','','##emails.userValidateSite.description##');
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
  `setting_value` text,
  UNIQUE KEY `email_settings_pkey` (`email_id`,`locale`,`setting_name`),
  KEY `email_settings_email_id` (`email_id`)
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
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=380 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,19,'2022-02-22 19:53:15',268435458,'submission.event.general.metadataUpdated',0),(2,515,1,19,'2022-02-22 19:53:18',1342177281,'submission.event.fileUploaded',0),(3,1048585,1,19,'2022-02-22 19:53:18',1342177288,'submission.event.fileRevised',0),(4,515,1,19,'2022-02-22 19:53:18',1342177296,'submission.event.fileEdited',0),(5,1048585,1,19,'2022-02-22 19:53:18',1342177296,'submission.event.fileEdited',0),(6,1048585,1,19,'2022-02-22 19:53:32',268435458,'submission.event.general.metadataUpdated',0),(7,1048585,1,19,'2022-02-22 19:53:33',268435457,'submission.event.submissionSubmitted',0),(8,1048585,1,3,'2022-02-22 19:53:41',805306371,'log.editor.decision',0),(9,1048585,1,3,'2022-02-22 19:53:49',1073741825,'log.review.reviewerAssigned',0),(10,1048585,1,3,'2022-02-22 19:53:51',805306371,'log.editor.decision',0),(11,1048585,1,3,'2022-02-22 19:53:58',268435459,'submission.event.participantAdded',0),(12,1048585,2,20,'2022-02-22 19:54:08',268435458,'submission.event.general.metadataUpdated',0),(13,515,2,20,'2022-02-22 19:54:10',1342177281,'submission.event.fileUploaded',0),(14,1048585,2,20,'2022-02-22 19:54:10',1342177288,'submission.event.fileRevised',0),(15,515,2,20,'2022-02-22 19:54:11',1342177296,'submission.event.fileEdited',0),(16,1048585,2,20,'2022-02-22 19:54:11',1342177296,'submission.event.fileEdited',0),(17,515,3,20,'2022-02-22 19:54:11',1342177281,'submission.event.fileUploaded',0),(18,1048585,2,20,'2022-02-22 19:54:11',1342177288,'submission.event.fileRevised',0),(19,515,3,20,'2022-02-22 19:54:11',1342177296,'submission.event.fileEdited',0),(20,1048585,2,20,'2022-02-22 19:54:11',1342177296,'submission.event.fileEdited',0),(21,515,4,20,'2022-02-22 19:54:11',1342177281,'submission.event.fileUploaded',0),(22,1048585,2,20,'2022-02-22 19:54:11',1342177288,'submission.event.fileRevised',0),(23,515,4,20,'2022-02-22 19:54:11',1342177296,'submission.event.fileEdited',0),(24,1048585,2,20,'2022-02-22 19:54:11',1342177296,'submission.event.fileEdited',0),(25,515,5,20,'2022-02-22 19:54:12',1342177281,'submission.event.fileUploaded',0),(26,1048585,2,20,'2022-02-22 19:54:12',1342177288,'submission.event.fileRevised',0),(27,515,5,20,'2022-02-22 19:54:12',1342177296,'submission.event.fileEdited',0),(28,1048585,2,20,'2022-02-22 19:54:12',1342177296,'submission.event.fileEdited',0),(29,1048585,2,20,'2022-02-22 19:55:43',268435458,'submission.event.general.metadataUpdated',0),(30,1048585,2,20,'2022-02-22 19:55:45',268435457,'submission.event.submissionSubmitted',0),(31,1048585,2,3,'2022-02-22 19:55:57',805306371,'log.editor.decision',0),(32,1048585,2,3,'2022-02-22 19:56:08',1073741825,'log.review.reviewerAssigned',0),(33,1048585,2,3,'2022-02-22 19:56:15',1073741825,'log.review.reviewerAssigned',0),(34,1048585,3,21,'2022-02-22 19:56:25',268435458,'submission.event.general.metadataUpdated',0),(35,515,6,21,'2022-02-22 19:56:28',1342177281,'submission.event.fileUploaded',0),(36,1048585,3,21,'2022-02-22 19:56:28',1342177288,'submission.event.fileRevised',0),(37,515,6,21,'2022-02-22 19:56:28',1342177296,'submission.event.fileEdited',0),(38,1048585,3,21,'2022-02-22 19:56:28',1342177296,'submission.event.fileEdited',0),(39,1048585,3,21,'2022-02-22 19:56:56',268435458,'submission.event.general.metadataUpdated',0),(40,1048585,3,21,'2022-02-22 19:56:57',268435457,'submission.event.submissionSubmitted',0),(41,1048585,4,22,'2022-02-22 19:57:06',268435458,'submission.event.general.metadataUpdated',0),(42,515,7,22,'2022-02-22 19:57:08',1342177281,'submission.event.fileUploaded',0),(43,1048585,4,22,'2022-02-22 19:57:08',1342177288,'submission.event.fileRevised',0),(44,515,7,22,'2022-02-22 19:57:09',1342177296,'submission.event.fileEdited',0),(45,1048585,4,22,'2022-02-22 19:57:09',1342177296,'submission.event.fileEdited',0),(46,515,8,22,'2022-02-22 19:57:09',1342177281,'submission.event.fileUploaded',0),(47,1048585,4,22,'2022-02-22 19:57:09',1342177288,'submission.event.fileRevised',0),(48,515,8,22,'2022-02-22 19:57:09',1342177296,'submission.event.fileEdited',0),(49,1048585,4,22,'2022-02-22 19:57:09',1342177296,'submission.event.fileEdited',0),(50,515,9,22,'2022-02-22 19:57:09',1342177281,'submission.event.fileUploaded',0),(51,1048585,4,22,'2022-02-22 19:57:09',1342177288,'submission.event.fileRevised',0),(52,515,9,22,'2022-02-22 19:57:09',1342177296,'submission.event.fileEdited',0),(53,1048585,4,22,'2022-02-22 19:57:09',1342177296,'submission.event.fileEdited',0),(54,515,10,22,'2022-02-22 19:57:10',1342177281,'submission.event.fileUploaded',0),(55,1048585,4,22,'2022-02-22 19:57:10',1342177288,'submission.event.fileRevised',0),(56,515,10,22,'2022-02-22 19:57:10',1342177296,'submission.event.fileEdited',0),(57,1048585,4,22,'2022-02-22 19:57:10',1342177296,'submission.event.fileEdited',0),(58,1048585,4,22,'2022-02-22 19:58:12',268435458,'submission.event.general.metadataUpdated',0),(59,1048585,4,22,'2022-02-22 19:58:14',268435457,'submission.event.submissionSubmitted',0),(60,1048585,4,3,'2022-02-22 19:58:24',805306371,'log.editor.decision',0),(61,1048585,4,3,'2022-02-22 19:58:34',1073741825,'log.review.reviewerAssigned',0),(62,1048585,4,3,'2022-02-22 19:58:37',805306371,'log.editor.decision',0),(63,1048585,4,3,'2022-02-22 19:58:47',1073741825,'log.review.reviewerAssigned',0),(64,1048585,4,3,'2022-02-22 19:58:51',805306371,'log.editor.decision',0),(65,1048585,4,3,'2022-02-22 19:59:01',268435459,'submission.event.participantAdded',0),(66,1048585,4,3,'2022-02-22 19:59:04',805306371,'log.editor.decision',0),(67,1048585,4,3,'2022-02-22 19:59:15',268435459,'submission.event.participantAdded',0),(68,1048585,4,3,'2022-02-22 19:59:38',268435474,'submission.event.publicationFormatCreated',0),(69,1048585,5,23,'2022-02-22 19:59:49',268435458,'submission.event.general.metadataUpdated',0),(70,515,11,23,'2022-02-22 19:59:51',1342177281,'submission.event.fileUploaded',0),(71,1048585,5,23,'2022-02-22 19:59:51',1342177288,'submission.event.fileRevised',0),(72,515,11,23,'2022-02-22 19:59:51',1342177296,'submission.event.fileEdited',0),(73,1048585,5,23,'2022-02-22 19:59:51',1342177296,'submission.event.fileEdited',0),(74,1048585,5,23,'2022-02-22 20:00:23',268435458,'submission.event.general.metadataUpdated',0),(75,1048585,5,23,'2022-02-22 20:00:25',268435457,'submission.event.submissionSubmitted',0),(76,1048585,5,3,'2022-02-22 20:00:34',805306371,'log.editor.decision',0),(77,1048585,5,3,'2022-02-22 20:00:42',1073741825,'log.review.reviewerAssigned',0),(78,1048585,5,3,'2022-02-22 20:00:45',805306371,'log.editor.decision',0),(79,1048585,5,3,'2022-02-22 20:00:53',1073741825,'log.review.reviewerAssigned',0),(80,1048585,5,3,'2022-02-22 20:00:56',805306371,'log.editor.decision',0),(81,1048585,5,3,'2022-02-22 20:01:04',268435459,'submission.event.participantAdded',0),(82,1048585,5,3,'2022-02-22 20:01:07',805306371,'log.editor.decision',0),(83,1048585,5,3,'2022-02-22 20:01:17',268435459,'submission.event.participantAdded',0),(84,1048585,5,3,'2022-02-22 20:01:23',268435459,'submission.event.participantAdded',0),(85,1048585,5,3,'2022-02-22 20:01:29',268435474,'submission.event.publicationFormatCreated',0),(86,515,12,3,'2022-02-22 20:01:32',1342177281,'submission.event.fileUploaded',0),(87,1048585,5,3,'2022-02-22 20:01:32',1342177288,'submission.event.fileRevised',0),(88,1048585,5,3,'2022-02-22 20:01:34',268435464,'submission.event.publicationFormatPublished',0),(89,1048585,5,3,'2022-02-22 20:01:36',268435476,'submission.event.publicationFormatMadeAvailable',0),(90,515,12,3,'2022-02-22 20:01:37',1342177296,'submission.event.fileEdited',0),(91,1048585,5,3,'2022-02-22 20:01:37',1342177296,'submission.event.fileEdited',0),(92,515,12,3,'2022-02-22 20:01:37',1342177287,'submission.event.signoffSignoff',0),(93,515,12,3,'2022-02-22 20:01:40',1342177296,'submission.event.fileEdited',0),(94,1048585,5,3,'2022-02-22 20:01:40',1342177296,'submission.event.fileEdited',0),(95,1048585,5,3,'2022-02-22 20:01:42',268435462,'publication.event.published',0),(96,1048585,6,24,'2022-02-22 20:01:52',268435458,'submission.event.general.metadataUpdated',0),(97,515,13,24,'2022-02-22 20:01:54',1342177281,'submission.event.fileUploaded',0),(98,1048585,6,24,'2022-02-22 20:01:54',1342177288,'submission.event.fileRevised',0),(99,515,13,24,'2022-02-22 20:01:54',1342177296,'submission.event.fileEdited',0),(100,1048585,6,24,'2022-02-22 20:01:54',1342177296,'submission.event.fileEdited',0),(101,515,14,24,'2022-02-22 20:01:55',1342177281,'submission.event.fileUploaded',0),(102,1048585,6,24,'2022-02-22 20:01:55',1342177288,'submission.event.fileRevised',0),(103,515,14,24,'2022-02-22 20:01:55',1342177296,'submission.event.fileEdited',0),(104,1048585,6,24,'2022-02-22 20:01:55',1342177296,'submission.event.fileEdited',0),(105,515,15,24,'2022-02-22 20:01:55',1342177281,'submission.event.fileUploaded',0),(106,1048585,6,24,'2022-02-22 20:01:55',1342177288,'submission.event.fileRevised',0),(107,515,15,24,'2022-02-22 20:01:55',1342177296,'submission.event.fileEdited',0),(108,1048585,6,24,'2022-02-22 20:01:55',1342177296,'submission.event.fileEdited',0),(109,515,16,24,'2022-02-22 20:01:56',1342177281,'submission.event.fileUploaded',0),(110,1048585,6,24,'2022-02-22 20:01:56',1342177288,'submission.event.fileRevised',0),(111,515,16,24,'2022-02-22 20:01:56',1342177296,'submission.event.fileEdited',0),(112,1048585,6,24,'2022-02-22 20:01:56',1342177296,'submission.event.fileEdited',0),(113,1048585,6,24,'2022-02-22 20:02:47',268435458,'submission.event.general.metadataUpdated',0),(114,1048585,6,24,'2022-02-22 20:02:49',268435457,'submission.event.submissionSubmitted',0),(115,1048585,6,3,'2022-02-22 20:03:00',805306371,'log.editor.decision',0),(116,1048585,6,3,'2022-02-22 20:03:10',268435459,'submission.event.participantAdded',0),(117,1048585,6,6,'2022-02-22 20:03:22',805306372,'log.editor.recommendation',0),(118,1048585,7,25,'2022-02-22 20:03:43',268435458,'submission.event.general.metadataUpdated',0),(119,515,17,25,'2022-02-22 20:03:45',1342177281,'submission.event.fileUploaded',0),(120,1048585,7,25,'2022-02-22 20:03:45',1342177288,'submission.event.fileRevised',0),(121,515,17,25,'2022-02-22 20:03:45',1342177296,'submission.event.fileEdited',0),(122,1048585,7,25,'2022-02-22 20:03:45',1342177296,'submission.event.fileEdited',0),(123,515,18,25,'2022-02-22 20:03:45',1342177281,'submission.event.fileUploaded',0),(124,1048585,7,25,'2022-02-22 20:03:45',1342177288,'submission.event.fileRevised',0),(125,515,18,25,'2022-02-22 20:03:45',1342177296,'submission.event.fileEdited',0),(126,1048585,7,25,'2022-02-22 20:03:45',1342177296,'submission.event.fileEdited',0),(127,515,19,25,'2022-02-22 20:03:46',1342177281,'submission.event.fileUploaded',0),(128,1048585,7,25,'2022-02-22 20:03:46',1342177288,'submission.event.fileRevised',0),(129,515,19,25,'2022-02-22 20:03:46',1342177296,'submission.event.fileEdited',0),(130,1048585,7,25,'2022-02-22 20:03:46',1342177296,'submission.event.fileEdited',0),(131,515,20,25,'2022-02-22 20:03:46',1342177281,'submission.event.fileUploaded',0),(132,1048585,7,25,'2022-02-22 20:03:46',1342177288,'submission.event.fileRevised',0),(133,515,20,25,'2022-02-22 20:03:46',1342177296,'submission.event.fileEdited',0),(134,1048585,7,25,'2022-02-22 20:03:46',1342177296,'submission.event.fileEdited',0),(135,515,21,25,'2022-02-22 20:03:47',1342177281,'submission.event.fileUploaded',0),(136,1048585,7,25,'2022-02-22 20:03:47',1342177288,'submission.event.fileRevised',0),(137,515,21,25,'2022-02-22 20:03:47',1342177296,'submission.event.fileEdited',0),(138,1048585,7,25,'2022-02-22 20:03:47',1342177296,'submission.event.fileEdited',0),(139,1048585,7,25,'2022-02-22 20:05:21',268435458,'submission.event.general.metadataUpdated',0),(140,1048585,7,25,'2022-02-22 20:05:23',268435457,'submission.event.submissionSubmitted',0),(141,1048585,7,3,'2022-02-22 20:05:35',805306371,'log.editor.decision',0),(142,1048585,7,3,'2022-02-22 20:05:46',1073741825,'log.review.reviewerAssigned',0),(143,1048585,7,3,'2022-02-22 20:05:50',805306371,'log.editor.decision',0),(144,1048585,7,3,'2022-02-22 20:06:01',268435459,'submission.event.participantAdded',0),(145,1048585,8,3,'2022-02-22 20:06:10',268435458,'submission.event.general.metadataUpdated',0),(146,515,22,3,'2022-02-22 20:06:12',1342177281,'submission.event.fileUploaded',0),(147,1048585,8,3,'2022-02-22 20:06:12',1342177288,'submission.event.fileRevised',0),(148,515,22,3,'2022-02-22 20:06:13',1342177296,'submission.event.fileEdited',0),(149,1048585,8,3,'2022-02-22 20:06:13',1342177296,'submission.event.fileEdited',0),(150,1048585,8,3,'2022-02-22 20:06:14',268435458,'submission.event.general.metadataUpdated',0),(151,1048585,8,3,'2022-02-22 20:06:15',268435457,'submission.event.submissionSubmitted',0),(152,1048585,9,26,'2022-02-22 20:06:23',268435458,'submission.event.general.metadataUpdated',0),(153,515,23,26,'2022-02-22 20:06:25',1342177281,'submission.event.fileUploaded',0),(154,1048585,9,26,'2022-02-22 20:06:26',1342177288,'submission.event.fileRevised',0),(155,515,23,26,'2022-02-22 20:06:26',1342177296,'submission.event.fileEdited',0),(156,1048585,9,26,'2022-02-22 20:06:26',1342177296,'submission.event.fileEdited',0),(157,515,24,26,'2022-02-22 20:06:26',1342177281,'submission.event.fileUploaded',0),(158,1048585,9,26,'2022-02-22 20:06:26',1342177288,'submission.event.fileRevised',0),(159,515,24,26,'2022-02-22 20:06:26',1342177296,'submission.event.fileEdited',0),(160,1048585,9,26,'2022-02-22 20:06:26',1342177296,'submission.event.fileEdited',0),(161,515,25,26,'2022-02-22 20:06:26',1342177281,'submission.event.fileUploaded',0),(162,1048585,9,26,'2022-02-22 20:06:26',1342177288,'submission.event.fileRevised',0),(163,515,25,26,'2022-02-22 20:06:27',1342177296,'submission.event.fileEdited',0),(164,1048585,9,26,'2022-02-22 20:06:27',1342177296,'submission.event.fileEdited',0),(165,515,26,26,'2022-02-22 20:06:27',1342177281,'submission.event.fileUploaded',0),(166,1048585,9,26,'2022-02-22 20:06:27',1342177288,'submission.event.fileRevised',0),(167,515,26,26,'2022-02-22 20:06:27',1342177296,'submission.event.fileEdited',0),(168,1048585,9,26,'2022-02-22 20:06:27',1342177296,'submission.event.fileEdited',0),(169,515,27,26,'2022-02-22 20:06:27',1342177281,'submission.event.fileUploaded',0),(170,1048585,9,26,'2022-02-22 20:06:27',1342177288,'submission.event.fileRevised',0),(171,515,27,26,'2022-02-22 20:06:27',1342177296,'submission.event.fileEdited',0),(172,1048585,9,26,'2022-02-22 20:06:27',1342177296,'submission.event.fileEdited',0),(173,1048585,9,26,'2022-02-22 20:07:44',268435458,'submission.event.general.metadataUpdated',0),(174,1048585,9,26,'2022-02-22 20:07:46',268435457,'submission.event.submissionSubmitted',0),(175,1048585,9,3,'2022-02-22 20:07:58',805306371,'log.editor.decision',0),(176,1048585,10,27,'2022-02-22 20:08:12',268435458,'submission.event.general.metadataUpdated',0),(177,515,28,27,'2022-02-22 20:08:14',1342177281,'submission.event.fileUploaded',0),(178,1048585,10,27,'2022-02-22 20:08:14',1342177288,'submission.event.fileRevised',0),(179,515,28,27,'2022-02-22 20:08:14',1342177296,'submission.event.fileEdited',0),(180,1048585,10,27,'2022-02-22 20:08:14',1342177296,'submission.event.fileEdited',0),(181,1048585,10,27,'2022-02-22 20:09:05',268435458,'submission.event.general.metadataUpdated',0),(182,1048585,10,27,'2022-02-22 20:09:07',268435457,'submission.event.submissionSubmitted',0),(183,1048585,11,28,'2022-02-22 20:09:16',268435458,'submission.event.general.metadataUpdated',0),(184,515,29,28,'2022-02-22 20:09:18',1342177281,'submission.event.fileUploaded',0),(185,1048585,11,28,'2022-02-22 20:09:18',1342177288,'submission.event.fileRevised',0),(186,515,29,28,'2022-02-22 20:09:18',1342177296,'submission.event.fileEdited',0),(187,1048585,11,28,'2022-02-22 20:09:18',1342177296,'submission.event.fileEdited',0),(188,1048585,11,28,'2022-02-22 20:09:27',268435458,'submission.event.general.metadataUpdated',0),(189,1048585,11,28,'2022-02-22 20:09:28',268435457,'submission.event.submissionSubmitted',0),(190,1048585,11,3,'2022-02-22 20:09:37',805306371,'log.editor.decision',0),(191,1048585,11,3,'2022-02-22 20:09:45',1073741825,'log.review.reviewerAssigned',0),(192,1048585,11,3,'2022-02-22 20:09:47',805306371,'log.editor.decision',0),(193,1048585,11,3,'2022-02-22 20:09:55',1073741825,'log.review.reviewerAssigned',0),(194,1048585,11,3,'2022-02-22 20:10:01',1073741825,'log.review.reviewerAssigned',0),(195,1048585,11,10,'2022-02-22 20:10:08',1073741830,'log.review.reviewAccepted',0),(196,1048585,11,10,'2022-02-22 20:10:12',1073741848,'log.review.reviewReady',0),(197,1048585,11,12,'2022-02-22 20:10:20',1073741830,'log.review.reviewAccepted',0),(198,1048585,11,12,'2022-02-22 20:10:24',1073741848,'log.review.reviewReady',0),(199,1048585,11,3,'2022-02-22 20:10:36',805306371,'log.editor.decision',0),(200,1048585,12,29,'2022-02-22 20:10:49',268435458,'submission.event.general.metadataUpdated',0),(201,515,30,29,'2022-02-22 20:10:51',1342177281,'submission.event.fileUploaded',0),(202,1048585,12,29,'2022-02-22 20:10:51',1342177288,'submission.event.fileRevised',0),(203,515,30,29,'2022-02-22 20:10:51',1342177296,'submission.event.fileEdited',0),(204,1048585,12,29,'2022-02-22 20:10:51',1342177296,'submission.event.fileEdited',0),(205,515,31,29,'2022-02-22 20:10:52',1342177281,'submission.event.fileUploaded',0),(206,1048585,12,29,'2022-02-22 20:10:52',1342177288,'submission.event.fileRevised',0),(207,515,31,29,'2022-02-22 20:10:52',1342177296,'submission.event.fileEdited',0),(208,1048585,12,29,'2022-02-22 20:10:52',1342177296,'submission.event.fileEdited',0),(209,515,32,29,'2022-02-22 20:10:52',1342177281,'submission.event.fileUploaded',0),(210,1048585,12,29,'2022-02-22 20:10:52',1342177288,'submission.event.fileRevised',0),(211,515,32,29,'2022-02-22 20:10:52',1342177296,'submission.event.fileEdited',0),(212,1048585,12,29,'2022-02-22 20:10:52',1342177296,'submission.event.fileEdited',0),(213,1048585,12,29,'2022-02-22 20:12:03',268435458,'submission.event.general.metadataUpdated',0),(214,1048585,12,29,'2022-02-22 20:12:05',268435457,'submission.event.submissionSubmitted',0),(215,1048585,12,3,'2022-02-22 20:12:17',805306371,'log.editor.decision',0),(216,1048585,12,3,'2022-02-22 20:12:28',1073741825,'log.review.reviewerAssigned',0),(217,1048585,12,3,'2022-02-22 20:12:35',1073741825,'log.review.reviewerAssigned',0),(218,1048585,12,3,'2022-02-22 20:12:42',1073741825,'log.review.reviewerAssigned',0),(219,1048585,12,8,'2022-02-22 20:12:52',1073741830,'log.review.reviewAccepted',0),(220,1048585,12,8,'2022-02-22 20:12:57',1073741848,'log.review.reviewReady',0),(221,1048585,13,30,'2022-02-22 20:13:07',268435458,'submission.event.general.metadataUpdated',0),(222,515,33,30,'2022-02-22 20:13:10',1342177281,'submission.event.fileUploaded',0),(223,1048585,13,30,'2022-02-22 20:13:10',1342177288,'submission.event.fileRevised',0),(224,515,33,30,'2022-02-22 20:13:10',1342177296,'submission.event.fileEdited',0),(225,1048585,13,30,'2022-02-22 20:13:10',1342177296,'submission.event.fileEdited',0),(226,515,34,30,'2022-02-22 20:13:10',1342177281,'submission.event.fileUploaded',0),(227,1048585,13,30,'2022-02-22 20:13:10',1342177288,'submission.event.fileRevised',0),(228,515,34,30,'2022-02-22 20:13:11',1342177296,'submission.event.fileEdited',0),(229,1048585,13,30,'2022-02-22 20:13:11',1342177296,'submission.event.fileEdited',0),(230,515,35,30,'2022-02-22 20:13:11',1342177281,'submission.event.fileUploaded',0),(231,1048585,13,30,'2022-02-22 20:13:11',1342177288,'submission.event.fileRevised',0),(232,515,35,30,'2022-02-22 20:13:11',1342177296,'submission.event.fileEdited',0),(233,1048585,13,30,'2022-02-22 20:13:11',1342177296,'submission.event.fileEdited',0),(234,1048585,13,30,'2022-02-22 20:13:56',268435458,'submission.event.general.metadataUpdated',0),(235,1048585,13,30,'2022-02-22 20:13:58',268435457,'submission.event.submissionSubmitted',0),(236,1048585,13,3,'2022-02-22 20:14:08',805306371,'log.editor.decision',0),(237,1048585,13,3,'2022-02-22 20:14:18',1073741825,'log.review.reviewerAssigned',0),(238,1048585,13,3,'2022-02-22 20:14:20',805306371,'log.editor.decision',0),(239,1048585,13,3,'2022-02-22 20:14:30',1073741825,'log.review.reviewerAssigned',0),(240,1048585,13,3,'2022-02-22 20:14:37',1073741825,'log.review.reviewerAssigned',0),(241,1048585,13,3,'2022-02-22 20:14:44',1073741825,'log.review.reviewerAssigned',0),(242,1048585,13,10,'2022-02-22 20:14:53',1073741830,'log.review.reviewAccepted',0),(243,1048585,13,10,'2022-02-22 20:14:57',1073741848,'log.review.reviewReady',0),(244,1048585,13,12,'2022-02-22 20:15:06',1073741830,'log.review.reviewAccepted',0),(245,1048585,13,12,'2022-02-22 20:15:11',1073741848,'log.review.reviewReady',0),(246,1048585,13,3,'2022-02-22 20:15:27',805306371,'log.editor.decision',0),(247,1048585,14,31,'2022-02-22 20:15:41',268435458,'submission.event.general.metadataUpdated',0),(248,515,36,31,'2022-02-22 20:15:43',1342177281,'submission.event.fileUploaded',0),(249,1048585,14,31,'2022-02-22 20:15:43',1342177288,'submission.event.fileRevised',0),(250,515,36,31,'2022-02-22 20:15:44',1342177296,'submission.event.fileEdited',0),(251,1048585,14,31,'2022-02-22 20:15:44',1342177296,'submission.event.fileEdited',0),(252,515,37,31,'2022-02-22 20:15:44',1342177281,'submission.event.fileUploaded',0),(253,1048585,14,31,'2022-02-22 20:15:44',1342177288,'submission.event.fileRevised',0),(254,515,37,31,'2022-02-22 20:15:44',1342177296,'submission.event.fileEdited',0),(255,1048585,14,31,'2022-02-22 20:15:44',1342177296,'submission.event.fileEdited',0),(256,515,38,31,'2022-02-22 20:15:44',1342177281,'submission.event.fileUploaded',0),(257,1048585,14,31,'2022-02-22 20:15:44',1342177288,'submission.event.fileRevised',0),(258,515,38,31,'2022-02-22 20:15:44',1342177296,'submission.event.fileEdited',0),(259,1048585,14,31,'2022-02-22 20:15:44',1342177296,'submission.event.fileEdited',0),(260,515,39,31,'2022-02-22 20:15:45',1342177281,'submission.event.fileUploaded',0),(261,1048585,14,31,'2022-02-22 20:15:45',1342177288,'submission.event.fileRevised',0),(262,515,39,31,'2022-02-22 20:15:45',1342177296,'submission.event.fileEdited',0),(263,1048585,14,31,'2022-02-22 20:15:45',1342177296,'submission.event.fileEdited',0),(264,515,40,31,'2022-02-22 20:15:45',1342177281,'submission.event.fileUploaded',0),(265,1048585,14,31,'2022-02-22 20:15:45',1342177288,'submission.event.fileRevised',0),(266,515,40,31,'2022-02-22 20:15:46',1342177296,'submission.event.fileEdited',0),(267,1048585,14,31,'2022-02-22 20:15:46',1342177296,'submission.event.fileEdited',0),(268,515,41,31,'2022-02-22 20:15:46',1342177281,'submission.event.fileUploaded',0),(269,1048585,14,31,'2022-02-22 20:15:46',1342177288,'submission.event.fileRevised',0),(270,515,41,31,'2022-02-22 20:15:47',1342177296,'submission.event.fileEdited',0),(271,1048585,14,31,'2022-02-22 20:15:47',1342177296,'submission.event.fileEdited',0),(272,1048585,14,31,'2022-02-22 20:16:38',268435458,'submission.event.general.metadataUpdated',0),(273,1048585,14,31,'2022-02-22 20:16:40',268435457,'submission.event.submissionSubmitted',0),(274,1048585,14,3,'2022-02-22 20:16:52',805306371,'log.editor.decision',0),(275,1048585,14,3,'2022-02-22 20:17:03',1073741825,'log.review.reviewerAssigned',0),(276,1048585,14,3,'2022-02-22 20:17:06',805306371,'log.editor.decision',0),(277,1048585,14,3,'2022-02-22 20:17:16',1073741825,'log.review.reviewerAssigned',0),(278,1048585,14,3,'2022-02-22 20:17:20',805306371,'log.editor.decision',0),(279,1048585,14,3,'2022-02-22 20:17:31',268435459,'submission.event.participantAdded',0),(280,1048585,14,3,'2022-02-22 20:17:35',805306371,'log.editor.decision',0),(281,1048585,14,3,'2022-02-22 20:17:46',268435459,'submission.event.participantAdded',0),(282,1048585,14,3,'2022-02-22 20:17:53',268435459,'submission.event.participantAdded',0),(283,1048585,14,3,'2022-02-22 20:18:00',268435474,'submission.event.publicationFormatCreated',0),(284,515,42,3,'2022-02-22 20:18:08',1342177281,'submission.event.fileUploaded',0),(285,1048585,14,3,'2022-02-22 20:18:08',1342177288,'submission.event.fileRevised',0),(286,515,43,3,'2022-02-22 20:18:08',1342177281,'submission.event.fileUploaded',0),(287,1048585,14,3,'2022-02-22 20:18:08',1342177288,'submission.event.fileRevised',0),(288,515,44,3,'2022-02-22 20:18:08',1342177281,'submission.event.fileUploaded',0),(289,1048585,14,3,'2022-02-22 20:18:08',1342177288,'submission.event.fileRevised',0),(290,515,45,3,'2022-02-22 20:18:08',1342177281,'submission.event.fileUploaded',0),(291,1048585,14,3,'2022-02-22 20:18:08',1342177288,'submission.event.fileRevised',0),(292,515,46,3,'2022-02-22 20:18:09',1342177281,'submission.event.fileUploaded',0),(293,1048585,14,3,'2022-02-22 20:18:09',1342177288,'submission.event.fileRevised',0),(294,515,47,3,'2022-02-22 20:18:09',1342177281,'submission.event.fileUploaded',0),(295,1048585,14,3,'2022-02-22 20:18:09',1342177288,'submission.event.fileRevised',0),(296,1048585,14,3,'2022-02-22 20:18:11',268435464,'submission.event.publicationFormatPublished',0),(297,1048585,14,3,'2022-02-22 20:18:13',268435476,'submission.event.publicationFormatMadeAvailable',0),(298,515,47,3,'2022-02-22 20:18:16',1342177296,'submission.event.fileEdited',0),(299,1048585,14,3,'2022-02-22 20:18:16',1342177296,'submission.event.fileEdited',0),(300,515,47,3,'2022-02-22 20:18:16',1342177287,'submission.event.signoffSignoff',0),(301,515,47,3,'2022-02-22 20:18:19',1342177296,'submission.event.fileEdited',0),(302,1048585,14,3,'2022-02-22 20:18:19',1342177296,'submission.event.fileEdited',0),(303,515,45,3,'2022-02-22 20:18:22',1342177296,'submission.event.fileEdited',0),(304,1048585,14,3,'2022-02-22 20:18:22',1342177296,'submission.event.fileEdited',0),(305,515,45,3,'2022-02-22 20:18:22',1342177287,'submission.event.signoffSignoff',0),(306,515,45,3,'2022-02-22 20:18:26',1342177296,'submission.event.fileEdited',0),(307,1048585,14,3,'2022-02-22 20:18:26',1342177296,'submission.event.fileEdited',0),(308,515,46,3,'2022-02-22 20:18:28',1342177296,'submission.event.fileEdited',0),(309,1048585,14,3,'2022-02-22 20:18:28',1342177296,'submission.event.fileEdited',0),(310,515,46,3,'2022-02-22 20:18:28',1342177287,'submission.event.signoffSignoff',0),(311,515,46,3,'2022-02-22 20:18:32',1342177296,'submission.event.fileEdited',0),(312,1048585,14,3,'2022-02-22 20:18:32',1342177296,'submission.event.fileEdited',0),(313,515,43,3,'2022-02-22 20:18:35',1342177296,'submission.event.fileEdited',0),(314,1048585,14,3,'2022-02-22 20:18:35',1342177296,'submission.event.fileEdited',0),(315,515,43,3,'2022-02-22 20:18:35',1342177287,'submission.event.signoffSignoff',0),(316,515,43,3,'2022-02-22 20:18:38',1342177296,'submission.event.fileEdited',0),(317,1048585,14,3,'2022-02-22 20:18:38',1342177296,'submission.event.fileEdited',0),(318,515,44,3,'2022-02-22 20:18:42',1342177296,'submission.event.fileEdited',0),(319,1048585,14,3,'2022-02-22 20:18:42',1342177296,'submission.event.fileEdited',0),(320,515,44,3,'2022-02-22 20:18:42',1342177287,'submission.event.signoffSignoff',0),(321,515,44,3,'2022-02-22 20:18:45',1342177296,'submission.event.fileEdited',0),(322,1048585,14,3,'2022-02-22 20:18:45',1342177296,'submission.event.fileEdited',0),(323,515,42,3,'2022-02-22 20:18:49',1342177296,'submission.event.fileEdited',0),(324,1048585,14,3,'2022-02-22 20:18:49',1342177296,'submission.event.fileEdited',0),(325,515,42,3,'2022-02-22 20:18:49',1342177287,'submission.event.signoffSignoff',0),(326,515,42,3,'2022-02-22 20:18:52',1342177296,'submission.event.fileEdited',0),(327,1048585,14,3,'2022-02-22 20:18:52',1342177296,'submission.event.fileEdited',0),(328,1048585,14,3,'2022-02-22 20:18:55',268435462,'publication.event.published',0),(329,1048585,15,32,'2022-02-22 20:19:05',268435458,'submission.event.general.metadataUpdated',0),(330,515,48,32,'2022-02-22 20:19:07',1342177281,'submission.event.fileUploaded',0),(331,1048585,15,32,'2022-02-22 20:19:07',1342177288,'submission.event.fileRevised',0),(332,515,48,32,'2022-02-22 20:19:08',1342177296,'submission.event.fileEdited',0),(333,1048585,15,32,'2022-02-22 20:19:08',1342177296,'submission.event.fileEdited',0),(334,1048585,15,32,'2022-02-22 20:19:25',268435458,'submission.event.general.metadataUpdated',0),(335,1048585,15,32,'2022-02-22 20:19:26',268435457,'submission.event.submissionSubmitted',0),(336,1048585,15,3,'2022-02-22 20:19:36',805306371,'log.editor.decision',0),(337,1048585,16,33,'2022-02-22 20:19:48',268435458,'submission.event.general.metadataUpdated',0),(338,515,49,33,'2022-02-22 20:19:50',1342177281,'submission.event.fileUploaded',0),(339,1048585,16,33,'2022-02-22 20:19:50',1342177288,'submission.event.fileRevised',0),(340,515,49,33,'2022-02-22 20:19:51',1342177296,'submission.event.fileEdited',0),(341,1048585,16,33,'2022-02-22 20:19:51',1342177296,'submission.event.fileEdited',0),(342,1048585,16,33,'2022-02-22 20:20:14',268435458,'submission.event.general.metadataUpdated',0),(343,1048585,16,33,'2022-02-22 20:20:15',268435457,'submission.event.submissionSubmitted',0),(344,1048585,16,3,'2022-02-22 20:20:25',805306371,'log.editor.decision',0),(345,1048585,16,3,'2022-02-22 20:20:33',1073741825,'log.review.reviewerAssigned',0),(346,1048585,16,3,'2022-02-22 20:20:39',1073741825,'log.review.reviewerAssigned',0),(347,1048585,16,3,'2022-02-22 20:20:45',1073741825,'log.review.reviewerAssigned',0),(348,1048585,16,10,'2022-02-22 20:20:52',1073741830,'log.review.reviewAccepted',0),(349,1048585,16,10,'2022-02-22 20:20:56',1073741848,'log.review.reviewReady',0),(350,1048585,17,34,'2022-02-22 20:21:06',268435458,'submission.event.general.metadataUpdated',0),(351,515,50,34,'2022-02-22 20:21:09',1342177281,'submission.event.fileUploaded',0),(352,1048585,17,34,'2022-02-22 20:21:09',1342177288,'submission.event.fileRevised',0),(353,515,50,34,'2022-02-22 20:21:09',1342177296,'submission.event.fileEdited',0),(354,1048585,17,34,'2022-02-22 20:21:09',1342177296,'submission.event.fileEdited',0),(355,515,51,34,'2022-02-22 20:21:09',1342177281,'submission.event.fileUploaded',0),(356,1048585,17,34,'2022-02-22 20:21:09',1342177288,'submission.event.fileRevised',0),(357,515,51,34,'2022-02-22 20:21:10',1342177296,'submission.event.fileEdited',0),(358,1048585,17,34,'2022-02-22 20:21:10',1342177296,'submission.event.fileEdited',0),(359,515,52,34,'2022-02-22 20:21:10',1342177281,'submission.event.fileUploaded',0),(360,1048585,17,34,'2022-02-22 20:21:10',1342177288,'submission.event.fileRevised',0),(361,515,52,34,'2022-02-22 20:21:10',1342177296,'submission.event.fileEdited',0),(362,1048585,17,34,'2022-02-22 20:21:10',1342177296,'submission.event.fileEdited',0),(363,515,53,34,'2022-02-22 20:21:10',1342177281,'submission.event.fileUploaded',0),(364,1048585,17,34,'2022-02-22 20:21:10',1342177288,'submission.event.fileRevised',0),(365,515,53,34,'2022-02-22 20:21:11',1342177296,'submission.event.fileEdited',0),(366,1048585,17,34,'2022-02-22 20:21:11',1342177296,'submission.event.fileEdited',0),(367,515,54,34,'2022-02-22 20:21:11',1342177281,'submission.event.fileUploaded',0),(368,1048585,17,34,'2022-02-22 20:21:11',1342177288,'submission.event.fileRevised',0),(369,515,54,34,'2022-02-22 20:21:11',1342177296,'submission.event.fileEdited',0),(370,1048585,17,34,'2022-02-22 20:21:11',1342177296,'submission.event.fileEdited',0),(371,515,55,34,'2022-02-22 20:21:11',1342177281,'submission.event.fileUploaded',0),(372,1048585,17,34,'2022-02-22 20:21:11',1342177288,'submission.event.fileRevised',0),(373,515,55,34,'2022-02-22 20:21:12',1342177296,'submission.event.fileEdited',0),(374,1048585,17,34,'2022-02-22 20:21:12',1342177296,'submission.event.fileEdited',0),(375,1048585,17,34,'2022-02-22 20:23:15',268435458,'submission.event.general.metadataUpdated',0),(376,1048585,17,34,'2022-02-22 20:23:17',268435457,'submission.event.submissionSubmitted',0),(377,1048585,17,3,'2022-02-22 20:23:32',805306371,'log.editor.decision',0),(378,1048585,17,3,'2022-02-22 20:23:43',1073741825,'log.review.reviewerAssigned',0),(379,1048585,17,3,'2022-02-22 20:23:52',1073741825,'log.review.reviewerAssigned',0);
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
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `event_log_settings_pkey` (`log_id`,`setting_name`),
  KEY `event_log_settings_log_id` (`log_id`),
  KEY `event_log_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
INSERT INTO `event_log_settings` VALUES (2,'fileId','1','int'),(2,'fileStage','2','int'),(2,'originalFileName','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(2,'sourceSubmissionFileId',NULL,'string'),(2,'submissionFileId','1','int'),(2,'submissionId','1','int'),(2,'username','aclark','string'),(3,'fileId','1','int'),(3,'fileStage','2','int'),(3,'name','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(3,'submissionFileId','1','int'),(3,'submissionId','1','int'),(3,'username','aclark','string'),(4,'fileId','1','int'),(4,'fileStage','2','int'),(4,'originalFileName','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(4,'sourceSubmissionFileId',NULL,'string'),(4,'submissionFileId','1','int'),(4,'submissionId','1','int'),(4,'username','aclark','string'),(5,'fileId','1','int'),(5,'fileStage','2','int'),(5,'name','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(5,'originalFileName','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(5,'sourceSubmissionFileId',NULL,'string'),(5,'submissionFileId','1','int'),(5,'submissionId','1','int'),(5,'username','aclark','string'),(8,'decision','Send to External Review','string'),(8,'editorName','Daniel Barnes','string'),(8,'submissionId','1','int'),(9,'reviewAssignmentId','1','string'),(9,'reviewerName','Gonzalo Favio','string'),(9,'round','1','int'),(9,'stageId','3','int'),(9,'submissionId','1','int'),(10,'decision','Accept Submission','string'),(10,'editorName','Daniel Barnes','string'),(10,'submissionId','1','int'),(11,'name','Sarah Vogt','string'),(11,'userGroupName','Copyeditor','string'),(11,'username','svogt','string'),(13,'fileId','2','int'),(13,'fileStage','2','int'),(13,'originalFileName','Critical History in Western Canada 1900–.pdf','string'),(13,'sourceSubmissionFileId',NULL,'string'),(13,'submissionFileId','2','int'),(13,'submissionId','2','int'),(13,'username','afinkel','string'),(14,'fileId','2','int'),(14,'fileStage','2','int'),(14,'name','Critical History in Western Canada 1900–.pdf','string'),(14,'submissionFileId','2','int'),(14,'submissionId','2','int'),(14,'username','afinkel','string'),(15,'fileId','2','int'),(15,'fileStage','2','int'),(15,'originalFileName','Critical History in Western Canada 1900–.pdf','string'),(15,'sourceSubmissionFileId',NULL,'string'),(15,'submissionFileId','2','int'),(15,'submissionId','2','int'),(15,'username','afinkel','string'),(16,'fileId','2','int'),(16,'fileStage','2','int'),(16,'name','Critical History in Western Canada 1900–.pdf','string'),(16,'originalFileName','Critical History in Western Canada 1900–.pdf','string'),(16,'sourceSubmissionFileId',NULL,'string'),(16,'submissionFileId','2','int'),(16,'submissionId','2','int'),(16,'username','afinkel','string'),(17,'fileId','3','int'),(17,'fileStage','2','int'),(17,'originalFileName','Vernacular Currents in Western Canadian .pdf','string'),(17,'sourceSubmissionFileId',NULL,'string'),(17,'submissionFileId','3','int'),(17,'submissionId','2','int'),(17,'username','afinkel','string'),(18,'fileId','3','int'),(18,'fileStage','2','int'),(18,'name','Vernacular Currents in Western Canadian .pdf','string'),(18,'submissionFileId','3','int'),(18,'submissionId','2','int'),(18,'username','afinkel','string'),(19,'fileId','3','int'),(19,'fileStage','2','int'),(19,'originalFileName','Vernacular Currents in Western Canadian .pdf','string'),(19,'sourceSubmissionFileId',NULL,'string'),(19,'submissionFileId','3','int'),(19,'submissionId','2','int'),(19,'username','afinkel','string'),(20,'fileId','3','int'),(20,'fileStage','2','int'),(20,'name','Vernacular Currents in Western Canadian .pdf','string'),(20,'originalFileName','Vernacular Currents in Western Canadian .pdf','string'),(20,'sourceSubmissionFileId',NULL,'string'),(20,'submissionFileId','3','int'),(20,'submissionId','2','int'),(20,'username','afinkel','string'),(21,'fileId','4','int'),(21,'fileStage','2','int'),(21,'originalFileName','Cree Intellectual Traditions in History.pdf','string'),(21,'sourceSubmissionFileId',NULL,'string'),(21,'submissionFileId','4','int'),(21,'submissionId','2','int'),(21,'username','afinkel','string'),(22,'fileId','4','int'),(22,'fileStage','2','int'),(22,'name','Cree Intellectual Traditions in History.pdf','string'),(22,'submissionFileId','4','int'),(22,'submissionId','2','int'),(22,'username','afinkel','string'),(23,'fileId','4','int'),(23,'fileStage','2','int'),(23,'originalFileName','Cree Intellectual Traditions in History.pdf','string'),(23,'sourceSubmissionFileId',NULL,'string'),(23,'submissionFileId','4','int'),(23,'submissionId','2','int'),(23,'username','afinkel','string'),(24,'fileId','4','int'),(24,'fileStage','2','int'),(24,'name','Cree Intellectual Traditions in History.pdf','string'),(24,'originalFileName','Cree Intellectual Traditions in History.pdf','string'),(24,'sourceSubmissionFileId',NULL,'string'),(24,'submissionFileId','4','int'),(24,'submissionId','2','int'),(24,'username','afinkel','string'),(25,'fileId','5','int'),(25,'fileStage','2','int'),(25,'originalFileName','Visualizing Space, Race, and History in .pdf','string'),(25,'sourceSubmissionFileId',NULL,'string'),(25,'submissionFileId','5','int'),(25,'submissionId','2','int'),(25,'username','afinkel','string'),(26,'fileId','5','int'),(26,'fileStage','2','int'),(26,'name','Visualizing Space, Race, and History in .pdf','string'),(26,'submissionFileId','5','int'),(26,'submissionId','2','int'),(26,'username','afinkel','string'),(27,'fileId','5','int'),(27,'fileStage','2','int'),(27,'originalFileName','Visualizing Space, Race, and History in .pdf','string'),(27,'sourceSubmissionFileId',NULL,'string'),(27,'submissionFileId','5','int'),(27,'submissionId','2','int'),(27,'username','afinkel','string'),(28,'fileId','5','int'),(28,'fileStage','2','int'),(28,'name','Visualizing Space, Race, and History in .pdf','string'),(28,'originalFileName','Visualizing Space, Race, and History in .pdf','string'),(28,'sourceSubmissionFileId',NULL,'string'),(28,'submissionFileId','5','int'),(28,'submissionId','2','int'),(28,'username','afinkel','string'),(31,'decision','Send to External Review','string'),(31,'editorName','Daniel Barnes','string'),(31,'submissionId','2','int'),(32,'reviewAssignmentId','2','string'),(32,'reviewerName','Al Zacharia','string'),(32,'round','1','int'),(32,'stageId','3','int'),(32,'submissionId','2','int'),(33,'reviewAssignmentId','3','string'),(33,'reviewerName','Gonzalo Favio','string'),(33,'round','1','int'),(33,'stageId','3','int'),(33,'submissionId','2','int'),(35,'fileId','6','int'),(35,'fileStage','2','int'),(35,'originalFileName','The Political Economy of Workplace Injury in Canada.pdf','string'),(35,'sourceSubmissionFileId',NULL,'string'),(35,'submissionFileId','6','int'),(35,'submissionId','3','int'),(35,'username','bbarnetson','string'),(36,'fileId','6','int'),(36,'fileStage','2','int'),(36,'name','The Political Economy of Workplace Injury in Canada.pdf','string'),(36,'submissionFileId','6','int'),(36,'submissionId','3','int'),(36,'username','bbarnetson','string'),(37,'fileId','6','int'),(37,'fileStage','2','int'),(37,'originalFileName','The Political Economy of Workplace Injury in Canada.pdf','string'),(37,'sourceSubmissionFileId',NULL,'string'),(37,'submissionFileId','6','int'),(37,'submissionId','3','int'),(37,'username','bbarnetson','string'),(38,'fileId','6','int'),(38,'fileStage','2','int'),(38,'name','The Political Economy of Workplace Injury in Canada.pdf','string'),(38,'originalFileName','The Political Economy of Workplace Injury in Canada.pdf','string'),(38,'sourceSubmissionFileId',NULL,'string'),(38,'submissionFileId','6','int'),(38,'submissionId','3','int'),(38,'username','bbarnetson','string'),(42,'fileId','7','int'),(42,'fileStage','2','int'),(42,'originalFileName','Introduction: Contexts of Popular Cultur.pdf','string'),(42,'sourceSubmissionFileId',NULL,'string'),(42,'submissionFileId','7','int'),(42,'submissionId','4','int'),(42,'username','bbeaty','string'),(43,'fileId','7','int'),(43,'fileStage','2','int'),(43,'name','Introduction: Contexts of Popular Cultur.pdf','string'),(43,'submissionFileId','7','int'),(43,'submissionId','4','int'),(43,'username','bbeaty','string'),(44,'fileId','7','int'),(44,'fileStage','2','int'),(44,'originalFileName','Introduction: Contexts of Popular Cultur.pdf','string'),(44,'sourceSubmissionFileId',NULL,'string'),(44,'submissionFileId','7','int'),(44,'submissionId','4','int'),(44,'username','bbeaty','string'),(45,'fileId','7','int'),(45,'fileStage','2','int'),(45,'name','Introduction: Contexts of Popular Cultur.pdf','string'),(45,'originalFileName','Introduction: Contexts of Popular Cultur.pdf','string'),(45,'sourceSubmissionFileId',NULL,'string'),(45,'submissionFileId','7','int'),(45,'submissionId','4','int'),(45,'username','bbeaty','string'),(46,'fileId','8','int'),(46,'fileStage','2','int'),(46,'originalFileName','Chapter 1. A Future for Media Studies: C.pdf','string'),(46,'sourceSubmissionFileId',NULL,'string'),(46,'submissionFileId','8','int'),(46,'submissionId','4','int'),(46,'username','bbeaty','string'),(47,'fileId','8','int'),(47,'fileStage','2','int'),(47,'name','Chapter 1. A Future for Media Studies: C.pdf','string'),(47,'submissionFileId','8','int'),(47,'submissionId','4','int'),(47,'username','bbeaty','string'),(48,'fileId','8','int'),(48,'fileStage','2','int'),(48,'originalFileName','Chapter 1. A Future for Media Studies: C.pdf','string'),(48,'sourceSubmissionFileId',NULL,'string'),(48,'submissionFileId','8','int'),(48,'submissionId','4','int'),(48,'username','bbeaty','string'),(49,'fileId','8','int'),(49,'fileStage','2','int'),(49,'name','Chapter 1. A Future for Media Studies: C.pdf','string'),(49,'originalFileName','Chapter 1. A Future for Media Studies: C.pdf','string'),(49,'sourceSubmissionFileId',NULL,'string'),(49,'submissionFileId','8','int'),(49,'submissionId','4','int'),(49,'username','bbeaty','string'),(50,'fileId','9','int'),(50,'fileStage','2','int'),(50,'originalFileName','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(50,'sourceSubmissionFileId',NULL,'string'),(50,'submissionFileId','9','int'),(50,'submissionId','4','int'),(50,'username','bbeaty','string'),(51,'fileId','9','int'),(51,'fileStage','2','int'),(51,'name','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(51,'submissionFileId','9','int'),(51,'submissionId','4','int'),(51,'username','bbeaty','string'),(52,'fileId','9','int'),(52,'fileStage','2','int'),(52,'originalFileName','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(52,'sourceSubmissionFileId',NULL,'string'),(52,'submissionFileId','9','int'),(52,'submissionId','4','int'),(52,'username','bbeaty','string'),(53,'fileId','9','int'),(53,'fileStage','2','int'),(53,'name','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(53,'originalFileName','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(53,'sourceSubmissionFileId',NULL,'string'),(53,'submissionFileId','9','int'),(53,'submissionId','4','int'),(53,'username','bbeaty','string'),(54,'fileId','10','int'),(54,'fileStage','2','int'),(54,'originalFileName','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(54,'sourceSubmissionFileId',NULL,'string'),(54,'submissionFileId','10','int'),(54,'submissionId','4','int'),(54,'username','bbeaty','string'),(55,'fileId','10','int'),(55,'fileStage','2','int'),(55,'name','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(55,'submissionFileId','10','int'),(55,'submissionId','4','int'),(55,'username','bbeaty','string'),(56,'fileId','10','int'),(56,'fileStage','2','int'),(56,'originalFileName','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(56,'sourceSubmissionFileId',NULL,'string'),(56,'submissionFileId','10','int'),(56,'submissionId','4','int'),(56,'username','bbeaty','string'),(57,'fileId','10','int'),(57,'fileStage','2','int'),(57,'name','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(57,'originalFileName','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(57,'sourceSubmissionFileId',NULL,'string'),(57,'submissionFileId','10','int'),(57,'submissionId','4','int'),(57,'username','bbeaty','string'),(60,'decision','Send to Internal Review','string'),(60,'editorName','Daniel Barnes','string'),(60,'submissionId','4','int'),(61,'reviewAssignmentId','4','string'),(61,'reviewerName','Aisla McCrae','string'),(61,'round','1','int'),(61,'stageId','2','int'),(61,'submissionId','4','int'),(62,'decision','Send to External Review','string'),(62,'editorName','Daniel Barnes','string'),(62,'submissionId','4','int'),(63,'reviewAssignmentId','5','string'),(63,'reviewerName','Al Zacharia','string'),(63,'round','1','int'),(63,'stageId','3','int'),(63,'submissionId','4','int'),(64,'decision','Accept Submission','string'),(64,'editorName','Daniel Barnes','string'),(64,'submissionId','4','int'),(65,'name','Maria Fritz','string'),(65,'userGroupName','Copyeditor','string'),(65,'username','mfritz','string'),(66,'decision','Send To Production','string'),(66,'editorName','Daniel Barnes','string'),(66,'submissionId','4','int'),(67,'name','Graham Cox','string'),(67,'userGroupName','Layout Editor','string'),(67,'username','gcox','string'),(68,'formatName','PDF','string'),(70,'fileId','11','int'),(70,'fileStage','2','int'),(70,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(70,'sourceSubmissionFileId',NULL,'string'),(70,'submissionFileId','11','int'),(70,'submissionId','5','int'),(70,'username','callan','string'),(71,'fileId','11','int'),(71,'fileStage','2','int'),(71,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(71,'submissionFileId','11','int'),(71,'submissionId','5','int'),(71,'username','callan','string'),(72,'fileId','11','int'),(72,'fileStage','2','int'),(72,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(72,'sourceSubmissionFileId',NULL,'string'),(72,'submissionFileId','11','int'),(72,'submissionId','5','int'),(72,'username','callan','string'),(73,'fileId','11','int'),(73,'fileStage','2','int'),(73,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(73,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(73,'sourceSubmissionFileId',NULL,'string'),(73,'submissionFileId','11','int'),(73,'submissionId','5','int'),(73,'username','callan','string'),(76,'decision','Send to Internal Review','string'),(76,'editorName','Daniel Barnes','string'),(76,'submissionId','5','int'),(77,'reviewAssignmentId','6','string'),(77,'reviewerName','Paul Hudson','string'),(77,'round','1','int'),(77,'stageId','2','int'),(77,'submissionId','5','int'),(78,'decision','Send to External Review','string'),(78,'editorName','Daniel Barnes','string'),(78,'submissionId','5','int'),(79,'reviewAssignmentId','7','string'),(79,'reviewerName','Gonzalo Favio','string'),(79,'round','1','int'),(79,'stageId','3','int'),(79,'submissionId','5','int'),(80,'decision','Accept Submission','string'),(80,'editorName','Daniel Barnes','string'),(80,'submissionId','5','int'),(81,'name','Sarah Vogt','string'),(81,'userGroupName','Copyeditor','string'),(81,'username','svogt','string'),(82,'decision','Send To Production','string'),(82,'editorName','Daniel Barnes','string'),(82,'submissionId','5','int'),(83,'name','Stephen Hellier','string'),(83,'userGroupName','Layout Editor','string'),(83,'username','shellier','string'),(84,'name','Catherine Turner','string'),(84,'userGroupName','Proofreader','string'),(84,'username','cturner','string'),(85,'formatName','PDF','string'),(86,'fileId','11','int'),(86,'fileStage','10','int'),(86,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(86,'sourceSubmissionFileId','11','int'),(86,'submissionFileId','12','int'),(86,'submissionId','5','int'),(86,'username','dbarnes','string'),(87,'fileId','11','int'),(87,'fileStage','10','int'),(87,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(87,'submissionFileId','12','int'),(87,'submissionId','5','int'),(87,'username','dbarnes','string'),(88,'publicationFormatName','PDF','string'),(89,'publicationFormatName','PDF','string'),(90,'fileId','11','int'),(90,'fileStage','10','int'),(90,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(90,'sourceSubmissionFileId','11','int'),(90,'submissionFileId','12','int'),(90,'submissionId','5','int'),(90,'username','dbarnes','string'),(91,'fileId','11','int'),(91,'fileStage','10','int'),(91,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(91,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(91,'sourceSubmissionFileId','11','int'),(91,'submissionFileId','12','int'),(91,'submissionId','5','int'),(91,'username','dbarnes','string'),(92,'file','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(92,'name','Daniel Barnes','string'),(92,'username','dbarnes','string'),(93,'fileId','11','int'),(93,'fileStage','10','int'),(93,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(93,'sourceSubmissionFileId','11','int'),(93,'submissionFileId','12','int'),(93,'submissionId','5','int'),(93,'username','dbarnes','string'),(94,'fileId','11','int'),(94,'fileStage','10','int'),(94,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(94,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(94,'sourceSubmissionFileId','11','int'),(94,'submissionFileId','12','int'),(94,'submissionId','5','int'),(94,'username','dbarnes','string'),(97,'fileId','12','int'),(97,'fileStage','2','int'),(97,'originalFileName','Identify: Understanding Your Information.pdf','string'),(97,'sourceSubmissionFileId',NULL,'string'),(97,'submissionFileId','13','int'),(97,'submissionId','6','int'),(97,'username','dbernnard','string'),(98,'fileId','12','int'),(98,'fileStage','2','int'),(98,'name','Identify: Understanding Your Information.pdf','string'),(98,'submissionFileId','13','int'),(98,'submissionId','6','int'),(98,'username','dbernnard','string'),(99,'fileId','12','int'),(99,'fileStage','2','int'),(99,'originalFileName','Identify: Understanding Your Information.pdf','string'),(99,'sourceSubmissionFileId',NULL,'string'),(99,'submissionFileId','13','int'),(99,'submissionId','6','int'),(99,'username','dbernnard','string'),(100,'fileId','12','int'),(100,'fileStage','2','int'),(100,'name','Identify: Understanding Your Information.pdf','string'),(100,'originalFileName','Identify: Understanding Your Information.pdf','string'),(100,'sourceSubmissionFileId',NULL,'string'),(100,'submissionFileId','13','int'),(100,'submissionId','6','int'),(100,'username','dbernnard','string'),(101,'fileId','13','int'),(101,'fileStage','2','int'),(101,'originalFileName','Scope: Knowing What Is Available.pdf','string'),(101,'sourceSubmissionFileId',NULL,'string'),(101,'submissionFileId','14','int'),(101,'submissionId','6','int'),(101,'username','dbernnard','string'),(102,'fileId','13','int'),(102,'fileStage','2','int'),(102,'name','Scope: Knowing What Is Available.pdf','string'),(102,'submissionFileId','14','int'),(102,'submissionId','6','int'),(102,'username','dbernnard','string'),(103,'fileId','13','int'),(103,'fileStage','2','int'),(103,'originalFileName','Scope: Knowing What Is Available.pdf','string'),(103,'sourceSubmissionFileId',NULL,'string'),(103,'submissionFileId','14','int'),(103,'submissionId','6','int'),(103,'username','dbernnard','string'),(104,'fileId','13','int'),(104,'fileStage','2','int'),(104,'name','Scope: Knowing What Is Available.pdf','string'),(104,'originalFileName','Scope: Knowing What Is Available.pdf','string'),(104,'sourceSubmissionFileId',NULL,'string'),(104,'submissionFileId','14','int'),(104,'submissionId','6','int'),(104,'username','dbernnard','string'),(105,'fileId','14','int'),(105,'fileStage','2','int'),(105,'originalFileName','Plan: Developing Research Strategies.pdf','string'),(105,'sourceSubmissionFileId',NULL,'string'),(105,'submissionFileId','15','int'),(105,'submissionId','6','int'),(105,'username','dbernnard','string'),(106,'fileId','14','int'),(106,'fileStage','2','int'),(106,'name','Plan: Developing Research Strategies.pdf','string'),(106,'submissionFileId','15','int'),(106,'submissionId','6','int'),(106,'username','dbernnard','string'),(107,'fileId','14','int'),(107,'fileStage','2','int'),(107,'originalFileName','Plan: Developing Research Strategies.pdf','string'),(107,'sourceSubmissionFileId',NULL,'string'),(107,'submissionFileId','15','int'),(107,'submissionId','6','int'),(107,'username','dbernnard','string'),(108,'fileId','14','int'),(108,'fileStage','2','int'),(108,'name','Plan: Developing Research Strategies.pdf','string'),(108,'originalFileName','Plan: Developing Research Strategies.pdf','string'),(108,'sourceSubmissionFileId',NULL,'string'),(108,'submissionFileId','15','int'),(108,'submissionId','6','int'),(108,'username','dbernnard','string'),(109,'fileId','15','int'),(109,'fileStage','2','int'),(109,'originalFileName','Gather: Finding What You Need.pdf','string'),(109,'sourceSubmissionFileId',NULL,'string'),(109,'submissionFileId','16','int'),(109,'submissionId','6','int'),(109,'username','dbernnard','string'),(110,'fileId','15','int'),(110,'fileStage','2','int'),(110,'name','Gather: Finding What You Need.pdf','string'),(110,'submissionFileId','16','int'),(110,'submissionId','6','int'),(110,'username','dbernnard','string'),(111,'fileId','15','int'),(111,'fileStage','2','int'),(111,'originalFileName','Gather: Finding What You Need.pdf','string'),(111,'sourceSubmissionFileId',NULL,'string'),(111,'submissionFileId','16','int'),(111,'submissionId','6','int'),(111,'username','dbernnard','string'),(112,'fileId','15','int'),(112,'fileStage','2','int'),(112,'name','Gather: Finding What You Need.pdf','string'),(112,'originalFileName','Gather: Finding What You Need.pdf','string'),(112,'sourceSubmissionFileId',NULL,'string'),(112,'submissionFileId','16','int'),(112,'submissionId','6','int'),(112,'username','dbernnard','string'),(115,'decision','Send to Internal Review','string'),(115,'editorName','Daniel Barnes','string'),(115,'submissionId','6','int'),(116,'name','Minoti Inoue','string'),(116,'userGroupName','Series editor','string'),(116,'username','minoue','string'),(117,'decision','Send to External Review','string'),(117,'editorName','Minoti Inoue','string'),(117,'submissionId','6','int'),(119,'fileId','16','int'),(119,'fileStage','2','int'),(119,'originalFileName','Introduction.pdf','string'),(119,'sourceSubmissionFileId',NULL,'string'),(119,'submissionFileId','17','int'),(119,'submissionId','7','int'),(119,'username','dkennepohl','string'),(120,'fileId','16','int'),(120,'fileStage','2','int'),(120,'name','Introduction.pdf','string'),(120,'submissionFileId','17','int'),(120,'submissionId','7','int'),(120,'username','dkennepohl','string'),(121,'fileId','16','int'),(121,'fileStage','2','int'),(121,'originalFileName','Introduction.pdf','string'),(121,'sourceSubmissionFileId',NULL,'string'),(121,'submissionFileId','17','int'),(121,'submissionId','7','int'),(121,'username','dkennepohl','string'),(122,'fileId','16','int'),(122,'fileStage','2','int'),(122,'name','Introduction.pdf','string'),(122,'originalFileName','Introduction.pdf','string'),(122,'sourceSubmissionFileId',NULL,'string'),(122,'submissionFileId','17','int'),(122,'submissionId','7','int'),(122,'username','dkennepohl','string'),(123,'fileId','17','int'),(123,'fileStage','2','int'),(123,'originalFileName','Chapter 1: Interactions Affording Distan.pdf','string'),(123,'sourceSubmissionFileId',NULL,'string'),(123,'submissionFileId','18','int'),(123,'submissionId','7','int'),(123,'username','dkennepohl','string'),(124,'fileId','17','int'),(124,'fileStage','2','int'),(124,'name','Chapter 1: Interactions Affording Distan.pdf','string'),(124,'submissionFileId','18','int'),(124,'submissionId','7','int'),(124,'username','dkennepohl','string'),(125,'fileId','17','int'),(125,'fileStage','2','int'),(125,'originalFileName','Chapter 1: Interactions Affording Distan.pdf','string'),(125,'sourceSubmissionFileId',NULL,'string'),(125,'submissionFileId','18','int'),(125,'submissionId','7','int'),(125,'username','dkennepohl','string'),(126,'fileId','17','int'),(126,'fileStage','2','int'),(126,'name','Chapter 1: Interactions Affording Distan.pdf','string'),(126,'originalFileName','Chapter 1: Interactions Affording Distan.pdf','string'),(126,'sourceSubmissionFileId',NULL,'string'),(126,'submissionFileId','18','int'),(126,'submissionId','7','int'),(126,'username','dkennepohl','string'),(127,'fileId','18','int'),(127,'fileStage','2','int'),(127,'originalFileName','Chapter 2: Learning Science at a Distanc.pdf','string'),(127,'sourceSubmissionFileId',NULL,'string'),(127,'submissionFileId','19','int'),(127,'submissionId','7','int'),(127,'username','dkennepohl','string'),(128,'fileId','18','int'),(128,'fileStage','2','int'),(128,'name','Chapter 2: Learning Science at a Distanc.pdf','string'),(128,'submissionFileId','19','int'),(128,'submissionId','7','int'),(128,'username','dkennepohl','string'),(129,'fileId','18','int'),(129,'fileStage','2','int'),(129,'originalFileName','Chapter 2: Learning Science at a Distanc.pdf','string'),(129,'sourceSubmissionFileId',NULL,'string'),(129,'submissionFileId','19','int'),(129,'submissionId','7','int'),(129,'username','dkennepohl','string'),(130,'fileId','18','int'),(130,'fileStage','2','int'),(130,'name','Chapter 2: Learning Science at a Distanc.pdf','string'),(130,'originalFileName','Chapter 2: Learning Science at a Distanc.pdf','string'),(130,'sourceSubmissionFileId',NULL,'string'),(130,'submissionFileId','19','int'),(130,'submissionId','7','int'),(130,'username','dkennepohl','string'),(131,'fileId','19','int'),(131,'fileStage','2','int'),(131,'originalFileName','Chapter 3: Leadership Strategies for Coo.pdf','string'),(131,'sourceSubmissionFileId',NULL,'string'),(131,'submissionFileId','20','int'),(131,'submissionId','7','int'),(131,'username','dkennepohl','string'),(132,'fileId','19','int'),(132,'fileStage','2','int'),(132,'name','Chapter 3: Leadership Strategies for Coo.pdf','string'),(132,'submissionFileId','20','int'),(132,'submissionId','7','int'),(132,'username','dkennepohl','string'),(133,'fileId','19','int'),(133,'fileStage','2','int'),(133,'originalFileName','Chapter 3: Leadership Strategies for Coo.pdf','string'),(133,'sourceSubmissionFileId',NULL,'string'),(133,'submissionFileId','20','int'),(133,'submissionId','7','int'),(133,'username','dkennepohl','string'),(134,'fileId','19','int'),(134,'fileStage','2','int'),(134,'name','Chapter 3: Leadership Strategies for Coo.pdf','string'),(134,'originalFileName','Chapter 3: Leadership Strategies for Coo.pdf','string'),(134,'sourceSubmissionFileId',NULL,'string'),(134,'submissionFileId','20','int'),(134,'submissionId','7','int'),(134,'username','dkennepohl','string'),(135,'fileId','20','int'),(135,'fileStage','2','int'),(135,'originalFileName','Chapter 4: Toward New Models of Flexible.pdf','string'),(135,'sourceSubmissionFileId',NULL,'string'),(135,'submissionFileId','21','int'),(135,'submissionId','7','int'),(135,'username','dkennepohl','string'),(136,'fileId','20','int'),(136,'fileStage','2','int'),(136,'name','Chapter 4: Toward New Models of Flexible.pdf','string'),(136,'submissionFileId','21','int'),(136,'submissionId','7','int'),(136,'username','dkennepohl','string'),(137,'fileId','20','int'),(137,'fileStage','2','int'),(137,'originalFileName','Chapter 4: Toward New Models of Flexible.pdf','string'),(137,'sourceSubmissionFileId',NULL,'string'),(137,'submissionFileId','21','int'),(137,'submissionId','7','int'),(137,'username','dkennepohl','string'),(138,'fileId','20','int'),(138,'fileStage','2','int'),(138,'name','Chapter 4: Toward New Models of Flexible.pdf','string'),(138,'originalFileName','Chapter 4: Toward New Models of Flexible.pdf','string'),(138,'sourceSubmissionFileId',NULL,'string'),(138,'submissionFileId','21','int'),(138,'submissionId','7','int'),(138,'username','dkennepohl','string'),(141,'decision','Send to External Review','string'),(141,'editorName','Daniel Barnes','string'),(141,'submissionId','7','int'),(142,'reviewAssignmentId','8','string'),(142,'reviewerName','Adela Gallego','string'),(142,'round','1','int'),(142,'stageId','3','int'),(142,'submissionId','7','int'),(143,'decision','Accept Submission','string'),(143,'editorName','Daniel Barnes','string'),(143,'submissionId','7','int'),(144,'name','Maria Fritz','string'),(144,'userGroupName','Copyeditor','string'),(144,'username','mfritz','string'),(146,'fileId','21','int'),(146,'fileStage','2','int'),(146,'originalFileName','Editorial.pdf','string'),(146,'sourceSubmissionFileId',NULL,'string'),(146,'submissionFileId','22','int'),(146,'submissionId','8','int'),(146,'username','dbarnes','string'),(147,'fileId','21','int'),(147,'fileStage','2','int'),(147,'name','Editorial.pdf','string'),(147,'submissionFileId','22','int'),(147,'submissionId','8','int'),(147,'username','dbarnes','string'),(148,'fileId','21','int'),(148,'fileStage','2','int'),(148,'originalFileName','Editorial.pdf','string'),(148,'sourceSubmissionFileId',NULL,'string'),(148,'submissionFileId','22','int'),(148,'submissionId','8','int'),(148,'username','dbarnes','string'),(149,'fileId','21','int'),(149,'fileStage','2','int'),(149,'name','Editorial.pdf','string'),(149,'originalFileName','Editorial.pdf','string'),(149,'sourceSubmissionFileId',NULL,'string'),(149,'submissionFileId','22','int'),(149,'submissionId','8','int'),(149,'username','dbarnes','string'),(153,'fileId','22','int'),(153,'fileStage','2','int'),(153,'originalFileName','Internet, openness and the future of the.pdf','string'),(153,'sourceSubmissionFileId',NULL,'string'),(153,'submissionFileId','23','int'),(153,'submissionId','9','int'),(153,'username','fperini','string'),(154,'fileId','22','int'),(154,'fileStage','2','int'),(154,'name','Internet, openness and the future of the.pdf','string'),(154,'submissionFileId','23','int'),(154,'submissionId','9','int'),(154,'username','fperini','string'),(155,'fileId','22','int'),(155,'fileStage','2','int'),(155,'originalFileName','Internet, openness and the future of the.pdf','string'),(155,'sourceSubmissionFileId',NULL,'string'),(155,'submissionFileId','23','int'),(155,'submissionId','9','int'),(155,'username','fperini','string'),(156,'fileId','22','int'),(156,'fileStage','2','int'),(156,'name','Internet, openness and the future of the.pdf','string'),(156,'originalFileName','Internet, openness and the future of the.pdf','string'),(156,'sourceSubmissionFileId',NULL,'string'),(156,'submissionFileId','23','int'),(156,'submissionId','9','int'),(156,'username','fperini','string'),(157,'fileId','23','int'),(157,'fileStage','2','int'),(157,'originalFileName','Imagining the Internet: Open, closed or .pdf','string'),(157,'sourceSubmissionFileId',NULL,'string'),(157,'submissionFileId','24','int'),(157,'submissionId','9','int'),(157,'username','fperini','string'),(158,'fileId','23','int'),(158,'fileStage','2','int'),(158,'name','Imagining the Internet: Open, closed or .pdf','string'),(158,'submissionFileId','24','int'),(158,'submissionId','9','int'),(158,'username','fperini','string'),(159,'fileId','23','int'),(159,'fileStage','2','int'),(159,'originalFileName','Imagining the Internet: Open, closed or .pdf','string'),(159,'sourceSubmissionFileId',NULL,'string'),(159,'submissionFileId','24','int'),(159,'submissionId','9','int'),(159,'username','fperini','string'),(160,'fileId','23','int'),(160,'fileStage','2','int'),(160,'name','Imagining the Internet: Open, closed or .pdf','string'),(160,'originalFileName','Imagining the Internet: Open, closed or .pdf','string'),(160,'sourceSubmissionFileId',NULL,'string'),(160,'submissionFileId','24','int'),(160,'submissionId','9','int'),(160,'username','fperini','string'),(161,'fileId','24','int'),(161,'fileStage','2','int'),(161,'originalFileName','The internet in LAC will remain free, pu.pdf','string'),(161,'sourceSubmissionFileId',NULL,'string'),(161,'submissionFileId','25','int'),(161,'submissionId','9','int'),(161,'username','fperini','string'),(162,'fileId','24','int'),(162,'fileStage','2','int'),(162,'name','The internet in LAC will remain free, pu.pdf','string'),(162,'submissionFileId','25','int'),(162,'submissionId','9','int'),(162,'username','fperini','string'),(163,'fileId','24','int'),(163,'fileStage','2','int'),(163,'originalFileName','The internet in LAC will remain free, pu.pdf','string'),(163,'sourceSubmissionFileId',NULL,'string'),(163,'submissionFileId','25','int'),(163,'submissionId','9','int'),(163,'username','fperini','string'),(164,'fileId','24','int'),(164,'fileStage','2','int'),(164,'name','The internet in LAC will remain free, pu.pdf','string'),(164,'originalFileName','The internet in LAC will remain free, pu.pdf','string'),(164,'sourceSubmissionFileId',NULL,'string'),(164,'submissionFileId','25','int'),(164,'submissionId','9','int'),(164,'username','fperini','string'),(165,'fileId','25','int'),(165,'fileStage','2','int'),(165,'originalFileName','Free Internet?.pdf','string'),(165,'sourceSubmissionFileId',NULL,'string'),(165,'submissionFileId','26','int'),(165,'submissionId','9','int'),(165,'username','fperini','string'),(166,'fileId','25','int'),(166,'fileStage','2','int'),(166,'name','Free Internet?.pdf','string'),(166,'submissionFileId','26','int'),(166,'submissionId','9','int'),(166,'username','fperini','string'),(167,'fileId','25','int'),(167,'fileStage','2','int'),(167,'originalFileName','Free Internet?.pdf','string'),(167,'sourceSubmissionFileId',NULL,'string'),(167,'submissionFileId','26','int'),(167,'submissionId','9','int'),(167,'username','fperini','string'),(168,'fileId','25','int'),(168,'fileStage','2','int'),(168,'name','Free Internet?.pdf','string'),(168,'originalFileName','Free Internet?.pdf','string'),(168,'sourceSubmissionFileId',NULL,'string'),(168,'submissionFileId','26','int'),(168,'submissionId','9','int'),(168,'username','fperini','string'),(169,'fileId','26','int'),(169,'fileStage','2','int'),(169,'originalFileName','Risks and challenges for freedom of expr.pdf','string'),(169,'sourceSubmissionFileId',NULL,'string'),(169,'submissionFileId','27','int'),(169,'submissionId','9','int'),(169,'username','fperini','string'),(170,'fileId','26','int'),(170,'fileStage','2','int'),(170,'name','Risks and challenges for freedom of expr.pdf','string'),(170,'submissionFileId','27','int'),(170,'submissionId','9','int'),(170,'username','fperini','string'),(171,'fileId','26','int'),(171,'fileStage','2','int'),(171,'originalFileName','Risks and challenges for freedom of expr.pdf','string'),(171,'sourceSubmissionFileId',NULL,'string'),(171,'submissionFileId','27','int'),(171,'submissionId','9','int'),(171,'username','fperini','string'),(172,'fileId','26','int'),(172,'fileStage','2','int'),(172,'name','Risks and challenges for freedom of expr.pdf','string'),(172,'originalFileName','Risks and challenges for freedom of expr.pdf','string'),(172,'sourceSubmissionFileId',NULL,'string'),(172,'submissionFileId','27','int'),(172,'submissionId','9','int'),(172,'username','fperini','string'),(175,'decision','Send to Internal Review','string'),(175,'editorName','Daniel Barnes','string'),(175,'submissionId','9','int'),(177,'fileId','27','int'),(177,'fileStage','2','int'),(177,'originalFileName','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(177,'sourceSubmissionFileId',NULL,'string'),(177,'submissionFileId','28','int'),(177,'submissionId','10','int'),(177,'username','jbrower','string'),(178,'fileId','27','int'),(178,'fileStage','2','int'),(178,'name','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(178,'submissionFileId','28','int'),(178,'submissionId','10','int'),(178,'username','jbrower','string'),(179,'fileId','27','int'),(179,'fileStage','2','int'),(179,'originalFileName','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(179,'sourceSubmissionFileId',NULL,'string'),(179,'submissionFileId','28','int'),(179,'submissionId','10','int'),(179,'username','jbrower','string'),(180,'fileId','27','int'),(180,'fileStage','2','int'),(180,'name','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(180,'originalFileName','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(180,'sourceSubmissionFileId',NULL,'string'),(180,'submissionFileId','28','int'),(180,'submissionId','10','int'),(180,'username','jbrower','string'),(184,'fileId','28','int'),(184,'fileStage','2','int'),(184,'originalFileName','Dreamwork.pdf','string'),(184,'sourceSubmissionFileId',NULL,'string'),(184,'submissionFileId','29','int'),(184,'submissionId','11','int'),(184,'username','jlockehart','string'),(185,'fileId','28','int'),(185,'fileStage','2','int'),(185,'name','Dreamwork.pdf','string'),(185,'submissionFileId','29','int'),(185,'submissionId','11','int'),(185,'username','jlockehart','string'),(186,'fileId','28','int'),(186,'fileStage','2','int'),(186,'originalFileName','Dreamwork.pdf','string'),(186,'sourceSubmissionFileId',NULL,'string'),(186,'submissionFileId','29','int'),(186,'submissionId','11','int'),(186,'username','jlockehart','string'),(187,'fileId','28','int'),(187,'fileStage','2','int'),(187,'name','Dreamwork.pdf','string'),(187,'originalFileName','Dreamwork.pdf','string'),(187,'sourceSubmissionFileId',NULL,'string'),(187,'submissionFileId','29','int'),(187,'submissionId','11','int'),(187,'username','jlockehart','string'),(190,'decision','Send to Internal Review','string'),(190,'editorName','Daniel Barnes','string'),(190,'submissionId','11','int'),(191,'reviewAssignmentId','9','string'),(191,'reviewerName','Aisla McCrae','string'),(191,'round','1','int'),(191,'stageId','2','int'),(191,'submissionId','11','int'),(192,'decision','Send to External Review','string'),(192,'editorName','Daniel Barnes','string'),(192,'submissionId','11','int'),(193,'reviewAssignmentId','10','string'),(193,'reviewerName','Adela Gallego','string'),(193,'round','1','int'),(193,'stageId','3','int'),(193,'submissionId','11','int'),(194,'reviewAssignmentId','11','string'),(194,'reviewerName','Gonzalo Favio','string'),(194,'round','1','int'),(194,'stageId','3','int'),(194,'submissionId','11','int'),(195,'reviewAssignmentId','10','int'),(195,'reviewerName','Adela Gallego','string'),(195,'round','1','int'),(195,'submissionId','11','int'),(196,'reviewAssignmentId','10','int'),(196,'reviewerName','Adela Gallego','string'),(196,'round','1','int'),(196,'submissionId','11','int'),(197,'reviewAssignmentId','11','int'),(197,'reviewerName','Gonzalo Favio','string'),(197,'round','1','int'),(197,'submissionId','11','int'),(198,'reviewAssignmentId','11','int'),(198,'reviewerName','Gonzalo Favio','string'),(198,'round','1','int'),(198,'submissionId','11','int'),(199,'decision','Accept Submission','string'),(199,'editorName','Daniel Barnes','string'),(199,'submissionId','11','int'),(201,'fileId','29','int'),(201,'fileStage','2','int'),(201,'originalFileName','Catalyzing Access through Social and Tec.pdf','string'),(201,'sourceSubmissionFileId',NULL,'string'),(201,'submissionFileId','30','int'),(201,'submissionId','12','int'),(201,'username','lelder','string'),(202,'fileId','29','int'),(202,'fileStage','2','int'),(202,'name','Catalyzing Access through Social and Tec.pdf','string'),(202,'submissionFileId','30','int'),(202,'submissionId','12','int'),(202,'username','lelder','string'),(203,'fileId','29','int'),(203,'fileStage','2','int'),(203,'originalFileName','Catalyzing Access through Social and Tec.pdf','string'),(203,'sourceSubmissionFileId',NULL,'string'),(203,'submissionFileId','30','int'),(203,'submissionId','12','int'),(203,'username','lelder','string'),(204,'fileId','29','int'),(204,'fileStage','2','int'),(204,'name','Catalyzing Access through Social and Tec.pdf','string'),(204,'originalFileName','Catalyzing Access through Social and Tec.pdf','string'),(204,'sourceSubmissionFileId',NULL,'string'),(204,'submissionFileId','30','int'),(204,'submissionId','12','int'),(204,'username','lelder','string'),(205,'fileId','30','int'),(205,'fileStage','2','int'),(205,'originalFileName','Catalyzing Access via Telecommunications.pdf','string'),(205,'sourceSubmissionFileId',NULL,'string'),(205,'submissionFileId','31','int'),(205,'submissionId','12','int'),(205,'username','lelder','string'),(206,'fileId','30','int'),(206,'fileStage','2','int'),(206,'name','Catalyzing Access via Telecommunications.pdf','string'),(206,'submissionFileId','31','int'),(206,'submissionId','12','int'),(206,'username','lelder','string'),(207,'fileId','30','int'),(207,'fileStage','2','int'),(207,'originalFileName','Catalyzing Access via Telecommunications.pdf','string'),(207,'sourceSubmissionFileId',NULL,'string'),(207,'submissionFileId','31','int'),(207,'submissionId','12','int'),(207,'username','lelder','string'),(208,'fileId','30','int'),(208,'fileStage','2','int'),(208,'name','Catalyzing Access via Telecommunications.pdf','string'),(208,'originalFileName','Catalyzing Access via Telecommunications.pdf','string'),(208,'sourceSubmissionFileId',NULL,'string'),(208,'submissionFileId','31','int'),(208,'submissionId','12','int'),(208,'username','lelder','string'),(209,'fileId','31','int'),(209,'fileStage','2','int'),(209,'originalFileName','Access to Knowledge as a New Paradigm fo.pdf','string'),(209,'sourceSubmissionFileId',NULL,'string'),(209,'submissionFileId','32','int'),(209,'submissionId','12','int'),(209,'username','lelder','string'),(210,'fileId','31','int'),(210,'fileStage','2','int'),(210,'name','Access to Knowledge as a New Paradigm fo.pdf','string'),(210,'submissionFileId','32','int'),(210,'submissionId','12','int'),(210,'username','lelder','string'),(211,'fileId','31','int'),(211,'fileStage','2','int'),(211,'originalFileName','Access to Knowledge as a New Paradigm fo.pdf','string'),(211,'sourceSubmissionFileId',NULL,'string'),(211,'submissionFileId','32','int'),(211,'submissionId','12','int'),(211,'username','lelder','string'),(212,'fileId','31','int'),(212,'fileStage','2','int'),(212,'name','Access to Knowledge as a New Paradigm fo.pdf','string'),(212,'originalFileName','Access to Knowledge as a New Paradigm fo.pdf','string'),(212,'sourceSubmissionFileId',NULL,'string'),(212,'submissionFileId','32','int'),(212,'submissionId','12','int'),(212,'username','lelder','string'),(215,'decision','Send to Internal Review','string'),(215,'editorName','Daniel Barnes','string'),(215,'submissionId','12','int'),(216,'reviewAssignmentId','12','string'),(216,'reviewerName','Julie Janssen','string'),(216,'round','1','int'),(216,'stageId','2','int'),(216,'submissionId','12','int'),(217,'reviewAssignmentId','13','string'),(217,'reviewerName','Paul Hudson','string'),(217,'round','1','int'),(217,'stageId','2','int'),(217,'submissionId','12','int'),(218,'reviewAssignmentId','14','string'),(218,'reviewerName','Aisla McCrae','string'),(218,'round','1','int'),(218,'stageId','2','int'),(218,'submissionId','12','int'),(219,'reviewAssignmentId','13','int'),(219,'reviewerName','Paul Hudson','string'),(219,'round','1','int'),(219,'submissionId','12','int'),(220,'reviewAssignmentId','13','int'),(220,'reviewerName','Paul Hudson','string'),(220,'round','1','int'),(220,'submissionId','12','int'),(222,'fileId','32','int'),(222,'fileStage','2','int'),(222,'originalFileName','Current State of Mobile Learning.pdf','string'),(222,'sourceSubmissionFileId',NULL,'string'),(222,'submissionFileId','33','int'),(222,'submissionId','13','int'),(222,'username','mally','string'),(223,'fileId','32','int'),(223,'fileStage','2','int'),(223,'name','Current State of Mobile Learning.pdf','string'),(223,'submissionFileId','33','int'),(223,'submissionId','13','int'),(223,'username','mally','string'),(224,'fileId','32','int'),(224,'fileStage','2','int'),(224,'originalFileName','Current State of Mobile Learning.pdf','string'),(224,'sourceSubmissionFileId',NULL,'string'),(224,'submissionFileId','33','int'),(224,'submissionId','13','int'),(224,'username','mally','string'),(225,'fileId','32','int'),(225,'fileStage','2','int'),(225,'name','Current State of Mobile Learning.pdf','string'),(225,'originalFileName','Current State of Mobile Learning.pdf','string'),(225,'sourceSubmissionFileId',NULL,'string'),(225,'submissionFileId','33','int'),(225,'submissionId','13','int'),(225,'username','mally','string'),(226,'fileId','33','int'),(226,'fileStage','2','int'),(226,'originalFileName','A Model for Framing Mobile Learning.pdf','string'),(226,'sourceSubmissionFileId',NULL,'string'),(226,'submissionFileId','34','int'),(226,'submissionId','13','int'),(226,'username','mally','string'),(227,'fileId','33','int'),(227,'fileStage','2','int'),(227,'name','A Model for Framing Mobile Learning.pdf','string'),(227,'submissionFileId','34','int'),(227,'submissionId','13','int'),(227,'username','mally','string'),(228,'fileId','33','int'),(228,'fileStage','2','int'),(228,'originalFileName','A Model for Framing Mobile Learning.pdf','string'),(228,'sourceSubmissionFileId',NULL,'string'),(228,'submissionFileId','34','int'),(228,'submissionId','13','int'),(228,'username','mally','string'),(229,'fileId','33','int'),(229,'fileStage','2','int'),(229,'name','A Model for Framing Mobile Learning.pdf','string'),(229,'originalFileName','A Model for Framing Mobile Learning.pdf','string'),(229,'sourceSubmissionFileId',NULL,'string'),(229,'submissionFileId','34','int'),(229,'submissionId','13','int'),(229,'username','mally','string'),(230,'fileId','34','int'),(230,'fileStage','2','int'),(230,'originalFileName','Mobile Distance Learning with PDAs: Deve.pdf','string'),(230,'sourceSubmissionFileId',NULL,'string'),(230,'submissionFileId','35','int'),(230,'submissionId','13','int'),(230,'username','mally','string'),(231,'fileId','34','int'),(231,'fileStage','2','int'),(231,'name','Mobile Distance Learning with PDAs: Deve.pdf','string'),(231,'submissionFileId','35','int'),(231,'submissionId','13','int'),(231,'username','mally','string'),(232,'fileId','34','int'),(232,'fileStage','2','int'),(232,'originalFileName','Mobile Distance Learning with PDAs: Deve.pdf','string'),(232,'sourceSubmissionFileId',NULL,'string'),(232,'submissionFileId','35','int'),(232,'submissionId','13','int'),(232,'username','mally','string'),(233,'fileId','34','int'),(233,'fileStage','2','int'),(233,'name','Mobile Distance Learning with PDAs: Deve.pdf','string'),(233,'originalFileName','Mobile Distance Learning with PDAs: Deve.pdf','string'),(233,'sourceSubmissionFileId',NULL,'string'),(233,'submissionFileId','35','int'),(233,'submissionId','13','int'),(233,'username','mally','string'),(236,'decision','Send to Internal Review','string'),(236,'editorName','Daniel Barnes','string'),(236,'submissionId','13','int'),(237,'reviewAssignmentId','15','string'),(237,'reviewerName','Paul Hudson','string'),(237,'round','1','int'),(237,'stageId','2','int'),(237,'submissionId','13','int'),(238,'decision','Send to External Review','string'),(238,'editorName','Daniel Barnes','string'),(238,'submissionId','13','int'),(239,'reviewAssignmentId','16','string'),(239,'reviewerName','Adela Gallego','string'),(239,'round','1','int'),(239,'stageId','3','int'),(239,'submissionId','13','int'),(240,'reviewAssignmentId','17','string'),(240,'reviewerName','Al Zacharia','string'),(240,'round','1','int'),(240,'stageId','3','int'),(240,'submissionId','13','int'),(241,'reviewAssignmentId','18','string'),(241,'reviewerName','Gonzalo Favio','string'),(241,'round','1','int'),(241,'stageId','3','int'),(241,'submissionId','13','int'),(242,'reviewAssignmentId','16','int'),(242,'reviewerName','Adela Gallego','string'),(242,'round','1','int'),(242,'submissionId','13','int'),(243,'reviewAssignmentId','16','int'),(243,'reviewerName','Adela Gallego','string'),(243,'round','1','int'),(243,'submissionId','13','int'),(244,'reviewAssignmentId','18','int'),(244,'reviewerName','Gonzalo Favio','string'),(244,'round','1','int'),(244,'submissionId','13','int'),(245,'reviewAssignmentId','18','int'),(245,'reviewerName','Gonzalo Favio','string'),(245,'round','1','int'),(245,'submissionId','13','int'),(246,'decision','Accept Submission','string'),(246,'editorName','Daniel Barnes','string'),(246,'submissionId','13','int'),(248,'fileId','35','int'),(248,'fileStage','2','int'),(248,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(248,'sourceSubmissionFileId',NULL,'string'),(248,'submissionFileId','36','int'),(248,'submissionId','14','int'),(248,'username','mdawson','string'),(249,'fileId','35','int'),(249,'fileStage','2','int'),(249,'name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(249,'submissionFileId','36','int'),(249,'submissionId','14','int'),(249,'username','mdawson','string'),(250,'fileId','35','int'),(250,'fileStage','2','int'),(250,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(250,'sourceSubmissionFileId',NULL,'string'),(250,'submissionFileId','36','int'),(250,'submissionId','14','int'),(250,'username','mdawson','string'),(251,'fileId','35','int'),(251,'fileStage','2','int'),(251,'name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(251,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(251,'sourceSubmissionFileId',NULL,'string'),(251,'submissionFileId','36','int'),(251,'submissionId','14','int'),(251,'username','mdawson','string'),(252,'fileId','36','int'),(252,'fileStage','2','int'),(252,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(252,'sourceSubmissionFileId',NULL,'string'),(252,'submissionFileId','37','int'),(252,'submissionId','14','int'),(252,'username','mdawson','string'),(253,'fileId','36','int'),(253,'fileStage','2','int'),(253,'name','Chapter 2: Classical Music and the Class.pdf','string'),(253,'submissionFileId','37','int'),(253,'submissionId','14','int'),(253,'username','mdawson','string'),(254,'fileId','36','int'),(254,'fileStage','2','int'),(254,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(254,'sourceSubmissionFileId',NULL,'string'),(254,'submissionFileId','37','int'),(254,'submissionId','14','int'),(254,'username','mdawson','string'),(255,'fileId','36','int'),(255,'fileStage','2','int'),(255,'name','Chapter 2: Classical Music and the Class.pdf','string'),(255,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(255,'sourceSubmissionFileId',NULL,'string'),(255,'submissionFileId','37','int'),(255,'submissionId','14','int'),(255,'username','mdawson','string'),(256,'fileId','37','int'),(256,'fileStage','2','int'),(256,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(256,'sourceSubmissionFileId',NULL,'string'),(256,'submissionFileId','38','int'),(256,'submissionId','14','int'),(256,'username','mdawson','string'),(257,'fileId','37','int'),(257,'fileStage','2','int'),(257,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(257,'submissionFileId','38','int'),(257,'submissionId','14','int'),(257,'username','mdawson','string'),(258,'fileId','37','int'),(258,'fileStage','2','int'),(258,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(258,'sourceSubmissionFileId',NULL,'string'),(258,'submissionFileId','38','int'),(258,'submissionId','14','int'),(258,'username','mdawson','string'),(259,'fileId','37','int'),(259,'fileStage','2','int'),(259,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(259,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(259,'sourceSubmissionFileId',NULL,'string'),(259,'submissionFileId','38','int'),(259,'submissionId','14','int'),(259,'username','mdawson','string'),(260,'fileId','38','int'),(260,'fileStage','2','int'),(260,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(260,'sourceSubmissionFileId',NULL,'string'),(260,'submissionFileId','39','int'),(260,'submissionId','14','int'),(260,'username','mdawson','string'),(261,'fileId','38','int'),(261,'fileStage','2','int'),(261,'name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(261,'submissionFileId','39','int'),(261,'submissionId','14','int'),(261,'username','mdawson','string'),(262,'fileId','38','int'),(262,'fileStage','2','int'),(262,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(262,'sourceSubmissionFileId',NULL,'string'),(262,'submissionFileId','39','int'),(262,'submissionId','14','int'),(262,'username','mdawson','string'),(263,'fileId','38','int'),(263,'fileStage','2','int'),(263,'name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(263,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(263,'sourceSubmissionFileId',NULL,'string'),(263,'submissionFileId','39','int'),(263,'submissionId','14','int'),(263,'username','mdawson','string'),(264,'fileId','39','int'),(264,'fileStage','2','int'),(264,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(264,'sourceSubmissionFileId',NULL,'string'),(264,'submissionFileId','40','int'),(264,'submissionId','14','int'),(264,'username','mdawson','string'),(265,'fileId','39','int'),(265,'fileStage','2','int'),(265,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(265,'submissionFileId','40','int'),(265,'submissionId','14','int'),(265,'username','mdawson','string'),(266,'fileId','39','int'),(266,'fileStage','2','int'),(266,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(266,'sourceSubmissionFileId',NULL,'string'),(266,'submissionFileId','40','int'),(266,'submissionId','14','int'),(266,'username','mdawson','string'),(267,'fileId','39','int'),(267,'fileStage','2','int'),(267,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(267,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(267,'sourceSubmissionFileId',NULL,'string'),(267,'submissionFileId','40','int'),(267,'submissionId','14','int'),(267,'username','mdawson','string'),(268,'fileId','40','int'),(268,'fileStage','2','int'),(268,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(268,'sourceSubmissionFileId',NULL,'string'),(268,'submissionFileId','41','int'),(268,'submissionId','14','int'),(268,'username','mdawson','string'),(269,'fileId','40','int'),(269,'fileStage','2','int'),(269,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(269,'submissionFileId','41','int'),(269,'submissionId','14','int'),(269,'username','mdawson','string'),(270,'fileId','40','int'),(270,'fileStage','2','int'),(270,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(270,'sourceSubmissionFileId',NULL,'string'),(270,'submissionFileId','41','int'),(270,'submissionId','14','int'),(270,'username','mdawson','string'),(271,'fileId','40','int'),(271,'fileStage','2','int'),(271,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(271,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(271,'sourceSubmissionFileId',NULL,'string'),(271,'submissionFileId','41','int'),(271,'submissionId','14','int'),(271,'username','mdawson','string'),(274,'decision','Send to Internal Review','string'),(274,'editorName','Daniel Barnes','string'),(274,'submissionId','14','int'),(275,'reviewAssignmentId','19','string'),(275,'reviewerName','Julie Janssen','string'),(275,'round','1','int'),(275,'stageId','2','int'),(275,'submissionId','14','int'),(276,'decision','Send to External Review','string'),(276,'editorName','Daniel Barnes','string'),(276,'submissionId','14','int'),(277,'reviewAssignmentId','20','string'),(277,'reviewerName','Al Zacharia','string'),(277,'round','1','int'),(277,'stageId','3','int'),(277,'submissionId','14','int'),(278,'decision','Accept Submission','string'),(278,'editorName','Daniel Barnes','string'),(278,'submissionId','14','int'),(279,'name','Maria Fritz','string'),(279,'userGroupName','Copyeditor','string'),(279,'username','mfritz','string'),(280,'decision','Send To Production','string'),(280,'editorName','Daniel Barnes','string'),(280,'submissionId','14','int'),(281,'name','Graham Cox','string'),(281,'userGroupName','Layout Editor','string'),(281,'username','gcox','string'),(282,'name','Sabine Kumar','string'),(282,'userGroupName','Proofreader','string'),(282,'username','skumar','string'),(283,'formatName','PDF','string'),(284,'fileId','40','int'),(284,'fileStage','10','int'),(284,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(284,'sourceSubmissionFileId','41','int'),(284,'submissionFileId','42','int'),(284,'submissionId','14','int'),(284,'username','dbarnes','string'),(285,'fileId','40','int'),(285,'fileStage','10','int'),(285,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(285,'submissionFileId','42','int'),(285,'submissionId','14','int'),(285,'username','dbarnes','string'),(286,'fileId','38','int'),(286,'fileStage','10','int'),(286,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(286,'sourceSubmissionFileId','39','int'),(286,'submissionFileId','43','int'),(286,'submissionId','14','int'),(286,'username','dbarnes','string'),(287,'fileId','38','int'),(287,'fileStage','10','int'),(287,'name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(287,'submissionFileId','43','int'),(287,'submissionId','14','int'),(287,'username','dbarnes','string'),(288,'fileId','39','int'),(288,'fileStage','10','int'),(288,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(288,'sourceSubmissionFileId','40','int'),(288,'submissionFileId','44','int'),(288,'submissionId','14','int'),(288,'username','dbarnes','string'),(289,'fileId','39','int'),(289,'fileStage','10','int'),(289,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(289,'submissionFileId','44','int'),(289,'submissionId','14','int'),(289,'username','dbarnes','string'),(290,'fileId','36','int'),(290,'fileStage','10','int'),(290,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(290,'sourceSubmissionFileId','37','int'),(290,'submissionFileId','45','int'),(290,'submissionId','14','int'),(290,'username','dbarnes','string'),(291,'fileId','36','int'),(291,'fileStage','10','int'),(291,'name','Chapter 2: Classical Music and the Class.pdf','string'),(291,'submissionFileId','45','int'),(291,'submissionId','14','int'),(291,'username','dbarnes','string'),(292,'fileId','37','int'),(292,'fileStage','10','int'),(292,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(292,'sourceSubmissionFileId','38','int'),(292,'submissionFileId','46','int'),(292,'submissionId','14','int'),(292,'username','dbarnes','string'),(293,'fileId','37','int'),(293,'fileStage','10','int'),(293,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(293,'submissionFileId','46','int'),(293,'submissionId','14','int'),(293,'username','dbarnes','string'),(294,'fileId','35','int'),(294,'fileStage','10','int'),(294,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(294,'sourceSubmissionFileId','36','int'),(294,'submissionFileId','47','int'),(294,'submissionId','14','int'),(294,'username','dbarnes','string'),(295,'fileId','35','int'),(295,'fileStage','10','int'),(295,'name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(295,'submissionFileId','47','int'),(295,'submissionId','14','int'),(295,'username','dbarnes','string'),(296,'publicationFormatName','PDF','string'),(297,'publicationFormatName','PDF','string'),(298,'fileId','35','int'),(298,'fileStage','10','int'),(298,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(298,'sourceSubmissionFileId','36','int'),(298,'submissionFileId','47','int'),(298,'submissionId','14','int'),(298,'username','dbarnes','string'),(299,'fileId','35','int'),(299,'fileStage','10','int'),(299,'name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(299,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(299,'sourceSubmissionFileId','36','int'),(299,'submissionFileId','47','int'),(299,'submissionId','14','int'),(299,'username','dbarnes','string'),(300,'file','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(300,'name','Daniel Barnes','string'),(300,'username','dbarnes','string'),(301,'fileId','35','int'),(301,'fileStage','10','int'),(301,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(301,'sourceSubmissionFileId','36','int'),(301,'submissionFileId','47','int'),(301,'submissionId','14','int'),(301,'username','dbarnes','string'),(302,'fileId','35','int'),(302,'fileStage','10','int'),(302,'name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(302,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(302,'sourceSubmissionFileId','36','int'),(302,'submissionFileId','47','int'),(302,'submissionId','14','int'),(302,'username','dbarnes','string'),(303,'fileId','36','int'),(303,'fileStage','10','int'),(303,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(303,'sourceSubmissionFileId','37','int'),(303,'submissionFileId','45','int'),(303,'submissionId','14','int'),(303,'username','dbarnes','string'),(304,'fileId','36','int'),(304,'fileStage','10','int'),(304,'name','Chapter 2: Classical Music and the Class.pdf','string'),(304,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(304,'sourceSubmissionFileId','37','int'),(304,'submissionFileId','45','int'),(304,'submissionId','14','int'),(304,'username','dbarnes','string'),(305,'file','Chapter 2: Classical Music and the Class.pdf','string'),(305,'name','Daniel Barnes','string'),(305,'username','dbarnes','string'),(306,'fileId','36','int'),(306,'fileStage','10','int'),(306,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(306,'sourceSubmissionFileId','37','int'),(306,'submissionFileId','45','int'),(306,'submissionId','14','int'),(306,'username','dbarnes','string'),(307,'fileId','36','int'),(307,'fileStage','10','int'),(307,'name','Chapter 2: Classical Music and the Class.pdf','string'),(307,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(307,'sourceSubmissionFileId','37','int'),(307,'submissionFileId','45','int'),(307,'submissionId','14','int'),(307,'username','dbarnes','string'),(308,'fileId','37','int'),(308,'fileStage','10','int'),(308,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(308,'sourceSubmissionFileId','38','int'),(308,'submissionFileId','46','int'),(308,'submissionId','14','int'),(308,'username','dbarnes','string'),(309,'fileId','37','int'),(309,'fileStage','10','int'),(309,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(309,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(309,'sourceSubmissionFileId','38','int'),(309,'submissionFileId','46','int'),(309,'submissionId','14','int'),(309,'username','dbarnes','string'),(310,'file','Chapter 3: Situated Cognition and Bricol.pdf','string'),(310,'name','Daniel Barnes','string'),(310,'username','dbarnes','string'),(311,'fileId','37','int'),(311,'fileStage','10','int'),(311,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(311,'sourceSubmissionFileId','38','int'),(311,'submissionFileId','46','int'),(311,'submissionId','14','int'),(311,'username','dbarnes','string'),(312,'fileId','37','int'),(312,'fileStage','10','int'),(312,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(312,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(312,'sourceSubmissionFileId','38','int'),(312,'submissionFileId','46','int'),(312,'submissionId','14','int'),(312,'username','dbarnes','string'),(313,'fileId','38','int'),(313,'fileStage','10','int'),(313,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(313,'sourceSubmissionFileId','39','int'),(313,'submissionFileId','43','int'),(313,'submissionId','14','int'),(313,'username','dbarnes','string'),(314,'fileId','38','int'),(314,'fileStage','10','int'),(314,'name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(314,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(314,'sourceSubmissionFileId','39','int'),(314,'submissionFileId','43','int'),(314,'submissionId','14','int'),(314,'username','dbarnes','string'),(315,'file','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(315,'name','Daniel Barnes','string'),(315,'username','dbarnes','string'),(316,'fileId','38','int'),(316,'fileStage','10','int'),(316,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(316,'sourceSubmissionFileId','39','int'),(316,'submissionFileId','43','int'),(316,'submissionId','14','int'),(316,'username','dbarnes','string'),(317,'fileId','38','int'),(317,'fileStage','10','int'),(317,'name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(317,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(317,'sourceSubmissionFileId','39','int'),(317,'submissionFileId','43','int'),(317,'submissionId','14','int'),(317,'username','dbarnes','string'),(318,'fileId','39','int'),(318,'fileStage','10','int'),(318,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(318,'sourceSubmissionFileId','40','int'),(318,'submissionFileId','44','int'),(318,'submissionId','14','int'),(318,'username','dbarnes','string'),(319,'fileId','39','int'),(319,'fileStage','10','int'),(319,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(319,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(319,'sourceSubmissionFileId','40','int'),(319,'submissionFileId','44','int'),(319,'submissionId','14','int'),(319,'username','dbarnes','string'),(320,'file','Segmentation of Vascular Ultrasound Imag.pdf','string'),(320,'name','Daniel Barnes','string'),(320,'username','dbarnes','string'),(321,'fileId','39','int'),(321,'fileStage','10','int'),(321,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(321,'sourceSubmissionFileId','40','int'),(321,'submissionFileId','44','int'),(321,'submissionId','14','int'),(321,'username','dbarnes','string'),(322,'fileId','39','int'),(322,'fileStage','10','int'),(322,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(322,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(322,'sourceSubmissionFileId','40','int'),(322,'submissionFileId','44','int'),(322,'submissionId','14','int'),(322,'username','dbarnes','string'),(323,'fileId','40','int'),(323,'fileStage','10','int'),(323,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(323,'sourceSubmissionFileId','41','int'),(323,'submissionFileId','42','int'),(323,'submissionId','14','int'),(323,'username','dbarnes','string'),(324,'fileId','40','int'),(324,'fileStage','10','int'),(324,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(324,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(324,'sourceSubmissionFileId','41','int'),(324,'submissionFileId','42','int'),(324,'submissionId','14','int'),(324,'username','dbarnes','string'),(325,'file','The Canadian Nutrient File: Nutrient Val.pdf','string'),(325,'name','Daniel Barnes','string'),(325,'username','dbarnes','string'),(326,'fileId','40','int'),(326,'fileStage','10','int'),(326,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(326,'sourceSubmissionFileId','41','int'),(326,'submissionFileId','42','int'),(326,'submissionId','14','int'),(326,'username','dbarnes','string'),(327,'fileId','40','int'),(327,'fileStage','10','int'),(327,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(327,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(327,'sourceSubmissionFileId','41','int'),(327,'submissionFileId','42','int'),(327,'submissionId','14','int'),(327,'username','dbarnes','string'),(330,'fileId','41','int'),(330,'fileStage','2','int'),(330,'originalFileName','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(330,'sourceSubmissionFileId',NULL,'string'),(330,'submissionFileId','48','int'),(330,'submissionId','15','int'),(330,'username','mforan','string'),(331,'fileId','41','int'),(331,'fileStage','2','int'),(331,'name','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(331,'submissionFileId','48','int'),(331,'submissionId','15','int'),(331,'username','mforan','string'),(332,'fileId','41','int'),(332,'fileStage','2','int'),(332,'originalFileName','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(332,'sourceSubmissionFileId',NULL,'string'),(332,'submissionFileId','48','int'),(332,'submissionId','15','int'),(332,'username','mforan','string'),(333,'fileId','41','int'),(333,'fileStage','2','int'),(333,'name','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(333,'originalFileName','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(333,'sourceSubmissionFileId',NULL,'string'),(333,'submissionFileId','48','int'),(333,'submissionId','15','int'),(333,'username','mforan','string'),(336,'decision','Send to External Review','string'),(336,'editorName','Daniel Barnes','string'),(336,'submissionId','15','int'),(338,'fileId','42','int'),(338,'fileStage','2','int'),(338,'originalFileName','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(338,'sourceSubmissionFileId',NULL,'string'),(338,'submissionFileId','49','int'),(338,'submissionId','16','int'),(338,'username','mpower','string'),(339,'fileId','42','int'),(339,'fileStage','2','int'),(339,'name','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(339,'submissionFileId','49','int'),(339,'submissionId','16','int'),(339,'username','mpower','string'),(340,'fileId','42','int'),(340,'fileStage','2','int'),(340,'originalFileName','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(340,'sourceSubmissionFileId',NULL,'string'),(340,'submissionFileId','49','int'),(340,'submissionId','16','int'),(340,'username','mpower','string'),(341,'fileId','42','int'),(341,'fileStage','2','int'),(341,'name','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(341,'originalFileName','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(341,'sourceSubmissionFileId',NULL,'string'),(341,'submissionFileId','49','int'),(341,'submissionId','16','int'),(341,'username','mpower','string'),(344,'decision','Send to External Review','string'),(344,'editorName','Daniel Barnes','string'),(344,'submissionId','16','int'),(345,'reviewAssignmentId','21','string'),(345,'reviewerName','Adela Gallego','string'),(345,'round','1','int'),(345,'stageId','3','int'),(345,'submissionId','16','int'),(346,'reviewAssignmentId','22','string'),(346,'reviewerName','Al Zacharia','string'),(346,'round','1','int'),(346,'stageId','3','int'),(346,'submissionId','16','int'),(347,'reviewAssignmentId','23','string'),(347,'reviewerName','Gonzalo Favio','string'),(347,'round','1','int'),(347,'stageId','3','int'),(347,'submissionId','16','int'),(348,'reviewAssignmentId','21','int'),(348,'reviewerName','Adela Gallego','string'),(348,'round','1','int'),(348,'submissionId','16','int'),(349,'reviewAssignmentId','21','int'),(349,'reviewerName','Adela Gallego','string'),(349,'round','1','int'),(349,'submissionId','16','int'),(351,'fileId','43','int'),(351,'fileStage','2','int'),(351,'originalFileName','Preface.pdf','string'),(351,'sourceSubmissionFileId',NULL,'string'),(351,'submissionFileId','50','int'),(351,'submissionId','17','int'),(351,'username','msmith','string'),(352,'fileId','43','int'),(352,'fileStage','2','int'),(352,'name','Preface.pdf','string'),(352,'submissionFileId','50','int'),(352,'submissionId','17','int'),(352,'username','msmith','string'),(353,'fileId','43','int'),(353,'fileStage','2','int'),(353,'originalFileName','Preface.pdf','string'),(353,'sourceSubmissionFileId',NULL,'string'),(353,'submissionFileId','50','int'),(353,'submissionId','17','int'),(353,'username','msmith','string'),(354,'fileId','43','int'),(354,'fileStage','2','int'),(354,'name','Preface.pdf','string'),(354,'originalFileName','Preface.pdf','string'),(354,'sourceSubmissionFileId',NULL,'string'),(354,'submissionFileId','50','int'),(354,'submissionId','17','int'),(354,'username','msmith','string'),(355,'fileId','44','int'),(355,'fileStage','2','int'),(355,'originalFileName','Introduction.pdf','string'),(355,'sourceSubmissionFileId',NULL,'string'),(355,'submissionFileId','51','int'),(355,'submissionId','17','int'),(355,'username','msmith','string'),(356,'fileId','44','int'),(356,'fileStage','2','int'),(356,'name','Introduction.pdf','string'),(356,'submissionFileId','51','int'),(356,'submissionId','17','int'),(356,'username','msmith','string'),(357,'fileId','44','int'),(357,'fileStage','2','int'),(357,'originalFileName','Introduction.pdf','string'),(357,'sourceSubmissionFileId',NULL,'string'),(357,'submissionFileId','51','int'),(357,'submissionId','17','int'),(357,'username','msmith','string'),(358,'fileId','44','int'),(358,'fileStage','2','int'),(358,'name','Introduction.pdf','string'),(358,'originalFileName','Introduction.pdf','string'),(358,'sourceSubmissionFileId',NULL,'string'),(358,'submissionFileId','51','int'),(358,'submissionId','17','int'),(358,'username','msmith','string'),(359,'fileId','45','int'),(359,'fileStage','2','int'),(359,'originalFileName','The Emergence of Open Development in a N.pdf','string'),(359,'sourceSubmissionFileId',NULL,'string'),(359,'submissionFileId','52','int'),(359,'submissionId','17','int'),(359,'username','msmith','string'),(360,'fileId','45','int'),(360,'fileStage','2','int'),(360,'name','The Emergence of Open Development in a N.pdf','string'),(360,'submissionFileId','52','int'),(360,'submissionId','17','int'),(360,'username','msmith','string'),(361,'fileId','45','int'),(361,'fileStage','2','int'),(361,'originalFileName','The Emergence of Open Development in a N.pdf','string'),(361,'sourceSubmissionFileId',NULL,'string'),(361,'submissionFileId','52','int'),(361,'submissionId','17','int'),(361,'username','msmith','string'),(362,'fileId','45','int'),(362,'fileStage','2','int'),(362,'name','The Emergence of Open Development in a N.pdf','string'),(362,'originalFileName','The Emergence of Open Development in a N.pdf','string'),(362,'sourceSubmissionFileId',NULL,'string'),(362,'submissionFileId','52','int'),(362,'submissionId','17','int'),(362,'username','msmith','string'),(363,'fileId','46','int'),(363,'fileStage','2','int'),(363,'originalFileName','Enacting Openness in ICT4D Research.pdf','string'),(363,'sourceSubmissionFileId',NULL,'string'),(363,'submissionFileId','53','int'),(363,'submissionId','17','int'),(363,'username','msmith','string'),(364,'fileId','46','int'),(364,'fileStage','2','int'),(364,'name','Enacting Openness in ICT4D Research.pdf','string'),(364,'submissionFileId','53','int'),(364,'submissionId','17','int'),(364,'username','msmith','string'),(365,'fileId','46','int'),(365,'fileStage','2','int'),(365,'originalFileName','Enacting Openness in ICT4D Research.pdf','string'),(365,'sourceSubmissionFileId',NULL,'string'),(365,'submissionFileId','53','int'),(365,'submissionId','17','int'),(365,'username','msmith','string'),(366,'fileId','46','int'),(366,'fileStage','2','int'),(366,'name','Enacting Openness in ICT4D Research.pdf','string'),(366,'originalFileName','Enacting Openness in ICT4D Research.pdf','string'),(366,'sourceSubmissionFileId',NULL,'string'),(366,'submissionFileId','53','int'),(366,'submissionId','17','int'),(366,'username','msmith','string'),(367,'fileId','47','int'),(367,'fileStage','2','int'),(367,'originalFileName','Transparency and Development: Ethical Co.pdf','string'),(367,'sourceSubmissionFileId',NULL,'string'),(367,'submissionFileId','54','int'),(367,'submissionId','17','int'),(367,'username','msmith','string'),(368,'fileId','47','int'),(368,'fileStage','2','int'),(368,'name','Transparency and Development: Ethical Co.pdf','string'),(368,'submissionFileId','54','int'),(368,'submissionId','17','int'),(368,'username','msmith','string'),(369,'fileId','47','int'),(369,'fileStage','2','int'),(369,'originalFileName','Transparency and Development: Ethical Co.pdf','string'),(369,'sourceSubmissionFileId',NULL,'string'),(369,'submissionFileId','54','int'),(369,'submissionId','17','int'),(369,'username','msmith','string'),(370,'fileId','47','int'),(370,'fileStage','2','int'),(370,'name','Transparency and Development: Ethical Co.pdf','string'),(370,'originalFileName','Transparency and Development: Ethical Co.pdf','string'),(370,'sourceSubmissionFileId',NULL,'string'),(370,'submissionFileId','54','int'),(370,'submissionId','17','int'),(370,'username','msmith','string'),(371,'fileId','48','int'),(371,'fileStage','2','int'),(371,'originalFileName','Open Educational Resources: Opportunitie.pdf','string'),(371,'sourceSubmissionFileId',NULL,'string'),(371,'submissionFileId','55','int'),(371,'submissionId','17','int'),(371,'username','msmith','string'),(372,'fileId','48','int'),(372,'fileStage','2','int'),(372,'name','Open Educational Resources: Opportunitie.pdf','string'),(372,'submissionFileId','55','int'),(372,'submissionId','17','int'),(372,'username','msmith','string'),(373,'fileId','48','int'),(373,'fileStage','2','int'),(373,'originalFileName','Open Educational Resources: Opportunitie.pdf','string'),(373,'sourceSubmissionFileId',NULL,'string'),(373,'submissionFileId','55','int'),(373,'submissionId','17','int'),(373,'username','msmith','string'),(374,'fileId','48','int'),(374,'fileStage','2','int'),(374,'name','Open Educational Resources: Opportunitie.pdf','string'),(374,'originalFileName','Open Educational Resources: Opportunitie.pdf','string'),(374,'sourceSubmissionFileId',NULL,'string'),(374,'submissionFileId','55','int'),(374,'submissionId','17','int'),(374,'username','msmith','string'),(377,'decision','Send to Internal Review','string'),(377,'editorName','Daniel Barnes','string'),(377,'submissionId','17','int'),(378,'reviewAssignmentId','24','string'),(378,'reviewerName','Julie Janssen','string'),(378,'round','1','int'),(378,'stageId','2','int'),(378,'submissionId','17','int'),(379,'reviewAssignmentId','25','string'),(379,'reviewerName','Paul Hudson','string'),(379,'round','1','int'),(379,'stageId','2','int'),(379,'submissionId','17','int');
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
  UNIQUE KEY `press_features_pkey` (`assoc_type`,`assoc_id`,`submission_id`)
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
INSERT INTO `files` VALUES (1,'presses/1/monographs/1/62153f2e1a344.pdf','application/pdf'),(2,'presses/1/monographs/2/62153f62ba5c2.pdf','application/pdf'),(3,'presses/1/monographs/2/62153f632a376.pdf','application/pdf'),(4,'presses/1/monographs/2/62153f6393c8c.pdf','application/pdf'),(5,'presses/1/monographs/2/62153f640b6f0.pdf','application/pdf'),(6,'presses/1/monographs/3/62153febf0db0.pdf','application/pdf'),(7,'presses/1/monographs/4/62154014c66bb.pdf','application/pdf'),(8,'presses/1/monographs/4/6215401537718.pdf','application/pdf'),(9,'presses/1/monographs/4/621540159c644.pdf','application/pdf'),(10,'presses/1/monographs/4/621540160ecb4.pdf','application/pdf'),(11,'presses/1/monographs/5/621540b75f253.pdf','application/pdf'),(12,'presses/1/monographs/6/62154132b1c59.pdf','application/pdf'),(13,'presses/1/monographs/6/6215413322b59.pdf','application/pdf'),(14,'presses/1/monographs/6/62154133899e1.pdf','application/pdf'),(15,'presses/1/monographs/6/621541340aea6.pdf','application/pdf'),(16,'presses/1/monographs/7/621541a139ee3.pdf','application/pdf'),(17,'presses/1/monographs/7/621541a1a0e7a.pdf','application/pdf'),(18,'presses/1/monographs/7/621541a221681.pdf','application/pdf'),(19,'presses/1/monographs/7/621541a28f81f.pdf','application/pdf'),(20,'presses/1/monographs/7/621541a312ab6.pdf','application/pdf'),(21,'presses/1/monographs/8/62154234c7e4a.pdf','application/pdf'),(22,'presses/1/monographs/9/62154241eddf0.pdf','application/pdf'),(23,'presses/1/monographs/9/6215424257705.pdf','application/pdf'),(24,'presses/1/monographs/9/62154242b9b52.pdf','application/pdf'),(25,'presses/1/monographs/9/621542432cb12.pdf','application/pdf'),(26,'presses/1/monographs/9/621542439b838.pdf','application/pdf'),(27,'presses/1/monographs/10/621542ae70b1a.pdf','application/pdf'),(28,'presses/1/monographs/11/621542ee7cb56.pdf','application/pdf'),(29,'presses/1/monographs/12/6215434ba8e4b.pdf','application/pdf'),(30,'presses/1/monographs/12/6215434c10ed2.pdf','application/pdf'),(31,'presses/1/monographs/12/6215434c7258d.pdf','application/pdf'),(32,'presses/1/monographs/13/621543d66a718.pdf','application/pdf'),(33,'presses/1/monographs/13/621543d6da40b.pdf','application/pdf'),(34,'presses/1/monographs/13/621543d75092a.pdf','application/pdf'),(35,'presses/1/monographs/14/6215446fb6331.pdf','application/pdf'),(36,'presses/1/monographs/14/621544702912b.pdf','application/pdf'),(37,'presses/1/monographs/14/6215447094bfb.pdf','application/pdf'),(38,'presses/1/monographs/14/6215447116dbd.pdf','application/pdf'),(39,'presses/1/monographs/14/62154471853ce.pdf','application/pdf'),(40,'presses/1/monographs/14/621544724e932.pdf','application/pdf'),(41,'presses/1/monographs/15/6215453bdfedd.pdf','application/pdf'),(42,'presses/1/monographs/16/62154566cd78a.pdf','application/pdf'),(43,'presses/1/monographs/17/621545b56b7cf.pdf','application/pdf'),(44,'presses/1/monographs/17/621545b5e91a3.pdf','application/pdf'),(45,'presses/1/monographs/17/621545b6586d0.pdf','application/pdf'),(46,'presses/1/monographs/17/621545b6c2882.pdf','application/pdf'),(47,'presses/1/monographs/17/621545b7427d0.pdf','application/pdf'),(48,'presses/1/monographs/17/621545b7b29c2.pdf','application/pdf');
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
INSERT INTO `filter_groups` VALUES (1,'publicationFormat=>dc11','plugins.metadata.dc11.publicationFormatAdapter.displayName','plugins.metadata.dc11.publicationFormatAdapter.description','class::classes.publicationFormat.PublicationFormat','metadata::plugins.metadata.dc11.schema.Dc11Schema(PUBLICATION_FORMAT)'),(2,'monograph=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),(3,'native-xml=>monograph','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),(4,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.author.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),(5,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.author.Author[]'),(6,'publication-format=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publicationFormat.PublicationFormat','xml::schema(plugins/importexport/native/native.xsd)'),(7,'native-xml=>PublicationFormat','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publicationFormat.PublicationFormat[]'),(8,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submissionFile.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),(9,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submissionFile.SubmissionFile'),(10,'monograph=>onix30-xml','plugins.importexport.onix30.displayName','plugins.importexport.onix30.description','class::classes.submission.Submission','xml::schema(plugins/importexport/native/ONIX_BookProduct_3.0_reference_notstrict.xsd)'),(11,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),(12,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication'),(13,'chapter=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.monograph.Chapter[]','xml::schema(plugins/importexport/native/native.xsd)'),(14,'native-xml=>chapter','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.monograph.Chapter'),(15,'monographs=>onix30-xml','plugins.importexport.onix30.displayName','plugins.importexport.onix30.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/onix30/ONIX_BookProduct_3.0_reference.xsd)'),(16,'user=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.user.User[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(17,'user-xml=>user','plugins.importexport.users.displayName','plugins.importexport.users.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::classes.users.User[]'),(18,'usergroup=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.security.UserGroup[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(19,'user-xml=>usergroup','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::lib.pkp.classes.security.UserGroup[]');
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
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `filter_settings_pkey` (`filter_id`,`locale`,`setting_name`),
  KEY `filter_settings_id` (`filter_id`)
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
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,1,0,'Extract metadata from a(n) PublicationFormat','plugins.metadata.dc11.filter.Dc11SchemaPublicationFormatAdapter',0,0,0),(2,2,0,'Native XML submission export','plugins.importexport.native.filter.MonographNativeXmlFilter',0,0,0),(3,3,0,'Native XML submission import','plugins.importexport.native.filter.NativeXmlMonographFilter',0,0,0),(4,4,0,'Native XML author export','plugins.importexport.native.filter.AuthorNativeXmlFilter',0,0,0),(5,5,0,'Native XML author import','plugins.importexport.native.filter.NativeXmlAuthorFilter',0,0,0),(6,6,0,'Native XML representation export','plugins.importexport.native.filter.PublicationFormatNativeXmlFilter',0,0,0),(7,7,0,'Native XML representation import','plugins.importexport.native.filter.NativeXmlPublicationFormatFilter',0,0,0),(8,9,0,'Native XML submission file import','plugins.importexport.native.filter.NativeXmlMonographFileFilter',0,0,0),(9,8,0,'Native XML submission file export','lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter',0,0,0),(10,10,0,'ONIX 3.0 XML monograph export','plugins.importexport.onix30.filter.MonographONIX30XmlFilter',0,0,0),(11,11,0,'Native XML Publication export','plugins.importexport.native.filter.PublicationNativeXmlFilter',0,0,0),(12,12,0,'Native XML publication import','plugins.importexport.native.filter.NativeXmlPublicationFilter',0,0,0),(13,13,0,'Native XML chapter export','plugins.importexport.native.filter.ChapterNativeXmlFilter',0,0,0),(14,14,0,'Native XML Chapter import','plugins.importexport.native.filter.NativeXmlChapterFilter',0,0,0),(15,15,0,'ONIX 3.0 XML monograph export','plugins.importexport.onix30.filter.MonographONIX30XmlFilter',0,0,0),(16,16,0,'User XML user export','lib.pkp.plugins.importexport.users.filter.PKPUserUserXmlFilter',0,0,0),(17,17,0,'User XML user import','lib.pkp.plugins.importexport.users.filter.UserXmlPKPUserFilter',0,0,0),(18,18,0,'Native XML user group export','lib.pkp.plugins.importexport.users.filter.UserGroupNativeXmlFilter',0,0,0),(19,19,0,'Native XML user group import','lib.pkp.plugins.importexport.users.filter.NativeXmlUserGroupFilter',0,0,0);
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
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `genre_settings_pkey` (`genre_id`,`locale`,`setting_name`),
  KEY `genre_settings_genre_id` (`genre_id`)
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
  PRIMARY KEY (`genre_id`)
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
  KEY `identification_codes_key` (`identification_code_id`,`publication_format_id`,`code`)
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
  UNIQUE KEY `item_views_pkey` (`assoc_type`,`assoc_id`,`user_id`)
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
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)',
  UNIQUE KEY `library_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  KEY `library_file_settings_id` (`file_id`)
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
  KEY `library_files_submission_id` (`submission_id`)
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
  KEY `format_markets_pkey` (`market_id`,`publication_format_id`)
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
-- Table structure for table `metadata_description_settings`
--

DROP TABLE IF EXISTS `metadata_description_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadata_description_settings` (
  `metadata_description_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `metadata_descripton_settings_pkey` (`metadata_description_id`,`locale`,`setting_name`),
  KEY `metadata_description_settings_id` (`metadata_description_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadata_description_settings`
--

LOCK TABLES `metadata_description_settings` WRITE;
/*!40000 ALTER TABLE `metadata_description_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadata_description_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadata_descriptions`
--

DROP TABLE IF EXISTS `metadata_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadata_descriptions` (
  `metadata_description_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL DEFAULT '0',
  `assoc_id` bigint(20) NOT NULL DEFAULT '0',
  `schema_namespace` varchar(255) NOT NULL,
  `schema_name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `seq` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`metadata_description_id`),
  KEY `metadata_descriptions_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadata_descriptions`
--

LOCK TABLES `metadata_descriptions` WRITE;
/*!40000 ALTER TABLE `metadata_descriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadata_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics`
--

DROP TABLE IF EXISTS `metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metrics` (
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `pkp_section_id` bigint(20) DEFAULT NULL,
  `assoc_object_type` bigint(20) DEFAULT NULL,
  `assoc_object_id` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `day` varchar(8) DEFAULT NULL,
  `month` varchar(6) DEFAULT NULL,
  `file_type` smallint(6) DEFAULT NULL,
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `metric_type` varchar(255) NOT NULL,
  `metric` int(11) NOT NULL,
  KEY `metrics_load_id` (`load_id`),
  KEY `metrics_metric_type_context_id` (`metric_type`,`context_id`),
  KEY `metrics_metric_type_submission_id_assoc_type` (`metric_type`,`submission_id`,`assoc_type`),
  KEY `metrics_metric_type_submission_id_assoc` (`metric_type`,`context_id`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics`
--

LOCK TABLES `metrics` WRITE;
/*!40000 ALTER TABLE `metrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics` ENABLE KEYS */;
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
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `navigation_menu_item_assignment_settings_pkey` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  KEY `assignment_settings_navigation_menu_item_assignment_id` (`navigation_menu_item_assignment_id`)
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
  PRIMARY KEY (`navigation_menu_item_assignment_id`)
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
  KEY `navigation_menu_item_settings_navigation_menu_id` (`navigation_menu_item_id`)
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
  UNIQUE KEY `new_releases_pkey` (`assoc_type`,`assoc_id`,`submission_id`)
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
  KEY `notes_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,1048586,1,6,'2022-02-22 20:03:22','2022-02-22 20:03:22','Recommendation','<p>Daniel Barnes:<br /><br />The recommendation regarding the submission to Public Knowledge Press, \"The Information Literacy User’s Guide\" is: <span class=\"pkpTag mceNonEditable\" data-symbolic=\"recommendation\">Recommendation</span></p><br/><br/><hr /><br/><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>123 456th Street&lt;br /&gt;\nBurnaby, British Columbia&lt;br /&gt;\nCanada</p><p>Ramiro Vaca, <a href=\"mailto: rvaca@mailinator.com\">rvaca@mailinator.com</a></p>');
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_mail_list`
--

DROP TABLE IF EXISTS `notification_mail_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_mail_list` (
  `notification_mail_list_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `confirmed` smallint(6) NOT NULL DEFAULT '0',
  `token` varchar(40) NOT NULL,
  `context` bigint(20) NOT NULL,
  PRIMARY KEY (`notification_mail_list_id`),
  UNIQUE KEY `notification_mail_list_email_context` (`email`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_mail_list`
--

LOCK TABLES `notification_mail_list` WRITE;
/*!40000 ALTER TABLE `notification_mail_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_mail_list` ENABLE KEYS */;
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
  `setting_value` text NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `notification_settings_pkey` (`notification_id`,`locale`,`setting_name`)
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
  `setting_value` text NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `context` bigint(20) NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`setting_id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=408 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (11,1,3,2,16777217,'2022-02-22 19:53:33',NULL,1048585,1),(13,1,0,2,16777243,'2022-02-22 19:53:33',NULL,1048585,1),(14,1,0,2,16777245,'2022-02-22 19:53:33',NULL,1048585,1),(16,1,0,2,16777236,'2022-02-22 19:53:41','2022-02-22 19:53:44',523,1),(18,1,12,3,16777227,'2022-02-22 19:53:49',NULL,517,1),(21,1,19,2,16777230,'2022-02-22 19:53:51',NULL,1048585,1),(22,1,3,2,16777251,'2022-02-22 19:53:51','2022-02-22 19:53:55',1048585,1),(39,1,3,2,16777217,'2022-02-22 19:55:45',NULL,1048585,2),(41,1,0,2,16777243,'2022-02-22 19:55:45',NULL,1048585,2),(42,1,0,2,16777245,'2022-02-22 19:55:45',NULL,1048585,2),(45,1,0,2,16777236,'2022-02-22 19:55:57','2022-02-22 19:56:01',523,2),(46,1,20,2,16777231,'2022-02-22 19:55:57',NULL,1048585,2),(47,1,11,3,16777227,'2022-02-22 19:56:08',NULL,517,2),(49,1,12,3,16777227,'2022-02-22 19:56:15',NULL,517,3),(56,1,3,2,16777217,'2022-02-22 19:56:57',NULL,1048585,3),(58,1,0,2,16777243,'2022-02-22 19:56:57',NULL,1048585,3),(59,1,0,2,16777245,'2022-02-22 19:56:57',NULL,1048585,3),(72,1,3,2,16777217,'2022-02-22 19:58:14',NULL,1048585,4),(74,1,0,2,16777243,'2022-02-22 19:58:14',NULL,1048585,4),(75,1,0,2,16777245,'2022-02-22 19:58:14','2022-02-22 19:59:09',1048585,4),(78,1,0,2,16777236,'2022-02-22 19:58:24','2022-02-22 19:58:28',523,3),(80,1,9,3,16777227,'2022-02-22 19:58:34',NULL,517,4),(82,1,0,2,16777236,'2022-02-22 19:58:37','2022-02-22 19:58:42',523,4),(85,1,11,3,16777227,'2022-02-22 19:58:47',NULL,517,5),(92,1,22,2,16777235,'2022-02-22 19:59:04',NULL,1048585,4),(93,1,3,2,16777254,'2022-02-22 19:59:04',NULL,1048585,4),(101,1,3,2,16777217,'2022-02-22 20:00:25',NULL,1048585,5),(106,1,0,2,16777236,'2022-02-22 20:00:34','2022-02-22 20:00:37',523,5),(108,1,8,3,16777227,'2022-02-22 20:00:42',NULL,517,6),(110,1,0,2,16777236,'2022-02-22 20:00:45','2022-02-22 20:00:49',523,6),(113,1,12,3,16777227,'2022-02-22 20:00:53',NULL,517,7),(120,1,23,2,16777235,'2022-02-22 20:01:07',NULL,1048585,5),(121,1,3,2,16777254,'2022-02-22 20:01:08',NULL,1048585,5),(124,1,0,2,16777246,'2022-02-22 20:01:42',NULL,1048585,5),(136,1,3,2,16777217,'2022-02-22 20:02:48',NULL,1048585,6),(138,1,0,2,16777243,'2022-02-22 20:02:48',NULL,1048585,6),(139,1,0,2,16777245,'2022-02-22 20:02:48',NULL,1048585,6),(142,1,0,2,16777236,'2022-02-22 20:03:00','2022-02-22 20:03:04',523,7),(143,1,24,2,16777229,'2022-02-22 20:03:00',NULL,1048585,6),(146,1,3,3,16777249,'2022-02-22 20:03:22',NULL,1048586,1),(162,1,3,2,16777217,'2022-02-22 20:05:23',NULL,1048585,7),(164,1,0,2,16777243,'2022-02-22 20:05:23',NULL,1048585,7),(165,1,0,2,16777245,'2022-02-22 20:05:23',NULL,1048585,7),(168,1,0,2,16777236,'2022-02-22 20:05:35','2022-02-22 20:05:39',523,8),(170,1,10,3,16777227,'2022-02-22 20:05:46',NULL,517,8),(173,1,25,2,16777230,'2022-02-22 20:05:50',NULL,1048585,7),(174,1,3,2,16777251,'2022-02-22 20:05:50','2022-02-22 20:05:55',1048585,7),(176,1,3,2,16777217,'2022-02-22 20:06:15',NULL,1048585,8),(178,1,0,2,16777243,'2022-02-22 20:06:15',NULL,1048585,8),(179,1,0,2,16777245,'2022-02-22 20:06:15',NULL,1048585,8),(195,1,3,2,16777217,'2022-02-22 20:07:46',NULL,1048585,9),(197,1,0,2,16777243,'2022-02-22 20:07:46',NULL,1048585,9),(198,1,0,2,16777245,'2022-02-22 20:07:46',NULL,1048585,9),(201,1,0,2,16777236,'2022-02-22 20:07:58','2022-02-22 20:08:02',523,9),(202,1,26,2,16777229,'2022-02-22 20:07:58',NULL,1048585,9),(212,1,3,2,16777217,'2022-02-22 20:09:06',NULL,1048585,10),(214,1,0,2,16777243,'2022-02-22 20:09:06',NULL,1048585,10),(215,1,0,2,16777245,'2022-02-22 20:09:06',NULL,1048585,10),(219,1,3,2,16777217,'2022-02-22 20:09:28',NULL,1048585,11),(221,1,0,2,16777243,'2022-02-22 20:09:28',NULL,1048585,11),(222,1,0,2,16777245,'2022-02-22 20:09:28',NULL,1048585,11),(224,1,0,2,16777236,'2022-02-22 20:09:37','2022-02-22 20:09:40',523,10),(226,1,9,3,16777227,'2022-02-22 20:09:45',NULL,517,9),(228,1,0,2,16777236,'2022-02-22 20:09:47','2022-02-22 20:09:50',523,11),(236,1,3,2,16777219,'2022-02-22 20:10:12',NULL,517,10),(239,1,3,2,16777219,'2022-02-22 20:10:24',NULL,517,11),(242,1,28,2,16777230,'2022-02-22 20:10:36',NULL,1048585,11),(243,1,3,2,16777251,'2022-02-22 20:10:36','2022-02-22 20:10:40',1048585,11),(257,1,3,2,16777217,'2022-02-22 20:12:05',NULL,1048585,12),(259,1,0,2,16777243,'2022-02-22 20:12:05',NULL,1048585,12),(260,1,0,2,16777245,'2022-02-22 20:12:05',NULL,1048585,12),(263,1,0,2,16777236,'2022-02-22 20:12:17','2022-02-22 20:12:21',523,12),(264,1,29,2,16777229,'2022-02-22 20:12:17',NULL,1048585,12),(265,1,7,3,16777227,'2022-02-22 20:12:28',NULL,517,12),(269,1,9,3,16777227,'2022-02-22 20:12:42',NULL,517,14),(272,1,3,2,16777219,'2022-02-22 20:12:57',NULL,517,13),(283,1,3,2,16777217,'2022-02-22 20:13:58',NULL,1048585,13),(285,1,0,2,16777243,'2022-02-22 20:13:58',NULL,1048585,13),(286,1,0,2,16777245,'2022-02-22 20:13:58',NULL,1048585,13),(289,1,0,2,16777236,'2022-02-22 20:14:08','2022-02-22 20:14:12',523,13),(291,1,8,3,16777227,'2022-02-22 20:14:18',NULL,517,15),(293,1,0,2,16777236,'2022-02-22 20:14:20','2022-02-22 20:14:24',523,14),(298,1,11,3,16777227,'2022-02-22 20:14:37',NULL,517,17),(303,1,3,2,16777219,'2022-02-22 20:14:57',NULL,517,16),(306,1,3,2,16777219,'2022-02-22 20:15:11',NULL,517,18),(309,1,30,2,16777230,'2022-02-22 20:15:27',NULL,1048585,13),(310,1,3,2,16777251,'2022-02-22 20:15:27','2022-02-22 20:15:31',1048585,13),(321,1,3,2,16777217,'2022-02-22 20:16:40',NULL,1048585,14),(327,1,0,2,16777236,'2022-02-22 20:16:52','2022-02-22 20:16:56',523,15),(329,1,7,3,16777227,'2022-02-22 20:17:03',NULL,517,19),(331,1,0,2,16777236,'2022-02-22 20:17:06','2022-02-22 20:17:11',523,16),(334,1,11,3,16777227,'2022-02-22 20:17:16',NULL,517,20),(341,1,31,2,16777235,'2022-02-22 20:17:35',NULL,1048585,14),(342,1,3,2,16777254,'2022-02-22 20:17:36',NULL,1048585,14),(345,1,0,2,16777246,'2022-02-22 20:18:55',NULL,1048585,14),(349,1,3,2,16777217,'2022-02-22 20:19:26',NULL,1048585,15),(351,1,0,2,16777243,'2022-02-22 20:19:26',NULL,1048585,15),(352,1,0,2,16777245,'2022-02-22 20:19:26',NULL,1048585,15),(354,1,0,2,16777236,'2022-02-22 20:19:36','2022-02-22 20:19:39',523,17),(355,1,32,2,16777231,'2022-02-22 20:19:36',NULL,1048585,15),(361,1,3,2,16777217,'2022-02-22 20:20:15',NULL,1048585,16),(363,1,0,2,16777243,'2022-02-22 20:20:15',NULL,1048585,16),(364,1,0,2,16777245,'2022-02-22 20:20:15',NULL,1048585,16),(366,1,0,2,16777236,'2022-02-22 20:20:25','2022-02-22 20:20:28',523,18),(367,1,33,2,16777231,'2022-02-22 20:20:25',NULL,1048585,16),(370,1,11,3,16777227,'2022-02-22 20:20:39',NULL,517,22),(372,1,12,3,16777227,'2022-02-22 20:20:45',NULL,517,23),(375,1,3,2,16777219,'2022-02-22 20:20:56',NULL,517,21),(396,1,3,2,16777217,'2022-02-22 20:23:17',NULL,1048585,17),(398,1,0,2,16777243,'2022-02-22 20:23:17',NULL,1048585,17),(399,1,0,2,16777245,'2022-02-22 20:23:17',NULL,1048585,17),(402,1,0,2,16777236,'2022-02-22 20:23:32','2022-02-22 20:23:36',523,19),(403,1,34,2,16777229,'2022-02-22 20:23:32',NULL,1048585,17),(404,1,7,3,16777227,'2022-02-22 20:23:43',NULL,517,24),(406,1,8,3,16777227,'2022-02-22 20:23:52',NULL,517,25);
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
  `setting_value` text,
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
INSERT INTO `plugin_settings` VALUES ('acronplugin',0,'crontab','[{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"lib.pkp.classes.task.ReviewReminder\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.PublishSubmissions\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]','object'),('acronplugin',0,'enabled','1','bool'),('browseblockplugin',1,'browseCategories','1','bool'),('browseblockplugin',1,'browseNewReleases','1','bool'),('browseblockplugin',1,'browseSeries','1','bool'),('browseblockplugin',1,'context','1','int'),('browseblockplugin',1,'enabled','1','bool'),('browseblockplugin',1,'seq','1','int'),('defaultthemeplugin',0,'enabled','1','bool'),('defaultthemeplugin',1,'baseColour','#1E6292','string'),('defaultthemeplugin',1,'enabled','1','bool'),('defaultthemeplugin',1,'showCatalogSeriesListing','false','string'),('defaultthemeplugin',1,'typography','notoSans','string'),('defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),('developedbyblockplugin',0,'context','1','int'),('developedbyblockplugin',0,'enabled','0','bool'),('developedbyblockplugin',0,'seq','0','int'),('developedbyblockplugin',1,'context','1','int'),('developedbyblockplugin',1,'enabled','0','bool'),('developedbyblockplugin',1,'seq','0','int'),('dublincoremetaplugin',1,'enabled','1','bool'),('googlescholarplugin',1,'enabled','1','bool'),('htmlmonographfileplugin',1,'enabled','1','bool'),('informationblockplugin',1,'context','1','int'),('informationblockplugin',1,'enabled','1','bool'),('informationblockplugin',1,'seq','7','int'),('languagetoggleblockplugin',0,'context','1','int'),('languagetoggleblockplugin',0,'enabled','1','bool'),('languagetoggleblockplugin',0,'seq','4','int'),('languagetoggleblockplugin',1,'context','1','int'),('languagetoggleblockplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',1,'seq','4','int'),('pdfjsviewerplugin',1,'enabled','1','bool'),('tinymceplugin',0,'enabled','1','bool'),('tinymceplugin',1,'enabled','1','bool'),('usageeventplugin',0,'enabled','1','bool'),('usageeventplugin',0,'uniqueSiteId','62153da982f6d','string'),('usagestatsplugin',0,'accessLogFileParseRegex','/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/','string'),('usagestatsplugin',0,'chartType','bar','string'),('usagestatsplugin',0,'createLogFiles','1','bool'),('usagestatsplugin',0,'datasetMaxCount','4','string'),('usagestatsplugin',0,'enabled','1','bool'),('usagestatsplugin',0,'optionalColumns','[\"city\",\"region\"]','object'),('webfeedplugin',1,'displayItems','1','bool'),('webfeedplugin',1,'displayPage','homepage','string'),('webfeedplugin',1,'enabled','1','bool');
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
  KEY `press_settings_press_id` (`press_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `press_settings`
--

LOCK TABLES `press_settings` WRITE;
/*!40000 ALTER TABLE `press_settings` DISABLE KEYS */;
INSERT INTO `press_settings` VALUES (1,'','contactEmail','rvaca@mailinator.com',NULL),(1,'','contactName','Ramiro Vaca',NULL),(1,'','country','IS',NULL),(1,'','coverThumbnailsMaxHeight','100',NULL),(1,'','coverThumbnailsMaxWidth','106',NULL),(1,'','defaultReviewMode','2',NULL),(1,'','disableSubmissions','0',NULL),(1,'','doiCreationTime','copyEditCreationTime',NULL),(1,'','emailSignature','<br/><hr /><br/><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto: {$contactEmail}\">{$contactEmail}</a></p>',NULL),(1,'','enableDois','0',NULL),(1,'','itemsPerPage','25',NULL),(1,'','keywords','request',NULL),(1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada',NULL),(1,'','numPageLinks','10',NULL),(1,'','numWeeksPerResponse','4',NULL),(1,'','numWeeksPerReview','4',NULL),(1,'','paymentPluginName','ManualPayment',NULL),(1,'','registrationAgency','none',NULL),(1,'','supportedFormLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedSubmissionLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportEmail','rvaca@mailinator.com',NULL),(1,'','supportName','Ramiro Vaca',NULL),(1,'','themePluginPath','default',NULL),(1,'','type','enable',NULL),(1,'en_US','acronym','JPK',NULL),(1,'en_US','authorInformation','Interested in submitting to this press? We recommend that you review the <a href=\"http://localhost/index.php/publicknowledge/about\">About the Press</a> page for the press\' section policies and <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.php/publicknowledge/user/register\">register</a> with the press prior to submitting, or if already registered can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the 5 step process.',NULL),(1,'en_US','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">',NULL),(1,'en_US','librarianInformation','We encourage research librarians to list this press among their library\'s electronic press holdings. As well, this open source publishing system is suitable for libraries to host for their faculty members to use with presses they are involved in editing (see <a href=\"http://pkp.sfu.ca/omp\">Open Monograph Press</a>).',NULL),(1,'en_US','name','Public Knowledge Press',NULL),(1,'en_US','openAccessPolicy','This press provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),(1,'en_US','privacyStatement','<p>The names and email addresses entered in this press site will be used exclusively for the stated purposes of this press and will not be made available for any other purpose or to any other party.</p>',NULL),(1,'en_US','readerInformation','We encourage readers to sign up for the publishing notification service for this press. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the homepage for the press. This registration will result in the reader receiving the Table of Contents by email for each new monograph of the press. This list also allows the press to claim a certain level of support or readership. See the press <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a> which assures readers that their name and email address will not be used for other purposes.',NULL),(1,'en_US','searchDescription','Public Knowledge Press is a publisher dedicated to the subject of public access to science.',NULL),(1,'en_US','submissionChecklist','[{\"order\":1,\"content\":\"The submission has not been previously published, nor is it before another press for consideration (or an explanation has been provided in Comments to the Editor).\"},{\"order\":2,\"content\":\"The submission file is in the Microsoft Word, RTF, or OpenDocument file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":4,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the <a href=\\\"http:\\/\\/localhost\\/index.php\\/publicknowledge\\/about\\/submissions#authorGuidelines\\\" target=\\\"_blank\\\">Author Guidelines<\\/a>, which is found in About the Press.\"}]',NULL),(1,'fr_CA','authorInformation','Vous souhaitez soumettre une contribution à cette presse ? Nous vous recommandons de lire la page\n <a href=\"http://localhost/index.php/publicknowledge/about\">À propos de cette presse</a> pour connaitre ses règlements et la page\n <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Lignes directrices à l\'intention des auteurs-es</a>. Les auteurs-es doivent <a href=\"http://localhost/index.php/publicknowledge/user/register\">s\'inscrire</a> auprès de la presse avant d\'envoyer une soumission. Si vous êtes déjà inscrit-e, il suffit simplement <a href=\"http://localhost/index.php/index/login\">d\'ouvrir une session</a> pour débuter la procédure en 5 étapes.',NULL),(1,'fr_CA','librarianInformation','Nous encourageons les bibliothécaires de recherche à ajouter cette presse à la liste électronique des ressources documentaires de la bibliothèque. De plus, ce système d\'édition à libre accès convient à toutes les bibliothèques et permet aux membres des facultés de l\'utiliser pour les presses auxquelles ils contribuent à titre de rédacteur en chef. (voir <a href=\"http://pkp.sfu.ca/omp\">Open Monograph Press</a>).',NULL),(1,'fr_CA','name','Press de la connaissance du public',NULL),(1,'fr_CA','openAccessPolicy','Cette presse offre un accès libre immédiat à son contenu en partant du principe que la recherche doit être accessible au grand public, car cela favorise un meilleur échange des connaissances à l\'échelle mondiale.',NULL),(1,'fr_CA','privacyStatement','<p>Les noms et adresses courriel saisis sur ce site de presse seront utilisés exclusivement pour les fins convenues de cette presse. Ils ne seront pas utilisés pour d\'autres fins ou transmis à une tierce partie.</p>',NULL),(1,'fr_CA','readerInformation','Nous encourageons les lecteurs à s\'abonner au service d\'avis de publication de cette presse. Utilisez le lien <a href=\"http://localhost/index.php/publicknowledge/user/register\">d\'inscription</a> situé en haut de la page d\'accueil de la presse. Cette inscription permettra au lecteur de recevoir la table des matières de chaque nouvelle monographie de cette presse par courriel. Cette liste permet également à la presse d\'affirmer qu\'elle compte un certain nombre de lecteurs. Consultez <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">l\'énoncé de confidentialité </a> de la presse, lequel stipule que les noms et adresses courriel de ses lecteurs ne seront pas utilisés à d\'autres fins.',NULL),(1,'fr_CA','submissionChecklist','[{\"order\":1,\"content\":\"Cette soumission n\'a jamais été publiée et n\'a pas été soumise à une autre presse (ou une explication a été ajoutée à la section Commentaires du rédacteur en chef).\"},{\"order\":2,\"content\":\"Le fichier soumis est de format Microsoft Word, RTF ou OpenDocument.\"},{\"order\":3,\"content\":\"Les adresses URL des références ont été fournies si elles étaient disponibles.\"},{\"order\":4,\"content\":\"Le texte est publié à simple interligne ; utiliser une police de caractères de 12 points ; utiliser des caractères italiques au lieu de souligner (sauf pour les adresses URL) ; et toutes les illustrations, figures et tableaux doivent être insérés dans le texte aux endroits appropriés plutôt qu\'à la fin.\"},{\"order\":5,\"content\":\"Le texte respecte les exigences stylistiques et bibliographiques conformément aux <a href=\\\"http:\\/\\/localhost\\/index.php\\/publicknowledge\\/about\\/submissions#authorGuidelines\\\" target=\\\"_blank\\\">lignes directrices à l\'intention des auteurs<\\/a>, disponibles dans la rubrique À propos de cette presse.\"}]',NULL);
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
  KEY `publication_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `publication_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  CONSTRAINT `publication_categories_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`)
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
  KEY `format_publication_dates_pkey` (`publication_date_id`,`publication_format_id`,`role`)
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
  KEY `publication_format_id_key` (`publication_format_id`)
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
  KEY `publication_format_submission_id` (`submission_id`),
  KEY `publication_formats_doi_id_foreign` (`doi_id`),
  CONSTRAINT `publication_formats_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL
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
  `setting_value` text,
  UNIQUE KEY `publication_settings_pkey` (`publication_id`,`locale`,`setting_name`),
  KEY `publication_settings_publication_id` (`publication_id`),
  KEY `publication_settings_name_value` (`setting_name`(50),`setting_value`(150))
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
  KEY `publications_submission_id` (`submission_id`),
  KEY `publications_section_id` (`series_id`),
  KEY `publications_doi_id_foreign` (`doi_id`),
  CONSTRAINT `publications_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,NULL,'2022-02-22 19:53:32',1,'pub','publication',0.00,NULL,NULL,1,1,NULL,1,NULL),(2,NULL,'2022-02-22 19:55:43',2,'pub','publication',0.00,NULL,NULL,2,1,NULL,1,NULL),(3,NULL,'2022-02-22 19:56:56',10,'pub','publication',0.00,NULL,NULL,3,1,NULL,1,NULL),(4,NULL,'2022-02-22 19:58:12',11,'pub','publication',0.00,NULL,NULL,4,1,NULL,1,NULL),(5,'2022-02-22','2022-02-22 20:01:42',15,'pub','publication',0.00,NULL,NULL,5,3,NULL,1,NULL),(6,NULL,'2022-02-22 20:02:47',16,'pub','publication',0.00,NULL,NULL,6,1,NULL,1,NULL),(7,NULL,'2022-02-22 20:05:21',20,'pub','publication',0.00,NULL,NULL,7,1,NULL,1,NULL),(8,NULL,'2022-02-22 20:06:14',25,'pub','publication',0.00,NULL,NULL,8,1,NULL,1,NULL),(9,NULL,'2022-02-22 20:07:44',26,'pub','publication',0.00,NULL,NULL,9,1,NULL,1,NULL),(10,NULL,'2022-02-22 20:09:05',31,'pub','publication',0.00,NULL,NULL,10,1,NULL,1,NULL),(11,NULL,'2022-02-22 20:09:27',32,'pub','publication',0.00,NULL,NULL,11,1,NULL,1,NULL),(12,NULL,'2022-02-22 20:12:03',33,'pub','publication',0.00,NULL,NULL,12,1,NULL,1,NULL),(13,NULL,'2022-02-22 20:13:56',41,'pub','publication',0.00,NULL,NULL,13,1,NULL,1,NULL),(14,'2022-02-22','2022-02-22 20:18:55',45,'pub','publication',0.00,NULL,NULL,14,3,NULL,1,NULL),(15,NULL,'2022-02-22 20:19:25',48,'pub','publication',0.00,NULL,NULL,15,1,NULL,1,NULL),(16,NULL,'2022-02-22 20:20:14',49,'pub','publication',0.00,NULL,NULL,16,1,NULL,1,NULL),(17,NULL,'2022-02-22 20:23:15',50,'pub','publication',0.00,NULL,NULL,17,1,NULL,1,NULL);
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
  UNIQUE KEY `query_participants_pkey` (`query_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_participants`
--

LOCK TABLES `query_participants` WRITE;
/*!40000 ALTER TABLE `query_participants` DISABLE KEYS */;
INSERT INTO `query_participants` VALUES (1,3);
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
  KEY `format_representatives_pkey` (`representative_id`,`submission_id`)
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
  PRIMARY KEY (`review_id`),
  UNIQUE KEY `review_assignment_reviewer_round_unique` (`review_round_id`,`reviewer_id`),
  KEY `review_assignments_submission_id` (`submission_id`),
  KEY `review_assignments_reviewer_id` (`reviewer_id`),
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
INSERT INTO `review_assignments` VALUES (1,1,12,NULL,NULL,'2022-02-22 19:53:49','2022-02-22 19:53:49',NULL,NULL,NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 19:53:49',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,1,NULL,0),(2,2,11,NULL,NULL,'2022-02-22 19:56:08','2022-02-22 19:56:08',NULL,NULL,NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 19:56:08',0,0,0,NULL,NULL,NULL,NULL,2,3,2,1,1,NULL,0),(3,2,12,NULL,NULL,'2022-02-22 19:56:15','2022-02-22 19:56:15',NULL,NULL,NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 19:56:15',0,0,0,NULL,NULL,NULL,NULL,2,3,2,1,1,NULL,0),(4,4,9,NULL,NULL,'2022-02-22 19:58:34','2022-02-22 19:58:34',NULL,NULL,NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 19:58:34',0,0,0,NULL,NULL,NULL,NULL,3,2,2,1,1,NULL,0),(5,4,11,NULL,NULL,'2022-02-22 19:58:47','2022-02-22 19:58:47',NULL,NULL,NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 19:58:47',0,0,0,NULL,NULL,NULL,NULL,4,3,2,1,1,NULL,0),(6,5,8,NULL,NULL,'2022-02-22 20:00:42','2022-02-22 20:00:42',NULL,NULL,NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 20:00:42',0,0,0,NULL,NULL,NULL,NULL,5,2,2,1,1,NULL,0),(7,5,12,NULL,NULL,'2022-02-22 20:00:53','2022-02-22 20:00:53',NULL,NULL,NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 20:00:53',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,1,NULL,0),(8,7,10,NULL,NULL,'2022-02-22 20:05:46','2022-02-22 20:05:46',NULL,NULL,NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 20:05:46',0,0,0,NULL,NULL,NULL,NULL,8,3,2,1,1,NULL,0),(9,11,9,NULL,NULL,'2022-02-22 20:09:45','2022-02-22 20:09:45',NULL,NULL,NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 20:09:45',0,0,0,NULL,NULL,NULL,NULL,10,2,2,1,1,NULL,0),(10,11,10,NULL,0,'2022-02-22 20:09:55','2022-02-22 20:09:55','2022-02-22 20:10:08','2022-02-22 20:10:12',NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 20:10:12',0,0,0,NULL,NULL,NULL,0,11,3,2,1,4,NULL,0),(11,11,12,NULL,0,'2022-02-22 20:10:01','2022-02-22 20:10:01','2022-02-22 20:10:20','2022-02-22 20:10:24',NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 20:10:24',0,0,0,NULL,NULL,NULL,0,11,3,2,1,4,NULL,0),(12,12,7,NULL,NULL,'2022-02-22 20:12:28','2022-02-22 20:12:28',NULL,NULL,NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 20:12:28',0,0,0,NULL,NULL,NULL,NULL,12,2,2,1,1,NULL,0),(13,12,8,NULL,0,'2022-02-22 20:12:35','2022-02-22 20:12:35','2022-02-22 20:12:52','2022-02-22 20:12:57',NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 20:12:57',0,0,0,NULL,NULL,NULL,0,12,2,2,1,4,NULL,0),(14,12,9,NULL,NULL,'2022-02-22 20:12:42','2022-02-22 20:12:42',NULL,NULL,NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 20:12:42',0,0,0,NULL,NULL,NULL,NULL,12,2,2,1,1,NULL,0),(15,13,8,NULL,NULL,'2022-02-22 20:14:18','2022-02-22 20:14:18',NULL,NULL,NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 20:14:18',0,0,0,NULL,NULL,NULL,NULL,13,2,2,1,1,NULL,0),(16,13,10,NULL,0,'2022-02-22 20:14:30','2022-02-22 20:14:30','2022-02-22 20:14:53','2022-02-22 20:14:57',NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 20:14:57',0,0,0,NULL,NULL,NULL,0,14,3,2,1,4,NULL,0),(17,13,11,NULL,NULL,'2022-02-22 20:14:37','2022-02-22 20:14:37',NULL,NULL,NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 20:14:37',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,1,NULL,0),(18,13,12,NULL,0,'2022-02-22 20:14:44','2022-02-22 20:14:44','2022-02-22 20:15:06','2022-02-22 20:15:11',NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 20:15:11',0,0,0,NULL,NULL,NULL,0,14,3,2,1,4,NULL,0),(19,14,7,NULL,NULL,'2022-02-22 20:17:03','2022-02-22 20:17:03',NULL,NULL,NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 20:17:03',0,0,0,NULL,NULL,NULL,NULL,15,2,2,1,1,NULL,0),(20,14,11,NULL,NULL,'2022-02-22 20:17:16','2022-02-22 20:17:16',NULL,NULL,NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 20:17:16',0,0,0,NULL,NULL,NULL,NULL,16,3,2,1,1,NULL,0),(21,16,10,NULL,0,'2022-02-22 20:20:33','2022-02-22 20:20:33','2022-02-22 20:20:52','2022-02-22 20:20:56',NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 20:20:56',0,0,0,NULL,NULL,NULL,0,18,3,2,1,4,NULL,0),(22,16,11,NULL,NULL,'2022-02-22 20:20:39','2022-02-22 20:20:39',NULL,NULL,NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 20:20:39',0,0,0,NULL,NULL,NULL,NULL,18,3,2,1,1,NULL,0),(23,16,12,NULL,NULL,'2022-02-22 20:20:45','2022-02-22 20:20:45',NULL,NULL,NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 20:20:45',0,0,0,NULL,NULL,NULL,NULL,18,3,2,1,1,NULL,0),(24,17,7,NULL,NULL,'2022-02-22 20:23:43','2022-02-22 20:23:43',NULL,NULL,NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 20:23:43',0,0,0,NULL,NULL,NULL,NULL,19,2,2,1,1,NULL,0),(25,17,8,NULL,NULL,'2022-02-22 20:23:52','2022-02-22 20:23:52',NULL,NULL,NULL,'2022-03-22 00:00:00','2022-03-22 00:00:00','2022-02-22 20:23:52',0,0,0,NULL,NULL,NULL,NULL,19,2,2,1,1,NULL,0);
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
  KEY `review_files_submission_file_id_foreign` (`submission_file_id`),
  CONSTRAINT `review_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_files`
--

LOCK TABLES `review_files` WRITE;
/*!40000 ALTER TABLE `review_files` DISABLE KEYS */;
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
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_element_settings_pkey` (`review_form_element_id`,`locale`,`setting_name`),
  KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`)
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
  KEY `review_form_elements_review_form_id` (`review_form_id`)
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
  KEY `review_form_responses_pkey` (`review_form_element_id`,`review_id`)
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
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_settings_pkey` (`review_form_id`,`locale`,`setting_name`),
  KEY `review_form_settings_review_form_id` (`review_form_id`)
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
  KEY `review_round_files_submission_file_id_foreign` (`submission_file_id`),
  CONSTRAINT `review_round_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_round_files`
--

LOCK TABLES `review_round_files` WRITE;
/*!40000 ALTER TABLE `review_round_files` DISABLE KEYS */;
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
INSERT INTO `review_rounds` VALUES (1,1,3,1,NULL,4),(2,2,3,1,NULL,7),(3,4,2,1,NULL,3),(4,4,3,1,NULL,4),(5,5,2,1,NULL,3),(6,5,3,1,NULL,4),(7,6,2,1,NULL,6),(8,7,3,1,NULL,4),(9,9,2,1,NULL,6),(10,11,2,1,NULL,3),(11,11,3,1,NULL,4),(12,12,2,1,NULL,8),(13,13,2,1,NULL,3),(14,13,3,1,NULL,4),(15,14,2,1,NULL,3),(16,14,3,1,NULL,4),(17,15,3,1,NULL,6),(18,16,3,1,NULL,8),(19,17,2,1,NULL,7);
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
  KEY `format_sales_rights_pkey` (`sales_rights_id`,`publication_format_id`)
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
INSERT INTO `scheduled_tasks` VALUES ('lib.pkp.classes.task.PublishSubmissions','2022-02-22 19:46:35'),('lib.pkp.classes.task.ReviewReminder','2022-02-22 19:46:35'),('lib.pkp.classes.task.StatisticsReport','2022-02-22 19:46:35'),('plugins.generic.usageStats.UsageStatsLoader','2022-02-22 19:46:35');
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
  KEY `series_press_id` (`press_id`)
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
  UNIQUE KEY `series_categories_id` (`series_id`,`category_id`)
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
  UNIQUE KEY `series_settings_pkey` (`series_id`,`locale`,`setting_name`)
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
  KEY `sessions_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('1e7otb9csit00ofvbj6i79p77h',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645560934,1645561136,0,'csrf|a:2:{s:9:\"timestamp\";i:1645561136;s:5:\"token\";s:32:\"1f862908eb87dd12fc8e02bd60b88c11\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('598nre7eb20o984q7olmb6i0cd',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645559546,1645559567,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1645559567;s:5:\"token\";s:32:\"557cac44e10c06cae8724e1b09b9962c\";}','localhost'),('66llinkeouo058savh207o7u66',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645560364,1645560375,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1645560375;s:5:\"token\";s:32:\"2d0d29e3226348a41bd35c76b128b29c\";}','localhost'),('6a7q2vh45j8auu75qalm5t0vpk',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645559641,1645559775,0,'csrf|a:2:{s:9:\"timestamp\";i:1645559775;s:5:\"token\";s:32:\"cd8d7b10fc3fe813b15999e71a54a87b\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('88q3bfj3f3st5s30itogsmv634',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645559588,1645559639,0,'csrf|a:2:{s:9:\"timestamp\";i:1645559639;s:5:\"token\";s:32:\"511587ba24ffc5b788ecfb771bf2ce63\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('am8fcro5joh81qffjrfcpbkgvl',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645559569,1645559586,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1645559586;s:5:\"token\";s:32:\"506f918a865353082ef614ab103a3c68\";}','localhost'),('an8l4atrfrkjbql74gehb3343l',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645560105,1645560214,0,'csrf|a:2:{s:9:\"timestamp\";i:1645560214;s:5:\"token\";s:32:\"0cf548dfcb70b3b42817f4eb943c76e6\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('e2if6f1i7aufmptfudn2dke6ic',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645561182,1645561257,0,'csrf|a:2:{s:9:\"timestamp\";i:1645561257;s:5:\"token\";s:32:\"e3f98851cb8ca21e94b0919b50c8623e\";}username|s:8:\"agallego\";','localhost'),('fdptg14tojvuak86gdh0lstgpa',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645561260,1645561432,0,'csrf|a:2:{s:9:\"timestamp\";i:1645561432;s:5:\"token\";s:32:\"29a83fa824ac340f867475fe4517f554\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('fkf59qlt9qa0q6jshtqsj51e58',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645561139,1645561180,0,'csrf|a:2:{s:9:\"timestamp\";i:1645561180;s:5:\"token\";s:32:\"3518039dbde2e7a73277e32be439bdfb\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('fnat15jrmkv1rv79mtjpksl85h',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645559819,1645559978,0,'csrf|a:2:{s:9:\"timestamp\";i:1645559978;s:5:\"token\";s:32:\"89d05775b9c5e4ce333b9a62e40582f7\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('fp67msmslp6qqh67ccmc0uc4lu',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645560781,1645560932,0,'csrf|a:2:{s:9:\"timestamp\";i:1645560932;s:5:\"token\";s:32:\"16aa9684fa20b0d1493581487509be13\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('fvue71mkk3ca7jalcpgmb19tbg',27,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645560485,1645560547,0,'csrf|a:2:{s:9:\"timestamp\";i:1645560546;s:5:\"token\";s:32:\"10c99ab1bf034b4646a3e66f53d58f45\";}username|s:7:\"jbrower\";userId|i:27;','localhost'),('h1is0prg4vvuib785a45nnc86p',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645560216,1645560362,0,'csrf|a:2:{s:9:\"timestamp\";i:1645560362;s:5:\"token\";s:32:\"6eb7a0f84b47f5f245d148f93af0d3f7\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('h4genrhtca85emn68apu5hqv3f',21,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645559778,1645559817,0,'csrf|a:2:{s:9:\"timestamp\";i:1645559817;s:5:\"token\";s:32:\"11c5bd0ce21929f4c30465676521c616\";}username|s:10:\"bbarnetson\";userId|i:21;','localhost'),('i71c82b3q0t2tab7kd007v271i',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645559238,1645559242,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1645559242;s:5:\"token\";s:32:\"1dda02faa813a83ebb8d85c9f9716f22\";}','localhost'),('jdaa11bqejo1s4hma40f67c0eg',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645559209,1645559222,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1645559222;s:5:\"token\";s:32:\"dc9e7e3c4e991212446eff5ef973433e\";}','localhost'),('jedefh3vnl9fppfclun29sm49j',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645559244,1645559543,0,'username|s:5:\"rvaca\";csrf|a:2:{s:9:\"timestamp\";i:1645559542;s:5:\"token\";s:32:\"2b246ea52b62b796aaa3f847047683b1\";}','localhost'),('k076s5mvn68d4fu8715hg8rr93',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645560377,1645560483,0,'csrf|a:2:{s:9:\"timestamp\";i:1645560483;s:5:\"token\";s:32:\"2b2b6a0428ab6c81a4cd5472d91924d8\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('ki6f1uqmoi8um6uvte6tgbjiji',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645559228,1645559237,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1645559238;s:5:\"token\";s:32:\"0adc19b07319ade6f6a7468d9e975d30\";}','localhost'),('mppavfggi7mhqh086scie0s4lv',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645559982,1645560102,0,'csrf|a:2:{s:9:\"timestamp\";i:1645560102;s:5:\"token\";s:32:\"27a639c17ec8830ddd53745727e67e4e\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('p4cks7u6qe2u0s0fu8dqf4uahd',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645559195,1645559208,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1645559209;s:5:\"token\";s:32:\"b040992a7d6629025e90372c45903cc2\";}','localhost'),('q1v7i41ipmho1rig4km43fkbmr',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645559223,1645559228,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1645559228;s:5:\"token\";s:32:\"f66ee63cf724cb211c08787d2ace2a4d\";}','localhost'),('s7e0hejbksjf0vbvt7e3ejmvq1',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645560643,1645560778,0,'csrf|a:2:{s:9:\"timestamp\";i:1645560778;s:5:\"token\";s:32:\"a33657275c42ab91979eda02b9d5ddcd\";}username|s:7:\"phudson\";','localhost'),('s932d3d8nbrft2koon2rv4b0oc',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/97.0.4692.99 Safari/537.36',1645560549,1645560641,0,'csrf|a:2:{s:9:\"timestamp\";i:1645560641;s:5:\"token\";s:32:\"38e665c603fd02cc7fb8d756cf33e018\";}username|s:7:\"dbarnes\";userId|i:3;','localhost');
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
  `setting_value` text,
  UNIQUE KEY `site_settings_pkey` (`setting_name`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES ('contactEmail','en_US','pkpadmin@mailinator.com'),('contactName','en_US','Open Monograph Press'),('contactName','fr_CA','Open Monograph Press'),('themePluginPath','','default');
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
  KEY `spotlight_settings_id` (`spotlight_id`)
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
  KEY `spotlights_assoc` (`assoc_type`,`assoc_id`)
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
  KEY `stage_assignments_submission_id` (`submission_id`),
  KEY `stage_assignments_user_group_id` (`user_group_id`),
  KEY `stage_assignments_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES (1,1,13,19,'2022-02-22 19:53:15',0,0),(2,1,3,3,'2022-02-22 19:53:33',0,1),(3,1,6,14,'2022-02-22 19:53:58',0,0),(4,2,14,20,'2022-02-22 19:54:08',0,0),(5,2,3,3,'2022-02-22 19:55:45',0,1),(6,3,13,21,'2022-02-22 19:56:25',0,0),(7,3,3,3,'2022-02-22 19:56:57',0,1),(8,4,14,22,'2022-02-22 19:57:06',0,0),(9,4,3,3,'2022-02-22 19:58:14',0,1),(10,4,6,13,'2022-02-22 19:59:01',0,0),(11,4,10,15,'2022-02-22 19:59:15',0,0),(12,5,13,23,'2022-02-22 19:59:49',0,0),(13,5,3,3,'2022-02-22 20:00:25',0,1),(14,5,6,14,'2022-02-22 20:01:04',0,0),(15,5,10,16,'2022-02-22 20:01:17',0,0),(16,5,12,17,'2022-02-22 20:01:23',0,0),(17,6,14,24,'2022-02-22 20:01:52',0,0),(18,6,3,3,'2022-02-22 20:02:48',0,1),(19,6,5,6,'2022-02-22 20:03:10',1,1),(20,7,14,25,'2022-02-22 20:03:43',0,0),(21,7,3,3,'2022-02-22 20:05:23',0,1),(22,7,6,13,'2022-02-22 20:06:01',0,0),(23,8,13,3,'2022-02-22 20:06:10',0,0),(24,8,3,3,'2022-02-22 20:06:15',0,1),(25,9,14,26,'2022-02-22 20:06:23',0,0),(26,9,3,3,'2022-02-22 20:07:46',0,1),(27,10,13,27,'2022-02-22 20:08:12',0,0),(28,10,3,3,'2022-02-22 20:09:06',0,1),(29,11,13,28,'2022-02-22 20:09:16',0,0),(30,11,3,3,'2022-02-22 20:09:28',0,1),(31,12,14,29,'2022-02-22 20:10:49',0,0),(32,12,3,3,'2022-02-22 20:12:05',0,1),(33,13,14,30,'2022-02-22 20:13:07',0,0),(34,13,3,3,'2022-02-22 20:13:58',0,1),(35,14,14,31,'2022-02-22 20:15:41',0,0),(36,14,3,3,'2022-02-22 20:16:40',0,1),(37,14,6,13,'2022-02-22 20:17:31',0,0),(38,14,10,15,'2022-02-22 20:17:46',0,0),(39,14,12,18,'2022-02-22 20:17:53',0,0),(40,15,13,32,'2022-02-22 20:19:05',0,0),(41,15,3,3,'2022-02-22 20:19:26',0,1),(42,16,13,33,'2022-02-22 20:19:48',0,0),(43,16,3,3,'2022-02-22 20:20:15',0,1),(44,17,14,34,'2022-02-22 20:21:06',0,0),(45,17,3,3,'2022-02-22 20:23:17',0,1);
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
  KEY `section_editors_context_id` (`context_id`),
  KEY `subeditor_submission_group_assoc_id` (`assoc_id`,`assoc_type`),
  KEY `subeditor_submission_group_user_id` (`user_id`)
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
  UNIQUE KEY `chapter_authors_pkey` (`author_id`,`chapter_id`)
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
  KEY `submission_chapter_settings_chapter_id` (`chapter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_chapter_settings`
--

LOCK TABLES `submission_chapter_settings` WRITE;
/*!40000 ALTER TABLE `submission_chapter_settings` DISABLE KEYS */;
INSERT INTO `submission_chapter_settings` VALUES (1,'','datePublished',NULL,'string'),(1,'','isPageEnabled',NULL,'string'),(1,'','pages','','string'),(1,'en_US','abstract','','string'),(1,'en_US','subtitle','','string'),(1,'en_US','title','Choosing the Future','string'),(1,'fr_CA','abstract','','string'),(1,'fr_CA','subtitle','','string'),(1,'fr_CA','title','','string'),(2,'','datePublished',NULL,'string'),(2,'','isPageEnabled',NULL,'string'),(2,'','pages','','string'),(2,'en_US','abstract','','string'),(2,'en_US','subtitle','','string'),(2,'en_US','title','Axioms','string'),(2,'fr_CA','abstract','','string'),(2,'fr_CA','subtitle','','string'),(2,'fr_CA','title','','string'),(3,'','datePublished',NULL,'string'),(3,'','isPageEnabled',NULL,'string'),(3,'','pages','','string'),(3,'en_US','abstract','','string'),(3,'en_US','subtitle','','string'),(3,'en_US','title','Paradigm Shift','string'),(3,'fr_CA','abstract','','string'),(3,'fr_CA','subtitle','','string'),(3,'fr_CA','title','','string'),(4,'','datePublished',NULL,'string'),(4,'','isPageEnabled',NULL,'string'),(4,'','pages','','string'),(4,'en_US','abstract','','string'),(4,'en_US','subtitle','','string'),(4,'en_US','title','Critical History in Western Canada 1900–2000','string'),(4,'fr_CA','abstract','','string'),(4,'fr_CA','subtitle','','string'),(4,'fr_CA','title','','string'),(5,'','datePublished',NULL,'string'),(5,'','isPageEnabled',NULL,'string'),(5,'','pages','','string'),(5,'en_US','abstract','','string'),(5,'en_US','subtitle','','string'),(5,'en_US','title','Vernacular Currents in Western Canadian Historiography: The Passion and Prose of Katherine Hughes, F.G. Roe, and Roy Ito','string'),(5,'fr_CA','abstract','','string'),(5,'fr_CA','subtitle','','string'),(5,'fr_CA','title','','string'),(6,'','datePublished',NULL,'string'),(6,'','isPageEnabled',NULL,'string'),(6,'','pages','','string'),(6,'en_US','abstract','','string'),(6,'en_US','subtitle','','string'),(6,'en_US','title','Cree Intellectual Traditions in History','string'),(6,'fr_CA','abstract','','string'),(6,'fr_CA','subtitle','','string'),(6,'fr_CA','title','','string'),(7,'','datePublished',NULL,'string'),(7,'','isPageEnabled',NULL,'string'),(7,'','pages','','string'),(7,'en_US','abstract','','string'),(7,'en_US','subtitle','','string'),(7,'en_US','title','Visualizing Space, Race, and History in the North: Photographic Narratives of the Athabasca-Mackenzie River Basin','string'),(7,'fr_CA','abstract','','string'),(7,'fr_CA','subtitle','','string'),(7,'fr_CA','title','','string'),(8,'','datePublished',NULL,'string'),(8,'','isPageEnabled',NULL,'string'),(8,'','pages','','string'),(8,'en_US','abstract','','string'),(8,'en_US','subtitle','','string'),(8,'en_US','title','Introduction','string'),(8,'fr_CA','abstract','','string'),(8,'fr_CA','subtitle','','string'),(8,'fr_CA','title','','string'),(9,'','datePublished',NULL,'string'),(9,'','isPageEnabled',NULL,'string'),(9,'','pages','','string'),(9,'en_US','abstract','','string'),(9,'en_US','subtitle','','string'),(9,'en_US','title','Part One. Employment Relationships in Canada','string'),(9,'fr_CA','abstract','','string'),(9,'fr_CA','subtitle','','string'),(9,'fr_CA','title','','string'),(10,'','datePublished',NULL,'string'),(10,'','isPageEnabled',NULL,'string'),(10,'','pages','','string'),(10,'en_US','abstract','','string'),(10,'en_US','subtitle','','string'),(10,'en_US','title','Part Two. Preventing Workplace Injury','string'),(10,'fr_CA','abstract','','string'),(10,'fr_CA','subtitle','','string'),(10,'fr_CA','title','','string'),(11,'','datePublished',NULL,'string'),(11,'','isPageEnabled',NULL,'string'),(11,'','pages','','string'),(11,'en_US','abstract','','string'),(11,'en_US','subtitle','','string'),(11,'en_US','title','Part Three. Critique of OHS in Canada','string'),(11,'fr_CA','abstract','','string'),(11,'fr_CA','subtitle','','string'),(11,'fr_CA','title','','string'),(12,'','datePublished',NULL,'string'),(12,'','isPageEnabled',NULL,'string'),(12,'','pages','','string'),(12,'en_US','abstract','','string'),(12,'en_US','subtitle','','string'),(12,'en_US','title','Part Four. Political Economy of Preventing Workplace Injury','string'),(12,'fr_CA','abstract','','string'),(12,'fr_CA','subtitle','','string'),(12,'fr_CA','title','','string'),(13,'','datePublished',NULL,'string'),(13,'','isPageEnabled',NULL,'string'),(13,'','pages','','string'),(13,'en_US','abstract','','string'),(13,'en_US','subtitle','','string'),(13,'en_US','title','Introduction: Contexts of Popular Culture','string'),(13,'fr_CA','abstract','','string'),(13,'fr_CA','subtitle','','string'),(13,'fr_CA','title','','string'),(14,'','datePublished',NULL,'string'),(14,'','isPageEnabled',NULL,'string'),(14,'','pages','','string'),(14,'en_US','abstract','','string'),(14,'en_US','subtitle','','string'),(14,'en_US','title','Chapter 1. A Future for Media Studies: Cultural Labour, Cultural Relations, Cultural Politics','string'),(14,'fr_CA','abstract','','string'),(14,'fr_CA','subtitle','','string'),(14,'fr_CA','title','','string'),(15,'','datePublished',NULL,'string'),(15,'','isPageEnabled',NULL,'string'),(15,'','pages','','string'),(15,'en_US','abstract','','string'),(15,'en_US','subtitle','','string'),(15,'en_US','title','Chapter 2. Log On, Goof Off, and Look Up: Facebook and the Rhythms of Canadian Internet Use','string'),(15,'fr_CA','abstract','','string'),(15,'fr_CA','subtitle','','string'),(15,'fr_CA','title','','string'),(16,'','datePublished',NULL,'string'),(16,'','isPageEnabled',NULL,'string'),(16,'','pages','','string'),(16,'en_US','abstract','','string'),(16,'en_US','subtitle','','string'),(16,'en_US','title','Chapter 3. Hawkers and Public Space: Free Commuter Newspapers in Canada','string'),(16,'fr_CA','abstract','','string'),(16,'fr_CA','subtitle','','string'),(16,'fr_CA','title','','string'),(17,'','datePublished',NULL,'string'),(17,'','isPageEnabled',NULL,'string'),(17,'','pages','','string'),(17,'en_US','abstract','','string'),(17,'en_US','subtitle','','string'),(17,'en_US','title','Prologue','string'),(17,'fr_CA','abstract','','string'),(17,'fr_CA','subtitle','','string'),(17,'fr_CA','title','','string'),(18,'','datePublished',NULL,'string'),(18,'','isPageEnabled',NULL,'string'),(18,'','pages','','string'),(18,'en_US','abstract','','string'),(18,'en_US','subtitle','','string'),(18,'en_US','title','Chapter 1: The First Five Years: 1867-1872','string'),(18,'fr_CA','abstract','','string'),(18,'fr_CA','subtitle','','string'),(18,'fr_CA','title','','string'),(19,'','datePublished',NULL,'string'),(19,'','isPageEnabled',NULL,'string'),(19,'','pages','','string'),(19,'en_US','abstract','','string'),(19,'en_US','subtitle','','string'),(19,'en_US','title','Chapter 2: Free Trade or \"Freedom\": 1911','string'),(19,'fr_CA','abstract','','string'),(19,'fr_CA','subtitle','','string'),(19,'fr_CA','title','','string'),(20,'','datePublished',NULL,'string'),(20,'','isPageEnabled',NULL,'string'),(20,'','pages','','string'),(20,'en_US','abstract','','string'),(20,'en_US','subtitle','','string'),(20,'en_US','title','Chapter 3: Castro, Nukes & the Cold War: 1953-1968','string'),(20,'fr_CA','abstract','','string'),(20,'fr_CA','subtitle','','string'),(20,'fr_CA','title','','string'),(21,'','datePublished',NULL,'string'),(21,'','isPageEnabled',NULL,'string'),(21,'','pages','','string'),(21,'en_US','abstract','','string'),(21,'en_US','subtitle','','string'),(21,'en_US','title','Chapter 4: Enter the Intellect: 1968-1984','string'),(21,'fr_CA','abstract','','string'),(21,'fr_CA','subtitle','','string'),(21,'fr_CA','title','','string'),(22,'','datePublished',NULL,'string'),(22,'','isPageEnabled',NULL,'string'),(22,'','pages','','string'),(22,'en_US','abstract','','string'),(22,'en_US','subtitle','','string'),(22,'en_US','title','Epilogue','string'),(22,'fr_CA','abstract','','string'),(22,'fr_CA','subtitle','','string'),(22,'fr_CA','title','','string'),(23,'','datePublished',NULL,'string'),(23,'','isPageEnabled',NULL,'string'),(23,'','pages','','string'),(23,'en_US','abstract','','string'),(23,'en_US','subtitle','','string'),(23,'en_US','title','Identify: Understanding Your Information Need','string'),(23,'fr_CA','abstract','','string'),(23,'fr_CA','subtitle','','string'),(23,'fr_CA','title','','string'),(24,'','datePublished',NULL,'string'),(24,'','isPageEnabled',NULL,'string'),(24,'','pages','','string'),(24,'en_US','abstract','','string'),(24,'en_US','subtitle','','string'),(24,'en_US','title','Scope: Knowing What Is Available','string'),(24,'fr_CA','abstract','','string'),(24,'fr_CA','subtitle','','string'),(24,'fr_CA','title','','string'),(25,'','datePublished',NULL,'string'),(25,'','isPageEnabled',NULL,'string'),(25,'','pages','','string'),(25,'en_US','abstract','','string'),(25,'en_US','subtitle','','string'),(25,'en_US','title','Plan: Developing Research Strategies','string'),(25,'fr_CA','abstract','','string'),(25,'fr_CA','subtitle','','string'),(25,'fr_CA','title','','string'),(26,'','datePublished',NULL,'string'),(26,'','isPageEnabled',NULL,'string'),(26,'','pages','','string'),(26,'en_US','abstract','','string'),(26,'en_US','subtitle','','string'),(26,'en_US','title','Gather: Finding What You Need','string'),(26,'fr_CA','abstract','','string'),(26,'fr_CA','subtitle','','string'),(26,'fr_CA','title','','string'),(27,'','datePublished',NULL,'string'),(27,'','isPageEnabled',NULL,'string'),(27,'','pages','','string'),(27,'en_US','abstract','','string'),(27,'en_US','subtitle','','string'),(27,'en_US','title','Introduction','string'),(27,'fr_CA','abstract','','string'),(27,'fr_CA','subtitle','','string'),(27,'fr_CA','title','','string'),(28,'','datePublished',NULL,'string'),(28,'','isPageEnabled',NULL,'string'),(28,'','pages','','string'),(28,'en_US','abstract','','string'),(28,'en_US','subtitle','','string'),(28,'en_US','title','Chapter 1: Interactions Affording Distance Science Education','string'),(28,'fr_CA','abstract','','string'),(28,'fr_CA','subtitle','','string'),(28,'fr_CA','title','','string'),(29,'','datePublished',NULL,'string'),(29,'','isPageEnabled',NULL,'string'),(29,'','pages','','string'),(29,'en_US','abstract','','string'),(29,'en_US','subtitle','','string'),(29,'en_US','title','Chapter 2: Learning Science at a Distance: Instructional Dialogues and Resources','string'),(29,'fr_CA','abstract','','string'),(29,'fr_CA','subtitle','','string'),(29,'fr_CA','title','','string'),(30,'','datePublished',NULL,'string'),(30,'','isPageEnabled',NULL,'string'),(30,'','pages','','string'),(30,'en_US','abstract','','string'),(30,'en_US','subtitle','','string'),(30,'en_US','title','Chapter 3: Leadership Strategies for Coordinating Distance Education Instructional Development Teams','string'),(30,'fr_CA','abstract','','string'),(30,'fr_CA','subtitle','','string'),(30,'fr_CA','title','','string'),(31,'','datePublished',NULL,'string'),(31,'','isPageEnabled',NULL,'string'),(31,'','pages','','string'),(31,'en_US','abstract','','string'),(31,'en_US','subtitle','','string'),(31,'en_US','title','Chapter 4: Toward New Models of Flexible Education to Enhance Quality in Australian Higher Education','string'),(31,'fr_CA','abstract','','string'),(31,'fr_CA','subtitle','','string'),(31,'fr_CA','title','','string'),(32,'','datePublished',NULL,'string'),(32,'','isPageEnabled',NULL,'string'),(32,'','pages','','string'),(32,'en_US','abstract','','string'),(32,'en_US','subtitle','','string'),(32,'en_US','title','Internet, openness and the future of the information society in LAC','string'),(32,'fr_CA','abstract','','string'),(32,'fr_CA','subtitle','','string'),(32,'fr_CA','title','','string'),(33,'','datePublished',NULL,'string'),(33,'','isPageEnabled',NULL,'string'),(33,'','pages','','string'),(33,'en_US','abstract','','string'),(33,'en_US','subtitle','','string'),(33,'en_US','title','Imagining the Internet: Open, closed or in between?','string'),(33,'fr_CA','abstract','','string'),(33,'fr_CA','subtitle','','string'),(33,'fr_CA','title','','string'),(34,'','datePublished',NULL,'string'),(34,'','isPageEnabled',NULL,'string'),(34,'','pages','','string'),(34,'en_US','abstract','','string'),(34,'en_US','subtitle','','string'),(34,'en_US','title','The internet in LAC will remain free, public and open over the next 10 years','string'),(34,'fr_CA','abstract','','string'),(34,'fr_CA','subtitle','','string'),(34,'fr_CA','title','','string'),(35,'','datePublished',NULL,'string'),(35,'','isPageEnabled',NULL,'string'),(35,'','pages','','string'),(35,'en_US','abstract','','string'),(35,'en_US','subtitle','','string'),(35,'en_US','title','Free Internet?','string'),(35,'fr_CA','abstract','','string'),(35,'fr_CA','subtitle','','string'),(35,'fr_CA','title','','string'),(36,'','datePublished',NULL,'string'),(36,'','isPageEnabled',NULL,'string'),(36,'','pages','','string'),(36,'en_US','abstract','','string'),(36,'en_US','subtitle','','string'),(36,'en_US','title','Risks and challenges for freedom of expression on the internet','string'),(36,'fr_CA','abstract','','string'),(36,'fr_CA','subtitle','','string'),(36,'fr_CA','title','','string'),(37,'','datePublished',NULL,'string'),(37,'','isPageEnabled',NULL,'string'),(37,'','pages','','string'),(37,'en_US','abstract','','string'),(37,'en_US','subtitle','','string'),(37,'en_US','title','Introduction','string'),(37,'fr_CA','abstract','','string'),(37,'fr_CA','subtitle','','string'),(37,'fr_CA','title','','string'),(38,'','datePublished',NULL,'string'),(38,'','isPageEnabled',NULL,'string'),(38,'','pages','','string'),(38,'en_US','abstract','','string'),(38,'en_US','subtitle','','string'),(38,'en_US','title','CHAPTER ONE: Where the Buffalo Roamed','string'),(38,'fr_CA','abstract','','string'),(38,'fr_CA','subtitle','','string'),(38,'fr_CA','title','','string'),(39,'','datePublished',NULL,'string'),(39,'','isPageEnabled',NULL,'string'),(39,'','pages','','string'),(39,'en_US','abstract','','string'),(39,'en_US','subtitle','','string'),(39,'en_US','title','CHAPTER TWO: Bison Conservation and Buffalo National Park','string'),(39,'fr_CA','abstract','','string'),(39,'fr_CA','subtitle','','string'),(39,'fr_CA','title','','string'),(40,'','datePublished',NULL,'string'),(40,'','isPageEnabled',NULL,'string'),(40,'','pages','','string'),(40,'en_US','abstract','','string'),(40,'en_US','subtitle','','string'),(40,'en_US','title','CHAPTER THREE: A Well-Run Ranch','string'),(40,'fr_CA','abstract','','string'),(40,'fr_CA','subtitle','','string'),(40,'fr_CA','title','','string'),(41,'','datePublished',NULL,'string'),(41,'','isPageEnabled',NULL,'string'),(41,'','pages','','string'),(41,'en_US','abstract','','string'),(41,'en_US','subtitle','','string'),(41,'en_US','title','CHAPTER FOUR: Zookeepers and Animal Breeders','string'),(41,'fr_CA','abstract','','string'),(41,'fr_CA','subtitle','','string'),(41,'fr_CA','title','','string'),(42,'','datePublished',NULL,'string'),(42,'','isPageEnabled',NULL,'string'),(42,'','pages','','string'),(42,'en_US','abstract','','string'),(42,'en_US','subtitle','','string'),(42,'en_US','title','CHAPTER FIVE: \"Evolving the Arctic Cow\"','string'),(42,'fr_CA','abstract','','string'),(42,'fr_CA','subtitle','','string'),(42,'fr_CA','title','','string'),(43,'','datePublished',NULL,'string'),(43,'','isPageEnabled',NULL,'string'),(43,'','pages','','string'),(43,'en_US','abstract','','string'),(43,'en_US','subtitle','','string'),(43,'en_US','title','CONCLUSION: The Forgotten Park','string'),(43,'fr_CA','abstract','','string'),(43,'fr_CA','subtitle','','string'),(43,'fr_CA','title','','string'),(44,'','datePublished',NULL,'string'),(44,'','isPageEnabled',NULL,'string'),(44,'','pages','','string'),(44,'en_US','abstract','','string'),(44,'en_US','subtitle','','string'),(44,'en_US','title','Bibliography','string'),(44,'fr_CA','abstract','','string'),(44,'fr_CA','subtitle','','string'),(44,'fr_CA','title','','string'),(45,'','datePublished',NULL,'string'),(45,'','isPageEnabled',NULL,'string'),(45,'','pages','','string'),(45,'en_US','abstract','','string'),(45,'en_US','subtitle','','string'),(45,'en_US','title','Index','string'),(45,'fr_CA','abstract','','string'),(45,'fr_CA','subtitle','','string'),(45,'fr_CA','title','','string'),(46,'','datePublished',NULL,'string'),(46,'','isPageEnabled',NULL,'string'),(46,'','pages','','string'),(46,'en_US','abstract','','string'),(46,'en_US','subtitle','','string'),(46,'en_US','title','Introduction','string'),(46,'fr_CA','abstract','','string'),(46,'fr_CA','subtitle','','string'),(46,'fr_CA','title','','string'),(47,'','datePublished',NULL,'string'),(47,'','isPageEnabled',NULL,'string'),(47,'','pages','','string'),(47,'en_US','abstract','','string'),(47,'en_US','subtitle','','string'),(47,'en_US','title','Poems','string'),(47,'fr_CA','abstract','','string'),(47,'fr_CA','subtitle','','string'),(47,'fr_CA','title','','string'),(48,'','datePublished',NULL,'string'),(48,'','isPageEnabled',NULL,'string'),(48,'','pages','','string'),(48,'en_US','abstract','','string'),(48,'en_US','subtitle','','string'),(48,'en_US','title','Catalyzing Access through Social and Technical Innovation','string'),(48,'fr_CA','abstract','','string'),(48,'fr_CA','subtitle','','string'),(48,'fr_CA','title','','string'),(49,'','datePublished',NULL,'string'),(49,'','isPageEnabled',NULL,'string'),(49,'','pages','','string'),(49,'en_US','abstract','','string'),(49,'en_US','subtitle','','string'),(49,'en_US','title','Catalyzing Access via Telecommunications Policy','string'),(49,'fr_CA','abstract','','string'),(49,'fr_CA','subtitle','','string'),(49,'fr_CA','title','','string'),(50,'','datePublished',NULL,'string'),(50,'','isPageEnabled',NULL,'string'),(50,'','pages','','string'),(50,'en_US','abstract','','string'),(50,'en_US','subtitle','','string'),(50,'en_US','title','Access to Knowledge as a New Paradigm for Research on ICTs and Intellectual Property','string'),(50,'fr_CA','abstract','','string'),(50,'fr_CA','subtitle','','string'),(50,'fr_CA','title','','string'),(51,'','datePublished',NULL,'string'),(51,'','isPageEnabled',NULL,'string'),(51,'','pages','','string'),(51,'en_US','abstract','','string'),(51,'en_US','subtitle','','string'),(51,'en_US','title','Current State of Mobile Learning','string'),(51,'fr_CA','abstract','','string'),(51,'fr_CA','subtitle','','string'),(51,'fr_CA','title','','string'),(52,'','datePublished',NULL,'string'),(52,'','isPageEnabled',NULL,'string'),(52,'','pages','','string'),(52,'en_US','abstract','','string'),(52,'en_US','subtitle','','string'),(52,'en_US','title','A Model for Framing Mobile Learning','string'),(52,'fr_CA','abstract','','string'),(52,'fr_CA','subtitle','','string'),(52,'fr_CA','title','','string'),(53,'','datePublished',NULL,'string'),(53,'','isPageEnabled',NULL,'string'),(53,'','pages','','string'),(53,'en_US','abstract','','string'),(53,'en_US','subtitle','','string'),(53,'en_US','title','Mobile Distance Learning with PDAs: Development and Testing of Pedagogical and System Solutions Supporting Mobile Distance Learners','string'),(53,'fr_CA','abstract','','string'),(53,'fr_CA','subtitle','','string'),(53,'fr_CA','title','','string'),(54,'','datePublished',NULL,'string'),(54,'','isPageEnabled',NULL,'string'),(54,'','pages','','string'),(54,'en_US','abstract','','string'),(54,'en_US','subtitle','','string'),(54,'en_US','title','Chapter 1: Mind Control—Internal or External?','string'),(54,'fr_CA','abstract','','string'),(54,'fr_CA','subtitle','','string'),(54,'fr_CA','title','','string'),(55,'','datePublished',NULL,'string'),(55,'','isPageEnabled',NULL,'string'),(55,'','pages','','string'),(55,'en_US','abstract','','string'),(55,'en_US','subtitle','','string'),(55,'en_US','title','Chapter 2: Classical Music and the Classical Mind','string'),(55,'fr_CA','abstract','','string'),(55,'fr_CA','subtitle','','string'),(55,'fr_CA','title','','string'),(56,'','datePublished',NULL,'string'),(56,'','isPageEnabled',NULL,'string'),(56,'','pages','','string'),(56,'en_US','abstract','','string'),(56,'en_US','subtitle','','string'),(56,'en_US','title','Chapter 3: Situated Cognition and Bricolage','string'),(56,'fr_CA','abstract','','string'),(56,'fr_CA','subtitle','','string'),(56,'fr_CA','title','','string'),(57,'','datePublished',NULL,'string'),(57,'','isPageEnabled',NULL,'string'),(57,'','pages','','string'),(57,'en_US','abstract','','string'),(57,'en_US','subtitle','','string'),(57,'en_US','title','Chapter 4: Braitenberg’s Vehicle 2','string'),(57,'fr_CA','abstract','','string'),(57,'fr_CA','subtitle','','string'),(57,'fr_CA','title','','string'),(58,'','datePublished',NULL,'string'),(58,'','isPageEnabled',NULL,'string'),(58,'','pages','','string'),(58,'en_US','abstract','','string'),(58,'en_US','subtitle','','string'),(58,'en_US','title','Setting the Stage','string'),(58,'fr_CA','abstract','','string'),(58,'fr_CA','subtitle','','string'),(58,'fr_CA','title','','string'),(59,'','datePublished',NULL,'string'),(59,'','isPageEnabled',NULL,'string'),(59,'','pages','','string'),(59,'en_US','abstract','','string'),(59,'en_US','subtitle','','string'),(59,'en_US','title','Going It Alone, 1945-1954','string'),(59,'fr_CA','abstract','','string'),(59,'fr_CA','subtitle','','string'),(59,'fr_CA','title','','string'),(60,'','datePublished',NULL,'string'),(60,'','isPageEnabled',NULL,'string'),(60,'','pages','','string'),(60,'en_US','abstract','','string'),(60,'en_US','subtitle','','string'),(60,'en_US','title','Establishing the Pattern, 1955-1962','string'),(60,'fr_CA','abstract','','string'),(60,'fr_CA','subtitle','','string'),(60,'fr_CA','title','','string'),(61,'','datePublished',NULL,'string'),(61,'','isPageEnabled',NULL,'string'),(61,'','pages','','string'),(61,'en_US','abstract','','string'),(61,'en_US','subtitle','','string'),(61,'en_US','title','Foreward','string'),(61,'fr_CA','abstract','','string'),(61,'fr_CA','subtitle','','string'),(61,'fr_CA','title','','string'),(62,'','datePublished',NULL,'string'),(62,'','isPageEnabled',NULL,'string'),(62,'','pages','','string'),(62,'en_US','abstract','','string'),(62,'en_US','subtitle','','string'),(62,'en_US','title','Preface','string'),(62,'fr_CA','abstract','','string'),(62,'fr_CA','subtitle','','string'),(62,'fr_CA','title','','string'),(63,'','datePublished',NULL,'string'),(63,'','isPageEnabled',NULL,'string'),(63,'','pages','','string'),(63,'en_US','abstract','','string'),(63,'en_US','subtitle','','string'),(63,'en_US','title','The Case Studies','string'),(63,'fr_CA','abstract','','string'),(63,'fr_CA','subtitle','','string'),(63,'fr_CA','title','','string'),(64,'','datePublished',NULL,'string'),(64,'','isPageEnabled',NULL,'string'),(64,'','pages','','string'),(64,'en_US','abstract','','string'),(64,'en_US','subtitle','','string'),(64,'en_US','title','Conclusion','string'),(64,'fr_CA','abstract','','string'),(64,'fr_CA','subtitle','','string'),(64,'fr_CA','title','','string'),(65,'','datePublished',NULL,'string'),(65,'','isPageEnabled',NULL,'string'),(65,'','pages','','string'),(65,'en_US','abstract','','string'),(65,'en_US','subtitle','','string'),(65,'en_US','title','Bibliography','string'),(65,'fr_CA','abstract','','string'),(65,'fr_CA','subtitle','','string'),(65,'fr_CA','title','','string'),(66,'','datePublished',NULL,'string'),(66,'','isPageEnabled',NULL,'string'),(66,'','pages','','string'),(66,'en_US','abstract','','string'),(66,'en_US','subtitle','','string'),(66,'en_US','title','Preface','string'),(66,'fr_CA','abstract','','string'),(66,'fr_CA','subtitle','','string'),(66,'fr_CA','title','','string'),(67,'','datePublished',NULL,'string'),(67,'','isPageEnabled',NULL,'string'),(67,'','pages','','string'),(67,'en_US','abstract','','string'),(67,'en_US','subtitle','','string'),(67,'en_US','title','Introduction','string'),(67,'fr_CA','abstract','','string'),(67,'fr_CA','subtitle','','string'),(67,'fr_CA','title','','string'),(68,'','datePublished',NULL,'string'),(68,'','isPageEnabled',NULL,'string'),(68,'','pages','','string'),(68,'en_US','abstract','','string'),(68,'en_US','subtitle','','string'),(68,'en_US','title','The Emergence of Open Development in a Network Society','string'),(68,'fr_CA','abstract','','string'),(68,'fr_CA','subtitle','','string'),(68,'fr_CA','title','','string'),(69,'','datePublished',NULL,'string'),(69,'','isPageEnabled',NULL,'string'),(69,'','pages','','string'),(69,'en_US','abstract','','string'),(69,'en_US','subtitle','','string'),(69,'en_US','title','Enacting Openness in ICT4D Research','string'),(69,'fr_CA','abstract','','string'),(69,'fr_CA','subtitle','','string'),(69,'fr_CA','title','','string'),(70,'','datePublished',NULL,'string'),(70,'','isPageEnabled',NULL,'string'),(70,'','pages','','string'),(70,'en_US','abstract','','string'),(70,'en_US','subtitle','','string'),(70,'en_US','title','Transparency and Development: Ethical Consumption through Web 2.0 and the Internet of Things','string'),(70,'fr_CA','abstract','','string'),(70,'fr_CA','subtitle','','string'),(70,'fr_CA','title','','string'),(71,'','datePublished',NULL,'string'),(71,'','isPageEnabled',NULL,'string'),(71,'','pages','','string'),(71,'en_US','abstract','','string'),(71,'en_US','subtitle','','string'),(71,'en_US','title','Open Educational Resources: Opportunities and Challenges for the Developing World','string'),(71,'fr_CA','abstract','','string'),(71,'fr_CA','subtitle','','string'),(71,'fr_CA','title','','string');
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
  KEY `chapters_publication_id` (`publication_id`),
  KEY `submission_chapters_source_chapter_id_foreign` (`source_chapter_id`),
  KEY `submission_chapters_doi_id_foreign` (`doi_id`),
  CONSTRAINT `submission_chapters_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `submission_chapters_source_chapter_id_foreign` FOREIGN KEY (`source_chapter_id`) REFERENCES `submission_chapters` (`chapter_id`)
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
  KEY `submission_comments_submission_id` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_comments`
--

LOCK TABLES `submission_comments` WRITE;
/*!40000 ALTER TABLE `submission_comments` DISABLE KEYS */;
INSERT INTO `submission_comments` VALUES (1,1,4096,11,10,10,'','<p>I recommend that the author revise this submission.</p>','2022-02-22 20:10:12',NULL,1),(2,1,4096,11,11,12,'','<p>I recommend that the author resubmit this submission.</p>','2022-02-22 20:10:24',NULL,1),(3,1,4096,12,13,8,'','<p>I recommend declining this submission.</p>','2022-02-22 20:12:57',NULL,1),(4,1,4096,13,16,10,'','<p>I recommend requiring revisions.</p>','2022-02-22 20:14:57',NULL,1),(5,1,4096,13,18,12,'','<p>I recommend resubmitting.</p>','2022-02-22 20:15:11',NULL,1),(6,1,4096,16,21,10,'','<p>I recommend that the author revise this submission.</p>','2022-02-22 20:20:56',NULL,1);
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
  KEY `submission_file_revisions_submission_file_id_foreign` (`submission_file_id`),
  KEY `submission_file_revisions_file_id_foreign` (`file_id`),
  CONSTRAINT `submission_file_revisions_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`),
  CONSTRAINT `submission_file_revisions_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_revisions`
--

LOCK TABLES `submission_file_revisions` WRITE;
/*!40000 ALTER TABLE `submission_file_revisions` DISABLE KEYS */;
INSERT INTO `submission_file_revisions` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,11),(13,13,12),(14,14,13),(15,15,14),(16,16,15),(17,17,16),(18,18,17),(19,19,18),(20,20,19),(21,21,20),(22,22,21),(23,23,22),(24,24,23),(25,25,24),(26,26,25),(27,27,26),(28,28,27),(29,29,28),(30,30,29),(31,31,30),(32,32,31),(33,33,32),(34,34,33),(35,35,34),(36,36,35),(37,37,36),(38,38,37),(39,39,38),(40,40,39),(41,41,40),(42,42,40),(43,43,38),(44,44,39),(45,45,36),(46,46,37),(47,47,35),(48,48,41),(49,49,42),(50,50,43),(51,51,44),(52,52,45),(53,53,46),(54,54,47),(55,55,48);
/*!40000 ALTER TABLE `submission_file_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_settings`
--

DROP TABLE IF EXISTS `submission_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_file_settings` (
  `submission_file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL DEFAULT 'string' COMMENT '(bool|int|float|string|object|date)',
  UNIQUE KEY `submission_file_settings_pkey` (`submission_file_id`,`locale`,`setting_name`),
  KEY `submission_file_settings_id` (`submission_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_settings`
--

LOCK TABLES `submission_file_settings` WRITE;
/*!40000 ALTER TABLE `submission_file_settings` DISABLE KEYS */;
INSERT INTO `submission_file_settings` VALUES (1,'en_US','name','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(2,'','chapterId','4','string'),(2,'en_US','name','Critical History in Western Canada 1900–.pdf','string'),(3,'','chapterId','5','string'),(3,'en_US','name','Vernacular Currents in Western Canadian .pdf','string'),(4,'','chapterId','6','string'),(4,'en_US','name','Cree Intellectual Traditions in History.pdf','string'),(5,'','chapterId','7','string'),(5,'en_US','name','Visualizing Space, Race, and History in .pdf','string'),(6,'en_US','name','The Political Economy of Workplace Injury in Canada.pdf','string'),(7,'','chapterId','13','string'),(7,'en_US','name','Introduction: Contexts of Popular Cultur.pdf','string'),(8,'','chapterId','14','string'),(8,'en_US','name','Chapter 1. A Future for Media Studies: C.pdf','string'),(9,'','chapterId','15','string'),(9,'en_US','name','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(10,'','chapterId','16','string'),(10,'en_US','name','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(11,'en_US','name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(12,'en_US','name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(13,'','chapterId','23','string'),(13,'en_US','name','Identify: Understanding Your Information.pdf','string'),(14,'','chapterId','24','string'),(14,'en_US','name','Scope: Knowing What Is Available.pdf','string'),(15,'','chapterId','25','string'),(15,'en_US','name','Plan: Developing Research Strategies.pdf','string'),(16,'','chapterId','26','string'),(16,'en_US','name','Gather: Finding What You Need.pdf','string'),(17,'','chapterId','27','string'),(17,'en_US','name','Introduction.pdf','string'),(18,'','chapterId','28','string'),(18,'en_US','name','Chapter 1: Interactions Affording Distan.pdf','string'),(19,'','chapterId','29','string'),(19,'en_US','name','Chapter 2: Learning Science at a Distanc.pdf','string'),(20,'','chapterId','30','string'),(20,'en_US','name','Chapter 3: Leadership Strategies for Coo.pdf','string'),(21,'','chapterId','31','string'),(21,'en_US','name','Chapter 4: Toward New Models of Flexible.pdf','string'),(22,'en_US','name','Editorial.pdf','string'),(23,'','chapterId','32','string'),(23,'en_US','name','Internet, openness and the future of the.pdf','string'),(24,'','chapterId','33','string'),(24,'en_US','name','Imagining the Internet: Open, closed or .pdf','string'),(25,'','chapterId','34','string'),(25,'en_US','name','The internet in LAC will remain free, pu.pdf','string'),(26,'','chapterId','35','string'),(26,'en_US','name','Free Internet?.pdf','string'),(27,'','chapterId','36','string'),(27,'en_US','name','Risks and challenges for freedom of expr.pdf','string'),(28,'en_US','name','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(29,'en_US','name','Dreamwork.pdf','string'),(30,'','chapterId','48','string'),(30,'en_US','name','Catalyzing Access through Social and Tec.pdf','string'),(31,'','chapterId','49','string'),(31,'en_US','name','Catalyzing Access via Telecommunications.pdf','string'),(32,'','chapterId','50','string'),(32,'en_US','name','Access to Knowledge as a New Paradigm fo.pdf','string'),(33,'','chapterId','51','string'),(33,'en_US','name','Current State of Mobile Learning.pdf','string'),(34,'','chapterId','52','string'),(34,'en_US','name','A Model for Framing Mobile Learning.pdf','string'),(35,'','chapterId','53','string'),(35,'en_US','name','Mobile Distance Learning with PDAs: Deve.pdf','string'),(36,'','chapterId','54','string'),(36,'en_US','name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(37,'','chapterId','55','string'),(37,'en_US','name','Chapter 2: Classical Music and the Class.pdf','string'),(38,'','chapterId','56','string'),(38,'en_US','name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(39,'','chapterId','57','string'),(39,'en_US','name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(40,'en_US','name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(41,'en_US','name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(42,'en_US','name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(43,'','chapterId','57','string'),(43,'en_US','name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(44,'en_US','name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(45,'','chapterId','55','string'),(45,'en_US','name','Chapter 2: Classical Music and the Class.pdf','string'),(46,'','chapterId','56','string'),(46,'en_US','name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(47,'','chapterId','54','string'),(47,'en_US','name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(48,'en_US','name','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(49,'en_US','name','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(50,'','chapterId','66','string'),(50,'en_US','name','Preface.pdf','string'),(51,'','chapterId','67','string'),(51,'en_US','name','Introduction.pdf','string'),(52,'','chapterId','68','string'),(52,'en_US','name','The Emergence of Open Development in a N.pdf','string'),(53,'','chapterId','69','string'),(53,'en_US','name','Enacting Openness in ICT4D Research.pdf','string'),(54,'','chapterId','70','string'),(54,'en_US','name','Transparency and Development: Ethical Co.pdf','string'),(55,'','chapterId','71','string'),(55,'en_US','name','Open Educational Resources: Opportunitie.pdf','string');
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
  `source_submission_file_id` bigint(20) DEFAULT NULL,
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
  KEY `submission_files_stage_assoc` (`file_stage`,`assoc_type`,`assoc_id`),
  KEY `submission_files_file_id_foreign` (`file_id`),
  KEY `submission_files_doi_id_foreign` (`doi_id`),
  CONSTRAINT `submission_files_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `submission_files_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (1,1,1,NULL,3,2,NULL,NULL,NULL,'2022-02-22 19:53:18','2022-02-22 19:53:18',19,NULL,NULL,NULL),(2,2,2,NULL,4,2,NULL,NULL,NULL,'2022-02-22 19:54:10','2022-02-22 19:54:11',20,NULL,NULL,NULL),(3,2,3,NULL,4,2,NULL,NULL,NULL,'2022-02-22 19:54:11','2022-02-22 19:54:11',20,NULL,NULL,NULL),(4,2,4,NULL,4,2,NULL,NULL,NULL,'2022-02-22 19:54:11','2022-02-22 19:54:11',20,NULL,NULL,NULL),(5,2,5,NULL,4,2,NULL,NULL,NULL,'2022-02-22 19:54:12','2022-02-22 19:54:12',20,NULL,NULL,NULL),(6,3,6,NULL,3,2,NULL,NULL,NULL,'2022-02-22 19:56:28','2022-02-22 19:56:28',21,NULL,NULL,NULL),(7,4,7,NULL,4,2,NULL,NULL,NULL,'2022-02-22 19:57:08','2022-02-22 19:57:09',22,NULL,NULL,NULL),(8,4,8,NULL,4,2,NULL,NULL,NULL,'2022-02-22 19:57:09','2022-02-22 19:57:09',22,NULL,NULL,NULL),(9,4,9,NULL,4,2,NULL,NULL,NULL,'2022-02-22 19:57:09','2022-02-22 19:57:09',22,NULL,NULL,NULL),(10,4,10,NULL,4,2,NULL,NULL,NULL,'2022-02-22 19:57:10','2022-02-22 19:57:10',22,NULL,NULL,NULL),(11,5,11,NULL,3,2,NULL,NULL,NULL,'2022-02-22 19:59:51','2022-02-22 19:59:51',23,NULL,NULL,NULL),(12,5,11,11,3,10,'0','openAccess',1,'2022-02-22 20:01:32','2022-02-22 20:01:40',23,521,2,NULL),(13,6,12,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:01:54','2022-02-22 20:01:54',24,NULL,NULL,NULL),(14,6,13,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:01:55','2022-02-22 20:01:55',24,NULL,NULL,NULL),(15,6,14,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:01:55','2022-02-22 20:01:55',24,NULL,NULL,NULL),(16,6,15,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:01:56','2022-02-22 20:01:56',24,NULL,NULL,NULL),(17,7,16,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:03:45','2022-02-22 20:03:45',25,NULL,NULL,NULL),(18,7,17,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:03:45','2022-02-22 20:03:45',25,NULL,NULL,NULL),(19,7,18,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:03:46','2022-02-22 20:03:46',25,NULL,NULL,NULL),(20,7,19,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:03:46','2022-02-22 20:03:46',25,NULL,NULL,NULL),(21,7,20,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:03:47','2022-02-22 20:03:47',25,NULL,NULL,NULL),(22,8,21,NULL,3,2,NULL,NULL,NULL,'2022-02-22 20:06:12','2022-02-22 20:06:13',3,NULL,NULL,NULL),(23,9,22,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:06:25','2022-02-22 20:06:26',26,NULL,NULL,NULL),(24,9,23,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:06:26','2022-02-22 20:06:26',26,NULL,NULL,NULL),(25,9,24,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:06:26','2022-02-22 20:06:27',26,NULL,NULL,NULL),(26,9,25,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:06:27','2022-02-22 20:06:27',26,NULL,NULL,NULL),(27,9,26,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:06:27','2022-02-22 20:06:27',26,NULL,NULL,NULL),(28,10,27,NULL,3,2,NULL,NULL,NULL,'2022-02-22 20:08:14','2022-02-22 20:08:14',27,NULL,NULL,NULL),(29,11,28,NULL,3,2,NULL,NULL,NULL,'2022-02-22 20:09:18','2022-02-22 20:09:18',28,NULL,NULL,NULL),(30,12,29,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:10:51','2022-02-22 20:10:51',29,NULL,NULL,NULL),(31,12,30,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:10:52','2022-02-22 20:10:52',29,NULL,NULL,NULL),(32,12,31,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:10:52','2022-02-22 20:10:52',29,NULL,NULL,NULL),(33,13,32,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:13:10','2022-02-22 20:13:10',30,NULL,NULL,NULL),(34,13,33,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:13:10','2022-02-22 20:13:11',30,NULL,NULL,NULL),(35,13,34,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:13:11','2022-02-22 20:13:11',30,NULL,NULL,NULL),(36,14,35,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:15:43','2022-02-22 20:15:43',31,NULL,NULL,NULL),(37,14,36,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:15:44','2022-02-22 20:15:44',31,NULL,NULL,NULL),(38,14,37,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:15:44','2022-02-22 20:15:44',31,NULL,NULL,NULL),(39,14,38,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:15:45','2022-02-22 20:15:45',31,NULL,NULL,NULL),(40,14,39,NULL,13,2,NULL,NULL,NULL,'2022-02-22 20:15:45','2022-02-22 20:15:46',31,NULL,NULL,NULL),(41,14,40,NULL,9,2,NULL,NULL,NULL,'2022-02-22 20:15:46','2022-02-22 20:15:47',31,NULL,NULL,NULL),(42,14,40,41,9,10,'0','openAccess',1,'2022-02-22 20:18:08','2022-02-22 20:18:52',31,521,3,NULL),(43,14,38,39,4,10,'0','openAccess',1,'2022-02-22 20:18:08','2022-02-22 20:18:38',31,521,3,NULL),(44,14,39,40,13,10,'0','openAccess',1,'2022-02-22 20:18:08','2022-02-22 20:18:45',31,521,3,NULL),(45,14,36,37,4,10,'0','openAccess',1,'2022-02-22 20:18:08','2022-02-22 20:18:26',31,521,3,NULL),(46,14,37,38,4,10,'0','openAccess',1,'2022-02-22 20:18:08','2022-02-22 20:18:32',31,521,3,NULL),(47,14,35,36,4,10,'0','openAccess',1,'2022-02-22 20:18:09','2022-02-22 20:18:19',31,521,3,NULL),(48,15,41,NULL,3,2,NULL,NULL,NULL,'2022-02-22 20:19:07','2022-02-22 20:19:08',32,NULL,NULL,NULL),(49,16,42,NULL,3,2,NULL,NULL,NULL,'2022-02-22 20:19:50','2022-02-22 20:19:51',33,NULL,NULL,NULL),(50,17,43,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:21:09','2022-02-22 20:21:09',34,NULL,NULL,NULL),(51,17,44,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:21:09','2022-02-22 20:21:10',34,NULL,NULL,NULL),(52,17,45,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:21:10','2022-02-22 20:21:10',34,NULL,NULL,NULL),(53,17,46,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:21:10','2022-02-22 20:21:11',34,NULL,NULL,NULL),(54,17,47,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:21:11','2022-02-22 20:21:11',34,NULL,NULL,NULL),(55,17,48,NULL,4,2,NULL,NULL,NULL,'2022-02-22 20:21:11','2022-02-22 20:21:12',34,NULL,NULL,NULL);
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
  KEY `submission_search_object_keywords_keyword_id` (`keyword_id`)
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
  KEY `submission_search_object_submission` (`submission_id`)
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
  KEY `submission_settings_submission_id` (`submission_id`)
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
  KEY `submissions_publication_id` (`current_publication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,1,1,'2022-02-22 19:53:58','2022-02-22 19:53:33','2022-02-22 19:53:51',4,'en_US',1,0,2),(2,1,2,'2022-02-22 19:56:15','2022-02-22 19:55:45','2022-02-22 19:55:57',3,'en_US',1,0,1),(3,1,3,'2022-02-22 19:56:57','2022-02-22 19:56:57','2022-02-22 19:56:57',1,'en_US',1,0,2),(4,1,4,'2022-02-22 19:59:38','2022-02-22 19:58:14','2022-02-22 19:59:04',5,'en_US',1,0,1),(5,1,5,'2022-02-22 20:01:42','2022-02-22 20:00:25','2022-02-22 20:01:42',5,'en_US',3,0,2),(6,1,6,'2022-02-22 20:03:22','2022-02-22 20:02:48','2022-02-22 20:03:00',2,'en_US',1,0,1),(7,1,7,'2022-02-22 20:06:01','2022-02-22 20:05:23','2022-02-22 20:05:50',4,'en_US',1,0,1),(8,1,8,'2022-02-22 20:06:15','2022-02-22 20:06:15','2022-02-22 20:06:15',1,'en_US',1,0,2),(9,1,9,'2022-02-22 20:07:58','2022-02-22 20:07:46','2022-02-22 20:07:58',2,'en_US',1,0,1),(10,1,10,'2022-02-22 20:09:07','2022-02-22 20:09:06','2022-02-22 20:09:06',1,'en_US',1,0,2),(11,1,11,'2022-02-22 20:10:36','2022-02-22 20:09:28','2022-02-22 20:10:36',4,'en_US',1,0,2),(12,1,12,'2022-02-22 20:12:57','2022-02-22 20:12:05','2022-02-22 20:12:35',2,'en_US',1,0,1),(13,1,13,'2022-02-22 20:15:27','2022-02-22 20:13:58','2022-02-22 20:15:27',4,'en_US',1,0,1),(14,1,14,'2022-02-22 20:18:55','2022-02-22 20:16:40','2022-02-22 20:18:55',5,'en_US',3,0,1),(15,1,15,'2022-02-22 20:19:36','2022-02-22 20:19:26','2022-02-22 20:19:36',3,'en_US',1,0,2),(16,1,16,'2022-02-22 20:20:56','2022-02-22 20:20:15','2022-02-22 20:20:33',3,'en_US',1,0,2),(17,1,17,'2022-02-22 20:23:52','2022-02-22 20:23:17','2022-02-22 20:23:32',2,'en_US',1,0,1);
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
  KEY `temporary_files_user_id` (`user_id`)
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
-- Table structure for table `usage_stats_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usage_stats_temporary_records` (
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `day` bigint(20) NOT NULL,
  `entry_time` bigint(20) NOT NULL,
  `metric` bigint(20) NOT NULL DEFAULT '1',
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `load_id` varchar(255) NOT NULL,
  `file_type` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_temporary_records`
--

LOCK TABLES `usage_stats_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_temporary_records` ENABLE KEYS */;
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
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `user_group_settings_pkey` (`user_group_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_settings`
--

LOCK TABLES `user_group_settings` WRITE;
/*!40000 ALTER TABLE `user_group_settings` DISABLE KEYS */;
INSERT INTO `user_group_settings` VALUES (1,'en_US','name','Site Admin','string'),(1,'fr_CA','name','Administrateur-trice du site','string'),(2,'','abbrevLocaleKey','default.groups.abbrev.manager','string'),(2,'','nameLocaleKey','default.groups.name.manager','string'),(2,'en_US','abbrev','PM','string'),(2,'en_US','name','Press manager','string'),(2,'fr_CA','abbrev','MP','string'),(2,'fr_CA','name','Gestionnaire de la presse','string'),(3,'','abbrevLocaleKey','default.groups.abbrev.editor','string'),(3,'','nameLocaleKey','default.groups.name.editor','string'),(3,'en_US','abbrev','PE','string'),(3,'en_US','name','Press editor','string'),(3,'fr_CA','abbrev','RP','string'),(3,'fr_CA','name','Rédacteur/Rédactrice en chef de la presse','string'),(4,'','abbrevLocaleKey','default.groups.abbrev.productionEditor','string'),(4,'','nameLocaleKey','default.groups.name.productionEditor','string'),(4,'en_US','abbrev','ProdE','string'),(4,'en_US','name','Production editor','string'),(4,'fr_CA','abbrev','DirProd','string'),(4,'fr_CA','name','Directeur-trice de production','string'),(5,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor','string'),(5,'','nameLocaleKey','default.groups.name.sectionEditor','string'),(5,'en_US','abbrev','AcqE','string'),(5,'en_US','name','Series editor','string'),(5,'fr_CA','abbrev','RS','string'),(5,'fr_CA','name','Rédacteur/Rédactrice en chef de la série','string'),(6,'','abbrevLocaleKey','default.groups.abbrev.copyeditor','string'),(6,'','nameLocaleKey','default.groups.name.copyeditor','string'),(6,'en_US','abbrev','CE','string'),(6,'en_US','name','Copyeditor','string'),(6,'fr_CA','abbrev','RÉV','string'),(6,'fr_CA','name','Réviseur-e','string'),(7,'','abbrevLocaleKey','default.groups.abbrev.designer','string'),(7,'','nameLocaleKey','default.groups.name.designer','string'),(7,'en_US','abbrev','Design','string'),(7,'en_US','name','Designer','string'),(7,'fr_CA','abbrev','Design','string'),(7,'fr_CA','name','Designer','string'),(8,'','abbrevLocaleKey','default.groups.abbrev.funding','string'),(8,'','nameLocaleKey','default.groups.name.funding','string'),(8,'en_US','abbrev','FC','string'),(8,'en_US','name','Funding coordinator','string'),(8,'fr_CA','abbrev','CF','string'),(8,'fr_CA','name','Coordonnateur-trice du financement','string'),(9,'','abbrevLocaleKey','default.groups.abbrev.indexer','string'),(9,'','nameLocaleKey','default.groups.name.indexer','string'),(9,'en_US','abbrev','IND','string'),(9,'en_US','name','Indexer','string'),(9,'fr_CA','abbrev','Indx','string'),(9,'fr_CA','name','Indexeur-e','string'),(10,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor','string'),(10,'','nameLocaleKey','default.groups.name.layoutEditor','string'),(10,'en_US','abbrev','LE','string'),(10,'en_US','name','Layout Editor','string'),(10,'fr_CA','abbrev','RespMP','string'),(10,'fr_CA','name','Responsable de la mise en page','string'),(11,'','abbrevLocaleKey','default.groups.abbrev.marketing','string'),(11,'','nameLocaleKey','default.groups.name.marketing','string'),(11,'en_US','abbrev','MS','string'),(11,'en_US','name','Marketing and sales coordinator','string'),(11,'fr_CA','abbrev','CVM','string'),(11,'fr_CA','name','Coordonnateur-trice des ventes et du marketing','string'),(12,'','abbrevLocaleKey','default.groups.abbrev.proofreader','string'),(12,'','nameLocaleKey','default.groups.name.proofreader','string'),(12,'en_US','abbrev','PR','string'),(12,'en_US','name','Proofreader','string'),(12,'fr_CA','abbrev','CorEp','string'),(12,'fr_CA','name','Correcteur-trice d\'épreuves','string'),(13,'','abbrevLocaleKey','default.groups.abbrev.author','string'),(13,'','nameLocaleKey','default.groups.name.author','string'),(13,'en_US','abbrev','AU','string'),(13,'en_US','name','Author','string'),(13,'fr_CA','abbrev','AU','string'),(13,'fr_CA','name','Auteur-e','string'),(14,'','abbrevLocaleKey','default.groups.abbrev.volumeEditor','string'),(14,'','nameLocaleKey','default.groups.name.volumeEditor','string'),(14,'','recommendOnly','0','bool'),(14,'en_US','abbrev','VE','string'),(14,'en_US','name','Volume editor','string'),(14,'fr_CA','abbrev','RV','string'),(14,'fr_CA','name','Rédacteur/Rédactrice en chef du volume','string'),(15,'','abbrevLocaleKey','default.groups.abbrev.chapterAuthor','string'),(15,'','nameLocaleKey','default.groups.name.chapterAuthor','string'),(15,'en_US','abbrev','CA','string'),(15,'en_US','name','Chapter Author','string'),(15,'fr_CA','abbrev','AC','string'),(15,'fr_CA','name','Auteur du chapitre','string'),(16,'','abbrevLocaleKey','default.groups.abbrev.translator','string'),(16,'','nameLocaleKey','default.groups.name.translator','string'),(16,'en_US','abbrev','Trans','string'),(16,'en_US','name','Translator','string'),(16,'fr_CA','abbrev','Trad','string'),(16,'fr_CA','name','Traducteur-trice','string'),(17,'','abbrevLocaleKey','default.groups.abbrev.internalReviewer','string'),(17,'','nameLocaleKey','default.groups.name.internalReviewer','string'),(17,'en_US','abbrev','IR','string'),(17,'en_US','name','Internal Reviewer','string'),(17,'fr_CA','abbrev','EvalInt','string'),(17,'fr_CA','name','Évaluateur-trice interne','string'),(18,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer','string'),(18,'','nameLocaleKey','default.groups.name.externalReviewer','string'),(18,'en_US','abbrev','ER','string'),(18,'en_US','name','External Reviewer','string'),(18,'fr_CA','abbrev','EvEx','string'),(18,'fr_CA','name','Évaluateur-trice externe','string'),(19,'','abbrevLocaleKey','default.groups.abbrev.reader','string'),(19,'','nameLocaleKey','default.groups.name.reader','string'),(19,'en_US','abbrev','Read','string'),(19,'en_US','name','Reader','string'),(19,'fr_CA','abbrev','Lect','string'),(19,'fr_CA','name','Lecteur-trice','string');
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
  KEY `user_group_stage_stage_id` (`stage_id`)
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
INSERT INTO `user_groups` VALUES (1,0,1,1,0,0,0),(2,1,16,1,0,0,1),(3,1,16,1,0,0,1),(4,1,16,1,0,0,1),(5,1,17,1,0,0,1),(6,1,4097,1,0,0,0),(7,1,4097,1,0,0,0),(8,1,4097,1,0,0,0),(9,1,4097,1,0,0,0),(10,1,4097,1,0,0,0),(11,1,4097,1,0,0,0),(12,1,4097,1,0,0,0),(13,1,65536,1,0,1,0),(14,1,65536,1,0,1,0),(15,1,65536,1,0,1,0),(16,1,65536,1,0,0,0),(17,1,4096,1,0,0,0),(18,1,4096,1,0,1,0),(19,1,1048576,1,0,1,0);
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
  UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`)
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
  `setting_value` text,
  UNIQUE KEY `user_settings_pkey` (`user_id`,`locale`,`setting_name`),
  KEY `user_settings_user_id` (`user_id`),
  KEY `user_settings_locale_setting_name_index` (`setting_name`,`locale`)
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
  KEY `user_user_groups_user_id` (`user_id`)
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
  `locales` varchar(255) DEFAULT NULL,
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
INSERT INTO `users` VALUES (1,'admin','$2y$10$o2L9/sADO2OE78984b7jNuU3Lh1Js5eE16fGUzYpulcG2cCKahrX2','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-02-22 19:46:29',NULL,'2022-02-22 19:52:49',NULL,NULL,NULL,0,NULL,1),(2,'rvaca','$2y$10$3PYvt8vJcWSELggMyg/7P..6uzZb51ndBiParMeHGMIw/CM6/YWLa','rvaca@mailinator.com','','','',NULL,'MX','[]',NULL,NULL,'2022-02-22 19:47:34',NULL,'2022-02-22 19:52:20',0,0,NULL,0,NULL,1),(3,'dbarnes','$2y$10$P5865HbjpMtwXgWh9aOxU.vKLPI9eTLI.pUi4y9R1obo4/bLQdNn.','dbarnes@mailinator.com','','','',NULL,'AU','[]',NULL,NULL,'2022-02-22 19:47:41',NULL,'2022-02-22 20:23:19',0,0,NULL,0,NULL,1),(4,'dbuskins','$2y$10$29uDf9irNg3RGzDVeKkc9O7Qj6XaH5ZEtwqA8yO.A6sHq2eNBakuC','dbuskins@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2022-02-22 19:47:53',NULL,NULL,0,0,NULL,0,NULL,1),(5,'sberardo','$2y$10$VoR5d9HsuKSoPD6Yndb5UOJ0i/p36U.Q/SuEKTMk5Yjyq.5tyNdLe','sberardo@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2022-02-22 19:48:06',NULL,NULL,0,0,NULL,0,NULL,1),(6,'minoue','$2y$10$bqbODxhFO2yds3zt2Gd9DeF5GKYO/mkIiTBlSc/Oa2F9EAmj1ZOaq','minoue@mailinator.com','','','',NULL,'JP','[]',NULL,NULL,'2022-02-22 19:48:17',NULL,'2022-02-22 20:03:13',0,0,NULL,0,NULL,1),(7,'jjanssen','$2y$10$zSj3iAqrEsksIsMKfarvne0Ki3SMRyvjX0yNypxYyehKV.GsEKVU2','jjanssen@mailinator.com','','','',NULL,'NL','[]',NULL,NULL,'2022-02-22 19:48:29',NULL,NULL,0,0,NULL,0,NULL,1),(8,'phudson','$2y$10$llkKSH/bO35URH0h2oIvpeMXbhTtfks3DJQx5BadVmuyscfMuK0Iu','phudson@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2022-02-22 19:48:42',NULL,'2022-02-22 20:12:45',0,0,NULL,0,NULL,1),(9,'amccrae','$2y$10$fs0qBa1TUdRkV0Itj/6vt.i1l71IWgEA1w7I5DQ42UG.m7xDmd0dC','amccrae@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2022-02-22 19:48:56',NULL,NULL,0,0,NULL,0,NULL,1),(10,'agallego','$2y$10$dXuQygxbVFyM1.aUnnuEe.EcqqjWxipydDqDE3ERe.JmTdq6.dhZe','agallego@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2022-02-22 19:49:13',NULL,'2022-02-22 20:20:46',0,0,NULL,0,NULL,1),(11,'alzacharia','$2y$10$C.ahGRKxdbygngfZm.DhRefZZqfVh4U9OvP6Fpc1j1.bJdofp18vq','alzacharia@mailinator.com','','','',NULL,'GH','[]',NULL,NULL,'2022-02-22 19:49:31',NULL,NULL,0,0,NULL,0,NULL,1),(12,'gfavio','$2y$10$PLp7CtVLFufWlhLZ/bSj1ePOS4jkHfBBt0e1eFIlne.CG5yOWEksa','gfavio@mailinator.com','','','',NULL,'ES','[]',NULL,NULL,'2022-02-22 19:49:47',NULL,'2022-02-22 20:14:59',0,0,NULL,0,NULL,1),(13,'mfritz','$2y$10$a2M.JdHfWf/sq3QEEXEk9.eUJ1.kDRSESHFPWSW3Wvi3U8MAgBpLO','mfritz@mailinator.com','','','',NULL,'BE','[]',NULL,NULL,'2022-02-22 19:50:06',NULL,NULL,0,0,NULL,0,NULL,1),(14,'svogt','$2y$10$K0dgtJoGFRJAySATLCUA8OL6lBiP/OkZQJKCh..MD9MevulDBGQhG','svogt@mailinator.com','','','',NULL,'CL','[]',NULL,NULL,'2022-02-22 19:50:26',NULL,NULL,0,0,NULL,0,NULL,1),(15,'gcox','$2y$10$tCyoTxoRh/0jftISrXyIcujiz18Ua5acSlFxqs6b5y9xQfJbeXwxK','gcox@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2022-02-22 19:50:46',NULL,NULL,0,0,NULL,0,NULL,1),(16,'shellier','$2y$10$mRqkPf4XslHUVFrHD8M1D.yIHBY63KxWhH6qi/BEjOwR5m4i5w8hO','shellier@mailinator.com','','','',NULL,'ZA','[]',NULL,NULL,'2022-02-22 19:51:11',NULL,NULL,0,0,NULL,0,NULL,1),(17,'cturner','$2y$10$TL9Nz0qwnDMt30qmBIsjded.fF0SRThwNnXHYB9OR3tPrc.cXDMNW','cturner@mailinator.com','','','',NULL,'GB','[]',NULL,NULL,'2022-02-22 19:51:37',NULL,NULL,0,0,NULL,0,NULL,1),(18,'skumar','$2y$10$48BchtPOTBL/M8oYoyzed.87P/J1OJJV3GkVkGnvUf.PEtfJNzwcm','skumar@mailinator.com','','','',NULL,'SG','[]',NULL,NULL,'2022-02-22 19:52:04',NULL,NULL,0,0,NULL,0,NULL,1),(19,'aclark','$2y$10$H.Or3FEaYenKjfFweyrIduhsli3Bu/u1IuXth2FcrAE/b3T8DQpwm','aclark@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-02-22 19:53:11',NULL,'2022-02-22 19:53:11',NULL,NULL,NULL,0,NULL,1),(20,'afinkel','$2y$10$rcXl9sADst1dmoAZ/7Yg/.IkRuS0QMCJ0Xs0IsFVorg5S/4azGesu','afinkel@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-02-22 19:54:04',NULL,'2022-02-22 19:54:04',NULL,NULL,NULL,0,NULL,1),(21,'bbarnetson','$2y$10$Qen1jhlm1xMmGQ9I48dVn.M/ib.lxxXV8NxU.wESngW6v4Bu4Hg9q','bbarnetson@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-02-22 19:56:21',NULL,'2022-02-22 19:56:21',NULL,NULL,NULL,0,NULL,1),(22,'bbeaty','$2y$10$OZcfg7iOswbtWozdVaIJae6PF7YatyRMFvqjVVq0mXUAkCRG5XozS','bbeaty@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-02-22 19:57:02',NULL,'2022-02-22 19:57:02',NULL,NULL,NULL,0,NULL,1),(23,'callan','$2y$10$4Slwj9s8gbQpIenHK58aiuYWUvnY8V6rm7n9IxNapVcYyo3S2Qtv6','callan@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-02-22 19:59:45',NULL,'2022-02-22 19:59:45',NULL,NULL,NULL,0,NULL,1),(24,'dbernnard','$2y$10$4V.GxPZZlDvbMAlWWkDxd.LdUsqE5a1BicE/rEgRkkVL9G5fD9/ee','dbernnard@mailinator.com',NULL,NULL,NULL,NULL,'US',NULL,NULL,NULL,'2022-02-22 20:01:48',NULL,'2022-02-22 20:01:48',NULL,NULL,NULL,0,NULL,1),(25,'dkennepohl','$2y$10$J25pNUzQylAeUjabPqaRsOzaHIr343G33GBuqdrDBx/sl3skK7z/6','dkennepohl@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-02-22 20:03:38',NULL,'2022-02-22 20:03:39',NULL,NULL,NULL,0,NULL,1),(26,'fperini','$2y$10$abAdpPVBMP4W57V1NwSOB.UiSNr6ZZEK7Mmsfn73CnXeUug9UgqyK','fperini@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-02-22 20:06:19',NULL,'2022-02-22 20:06:19',NULL,NULL,NULL,0,NULL,1),(27,'jbrower','$2y$10$Gu2iHUWJ20lfahKLKjM5CeH5soWFBMZXhI2I9aKZikbGZKvSrTKXu','jbrower@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-02-22 20:08:08',NULL,'2022-02-22 20:08:08',NULL,NULL,NULL,0,NULL,1),(28,'jlockehart','$2y$10$0IWhIOOupr5UnwDweE6LDO5AisLpJzS7/Se6que/WByvwITiWIgKK','jlockehart@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-02-22 20:09:12',NULL,'2022-02-22 20:09:12',NULL,NULL,NULL,0,NULL,1),(29,'lelder','$2y$10$F9uyGlq0cM1vpXfPkw1uUO7hMonypNjDnZ4X5ZU2lCJRYofZURiCi','lelder@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-02-22 20:10:45',NULL,'2022-02-22 20:10:45',NULL,NULL,NULL,0,NULL,1),(30,'mally','$2y$10$Qev/gTYgbkp8ZzofdultVuHaDcfj8PawCkyn6VYuQzHSFTb6jYnnG','mally@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-02-22 20:13:03',NULL,'2022-02-22 20:13:04',NULL,NULL,NULL,0,NULL,1),(31,'mdawson','$2y$10$bmknzZNex9De0ebyguld7.nVoyl2YILkU.1CkJhIhWIFPNEGU93e.','mdawson@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-02-22 20:15:37',NULL,'2022-02-22 20:15:37',NULL,NULL,NULL,0,NULL,1),(32,'mforan','$2y$10$yByJHZiPIZj6gRFB6jdq1.63t5ZFaLxYL1nvIdyY1rTOoCxMrOe4W','mforan@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-02-22 20:19:01',NULL,'2022-02-22 20:19:01',NULL,NULL,NULL,0,NULL,1),(33,'mpower','$2y$10$k7OgEzVB/N4HqLZtc2s1MuJgZDEFRG8/4YIf8W9boguqUan00TdAC','mpower@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-02-22 20:19:44',NULL,'2022-02-22 20:19:44',NULL,NULL,NULL,0,NULL,1),(34,'msmith','$2y$10$jN57nwJTiRjz8HcZzfN9ie.KPcSrTccG0YKxQcfsGWoQJc3pmjTwi','msmith@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-02-22 20:21:02',NULL,'2022-02-22 20:21:02',NULL,NULL,NULL,0,NULL,1);
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
INSERT INTO `versions` VALUES (1,0,0,0,'2022-02-22 19:46:30',1,'plugins.metadata','dc11','',0,0),(1,0,0,0,'2022-02-22 19:46:30',1,'plugins.pubIds','urn','URNPubIdPlugin',0,0),(1,0,0,0,'2022-02-22 19:46:30',1,'plugins.blocks','makeSubmission','MakeSubmissionBlockPlugin',1,0),(1,0,0,0,'2022-02-22 19:46:30',1,'plugins.blocks','browse','\\APP\\plugins\\blocks\\browse\\BrowseBlockPlugin',1,0),(1,0,0,0,'2022-02-22 19:46:30',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,0,0,0,'2022-02-22 19:46:30',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(1,0,0,0,'2022-02-22 19:46:30',1,'plugins.blocks','information','InformationBlockPlugin',1,0),(1,2,0,0,'2022-02-22 19:46:30',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(1,0,0,0,'2022-02-22 19:46:30',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(1,0,0,0,'2022-02-22 19:46:30',1,'plugins.generic','htmlMonographFile','HtmlMonographFilePlugin',1,0),(1,0,0,0,'2022-02-22 19:46:30',1,'plugins.generic','acron','',0,1),(1,0,0,0,'2022-02-22 19:46:30',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(1,0,0,0,'2022-02-22 19:46:30',1,'plugins.generic','usageStats','UsageStatsPlugin',0,1),(1,2,0,0,'2022-02-22 19:46:30',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),(1,0,0,0,'2022-02-22 19:46:30',1,'plugins.generic','dublinCoreMeta','DublinCoreMetaPlugin',1,0),(1,0,0,0,'2022-02-22 19:46:30',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,0,0,0,'2022-02-22 19:46:30',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(1,0,0,0,'2022-02-22 19:46:30',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(1,0,0,0,'2022-02-22 19:46:30',1,'plugins.generic','usageEvent','',0,1),(1,0,0,0,'2022-02-22 19:46:30',1,'plugins.themes','default','DefaultThemePlugin',1,0),(1,0,0,0,'2022-02-22 19:46:30',1,'plugins.importexport','native','',0,0),(1,0,0,0,'2022-02-22 19:46:30',1,'plugins.importexport','onix30','',0,0),(1,0,0,0,'2022-02-22 19:46:30',1,'plugins.importexport','csv','',0,0),(1,0,0,0,'2022-02-22 19:46:30',1,'plugins.importexport','users','',0,0),(1,0,0,0,'2022-02-22 19:46:30',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,0,0,0,'2022-02-22 19:46:30',1,'plugins.paymethod','paypal','',0,0),(1,0,0,0,'2022-02-22 19:46:30',1,'plugins.paymethod','manual','',0,0),(3,4,0,0,'2022-02-22 19:46:27',1,'core','omp','',0,1);
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

-- Dump completed on 2022-02-22 20:23:54
