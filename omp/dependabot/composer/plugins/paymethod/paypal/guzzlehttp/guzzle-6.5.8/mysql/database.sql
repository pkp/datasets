-- MySQL dump 10.13  Distrib 5.7.38, for Linux (x86_64)
--
-- Host: localhost    Database: omp-ci
-- ------------------------------------------------------
-- Server version	5.7.38-0ubuntu0.18.04.1

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
INSERT INTO `author_settings` VALUES (1,'','country','CA'),(1,'en_US','affiliation','University of Calgary'),(1,'en_US','familyName','Clark'),(1,'en_US','givenName','Arthur'),(2,'','country','CA'),(2,'en_US','affiliation','Athabasca University'),(2,'en_US','familyName','Finkel'),(2,'en_US','givenName','Alvin'),(3,'','country','CA'),(3,'','orcid',''),(3,'','url',''),(3,'en_US','affiliation',''),(3,'en_US','biography',''),(3,'en_US','familyName','Carter'),(3,'en_US','givenName','Sarah'),(3,'en_US','preferredPublicName',''),(3,'fr_CA','affiliation',''),(3,'fr_CA','biography',''),(3,'fr_CA','familyName',''),(3,'fr_CA','givenName',''),(3,'fr_CA','preferredPublicName',''),(4,'','country','CA'),(4,'','orcid',''),(4,'','url',''),(4,'en_US','affiliation',''),(4,'en_US','biography',''),(4,'en_US','familyName','Fortna'),(4,'en_US','givenName','Peter'),(4,'en_US','preferredPublicName',''),(4,'fr_CA','affiliation',''),(4,'fr_CA','biography',''),(4,'fr_CA','familyName',''),(4,'fr_CA','givenName',''),(4,'fr_CA','preferredPublicName',''),(5,'','country','CA'),(5,'','orcid',''),(5,'','url',''),(5,'en_US','affiliation',''),(5,'en_US','biography',''),(5,'en_US','familyName','Friesen'),(5,'en_US','givenName','Gerald'),(5,'en_US','preferredPublicName',''),(5,'fr_CA','affiliation',''),(5,'fr_CA','biography',''),(5,'fr_CA','familyName',''),(5,'fr_CA','givenName',''),(5,'fr_CA','preferredPublicName',''),(6,'','country','CA'),(6,'','orcid',''),(6,'','url',''),(6,'en_US','affiliation',''),(6,'en_US','biography',''),(6,'en_US','familyName','Dick'),(6,'en_US','givenName','Lyle'),(6,'en_US','preferredPublicName',''),(6,'fr_CA','affiliation',''),(6,'fr_CA','biography',''),(6,'fr_CA','familyName',''),(6,'fr_CA','givenName',''),(6,'fr_CA','preferredPublicName',''),(7,'','country','CA'),(7,'','orcid',''),(7,'','url',''),(7,'en_US','affiliation',''),(7,'en_US','biography',''),(7,'en_US','familyName','Wheeler'),(7,'en_US','givenName','Winona'),(7,'en_US','preferredPublicName',''),(7,'fr_CA','affiliation',''),(7,'fr_CA','biography',''),(7,'fr_CA','familyName',''),(7,'fr_CA','givenName',''),(7,'fr_CA','preferredPublicName',''),(8,'','country','CA'),(8,'','orcid',''),(8,'','url',''),(8,'en_US','affiliation',''),(8,'en_US','biography',''),(8,'en_US','familyName','Dyce'),(8,'en_US','givenName','Matt'),(8,'en_US','preferredPublicName',''),(8,'fr_CA','affiliation',''),(8,'fr_CA','biography',''),(8,'fr_CA','familyName',''),(8,'fr_CA','givenName',''),(8,'fr_CA','preferredPublicName',''),(9,'','country','CA'),(9,'','orcid',''),(9,'','url',''),(9,'en_US','affiliation',''),(9,'en_US','biography',''),(9,'en_US','familyName','Opp'),(9,'en_US','givenName','James'),(9,'en_US','preferredPublicName',''),(9,'fr_CA','affiliation',''),(9,'fr_CA','biography',''),(9,'fr_CA','familyName',''),(9,'fr_CA','givenName',''),(9,'fr_CA','preferredPublicName',''),(10,'','country','CA'),(10,'en_US','affiliation','Athabasca University'),(10,'en_US','familyName','Barnetson'),(10,'en_US','givenName','Bob'),(11,'','country','CA'),(11,'en_US','affiliation','University of British Columbia'),(11,'en_US','familyName','Beaty'),(11,'en_US','givenName','Bart'),(12,'','country','CA'),(12,'','orcid',''),(12,'','url',''),(12,'en_US','affiliation','University of Alberta'),(12,'en_US','biography',''),(12,'en_US','familyName','Miller'),(12,'en_US','givenName','Toby'),(12,'en_US','preferredPublicName',''),(12,'fr_CA','affiliation',''),(12,'fr_CA','biography',''),(12,'fr_CA','familyName',''),(12,'fr_CA','givenName',''),(12,'fr_CA','preferredPublicName',''),(13,'','country','CA'),(13,'','orcid',''),(13,'','url',''),(13,'en_US','affiliation','Athabasca University'),(13,'en_US','biography',''),(13,'en_US','familyName','Wagman'),(13,'en_US','givenName','Ira'),(13,'en_US','preferredPublicName',''),(13,'fr_CA','affiliation',''),(13,'fr_CA','biography',''),(13,'fr_CA','familyName',''),(13,'fr_CA','givenName',''),(13,'fr_CA','preferredPublicName',''),(14,'','country','CA'),(14,'','orcid',''),(14,'','url',''),(14,'en_US','affiliation','University of Calgary'),(14,'en_US','biography',''),(14,'en_US','familyName','Straw'),(14,'en_US','givenName','Will'),(14,'en_US','preferredPublicName',''),(14,'fr_CA','affiliation',''),(14,'fr_CA','biography',''),(14,'fr_CA','familyName',''),(14,'fr_CA','givenName',''),(14,'fr_CA','preferredPublicName',''),(15,'','country','CA'),(15,'en_US','affiliation','University of Southern California'),(15,'en_US','familyName','Allan'),(15,'en_US','givenName','Chantal'),(16,'','country','US'),(16,'en_US','affiliation','SUNY'),(16,'en_US','familyName','Bernnard'),(16,'en_US','givenName','Deborah'),(17,'','country','US'),(17,'','orcid',''),(17,'','url',''),(17,'en_US','affiliation','SUNY'),(17,'en_US','biography',''),(17,'en_US','familyName','Bobish'),(17,'en_US','givenName','Greg'),(17,'en_US','preferredPublicName',''),(17,'fr_CA','affiliation',''),(17,'fr_CA','biography',''),(17,'fr_CA','familyName',''),(17,'fr_CA','givenName',''),(17,'fr_CA','preferredPublicName',''),(18,'','country','US'),(18,'','orcid',''),(18,'','url',''),(18,'en_US','affiliation','SUNY'),(18,'en_US','biography',''),(18,'en_US','familyName','Bullis'),(18,'en_US','givenName','Daryl'),(18,'en_US','preferredPublicName',''),(18,'fr_CA','affiliation',''),(18,'fr_CA','biography',''),(18,'fr_CA','familyName',''),(18,'fr_CA','givenName',''),(18,'fr_CA','preferredPublicName',''),(19,'','country','US'),(19,'','orcid',''),(19,'','url',''),(19,'en_US','affiliation','SUNY'),(19,'en_US','biography',''),(19,'en_US','familyName','Hecker'),(19,'en_US','givenName','Jenna'),(19,'en_US','preferredPublicName',''),(19,'fr_CA','affiliation',''),(19,'fr_CA','biography',''),(19,'fr_CA','familyName',''),(19,'fr_CA','givenName',''),(19,'fr_CA','preferredPublicName',''),(20,'','country','CA'),(20,'en_US','affiliation','Athabasca University'),(20,'en_US','familyName','Kennepohl'),(20,'en_US','givenName','Dietmar'),(21,'','country','CA'),(21,'','orcid',''),(21,'','url',''),(21,'en_US','affiliation','University of Calgary'),(21,'en_US','biography',''),(21,'en_US','familyName','Anderson'),(21,'en_US','givenName','Terry'),(21,'en_US','preferredPublicName',''),(21,'fr_CA','affiliation',''),(21,'fr_CA','biography',''),(21,'fr_CA','familyName',''),(21,'fr_CA','givenName',''),(21,'fr_CA','preferredPublicName',''),(22,'','country','CA'),(22,'','orcid',''),(22,'','url',''),(22,'en_US','affiliation','University of Alberta'),(22,'en_US','biography',''),(22,'en_US','familyName','Gorsky'),(22,'en_US','givenName','Paul'),(22,'en_US','preferredPublicName',''),(22,'fr_CA','affiliation',''),(22,'fr_CA','biography',''),(22,'fr_CA','familyName',''),(22,'fr_CA','givenName',''),(22,'fr_CA','preferredPublicName',''),(23,'','country','CA'),(23,'','orcid',''),(23,'','url',''),(23,'en_US','affiliation','Athabasca University'),(23,'en_US','biography',''),(23,'en_US','familyName','Parchoma'),(23,'en_US','givenName','Gale'),(23,'en_US','preferredPublicName',''),(23,'fr_CA','affiliation',''),(23,'fr_CA','biography',''),(23,'fr_CA','familyName',''),(23,'fr_CA','givenName',''),(23,'fr_CA','preferredPublicName',''),(24,'','country','CA'),(24,'','orcid',''),(24,'','url',''),(24,'en_US','affiliation','University of Alberta'),(24,'en_US','biography',''),(24,'en_US','familyName','Palmer'),(24,'en_US','givenName','Stuart'),(24,'en_US','preferredPublicName',''),(24,'fr_CA','affiliation',''),(24,'fr_CA','biography',''),(24,'fr_CA','familyName',''),(24,'fr_CA','givenName',''),(24,'fr_CA','preferredPublicName',''),(25,'','country','AU'),(25,'','orcid',''),(25,'','url',''),(25,'en_US','affiliation','University of Melbourne'),(25,'en_US','biography',''),(25,'en_US','familyName','Barnes'),(25,'en_US','givenName','Daniel'),(25,'fr_CA','affiliation',''),(25,'fr_CA','biography',''),(25,'fr_CA','familyName',''),(25,'fr_CA','givenName',''),(26,'','country','CA'),(26,'en_US','affiliation','University of Sussex'),(26,'en_US','familyName','Perini'),(26,'en_US','givenName','Fernando'),(27,'','country','GB'),(27,'','orcid',''),(27,'','url',''),(27,'en_US','affiliation',''),(27,'en_US','biography',''),(27,'en_US','familyName','Mansell'),(27,'en_US','givenName','Robin'),(27,'en_US','preferredPublicName',''),(27,'fr_CA','affiliation',''),(27,'fr_CA','biography',''),(27,'fr_CA','familyName',''),(27,'fr_CA','givenName',''),(27,'fr_CA','preferredPublicName',''),(28,'','country','AR'),(28,'','orcid',''),(28,'','url',''),(28,'en_US','affiliation',''),(28,'en_US','biography',''),(28,'en_US','familyName','Galperin'),(28,'en_US','givenName','Hernan'),(28,'en_US','preferredPublicName',''),(28,'fr_CA','affiliation',''),(28,'fr_CA','biography',''),(28,'fr_CA','familyName',''),(28,'fr_CA','givenName',''),(28,'fr_CA','preferredPublicName',''),(29,'','country','CL'),(29,'','orcid',''),(29,'','url',''),(29,'en_US','affiliation',''),(29,'en_US','biography',''),(29,'en_US','familyName','Bello'),(29,'en_US','givenName','Pablo'),(29,'en_US','preferredPublicName',''),(29,'fr_CA','affiliation',''),(29,'fr_CA','biography',''),(29,'fr_CA','familyName',''),(29,'fr_CA','givenName',''),(29,'fr_CA','preferredPublicName',''),(30,'','country','AR'),(30,'','orcid',''),(30,'','url',''),(30,'en_US','affiliation',''),(30,'en_US','biography',''),(30,'en_US','familyName','Rabinovich'),(30,'en_US','givenName','Eleonora'),(30,'en_US','preferredPublicName',''),(30,'fr_CA','affiliation',''),(30,'fr_CA','biography',''),(30,'fr_CA','familyName',''),(30,'fr_CA','givenName',''),(30,'fr_CA','preferredPublicName',''),(31,'','country','CA'),(31,'en_US','affiliation','Buffalo National Park Foundation'),(31,'en_US','familyName','Brower'),(31,'en_US','givenName','Jennifer'),(32,'','country','CA'),(32,'en_US','affiliation','University of Alberta'),(32,'en_US','familyName','Locke Hart'),(32,'en_US','givenName','Jonathan'),(33,'','country','CA'),(33,'en_US','affiliation','International Development Research Centre'),(33,'en_US','familyName','Elder'),(33,'en_US','givenName','Laurent'),(34,'','country','CA'),(34,'','orcid',''),(34,'','url',''),(34,'en_US','affiliation',''),(34,'en_US','biography',''),(34,'en_US','familyName','Emdon'),(34,'en_US','givenName','Heloise'),(34,'en_US','preferredPublicName',''),(34,'fr_CA','affiliation',''),(34,'fr_CA','biography',''),(34,'fr_CA','familyName',''),(34,'fr_CA','givenName',''),(34,'fr_CA','preferredPublicName',''),(35,'','country','CA'),(35,'','orcid',''),(35,'','url',''),(35,'en_US','affiliation',''),(35,'en_US','biography',''),(35,'en_US','familyName','Tulus'),(35,'en_US','givenName','Frank'),(35,'en_US','preferredPublicName',''),(35,'fr_CA','affiliation',''),(35,'fr_CA','biography',''),(35,'fr_CA','familyName',''),(35,'fr_CA','givenName',''),(35,'fr_CA','preferredPublicName',''),(36,'','country','AR'),(36,'','orcid',''),(36,'','url',''),(36,'en_US','affiliation',''),(36,'en_US','biography',''),(36,'en_US','familyName','Hyma'),(36,'en_US','givenName','Raymond'),(36,'en_US','preferredPublicName',''),(36,'fr_CA','affiliation',''),(36,'fr_CA','biography',''),(36,'fr_CA','familyName',''),(36,'fr_CA','givenName',''),(36,'fr_CA','preferredPublicName',''),(37,'','country','CA'),(37,'','orcid',''),(37,'','url',''),(37,'en_US','affiliation',''),(37,'en_US','biography',''),(37,'en_US','familyName','Valk'),(37,'en_US','givenName','John'),(37,'en_US','preferredPublicName',''),(37,'fr_CA','affiliation',''),(37,'fr_CA','biography',''),(37,'fr_CA','familyName',''),(37,'fr_CA','givenName',''),(37,'fr_CA','preferredPublicName',''),(38,'','country','CA'),(38,'','orcid',''),(38,'','url',''),(38,'en_US','affiliation',''),(38,'en_US','biography',''),(38,'en_US','familyName','Fourati'),(38,'en_US','givenName','Khaled'),(38,'en_US','preferredPublicName',''),(38,'fr_CA','affiliation',''),(38,'fr_CA','biography',''),(38,'fr_CA','familyName',''),(38,'fr_CA','givenName',''),(38,'fr_CA','preferredPublicName',''),(39,'','country','CA'),(39,'','orcid',''),(39,'','url',''),(39,'en_US','affiliation',''),(39,'en_US','biography',''),(39,'en_US','familyName','de Beer'),(39,'en_US','givenName','Jeremy'),(39,'en_US','preferredPublicName',''),(39,'fr_CA','affiliation',''),(39,'fr_CA','biography',''),(39,'fr_CA','familyName',''),(39,'fr_CA','givenName',''),(39,'fr_CA','preferredPublicName',''),(40,'','country','CA'),(40,'','orcid',''),(40,'','url',''),(40,'en_US','affiliation',''),(40,'en_US','biography',''),(40,'en_US','familyName','Bannerman'),(40,'en_US','givenName','Sara'),(40,'en_US','preferredPublicName',''),(40,'fr_CA','affiliation',''),(40,'fr_CA','biography',''),(40,'fr_CA','familyName',''),(40,'fr_CA','givenName',''),(40,'fr_CA','preferredPublicName',''),(41,'','country','CA'),(41,'en_US','affiliation','Athabasca University'),(41,'en_US','familyName','Ally'),(41,'en_US','givenName','Mohamed'),(42,'','country','GB'),(42,'','orcid',''),(42,'','url',''),(42,'en_US','affiliation',''),(42,'en_US','biography',''),(42,'en_US','familyName','Traxler'),(42,'en_US','givenName','John'),(42,'en_US','preferredPublicName',''),(42,'fr_CA','affiliation',''),(42,'fr_CA','biography',''),(42,'fr_CA','familyName',''),(42,'fr_CA','givenName',''),(42,'fr_CA','preferredPublicName',''),(43,'','country','CA'),(43,'','orcid',''),(43,'','url',''),(43,'en_US','affiliation',''),(43,'en_US','biography',''),(43,'en_US','familyName','Koole'),(43,'en_US','givenName','Marguerite'),(43,'en_US','preferredPublicName',''),(43,'fr_CA','affiliation',''),(43,'fr_CA','biography',''),(43,'fr_CA','familyName',''),(43,'fr_CA','givenName',''),(43,'fr_CA','preferredPublicName',''),(44,'','country','NO'),(44,'','orcid',''),(44,'','url',''),(44,'en_US','affiliation',''),(44,'en_US','biography',''),(44,'en_US','familyName','Rekkedal'),(44,'en_US','givenName','Torstein'),(44,'en_US','preferredPublicName',''),(44,'fr_CA','affiliation',''),(44,'fr_CA','biography',''),(44,'fr_CA','familyName',''),(44,'fr_CA','givenName',''),(44,'fr_CA','preferredPublicName',''),(45,'','country','CA'),(45,'en_US','affiliation','University of Alberta'),(45,'en_US','familyName','Dawson'),(45,'en_US','givenName','Michael'),(46,'','country','CA'),(46,'','orcid',''),(46,'','url',''),(46,'en_US','affiliation','Athabasca University'),(46,'en_US','biography',''),(46,'en_US','familyName','Dupuis'),(46,'en_US','givenName','Brian'),(46,'en_US','preferredPublicName',''),(46,'fr_CA','affiliation',''),(46,'fr_CA','biography',''),(46,'fr_CA','familyName',''),(46,'fr_CA','givenName',''),(46,'fr_CA','preferredPublicName',''),(47,'','country','CA'),(47,'','orcid',''),(47,'','url',''),(47,'en_US','affiliation','University of Calgary'),(47,'en_US','biography',''),(47,'en_US','familyName','Wilson'),(47,'en_US','givenName','Michael'),(47,'en_US','preferredPublicName',''),(47,'fr_CA','affiliation',''),(47,'fr_CA','biography',''),(47,'fr_CA','familyName',''),(47,'fr_CA','givenName',''),(47,'fr_CA','preferredPublicName',''),(48,'','country','CA'),(48,'en_US','affiliation','University of Calgary'),(48,'en_US','familyName','Foran'),(48,'en_US','givenName','Max'),(49,'','country','CA'),(49,'en_US','affiliation','London School of Economics'),(49,'en_US','familyName','Power'),(49,'en_US','givenName','Michael'),(50,'','country','CA'),(50,'en_US','affiliation','International Development Research Centre'),(50,'en_US','familyName','Smith'),(50,'en_US','givenName','Matthew'),(51,'','country','US'),(51,'','orcid',''),(51,'','url',''),(51,'en_US','affiliation',''),(51,'en_US','biography',''),(51,'en_US','familyName','Benkler'),(51,'en_US','givenName','Yochai'),(51,'en_US','preferredPublicName',''),(51,'fr_CA','affiliation',''),(51,'fr_CA','biography',''),(51,'fr_CA','familyName',''),(51,'fr_CA','givenName',''),(51,'fr_CA','preferredPublicName',''),(52,'','country','CA'),(52,'','orcid',''),(52,'','url',''),(52,'en_US','affiliation',''),(52,'en_US','biography',''),(52,'en_US','familyName','Reilly'),(52,'en_US','givenName','Katherine'),(52,'en_US','preferredPublicName',''),(52,'fr_CA','affiliation',''),(52,'fr_CA','biography',''),(52,'fr_CA','familyName',''),(52,'fr_CA','givenName',''),(52,'fr_CA','preferredPublicName',''),(53,'','country','US'),(53,'','orcid',''),(53,'','url',''),(53,'en_US','affiliation',''),(53,'en_US','biography',''),(53,'en_US','familyName','Loudon'),(53,'en_US','givenName','Melissa'),(53,'en_US','preferredPublicName',''),(53,'fr_CA','affiliation',''),(53,'fr_CA','biography',''),(53,'fr_CA','familyName',''),(53,'fr_CA','givenName',''),(53,'fr_CA','preferredPublicName',''),(54,'','country','ZA'),(54,'','orcid',''),(54,'','url',''),(54,'en_US','affiliation',''),(54,'en_US','biography',''),(54,'en_US','familyName','Rivett'),(54,'en_US','givenName','Ulrike'),(54,'en_US','preferredPublicName',''),(54,'fr_CA','affiliation',''),(54,'fr_CA','biography',''),(54,'fr_CA','familyName',''),(54,'fr_CA','givenName',''),(54,'fr_CA','preferredPublicName',''),(55,'','country','GB'),(55,'','orcid',''),(55,'','url',''),(55,'en_US','affiliation',''),(55,'en_US','biography',''),(55,'en_US','familyName','Graham'),(55,'en_US','givenName','Mark'),(55,'en_US','preferredPublicName',''),(55,'fr_CA','affiliation',''),(55,'fr_CA','biography',''),(55,'fr_CA','familyName',''),(55,'fr_CA','givenName',''),(55,'fr_CA','preferredPublicName',''),(56,'','country','NO'),(56,'','orcid',''),(56,'','url',''),(56,'en_US','affiliation',''),(56,'en_US','biography',''),(56,'en_US','familyName','Haarstad'),(56,'en_US','givenName','H??vard'),(56,'en_US','preferredPublicName',''),(56,'fr_CA','affiliation',''),(56,'fr_CA','biography',''),(56,'fr_CA','familyName',''),(56,'fr_CA','givenName',''),(56,'fr_CA','preferredPublicName',''),(57,'','country','US'),(57,'','orcid',''),(57,'','url',''),(57,'en_US','affiliation',''),(57,'en_US','biography',''),(57,'en_US','familyName','Smith'),(57,'en_US','givenName','Marshall'),(57,'en_US','preferredPublicName',''),(57,'fr_CA','affiliation',''),(57,'fr_CA','biography',''),(57,'fr_CA','familyName',''),(57,'fr_CA','givenName',''),(57,'fr_CA','preferredPublicName','');
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
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL
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
  `review_round_id` bigint(20) DEFAULT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` smallint(6) DEFAULT NULL,
  `editor_id` bigint(20) NOT NULL,
  `decision` smallint(6) NOT NULL,
  `date_decided` datetime NOT NULL,
  PRIMARY KEY (`edit_decision_id`),
  KEY `edit_decisions_submission_id` (`submission_id`),
  KEY `edit_decisions_editor_id` (`editor_id`),
  KEY `edit_decisions_review_round_id_foreign` (`review_round_id`),
  CONSTRAINT `edit_decisions_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
INSERT INTO `edit_decisions` VALUES (1,1,NULL,1,NULL,3,23,'2022-06-21 21:07:42'),(2,1,1,3,1,3,2,'2022-06-21 21:08:00'),(3,2,NULL,1,NULL,3,23,'2022-06-21 21:10:29'),(4,4,NULL,1,NULL,3,1,'2022-06-21 21:13:31'),(5,4,3,2,1,3,3,'2022-06-21 21:13:51'),(6,4,4,3,1,3,2,'2022-06-21 21:14:13'),(7,4,NULL,4,NULL,3,7,'2022-06-21 21:14:35'),(8,5,NULL,1,NULL,3,1,'2022-06-21 21:16:24'),(9,5,5,2,1,3,3,'2022-06-21 21:16:41'),(10,5,6,3,1,3,2,'2022-06-21 21:17:01'),(11,5,NULL,4,NULL,3,7,'2022-06-21 21:17:19'),(12,6,NULL,1,NULL,3,1,'2022-06-21 21:19:36'),(13,6,7,2,1,6,28,'2022-06-21 21:20:06'),(14,7,NULL,1,NULL,3,23,'2022-06-21 21:22:45'),(15,7,8,3,1,3,2,'2022-06-21 21:23:07'),(16,9,NULL,1,NULL,3,1,'2022-06-21 21:25:44'),(17,11,NULL,1,NULL,3,1,'2022-06-21 21:27:35'),(18,11,10,2,1,3,3,'2022-06-21 21:27:50'),(19,11,11,3,1,3,2,'2022-06-21 21:28:55'),(20,12,NULL,1,NULL,3,1,'2022-06-21 21:30:57'),(21,13,NULL,1,NULL,3,1,'2022-06-21 21:33:11'),(22,13,13,2,1,3,3,'2022-06-21 21:33:29'),(23,13,14,3,1,3,2,'2022-06-21 21:34:57'),(24,14,NULL,1,NULL,3,1,'2022-06-21 21:36:40'),(25,14,15,2,1,3,3,'2022-06-21 21:37:02'),(26,14,16,3,1,3,2,'2022-06-21 21:37:23'),(27,14,NULL,4,NULL,3,7,'2022-06-21 21:37:45'),(28,15,NULL,1,NULL,3,23,'2022-06-21 21:40:20'),(29,16,NULL,1,NULL,3,23,'2022-06-21 21:41:17'),(30,17,NULL,1,NULL,3,1,'2022-06-21 21:45:01');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
INSERT INTO `email_log` VALUES (1,1048585,1,3,'2022-06-21 21:07:42',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>','','','Your submission has been sent for review','<p>Dear Arthur Clark,</p><p>I am pleased to inform you that an editor has reviewed your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(2,1048585,1,3,'2022-06-21 21:08:00',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Arthur Clark,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, The ABCs of Human Survival: A Paradigm for Global Citizenship, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/1\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(3,1048585,2,3,'2022-06-21 21:10:29',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Alvin Finkel\" <afinkel@mailinator.com>','','','Your submission has been sent for review','<p>Dear Alvin Finkel,</p><p>I am pleased to inform you that an editor has reviewed your submission, The West and Beyond: New Perspectives on an Imagined Region, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(4,1048585,4,3,'2022-06-21 21:13:31',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Bart Beaty,</p><p>I am pleased to inform you that an editor has reviewed your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(5,1048585,4,3,'2022-06-21 21:13:51',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Your submission has been sent for review','<p>Dear Bart Beaty,</p><p>I am pleased to inform you that an editor has reviewed your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(6,1048585,4,3,'2022-06-21 21:14:13',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Bart Beaty,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(7,1048585,4,3,'2022-06-21 21:14:35',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Bart Beaty,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, How Canadians Communicate: Contexts of Canadian Popular Culture, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(8,1048585,5,3,'2022-06-21 21:16:24',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Chantal Allan,</p><p>I am pleased to inform you that an editor has reviewed your submission, Bomb Canada and Other Unkind Remarks in the American Media, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(9,1048585,5,3,'2022-06-21 21:16:41',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Your submission has been sent for review','<p>Dear Chantal Allan,</p><p>I am pleased to inform you that an editor has reviewed your submission, Bomb Canada and Other Unkind Remarks in the American Media, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(10,1048585,5,3,'2022-06-21 21:17:01',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Chantal Allan,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Bomb Canada and Other Unkind Remarks in the American Media, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(11,1048585,5,3,'2022-06-21 21:17:19',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Chantal Allan,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, Bomb Canada and Other Unkind Remarks in the American Media, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(12,1048585,6,3,'2022-06-21 21:19:36',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Deborah Bernnard\" <dbernnard@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Deborah Bernnard,</p><p>I am pleased to inform you that an editor has reviewed your submission, The Information Literacy User???s Guide, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(13,1048585,7,3,'2022-06-21 21:22:45',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>','','','Your submission has been sent for review','<p>Dear Dietmar Kennepohl,</p><p>I am pleased to inform you that an editor has reviewed your submission, Accessible Elements: Teaching Science Online and at a Distance, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(14,1048585,7,3,'2022-06-21 21:23:07',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Dietmar Kennepohl,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Accessible Elements: Teaching Science Online and at a Distance, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/7\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(15,1048585,9,3,'2022-06-21 21:25:44',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Fernando Perini\" <fperini@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Fernando Perini,</p><p>I am pleased to inform you that an editor has reviewed your submission, Enabling Openness: The future of the information society in Latin America and the Caribbean, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(16,1048585,11,3,'2022-06-21 21:27:35',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that an editor has reviewed your submission, Dreamwork, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(17,1048585,11,3,'2022-06-21 21:27:50',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Your submission has been sent for review','<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that an editor has reviewed your submission, Dreamwork, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(18,1048585,11,10,'2022-06-21 21:28:18',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Dreamwork,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-07-19, if not before.<br />\n<br />\nAdela Gallego'),(19,1048585,11,12,'2022-06-21 21:28:31',1073741829,'\"Gonzalo Favio\" <gfavio@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Dreamwork,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-07-19, if not before.<br />\n<br />\nGonzalo Favio'),(20,1048585,11,3,'2022-06-21 21:28:55',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Jonathan Locke Hart,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Dreamwork, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/11\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(21,1048585,12,3,'2022-06-21 21:30:57',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Laurent Elder\" <lelder@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Laurent Elder,</p><p>I am pleased to inform you that an editor has reviewed your submission, Connecting ICTs to Development, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(22,1048585,12,8,'2022-06-21 21:31:41',1073741829,'\"Paul Hudson\" <phudson@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Connecting ICTs to Development,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-07-19, if not before.<br />\n<br />\nPaul Hudson'),(23,1048585,13,3,'2022-06-21 21:33:11',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that an editor has reviewed your submission, Mobile Learning: Transforming the Delivery of Education and Training, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(24,1048585,13,3,'2022-06-21 21:33:29',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Your submission has been sent for review','<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that an editor has reviewed your submission, Mobile Learning: Transforming the Delivery of Education and Training, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(25,1048585,13,10,'2022-06-21 21:34:12',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Mobile Learning: Transforming the Delivery of Education and Training,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-07-19, if not before.<br />\n<br />\nAdela Gallego'),(26,1048585,13,12,'2022-06-21 21:34:28',1073741829,'\"Gonzalo Favio\" <gfavio@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Mobile Learning: Transforming the Delivery of Education and Training,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-07-19, if not before.<br />\n<br />\nGonzalo Favio'),(27,1048585,13,3,'2022-06-21 21:34:57',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Mohamed Ally,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, Mobile Learning: Transforming the Delivery of Education and Training, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(28,1048585,14,3,'2022-06-21 21:36:40',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Michael Dawson,</p><p>I am pleased to inform you that an editor has reviewed your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(29,1048585,14,3,'2022-06-21 21:37:02',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Your submission has been sent for review','<p>Dear Michael Dawson,</p><p>I am pleased to inform you that an editor has reviewed your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(30,1048585,14,3,'2022-06-21 21:37:23',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Your submission has been accepted to Public Knowledge Press','<p>Dear Michael Dawson,</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, to meet or exceed our expectations. We are excited to publish your piece in Public Knowledge Press and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for Public Knowledge Press and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(31,1048585,14,3,'2022-06-21 21:37:45',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>','','','Next steps for publishing your submission','<p>Dear Michael Dawson,</p><p>I am writing from Public Knowledge Press to let you know that the editing of your submission, From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">submission dashboard</a>.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(32,1048585,15,3,'2022-06-21 21:40:20',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Max Foran\" <mforan@mailinator.com>','','','Your submission has been sent for review','<p>Dear Max Foran,</p><p>I am pleased to inform you that an editor has reviewed your submission, Expansive Discourses: Urban Sprawl in Calgary, 1945-1978, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(33,1048585,16,3,'2022-06-21 21:41:17',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Power\" <mpower@mailinator.com>','','','Your submission has been sent for review','<p>Dear Michael Power,</p><p>I am pleased to inform you that an editor has reviewed your submission, A Designer\'s Log: Case Studies in Instructional Design, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>This journal conducts double-anonymous peer review. The reviewers will not see any identifying information about you or your co-authors. Similarly, you will not know who reviewed your submission, and you will not hear from the reviewers directly. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>'),(34,1048585,16,10,'2022-06-21 21:41:54',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>','','','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;A Designer\'s Log: Case Studies in Instructional Design,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2022-07-19, if not before.<br />\n<br />\nAdela Gallego'),(35,1048585,17,3,'2022-06-21 21:45:01',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Matthew Smith\" <msmith@mailinator.com>','','','Your submission has been sent for internal review','<p>Dear Matthew Smith,</p><p>I am pleased to inform you that an editor has reviewed your submission, Open Development: Networked Innovations in International Development, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p><p>Daniel Barnes</p></p>');
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
INSERT INTO `email_log_users` VALUES (1,19),(2,19),(3,20),(4,22),(5,22),(6,22),(7,22),(8,23),(9,23),(10,23),(11,23),(12,24),(13,25),(14,25),(15,26),(16,28),(17,28),(18,3),(19,3),(20,28),(21,29),(22,3),(23,30),(24,30),(25,3),(26,3),(27,30),(28,31),(29,31),(30,31),(31,31),(32,32),(33,33),(34,3),(35,34);
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default`
--

LOCK TABLES `email_templates_default` WRITE;
/*!40000 ALTER TABLE `email_templates_default` DISABLE KEYS */;
INSERT INTO `email_templates_default` VALUES (1,'NOTIFICATION',0,0,NULL,NULL,NULL),(2,'NOTIFICATION_CENTER_DEFAULT',0,0,NULL,NULL,NULL),(3,'PASSWORD_RESET_CONFIRM',0,0,NULL,NULL,NULL),(4,'PASSWORD_RESET',0,0,NULL,NULL,NULL),(5,'USER_REGISTER',0,0,NULL,NULL,NULL),(6,'USER_VALIDATE_CONTEXT',0,0,NULL,NULL,NULL),(7,'USER_VALIDATE_SITE',0,0,NULL,NULL,NULL),(8,'REVIEWER_REGISTER',0,0,NULL,NULL,NULL),(9,'SUBMISSION_ACK',1,0,NULL,65536,1),(10,'SUBMISSION_ACK_NOT_USER',1,0,NULL,65536,1),(11,'EDITOR_ASSIGN',1,0,16,16,1),(12,'REVIEW_CANCEL',0,0,NULL,NULL,NULL),(13,'REVIEW_REINSTATE',0,0,NULL,NULL,NULL),(14,'REVIEW_REQUEST',0,0,NULL,NULL,NULL),(15,'REVIEW_RESPONSE_OVERDUE_AUTO',0,0,NULL,NULL,NULL),(16,'REVIEW_RESPONSE_OVERDUE_AUTO_ONECLICK',0,0,NULL,4096,3),(17,'REVIEW_CONFIRM',0,0,NULL,NULL,NULL),(18,'REVIEW_DECLINE',0,0,NULL,NULL,NULL),(19,'REVIEW_ACK',0,0,NULL,NULL,NULL),(20,'REVIEW_REMIND',0,0,NULL,NULL,NULL),(21,'REVIEW_REMIND_AUTO',0,0,NULL,NULL,NULL),(22,'REVIEW_REMIND_AUTO_ONECLICK',0,0,NULL,4096,3),(23,'EDITOR_DECISION_ACCEPT',0,0,NULL,NULL,NULL),(24,'EDITOR_DECISION_SEND_TO_EXTERNAL',0,0,NULL,NULL,NULL),(25,'EDITOR_DECISION_SEND_TO_INTERNAL',0,0,NULL,NULL,NULL),(26,'EDITOR_DECISION_SEND_TO_PRODUCTION',0,0,NULL,NULL,NULL),(27,'EDITOR_DECISION_REVISIONS',0,0,NULL,NULL,NULL),(28,'EDITOR_DECISION_RESUBMIT',0,0,NULL,NULL,NULL),(29,'EDITOR_DECISION_DECLINE',0,0,NULL,NULL,NULL),(30,'EDITOR_DECISION_INITIAL_DECLINE',0,0,NULL,NULL,NULL),(31,'EDITOR_RECOMMENDATION',0,0,NULL,NULL,NULL),(32,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS',0,0,NULL,NULL,NULL),(33,'EDITOR_DECISION_BACK_TO_COPYEDITING',0,0,NULL,NULL,NULL),(34,'EDITOR_DECISION_BACK_TO_REVIEW',0,0,NULL,NULL,NULL),(35,'EDITOR_DECISION_BACK_TO_SUBMISSION',0,0,NULL,NULL,NULL),(36,'EDITOR_DECISION_NEW_ROUND',0,0,NULL,NULL,NULL),(37,'EDITOR_DECISION_REVERT_DECLINE',0,0,NULL,NULL,NULL),(38,'EDITOR_DECISION_REVERT_INITIAL_DECLINE',0,0,NULL,NULL,NULL),(39,'EDITOR_DECISION_SKIP_REVIEW',0,0,NULL,NULL,NULL),(40,'COPYEDIT_REQUEST',1,0,16,4097,4),(41,'LAYOUT_REQUEST',1,0,16,4097,5),(42,'LAYOUT_COMPLETE',1,0,4097,16,5),(43,'INDEX_REQUEST',1,0,16,4097,5),(44,'INDEX_COMPLETE',1,0,4097,16,5),(45,'EMAIL_LINK',0,0,1048576,NULL,NULL),(46,'STATISTICS_REPORT_NOTIFICATION',1,0,16,17,NULL),(47,'ANNOUNCEMENT',0,0,16,1048576,NULL),(48,'MANUAL_PAYMENT_NOTIFICATION',0,1,NULL,NULL,NULL),(49,'PAYPAL_INVESTIGATE_PAYMENT',0,1,NULL,NULL,NULL);
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
INSERT INTO `email_templates_default_data` VALUES ('ANNOUNCEMENT','en_US','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href=\"{$announcementUrl}\">full announcement</a>.','This email is sent when a new announcement is created.'),('ANNOUNCEMENT','fr_CA','','','##emails.announcement.description##'),('COPYEDIT_REQUEST','en_US','Submission {$submissionId} is ready to be copyedited for {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready to be copyedited:</p><p><a href\"{$submissionUrl}\">{$submissionId} {$submissionTitle}</a><br />{$pressName}</p><p>Please follow these steps to complete this task:</p><ol><li>1. Click on the Submission URL below.</li><li>2. Open any files available under Draft Files and edit the files. Use the Copyediting Discussions area if you need to contact the editor(s) or author(s).</li><li>3. Save the copyedited file(s) and upload them to the Copyedited panel.</li><li>4. Use the Copyediting Discussions to notify the editor(s) that all files have been prepared, and that the Production process may begin.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.</p><p>Kind regards,</p>{$signature}','This email is sent by an Editor to a submission\'s Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.'),('COPYEDIT_REQUEST','fr_CA','Demande de r??vision d\'une soumission','{$recipientName},<br />\n<br />\nJ\'aimerais que vous effectuiez la r??vision du manuscrit intitul?? ?? {$submissionTitle} ?? pour la revue {$pressName} ?? l\'aide des ??tapes suivantes.<br />\n1. Cliquer sur l\'URL de la soumission ci-dessous.<br />\n2. Ouvrir le(s) fichier(s) disponible(s) sous Fichiers des ??bauches finales et effectuer votre r??vision, tout en ajoutant des discussions sur la r??vision, le cas ??ch??ant.<br />\n3. Enregistrer le(s) fichier(s) r??vis??(s) et le(s) t??l??verser dans la section Version(s) r??vis??e(s).<br />\n4. Informer le,la r??dacteur-trice que tous les fichiers ont ??t?? r??vis??s et que l\'??tape de production peut d??buter.<br />\n<br />\nURL de la revue {$pressName} : {$pressUrl}<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}','##emails.copyeditRequest.description##'),('EDITOR_ASSIGN','en_US','Editorial Assignment','{$recipientName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$pressName} has been assigned to you to see through the editorial process in your role as an Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you,','This email notifies a Series Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the press site.'),('EDITOR_ASSIGN','fr_CA','Travail ??ditorial','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; ?? la presse {$pressName} vous a ??t?? assign??e. En tant que r??dacteur en chef, vous devrez superviser le processus ??ditorial de cette soumission.<br />\n<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci,','Ce courriel indique au r??dacteur en chef d\'une s??rie qu\'on lui a assign?? la t??che de superviser une soumission tout au long de son processus ??ditorial. Il contient des renseignements sur la soumission et indique comment acc??der au site de la presse.'),('EDITOR_DECISION_ACCEPT','en_US','Your submission has been accepted to {$pressName}','<p>Dear {$recipientName},</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, {$submissionTitle}, to meet or exceed our expectations. We are excited to publish your piece in {$pressName} and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for {$pressName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}','##emails.editorDecisionAccept.description##'),('EDITOR_DECISION_ACCEPT','fr_CA','D??cision du r??dacteur en chef','{$authors}:<br />\n<br />\nNous avons pris une d??cision concernant votre soumission ?? la presse {$pressName} intitul??e &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons d??cid?? de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}','##emails.editorDecisionAccept.description##'),('EDITOR_DECISION_BACK_TO_COPYEDITING','en_US','','',NULL),('EDITOR_DECISION_BACK_TO_COPYEDITING','fr_CA','','',NULL),('EDITOR_DECISION_BACK_TO_REVIEW','en_US','Your submission has been sent back for review','<p>Dear {$recipientName},</p>\n<p>Your submission, {$submissionTitle}, has been sent back to the review stage. \nIt will undergo further review before it can be accepted for publication.</p>\n<p>Occasionally, a decision to accept a submission will be recorded accidentally \nin our system and we must send it back to review. I apologize for any confusion \nthis has caused. We will work to complete any further review quickly so that you \nhave a final decision as soon as possible.</p><p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n',NULL),('EDITOR_DECISION_BACK_TO_REVIEW','fr_CA','','',NULL),('EDITOR_DECISION_BACK_TO_SUBMISSION','en_US','','',NULL),('EDITOR_DECISION_BACK_TO_SUBMISSION','fr_CA','','',NULL),('EDITOR_DECISION_DECLINE','en_US','Your submission has been declined','<p>Dear {$recipientName},</p><p>While we appreciate receiving your submission, we are unable to accept {$submissionTitle} for publication on the basis of the comments from reviewers.</p><p>The reviewers\' comments are included at the bottom of this email.</p><p>Thank you for submitting to {$pressName}. Although it is disappointing to have a submission declined, I hope you find the reviewers\' comments to be constructive and helpful.</p><p>You are now free to submit the work elsewhere if you choose to do so.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}',NULL),('EDITOR_DECISION_DECLINE','fr_CA','D??cision du r??dacteur','{$authors}:<br />\n<br />\nNous avons pris une d??cision concernant votre soumission ?? {$submissionTitle} ?? ?? la revue {$pressName}.<br />\n<br />\nNotre d??cision est de refuser votre soumission.',NULL),('EDITOR_DECISION_INITIAL_DECLINE','en_US','Your submission has been declined','<p>Dear {$recipientName},</p><p>I???m sorry to inform you that, after reviewing your submission, {$submissionTitle}, the editor has found that it does not meet our requirements for publication in {$pressName}.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p>{$signature}',NULL),('EDITOR_DECISION_INITIAL_DECLINE','fr_CA','D??cision du r??dacteur','\n			{$authors},<br />\n<br />\nNous avons pris une d??cision concernant votre soumission ?? {$submissionTitle} ?? ??  la revue {$pressName}.<br />\n<br />\nNotre d??cision est de refuser votre soumission.',NULL),('EDITOR_DECISION_NEW_ROUND','en_US','Your submission has been sent for another round of review','<p>Dear {$recipientName},</p>\n<p>Your revised submission, {$submissionTitle}, has been sent for a new round of peer review. \nYou will hear from us with feedback from the reviewers and information about the next steps.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n',NULL),('EDITOR_DECISION_NEW_ROUND','fr_CA','','',NULL),('EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','en_US','An update regarding your submission','<p>The following email was sent to {$submittingAuthorName} from {$pressName} regarding {$submissionTitle}.</p>\n<p>You are receiving a copy of this notification because you are identified as an author of the submission. Any instructions in the message below are intended for the submitting author, {$submittingAuthorName}, and no action is required of you at this time.</p>\n\n{$messageToSubmittingAuthor}',NULL),('EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','fr_CA','','',NULL),('EDITOR_DECISION_RESUBMIT','en_US','Your submission has been reviewed - please revise and resubmit','<p>Dear {$recipientName},</p><p>After reviewing your submission, {$submissionTitle}, the reviewers have recommended that your submission cannot be accepted for publication in its current form. However, we would like to encourage you to submit a revised version that addresses the reviewers\' comments. Your revisions will be reviewed by an editor and may be sent out for another round of peer review.</p><p>Please note that resubmitting your work does not guarantee that it will be accepted.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point and identify what changes you have made. If you find any of the reviewer\'s comments inappropriate, please explain your perspective. If you have questions about the recommendations in your review, please include these in your response.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments <a href=\"{$authorSubmissionUrl}\">at your submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}',NULL),('EDITOR_DECISION_RESUBMIT','fr_CA','D??cision du r??dacteur','{$authors},<br />\n<br />\nNous avons pris une d??cision concernant votre soumission ?? {$submissionTitle} ?? ?? la revue {$pressName}.<br />\n<br />\nNotre d??cision est de vous demander d\'apporter des r??visions ?? votre soumission et de la soumettre ?? nouveau.',NULL),('EDITOR_DECISION_REVERT_DECLINE','en_US','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will complete the round of review and you will be notified when a \ndecision is made.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n',NULL),('EDITOR_DECISION_REVERT_DECLINE','fr_CA','','',NULL),('EDITOR_DECISION_REVERT_INITIAL_DECLINE','en_US','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nAn editor will look further at your submission before deciding whether to decline \nthe submission or send it for review.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n',NULL),('EDITOR_DECISION_REVERT_INITIAL_DECLINE','fr_CA','','',NULL),('EDITOR_DECISION_REVISIONS','en_US','Your submission has been reviewed and we encourage you to submit revisions','<p>Dear {$recipientName},</p><p>Your submission {$submissionTitle} has been reviewed and we would like to encourage you to submit revisions that address the reviewers\' comments. An editor will review these revisions and if they address the concerns adequately, your submission may be accepted for publication.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point in the reviewers\' comments and identify what changes you have made. If you find any of the reviewer\'s comments to be unjustified or inappropriate, please explain your perspective.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments at your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}',NULL),('EDITOR_DECISION_REVISIONS','fr_CA','D??cision du r??dacteur','{$authors},<br />\n<br />\nNous avons pris une d??cision concernant votre soumission ?? {$submissionTitle} ?? ?? la revue {$pressName}.<br />\n<br />\nNotre d??cision est de vous demander d\'apporter des r??visions ?? votre soumission.',NULL),('EDITOR_DECISION_SEND_TO_EXTERNAL','en_US','Your submission has been sent for review','<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>{$reviewTypeDescription} You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>',NULL),('EDITOR_DECISION_SEND_TO_EXTERNAL','fr_CA','D??cision du r??dacteur','{$authors},<br />\n<br />\nNous avons pris une d??cision concernant votre soumission ?? {$submissionTitle} ?? ?? la revue {$pressName}.<br />\n<br />\nNotre d??cision est d\'envoyer votre soumission en ??valuation.<br />\n<br />\nURL de la soumission : {$submissionUrl}',NULL),('EDITOR_DECISION_SEND_TO_INTERNAL','en_US','Your submission has been sent for internal review','<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>',NULL),('EDITOR_DECISION_SEND_TO_INTERNAL','fr_CA','','',NULL),('EDITOR_DECISION_SEND_TO_PRODUCTION','en_US','Next steps for publishing your submission','<p>Dear {$recipientName},</p><p>I am writing from {$pressName} to let you know that the editing of your submission, {$submissionTitle}, is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}',NULL),('EDITOR_DECISION_SEND_TO_PRODUCTION','fr_CA','D??cision du r??dacteur','{$authors},<br />\n<br />\nL\'??dition de votre soumission ?? {$submissionTitle} ?? est compl??t??e. Nous l\'envoyons maintenant en production.<br />\n<br />\nURL de la soumission : {$submissionUrl}',NULL),('EDITOR_DECISION_SKIP_REVIEW','en_US','Your submission has been sent for copyediting','<p>Dear {$recipientName},</p>\n<p>I am pleased to inform you that we have decided to accept your submission without peer review. We found your submission, {$submissionTitle}, to meet our expectations, and we do not require that work of this type undergo peer review. We are excited to publish your piece in {$pressName} and we thank you for choosing our press as a venue for your work.</p>\n<p>Your submission will soon be published on the press site for {$pressName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on your efforts.</p>\n<p>Your submission will now undergo copy editing and formatting to prepare it for publication. </p>\n<p>You will shortly receive further instructions.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n',NULL),('EDITOR_DECISION_SKIP_REVIEW','fr_CA','','',NULL),('EDITOR_RECOMMENDATION','en_US','Editor Recommendation','<p>Dear {$recipientName},</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission {$submissionTitle}.</p><p>My recommendation is:<br />{$recommendation}.</p><p>Please visit the submission\'s <a href=\"{$submissionUrl}\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>{$senderName}</p>',NULL),('EDITOR_RECOMMENDATION','fr_CA','Recommandation du r??dacteur','{$editors},<br />\n<br />\nLa recommandation concernant la soumission ?? {$submissionTitle} ?? ?? la revue {$pressName} est de : {$recommendation}',NULL),('EMAIL_LINK','en_US','Manuscript of Possible Interest','Thought you might be interested in seeing &quot;{$submissionTitle}&quot; by {$authors} published in Vol {$volume}, No {$number} ({$year}) of {$pressName} at &quot;{$submissionUrl}&quot;.','This email template provides a registered reader with the opportunity to send information about a monograph to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Press Manager in the Reading Tools Administration page.'),('EMAIL_LINK','fr_CA','Manuscrit susceptible d\'int??resser','Nous crayons que l\'article intitul?? &quot;{$submissionTitle}&quot; par {$authors} publi?? dans le Volume {$volume}, No {$number} ({$year}) de la presse {$pressName} au &quot;{$submissionUrl}&quot; pourrait vous int??resser.','Ce mod??le de courriel permet ?? un lecteur inscrit d\'envoyer des renseignements sur une monographie ?? une personne qui pourrait ??tre int??ress??e. Il est disponible dans les Outils de lecture et peut ??tre activ?? par le gestionnaire de la presse sur la page Administration des outils de lecture.'),('INDEX_COMPLETE','en_US','Index Galleys Complete','{$recipientName}:<br />\n<br />\nIndexes have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$pressName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signatureFullName}','This email from the Indexer to the Series Editor notifies them that the index creation process has been completed.'),('INDEX_COMPLETE','fr_CA','Indexage des ??preuves en placard compl??t??','{$recipientName}:<br />\n<br />\nLes index du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$pressName} sont pr??ts et peuvent ??tre r??vis??s.<br />\n<br />\nSi vous avez questions, n\'h??sitez pas ?? me contacter.<br />\n<br />\n{$signatureFullName}','Ce courriel est envoy?? par l\'indexateur au r??dacteur en chef d\'une s??rie pour lui indiquer que l\'indexage est termin??.'),('INDEX_REQUEST','en_US','Request Index','{$recipientName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$pressName} now needs indexes created by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and use the Page Proofs file to create the galleys according to press standards.<br />\n3. Send the COMPLETE email to the editor.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.<br />\n<br />\n{$signature}','This email from the Series Editor to the Indexer notifies them that they have been assigned the task of creating indexes for a submission. It provides information about the submission and how to access it.'),('INDEX_REQUEST','fr_CA','Requ??te d\'indexage','{$recipientName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; par la presse {$pressName} doit d??sormais ??tre index??e. Veuillez suivre les ??tapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez les fichiers d\'??preuves de mise en page pour cr??er les ??preuves en placard conform??ment aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au r??dacteur en chef.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'h??sitez pas ?? me contacter. Merci d\'avoir contribu?? ?? cette presse.<br />\n<br />\n{$signature}','Ce courriel est envoy?? ?? l\'indexateur par le r??dacteur en chef d\'une s??rie pour lui indiquer qu\'il devra cr??er les index de la soumission en question. Il contient des renseignements sur la soumission et explique comment y acc??der.'),('LAYOUT_COMPLETE','en_US','Galleys Complete','<p>Dear {$recipientName},<p><p>Galleys have now been prepared for the following submission and are ready for final review.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$pressName}</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p><p>{$senderName}</p>','This email from the Layout Editor to the Series Editor notifies them that the layout process has been completed.'),('LAYOUT_COMPLETE','fr_CA','??preuves en placard compl??t??es','{$recipientName}:<br />\n<br />\nLes ??preuves en placard du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$pressName} ont ??t?? pr??par??es et peuvent ??tre r??vis??es.<br />\n<br />\nSi vous avez questions, n\'h??sitez pas ?? me contacter.<br />\n<br />\n{$senderName}','Ce courriel est envoy?? par le r??dacteur metteur en page au r??dacteur d\'une s??rie pour l\'informer que la mise en page du manuscrit est termin??e.'),('LAYOUT_REQUEST','en_US','Submission {$submissionId} is ready for production at {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready for layout editing:</p><p><a href=\"{$submissionUrl}\">{$submissionId} {$submissionTitle}</a><br />{$pressName}</p><ol><li>1. Click on the Submission URL above.</li><li>2. Download the Production Ready files and use them to create the galleys according to the press\'s standards.</li><li>3. Upload the galleys to the Publication Formats section of the submission.</li><li>4. Use the Production Discussions to notify the editor that the galleys are ready.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.</p><p>Kind regards,</p>{$signature}','This email from an Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.'),('LAYOUT_REQUEST','fr_CA','Requ??te des ??preuves en placard','{$recipientName}:<br />\n<br />\nIl faut maintenant pr??parer les ??preuves en placard de la soumission &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Pour ce faire, veuillez suivre les ??tapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez le fichier Version de mise en page pour cr??er les ??preuves en placard conform??ment aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au r??dacteur en chef.<br />\n<br />\n{$pressName} URL: {$pressUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'h??sitez pas ?? me contacter. Merci d\'avoir contribu?? ?? cette presse.','Ce courriel est envoy?? au r??dacteur metteur en page par le r??dacteur en chef de la s??rie pour lui indiquer qu\'on lui a demand?? de faire la mise en page de la soumission. Il contient des renseignements sur la soumission et explique comment y acc??der.'),('MANUAL_PAYMENT_NOTIFICATION','en_US','Manual Payment Notification','A manual payment needs to be processed for the press {$pressName} and the user {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$itemName}&quot;.<br />\nThe cost is {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nThis email was generated by the Open Monograph Press Manual Payment plugin.','This email template is used to notify a press manager contact that a manual payment was requested.'),('NOTIFICATION','en_US','New notification from {$pressName}','You have a new notification from {$pressName}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$notificationUrl}<br />\n<br />\nThis is an automatically generated email; please do not reply to this message.<br />\n{$signature}<hr />{$unsubscribeLink}',NULL),('NOTIFICATION','fr_CA','Nouvelle notification de {$pressName}','Vous avez re??u une nouvelle notification de {$pressName}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLien: {$notificationUrl}<br />\n<br />\n{$signature}',NULL),('NOTIFICATION_CENTER_DEFAULT','en_US','A message regarding {$pressName}','Please enter your message.','The default (blank) message used in the Notification Center Message Listbuilder.'),('NOTIFICATION_CENTER_DEFAULT','fr_CA','Un message ?? propos de la presse {$pressName}','Veuillez saisir votre message.','Le message (vierge) par d??faut utilis?? par le centre d\'alerte.'),('PASSWORD_RESET','en_US','Password Reset','Your password has been successfully reset for use with the {$siteTitle} web site.<br />\n<br />\nYour username: {$recipientUsername}<br />\nYour new password: {$password}<br />\n<br />\n{$signature}','This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.'),('PASSWORD_RESET','fr_CA','R??initialisation du mot de passe','Votre mot de passe vous permettant d\'avoir acc??s au site Web {$siteTitle} a ??t?? r??initialis??. Veuillez noter votre nom d\'utilisateur et mot de passe dans vos dossiers, car vous en aurez besoin pour vos travaux aupr??s de la presse.<br />\n<br />\nVotre nom d\'utilisateur: {$recipientUsername}<br />\nVotre nouveau mot de passe: {$password}<br />\n<br />\n{$signature}','Ce courriel est envoy?? ?? un utilisateur lorsque son mot de passe a ??t?? r??initialis?? apr??s avoir suivi les instructions du courriel \"PASSWORD_RESET_CONFIRM\".'),('PASSWORD_RESET_CONFIRM','en_US','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$passwordResetUrl}<br />\n<br />\n{$signature}','This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),('PASSWORD_RESET_CONFIRM','fr_CA','Confirmation de r??initialisation du mot de passe','Nous avons re??u une requ??te de r??initialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette requ??te, veuillez ignorer ce courriel et votre mot de passe demeurera le m??me. Si vous souhaitez modifier votre mot de passe, cliquez sur l\'adresse URL ci-dessous.<br />\n<br />\nModifier mon mot de passe: {$passwordResetUrl}<br />\n<br />\n{$signature}','Ce courriel est envoy?? ?? un utilisateur lorsqu\'il a indiqu?? avoir oubli?? son mot de passe ou ??tre incapable d\'ouvrir une session. On lui fournit une adresse URL sur laquelle il peut cliquer pour modifier son mot de passe.'),('PAYPAL_INVESTIGATE_PAYMENT','en_US','Unusual PayPal Activity','Open Monograph Press has encountered unusual activity relating to PayPal payment support for the press {$pressName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by the Open Monograph Press PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n','This email template is used to notify the press\' primary contact that suspicious activity or activity requiring manual intervention was encountered by the PayPal plugin.'),('REVIEWER_REGISTER','en_US','Registration as Reviewer with {$pressName}','In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$pressName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the press through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}','This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.'),('REVIEWER_REGISTER','fr_CA','Inscription ?? titre d\'??valuateur pour la presse {$pressName}','En raison de votre expertise, nous avons ajout?? votre nom ?? notre base de donn??es d\'??valuateurs pour la presse {$pressName}. Ceci ne vous oblige ?? rien, mais nous permet simplement de vous approcher si nous recevons une soumission que vous pourriez ??valuer. Apr??s avoir re??u une demande d\'??valuation, vous aurez la possibilit?? de lire le titre et le r??sum?? de l\'article en question. Vous serez toujours libre d\'accepter ou de refuser l\'invitation. Vous pouvez demander que l\'on retire votre nom de notre liste d\'??valuateurs en tout temps.<br />\n<br />\nVoici votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin dans tous vos ??changes avec la presse ?? travers son site Web. Vous pourriez, par exemple, mettre votre profil ?? jour, y compris vos champs d\'int??r??t en ce qui concerne l\'??valuation des articles.<br />\n<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$signature}','Ce courriel est envoy?? ?? un nouvel ??valuateur pour lui souhaiter la bienvenue dans le syst??me et lui fournir une confirmation ??crite de son nom d\'utilisateur et de son mot de passe.'),('REVIEW_ACK','en_US','Thank you for your review','<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, {$submissionTitle}, for {$pressName}. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>{$decisionDescription}</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$pressName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>',NULL),('REVIEW_ACK','fr_CA','Accus?? de r??ception de l\'??valuation d\'une soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir ??valu?? la soumission intitul??e ?? {$submissionTitle} ?? pour la revue {$pressName}. Nous vous sommes reconnaissants de votre contribution ?? la qualit?? des travaux que nous publions.',NULL),('REVIEW_CANCEL','en_US','Request for Review Cancelled','{$recipientName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this review process in the future.<br />\n<br />\nIf you have any questions, please contact me.',NULL),('REVIEW_CANCEL','fr_CA','Annulation de la requ??te d\'??valuation','{$recipientName}:<br />\n<br />\n<br />\nNous avons d??cid?? d\'annuler notre requ??te d\'??valuation pour la soumission &quot;{$submissionTitle}&quot; de la presse {$pressName}. Nous vous prions de nous excuser pour tout inconv??nient que cette d??cision pourrait occasionner et nous esp??rons que vous serez en mesure d\'??valuer une soumission dans un avenir prochain.<br />\n<br />\nSi vous avez des questions, n\'h??sitez pas ?? me contacter.',NULL),('REVIEW_CONFIRM','en_US','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$senderName}',NULL),('REVIEW_CONFIRM','fr_CA','En mesure d\'??valuer','??diteurs:<br />\n<br />\nJe peux et je souhaite ??valuer la soumission &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Merci de m\'avoir invit?? ?? ??valuer cet article. Je pr??vois terminer mon ??valuation d\'ici le {$reviewDueDate}.<br />\n<br />\n{$senderName}',NULL),('REVIEW_DECLINE','en_US','Unable to Review','Editor(s):<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$senderName}',NULL),('REVIEW_DECLINE','fr_CA','Ne peux pas ??valuer','??diteurs:<br />\n<br />\nMalheureusement, je ne pourrai pas ??valuer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Merci de m\'avoir invit?? ?? ??valuer cet article et n\'h??sitez pas ?? me contacter dans un avenir prochain.<br />\n<br />\n{$senderName}',NULL),('REVIEW_REINSTATE','en_US','Request for Review Reinstated','{$recipientName}:<br />\n<br />\nWe would like to reinstate our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We hope that you will be able to assist with this press\'s review process.<br />\n<br />\nIf you have any questions, please contact me.',NULL),('REVIEW_REINSTATE','fr_CA','','',NULL),('REVIEW_REMIND','en_US','Submission Review Reminder','{$recipientName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$signature}',NULL),('REVIEW_REMIND','fr_CA','Rappel d\'??valuation','{$recipientName}:<br />\n<br />\nNous vous remercions d\'avoir accept?? d\'??valuer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette ??valuation doit nous parvenir avant le {$reviewDueDate}. Nous vous serions reconnaissants si vous pouviez nous faire parvenir votre ??valuation dans les plus brefs d??lais.<br />\n<br />\nSi vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez r??initialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoy??s par courriel. {$passwordResetUrl}<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nNous vous prions de confirmer si vous ??tes encore disponible pour participer ?? cette ??tape cruciale de notre processus ??ditorial. Nous vous prions d\'agr??er l\'expression de nos sentiments les plus distingu??s. <br />\n<br />\n{$signature}',NULL),('REVIEW_REMIND_AUTO','en_US','Automated Submission Review Reminder','{$recipientName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$signature}',NULL),('REVIEW_REMIND_AUTO','fr_CA','Rappel automatique d\'??valuation d\'une soumission','{$recipientName}:<br />\n<br />\nNous vous remercions d\'avoir accept?? d\'??valuer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette ??valuation doit nous parvenir avant le {$reviewDueDate}. Ce courriel a ??t?? g??n??r?? et envoy?? automatiquement parce que vous avez d??pass?? la date d\'??ch??ance. Toutefois, nous vous serions reconnaissants si vous pouviez nous faire parvenir votre ??valuation dans les plus brefs d??lais.<br />\n<br />\nSi vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez r??initialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoy??s par courriel. {$passwordResetUrl}<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNous vous prions de confirmer si vous ??tes encore disponible pour participer ?? cette ??tape cruciale de notre processus ??ditorial. Veuillez agr??er l\'expression de nos sentiments les plus distingu??s. <br />\n<br />\n{$signature}',NULL),('REVIEW_REMIND_AUTO_ONECLICK','en_US','Automated Submission Review Reminder','{$recipientName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$signature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REMIND_AUTO_ONECLICK','fr_CA','Rappel automatique d\'??valuation d\'une soumission','{$recipientName}:<br />\n<br />\nNous vous remercions d\'avoir accept?? d\'??valuer &quot;{$submissionTitle}&quot; pour la presse {$pressName}. Veuillez noter que cette ??valuation doit nous parvenir avant le {$reviewDueDate}. Ce courriel a ??t?? g??n??r?? et envoy?? automatiquement parce que vous avez d??pass?? la date d\'??ch??ance. Toutefois, nous vous serions reconnaissants si vous pouviez nous faire parvenir votre ??valuation dans les plus brefs d??lais.<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNous vous prions de confirmer si vous ??tes encore disponible pour participer ?? cette ??tape cruciale de notre processus ??ditorial. Veuillez agr??er l\'expression de nos sentiments les plus distingu??s. <br />\n<br />\n{$signature}','Ce courriel est envoy?? automatiquement lorsqu\'une ??valuation est en retard (voir les options d\'??valuation ?? l\'??tape 2 de la section Configuration de la presse) et que l\'acc??s de l\'??valuateur en un seul clic est activ??. Les t??ches pr??vues doivent ??tre activ??es et configur??e (voir le fichier de configuration du site).'),('REVIEW_REQUEST','en_US','Manuscript Review Request','Dear {$recipientName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$signature}<br />\n',NULL),('REVIEW_REQUEST','fr_CA','Requ??te d\'??valuation d\'un manuscrit','Bonjour {$recipientName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nVeuillez ouvrir une session sur le site Web de la presse d\'ici le {$responseDueDate} pour indiquer si vous serez en mesure d\'??valuer l\'article ou non. Ceci vous permettra ??galement d\'acc??der ?? la soumission, et de saisir votre ??valuation et vos recommandations.<br />\n<br />\n<br />\nL\'??valuation doit ??tre termin??e d\'ici le {$reviewDueDate}.<br />\n<br />\nURL de la soumission: {$reviewAssignmentUrl}<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\n<br />\nMerci de votre int??r??t ?? ??valuer des articles pour notre presse.<br />\n<br />\n{$signature}<br />\n',NULL),('REVIEW_RESPONSE_OVERDUE_AUTO','en_US','Manuscript Review Request','Dear {$recipientName},<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$signature}<br />\n',NULL),('REVIEW_RESPONSE_OVERDUE_AUTO','fr_CA','','',NULL),('REVIEW_RESPONSE_OVERDUE_AUTO_ONECLICK','en_US','Manuscript Review Request','{$recipientName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$pressName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$signature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$abstractTermIfEnabled}<br />\n{$submissionAbstract}','This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_RESPONSE_OVERDUE_AUTO_ONECLICK','fr_CA','','','##emails.reviewResponseOverdueAutoOneclick.description##'),('STATISTICS_REPORT_NOTIFICATION','en_US','Editorial activity for {$month}, {$year}','\n{$name}, <br />\n<br />\nYour press health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the press to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published book stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$signature}','This email is automatically sent monthly to editors and press managers to provide them a system health overview.'),('STATISTICS_REPORT_NOTIFICATION','fr_CA','','','##emails.statisticsReportNotification.description##'),('SUBMISSION_ACK','en_US','Thank you for your submission to {$pressName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$pressName}. We have received your submission, {$submissionTitle}, and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: {$authorSubmissionUrl}</p><p>If you have been logged out, you can login again with the username {$recipientUsername}</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Thank you for considering this journal as a venue for your work.</p>{$signature}','This email, when enabled, is automatically sent to an author when they submit to the journal. It provides information about tracking the submission through the editorial process and thanks the author for the submission.'),('SUBMISSION_ACK','fr_CA','Accus?? de r??ception de la soumission','{$recipientName},<br />\n<br />\nNous vous remercions d\'avoir soumis le manuscrit intitul?? ?? {$submissionTitle} ?? ?? la revue {$pressName}. Gr??ce ?? notre syst??me de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d\'??dition en acc??dant au site Web de la revue :<br />\n<br />\nURL de la soumission??: {$submissionUrl}<br />\nNom d\'utilisateur-trice??: {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n\'h??sitez pas ?? communiquer avec nous. Nous vous remercions d\'avoir pens?? ?? notre revue pour la publication de vos travaux.<br />\n<br />\n{$signature}','##emails.submissionAck.description##'),('SUBMISSION_ACK_NOT_USER','en_US','Submission Acknowledgement','Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$pressName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n{$signature}','This email, when enabled, is automatically sent to the other authors who are not users within OMP specified during the submission process.'),('SUBMISSION_ACK_NOT_USER','fr_CA','Accus?? de r??ception d\'une soumission','Bonjour,<br />\n<br />\n{$submitterName} a envoy?? un manuscrit intitul?? &quot;{$submissionTitle}&quot; ?? la presse {$pressName}. <br />\n<br />\nSi vous avez des questions, n\'h??sitez pas ?? me contacter. Merci d\'avoir envoy?? votre article ?? cette presse.<br />\n<br />\n{$signature}','Lorsqu\'il est activ??, ce courriel est envoy?? automatiquement aux autres auteurs qui ne font pas partie des utilisateurs d\'OMP identifi??s pendant le processus de soumission.'),('USER_REGISTER','en_US','Press Registration','{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$pressName}. We have included your username and password in this email, which are needed for all work with this press through its website. At any point, you can ask to be removed from the list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('USER_REGISTER','fr_CA','Inscription ?? la presse','{$recipientName}<br />\n<br />\nVous ??tes d??sormais inscrit ?? la presse {$pressName}. Ce courriel contient votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin pour tous vos travaux au sein de la presse. Vous pouvez demander que l\'on retire votre nom de la liste des utilisateurs en tout temps. Il suffit de me contacter.<br />\n<br />\n<br />\nNom d\'utilisateur: {$recipientUsername}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$signature}','Ce courriel est envoy?? ?? un nouvel utilisateur afin de lui souhaiter la bienvenue dans le syst??me et lui fournir son nom d\'utilisateur et son mot de passe pour ses dossiers.'),('USER_VALIDATE_CONTEXT','en_US','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$pressName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$signature}',NULL),('USER_VALIDATE_CONTEXT','fr_CA','','',NULL),('USER_VALIDATE_SITE','en_US','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$signature}',NULL),('USER_VALIDATE_SITE','fr_CA','','',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=472 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,19,'2022-06-21 21:07:10',268435458,'submission.event.general.metadataUpdated',0),(2,515,1,19,'2022-06-21 21:07:13',1342177281,'submission.event.fileUploaded',0),(3,1048585,1,19,'2022-06-21 21:07:13',1342177288,'submission.event.fileRevised',0),(4,515,1,19,'2022-06-21 21:07:13',1342177296,'submission.event.fileEdited',0),(5,1048585,1,19,'2022-06-21 21:07:13',1342177296,'submission.event.fileEdited',0),(6,1048585,1,19,'2022-06-21 21:07:29',268435458,'submission.event.general.metadataUpdated',0),(7,1048585,1,19,'2022-06-21 21:07:30',268435457,'submission.event.submissionSubmitted',0),(8,1048585,1,3,'2022-06-21 21:07:42',805306371,'editor.submission.decision.sendExternalReview.log',0),(9,515,2,3,'2022-06-21 21:07:43',1342177281,'submission.event.fileUploaded',0),(10,1048585,1,3,'2022-06-21 21:07:43',1342177288,'submission.event.fileRevised',0),(11,1048585,1,3,'2022-06-21 21:07:53',1073741825,'log.review.reviewerAssigned',0),(12,1048585,1,3,'2022-06-21 21:08:00',805306371,'editor.submission.decision.accept.log',0),(13,1048585,1,3,'2022-06-21 21:08:09',268435459,'submission.event.participantAdded',0),(14,1048585,2,20,'2022-06-21 21:08:20',268435458,'submission.event.general.metadataUpdated',0),(15,515,3,20,'2022-06-21 21:08:22',1342177281,'submission.event.fileUploaded',0),(16,1048585,2,20,'2022-06-21 21:08:22',1342177288,'submission.event.fileRevised',0),(17,515,3,20,'2022-06-21 21:08:22',1342177296,'submission.event.fileEdited',0),(18,1048585,2,20,'2022-06-21 21:08:22',1342177296,'submission.event.fileEdited',0),(19,515,4,20,'2022-06-21 21:08:22',1342177281,'submission.event.fileUploaded',0),(20,1048585,2,20,'2022-06-21 21:08:22',1342177288,'submission.event.fileRevised',0),(21,515,4,20,'2022-06-21 21:08:23',1342177296,'submission.event.fileEdited',0),(22,1048585,2,20,'2022-06-21 21:08:23',1342177296,'submission.event.fileEdited',0),(23,515,5,20,'2022-06-21 21:08:23',1342177281,'submission.event.fileUploaded',0),(24,1048585,2,20,'2022-06-21 21:08:23',1342177288,'submission.event.fileRevised',0),(25,515,5,20,'2022-06-21 21:08:23',1342177296,'submission.event.fileEdited',0),(26,1048585,2,20,'2022-06-21 21:08:23',1342177296,'submission.event.fileEdited',0),(27,515,6,20,'2022-06-21 21:08:23',1342177281,'submission.event.fileUploaded',0),(28,1048585,2,20,'2022-06-21 21:08:23',1342177288,'submission.event.fileRevised',0),(29,515,6,20,'2022-06-21 21:08:24',1342177296,'submission.event.fileEdited',0),(30,1048585,2,20,'2022-06-21 21:08:24',1342177296,'submission.event.fileEdited',0),(31,1048585,2,20,'2022-06-21 21:10:07',268435458,'submission.event.general.metadataUpdated',0),(32,1048585,2,20,'2022-06-21 21:10:10',268435457,'submission.event.submissionSubmitted',0),(33,1048585,2,3,'2022-06-21 21:10:29',805306371,'editor.submission.decision.sendExternalReview.log',0),(34,515,7,3,'2022-06-21 21:10:29',1342177281,'submission.event.fileUploaded',0),(35,1048585,2,3,'2022-06-21 21:10:29',1342177288,'submission.event.fileRevised',0),(36,515,8,3,'2022-06-21 21:10:29',1342177281,'submission.event.fileUploaded',0),(37,1048585,2,3,'2022-06-21 21:10:29',1342177288,'submission.event.fileRevised',0),(38,515,9,3,'2022-06-21 21:10:30',1342177281,'submission.event.fileUploaded',0),(39,1048585,2,3,'2022-06-21 21:10:30',1342177288,'submission.event.fileRevised',0),(40,515,10,3,'2022-06-21 21:10:30',1342177281,'submission.event.fileUploaded',0),(41,1048585,2,3,'2022-06-21 21:10:30',1342177288,'submission.event.fileRevised',0),(42,1048585,2,3,'2022-06-21 21:10:44',1073741825,'log.review.reviewerAssigned',0),(43,1048585,2,3,'2022-06-21 21:10:54',1073741825,'log.review.reviewerAssigned',0),(44,1048585,3,21,'2022-06-21 21:11:05',268435458,'submission.event.general.metadataUpdated',0),(45,515,11,21,'2022-06-21 21:11:07',1342177281,'submission.event.fileUploaded',0),(46,1048585,3,21,'2022-06-21 21:11:07',1342177288,'submission.event.fileRevised',0),(47,515,11,21,'2022-06-21 21:11:08',1342177296,'submission.event.fileEdited',0),(48,1048585,3,21,'2022-06-21 21:11:08',1342177296,'submission.event.fileEdited',0),(49,1048585,3,21,'2022-06-21 21:11:43',268435458,'submission.event.general.metadataUpdated',0),(50,1048585,3,21,'2022-06-21 21:11:45',268435457,'submission.event.submissionSubmitted',0),(51,1048585,4,22,'2022-06-21 21:11:55',268435458,'submission.event.general.metadataUpdated',0),(52,515,12,22,'2022-06-21 21:11:57',1342177281,'submission.event.fileUploaded',0),(53,1048585,4,22,'2022-06-21 21:11:57',1342177288,'submission.event.fileRevised',0),(54,515,12,22,'2022-06-21 21:11:57',1342177296,'submission.event.fileEdited',0),(55,1048585,4,22,'2022-06-21 21:11:57',1342177296,'submission.event.fileEdited',0),(56,515,13,22,'2022-06-21 21:11:57',1342177281,'submission.event.fileUploaded',0),(57,1048585,4,22,'2022-06-21 21:11:57',1342177288,'submission.event.fileRevised',0),(58,515,13,22,'2022-06-21 21:11:58',1342177296,'submission.event.fileEdited',0),(59,1048585,4,22,'2022-06-21 21:11:58',1342177296,'submission.event.fileEdited',0),(60,515,14,22,'2022-06-21 21:11:58',1342177281,'submission.event.fileUploaded',0),(61,1048585,4,22,'2022-06-21 21:11:58',1342177288,'submission.event.fileRevised',0),(62,515,14,22,'2022-06-21 21:11:58',1342177296,'submission.event.fileEdited',0),(63,1048585,4,22,'2022-06-21 21:11:58',1342177296,'submission.event.fileEdited',0),(64,515,15,22,'2022-06-21 21:11:59',1342177281,'submission.event.fileUploaded',0),(65,1048585,4,22,'2022-06-21 21:11:59',1342177288,'submission.event.fileRevised',0),(66,515,15,22,'2022-06-21 21:11:59',1342177296,'submission.event.fileEdited',0),(67,1048585,4,22,'2022-06-21 21:11:59',1342177296,'submission.event.fileEdited',0),(68,1048585,4,22,'2022-06-21 21:13:12',268435458,'submission.event.general.metadataUpdated',0),(69,1048585,4,22,'2022-06-21 21:13:14',268435457,'submission.event.submissionSubmitted',0),(70,1048585,4,3,'2022-06-21 21:13:31',805306371,'editor.submission.decision.sendInternalReview.log',0),(71,515,16,3,'2022-06-21 21:13:31',1342177281,'submission.event.fileUploaded',0),(72,1048585,4,3,'2022-06-21 21:13:31',1342177288,'submission.event.fileRevised',0),(73,515,17,3,'2022-06-21 21:13:31',1342177281,'submission.event.fileUploaded',0),(74,1048585,4,3,'2022-06-21 21:13:31',1342177288,'submission.event.fileRevised',0),(75,515,18,3,'2022-06-21 21:13:31',1342177281,'submission.event.fileUploaded',0),(76,1048585,4,3,'2022-06-21 21:13:31',1342177288,'submission.event.fileRevised',0),(77,515,19,3,'2022-06-21 21:13:31',1342177281,'submission.event.fileUploaded',0),(78,1048585,4,3,'2022-06-21 21:13:31',1342177288,'submission.event.fileRevised',0),(79,1048585,4,3,'2022-06-21 21:13:44',1073741825,'log.review.reviewerAssigned',0),(80,1048585,4,3,'2022-06-21 21:13:51',805306371,'editor.submission.decision.sendExternalReview.log',0),(81,1048585,4,3,'2022-06-21 21:14:05',1073741825,'log.review.reviewerAssigned',0),(82,1048585,4,3,'2022-06-21 21:14:13',805306371,'editor.submission.decision.accept.log',0),(83,1048585,4,3,'2022-06-21 21:14:26',268435459,'submission.event.participantAdded',0),(84,1048585,4,3,'2022-06-21 21:14:35',805306371,'editor.submission.decision.sendToProduction.log',0),(85,1048585,4,3,'2022-06-21 21:14:51',268435459,'submission.event.participantAdded',0),(86,1048585,4,3,'2022-06-21 21:15:20',268435474,'submission.event.publicationFormatCreated',0),(87,1048585,5,23,'2022-06-21 21:15:30',268435458,'submission.event.general.metadataUpdated',0),(88,515,20,23,'2022-06-21 21:15:32',1342177281,'submission.event.fileUploaded',0),(89,1048585,5,23,'2022-06-21 21:15:32',1342177288,'submission.event.fileRevised',0),(90,515,20,23,'2022-06-21 21:15:33',1342177296,'submission.event.fileEdited',0),(91,1048585,5,23,'2022-06-21 21:15:33',1342177296,'submission.event.fileEdited',0),(92,1048585,5,23,'2022-06-21 21:16:08',268435458,'submission.event.general.metadataUpdated',0),(93,1048585,5,23,'2022-06-21 21:16:10',268435457,'submission.event.submissionSubmitted',0),(94,1048585,5,3,'2022-06-21 21:16:24',805306371,'editor.submission.decision.sendInternalReview.log',0),(95,515,21,3,'2022-06-21 21:16:24',1342177281,'submission.event.fileUploaded',0),(96,1048585,5,3,'2022-06-21 21:16:24',1342177288,'submission.event.fileRevised',0),(97,1048585,5,3,'2022-06-21 21:16:35',1073741825,'log.review.reviewerAssigned',0),(98,1048585,5,3,'2022-06-21 21:16:41',805306371,'editor.submission.decision.sendExternalReview.log',0),(99,1048585,5,3,'2022-06-21 21:16:53',1073741825,'log.review.reviewerAssigned',0),(100,1048585,5,3,'2022-06-21 21:17:01',805306371,'editor.submission.decision.accept.log',0),(101,1048585,5,3,'2022-06-21 21:17:11',268435459,'submission.event.participantAdded',0),(102,1048585,5,3,'2022-06-21 21:17:19',805306371,'editor.submission.decision.sendToProduction.log',0),(103,1048585,5,3,'2022-06-21 21:17:32',268435459,'submission.event.participantAdded',0),(104,1048585,5,3,'2022-06-21 21:17:39',268435459,'submission.event.participantAdded',0),(105,1048585,5,3,'2022-06-21 21:17:47',268435474,'submission.event.publicationFormatCreated',0),(106,515,22,3,'2022-06-21 21:17:50',1342177281,'submission.event.fileUploaded',0),(107,1048585,5,3,'2022-06-21 21:17:50',1342177288,'submission.event.fileRevised',0),(108,1048585,5,3,'2022-06-21 21:17:53',268435464,'submission.event.publicationFormatPublished',0),(109,1048585,5,3,'2022-06-21 21:17:56',268435476,'submission.event.publicationFormatMadeAvailable',0),(110,515,22,3,'2022-06-21 21:17:58',1342177296,'submission.event.fileEdited',0),(111,1048585,5,3,'2022-06-21 21:17:58',1342177296,'submission.event.fileEdited',0),(112,515,22,3,'2022-06-21 21:17:58',1342177287,'submission.event.signoffSignoff',0),(113,515,22,3,'2022-06-21 21:18:02',1342177296,'submission.event.fileEdited',0),(114,1048585,5,3,'2022-06-21 21:18:02',1342177296,'submission.event.fileEdited',0),(115,1048585,5,3,'2022-06-21 21:18:04',268435462,'publication.event.published',0),(116,1048585,6,24,'2022-06-21 21:18:15',268435458,'submission.event.general.metadataUpdated',0),(117,515,23,24,'2022-06-21 21:18:18',1342177281,'submission.event.fileUploaded',0),(118,1048585,6,24,'2022-06-21 21:18:18',1342177288,'submission.event.fileRevised',0),(119,515,23,24,'2022-06-21 21:18:18',1342177296,'submission.event.fileEdited',0),(120,1048585,6,24,'2022-06-21 21:18:18',1342177296,'submission.event.fileEdited',0),(121,515,24,24,'2022-06-21 21:18:18',1342177281,'submission.event.fileUploaded',0),(122,1048585,6,24,'2022-06-21 21:18:18',1342177288,'submission.event.fileRevised',0),(123,515,24,24,'2022-06-21 21:18:19',1342177296,'submission.event.fileEdited',0),(124,1048585,6,24,'2022-06-21 21:18:19',1342177296,'submission.event.fileEdited',0),(125,515,25,24,'2022-06-21 21:18:19',1342177281,'submission.event.fileUploaded',0),(126,1048585,6,24,'2022-06-21 21:18:19',1342177288,'submission.event.fileRevised',0),(127,515,25,24,'2022-06-21 21:18:19',1342177296,'submission.event.fileEdited',0),(128,1048585,6,24,'2022-06-21 21:18:19',1342177296,'submission.event.fileEdited',0),(129,515,26,24,'2022-06-21 21:18:19',1342177281,'submission.event.fileUploaded',0),(130,1048585,6,24,'2022-06-21 21:18:19',1342177288,'submission.event.fileRevised',0),(131,515,26,24,'2022-06-21 21:18:19',1342177296,'submission.event.fileEdited',0),(132,1048585,6,24,'2022-06-21 21:18:19',1342177296,'submission.event.fileEdited',0),(133,1048585,6,24,'2022-06-21 21:19:16',268435458,'submission.event.general.metadataUpdated',0),(134,1048585,6,24,'2022-06-21 21:19:18',268435457,'submission.event.submissionSubmitted',0),(135,1048585,6,3,'2022-06-21 21:19:36',805306371,'editor.submission.decision.sendInternalReview.log',0),(136,515,27,3,'2022-06-21 21:19:36',1342177281,'submission.event.fileUploaded',0),(137,1048585,6,3,'2022-06-21 21:19:36',1342177288,'submission.event.fileRevised',0),(138,515,28,3,'2022-06-21 21:19:36',1342177281,'submission.event.fileUploaded',0),(139,1048585,6,3,'2022-06-21 21:19:36',1342177288,'submission.event.fileRevised',0),(140,515,29,3,'2022-06-21 21:19:36',1342177281,'submission.event.fileUploaded',0),(141,1048585,6,3,'2022-06-21 21:19:36',1342177288,'submission.event.fileRevised',0),(142,515,30,3,'2022-06-21 21:19:36',1342177281,'submission.event.fileUploaded',0),(143,1048585,6,3,'2022-06-21 21:19:36',1342177288,'submission.event.fileRevised',0),(144,1048585,6,3,'2022-06-21 21:19:49',268435459,'submission.event.participantAdded',0),(145,1048585,6,6,'2022-06-21 21:20:06',805306372,'editor.submission.recommend.accept.log',0),(146,1048585,7,25,'2022-06-21 21:20:35',268435458,'submission.event.general.metadataUpdated',0),(147,515,31,25,'2022-06-21 21:20:37',1342177281,'submission.event.fileUploaded',0),(148,1048585,7,25,'2022-06-21 21:20:37',1342177288,'submission.event.fileRevised',0),(149,515,31,25,'2022-06-21 21:20:38',1342177296,'submission.event.fileEdited',0),(150,1048585,7,25,'2022-06-21 21:20:38',1342177296,'submission.event.fileEdited',0),(151,515,32,25,'2022-06-21 21:20:38',1342177281,'submission.event.fileUploaded',0),(152,1048585,7,25,'2022-06-21 21:20:38',1342177288,'submission.event.fileRevised',0),(153,515,32,25,'2022-06-21 21:20:38',1342177296,'submission.event.fileEdited',0),(154,1048585,7,25,'2022-06-21 21:20:38',1342177296,'submission.event.fileEdited',0),(155,515,33,25,'2022-06-21 21:20:38',1342177281,'submission.event.fileUploaded',0),(156,1048585,7,25,'2022-06-21 21:20:38',1342177288,'submission.event.fileRevised',0),(157,515,33,25,'2022-06-21 21:20:38',1342177296,'submission.event.fileEdited',0),(158,1048585,7,25,'2022-06-21 21:20:38',1342177296,'submission.event.fileEdited',0),(159,515,34,25,'2022-06-21 21:20:39',1342177281,'submission.event.fileUploaded',0),(160,1048585,7,25,'2022-06-21 21:20:39',1342177288,'submission.event.fileRevised',0),(161,515,34,25,'2022-06-21 21:20:39',1342177296,'submission.event.fileEdited',0),(162,1048585,7,25,'2022-06-21 21:20:39',1342177296,'submission.event.fileEdited',0),(163,515,35,25,'2022-06-21 21:20:39',1342177281,'submission.event.fileUploaded',0),(164,1048585,7,25,'2022-06-21 21:20:39',1342177288,'submission.event.fileRevised',0),(165,515,35,25,'2022-06-21 21:20:40',1342177296,'submission.event.fileEdited',0),(166,1048585,7,25,'2022-06-21 21:20:40',1342177296,'submission.event.fileEdited',0),(167,1048585,7,25,'2022-06-21 21:22:24',268435458,'submission.event.general.metadataUpdated',0),(168,1048585,7,25,'2022-06-21 21:22:26',268435457,'submission.event.submissionSubmitted',0),(169,1048585,7,3,'2022-06-21 21:22:45',805306371,'editor.submission.decision.sendExternalReview.log',0),(170,515,36,3,'2022-06-21 21:22:45',1342177281,'submission.event.fileUploaded',0),(171,1048585,7,3,'2022-06-21 21:22:45',1342177288,'submission.event.fileRevised',0),(172,515,37,3,'2022-06-21 21:22:45',1342177281,'submission.event.fileUploaded',0),(173,1048585,7,3,'2022-06-21 21:22:45',1342177288,'submission.event.fileRevised',0),(174,515,38,3,'2022-06-21 21:22:45',1342177281,'submission.event.fileUploaded',0),(175,1048585,7,3,'2022-06-21 21:22:45',1342177288,'submission.event.fileRevised',0),(176,515,39,3,'2022-06-21 21:22:45',1342177281,'submission.event.fileUploaded',0),(177,1048585,7,3,'2022-06-21 21:22:45',1342177288,'submission.event.fileRevised',0),(178,515,40,3,'2022-06-21 21:22:45',1342177281,'submission.event.fileUploaded',0),(179,1048585,7,3,'2022-06-21 21:22:45',1342177288,'submission.event.fileRevised',0),(180,1048585,7,3,'2022-06-21 21:22:59',1073741825,'log.review.reviewerAssigned',0),(181,1048585,7,3,'2022-06-21 21:23:07',805306371,'editor.submission.decision.accept.log',0),(182,1048585,7,3,'2022-06-21 21:23:22',268435459,'submission.event.participantAdded',0),(183,1048585,8,3,'2022-06-21 21:23:31',268435458,'submission.event.general.metadataUpdated',0),(184,515,41,3,'2022-06-21 21:23:34',1342177281,'submission.event.fileUploaded',0),(185,1048585,8,3,'2022-06-21 21:23:34',1342177288,'submission.event.fileRevised',0),(186,515,41,3,'2022-06-21 21:23:34',1342177296,'submission.event.fileEdited',0),(187,1048585,8,3,'2022-06-21 21:23:34',1342177296,'submission.event.fileEdited',0),(188,1048585,8,3,'2022-06-21 21:23:36',268435458,'submission.event.general.metadataUpdated',0),(189,1048585,8,3,'2022-06-21 21:23:36',268435457,'submission.event.submissionSubmitted',0),(190,1048585,9,26,'2022-06-21 21:23:46',268435458,'submission.event.general.metadataUpdated',0),(191,515,42,26,'2022-06-21 21:23:48',1342177281,'submission.event.fileUploaded',0),(192,1048585,9,26,'2022-06-21 21:23:48',1342177288,'submission.event.fileRevised',0),(193,515,42,26,'2022-06-21 21:23:48',1342177296,'submission.event.fileEdited',0),(194,1048585,9,26,'2022-06-21 21:23:48',1342177296,'submission.event.fileEdited',0),(195,515,43,26,'2022-06-21 21:23:49',1342177281,'submission.event.fileUploaded',0),(196,1048585,9,26,'2022-06-21 21:23:49',1342177288,'submission.event.fileRevised',0),(197,515,43,26,'2022-06-21 21:23:49',1342177296,'submission.event.fileEdited',0),(198,1048585,9,26,'2022-06-21 21:23:49',1342177296,'submission.event.fileEdited',0),(199,515,44,26,'2022-06-21 21:23:49',1342177281,'submission.event.fileUploaded',0),(200,1048585,9,26,'2022-06-21 21:23:49',1342177288,'submission.event.fileRevised',0),(201,515,44,26,'2022-06-21 21:23:49',1342177296,'submission.event.fileEdited',0),(202,1048585,9,26,'2022-06-21 21:23:49',1342177296,'submission.event.fileEdited',0),(203,515,45,26,'2022-06-21 21:23:50',1342177281,'submission.event.fileUploaded',0),(204,1048585,9,26,'2022-06-21 21:23:50',1342177288,'submission.event.fileRevised',0),(205,515,45,26,'2022-06-21 21:23:50',1342177296,'submission.event.fileEdited',0),(206,1048585,9,26,'2022-06-21 21:23:50',1342177296,'submission.event.fileEdited',0),(207,515,46,26,'2022-06-21 21:23:50',1342177281,'submission.event.fileUploaded',0),(208,1048585,9,26,'2022-06-21 21:23:50',1342177288,'submission.event.fileRevised',0),(209,515,46,26,'2022-06-21 21:23:50',1342177296,'submission.event.fileEdited',0),(210,1048585,9,26,'2022-06-21 21:23:50',1342177296,'submission.event.fileEdited',0),(211,1048585,9,26,'2022-06-21 21:25:22',268435458,'submission.event.general.metadataUpdated',0),(212,1048585,9,26,'2022-06-21 21:25:24',268435457,'submission.event.submissionSubmitted',0),(213,1048585,9,3,'2022-06-21 21:25:44',805306371,'editor.submission.decision.sendInternalReview.log',0),(214,515,47,3,'2022-06-21 21:25:44',1342177281,'submission.event.fileUploaded',0),(215,1048585,9,3,'2022-06-21 21:25:44',1342177288,'submission.event.fileRevised',0),(216,515,48,3,'2022-06-21 21:25:44',1342177281,'submission.event.fileUploaded',0),(217,1048585,9,3,'2022-06-21 21:25:44',1342177288,'submission.event.fileRevised',0),(218,515,49,3,'2022-06-21 21:25:44',1342177281,'submission.event.fileUploaded',0),(219,1048585,9,3,'2022-06-21 21:25:44',1342177288,'submission.event.fileRevised',0),(220,515,50,3,'2022-06-21 21:25:44',1342177281,'submission.event.fileUploaded',0),(221,1048585,9,3,'2022-06-21 21:25:44',1342177288,'submission.event.fileRevised',0),(222,515,51,3,'2022-06-21 21:25:44',1342177281,'submission.event.fileUploaded',0),(223,1048585,9,3,'2022-06-21 21:25:44',1342177288,'submission.event.fileRevised',0),(224,1048585,10,27,'2022-06-21 21:25:59',268435458,'submission.event.general.metadataUpdated',0),(225,515,52,27,'2022-06-21 21:26:01',1342177281,'submission.event.fileUploaded',0),(226,1048585,10,27,'2022-06-21 21:26:01',1342177288,'submission.event.fileRevised',0),(227,515,52,27,'2022-06-21 21:26:02',1342177296,'submission.event.fileEdited',0),(228,1048585,10,27,'2022-06-21 21:26:02',1342177296,'submission.event.fileEdited',0),(229,1048585,10,27,'2022-06-21 21:26:58',268435458,'submission.event.general.metadataUpdated',0),(230,1048585,10,27,'2022-06-21 21:26:59',268435457,'submission.event.submissionSubmitted',0),(231,1048585,11,28,'2022-06-21 21:27:09',268435458,'submission.event.general.metadataUpdated',0),(232,515,53,28,'2022-06-21 21:27:11',1342177281,'submission.event.fileUploaded',0),(233,1048585,11,28,'2022-06-21 21:27:11',1342177288,'submission.event.fileRevised',0),(234,515,53,28,'2022-06-21 21:27:12',1342177296,'submission.event.fileEdited',0),(235,1048585,11,28,'2022-06-21 21:27:12',1342177296,'submission.event.fileEdited',0),(236,1048585,11,28,'2022-06-21 21:27:21',268435458,'submission.event.general.metadataUpdated',0),(237,1048585,11,28,'2022-06-21 21:27:22',268435457,'submission.event.submissionSubmitted',0),(238,1048585,11,3,'2022-06-21 21:27:35',805306371,'editor.submission.decision.sendInternalReview.log',0),(239,515,54,3,'2022-06-21 21:27:35',1342177281,'submission.event.fileUploaded',0),(240,1048585,11,3,'2022-06-21 21:27:35',1342177288,'submission.event.fileRevised',0),(241,1048585,11,3,'2022-06-21 21:27:45',1073741825,'log.review.reviewerAssigned',0),(242,1048585,11,3,'2022-06-21 21:27:50',805306371,'editor.submission.decision.sendExternalReview.log',0),(243,1048585,11,3,'2022-06-21 21:28:01',1073741825,'log.review.reviewerAssigned',0),(244,1048585,11,3,'2022-06-21 21:28:10',1073741825,'log.review.reviewerAssigned',0),(245,1048585,11,10,'2022-06-21 21:28:18',1073741830,'log.review.reviewAccepted',0),(246,1048585,11,10,'2022-06-21 21:28:23',1073741848,'log.review.reviewReady',0),(247,1048585,11,12,'2022-06-21 21:28:31',1073741830,'log.review.reviewAccepted',0),(248,1048585,11,12,'2022-06-21 21:28:35',1073741848,'log.review.reviewReady',0),(249,1048585,11,3,'2022-06-21 21:28:55',805306371,'editor.submission.decision.accept.log',0),(250,1048585,11,3,'2022-06-21 21:28:55',1073741856,'submission.event.decisionReviewerEmailSent',0),(251,1048585,12,29,'2022-06-21 21:29:11',268435458,'submission.event.general.metadataUpdated',0),(252,515,55,29,'2022-06-21 21:29:13',1342177281,'submission.event.fileUploaded',0),(253,1048585,12,29,'2022-06-21 21:29:13',1342177288,'submission.event.fileRevised',0),(254,515,55,29,'2022-06-21 21:29:14',1342177296,'submission.event.fileEdited',0),(255,1048585,12,29,'2022-06-21 21:29:14',1342177296,'submission.event.fileEdited',0),(256,515,56,29,'2022-06-21 21:29:14',1342177281,'submission.event.fileUploaded',0),(257,1048585,12,29,'2022-06-21 21:29:14',1342177288,'submission.event.fileRevised',0),(258,515,56,29,'2022-06-21 21:29:14',1342177296,'submission.event.fileEdited',0),(259,1048585,12,29,'2022-06-21 21:29:14',1342177296,'submission.event.fileEdited',0),(260,515,57,29,'2022-06-21 21:29:14',1342177281,'submission.event.fileUploaded',0),(261,1048585,12,29,'2022-06-21 21:29:14',1342177288,'submission.event.fileRevised',0),(262,515,57,29,'2022-06-21 21:29:15',1342177296,'submission.event.fileEdited',0),(263,1048585,12,29,'2022-06-21 21:29:15',1342177296,'submission.event.fileEdited',0),(264,1048585,12,29,'2022-06-21 21:30:36',268435458,'submission.event.general.metadataUpdated',0),(265,1048585,12,29,'2022-06-21 21:30:38',268435457,'submission.event.submissionSubmitted',0),(266,1048585,12,3,'2022-06-21 21:30:57',805306371,'editor.submission.decision.sendInternalReview.log',0),(267,515,58,3,'2022-06-21 21:30:57',1342177281,'submission.event.fileUploaded',0),(268,1048585,12,3,'2022-06-21 21:30:57',1342177288,'submission.event.fileRevised',0),(269,515,59,3,'2022-06-21 21:30:57',1342177281,'submission.event.fileUploaded',0),(270,1048585,12,3,'2022-06-21 21:30:57',1342177288,'submission.event.fileRevised',0),(271,515,60,3,'2022-06-21 21:30:57',1342177281,'submission.event.fileUploaded',0),(272,1048585,12,3,'2022-06-21 21:30:57',1342177288,'submission.event.fileRevised',0),(273,1048585,12,3,'2022-06-21 21:31:11',1073741825,'log.review.reviewerAssigned',0),(274,1048585,12,3,'2022-06-21 21:31:20',1073741825,'log.review.reviewerAssigned',0),(275,1048585,12,3,'2022-06-21 21:31:30',1073741825,'log.review.reviewerAssigned',0),(276,1048585,12,8,'2022-06-21 21:31:41',1073741830,'log.review.reviewAccepted',0),(277,1048585,12,8,'2022-06-21 21:31:46',1073741848,'log.review.reviewReady',0),(278,1048585,13,30,'2022-06-21 21:31:58',268435458,'submission.event.general.metadataUpdated',0),(279,515,61,30,'2022-06-21 21:32:00',1342177281,'submission.event.fileUploaded',0),(280,1048585,13,30,'2022-06-21 21:32:00',1342177288,'submission.event.fileRevised',0),(281,515,61,30,'2022-06-21 21:32:00',1342177296,'submission.event.fileEdited',0),(282,1048585,13,30,'2022-06-21 21:32:00',1342177296,'submission.event.fileEdited',0),(283,515,62,30,'2022-06-21 21:32:01',1342177281,'submission.event.fileUploaded',0),(284,1048585,13,30,'2022-06-21 21:32:01',1342177288,'submission.event.fileRevised',0),(285,515,62,30,'2022-06-21 21:32:01',1342177296,'submission.event.fileEdited',0),(286,1048585,13,30,'2022-06-21 21:32:01',1342177296,'submission.event.fileEdited',0),(287,515,63,30,'2022-06-21 21:32:01',1342177281,'submission.event.fileUploaded',0),(288,1048585,13,30,'2022-06-21 21:32:01',1342177288,'submission.event.fileRevised',0),(289,515,63,30,'2022-06-21 21:32:01',1342177296,'submission.event.fileEdited',0),(290,1048585,13,30,'2022-06-21 21:32:01',1342177296,'submission.event.fileEdited',0),(291,1048585,13,30,'2022-06-21 21:32:52',268435458,'submission.event.general.metadataUpdated',0),(292,1048585,13,30,'2022-06-21 21:32:55',268435457,'submission.event.submissionSubmitted',0),(293,1048585,13,3,'2022-06-21 21:33:11',805306371,'editor.submission.decision.sendInternalReview.log',0),(294,515,64,3,'2022-06-21 21:33:11',1342177281,'submission.event.fileUploaded',0),(295,1048585,13,3,'2022-06-21 21:33:11',1342177288,'submission.event.fileRevised',0),(296,515,65,3,'2022-06-21 21:33:11',1342177281,'submission.event.fileUploaded',0),(297,1048585,13,3,'2022-06-21 21:33:11',1342177288,'submission.event.fileRevised',0),(298,515,66,3,'2022-06-21 21:33:11',1342177281,'submission.event.fileUploaded',0),(299,1048585,13,3,'2022-06-21 21:33:11',1342177288,'submission.event.fileRevised',0),(300,1048585,13,3,'2022-06-21 21:33:23',1073741825,'log.review.reviewerAssigned',0),(301,1048585,13,3,'2022-06-21 21:33:29',805306371,'editor.submission.decision.sendExternalReview.log',0),(302,1048585,13,3,'2022-06-21 21:33:42',1073741825,'log.review.reviewerAssigned',0),(303,1048585,13,3,'2022-06-21 21:33:52',1073741825,'log.review.reviewerAssigned',0),(304,1048585,13,3,'2022-06-21 21:34:02',1073741825,'log.review.reviewerAssigned',0),(305,1048585,13,10,'2022-06-21 21:34:12',1073741830,'log.review.reviewAccepted',0),(306,1048585,13,10,'2022-06-21 21:34:17',1073741848,'log.review.reviewReady',0),(307,1048585,13,12,'2022-06-21 21:34:28',1073741830,'log.review.reviewAccepted',0),(308,1048585,13,12,'2022-06-21 21:34:33',1073741848,'log.review.reviewReady',0),(309,1048585,13,3,'2022-06-21 21:34:57',805306371,'editor.submission.decision.accept.log',0),(310,1048585,13,3,'2022-06-21 21:34:57',1073741856,'submission.event.decisionReviewerEmailSent',0),(311,1048585,14,31,'2022-06-21 21:35:15',268435458,'submission.event.general.metadataUpdated',0),(312,515,67,31,'2022-06-21 21:35:17',1342177281,'submission.event.fileUploaded',0),(313,1048585,14,31,'2022-06-21 21:35:17',1342177288,'submission.event.fileRevised',0),(314,515,67,31,'2022-06-21 21:35:17',1342177296,'submission.event.fileEdited',0),(315,1048585,14,31,'2022-06-21 21:35:17',1342177296,'submission.event.fileEdited',0),(316,515,68,31,'2022-06-21 21:35:17',1342177281,'submission.event.fileUploaded',0),(317,1048585,14,31,'2022-06-21 21:35:17',1342177288,'submission.event.fileRevised',0),(318,515,68,31,'2022-06-21 21:35:18',1342177296,'submission.event.fileEdited',0),(319,1048585,14,31,'2022-06-21 21:35:18',1342177296,'submission.event.fileEdited',0),(320,515,69,31,'2022-06-21 21:35:18',1342177281,'submission.event.fileUploaded',0),(321,1048585,14,31,'2022-06-21 21:35:18',1342177288,'submission.event.fileRevised',0),(322,515,69,31,'2022-06-21 21:35:18',1342177296,'submission.event.fileEdited',0),(323,1048585,14,31,'2022-06-21 21:35:18',1342177296,'submission.event.fileEdited',0),(324,515,70,31,'2022-06-21 21:35:18',1342177281,'submission.event.fileUploaded',0),(325,1048585,14,31,'2022-06-21 21:35:18',1342177288,'submission.event.fileRevised',0),(326,515,70,31,'2022-06-21 21:35:19',1342177296,'submission.event.fileEdited',0),(327,1048585,14,31,'2022-06-21 21:35:19',1342177296,'submission.event.fileEdited',0),(328,515,71,31,'2022-06-21 21:35:19',1342177281,'submission.event.fileUploaded',0),(329,1048585,14,31,'2022-06-21 21:35:19',1342177288,'submission.event.fileRevised',0),(330,515,71,31,'2022-06-21 21:35:19',1342177296,'submission.event.fileEdited',0),(331,1048585,14,31,'2022-06-21 21:35:19',1342177296,'submission.event.fileEdited',0),(332,515,72,31,'2022-06-21 21:35:20',1342177281,'submission.event.fileUploaded',0),(333,1048585,14,31,'2022-06-21 21:35:20',1342177288,'submission.event.fileRevised',0),(334,515,72,31,'2022-06-21 21:35:21',1342177296,'submission.event.fileEdited',0),(335,1048585,14,31,'2022-06-21 21:35:21',1342177296,'submission.event.fileEdited',0),(336,1048585,14,31,'2022-06-21 21:36:19',268435458,'submission.event.general.metadataUpdated',0),(337,1048585,14,31,'2022-06-21 21:36:21',268435457,'submission.event.submissionSubmitted',0),(338,1048585,14,3,'2022-06-21 21:36:40',805306371,'editor.submission.decision.sendInternalReview.log',0),(339,515,73,3,'2022-06-21 21:36:40',1342177281,'submission.event.fileUploaded',0),(340,1048585,14,3,'2022-06-21 21:36:40',1342177288,'submission.event.fileRevised',0),(341,515,74,3,'2022-06-21 21:36:40',1342177281,'submission.event.fileUploaded',0),(342,1048585,14,3,'2022-06-21 21:36:40',1342177288,'submission.event.fileRevised',0),(343,515,75,3,'2022-06-21 21:36:41',1342177281,'submission.event.fileUploaded',0),(344,1048585,14,3,'2022-06-21 21:36:41',1342177288,'submission.event.fileRevised',0),(345,515,76,3,'2022-06-21 21:36:41',1342177281,'submission.event.fileUploaded',0),(346,1048585,14,3,'2022-06-21 21:36:41',1342177288,'submission.event.fileRevised',0),(347,515,77,3,'2022-06-21 21:36:41',1342177281,'submission.event.fileUploaded',0),(348,1048585,14,3,'2022-06-21 21:36:41',1342177288,'submission.event.fileRevised',0),(349,515,78,3,'2022-06-21 21:36:41',1342177281,'submission.event.fileUploaded',0),(350,1048585,14,3,'2022-06-21 21:36:41',1342177288,'submission.event.fileRevised',0),(351,1048585,14,3,'2022-06-21 21:36:54',1073741825,'log.review.reviewerAssigned',0),(352,1048585,14,3,'2022-06-21 21:37:02',805306371,'editor.submission.decision.sendExternalReview.log',0),(353,1048585,14,3,'2022-06-21 21:37:15',1073741825,'log.review.reviewerAssigned',0),(354,1048585,14,3,'2022-06-21 21:37:23',805306371,'editor.submission.decision.accept.log',0),(355,1048585,14,3,'2022-06-21 21:37:36',268435459,'submission.event.participantAdded',0),(356,1048585,14,3,'2022-06-21 21:37:45',805306371,'editor.submission.decision.sendToProduction.log',0),(357,1048585,14,3,'2022-06-21 21:38:01',268435459,'submission.event.participantAdded',0),(358,1048585,14,3,'2022-06-21 21:38:10',268435459,'submission.event.participantAdded',0),(359,1048585,14,3,'2022-06-21 21:38:19',268435474,'submission.event.publicationFormatCreated',0),(360,515,79,3,'2022-06-21 21:38:29',1342177281,'submission.event.fileUploaded',0),(361,1048585,14,3,'2022-06-21 21:38:29',1342177288,'submission.event.fileRevised',0),(362,515,80,3,'2022-06-21 21:38:29',1342177281,'submission.event.fileUploaded',0),(363,1048585,14,3,'2022-06-21 21:38:29',1342177288,'submission.event.fileRevised',0),(364,515,81,3,'2022-06-21 21:38:29',1342177281,'submission.event.fileUploaded',0),(365,1048585,14,3,'2022-06-21 21:38:29',1342177288,'submission.event.fileRevised',0),(366,515,82,3,'2022-06-21 21:38:29',1342177281,'submission.event.fileUploaded',0),(367,1048585,14,3,'2022-06-21 21:38:29',1342177288,'submission.event.fileRevised',0),(368,515,83,3,'2022-06-21 21:38:29',1342177281,'submission.event.fileUploaded',0),(369,1048585,14,3,'2022-06-21 21:38:29',1342177288,'submission.event.fileRevised',0),(370,515,84,3,'2022-06-21 21:38:29',1342177281,'submission.event.fileUploaded',0),(371,1048585,14,3,'2022-06-21 21:38:29',1342177288,'submission.event.fileRevised',0),(372,1048585,14,3,'2022-06-21 21:38:32',268435464,'submission.event.publicationFormatPublished',0),(373,1048585,14,3,'2022-06-21 21:38:35',268435476,'submission.event.publicationFormatMadeAvailable',0),(374,515,83,3,'2022-06-21 21:38:38',1342177296,'submission.event.fileEdited',0),(375,1048585,14,3,'2022-06-21 21:38:38',1342177296,'submission.event.fileEdited',0),(376,515,83,3,'2022-06-21 21:38:38',1342177287,'submission.event.signoffSignoff',0),(377,515,83,3,'2022-06-21 21:38:43',1342177296,'submission.event.fileEdited',0),(378,1048585,14,3,'2022-06-21 21:38:43',1342177296,'submission.event.fileEdited',0),(379,515,84,3,'2022-06-21 21:38:46',1342177296,'submission.event.fileEdited',0),(380,1048585,14,3,'2022-06-21 21:38:46',1342177296,'submission.event.fileEdited',0),(381,515,84,3,'2022-06-21 21:38:46',1342177287,'submission.event.signoffSignoff',0),(382,515,84,3,'2022-06-21 21:38:51',1342177296,'submission.event.fileEdited',0),(383,1048585,14,3,'2022-06-21 21:38:51',1342177296,'submission.event.fileEdited',0),(384,515,81,3,'2022-06-21 21:38:54',1342177296,'submission.event.fileEdited',0),(385,1048585,14,3,'2022-06-21 21:38:54',1342177296,'submission.event.fileEdited',0),(386,515,81,3,'2022-06-21 21:38:54',1342177287,'submission.event.signoffSignoff',0),(387,515,81,3,'2022-06-21 21:38:59',1342177296,'submission.event.fileEdited',0),(388,1048585,14,3,'2022-06-21 21:38:59',1342177296,'submission.event.fileEdited',0),(389,515,82,3,'2022-06-21 21:39:02',1342177296,'submission.event.fileEdited',0),(390,1048585,14,3,'2022-06-21 21:39:02',1342177296,'submission.event.fileEdited',0),(391,515,82,3,'2022-06-21 21:39:02',1342177287,'submission.event.signoffSignoff',0),(392,515,82,3,'2022-06-21 21:39:07',1342177296,'submission.event.fileEdited',0),(393,1048585,14,3,'2022-06-21 21:39:07',1342177296,'submission.event.fileEdited',0),(394,515,80,3,'2022-06-21 21:39:10',1342177296,'submission.event.fileEdited',0),(395,1048585,14,3,'2022-06-21 21:39:10',1342177296,'submission.event.fileEdited',0),(396,515,80,3,'2022-06-21 21:39:11',1342177287,'submission.event.signoffSignoff',0),(397,515,80,3,'2022-06-21 21:39:15',1342177296,'submission.event.fileEdited',0),(398,1048585,14,3,'2022-06-21 21:39:15',1342177296,'submission.event.fileEdited',0),(399,515,79,3,'2022-06-21 21:39:19',1342177296,'submission.event.fileEdited',0),(400,1048585,14,3,'2022-06-21 21:39:19',1342177296,'submission.event.fileEdited',0),(401,515,79,3,'2022-06-21 21:39:19',1342177287,'submission.event.signoffSignoff',0),(402,515,79,3,'2022-06-21 21:39:23',1342177296,'submission.event.fileEdited',0),(403,1048585,14,3,'2022-06-21 21:39:23',1342177296,'submission.event.fileEdited',0),(404,1048585,14,3,'2022-06-21 21:39:28',268435462,'publication.event.published',0),(405,1048585,15,32,'2022-06-21 21:39:42',268435458,'submission.event.general.metadataUpdated',0),(406,515,85,32,'2022-06-21 21:39:44',1342177281,'submission.event.fileUploaded',0),(407,1048585,15,32,'2022-06-21 21:39:44',1342177288,'submission.event.fileRevised',0),(408,515,85,32,'2022-06-21 21:39:44',1342177296,'submission.event.fileEdited',0),(409,1048585,15,32,'2022-06-21 21:39:44',1342177296,'submission.event.fileEdited',0),(410,1048585,15,32,'2022-06-21 21:40:03',268435458,'submission.event.general.metadataUpdated',0),(411,1048585,15,32,'2022-06-21 21:40:04',268435457,'submission.event.submissionSubmitted',0),(412,1048585,15,3,'2022-06-21 21:40:20',805306371,'editor.submission.decision.sendExternalReview.log',0),(413,515,86,3,'2022-06-21 21:40:20',1342177281,'submission.event.fileUploaded',0),(414,1048585,15,3,'2022-06-21 21:40:20',1342177288,'submission.event.fileRevised',0),(415,1048585,16,33,'2022-06-21 21:40:33',268435458,'submission.event.general.metadataUpdated',0),(416,515,87,33,'2022-06-21 21:40:35',1342177281,'submission.event.fileUploaded',0),(417,1048585,16,33,'2022-06-21 21:40:35',1342177288,'submission.event.fileRevised',0),(418,515,87,33,'2022-06-21 21:40:35',1342177296,'submission.event.fileEdited',0),(419,1048585,16,33,'2022-06-21 21:40:35',1342177296,'submission.event.fileEdited',0),(420,1048585,16,33,'2022-06-21 21:41:00',268435458,'submission.event.general.metadataUpdated',0),(421,1048585,16,33,'2022-06-21 21:41:02',268435457,'submission.event.submissionSubmitted',0),(422,1048585,16,3,'2022-06-21 21:41:17',805306371,'editor.submission.decision.sendExternalReview.log',0),(423,515,88,3,'2022-06-21 21:41:17',1342177281,'submission.event.fileUploaded',0),(424,1048585,16,3,'2022-06-21 21:41:17',1342177288,'submission.event.fileRevised',0),(425,1048585,16,3,'2022-06-21 21:41:29',1073741825,'log.review.reviewerAssigned',0),(426,1048585,16,3,'2022-06-21 21:41:36',1073741825,'log.review.reviewerAssigned',0),(427,1048585,16,3,'2022-06-21 21:41:45',1073741825,'log.review.reviewerAssigned',0),(428,1048585,16,10,'2022-06-21 21:41:54',1073741830,'log.review.reviewAccepted',0),(429,1048585,16,10,'2022-06-21 21:41:59',1073741848,'log.review.reviewReady',0),(430,1048585,17,34,'2022-06-21 21:42:10',268435458,'submission.event.general.metadataUpdated',0),(431,515,89,34,'2022-06-21 21:42:12',1342177281,'submission.event.fileUploaded',0),(432,1048585,17,34,'2022-06-21 21:42:12',1342177288,'submission.event.fileRevised',0),(433,515,89,34,'2022-06-21 21:42:12',1342177296,'submission.event.fileEdited',0),(434,1048585,17,34,'2022-06-21 21:42:12',1342177296,'submission.event.fileEdited',0),(435,515,90,34,'2022-06-21 21:42:13',1342177281,'submission.event.fileUploaded',0),(436,1048585,17,34,'2022-06-21 21:42:13',1342177288,'submission.event.fileRevised',0),(437,515,90,34,'2022-06-21 21:42:13',1342177296,'submission.event.fileEdited',0),(438,1048585,17,34,'2022-06-21 21:42:13',1342177296,'submission.event.fileEdited',0),(439,515,91,34,'2022-06-21 21:42:13',1342177281,'submission.event.fileUploaded',0),(440,1048585,17,34,'2022-06-21 21:42:13',1342177288,'submission.event.fileRevised',0),(441,515,91,34,'2022-06-21 21:42:13',1342177296,'submission.event.fileEdited',0),(442,1048585,17,34,'2022-06-21 21:42:13',1342177296,'submission.event.fileEdited',0),(443,515,92,34,'2022-06-21 21:42:14',1342177281,'submission.event.fileUploaded',0),(444,1048585,17,34,'2022-06-21 21:42:14',1342177288,'submission.event.fileRevised',0),(445,515,92,34,'2022-06-21 21:42:14',1342177296,'submission.event.fileEdited',0),(446,1048585,17,34,'2022-06-21 21:42:14',1342177296,'submission.event.fileEdited',0),(447,515,93,34,'2022-06-21 21:42:14',1342177281,'submission.event.fileUploaded',0),(448,1048585,17,34,'2022-06-21 21:42:14',1342177288,'submission.event.fileRevised',0),(449,515,93,34,'2022-06-21 21:42:14',1342177296,'submission.event.fileEdited',0),(450,1048585,17,34,'2022-06-21 21:42:14',1342177296,'submission.event.fileEdited',0),(451,515,94,34,'2022-06-21 21:42:15',1342177281,'submission.event.fileUploaded',0),(452,1048585,17,34,'2022-06-21 21:42:15',1342177288,'submission.event.fileRevised',0),(453,515,94,34,'2022-06-21 21:42:15',1342177296,'submission.event.fileEdited',0),(454,1048585,17,34,'2022-06-21 21:42:15',1342177296,'submission.event.fileEdited',0),(455,1048585,17,34,'2022-06-21 21:44:34',268435458,'submission.event.general.metadataUpdated',0),(456,1048585,17,34,'2022-06-21 21:44:37',268435457,'submission.event.submissionSubmitted',0),(457,1048585,17,3,'2022-06-21 21:45:01',805306371,'editor.submission.decision.sendInternalReview.log',0),(458,515,95,3,'2022-06-21 21:45:02',1342177281,'submission.event.fileUploaded',0),(459,1048585,17,3,'2022-06-21 21:45:02',1342177288,'submission.event.fileRevised',0),(460,515,96,3,'2022-06-21 21:45:02',1342177281,'submission.event.fileUploaded',0),(461,1048585,17,3,'2022-06-21 21:45:02',1342177288,'submission.event.fileRevised',0),(462,515,97,3,'2022-06-21 21:45:02',1342177281,'submission.event.fileUploaded',0),(463,1048585,17,3,'2022-06-21 21:45:02',1342177288,'submission.event.fileRevised',0),(464,515,98,3,'2022-06-21 21:45:02',1342177281,'submission.event.fileUploaded',0),(465,1048585,17,3,'2022-06-21 21:45:02',1342177288,'submission.event.fileRevised',0),(466,515,99,3,'2022-06-21 21:45:02',1342177281,'submission.event.fileUploaded',0),(467,1048585,17,3,'2022-06-21 21:45:02',1342177288,'submission.event.fileRevised',0),(468,515,100,3,'2022-06-21 21:45:02',1342177281,'submission.event.fileUploaded',0),(469,1048585,17,3,'2022-06-21 21:45:02',1342177288,'submission.event.fileRevised',0),(470,1048585,17,3,'2022-06-21 21:45:19',1073741825,'log.review.reviewerAssigned',0),(471,1048585,17,3,'2022-06-21 21:45:30',1073741825,'log.review.reviewerAssigned',0);
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
INSERT INTO `event_log_settings` VALUES (2,'fileId','1','int'),(2,'fileStage','2','int'),(2,'originalFileName','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(2,'sourceSubmissionFileId',NULL,'string'),(2,'submissionFileId','1','int'),(2,'submissionId','1','int'),(2,'username','aclark','string'),(3,'fileId','1','int'),(3,'fileStage','2','int'),(3,'name','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(3,'submissionFileId','1','int'),(3,'submissionId','1','int'),(3,'username','aclark','string'),(4,'fileId','1','int'),(4,'fileStage','2','int'),(4,'originalFileName','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(4,'sourceSubmissionFileId',NULL,'string'),(4,'submissionFileId','1','int'),(4,'submissionId','1','int'),(4,'username','aclark','string'),(5,'fileId','1','int'),(5,'fileStage','2','int'),(5,'name','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(5,'originalFileName','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(5,'sourceSubmissionFileId',NULL,'string'),(5,'submissionFileId','1','int'),(5,'submissionId','1','int'),(5,'username','aclark','string'),(8,'decision','23','int'),(8,'editorId','3','int'),(8,'editorName','Daniel Barnes','string'),(8,'submissionId','1','int'),(9,'fileId','1','int'),(9,'fileStage','4','int'),(9,'originalFileName','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(9,'sourceSubmissionFileId','1','int'),(9,'submissionFileId','2','int'),(9,'submissionId','1','int'),(9,'username','dbarnes','string'),(10,'fileId','1','int'),(10,'fileStage','4','int'),(10,'name','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(10,'submissionFileId','2','int'),(10,'submissionId','1','int'),(10,'username','dbarnes','string'),(11,'reviewAssignmentId','1','string'),(11,'reviewerName','Gonzalo Favio','string'),(11,'round','1','int'),(11,'stageId','3','int'),(11,'submissionId','1','int'),(12,'decision','2','int'),(12,'editorId','3','int'),(12,'editorName','Daniel Barnes','string'),(12,'submissionId','1','int'),(13,'name','Sarah Vogt','string'),(13,'userGroupName','Copyeditor','string'),(13,'username','svogt','string'),(15,'fileId','2','int'),(15,'fileStage','2','int'),(15,'originalFileName','Critical History in Western Canada 1900???.pdf','string'),(15,'sourceSubmissionFileId',NULL,'string'),(15,'submissionFileId','3','int'),(15,'submissionId','2','int'),(15,'username','afinkel','string'),(16,'fileId','2','int'),(16,'fileStage','2','int'),(16,'name','Critical History in Western Canada 1900???.pdf','string'),(16,'submissionFileId','3','int'),(16,'submissionId','2','int'),(16,'username','afinkel','string'),(17,'fileId','2','int'),(17,'fileStage','2','int'),(17,'originalFileName','Critical History in Western Canada 1900???.pdf','string'),(17,'sourceSubmissionFileId',NULL,'string'),(17,'submissionFileId','3','int'),(17,'submissionId','2','int'),(17,'username','afinkel','string'),(18,'fileId','2','int'),(18,'fileStage','2','int'),(18,'name','Critical History in Western Canada 1900???.pdf','string'),(18,'originalFileName','Critical History in Western Canada 1900???.pdf','string'),(18,'sourceSubmissionFileId',NULL,'string'),(18,'submissionFileId','3','int'),(18,'submissionId','2','int'),(18,'username','afinkel','string'),(19,'fileId','3','int'),(19,'fileStage','2','int'),(19,'originalFileName','Vernacular Currents in Western Canadian .pdf','string'),(19,'sourceSubmissionFileId',NULL,'string'),(19,'submissionFileId','4','int'),(19,'submissionId','2','int'),(19,'username','afinkel','string'),(20,'fileId','3','int'),(20,'fileStage','2','int'),(20,'name','Vernacular Currents in Western Canadian .pdf','string'),(20,'submissionFileId','4','int'),(20,'submissionId','2','int'),(20,'username','afinkel','string'),(21,'fileId','3','int'),(21,'fileStage','2','int'),(21,'originalFileName','Vernacular Currents in Western Canadian .pdf','string'),(21,'sourceSubmissionFileId',NULL,'string'),(21,'submissionFileId','4','int'),(21,'submissionId','2','int'),(21,'username','afinkel','string'),(22,'fileId','3','int'),(22,'fileStage','2','int'),(22,'name','Vernacular Currents in Western Canadian .pdf','string'),(22,'originalFileName','Vernacular Currents in Western Canadian .pdf','string'),(22,'sourceSubmissionFileId',NULL,'string'),(22,'submissionFileId','4','int'),(22,'submissionId','2','int'),(22,'username','afinkel','string'),(23,'fileId','4','int'),(23,'fileStage','2','int'),(23,'originalFileName','Cree Intellectual Traditions in History.pdf','string'),(23,'sourceSubmissionFileId',NULL,'string'),(23,'submissionFileId','5','int'),(23,'submissionId','2','int'),(23,'username','afinkel','string'),(24,'fileId','4','int'),(24,'fileStage','2','int'),(24,'name','Cree Intellectual Traditions in History.pdf','string'),(24,'submissionFileId','5','int'),(24,'submissionId','2','int'),(24,'username','afinkel','string'),(25,'fileId','4','int'),(25,'fileStage','2','int'),(25,'originalFileName','Cree Intellectual Traditions in History.pdf','string'),(25,'sourceSubmissionFileId',NULL,'string'),(25,'submissionFileId','5','int'),(25,'submissionId','2','int'),(25,'username','afinkel','string'),(26,'fileId','4','int'),(26,'fileStage','2','int'),(26,'name','Cree Intellectual Traditions in History.pdf','string'),(26,'originalFileName','Cree Intellectual Traditions in History.pdf','string'),(26,'sourceSubmissionFileId',NULL,'string'),(26,'submissionFileId','5','int'),(26,'submissionId','2','int'),(26,'username','afinkel','string'),(27,'fileId','5','int'),(27,'fileStage','2','int'),(27,'originalFileName','Visualizing Space, Race, and History in .pdf','string'),(27,'sourceSubmissionFileId',NULL,'string'),(27,'submissionFileId','6','int'),(27,'submissionId','2','int'),(27,'username','afinkel','string'),(28,'fileId','5','int'),(28,'fileStage','2','int'),(28,'name','Visualizing Space, Race, and History in .pdf','string'),(28,'submissionFileId','6','int'),(28,'submissionId','2','int'),(28,'username','afinkel','string'),(29,'fileId','5','int'),(29,'fileStage','2','int'),(29,'originalFileName','Visualizing Space, Race, and History in .pdf','string'),(29,'sourceSubmissionFileId',NULL,'string'),(29,'submissionFileId','6','int'),(29,'submissionId','2','int'),(29,'username','afinkel','string'),(30,'fileId','5','int'),(30,'fileStage','2','int'),(30,'name','Visualizing Space, Race, and History in .pdf','string'),(30,'originalFileName','Visualizing Space, Race, and History in .pdf','string'),(30,'sourceSubmissionFileId',NULL,'string'),(30,'submissionFileId','6','int'),(30,'submissionId','2','int'),(30,'username','afinkel','string'),(33,'decision','23','int'),(33,'editorId','3','int'),(33,'editorName','Daniel Barnes','string'),(33,'submissionId','2','int'),(34,'fileId','4','int'),(34,'fileStage','4','int'),(34,'originalFileName','Cree Intellectual Traditions in History.pdf','string'),(34,'sourceSubmissionFileId','5','int'),(34,'submissionFileId','7','int'),(34,'submissionId','2','int'),(34,'username','dbarnes','string'),(35,'fileId','4','int'),(35,'fileStage','4','int'),(35,'name','Cree Intellectual Traditions in History.pdf','string'),(35,'submissionFileId','7','int'),(35,'submissionId','2','int'),(35,'username','dbarnes','string'),(36,'fileId','5','int'),(36,'fileStage','4','int'),(36,'originalFileName','Visualizing Space, Race, and History in .pdf','string'),(36,'sourceSubmissionFileId','6','int'),(36,'submissionFileId','8','int'),(36,'submissionId','2','int'),(36,'username','dbarnes','string'),(37,'fileId','5','int'),(37,'fileStage','4','int'),(37,'name','Visualizing Space, Race, and History in .pdf','string'),(37,'submissionFileId','8','int'),(37,'submissionId','2','int'),(37,'username','dbarnes','string'),(38,'fileId','2','int'),(38,'fileStage','4','int'),(38,'originalFileName','Critical History in Western Canada 1900???.pdf','string'),(38,'sourceSubmissionFileId','3','int'),(38,'submissionFileId','9','int'),(38,'submissionId','2','int'),(38,'username','dbarnes','string'),(39,'fileId','2','int'),(39,'fileStage','4','int'),(39,'name','Critical History in Western Canada 1900???.pdf','string'),(39,'submissionFileId','9','int'),(39,'submissionId','2','int'),(39,'username','dbarnes','string'),(40,'fileId','3','int'),(40,'fileStage','4','int'),(40,'originalFileName','Vernacular Currents in Western Canadian .pdf','string'),(40,'sourceSubmissionFileId','4','int'),(40,'submissionFileId','10','int'),(40,'submissionId','2','int'),(40,'username','dbarnes','string'),(41,'fileId','3','int'),(41,'fileStage','4','int'),(41,'name','Vernacular Currents in Western Canadian .pdf','string'),(41,'submissionFileId','10','int'),(41,'submissionId','2','int'),(41,'username','dbarnes','string'),(42,'reviewAssignmentId','2','string'),(42,'reviewerName','Al Zacharia','string'),(42,'round','1','int'),(42,'stageId','3','int'),(42,'submissionId','2','int'),(43,'reviewAssignmentId','3','string'),(43,'reviewerName','Gonzalo Favio','string'),(43,'round','1','int'),(43,'stageId','3','int'),(43,'submissionId','2','int'),(45,'fileId','6','int'),(45,'fileStage','2','int'),(45,'originalFileName','The Political Economy of Workplace Injury in Canada.pdf','string'),(45,'sourceSubmissionFileId',NULL,'string'),(45,'submissionFileId','11','int'),(45,'submissionId','3','int'),(45,'username','bbarnetson','string'),(46,'fileId','6','int'),(46,'fileStage','2','int'),(46,'name','The Political Economy of Workplace Injury in Canada.pdf','string'),(46,'submissionFileId','11','int'),(46,'submissionId','3','int'),(46,'username','bbarnetson','string'),(47,'fileId','6','int'),(47,'fileStage','2','int'),(47,'originalFileName','The Political Economy of Workplace Injury in Canada.pdf','string'),(47,'sourceSubmissionFileId',NULL,'string'),(47,'submissionFileId','11','int'),(47,'submissionId','3','int'),(47,'username','bbarnetson','string'),(48,'fileId','6','int'),(48,'fileStage','2','int'),(48,'name','The Political Economy of Workplace Injury in Canada.pdf','string'),(48,'originalFileName','The Political Economy of Workplace Injury in Canada.pdf','string'),(48,'sourceSubmissionFileId',NULL,'string'),(48,'submissionFileId','11','int'),(48,'submissionId','3','int'),(48,'username','bbarnetson','string'),(52,'fileId','7','int'),(52,'fileStage','2','int'),(52,'originalFileName','Introduction: Contexts of Popular Cultur.pdf','string'),(52,'sourceSubmissionFileId',NULL,'string'),(52,'submissionFileId','12','int'),(52,'submissionId','4','int'),(52,'username','bbeaty','string'),(53,'fileId','7','int'),(53,'fileStage','2','int'),(53,'name','Introduction: Contexts of Popular Cultur.pdf','string'),(53,'submissionFileId','12','int'),(53,'submissionId','4','int'),(53,'username','bbeaty','string'),(54,'fileId','7','int'),(54,'fileStage','2','int'),(54,'originalFileName','Introduction: Contexts of Popular Cultur.pdf','string'),(54,'sourceSubmissionFileId',NULL,'string'),(54,'submissionFileId','12','int'),(54,'submissionId','4','int'),(54,'username','bbeaty','string'),(55,'fileId','7','int'),(55,'fileStage','2','int'),(55,'name','Introduction: Contexts of Popular Cultur.pdf','string'),(55,'originalFileName','Introduction: Contexts of Popular Cultur.pdf','string'),(55,'sourceSubmissionFileId',NULL,'string'),(55,'submissionFileId','12','int'),(55,'submissionId','4','int'),(55,'username','bbeaty','string'),(56,'fileId','8','int'),(56,'fileStage','2','int'),(56,'originalFileName','Chapter 1. A Future for Media Studies: C.pdf','string'),(56,'sourceSubmissionFileId',NULL,'string'),(56,'submissionFileId','13','int'),(56,'submissionId','4','int'),(56,'username','bbeaty','string'),(57,'fileId','8','int'),(57,'fileStage','2','int'),(57,'name','Chapter 1. A Future for Media Studies: C.pdf','string'),(57,'submissionFileId','13','int'),(57,'submissionId','4','int'),(57,'username','bbeaty','string'),(58,'fileId','8','int'),(58,'fileStage','2','int'),(58,'originalFileName','Chapter 1. A Future for Media Studies: C.pdf','string'),(58,'sourceSubmissionFileId',NULL,'string'),(58,'submissionFileId','13','int'),(58,'submissionId','4','int'),(58,'username','bbeaty','string'),(59,'fileId','8','int'),(59,'fileStage','2','int'),(59,'name','Chapter 1. A Future for Media Studies: C.pdf','string'),(59,'originalFileName','Chapter 1. A Future for Media Studies: C.pdf','string'),(59,'sourceSubmissionFileId',NULL,'string'),(59,'submissionFileId','13','int'),(59,'submissionId','4','int'),(59,'username','bbeaty','string'),(60,'fileId','9','int'),(60,'fileStage','2','int'),(60,'originalFileName','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(60,'sourceSubmissionFileId',NULL,'string'),(60,'submissionFileId','14','int'),(60,'submissionId','4','int'),(60,'username','bbeaty','string'),(61,'fileId','9','int'),(61,'fileStage','2','int'),(61,'name','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(61,'submissionFileId','14','int'),(61,'submissionId','4','int'),(61,'username','bbeaty','string'),(62,'fileId','9','int'),(62,'fileStage','2','int'),(62,'originalFileName','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(62,'sourceSubmissionFileId',NULL,'string'),(62,'submissionFileId','14','int'),(62,'submissionId','4','int'),(62,'username','bbeaty','string'),(63,'fileId','9','int'),(63,'fileStage','2','int'),(63,'name','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(63,'originalFileName','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(63,'sourceSubmissionFileId',NULL,'string'),(63,'submissionFileId','14','int'),(63,'submissionId','4','int'),(63,'username','bbeaty','string'),(64,'fileId','10','int'),(64,'fileStage','2','int'),(64,'originalFileName','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(64,'sourceSubmissionFileId',NULL,'string'),(64,'submissionFileId','15','int'),(64,'submissionId','4','int'),(64,'username','bbeaty','string'),(65,'fileId','10','int'),(65,'fileStage','2','int'),(65,'name','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(65,'submissionFileId','15','int'),(65,'submissionId','4','int'),(65,'username','bbeaty','string'),(66,'fileId','10','int'),(66,'fileStage','2','int'),(66,'originalFileName','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(66,'sourceSubmissionFileId',NULL,'string'),(66,'submissionFileId','15','int'),(66,'submissionId','4','int'),(66,'username','bbeaty','string'),(67,'fileId','10','int'),(67,'fileStage','2','int'),(67,'name','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(67,'originalFileName','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(67,'sourceSubmissionFileId',NULL,'string'),(67,'submissionFileId','15','int'),(67,'submissionId','4','int'),(67,'username','bbeaty','string'),(70,'decision','1','int'),(70,'editorId','3','int'),(70,'editorName','Daniel Barnes','string'),(70,'submissionId','4','int'),(71,'fileId','10','int'),(71,'fileStage','19','int'),(71,'originalFileName','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(71,'sourceSubmissionFileId','15','int'),(71,'submissionFileId','16','int'),(71,'submissionId','4','int'),(71,'username','dbarnes','string'),(72,'fileId','10','int'),(72,'fileStage','19','int'),(72,'name','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(72,'submissionFileId','16','int'),(72,'submissionId','4','int'),(72,'username','dbarnes','string'),(73,'fileId','9','int'),(73,'fileStage','19','int'),(73,'originalFileName','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(73,'sourceSubmissionFileId','14','int'),(73,'submissionFileId','17','int'),(73,'submissionId','4','int'),(73,'username','dbarnes','string'),(74,'fileId','9','int'),(74,'fileStage','19','int'),(74,'name','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(74,'submissionFileId','17','int'),(74,'submissionId','4','int'),(74,'username','dbarnes','string'),(75,'fileId','7','int'),(75,'fileStage','19','int'),(75,'originalFileName','Introduction: Contexts of Popular Cultur.pdf','string'),(75,'sourceSubmissionFileId','12','int'),(75,'submissionFileId','18','int'),(75,'submissionId','4','int'),(75,'username','dbarnes','string'),(76,'fileId','7','int'),(76,'fileStage','19','int'),(76,'name','Introduction: Contexts of Popular Cultur.pdf','string'),(76,'submissionFileId','18','int'),(76,'submissionId','4','int'),(76,'username','dbarnes','string'),(77,'fileId','8','int'),(77,'fileStage','19','int'),(77,'originalFileName','Chapter 1. A Future for Media Studies: C.pdf','string'),(77,'sourceSubmissionFileId','13','int'),(77,'submissionFileId','19','int'),(77,'submissionId','4','int'),(77,'username','dbarnes','string'),(78,'fileId','8','int'),(78,'fileStage','19','int'),(78,'name','Chapter 1. A Future for Media Studies: C.pdf','string'),(78,'submissionFileId','19','int'),(78,'submissionId','4','int'),(78,'username','dbarnes','string'),(79,'reviewAssignmentId','4','string'),(79,'reviewerName','Aisla McCrae','string'),(79,'round','1','int'),(79,'stageId','2','int'),(79,'submissionId','4','int'),(80,'decision','3','int'),(80,'editorId','3','int'),(80,'editorName','Daniel Barnes','string'),(80,'submissionId','4','int'),(81,'reviewAssignmentId','5','string'),(81,'reviewerName','Al Zacharia','string'),(81,'round','1','int'),(81,'stageId','3','int'),(81,'submissionId','4','int'),(82,'decision','2','int'),(82,'editorId','3','int'),(82,'editorName','Daniel Barnes','string'),(82,'submissionId','4','int'),(83,'name','Maria Fritz','string'),(83,'userGroupName','Copyeditor','string'),(83,'username','mfritz','string'),(84,'decision','7','int'),(84,'editorId','3','int'),(84,'editorName','Daniel Barnes','string'),(84,'submissionId','4','int'),(85,'name','Graham Cox','string'),(85,'userGroupName','Layout Editor','string'),(85,'username','gcox','string'),(86,'formatName','PDF','string'),(88,'fileId','11','int'),(88,'fileStage','2','int'),(88,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(88,'sourceSubmissionFileId',NULL,'string'),(88,'submissionFileId','20','int'),(88,'submissionId','5','int'),(88,'username','callan','string'),(89,'fileId','11','int'),(89,'fileStage','2','int'),(89,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(89,'submissionFileId','20','int'),(89,'submissionId','5','int'),(89,'username','callan','string'),(90,'fileId','11','int'),(90,'fileStage','2','int'),(90,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(90,'sourceSubmissionFileId',NULL,'string'),(90,'submissionFileId','20','int'),(90,'submissionId','5','int'),(90,'username','callan','string'),(91,'fileId','11','int'),(91,'fileStage','2','int'),(91,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(91,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(91,'sourceSubmissionFileId',NULL,'string'),(91,'submissionFileId','20','int'),(91,'submissionId','5','int'),(91,'username','callan','string'),(94,'decision','1','int'),(94,'editorId','3','int'),(94,'editorName','Daniel Barnes','string'),(94,'submissionId','5','int'),(95,'fileId','11','int'),(95,'fileStage','19','int'),(95,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(95,'sourceSubmissionFileId','20','int'),(95,'submissionFileId','21','int'),(95,'submissionId','5','int'),(95,'username','dbarnes','string'),(96,'fileId','11','int'),(96,'fileStage','19','int'),(96,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(96,'submissionFileId','21','int'),(96,'submissionId','5','int'),(96,'username','dbarnes','string'),(97,'reviewAssignmentId','6','string'),(97,'reviewerName','Paul Hudson','string'),(97,'round','1','int'),(97,'stageId','2','int'),(97,'submissionId','5','int'),(98,'decision','3','int'),(98,'editorId','3','int'),(98,'editorName','Daniel Barnes','string'),(98,'submissionId','5','int'),(99,'reviewAssignmentId','7','string'),(99,'reviewerName','Gonzalo Favio','string'),(99,'round','1','int'),(99,'stageId','3','int'),(99,'submissionId','5','int'),(100,'decision','2','int'),(100,'editorId','3','int'),(100,'editorName','Daniel Barnes','string'),(100,'submissionId','5','int'),(101,'name','Sarah Vogt','string'),(101,'userGroupName','Copyeditor','string'),(101,'username','svogt','string'),(102,'decision','7','int'),(102,'editorId','3','int'),(102,'editorName','Daniel Barnes','string'),(102,'submissionId','5','int'),(103,'name','Stephen Hellier','string'),(103,'userGroupName','Layout Editor','string'),(103,'username','shellier','string'),(104,'name','Catherine Turner','string'),(104,'userGroupName','Proofreader','string'),(104,'username','cturner','string'),(105,'formatName','PDF','string'),(106,'fileId','11','int'),(106,'fileStage','10','int'),(106,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(106,'sourceSubmissionFileId','20','int'),(106,'submissionFileId','22','int'),(106,'submissionId','5','int'),(106,'username','dbarnes','string'),(107,'fileId','11','int'),(107,'fileStage','10','int'),(107,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(107,'submissionFileId','22','int'),(107,'submissionId','5','int'),(107,'username','dbarnes','string'),(108,'publicationFormatName','PDF','string'),(109,'publicationFormatName','PDF','string'),(110,'fileId','11','int'),(110,'fileStage','10','int'),(110,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(110,'sourceSubmissionFileId','20','int'),(110,'submissionFileId','22','int'),(110,'submissionId','5','int'),(110,'username','dbarnes','string'),(111,'fileId','11','int'),(111,'fileStage','10','int'),(111,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(111,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(111,'sourceSubmissionFileId','20','int'),(111,'submissionFileId','22','int'),(111,'submissionId','5','int'),(111,'username','dbarnes','string'),(112,'file','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(112,'name','Daniel Barnes','string'),(112,'username','dbarnes','string'),(113,'fileId','11','int'),(113,'fileStage','10','int'),(113,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(113,'sourceSubmissionFileId','20','int'),(113,'submissionFileId','22','int'),(113,'submissionId','5','int'),(113,'username','dbarnes','string'),(114,'fileId','11','int'),(114,'fileStage','10','int'),(114,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(114,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(114,'sourceSubmissionFileId','20','int'),(114,'submissionFileId','22','int'),(114,'submissionId','5','int'),(114,'username','dbarnes','string'),(117,'fileId','12','int'),(117,'fileStage','2','int'),(117,'originalFileName','Identify: Understanding Your Information.pdf','string'),(117,'sourceSubmissionFileId',NULL,'string'),(117,'submissionFileId','23','int'),(117,'submissionId','6','int'),(117,'username','dbernnard','string'),(118,'fileId','12','int'),(118,'fileStage','2','int'),(118,'name','Identify: Understanding Your Information.pdf','string'),(118,'submissionFileId','23','int'),(118,'submissionId','6','int'),(118,'username','dbernnard','string'),(119,'fileId','12','int'),(119,'fileStage','2','int'),(119,'originalFileName','Identify: Understanding Your Information.pdf','string'),(119,'sourceSubmissionFileId',NULL,'string'),(119,'submissionFileId','23','int'),(119,'submissionId','6','int'),(119,'username','dbernnard','string'),(120,'fileId','12','int'),(120,'fileStage','2','int'),(120,'name','Identify: Understanding Your Information.pdf','string'),(120,'originalFileName','Identify: Understanding Your Information.pdf','string'),(120,'sourceSubmissionFileId',NULL,'string'),(120,'submissionFileId','23','int'),(120,'submissionId','6','int'),(120,'username','dbernnard','string'),(121,'fileId','13','int'),(121,'fileStage','2','int'),(121,'originalFileName','Scope: Knowing What Is Available.pdf','string'),(121,'sourceSubmissionFileId',NULL,'string'),(121,'submissionFileId','24','int'),(121,'submissionId','6','int'),(121,'username','dbernnard','string'),(122,'fileId','13','int'),(122,'fileStage','2','int'),(122,'name','Scope: Knowing What Is Available.pdf','string'),(122,'submissionFileId','24','int'),(122,'submissionId','6','int'),(122,'username','dbernnard','string'),(123,'fileId','13','int'),(123,'fileStage','2','int'),(123,'originalFileName','Scope: Knowing What Is Available.pdf','string'),(123,'sourceSubmissionFileId',NULL,'string'),(123,'submissionFileId','24','int'),(123,'submissionId','6','int'),(123,'username','dbernnard','string'),(124,'fileId','13','int'),(124,'fileStage','2','int'),(124,'name','Scope: Knowing What Is Available.pdf','string'),(124,'originalFileName','Scope: Knowing What Is Available.pdf','string'),(124,'sourceSubmissionFileId',NULL,'string'),(124,'submissionFileId','24','int'),(124,'submissionId','6','int'),(124,'username','dbernnard','string'),(125,'fileId','14','int'),(125,'fileStage','2','int'),(125,'originalFileName','Plan: Developing Research Strategies.pdf','string'),(125,'sourceSubmissionFileId',NULL,'string'),(125,'submissionFileId','25','int'),(125,'submissionId','6','int'),(125,'username','dbernnard','string'),(126,'fileId','14','int'),(126,'fileStage','2','int'),(126,'name','Plan: Developing Research Strategies.pdf','string'),(126,'submissionFileId','25','int'),(126,'submissionId','6','int'),(126,'username','dbernnard','string'),(127,'fileId','14','int'),(127,'fileStage','2','int'),(127,'originalFileName','Plan: Developing Research Strategies.pdf','string'),(127,'sourceSubmissionFileId',NULL,'string'),(127,'submissionFileId','25','int'),(127,'submissionId','6','int'),(127,'username','dbernnard','string'),(128,'fileId','14','int'),(128,'fileStage','2','int'),(128,'name','Plan: Developing Research Strategies.pdf','string'),(128,'originalFileName','Plan: Developing Research Strategies.pdf','string'),(128,'sourceSubmissionFileId',NULL,'string'),(128,'submissionFileId','25','int'),(128,'submissionId','6','int'),(128,'username','dbernnard','string'),(129,'fileId','15','int'),(129,'fileStage','2','int'),(129,'originalFileName','Gather: Finding What You Need.pdf','string'),(129,'sourceSubmissionFileId',NULL,'string'),(129,'submissionFileId','26','int'),(129,'submissionId','6','int'),(129,'username','dbernnard','string'),(130,'fileId','15','int'),(130,'fileStage','2','int'),(130,'name','Gather: Finding What You Need.pdf','string'),(130,'submissionFileId','26','int'),(130,'submissionId','6','int'),(130,'username','dbernnard','string'),(131,'fileId','15','int'),(131,'fileStage','2','int'),(131,'originalFileName','Gather: Finding What You Need.pdf','string'),(131,'sourceSubmissionFileId',NULL,'string'),(131,'submissionFileId','26','int'),(131,'submissionId','6','int'),(131,'username','dbernnard','string'),(132,'fileId','15','int'),(132,'fileStage','2','int'),(132,'name','Gather: Finding What You Need.pdf','string'),(132,'originalFileName','Gather: Finding What You Need.pdf','string'),(132,'sourceSubmissionFileId',NULL,'string'),(132,'submissionFileId','26','int'),(132,'submissionId','6','int'),(132,'username','dbernnard','string'),(135,'decision','1','int'),(135,'editorId','3','int'),(135,'editorName','Daniel Barnes','string'),(135,'submissionId','6','int'),(136,'fileId','14','int'),(136,'fileStage','19','int'),(136,'originalFileName','Plan: Developing Research Strategies.pdf','string'),(136,'sourceSubmissionFileId','25','int'),(136,'submissionFileId','27','int'),(136,'submissionId','6','int'),(136,'username','dbarnes','string'),(137,'fileId','14','int'),(137,'fileStage','19','int'),(137,'name','Plan: Developing Research Strategies.pdf','string'),(137,'submissionFileId','27','int'),(137,'submissionId','6','int'),(137,'username','dbarnes','string'),(138,'fileId','15','int'),(138,'fileStage','19','int'),(138,'originalFileName','Gather: Finding What You Need.pdf','string'),(138,'sourceSubmissionFileId','26','int'),(138,'submissionFileId','28','int'),(138,'submissionId','6','int'),(138,'username','dbarnes','string'),(139,'fileId','15','int'),(139,'fileStage','19','int'),(139,'name','Gather: Finding What You Need.pdf','string'),(139,'submissionFileId','28','int'),(139,'submissionId','6','int'),(139,'username','dbarnes','string'),(140,'fileId','12','int'),(140,'fileStage','19','int'),(140,'originalFileName','Identify: Understanding Your Information.pdf','string'),(140,'sourceSubmissionFileId','23','int'),(140,'submissionFileId','29','int'),(140,'submissionId','6','int'),(140,'username','dbarnes','string'),(141,'fileId','12','int'),(141,'fileStage','19','int'),(141,'name','Identify: Understanding Your Information.pdf','string'),(141,'submissionFileId','29','int'),(141,'submissionId','6','int'),(141,'username','dbarnes','string'),(142,'fileId','13','int'),(142,'fileStage','19','int'),(142,'originalFileName','Scope: Knowing What Is Available.pdf','string'),(142,'sourceSubmissionFileId','24','int'),(142,'submissionFileId','30','int'),(142,'submissionId','6','int'),(142,'username','dbarnes','string'),(143,'fileId','13','int'),(143,'fileStage','19','int'),(143,'name','Scope: Knowing What Is Available.pdf','string'),(143,'submissionFileId','30','int'),(143,'submissionId','6','int'),(143,'username','dbarnes','string'),(144,'name','Minoti Inoue','string'),(144,'userGroupName','Series editor','string'),(144,'username','minoue','string'),(145,'decision','28','int'),(145,'editorId','6','int'),(145,'editorName','Minoti Inoue','string'),(145,'submissionId','6','int'),(147,'fileId','16','int'),(147,'fileStage','2','int'),(147,'originalFileName','Introduction.pdf','string'),(147,'sourceSubmissionFileId',NULL,'string'),(147,'submissionFileId','31','int'),(147,'submissionId','7','int'),(147,'username','dkennepohl','string'),(148,'fileId','16','int'),(148,'fileStage','2','int'),(148,'name','Introduction.pdf','string'),(148,'submissionFileId','31','int'),(148,'submissionId','7','int'),(148,'username','dkennepohl','string'),(149,'fileId','16','int'),(149,'fileStage','2','int'),(149,'originalFileName','Introduction.pdf','string'),(149,'sourceSubmissionFileId',NULL,'string'),(149,'submissionFileId','31','int'),(149,'submissionId','7','int'),(149,'username','dkennepohl','string'),(150,'fileId','16','int'),(150,'fileStage','2','int'),(150,'name','Introduction.pdf','string'),(150,'originalFileName','Introduction.pdf','string'),(150,'sourceSubmissionFileId',NULL,'string'),(150,'submissionFileId','31','int'),(150,'submissionId','7','int'),(150,'username','dkennepohl','string'),(151,'fileId','17','int'),(151,'fileStage','2','int'),(151,'originalFileName','Chapter 1: Interactions Affording Distan.pdf','string'),(151,'sourceSubmissionFileId',NULL,'string'),(151,'submissionFileId','32','int'),(151,'submissionId','7','int'),(151,'username','dkennepohl','string'),(152,'fileId','17','int'),(152,'fileStage','2','int'),(152,'name','Chapter 1: Interactions Affording Distan.pdf','string'),(152,'submissionFileId','32','int'),(152,'submissionId','7','int'),(152,'username','dkennepohl','string'),(153,'fileId','17','int'),(153,'fileStage','2','int'),(153,'originalFileName','Chapter 1: Interactions Affording Distan.pdf','string'),(153,'sourceSubmissionFileId',NULL,'string'),(153,'submissionFileId','32','int'),(153,'submissionId','7','int'),(153,'username','dkennepohl','string'),(154,'fileId','17','int'),(154,'fileStage','2','int'),(154,'name','Chapter 1: Interactions Affording Distan.pdf','string'),(154,'originalFileName','Chapter 1: Interactions Affording Distan.pdf','string'),(154,'sourceSubmissionFileId',NULL,'string'),(154,'submissionFileId','32','int'),(154,'submissionId','7','int'),(154,'username','dkennepohl','string'),(155,'fileId','18','int'),(155,'fileStage','2','int'),(155,'originalFileName','Chapter 2: Learning Science at a Distanc.pdf','string'),(155,'sourceSubmissionFileId',NULL,'string'),(155,'submissionFileId','33','int'),(155,'submissionId','7','int'),(155,'username','dkennepohl','string'),(156,'fileId','18','int'),(156,'fileStage','2','int'),(156,'name','Chapter 2: Learning Science at a Distanc.pdf','string'),(156,'submissionFileId','33','int'),(156,'submissionId','7','int'),(156,'username','dkennepohl','string'),(157,'fileId','18','int'),(157,'fileStage','2','int'),(157,'originalFileName','Chapter 2: Learning Science at a Distanc.pdf','string'),(157,'sourceSubmissionFileId',NULL,'string'),(157,'submissionFileId','33','int'),(157,'submissionId','7','int'),(157,'username','dkennepohl','string'),(158,'fileId','18','int'),(158,'fileStage','2','int'),(158,'name','Chapter 2: Learning Science at a Distanc.pdf','string'),(158,'originalFileName','Chapter 2: Learning Science at a Distanc.pdf','string'),(158,'sourceSubmissionFileId',NULL,'string'),(158,'submissionFileId','33','int'),(158,'submissionId','7','int'),(158,'username','dkennepohl','string'),(159,'fileId','19','int'),(159,'fileStage','2','int'),(159,'originalFileName','Chapter 3: Leadership Strategies for Coo.pdf','string'),(159,'sourceSubmissionFileId',NULL,'string'),(159,'submissionFileId','34','int'),(159,'submissionId','7','int'),(159,'username','dkennepohl','string'),(160,'fileId','19','int'),(160,'fileStage','2','int'),(160,'name','Chapter 3: Leadership Strategies for Coo.pdf','string'),(160,'submissionFileId','34','int'),(160,'submissionId','7','int'),(160,'username','dkennepohl','string'),(161,'fileId','19','int'),(161,'fileStage','2','int'),(161,'originalFileName','Chapter 3: Leadership Strategies for Coo.pdf','string'),(161,'sourceSubmissionFileId',NULL,'string'),(161,'submissionFileId','34','int'),(161,'submissionId','7','int'),(161,'username','dkennepohl','string'),(162,'fileId','19','int'),(162,'fileStage','2','int'),(162,'name','Chapter 3: Leadership Strategies for Coo.pdf','string'),(162,'originalFileName','Chapter 3: Leadership Strategies for Coo.pdf','string'),(162,'sourceSubmissionFileId',NULL,'string'),(162,'submissionFileId','34','int'),(162,'submissionId','7','int'),(162,'username','dkennepohl','string'),(163,'fileId','20','int'),(163,'fileStage','2','int'),(163,'originalFileName','Chapter 4: Toward New Models of Flexible.pdf','string'),(163,'sourceSubmissionFileId',NULL,'string'),(163,'submissionFileId','35','int'),(163,'submissionId','7','int'),(163,'username','dkennepohl','string'),(164,'fileId','20','int'),(164,'fileStage','2','int'),(164,'name','Chapter 4: Toward New Models of Flexible.pdf','string'),(164,'submissionFileId','35','int'),(164,'submissionId','7','int'),(164,'username','dkennepohl','string'),(165,'fileId','20','int'),(165,'fileStage','2','int'),(165,'originalFileName','Chapter 4: Toward New Models of Flexible.pdf','string'),(165,'sourceSubmissionFileId',NULL,'string'),(165,'submissionFileId','35','int'),(165,'submissionId','7','int'),(165,'username','dkennepohl','string'),(166,'fileId','20','int'),(166,'fileStage','2','int'),(166,'name','Chapter 4: Toward New Models of Flexible.pdf','string'),(166,'originalFileName','Chapter 4: Toward New Models of Flexible.pdf','string'),(166,'sourceSubmissionFileId',NULL,'string'),(166,'submissionFileId','35','int'),(166,'submissionId','7','int'),(166,'username','dkennepohl','string'),(169,'decision','23','int'),(169,'editorId','3','int'),(169,'editorName','Daniel Barnes','string'),(169,'submissionId','7','int'),(170,'fileId','19','int'),(170,'fileStage','4','int'),(170,'originalFileName','Chapter 3: Leadership Strategies for Coo.pdf','string'),(170,'sourceSubmissionFileId','34','int'),(170,'submissionFileId','36','int'),(170,'submissionId','7','int'),(170,'username','dbarnes','string'),(171,'fileId','19','int'),(171,'fileStage','4','int'),(171,'name','Chapter 3: Leadership Strategies for Coo.pdf','string'),(171,'submissionFileId','36','int'),(171,'submissionId','7','int'),(171,'username','dbarnes','string'),(172,'fileId','20','int'),(172,'fileStage','4','int'),(172,'originalFileName','Chapter 4: Toward New Models of Flexible.pdf','string'),(172,'sourceSubmissionFileId','35','int'),(172,'submissionFileId','37','int'),(172,'submissionId','7','int'),(172,'username','dbarnes','string'),(173,'fileId','20','int'),(173,'fileStage','4','int'),(173,'name','Chapter 4: Toward New Models of Flexible.pdf','string'),(173,'submissionFileId','37','int'),(173,'submissionId','7','int'),(173,'username','dbarnes','string'),(174,'fileId','17','int'),(174,'fileStage','4','int'),(174,'originalFileName','Chapter 1: Interactions Affording Distan.pdf','string'),(174,'sourceSubmissionFileId','32','int'),(174,'submissionFileId','38','int'),(174,'submissionId','7','int'),(174,'username','dbarnes','string'),(175,'fileId','17','int'),(175,'fileStage','4','int'),(175,'name','Chapter 1: Interactions Affording Distan.pdf','string'),(175,'submissionFileId','38','int'),(175,'submissionId','7','int'),(175,'username','dbarnes','string'),(176,'fileId','18','int'),(176,'fileStage','4','int'),(176,'originalFileName','Chapter 2: Learning Science at a Distanc.pdf','string'),(176,'sourceSubmissionFileId','33','int'),(176,'submissionFileId','39','int'),(176,'submissionId','7','int'),(176,'username','dbarnes','string'),(177,'fileId','18','int'),(177,'fileStage','4','int'),(177,'name','Chapter 2: Learning Science at a Distanc.pdf','string'),(177,'submissionFileId','39','int'),(177,'submissionId','7','int'),(177,'username','dbarnes','string'),(178,'fileId','16','int'),(178,'fileStage','4','int'),(178,'originalFileName','Introduction.pdf','string'),(178,'sourceSubmissionFileId','31','int'),(178,'submissionFileId','40','int'),(178,'submissionId','7','int'),(178,'username','dbarnes','string'),(179,'fileId','16','int'),(179,'fileStage','4','int'),(179,'name','Introduction.pdf','string'),(179,'submissionFileId','40','int'),(179,'submissionId','7','int'),(179,'username','dbarnes','string'),(180,'reviewAssignmentId','8','string'),(180,'reviewerName','Adela Gallego','string'),(180,'round','1','int'),(180,'stageId','3','int'),(180,'submissionId','7','int'),(181,'decision','2','int'),(181,'editorId','3','int'),(181,'editorName','Daniel Barnes','string'),(181,'submissionId','7','int'),(182,'name','Maria Fritz','string'),(182,'userGroupName','Copyeditor','string'),(182,'username','mfritz','string'),(184,'fileId','21','int'),(184,'fileStage','2','int'),(184,'originalFileName','Editorial.pdf','string'),(184,'sourceSubmissionFileId',NULL,'string'),(184,'submissionFileId','41','int'),(184,'submissionId','8','int'),(184,'username','dbarnes','string'),(185,'fileId','21','int'),(185,'fileStage','2','int'),(185,'name','Editorial.pdf','string'),(185,'submissionFileId','41','int'),(185,'submissionId','8','int'),(185,'username','dbarnes','string'),(186,'fileId','21','int'),(186,'fileStage','2','int'),(186,'originalFileName','Editorial.pdf','string'),(186,'sourceSubmissionFileId',NULL,'string'),(186,'submissionFileId','41','int'),(186,'submissionId','8','int'),(186,'username','dbarnes','string'),(187,'fileId','21','int'),(187,'fileStage','2','int'),(187,'name','Editorial.pdf','string'),(187,'originalFileName','Editorial.pdf','string'),(187,'sourceSubmissionFileId',NULL,'string'),(187,'submissionFileId','41','int'),(187,'submissionId','8','int'),(187,'username','dbarnes','string'),(191,'fileId','22','int'),(191,'fileStage','2','int'),(191,'originalFileName','Internet, openness and the future of the.pdf','string'),(191,'sourceSubmissionFileId',NULL,'string'),(191,'submissionFileId','42','int'),(191,'submissionId','9','int'),(191,'username','fperini','string'),(192,'fileId','22','int'),(192,'fileStage','2','int'),(192,'name','Internet, openness and the future of the.pdf','string'),(192,'submissionFileId','42','int'),(192,'submissionId','9','int'),(192,'username','fperini','string'),(193,'fileId','22','int'),(193,'fileStage','2','int'),(193,'originalFileName','Internet, openness and the future of the.pdf','string'),(193,'sourceSubmissionFileId',NULL,'string'),(193,'submissionFileId','42','int'),(193,'submissionId','9','int'),(193,'username','fperini','string'),(194,'fileId','22','int'),(194,'fileStage','2','int'),(194,'name','Internet, openness and the future of the.pdf','string'),(194,'originalFileName','Internet, openness and the future of the.pdf','string'),(194,'sourceSubmissionFileId',NULL,'string'),(194,'submissionFileId','42','int'),(194,'submissionId','9','int'),(194,'username','fperini','string'),(195,'fileId','23','int'),(195,'fileStage','2','int'),(195,'originalFileName','Imagining the Internet: Open, closed or .pdf','string'),(195,'sourceSubmissionFileId',NULL,'string'),(195,'submissionFileId','43','int'),(195,'submissionId','9','int'),(195,'username','fperini','string'),(196,'fileId','23','int'),(196,'fileStage','2','int'),(196,'name','Imagining the Internet: Open, closed or .pdf','string'),(196,'submissionFileId','43','int'),(196,'submissionId','9','int'),(196,'username','fperini','string'),(197,'fileId','23','int'),(197,'fileStage','2','int'),(197,'originalFileName','Imagining the Internet: Open, closed or .pdf','string'),(197,'sourceSubmissionFileId',NULL,'string'),(197,'submissionFileId','43','int'),(197,'submissionId','9','int'),(197,'username','fperini','string'),(198,'fileId','23','int'),(198,'fileStage','2','int'),(198,'name','Imagining the Internet: Open, closed or .pdf','string'),(198,'originalFileName','Imagining the Internet: Open, closed or .pdf','string'),(198,'sourceSubmissionFileId',NULL,'string'),(198,'submissionFileId','43','int'),(198,'submissionId','9','int'),(198,'username','fperini','string'),(199,'fileId','24','int'),(199,'fileStage','2','int'),(199,'originalFileName','The internet in LAC will remain free, pu.pdf','string'),(199,'sourceSubmissionFileId',NULL,'string'),(199,'submissionFileId','44','int'),(199,'submissionId','9','int'),(199,'username','fperini','string'),(200,'fileId','24','int'),(200,'fileStage','2','int'),(200,'name','The internet in LAC will remain free, pu.pdf','string'),(200,'submissionFileId','44','int'),(200,'submissionId','9','int'),(200,'username','fperini','string'),(201,'fileId','24','int'),(201,'fileStage','2','int'),(201,'originalFileName','The internet in LAC will remain free, pu.pdf','string'),(201,'sourceSubmissionFileId',NULL,'string'),(201,'submissionFileId','44','int'),(201,'submissionId','9','int'),(201,'username','fperini','string'),(202,'fileId','24','int'),(202,'fileStage','2','int'),(202,'name','The internet in LAC will remain free, pu.pdf','string'),(202,'originalFileName','The internet in LAC will remain free, pu.pdf','string'),(202,'sourceSubmissionFileId',NULL,'string'),(202,'submissionFileId','44','int'),(202,'submissionId','9','int'),(202,'username','fperini','string'),(203,'fileId','25','int'),(203,'fileStage','2','int'),(203,'originalFileName','Free Internet?.pdf','string'),(203,'sourceSubmissionFileId',NULL,'string'),(203,'submissionFileId','45','int'),(203,'submissionId','9','int'),(203,'username','fperini','string'),(204,'fileId','25','int'),(204,'fileStage','2','int'),(204,'name','Free Internet?.pdf','string'),(204,'submissionFileId','45','int'),(204,'submissionId','9','int'),(204,'username','fperini','string'),(205,'fileId','25','int'),(205,'fileStage','2','int'),(205,'originalFileName','Free Internet?.pdf','string'),(205,'sourceSubmissionFileId',NULL,'string'),(205,'submissionFileId','45','int'),(205,'submissionId','9','int'),(205,'username','fperini','string'),(206,'fileId','25','int'),(206,'fileStage','2','int'),(206,'name','Free Internet?.pdf','string'),(206,'originalFileName','Free Internet?.pdf','string'),(206,'sourceSubmissionFileId',NULL,'string'),(206,'submissionFileId','45','int'),(206,'submissionId','9','int'),(206,'username','fperini','string'),(207,'fileId','26','int'),(207,'fileStage','2','int'),(207,'originalFileName','Risks and challenges for freedom of expr.pdf','string'),(207,'sourceSubmissionFileId',NULL,'string'),(207,'submissionFileId','46','int'),(207,'submissionId','9','int'),(207,'username','fperini','string'),(208,'fileId','26','int'),(208,'fileStage','2','int'),(208,'name','Risks and challenges for freedom of expr.pdf','string'),(208,'submissionFileId','46','int'),(208,'submissionId','9','int'),(208,'username','fperini','string'),(209,'fileId','26','int'),(209,'fileStage','2','int'),(209,'originalFileName','Risks and challenges for freedom of expr.pdf','string'),(209,'sourceSubmissionFileId',NULL,'string'),(209,'submissionFileId','46','int'),(209,'submissionId','9','int'),(209,'username','fperini','string'),(210,'fileId','26','int'),(210,'fileStage','2','int'),(210,'name','Risks and challenges for freedom of expr.pdf','string'),(210,'originalFileName','Risks and challenges for freedom of expr.pdf','string'),(210,'sourceSubmissionFileId',NULL,'string'),(210,'submissionFileId','46','int'),(210,'submissionId','9','int'),(210,'username','fperini','string'),(213,'decision','1','int'),(213,'editorId','3','int'),(213,'editorName','Daniel Barnes','string'),(213,'submissionId','9','int'),(214,'fileId','25','int'),(214,'fileStage','19','int'),(214,'originalFileName','Free Internet?.pdf','string'),(214,'sourceSubmissionFileId','45','int'),(214,'submissionFileId','47','int'),(214,'submissionId','9','int'),(214,'username','dbarnes','string'),(215,'fileId','25','int'),(215,'fileStage','19','int'),(215,'name','Free Internet?.pdf','string'),(215,'submissionFileId','47','int'),(215,'submissionId','9','int'),(215,'username','dbarnes','string'),(216,'fileId','26','int'),(216,'fileStage','19','int'),(216,'originalFileName','Risks and challenges for freedom of expr.pdf','string'),(216,'sourceSubmissionFileId','46','int'),(216,'submissionFileId','48','int'),(216,'submissionId','9','int'),(216,'username','dbarnes','string'),(217,'fileId','26','int'),(217,'fileStage','19','int'),(217,'name','Risks and challenges for freedom of expr.pdf','string'),(217,'submissionFileId','48','int'),(217,'submissionId','9','int'),(217,'username','dbarnes','string'),(218,'fileId','23','int'),(218,'fileStage','19','int'),(218,'originalFileName','Imagining the Internet: Open, closed or .pdf','string'),(218,'sourceSubmissionFileId','43','int'),(218,'submissionFileId','49','int'),(218,'submissionId','9','int'),(218,'username','dbarnes','string'),(219,'fileId','23','int'),(219,'fileStage','19','int'),(219,'name','Imagining the Internet: Open, closed or .pdf','string'),(219,'submissionFileId','49','int'),(219,'submissionId','9','int'),(219,'username','dbarnes','string'),(220,'fileId','24','int'),(220,'fileStage','19','int'),(220,'originalFileName','The internet in LAC will remain free, pu.pdf','string'),(220,'sourceSubmissionFileId','44','int'),(220,'submissionFileId','50','int'),(220,'submissionId','9','int'),(220,'username','dbarnes','string'),(221,'fileId','24','int'),(221,'fileStage','19','int'),(221,'name','The internet in LAC will remain free, pu.pdf','string'),(221,'submissionFileId','50','int'),(221,'submissionId','9','int'),(221,'username','dbarnes','string'),(222,'fileId','22','int'),(222,'fileStage','19','int'),(222,'originalFileName','Internet, openness and the future of the.pdf','string'),(222,'sourceSubmissionFileId','42','int'),(222,'submissionFileId','51','int'),(222,'submissionId','9','int'),(222,'username','dbarnes','string'),(223,'fileId','22','int'),(223,'fileStage','19','int'),(223,'name','Internet, openness and the future of the.pdf','string'),(223,'submissionFileId','51','int'),(223,'submissionId','9','int'),(223,'username','dbarnes','string'),(225,'fileId','27','int'),(225,'fileStage','2','int'),(225,'originalFileName','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(225,'sourceSubmissionFileId',NULL,'string'),(225,'submissionFileId','52','int'),(225,'submissionId','10','int'),(225,'username','jbrower','string'),(226,'fileId','27','int'),(226,'fileStage','2','int'),(226,'name','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(226,'submissionFileId','52','int'),(226,'submissionId','10','int'),(226,'username','jbrower','string'),(227,'fileId','27','int'),(227,'fileStage','2','int'),(227,'originalFileName','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(227,'sourceSubmissionFileId',NULL,'string'),(227,'submissionFileId','52','int'),(227,'submissionId','10','int'),(227,'username','jbrower','string'),(228,'fileId','27','int'),(228,'fileStage','2','int'),(228,'name','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(228,'originalFileName','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(228,'sourceSubmissionFileId',NULL,'string'),(228,'submissionFileId','52','int'),(228,'submissionId','10','int'),(228,'username','jbrower','string'),(232,'fileId','28','int'),(232,'fileStage','2','int'),(232,'originalFileName','Dreamwork.pdf','string'),(232,'sourceSubmissionFileId',NULL,'string'),(232,'submissionFileId','53','int'),(232,'submissionId','11','int'),(232,'username','jlockehart','string'),(233,'fileId','28','int'),(233,'fileStage','2','int'),(233,'name','Dreamwork.pdf','string'),(233,'submissionFileId','53','int'),(233,'submissionId','11','int'),(233,'username','jlockehart','string'),(234,'fileId','28','int'),(234,'fileStage','2','int'),(234,'originalFileName','Dreamwork.pdf','string'),(234,'sourceSubmissionFileId',NULL,'string'),(234,'submissionFileId','53','int'),(234,'submissionId','11','int'),(234,'username','jlockehart','string'),(235,'fileId','28','int'),(235,'fileStage','2','int'),(235,'name','Dreamwork.pdf','string'),(235,'originalFileName','Dreamwork.pdf','string'),(235,'sourceSubmissionFileId',NULL,'string'),(235,'submissionFileId','53','int'),(235,'submissionId','11','int'),(235,'username','jlockehart','string'),(238,'decision','1','int'),(238,'editorId','3','int'),(238,'editorName','Daniel Barnes','string'),(238,'submissionId','11','int'),(239,'fileId','28','int'),(239,'fileStage','19','int'),(239,'originalFileName','Dreamwork.pdf','string'),(239,'sourceSubmissionFileId','53','int'),(239,'submissionFileId','54','int'),(239,'submissionId','11','int'),(239,'username','dbarnes','string'),(240,'fileId','28','int'),(240,'fileStage','19','int'),(240,'name','Dreamwork.pdf','string'),(240,'submissionFileId','54','int'),(240,'submissionId','11','int'),(240,'username','dbarnes','string'),(241,'reviewAssignmentId','9','string'),(241,'reviewerName','Aisla McCrae','string'),(241,'round','1','int'),(241,'stageId','2','int'),(241,'submissionId','11','int'),(242,'decision','3','int'),(242,'editorId','3','int'),(242,'editorName','Daniel Barnes','string'),(242,'submissionId','11','int'),(243,'reviewAssignmentId','10','string'),(243,'reviewerName','Adela Gallego','string'),(243,'round','1','int'),(243,'stageId','3','int'),(243,'submissionId','11','int'),(244,'reviewAssignmentId','11','string'),(244,'reviewerName','Gonzalo Favio','string'),(244,'round','1','int'),(244,'stageId','3','int'),(244,'submissionId','11','int'),(245,'reviewAssignmentId','10','int'),(245,'reviewerName','Adela Gallego','string'),(245,'round','1','int'),(245,'submissionId','11','int'),(246,'reviewAssignmentId','10','int'),(246,'reviewerName','Adela Gallego','string'),(246,'round','1','int'),(246,'submissionId','11','int'),(247,'reviewAssignmentId','11','int'),(247,'reviewerName','Gonzalo Favio','string'),(247,'round','1','int'),(247,'submissionId','11','int'),(248,'reviewAssignmentId','11','int'),(248,'reviewerName','Gonzalo Favio','string'),(248,'round','1','int'),(248,'submissionId','11','int'),(249,'decision','2','int'),(249,'editorId','3','int'),(249,'editorName','Daniel Barnes','string'),(249,'submissionId','11','int'),(250,'recipientCount','2','int'),(250,'subject','Thank you for your review','string'),(252,'fileId','29','int'),(252,'fileStage','2','int'),(252,'originalFileName','Catalyzing Access through Social and Tec.pdf','string'),(252,'sourceSubmissionFileId',NULL,'string'),(252,'submissionFileId','55','int'),(252,'submissionId','12','int'),(252,'username','lelder','string'),(253,'fileId','29','int'),(253,'fileStage','2','int'),(253,'name','Catalyzing Access through Social and Tec.pdf','string'),(253,'submissionFileId','55','int'),(253,'submissionId','12','int'),(253,'username','lelder','string'),(254,'fileId','29','int'),(254,'fileStage','2','int'),(254,'originalFileName','Catalyzing Access through Social and Tec.pdf','string'),(254,'sourceSubmissionFileId',NULL,'string'),(254,'submissionFileId','55','int'),(254,'submissionId','12','int'),(254,'username','lelder','string'),(255,'fileId','29','int'),(255,'fileStage','2','int'),(255,'name','Catalyzing Access through Social and Tec.pdf','string'),(255,'originalFileName','Catalyzing Access through Social and Tec.pdf','string'),(255,'sourceSubmissionFileId',NULL,'string'),(255,'submissionFileId','55','int'),(255,'submissionId','12','int'),(255,'username','lelder','string'),(256,'fileId','30','int'),(256,'fileStage','2','int'),(256,'originalFileName','Catalyzing Access via Telecommunications.pdf','string'),(256,'sourceSubmissionFileId',NULL,'string'),(256,'submissionFileId','56','int'),(256,'submissionId','12','int'),(256,'username','lelder','string'),(257,'fileId','30','int'),(257,'fileStage','2','int'),(257,'name','Catalyzing Access via Telecommunications.pdf','string'),(257,'submissionFileId','56','int'),(257,'submissionId','12','int'),(257,'username','lelder','string'),(258,'fileId','30','int'),(258,'fileStage','2','int'),(258,'originalFileName','Catalyzing Access via Telecommunications.pdf','string'),(258,'sourceSubmissionFileId',NULL,'string'),(258,'submissionFileId','56','int'),(258,'submissionId','12','int'),(258,'username','lelder','string'),(259,'fileId','30','int'),(259,'fileStage','2','int'),(259,'name','Catalyzing Access via Telecommunications.pdf','string'),(259,'originalFileName','Catalyzing Access via Telecommunications.pdf','string'),(259,'sourceSubmissionFileId',NULL,'string'),(259,'submissionFileId','56','int'),(259,'submissionId','12','int'),(259,'username','lelder','string'),(260,'fileId','31','int'),(260,'fileStage','2','int'),(260,'originalFileName','Access to Knowledge as a New Paradigm fo.pdf','string'),(260,'sourceSubmissionFileId',NULL,'string'),(260,'submissionFileId','57','int'),(260,'submissionId','12','int'),(260,'username','lelder','string'),(261,'fileId','31','int'),(261,'fileStage','2','int'),(261,'name','Access to Knowledge as a New Paradigm fo.pdf','string'),(261,'submissionFileId','57','int'),(261,'submissionId','12','int'),(261,'username','lelder','string'),(262,'fileId','31','int'),(262,'fileStage','2','int'),(262,'originalFileName','Access to Knowledge as a New Paradigm fo.pdf','string'),(262,'sourceSubmissionFileId',NULL,'string'),(262,'submissionFileId','57','int'),(262,'submissionId','12','int'),(262,'username','lelder','string'),(263,'fileId','31','int'),(263,'fileStage','2','int'),(263,'name','Access to Knowledge as a New Paradigm fo.pdf','string'),(263,'originalFileName','Access to Knowledge as a New Paradigm fo.pdf','string'),(263,'sourceSubmissionFileId',NULL,'string'),(263,'submissionFileId','57','int'),(263,'submissionId','12','int'),(263,'username','lelder','string'),(266,'decision','1','int'),(266,'editorId','3','int'),(266,'editorName','Daniel Barnes','string'),(266,'submissionId','12','int'),(267,'fileId','30','int'),(267,'fileStage','19','int'),(267,'originalFileName','Catalyzing Access via Telecommunications.pdf','string'),(267,'sourceSubmissionFileId','56','int'),(267,'submissionFileId','58','int'),(267,'submissionId','12','int'),(267,'username','dbarnes','string'),(268,'fileId','30','int'),(268,'fileStage','19','int'),(268,'name','Catalyzing Access via Telecommunications.pdf','string'),(268,'submissionFileId','58','int'),(268,'submissionId','12','int'),(268,'username','dbarnes','string'),(269,'fileId','31','int'),(269,'fileStage','19','int'),(269,'originalFileName','Access to Knowledge as a New Paradigm fo.pdf','string'),(269,'sourceSubmissionFileId','57','int'),(269,'submissionFileId','59','int'),(269,'submissionId','12','int'),(269,'username','dbarnes','string'),(270,'fileId','31','int'),(270,'fileStage','19','int'),(270,'name','Access to Knowledge as a New Paradigm fo.pdf','string'),(270,'submissionFileId','59','int'),(270,'submissionId','12','int'),(270,'username','dbarnes','string'),(271,'fileId','29','int'),(271,'fileStage','19','int'),(271,'originalFileName','Catalyzing Access through Social and Tec.pdf','string'),(271,'sourceSubmissionFileId','55','int'),(271,'submissionFileId','60','int'),(271,'submissionId','12','int'),(271,'username','dbarnes','string'),(272,'fileId','29','int'),(272,'fileStage','19','int'),(272,'name','Catalyzing Access through Social and Tec.pdf','string'),(272,'submissionFileId','60','int'),(272,'submissionId','12','int'),(272,'username','dbarnes','string'),(273,'reviewAssignmentId','12','string'),(273,'reviewerName','Julie Janssen','string'),(273,'round','1','int'),(273,'stageId','2','int'),(273,'submissionId','12','int'),(274,'reviewAssignmentId','13','string'),(274,'reviewerName','Paul Hudson','string'),(274,'round','1','int'),(274,'stageId','2','int'),(274,'submissionId','12','int'),(275,'reviewAssignmentId','14','string'),(275,'reviewerName','Aisla McCrae','string'),(275,'round','1','int'),(275,'stageId','2','int'),(275,'submissionId','12','int'),(276,'reviewAssignmentId','13','int'),(276,'reviewerName','Paul Hudson','string'),(276,'round','1','int'),(276,'submissionId','12','int'),(277,'reviewAssignmentId','13','int'),(277,'reviewerName','Paul Hudson','string'),(277,'round','1','int'),(277,'submissionId','12','int'),(279,'fileId','32','int'),(279,'fileStage','2','int'),(279,'originalFileName','Current State of Mobile Learning.pdf','string'),(279,'sourceSubmissionFileId',NULL,'string'),(279,'submissionFileId','61','int'),(279,'submissionId','13','int'),(279,'username','mally','string'),(280,'fileId','32','int'),(280,'fileStage','2','int'),(280,'name','Current State of Mobile Learning.pdf','string'),(280,'submissionFileId','61','int'),(280,'submissionId','13','int'),(280,'username','mally','string'),(281,'fileId','32','int'),(281,'fileStage','2','int'),(281,'originalFileName','Current State of Mobile Learning.pdf','string'),(281,'sourceSubmissionFileId',NULL,'string'),(281,'submissionFileId','61','int'),(281,'submissionId','13','int'),(281,'username','mally','string'),(282,'fileId','32','int'),(282,'fileStage','2','int'),(282,'name','Current State of Mobile Learning.pdf','string'),(282,'originalFileName','Current State of Mobile Learning.pdf','string'),(282,'sourceSubmissionFileId',NULL,'string'),(282,'submissionFileId','61','int'),(282,'submissionId','13','int'),(282,'username','mally','string'),(283,'fileId','33','int'),(283,'fileStage','2','int'),(283,'originalFileName','A Model for Framing Mobile Learning.pdf','string'),(283,'sourceSubmissionFileId',NULL,'string'),(283,'submissionFileId','62','int'),(283,'submissionId','13','int'),(283,'username','mally','string'),(284,'fileId','33','int'),(284,'fileStage','2','int'),(284,'name','A Model for Framing Mobile Learning.pdf','string'),(284,'submissionFileId','62','int'),(284,'submissionId','13','int'),(284,'username','mally','string'),(285,'fileId','33','int'),(285,'fileStage','2','int'),(285,'originalFileName','A Model for Framing Mobile Learning.pdf','string'),(285,'sourceSubmissionFileId',NULL,'string'),(285,'submissionFileId','62','int'),(285,'submissionId','13','int'),(285,'username','mally','string'),(286,'fileId','33','int'),(286,'fileStage','2','int'),(286,'name','A Model for Framing Mobile Learning.pdf','string'),(286,'originalFileName','A Model for Framing Mobile Learning.pdf','string'),(286,'sourceSubmissionFileId',NULL,'string'),(286,'submissionFileId','62','int'),(286,'submissionId','13','int'),(286,'username','mally','string'),(287,'fileId','34','int'),(287,'fileStage','2','int'),(287,'originalFileName','Mobile Distance Learning with PDAs: Deve.pdf','string'),(287,'sourceSubmissionFileId',NULL,'string'),(287,'submissionFileId','63','int'),(287,'submissionId','13','int'),(287,'username','mally','string'),(288,'fileId','34','int'),(288,'fileStage','2','int'),(288,'name','Mobile Distance Learning with PDAs: Deve.pdf','string'),(288,'submissionFileId','63','int'),(288,'submissionId','13','int'),(288,'username','mally','string'),(289,'fileId','34','int'),(289,'fileStage','2','int'),(289,'originalFileName','Mobile Distance Learning with PDAs: Deve.pdf','string'),(289,'sourceSubmissionFileId',NULL,'string'),(289,'submissionFileId','63','int'),(289,'submissionId','13','int'),(289,'username','mally','string'),(290,'fileId','34','int'),(290,'fileStage','2','int'),(290,'name','Mobile Distance Learning with PDAs: Deve.pdf','string'),(290,'originalFileName','Mobile Distance Learning with PDAs: Deve.pdf','string'),(290,'sourceSubmissionFileId',NULL,'string'),(290,'submissionFileId','63','int'),(290,'submissionId','13','int'),(290,'username','mally','string'),(293,'decision','1','int'),(293,'editorId','3','int'),(293,'editorName','Daniel Barnes','string'),(293,'submissionId','13','int'),(294,'fileId','33','int'),(294,'fileStage','19','int'),(294,'originalFileName','A Model for Framing Mobile Learning.pdf','string'),(294,'sourceSubmissionFileId','62','int'),(294,'submissionFileId','64','int'),(294,'submissionId','13','int'),(294,'username','dbarnes','string'),(295,'fileId','33','int'),(295,'fileStage','19','int'),(295,'name','A Model for Framing Mobile Learning.pdf','string'),(295,'submissionFileId','64','int'),(295,'submissionId','13','int'),(295,'username','dbarnes','string'),(296,'fileId','34','int'),(296,'fileStage','19','int'),(296,'originalFileName','Mobile Distance Learning with PDAs: Deve.pdf','string'),(296,'sourceSubmissionFileId','63','int'),(296,'submissionFileId','65','int'),(296,'submissionId','13','int'),(296,'username','dbarnes','string'),(297,'fileId','34','int'),(297,'fileStage','19','int'),(297,'name','Mobile Distance Learning with PDAs: Deve.pdf','string'),(297,'submissionFileId','65','int'),(297,'submissionId','13','int'),(297,'username','dbarnes','string'),(298,'fileId','32','int'),(298,'fileStage','19','int'),(298,'originalFileName','Current State of Mobile Learning.pdf','string'),(298,'sourceSubmissionFileId','61','int'),(298,'submissionFileId','66','int'),(298,'submissionId','13','int'),(298,'username','dbarnes','string'),(299,'fileId','32','int'),(299,'fileStage','19','int'),(299,'name','Current State of Mobile Learning.pdf','string'),(299,'submissionFileId','66','int'),(299,'submissionId','13','int'),(299,'username','dbarnes','string'),(300,'reviewAssignmentId','15','string'),(300,'reviewerName','Paul Hudson','string'),(300,'round','1','int'),(300,'stageId','2','int'),(300,'submissionId','13','int'),(301,'decision','3','int'),(301,'editorId','3','int'),(301,'editorName','Daniel Barnes','string'),(301,'submissionId','13','int'),(302,'reviewAssignmentId','16','string'),(302,'reviewerName','Adela Gallego','string'),(302,'round','1','int'),(302,'stageId','3','int'),(302,'submissionId','13','int'),(303,'reviewAssignmentId','17','string'),(303,'reviewerName','Al Zacharia','string'),(303,'round','1','int'),(303,'stageId','3','int'),(303,'submissionId','13','int'),(304,'reviewAssignmentId','18','string'),(304,'reviewerName','Gonzalo Favio','string'),(304,'round','1','int'),(304,'stageId','3','int'),(304,'submissionId','13','int'),(305,'reviewAssignmentId','16','int'),(305,'reviewerName','Adela Gallego','string'),(305,'round','1','int'),(305,'submissionId','13','int'),(306,'reviewAssignmentId','16','int'),(306,'reviewerName','Adela Gallego','string'),(306,'round','1','int'),(306,'submissionId','13','int'),(307,'reviewAssignmentId','18','int'),(307,'reviewerName','Gonzalo Favio','string'),(307,'round','1','int'),(307,'submissionId','13','int'),(308,'reviewAssignmentId','18','int'),(308,'reviewerName','Gonzalo Favio','string'),(308,'round','1','int'),(308,'submissionId','13','int'),(309,'decision','2','int'),(309,'editorId','3','int'),(309,'editorName','Daniel Barnes','string'),(309,'submissionId','13','int'),(310,'recipientCount','2','int'),(310,'subject','Thank you for your review','string'),(312,'fileId','35','int'),(312,'fileStage','2','int'),(312,'originalFileName','Chapter 1: Mind Control???Internal or Exte.pdf','string'),(312,'sourceSubmissionFileId',NULL,'string'),(312,'submissionFileId','67','int'),(312,'submissionId','14','int'),(312,'username','mdawson','string'),(313,'fileId','35','int'),(313,'fileStage','2','int'),(313,'name','Chapter 1: Mind Control???Internal or Exte.pdf','string'),(313,'submissionFileId','67','int'),(313,'submissionId','14','int'),(313,'username','mdawson','string'),(314,'fileId','35','int'),(314,'fileStage','2','int'),(314,'originalFileName','Chapter 1: Mind Control???Internal or Exte.pdf','string'),(314,'sourceSubmissionFileId',NULL,'string'),(314,'submissionFileId','67','int'),(314,'submissionId','14','int'),(314,'username','mdawson','string'),(315,'fileId','35','int'),(315,'fileStage','2','int'),(315,'name','Chapter 1: Mind Control???Internal or Exte.pdf','string'),(315,'originalFileName','Chapter 1: Mind Control???Internal or Exte.pdf','string'),(315,'sourceSubmissionFileId',NULL,'string'),(315,'submissionFileId','67','int'),(315,'submissionId','14','int'),(315,'username','mdawson','string'),(316,'fileId','36','int'),(316,'fileStage','2','int'),(316,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(316,'sourceSubmissionFileId',NULL,'string'),(316,'submissionFileId','68','int'),(316,'submissionId','14','int'),(316,'username','mdawson','string'),(317,'fileId','36','int'),(317,'fileStage','2','int'),(317,'name','Chapter 2: Classical Music and the Class.pdf','string'),(317,'submissionFileId','68','int'),(317,'submissionId','14','int'),(317,'username','mdawson','string'),(318,'fileId','36','int'),(318,'fileStage','2','int'),(318,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(318,'sourceSubmissionFileId',NULL,'string'),(318,'submissionFileId','68','int'),(318,'submissionId','14','int'),(318,'username','mdawson','string'),(319,'fileId','36','int'),(319,'fileStage','2','int'),(319,'name','Chapter 2: Classical Music and the Class.pdf','string'),(319,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(319,'sourceSubmissionFileId',NULL,'string'),(319,'submissionFileId','68','int'),(319,'submissionId','14','int'),(319,'username','mdawson','string'),(320,'fileId','37','int'),(320,'fileStage','2','int'),(320,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(320,'sourceSubmissionFileId',NULL,'string'),(320,'submissionFileId','69','int'),(320,'submissionId','14','int'),(320,'username','mdawson','string'),(321,'fileId','37','int'),(321,'fileStage','2','int'),(321,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(321,'submissionFileId','69','int'),(321,'submissionId','14','int'),(321,'username','mdawson','string'),(322,'fileId','37','int'),(322,'fileStage','2','int'),(322,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(322,'sourceSubmissionFileId',NULL,'string'),(322,'submissionFileId','69','int'),(322,'submissionId','14','int'),(322,'username','mdawson','string'),(323,'fileId','37','int'),(323,'fileStage','2','int'),(323,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(323,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(323,'sourceSubmissionFileId',NULL,'string'),(323,'submissionFileId','69','int'),(323,'submissionId','14','int'),(323,'username','mdawson','string'),(324,'fileId','38','int'),(324,'fileStage','2','int'),(324,'originalFileName','Chapter 4: Braitenberg???s Vehicle 2.pdf','string'),(324,'sourceSubmissionFileId',NULL,'string'),(324,'submissionFileId','70','int'),(324,'submissionId','14','int'),(324,'username','mdawson','string'),(325,'fileId','38','int'),(325,'fileStage','2','int'),(325,'name','Chapter 4: Braitenberg???s Vehicle 2.pdf','string'),(325,'submissionFileId','70','int'),(325,'submissionId','14','int'),(325,'username','mdawson','string'),(326,'fileId','38','int'),(326,'fileStage','2','int'),(326,'originalFileName','Chapter 4: Braitenberg???s Vehicle 2.pdf','string'),(326,'sourceSubmissionFileId',NULL,'string'),(326,'submissionFileId','70','int'),(326,'submissionId','14','int'),(326,'username','mdawson','string'),(327,'fileId','38','int'),(327,'fileStage','2','int'),(327,'name','Chapter 4: Braitenberg???s Vehicle 2.pdf','string'),(327,'originalFileName','Chapter 4: Braitenberg???s Vehicle 2.pdf','string'),(327,'sourceSubmissionFileId',NULL,'string'),(327,'submissionFileId','70','int'),(327,'submissionId','14','int'),(327,'username','mdawson','string'),(328,'fileId','39','int'),(328,'fileStage','2','int'),(328,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(328,'sourceSubmissionFileId',NULL,'string'),(328,'submissionFileId','71','int'),(328,'submissionId','14','int'),(328,'username','mdawson','string'),(329,'fileId','39','int'),(329,'fileStage','2','int'),(329,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(329,'submissionFileId','71','int'),(329,'submissionId','14','int'),(329,'username','mdawson','string'),(330,'fileId','39','int'),(330,'fileStage','2','int'),(330,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(330,'sourceSubmissionFileId',NULL,'string'),(330,'submissionFileId','71','int'),(330,'submissionId','14','int'),(330,'username','mdawson','string'),(331,'fileId','39','int'),(331,'fileStage','2','int'),(331,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(331,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(331,'sourceSubmissionFileId',NULL,'string'),(331,'submissionFileId','71','int'),(331,'submissionId','14','int'),(331,'username','mdawson','string'),(332,'fileId','40','int'),(332,'fileStage','2','int'),(332,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(332,'sourceSubmissionFileId',NULL,'string'),(332,'submissionFileId','72','int'),(332,'submissionId','14','int'),(332,'username','mdawson','string'),(333,'fileId','40','int'),(333,'fileStage','2','int'),(333,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(333,'submissionFileId','72','int'),(333,'submissionId','14','int'),(333,'username','mdawson','string'),(334,'fileId','40','int'),(334,'fileStage','2','int'),(334,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(334,'sourceSubmissionFileId',NULL,'string'),(334,'submissionFileId','72','int'),(334,'submissionId','14','int'),(334,'username','mdawson','string'),(335,'fileId','40','int'),(335,'fileStage','2','int'),(335,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(335,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(335,'sourceSubmissionFileId',NULL,'string'),(335,'submissionFileId','72','int'),(335,'submissionId','14','int'),(335,'username','mdawson','string'),(338,'decision','1','int'),(338,'editorId','3','int'),(338,'editorName','Daniel Barnes','string'),(338,'submissionId','14','int'),(339,'fileId','40','int'),(339,'fileStage','19','int'),(339,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(339,'sourceSubmissionFileId','72','int'),(339,'submissionFileId','73','int'),(339,'submissionId','14','int'),(339,'username','dbarnes','string'),(340,'fileId','40','int'),(340,'fileStage','19','int'),(340,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(340,'submissionFileId','73','int'),(340,'submissionId','14','int'),(340,'username','dbarnes','string'),(341,'fileId','39','int'),(341,'fileStage','19','int'),(341,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(341,'sourceSubmissionFileId','71','int'),(341,'submissionFileId','74','int'),(341,'submissionId','14','int'),(341,'username','dbarnes','string'),(342,'fileId','39','int'),(342,'fileStage','19','int'),(342,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(342,'submissionFileId','74','int'),(342,'submissionId','14','int'),(342,'username','dbarnes','string'),(343,'fileId','37','int'),(343,'fileStage','19','int'),(343,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(343,'sourceSubmissionFileId','69','int'),(343,'submissionFileId','75','int'),(343,'submissionId','14','int'),(343,'username','dbarnes','string'),(344,'fileId','37','int'),(344,'fileStage','19','int'),(344,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(344,'submissionFileId','75','int'),(344,'submissionId','14','int'),(344,'username','dbarnes','string'),(345,'fileId','38','int'),(345,'fileStage','19','int'),(345,'originalFileName','Chapter 4: Braitenberg???s Vehicle 2.pdf','string'),(345,'sourceSubmissionFileId','70','int'),(345,'submissionFileId','76','int'),(345,'submissionId','14','int'),(345,'username','dbarnes','string'),(346,'fileId','38','int'),(346,'fileStage','19','int'),(346,'name','Chapter 4: Braitenberg???s Vehicle 2.pdf','string'),(346,'submissionFileId','76','int'),(346,'submissionId','14','int'),(346,'username','dbarnes','string'),(347,'fileId','35','int'),(347,'fileStage','19','int'),(347,'originalFileName','Chapter 1: Mind Control???Internal or Exte.pdf','string'),(347,'sourceSubmissionFileId','67','int'),(347,'submissionFileId','77','int'),(347,'submissionId','14','int'),(347,'username','dbarnes','string'),(348,'fileId','35','int'),(348,'fileStage','19','int'),(348,'name','Chapter 1: Mind Control???Internal or Exte.pdf','string'),(348,'submissionFileId','77','int'),(348,'submissionId','14','int'),(348,'username','dbarnes','string'),(349,'fileId','36','int'),(349,'fileStage','19','int'),(349,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(349,'sourceSubmissionFileId','68','int'),(349,'submissionFileId','78','int'),(349,'submissionId','14','int'),(349,'username','dbarnes','string'),(350,'fileId','36','int'),(350,'fileStage','19','int'),(350,'name','Chapter 2: Classical Music and the Class.pdf','string'),(350,'submissionFileId','78','int'),(350,'submissionId','14','int'),(350,'username','dbarnes','string'),(351,'reviewAssignmentId','19','string'),(351,'reviewerName','Julie Janssen','string'),(351,'round','1','int'),(351,'stageId','2','int'),(351,'submissionId','14','int'),(352,'decision','3','int'),(352,'editorId','3','int'),(352,'editorName','Daniel Barnes','string'),(352,'submissionId','14','int'),(353,'reviewAssignmentId','20','string'),(353,'reviewerName','Al Zacharia','string'),(353,'round','1','int'),(353,'stageId','3','int'),(353,'submissionId','14','int'),(354,'decision','2','int'),(354,'editorId','3','int'),(354,'editorName','Daniel Barnes','string'),(354,'submissionId','14','int'),(355,'name','Maria Fritz','string'),(355,'userGroupName','Copyeditor','string'),(355,'username','mfritz','string'),(356,'decision','7','int'),(356,'editorId','3','int'),(356,'editorName','Daniel Barnes','string'),(356,'submissionId','14','int'),(357,'name','Graham Cox','string'),(357,'userGroupName','Layout Editor','string'),(357,'username','gcox','string'),(358,'name','Sabine Kumar','string'),(358,'userGroupName','Proofreader','string'),(358,'username','skumar','string'),(359,'formatName','PDF','string'),(360,'fileId','40','int'),(360,'fileStage','10','int'),(360,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(360,'sourceSubmissionFileId','72','int'),(360,'submissionFileId','79','int'),(360,'submissionId','14','int'),(360,'username','dbarnes','string'),(361,'fileId','40','int'),(361,'fileStage','10','int'),(361,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(361,'submissionFileId','79','int'),(361,'submissionId','14','int'),(361,'username','dbarnes','string'),(362,'fileId','39','int'),(362,'fileStage','10','int'),(362,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(362,'sourceSubmissionFileId','71','int'),(362,'submissionFileId','80','int'),(362,'submissionId','14','int'),(362,'username','dbarnes','string'),(363,'fileId','39','int'),(363,'fileStage','10','int'),(363,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(363,'submissionFileId','80','int'),(363,'submissionId','14','int'),(363,'username','dbarnes','string'),(364,'fileId','37','int'),(364,'fileStage','10','int'),(364,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(364,'sourceSubmissionFileId','69','int'),(364,'submissionFileId','81','int'),(364,'submissionId','14','int'),(364,'username','dbarnes','string'),(365,'fileId','37','int'),(365,'fileStage','10','int'),(365,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(365,'submissionFileId','81','int'),(365,'submissionId','14','int'),(365,'username','dbarnes','string'),(366,'fileId','38','int'),(366,'fileStage','10','int'),(366,'originalFileName','Chapter 4: Braitenberg???s Vehicle 2.pdf','string'),(366,'sourceSubmissionFileId','70','int'),(366,'submissionFileId','82','int'),(366,'submissionId','14','int'),(366,'username','dbarnes','string'),(367,'fileId','38','int'),(367,'fileStage','10','int'),(367,'name','Chapter 4: Braitenberg???s Vehicle 2.pdf','string'),(367,'submissionFileId','82','int'),(367,'submissionId','14','int'),(367,'username','dbarnes','string'),(368,'fileId','35','int'),(368,'fileStage','10','int'),(368,'originalFileName','Chapter 1: Mind Control???Internal or Exte.pdf','string'),(368,'sourceSubmissionFileId','67','int'),(368,'submissionFileId','83','int'),(368,'submissionId','14','int'),(368,'username','dbarnes','string'),(369,'fileId','35','int'),(369,'fileStage','10','int'),(369,'name','Chapter 1: Mind Control???Internal or Exte.pdf','string'),(369,'submissionFileId','83','int'),(369,'submissionId','14','int'),(369,'username','dbarnes','string'),(370,'fileId','36','int'),(370,'fileStage','10','int'),(370,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(370,'sourceSubmissionFileId','68','int'),(370,'submissionFileId','84','int'),(370,'submissionId','14','int'),(370,'username','dbarnes','string'),(371,'fileId','36','int'),(371,'fileStage','10','int'),(371,'name','Chapter 2: Classical Music and the Class.pdf','string'),(371,'submissionFileId','84','int'),(371,'submissionId','14','int'),(371,'username','dbarnes','string'),(372,'publicationFormatName','PDF','string'),(373,'publicationFormatName','PDF','string'),(374,'fileId','35','int'),(374,'fileStage','10','int'),(374,'originalFileName','Chapter 1: Mind Control???Internal or Exte.pdf','string'),(374,'sourceSubmissionFileId','67','int'),(374,'submissionFileId','83','int'),(374,'submissionId','14','int'),(374,'username','dbarnes','string'),(375,'fileId','35','int'),(375,'fileStage','10','int'),(375,'name','Chapter 1: Mind Control???Internal or Exte.pdf','string'),(375,'originalFileName','Chapter 1: Mind Control???Internal or Exte.pdf','string'),(375,'sourceSubmissionFileId','67','int'),(375,'submissionFileId','83','int'),(375,'submissionId','14','int'),(375,'username','dbarnes','string'),(376,'file','Chapter 1: Mind Control???Internal or Exte.pdf','string'),(376,'name','Daniel Barnes','string'),(376,'username','dbarnes','string'),(377,'fileId','35','int'),(377,'fileStage','10','int'),(377,'originalFileName','Chapter 1: Mind Control???Internal or Exte.pdf','string'),(377,'sourceSubmissionFileId','67','int'),(377,'submissionFileId','83','int'),(377,'submissionId','14','int'),(377,'username','dbarnes','string'),(378,'fileId','35','int'),(378,'fileStage','10','int'),(378,'name','Chapter 1: Mind Control???Internal or Exte.pdf','string'),(378,'originalFileName','Chapter 1: Mind Control???Internal or Exte.pdf','string'),(378,'sourceSubmissionFileId','67','int'),(378,'submissionFileId','83','int'),(378,'submissionId','14','int'),(378,'username','dbarnes','string'),(379,'fileId','36','int'),(379,'fileStage','10','int'),(379,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(379,'sourceSubmissionFileId','68','int'),(379,'submissionFileId','84','int'),(379,'submissionId','14','int'),(379,'username','dbarnes','string'),(380,'fileId','36','int'),(380,'fileStage','10','int'),(380,'name','Chapter 2: Classical Music and the Class.pdf','string'),(380,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(380,'sourceSubmissionFileId','68','int'),(380,'submissionFileId','84','int'),(380,'submissionId','14','int'),(380,'username','dbarnes','string'),(381,'file','Chapter 2: Classical Music and the Class.pdf','string'),(381,'name','Daniel Barnes','string'),(381,'username','dbarnes','string'),(382,'fileId','36','int'),(382,'fileStage','10','int'),(382,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(382,'sourceSubmissionFileId','68','int'),(382,'submissionFileId','84','int'),(382,'submissionId','14','int'),(382,'username','dbarnes','string'),(383,'fileId','36','int'),(383,'fileStage','10','int'),(383,'name','Chapter 2: Classical Music and the Class.pdf','string'),(383,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(383,'sourceSubmissionFileId','68','int'),(383,'submissionFileId','84','int'),(383,'submissionId','14','int'),(383,'username','dbarnes','string'),(384,'fileId','37','int'),(384,'fileStage','10','int'),(384,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(384,'sourceSubmissionFileId','69','int'),(384,'submissionFileId','81','int'),(384,'submissionId','14','int'),(384,'username','dbarnes','string'),(385,'fileId','37','int'),(385,'fileStage','10','int'),(385,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(385,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(385,'sourceSubmissionFileId','69','int'),(385,'submissionFileId','81','int'),(385,'submissionId','14','int'),(385,'username','dbarnes','string'),(386,'file','Chapter 3: Situated Cognition and Bricol.pdf','string'),(386,'name','Daniel Barnes','string'),(386,'username','dbarnes','string'),(387,'fileId','37','int'),(387,'fileStage','10','int'),(387,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(387,'sourceSubmissionFileId','69','int'),(387,'submissionFileId','81','int'),(387,'submissionId','14','int'),(387,'username','dbarnes','string'),(388,'fileId','37','int'),(388,'fileStage','10','int'),(388,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(388,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(388,'sourceSubmissionFileId','69','int'),(388,'submissionFileId','81','int'),(388,'submissionId','14','int'),(388,'username','dbarnes','string'),(389,'fileId','38','int'),(389,'fileStage','10','int'),(389,'originalFileName','Chapter 4: Braitenberg???s Vehicle 2.pdf','string'),(389,'sourceSubmissionFileId','70','int'),(389,'submissionFileId','82','int'),(389,'submissionId','14','int'),(389,'username','dbarnes','string'),(390,'fileId','38','int'),(390,'fileStage','10','int'),(390,'name','Chapter 4: Braitenberg???s Vehicle 2.pdf','string'),(390,'originalFileName','Chapter 4: Braitenberg???s Vehicle 2.pdf','string'),(390,'sourceSubmissionFileId','70','int'),(390,'submissionFileId','82','int'),(390,'submissionId','14','int'),(390,'username','dbarnes','string'),(391,'file','Chapter 4: Braitenberg???s Vehicle 2.pdf','string'),(391,'name','Daniel Barnes','string'),(391,'username','dbarnes','string'),(392,'fileId','38','int'),(392,'fileStage','10','int'),(392,'originalFileName','Chapter 4: Braitenberg???s Vehicle 2.pdf','string'),(392,'sourceSubmissionFileId','70','int'),(392,'submissionFileId','82','int'),(392,'submissionId','14','int'),(392,'username','dbarnes','string'),(393,'fileId','38','int'),(393,'fileStage','10','int'),(393,'name','Chapter 4: Braitenberg???s Vehicle 2.pdf','string'),(393,'originalFileName','Chapter 4: Braitenberg???s Vehicle 2.pdf','string'),(393,'sourceSubmissionFileId','70','int'),(393,'submissionFileId','82','int'),(393,'submissionId','14','int'),(393,'username','dbarnes','string'),(394,'fileId','39','int'),(394,'fileStage','10','int'),(394,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(394,'sourceSubmissionFileId','71','int'),(394,'submissionFileId','80','int'),(394,'submissionId','14','int'),(394,'username','dbarnes','string'),(395,'fileId','39','int'),(395,'fileStage','10','int'),(395,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(395,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(395,'sourceSubmissionFileId','71','int'),(395,'submissionFileId','80','int'),(395,'submissionId','14','int'),(395,'username','dbarnes','string'),(396,'file','Segmentation of Vascular Ultrasound Imag.pdf','string'),(396,'name','Daniel Barnes','string'),(396,'username','dbarnes','string'),(397,'fileId','39','int'),(397,'fileStage','10','int'),(397,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(397,'sourceSubmissionFileId','71','int'),(397,'submissionFileId','80','int'),(397,'submissionId','14','int'),(397,'username','dbarnes','string'),(398,'fileId','39','int'),(398,'fileStage','10','int'),(398,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(398,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(398,'sourceSubmissionFileId','71','int'),(398,'submissionFileId','80','int'),(398,'submissionId','14','int'),(398,'username','dbarnes','string'),(399,'fileId','40','int'),(399,'fileStage','10','int'),(399,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(399,'sourceSubmissionFileId','72','int'),(399,'submissionFileId','79','int'),(399,'submissionId','14','int'),(399,'username','dbarnes','string'),(400,'fileId','40','int'),(400,'fileStage','10','int'),(400,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(400,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(400,'sourceSubmissionFileId','72','int'),(400,'submissionFileId','79','int'),(400,'submissionId','14','int'),(400,'username','dbarnes','string'),(401,'file','The Canadian Nutrient File: Nutrient Val.pdf','string'),(401,'name','Daniel Barnes','string'),(401,'username','dbarnes','string'),(402,'fileId','40','int'),(402,'fileStage','10','int'),(402,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(402,'sourceSubmissionFileId','72','int'),(402,'submissionFileId','79','int'),(402,'submissionId','14','int'),(402,'username','dbarnes','string'),(403,'fileId','40','int'),(403,'fileStage','10','int'),(403,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(403,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(403,'sourceSubmissionFileId','72','int'),(403,'submissionFileId','79','int'),(403,'submissionId','14','int'),(403,'username','dbarnes','string'),(406,'fileId','41','int'),(406,'fileStage','2','int'),(406,'originalFileName','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(406,'sourceSubmissionFileId',NULL,'string'),(406,'submissionFileId','85','int'),(406,'submissionId','15','int'),(406,'username','mforan','string'),(407,'fileId','41','int'),(407,'fileStage','2','int'),(407,'name','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(407,'submissionFileId','85','int'),(407,'submissionId','15','int'),(407,'username','mforan','string'),(408,'fileId','41','int'),(408,'fileStage','2','int'),(408,'originalFileName','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(408,'sourceSubmissionFileId',NULL,'string'),(408,'submissionFileId','85','int'),(408,'submissionId','15','int'),(408,'username','mforan','string'),(409,'fileId','41','int'),(409,'fileStage','2','int'),(409,'name','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(409,'originalFileName','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(409,'sourceSubmissionFileId',NULL,'string'),(409,'submissionFileId','85','int'),(409,'submissionId','15','int'),(409,'username','mforan','string'),(412,'decision','23','int'),(412,'editorId','3','int'),(412,'editorName','Daniel Barnes','string'),(412,'submissionId','15','int'),(413,'fileId','41','int'),(413,'fileStage','4','int'),(413,'originalFileName','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(413,'sourceSubmissionFileId','85','int'),(413,'submissionFileId','86','int'),(413,'submissionId','15','int'),(413,'username','dbarnes','string'),(414,'fileId','41','int'),(414,'fileStage','4','int'),(414,'name','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(414,'submissionFileId','86','int'),(414,'submissionId','15','int'),(414,'username','dbarnes','string'),(416,'fileId','42','int'),(416,'fileStage','2','int'),(416,'originalFileName','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(416,'sourceSubmissionFileId',NULL,'string'),(416,'submissionFileId','87','int'),(416,'submissionId','16','int'),(416,'username','mpower','string'),(417,'fileId','42','int'),(417,'fileStage','2','int'),(417,'name','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(417,'submissionFileId','87','int'),(417,'submissionId','16','int'),(417,'username','mpower','string'),(418,'fileId','42','int'),(418,'fileStage','2','int'),(418,'originalFileName','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(418,'sourceSubmissionFileId',NULL,'string'),(418,'submissionFileId','87','int'),(418,'submissionId','16','int'),(418,'username','mpower','string'),(419,'fileId','42','int'),(419,'fileStage','2','int'),(419,'name','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(419,'originalFileName','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(419,'sourceSubmissionFileId',NULL,'string'),(419,'submissionFileId','87','int'),(419,'submissionId','16','int'),(419,'username','mpower','string'),(422,'decision','23','int'),(422,'editorId','3','int'),(422,'editorName','Daniel Barnes','string'),(422,'submissionId','16','int'),(423,'fileId','42','int'),(423,'fileStage','4','int'),(423,'originalFileName','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(423,'sourceSubmissionFileId','87','int'),(423,'submissionFileId','88','int'),(423,'submissionId','16','int'),(423,'username','dbarnes','string'),(424,'fileId','42','int'),(424,'fileStage','4','int'),(424,'name','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(424,'submissionFileId','88','int'),(424,'submissionId','16','int'),(424,'username','dbarnes','string'),(425,'reviewAssignmentId','21','string'),(425,'reviewerName','Adela Gallego','string'),(425,'round','1','int'),(425,'stageId','3','int'),(425,'submissionId','16','int'),(426,'reviewAssignmentId','22','string'),(426,'reviewerName','Al Zacharia','string'),(426,'round','1','int'),(426,'stageId','3','int'),(426,'submissionId','16','int'),(427,'reviewAssignmentId','23','string'),(427,'reviewerName','Gonzalo Favio','string'),(427,'round','1','int'),(427,'stageId','3','int'),(427,'submissionId','16','int'),(428,'reviewAssignmentId','21','int'),(428,'reviewerName','Adela Gallego','string'),(428,'round','1','int'),(428,'submissionId','16','int'),(429,'reviewAssignmentId','21','int'),(429,'reviewerName','Adela Gallego','string'),(429,'round','1','int'),(429,'submissionId','16','int'),(431,'fileId','43','int'),(431,'fileStage','2','int'),(431,'originalFileName','Preface.pdf','string'),(431,'sourceSubmissionFileId',NULL,'string'),(431,'submissionFileId','89','int'),(431,'submissionId','17','int'),(431,'username','msmith','string'),(432,'fileId','43','int'),(432,'fileStage','2','int'),(432,'name','Preface.pdf','string'),(432,'submissionFileId','89','int'),(432,'submissionId','17','int'),(432,'username','msmith','string'),(433,'fileId','43','int'),(433,'fileStage','2','int'),(433,'originalFileName','Preface.pdf','string'),(433,'sourceSubmissionFileId',NULL,'string'),(433,'submissionFileId','89','int'),(433,'submissionId','17','int'),(433,'username','msmith','string'),(434,'fileId','43','int'),(434,'fileStage','2','int'),(434,'name','Preface.pdf','string'),(434,'originalFileName','Preface.pdf','string'),(434,'sourceSubmissionFileId',NULL,'string'),(434,'submissionFileId','89','int'),(434,'submissionId','17','int'),(434,'username','msmith','string'),(435,'fileId','44','int'),(435,'fileStage','2','int'),(435,'originalFileName','Introduction.pdf','string'),(435,'sourceSubmissionFileId',NULL,'string'),(435,'submissionFileId','90','int'),(435,'submissionId','17','int'),(435,'username','msmith','string'),(436,'fileId','44','int'),(436,'fileStage','2','int'),(436,'name','Introduction.pdf','string'),(436,'submissionFileId','90','int'),(436,'submissionId','17','int'),(436,'username','msmith','string'),(437,'fileId','44','int'),(437,'fileStage','2','int'),(437,'originalFileName','Introduction.pdf','string'),(437,'sourceSubmissionFileId',NULL,'string'),(437,'submissionFileId','90','int'),(437,'submissionId','17','int'),(437,'username','msmith','string'),(438,'fileId','44','int'),(438,'fileStage','2','int'),(438,'name','Introduction.pdf','string'),(438,'originalFileName','Introduction.pdf','string'),(438,'sourceSubmissionFileId',NULL,'string'),(438,'submissionFileId','90','int'),(438,'submissionId','17','int'),(438,'username','msmith','string'),(439,'fileId','45','int'),(439,'fileStage','2','int'),(439,'originalFileName','The Emergence of Open Development in a N.pdf','string'),(439,'sourceSubmissionFileId',NULL,'string'),(439,'submissionFileId','91','int'),(439,'submissionId','17','int'),(439,'username','msmith','string'),(440,'fileId','45','int'),(440,'fileStage','2','int'),(440,'name','The Emergence of Open Development in a N.pdf','string'),(440,'submissionFileId','91','int'),(440,'submissionId','17','int'),(440,'username','msmith','string'),(441,'fileId','45','int'),(441,'fileStage','2','int'),(441,'originalFileName','The Emergence of Open Development in a N.pdf','string'),(441,'sourceSubmissionFileId',NULL,'string'),(441,'submissionFileId','91','int'),(441,'submissionId','17','int'),(441,'username','msmith','string'),(442,'fileId','45','int'),(442,'fileStage','2','int'),(442,'name','The Emergence of Open Development in a N.pdf','string'),(442,'originalFileName','The Emergence of Open Development in a N.pdf','string'),(442,'sourceSubmissionFileId',NULL,'string'),(442,'submissionFileId','91','int'),(442,'submissionId','17','int'),(442,'username','msmith','string'),(443,'fileId','46','int'),(443,'fileStage','2','int'),(443,'originalFileName','Enacting Openness in ICT4D Research.pdf','string'),(443,'sourceSubmissionFileId',NULL,'string'),(443,'submissionFileId','92','int'),(443,'submissionId','17','int'),(443,'username','msmith','string'),(444,'fileId','46','int'),(444,'fileStage','2','int'),(444,'name','Enacting Openness in ICT4D Research.pdf','string'),(444,'submissionFileId','92','int'),(444,'submissionId','17','int'),(444,'username','msmith','string'),(445,'fileId','46','int'),(445,'fileStage','2','int'),(445,'originalFileName','Enacting Openness in ICT4D Research.pdf','string'),(445,'sourceSubmissionFileId',NULL,'string'),(445,'submissionFileId','92','int'),(445,'submissionId','17','int'),(445,'username','msmith','string'),(446,'fileId','46','int'),(446,'fileStage','2','int'),(446,'name','Enacting Openness in ICT4D Research.pdf','string'),(446,'originalFileName','Enacting Openness in ICT4D Research.pdf','string'),(446,'sourceSubmissionFileId',NULL,'string'),(446,'submissionFileId','92','int'),(446,'submissionId','17','int'),(446,'username','msmith','string'),(447,'fileId','47','int'),(447,'fileStage','2','int'),(447,'originalFileName','Transparency and Development: Ethical Co.pdf','string'),(447,'sourceSubmissionFileId',NULL,'string'),(447,'submissionFileId','93','int'),(447,'submissionId','17','int'),(447,'username','msmith','string'),(448,'fileId','47','int'),(448,'fileStage','2','int'),(448,'name','Transparency and Development: Ethical Co.pdf','string'),(448,'submissionFileId','93','int'),(448,'submissionId','17','int'),(448,'username','msmith','string'),(449,'fileId','47','int'),(449,'fileStage','2','int'),(449,'originalFileName','Transparency and Development: Ethical Co.pdf','string'),(449,'sourceSubmissionFileId',NULL,'string'),(449,'submissionFileId','93','int'),(449,'submissionId','17','int'),(449,'username','msmith','string'),(450,'fileId','47','int'),(450,'fileStage','2','int'),(450,'name','Transparency and Development: Ethical Co.pdf','string'),(450,'originalFileName','Transparency and Development: Ethical Co.pdf','string'),(450,'sourceSubmissionFileId',NULL,'string'),(450,'submissionFileId','93','int'),(450,'submissionId','17','int'),(450,'username','msmith','string'),(451,'fileId','48','int'),(451,'fileStage','2','int'),(451,'originalFileName','Open Educational Resources: Opportunitie.pdf','string'),(451,'sourceSubmissionFileId',NULL,'string'),(451,'submissionFileId','94','int'),(451,'submissionId','17','int'),(451,'username','msmith','string'),(452,'fileId','48','int'),(452,'fileStage','2','int'),(452,'name','Open Educational Resources: Opportunitie.pdf','string'),(452,'submissionFileId','94','int'),(452,'submissionId','17','int'),(452,'username','msmith','string'),(453,'fileId','48','int'),(453,'fileStage','2','int'),(453,'originalFileName','Open Educational Resources: Opportunitie.pdf','string'),(453,'sourceSubmissionFileId',NULL,'string'),(453,'submissionFileId','94','int'),(453,'submissionId','17','int'),(453,'username','msmith','string'),(454,'fileId','48','int'),(454,'fileStage','2','int'),(454,'name','Open Educational Resources: Opportunitie.pdf','string'),(454,'originalFileName','Open Educational Resources: Opportunitie.pdf','string'),(454,'sourceSubmissionFileId',NULL,'string'),(454,'submissionFileId','94','int'),(454,'submissionId','17','int'),(454,'username','msmith','string'),(457,'decision','1','int'),(457,'editorId','3','int'),(457,'editorName','Daniel Barnes','string'),(457,'submissionId','17','int'),(458,'fileId','48','int'),(458,'fileStage','19','int'),(458,'originalFileName','Open Educational Resources: Opportunitie.pdf','string'),(458,'sourceSubmissionFileId','94','int'),(458,'submissionFileId','95','int'),(458,'submissionId','17','int'),(458,'username','dbarnes','string'),(459,'fileId','48','int'),(459,'fileStage','19','int'),(459,'name','Open Educational Resources: Opportunitie.pdf','string'),(459,'submissionFileId','95','int'),(459,'submissionId','17','int'),(459,'username','dbarnes','string'),(460,'fileId','46','int'),(460,'fileStage','19','int'),(460,'originalFileName','Enacting Openness in ICT4D Research.pdf','string'),(460,'sourceSubmissionFileId','92','int'),(460,'submissionFileId','96','int'),(460,'submissionId','17','int'),(460,'username','dbarnes','string'),(461,'fileId','46','int'),(461,'fileStage','19','int'),(461,'name','Enacting Openness in ICT4D Research.pdf','string'),(461,'submissionFileId','96','int'),(461,'submissionId','17','int'),(461,'username','dbarnes','string'),(462,'fileId','47','int'),(462,'fileStage','19','int'),(462,'originalFileName','Transparency and Development: Ethical Co.pdf','string'),(462,'sourceSubmissionFileId','93','int'),(462,'submissionFileId','97','int'),(462,'submissionId','17','int'),(462,'username','dbarnes','string'),(463,'fileId','47','int'),(463,'fileStage','19','int'),(463,'name','Transparency and Development: Ethical Co.pdf','string'),(463,'submissionFileId','97','int'),(463,'submissionId','17','int'),(463,'username','dbarnes','string'),(464,'fileId','44','int'),(464,'fileStage','19','int'),(464,'originalFileName','Introduction.pdf','string'),(464,'sourceSubmissionFileId','90','int'),(464,'submissionFileId','98','int'),(464,'submissionId','17','int'),(464,'username','dbarnes','string'),(465,'fileId','44','int'),(465,'fileStage','19','int'),(465,'name','Introduction.pdf','string'),(465,'submissionFileId','98','int'),(465,'submissionId','17','int'),(465,'username','dbarnes','string'),(466,'fileId','45','int'),(466,'fileStage','19','int'),(466,'originalFileName','The Emergence of Open Development in a N.pdf','string'),(466,'sourceSubmissionFileId','91','int'),(466,'submissionFileId','99','int'),(466,'submissionId','17','int'),(466,'username','dbarnes','string'),(467,'fileId','45','int'),(467,'fileStage','19','int'),(467,'name','The Emergence of Open Development in a N.pdf','string'),(467,'submissionFileId','99','int'),(467,'submissionId','17','int'),(467,'username','dbarnes','string'),(468,'fileId','43','int'),(468,'fileStage','19','int'),(468,'originalFileName','Preface.pdf','string'),(468,'sourceSubmissionFileId','89','int'),(468,'submissionFileId','100','int'),(468,'submissionId','17','int'),(468,'username','dbarnes','string'),(469,'fileId','43','int'),(469,'fileStage','19','int'),(469,'name','Preface.pdf','string'),(469,'submissionFileId','100','int'),(469,'submissionId','17','int'),(469,'username','dbarnes','string'),(470,'reviewAssignmentId','24','string'),(470,'reviewerName','Julie Janssen','string'),(470,'round','1','int'),(470,'stageId','2','int'),(470,'submissionId','17','int'),(471,'reviewAssignmentId','25','string'),(471,'reviewerName','Paul Hudson','string'),(471,'round','1','int'),(471,'stageId','2','int'),(471,'submissionId','17','int');
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
INSERT INTO `files` VALUES (1,'presses/1/monographs/1/62b233011ed35.pdf','application/pdf'),(2,'presses/1/monographs/2/62b2334681f21.pdf','application/pdf'),(3,'presses/1/monographs/2/62b23346e32f7.pdf','application/pdf'),(4,'presses/1/monographs/2/62b233474ef9b.pdf','application/pdf'),(5,'presses/1/monographs/2/62b23347bb403.pdf','application/pdf'),(6,'presses/1/monographs/3/62b233ebd4942.pdf','application/pdf'),(7,'presses/1/monographs/4/62b2341d8cbf6.pdf','application/pdf'),(8,'presses/1/monographs/4/62b2341de7d90.pdf','application/pdf'),(9,'presses/1/monographs/4/62b2341e6417c.pdf','application/pdf'),(10,'presses/1/monographs/4/62b2341f0295f.pdf','application/pdf'),(11,'presses/1/monographs/5/62b234f4d89f5.pdf','application/pdf'),(12,'presses/1/monographs/6/62b2359a2585c.pdf','application/pdf'),(13,'presses/1/monographs/6/62b2359a8c6c7.pdf','application/pdf'),(14,'presses/1/monographs/6/62b2359b2b830.pdf','application/pdf'),(15,'presses/1/monographs/6/62b2359b9b14d.pdf','application/pdf'),(16,'presses/1/monographs/7/62b23625b6a0d.pdf','application/pdf'),(17,'presses/1/monographs/7/62b236262672d.pdf','application/pdf'),(18,'presses/1/monographs/7/62b236268850a.pdf','application/pdf'),(19,'presses/1/monographs/7/62b23627311c2.pdf','application/pdf'),(20,'presses/1/monographs/7/62b23627a9bec.pdf','application/pdf'),(21,'presses/1/monographs/8/62b236d61ea91.pdf','application/pdf'),(22,'presses/1/monographs/9/62b236e492565.pdf','application/pdf'),(23,'presses/1/monographs/9/62b236e501616.pdf','application/pdf'),(24,'presses/1/monographs/9/62b236e5624f4.pdf','application/pdf'),(25,'presses/1/monographs/9/62b236e60485b.pdf','application/pdf'),(26,'presses/1/monographs/9/62b236e67b6c6.pdf','application/pdf'),(27,'presses/1/monographs/10/62b23769b6ee3.pdf','application/pdf'),(28,'presses/1/monographs/11/62b237afc0800.pdf','application/pdf'),(29,'presses/1/monographs/12/62b23829db686.pdf','application/pdf'),(30,'presses/1/monographs/12/62b2382a4e87a.pdf','application/pdf'),(31,'presses/1/monographs/12/62b2382abd186.pdf','application/pdf'),(32,'presses/1/monographs/13/62b238d0a212c.pdf','application/pdf'),(33,'presses/1/monographs/13/62b238d113a4c.pdf','application/pdf'),(34,'presses/1/monographs/13/62b238d17dc95.pdf','application/pdf'),(35,'presses/1/monographs/14/62b239955c462.pdf','application/pdf'),(36,'presses/1/monographs/14/62b23995bcba5.pdf','application/pdf'),(37,'presses/1/monographs/14/62b2399628f18.pdf','application/pdf'),(38,'presses/1/monographs/14/62b23996b9a47.pdf','application/pdf'),(39,'presses/1/monographs/14/62b23997498c4.pdf','application/pdf'),(40,'presses/1/monographs/14/62b239982aa35.pdf','application/pdf'),(41,'presses/1/monographs/15/62b23aa07b442.pdf','application/pdf'),(42,'presses/1/monographs/16/62b23ad36fe7f.pdf','application/pdf'),(43,'presses/1/monographs/17/62b23b348e5bd.pdf','application/pdf'),(44,'presses/1/monographs/17/62b23b3505000.pdf','application/pdf'),(45,'presses/1/monographs/17/62b23b358d12a.pdf','application/pdf'),(46,'presses/1/monographs/17/62b23b3612ecc.pdf','application/pdf'),(47,'presses/1/monographs/17/62b23b36835ee.pdf','application/pdf'),(48,'presses/1/monographs/17/62b23b370549d.pdf','application/pdf');
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
INSERT INTO `filter_groups` VALUES (1,'publicationFormat=>dc11','plugins.metadata.dc11.publicationFormatAdapter.displayName','plugins.metadata.dc11.publicationFormatAdapter.description','class::classes.publicationFormat.PublicationFormat','metadata::plugins.metadata.dc11.schema.Dc11Schema(PUBLICATION_FORMAT)'),(2,'monograph=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),(3,'native-xml=>monograph','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),(4,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.author.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),(5,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.author.Author[]'),(6,'publication-format=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publicationFormat.PublicationFormat','xml::schema(plugins/importexport/native/native.xsd)'),(7,'native-xml=>PublicationFormat','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publicationFormat.PublicationFormat[]'),(8,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submissionFile.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),(9,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submissionFile.SubmissionFile[]'),(10,'monograph=>onix30-xml','plugins.importexport.onix30.displayName','plugins.importexport.onix30.description','class::classes.submission.Submission','xml::schema(plugins/importexport/native/ONIX_BookProduct_3.0_reference_notstrict.xsd)'),(11,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),(12,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication[]'),(13,'chapter=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.monograph.Chapter[]','xml::schema(plugins/importexport/native/native.xsd)'),(14,'native-xml=>chapter','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.monograph.Chapter[]'),(15,'monographs=>onix30-xml','plugins.importexport.onix30.displayName','plugins.importexport.onix30.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/onix30/ONIX_BookProduct_3.0_reference.xsd)'),(16,'user=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.user.User[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(17,'user-xml=>user','plugins.importexport.users.displayName','plugins.importexport.users.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::classes.users.User[]'),(18,'usergroup=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.security.UserGroup[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(19,'user-xml=>usergroup','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::lib.pkp.classes.security.UserGroup[]');
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
  CONSTRAINT `genre_settings_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_settings`
--

LOCK TABLES `genre_settings` WRITE;
/*!40000 ALTER TABLE `genre_settings` DISABLE KEYS */;
INSERT INTO `genre_settings` VALUES (1,'en_US','name','Appendix','string'),(1,'fr_CA','name','Annexe','string'),(2,'en_US','name','Bibliography','string'),(2,'fr_CA','name','Bibliographie','string'),(3,'en_US','name','Book Manuscript','string'),(3,'fr_CA','name','Manuscrit de livre','string'),(4,'en_US','name','Chapter Manuscript','string'),(4,'fr_CA','name','Manuscrit de chapitre','string'),(5,'en_US','name','Glossary','string'),(5,'fr_CA','name','Glossaire','string'),(6,'en_US','name','Index','string'),(6,'fr_CA','name','Index','string'),(7,'en_US','name','Preface','string'),(7,'fr_CA','name','Pr??face','string'),(8,'en_US','name','Prospectus','string'),(8,'fr_CA','name','Prospectus','string'),(9,'en_US','name','Table','string'),(9,'fr_CA','name','Tableau','string'),(10,'en_US','name','Figure','string'),(10,'fr_CA','name','Figure','string'),(11,'en_US','name','Photo','string'),(11,'fr_CA','name','Photographie','string'),(12,'en_US','name','Illustration','string'),(12,'fr_CA','name','Illustration','string'),(13,'en_US','name','Other','string'),(13,'fr_CA','name','Autre','string'),(14,'en_US','name','Image','string'),(14,'fr_CA','name','Image','string'),(15,'en_US','name','HTML Stylesheet','string'),(15,'fr_CA','name','Feuille de style HTML','string');
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
  KEY `genres_context_id_foreign` (`context_id`),
  CONSTRAINT `genres_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`)
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
  UNIQUE KEY `item_views_pkey` (`assoc_type`,`assoc_id`,`user_id`),
  KEY `item_views_user_id_foreign` (`user_id`),
  CONSTRAINT `item_views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
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
-- Table structure for table `mailable_templates`
--

DROP TABLE IF EXISTS `mailable_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailable_templates` (
  `email_id` bigint(20) NOT NULL,
  `mailable_id` varchar(255) NOT NULL,
  PRIMARY KEY (`email_id`,`mailable_id`),
  CONSTRAINT `mailable_templates_email_id_foreign` FOREIGN KEY (`email_id`) REFERENCES `email_templates` (`email_id`)
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
INSERT INTO `notes` VALUES (1,1048586,1,6,'2022-06-21 21:20:06','2022-06-21 21:20:06','Editor Recommendation','<p>Dear Daniel Barnes,</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission The Information Literacy User???s Guide.</p><p>My recommendation is:<br />Accept Submission.</p><p>Please visit the submission\'s <a href=\"http://localhost/index.php/publicknowledge/workflow/index/6/2\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>Minoti Inoue</p>');
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
) ENGINE=InnoDB AUTO_INCREMENT=381 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (11,1,3,2,16777217,'2022-06-21 21:07:30',NULL,1048585,1),(13,1,0,2,16777243,'2022-06-21 21:07:30',NULL,1048585,1),(14,1,0,2,16777245,'2022-06-21 21:07:30',NULL,1048585,1),(16,1,0,2,16777236,'2022-06-21 21:07:42','2022-06-21 21:07:47',523,1),(17,1,12,3,16777227,'2022-06-21 21:07:53',NULL,517,1),(19,1,19,2,16777230,'2022-06-21 21:08:00',NULL,1048585,1),(20,1,3,2,16777251,'2022-06-21 21:08:00','2022-06-21 21:08:04',1048585,1),(37,1,3,2,16777217,'2022-06-21 21:10:10',NULL,1048585,2),(39,1,0,2,16777243,'2022-06-21 21:10:10',NULL,1048585,2),(40,1,0,2,16777245,'2022-06-21 21:10:10',NULL,1048585,2),(43,1,0,2,16777236,'2022-06-21 21:10:29','2022-06-21 21:10:36',523,2),(44,1,11,3,16777227,'2022-06-21 21:10:44',NULL,517,2),(46,1,12,3,16777227,'2022-06-21 21:10:54',NULL,517,3),(53,1,3,2,16777217,'2022-06-21 21:11:45',NULL,1048585,3),(55,1,0,2,16777243,'2022-06-21 21:11:45',NULL,1048585,3),(56,1,0,2,16777245,'2022-06-21 21:11:45',NULL,1048585,3),(69,1,3,2,16777217,'2022-06-21 21:13:14',NULL,1048585,4),(71,1,0,2,16777243,'2022-06-21 21:13:14',NULL,1048585,4),(72,1,0,2,16777245,'2022-06-21 21:13:14','2022-06-21 21:14:43',1048585,4),(75,1,0,2,16777236,'2022-06-21 21:13:31','2022-06-21 21:13:37',523,3),(77,1,9,3,16777227,'2022-06-21 21:13:44',NULL,517,4),(79,1,0,2,16777236,'2022-06-21 21:13:51','2022-06-21 21:13:58',523,4),(81,1,11,3,16777227,'2022-06-21 21:14:05',NULL,517,5),(86,1,22,2,16777235,'2022-06-21 21:14:35',NULL,1048585,4),(87,1,3,2,16777254,'2022-06-21 21:14:35',NULL,1048585,4),(95,1,3,2,16777217,'2022-06-21 21:16:09',NULL,1048585,5),(100,1,0,2,16777236,'2022-06-21 21:16:24','2022-06-21 21:16:29',523,5),(102,1,8,3,16777227,'2022-06-21 21:16:35',NULL,517,6),(104,1,0,2,16777236,'2022-06-21 21:16:41','2022-06-21 21:16:46',523,6),(106,1,12,3,16777227,'2022-06-21 21:16:53',NULL,517,7),(111,1,23,2,16777235,'2022-06-21 21:17:19',NULL,1048585,5),(112,1,3,2,16777254,'2022-06-21 21:17:19',NULL,1048585,5),(115,1,0,2,16777246,'2022-06-21 21:18:04',NULL,1048585,5),(127,1,3,2,16777217,'2022-06-21 21:19:18',NULL,1048585,6),(129,1,0,2,16777243,'2022-06-21 21:19:18',NULL,1048585,6),(130,1,0,2,16777245,'2022-06-21 21:19:18',NULL,1048585,6),(133,1,0,2,16777236,'2022-06-21 21:19:36','2022-06-21 21:19:43',523,7),(134,1,24,2,16777229,'2022-06-21 21:19:36',NULL,1048585,6),(136,1,3,3,16777249,'2022-06-21 21:20:06',NULL,1048586,1),(152,1,3,2,16777217,'2022-06-21 21:22:26',NULL,1048585,7),(154,1,0,2,16777243,'2022-06-21 21:22:26',NULL,1048585,7),(155,1,0,2,16777245,'2022-06-21 21:22:26',NULL,1048585,7),(158,1,0,2,16777236,'2022-06-21 21:22:45','2022-06-21 21:22:51',523,8),(159,1,10,3,16777227,'2022-06-21 21:22:59',NULL,517,8),(161,1,25,2,16777230,'2022-06-21 21:23:08',NULL,1048585,7),(162,1,3,2,16777251,'2022-06-21 21:23:08','2022-06-21 21:23:14',1048585,7),(164,1,3,2,16777217,'2022-06-21 21:23:36',NULL,1048585,8),(166,1,0,2,16777243,'2022-06-21 21:23:36',NULL,1048585,8),(167,1,0,2,16777245,'2022-06-21 21:23:36',NULL,1048585,8),(183,1,3,2,16777217,'2022-06-21 21:25:24',NULL,1048585,9),(185,1,0,2,16777243,'2022-06-21 21:25:24',NULL,1048585,9),(186,1,0,2,16777245,'2022-06-21 21:25:24',NULL,1048585,9),(189,1,0,2,16777236,'2022-06-21 21:25:44',NULL,523,9),(190,1,26,2,16777229,'2022-06-21 21:25:44',NULL,1048585,9),(200,1,3,2,16777217,'2022-06-21 21:26:59',NULL,1048585,10),(202,1,0,2,16777243,'2022-06-21 21:26:59',NULL,1048585,10),(203,1,0,2,16777245,'2022-06-21 21:26:59',NULL,1048585,10),(207,1,3,2,16777217,'2022-06-21 21:27:22',NULL,1048585,11),(209,1,0,2,16777243,'2022-06-21 21:27:22',NULL,1048585,11),(210,1,0,2,16777245,'2022-06-21 21:27:22',NULL,1048585,11),(212,1,0,2,16777236,'2022-06-21 21:27:35','2022-06-21 21:27:39',523,10),(214,1,9,3,16777227,'2022-06-21 21:27:45',NULL,517,9),(216,1,0,2,16777236,'2022-06-21 21:27:50','2022-06-21 21:27:55',523,11),(222,1,3,2,16777219,'2022-06-21 21:28:23',NULL,517,10),(224,1,3,2,16777219,'2022-06-21 21:28:35',NULL,517,11),(226,1,28,2,16777230,'2022-06-21 21:28:55',NULL,1048585,11),(227,1,3,2,16777251,'2022-06-21 21:28:55','2022-06-21 21:29:02',1048585,11),(241,1,3,2,16777217,'2022-06-21 21:30:38',NULL,1048585,12),(243,1,0,2,16777243,'2022-06-21 21:30:38',NULL,1048585,12),(244,1,0,2,16777245,'2022-06-21 21:30:38',NULL,1048585,12),(247,1,0,2,16777236,'2022-06-21 21:30:57','2022-06-21 21:31:04',523,12),(248,1,29,2,16777229,'2022-06-21 21:30:57',NULL,1048585,12),(249,1,7,3,16777227,'2022-06-21 21:31:11',NULL,517,12),(253,1,9,3,16777227,'2022-06-21 21:31:30',NULL,517,14),(255,1,3,2,16777219,'2022-06-21 21:31:46',NULL,517,13),(266,1,3,2,16777217,'2022-06-21 21:32:54',NULL,1048585,13),(268,1,0,2,16777243,'2022-06-21 21:32:54',NULL,1048585,13),(269,1,0,2,16777245,'2022-06-21 21:32:54',NULL,1048585,13),(272,1,0,2,16777236,'2022-06-21 21:33:11','2022-06-21 21:33:16',523,13),(274,1,8,3,16777227,'2022-06-21 21:33:23',NULL,517,15),(276,1,0,2,16777236,'2022-06-21 21:33:29','2022-06-21 21:33:35',523,14),(280,1,11,3,16777227,'2022-06-21 21:33:52',NULL,517,17),(284,1,3,2,16777219,'2022-06-21 21:34:17',NULL,517,16),(286,1,3,2,16777219,'2022-06-21 21:34:33',NULL,517,18),(288,1,30,2,16777230,'2022-06-21 21:34:57',NULL,1048585,13),(289,1,3,2,16777251,'2022-06-21 21:34:58','2022-06-21 21:35:05',1048585,13),(300,1,3,2,16777217,'2022-06-21 21:36:21',NULL,1048585,14),(306,1,0,2,16777236,'2022-06-21 21:36:40','2022-06-21 21:36:47',523,15),(308,1,7,3,16777227,'2022-06-21 21:36:54',NULL,517,19),(310,1,0,2,16777236,'2022-06-21 21:37:02','2022-06-21 21:37:08',523,16),(312,1,11,3,16777227,'2022-06-21 21:37:15',NULL,517,20),(317,1,31,2,16777235,'2022-06-21 21:37:45',NULL,1048585,14),(318,1,3,2,16777254,'2022-06-21 21:37:45',NULL,1048585,14),(321,1,0,2,16777246,'2022-06-21 21:39:28',NULL,1048585,14),(325,1,3,2,16777217,'2022-06-21 21:40:04',NULL,1048585,15),(327,1,0,2,16777243,'2022-06-21 21:40:04',NULL,1048585,15),(328,1,0,2,16777245,'2022-06-21 21:40:04',NULL,1048585,15),(330,1,0,2,16777236,'2022-06-21 21:40:20','2022-06-21 21:40:24',523,17),(336,1,3,2,16777217,'2022-06-21 21:41:02',NULL,1048585,16),(338,1,0,2,16777243,'2022-06-21 21:41:02',NULL,1048585,16),(339,1,0,2,16777245,'2022-06-21 21:41:02',NULL,1048585,16),(341,1,0,2,16777236,'2022-06-21 21:41:17','2022-06-21 21:41:23',523,18),(344,1,11,3,16777227,'2022-06-21 21:41:36',NULL,517,22),(346,1,12,3,16777227,'2022-06-21 21:41:45',NULL,517,23),(348,1,3,2,16777219,'2022-06-21 21:41:59',NULL,517,21),(369,1,3,2,16777217,'2022-06-21 21:44:36',NULL,1048585,17),(371,1,0,2,16777243,'2022-06-21 21:44:36',NULL,1048585,17),(372,1,0,2,16777245,'2022-06-21 21:44:36',NULL,1048585,17),(375,1,0,2,16777236,'2022-06-21 21:45:01','2022-06-21 21:45:10',523,19),(376,1,34,2,16777229,'2022-06-21 21:45:01',NULL,1048585,17),(377,1,7,3,16777227,'2022-06-21 21:45:19',NULL,517,24),(379,1,8,3,16777227,'2022-06-21 21:45:30',NULL,517,25);
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
INSERT INTO `plugin_settings` VALUES ('acronplugin',0,'crontab','[{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"lib.pkp.classes.task.ReviewReminder\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.PublishSubmissions\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"lib.pkp.classes.task.RemoveUnvalidatedExpiredUsers\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]','object'),('acronplugin',0,'enabled','1','bool'),('browseblockplugin',1,'browseCategories','1','bool'),('browseblockplugin',1,'browseNewReleases','1','bool'),('browseblockplugin',1,'browseSeries','1','bool'),('browseblockplugin',1,'context','1','int'),('browseblockplugin',1,'enabled','1','bool'),('browseblockplugin',1,'seq','1','int'),('defaultthemeplugin',0,'enabled','1','bool'),('defaultthemeplugin',1,'enabled','1','bool'),('defaultthemeplugin',1,'showCatalogSeriesListing','false','string'),('defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),('developedbyblockplugin',0,'context','1','int'),('developedbyblockplugin',0,'enabled','0','bool'),('developedbyblockplugin',0,'seq','0','int'),('developedbyblockplugin',1,'context','1','int'),('developedbyblockplugin',1,'enabled','0','bool'),('developedbyblockplugin',1,'seq','0','int'),('dublincoremetaplugin',1,'enabled','1','bool'),('googlescholarplugin',1,'enabled','1','bool'),('htmlmonographfileplugin',1,'enabled','1','bool'),('informationblockplugin',1,'context','1','int'),('informationblockplugin',1,'enabled','1','bool'),('informationblockplugin',1,'seq','7','int'),('languagetoggleblockplugin',0,'context','1','int'),('languagetoggleblockplugin',0,'enabled','1','bool'),('languagetoggleblockplugin',0,'seq','4','int'),('languagetoggleblockplugin',1,'context','1','int'),('languagetoggleblockplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',1,'seq','4','int'),('pdfjsviewerplugin',1,'enabled','1','bool'),('tinymceplugin',0,'enabled','1','bool'),('tinymceplugin',1,'enabled','1','bool'),('usageeventplugin',0,'enabled','1','bool'),('usageeventplugin',0,'uniqueSiteId','62b2313763e86','string'),('usagestatsplugin',0,'accessLogFileParseRegex','/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/','string'),('usagestatsplugin',0,'chartType','bar','string'),('usagestatsplugin',0,'createLogFiles','1','bool'),('usagestatsplugin',0,'datasetMaxCount','4','string'),('usagestatsplugin',0,'enabled','1','bool'),('usagestatsplugin',0,'optionalColumns','[\"city\",\"region\"]','object'),('webfeedplugin',1,'displayItems','1','bool'),('webfeedplugin',1,'displayPage','homepage','string'),('webfeedplugin',1,'enabled','1','bool');
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
INSERT INTO `press_settings` VALUES (1,'','contactEmail','rvaca@mailinator.com',NULL),(1,'','contactName','Ramiro Vaca',NULL),(1,'','country','IS',NULL),(1,'','coverThumbnailsMaxHeight','100',NULL),(1,'','coverThumbnailsMaxWidth','106',NULL),(1,'','defaultReviewMode','2',NULL),(1,'','disableSubmissions','0',NULL),(1,'','doiCreationTime','copyEditCreationTime',NULL),(1,'','doiSuffixType','default',NULL),(1,'','emailSignature','<br/><hr /><br/><p><a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Press</a></p><p>{$mailingAddress}</p><p>{$contactName}, <a href=\"mailto: {$contactEmail}\">{$contactEmail}</a></p>',NULL),(1,'','enableDois','1',NULL),(1,'','itemsPerPage','25',NULL),(1,'','keywords','request',NULL),(1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada',NULL),(1,'','notifyAllAuthors','1',NULL),(1,'','numPageLinks','10',NULL),(1,'','numWeeksPerResponse','4',NULL),(1,'','numWeeksPerReview','4',NULL),(1,'','paymentPluginName','ManualPayment',NULL),(1,'','registrationAgency','',NULL),(1,'','supportedFormLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedSubmissionLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportEmail','rvaca@mailinator.com',NULL),(1,'','supportName','Ramiro Vaca',NULL),(1,'','themePluginPath','default',NULL),(1,'','type','enable',NULL),(1,'en_US','acronym','JPK',NULL),(1,'en_US','authorInformation','Interested in submitting to this press? We recommend that you review the <a href=\"http://localhost/index.php/publicknowledge/about\">About the Press</a> page for the press\' section policies and <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.php/publicknowledge/user/register\">register</a> with the press prior to submitting, or if already registered can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the 5 step process.',NULL),(1,'en_US','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">',NULL),(1,'en_US','librarianInformation','We encourage research librarians to list this press among their library\'s electronic press holdings. As well, this open source publishing system is suitable for libraries to host for their faculty members to use with presses they are involved in editing (see <a href=\"http://pkp.sfu.ca/omp\">Open Monograph Press</a>).',NULL),(1,'en_US','name','Public Knowledge Press',NULL),(1,'en_US','openAccessPolicy','This press provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),(1,'en_US','privacyStatement','<p>The names and email addresses entered in this press site will be used exclusively for the stated purposes of this press and will not be made available for any other purpose or to any other party.</p>',NULL),(1,'en_US','readerInformation','We encourage readers to sign up for the publishing notification service for this press. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the homepage for the press. This registration will result in the reader receiving the Table of Contents by email for each new monograph of the press. This list also allows the press to claim a certain level of support or readership. See the press <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a> which assures readers that their name and email address will not be used for other purposes.',NULL),(1,'en_US','searchDescription','Public Knowledge Press is a publisher dedicated to the subject of public access to science.',NULL),(1,'en_US','submissionChecklist','[{\"order\":1,\"content\":\"The submission has not been previously published, nor is it before another press for consideration (or an explanation has been provided in Comments to the Editor).\"},{\"order\":2,\"content\":\"The submission file is in the Microsoft Word, RTF, or OpenDocument file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":4,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the <a href=\\\"http:\\/\\/localhost\\/index.php\\/publicknowledge\\/about\\/submissions#authorGuidelines\\\" target=\\\"_blank\\\">Author Guidelines<\\/a>, which is found in About the Press.\"}]',NULL),(1,'fr_CA','authorInformation','Vous souhaitez soumettre une contribution ?? cette presse???? Nous vous recommandons de lire la page\n <a href=\"http://localhost/index.php/publicknowledge/about\">?? propos de cette presse</a> pour connaitre ses r??glements et la page\n <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Lignes directrices ?? l\'intention des auteurs-es</a>. Les auteurs-es doivent <a href=\"http://localhost/index.php/publicknowledge/user/register\">s\'inscrire</a> aupr??s de la presse avant d\'envoyer une soumission. Si vous ??tes d??j?? inscrit-e, il suffit simplement <a href=\"http://localhost/index.php/index/login\">d\'ouvrir une session</a> pour d??buter la proc??dure en 5 ??tapes.',NULL),(1,'fr_CA','librarianInformation','Nous encourageons les biblioth??caires de recherche ?? ajouter cette presse ?? la liste ??lectronique des ressources documentaires de la biblioth??que. De plus, ce syst??me d\'??dition ?? libre acc??s convient ?? toutes les biblioth??ques et permet aux membres des facult??s de l\'utiliser pour les presses auxquelles ils contribuent ?? titre de r??dacteur en chef. (voir <a href=\"http://pkp.sfu.ca/omp\">Open Monograph Press</a>).',NULL),(1,'fr_CA','name','Press de la connaissance du public',NULL),(1,'fr_CA','openAccessPolicy','Cette presse offre un acc??s libre imm??diat ?? son contenu en partant du principe que la recherche doit ??tre accessible au grand public, car cela favorise un meilleur ??change des connaissances ?? l\'??chelle mondiale.',NULL),(1,'fr_CA','privacyStatement','<p>Les noms et adresses courriel saisis sur ce site de presse seront utilis??s exclusivement pour les fins convenues de cette presse. Ils ne seront pas utilis??s pour d\'autres fins ou transmis ?? une tierce partie.</p>',NULL),(1,'fr_CA','readerInformation','Nous encourageons les lecteurs ?? s\'abonner au service d\'avis de publication de cette presse. Utilisez le lien <a href=\"http://localhost/index.php/publicknowledge/user/register\">d\'inscription</a> situ?? en haut de la page d\'accueil de la presse. Cette inscription permettra au lecteur de recevoir la table des mati??res de chaque nouvelle monographie de cette presse par courriel. Cette liste permet ??galement ?? la presse d\'affirmer qu\'elle compte un certain nombre de lecteurs. Consultez <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">l\'??nonc?? de confidentialit?? </a> de la presse, lequel stipule que les noms et adresses courriel de ses lecteurs ne seront pas utilis??s ?? d\'autres fins.',NULL),(1,'fr_CA','submissionChecklist','[{\"order\":1,\"content\":\"Cette soumission n\'a jamais ??t?? publi??e et n\'a pas ??t?? soumise ?? une autre presse (ou une explication a ??t?? ajout??e ?? la section Commentaires du r??dacteur en chef).\"},{\"order\":2,\"content\":\"Le fichier soumis est de format Microsoft Word, RTF ou OpenDocument.\"},{\"order\":3,\"content\":\"Les adresses URL des r??f??rences ont ??t?? fournies si elles ??taient disponibles.\"},{\"order\":4,\"content\":\"Le texte est publi?? ?? simple interligne???; utiliser une police de caract??res de 12 points???; utiliser des caract??res italiques au lieu de souligner (sauf pour les adresses URL)???; et toutes les illustrations, figures et tableaux doivent ??tre ins??r??s dans le texte aux endroits appropri??s plut??t qu\'?? la fin.\"},{\"order\":5,\"content\":\"Le texte respecte les exigences stylistiques et bibliographiques conform??ment aux <a href=\\\"http:\\/\\/localhost\\/index.php\\/publicknowledge\\/about\\/submissions#authorGuidelines\\\" target=\\\"_blank\\\">lignes directrices ?? l\'intention des auteurs<\\/a>, disponibles dans la rubrique ?? propos de cette presse.\"}]',NULL);
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
INSERT INTO `publication_settings` VALUES (1,'','categoryIds','[]'),(1,'en_US','abstract','<p>The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities???and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.</p>'),(1,'en_US','prefix',''),(1,'en_US','subtitle',''),(1,'en_US','title','The ABCs of Human Survival: A Paradigm for Global Citizenship'),(1,'fr_CA','abstract',''),(1,'fr_CA','prefix',''),(1,'fr_CA','subtitle',''),(1,'fr_CA','title',''),(2,'','categoryIds','[]'),(2,'en_US','abstract','<p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p>'),(2,'en_US','prefix',''),(2,'en_US','subtitle',''),(2,'en_US','title','The West and Beyond: New Perspectives on an Imagined Region'),(2,'fr_CA','abstract',''),(2,'fr_CA','prefix',''),(2,'fr_CA','subtitle',''),(2,'fr_CA','title',''),(3,'','categoryIds','[]'),(3,'en_US','abstract','<p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.</p>'),(3,'en_US','prefix',''),(3,'en_US','subtitle',''),(3,'en_US','title','The Political Economy of Workplace Injury in Canada'),(3,'fr_CA','abstract',''),(3,'fr_CA','prefix',''),(3,'fr_CA','subtitle',''),(3,'fr_CA','title',''),(4,'','categoryIds','[]'),(4,'en_US','abstract','<p>What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.</p>'),(4,'en_US','prefix',''),(4,'en_US','subtitle',''),(4,'en_US','title','How Canadians Communicate: Contexts of Canadian Popular Culture'),(4,'fr_CA','abstract',''),(4,'fr_CA','prefix',''),(4,'fr_CA','subtitle',''),(4,'fr_CA','title',''),(5,'','categoryIds','[]'),(5,'','copyrightYear','2022'),(5,'en_US','abstract','<p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama???s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.</p>'),(5,'en_US','copyrightHolder','Public Knowledge Press'),(5,'en_US','prefix',''),(5,'en_US','subtitle',''),(5,'en_US','title','Bomb Canada and Other Unkind Remarks in the American Media'),(5,'fr_CA','abstract',''),(5,'fr_CA','copyrightHolder','Press de la connaissance du public'),(5,'fr_CA','prefix',''),(5,'fr_CA','subtitle',''),(5,'fr_CA','title',''),(6,'','categoryIds','[]'),(6,'en_US','abstract','<p>Good researchers have a host of tools at their disposal that make navigating today???s complex information ecosystem much more manageable. Gaining the knowledge, abilities, and self-reflection necessary to be a good researcher helps not only in academic settings, but is invaluable in any career, and throughout one???s life. The Information Literacy User???s Guide will start you on this route to success.</p>'),(6,'en_US','prefix',''),(6,'en_US','subtitle',''),(6,'en_US','title','The Information Literacy User???s Guide'),(6,'fr_CA','abstract',''),(6,'fr_CA','prefix',''),(6,'fr_CA','subtitle',''),(6,'fr_CA','title',''),(7,'','categoryIds','[]'),(7,'en_US','abstract','<p>Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.</p>'),(7,'en_US','prefix',''),(7,'en_US','subtitle',''),(7,'en_US','title','Accessible Elements: Teaching Science Online and at a Distance'),(7,'fr_CA','abstract',''),(7,'fr_CA','prefix',''),(7,'fr_CA','subtitle',''),(7,'fr_CA','title',''),(8,'','categoryIds','[]'),(8,'en_US','abstract','<p>A Note From The Publisher</p>'),(8,'en_US','prefix',''),(8,'en_US','subtitle',''),(8,'en_US','title','Editorial'),(8,'fr_CA','abstract',''),(8,'fr_CA','prefix',''),(8,'fr_CA','subtitle',''),(8,'fr_CA','title',''),(9,'','categoryIds','[]'),(9,'en_US','abstract','<p>In recent years, the Internet and other network technologies have emerged as a central issue for development in Latin America and the Caribbean. They have shown their potential to increase productivity and economic competitiveness, to create new ways to deliver education and health services, and to be driving forces for the modernization of the provision of public services.</p>'),(9,'en_US','prefix',''),(9,'en_US','subtitle',''),(9,'en_US','title','Enabling Openness: The future of the information society in Latin America and the Caribbean'),(9,'fr_CA','abstract',''),(9,'fr_CA','prefix',''),(9,'fr_CA','subtitle',''),(9,'fr_CA','title',''),(10,'','categoryIds','[]'),(10,'en_US','abstract','<p>While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.</p>'),(10,'en_US','prefix',''),(10,'en_US','subtitle',''),(10,'en_US','title','Lost Tracks: Buffalo National Park, 1909-1939'),(10,'fr_CA','abstract',''),(10,'fr_CA','prefix',''),(10,'fr_CA','subtitle',''),(10,'fr_CA','title',''),(11,'','categoryIds','[]'),(11,'en_US','abstract','<p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker???s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.</p>'),(11,'en_US','prefix',''),(11,'en_US','subtitle',''),(11,'en_US','title','Dreamwork'),(11,'fr_CA','abstract',''),(11,'fr_CA','prefix',''),(11,'fr_CA','subtitle',''),(11,'fr_CA','title',''),(12,'','categoryIds','[]'),(12,'en_US','abstract','<p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC???s work and research in this area.</p>'),(12,'en_US','prefix',''),(12,'en_US','subtitle',''),(12,'en_US','title','Connecting ICTs to Development'),(12,'fr_CA','abstract',''),(12,'fr_CA','prefix',''),(12,'fr_CA','subtitle',''),(12,'fr_CA','title',''),(13,'','categoryIds','[]'),(13,'en_US','abstract','<p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.</p>'),(13,'en_US','prefix',''),(13,'en_US','subtitle',''),(13,'en_US','title','Mobile Learning: Transforming the Delivery of Education and Training'),(13,'fr_CA','abstract',''),(13,'fr_CA','prefix',''),(13,'fr_CA','subtitle',''),(13,'fr_CA','title',''),(14,'','categoryIds','[]'),(14,'','copyrightYear','2022'),(14,'en_US','abstract','<p>From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent???s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.</p>'),(14,'en_US','copyrightHolder','Public Knowledge Press'),(14,'en_US','prefix',''),(14,'en_US','subtitle',''),(14,'en_US','title','From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots'),(14,'fr_CA','abstract',''),(14,'fr_CA','copyrightHolder','Press de la connaissance du public'),(14,'fr_CA','prefix',''),(14,'fr_CA','subtitle',''),(14,'fr_CA','title',''),(15,'','categoryIds','[]'),(15,'en_US','abstract','<p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.</p>'),(15,'en_US','prefix',''),(15,'en_US','subtitle',''),(15,'en_US','title','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978'),(15,'fr_CA','abstract',''),(15,'fr_CA','prefix',''),(15,'fr_CA','subtitle',''),(15,'fr_CA','title',''),(16,'','categoryIds','[]'),(16,'en_US','abstract','<p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer???s log a unique contribution to the fi eld of online learning.</p>'),(16,'en_US','prefix',''),(16,'en_US','subtitle',''),(16,'en_US','title','A Designer\'s Log: Case Studies in Instructional Design'),(16,'fr_CA','abstract',''),(16,'fr_CA','prefix',''),(16,'fr_CA','subtitle',''),(16,'fr_CA','title',''),(17,'','categoryIds','[]'),(17,'en_US','abstract','<p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people???s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.</p>'),(17,'en_US','prefix',''),(17,'en_US','subtitle',''),(17,'en_US','title','Open Development: Networked Innovations in International Development'),(17,'fr_CA','abstract',''),(17,'fr_CA','prefix',''),(17,'fr_CA','subtitle',''),(17,'fr_CA','title','');
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
INSERT INTO `publications` VALUES (1,NULL,'2022-06-21 21:07:29',1,'pub','publication',0.00,NULL,NULL,1,1,NULL,1,NULL),(2,NULL,'2022-06-21 21:10:07',2,'pub','publication',0.00,NULL,NULL,2,1,NULL,1,NULL),(3,NULL,'2022-06-21 21:11:43',10,'pub','publication',0.00,NULL,NULL,3,1,NULL,1,NULL),(4,NULL,'2022-06-21 21:13:12',11,'pub','publication',0.00,NULL,NULL,4,1,NULL,1,NULL),(5,'2022-06-21','2022-06-21 21:18:04',15,'pub','publication',0.00,NULL,NULL,5,3,NULL,1,NULL),(6,NULL,'2022-06-21 21:19:16',16,'pub','publication',0.00,NULL,NULL,6,1,NULL,1,NULL),(7,NULL,'2022-06-21 21:22:24',20,'pub','publication',0.00,NULL,NULL,7,1,NULL,1,NULL),(8,NULL,'2022-06-21 21:23:36',25,'pub','publication',0.00,NULL,NULL,8,1,NULL,1,NULL),(9,NULL,'2022-06-21 21:25:22',26,'pub','publication',0.00,NULL,NULL,9,1,NULL,1,NULL),(10,NULL,'2022-06-21 21:26:58',31,'pub','publication',0.00,NULL,NULL,10,1,NULL,1,NULL),(11,NULL,'2022-06-21 21:27:21',32,'pub','publication',0.00,NULL,NULL,11,1,NULL,1,NULL),(12,NULL,'2022-06-21 21:30:36',33,'pub','publication',0.00,NULL,NULL,12,1,NULL,1,NULL),(13,NULL,'2022-06-21 21:32:52',41,'pub','publication',0.00,NULL,NULL,13,1,NULL,1,NULL),(14,'2022-06-21','2022-06-21 21:39:28',45,'pub','publication',0.00,NULL,NULL,14,3,NULL,1,NULL),(15,NULL,'2022-06-21 21:40:03',48,'pub','publication',0.00,NULL,NULL,15,1,NULL,1,NULL),(16,NULL,'2022-06-21 21:41:00',49,'pub','publication',0.00,NULL,NULL,16,1,NULL,1,NULL),(17,NULL,'2022-06-21 21:44:34',50,'pub','publication',0.00,NULL,NULL,17,1,NULL,1,NULL);
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
  KEY `review_assignment_reviewer_round` (`review_round_id`,`reviewer_id`),
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
INSERT INTO `review_assignments` VALUES (1,1,12,NULL,NULL,'2022-06-21 21:07:53','2022-06-21 21:07:53',NULL,NULL,NULL,'2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:07:53',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,1,NULL,0),(2,2,11,NULL,NULL,'2022-06-21 21:10:44','2022-06-21 21:10:44',NULL,NULL,NULL,'2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:10:44',0,0,0,NULL,NULL,NULL,NULL,2,3,2,1,1,NULL,0),(3,2,12,NULL,NULL,'2022-06-21 21:10:54','2022-06-21 21:10:54',NULL,NULL,NULL,'2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:10:54',0,0,0,NULL,NULL,NULL,NULL,2,3,2,1,1,NULL,0),(4,4,9,NULL,NULL,'2022-06-21 21:13:44','2022-06-21 21:13:44',NULL,NULL,NULL,'2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:13:44',0,0,0,NULL,NULL,NULL,NULL,3,2,2,1,1,NULL,0),(5,4,11,NULL,NULL,'2022-06-21 21:14:05','2022-06-21 21:14:05',NULL,NULL,NULL,'2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:14:05',0,0,0,NULL,NULL,NULL,NULL,4,3,2,1,1,NULL,0),(6,5,8,NULL,NULL,'2022-06-21 21:16:35','2022-06-21 21:16:35',NULL,NULL,NULL,'2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:16:35',0,0,0,NULL,NULL,NULL,NULL,5,2,2,1,1,NULL,0),(7,5,12,NULL,NULL,'2022-06-21 21:16:53','2022-06-21 21:16:53',NULL,NULL,NULL,'2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:16:53',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,1,NULL,0),(8,7,10,NULL,NULL,'2022-06-21 21:22:59','2022-06-21 21:22:59',NULL,NULL,NULL,'2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:22:59',0,0,0,NULL,NULL,NULL,NULL,8,3,2,1,1,NULL,0),(9,11,9,NULL,NULL,'2022-06-21 21:27:45','2022-06-21 21:27:45',NULL,NULL,NULL,'2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:27:45',0,0,0,NULL,NULL,NULL,NULL,10,2,2,1,1,NULL,0),(10,11,10,NULL,0,'2022-06-21 21:28:01','2022-06-21 21:28:01','2022-06-21 21:28:18','2022-06-21 21:28:23','2022-06-21 21:28:55','2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:28:55',0,0,0,NULL,NULL,NULL,0,11,3,2,1,4,NULL,0),(11,11,12,NULL,0,'2022-06-21 21:28:10','2022-06-21 21:28:10','2022-06-21 21:28:31','2022-06-21 21:28:35','2022-06-21 21:28:55','2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:28:55',0,0,0,NULL,NULL,NULL,0,11,3,2,1,4,NULL,0),(12,12,7,NULL,NULL,'2022-06-21 21:31:11','2022-06-21 21:31:11',NULL,NULL,NULL,'2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:31:11',0,0,0,NULL,NULL,NULL,NULL,12,2,2,1,1,NULL,0),(13,12,8,NULL,0,'2022-06-21 21:31:20','2022-06-21 21:31:20','2022-06-21 21:31:41','2022-06-21 21:31:46',NULL,'2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:31:46',0,0,0,NULL,NULL,NULL,0,12,2,2,1,4,NULL,0),(14,12,9,NULL,NULL,'2022-06-21 21:31:30','2022-06-21 21:31:30',NULL,NULL,NULL,'2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:31:30',0,0,0,NULL,NULL,NULL,NULL,12,2,2,1,1,NULL,0),(15,13,8,NULL,NULL,'2022-06-21 21:33:23','2022-06-21 21:33:23',NULL,NULL,NULL,'2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:33:23',0,0,0,NULL,NULL,NULL,NULL,13,2,2,1,1,NULL,0),(16,13,10,NULL,0,'2022-06-21 21:33:42','2022-06-21 21:33:42','2022-06-21 21:34:12','2022-06-21 21:34:17','2022-06-21 21:34:57','2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:34:57',0,0,0,NULL,NULL,NULL,0,14,3,2,1,4,NULL,0),(17,13,11,NULL,NULL,'2022-06-21 21:33:52','2022-06-21 21:33:52',NULL,NULL,NULL,'2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:33:52',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,1,NULL,0),(18,13,12,NULL,0,'2022-06-21 21:34:02','2022-06-21 21:34:02','2022-06-21 21:34:28','2022-06-21 21:34:33','2022-06-21 21:34:57','2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:34:57',0,0,0,NULL,NULL,NULL,0,14,3,2,1,4,NULL,0),(19,14,7,NULL,NULL,'2022-06-21 21:36:54','2022-06-21 21:36:54',NULL,NULL,NULL,'2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:36:54',0,0,0,NULL,NULL,NULL,NULL,15,2,2,1,1,NULL,0),(20,14,11,NULL,NULL,'2022-06-21 21:37:15','2022-06-21 21:37:15',NULL,NULL,NULL,'2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:37:15',0,0,0,NULL,NULL,NULL,NULL,16,3,2,1,1,NULL,0),(21,16,10,NULL,0,'2022-06-21 21:41:29','2022-06-21 21:41:29','2022-06-21 21:41:54','2022-06-21 21:41:59',NULL,'2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:41:59',0,0,0,NULL,NULL,NULL,0,18,3,2,1,4,NULL,0),(22,16,11,NULL,NULL,'2022-06-21 21:41:36','2022-06-21 21:41:36',NULL,NULL,NULL,'2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:41:36',0,0,0,NULL,NULL,NULL,NULL,18,3,2,1,1,NULL,0),(23,16,12,NULL,NULL,'2022-06-21 21:41:45','2022-06-21 21:41:45',NULL,NULL,NULL,'2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:41:45',0,0,0,NULL,NULL,NULL,NULL,18,3,2,1,1,NULL,0),(24,17,7,NULL,NULL,'2022-06-21 21:45:19','2022-06-21 21:45:19',NULL,NULL,NULL,'2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:45:19',0,0,0,NULL,NULL,NULL,NULL,19,2,2,1,1,NULL,0),(25,17,8,NULL,NULL,'2022-06-21 21:45:30','2022-06-21 21:45:30',NULL,NULL,NULL,'2022-07-19 00:00:00','2022-07-19 00:00:00','2022-06-21 21:45:30',0,0,0,NULL,NULL,NULL,NULL,19,2,2,1,1,NULL,0);
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
INSERT INTO `scheduled_tasks` VALUES ('lib.pkp.classes.task.PublishSubmissions','2022-06-21 20:59:21'),('lib.pkp.classes.task.RemoveUnvalidatedExpiredUsers','2022-06-21 20:59:21'),('lib.pkp.classes.task.ReviewReminder','2022-06-21 20:59:21'),('lib.pkp.classes.task.StatisticsReport','2022-06-21 20:59:21'),('plugins.generic.usageStats.UsageStatsLoader','2022-06-21 20:59:21');
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
INSERT INTO `sessions` VALUES ('32665bekusof05hi4a80omuv4a',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655846822,1655846942,0,'csrf|a:2:{s:9:\"timestamp\";i:1655846942;s:5:\"token\";s:32:\"7338e133600c1132b95aba67e0238a8b\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('3kfmn71uhi3oth5i14og0f33o4',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655847111,1655847305,0,'csrf|a:2:{s:9:\"timestamp\";i:1655847305;s:5:\"token\";s:32:\"b014634eed9d183ad61e4f41323c3125\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('4krgjgj85imju1bocgiq4bng1d',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655845215,1655845572,0,'username|s:5:\"rvaca\";csrf|a:2:{s:9:\"timestamp\";i:1655845571;s:5:\"token\";s:32:\"f57203609299eaafe0f8787105632932\";}','localhost'),('60tt7o308ud1aiklpvlhjmpnln',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655845575,1655845600,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1655845600;s:5:\"token\";s:32:\"1f63531641ee159770427ee453257b13\";}','localhost'),('6745amaon4ctnuki164g82uisd',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655846944,1655847107,0,'csrf|a:2:{s:9:\"timestamp\";i:1655847107;s:5:\"token\";s:32:\"f90f0ff0cc9cfb382a11476104f3912e\";}username|s:7:\"phudson\";','localhost'),('acrrjc51f29qn44j793upg75hr',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655847575,1655847624,0,'csrf|a:2:{s:9:\"timestamp\";i:1655847624;s:5:\"token\";s:32:\"4faa8752d3ae543c79c0987de9281a23\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('cd6cj3nv3lrute4da518c4oduf',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655847626,1655847719,0,'csrf|a:2:{s:9:\"timestamp\";i:1655847719;s:5:\"token\";s:32:\"49380697e453e41a4b2d68c8aa8675fa\";}username|s:8:\"agallego\";','localhost'),('ce8g5g4ca8rve0r26edvk1d1gn',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655845623,1655845690,0,'csrf|a:2:{s:9:\"timestamp\";i:1655845690;s:5:\"token\";s:32:\"550eb62d56437b9df003ff3b07e8f530\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('dues4d99s1e0r90n2c69fm2t13',27,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655846752,1655846820,0,'csrf|a:2:{s:9:\"timestamp\";i:1655846819;s:5:\"token\";s:32:\"ce3970f8e66c70d18cc91d9134aee251\";}username|s:7:\"jbrower\";userId|i:27;','localhost'),('e81b731o2n0aim78qt1nbqkt5c',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655846619,1655846750,0,'csrf|a:2:{s:9:\"timestamp\";i:1655846750;s:5:\"token\";s:32:\"07817e63323298230c96400d3df56074\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('i4joa48kqig4hhh8b9tom6aqbl',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655845160,1655845175,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1655845175;s:5:\"token\";s:32:\"bbf0aaecba7211f597a3a872b2c9e56d\";}','localhost'),('i8188hsd3u18gi5v7cl9c585tl',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655846288,1655846423,0,'csrf|a:2:{s:9:\"timestamp\";i:1655846423;s:5:\"token\";s:32:\"b9549e02c1bdbfadeb07135754d18138\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('m9lelisfq1216nu92uk2lfq7qm',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655845206,1655845212,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1655845212;s:5:\"token\";s:32:\"582edc2709a85d671099560954e746b9\";}','localhost'),('mm1nr71orp920vm5s5s4nam068',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655845190,1655845196,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1655845196;s:5:\"token\";s:32:\"3d56a794ba8234db113d24ce31281513\";}','localhost'),('n2858lrr6gs71pquh5etttnahl',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655846605,1655846617,0,'userId|i:3;username|s:7:\"dbarnes\";csrf|a:2:{s:9:\"timestamp\";i:1655846616;s:5:\"token\";s:32:\"db9cebc05dad9496aa29296de8cf6409\";}','localhost'),('neonkr64dqenj29lg0tk88hs8o',21,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655845858,1655845905,0,'csrf|a:2:{s:9:\"timestamp\";i:1655845905;s:5:\"token\";s:32:\"16ffc9f8a544a385def41d9fcab35e10\";}username|s:10:\"bbarnetson\";userId|i:21;','localhost'),('p1g9ltnj5o8r707n8pnrou845d',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655847722,1655847930,0,'csrf|a:2:{s:9:\"timestamp\";i:1655847930;s:5:\"token\";s:32:\"9c3a97af5acb42e132b3c7541b5c89b4\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('ph12ivtbq2rhqn9se6stkllpg7',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655845693,1655845855,0,'csrf|a:2:{s:9:\"timestamp\";i:1655845854;s:5:\"token\";s:32:\"77259f31541f13ac4395f2a2723a0da4\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('s6ubrproottgno2hekvibbhaoo',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655845196,1655845206,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1655845206;s:5:\"token\";s:32:\"125324788031d5c6dbdd6b2af1a7b20d\";}','localhost'),('sakqt42qf4l2qoe0jplhqeh3d0',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655846428,1655846603,0,'csrf|a:2:{s:9:\"timestamp\";i:1655846603;s:5:\"token\";s:32:\"2a1be476ad7ae1630166c3fe510a2d43\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('sl3l89si72fp3ck54f7g755k2n',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655845175,1655845189,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1655845189;s:5:\"token\";s:32:\"78fe9a89d49707b17e815816919bb1be\";}','localhost'),('u4ugppuimbt7l4qucec374s71n',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655845602,1655845621,0,'userId|i:1;username|s:5:\"admin\";csrf|a:2:{s:9:\"timestamp\";i:1655845621;s:5:\"token\";s:32:\"99b8579884727006065a3bbd45ae6ae0\";}','localhost'),('umfpi1kmoseae57ttu35dppcju',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655845907,1655846120,0,'csrf|a:2:{s:9:\"timestamp\";i:1655846120;s:5:\"token\";s:32:\"b19312fa84492785bf12b498210bb934\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('umt08mmuq5lidnp0ipp2lo829t',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655847308,1655847568,0,'csrf|a:2:{s:9:\"timestamp\";i:1655847569;s:5:\"token\";s:32:\"3d4ed23ca10a978bb1c3bf2b6682860a\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('vo9763065c8220maeia6gn4dr2',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/102.0.5005.115 Safari/537.36',1655846123,1655846285,0,'csrf|a:2:{s:9:\"timestamp\";i:1655846285;s:5:\"token\";s:32:\"ce3e4cc02033796648b4d1dfeba99aaa\";}username|s:7:\"dbarnes\";userId|i:3;','localhost');
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
INSERT INTO `stage_assignments` VALUES (1,1,13,19,'2022-06-21 21:07:10',0,0),(2,1,3,3,'2022-06-21 21:07:30',0,1),(3,1,6,14,'2022-06-21 21:08:09',0,0),(4,2,14,20,'2022-06-21 21:08:20',0,0),(5,2,3,3,'2022-06-21 21:10:10',0,1),(6,3,13,21,'2022-06-21 21:11:05',0,0),(7,3,3,3,'2022-06-21 21:11:45',0,1),(8,4,14,22,'2022-06-21 21:11:55',0,0),(9,4,3,3,'2022-06-21 21:13:14',0,1),(10,4,6,13,'2022-06-21 21:14:26',0,0),(11,4,10,15,'2022-06-21 21:14:51',0,0),(12,5,13,23,'2022-06-21 21:15:30',0,0),(13,5,3,3,'2022-06-21 21:16:09',0,1),(14,5,6,14,'2022-06-21 21:17:11',0,0),(15,5,10,16,'2022-06-21 21:17:32',0,0),(16,5,12,17,'2022-06-21 21:17:39',0,0),(17,6,14,24,'2022-06-21 21:18:15',0,0),(18,6,3,3,'2022-06-21 21:19:18',0,1),(19,6,5,6,'2022-06-21 21:19:49',1,1),(20,7,14,25,'2022-06-21 21:20:35',0,0),(21,7,3,3,'2022-06-21 21:22:26',0,1),(22,7,6,13,'2022-06-21 21:23:22',0,0),(23,8,13,3,'2022-06-21 21:23:31',0,0),(24,8,3,3,'2022-06-21 21:23:36',0,1),(25,9,14,26,'2022-06-21 21:23:46',0,0),(26,9,3,3,'2022-06-21 21:25:24',0,1),(27,10,13,27,'2022-06-21 21:25:59',0,0),(28,10,3,3,'2022-06-21 21:26:59',0,1),(29,11,13,28,'2022-06-21 21:27:09',0,0),(30,11,3,3,'2022-06-21 21:27:22',0,1),(31,12,14,29,'2022-06-21 21:29:11',0,0),(32,12,3,3,'2022-06-21 21:30:38',0,1),(33,13,14,30,'2022-06-21 21:31:58',0,0),(34,13,3,3,'2022-06-21 21:32:54',0,1),(35,14,14,31,'2022-06-21 21:35:15',0,0),(36,14,3,3,'2022-06-21 21:36:21',0,1),(37,14,6,13,'2022-06-21 21:37:36',0,0),(38,14,10,15,'2022-06-21 21:38:01',0,0),(39,14,12,18,'2022-06-21 21:38:10',0,0),(40,15,13,32,'2022-06-21 21:39:42',0,0),(41,15,3,3,'2022-06-21 21:40:04',0,1),(42,16,13,33,'2022-06-21 21:40:33',0,0),(43,16,3,3,'2022-06-21 21:41:02',0,1),(44,17,14,34,'2022-06-21 21:42:10',0,0),(45,17,3,3,'2022-06-21 21:44:36',0,1);
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
INSERT INTO `submission_chapter_settings` VALUES (1,'','datePublished',NULL,'string'),(1,'','isPageEnabled',NULL,'string'),(1,'','pages','','string'),(1,'en_US','abstract','','string'),(1,'en_US','subtitle','','string'),(1,'en_US','title','Choosing the Future','string'),(1,'fr_CA','abstract','','string'),(1,'fr_CA','subtitle','','string'),(1,'fr_CA','title','','string'),(2,'','datePublished',NULL,'string'),(2,'','isPageEnabled',NULL,'string'),(2,'','pages','','string'),(2,'en_US','abstract','','string'),(2,'en_US','subtitle','','string'),(2,'en_US','title','Axioms','string'),(2,'fr_CA','abstract','','string'),(2,'fr_CA','subtitle','','string'),(2,'fr_CA','title','','string'),(3,'','datePublished',NULL,'string'),(3,'','isPageEnabled',NULL,'string'),(3,'','pages','','string'),(3,'en_US','abstract','','string'),(3,'en_US','subtitle','','string'),(3,'en_US','title','Paradigm Shift','string'),(3,'fr_CA','abstract','','string'),(3,'fr_CA','subtitle','','string'),(3,'fr_CA','title','','string'),(4,'','datePublished',NULL,'string'),(4,'','isPageEnabled',NULL,'string'),(4,'','pages','','string'),(4,'en_US','abstract','','string'),(4,'en_US','subtitle','','string'),(4,'en_US','title','Critical History in Western Canada 1900???2000','string'),(4,'fr_CA','abstract','','string'),(4,'fr_CA','subtitle','','string'),(4,'fr_CA','title','','string'),(5,'','datePublished',NULL,'string'),(5,'','isPageEnabled',NULL,'string'),(5,'','pages','','string'),(5,'en_US','abstract','','string'),(5,'en_US','subtitle','','string'),(5,'en_US','title','Vernacular Currents in Western Canadian Historiography: The Passion and Prose of Katherine Hughes, F.G. Roe, and Roy Ito','string'),(5,'fr_CA','abstract','','string'),(5,'fr_CA','subtitle','','string'),(5,'fr_CA','title','','string'),(6,'','datePublished',NULL,'string'),(6,'','isPageEnabled',NULL,'string'),(6,'','pages','','string'),(6,'en_US','abstract','','string'),(6,'en_US','subtitle','','string'),(6,'en_US','title','Cree Intellectual Traditions in History','string'),(6,'fr_CA','abstract','','string'),(6,'fr_CA','subtitle','','string'),(6,'fr_CA','title','','string'),(7,'','datePublished',NULL,'string'),(7,'','isPageEnabled',NULL,'string'),(7,'','pages','','string'),(7,'en_US','abstract','','string'),(7,'en_US','subtitle','','string'),(7,'en_US','title','Visualizing Space, Race, and History in the North: Photographic Narratives of the Athabasca-Mackenzie River Basin','string'),(7,'fr_CA','abstract','','string'),(7,'fr_CA','subtitle','','string'),(7,'fr_CA','title','','string'),(8,'','datePublished',NULL,'string'),(8,'','isPageEnabled',NULL,'string'),(8,'','pages','','string'),(8,'en_US','abstract','','string'),(8,'en_US','subtitle','','string'),(8,'en_US','title','Introduction','string'),(8,'fr_CA','abstract','','string'),(8,'fr_CA','subtitle','','string'),(8,'fr_CA','title','','string'),(9,'','datePublished',NULL,'string'),(9,'','isPageEnabled',NULL,'string'),(9,'','pages','','string'),(9,'en_US','abstract','','string'),(9,'en_US','subtitle','','string'),(9,'en_US','title','Part One. Employment Relationships in Canada','string'),(9,'fr_CA','abstract','','string'),(9,'fr_CA','subtitle','','string'),(9,'fr_CA','title','','string'),(10,'','datePublished',NULL,'string'),(10,'','isPageEnabled',NULL,'string'),(10,'','pages','','string'),(10,'en_US','abstract','','string'),(10,'en_US','subtitle','','string'),(10,'en_US','title','Part Two. Preventing Workplace Injury','string'),(10,'fr_CA','abstract','','string'),(10,'fr_CA','subtitle','','string'),(10,'fr_CA','title','','string'),(11,'','datePublished',NULL,'string'),(11,'','isPageEnabled',NULL,'string'),(11,'','pages','','string'),(11,'en_US','abstract','','string'),(11,'en_US','subtitle','','string'),(11,'en_US','title','Part Three. Critique of OHS in Canada','string'),(11,'fr_CA','abstract','','string'),(11,'fr_CA','subtitle','','string'),(11,'fr_CA','title','','string'),(12,'','datePublished',NULL,'string'),(12,'','isPageEnabled',NULL,'string'),(12,'','pages','','string'),(12,'en_US','abstract','','string'),(12,'en_US','subtitle','','string'),(12,'en_US','title','Part Four. Political Economy of Preventing Workplace Injury','string'),(12,'fr_CA','abstract','','string'),(12,'fr_CA','subtitle','','string'),(12,'fr_CA','title','','string'),(13,'','datePublished',NULL,'string'),(13,'','isPageEnabled',NULL,'string'),(13,'','pages','','string'),(13,'en_US','abstract','','string'),(13,'en_US','subtitle','','string'),(13,'en_US','title','Introduction: Contexts of Popular Culture','string'),(13,'fr_CA','abstract','','string'),(13,'fr_CA','subtitle','','string'),(13,'fr_CA','title','','string'),(14,'','datePublished',NULL,'string'),(14,'','isPageEnabled',NULL,'string'),(14,'','pages','','string'),(14,'en_US','abstract','','string'),(14,'en_US','subtitle','','string'),(14,'en_US','title','Chapter 1. A Future for Media Studies: Cultural Labour, Cultural Relations, Cultural Politics','string'),(14,'fr_CA','abstract','','string'),(14,'fr_CA','subtitle','','string'),(14,'fr_CA','title','','string'),(15,'','datePublished',NULL,'string'),(15,'','isPageEnabled',NULL,'string'),(15,'','pages','','string'),(15,'en_US','abstract','','string'),(15,'en_US','subtitle','','string'),(15,'en_US','title','Chapter 2. Log On, Goof Off, and Look Up: Facebook and the Rhythms of Canadian Internet Use','string'),(15,'fr_CA','abstract','','string'),(15,'fr_CA','subtitle','','string'),(15,'fr_CA','title','','string'),(16,'','datePublished',NULL,'string'),(16,'','isPageEnabled',NULL,'string'),(16,'','pages','','string'),(16,'en_US','abstract','','string'),(16,'en_US','subtitle','','string'),(16,'en_US','title','Chapter 3. Hawkers and Public Space: Free Commuter Newspapers in Canada','string'),(16,'fr_CA','abstract','','string'),(16,'fr_CA','subtitle','','string'),(16,'fr_CA','title','','string'),(17,'','datePublished',NULL,'string'),(17,'','isPageEnabled',NULL,'string'),(17,'','pages','','string'),(17,'en_US','abstract','','string'),(17,'en_US','subtitle','','string'),(17,'en_US','title','Prologue','string'),(17,'fr_CA','abstract','','string'),(17,'fr_CA','subtitle','','string'),(17,'fr_CA','title','','string'),(18,'','datePublished',NULL,'string'),(18,'','isPageEnabled',NULL,'string'),(18,'','pages','','string'),(18,'en_US','abstract','','string'),(18,'en_US','subtitle','','string'),(18,'en_US','title','Chapter 1: The First Five Years: 1867-1872','string'),(18,'fr_CA','abstract','','string'),(18,'fr_CA','subtitle','','string'),(18,'fr_CA','title','','string'),(19,'','datePublished',NULL,'string'),(19,'','isPageEnabled',NULL,'string'),(19,'','pages','','string'),(19,'en_US','abstract','','string'),(19,'en_US','subtitle','','string'),(19,'en_US','title','Chapter 2: Free Trade or \"Freedom\": 1911','string'),(19,'fr_CA','abstract','','string'),(19,'fr_CA','subtitle','','string'),(19,'fr_CA','title','','string'),(20,'','datePublished',NULL,'string'),(20,'','isPageEnabled',NULL,'string'),(20,'','pages','','string'),(20,'en_US','abstract','','string'),(20,'en_US','subtitle','','string'),(20,'en_US','title','Chapter 3: Castro, Nukes & the Cold War: 1953-1968','string'),(20,'fr_CA','abstract','','string'),(20,'fr_CA','subtitle','','string'),(20,'fr_CA','title','','string'),(21,'','datePublished',NULL,'string'),(21,'','isPageEnabled',NULL,'string'),(21,'','pages','','string'),(21,'en_US','abstract','','string'),(21,'en_US','subtitle','','string'),(21,'en_US','title','Chapter 4: Enter the Intellect: 1968-1984','string'),(21,'fr_CA','abstract','','string'),(21,'fr_CA','subtitle','','string'),(21,'fr_CA','title','','string'),(22,'','datePublished',NULL,'string'),(22,'','isPageEnabled',NULL,'string'),(22,'','pages','','string'),(22,'en_US','abstract','','string'),(22,'en_US','subtitle','','string'),(22,'en_US','title','Epilogue','string'),(22,'fr_CA','abstract','','string'),(22,'fr_CA','subtitle','','string'),(22,'fr_CA','title','','string'),(23,'','datePublished',NULL,'string'),(23,'','isPageEnabled',NULL,'string'),(23,'','pages','','string'),(23,'en_US','abstract','','string'),(23,'en_US','subtitle','','string'),(23,'en_US','title','Identify: Understanding Your Information Need','string'),(23,'fr_CA','abstract','','string'),(23,'fr_CA','subtitle','','string'),(23,'fr_CA','title','','string'),(24,'','datePublished',NULL,'string'),(24,'','isPageEnabled',NULL,'string'),(24,'','pages','','string'),(24,'en_US','abstract','','string'),(24,'en_US','subtitle','','string'),(24,'en_US','title','Scope: Knowing What Is Available','string'),(24,'fr_CA','abstract','','string'),(24,'fr_CA','subtitle','','string'),(24,'fr_CA','title','','string'),(25,'','datePublished',NULL,'string'),(25,'','isPageEnabled',NULL,'string'),(25,'','pages','','string'),(25,'en_US','abstract','','string'),(25,'en_US','subtitle','','string'),(25,'en_US','title','Plan: Developing Research Strategies','string'),(25,'fr_CA','abstract','','string'),(25,'fr_CA','subtitle','','string'),(25,'fr_CA','title','','string'),(26,'','datePublished',NULL,'string'),(26,'','isPageEnabled',NULL,'string'),(26,'','pages','','string'),(26,'en_US','abstract','','string'),(26,'en_US','subtitle','','string'),(26,'en_US','title','Gather: Finding What You Need','string'),(26,'fr_CA','abstract','','string'),(26,'fr_CA','subtitle','','string'),(26,'fr_CA','title','','string'),(27,'','datePublished',NULL,'string'),(27,'','isPageEnabled',NULL,'string'),(27,'','pages','','string'),(27,'en_US','abstract','','string'),(27,'en_US','subtitle','','string'),(27,'en_US','title','Introduction','string'),(27,'fr_CA','abstract','','string'),(27,'fr_CA','subtitle','','string'),(27,'fr_CA','title','','string'),(28,'','datePublished',NULL,'string'),(28,'','isPageEnabled',NULL,'string'),(28,'','pages','','string'),(28,'en_US','abstract','','string'),(28,'en_US','subtitle','','string'),(28,'en_US','title','Chapter 1: Interactions Affording Distance Science Education','string'),(28,'fr_CA','abstract','','string'),(28,'fr_CA','subtitle','','string'),(28,'fr_CA','title','','string'),(29,'','datePublished',NULL,'string'),(29,'','isPageEnabled',NULL,'string'),(29,'','pages','','string'),(29,'en_US','abstract','','string'),(29,'en_US','subtitle','','string'),(29,'en_US','title','Chapter 2: Learning Science at a Distance: Instructional Dialogues and Resources','string'),(29,'fr_CA','abstract','','string'),(29,'fr_CA','subtitle','','string'),(29,'fr_CA','title','','string'),(30,'','datePublished',NULL,'string'),(30,'','isPageEnabled',NULL,'string'),(30,'','pages','','string'),(30,'en_US','abstract','','string'),(30,'en_US','subtitle','','string'),(30,'en_US','title','Chapter 3: Leadership Strategies for Coordinating Distance Education Instructional Development Teams','string'),(30,'fr_CA','abstract','','string'),(30,'fr_CA','subtitle','','string'),(30,'fr_CA','title','','string'),(31,'','datePublished',NULL,'string'),(31,'','isPageEnabled',NULL,'string'),(31,'','pages','','string'),(31,'en_US','abstract','','string'),(31,'en_US','subtitle','','string'),(31,'en_US','title','Chapter 4: Toward New Models of Flexible Education to Enhance Quality in Australian Higher Education','string'),(31,'fr_CA','abstract','','string'),(31,'fr_CA','subtitle','','string'),(31,'fr_CA','title','','string'),(32,'','datePublished',NULL,'string'),(32,'','isPageEnabled',NULL,'string'),(32,'','pages','','string'),(32,'en_US','abstract','','string'),(32,'en_US','subtitle','','string'),(32,'en_US','title','Internet, openness and the future of the information society in LAC','string'),(32,'fr_CA','abstract','','string'),(32,'fr_CA','subtitle','','string'),(32,'fr_CA','title','','string'),(33,'','datePublished',NULL,'string'),(33,'','isPageEnabled',NULL,'string'),(33,'','pages','','string'),(33,'en_US','abstract','','string'),(33,'en_US','subtitle','','string'),(33,'en_US','title','Imagining the Internet: Open, closed or in between?','string'),(33,'fr_CA','abstract','','string'),(33,'fr_CA','subtitle','','string'),(33,'fr_CA','title','','string'),(34,'','datePublished',NULL,'string'),(34,'','isPageEnabled',NULL,'string'),(34,'','pages','','string'),(34,'en_US','abstract','','string'),(34,'en_US','subtitle','','string'),(34,'en_US','title','The internet in LAC will remain free, public and open over the next 10 years','string'),(34,'fr_CA','abstract','','string'),(34,'fr_CA','subtitle','','string'),(34,'fr_CA','title','','string'),(35,'','datePublished',NULL,'string'),(35,'','isPageEnabled',NULL,'string'),(35,'','pages','','string'),(35,'en_US','abstract','','string'),(35,'en_US','subtitle','','string'),(35,'en_US','title','Free Internet?','string'),(35,'fr_CA','abstract','','string'),(35,'fr_CA','subtitle','','string'),(35,'fr_CA','title','','string'),(36,'','datePublished',NULL,'string'),(36,'','isPageEnabled',NULL,'string'),(36,'','pages','','string'),(36,'en_US','abstract','','string'),(36,'en_US','subtitle','','string'),(36,'en_US','title','Risks and challenges for freedom of expression on the internet','string'),(36,'fr_CA','abstract','','string'),(36,'fr_CA','subtitle','','string'),(36,'fr_CA','title','','string'),(37,'','datePublished',NULL,'string'),(37,'','isPageEnabled',NULL,'string'),(37,'','pages','','string'),(37,'en_US','abstract','','string'),(37,'en_US','subtitle','','string'),(37,'en_US','title','Introduction','string'),(37,'fr_CA','abstract','','string'),(37,'fr_CA','subtitle','','string'),(37,'fr_CA','title','','string'),(38,'','datePublished',NULL,'string'),(38,'','isPageEnabled',NULL,'string'),(38,'','pages','','string'),(38,'en_US','abstract','','string'),(38,'en_US','subtitle','','string'),(38,'en_US','title','CHAPTER ONE: Where the Buffalo Roamed','string'),(38,'fr_CA','abstract','','string'),(38,'fr_CA','subtitle','','string'),(38,'fr_CA','title','','string'),(39,'','datePublished',NULL,'string'),(39,'','isPageEnabled',NULL,'string'),(39,'','pages','','string'),(39,'en_US','abstract','','string'),(39,'en_US','subtitle','','string'),(39,'en_US','title','CHAPTER TWO: Bison Conservation and Buffalo National Park','string'),(39,'fr_CA','abstract','','string'),(39,'fr_CA','subtitle','','string'),(39,'fr_CA','title','','string'),(40,'','datePublished',NULL,'string'),(40,'','isPageEnabled',NULL,'string'),(40,'','pages','','string'),(40,'en_US','abstract','','string'),(40,'en_US','subtitle','','string'),(40,'en_US','title','CHAPTER THREE: A Well-Run Ranch','string'),(40,'fr_CA','abstract','','string'),(40,'fr_CA','subtitle','','string'),(40,'fr_CA','title','','string'),(41,'','datePublished',NULL,'string'),(41,'','isPageEnabled',NULL,'string'),(41,'','pages','','string'),(41,'en_US','abstract','','string'),(41,'en_US','subtitle','','string'),(41,'en_US','title','CHAPTER FOUR: Zookeepers and Animal Breeders','string'),(41,'fr_CA','abstract','','string'),(41,'fr_CA','subtitle','','string'),(41,'fr_CA','title','','string'),(42,'','datePublished',NULL,'string'),(42,'','isPageEnabled',NULL,'string'),(42,'','pages','','string'),(42,'en_US','abstract','','string'),(42,'en_US','subtitle','','string'),(42,'en_US','title','CHAPTER FIVE: \"Evolving the Arctic Cow\"','string'),(42,'fr_CA','abstract','','string'),(42,'fr_CA','subtitle','','string'),(42,'fr_CA','title','','string'),(43,'','datePublished',NULL,'string'),(43,'','isPageEnabled',NULL,'string'),(43,'','pages','','string'),(43,'en_US','abstract','','string'),(43,'en_US','subtitle','','string'),(43,'en_US','title','CONCLUSION: The Forgotten Park','string'),(43,'fr_CA','abstract','','string'),(43,'fr_CA','subtitle','','string'),(43,'fr_CA','title','','string'),(44,'','datePublished',NULL,'string'),(44,'','isPageEnabled',NULL,'string'),(44,'','pages','','string'),(44,'en_US','abstract','','string'),(44,'en_US','subtitle','','string'),(44,'en_US','title','Bibliography','string'),(44,'fr_CA','abstract','','string'),(44,'fr_CA','subtitle','','string'),(44,'fr_CA','title','','string'),(45,'','datePublished',NULL,'string'),(45,'','isPageEnabled',NULL,'string'),(45,'','pages','','string'),(45,'en_US','abstract','','string'),(45,'en_US','subtitle','','string'),(45,'en_US','title','Index','string'),(45,'fr_CA','abstract','','string'),(45,'fr_CA','subtitle','','string'),(45,'fr_CA','title','','string'),(46,'','datePublished',NULL,'string'),(46,'','isPageEnabled',NULL,'string'),(46,'','pages','','string'),(46,'en_US','abstract','','string'),(46,'en_US','subtitle','','string'),(46,'en_US','title','Introduction','string'),(46,'fr_CA','abstract','','string'),(46,'fr_CA','subtitle','','string'),(46,'fr_CA','title','','string'),(47,'','datePublished',NULL,'string'),(47,'','isPageEnabled',NULL,'string'),(47,'','pages','','string'),(47,'en_US','abstract','','string'),(47,'en_US','subtitle','','string'),(47,'en_US','title','Poems','string'),(47,'fr_CA','abstract','','string'),(47,'fr_CA','subtitle','','string'),(47,'fr_CA','title','','string'),(48,'','datePublished',NULL,'string'),(48,'','isPageEnabled',NULL,'string'),(48,'','pages','','string'),(48,'en_US','abstract','','string'),(48,'en_US','subtitle','','string'),(48,'en_US','title','Catalyzing Access through Social and Technical Innovation','string'),(48,'fr_CA','abstract','','string'),(48,'fr_CA','subtitle','','string'),(48,'fr_CA','title','','string'),(49,'','datePublished',NULL,'string'),(49,'','isPageEnabled',NULL,'string'),(49,'','pages','','string'),(49,'en_US','abstract','','string'),(49,'en_US','subtitle','','string'),(49,'en_US','title','Catalyzing Access via Telecommunications Policy','string'),(49,'fr_CA','abstract','','string'),(49,'fr_CA','subtitle','','string'),(49,'fr_CA','title','','string'),(50,'','datePublished',NULL,'string'),(50,'','isPageEnabled',NULL,'string'),(50,'','pages','','string'),(50,'en_US','abstract','','string'),(50,'en_US','subtitle','','string'),(50,'en_US','title','Access to Knowledge as a New Paradigm for Research on ICTs and Intellectual Property','string'),(50,'fr_CA','abstract','','string'),(50,'fr_CA','subtitle','','string'),(50,'fr_CA','title','','string'),(51,'','datePublished',NULL,'string'),(51,'','isPageEnabled',NULL,'string'),(51,'','pages','','string'),(51,'en_US','abstract','','string'),(51,'en_US','subtitle','','string'),(51,'en_US','title','Current State of Mobile Learning','string'),(51,'fr_CA','abstract','','string'),(51,'fr_CA','subtitle','','string'),(51,'fr_CA','title','','string'),(52,'','datePublished',NULL,'string'),(52,'','isPageEnabled',NULL,'string'),(52,'','pages','','string'),(52,'en_US','abstract','','string'),(52,'en_US','subtitle','','string'),(52,'en_US','title','A Model for Framing Mobile Learning','string'),(52,'fr_CA','abstract','','string'),(52,'fr_CA','subtitle','','string'),(52,'fr_CA','title','','string'),(53,'','datePublished',NULL,'string'),(53,'','isPageEnabled',NULL,'string'),(53,'','pages','','string'),(53,'en_US','abstract','','string'),(53,'en_US','subtitle','','string'),(53,'en_US','title','Mobile Distance Learning with PDAs: Development and Testing of Pedagogical and System Solutions Supporting Mobile Distance Learners','string'),(53,'fr_CA','abstract','','string'),(53,'fr_CA','subtitle','','string'),(53,'fr_CA','title','','string'),(54,'','datePublished',NULL,'string'),(54,'','isPageEnabled',NULL,'string'),(54,'','pages','','string'),(54,'en_US','abstract','','string'),(54,'en_US','subtitle','','string'),(54,'en_US','title','Chapter 1: Mind Control???Internal or External?','string'),(54,'fr_CA','abstract','','string'),(54,'fr_CA','subtitle','','string'),(54,'fr_CA','title','','string'),(55,'','datePublished',NULL,'string'),(55,'','isPageEnabled',NULL,'string'),(55,'','pages','','string'),(55,'en_US','abstract','','string'),(55,'en_US','subtitle','','string'),(55,'en_US','title','Chapter 2: Classical Music and the Classical Mind','string'),(55,'fr_CA','abstract','','string'),(55,'fr_CA','subtitle','','string'),(55,'fr_CA','title','','string'),(56,'','datePublished',NULL,'string'),(56,'','isPageEnabled',NULL,'string'),(56,'','pages','','string'),(56,'en_US','abstract','','string'),(56,'en_US','subtitle','','string'),(56,'en_US','title','Chapter 3: Situated Cognition and Bricolage','string'),(56,'fr_CA','abstract','','string'),(56,'fr_CA','subtitle','','string'),(56,'fr_CA','title','','string'),(57,'','datePublished',NULL,'string'),(57,'','isPageEnabled',NULL,'string'),(57,'','pages','','string'),(57,'en_US','abstract','','string'),(57,'en_US','subtitle','','string'),(57,'en_US','title','Chapter 4: Braitenberg???s Vehicle 2','string'),(57,'fr_CA','abstract','','string'),(57,'fr_CA','subtitle','','string'),(57,'fr_CA','title','','string'),(58,'','datePublished',NULL,'string'),(58,'','isPageEnabled',NULL,'string'),(58,'','pages','','string'),(58,'en_US','abstract','','string'),(58,'en_US','subtitle','','string'),(58,'en_US','title','Setting the Stage','string'),(58,'fr_CA','abstract','','string'),(58,'fr_CA','subtitle','','string'),(58,'fr_CA','title','','string'),(59,'','datePublished',NULL,'string'),(59,'','isPageEnabled',NULL,'string'),(59,'','pages','','string'),(59,'en_US','abstract','','string'),(59,'en_US','subtitle','','string'),(59,'en_US','title','Going It Alone, 1945-1954','string'),(59,'fr_CA','abstract','','string'),(59,'fr_CA','subtitle','','string'),(59,'fr_CA','title','','string'),(60,'','datePublished',NULL,'string'),(60,'','isPageEnabled',NULL,'string'),(60,'','pages','','string'),(60,'en_US','abstract','','string'),(60,'en_US','subtitle','','string'),(60,'en_US','title','Establishing the Pattern, 1955-1962','string'),(60,'fr_CA','abstract','','string'),(60,'fr_CA','subtitle','','string'),(60,'fr_CA','title','','string'),(61,'','datePublished',NULL,'string'),(61,'','isPageEnabled',NULL,'string'),(61,'','pages','','string'),(61,'en_US','abstract','','string'),(61,'en_US','subtitle','','string'),(61,'en_US','title','Foreward','string'),(61,'fr_CA','abstract','','string'),(61,'fr_CA','subtitle','','string'),(61,'fr_CA','title','','string'),(62,'','datePublished',NULL,'string'),(62,'','isPageEnabled',NULL,'string'),(62,'','pages','','string'),(62,'en_US','abstract','','string'),(62,'en_US','subtitle','','string'),(62,'en_US','title','Preface','string'),(62,'fr_CA','abstract','','string'),(62,'fr_CA','subtitle','','string'),(62,'fr_CA','title','','string'),(63,'','datePublished',NULL,'string'),(63,'','isPageEnabled',NULL,'string'),(63,'','pages','','string'),(63,'en_US','abstract','','string'),(63,'en_US','subtitle','','string'),(63,'en_US','title','The Case Studies','string'),(63,'fr_CA','abstract','','string'),(63,'fr_CA','subtitle','','string'),(63,'fr_CA','title','','string'),(64,'','datePublished',NULL,'string'),(64,'','isPageEnabled',NULL,'string'),(64,'','pages','','string'),(64,'en_US','abstract','','string'),(64,'en_US','subtitle','','string'),(64,'en_US','title','Conclusion','string'),(64,'fr_CA','abstract','','string'),(64,'fr_CA','subtitle','','string'),(64,'fr_CA','title','','string'),(65,'','datePublished',NULL,'string'),(65,'','isPageEnabled',NULL,'string'),(65,'','pages','','string'),(65,'en_US','abstract','','string'),(65,'en_US','subtitle','','string'),(65,'en_US','title','Bibliography','string'),(65,'fr_CA','abstract','','string'),(65,'fr_CA','subtitle','','string'),(65,'fr_CA','title','','string'),(66,'','datePublished',NULL,'string'),(66,'','isPageEnabled',NULL,'string'),(66,'','pages','','string'),(66,'en_US','abstract','','string'),(66,'en_US','subtitle','','string'),(66,'en_US','title','Preface','string'),(66,'fr_CA','abstract','','string'),(66,'fr_CA','subtitle','','string'),(66,'fr_CA','title','','string'),(67,'','datePublished',NULL,'string'),(67,'','isPageEnabled',NULL,'string'),(67,'','pages','','string'),(67,'en_US','abstract','','string'),(67,'en_US','subtitle','','string'),(67,'en_US','title','Introduction','string'),(67,'fr_CA','abstract','','string'),(67,'fr_CA','subtitle','','string'),(67,'fr_CA','title','','string'),(68,'','datePublished',NULL,'string'),(68,'','isPageEnabled',NULL,'string'),(68,'','pages','','string'),(68,'en_US','abstract','','string'),(68,'en_US','subtitle','','string'),(68,'en_US','title','The Emergence of Open Development in a Network Society','string'),(68,'fr_CA','abstract','','string'),(68,'fr_CA','subtitle','','string'),(68,'fr_CA','title','','string'),(69,'','datePublished',NULL,'string'),(69,'','isPageEnabled',NULL,'string'),(69,'','pages','','string'),(69,'en_US','abstract','','string'),(69,'en_US','subtitle','','string'),(69,'en_US','title','Enacting Openness in ICT4D Research','string'),(69,'fr_CA','abstract','','string'),(69,'fr_CA','subtitle','','string'),(69,'fr_CA','title','','string'),(70,'','datePublished',NULL,'string'),(70,'','isPageEnabled',NULL,'string'),(70,'','pages','','string'),(70,'en_US','abstract','','string'),(70,'en_US','subtitle','','string'),(70,'en_US','title','Transparency and Development: Ethical Consumption through Web 2.0 and the Internet of Things','string'),(70,'fr_CA','abstract','','string'),(70,'fr_CA','subtitle','','string'),(70,'fr_CA','title','','string'),(71,'','datePublished',NULL,'string'),(71,'','isPageEnabled',NULL,'string'),(71,'','pages','','string'),(71,'en_US','abstract','','string'),(71,'en_US','subtitle','','string'),(71,'en_US','title','Open Educational Resources: Opportunities and Challenges for the Developing World','string'),(71,'fr_CA','abstract','','string'),(71,'fr_CA','subtitle','','string'),(71,'fr_CA','title','','string');
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
INSERT INTO `submission_comments` VALUES (1,1,4096,11,10,10,'','<p>I recommend that the author revise this submission.</p>','2022-06-21 21:28:23',NULL,1),(2,1,4096,11,11,12,'','<p>I recommend that the author resubmit this submission.</p>','2022-06-21 21:28:35',NULL,1),(3,1,4096,12,13,8,'','<p>I recommend declining this submission.</p>','2022-06-21 21:31:46',NULL,1),(4,1,4096,13,16,10,'','<p>I recommend requiring revisions.</p>','2022-06-21 21:34:17',NULL,1),(5,1,4096,13,18,12,'','<p>I recommend resubmitting.</p>','2022-06-21 21:34:33',NULL,1),(6,1,4096,16,21,10,'','<p>I recommend that the author revise this submission.</p>','2022-06-21 21:41:59',NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_revisions`
--

LOCK TABLES `submission_file_revisions` WRITE;
/*!40000 ALTER TABLE `submission_file_revisions` DISABLE KEYS */;
INSERT INTO `submission_file_revisions` VALUES (1,1,1),(2,2,1),(3,3,2),(4,4,3),(5,5,4),(6,6,5),(7,7,4),(8,8,5),(9,9,2),(10,10,3),(11,11,6),(12,12,7),(13,13,8),(14,14,9),(15,15,10),(16,16,10),(17,17,9),(18,18,7),(19,19,8),(20,20,11),(21,21,11),(22,22,11),(23,23,12),(24,24,13),(25,25,14),(26,26,15),(27,27,14),(28,28,15),(29,29,12),(30,30,13),(31,31,16),(32,32,17),(33,33,18),(34,34,19),(35,35,20),(36,36,19),(37,37,20),(38,38,17),(39,39,18),(40,40,16),(41,41,21),(42,42,22),(43,43,23),(44,44,24),(45,45,25),(46,46,26),(47,47,25),(48,48,26),(49,49,23),(50,50,24),(51,51,22),(52,52,27),(53,53,28),(54,54,28),(55,55,29),(56,56,30),(57,57,31),(58,58,30),(59,59,31),(60,60,29),(61,61,32),(62,62,33),(63,63,34),(64,64,33),(65,65,34),(66,66,32),(67,67,35),(68,68,36),(69,69,37),(70,70,38),(71,71,39),(72,72,40),(73,73,40),(74,74,39),(75,75,37),(76,76,38),(77,77,35),(78,78,36),(79,79,40),(80,80,39),(81,81,37),(82,82,38),(83,83,35),(84,84,36),(85,85,41),(86,86,41),(87,87,42),(88,88,42),(89,89,43),(90,90,44),(91,91,45),(92,92,46),(93,93,47),(94,94,48),(95,95,48),(96,96,46),(97,97,47),(98,98,44),(99,99,45),(100,100,43);
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
INSERT INTO `submission_file_settings` VALUES (1,'en_US','name','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(2,'en_US','name','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(3,'','chapterId','4','string'),(3,'en_US','name','Critical History in Western Canada 1900???.pdf','string'),(4,'','chapterId','5','string'),(4,'en_US','name','Vernacular Currents in Western Canadian .pdf','string'),(5,'','chapterId','6','string'),(5,'en_US','name','Cree Intellectual Traditions in History.pdf','string'),(6,'','chapterId','7','string'),(6,'en_US','name','Visualizing Space, Race, and History in .pdf','string'),(7,'','chapterId','6','string'),(7,'en_US','name','Cree Intellectual Traditions in History.pdf','string'),(8,'','chapterId','7','string'),(8,'en_US','name','Visualizing Space, Race, and History in .pdf','string'),(9,'','chapterId','4','string'),(9,'en_US','name','Critical History in Western Canada 1900???.pdf','string'),(10,'','chapterId','5','string'),(10,'en_US','name','Vernacular Currents in Western Canadian .pdf','string'),(11,'en_US','name','The Political Economy of Workplace Injury in Canada.pdf','string'),(12,'','chapterId','13','string'),(12,'en_US','name','Introduction: Contexts of Popular Cultur.pdf','string'),(13,'','chapterId','14','string'),(13,'en_US','name','Chapter 1. A Future for Media Studies: C.pdf','string'),(14,'','chapterId','15','string'),(14,'en_US','name','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(15,'','chapterId','16','string'),(15,'en_US','name','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(16,'','chapterId','16','string'),(16,'en_US','name','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(17,'','chapterId','15','string'),(17,'en_US','name','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(18,'','chapterId','13','string'),(18,'en_US','name','Introduction: Contexts of Popular Cultur.pdf','string'),(19,'','chapterId','14','string'),(19,'en_US','name','Chapter 1. A Future for Media Studies: C.pdf','string'),(20,'en_US','name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(21,'en_US','name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(22,'en_US','name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(23,'','chapterId','23','string'),(23,'en_US','name','Identify: Understanding Your Information.pdf','string'),(24,'','chapterId','24','string'),(24,'en_US','name','Scope: Knowing What Is Available.pdf','string'),(25,'','chapterId','25','string'),(25,'en_US','name','Plan: Developing Research Strategies.pdf','string'),(26,'','chapterId','26','string'),(26,'en_US','name','Gather: Finding What You Need.pdf','string'),(27,'','chapterId','25','string'),(27,'en_US','name','Plan: Developing Research Strategies.pdf','string'),(28,'','chapterId','26','string'),(28,'en_US','name','Gather: Finding What You Need.pdf','string'),(29,'','chapterId','23','string'),(29,'en_US','name','Identify: Understanding Your Information.pdf','string'),(30,'','chapterId','24','string'),(30,'en_US','name','Scope: Knowing What Is Available.pdf','string'),(31,'','chapterId','27','string'),(31,'en_US','name','Introduction.pdf','string'),(32,'','chapterId','28','string'),(32,'en_US','name','Chapter 1: Interactions Affording Distan.pdf','string'),(33,'','chapterId','29','string'),(33,'en_US','name','Chapter 2: Learning Science at a Distanc.pdf','string'),(34,'','chapterId','30','string'),(34,'en_US','name','Chapter 3: Leadership Strategies for Coo.pdf','string'),(35,'','chapterId','31','string'),(35,'en_US','name','Chapter 4: Toward New Models of Flexible.pdf','string'),(36,'','chapterId','30','string'),(36,'en_US','name','Chapter 3: Leadership Strategies for Coo.pdf','string'),(37,'','chapterId','31','string'),(37,'en_US','name','Chapter 4: Toward New Models of Flexible.pdf','string'),(38,'','chapterId','28','string'),(38,'en_US','name','Chapter 1: Interactions Affording Distan.pdf','string'),(39,'','chapterId','29','string'),(39,'en_US','name','Chapter 2: Learning Science at a Distanc.pdf','string'),(40,'','chapterId','27','string'),(40,'en_US','name','Introduction.pdf','string'),(41,'en_US','name','Editorial.pdf','string'),(42,'','chapterId','32','string'),(42,'en_US','name','Internet, openness and the future of the.pdf','string'),(43,'','chapterId','33','string'),(43,'en_US','name','Imagining the Internet: Open, closed or .pdf','string'),(44,'','chapterId','34','string'),(44,'en_US','name','The internet in LAC will remain free, pu.pdf','string'),(45,'','chapterId','35','string'),(45,'en_US','name','Free Internet?.pdf','string'),(46,'','chapterId','36','string'),(46,'en_US','name','Risks and challenges for freedom of expr.pdf','string'),(47,'','chapterId','35','string'),(47,'en_US','name','Free Internet?.pdf','string'),(48,'','chapterId','36','string'),(48,'en_US','name','Risks and challenges for freedom of expr.pdf','string'),(49,'','chapterId','33','string'),(49,'en_US','name','Imagining the Internet: Open, closed or .pdf','string'),(50,'','chapterId','34','string'),(50,'en_US','name','The internet in LAC will remain free, pu.pdf','string'),(51,'','chapterId','32','string'),(51,'en_US','name','Internet, openness and the future of the.pdf','string'),(52,'en_US','name','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(53,'en_US','name','Dreamwork.pdf','string'),(54,'en_US','name','Dreamwork.pdf','string'),(55,'','chapterId','48','string'),(55,'en_US','name','Catalyzing Access through Social and Tec.pdf','string'),(56,'','chapterId','49','string'),(56,'en_US','name','Catalyzing Access via Telecommunications.pdf','string'),(57,'','chapterId','50','string'),(57,'en_US','name','Access to Knowledge as a New Paradigm fo.pdf','string'),(58,'','chapterId','49','string'),(58,'en_US','name','Catalyzing Access via Telecommunications.pdf','string'),(59,'','chapterId','50','string'),(59,'en_US','name','Access to Knowledge as a New Paradigm fo.pdf','string'),(60,'','chapterId','48','string'),(60,'en_US','name','Catalyzing Access through Social and Tec.pdf','string'),(61,'','chapterId','51','string'),(61,'en_US','name','Current State of Mobile Learning.pdf','string'),(62,'','chapterId','52','string'),(62,'en_US','name','A Model for Framing Mobile Learning.pdf','string'),(63,'','chapterId','53','string'),(63,'en_US','name','Mobile Distance Learning with PDAs: Deve.pdf','string'),(64,'','chapterId','52','string'),(64,'en_US','name','A Model for Framing Mobile Learning.pdf','string'),(65,'','chapterId','53','string'),(65,'en_US','name','Mobile Distance Learning with PDAs: Deve.pdf','string'),(66,'','chapterId','51','string'),(66,'en_US','name','Current State of Mobile Learning.pdf','string'),(67,'','chapterId','54','string'),(67,'en_US','name','Chapter 1: Mind Control???Internal or Exte.pdf','string'),(68,'','chapterId','55','string'),(68,'en_US','name','Chapter 2: Classical Music and the Class.pdf','string'),(69,'','chapterId','56','string'),(69,'en_US','name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(70,'','chapterId','57','string'),(70,'en_US','name','Chapter 4: Braitenberg???s Vehicle 2.pdf','string'),(71,'en_US','name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(72,'en_US','name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(73,'en_US','name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(74,'en_US','name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(75,'','chapterId','56','string'),(75,'en_US','name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(76,'','chapterId','57','string'),(76,'en_US','name','Chapter 4: Braitenberg???s Vehicle 2.pdf','string'),(77,'','chapterId','54','string'),(77,'en_US','name','Chapter 1: Mind Control???Internal or Exte.pdf','string'),(78,'','chapterId','55','string'),(78,'en_US','name','Chapter 2: Classical Music and the Class.pdf','string'),(79,'en_US','name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(80,'en_US','name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(81,'','chapterId','56','string'),(81,'en_US','name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(82,'','chapterId','57','string'),(82,'en_US','name','Chapter 4: Braitenberg???s Vehicle 2.pdf','string'),(83,'','chapterId','54','string'),(83,'en_US','name','Chapter 1: Mind Control???Internal or Exte.pdf','string'),(84,'','chapterId','55','string'),(84,'en_US','name','Chapter 2: Classical Music and the Class.pdf','string'),(85,'en_US','name','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(86,'en_US','name','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(87,'en_US','name','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(88,'en_US','name','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(89,'','chapterId','66','string'),(89,'en_US','name','Preface.pdf','string'),(90,'','chapterId','67','string'),(90,'en_US','name','Introduction.pdf','string'),(91,'','chapterId','68','string'),(91,'en_US','name','The Emergence of Open Development in a N.pdf','string'),(92,'','chapterId','69','string'),(92,'en_US','name','Enacting Openness in ICT4D Research.pdf','string'),(93,'','chapterId','70','string'),(93,'en_US','name','Transparency and Development: Ethical Co.pdf','string'),(94,'','chapterId','71','string'),(94,'en_US','name','Open Educational Resources: Opportunitie.pdf','string'),(95,'','chapterId','71','string'),(95,'en_US','name','Open Educational Resources: Opportunitie.pdf','string'),(96,'','chapterId','69','string'),(96,'en_US','name','Enacting Openness in ICT4D Research.pdf','string'),(97,'','chapterId','70','string'),(97,'en_US','name','Transparency and Development: Ethical Co.pdf','string'),(98,'','chapterId','67','string'),(98,'en_US','name','Introduction.pdf','string'),(99,'','chapterId','68','string'),(99,'en_US','name','The Emergence of Open Development in a N.pdf','string'),(100,'','chapterId','66','string'),(100,'en_US','name','Preface.pdf','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (1,1,1,NULL,3,2,NULL,NULL,NULL,'2022-06-21 21:07:13','2022-06-21 21:07:13',19,NULL,NULL,NULL),(2,1,1,1,3,4,NULL,NULL,NULL,'2022-06-21 21:07:43','2022-06-21 21:07:43',19,523,1,NULL),(3,2,2,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:08:22','2022-06-21 21:08:22',20,NULL,NULL,NULL),(4,2,3,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:08:22','2022-06-21 21:08:23',20,NULL,NULL,NULL),(5,2,4,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:08:23','2022-06-21 21:08:23',20,NULL,NULL,NULL),(6,2,5,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:08:23','2022-06-21 21:08:24',20,NULL,NULL,NULL),(7,2,4,5,4,4,NULL,NULL,NULL,'2022-06-21 21:10:29','2022-06-21 21:10:29',20,523,2,NULL),(8,2,5,6,4,4,NULL,NULL,NULL,'2022-06-21 21:10:29','2022-06-21 21:10:29',20,523,2,NULL),(9,2,2,3,4,4,NULL,NULL,NULL,'2022-06-21 21:10:30','2022-06-21 21:10:30',20,523,2,NULL),(10,2,3,4,4,4,NULL,NULL,NULL,'2022-06-21 21:10:30','2022-06-21 21:10:30',20,523,2,NULL),(11,3,6,NULL,3,2,NULL,NULL,NULL,'2022-06-21 21:11:07','2022-06-21 21:11:08',21,NULL,NULL,NULL),(12,4,7,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:11:57','2022-06-21 21:11:57',22,NULL,NULL,NULL),(13,4,8,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:11:57','2022-06-21 21:11:58',22,NULL,NULL,NULL),(14,4,9,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:11:58','2022-06-21 21:11:58',22,NULL,NULL,NULL),(15,4,10,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:11:59','2022-06-21 21:11:59',22,NULL,NULL,NULL),(16,4,10,15,4,19,NULL,NULL,NULL,'2022-06-21 21:13:31','2022-06-21 21:13:31',22,523,3,NULL),(17,4,9,14,4,19,NULL,NULL,NULL,'2022-06-21 21:13:31','2022-06-21 21:13:31',22,523,3,NULL),(18,4,7,12,4,19,NULL,NULL,NULL,'2022-06-21 21:13:31','2022-06-21 21:13:31',22,523,3,NULL),(19,4,8,13,4,19,NULL,NULL,NULL,'2022-06-21 21:13:31','2022-06-21 21:13:31',22,523,3,NULL),(20,5,11,NULL,3,2,NULL,NULL,NULL,'2022-06-21 21:15:32','2022-06-21 21:15:33',23,NULL,NULL,NULL),(21,5,11,20,3,19,NULL,NULL,NULL,'2022-06-21 21:16:24','2022-06-21 21:16:24',23,523,5,NULL),(22,5,11,20,3,10,'0','openAccess',1,'2022-06-21 21:17:50','2022-06-21 21:18:02',23,521,2,NULL),(23,6,12,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:18:18','2022-06-21 21:18:18',24,NULL,NULL,NULL),(24,6,13,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:18:18','2022-06-21 21:18:19',24,NULL,NULL,NULL),(25,6,14,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:18:19','2022-06-21 21:18:19',24,NULL,NULL,NULL),(26,6,15,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:18:19','2022-06-21 21:18:19',24,NULL,NULL,NULL),(27,6,14,25,4,19,NULL,NULL,NULL,'2022-06-21 21:19:36','2022-06-21 21:19:36',24,523,7,NULL),(28,6,15,26,4,19,NULL,NULL,NULL,'2022-06-21 21:19:36','2022-06-21 21:19:36',24,523,7,NULL),(29,6,12,23,4,19,NULL,NULL,NULL,'2022-06-21 21:19:36','2022-06-21 21:19:36',24,523,7,NULL),(30,6,13,24,4,19,NULL,NULL,NULL,'2022-06-21 21:19:36','2022-06-21 21:19:36',24,523,7,NULL),(31,7,16,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:20:37','2022-06-21 21:20:38',25,NULL,NULL,NULL),(32,7,17,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:20:38','2022-06-21 21:20:38',25,NULL,NULL,NULL),(33,7,18,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:20:38','2022-06-21 21:20:38',25,NULL,NULL,NULL),(34,7,19,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:20:39','2022-06-21 21:20:39',25,NULL,NULL,NULL),(35,7,20,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:20:39','2022-06-21 21:20:40',25,NULL,NULL,NULL),(36,7,19,34,4,4,NULL,NULL,NULL,'2022-06-21 21:22:45','2022-06-21 21:22:45',25,523,8,NULL),(37,7,20,35,4,4,NULL,NULL,NULL,'2022-06-21 21:22:45','2022-06-21 21:22:45',25,523,8,NULL),(38,7,17,32,4,4,NULL,NULL,NULL,'2022-06-21 21:22:45','2022-06-21 21:22:45',25,523,8,NULL),(39,7,18,33,4,4,NULL,NULL,NULL,'2022-06-21 21:22:45','2022-06-21 21:22:45',25,523,8,NULL),(40,7,16,31,4,4,NULL,NULL,NULL,'2022-06-21 21:22:45','2022-06-21 21:22:45',25,523,8,NULL),(41,8,21,NULL,3,2,NULL,NULL,NULL,'2022-06-21 21:23:34','2022-06-21 21:23:34',3,NULL,NULL,NULL),(42,9,22,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:23:48','2022-06-21 21:23:48',26,NULL,NULL,NULL),(43,9,23,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:23:49','2022-06-21 21:23:49',26,NULL,NULL,NULL),(44,9,24,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:23:49','2022-06-21 21:23:49',26,NULL,NULL,NULL),(45,9,25,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:23:50','2022-06-21 21:23:50',26,NULL,NULL,NULL),(46,9,26,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:23:50','2022-06-21 21:23:50',26,NULL,NULL,NULL),(47,9,25,45,4,19,NULL,NULL,NULL,'2022-06-21 21:25:44','2022-06-21 21:25:44',26,523,9,NULL),(48,9,26,46,4,19,NULL,NULL,NULL,'2022-06-21 21:25:44','2022-06-21 21:25:44',26,523,9,NULL),(49,9,23,43,4,19,NULL,NULL,NULL,'2022-06-21 21:25:44','2022-06-21 21:25:44',26,523,9,NULL),(50,9,24,44,4,19,NULL,NULL,NULL,'2022-06-21 21:25:44','2022-06-21 21:25:44',26,523,9,NULL),(51,9,22,42,4,19,NULL,NULL,NULL,'2022-06-21 21:25:44','2022-06-21 21:25:44',26,523,9,NULL),(52,10,27,NULL,3,2,NULL,NULL,NULL,'2022-06-21 21:26:01','2022-06-21 21:26:02',27,NULL,NULL,NULL),(53,11,28,NULL,3,2,NULL,NULL,NULL,'2022-06-21 21:27:11','2022-06-21 21:27:12',28,NULL,NULL,NULL),(54,11,28,53,3,19,NULL,NULL,NULL,'2022-06-21 21:27:35','2022-06-21 21:27:35',28,523,10,NULL),(55,12,29,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:29:13','2022-06-21 21:29:14',29,NULL,NULL,NULL),(56,12,30,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:29:14','2022-06-21 21:29:14',29,NULL,NULL,NULL),(57,12,31,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:29:14','2022-06-21 21:29:15',29,NULL,NULL,NULL),(58,12,30,56,4,19,NULL,NULL,NULL,'2022-06-21 21:30:57','2022-06-21 21:30:57',29,523,12,NULL),(59,12,31,57,4,19,NULL,NULL,NULL,'2022-06-21 21:30:57','2022-06-21 21:30:57',29,523,12,NULL),(60,12,29,55,4,19,NULL,NULL,NULL,'2022-06-21 21:30:57','2022-06-21 21:30:57',29,523,12,NULL),(61,13,32,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:32:00','2022-06-21 21:32:00',30,NULL,NULL,NULL),(62,13,33,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:32:01','2022-06-21 21:32:01',30,NULL,NULL,NULL),(63,13,34,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:32:01','2022-06-21 21:32:01',30,NULL,NULL,NULL),(64,13,33,62,4,19,NULL,NULL,NULL,'2022-06-21 21:33:11','2022-06-21 21:33:11',30,523,13,NULL),(65,13,34,63,4,19,NULL,NULL,NULL,'2022-06-21 21:33:11','2022-06-21 21:33:11',30,523,13,NULL),(66,13,32,61,4,19,NULL,NULL,NULL,'2022-06-21 21:33:11','2022-06-21 21:33:11',30,523,13,NULL),(67,14,35,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:35:17','2022-06-21 21:35:17',31,NULL,NULL,NULL),(68,14,36,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:35:17','2022-06-21 21:35:18',31,NULL,NULL,NULL),(69,14,37,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:35:18','2022-06-21 21:35:18',31,NULL,NULL,NULL),(70,14,38,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:35:18','2022-06-21 21:35:19',31,NULL,NULL,NULL),(71,14,39,NULL,13,2,NULL,NULL,NULL,'2022-06-21 21:35:19','2022-06-21 21:35:19',31,NULL,NULL,NULL),(72,14,40,NULL,9,2,NULL,NULL,NULL,'2022-06-21 21:35:20','2022-06-21 21:35:20',31,NULL,NULL,NULL),(73,14,40,72,9,19,NULL,NULL,NULL,'2022-06-21 21:36:40','2022-06-21 21:36:40',31,523,15,NULL),(74,14,39,71,13,19,NULL,NULL,NULL,'2022-06-21 21:36:40','2022-06-21 21:36:40',31,523,15,NULL),(75,14,37,69,4,19,NULL,NULL,NULL,'2022-06-21 21:36:41','2022-06-21 21:36:41',31,523,15,NULL),(76,14,38,70,4,19,NULL,NULL,NULL,'2022-06-21 21:36:41','2022-06-21 21:36:41',31,523,15,NULL),(77,14,35,67,4,19,NULL,NULL,NULL,'2022-06-21 21:36:41','2022-06-21 21:36:41',31,523,15,NULL),(78,14,36,68,4,19,NULL,NULL,NULL,'2022-06-21 21:36:41','2022-06-21 21:36:41',31,523,15,NULL),(79,14,40,72,9,10,'0','openAccess',1,'2022-06-21 21:38:29','2022-06-21 21:39:23',31,521,3,NULL),(80,14,39,71,13,10,'0','openAccess',1,'2022-06-21 21:38:29','2022-06-21 21:39:15',31,521,3,NULL),(81,14,37,69,4,10,'0','openAccess',1,'2022-06-21 21:38:29','2022-06-21 21:38:59',31,521,3,NULL),(82,14,38,70,4,10,'0','openAccess',1,'2022-06-21 21:38:29','2022-06-21 21:39:07',31,521,3,NULL),(83,14,35,67,4,10,'0','openAccess',1,'2022-06-21 21:38:29','2022-06-21 21:38:43',31,521,3,NULL),(84,14,36,68,4,10,'0','openAccess',1,'2022-06-21 21:38:29','2022-06-21 21:38:51',31,521,3,NULL),(85,15,41,NULL,3,2,NULL,NULL,NULL,'2022-06-21 21:39:44','2022-06-21 21:39:44',32,NULL,NULL,NULL),(86,15,41,85,3,4,NULL,NULL,NULL,'2022-06-21 21:40:20','2022-06-21 21:40:20',32,523,17,NULL),(87,16,42,NULL,3,2,NULL,NULL,NULL,'2022-06-21 21:40:35','2022-06-21 21:40:35',33,NULL,NULL,NULL),(88,16,42,87,3,4,NULL,NULL,NULL,'2022-06-21 21:41:17','2022-06-21 21:41:17',33,523,18,NULL),(89,17,43,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:42:12','2022-06-21 21:42:12',34,NULL,NULL,NULL),(90,17,44,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:42:13','2022-06-21 21:42:13',34,NULL,NULL,NULL),(91,17,45,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:42:13','2022-06-21 21:42:13',34,NULL,NULL,NULL),(92,17,46,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:42:14','2022-06-21 21:42:14',34,NULL,NULL,NULL),(93,17,47,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:42:14','2022-06-21 21:42:14',34,NULL,NULL,NULL),(94,17,48,NULL,4,2,NULL,NULL,NULL,'2022-06-21 21:42:15','2022-06-21 21:42:15',34,NULL,NULL,NULL),(95,17,48,94,4,19,NULL,NULL,NULL,'2022-06-21 21:45:02','2022-06-21 21:45:02',34,523,19,NULL),(96,17,46,92,4,19,NULL,NULL,NULL,'2022-06-21 21:45:02','2022-06-21 21:45:02',34,523,19,NULL),(97,17,47,93,4,19,NULL,NULL,NULL,'2022-06-21 21:45:02','2022-06-21 21:45:02',34,523,19,NULL),(98,17,44,90,4,19,NULL,NULL,NULL,'2022-06-21 21:45:02','2022-06-21 21:45:02',34,523,19,NULL),(99,17,45,91,4,19,NULL,NULL,NULL,'2022-06-21 21:45:02','2022-06-21 21:45:02',34,523,19,NULL),(100,17,43,89,4,19,NULL,NULL,NULL,'2022-06-21 21:45:02','2022-06-21 21:45:02',34,523,19,NULL);
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
INSERT INTO `submission_search_keyword_list` VALUES (83,'acting'),(108,'affect'),(104,'agents'),(102,'agent???s'),(55,'alberta'),(2,'allan'),(10,'american'),(20,'americans'),(17,'anti-american'),(36,'anti-canadianism'),(58,'athabasca'),(96,'behaviour'),(32,'bilateral'),(6,'bomb'),(42,'book'),(15,'border'),(62,'brains'),(56,'brian'),(61,'bricks'),(60,'calgary'),(5,'california'),(7,'canada'),(47,'canadian'),(105,'capable'),(1,'chantal'),(76,'characteristics'),(78,'classical'),(64,'cognitive'),(49,'communication'),(45,'complex'),(25,'confederation'),(72,'construction'),(16,'continent'),(89,'control'),(50,'cultural'),(54,'dawson'),(90,'development'),(75,'discussing'),(77,'distinguish'),(87,'distributed'),(19,'documented'),(57,'dupuis'),(27,'election'),(63,'embodied'),(85,'embodiment'),(81,'emphasis'),(103,'environment'),(30,'events'),(23,'examines'),(28,'examining'),(98,'examples'),(106,'exhibiting'),(86,'exploration'),(95,'exploring'),(70,'foundational'),(41,'hilarious'),(35,'history'),(71,'ideas'),(99,'illustrate'),(69,'illustrates'),(84,'importance'),(37,'informative'),(52,'international'),(68,'introduces'),(100,'key'),(44,'layer'),(66,'lego'),(29,'major'),(11,'media'),(53,'michael'),(74,'mindstorms'),(14,'nations'),(22,'neighbour'),(21,'northern'),(88,'notions'),(97,'numerous'),(26,'obama???s'),(73,'observation'),(79,'places'),(51,'political'),(24,'portrayed'),(39,'provoking'),(110,'psychology'),(33,'relations'),(46,'relationship'),(9,'remarks'),(80,'renewed'),(43,'reveals'),(67,'robots'),(65,'science'),(107,'sense'),(82,'sensing'),(18,'sentiment'),(93,'simple'),(4,'southern'),(13,'states'),(48,'studies'),(92,'synthesizing'),(94,'systems'),(31,'tested'),(101,'theme'),(91,'theories'),(38,'thought'),(40,'times'),(34,'tracks'),(12,'united'),(3,'university'),(8,'unkind'),(59,'wilson'),(109,'world');
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
INSERT INTO `submissions` VALUES (1,1,1,'2022-06-21 21:08:09','2022-06-21 21:07:30','2022-06-21 21:07:30',4,'en_US',1,0,2),(2,1,2,'2022-06-21 21:10:54','2022-06-21 21:10:10','2022-06-21 21:10:10',3,'en_US',1,0,1),(3,1,3,'2022-06-21 21:11:45','2022-06-21 21:11:45','2022-06-21 21:11:45',1,'en_US',1,0,2),(4,1,4,'2022-06-21 21:15:20','2022-06-21 21:13:14','2022-06-21 21:13:14',5,'en_US',1,0,1),(5,1,5,'2022-06-21 21:18:04','2022-06-21 21:16:09','2022-06-21 21:16:09',5,'en_US',3,0,2),(6,1,6,'2022-06-21 21:20:06','2022-06-21 21:19:18','2022-06-21 21:19:18',2,'en_US',1,0,1),(7,1,7,'2022-06-21 21:23:22','2022-06-21 21:22:26','2022-06-21 21:22:26',4,'en_US',1,0,1),(8,1,8,'2022-06-21 21:23:36','2022-06-21 21:23:36','2022-06-21 21:23:36',1,'en_US',1,0,2),(9,1,9,'2022-06-21 21:25:44','2022-06-21 21:25:24','2022-06-21 21:25:24',2,'en_US',1,0,1),(10,1,10,'2022-06-21 21:26:59','2022-06-21 21:26:59','2022-06-21 21:26:59',1,'en_US',1,0,2),(11,1,11,'2022-06-21 21:28:55','2022-06-21 21:27:22','2022-06-21 21:28:10',4,'en_US',1,0,2),(12,1,12,'2022-06-21 21:31:46','2022-06-21 21:30:38','2022-06-21 21:31:20',2,'en_US',1,0,1),(13,1,13,'2022-06-21 21:34:57','2022-06-21 21:32:54','2022-06-21 21:34:02',4,'en_US',1,0,1),(14,1,14,'2022-06-21 21:39:28','2022-06-21 21:36:21','2022-06-21 21:36:21',5,'en_US',3,0,1),(15,1,15,'2022-06-21 21:40:20','2022-06-21 21:40:04','2022-06-21 21:40:04',3,'en_US',1,0,2),(16,1,16,'2022-06-21 21:41:59','2022-06-21 21:41:02','2022-06-21 21:41:29',3,'en_US',1,0,2),(17,1,17,'2022-06-21 21:45:30','2022-06-21 21:44:36','2022-06-21 21:44:36',2,'en_US',1,0,1);
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
INSERT INTO `user_group_settings` VALUES (1,'en_US','name','Site Admin','string'),(1,'fr_CA','name','Administrateur-trice du site','string'),(2,'','abbrevLocaleKey','default.groups.abbrev.manager','string'),(2,'','nameLocaleKey','default.groups.name.manager','string'),(2,'en_US','abbrev','PM','string'),(2,'en_US','name','Press manager','string'),(2,'fr_CA','abbrev','MP','string'),(2,'fr_CA','name','Gestionnaire de la presse','string'),(3,'','abbrevLocaleKey','default.groups.abbrev.editor','string'),(3,'','nameLocaleKey','default.groups.name.editor','string'),(3,'en_US','abbrev','PE','string'),(3,'en_US','name','Press editor','string'),(3,'fr_CA','abbrev','RP','string'),(3,'fr_CA','name','R??dacteur/R??dactrice en chef de la presse','string'),(4,'','abbrevLocaleKey','default.groups.abbrev.productionEditor','string'),(4,'','nameLocaleKey','default.groups.name.productionEditor','string'),(4,'en_US','abbrev','ProdE','string'),(4,'en_US','name','Production editor','string'),(4,'fr_CA','abbrev','DirProd','string'),(4,'fr_CA','name','Directeur-trice de production','string'),(5,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor','string'),(5,'','nameLocaleKey','default.groups.name.sectionEditor','string'),(5,'en_US','abbrev','AcqE','string'),(5,'en_US','name','Series editor','string'),(5,'fr_CA','abbrev','RS','string'),(5,'fr_CA','name','R??dacteur/R??dactrice en chef de la s??rie','string'),(6,'','abbrevLocaleKey','default.groups.abbrev.copyeditor','string'),(6,'','nameLocaleKey','default.groups.name.copyeditor','string'),(6,'en_US','abbrev','CE','string'),(6,'en_US','name','Copyeditor','string'),(6,'fr_CA','abbrev','R??V','string'),(6,'fr_CA','name','R??viseur-e','string'),(7,'','abbrevLocaleKey','default.groups.abbrev.designer','string'),(7,'','nameLocaleKey','default.groups.name.designer','string'),(7,'en_US','abbrev','Design','string'),(7,'en_US','name','Designer','string'),(7,'fr_CA','abbrev','Design','string'),(7,'fr_CA','name','Designer','string'),(8,'','abbrevLocaleKey','default.groups.abbrev.funding','string'),(8,'','nameLocaleKey','default.groups.name.funding','string'),(8,'en_US','abbrev','FC','string'),(8,'en_US','name','Funding coordinator','string'),(8,'fr_CA','abbrev','CF','string'),(8,'fr_CA','name','Coordonnateur-trice du financement','string'),(9,'','abbrevLocaleKey','default.groups.abbrev.indexer','string'),(9,'','nameLocaleKey','default.groups.name.indexer','string'),(9,'en_US','abbrev','IND','string'),(9,'en_US','name','Indexer','string'),(9,'fr_CA','abbrev','Indx','string'),(9,'fr_CA','name','Indexeur-e','string'),(10,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor','string'),(10,'','nameLocaleKey','default.groups.name.layoutEditor','string'),(10,'en_US','abbrev','LE','string'),(10,'en_US','name','Layout Editor','string'),(10,'fr_CA','abbrev','RespMP','string'),(10,'fr_CA','name','Responsable de la mise en page','string'),(11,'','abbrevLocaleKey','default.groups.abbrev.marketing','string'),(11,'','nameLocaleKey','default.groups.name.marketing','string'),(11,'en_US','abbrev','MS','string'),(11,'en_US','name','Marketing and sales coordinator','string'),(11,'fr_CA','abbrev','CVM','string'),(11,'fr_CA','name','Coordonnateur-trice des ventes et du marketing','string'),(12,'','abbrevLocaleKey','default.groups.abbrev.proofreader','string'),(12,'','nameLocaleKey','default.groups.name.proofreader','string'),(12,'en_US','abbrev','PR','string'),(12,'en_US','name','Proofreader','string'),(12,'fr_CA','abbrev','CorEp','string'),(12,'fr_CA','name','Correcteur-trice d\'??preuves','string'),(13,'','abbrevLocaleKey','default.groups.abbrev.author','string'),(13,'','nameLocaleKey','default.groups.name.author','string'),(13,'en_US','abbrev','AU','string'),(13,'en_US','name','Author','string'),(13,'fr_CA','abbrev','AU','string'),(13,'fr_CA','name','Auteur-e','string'),(14,'','abbrevLocaleKey','default.groups.abbrev.volumeEditor','string'),(14,'','nameLocaleKey','default.groups.name.volumeEditor','string'),(14,'','recommendOnly','0','bool'),(14,'en_US','abbrev','VE','string'),(14,'en_US','name','Volume editor','string'),(14,'fr_CA','abbrev','RV','string'),(14,'fr_CA','name','R??dacteur/R??dactrice en chef du volume','string'),(15,'','abbrevLocaleKey','default.groups.abbrev.chapterAuthor','string'),(15,'','nameLocaleKey','default.groups.name.chapterAuthor','string'),(15,'en_US','abbrev','CA','string'),(15,'en_US','name','Chapter Author','string'),(15,'fr_CA','abbrev','AC','string'),(15,'fr_CA','name','Auteur du chapitre','string'),(16,'','abbrevLocaleKey','default.groups.abbrev.translator','string'),(16,'','nameLocaleKey','default.groups.name.translator','string'),(16,'en_US','abbrev','Trans','string'),(16,'en_US','name','Translator','string'),(16,'fr_CA','abbrev','Trad','string'),(16,'fr_CA','name','Traducteur-trice','string'),(17,'','abbrevLocaleKey','default.groups.abbrev.internalReviewer','string'),(17,'','nameLocaleKey','default.groups.name.internalReviewer','string'),(17,'en_US','abbrev','IR','string'),(17,'en_US','name','Internal Reviewer','string'),(17,'fr_CA','abbrev','EvalInt','string'),(17,'fr_CA','name','??valuateur-trice interne','string'),(18,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer','string'),(18,'','nameLocaleKey','default.groups.name.externalReviewer','string'),(18,'en_US','abbrev','ER','string'),(18,'en_US','name','External Reviewer','string'),(18,'fr_CA','abbrev','EvEx','string'),(18,'fr_CA','name','??valuateur-trice externe','string'),(19,'','abbrevLocaleKey','default.groups.abbrev.reader','string'),(19,'','nameLocaleKey','default.groups.name.reader','string'),(19,'en_US','abbrev','Read','string'),(19,'en_US','name','Reader','string'),(19,'fr_CA','abbrev','Lect','string'),(19,'fr_CA','name','Lecteur-trice','string');
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
INSERT INTO `user_settings` VALUES (1,'en_US','familyName','admin'),(1,'en_US','givenName','admin'),(2,'','orcid',''),(2,'en_US','affiliation','Universidad Nacional Aut??noma de M??xico'),(2,'en_US','biography',''),(2,'en_US','familyName','Vaca'),(2,'en_US','givenName','Ramiro'),(2,'en_US','preferredPublicName',''),(2,'en_US','signature',''),(2,'fr_CA','affiliation',''),(2,'fr_CA','biography',''),(2,'fr_CA','familyName',''),(2,'fr_CA','givenName',''),(2,'fr_CA','preferredPublicName',''),(2,'fr_CA','signature',''),(3,'','orcid',''),(3,'en_US','affiliation','University of Melbourne'),(3,'en_US','biography',''),(3,'en_US','familyName','Barnes'),(3,'en_US','givenName','Daniel'),(3,'en_US','preferredPublicName',''),(3,'en_US','signature',''),(3,'fr_CA','affiliation',''),(3,'fr_CA','biography',''),(3,'fr_CA','familyName',''),(3,'fr_CA','givenName',''),(3,'fr_CA','preferredPublicName',''),(3,'fr_CA','signature',''),(4,'','orcid',''),(4,'en_US','affiliation','University of Chicago'),(4,'en_US','biography',''),(4,'en_US','familyName','Buskins'),(4,'en_US','givenName','David'),(4,'en_US','preferredPublicName',''),(4,'en_US','signature',''),(4,'fr_CA','affiliation',''),(4,'fr_CA','biography',''),(4,'fr_CA','familyName',''),(4,'fr_CA','givenName',''),(4,'fr_CA','preferredPublicName',''),(4,'fr_CA','signature',''),(5,'','orcid',''),(5,'en_US','affiliation','University of Toronto'),(5,'en_US','biography',''),(5,'en_US','familyName','Berardo'),(5,'en_US','givenName','Stephanie'),(5,'en_US','preferredPublicName',''),(5,'en_US','signature',''),(5,'fr_CA','affiliation',''),(5,'fr_CA','biography',''),(5,'fr_CA','familyName',''),(5,'fr_CA','givenName',''),(5,'fr_CA','preferredPublicName',''),(5,'fr_CA','signature',''),(6,'','orcid',''),(6,'en_US','affiliation','Kyoto University'),(6,'en_US','biography',''),(6,'en_US','familyName','Inoue'),(6,'en_US','givenName','Minoti'),(6,'en_US','preferredPublicName',''),(6,'en_US','signature',''),(6,'fr_CA','affiliation',''),(6,'fr_CA','biography',''),(6,'fr_CA','familyName',''),(6,'fr_CA','givenName',''),(6,'fr_CA','preferredPublicName',''),(6,'fr_CA','signature',''),(7,'','orcid',''),(7,'en_US','affiliation','Utrecht University'),(7,'en_US','biography',''),(7,'en_US','familyName','Janssen'),(7,'en_US','givenName','Julie'),(7,'en_US','preferredPublicName',''),(7,'en_US','signature',''),(7,'fr_CA','affiliation',''),(7,'fr_CA','biography',''),(7,'fr_CA','familyName',''),(7,'fr_CA','givenName',''),(7,'fr_CA','preferredPublicName',''),(7,'fr_CA','signature',''),(8,'','orcid',''),(8,'en_US','affiliation','McGill University'),(8,'en_US','biography',''),(8,'en_US','familyName','Hudson'),(8,'en_US','givenName','Paul'),(8,'en_US','preferredPublicName',''),(8,'en_US','signature',''),(8,'fr_CA','affiliation',''),(8,'fr_CA','biography',''),(8,'fr_CA','familyName',''),(8,'fr_CA','givenName',''),(8,'fr_CA','preferredPublicName',''),(8,'fr_CA','signature',''),(9,'','orcid',''),(9,'en_US','affiliation','University of Manitoba'),(9,'en_US','biography',''),(9,'en_US','familyName','McCrae'),(9,'en_US','givenName','Aisla'),(9,'en_US','preferredPublicName',''),(9,'en_US','signature',''),(9,'fr_CA','affiliation',''),(9,'fr_CA','biography',''),(9,'fr_CA','familyName',''),(9,'fr_CA','givenName',''),(9,'fr_CA','preferredPublicName',''),(9,'fr_CA','signature',''),(10,'','orcid',''),(10,'en_US','affiliation','State University of New York'),(10,'en_US','biography',''),(10,'en_US','familyName','Gallego'),(10,'en_US','givenName','Adela'),(10,'en_US','preferredPublicName',''),(10,'en_US','signature',''),(10,'fr_CA','affiliation',''),(10,'fr_CA','biography',''),(10,'fr_CA','familyName',''),(10,'fr_CA','givenName',''),(10,'fr_CA','preferredPublicName',''),(10,'fr_CA','signature',''),(11,'','orcid',''),(11,'en_US','affiliation','KNUST'),(11,'en_US','biography',''),(11,'en_US','familyName','Zacharia'),(11,'en_US','givenName','Al'),(11,'en_US','preferredPublicName',''),(11,'en_US','signature',''),(11,'fr_CA','affiliation',''),(11,'fr_CA','biography',''),(11,'fr_CA','familyName',''),(11,'fr_CA','givenName',''),(11,'fr_CA','preferredPublicName',''),(11,'fr_CA','signature',''),(12,'','orcid',''),(12,'en_US','affiliation','Madrid'),(12,'en_US','biography',''),(12,'en_US','familyName','Favio'),(12,'en_US','givenName','Gonzalo'),(12,'en_US','preferredPublicName',''),(12,'en_US','signature',''),(12,'fr_CA','affiliation',''),(12,'fr_CA','biography',''),(12,'fr_CA','familyName',''),(12,'fr_CA','givenName',''),(12,'fr_CA','preferredPublicName',''),(12,'fr_CA','signature',''),(13,'','orcid',''),(13,'en_US','affiliation','Ghent University'),(13,'en_US','biography',''),(13,'en_US','familyName','Fritz'),(13,'en_US','givenName','Maria'),(13,'en_US','preferredPublicName',''),(13,'en_US','signature',''),(13,'fr_CA','affiliation',''),(13,'fr_CA','biography',''),(13,'fr_CA','familyName',''),(13,'fr_CA','givenName',''),(13,'fr_CA','preferredPublicName',''),(13,'fr_CA','signature',''),(14,'','orcid',''),(14,'en_US','affiliation','Universidad de Chile'),(14,'en_US','biography',''),(14,'en_US','familyName','Vogt'),(14,'en_US','givenName','Sarah'),(14,'en_US','preferredPublicName',''),(14,'en_US','signature',''),(14,'fr_CA','affiliation',''),(14,'fr_CA','biography',''),(14,'fr_CA','familyName',''),(14,'fr_CA','givenName',''),(14,'fr_CA','preferredPublicName',''),(14,'fr_CA','signature',''),(15,'','orcid',''),(15,'en_US','affiliation','Duke University'),(15,'en_US','biography',''),(15,'en_US','familyName','Cox'),(15,'en_US','givenName','Graham'),(15,'en_US','preferredPublicName',''),(15,'en_US','signature',''),(15,'fr_CA','affiliation',''),(15,'fr_CA','biography',''),(15,'fr_CA','familyName',''),(15,'fr_CA','givenName',''),(15,'fr_CA','preferredPublicName',''),(15,'fr_CA','signature',''),(16,'','orcid',''),(16,'en_US','affiliation','University of Cape Town'),(16,'en_US','biography',''),(16,'en_US','familyName','Hellier'),(16,'en_US','givenName','Stephen'),(16,'en_US','preferredPublicName',''),(16,'en_US','signature',''),(16,'fr_CA','affiliation',''),(16,'fr_CA','biography',''),(16,'fr_CA','familyName',''),(16,'fr_CA','givenName',''),(16,'fr_CA','preferredPublicName',''),(16,'fr_CA','signature',''),(17,'','orcid',''),(17,'en_US','affiliation','Imperial College London'),(17,'en_US','biography',''),(17,'en_US','familyName','Turner'),(17,'en_US','givenName','Catherine'),(17,'en_US','preferredPublicName',''),(17,'en_US','signature',''),(17,'fr_CA','affiliation',''),(17,'fr_CA','biography',''),(17,'fr_CA','familyName',''),(17,'fr_CA','givenName',''),(17,'fr_CA','preferredPublicName',''),(17,'fr_CA','signature',''),(18,'','orcid',''),(18,'en_US','affiliation','National University of Singapore'),(18,'en_US','biography',''),(18,'en_US','familyName','Kumar'),(18,'en_US','givenName','Sabine'),(18,'en_US','preferredPublicName',''),(18,'en_US','signature',''),(18,'fr_CA','affiliation',''),(18,'fr_CA','biography',''),(18,'fr_CA','familyName',''),(18,'fr_CA','givenName',''),(18,'fr_CA','preferredPublicName',''),(18,'fr_CA','signature',''),(19,'en_US','affiliation','University of Calgary'),(19,'en_US','familyName','Clark'),(19,'en_US','givenName','Arthur'),(20,'en_US','affiliation','Athabasca University'),(20,'en_US','familyName','Finkel'),(20,'en_US','givenName','Alvin'),(21,'en_US','affiliation','Athabasca University'),(21,'en_US','familyName','Barnetson'),(21,'en_US','givenName','Bob'),(22,'en_US','affiliation','University of British Columbia'),(22,'en_US','familyName','Beaty'),(22,'en_US','givenName','Bart'),(23,'en_US','affiliation','University of Southern California'),(23,'en_US','familyName','Allan'),(23,'en_US','givenName','Chantal'),(24,'en_US','affiliation','SUNY'),(24,'en_US','familyName','Bernnard'),(24,'en_US','givenName','Deborah'),(25,'en_US','affiliation','Athabasca University'),(25,'en_US','familyName','Kennepohl'),(25,'en_US','givenName','Dietmar'),(26,'en_US','affiliation','University of Sussex'),(26,'en_US','familyName','Perini'),(26,'en_US','givenName','Fernando'),(27,'en_US','affiliation','Buffalo National Park Foundation'),(27,'en_US','familyName','Brower'),(27,'en_US','givenName','Jennifer'),(28,'en_US','affiliation','University of Alberta'),(28,'en_US','familyName','Locke Hart'),(28,'en_US','givenName','Jonathan'),(29,'en_US','affiliation','International Development Research Centre'),(29,'en_US','familyName','Elder'),(29,'en_US','givenName','Laurent'),(30,'en_US','affiliation','Athabasca University'),(30,'en_US','familyName','Ally'),(30,'en_US','givenName','Mohamed'),(31,'en_US','affiliation','University of Alberta'),(31,'en_US','familyName','Dawson'),(31,'en_US','givenName','Michael'),(32,'en_US','affiliation','University of Calgary'),(32,'en_US','familyName','Foran'),(32,'en_US','givenName','Max'),(33,'en_US','affiliation','London School of Economics'),(33,'en_US','familyName','Power'),(33,'en_US','givenName','Michael'),(34,'en_US','affiliation','International Development Research Centre'),(34,'en_US','familyName','Smith'),(34,'en_US','givenName','Matthew');
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
INSERT INTO `users` VALUES (1,'admin','$2y$10$75XZ3ukWAI0BdVZXYCjT6.l7Xk05odinRbaK8s6v9AW.pFwSAz5bu','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-06-21 20:59:16',NULL,'2022-06-21 21:06:42',NULL,NULL,NULL,0,NULL,1),(2,'rvaca','$2y$10$hKrDLgDirISqSwIfTJwlsOiRoLm6xrJ/x2t96EImowLv1gwq.i/n2','rvaca@mailinator.com','','','',NULL,'MX','[]',NULL,NULL,'2022-06-21 21:00:26',NULL,'2022-06-21 21:06:09',0,0,NULL,0,NULL,1),(3,'dbarnes','$2y$10$4F04Zpl2CtEfpjX/CJIzSupHYX/H3XWqyuV9PJq1220sB2zugOKSS','dbarnes@mailinator.com','','','',NULL,'AU','[]',NULL,NULL,'2022-06-21 21:00:33',NULL,'2022-06-21 21:44:40',0,0,NULL,0,NULL,1),(4,'dbuskins','$2y$10$XE/J.9UjqVyVMP74AfSun.fpNcOzLe/.zeQHDioxRnyi8oyNjFsJ6','dbuskins@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2022-06-21 21:00:46',NULL,NULL,0,0,NULL,0,NULL,1),(5,'sberardo','$2y$10$800ZxOxMFzcEZN2dKZT9TOeb2ZpAWztT3uFNczC02aPnnLC/x2n9y','sberardo@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2022-06-21 21:00:57',NULL,NULL,0,0,NULL,0,NULL,1),(6,'minoue','$2y$10$s79.jT4S.A203so0JMbm0ucGt3JdPDz/ErUkGTQMb5865U9aNhWWW','minoue@mailinator.com','','','',NULL,'JP','[]',NULL,NULL,'2022-06-21 21:01:09',NULL,'2022-06-21 21:19:51',0,0,NULL,0,NULL,1),(7,'jjanssen','$2y$10$qMenRgygHxG7aDbhL8EpOu36qeTsHq6WiOBe.lHib4KdUkHXd35Te','jjanssen@mailinator.com','','','',NULL,'NL','[]',NULL,NULL,'2022-06-21 21:01:23',NULL,NULL,0,0,NULL,0,NULL,1),(8,'phudson','$2y$10$9Op/i/uoNiFxYpciBArSaOLXMP8.pvxPg4bZSqLzNstP2sR.MwTBa','phudson@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2022-06-21 21:01:38',NULL,'2022-06-21 21:31:33',0,0,NULL,0,NULL,1),(9,'amccrae','$2y$10$Z5rMWibFxVLKwILH0HTMDugHc1wjKgfLBrdtfouB2zEq0YeZo3eJS','amccrae@mailinator.com','','','',NULL,'CA','[]',NULL,NULL,'2022-06-21 21:01:55',NULL,NULL,0,0,NULL,0,NULL,1),(10,'agallego','$2y$10$4pm5.Ai42h/a7cFAPpEEy.jqW3btKPeacsOTYt7kmpnnrnkg6Sgra','agallego@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2022-06-21 21:02:15',NULL,'2022-06-21 21:41:47',0,0,NULL,0,NULL,1),(11,'alzacharia','$2y$10$9h3hL8VyqVtUXVixtT7.HerGdNd6YeTwWnqk3T9pEI17x5V2f.Syq','alzacharia@mailinator.com','','','',NULL,'GH','[]',NULL,NULL,'2022-06-21 21:02:37',NULL,NULL,0,0,NULL,0,NULL,1),(12,'gfavio','$2y$10$pgmfyC8zhHofn2SKDYpPPO.fX6rDYr8xQ5KcAig/lxTcRPCKOaWba','gfavio@mailinator.com','','','',NULL,'ES','[]',NULL,NULL,'2022-06-21 21:02:58',NULL,'2022-06-21 21:34:19',0,0,NULL,0,NULL,1),(13,'mfritz','$2y$10$XbSUKopmc.M7JmmvakKGv.dvYv257/fHAucQ1PGPROPac6W9kPIFe','mfritz@mailinator.com','','','',NULL,'BE','[]',NULL,NULL,'2022-06-21 21:03:20',NULL,NULL,0,0,NULL,0,NULL,1),(14,'svogt','$2y$10$EMIxbxJdIbzI35Urpqy1je6vrqwH94VGfKba6s2L7xGsieFpAJ.Ui','svogt@mailinator.com','','','',NULL,'CL','[]',NULL,NULL,'2022-06-21 21:03:44',NULL,NULL,0,0,NULL,0,NULL,1),(15,'gcox','$2y$10$QJrTesjdmIIaS0Kn1BPmZ.LJ4bDF8ta36f491jggcBYkHmItPEhVS','gcox@mailinator.com','','','',NULL,'US','[]',NULL,NULL,'2022-06-21 21:04:08',NULL,NULL,0,0,NULL,0,NULL,1),(16,'shellier','$2y$10$xDwl6HO0BRNRodODLa.4Pe7pVR6t8tzFILa39bcIvnWK.wMMP00Zm','shellier@mailinator.com','','','',NULL,'ZA','[]',NULL,NULL,'2022-06-21 21:04:39',NULL,NULL,0,0,NULL,0,NULL,1),(17,'cturner','$2y$10$IdeF0ZZSjrYe.R2wgpLhPuNLkj6x6iXvpZwH4z9PbH7Xv5zBL8K7G','cturner@mailinator.com','','','',NULL,'GB','[]',NULL,NULL,'2022-06-21 21:05:13',NULL,NULL,0,0,NULL,0,NULL,1),(18,'skumar','$2y$10$Wfu2OWAxTJhgb34aMi2.IO27XMtxCHCJiziUMs63tlFkaPX3deKQe','skumar@mailinator.com','','','',NULL,'SG','[]',NULL,NULL,'2022-06-21 21:05:49',NULL,NULL,0,0,NULL,0,NULL,1),(19,'aclark','$2y$10$xK9yOZjNFfZJD4/otyJQB.xZQPnYGSz4sqKEIWTpPOm/nCL4Bs3CG','aclark@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-06-21 21:07:05',NULL,'2022-06-21 21:07:06',NULL,NULL,NULL,0,NULL,1),(20,'afinkel','$2y$10$8Lk7beZu25QhG9XQdKRYl.g9U04cLkODSLCtS3xUeUOtP9ntvGF5y','afinkel@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-06-21 21:08:15',NULL,'2022-06-21 21:08:16',NULL,NULL,NULL,0,NULL,1),(21,'bbarnetson','$2y$10$99rIw2j4YNimV9ube8cUwOo30dbt8qhxEPOqhQbHKXLDhOGCxLW0y','bbarnetson@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-06-21 21:11:01',NULL,'2022-06-21 21:11:01',NULL,NULL,NULL,0,NULL,1),(22,'bbeaty','$2y$10$lgUjLfAW4eGNpThgjI1.h.hu9hDkANgr3UoRD1lYZ2TAJro2btbSC','bbeaty@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-06-21 21:11:50',NULL,'2022-06-21 21:11:50',NULL,NULL,NULL,0,NULL,1),(23,'callan','$2y$10$ZM7/QA60Ew6xs46./xS0GexkU01rmT.ekxfwg9IIZ0dwwaD3qUcZa','callan@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-06-21 21:15:25',NULL,'2022-06-21 21:15:26',NULL,NULL,NULL,0,NULL,1),(24,'dbernnard','$2y$10$Do85iQIJpsFEUb9vxjhfv.k9rBGsfVnaUGSdNyI3XVHHfaSCY7jGG','dbernnard@mailinator.com',NULL,NULL,NULL,NULL,'US',NULL,NULL,NULL,'2022-06-21 21:18:11',NULL,'2022-06-21 21:18:11',NULL,NULL,NULL,0,NULL,1),(25,'dkennepohl','$2y$10$uQlk.9vzIZ.pnxaSLDtrNOodV4HzmxXjAEjkS0Q71GXsBSzX9TfN.','dkennepohl@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-06-21 21:20:31',NULL,'2022-06-21 21:20:31',NULL,NULL,NULL,0,NULL,1),(26,'fperini','$2y$10$pni6w2nZKvVbxEAgrx19SutU2Le2r.tte9WKYykswbAt9I4oBUV3.','fperini@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-06-21 21:23:41',NULL,'2022-06-21 21:23:41',NULL,NULL,NULL,0,NULL,1),(27,'jbrower','$2y$10$UlqK2OVSj70XhnpLmvrfX.pteCrC4qVQrtMleeUme6PnX6CTBn6qO','jbrower@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-06-21 21:25:54',NULL,'2022-06-21 21:25:55',NULL,NULL,NULL,0,NULL,1),(28,'jlockehart','$2y$10$atmmE/6x1l4.RKJ/IrFyYOKo6rVMIsV858gTsnqmXeAe2cUJ7Lt1m','jlockehart@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-06-21 21:27:05',NULL,'2022-06-21 21:27:05',NULL,NULL,NULL,0,NULL,1),(29,'lelder','$2y$10$ce2ZlNRQYl8RMi9hvJGnA.gPzTkx.51Ui972oxKDfyrUjeo4n20Va','lelder@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-06-21 21:29:07',NULL,'2022-06-21 21:29:07',NULL,NULL,NULL,0,NULL,1),(30,'mally','$2y$10$s8zs7xgYp9o2ts3EGxmDFubS.pYdH.2IhlBnI3fccN.B4vsLumzpq','mally@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-06-21 21:31:53',NULL,'2022-06-21 21:31:53',NULL,NULL,NULL,0,NULL,1),(31,'mdawson','$2y$10$yXq72ANOPJLWTvXRvJ5U0.0o9ofpsuI6jlAHoKLGK4KrAkZGB/QBC','mdawson@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-06-21 21:35:10',NULL,'2022-06-21 21:35:11',NULL,NULL,NULL,0,NULL,1),(32,'mforan','$2y$10$0dNULb4TSsUaKpd7AoeTNO/YCB7zJYebymsXyRaWAMA8MOQ1mKh8a','mforan@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-06-21 21:39:37',NULL,'2022-06-21 21:39:37',NULL,NULL,NULL,0,NULL,1),(33,'mpower','$2y$10$zJ1ToxCF9JjylhZeWYfSPurl3urv.wfaWWLO.Webz/WC/TMmwlo0W','mpower@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-06-21 21:40:28',NULL,'2022-06-21 21:40:29',NULL,NULL,NULL,0,NULL,1),(34,'msmith','$2y$10$paftTNfkyOAWLt9V7JfsKu0jtw.WK1mir09RMuXODLsxbgcKpwil2','msmith@mailinator.com',NULL,NULL,NULL,NULL,'CA',NULL,NULL,NULL,'2022-06-21 21:42:05',NULL,'2022-06-21 21:42:05',NULL,NULL,NULL,0,NULL,1);
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
INSERT INTO `versions` VALUES (1,0,0,0,'2022-06-21 20:59:16',1,'plugins.metadata','dc11','',0,0),(1,0,0,0,'2022-06-21 20:59:16',1,'plugins.pubIds','urn','URNPubIdPlugin',0,0),(1,0,0,0,'2022-06-21 20:59:16',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(1,0,0,0,'2022-06-21 20:59:16',1,'plugins.blocks','browse','\\APP\\plugins\\blocks\\browse\\BrowseBlockPlugin',1,0),(1,0,0,0,'2022-06-21 20:59:16',1,'plugins.blocks','information','InformationBlockPlugin',1,0),(1,0,0,0,'2022-06-21 20:59:16',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,0,0,0,'2022-06-21 20:59:16',1,'plugins.blocks','makeSubmission','MakeSubmissionBlockPlugin',1,0),(1,0,0,0,'2022-06-21 20:59:16',1,'plugins.generic','usageStats','UsageStatsPlugin',0,1),(1,2,0,0,'2022-06-21 20:59:16',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),(1,0,0,0,'2022-06-21 20:59:16',1,'plugins.generic','dublinCoreMeta','DublinCoreMetaPlugin',1,0),(1,0,0,0,'2022-06-21 20:59:16',1,'plugins.generic','acron','',0,1),(1,0,0,0,'2022-06-21 20:59:16',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(1,0,0,0,'2022-06-21 20:59:16',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(1,2,0,0,'2022-06-21 20:59:16',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(1,0,0,0,'2022-06-21 20:59:16',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(1,0,0,0,'2022-06-21 20:59:16',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,0,0,0,'2022-06-21 20:59:16',1,'plugins.generic','usageEvent','',0,1),(1,0,0,0,'2022-06-21 20:59:16',1,'plugins.generic','htmlMonographFile','HtmlMonographFilePlugin',1,0),(1,0,0,0,'2022-06-21 20:59:16',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(1,0,0,0,'2022-06-21 20:59:16',1,'plugins.themes','default','DefaultThemePlugin',1,0),(1,0,0,0,'2022-06-21 20:59:16',1,'plugins.importexport','csv','',0,0),(1,0,0,0,'2022-06-21 20:59:16',1,'plugins.importexport','native','',0,0),(1,0,0,0,'2022-06-21 20:59:16',1,'plugins.importexport','onix30','',0,0),(1,0,0,0,'2022-06-21 20:59:16',1,'plugins.importexport','users','',0,0),(1,0,0,0,'2022-06-21 20:59:16',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,0,0,0,'2022-06-21 20:59:16',1,'plugins.paymethod','manual','',0,0),(1,0,0,0,'2022-06-21 20:59:16',1,'plugins.paymethod','paypal','',0,0),(3,4,0,0,'2022-06-21 20:59:13',1,'core','omp','',0,1);
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

-- Dump completed on 2022-06-21 21:45:34
