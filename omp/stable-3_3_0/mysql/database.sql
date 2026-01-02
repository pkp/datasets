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
  KEY `access_keys_hash` (`key_hash`,`user_id`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `announcement_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) DEFAULT NULL,
  UNIQUE KEY `announcement_settings_pkey` (`announcement_id`,`locale`,`setting_name`),
  KEY `announcement_settings_announcement_id` (`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `type_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `announcement_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `announcement_type_settings_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `assoc_type` smallint NOT NULL,
  `assoc_id` bigint NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `announcement_types_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  KEY `announcements_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_sources` (
  `auth_id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `plugin` varchar(32) NOT NULL,
  `auth_default` smallint NOT NULL DEFAULT '0',
  `settings` text,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_settings` (
  `author_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  UNIQUE KEY `author_settings_pkey` (`author_id`,`locale`,`setting_name`),
  KEY `author_settings_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `author_id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `include_in_browse` smallint NOT NULL DEFAULT '1',
  `publication_id` bigint NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  `user_group_id` bigint DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  KEY `authors_publication_id` (`publication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `parent_id` bigint NOT NULL,
  `seq` bigint DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `image` text,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_path` (`context_id`,`path`),
  KEY `category_context_id` (`context_id`,`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_settings`
--

DROP TABLE IF EXISTS `category_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_settings` (
  `category_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `category_settings_pkey` (`category_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_settings`
--

LOCK TABLES `category_settings` WRITE;
/*!40000 ALTER TABLE `category_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citation_settings`
--

DROP TABLE IF EXISTS `citation_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citation_settings` (
  `citation_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `citation_settings_pkey` (`citation_id`,`locale`,`setting_name`),
  KEY `citation_settings_citation_id` (`citation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `publication_id` bigint NOT NULL DEFAULT '0',
  `raw_citation` text NOT NULL,
  `seq` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`citation_id`),
  UNIQUE KEY `citations_publication_seq` (`publication_id`,`seq`),
  KEY `citations_publication` (`publication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  PRIMARY KEY (`completed_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlled_vocabs` (
  `controlled_vocab_id` bigint NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(64) NOT NULL,
  `assoc_type` bigint NOT NULL DEFAULT '0',
  `assoc_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`controlled_vocab_id`),
  UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb3;
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
  KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
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
  `tombstone_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `data_object_tombstone_settings_pkey` (`tombstone_id`,`locale`,`setting_name`),
  KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstones`
--

LOCK TABLES `data_object_tombstones` WRITE;
/*!40000 ALTER TABLE `data_object_tombstones` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstones` ENABLE KEYS */;
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
  `review_round_id` bigint NOT NULL,
  `stage_id` bigint DEFAULT NULL,
  `round` smallint NOT NULL,
  `editor_id` bigint NOT NULL,
  `decision` smallint NOT NULL,
  `date_decided` datetime NOT NULL,
  PRIMARY KEY (`edit_decision_id`),
  KEY `edit_decisions_submission_id` (`submission_id`),
  KEY `edit_decisions_editor_id` (`editor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
INSERT INTO `edit_decisions` VALUES (1,1,0,1,0,3,3,'2026-01-02 05:19:20'),(2,1,1,3,1,3,2,'2026-01-02 05:19:26'),(3,2,0,1,0,3,3,'2026-01-02 05:20:26'),(4,4,0,1,0,3,1,'2026-01-02 05:21:47'),(5,4,3,2,1,3,3,'2026-01-02 05:21:55'),(6,4,4,3,1,3,2,'2026-01-02 05:22:02'),(7,4,0,4,0,3,7,'2026-01-02 05:22:09'),(8,5,0,1,0,3,1,'2026-01-02 05:22:49'),(9,5,5,2,1,3,3,'2026-01-02 05:22:56'),(10,5,6,3,1,3,2,'2026-01-02 05:23:02'),(11,5,0,4,0,3,7,'2026-01-02 05:23:08'),(12,6,0,1,0,3,1,'2026-01-02 05:24:13'),(13,6,7,2,1,6,15,'2026-01-02 05:24:24'),(14,7,0,1,0,3,3,'2026-01-02 05:25:27'),(15,7,8,3,1,3,2,'2026-01-02 05:25:35'),(16,9,0,1,0,3,1,'2026-01-02 05:26:43'),(17,11,0,1,0,3,1,'2026-01-02 05:27:46'),(18,11,10,2,1,3,3,'2026-01-02 05:27:52'),(19,11,11,3,1,3,2,'2026-01-02 05:28:22'),(20,12,0,1,0,3,1,'2026-01-02 05:29:15'),(21,13,0,1,0,3,1,'2026-01-02 05:30:17'),(22,13,13,2,1,3,3,'2026-01-02 05:30:24'),(23,13,14,3,1,3,2,'2026-01-02 05:31:03'),(24,14,0,1,0,3,1,'2026-01-02 05:31:51'),(25,14,15,2,1,3,3,'2026-01-02 05:31:59'),(26,14,16,3,1,3,2,'2026-01-02 05:32:06'),(27,14,0,4,0,3,7,'2026-01-02 05:32:13'),(28,15,0,1,0,3,3,'2026-01-02 05:33:20'),(29,16,0,1,0,3,3,'2026-01-02 05:33:53'),(30,17,0,1,0,3,1,'2026-01-02 05:35:27');
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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
INSERT INTO `email_log` VALUES (1,1048585,1,19,'2026-01-02 05:19:15',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Arthur Clark:<br />\n<br />\nThank you for submitting the manuscript, &quot;The ABCs of Human Survival: A Paradigm for Global Citizenship&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/1\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/1</a><br />\nUsername: aclark<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(2,1048585,1,3,'2026-01-02 05:19:25',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Gonzalo Favio,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=1\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=1</a><br><br>Username: gfavio<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(3,1048585,1,3,'2026-01-02 05:19:26',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Arthur Clark\" <aclark@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Arthur Clark:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, \"The ABCs of Human Survival: A Paradigm for Global Citizenship\".<br><br>Our decision is to:<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/1\">http://localhost/index.php/publicknowledge/authorDashboard/submission/1</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(4,1048585,2,20,'2026-01-02 05:20:20',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Alvin Finkel\" <afinkel@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Alvin Finkel:<br />\n<br />\nThank you for submitting the manuscript, &quot;The West and Beyond: New Perspectives on an Imagined Region&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/2\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/2</a><br />\nUsername: afinkel<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(5,1048585,2,20,'2026-01-02 05:20:20',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Sarah Carter\" <scarter@mailinator.com>, \"Peter Fortna\" <pfortna@mailinator.com>, \"Gerald Friesen\" <gfriesen@mailinator.com>, \"Lyle Dick\" <ldick@mailinator.com>, \"Winona Wheeler\" <wwheeler@mailinator.com>, \"Matt Dyce\" <mdyce@mailinator.com>, \"James Opp\" <jopp@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Hello,<br />\n<br />\nAlvin Finkel has submitted the manuscript, &quot;The West and Beyond: New Perspectives on an Imagined Region&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(6,1048585,2,3,'2026-01-02 05:20:31',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Al Zacharia\" <alzacharia@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Al Zacharia,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=2\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=2</a><br><br>Username: alzacharia<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(7,1048585,2,3,'2026-01-02 05:20:36',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Gonzalo Favio,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=2\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=2</a><br><br>Username: gfavio<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(8,1048585,3,21,'2026-01-02 05:21:02',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Bob Barnetson\" <bbarnetson@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Bob Barnetson:<br />\n<br />\nThank you for submitting the manuscript, &quot;The Political Economy of Workplace Injury in Canada&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/3\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/3</a><br />\nUsername: bbarnetson<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(9,1048585,4,22,'2026-01-02 05:21:42',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Bart Beaty:<br />\n<br />\nThank you for submitting the manuscript, &quot;How Canadians Communicate: Contexts of Canadian Popular Culture&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/4\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/4</a><br />\nUsername: bbeaty<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(10,1048585,4,22,'2026-01-02 05:21:42',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Toby Miller\" <tmiller@mailinator.com>, \"Ira Wagman\" <awagman@mailinator.com>, \"Will Straw\" <wstraw@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Hello,<br />\n<br />\nBart Beaty has submitted the manuscript, &quot;How Canadians Communicate: Contexts of Canadian Popular Culture&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(11,1048585,4,3,'2026-01-02 05:21:53',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Aisla McCrae,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=4\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=4</a><br><br>Username: amccrae<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(12,1048585,4,3,'2026-01-02 05:21:55',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>, \"Toby Miller\" <tmiller@mailinator.com>, \"Ira Wagman\" <awagman@mailinator.com>, \"Will Straw\" <wstraw@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Bart Beaty; Toby Miller, Ira Wagman, Will Straw:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, \"How Canadians Communicate: Contexts of Canadian Popular Culture\".<br><br>Our decision is to:<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">http://localhost/index.php/publicknowledge/authorDashboard/submission/4</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(13,1048585,4,3,'2026-01-02 05:22:01',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Al Zacharia\" <alzacharia@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Al Zacharia,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=4\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=4</a><br><br>Username: alzacharia<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(14,1048585,4,3,'2026-01-02 05:22:02',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>, \"Toby Miller\" <tmiller@mailinator.com>, \"Ira Wagman\" <awagman@mailinator.com>, \"Will Straw\" <wstraw@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Bart Beaty; Toby Miller, Ira Wagman, Will Straw:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, \"How Canadians Communicate: Contexts of Canadian Popular Culture\".<br><br>Our decision is to:<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">http://localhost/index.php/publicknowledge/authorDashboard/submission/4</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(15,1048585,4,3,'2026-01-02 05:22:09',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Bart Beaty\" <bbeaty@mailinator.com>, \"Toby Miller\" <tmiller@mailinator.com>, \"Ira Wagman\" <awagman@mailinator.com>, \"Will Straw\" <wstraw@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Bart Beaty; Toby Miller, Ira Wagman, Will Straw:<br><br>The editing of your manuscript, \"How Canadians Communicate: Contexts of Canadian Popular Culture,\" is complete. We are now sending it to production.<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/4\">http://localhost/index.php/publicknowledge/authorDashboard/submission/4</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(16,1048585,5,23,'2026-01-02 05:22:44',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Chantal Allan:<br />\n<br />\nThank you for submitting the manuscript, &quot;Bomb Canada and Other Unkind Remarks in the American Media&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/5\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/5</a><br />\nUsername: callan<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(17,1048585,5,3,'2026-01-02 05:22:54',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Paul Hudson,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=5\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=5</a><br><br>Username: phudson<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(18,1048585,5,3,'2026-01-02 05:22:56',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Chantal Allan:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, \"Bomb Canada and Other Unkind Remarks in the American Media\".<br><br>Our decision is to:<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">http://localhost/index.php/publicknowledge/authorDashboard/submission/5</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(19,1048585,5,3,'2026-01-02 05:23:00',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Gonzalo Favio,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=5\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=5</a><br><br>Username: gfavio<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(20,1048585,5,3,'2026-01-02 05:23:02',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Chantal Allan:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, \"Bomb Canada and Other Unkind Remarks in the American Media\".<br><br>Our decision is to:<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">http://localhost/index.php/publicknowledge/authorDashboard/submission/5</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(21,1048585,5,3,'2026-01-02 05:23:08',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Chantal Allan\" <callan@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Chantal Allan:<br><br>The editing of your manuscript, \"Bomb Canada and Other Unkind Remarks in the American Media,\" is complete. We are now sending it to production.<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/5\">http://localhost/index.php/publicknowledge/authorDashboard/submission/5</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(22,1048585,6,24,'2026-01-02 05:24:07',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Deborah Bernnard\" <dbernnard@mailinator.com>',NULL,'dbuskins@mailinator.com','[JPK] Submission Acknowledgement','Deborah Bernnard:<br />\n<br />\nThank you for submitting the manuscript, &quot;The Information Literacy User’s Guide&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/6\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/6</a><br />\nUsername: dbernnard<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(23,1048585,6,24,'2026-01-02 05:24:07',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Greg Bobish\" <gbobish@mailinator.com>, \"Daryl Bullis\" <dbullis@mailinator.com>, \"Jenna Hecker\" <jhecker@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Hello,<br />\n<br />\nDeborah Bernnard has submitted the manuscript, &quot;The Information Literacy User’s Guide&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(24,1048585,6,6,'2026-01-02 05:24:24',805306372,'\"Minoti Inoue\" <minoue@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>, \"David Buskins\" <dbuskins@mailinator.com>',NULL,NULL,'[JPK] Editor Recommendation','<p>Daniel Barnes, David Buskins:<br><br>The recommendation regarding the submission to Public Knowledge Press, \"The Information Literacy User’s Guide\" is: Send to External Review</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(25,1048585,7,25,'2026-01-02 05:25:21',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Dietmar Kennepohl:<br />\n<br />\nThank you for submitting the manuscript, &quot;Accessible Elements: Teaching Science Online and at a Distance&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/7\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/7</a><br />\nUsername: dkennepohl<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(26,1048585,7,25,'2026-01-02 05:25:21',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Terry Anderson\" <tanderson@mailinator.com>, \"Paul Gorsky\" <pgorsky@mailinator.com>, \"Gale Parchoma\" <gparchoma@mailinator.com>, \"Stuart Palmer\" <spalmer@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Hello,<br />\n<br />\nDietmar Kennepohl has submitted the manuscript, &quot;Accessible Elements: Teaching Science Online and at a Distance&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(27,1048585,7,3,'2026-01-02 05:25:33',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Adela Gallego,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=7\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=7</a><br><br>Username: agallego<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(28,1048585,7,3,'2026-01-02 05:25:35',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Dietmar Kennepohl\" <dkennepohl@mailinator.com>, \"Terry Anderson\" <tanderson@mailinator.com>, \"Paul Gorsky\" <pgorsky@mailinator.com>, \"Gale Parchoma\" <gparchoma@mailinator.com>, \"Stuart Palmer\" <spalmer@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Dietmar Kennepohl; Terry Anderson, Paul Gorsky, Gale Parchoma, Stuart Palmer:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, \"Accessible Elements: Teaching Science Online and at a Distance\".<br><br>Our decision is to:<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/7\">http://localhost/index.php/publicknowledge/authorDashboard/submission/7</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(29,1048585,8,3,'2026-01-02 05:25:48',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Daniel Barnes:<br />\n<br />\nThank you for submitting the manuscript, &quot;Editorial&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/8\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/8</a><br />\nUsername: dbarnes<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(30,1048585,9,26,'2026-01-02 05:26:37',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Fernando Perini\" <fperini@mailinator.com>',NULL,'dbuskins@mailinator.com','[JPK] Submission Acknowledgement','Fernando Perini:<br />\n<br />\nThank you for submitting the manuscript, &quot;Enabling Openness: The future of the information society in Latin America and the Caribbean&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/9\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/9</a><br />\nUsername: fperini<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(31,1048585,9,26,'2026-01-02 05:26:37',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Robin Mansell\" <rmansell@mailinator.com>, \"Hernan Galperin\" <hgalperin@mailinator.com>, \"Pablo Bello\" <pbello@mailinator.com>, \"Eleonora Rabinovich\" <erabinovich@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Hello,<br />\n<br />\nFernando Perini has submitted the manuscript, &quot;Enabling Openness: The future of the information society in Latin America and the Caribbean&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(32,1048585,10,27,'2026-01-02 05:27:27',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Jennifer Brower\" <jbrower@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Jennifer Brower:<br />\n<br />\nThank you for submitting the manuscript, &quot;Lost Tracks: Buffalo National Park, 1909-1939&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/10\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/10</a><br />\nUsername: jbrower<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(33,1048585,11,28,'2026-01-02 05:27:42',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Jonathan Locke Hart:<br />\n<br />\nThank you for submitting the manuscript, &quot;Dreamwork&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/11\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/11</a><br />\nUsername: jlockehart<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(34,1048585,11,3,'2026-01-02 05:27:51',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Aisla McCrae,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=11\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=11</a><br><br>Username: amccrae<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(35,1048585,11,3,'2026-01-02 05:27:52',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Jonathan Locke Hart:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, \"Dreamwork\".<br><br>Our decision is to:<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/11\">http://localhost/index.php/publicknowledge/authorDashboard/submission/11</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(36,1048585,11,3,'2026-01-02 05:27:57',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Adela Gallego,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=11\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=11</a><br><br>Username: agallego<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(37,1048585,11,3,'2026-01-02 05:28:01',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Gonzalo Favio,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=11\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=11</a><br><br>Username: gfavio<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(38,1048585,11,10,'2026-01-02 05:28:04',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPK] Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Dreamwork,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2026-01-30, if not before.<br />\n<br />\nAdela Gallego<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(39,1048585,11,12,'2026-01-02 05:28:11',1073741829,'\"Gonzalo Favio\" <gfavio@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPK] Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Dreamwork,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2026-01-30, if not before.<br />\n<br />\nGonzalo Favio<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(40,1048585,11,3,'2026-01-02 05:28:22',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Jonathan Locke Hart\" <jlockehart@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Jonathan Locke Hart:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, \"Dreamwork\".<br><br>Our decision is to:<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/11\">http://localhost/index.php/publicknowledge/authorDashboard/submission/11</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(41,1048585,12,29,'2026-01-02 05:29:09',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Laurent Elder\" <lelder@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Laurent Elder:<br />\n<br />\nThank you for submitting the manuscript, &quot;Connecting ICTs to Development&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/12\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/12</a><br />\nUsername: lelder<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(42,1048585,12,29,'2026-01-02 05:29:09',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Frank Tulus\" <ftulus@mailinator.com>, \"Raymond Hyma\" <rhyma@mailinator.com>, \"John Valk\" <jvalk@mailinator.com>, \"Khaled Fourati\" <fkourati@mailinator.com>, \"Jeremy de Beer\" <jdebeer@mailinator.com>, \"Sara Bannerman\" <sbannerman@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Hello,<br />\n<br />\nLaurent Elder has submitted the manuscript, &quot;Connecting ICTs to Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(43,1048585,12,3,'2026-01-02 05:29:21',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Julie Janssen,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=12\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=12</a><br><br>Username: jjanssen<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(44,1048585,12,3,'2026-01-02 05:29:25',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Paul Hudson,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=12\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=12</a><br><br>Username: phudson<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(45,1048585,12,3,'2026-01-02 05:29:30',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Aisla McCrae\" <amccrae@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Aisla McCrae,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=12\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=12</a><br><br>Username: amccrae<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(46,1048585,12,8,'2026-01-02 05:29:35',1073741829,'\"Paul Hudson\" <phudson@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPK] Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Connecting ICTs to Development,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2026-01-30, if not before.<br />\n<br />\nPaul Hudson<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(47,1048585,13,30,'2026-01-02 05:30:11',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Mohamed Ally:<br />\n<br />\nThank you for submitting the manuscript, &quot;Mobile Learning: Transforming the Delivery of Education and Training&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/13\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/13</a><br />\nUsername: mally<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(48,1048585,13,30,'2026-01-02 05:30:11',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Traxler\" <jtraxler@mailinator.com>, \"Marguerite Koole\" <mkoole@mailinator.com>, \"Torstein Rekkedal\" <trekkedal@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Hello,<br />\n<br />\nMohamed Ally has submitted the manuscript, &quot;Mobile Learning: Transforming the Delivery of Education and Training&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(49,1048585,13,3,'2026-01-02 05:30:22',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Paul Hudson,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13</a><br><br>Username: phudson<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(50,1048585,13,3,'2026-01-02 05:30:24',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>, \"John Traxler\" <jtraxler@mailinator.com>, \"Marguerite Koole\" <mkoole@mailinator.com>, \"Torstein Rekkedal\" <trekkedal@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Mohamed Ally; John Traxler, Marguerite Koole, Torstein Rekkedal:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, \"Mobile Learning: Transforming the Delivery of Education and Training\".<br><br>Our decision is to:<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">http://localhost/index.php/publicknowledge/authorDashboard/submission/13</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(51,1048585,13,3,'2026-01-02 05:30:29',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Adela Gallego,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13</a><br><br>Username: agallego<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(52,1048585,13,3,'2026-01-02 05:30:34',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Al Zacharia\" <alzacharia@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Al Zacharia,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13</a><br><br>Username: alzacharia<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(53,1048585,13,3,'2026-01-02 05:30:38',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Gonzalo Favio,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=13</a><br><br>Username: gfavio<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(54,1048585,13,10,'2026-01-02 05:30:43',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPK] Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Mobile Learning: Transforming the Delivery of Education and Training,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2026-01-30, if not before.<br />\n<br />\nAdela Gallego<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(55,1048585,13,12,'2026-01-02 05:30:51',1073741829,'\"Gonzalo Favio\" <gfavio@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPK] Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;Mobile Learning: Transforming the Delivery of Education and Training,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2026-01-30, if not before.<br />\n<br />\nGonzalo Favio<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(56,1048585,13,3,'2026-01-02 05:31:04',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Mohamed Ally\" <mally@mailinator.com>, \"John Traxler\" <jtraxler@mailinator.com>, \"Marguerite Koole\" <mkoole@mailinator.com>, \"Torstein Rekkedal\" <trekkedal@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Mohamed Ally; John Traxler, Marguerite Koole, Torstein Rekkedal:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, \"Mobile Learning: Transforming the Delivery of Education and Training\".<br><br>Our decision is to:<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/13\">http://localhost/index.php/publicknowledge/authorDashboard/submission/13</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(57,1048585,14,31,'2026-01-02 05:31:44',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Michael Dawson:<br />\n<br />\nThank you for submitting the manuscript, &quot;From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/14\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/14</a><br />\nUsername: mdawson<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(58,1048585,14,31,'2026-01-02 05:31:44',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Brian Dupuis\" <bdupuis@mailinator.com>, \"Michael Wilson\" <mwilson@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Hello,<br />\n<br />\nMichael Dawson has submitted the manuscript, &quot;From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(59,1048585,14,3,'2026-01-02 05:31:57',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Julie Janssen,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=14\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=14</a><br><br>Username: jjanssen<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(60,1048585,14,3,'2026-01-02 05:31:59',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>, \"Brian Dupuis\" <bdupuis@mailinator.com>, \"Michael Wilson\" <mwilson@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Michael Dawson; Brian Dupuis, Michael Wilson:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, \"From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots\".<br><br>Our decision is to:<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">http://localhost/index.php/publicknowledge/authorDashboard/submission/14</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(61,1048585,14,3,'2026-01-02 05:32:04',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Al Zacharia\" <alzacharia@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Al Zacharia,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=14\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=14</a><br><br>Username: alzacharia<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(62,1048585,14,3,'2026-01-02 05:32:06',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>, \"Brian Dupuis\" <bdupuis@mailinator.com>, \"Michael Wilson\" <mwilson@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Michael Dawson; Brian Dupuis, Michael Wilson:<br><br>We have reached a decision regarding your submission to Public Knowledge Press, \"From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots\".<br><br>Our decision is to:<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">http://localhost/index.php/publicknowledge/authorDashboard/submission/14</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(63,1048585,14,3,'2026-01-02 05:32:13',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Michael Dawson\" <mdawson@mailinator.com>, \"Brian Dupuis\" <bdupuis@mailinator.com>, \"Michael Wilson\" <mwilson@mailinator.com>',NULL,NULL,'[JPK] Editor Decision','<p>Michael Dawson; Brian Dupuis, Michael Wilson:<br><br>The editing of your manuscript, \"From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots,\" is complete. We are now sending it to production.<br><br>Manuscript URL: <a class=\"submissionUrl-style-class\" href=\"http://localhost/index.php/publicknowledge/authorDashboard/submission/14\">http://localhost/index.php/publicknowledge/authorDashboard/submission/14</a></p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(64,1048585,15,32,'2026-01-02 05:33:14',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Max Foran\" <mforan@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Max Foran:<br />\n<br />\nThank you for submitting the manuscript, &quot;Expansive Discourses: Urban Sprawl in Calgary, 1945-1978&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/15\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/15</a><br />\nUsername: mforan<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(65,1048585,16,33,'2026-01-02 05:33:47',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Michael Power\" <mpower@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Michael Power:<br />\n<br />\nThank you for submitting the manuscript, &quot;A Designer\'s Log: Case Studies in Instructional Design&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/16\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/16</a><br />\nUsername: mpower<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(66,1048585,16,3,'2026-01-02 05:33:57',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Adela Gallego\" <agallego@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Adela Gallego,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=16\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=16</a><br><br>Username: agallego<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(67,1048585,16,3,'2026-01-02 05:34:01',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Al Zacharia\" <alzacharia@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Al Zacharia,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=16\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=16</a><br><br>Username: alzacharia<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(68,1048585,16,3,'2026-01-02 05:34:05',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Gonzalo Favio\" <gfavio@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Gonzalo Favio,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=16\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=16</a><br><br>Username: gfavio<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(69,1048585,16,10,'2026-01-02 05:34:09',1073741829,'\"Adela Gallego\" <agallego@mailinator.com>','\"Daniel Barnes\" <dbarnes@mailinator.com>',NULL,NULL,'[JPK] Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;A Designer\'s Log: Case Studies in Instructional Design,&quot; for Public Knowledge Press. Thank you for thinking of me, and I plan to have the review completed by its due date, 2026-01-30, if not before.<br />\n<br />\nAdela Gallego<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(70,1048585,17,34,'2026-01-02 05:35:18',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Matthew Smith\" <msmith@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Matthew Smith:<br />\n<br />\nThank you for submitting the manuscript, &quot;Open Development: Networked Innovations in International Development&quot; to Public Knowledge Press. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: <a href=\'http://localhost/index.php/publicknowledge/authorDashboard/submission/17\' class=\'submissionUrl-style-class\'>http://localhost/index.php/publicknowledge/authorDashboard/submission/17</a><br />\nUsername: msmith<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(71,1048585,17,34,'2026-01-02 05:35:19',NULL,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Yochai Benkler\" <ybenkler@mailinator.com>, \"Katherine Reilly\" <kreilly@mailinator.com>, \"Melissa Loudon\" <mloudon@mailinator.com>, \"Ulrike Rivett\" <urivett@mailinator.com>, \"Mark Graham\" <mgraham@mailinator.com>, \"Håvard Haarstad\" <hhaarstad@mailinator.com>, \"Marshall Smith\" <masmith@mailinator.com>',NULL,NULL,'[JPK] Submission Acknowledgement','Hello,<br />\n<br />\nMatthew Smith has submitted the manuscript, &quot;Open Development: Networked Innovations in International Development&quot; to Public Knowledge Press. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\nRamiro Vaca<br/>Public Knowledge Press<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(72,1048585,17,3,'2026-01-02 05:35:34',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Julie Janssen\" <jjanssen@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Julie Janssen,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=17\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=17</a><br><br>Username: jjanssen<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>'),(73,1048585,17,3,'2026-01-02 05:35:39',NULL,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Paul Hudson\" <phudson@mailinator.com>',NULL,NULL,'[JPK] Manuscript Review Request','<p>Dear Paul Hudson,<br><br>You have been selected as a potential reviewer of the following submission. Below is an overview of the submission, as well as the timeline for this review. We hope that you are able to participate.<br><br>Please log into the press web site by 2026-01-30 to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br><br>The review itself is due 2026-01-30.<br><br>Submission URL: <a href=\'http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=17\' class=\'submissionReviewUrl-style-class\'>http://localhost/index.php/publicknowledge/reviewer/submission?submissionId=17</a><br><br>Username: phudson<br><br>Thank you for considering this request.<br><br><br>Sincerely,<br>Daniel Barnes<br>University of Melbourne<br>dbarnes@mailinator.com</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>');
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log_users`
--

DROP TABLE IF EXISTS `email_log_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_log_users` (
  `email_log_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log_users`
--

LOCK TABLES `email_log_users` WRITE;
/*!40000 ALTER TABLE `email_log_users` DISABLE KEYS */;
INSERT INTO `email_log_users` VALUES (1,19),(2,12),(3,19),(4,20),(6,11),(7,12),(8,21),(9,22),(11,9),(12,22),(13,11),(14,22),(15,22),(16,23),(17,8),(18,23),(19,12),(20,23),(21,23),(22,24),(24,3),(24,4),(25,25),(27,10),(28,25),(29,3),(30,26),(32,27),(33,28),(34,9),(35,28),(36,10),(37,12),(38,3),(39,3),(40,28),(41,29),(43,7),(44,8),(45,9),(46,3),(47,30),(49,8),(50,30),(51,10),(52,11),(53,12),(54,3),(55,3),(56,30),(57,31),(59,7),(60,31),(61,11),(62,31),(63,31),(64,32),(65,33),(66,10),(67,11),(68,12),(69,3),(70,34),(72,7),(73,8);
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
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `context_id` bigint NOT NULL,
  `enabled` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email_templates_email_key` (`email_key`,`context_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates_default` (
  `email_id` bigint NOT NULL AUTO_INCREMENT,
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `can_disable` smallint NOT NULL DEFAULT '0',
  `can_edit` smallint NOT NULL DEFAULT '0',
  `from_role_id` bigint DEFAULT NULL,
  `to_role_id` bigint DEFAULT NULL,
  `stage_id` bigint DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  KEY `email_templates_default_email_key` (`email_key`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default`
--

LOCK TABLES `email_templates_default` WRITE;
/*!40000 ALTER TABLE `email_templates_default` DISABLE KEYS */;
INSERT INTO `email_templates_default` VALUES (1,'NOTIFICATION',0,1,NULL,NULL,NULL),(2,'NOTIFICATION_CENTER_DEFAULT',0,1,NULL,NULL,NULL),(3,'PASSWORD_RESET_CONFIRM',0,1,NULL,NULL,NULL),(4,'USER_REGISTER',0,1,NULL,NULL,NULL),(5,'USER_VALIDATE',0,1,NULL,NULL,NULL),(6,'REVIEWER_REGISTER',0,1,NULL,NULL,NULL),(7,'PUBLISH_NOTIFY',0,1,NULL,NULL,NULL),(8,'SUBMISSION_ACK',1,1,NULL,65536,1),(9,'SUBMISSION_ACK_NOT_USER',1,1,NULL,65536,1),(10,'EDITOR_ASSIGN',1,1,16,16,1),(11,'REVIEW_CANCEL',1,1,16,4096,3),(12,'REVIEW_REINSTATE',1,1,16,4096,3),(13,'REVIEW_REQUEST',1,1,16,4096,3),(14,'REVIEW_REQUEST_ONECLICK',1,1,16,4096,3),(15,'REVIEW_REQUEST_REMIND_AUTO',0,1,NULL,4096,3),(16,'REVIEW_REQUEST_REMIND_AUTO_ONECLICK',0,1,NULL,4096,3),(17,'REVIEW_REQUEST_ATTACHED',0,1,16,4096,3),(18,'REVIEW_CONFIRM',1,1,4096,16,3),(19,'REVIEW_DECLINE',1,1,4096,16,3),(20,'REVIEW_ACK',1,1,16,4096,3),(21,'REVIEW_REMIND',0,1,16,4096,3),(22,'REVIEW_REMIND_AUTO',0,1,NULL,4096,3),(23,'REVIEW_REMIND_ONECLICK',0,1,16,4096,3),(24,'REVIEW_REMIND_AUTO_ONECLICK',0,1,NULL,4096,3),(25,'EDITOR_DECISION_ACCEPT',0,1,16,65536,3),(26,'EDITOR_DECISION_SEND_TO_EXTERNAL',0,1,16,65536,3),(27,'EDITOR_DECISION_SEND_TO_PRODUCTION',0,1,16,65536,5),(28,'EDITOR_DECISION_REVISIONS',0,1,16,65536,3),(29,'EDITOR_DECISION_RESUBMIT',0,1,16,65536,3),(30,'EDITOR_DECISION_DECLINE',0,1,16,65536,3),(31,'EDITOR_DECISION_INITIAL_DECLINE',0,1,16,65536,1),(32,'EDITOR_RECOMMENDATION',0,1,16,16,3),(33,'COPYEDIT_REQUEST',1,1,16,4097,4),(34,'LAYOUT_REQUEST',1,1,16,4097,5),(35,'LAYOUT_COMPLETE',1,1,4097,16,5),(36,'INDEX_REQUEST',1,1,16,4097,5),(37,'INDEX_COMPLETE',1,1,4097,16,5),(38,'EMAIL_LINK',0,1,1048576,NULL,NULL),(39,'STATISTICS_REPORT_NOTIFICATION',1,1,16,17,NULL),(40,'ANNOUNCEMENT',0,1,16,1048576,NULL),(41,'MANUAL_PAYMENT_NOTIFICATION',0,1,NULL,NULL,NULL),(42,'PAYPAL_INVESTIGATE_PAYMENT',0,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `email_templates_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default_data`
--

DROP TABLE IF EXISTS `email_templates_default_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates_default_data` (
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `locale` varchar(14) NOT NULL DEFAULT 'en_US',
  `subject` varchar(120) NOT NULL,
  `body` text,
  `description` text,
  UNIQUE KEY `email_templates_default_data_pkey` (`email_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default_data`
--

LOCK TABLES `email_templates_default_data` WRITE;
/*!40000 ALTER TABLE `email_templates_default_data` DISABLE KEYS */;
INSERT INTO `email_templates_default_data` VALUES ('ANNOUNCEMENT','en_US','{$title}','<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nVisit our website to read the <a href=\"{$url}\">full announcement</a>.','This email is sent when a new announcement is created.'),('COPYEDIT_REQUEST','en_US','Copyediting Request','{$participantName}:<br />\n<br />\nI would ask that you undertake the copyediting of &quot;{$submissionTitle}&quot; for {$contextName} by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and click on the File that appears in Step 1.<br />\n3. Consult Copyediting Instructions posted on webpage.<br />\n4. Open the downloaded file and copyedit, while adding Author Queries as needed.<br />\n5. Save copyedited file, and upload to Step 1 of Copyediting.<br />\n6. Send the COMPLETE email to the editor.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}','This email is sent by a Series Editor to a submission\'s Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.'),('COPYEDIT_REQUEST','fr_CA','Requête de révision','{$participantName}:<br />\n<br />\nJ\'aimerais que vous entamiez le processus de révision de l\'article &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez suivre les étapes suivantes.<br />\n<br />\n1. Cliquez sure le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et cliquez sur le fichier qui apparait à l\'étape 1.<br />\n3. Lisez les instructions de révision publiées sur la page Web.<br />\n4. Ouvrez le fichier téléchargé et débutez le processus de révision, tout en ajoutant des questions pour les auteurs, au besoin.<br />\n5. Sauvegardez le fichier révisé et téléchargez-le à l\'étape 1 de Révision.<br />\n6. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$participantUsername}','Ce courriel est envoyé par le rédacteur en chef d\'une série au réviseur de la soumission afin qu\'il entame de processus de révision, lorsque l\'évaluation par les pairs est terminée. Il explique comment accéder à la soumission.'),('EDITOR_ASSIGN','en_US','Editorial Assignment','{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the editorial process in your role as an Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you,','This email notifies a Series Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the press site.'),('EDITOR_ASSIGN','fr_CA','Travail éditorial','{$editorialContactName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; à la presse {$contextName} vous a été assignée. En tant que rédacteur en chef, vous devrez superviser le processus éditorial de cette soumission.<br />\n<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$editorUsername}<br />\n<br />\nMerci,','Ce courriel indique au rédacteur en chef d\'une série qu\'on lui a assigné la tâche de superviser une soumission tout au long de son processus éditorial. Il contient des renseignements sur la soumission et indique comment accéder au site de la presse.'),('EDITOR_DECISION_ACCEPT','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}','This email from the Editor or Series Editor to an Author notifies them of a final decision regarding their submission.'),('EDITOR_DECISION_ACCEPT','fr_CA','Décision du rédacteur en chef','{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}','Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l\'on a pris une décision finale concernant sa soumission.'),('EDITOR_DECISION_DECLINE','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}','This email from the Editor or Series Editor to an Author notifies them of a final decision regarding their submission.'),('EDITOR_DECISION_DECLINE','fr_CA','Décision du rédacteur en chef','{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}','Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l\'on a pris une décision finale concernant sa soumission.'),('EDITOR_DECISION_INITIAL_DECLINE','en_US','Editor Decision','\n			{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission<br />\n<br />\nManuscript URL: {$submissionUrl}\n		','This email is send to the author if the editor declines his submission initially, before the review stage'),('EDITOR_DECISION_RESUBMIT','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}','This email from the Editor or Series Editor to an Author notifies them of a final decision regarding their submission.'),('EDITOR_DECISION_RESUBMIT','fr_CA','Décision du rédacteur en chef','{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}','Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l\'on a pris une décision finale concernant sa soumission.'),('EDITOR_DECISION_REVISIONS','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}','This email from the Editor or Series Editor to an Author notifies them of a final decision regarding their submission.'),('EDITOR_DECISION_REVISIONS','fr_CA','Décision du rédacteur en chef','{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}','Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l\'on a pris une décision finale concernant sa soumission.'),('EDITOR_DECISION_SEND_TO_EXTERNAL','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to:<br />\n<br />\nManuscript URL: {$submissionUrl}','This email from the Editor or Series Editor to an Author notifies them that their submission is being sent to an external review.'),('EDITOR_DECISION_SEND_TO_EXTERNAL','fr_CA','Décision du rédacteur en chef','{$authorName}:<br />\n<br />\nNous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />\n<br />\nNous avons décidé de:<br />\n<br />\nURL du manuscrit: {$submissionUrl}','Ce courriel est envoyé par un rédacteur en chef à un auteur pour l\'informer que sa soumission sera envoyée à un évaluateur externe.'),('EDITOR_DECISION_SEND_TO_PRODUCTION','en_US','Editor Decision','{$authorName}:<br />\n<br />\nThe editing of your manuscript, &quot;{$submissionTitle},&quot; is complete.  We are now sending it to production.<br />\n<br />\nManuscript URL: {$submissionUrl}','This email from the Editor or Series Editor to an Author notifies them that their submission is being sent to production.'),('EDITOR_DECISION_SEND_TO_PRODUCTION','fr_CA','Décision du rédacteur en chef','{$authorName}:<br />\n<br />\nLa révision de votre manuscrit &quot;{$submissionTitle}&quot; est terminée. Nous l\'envoyons maintenant en production.<br />\n<br />\nURL du manuscrit: {$submissionUrl}','Ce courriel est envoyé par un rédacteur en chef à un auteur pour l\'informer que sa soumission passera à l\'étape de production.'),('EDITOR_RECOMMENDATION','en_US','Editor Recommendation','{$editors}:<br />\n<br />\nThe recommendation regarding the submission to {$contextName}, &quot;{$submissionTitle}&quot; is: {$recommendation}','This email from the recommending Editor or Section Editor to the decision making Editors or Section Editors notifies them of a final recommendation regarding the submission.'),('EMAIL_LINK','en_US','Manuscript of Possible Interest','Thought you might be interested in seeing &quot;{$submissionTitle}&quot; by {$authorName} published in Vol {$volume}, No {$number} ({$year}) of {$contextName} at &quot;{$monographUrl}&quot;.','This email template provides a registered reader with the opportunity to send information about a monograph to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Press Manager in the Reading Tools Administration page.'),('EMAIL_LINK','fr_CA','Manuscrit susceptible d\'intéresser','Nous crayons que l\'article intitulé &quot;{$submissionTitle}&quot; par {$authorName} publié dans le Volume {$volume}, No {$number} ({$year}) de la presse {$contextName} au &quot;{$monographUrl}&quot; pourrait vous intéresser.','Ce modèle de courriel permet à un lecteur inscrit d\'envoyer des renseignements sur une monographie à une personne qui pourrait être intéressée. Il est disponible dans les Outils de lecture et peut être activé par le gestionnaire de la presse sur la page Administration des outils de lecture.'),('INDEX_COMPLETE','en_US','Index Galleys Complete','{$editorialContactName}:<br />\n<br />\nIndexes have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$contextName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signatureFullName}','This email from the Indexer to the Series Editor notifies them that the index creation process has been completed.'),('INDEX_COMPLETE','fr_CA','Indexage des épreuves en placard complété','{$editorialContactName}:<br />\n<br />\nLes index du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$contextName} sont prêts et peuvent être révisés.<br />\n<br />\nSi vous avez questions, n\'hésitez pas à me contacter.<br />\n<br />\n{$signatureFullName}','Ce courriel est envoyé par l\'indexateur au rédacteur en chef d\'une série pour lui indiquer que l\'indexage est terminé.'),('INDEX_REQUEST','en_US','Request Index','{$participantName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$contextName} now needs indexes created by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and use the Page Proofs file to create the galleys according to press standards.<br />\n3. Send the COMPLETE email to the editor.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.<br />\n<br />\n{$editorialContactSignature}','This email from the Series Editor to the Indexer notifies them that they have been assigned the task of creating indexes for a submission. It provides information about the submission and how to access it.'),('INDEX_REQUEST','fr_CA','Requête d\'indexage','{$participantName}:<br />\n<br />\nLa soumission &quot;{$submissionTitle}&quot; par la presse {$contextName} doit désormais être indexée. Veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez les fichiers d\'épreuves de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$participantUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir contribué à cette presse.<br />\n<br />\n{$editorialContactSignature}','Ce courriel est envoyé à l\'indexateur par le rédacteur en chef d\'une série pour lui indiquer qu\'il devra créer les index de la soumission en question. Il contient des renseignements sur la soumission et explique comment y accéder.'),('LAYOUT_COMPLETE','en_US','Layout Galleys Complete','{$editorialContactName}:<br />\n<br />\nGalleys have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$contextName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signatureFullName}','This email from the Layout Editor to the Series Editor notifies them that the layout process has been completed.'),('LAYOUT_COMPLETE','fr_CA','Épreuves en placard complétées','{$editorialContactName}:<br />\n<br />\nLes épreuves en placard du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$contextName} ont été préparées et peuvent être révisées.<br />\n<br />\nSi vous avez questions, n\'hésitez pas à me contacter.<br />\n<br />\n{$signatureFullName}','Ce courriel est envoyé par le rédacteur metteur en page au rédacteur d\'une série pour l\'informer que la mise en page du manuscrit est terminée.'),('LAYOUT_REQUEST','en_US','Request Galleys','{$participantName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$contextName} now needs galleys laid out by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and use the Layout Version file to create the galleys according to press standards.<br />\n3. Send the COMPLETE email to the editor.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.','This email from the Series Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.'),('LAYOUT_REQUEST','fr_CA','Requête des épreuves en placard','{$participantName}:<br />\n<br />\nIl faut maintenant préparer les épreuves en placard de la soumission &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Pour ce faire, veuillez suivre les étapes suivantes:<br />\n<br />\n1. Cliquez sur le lien URL de la soumission ci-dessous.<br />\n2. Ouvrez une session sur la presse et utilisez le fichier Version de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />\n3. Envoyez le courriel COMPLET au rédacteur en chef.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL de la soumission: {$submissionUrl}<br />\nNom d\'utilisateur: {$participantUsername}<br />\n<br />\nSi vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir contribué à cette presse.','Ce courriel est envoyé au rédacteur metteur en page par le rédacteur en chef de la série pour lui indiquer qu\'on lui a demandé de faire la mise en page de la soumission. Il contient des renseignements sur la soumission et explique comment y accéder.'),('MANUAL_PAYMENT_NOTIFICATION','en_US','Manual Payment Notification','A manual payment needs to be processed for the press {$contextName} and the user {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$itemName}&quot;.<br />\nThe cost is {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nThis email was generated by the Open Monograph Press Manual Payment plugin.','This email template is used to notify a press manager contact that a manual payment was requested.'),('NOTIFICATION','en_US','New notification from {$siteTitle}','You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\nThis is an automatically generated email; please do not reply to this message.<br />\n{$principalContactSignature}','The email is sent to registered users that have selected to have this type of notification emailed to them.'),('NOTIFICATION','fr_CA','Nouvelle notification de {$siteTitle}','Vous avez reçu une nouvelle notification de {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLien: {$url}<br />\n<br />\n{$principalContactSignature}','Ce courriel est envoyé aux utilisateurs qui ont demandé qu\'on leur envoie ce type de notification par courriel.'),('NOTIFICATION_CENTER_DEFAULT','en_US','A message regarding {$contextName}','Please enter your message.','The default (blank) message used in the Notification Center Message Listbuilder.'),('NOTIFICATION_CENTER_DEFAULT','fr_CA','Un message à propos de la presse {$contextName}','Veuillez saisir votre message.','Le message (vierge) par défaut utilisé par le centre d\'alerte.'),('PASSWORD_RESET_CONFIRM','en_US','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}','This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),('PASSWORD_RESET_CONFIRM','fr_CA','Confirmation de réinitialisation du mot de passe','Nous avons reçu une requête de réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette requête, veuillez ignorer ce courriel et votre mot de passe demeurera le même. Si vous souhaitez modifier votre mot de passe, cliquez sur l\'adresse URL ci-dessous.<br />\n<br />\nModifier mon mot de passe: {$url}<br />\n<br />\n{$principalContactSignature}','Ce courriel est envoyé à un utilisateur lorsqu\'il a indiqué avoir oublié son mot de passe ou être incapable d\'ouvrir une session. On lui fournit une adresse URL sur laquelle il peut cliquer pour modifier son mot de passe.'),('PAYPAL_INVESTIGATE_PAYMENT','en_US','Unusual PayPal Activity','Open Monograph Press has encountered unusual activity relating to PayPal payment support for the press {$contextName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by the Open Monograph Press PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n','This email template is used to notify the press\' primary contact that suspicious activity or activity requiring manual intervention was encountered by the PayPal plugin.'),('PUBLISH_NOTIFY','en_US','New Book Published','Readers:<br />\n<br />\n{$contextName} has just published its latest book at {$contextUrl}. We invite you to review the Table of Contents here and then visit our web site to review monographs and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}','This email is sent to registered readers via the \"Notify Users\" link in the Editor\'s User Home. It notifies readers of a new book and invites them to visit the press at a supplied URL.'),('PUBLISH_NOTIFY','fr_CA','Nouveau livre publié','Chers lecteurs,<br />\n<br />\n{$contextName} a récemment publié son dernier livre au {$contextUrl}. Nous vous invitons à consulter la table des matières ici et à consulter notre site Web afin de lire les monographies et les articles qui vous intéressent.<br />\n<br />\nMerci de l\'intérêt que vous portez à nos publications.<br />\n<br />\n{$editorialContactSignature}','Ce courriel est envoyé aux lecteurs par le lien d\'avis aux utilisateurs qui se trouve sur la page du rédacteur en chef. Il indique aux lecteurs que l\'on a récemment publié un nouveau livre et les invite à cliquer sur le lien URL de la presse.'),('REVIEWER_REGISTER','en_US','Registration as Reviewer with {$contextName}','In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$contextName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the press through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.'),('REVIEWER_REGISTER','fr_CA','Inscription à titre d\'évaluateur pour la presse {$contextName}','En raison de votre expertise, nous avons ajouté votre nom à notre base de données d\'évaluateurs pour la presse {$contextName}. Ceci ne vous oblige à rien, mais nous permet simplement de vous approcher si nous recevons une soumission que vous pourriez évaluer. Après avoir reçu une demande d\'évaluation, vous aurez la possibilité de lire le titre et le résumé de l\'article en question. Vous serez toujours libre d\'accepter ou de refuser l\'invitation. Vous pouvez demander que l\'on retire votre nom de notre liste d\'évaluateurs en tout temps.<br />\n<br />\nVoici votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin dans tous vos échanges avec la presse à travers son site Web. Vous pourriez, par exemple, mettre votre profil à jour, y compris vos champs d\'intérêt en ce qui concerne l\'évaluation des articles.<br />\n<br />\n<br />\nNom d\'utilisateur: {$username}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}','Ce courriel est envoyé à un nouvel évaluateur pour lui souhaiter la bienvenue dans le système et lui fournir une confirmation écrite de son nom d\'utilisateur et de son mot de passe.'),('REVIEW_ACK','en_US','Manuscript Review Acknowledgement','{$reviewerName}:<br />\n<br />\nThank you for completing the review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We appreciate your contribution to the quality of the work that we publish.','This email is sent by a Series Editor to confirm receipt of a completed review and thank the reviewer for their contributions.'),('REVIEW_ACK','fr_CA','Accusé de réception pour l\'évaluation d\'un manuscrit','{$reviewerName}:<br />\n<br />\n<br />\nMerci d\'avoir terminé l\'évaluation de l\'article &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Grâce à vous, nous sommes en mesure de publier des articles de qualité.','Ce courriel est envoyé par le rédacteur en chef d\'une série pour confirmer qu\'il a reçu l\'évaluation finale de l\'article et pour le remercier de sa contribution.'),('REVIEW_CANCEL','en_US','Request for Review Cancelled','{$reviewerName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this review process in the future.<br />\n<br />\nIf you have any questions, please contact me.','This email is sent by the Series Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.'),('REVIEW_CANCEL','fr_CA','Annulation de la requête d\'évaluation','{$reviewerName}:<br />\n<br />\n<br />\nNous avons décidé d\'annuler notre requête d\'évaluation pour la soumission &quot;{$submissionTitle}&quot; de la presse {$contextName}. Nous vous prions de nous excuser pour tout inconvénient que cette décision pourrait occasionner et nous espérons que vous serez en mesure d\'évaluer une soumission dans un avenir prochain.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à me contacter.','Ce courriel est envoyé à un évaluateur qui a entamé le processus d\'évaluation d\'une soumission par le rédacteur en chef d\'une série afin d\'informer l\'évaluateur que la procédure d\'évaluation a été annulée.'),('REVIEW_CONFIRM','en_US','Able to Review','Editor(s):<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$reviewerName}','This email is sent by a Reviewer to the Series Editor in response to a review request to notify the Series Editor that the review request has been accepted and will be completed by the specified date.'),('REVIEW_CONFIRM','fr_CA','En mesure d\'évaluer','Éditeurs:<br />\n<br />\nJe peux et je souhaite évaluer la soumission &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Merci de m\'avoir invité à évaluer cet article. Je prévois terminer mon évaluation d\'ici le {$reviewDueDate}.<br />\n<br />\n{$reviewerName}','Ce courriel est envoyé au rédacteur en chef d\'une série pour répondre à la requête d\'évaluation. Il a pour but de permettre à l\'évaluateur d\'indiquer au rédacteur en chef qu\'il a accepté d\'évaluer l\'article et qu\'il aura terminé son évaluation dans les délais prescrits.'),('REVIEW_DECLINE','en_US','Unable to Review','Editor(s):<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$reviewerName}','This email is sent by a Reviewer to the Series Editor in response to a review request to notify the Series Editor that the review request has been declined.'),('REVIEW_DECLINE','fr_CA','Ne peux pas évaluer','Éditeurs:<br />\n<br />\nMalheureusement, je ne pourrai pas évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Merci de m\'avoir invité à évaluer cet article et n\'hésitez pas à me contacter dans un avenir prochain.<br />\n<br />\n{$reviewerName}','Ce courriel est envoyé par l\'évaluateur au rédacteur en chef d\'une série série pour indiquer qu\'il ne sera pas en mesure d\'évaluer l\'article en question.'),('REVIEW_REINSTATE','en_US','Request for Review Reinstated','{$reviewerName}:<br />\n<br />\nWe would like to reinstate our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We hope that you will be able to assist with this journal\'s review process.<br />\n<br />\nIf you have any questions, please contact me.','This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.'),('REVIEW_REMIND','en_US','Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nUsername: {$reviewerUserName}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is sent by a Series Editor to remind a reviewer that their review is due.'),('REVIEW_REMIND','fr_CA','Rappel d\'évaluation','{$reviewerName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoyés par courriel. {$passwordResetUrl}<br />\n<br />\nURL de la soumission: {$submissionReviewUrl}<br />\n<br />\nNom d\'utilisateur: {$reviewerUserName}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Nous vous prions d\'agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$editorialContactSignature}','Ce courriel est envoyé par le rédacteur en chef d\'une série pour rappeler à l\'évaluateur qu\'il doit envoyer sa soumission dès que possible.'),('REVIEW_REMIND_AUTO','en_US','Automated Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nUsername: {$reviewerUserName}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REMIND_AUTO','fr_CA','Rappel automatique d\'évaluation d\'une soumission','{$reviewerName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Ce courriel a été généré et envoyé automatiquement parce que vous avez dépassé la date d\'échéance. Toutefois, nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nSi vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoyés par courriel. {$passwordResetUrl}<br />\n<br />\nURL de la soumission: {$submissionReviewUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Veuillez agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$editorialContactSignature}','Ce courriel est envoyé automatiquement lorsqu\'une évaluation est en retard (voir les options d\'évaluation à l\'étape 2 de la section Configuration de la presse) et que l\'accès de l\'évaluateur en un seul clic est désactivé. Les tâches prévues doivent être activées et configurée (voir le fichier de configuration du site).'),('REVIEW_REMIND_AUTO_ONECLICK','en_US','Automated Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REMIND_AUTO_ONECLICK','fr_CA','Rappel automatique d\'évaluation d\'une soumission','{$reviewerName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Ce courriel a été généré et envoyé automatiquement parce que vous avez dépassé la date d\'échéance. Toutefois, nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />\n<br />\nURL de la soumission: {$submissionReviewUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Veuillez agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$editorialContactSignature}','Ce courriel est envoyé automatiquement lorsqu\'une évaluation est en retard (voir les options d\'évaluation à l\'étape 2 de la section Configuration de la presse) et que l\'accès de l\'évaluateur en un seul clic est activé. Les tâches prévues doivent être activées et configurée (voir le fichier de configuration du site).'),('REVIEW_REMIND_ONECLICK','en_US','Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the press. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is sent by a Series Editor to remind a reviewer that their review is due.'),('REVIEW_REMIND_ONECLICK','fr_CA','Rappel d\'évaluation','{$reviewerName}:<br />\n<br />\nNous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais<br />\n<br />\nURL de la soumission: {$submissionReviewUrl}<br />\n<br />\nNous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Nous vous prions d\'agréer l\'expression de nos sentiments les plus distingués. <br />\n<br />\n{$editorialContactSignature}','Ce courriel est envoyé par le rédacteur en chef d\'une série pour rappeler à l\'évaluateur qu\'il doit envoyer sa soumission dès que possible.'),('REVIEW_REQUEST','en_US','Manuscript Review Request','Dear {$reviewerName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nUsername: {$reviewerUserName}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$editorialContactSignature}<br />\n','This email from the Series Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED.)'),('REVIEW_REQUEST','fr_CA','Requête d\'évaluation d\'un manuscrit','Bonjour {$reviewerName},<br />\n<br />\n{$messageToReviewer}<br />\n<br />\nVeuillez ouvrir une session sur le site Web de la presse d\'ici le {$responseDueDate} pour indiquer si vous serez en mesure d\'évaluer l\'article ou non. Ceci vous permettra également d\'accéder à la soumission, et de saisir votre évaluation et vos recommandations.<br />\n<br />\n<br />\nL\'évaluation doit être terminée d\'ici le {$reviewDueDate}.<br />\n<br />\nURL de la soumission: {$submissionReviewUrl}<br />\n<br />\nNom d\'utilisateur: {$reviewerUserName}<br />\n<br />\nMerci de votre intérêt à évaluer des articles pour notre presse.<br />\n<br />\n{$editorialContactSignature}<br />\n','Ce courriel est envoyé à un évaluateur par le rédacteur en chef d\'une série afin de lui demander s\'il accepte ou refuse d\'évaluer une soumission. Il contient des informations sur la soumission comme le titre et le résumé de l\'article, il indique la date d\'échéance pour l\'évaluation et explique comment on peut accéder à la soumission. Ce message est utilisé lorsqu\'on choisit l\'option Processus d\'évaluation standard à l\'étape 2 de la section Configuration de la presse. (Sinon, voir REVIEW_REQUEST_ATTACHED.)'),('REVIEW_REQUEST_ATTACHED','en_US','Manuscript Review Request','{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; and I am asking that you consider undertaking this important task for us. The Review Guidelines for this press are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$weekLaterDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n','This email is sent by the Series Editor to a Reviewer to request that they accept or decline the task of reviewing a submission. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST.)'),('REVIEW_REQUEST_ATTACHED','fr_CA','Requête d\'évaluation d\'un manuscrit','{$reviewerName}:<br />\n<br />\nJe crois que vous seriez un excellent évaluateur pour le manuscrit &quot;{$submissionTitle}&quot; et nous vous serions reconnaissants si vous acceptiez cette tâche importante. Vous trouverez ci-dessous les lignes directrices de cette presse concernant l\'évaluation. Vous trouverez également la soumission en pièce jointe. Votre évaluation de la soumission et vos recommandations devraient nous parvenir par courriel d\'ici le {$reviewDueDate}.<br />\n<br />\nVeuillez répondre à ce courriel d\'ici le {$weekLaterDate} pour confirmer si vous acceptez d\'évaluer cet article.<br />\n<br />\n<br />\nNous vous remercions à l\'avance et espérons que vous accepterez cette requête.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nLignes directrices concernant l\'évaluation<br />\n<br />\n{$reviewGuidelines}<br />\n','Ce courriel est envoyé par le rédacteur en chef d\'une série à un évaluateur afin de lui demander s\'il accepte ou refuse d\'évaluer une soumission. Il contient la soumission en pièce jointe. Ce message est utilisé lorsque vous sélectionnez l\'option Processus d\'évaluation par courriel avec pièce jointe à l\'étape 2 de la Configuration de la presse. (Sinon, voir REVIEW_REQUEST.)'),('REVIEW_REQUEST_ONECLICK','en_US','Manuscript Review Request','{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the press web site by {$weekLaterDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$abstractTermIfEnabled}<br />\n{$submissionAbstract}','This email from the Series Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),('REVIEW_REQUEST_ONECLICK','fr_CA','Requête d\'évaluation d\'un manuscrit','{$reviewerName}:<br />\n<br />\nJe crois que vous seriez un excellent évaluateur pour le manuscrit &quot;{$submissionTitle}&quot; soumis à la presse {$contextName}. Vous trouverez ci-dessous le résumé de l\'article. J\'espère que vous accepterez cette tâche importante du processus de publication.<br />\n<br />\nVeuillez ouvrir une session sur le site Web d\'ici le {$weekLaterDate} pour indiquer si vous acceptez ou refusez d\'évaluer l\'article. Ceci vous permettra également d\'accéder à la soumission, et de saisir votre évaluation et vos recommandations.<br />\n<br />\nL\'évaluation doit être terminée d\'ici le {$reviewDueDate}.<br />\n<br />\nURL de la soumission: {$submissionReviewUrl}<br />\n<br />\nMerci de votre intérêt à évaluer des articles pour notre presse.<br />\n<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$abstractTermIfEnabled}<br />\n{$submissionAbstract}','Ce courriel est envoyé à un évaluateur par le rédacteur en chef d\'une série afin de lui demander s\'il accepte ou refuse d\'évaluer une soumission. Il fournit des informations sur la soumission comme le titre et le résumé de l\'article, il indique la date d\'échéance pour l\'évaluation et explique comment on peut accéder à la soumission. Ce message est utilisé lorsqu\'on choisit l\'option Processus d\'évaluation standard à l\'étape 2 de la section Configuration de la presse, et que l\'on a activé l\'option permettant à l\'évaluateur d\'avoir accès à la soumission en un seul clic.'),('REVIEW_REQUEST_REMIND_AUTO','en_US','Manuscript Review Request','Dear {$reviewerName},<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nUsername: {$reviewerUserName}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$editorialContactSignature}<br />\n','This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REQUEST_REMIND_AUTO_ONECLICK','en_US','Manuscript Review Request','{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$abstractTermIfEnabled}<br />\n{$submissionAbstract}','This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('STATISTICS_REPORT_NOTIFICATION','en_US','Editorial activity for {$month}, {$year}','\n{$name}, <br />\n<br />\nYour press health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the press to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published article stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$principalContactSignature}','This email is automatically sent monthly to editors and journal managers to provide them a system health overview.'),('SUBMISSION_ACK','en_US','Submission Acknowledgement','{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. With the online press management system that we are using, you will be able to track its progress through the editorial process by logging in to the press web site:<br />\n<br />\nManuscript URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the press. It provides information about tracking the submission through the process and thanks the author for the submission.'),('SUBMISSION_ACK','fr_CA','Accusé de réception d\'une soumission','{$authorName}:<br />\n<br />\nMerci d\'avoir envoyé votre manuscrit &quot;{$submissionTitle}&quot; à la presse {$contextName}. Le système de gestion virtuel de la presse que nous utilisons vous permet de suivre les progrès de votre article tout au long du processus de publication. Il suffit d\'ouvrir une session sur le site Web:<br />\n<br />\nURL du manuscrit: {$submissionUrl}<br />\nNom d\'utilisateur: {$authorUsername}<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir envoyé votre article à cette presse.<br />\n<br />\n{$editorialContactSignature}','Lorsqu\'il est activé, ce courriel est envoyé automatiquement à l\'auteur lorsqu\'il soumet son manuscrit à la presse. Il fournit des renseignements sur le suivi de la soumission tout au long du processus de publication et remercie l\'auteur d\'avoir envoyé une soumission.'),('SUBMISSION_ACK_NOT_USER','en_US','Submission Acknowledgement','Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this press as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to the other authors who are not users within OMP specified during the submission process.'),('SUBMISSION_ACK_NOT_USER','fr_CA','Accusé de réception d\'une soumission','Bonjour,<br />\n<br />\n{$submitterName} a envoyé un manuscrit intitulé &quot;{$submissionTitle}&quot; à la presse {$contextName}. <br />\n<br />\nSi vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir envoyé votre article à cette presse.<br />\n<br />\n{$editorialContactSignature}','Lorsqu\'il est activé, ce courriel est envoyé automatiquement aux autres auteurs qui ne font pas partie des utilisateurs d\'OMP identifiés pendant le processus de soumission.'),('USER_REGISTER','en_US','Press Registration','{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this press through its website. At any point, you can ask to be removed from the list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('USER_REGISTER','fr_CA','Inscription à la presse','{$userFullName}<br />\n<br />\nVous êtes désormais inscrit à la presse {$contextName}. Ce courriel contient votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin pour tous vos travaux au sein de la presse. Vous pouvez demander que l\'on retire votre nom de la liste des utilisateurs en tout temps. Il suffit de me contacter.<br />\n<br />\n<br />\nNom d\'utilisateur: {$username}<br />\nMot de passe: {$password}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}','Ce courriel est envoyé à un nouvel utilisateur afin de lui souhaiter la bienvenue dans le système et lui fournir son nom d\'utilisateur et son mot de passe pour ses dossiers.'),('USER_VALIDATE','en_US','Validate Your Account','{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('USER_VALIDATE','fr_CA','Valider votre compte','{$userFullName}<br />\n<br />\nVous avez ouvert un compte chez {$contextName}. Mais avant de pouvoir l\'utiliser, vous devez confirmer votre adresse courriel. Il suffit de cliquer sur le lien ci-dessous.<br />\n<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$principalContactSignature}','Ce courriel est envoyé à un nouvel utilisateur pour lui souhaiter la bienvenue dans le système et lui fournir une confirmation écrite de son nom d\'utilisateur et de son mot de passe.');
/*!40000 ALTER TABLE `email_templates_default_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_settings`
--

DROP TABLE IF EXISTS `email_templates_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates_settings` (
  `email_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  UNIQUE KEY `email_settings_pkey` (`email_id`,`locale`,`setting_name`),
  KEY `email_settings_email_id` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `user_id` bigint NOT NULL,
  `date_logged` datetime NOT NULL,
  `event_type` bigint DEFAULT NULL,
  `message` text,
  `is_translated` smallint DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=506 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,19,'2026-01-02 05:19:03',268435458,'submission.event.general.metadataUpdated',0),(2,1048585,1,19,'2026-01-02 05:19:03',268435458,'submission.event.general.metadataUpdated',0),(3,515,1,19,'2026-01-02 05:19:03',1342177281,'submission.event.fileUploaded',0),(4,1048585,1,19,'2026-01-02 05:19:03',1342177288,'submission.event.fileRevised',0),(5,515,1,19,'2026-01-02 05:19:03',1342177296,'submission.event.fileEdited',0),(6,1048585,1,19,'2026-01-02 05:19:04',1342177296,'submission.event.fileEdited',0),(7,1048585,1,19,'2026-01-02 05:19:15',268435458,'submission.event.general.metadataUpdated',0),(8,1048585,1,19,'2026-01-02 05:19:15',268435457,'submission.event.submissionSubmitted',0),(9,1048585,1,3,'2026-01-02 05:19:20',805306371,'log.editor.decision',0),(10,515,2,3,'2026-01-02 05:19:20',1342177281,'submission.event.fileUploaded',0),(11,1048585,1,3,'2026-01-02 05:19:20',1342177288,'submission.event.fileRevised',0),(12,1048585,1,3,'2026-01-02 05:19:25',1073741825,'log.review.reviewerAssigned',0),(13,1048585,1,3,'2026-01-02 05:19:26',805306371,'log.editor.decision',0),(14,1048585,1,3,'2026-01-02 05:19:29',268435459,'submission.event.participantAdded',0),(15,1048585,2,20,'2026-01-02 05:19:35',268435458,'submission.event.general.metadataUpdated',0),(16,1048585,2,20,'2026-01-02 05:19:35',268435458,'submission.event.general.metadataUpdated',0),(17,515,3,20,'2026-01-02 05:19:36',1342177281,'submission.event.fileUploaded',0),(18,1048585,2,20,'2026-01-02 05:19:36',1342177288,'submission.event.fileRevised',0),(19,515,3,20,'2026-01-02 05:19:36',1342177296,'submission.event.fileEdited',0),(20,1048585,2,20,'2026-01-02 05:19:36',1342177296,'submission.event.fileEdited',0),(21,515,4,20,'2026-01-02 05:19:36',1342177281,'submission.event.fileUploaded',0),(22,1048585,2,20,'2026-01-02 05:19:36',1342177288,'submission.event.fileRevised',0),(23,515,4,20,'2026-01-02 05:19:37',1342177296,'submission.event.fileEdited',0),(24,1048585,2,20,'2026-01-02 05:19:37',1342177296,'submission.event.fileEdited',0),(25,515,5,20,'2026-01-02 05:19:37',1342177281,'submission.event.fileUploaded',0),(26,1048585,2,20,'2026-01-02 05:19:37',1342177288,'submission.event.fileRevised',0),(27,515,5,20,'2026-01-02 05:19:37',1342177296,'submission.event.fileEdited',0),(28,1048585,2,20,'2026-01-02 05:19:37',1342177296,'submission.event.fileEdited',0),(29,515,6,20,'2026-01-02 05:19:37',1342177281,'submission.event.fileUploaded',0),(30,1048585,2,20,'2026-01-02 05:19:37',1342177288,'submission.event.fileRevised',0),(31,515,6,20,'2026-01-02 05:19:37',1342177296,'submission.event.fileEdited',0),(32,1048585,2,20,'2026-01-02 05:19:37',1342177296,'submission.event.fileEdited',0),(33,1048585,2,20,'2026-01-02 05:19:40',268435458,'submission.event.general.metadataUpdated',0),(34,1048585,2,20,'2026-01-02 05:19:42',268435458,'submission.event.general.metadataUpdated',0),(35,1048585,2,20,'2026-01-02 05:19:44',268435458,'submission.event.general.metadataUpdated',0),(36,1048585,2,20,'2026-01-02 05:19:47',268435458,'submission.event.general.metadataUpdated',0),(37,1048585,2,20,'2026-01-02 05:19:49',268435458,'submission.event.general.metadataUpdated',0),(38,1048585,2,20,'2026-01-02 05:19:51',268435458,'submission.event.general.metadataUpdated',0),(39,1048585,2,20,'2026-01-02 05:19:54',268435458,'submission.event.general.metadataUpdated',0),(40,1048585,2,20,'2026-01-02 05:20:19',268435458,'submission.event.general.metadataUpdated',0),(41,1048585,2,20,'2026-01-02 05:20:20',268435457,'submission.event.submissionSubmitted',0),(42,1048585,2,3,'2026-01-02 05:20:26',805306371,'log.editor.decision',0),(43,515,7,3,'2026-01-02 05:20:26',1342177281,'submission.event.fileUploaded',0),(44,1048585,2,3,'2026-01-02 05:20:26',1342177288,'submission.event.fileRevised',0),(45,515,8,3,'2026-01-02 05:20:26',1342177281,'submission.event.fileUploaded',0),(46,1048585,2,3,'2026-01-02 05:20:26',1342177288,'submission.event.fileRevised',0),(47,515,9,3,'2026-01-02 05:20:26',1342177281,'submission.event.fileUploaded',0),(48,1048585,2,3,'2026-01-02 05:20:26',1342177288,'submission.event.fileRevised',0),(49,515,10,3,'2026-01-02 05:20:26',1342177281,'submission.event.fileUploaded',0),(50,1048585,2,3,'2026-01-02 05:20:26',1342177288,'submission.event.fileRevised',0),(51,1048585,2,3,'2026-01-02 05:20:31',1073741825,'log.review.reviewerAssigned',0),(52,1048585,2,3,'2026-01-02 05:20:36',1073741825,'log.review.reviewerAssigned',0),(53,1048585,3,21,'2026-01-02 05:20:42',268435458,'submission.event.general.metadataUpdated',0),(54,1048585,3,21,'2026-01-02 05:20:42',268435458,'submission.event.general.metadataUpdated',0),(55,515,11,21,'2026-01-02 05:20:43',1342177281,'submission.event.fileUploaded',0),(56,1048585,3,21,'2026-01-02 05:20:43',1342177288,'submission.event.fileRevised',0),(57,515,11,21,'2026-01-02 05:20:43',1342177296,'submission.event.fileEdited',0),(58,1048585,3,21,'2026-01-02 05:20:43',1342177296,'submission.event.fileEdited',0),(59,1048585,3,21,'2026-01-02 05:21:01',268435458,'submission.event.general.metadataUpdated',0),(60,1048585,3,21,'2026-01-02 05:21:02',268435457,'submission.event.submissionSubmitted',0),(61,1048585,4,22,'2026-01-02 05:21:08',268435458,'submission.event.general.metadataUpdated',0),(62,1048585,4,22,'2026-01-02 05:21:08',268435458,'submission.event.general.metadataUpdated',0),(63,515,12,22,'2026-01-02 05:21:08',1342177281,'submission.event.fileUploaded',0),(64,1048585,4,22,'2026-01-02 05:21:08',1342177288,'submission.event.fileRevised',0),(65,515,12,22,'2026-01-02 05:21:08',1342177296,'submission.event.fileEdited',0),(66,1048585,4,22,'2026-01-02 05:21:09',1342177296,'submission.event.fileEdited',0),(67,515,13,22,'2026-01-02 05:21:09',1342177281,'submission.event.fileUploaded',0),(68,1048585,4,22,'2026-01-02 05:21:09',1342177288,'submission.event.fileRevised',0),(69,515,13,22,'2026-01-02 05:21:09',1342177296,'submission.event.fileEdited',0),(70,1048585,4,22,'2026-01-02 05:21:09',1342177296,'submission.event.fileEdited',0),(71,515,14,22,'2026-01-02 05:21:09',1342177281,'submission.event.fileUploaded',0),(72,1048585,4,22,'2026-01-02 05:21:09',1342177288,'submission.event.fileRevised',0),(73,515,14,22,'2026-01-02 05:21:09',1342177296,'submission.event.fileEdited',0),(74,1048585,4,22,'2026-01-02 05:21:09',1342177296,'submission.event.fileEdited',0),(75,515,15,22,'2026-01-02 05:21:09',1342177281,'submission.event.fileUploaded',0),(76,1048585,4,22,'2026-01-02 05:21:09',1342177288,'submission.event.fileRevised',0),(77,515,15,22,'2026-01-02 05:21:10',1342177296,'submission.event.fileEdited',0),(78,1048585,4,22,'2026-01-02 05:21:10',1342177296,'submission.event.fileEdited',0),(79,1048585,4,22,'2026-01-02 05:21:13',268435458,'submission.event.general.metadataUpdated',0),(80,1048585,4,22,'2026-01-02 05:21:15',268435458,'submission.event.general.metadataUpdated',0),(81,1048585,4,22,'2026-01-02 05:21:18',268435458,'submission.event.general.metadataUpdated',0),(82,1048585,4,22,'2026-01-02 05:21:41',268435458,'submission.event.general.metadataUpdated',0),(83,1048585,4,22,'2026-01-02 05:21:42',268435457,'submission.event.submissionSubmitted',0),(84,1048585,4,3,'2026-01-02 05:21:47',805306371,'log.editor.decision',0),(85,515,16,3,'2026-01-02 05:21:47',1342177281,'submission.event.fileUploaded',0),(86,1048585,4,3,'2026-01-02 05:21:47',1342177288,'submission.event.fileRevised',0),(87,515,17,3,'2026-01-02 05:21:48',1342177281,'submission.event.fileUploaded',0),(88,1048585,4,3,'2026-01-02 05:21:48',1342177288,'submission.event.fileRevised',0),(89,515,18,3,'2026-01-02 05:21:48',1342177281,'submission.event.fileUploaded',0),(90,1048585,4,3,'2026-01-02 05:21:48',1342177288,'submission.event.fileRevised',0),(91,515,19,3,'2026-01-02 05:21:48',1342177281,'submission.event.fileUploaded',0),(92,1048585,4,3,'2026-01-02 05:21:48',1342177288,'submission.event.fileRevised',0),(93,1048585,4,3,'2026-01-02 05:21:53',1073741825,'log.review.reviewerAssigned',0),(94,1048585,4,3,'2026-01-02 05:21:55',805306371,'log.editor.decision',0),(95,1048585,4,3,'2026-01-02 05:22:00',1073741825,'log.review.reviewerAssigned',0),(96,1048585,4,3,'2026-01-02 05:22:02',805306371,'log.editor.decision',0),(97,1048585,4,3,'2026-01-02 05:22:07',268435459,'submission.event.participantAdded',0),(98,1048585,4,3,'2026-01-02 05:22:09',805306371,'log.editor.decision',0),(99,1048585,4,3,'2026-01-02 05:22:14',268435459,'submission.event.participantAdded',0),(100,1048585,5,23,'2026-01-02 05:22:20',268435458,'submission.event.general.metadataUpdated',0),(101,1048585,5,23,'2026-01-02 05:22:20',268435458,'submission.event.general.metadataUpdated',0),(102,515,20,23,'2026-01-02 05:22:21',1342177281,'submission.event.fileUploaded',0),(103,1048585,5,23,'2026-01-02 05:22:21',1342177288,'submission.event.fileRevised',0),(104,515,20,23,'2026-01-02 05:22:21',1342177296,'submission.event.fileEdited',0),(105,1048585,5,23,'2026-01-02 05:22:21',1342177296,'submission.event.fileEdited',0),(106,1048585,5,23,'2026-01-02 05:22:43',268435458,'submission.event.general.metadataUpdated',0),(107,1048585,5,23,'2026-01-02 05:22:44',268435457,'submission.event.submissionSubmitted',0),(108,1048585,5,3,'2026-01-02 05:22:49',805306371,'log.editor.decision',0),(109,515,21,3,'2026-01-02 05:22:49',1342177281,'submission.event.fileUploaded',0),(110,1048585,5,3,'2026-01-02 05:22:49',1342177288,'submission.event.fileRevised',0),(111,1048585,5,3,'2026-01-02 05:22:54',1073741825,'log.review.reviewerAssigned',0),(112,1048585,5,3,'2026-01-02 05:22:56',805306371,'log.editor.decision',0),(113,1048585,5,3,'2026-01-02 05:23:00',1073741825,'log.review.reviewerAssigned',0),(114,1048585,5,3,'2026-01-02 05:23:02',805306371,'log.editor.decision',0),(115,1048585,5,3,'2026-01-02 05:23:06',268435459,'submission.event.participantAdded',0),(116,1048585,5,3,'2026-01-02 05:23:08',805306371,'log.editor.decision',0),(117,1048585,5,3,'2026-01-02 05:23:12',268435459,'submission.event.participantAdded',0),(118,1048585,5,3,'2026-01-02 05:23:15',268435459,'submission.event.participantAdded',0),(119,1048585,5,3,'2026-01-02 05:23:19',268435474,'submission.event.publicationFormatCreated',0),(120,515,22,3,'2026-01-02 05:23:21',1342177281,'submission.event.fileUploaded',0),(121,1048585,5,3,'2026-01-02 05:23:21',1342177288,'submission.event.fileRevised',0),(122,1048585,5,3,'2026-01-02 05:23:22',268435464,'submission.event.publicationFormatPublished',0),(123,1048585,5,3,'2026-01-02 05:23:23',268435476,'submission.event.publicationFormatMadeAvailable',0),(124,515,22,3,'2026-01-02 05:23:25',1342177296,'submission.event.fileEdited',0),(125,1048585,5,3,'2026-01-02 05:23:25',1342177296,'submission.event.fileEdited',0),(126,515,22,3,'2026-01-02 05:23:25',1342177287,'submission.event.signoffSignoff',0),(127,1048585,5,3,'2026-01-02 05:23:28',268435462,'publication.event.published',0),(128,1048585,6,24,'2026-01-02 05:23:34',268435458,'submission.event.general.metadataUpdated',0),(129,1048585,6,24,'2026-01-02 05:23:34',268435458,'submission.event.general.metadataUpdated',0),(130,515,23,24,'2026-01-02 05:23:34',1342177281,'submission.event.fileUploaded',0),(131,1048585,6,24,'2026-01-02 05:23:34',1342177288,'submission.event.fileRevised',0),(132,515,23,24,'2026-01-02 05:23:35',1342177296,'submission.event.fileEdited',0),(133,1048585,6,24,'2026-01-02 05:23:35',1342177296,'submission.event.fileEdited',0),(134,515,24,24,'2026-01-02 05:23:35',1342177281,'submission.event.fileUploaded',0),(135,1048585,6,24,'2026-01-02 05:23:35',1342177288,'submission.event.fileRevised',0),(136,515,24,24,'2026-01-02 05:23:35',1342177296,'submission.event.fileEdited',0),(137,1048585,6,24,'2026-01-02 05:23:35',1342177296,'submission.event.fileEdited',0),(138,515,25,24,'2026-01-02 05:23:35',1342177281,'submission.event.fileUploaded',0),(139,1048585,6,24,'2026-01-02 05:23:35',1342177288,'submission.event.fileRevised',0),(140,515,25,24,'2026-01-02 05:23:35',1342177296,'submission.event.fileEdited',0),(141,1048585,6,24,'2026-01-02 05:23:35',1342177296,'submission.event.fileEdited',0),(142,515,26,24,'2026-01-02 05:23:35',1342177281,'submission.event.fileUploaded',0),(143,1048585,6,24,'2026-01-02 05:23:35',1342177288,'submission.event.fileRevised',0),(144,515,26,24,'2026-01-02 05:23:36',1342177296,'submission.event.fileEdited',0),(145,1048585,6,24,'2026-01-02 05:23:36',1342177296,'submission.event.fileEdited',0),(146,1048585,6,24,'2026-01-02 05:23:39',268435458,'submission.event.general.metadataUpdated',0),(147,1048585,6,24,'2026-01-02 05:23:41',268435458,'submission.event.general.metadataUpdated',0),(148,1048585,6,24,'2026-01-02 05:23:44',268435458,'submission.event.general.metadataUpdated',0),(149,1048585,6,24,'2026-01-02 05:24:06',268435458,'submission.event.general.metadataUpdated',0),(150,1048585,6,24,'2026-01-02 05:24:07',268435457,'submission.event.submissionSubmitted',0),(151,1048585,6,3,'2026-01-02 05:24:13',805306371,'log.editor.decision',0),(152,515,27,3,'2026-01-02 05:24:13',1342177281,'submission.event.fileUploaded',0),(153,1048585,6,3,'2026-01-02 05:24:13',1342177288,'submission.event.fileRevised',0),(154,515,28,3,'2026-01-02 05:24:13',1342177281,'submission.event.fileUploaded',0),(155,1048585,6,3,'2026-01-02 05:24:13',1342177288,'submission.event.fileRevised',0),(156,515,29,3,'2026-01-02 05:24:13',1342177281,'submission.event.fileUploaded',0),(157,1048585,6,3,'2026-01-02 05:24:13',1342177288,'submission.event.fileRevised',0),(158,515,30,3,'2026-01-02 05:24:13',1342177281,'submission.event.fileUploaded',0),(159,1048585,6,3,'2026-01-02 05:24:13',1342177288,'submission.event.fileRevised',0),(160,1048585,6,3,'2026-01-02 05:24:17',268435459,'submission.event.participantAdded',0),(161,1048585,6,6,'2026-01-02 05:24:24',805306372,'log.editor.recommendation',0),(162,1048585,7,25,'2026-01-02 05:24:36',268435458,'submission.event.general.metadataUpdated',0),(163,1048585,7,25,'2026-01-02 05:24:36',268435458,'submission.event.general.metadataUpdated',0),(164,515,31,25,'2026-01-02 05:24:37',1342177281,'submission.event.fileUploaded',0),(165,1048585,7,25,'2026-01-02 05:24:37',1342177288,'submission.event.fileRevised',0),(166,515,31,25,'2026-01-02 05:24:37',1342177296,'submission.event.fileEdited',0),(167,1048585,7,25,'2026-01-02 05:24:37',1342177296,'submission.event.fileEdited',0),(168,515,32,25,'2026-01-02 05:24:37',1342177281,'submission.event.fileUploaded',0),(169,1048585,7,25,'2026-01-02 05:24:37',1342177288,'submission.event.fileRevised',0),(170,515,32,25,'2026-01-02 05:24:37',1342177296,'submission.event.fileEdited',0),(171,1048585,7,25,'2026-01-02 05:24:37',1342177296,'submission.event.fileEdited',0),(172,515,33,25,'2026-01-02 05:24:37',1342177281,'submission.event.fileUploaded',0),(173,1048585,7,25,'2026-01-02 05:24:37',1342177288,'submission.event.fileRevised',0),(174,515,33,25,'2026-01-02 05:24:38',1342177296,'submission.event.fileEdited',0),(175,1048585,7,25,'2026-01-02 05:24:38',1342177296,'submission.event.fileEdited',0),(176,515,34,25,'2026-01-02 05:24:38',1342177281,'submission.event.fileUploaded',0),(177,1048585,7,25,'2026-01-02 05:24:38',1342177288,'submission.event.fileRevised',0),(178,515,34,25,'2026-01-02 05:24:38',1342177296,'submission.event.fileEdited',0),(179,1048585,7,25,'2026-01-02 05:24:38',1342177296,'submission.event.fileEdited',0),(180,515,35,25,'2026-01-02 05:24:38',1342177281,'submission.event.fileUploaded',0),(181,1048585,7,25,'2026-01-02 05:24:38',1342177288,'submission.event.fileRevised',0),(182,515,35,25,'2026-01-02 05:24:38',1342177296,'submission.event.fileEdited',0),(183,1048585,7,25,'2026-01-02 05:24:38',1342177296,'submission.event.fileEdited',0),(184,1048585,7,25,'2026-01-02 05:24:41',268435458,'submission.event.general.metadataUpdated',0),(185,1048585,7,25,'2026-01-02 05:24:44',268435458,'submission.event.general.metadataUpdated',0),(186,1048585,7,25,'2026-01-02 05:24:47',268435458,'submission.event.general.metadataUpdated',0),(187,1048585,7,25,'2026-01-02 05:24:49',268435458,'submission.event.general.metadataUpdated',0),(188,1048585,7,25,'2026-01-02 05:25:19',268435458,'submission.event.general.metadataUpdated',0),(189,1048585,7,25,'2026-01-02 05:25:21',268435457,'submission.event.submissionSubmitted',0),(190,1048585,7,3,'2026-01-02 05:25:27',805306371,'log.editor.decision',0),(191,515,36,3,'2026-01-02 05:25:27',1342177281,'submission.event.fileUploaded',0),(192,1048585,7,3,'2026-01-02 05:25:27',1342177288,'submission.event.fileRevised',0),(193,515,37,3,'2026-01-02 05:25:27',1342177281,'submission.event.fileUploaded',0),(194,1048585,7,3,'2026-01-02 05:25:27',1342177288,'submission.event.fileRevised',0),(195,515,38,3,'2026-01-02 05:25:27',1342177281,'submission.event.fileUploaded',0),(196,1048585,7,3,'2026-01-02 05:25:27',1342177288,'submission.event.fileRevised',0),(197,515,39,3,'2026-01-02 05:25:27',1342177281,'submission.event.fileUploaded',0),(198,1048585,7,3,'2026-01-02 05:25:27',1342177288,'submission.event.fileRevised',0),(199,515,40,3,'2026-01-02 05:25:27',1342177281,'submission.event.fileUploaded',0),(200,1048585,7,3,'2026-01-02 05:25:27',1342177288,'submission.event.fileRevised',0),(201,1048585,7,3,'2026-01-02 05:25:33',1073741825,'log.review.reviewerAssigned',0),(202,1048585,7,3,'2026-01-02 05:25:35',805306371,'log.editor.decision',0),(203,1048585,7,3,'2026-01-02 05:25:40',268435459,'submission.event.participantAdded',0),(204,1048585,8,3,'2026-01-02 05:25:45',268435458,'submission.event.general.metadataUpdated',0),(205,1048585,8,3,'2026-01-02 05:25:45',268435458,'submission.event.general.metadataUpdated',0),(206,515,41,3,'2026-01-02 05:25:46',1342177281,'submission.event.fileUploaded',0),(207,1048585,8,3,'2026-01-02 05:25:46',1342177288,'submission.event.fileRevised',0),(208,515,41,3,'2026-01-02 05:25:46',1342177296,'submission.event.fileEdited',0),(209,1048585,8,3,'2026-01-02 05:25:46',1342177296,'submission.event.fileEdited',0),(210,1048585,8,3,'2026-01-02 05:25:47',268435458,'submission.event.general.metadataUpdated',0),(211,1048585,8,3,'2026-01-02 05:25:48',268435457,'submission.event.submissionSubmitted',0),(212,1048585,9,26,'2026-01-02 05:25:53',268435458,'submission.event.general.metadataUpdated',0),(213,1048585,9,26,'2026-01-02 05:25:53',268435458,'submission.event.general.metadataUpdated',0),(214,515,42,26,'2026-01-02 05:25:54',1342177281,'submission.event.fileUploaded',0),(215,1048585,9,26,'2026-01-02 05:25:54',1342177288,'submission.event.fileRevised',0),(216,515,42,26,'2026-01-02 05:25:54',1342177296,'submission.event.fileEdited',0),(217,1048585,9,26,'2026-01-02 05:25:54',1342177296,'submission.event.fileEdited',0),(218,515,43,26,'2026-01-02 05:25:54',1342177281,'submission.event.fileUploaded',0),(219,1048585,9,26,'2026-01-02 05:25:54',1342177288,'submission.event.fileRevised',0),(220,515,43,26,'2026-01-02 05:25:55',1342177296,'submission.event.fileEdited',0),(221,1048585,9,26,'2026-01-02 05:25:55',1342177296,'submission.event.fileEdited',0),(222,515,44,26,'2026-01-02 05:25:55',1342177281,'submission.event.fileUploaded',0),(223,1048585,9,26,'2026-01-02 05:25:55',1342177288,'submission.event.fileRevised',0),(224,515,44,26,'2026-01-02 05:25:55',1342177296,'submission.event.fileEdited',0),(225,1048585,9,26,'2026-01-02 05:25:55',1342177296,'submission.event.fileEdited',0),(226,515,45,26,'2026-01-02 05:25:55',1342177281,'submission.event.fileUploaded',0),(227,1048585,9,26,'2026-01-02 05:25:55',1342177288,'submission.event.fileRevised',0),(228,515,45,26,'2026-01-02 05:25:55',1342177296,'submission.event.fileEdited',0),(229,1048585,9,26,'2026-01-02 05:25:55',1342177296,'submission.event.fileEdited',0),(230,515,46,26,'2026-01-02 05:25:56',1342177281,'submission.event.fileUploaded',0),(231,1048585,9,26,'2026-01-02 05:25:56',1342177288,'submission.event.fileRevised',0),(232,515,46,26,'2026-01-02 05:25:56',1342177296,'submission.event.fileEdited',0),(233,1048585,9,26,'2026-01-02 05:25:56',1342177296,'submission.event.fileEdited',0),(234,1048585,9,26,'2026-01-02 05:25:59',268435458,'submission.event.general.metadataUpdated',0),(235,1048585,9,26,'2026-01-02 05:26:01',268435458,'submission.event.general.metadataUpdated',0),(236,1048585,9,26,'2026-01-02 05:26:03',268435458,'submission.event.general.metadataUpdated',0),(237,1048585,9,26,'2026-01-02 05:26:06',268435458,'submission.event.general.metadataUpdated',0),(238,1048585,9,26,'2026-01-02 05:26:36',268435458,'submission.event.general.metadataUpdated',0),(239,1048585,9,26,'2026-01-02 05:26:37',268435457,'submission.event.submissionSubmitted',0),(240,1048585,9,3,'2026-01-02 05:26:43',805306371,'log.editor.decision',0),(241,515,47,3,'2026-01-02 05:26:43',1342177281,'submission.event.fileUploaded',0),(242,1048585,9,3,'2026-01-02 05:26:43',1342177288,'submission.event.fileRevised',0),(243,515,48,3,'2026-01-02 05:26:43',1342177281,'submission.event.fileUploaded',0),(244,1048585,9,3,'2026-01-02 05:26:43',1342177288,'submission.event.fileRevised',0),(245,515,49,3,'2026-01-02 05:26:44',1342177281,'submission.event.fileUploaded',0),(246,1048585,9,3,'2026-01-02 05:26:44',1342177288,'submission.event.fileRevised',0),(247,515,50,3,'2026-01-02 05:26:44',1342177281,'submission.event.fileUploaded',0),(248,1048585,9,3,'2026-01-02 05:26:44',1342177288,'submission.event.fileRevised',0),(249,515,51,3,'2026-01-02 05:26:44',1342177281,'submission.event.fileUploaded',0),(250,1048585,9,3,'2026-01-02 05:26:44',1342177288,'submission.event.fileRevised',0),(251,1048585,10,27,'2026-01-02 05:26:51',268435458,'submission.event.general.metadataUpdated',0),(252,1048585,10,27,'2026-01-02 05:26:51',268435458,'submission.event.general.metadataUpdated',0),(253,515,52,27,'2026-01-02 05:26:52',1342177281,'submission.event.fileUploaded',0),(254,1048585,10,27,'2026-01-02 05:26:52',1342177288,'submission.event.fileRevised',0),(255,515,52,27,'2026-01-02 05:26:52',1342177296,'submission.event.fileEdited',0),(256,1048585,10,27,'2026-01-02 05:26:52',1342177296,'submission.event.fileEdited',0),(257,1048585,10,27,'2026-01-02 05:27:26',268435458,'submission.event.general.metadataUpdated',0),(258,1048585,10,27,'2026-01-02 05:27:27',268435457,'submission.event.submissionSubmitted',0),(259,1048585,11,28,'2026-01-02 05:27:33',268435458,'submission.event.general.metadataUpdated',0),(260,1048585,11,28,'2026-01-02 05:27:33',268435458,'submission.event.general.metadataUpdated',0),(261,515,53,28,'2026-01-02 05:27:33',1342177281,'submission.event.fileUploaded',0),(262,1048585,11,28,'2026-01-02 05:27:33',1342177288,'submission.event.fileRevised',0),(263,515,53,28,'2026-01-02 05:27:33',1342177296,'submission.event.fileEdited',0),(264,1048585,11,28,'2026-01-02 05:27:33',1342177296,'submission.event.fileEdited',0),(265,1048585,11,28,'2026-01-02 05:27:41',268435458,'submission.event.general.metadataUpdated',0),(266,1048585,11,28,'2026-01-02 05:27:42',268435457,'submission.event.submissionSubmitted',0),(267,1048585,11,3,'2026-01-02 05:27:46',805306371,'log.editor.decision',0),(268,515,54,3,'2026-01-02 05:27:46',1342177281,'submission.event.fileUploaded',0),(269,1048585,11,3,'2026-01-02 05:27:46',1342177288,'submission.event.fileRevised',0),(270,1048585,11,3,'2026-01-02 05:27:51',1073741825,'log.review.reviewerAssigned',0),(271,1048585,11,3,'2026-01-02 05:27:52',805306371,'log.editor.decision',0),(272,1048585,11,3,'2026-01-02 05:27:57',1073741825,'log.review.reviewerAssigned',0),(273,1048585,11,3,'2026-01-02 05:28:00',1073741825,'log.review.reviewerAssigned',0),(274,1048585,11,10,'2026-01-02 05:28:04',1073741830,'log.review.reviewAccepted',0),(275,1048585,11,10,'2026-01-02 05:28:07',1073741848,'log.review.reviewReady',0),(276,1048585,11,12,'2026-01-02 05:28:11',1073741830,'log.review.reviewAccepted',0),(277,1048585,11,12,'2026-01-02 05:28:15',1073741848,'log.review.reviewReady',0),(278,1048585,11,3,'2026-01-02 05:28:22',805306371,'log.editor.decision',0),(279,1048585,12,29,'2026-01-02 05:28:30',268435458,'submission.event.general.metadataUpdated',0),(280,1048585,12,29,'2026-01-02 05:28:30',268435458,'submission.event.general.metadataUpdated',0),(281,515,55,29,'2026-01-02 05:28:30',1342177281,'submission.event.fileUploaded',0),(282,1048585,12,29,'2026-01-02 05:28:30',1342177288,'submission.event.fileRevised',0),(283,515,55,29,'2026-01-02 05:28:30',1342177296,'submission.event.fileEdited',0),(284,1048585,12,29,'2026-01-02 05:28:30',1342177296,'submission.event.fileEdited',0),(285,515,56,29,'2026-01-02 05:28:31',1342177281,'submission.event.fileUploaded',0),(286,1048585,12,29,'2026-01-02 05:28:31',1342177288,'submission.event.fileRevised',0),(287,515,56,29,'2026-01-02 05:28:31',1342177296,'submission.event.fileEdited',0),(288,1048585,12,29,'2026-01-02 05:28:31',1342177296,'submission.event.fileEdited',0),(289,515,57,29,'2026-01-02 05:28:31',1342177281,'submission.event.fileUploaded',0),(290,1048585,12,29,'2026-01-02 05:28:31',1342177288,'submission.event.fileRevised',0),(291,515,57,29,'2026-01-02 05:28:31',1342177296,'submission.event.fileEdited',0),(292,1048585,12,29,'2026-01-02 05:28:31',1342177296,'submission.event.fileEdited',0),(293,1048585,12,29,'2026-01-02 05:28:34',268435458,'submission.event.general.metadataUpdated',0),(294,1048585,12,29,'2026-01-02 05:28:36',268435458,'submission.event.general.metadataUpdated',0),(295,1048585,12,29,'2026-01-02 05:28:38',268435458,'submission.event.general.metadataUpdated',0),(296,1048585,12,29,'2026-01-02 05:28:41',268435458,'submission.event.general.metadataUpdated',0),(297,1048585,12,29,'2026-01-02 05:28:43',268435458,'submission.event.general.metadataUpdated',0),(298,1048585,12,29,'2026-01-02 05:28:46',268435458,'submission.event.general.metadataUpdated',0),(299,1048585,12,29,'2026-01-02 05:28:48',268435458,'submission.event.general.metadataUpdated',0),(300,1048585,12,29,'2026-01-02 05:29:07',268435458,'submission.event.general.metadataUpdated',0),(301,1048585,12,29,'2026-01-02 05:29:09',268435457,'submission.event.submissionSubmitted',0),(302,1048585,12,3,'2026-01-02 05:29:15',805306371,'log.editor.decision',0),(303,1048585,12,3,'2026-01-02 05:29:21',1073741825,'log.review.reviewerAssigned',0),(304,1048585,12,3,'2026-01-02 05:29:25',1073741825,'log.review.reviewerAssigned',0),(305,1048585,12,3,'2026-01-02 05:29:29',1073741825,'log.review.reviewerAssigned',0),(306,1048585,12,8,'2026-01-02 05:29:35',1073741830,'log.review.reviewAccepted',0),(307,1048585,12,8,'2026-01-02 05:29:38',1073741848,'log.review.reviewReady',0),(308,1048585,13,30,'2026-01-02 05:29:44',268435458,'submission.event.general.metadataUpdated',0),(309,1048585,13,30,'2026-01-02 05:29:44',268435458,'submission.event.general.metadataUpdated',0),(310,515,58,30,'2026-01-02 05:29:45',1342177281,'submission.event.fileUploaded',0),(311,1048585,13,30,'2026-01-02 05:29:45',1342177288,'submission.event.fileRevised',0),(312,515,58,30,'2026-01-02 05:29:45',1342177296,'submission.event.fileEdited',0),(313,1048585,13,30,'2026-01-02 05:29:45',1342177296,'submission.event.fileEdited',0),(314,515,59,30,'2026-01-02 05:29:45',1342177281,'submission.event.fileUploaded',0),(315,1048585,13,30,'2026-01-02 05:29:45',1342177288,'submission.event.fileRevised',0),(316,515,59,30,'2026-01-02 05:29:45',1342177296,'submission.event.fileEdited',0),(317,1048585,13,30,'2026-01-02 05:29:45',1342177296,'submission.event.fileEdited',0),(318,515,60,30,'2026-01-02 05:29:45',1342177281,'submission.event.fileUploaded',0),(319,1048585,13,30,'2026-01-02 05:29:45',1342177288,'submission.event.fileRevised',0),(320,515,60,30,'2026-01-02 05:29:46',1342177296,'submission.event.fileEdited',0),(321,1048585,13,30,'2026-01-02 05:29:46',1342177296,'submission.event.fileEdited',0),(322,1048585,13,30,'2026-01-02 05:29:48',268435458,'submission.event.general.metadataUpdated',0),(323,1048585,13,30,'2026-01-02 05:29:51',268435458,'submission.event.general.metadataUpdated',0),(324,1048585,13,30,'2026-01-02 05:29:53',268435458,'submission.event.general.metadataUpdated',0),(325,1048585,13,30,'2026-01-02 05:30:10',268435458,'submission.event.general.metadataUpdated',0),(326,1048585,13,30,'2026-01-02 05:30:11',268435457,'submission.event.submissionSubmitted',0),(327,1048585,13,3,'2026-01-02 05:30:17',805306371,'log.editor.decision',0),(328,515,61,3,'2026-01-02 05:30:17',1342177281,'submission.event.fileUploaded',0),(329,1048585,13,3,'2026-01-02 05:30:17',1342177288,'submission.event.fileRevised',0),(330,515,62,3,'2026-01-02 05:30:17',1342177281,'submission.event.fileUploaded',0),(331,1048585,13,3,'2026-01-02 05:30:17',1342177288,'submission.event.fileRevised',0),(332,515,63,3,'2026-01-02 05:30:17',1342177281,'submission.event.fileUploaded',0),(333,1048585,13,3,'2026-01-02 05:30:17',1342177288,'submission.event.fileRevised',0),(334,1048585,13,3,'2026-01-02 05:30:22',1073741825,'log.review.reviewerAssigned',0),(335,1048585,13,3,'2026-01-02 05:30:24',805306371,'log.editor.decision',0),(336,1048585,13,3,'2026-01-02 05:30:29',1073741825,'log.review.reviewerAssigned',0),(337,1048585,13,3,'2026-01-02 05:30:34',1073741825,'log.review.reviewerAssigned',0),(338,1048585,13,3,'2026-01-02 05:30:38',1073741825,'log.review.reviewerAssigned',0),(339,1048585,13,10,'2026-01-02 05:30:43',1073741830,'log.review.reviewAccepted',0),(340,1048585,13,10,'2026-01-02 05:30:46',1073741848,'log.review.reviewReady',0),(341,1048585,13,12,'2026-01-02 05:30:51',1073741830,'log.review.reviewAccepted',0),(342,1048585,13,12,'2026-01-02 05:30:54',1073741848,'log.review.reviewReady',0),(343,1048585,13,3,'2026-01-02 05:31:03',805306371,'log.editor.decision',0),(344,1048585,14,31,'2026-01-02 05:31:11',268435458,'submission.event.general.metadataUpdated',0),(345,1048585,14,31,'2026-01-02 05:31:11',268435458,'submission.event.general.metadataUpdated',0),(346,515,64,31,'2026-01-02 05:31:12',1342177281,'submission.event.fileUploaded',0),(347,1048585,14,31,'2026-01-02 05:31:12',1342177288,'submission.event.fileRevised',0),(348,515,64,31,'2026-01-02 05:31:12',1342177296,'submission.event.fileEdited',0),(349,1048585,14,31,'2026-01-02 05:31:12',1342177296,'submission.event.fileEdited',0),(350,515,65,31,'2026-01-02 05:31:12',1342177281,'submission.event.fileUploaded',0),(351,1048585,14,31,'2026-01-02 05:31:12',1342177288,'submission.event.fileRevised',0),(352,515,65,31,'2026-01-02 05:31:13',1342177296,'submission.event.fileEdited',0),(353,1048585,14,31,'2026-01-02 05:31:13',1342177296,'submission.event.fileEdited',0),(354,515,66,31,'2026-01-02 05:31:13',1342177281,'submission.event.fileUploaded',0),(355,1048585,14,31,'2026-01-02 05:31:13',1342177288,'submission.event.fileRevised',0),(356,515,66,31,'2026-01-02 05:31:13',1342177296,'submission.event.fileEdited',0),(357,1048585,14,31,'2026-01-02 05:31:13',1342177296,'submission.event.fileEdited',0),(358,515,67,31,'2026-01-02 05:31:13',1342177281,'submission.event.fileUploaded',0),(359,1048585,14,31,'2026-01-02 05:31:13',1342177288,'submission.event.fileRevised',0),(360,515,67,31,'2026-01-02 05:31:13',1342177296,'submission.event.fileEdited',0),(361,1048585,14,31,'2026-01-02 05:31:13',1342177296,'submission.event.fileEdited',0),(362,515,68,31,'2026-01-02 05:31:14',1342177281,'submission.event.fileUploaded',0),(363,1048585,14,31,'2026-01-02 05:31:14',1342177288,'submission.event.fileRevised',0),(364,515,68,31,'2026-01-02 05:31:14',1342177296,'submission.event.fileEdited',0),(365,1048585,14,31,'2026-01-02 05:31:14',1342177296,'submission.event.fileEdited',0),(366,515,69,31,'2026-01-02 05:31:14',1342177281,'submission.event.fileUploaded',0),(367,1048585,14,31,'2026-01-02 05:31:14',1342177288,'submission.event.fileRevised',0),(368,515,69,31,'2026-01-02 05:31:15',1342177296,'submission.event.fileEdited',0),(369,1048585,14,31,'2026-01-02 05:31:15',1342177296,'submission.event.fileEdited',0),(370,1048585,14,31,'2026-01-02 05:31:18',268435458,'submission.event.general.metadataUpdated',0),(371,1048585,14,31,'2026-01-02 05:31:21',268435458,'submission.event.general.metadataUpdated',0),(372,1048585,14,31,'2026-01-02 05:31:43',268435458,'submission.event.general.metadataUpdated',0),(373,1048585,14,31,'2026-01-02 05:31:44',268435457,'submission.event.submissionSubmitted',0),(374,1048585,14,3,'2026-01-02 05:31:51',805306371,'log.editor.decision',0),(375,515,70,3,'2026-01-02 05:31:51',1342177281,'submission.event.fileUploaded',0),(376,1048585,14,3,'2026-01-02 05:31:51',1342177288,'submission.event.fileRevised',0),(377,515,71,3,'2026-01-02 05:31:51',1342177281,'submission.event.fileUploaded',0),(378,1048585,14,3,'2026-01-02 05:31:51',1342177288,'submission.event.fileRevised',0),(379,515,72,3,'2026-01-02 05:31:51',1342177281,'submission.event.fileUploaded',0),(380,1048585,14,3,'2026-01-02 05:31:51',1342177288,'submission.event.fileRevised',0),(381,515,73,3,'2026-01-02 05:31:51',1342177281,'submission.event.fileUploaded',0),(382,1048585,14,3,'2026-01-02 05:31:51',1342177288,'submission.event.fileRevised',0),(383,515,74,3,'2026-01-02 05:31:51',1342177281,'submission.event.fileUploaded',0),(384,1048585,14,3,'2026-01-02 05:31:51',1342177288,'submission.event.fileRevised',0),(385,515,75,3,'2026-01-02 05:31:51',1342177281,'submission.event.fileUploaded',0),(386,1048585,14,3,'2026-01-02 05:31:51',1342177288,'submission.event.fileRevised',0),(387,1048585,14,3,'2026-01-02 05:31:57',1073741825,'log.review.reviewerAssigned',0),(388,1048585,14,3,'2026-01-02 05:31:59',805306371,'log.editor.decision',0),(389,1048585,14,3,'2026-01-02 05:32:04',1073741825,'log.review.reviewerAssigned',0),(390,1048585,14,3,'2026-01-02 05:32:06',805306371,'log.editor.decision',0),(391,1048585,14,3,'2026-01-02 05:32:10',268435459,'submission.event.participantAdded',0),(392,1048585,14,3,'2026-01-02 05:32:13',805306371,'log.editor.decision',0),(393,1048585,14,3,'2026-01-02 05:32:17',268435459,'submission.event.participantAdded',0),(394,1048585,14,3,'2026-01-02 05:32:21',268435459,'submission.event.participantAdded',0),(395,1048585,14,3,'2026-01-02 05:32:25',268435474,'submission.event.publicationFormatCreated',0),(396,515,76,3,'2026-01-02 05:32:30',1342177281,'submission.event.fileUploaded',0),(397,1048585,14,3,'2026-01-02 05:32:30',1342177288,'submission.event.fileRevised',0),(398,515,77,3,'2026-01-02 05:32:30',1342177281,'submission.event.fileUploaded',0),(399,1048585,14,3,'2026-01-02 05:32:30',1342177288,'submission.event.fileRevised',0),(400,515,78,3,'2026-01-02 05:32:30',1342177281,'submission.event.fileUploaded',0),(401,1048585,14,3,'2026-01-02 05:32:30',1342177288,'submission.event.fileRevised',0),(402,515,79,3,'2026-01-02 05:32:30',1342177281,'submission.event.fileUploaded',0),(403,1048585,14,3,'2026-01-02 05:32:30',1342177288,'submission.event.fileRevised',0),(404,515,80,3,'2026-01-02 05:32:30',1342177281,'submission.event.fileUploaded',0),(405,1048585,14,3,'2026-01-02 05:32:30',1342177288,'submission.event.fileRevised',0),(406,515,81,3,'2026-01-02 05:32:30',1342177281,'submission.event.fileUploaded',0),(407,1048585,14,3,'2026-01-02 05:32:30',1342177288,'submission.event.fileRevised',0),(408,1048585,14,3,'2026-01-02 05:32:31',268435464,'submission.event.publicationFormatPublished',0),(409,1048585,14,3,'2026-01-02 05:32:33',268435476,'submission.event.publicationFormatMadeAvailable',0),(410,515,76,3,'2026-01-02 05:32:34',1342177296,'submission.event.fileEdited',0),(411,1048585,14,3,'2026-01-02 05:32:34',1342177296,'submission.event.fileEdited',0),(412,515,76,3,'2026-01-02 05:32:34',1342177287,'submission.event.signoffSignoff',0),(413,515,77,3,'2026-01-02 05:32:38',1342177296,'submission.event.fileEdited',0),(414,1048585,14,3,'2026-01-02 05:32:38',1342177296,'submission.event.fileEdited',0),(415,515,77,3,'2026-01-02 05:32:38',1342177287,'submission.event.signoffSignoff',0),(416,515,78,3,'2026-01-02 05:32:41',1342177296,'submission.event.fileEdited',0),(417,1048585,14,3,'2026-01-02 05:32:41',1342177296,'submission.event.fileEdited',0),(418,515,78,3,'2026-01-02 05:32:41',1342177287,'submission.event.signoffSignoff',0),(419,515,79,3,'2026-01-02 05:32:45',1342177296,'submission.event.fileEdited',0),(420,1048585,14,3,'2026-01-02 05:32:45',1342177296,'submission.event.fileEdited',0),(421,515,79,3,'2026-01-02 05:32:45',1342177287,'submission.event.signoffSignoff',0),(422,515,80,3,'2026-01-02 05:32:48',1342177296,'submission.event.fileEdited',0),(423,1048585,14,3,'2026-01-02 05:32:48',1342177296,'submission.event.fileEdited',0),(424,515,80,3,'2026-01-02 05:32:48',1342177287,'submission.event.signoffSignoff',0),(425,515,81,3,'2026-01-02 05:32:52',1342177296,'submission.event.fileEdited',0),(426,1048585,14,3,'2026-01-02 05:32:52',1342177296,'submission.event.fileEdited',0),(427,515,81,3,'2026-01-02 05:32:52',1342177287,'submission.event.signoffSignoff',0),(428,1048585,14,3,'2026-01-02 05:32:56',268435462,'publication.event.published',0),(429,1048585,15,32,'2026-01-02 05:33:01',268435458,'submission.event.general.metadataUpdated',0),(430,1048585,15,32,'2026-01-02 05:33:01',268435458,'submission.event.general.metadataUpdated',0),(431,515,82,32,'2026-01-02 05:33:02',1342177281,'submission.event.fileUploaded',0),(432,1048585,15,32,'2026-01-02 05:33:02',1342177288,'submission.event.fileRevised',0),(433,515,82,32,'2026-01-02 05:33:02',1342177296,'submission.event.fileEdited',0),(434,1048585,15,32,'2026-01-02 05:33:02',1342177296,'submission.event.fileEdited',0),(435,1048585,15,32,'2026-01-02 05:33:14',268435458,'submission.event.general.metadataUpdated',0),(436,1048585,15,32,'2026-01-02 05:33:14',268435457,'submission.event.submissionSubmitted',0),(437,1048585,15,3,'2026-01-02 05:33:20',805306371,'log.editor.decision',0),(438,515,83,3,'2026-01-02 05:33:20',1342177281,'submission.event.fileUploaded',0),(439,1048585,15,3,'2026-01-02 05:33:20',1342177288,'submission.event.fileRevised',0),(440,1048585,16,33,'2026-01-02 05:33:27',268435458,'submission.event.general.metadataUpdated',0),(441,1048585,16,33,'2026-01-02 05:33:27',268435458,'submission.event.general.metadataUpdated',0),(442,515,84,33,'2026-01-02 05:33:28',1342177281,'submission.event.fileUploaded',0),(443,1048585,16,33,'2026-01-02 05:33:28',1342177288,'submission.event.fileRevised',0),(444,515,84,33,'2026-01-02 05:33:28',1342177296,'submission.event.fileEdited',0),(445,1048585,16,33,'2026-01-02 05:33:28',1342177296,'submission.event.fileEdited',0),(446,1048585,16,33,'2026-01-02 05:33:46',268435458,'submission.event.general.metadataUpdated',0),(447,1048585,16,33,'2026-01-02 05:33:47',268435457,'submission.event.submissionSubmitted',0),(448,1048585,16,3,'2026-01-02 05:33:53',805306371,'log.editor.decision',0),(449,515,85,3,'2026-01-02 05:33:53',1342177281,'submission.event.fileUploaded',0),(450,1048585,16,3,'2026-01-02 05:33:53',1342177288,'submission.event.fileRevised',0),(451,1048585,16,3,'2026-01-02 05:33:57',1073741825,'log.review.reviewerAssigned',0),(452,1048585,16,3,'2026-01-02 05:34:01',1073741825,'log.review.reviewerAssigned',0),(453,1048585,16,3,'2026-01-02 05:34:05',1073741825,'log.review.reviewerAssigned',0),(454,1048585,16,10,'2026-01-02 05:34:09',1073741830,'log.review.reviewAccepted',0),(455,1048585,16,10,'2026-01-02 05:34:12',1073741848,'log.review.reviewReady',0),(456,1048585,17,34,'2026-01-02 05:34:18',268435458,'submission.event.general.metadataUpdated',0),(457,1048585,17,34,'2026-01-02 05:34:18',268435458,'submission.event.general.metadataUpdated',0),(458,515,86,34,'2026-01-02 05:34:19',1342177281,'submission.event.fileUploaded',0),(459,1048585,17,34,'2026-01-02 05:34:19',1342177288,'submission.event.fileRevised',0),(460,515,86,34,'2026-01-02 05:34:19',1342177296,'submission.event.fileEdited',0),(461,1048585,17,34,'2026-01-02 05:34:19',1342177296,'submission.event.fileEdited',0),(462,515,87,34,'2026-01-02 05:34:19',1342177281,'submission.event.fileUploaded',0),(463,1048585,17,34,'2026-01-02 05:34:19',1342177288,'submission.event.fileRevised',0),(464,515,87,34,'2026-01-02 05:34:19',1342177296,'submission.event.fileEdited',0),(465,1048585,17,34,'2026-01-02 05:34:19',1342177296,'submission.event.fileEdited',0),(466,515,88,34,'2026-01-02 05:34:19',1342177281,'submission.event.fileUploaded',0),(467,1048585,17,34,'2026-01-02 05:34:19',1342177288,'submission.event.fileRevised',0),(468,515,88,34,'2026-01-02 05:34:20',1342177296,'submission.event.fileEdited',0),(469,1048585,17,34,'2026-01-02 05:34:20',1342177296,'submission.event.fileEdited',0),(470,515,89,34,'2026-01-02 05:34:20',1342177281,'submission.event.fileUploaded',0),(471,1048585,17,34,'2026-01-02 05:34:20',1342177288,'submission.event.fileRevised',0),(472,515,89,34,'2026-01-02 05:34:20',1342177296,'submission.event.fileEdited',0),(473,1048585,17,34,'2026-01-02 05:34:20',1342177296,'submission.event.fileEdited',0),(474,515,90,34,'2026-01-02 05:34:20',1342177281,'submission.event.fileUploaded',0),(475,1048585,17,34,'2026-01-02 05:34:20',1342177288,'submission.event.fileRevised',0),(476,515,90,34,'2026-01-02 05:34:20',1342177296,'submission.event.fileEdited',0),(477,1048585,17,34,'2026-01-02 05:34:20',1342177296,'submission.event.fileEdited',0),(478,515,91,34,'2026-01-02 05:34:21',1342177281,'submission.event.fileUploaded',0),(479,1048585,17,34,'2026-01-02 05:34:21',1342177288,'submission.event.fileRevised',0),(480,515,91,34,'2026-01-02 05:34:21',1342177296,'submission.event.fileEdited',0),(481,1048585,17,34,'2026-01-02 05:34:21',1342177296,'submission.event.fileEdited',0),(482,1048585,17,34,'2026-01-02 05:34:24',268435458,'submission.event.general.metadataUpdated',0),(483,1048585,17,34,'2026-01-02 05:34:26',268435458,'submission.event.general.metadataUpdated',0),(484,1048585,17,34,'2026-01-02 05:34:28',268435458,'submission.event.general.metadataUpdated',0),(485,1048585,17,34,'2026-01-02 05:34:31',268435458,'submission.event.general.metadataUpdated',0),(486,1048585,17,34,'2026-01-02 05:34:33',268435458,'submission.event.general.metadataUpdated',0),(487,1048585,17,34,'2026-01-02 05:34:36',268435458,'submission.event.general.metadataUpdated',0),(488,1048585,17,34,'2026-01-02 05:34:38',268435458,'submission.event.general.metadataUpdated',0),(489,1048585,17,34,'2026-01-02 05:35:17',268435458,'submission.event.general.metadataUpdated',0),(490,1048585,17,34,'2026-01-02 05:35:19',268435457,'submission.event.submissionSubmitted',0),(491,1048585,17,3,'2026-01-02 05:35:27',805306371,'log.editor.decision',0),(492,515,92,3,'2026-01-02 05:35:27',1342177281,'submission.event.fileUploaded',0),(493,1048585,17,3,'2026-01-02 05:35:27',1342177288,'submission.event.fileRevised',0),(494,515,93,3,'2026-01-02 05:35:27',1342177281,'submission.event.fileUploaded',0),(495,1048585,17,3,'2026-01-02 05:35:27',1342177288,'submission.event.fileRevised',0),(496,515,94,3,'2026-01-02 05:35:27',1342177281,'submission.event.fileUploaded',0),(497,1048585,17,3,'2026-01-02 05:35:27',1342177288,'submission.event.fileRevised',0),(498,515,95,3,'2026-01-02 05:35:27',1342177281,'submission.event.fileUploaded',0),(499,1048585,17,3,'2026-01-02 05:35:27',1342177288,'submission.event.fileRevised',0),(500,515,96,3,'2026-01-02 05:35:27',1342177281,'submission.event.fileUploaded',0),(501,1048585,17,3,'2026-01-02 05:35:27',1342177288,'submission.event.fileRevised',0),(502,515,97,3,'2026-01-02 05:35:27',1342177281,'submission.event.fileUploaded',0),(503,1048585,17,3,'2026-01-02 05:35:27',1342177288,'submission.event.fileRevised',0),(504,1048585,17,3,'2026-01-02 05:35:34',1073741825,'log.review.reviewerAssigned',0),(505,1048585,17,3,'2026-01-02 05:35:39',1073741825,'log.review.reviewerAssigned',0);
/*!40000 ALTER TABLE `event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log_settings`
--

DROP TABLE IF EXISTS `event_log_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_log_settings` (
  `log_id` bigint NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `event_log_settings_pkey` (`log_id`,`setting_name`),
  KEY `event_log_settings_log_id` (`log_id`),
  KEY `event_log_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
INSERT INTO `event_log_settings` VALUES (3,'fileId','1','int'),(3,'fileStage','2','int'),(3,'originalFileName','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(3,'sourceSubmissionFileId',NULL,'string'),(3,'submissionFileId','1','int'),(3,'submissionId','1','int'),(3,'username','aclark','string'),(4,'fileId','1','int'),(4,'fileStage','2','int'),(4,'name','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(4,'submissionFileId','1','int'),(4,'submissionId','1','int'),(4,'username','aclark','string'),(5,'fileId','1','int'),(5,'fileStage','2','int'),(5,'originalFileName','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(5,'sourceSubmissionFileId',NULL,'string'),(5,'submissionFileId','1','int'),(5,'submissionId','1','int'),(5,'username','aclark','string'),(6,'fileId','1','int'),(6,'fileStage','2','int'),(6,'name','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(6,'originalFileName','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(6,'sourceSubmissionFileId',NULL,'string'),(6,'submissionFileId','1','int'),(6,'submissionId','1','int'),(6,'username','aclark','string'),(9,'decision','Send to External Review','string'),(9,'editorName','Daniel Barnes','string'),(9,'submissionId','1','int'),(10,'fileId','1','int'),(10,'fileStage','4','int'),(10,'originalFileName','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(10,'sourceSubmissionFileId','1','int'),(10,'submissionFileId','2','int'),(10,'submissionId','1','int'),(10,'username','dbarnes','string'),(11,'fileId','1','int'),(11,'fileStage','4','int'),(11,'name','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(11,'submissionFileId','2','int'),(11,'submissionId','1','int'),(11,'username','dbarnes','string'),(12,'reviewAssignmentId','1','string'),(12,'reviewerName','Gonzalo Favio','string'),(12,'round','1','int'),(12,'stageId','3','int'),(12,'submissionId','1','int'),(13,'decision','Accept Submission','string'),(13,'editorName','Daniel Barnes','string'),(13,'submissionId','1','int'),(14,'name','Sarah Vogt','string'),(14,'userGroupName','Copyeditor','string'),(14,'username','svogt','string'),(17,'fileId','2','int'),(17,'fileStage','2','int'),(17,'originalFileName','Critical History in Western Canada 1900–.pdf','string'),(17,'sourceSubmissionFileId',NULL,'string'),(17,'submissionFileId','3','int'),(17,'submissionId','2','int'),(17,'username','afinkel','string'),(18,'fileId','2','int'),(18,'fileStage','2','int'),(18,'name','Critical History in Western Canada 1900–.pdf','string'),(18,'submissionFileId','3','int'),(18,'submissionId','2','int'),(18,'username','afinkel','string'),(19,'fileId','2','int'),(19,'fileStage','2','int'),(19,'originalFileName','Critical History in Western Canada 1900–.pdf','string'),(19,'sourceSubmissionFileId',NULL,'string'),(19,'submissionFileId','3','int'),(19,'submissionId','2','int'),(19,'username','afinkel','string'),(20,'fileId','2','int'),(20,'fileStage','2','int'),(20,'name','Critical History in Western Canada 1900–.pdf','string'),(20,'originalFileName','Critical History in Western Canada 1900–.pdf','string'),(20,'sourceSubmissionFileId',NULL,'string'),(20,'submissionFileId','3','int'),(20,'submissionId','2','int'),(20,'username','afinkel','string'),(21,'fileId','3','int'),(21,'fileStage','2','int'),(21,'originalFileName','Vernacular Currents in Western Canadian .pdf','string'),(21,'sourceSubmissionFileId',NULL,'string'),(21,'submissionFileId','4','int'),(21,'submissionId','2','int'),(21,'username','afinkel','string'),(22,'fileId','3','int'),(22,'fileStage','2','int'),(22,'name','Vernacular Currents in Western Canadian .pdf','string'),(22,'submissionFileId','4','int'),(22,'submissionId','2','int'),(22,'username','afinkel','string'),(23,'fileId','3','int'),(23,'fileStage','2','int'),(23,'originalFileName','Vernacular Currents in Western Canadian .pdf','string'),(23,'sourceSubmissionFileId',NULL,'string'),(23,'submissionFileId','4','int'),(23,'submissionId','2','int'),(23,'username','afinkel','string'),(24,'fileId','3','int'),(24,'fileStage','2','int'),(24,'name','Vernacular Currents in Western Canadian .pdf','string'),(24,'originalFileName','Vernacular Currents in Western Canadian .pdf','string'),(24,'sourceSubmissionFileId',NULL,'string'),(24,'submissionFileId','4','int'),(24,'submissionId','2','int'),(24,'username','afinkel','string'),(25,'fileId','4','int'),(25,'fileStage','2','int'),(25,'originalFileName','Cree Intellectual Traditions in History.pdf','string'),(25,'sourceSubmissionFileId',NULL,'string'),(25,'submissionFileId','5','int'),(25,'submissionId','2','int'),(25,'username','afinkel','string'),(26,'fileId','4','int'),(26,'fileStage','2','int'),(26,'name','Cree Intellectual Traditions in History.pdf','string'),(26,'submissionFileId','5','int'),(26,'submissionId','2','int'),(26,'username','afinkel','string'),(27,'fileId','4','int'),(27,'fileStage','2','int'),(27,'originalFileName','Cree Intellectual Traditions in History.pdf','string'),(27,'sourceSubmissionFileId',NULL,'string'),(27,'submissionFileId','5','int'),(27,'submissionId','2','int'),(27,'username','afinkel','string'),(28,'fileId','4','int'),(28,'fileStage','2','int'),(28,'name','Cree Intellectual Traditions in History.pdf','string'),(28,'originalFileName','Cree Intellectual Traditions in History.pdf','string'),(28,'sourceSubmissionFileId',NULL,'string'),(28,'submissionFileId','5','int'),(28,'submissionId','2','int'),(28,'username','afinkel','string'),(29,'fileId','5','int'),(29,'fileStage','2','int'),(29,'originalFileName','Visualizing Space, Race, and History in .pdf','string'),(29,'sourceSubmissionFileId',NULL,'string'),(29,'submissionFileId','6','int'),(29,'submissionId','2','int'),(29,'username','afinkel','string'),(30,'fileId','5','int'),(30,'fileStage','2','int'),(30,'name','Visualizing Space, Race, and History in .pdf','string'),(30,'submissionFileId','6','int'),(30,'submissionId','2','int'),(30,'username','afinkel','string'),(31,'fileId','5','int'),(31,'fileStage','2','int'),(31,'originalFileName','Visualizing Space, Race, and History in .pdf','string'),(31,'sourceSubmissionFileId',NULL,'string'),(31,'submissionFileId','6','int'),(31,'submissionId','2','int'),(31,'username','afinkel','string'),(32,'fileId','5','int'),(32,'fileStage','2','int'),(32,'name','Visualizing Space, Race, and History in .pdf','string'),(32,'originalFileName','Visualizing Space, Race, and History in .pdf','string'),(32,'sourceSubmissionFileId',NULL,'string'),(32,'submissionFileId','6','int'),(32,'submissionId','2','int'),(32,'username','afinkel','string'),(42,'decision','Send to External Review','string'),(42,'editorName','Daniel Barnes','string'),(42,'submissionId','2','int'),(43,'fileId','2','int'),(43,'fileStage','4','int'),(43,'originalFileName','Critical History in Western Canada 1900–.pdf','string'),(43,'sourceSubmissionFileId','3','int'),(43,'submissionFileId','7','int'),(43,'submissionId','2','int'),(43,'username','dbarnes','string'),(44,'fileId','2','int'),(44,'fileStage','4','int'),(44,'name','Critical History in Western Canada 1900–.pdf','string'),(44,'submissionFileId','7','int'),(44,'submissionId','2','int'),(44,'username','dbarnes','string'),(45,'fileId','3','int'),(45,'fileStage','4','int'),(45,'originalFileName','Vernacular Currents in Western Canadian .pdf','string'),(45,'sourceSubmissionFileId','4','int'),(45,'submissionFileId','8','int'),(45,'submissionId','2','int'),(45,'username','dbarnes','string'),(46,'fileId','3','int'),(46,'fileStage','4','int'),(46,'name','Vernacular Currents in Western Canadian .pdf','string'),(46,'submissionFileId','8','int'),(46,'submissionId','2','int'),(46,'username','dbarnes','string'),(47,'fileId','4','int'),(47,'fileStage','4','int'),(47,'originalFileName','Cree Intellectual Traditions in History.pdf','string'),(47,'sourceSubmissionFileId','5','int'),(47,'submissionFileId','9','int'),(47,'submissionId','2','int'),(47,'username','dbarnes','string'),(48,'fileId','4','int'),(48,'fileStage','4','int'),(48,'name','Cree Intellectual Traditions in History.pdf','string'),(48,'submissionFileId','9','int'),(48,'submissionId','2','int'),(48,'username','dbarnes','string'),(49,'fileId','5','int'),(49,'fileStage','4','int'),(49,'originalFileName','Visualizing Space, Race, and History in .pdf','string'),(49,'sourceSubmissionFileId','6','int'),(49,'submissionFileId','10','int'),(49,'submissionId','2','int'),(49,'username','dbarnes','string'),(50,'fileId','5','int'),(50,'fileStage','4','int'),(50,'name','Visualizing Space, Race, and History in .pdf','string'),(50,'submissionFileId','10','int'),(50,'submissionId','2','int'),(50,'username','dbarnes','string'),(51,'reviewAssignmentId','2','string'),(51,'reviewerName','Al Zacharia','string'),(51,'round','1','int'),(51,'stageId','3','int'),(51,'submissionId','2','int'),(52,'reviewAssignmentId','3','string'),(52,'reviewerName','Gonzalo Favio','string'),(52,'round','1','int'),(52,'stageId','3','int'),(52,'submissionId','2','int'),(55,'fileId','6','int'),(55,'fileStage','2','int'),(55,'originalFileName','The Political Economy of Workplace Injury in Canada.pdf','string'),(55,'sourceSubmissionFileId',NULL,'string'),(55,'submissionFileId','11','int'),(55,'submissionId','3','int'),(55,'username','bbarnetson','string'),(56,'fileId','6','int'),(56,'fileStage','2','int'),(56,'name','The Political Economy of Workplace Injury in Canada.pdf','string'),(56,'submissionFileId','11','int'),(56,'submissionId','3','int'),(56,'username','bbarnetson','string'),(57,'fileId','6','int'),(57,'fileStage','2','int'),(57,'originalFileName','The Political Economy of Workplace Injury in Canada.pdf','string'),(57,'sourceSubmissionFileId',NULL,'string'),(57,'submissionFileId','11','int'),(57,'submissionId','3','int'),(57,'username','bbarnetson','string'),(58,'fileId','6','int'),(58,'fileStage','2','int'),(58,'name','The Political Economy of Workplace Injury in Canada.pdf','string'),(58,'originalFileName','The Political Economy of Workplace Injury in Canada.pdf','string'),(58,'sourceSubmissionFileId',NULL,'string'),(58,'submissionFileId','11','int'),(58,'submissionId','3','int'),(58,'username','bbarnetson','string'),(63,'fileId','7','int'),(63,'fileStage','2','int'),(63,'originalFileName','Introduction: Contexts of Popular Cultur.pdf','string'),(63,'sourceSubmissionFileId',NULL,'string'),(63,'submissionFileId','12','int'),(63,'submissionId','4','int'),(63,'username','bbeaty','string'),(64,'fileId','7','int'),(64,'fileStage','2','int'),(64,'name','Introduction: Contexts of Popular Cultur.pdf','string'),(64,'submissionFileId','12','int'),(64,'submissionId','4','int'),(64,'username','bbeaty','string'),(65,'fileId','7','int'),(65,'fileStage','2','int'),(65,'originalFileName','Introduction: Contexts of Popular Cultur.pdf','string'),(65,'sourceSubmissionFileId',NULL,'string'),(65,'submissionFileId','12','int'),(65,'submissionId','4','int'),(65,'username','bbeaty','string'),(66,'fileId','7','int'),(66,'fileStage','2','int'),(66,'name','Introduction: Contexts of Popular Cultur.pdf','string'),(66,'originalFileName','Introduction: Contexts of Popular Cultur.pdf','string'),(66,'sourceSubmissionFileId',NULL,'string'),(66,'submissionFileId','12','int'),(66,'submissionId','4','int'),(66,'username','bbeaty','string'),(67,'fileId','8','int'),(67,'fileStage','2','int'),(67,'originalFileName','Chapter 1. A Future for Media Studies: C.pdf','string'),(67,'sourceSubmissionFileId',NULL,'string'),(67,'submissionFileId','13','int'),(67,'submissionId','4','int'),(67,'username','bbeaty','string'),(68,'fileId','8','int'),(68,'fileStage','2','int'),(68,'name','Chapter 1. A Future for Media Studies: C.pdf','string'),(68,'submissionFileId','13','int'),(68,'submissionId','4','int'),(68,'username','bbeaty','string'),(69,'fileId','8','int'),(69,'fileStage','2','int'),(69,'originalFileName','Chapter 1. A Future for Media Studies: C.pdf','string'),(69,'sourceSubmissionFileId',NULL,'string'),(69,'submissionFileId','13','int'),(69,'submissionId','4','int'),(69,'username','bbeaty','string'),(70,'fileId','8','int'),(70,'fileStage','2','int'),(70,'name','Chapter 1. A Future for Media Studies: C.pdf','string'),(70,'originalFileName','Chapter 1. A Future for Media Studies: C.pdf','string'),(70,'sourceSubmissionFileId',NULL,'string'),(70,'submissionFileId','13','int'),(70,'submissionId','4','int'),(70,'username','bbeaty','string'),(71,'fileId','9','int'),(71,'fileStage','2','int'),(71,'originalFileName','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(71,'sourceSubmissionFileId',NULL,'string'),(71,'submissionFileId','14','int'),(71,'submissionId','4','int'),(71,'username','bbeaty','string'),(72,'fileId','9','int'),(72,'fileStage','2','int'),(72,'name','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(72,'submissionFileId','14','int'),(72,'submissionId','4','int'),(72,'username','bbeaty','string'),(73,'fileId','9','int'),(73,'fileStage','2','int'),(73,'originalFileName','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(73,'sourceSubmissionFileId',NULL,'string'),(73,'submissionFileId','14','int'),(73,'submissionId','4','int'),(73,'username','bbeaty','string'),(74,'fileId','9','int'),(74,'fileStage','2','int'),(74,'name','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(74,'originalFileName','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(74,'sourceSubmissionFileId',NULL,'string'),(74,'submissionFileId','14','int'),(74,'submissionId','4','int'),(74,'username','bbeaty','string'),(75,'fileId','10','int'),(75,'fileStage','2','int'),(75,'originalFileName','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(75,'sourceSubmissionFileId',NULL,'string'),(75,'submissionFileId','15','int'),(75,'submissionId','4','int'),(75,'username','bbeaty','string'),(76,'fileId','10','int'),(76,'fileStage','2','int'),(76,'name','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(76,'submissionFileId','15','int'),(76,'submissionId','4','int'),(76,'username','bbeaty','string'),(77,'fileId','10','int'),(77,'fileStage','2','int'),(77,'originalFileName','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(77,'sourceSubmissionFileId',NULL,'string'),(77,'submissionFileId','15','int'),(77,'submissionId','4','int'),(77,'username','bbeaty','string'),(78,'fileId','10','int'),(78,'fileStage','2','int'),(78,'name','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(78,'originalFileName','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(78,'sourceSubmissionFileId',NULL,'string'),(78,'submissionFileId','15','int'),(78,'submissionId','4','int'),(78,'username','bbeaty','string'),(84,'decision','Send to Internal Review','string'),(84,'editorName','Daniel Barnes','string'),(84,'submissionId','4','int'),(85,'fileId','7','int'),(85,'fileStage','19','int'),(85,'originalFileName','Introduction: Contexts of Popular Cultur.pdf','string'),(85,'sourceSubmissionFileId','12','int'),(85,'submissionFileId','16','int'),(85,'submissionId','4','int'),(85,'username','dbarnes','string'),(86,'fileId','7','int'),(86,'fileStage','19','int'),(86,'name','Introduction: Contexts of Popular Cultur.pdf','string'),(86,'submissionFileId','16','int'),(86,'submissionId','4','int'),(86,'username','dbarnes','string'),(87,'fileId','8','int'),(87,'fileStage','19','int'),(87,'originalFileName','Chapter 1. A Future for Media Studies: C.pdf','string'),(87,'sourceSubmissionFileId','13','int'),(87,'submissionFileId','17','int'),(87,'submissionId','4','int'),(87,'username','dbarnes','string'),(88,'fileId','8','int'),(88,'fileStage','19','int'),(88,'name','Chapter 1. A Future for Media Studies: C.pdf','string'),(88,'submissionFileId','17','int'),(88,'submissionId','4','int'),(88,'username','dbarnes','string'),(89,'fileId','9','int'),(89,'fileStage','19','int'),(89,'originalFileName','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(89,'sourceSubmissionFileId','14','int'),(89,'submissionFileId','18','int'),(89,'submissionId','4','int'),(89,'username','dbarnes','string'),(90,'fileId','9','int'),(90,'fileStage','19','int'),(90,'name','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(90,'submissionFileId','18','int'),(90,'submissionId','4','int'),(90,'username','dbarnes','string'),(91,'fileId','10','int'),(91,'fileStage','19','int'),(91,'originalFileName','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(91,'sourceSubmissionFileId','15','int'),(91,'submissionFileId','19','int'),(91,'submissionId','4','int'),(91,'username','dbarnes','string'),(92,'fileId','10','int'),(92,'fileStage','19','int'),(92,'name','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(92,'submissionFileId','19','int'),(92,'submissionId','4','int'),(92,'username','dbarnes','string'),(93,'reviewAssignmentId','4','string'),(93,'reviewerName','Aisla McCrae','string'),(93,'round','1','int'),(93,'stageId','2','int'),(93,'submissionId','4','int'),(94,'decision','Send to External Review','string'),(94,'editorName','Daniel Barnes','string'),(94,'submissionId','4','int'),(95,'reviewAssignmentId','5','string'),(95,'reviewerName','Al Zacharia','string'),(95,'round','1','int'),(95,'stageId','3','int'),(95,'submissionId','4','int'),(96,'decision','Accept Submission','string'),(96,'editorName','Daniel Barnes','string'),(96,'submissionId','4','int'),(97,'name','Maria Fritz','string'),(97,'userGroupName','Copyeditor','string'),(97,'username','mfritz','string'),(98,'decision','Send To Production','string'),(98,'editorName','Daniel Barnes','string'),(98,'submissionId','4','int'),(99,'name','Graham Cox','string'),(99,'userGroupName','Layout Editor','string'),(99,'username','gcox','string'),(102,'fileId','11','int'),(102,'fileStage','2','int'),(102,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(102,'sourceSubmissionFileId',NULL,'string'),(102,'submissionFileId','20','int'),(102,'submissionId','5','int'),(102,'username','callan','string'),(103,'fileId','11','int'),(103,'fileStage','2','int'),(103,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(103,'submissionFileId','20','int'),(103,'submissionId','5','int'),(103,'username','callan','string'),(104,'fileId','11','int'),(104,'fileStage','2','int'),(104,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(104,'sourceSubmissionFileId',NULL,'string'),(104,'submissionFileId','20','int'),(104,'submissionId','5','int'),(104,'username','callan','string'),(105,'fileId','11','int'),(105,'fileStage','2','int'),(105,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(105,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(105,'sourceSubmissionFileId',NULL,'string'),(105,'submissionFileId','20','int'),(105,'submissionId','5','int'),(105,'username','callan','string'),(108,'decision','Send to Internal Review','string'),(108,'editorName','Daniel Barnes','string'),(108,'submissionId','5','int'),(109,'fileId','11','int'),(109,'fileStage','19','int'),(109,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(109,'sourceSubmissionFileId','20','int'),(109,'submissionFileId','21','int'),(109,'submissionId','5','int'),(109,'username','dbarnes','string'),(110,'fileId','11','int'),(110,'fileStage','19','int'),(110,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(110,'submissionFileId','21','int'),(110,'submissionId','5','int'),(110,'username','dbarnes','string'),(111,'reviewAssignmentId','6','string'),(111,'reviewerName','Paul Hudson','string'),(111,'round','1','int'),(111,'stageId','2','int'),(111,'submissionId','5','int'),(112,'decision','Send to External Review','string'),(112,'editorName','Daniel Barnes','string'),(112,'submissionId','5','int'),(113,'reviewAssignmentId','7','string'),(113,'reviewerName','Gonzalo Favio','string'),(113,'round','1','int'),(113,'stageId','3','int'),(113,'submissionId','5','int'),(114,'decision','Accept Submission','string'),(114,'editorName','Daniel Barnes','string'),(114,'submissionId','5','int'),(115,'name','Sarah Vogt','string'),(115,'userGroupName','Copyeditor','string'),(115,'username','svogt','string'),(116,'decision','Send To Production','string'),(116,'editorName','Daniel Barnes','string'),(116,'submissionId','5','int'),(117,'name','Stephen Hellier','string'),(117,'userGroupName','Layout Editor','string'),(117,'username','shellier','string'),(118,'name','Catherine Turner','string'),(118,'userGroupName','Proofreader','string'),(118,'username','cturner','string'),(119,'formatName','PDF','string'),(120,'fileId','11','int'),(120,'fileStage','10','int'),(120,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(120,'sourceSubmissionFileId','20','int'),(120,'submissionFileId','22','int'),(120,'submissionId','5','int'),(120,'username','dbarnes','string'),(121,'fileId','11','int'),(121,'fileStage','10','int'),(121,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(121,'submissionFileId','22','int'),(121,'submissionId','5','int'),(121,'username','dbarnes','string'),(122,'publicationFormatName','PDF','string'),(123,'publicationFormatName','PDF','string'),(124,'fileId','11','int'),(124,'fileStage','10','int'),(124,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(124,'sourceSubmissionFileId','20','int'),(124,'submissionFileId','22','int'),(124,'submissionId','5','int'),(124,'username','dbarnes','string'),(125,'fileId','11','int'),(125,'fileStage','10','int'),(125,'name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(125,'originalFileName','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(125,'sourceSubmissionFileId','20','int'),(125,'submissionFileId','22','int'),(125,'submissionId','5','int'),(125,'username','dbarnes','string'),(126,'file','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(126,'name','Daniel Barnes','string'),(126,'username','dbarnes','string'),(130,'fileId','12','int'),(130,'fileStage','2','int'),(130,'originalFileName','Identify: Understanding Your Information.pdf','string'),(130,'sourceSubmissionFileId',NULL,'string'),(130,'submissionFileId','23','int'),(130,'submissionId','6','int'),(130,'username','dbernnard','string'),(131,'fileId','12','int'),(131,'fileStage','2','int'),(131,'name','Identify: Understanding Your Information.pdf','string'),(131,'submissionFileId','23','int'),(131,'submissionId','6','int'),(131,'username','dbernnard','string'),(132,'fileId','12','int'),(132,'fileStage','2','int'),(132,'originalFileName','Identify: Understanding Your Information.pdf','string'),(132,'sourceSubmissionFileId',NULL,'string'),(132,'submissionFileId','23','int'),(132,'submissionId','6','int'),(132,'username','dbernnard','string'),(133,'fileId','12','int'),(133,'fileStage','2','int'),(133,'name','Identify: Understanding Your Information.pdf','string'),(133,'originalFileName','Identify: Understanding Your Information.pdf','string'),(133,'sourceSubmissionFileId',NULL,'string'),(133,'submissionFileId','23','int'),(133,'submissionId','6','int'),(133,'username','dbernnard','string'),(134,'fileId','13','int'),(134,'fileStage','2','int'),(134,'originalFileName','Scope: Knowing What Is Available.pdf','string'),(134,'sourceSubmissionFileId',NULL,'string'),(134,'submissionFileId','24','int'),(134,'submissionId','6','int'),(134,'username','dbernnard','string'),(135,'fileId','13','int'),(135,'fileStage','2','int'),(135,'name','Scope: Knowing What Is Available.pdf','string'),(135,'submissionFileId','24','int'),(135,'submissionId','6','int'),(135,'username','dbernnard','string'),(136,'fileId','13','int'),(136,'fileStage','2','int'),(136,'originalFileName','Scope: Knowing What Is Available.pdf','string'),(136,'sourceSubmissionFileId',NULL,'string'),(136,'submissionFileId','24','int'),(136,'submissionId','6','int'),(136,'username','dbernnard','string'),(137,'fileId','13','int'),(137,'fileStage','2','int'),(137,'name','Scope: Knowing What Is Available.pdf','string'),(137,'originalFileName','Scope: Knowing What Is Available.pdf','string'),(137,'sourceSubmissionFileId',NULL,'string'),(137,'submissionFileId','24','int'),(137,'submissionId','6','int'),(137,'username','dbernnard','string'),(138,'fileId','14','int'),(138,'fileStage','2','int'),(138,'originalFileName','Plan: Developing Research Strategies.pdf','string'),(138,'sourceSubmissionFileId',NULL,'string'),(138,'submissionFileId','25','int'),(138,'submissionId','6','int'),(138,'username','dbernnard','string'),(139,'fileId','14','int'),(139,'fileStage','2','int'),(139,'name','Plan: Developing Research Strategies.pdf','string'),(139,'submissionFileId','25','int'),(139,'submissionId','6','int'),(139,'username','dbernnard','string'),(140,'fileId','14','int'),(140,'fileStage','2','int'),(140,'originalFileName','Plan: Developing Research Strategies.pdf','string'),(140,'sourceSubmissionFileId',NULL,'string'),(140,'submissionFileId','25','int'),(140,'submissionId','6','int'),(140,'username','dbernnard','string'),(141,'fileId','14','int'),(141,'fileStage','2','int'),(141,'name','Plan: Developing Research Strategies.pdf','string'),(141,'originalFileName','Plan: Developing Research Strategies.pdf','string'),(141,'sourceSubmissionFileId',NULL,'string'),(141,'submissionFileId','25','int'),(141,'submissionId','6','int'),(141,'username','dbernnard','string'),(142,'fileId','15','int'),(142,'fileStage','2','int'),(142,'originalFileName','Gather: Finding What You Need.pdf','string'),(142,'sourceSubmissionFileId',NULL,'string'),(142,'submissionFileId','26','int'),(142,'submissionId','6','int'),(142,'username','dbernnard','string'),(143,'fileId','15','int'),(143,'fileStage','2','int'),(143,'name','Gather: Finding What You Need.pdf','string'),(143,'submissionFileId','26','int'),(143,'submissionId','6','int'),(143,'username','dbernnard','string'),(144,'fileId','15','int'),(144,'fileStage','2','int'),(144,'originalFileName','Gather: Finding What You Need.pdf','string'),(144,'sourceSubmissionFileId',NULL,'string'),(144,'submissionFileId','26','int'),(144,'submissionId','6','int'),(144,'username','dbernnard','string'),(145,'fileId','15','int'),(145,'fileStage','2','int'),(145,'name','Gather: Finding What You Need.pdf','string'),(145,'originalFileName','Gather: Finding What You Need.pdf','string'),(145,'sourceSubmissionFileId',NULL,'string'),(145,'submissionFileId','26','int'),(145,'submissionId','6','int'),(145,'username','dbernnard','string'),(151,'decision','Send to Internal Review','string'),(151,'editorName','Daniel Barnes','string'),(151,'submissionId','6','int'),(152,'fileId','12','int'),(152,'fileStage','19','int'),(152,'originalFileName','Identify: Understanding Your Information.pdf','string'),(152,'sourceSubmissionFileId','23','int'),(152,'submissionFileId','27','int'),(152,'submissionId','6','int'),(152,'username','dbarnes','string'),(153,'fileId','12','int'),(153,'fileStage','19','int'),(153,'name','Identify: Understanding Your Information.pdf','string'),(153,'submissionFileId','27','int'),(153,'submissionId','6','int'),(153,'username','dbarnes','string'),(154,'fileId','13','int'),(154,'fileStage','19','int'),(154,'originalFileName','Scope: Knowing What Is Available.pdf','string'),(154,'sourceSubmissionFileId','24','int'),(154,'submissionFileId','28','int'),(154,'submissionId','6','int'),(154,'username','dbarnes','string'),(155,'fileId','13','int'),(155,'fileStage','19','int'),(155,'name','Scope: Knowing What Is Available.pdf','string'),(155,'submissionFileId','28','int'),(155,'submissionId','6','int'),(155,'username','dbarnes','string'),(156,'fileId','14','int'),(156,'fileStage','19','int'),(156,'originalFileName','Plan: Developing Research Strategies.pdf','string'),(156,'sourceSubmissionFileId','25','int'),(156,'submissionFileId','29','int'),(156,'submissionId','6','int'),(156,'username','dbarnes','string'),(157,'fileId','14','int'),(157,'fileStage','19','int'),(157,'name','Plan: Developing Research Strategies.pdf','string'),(157,'submissionFileId','29','int'),(157,'submissionId','6','int'),(157,'username','dbarnes','string'),(158,'fileId','15','int'),(158,'fileStage','19','int'),(158,'originalFileName','Gather: Finding What You Need.pdf','string'),(158,'sourceSubmissionFileId','26','int'),(158,'submissionFileId','30','int'),(158,'submissionId','6','int'),(158,'username','dbarnes','string'),(159,'fileId','15','int'),(159,'fileStage','19','int'),(159,'name','Gather: Finding What You Need.pdf','string'),(159,'submissionFileId','30','int'),(159,'submissionId','6','int'),(159,'username','dbarnes','string'),(160,'name','Minoti Inoue','string'),(160,'userGroupName','Series editor','string'),(160,'username','minoue','string'),(161,'decision','Send to External Review','string'),(161,'editorName','Minoti Inoue','string'),(161,'submissionId','6','int'),(164,'fileId','16','int'),(164,'fileStage','2','int'),(164,'originalFileName','Introduction.pdf','string'),(164,'sourceSubmissionFileId',NULL,'string'),(164,'submissionFileId','31','int'),(164,'submissionId','7','int'),(164,'username','dkennepohl','string'),(165,'fileId','16','int'),(165,'fileStage','2','int'),(165,'name','Introduction.pdf','string'),(165,'submissionFileId','31','int'),(165,'submissionId','7','int'),(165,'username','dkennepohl','string'),(166,'fileId','16','int'),(166,'fileStage','2','int'),(166,'originalFileName','Introduction.pdf','string'),(166,'sourceSubmissionFileId',NULL,'string'),(166,'submissionFileId','31','int'),(166,'submissionId','7','int'),(166,'username','dkennepohl','string'),(167,'fileId','16','int'),(167,'fileStage','2','int'),(167,'name','Introduction.pdf','string'),(167,'originalFileName','Introduction.pdf','string'),(167,'sourceSubmissionFileId',NULL,'string'),(167,'submissionFileId','31','int'),(167,'submissionId','7','int'),(167,'username','dkennepohl','string'),(168,'fileId','17','int'),(168,'fileStage','2','int'),(168,'originalFileName','Chapter 1: Interactions Affording Distan.pdf','string'),(168,'sourceSubmissionFileId',NULL,'string'),(168,'submissionFileId','32','int'),(168,'submissionId','7','int'),(168,'username','dkennepohl','string'),(169,'fileId','17','int'),(169,'fileStage','2','int'),(169,'name','Chapter 1: Interactions Affording Distan.pdf','string'),(169,'submissionFileId','32','int'),(169,'submissionId','7','int'),(169,'username','dkennepohl','string'),(170,'fileId','17','int'),(170,'fileStage','2','int'),(170,'originalFileName','Chapter 1: Interactions Affording Distan.pdf','string'),(170,'sourceSubmissionFileId',NULL,'string'),(170,'submissionFileId','32','int'),(170,'submissionId','7','int'),(170,'username','dkennepohl','string'),(171,'fileId','17','int'),(171,'fileStage','2','int'),(171,'name','Chapter 1: Interactions Affording Distan.pdf','string'),(171,'originalFileName','Chapter 1: Interactions Affording Distan.pdf','string'),(171,'sourceSubmissionFileId',NULL,'string'),(171,'submissionFileId','32','int'),(171,'submissionId','7','int'),(171,'username','dkennepohl','string'),(172,'fileId','18','int'),(172,'fileStage','2','int'),(172,'originalFileName','Chapter 2: Learning Science at a Distanc.pdf','string'),(172,'sourceSubmissionFileId',NULL,'string'),(172,'submissionFileId','33','int'),(172,'submissionId','7','int'),(172,'username','dkennepohl','string'),(173,'fileId','18','int'),(173,'fileStage','2','int'),(173,'name','Chapter 2: Learning Science at a Distanc.pdf','string'),(173,'submissionFileId','33','int'),(173,'submissionId','7','int'),(173,'username','dkennepohl','string'),(174,'fileId','18','int'),(174,'fileStage','2','int'),(174,'originalFileName','Chapter 2: Learning Science at a Distanc.pdf','string'),(174,'sourceSubmissionFileId',NULL,'string'),(174,'submissionFileId','33','int'),(174,'submissionId','7','int'),(174,'username','dkennepohl','string'),(175,'fileId','18','int'),(175,'fileStage','2','int'),(175,'name','Chapter 2: Learning Science at a Distanc.pdf','string'),(175,'originalFileName','Chapter 2: Learning Science at a Distanc.pdf','string'),(175,'sourceSubmissionFileId',NULL,'string'),(175,'submissionFileId','33','int'),(175,'submissionId','7','int'),(175,'username','dkennepohl','string'),(176,'fileId','19','int'),(176,'fileStage','2','int'),(176,'originalFileName','Chapter 3: Leadership Strategies for Coo.pdf','string'),(176,'sourceSubmissionFileId',NULL,'string'),(176,'submissionFileId','34','int'),(176,'submissionId','7','int'),(176,'username','dkennepohl','string'),(177,'fileId','19','int'),(177,'fileStage','2','int'),(177,'name','Chapter 3: Leadership Strategies for Coo.pdf','string'),(177,'submissionFileId','34','int'),(177,'submissionId','7','int'),(177,'username','dkennepohl','string'),(178,'fileId','19','int'),(178,'fileStage','2','int'),(178,'originalFileName','Chapter 3: Leadership Strategies for Coo.pdf','string'),(178,'sourceSubmissionFileId',NULL,'string'),(178,'submissionFileId','34','int'),(178,'submissionId','7','int'),(178,'username','dkennepohl','string'),(179,'fileId','19','int'),(179,'fileStage','2','int'),(179,'name','Chapter 3: Leadership Strategies for Coo.pdf','string'),(179,'originalFileName','Chapter 3: Leadership Strategies for Coo.pdf','string'),(179,'sourceSubmissionFileId',NULL,'string'),(179,'submissionFileId','34','int'),(179,'submissionId','7','int'),(179,'username','dkennepohl','string'),(180,'fileId','20','int'),(180,'fileStage','2','int'),(180,'originalFileName','Chapter 4: Toward New Models of Flexible.pdf','string'),(180,'sourceSubmissionFileId',NULL,'string'),(180,'submissionFileId','35','int'),(180,'submissionId','7','int'),(180,'username','dkennepohl','string'),(181,'fileId','20','int'),(181,'fileStage','2','int'),(181,'name','Chapter 4: Toward New Models of Flexible.pdf','string'),(181,'submissionFileId','35','int'),(181,'submissionId','7','int'),(181,'username','dkennepohl','string'),(182,'fileId','20','int'),(182,'fileStage','2','int'),(182,'originalFileName','Chapter 4: Toward New Models of Flexible.pdf','string'),(182,'sourceSubmissionFileId',NULL,'string'),(182,'submissionFileId','35','int'),(182,'submissionId','7','int'),(182,'username','dkennepohl','string'),(183,'fileId','20','int'),(183,'fileStage','2','int'),(183,'name','Chapter 4: Toward New Models of Flexible.pdf','string'),(183,'originalFileName','Chapter 4: Toward New Models of Flexible.pdf','string'),(183,'sourceSubmissionFileId',NULL,'string'),(183,'submissionFileId','35','int'),(183,'submissionId','7','int'),(183,'username','dkennepohl','string'),(190,'decision','Send to External Review','string'),(190,'editorName','Daniel Barnes','string'),(190,'submissionId','7','int'),(191,'fileId','16','int'),(191,'fileStage','4','int'),(191,'originalFileName','Introduction.pdf','string'),(191,'sourceSubmissionFileId','31','int'),(191,'submissionFileId','36','int'),(191,'submissionId','7','int'),(191,'username','dbarnes','string'),(192,'fileId','16','int'),(192,'fileStage','4','int'),(192,'name','Introduction.pdf','string'),(192,'submissionFileId','36','int'),(192,'submissionId','7','int'),(192,'username','dbarnes','string'),(193,'fileId','17','int'),(193,'fileStage','4','int'),(193,'originalFileName','Chapter 1: Interactions Affording Distan.pdf','string'),(193,'sourceSubmissionFileId','32','int'),(193,'submissionFileId','37','int'),(193,'submissionId','7','int'),(193,'username','dbarnes','string'),(194,'fileId','17','int'),(194,'fileStage','4','int'),(194,'name','Chapter 1: Interactions Affording Distan.pdf','string'),(194,'submissionFileId','37','int'),(194,'submissionId','7','int'),(194,'username','dbarnes','string'),(195,'fileId','18','int'),(195,'fileStage','4','int'),(195,'originalFileName','Chapter 2: Learning Science at a Distanc.pdf','string'),(195,'sourceSubmissionFileId','33','int'),(195,'submissionFileId','38','int'),(195,'submissionId','7','int'),(195,'username','dbarnes','string'),(196,'fileId','18','int'),(196,'fileStage','4','int'),(196,'name','Chapter 2: Learning Science at a Distanc.pdf','string'),(196,'submissionFileId','38','int'),(196,'submissionId','7','int'),(196,'username','dbarnes','string'),(197,'fileId','19','int'),(197,'fileStage','4','int'),(197,'originalFileName','Chapter 3: Leadership Strategies for Coo.pdf','string'),(197,'sourceSubmissionFileId','34','int'),(197,'submissionFileId','39','int'),(197,'submissionId','7','int'),(197,'username','dbarnes','string'),(198,'fileId','19','int'),(198,'fileStage','4','int'),(198,'name','Chapter 3: Leadership Strategies for Coo.pdf','string'),(198,'submissionFileId','39','int'),(198,'submissionId','7','int'),(198,'username','dbarnes','string'),(199,'fileId','20','int'),(199,'fileStage','4','int'),(199,'originalFileName','Chapter 4: Toward New Models of Flexible.pdf','string'),(199,'sourceSubmissionFileId','35','int'),(199,'submissionFileId','40','int'),(199,'submissionId','7','int'),(199,'username','dbarnes','string'),(200,'fileId','20','int'),(200,'fileStage','4','int'),(200,'name','Chapter 4: Toward New Models of Flexible.pdf','string'),(200,'submissionFileId','40','int'),(200,'submissionId','7','int'),(200,'username','dbarnes','string'),(201,'reviewAssignmentId','8','string'),(201,'reviewerName','Adela Gallego','string'),(201,'round','1','int'),(201,'stageId','3','int'),(201,'submissionId','7','int'),(202,'decision','Accept Submission','string'),(202,'editorName','Daniel Barnes','string'),(202,'submissionId','7','int'),(203,'name','Maria Fritz','string'),(203,'userGroupName','Copyeditor','string'),(203,'username','mfritz','string'),(206,'fileId','21','int'),(206,'fileStage','2','int'),(206,'originalFileName','Editorial.pdf','string'),(206,'sourceSubmissionFileId',NULL,'string'),(206,'submissionFileId','41','int'),(206,'submissionId','8','int'),(206,'username','dbarnes','string'),(207,'fileId','21','int'),(207,'fileStage','2','int'),(207,'name','Editorial.pdf','string'),(207,'submissionFileId','41','int'),(207,'submissionId','8','int'),(207,'username','dbarnes','string'),(208,'fileId','21','int'),(208,'fileStage','2','int'),(208,'originalFileName','Editorial.pdf','string'),(208,'sourceSubmissionFileId',NULL,'string'),(208,'submissionFileId','41','int'),(208,'submissionId','8','int'),(208,'username','dbarnes','string'),(209,'fileId','21','int'),(209,'fileStage','2','int'),(209,'name','Editorial.pdf','string'),(209,'originalFileName','Editorial.pdf','string'),(209,'sourceSubmissionFileId',NULL,'string'),(209,'submissionFileId','41','int'),(209,'submissionId','8','int'),(209,'username','dbarnes','string'),(214,'fileId','22','int'),(214,'fileStage','2','int'),(214,'originalFileName','Internet, openness and the future of the.pdf','string'),(214,'sourceSubmissionFileId',NULL,'string'),(214,'submissionFileId','42','int'),(214,'submissionId','9','int'),(214,'username','fperini','string'),(215,'fileId','22','int'),(215,'fileStage','2','int'),(215,'name','Internet, openness and the future of the.pdf','string'),(215,'submissionFileId','42','int'),(215,'submissionId','9','int'),(215,'username','fperini','string'),(216,'fileId','22','int'),(216,'fileStage','2','int'),(216,'originalFileName','Internet, openness and the future of the.pdf','string'),(216,'sourceSubmissionFileId',NULL,'string'),(216,'submissionFileId','42','int'),(216,'submissionId','9','int'),(216,'username','fperini','string'),(217,'fileId','22','int'),(217,'fileStage','2','int'),(217,'name','Internet, openness and the future of the.pdf','string'),(217,'originalFileName','Internet, openness and the future of the.pdf','string'),(217,'sourceSubmissionFileId',NULL,'string'),(217,'submissionFileId','42','int'),(217,'submissionId','9','int'),(217,'username','fperini','string'),(218,'fileId','23','int'),(218,'fileStage','2','int'),(218,'originalFileName','Imagining the Internet: Open, closed or .pdf','string'),(218,'sourceSubmissionFileId',NULL,'string'),(218,'submissionFileId','43','int'),(218,'submissionId','9','int'),(218,'username','fperini','string'),(219,'fileId','23','int'),(219,'fileStage','2','int'),(219,'name','Imagining the Internet: Open, closed or .pdf','string'),(219,'submissionFileId','43','int'),(219,'submissionId','9','int'),(219,'username','fperini','string'),(220,'fileId','23','int'),(220,'fileStage','2','int'),(220,'originalFileName','Imagining the Internet: Open, closed or .pdf','string'),(220,'sourceSubmissionFileId',NULL,'string'),(220,'submissionFileId','43','int'),(220,'submissionId','9','int'),(220,'username','fperini','string'),(221,'fileId','23','int'),(221,'fileStage','2','int'),(221,'name','Imagining the Internet: Open, closed or .pdf','string'),(221,'originalFileName','Imagining the Internet: Open, closed or .pdf','string'),(221,'sourceSubmissionFileId',NULL,'string'),(221,'submissionFileId','43','int'),(221,'submissionId','9','int'),(221,'username','fperini','string'),(222,'fileId','24','int'),(222,'fileStage','2','int'),(222,'originalFileName','The internet in LAC will remain free, pu.pdf','string'),(222,'sourceSubmissionFileId',NULL,'string'),(222,'submissionFileId','44','int'),(222,'submissionId','9','int'),(222,'username','fperini','string'),(223,'fileId','24','int'),(223,'fileStage','2','int'),(223,'name','The internet in LAC will remain free, pu.pdf','string'),(223,'submissionFileId','44','int'),(223,'submissionId','9','int'),(223,'username','fperini','string'),(224,'fileId','24','int'),(224,'fileStage','2','int'),(224,'originalFileName','The internet in LAC will remain free, pu.pdf','string'),(224,'sourceSubmissionFileId',NULL,'string'),(224,'submissionFileId','44','int'),(224,'submissionId','9','int'),(224,'username','fperini','string'),(225,'fileId','24','int'),(225,'fileStage','2','int'),(225,'name','The internet in LAC will remain free, pu.pdf','string'),(225,'originalFileName','The internet in LAC will remain free, pu.pdf','string'),(225,'sourceSubmissionFileId',NULL,'string'),(225,'submissionFileId','44','int'),(225,'submissionId','9','int'),(225,'username','fperini','string'),(226,'fileId','25','int'),(226,'fileStage','2','int'),(226,'originalFileName','Free Internet?.pdf','string'),(226,'sourceSubmissionFileId',NULL,'string'),(226,'submissionFileId','45','int'),(226,'submissionId','9','int'),(226,'username','fperini','string'),(227,'fileId','25','int'),(227,'fileStage','2','int'),(227,'name','Free Internet?.pdf','string'),(227,'submissionFileId','45','int'),(227,'submissionId','9','int'),(227,'username','fperini','string'),(228,'fileId','25','int'),(228,'fileStage','2','int'),(228,'originalFileName','Free Internet?.pdf','string'),(228,'sourceSubmissionFileId',NULL,'string'),(228,'submissionFileId','45','int'),(228,'submissionId','9','int'),(228,'username','fperini','string'),(229,'fileId','25','int'),(229,'fileStage','2','int'),(229,'name','Free Internet?.pdf','string'),(229,'originalFileName','Free Internet?.pdf','string'),(229,'sourceSubmissionFileId',NULL,'string'),(229,'submissionFileId','45','int'),(229,'submissionId','9','int'),(229,'username','fperini','string'),(230,'fileId','26','int'),(230,'fileStage','2','int'),(230,'originalFileName','Risks and challenges for freedom of expr.pdf','string'),(230,'sourceSubmissionFileId',NULL,'string'),(230,'submissionFileId','46','int'),(230,'submissionId','9','int'),(230,'username','fperini','string'),(231,'fileId','26','int'),(231,'fileStage','2','int'),(231,'name','Risks and challenges for freedom of expr.pdf','string'),(231,'submissionFileId','46','int'),(231,'submissionId','9','int'),(231,'username','fperini','string'),(232,'fileId','26','int'),(232,'fileStage','2','int'),(232,'originalFileName','Risks and challenges for freedom of expr.pdf','string'),(232,'sourceSubmissionFileId',NULL,'string'),(232,'submissionFileId','46','int'),(232,'submissionId','9','int'),(232,'username','fperini','string'),(233,'fileId','26','int'),(233,'fileStage','2','int'),(233,'name','Risks and challenges for freedom of expr.pdf','string'),(233,'originalFileName','Risks and challenges for freedom of expr.pdf','string'),(233,'sourceSubmissionFileId',NULL,'string'),(233,'submissionFileId','46','int'),(233,'submissionId','9','int'),(233,'username','fperini','string'),(240,'decision','Send to Internal Review','string'),(240,'editorName','Daniel Barnes','string'),(240,'submissionId','9','int'),(241,'fileId','22','int'),(241,'fileStage','19','int'),(241,'originalFileName','Internet, openness and the future of the.pdf','string'),(241,'sourceSubmissionFileId','42','int'),(241,'submissionFileId','47','int'),(241,'submissionId','9','int'),(241,'username','dbarnes','string'),(242,'fileId','22','int'),(242,'fileStage','19','int'),(242,'name','Internet, openness and the future of the.pdf','string'),(242,'submissionFileId','47','int'),(242,'submissionId','9','int'),(242,'username','dbarnes','string'),(243,'fileId','23','int'),(243,'fileStage','19','int'),(243,'originalFileName','Imagining the Internet: Open, closed or .pdf','string'),(243,'sourceSubmissionFileId','43','int'),(243,'submissionFileId','48','int'),(243,'submissionId','9','int'),(243,'username','dbarnes','string'),(244,'fileId','23','int'),(244,'fileStage','19','int'),(244,'name','Imagining the Internet: Open, closed or .pdf','string'),(244,'submissionFileId','48','int'),(244,'submissionId','9','int'),(244,'username','dbarnes','string'),(245,'fileId','24','int'),(245,'fileStage','19','int'),(245,'originalFileName','The internet in LAC will remain free, pu.pdf','string'),(245,'sourceSubmissionFileId','44','int'),(245,'submissionFileId','49','int'),(245,'submissionId','9','int'),(245,'username','dbarnes','string'),(246,'fileId','24','int'),(246,'fileStage','19','int'),(246,'name','The internet in LAC will remain free, pu.pdf','string'),(246,'submissionFileId','49','int'),(246,'submissionId','9','int'),(246,'username','dbarnes','string'),(247,'fileId','25','int'),(247,'fileStage','19','int'),(247,'originalFileName','Free Internet?.pdf','string'),(247,'sourceSubmissionFileId','45','int'),(247,'submissionFileId','50','int'),(247,'submissionId','9','int'),(247,'username','dbarnes','string'),(248,'fileId','25','int'),(248,'fileStage','19','int'),(248,'name','Free Internet?.pdf','string'),(248,'submissionFileId','50','int'),(248,'submissionId','9','int'),(248,'username','dbarnes','string'),(249,'fileId','26','int'),(249,'fileStage','19','int'),(249,'originalFileName','Risks and challenges for freedom of expr.pdf','string'),(249,'sourceSubmissionFileId','46','int'),(249,'submissionFileId','51','int'),(249,'submissionId','9','int'),(249,'username','dbarnes','string'),(250,'fileId','26','int'),(250,'fileStage','19','int'),(250,'name','Risks and challenges for freedom of expr.pdf','string'),(250,'submissionFileId','51','int'),(250,'submissionId','9','int'),(250,'username','dbarnes','string'),(253,'fileId','27','int'),(253,'fileStage','2','int'),(253,'originalFileName','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(253,'sourceSubmissionFileId',NULL,'string'),(253,'submissionFileId','52','int'),(253,'submissionId','10','int'),(253,'username','jbrower','string'),(254,'fileId','27','int'),(254,'fileStage','2','int'),(254,'name','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(254,'submissionFileId','52','int'),(254,'submissionId','10','int'),(254,'username','jbrower','string'),(255,'fileId','27','int'),(255,'fileStage','2','int'),(255,'originalFileName','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(255,'sourceSubmissionFileId',NULL,'string'),(255,'submissionFileId','52','int'),(255,'submissionId','10','int'),(255,'username','jbrower','string'),(256,'fileId','27','int'),(256,'fileStage','2','int'),(256,'name','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(256,'originalFileName','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(256,'sourceSubmissionFileId',NULL,'string'),(256,'submissionFileId','52','int'),(256,'submissionId','10','int'),(256,'username','jbrower','string'),(261,'fileId','28','int'),(261,'fileStage','2','int'),(261,'originalFileName','Dreamwork.pdf','string'),(261,'sourceSubmissionFileId',NULL,'string'),(261,'submissionFileId','53','int'),(261,'submissionId','11','int'),(261,'username','jlockehart','string'),(262,'fileId','28','int'),(262,'fileStage','2','int'),(262,'name','Dreamwork.pdf','string'),(262,'submissionFileId','53','int'),(262,'submissionId','11','int'),(262,'username','jlockehart','string'),(263,'fileId','28','int'),(263,'fileStage','2','int'),(263,'originalFileName','Dreamwork.pdf','string'),(263,'sourceSubmissionFileId',NULL,'string'),(263,'submissionFileId','53','int'),(263,'submissionId','11','int'),(263,'username','jlockehart','string'),(264,'fileId','28','int'),(264,'fileStage','2','int'),(264,'name','Dreamwork.pdf','string'),(264,'originalFileName','Dreamwork.pdf','string'),(264,'sourceSubmissionFileId',NULL,'string'),(264,'submissionFileId','53','int'),(264,'submissionId','11','int'),(264,'username','jlockehart','string'),(267,'decision','Send to Internal Review','string'),(267,'editorName','Daniel Barnes','string'),(267,'submissionId','11','int'),(268,'fileId','28','int'),(268,'fileStage','19','int'),(268,'originalFileName','Dreamwork.pdf','string'),(268,'sourceSubmissionFileId','53','int'),(268,'submissionFileId','54','int'),(268,'submissionId','11','int'),(268,'username','dbarnes','string'),(269,'fileId','28','int'),(269,'fileStage','19','int'),(269,'name','Dreamwork.pdf','string'),(269,'submissionFileId','54','int'),(269,'submissionId','11','int'),(269,'username','dbarnes','string'),(270,'reviewAssignmentId','9','string'),(270,'reviewerName','Aisla McCrae','string'),(270,'round','1','int'),(270,'stageId','2','int'),(270,'submissionId','11','int'),(271,'decision','Send to External Review','string'),(271,'editorName','Daniel Barnes','string'),(271,'submissionId','11','int'),(272,'reviewAssignmentId','10','string'),(272,'reviewerName','Adela Gallego','string'),(272,'round','1','int'),(272,'stageId','3','int'),(272,'submissionId','11','int'),(273,'reviewAssignmentId','11','string'),(273,'reviewerName','Gonzalo Favio','string'),(273,'round','1','int'),(273,'stageId','3','int'),(273,'submissionId','11','int'),(274,'reviewAssignmentId','10','int'),(274,'reviewerName','Adela Gallego','string'),(274,'round','1','int'),(274,'submissionId','11','int'),(275,'reviewAssignmentId','10','int'),(275,'reviewerName','Adela Gallego','string'),(275,'round','1','int'),(275,'submissionId','11','int'),(276,'reviewAssignmentId','11','int'),(276,'reviewerName','Gonzalo Favio','string'),(276,'round','1','int'),(276,'submissionId','11','int'),(277,'reviewAssignmentId','11','int'),(277,'reviewerName','Gonzalo Favio','string'),(277,'round','1','int'),(277,'submissionId','11','int'),(278,'decision','Accept Submission','string'),(278,'editorName','Daniel Barnes','string'),(278,'submissionId','11','int'),(281,'fileId','29','int'),(281,'fileStage','2','int'),(281,'originalFileName','Catalyzing Access through Social and Tec.pdf','string'),(281,'sourceSubmissionFileId',NULL,'string'),(281,'submissionFileId','55','int'),(281,'submissionId','12','int'),(281,'username','lelder','string'),(282,'fileId','29','int'),(282,'fileStage','2','int'),(282,'name','Catalyzing Access through Social and Tec.pdf','string'),(282,'submissionFileId','55','int'),(282,'submissionId','12','int'),(282,'username','lelder','string'),(283,'fileId','29','int'),(283,'fileStage','2','int'),(283,'originalFileName','Catalyzing Access through Social and Tec.pdf','string'),(283,'sourceSubmissionFileId',NULL,'string'),(283,'submissionFileId','55','int'),(283,'submissionId','12','int'),(283,'username','lelder','string'),(284,'fileId','29','int'),(284,'fileStage','2','int'),(284,'name','Catalyzing Access through Social and Tec.pdf','string'),(284,'originalFileName','Catalyzing Access through Social and Tec.pdf','string'),(284,'sourceSubmissionFileId',NULL,'string'),(284,'submissionFileId','55','int'),(284,'submissionId','12','int'),(284,'username','lelder','string'),(285,'fileId','30','int'),(285,'fileStage','2','int'),(285,'originalFileName','Catalyzing Access via Telecommunications.pdf','string'),(285,'sourceSubmissionFileId',NULL,'string'),(285,'submissionFileId','56','int'),(285,'submissionId','12','int'),(285,'username','lelder','string'),(286,'fileId','30','int'),(286,'fileStage','2','int'),(286,'name','Catalyzing Access via Telecommunications.pdf','string'),(286,'submissionFileId','56','int'),(286,'submissionId','12','int'),(286,'username','lelder','string'),(287,'fileId','30','int'),(287,'fileStage','2','int'),(287,'originalFileName','Catalyzing Access via Telecommunications.pdf','string'),(287,'sourceSubmissionFileId',NULL,'string'),(287,'submissionFileId','56','int'),(287,'submissionId','12','int'),(287,'username','lelder','string'),(288,'fileId','30','int'),(288,'fileStage','2','int'),(288,'name','Catalyzing Access via Telecommunications.pdf','string'),(288,'originalFileName','Catalyzing Access via Telecommunications.pdf','string'),(288,'sourceSubmissionFileId',NULL,'string'),(288,'submissionFileId','56','int'),(288,'submissionId','12','int'),(288,'username','lelder','string'),(289,'fileId','31','int'),(289,'fileStage','2','int'),(289,'originalFileName','Access to Knowledge as a New Paradigm fo.pdf','string'),(289,'sourceSubmissionFileId',NULL,'string'),(289,'submissionFileId','57','int'),(289,'submissionId','12','int'),(289,'username','lelder','string'),(290,'fileId','31','int'),(290,'fileStage','2','int'),(290,'name','Access to Knowledge as a New Paradigm fo.pdf','string'),(290,'submissionFileId','57','int'),(290,'submissionId','12','int'),(290,'username','lelder','string'),(291,'fileId','31','int'),(291,'fileStage','2','int'),(291,'originalFileName','Access to Knowledge as a New Paradigm fo.pdf','string'),(291,'sourceSubmissionFileId',NULL,'string'),(291,'submissionFileId','57','int'),(291,'submissionId','12','int'),(291,'username','lelder','string'),(292,'fileId','31','int'),(292,'fileStage','2','int'),(292,'name','Access to Knowledge as a New Paradigm fo.pdf','string'),(292,'originalFileName','Access to Knowledge as a New Paradigm fo.pdf','string'),(292,'sourceSubmissionFileId',NULL,'string'),(292,'submissionFileId','57','int'),(292,'submissionId','12','int'),(292,'username','lelder','string'),(302,'decision','Send to Internal Review','string'),(302,'editorName','Daniel Barnes','string'),(302,'submissionId','12','int'),(303,'reviewAssignmentId','12','string'),(303,'reviewerName','Julie Janssen','string'),(303,'round','1','int'),(303,'stageId','2','int'),(303,'submissionId','12','int'),(304,'reviewAssignmentId','13','string'),(304,'reviewerName','Paul Hudson','string'),(304,'round','1','int'),(304,'stageId','2','int'),(304,'submissionId','12','int'),(305,'reviewAssignmentId','14','string'),(305,'reviewerName','Aisla McCrae','string'),(305,'round','1','int'),(305,'stageId','2','int'),(305,'submissionId','12','int'),(306,'reviewAssignmentId','13','int'),(306,'reviewerName','Paul Hudson','string'),(306,'round','1','int'),(306,'submissionId','12','int'),(307,'reviewAssignmentId','13','int'),(307,'reviewerName','Paul Hudson','string'),(307,'round','1','int'),(307,'submissionId','12','int'),(310,'fileId','32','int'),(310,'fileStage','2','int'),(310,'originalFileName','Current State of Mobile Learning.pdf','string'),(310,'sourceSubmissionFileId',NULL,'string'),(310,'submissionFileId','58','int'),(310,'submissionId','13','int'),(310,'username','mally','string'),(311,'fileId','32','int'),(311,'fileStage','2','int'),(311,'name','Current State of Mobile Learning.pdf','string'),(311,'submissionFileId','58','int'),(311,'submissionId','13','int'),(311,'username','mally','string'),(312,'fileId','32','int'),(312,'fileStage','2','int'),(312,'originalFileName','Current State of Mobile Learning.pdf','string'),(312,'sourceSubmissionFileId',NULL,'string'),(312,'submissionFileId','58','int'),(312,'submissionId','13','int'),(312,'username','mally','string'),(313,'fileId','32','int'),(313,'fileStage','2','int'),(313,'name','Current State of Mobile Learning.pdf','string'),(313,'originalFileName','Current State of Mobile Learning.pdf','string'),(313,'sourceSubmissionFileId',NULL,'string'),(313,'submissionFileId','58','int'),(313,'submissionId','13','int'),(313,'username','mally','string'),(314,'fileId','33','int'),(314,'fileStage','2','int'),(314,'originalFileName','A Model for Framing Mobile Learning.pdf','string'),(314,'sourceSubmissionFileId',NULL,'string'),(314,'submissionFileId','59','int'),(314,'submissionId','13','int'),(314,'username','mally','string'),(315,'fileId','33','int'),(315,'fileStage','2','int'),(315,'name','A Model for Framing Mobile Learning.pdf','string'),(315,'submissionFileId','59','int'),(315,'submissionId','13','int'),(315,'username','mally','string'),(316,'fileId','33','int'),(316,'fileStage','2','int'),(316,'originalFileName','A Model for Framing Mobile Learning.pdf','string'),(316,'sourceSubmissionFileId',NULL,'string'),(316,'submissionFileId','59','int'),(316,'submissionId','13','int'),(316,'username','mally','string'),(317,'fileId','33','int'),(317,'fileStage','2','int'),(317,'name','A Model for Framing Mobile Learning.pdf','string'),(317,'originalFileName','A Model for Framing Mobile Learning.pdf','string'),(317,'sourceSubmissionFileId',NULL,'string'),(317,'submissionFileId','59','int'),(317,'submissionId','13','int'),(317,'username','mally','string'),(318,'fileId','34','int'),(318,'fileStage','2','int'),(318,'originalFileName','Mobile Distance Learning with PDAs: Deve.pdf','string'),(318,'sourceSubmissionFileId',NULL,'string'),(318,'submissionFileId','60','int'),(318,'submissionId','13','int'),(318,'username','mally','string'),(319,'fileId','34','int'),(319,'fileStage','2','int'),(319,'name','Mobile Distance Learning with PDAs: Deve.pdf','string'),(319,'submissionFileId','60','int'),(319,'submissionId','13','int'),(319,'username','mally','string'),(320,'fileId','34','int'),(320,'fileStage','2','int'),(320,'originalFileName','Mobile Distance Learning with PDAs: Deve.pdf','string'),(320,'sourceSubmissionFileId',NULL,'string'),(320,'submissionFileId','60','int'),(320,'submissionId','13','int'),(320,'username','mally','string'),(321,'fileId','34','int'),(321,'fileStage','2','int'),(321,'name','Mobile Distance Learning with PDAs: Deve.pdf','string'),(321,'originalFileName','Mobile Distance Learning with PDAs: Deve.pdf','string'),(321,'sourceSubmissionFileId',NULL,'string'),(321,'submissionFileId','60','int'),(321,'submissionId','13','int'),(321,'username','mally','string'),(327,'decision','Send to Internal Review','string'),(327,'editorName','Daniel Barnes','string'),(327,'submissionId','13','int'),(328,'fileId','32','int'),(328,'fileStage','19','int'),(328,'originalFileName','Current State of Mobile Learning.pdf','string'),(328,'sourceSubmissionFileId','58','int'),(328,'submissionFileId','61','int'),(328,'submissionId','13','int'),(328,'username','dbarnes','string'),(329,'fileId','32','int'),(329,'fileStage','19','int'),(329,'name','Current State of Mobile Learning.pdf','string'),(329,'submissionFileId','61','int'),(329,'submissionId','13','int'),(329,'username','dbarnes','string'),(330,'fileId','33','int'),(330,'fileStage','19','int'),(330,'originalFileName','A Model for Framing Mobile Learning.pdf','string'),(330,'sourceSubmissionFileId','59','int'),(330,'submissionFileId','62','int'),(330,'submissionId','13','int'),(330,'username','dbarnes','string'),(331,'fileId','33','int'),(331,'fileStage','19','int'),(331,'name','A Model for Framing Mobile Learning.pdf','string'),(331,'submissionFileId','62','int'),(331,'submissionId','13','int'),(331,'username','dbarnes','string'),(332,'fileId','34','int'),(332,'fileStage','19','int'),(332,'originalFileName','Mobile Distance Learning with PDAs: Deve.pdf','string'),(332,'sourceSubmissionFileId','60','int'),(332,'submissionFileId','63','int'),(332,'submissionId','13','int'),(332,'username','dbarnes','string'),(333,'fileId','34','int'),(333,'fileStage','19','int'),(333,'name','Mobile Distance Learning with PDAs: Deve.pdf','string'),(333,'submissionFileId','63','int'),(333,'submissionId','13','int'),(333,'username','dbarnes','string'),(334,'reviewAssignmentId','15','string'),(334,'reviewerName','Paul Hudson','string'),(334,'round','1','int'),(334,'stageId','2','int'),(334,'submissionId','13','int'),(335,'decision','Send to External Review','string'),(335,'editorName','Daniel Barnes','string'),(335,'submissionId','13','int'),(336,'reviewAssignmentId','16','string'),(336,'reviewerName','Adela Gallego','string'),(336,'round','1','int'),(336,'stageId','3','int'),(336,'submissionId','13','int'),(337,'reviewAssignmentId','17','string'),(337,'reviewerName','Al Zacharia','string'),(337,'round','1','int'),(337,'stageId','3','int'),(337,'submissionId','13','int'),(338,'reviewAssignmentId','18','string'),(338,'reviewerName','Gonzalo Favio','string'),(338,'round','1','int'),(338,'stageId','3','int'),(338,'submissionId','13','int'),(339,'reviewAssignmentId','16','int'),(339,'reviewerName','Adela Gallego','string'),(339,'round','1','int'),(339,'submissionId','13','int'),(340,'reviewAssignmentId','16','int'),(340,'reviewerName','Adela Gallego','string'),(340,'round','1','int'),(340,'submissionId','13','int'),(341,'reviewAssignmentId','18','int'),(341,'reviewerName','Gonzalo Favio','string'),(341,'round','1','int'),(341,'submissionId','13','int'),(342,'reviewAssignmentId','18','int'),(342,'reviewerName','Gonzalo Favio','string'),(342,'round','1','int'),(342,'submissionId','13','int'),(343,'decision','Accept Submission','string'),(343,'editorName','Daniel Barnes','string'),(343,'submissionId','13','int'),(346,'fileId','35','int'),(346,'fileStage','2','int'),(346,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(346,'sourceSubmissionFileId',NULL,'string'),(346,'submissionFileId','64','int'),(346,'submissionId','14','int'),(346,'username','mdawson','string'),(347,'fileId','35','int'),(347,'fileStage','2','int'),(347,'name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(347,'submissionFileId','64','int'),(347,'submissionId','14','int'),(347,'username','mdawson','string'),(348,'fileId','35','int'),(348,'fileStage','2','int'),(348,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(348,'sourceSubmissionFileId',NULL,'string'),(348,'submissionFileId','64','int'),(348,'submissionId','14','int'),(348,'username','mdawson','string'),(349,'fileId','35','int'),(349,'fileStage','2','int'),(349,'name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(349,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(349,'sourceSubmissionFileId',NULL,'string'),(349,'submissionFileId','64','int'),(349,'submissionId','14','int'),(349,'username','mdawson','string'),(350,'fileId','36','int'),(350,'fileStage','2','int'),(350,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(350,'sourceSubmissionFileId',NULL,'string'),(350,'submissionFileId','65','int'),(350,'submissionId','14','int'),(350,'username','mdawson','string'),(351,'fileId','36','int'),(351,'fileStage','2','int'),(351,'name','Chapter 2: Classical Music and the Class.pdf','string'),(351,'submissionFileId','65','int'),(351,'submissionId','14','int'),(351,'username','mdawson','string'),(352,'fileId','36','int'),(352,'fileStage','2','int'),(352,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(352,'sourceSubmissionFileId',NULL,'string'),(352,'submissionFileId','65','int'),(352,'submissionId','14','int'),(352,'username','mdawson','string'),(353,'fileId','36','int'),(353,'fileStage','2','int'),(353,'name','Chapter 2: Classical Music and the Class.pdf','string'),(353,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(353,'sourceSubmissionFileId',NULL,'string'),(353,'submissionFileId','65','int'),(353,'submissionId','14','int'),(353,'username','mdawson','string'),(354,'fileId','37','int'),(354,'fileStage','2','int'),(354,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(354,'sourceSubmissionFileId',NULL,'string'),(354,'submissionFileId','66','int'),(354,'submissionId','14','int'),(354,'username','mdawson','string'),(355,'fileId','37','int'),(355,'fileStage','2','int'),(355,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(355,'submissionFileId','66','int'),(355,'submissionId','14','int'),(355,'username','mdawson','string'),(356,'fileId','37','int'),(356,'fileStage','2','int'),(356,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(356,'sourceSubmissionFileId',NULL,'string'),(356,'submissionFileId','66','int'),(356,'submissionId','14','int'),(356,'username','mdawson','string'),(357,'fileId','37','int'),(357,'fileStage','2','int'),(357,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(357,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(357,'sourceSubmissionFileId',NULL,'string'),(357,'submissionFileId','66','int'),(357,'submissionId','14','int'),(357,'username','mdawson','string'),(358,'fileId','38','int'),(358,'fileStage','2','int'),(358,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(358,'sourceSubmissionFileId',NULL,'string'),(358,'submissionFileId','67','int'),(358,'submissionId','14','int'),(358,'username','mdawson','string'),(359,'fileId','38','int'),(359,'fileStage','2','int'),(359,'name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(359,'submissionFileId','67','int'),(359,'submissionId','14','int'),(359,'username','mdawson','string'),(360,'fileId','38','int'),(360,'fileStage','2','int'),(360,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(360,'sourceSubmissionFileId',NULL,'string'),(360,'submissionFileId','67','int'),(360,'submissionId','14','int'),(360,'username','mdawson','string'),(361,'fileId','38','int'),(361,'fileStage','2','int'),(361,'name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(361,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(361,'sourceSubmissionFileId',NULL,'string'),(361,'submissionFileId','67','int'),(361,'submissionId','14','int'),(361,'username','mdawson','string'),(362,'fileId','39','int'),(362,'fileStage','2','int'),(362,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(362,'sourceSubmissionFileId',NULL,'string'),(362,'submissionFileId','68','int'),(362,'submissionId','14','int'),(362,'username','mdawson','string'),(363,'fileId','39','int'),(363,'fileStage','2','int'),(363,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(363,'submissionFileId','68','int'),(363,'submissionId','14','int'),(363,'username','mdawson','string'),(364,'fileId','39','int'),(364,'fileStage','2','int'),(364,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(364,'sourceSubmissionFileId',NULL,'string'),(364,'submissionFileId','68','int'),(364,'submissionId','14','int'),(364,'username','mdawson','string'),(365,'fileId','39','int'),(365,'fileStage','2','int'),(365,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(365,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(365,'sourceSubmissionFileId',NULL,'string'),(365,'submissionFileId','68','int'),(365,'submissionId','14','int'),(365,'username','mdawson','string'),(366,'fileId','40','int'),(366,'fileStage','2','int'),(366,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(366,'sourceSubmissionFileId',NULL,'string'),(366,'submissionFileId','69','int'),(366,'submissionId','14','int'),(366,'username','mdawson','string'),(367,'fileId','40','int'),(367,'fileStage','2','int'),(367,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(367,'submissionFileId','69','int'),(367,'submissionId','14','int'),(367,'username','mdawson','string'),(368,'fileId','40','int'),(368,'fileStage','2','int'),(368,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(368,'sourceSubmissionFileId',NULL,'string'),(368,'submissionFileId','69','int'),(368,'submissionId','14','int'),(368,'username','mdawson','string'),(369,'fileId','40','int'),(369,'fileStage','2','int'),(369,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(369,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(369,'sourceSubmissionFileId',NULL,'string'),(369,'submissionFileId','69','int'),(369,'submissionId','14','int'),(369,'username','mdawson','string'),(374,'decision','Send to Internal Review','string'),(374,'editorName','Daniel Barnes','string'),(374,'submissionId','14','int'),(375,'fileId','35','int'),(375,'fileStage','19','int'),(375,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(375,'sourceSubmissionFileId','64','int'),(375,'submissionFileId','70','int'),(375,'submissionId','14','int'),(375,'username','dbarnes','string'),(376,'fileId','35','int'),(376,'fileStage','19','int'),(376,'name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(376,'submissionFileId','70','int'),(376,'submissionId','14','int'),(376,'username','dbarnes','string'),(377,'fileId','36','int'),(377,'fileStage','19','int'),(377,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(377,'sourceSubmissionFileId','65','int'),(377,'submissionFileId','71','int'),(377,'submissionId','14','int'),(377,'username','dbarnes','string'),(378,'fileId','36','int'),(378,'fileStage','19','int'),(378,'name','Chapter 2: Classical Music and the Class.pdf','string'),(378,'submissionFileId','71','int'),(378,'submissionId','14','int'),(378,'username','dbarnes','string'),(379,'fileId','37','int'),(379,'fileStage','19','int'),(379,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(379,'sourceSubmissionFileId','66','int'),(379,'submissionFileId','72','int'),(379,'submissionId','14','int'),(379,'username','dbarnes','string'),(380,'fileId','37','int'),(380,'fileStage','19','int'),(380,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(380,'submissionFileId','72','int'),(380,'submissionId','14','int'),(380,'username','dbarnes','string'),(381,'fileId','38','int'),(381,'fileStage','19','int'),(381,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(381,'sourceSubmissionFileId','67','int'),(381,'submissionFileId','73','int'),(381,'submissionId','14','int'),(381,'username','dbarnes','string'),(382,'fileId','38','int'),(382,'fileStage','19','int'),(382,'name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(382,'submissionFileId','73','int'),(382,'submissionId','14','int'),(382,'username','dbarnes','string'),(383,'fileId','39','int'),(383,'fileStage','19','int'),(383,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(383,'sourceSubmissionFileId','68','int'),(383,'submissionFileId','74','int'),(383,'submissionId','14','int'),(383,'username','dbarnes','string'),(384,'fileId','39','int'),(384,'fileStage','19','int'),(384,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(384,'submissionFileId','74','int'),(384,'submissionId','14','int'),(384,'username','dbarnes','string'),(385,'fileId','40','int'),(385,'fileStage','19','int'),(385,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(385,'sourceSubmissionFileId','69','int'),(385,'submissionFileId','75','int'),(385,'submissionId','14','int'),(385,'username','dbarnes','string'),(386,'fileId','40','int'),(386,'fileStage','19','int'),(386,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(386,'submissionFileId','75','int'),(386,'submissionId','14','int'),(386,'username','dbarnes','string'),(387,'reviewAssignmentId','19','string'),(387,'reviewerName','Julie Janssen','string'),(387,'round','1','int'),(387,'stageId','2','int'),(387,'submissionId','14','int'),(388,'decision','Send to External Review','string'),(388,'editorName','Daniel Barnes','string'),(388,'submissionId','14','int'),(389,'reviewAssignmentId','20','string'),(389,'reviewerName','Al Zacharia','string'),(389,'round','1','int'),(389,'stageId','3','int'),(389,'submissionId','14','int'),(390,'decision','Accept Submission','string'),(390,'editorName','Daniel Barnes','string'),(390,'submissionId','14','int'),(391,'name','Maria Fritz','string'),(391,'userGroupName','Copyeditor','string'),(391,'username','mfritz','string'),(392,'decision','Send To Production','string'),(392,'editorName','Daniel Barnes','string'),(392,'submissionId','14','int'),(393,'name','Graham Cox','string'),(393,'userGroupName','Layout Editor','string'),(393,'username','gcox','string'),(394,'name','Sabine Kumar','string'),(394,'userGroupName','Proofreader','string'),(394,'username','skumar','string'),(395,'formatName','PDF','string'),(396,'fileId','35','int'),(396,'fileStage','10','int'),(396,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(396,'sourceSubmissionFileId','64','int'),(396,'submissionFileId','76','int'),(396,'submissionId','14','int'),(396,'username','dbarnes','string'),(397,'fileId','35','int'),(397,'fileStage','10','int'),(397,'name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(397,'submissionFileId','76','int'),(397,'submissionId','14','int'),(397,'username','dbarnes','string'),(398,'fileId','36','int'),(398,'fileStage','10','int'),(398,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(398,'sourceSubmissionFileId','65','int'),(398,'submissionFileId','77','int'),(398,'submissionId','14','int'),(398,'username','dbarnes','string'),(399,'fileId','36','int'),(399,'fileStage','10','int'),(399,'name','Chapter 2: Classical Music and the Class.pdf','string'),(399,'submissionFileId','77','int'),(399,'submissionId','14','int'),(399,'username','dbarnes','string'),(400,'fileId','37','int'),(400,'fileStage','10','int'),(400,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(400,'sourceSubmissionFileId','66','int'),(400,'submissionFileId','78','int'),(400,'submissionId','14','int'),(400,'username','dbarnes','string'),(401,'fileId','37','int'),(401,'fileStage','10','int'),(401,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(401,'submissionFileId','78','int'),(401,'submissionId','14','int'),(401,'username','dbarnes','string'),(402,'fileId','38','int'),(402,'fileStage','10','int'),(402,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(402,'sourceSubmissionFileId','67','int'),(402,'submissionFileId','79','int'),(402,'submissionId','14','int'),(402,'username','dbarnes','string'),(403,'fileId','38','int'),(403,'fileStage','10','int'),(403,'name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(403,'submissionFileId','79','int'),(403,'submissionId','14','int'),(403,'username','dbarnes','string'),(404,'fileId','39','int'),(404,'fileStage','10','int'),(404,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(404,'sourceSubmissionFileId','68','int'),(404,'submissionFileId','80','int'),(404,'submissionId','14','int'),(404,'username','dbarnes','string'),(405,'fileId','39','int'),(405,'fileStage','10','int'),(405,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(405,'submissionFileId','80','int'),(405,'submissionId','14','int'),(405,'username','dbarnes','string'),(406,'fileId','40','int'),(406,'fileStage','10','int'),(406,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(406,'sourceSubmissionFileId','69','int'),(406,'submissionFileId','81','int'),(406,'submissionId','14','int'),(406,'username','dbarnes','string'),(407,'fileId','40','int'),(407,'fileStage','10','int'),(407,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(407,'submissionFileId','81','int'),(407,'submissionId','14','int'),(407,'username','dbarnes','string'),(408,'publicationFormatName','PDF','string'),(409,'publicationFormatName','PDF','string'),(410,'fileId','35','int'),(410,'fileStage','10','int'),(410,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(410,'sourceSubmissionFileId','64','int'),(410,'submissionFileId','76','int'),(410,'submissionId','14','int'),(410,'username','dbarnes','string'),(411,'fileId','35','int'),(411,'fileStage','10','int'),(411,'name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(411,'originalFileName','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(411,'sourceSubmissionFileId','64','int'),(411,'submissionFileId','76','int'),(411,'submissionId','14','int'),(411,'username','dbarnes','string'),(412,'file','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(412,'name','Daniel Barnes','string'),(412,'username','dbarnes','string'),(413,'fileId','36','int'),(413,'fileStage','10','int'),(413,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(413,'sourceSubmissionFileId','65','int'),(413,'submissionFileId','77','int'),(413,'submissionId','14','int'),(413,'username','dbarnes','string'),(414,'fileId','36','int'),(414,'fileStage','10','int'),(414,'name','Chapter 2: Classical Music and the Class.pdf','string'),(414,'originalFileName','Chapter 2: Classical Music and the Class.pdf','string'),(414,'sourceSubmissionFileId','65','int'),(414,'submissionFileId','77','int'),(414,'submissionId','14','int'),(414,'username','dbarnes','string'),(415,'file','Chapter 2: Classical Music and the Class.pdf','string'),(415,'name','Daniel Barnes','string'),(415,'username','dbarnes','string'),(416,'fileId','37','int'),(416,'fileStage','10','int'),(416,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(416,'sourceSubmissionFileId','66','int'),(416,'submissionFileId','78','int'),(416,'submissionId','14','int'),(416,'username','dbarnes','string'),(417,'fileId','37','int'),(417,'fileStage','10','int'),(417,'name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(417,'originalFileName','Chapter 3: Situated Cognition and Bricol.pdf','string'),(417,'sourceSubmissionFileId','66','int'),(417,'submissionFileId','78','int'),(417,'submissionId','14','int'),(417,'username','dbarnes','string'),(418,'file','Chapter 3: Situated Cognition and Bricol.pdf','string'),(418,'name','Daniel Barnes','string'),(418,'username','dbarnes','string'),(419,'fileId','38','int'),(419,'fileStage','10','int'),(419,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(419,'sourceSubmissionFileId','67','int'),(419,'submissionFileId','79','int'),(419,'submissionId','14','int'),(419,'username','dbarnes','string'),(420,'fileId','38','int'),(420,'fileStage','10','int'),(420,'name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(420,'originalFileName','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(420,'sourceSubmissionFileId','67','int'),(420,'submissionFileId','79','int'),(420,'submissionId','14','int'),(420,'username','dbarnes','string'),(421,'file','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(421,'name','Daniel Barnes','string'),(421,'username','dbarnes','string'),(422,'fileId','39','int'),(422,'fileStage','10','int'),(422,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(422,'sourceSubmissionFileId','68','int'),(422,'submissionFileId','80','int'),(422,'submissionId','14','int'),(422,'username','dbarnes','string'),(423,'fileId','39','int'),(423,'fileStage','10','int'),(423,'name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(423,'originalFileName','Segmentation of Vascular Ultrasound Imag.pdf','string'),(423,'sourceSubmissionFileId','68','int'),(423,'submissionFileId','80','int'),(423,'submissionId','14','int'),(423,'username','dbarnes','string'),(424,'file','Segmentation of Vascular Ultrasound Imag.pdf','string'),(424,'name','Daniel Barnes','string'),(424,'username','dbarnes','string'),(425,'fileId','40','int'),(425,'fileStage','10','int'),(425,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(425,'sourceSubmissionFileId','69','int'),(425,'submissionFileId','81','int'),(425,'submissionId','14','int'),(425,'username','dbarnes','string'),(426,'fileId','40','int'),(426,'fileStage','10','int'),(426,'name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(426,'originalFileName','The Canadian Nutrient File: Nutrient Val.pdf','string'),(426,'sourceSubmissionFileId','69','int'),(426,'submissionFileId','81','int'),(426,'submissionId','14','int'),(426,'username','dbarnes','string'),(427,'file','The Canadian Nutrient File: Nutrient Val.pdf','string'),(427,'name','Daniel Barnes','string'),(427,'username','dbarnes','string'),(431,'fileId','41','int'),(431,'fileStage','2','int'),(431,'originalFileName','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(431,'sourceSubmissionFileId',NULL,'string'),(431,'submissionFileId','82','int'),(431,'submissionId','15','int'),(431,'username','mforan','string'),(432,'fileId','41','int'),(432,'fileStage','2','int'),(432,'name','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(432,'submissionFileId','82','int'),(432,'submissionId','15','int'),(432,'username','mforan','string'),(433,'fileId','41','int'),(433,'fileStage','2','int'),(433,'originalFileName','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(433,'sourceSubmissionFileId',NULL,'string'),(433,'submissionFileId','82','int'),(433,'submissionId','15','int'),(433,'username','mforan','string'),(434,'fileId','41','int'),(434,'fileStage','2','int'),(434,'name','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(434,'originalFileName','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(434,'sourceSubmissionFileId',NULL,'string'),(434,'submissionFileId','82','int'),(434,'submissionId','15','int'),(434,'username','mforan','string'),(437,'decision','Send to External Review','string'),(437,'editorName','Daniel Barnes','string'),(437,'submissionId','15','int'),(438,'fileId','41','int'),(438,'fileStage','4','int'),(438,'originalFileName','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(438,'sourceSubmissionFileId','82','int'),(438,'submissionFileId','83','int'),(438,'submissionId','15','int'),(438,'username','dbarnes','string'),(439,'fileId','41','int'),(439,'fileStage','4','int'),(439,'name','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(439,'submissionFileId','83','int'),(439,'submissionId','15','int'),(439,'username','dbarnes','string'),(442,'fileId','42','int'),(442,'fileStage','2','int'),(442,'originalFileName','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(442,'sourceSubmissionFileId',NULL,'string'),(442,'submissionFileId','84','int'),(442,'submissionId','16','int'),(442,'username','mpower','string'),(443,'fileId','42','int'),(443,'fileStage','2','int'),(443,'name','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(443,'submissionFileId','84','int'),(443,'submissionId','16','int'),(443,'username','mpower','string'),(444,'fileId','42','int'),(444,'fileStage','2','int'),(444,'originalFileName','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(444,'sourceSubmissionFileId',NULL,'string'),(444,'submissionFileId','84','int'),(444,'submissionId','16','int'),(444,'username','mpower','string'),(445,'fileId','42','int'),(445,'fileStage','2','int'),(445,'name','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(445,'originalFileName','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(445,'sourceSubmissionFileId',NULL,'string'),(445,'submissionFileId','84','int'),(445,'submissionId','16','int'),(445,'username','mpower','string'),(448,'decision','Send to External Review','string'),(448,'editorName','Daniel Barnes','string'),(448,'submissionId','16','int'),(449,'fileId','42','int'),(449,'fileStage','4','int'),(449,'originalFileName','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(449,'sourceSubmissionFileId','84','int'),(449,'submissionFileId','85','int'),(449,'submissionId','16','int'),(449,'username','dbarnes','string'),(450,'fileId','42','int'),(450,'fileStage','4','int'),(450,'name','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(450,'submissionFileId','85','int'),(450,'submissionId','16','int'),(450,'username','dbarnes','string'),(451,'reviewAssignmentId','21','string'),(451,'reviewerName','Adela Gallego','string'),(451,'round','1','int'),(451,'stageId','3','int'),(451,'submissionId','16','int'),(452,'reviewAssignmentId','22','string'),(452,'reviewerName','Al Zacharia','string'),(452,'round','1','int'),(452,'stageId','3','int'),(452,'submissionId','16','int'),(453,'reviewAssignmentId','23','string'),(453,'reviewerName','Gonzalo Favio','string'),(453,'round','1','int'),(453,'stageId','3','int'),(453,'submissionId','16','int'),(454,'reviewAssignmentId','21','int'),(454,'reviewerName','Adela Gallego','string'),(454,'round','1','int'),(454,'submissionId','16','int'),(455,'reviewAssignmentId','21','int'),(455,'reviewerName','Adela Gallego','string'),(455,'round','1','int'),(455,'submissionId','16','int'),(458,'fileId','43','int'),(458,'fileStage','2','int'),(458,'originalFileName','Preface.pdf','string'),(458,'sourceSubmissionFileId',NULL,'string'),(458,'submissionFileId','86','int'),(458,'submissionId','17','int'),(458,'username','msmith','string'),(459,'fileId','43','int'),(459,'fileStage','2','int'),(459,'name','Preface.pdf','string'),(459,'submissionFileId','86','int'),(459,'submissionId','17','int'),(459,'username','msmith','string'),(460,'fileId','43','int'),(460,'fileStage','2','int'),(460,'originalFileName','Preface.pdf','string'),(460,'sourceSubmissionFileId',NULL,'string'),(460,'submissionFileId','86','int'),(460,'submissionId','17','int'),(460,'username','msmith','string'),(461,'fileId','43','int'),(461,'fileStage','2','int'),(461,'name','Preface.pdf','string'),(461,'originalFileName','Preface.pdf','string'),(461,'sourceSubmissionFileId',NULL,'string'),(461,'submissionFileId','86','int'),(461,'submissionId','17','int'),(461,'username','msmith','string'),(462,'fileId','44','int'),(462,'fileStage','2','int'),(462,'originalFileName','Introduction.pdf','string'),(462,'sourceSubmissionFileId',NULL,'string'),(462,'submissionFileId','87','int'),(462,'submissionId','17','int'),(462,'username','msmith','string'),(463,'fileId','44','int'),(463,'fileStage','2','int'),(463,'name','Introduction.pdf','string'),(463,'submissionFileId','87','int'),(463,'submissionId','17','int'),(463,'username','msmith','string'),(464,'fileId','44','int'),(464,'fileStage','2','int'),(464,'originalFileName','Introduction.pdf','string'),(464,'sourceSubmissionFileId',NULL,'string'),(464,'submissionFileId','87','int'),(464,'submissionId','17','int'),(464,'username','msmith','string'),(465,'fileId','44','int'),(465,'fileStage','2','int'),(465,'name','Introduction.pdf','string'),(465,'originalFileName','Introduction.pdf','string'),(465,'sourceSubmissionFileId',NULL,'string'),(465,'submissionFileId','87','int'),(465,'submissionId','17','int'),(465,'username','msmith','string'),(466,'fileId','45','int'),(466,'fileStage','2','int'),(466,'originalFileName','The Emergence of Open Development in a N.pdf','string'),(466,'sourceSubmissionFileId',NULL,'string'),(466,'submissionFileId','88','int'),(466,'submissionId','17','int'),(466,'username','msmith','string'),(467,'fileId','45','int'),(467,'fileStage','2','int'),(467,'name','The Emergence of Open Development in a N.pdf','string'),(467,'submissionFileId','88','int'),(467,'submissionId','17','int'),(467,'username','msmith','string'),(468,'fileId','45','int'),(468,'fileStage','2','int'),(468,'originalFileName','The Emergence of Open Development in a N.pdf','string'),(468,'sourceSubmissionFileId',NULL,'string'),(468,'submissionFileId','88','int'),(468,'submissionId','17','int'),(468,'username','msmith','string'),(469,'fileId','45','int'),(469,'fileStage','2','int'),(469,'name','The Emergence of Open Development in a N.pdf','string'),(469,'originalFileName','The Emergence of Open Development in a N.pdf','string'),(469,'sourceSubmissionFileId',NULL,'string'),(469,'submissionFileId','88','int'),(469,'submissionId','17','int'),(469,'username','msmith','string'),(470,'fileId','46','int'),(470,'fileStage','2','int'),(470,'originalFileName','Enacting Openness in ICT4D Research.pdf','string'),(470,'sourceSubmissionFileId',NULL,'string'),(470,'submissionFileId','89','int'),(470,'submissionId','17','int'),(470,'username','msmith','string'),(471,'fileId','46','int'),(471,'fileStage','2','int'),(471,'name','Enacting Openness in ICT4D Research.pdf','string'),(471,'submissionFileId','89','int'),(471,'submissionId','17','int'),(471,'username','msmith','string'),(472,'fileId','46','int'),(472,'fileStage','2','int'),(472,'originalFileName','Enacting Openness in ICT4D Research.pdf','string'),(472,'sourceSubmissionFileId',NULL,'string'),(472,'submissionFileId','89','int'),(472,'submissionId','17','int'),(472,'username','msmith','string'),(473,'fileId','46','int'),(473,'fileStage','2','int'),(473,'name','Enacting Openness in ICT4D Research.pdf','string'),(473,'originalFileName','Enacting Openness in ICT4D Research.pdf','string'),(473,'sourceSubmissionFileId',NULL,'string'),(473,'submissionFileId','89','int'),(473,'submissionId','17','int'),(473,'username','msmith','string'),(474,'fileId','47','int'),(474,'fileStage','2','int'),(474,'originalFileName','Transparency and Development: Ethical Co.pdf','string'),(474,'sourceSubmissionFileId',NULL,'string'),(474,'submissionFileId','90','int'),(474,'submissionId','17','int'),(474,'username','msmith','string'),(475,'fileId','47','int'),(475,'fileStage','2','int'),(475,'name','Transparency and Development: Ethical Co.pdf','string'),(475,'submissionFileId','90','int'),(475,'submissionId','17','int'),(475,'username','msmith','string'),(476,'fileId','47','int'),(476,'fileStage','2','int'),(476,'originalFileName','Transparency and Development: Ethical Co.pdf','string'),(476,'sourceSubmissionFileId',NULL,'string'),(476,'submissionFileId','90','int'),(476,'submissionId','17','int'),(476,'username','msmith','string'),(477,'fileId','47','int'),(477,'fileStage','2','int'),(477,'name','Transparency and Development: Ethical Co.pdf','string'),(477,'originalFileName','Transparency and Development: Ethical Co.pdf','string'),(477,'sourceSubmissionFileId',NULL,'string'),(477,'submissionFileId','90','int'),(477,'submissionId','17','int'),(477,'username','msmith','string'),(478,'fileId','48','int'),(478,'fileStage','2','int'),(478,'originalFileName','Open Educational Resources: Opportunitie.pdf','string'),(478,'sourceSubmissionFileId',NULL,'string'),(478,'submissionFileId','91','int'),(478,'submissionId','17','int'),(478,'username','msmith','string'),(479,'fileId','48','int'),(479,'fileStage','2','int'),(479,'name','Open Educational Resources: Opportunitie.pdf','string'),(479,'submissionFileId','91','int'),(479,'submissionId','17','int'),(479,'username','msmith','string'),(480,'fileId','48','int'),(480,'fileStage','2','int'),(480,'originalFileName','Open Educational Resources: Opportunitie.pdf','string'),(480,'sourceSubmissionFileId',NULL,'string'),(480,'submissionFileId','91','int'),(480,'submissionId','17','int'),(480,'username','msmith','string'),(481,'fileId','48','int'),(481,'fileStage','2','int'),(481,'name','Open Educational Resources: Opportunitie.pdf','string'),(481,'originalFileName','Open Educational Resources: Opportunitie.pdf','string'),(481,'sourceSubmissionFileId',NULL,'string'),(481,'submissionFileId','91','int'),(481,'submissionId','17','int'),(481,'username','msmith','string'),(491,'decision','Send to Internal Review','string'),(491,'editorName','Daniel Barnes','string'),(491,'submissionId','17','int'),(492,'fileId','43','int'),(492,'fileStage','19','int'),(492,'originalFileName','Preface.pdf','string'),(492,'sourceSubmissionFileId','86','int'),(492,'submissionFileId','92','int'),(492,'submissionId','17','int'),(492,'username','dbarnes','string'),(493,'fileId','43','int'),(493,'fileStage','19','int'),(493,'name','Preface.pdf','string'),(493,'submissionFileId','92','int'),(493,'submissionId','17','int'),(493,'username','dbarnes','string'),(494,'fileId','44','int'),(494,'fileStage','19','int'),(494,'originalFileName','Introduction.pdf','string'),(494,'sourceSubmissionFileId','87','int'),(494,'submissionFileId','93','int'),(494,'submissionId','17','int'),(494,'username','dbarnes','string'),(495,'fileId','44','int'),(495,'fileStage','19','int'),(495,'name','Introduction.pdf','string'),(495,'submissionFileId','93','int'),(495,'submissionId','17','int'),(495,'username','dbarnes','string'),(496,'fileId','45','int'),(496,'fileStage','19','int'),(496,'originalFileName','The Emergence of Open Development in a N.pdf','string'),(496,'sourceSubmissionFileId','88','int'),(496,'submissionFileId','94','int'),(496,'submissionId','17','int'),(496,'username','dbarnes','string'),(497,'fileId','45','int'),(497,'fileStage','19','int'),(497,'name','The Emergence of Open Development in a N.pdf','string'),(497,'submissionFileId','94','int'),(497,'submissionId','17','int'),(497,'username','dbarnes','string'),(498,'fileId','46','int'),(498,'fileStage','19','int'),(498,'originalFileName','Enacting Openness in ICT4D Research.pdf','string'),(498,'sourceSubmissionFileId','89','int'),(498,'submissionFileId','95','int'),(498,'submissionId','17','int'),(498,'username','dbarnes','string'),(499,'fileId','46','int'),(499,'fileStage','19','int'),(499,'name','Enacting Openness in ICT4D Research.pdf','string'),(499,'submissionFileId','95','int'),(499,'submissionId','17','int'),(499,'username','dbarnes','string'),(500,'fileId','47','int'),(500,'fileStage','19','int'),(500,'originalFileName','Transparency and Development: Ethical Co.pdf','string'),(500,'sourceSubmissionFileId','90','int'),(500,'submissionFileId','96','int'),(500,'submissionId','17','int'),(500,'username','dbarnes','string'),(501,'fileId','47','int'),(501,'fileStage','19','int'),(501,'name','Transparency and Development: Ethical Co.pdf','string'),(501,'submissionFileId','96','int'),(501,'submissionId','17','int'),(501,'username','dbarnes','string'),(502,'fileId','48','int'),(502,'fileStage','19','int'),(502,'originalFileName','Open Educational Resources: Opportunitie.pdf','string'),(502,'sourceSubmissionFileId','91','int'),(502,'submissionFileId','97','int'),(502,'submissionId','17','int'),(502,'username','dbarnes','string'),(503,'fileId','48','int'),(503,'fileStage','19','int'),(503,'name','Open Educational Resources: Opportunitie.pdf','string'),(503,'submissionFileId','97','int'),(503,'submissionId','17','int'),(503,'username','dbarnes','string'),(504,'reviewAssignmentId','24','string'),(504,'reviewerName','Julie Janssen','string'),(504,'round','1','int'),(504,'stageId','2','int'),(504,'submissionId','17','int'),(505,'reviewAssignmentId','25','string'),(505,'reviewerName','Paul Hudson','string'),(505,'round','1','int'),(505,'stageId','2','int'),(505,'submissionId','17','int');
/*!40000 ALTER TABLE `event_log_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features`
--

DROP TABLE IF EXISTS `features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features` (
  `submission_id` bigint NOT NULL,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `seq` bigint NOT NULL,
  UNIQUE KEY `press_features_pkey` (`assoc_type`,`assoc_id`,`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'presses/1/monographs/1/69575547be779.pdf','application/pdf'),(2,'presses/1/monographs/2/695755687fcf7.pdf','application/pdf'),(3,'presses/1/monographs/2/69575568c7b98.pdf','application/pdf'),(4,'presses/1/monographs/2/695755691e3bc.pdf','application/pdf'),(5,'presses/1/monographs/2/695755697b630.pdf','application/pdf'),(6,'presses/1/monographs/3/695755ab0b036.pdf','application/pdf'),(7,'presses/1/monographs/4/695755c4beb51.pdf','application/pdf'),(8,'presses/1/monographs/4/695755c5146d5.pdf','application/pdf'),(9,'presses/1/monographs/4/695755c57107c.pdf','application/pdf'),(10,'presses/1/monographs/4/695755c5ceddb.pdf','application/pdf'),(11,'presses/1/monographs/5/6957560d7b86e.pdf','application/pdf'),(12,'presses/1/monographs/6/69575656c2b1b.pdf','application/pdf'),(13,'presses/1/monographs/6/695756571e062.pdf','application/pdf'),(14,'presses/1/monographs/6/695756576db36.pdf','application/pdf'),(15,'presses/1/monographs/6/69575657d2b57.pdf','application/pdf'),(16,'presses/1/monographs/7/69575695185cc.pdf','application/pdf'),(17,'presses/1/monographs/7/69575695657bb.pdf','application/pdf'),(18,'presses/1/monographs/7/69575695befb1.pdf','application/pdf'),(19,'presses/1/monographs/7/695756961c4cf.pdf','application/pdf'),(20,'presses/1/monographs/7/695756967a67d.pdf','application/pdf'),(21,'presses/1/monographs/8/695756da6ec41.pdf','application/pdf'),(22,'presses/1/monographs/9/695756e27a5b1.pdf','application/pdf'),(23,'presses/1/monographs/9/695756e2c5735.pdf','application/pdf'),(24,'presses/1/monographs/9/695756e3286a4.pdf','application/pdf'),(25,'presses/1/monographs/9/695756e38bc02.pdf','application/pdf'),(26,'presses/1/monographs/9/695756e3ecf7a.pdf','application/pdf'),(27,'presses/1/monographs/10/6957571c579e7.pdf','application/pdf'),(28,'presses/1/monographs/11/69575745b3536.pdf','application/pdf'),(29,'presses/1/monographs/12/6957577eaec5b.pdf','application/pdf'),(30,'presses/1/monographs/12/6957577f08e70.pdf','application/pdf'),(31,'presses/1/monographs/12/6957577f60a70.pdf','application/pdf'),(32,'presses/1/monographs/13/695757c917a24.pdf','application/pdf'),(33,'presses/1/monographs/13/695757c960e91.pdf','application/pdf'),(34,'presses/1/monographs/13/695757c9ba03c.pdf','application/pdf'),(35,'presses/1/monographs/14/695758207e9c9.pdf','application/pdf'),(36,'presses/1/monographs/14/69575820c78a5.pdf','application/pdf'),(37,'presses/1/monographs/14/695758212c7bb.pdf','application/pdf'),(38,'presses/1/monographs/14/695758219814e.pdf','application/pdf'),(39,'presses/1/monographs/14/695758220163a.pdf','application/pdf'),(40,'presses/1/monographs/14/69575822970ec.pdf','application/pdf'),(41,'presses/1/monographs/15/6957588ea1e53.pdf','application/pdf'),(42,'presses/1/monographs/16/695758a80d596.pdf','application/pdf'),(43,'presses/1/monographs/17/695758db46b9d.pdf','application/pdf'),(44,'presses/1/monographs/17/695758db8afa9.pdf','application/pdf'),(45,'presses/1/monographs/17/695758dbd432e.pdf','application/pdf'),(46,'presses/1/monographs/17/695758dc37e94.pdf','application/pdf'),(47,'presses/1/monographs/17/695758dc99343.pdf','application/pdf'),(48,'presses/1/monographs/17/695758dd00836.pdf','application/pdf');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_groups`
--

LOCK TABLES `filter_groups` WRITE;
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
INSERT INTO `filter_groups` VALUES (1,'publicationFormat=>dc11','plugins.metadata.dc11.publicationFormatAdapter.displayName','plugins.metadata.dc11.publicationFormatAdapter.description','class::classes.publicationFormat.PublicationFormat','metadata::plugins.metadata.dc11.schema.Dc11Schema(PUBLICATION_FORMAT)'),(2,'monographs=>onix30-xml','plugins.importexport.onix30.displayName','plugins.importexport.onix30.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/onix30/ONIX_BookProduct_3.0_reference.xsd)'),(3,'monograph=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),(4,'native-xml=>monograph','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),(5,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.monograph.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),(6,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.monograph.Author[]'),(7,'publication-format=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publicationFormat.PublicationFormat','xml::schema(plugins/importexport/native/native.xsd)'),(8,'native-xml=>PublicationFormat','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publicationFormat.PublicationFormat[]'),(9,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submission.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),(10,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submission.SubmissionFile'),(11,'monograph=>onix30-xml','plugins.importexport.onix30.displayName','plugins.importexport.onix30.description','class::classes.submission.Submission','xml::schema(plugins/importexport/native/ONIX_BookProduct_3.0_reference_notstrict.xsd)'),(12,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),(13,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication'),(14,'chapter=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.monograph.Chapter[]','xml::schema(plugins/importexport/native/native.xsd)'),(15,'native-xml=>chapter','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.monograph.Chapter'),(16,'user=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.user.User[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(17,'user-xml=>user','plugins.importexport.users.displayName','plugins.importexport.users.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::classes.users.User[]'),(18,'usergroup=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.security.UserGroup[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(19,'user-xml=>usergroup','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::lib.pkp.classes.security.UserGroup[]');
/*!40000 ALTER TABLE `filter_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_settings`
--

DROP TABLE IF EXISTS `filter_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_settings` (
  `filter_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `filter_settings_pkey` (`filter_id`,`locale`,`setting_name`),
  KEY `filter_settings_id` (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,1,0,'Extract metadata from a(n) PublicationFormat','plugins.metadata.dc11.filter.Dc11SchemaPublicationFormatAdapter',0,0,0),(2,2,0,'ONIX 3.0 XML monograph export','plugins.importexport.onix30.filter.MonographONIX30XmlFilter',0,0,0),(3,3,0,'Native XML submission export','plugins.importexport.native.filter.MonographNativeXmlFilter',0,0,0),(4,4,0,'Native XML submission import','plugins.importexport.native.filter.NativeXmlMonographFilter',0,0,0),(5,5,0,'Native XML author export','plugins.importexport.native.filter.AuthorNativeXmlFilter',0,0,0),(6,6,0,'Native XML author import','plugins.importexport.native.filter.NativeXmlAuthorFilter',0,0,0),(7,7,0,'Native XML representation export','plugins.importexport.native.filter.PublicationFormatNativeXmlFilter',0,0,0),(8,8,0,'Native XML representation import','plugins.importexport.native.filter.NativeXmlPublicationFormatFilter',0,0,0),(9,10,0,'Native XML submission file import','plugins.importexport.native.filter.NativeXmlMonographFileFilter',0,0,0),(10,9,0,'Native XML submission file export','lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter',0,0,0),(11,11,0,'ONIX 3.0 XML monograph export','plugins.importexport.onix30.filter.MonographONIX30XmlFilter',0,0,0),(12,12,0,'Native XML Publication export','plugins.importexport.native.filter.PublicationNativeXmlFilter',0,0,0),(13,13,0,'Native XML publication import','plugins.importexport.native.filter.NativeXmlPublicationFilter',0,0,0),(14,14,0,'Native XML chapter export','plugins.importexport.native.filter.ChapterNativeXmlFilter',0,0,0),(15,15,0,'Native XML Chapter import','plugins.importexport.native.filter.NativeXmlChapterFilter',0,0,0),(16,16,0,'User XML user export','lib.pkp.plugins.importexport.users.filter.PKPUserUserXmlFilter',0,0,0),(17,17,0,'User XML user import','lib.pkp.plugins.importexport.users.filter.UserXmlPKPUserFilter',0,0,0),(18,18,0,'Native XML user group export','lib.pkp.plugins.importexport.users.filter.UserGroupNativeXmlFilter',0,0,0),(19,19,0,'Native XML user group import','lib.pkp.plugins.importexport.users.filter.NativeXmlUserGroupFilter',0,0,0);
/*!40000 ALTER TABLE `filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_settings`
--

DROP TABLE IF EXISTS `genre_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre_settings` (
  `genre_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `genre_settings_pkey` (`genre_id`,`locale`,`setting_name`),
  KEY `genre_settings_genre_id` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `seq` bigint NOT NULL,
  `enabled` smallint NOT NULL DEFAULT '1',
  `category` bigint NOT NULL DEFAULT '1',
  `dependent` smallint NOT NULL DEFAULT '0',
  `supplementary` smallint NOT NULL DEFAULT '0',
  `entry_key` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identification_codes` (
  `identification_code_id` bigint NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint NOT NULL,
  `code` varchar(40) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`identification_code_id`),
  KEY `identification_codes_key` (`identification_code_id`,`publication_format_id`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identification_codes`
--

LOCK TABLES `identification_codes` WRITE;
/*!40000 ALTER TABLE `identification_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `identification_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_views`
--

DROP TABLE IF EXISTS `item_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_views` (
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `date_last_viewed` datetime DEFAULT NULL,
  UNIQUE KEY `item_views_pkey` (`assoc_type`,`assoc_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `file_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)',
  UNIQUE KEY `library_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  KEY `library_file_settings_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `submission_id` bigint NOT NULL,
  `public_access` smallint DEFAULT '0',
  PRIMARY KEY (`file_id`),
  KEY `library_files_context_id` (`context_id`),
  KEY `library_files_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  KEY `format_markets_pkey` (`market_id`,`publication_format_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metadata_description_settings` (
  `metadata_description_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `metadata_descripton_settings_pkey` (`metadata_description_id`,`locale`,`setting_name`),
  KEY `metadata_description_settings_id` (`metadata_description_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metadata_descriptions` (
  `metadata_description_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint NOT NULL DEFAULT '0',
  `assoc_id` bigint NOT NULL DEFAULT '0',
  `schema_namespace` varchar(255) NOT NULL,
  `schema_name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `seq` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`metadata_description_id`),
  KEY `metadata_descriptions_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics` (
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint NOT NULL,
  `pkp_section_id` bigint DEFAULT NULL,
  `assoc_object_type` bigint DEFAULT NULL,
  `assoc_object_id` bigint DEFAULT NULL,
  `submission_id` bigint DEFAULT NULL,
  `representation_id` bigint DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `day` varchar(8) DEFAULT NULL,
  `month` varchar(6) DEFAULT NULL,
  `file_type` smallint DEFAULT NULL,
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `metric_type` varchar(255) NOT NULL,
  `metric` int NOT NULL,
  KEY `metrics_load_id` (`load_id`),
  KEY `metrics_metric_type_context_id` (`metric_type`,`context_id`),
  KEY `metrics_metric_type_submission_id_assoc_type` (`metric_type`,`submission_id`,`assoc_type`),
  KEY `metrics_metric_type_submission_id_assoc` (`metric_type`,`context_id`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_item_assignment_settings` (
  `navigation_menu_item_assignment_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `navigation_menu_item_assignment_settings_pkey` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  KEY `assignment_settings_navigation_menu_item_assignment_id` (`navigation_menu_item_assignment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  PRIMARY KEY (`navigation_menu_item_assignment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
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
  `navigation_menu_item_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `navigation_menu_item_settings_pkey` (`navigation_menu_item_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_settings_navigation_menu_id` (`navigation_menu_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_items` (
  `navigation_menu_item_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `path` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT '',
  PRIMARY KEY (`navigation_menu_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
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
  `submission_id` bigint NOT NULL,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  UNIQUE KEY `new_releases_pkey` (`assoc_type`,`assoc_id`,`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  KEY `notes_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,1048586,1,6,'2026-01-02 05:24:24','2026-01-02 05:24:24','Recommendation','<p>Daniel Barnes, David Buskins:<br><br>The recommendation regarding the submission to Public Knowledge Press, \"The Information Literacy User’s Guide\" is: Send to External Review</p><br/><br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>');
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_mail_list`
--

DROP TABLE IF EXISTS `notification_mail_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_mail_list` (
  `notification_mail_list_id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `confirmed` smallint NOT NULL DEFAULT '0',
  `token` varchar(40) NOT NULL,
  `context` bigint NOT NULL,
  PRIMARY KEY (`notification_mail_list_id`),
  UNIQUE KEY `notification_mail_list_email_context` (`email`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_settings` (
  `notification_id` bigint NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `notification_settings_pkey` (`notification_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `setting_value` text NOT NULL,
  `user_id` bigint NOT NULL,
  `context` bigint NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
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
  `context_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `level` bigint NOT NULL,
  `type` bigint NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint DEFAULT NULL,
  `assoc_id` bigint DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  KEY `notifications_context_id` (`context_id`,`level`),
  KEY `notifications_assoc` (`assoc_type`,`assoc_id`),
  KEY `notifications_user_id_level` (`user_id`,`level`)
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (11,1,3,2,16777217,'2026-01-02 05:19:15',NULL,1048585,1),(12,1,0,2,16777243,'2026-01-02 05:19:15',NULL,1048585,1),(13,1,0,2,16777245,'2026-01-02 05:19:15',NULL,1048585,1),(14,1,0,2,16777236,'2026-01-02 05:19:20','2026-01-02 05:19:21',523,1),(16,1,12,3,16777227,'2026-01-02 05:19:25',NULL,517,1),(18,1,19,2,16777230,'2026-01-02 05:19:26',NULL,1048585,1),(19,1,3,2,16777251,'2026-01-02 05:19:26','2026-01-02 05:19:27',1048585,1),(36,1,3,2,16777217,'2026-01-02 05:20:20',NULL,1048585,2),(37,1,0,2,16777243,'2026-01-02 05:20:20',NULL,1048585,2),(38,1,0,2,16777245,'2026-01-02 05:20:20',NULL,1048585,2),(39,1,0,2,16777236,'2026-01-02 05:20:26','2026-01-02 05:20:27',523,2),(40,1,20,2,16777231,'2026-01-02 05:20:26',NULL,1048585,2),(41,1,11,3,16777227,'2026-01-02 05:20:31',NULL,517,2),(43,1,12,3,16777227,'2026-01-02 05:20:36',NULL,517,3),(50,1,3,2,16777217,'2026-01-02 05:21:02',NULL,1048585,3),(51,1,0,2,16777243,'2026-01-02 05:21:02',NULL,1048585,3),(52,1,0,2,16777245,'2026-01-02 05:21:02',NULL,1048585,3),(64,1,3,2,16777217,'2026-01-02 05:21:42',NULL,1048585,4),(65,1,0,2,16777243,'2026-01-02 05:21:42',NULL,1048585,4),(66,1,0,2,16777245,'2026-01-02 05:21:42','2026-01-02 05:22:11',1048585,4),(67,1,0,2,16777236,'2026-01-02 05:21:47','2026-01-02 05:21:49',523,3),(69,1,9,3,16777227,'2026-01-02 05:21:53',NULL,517,4),(71,1,0,2,16777236,'2026-01-02 05:21:55','2026-01-02 05:21:57',523,4),(73,1,11,3,16777227,'2026-01-02 05:22:00',NULL,517,5),(78,1,22,2,16777235,'2026-01-02 05:22:09',NULL,1048585,4),(79,1,3,2,16777254,'2026-01-02 05:22:09',NULL,1048585,4),(87,1,3,2,16777217,'2026-01-02 05:22:44',NULL,1048585,5),(90,1,0,2,16777236,'2026-01-02 05:22:49','2026-01-02 05:22:51',523,5),(92,1,8,3,16777227,'2026-01-02 05:22:54',NULL,517,6),(94,1,0,2,16777236,'2026-01-02 05:22:56','2026-01-02 05:22:57',523,6),(96,1,12,3,16777227,'2026-01-02 05:23:00',NULL,517,7),(101,1,23,2,16777235,'2026-01-02 05:23:08',NULL,1048585,5),(102,1,3,2,16777254,'2026-01-02 05:23:08',NULL,1048585,5),(105,1,0,2,16777246,'2026-01-02 05:23:28',NULL,1048585,5),(117,1,3,2,16777217,'2026-01-02 05:24:07',NULL,1048585,6),(118,1,4,2,16777217,'2026-01-02 05:24:07',NULL,1048585,6),(119,1,0,2,16777243,'2026-01-02 05:24:07',NULL,1048585,6),(120,1,0,2,16777245,'2026-01-02 05:24:07',NULL,1048585,6),(121,1,0,2,16777236,'2026-01-02 05:24:13','2026-01-02 05:24:14',523,7),(122,1,24,2,16777229,'2026-01-02 05:24:13',NULL,1048585,6),(124,1,3,3,16777249,'2026-01-02 05:24:24',NULL,1048586,1),(125,1,4,3,16777249,'2026-01-02 05:24:24',NULL,1048586,1),(140,1,3,2,16777217,'2026-01-02 05:25:20',NULL,1048585,7),(141,1,0,2,16777243,'2026-01-02 05:25:20',NULL,1048585,7),(142,1,0,2,16777245,'2026-01-02 05:25:20',NULL,1048585,7),(143,1,0,2,16777236,'2026-01-02 05:25:27','2026-01-02 05:25:28',523,8),(145,1,10,3,16777227,'2026-01-02 05:25:33',NULL,517,8),(147,1,25,2,16777230,'2026-01-02 05:25:35',NULL,1048585,7),(148,1,3,2,16777251,'2026-01-02 05:25:35','2026-01-02 05:25:36',1048585,7),(150,1,3,2,16777217,'2026-01-02 05:25:48',NULL,1048585,8),(151,1,0,2,16777243,'2026-01-02 05:25:48',NULL,1048585,8),(152,1,0,2,16777245,'2026-01-02 05:25:48',NULL,1048585,8),(167,1,3,2,16777217,'2026-01-02 05:26:37',NULL,1048585,9),(168,1,4,2,16777217,'2026-01-02 05:26:37',NULL,1048585,9),(169,1,0,2,16777243,'2026-01-02 05:26:37',NULL,1048585,9),(170,1,0,2,16777245,'2026-01-02 05:26:37',NULL,1048585,9),(171,1,0,2,16777236,'2026-01-02 05:26:43','2026-01-02 05:26:45',523,9),(172,1,26,2,16777229,'2026-01-02 05:26:44',NULL,1048585,9),(182,1,3,2,16777217,'2026-01-02 05:27:27',NULL,1048585,10),(183,1,0,2,16777243,'2026-01-02 05:27:27',NULL,1048585,10),(184,1,0,2,16777245,'2026-01-02 05:27:27',NULL,1048585,10),(187,1,3,2,16777217,'2026-01-02 05:27:42',NULL,1048585,11),(188,1,0,2,16777243,'2026-01-02 05:27:42',NULL,1048585,11),(189,1,0,2,16777245,'2026-01-02 05:27:42',NULL,1048585,11),(190,1,0,2,16777236,'2026-01-02 05:27:46','2026-01-02 05:27:48',523,10),(192,1,9,3,16777227,'2026-01-02 05:27:51',NULL,517,9),(194,1,0,2,16777236,'2026-01-02 05:27:52','2026-01-02 05:27:53',523,11),(200,1,3,2,16777219,'2026-01-02 05:28:07',NULL,517,10),(201,1,3,2,16777219,'2026-01-02 05:28:15',NULL,517,11),(202,1,28,2,16777230,'2026-01-02 05:28:22',NULL,1048585,11),(203,1,3,2,16777251,'2026-01-02 05:28:22','2026-01-02 05:28:23',1048585,11),(217,1,3,2,16777217,'2026-01-02 05:29:08',NULL,1048585,12),(218,1,0,2,16777243,'2026-01-02 05:29:08',NULL,1048585,12),(219,1,0,2,16777245,'2026-01-02 05:29:08',NULL,1048585,12),(220,1,0,2,16777236,'2026-01-02 05:29:15','2026-01-02 05:29:17',523,12),(221,1,29,2,16777229,'2026-01-02 05:29:15',NULL,1048585,12),(222,1,7,3,16777227,'2026-01-02 05:29:21',NULL,517,12),(226,1,9,3,16777227,'2026-01-02 05:29:29',NULL,517,14),(228,1,3,2,16777219,'2026-01-02 05:29:38',NULL,517,13),(238,1,3,2,16777217,'2026-01-02 05:30:11',NULL,1048585,13),(239,1,0,2,16777243,'2026-01-02 05:30:11',NULL,1048585,13),(240,1,0,2,16777245,'2026-01-02 05:30:11',NULL,1048585,13),(241,1,0,2,16777236,'2026-01-02 05:30:17','2026-01-02 05:30:18',523,13),(243,1,8,3,16777227,'2026-01-02 05:30:22',NULL,517,15),(245,1,0,2,16777236,'2026-01-02 05:30:24','2026-01-02 05:30:26',523,14),(249,1,11,3,16777227,'2026-01-02 05:30:34',NULL,517,17),(253,1,3,2,16777219,'2026-01-02 05:30:46',NULL,517,16),(254,1,3,2,16777219,'2026-01-02 05:30:54',NULL,517,18),(255,1,30,2,16777230,'2026-01-02 05:31:04',NULL,1048585,13),(256,1,3,2,16777251,'2026-01-02 05:31:04','2026-01-02 05:31:05',1048585,13),(267,1,3,2,16777217,'2026-01-02 05:31:44',NULL,1048585,14),(270,1,0,2,16777236,'2026-01-02 05:31:51','2026-01-02 05:31:53',523,15),(272,1,7,3,16777227,'2026-01-02 05:31:57',NULL,517,19),(274,1,0,2,16777236,'2026-01-02 05:31:59','2026-01-02 05:32:00',523,16),(276,1,11,3,16777227,'2026-01-02 05:32:04',NULL,517,20),(281,1,31,2,16777235,'2026-01-02 05:32:13',NULL,1048585,14),(282,1,3,2,16777254,'2026-01-02 05:32:13',NULL,1048585,14),(285,1,0,2,16777246,'2026-01-02 05:32:56',NULL,1048585,14),(289,1,3,2,16777217,'2026-01-02 05:33:14',NULL,1048585,15),(290,1,0,2,16777243,'2026-01-02 05:33:14',NULL,1048585,15),(291,1,0,2,16777245,'2026-01-02 05:33:14',NULL,1048585,15),(292,1,0,2,16777236,'2026-01-02 05:33:20','2026-01-02 05:33:21',523,17),(293,1,32,2,16777231,'2026-01-02 05:33:20',NULL,1048585,15),(299,1,3,2,16777217,'2026-01-02 05:33:46',NULL,1048585,16),(300,1,0,2,16777243,'2026-01-02 05:33:46',NULL,1048585,16),(301,1,0,2,16777245,'2026-01-02 05:33:46',NULL,1048585,16),(302,1,0,2,16777236,'2026-01-02 05:33:53','2026-01-02 05:33:54',523,18),(303,1,33,2,16777231,'2026-01-02 05:33:53',NULL,1048585,16),(306,1,11,3,16777227,'2026-01-02 05:34:01',NULL,517,22),(308,1,12,3,16777227,'2026-01-02 05:34:05',NULL,517,23),(310,1,3,2,16777219,'2026-01-02 05:34:12',NULL,517,21),(330,1,3,2,16777217,'2026-01-02 05:35:18',NULL,1048585,17),(331,1,0,2,16777243,'2026-01-02 05:35:18',NULL,1048585,17),(332,1,0,2,16777245,'2026-01-02 05:35:18',NULL,1048585,17),(333,1,0,2,16777236,'2026-01-02 05:35:27','2026-01-02 05:35:29',523,19),(334,1,34,2,16777229,'2026-01-02 05:35:27',NULL,1048585,17),(335,1,7,3,16777227,'2026-01-02 05:35:34',NULL,517,24),(337,1,8,3,16777227,'2026-01-02 05:35:39',NULL,517,25);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_resumption_tokens`
--

DROP TABLE IF EXISTS `oai_resumption_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oai_resumption_tokens` (
  `token` varchar(32) NOT NULL,
  `expire` bigint NOT NULL,
  `record_offset` int NOT NULL,
  `params` text,
  UNIQUE KEY `oai_resumption_tokens_pkey` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `plugin_name` varchar(80) NOT NULL,
  `context_id` bigint NOT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `plugin_settings_pkey` (`plugin_name`,`context_id`,`setting_name`),
  KEY `plugin_settings_plugin_name` (`plugin_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_settings`
--

LOCK TABLES `plugin_settings` WRITE;
/*!40000 ALTER TABLE `plugin_settings` DISABLE KEYS */;
INSERT INTO `plugin_settings` VALUES ('acronplugin',0,'crontab','[{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"lib.pkp.classes.task.ReviewReminder\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.PublishSubmissions\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]','object'),('acronplugin',0,'enabled','1','bool'),('browseblockplugin',1,'browseCategories','1','bool'),('browseblockplugin',1,'browseNewReleases','1','bool'),('browseblockplugin',1,'browseSeries','1','bool'),('browseblockplugin',1,'context','1','int'),('browseblockplugin',1,'enabled','1','bool'),('browseblockplugin',1,'seq','1','int'),('defaultthemeplugin',0,'enabled','1','bool'),('defaultthemeplugin',1,'baseColour','#1E6292','string'),('defaultthemeplugin',1,'enabled','1','bool'),('defaultthemeplugin',1,'typography','notoSans','string'),('defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),('developedbyblockplugin',0,'context','1','int'),('developedbyblockplugin',0,'enabled','0','bool'),('developedbyblockplugin',0,'seq','0','int'),('developedbyblockplugin',1,'context','1','int'),('developedbyblockplugin',1,'enabled','0','bool'),('developedbyblockplugin',1,'seq','0','int'),('dublincoremetaplugin',1,'enabled','1','bool'),('googlescholarplugin',1,'enabled','1','bool'),('htmlmonographfileplugin',1,'enabled','1','bool'),('informationblockplugin',1,'context','1','int'),('informationblockplugin',1,'enabled','1','bool'),('informationblockplugin',1,'seq','7','int'),('languagetoggleblockplugin',0,'context','1','int'),('languagetoggleblockplugin',0,'enabled','1','bool'),('languagetoggleblockplugin',0,'seq','4','int'),('languagetoggleblockplugin',1,'context','1','int'),('languagetoggleblockplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',1,'seq','4','int'),('pdfjsviewerplugin',1,'enabled','1','bool'),('tinymceplugin',0,'enabled','1','bool'),('tinymceplugin',1,'enabled','1','bool'),('usageeventplugin',0,'enabled','1','bool'),('usageeventplugin',0,'uniqueSiteId','6957549929c40','string'),('usagestatsplugin',0,'accessLogFileParseRegex','/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/','string'),('usagestatsplugin',0,'chartType','bar','string'),('usagestatsplugin',0,'createLogFiles','1','bool'),('usagestatsplugin',0,'datasetMaxCount','4','string'),('usagestatsplugin',0,'enabled','1','bool'),('usagestatsplugin',0,'optionalColumns','[\"city\",\"region\"]','object'),('webfeedplugin',1,'displayItems','1','bool'),('webfeedplugin',1,'displayPage','homepage','string'),('webfeedplugin',1,'enabled','1','bool');
/*!40000 ALTER TABLE `plugin_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `press_settings`
--

DROP TABLE IF EXISTS `press_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `press_settings` (
  `press_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) DEFAULT NULL,
  UNIQUE KEY `press_settings_pkey` (`press_id`,`locale`,`setting_name`),
  KEY `press_settings_press_id` (`press_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `press_settings`
--

LOCK TABLES `press_settings` WRITE;
/*!40000 ALTER TABLE `press_settings` DISABLE KEYS */;
INSERT INTO `press_settings` VALUES (1,'','contactEmail','rvaca@mailinator.com',NULL),(1,'','contactName','Ramiro Vaca',NULL),(1,'','coverThumbnailsMaxHeight','100',NULL),(1,'','coverThumbnailsMaxWidth','106',NULL),(1,'','defaultReviewMode','2',NULL),(1,'','disableSubmissions','0',NULL),(1,'','emailSignature','<br/>\n________________________________________________________________________<br/>\n<a href=\"{$ldelim}$contextUrl{$rdelim}\">{$ldelim}$contextName{$rdelim}</a>',NULL),(1,'','itemsPerPage','25',NULL),(1,'','keywords','request',NULL),(1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada',NULL),(1,'','numPageLinks','10',NULL),(1,'','numWeeksPerResponse','4',NULL),(1,'','numWeeksPerReview','4',NULL),(1,'','paymentPluginName','ManualPayment',NULL),(1,'','supportedFormLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportedSubmissionLocales','[\"en_US\",\"fr_CA\"]',NULL),(1,'','supportEmail','rvaca@mailinator.com',NULL),(1,'','supportName','Ramiro Vaca',NULL),(1,'','themePluginPath','default',NULL),(1,'','type','enable',NULL),(1,'en_US','acronym','JPK',NULL),(1,'en_US','authorInformation','Interested in submitting to this press? We recommend that you review the <a href=\"http://localhost/index.php/publicknowledge/about\">About the Press</a> page for the press\' section policies and <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.php/publicknowledge/user/register\">register</a> with the press prior to submitting, or if already registered can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the 5 step process.',NULL),(1,'en_US','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">',NULL),(1,'en_US','librarianInformation','We encourage research librarians to list this press among their library\'s electronic press holdings. As well, this open source publishing system is suitable for libraries to host for their faculty members to use with presses they are involved in editing (see <a href=\"http://pkp.sfu.ca/omp\">Open Monograph Press</a>).',NULL),(1,'en_US','name','Public Knowledge Press',NULL),(1,'en_US','openAccessPolicy','This press provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),(1,'en_US','privacyStatement','<p>The names and email addresses entered in this press site will be used exclusively for the stated purposes of this press and will not be made available for any other purpose or to any other party.</p>',NULL),(1,'en_US','readerInformation','We encourage readers to sign up for the publishing notification service for this press. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the homepage for the press. This registration will result in the reader receiving the Table of Contents by email for each new monograph of the press. This list also allows the press to claim a certain level of support or readership. See the press <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a> which assures readers that their name and email address will not be used for other purposes.',NULL),(1,'en_US','searchDescription','Public Knowledge Press is a publisher dedicated to the subject of public access to science.',NULL),(1,'en_US','submissionChecklist','[{\"order\":1,\"content\":\"The submission has not been previously published, nor is it before another press for consideration (or an explanation has been provided in Comments to the Editor).\"},{\"order\":2,\"content\":\"The submission file is in the Microsoft Word, RTF, or OpenDocument file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":4,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the <a href=\\\"http:\\/\\/localhost\\/index.php\\/publicknowledge\\/about\\/submissions#authorGuidelines\\\" target=\\\"_blank\\\">Author Guidelines<\\/a>, which is found in About the Press.\"}]',NULL),(1,'fr_CA','authorInformation','Vous souhaitez soumettre une contribution à cette presse ? Nous vous recommandons de lire la page\n <a href=\"http://localhost/index.php/publicknowledge/about\">À propos de cette presse</a> pour connaitre ses règlements et la page\n <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Lignes directrices à l\'intention des auteurs-es</a>. Les auteurs-es doivent <a href=\"http://localhost/index.php/publicknowledge/user/register\">s\'inscrire</a> auprès de la presse avant d\'envoyer une soumission. Si vous êtes déjà inscrit-e, il suffit simplement <a href=\"http://localhost/index.php/index/login\">d\'ouvrir une session</a> pour débuter la procédure en 5 étapes.',NULL),(1,'fr_CA','librarianInformation','Nous encourageons les bibliothécaires de recherche à ajouter cette presse à la liste électronique des ressources documentaires de la bibliothèque. De plus, ce système d\'édition à libre accès convient à toutes les bibliothèques et permet aux membres des facultés de l\'utiliser pour les presses auxquelles ils contribuent à titre de rédacteur en chef. (voir <a href=\"http://pkp.sfu.ca/omp\">Open Monograph Press</a>).',NULL),(1,'fr_CA','name','Press de la connaissance du public',NULL),(1,'fr_CA','openAccessPolicy','Cette presse offre un accès libre immédiat à son contenu en partant du principe que la recherche doit être accessible au grand public, car cela favorise un meilleur échange des connaissances à l\'échelle mondiale.',NULL),(1,'fr_CA','privacyStatement','<p>Les noms et adresses courriel saisis sur ce site de presse seront utilisés exclusivement pour les fins convenues de cette presse. Ils ne seront pas utilisés pour d\'autres fins ou transmis à une tierce partie.</p>',NULL),(1,'fr_CA','readerInformation','Nous encourageons les lecteurs à s\'abonner au service d\'avis de publication de cette presse. Utilisez le lien <a href=\"http://localhost/index.php/publicknowledge/user/register\">d\'inscription</a> situé en haut de la page d\'accueil de la presse. Cette inscription permettra au lecteur de recevoir la table des matières de chaque nouvelle monographie de cette presse par courriel. Cette liste permet également à la presse d\'affirmer qu\'elle compte un certain nombre de lecteurs. Consultez <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">l\'énoncé de confidentialité </a> de la presse, lequel stipule que les noms et adresses courriel de ses lecteurs ne seront pas utilisés à d\'autres fins.',NULL),(1,'fr_CA','submissionChecklist','[{\"order\":1,\"content\":\"Cette soumission n\'a jamais été publiée et n\'a pas été soumise à une autre presse (ou une explication a été ajoutée à la section Commentaires du rédacteur en chef).\"},{\"order\":2,\"content\":\"Le fichier soumis est de format Microsoft Word, RTF ou OpenDocument.\"},{\"order\":3,\"content\":\"Les adresses URL des références ont été fournies si elles étaient disponibles.\"},{\"order\":4,\"content\":\"Le texte est publié à simple interligne ; utiliser une police de caractères de 12 points ; utiliser des caractères italiques au lieu de souligner (sauf pour les adresses URL) ; et toutes les illustrations, figures et tableaux doivent être insérés dans le texte aux endroits appropriés plutôt qu\'à la fin.\"},{\"order\":5,\"content\":\"Le texte respecte les exigences stylistiques et bibliographiques conformément aux <a href=\\\"http:\\/\\/localhost\\/index.php\\/publicknowledge\\/about\\/submissions#authorGuidelines\\\" target=\\\"_blank\\\">lignes directrices à l\'intention des auteurs<\\/a>, disponibles dans la rubrique À propos de cette presse.\"}]',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_categories` (
  `publication_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  UNIQUE KEY `publication_categories_id` (`publication_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  KEY `format_publication_dates_pkey` (`publication_date_id`,`publication_format_id`,`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `publication_format_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `publication_format_settings_pkey` (`publication_format_id`,`locale`,`setting_name`),
  KEY `publication_format_id_key` (`publication_format_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_format_settings`
--

LOCK TABLES `publication_format_settings` WRITE;
/*!40000 ALTER TABLE `publication_format_settings` DISABLE KEYS */;
INSERT INTO `publication_format_settings` VALUES (1,'en_US','name','PDF','string'),(1,'fr_CA','name','','string'),(2,'en_US','name','PDF','string'),(2,'fr_CA','name','','string');
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
  `submission_id` bigint DEFAULT NULL,
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
  PRIMARY KEY (`publication_format_id`),
  KEY `publication_format_submission_id` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_formats`
--

LOCK TABLES `publication_formats` WRITE;
/*!40000 ALTER TABLE `publication_formats` DISABLE KEYS */;
INSERT INTO `publication_formats` VALUES (1,5,NULL,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',1,1),(2,14,NULL,0,'DA',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',1,1);
/*!40000 ALTER TABLE `publication_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_settings`
--

DROP TABLE IF EXISTS `publication_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_settings` (
  `publication_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  UNIQUE KEY `publication_settings_pkey` (`publication_id`,`locale`,`setting_name`),
  KEY `publication_settings_publication_id` (`publication_id`),
  KEY `publication_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_settings`
--

LOCK TABLES `publication_settings` WRITE;
/*!40000 ALTER TABLE `publication_settings` DISABLE KEYS */;
INSERT INTO `publication_settings` VALUES (1,'','categoryIds','[]'),(1,'en_US','abstract','<p>The ABCs of Human Survival examines the effect of militant nationalism and the lawlessness of powerful states on the well-being of individuals and local communities―and the essential role of global citizenship within that dynamic. Based on the analysis of world events, Dr. Arthur Clark presents militant nationalism as a pathological pattern of thinking that threatens our security, while emphasizing effective democracy and international law as indispensable frameworks for human protection.</p>'),(1,'en_US','prefix',''),(1,'en_US','subtitle',''),(1,'en_US','title','The ABCs of Human Survival: A Paradigm for Global Citizenship'),(1,'fr_CA','abstract',''),(1,'fr_CA','prefix',''),(1,'fr_CA','subtitle',''),(1,'fr_CA','title',''),(2,'','categoryIds','[]'),(2,'en_US','abstract','<p>The West and Beyond explores the state of Western Canadian history, showcasing the research interests of a new generation of scholars while charting new directions for the future and stimulating further interrogation of our past. This dynamic collection encourages dialogue among generations of historians of the West, and among practitioners of diverse approaches to the past. It also reflects a broad range of disciplinary and professional boundaries, offering new ways to understand the West.</p>'),(2,'en_US','prefix',''),(2,'en_US','subtitle',''),(2,'en_US','title','The West and Beyond: New Perspectives on an Imagined Region'),(2,'fr_CA','abstract',''),(2,'fr_CA','prefix',''),(2,'fr_CA','subtitle',''),(2,'fr_CA','title',''),(3,'','categoryIds','[]'),(3,'en_US','abstract','<p>Workplace injuries are common, avoidable, and unacceptable. The Political Economy of Workplace Injury in Canada reveals how employers and governments engage in ineffective injury prevention efforts, intervening only when necessary to maintain the standard legitimacy. Dr. Bob Barnetson sheds light on this faulty system, highlighting the way in which employers create dangerous work environments yet pour billions of dollars into compensation and treatment. Examining this dynamic clarifies the way in which production costs are passed on to workers in the form of workplace injuries.</p>'),(3,'en_US','prefix',''),(3,'en_US','subtitle',''),(3,'en_US','title','The Political Economy of Workplace Injury in Canada'),(3,'fr_CA','abstract',''),(3,'fr_CA','prefix',''),(3,'fr_CA','subtitle',''),(3,'fr_CA','title',''),(4,'','categoryIds','[]'),(4,'en_US','abstract','<p>What does Canadian popular culture say about the construction and negotiation of Canadian national identity? This third volume of How Canadians Communicate describes the negotiation of popular culture across terrains where national identity is built by producers and audiences, government and industry, history and geography, ethnicities and citizenships.</p>'),(4,'en_US','prefix',''),(4,'en_US','subtitle',''),(4,'en_US','title','How Canadians Communicate: Contexts of Canadian Popular Culture'),(4,'fr_CA','abstract',''),(4,'fr_CA','prefix',''),(4,'fr_CA','subtitle',''),(4,'fr_CA','title',''),(5,'','categoryIds','[]'),(5,'','copyrightYear','2026'),(5,'en_US','abstract','<p>Canada and the United States. Two nations, one border, same continent. Anti-American sentiment in Canada is well documented, but what have Americans had to say about their northern neighbour? Allan examines how the American media has portrayed Canada, from Confederation to Obama’s election. By examining major events that have tested bilateral relations, Bomb Canada tracks the history of anti-Canadianism in the U.S. Informative, thought provoking and at times hilarious, this book reveals another layer of the complex relationship between Canada and the United States.</p>'),(5,'en_US','copyrightHolder','Public Knowledge Press'),(5,'en_US','prefix',''),(5,'en_US','subtitle',''),(5,'en_US','title','Bomb Canada and Other Unkind Remarks in the American Media'),(5,'fr_CA','abstract',''),(5,'fr_CA','copyrightHolder','Press de la connaissance du public'),(5,'fr_CA','prefix',''),(5,'fr_CA','subtitle',''),(5,'fr_CA','title',''),(6,'','categoryIds','[]'),(6,'en_US','abstract','<p>Good researchers have a host of tools at their disposal that make navigating today’s complex information ecosystem much more manageable. Gaining the knowledge, abilities, and self-reflection necessary to be a good researcher helps not only in academic settings, but is invaluable in any career, and throughout one’s life. The Information Literacy User’s Guide will start you on this route to success.</p>'),(6,'en_US','prefix',''),(6,'en_US','subtitle',''),(6,'en_US','title','The Information Literacy User’s Guide'),(6,'fr_CA','abstract',''),(6,'fr_CA','prefix',''),(6,'fr_CA','subtitle',''),(6,'fr_CA','title',''),(7,'','categoryIds','[]'),(7,'en_US','abstract','<p>Accessible Elements informs science educators about current practices in online and distance education: distance-delivered methods for laboratory coursework, the requisite administrative and institutional aspects of online and distance teaching, and the relevant educational theory.</p>'),(7,'en_US','prefix',''),(7,'en_US','subtitle',''),(7,'en_US','title','Accessible Elements: Teaching Science Online and at a Distance'),(7,'fr_CA','abstract',''),(7,'fr_CA','prefix',''),(7,'fr_CA','subtitle',''),(7,'fr_CA','title',''),(8,'','categoryIds','[]'),(8,'en_US','abstract','<p>A Note From The Publisher</p>'),(8,'en_US','prefix',''),(8,'en_US','subtitle',''),(8,'en_US','title','Editorial'),(8,'fr_CA','abstract',''),(8,'fr_CA','prefix',''),(8,'fr_CA','subtitle',''),(8,'fr_CA','title',''),(9,'','categoryIds','[]'),(9,'en_US','abstract','<p>In recent years, the Internet and other network technologies have emerged as a central issue for development in Latin America and the Caribbean. They have shown their potential to increase productivity and economic competitiveness, to create new ways to deliver education and health services, and to be driving forces for the modernization of the provision of public services.</p>'),(9,'en_US','prefix',''),(9,'en_US','subtitle',''),(9,'en_US','title','Enabling Openness: The future of the information society in Latin America and the Caribbean'),(9,'fr_CA','abstract',''),(9,'fr_CA','prefix',''),(9,'fr_CA','subtitle',''),(9,'fr_CA','title',''),(10,'','categoryIds','[]'),(10,'en_US','abstract','<p>While contemporaries and historians alike hailed the establishment of Buffalo National Park in Wainwright, Alberta as a wildlife saving effort, the political climate of the early 20th century worked against it. The Canadian Parks Branch was never sufficiently funded to operate BNP effectively or to remedy the crises the animals faced as a result. Cross-breeding experiments with bison and domestic cattle proved unfruitful. Attempts at commercializing the herd had no success. Ultimately, the Department of National Defence repurposed the park for military training and the bison disappeared once more.</p>'),(10,'en_US','prefix',''),(10,'en_US','subtitle',''),(10,'en_US','title','Lost Tracks: Buffalo National Park, 1909-1939'),(10,'fr_CA','abstract',''),(10,'fr_CA','prefix',''),(10,'fr_CA','subtitle',''),(10,'fr_CA','title',''),(11,'','categoryIds','[]'),(11,'en_US','abstract','<p>Dreamwork is a poetic exploration of the then and there, here and now, of landscapes and inscapes over time. It is part of a poetry series on dream and its relation to actuality. The poems explore past, present, and future in different places from Canada through New Jersey, New York and New England to England and Europe, part of the speaker’s journey. A typology of home and displacement, of natural beauty and industrial scars unfolds in the movement of the book.</p>'),(11,'en_US','prefix',''),(11,'en_US','subtitle',''),(11,'en_US','title','Dreamwork'),(11,'fr_CA','abstract',''),(11,'fr_CA','prefix',''),(11,'fr_CA','subtitle',''),(11,'fr_CA','title',''),(12,'','categoryIds','[]'),(12,'en_US','abstract','<p>Over the past two decades, projects supported by the International Development Research Centre (IDRC) have critically examined how information and communications technologies (ICTs) can be used to improve learning, empower the disenfranchised, generate income opportunities for the poor, and facilitate access to healthcare in Africa, Asia, Latin America and the Caribbean. Considering that most development institutions and governments are currently attempting to integrate ICTs into their practices, it is an opportune time to reflect on the research findings that have emerged from IDRC’s work and research in this area.</p>'),(12,'en_US','prefix',''),(12,'en_US','subtitle',''),(12,'en_US','title','Connecting ICTs to Development'),(12,'fr_CA','abstract',''),(12,'fr_CA','prefix',''),(12,'fr_CA','subtitle',''),(12,'fr_CA','title',''),(13,'','categoryIds','[]'),(13,'en_US','abstract','<p>This collection is for anyone interested in the use of mobile technology for various distance learning applications. Readers will discover how to design learning materials for delivery on mobile technology and become familiar with the best practices of other educators, trainers, and researchers in the field, as well as the most recent initiatives in mobile learning research. Businesses and governments can learn how to deliver timely information to staff using mobile devices. Professors can use this book as a textbook for courses on distance education, mobile learning, and educational technology.</p>'),(13,'en_US','prefix',''),(13,'en_US','subtitle',''),(13,'en_US','title','Mobile Learning: Transforming the Delivery of Education and Training'),(13,'fr_CA','abstract',''),(13,'fr_CA','prefix',''),(13,'fr_CA','subtitle',''),(13,'fr_CA','title',''),(14,'','categoryIds','[]'),(14,'','copyrightYear','2026'),(14,'en_US','abstract','<p>From Bricks to Brains introduces embodied cognitive science, and illustrates its foundational ideas through the construction and observation of LEGO Mindstorms robots. Discussing the characteristics that distinguish embodied cognitive science from classical cognitive science, From Bricks to Brains places a renewed emphasis on sensing and acting, the importance of embodiment, the exploration of distributed notions of control, and the development of theories by synthesizing simple systems and exploring their behaviour. Numerous examples are used to illustrate a key theme: the importance of an agent’s environment. Even simple agents, such as LEGO robots, are capable of exhibiting complex behaviour when they can sense and affect the world around them.</p>'),(14,'en_US','copyrightHolder','Public Knowledge Press'),(14,'en_US','prefix',''),(14,'en_US','subtitle',''),(14,'en_US','title','From Bricks to Brains: The Embodied Cognitive Science of LEGO Robots'),(14,'fr_CA','abstract',''),(14,'fr_CA','copyrightHolder','Press de la connaissance du public'),(14,'fr_CA','prefix',''),(14,'fr_CA','subtitle',''),(14,'fr_CA','title',''),(15,'','categoryIds','[]'),(15,'en_US','abstract','<p>A groundbreaking study of urban sprawl in Calgary after the Second World War. The interactions of land developers and the local government influenced how the pattern grew: developers met market demands and optimized profits by building houses as efficiently as possible, while the City had to consider wider planning constraints and infrastructure costs. Foran examines the complexity of their interactions from a historical perspective, why each party acted as it did, and where each can be criticized.</p>'),(15,'en_US','prefix',''),(15,'en_US','subtitle',''),(15,'en_US','title','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978'),(15,'fr_CA','abstract',''),(15,'fr_CA','prefix',''),(15,'fr_CA','subtitle',''),(15,'fr_CA','title',''),(16,'','categoryIds','[]'),(16,'en_US','abstract','<p>Books and articles on instructional design in online learning abound but rarely do we get such a comprehensive picture of what instructional designers do, how they do it, and the problems they solve as their university changes. Power documents the emergence of an adapted instructional design model for transforming courses from single-mode to dual-mode instruction, making this designer’s log a unique contribution to the fi eld of online learning.</p>'),(16,'en_US','prefix',''),(16,'en_US','subtitle',''),(16,'en_US','title','A Designer\'s Log: Case Studies in Instructional Design'),(16,'fr_CA','abstract',''),(16,'fr_CA','prefix',''),(16,'fr_CA','subtitle',''),(16,'fr_CA','title',''),(17,'','categoryIds','[]'),(17,'en_US','abstract','<p>The emergence of open networked models made possible by digital technology has the potential to transform international development. Open network structures allow people to come together to share information, organize, and collaborate. Open development harnesses this power to create new organizational forms and improve people’s lives; it is not only an agenda for research and practice but also a statement about how to approach international development. In this volume, experts explore a variety of applications of openness, addressing challenges as well as opportunities.</p>'),(17,'en_US','prefix',''),(17,'en_US','subtitle',''),(17,'en_US','title','Open Development: Networked Innovations in International Development'),(17,'fr_CA','abstract',''),(17,'fr_CA','prefix',''),(17,'fr_CA','subtitle',''),(17,'fr_CA','title','');
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
  `locale` varchar(14) DEFAULT NULL,
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
  PRIMARY KEY (`publication_id`),
  KEY `publications_submission_id` (`submission_id`),
  KEY `publications_section_id` (`series_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,NULL,'2026-01-02 05:19:15',NULL,1,'pub','publication',0.00,NULL,NULL,1,1,NULL,1),(2,NULL,'2026-01-02 05:20:19',NULL,2,'pub','publication',0.00,NULL,NULL,2,1,NULL,1),(3,NULL,'2026-01-02 05:21:01',NULL,10,'pub','publication',0.00,NULL,NULL,3,1,NULL,1),(4,NULL,'2026-01-02 05:21:41',NULL,11,'pub','publication',0.00,3,NULL,4,1,NULL,1),(5,'2026-01-02','2026-01-02 05:23:28',NULL,15,'pub','publication',0.00,NULL,NULL,5,3,NULL,1),(6,NULL,'2026-01-02 05:24:06',NULL,16,'pub','publication',0.00,1,NULL,6,1,NULL,1),(7,NULL,'2026-01-02 05:25:19',NULL,20,'pub','publication',0.00,4,NULL,7,1,NULL,1),(8,NULL,'2026-01-02 05:25:47',NULL,25,'pub','publication',0.00,NULL,NULL,8,1,NULL,1),(9,NULL,'2026-01-02 05:26:36',NULL,26,'pub','publication',0.00,1,NULL,9,1,NULL,1),(10,NULL,'2026-01-02 05:27:26',NULL,31,'pub','publication',0.00,NULL,NULL,10,1,NULL,1),(11,NULL,'2026-01-02 05:27:41',NULL,32,'pub','publication',0.00,NULL,NULL,11,1,NULL,1),(12,NULL,'2026-01-02 05:29:07',NULL,33,'pub','publication',0.00,NULL,NULL,12,1,NULL,1),(13,NULL,'2026-01-02 05:30:10',NULL,41,'pub','publication',0.00,NULL,NULL,13,1,NULL,1),(14,'2026-01-02','2026-01-02 05:32:56',NULL,45,'pub','publication',0.00,5,NULL,14,3,NULL,1),(15,NULL,'2026-01-02 05:33:14',NULL,48,'pub','publication',0.00,NULL,NULL,15,1,NULL,1),(16,NULL,'2026-01-02 05:33:46',NULL,49,'pub','publication',0.00,NULL,NULL,16,1,NULL,1),(17,NULL,'2026-01-02 05:35:17',NULL,50,'pub','publication',0.00,NULL,NULL,17,1,NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
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
  `query_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  UNIQUE KEY `query_participants_pkey` (`query_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queued_payments` (
  `queued_payment_id` bigint NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `payment_data` text,
  PRIMARY KEY (`queued_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  KEY `format_representatives_pkey` (`representative_id`,`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `reviewer_file_id` bigint DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` smallint DEFAULT NULL,
  `review_round_id` bigint NOT NULL,
  `stage_id` smallint NOT NULL,
  `review_method` smallint NOT NULL DEFAULT '1',
  `round` smallint NOT NULL DEFAULT '1',
  `step` smallint NOT NULL DEFAULT '1',
  `review_form_id` bigint DEFAULT NULL,
  `unconsidered` smallint DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `review_assignments_submission_id` (`submission_id`),
  KEY `review_assignments_reviewer_id` (`reviewer_id`),
  KEY `review_assignments_form_id` (`review_form_id`),
  KEY `review_assignments_reviewer_review` (`reviewer_id`,`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignments`
--

LOCK TABLES `review_assignments` WRITE;
/*!40000 ALTER TABLE `review_assignments` DISABLE KEYS */;
INSERT INTO `review_assignments` VALUES (1,1,12,NULL,NULL,'2026-01-02 05:19:25','2026-01-02 05:19:25',NULL,NULL,NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:19:25',0,0,0,NULL,NULL,NULL,NULL,1,3,2,1,1,NULL,0),(2,2,11,NULL,NULL,'2026-01-02 05:20:31','2026-01-02 05:20:31',NULL,NULL,NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:20:31',0,0,0,NULL,NULL,NULL,NULL,2,3,2,1,1,NULL,0),(3,2,12,NULL,NULL,'2026-01-02 05:20:36','2026-01-02 05:20:36',NULL,NULL,NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:20:36',0,0,0,NULL,NULL,NULL,NULL,2,3,2,1,1,NULL,0),(4,4,9,NULL,NULL,'2026-01-02 05:21:53','2026-01-02 05:21:53',NULL,NULL,NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:21:53',0,0,0,NULL,NULL,NULL,NULL,3,2,2,1,1,NULL,0),(5,4,11,NULL,NULL,'2026-01-02 05:22:00','2026-01-02 05:22:00',NULL,NULL,NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:22:00',0,0,0,NULL,NULL,NULL,NULL,4,3,2,1,1,NULL,0),(6,5,8,NULL,NULL,'2026-01-02 05:22:54','2026-01-02 05:22:54',NULL,NULL,NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:22:54',0,0,0,NULL,NULL,NULL,NULL,5,2,2,1,1,NULL,0),(7,5,12,NULL,NULL,'2026-01-02 05:23:00','2026-01-02 05:23:00',NULL,NULL,NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:23:00',0,0,0,NULL,NULL,NULL,NULL,6,3,2,1,1,NULL,0),(8,7,10,NULL,NULL,'2026-01-02 05:25:33','2026-01-02 05:25:33',NULL,NULL,NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:25:33',0,0,0,NULL,NULL,NULL,NULL,8,3,2,1,1,NULL,0),(9,11,9,NULL,NULL,'2026-01-02 05:27:51','2026-01-02 05:27:51',NULL,NULL,NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:27:51',0,0,0,NULL,NULL,NULL,NULL,10,2,2,1,1,NULL,0),(10,11,10,NULL,0,'2026-01-02 05:27:57','2026-01-02 05:27:57','2026-01-02 05:28:04','2026-01-02 05:28:07',NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:28:07',0,0,0,NULL,NULL,NULL,0,11,3,2,1,4,NULL,0),(11,11,12,NULL,0,'2026-01-02 05:28:00','2026-01-02 05:28:00','2026-01-02 05:28:11','2026-01-02 05:28:15',NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:28:15',0,0,0,NULL,NULL,NULL,0,11,3,2,1,4,NULL,0),(12,12,7,NULL,NULL,'2026-01-02 05:29:21','2026-01-02 05:29:21',NULL,NULL,NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:29:21',0,0,0,NULL,NULL,NULL,NULL,12,2,2,1,1,NULL,0),(13,12,8,NULL,0,'2026-01-02 05:29:25','2026-01-02 05:29:25','2026-01-02 05:29:35','2026-01-02 05:29:38',NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:29:38',0,0,0,NULL,NULL,NULL,0,12,2,2,1,4,NULL,0),(14,12,9,NULL,NULL,'2026-01-02 05:29:29','2026-01-02 05:29:29',NULL,NULL,NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:29:29',0,0,0,NULL,NULL,NULL,NULL,12,2,2,1,1,NULL,0),(15,13,8,NULL,NULL,'2026-01-02 05:30:22','2026-01-02 05:30:22',NULL,NULL,NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:30:22',0,0,0,NULL,NULL,NULL,NULL,13,2,2,1,1,NULL,0),(16,13,10,NULL,0,'2026-01-02 05:30:29','2026-01-02 05:30:29','2026-01-02 05:30:43','2026-01-02 05:30:46',NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:30:46',0,0,0,NULL,NULL,NULL,0,14,3,2,1,4,NULL,0),(17,13,11,NULL,NULL,'2026-01-02 05:30:34','2026-01-02 05:30:34',NULL,NULL,NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:30:34',0,0,0,NULL,NULL,NULL,NULL,14,3,2,1,1,NULL,0),(18,13,12,NULL,0,'2026-01-02 05:30:38','2026-01-02 05:30:38','2026-01-02 05:30:51','2026-01-02 05:30:54',NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:30:54',0,0,0,NULL,NULL,NULL,0,14,3,2,1,4,NULL,0),(19,14,7,NULL,NULL,'2026-01-02 05:31:57','2026-01-02 05:31:57',NULL,NULL,NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:31:57',0,0,0,NULL,NULL,NULL,NULL,15,2,2,1,1,NULL,0),(20,14,11,NULL,NULL,'2026-01-02 05:32:04','2026-01-02 05:32:04',NULL,NULL,NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:32:04',0,0,0,NULL,NULL,NULL,NULL,16,3,2,1,1,NULL,0),(21,16,10,NULL,0,'2026-01-02 05:33:57','2026-01-02 05:33:57','2026-01-02 05:34:09','2026-01-02 05:34:12',NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:34:12',0,0,0,NULL,NULL,NULL,0,18,3,2,1,4,NULL,0),(22,16,11,NULL,NULL,'2026-01-02 05:34:01','2026-01-02 05:34:01',NULL,NULL,NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:34:01',0,0,0,NULL,NULL,NULL,NULL,18,3,2,1,1,NULL,0),(23,16,12,NULL,NULL,'2026-01-02 05:34:05','2026-01-02 05:34:05',NULL,NULL,NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:34:05',0,0,0,NULL,NULL,NULL,NULL,18,3,2,1,1,NULL,0),(24,17,7,NULL,NULL,'2026-01-02 05:35:34','2026-01-02 05:35:34',NULL,NULL,NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:35:34',0,0,0,NULL,NULL,NULL,NULL,19,2,2,1,1,NULL,0),(25,17,8,NULL,NULL,'2026-01-02 05:35:39','2026-01-02 05:35:39',NULL,NULL,NULL,'2026-01-30 00:00:00','2026-01-30 00:00:00','2026-01-02 05:35:39',0,0,0,NULL,NULL,NULL,NULL,19,2,2,1,1,NULL,0);
/*!40000 ALTER TABLE `review_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_files`
--

DROP TABLE IF EXISTS `review_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_files` (
  `review_id` bigint NOT NULL,
  `submission_file_id` bigint unsigned NOT NULL,
  UNIQUE KEY `review_files_pkey` (`review_id`,`submission_file_id`),
  KEY `review_files_review_id` (`review_id`),
  KEY `review_files_submission_file_id_foreign` (`submission_file_id`),
  CONSTRAINT `review_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_files`
--

LOCK TABLES `review_files` WRITE;
/*!40000 ALTER TABLE `review_files` DISABLE KEYS */;
INSERT INTO `review_files` VALUES (1,2),(2,7),(2,8),(2,9),(2,10),(3,7),(3,8),(3,9),(3,10),(4,16),(4,17),(4,18),(4,19),(6,21),(8,36),(8,37),(8,38),(8,39),(8,40),(9,54),(15,61),(15,62),(15,63),(19,70),(19,71),(19,72),(19,73),(19,74),(19,75),(21,85),(22,85),(23,85),(24,92),(24,93),(24,94),(24,95),(24,96),(24,97),(25,92),(25,93),(25,94),(25,95),(25,96),(25,97);
/*!40000 ALTER TABLE `review_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_element_settings`
--

DROP TABLE IF EXISTS `review_form_element_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_element_settings` (
  `review_form_element_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_element_settings_pkey` (`review_form_element_id`,`locale`,`setting_name`),
  KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  KEY `review_form_elements_review_form_id` (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `review_form_element_id` bigint NOT NULL,
  `review_id` bigint NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text,
  KEY `review_form_responses_pkey` (`review_form_element_id`,`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `review_form_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_settings_pkey` (`review_form_id`,`locale`,`setting_name`),
  KEY `review_form_settings_review_form_id` (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `submission_id` bigint NOT NULL,
  `review_round_id` bigint NOT NULL,
  `stage_id` smallint NOT NULL,
  `submission_file_id` bigint unsigned NOT NULL,
  UNIQUE KEY `review_round_files_pkey` (`submission_id`,`review_round_id`,`submission_file_id`),
  KEY `review_round_files_submission_id` (`submission_id`),
  KEY `review_round_files_submission_file_id_foreign` (`submission_file_id`),
  CONSTRAINT `review_round_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_round_files`
--

LOCK TABLES `review_round_files` WRITE;
/*!40000 ALTER TABLE `review_round_files` DISABLE KEYS */;
INSERT INTO `review_round_files` VALUES (1,1,3,2),(2,2,3,7),(2,2,3,8),(2,2,3,9),(2,2,3,10),(4,3,2,16),(4,3,2,17),(4,3,2,18),(4,3,2,19),(5,5,2,21),(6,7,2,27),(6,7,2,28),(6,7,2,29),(6,7,2,30),(7,8,3,36),(7,8,3,37),(7,8,3,38),(7,8,3,39),(7,8,3,40),(9,9,2,47),(9,9,2,48),(9,9,2,49),(9,9,2,50),(9,9,2,51),(11,10,2,54),(13,13,2,61),(13,13,2,62),(13,13,2,63),(14,15,2,70),(14,15,2,71),(14,15,2,72),(14,15,2,73),(14,15,2,74),(14,15,2,75),(15,17,3,83),(16,18,3,85),(17,19,2,92),(17,19,2,93),(17,19,2,94),(17,19,2,95),(17,19,2,96),(17,19,2,97);
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
  KEY `review_rounds_submission_id` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
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
  KEY `format_sales_rights_pkey` (`sales_rights_id`,`publication_format_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `class_name` varchar(255) NOT NULL,
  `last_run` datetime DEFAULT NULL,
  UNIQUE KEY `scheduled_tasks_pkey` (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_tasks`
--

LOCK TABLES `scheduled_tasks` WRITE;
/*!40000 ALTER TABLE `scheduled_tasks` DISABLE KEYS */;
INSERT INTO `scheduled_tasks` VALUES ('lib.pkp.classes.task.PublishSubmissions','2026-01-02 05:15:55'),('lib.pkp.classes.task.ReviewReminder','2026-01-02 05:15:55'),('lib.pkp.classes.task.StatisticsReport','2026-01-02 05:15:55'),('plugins.generic.usageStats.UsageStatsLoader','2026-01-02 05:15:55');
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
  KEY `series_press_id` (`press_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series_categories` (
  `series_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  UNIQUE KEY `series_categories_id` (`series_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `series_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `series_settings_pkey` (`series_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series_settings`
--

LOCK TABLES `series_settings` WRITE;
/*!40000 ALTER TABLE `series_settings` DISABLE KEYS */;
INSERT INTO `series_settings` VALUES (1,'','onlineIssn','','string'),(1,'','printIssn','','string'),(1,'','sortOption','title-1','string'),(1,'en_US','description','','string'),(1,'en_US','prefix','','string'),(1,'en_US','subtitle','','string'),(1,'en_US','title','Library & Information Studies','string'),(1,'fr_CA','description','','string'),(1,'fr_CA','prefix','','string'),(1,'fr_CA','subtitle','','string'),(1,'fr_CA','title','','string'),(2,'','onlineIssn','','string'),(2,'','printIssn','','string'),(2,'','sortOption','title-1','string'),(2,'en_US','description','','string'),(2,'en_US','prefix','','string'),(2,'en_US','subtitle','','string'),(2,'en_US','title','Political Economy','string'),(2,'fr_CA','description','','string'),(2,'fr_CA','prefix','','string'),(2,'fr_CA','subtitle','','string'),(2,'fr_CA','title','','string'),(3,'','onlineIssn','','string'),(3,'','printIssn','','string'),(3,'','sortOption','title-1','string'),(3,'en_US','description','','string'),(3,'en_US','prefix','','string'),(3,'en_US','subtitle','','string'),(3,'en_US','title','History','string'),(3,'fr_CA','description','','string'),(3,'fr_CA','prefix','','string'),(3,'fr_CA','subtitle','','string'),(3,'fr_CA','title','','string'),(4,'','onlineIssn','','string'),(4,'','printIssn','','string'),(4,'','sortOption','title-1','string'),(4,'en_US','description','','string'),(4,'en_US','prefix','','string'),(4,'en_US','subtitle','','string'),(4,'en_US','title','Education','string'),(4,'fr_CA','description','','string'),(4,'fr_CA','prefix','','string'),(4,'fr_CA','subtitle','','string'),(4,'fr_CA','title','','string'),(5,'','onlineIssn','','string'),(5,'','printIssn','','string'),(5,'','sortOption','title-1','string'),(5,'en_US','description','','string'),(5,'en_US','prefix','','string'),(5,'en_US','subtitle','','string'),(5,'en_US','title','Psychology','string'),(5,'fr_CA','description','','string'),(5,'fr_CA','prefix','','string'),(5,'fr_CA','subtitle','','string'),(5,'fr_CA','title','','string');
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
  KEY `sessions_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('0b4gdqap0r8gp3kvtdr6e9bg7b',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767330968,1767330978,1,'csrf|a:2:{s:9:\"timestamp\";i:1767330978;s:5:\"token\";s:32:\"018f6b15c5e47ae92d83f89327ca109f\";}userId|i:1;username|s:5:\"admin\";','localhost'),('0ldoo9k24ptbu9b2meq4aco6c2',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767331336,1767331408,1,'csrf|a:2:{s:9:\"timestamp\";i:1767331408;s:5:\"token\";s:32:\"c9473d7c777aee0210d8cbc1f1126188\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('1mlrvi7kmjifjl9bhf5ua4a9ge',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767330953,1767330953,0,'','localhost'),('2gpauf4sbd3q9l9msf1cq8hlfm',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767331263,1767331335,1,'csrf|a:2:{s:9:\"timestamp\";i:1767331335;s:5:\"token\";s:32:\"b33d2bcff6da2e2a72d1aeab88b239a3\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('2vj5tau3u91v1mpc1okvcurelp',27,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767331607,1767331647,0,'csrf|a:2:{s:9:\"timestamp\";i:1767331647;s:5:\"token\";s:32:\"e0c5e12fe163bb13b3bc4a2a93b603df\";}username|s:7:\"jbrower\";userId|i:27;','localhost'),('36ku7jdsl8uimp5a0bk7ppsgb5',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767331138,1767331170,1,'csrf|a:2:{s:9:\"timestamp\";i:1767331170;s:5:\"token\";s:32:\"4a7add5eb4ffcf70f5cafc76ab1ef676\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('43ksfiuuj11vhvdb6a3l6p9qbt',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767331472,1767331540,1,'csrf|a:2:{s:9:\"timestamp\";i:1767331540;s:5:\"token\";s:32:\"ff13662835b23de8569bda7361e23b85\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('46r5h9220c2mn4qbbinmf9lotn',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767331648,1767331704,0,'csrf|a:2:{s:9:\"timestamp\";i:1767331704;s:5:\"token\";s:32:\"911fcfe454edc28ad0249c4dcdb4c31e\";}username|s:7:\"dbarnes\";','localhost'),('64947968jiu6ko8nolqlt5d041',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767330983,1767330989,1,'csrf|a:2:{s:9:\"timestamp\";i:1767330989;s:5:\"token\";s:32:\"29a876df752497f3275ad78d807e96c6\";}userId|i:1;username|s:5:\"admin\";','localhost'),('760kb9ljh2j9fcuu70aaf03bem',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767332054,1767332139,1,'csrf|a:2:{s:9:\"timestamp\";i:1767332139;s:5:\"token\";s:32:\"d32d75b597adbf7d53c1b601e725a5cf\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('bakn88e5b8fran5llah2k49i5p',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767331409,1767331470,1,'csrf|a:2:{s:9:\"timestamp\";i:1767331470;s:5:\"token\";s:32:\"a6e32a46f137e6dc35a06d8803a9baa5\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('d15e26b7nrnrpf03rvuvlaq68k',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767330994,1767331122,0,'csrf|a:2:{s:9:\"timestamp\";i:1767331122;s:5:\"token\";s:32:\"02e3d09c3dedcfe2092fec292324141d\";}username|s:5:\"rvaca\";','localhost'),('ed7tnu8ede04abtj5sij2sdddr',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767331124,1767331137,1,'csrf|a:2:{s:9:\"timestamp\";i:1767331137;s:5:\"token\";s:32:\"e01430a224b993a37c3f144953d88588\";}userId|i:1;username|s:5:\"admin\";','localhost'),('g1pi25h6g7f044129ue6ec7qf8',21,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767331238,1767331262,0,'csrf|a:2:{s:9:\"timestamp\";i:1767331262;s:5:\"token\";s:32:\"1d9ed184e4c9e90c2eea3afe7cc5509d\";}username|s:10:\"bbarnetson\";userId|i:21;','localhost'),('g2q2hvqkr7dobnsshb3a59migv',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767331780,1767331866,1,'csrf|a:2:{s:9:\"timestamp\";i:1767331866;s:5:\"token\";s:32:\"023ca55a6a10d27d11b1cf2a4565d83a\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('i8etie4rl7r1v7ularcloeqdqf',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767331542,1767331548,1,'csrf|a:2:{s:9:\"timestamp\";i:1767331548;s:5:\"token\";s:32:\"9a856c132554e690a22d654ffd025a7d\";}userId|i:3;username|s:7:\"dbarnes\";','localhost'),('ld7l2eo95o73j7shu1ppv79jgb',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767331549,1767331606,1,'csrf|a:2:{s:9:\"timestamp\";i:1767331606;s:5:\"token\";s:32:\"95fde44092f70ab21343c9d6fc3daf70\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('llg25ln9tpvivu5ulgehi665no',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767330978,1767330983,1,'csrf|a:2:{s:9:\"timestamp\";i:1767330983;s:5:\"token\";s:32:\"d0f2f57d3b2ba57451d1a87d821be7d0\";}userId|i:1;username|s:5:\"admin\";','localhost'),('os3e04qm6dkkv6so4chk7el93a',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767330989,1767330992,1,'csrf|a:2:{s:9:\"timestamp\";i:1767330992;s:5:\"token\";s:32:\"b8fd73511089e84e4cb84b029d51855e\";}userId|i:1;username|s:5:\"admin\";','localhost'),('otgtat7ofauicovc0pb48gjhqb',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767332003,1767332053,0,'csrf|a:2:{s:9:\"timestamp\";i:1767332053;s:5:\"token\";s:32:\"a664b63cf8cabd06f21d42253bffe1ef\";}username|s:8:\"agallego\";','localhost'),('p2ettdbjfg3bqbubna1eqf5btp',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767331977,1767332002,1,'csrf|a:2:{s:9:\"timestamp\";i:1767332002;s:5:\"token\";s:32:\"c63e09096cc1f71ea269f280f7282dd2\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('pbsbcnj31a3ug17auba8n9iek3',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767330955,1767330967,1,'csrf|a:2:{s:9:\"timestamp\";i:1767330967;s:5:\"token\";s:32:\"ebb4494638741cc38e8b21b079916665\";}userId|i:1;username|s:5:\"admin\";','localhost'),('q52ekj8g3aqof5h907f2g80jai',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767331705,1767331779,0,'csrf|a:2:{s:9:\"timestamp\";i:1767331779;s:5:\"token\";s:32:\"cd65b36af6f4c7de161a95c94efe78a3\";}username|s:7:\"phudson\";','localhost'),('rosfok9brknne84m05744n0o9k',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767331867,1767331977,1,'csrf|a:2:{s:9:\"timestamp\";i:1767331977;s:5:\"token\";s:32:\"74b72aa965a66f8c01aa894f7ccc163d\";}username|s:7:\"dbarnes\";userId|i:3;','localhost'),('u41qurb6ndbc7dtji9ovfcb5ai',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.0.0 Safari/537.36',1767331171,1767331236,1,'csrf|a:2:{s:9:\"timestamp\";i:1767331236;s:5:\"token\";s:32:\"dd16ecf2e135d4ae3f21b6f3793f605b\";}username|s:7:\"dbarnes\";userId|i:3;','localhost');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site` (
  `redirect` bigint NOT NULL DEFAULT '0' COMMENT 'If not 0, redirect to the specified journal/conference/... site.',
  `primary_locale` varchar(14) NOT NULL COMMENT 'Primary locale for the site.',
  `min_password_length` smallint NOT NULL DEFAULT '6',
  `installed_locales` varchar(1024) NOT NULL DEFAULT 'en_US' COMMENT 'Locales for which support has been installed.',
  `supported_locales` varchar(1024) DEFAULT NULL COMMENT 'Locales supported by the site (for hosted journals/conferences/...).',
  `original_style_file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_settings` (
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_value` text,
  UNIQUE KEY `site_settings_pkey` (`setting_name`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spotlight_settings` (
  `spotlight_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)',
  UNIQUE KEY `spotlight_settings_pkey` (`spotlight_id`,`locale`,`setting_name`),
  KEY `spotlight_settings_id` (`spotlight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  KEY `spotlights_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  KEY `stage_assignments_submission_id` (`submission_id`),
  KEY `stage_assignments_user_group_id` (`user_group_id`),
  KEY `stage_assignments_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES (1,1,13,19,'2026-01-02 05:19:03',0,0),(2,1,3,3,'2026-01-02 05:19:15',0,1),(3,1,6,14,'2026-01-02 05:19:29',0,0),(4,2,14,20,'2026-01-02 05:19:35',0,0),(5,2,3,3,'2026-01-02 05:20:20',0,1),(6,3,13,21,'2026-01-02 05:20:42',0,0),(7,3,3,3,'2026-01-02 05:21:02',0,1),(8,4,14,22,'2026-01-02 05:21:08',0,0),(9,4,3,3,'2026-01-02 05:21:42',0,1),(10,4,6,13,'2026-01-02 05:22:07',0,0),(11,4,10,15,'2026-01-02 05:22:14',0,0),(12,5,13,23,'2026-01-02 05:22:20',0,0),(13,5,3,3,'2026-01-02 05:22:44',0,1),(14,5,6,14,'2026-01-02 05:23:06',0,0),(15,5,10,16,'2026-01-02 05:23:12',0,0),(16,5,12,17,'2026-01-02 05:23:15',0,0),(17,6,14,24,'2026-01-02 05:23:34',0,0),(18,6,3,3,'2026-01-02 05:24:07',0,1),(19,6,5,4,'2026-01-02 05:24:07',0,1),(20,6,5,6,'2026-01-02 05:24:17',1,1),(21,7,14,25,'2026-01-02 05:24:36',0,0),(22,7,3,3,'2026-01-02 05:25:20',0,1),(23,7,6,13,'2026-01-02 05:25:40',0,0),(24,8,13,3,'2026-01-02 05:25:45',0,0),(25,8,3,3,'2026-01-02 05:25:48',0,1),(26,9,14,26,'2026-01-02 05:25:53',0,0),(27,9,3,3,'2026-01-02 05:26:37',0,1),(28,9,5,4,'2026-01-02 05:26:37',0,1),(29,10,13,27,'2026-01-02 05:26:51',0,0),(30,10,3,3,'2026-01-02 05:27:27',0,1),(31,11,13,28,'2026-01-02 05:27:33',0,0),(32,11,3,3,'2026-01-02 05:27:42',0,1),(33,12,14,29,'2026-01-02 05:28:30',0,0),(34,12,3,3,'2026-01-02 05:29:08',0,1),(35,13,14,30,'2026-01-02 05:29:44',0,0),(36,13,3,3,'2026-01-02 05:30:10',0,1),(37,14,14,31,'2026-01-02 05:31:11',0,0),(38,14,3,3,'2026-01-02 05:31:44',0,1),(39,14,6,13,'2026-01-02 05:32:10',0,0),(40,14,10,15,'2026-01-02 05:32:17',0,0),(41,14,12,18,'2026-01-02 05:32:21',0,0),(42,15,13,32,'2026-01-02 05:33:01',0,0),(43,15,3,3,'2026-01-02 05:33:14',0,1),(44,16,13,33,'2026-01-02 05:33:27',0,0),(45,16,3,3,'2026-01-02 05:33:46',0,1),(46,17,14,34,'2026-01-02 05:34:18',0,0),(47,17,3,3,'2026-01-02 05:35:18',0,1);
/*!40000 ALTER TABLE `stage_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_page_settings`
--

DROP TABLE IF EXISTS `static_page_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `static_page_settings` (
  `static_page_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `static_page_settings_pkey` (`static_page_id`,`locale`,`setting_name`),
  KEY `static_page_settings_static_page_id` (`static_page_id`)
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
  PRIMARY KEY (`static_page_id`)
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
  `context_id` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `assoc_type` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  UNIQUE KEY `section_editors_pkey` (`context_id`,`assoc_id`,`assoc_type`,`user_id`),
  KEY `section_editors_context_id` (`context_id`),
  KEY `subeditor_submission_group_assoc_id` (`assoc_id`,`assoc_type`),
  KEY `subeditor_submission_group_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_chapter_authors` (
  `author_id` bigint NOT NULL,
  `chapter_id` bigint NOT NULL,
  `primary_contact` smallint NOT NULL DEFAULT '0',
  `seq` double(8,2) NOT NULL DEFAULT '0.00',
  UNIQUE KEY `chapter_authors_pkey` (`author_id`,`chapter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_chapter_settings` (
  `chapter_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `submission_chapter_settings_pkey` (`chapter_id`,`locale`,`setting_name`),
  KEY `submission_chapter_settings_chapter_id` (`chapter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_chapter_settings`
--

LOCK TABLES `submission_chapter_settings` WRITE;
/*!40000 ALTER TABLE `submission_chapter_settings` DISABLE KEYS */;
INSERT INTO `submission_chapter_settings` VALUES (1,'','pages','','string'),(1,'en_US','abstract','','string'),(1,'en_US','subtitle','','string'),(1,'en_US','title','Choosing the Future','string'),(1,'fr_CA','abstract','','string'),(1,'fr_CA','subtitle','','string'),(1,'fr_CA','title','','string'),(2,'','pages','','string'),(2,'en_US','abstract','','string'),(2,'en_US','subtitle','','string'),(2,'en_US','title','Axioms','string'),(2,'fr_CA','abstract','','string'),(2,'fr_CA','subtitle','','string'),(2,'fr_CA','title','','string'),(3,'','pages','','string'),(3,'en_US','abstract','','string'),(3,'en_US','subtitle','','string'),(3,'en_US','title','Paradigm Shift','string'),(3,'fr_CA','abstract','','string'),(3,'fr_CA','subtitle','','string'),(3,'fr_CA','title','','string'),(4,'','pages','','string'),(4,'en_US','abstract','','string'),(4,'en_US','subtitle','','string'),(4,'en_US','title','Critical History in Western Canada 1900–2000','string'),(4,'fr_CA','abstract','','string'),(4,'fr_CA','subtitle','','string'),(4,'fr_CA','title','','string'),(5,'','pages','','string'),(5,'en_US','abstract','','string'),(5,'en_US','subtitle','','string'),(5,'en_US','title','Vernacular Currents in Western Canadian Historiography: The Passion and Prose of Katherine Hughes, F.G. Roe, and Roy Ito','string'),(5,'fr_CA','abstract','','string'),(5,'fr_CA','subtitle','','string'),(5,'fr_CA','title','','string'),(6,'','pages','','string'),(6,'en_US','abstract','','string'),(6,'en_US','subtitle','','string'),(6,'en_US','title','Cree Intellectual Traditions in History','string'),(6,'fr_CA','abstract','','string'),(6,'fr_CA','subtitle','','string'),(6,'fr_CA','title','','string'),(7,'','pages','','string'),(7,'en_US','abstract','','string'),(7,'en_US','subtitle','','string'),(7,'en_US','title','Visualizing Space, Race, and History in the North: Photographic Narratives of the Athabasca-Mackenzie River Basin','string'),(7,'fr_CA','abstract','','string'),(7,'fr_CA','subtitle','','string'),(7,'fr_CA','title','','string'),(8,'','pages','','string'),(8,'en_US','abstract','','string'),(8,'en_US','subtitle','','string'),(8,'en_US','title','Introduction','string'),(8,'fr_CA','abstract','','string'),(8,'fr_CA','subtitle','','string'),(8,'fr_CA','title','','string'),(9,'','pages','','string'),(9,'en_US','abstract','','string'),(9,'en_US','subtitle','','string'),(9,'en_US','title','Part One. Employment Relationships in Canada','string'),(9,'fr_CA','abstract','','string'),(9,'fr_CA','subtitle','','string'),(9,'fr_CA','title','','string'),(10,'','pages','','string'),(10,'en_US','abstract','','string'),(10,'en_US','subtitle','','string'),(10,'en_US','title','Part Two. Preventing Workplace Injury','string'),(10,'fr_CA','abstract','','string'),(10,'fr_CA','subtitle','','string'),(10,'fr_CA','title','','string'),(11,'','pages','','string'),(11,'en_US','abstract','','string'),(11,'en_US','subtitle','','string'),(11,'en_US','title','Part Three. Critique of OHS in Canada','string'),(11,'fr_CA','abstract','','string'),(11,'fr_CA','subtitle','','string'),(11,'fr_CA','title','','string'),(12,'','pages','','string'),(12,'en_US','abstract','','string'),(12,'en_US','subtitle','','string'),(12,'en_US','title','Part Four. Political Economy of Preventing Workplace Injury','string'),(12,'fr_CA','abstract','','string'),(12,'fr_CA','subtitle','','string'),(12,'fr_CA','title','','string'),(13,'','pages','','string'),(13,'en_US','abstract','','string'),(13,'en_US','subtitle','','string'),(13,'en_US','title','Introduction: Contexts of Popular Culture','string'),(13,'fr_CA','abstract','','string'),(13,'fr_CA','subtitle','','string'),(13,'fr_CA','title','','string'),(14,'','pages','','string'),(14,'en_US','abstract','','string'),(14,'en_US','subtitle','','string'),(14,'en_US','title','Chapter 1. A Future for Media Studies: Cultural Labour, Cultural Relations, Cultural Politics','string'),(14,'fr_CA','abstract','','string'),(14,'fr_CA','subtitle','','string'),(14,'fr_CA','title','','string'),(15,'','pages','','string'),(15,'en_US','abstract','','string'),(15,'en_US','subtitle','','string'),(15,'en_US','title','Chapter 2. Log On, Goof Off, and Look Up: Facebook and the Rhythms of Canadian Internet Use','string'),(15,'fr_CA','abstract','','string'),(15,'fr_CA','subtitle','','string'),(15,'fr_CA','title','','string'),(16,'','pages','','string'),(16,'en_US','abstract','','string'),(16,'en_US','subtitle','','string'),(16,'en_US','title','Chapter 3. Hawkers and Public Space: Free Commuter Newspapers in Canada','string'),(16,'fr_CA','abstract','','string'),(16,'fr_CA','subtitle','','string'),(16,'fr_CA','title','','string'),(17,'','pages','','string'),(17,'en_US','abstract','','string'),(17,'en_US','subtitle','','string'),(17,'en_US','title','Prologue','string'),(17,'fr_CA','abstract','','string'),(17,'fr_CA','subtitle','','string'),(17,'fr_CA','title','','string'),(18,'','pages','','string'),(18,'en_US','abstract','','string'),(18,'en_US','subtitle','','string'),(18,'en_US','title','Chapter 1: The First Five Years: 1867-1872','string'),(18,'fr_CA','abstract','','string'),(18,'fr_CA','subtitle','','string'),(18,'fr_CA','title','','string'),(19,'','pages','','string'),(19,'en_US','abstract','','string'),(19,'en_US','subtitle','','string'),(19,'en_US','title','Chapter 2: Free Trade or \"Freedom\": 1911','string'),(19,'fr_CA','abstract','','string'),(19,'fr_CA','subtitle','','string'),(19,'fr_CA','title','','string'),(20,'','pages','','string'),(20,'en_US','abstract','','string'),(20,'en_US','subtitle','','string'),(20,'en_US','title','Chapter 3: Castro, Nukes & the Cold War: 1953-1968','string'),(20,'fr_CA','abstract','','string'),(20,'fr_CA','subtitle','','string'),(20,'fr_CA','title','','string'),(21,'','pages','','string'),(21,'en_US','abstract','','string'),(21,'en_US','subtitle','','string'),(21,'en_US','title','Chapter 4: Enter the Intellect: 1968-1984','string'),(21,'fr_CA','abstract','','string'),(21,'fr_CA','subtitle','','string'),(21,'fr_CA','title','','string'),(22,'','pages','','string'),(22,'en_US','abstract','','string'),(22,'en_US','subtitle','','string'),(22,'en_US','title','Epilogue','string'),(22,'fr_CA','abstract','','string'),(22,'fr_CA','subtitle','','string'),(22,'fr_CA','title','','string'),(23,'','pages','','string'),(23,'en_US','abstract','','string'),(23,'en_US','subtitle','','string'),(23,'en_US','title','Identify: Understanding Your Information Need','string'),(23,'fr_CA','abstract','','string'),(23,'fr_CA','subtitle','','string'),(23,'fr_CA','title','','string'),(24,'','pages','','string'),(24,'en_US','abstract','','string'),(24,'en_US','subtitle','','string'),(24,'en_US','title','Scope: Knowing What Is Available','string'),(24,'fr_CA','abstract','','string'),(24,'fr_CA','subtitle','','string'),(24,'fr_CA','title','','string'),(25,'','pages','','string'),(25,'en_US','abstract','','string'),(25,'en_US','subtitle','','string'),(25,'en_US','title','Plan: Developing Research Strategies','string'),(25,'fr_CA','abstract','','string'),(25,'fr_CA','subtitle','','string'),(25,'fr_CA','title','','string'),(26,'','pages','','string'),(26,'en_US','abstract','','string'),(26,'en_US','subtitle','','string'),(26,'en_US','title','Gather: Finding What You Need','string'),(26,'fr_CA','abstract','','string'),(26,'fr_CA','subtitle','','string'),(26,'fr_CA','title','','string'),(27,'','pages','','string'),(27,'en_US','abstract','','string'),(27,'en_US','subtitle','','string'),(27,'en_US','title','Introduction','string'),(27,'fr_CA','abstract','','string'),(27,'fr_CA','subtitle','','string'),(27,'fr_CA','title','','string'),(28,'','pages','','string'),(28,'en_US','abstract','','string'),(28,'en_US','subtitle','','string'),(28,'en_US','title','Chapter 1: Interactions Affording Distance Science Education','string'),(28,'fr_CA','abstract','','string'),(28,'fr_CA','subtitle','','string'),(28,'fr_CA','title','','string'),(29,'','pages','','string'),(29,'en_US','abstract','','string'),(29,'en_US','subtitle','','string'),(29,'en_US','title','Chapter 2: Learning Science at a Distance: Instructional Dialogues and Resources','string'),(29,'fr_CA','abstract','','string'),(29,'fr_CA','subtitle','','string'),(29,'fr_CA','title','','string'),(30,'','pages','','string'),(30,'en_US','abstract','','string'),(30,'en_US','subtitle','','string'),(30,'en_US','title','Chapter 3: Leadership Strategies for Coordinating Distance Education Instructional Development Teams','string'),(30,'fr_CA','abstract','','string'),(30,'fr_CA','subtitle','','string'),(30,'fr_CA','title','','string'),(31,'','pages','','string'),(31,'en_US','abstract','','string'),(31,'en_US','subtitle','','string'),(31,'en_US','title','Chapter 4: Toward New Models of Flexible Education to Enhance Quality in Australian Higher Education','string'),(31,'fr_CA','abstract','','string'),(31,'fr_CA','subtitle','','string'),(31,'fr_CA','title','','string'),(32,'','pages','','string'),(32,'en_US','abstract','','string'),(32,'en_US','subtitle','','string'),(32,'en_US','title','Internet, openness and the future of the information society in LAC','string'),(32,'fr_CA','abstract','','string'),(32,'fr_CA','subtitle','','string'),(32,'fr_CA','title','','string'),(33,'','pages','','string'),(33,'en_US','abstract','','string'),(33,'en_US','subtitle','','string'),(33,'en_US','title','Imagining the Internet: Open, closed or in between?','string'),(33,'fr_CA','abstract','','string'),(33,'fr_CA','subtitle','','string'),(33,'fr_CA','title','','string'),(34,'','pages','','string'),(34,'en_US','abstract','','string'),(34,'en_US','subtitle','','string'),(34,'en_US','title','The internet in LAC will remain free, public and open over the next 10 years','string'),(34,'fr_CA','abstract','','string'),(34,'fr_CA','subtitle','','string'),(34,'fr_CA','title','','string'),(35,'','pages','','string'),(35,'en_US','abstract','','string'),(35,'en_US','subtitle','','string'),(35,'en_US','title','Free Internet?','string'),(35,'fr_CA','abstract','','string'),(35,'fr_CA','subtitle','','string'),(35,'fr_CA','title','','string'),(36,'','pages','','string'),(36,'en_US','abstract','','string'),(36,'en_US','subtitle','','string'),(36,'en_US','title','Risks and challenges for freedom of expression on the internet','string'),(36,'fr_CA','abstract','','string'),(36,'fr_CA','subtitle','','string'),(36,'fr_CA','title','','string'),(37,'','pages','','string'),(37,'en_US','abstract','','string'),(37,'en_US','subtitle','','string'),(37,'en_US','title','Introduction','string'),(37,'fr_CA','abstract','','string'),(37,'fr_CA','subtitle','','string'),(37,'fr_CA','title','','string'),(38,'','pages','','string'),(38,'en_US','abstract','','string'),(38,'en_US','subtitle','','string'),(38,'en_US','title','CHAPTER ONE: Where the Buffalo Roamed','string'),(38,'fr_CA','abstract','','string'),(38,'fr_CA','subtitle','','string'),(38,'fr_CA','title','','string'),(39,'','pages','','string'),(39,'en_US','abstract','','string'),(39,'en_US','subtitle','','string'),(39,'en_US','title','CHAPTER TWO: Bison Conservation and Buffalo National Park','string'),(39,'fr_CA','abstract','','string'),(39,'fr_CA','subtitle','','string'),(39,'fr_CA','title','','string'),(40,'','pages','','string'),(40,'en_US','abstract','','string'),(40,'en_US','subtitle','','string'),(40,'en_US','title','CHAPTER THREE: A Well-Run Ranch','string'),(40,'fr_CA','abstract','','string'),(40,'fr_CA','subtitle','','string'),(40,'fr_CA','title','','string'),(41,'','pages','','string'),(41,'en_US','abstract','','string'),(41,'en_US','subtitle','','string'),(41,'en_US','title','CHAPTER FOUR: Zookeepers and Animal Breeders','string'),(41,'fr_CA','abstract','','string'),(41,'fr_CA','subtitle','','string'),(41,'fr_CA','title','','string'),(42,'','pages','','string'),(42,'en_US','abstract','','string'),(42,'en_US','subtitle','','string'),(42,'en_US','title','CHAPTER FIVE: \"Evolving the Arctic Cow\"','string'),(42,'fr_CA','abstract','','string'),(42,'fr_CA','subtitle','','string'),(42,'fr_CA','title','','string'),(43,'','pages','','string'),(43,'en_US','abstract','','string'),(43,'en_US','subtitle','','string'),(43,'en_US','title','CONCLUSION: The Forgotten Park','string'),(43,'fr_CA','abstract','','string'),(43,'fr_CA','subtitle','','string'),(43,'fr_CA','title','','string'),(44,'','pages','','string'),(44,'en_US','abstract','','string'),(44,'en_US','subtitle','','string'),(44,'en_US','title','Bibliography','string'),(44,'fr_CA','abstract','','string'),(44,'fr_CA','subtitle','','string'),(44,'fr_CA','title','','string'),(45,'','pages','','string'),(45,'en_US','abstract','','string'),(45,'en_US','subtitle','','string'),(45,'en_US','title','Index','string'),(45,'fr_CA','abstract','','string'),(45,'fr_CA','subtitle','','string'),(45,'fr_CA','title','','string'),(46,'','pages','','string'),(46,'en_US','abstract','','string'),(46,'en_US','subtitle','','string'),(46,'en_US','title','Introduction','string'),(46,'fr_CA','abstract','','string'),(46,'fr_CA','subtitle','','string'),(46,'fr_CA','title','','string'),(47,'','pages','','string'),(47,'en_US','abstract','','string'),(47,'en_US','subtitle','','string'),(47,'en_US','title','Poems','string'),(47,'fr_CA','abstract','','string'),(47,'fr_CA','subtitle','','string'),(47,'fr_CA','title','','string'),(48,'','pages','','string'),(48,'en_US','abstract','','string'),(48,'en_US','subtitle','','string'),(48,'en_US','title','Catalyzing Access through Social and Technical Innovation','string'),(48,'fr_CA','abstract','','string'),(48,'fr_CA','subtitle','','string'),(48,'fr_CA','title','','string'),(49,'','pages','','string'),(49,'en_US','abstract','','string'),(49,'en_US','subtitle','','string'),(49,'en_US','title','Catalyzing Access via Telecommunications Policy','string'),(49,'fr_CA','abstract','','string'),(49,'fr_CA','subtitle','','string'),(49,'fr_CA','title','','string'),(50,'','pages','','string'),(50,'en_US','abstract','','string'),(50,'en_US','subtitle','','string'),(50,'en_US','title','Access to Knowledge as a New Paradigm for Research on ICTs and Intellectual Property','string'),(50,'fr_CA','abstract','','string'),(50,'fr_CA','subtitle','','string'),(50,'fr_CA','title','','string'),(51,'','pages','','string'),(51,'en_US','abstract','','string'),(51,'en_US','subtitle','','string'),(51,'en_US','title','Current State of Mobile Learning','string'),(51,'fr_CA','abstract','','string'),(51,'fr_CA','subtitle','','string'),(51,'fr_CA','title','','string'),(52,'','pages','','string'),(52,'en_US','abstract','','string'),(52,'en_US','subtitle','','string'),(52,'en_US','title','A Model for Framing Mobile Learning','string'),(52,'fr_CA','abstract','','string'),(52,'fr_CA','subtitle','','string'),(52,'fr_CA','title','','string'),(53,'','pages','','string'),(53,'en_US','abstract','','string'),(53,'en_US','subtitle','','string'),(53,'en_US','title','Mobile Distance Learning with PDAs: Development and Testing of Pedagogical and System Solutions Supporting Mobile Distance Learners','string'),(53,'fr_CA','abstract','','string'),(53,'fr_CA','subtitle','','string'),(53,'fr_CA','title','','string'),(54,'','pages','','string'),(54,'en_US','abstract','','string'),(54,'en_US','subtitle','','string'),(54,'en_US','title','Chapter 1: Mind Control—Internal or External?','string'),(54,'fr_CA','abstract','','string'),(54,'fr_CA','subtitle','','string'),(54,'fr_CA','title','','string'),(55,'','pages','','string'),(55,'en_US','abstract','','string'),(55,'en_US','subtitle','','string'),(55,'en_US','title','Chapter 2: Classical Music and the Classical Mind','string'),(55,'fr_CA','abstract','','string'),(55,'fr_CA','subtitle','','string'),(55,'fr_CA','title','','string'),(56,'','pages','','string'),(56,'en_US','abstract','','string'),(56,'en_US','subtitle','','string'),(56,'en_US','title','Chapter 3: Situated Cognition and Bricolage','string'),(56,'fr_CA','abstract','','string'),(56,'fr_CA','subtitle','','string'),(56,'fr_CA','title','','string'),(57,'','pages','','string'),(57,'en_US','abstract','','string'),(57,'en_US','subtitle','','string'),(57,'en_US','title','Chapter 4: Braitenberg’s Vehicle 2','string'),(57,'fr_CA','abstract','','string'),(57,'fr_CA','subtitle','','string'),(57,'fr_CA','title','','string'),(58,'','pages','','string'),(58,'en_US','abstract','','string'),(58,'en_US','subtitle','','string'),(58,'en_US','title','Setting the Stage','string'),(58,'fr_CA','abstract','','string'),(58,'fr_CA','subtitle','','string'),(58,'fr_CA','title','','string'),(59,'','pages','','string'),(59,'en_US','abstract','','string'),(59,'en_US','subtitle','','string'),(59,'en_US','title','Going It Alone, 1945-1954','string'),(59,'fr_CA','abstract','','string'),(59,'fr_CA','subtitle','','string'),(59,'fr_CA','title','','string'),(60,'','pages','','string'),(60,'en_US','abstract','','string'),(60,'en_US','subtitle','','string'),(60,'en_US','title','Establishing the Pattern, 1955-1962','string'),(60,'fr_CA','abstract','','string'),(60,'fr_CA','subtitle','','string'),(60,'fr_CA','title','','string'),(61,'','pages','','string'),(61,'en_US','abstract','','string'),(61,'en_US','subtitle','','string'),(61,'en_US','title','Foreward','string'),(61,'fr_CA','abstract','','string'),(61,'fr_CA','subtitle','','string'),(61,'fr_CA','title','','string'),(62,'','pages','','string'),(62,'en_US','abstract','','string'),(62,'en_US','subtitle','','string'),(62,'en_US','title','Preface','string'),(62,'fr_CA','abstract','','string'),(62,'fr_CA','subtitle','','string'),(62,'fr_CA','title','','string'),(63,'','pages','','string'),(63,'en_US','abstract','','string'),(63,'en_US','subtitle','','string'),(63,'en_US','title','The Case Studies','string'),(63,'fr_CA','abstract','','string'),(63,'fr_CA','subtitle','','string'),(63,'fr_CA','title','','string'),(64,'','pages','','string'),(64,'en_US','abstract','','string'),(64,'en_US','subtitle','','string'),(64,'en_US','title','Conclusion','string'),(64,'fr_CA','abstract','','string'),(64,'fr_CA','subtitle','','string'),(64,'fr_CA','title','','string'),(65,'','pages','','string'),(65,'en_US','abstract','','string'),(65,'en_US','subtitle','','string'),(65,'en_US','title','Bibliography','string'),(65,'fr_CA','abstract','','string'),(65,'fr_CA','subtitle','','string'),(65,'fr_CA','title','','string'),(66,'','pages','','string'),(66,'en_US','abstract','','string'),(66,'en_US','subtitle','','string'),(66,'en_US','title','Preface','string'),(66,'fr_CA','abstract','','string'),(66,'fr_CA','subtitle','','string'),(66,'fr_CA','title','','string'),(67,'','pages','','string'),(67,'en_US','abstract','','string'),(67,'en_US','subtitle','','string'),(67,'en_US','title','Introduction','string'),(67,'fr_CA','abstract','','string'),(67,'fr_CA','subtitle','','string'),(67,'fr_CA','title','','string'),(68,'','pages','','string'),(68,'en_US','abstract','','string'),(68,'en_US','subtitle','','string'),(68,'en_US','title','The Emergence of Open Development in a Network Society','string'),(68,'fr_CA','abstract','','string'),(68,'fr_CA','subtitle','','string'),(68,'fr_CA','title','','string'),(69,'','pages','','string'),(69,'en_US','abstract','','string'),(69,'en_US','subtitle','','string'),(69,'en_US','title','Enacting Openness in ICT4D Research','string'),(69,'fr_CA','abstract','','string'),(69,'fr_CA','subtitle','','string'),(69,'fr_CA','title','','string'),(70,'','pages','','string'),(70,'en_US','abstract','','string'),(70,'en_US','subtitle','','string'),(70,'en_US','title','Transparency and Development: Ethical Consumption through Web 2.0 and the Internet of Things','string'),(70,'fr_CA','abstract','','string'),(70,'fr_CA','subtitle','','string'),(70,'fr_CA','title','','string'),(71,'','pages','','string'),(71,'en_US','abstract','','string'),(71,'en_US','subtitle','','string'),(71,'en_US','title','Open Educational Resources: Opportunities and Challenges for the Developing World','string'),(71,'fr_CA','abstract','','string'),(71,'fr_CA','subtitle','','string'),(71,'fr_CA','title','','string');
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
  PRIMARY KEY (`chapter_id`),
  KEY `chapters_chapter_id` (`chapter_id`),
  KEY `chapters_publication_id` (`publication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_chapters`
--

LOCK TABLES `submission_chapters` WRITE;
/*!40000 ALTER TABLE `submission_chapters` DISABLE KEYS */;
INSERT INTO `submission_chapters` VALUES (1,NULL,1,1.00),(2,NULL,1,2.00),(3,NULL,1,3.00),(4,NULL,2,1.00),(5,NULL,2,2.00),(6,NULL,2,3.00),(7,NULL,2,4.00),(8,NULL,3,1.00),(9,NULL,3,2.00),(10,NULL,3,3.00),(11,NULL,3,4.00),(12,NULL,3,5.00),(13,NULL,4,1.00),(14,NULL,4,2.00),(15,NULL,4,3.00),(16,NULL,4,4.00),(17,NULL,5,1.00),(18,NULL,5,2.00),(19,NULL,5,3.00),(20,NULL,5,4.00),(21,NULL,5,5.00),(22,NULL,5,6.00),(23,NULL,6,1.00),(24,NULL,6,2.00),(25,NULL,6,3.00),(26,NULL,6,4.00),(27,NULL,7,1.00),(28,NULL,7,2.00),(29,NULL,7,3.00),(30,NULL,7,4.00),(31,NULL,7,5.00),(32,NULL,9,1.00),(33,NULL,9,2.00),(34,NULL,9,3.00),(35,NULL,9,4.00),(36,NULL,9,5.00),(37,NULL,10,1.00),(38,NULL,10,2.00),(39,NULL,10,3.00),(40,NULL,10,4.00),(41,NULL,10,5.00),(42,NULL,10,6.00),(43,NULL,10,7.00),(44,NULL,10,8.00),(45,NULL,10,9.00),(46,NULL,11,1.00),(47,NULL,11,2.00),(48,NULL,12,1.00),(49,NULL,12,2.00),(50,NULL,12,3.00),(51,NULL,13,1.00),(52,NULL,13,2.00),(53,NULL,13,3.00),(54,NULL,14,1.00),(55,NULL,14,2.00),(56,NULL,14,3.00),(57,NULL,14,4.00),(58,NULL,15,1.00),(59,NULL,15,2.00),(60,NULL,15,3.00),(61,NULL,16,1.00),(62,NULL,16,2.00),(63,NULL,16,3.00),(64,NULL,16,4.00),(65,NULL,16,5.00),(66,NULL,17,1.00),(67,NULL,17,2.00),(68,NULL,17,3.00),(69,NULL,17,4.00),(70,NULL,17,5.00),(71,NULL,17,6.00);
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
  KEY `submission_comments_submission_id` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_comments`
--

LOCK TABLES `submission_comments` WRITE;
/*!40000 ALTER TABLE `submission_comments` DISABLE KEYS */;
INSERT INTO `submission_comments` VALUES (1,1,4096,11,10,10,'','<p>I recommend that the author revise this submission.</p>','2026-01-02 05:28:07',NULL,1),(2,1,4096,11,11,12,'','<p>I recommend that the author resubmit this submission.</p>','2026-01-02 05:28:15',NULL,1),(3,1,4096,12,13,8,'','<p>I recommend declining this submission.</p>','2026-01-02 05:29:38',NULL,1),(4,1,4096,13,16,10,'','<p>I recommend requiring revisions.</p>','2026-01-02 05:30:46',NULL,1),(5,1,4096,13,18,12,'','<p>I recommend resubmitting.</p>','2026-01-02 05:30:54',NULL,1),(6,1,4096,16,21,10,'','<p>I recommend that the author revise this submission.</p>','2026-01-02 05:34:12',NULL,1);
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
  KEY `submission_file_revisions_submission_file_id_foreign` (`submission_file_id`),
  KEY `submission_file_revisions_file_id_foreign` (`file_id`),
  CONSTRAINT `submission_file_revisions_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`),
  CONSTRAINT `submission_file_revisions_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_revisions`
--

LOCK TABLES `submission_file_revisions` WRITE;
/*!40000 ALTER TABLE `submission_file_revisions` DISABLE KEYS */;
INSERT INTO `submission_file_revisions` VALUES (1,1,1),(2,2,1),(3,3,2),(4,4,3),(5,5,4),(6,6,5),(7,7,2),(8,8,3),(9,9,4),(10,10,5),(11,11,6),(12,12,7),(13,13,8),(14,14,9),(15,15,10),(16,16,7),(17,17,8),(18,18,9),(19,19,10),(20,20,11),(21,21,11),(22,22,11),(23,23,12),(24,24,13),(25,25,14),(26,26,15),(27,27,12),(28,28,13),(29,29,14),(30,30,15),(31,31,16),(32,32,17),(33,33,18),(34,34,19),(35,35,20),(36,36,16),(37,37,17),(38,38,18),(39,39,19),(40,40,20),(41,41,21),(42,42,22),(43,43,23),(44,44,24),(45,45,25),(46,46,26),(47,47,22),(48,48,23),(49,49,24),(50,50,25),(51,51,26),(52,52,27),(53,53,28),(54,54,28),(55,55,29),(56,56,30),(57,57,31),(58,58,32),(59,59,33),(60,60,34),(61,61,32),(62,62,33),(63,63,34),(64,64,35),(65,65,36),(66,66,37),(67,67,38),(68,68,39),(69,69,40),(70,70,35),(71,71,36),(72,72,37),(73,73,38),(74,74,39),(75,75,40),(76,76,35),(77,77,36),(78,78,37),(79,79,38),(80,80,39),(81,81,40),(82,82,41),(83,83,41),(84,84,42),(85,85,42),(86,86,43),(87,87,44),(88,88,45),(89,89,46),(90,90,47),(91,91,48),(92,92,43),(93,93,44),(94,94,45),(95,95,46),(96,96,47),(97,97,48);
/*!40000 ALTER TABLE `submission_file_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_settings`
--

DROP TABLE IF EXISTS `submission_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_file_settings` (
  `submission_file_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL DEFAULT 'string' COMMENT '(bool|int|float|string|object|date)',
  UNIQUE KEY `submission_file_settings_pkey` (`submission_file_id`,`locale`,`setting_name`),
  KEY `submission_file_settings_id` (`submission_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_settings`
--

LOCK TABLES `submission_file_settings` WRITE;
/*!40000 ALTER TABLE `submission_file_settings` DISABLE KEYS */;
INSERT INTO `submission_file_settings` VALUES (1,'en_US','name','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(2,'en_US','name','The ABCs of Human Survival: A Paradigm for Global Citizenship.pdf','string'),(3,'','chapterId','4','string'),(3,'en_US','name','Critical History in Western Canada 1900–.pdf','string'),(4,'','chapterId','5','string'),(4,'en_US','name','Vernacular Currents in Western Canadian .pdf','string'),(5,'','chapterId','6','string'),(5,'en_US','name','Cree Intellectual Traditions in History.pdf','string'),(6,'','chapterId','7','string'),(6,'en_US','name','Visualizing Space, Race, and History in .pdf','string'),(7,'','chapterId','4','string'),(7,'en_US','name','Critical History in Western Canada 1900–.pdf','string'),(8,'','chapterId','5','string'),(8,'en_US','name','Vernacular Currents in Western Canadian .pdf','string'),(9,'','chapterId','6','string'),(9,'en_US','name','Cree Intellectual Traditions in History.pdf','string'),(10,'','chapterId','7','string'),(10,'en_US','name','Visualizing Space, Race, and History in .pdf','string'),(11,'en_US','name','The Political Economy of Workplace Injury in Canada.pdf','string'),(12,'','chapterId','13','string'),(12,'en_US','name','Introduction: Contexts of Popular Cultur.pdf','string'),(13,'','chapterId','14','string'),(13,'en_US','name','Chapter 1. A Future for Media Studies: C.pdf','string'),(14,'','chapterId','15','string'),(14,'en_US','name','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(15,'','chapterId','16','string'),(15,'en_US','name','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(16,'','chapterId','13','string'),(16,'en_US','name','Introduction: Contexts of Popular Cultur.pdf','string'),(17,'','chapterId','14','string'),(17,'en_US','name','Chapter 1. A Future for Media Studies: C.pdf','string'),(18,'','chapterId','15','string'),(18,'en_US','name','Chapter 2. Log On, Goof Off, and Look Up.pdf','string'),(19,'','chapterId','16','string'),(19,'en_US','name','Chapter 3. Hawkers and Public Space: Fre.pdf','string'),(20,'en_US','name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(21,'en_US','name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(22,'en_US','name','Bomb Canada and Other Unkind Remarks in the American Media.pdf','string'),(23,'','chapterId','23','string'),(23,'en_US','name','Identify: Understanding Your Information.pdf','string'),(24,'','chapterId','24','string'),(24,'en_US','name','Scope: Knowing What Is Available.pdf','string'),(25,'','chapterId','25','string'),(25,'en_US','name','Plan: Developing Research Strategies.pdf','string'),(26,'','chapterId','26','string'),(26,'en_US','name','Gather: Finding What You Need.pdf','string'),(27,'','chapterId','23','string'),(27,'en_US','name','Identify: Understanding Your Information.pdf','string'),(28,'','chapterId','24','string'),(28,'en_US','name','Scope: Knowing What Is Available.pdf','string'),(29,'','chapterId','25','string'),(29,'en_US','name','Plan: Developing Research Strategies.pdf','string'),(30,'','chapterId','26','string'),(30,'en_US','name','Gather: Finding What You Need.pdf','string'),(31,'','chapterId','27','string'),(31,'en_US','name','Introduction.pdf','string'),(32,'','chapterId','28','string'),(32,'en_US','name','Chapter 1: Interactions Affording Distan.pdf','string'),(33,'','chapterId','29','string'),(33,'en_US','name','Chapter 2: Learning Science at a Distanc.pdf','string'),(34,'','chapterId','30','string'),(34,'en_US','name','Chapter 3: Leadership Strategies for Coo.pdf','string'),(35,'','chapterId','31','string'),(35,'en_US','name','Chapter 4: Toward New Models of Flexible.pdf','string'),(36,'','chapterId','27','string'),(36,'en_US','name','Introduction.pdf','string'),(37,'','chapterId','28','string'),(37,'en_US','name','Chapter 1: Interactions Affording Distan.pdf','string'),(38,'','chapterId','29','string'),(38,'en_US','name','Chapter 2: Learning Science at a Distanc.pdf','string'),(39,'','chapterId','30','string'),(39,'en_US','name','Chapter 3: Leadership Strategies for Coo.pdf','string'),(40,'','chapterId','31','string'),(40,'en_US','name','Chapter 4: Toward New Models of Flexible.pdf','string'),(41,'en_US','name','Editorial.pdf','string'),(42,'','chapterId','32','string'),(42,'en_US','name','Internet, openness and the future of the.pdf','string'),(43,'','chapterId','33','string'),(43,'en_US','name','Imagining the Internet: Open, closed or .pdf','string'),(44,'','chapterId','34','string'),(44,'en_US','name','The internet in LAC will remain free, pu.pdf','string'),(45,'','chapterId','35','string'),(45,'en_US','name','Free Internet?.pdf','string'),(46,'','chapterId','36','string'),(46,'en_US','name','Risks and challenges for freedom of expr.pdf','string'),(47,'','chapterId','32','string'),(47,'en_US','name','Internet, openness and the future of the.pdf','string'),(48,'','chapterId','33','string'),(48,'en_US','name','Imagining the Internet: Open, closed or .pdf','string'),(49,'','chapterId','34','string'),(49,'en_US','name','The internet in LAC will remain free, pu.pdf','string'),(50,'','chapterId','35','string'),(50,'en_US','name','Free Internet?.pdf','string'),(51,'','chapterId','36','string'),(51,'en_US','name','Risks and challenges for freedom of expr.pdf','string'),(52,'en_US','name','Lost Tracks: Buffalo National Park, 1909-1939.pdf','string'),(53,'en_US','name','Dreamwork.pdf','string'),(54,'en_US','name','Dreamwork.pdf','string'),(55,'','chapterId','48','string'),(55,'en_US','name','Catalyzing Access through Social and Tec.pdf','string'),(56,'','chapterId','49','string'),(56,'en_US','name','Catalyzing Access via Telecommunications.pdf','string'),(57,'','chapterId','50','string'),(57,'en_US','name','Access to Knowledge as a New Paradigm fo.pdf','string'),(58,'','chapterId','51','string'),(58,'en_US','name','Current State of Mobile Learning.pdf','string'),(59,'','chapterId','52','string'),(59,'en_US','name','A Model for Framing Mobile Learning.pdf','string'),(60,'','chapterId','53','string'),(60,'en_US','name','Mobile Distance Learning with PDAs: Deve.pdf','string'),(61,'','chapterId','51','string'),(61,'en_US','name','Current State of Mobile Learning.pdf','string'),(62,'','chapterId','52','string'),(62,'en_US','name','A Model for Framing Mobile Learning.pdf','string'),(63,'','chapterId','53','string'),(63,'en_US','name','Mobile Distance Learning with PDAs: Deve.pdf','string'),(64,'','chapterId','54','string'),(64,'en_US','name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(65,'','chapterId','55','string'),(65,'en_US','name','Chapter 2: Classical Music and the Class.pdf','string'),(66,'','chapterId','56','string'),(66,'en_US','name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(67,'','chapterId','57','string'),(67,'en_US','name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(68,'en_US','name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(69,'en_US','name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(70,'','chapterId','54','string'),(70,'en_US','name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(71,'','chapterId','55','string'),(71,'en_US','name','Chapter 2: Classical Music and the Class.pdf','string'),(72,'','chapterId','56','string'),(72,'en_US','name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(73,'','chapterId','57','string'),(73,'en_US','name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(74,'en_US','name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(75,'en_US','name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(76,'','chapterId','54','string'),(76,'en_US','name','Chapter 1: Mind Control—Internal or Exte.pdf','string'),(77,'','chapterId','55','string'),(77,'en_US','name','Chapter 2: Classical Music and the Class.pdf','string'),(78,'','chapterId','56','string'),(78,'en_US','name','Chapter 3: Situated Cognition and Bricol.pdf','string'),(79,'','chapterId','57','string'),(79,'en_US','name','Chapter 4: Braitenberg’s Vehicle 2.pdf','string'),(80,'en_US','name','Segmentation of Vascular Ultrasound Imag.pdf','string'),(81,'en_US','name','The Canadian Nutrient File: Nutrient Val.pdf','string'),(82,'en_US','name','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(83,'en_US','name','Expansive Discourses: Urban Sprawl in Calgary, 1945-1978.pdf','string'),(84,'en_US','name','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(85,'en_US','name','A Designer\'s Log: Case Studies in Instructional Design.pdf','string'),(86,'','chapterId','66','string'),(86,'en_US','name','Preface.pdf','string'),(87,'','chapterId','67','string'),(87,'en_US','name','Introduction.pdf','string'),(88,'','chapterId','68','string'),(88,'en_US','name','The Emergence of Open Development in a N.pdf','string'),(89,'','chapterId','69','string'),(89,'en_US','name','Enacting Openness in ICT4D Research.pdf','string'),(90,'','chapterId','70','string'),(90,'en_US','name','Transparency and Development: Ethical Co.pdf','string'),(91,'','chapterId','71','string'),(91,'en_US','name','Open Educational Resources: Opportunitie.pdf','string'),(92,'','chapterId','66','string'),(92,'en_US','name','Preface.pdf','string'),(93,'','chapterId','67','string'),(93,'en_US','name','Introduction.pdf','string'),(94,'','chapterId','68','string'),(94,'en_US','name','The Emergence of Open Development in a N.pdf','string'),(95,'','chapterId','69','string'),(95,'en_US','name','Enacting Openness in ICT4D Research.pdf','string'),(96,'','chapterId','70','string'),(96,'en_US','name','Transparency and Development: Ethical Co.pdf','string'),(97,'','chapterId','71','string'),(97,'en_US','name','Open Educational Resources: Opportunitie.pdf','string');
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
  `source_submission_file_id` bigint DEFAULT NULL,
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
  PRIMARY KEY (`submission_file_id`),
  KEY `submission_files_submission_id` (`submission_id`),
  KEY `submission_files_stage_assoc` (`file_stage`,`assoc_type`,`assoc_id`),
  KEY `submission_files_file_id_foreign` (`file_id`),
  CONSTRAINT `submission_files_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (1,1,1,NULL,3,2,NULL,NULL,NULL,'2026-01-02 05:19:03','2026-01-02 05:19:03',19,NULL,NULL),(2,1,1,1,3,4,NULL,NULL,NULL,'2026-01-02 05:19:20','2026-01-02 05:19:20',19,NULL,NULL),(3,2,2,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:19:36','2026-01-02 05:19:36',20,NULL,NULL),(4,2,3,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:19:36','2026-01-02 05:19:37',20,NULL,NULL),(5,2,4,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:19:37','2026-01-02 05:19:37',20,NULL,NULL),(6,2,5,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:19:37','2026-01-02 05:19:37',20,NULL,NULL),(7,2,2,3,4,4,NULL,NULL,NULL,'2026-01-02 05:20:26','2026-01-02 05:20:26',20,NULL,NULL),(8,2,3,4,4,4,NULL,NULL,NULL,'2026-01-02 05:20:26','2026-01-02 05:20:26',20,NULL,NULL),(9,2,4,5,4,4,NULL,NULL,NULL,'2026-01-02 05:20:26','2026-01-02 05:20:26',20,NULL,NULL),(10,2,5,6,4,4,NULL,NULL,NULL,'2026-01-02 05:20:26','2026-01-02 05:20:26',20,NULL,NULL),(11,3,6,NULL,3,2,NULL,NULL,NULL,'2026-01-02 05:20:43','2026-01-02 05:20:43',21,NULL,NULL),(12,4,7,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:21:08','2026-01-02 05:21:08',22,NULL,NULL),(13,4,8,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:21:09','2026-01-02 05:21:09',22,NULL,NULL),(14,4,9,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:21:09','2026-01-02 05:21:09',22,NULL,NULL),(15,4,10,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:21:09','2026-01-02 05:21:10',22,NULL,NULL),(16,4,7,12,4,19,NULL,NULL,NULL,'2026-01-02 05:21:47','2026-01-02 05:21:47',22,NULL,NULL),(17,4,8,13,4,19,NULL,NULL,NULL,'2026-01-02 05:21:47','2026-01-02 05:21:47',22,NULL,NULL),(18,4,9,14,4,19,NULL,NULL,NULL,'2026-01-02 05:21:48','2026-01-02 05:21:48',22,NULL,NULL),(19,4,10,15,4,19,NULL,NULL,NULL,'2026-01-02 05:21:48','2026-01-02 05:21:48',22,NULL,NULL),(20,5,11,NULL,3,2,NULL,NULL,NULL,'2026-01-02 05:22:21','2026-01-02 05:22:21',23,NULL,NULL),(21,5,11,20,3,19,NULL,NULL,NULL,'2026-01-02 05:22:49','2026-01-02 05:22:49',23,NULL,NULL),(22,5,11,20,3,10,'0','openAccess',1,'2026-01-02 05:23:21','2026-01-02 05:23:25',23,521,1),(23,6,12,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:23:34','2026-01-02 05:23:35',24,NULL,NULL),(24,6,13,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:23:35','2026-01-02 05:23:35',24,NULL,NULL),(25,6,14,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:23:35','2026-01-02 05:23:35',24,NULL,NULL),(26,6,15,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:23:35','2026-01-02 05:23:36',24,NULL,NULL),(27,6,12,23,4,19,NULL,NULL,NULL,'2026-01-02 05:24:13','2026-01-02 05:24:13',24,NULL,NULL),(28,6,13,24,4,19,NULL,NULL,NULL,'2026-01-02 05:24:13','2026-01-02 05:24:13',24,NULL,NULL),(29,6,14,25,4,19,NULL,NULL,NULL,'2026-01-02 05:24:13','2026-01-02 05:24:13',24,NULL,NULL),(30,6,15,26,4,19,NULL,NULL,NULL,'2026-01-02 05:24:13','2026-01-02 05:24:13',24,NULL,NULL),(31,7,16,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:24:37','2026-01-02 05:24:37',25,NULL,NULL),(32,7,17,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:24:37','2026-01-02 05:24:37',25,NULL,NULL),(33,7,18,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:24:37','2026-01-02 05:24:38',25,NULL,NULL),(34,7,19,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:24:38','2026-01-02 05:24:38',25,NULL,NULL),(35,7,20,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:24:38','2026-01-02 05:24:38',25,NULL,NULL),(36,7,16,31,4,4,NULL,NULL,NULL,'2026-01-02 05:25:27','2026-01-02 05:25:27',25,NULL,NULL),(37,7,17,32,4,4,NULL,NULL,NULL,'2026-01-02 05:25:27','2026-01-02 05:25:27',25,NULL,NULL),(38,7,18,33,4,4,NULL,NULL,NULL,'2026-01-02 05:25:27','2026-01-02 05:25:27',25,NULL,NULL),(39,7,19,34,4,4,NULL,NULL,NULL,'2026-01-02 05:25:27','2026-01-02 05:25:27',25,NULL,NULL),(40,7,20,35,4,4,NULL,NULL,NULL,'2026-01-02 05:25:27','2026-01-02 05:25:27',25,NULL,NULL),(41,8,21,NULL,3,2,NULL,NULL,NULL,'2026-01-02 05:25:46','2026-01-02 05:25:46',3,NULL,NULL),(42,9,22,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:25:54','2026-01-02 05:25:54',26,NULL,NULL),(43,9,23,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:25:54','2026-01-02 05:25:55',26,NULL,NULL),(44,9,24,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:25:55','2026-01-02 05:25:55',26,NULL,NULL),(45,9,25,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:25:55','2026-01-02 05:25:55',26,NULL,NULL),(46,9,26,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:25:55','2026-01-02 05:25:56',26,NULL,NULL),(47,9,22,42,4,19,NULL,NULL,NULL,'2026-01-02 05:26:43','2026-01-02 05:26:43',26,NULL,NULL),(48,9,23,43,4,19,NULL,NULL,NULL,'2026-01-02 05:26:43','2026-01-02 05:26:43',26,NULL,NULL),(49,9,24,44,4,19,NULL,NULL,NULL,'2026-01-02 05:26:44','2026-01-02 05:26:44',26,NULL,NULL),(50,9,25,45,4,19,NULL,NULL,NULL,'2026-01-02 05:26:44','2026-01-02 05:26:44',26,NULL,NULL),(51,9,26,46,4,19,NULL,NULL,NULL,'2026-01-02 05:26:44','2026-01-02 05:26:44',26,NULL,NULL),(52,10,27,NULL,3,2,NULL,NULL,NULL,'2026-01-02 05:26:52','2026-01-02 05:26:52',27,NULL,NULL),(53,11,28,NULL,3,2,NULL,NULL,NULL,'2026-01-02 05:27:33','2026-01-02 05:27:33',28,NULL,NULL),(54,11,28,53,3,19,NULL,NULL,NULL,'2026-01-02 05:27:46','2026-01-02 05:27:46',28,NULL,NULL),(55,12,29,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:28:30','2026-01-02 05:28:30',29,NULL,NULL),(56,12,30,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:28:31','2026-01-02 05:28:31',29,NULL,NULL),(57,12,31,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:28:31','2026-01-02 05:28:31',29,NULL,NULL),(58,13,32,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:29:45','2026-01-02 05:29:45',30,NULL,NULL),(59,13,33,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:29:45','2026-01-02 05:29:45',30,NULL,NULL),(60,13,34,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:29:45','2026-01-02 05:29:46',30,NULL,NULL),(61,13,32,58,4,19,NULL,NULL,NULL,'2026-01-02 05:30:17','2026-01-02 05:30:17',30,NULL,NULL),(62,13,33,59,4,19,NULL,NULL,NULL,'2026-01-02 05:30:17','2026-01-02 05:30:17',30,NULL,NULL),(63,13,34,60,4,19,NULL,NULL,NULL,'2026-01-02 05:30:17','2026-01-02 05:30:17',30,NULL,NULL),(64,14,35,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:31:12','2026-01-02 05:31:12',31,NULL,NULL),(65,14,36,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:31:12','2026-01-02 05:31:13',31,NULL,NULL),(66,14,37,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:31:13','2026-01-02 05:31:13',31,NULL,NULL),(67,14,38,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:31:13','2026-01-02 05:31:13',31,NULL,NULL),(68,14,39,NULL,13,2,NULL,NULL,NULL,'2026-01-02 05:31:14','2026-01-02 05:31:14',31,NULL,NULL),(69,14,40,NULL,9,2,NULL,NULL,NULL,'2026-01-02 05:31:14','2026-01-02 05:31:15',31,NULL,NULL),(70,14,35,64,4,19,NULL,NULL,NULL,'2026-01-02 05:31:51','2026-01-02 05:31:51',31,NULL,NULL),(71,14,36,65,4,19,NULL,NULL,NULL,'2026-01-02 05:31:51','2026-01-02 05:31:51',31,NULL,NULL),(72,14,37,66,4,19,NULL,NULL,NULL,'2026-01-02 05:31:51','2026-01-02 05:31:51',31,NULL,NULL),(73,14,38,67,4,19,NULL,NULL,NULL,'2026-01-02 05:31:51','2026-01-02 05:31:51',31,NULL,NULL),(74,14,39,68,13,19,NULL,NULL,NULL,'2026-01-02 05:31:51','2026-01-02 05:31:51',31,NULL,NULL),(75,14,40,69,9,19,NULL,NULL,NULL,'2026-01-02 05:31:51','2026-01-02 05:31:51',31,NULL,NULL),(76,14,35,64,4,10,'0','openAccess',1,'2026-01-02 05:32:30','2026-01-02 05:32:34',31,521,2),(77,14,36,65,4,10,'0','openAccess',1,'2026-01-02 05:32:30','2026-01-02 05:32:38',31,521,2),(78,14,37,66,4,10,'0','openAccess',1,'2026-01-02 05:32:30','2026-01-02 05:32:41',31,521,2),(79,14,38,67,4,10,'0','openAccess',1,'2026-01-02 05:32:30','2026-01-02 05:32:45',31,521,2),(80,14,39,68,13,10,'0','openAccess',1,'2026-01-02 05:32:30','2026-01-02 05:32:48',31,521,2),(81,14,40,69,9,10,'0','openAccess',1,'2026-01-02 05:32:30','2026-01-02 05:32:52',31,521,2),(82,15,41,NULL,3,2,NULL,NULL,NULL,'2026-01-02 05:33:02','2026-01-02 05:33:02',32,NULL,NULL),(83,15,41,82,3,4,NULL,NULL,NULL,'2026-01-02 05:33:20','2026-01-02 05:33:20',32,NULL,NULL),(84,16,42,NULL,3,2,NULL,NULL,NULL,'2026-01-02 05:33:28','2026-01-02 05:33:28',33,NULL,NULL),(85,16,42,84,3,4,NULL,NULL,NULL,'2026-01-02 05:33:53','2026-01-02 05:33:53',33,NULL,NULL),(86,17,43,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:34:19','2026-01-02 05:34:19',34,NULL,NULL),(87,17,44,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:34:19','2026-01-02 05:34:19',34,NULL,NULL),(88,17,45,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:34:19','2026-01-02 05:34:20',34,NULL,NULL),(89,17,46,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:34:20','2026-01-02 05:34:20',34,NULL,NULL),(90,17,47,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:34:20','2026-01-02 05:34:20',34,NULL,NULL),(91,17,48,NULL,4,2,NULL,NULL,NULL,'2026-01-02 05:34:21','2026-01-02 05:34:21',34,NULL,NULL),(92,17,43,86,4,19,NULL,NULL,NULL,'2026-01-02 05:35:27','2026-01-02 05:35:27',34,NULL,NULL),(93,17,44,87,4,19,NULL,NULL,NULL,'2026-01-02 05:35:27','2026-01-02 05:35:27',34,NULL,NULL),(94,17,45,88,4,19,NULL,NULL,NULL,'2026-01-02 05:35:27','2026-01-02 05:35:27',34,NULL,NULL),(95,17,46,89,4,19,NULL,NULL,NULL,'2026-01-02 05:35:27','2026-01-02 05:35:27',34,NULL,NULL),(96,17,47,90,4,19,NULL,NULL,NULL,'2026-01-02 05:35:27','2026-01-02 05:35:27',34,NULL,NULL),(97,17,48,91,4,19,NULL,NULL,NULL,'2026-01-02 05:35:27','2026-01-02 05:35:27',34,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb3;
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
  `object_id` bigint NOT NULL,
  `keyword_id` bigint NOT NULL,
  `pos` int NOT NULL COMMENT 'Word position of the keyword in the object.',
  UNIQUE KEY `submission_search_object_keywords_pkey` (`object_id`,`pos`),
  KEY `submission_search_object_keywords_keyword_id` (`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_object_keywords`
--

LOCK TABLES `submission_search_object_keywords` WRITE;
/*!40000 ALTER TABLE `submission_search_object_keywords` DISABLE KEYS */;
INSERT INTO `submission_search_object_keywords` VALUES (1,1,0),(1,2,1),(3,2,14),(1,3,2),(9,3,2),(9,3,7),(9,3,10),(1,4,3),(1,5,4),(2,6,0),(3,6,29),(2,7,1),(3,7,0),(3,7,9),(3,7,19),(3,7,30),(3,7,45),(2,8,2),(2,9,3),(2,10,4),(3,10,7),(3,10,16),(2,11,5),(3,11,17),(3,12,1),(3,12,46),(3,13,2),(3,13,47),(3,14,3),(3,15,4),(3,16,5),(3,17,6),(3,17,33),(3,18,8),(3,19,10),(3,20,11),(3,21,12),(3,22,13),(3,23,15),(3,24,18),(3,25,20),(3,26,21),(3,27,22),(3,28,23),(3,29,24),(3,30,25),(3,31,26),(3,32,27),(3,33,28),(3,34,31),(3,35,32),(3,36,34),(3,37,35),(3,38,36),(3,39,37),(3,40,38),(3,41,39),(3,42,40),(3,43,41),(3,44,42),(3,45,43),(11,45,57),(3,46,44),(5,47,0),(5,48,1),(5,48,4),(5,48,7),(5,49,2),(5,50,3),(5,51,5),(5,52,6),(9,53,0),(9,53,8),(9,54,1),(9,55,3),(9,56,4),(9,57,5),(9,58,6),(9,59,9),(9,60,11),(10,61,0),(11,61,0),(11,61,23),(10,62,1),(11,62,1),(11,62,24),(10,63,2),(11,63,3),(11,63,17),(10,64,3),(11,64,4),(11,64,18),(11,64,21),(10,65,4),(11,65,5),(11,65,19),(11,65,22),(10,66,5),(11,66,11),(11,66,53),(10,67,6),(11,67,13),(11,67,54),(11,68,2),(11,69,6),(11,70,7),(11,71,8),(11,72,9),(11,73,10),(11,74,12),(11,75,14),(11,76,15),(11,77,16),(11,78,20),(11,79,25),(11,80,26),(11,81,27),(11,82,28),(11,83,29),(11,84,30),(11,84,48),(11,85,31),(11,86,32),(11,87,33),(11,88,34),(11,89,35),(11,90,36),(11,91,37),(11,92,38),(11,93,39),(11,93,51),(11,94,40),(11,95,41),(11,96,42),(11,96,58),(11,97,43),(11,98,44),(11,99,45),(11,100,46),(11,101,47),(11,102,49),(11,103,50),(11,104,52),(11,105,55),(11,106,56),(11,107,59),(11,108,60),(11,109,61),(13,110,0);
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
  KEY `submission_search_object_submission` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_settings` (
  `submission_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  UNIQUE KEY `submission_settings_pkey` (`submission_id`,`locale`,`setting_name`),
  KEY `submission_settings_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `submission_progress` smallint NOT NULL DEFAULT '1',
  `work_type` smallint DEFAULT '0',
  PRIMARY KEY (`submission_id`),
  KEY `submissions_context_id` (`context_id`),
  KEY `submissions_publication_id` (`current_publication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,1,1,'2026-01-02 05:19:29','2026-01-02 05:19:15','2026-01-02 05:19:15',4,'en_US',1,0,2),(2,1,2,'2026-01-02 05:20:36','2026-01-02 05:20:20','2026-01-02 05:20:20',3,'en_US',1,0,1),(3,1,3,'2026-01-02 05:21:02','2026-01-02 05:21:02','2026-01-02 05:21:02',1,'en_US',1,0,2),(4,1,4,'2026-01-02 05:22:14','2026-01-02 05:21:42','2026-01-02 05:21:42',5,'en_US',1,0,1),(5,1,5,'2026-01-02 05:23:28','2026-01-02 05:22:44','2026-01-02 05:22:44',5,'en_US',3,0,2),(6,1,6,'2026-01-02 05:24:24','2026-01-02 05:24:07','2026-01-02 05:24:07',2,'en_US',1,0,1),(7,1,7,'2026-01-02 05:25:40','2026-01-02 05:25:20','2026-01-02 05:25:20',4,'en_US',1,0,1),(8,1,8,'2026-01-02 05:25:48','2026-01-02 05:25:48','2026-01-02 05:25:48',1,'en_US',1,0,2),(9,1,9,'2026-01-02 05:26:44','2026-01-02 05:26:37','2026-01-02 05:26:37',2,'en_US',1,0,1),(10,1,10,'2026-01-02 05:27:27','2026-01-02 05:27:27','2026-01-02 05:27:27',1,'en_US',1,0,2),(11,1,11,'2026-01-02 05:28:22','2026-01-02 05:27:42','2026-01-02 05:27:42',4,'en_US',1,0,2),(12,1,12,'2026-01-02 05:29:38','2026-01-02 05:29:08','2026-01-02 05:29:08',2,'en_US',1,0,1),(13,1,13,'2026-01-02 05:31:03','2026-01-02 05:30:10','2026-01-02 05:30:10',4,'en_US',1,0,1),(14,1,14,'2026-01-02 05:32:56','2026-01-02 05:31:44','2026-01-02 05:31:44',5,'en_US',3,0,1),(15,1,15,'2026-01-02 05:33:20','2026-01-02 05:33:14','2026-01-02 05:33:14',3,'en_US',1,0,2),(16,1,16,'2026-01-02 05:34:12','2026-01-02 05:33:46','2026-01-02 05:33:46',3,'en_US',1,0,2),(17,1,17,'2026-01-02 05:35:39','2026-01-02 05:35:18','2026-01-02 05:35:18',2,'en_US',1,0,1);
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
  KEY `temporary_files_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_temporary_records` (
  `assoc_id` bigint NOT NULL,
  `assoc_type` bigint NOT NULL,
  `day` bigint NOT NULL,
  `entry_time` bigint NOT NULL,
  `metric` bigint NOT NULL DEFAULT '1',
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `load_id` varchar(255) NOT NULL,
  `file_type` smallint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_settings` (
  `user_group_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `user_group_settings_pkey` (`user_group_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_settings`
--

LOCK TABLES `user_group_settings` WRITE;
/*!40000 ALTER TABLE `user_group_settings` DISABLE KEYS */;
INSERT INTO `user_group_settings` VALUES (1,'en_US','name','Site Admin','string'),(1,'fr_CA','name','##default.groups.name.siteAdmin##','string'),(2,'','abbrevLocaleKey','default.groups.abbrev.manager','string'),(2,'','nameLocaleKey','default.groups.name.manager','string'),(2,'en_US','abbrev','PM','string'),(2,'en_US','name','Press manager','string'),(2,'fr_CA','abbrev','MP','string'),(2,'fr_CA','name','Gestionnaire de la presse','string'),(3,'','abbrevLocaleKey','default.groups.abbrev.editor','string'),(3,'','nameLocaleKey','default.groups.name.editor','string'),(3,'en_US','abbrev','PE','string'),(3,'en_US','name','Press editor','string'),(3,'fr_CA','abbrev','RP','string'),(3,'fr_CA','name','Rédacteur/Rédactrice en chef de la presse','string'),(4,'','abbrevLocaleKey','default.groups.abbrev.productionEditor','string'),(4,'','nameLocaleKey','default.groups.name.productionEditor','string'),(4,'en_US','abbrev','ProdE','string'),(4,'en_US','name','Production editor','string'),(4,'fr_CA','abbrev','DirProd','string'),(4,'fr_CA','name','Directeur-trice de production','string'),(5,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor','string'),(5,'','nameLocaleKey','default.groups.name.sectionEditor','string'),(5,'en_US','abbrev','AcqE','string'),(5,'en_US','name','Series editor','string'),(5,'fr_CA','abbrev','RS','string'),(5,'fr_CA','name','Rédacteur/Rédactrice en chef de la série','string'),(6,'','abbrevLocaleKey','default.groups.abbrev.copyeditor','string'),(6,'','nameLocaleKey','default.groups.name.copyeditor','string'),(6,'en_US','abbrev','CE','string'),(6,'en_US','name','Copyeditor','string'),(6,'fr_CA','abbrev','RÉV','string'),(6,'fr_CA','name','Réviseur-e','string'),(7,'','abbrevLocaleKey','default.groups.abbrev.designer','string'),(7,'','nameLocaleKey','default.groups.name.designer','string'),(7,'en_US','abbrev','Design','string'),(7,'en_US','name','Designer','string'),(7,'fr_CA','abbrev','Design','string'),(7,'fr_CA','name','Designer','string'),(8,'','abbrevLocaleKey','default.groups.abbrev.funding','string'),(8,'','nameLocaleKey','default.groups.name.funding','string'),(8,'en_US','abbrev','FC','string'),(8,'en_US','name','Funding coordinator','string'),(8,'fr_CA','abbrev','CF','string'),(8,'fr_CA','name','Coordonnateur-trice du financement','string'),(9,'','abbrevLocaleKey','default.groups.abbrev.indexer','string'),(9,'','nameLocaleKey','default.groups.name.indexer','string'),(9,'en_US','abbrev','IND','string'),(9,'en_US','name','Indexer','string'),(9,'fr_CA','abbrev','Indx','string'),(9,'fr_CA','name','Indexeur-e','string'),(10,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor','string'),(10,'','nameLocaleKey','default.groups.name.layoutEditor','string'),(10,'en_US','abbrev','LE','string'),(10,'en_US','name','Layout Editor','string'),(10,'fr_CA','abbrev','RespMP','string'),(10,'fr_CA','name','Responsable de la mise en page','string'),(11,'','abbrevLocaleKey','default.groups.abbrev.marketing','string'),(11,'','nameLocaleKey','default.groups.name.marketing','string'),(11,'en_US','abbrev','MS','string'),(11,'en_US','name','Marketing and sales coordinator','string'),(11,'fr_CA','abbrev','CVM','string'),(11,'fr_CA','name','Coordonnateur-trice des ventes et du marketing','string'),(12,'','abbrevLocaleKey','default.groups.abbrev.proofreader','string'),(12,'','nameLocaleKey','default.groups.name.proofreader','string'),(12,'en_US','abbrev','PR','string'),(12,'en_US','name','Proofreader','string'),(12,'fr_CA','abbrev','CorEp','string'),(12,'fr_CA','name','Correcteur-trice d\'épreuves','string'),(13,'','abbrevLocaleKey','default.groups.abbrev.author','string'),(13,'','nameLocaleKey','default.groups.name.author','string'),(13,'en_US','abbrev','AU','string'),(13,'en_US','name','Author','string'),(13,'fr_CA','abbrev','AU','string'),(13,'fr_CA','name','Auteur-e','string'),(14,'','abbrevLocaleKey','default.groups.abbrev.volumeEditor','string'),(14,'','nameLocaleKey','default.groups.name.volumeEditor','string'),(14,'','recommendOnly','0','bool'),(14,'en_US','abbrev','VE','string'),(14,'en_US','name','Volume editor','string'),(14,'fr_CA','abbrev','RV','string'),(14,'fr_CA','name','Rédacteur/Rédactrice en chef du volume','string'),(15,'','abbrevLocaleKey','default.groups.abbrev.chapterAuthor','string'),(15,'','nameLocaleKey','default.groups.name.chapterAuthor','string'),(15,'en_US','abbrev','CA','string'),(15,'en_US','name','Chapter Author','string'),(15,'fr_CA','abbrev','AC','string'),(15,'fr_CA','name','Auteur du chapitre','string'),(16,'','abbrevLocaleKey','default.groups.abbrev.translator','string'),(16,'','nameLocaleKey','default.groups.name.translator','string'),(16,'en_US','abbrev','Trans','string'),(16,'en_US','name','Translator','string'),(16,'fr_CA','abbrev','Trad','string'),(16,'fr_CA','name','Traducteur-trice','string'),(17,'','abbrevLocaleKey','default.groups.abbrev.internalReviewer','string'),(17,'','nameLocaleKey','default.groups.name.internalReviewer','string'),(17,'en_US','abbrev','IR','string'),(17,'en_US','name','Internal Reviewer','string'),(17,'fr_CA','abbrev','EvalInt','string'),(17,'fr_CA','name','Évaluateur-trice interne','string'),(18,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer','string'),(18,'','nameLocaleKey','default.groups.name.externalReviewer','string'),(18,'en_US','abbrev','ER','string'),(18,'en_US','name','External Reviewer','string'),(18,'fr_CA','abbrev','EvEx','string'),(18,'fr_CA','name','Évaluateur-trice externe','string'),(19,'','abbrevLocaleKey','default.groups.abbrev.reader','string'),(19,'','nameLocaleKey','default.groups.name.reader','string'),(19,'en_US','abbrev','Read','string'),(19,'en_US','name','Reader','string'),(19,'fr_CA','abbrev','Lect','string'),(19,'fr_CA','name','Lecteur-trice','string');
/*!40000 ALTER TABLE `user_group_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_stage`
--

DROP TABLE IF EXISTS `user_group_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_stage` (
  `context_id` bigint NOT NULL,
  `user_group_id` bigint NOT NULL,
  `stage_id` bigint NOT NULL,
  UNIQUE KEY `user_group_stage_pkey` (`context_id`,`user_group_id`,`stage_id`),
  KEY `user_group_stage_context_id` (`context_id`),
  KEY `user_group_stage_user_group_id` (`user_group_id`),
  KEY `user_group_stage_stage_id` (`stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_interests` (
  `user_id` bigint NOT NULL,
  `controlled_vocab_entry_id` bigint NOT NULL,
  UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `user_id` bigint NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `assoc_type` bigint NOT NULL DEFAULT '0',
  `assoc_id` bigint NOT NULL DEFAULT '0',
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `user_settings_pkey` (`user_id`,`locale`,`setting_name`,`assoc_type`,`assoc_id`),
  KEY `user_settings_user_id` (`user_id`),
  KEY `user_settings_locale_setting_name_index` (`setting_name`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
INSERT INTO `user_settings` VALUES (1,'en_US','familyName',0,0,'admin','string'),(1,'en_US','givenName',0,0,'admin','string'),(2,'','orcid',0,0,'','string'),(2,'en_US','affiliation',0,0,'Universidad Nacional Autónoma de México','string'),(2,'en_US','biography',0,0,'','string'),(2,'en_US','familyName',0,0,'Vaca','string'),(2,'en_US','givenName',0,0,'Ramiro','string'),(2,'en_US','preferredPublicName',0,0,'','string'),(2,'en_US','signature',0,0,'','string'),(2,'fr_CA','affiliation',0,0,'','string'),(2,'fr_CA','biography',0,0,'','string'),(2,'fr_CA','familyName',0,0,'','string'),(2,'fr_CA','givenName',0,0,'','string'),(2,'fr_CA','preferredPublicName',0,0,'','string'),(2,'fr_CA','signature',0,0,'','string'),(3,'','orcid',0,0,'','string'),(3,'en_US','affiliation',0,0,'University of Melbourne','string'),(3,'en_US','biography',0,0,'','string'),(3,'en_US','familyName',0,0,'Barnes','string'),(3,'en_US','givenName',0,0,'Daniel','string'),(3,'en_US','preferredPublicName',0,0,'','string'),(3,'en_US','signature',0,0,'','string'),(3,'fr_CA','affiliation',0,0,'','string'),(3,'fr_CA','biography',0,0,'','string'),(3,'fr_CA','familyName',0,0,'','string'),(3,'fr_CA','givenName',0,0,'','string'),(3,'fr_CA','preferredPublicName',0,0,'','string'),(3,'fr_CA','signature',0,0,'','string'),(4,'','orcid',0,0,'','string'),(4,'en_US','affiliation',0,0,'University of Chicago','string'),(4,'en_US','biography',0,0,'','string'),(4,'en_US','familyName',0,0,'Buskins','string'),(4,'en_US','givenName',0,0,'David','string'),(4,'en_US','preferredPublicName',0,0,'','string'),(4,'en_US','signature',0,0,'','string'),(4,'fr_CA','affiliation',0,0,'','string'),(4,'fr_CA','biography',0,0,'','string'),(4,'fr_CA','familyName',0,0,'','string'),(4,'fr_CA','givenName',0,0,'','string'),(4,'fr_CA','preferredPublicName',0,0,'','string'),(4,'fr_CA','signature',0,0,'','string'),(5,'','orcid',0,0,'','string'),(5,'en_US','affiliation',0,0,'University of Toronto','string'),(5,'en_US','biography',0,0,'','string'),(5,'en_US','familyName',0,0,'Berardo','string'),(5,'en_US','givenName',0,0,'Stephanie','string'),(5,'en_US','preferredPublicName',0,0,'','string'),(5,'en_US','signature',0,0,'','string'),(5,'fr_CA','affiliation',0,0,'','string'),(5,'fr_CA','biography',0,0,'','string'),(5,'fr_CA','familyName',0,0,'','string'),(5,'fr_CA','givenName',0,0,'','string'),(5,'fr_CA','preferredPublicName',0,0,'','string'),(5,'fr_CA','signature',0,0,'','string'),(6,'','orcid',0,0,'','string'),(6,'en_US','affiliation',0,0,'Kyoto University','string'),(6,'en_US','biography',0,0,'','string'),(6,'en_US','familyName',0,0,'Inoue','string'),(6,'en_US','givenName',0,0,'Minoti','string'),(6,'en_US','preferredPublicName',0,0,'','string'),(6,'en_US','signature',0,0,'','string'),(6,'fr_CA','affiliation',0,0,'','string'),(6,'fr_CA','biography',0,0,'','string'),(6,'fr_CA','familyName',0,0,'','string'),(6,'fr_CA','givenName',0,0,'','string'),(6,'fr_CA','preferredPublicName',0,0,'','string'),(6,'fr_CA','signature',0,0,'','string'),(7,'','orcid',0,0,'','string'),(7,'en_US','affiliation',0,0,'Utrecht University','string'),(7,'en_US','biography',0,0,'','string'),(7,'en_US','familyName',0,0,'Janssen','string'),(7,'en_US','givenName',0,0,'Julie','string'),(7,'en_US','preferredPublicName',0,0,'','string'),(7,'en_US','signature',0,0,'','string'),(7,'fr_CA','affiliation',0,0,'','string'),(7,'fr_CA','biography',0,0,'','string'),(7,'fr_CA','familyName',0,0,'','string'),(7,'fr_CA','givenName',0,0,'','string'),(7,'fr_CA','preferredPublicName',0,0,'','string'),(7,'fr_CA','signature',0,0,'','string'),(8,'','orcid',0,0,'','string'),(8,'en_US','affiliation',0,0,'McGill University','string'),(8,'en_US','biography',0,0,'','string'),(8,'en_US','familyName',0,0,'Hudson','string'),(8,'en_US','givenName',0,0,'Paul','string'),(8,'en_US','preferredPublicName',0,0,'','string'),(8,'en_US','signature',0,0,'','string'),(8,'fr_CA','affiliation',0,0,'','string'),(8,'fr_CA','biography',0,0,'','string'),(8,'fr_CA','familyName',0,0,'','string'),(8,'fr_CA','givenName',0,0,'','string'),(8,'fr_CA','preferredPublicName',0,0,'','string'),(8,'fr_CA','signature',0,0,'','string'),(9,'','orcid',0,0,'','string'),(9,'en_US','affiliation',0,0,'University of Manitoba','string'),(9,'en_US','biography',0,0,'','string'),(9,'en_US','familyName',0,0,'McCrae','string'),(9,'en_US','givenName',0,0,'Aisla','string'),(9,'en_US','preferredPublicName',0,0,'','string'),(9,'en_US','signature',0,0,'','string'),(9,'fr_CA','affiliation',0,0,'','string'),(9,'fr_CA','biography',0,0,'','string'),(9,'fr_CA','familyName',0,0,'','string'),(9,'fr_CA','givenName',0,0,'','string'),(9,'fr_CA','preferredPublicName',0,0,'','string'),(9,'fr_CA','signature',0,0,'','string'),(10,'','orcid',0,0,'','string'),(10,'en_US','affiliation',0,0,'State University of New York','string'),(10,'en_US','biography',0,0,'','string'),(10,'en_US','familyName',0,0,'Gallego','string'),(10,'en_US','givenName',0,0,'Adela','string'),(10,'en_US','preferredPublicName',0,0,'','string'),(10,'en_US','signature',0,0,'','string'),(10,'fr_CA','affiliation',0,0,'','string'),(10,'fr_CA','biography',0,0,'','string'),(10,'fr_CA','familyName',0,0,'','string'),(10,'fr_CA','givenName',0,0,'','string'),(10,'fr_CA','preferredPublicName',0,0,'','string'),(10,'fr_CA','signature',0,0,'','string'),(11,'','orcid',0,0,'','string'),(11,'en_US','affiliation',0,0,'KNUST','string'),(11,'en_US','biography',0,0,'','string'),(11,'en_US','familyName',0,0,'Zacharia','string'),(11,'en_US','givenName',0,0,'Al','string'),(11,'en_US','preferredPublicName',0,0,'','string'),(11,'en_US','signature',0,0,'','string'),(11,'fr_CA','affiliation',0,0,'','string'),(11,'fr_CA','biography',0,0,'','string'),(11,'fr_CA','familyName',0,0,'','string'),(11,'fr_CA','givenName',0,0,'','string'),(11,'fr_CA','preferredPublicName',0,0,'','string'),(11,'fr_CA','signature',0,0,'','string'),(12,'','orcid',0,0,'','string'),(12,'en_US','affiliation',0,0,'Madrid','string'),(12,'en_US','biography',0,0,'','string'),(12,'en_US','familyName',0,0,'Favio','string'),(12,'en_US','givenName',0,0,'Gonzalo','string'),(12,'en_US','preferredPublicName',0,0,'','string'),(12,'en_US','signature',0,0,'','string'),(12,'fr_CA','affiliation',0,0,'','string'),(12,'fr_CA','biography',0,0,'','string'),(12,'fr_CA','familyName',0,0,'','string'),(12,'fr_CA','givenName',0,0,'','string'),(12,'fr_CA','preferredPublicName',0,0,'','string'),(12,'fr_CA','signature',0,0,'','string'),(13,'','orcid',0,0,'','string'),(13,'en_US','affiliation',0,0,'Ghent University','string'),(13,'en_US','biography',0,0,'','string'),(13,'en_US','familyName',0,0,'Fritz','string'),(13,'en_US','givenName',0,0,'Maria','string'),(13,'en_US','preferredPublicName',0,0,'','string'),(13,'en_US','signature',0,0,'','string'),(13,'fr_CA','affiliation',0,0,'','string'),(13,'fr_CA','biography',0,0,'','string'),(13,'fr_CA','familyName',0,0,'','string'),(13,'fr_CA','givenName',0,0,'','string'),(13,'fr_CA','preferredPublicName',0,0,'','string'),(13,'fr_CA','signature',0,0,'','string'),(14,'','orcid',0,0,'','string'),(14,'en_US','affiliation',0,0,'Universidad de Chile','string'),(14,'en_US','biography',0,0,'','string'),(14,'en_US','familyName',0,0,'Vogt','string'),(14,'en_US','givenName',0,0,'Sarah','string'),(14,'en_US','preferredPublicName',0,0,'','string'),(14,'en_US','signature',0,0,'','string'),(14,'fr_CA','affiliation',0,0,'','string'),(14,'fr_CA','biography',0,0,'','string'),(14,'fr_CA','familyName',0,0,'','string'),(14,'fr_CA','givenName',0,0,'','string'),(14,'fr_CA','preferredPublicName',0,0,'','string'),(14,'fr_CA','signature',0,0,'','string'),(15,'','orcid',0,0,'','string'),(15,'en_US','affiliation',0,0,'Duke University','string'),(15,'en_US','biography',0,0,'','string'),(15,'en_US','familyName',0,0,'Cox','string'),(15,'en_US','givenName',0,0,'Graham','string'),(15,'en_US','preferredPublicName',0,0,'','string'),(15,'en_US','signature',0,0,'','string'),(15,'fr_CA','affiliation',0,0,'','string'),(15,'fr_CA','biography',0,0,'','string'),(15,'fr_CA','familyName',0,0,'','string'),(15,'fr_CA','givenName',0,0,'','string'),(15,'fr_CA','preferredPublicName',0,0,'','string'),(15,'fr_CA','signature',0,0,'','string'),(16,'','orcid',0,0,'','string'),(16,'en_US','affiliation',0,0,'University of Cape Town','string'),(16,'en_US','biography',0,0,'','string'),(16,'en_US','familyName',0,0,'Hellier','string'),(16,'en_US','givenName',0,0,'Stephen','string'),(16,'en_US','preferredPublicName',0,0,'','string'),(16,'en_US','signature',0,0,'','string'),(16,'fr_CA','affiliation',0,0,'','string'),(16,'fr_CA','biography',0,0,'','string'),(16,'fr_CA','familyName',0,0,'','string'),(16,'fr_CA','givenName',0,0,'','string'),(16,'fr_CA','preferredPublicName',0,0,'','string'),(16,'fr_CA','signature',0,0,'','string'),(17,'','orcid',0,0,'','string'),(17,'en_US','affiliation',0,0,'Imperial College London','string'),(17,'en_US','biography',0,0,'','string'),(17,'en_US','familyName',0,0,'Turner','string'),(17,'en_US','givenName',0,0,'Catherine','string'),(17,'en_US','preferredPublicName',0,0,'','string'),(17,'en_US','signature',0,0,'','string'),(17,'fr_CA','affiliation',0,0,'','string'),(17,'fr_CA','biography',0,0,'','string'),(17,'fr_CA','familyName',0,0,'','string'),(17,'fr_CA','givenName',0,0,'','string'),(17,'fr_CA','preferredPublicName',0,0,'','string'),(17,'fr_CA','signature',0,0,'','string'),(18,'','orcid',0,0,'','string'),(18,'en_US','affiliation',0,0,'National University of Singapore','string'),(18,'en_US','biography',0,0,'','string'),(18,'en_US','familyName',0,0,'Kumar','string'),(18,'en_US','givenName',0,0,'Sabine','string'),(18,'en_US','preferredPublicName',0,0,'','string'),(18,'en_US','signature',0,0,'','string'),(18,'fr_CA','affiliation',0,0,'','string'),(18,'fr_CA','biography',0,0,'','string'),(18,'fr_CA','familyName',0,0,'','string'),(18,'fr_CA','givenName',0,0,'','string'),(18,'fr_CA','preferredPublicName',0,0,'','string'),(18,'fr_CA','signature',0,0,'','string'),(19,'en_US','affiliation',0,0,'University of Calgary','string'),(19,'en_US','familyName',0,0,'Clark','string'),(19,'en_US','givenName',0,0,'Arthur','string'),(20,'en_US','affiliation',0,0,'Athabasca University','string'),(20,'en_US','familyName',0,0,'Finkel','string'),(20,'en_US','givenName',0,0,'Alvin','string'),(21,'en_US','affiliation',0,0,'Athabasca University','string'),(21,'en_US','familyName',0,0,'Barnetson','string'),(21,'en_US','givenName',0,0,'Bob','string'),(22,'en_US','affiliation',0,0,'University of British Columbia','string'),(22,'en_US','familyName',0,0,'Beaty','string'),(22,'en_US','givenName',0,0,'Bart','string'),(23,'en_US','affiliation',0,0,'University of Southern California','string'),(23,'en_US','familyName',0,0,'Allan','string'),(23,'en_US','givenName',0,0,'Chantal','string'),(24,'en_US','affiliation',0,0,'SUNY','string'),(24,'en_US','familyName',0,0,'Bernnard','string'),(24,'en_US','givenName',0,0,'Deborah','string'),(25,'en_US','affiliation',0,0,'Athabasca University','string'),(25,'en_US','familyName',0,0,'Kennepohl','string'),(25,'en_US','givenName',0,0,'Dietmar','string'),(26,'en_US','affiliation',0,0,'University of Sussex','string'),(26,'en_US','familyName',0,0,'Perini','string'),(26,'en_US','givenName',0,0,'Fernando','string'),(27,'en_US','affiliation',0,0,'Buffalo National Park Foundation','string'),(27,'en_US','familyName',0,0,'Brower','string'),(27,'en_US','givenName',0,0,'Jennifer','string'),(28,'en_US','affiliation',0,0,'University of Alberta','string'),(28,'en_US','familyName',0,0,'Locke Hart','string'),(28,'en_US','givenName',0,0,'Jonathan','string'),(29,'en_US','affiliation',0,0,'International Development Research Centre','string'),(29,'en_US','familyName',0,0,'Elder','string'),(29,'en_US','givenName',0,0,'Laurent','string'),(30,'en_US','affiliation',0,0,'Athabasca University','string'),(30,'en_US','familyName',0,0,'Ally','string'),(30,'en_US','givenName',0,0,'Mohamed','string'),(31,'en_US','affiliation',0,0,'University of Alberta','string'),(31,'en_US','familyName',0,0,'Dawson','string'),(31,'en_US','givenName',0,0,'Michael','string'),(32,'en_US','affiliation',0,0,'University of Calgary','string'),(32,'en_US','familyName',0,0,'Foran','string'),(32,'en_US','givenName',0,0,'Max','string'),(33,'en_US','affiliation',0,0,'London School of Economics','string'),(33,'en_US','familyName',0,0,'Power','string'),(33,'en_US','givenName',0,0,'Michael','string'),(34,'en_US','affiliation',0,0,'International Development Research Centre','string'),(34,'en_US','familyName',0,0,'Smith','string'),(34,'en_US','givenName',0,0,'Matthew','string');
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_groups`
--

DROP TABLE IF EXISTS `user_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_groups` (
  `user_group_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  UNIQUE KEY `user_user_groups_pkey` (`user_group_id`,`user_id`),
  KEY `user_user_groups_user_group_id` (`user_group_id`),
  KEY `user_user_groups_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `locales` varchar(255) DEFAULT NULL,
  `gossip` text,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime NOT NULL,
  `must_change_password` smallint DEFAULT NULL,
  `auth_id` bigint DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` smallint NOT NULL DEFAULT '0',
  `disabled_reason` text,
  `inline_help` smallint DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_username` (`username`),
  UNIQUE KEY `users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2y$10$RKcrrjqONgDimugquWH1/ujWN0s.60R.t.OOLOsKQdY8tr8ZapWY6','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2026-01-02 05:15:53',NULL,'2026-01-02 05:18:45',0,NULL,NULL,0,NULL,1),(2,'rvaca','$2y$10$BoTCtTqcFbfXMRHsYoIr5ui4TaV.HIYzGrjY2eCBg25GKq13eUOCG','rvaca@mailinator.com','','','',NULL,'MX','',NULL,NULL,'2026-01-02 05:16:40',NULL,'2026-01-02 05:18:41',0,NULL,NULL,0,NULL,1),(3,'dbarnes','$2y$10$SuR2g3Diz0iVFjeeCMXolO6ygpCzI/vnGz.iytO1vRDqk/eKLgvh.','dbarnes@mailinator.com','','','',NULL,'AU','',NULL,NULL,'2026-01-02 05:16:45',NULL,'2026-01-02 05:35:21',0,NULL,NULL,0,NULL,1),(4,'dbuskins','$2y$10$Ev8JORZQGh5PJf0LwUB4peMTMwW/wVn8.L2/9wm6ZEiyChH65.bE6','dbuskins@mailinator.com','','','',NULL,'US','',NULL,NULL,'2026-01-02 05:16:50',NULL,'2026-01-02 05:16:50',0,NULL,NULL,0,NULL,1),(5,'sberardo','$2y$10$fflgo9uqGjc9OgKeZ7PX.OD5mrSsijP1dnCOLVcTl/3je024VmbPC','sberardo@mailinator.com','','','',NULL,'CA','',NULL,NULL,'2026-01-02 05:16:56',NULL,'2026-01-02 05:16:56',0,NULL,NULL,0,NULL,1),(6,'minoue','$2y$10$Oa3jGojDwaoRYJW1yCrs/.NCNcmkFY8NLLXEzKJKnqfwAbsxg3LFq','minoue@mailinator.com','','','',NULL,'JP','',NULL,NULL,'2026-01-02 05:17:02',NULL,'2026-01-02 05:24:20',0,NULL,NULL,0,NULL,1),(7,'jjanssen','$2y$10$1951yTQxw1prr5qTQgvyje4T.hoK5mZfzAWEa3MYwN9PjrdyX4O/a','jjanssen@mailinator.com','','','',NULL,'NL','',NULL,NULL,'2026-01-02 05:17:08',NULL,'2026-01-02 05:17:08',0,NULL,NULL,0,NULL,1),(8,'phudson','$2y$10$I4X/fO.82SXNpbRXo5VRDOA/yv2ofKpgqbXbdGbdTSnkjAEkVrYOm','phudson@mailinator.com','','','',NULL,'CA','',NULL,NULL,'2026-01-02 05:17:14',NULL,'2026-01-02 05:29:32',0,NULL,NULL,0,NULL,1),(9,'amccrae','$2y$10$UQkTSph0qwB6MHh8h9C52OBgyapZaH9URweLEYB8r5GdYJUv1NEuu','amccrae@mailinator.com','','','',NULL,'CA','',NULL,NULL,'2026-01-02 05:17:20',NULL,'2026-01-02 05:17:20',0,NULL,NULL,0,NULL,1),(10,'agallego','$2y$10$abVMgcZdqXmgYp8XXgCKeu2R6ZKXd0qyn3xU9VFRdDqQzak4IE55G','agallego@mailinator.com','','','',NULL,'US','',NULL,NULL,'2026-01-02 05:17:27',NULL,'2026-01-02 05:34:07',0,NULL,NULL,0,NULL,1),(11,'alzacharia','$2y$10$fTZ5v1KGHqZwrUa94vAmdefxzunGIl4ChF4nNNj.JonGci9UGducS','alzacharia@mailinator.com','','','',NULL,'GH','',NULL,NULL,'2026-01-02 05:17:35',NULL,'2026-01-02 05:17:35',0,NULL,NULL,0,NULL,1),(12,'gfavio','$2y$10$SDGn2O.tPBochkhiqHUfAOqyF8r6b7XcEJctWcgPjpFZtXoc2z/FG','gfavio@mailinator.com','','','',NULL,'ES','',NULL,NULL,'2026-01-02 05:17:42',NULL,'2026-01-02 05:30:48',0,NULL,NULL,0,NULL,1),(13,'mfritz','$2y$10$T.lPY0.VS5eBl9FVqwvDluH4NiIPc6iLWFb3fO9UZdJX/QVqwdrOq','mfritz@mailinator.com','','','',NULL,'BE','',NULL,NULL,'2026-01-02 05:17:50',NULL,'2026-01-02 05:17:50',0,NULL,NULL,0,NULL,1),(14,'svogt','$2y$10$XKKIczQnDcT4cnNA62jfmeGZVqm66Wg5b/D7hMTTZJhLuoIn1qFbm','svogt@mailinator.com','','','',NULL,'CL','',NULL,NULL,'2026-01-02 05:17:58',NULL,'2026-01-02 05:17:58',0,NULL,NULL,0,NULL,1),(15,'gcox','$2y$10$QAvozGKl/DmVXWPMJv8J1OWVi3WsJvO.LgFY09wN.9EmAbIS4IuAq','gcox@mailinator.com','','','',NULL,'US','',NULL,NULL,'2026-01-02 05:18:06',NULL,'2026-01-02 05:18:06',0,NULL,NULL,0,NULL,1),(16,'shellier','$2y$10$YnU44zNaTDCGYcxa4Wnv3OG0DaRtJBi3NPhC17HPqqhdcQO68M.OW','shellier@mailinator.com','','','',NULL,'ZA','',NULL,NULL,'2026-01-02 05:18:15',NULL,'2026-01-02 05:18:15',0,NULL,NULL,0,NULL,1),(17,'cturner','$2y$10$/rRTZoWzjdydWNDHL6cZ8.PAYS056LnhSE9GlAmIIdddXoxQCLY9a','cturner@mailinator.com','','','',NULL,'GB','',NULL,NULL,'2026-01-02 05:18:25',NULL,'2026-01-02 05:18:25',0,NULL,NULL,0,NULL,1),(18,'skumar','$2y$10$FbSxPHZmJorJKgC7XqZ3PuA2Ks7oiG8CD5FMismeOXePz1FTZvvlu','skumar@mailinator.com','','','',NULL,'SG','',NULL,NULL,'2026-01-02 05:18:34',NULL,'2026-01-02 05:18:34',0,NULL,NULL,0,NULL,1),(19,'aclark','$2y$10$uFOMUgjQAlPUtJ/r0flV/unougmvNhuyZq.uWSNDFbQoJmsXXTMSe','aclark@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2026-01-02 05:19:01',NULL,'2026-01-02 05:19:01',0,NULL,NULL,0,NULL,1),(20,'afinkel','$2y$10$yCfNCbx3GBcxmNlIHX6mkOgFb3rMpdWcLYw.yY9tH0LdjGYR7T7IC','afinkel@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2026-01-02 05:19:33',NULL,'2026-01-02 05:19:34',0,NULL,NULL,0,NULL,1),(21,'bbarnetson','$2y$10$zOHdRnWLapij3ZOLv6.Kj.EMPyi5P8IuQleQ4U8/i1WfVDxmlIfZK','bbarnetson@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2026-01-02 05:20:40',NULL,'2026-01-02 05:20:40',0,NULL,NULL,0,NULL,1),(22,'bbeaty','$2y$10$pESyLMlrkwC10Bzy7k1K1OiMbaHnecNCwOE6c5QpAixpMdoJqNp86','bbeaty@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2026-01-02 05:21:06',NULL,'2026-01-02 05:21:06',0,NULL,NULL,0,NULL,1),(23,'callan','$2y$10$TzBYQeGoK68kqyqT01pBYO2XOJS8F6ISCsN5pWKV8j.SrKFtVPvt6','callan@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2026-01-02 05:22:18',NULL,'2026-01-02 05:22:19',0,NULL,NULL,0,NULL,1),(24,'dbernnard','$2y$10$lJmRZwQCKZZwnZIDIEEmSu11WUZR8FtxX4bbkWp4dKA.oXVGDeYzy','dbernnard@mailinator.com',NULL,NULL,NULL,NULL,'US','',NULL,NULL,'2026-01-02 05:23:31',NULL,'2026-01-02 05:23:32',0,NULL,NULL,0,NULL,1),(25,'dkennepohl','$2y$10$0fuPxKVwX8is/NKUaQmYcu3t2oaHp/MH/kw/yFr0BGUcgp7WSWQrq','dkennepohl@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2026-01-02 05:24:34',NULL,'2026-01-02 05:24:34',0,NULL,NULL,0,NULL,1),(26,'fperini','$2y$10$MPgCikH6XpH.tqcHFZOt4OQ0d1RZxmsB1pXuhMrZ53vCctihP.VN6','fperini@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2026-01-02 05:25:51',NULL,'2026-01-02 05:25:51',0,NULL,NULL,0,NULL,1),(27,'jbrower','$2y$10$cbxNTbmOzNlqH9s59GWdO.Ov2HbbelQqjLJOkYMyeV54x8oWo.vGm','jbrower@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2026-01-02 05:26:49',NULL,'2026-01-02 05:26:49',0,NULL,NULL,0,NULL,1),(28,'jlockehart','$2y$10$4jYoLQKH9Y1d2vf7v9c0EuDL80GMOt2wovNjKhfC55.x1ZUt342ly','jlockehart@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2026-01-02 05:27:31',NULL,'2026-01-02 05:27:31',0,NULL,NULL,0,NULL,1),(29,'lelder','$2y$10$jmnkNwbcu.EusX0UAo7fm.4n0J1yol8.0J3djJb1kqoeuxGF05pQK','lelder@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2026-01-02 05:28:28',NULL,'2026-01-02 05:28:28',0,NULL,NULL,0,NULL,1),(30,'mally','$2y$10$BCgzfSvShe3J5xwsClwvfOgu0bWB9doQGHmxA7oQ54g0/16SSH.am','mally@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2026-01-02 05:29:42',NULL,'2026-01-02 05:29:42',0,NULL,NULL,0,NULL,1),(31,'mdawson','$2y$10$eqRvP/b/Pk6IlSH/DyAnvurbbarynzef1TrsZOMR.TKqu6rhHlyU6','mdawson@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2026-01-02 05:31:09',NULL,'2026-01-02 05:31:09',0,NULL,NULL,0,NULL,1),(32,'mforan','$2y$10$9lv3dfy28aS1DPP3SaBLaONEFw4ScygB6dwL4B4cOqKSZMi252BqG','mforan@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2026-01-02 05:33:00',NULL,'2026-01-02 05:33:00',0,NULL,NULL,0,NULL,1),(33,'mpower','$2y$10$KSqZsAcYRL/NirbuBA9rZ.WQCp.eK5zsACv0kUfaQNLcChF5H8WcO','mpower@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2026-01-02 05:33:25',NULL,'2026-01-02 05:33:25',0,NULL,NULL,0,NULL,1),(34,'msmith','$2y$10$XoJeA/axXHSxhTuBwP5y0Oo.Ia5Niu1vhauVoxnCYLpIgQuyxrmLe','msmith@mailinator.com',NULL,NULL,NULL,NULL,'CA','',NULL,NULL,'2026-01-02 05:34:16',NULL,'2026-01-02 05:34:16',0,NULL,NULL,0,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `versions` (
  `major` int NOT NULL DEFAULT '0' COMMENT 'Major component of version number, e.g. the 2 in OJS 2.3.8-0',
  `minor` int NOT NULL DEFAULT '0' COMMENT 'Minor component of version number, e.g. the 3 in OJS 2.3.8-0',
  `revision` int NOT NULL DEFAULT '0' COMMENT 'Revision component of version number, e.g. the 8 in OJS 2.3.8-0',
  `build` int NOT NULL DEFAULT '0' COMMENT 'Build component of version number, e.g. the 0 in OJS 2.3.8-0',
  `date_installed` datetime NOT NULL,
  `current` smallint NOT NULL DEFAULT '0' COMMENT '1 iff the version entry being described is currently active. This permits the table to store past installation history for forensic purposes.',
  `product_type` varchar(30) DEFAULT NULL COMMENT 'Describes the type of product this row describes, e.g. "plugins.generic" (for a generic plugin) or "core" for the application itelf',
  `product` varchar(30) DEFAULT NULL COMMENT 'Uniquely identifies the product this version row describes, e.g. "ojs2" for OJS 2.x, "languageToggle" for the language toggle block plugin, etc.',
  `product_class_name` varchar(80) DEFAULT NULL COMMENT 'Specifies the class name associated with this product, for plugins, or the empty string where not applicable.',
  `lazy_load` smallint NOT NULL DEFAULT '0' COMMENT '1 iff the row describes a lazy-load plugin; 0 otherwise',
  `sitewide` smallint NOT NULL DEFAULT '0' COMMENT '1 iff the row describes a site-wide plugin; 0 otherwise',
  UNIQUE KEY `versions_pkey` (`product_type`,`product`,`major`,`minor`,`revision`,`build`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,0,0,0,'2026-01-02 05:15:53',1,'plugins.metadata','dc11','',0,0),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.pubIds','urn','URNPubIdPlugin',0,0),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.pubIds','doi','DOIPubIdPlugin',0,0),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.blocks','makeSubmission','MakeSubmissionBlockPlugin',1,0),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.blocks','information','InformationBlockPlugin',1,0),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.generic','htmlMonographFile','HtmlMonographFilePlugin',1,0),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.generic','dublinCoreMeta','DublinCoreMetaPlugin',1,0),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.generic','acron','',0,1),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.generic','usageStats','UsageStatsPlugin',0,1),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,2,0,0,'2026-01-02 05:15:53',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.generic','usageEvent','',0,1),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(1,2,0,0,'2026-01-02 05:15:53',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.themes','default','DefaultThemePlugin',1,0),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.importexport','onix30','',0,0),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.importexport','csv','',0,0),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.importexport','native','',0,0),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.importexport','users','',0,0),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.paymethod','manual','',0,0),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.paymethod','paypal','',0,0),(2,0,0,0,'2026-01-02 05:15:53',1,'plugins.reports','reviewReport','',0,0),(1,0,0,0,'2026-01-02 05:15:53',1,'plugins.reports','monographReport','',0,0),(3,3,0,22,'2026-01-02 05:15:50',1,'core','omp','',0,1);
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

-- Dump completed on 2026-01-02  5:35:41
